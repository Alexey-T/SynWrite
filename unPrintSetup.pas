{
Based on EControl PageSetup form
Copyright (c) EControl
}
unit unPrintSetup;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Printers,
  ecSyntMemo, ecSyntAnal, ecPopupCtrl, ecPrint,
  TntForms, TntStdCtrls, DKLang;

type
  TfmPrintSetup = class(TTntForm)
    grOpt: TTntGroupBox;
    bOk: TTntButton;
    bCancel: TTntButton;
    grHead: TTntGroupBox;
    edHead: TSyntaxMemo;
    edFoot: TSyntaxMemo;
    grFonts: TTntGroupBox;
    bFontHead: TTntButton;
    bFontFoot: TTntButton;
    bFontNums: TTntButton;
    Dlg: TFontDialog;
    SyntAnalyzer1: TSyntAnalyzer;
    AcpPopup: TAutoCompletePopup;
    labOrient: TTntLabel;
    labColor: TTntLabel;
    cbOrient: TTntComboBox;
    cbColors: TTntComboBox;
    grMargins: TTntGroupBox;
    labUnits: TTntLabel;
    cbUnits: TTntComboBox;
    edLeft: TEdit;
    edTop: TEdit;
    edRight: TEdit;
    edBottom: TEdit;
    cbNums: TTntComboBox;
    labNums: TTntLabel;
    opHiRanges: TTntCheckBox;
    opTransp: TTntCheckBox;
    opHiLines: TTntCheckBox;
    opStaples: TTntCheckBox;
    opHideCollapsed: TTntCheckBox;
    opWordWrap: TTntCheckBox;
    opSelOnly: TTntCheckBox;
    labHint: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    labHint2: TTntLabel;
    procedure FormShow(Sender: TObject);
    procedure cbUnitsChange(Sender: TObject);
    procedure bFontNumsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edHeadEnter(Sender: TObject);
    procedure AcpPopupCheckChar(Sender: TObject; C: Word;
      var IsWord: Boolean);
  private
    FUnits: TPrintUnits;
    function CheckMargins: Boolean;
  public
    procedure SetParams(APrinter: TecSyntPrinter);
    procedure GetParams(APrinter: TecSyntPrinter);
  end;

function DoConfigPrinterPage(APrinter: TecSyntPrinter): boolean;

implementation

uses
  ecStrUtils;

{$R *.dfm}

function DoConfigPrinterPage(APrinter: TecSyntPrinter): boolean;
begin
  with TfmPrintSetup.Create(nil) do
  try
    SetParams(APrinter);
    Result:= ShowModal=mrOk;
    if Result then
      GetParams(APrinter);
  finally
    Free
  end;
end;

{ TfmPrintSetup }

procedure TfmPrintSetup.GetParams(APrinter: TecSyntPrinter);
var
  opt: TSyntMemoPrintOptions;
begin
  with APrinter do
  begin
    Units := FUnits;
    MarginLeft := StrToFloat(edLeft.Text);
    MarginRight := StrToFloat(edRight.Text);
    MarginTop := StrToFloat(edTop.Text);
    MarginBottom := StrToFloat(edBottom.Text);

    Orientation := TPrinterOrientation(cbOrient.ItemIndex);
    ColorMode := TPrintColorMode(cbColors.ItemIndex);

    FontHeader := bFontHead.Font;
    FontFooter := bFontFoot.Font;
    FontLineNumders := bFontNums.Font;

    Header := edHead.Lines.Text;
    Footer := edFoot.Lines.Text;

    opt := [];
    if opWordWrap.Checked then Include(opt, mpWordWrap);
    if opHideCollapsed.Checked then Include(opt, mpHideCollapsed);
    if opHiLines.Checked then Include(opt, mpLineHighlight);
    if opHiRanges.Checked then Include(opt, mpBlockHighlight);
    if opStaples.Checked then Include(opt, mpBlockStaples);
    if not opTransp.Checked then Include(opt, mpBackColor);
    Options := opt;

    LineNumbersPos := TLineNumbersPos(cbNums.ItemIndex);
    PrintSelection := opSelOnly.Checked;
  end;
end;

procedure TfmPrintSetup.SetParams(APrinter: TecSyntPrinter);
var
  i: integer;
begin
  with APrinter do
  begin
    FUnits := Units;
    cbUnits.ItemIndex := integer(Units);
    edLeft.Text := FormatFloat('0.###', MarginLeft);
    edRight.Text := FormatFloat('0.###', MarginRight);
    edTop.Text := FormatFloat('0.###', MarginTop);
    edBottom.Text := FormatFloat('0.###', MarginBottom);

    cbOrient.ItemIndex := integer(Orientation);
    cbColors.ItemIndex := integer(ColorMode);
    cbNums.ItemIndex := integer(LineNumbersPos);

    bFontHead.Font := FontHeader;
    bFontFoot.Font := FontFooter;
    bFontNums.Font := FontLineNumders;

    edHead.Lines.Text := Header;
    edHead.Font := FontHeader;
    edFoot.Lines.Text := Footer;
    edFoot.Font := FontFooter;

    for i := 0 to Fields.Count - 1 do
    begin
      AcpPopup.Items.Add('#' + Fields[i] + '#');
      AcpPopup.DisplayItems.Add(Fields[i]);
    end;

    opWordWrap.Checked := mpWordWrap in Options;
    opHideCollapsed.Checked := mpHideCollapsed in Options;
    opHiLines.Checked := mpLineHighlight in Options;
    opHiRanges.Checked := mpBlockHighlight in Options;
    opTransp.Checked := not (mpBackColor in Options);
    opStaples.Checked := mpBlockStaples in Options;
    opSelOnly.Checked := PrintSelection;
  end;
end;

procedure TfmPrintSetup.FormShow(Sender: TObject);
begin
  edHead.TopLine:= 0;
  edFoot.TopLine:= 0;
end;

procedure TfmPrintSetup.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  if ModalResult = mrOK then
    CanClose := CheckMargins;
end;

function TfmPrintSetup.CheckMargins: Boolean;
var
  cur: TEdit;
  //
  function GetValue(Edit: TEdit): double;
  begin
    cur := Edit;
    Result := StrToFloat(Edit.Text);
  end;
  //
begin
  try
    GetValue(edLeft);
    GetValue(edRight);
    GetValue(edTop);
    GetValue(edBottom);
    Result := True;
  except
    MessageBoxW(Handle,
      PWChar(DKLangConstW('zMInvalidNumber')),
      PWideChar(Widestring(Caption)),
      mb_ok or mb_iconerror);
    if cur.CanFocus then
      cur.SetFocus;
    Result := False;
  end;
end;

procedure TfmPrintSetup.cbUnitsChange(Sender: TObject);
var
  NewUnits: TPrintUnits;
  //
  procedure Convert(Edit: TEdit);
  var v: double;
  begin
    v := StrToFloat(Edit.Text);
    // to Inch
    case FUnits of
      puCM: v := v / 2.54;
      puMM: v := v / 25.4;
      puThousandthsOfInches: v := v / 1000;
    end;
    // to NewUnits
    case NewUnits of
      puCM: v := v * 2.54;
      puMM: v := v * 25.4;
      puThousandthsOfInches: v := v * 1000;
    end;
    Edit.Text := FormatFloat('0.###', v);
  end;
begin
 if CheckMargins then
 begin
   NewUnits := TPrintUnits(cbUnits.ItemIndex);
   Convert(edLeft);
   Convert(edRight);
   Convert(edTop);
   Convert(edBottom);
   FUnits := NewUnits;
 end
 else
   cbUnits.ItemIndex := integer(FUnits);
end;

procedure TfmPrintSetup.bFontNumsClick(Sender: TObject);
begin
  Dlg.Font := TButton(Sender).Font;
  if Dlg.Execute then
  begin
    TButton(Sender).Font := Dlg.Font;
    if Sender = bFontHead then
      edHead.Font := Dlg.Font;
    if Sender = bFontFoot then
      edFoot.Font := Dlg.Font;
  end;
end;

procedure TfmPrintSetup.edHeadEnter(Sender: TObject);
begin
  AcpPopup.SyntMemo := TSyntaxMemo(Sender);
end;

procedure TfmPrintSetup.AcpPopupCheckChar(Sender: TObject;
  C: Word; var IsWord: Boolean);
begin
  IsWord := IsWordChar(ecChar(C)) or (ecChar(C) = '#');
end;

end.

