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
    grFonts: TTntGroupBox;
    bFontHead: TTntButton;
    bFontFoot: TTntButton;
    bFontNums: TTntButton;
    Dlg: TFontDialog;
    SyntAnalyzer1: TSyntAnalyzer;
    AutoCompletePopup1: TAutoCompletePopup;
    labOri: TTntLabel;
    labColor: TTntLabel;
    cbOrient: TTntComboBox;
    cbColors: TTntComboBox;
    grMargins: TTntGroupBox;
    labUnits: TTntLabel;
    cbUnits: TTntComboBox;
    labMLeft: TTntLabel;
    EditLeft: TEdit;
    EditTop: TEdit;
    labMRight: TTntLabel;
    EditRight: TEdit;
    labMBottom: TTntLabel;
    EditBottom: TEdit;
    labMTop: TTntLabel;
    cbNums: TTntComboBox;
    labNums: TTntLabel;
    CheckRangeHL: TTntCheckBox;
    CheckTransparent: TTntCheckBox;
    CheckLineHL: TTntCheckBox;
    CheckStaples: TTntCheckBox;
    CheckHideCollapsed: TTntCheckBox;
    CheckWordWrap: TTntCheckBox;
    CheckSel: TTntCheckBox;
    edFoot: TSyntaxMemo;
    labHint: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    labHint2: TTntLabel;
    procedure FormShow(Sender: TObject);
    procedure cbUnitsChange(Sender: TObject);
    procedure bFontNumsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edHeadEnter(Sender: TObject);
    procedure AutoCompletePopup1CheckChar(Sender: TObject; C: Word;
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
    MarginLeft := StrToFloat(EditLeft.Text);
    MarginRight := StrToFloat(EditRight.Text);
    MarginTop := StrToFloat(EditTop.Text);
    MarginBottom := StrToFloat(EditBottom.Text);

    Orientation := TPrinterOrientation(cbOrient.ItemIndex);
    ColorMode := TPrintColorMode(cbColors.ItemIndex);

    FontHeader := bFontHead.Font;
    FontFooter := bFontFoot.Font;
    FontLineNumders := bFontNums.Font;

    Header := edHead.Lines.Text;
    Footer := edFoot.Lines.Text;

    opt := [];
    if CheckWordWrap.Checked then Include(opt, mpWordWrap);
    if CheckHideCollapsed.Checked then Include(opt, mpHideCollapsed);
    if CheckLineHL.Checked then Include(opt, mpLineHighlight);
    if CheckRangeHL.Checked then Include(opt, mpBlockHighlight);
    if CheckStaples.Checked then Include(opt, mpBlockStaples);
    if not CheckTransparent.Checked then Include(opt, mpBackColor);
    Options := opt;

    LineNumbersPos := TLineNumbersPos(cbNums.ItemIndex);
    PrintSelection := CheckSel.Checked;
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
    EditLeft.Text := FormatFloat('0.###', MarginLeft);
    EditRight.Text := FormatFloat('0.###', MarginRight);
    EditTop.Text := FormatFloat('0.###', MarginTop);
    EditBottom.Text := FormatFloat('0.###', MarginBottom);

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
      AutoCompletePopup1.Items.Add('#' + Fields[i] + '#');
      AutoCompletePopup1.DisplayItems.Add(Fields[i]);
    end;

    CheckWordWrap.Checked := mpWordWrap in Options;
    CheckHideCollapsed.Checked := mpHideCollapsed in Options;
    CheckLineHL.Checked := mpLineHighlight in Options;
    CheckRangeHL.Checked := mpBlockHighlight in Options;
    CheckTransparent.Checked := not (mpBackColor in Options);
    CheckStaples.Checked := mpBlockStaples in Options;
    CheckSel.Checked := PrintSelection;
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
    GetValue(EditLeft);
    GetValue(EditRight);
    GetValue(EditTop);
    GetValue(EditBottom);
    Result := True;
  except
    MessageBoxW(Handle, 'Invalid value', PWideChar(Widestring(Caption)), MB_OK or MB_ICONHAND);
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
   Convert(EditLeft);
   Convert(EditRight);
   Convert(EditTop);
   Convert(EditBottom);
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
  AutoCompletePopup1.SyntMemo := TSyntaxMemo(Sender);
end;

procedure TfmPrintSetup.AutoCompletePopup1CheckChar(Sender: TObject;
  C: Word; var IsWord: Boolean);
begin
  IsWord := IsWordChar(ecChar(C)) or (ecChar(C) = '#');
end;

end.

