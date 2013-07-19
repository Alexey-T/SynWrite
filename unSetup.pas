{///////////////////////////////////////////////////////////////////////////////
  SynWrite
  Setup dialog class
///////////////////////////////////////////////////////////////////////////////}

unit unSetup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Grids, Spin,

  ecSyntMemo, ecKeyMap, ecHotKeyEdit, ecPopupCtrl,
  TntStdCtrls, TntComCtrls, TntForms, TntGrids,
  DKLang,

  unMain,
  unSetupOvr;

type
  TfmSetup = class(TTntForm)
    Tabs: TTntPageControl;
    bApply: TTntButton;
    bCan: TTntButton;
    tabEd: TTntTabSheet;
    tabColors: TTntTabSheet;
    tabKey: TTntTabSheet;
    bOk: TTntButton;
    FontDialog: TFontDialog;
    KeyList: TTntStringGrid;
    KeyMapping: TSyntKeyMapping;
    ecHotKey: TecHotKey;
    bKeySet: TTntButton;
    bKeyClr: TTntButton;
    tabFiles: TTntTabSheet;
    gEdit: TTntGroupBox;
    cbBOver: TTntCheckBox;
    cbBPers: TTntCheckBox;
    cbDClick: TTntCheckBox;
    cbGrSel: TTntCheckBox;
    cbWrap: TTntCheckBox;
    cbFold: TTntCheckBox;
    cbDrag: TTntCheckBox;
    cbCollap: TTntCheckBox;
    cbFLine: TTntCheckBox;
    Bevel1: TBevel;
    cbAutoInd: TTntCheckBox;
    cbBackInd: TTntCheckBox;
    cbGrRedo: TTntCheckBox;
    cbGrUndo: TTntCheckBox;
    cbUndoSav: TTntCheckBox;
    cbCopyRtf: TTntCheckBox;
    cbSmCaret: TTntCheckBox;
    cbKeepCaret: TTntCheckBox;
    cbOptFill: TTntCheckBox;
    cbFloatM: TTntCheckBox;
    cbScrollLast: TTntCheckBox;
    cbWrapMar: TTntCheckBox;
    cbFixMove: TTntCheckBox;
    cbVarHorz: TTntCheckBox;
    cbUnindKeep: TTntCheckBox;
    cbKeepBlank: TTntCheckBox;
    gColors: TTntGroupBox;
    Label4: TTntLabel;
    ListColors: TTntListBox;
    Label5: TTntLabel;
    StaticText1: TTntStaticText;
    tabIntf: TTntTabSheet;
    boxIntf: TTntGroupBox;
    cbChar: TTntCheckBox;
    Label11: TTntLabel;
    cbStat: TTntCheckBox;
    tabACP: TTntTabSheet;
    tabEd2: TTntTabSheet;
    gEditor: TTntGroupBox;
    Label15: TTntLabel;
    Label3: TTntLabel;
    Label14: TTntLabel;
    cbLink: TTntCheckBox;
    cbDLBack: TTntCheckBox;
    cbCaret: TTntCheckBox;
    cbHideCur: TTntCheckBox;
    edLSpace: TSpinEdit;
    edMar: TSpinEdit;
    cbMar: TTntCheckBox;
    edNums: TTntComboBox;
    GroupBox2: TTntGroupBox;
    edInd: TSpinEdit;
    Label1: TTntLabel;
    edULimit: TSpinEdit;
    Label13: TTntLabel;
    Label6: TTntLabel;
    edTabMode: TTntComboBox;
    edTab_: TTntEdit;
    Label16: TTntLabel;
    cbDFocus: TTntCheckBox;
    cbRuler: TTntCheckBox;
    bKeyFn: TTntButton;
    cbMenu: TTntCheckBox;
    Label18: TTntLabel;
    cbLang: TTntComboBox;
    DKLanguageController1: TDKLanguageController;
    ColorBox1: TColorBox;
    cbInst: TTntCheckBox;
    gAcpAll: TTntGroupBox;
    Label42: TTntLabel;
    cbAcpFilter: TTntComboBox;
    cbAcpNone: TTntCheckBox;
    cbTabSp: TTntCheckBox;
    boxNew: TTntGroupBox;
    TntLabel4: TTntLabel;
    edEnc: TTntComboBox;
    TntLabel5: TTntLabel;
    edLE: TTntComboBox;
    TntLabel6: TTntLabel;
    edLex: TTntComboBox;
    cbSmHi: TTntCheckBox;
    edAcpDrop: TSpinEdit;
    bColorLoad: TTntButton;
    bColorSave: TTntButton;
    OpenDialogPre: TOpenDialog;
    SaveDialogPre: TSaveDialog;
    cbBrHi: TTntCheckBox;
    tabHist: TTntTabSheet;
    boxHist: TTntGroupBox;
    Label8: TTntLabel;
    Label7: TTntLabel;
    TntLabel11: TTntLabel;
    edFS: TSpinEdit;
    edSR: TSpinEdit;
    cbHCaret: TTntCheckBox;
    cbHEnc: TTntCheckBox;
    bClrSR: TTntButton;
    bClrFS: TTntButton;
    cbMru: TTntCheckBox;
    cbDirLast: TTntComboBox;
    edDirLast: TTntEdit;
    bDirLast: TTntButton;
    cbSmHiCase: TTntCheckBox;
    TntLabel10: TTntLabel;
    cbBak: TTntComboBox;
    edAcpNum: TSpinEdit;
    gAcp2: TTntGroupBox;
    cbAcpFile: TTntCheckBox;
    edAcpFileChars: TSpinEdit;
    edAcpFileSize: TSpinEdit;
    LabelAcpFileChars: TTntLabel;
    LabelAcpFileSize: TTntLabel;
    cbKeyCat: TTntComboBox;
    TntLabel19: TTntLabel;
    cbEsc: TTntComboBox;
    TntLabel21: TTntLabel;
    tabSearch: TTntTabSheet;
    boxFind: TTntGroupBox;
    cbSrWord: TTntCheckBox;
    cbSrOnTop: TTntCheckBox;
    TntLabel22: TTntLabel;
    cbBkUndo: TTntCheckBox;
    edFilter: TTntEdit;
    TntLabel25: TTntLabel;
    TimerFilt: TTimer;
    cbStaples: TComboBox;
    TntLabel28: TTntLabel;
    edStapleOffset: TSpinEdit;
    bFiltClear: TTntButton;
    cbSrSel: TTntCheckBox;
    tabASave: TTntTabSheet;
    gASave: TTntGroupBox;
    cbASaveTimer: TTntCheckBox;
    edASaveTime: TSpinEdit;
    cbASaveFocus: TTntCheckBox;
    gASaveWhat: TTntGroupBox;
    cbASaveCurrFile: TTntRadioButton;
    cbASaveAllFiles: TTntRadioButton;
    labASavIgnore: TTntLabel;
    edASaveMaxSize: TSpinEdit;
    labASaveTime: TTntLabel;
    labKByte: TTntLabel;
    gUnnamed: TTntGroupBox;
    edASaveUnnamedDir: TEdit;
    cbASaveUnIgnore: TTntRadioButton;
    cbASaveUnShowSave: TTntRadioButton;
    cbASaveUnSaveToDir: TTntRadioButton;
    bUnnamedBrowse: TTntButton;
    gAcpSp: TTntGroupBox;
    cbAcpHtm: TTntCheckBox;
    cbAcpTabbing: TTntCheckBox;
    cbAcpCss: TTntCheckBox;
    labSmTabHelp: TTntLabel;
    cbHTemp: TTntCheckBox;
    cbAcpUseSingle: TTntCheckBox;
    cbRoStart: TTntCheckBox;
    cbTplTabbing: TTntCheckBox;
    labTplHelp: TTntLabel;
    cbACloseTags: TTntCheckBox;
    TntLabel7: TTntLabel;
    TntLabel12: TTntLabel;
    labAutoCloseHelp: TTntLabel;
    cbACloseBr: TTntCheckBox;
    cbACloseBrEsc: TTntCheckBox;
    cbACloseQ: TTntCheckBox;
    cbDWrapMark: TTntCheckBox;
    ListCat: TTntListBox;
    tabTabs: TTntTabSheet;
    boxTabs: TTntGroupBox;
    TntLabel3: TTntLabel;
    cbTabBtn: TTntCheckBox;
    cbTabMul: TTntCheckBox;
    cbTabDown: TTntCheckBox;
    cbTabNums: TTntCheckBox;
    cbTabSw: TTntCheckBox;
    cbTabDnD: TTntCheckBox;
    edTabMaxLen: TSpinEdit;
    cbTabDbl: TTntCheckBox;
    boxToolbar: TTntGroupBox;
    Label2: TTntLabel;
    cbTheme: TTntComboBox;
    Label12: TTntLabel;
    cbIcons: TTntComboBox;
    tabFonts: TTntTabSheet;
    gFont: TTntGroupBox;
    b1: TTntButton;
    b2: TTntButton;
    b4: TTntButton;
    b3: TTntButton;
    b5: TTntButton;
    b6: TTntButton;
    tabTree: TTntTabSheet;
    gTree: TTntGroupBox;
    cbTreeSync: TTntCheckBox;
    tabSess: TTntTabSheet;
    boxSess: TTntGroupBox;
    cbSessDef: TTntCheckBox;
    cbSessLoad: TTntCheckBox;
    cbSessSave: TTntCheckBox;
    boxProj: TTntGroupBox;
    cbProjLoad: TTntCheckBox;
    cbProjSave: TTntCheckBox;
    TntGroupBox1: TTntGroupBox;
    TntLabel26: TTntLabel;
    edMapZoom: TSpinEdit;
    boxFGroup: TTntGroupBox;
    TntLabel1: TTntLabel;
    cbText_: TTntComboBox;
    Label17: TTntLabel;
    TntLabel8: TTntLabel;
    edOem: TTntEdit;
    edUTF8: TTntEdit;
    TntLabel9: TTntLabel;
    boxReload: TTntGroupBox;
    Label9: TTntLabel;
    cbNotif: TTntComboBox;
    cbTail: TTntCheckBox;
    cbOverRO: TTntCheckBox;
    edBigSize: TSpinEdit;
    TntLabel23: TTntLabel;
    tabMisc: TTntTabSheet;
    boxMisc: TTntGroupBox;
    labDate: TTntLabel;
    TntLabel20: TTntLabel;
    cbFullTitle: TTntCheckBox;
    cbGroupLexers: TTntCheckBox;
    cbMenuIcon: TTntCheckBox;
    edDateFmt: TTntEdit;
    cbBeep: TTntCheckBox;
    cbTips: TTntCheckBox;
    edMovX: TSpinEdit;
    edMovY: TSpinEdit;
    cbZenProfile: TTntComboBox;
    ListTabColors: TTntListBox;
    TntLabel13: TTntLabel;
    cbStripBk: TTntCheckBox;
    tabFolders: TTntTabSheet;
    boxFolders: TTntGroupBox;
    TntLabel14: TTntLabel;
    TntLabel15: TTntLabel;
    edFolders: TTntMemo;
    bAddFolder: TTntButton;
    tabSpell: TTntTabSheet;
    boxSpellOpt: TTntGroupBox;
    TntLabel16: TTntLabel;
    TntLabel24: TTntLabel;
    edSpellExt: TTntEdit;
    cbSpellEn: TTntCheckBox;
    bSpellOpt: TTntButton;
    boxSpellLnk: TTntGroupBox;
    TntLabel27: TTntLabel;
    labDictWww: TTntLabel;
    labDictDir: TTntLabel;
    cbSavePos: TTntCheckBox;
    tabOvr: TTntTabSheet;
    TntLabel18: TTntLabel;
    edSrOffsetY: TSpinEdit;
    TntLabel32: TTntLabel;
    edDateFmtP: TTntEdit;
    TntLabel33: TTntLabel;
    cbColorOnEmpty: TTntCheckBox;
    cbTabVis: TTntComboBox;
    edTplTabEx: TEdit;
    TntLabel34: TTntLabel;
    Bevel2: TBevel;
    cbSelMode: TTntComboBox;
    TntLabel35: TTntLabel;
    cbKeepPaste: TTntCheckBox;
    TntLabel36: TTntLabel;
    cbUniNeed: TTntComboBox;
    cbRecColors: TTntComboBox;
    TntLabel37: TTntLabel;
    cbCopyLineNSel: TTntCheckBox;
    cbMicroMap: TTntCheckBox;
    cbSortMode: TTntComboBox;
    TntLabel38: TTntLabel;
    labEmmet: TTntLabel;
    cbTreeDelay: TSpinEdit;
    TntLabel39: TTntLabel;
    TntLabel29: TTntLabel;
    tabCarets: TTntTabSheet;
    boxCarets: TTntGroupBox;
    cbCaretMulti: TTntCheckBox;
    TntLabel30: TTntLabel;
    cbCaretIndNone: TTntRadioButton;
    cbCaretIndLine: TTntRadioButton;
    cbCaretIndGutter: TTntRadioButton;
    TntLabel31: TTntLabel;
    edCaretGutterCol: TSpinEdit;
    labCaretHelp: TTntLabel;
    cbUrlClick: TTntCheckBox;
    cbShowCol: TTntCheckBox;
    cbCaretWidth: TTrackBar;
    TntLabel40: TTntLabel;
    edCaretType: TTntComboBox;
    gNonPrint: TTntGroupBox;
    cbNPrintShow: TTntCheckBox;
    cbNPrintSp: TTntCheckBox;
    cbNPrintEol: TTntCheckBox;
    cbNPrintEolEx: TTntCheckBox;
    labAcpHelp: TTntLabel;
    boxFindTree: TTntGroupBox;
    cbSrExpand: TTntCheckBox;
    edSrMaxTreeMatches: TSpinEdit;
    TntLabel17: TTntLabel;
    cbSrQsCap: TTntCheckBox;
    procedure bApplyClick(Sender: TObject);
    procedure bCanClick(Sender: TObject);
    procedure tabEdShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Apply;
    procedure bOkClick(Sender: TObject);
    procedure tabColorsShow(Sender: TObject);
    procedure ListColorsClick(Sender: TObject);
    procedure ColorBox1Select(Sender: TObject);
    procedure bKeySetClick(Sender: TObject);
    procedure tabKeyShow(Sender: TObject);
    procedure KeyListMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure KeyListSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure KeyListDrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure KeyListClick(Sender: TObject);
    procedure KeyListMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure KeyListMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure bKeyClrClick(Sender: TObject);
    procedure ecHotKeyChange(Sender: TObject);
    procedure tabFilesShow(Sender: TObject);
    procedure b1Click(Sender: TObject);
    procedure b2Click(Sender: TObject);
    procedure b3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FontDialogShow(Sender: TObject);
    procedure tabIntfShow(Sender: TObject);
    procedure tabACPShow(Sender: TObject);
    procedure bClrFSClick(Sender: TObject);
    procedure bClrSRClick(Sender: TObject);
    procedure tabEd2Show(Sender: TObject);
    procedure bKeyFnClick(Sender: TObject);
    procedure b4Click(Sender: TObject);
    procedure b5Click(Sender: TObject);
    procedure edTabModeChange(Sender: TObject);
    procedure b6Click(Sender: TObject);
    procedure bColorSaveClick(Sender: TObject);
    procedure bColorLoadClick(Sender: TObject);
    procedure bDirLastClick(Sender: TObject);
    procedure tabHistShow(Sender: TObject);
    procedure cbKeyCatChange(Sender: TObject);
    procedure labDateClick(Sender: TObject);
    procedure tabSearchShow(Sender: TObject);
    procedure cbSessSaveClick(Sender: TObject);
    procedure edFilterChange(Sender: TObject);
    procedure TimerFiltTimer(Sender: TObject);
    procedure cbStaplesDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure edIndKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bFiltClearClick(Sender: TObject);
    procedure tabASaveShow(Sender: TObject);
    procedure bUnnamedBrowseClick(Sender: TObject);
    procedure cbASaveUnnamedClick(Sender: TObject);
    procedure cbASaveTimerClick(Sender: TObject);
    procedure labSmTabHelpClick(Sender: TObject);
    procedure labTplHelpClick(Sender: TObject);
    procedure labAutoCloseHelpClick(Sender: TObject);
    procedure cbACloseBrClick(Sender: TObject);
    procedure cbAcpFileClick(Sender: TObject);
    procedure ListColorsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListCatClick(Sender: TObject);
    procedure tabTabsShow(Sender: TObject);
    procedure tabFontsShow(Sender: TObject);
    procedure tabTreeShow(Sender: TObject);
    procedure tabSessShow(Sender: TObject);
    procedure tabMiscShow(Sender: TObject);
    procedure cbLangChange(Sender: TObject);
    procedure ListTabColorsDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListTabColorsDblClick(Sender: TObject);
    procedure ListTabColorsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bAddFolderClick(Sender: TObject);
    procedure edFoldersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure tabFoldersShow(Sender: TObject);
    procedure tabSpellShow(Sender: TObject);
    procedure labDictWwwClick(Sender: TObject);
    procedure labDictDirClick(Sender: TObject);
    procedure bSpellOptClick(Sender: TObject);
    procedure tabOvrShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure labEmmetClick(Sender: TObject);
    procedure tabCaretsShow(Sender: TObject);
    procedure labCaretHelpClick(Sender: TObject);
    procedure labAcpHelpClick(Sender: TObject);
  private
    { Private declarations }
    fmOvr: TfmSetupOvr;
    Colors: TSynColors;
    ColorsOfTabs: array[0..Pred(cTabColors)] of TColor;
    FLangChanged: boolean;
    procedure ListKeys;
    procedure FixWnd;
    function ColorPreFN(const Name: string): string;
  public
    { Public declarations }
    fmMain: TfmMain;
  end;

//=================================
const
  cColors: array[0..cColorsNum-1] of string = (
  'Text', //0
  'Text-BG', //1
  'Current-line-BG', //2
  'Line-numbers-text', //3
  'Line-numbers-BG', //4
  'Collapse-line', //5
  'Folding-lines', //6
  'Folding-bar-BG', //7
  'Gutter-separator', //8
  'Selection-text', //9
  'Selection-BG', //10
  'Right-margin', //11
  'Hints-text', //12
  'Hints-BG', //13
  'Non-printable-chars', //14
  'Indentation-staples', //15
  'Gutter-gradient-right', //16
  'Tree-text', //17
  'Tree-BG', //18
  'Ruler-text', //19
  'Ruler-BG', //20
  'Passive-tabs', //21
  'Active-tab', //22
  'Active-tab-line', //23
  'Search-marks-text', //24
  'Search-marks-BG', //25
  'Output-panel-text', //26
  'Output-panel-BG', //27
  'Output-panel-selection-text', //28
  'Output-panel-selection-BG', //29
  'Output-panel-active-text', //30
  'Output-panel-active-selected-text', //31
  'Output-panel-highlight-mask', //32
  'Pair-brackets', //33
  'Pair-brackets-BG', //34
  'Links-highlighting', //35
  'Views-splitter', //36
  'Current-line-text', //37
  'Line-state-modified', //38
  'Line-state-new', //39
  'Line-state-saved', //40
  'Line-state-unchanged', //41
  'Tab-caption', //42
  'Tab-caption-unsaved', //43
  'Bookmark-BG', //44
  'Map-BG', //45
  'Collapse-mark', //46
  'Slave-splitter', //47
  'Line-state-def', //48
  'Non-printable-BG', //49
  'Collapse-mark-BG', //50
  'SyncEdit-BG', //51
  'Map-marks-BG', //52
  'Carets-gutter-BG' //53
  );

const
  cColorsOrder: array[0..cColorsNum-7] of integer = (
  0,
  1,
  9,
  10,
  37,
  2,
  3,
  4,
  6,
  7,
  5,
  46,
  50,
  14,
  49,
  15,
  11,
  24,
  25,
  44,
  42,
  43,
  21,
  22,
  23,
  17,
  18,
  19,
  20,
  26,
  27,
  28,
  29,
  30,
  31,
  32,
  33,
  34,
  35,
  //36,
  //47,
  38,
  39,
  40,
  41,
  48,
  45,
  52,
  51,
  53
  );

implementation

uses
  IniFiles, Types,
  ecSyntTree, ecSyntAnal, ecStrUtils,
  ATxShell, ATxFProc, ATxSProc,

  unHints,
  unProc,
  unProj,
  unProcSort,

  TntClasses,
  TntFileCtrl;

{$R *.dfm}

const
  cColorExt = 'synw-colors';
  cColorFilter = '*.'+cColorExt+'|*.'+cColorExt;

procedure TfmSetup.bOkClick(Sender: TObject);
begin
  Apply;
  ModalResult:= mrOk;
end;

procedure TfmSetup.bCanClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
end;

procedure TfmSetup.bApplyClick(Sender: TObject);
begin
  //lang can't be applied
  if tabIntf.Tag<>0 then
    if FLangChanged then 
      MsgInfo(DKLangConstW('MLnApply'), Handle);

  Apply;
end;

procedure TfmSetup.Apply;
var
  i: integer;
const
  cTp: array[boolean] of TTabPosition = (tpTop, tpBottom);
begin
  with fmMain do begin
  if tabEd.Tag<>0 then
  begin
    if cbBOver.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soOverwriteBlocks]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soOverwriteBlocks];
    if cbBPers.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soPersistentBlocks]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soPersistentBlocks];
    if cbDClick.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soDoubleClickLine]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soDoubleClickLine];
    if cbKeepCaret.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soKeepCaretInText]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soKeepCaretInText];
    if cbCopyRtf.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soCopyAsRTF]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soCopyAsRTF];
    if cbAutoInd.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soAutoIndentMode]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soAutoIndentMode];
    if cbBackInd.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soBackUnindent]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soBackUnindent];
    if cbGrUndo.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soGroupUndo]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soGroupUndo];
    if cbGrRedo.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soGroupRedo]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soGroupRedo];
    if cbFLine.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soFixedLineHeight]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soFixedLineHeight];
    if cbDrag.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soDragText]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soDragText];
    if cbCollap.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soCallapseEmptyLines]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soCallapseEmptyLines];
    if cbKeepBlank.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soKeepTrailingBlanks]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soKeepTrailingBlanks];
    if cbFloatM.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soFloatMarkers]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soFloatMarkers];
    if cbUndoSav.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soUndoAfterSave]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soUndoAfterSave];
    if cbScrollLast.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soScrollLastLine]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soScrollLastLine];
    if cbGrSel.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soGreedySelect]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soGreedySelect];
    if cbSmCaret.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soSmartCaret]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soSmartCaret];
    if cbWrapMar.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soBreakOnRightMargin]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soBreakOnRightMargin];
    if cbOptFill.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soOptimalFill]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soOptimalFill];
    if cbFixMove.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soFixedColumnMove]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soFixedColumnMove];
    if cbVarHorz.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soVariableHorzScrollBar]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soVariableHorzScrollBar];
    if cbUnindKeep.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soUnindentKeepAlign]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soUnindentKeepAlign];

    TemplateEditor.WordWrap:=cbWrap.Checked;
    TemplateEditor.DisableFolding:=not cbFold.Checked;
    case cbSelMode.ItemIndex of
      0: TemplateEditor.SelectModeDefault:= msNormal;
      1: TemplateEditor.SelectModeDefault:= msColumn;
      2: TemplateEditor.SelectModeDefault:= msLine;
    end;

    if cbKeepPaste.Checked then
      TemplateEditor.OptionsEx:=TemplateEditor.OptionsEx + [soKeepCaretPaste]
    else
      TemplateEditor.OptionsEx:=TemplateEditor.OptionsEx - [soKeepCaretPaste];
  end;

  //auto-save
  if tabASave.Tag<>0 then
  begin
    opASaveOnTimer:= cbASaveTimer.Checked;
    opASaveOnFocus:= cbASaveFocus.Checked;
    opASaveTimeMin:= edASaveTime.Value;
    opASaveAllFiles:= cbASaveAllFiles.Checked;
    opASaveMaxSizeKb:= edASaveMaxSize.Value;
    if cbASaveUnIgnore.Checked then opASaveUnnamed:= 0 else
     if cbASaveUnShowSave.Checked then opASaveUnnamed:= 1 else
      if cbASaveUnSaveToDir.Checked then opASaveUnnamed:= 2;
    opASaveUnnamedDir:= edASaveUnnamedDir.Text;
    ApplyAutoSave;
  end;

  //search/tree
  if tabSearch.Tag<>0 then
  begin
    opMaxTreeMatches:=edSrMaxTreeMatches.Value;
    opSrOffsetY:=edSrOffsetY.Value;
    opSrExpand:=cbSrExpand.Checked;
    opSrOnTop:=cbSrOnTop.Checked;
    opSrSuggestWord:=cbSrWord.Checked;
    opSrSuggestSel:=cbSrSel.Checked;
    opQsCap:=cbSrQsCap.Checked;
    ApplyQs;
  end;

  //tree
  if tabTree.Tag<>0 then
  begin
    Tree.AutoSynchronize:=cbTreeSync.Checked;
    Tree.UpdateDelay:= cbTreeDelay.Value;

    //opMapVScroll:= cbMapVScroll.Checked;
    opMapZoom:= edMapZoom.Value;
    ApplyMap;
  end;

  //fonts
  if tabFonts.Tag<>0 then
  begin
    TemplateEditor.Font:=b1.Font;
    TemplateEditor.LineNumbers.Font:=b2.Font;
    Tree.Font:=b3.Font;
    TemplateEditor.HorzRuler.Font:=b4.Font;
    ecACP.Font:=b5.Font;
    ApplyACP;
    ListOut.Font:=b6.Font;
    ApplyOut;
    ApplyFonts;
  end;

  //colors
  if tabColors.Tag<>0 then
  begin
    Theme:=cbTheme.Text;
    Icons:=cbIcons.ItemIndex;
    ApplyIntf;
    ApplyColorsArrayToEditor(Colors, TemplateEditor);
    ApplyColors;
    ApplyOut;
    ApplyMap;
    ApplyCarets;
  end;

  if tabEd2.Tag<>0 then
  begin
    if cbCaret.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soAlwaysShowCaret]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soAlwaysShowCaret];
    TemplateEditor.HorzRuler.Visible:=cbRuler.Checked;
    if cbDFocus.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soDrawCurLineFocus]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soDrawCurLineFocus];
    TemplateEditor.DefaultStyles.CurrentLine.Enabled:= cbDLBack.Checked;
    if cbHideCur.Checked then
      TemplateEditor.Options:=TemplateEditor.Options + [soHideCursorOnType]
    else
      TemplateEditor.Options:=TemplateEditor.Options - [soHideCursorOnType];

    if cbColorOnEmpty.Checked then
      TemplateEditor.OptionsEx:=TemplateEditor.OptionsEx - [soNormalSelToLineEnd]
    else
      TemplateEditor.OptionsEx:=TemplateEditor.OptionsEx + [soNormalSelToLineEnd];

    TemplateEditor.LineSpacing:=edLSpace.Value;
    TemplateEditor.ShowRightMargin:=cbMar.Checked;
    TemplateEditor.RightMargin:=edMar.Value;
    TemplateEditor.LineNumbers.NumberingStyle:=TLineNumberingStyle(edNums.ItemIndex);
    TemplateEditor.StapleOffset:=edStapleOffset.Value;
    TemplateEditor.StaplePen.Style:=TPenStyle(cbStaples.ItemIndex);

    opNonPrint:=cbNPrintShow.Checked;
    opNonPrintSpaces:=cbNPrintSp.Checked;
    opNonPrintEol:=cbNPrintEol.Checked;
    opNonPrintEolDetail:=cbNPrintEolEx.Checked;

    opLink:= cbLink.Checked;
    opSingleClickURL:= cbUrlClick.Checked;
    ApplyUrlClick;

    opShowWrapMark:=cbDWrapMark.Checked;
    opCopyLineIfNoSel:=cbCopyLineNSel.Checked;
    opSmartHi:=cbSmHi.Checked;
    opSmartHiCase:=cbSmHiCase.Checked;
    opBracketHi:=cbBrHi.Checked;
    opBkUndo:=cbBkUndo.Checked;
    opShowCurrentColumn:= cbShowCol.Checked;
    ApplyEd2;
    ApplyFrames;

    TemplateEditor.BlockIndent:=edInd.Value;
    TemplateEditor.TabList.AsString:=edTab_.Text;
    TemplateEditor.UndoLimit:=edULimit.Value;
    case edTabMode.ItemIndex of
      0: TemplateEditor.TabMode:=tmSpaces;
      1: TemplateEditor.TabMode:=tmTabChar;
      2: TemplateEditor.TabMode:=tmSmartTab;
    end;
    opTabsReplace:=cbTabSp.Checked;
  end;

  //editor overrides
  if tabOvr.Tag<>0 then
  begin
    fmMain.opLexersOverride:= fmOvr.FString;
  end;

  //keys
  if tabKey.Tag<>0 then
  begin
    fmMain.SyntKeyMapping.Assign(Self.KeyMapping);
  end;

  //folders
  if tabFolders.Tag<>0 then
  begin
    SListToString(edFolders.Lines, opProjPaths);
  end;

  //spell
  if tabSpell.Tag<>0 then
  begin
    opSpellEn:= cbSpellEn.Checked;
    opSpellExt:= edSpellExt.Text;
    ApplySpell;
  end;

  //misc2
  if tabMisc.Tag<>0 then
  begin
    opCaretMoveX:= edMovX.Value;
    opCaretMoveY:= edMovY.Value;
    opDateFmt:= edDateFmt.Text;
    opDateFmtPLog:= edDateFmtP.Text;
    opZenProfile:= cbZenProfile.Text;
    opShowRecentColors:= cbRecColors.ItemIndex;
    opSortMode:= TSynSortMode(cbSortMode.ItemIndex);
    ApplyShowRecentColors;
    opLexerCat:= cbGroupLexers.Checked;
    opStripBkmk:= cbStripBk.Checked;
    opMenuIcon:= cbMenuIcon.Checked;
    Icons:= Icons; //update menu
    opTitleFull:=cbFullTitle.Checked;
    opBeep:= cbBeep.Checked;
    opTipsToken:= cbTips.Checked;
    opTipsPanels:= opTipsToken;
    ApplyTips;
  end;

  //misc
  if tabFiles.Tag<>0 then
  begin
    opNotif:=cbNotif.ItemIndex;
    opAskOverwrite:=cbOverRO.Checked;
    opTextOnly:=cbText_.ItemIndex;
    opOem:=edOem.Text;
    opUTF8:=edUTF8.Text;
    opBigSize:= edBigSize.Value;
    opFollowTail:= cbTail.Checked;
    opUnicodeNeeded:= cbUniNeed.ItemIndex;
  end;

  //intf
  if tabIntf.Tag<>0 then
  begin
    opLang:=LangManager.LanguageIDs[cbLang.ItemIndex];
    opChInf:=cbChar.Checked;
    UpdateCh;

    opMicroMap:=cbMicroMap.Checked;
    ApplyFrames;

    Menu.Visible:=cbMenu.Checked;
    Status.Visible:=cbStat.Checked;
    opEsc:=cbEsc.ItemIndex;
    opSingleInstance:=cbInst.Checked;
    ApplyInst;

    opStartRO:=cbRoStart.Checked;

    //redraw
    tbFile.Invalidate;
    tbEdit.Invalidate;
    tbView.Invalidate;
    plTree.Invalidate;
    //
    opNewEnc:=edEnc.ItemIndex;
    opNewLineEnds:=edLE.ItemIndex;
    if edLex.ItemIndex=0 then
      opNewLex:= ''
    else
      opNewLex:=edLex.Text;
  end;

  //Tabs
  if tabTabs.Tag<>0 then
  begin
    opTabVisible:=cbTabVis.ItemIndex;
    opTabBtn:=cbTabBtn.Checked;
    opTabNums:=cbTabNums.Checked;
    opTabSwitcher:=cbTabSw.Checked;
    opTabDragDrop:=cbTabDnD.Checked;
    opTabDblClick:=cbTabDbl.Checked;
    opTabMaxLen:=edTabMaxLen.Value;
    opTabMultiLine:=cbTabMul.Checked;
    opTabAtBottom:=cbTabDown.Checked;

    for i:= 0 to High(ColorsOfTabs) do
      opTabColors[i]:= ColorsOfTabs[i];

    ApplyTabOptions;
    ApplyFrames;
  end;

  //Carets
  if tabCarets.Tag<>0 then
  begin
    opCaretsEnabled:= cbCaretMulti.Checked;
    if cbCaretIndNone.Checked then opCaretsIndicator:= 0 else
     if cbCaretIndLine.Checked then opCaretsIndicator:= 1 else
      if cbCaretIndGutter.Checked then opCaretsIndicator:= 2;
    opCaretsGutterBand:= edCaretGutterCol.Value;
    opCaretType:= edCaretType.ItemIndex; //cbCaretWidth.Position;
    ApplyCarets;
  end;

  //Misc2
  if tabACP.Tag<>0 then
  begin
    opAcpHtm:=cbAcpHtm.Checked;
    opAcpCss:=cbAcpCss.Checked;
    opAcpTabbing:=cbAcpTabbing.Checked;
    opTemplateTabbing:=cbTplTabbing.Checked;
    opTemplateTabbingExcept:= edTplTabEx.Text;
    opAutoCloseTags:=cbACloseTags.Checked;
    opAutoCloseBrackets:=cbACloseBr.Checked;
    opAutoCloseBracketsNoEsc:=cbACloseBrEsc.Checked;
    opAutoCloseQuotes:=cbACloseQ.Checked;
    opAcpNum:= edAcpNum.Value;
    opAcpUseSingle:= cbAcpUseSingle.Checked;
    SyntaxManagerChange(nil);
    ecACP.DropDownCount:=edAcpDrop.Value;
    ecACP.ShowWhenNone:=cbAcpNone.Checked;
    ecACP.FilterType:=TAutoCompleteFilter(cbAcpFilter.ItemIndex);
    ApplyACP;
    opAcpFile:= cbAcpFile.Checked;
    opAcpFileChars:= edAcpFileChars.Value;
    opAcpFileSize:= edAcpFileSize.Value;
  end;

  //sess/proj
  if tabSess.Tag<>0 then
  begin
    opHistSessionSave:=cbSessSave.Checked;
    opHistSessionLoad:=cbSessLoad.Checked;
    opHistSessionDef:=cbSessDef.Checked;
    opHistProjectSave:=cbProjSave.Checked;
    opHistProjectLoad:=cbProjLoad.Checked;
  end;

  //history
  if tabHist.Tag<>0 then
  begin
    opMruCheck:=cbMru.Checked;
    opSavePos:=cbSavePos.Checked;
    opSaveState:=edFS.Value;
    opSaveSRHist:=edSR.Value;
    opSaveCaret:=cbHCaret.Checked;
    opSaveEnc:=cbHEnc.Checked;
    opStateForTemp:= cbHTemp.Checked;
    opLastDir:=cbDirLast.ItemIndex;
    opLastDirPath:=edDirLast.Text;
    opBak:=cbBak.ItemIndex;
  end;

  //update from template
  PropsManager.UpdateAll;
  for i:= 0 to FrameCount-1 do
    UpdateGutter(Frames[i]);

  //save
  opTabOptionsLast:= Tabs.ActivePageIndex;
  SaveIni;
end;
end;

//editor
procedure TfmSetup.tabEdShow(Sender: TObject);
begin
  if tabEd.Tag<>0 then Exit;
  with fmMain do
  begin
    cbBOver.Checked:=sooverwriteBlocks in TemplateEditor.Options;
    cbBPers.Checked:=soPersistentBlocks in TemplateEditor.Options;
    cbDClick.Checked:=soDoubleClickLine in TemplateEditor.Options;
    cbKeepCaret.Checked:=soKeepCaretInText in TemplateEditor.Options;
    cbCopyRtf.Checked:=soCopyAsRTF in TemplateEditor.Options;
    cbAutoInd.Checked:=soAutoIndentMode in TemplateEditor.Options;
    cbBackInd.Checked:=soBackUnindent in TemplateEditor.Options;
    cbGrUndo.Checked:=soGroupUndo in TemplateEditor.Options;
    cbGrRedo.Checked:=soGroupRedo in TemplateEditor.Options;
    cbFLine.Checked:=soFixedLineHeight in TemplateEditor.Options;
    cbDrag.Checked:=soDragText in TemplateEditor.Options;
    cbCollap.Checked:=soCallapseEmptyLines in TemplateEditor.Options;
    cbKeepBlank.Checked:=soKeepTrailingBlanks in TemplateEditor.Options;
    cbFloatM.Checked:=soFloatMarkers in TemplateEditor.Options;
    cbUndoSav.Checked:=soUndoAfterSave in TemplateEditor.Options;
    cbScrollLast.Checked:=soScrollLastLine in TemplateEditor.Options;
    cbGrSel.Checked:=soGreedySelect in TemplateEditor.Options;
    cbSmCaret.Checked:=soSmartCaret in TemplateEditor.Options;
    cbWrapMar.Checked:=soBreakOnRightMargin in TemplateEditor.Options;
    cbOptFill.Checked:=soOptimalFill in TemplateEditor.Options;
    cbFixMove.Checked:=soFixedColumnMove in TemplateEditor.Options;
    cbVarHorz.Checked:=soVariableHorzScrollBar in TemplateEditor.Options;
    cbUnindKeep.Checked:=soUnindentKeepAlign in TemplateEditor.Options;
    cbWrap.Checked:=TemplateEditor.WordWrap;
    cbFold.Checked:=not TemplateEditor.DisableFolding;
    cbKeepPaste.Checked:= soKeepCaretPaste in TemplateEditor.OptionsEx;

    case TemplateEditor.SelectModeDefault of
      msNone,
      msNormal: cbSelMode.ItemIndex:= 0;
      msColumn: cbSelMode.ItemIndex:= 1;
      msLine: cbSelMode.ItemIndex:= 2;
    end;

    tabEd.Tag:=1;
  end;
end;

procedure TfmSetup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function ColorNumToLngID(n: integer): string;
begin
  Result:= 'zzc_' + cColors[n];
  SReplaceAll(Result, '-', '_');
end;

//view
procedure TfmSetup.tabColorsShow(Sender: TObject);
var
  i: integer;
begin
  if tabColors.Tag<>0 then Exit;

  for i:= Low(cColorsOrder) to High(cColorsOrder) do
    ListColors.Items.Add(DKLangConstW(ColorNumToLngId(cColorsOrder[i])));
  ListColors.Selected[0]:= true;

  with fmMain do
  begin
    cbTheme.ItemIndex:= cbTheme.Items.IndexOf(Theme);
    cbIcons.ItemIndex:= Icons;
    InitColorsArray(Colors);
  end;
  
  tabColors.Tag:= 1;
  ListColorsClick(Self);
end;

procedure TfmSetup.ListColorsClick(Sender: TObject);
begin
  ColorBox1.Selected:= Colors[cColorsOrder[ListColors.ItemIndex]];
  ColorBox1.Items.Objects[0]:= TObject(ColorBox1.Selected); //set Custom color
  ColorBox1.Invalidate;
end;

procedure TfmSetup.ColorBox1Select(Sender: TObject);
begin
  Colors[cColorsOrder[ListColors.ItemIndex]]:= ColorBox1.Selected;
  ListColors.Invalidate;
end;

procedure TfmSetup.b1Click(Sender: TObject);
begin
  FontDialog.Font:=b1.Font;
  if FontDialog.Execute then b1.Font:=FontDialog.Font;
end;

//keys
procedure TfmSetup.tabKeyShow(Sender: TObject);
var
  L: TStringList;
  i: integer;
begin
  if tabKey.Tag<>0 then Exit;
  tabKey.Tag:=1;
  KeyMapping.Assign(fmMain.SyntKeyMapping);

  //list categories
  L:= TStringList.Create;
  for i:=0 to KeyMapping.Items.Count-1 do
    if KeyMapping.Items[i].Customizable then
      if L.IndexOf(KeyMapping.Items[i].Category)<0 then
        L.Add(KeyMapping.Items[i].Category);

  cbKeyCat.Items.AddStrings(L);
  cbKeyCat.ItemIndex:= 0;
  FreeandNil(L);

  //list keys
  ListKeys;
  KeyList.SetFocus;
end;

function SKeysOf(c: TecCommandItem): string;
begin
  Result:= '';
  if c.KeyStrokes.Count>0 then
    Result:= Result + c.KeyStrokes.Items[0].AsString+' ';
  if c.KeyStrokes.Count>1 then
    Result:= Result + c.KeyStrokes.Items[1].AsString+' ';
end;

procedure TfmSetup.ListKeys;
var
  i, j, k: integer;
  //info: TScrollInfo;
  old: string;
  g: TGridRect;
begin
  with KeyList do
  begin
    ColWidths[0]:= 0;
    ColWidths[1]:= Width - 2*DefaultColWidth - 32;
    Cells[1,0]:= DKLangConstW('Action');
    Cells[2,0]:= DKLangConstW('Key1');
    Cells[3,0]:= DKLangConstW('Key2');
    RowCount:= 2;
    j:=1;
    old:='';

    for k:=0 to cbKeyCat.Items.Count-1 do //categories
    for i:=0 to KeyMapping.Items.Count-1 do //items
    //item filtered?
    if SSubstringMatch(KeyMapping.Items[i].DisplayName, edFilter.Text) or
      SSubstringMatch(SKeysOf(KeyMapping.Items[i]), edFilter.Text) then
    if KeyMapping.Items[i].Category = cbKeyCat.Items[k] then
    begin
      if not KeyMapping.Items[i].Customizable then Continue;
      if KeyMapping.Items[i].Command = -1 then //unused items
        begin KeyMapping.Items[i].KeyStrokes.Clear; Continue; end;

      RowCount:=j+1;
      KeyList.RowHeights[KeyList.RowCount-1]:= KeyList.RowHeights[0];

      //add category
      if old<>KeyMapping.Items[i].Category then
      begin
        Cells[0,j]:='-';
        Cells[1,j]:=KeyMapping.Items[i].Category;
        Cells[2,j]:= '';
        Cells[3,j]:= '';
        old:=Cells[1,j];
        inc(j);
        RowCount:=j+1;
      end;
      //add item
      Cells[0,j]:=IntToStr(i);
      Cells[1,j]:=KeyMapping.Items[i].DisplayName;
      Cells[2,j]:= '';
      Cells[3,j]:= '';
      if KeyMapping.Items[i].KeyStrokes.Count>0 then Cells[2,j]:=KeyMapping.Items[i].KeyStrokes.Items[0].AsString;
      if KeyMapping.Items[i].KeyStrokes.Count>1 then Cells[3,j]:=KeyMapping.Items[i].KeyStrokes.Items[1].AsString;
      inc(j);
    end;
  end;

  if edFilter.Text='' then
    cbKeyCatChange(Self);

  //scrollbar
  {FillChar(info, SizeOf(info), 0);
  with info do begin
   cbsize := SizeOf(info);
   fmask  := SIF_ALL;
   GetScrollInfo(KeyList.Handle, SB_VERT, info);
   fmask := fmask or SIF_PAGE;
   nPage := 22 * (nmax - nmin) div j;
  end;
  SetScrollInfo(KeyList.Handle, SB_VERT, info, True);}

  g.Left:=2; g.Top:=2; g.Right:=2; g.Bottom:=2;
  KeyList.Selection:=g;
end;

procedure TfmSetup.KeyListMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  c,r: integer;
  p: TPoint;
begin
  KeyList.MouseToCell(x,y,c,r);
  if (c<0)or(r<0)then exit
  else if (r=0)or(c=0) then KeyList.Hint:=''
  else KeyList.Hint:=KeyList.Cells[c,r];
  //p:=KeyList.CellRect(c,r-1).TopLeft;
  p:=Point(x,y);
  Application.ActivateHint( KeyList.ClientToScreen(p) );
end;

procedure TfmSetup.KeyListSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
var r: TGridRect;
begin
  KeyList.Repaint;
  if ARow=0 then exit;
  if KeyList.Cells[0,ARow]='-' then begin
    inc(ARow);
    ACol:=0;
  end;
  if (ACol<2) then begin
    r.Left:=2;
    r.Top:=ARow;
    r.Right:=2;
    r.Bottom:=ARow;
    KeyList.Selection:=r;
    CanSelect:=false;
    ACol:=2;
  end;
  if KeyList.Cells[ACol,ARow]<>'' then
    ecHotKey.Text:=KeyMapping.Items[StrToInt(KeyList.Cells[0,ARow])].KeyStrokes[ACol-2].AsString
  else
    ecHotKey.Text:='';
  ecHotKeyChange(Self);
end;

procedure TfmSetup.KeyListDrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  r: TRect;
  s: WideString;
begin
  if (ARow=0) or (ACol=0) then Exit;
  //category
  if KeyList.Cells[0,ARow]='-' then begin
    r:=Rect;
    Inc(r.Right);
    KeyList.Canvas.FillRect(r);
    KeyList.Canvas.Font.Color:=clNavy;
    KeyList.Canvas.Font.Style:=KeyList.Canvas.Font.Style+[fsBold];
    s:= KeyList.Cells[ACol, ARow];
    TextOutW(KeyList.Canvas.Handle, Rect.Left+2, Rect.Top+2, PWChar(s), Length(s));
  end;
  //selection line
  if ARow=KeyList.Selection.Top then begin
    if ACol=KeyList.Selection.Left then
      KeyList.Canvas.Brush.Color:=clHighlight
    else
      KeyList.Canvas.Brush.Color:=clMedGray;
    KeyList.Canvas.FillRect(Rect);
    s:= KeyList.Cells[ACol, ARow];
    TextOutW(KeyList.Canvas.Handle, Rect.Left+2, Rect.Top+2, PWChar(s), Length(s));
  end;
end;

procedure TfmSetup.KeyListClick(Sender: TObject);
begin
  KeyList.Repaint;
  ecHotKeyChange(Self);
end;

procedure TfmSetup.KeyListMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
begin
  Handled:=true;
  with KeyList do
  if TopRow>Mouse.WheelScrollLines then
    TopRow:=TopRow-Mouse.WheelScrollLines
  else
    TopRow:=1;
end;

procedure TfmSetup.KeyListMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: Boolean);
begin
  Handled:=true;
  with KeyList do
  if TopRow<RowCount-VisibleRowCount then
    TopRow:=TopRow+Mouse.WheelScrollLines;
end;

//set
procedure TfmSetup.bKeySetClick(Sender: TObject);
var
  i,j,c,r: integer;
  s: string;
  ovr_i, ovr_j: integer;
  cfm: boolean;
begin
  if ecHotKey.Text='' then Exit;
  c:= KeyList.Selection.Left;
  r:= KeyList.Selection.Top;
  ovr_i:= -1;
  ovr_j:= -1;

  with KeyMapping do
   for i:=0 to Items.Count-1 do
    for j:=0 to Items[i].KeyStrokes.Count-1 do
      if Items[i].KeyStrokes[j].AsString=ecHotKey.Text then
      begin
        s:= DKLangConstW('KeyUsed')+#13 + Items[i].Category + ' / ' + Items[i].DisplayName;
        cfm:= MessageBoxW(Handle, PWChar(s + #13#13 + DKLangConstW('KeyOvr')),
          'SynWrite', mb_okcancel or mb_iconwarning) = id_ok;
        if cfm then
          begin ovr_i:= i; ovr_j:= j; Break; end
        else
          Exit;
      end;

  //delete duplicate key
  if (ovr_i>=0) and (ovr_j>=0) then
  begin
    KeyMapping.Items[ovr_i].KeyStrokes.Delete(ovr_j);
    for i:= 0 to KeyList.RowCount-1 do
      if StrToIntDef(KeyList.Cells[0, i], -1)=ovr_i then
      begin
        KeyList.Cells[ovr_j+2, i]:= '';
        if ovr_j=0 then
        begin
          KeyList.Cells[2, i]:=KeyList.Cells[3, i];
          KeyList.Cells[3, i]:='';
        end;
      end;
  end;

  //set new key
  i:=StrToIntDef(KeyList.Cells[0,r], -1);
  if i<0 then Exit;
  if KeyMapping.Items[i].KeyStrokes.Count>(c-2) then
  begin
    KeyMapping.Items[i].KeyStrokes.Items[c-2].KeyDefs.Items[0].ShortCut:= ecHotKey.HotKey;
    KeyList.Cells[c,r]:= ecHotKey.Text;
  end
  else
  begin
    KeyMapping.Items[i].KeyStrokes.Add.KeyDefs.Add.ShortCut:= ecHotKey.HotKey;
    KeyList.Cells[ KeyMapping.Items[i].KeyStrokes.Count+1 ,r]:= ecHotKey.Text;
  end;
  bKeyClr.Enabled:=true;
end;

//clear
procedure TfmSetup.bKeyClrClick(Sender: TObject);
var
 c,r: integer;
begin
  c:=KeyList.Selection.Left;
  r:=KeyList.Selection.Top;
  if c=2 then KeyList.Cells[2, r]:=KeyList.Cells[3, r];
  KeyList.Cells[3, r]:='';
  KeyMapping.Items[ strtoint(KeyList.Cells[0, r]) ].KeyStrokes.Delete(c-2);
  ecHotKey.Text:='';
  ecHotKeyChange(Self);
end;

procedure TfmSetup.ecHotKeyChange(Sender: TObject);
begin
  bKeySet.Enabled:= ecHotKey.Text<>'';
  bKeyFn.Enabled:= ecHotKey.Text<>'';

  with KeyList do
    if (Selection.Left<ColCount) and
      (Selection.Top<RowCount) then
    bKeyClr.Enabled:= Cells[Selection.Left, Selection.Top]<>'';
end;

//misc
procedure TfmSetup.tabFilesShow(Sender: TObject);
begin
  if tabFiles.Tag<>0 then Exit;

  with fmMain do
  begin
    cbNotif.ItemIndex:= opNotif;
    cbOverRO.Checked:= opAskOverwrite;
    cbText_.ItemIndex:= opTextOnly;
    edOem.Text:= opOem;
    edUTF8.Text:= opUTF8;
    edBigSize.Value:= opBigSize;
    cbTail.Checked:= opFollowTail;
    cbUniNeed.ItemIndex:= opUnicodeNeeded;
  end;

  tabFiles.Tag:= 1;
end;

procedure TfmSetup.b2Click(Sender: TObject);
begin
  FontDialog.Font:=b2.Font;
  if FontDialog.Execute then b2.Font:=FontDialog.Font;
end;

procedure TfmSetup.b3Click(Sender: TObject);
begin
  FontDialog.Font:=b3.Font;
  if FontDialog.Execute then b3.Font:=FontDialog.Font;
end;

procedure TfmSetup.FormShow(Sender: TObject);
var
  i, n: Integer;
begin
  FLangChanged:= false;

  ListCat.Items.Clear;
  for i:= 0 to Tabs.PageCount-1 do
  begin
    Tabs.Pages[i].TabVisible:= false;
    ListCat.Items.Add(' '+(Tabs.Pages[i] as TTntTabSheet).Caption);
  end;

  if fmMain.opTabOptionsIndex<0 then
    ListCat.ItemIndex:= fmMain.opTabOptionsLast
  else
    ListCat.ItemIndex:= fmMain.opTabOptionsIndex;
  ListCatClick(Self);

  n:= KeyList.RowHeights[0];
  n:= ScaleFontSize(n, Self);
  for i:= 0 to KeyList.RowCount-1 do
    KeyList.RowHeights[i]:= n;
end;

procedure TfmSetup.FontDialogShow(Sender: TObject);
begin
  WndCenter(FontDialog.Handle, Self);
end;

procedure TfmSetup.tabIntfShow(Sender: TObject);
var i: integer;
begin
  if tabIntf.Tag<>0 then Exit;
  with fmMain do
  begin
    cbMenu.Checked:=Menu.Visible;
    cbStat.Checked:=Status.Visible;
    cbChar.Checked:=opChInf;
    cbMicroMap.Checked:=opMicroMap;
    cbRoStart.Checked:=opStartRO;

    cbEsc.ItemIndex:=opEsc;
    cbInst.Checked:=opSingleInstance;

    //Fill lexers
    edLex.Items.Add(' '+DKLangConstW('None'));
    with SyntaxManager do
      for i:= 0 to AnalyzerCount-1 do
        if not Analyzers[i].Internal then
          edLex.Items.Add(Analyzers[i].LexerName);
    with edLex do
      if opNewLex='' then
        ItemIndex:= 0
      else
        ItemIndex:= Items.IndexOf(opNewLex);
    edEnc.ItemIndex:= opNewEnc;
    edLE.ItemIndex:= opNewLineEnds;
  end;
  tabIntf.Tag:=1;

  //lang
  with cbLang do begin
    Items.Clear;
    for i:= 0 to LangManager.LanguageCount-1 do
      Items.Add(LangManager.LanguageNames[i]);
    ItemIndex:= LangManager.LanguageIndex;
  end;
end;

procedure TfmSetup.tabACPShow(Sender: TObject);
begin
  if tabACP.Tag<>0 then Exit;
  with fmMain do
  begin
    cbAcpHtm.Checked:= opAcpHtm;
    cbAcpCss.Checked:= opAcpCss;
    cbAcpTabbing.Checked:= opAcpTabbing;
    cbTplTabbing.Checked:= opTemplateTabbing;
    edTplTabEx.Text:= opTemplateTabbingExcept; 
    cbACloseTags.Checked:= opAutoCloseTags;

    cbACloseBr.Checked:= opAutoCloseBrackets;
    cbACloseBrEsc.Checked:= opAutoCloseBracketsNoEsc;
    cbACloseQ.Checked:= opAutoCloseQuotes;
    cbACloseBrClick(Self);

    cbAcpUseSingle.Checked:= opAcpUseSingle;
    edAcpNum.Value:= opAcpNum;
    cbAcpNone.Checked:= ecACP.ShowWhenNone;
    cbAcpFilter.ItemIndex:= integer(ecACP.FilterType);
    cbAcpFile.Checked:= opAcpFile;
    cbAcpFileClick(Self);
    edAcpFileChars.Value:= opAcpFileChars;
    edAcpFileSize.Value:= opAcpFileSize;
    edAcpDrop.Value:= ecACP.DropDownCount;
  end;
  tabACP.Tag:=1;
end;

procedure TfmSetup.bClrFSClick(Sender: TObject);
begin
  fmMain.TBXItemClrClick(Self);
  bClrFS.Enabled:= false;
end;

procedure TfmSetup.bClrSRClick(Sender: TObject);
begin
  fmMain.DoClearHistory;
  bClrSR.Enabled:= false;
end;

procedure TfmSetup.tabEd2Show(Sender: TObject);
var
  i: Integer;
begin
  if tabEd2.Tag<>0 then Exit;

  cbStaples.Items.Clear;
  for i:= 0 to Ord(psClear) do
    cbStaples.Items.Add('-'); //empty items for line styles

  with fmMain do
  begin
    edInd.Value:=TemplateEditor.BlockIndent;
    edTab_.Text:=TemplateEditor.TabList.AsString;
    edULimit.Value:=TemplateEditor.UndoLimit;
    case TemplateEditor.TabMode of
      tmSpaces:   edTabMode.ItemIndex:=0;
      tmTabChar:  edTabMode.ItemIndex:=1;
      tmSmartTab: edTabMode.ItemIndex:=2;
    end;
    cbTabSp.Checked:=opTabsReplace;
    edTabModeChange(Self);

    cbLink.Checked:=opLink;
    cbUrlClick.Checked:=opSingleClickURL;
    cbCaret.Checked:=soAlwaysShowCaret in TemplateEditor.Options;
    cbRuler.Checked:=TemplateEditor.HorzRuler.Visible;
    cbHideCur.Checked:=soHideCursorOnType in TemplateEditor.Options;
    cbDFocus.Checked:=soDrawCurLineFocus in TemplateEditor.Options;
    cbDLBack.Checked:=TemplateEditor.DefaultStyles.CurrentLine.Enabled;
    cbMar.Checked:=TemplateEditor.ShowRightMargin;
    edMar.Value:=TemplateEditor.RightMargin;
    edLSpace.Value:=TemplateEditor.LineSpacing;
    edNums.ItemIndex:=Ord(TemplateEditor.LineNumbers.NumberingStyle);
    cbColorOnEmpty.Checked:= not (soNormalSelToLineEnd in TemplateEditor.OptionsEx);
    edStapleOffset.Value:=TemplateEditor.StapleOffset;
    cbStaples.ItemIndex:= Ord(TemplateEditor.StaplePen.Style);
    cbCopyLineNSel.Checked:= opCopyLineIfNoSel;
    cbDWrapMark.Checked:= opShowWrapMark;
    cbSmHi.Checked:=opSmartHi;
    cbSmHiCase.Checked:=opSmartHiCase;
    cbBrHi.Checked:=opBracketHi;
    cbBkUndo.Checked:=opBkUndo;
    cbShowCol.Checked:= opShowCurrentColumn;

    cbNPrintShow.Checked:= opNonPrint;
    cbNPrintSp.Checked:= opNonPrintSpaces;
    cbNPrintEol.Checked:= opNonPrintEol;
    cbNPrintEolEx.Checked:= opNonPrintEolDetail;
  end;
  tabEd2.Tag:=1;
end;

procedure TfmSetup.bKeyFnClick(Sender: TObject);
var i,j,k:Integer; g:TGridRect;
begin
  if ecHotKey.Text='' then Exit;
  for i:= 1 to KeyList.RowCount-1 do
    for j:= 2 to 3 do
      if (KeyList.Cells[j,i]=ecHotKey.Text) then begin
        g.Left:=j; g.Top:=i; g.Right:=g.Left; g.Bottom:=g.Top;
        k:=i-2;
        if k<1 then k:=1;
        if k>KeyList.RowCount-KeyList.VisibleRowCount then
          k:=KeyList.RowCount-KeyList.VisibleRowCount;
        KeyList.TopRow:=k;
        KeyList.Selection:=g;
        KeyList.Repaint;
        bKeyClr.Enabled:=true;
        Exit;
      end;
  MessageBoxW(Handle, PWChar(DKLangConstW('KeyNUsed')), 'SynWrite', MB_OK or mb_iconinformation);
end;

procedure TfmSetup.b4Click(Sender: TObject);
begin
  FontDialog.Font:=b4.Font;
  if FontDialog.Execute then
    b4.Font:=FontDialog.Font;
end;

procedure TfmSetup.b5Click(Sender: TObject);
begin
  FontDialog.Font:=b5.Font;
  if FontDialog.Execute then
    b5.Font:=FontDialog.Font;
end;

procedure TfmSetup.edTabModeChange(Sender: TObject);
begin
  cbTabSp.Enabled:= edTabMode.ItemIndex=0;
end;

(*
procedure TfmSetup.bCfgClick(Sender: TObject);
const
  Opt: array[1..5] of string = (
    'Syn.ini',
    'SynState.ini',
    'SynStyles.ini',
    'SynMacros.ini',
    'SynSpell.ini'
    );
var
  sFrom, sTo: string;
  i: Integer;
begin
  bCfg.Enabled:= false;
  sFrom:= FAppDataPath + 'SynWrite\';
  sTo:= ExtractFilePath(Application.ExeName);

  //check writable access
  with TIniFile.Create(sTo + 'Syn.ini') do
  try
    WriteBool('T', 'T', true);
    if not ReadBool('T', 'T', false) then
      begin MessageBoxW(Handle, PWChar(DKLangConstW('Appn')), 'SynWrite', mb_ok or mb_iconerror); Exit end;
    EraseSection('T');
  finally
    Free;
  end;

  for i:= Low(Opt) to High(Opt) do
  begin
    FDelete(sTo + Opt[i]);
    FFileMove(sFrom + Opt[i], sTo + Opt[i]);
  end;
end;
*)

procedure TfmSetup.b6Click(Sender: TObject);
begin
  FontDialog.Font:=b6.Font;
  if FontDialog.Execute then
    b6.Font:=FontDialog.Font;
end;

procedure TfmSetup.bColorSaveClick(Sender: TObject);
var
  i:Integer;
  ok:Boolean;
begin
  with SaveDialogPre do
  begin
    InitialDir:= ExtractFileDir(ColorPreFN('-'));
    FileName:= '';
    ok:= Execute;
    FixWnd;
    if not ok then Exit;
    if ExtractFileExt(FileName) <> '.'+cColorExt then
      FileName:= FileName+'.'+cColorExt;
    with TIniFile.Create(FileName) do
    try
      EraseSection('Colors');
      for i:= 0 to cColorsNum-1 do
        WriteString('Colors_', cColors[i], ColorToString(Colors[i]));
    finally
      Free
    end;
  end;
end;

function TfmSetup.ColorPreFN(const Name: string): string;
begin
  Result:= ExtractFilePath(GetModuleName(HInstance)) + 'Template\colors\' + Name + '.'+cColorExt;
end;

procedure TfmSetup.FixWnd;
begin
  if not fmMain.SynExe then
  begin
    SetForegroundWindow(fmMain.hLister);
    SetForegroundWindow(Handle);
  end;
end;

procedure TfmSetup.bColorLoadClick(Sender: TObject);
var
  i:Integer;
  ok:Boolean;
  s:string;
begin
  with OpenDialogPre do
  begin
    InitialDir:= ExtractFileDir(ColorPreFN('-'));
    FileName:= '';
    ok:= Execute;
    FixWnd;
    if not ok then Exit;

    with TIniFile.Create(FileName) do
    try
      for i:= 0 to cColorsNum-1 do
      begin
        s:= ReadString('Colors_', cColors[i], '');
        if s<>'' then
          Colors[i]:= StringToColor(s);
      end;
    finally
      Free
    end;
  end;

  ListColorsClick(Self);
  ListColors.Invalidate;
end;

procedure TfmSetup.bDirLastClick(Sender: TObject);
var S: Widestring;
begin
  S:= edDirLast.Text;
  if WideSelectDirectory('', '', S) then
    edDirLast.Text:= S;
end;

procedure TfmSetup.tabHistShow(Sender: TObject);
begin
  if tabHist.Tag<>0 then Exit;

  with fmMain do
  begin
    edFS.Value:=opSaveState;
    edSR.Value:=opSaveSRHist;
    cbHCaret.Checked:=opSaveCaret;
    cbHEnc.Checked:=opSaveEnc;
    cbHTemp.Checked:=opStateForTemp;
    cbMru.Checked:=opMruCheck;
    cbSavePos.Checked:=opSavePos;
    cbDirLast.ItemIndex:= opLastDir;
    edDirLast.Text:= opLastDirPath;
    cbBak.ItemIndex:= opBak;
  end;

  tabHist.Tag:=1;
end;

procedure TfmSetup.cbKeyCatChange(Sender: TObject);
var
  s: Widestring;
  i: Integer;
  r: TGridRect;
begin
  with cbKeyCat do
    s:= Items[ItemIndex];
  with KeyList do
    for i:= 0 to RowCount-1 do
      if (Cells[0,i] = '-') and
         (Cells[1,i] = s) then
      begin
        TopRow:= i;
        r.Top:= TopRow+1;
        r.Bottom:= r.Top;
        r.Left:= 2;
        r.Right:= 2;
        Selection:= r;
        Repaint;
        Break
      end;
end;

procedure TfmSetup.labDateClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpDateFmt, Handle);
end;

procedure TfmSetup.tabSearchShow(Sender: TObject);
begin
  if tabSearch.Tag<>0 then Exit;

  with fmMain do
  begin
    edSrMaxTreeMatches.Value:=opMaxTreeMatches;
    edSrOffsetY.Value:=opSrOffsetY;
    cbSrExpand.Checked:=opSrExpand;
    cbSrOnTop.Checked:=opSrOnTop;
    cbSrWord.Checked:=opSrSuggestWord;
    cbSrSel.Checked:=opSrSuggestSel;
    cbSrQsCap.Checked:=opQsCap;
  end;

  tabSearch.Tag:=1;
end;

procedure TfmSetup.cbSessSaveClick(Sender: TObject);
begin
  cbSessDef.Enabled:= cbSessSave.Checked;
end;

procedure TfmSetup.edFilterChange(Sender: TObject);
begin
  TimerFilt.Enabled:= false;
  TimerFilt.Enabled:= true;
end;

procedure TfmSetup.TimerFiltTimer(Sender: TObject);
begin
  TimerFilt.Enabled:= false;
  ListKeys;
end;

procedure TfmSetup.cbStaplesDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with cbStaples.Canvas do
  begin
    Brush.Color:= clWindow;
    FillRect(Rect);
    Pen.Color:= clBlack;
    Pen.Style:= TPenStyle(Index);
    Pen.Width:= 1;
    MoveTo(Rect.Left+4, (Rect.Top+Rect.Bottom)div 2);
    LineTo(Rect.Right-4, (Rect.Top+Rect.Bottom)div 2);
    MoveTo(Rect.Left+4, (Rect.Top+Rect.Bottom)div 2+1);
    LineTo(Rect.Right-4, (Rect.Top+Rect.Bottom)div 2+1);
    if odSelected in State then
    begin
      Brush.Style:= bsClear;
      Pen.Color:= clNavy;
      Pen.Style:= psSolid;
      InflateRect(Rect, -1, -1);
      Rectangle(Rect);
    end;
  end;
end;

procedure TfmSetup.edIndKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_ESCAPE then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
  if key=VK_RETURN then
  begin
    bOk.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmSetup.bFiltClearClick(Sender: TObject);
begin
  edFilter.Text:= '';
  TimerFilt.Enabled:= false;
  ListKeys;
end;

procedure TfmSetup.tabASaveShow(Sender: TObject);
begin
  if tabASave.Tag<>0 then Exit;
  with fmMain do
  begin
    cbASaveTimer.Checked:= opASaveOnTimer;
    cbASaveFocus.Checked:= opASaveOnFocus;
    edASaveTime.Value:= opASaveTimeMin;
    cbASaveAllFiles.Checked:= opASaveAllFiles;
    cbASaveCurrFile.Checked:= not opASaveAllFiles;
    edASaveMaxSize.Value:= opASaveMaxSizeKb;
    cbASaveUnIgnore.Checked:= opASaveUnnamed=0;
    cbASaveUnShowSave.Checked:= opASaveUnnamed=1;
    cbASaveUnSaveToDir.Checked:= opASaveUnnamed=2;
    edASaveUnnamedDir.Text:= opASaveUnnamedDir;
    cbASaveTimerClick(Self);
    cbASaveUnnamedClick(Self);
  end;
  tabASave.Tag:= 1;
end;

procedure TfmSetup.bUnnamedBrowseClick(Sender: TObject);
var S: Widestring;
begin
  S:= SExpandVars(edASaveUnnamedDir.Text);
  if WideSelectDirectory('', '', S) then
    edASaveUnnamedDir.Text:= S;
end;

procedure TfmSetup.cbASaveUnnamedClick(Sender: TObject);
var en: boolean;
begin
  en:= cbASaveUnSaveToDir.Checked;
  edASaveUnnamedDir.Enabled:= en;
  bUnnamedBrowse.Enabled:= en;
end;

procedure TfmSetup.cbASaveTimerClick(Sender: TObject);
var
  en: boolean;
begin
  en:= cbASaveTimer.Checked;
  edASaveTime.Enabled:= en;
  labASaveTime.Enabled:= en;
end;

procedure TfmSetup.labSmTabHelpClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpSmartTabbing, Handle);
end;

procedure TfmSetup.labTplHelpClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpCodeTpl, Handle);
end;

procedure TfmSetup.labAutoCloseHelpClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpAutoClose, Handle);
end;

procedure TfmSetup.cbACloseBrClick(Sender: TObject);
begin
  cbACloseBrEsc.Enabled:= cbACloseBr.Checked or cbACloseQ.Checked;
end;

procedure TfmSetup.cbAcpFileClick(Sender: TObject);
var en: boolean;
begin
  en:= cbAcpFile.Checked;
  edAcpFileChars.Enabled:= en;
  edAcpFileSize.Enabled:= en;
  LabelAcpFileChars.Enabled:= en;
  LabelAcpFileSize.Enabled:= en;
end;

procedure TfmSetup.ListColorsDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  cw = 16; //color rect width
  cNone = '?';
var
  NFont: TColor;
  R1, R2: TRect;
begin
  R1:= Types.Rect(Rect.Left+1, Rect.Top, Rect.Left+cw, Rect.Bottom);
  R2:= Types.Rect(Rect.Left+cw+3, Rect.Top, Rect.Right, Rect.Bottom);
  with ListColors.Canvas do
  begin
    Brush.Color:= clWindow;
    FillRect(Rect);
    Brush.Color:= Colors[cColorsOrder[Index]];
    if Brush.Color<>clNone then
      FillRect(R1)
    else
    begin
      {
      //fill using diagonal lines
      Brush.Style:= bsBDiagonal;
      Brush.Color:= clWhite;
      FillRect(R1);
      Brush.Style:= bsSolid;
      }
      //draw "?" char
      NFont:= Font.Color;
      Font.Color:= clWindowText;
      Brush.Color:= clWindow;
      TextOut((R1.Left + R1.Right) div 2 - TextWidth(cNone) div 2, R1.Top, cNone);
      Font.Color:= NFont;
    end;

    if odSelected in State then
    begin
      Brush.Color:= clHighlight;
      Pen.Color:= clHighlightText;
    end
    else
    begin
      Brush.Color:= clWindow;
      Pen.Color:= clWindowText;
    end;
    FillRect(R2);
    ecTextOut(ListColors.Canvas, R2.Left, R2.Top, ListColors.Items[Index]);
  end;
end;

procedure TfmSetup.ListCatClick(Sender: TObject);
begin
  Tabs.ActivePageIndex:= ListCat.ItemIndex;
end;

procedure TfmSetup.tabTabsShow(Sender: TObject);
var
  i: Integer;
begin
  if tabTabs.Tag<>0 then Exit;

  with fmMain do
  begin
    cbTabBtn.Checked:=opTabBtn;
    cbTabVis.ItemIndex:=opTabVisible;
    cbTabNums.Checked:=opTabNums;
    cbTabMul.Checked:=opTabMultiLine;
    cbTabDown.Checked:=opTabAtBottom;
    cbTabSw.Checked:=opTabSwitcher;
    cbTabDnD.Checked:=opTabDragDrop;
    cbTabDbl.Checked:=opTabDblClick;
    edTabMaxLen.Value:=opTabMaxLen;

    ListTabColors.Items.Clear;
    for i:= 0 to High(ColorsOfTabs) do
    begin
      ColorsOfTabs[i]:= opTabColors[i];
      ListTabColors.Items.Add(IntToStr(i));
    end;
  end;

  tabTabs.Tag:= 1;
end;

procedure TfmSetup.tabFontsShow(Sender: TObject);
begin
  if tabFonts.Tag<>0 then Exit;

  with fmMain do
  begin
    b1.Font:= TemplateEditor.Font;
    b2.Font:= TemplateEditor.LineNumbers.Font;
    b3.Font:= Tree.Font;
    b4.Font:= TemplateEditor.HorzRuler.Font;
    b5.Font:= ecACP.Font;
    b6.Font:= ListOut.Font;
  end;

  tabFonts.Tag:= 1;
end;

procedure TfmSetup.tabTreeShow(Sender: TObject);
begin
  if tabTree.Tag<>0 then Exit;

  with fmMain do
  begin
    cbTreeSync.Checked:=Tree.AutoSynchronize;
    cbTreeDelay.Value:= Tree.UpdateDelay;

    //cbMapVScroll.Checked:= opMapVScroll;
    edMapZoom.Value:= opMapZoom;
  end;

  tabTree.Tag:= 1;
end;

procedure TfmSetup.tabSessShow(Sender: TObject);
begin
  if tabSess.Tag<>0 then Exit;

  with fmMain do
  begin
    cbSessSave.Checked:=opHistSessionSave;
    cbSessLoad.Checked:=opHistSessionLoad;
    cbSessDef.Checked:=opHistSessionDef;
    cbSessSaveClick(Self);
    cbProjSave.Checked:=opHistProjectSave;
    cbProjLoad.Checked:=opHistProjectLoad;
  end;

  tabSess.Tag:= 1;
end;

procedure TfmSetup.tabMiscShow(Sender: TObject);
begin
  if tabMisc.Tag<>0 then Exit;

  with fmMain do
  begin
    edMovX.Value:= opCaretMoveX;
    edMovY.Value:= opCaretMoveY;
    edDateFmt.Text:= opDateFmt;
    edDateFmtP.Text:= opDateFmtPLog;

    with cbZenProfile do
    begin
      Items.LoadFromFile(SynDir + 'Tools\emmet.txt');
      ItemIndex:= Items.IndexOf(opZenProfile);
    end;

    cbRecColors.ItemIndex:= opShowRecentColors;
    cbSortMode.ItemIndex:= Ord(opSortMode);
    cbGroupLexers.Checked:= opLexerCat;
    cbStripBk.Checked:= opStripBkmk;
    cbFullTitle.Checked:= opTitleFull;
    cbMenuIcon.Checked:= opMenuIcon;
    cbTips.Checked:= opTipsToken;
    cbBeep.Checked:= opBeep;
  end;

  tabMisc.Tag:= 1;
end;

procedure TfmSetup.cbLangChange(Sender: TObject);
begin
  FLangChanged:= true;
end;

procedure TfmSetup.ListTabColorsDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  c: TColor;
begin
  C:= ColorsOfTabs[Index];
  ListTabColors.Canvas.Brush.Color:= c;
  ListTabColors.Canvas.FillRect(Rect);
  if odSelected in State then
  begin
    ListTabColors.Canvas.Brush.Color:= clBlack;
    ListTabColors.Canvas.FrameRect(Rect);
  end;
end;

procedure TfmSetup.ListTabColorsDblClick(Sender: TObject);
var
  N: Integer;
begin
  N:= ListTabColors.ItemIndex;
  if N<0 then Exit;
  with TColorDialog.Create(nil) do
  try
    Options:= Options+[cdFullOpen];
    Color:= ColorsOfTabs[N];
    if Execute then
    begin
      ColorsOfTabs[N]:= Color;
      ListTabColors.Invalidate;
    end;
  finally
    Free
  end;
end;

procedure TfmSetup.ListTabColorsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_space) then
  begin
    ListTabColorsDblClick(Self);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSetup.bAddFolderClick(Sender: TObject);
var s: Widestring;
begin
  s:= '';
  if WideSelectDirectory('', '', s) then
    edFolders.Lines.Add(s);
  SetFocus;//TC
end;

procedure TfmSetup.edFoldersKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) then
  begin
    bCan.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmSetup.tabFoldersShow(Sender: TObject);
begin
  if tabFolders.Tag<>0 then Exit;
  SStringToList(fmMain.opProjPaths, edFolders.Lines);
  tabFolders.Tag:= 1;
end;

procedure TfmSetup.tabSpellShow(Sender: TObject);
begin
  if tabSpell.Tag<>0 then Exit;

  with fmMain do
  begin
    cbSpellEn.Checked:= opSpellEn;
    edSpellExt.Text:= opSpellExt;
  end;

  tabSpell.Tag:= 1;
end;

procedure TfmSetup.labDictWwwClick(Sender: TObject);
begin
  FOpenUrl('http://www.addictivesoftware.com/dl-dictionaries.htm', Handle);
end;

procedure TfmSetup.labDictDirClick(Sender: TObject);
begin
  FExecute(fmMain.SynDictDir, '', '', Handle);
end;

procedure TfmSetup.bSpellOptClick(Sender: TObject);
begin
  fmMain.DoSpellCfg(nil);
end;

procedure TfmSetup.tabOvrShow(Sender: TObject);
var
  i: Integer;
begin
  if tabOvr.Tag<>0 then Exit;

  fmOvr:= TfmSetupOvr.Create(Self);
  fmOvr.Parent:= tabOvr;
  fmOvr.Align:= alClient;
  fmOvr.BorderStyle:= bsNone;

  with fmOvr do
  begin
    FString:= fmMain.opLexersOverride;
    FDefTabStop:= fmMain.TemplateEditor.TabList.AsString;
    case fmMain.TemplateEditor.TabMode of
      tmSpaces: FDefTabMode:= 0;
      tmTabChar: FDefTabMode:= 1;
      tmSmartTab: FDefTabMode:= 2;
    end;
    FDefMargin:= fmMain.TemplateEditor.RightMargin;
    FDefSpacing:= fmMain.TemplateEditor.LineSpacing;

    with fmMain.SyntaxManager do
      for i:= 0 to AnalyzerCount-1 do
        if not Analyzers[i].Internal then
          ListLex.Items.Add(Analyzers[i].LexerName);
  end;
  fmOvr.Show;

  tabOvr.Tag:= 1;
end;

procedure TfmSetup.TntFormCreate(Sender: TObject);
begin
  fmOvr:= nil;
  with ListTabColors do
    ItemHeight:= ScaleFontSize(ItemHeight, Self);
  with ListColors do
    ItemHeight:= ScaleFontSize(ItemHeight, Self);

  OpenDialogPre.Filter:= cColorFilter;
  SaveDialogPre.Filter:= cColorFilter;
end;

procedure TfmSetup.TntFormDestroy(Sender: TObject);
begin
  FreeAndNil(fmOvr);
end;

procedure TfmSetup.labEmmetClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpEmmet, Handle);
end;

procedure TfmSetup.tabCaretsShow(Sender: TObject);
begin
  if tabCarets.Tag<>0 then Exit;

  with fmMain do
  begin
    cbCaretMulti.Checked:= opCaretsEnabled;
    cbCaretIndNone.Checked:= opCaretsIndicator=0;
    cbCaretIndLine.Checked:= opCaretsIndicator=1;
    cbCaretIndGutter.Checked:= opCaretsIndicator=2;
    edCaretGutterCol.Value:= opCaretsGutterBand;
    //cbCaretWidth.Position:= opCaretType;
    edCaretType.ItemIndex:= opCaretType;
  end;
  tabCarets.Tag:= 1;
end;

procedure TfmSetup.labCaretHelpClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpCarets, Handle);
end;

procedure TfmSetup.labAcpHelpClick(Sender: TObject);
begin
  ShowHelp(fmMain.SynDir, helpAcp, Handle);
end;

end.

