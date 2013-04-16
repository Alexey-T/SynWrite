unit unSort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, TntForms, Spin, DKLang;

type
  TfmSort = class(TTntForm)
    bOk: TTntButton;
    bCan: TTntButton;
    boxGeneral: TTntGroupBox;
    cbAsc: TTntRadioButton;
    cbDesc: TTntRadioButton;
    cbCase: TTntCheckBox;
    cbRemDups: TTntCheckBox;
    boxColumn: TTntGroupBox;
    cbCol1: TTntCheckBox;
    cbCol2: TTntCheckBox;
    edCol1: TSpinEdit;
    edCol2: TSpinEdit;
    boxType: TTntGroupBox;
    cbNumeric: TTntRadioButton;
    DKLanguageController1: TDKLanguageController;
    cbAscii: TTntRadioButton;
    cbUnicodeRaw: TTntRadioButton;
    cbUnicode: TTntRadioButton;
    procedure cbCol1Click(Sender: TObject);
    procedure cbCol2Click(Sender: TObject);
    procedure edCol1Change(Sender: TObject);
    procedure edCol1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCol2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfmSort.cbCol1Click(Sender: TObject);
begin
  edCol1.Enabled:= cbCol1.Checked;
end;

procedure TfmSort.cbCol2Click(Sender: TObject);
begin
  edCol2.Enabled:= cbCol2.Checked;
end;

procedure TfmSort.edCol1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=vk_escape then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
  if Key=vk_return then
  begin
    bOk.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmSort.edCol1Change(Sender: TObject);
begin
  if edCol2.Value < edCol1.Value then
    edCol2.Value:= edCol1.Value;
end;

procedure TfmSort.edCol2Change(Sender: TObject);
begin
  if edCol2.Value < edCol1.Value then
    edCol1.Value:= edCol2.Value;
end;

end.
