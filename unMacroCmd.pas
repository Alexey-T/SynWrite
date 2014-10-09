//Based on original EControl code
//(c) EControl
unit unMacroCmd;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls,
  TntForms, TntStdCtrls, TntComCtrls,
  DKLang;

type
  TfmMacroCmd = class(TTntForm)
    Label1: TTntLabel;
    List: TTntListView;
    Label2: TTntLabel;
    DataEdit: TTntEdit;
    bOk: TTntButton;
    bCancel: TTntButton;
    DKLanguageController1: TDKLanguageController;
    procedure FormCreate(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
  private
    procedure DoList;
  public
    { Public declarations }
  end;

function DoEditMacroCommand(var Cmd: integer; var Data: Widestring): Boolean;

implementation

{$R *.dfm}

uses
  unCmds,
  ecKeyMap, ecCmdConst;

function DoEditMacroCommand(var Cmd: integer; var Data: Widestring): Boolean;
var
  i: integer;
begin
  with TfmMacroCmd.Create(nil) do
    try
      DataEdit.Text := Data;
      for i := 0 to List.Items.Count - 1 do
        if integer(List.Items[i].Data) = cmd then
          begin
            List.Items[i].Selected := True;
            List.Items[i].MakeVisible(False);
            Break;
          end;
      Result := ShowModal = mrOK;
      if Result then
        begin
          Cmd := integer(List.Selected.Data);
          Data := DataEdit.Text;
        end;
    finally
      Free;
    end;
end;

procedure TfmMacroCmd.DoList;
var
  i: integer;
begin
  List.Items.BeginUpdate;
  try
    with DefaultKeyMapping do
    for i := 0 to Items.Count - 1 do
      with List.Items.Add do
        begin
          Caption := IntToStr(Items[i].Command);
          SubItems.Text := Items[i].DisplayName;
          Data := TObject(Items[i].Command);
        end;
  finally
    List.Items.EndUpdate;
  end;
end;

procedure TfmMacroCmd.FormCreate(Sender: TObject);
begin
  DoList;
end;

procedure TfmMacroCmd.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  S: Widestring;
  k: integer;
begin
  if ModalResult = mrOk then
    begin
      if List.Selected = nil then
        raise Exception.Create('Command is not selected');
      case integer(List.Selected.Data) of
        smDropMarker,
        smGotoXY:
          try
            S := DataEdit.Text;
            if (S = '') and (integer(List.Selected.Data) = smDropMarker) then
              Exit;
            k := Pos(';', S);
            if k = 0 then Abort;
            StrToInt(Copy(S, 1, k - 1));
            StrToInt(Copy(S, k + 1,  Length(S) - k));
          except
            raise Exception.Create('Invalid data format. Must be:'#13#10'0;0');
          end;
        smChar:
          if Length(DataEdit.Text) <> 1 then
            raise Exception.Create('Data must be of one character');
        smString,
        smMacroPlay:
          begin end;
        sm_FindCommand:
          begin end;
        else
          begin
            if DataEdit.Text <> '' then
              raise Exception.Create('This command does not support data');
          end;
      end;
    end;
end;

procedure TfmMacroCmd.FormShow(Sender: TObject);
begin
  with List do
    if ItemIndex<0 then
      ItemIndex:= 0;
end;

end.
