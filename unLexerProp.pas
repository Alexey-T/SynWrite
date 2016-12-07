{
Original:
EControl Syntax Editor SDK                                                 
Copyright (c) 2004 - 2008 EControl Ltd., Zaharov Michael                   

Modified by: Alexey (SynWrite)
- renamed class, set fonts, hidden gutter, passed imagelist for tree
- hidden tab codetamplates
- moves/aligns of controls
- DKLang
Used in open source with permission by M.Zaharov via e-mail.
}
{$I ecSyntEdit.INC}

unit unLexerProp;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ecSyntAnal, ExtCtrls, ecSyntMemo,
  unLexerItems, Buttons, ecsnStyleEdit, ecsnCodeTempl, ImgList, ecPopupCtrl,
  ecSyntGramma, ecStrUtils, ecSyntTree, ecsnRuleStates, DKLang,
  ecExtHighlight,
  TntForms, TntControls, TntStdCtrls, TntExtCtrls, TntComCtrls, TntButtons;

type
  TfmLexerProp = class(TTntForm)
    PageControl1: TTntPageControl;
    TabSheet1: TTntTabSheet;
    TabSheet2: TTntTabSheet;
    TabSheet3: TTntTabSheet;
    Button1: TTntButton;
    Button2: TTntButton;
    SyntaxMemo1: TSyntaxMemo;
    TabSheet5: TTntTabSheet;
    Label21: TTntLabel;
    ComboBox17: TComboBox;
    Label22: TTntLabel;
    SyntColFrame1: TfmLexerItems;
    SyntColFrame2: TfmLexerItems;
    SyntColFrame3: TfmLexerItems;
    Label29: TTntLabel;
    ComboBox21: TComboBox;
    PageControl2: TTntPageControl;
    TabSheet7: TTntTabSheet;
    Label1: TTntLabel;
    Edit1: TTntEdit;
    Label20: TTntLabel;
    Edit2: TTntEdit;
    Label24: TTntLabel;
    Label25: TTntLabel;
    Label26: TTntLabel;
    ListBox1: TTntListBox;
    CheckBox10: TTntCheckBox;
    ComboBox19: TTntComboBox;
    Label28: TTntLabel;
    ComboBox23: TComboBox;
    OD: TOpenDialog;
    SD: TSaveDialog;
    Label33: TTntLabel;
    Edit3: TTntEdit;
    Label34: TTntLabel;
    Edit4: TTntEdit;
    SpeedButton1: TTntSpeedButton;
    SpeedButton2: TTntSpeedButton;
    Label35: TTntLabel;
    ComboBox24: TComboBox;
    CheckBox13: TTntCheckBox;
    ComboBox25: TTntComboBox;
    Label36: TTntLabel;
    Label37: TTntLabel;
    ComboBox26: TComboBox;
    SyntaxMemo3: TSyntaxMemo;
    CheckBox7: TTntCheckBox;
    CheckBox8: TTntCheckBox;
    SyntaxMemo4: TSyntaxMemo;
    TabSheet9: TTntTabSheet;
    Label27: TTntLabel;
    ComboBox20: TComboBox;
    CheckBox14: TTntCheckBox;
    CheckBox15: TTntCheckBox;
    GroupBox4: TTntGroupBox;
    Label43: TTntLabel;
    ComboBox28: TTntComboBox;
    CheckBox16: TTntCheckBox;
    FSynt: TSyntAnalyzer;
    ComboBox29: TTntComboBox;
    Label44: TTntLabel;
    CheckBox18: TTntCheckBox;
    CheckBox19: TTntCheckBox;
    CheckBox20: TTntCheckBox;
    Button8: TTntButton;
    Panel_Buttons: TTntPanel;
    Panel_Preview: TTntPanel;
    Splitter1: TSplitter;
    Panel_Common: TTntPanel;
    Panel3: TTntPanel;
    Panel4: TTntPanel;
    GroupBox5: TTntGroupBox;
    Panel5: TTntPanel;
    Panel6: TTntPanel;
    Panel7: TTntPanel;
    TabSheet4: TTntTabSheet;
    TabSheet8: TTntTabSheet;
    SyntColFrame4: TfmLexerItems;
    Splitter2: TSplitter;
    Splitter3: TSplitter;
    Splitter4: TSplitter;
    Panel8: TTntPanel;
    Panel9: TTntPanel;
    Label45: TTntLabel;
    ComboBox30: TComboBox;
    Label46: TTntLabel;
    ComboBox31: TComboBox;
    CheckBox21: TTntCheckBox;
    CheckBox22: TTntCheckBox;
    Label47: TTntLabel;
    Label48: TTntLabel;
    ComboBox32: TComboBox;
    SyntaxMemo6: TSyntaxMemo;
    Splitter5: TSplitter;
    Label49: TTntLabel;
    SyntaxMemo5: TSyntaxMemo;
    CheckBox23: TTntCheckBox;
    CheckBox24: TTntCheckBox;
    CheckBox25: TTntCheckBox;
    CheckBox26: TTntCheckBox;
    CheckBox27: TTntCheckBox;
    SyntaxMemo7: TSyntaxMemo;
    Label4: TTntLabel;
    ComboBox22: TComboBox;
    Label30: TTntLabel;
    CheckBox17: TTntCheckBox;
    SyntStyleFrame1: TSyntStyleFrame;
    Label2: TTntLabel;
    Edit7: TTntEdit;
    ComboBox1: TComboBox;
    Label3: TTntLabel;
    ComboBox2: TComboBox;
    Label5: TTntLabel;
    FontDialog1: TFontDialog;
    SyntaxMemo2: TSyntaxMemo;
    ImageList1: TImageList;
    Label8: TTntLabel;
    Edit8: TTntEdit;
    Label10: TTntLabel;
    TabSheet10: TTntTabSheet;
    SyntaxMemo8: TSyntaxMemo;
    TabSheet11: TTntTabSheet;
    Panel1: TTntPanel;
    TreeView1: TTreeView;
    Panel10: TTntPanel;
    SpeedButton3: TTntButton;
    Splitter6: TSplitter;
    SyntaxMemo9: TSyntaxMemo;
    SyntAnalyzer2: TSyntAnalyzer;
    CheckBox2: TTntCheckBox;
    AutoCompletePopup1: TAutoCompletePopup;
    CheckBox3: TTntCheckBox;
    Label11: TTntLabel;
    Label12: TTntLabel;
    Edit10: TTntEdit;
    Label13: TTntLabel;
    Edit11: TTntEdit;
    TabSheet12: TTntTabSheet;
    Edit5: TTntEdit;
    Label38: TTntLabel;
    Label39: TTntLabel;
    Edit6: TTntEdit;
    Edit9: TTntEdit;
    Label9: TTntLabel;
    CheckBox6: TTntCheckBox;
    CheckBox12: TTntCheckBox;
    CheckBox1: TTntCheckBox;
    CheckBox9: TTntCheckBox;
    ComboBox3: TComboBox;
    Label14: TTntLabel;
    CheckBox11: TTntCheckBox;
    CheckBox4: TTntCheckBox;
    CheckBox5: TTntCheckBox;
    ComboBox4: TComboBox;
    Label15: TTntLabel;
    ComboBox18: TTntComboBox;
    Label23: TTntLabel;
    GroupBox2: TTntGroupBox;
    Label16: TTntLabel;
    ComboBox5: TComboBox;
    Label17: TTntLabel;
    ComboBox6: TComboBox;
    Label18: TTntLabel;
    Label19: TTntLabel;
    Edit12: TTntEdit;
    Edit13: TTntEdit;
    Label6: TTntLabel;
    ComboBox7: TComboBox;
    Label7: TTntLabel;
    Edit14: TTntEdit;
    CheckBox28: TTntCheckBox;
    Label31: TTntLabel;
    ComboBox8: TComboBox;
    CheckBox29: TTntCheckBox;
    GroupBox1: TTntGroupBox;
    CheckBox30: TTntCheckBox;
    Label32: TTntLabel;
    Edit15: TTntEdit;
    Label40: TTntLabel;
    ColorBox1: TColorBox;
    Label41: TTntLabel;
    ComboBox9: TTntComboBox;
    CheckBox31: TTntCheckBox;
    SyntaxMemo10: TSyntaxMemo;
    Label42: TTntLabel;
    ComboBox10: TTntComboBox;
    SyntaxTreeView1: TSyntaxTreeView;
    Splitter7: TSplitter;
    RuleStatesFrame1: TRuleStatesFrame;
    RuleStatesFrame2: TRuleStatesFrame;
    RuleStatesFrame3: TRuleStatesFrame;
    Label50: TTntLabel;
    CharSet_Combo: TComboBox;
    DKLanguageController1: TDKLanguageController;
    HyperlinkHighlighter: THyperlinkHighlighter;
    procedure FormShow(Sender: TObject);
    procedure FormatChanhged(Sender: TObject);
    procedure ComboBox17Change(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure ComboBox21Change(Sender: TObject);
    procedure ComboBox25Changed(Sender: TObject);
    procedure ComboBox18Change(Sender: TObject);
    procedure ComboBox20Change(Sender: TObject);
    procedure ComboBox23Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Memo1Exit(Sender: TObject);
    procedure CheckBox10Click(Sender: TObject);
    procedure ComboBox19Change(Sender: TObject);
    procedure Memo2Exit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CheckBox11Click(Sender: TObject);
    procedure ComboBox24Change(Sender: TObject);
    procedure CheckBox12Click(Sender: TObject);
    procedure CheckBox13Click(Sender: TObject);
    procedure CheckBox14Click(Sender: TObject);
    procedure CheckBox15Click(Sender: TObject);
    procedure Edit2Exit(Sender: TObject);
    procedure ComboBox26Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit6Exit(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure CheckBox9Click(Sender: TObject);
    procedure ComboBox29Change(Sender: TObject);
    procedure ComboBox28Change(Sender: TObject);
    procedure CheckBox16Click(Sender: TObject);
    procedure CheckBox17Click(Sender: TObject);
    procedure CheckBox18Click(Sender: TObject);
    procedure CheckBox19Click(Sender: TObject);
    procedure CheckBox20Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure CheckBox21Click(Sender: TObject);
    procedure CheckBox22Click(Sender: TObject);
    procedure ComboBox32Change(Sender: TObject);
    procedure ComboBox30Change(Sender: TObject);
    procedure ComboBox31Change(Sender: TObject);
    procedure SyntaxMemo5Exit(Sender: TObject);
    procedure SyntaxMemo6Exit(Sender: TObject);
    procedure CheckBox23Click(Sender: TObject);
    procedure CheckBox24Click(Sender: TObject);
    procedure CheckBox25Click(Sender: TObject);
    procedure CheckBox26Click(Sender: TObject);
    procedure CheckBox27Click(Sender: TObject);
    procedure SyntaxMemo7Exit(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure SyntaxMemo2TGutterObjects0CheckLine(Sender: TObject;
      Line: Integer; var Show: Boolean);
    procedure SyntaxMemo2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Edit8Exit(Sender: TObject);
    procedure SyntaxMemo2TGutterObjects0Click(Sender: TObject;
      Line: Integer; Shift: TShiftState);
    procedure Edit9Exit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure AutoCompletePopup1GetAutoCompleteList(Sender: TObject;
      Pos: TPoint; List, Display: TecStrings);
    procedure TreeView1CustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Edit10Exit(Sender: TObject);
    procedure Edit11Exit(Sender: TObject);
    procedure TabSheet11Exit(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure ComboBox4Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox6Change(Sender: TObject);
    procedure Edit12Exit(Sender: TObject);
    procedure Edit13Exit(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure AutoCompletePopup1CheckChar(Sender: TObject; C: Word;
      var IsWord: Boolean);
    procedure CheckBox29Click(Sender: TObject);
    procedure CheckBox30Click(Sender: TObject);
    procedure Edit15Exit(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure CheckBox31Click(Sender: TObject);
    procedure SyntaxMemo10TextChanged(Sender: TObject; Pos, Count,
      LineChange: Integer);
    procedure ComboBox10Change(Sender: TObject);
    procedure CharSet_ComboChange(Sender: TObject);
  private
    FSelfChange: Boolean;
    FEditSynt: TSyntAnalyzer;
    function CurrentTokenRule: TTokenRule;
    function CurrentBlockRule: TTagBlockCondition;
    function CurrentCondition: TSingleTagCondition;
    function CurrentSubLexRule: TSubAnalyzerRule;
    procedure NameOrderStyleChange(Sender: TObject);
    procedure TokenRuleChanged(Sender: TObject);
    procedure BlockRuleChange(Sender: TObject);
    procedure FillTagBlockCombos(Sender: TObject);
    procedure FillRefEndCombo;
    procedure SubLexRuleChange(Sender: TObject);
    procedure SetSubLexMemos;
    procedure FillTagFormats;
    procedure FillConditions(SetToItem: integer = -1);
    procedure UpdateCurCond;
    function GetConditionString(I: integer): string;
    procedure TagCondEnable;
    procedure SetTokenTypeNames;
    procedure ToggleTokeType(TokenType: integer);
    procedure FuillGrammaTree;
    procedure FuillGrammaRules;
    procedure GetCommonProps;
    procedure FillCharSetCombo;
    procedure UpdateCharsets;
  protected
  public
    constructor Create(AOwner: TComponent); override;
    property EditedLexer: TSyntAnalyzer read FEditSynt;
  end;

function DoLexerPropDialog(ALexer: TSyntAnalyzer; AImages: TImageList): Boolean;

var
  OnBackupLexerStyles: procedure(ALexer: TSyntAnalyzer) of object;


implementation

uses
  ecEditsRes;

{$R *.dfm}

function DoLexerPropDialog(ALexer: TSyntAnalyzer; AImages: TImageList): Boolean;
begin
  with TfmLexerProp.Create(nil) do
  try
    FSynt.Assign(ALexer);
    FEditSynt := ALexer;
    SyntaxTreeView1.Images:= AImages;
    Result := ShowModal = mrOk;
    if Result then
    begin
      ALexer.Assign(FSynt);
      OnBackupLexerStyles(ALexer);
    end;
  finally
    Free;
  end;
end;


{ TfmLexerProp }

constructor TfmLexerProp.Create(AOwner: TComponent);
begin
  inherited;
  SyntaxMemo3.SyntaxAnalyzer := SyntaxEditsRes.Lex_RegExpressions;
  SyntaxMemo5.SyntaxAnalyzer := SyntaxEditsRes.Lex_RegExpressions;
  SyntaxMemo6.SyntaxAnalyzer := SyntaxEditsRes.Lex_RegExpressions;
  SyntColFrame1.OnChange := FormatChanhged;
  SyntColFrame1.OnChangeName := NameOrderStyleChange;
  SyntColFrame1.OnChangeOrder := NameOrderStyleChange;
  SyntColFrame2.OnChange := TokenRuleChanged;
  SyntColFrame3.OnChange := BlockRuleChange;
  SyntColFrame3.OnChangeName := FillTagBlockCombos;
  SyntColFrame3.OnChangeOrder := FillTagBlockCombos;
  SyntColFrame4.OnChange := SubLexRuleChange;
  AutoCompletePopup1.OnGetAutoCompleteList := AutoCompletePopup1GetAutoCompleteList;
  Label4.Transparent := False;
  Label22.Transparent := False;
  Label24.Transparent := False;
  Label26.Transparent := False;
  Label47.Transparent := False;
  Label49.Transparent := False;
end;

procedure TfmLexerProp.FormShow(Sender: TObject);
var
  i: integer;
begin
  //AT
  OD.DefaultExt:= 'lcf';
  SD.DefaultExt:= OD.DefaultExt;
  OD.Filter:= '*.lcf|*.lcf';
  SD.Filter:= OD.Filter;

  // Character set support
  FillCharSetCombo;
  UpdateCharsets;
  // for sub lexers
  ComboBox32.Items.Clear;
  Assert(Assigned(FEditSynt.Owner));
  with FEditSynt.Owner do
   for i := 0 to ComponentCount - 1 do
    if Components[i] is TSyntAnalyzer then
     ComboBox32.Items.AddObject((Components[i] as TSyntAnalyzer).LexerName, Components[i]);

  // Set token type names
  SyntaxMemo7.Lines.Text := FSynt.TokenTypeNames.Text;
  SyntaxMemo7.Modified := False;
  SetTokenTypeNames;

  SyntaxMemo1.Lines.Text := FSynt.SampleText.Text;
  Edit3.Text := FSynt.Extentions;
  Edit4.Text := FSynt.LexerName;
  Edit7.Text := IntToStr(FSynt.FullRefreshSize);
  CheckBox17.Checked := FSynt.SkipSpaces;
  CheckBox2.Checked := FSynt.RestartFromLineStart;
  CheckBox3.Checked := FSynt.ParseEndOfLine;
  CheckBox3.Enabled := FSynt.SkipSpaces;
  CheckBox28.Checked := FSynt.AlwaysSyncBlockAnal;
  Edit14.Text := FSynt.LineComment;
  SyntColFrame1.Collection := FSynt.Formats;
  SyntColFrame2.Collection := FSynt.TokenRules;
  SyntColFrame3.Collection := FSynt.BlockRules;
  SyntColFrame4.Collection := FSynt.SubAnalyzers;
  FillTagFormats;
  ////SyntCodeTemplFrame1.Templates := FSynt.CodeTemplates;
  SyntaxMemo8.Lines.Text := FSynt.Notes.Text;
  SyntaxMemo8.Modified := False;
  SyntaxMemo9.Lines.Text := FSynt.Gramma.Gramma;
  SyntaxMemo9.Modified := False;
  FuillGrammaRules;
  FuillGrammaTree;
end;

procedure TfmLexerProp.Button8Click(Sender: TObject);
begin
  GetCommonProps;
  FEditSynt.Assign(FSynt);
end;

procedure TfmLexerProp.SetTokenTypeNames;
begin
  ComboBox17.Items := FSynt.TokenTypeNames;
  ComboBox4.Items := FSynt.TokenTypeNames;
  if ComboBox4.Items.Count > 0 then
   ComboBox4.Items.Insert(0, '-')
  else
   ComboBox4.Items.Insert(0, '-');
  SyntaxMemo2.Lines.Text := FSynt.TokenTypeNames.Text;
end;

procedure TfmLexerProp.SyntaxMemo7Exit(Sender: TObject);
begin
  if SyntaxMemo7.Modified then
   begin
     FSynt.TokenTypeNames.Text := SyntaxMemo7.Lines.Text;
     SyntaxMemo7.Lines.Text := FSynt.TokenTypeNames.Text;
     SyntaxMemo7.Modified := False;
     SetTokenTypeNames;
     BlockRuleChange(nil);
     TokenRuleChanged(nil);
   end;
end;

procedure TfmLexerProp.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caHide;
  if ModalResult = mrOk then
    GetCommonProps;
end;

procedure TfmLexerProp.GetCommonProps;
begin
  FSynt.SampleText.Text := SyntaxMemo1.Lines.Text;
  FSynt.Extentions := Edit3.Text;
  FSynt.LexerName := Edit4.Text;
  FSynt.FullRefreshSize := StrToInt(Edit7.Text);
  if SyntaxMemo8.Modified then
    FSynt.Notes.Text := SyntaxMemo8.Lines.Text;
  if SyntaxMemo9.Modified then
    FSynt.Gramma.Gramma := SyntaxMemo9.Lines.Text;
  FSynt.LineComment := Edit14.Text;
  FSynt.AlwaysSyncBlockAnal := CheckBox28.Checked;
end;

procedure TfmLexerProp.CheckBox17Click(Sender: TObject);
begin
  FSynt.SkipSpaces := CheckBox17.Checked;
  CheckBox3.Enabled := FSynt.SkipSpaces;
end;

procedure TfmLexerProp.CheckBox2Click(Sender: TObject);
begin
  FSynt.RestartFromLineStart := CheckBox2.Checked;
end;

procedure TfmLexerProp.CheckBox3Click(Sender: TObject);
begin
  FSynt.ParseEndOfLine := CheckBox3.Checked;
end;

//=========================================================================
//   Tag formats
//=========================================================================

procedure TfmLexerProp.FormatChanhged(Sender: TObject);
begin
   if SyntColFrame1.LB.ItemIndex >= 0 then
    SyntStyleFrame1.Style := SyntColFrame1.Current as TSyntaxFormat
   else
    SyntStyleFrame1.Style := nil;
end;

procedure TfmLexerProp.NameOrderStyleChange(Sender: TObject);
begin
  FillTagFormats;
end;

procedure TfmLexerProp.FillTagFormats;
var i: integer;
    st: TStringList;
  procedure SetFormatCombo(Combo: TComboBox; Style: TSyntaxFormat);
  begin
    Combo.Items := st;
    Combo.ItemIndex := st.IndexOfObject(Style);
  end;
begin
  st :=  TStringList.Create;
  st.AddObject('-', nil);
  for i := 0 to FSynt.Formats.Count - 1 do
    st.AddObject(FSynt.Formats[i].DisplayName, FSynt.Formats[i]);

  SetFormatCombo(ComboBox22, FSynt.MarkedBlock);
  SetFormatCombo(ComboBox1, FSynt.SearchMatch);
  SetFormatCombo(ComboBox2, FSynt.CurrentLine);
  SetFormatCombo(ComboBox7, FSynt.DefStyle);
  SetFormatCombo(ComboBox8, FSynt.CollapseStyle);

  if SyntColFrame2.LB.ItemIndex >= 0 then
   SetFormatCombo(ComboBox21, CurrentTokenRule.Style)
  else
   ComboBox21.Items := st;

  if SyntColFrame3.LB.ItemIndex >= 0 then
   begin
     SetFormatCombo(ComboBox20, CurrentBlockRule.Style);
     SetFormatCombo(ComboBox5, CurrentBlockRule.TreeItemStyleObj);
     SetFormatCombo(ComboBox6, CurrentBlockRule.TreeGroupStyleObj);
   end
  else
   begin
     ComboBox20.Items := st;
     ComboBox5.Items := st;
     ComboBox6.Items := st;
   end;

  if SyntColFrame4.LB.ItemIndex >= 0 then
   SetFormatCombo(ComboBox30, CurrentSubLexRule.Style)
  else
   ComboBox30.Items := st;

  st.Free;
end;

procedure TfmLexerProp.ComboBox7Change(Sender: TObject);
begin
  if not FSelfChange then
   with Sender as TComboBox do
    case Integer(Tag) of
      0: FSynt.DefStyle := TSyntaxFormat(Items.Objects[ItemIndex]);
      1: FSynt.MarkedBlock := TSyntaxFormat(Items.Objects[ItemIndex]);
      2: FSynt.SearchMatch := TSyntaxFormat(Items.Objects[ItemIndex]);
      3: FSynt.CurrentLine := TSyntaxFormat(Items.Objects[ItemIndex]);
      4: FSynt.CollapseStyle := TSyntaxFormat(Items.Objects[ItemIndex]);
    end;
end;

//=========================================================================
//   Parser
//=========================================================================

procedure TfmLexerProp.TokenRuleChanged(Sender: TObject);
begin
  if SyntColFrame2.LB.ItemIndex >= 0 then
   with CurrentTokenRule do
    begin
      FSelfChange := True;
      if (TokenType >= 0) and (TokenType < ComboBox17.Items.Count) then
        ComboBox17.ItemIndex := TokenType
      else
        ComboBox17.ItemIndex := -1;
      ComboBox21.ItemIndex := ComboBox21.Items.IndexOfObject(Style);
      ComboBox24.ItemIndex := ComboBox24.Items.IndexOfObject(Block);
      CheckBox8.Checked := StrictParent;
      CheckBox18.Checked := NotParent;
      CheckBox27.Checked := AlwaysEnabled;
      SyntaxMemo3.Lines.Text := Expression; // fix v2.02
      SyntaxMemo3.Modified := False;
      if ColumnFrom = 0 then Edit10.Text := ''
        else Edit10.Text := IntToStr(ColumnFrom);
      Edit10.Modified := False;
      if ColumnTo = 0 then Edit11.Text := ''
        else Edit11.Text := IntToStr(ColumnTo);
      Edit11.Modified := False;
      RuleStatesFrame2.Rule := CurrentTokenRule;
      FSelfChange := False;
    end;
end;

procedure TfmLexerProp.ComboBox17Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentTokenRule.TokenType := ComboBox17.ItemIndex;
  FSynt.ClearClientContents;
end;

function TfmLexerProp.CurrentTokenRule: TTokenRule;
begin
  Result := SyntColFrame2.Current as TTokenRule;
end;

procedure TfmLexerProp.ComboBox21Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentTokenRule.Style := TSyntaxFormat(ComboBox21.Items.Objects[ComboBox21.ItemIndex]);
end;

procedure TfmLexerProp.ComboBox24Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentTokenRule.Block := TTagBlockCondition(ComboBox24.Items.Objects[ComboBox24.ItemIndex]);
end;

procedure TfmLexerProp.Memo1Exit(Sender: TObject);
begin
  if not SyntaxMemo3.Modified then Exit;
  CurrentTokenRule.Expression := SyntaxMemo3.Lines.Text;
  FSynt.ClearClientContents;
  SyntaxMemo3.Modified := False;
  SyntColFrame2.LB.Invalidate;
end;

procedure TfmLexerProp.CheckBox8Click(Sender: TObject);
begin
  CurrentTokenRule.StrictParent := CheckBox8.Checked;
end;

procedure TfmLexerProp.CheckBox18Click(Sender: TObject);
begin
  CurrentTokenRule.NotParent := CheckBox18.Checked;
end;

procedure TfmLexerProp.CheckBox27Click(Sender: TObject);
begin
  CurrentTokenRule.AlwaysEnabled := CheckBox27.Checked;
end;

procedure TfmLexerProp.Edit10Exit(Sender: TObject);
begin
  if Edit10.Modified then
   if Edit10.Text <> '' then
    CurrentTokenRule.ColumnFrom := StrToInt(Edit10.Text)
   else
    CurrentTokenRule.ColumnFrom := 0;
end;

procedure TfmLexerProp.Edit11Exit(Sender: TObject);
begin
  if Edit11.Modified then
   if Edit11.Text <> '' then
    CurrentTokenRule.ColumnTo := StrToInt(Edit11.Text)
   else
    CurrentTokenRule.ColumnTo := 0;
end;

//=========================================================================
//   Block Rules
//=========================================================================

function TfmLexerProp.CurrentBlockRule: TTagBlockCondition;
begin
  Result := TTagBlockCondition(SyntColFrame3.Current);
end;

procedure TfmLexerProp.BlockRuleChange(Sender: TObject);
begin
  if SyntColFrame3.LB.ItemIndex >= 0 then
   with CurrentBlockRule do
    begin
      FSelfChange := True;
      ComboBox25.ItemIndex := integer(BlockType);
      CheckBox11.Checked := EndOfTextClose;
      CheckBox12.Checked := NotCollapsed;
      CheckBox13.Checked := SameIdent;
      CheckBox14.Checked := HighLight;
      CheckBox15.Checked := InvertColors;
      CheckBox6.Checked := DisplayInTree;
      CheckBox7.Checked := StrictParent;
      CheckBox9.Checked := RefToCondEnd;
      CheckBox31.Checked := IgnoreAsParent;
      Edit1.Text := IntToStr(IdentIndex);
      Edit2.Text := IntToStr(BlockOffset);
      Edit8.Text := IntToStr(GroupIndex);
      Edit12.Text := IntToStr(TreeItemImage);
      Edit13.Text := IntToStr(TreeGroupImage);
      Edit5.Text := NameFmt;
      Edit6.Text := GroupFmt;
      Edit9.Text := CollapseFmt;
      Edit1.Modified := False;
      Edit2.Modified := False;
      Edit5.Modified := False;
      Edit6.Modified := False;
      Edit8.Modified := False;
      Edit9.Modified := False;
      Edit12.Modified := False;
      Edit13.Modified := False;
      ComboBox18.ItemIndex := Integer(LinePos);
      ComboBox20.ItemIndex := ComboBox20.Items.IndexOfObject(Style);
      ComboBox29.ItemIndex := Integer(DynHighlight);
      ComboBox28.ItemIndex := Integer(HighlightPos);
      CheckBox16.Checked := DynSelectMin;
      CheckBox19.Checked := NotParent;
      CheckBox20.Checked := CancelNextRules;
      CheckBox26.Checked := AlwaysEnabled;
      CheckBox1.Checked := DrawStaple;
      CheckBox4.Checked := SelfClose;
      CheckBox5.Checked := NoEndRule;
      ComboBox3.ItemIndex := ComboBox3.Items.IndexOf(GrammaRuleName);
      ComboBox5.ItemIndex := ComboBox5.Items.IndexOfObject(TreeItemStyleObj);
      ComboBox6.ItemIndex := ComboBox6.Items.IndexOfObject(TreeGroupStyleObj);
      if (TokenType + 1 >= 0) and (TokenType + 1 < ComboBox4.Items.Count) then
        ComboBox4.ItemIndex := TokenType + 1
      else
        ComboBox4.ItemIndex := -1;
      FillConditions(0);
      ListBox1Click(nil);
      FillTagBlockCombos(nil);
      TagCondEnable;
      FillRefEndCombo;

      CheckBox30.Checked := UseCustomPen;
      Edit15.Text := IntToStr(Pen.Width);
      Edit15.Modified := False;
      ColorBox1.Selected := Pen.Color;
      ComboBox9.ItemIndex := integer(Pen.Style);
      SyntaxMemo10.Lines.Text := AutoCloseText;
      ComboBox10.ItemIndex := integer(AutoCloseMode);
      RuleStatesFrame3.Rule := CurrentBlockRule;
      FSelfChange := False;
    end;
end;

procedure TfmLexerProp.FillConditions(SetToItem: integer);
var i: integer;
begin
  if SetToItem = -1 then
    SetToItem := ListBox1.ItemIndex;
  ListBox1.Clear;
  with CurrentBlockRule do
  for i := 0 to ConditionList.Count - 1 do
    ListBox1.Items.Add(GetConditionString(i));

  if (SetToItem <> -1) and (SetToItem  < ListBox1.Items.Count) then
    ListBox1.ItemIndex := SetToItem
  else
   if (SetToItem <> -1) and (ListBox1.Items.Count > 0) then
    ListBox1.ItemIndex := 0
   else
    ListBox1.ItemIndex := ListBox1.Items.Count - 1;
  ListBox1Click(nil);
end;

function TfmLexerProp.GetConditionString(I: integer): string;
var j: integer;
begin
  Result := IntToStr(I);
  Result := Result + StringOfChar(' ', 4 - Length(Result));
  with CurrentBlockRule do
  if I < ConditionList.Count then
  if ConditionList[I].TagList.Count = 0 then
   begin
    for j := 0 to FSynt.TokenTypeNames.Count - 1 do
     if ((1 shl j) and ConditionList[I].TokenTypes) <> 0 then
      begin
        Result := Result + '<' + FSynt.TokenTypeNames[j];
        if ((not (1 shl j)) and ConditionList[I].TokenTypes) <> 0 then
         Result := Result + ', ...';
        Result := Result + '>';
        Break;
      end;
   end else
   begin
    Result := Result + ConditionList[I].TagList[0];
    if ConditionList[I].TagList.Count > 1 then
      Result := Result + ' ...';
   end;
end;

procedure TfmLexerProp.UpdateCurCond;
begin
  if ListBox1.ItemIndex <> -1 then
    ListBox1.Items[ListBox1.ItemIndex] := GetConditionString(ListBox1.ItemIndex);
end;

{$IFNDEF EC_DOTNET}
type TControlHack = class(TControl);
{$ENDIF}

procedure EnableEdit(Edit: TControl; En: Boolean);
begin
    Edit.Enabled := En;
    {$IFNDEF EC_DOTNET}
    if En then TControlHack(Edit).Color := clWindow
     else TControlHack(Edit).Color := clBtnFace;
    {$ENDIF}
end;

procedure TfmLexerProp.TagCondEnable;
var bt: TTagBlockType;
begin
  bt := CurrentBlockRule.BlockType;
  EnableEdit(Edit2, bt in [btRangeStart, btRangeEnd]);
//  EnableEdit(ComboBox18, bt = btLineBreak);
  EnableEdit(ComboBox20, bt <> btRangeEnd);
  EnableEdit(ComboBox5, bt = btRangeStart);
  EnableEdit(ComboBox6, bt = btRangeStart);
  EnableEdit(ComboBox23, (bt = btRangeEnd) or
     (bt = btRangeStart) and not CurrentBlockRule.NoEndRule);
  EnableEdit(Edit5, bt = btRangeStart);
  EnableEdit(Edit6, bt = btRangeStart);
  EnableEdit(Edit9, bt = btRangeStart);
  CheckBox11.Enabled := bt = btRangeStart;
  CheckBox12.Enabled := bt = btRangeStart;
  CheckBox13.Enabled := bt = btRangeEnd;
  CheckBox14.Enabled := bt = btRangeStart;
  CheckBox15.Enabled := bt = btRangeStart;
  CheckBox6.Enabled := bt = btRangeStart;
  CheckBox1.Enabled := bt = btRangeStart;
  CheckBox4.Enabled := bt = btRangeStart;
  CheckBox5.Enabled := bt = btRangeStart;
  CheckBox31.Enabled := bt = btRangeStart;

  CheckBox16.Enabled := bt = btRangeStart;
  EnableEdit(ComboBox29, bt = btRangeStart);
  EnableEdit(ComboBox28, bt = btRangeStart);

  Label28.Visible := bt = btRangeStart;
  Label10.Visible := bt = btRangeEnd;
  ComboBox23.Visible := bt in [btRangeStart, btRangeEnd];
  Label23.Visible := bt = btLineBreak;
  ComboBox18.Visible := bt = btLineBreak;
  Label15.Visible := bt = btTagDetect;
  ComboBox4.Visible := bt = btTagDetect;

  EnableEdit(ComboBox10, bt = btRangeStart);
  EnableEdit(SyntaxMemo10, (bt = btRangeStart) and (CurrentBlockRule.AutoCloseMode <> acmDisabled));
end;

procedure TfmLexerProp.ListBox1Click(Sender: TObject);
var b: Boolean;
begin
  b := ListBox1.ItemIndex >= 0;
  EnableEdit(ComboBox19, b);
  EnableEdit(SyntaxMemo2, b);
  EnableEdit(SyntaxMemo4, b);
  CheckBox10.Enabled := b;
  if b then
   with CurrentBlockRule.ConditionList[ListBox1.ItemIndex] do
    begin
      FSelfChange := True;
      CheckBox10.Checked := IgnoreCase;
      ComboBox19.ItemIndex := integer(CondType);
      SyntaxMemo2.Invalidate;
      SyntaxMemo2.Lines.Text := FSynt.TokenTypeNames.Text;
      SyntaxMemo4.Lines.Text := TagList.Text;
      SyntaxMemo4.Modified := False;
      FSelfChange := False;
    end
    else
    begin
      SyntaxMemo4.Clear;
      SyntaxMemo4.Modified := False;
      SyntaxMemo2.Clear;
    end;
end;

procedure TfmLexerProp.FillTagBlockCombos(Sender: TObject);
var i: integer;
    st: TStringList;
begin
  FSelfChange := True;
  st :=  TStringList.Create;
  st.AddObject('-', nil);
  for i := 0 to FSynt.BlockRules.Count - 1 do
   if FSynt.BlockRules[i].BlockType = btRangeStart then
    st.AddObject(FSynt.BlockRules[i].DisplayName, FSynt.BlockRules[i]);
  ComboBox24.Items := st;
  ComboBox26.Items := st;
  ComboBox31.Items := st;
  if SyntColFrame3.LB.ItemIndex >= 0 then
    ComboBox26.ItemIndex := st.IndexOfObject(CurrentBlockRule.Block);
  if SyntColFrame2.LB.ItemIndex >= 0 then
    ComboBox24.ItemIndex := st.IndexOfObject(CurrentTokenRule.Block);
  if SyntColFrame4.LB.ItemIndex >= 0 then
    ComboBox31.ItemIndex := st.IndexOfObject(CurrentSubLexRule.Block);
  st.Free;
  FillRefEndCombo;
  FSelfChange := False;
end;

procedure TfmLexerProp.FillRefEndCombo;
var i: integer;
begin
  ComboBox23.Items.Clear;
  if SyntColFrame3.LB.ItemIndex >= 0 then
   begin
     ComboBox23.Items.AddObject('-', nil);
     for i := 0 to FSynt.BlockRules.Count - 1 do
      if (FSynt.BlockRules[i].BlockType = btRangeStart) and
         (CurrentBlockRule.BlockType = btRangeEnd) or
         (FSynt.BlockRules[i].BlockType = btRangeEnd) and
         (CurrentBlockRule.BlockType = btRangeStart) then
     ComboBox23.Items.AddObject(FSynt.BlockRules[i].DisplayName, FSynt.BlockRules[i]);
     ComboBox23.ItemIndex := ComboBox23.Items.IndexOfObject(CurrentBlockRule.BlockEndCond);
   end;
end;

procedure TfmLexerProp.ComboBox25Changed(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.BlockType := TTagBlockType(ComboBox25.ItemIndex);
  TagCondEnable;
  FillTagBlockCombos(nil);
end;

procedure TfmLexerProp.ComboBox18Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.LinePos := TLineBreakPos(ComboBox18.ItemIndex);
end;

procedure TfmLexerProp.ComboBox4Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.TokenType := ComboBox4.ItemIndex - 1;
end;

procedure TfmLexerProp.ComboBox20Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.Style := TSyntaxFormat(ComboBox20.Items.Objects[ComboBox20.ItemIndex]);
end;

procedure TfmLexerProp.ComboBox5Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.TreeItemStyle := ComboBox5.Items[ComboBox5.ItemIndex];
end;

procedure TfmLexerProp.ComboBox6Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.TreeGroupStyle := ComboBox6.Items[ComboBox6.ItemIndex];
end;

procedure TfmLexerProp.ComboBox23Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.BlockEndCond := TTagBlockCondition(ComboBox23.Items.Objects[ComboBox23.ItemIndex])
end;

procedure TfmLexerProp.ComboBox26Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.Block := TTagBlockCondition(ComboBox26.Items.Objects[ComboBox26.ItemIndex])
end;

procedure TfmLexerProp.Edit1Exit(Sender: TObject);
begin
  if Edit1.Modified then
    CurrentBlockRule.IdentIndex := StrToInt(Edit1.Text);
end;

procedure TfmLexerProp.Edit2Exit(Sender: TObject);
begin
  if Edit2.Modified then
    CurrentBlockRule.BlockOffset := StrToInt(Edit2.Text);
end;

procedure TfmLexerProp.Edit8Exit(Sender: TObject);
begin
  if Edit8.Modified then
    CurrentBlockRule.GroupIndex := StrToInt(Edit8.Text);
end;

procedure TfmLexerProp.Edit12Exit(Sender: TObject);
begin
  if Edit12.Modified then
    CurrentBlockRule.TreeItemImage := StrToInt(Edit12.Text);
end;

procedure TfmLexerProp.Edit13Exit(Sender: TObject);
begin
  if Edit13.Modified then
    CurrentBlockRule.TreeGroupImage := StrToInt(Edit13.Text);
end;

procedure TfmLexerProp.Edit5Exit(Sender: TObject);
begin
  if Edit5.Modified then
    CurrentBlockRule.NameFmt := Edit5.Text;
end;

procedure TfmLexerProp.Edit6Exit(Sender: TObject);
begin
  if Edit6.Modified then
    CurrentBlockRule.GroupFmt := Edit6.Text;
end;

procedure TfmLexerProp.Edit9Exit(Sender: TObject);
begin
  if Edit9.Modified then
    CurrentBlockRule.CollapseFmt := Edit9.Text;
end;

procedure TfmLexerProp.CheckBox11Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.EndOfTextClose := CheckBox11.Checked;
end;

procedure TfmLexerProp.CheckBox12Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.NotCollapsed := CheckBox12.Checked;
end;

procedure TfmLexerProp.CheckBox13Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.SameIdent := CheckBox13.Checked;
end;

procedure TfmLexerProp.CheckBox14Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.HighLight := CheckBox14.Checked;
end;

procedure TfmLexerProp.CheckBox15Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.InvertColors := CheckBox15.Checked;
end;

procedure TfmLexerProp.CheckBox6Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.DisplayInTree := CheckBox6.Checked;
end;

procedure TfmLexerProp.CheckBox7Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.StrictParent := CheckBox7.Checked;
end;

procedure TfmLexerProp.ComboBox3Change(Sender: TObject);
begin
  if FSelfChange or (ComboBox3.ItemIndex = -1) then Exit;
  CurrentBlockRule.GrammaRuleName := ComboBox3.Items[ComboBox3.ItemIndex];
end;

procedure TfmLexerProp.CheckBox19Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.NotParent := CheckBox19.Checked;
end;

procedure TfmLexerProp.CheckBox20Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.CancelNextRules := CheckBox20.Checked;
end;

procedure TfmLexerProp.CheckBox9Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.RefToCondEnd := CheckBox9.Checked;
end;

procedure TfmLexerProp.CheckBox26Click(Sender: TObject);
begin
  CurrentBlockRule.AlwaysEnabled := CheckBox26.Checked;
end;

procedure TfmLexerProp.CheckBox1Click(Sender: TObject);
begin
  CurrentBlockRule.DrawStaple := CheckBox1.Checked;
end;

procedure TfmLexerProp.CheckBox4Click(Sender: TObject);
begin
  CurrentBlockRule.SelfClose := CheckBox4.Checked;
end;

procedure TfmLexerProp.CheckBox5Click(Sender: TObject);
begin
  CurrentBlockRule.NoEndRule := CheckBox5.Checked;
  EnableEdit(ComboBox23, not CheckBox5.Checked);
end;

procedure TfmLexerProp.CheckBox31Click(Sender: TObject);
begin
  CurrentBlockRule.IgnoreAsParent := CheckBox31.Checked;
end;

procedure TfmLexerProp.ComboBox29Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.DynHighlight := TDynamicHighlight(ComboBox29.ItemIndex);
end;

procedure TfmLexerProp.ComboBox28Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.HighlightPos := THighlightPos(ComboBox28.ItemIndex);
end;

procedure TfmLexerProp.CheckBox16Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.DynSelectMin := CheckBox16.Checked;
end;

function TfmLexerProp.CurrentCondition: TSingleTagCondition;
begin
  if ListBox1.ItemIndex >= 0 then
   Result := CurrentBlockRule.ConditionList[ListBox1.ItemIndex]
  else
   begin
     Result := nil;
     Abort;
   end;
end;

procedure TfmLexerProp.CheckBox10Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentCondition.IgnoreCase := CheckBox10.Checked;
end;

procedure TfmLexerProp.ComboBox19Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentCondition.CondType := TTagConditionType(ComboBox19.ItemIndex);
end;

procedure TfmLexerProp.Memo2Exit(Sender: TObject);
begin
  if SyntaxMemo4.Modified then
   begin
     CurrentCondition.TagList.Text := SyntaxMemo4.Lines.Text;
     UpdateCurCond;
   end;
end;

procedure TfmLexerProp.SpeedButton1Click(Sender: TObject);
begin
  ListBox1.SetFocus;
  CurrentBlockRule.ConditionList.Add;
  FillConditions(CurrentBlockRule.ConditionList.Count - 1);
end;

procedure TfmLexerProp.SpeedButton2Click(Sender: TObject);
var N: integer;
begin
  ListBox1.SetFocus;
  N := ListBox1.ItemIndex;
  if N = ListBox1.Items.Count - 1 then Dec(N);
  CurrentCondition.Free;
  FillConditions(N);
end;

procedure TfmLexerProp.ListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var over_idx: integer;
begin
  over_idx := ListBox1.ItemAtPos(Point(X, Y), True);
  Accept := (Source = ListBox1) and (over_idx <> ListBox1.ItemIndex) and
            (ListBox1.Items.Count > 0) and (ListBox1.ItemIndex <> -1);
end;

procedure TfmLexerProp.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var over_idx: integer;
begin
  over_idx := ListBox1.ItemAtPos(Point(X, Y), True);
  if over_idx = -1 then over_idx := ListBox1.Items.Count - 1;
  CurrentBlockRule.ConditionList[ListBox1.ItemIndex].Index := over_idx;
  FillConditions(over_idx);
end;

procedure TfmLexerProp.ToggleTokeType(TokenType: integer);
var tt: integer;
begin
  tt := CurrentCondition.TokenTypes;
  if (tt and (1 shl TokenType)) = 0 then
    tt := tt or 1 shl TokenType
  else
    tt := tt and not (1 shl TokenType);
  CurrentCondition.TokenTypes := tt;
  SyntaxMemo2.Invalidate;
  UpdateCurCond;
end;

procedure TfmLexerProp.SyntaxMemo2TGutterObjects0CheckLine(
  Sender: TObject; Line: Integer; var Show: Boolean);
begin
  Show := ListBox1.ItemIndex <> -1;
  if not Show then Exit;
  with TCustomGutterObject(Sender) do
   if (CurrentCondition.TokenTypes and (1 shl Line)) = 0 then
    ImageIndex := 0
   else
    ImageIndex := 1;
end;

procedure TfmLexerProp.SyntaxMemo2TGutterObjects0Click(Sender: TObject;
  Line: Integer; Shift: TShiftState);
begin
  ToggleTokeType(Line);
end;

procedure TfmLexerProp.SyntaxMemo2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_SPACE then
   if (ListBox1.ItemIndex >= 0) and (SyntaxMemo2.Lines.Count > 0) then
    ToggleTokeType(SyntaxMemo2.CaretPos.Y);
end;
//=========================================================================
//   Sub Lexers
//=========================================================================

function TfmLexerProp.CurrentSubLexRule: TSubAnalyzerRule;
begin
  Result := SyntColFrame4.Current as TSubAnalyzerRule;
end;

procedure TfmLexerProp.SubLexRuleChange(Sender: TObject);
begin
  if SyntColFrame4.LB.ItemIndex <> -1 then
   with CurrentSubLexRule do
   begin
    FSelfChange := True;
    ComboBox32.ItemIndex := ComboBox32.Items.IndexOfObject(SyntAnalyzer);
    ComboBox30.ItemIndex := ComboBox30.Items.IndexOfObject(Style);
    ComboBox31.ItemIndex := ComboBox31.Items.IndexOfObject(Block);
    CheckBox21.Checked := StrictParent;
    CheckBox22.Checked := NotParent;
    CheckBox23.Checked := FromTextBegin;
    CheckBox24.Checked := ToTextEnd;
    CheckBox25.Checked := AlwaysEnabled;
    CheckBox29.Checked := IncludeBounds;
    SetSubLexMemos;
    RuleStatesFrame1.Rule := CurrentSubLexRule;
    FSelfChange := False;
   end else
   begin
    SyntaxMemo5.Lines.Clear;
    SyntaxMemo6.Lines.Clear;
    ComboBox30.ItemIndex := 0;
    ComboBox31.ItemIndex := 0;
    ComboBox32.ItemIndex := 0;
   end;
end;

procedure TfmLexerProp.SetSubLexMemos;
begin
   with CurrentSubLexRule do
    begin
     SyntaxMemo5.Lines.Text := StartExpression;
     SyntaxMemo5.Modified := False;
     SyntaxMemo6.Lines.Text := EndExpression;
     SyntaxMemo6.Modified := False;
    end;
end;

procedure TfmLexerProp.CheckBox21Click(Sender: TObject);
begin
  CurrentSubLexRule.StrictParent := CheckBox21.Checked;
end;

procedure TfmLexerProp.CheckBox22Click(Sender: TObject);
begin
  CurrentSubLexRule.NotParent := CheckBox22.Checked;
end;

procedure TfmLexerProp.ComboBox32Change(Sender: TObject);
begin
  if not FSelfChange then
   CurrentSubLexRule.SyntAnalyzer := TSyntAnalyzer(ComboBox32.Items.Objects[ComboBox32.ItemIndex]);
end;

procedure TfmLexerProp.ComboBox30Change(Sender: TObject);
begin
  if not FSelfChange then
   CurrentSubLexRule.Style := TSyntaxFormat(ComboBox30.Items.Objects[ComboBox30.ItemIndex]);
end;

procedure TfmLexerProp.ComboBox31Change(Sender: TObject);
begin
  if not FSelfChange then
   CurrentSubLexRule.Block := TTagBlockCondition(ComboBox31.Items.Objects[ComboBox31.ItemIndex]);
end;

procedure TfmLexerProp.SyntaxMemo5Exit(Sender: TObject);
begin
  if not SyntaxMemo5.Modified then Exit;
  CurrentSubLexRule.StartExpression := SyntaxMemo5.Lines.Text;
  FSynt.ClearClientContents;
  SyntaxMemo5.Modified := False;
end;

procedure TfmLexerProp.SyntaxMemo6Exit(Sender: TObject);
begin
  if not SyntaxMemo6.Modified then Exit;
  CurrentSubLexRule.EndExpression := SyntaxMemo6.Lines.Text;
  FSynt.ClearClientContents;
  SyntaxMemo6.Modified := False;
end;

procedure TfmLexerProp.CheckBox23Click(Sender: TObject);
begin
  CurrentSubLexRule.FromTextBegin := CheckBox23.Checked;
  SetSubLexMemos;
end;

procedure TfmLexerProp.CheckBox24Click(Sender: TObject);
begin
  CurrentSubLexRule.ToTextEnd := CheckBox24.Checked;
  SetSubLexMemos;
end;

procedure TfmLexerProp.CheckBox25Click(Sender: TObject);
begin
  CurrentSubLexRule.AlwaysEnabled := CheckBox25.Checked;
end;

procedure TfmLexerProp.CheckBox29Click(Sender: TObject);
begin
  CurrentSubLexRule.IncludeBounds := CheckBox29.Checked;
end;

//------------------------------------------------------------------------------
// Gramma page
//------------------------------------------------------------------------------
procedure TfmLexerProp.SpeedButton3Click(Sender: TObject);
begin
  if SyntaxMemo9.Modified then
   begin
    FSynt.Gramma.Gramma := SyntaxMemo9.Lines.FText;
    SyntaxMemo9.Modified := False;
    FuillGrammaTree;
    FuillGrammaRules;
   end;
end;

procedure TfmLexerProp.TabSheet11Exit(Sender: TObject);
begin
  SpeedButton3Click(nil);
end;

procedure TfmLexerProp.FuillGrammaTree;
var i: integer;

  procedure AddRuleBranches(Rule: TParserRule; Node: TTreeNode);
  var j, k: integer;
      Branch: TParserRuleBranch;
      pItem: TParserRuleItem;
      tn2, tn3: TTreeNode;
  begin
    if Rule.IsValid then Node.Data := TObject(0) else Node.Data := TObject(1);
    with TreeView1.Items do
    for j := 0 to Rule.Count - 1 do
     begin
      Branch := Rule.Branches[j];
      tn2 := AddChild(Node, 'Branch #' + IntToStr(j + 1));
      if Branch.IsValid then tn2.Data := TObject(0) else tn2.Data := TObject(1);

      for k := 0 to Branch.Count - 1 do
       begin
        pItem := Branch.Items[k];
        tn3 := AddChild(tn2, pItem.Terminal +
          ' (' +IntToStr(pItem.RepMin) + '; ' + IntToStr(pItem.RepMax) + ')' );
        if pItem.IsValid then tn3.Data := TObject(0) else tn3.Data := TObject(1);
        if pItem.IsSubRule then
          AddRuleBranches(pItem.ParserRule, tn3);
       end;
     end;
  end;
begin
  with TreeView1.Items do
   begin
    BeginUpdate;
    Clear;
    for i := 0 to FSynt.Gramma.GrammaCount - 1 do
     AddRuleBranches(FSynt.Gramma[i], AddChild(nil, FSynt.Gramma[i].Name));
    EndUpdate;
   end;
end;

procedure TfmLexerProp.AutoCompletePopup1CheckChar(Sender: TObject;
  C: Word; var IsWord: Boolean);
begin
  if C = Ord('<') then
   IsWord := True;
end;

procedure TfmLexerProp.AutoCompletePopup1GetAutoCompleteList(
  Sender: TObject; Pos: TPoint; List, Display: TecStrings);
var i, p: integer;
begin
   p := SyntaxMemo9.CaretPosToStrPos(Pos);
   if (p < SyntaxMemo9.TextLength) and (SyntaxMemo9.Lines.Chars[p + 1] = '<') then
     begin
       Display.Text := FSynt.TokenTypeNames.Text;
       List.Assign(Display);
       for i := 0 to List.Count - 1 do
         List[i] := '<' + List[i] + '>';
     end else
     begin
       with SyntaxMemo9.SyntObj do
       for i := 0 to TagCount - 1 do
        if Tags[i].Rule is TTagBlockCondition then
         begin
           List.Add(TagStr[i]);
         end;
     end;
end;

procedure TfmLexerProp.TreeView1CustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  if Node.Data = TObject(1) then Sender.Canvas.Font.Color := clRed;
end;

procedure TfmLexerProp.FuillGrammaRules;
var i: integer;
begin
  ComboBox3.Items.Clear;
  ComboBox3.Items.Add('');
  for i := 0 to FSynt.Gramma.GrammaCount - 1 do
   ComboBox3.Items.Add(FSynt.Gramma[i].Name);
  if SyntColFrame3.LB.ItemIndex <> -1 then
    ComboBox3.ItemIndex :=
      ComboBox3.Items.IndexOf(CurrentBlockRule.GrammaRuleName);
end;

procedure TfmLexerProp.CheckBox30Click(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.UseCustomPen := CheckBox30.Checked;
end;

procedure TfmLexerProp.Edit15Exit(Sender: TObject);
begin
  if Edit15.Modified then
    CurrentBlockRule.Pen.Width := StrToInt(Edit15.Text);
end;

procedure TfmLexerProp.ColorBox1Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.Pen.Color := ColorBox1.Selected;
end;

procedure TfmLexerProp.ComboBox9Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.Pen.Style := TPenStyle(ComboBox9.ItemIndex);
end;

procedure TfmLexerProp.SyntaxMemo10TextChanged(Sender: TObject; Pos,
  Count, LineChange: Integer);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.AutoCloseText := SyntaxMemo10.Lines.Text;
end;

procedure TfmLexerProp.ComboBox10Change(Sender: TObject);
begin
  if FSelfChange then Exit;
  CurrentBlockRule.AutoCloseMode := TAutoCloseMode(ComboBox10.ItemIndex);
  TagCondEnable;
end;

procedure TfmLexerProp.FillCharSetCombo;
const
  FontCharsets: array[0..17] of TIdentMapEntry = (
    (Value: 0; Name: 'ANSI'),
    (Value: 1; Name: 'DEFAULT'),
    (Value: 2; Name: 'SYMBOL'),
    (Value: 77; Name: 'MAC'),
    (Value: 128; Name: 'SHIFTJIS'),
    (Value: 129; Name: 'HANGEUL'),
    (Value: 130; Name: 'JOHAB'),
    (Value: 134; Name: 'GB2312'),
    (Value: 136; Name: 'CHINESEBIG5'),
    (Value: 161; Name: 'GREEK'),
    (Value: 162; Name: 'TURKISH'),
    (Value: 177; Name: 'HEBREW'),
    (Value: 178; Name: 'ARABIC'),
    (Value: 186; Name: 'BALTIC'),
    (Value: 204; Name: 'RUSSIAN'),
    (Value: 222; Name: 'THAI'),
    (Value: 238; Name: 'EASTEUROPE'),
    (Value: 255; Name: 'OEM'));
var i: integer;
begin
  for i := 0 to 17 do
    CharSet_Combo.Items.AddObject(FontCharsets[i].Name, TObject(FontCharsets[i].Value));
  CharSet_Combo.ItemIndex := CharSet_Combo.Items.IndexOfObject(TObject(FSynt.Charset));
end;

procedure TfmLexerProp.UpdateCharsets;
var  CS: TFontCharset;
  procedure UpdateCmp(Cmp: TComponent);
  var i: integer;
  begin
    if Cmp is TCustomSyntaxMemo then
      TCustomSyntaxMemo(Cmp).Charset := CS
    {$IFNDEF EC_DOTNET}
    else if Cmp is TCustomEdit then
      TControlHack(Cmp).Font.Charset := CS
    {$ENDIF}
    ;
    for i := 0 to Cmp.ComponentCount - 1 do
      UpdateCmp(Cmp.Components[i]);
  end;
begin
  CS := FSynt.Charset;
  UpdateCmp(Self);
end;

procedure TfmLexerProp.CharSet_ComboChange(Sender: TObject);
begin
  if CharSet_Combo.ItemIndex <> -1 then
    begin
      FSynt.Charset := TFontCharSet(CharSet_Combo.Items.Objects[CharSet_Combo.ItemIndex]);
      UpdateCharsets;
      if not SyntaxMemo1.Modified then
        SyntaxMemo1.Lines.Text := FSynt.SampleText.Text;
    end;
end;

end.


