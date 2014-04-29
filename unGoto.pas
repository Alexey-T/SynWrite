unit unGoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DKLang,
  TntForms, TntStdCtrls, ExtCtrls;

type
  TfmGoto = class(TTntForm)
    ButtonOk: TTntButton;
    ButtonCan: TTntButton;
    DKLanguageController1: TDKLanguageController;
    cbExtSel: TTntCheckBox;
    PanelPos: TPanel;
    Label1: TTntLabel;
    Label2: TTntLabel;
    labBookmk: TTntLabel;
    edLine: TComboBox;
    edCol: TComboBox;
    PanelBookmk: TPanel;
    cbNum: TTntRadioButton;
    cbPrev: TTntRadioButton;
    cbNext: TTntRadioButton;
    edNum: TTntComboBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
    procedure labBookmkClick(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
  public
    FMaxLine: integer;
    FBookSet: array[0..9] of boolean;
  end;

implementation

uses
  unProc;

{$R *.dfm}

var
  LineList,
  ColList: TStringList;

procedure TfmGoto.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var n: integer;
begin
  if ModalResult = mrOK then
    if PanelPos.Visible then
    begin
      if (edLine.Text<>'') and (char(edLine.Text[1]) in ['+', '-']) then
        CanClose:= true
      else
      begin
        n:= StrToIntDef(edLine.Text, -1);
        CanClose:= (n>=1) and (n<=FMaxLine);
        if not CanClose then
          MsgError(WideFormat(DKLangConstW('MLn'), [FMaxLine]), Handle);
      end;    
    end
    else
    if cbNum.Checked then
    begin
      CanClose:= FBookSet[edNum.ItemIndex];
      if not CanClose then
        MsgError(WideFormat(DKLangConstW('MErBk'), [edNum.ItemIndex]), Handle);
    end;
end;

procedure TfmGoto.FormShow(Sender: TObject);
var
  i: integer;
begin
  edLine.Items.Clear;
  if LineList<>nil then
    for i:= 0 to LineList.Count-1 do
      edLine.Items.Add(LineList[i]);

  edCol.Items.Clear;
  if ColList<>nil then
    for i:= 0 to ColList.Count-1 do
      edCol.Items.Add(ColList[i]);

  if PanelPos.Visible then
    if edLine.CanFocus then
      edLine.SetFocus;
end;

procedure TfmGoto.edNumChange(Sender: TObject);
begin
  cbNum.Checked:= true;
end;

procedure TfmGoto.ButtonOkClick(Sender: TObject);
var
  n: Integer;
begin
  n:= LineList.IndexOf(edLine.Text);
  if n>=0 then LineList.Delete(n);
  LineList.Insert(0, edLine.Text);

  n:= ColList.IndexOf(edCol.Text);
  if n>=0 then ColList.Delete(n);
  ColList.Insert(0, edCol.Text);
end;

procedure TfmGoto.labBookmkClick(Sender: TObject);
begin
  PanelPos.Visible:= false;
  PanelBookmk.Visible:= true;
  if cbPrev.CanFocus then
    cbPrev.SetFocus;
end;

procedure TfmGoto.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=Ord('G')) and (Shift=[ssCtrl]) then
  begin
    if labBookmk.Enabled then
      labBookmkClick(Self);
    Key:= 0;
  end;
end;

initialization
  LineList:= TStringList.Create;
  ColList:= TStringList.Create;

finalization
  FreeAndNil(LineList);
  FreeAndNil(ColList);

end.
