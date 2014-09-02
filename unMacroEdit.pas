{$I ecSyntEdit.INC}

unit unMacroEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ecSyntMemo, ecMacroRec, ComCtrls, DKLang,
  ecHotKeyEdit, ecKeyMap,
  TntStdCtrls, TntComCtrls, TntForms,
  Spin;

type
  TfmMacroEdit = class(TTntForm)
    boxList: TTntGroupBox;
    MacrosList: TTntListBox;
    boxCmd: TTntGroupBox;
    btnOk: TTntButton;
    btnCancel: TTntButton;
    btnMacroRen: TTntButton;
    btnMacroDel: TTntButton;
    btnCmdChange: TTntButton;
    btnCmdDel: TTntButton;
    btnCmdAdd: TTntButton;
    btnCmdClear: TTntButton;
    ActionList1: TActionList;
    MacrosPlay: TAction;
    MacrosRename: TAction;
    MacrosDelete: TAction;
    Recorder: TecMacroRecorder;
    CommandChange: TAction;
    CommandInsert: TAction;
    CommandDelete: TAction;
    CommandClear: TAction;
    CmdList: TTntListView;
    btnMacroAdd: TTntButton;
    MacrosAdd: TAction;
    DKLanguageController1: TDKLanguageController;
    boxKey: TTntGroupBox;
    ecHotkey: TecHotKey;
    btnKeyClear: TTntButton;
    btnKeyAdd: TTntButton;
    boxPlay: TTntGroupBox;
    btnPlay: TTntButton;
    edTimes: TSpinEdit;
    bPlayTimes: TTntRadioButton;
    bPlayEof: TTntRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure MacrosUpdate(Sender: TObject);
    procedure MacrosPlayUpdate(Sender: TObject);
    procedure MacrosPlayExecute(Sender: TObject);
    procedure MacrosRenameExecute(Sender: TObject);
    procedure MacrosDeleteExecute(Sender: TObject);
    procedure CommandChangeUpdate(Sender: TObject);
    procedure CommandDeleteUpdate(Sender: TObject);
    procedure CommandDeleteExecute(Sender: TObject);
    procedure CommandClearUpdate(Sender: TObject);
    procedure CommandClearExecute(Sender: TObject);
    procedure MacrosListClick(Sender: TObject);
    procedure CommandChangeExecute(Sender: TObject);
    procedure MacrosListDblClick(Sender: TObject);
    procedure CmdListDblClick(Sender: TObject);
    procedure CommandInsertExecute(Sender: TObject);
    procedure CmdListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure CmdListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MacrosListDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure MacrosListDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure MacrosAddExecute(Sender: TObject);
    procedure btnKeyClearClick(Sender: TObject);
    procedure btnKeyAddClick(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure edTimesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPlayIdx: integer;
    FCanPlay: Boolean;
    FKeys: TList;
    procedure SetMacroRecorder(const Value: TecMacroRecorder);
    function NameStr(n: integer): string;
    procedure DoAddKey(AKey: TShortcut);
  protected
    procedure FillMacrosList;
    procedure FillCommands;
    procedure FillCmdItem(li: TListItem; MacroCmd: TMacroEvent);
  public
    property MacroRecorder: TecMacroRecorder read Recorder write SetMacroRecorder;
    property PlayIdx: integer read FPlayIdx;
  end;

type
  TMacroKeysArray = array[1..30] of TKeyStroke;

function DoMacroEditDialog(AMacros: TecMacroRecorder;
  var AKeys: TMacroKeysArray;
  var APlayIdx: integer): Boolean;

implementation

uses
  ecMacroCmdEditDlg,
  ecStrUtils,
  unProc,
  Menus,
  TntDialogs;

{$R *.dfm}

function DoMacroEditDialog(
  AMacros: TecMacroRecorder;
  var AKeys: TMacroKeysArray;
  var APlayIdx: integer): Boolean;
var
  i: Integer;
begin
  Result:= False;
  APlayIdx:= -1;
  if AMacros <> nil then
  with TfmMacroEdit.Create(nil) do
    try
      FKeys.Clear;
      for i:= Low(AKeys) to High(AKeys) do
        FKeys.Add(AKeys[i]);

      MacroRecorder:= AMacros;
      FCanPlay:= true;
      if ShowModal = mrOK then
      begin
        for i:= Low(AKeys) to High(AKeys) do
          if (i-1 < FKeys.Count) then
            AKeys[i]:= FKeys[i-1]
          else
            AKeys[i]:= nil;

        AMacros.Assign(MacroRecorder);
        APlayIdx:= PlayIdx;

        if PlayIdx >= 0 then
        begin
          if bPlayTimes.Checked then
          begin
            for i:= 1 to edTimes.Value do
              AMacros.Play(PlayIdx);
          end
          else
          if bPlayEof.Checked then
          begin
            AMacros.AtFileEnd:= false;
            i:= 0;
            repeat
              AMacros.Play(PlayIdx);
              Inc(i);
              if i > 1*1000*1000 then
              begin
                Application.MessageBox('Macro seems to be looped forever. Stopped.', 'SynWrite', mb_ok or mb_iconwarning);
                Break
              end;
            until AMacros.AtFileEnd;  
          end;
        end;

        Result:= True;
      end;
    finally
      Free;
    end;
end;

procedure TfmMacroEdit.FormCreate(Sender: TObject);
begin
  FPlayIdx:= -1;
  FKeys:= TList.Create;
end;

procedure TfmMacroEdit.SetMacroRecorder(const Value: TecMacroRecorder);
begin
  if Value <> nil then
    begin
      Recorder.Assign(Value);
      FCanPlay:= Value.SyntMemo <> nil;
      FillMacrosList;
    end;
end;

function TfmMacroEdit.NameStr(n: integer): string;
var
  Str: string;
begin
  Result:= Recorder[n].Name;
  if Result = '' then
    Result:= DKLangConstW('unnamed');
  if (n >= 0) and (n < FKeys.Count) then
    if FKeys[n]<>nil then
    begin
      Str:= TKeyStroke(FKeys[n]).AsString;
      if Str<>'' then
        Result:= Result + '  ['+Str+']';
    end;    
end;

procedure TfmMacroEdit.FillMacrosList;
var i: integer;
begin
  MacrosList.Items.Clear;
  for i:= 0 to Recorder.Count - 1 do
    MacrosList.Items.Add(NameStr(i));
  if MacrosList.Items.Count > 0 then
  begin
    MacrosList.ItemIndex:= 0;
    MacrosListClick(Self);
  end;
  FillCommands;
end;

procedure TfmMacroEdit.FillCmdItem(li: TListItem; MacroCmd: TMacroEvent);
var cmd: TecCommandItem;
begin
  li.Caption:= IntToStr(MacroCmd.Command);
  li.SubItems.Clear;
  li.SubItems.Add(MacroCmd.Data);
  cmd:= DefaultKeyMapping.CommandByID(MacroCmd.Command);
  if cmd <> nil then
    li.SubItems.Add(cmd.DisplayName);
end;

procedure TfmMacroEdit.FillCommands;
var
  i: integer;
  en: boolean;
begin
  i:= MacrosList.ItemIndex;
  en:= (i>=0) and (i<High(TMacroKeysArray));

  ecHotkey.HotKey:= 0;
  ecHotkey.Enabled:= en;
  btnKeyClear.Enabled:= en;
  btnKeyAdd.Enabled:= en;

  CmdList.Items.BeginUpdate;
  try
    CmdList.Items.Clear;
    if MacrosList.ItemIndex <> -1 then
     with Recorder[MacrosList.ItemIndex] do
      for i:= 0 to Count - 1 do
       FillCmdItem(CmdList.Items.Add, Events[i]);
  finally
    CmdList.Items.EndUpdate;
  end;
end;

procedure TfmMacroEdit.MacrosListClick(Sender: TObject);
begin
  FillCommands;
end;

procedure TfmMacroEdit.MacrosUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= MacrosList.ItemIndex <> -1;
end;

procedure TfmMacroEdit.MacrosPlayUpdate(Sender: TObject);
begin
  MacrosPlay.Enabled:= (MacrosList.ItemIndex <> -1) and FCanPlay;
end;

procedure TfmMacroEdit.MacrosPlayExecute(Sender: TObject);
begin
  FPlayIdx:= MacrosList.ItemIndex;
  ModalResult:= mrOk;
end;

procedure TfmMacroEdit.MacrosRenameExecute(Sender: TObject);
var
  S: Widestring;
begin
  S:= Recorder[MacrosList.ItemIndex].Name;
  if DoInputString(DKLangConstW('zMMacroName'), S) then
  begin
    Recorder[MacrosList.ItemIndex].Name:= S;
    MacrosList.Items[MacrosList.ItemIndex]:= NameStr(MacrosList.ItemIndex);
  end;
end;

procedure TfmMacroEdit.MacrosDeleteExecute(Sender: TObject);
var
  idx: integer;
begin
  idx:= MacrosList.ItemIndex;
  Recorder.DeleteMacro(idx);
  MacrosList.Items.Delete(idx);
  FKeys.Delete(idx);

  if not ((idx >= 0) and (idx < MacrosList.Items.Count)) then
    idx:= MacrosList.Items.Count-1;
  MacrosList.ItemIndex:= idx;
  MacrosListClick(Self);
  FillCommands;
end;

procedure TfmMacroEdit.CommandDeleteUpdate(Sender: TObject);
begin
  CommandDelete.Enabled:= CmdList.SelCount >= 1;
end;

procedure TfmMacroEdit.CommandDeleteExecute(Sender: TObject);
var i: integer;
begin
  for i:= CmdList.Items.Count - 1 downto 0 do
    if CmdList.Items[i].Selected then
      begin
        Recorder[MacrosList.ItemIndex].Delete(i);
        CmdList.Items.Delete(i);
      end;
end;

procedure TfmMacroEdit.CommandClearUpdate(Sender: TObject);
begin
  CommandClear.Enabled:= CmdList.Items.Count > 0;
end;

procedure TfmMacroEdit.CommandClearExecute(Sender: TObject);
var i: integer;
begin
  with Recorder[MacrosList.ItemIndex] do
    for i:= Count - 1 downto 0 do
      Delete(i);
  FillCommands;
end;

procedure TfmMacroEdit.CommandChangeUpdate(Sender: TObject);
begin
  CommandChange.Enabled:= CmdList.SelCount = 1;
end;

procedure TfmMacroEdit.CommandChangeExecute(Sender: TObject);
var cmd: TMacroEvent;
begin
  cmd:= Recorder[MacrosList.ItemIndex][CmdList.Selected.Index];
  with cmd do
    if EditMacroCommand(Command, Data) then
      FillCmdItem(CmdList.Selected, cmd);
end;

procedure TfmMacroEdit.MacrosListDblClick(Sender: TObject);
begin
  if MacrosRename.Enabled then
    MacrosRename.Execute;
end;

procedure TfmMacroEdit.CmdListDblClick(Sender: TObject);
begin
  if CommandChange.Enabled then
    CommandChange.Execute;
end;

procedure TfmMacroEdit.CommandInsertExecute(Sender: TObject);
var cmd: integer;
    data: ecString;
    Rec: TMacroRecord;
    Index: Integer;
begin
  if EditMacroCommand(cmd, data) then
  begin
    Rec:= Recorder[MacrosList.ItemIndex];
    Rec.Add(cmd, data);
    Index:= Rec.Count-1;

    //insert item instead of add to end
    if CmdList.Selected<>nil then
    begin
      Rec.Move(Index, CmdList.Selected.Index);
      Index:= CmdList.Selected.Index;
    end;

    FillCommands;
    if CmdList.Items.Count > 0 then
    begin
      CmdList.Items[Index].Selected:= True;
      CmdList.Selected.MakeVisible(false);
    end;
   end;
end;

procedure TfmMacroEdit.CmdListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var li: TListItem;
begin
  if Source = CmdList then
    begin
      li:= CmdList.GetItemAt(X, Y);
      Accept:= (li <> nil) and (CmdList.SelCount = 1) and
                (CmdList.Selected <> li);
    end else
      Accept:= False;
end;

procedure TfmMacroEdit.CmdListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var li: TListItem;
    i: integer;
begin
  li:= CmdList.GetItemAt(X, Y);
  if (li = nil) or (CmdList.Selected = nil) then Exit;
  if Source = CmdList then
    begin
      Recorder[MacrosList.ItemIndex].Move(CmdList.Selected.Index, li.Index);
      i:= li.Index;
      FillCommands;
      if i < CmdList.Items.Count then
        CmdList.Items[i].Selected:= True;
    end;
end;

procedure TfmMacroEdit.MacrosListDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var Idx: integer;
begin
  if Source = MacrosList then
    begin
      Idx:= MacrosList.ItemAtPos(Point(X, Y), True);
      Accept:= (Idx <> -1) and (MacrosList.ItemIndex <> -1) and
                (Idx <> MacrosList.ItemIndex);
    end else
      Accept:= False;
end;

procedure TfmMacroEdit.MacrosListDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var Idx, CurIdx: integer;
begin
  if Source = MacrosList then
    begin
      CurIdx:= MacrosList.ItemIndex;
      Idx:= MacrosList.ItemAtPos(Point(X, Y), True);
      MacrosList.Items.Move(CurIdx, Idx);
      Recorder.MoveMacro(CurIdx, Idx);
      FKeys.Move(CurIdx, Idx);
    end;
end;

procedure TfmMacroEdit.MacrosAddExecute(Sender: TObject);
begin
  Recorder.AddMacro(TMacroRecord.Create);
  FKeys.Add(nil);
  FillMacrosList;
  MacrosList.ItemIndex:= MacrosList.Items.Count - 1;
  MacrosListClick(Self);
end;

procedure TfmMacroEdit.btnKeyClearClick(Sender: TObject);
begin
  DoAddKey(0);
end;

procedure TfmMacroEdit.btnKeyAddClick(Sender: TObject);
begin
  DoAddKey(ecHotkey.HotKey);
end;

procedure TfmMacroEdit.DoAddKey(AKey: TShortcut);
var
  i: integer;
begin
  i:= MacrosList.ItemIndex;
  if i < 0 then Exit;

  while FKeys.Count-1 < i do
    FKeys.Add(nil);

  if FKeys[i]=nil then
    FKeys[i]:= TKeyStroke.Create(nil);

  if AKey<>0 then
    TKeyStroke(FKeys[i]).KeyDefs.Add.ShortCut:= AKey
  else
    TKeyStroke(FKeys[i]).KeyDefs.Clear;

  MacrosList.Items[i]:= NameStr(i);
end;

procedure TfmMacroEdit.TntFormDestroy(Sender: TObject);
begin
  FreeAndNil(FKeys);
end;

procedure TfmMacroEdit.edTimesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
    btnPlay.Click;
    Key:= 0;
    Exit
  end;
end;

end.
