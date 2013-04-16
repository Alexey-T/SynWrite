{$I ecSyntEdit.INC}

unit unMacroEdit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ActnList, ecSyntMemo, ecMacroRec, ComCtrls, DKLang,
  ecHotKeyEdit,
  TntStdCtrls, TntComCtrls, TntForms,
  Spin;

type
  TfmMacroEdit = class(TTntForm)
    boxList: TTntGroupBox;
    MacrosList: TTntListBox;
    boxCmd: TTntGroupBox;
    ButtonOk: TTntButton;
    ButtonCan: TTntButton;
    ButtonMRen: TTntButton;
    ButtonMDel: TTntButton;
    ButtonCCh: TTntButton;
    ButtonCDel: TTntButton;
    ButtonCAdd: TTntButton;
    ButtonCClr: TTntButton;
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
    ButtonMAdd: TTntButton;
    MacrosAdd: TAction;
    DKLanguageController1: TDKLanguageController;
    boxKey: TTntGroupBox;
    ecHotKey1: TecHotKey;
    ButtonShClr: TTntButton;
    ButtonShSet: TTntButton;
    boxPlay: TTntGroupBox;
    ButtonMPlay: TTntButton;
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
    procedure ButtonShClrClick(Sender: TObject);
    procedure ButtonShSetClick(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure edTimesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FPlayIdx: integer;
    FCanPlay: Boolean;
    FSh: TList;
    procedure SetMacroRecorder(const Value: TecMacroRecorder);
    function NameN(n: integer): string;
  protected
    procedure FillMacrosList;
    procedure FillCommands;
    procedure FillCmdItem(li: TListItem; MacroCmd: TMacroEvent);
  public
    property MacroRecorder: TecMacroRecorder read Recorder write SetMacroRecorder;
    property PlayIdx: integer read FPlayIdx;
  end;

type
  TShArray = array[1..30] of TShortcut;

function EditMacro(AMacros: TecMacroRecorder;
  var ASh: TShArray; var APlayIdx: integer): Boolean;

implementation

uses {$IFDEF EC_DOTNET}Types,{$ENDIF}
  ecKeyMap, ecMacroCmdEditDlg, ecStrUtils,
  Menus,
  TntDialogs;

{$R *.dfm}

function EditMacro(
  AMacros: TecMacroRecorder;
  var ASh: TShArray;
  var APlayIdx: integer): Boolean;
var
  i: Integer;
begin
  Result:= False;
  APlayIdx:= -1;
  if AMacros <> nil then
  with TfmMacroEdit.Create(nil) do
    try
      FSh.Clear;
      for i:= Low(ASh) to High(ASh) do
        FSh.Add(Pointer(ASh[i]));

      MacroRecorder:= AMacros;
      FCanPlay:= true;
      if ShowModal = mrOK then
      begin
        for i:= Low(ASh) to High(ASh) do
          if (i-1 < FSh.Count) then
            ASh[i]:= Integer(FSh[i-1])
          else
            ASh[i]:= 0;

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
  FSh:= TList.Create;
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

function TfmMacroEdit.NameN(n: integer): string;
begin
  Result:= Recorder[n].Name;
  if Result = '' then
    Result:= DKLangConstW('macUn');
  if (n >= 0) and (n < FSh.Count) then
    if FSh[n] <> nil then
      Result:= Result + '  ['+ShortcutToText(Integer(FSh[n]))+']';
end;

procedure TfmMacroEdit.FillMacrosList;
var i: integer;
begin
  MacrosList.Items.Clear;
  for i:= 0 to Recorder.Count - 1 do
    MacrosList.Items.Add(NameN(i));
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
var i: integer;
  en: boolean;
begin
  i:= MacrosList.ItemIndex;
  en:= (i>=0) and (i<High(TShArray));
  if en and (i<FSh.Count) then
    ecHotKey1.HotKey:= Integer(FSh[i])
  else
    ecHotKey1.HotKey:= 0;

  ecHotKey1.Enabled:= en;
  ButtonShSet.Enabled:= en;
  ButtonShClr.Enabled:= en;

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
var S: Widestring;
begin
  S:= Recorder[MacrosList.ItemIndex].Name;
  if WideInputQuery(DKLangConstW('macName'), DKLangConstW('macName2'), S) then//AT
    begin
      Recorder[MacrosList.ItemIndex].Name:= S;
      MacrosList.Items[MacrosList.ItemIndex]:= NameN(MacrosList.ItemIndex);
    end;
end;

procedure TfmMacroEdit.MacrosDeleteExecute(Sender: TObject);
var idx: integer;
begin
  idx:= MacrosList.ItemIndex;
  Recorder.DeleteMacro(idx);
  MacrosList.Items.Delete(idx);
  FSh.Delete(idx);

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
begin
  if EditMacroCommand(cmd, data) then
   begin
    Recorder[MacrosList.ItemIndex].Add(cmd, data);
    FillCommands;
    if CmdList.Items.Count > 0 then
      CmdList.Items[CmdList.Items.Count - 1].Selected:= True;
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
      FSh.Move(CurIdx, Idx);
    end;
end;

procedure TfmMacroEdit.MacrosAddExecute(Sender: TObject);
begin
  Recorder.AddMacro(TMacroRecord.Create);
  FSh.Add(nil);
  FillMacrosList;
  MacrosList.ItemIndex:= MacrosList.Items.Count - 1;
  MacrosListClick(Self);
end;

procedure TfmMacroEdit.ButtonShClrClick(Sender: TObject);
begin
  ecHotKey1.HotKey:= 0;
  ButtonShSetClick(Self);
end;

procedure TfmMacroEdit.ButtonShSetClick(Sender: TObject);
var
  i: integer;
begin
  i:= MacrosList.ItemIndex;
  if i < 0 then Exit;
  while FSh.Count-1 < i do
    FSh.Add(nil);
  FSh[i]:= Pointer(ecHotKey1.HotKey);
  MacrosList.Items[i]:= NameN(i);
end;

procedure TfmMacroEdit.TntFormDestroy(Sender: TObject);
begin
  FreeAndNil(FSh);
end;

procedure TfmMacroEdit.edTimesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_RETURN then
  begin
    ButtonMPlay.Click;
    Key:= 0;
    Exit
  end;
end;

end.
