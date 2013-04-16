unit unGoto;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DKLang,
  TntForms, TntStdCtrls, ExtCtrls;

type
  TfmGoto = class(TTntForm)
    Label1: TTntLabel;
    edLine: TComboBox;
    ButtonOk: TTntButton;
    ButtonCan: TTntButton;
    DKLanguageController1: TDKLanguageController;
    edCol: TComboBox;
    Label2: TTntLabel;
    cbExtSel: TTntCheckBox;
    Bevel1: TBevel;
    cbPos: TTntRadioButton;
    cbPrev: TTntRadioButton;
    cbNext: TTntRadioButton;
    cbNum: TTntRadioButton;
    edNum: TTntComboBox;
    Bevel2: TBevel;
    TntLabel1: TTntLabel;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormShow(Sender: TObject);
    procedure cbPosClick(Sender: TObject);
    procedure edNumChange(Sender: TObject);
    procedure ButtonOkClick(Sender: TObject);
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
    if cbPos.Checked then
    begin
      if (edLine.Text<>'') and (char(edLine.Text[1]) in ['+', '-']) then
        CanClose:= true
      else
      begin
        n:= StrToIntDef(edLine.Text, -1);
        CanClose:= (n>=1) and (n<=FMaxLine);
        if not CanClose then
          MsgError(WideFormat(DKLangConstW('MLn'), [FMaxLine]));
      end;    
    end
    else
    if cbNum.Checked then
    begin
      CanClose:= FBookSet[edNum.ItemIndex];
      if not CanClose then
        MsgError(WideFormat(DKLangConstW('MErBk'), [edNum.ItemIndex]));
    end;
end;

procedure TfmGoto.FormShow(Sender: TObject);
var i: integer;
begin
  edLine.Items.Clear;
  if LineList<>nil then
    for i:= 0 to LineList.Count-1 do
      edLine.Items.Add(LineList[i]);

  edCol.Items.Clear;
  if ColList<>nil then
    for i:= 0 to ColList.Count-1 do
      edCol.Items.Add(ColList[i]);

  cbPosClick(Self);  
end;

procedure TfmGoto.cbPosClick(Sender: TObject);
begin
  edLine.Enabled:= cbPos.Checked;
  edCol.Enabled:= edLine.Enabled;
  Label1.Enabled:= edLine.Enabled;
  Label2.Enabled:= edLine.Enabled;
  edNum.Enabled:= cbNum.Checked;
end;

procedure TfmGoto.edNumChange(Sender: TObject);
begin
  cbNum.Checked:= true;
  cbPosClick(Self);
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

initialization
  LineList:= TStringList.Create;
  ColList:= TStringList.Create;

finalization
  FreeAndNil(LineList);
  FreeAndNil(ColList);

end.
