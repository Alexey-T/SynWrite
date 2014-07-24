{
SynWrite main UI form.
}
//SPELL word must be defined in project options (if Addict lib available)
//PERLRE word must be defined in project options
{$Q-} //Disable int-checks to avoid integer exception in TabCtrl_GetXRect
//{$define TabOrder} //Debug: show tabs switch-order in form caption
//{$define DebugAbout} //Debug: show debug info by click on "busy signal" status field
{$define FixRepaint} //Fix repaint problem when resizing SpTBX panels and moving toolbars

unit unMain;

interface

uses
  Windows, SysUtils, Messages, Controls, StdCtrls, ComCtrls, Classes, Menus, Forms,
  ActnList, Dialogs, ImgList, ExtCtrls, Graphics, IniFiles,
  TntForms, TntClasses,
  Gauges,

  {$ifdef SPELL}
  ad3LiveBase,
  ad3Configuration,
  {$endif}

  unFrame,
  unSearch,
  unSearchInList,
  unNumConv,
  unClip,
  unClips,
  unMap,
  unProj,
  unProgress,
  unSR,
  unProcLines,
  unTabSw,

  TB2Item, TB2Dock, TB2Toolbar,
  TB2MDI, TB2ExtItems,

  SpTBXItem, SpTbxMDIMRU, SpTBXDkPanels, SpTBXSkins,
  SpTBXControls, SpTBXTabs, SpTBXEditors,

  ecActns, ecPrint, ecSyntMemo, ecKeyMap, ecPropManager, ecSyntAnal,
  ecSyntTree, ecStrUtils, ecPopupCtrl, ecUnicode,
  ATSyntMemo, //after ecSyntMemo
  ATTabs,
  ATGroups,

  TntDialogs, TntStdCtrls, TntComCtrls,
  DKLang,
  PngImageList,

  unProc,
  unProcHelp,
  unProcEditor,
  ATSynPlugins,
  ATxSProc,
  ecMacroRec,
  ecExtHighlight,
  ecSpell,
  PythonEngine,
  PythonGUIInputOutput;

const
  cMaxFilesInFolder = 50;
  opMruForPlugin = false; //use recent list for Lister-plugin
  cTabColors = 10; //number of user-defined tab colors
  cFixedLeftTabs = 3; //number of fixed tabs on left panel (Tree+Project+Tabs = 3)
  cFixedWindowItems = 5; //number of fixed items in Window menu
  cMaxTreeLen = 250; //"find in files" result tree: max node length
  cMaxLinesInstantMinimap = 50*1000; //max lines for which OnScroll will update minimap instantly
  cBandFolding = 3; //index of gutter band for folding
  cDefaultCursor: array[boolean] of TCursor = (crHourGlass, crDefault);
  SynDefaultSyn = '(default).synw-session';

const
  cPyConsoleMaxCount = 1000;
  cPyConsolePrompt = '>>> ';
  cPyConsoleInit = 'print("Python", sys.version)';
  cPyConsoleClear = '-';
  cPyConsolePrint = '=';
  cPyPrefix = 'py:';
  cPyNotInited = 'Python engine not inited';
  cPyTrue = 'True';
  cPyFalse = 'False';
  cPyNone = 'None';

type
  TSynPyEvent = (
    cSynEventOnOpen,
    cSynEventOnSaveAfter,
    cSynEventOnSaveBefore,
    cSynEventOnKey,
    cSynEventOnChange,
    cSynEventOnChangeSlow,
    cSynEventOnSelect,
    cSynEventOnCaretMove,
    cSynEventOnNumber,
    cSynEventOnState,
    cSynEventOnComplete,
    cSynEventOnFuncHint,
    cSynEventOnGotoDef,
    cSynEventOnConsole,
    cSynEventOnCompare
    );
  TSynPyEvents = set of TSynPyEvent;

const
  cSynPyEvent: array[TSynPyEvent] of string = (
    'on_open',
    'on_save',
    'on_save_pre',
    'on_key',
    'on_change',
    'on_change_slow',
    'on_select',
    'on_caret_move',
    'on_num',
    'on_state',
    'on_complete',
    'on_func_hint',
    'on_goto_def',
    'on_console',
    'on_compare'
    );

type
  TSynGroupId = (
    cSynGroupCurrent,
    cSynGroupOpposite,
    cSynGroup1,
    cSynGroup2,
    cSynGroup3,
    cSynGroup4,
    cSynGroup5,
    cSynGroup6
    );

type
  TSynQuickSearchType = (
    cQsNext,
    cQsPrev,
    cQsAgain
    );

type
  TSynAddonType = (
    cAddonTypeNone,
    cAddonTypeBinPlugin,
    cAddonTypePyPlugin,
    cAddonTypeTemplate,
    cAddonTypeRoot
    );
const
  cSynAddonType: array[TSynAddonType] of string =
    ('', 'plugin', 'py-plugin', 'template', 'root-addon');
  cSynMaxPluginsInInf = 120;

type
  TSynEscMode = (
    cEscNothing,
    cEscCloseApp,
    cEscCloseTab,
    cEscCloseTabOrApp,
    cEscMinimizeApp
    );

  TSynBackup = (
    cBakNone,
    cBakAppdata,
    cBakSameDir
    );

  TSynLastDirMode = (
    cLastDirCurrentFile,
    cLastDirRemember,
    cLastDirCustom
    );

  TSynReloadMode = (
    cReloadNone,
    cReloadAuto,
    cReloadAsk
    );

  TSynAutoSaveUnnamed = (
    cAutoSaveIgnore,
    cAutoSavePromptFN,
    cAutoSaveSaveToDir
    );

  TSynRecentColors = (
    cRecColorsAutoHide,
    cRecColorsShow,
    cRecColorsHide
    );

  TSynLineCmd = (
    scmdSortAsc,
    scmdSortDesc,
    scmdSortDialog,
    scmdDedupAll,
    scmdDedupAdjacent,
    scmdUntab,
    scmdSpacesToTabs,
    scmdSpacesToTabsLead,
    scmdAlignWithSep,
    scmdRemoveBlanks,
    scmdRemoveDupBlanks,
    scmdTrimLead,
    scmdTrimTrail,
    scmdTrimAll,
    scmdRemoveDupSpaces,
    scmdReverse,
    scmdShuffle,
    scmdExtractDupsCase,
    scmdExtractDupsNoCase,
    scmdIndent,
    scmdUnIndent
    );

  TSynCopyNameCmd = (
    scmdCopyFileName,
    scmdCopyFullName,
    scmdCopyFilePath
    );

  TPluginList_Command = array[0..100] of record
    SCaption: Widestring;
    SHotkey: string;
    SFilename: string;
    SLexers: string;
    SCmd: string;
  end;

  TPluginList_Event = array[0..50] of record
    SFilename: string;
    SLexers: string;
    SKeycodes: string;
    Events: TSynPyEvents;
  end;

  TPluginList_Findid = array[0..30] of record
    SFilename: string;
    SLexers: string;
  end;

  TPluginList_Acp = TPluginList_FindId;

  TPluginList_Panel = array[0..10] of record
    SCaption: string;
    SFileName: string;
    FToolButton: TSpTbxTabItem;
    FDll: THandle;
    FWindow: THandle;
    FForm: Pointer;
    FSynInit: TSynInit;
    FSynOpenForm: TSynOpenForm;
    FSynCloseForm: TSynCloseForm;
    FSynAction: TSynAction;
  end;

type
  TSynLogPanelProps = record
    RegexStr: string;
    RegexIdLine,
    RegexIdCol,
    RegexIdName: Integer;
    DefFilename: Widestring;
    ZeroBase: boolean;
    Encoding: TOutputEnc;
  end;

  TSynLogPanelKind = (
    cSynLogOutput,
    cSynLogValidate
    );

  TSynFindInfo = class
    FN, Str: Widestring;
    LineNum, ColNum, Len: integer;
    constructor Create;
  end;

  TSynFindCount = class
    Matches: integer;
  end;

type
  TSynUserToolbarId = (synToolbar1, synToolbar2, synToolbar3);
  TSynDock = (sdockTop, sdockLeft, sdockRight, sdockBottom);
  TSynPanelType = (plTypeTree, plTypeClip, plTypeOut);
  TSynFileSort = (sortNone, sortDate, sortDateDesc);
  TSynSelState = (selNone, selSmall, selStream, selColumn, selCarets);
  TSynGotoTree = (tgoNext, tgoPrev, tgoParent, tgoNextBro, tgoPrevBro);
  TSynGotoMode = (goLine, goPrevBk, goNextBk, goNumBk);
  TSynTabOut = (tbOut, tbFind, tbVal, tbPluginsLog, tbConsole);
  TSynTabRight = (tbClip, tbMap, tbTextClips);
  TSynTabLeft = (tbTree, tbProj, tbTabs, tbPugin1, tbPugin2, tbPugin3, tbPugin4, tbPugin5);
  TSynCpOverride = (cp_sr_Def, cp_sr_OEM, cp_sr_UTF8, cp_sr_UTF16);

const
  cColorsNum = 59;
type
  TSynColors = array[0..cColorsNum-1] of TColor;

var
  SynCommandlineSessionFN: string;
  SynCommandlineProjectFN: string;

type
  TfmMain = class(TTntForm)
    ActionList: TActionList;
    TBXDockTop: TSpTbxDock;
    tbFile: TSpTbxToolbar;
    acOpen: TAction;
    acSave: TAction;
    acSaveAs: TAction;
    TBXItem4: TSpTbxItem;
    SD: TTntSaveDialog;
    OD: TTntOpenDialog;
    SyntaxManager: TSyntaxManager;
    PropsManager: TPropsManager;
    ecSyntPrinter: TecSyntPrinter;
    PopupEditor: TSpTbxPopupMenu;
    ImgListGutter: TTBImageList;
    TBXItemCtxCopy: TSpTbxItem;
    TBXSubmenuItemToolOpen: TSpTbxSubmenuItem;
    SyntKeyMapping: TSyntKeyMapping;
    acSetupLexer: TecCustomizeLexerPropertiesAction;
    ecCopy: TecCopy;
    ecCut: TecCut;
    ecPaste: TecPaste;
    ecSelectAll: TecSelectAll;
    ecUndo: TecUndo;
    ecRedo: TecRedo;
    ecIndent: TecIndent;
    ecUnindent: TecUnindent;
    ecLowerCase: TecLowerCase;
    ecUpperCase: TecUpperCase;
    ecToggleCase: TecToggleCase;
    TBXItemCtxCut: TSpTbxItem;
    TBXItemCtxPaste: TSpTbxItem;
    TBXItemCtxSelectAll: TSpTbxItem;
    acSetup: TAction;
    TBXDockLeft: TSpTbxMultiDock;
    TBXSubmenuItemToolSave: TSpTbxSubmenuItem;
    acExportRTF: TecExportRTFAction;
    acExportHTML: TecExportHTMLAction;
    ecCommentLines: TecCommentLines;
    ecUnCommentLines: TecUnCommentLines;
    ecSortAscending: TAction;
    ecSortDescending: TAction;
    acSetupLexLib: TAction;
    TimerTick: TTimer;
    TBXItem11: TSpTbxItem;
    TBXItem15: TSpTbxItem;
    PopupStatusEnc: TSpTBXPopupMenu;
    PopupStatusLineEnds: TSpTBXPopupMenu;
    ecReadOnly: TAction;
    tbEdit: TSpTbxToolbar;
    TBXItemTbCopy: TSpTbxItem;
    TBXItemTbCut: TSpTbxItem;
    TBXItemTbPaste: TSpTbxItem;
    TBXItemTbSelAll: TSpTbxItem;
    TBXItemTbUndo: TSpTbxItem;
    TBXItemTbRedo: TSpTbxItem;
    ecClear: TecClear;
    TBXItemTbDel: TSpTbxItem;
    tbView: TSpTbxToolbar;
    TBXItemVNonpr: TSpTbxSubmenuItem;
    TBXItemVComm: TSpTbxItem;
    TBXItemVUncom: TSpTbxItem;
    TBXSeparatorItem2: TSpTbxSeparatorItem;
    TBXItemVInd: TSpTbxItem;
    TBXItemVUnind: TSpTbxItem;
    TBXSeparatorItem3: TSpTbxSeparatorItem;
    TBXSeparatorItem4: TSpTbxSeparatorItem;
    TBXSubmenuCase: TSpTbxSubmenuItem;
    TBXItemCCLower: TSpTbxItem;
    TBXItemCCUpper: TSpTbxItem;
    ImgListTree: TImageList;
    plTree: TSpTbxDockablePanel;
    TBXDockBottom: TSpTbxMultiDock;
    TBXDockRight: TSpTbxMultiDock;
    Tree: TSyntaxTreeView;
    ecTitleCase: TAction;
    TBXItemCCTitle: TSpTbxItem;
    ecShowTree: TAction;
    TBXItemVPanelTree: TSpTBXItem;
    ecPrintAction: TecPrintAction;
    ecPreviewAction: TecPreviewAction;
    ecPageSetupAction: TecPageSetupAction;
    ecPrinterSetup: TAction;
    PrinterSetupDialog: TPrinterSetupDialog;
    TBXItemToolPrint: TSpTbxSubmenuItem;
    TBXItemPrintS: TSpTbxItem;
    TBXItemPreview: TSpTbxItem;
    TBXItemPageS: TSpTbxItem;
    TBXItemEndWin: TSpTbxItem;
    TBXItemEndUn: TSpTbxItem;
    TBXItemEndMac: TSpTbxItem;
    SyntStyles: TSyntStyles;
    ecACP: TAutoCompletePopup;
    ParamCompletion: TParamCompletion;
    TemplatePopup: TTemplatePopup;
    ecFind: TAction;
    TBXSubmenuItemTbSetup: TSpTbxSubmenuItem;
    TBXSeparatorItem1: TSpTbxSeparatorItem;
    TBXItemOOLex: TSpTbxItem;
    TBXItemOOLexLib: TSpTbxItem;
    PopupLexers: TSpTBXPopupMenu;
    ecWrap: TAction;
    ecLineNums: TAction;
    ecFolding: TAction;
    ecNonPrint: TAction;
    acReread: TAction;
    ImageListIconsStd: TImageList;
    TbxSubmenuItemTblFind: TSpTBXSubmenuItem;
    TBXItem2: TSpTbxItem;
    acNewTab: TAction;
    TBXItemToolNew: TSpTbxSubmenuItem;
    TBXItemCCInv: TSpTbxItem;
    TBXSeparatorItem10: TSpTbxSeparatorItem;
    Status: TSpTbxStatusBar;
    TBXSubmenuItemSort: TSpTbxSubmenuItem;
    TBXItemTbSortAsc: TSpTbxItem;
    TBXItemTbSortDesc: TSpTbxItem;
    ecCharPopup: TecSelCharPopup;
    TBXItemWPrior: TSpTbxItem;
    TBXSeparatorItem9: TSpTbxSeparatorItem;
    TBXItemWNext: TSpTbxItem;
    TBXSeparatorItem11: TSpTbxSeparatorItem;
    TBXItemFNext: TSpTbxItem;
    TBXItemFPrev: TSpTbxItem;
    TimerRedraw: TTimer;
    TBXItemCtxDel: TSpTbxItem;
    TBXSeparatorItem14: TSpTbxSeparatorItem;
    TBXItemCtxRedo: TSpTbxItem;
    TBXItemCtxUndo: TSpTbxItem;
    Menu: TSpTbxDock;
    tbMenu: TSpTbxToolbar;
    TBXSubmenuItemEd: TSpTbxSubmenuItem;
    TBXSubmenuItemFile: TSpTbxSubmenuItem;
    TBXItemFOpen: TSpTbxItem;
    acNewWindow: TAction;
    TBXItemFExit: TSpTbxItem;
    TBXItemFSaveAs: TSpTbxItem;
    TBXItemFSave: TSpTbxItem;
    TBXItemFReopen: TSpTbxItem;
    TBXItemFNewWin: TSpTbxItem;
    TBXItemFNew: TSpTbxItem;
    TBXSeparatorItem15: TSpTbxSeparatorItem;
    TBXSubmenuItemFNew: TSpTBXSubmenuItem;
    TBXItemFPreview: TSpTbxItem;
    TBXItemFPrint: TSpTbxItem;
    TBXItemFPageSetup: TSpTbxItem;
    TBXItemFPrinterSetup: TSpTbxItem;
    TBXSubmenuItemExport: TSpTBXSubmenuItem;
    TBXItemFExpRtf: TSpTbxItem;
    TBXItemFExpHtml: TSpTbxItem;
    PanelBg: TPanel;
    TemplateEditor: TSyntaxMemo;
    TBXSubmenuItemBk: TSpTbxSubmenuItem;
    TBXSubmenuItemBkGoto: TSpTbxSubmenuItem;
    TBXItemB0: TSpTbxItem;
    TBXItemB1: TSpTbxItem;
    TBXItemB2: TSpTbxItem;
    TBXItemB3: TSpTbxItem;
    TBXItemB4: TSpTbxItem;
    TBXItemB5: TSpTbxItem;
    TBXItemB6: TSpTbxItem;
    TBXItemB7: TSpTbxItem;
    TBXItemB8: TSpTbxItem;
    TBXItemB9: TSpTbxItem;
    TBXItemEUndo: TSpTbxItem;
    TBXItemERedo: TSpTbxItem;
    TBXSeparatorItem6: TSpTbxSeparatorItem;
    TBXItemECut: TSpTbxItem;
    TBXItemECopy: TSpTbxItem;
    TBXItemEPaste: TSpTbxItem;
    TBXItemESelectAll: TSpTbxItem;
    TBXItemEDelete: TSpTbxItem;
    TBXSeparatorItem17: TSpTbxSeparatorItem;
    TBXSubmenuItemBkSet: TSpTbxSubmenuItem;
    TBXItemG0: TSpTbxItem;
    TBXItemG1: TSpTbxItem;
    TBXItemG2: TSpTbxItem;
    TBXItemG3: TSpTbxItem;
    TBXItemG4: TSpTbxItem;
    TBXItemG5: TSpTbxItem;
    TBXItemG6: TSpTbxItem;
    TBXItemG7: TSpTbxItem;
    TBXItemG8: TSpTbxItem;
    TBXItemG9: TSpTbxItem;
    TBXSubmenuItemHelp: TSpTbxSubmenuItem;
    TBXItemHelpAbout: TSpTBXItem;
    TBXSubmenuItemOpt: TSpTbxSubmenuItem;
    TBXItemOSetup: TSpTbxItem;
    TBXItemOLexer: TSpTbxItem;
    TBXItemOLexerLib: TSpTbxItem;
    TBXSubmenuItemSr: TSpTbxSubmenuItem;
    TBXItemSGoto: TSpTbxItem;
    TBXSeparatorItem21: TSpTbxSeparatorItem;
    TBXItemSNext: TSpTbxItem;
    TBXItemSPrev: TSpTbxItem;
    TBXSeparatorItem19: TSpTbxSeparatorItem;
    TBXItemSWordNext: TSpTbxItem;
    TBXItemSWordPrior: TSpTbxItem;
    TBXSeparatorItem20: TSpTbxSeparatorItem;
    TBXItemSMarkClear: TSpTbxItem;
    TBXItemEUnindent: TSpTbxItem;
    TBXItemEIndent: TSpTbxItem;
    TBXSubmenuItem19: TSpTbxSubmenuItem;
    TBXItemESortAsc: TSpTbxItem;
    TBXItemESortDesc: TSpTbxItem;
    TBXSubmenuItem20: TSpTbxSubmenuItem;
    TBXItemECaseUpper: TSpTbxItem;
    TBXItemECaseLower: TSpTbxItem;
    TBXItemECaseTitle: TSpTbxItem;
    TBXItemECaseInvert: TSpTbxItem;
    TBXItemHelpReadmeDir: TSpTBXItem;
    TBXItemONPrint: TSpTbxItem;
    TBXItemONums: TSpTbxItem;
    TBXItemOTree: TSpTbxItem;
    TBXItemOFold: TSpTbxItem;
    TBXItemOWrap: TSpTbxItem;
    TBXItemORO: TSpTbxItem;
    TBXItemSMarkPrev: TSpTbxItem;
    TBXItemSMarkNext: TSpTbxItem;
    TBXItemETable: TSpTbxItem;
    TBXSubmenuItemLexer: TSpTbxSubmenuItem;
    TBXItemEDup: TSpTbxItem;
    DKLanguageController1: TDKLanguageController;
    TBXItemOTools: TSpTbxItem;
    TBXSeparatorItem22: TSpTbxSeparatorItem;
    TBXItemBkClear: TSpTbxItem;
    TimerHint: TTimer;
    TBXSeparatorItem26: TSpTbxSeparatorItem;
    TBXItemMarkSwap: TSpTbxItem;
    TBXItemMarkColl: TSpTbxItem;
    TBXItemMarkDrop: TSpTbxItem;
    tbQs: TSpTbxToolbar;
    TBXItemFFNext: TSpTbxItem;
    TBXItemFFPrev: TSpTbxItem;
    TBXSubmenuItemToolbars: TSpTbxSubmenuItem;
    TBXItemTQs: TSpTbxItem;
    TBXItemTView: TSpTbxItem;
    TBXItemTEdit: TSpTbxItem;
    TBXItemTFile: TSpTbxItem;
    cbCase: TSpTbxItem;
    edQs: TSpTBXEdit;
    TBControlItem1aa: TTBControlItem;
    TBXItemQs: TSpTbxItem;
    cbWord: TSpTbxItem;
    TBXItemSMarkAll: TSpTbxItem;
    TBXItemHelpTopics: TSpTBXItem;
    TBXItemFClose: TSpTbxItem;
    acClose: TAction;
    PopupTabContext: TSpTBXPopupMenu;
    TBXItemTabCloseOthers: TSpTBXItem;
    TBXItemTabClose: TSpTBXItem;
    TBXItemTabNew: TSpTBXItem;
    TBXSeparatorItem28: TSpTbxSeparatorItem;
    ImageListCloseBtn: TImageList;
    acSaveAll: TAction;
    TBXItemFSaveAll: TSpTbxItem;
    acCloseAll: TAction;
    TBXItemFCloseAll: TSpTbxItem;
    acCloseOthersThisGroup: TAction;
    TBXItemFCloseOth: TSpTbxItem;
    TBXSeparatorItem29: TSpTbxSeparatorItem;
    TBXItemFSesOpen: TSpTbxItem;
    TBXItemFSesSaveAs: TSpTbxItem;
    OD_Session: TTntOpenDialog;
    SD_Session: TTntSaveDialog;
    TBXSubmenuItemFRecents: TSpTbxSubmenuItem;
    TBXSeparatorItem30: TSpTbxSeparatorItem;
    TBXItemFClearRecents: TSpTBXItem;
    TbxSubmenuItemWindow: TSpTBXSubmenuItem;
    TBXItemETime: TSpTbxItem;
    TBXSubmenuItemRun: TSpTbxSubmenuItem;
    TBXItemTool1: TSpTBXItem;
    TBXItemTool2: TSpTBXItem;
    TBXItemTool3: TSpTBXItem;
    TBXItemTool4: TSpTBXItem;
    TBXSeparatorItem31: TSpTbxSeparatorItem;
    TBXItemRunFindPhp: TSpTbxItem;
    TBXItemRunOpenDir: TSpTbxItem;
    TBXItemTool5: TSpTBXItem;
    TBXItemTool6: TSpTBXItem;
    TBXItemTool7: TSpTBXItem;
    TBXItemTool8: TSpTBXItem;
    TBXSubmenuItemEnc: TSpTbxSubmenuItem;
    TBXSubmenuLineEnds: TSpTbxSubmenuItem;
    TBXItemEndMWin: TSpTbxItem;
    TBXItemEndMUn: TSpTbxItem;
    TBXItemEndMMac: TSpTbxItem;
    TBXSubmenuEnc: TSpTbxSubmenuItem;
    TBXSubmenuEnc2: TSpTbxSubmenuItem;
    TimerLoad: TTimer;
    ecReplace: TAction;
    TBXItemSRep: TSpTbxItem;
    TBXItemSFind: TSpTbxItem;
    TBXItem8: TSpTbxItem;
    acExit: TAction;
    TBXItemFCloseDel: TSpTbxItem;
    acCloseAndDelete: TAction;
    TBXItemRFiles: TSpTbxItem;
    ecReplaceInFiles: TAction;
    TBXItemSRepFiles: TSpTbxItem;
    TimerSel: TTimer;
    TBXSubmenuItemCtxMore: TSpTbxSubmenuItem;
    TBXItemCtxCopyUrl: TSpTbxItem;
    TBXItemCtxCopyAppend: TSpTbxItem;
    TBXItemCtxCutAppend: TSpTbxItem;
    TBXSeparatorItem34: TSpTbxSeparatorItem;
    TBXItemCtxCopyHTML: TSpTbxItem;
    TBXItemCtxCopyRTF: TSpTbxItem;
    TBXSeparatorItem35: TSpTbxSeparatorItem;
    TBXItemECutApp: TSpTbxItem;
    TBXItemECopyApp: TSpTbxItem;
    TBXItemTool9: TSpTBXItem;
    TBXItemTool10: TSpTBXItem;
    TBXItemTool11: TSpTBXItem;
    TBXItemTool12: TSpTBXItem;
    TBXItemSGoBracket: TSpTbxItem;
    plOut: TSpTbxDockablePanel;
    ListOut: TTntListBox;
    TBXItemVPanelOut: TSpTBXItem;
    ecShowOut: TAction;
    TBXItemOOut: TSpTbxItem;
    PopupOut: TSpTbxPopupMenu;
    TBXItemOutClear: TSpTBXItem;
    TBXItemOutCopySel: TSpTBXItem;
    TBXItemOutNav: TSpTBXItem;
    TBXSeparatorItem18: TSpTbxSeparatorItem;
    TBXItemOutCopyAll: TSpTBXItem;
    TBXSeparatorItem32: TSpTbxSeparatorItem;
    ImageListStatus: TImageList;
    TBXItemOutDelSel: TSpTBXItem;
    TBXItemOutDelNonparsed: TSpTBXItem;
    PopupFind: TSpTbxPopupMenu;
    TBXItemTreeFindNav: TSpTbxItem;
    TBXSeparatorItem36: TSpTbxSeparatorItem;
    TBXSeparatorItem37: TSpTbxSeparatorItem;
    acSetupLexHL: TAction;
    TBXItemOLexerHi: TSpTbxItem;
    TBXSeparatorItem38: TSpTbxSeparatorItem;
    TBXItemOOLexSt: TSpTbxItem;
    TBXItemEExtr: TSpTbxItem;
    TBXSeparatorItem39: TSpTbxSeparatorItem;
    TBXItemECaseSent: TSpTbxItem;
    TBXItemCCSent: TSpTbxItem;
    ecSentCase: TAction;
    PopupZoom: TSpTbxPopupMenu;
    TBXSeparatorItem5: TSpTbxSeparatorItem;
    TBXItemZSet300: TSpTbxItem;
    TBXItemZSet200: TSpTbxItem;
    TBXItemZSet150: TSpTbxItem;
    TBXItemZSet100: TSpTbxItem;
    TBXItemZSet75: TSpTbxItem;
    TBXItemZSet50: TSpTbxItem;
    TBXItemZSet25: TSpTBXItem;
    TBXItemZOther: TSpTbxItem;
    plClip: TSpTbxDockablePanel;
    ecShowClip: TAction;
    TBXSeparatorItem25: TSpTbxSeparatorItem;
    TBXItemOClip: TSpTbxItem;
    PopupClip: TSpTbxPopupMenu;
    TBXItemClipClr: TSpTbxItem;
    ecGotoNextFindResult: TAction;
    ecGotoPrevFindResult: TAction;
    TBXSeparatorItem40: TSpTbxSeparatorItem;
    TBXItemSResPrev: TSpTbxItem;
    TBXItemSResNext: TSpTbxItem;
    TBXItemESyncEd: TSpTbxItem;
    TBXItemFSesAdd: TSpTbxItem;
    ecFullScr: TAction;
    TBXItemOFullScr: TSpTbxItem;
    TimerBrackets: TTimer;
    TBXSeparatorItem41: TSpTbxSeparatorItem;
    TBXItemTabCopyDir: TSpTBXItem;
    TBXItemTabCopyFull: TSpTBXItem;
    TBXItemTabCopyFN: TSpTBXItem;
    TBXSeparatorItem42: TSpTbxSeparatorItem;
    TBXSeparatorItem44: TSpTbxSeparatorItem;
    TBXItemVSyncH: TSpTbxItem;
    TBXItemVSyncV: TSpTbxItem;
    ecSyncScrollH: TAction;
    ecSyncScrollV: TAction;
    TBXItemOShell: TSpTbxItem;
    TBXSubmenuItemView: TSpTbxSubmenuItem;
    TBXItemOOnTop: TSpTbxItem;
    ecOnTop: TAction;
    TBXItemEFillBlock: TSpTbxItem;
    TBXItemEInsText: TSpTbxItem;
    TBXSeparatorItem23: TSpTbxSeparatorItem;
    TBXItemCtxOpenSel: TSpTbxItem;
    TBXSeparatorItem45: TSpTbxSeparatorItem;
    TBXItemCtxTool12: TSpTBXItem;
    TBXItemCtxTool11: TSpTBXItem;
    TBXItemCtxTool10: TSpTBXItem;
    TBXItemCtxTool9: TSpTBXItem;
    TBXItemCtxTool8: TSpTBXItem;
    TBXItemCtxTool7: TSpTBXItem;
    TBXItemCtxTool6: TSpTBXItem;
    TBXItemCtxTool5: TSpTBXItem;
    TBXItemCtxTool4: TSpTBXItem;
    TBXItemCtxTool3: TSpTBXItem;
    TBXItemCtxTool2: TSpTBXItem;
    TBXItemCtxTool1: TSpTBXItem;
    TBXSeparatorItem13: TSpTbxSeparatorItem;
    TBXSeparatorItem24: TSpTbxSeparatorItem;
    TBXSubmenuItem10: TSpTbxSubmenuItem;
    TBXItemORestoreStyles: TSpTbxItem;
    TBXItemCtxCustomize: TSpTbxItem;
    ecToggleFocusTree: TAction;
    ecToggleFocusClip: TAction;
    ecZenExpand: TAction;
    TBXSeparatorItem46: TSpTbxSeparatorItem;
    ecZenWrap: TAction;
    TBXSubmenuItem13: TSpTbxSubmenuItem;
    TBXItemEComm: TSpTbxItem;
    TBXItemEUncomm: TSpTbxItem;
    TBXItemEToggleLineComment: TSpTbxItem;
    ecToggleLineComment: TAction;
    ecToggleFocusOutput: TAction;
    acBackup: TAction;
    ecToggleStreamComment: TAction;
    TBXItemEToggleStreamComment: TSpTbxItem;
    TBXSubmenuItem16: TSpTbxSubmenuItem;
    TBXSubmenuItem17: TSpTbxSubmenuItem;
    TBXItemEMoveDn: TSpTbxItem;
    TBXItemEMoveUp: TSpTbxItem;
    TBXItemHelpDonate: TSpTBXItem;
    TBXItemEDelLn: TSpTbxItem;
    TBXSeparatorItem47: TSpTbxSeparatorItem;
    TBXSubmenuItem18: TSpTbxSubmenuItem;
    TBXItemECpDirPath: TSpTbxItem;
    TBXItemECpFullPath: TSpTbxItem;
    TBXItemECpFN: TSpTbxItem;
    ecToggleFocusFindRes: TAction;
    TBXItemTbSpellCheck: TSpTbxItem;
    TBXSeparatorItem48: TSpTbxSeparatorItem;
    ecSpellCheck: TAction;
    ecSpellLive: TAction;
    TBXItemTbSpellLive: TSpTbxSubmenuItem;
    TBXItemVSpellCheck: TSpTbxItem;
    TBXItemVSpellLive: TSpTbxItem;
    TBXSeparatorItem49: TSpTbxSeparatorItem;
    TBXItemEJoin: TSpTbxItem;
    TBXItemESplit: TSpTbxItem;
    TBXSeparatorItem50: TSpTbxSeparatorItem;
    TBXSubmenuItemMacros: TSpTbxSubmenuItem;
    TBXItemMacroPlay: TSpTbxItem;
    TBXItemMacroStop: TSpTbxItem;
    TBXItemMacroRecord: TSpTbxItem;
    TBXItemMacroCancel: TSpTbxItem;
    TBXSeparatorItem51: TSpTbxSeparatorItem;
    TBXItemMacroDlg: TSpTbxItem;
    ecMacroRecord1: TecMacroRecord;
    ecMacroStop1: TecMacroStop;
    ecMacroCancel1: TecMacroCancel;
    ecMacroPlay1: TecMacroPlay;
    ecMacroDlg: TAction;
    ecMacroRecorder1: TecMacroRecorder;
    TBXItemHtmlPreview: TSpTBXItem;
    TBXSeparatorItem52: TSpTbxSeparatorItem;
    ecMacro1: TAction;
    ecMacro2: TAction;
    ecMacro3: TAction;
    ecMacro4: TAction;
    ecMacro5: TAction;
    ecMacro6: TAction;
    ecMacro7: TAction;
    ecMacro8: TAction;
    ecMacro9: TAction;
    PropsManagerKeys: TPropsManager;
    TBXSeparatorItem53: TSpTbxSeparatorItem;
    TBXItemMacro9: TSpTbxItem;
    TBXItemMacro8: TSpTbxItem;
    TBXItemMacro7: TSpTbxItem;
    TBXItemMacro6: TSpTbxItem;
    TBXItemMacro5: TSpTbxItem;
    TBXItemMacro4: TSpTbxItem;
    TBXItemMacro3: TSpTbxItem;
    TBXItemMacro2: TSpTbxItem;
    TBXItemMacro1: TSpTbxItem;
    TBXItemBkNext: TSpTbxItem;
    TBXItemBkPrev: TSpTbxItem;
    TBXItemBkToggle: TSpTbxItem;
    ecBkClearAll: TAction;
    ecBkToggle: TAction;
    ecBkNext: TAction;
    ecBkPrev: TAction;
    ecBkInverse: TAction;
    TBXItemBkInverse: TSpTbxItem;
    ecBkCopy: TAction;
    ecBkCut: TAction;
    ecBkDelete: TAction;
    ecBkDeleteUnmk: TAction;
    ecBkPaste: TAction;
    TBXItemBkDelUnmk: TSpTbxItem;
    TBXItemBkDel: TSpTbxItem;
    TBXItemBkPaste: TSpTbxItem;
    TBXItemBkCut: TSpTbxItem;
    TBXItemBkCopy: TSpTbxItem;
    TBXItemTbGoto: TSpTbxItem;
    ecGoto: TAction;
    TBXSeparatorItem12: TSpTbxSeparatorItem;
    TBXItemVSyncVert: TSpTbxItem;
    TBXItemVSyncHorz: TSpTbxItem;
    ecToggleFocusGroups: TAction;
    TBXSeparatorItem54: TSpTbxSeparatorItem;
    TBXItemECutLine: TSpTbxItem;
    TBXItemECopyLine: TSpTbxItem;
    TBXSubmenuItemTidy: TSpTbxSubmenuItem;
    TBXItemTidyCfg: TSpTbxItem;
    TBXItemTidyVal: TSpTbxItem;
    TBXSeparatorItem55: TSpTbxSeparatorItem;
    ListVal: TTntListBox;
    PopupValidate: TSpTbxPopupMenu;
    TBXItemValNav: TSpTbxItem;
    TBXSeparatorItem56: TSpTbxSeparatorItem;
    TBXItemValCopySel: TSpTBXItem;
    TBXItemValCopyAll: TSpTBXItem;
    TBXSeparatorItem57: TSpTbxSeparatorItem;
    TBXItemValClear: TSpTBXItem;
    ecToggleFocusValidate: TAction;
    TBXItemEDedupAdjacent: TSpTbxItem;
    TBXItemTbDedupAdjacent: TSpTbxItem;
    TBXSubmenuItemSess: TSpTbxSubmenuItem;
    TBXSeparatorItem59: TSpTbxSeparatorItem;
    TBXItemSessClr: TSpTbxItem;
    TBXItemFSesSave: TSpTbxItem;
    TBXItemFSesClose: TSpTbxItem;
    ecRemoveBlanks: TAction;
    TBXItemERemBlanks: TSpTbxItem;
    ecRemoveLines: TAction;
    TBXSubmenuItem1: TSpTbxSubmenuItem;
    TBXSeparatorItem60: TSpTbxSeparatorItem;
    TBXItemETrimAll: TSpTbxItem;
    TBXItemETrimTrail: TSpTbxItem;
    TBXItemETrimLead: TSpTbxItem;
    ecTrimLead: TAction;
    ecTrimTrail: TAction;
    ecTrimAll: TAction;
    ecRemoveDupSpaces: TAction;
    TBXItemERemDupSp: TSpTbxItem;
    ecTabToSp: TAction;
    ecSpToTab: TAction;
    TBXSeparatorItem61: TSpTbxSeparatorItem;
    TBXItemESpToTab: TSpTbxItem;
    TBXItemETabToSp: TSpTbxItem;
    ecFindClipNext: TAction;
    ecFindClipPrev: TAction;
    TBXSubmenuItemSessions: TSpTBXSubmenuItem;
    ecSplit50_50: TAction;
    ecSplit40_60: TAction;
    ecSplit60_40: TAction;
    ecSplit30_70: TAction;
    ecSplit70_30: TAction;
    ecSplit20_80: TAction;
    ecSplit80_20: TAction;
    TBXItemMacroRepeat: TSpTbxItem;
    ecMacroRepeat: TAction;
    TBXSeparatorItem62: TSpTbxSeparatorItem;
    ecRepeatCmd: TAction;
    TBXItemERepeatCmd: TSpTbxItem;
    TBXSepWin: TSpTbxSeparatorItem;
    TBXItemWinFRes: TSpTbxItem;
    TBXItemWinOut: TSpTbxItem;
    TBXItemWinClip: TSpTbxItem;
    TBXItemWinTree: TSpTbxItem;
    TBXItemWinVal: TSpTbxItem;
    TBXSubWin: TSpTbxSubmenuItem;
    TBXItemMarkClear: TSpTbxItem;
    ecToggleFocusMap: TAction;
    TBXItemWinMap: TSpTbxItem;
    ecFindInTree: TAction;
    ecFindInTreeNext: TAction;
    ecFindInTreePrev: TAction;
    ecTreeNext: TAction;
    ecTreePrev: TAction;
    ecReduceBlanks: TAction;
    TBXItemEReduceBlanks: TSpTbxItem;
    ecSplitLeft: TAction;
    ecSplitRight: TAction;
    ecFindNextWithExtend: TAction;
    ecFindPrevWithExtend: TAction;
    TBXItemHelpKeymap: TSpTBXItem;
    ecFindInList: TAction;
    ecFindInListNext: TAction;
    ecFindInListPrev: TAction;
    TBXItemClipFind: TSpTbxItem;
    TBXSeparatorItem64: TSpTbxSeparatorItem;
    TBXSeparatorItem65: TSpTbxSeparatorItem;
    TBXItemTreeFindFind: TSpTbxItem;
    TBXSeparatorItem66: TSpTbxSeparatorItem;
    TBXItemValFind: TSpTbxItem;
    TBXSeparatorItem67: TSpTbxSeparatorItem;
    TBXItemOutFind: TSpTBXItem;
    PopupTree: TSpTbxPopupMenu;
    TBXItemTreeFind: TSpTbxItem;
    TBXItemTreeExpand: TSpTbxItem;
    TBXItemTreeCollapse: TSpTbxItem;
    TimerAutoSave: TTimer;
    TBXItemMacro29: TSpTbxItem;
    TBXItemMacro28: TSpTbxItem;
    TBXItemMacro27: TSpTbxItem;
    TBXItemMacro26: TSpTbxItem;
    TBXItemMacro25: TSpTbxItem;
    TBXItemMacro24: TSpTbxItem;
    TBXItemMacro23: TSpTbxItem;
    TBXItemMacro22: TSpTbxItem;
    TBXItemMacro21: TSpTbxItem;
    TBXItemMacro20: TSpTbxItem;
    TBXItemMacro19: TSpTbxItem;
    TBXItemMacro18: TSpTbxItem;
    TBXItemMacro17: TSpTbxItem;
    TBXItemMacro16: TSpTbxItem;
    TBXItemMacro15: TSpTbxItem;
    TBXItemMacro14: TSpTbxItem;
    TBXItemMacro13: TSpTbxItem;
    TBXItemMacro12: TSpTbxItem;
    TBXItemMacro11: TSpTbxItem;
    TBXItemMacro10: TSpTbxItem;
    TBXItemMacro30: TSpTbxItem;
    ecMacro10: TAction;
    ecMacro11: TAction;
    ecMacro12: TAction;
    ecMacro13: TAction;
    ecMacro14: TAction;
    ecMacro15: TAction;
    ecMacro16: TAction;
    ecMacro17: TAction;
    ecMacro18: TAction;
    ecMacro19: TAction;
    ecMacro20: TAction;
    ecMacro21: TAction;
    ecMacro22: TAction;
    ecMacro23: TAction;
    ecMacro24: TAction;
    ecMacro25: TAction;
    ecMacro26: TAction;
    ecMacro27: TAction;
    ecMacro28: TAction;
    ecMacro29: TAction;
    ecMacro30: TAction;
    TreeFind: TTntTreeView;
    TBXItemTreeFindCopyToTab: TSpTbxItem;
    TBXItemTreeFindClear: TSpTbxItem;
    TBXItemTreeFindCopyToClip: TSpTbxItem;
    TBXItemTreeFindCollapse: TSpTbxItem;
    TBXItemTreeFindExpand: TSpTbxItem;
    TBXSeparatorItem69: TSpTbxSeparatorItem;
    TBXItemTreeFindExpandCur: TSpTbxItem;
    TBXItemCtxFindID: TSpTbxItem;
    ecTreeParent: TAction;
    ecTreeNextBrother: TAction;
    ecTreePrevBrother: TAction;
    TBXItemMarkGoLast: TSpTbxItem;
    TBXItemRunOpenFile: TSpTbxItem;
    TBXItemSSelToken: TSpTbxItem;
    TBXItemTreeFindCopyToClipNode: TSpTbxItem;
    TBXItemFProps: TSpTbxItem;
    acProps: TAction;
    ecInsertColor: TAction;
    TBXItemHtmlInsColor: TSpTBXItem;
    TBXSeparatorItem71: TSpTbxSeparatorItem;
    TBXItemClipCopyToEd: TSpTbxItem;
    TBXItemClipCopyToClip: TSpTbxItem;
    TBXSeparatorItem72: TSpTbxSeparatorItem;
    ecReplaceSelFromClipAll: TAction;
    acRereadOut: TAction;
    ecToggleFocusProject: TAction;
    TBXItemWinProj: TSpTbxItem;
    ecInsertImage: TAction;
    TBXItemHtmlInsImage: TSpTBXItem;
    ecToggleFocusMasterSlave: TAction;
    ecToggleSlave: TAction;
    TbxItemRunFindHtml4: TSpTbxItem;
    TbxItemRunFindHtml5: TSpTbxItem;
    ecRuler: TAction;
    TBXItemORuler: TSpTbxItem;
    ecSplitViewsVertHorz: TAction;
    ecSplitSlaveVertHorz: TAction;
    ecGotoBk: TAction;
    TBXItemBkGoto: TSpTbxItem;
    TBXItemHtmlLoremIpsum: TSpTBXItem;
    ecLoremIpsum: TAction;
    TBXSubmenuItemFav: TSpTBXSubmenuItem;
    TBXItemFavAddFile: TSpTbxItem;
    TBXItemFavManage: TSpTbxItem;
    acFavAddFile: TAction;
    acFavManage: TAction;
    TbxSubmenuItemRecentColors: TSpTbxSubmenuItem;
    ImageListColorRecent: TImageList;
    TBXItemCtxAddColor: TSpTbxItem;
    TBXItemFavAddProj: TSpTbxItem;
    acFavAddProj: TAction;
    TBXSeparatorItem75: TSpTbxSeparatorItem;
    TBXItemTabAddToProj: TSpTBXItem;
    ecToggleFocusClips: TAction;
    TbxItemWinClips: TSpTbxItem;
    PopupClips: TSpTbxPopupMenu;
    TBXItemClipsAddText: TSpTbxItem;
    TBXItemClipsEdit: TSpTbxItem;
    TBXSeparatorItem76: TSpTbxSeparatorItem;
    TBXItemClipsAddFile: TSpTbxItem;
    TBXItemClipsDir: TSpTbxItem;
    OD_Swatch: TOpenDialog;
    SD_Swatch: TSaveDialog;
    TBXTabColor: TSpTbxColorPalette;
    TBXSubmenuTabColor: TSpTbxSubmenuItem;
    TBXItemTabColorMisc: TSpTbxItem;
    TBXSeparatorItem77: TSpTbxSeparatorItem;
    TBXItemTabColorDef: TSpTbxItem;
    TBXItemClipsDelText: TSpTbxItem;
    ecSmartHl: TAction;
    TBXItemBkDropPortable: TSpTbxItem;
    ecDropPortableBk: TAction;
    TBXSeparatorItem78: TSpTbxSeparatorItem;
    ecGotoPortableBk: TAction;
    TBXItemBkGotoPortable: TSpTbxItem;
    acRename: TAction;
    TBXItemFRename: TSpTbxItem;
    TBXItemRunNumConv: TSpTbxItem;
    ecNumericConverter: TAction;
    ecIndentLike1st: TAction;
    TBXSeparatorItem33: TSpTbxSeparatorItem;
    TBXItemEIndentLike1st: TSpTbxItem;
    TBXItemViewColMarkers: TSpTbxItem;
    acColumnMarkers: TAction;
    TBXSeparatorItem79: TSpTbxSeparatorItem;
    ImageListFtp: TImageList;
    ListPLog: TTntListBox;
    PopupPluginsLog: TSpTbxPopupMenu;
    TBXItemPLogCopySel: TSpTbxItem;
    TBXItemPLogCopyAll: TSpTbxItem;
    TBXSeparatorItem81: TSpTbxSeparatorItem;
    TBXItemPLogDelete: TSpTbxItem;
    TBXItemPLogClear: TSpTbxItem;
    TBXSeparatorItem82: TSpTbxSeparatorItem;
    TBXItemPLogFind: TSpTbxItem;
    TBXItemCtxPasteNoCurChange: TSpTbxItem;
    TBXSeparatorItem80: TSpTbxSeparatorItem;
    TBXSubmenuItemEmmet: TSpTBXSubmenuItem;
    TBXItemHtmlEmmetWrap: TSpTBXItem;
    TBXItemHtmlEmmetExpand: TSpTBXItem;
    PluginACP: TAutoCompletePopup;
    ecCenterLines: TAction;
    TBXSeparatorItem83: TSpTbxSeparatorItem;
    TBXItemECenterLines: TSpTbxItem;
    ListTabs: TTntListView;
    ecToggleFocusTabs: TAction;
    TbxItemWinTabs: TSpTbxItem;
    TBXSubmenuItemPlugins: TSpTbxSubmenuItem;
    TBXSeparatorItem84: TSpTbxSeparatorItem;
    TBXItemOEditSynPluginsIni: TSpTbxItem;
    TBXItemPLogSaveAs: TSpTbxItem;
    TBXItemTabMoveToWindow: TSpTBXItem;
    TBXItemTabOpenInWindow: TSpTBXItem;
    ecEncodeHtmlChars: TAction;
    ecSortDialog: TAction;
    TBXItemESortDialog: TSpTbxItem;
    TBXSeparatorItem86: TSpTbxSeparatorItem;
    TBXItemTbSortDialog: TSpTbxItem;
    TBXItemSSelBrackets: TSpTbxItem;
    PropsManagerPrint: TPropsManager;
    TimerTree: TTimer;
    ecCollapseParent: TAction;
    ecCollapseWithNested: TAction;
    ecSpToTabLeading: TAction;
    TBXItemESpToTabLead: TSpTbxItem;
    ecToggleLineCommentAlt: TAction;
    TBXItemEToggleLineCommentAlt: TSpTbxItem;
    TBXItemCtxPasteToColumn1: TSpTbxItem;
    ecCommandsList: TAction;
    TBXItemHelpCommandList: TSpTBXItem;
    ecProjectList: TAction;
    TBXSeparatorItem90: TSpTbxSeparatorItem;
    TbxSubmenuCarets: TSpTbxSubmenuItem;
    TBXItemCaretsRemove2: TSpTbxItem;
    TBXItemCaretsRemove1: TSpTbxItem;
    TBXSeparatorItem91: TSpTbxSeparatorItem;
    TBXItemCaretsFromSelClear: TSpTbxItem;
    TBXItemCaretsFromSelRight: TSpTbxItem;
    TBXItemCaretsFromSelLeft: TSpTbxItem;
    TBXSeparatorItem92: TSpTbxSeparatorItem;
    TBXItemCaretsExtDownEnd: TSpTbxItem;
    TBXItemCaretsExtUpEnd: TSpTbxItem;
    TBXItemCaretsExtDownPage: TSpTbxItem;
    TBXItemCaretsExtUpPage: TSpTbxItem;
    TBXItemCaretsExtDownLine: TSpTbxItem;
    TBXItemCaretsExtUpLine: TSpTbxItem;
    TBXSeparatorItem93: TSpTbxSeparatorItem;
    TBXItemCaretsFromMarksClear: TSpTbxItem;
    TBXItemCaretsFromMarksRight: TSpTbxItem;
    TBXItemCaretsFromMarksLeft: TSpTbxItem;
    TBXItemEColumn: TSpTbxItem;
    ecEditColumn: TAction;
    ecDedupAll: TAction;
    ecDedupAdjacent: TAction;
    TBXSeparatorItem94: TSpTbxSeparatorItem;
    TBXItemEDedupAll: TSpTbxItem;
    TBXSeparatorItem85: TSpTbxSeparatorItem;
    TBXItemTbDedupAll: TSpTbxItem;
    TBXSeparatorItem95: TSpTbxSeparatorItem;
    TBXItemEAlignWithSep: TSpTbxItem;
    ecAlignWithSep: TAction;
    TBXItemTabToggleSplit: TSpTBXItem;
    ecToggleShowGroup2: TAction;
    TBXItemSSelExtend: TSpTbxItem;
    TBXItemTreeCollapseAll: TSpTbxItem;
    TBXItemTreeExpandAll: TSpTbxItem;
    TBXItemTreeLevel2: TSpTbxItem;
    TBXItemTreeLevel5: TSpTbxItem;
    TBXItemTreeLevel4: TSpTbxItem;
    TBXItemTreeLevel3: TSpTbxItem;
    TBXSeparatorItem96: TSpTbxSeparatorItem;
    TBXSubmenuTreeLevel: TSpTbxSubmenuItem;
    TBXItemTreeLevel6: TSpTbxItem;
    TBXItemTreeLevel9: TSpTbxItem;
    TBXItemTreeLevel8: TSpTbxItem;
    TBXItemTreeLevel7: TSpTbxItem;
    ecReverseLines: TAction;
    TBXSeparatorItem68: TSpTbxSeparatorItem;
    TBXItemEReverse: TSpTbxItem;
    ecShuffleLines: TAction;
    TBXItemEShuffle: TSpTbxItem;
    tbUser1: TSpTbxToolbar;
    tbUser2: TSpTbxToolbar;
    tbUser3: TSpTbxToolbar;
    TBXSeparatorItem97: TSpTbxSeparatorItem;
    TBXItemTUser3: TSpTbxItem;
    TBXItemTUser2: TSpTbxItem;
    TBXItemTUser1: TSpTbxItem;
    TBXSubmenuToolbars: TSpTbxSubmenuItem;
    TBXItemOToolbar3: TSpTbxItem;
    TBXItemOToolbar2: TSpTbxItem;
    TBXItemOToolbar1: TSpTbxItem;
    ecExtractDupsCase: TAction;
    ecExtractDupsNoCase: TAction;
    TBXSeparatorItem7: TSpTbxSeparatorItem;
    TBXItemEExtractDupNoCase: TSpTbxItem;
    TBXItemEExtractDupCase: TSpTbxItem;
    ecNonPrintOff: TAction;
    ecNonPrintSpaces: TAction;
    ecNonPrintEol: TAction;
    ecNonPrintBoth: TAction;
    TBXSubmenuItemNonPrint: TSpTbxSubmenuItem;
    TBXSeparatorItem98: TSpTbxSeparatorItem;
    TBXItemONPrintAll: TSpTbxItem;
    TBXItemONPrintEol: TSpTbxItem;
    TBXItemONPrintSpaces: TSpTbxItem;
    PopupUserTB1: TSpTbxPopupMenu;
    TBXItemUserTb1: TSpTbxItem;
    PopupUserTB2: TSpTbxPopupMenu;
    TBXItemUserTB2: TSpTbxItem;
    PopupUserTB3: TSpTbxPopupMenu;
    TBXItemUserTB3: TSpTbxItem;
    TBXItemCtxPasteBkmkLines: TSpTbxItem;
    TBXItemCtxPasteAsColumn: TSpTbxItem;
    TBXSeparatorItem99: TSpTbxSeparatorItem;
    TBXItemONPrintEolDetails: TSpTbxItem;
    ecNonPrintEolDetails: TAction;
    TBXItemOHideItems: TSpTbxItem;
    TBXSeparatorItem100: TSpTbxSeparatorItem;
    TBXItemOEditSynIni: TSpTbxItem;
    acOpenBySelection: TAction;
    ImageListIconsTango22b: TPngImageList;
    ImageListIconsTango16b: TPngImageList;
    ImageListIconsFogue24b: TPngImageList;
    ImageListIconsFogue16b: TPngImageList;
    ImageListUser1: TPngImageList;
    ImageListUser2: TPngImageList;
    ImageListUser3: TPngImageList;
    TBXDockLeft1: TSpTBXDock;
    TBXDockRight1: TSpTbxDock;
    TBXDockBottom1: TSpTbxDock;
    SplitterLeft: TSpTBXSplitter;
    SplitterRight: TSpTBXSplitter;
    SplitterBottom: TSpTBXSplitter;
    StatusItemLexer: TSpTBXLabelItem;
    StatusItemEnds: TSpTBXLabelItem;
    StatusItemEnc: TSpTBXLabelItem;
    StatusItemCaret: TSpTBXLabelItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    SpTBXSeparatorItem2: TSpTBXSeparatorItem;
    SpTBXSeparatorItem3: TSpTBXSeparatorItem;
    SpTBXSeparatorItem4: TSpTBXSeparatorItem;
    StatusItemChar: TSpTBXLabelItem;
    SpTBXSeparatorItem5: TSpTBXSeparatorItem;
    StatusItemRO: TSpTBXLabelItem;
    SpTBXSeparatorItem6: TSpTBXSeparatorItem;
    StatusItemWrap: TSpTBXLabelItem;
    SpTBXSeparatorItem7: TSpTBXSeparatorItem;
    StatusItemSelMode: TSpTBXLabelItem;
    SpTBXSeparatorItem8: TSpTBXSeparatorItem;
    StatusItemInsMode: TSpTBXLabelItem;
    SpTBXSeparatorItem9: TSpTBXSeparatorItem;
    StatusItemZoom: TSpTBXLabelItem;
    SpTBXSeparatorItem10: TSpTBXSeparatorItem;
    StatusItemBusy: TSpTBXLabelItem;
    SpTBXSeparatorItem11: TSpTBXSeparatorItem;
    StatusItemHint: TSpTBXLabelItem;
    TBXMRUListItemFRecents: TSpTBXMRUListItem;
    TBXMRUListItem_Sess: TSpTBXMRUListItem;
    tbTabsRight: TSpTBXTabSet;
    TbxTabMinimap: TSpTBXTabItem;
    TbxTabClips: TSpTBXTabItem;
    TbxTabClipboard: TSpTBXTabItem;
    tbTabsOut: TSpTBXTabSet;
    TbxTabPlugins: TSpTBXTabItem;
    TbxTabValidate: TSpTBXTabItem;
    TbxTabResults: TSpTBXTabItem;
    TbxTabOutput: TSpTBXTabItem;
    tbTabsLeft: TSpTBXTabSet;
    TbxTabTabs: TSpTBXTabItem;
    TbxTabProject: TSpTBXTabItem;
    TbxTabTree: TSpTBXTabItem;
    SpTBXSeparatorItem12: TSpTBXSeparatorItem;
    SpTBXSeparatorItem13: TSpTBXSeparatorItem;
    SpTBXSeparatorItem14: TSpTBXSeparatorItem;
    TBXMRUListItemFNew: TSpTBXMRUListItem;
    TbxItemVPanelClip: TSpTBXItem;
    TBXItemZIn: TSpTBXItem;
    TBXItemZOut: TSpTBXItem;
    SpTBXSeparatorItem15: TSpTBXSeparatorItem;
    TBXSubmenuMarkers: TSpTBXSubmenuItem;
    TBXSubmenuBkOps: TSpTBXSubmenuItem;
    TBXSubmenuBkPortable: TSpTBXSubmenuItem;
    SpTBXSeparatorItem16: TSpTBXSeparatorItem;
    TBXSubmenuItemHTML: TSpTBXSubmenuItem;
    SpTBXSeparatorItem19: TSpTBXSeparatorItem;
    PopupFoldLevel: TSpTBXPopupMenu;
    SpTBXSeparatorItem23: TSpTBXSeparatorItem;
    TBXItemUnfoldAll: TSpTBXItem;
    TBXItemFoldAll: TSpTBXItem;
    TBXSeparatorItem87: TSpTBXSeparatorItem;
    TBXItemUnfoldLine: TSpTBXItem;
    TBXItemFoldNearestBlock: TSpTBXItem;
    TBXItemFoldSelBlock: TSpTBXItem;
    TBXSeparatorItem89: TSpTBXSeparatorItem;
    TBXItemFoldRangesInSel: TSpTBXItem;
    TBXItemUnfoldRangesInSel: TSpTBXItem;
    TBXSeparatorItem88: TSpTBXSeparatorItem;
    TBXItemFoldParent: TSpTBXItem;
    TBXItemFoldWithNested: TSpTBXItem;
    TBXSubmenuFoldLevel: TSpTBXSubmenuItem;
    TBXItemFoldLevel2: TSpTBXItem;
    TBXItemFoldLevel3: TSpTBXItem;
    TBXItemFoldLevel4: TSpTBXItem;
    TBXItemFoldLevel5: TSpTBXItem;
    TBXItemFoldLevel6: TSpTBXItem;
    TBXItemFoldLevel7: TSpTBXItem;
    TBXItemFoldLevel8: TSpTBXItem;
    TBXItemFoldLevel9: TSpTBXItem;
    TbxItemTabReload: TSpTBXItem;
    TBXSubmenuHtmlHelp: TSpTBXSubmenuItem;
    TBXItemHtmlEmmetHelp: TSpTBXItem;
    SpTBXSeparatorItem17: TSpTBXSeparatorItem;
    TimerMinimap: TTimer;
    TBXSubmenuItemConv: TSpTBXSubmenuItem;
    TBXSubmenuItemHtmlEncode: TSpTBXSubmenuItem;
    TBXItemEncodeHtmlNoBrackets: TSpTBXItem;
    TBXItemEncodeHtmlAll: TSpTBXItem;
    ecEncodeHtmlChars2: TAction;
    SpTBXSeparatorItem18: TSpTBXSeparatorItem;
    TBXSubmenuItemPrint: TSpTBXSubmenuItem;
    TbxItemMenuXX: TSpTBXItem;
    TbxItemMenuX: TSpTBXItem;
    TBXSubmenuItemProjects: TSpTBXSubmenuItem;
    TBXItemProjAddFile: TSpTBXItem;
    TBXItemProjOpen: TSpTBXItem;
    TBXSubmenuItemProjRecents: TSpTBXSubmenuItem;
    TBXMRUListItem_Projects: TSpTBXMRUListItem;
    SpTBXSeparatorItem24: TSpTBXSeparatorItem;
    TBXItemProjRecentClear: TSpTBXItem;
    SpTBXSeparatorItem21: TSpTBXSeparatorItem;
    TBXItemProjGoto: TSpTBXItem;
    TBXItemProjNew: TSpTBXItem;
    TBXItemTool16: TSpTBXItem;
    TBXItemTool15: TSpTBXItem;
    TBXItemTool14: TSpTBXItem;
    TBXItemTool13: TSpTBXItem;
    TbxItemCtxTool16: TSpTBXItem;
    TbxItemCtxTool15: TSpTBXItem;
    TbxItemCtxTool14: TSpTBXItem;
    TbxItemCtxTool13: TSpTBXItem;
    TBXItemProjAddAllFiles: TSpTBXItem;
    TbxItemProjSave: TSpTBXItem;
    SpTBXSeparatorItem22: TSpTBXSeparatorItem;
    plConsole: TPanel;
    edConsole: TTntComboBox;
    TbxTabConsole: TSpTBXTabItem;
    ecToggleFocusConsole: TAction;
    TBXItemWinConsole: TSpTBXItem;
    PythonGUIInputOutput1: TPythonGUIInputOutput;
    PythonEngine1: TPythonEngine;
    MemoConsole: TTntMemo;
    PythonModule: TPythonModule;
    SpTBXSeparatorItem25: TSpTBXSeparatorItem;
    TbxItemRunNewPlugin: TSpTBXItem;
    TbxItemHelpPyDir: TSpTBXItem;
    TbxItemRunSnippets: TSpTBXItem;
    SpTBXSeparatorItem26: TSpTBXSeparatorItem;
    TbxItemRunNewSnippet: TSpTBXItem;
    SD_Snippets: TSaveDialog;
    SpTBXSeparatorItem27: TSpTBXSeparatorItem;
    StatusItemTabsize: TSpTBXLabelItem;
    TbxItemTreeSorted: TSpTBXItem;
    ColorDialogTabs: TColorDialog;
    PopupPanelTitle: TSpTBXPopupMenu;
    TbxItemPanelTitleBar: TSpTBXItem;
    TbxItemPanelTitleShowRight: TSpTBXItem;
    TbxItemPanelTitleShowOut: TSpTBXItem;
    TbxItemPanelTitleShowLeft: TSpTBXItem;
    SpTBXSeparatorItem28: TSpTBXSeparatorItem;
    SpTBXSeparatorItem29: TSpTBXSeparatorItem;
    TbxItemWinSplitV: TSpTBXItem;
    TbxItemWinSplitH: TSpTBXItem;
    TbxItemWinProjPre: TSpTBXItem;
    ecToggleProjPreview: TAction;
    TbxSubmenuItemCtxPlugins: TSpTBXSubmenuItem;
    TbxSubmenuItemProjTools: TSpTBXSubmenuItem;
    PopupPreviewEditor: TSpTBXPopupMenu;
    TbxItemPreSelect: TSpTBXItem;
    TbxItemPreCopy: TSpTBXItem;
    SpTBXSeparatorItem30: TSpTBXSeparatorItem;
    TbxItemPreZoomOther: TSpTBXItem;
    TbxItemPreZoom100: TSpTBXItem;
    TbxItemPreZoom75: TSpTBXItem;
    TbxItemPreZoom50: TSpTBXItem;
    TbxItemPreZoom25: TSpTBXItem;
    TbxItemPreEdit: TSpTBXItem;
    SpTBXSeparatorItem31: TSpTBXSeparatorItem;
    TBXSubmenuItemGroups: TSpTBXSubmenuItem;
    TbxItemGroup2H: TSpTBXItem;
    TbxItemGroup2V: TSpTBXItem;
    TbxItemGroupOne: TSpTBXItem;
    TbxItemGroup3H: TSpTBXItem;
    TbxItemGroup3V: TSpTBXItem;
    TbxItemGroup6Grid: TSpTBXItem;
    TbxItemGroup4Grid: TSpTBXItem;
    TbxItemGroup4V: TSpTBXItem;
    TbxItemGroup4H: TSpTBXItem;
    TbxItemGroup3as1p2: TSpTBXItem;
    TBXSubmenuItemToGroup: TSpTBXSubmenuItem;
    TbxItemToGroupPrev: TSpTBXItem;
    TbxItemToGroupNext: TSpTBXItem;
    TbxItemToGroup6: TSpTBXItem;
    TbxItemToGroup5: TSpTBXItem;
    TbxItemToGroup4: TSpTBXItem;
    TbxItemToGroup3: TSpTBXItem;
    TbxItemToGroup2: TSpTBXItem;
    TbxItemToGroup1: TSpTBXItem;
    SpTBXSeparatorItem20: TSpTBXSeparatorItem;
    TBXItemTabCloseOthersAllGroups: TSpTBXItem;
    acCloseOthersAllGroups: TAction;
    procedure acOpenExecute(Sender: TObject);
    procedure ecTitleCaseExecute(Sender: TObject);
    procedure WindowItemClick(Sender: TObject);
    procedure acSaveExecute(Sender: TObject);
    procedure acSaveAsExecute(Sender: TObject);
    procedure MRUClick(Sender: TObject; const S: WideString);
    procedure MRU_SessClick(Sender: TObject; const S: WideString);
    procedure PopupLexersPopup(Sender: TObject);
    procedure acSetupExecute(Sender: TObject);
    procedure TimerTickTimer(Sender: TObject);
    procedure acExportRTFBeforeExecute(Sender: TObject);
    procedure ecReadOnlyExecute(Sender: TObject);
    procedure ButtonOnSelect(Sender: TTBCustomItem; Viewer: TTBItemViewer;
      Selecting: Boolean);
    procedure plTreeResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure plTreeVisibleChanged(Sender: TObject);
    procedure ecShowTreeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ecPrinterSetupExecute(Sender: TObject);
    procedure SetFormat(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ParamCompletionGetParams(Sender: TObject;
      const FuncName: WideString; Pos: Integer);
    procedure ecACPAfterComplete(Sender: TObject; const Item: WideString);
    procedure ecACPGetAutoCompleteList(Sender: TObject; PosX: TPoint; List,
      Display: TWideStrings);
    procedure ecACPCheckChar(Sender: TObject; C: Word;
      var IsWord: Boolean);
    procedure PopupEditorPopup(Sender: TObject);
    procedure TBXItemCtxCopyUrlClick(Sender: TObject);
    procedure SyntaxManagerChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure PluginAcpDefineStartPos(Sender: TObject; var StartPos: TPoint);
    procedure ecACPChange(Sender: TObject);
    procedure ecFindExecute(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBXItemAbClick(Sender: TObject);
    procedure ecWrapExecute(Sender: TObject);
    procedure ecLineNumsExecute(Sender: TObject);
    procedure ecFoldingExecute(Sender: TObject);
    procedure ecNonPrintExecute(Sender: TObject);
    procedure acRereadExecute(Sender: TObject);
    procedure TBXItemClrClick(Sender: TObject);
    procedure tbViewMove(Sender: TObject);
    procedure ecPrintActionBeforeExecute(Sender: TObject);
    procedure ecPreviewActionBeforeExecute(Sender: TObject);
    procedure TBXItem2Click(Sender: TObject);
    procedure ecACPKeyPress(Sender: TObject; var Key: Char);
    procedure ecACPListClick(Sender: TObject);
    procedure ecACPListKeyDown(Sender: TObject;
      var key: Word; Shift: TShiftState);
    procedure acNewTabExecute(Sender: TObject);
    procedure TBXItemWPriorClick(Sender: TObject);
    procedure TBXItemWNextClick(Sender: TObject);
    procedure TBXItemFNextClick(Sender: TObject);
    procedure TBXItemFPrevClick(Sender: TObject);
    procedure TimerRedrawTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBk0Click(Sender: TObject);
    procedure TBXSubmenuItemBkGotoPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure bbg0Click(Sender: TObject);
    procedure TBXSubmenuItemBkSetPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure ODShow(Sender: TObject);
    procedure SDShow(Sender: TObject);
    procedure acNewWindowExecute(Sender: TObject);
    procedure TBXItemFExitClick(Sender: TObject);
    procedure ecCharPopupChange(Sender: TObject);
    procedure ecCharPopupShow(Sender: TObject);
    procedure ecACPShow(Sender: TObject);
    procedure acSetupLexerExecuteOK(Sender: TObject);
    procedure TBXItemHelpReadmeDirClick(Sender: TObject);
    procedure TBXSubmenuLineEndsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXSubmenuEncPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemSMarkNextClick(Sender: TObject);
    procedure TBXItemSMarkPrevClick(Sender: TObject);
    procedure TBXItemETableClick(Sender: TObject);
    procedure TBXSubmenuItemLexerPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemEDupClick(Sender: TObject);
    procedure TBXItemOToolsClick(Sender: TObject);
    procedure TimerHintTimer(Sender: TObject);
    procedure ecPageSetupActionExecuteOK(Sender: TObject);
    procedure ecACPCloseUp(Sender: TObject; var Accept: Boolean);
    procedure TbxItemTool1Click(Sender: TObject);
    procedure TbxItemTool2Click(Sender: TObject);
    procedure TbxItemTool3Click(Sender: TObject);
    procedure TbxItemTool4Click(Sender: TObject);
    procedure TBXSubmenuItemRunPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemZInClick(Sender: TObject);
    procedure TBXItemZOutClick(Sender: TObject);
    procedure TBXItemZ0Click(Sender: TObject);
    procedure TBXItemMarkDropClick(Sender: TObject);
    procedure TBXItemMarkCollClick(Sender: TObject);
    procedure TBXItemMarkSwapClick(Sender: TObject);
    procedure TBXItemFFPrevClick(Sender: TObject);
    procedure TBXItemFFNextClick(Sender: TObject);
    procedure cbCaseClick(Sender: TObject);
    procedure TBXItemTFileClick(Sender: TObject);
    procedure TBXItemTEditClick(Sender: TObject);
    procedure TBXItemTViewClick(Sender: TObject);
    procedure TBXItemTQsClick(Sender: TObject);
    procedure tbQsClose(Sender: TObject);
    procedure edQsChange(Sender: TObject);
    procedure TBXItemQsClick(Sender: TObject);
    procedure edQsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbWordClick(Sender: TObject);
    procedure TBXItemSMarkAllClick(Sender: TObject);
    procedure TBXItemHelpTopicsClick(Sender: TObject);
    procedure TBXItemTabCloseClick(Sender: TObject);
    procedure TBXItemTabNewClick(Sender: TObject);
    procedure DKLanguageController1LanguageChanged(Sender: TObject);
    procedure acCloseExecute(Sender: TObject);
    procedure acSaveAllExecute(Sender: TObject);
    procedure acCloseAllExecute(Sender: TObject);
    procedure acCloseOthersThisGroupExecute(Sender: TObject);
    procedure TBXItemTabCloseOthersClick(Sender: TObject);
    procedure PopupTabContextPopup(Sender: TObject);
    procedure TBXItemFSesSaveAsClick(Sender: TObject);
    procedure TBXItemFSesOpenClick(Sender: TObject);
    procedure TBXItemFClearRecentsClick(Sender: TObject);
    procedure TbxSubmenuItemWindowPopup(Sender: TTBCustomItem; FromLink: Boolean);
    procedure TBXSubmenuEnc2Popup(Sender: TTBCustomItem; FromLink: Boolean);
    procedure TBXItemETimeClick(Sender: TObject);
    procedure TBXItemEPasteClick(Sender: TObject);
    procedure TBXItemEDeleteClick(Sender: TObject);
    procedure TBXItemESelectAllClick(Sender: TObject);
    procedure TBXItemECutClick(Sender: TObject);
    procedure TBXItemECopyClick(Sender: TObject);
    procedure TBXItemEUndoClick(Sender: TObject);
    procedure TBXItemRunFindPhpClick(Sender: TObject);
    procedure TBXItemRunFindGoogleClick(Sender: TObject);
    procedure TBXItemRunFindWikiClick(Sender: TObject);
    procedure TBXItemRunOpenDirClick(Sender: TObject);
    procedure TBXItemTool5Click(Sender: TObject);
    procedure TBXItemTool6Click(Sender: TObject);
    procedure TBXItemTool7Click(Sender: TObject);
    procedure TBXItemTool8Click(Sender: TObject);
    procedure TimerLoadTimer(Sender: TObject);
    procedure TBXItemTbCloseClick(Sender: TObject);
    procedure ecReplaceExecute(Sender: TObject);
    procedure TBXItemRunFindMSDNClick(Sender: TObject);
    procedure acExitExecute(Sender: TObject);
    procedure acCloseAndDeleteExecute(Sender: TObject);
    procedure ecReplaceInFilesExecute(Sender: TObject);
    procedure TimerSelTimer(Sender: TObject);
    procedure TBXItemCtxCopyAppendClick(Sender: TObject);
    procedure TBXItemCtxCutAppendClick(Sender: TObject);
    procedure TBXSubmenuItemEdPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemTool9Click(Sender: TObject);
    procedure TBXItemTool10Click(Sender: TObject);
    procedure TBXItemTool11Click(Sender: TObject);
    procedure TBXItemTool12Click(Sender: TObject);
    procedure TBXItemSGoBracketClick(Sender: TObject);
    procedure plOutResize(Sender: TObject);
    procedure ecShowOutExecute(Sender: TObject);
    procedure plOutVisibleChanged(Sender: TObject);
    procedure ListOutDblClick(Sender: TObject);
    procedure ListOutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBXItemOutClearClick(Sender: TObject);
    procedure TBXItemOutCopySelClick(Sender: TObject);
    procedure TBXItemOutNavClick(Sender: TObject);
    procedure PopupOutPopup(Sender: TObject);
    procedure TBXItemOutCopyAllClick(Sender: TObject);
    procedure ListOutDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure TBXItemOutDelSelClick(Sender: TObject);
    procedure TBXItemOutDelNonparsedClick(Sender: TObject);
    procedure ListOutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListOutMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TBXItemOOOutClick(Sender: TObject);
    procedure TBXItemOOFindClick(Sender: TObject);
    procedure PopupFindPopup(Sender: TObject);
    procedure ecCopyAsRTFExecute(Sender: TObject);
    procedure acSetupLexHLExecute(Sender: TObject);
    procedure TBXItemEExtrClick(Sender: TObject);
    procedure PopupStatusEncPopup(Sender: TObject);
    procedure ecSentCaseExecute(Sender: TObject);
    procedure TBXItemZSet25Click(Sender: TObject);
    procedure TBXItemZOtherClick(Sender: TObject);
    procedure ListClipDblClick(Sender: TObject);
    procedure plClipResize(Sender: TObject);
    procedure plClipVisibleChanged(Sender: TObject);
    procedure ecShowClipExecute(Sender: TObject);
    procedure TBXItemClipClrClick(Sender: TObject);
    procedure ecGotoNextFindResultExecute(Sender: TObject);
    procedure ecGotoPrevFindResultExecute(Sender: TObject);
    procedure TBXItemESyncEdClick(Sender: TObject);
    procedure TBXItemFSesAddClick(Sender: TObject);
    procedure ecFullScrExecute(Sender: TObject);
    procedure edQsExit(Sender: TObject);
    procedure TimerBracketsTimer(Sender: TObject);
    procedure TBXItemTabCopyFNClick(Sender: TObject);
    procedure TBXItemTabCopyFullClick(Sender: TObject);
    procedure TBXItemTabCopyDirClick(Sender: TObject);
    procedure TBXItemSp50Click(Sender: TObject);
    procedure TBXItemTbCloseAllClick(Sender: TObject);
    procedure ecSyncScrollHExecute(Sender: TObject);
    procedure ecSyncScrollVExecute(Sender: TObject);
    procedure TBXItemOShellClick(Sender: TObject);
    procedure ecOnTopExecute(Sender: TObject);
    procedure tbMenuShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure TBXItemEFillBlockClick(Sender: TObject);
    procedure TBXItemEInsTextClick(Sender: TObject);
    procedure TBXItemCtxOpenSelClick(Sender: TObject);
    procedure TBXItemCtxTool1Click(Sender: TObject);
    procedure TBXItemCtxTool2Click(Sender: TObject);
    procedure TBXItemCtxTool3Click(Sender: TObject);
    procedure TBXItemCtxTool4Click(Sender: TObject);
    procedure TBXItemCtxTool5Click(Sender: TObject);
    procedure TBXItemCtxTool6Click(Sender: TObject);
    procedure TBXItemCtxTool7Click(Sender: TObject);
    procedure TBXItemCtxTool8Click(Sender: TObject);
    procedure TBXItemCtxTool9Click(Sender: TObject);
    procedure TBXItemCtxTool10Click(Sender: TObject);
    procedure TBXItemCtxTool11Click(Sender: TObject);
    procedure TBXItemCtxTool12Click(Sender: TObject);
    procedure TBXItemORestoreStylesClick(Sender: TObject);
    procedure TBXItemCtxCustomizeClick(Sender: TObject);
    procedure TreeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListClipKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ecToggleFocusTreeExecute(Sender: TObject);
    procedure ecToggleFocusClipExecute(Sender: TObject);
    procedure TBXItemFReopenClick(Sender: TObject);
    procedure ecToggleLineCommentExecute(Sender: TObject);
    procedure ecToggleFocusOutputExecute(Sender: TObject);
    procedure acBackupExecute(Sender: TObject);
    procedure ecToggleStreamCommentExecute(Sender: TObject);
    procedure TBXItemEMoveUpClick(Sender: TObject);
    procedure TBXItemEMoveDnClick(Sender: TObject);
    procedure TBXItemHelpDonateClick(Sender: TObject);
    procedure TBXItemEDelLnClick(Sender: TObject);
    procedure TBXItemECpFNClick(Sender: TObject);
    procedure TBXItemECpFullPathClick(Sender: TObject);
    procedure TBXItemECpDirPathClick(Sender: TObject);
    procedure ecToggleFocusFindResExecute(Sender: TObject);
    procedure TBXItemTbSpellCheckClick(Sender: TObject);
    procedure ecSpellCheckExecute(Sender: TObject);
    procedure ecSpellLiveExecute(Sender: TObject);
    procedure TBXItemSpellLiveClick(Sender: TObject);
    procedure ecMacroDlgExecute(Sender: TObject);
    procedure ecMacro1Execute(Sender: TObject);
    procedure ecMacro2Execute(Sender: TObject);
    procedure ecMacro3Execute(Sender: TObject);
    procedure ecMacro4Execute(Sender: TObject);
    procedure ecMacro5Execute(Sender: TObject);
    procedure ecMacro6Execute(Sender: TObject);
    procedure ecMacro7Execute(Sender: TObject);
    procedure ecMacro8Execute(Sender: TObject);
    procedure ecMacro9Execute(Sender: TObject);
    procedure TBXItemMacro1Click(Sender: TObject);
    procedure TBXItemMacro2Click(Sender: TObject);
    procedure TBXItemMacro3Click(Sender: TObject);
    procedure TBXItemMacro4Click(Sender: TObject);
    procedure TBXItemMacro5Click(Sender: TObject);
    procedure TBXItemMacro6Click(Sender: TObject);
    procedure TBXItemMacro7Click(Sender: TObject);
    procedure TBXItemMacro8Click(Sender: TObject);
    procedure TBXItemMacro9Click(Sender: TObject);
    procedure TBXSubmenuItemMacrosPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure ecBkClearAllExecute(Sender: TObject);
    procedure ecBkToggleExecute(Sender: TObject);
    procedure ecBkNextExecute(Sender: TObject);
    procedure ecBkPrevExecute(Sender: TObject);
    procedure ecBkInverseExecute(Sender: TObject);
    procedure ecBkCopyExecute(Sender: TObject);
    procedure ecBkCutExecute(Sender: TObject);
    procedure ecBkDeleteExecute(Sender: TObject);
    procedure ecBkDeleteUnmkExecute(Sender: TObject);
    procedure ecBkPasteExecute(Sender: TObject);
    procedure ecGotoExecute(Sender: TObject);
    procedure ecToggleFocusGroupsExecute(Sender: TObject);
    procedure TBXSubmenuItemTidyPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemTidyCfgClick(Sender: TObject);
    procedure TBXItemTidyValClick(Sender: TObject);
    procedure TBXItemOOValClick(Sender: TObject);
    procedure ListValDblClick(Sender: TObject);
    procedure TBXItemValNavClick(Sender: TObject);
    procedure TBXItemValCopySelClick(Sender: TObject);
    procedure TBXItemValCopyAllClick(Sender: TObject);
    procedure TBXItemValClearClick(Sender: TObject);
    procedure PopupValidatePopup(Sender: TObject);
    procedure ListValKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ecToggleFocusValidateExecute(Sender: TObject);
    procedure TBXItemSessClrClick(Sender: TObject);
    procedure TBXItemFSesSaveClick(Sender: TObject);
    procedure TBXItemFSesCloseClick(Sender: TObject);
    procedure ecRemoveBlanksExecute(Sender: TObject);
    procedure TBXSubmenuItemFNewPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure ecRemoveLinesExecute(Sender: TObject);
    procedure ecTrimLeadExecute(Sender: TObject);
    procedure ecTrimTrailExecute(Sender: TObject);
    procedure ecTrimAllExecute(Sender: TObject);
    procedure ecRemoveDupSpacesExecute(Sender: TObject);
    procedure ecTabToSpExecute(Sender: TObject);
    procedure ecSpToTabExecute(Sender: TObject);
    procedure ecFindClipNextExecute(Sender: TObject);
    procedure ecFindClipPrevExecute(Sender: TObject);
    procedure ecSplit50_50Execute(Sender: TObject);
    procedure ecSplit40_60Execute(Sender: TObject);
    procedure ecSplit60_40Execute(Sender: TObject);
    procedure ecSplit30_70Execute(Sender: TObject);
    procedure ecSplit70_30Execute(Sender: TObject);
    procedure ecSplit20_80Execute(Sender: TObject);
    procedure ecSplit80_20Execute(Sender: TObject);
    procedure ecMacroPlay1BeforeExecute(Sender: TObject);
    procedure ecMacroRepeatExecute(Sender: TObject);
    procedure ecRepeatCmdExecute(Sender: TObject);
    procedure TBXItemRightClipClick(Sender: TObject);
    procedure TBXItemRightMapClick(Sender: TObject);
    procedure ecToggleFocusMapExecute(Sender: TObject);
    procedure ecFindInTreeExecute(Sender: TObject);
    procedure ecFindInTreeNextExecute(Sender: TObject);
    procedure ecFindInTreePrevExecute(Sender: TObject);
    procedure ecTreeNextExecute(Sender: TObject);
    procedure ecTreePrevExecute(Sender: TObject);
    procedure ecReduceBlanksExecute(Sender: TObject);
    procedure ecSplitLeftExecute(Sender: TObject);
    procedure ecSplitRightExecute(Sender: TObject);
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure ecFindNextWithExtendExecute(Sender: TObject);
    procedure ecFindPrevWithExtendExecute(Sender: TObject);
    procedure TBXItemHelpKeymapClick(Sender: TObject);
    procedure ecFindInListExecute(Sender: TObject);
    procedure ecFindInListNextExecute(Sender: TObject);
    procedure ecFindInListPrevExecute(Sender: TObject);
    procedure TBXItemClipFindClick(Sender: TObject);
    procedure TBXItemValFindClick(Sender: TObject);
    procedure TBXItemOutFindClick(Sender: TObject);
    procedure PopupClipPopup(Sender: TObject);
    procedure TBXItemTreeFindClick(Sender: TObject);
    procedure PopupTreePopup(Sender: TObject);
    procedure TBXItemTreeCollapseClick(Sender: TObject);
    procedure TBXItemTreeExpandClick(Sender: TObject);
    procedure TimerAutoSaveTimer(Sender: TObject);
    procedure ecMacro10Execute(Sender: TObject);
    procedure ecMacro11Execute(Sender: TObject);
    procedure ecMacro12Execute(Sender: TObject);
    procedure ecMacro13Execute(Sender: TObject);
    procedure ecMacro14Execute(Sender: TObject);
    procedure ecMacro15Execute(Sender: TObject);
    procedure ecMacro16Execute(Sender: TObject);
    procedure ecMacro17Execute(Sender: TObject);
    procedure ecMacro18Execute(Sender: TObject);
    procedure ecMacro19Execute(Sender: TObject);
    procedure ecMacro20Execute(Sender: TObject);
    procedure ecMacro21Execute(Sender: TObject);
    procedure ecMacro22Execute(Sender: TObject);
    procedure ecMacro23Execute(Sender: TObject);
    procedure ecMacro24Execute(Sender: TObject);
    procedure ecMacro25Execute(Sender: TObject);
    procedure ecMacro26Execute(Sender: TObject);
    procedure ecMacro27Execute(Sender: TObject);
    procedure ecMacro28Execute(Sender: TObject);
    procedure ecMacro29Execute(Sender: TObject);
    procedure ecMacro30Execute(Sender: TObject);
    procedure TBXItemMacro10Click(Sender: TObject);
    procedure TBXItemMacro11Click(Sender: TObject);
    procedure TBXItemMacro12Click(Sender: TObject);
    procedure TBXItemMacro13Click(Sender: TObject);
    procedure TBXItemMacro14Click(Sender: TObject);
    procedure TBXItemMacro15Click(Sender: TObject);
    procedure TBXItemMacro16Click(Sender: TObject);
    procedure TBXItemMacro17Click(Sender: TObject);
    procedure TBXItemMacro18Click(Sender: TObject);
    procedure TBXItemMacro19Click(Sender: TObject);
    procedure TBXItemMacro20Click(Sender: TObject);
    procedure TBXItemMacro21Click(Sender: TObject);
    procedure TBXItemMacro22Click(Sender: TObject);
    procedure TBXItemMacro23Click(Sender: TObject);
    procedure TBXItemMacro24Click(Sender: TObject);
    procedure TBXItemMacro25Click(Sender: TObject);
    procedure TBXItemMacro26Click(Sender: TObject);
    procedure TBXItemMacro27Click(Sender: TObject);
    procedure TBXItemMacro28Click(Sender: TObject);
    procedure TBXItemMacro29Click(Sender: TObject);
    procedure TBXItemMacro30Click(Sender: TObject);
    procedure TreeFindDblClick(Sender: TObject);
    procedure TreeFindCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure TreeFindAdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure TreeFindKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBXItemTreeFindNavClick(Sender: TObject);
    procedure TBXItemTreeFindFindClick(Sender: TObject);
    procedure TBXItemTreeFindCopyToTabClick(Sender: TObject);
    procedure TBXItemTreeFindClearClick(Sender: TObject);
    procedure TBXItemTreeFindCopyToClipClick(Sender: TObject);
    procedure TBXItemTreeFindExpandClick(Sender: TObject);
    procedure TBXItemTreeFindCollapseClick(Sender: TObject);
    procedure TBXItemFNewClick(Sender: TObject);
    procedure TBXItemTreeFindExpandCurClick(Sender: TObject);
    procedure TBXItemCtxFindIDClick(Sender: TObject);
    procedure ecTreeParentExecute(Sender: TObject);
    procedure ecTreeNextBrotherExecute(Sender: TObject);
    procedure ecTreePrevBrotherExecute(Sender: TObject);
    procedure TBXItemRunOpenFileClick(Sender: TObject);
    procedure TBXItemSSelTokenClick(Sender: TObject);
    procedure TBXItemTreeFindCopyToClipNodeClick(Sender: TObject);
    procedure TBXItemFPropsClick(Sender: TObject);
    procedure acPropsExecute(Sender: TObject);
    procedure TemplatePopupShow(Sender: TObject);
    procedure ecInsertColorExecute(Sender: TObject);
    procedure TBXItemClipCopyToEdClick(Sender: TObject);
    procedure TBXItemClipCopyToClipClick(Sender: TObject);
    procedure ecReplaceSelFromClipAllExecute(Sender: TObject);
    procedure acRereadOutExecute(Sender: TObject);
    procedure TBXItemLeftTreeClick(Sender: TObject);
    procedure TBXItemLeftProjClick(Sender: TObject);
    procedure ecToggleFocusProjectExecute(Sender: TObject);
    procedure ecInsertImageExecute(Sender: TObject);
    procedure ecToggleFocusMasterSlaveExecute(Sender: TObject);
    procedure ecToggleSlaveExecute(Sender: TObject);
    procedure TBXItemSplitEdHorzClick(Sender: TObject);
    procedure TbxItemRunFindHtml4Click(Sender: TObject);
    procedure TbxItemRunFindHtml5Click(Sender: TObject);
    procedure ecRulerExecute(Sender: TObject);
    procedure ecSplitViewsVertHorzExecute(Sender: TObject);
    procedure ecSplitSlaveVertHorzExecute(Sender: TObject);
    procedure ecGotoBkExecute(Sender: TObject);
    procedure TBXItemBkGotoClick(Sender: TObject);
    procedure TBXItemHtmlLoremIpsumClick(Sender: TObject);
    procedure ecLoremIpsumExecute(Sender: TObject);
    procedure TBXItemFavAddFileClick(Sender: TObject);
    procedure TBXItemFavManageClick(Sender: TObject);
    procedure acFavManageExecute(Sender: TObject);
    procedure TBXItemCtxAddColorClick(Sender: TObject);
    procedure TbxSubmenuItemRecentColorsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemFavAddProjClick(Sender: TObject);
    procedure acFavAddFileExecute(Sender: TObject);
    procedure acFavAddProjExecute(Sender: TObject);
    procedure TBXSubmenuItemFavPopup(Sender: TTBCustomItem; FromLink: Boolean);
    procedure TBXItemTabAddToProjClick(Sender: TObject);
    procedure TreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TBXItemRightClipsClick(Sender: TObject);
    procedure ecToggleFocusClipsExecute(Sender: TObject);
    procedure TBXItemClipsAddTextClick(Sender: TObject);
    procedure TBXItemClipsEditClick(Sender: TObject);
    procedure TBXItemClipsAddFileClick(Sender: TObject);
    procedure TBXItemClipsDirClick(Sender: TObject);
    procedure TBXTabColorChange(Sender: TObject);
    procedure TBXSubmenuTabColorPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemTabColorMiscClick(Sender: TObject);
    procedure TBXItemTabColorDefClick(Sender: TObject);
    procedure TBXItemClipsDelTextClick(Sender: TObject);
    procedure ecSmartHlExecute(Sender: TObject);
    procedure TBXItemBkDropPortableClick(Sender: TObject);
    procedure ecDropPortableBkExecute(Sender: TObject);
    procedure ecGotoPortableBkExecute(Sender: TObject);
    procedure acRenameExecute(Sender: TObject);
    procedure TBXItemRunNumConvClick(Sender: TObject);
    procedure ecNumericConverterExecute(Sender: TObject);
    procedure TBXItemEUnindentClick(Sender: TObject);
    procedure ecIndentLike1stExecute(Sender: TObject);
    procedure acColumnMarkersExecute(Sender: TObject);
    procedure TBXItemEToggleLineCommentClick(Sender: TObject);
    procedure TBXItemEToggleStreamCommentClick(Sender: TObject);
    procedure TBXItemOOPLogClick(Sender: TObject);
    procedure TBXItemPLogFindClick(Sender: TObject);
    procedure TBXItemPLogClearClick(Sender: TObject);
    procedure TBXItemPLogDeleteClick(Sender: TObject);
    procedure TBXItemPLogCopyAllClick(Sender: TObject);
    procedure TBXItemPLogCopySelClick(Sender: TObject);
    procedure ListPLogKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListPLogDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure TBXItemHtmlEmmetHelpClick(Sender: TObject);
    procedure ecZenExpandExecute(Sender: TObject);
    procedure ecZenWrapExecute(Sender: TObject);
    procedure ecCenterLinesExecute(Sender: TObject);
    procedure TBXItemLeftTabsClick(Sender: TObject);
    procedure ListTabsClick(Sender: TObject);
    procedure ListTabsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ListTabsColumnClick(Sender: TObject; Column: TListColumn);
    procedure ListTabsCompare(Sender: TObject; Item1, Item2: TListItem;
      Data: Integer; var Compare: Integer);
    procedure ecToggleFocusTabsExecute(Sender: TObject);
    procedure TBXItemOEditSynPluginsIniClick(Sender: TObject);
    procedure TBXItemPLogSaveAsClick(Sender: TObject);
    procedure TBXItemTabMoveToWindowClick(Sender: TObject);
    procedure TBXItemTabOpenInWindowClick(Sender: TObject);
    procedure ecEncodeHtmlCharsExecute(Sender: TObject);
    procedure ecSortDialogExecute(Sender: TObject);
    procedure TBXItemSSelBracketsClick(Sender: TObject);
    procedure ecUndoExecuteOK(Sender: TObject);
    procedure ecPageSetupActionBeforeExecute(Sender: TObject);
    procedure ecPreviewActionExecuteOK(Sender: TObject);
    procedure TimerTreeTimer(Sender: TObject);
    procedure PopupStatusLineEndsPopup(Sender: TObject);
    procedure TBXItemFoldAllClick(Sender: TObject);
    procedure TBXItemUnfoldAllClick(Sender: TObject);
    procedure TBXItemUnfoldLineClick(Sender: TObject);
    procedure TBXItemFoldParentClick(Sender: TObject);
    procedure ecCollapseParentExecute(Sender: TObject);
    procedure ecCollapseWithNestedExecute(Sender: TObject);
    procedure TBXItemFoldWithNestedClick(Sender: TObject);
    procedure TBXItemFoldSelBlockClick(Sender: TObject);
    procedure TBXItemFoldNearestBlockClick(Sender: TObject);
    procedure ecSortAscendingExecute(Sender: TObject);
    procedure ecSortDescendingExecute(Sender: TObject);
    procedure ecSpToTabLeadingExecute(Sender: TObject);
    procedure ecToggleLineCommentAltExecute(Sender: TObject);
    procedure TBXItemEToggleLineCommentAltClick(Sender: TObject);
    procedure TBXSubmenuItemCtxMorePopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemFoldRangesInSelClick(Sender: TObject);
    procedure TBXItemUnfoldRangesInSelClick(Sender: TObject);
    procedure ecCommandsListExecute(Sender: TObject);
    procedure ecProjectListExecute(Sender: TObject);
    procedure TBXItemCaretsRemove1Click(Sender: TObject);
    procedure TBXItemCaretsRemove2Click(Sender: TObject);
    procedure TBXItemCaretsFromSelLeftClick(Sender: TObject);
    procedure TBXItemCaretsFromSelRightClick(Sender: TObject);
    procedure TBXItemCaretsFromSelClearClick(Sender: TObject);
    procedure TBXItemCaretsExtUpLineClick(Sender: TObject);
    procedure TBXItemCaretsExtDownLineClick(Sender: TObject);
    procedure TBXItemCaretsExtUpPageClick(Sender: TObject);
    procedure TBXItemCaretsExtDownPageClick(Sender: TObject);
    procedure TBXItemCaretsExtUpEndClick(Sender: TObject);
    procedure TBXItemCaretsExtDownEndClick(Sender: TObject);
    procedure TBXItemCaretsFromMarksLeftClick(Sender: TObject);
    procedure TBXItemCaretsFromMarksRightClick(Sender: TObject);
    procedure TBXItemCaretsFromMarksClearClick(Sender: TObject);
    procedure TBXItemEColumnClick(Sender: TObject);
    procedure ecEditColumnExecute(Sender: TObject);
    procedure ecDedupAllExecute(Sender: TObject);
    procedure ecDedupAdjacentExecute(Sender: TObject);
    procedure TBXItemEDedupAllClick(Sender: TObject);
    procedure TBXItemEDedupAdjacentClick(Sender: TObject);
    procedure TBXItemTbDedupAdjacentClick(Sender: TObject);
    procedure TBXItemTbDedupAllClick(Sender: TObject);
    procedure TBXItemESortDialogClick(Sender: TObject);
    procedure TBXItemESortAscClick(Sender: TObject);
    procedure TBXItemESortDescClick(Sender: TObject);
    procedure TBXItemTbSortDialogClick(Sender: TObject);
    procedure TBXItemTbSortAscClick(Sender: TObject);
    procedure TBXItemTbSortDescClick(Sender: TObject);
    procedure TBXItemCCUpperClick(Sender: TObject);
    procedure TBXItemCCLowerClick(Sender: TObject);
    procedure TBXItemCCTitleClick(Sender: TObject);
    procedure TBXItemCCSentClick(Sender: TObject);
    procedure TBXItemCCInvClick(Sender: TObject);
    procedure TBXItemECaseUpperClick(Sender: TObject);
    procedure TBXItemECaseLowerClick(Sender: TObject);
    procedure TBXItemECaseTitleClick(Sender: TObject);
    procedure TBXItemECaseSentClick(Sender: TObject);
    procedure TBXItemECaseInvertClick(Sender: TObject);
    procedure TBXItemEAlignWithSepClick(Sender: TObject);
    procedure TBXItemERemBlanksClick(Sender: TObject);
    procedure TBXItemEReduceBlanksClick(Sender: TObject);
    procedure TBXItemETrimLeadClick(Sender: TObject);
    procedure TBXItemETrimTrailClick(Sender: TObject);
    procedure TBXItemETrimAllClick(Sender: TObject);
    procedure TBXItemERemDupSpClick(Sender: TObject);
    procedure TBXItemETabToSpClick(Sender: TObject);
    procedure TBXItemESpToTabClick(Sender: TObject);
    procedure TBXItemESpToTabLeadClick(Sender: TObject);
    procedure TBXItemECenterLinesClick(Sender: TObject);
    procedure ecAlignWithSepExecute(Sender: TObject);
    procedure TBXItemEJoinClick(Sender: TObject);
    procedure TBXItemESplitClick(Sender: TObject);
    procedure TBXItemECopyLineClick(Sender: TObject);
    procedure TBXItemECutLineClick(Sender: TObject);
    procedure TBXItemECopyAppClick(Sender: TObject);
    procedure TBXItemECutAppClick(Sender: TObject);
    procedure TBXItemEIndentClick(Sender: TObject);
    procedure TBXItemEIndentLike1stClick(Sender: TObject);
    procedure TBXItemECommClick(Sender: TObject);
    procedure TBXItemEUncommClick(Sender: TObject);
    procedure TBXItemHtmlEmmetExpandClick(Sender: TObject);
    procedure TBXItemHtmlEmmetWrapClick(Sender: TObject);
    procedure TBXItemTabToggleSplitClick(Sender: TObject);
    procedure TBXItemCtxCopyClick(Sender: TObject);
    procedure TBXItemCtxCutClick(Sender: TObject);
    procedure TBXItemCtxPasteClick(Sender: TObject);
    procedure TBXItemCtxDelClick(Sender: TObject);
    procedure TBXItemCtxSelectAllClick(Sender: TObject);
    procedure TBXItemERedoClick(Sender: TObject);
    procedure ecToggleShowGroup2Execute(Sender: TObject);
    procedure PluginACPAfterComplete(Sender: TObject;
      const Item: WideString);
    procedure TBXItemSSelExtendClick(Sender: TObject);
    procedure TBXItemTreeExpandAllClick(Sender: TObject);
    procedure TBXItemTreeCollapseAllClick(Sender: TObject);
    procedure TBXItemTreeLevel2Click(Sender: TObject);
    procedure TBXItemTreeLevel3Click(Sender: TObject);
    procedure TBXItemTreeLevel4Click(Sender: TObject);
    procedure TBXItemTreeLevel5Click(Sender: TObject);
    procedure TBXItemTreeLevel6Click(Sender: TObject);
    procedure TBXItemTreeLevel7Click(Sender: TObject);
    procedure TBXItemTreeLevel8Click(Sender: TObject);
    procedure TBXItemTreeLevel9Click(Sender: TObject);
    procedure ecReverseLinesExecute(Sender: TObject);
    procedure TBXItemEReverseClick(Sender: TObject);
    procedure ecShuffleLinesExecute(Sender: TObject);
    procedure TBXItemEShuffleClick(Sender: TObject);
    procedure TBXItemFoldLevel2Click(Sender: TObject);
    procedure TBXItemFoldLevel3Click(Sender: TObject);
    procedure TBXItemFoldLevel4Click(Sender: TObject);
    procedure TBXItemFoldLevel5Click(Sender: TObject);
    procedure TBXItemFoldLevel6Click(Sender: TObject);
    procedure TBXItemFoldLevel7Click(Sender: TObject);
    procedure TBXItemFoldLevel8Click(Sender: TObject);
    procedure TBXItemFoldLevel9Click(Sender: TObject);
    procedure TBXItemVCommClick(Sender: TObject);
    procedure TBXItemVUncomClick(Sender: TObject);
    procedure TBXItemTUser1Click(Sender: TObject);
    procedure TBXItemTUser2Click(Sender: TObject);
    procedure TBXItemTUser3Click(Sender: TObject);
    procedure TBXItemOToolbar1Click(Sender: TObject);
    procedure TBXItemOToolbar2Click(Sender: TObject);
    procedure TBXItemOToolbar3Click(Sender: TObject);
    procedure ecExtractDupsCaseExecute(Sender: TObject);
    procedure ecExtractDupsNoCaseExecute(Sender: TObject);
    procedure TBXItemEExtractDupCaseClick(Sender: TObject);
    procedure TBXItemEExtractDupNoCaseClick(Sender: TObject);
    procedure ecNonPrintSpacesExecute(Sender: TObject);
    procedure ecNonPrintEolExecute(Sender: TObject);
    procedure ecNonPrintBothExecute(Sender: TObject);
    procedure TBXItemCtxPasteAsColumnClick(Sender: TObject);
    procedure TBXItemCtxPasteBkmkLinesClick(Sender: TObject);
    procedure ecNonPrintEolDetailsExecute(Sender: TObject);
    procedure TBXItemOHideItemsClick(Sender: TObject);
    procedure TBXItemOEditSynIniClick(Sender: TObject);
    procedure acOpenBySelectionExecute(Sender: TObject);
    procedure StatusItemCaretClick(Sender: TObject);
    procedure StatusItemEncClick(Sender: TObject);
    procedure StatusItemEndsClick(Sender: TObject);
    procedure StatusItemLexerClick(Sender: TObject);
    procedure StatusItemCharClick(Sender: TObject);
    procedure StatusItemROClick(Sender: TObject);
    procedure StatusItemWrapClick(Sender: TObject);
    procedure StatusItemSelModeClick(Sender: TObject);
    procedure StatusItemInsModeClick(Sender: TObject);
    procedure StatusItemZoomClick(Sender: TObject);
    procedure TBXTabColorGetColor(Sender: TObject; ACol, ARow: Integer;
      var Color: TColor; var Name: WideString);
    procedure TBXTabColorCellClick(Sender: TObject; ACol, ARow: Integer;
      var Allow: Boolean);
    procedure StatusItemCaretDrawHint(Sender: TObject;
      AHintBitmap: TBitmap; var AHint: WideString;
      var PaintDefault: Boolean);
    procedure TBXSubmenuItemFRecentsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXSubmenuItemSessPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXMRUListItemFNewClick(Sender: TObject;
      const Filename: WideString);
    procedure StatusResize(Sender: TObject);
    procedure acSetupLexLibExecute(Sender: TObject);
    procedure TbxItemTabReloadClick(Sender: TObject);
    procedure TBXItemHtmlPreviewClick(Sender: TObject);
    procedure TBXSubmenuItemToolbarsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TimerMinimapTimer(Sender: TObject);
    procedure TBXSubmenuItemConvPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemEncodeHtmlAllClick(Sender: TObject);
    procedure TBXItemEncodeHtmlNoBracketsClick(Sender: TObject);
    procedure ecEncodeHtmlChars2Execute(Sender: TObject);
    procedure TbxItemMenuXClick(Sender: TObject);
    procedure TbxItemMenuXXClick(Sender: TObject);
    procedure TBXItemProjOpenClick(Sender: TObject);
    procedure TBXItemProjAddFileClick(Sender: TObject);
    procedure TBXSubmenuItemProjRecentsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXMRUListItem_ProjectsClick(Sender: TObject;
      const Filename: WideString);
    procedure TBXItemProjRecentClearClick(Sender: TObject);
    procedure TBXItemProjGotoClick(Sender: TObject);
    procedure TBXItemProjNewClick(Sender: TObject);
    procedure PluginACPShow(Sender: TObject);
    procedure TBXItemTool13Click(Sender: TObject);
    procedure TBXItemTool14Click(Sender: TObject);
    procedure TBXItemTool15Click(Sender: TObject);
    procedure TBXItemTool16Click(Sender: TObject);
    procedure TbxItemCtxTool13Click(Sender: TObject);
    procedure TbxItemCtxTool14Click(Sender: TObject);
    procedure TbxItemCtxTool15Click(Sender: TObject);
    procedure TbxItemCtxTool16Click(Sender: TObject);
    procedure plTreeDockChanged(Sender: TObject);
    procedure TBXItemProjAddAllFilesClick(Sender: TObject);
    procedure TbxItemProjSaveClick(Sender: TObject);
    procedure StatusItemBusyClick(Sender: TObject);
    procedure TbxTabConsoleClick(Sender: TObject);
    procedure edConsoleKeyPress(Sender: TObject; var Key: Char);
    procedure ecToggleFocusConsoleExecute(Sender: TObject);
    procedure PythonEngine1BeforeLoad(Sender: TObject);
    procedure edConsoleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure MemoConsoleKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure PythonEngine1AfterInit(Sender: TObject);
    procedure PythonModuleInitialization(Sender: TObject);
    procedure PythonGUIInputOutput1SendUniData(Sender: TObject;
      const Data: WideString);
    procedure TbxItemRunNewPluginClick(Sender: TObject);
    procedure TbxItemHelpPyDirClick(Sender: TObject);
    procedure PythonGUIInputOutput1ReceiveUniData(Sender: TObject;
      var Data: WideString);
    procedure MemoConsoleDblClick(Sender: TObject);
    procedure TbxItemRunSnippetsClick(Sender: TObject);
    procedure TbxItemRunNewSnippetClick(Sender: TObject);
    procedure TbxItemTreeSortedClick(Sender: TObject);
    procedure TbxItemPanelTitleBarClick(Sender: TObject);
    procedure PopupPanelTitlePopup(Sender: TObject);
    procedure TBXItemMarkGoLastClick(Sender: TObject);
    procedure TBXItemMarkClearClick(Sender: TObject);
    procedure TbxItemWinSplitHClick(Sender: TObject);
    procedure TbxItemWinSplitVClick(Sender: TObject);
    procedure ecToggleProjPreviewExecute(Sender: TObject);
    procedure acExportHTMLBeforeExecute(Sender: TObject);
    procedure TBXSubmenuItemBkPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TbxItemPreCopyClick(Sender: TObject);
    procedure TbxItemPreSelectClick(Sender: TObject);
    procedure TbxItemPreZoom25Click(Sender: TObject);
    procedure TbxItemPreZoom50Click(Sender: TObject);
    procedure TbxItemPreZoom75Click(Sender: TObject);
    procedure TbxItemPreZoom100Click(Sender: TObject);
    procedure TbxItemPreEditClick(Sender: TObject);
    procedure TbxItemPreZoomOtherClick(Sender: TObject);
    procedure PopupPreviewEditorPopup(Sender: TObject);
    procedure PopupStatusEncClosePopup(Sender: TObject);
    procedure PopupClipsPopup(Sender: TObject);
    procedure TbxItemGroupOneClick(Sender: TObject);
    procedure TbxItemGroup2HClick(Sender: TObject);
    procedure TbxItemGroup2VClick(Sender: TObject);
    procedure TbxItemGroup3HClick(Sender: TObject);
    procedure TbxItemGroup3VClick(Sender: TObject);
    procedure TbxItemGroup3as1p2Click(Sender: TObject);
    procedure TbxItemGroup4HClick(Sender: TObject);
    procedure TbxItemGroup4VClick(Sender: TObject);
    procedure TbxItemGroup4GridClick(Sender: TObject);
    procedure TbxItemGroup6GridClick(Sender: TObject);
    procedure TBXSubmenuItemGroupsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TbxItemToGroup1Click(Sender: TObject);
    procedure TBXSubmenuItemToGroupPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemTabCloseOthersAllGroupsClick(Sender: TObject);
    procedure acCloseOthersAllGroupsExecute(Sender: TObject);

  private
    cStatLine,
    cStatCol,
    cStatSelLines,
    cStatSelCols,
    cStatSelChars,
    cStatTLines,
    cStatTChars,
    cStatFSize,
    cStatFDate,
    cStatCarets,
    cStatCaretsTopLn,
    cStatCaretsBotLn: Widestring;

    TabSwitchers: array[TATGroupsNums] of TTabSwitcher;
    FListSnippets: TList;
    FListLexersSorted: TTntStringList;
    FTempFilenames: TTntStringList;
    FUserToolbarCommands: TTntStringList;
    FInitialDir: Widestring;
    FLastOnContinueCheck: DWORD;
    FLastCmdId: integer;
    FLastCmdData: string;
    FLastCmdCount: integer;
    FLastCmdPlaying: boolean;
    FLastCmdBreak: boolean;
    FLastMacro: integer;
    FSessionFN: string;
    FProjectIniting: boolean;
    FProjectFreeing: boolean;

    FSpellMenuCaption: Widestring;
    FSpellMenuTag: integer;
    {$ifdef SPELL}
    FSpell: TLiveAddictSpellBase;
    FSpellPos: Integer;
    FSpellChecking: boolean;
    {$endif}

    FPluginsPanel: TPluginList_Panel;
    FPluginsFindid: TPluginList_Findid;
    FPluginsCommand: TPluginList_Command;
    FPluginsEvent: TPluginList_Event;
    FPluginsAcp: TPluginList_Acp;

    FPanelDrawBusy: boolean;
    FSyncBusy: boolean;
    FListNewDocs: TTntStringList; //filenames list of templates (template\newdoc)
    FListConv: TTntStringList; //filenames of text converters (template\conv)
    FListFiles: TTntStringList; //filenames list of mass search/replace operation
    FSelBlank: boolean; //selection is blank (for Smart Hilite)
    FFullScr: boolean; //full-screen
    FOnTop: boolean; //always-on-top
    FBoundsRectOld: TRect;

    //forms
    fmNumConv: TfmNumConv;
    fmClip: TfmClip;
    fmClips: TfmClips;
    fmMap: TfmMap;
    fmProj: TfmProj;
    fmSR: TfmSR;

    //original options values
    orig_Zoom: integer;
    orig_Tree,
    orig_Clip,
    orig_Out,
    orig_NFold,
    orig_Wrap,
    orig_LNum,
    orig_NPrint,
    orig_Ruler: boolean;
    orig_TabRight: TSynTabRight;
    orig_TabLeft: TSynTabLeft;
    orig_TabOut: TSynTabOut;
    orig_TabsSort: integer;
    orig_TabsWidths: string;

    //auto-complete lists
    FAcpIntHtml,
    FAcpIntCss,
    FAcpList_Display, //ACP: display list (in form "\s1\...\s2\...")
    FAcpList_Items, //ACP: names with brackets+parameters
    FAcpList_Hints, //ACP: hints (in form "(param1; param2)")
    FAcpList_Desc: //ACP: descriptions (text after "|")
      TStringList;

    FTabOut: TSynTabOut;
    FTabRight: TSynTabRight;
    FTabLeft: TSynTabLeft;
    FTreeRoot: TTntTreeNode; //root tree node of last find result
    FListResFN,              //current filename for mass search/replace operation
    FListResFN_Prev: Widestring; //previous filename for mass search/replace
    FOutItem: Integer; //ListOut item index for right-click
    FOutVisible: boolean; //Visible state for Output panel
    FPrevCaretPos: Integer; //saved caret pos before executing "Select brackets"

    FAcpLexer: string; //ACP list was loaded for this lexer
    FAcpAgain: boolean; //ACP need to show again after closing (for html/css)
    FAcpCss: boolean; //ACP called for CSS lexer
    FAcpHtm: boolean; //ACP called for HTML lexer
    FAcpHtmTags: boolean; //ACP shows html tags, not attribs
    FAcpHtmClosing: boolean; //ACP called for html closing tag </tag>
    FAcpHtmSpaceAdded: boolean; //added space on ACP call

    QuickView: boolean;    //QuickView mode for TotalCmd plugin
    FUpdatePluginsLang: boolean; //need to update plugins' language ASAP
    FNeedRepaint: boolean;   //need full repaint ASAP
    FEnableRepaint: boolean; //enable repaint, it's set after 500ms

    FToolbarMoved: boolean;  //set when toolbars are moved
    FPopupUrl: string;       //current URL for editor popup menu
    FPopupColor: integer;    //current color-id-in-text for editor popup menu
    FCurrPluginAcpStartPos: TPoint; //auto-complete popup position, for cActionSuggestCompletion
    FCurrSelState: TSynSelState; //current selection state (stream, column, carets etc)
    FCurrTheme: string;      //current SpTBX theme
    FCurrDiffScrollY: Integer; //diff between 1st view editor TopLine and 2nd view editor TopLine

    FDialogFFiles_Find,       //last values of "Find in files" dialog fields
    FDialogFFiles_Replace,
    FDialogFFiles_MaskInc,
    FDialogFFiles_MaskExc,
    FDialogFFiles_Dir: Widestring;
    FDialogFFiles_Left,
    FDialogFFiles_Top: Integer;

    FMenuItems: array of  //array of menu-items ids for SynHide.ini
      record Id: string; Item: TComponent; end;
    FMenuItem_Colors_Clear, //menu-items (4) in "Recent colors" menu
    FMenuItem_Colors_Save,
    FMenuItem_Colors_Open,
    FMenuItem_Colors_Select: TSpTbxItem;

    FinderPro: TGauge;  //current TGauge for progress showing
    FinderProNum: integer; //previous "NN%" progress value

    //frame related-----------------------------------------
    FCurrentEditor: TSyntaxMemo;
    FClickedFrame: TEditorFrame;
    procedure SetCurrentEditor(Value: TSyntaxMemo);
    function GetFrameCount: integer;
    function GetFrameAllCount: integer;
    function GetFrames(Index: integer): TEditorFrame;
    function GetFramesAll(Index: integer): TEditorFrame;
    procedure SetCurrentFrame(Frame: TEditorFrame);
    function GetCurrentFrame: TEditorFrame;
    function GetCurrentFrameInPages(Pages: TATPages): TEditorFrame;
    procedure FrameSaveState(Sender: TObject);
    function FrameAskToSave(Frame: TEditorFrame; AllowAll: Boolean; AllowCancel: boolean=true): TModalResult;
    procedure InitFrameTab(Frame: TEditorFrame);
    function SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean): boolean;
    function OppositeFrame: TEditorFrame;
    function IsFramePropertiesStringForFilename(const fn: Widestring; const Str: string): boolean;
    function FrameGetPropertiesString(F: TEditorFrame): string;
    procedure FrameSetPropertiesString(F: TEditorFrame; const Str: string; EncodingOnly: boolean);
    procedure FrameGetTabCaption(Sender: TFrame; var Str: Widestring);
    procedure FocusFrame(Frame: TEditorFrame);
    //frame related------------------------------

    //private methods
    procedure DoDelayedCommandAny(Command: Integer);
    procedure DoDelayedCommandWithClose(Command: Integer);
    function ListTab_FrameIndex: integer;
    function GetTabsWidths: Widestring;
    procedure SetTabsWidths(const S: Widestring);

    //plugins related----------------------------
    procedure DoRefreshPluginsFiles(const fn: Widestring);
    procedure DoRefreshPluginsLang;
    procedure DoPluginSaveFtpFile(F: TEditorFrame);
    procedure DoPluginsRepaint;
    function DoOpenPluginFavorite(const AFileName: Widestring): boolean;
    procedure DoShowPlugin(N: Integer);
    procedure DoClosePlugins;
    procedure DoResizePlugins;
    procedure DoLoadPlugin_Panel(Index: Integer);
    procedure DoLoadPlugin_FindID(Index: Integer);
    procedure DoLoadPlugin_Action(
      const AFileName: string;
      const AActionName: Widestring;
      P1, P2, P3, P4: Pointer);
    function DoLoadPlugin_GetString(
      const AFileName: string;
      const AActionName: Widestring): Widestring;
    procedure DoLoadPluginsList;
    procedure DoLoadPlugins_Panels(const fn_plug_ini: string);
    procedure DoLoadPlugins_FindId(const fn_plug_ini: string);
    procedure DoLoadPlugins_Complete(const fn_plug_ini: string);
    procedure DoLoadPlugins_Commands(const fn_plug_ini: string);
    procedure DoLoadPlugins_Events(const fn_plug_ini: string);
    procedure DoTestPlugins;
    procedure LoadPluginsInfo;
    procedure PluginPanelItemClick(Sender: TObject);
    procedure PluginCommandItemClick(Sender: TObject);
    procedure DoAddPluginMenuItem(
      ASubmenu: TSpTbxSubmenuitem;
      const SKey, SShortcut: Widestring; NIndex: Integer);
    //-------------------------------------------
    //
    procedure DoCheckIfBookmarkSetHere(Ed: TSyntaxMemo; NPos: Integer);
    function SGetFrameIndexFromPrefixedStr(const InfoFN: Widestring): Integer;
    function SGetTabPrefix: Widestring;
    procedure DoFindCommandFromString(const S: Widestring);
    procedure DoFindDialog_ReplaceAllInCurrentTab;
    procedure DoFindDialog_ReplaceAllInAllTabs(var AFilesReport: Widestring);
    procedure DoFindDialog_FindNext;
    procedure DoFindDialog_CountAllInCurrentTab;
    procedure DoFindDialog_ReplaceOrSkip(ADoReplace: boolean);
    procedure DoFindDialog_FindAllInAllTabs;
    procedure DoFindDialog_FindAllInCurrentTab(AWithBkmk, ASelectResults: boolean);
    procedure DoFindInClipPanel;
    procedure DoFindInFindResults;
    procedure DoFindInOutPanel;
    procedure DoFindInValidatePanel;
    procedure DoFindInPluginsLog;
    procedure DoAddFav(const fn: Widestring);
    procedure NumConvInsert(Sender: TObject; const S: string; Typ: TSynNumType);
    procedure DoGetCommentProps(const Lexer: string;
      UseDefault: boolean;
      var sStart, sEnd: string; var IsMultiLine: boolean);
    function GetTabColors: Widestring;
    procedure SetTabColors(S: Widestring);
    property TabColorsString: Widestring read GetTabColors write SetTabColors;
    procedure DoSetFrameTabColor(F: TEditorFrame; NColor: Longint);
    procedure DoSetTabColorValue(NColor: Longint);
    procedure DoSetTabColorIndex(NIndex: Integer);
    procedure DoSetTabColorIndex_Current(NIndex: Integer);
    procedure ClipsClick(Sender: TObject; const S: Widestring);
    procedure ClipsInsPress(Sender: TObject);
    function IsProgressNeeded(Ed: TSyntaxMemo): boolean;
    function IsProgressStopped(const NDoneSize, NTotalSize: Int64): boolean;
    procedure DoProgressShow(AMode: TProgressType = proFindText);
    procedure DoProgressHide;

    procedure ProjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure ProjOpen(Sender: TObject);
    procedure ProjClose(Sender: TObject);
    procedure ProjGotoFile(Sender: TObject);
    procedure ProjLoadMRU(List: TSynMruList);
    procedure ProjUpdateMRU(List: TSynMruList);
    procedure ProjFileOpen(Sender: TObject; Files: TTntStrings);
    procedure ProjAddEditorFile(Sender: TObject; Files: TTntStrings);
    procedure ProjAddEditorFiles(Sender: TObject; Files: TTntStrings);
    procedure ProjGetLexer(Sender: TObject; Files: TTntStrings);
    procedure ProjGetLexers(Sender: TObject; Files: TTntStrings);
    procedure ProjGetWorkDir(Sender: TObject; Files: TTntStrings);
    procedure ProjGetProjDir(Sender: TObject; Files: TTntStrings);
    procedure ProjSetProjDir(Sender: TObject; Files: TTntStrings);

    function GetRecentColors: string;
    procedure SetRecentColors(const Str: string);
    property RecentColorsStr: string read GetRecentColors write SetRecentColors;
    procedure DoClearRecentColors;
    procedure RecentColorClick(Sender: TObject);
    procedure RecentColorOpen(Sender: TObject);
    procedure RecentColorSave(Sender: TObject);
    procedure DoAddRecentColor(N: Integer);
    procedure DoInitRecentColorsMenu;
    procedure DoDeleteRecentColor(N: Integer);
    function SynBorderStyle: TBorderStyle;
    function SynBorderStyleEditor: TBorderStyle;
    function SynImagesDll: string;
    function DoAutoCloseBracket(ch: Widechar): boolean;
    function DoAutoCloseTag: boolean;
    function DoLoadStringFromIni(const fn: string): string;
    procedure DoSaveStringToIni(const fn: string; const Str: string);

    //private UpdateNNN
    procedure UpdateNewDocMenu();
    procedure UpdateTreeProps;
    procedure UpdateTitle(Sender: TFrame);
    procedure UpdateAcp(const Lexer: string);
    procedure UpdateTools;
    procedure UpdatePanelOut(n: TSynTabOut);
    procedure UpdatePanelLeft(n: TSynTabLeft);
    procedure UpdatePanelRight(n: TSynTabRight);
    procedure UpdateCheckLeftTabs(IsTree, IsProj, IsTabs: boolean);
    procedure UpdateEncMenu(M: TObject; AConvEnc: boolean = false);
    procedure UpdateBookmarkMenus;
    procedure UpdateShortcuts;
    procedure UpdateLang;
    procedure UpdateSpellLang;
    procedure UpdateEditorCaret(Ed: TSyntaxMemo);
    procedure UpdateEditorNonPrinted(Ed: TSyntaxMemo);
    procedure UpdateLexList;
    procedure UpdateStatusbarLineEnds;
    procedure UpdateStatusbarTabsize;
    procedure UpdateStatusbarEnc(F: TEditorFrame);

    procedure UpdateNewFrame(F: TEditorFrame);
    procedure UpdateFrameEnc(Frame: TEditorFrame);
    procedure UpdateFrameSpell(Frame: TEditorFrame; UpdFlag: boolean = true);
    procedure UpdateFrameZoom(F: TEditorFrame);
    procedure UpdateFrameMicroMap(F: TEditorFrame);
    procedure UpdateClickedFrame;

    procedure UpdateLexer;
    procedure UpdateFormEnabled(En: boolean);
    procedure UpdatePanelOutFromList(List: TWideStringList);
    procedure UpdateRecentsOnClose;
    procedure UpdateColorHint(AClearHint: boolean = true);
    procedure UpdateListTabs;
    procedure UpdateTabList(TopItem, NewItem, DelItem: integer);
    procedure UpdateSaveIco;
    procedure UpdateBusyIco;
    procedure UpdateTreeFind_Initial(AStr: Widestring; const ADir: Widestring; AInTabs: boolean = false);
    procedure UpdateTreeFind_Results(AStr: Widestring; const ADir: Widestring; AStopped: boolean; AInTabs: boolean = false);
    procedure UpdateTreeFind_ReplaceResults(const ANodeText: Widestring; ANumFiles, ANumItems: integer; AStopped: boolean);
    procedure UpdateMacroKeynames;

    function SStatusText(Ed: TSyntaxMemo): Widestring;
    function SStatusCharInfo(Ed: TSyntaxMemo): Widestring;
    function SStatusHint(state: TSynSelState): Widestring;

    procedure DoHandleToolOutput(const ft: Widestring; const ATool: TSynTool);
    function IsShowColor(s: string; var NColor, NColorText: TColor): boolean;
    procedure GetTabName(APagesNumber, ATabIndex: Integer; var AName, AFN, ALex: Widestring);
    procedure DoClearTabSwitcherList;
    procedure DoMoveTabInList(FromN, ToN: integer);

    function GetAcpFN(const LexerName: string): string;
    function GetSpecialHiliteFN(const Id: string): string;
    function GetHtmlListFN: string;
    function GetCssListFN: string;
    function GetHtmlTabbingFN: string;
    function GetLexerComment(const Lexer: string): string;

    function CurrentTabSwitcher: TTabSwitcher;
    function CurrentLexer: string;
    function CurrentLexerForFile: string;
    function DoSnippetTabbing: boolean;
    function DoSmartTagTabbing: boolean;
    procedure DoSmartHilite;
    procedure DoSmartHiliteOnClick;
    procedure DoHandleLastCmd(Command: integer; Data: pointer);

    procedure MsgFound;
    procedure MsgColorBad(const s: string);
    procedure MsgColorOK(const s: string);
    procedure MsgNoSelection;
    procedure MsgNoSelectionForHelp;
    procedure MsgNoRun(const fn: Widestring);
    procedure MsgNoFile(const fn: Widestring);
    procedure MsgNoDir(const fn: Widestring);
    procedure MsgEmptyMacro(const s: Widestring);
    procedure MsgDelLines(N: integer);
    procedure MsgDoneLines(N: integer);
    procedure MsgTabbing(const s: Widestring);

    procedure DoClearTreeFind;
    procedure DoCopyFindResultToTab(ALastSearch, AFilesOnly: boolean;
      AToClip: boolean = false);
    procedure DoCopyFindResultToList(ARootNode: TTntTreeNode;
      L: TWideStringList; AFilesOnly: boolean);
    procedure DoCopyFindResultNode;

    function SFindResPrefix(LineNum: integer): Widestring;
    function MacroName(n: integer): Widestring;
    function MacroCmdName(n: integer): Widestring;
    procedure SetLineEnds(Sender: TObject; AManual: boolean);
    function IsProjPreviewFocused: boolean;
    function IsListboxFocused: boolean;
    function IsTreeviewFocused: boolean;
    function CurrentListbox: TCustomListbox;
    function CurrentTreeview: TCustomTreeView;
    procedure DoFrameReloadInt(F: TEditorFrame);
    procedure DoFrameReloadWrapper(F: TEditorFrame);
    procedure DoFindAndExtendSel(ANext: boolean);
    function ShowGotoForm(
      var ALine, ACol: integer;
      var AExtSel: boolean;
      var AMode: TSynGotoMode;
      var ABkNum: integer): Boolean;
    function IsSearchEditFocused: boolean;
    function IsNumConvEditFocused: boolean;
    procedure DoTreeJump(Mode: TSynGotoTree);
    procedure FinderTreeFound(Sender: TObject; StartPos, EndPos: integer; Accept: Boolean);
    procedure FinderTreeNotFound(Sender: TObject);
    procedure SyncTree;
    procedure SyncMapData;
    procedure SyncMapPos;
    procedure MapClick(Sender: TObject);
    procedure DoFixReplaceCaret(Ed: TSyntaxMemo);
    function FCanUseLexer(const fn: Widestring): boolean;
    procedure SpellCopyClick(Sender: TObject);
    procedure SpellCutClick(Sender: TObject);
    procedure SpellPasteClick(Sender: TObject);
    procedure SpellItemClick (Sender: TObject);
    procedure SpellPopupDoMenu (Sender, Menu: TObject; XPos,
       YPos: Integer; var PopupAction: Integer; var PopupWord: string);
    procedure SpellPopupAddMenuItem (Sender, Menu,
     SubMenu: TObject; Caption: string; Enable, HasChildren: Boolean;
     Tag: Integer; var MenuItem: TObject);
    procedure SpellPopupCreateMenu(Sender: TObject;
     Owner: TComponent; var PopupMenu: TObject);
    procedure SpellDialogShow(Sender: TObject);
    procedure SpellPositionDialog(Sender: TObject);

    procedure DoRecordToMacro(Cmd: integer; Data: PWChar);
    procedure DoFindClip(Next: boolean);
    function SNewDocName(const fn: Widestring): string;
    procedure DoNewDocClick(Sender: TObject);
    procedure DoNewDocFolderClick(Sender: TObject);
    procedure DoTabIndexClick(n: integer);
    procedure DoRtTabIndexClick(n: integer);
    procedure DoTidy(const Cfg: string);
    procedure DoTidyClick(Sender: TObject);

    procedure DoBkDelete(Ed: TSyntaxMemo; DelUnmarked: boolean);
    procedure DoBkNext(Ed: TSyntaxMemo; Next: boolean);
    procedure DoDeleteLine(Ed: TSyntaxMemo; NLine: integer; ForceUndo: boolean = false);
    procedure DoReplaceLine(Ed: TSyntaxMemo; NLine: integer; const S: Widestring; ForceUndo: boolean = false);

    procedure InitGroups;
    procedure InitSpell;
    procedure DoZenExpand;
    procedure DoZenWrap;
    function DoZenExec(const s, sPadding: string): string;
    function DoClipItem: Widestring;
    procedure DoClipsItemCopy;
    procedure DoClipItemCopy;
    procedure DoClipItemIns;
    procedure DoSaveStyles(Sender: TObject);
    procedure DoAcpCss(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpHtm(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpHtmForTag(const STag, SAtr: string; List, Display: ecUnicode.TWideStrings);
    procedure DoAcpFromFile(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpCommand;
    function DoAcpFromPlugins(const AAction: PWideChar): Widestring;
    procedure DoInsertTextDialog;
    procedure DoFillBlock;
    procedure DoRepaintTBs;
    procedure DoRepaintTBs2;
    procedure DoSyncScroll(EdSrc: TSyntaxMemo);
    function DoCloseAllTabs: boolean;
    function DoCloseOtherTabs(AAllGroups, AForPopupMenu: boolean): boolean;
    procedure DoMoveTabToWindow(Frame: TEditorFrame; AndClose: boolean);
    function LastDir: Widestring;
    function LastDir_UntitledFile: Widestring;
    procedure SaveLastDir(const FN, Filter: Widestring; FilterIndex: integer);
    procedure SaveLastDir_Session(const FN: Widestring);
    procedure SaveLastDir_UntitledFile(const FN: Widestring);
    procedure SetFS(AValue: boolean);
    procedure SetOnTop(V: boolean);
    procedure DoBracketsHilite(Ed: TSyntaxMemo);
    procedure DoListCopy(Sender: TTntListbox);
    procedure DoListCopyAll(Sender: TTntListbox);
    procedure FinderContinue(Sender: TObject; var ACanContinue: boolean);
    procedure FinderFind_WithResultPane(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure FinderFind_WithBkmk(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure FinderFind_WithResultPaneAndBkmk(Sender: TObject;
      StartPos, EndPos: integer; var Accept: Boolean);
    procedure FinderCanAccept(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure DoHandleKeysInPanels(var Key: Word; Shift: TShiftState);
    function DoNavigate_ListOut(const Str: Widestring): boolean;
    function DoNavigate_ListVal(const Str: Widestring): boolean;
    function IsNavigatableLine(const Str: Widestring): boolean;
    procedure DoNewDoc(const fn: Widestring);
    procedure RunBrowser(const fn: Widestring);
    procedure RunTool(const ATool: TSynTool);
    procedure RunMacro(n: Integer);
    procedure AppException(Sender: TObject; E: Exception);
    function MsgEncReload: boolean;
    function MsgConfirmFtp: boolean;

    procedure InitSynIniDir;
    procedure LexListClick(Sender: TObject);
    procedure FinderInit(Sender: TObject);
    procedure FinderFail(Sender: TObject);
    procedure FinderProgress(CurPos, MaxPos: integer);
    procedure FindCurrentWord(ANext: boolean);
    function LocalizedEncodingName(const s: Widestring): Widestring;

    function IsShortcutOfCmd(sh: TShortcut; cmd: integer): boolean;
    function GetShortcutOfCmd(id: integer): TShortcut;
    function GetShortcutTextOfCmd(id: integer): string;
    procedure GetShortcutOfMacro(n: integer; var sh: TShortcut);
    procedure SetShortcutOfMacro(n: integer; const sh: TShortcut);

    procedure DoReplaceTabsToSpaces(F: TEditorFrame);
    procedure DoOnlineWordHelp(const url: Widestring);
    procedure DoOnlineFind(const site: Widestring);

    procedure FindAction(act: TSRAction);
    procedure FindActionWrapper(act: TSRAction);
    procedure FindFocusEditor(Sender: TObject);
    procedure FindDialog(AReplaceMode: boolean);
    procedure FindInFile(const fn: Widestring; InCodepage: TSynCpOverride = cp_sr_Def);
    procedure FindInFrame(F: TEditorFrame;
      AMarkAll: boolean = false;
      AWithBkmk: boolean = false);
    procedure ReplaceInFile(const fn: Widestring);
    procedure ReplaceInAllTabs(var nRep, nFiles: integer);
    procedure DoMarkAll(const Str: Widestring);

    function GetIcons: integer;
    function GetTheme: string;
    procedure SetIcons(A: integer);
    procedure SetTheme(const S: string);
    procedure LoadTools;
    procedure SaveTools;
    procedure DoEnableTool(T: TSpTbxItem; n: integer; ForCtx: boolean = false);
    procedure LoadHtmlAndCssLists;

    function DoConfirmClose: boolean;
    function DoConfirmSaveLexLib: boolean;
    function DoConfirmSaveSession(CanCancel: boolean; ExitCmd: boolean = false): boolean;

    procedure LoadClip;
    procedure LoadProj;
    procedure LoadProjPreview;
    procedure LoadMap;
    procedure LoadClips;
    procedure LoadIni;
    procedure LoadLexLib;
    procedure LoadMacros;
    procedure LoadPrintOptions;
    procedure LoadHideIni;
    procedure SaveOptionsRecent;
    procedure SaveMacros;
    procedure SavePrintOptions;
    procedure SaveLexLib;
    procedure SaveLexLibFilename;
    procedure SaveToolbarsProps;
    function DoReadTotalHistory: Widestring;

    function IsPositionMatchesTokens(Ed: TSyntaxMemo; StartPos, EndPos: Integer;
      OptTokens: TSearchTokens): boolean;

    procedure DoJumpToNextSearchResult(ANext: boolean);
    procedure DoJumpToNextOutputResult(AOutputPanel: boolean; ANext: boolean);
    procedure DoHideMenuItem(const Str: string);
    function IsLexerFindID(const Lex: string): boolean;

    procedure MsgBakEr(const fn: Widestring);
    procedure MsgBakOk(const fn: Widestring);
    procedure DoDateTime;
    procedure DoExtractText;
    procedure DoAcpPopup;
    procedure DoFuncHintPopup;
    procedure DoInsertImageTag(const fn: string);
    function DoCheckUnicodeNeeded(Frame: TEditorFrame): boolean;

    function GetFrameEncoding(F: TEditorFrame): integer;
    procedure ApplyFrameEncoding(Frame: TEditorFrame; AEnc: Integer);
    procedure ApplyFrameEncodingAndReload(Frame: TEditorFrame; AEnc: Integer;
      ACanReload: boolean = true);
    procedure MenuitemSetEncoding(Sender: TObject);
    procedure MenuitemConvertEncoding(Sender: TObject);

    procedure ApplyPreviewZoom(NValue: Integer);
    procedure DoCheckAutoShowACP(Ed: TSyntaxMemo);
    procedure DoLinesCommand(Cmd: TSynLineCmd);
    procedure DoToggleLineComment(Alt: boolean);
    procedure DoCopyFilenameToClipboard(F: TEditorFrame; Cmd: TSynCopyNameCmd);
    function IsCommandAllowedInMacro(Cmd: Integer): boolean;
    procedure DoTreeLevel(NLevel: Integer);
    procedure DoFoldLevel(NLevel: Integer);
    procedure DoToolbarCommentUncomment(AComment: boolean);
    procedure LoadToolbarProp(Toolbar: TSpTbxToolbar; Ini: TCustomIniFile; const Id: string);
    procedure SaveToolbarProp(Toolbar: TSpTbxToolbar; Ini: TCustomIniFile; const Id: string);
    procedure SavePanelProp(Panel: TSpTbxDockablePanel; Ini: TCustomIniFile; const Id: string);
    procedure LoadPanelProp(Panel: TSpTbxDockablePanel; Ini: TCustomIniFile;
      const Id: string; DefFloating: boolean = false);
    procedure LoadToolbarContent(Toolbar: TObject; Id: string; AutoShow: boolean = false);
    function DoShowCmdList: Integer;
    function DoShowCmdListStr: string;
    function DoShowCmdHint(Cmd: Widestring): Widestring;
    function DoCustomizeToolbar(const Id: string): boolean;
    procedure DoCustomizeAndReloadToolbar(Id: TSynUserToolbarId);
    procedure ToolbarUserClick(Sender: TObject);
    procedure DoEnumExtTools(L: TTntStringList);
    procedure DoEnumPyTools(L: TTntStringList);
    procedure InitMenuItemsList;
    procedure DoOpenBySelection;
    procedure FixMenuBigImageList(Menu: TSpTbxSubmenuItem);
    procedure FixMruBigImageList(Menu: TSpTbxMruListItem);
    procedure FixSplitters;
    function SynFilesFilter: Widestring;
    procedure DoOptionsDialog(tabId: Integer);
    procedure DoTreeFocus;
    procedure DoGetOppositeEditor(
      const EdSrc: TSyntaxMemo;
      var EdOther: TSyntaxMemo;
      var DiffInTopLines: Integer;
      var EdSrcOnGroup1: boolean);
    procedure LoadAcpFromFile(const fn, Lexer: string);
    procedure DoOpenBrowserPreview;
    procedure DoOpenCurrentFile;
    procedure DoOpenCurrentDir;
    procedure DoOpenCmdPrompt;
    function SynHiddenOption(const Id: string; Default: integer): Integer;
    procedure DoRememberTempFile(const fn: Widestring);
    procedure DoDeleteTempFiles;
    procedure DoCopySearchMarks(Ed: TSyntaxMemo);
    procedure ConvClick(Sender: TObject);
    procedure DoTextConverter(Ed: TSyntaxMemo; const fn: Widestring; ToBack: boolean);

    procedure ShowProj;
    procedure DoOpenProject; overload;
    procedure DoAddFileToProject;
    procedure DoAddFilesToProject;
    procedure DoFavoriteProjects;
    procedure DoFavoritesDialog(ATab: Integer = -1);
    procedure DoPasteAndSelect;
    procedure DoCopyURL;
    procedure DoOpenURL;
    function UpdateCurrentColorCode(var AColor: Integer): boolean;
    procedure DoAddCurrentColorCodeToRecents;
    procedure DoSaveFolding;
    procedure DoLoadFolding;
    procedure DoOpenLastClosedFile;
    procedure ProjPreview(Sender: TObject; const AFilename: Widestring; AToggle: boolean);
    procedure ProjRunTool(const ATool: TSynTool);
    procedure ProjPreviewClose(Sender: TObject);
    procedure ProjPreviewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ProjPreviewButtonClick(Sender: TObject);
    procedure DoCloseTabsOnProjectClosingIfNeeded;
    procedure DoProjectRenameFile(const fn, fn_new: Widestring);
    procedure UpdKey_String(Item: TSpTbxItem; const Cmd: Widestring);
    procedure UpdKey(Item: TSpTbxItem; CmdId: integer);
    procedure DoClearFilesHistory;
    procedure DoToggleSyncEditing;
    procedure DoZoomEditorInc(AInc: boolean);
    procedure DoZoomEditor(NZoom: Integer);
    procedure DoExtendSelection(Ed: TSyntaxMemo);
    function MsgConfirmOpenSaveSession(AFilesCount: Integer;
      const AFileName: string; ASaveMode: boolean): boolean;

    //python group
    procedure DoPyConsole_EnterCommand(const Str: Widestring);
    procedure DoPyConsole_RepeatCommand;
    procedure DoPyNewPluginDialog;
    procedure DoPyRegisterCommandPlugin(const SId: string);
    function DoPyLoadPlugin(
      const SFilename, SCmd: string): string;
    function DoPyLoadPluginWithParams(
      const SFilename, SCmd: string;
      AEd: TSyntaxMemo;
      const AParams: array of string): Widestring;
    procedure DoPyStringToEvents(const Str: string;
      var AEvents: TSynPyEvents;
      var AKeycodes: string);
    procedure DoPyResetPlugins;

    procedure LoadConsoleHist;
    procedure SaveConsoleHist;
    procedure InitSnippets;
    procedure LoadSnippets;
    procedure ClearSnippets;
    function DoSnippetChoice(const SInitialText: string): integer;
    procedure DoSnippetListDialog(const SInitialText: string);
    function DoSnippetEditorDialog(var AInfo: TSynSnippetInfo): boolean;
    procedure DoSnippetNew;
    procedure DoSnippetsReload;
    procedure ApplyPanelTitles;
    procedure DoQuickSearch(AMode: TSynQuickSearchType);
    procedure DoWorkaround_QViewHorzScroll;
    procedure DoWorkaround_FindNext1;
    procedure DoShowHintFilename(const fn: Widestring);
    function DoCheckAutoCorrectCase(Ed: TSyntaxMemo): boolean;
    procedure DoClearFindDialogStatus;
    procedure ProjPreviewVisibleChanged(Sender: TObject);
    procedure DoReplaceFileNameMacro(var Str: Widestring; const StrId: string; ViewId: TSynGroupId);
    procedure UpadateFilenameForExport;
    procedure DoConfigTools;
    procedure DoConfigShellOptions;
    procedure DoConfigHideItems;
    procedure DoConfigRestoreStyles;
    procedure DoToggleTabDirs;
    procedure DoInsertUnicodeHexDialog;
    function DoSetPagesAndTabIndex(APageIndex, ATabIndex: Integer): boolean;

    function DoAddTab(Pages: TATPages): TEditorFrame;
    procedure TabAdd(Sender: TObject);
    procedure TabFocus(Sender: TObject);
    procedure TabClose(Sender: TObject; ATabIndex: Integer;
      var ACanClose, ACanContinue: boolean);
    procedure TabPopup(Sender: TObject);
    procedure TabOver(Sender: TObject; ATabIndex: Integer);
    //end of private

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WMCommandAny(var Msg: TMessage); message WM_USER + 1;
    procedure WMCommandWithClose(var Msg: TMessage); message WM_USER + 2;
    //end of protected

  public
    SynDir: string;
    SynIniDir: string;
    SynExe: boolean;
    SynIsPortable: boolean;
    SynProjectSessionFN: string;

    Groups: TATGroups;
    fmProgress: TfmProgress;
    hLister: HWnd;
    ColorsArray: TSynColors;

    SynPyLog: TSynLogPanelKind;
    SynPanelPropsOut,
    SynPanelPropsVal: TSynLogPanelProps;

    SynMruFiles: TSynMruList;
    SynMruSessions: TSynMruList;
    SynMruProjects: TSynMruList;
    SynMruNewdoc: TSynMruList;

    FProjPreview: TSpTBXDockablePanel;
    FProjPreviewFilename: Widestring;
    FProjPreviewEditor: TSyntaxMemo;
    FProjPreviewButton: TSpTbxItem;

    //opt
    opGroupMode: TATGroupsMode;
    opGroupSplit: Integer;
    opHintScroll: boolean;
    opPyChangeDelay: DWORD;
    opAutoCase: boolean;
    opShowPanelTitles: boolean;
    opTreeSorted: string;
    opUnderlineColored: integer;
    opSyncEditIcon: boolean;
    opTabFontSize: integer;
    opWordChars: Widestring;
    opNonPrint,
    opNonPrintSpaces,
    opNonPrintEol,
    opNonPrintEolDetail: boolean;
    opCaretShape: integer;
    opMaxTreeMatches: integer;
    opCaretsEnabled: boolean;
    opCaretsIndicator: integer;
    opCaretsGutterBand: integer;
    opSingleClickURL: boolean;
    opSortMode: TSynSortMode;
    opCopyLineIfNoSel: boolean;
    opAutoCloseTags: boolean;
    opAutoCloseBrackets: boolean;
    opAutoCloseBracketsNoEsc: boolean;
    opAutoCloseQuotes: boolean;
    opLexersOverride: string;
    opShowRecentColors: TSynRecentColors;
    opUnicodeNeeded: integer;
    opTabColors: array[0..Pred(cTabColors)] of integer;
    opColorAcpText: integer;
    opColorAcpBg: integer;
    opColorCaretsGutter: integer;
    opColorMapMarks: integer;
    opColorBkmk: integer;
    opShowWrapMark: boolean;
    opTabVisible: boolean;
    opTabAtBottom: boolean;
    opTabDirs: boolean; //show folder names before file names on tabs
    opTabNums: boolean; //show numbers on tabs
    opTabBtn: boolean; //show [x] button on tabs
    opTabPlus: boolean;
    opTabOptionsIndex: integer; //id of active tab in Options dialog
    opTabOptionsLast: integer; //index of last closed tab in Options dialog
    opTabMaxWidth: integer; //max width of tabs
    opTabDragDrop: boolean; //allow D&D of tabs
    opTabsSortMode: integer; //sort mode for Tabs panel
    opTabSwitcher: boolean; //use modern tab switcher (Ctrl+Tab)
    opStateForTemp: boolean;
    opTipsPanels: boolean;
    opTipsToken: boolean;
    opFollowTail: boolean;
    opSrExpand: boolean; //Expand results tree on progress
    opSrOnTop: boolean; //Find dlg on top
    opSrSuggestSel: boolean; //Suggest selection
    opSrSuggestWord: boolean; //Suggest current word
    opASaveOnTimer,
    opASaveOnFocus,
    opASaveAllFiles: boolean;
    opASaveTimeMin: integer;
    opASaveMaxSizeKb: integer;
    opASaveUnnamed: TSynAutoSaveUnnamed;
    opASaveUnnamedDir: string;
    opMapZoom: integer;
    opMicroMap: boolean;
    opColorMap: integer;
    opBigSize: integer; //size in Mb for lexer-off
    opBkUndo: boolean;
    opZenProfile: string;
    opProjPaths: Widestring;
    opHiliteBrackets: boolean;
    opColorOutSelBk,
    opColorOutSelText,
    opColorOutRedText,
    opColorOutRedSelText,
    opColorOutHi: integer;
    opTools: TSynToolList;
      //Note: if need to change max count of tools, also change these places:
      //- in design time create more items in "Run" menu (at top)
      //- in design time create more items in PopupEditor menu (at bottom)
      //- fix procedure TfmMain.UpdateTools
      //
    opStatusText: array[TSynSelState] of string;
    opSpellEn: boolean;
    opSpellExt: string;
    opShowMenuIcons: boolean;
    opHiliteSmart: boolean;
    opHiliteSmartCase: boolean;
    opHiliteSmartWords: boolean;
    opHiliteSmartOnClick: boolean;
    opDateFmt,
    opDateFmtPLog: string;
    opFileBackup: TSynBackup;
    opEsc: TSynEscMode;
    opHistProjectSave,
    opHistProjectLoad: boolean;
    opHistProjectCloseTabs: boolean;
    opHistFilter: integer;
    opHistSessionSave,
    opHistSessionLoad,
    opHistSessionProjSave,
    opHistSessionProjLoad,
    opHistSessionDef: boolean;
    opNewEnc,
    opNewLineEnds: integer;
    opNewLex: string;
    opMruCheck: boolean; //check MRU on start
    opTabsReplace: boolean; //replace tabs->spaces on reading
    opTemplateTabbing: boolean; //use Tab key for code templates
    opTemplateTabbingExcept: string; //exclution file-ext list for ^^
    opAcpForceText: boolean; //enable to show only words from current file
    opAcpUseSingle: boolean; //auto insert single match
    opAcpChars: string; //additional word chars (lexer specific)
    opAcpHtm: boolean; //Special ACP for HTML
    opAcpCss: boolean; //Special ACP for CSS
    opAcpTabbing: boolean; //Special SmartTagTabbing feature
    opAcpFile: boolean; //ACP from curr file
    opAcpFileChars: integer; //Min word length for ACP from file
    opAcpFileSize: real; //Max file size for ACP from file
    opAcpNum: integer; //Num of chars that starts ACP
    opAcpHintDelay: integer;
    opSingleInstance: boolean; //single instance
    opLang: integer;
    opLexerGroups: boolean;
    opReloadMode: TSynReloadMode;
    opHiliteUrls: boolean;
    opColorLink: integer;
    opKeepCaretOnScreen: boolean;
    opLastDir: TSynLastDirMode;
    opLastDirPath,
    opLastDirSession,
    opLastDirProject: Widestring;
    opSaveSRHist,
    opSaveState: integer;
    opSaveWndPos,
    opSaveEdCaret,
    opSaveEdEnc: boolean;
    opAskOverwrite: boolean;
    opTextOnly: integer; //dont-open/ open/ prompt
    opShowTitleFull: boolean;
    opShowQsCaptions: boolean;
    opColorTabText,
    opColorTabBgActive,
    opColorTabBgActive2,
    opColorTabBgPassive,
    opColorTabBgPassiveOver,
    opColorTabBorderActive,
    opColorTabBorderPassive: integer;
    opShowCharInfo: boolean;
    opOem,
    opUTF8: string;

    FLockUpdate: boolean;
    FFinderTotalSize: Int64;
    FFinderDoneSize: Int64;

    Finder: TSynFinderReplacer;
    FinderInTree: TFinderInTree;
    FinderInList: TFinderInList;

    //public methods
    //plugins related
    function PluginAction_TranslatePos(var PosX, PosY, PosAbs: Integer; Direction: Boolean): Integer;
    function PluginAction_ReplaceText(DelLen: Integer; BufPtr: Pointer; BufSize: Integer): Integer;
    function PluginAction_GetProp(id: Integer; Buffer: Pointer; Param: Integer): Integer;
    function PluginAction_SetTopLine(Num: Integer): Integer;
    function PluginAction_GetSel(var Sel: TSynSelection): Integer;
    function PluginAction_SetSel(const Sel: TSynSelection): Integer;
    function PluginAction_SetText(const id: Integer; BufferPtr: Pointer; BufferSize: Integer): Integer;
    function PluginAction_GetText(const id: Integer; BufferPtr: Pointer; var BufferSize: Integer): Integer;
    function PluginAction_GetCaretPos(PtrX, PtrY, PtrAbs: PInteger): Integer;
    function PluginAction_ParseRegex(const SRegex, SStr: Widestring; var Res: TSynRegexArray): Integer;
    function PluginAction_SetCaretPos(AX, AY: Integer): Integer;
    function PluginAction_SuggestCompletion(const Str: PWideChar; NChars: Integer; ShowPopup: boolean): Integer;
    function PluginAction_ControlLog(const AMsg: Widestring; const ACmd: Integer; AColor: TColor): Integer;
    function PluginAction_ShowHint(const AMsg: Widestring): Integer;
    function PluginAction_GetMsg(const ADllFN, AMsg: Widestring; AResult: PWideChar): Integer;
    function PluginAction_GetOpenedFN(id: Integer; ptr: PWideChar): Integer;
    function PluginAction_GetProjectFN(id: Integer; ptr: PWideChar): Integer;
    function PluginAction_OpenFtpFile(const fn: Widestring; AInfoPtr: Pointer; AInfoSize: Integer): Integer;
    function PluginAction_OpenFile(const fn: Widestring): Integer;
    function PluginAction_SaveFile(id: Integer; ACanPrompt: boolean): Integer;
    function PluginAction(AHandle: Pointer; AName: PWideChar; A1, A2, A3, A4: Pointer): Integer; stdcall;
    function Plugin_FrameById(id: Integer): TEditorFrame;

    function SynClipsDir: string;
    function SynDictDir: string;

    procedure UpdateRO;
    procedure UpdateGutter(F: TEditorFrame; AUpdateCur: boolean = true);
    procedure UpdateQVTree(const fn: Widestring);
    procedure UpdateStatusBar;
    procedure UpdateLexerTo(An: TSyntAnalyzer);
    procedure UpdateOnFrameChanged;

    property opTabsWidths: Widestring read GetTabsWidths write SetTabsWidths;
    property ShowFullScreen: boolean read FFullScr write SetFS;
    property ShowOnTop: boolean read FOnTop write SetOnTop;

    procedure ApplyTabOptions;
    procedure UpdateActiveTabColors;
    procedure ApplyCarets;
    procedure ApplyUrlClick;
    procedure ApplyShowRecentColors;
    procedure ApplySpell;
    procedure ApplyProj;
    procedure ApplyFrames;
    procedure ApplyFramesGutters;
    procedure ApplyTips;
    procedure ApplyAutoSave;
    procedure ApplyDefaultFonts;
    procedure ApplyInst;
    procedure ApplyQs;
    procedure ApplyEdOptions;
    procedure ApplyFonts;
    procedure ApplyColors;
    procedure ApplyACP;
    procedure ApplyAcpColors;
    procedure ApplyOut;
    procedure ApplyMap;
    procedure ApplyBorders;
    procedure ApplyColorsFontsToFrames;

    procedure DoColorsArrayInit(var C: TSynColors);
    procedure DoColorsArrayRead(var C: TSynColors; const StrIni: string);
    function DoColorsArrayAsString(const C: TSynColors): string;
    procedure DoColorsArrayApply(const C: TSynColors; Ed: TSyntaxMemo);

    procedure DoSpellConfig(Sender: TObject);
    procedure DoAutoSave;
    procedure DoBackup(const AFilename: Widestring);
    procedure DoRepaint;
    procedure DoDropFile(const fn: Widestring; IntoProj: boolean = false);
    procedure DoTabSwitch(ANext: boolean; AAllowModernSwitch: boolean = true);
    procedure FocusEditor;
    procedure FocusProj;
    procedure FindInit(AKeepFlags: boolean = false);
    function IsMouseOverProject: boolean;

    constructor CreateParented(hWindow: HWND);
    function DoOpenFile(const AFileName: WideString): TEditorFrame;
    procedure DoOpenProject(const fn: Widestring); overload;
    procedure DoOpenArchive(const fn: Widestring);
    procedure DoOpenFolder(const dir: Widestring);
    procedure DoNewProject;
    procedure DoSaveProject;
    procedure DoUpdateProject;
    procedure SaveOptionsAll;
    procedure DoSaveProjectSession;
    procedure DoOpenProjectSession;
    procedure SaveFrameState(F: TEditorFrame);
    function LoadFrameState(Frame: TEditorFrame; const fn: WideString): boolean;

    procedure DoOpenSession(AFilename: string; AddMode: boolean = false);
    procedure DoCloseSession(PromptToSave: boolean);
    procedure DoSaveSessionToFile(const fn: string);
    procedure DoSaveSession;
    procedure DoSaveSessionAs;
    procedure DoSessionOpenDialog;
    procedure DoSessionAddDialog;

    //event handlers
    procedure SynCaretPosChanged(Sender: TObject);
    procedure SynKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynExecuteCommand(Sender: TObject; Command: Integer; Data: Pointer; var Handled: Boolean);
    procedure SynScroll(Sender: TObject);
    procedure SynChange(Sender: TObject);
    procedure SynGetTokenHint(Sender: TObject; TokenIndex: Integer; var HintText: String);
    procedure SynSpellCheckerCheckWord(Sender: TObject;
      const AWord: WideString; APos: Integer; var Valid: Boolean);
    procedure SynContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure SynContextGutterPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);

    //frame---------------------------------------------------------------------
    property CurrentEditor: TSyntaxMemo read FCurrentEditor write SetCurrentEditor;
    property FrameCount: integer read GetFrameCount;
    property FrameAllCount: integer read GetFrameAllCount;
    property Frames[Index: integer]: TEditorFrame read GetFrames;
    property FramesAll[Index: integer]: TEditorFrame read GetFramesAll;
    function FrameIndex(F: TEditorFrame): Integer;
    property CurrentFrame: TEditorFrame read GetCurrentFrame write SetCurrentFrame;
    function CreateFrame: TEditorFrame;
    procedure CloseFrame(Frame: TEditorFrame);
    procedure CloseFrameWithCfm(F: TEditorFrame; var ACanClose, ACanContinue: boolean);
    //---------------------------------------------------------------------

    property Icons: integer read GetIcons write SetIcons;
    property Theme: string read GetTheme write SetTheme;
    //procedure TestApi;
    function IsPluginWindowActive(var HWnd: THandle): boolean;
    function opMarkDeletedAsModified: boolean;
    procedure DoHint(S: WideString);
    procedure DoHandleQuickSearchEscape;
    function DoHandleEscapeActions: boolean;
    function IsWordChar(ch: WideChar): boolean;
    procedure DoFindId;
    function FrameForFilename(const fn: Widestring): TEditorFrame;
    function DoCheckCommandLineTwo: boolean;
    procedure DoClearSearchHistory;
    procedure DoEnumLexers(L: TTntStrings; AlsoDisabled: boolean = false);
    function DoPyEvent(
      AEd: TSyntaxMemo;
      AEvent: TSynPyEvent;
      const AParams: array of string): Widestring;
    procedure DoPyEvent_GetLineNumber(
      AEd: TSyntaxMemo;
      const ALineNum: Integer;
      var AResult: string);

    function FrameOfEditor(Ed: TSyntaxMemo): TEditorFrame;
    function BrotherEditor(Ed: TSyntaxMemo): TSyntaxMemo;
    function DoGetProjectFilename(id: Integer): Widestring;
    function CurrentFileName(Id: TSynGroupId): Widestring;
    function CurrentSessionFN: string;
    function CurrentContentFN(Unicode: boolean): Widestring;
    function CurrentSelectionFN(Unicode: boolean): Widestring;
    function CurrentProjectFN: Widestring;
    function CurrentProjectSessionFN: string;
    function CurrentProjectMainFN: Widestring;
    function CurrentProjectWorkDir: Widestring;
    function CurrentProjectDir: Widestring;

    function SynIni: string;
    function SynToolbarsIni: string;
    function SynFavIni: string;
    function SynStylesIni: string;
    function SynHistoryStatesIni: string;
    function SynFoldStatesIni: string;
    function SynMacrosIni: string;
    function SynHideIni: string;
    function SynHistoryIni: string;
    function SynTidyIni: string;
    function SynPluginsIni: string;
    function SynPluginsSampleIni: string;
    function SynPluginIni(const SCaption: string): string;
    function SynSkinsDir: string;
    function SynPyDir: string;
    function SynSnippetsDir: string;
    function SynSkinFilename(const Name: string): string;
    function SynConverterFilename(const Name: string): string;
    function SynLexersCfg: string;
    function SynLexersExCfg: string;
    function SynLexLib: string;

    function DoGetFavList: Widestring;
    function DoGetSearchPaths: Widestring;
    function DoFindCommand(
      Ed: TSyntaxMemo;
      Act: TSRAction;
      const SText1, SText2: Widestring;
      const Opt: TSearchOptions;
      const Tok: TSearchTokens;
      OptBkmk, OptExtSel: boolean): Integer;
    procedure DoPyConsole_LogString(const Str: Widestring);
    //end of public
  end;

var
  SynListerIni: string = ''; //passed from Totalcmd API
  opListerSynDialog: boolean;
  opListerTcHistory: boolean;
  opListerQVReadOnly: boolean;
  opListerQVToolbars,
  opListerQVTree: string;
  opListerTextOnly: integer;
  opListerStartRO: boolean;

function SynStart(ListerWin: HWND; const FileToLoad: WideString): HWND;
procedure SynStop(hWin: HWND);
function IsFileTooBig(const fn: WideString): boolean;

function MsgConfirmBinary(const fn: WideString; H: THandle): boolean;
function MsgConfirmCreate(const fn: Widestring; H: THandle): boolean;
procedure MsgFileTooBig(const fn: Widestring; H: THandle);
procedure MsgCannotCreate(const fn: Widestring; H: THandle);
function MsgInput(const dkmsg: string; var S: Widestring): boolean;
function SynAppdataDir: string;

const
  cSynVer = '6.6.1245';
  cSynPyVer = '1.0.132';

const
  cSynParamRO = '/ro';
  cSynParamSingleInst = '/s';
  cSynParamLineNum = '/n=';
  cSynParamReg = '/reg';
  cSynParamTwo = '/two=';
  cSynParamCmp = '/cmp=';

var
  fmMain: TfmMain = nil;
  _SynActionProc: TSynAction = nil;

implementation

uses
  Clipbrd, Registry, CommCtrl,
  StrUtils, Types, Math, ShellApi,
  Variants,

  TntSystem, TntSysUtils,
  TntClipbrd, TntFileCtrl,
  TntWideStrings,
  TntWideStrUtils,

  ATxFProc,
  ATxColorCodes,
  ATxLoremIpsum,
  ATxUnpack,

  {$ifdef SPELL}
  ad3SpellBase,
  ad3SpellLanguages,
  ad3Ignore,
  {$endif}

  TB2Consts,

  ecExports,
  ecZRegExpr,
  ecCmdConst,
  ecLists,

  unSaveLex,
  unProcImg,
  unSetup, unAb, unEnc, unTool, unSRFiles, unExtr, unShell, unInsTxt,
  unLoadLexStyles, unMacroEdit, unGoto, unCmds,
  unProcTabbin, unProp, unGotoBkmk, unLoremIpsum, unFav, unFillBlock,
  unMenuCmds, unMenuProj, unMenuSnippets,
  unToolbarProp, unHideItems,
  unProcPy,
  unMainPy,
  unLexerLib, unSnipEd, unSaveTabs;

{$R *.dfm}
{$R Cur.res}
{$R Text.res}

const
  cConverterHtml1 = 'HTML - all entities';
  cConverterHtml2 = 'HTML - entities except brackets';

const
  cSynColorSwatchExt = 'synw-colorstring';
  cSynSnippetExt = 'synw-snippet';
  cSynSessionExt = 'synw-session';

const
  cRegexColorCode = '\#\w{3,6}';
  cRegexColorName = '[a-z]{3,30}';
  cColorNotFound = $AAAAFF;

const
  cThemeWindows = 'Windows';
  cThemeDefault = 'Office XP';
  cThemes: array[0..12] of string = (
    cThemeWindows,
    'Aluminum',
    'Athen',
    'Dream',
    'Eos',
    'Human',
    'Leopard',
    'Xito',
    'Office XP',
    'Office 2003',
    'Office 2007 Blue',
    'Office 2007 Black',
    'Office 2007 Silver'
    );

const
  cAcpCharsCss = '-#!@.'; //don't include ':'
  cAcpCharsPhp = '$'; //include '$'
  cAcpCharsHtm = ''; //empty?

const
  cp__UTF8       = -1;
  cp__UTF8_noBOM = -2;
  cp__Unicode    = -3;
  cp__UnicodeBE  = -4;

function SAcpItem(const s1, s2: string): string;
begin
  Result:= '\s1\' + s1 + '\t\\s2\' + s2;
end;

function MsgConfirmBinary(const fn: Widestring; H: THandle): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('MNText'), [WideExtractFileName(fn)]), H);
end;

function MsgConfirmCreate(const fn: Widestring; H: THandle): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('MCre'), [WideExtractFileName(fn)]), H);
end;

function MsgConfirmManyOpen(N: Integer; H: THandle): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('zMOpenFiles'), [N]), H);
end;

procedure MsgFileTooBig(const fn: Widestring; H: THandle);
begin
  MsgError(WideFormat(DKLangConstW('MBig'), [WideExtractFileName(fn)]), H)
end;

procedure MsgCannotCreate(const fn: Widestring; H: THandle);
begin
  MsgError(DKLangConstW('MNCreate') + #13 + fn, H);
end;


const
  cLexerHtmlList = 'HTML documents,HTML with scripts,PHP_dev_HTML,Razor';
  cLexerPhpList = 'PHP,PHP (dev)';
  cLexerCss = 'Style sheets';
  cLexerCssList = 'LESS,SASS,SCSS,Sass,Stylus';
  cLexerXML = 'XML';
  cLexerJS = 'JavaScript';
  cLexerNfo = 'NFO files';
  cLexerMake = 'Make files';
  cLexerProp = 'Properties';
  cLexerIni = 'Ini files';
  opPascal = 'Pascal,Pascal Ext,Pascal Script,PAX Pascal,BSScript';

function IsLexerListed(const Lexer, List: string): boolean;
begin
  Result:= IsStringListed(
    LowerCase(Lexer),
    LowerCase(List));
end;

function IsLexerHTML(const s: string): boolean;
begin
  //this will count all lexers with "HTML" substring, also
  //custom user lexers with word "HTML".
  Result:= Pos('HTML', s)>0;
end;

function IsLexerCSS(const s: string; CanBeLess: boolean = true): boolean;
begin
  Result:=
    (s=cLexerCss) or
    (CanBeLess and IsLexerListed(s, cLexerCssList));
end;

function IsLexerPHP(const s: string): boolean;
begin
  Result:= IsLexerListed(s, cLexerPhpList);
end;

function IsLexerJS(const s: string): boolean;
begin
  Result:= (s=cLexerJS);
end;

function IsLexerXML(const s: string): boolean;
begin
  Result:= (s=cLexerXML);
end;

function IsLexerWithTags(const s: string): boolean;
begin
  Result:= IsLexerHTML(s) or IsLexerXML(s);
end;

function IsLexerWithImages(const s: string): boolean;
begin
  Result:= IsLexerHTML(s) or IsLexerCSS(s);
end;

function IsLexerNFO(const s: string): boolean;
begin
  Result:= (s=cLexerNfo);
end;

function IsLexerMake(const s: string): boolean;
begin
  Result:= (s=cLexerMake);
end;

function IsLexerPas(const s: string): boolean;
begin
  Result:= IsLexerListed(s, opPascal);
end;

function IsLexerProp(const s: string): boolean;
begin
  Result:= (s = cLexerProp);
end;

function IsLexerIni(const s: string): boolean;
begin
  Result:= (s = cLexerIni);
end;

function IsLexerWithColors(const s: string): boolean;
begin
  Result:=
    IsLexerCSS(s) or
    IsLexerHTML(s) or
    IsLexerJS(s) or
    IsLexerPHP(s) or
    IsLexerProp(s) or
    IsLexerIni(s);
end;

//-------------------
const
  itm_wrap    = $FFFC;
  itm_percent = $FFFE;

type
  TPlugInfo = record
    PlugWinProc: Pointer; //callback function of our form
    PlugForm: TfmMain;    //our form
  end;

//----------------------------------------------------------------------------------
procedure TfmMain.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style:= (WS_CHILD or WS_MAXIMIZE) and not WS_CAPTION and not WS_BORDER;
  Params.WindowClass.cbWndExtra:= SizeOf(Pointer); //4 bytes for address of form
end;

constructor TfmMain.CreateParented(hWindow: HWND);
begin
  inherited CreateParented(hWindow);
  hLister:= hWindow;
  QuickView:= GetParent(hLister) <> 0;
end;

//hook form messages
function HookDestroy(hWin: HWND; Msg, wParam, lParam: LongInt): LongInt; stdcall;
var
  p: ^TPlugInfo;
begin
  Result:= 0;
  p:= Pointer(GetWindowLong(hWin, GWL_USERDATA));
  if Msg = WM_DESTROY then
    SynStop(hWin)
  else
  if Msg = WM_SETFOCUS then
    p^.PlugForm.FocusEditor
  else
    Result:= CallWindowProc(p^.PlugWinProc, hWin, Msg, wParam, lParam);
end;

//hook close button of lister window to make 'Cancel' possible
function HookList(hWin: HWND; Msg, wParam, lParam: LongInt): LongInt; stdcall;
var
  p: ^TPlugInfo;
begin
  p:= Pointer(GetWindowLong(hWin, GWL_USERDATA));
  if (Msg=WM_ACTIVATE) and (wParam<>0) then
  begin
    p^.PlugForm.FocusEditor;
    Result:= 0;
    Exit;
  end;
  {
  //already done this in FormCloseQuery
  if (Msg = WM_CLOSE) and (not p^.PlugForm.DoConfirmClose) then begin
    Result:= 0;
    Exit;
  end;
  }
  Result:= CallWindowProc(p^.PlugWinProc, hWin, Msg, wParam, lParam);
end;

procedure SynStop(hWin: HWND);
var
  p: ^TPlugInfo;
  N: integer;
begin
  N:= GetWindowLong(GetParent(hWin), GWL_USERDATA);
  if N<>0 then
  try
    p:= Pointer(N);
    p^.PlugForm.Close;
    //restore callback function
    SetWindowLong(GetParent(hWin), GWL_WNDPROC, Integer(p^.PlugWinProc));
    Dispose(p);
  except
    on E: Exception do
      MsgExcept('Exception on plugin unhooking', E, 0);
  end;

  N:= GetWindowLong(hWin, GWL_USERDATA);
  if N<>0 then
  try
    p:= Pointer(N);
    //CloseHandle(p^.PlugForm.hMutex);
    Application.RemoveComponent(p^.PlugForm);
    Application.Handle:= 0;
    //restore callback function
    SetWindowLong(p^.PlugForm.Handle, GWL_WNDPROC, Integer(p^.PlugWinProc));
    p^.PlugForm.Free;
  except
    on E: Exception do
      MsgExcept('Exception on plugin closing', E, 0);
  end;
end;

function SynStart(ListerWin: HWND; const FileToLoad: WideString): HWND;
var
  fmMain: TfmMain;
  p: ^TPlugInfo;
begin
  Result:= 0;
  try
    fmMain:= TfmMain.CreateParented(ListerWin);
    with fmMain do
    begin
      SynExe:= False;
      InitSynIniDir;

      //synchronize our form and Lister
      //Application.Handle:= ListerWin;
      Application.OnException:= AppException;
      //Application.InsertComponent(fmMain);
      Application.HintHidePause:= 5000;

      //substitution callback function
      New(p);
      SetWindowLong(fmMain.Handle, GWL_USERDATA, Integer(p));
      p^.PlugForm:= fmMain;
      p^.PlugWinProc:= Pointer(SetWindowLong(fmMain.Handle, GWL_WNDPROC, Integer(@HookDestroy)));
      //hook lister close
      New(p);
      SetWindowLong(hLister, GWL_USERDATA, Integer(p));
      p^.PlugForm:= fmMain;
      p^.PlugWinProc:= Pointer(SetWindowLong(hLister, GWL_WNDPROC, Integer(@HookList)));

      Show;
      DoOpenFile(FileToLoad);
      UpdateRO;
      Result:= Handle;

      if not SynExe then
      begin
        DoWorkaround_QViewHorzScroll;
        if QuickView then
          UpdateQVTree(FileToLoad);
      end;
    end; //with fmMain
  except
    on E: Exception do
      MsgExcept('Exception on plugin opening', E, 0);
  end;
end;

procedure TfmMain.AppException(Sender: TObject; E: Exception);
begin
  MsgExcept('Exception in plugin', E, 0);
end;

procedure TfmMain.ecTitleCaseExecute(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smTitleCaseBlock);
end;

function IsFileTooBig(const fn: WideString): boolean;
begin
  Result:= FGetFileSize(fn) >= 200 * 1024 * 1024;
end;

function TfmMain.SynFilesFilter: Widestring;
begin
  Result:= SyntaxManagerFilesFilter(SyntaxManager, DKLangConstW('AllF'));
end;

procedure TfmMain.acOpenExecute(Sender: TObject);
var
  i: Integer;
  s: Widestring;
begin
  OD.Filter:= SynFilesFilter;
  if (opLastDir=cLastDirRemember) and (opHistFilter>0) then
    OD.FilterIndex:= opHistFilter
  else
    OD.FilterIndex:= SFilterNum(OD.Filter);
  OD.FileName:= '';
  OD.InitialDir:= LastDir;

  if not OD.Execute then Exit;

  if (OD.Files.Count=1) and not IsFileExist(OD.FileName) then
  begin
    if not MsgConfirmCreate(OD.FileName, Handle) then Exit;
    with TStringList.Create do
    try
      SaveToFile(OD.FileName);
    finally
      Free
    end;
  end;

  for i:= 0 to OD.Files.Count-1 do
  begin
    S:= OD.Files[i];
    if IsFileTooBig(S) then
      MsgFileTooBig(S, Handle)
    else
      DoOpenFile(S);
  end;

  //save last dir
  SaveLastDir(OD.FileName, OD.Filter, OD.FilterIndex);

  if CurrentEditor<>nil then
    CurrentEditor.Invalidate;
end;

function TfmMain.DoOpenFile(const AFileName: WideString): TEditorFrame;
var
  F: TEditorFrame;
begin
  UpdateColorHint;

  if IsFileProject(AFileName) then
  begin
    DoOpenProject(AFileName);
    Result:= nil;
    Exit
  end;

  if IsFileArchive(AFileName) then
  begin
    DoOpenArchive(AFileName);
    Result:= nil;
    Exit
  end;

  if AFileName = '' then
  begin
    acNewTab.Execute;
    Result:= CurrentFrame;
    Exit
  end;

  //is file is already opened?
  F:= FrameForFilename(AFileName);
  if F<>nil then
  begin
    Result:= F;
    CurrentFrame:= F;
    UpdateTabList(Groups.PagesCurrent.Tabs.TabIndex, -1, -1);
    Exit;
  end;

  //Create new frame and load file
  F:= CurrentFrame;
  if (F <> nil) and (F.FileName = '') and (not F.Modified) then
    Result:= F
  else
    Result:= DoAddTab(Groups.PagesCurrent);
  //reset encoding for new frame
  ApplyFrameEncoding(Result, 0);

  if FCanUseLexer(AFileName) then
    Result.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(AFileName)
  else
    Result.EditorMaster.TextSource.SyntaxAnalyzer:= nil;
  UpdateLexerTo(Result.EditorMaster.TextSource.SyntaxAnalyzer);

  Result.DoStopNotif;
  Result.LoadFile(AFileName);
  Result.DoStartNotif;

  UpdateOnFrameChanged;
  UpdateFrameEnc(Result);
  UpdateFrameSpell(Result);
  UpdateFrameZoom(Result);

  //maybe set opened editor R/O for Lister plugin
  if not SynExe then
    UpdateRO;

  if not SynExe then
    BringWindowToTop(hLister);

  UpdateGutter(Result);
  if opTabsReplace and (TemplateEditor.TabMode=tmSpaces) then
    DoReplaceTabsToSpaces(Result);

  DoPyEvent(Result.EditorMaster, cSynEventOnOpen, []);
end;

procedure TfmMain.UpdateFrameEnc(Frame: TEditorFrame);
var
  IsBE: boolean;
begin
  //dont reread files with BOM
  if IsFileWithBOM(Frame.FileName) then Exit;

  if SFileExtensionMatch(Frame.FileName, opOem) then
  begin
    ApplyFrameEncodingAndReload(Frame, CP_OEMCP); //Reread as OEM
  end
  else
  if SFileExtensionMatch(Frame.FileName, opUTF8) or (opUTF8 = '*')
    or IsFileUTF8NoBOM(Frame.FileName)
    or IsFileXmlUTF8(Frame.FileName) then
  begin
    ApplyFrameEncodingAndReload(Frame, cp__UTF8_noBOM); //Reread as UTF8 no BOM
  end
  else
  if IsFileUnicodeNoBOM(Frame.FileName, IsBE) then
  begin
    if IsBE then
      ApplyFrameEncodingAndReload(Frame, cp__UnicodeBE) //UTF-16 BE
    else
      ApplyFrameEncodingAndReload(Frame, cp__Unicode); //UTF-16 LE
  end;
end;

//Save specified frame
function TfmMain.SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean): boolean;
var
  AUntitled: boolean;
  ALexerName: string;
begin
  Result:= true;
  if Frame=nil then Exit;
  Frame.DoStopNotif;

  if not DoCheckUnicodeNeeded(Frame) then Exit;
  if DoPyEvent(Frame.EditorMaster, cSynEventOnSaveBefore, [])=cPyFalse then Exit;

  AUntitled:= Frame.IsNewFile;
  if not PromtDialog then
    PromtDialog:= AUntitled;

  if PromtDialog then
  begin
    if AUntitled then
      SD.InitialDir:= LastDir_UntitledFile
    else
      SD.InitialDir:= LastDir;
    SD.Filter:= SynFilesFilter;

    ALexerName:= Frame.CurrentLexer;
    if ALexerName<>'' then
      SD.FilterIndex:= SFilterNameToIdx(SD.Filter, ALexerName)
    else
      SD.FilterIndex:= SFilterNum(SD.Filter);

    if Frame.FileName<>'' then
      SD.FileName:= Frame.FileName
    else
      SD.FileName:= DKLangConstW('newFnLatin');

    //show Save As dialog
    Result:= SD.Execute and (SD.FileName<>'');
    if Result then
    begin
      if WideExtractFileExt(SD.FileName)='' then
        SD.FileName:= FFreeFN(
          WideExtractFileName(SD.FileName),
          SFilterIdxToExt(SD.Filter, SD.FilterIndex),
          WideExtractFileDir(SD.FileName));

      Frame.SaveFile(SD.FileName);
      SynMruFiles.AddItem(SD.FileName);
      DoPyEvent(Frame.EditorMaster, cSynEventOnSaveAfter, []);

      //update lexer
      if FCanUseLexer(SD.FileName) then
        Frame.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(SD.FileName)
      else
        Frame.EditorMaster.TextSource.SyntaxAnalyzer:= nil;
      UpdateLexerTo(Frame.EditorMaster.TextSource.SyntaxAnalyzer);

      //save last dir
      if AUntitled then
        SaveLastDir_UntitledFile(SD.FileName)
      else
        SaveLastDir(SD.FileName, SD.Filter, SD.FilterIndex);
      //spell
      UpdateFrameSpell(Frame);
    end;
  end
  else
  //save silently, without "Save As" dialog
  begin
    //check existance of folder,
    //but always allow saving to Windows folder
    //(needed for "c:\Windows\system32\drivers\etc\hosts" - folder is virtual on Win x64)
    if not IsDirOkForSaving(WideExtractFileDir(Frame.FileName)) then
    begin
      MsgNoDir(WideExtractFileDir(Frame.FileName));
      Exit
    end;

    Frame.SaveFile(Frame.FileName);
    DoPyEvent(Frame.EditorMaster, cSynEventOnSaveAfter, []);

    //save on ftp
    if Frame.IsFtp then
      DoPluginSaveFtpFile(Frame);
  end;

  //repaint editor (coz line states not redrawn)
  Frame.EditorMaster.Invalidate;
  Frame.EditorSlave.Invalidate;
  //start notifications
  if IsFileExist(Frame.FileName) then
    Frame.DoStartNotif;
  //send "reread panel" to plugins
  DoRefreshPluginsFiles(Frame.FileName);

  //Need to reload, as Line Ends changed?
  if Frame.LineEndsChg then
  begin
    Frame.LineEndsChg:= false;
    DoFrameReloadInt(Frame);
    UpdateFrameEnc(Frame);
  end;
end;

function TfmMain.GetFrameCount: integer;
begin
  if Assigned(Groups) then
    Result:= Groups.PagesCurrent.Tabs.TabCount
  else
    Result:= 0;
end;

function TfmMain.GetFrameAllCount: integer;
begin
  if Assigned(Groups) then
    Result:= Groups.GetTabTotalCount
  else
    Result:= 0;
end;

function TfmMain.GetFrames(Index: integer): TEditorFrame;
var
  D: TATTabData;
begin
  Result:= nil;
  if Assigned(Groups) then
  begin
    with Groups.PagesCurrent do
      D:= Tabs.GetTabData(Index);
    if D<>nil then
      Result:= D.TabObject as TEditorFrame;
  end;
end;

function TfmMain.GetFramesAll(Index: integer): TEditorFrame;
begin
  if Assigned(Groups) then
    Result:= Groups.GetTabDataOfTotalIndex(Index).TabObject as TEditorFrame
  else
    Result:= nil;
end;


procedure TfmMain.SetCurrentFrame(Frame: TEditorFrame);
var
  NPages, NTab: Integer;
begin
  if Frame=nil then Exit;
  Groups.PagesAndTabIndexOfControl(Frame, NPages, NTab);
  if NTab>=0 then
    Groups.Pages[NPages].Tabs.TabIndex:= NTab;
end;

procedure TfmMain.FocusFrame(Frame: TEditorFrame);
var
  Ed: TSyntaxMemo;
begin
  if Frame=nil then Exit;

  if Frame.IsMasterFocused then
    Ed:= Frame.EditorMaster
  else
    Ed:= Frame.EditorSlave;

  if Frame.Enabled and Frame.Visible then
  begin
    if Ed.Enabled and Ed.Visible and Ed.CanFocus then
      Ed.SetFocus;
  end;
end;

function TfmMain.GetCurrentFrame: TEditorFrame;
begin
  if CurrentEditor<>nil then
    Result:= FrameOfEditor(CurrentEditor)
  else
    Result:= nil;
end;

procedure TfmMain.UpdateEditorNonPrinted(Ed: TSyntaxMemo);
begin
  Ed.NonPrinted.Visible:= opNonPrint;
  Ed.NonPrintedSpaces:= opNonPrintSpaces;
  Ed.NonPrintedEol:= opNonPrintEol;
  Ed.NonPrintedEolDetails:= opNonPrintEolDetail;

  Ed.NonPrinted.SpaceChar:= #183;
  Ed.NonPrinted.TabChar:= #187;
end;

function TfmMain.CreateFrame: TEditorFrame;
begin
  Result:= TEditorFrame.Create(Self);
  Result.Visible:= false; //fix flicker on new-tab
  Result.Name:= '';
  Result.OnTitleChanged:= UpdateTitle;
  Result.OnSaveState:= FrameSaveState;
  Result.OnGetTabCaption:= FrameGetTabCaption;

  Result.EditorMaster.BorderStyle:= SynBorderStyleEditor;
  Result.EditorSlave.BorderStyle:= SynBorderStyleEditor;
  Result.EditorMaster.KeyMapping:= SyntKeyMapping;
  Result.EditorSlave.KeyMapping:= SyntKeyMapping;

  Result.HyperlinkHighlighter.Active:= opHiliteUrls;
  Result.HyperlinkHighlighter.Style.Font.Color:= opColorLink;
  Result.HyperlinkHighlighter.SingleClick:= opSingleClickURL;

  if opHintScroll then
  begin
    with Result.EditorMaster.HintProps do
      ShowHints:= ShowHints+[shScroll];
    with Result.EditorSlave.HintProps do
      ShowHints:= ShowHints+[shScroll];
  end;

  UpdateEditorNonPrinted(Result.EditorMaster);
  UpdateEditorNonPrinted(Result.EditorSlave);

  Result.ShowMap:= opMicroMap;
  Result.MapColor:= opColorMap;
  Result.CaretsEnabled:= opCaretsEnabled;
  Result.CaretsGutterBand:= opCaretsGutterBand;
  Result.CaretsGutterColor:= opColorCaretsGutter;
  Result.CaretsIndicator:= opCaretsIndicator;

  EditorSetCaretShape(Result.EditorMaster, opCaretShape);
  EditorSetCaretShape(Result.EditorSlave, opCaretShape);

  PropsManager.Add(Result.EditorMaster);
  PropsManager.Add(Result.EditorSlave);
  DoColorsArrayApply(ColorsArray, Result.EditorMaster);
  DoColorsArrayApply(ColorsArray, Result.EditorSlave);

  Result.EditorMaster.Gutter.LineBreakObj:= IfThen(opShowWrapMark, 0, -1);
  Result.EditorSlave.Gutter.LineBreakObj:= Result.EditorMaster.Gutter.LineBreakObj;

  InitFrameTab(Result);
  UpdateGutter(Result, False);
  CurrentFrame:= Result;
  UpdateNewFrame(Result);

  UpdateTabList(Groups.PagesCurrent.Tabs.TabCount-1, -1, -1);
end;

procedure TfmMain.UpdateNewFrame(F: TEditorFrame);
var
  Val: integer;
  Str: string;
begin
  if F=nil then Exit;

  //upd encoding
  if Assigned(fmProj) and (fmProj.FOpts.DefEnc<>0) then
    Val:= Pred(fmProj.FOpts.DefEnc)
  else
    Val:= opNewEnc;

  case Val of
    0: ApplyFrameEncodingAndReload(F, cp_ACP);
    1: ApplyFrameEncodingAndReload(F, cp_OEMCP);
    2: ApplyFrameEncodingAndReload(F, cp__UTF8);
    3: ApplyFrameEncodingAndReload(F, cp__UTF8_noBOM);
    4: ApplyFrameEncodingAndReload(F, cp__Unicode);
    5: ApplyFrameEncodingAndReload(F, cp__UnicodeBE);
  end;

  //upd line ends
  if Assigned(fmProj) and (fmProj.FOpts.DefLineEnds<>0) then
    Val:= Pred(fmProj.FOpts.DefLineEnds)
  else
    Val:= opNewLineEnds;

  case Val of
    0: SetLineEnds(TbxItemEndWin, false);
    1: SetLineEnds(TbxItemEndUn, false);
    2: SetLineEnds(TbxItemEndMac, false);
  end;

  //upd lexer
  if Assigned(fmProj) and (fmProj.FOpts.DefLexer<>'') then
    Str:= fmProj.FOpts.DefLexer
  else
    Str:= opNewLex;

  if Str='' then
    F.EditorMaster.TextSource.SyntaxAnalyzer:= nil
  else
    F.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.FindAnalyzer(Str);
  UpdateLexerTo(F.EditorMaster.TextSource.SyntaxAnalyzer);

  //other
  F.Modified:= false;
  F.LineEndsChg:= false;
  F.DoTitleChanged;
end;

procedure TfmMain.InitFrameTab(Frame: TEditorFrame);
begin
  UpdateFrameSpell(Frame);
end;

procedure TfmMain.CloseFrame(Frame: TEditorFrame);
var
  NPageIndex, NTabIndex: Integer;
begin
  if opSaveState>0 then
    SaveFrameState(Frame);

  if Frame.FileName<>'' then
    if not Frame.NotInRecents then
      SynMruFiles.AddItem(Frame.FileName);

  NPageIndex:= Groups.PagesIndexOf(Frame.Parent as TATPages);
  NTabIndex:= (Frame.Parent as TATPages).Tabs.TabIndex;
  TabSwitchers[NPageIndex].UpdateTabList(-1, -1, NTabIndex);

  CurrentEditor:= nil;
  Frame.Free;
  UpdateOnFrameChanged;

  //free directory of closed file
  WideSetCurrentDir(FInitialDir);
end;

procedure TfmMain.UpdateTreeProps;
var
  bSorted, bIcons: boolean;
  i: integer;
begin
  //sort tree?
  bSorted:= CurrentFrame.IsTreeSorted;
  if bSorted then
    Tree.SortType:= stText
  else
    Tree.SortType:= stNone;

  //show icons in tree?
  bIcons:= false;
  if (ImgListTree.Count > 0) and (CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer <> nil) then
    with CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer do
      for i:= 0 to BlockRules.Count-1 do
        if (BlockRules[i].TreeItemImage <> -1) or
           (BlockRules[i].TreeGroupImage <> -1) then
        begin
          bIcons:= true;
          Break;
        end;
  if bIcons then
    Tree.Images:= ImgListTree
  else
    Tree.Images:= nil;
end;

procedure TfmMain.UpdateOnFrameChanged;
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F<>nil then
  begin
    UpdateLexerTo(F.EditorMaster.TextSource.SyntaxAnalyzer);
    UpdateTitle(F);
    UpdateStatusbar;
    SynScroll(CurrentEditor);
    UpdateTabList(-1, -1, -1);
    UpdateTreeProps;
    ecSyntPrinter.Title:= WideExtractFileName(F.FileName);
  end
  else
    CurrentEditor:= nil;
end;

procedure TfmMain.UpdateTitle(Sender: TFrame);
const
  cMod: array[boolean] of string = ('', '*');
var
  s, sWin, sTask, sSess, sRO, sTabs: WideString;
  m: boolean;
  F: TEditorFrame;
begin
  UpdateListTabs;

  if not SynExe then Exit;
  F:= CurrentFrame;
  if (F = nil) or (F <> Sender) then Exit;

  s:= F.FileName;
  m:= F.Modified;

  if not opShowTitleFull then
    s:= WideExtractFileName(s);
  if s = '' then
    s:= DKLangConstW('Untitled');
  ecSyntPrinter.Title:= WideExtractFileName(s);

  if FSessionFN <> '' then
    sSess:= '{' + WideChangeFileExt(WideExtractFileName(FSessionFN), '') + '} '
  else
    sSess:= '';

  if F.EditorMaster.ReadOnly then
    sRO:= ' ' + DKLangConstW('RO')
  else
    sRO:= '';

  {$ifdef TabOrder}
  sTabs:= ' [' + TabSwitcher.GetTabList + ' , ' +
                 TabSwitcher2.GetTabList + ']';
  {$else}
  sTabs:= '';
  {$endif}

  sWin:= sSess + s + cMod[m] + ' - SynWrite' + sRO + sTabs;
  sTask:= sSess + WideExtractFileName(s) + cMod[m] + ' - SynWrite';

  TTntForm(Parent).Caption:= sWin;
  TntApplication.Title:= sTask;
end;

procedure TfmMain.SetCurrentEditor(Value: TSyntaxMemo);
var
  i: integer;
  An: TSyntAnalyzer;
begin
  if FCurrentEditor = Value then Exit;
  ecSyntPrinter.SyntMemo:= Value;
  ecCharPopup.SyntMemo:= Value;

  for i:= 0 to ActionList.ActionCount - 1 do
    if (ActionList.Actions[i] is TecBaseMemoAction) then
      (ActionList.Actions[i] as TecBaseMemoAction).SyntMemo:= Value;

  acSetupLexer.SyntMemo:= Value;
  ecACP.SyntMemo:= Value;
  PluginACP.SyntMemo:= Value;
  ParamCompletion.SyntMemo:= Value;
  ecMacroRecorder1.SyntMemo:= Value;

  FCurrentEditor:= Value;

  if FCurrentEditor <> nil then
  begin
    if CurrentFrame<>nil then
      CurrentFrame.HyperlinkHighlighter.Editor:= FCurrentEditor;

    if FCurrentEditor.SyntObj<>nil then
      An:= FCurrentEditor.SyntObj.Owner
    else
      An:= nil;
    UpdateLexerTo(An);

    UpdateStatusBar;
    if not QuickView then
      FocusEditor;
  end;

  //sync maps
  SyncMapData;
  SyncMapPos;

  //sync tree
  SyncTree;
end;

function TfmMain.FrameAskToSave(Frame: TEditorFrame; AllowAll: Boolean; AllowCancel: boolean=true): TModalResult;
var
  Buttons: TMsgDlgButtons;
  s: WideString;
begin
  Buttons:= [mbYes, mbNo];
  if AllowAll then Buttons:= Buttons + [mbYesToAll, mbNoToAll];
  if AllowCancel then Include(Buttons, mbCancel);
  if Frame.FileName = '' then
    s:= DKLangConstW('Untitled')
  else
    s:= WideExtractFileName(Frame.FileName);
  MsgBeep;
  Result:= WideMessageDlg(WideFormat(DKLangConstW('MSave'), [s]), mtWarning, Buttons, 0);
end;

procedure TfmMain.UpdateStatusBar;
var
  ro, sel2, en_lex: boolean;
  ed: TSyntaxMemo;
  frame: TEditorFrame;
begin
  if FLockUpdate then Exit;

  ed:= CurrentEditor;
  frame:= CurrentFrame;
  if ed=nil then Exit;
  if frame=nil then Exit;

  ro:= ed.ReadOnly;
  sel2:= ed.HaveSelection;
  en_lex:= SyntaxManager.CurrentLexer<>nil;

  if frame.Modified then
    acSave.ImageIndex:= 1
  else
    acSave.ImageIndex:= 2;

  //Hilite brackets
  TimerBrackets.Enabled:= true;

  ecReadOnly.Checked:= ro;
  ecWrap.Checked:= ed.WordWrap;
  ecLineNums.Checked:= ed.LineNumbers.Visible;
  ecFolding.Checked:= not ed.DisableFolding;
  ecRuler.Checked:= ed.HorzRuler.Visible;
  ecSmartHl.Checked:= opHiliteSmart;
  ecFullScr.Checked:= ShowFullScreen;

  ecNonPrint.Checked:= ed.NonPrinted.Visible;
  ecNonPrintOff.Checked:= not ed.NonPrinted.Visible;
  ecNonPrintSpaces.Checked:= ed.NonPrinted.Visible and ed.NonPrintedSpaces and not ed.NonPrintedEol;
  ecNonPrintEol.Checked:= ed.NonPrinted.Visible and not ed.NonPrintedSpaces and ed.NonPrintedEol;
  ecNonPrintBoth.Checked:= ed.NonPrinted.Visible and ed.NonPrintedSpaces and ed.NonPrintedEol;
  ecNonPrintEolDetails.Checked:= ed.NonPrintedEolDetails;

  ecReplace.Enabled:= not ro;
  ecRepeatCmd.Enabled:= (not ro) and (FLastCmdId>0);

  {
  ecToggleLineCommentAlt.Enabled:= (not ro) and (SyntaxManager.CurrentLexer<>nil) and (SyntaxManager.CurrentLexer.LineComment<>'');
  ecCommentLines.Enabled:= ecToggleLineCommentAlt.Enabled;
  ecUnCommentLines.Enabled:= ecToggleLineCommentAlt.Enabled;
  TBXItemEToggleLineComment.Enabled:= ecToggleLineCommentAlt.Enabled;
  }

  if Assigned(Status) then
  begin
    if ro then
      StatusItemRO.ImageIndex:= 0
    else
      StatusItemRO.ImageIndex:= 1;

    case ed.SelectModeDefault of
      msColumn: StatusItemSelMode.ImageIndex:= 9;
      msLine: StatusItemSelMode.ImageIndex:= 10;
      else StatusItemSelMode.ImageIndex:= 8;
    end;

    if ed.WordWrap then
      StatusItemWrap.ImageIndex:= 3
    else
      StatusItemWrap.ImageIndex:= 4;

    UpdateStatusbarTabsize;
  end;

  UpdateStatusbarEnc(frame);
  UpdateStatusbarLineEnds;

  acSave.Enabled:= not ro;
  acNewTab.Enabled:= not Quickview;
  acClose.Enabled:= not Quickview;
  acOpen.Enabled:= not Quickview;
  acNewWindow.Enabled:= SynExe;
  acSetupLexHL.Enabled:= en_lex;
  ecFullScr.Enabled:= SynExe;
  ecOnTop.Enabled:= SynExe;

  ecCopy.Update;
  ecCut.Update;
  ecPaste.Update;
  ecClear.Update;

  ecUndo.Update;
  ecRedo.Update;
  ecCommentLines.Update;
  ecUncommentLines.Update;
  ecIndent.Update;
  ecUnindent.Update;
  ecSortAscending.Update;
  ecSortDescending.Update;

  ecUpperCase.Update;
  ecLowerCase.Update;
  ecToggleCase.Update;
  ecTitleCase.Enabled:= sel2;
  ecSentCase.Enabled:= sel2;
  ecGoto.Enabled:= ed.Lines.Count>0;
  ecRemoveBlanks.Enabled:= not ro;
  ecSortDialog.Enabled:= (ed.Lines.Count>0) and not ro;
  ecSortAscending.Enabled:= ecSortDialog.Enabled;
  ecSortDescending.Enabled:= ecSortDialog.Enabled;
  ecDedupAll.Enabled:= ecSortDialog.Enabled;
  ecDedupAdjacent.Enabled:= ecSortDialog.Enabled;
  TbxSubmenuCase.Enabled:= ecSortDialog.Enabled;

  TBXItemVComm.Enabled:= (ed.Lines.Count>0) and not ro and en_lex;
  TBXItemVUncom.Enabled:= TBXItemVComm.Enabled;

  ecSpellLive.Checked:= Frame.SpellLive;
  ecSyncScrollV.Enabled:= (Groups.PagesVisibleCount=2) and (Groups.Pages2.Tabs.TabCount>0);
  ecSyncScrollH.Enabled:= ecSyncScrollV.Enabled;

  ecPrintAction.Update;
  ecPreviewAction.Update;
  ecPageSetupAction.Update;
  ecPrinterSetup.Update;

  begin
    StatusItemCaret.Caption:= SStatusText(Ed);

    if Ed.ReplaceMode then
      StatusItemInsMode.Caption:= DKLangConstW('sOvr')
    else
      StatusItemInsMode.Caption:= DKLangConstW('sIns');

    StatusItemZoom.Caption:= IntToStr(Ed.Zoom) + '%';

    with StatusItemChar do
    begin
      if opShowCharInfo then
      begin
        CustomWidth:= 100;
        ImageIndex:= -1;
      end
      else
      begin
        CustomWidth:= 20;
        ImageIndex:= 2;
      end;

      if opShowCharInfo and (Ed.TextLength>0) and (not EditorHasNoCaret(Ed)) then
        Caption:= SStatusCharInfo(Ed)
      else
        Caption:= '';

      Visible:= opShowCharInfo;
    end;
  end;
end;

function TfmMain.SStatusCharInfo(Ed: TSyntaxMemo): Widestring;
var
  ch: Widechar;
  sAnsi: string;
begin
  Result:= '';
  with Ed do
    if TextLength>0 then
    begin
      ch:= Lines.Chars[CaretStrPos+1];
      if Ord(ch)<32 then
        Result:= ''
      else
        Result:= '"' + WideString(ch) + '" ';

      if Lines.TextCoding <> tcAnsi then
      begin
        //Unicode encoding active
        Result:= Result + Format('#%d 0x%x', [Ord(ch), Ord(ch)]);
      end
      else
      begin
        //Some codepage active
        sAnsi:= UnicodeToAnsiCP(WideString(ch), Lines.Codepage);
        if sAnsi='' then sAnsi:= #0;
        Result:= Result + Format('#%d 0x%2.2x', [Ord(sAnsi[1]), Ord(sAnsi[1])]);
      end;
    end;
end;

const
  cExeSuffix: array[boolean] of string = ('', 'Exe');

procedure TfmMain.LoadIni;
var
  ini: TMemIniFile;
  NCount: integer;
  s: Widestring;
begin
  //get all options from Syn.ini
  ini:= TMemIniFile.Create(SynIni);
  with ini do
  try
    //toolbars props
    if not QuickView then
    begin
      LoadToolbarProp(tbFile, ini, 'File');
      LoadToolbarProp(tbEdit, ini, 'Edit');
      LoadToolbarProp(tbView, ini, 'View');
      LoadToolbarProp(tbQs, ini, 'Qs');

      LoadToolbarProp(tbUser1, ini, 'U1');
      LoadToolbarProp(tbUser2, ini, 'U2');
      LoadToolbarProp(tbUser3, ini, 'U3');

      LoadToolbarContent(tbUser1, '1');
      LoadToolbarContent(tbUser2, '2');
      LoadToolbarContent(tbUser3, '3');
    end
    else
    begin
      tbFile.Visible:= Pos('File', opListerQVToolbars)>0;
      tbEdit.Visible:= Pos('Edit', opListerQVToolbars)>0;
      tbView.Visible:= Pos('View', opListerQVToolbars)>0;
      tbMenu.Visible:= Pos('Menu', opListerQVToolbars)>0;
      tbQS.Visible:=   Pos('QS', opListerQVToolbars)>0;
      plTree.Visible:= Pos('Tree', opListerQVToolbars)>0;
      plClip.Visible:= Pos('Clip', opListerQVToolbars)>0;
    end;

    //auto-save
    opASaveOnTimer:= ReadBool('ASave', 'OnTime', false);
    opASaveOnFocus:= ReadBool('ASave', 'OnFocus', false);
    opASaveTimeMin:= ReadInteger('ASave', 'Time', 5);
    opASaveAllFiles:= ReadBool('ASave', 'AllF', true);
    opASaveMaxSizeKb:= ReadInteger('ASave', 'MaxSize', 0);
    opASaveUnnamed:= TSynAutoSaveUnnamed(ReadInteger('ASave', 'Unnm', 0));
    opASaveUnnamedDir:= ReadString('ASave', 'UnnmDir', '%AppData%\SynWrite\AutoSave');
    ApplyAutoSave;

    //hist
    opLastDir:= TSynLastDirMode(ReadInteger('Hist', 'DirVar', Ord(cLastDirRemember)));
    opLastDirPath:= UTF8Decode(ReadString('Hist', 'Dir', ''));
    opLastDirSession:= UTF8Decode(ReadString('Hist', 'DirSess', SynAppdataDir));
    opLastDirProject:= UTF8Decode(ReadString('Hist', 'DirProj', SynAppdataDir));
    opHistFilter:= ReadInteger('Hist', 'Filter', 0);

    if SynExe then
    begin
      opHistSessionSave:= ReadBool('Hist', 'SessSave', false);
      opHistSessionLoad:= ReadBool('Hist', 'SessLoad', false);
      opHistSessionProjSave:= ReadBool('Hist', 'SessProjSave', false);
      opHistSessionProjLoad:= ReadBool('Hist', 'SessProjLoad', false);
      opHistSessionDef:= ReadBool('Hist', 'SessDef', false);
    end
    else
    begin
      opHistSessionSave:= false;
      opHistSessionLoad:= false;
      opHistSessionProjSave:= false;
      opHistSessionProjLoad:= false;
      opHistSessionDef:= false;
    end;

    opStateForTemp:= ReadBool('Hist', 'TempFN', false);
    opHistProjectSave:= ReadBool('Hist', 'ProjSv', false);
    opHistProjectLoad:= ReadBool('Hist', 'ProjLd', false);
    opHistProjectCloseTabs:= ReadBool('Hist', 'ProjCloseTabs', false);
    opSaveWndPos:= ReadBool('Hist', 'SavePos', true);

    //setup
    opHintScroll:= ReadBool('Setup', 'HintScroll', false);
    opPyChangeDelay:= ReadInteger('Setup', 'PyChangeDelay', 3000);

    opShowPanelTitles:= ReadBool('View', 'PaneTitle', true);
    ApplyPanelTitles;

    //color array
    DoColorsArrayInit(ColorsArray);
    DoColorsArrayRead(ColorsArray, ReadString('View', 'Colors', ''));
    DoColorsArrayApply(ColorsArray, TemplateEditor);

    opTreeSorted:= ReadString('Setup', 'TreeSorted', '');
    opUnderlineColored:= ReadInteger('Setup', 'ColorUnd', 3);
    opSyncEditIcon:= ReadBool('Setup', 'SyncEditIcon', true);
    opTabFontSize:= ReadInteger('Setup', 'TabFontSize', 0);

    opNewEnc:= ReadInteger('Setup', 'NEnc', 0);
    opNewLineEnds:= ReadInteger('Setup', 'NLe', 0);
    opNewLex:= ReadString('Setup', 'NLex', '');

    opAutoCloseTags:= ReadBool('Setup', 'ACloseTag', false);
    opAutoCloseBrackets:= ReadBool('Setup', 'ACloseBr', false);
    opAutoCloseBracketsNoEsc:= ReadBool('Setup', 'ACloseBrEsc', false);
    opAutoCloseQuotes:= ReadBool('Setup', 'ACloseQ', false);

    opLexerGroups:= ReadBool('Setup', 'LexCat', true);
    opLexersOverride:= ReadString('Setup', 'LexOvr', '');

    if QuickView then
      opTabVisible:= false
    else
      opTabVisible:= ReadBool('Setup', 'TabShow', true);

    opTabMaxWidth:= ReadInteger('Setup', 'TabSize', 130);
    opTabDragDrop:= true; //ReadBool('Setup', 'TabDnD', true);
    opTabSwitcher:= false; ///////////ReadBool('Setup', 'TabSw', true);
    opTabDirs:= ReadBool('View', 'TabDirs', false);
    opTabNums:= ReadBool('View', 'TabNum', false);
    opTabBtn:= ReadBool('View', 'TabBtn', true);
    opTabPlus:= ReadBool('View', 'TabPlus', true);
    opTabAtBottom:= ReadBool('View', 'TabDown', false);

    opSingleInstance:= ReadBool('Setup', 'Inst', false);
    ApplyInst;
    opShowQsCaptions:= ReadBool('Setup', 'QsCap', false);
    ApplyQs;
    opHiliteUrls:= ReadBool('Setup', 'Link', true);
    opKeepCaretOnScreen:= false;
    ApplyEdOptions;

    opShowWrapMark:= ReadBool('Setup', 'WrapMk', true);
    opTextOnly:= ReadInteger('Setup', 'TxOnly', 0);
    opSaveSRHist:= ReadInteger('Setup', 'SaveSRHist', 10);
    opSaveState:= ReadInteger('Setup', 'SaveFrameState', 10);
    opSaveEdCaret:= ReadBool('Setup', 'SaveCaret', true);
    opSaveEdEnc:= ReadBool('Setup', 'SaveEnc', true);
    opAskOverwrite:= true; //ReadBool('Setup', 'AskRO', true);
    opShowTitleFull:= ReadBool('Setup', 'TitleFull', false);

    //fonts
    StringToFont(TemplateEditor.Font,             ReadString('Fonts', 'Ed', ''));
    StringToFont(TemplateEditor.HorzRuler.Font,   ReadString('Fonts', 'Ruler', ''));
    StringToFont(TemplateEditor.LineNumbers.Font, ReadString('Fonts', 'Nums', ''));
    StringToFont(ListOut.Font,                    ReadString('Fonts', 'Out', ''));
    StringToFont(ecACP.Font,                      ReadString('Fonts', 'Acp', ''));
    StringToFont(Tree.Font,                       ReadString('Fonts', 'Tree', ''));
    StringToFont(MemoConsole.Font,                ReadString('Fonts', 'Con', ''));
    EdConsole.Font:= MemoConsole.Font;

    //keys
    SyntKeyMapping.UseFirstControlKeys:= ReadBool('Setup', 'KeyComboIgnoreCtrl', true);

    //status props
    opStatusText[selNone]:= ReadString('View', 'StatusNoSel', '{LineNum} : {ColNum} ({TotalLines})');
    opStatusText[selSmall]:= ReadString('View', 'StatusSmallSel', '{LineNum} : {ColNum} ({SelLines}x{SelCols}/{TotalLines})');
    opStatusText[selStream]:= ReadString('View', 'StatusStreamSel', '{LineNum} : {ColNum} ({SelLines}/{TotalLines})');
    opStatusText[selColumn]:= ReadString('View', 'StatusColumnSel', '{LineNum} : {ColNum} ({SelLines}x{SelCols}/{TotalLines})');
    opStatusText[selCarets]:= ReadString('View', 'StatusCarets', '#={Carets} ({TotalLines})');

    with StatusItemCaret do
    begin
      MinWidth:= ReadInteger('View', 'StatusWidth', 155);
      case ReadInteger('View', 'StatusAlign', 0) of
        0: Alignment:= taCenter;
        1: Alignment:= taLeftJustify;
        2: Alignment:= taRightJustify;
      end;
    end;

    opUtf8BufferSizeKb:= ReadInteger('Setup', 'Utf8Buffer', 64);
    opShowMenuIcons:= ReadBool('Setup', 'MenuIcon', true);
    opBeep:= ReadBool('Setup', 'Beep', true);

    opHiliteSmart:= ReadBool('Setup', 'SmHi', false);
    opHiliteSmartCase:= ReadBool('Setup', 'SmHiCase', false);
    opHiliteSmartWords:= ReadBool('Setup', 'SmHiWords', true);
    opHiliteSmartOnClick:= ReadBool('Setup', 'SmHiClick', false);

    opDateFmt:= ReadString('Setup', 'DateFmt', 'h:mm dd.mm.yyyy');
    opDateFmtPLog:= ReadString('Setup', 'DateFmtP', 'hh:mm');
    opFileBackup:= TSynBackup(ReadInteger('Setup', 'Back', 0));
    opEsc:= TSynEscMode(ReadInteger('Setup', 'Esc' + cExeSuffix[SynExe], Ord(cEscCloseApp)));
    opMruCheck:= ReadBool('Setup', 'MruCheck', false);
    opTabsReplace:= ReadBool('Setup', 'TabSp', false);

    opSpellEn:= ReadBool('Setup', 'SpellEn', false);
    opSpellExt:= ReadString('Setup', 'SpellExt', 'txt,diz');

    opAcpUseSingle:= ReadBool('ACP', 'UseSingl', false);
    opAcpHtm:= ReadBool('ACP', 'Htm', true);
    opAcpCss:= ReadBool('ACP', 'Css', true);
    opAcpTabbing:= ReadBool('ACP', 'Tabbing', true);
    opAcpFile:= ReadBool('ACP', 'File', true);
    opAcpFileChars:= ReadInteger('ACP', 'FChars', 3);
    opAcpFileSize:= ReadFloat('ACP', 'FSize', 2.0);
    opAcpNum:= ReadInteger('ACP', 'Num', 0);
    opAcpHintDelay:= ReadInteger('ACP', 'HintDelay', 1500);
    ecACP.ShowWhenNone:= ReadBool('ACP', 'IfNone', true);
    opTemplateTabbing:= true; //ReadBool('ACP', 'TplTab', true);
    opTemplateTabbingExcept:= ReadString('ACP', 'TplTabEx', 'txt,nfo,diz');
    ParamCompletion.Enabled:= ReadBool('ACP', 'ParamHints', true);

    opReloadMode:= TSynReloadMode(ReadInteger('Setup', 'Notif', Ord(cReloadAsk)));
    ApplyBorders;

    opTipsToken:= ReadBool('Setup', 'Tooltips', true);
    opTipsPanels:= opTipsToken;
    ApplyTips;

    opSingleClickURL:= ReadBool('Setup', 'UrlClick', false);
    ApplyUrlClick;

    opSortMode:= TSynSortMode(ReadInteger('Setup', 'SortM', 0));
    opCopyLineIfNoSel:= ReadBool('Setup', 'CopyLnNoSel', false);
    opShowRecentColors:= TSynRecentColors(ReadInteger('Setup', 'RecColors', 0));
    opUnicodeNeeded:= ReadInteger('Setup', 'UnNeed', 0{don't suggest});
    opFollowTail:= ReadBool('Setup', 'Tail', false);

    Tree.ClickAction:= TSyntaxTreeAction(ReadInteger('Tree', 'Click', Ord(Tree.ClickAction)));
    Tree.Color:= ReadInteger('Tree', 'Color', Tree.Color);
    Tree.AutoSynchronize:= ReadBool('Tree', 'ASync', true);
    Tree.AutoCollapse:= ReadBool('Tree', 'ACollapse', false);
    Tree.AutoExpand:= ReadBool('Tree', 'AExpand', false);
    Tree.UpdateDelay:= ReadInteger('Tree', 'Delay', 1000);

    opSrOffsetY:= ReadInteger('SR', 'OffY', 6);
    opSrExpand:= ReadBool('SR', 'Expand', false);
    opSrOnTop:= ReadBool('SR', 'ShowOnTop' + cExeSuffix[SynExe], SynExe);
    opSrSuggestSel:= ReadBool('SR', 'SugSel', false);
    opSrSuggestWord:= ReadBool('SR', 'SugWord', false);
    opMaxTreeMatches:= ReadInteger('SR', 'MaxTreeMatches', 100);

    opTabOptionsLast:= ReadInteger('View', 'TabLast', 0);
    opTabsSortMode:= ReadInteger('View', 'TabSort', 0);
    opTabsWidths:= ReadString('View', 'TabWdt', '100,400,');

    //opMapVScroll:= ReadBool('View', 'MapVSc', true);
    opMapZoom:= ReadInteger('View', 'MapZoom', 25);
    opMicroMap:= ReadBool('View', 'MicroMap', false);
    opShowCurrentColumn:= ReadBool('View', 'CurrCol', false);
    opCaretShape:= ReadInteger('View', 'CaretType', 1);

    NCount:= ReadInteger('View', 'NPrint', 0+2+4);
    opNonPrint:=       (NCount and 1)<>0;
    opNonPrintSpaces:= (NCount and 2)<>0;
    opNonPrintEol:=    (NCount and 4)<>0;
    opNonPrintEolDetail:= (NCount and 8)<>0;

    opBigSize:= ReadInteger('Setup', 'BigSize', 4);
    opBkUndo:= ReadBool('Setup', 'BkUndo', false);
    opZenProfile:= ReadString('Setup', 'ZenPr', 'html');
    opProjPaths:= UTF8Decode(ReadString('Setup', 'Paths', ''));
    opHiliteBrackets:= ReadBool('Setup', 'BrHi', true);

    opCaretsEnabled:= ReadBool('View', 'CaretsEn', true);
    opCaretsIndicator:= ReadInteger('View', 'CaretsInd', 2);
    opCaretsGutterBand:= ReadInteger('View', 'CaretsGBand', 0);
    ApplyCarets;

    TabColorsString:= ReadString('View', 'TabMisc', '');

    opShowCharInfo:= ReadBool('Setup', 'ChInf', false);
    opLang:= ReadInteger('Setup', 'Lang', 0);
    Status.Visible:= ReadBool('Setup', 'Stat', true);
    //if not QuickView then
    //  Menu.Visible:= ReadBool('Setup', 'Menu' + cExeSuffix[SynExe], true);
    opOem:= ReadString('Setup', 'Oem', 'bat,cmd,nfo,diz');
    opUTF8:= ReadString('Setup', 'UTF8', '');

    if not QuickView then
      Theme:= ReadString('Setup', 'Theme', cThemeDefault)
	  else
      Theme:= cThemeWindows;
    Icons:= ReadInteger('Setup', 'Icons', 2{Fogue 24x24});

    LoadPanelProp(plTree, Ini, 'Tree');
    LoadPanelProp(plOut, Ini, 'Out');
    LoadPanelProp(plClip, Ini, 'Clip');
    FOutVisible:= plOut.Visible;

    FTabLeft:= TSynTabLeft(ReadInteger('plTree', 'Tab', 0));
    FTabRight:= TSynTabRight(ReadInteger('plClip', 'Tab', 0));
    FTabOut:= TSynTabOut(ReadInteger('plOut', 'Tab', 0));
    if FTabOut=tbPluginsLog then //don't restore last avtive Log panel
      FTabOut:= tbOut;

    //opt
    PropsManager.LoadProps(ini); //20ms

    //force KeepSelMode and FloatMarkers
    with TemplateEditor do
    begin
      Options:= Options + [soKeepSelMode, soFloatMarkers];
      OptionsEx:= OptionsEx + [soKeepSearchMarks];
    end;

    ApplyACP;
    ApplyOut;
    ApplyFonts;

    //save orig opt
    orig_Zoom:= TemplateEditor.Zoom;
    orig_Wrap:= TemplateEditor.WordWrap;
    orig_LNum:= TemplateEditor.LineNumbers.Visible;
    orig_NPrint:= TemplateEditor.NonPrinted.Visible;
    orig_NFold:= TemplateEditor.DisableFolding;
    orig_Ruler:= TemplateEditor.HorzRuler.Visible;
    orig_Tree:= plTree.Visible;
    orig_Out:= {plOut.Visible}FOutVisible;
    orig_Clip:= plClip.Visible;
    orig_TabRight:= FTabRight;
    orig_TabLeft:= FTabLeft;
    orig_TabOut:= FTabOut;
    orig_TabsSort:= opTabsSortMode;
    orig_TabsWidths:= opTabsWidths;
  finally
    Free;
  end;

  opGroupMode:= gmOne;

  if SynExe or opMruForPlugin then
  begin
    Ini:= TMemIniFile.Create(SynHistoryIni);
    with Ini do
    try
      S:= ReadString('Win', 'Groups', '');
      opGroupMode:= TATGroupsMode(StrToIntDef(SGetItem(S), Ord(gmOne)));
      opGroupSplit:= StrToIntDef(SGetItem(S), 50);

      //load recent files
      LoadMruList(SynMruFiles, Ini, 'MRU', opSaveState, opMruCheck);

      //load recent sessions
      LoadMruList(SynMruSessions, Ini, 'MRU_Sess', opSaveState, opMruCheck);

      //load recent project
      if opHistProjectLoad and (SynCommandlineProjectFN='') then
      begin
        LoadProj;
        if Assigned(fmProj) then
        begin
          S:= UTF8Decode(ReadString('MRU', 'Proj', ''));
          if (S<>'') and IsFileExist(S) then
            try
              FProjectIniting:= true;
              fmProj.ProjectFN:= S;
            finally
              FProjectIniting:= false;
            end;
        end;
      end;

      //load recent colors
      RecentColorsStr:= ReadString('Hist', 'Colors', '');
    finally
      Free
    end;
  end;

  //lang
  LangManager.LanguageID:= opLang;
  UpdateLang;
  UpdateShortcuts;
end;

//save only options visible on window
procedure TfmMain.SaveOptionsRecent;
const
  S: array[boolean] of string = ('False', 'True');
var
  Ini: TIniFile;
begin
  Ini:= TIniFile.Create(SynIni);
  with Ini do
  try
    if TemplateEditor.Zoom <> orig_Zoom then
      WriteInteger('Template', 'Zoom', TemplateEditor.Zoom);
    if TemplateEditor.WordWrap <> orig_Wrap then
      WriteString('Template', 'WordWrap', S[TemplateEditor.WordWrap]);
    if TemplateEditor.LineNumbers.Visible <> orig_LNum then
      WriteString('Template', 'LineNumbers.Visible', S[TemplateEditor.LineNumbers.Visible]);
    if TemplateEditor.NonPrinted.Visible <> orig_NPrint then
      WriteString('Template', 'NonPrinted.Visible', S[TemplateEditor.NonPrinted.Visible]);
    if TemplateEditor.DisableFolding <> orig_NFold then
      WriteString('Template', 'DisableFolding', S[TemplateEditor.DisableFolding]);
    if TemplateEditor.HorzRuler.Visible <> orig_Ruler then
      WriteString('Template', 'HorzRuler.Visible', S[TemplateEditor.HorzRuler.Visible]);
    if plTree.Visible <> orig_Tree then
      WriteBool('plTree', 'Vis', plTree.Visible);
    if FOutVisible <> orig_Out then
      WriteBool('plOut', 'Vis', FOutVisible);
    if plClip.Visible <> orig_Clip then
      WriteBool('plClip', 'Vis', plClip.Visible);
    if FTabRight <> orig_TabRight then
      WriteInteger('plClip', 'Tab', Ord(FTabRight));
    if FTabLeft <> orig_TabLeft then
      WriteInteger('plTree', 'Tab', Ord(FTabLeft));
    if FTabOut <> orig_TabOut then
      WriteInteger('plOut', 'Tab', Ord(FTabOut));
    if opTabsSortMode <> orig_TabsSort then
      WriteInteger('View', 'TabSort', opTabsSortMode);
    if opTabsWidths <> orig_TabsWidths then
      WriteString('View', 'TabWdt', opTabsWidths);

    //save toolbars and panels
    if not ShowFullScreen then
      if FToolbarMoved then
      begin
        SaveToolbarsProps;
        SavePanelProp(plTree, Ini, 'Tree');
        SavePanelProp(plOut, Ini, 'Out');
        SavePanelProp(plClip, Ini, 'Clip');
      end;
  finally
    Free;
  end;

  Ini:= TIniFile.Create(SynHistoryIni);
  with Ini do
  try
    WriteString('Win', 'Groups', Format('%d,%d', [Ord(Groups.Mode), Groups.SplitPos]));

    //save Clipbd panel
    if Assigned(fmClips) then
      WriteString('Win', 'Clip', fmClips.Combo.Text);

    //save NumConv panel
    if Assigned(fmNumConv) then
    begin
      WriteInteger('Win', 'NConvX', fmNumConv.Left);
      WriteInteger('Win', 'NConvY', fmNumConv.Top);
    end;

    //save recent colors
    WriteString('Hist', 'Colors', RecentColorsStr);

    if SynExe or opMruForPlugin then
    begin
      //save recent files list
      SaveMruList(SynMruFiles, Ini, 'MRU');

      //save recent session list
      SaveMruList(SynMruSessions, Ini, 'MRU_Sess');

      //save project name
      if Assigned(fmProj) then
        WriteString('MRU', 'Proj', UTF8Encode(fmProj.ProjectFN));
    end;
  finally
    Free;
  end;
end;

//save all
procedure TfmMain.SaveOptionsAll;
var
  f: TIniFile;
begin
  if not SynExe then
    with TIniFile.Create(SynListerIni) do
    try
      WriteInteger('Syn2', 'TxOnly', opTextOnly);
    finally
      Free;
    end;

 try
  f:= TIniFile.Create(SynIni);
  with f do
  try
    //editor props
    PropsManager.SaveProps(f);

    //view
    //WriteBool('View', 'MapVSc', opMapVScroll);
    WriteInteger('View', 'MapZoom', opMapZoom);
    WriteBool('View', 'MicroMap', opMicroMap);
    WriteBool('View', 'CurrCol', opShowCurrentColumn);
    WriteInteger('View', 'CaretType', opCaretShape);
    WriteInteger('View', 'NPrint',
      Ord(opNonPrint)*1 +
      Ord(opNonPrintSpaces)*2 +
      Ord(opNonPrintEol)*4 +
      Ord(opNonPrintEolDetail)*8);

    //auto-save
    WriteBool('ASave', 'OnTime', opASaveOnTimer);
    WriteBool('ASave', 'OnFocus', opASaveOnFocus);
    WriteInteger('ASave', 'Time', opASaveTimeMin);
    WriteBool('ASave', 'AllF', opASaveAllFiles);
    WriteInteger('ASave', 'MaxSize', opASaveMaxSizeKb);
    WriteInteger('ASave', 'Unnm', Ord(opASaveUnnamed));
    WriteString('ASave', 'UnnmDir', opASaveUnnamedDir);

    //setup
    WriteInteger('Setup', 'BigSize', opBigSize);
    WriteBool('Setup', 'BkUndo', opBkUndo);
    WriteString('Setup', 'ZenPr', opZenProfile);
    WriteBool('Setup', 'BrHi', opHiliteBrackets);

    WriteString('Setup', 'Paths', UTF8Encode(opProjPaths));
    WriteBool('Setup', 'SpellEn', opSpellEn);
    WriteString('Setup', 'SpellExt', opSpellExt);

    if SynExe then
    begin
      WriteBool('Hist', 'SessSave', opHistSessionSave);
      WriteBool('Hist', 'SessLoad', opHistSessionLoad);
      WriteBool('Hist', 'SessProjSave', opHistSessionProjSave);
      WriteBool('Hist', 'SessProjLoad', opHistSessionProjLoad);
      WriteBool('Hist', 'SessDef', opHistSessionDef);
    end;

    WriteBool('Hist', 'TempFN', opStateForTemp);
    WriteBool('Hist', 'ProjSv', opHistProjectSave);
    WriteBool('Hist', 'ProjLd', opHistProjectLoad);
    WriteBool('Hist', 'ProjCloseTabs', opHistProjectCloseTabs);
    WriteBool('Hist', 'SavePos', opSaveWndPos);

    WriteInteger('Setup', 'NEnc', opNewEnc);
    WriteInteger('Setup', 'NLe', opNewLineEnds);
    WriteString('Setup', 'NLex', opNewLex);

    WriteBool('Setup', 'ACloseTag', opAutoCloseTags);
    WriteBool('Setup', 'ACloseBr', opAutoCloseBrackets);
    WriteBool('Setup', 'ACloseBrEsc', opAutoCloseBracketsNoEsc);
    WriteBool('Setup', 'ACloseQ', opAutoCloseQuotes);

    WriteBool('Setup', 'TabShow', opTabVisible);
    WriteInteger('Setup', 'TabSize', opTabMaxWidth);
    WriteBool('Setup', 'TabDnD', opTabDragDrop);
    WriteBool('Setup', 'TabSw', opTabSwitcher);

    WriteString('Setup', 'LexOvr', opLexersOverride);
    WriteBool('Setup', 'Inst', opSingleInstance);
    WriteBool('Setup', 'QsCap', opShowQsCaptions);
    WriteBool('Setup', 'LexCat', opLexerGroups);
    WriteBool('Setup', 'Link', opHiliteUrls);
    WriteBool('Setup', 'WrapMk', opShowWrapMark);
    WriteInteger('Setup', 'TxOnly', opTextOnly);

    WriteInteger('Setup', 'SaveSRHist', opSaveSRHist);
    WriteInteger('Setup', 'SaveFrameState', opSaveState);
    WriteBool('Setup', 'SaveCaret', opSaveEdCaret);
    WriteBool('Setup', 'SaveEnc', opSaveEdEnc);
    WriteBool('Setup', 'AskRO', opAskOverwrite);
    WriteBool('Setup', 'TitleFull', opShowTitleFull);

    WriteInteger('Hist', 'DirVar', Ord(opLastDir));
    if opLastDir=cLastDirCustom then
      WriteString('Hist', 'Dir', UTF8Encode(opLastDirPath));

    WriteBool('Setup', 'MenuIcon', opShowMenuIcons);
    WriteBool('Setup', 'Beep', opBeep);

    WriteBool('Setup', 'SmHi', opHiliteSmart);
    WriteBool('Setup', 'SmHiCase', opHiliteSmartCase);
    WriteBool('Setup', 'SmHiWords', opHiliteSmartWords);
    WriteBool('Setup', 'SmHiClick', opHiliteSmartOnClick);

    WriteString('Setup', 'DateFmt', opDateFmt);
    WriteString('Setup', 'DateFmtP', opDateFmtPLog);
    WriteInteger('Setup', 'Back', Ord(opFileBackup));
    WriteInteger('Setup', 'Esc' + cExeSuffix[SynExe], Ord(opEsc));
    WriteBool('Setup', 'MruCheck', opMruCheck);
    WriteBool('Setup', 'TabSp', opTabsReplace);
    WriteInteger('Setup', 'Notif', Ord(opReloadMode));

    WriteBool('Setup', 'Tail', opFollowTail);
    WriteInteger('Setup', 'UnNeed', opUnicodeNeeded);
    WriteInteger('Setup', 'RecColors', Ord(opShowRecentColors));
    WriteBool('Setup', 'CopyLnNoSel', opCopyLineIfNoSel);
    WriteInteger('Setup', 'SortM', Ord(opSortMode));
    WriteBool('Setup', 'UrlClick', opSingleClickURL);
    WriteInteger('Setup', 'ColorUnd', opUnderlineColored);
    WriteString('Setup', 'TreeSorted', opTreeSorted);

    WriteString('View', 'Colors', DoColorsArrayAsString(ColorsArray));
    WriteBool('View', 'CaretsEn', opCaretsEnabled);
    WriteInteger('View', 'CaretsInd', opCaretsIndicator);
    WriteInteger('View', 'CaretsGBand', opCaretsGutterBand);

    WriteInteger('Tree', 'Click', Ord(Tree.ClickAction));
    WriteInteger('Tree', 'Color', Tree.Color);
    WriteBool('Tree', 'ASync', Tree.AutoSynchronize);
    WriteBool('Tree', 'ACollapse', Tree.AutoCollapse);
    WriteBool('Tree', 'AExpand', Tree.AutoExpand);
    WriteInteger('Tree', 'Delay', Tree.UpdateDelay);

    //WriteBool('ACP', 'TplTab', opTemplateTabbing);
    WriteString('ACP', 'TplTabEx', opTemplateTabbingExcept);
    WriteBool('ACP', 'UseSingl', opAcpUseSingle);
    WriteBool('ACP', 'Htm', opAcpHtm);
    WriteBool('ACP', 'Css', opAcpCss);
    WriteBool('ACP', 'Tabbing', opAcpTabbing);
    WriteBool('ACP', 'File', opAcpFile);
    WriteInteger('ACP', 'FChars', opAcpFileChars);
    WriteFloat('ACP', 'FSize', opAcpFileSize);
    WriteInteger('ACP', 'Num', opAcpNum);
    WriteBool('ACP', 'IfNone', ecACP.ShowWhenNone);
    WriteBool('ACP', 'ParamHints', ParamCompletion.Enabled);

    WriteInteger('SR', 'OffY', opSrOffsetY);
    WriteBool('SR', 'Expand', opSrExpand);
    WriteBool('SR', 'ShowOnTop' + cExeSuffix[SynExe], opSrOnTop);
    WriteBool('SR', 'SugSel', opSrSuggestSel);
    WriteBool('SR', 'SugWord', opSrSuggestWord);
    WriteInteger('SR', 'MaxTreeMatches', opMaxTreeMatches);

    WriteInteger('View', 'TabLast', opTabOptionsLast);
    WriteBool('View', 'TabDirs', opTabDirs);
    WriteBool('View', 'TabNum', opTabNums);
    WriteBool('View', 'TabBtn', opTabBtn);
    WriteBool('View', 'TabPlus', opTabPlus);
    WriteBool('View', 'TabDown', opTabAtBottom);
    WriteString('View', 'TabMisc', TabColorsString);

    WriteBool('Setup', 'ChInf', opShowCharInfo);
    WriteInteger('Setup', 'Lang', opLang);
    //if not QuickView then
    //  WriteBool('Setup', 'Menu' + cExeSuffix[SynExe], Menu.Visible);
    WriteBool('Setup', 'Stat', Status.Visible);
    WriteString('Setup', 'Oem', opOem);
    WriteString('Setup', 'UTF8', opUTF8);
    WriteString('Setup', 'Theme', Theme);
    WriteInteger('Setup', 'Icons', Icons);

    //fonts
    WriteString('Fonts', 'Ed', FontToString(TemplateEditor.Font));
    WriteString('Fonts', 'Ruler', FontToString(TemplateEditor.HorzRuler.Font));
    WriteString('Fonts', 'Nums', FontToString(TemplateEditor.LineNumbers.Font));
    WriteString('Fonts', 'Out', FontToString(ListOut.Font));
    WriteString('Fonts', 'Acp', FontToString(ecACP.Font));
    WriteString('Fonts', 'Tree', FontToString(Tree.Font));
    WriteString('Fonts', 'Con', FontToString(MemoConsole.Font));

  finally
    Free;
  end;
 except
   MsgError(DKLangConstW('Appn'), Handle);
 end;
end;

(*
function IsWindowsVista: Boolean;
begin
  Result:=
    (Win32Platform = VER_PLATFORM_WIN32_NT) and
    (Win32MajorVersion >= 6);
end;
*)

(*
//http://www.delphi.int.ru/articles/41/
function GetSpecialFolderPath(folder : integer) : string;
const
  SHGFP_TYPE_CURRENT = 0;
var
  path: array[0..MAX_PATH] of char;
begin
  if SUCCEEDED(SHGetFolderPath(0, folder, 0, SHGFP_TYPE_CURRENT, @path[0])) then
    Result := path
  else
    Result := '';
end;

function FAppDataPath: string;
begin
  Result:= GetSpecialFolderPath(CSIDL_APPDATA) + '\';
end;
*)

function FAppDataPath: string;
begin
  Result:= SExpandVars('%AppData%\');
end;

function SynAppdataDir: string;
begin
  Result:= FAppDataPath + 'SynWrite';
end;

function TfmMain.SynPluginIni(const SCaption: string): string;
begin
  Result:= SynIniDir + 'SynPlugin' + SCaption + '.ini';
end;

procedure TfmMain.InitSynIniDir;
begin
  if SynIsPortable then
    SynIniDir:= SynDir
  else
    if SynExe then
    begin
      SynIniDir:= SynAppdataDir;
      if not IsDirExist(SynIniDir) then
        CreateDir(SynIniDir);
      SynIniDir:= SynIniDir + '\';
    end
    else
      SynIniDir:= ExtractFilePath(SynListerIni);
end;

function TfmMain.SynIni: string;
begin
  Result:= SynIniDir + 'Syn.ini';
end;

function TfmMain.SynToolbarsIni: string;
begin
  Result:= SynIniDir + 'SynToolbars.ini';
end;

function TfmMain.SynFavIni: string;
begin
  Result:= SynIniDir + 'SynFav.ini';
end;

function TfmMain.SynStylesIni: string;
begin
  Result:= SynIniDir + 'SynStyles.ini';
end;

function TfmMain.SynHistoryIni: string;
begin
  Result:= SynIniDir + 'SynHistory.ini';
end;

function TfmMain.SynHistoryStatesIni: string;
begin
  Result:= SynIniDir + 'SynHistoryStates.ini';
end;

function TfmMain.SynFoldStatesIni: string;
begin
  Result:= SynIniDir + 'SynFoldStates.ini';
end;

function TfmMain.SynMacrosIni: string;
begin
  Result:= SynIniDir + 'SynMacros.ini';
end;

function TfmMain.SynTidyIni: string;
begin
  Result:= SynDir + 'Tidy.cfg';
end;

function TfmMain.SynHideIni: string;
begin
  Result:= SynDir + 'SynHide.ini';
end;

function TfmMain.SynPluginsIni: string;
begin
  Result:= SynDir + 'SynPlugins.ini';
end;

function TfmMain.SynPluginsSampleIni: string;
begin
  Result:= SynDir + 'SynPlugins.sample.ini';
end;

function TfmMain.SynConverterFilename(const Name: string): string;
begin
  Result:= SynDir + 'Template\conv\' + Name + '.txt';
end;

function TfmMain.SynLexersCfg: string;
begin
  Result:= SynDir + 'Lexers.cfg';
end;

function TfmMain.SynLexersExCfg: string;
begin
  Result:= SynDir + 'LexersEx.cfg';
end;

function TfmMain.LoadFrameState(Frame: TEditorFrame; const fn: WideString): boolean;
var
  fnIni: string;
  L: TStringList;
  i: integer;
begin
  Result:= false;
  if (opSaveState=0) then Exit;
  if (fn='') or (Frame=nil) then Exit;
  if (not opStateForTemp) and IsTempFN(fn) then Exit;

  fnIni:= SynHistoryStatesIni;
  if not IsFileExist(fnIni) then Exit;

  L:= TStringList.Create;
  try
    L.LoadFromFile(fnIni);
    for i:= 0 to L.Count-1 do
      if IsFramePropertiesStringForFilename(fn, L[i]) then
      begin
        Frame.FileName:= fn;
        Screen.Cursor:= crHourGlass;
        try
          Frame.EditorMaster.TextSource.Lines.Clear;
          Frame.EditorMaster.TextSource.Lines.SkipSignature:= true;
          FrameSetPropertiesString(Frame, L[i], true); //EncodingOnly=true
          Frame.EditorMaster.TextSource.Lines.LoadFromFile(fn); //uses set encoding
          Frame.EditorMaster.TextSource.Lines.SkipSignature:= false;
          FrameSetPropertiesString(Frame, L[i], false); //EncodingOnly=false
        finally
          Screen.Cursor:= crDefault;
        end;
        Result:= true;
        Break;
      end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.SaveFrameState(F: TEditorFrame);
var
  fnIni, sData: string;
  L: TStringList;
  i: integer;
begin
  if (opSaveState=0) then Exit;
  if (F=nil) or (F.FileName='') then Exit;
  if (not opStateForTemp) and IsTempFN(F.FileName) then Exit;

  sData:= FrameGetPropertiesString(F);
  fnIni:= SynHistoryStatesIni;

  L:= TStringList.Create;
  try
    if IsFileExist(fnIni) then
      L.LoadFromFile(fnIni);

    for i:= L.Count-1 downto 0 do
      if IsFramePropertiesStringForFilename(F.FileName, L[i]) then
        L.Delete(i);
    L.Insert(0, sData);

    while L.Count>opSaveState do
      L.Delete(L.Count-1);

    try
      //file may be R/O
      L.SaveToFile(fnIni);
    except
    end;
  finally
    FreeAndNil(L);
  end;
end;

function TfmMain.DoConfirmClose: boolean;
var
  F: TEditorFrame;
  i: integer;
  S: Widestring;
begin
  Result:= false;

  with TfmSaveTabs.Create(Self) do
  try
    for i:= 0 to FrameAllCount-1 do
    begin
      F:= FramesAll[i];
      S:= F.TabCaption;
      if F.FileName<>'' then
        S:= S+'  ('+F.FileName+')';
      if F.Modified then
        List.Items.AddObject(S, F);
    end;

    if List.Items.Count>0 then
      case ShowModal of
        mrCancel:
          Exit;
        mrYes:
          begin
            for i:= 0 to List.Items.Count-1 do
              if List.Checked[i] then
                SaveFrame(List.Items.Objects[i] as TEditorFrame, false);
          end;
      end;
  finally
    Free;
  end;

  if Assigned(fmProj) then
  begin
    if opHistProjectSave then
      fmProj.DoSaveProjectIfNeeded
    else
      fmProj.CheckModified(true);
  end;

  Result:= true;
end;

function TfmMain.SynLexLib: string;
begin
  Result:= SynDir + 'HL\LexLib.LXL';
end;

procedure TfmMain.SaveLexLib;
begin
  SyntaxManager.SaveToFile(SyntaxManager.FileName);
end;

function TfmMain.DoConfirmSaveLexLib: boolean;
var
  buttons: TMsgDlgButtons;
begin
  Result:= true;
  if SyntaxManager.Modified then
  begin
    buttons:= [mbYes, mbNo];
    //if CanCancel then
    //  Include(buttons, mbCancel);
    if WideMessageDlg(DKLangConstW('MSavLex'), mtConfirmation, buttons, 0) = mrYes then
      SaveLexLib;
    SyntaxManager.Modified:= false;
  end;
end;

procedure TfmMain.SynKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;

  if DoPyEvent(Ed, cSynEventOnKey,
    [IntToStr(Key), '"'+ShiftStateToString(Shift)+'"']) = cPyFalse then
    begin Key:= 0; Exit end;

  if not SynExe then
  if Ed.ReadOnly or (Shift = [ssAlt]) then
  begin
    //Lister: File -> Next (N) or Prev (P)
    if Chr(Lo(Key)) in ['N', 'P'] then
    begin
      PostMessage(hLister, WM_KEYDOWN, Key, 0);
      Key:= 0;
      Exit
    end
    else
    //Lister: Options -> 1..7
    if Chr(Lo(Key)) in ['1'..'7'] then
    begin
      PostMessage(hLister, WM_KEYDOWN, Key, 0);
      Key:= 0;
      Exit
    end;
  end;

  if Ed.ReadOnly and (Key = VK_SPACE) and (Shift = []) then
  begin
    CurrentEditor.ExecCommand(smScrollPageDown);
    Key:= 0;
    Exit
  end;

  //handle Tab key if auto-completion popup is shown
  if not Ed.ReadOnly and (Key = vk_tab) and (Shift = []) then
    if ecACP.Visible or PluginACP.Visible then
    begin
      Key:= 0;
      Exit;
    end;
end;

procedure TfmMain.DoHandleLastCmd(Command: integer; Data: pointer);
var
  IsEdit: boolean;
begin
  IsEdit:= IsCmdEditing(Command);
  if IsEdit and not FLastCmdPlaying then
  begin
    if (FLastCmdId <> Command) or
      (FLastCmdData <> PChar(Data)) or
      FLastCmdBreak then
      FLastCmdCount:= 0
    else
      Inc(FLastCmdCount);
    FLastCmdBreak:= false;
    FLastCmdId:= Command;
    if Data=nil then
      FLastCmdData:= ''
    else
      FLastCmdData:= PChar(Data);
  end;
  if not IsEdit then
    FLastCmdBreak:= true;
end;

procedure TfmMain.DoDelayedCommandAny(Command: Integer);
begin
  PostMessage(Handle, WM_USER + 1, Command, 0);
end;

procedure TfmMain.DoDelayedCommandWithClose(Command: Integer);
begin
  PostMessage(Handle, WM_USER + 2, Command, 0);
end;

procedure EditorSplitLinesWithDialog(Ed: TSyntaxMemo);
var
  s: Widestring;
  n: Integer;
begin
  n:= Ed.RightMargin;
  s:= IntToStr(n);
  if not MsgInput('MRtMargin', s) then Exit;
  n:= StrToIntDef(s, 0);
  if n>=3 then
    EditorSplitLinesByPosition(Ed, n)
  else
    MsgBeep;
end;

procedure TfmMain.SynExecuteCommand(Sender: TObject; Command: Integer;
  Data: Pointer; var Handled: Boolean);
var
  Ed: TSyntaxMemo;
  ch: WideChar;
  p: TPoint;
begin
  //remember last edit cmd
  DoHandleLastCmd(Command, Data);

  Handled:= True;
  Ed:= Sender as TSyntaxMemo;

  //debug
  //Application.MainForm.Caption:= Format('cmd %d', [Command]);

  case Command of
    //auto-close tag
    smChar:
      begin
        Handled:= false;
        if Data<>nil then
          ch:= PWideChar(Data)^
        else
          ch:= #0;

        //if current char is 2nd part of key-combination, don't handle it
        //(consider also ecRepeatCmd.Execute context)
        if (SyntKeyMapping.IsHandledCmd(Ed.KeyQueue)<>0) and
          not FLastCmdPlaying and
          not ecMacroRecorder1.Plying then
        begin
          Handled:= true;
          Exit
        end;

        if not IsWordChar(ch) then
          DoCheckAutoCorrectCase(Ed);

        if (ch='>') then
          Handled:= DoAutoCloseTag
        else
        if IsBracketChar(ch) or IsQuoteChar(ch) then
          Handled:= DoAutoCloseBracket(ch)
        else
        if IsWordChar(ch) then
        begin
          DoCheckAutoShowACP(Ed);
        end;
      end;

    smLineBreak:
      begin
        DoCheckAutoCorrectCase(Ed);
        Handled:= false;
      end;

    //case changing
    smUpperCaseBlock,
    smLowerCaseBlock,
    smToggleCaseBlock,
    smTitleCaseBlock,
    smSentCaseBlock:
      EditorChangeBlockCase(Ed, TChangeCase(Command - smUpperCaseBlock + 1));

    //indent
    smTab:
      begin
        if Ed.IsTabstopMode then
        begin
          Ed.DoJumpToNextTabstop;
        end
        else
        if Ed.HaveSelection and EditorHasMultilineSelection(Ed) then
        begin
          Ed.ExecCommand(smBlockIndent);
          Exit; //don't record Tab cmd
        end
        else
        if DoSnippetTabbing then //snippets - before SmartTagTabbing
          begin end
        else
        if DoSmartTagTabbing then
          begin end
        else
          Handled:= false;
      end;

    smCopy:
      begin
        if not Ed.HaveSelection and opCopyLineIfNoSel then
          EditorCopyOrCutCurrentLine(Ed, false)
        else
          Handled:= false;
      end;
    smCut:
      begin
        if not Ed.HaveSelection and opCopyLineIfNoSel then
          EditorCopyOrCutCurrentLine(Ed, true)
        else
          Handled:= false;
      end;

    smBlockIndent,
    smBlockUnindent:
      begin
        if Ed.SelLength>0 then //only for stream blocks it works ok
        begin
          if Command=smBlockIndent then
            DoLinesCommand(scmdIndent)
          else
            DoLinesCommand(scmdUnIndent);
        end
        else
          Handled:= false;
      end;

    smScrollUp,
    smScrollDown:
      begin
        Handled:= false;
        if opKeepCaretOnScreen and not EditorHasNoCaret(Ed) then
          EditorKeepCaretOnScreen(Ed);
      end;

    smDuplicateLine:
      EditorDuplicateLine(Ed);

    smGotoLine:
      ecGoto.Execute;

    sm_AutoComplete:
      DoAcpCommand;

    //bkmarks
    sm_BookmarksClear:
      ecBkClearAll.Execute;
    sm_BookmarksToggle:
      ecBkToggle.Execute;
    sm_BookmarksPrev:
      ecBkPrev.Execute;
    sm_BookmarksNext:
      ecBkNext.Execute;
    sm_BookmarksCopy:
      ecBkCopy.Execute;
    sm_BookmarksCut:
      ecBkCut.Execute;
    sm_BookmarksDelete:
      ecBkDelete.Execute;
    sm_BookmarksDeleteUnmarked:
      ecBkDeleteUnmk.Execute;
    sm_BookmarksPaste:
      ecBkPaste.Execute;
    sm_BookmarksInverse:
      ecBkInverse.Execute;

    smPrint:
      ecPrintAction.Execute;
    smPrintPreview:
      ecPreviewAction.Execute;
    sm_PrinterSetup:
      ecPrinterSetup.Execute;

    //scroll
    smLeft:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollLeft)
      else
      if (Ed.SelLength>0) and not (soPersistentBlocks in Ed.Options) then
      begin
        //Move caret to sel start on Left pressing
        Ed.CaretStrPos:= Ed.SelStart;
        Ed.ResetSelection;
      end
      else
        Handled:= False;
     end;

    smRight:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollRight)
      else
      if (Ed.SelLength>0) and not (soPersistentBlocks in Ed.Options) then
      begin
        //Move caret to sel end on Right pressing
        Ed.CaretStrPos:= Ed.SelStart+Ed.SelLength;
        Ed.ResetSelection;
      end
      else
        Handled:= False;
    end;

    smUp:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollUp)
      else
        Handled:= False;
    end;
    smDown:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollDown)
      else
        Handled:= False;
    end;
    smPageUp:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollPageUp)
      else
        Handled:= False;
    end;
    smPageDown:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smScrollPageDown)
      else
        Handled:= False;
    end;
    //Home key
    smFirstLetter:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smEditorTop{smScrollPageLeft})
      else
        Handled:= false;
    end;
    //End key
    smLastLetter:
    begin
      if EditorHasNoCaret(Ed) then
        Ed.ExecCommand(smEditorBottom{smScrollPageRight})
      else
        Handled:= False;
    end;

    //Shift+
    smSelLeft..smSelDown:
      Handled:= EditorHasNoCaret(Ed);

    //search
    smFindDialog:
      ecFind.Execute;
    smReplaceDialog:
      ecReplace.Execute;
    sm_ReplaceInFiles:
      ecReplaceInFiles.Execute;

    smFindNext:
    begin
      if IsTreeviewFocused then
        ecFindInTreeNext.Execute
      else
      if IsListboxFocused then
        ecFindInListNext.Execute
      else
      begin
        FindInit(true{KeepFlags});

        if Finder.FindText<>'' then
        begin
          Finder.FindNext;
          if Finder.Matches>0 then
            EditorCheckCaretOverlappedByForm(Finder.Control, fmSR);
        end
        else
          ecFind.Execute;

        DoClearFindDialogStatus;
      end;
    end;

    smFindPrev:
    begin
      if IsTreeviewFocused then
        ecFindInTreePrev.Execute
      else
      if IsListboxFocused then
        ecFindInListPrev.Execute
      else
      begin
        FindInit(true{KeepFlags});

        if Finder.FindText<>'' then
        begin
          Finder.FindPrev;
          if Finder.Matches>0 then
            EditorCheckCaretOverlappedByForm(Finder.Control, fmSR);
        end
        else
          ecFind.Execute;

        DoClearFindDialogStatus;
      end;
    end;

    smFindAll:
    begin
      FindInit(true{KeepFlags});
      if opSrSuggestSel and (Ed.SelLength>0) then
        Finder.FindText:= Ed.SelText
      else
      if opSrSuggestWord then
        Finder.FindText:= Ed.WordAtPos(Ed.CaretPos);
      if Finder.FindText='' then
        ecFind.Execute
      else
      begin
        Finder.Flags:= Finder.Flags+[ftEntireScope];
        Finder.FindAll;
        MsgFound;
        UpdateFrameMicroMap(CurrentFrame);
      end;
      DoClearFindDialogStatus;
    end;

    smReplaceAll:
    begin
      FindInit(true{KeepFlags});
      if Finder.FindText='' then
        ecReplace.Execute
      else
      begin
        Finder.Flags:= Finder.Flags+[ftEntireScope];
        Finder.ReplaceAll;
        MsgFound;
      end;
      DoClearFindDialogStatus;
    end;

    smReplaceNext:
    begin
      FindInit(true{KeepFlags});
      if Finder.FindText='' then
        ecReplace.Execute
      else
      begin
        Finder.Flags:= Finder.Flags-[ftEntireScope];
        DoFixReplaceCaret(Ed);
        if Ed.SelLength>0 then
          Finder.ReplaceAgain;
        Finder.FindAgain;
      end;
      DoClearFindDialogStatus;
    end;

    //find curr word
    smFindCurrentWordNext:
    begin
      FindInit;
      FindCurrentWord(true);
    end;
    smFindCurrentWordPrior:
    begin
      FindInit;
      FindCurrentWord(false);
    end;

    //Lister find
    sm_ListerFindDialog:
      PostMessage(hLister, WM_KEYDOWN, VK_F7, 0);
    sm_ListerFindNext:
      PostMessage(hLister, WM_KEYDOWN, VK_F3, 0);
    sm_ListerFindPrev:
    begin
      PostMessage(hLister, WM_KEYDOWN, VK_SHIFT, 0);
      PostMessage(hLister, WM_KEYDOWN, VK_F3, 0);
    end;

    //clip
    sm_CopyAsHTML:  EditorCopyAsHtml(Ed);
    sm_CopyAsRTF:   EditorCopyAsRtf(Ed);
    sm_CopyAppend:  EditorCopyOrCutAndAppend(Ed, false);
    sm_CutAppend:   EditorCopyOrCutAndAppend(Ed, true);
    sm_CopyLine:    EditorCopyOrCutCurrentLine(Ed, false);
    sm_CutLine:     EditorCopyOrCutCurrentLine(Ed, true);

    //Del key
    smDeleteChar:
    begin
      DoCheckIfBookmarkSetHere(Ed, Ed.CaretStrPos);
      Handled:= false;
    end;
    //BackSpace key
    smDeleteLastChar:
    begin
      DoCheckIfBookmarkSetHere(Ed, Ed.CaretStrPos-1);
      Handled:= false;
    end;

    //Delete lines
    smDeleteLine:
      ecRemoveLines.Execute;

    //Ctrl+End: if pressed on last line, scroll editor up
    smEditorBottom:
    begin
      if (soScrollLastLine in Ed.Options) and
        (Ed.CaretPos.Y = Ed.Lines.Count-1) then
        Ed.TopLine:= Ed.Lines.Count-1
      else
        Handled:= false;
    end;

    //sorting
    smSortAscending:
      ecSortAscending.Execute;
    smSortDescending:
      ecSortDescending.Execute;

    //tools
    sm_OpenFirefox: RunBrowser('firefox.exe');
    sm_OpenMSIE: RunBrowser('iexplore.exe');
    sm_OpenChrome: RunBrowser('chrome.exe');
    sm_OpenSafari: RunBrowser('safari.exe');
    sm_OpenBrowserPreview: DoOpenBrowserPreview;
    sm_OpenCurrentFile: DoOpenCurrentFile;
    sm_OpenCurrentFolder: DoOpenCurrentDir;
    sm_OpenCmdPrompt: DoOpenCmdPrompt;

    sm_OpenPhp: DoOnlineWordHelp('http://www.php.net/%s');
    sm_OpenHTML4Help: DoOnlineWordHelp('http://www.w3schools.com/tags/tag_%s.asp');
    sm_OpenHTML5Help: DoOnlineWordHelp('http://dev.w3.org/html5/markup/%s.html');
    sm_OpenGoogle: DoOnlineFind('http://www.google.com/search?q=');
    sm_OpenWiki: DoOnlineFind('http://en.wikipedia.org/w/index.php?title=Special:Search&search=');
    sm_OpenMsdn: DoOnlineFind('http://social.msdn.microsoft.com/Search/en-US?query=');
    sm_TidyValidate: DoTidy('');
    sm_TidyConfig: DoOpenFile(SynTidyIni);

    sm_LoremIpsumDialog: ecLoremIpsum.Execute;
    sm_NumericConverterDialog: ecNumericConverter.Execute;
    sm_EncodeHtmlChars: ecEncodeHtmlChars.Execute;
    sm_EncodeHtmlChars2: ecEncodeHtmlChars2.Execute;
    sm_SortDialog: ecSortDialog.Execute;
    sm_ToggleLineCommentAlt: ecToggleLineCommentAlt.Execute;

    sm_InsertColor: ecInsertColor.Execute;
    sm_InsertImage: ecInsertImage.Execute;
    sm_GotoSelectionStartEnd: EditorJumpSelectionStartEnd(Ed);
    sm_GotoBookmarkDialog: ecGotoBk.Execute;
    sm_ReplaceFromClipAll: ecReplaceSelFromClipAll.Execute;
    sm_RereadOutputPanel: acRereadOut.Execute;
    sm_DropPortableBk: ecDropPortableBk.Execute;
    sm_GotoPortableBk: ecGotoPortableBk.Execute;
    sm_IndentLike1st: ecIndentLike1st.Execute;
    sm_JumpColumnMarkerLeft: EditorJumpColumnMarker(Ed, true);
    sm_JumpColumnMarkerRight: EditorJumpColumnMarker(Ed, false);
    sm_PasteNoCursorChange: EditorPasteNoCaretChange(Ed);
    sm_PasteToColumn1: EditorPasteToFirstColumn(Ed);
    sm_PasteAsColumnBlock: begin if not EditorPasteAsColumnBlock(Ed) then MsgBeep; end;
    sm_JumpMixedCaseLeft: begin if not EditorJumpMixedCase(Ed, false) then MsgBeep; end;
    sm_JumpMixedCaseRight: begin if not EditorJumpMixedCase(Ed, true) then MsgBeep; end;
    sm_CancelSelection: Ed.ResetSelection;
    sm_CenterLines: ecCenterLines.Execute;
    sm_ExtendSelByLine: EditorExtendSelectionByOneLine(Ed);
    sm_SelectBrackets: EditorSelectBrackets(Ed, FPrevCaretPos);
    sm_CollapseParent: ecCollapseParent.Execute;
    sm_CollapseWithNested: ecCollapseWithNested.Execute;
    sm_AlignWithSeparator: ecAlignWithSep.Execute;
    sm_ToggleShowGroup2: ecToggleShowGroup2.Execute;
    sm_SelectionExtend: DoExtendSelection(Ed);
    //sm_SelectionShrink: ecSelShrink.Execute;
    sm_ReverseLines: ecReverseLines.Execute;
    sm_ShuffleLines: ecShuffleLines.Execute;
    sm_DeleteToFileBegin: EditorDeleteToFileBegin(Ed);
    sm_DeleteToFileEnd: EditorDeleteToFileEnd(Ed);

    //blank operations
    sm_RemoveBlanks: ecRemoveBlanks.Execute;
    sm_ReduceBlanks: ecReduceBlanks.Execute;
    sm_TrimLeading: ecTrimLead.Execute;
    sm_TrimTrailing: ecTrimTrail.Execute;
    sm_TrimAll: ecTrimAll.Execute;
    sm_RemoveDupSpaces: ecRemoveDupSpaces.Execute;
    sm_ConvertTabsToSpaces: ecTabToSp.Execute;
    sm_ConvertSpacesToTabsAll: ecSpToTab.Execute;
    sm_ConvertSpacesToTabsLeading: ecSpToTabLeading.Execute;

    sm_GotoNextBlank: begin if not EditorJumpBlankLine(Ed, opSrOffsetY, true) then MsgBeep; end;
    sm_GotoPrevBlank: begin if not EditorJumpBlankLine(Ed, opSrOffsetY, false) then MsgBeep; end;
    sm_SelectParagraph: EditorSelectParagraph(Ed);
    sm_SelectToken:         begin if not EditorSelectToken(Ed, false) then MsgBeep; end;
    sm_SelectTokenNoQuotes: begin if not EditorSelectToken(Ed, true) then MsgBeep; end;
    sm_SelectToWordEnd: EditorSelectOrJumpToWordEnd(Ed, true);
    sm_JumpToWordEnd: EditorSelectOrJumpToWordEnd(Ed, false);
    sm_FindNextAndExtendSel: ecFindNextWithExtend.Execute;
    sm_FindPrevAndExtendSel: ecFindPrevWithExtend.Execute;
    sm_FindClipboardNext: ecFindClipNext.Execute;
    sm_FindClipboardPrev: ecFindClipPrev.Execute;
    sm_RepeatLastCommand: ecRepeatCmd.Execute;
    sm_FindCommand: DoFindCommandFromString(WideString(PWideChar(Data)));
    sm_CommandsList: ecCommandsList.Execute;
    sm_ScrollToSel: EditorScrollToSelection(Ed, opSrOffsetY);
    sm_ProjectList: ecProjectList.Execute;

    sm_RemoveDupsAll: ecDedupAll.Execute;
    sm_RemoveDupsAdjacent: ecDedupAdjacent.Execute;
    sm_ExtractDupsCase: ecExtractDupsCase.Execute;
    sm_ExtractDupsNoCase: ecExtractDupsNoCase.Execute;

    //macros 1-9
    sm_MacroRepeat: ecMacroRepeat.Execute;
    sm_Macro1: ecMacro1.Execute;
    sm_Macro2: ecMacro2.Execute;
    sm_Macro3: ecMacro3.Execute;
    sm_Macro4: ecMacro4.Execute;
    sm_Macro5: ecMacro5.Execute;
    sm_Macro6: ecMacro6.Execute;
    sm_Macro7: ecMacro7.Execute;
    sm_Macro8: ecMacro8.Execute;
    sm_Macro9: ecMacro9.Execute;
    sm_Macro10: ecMacro10.Execute;
    sm_Macro11: ecMacro11.Execute;
    sm_Macro12: ecMacro12.Execute;
    sm_Macro13: ecMacro13.Execute;
    sm_Macro14: ecMacro14.Execute;
    sm_Macro15: ecMacro15.Execute;
    sm_Macro16: ecMacro16.Execute;
    sm_Macro17: ecMacro17.Execute;
    sm_Macro18: ecMacro18.Execute;
    sm_Macro19: ecMacro19.Execute;
    sm_Macro20: ecMacro20.Execute;
    sm_Macro21: ecMacro21.Execute;
    sm_Macro22: ecMacro22.Execute;
    sm_Macro23: ecMacro23.Execute;
    sm_Macro24: ecMacro24.Execute;
    sm_Macro25: ecMacro25.Execute;
    sm_Macro26: ecMacro26.Execute;
    sm_Macro27: ecMacro27.Execute;
    sm_Macro28: ecMacro28.Execute;
    sm_Macro29: ecMacro29.Execute;
    sm_Macro30: ecMacro30.Execute;

    //tabs 0-9
    sm_Tab0: DoTabIndexClick(0);
    sm_Tab1: DoTabIndexClick(1);
    sm_Tab2: DoTabIndexClick(2);
    sm_Tab3: DoTabIndexClick(3);
    sm_Tab4: DoTabIndexClick(4);
    sm_Tab5: DoTabIndexClick(5);
    sm_Tab6: DoTabIndexClick(6);
    sm_Tab7: DoTabIndexClick(7);
    sm_Tab8: DoTabIndexClick(8);
    sm_Tab9: DoTabIndexClick(9);

    sm_TabRt0: DoRtTabIndexClick(0);
    sm_TabRt1: DoRtTabIndexClick(1);
    sm_TabRt2: DoRtTabIndexClick(2);
    sm_TabRt3: DoRtTabIndexClick(3);
    sm_TabRt4: DoRtTabIndexClick(4);
    sm_TabRt5: DoRtTabIndexClick(5);
    sm_TabRt6: DoRtTabIndexClick(6);
    sm_TabRt7: DoRtTabIndexClick(7);
    sm_TabRt8: DoRtTabIndexClick(8);
    sm_TabRt9: DoRtTabIndexClick(9);

    //split
    sm_Split2080: ecSplit20_80.Execute;
    sm_Split3070: ecSplit30_70.Execute;
    sm_Split4060: ecSplit40_60.Execute;
    sm_Split5050: ecSplit50_50.Execute;
    sm_Split6040: ecSplit60_40.Execute;
    sm_Split7030: ecSplit70_30.Execute;
    sm_Split8020: ecSplit80_20.Execute;
    sm_SplitLeft: ecSplitLeft.Execute;
    sm_SplitRight: ecSplitRight.Execute;

    //encoding
    sm_Encoding_Ansi: ApplyFrameEncodingAndReload(CurrentFrame, cp_ACP);
    sm_Encoding_Oem: ApplyFrameEncodingAndReload(CurrentFrame, cp_OEMCP);
    sm_Encoding_Utf8: ApplyFrameEncodingAndReload(CurrentFrame, cp__UTF8);
    sm_Encoding_Utf8NoBom: ApplyFrameEncodingAndReload(CurrentFrame, cp__UTF8_noBOM);
    sm_Encoding_Unicode: ApplyFrameEncodingAndReload(CurrentFrame, cp__Unicode);
    sm_Encoding_UnicodeBE: ApplyFrameEncodingAndReload(CurrentFrame, cp__UnicodeBE);
    sm_Encoding_Koi8: ApplyFrameEncodingAndReload(CurrentFrame, 20866);
    sm_Encoding_Mac: ApplyFrameEncodingAndReload(CurrentFrame, cp_MACCP);

    sm_Menu_Encodings:
      begin
        p:= Mouse.CursorPos;
        PopupStatusEnc.Popup(p.x, p.y);
      end;
    sm_Menu_Lexers:
      begin
        p:= Mouse.CursorPos;
        PopupLexers.Popup(p.x, p.y);
      end;
    sm_Menu_LineEnds:
      begin
        p:= Mouse.CursorPos;
        PopupStatusLineEnds.Popup(p.x, p.y);
      end;

    sm_QuickSearch:
      begin
        if not tbQs.Visible then
          TbxItemTQsClick(Self);
        tbQs.CurrentDock.Show;
        if Self.Enabled and edQs.CanFocus then
          edQs.SetFocus;
      end;

    sm_InsertDateTime:
      DoDateTime;
    sm_ExtractTextDialog:
      DoExtractText;
    sm_GotoNextFindResult:
      ecGotoNextFindResult.Execute;
    sm_GotoPrevFindResult:
      ecGotoPrevFindResult.Execute;

    sm_ClearFilesHistory:
      DoClearFilesHistory;
    sm_ToggleSyncEditing:
      DoToggleSyncEditing;
    sm_ShowFullScreen:
      ecFullScr.Execute;
    sm_ShowOnTop:
      ecOnTop.Execute;
    sm_SyncScrollHorz:
      ecSyncScrollH.Execute;
    sm_SyncScrollVert:
      ecSyncScrollV.Execute;
    sm_FillBlockDialog:
      DoFillBlock;
    sm_InsertTextDialog:
      DoInsertTextDialog;
    sm_SpellLive:
      ecSpellLive.Execute;
    sm_SpellCheck:
      ecSpellCheck.Execute;
    sm_JoinLines:
      EditorJoinLines(Ed);
    sm_SplitLines:
      EditorSplitLinesWithDialog(Ed);

    smSelCharacter:
      begin
        with ecCharPopup do
          if Visible then
            CloseUp(false)
          else
            Handled:= false;
      end;

    smCommentLines,
    smUncommentLines:
      EditorCommentUncommentLines(Ed, Command = smCommentLines);
    sm_ToggleLineComment:
      ecToggleLineComment.Execute;
    sm_ToggleStreamComment:
      ecToggleStreamComment.Execute;

    //file
    sm_FileNew: acNewTab.Execute;
    sm_FileNewWindow: acNewWindow.Execute;
    sm_FileOpen: acOpen.Execute;
    sm_FileReopen: acReread.Execute;
    sm_FileSave: if acSave.Enabled then acSave.Execute;
    sm_FileSaveAs: if acSaveAs.Enabled then acSaveAs.Execute;
    sm_FileSaveAll: acSaveAll.Execute;
    sm_FileProps: acProps.Execute;
    sm_Fav_AddFile: acFavAddFile.Execute;
    sm_Fav_AddProject: acFavAddProj.Execute;
    sm_Fav_Organize: acFavManage.Execute;

    //tab closing commands are special, they destroy current editor,
    //so need to perform them not in OnExecuteCommand
    sm_FileClose,
    sm_FileCloseAndDelete,
    sm_FileCloseAll,
    sm_FileCloseOthers,
    sm_FileCloseOthersAllGroups,
    sm_FileRenameDialog,
    sm_FileOpenSession,
    sm_FileAddSession,
    sm_FileCloseSession:
      DoDelayedCommandWithClose(Command);

    sm_FileMoveToOtherView:
      Groups.MoveCurrentTabToOpposite;

    sm_FileExit: acExit.Execute;
    sm_FileSaveSession: DoSaveSession;
    sm_FileSaveSessionAs: DoSaveSessionAs;

    sm_FileExportRtf: acExportRTF.Execute;
    sm_FileExportHtml: acExportHTML.Execute;

    sm_OptSetup: acSetup.Execute;
    sm_OptSetupLexer: acSetupLexer.Execute;
    sm_OptSetupLexerLib: acSetupLexLib.Execute;
    sm_OptReadOnly: ecReadOnly.Execute;
    sm_OptShowLeftPanel: ecShowTree.Execute;
    sm_OptShowRightPanel: ecShowClip.Execute;
    sm_OptShowOutputPanel: ecShowOut.Execute;
    sm_OptWrap: ecWrap.Execute;
    sm_OptLineNums: ecLineNums.Execute;
    sm_OptFolding: ecFolding.Execute;
    sm_OptNonPrint: ecNonPrint.Execute;
    sm_OptRuler: ecRuler.Execute;
    sm_ToggleSmartHl: ecSmartHl.Execute;

    sm_ToggleFocusTree: ecToggleFocusTree.Execute;
    sm_ToggleFocusClip: ecToggleFocusClip.Execute;
    sm_ToggleFocusClips: ecToggleFocusClips.Execute;
    sm_ToggleFocusOutput: ecToggleFocusOutput.Execute;
    sm_ToggleFocusFindRes: ecToggleFocusFindRes.Execute;
    sm_ToggleFocusValidate: ecToggleFocusValidate.Execute;
    sm_ToggleFocusMap: ecToggleFocusMap.Execute;
    sm_ToggleFocusProj: ecToggleFocusProject.Execute;
    sm_ToggleFocusTabs: ecToggleFocusTabs.Execute;
    sm_ToggleSlaveView: ecToggleSlave.Execute;
    sm_ToggleFocusMasterSlave: ecToggleFocusMasterSlave.Execute;
    sm_ToggleFocusConsole: ecToggleFocusConsole.Execute;
    sm_ToggleFocusGroups: ecToggleFocusGroups.Execute;

    sm_SplitViewsVertHorz: ecSplitViewsVertHorz.Execute;
    sm_SplitSlaveVertHorz: ecSplitSlaveVertHorz.Execute;

    sm_Emmet_Expand: ecZenExpand.Execute;
    sm_Emmet_Wrap: ecZenWrap.Execute;

    sm_FileBackup:
      acBackup.Execute;
    sm_ColumnMarkers:
      acColumnMarkers.Execute;

    //copy path
    sm_CopyFilename: DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFileName);
    sm_CopyFullPath: DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFullName);
    sm_CopyDirPath:  DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFilePath);

    //move caret
    sm_CaretIncX:  EditorMoveCaretByNChars(Ed, +SynHiddenOption('MovX', 20), 0);
    sm_CaretDecX:  EditorMoveCaretByNChars(Ed, -SynHiddenOption('MovX', 20), 0);
    sm_CaretIncY:  EditorMoveCaretByNChars(Ed, 0, +SynHiddenOption('MovY', 10));
    sm_CaretDecY:  EditorMoveCaretByNChars(Ed, 0, -SynHiddenOption('MovY', 10));

    //misc
    smChangeRangeSide: begin if not EditorJumpRange(Ed) then MsgBeep; end;
    sm_CopySearchMarks: DoCopySearchMarks(Ed);

    //macros
    {
    //disable these! Or Stack-overflow.
    smMacroRecStart: ecMacroRecord1.Execute;
    smMacroRecStop:  ecMacroStop1.Execute;
    smMacroRecCancel: ecMacroCancel1.Execute;
    smMacroPlay:     ecMacroPlay1.Execute;
    }
    sm_MacrosDialog: ecMacroDlg.Execute;

    sm_ZoomOriginal: DoZoomEditor(100);
    sm_ZoomIn:       DoZoomEditorInc(true);
    sm_ZoomOut:      DoZoomEditorInc(false);

    sm_OptNonPrintOff: ecNonPrintOff.Execute;
    sm_OptNonPrintSpaces: ecNonPrintSpaces.Execute;
    sm_OptNonPrintEol: ecNonPrintEol.Execute;
    sm_OptNonPrintBoth: ecNonPrintBoth.Execute;
    sm_OptNonPrintEolDetails: ecNonPrintEolDetails.Execute;

    sm_FoldLevel2: DoFoldLevel(2);
    sm_FoldLevel3: DoFoldLevel(3);
    sm_FoldLevel4: DoFoldLevel(4);
    sm_FoldLevel5: DoFoldLevel(5);
    sm_FoldLevel6: DoFoldLevel(6);
    sm_FoldLevel7: DoFoldLevel(7);
    sm_FoldLevel8: DoFoldLevel(8);
    sm_FoldLevel9: DoFoldLevel(9);

    sm_TabColorDefault: DoSetTabColorIndex_Current(0);
    sm_TabColorCustom: DoSetTabColorIndex_Current(-1);
    sm_TabColor1: DoSetTabColorIndex_Current(1);
    sm_TabColor2: DoSetTabColorIndex_Current(2);
    sm_TabColor3: DoSetTabColorIndex_Current(3);
    sm_TabColor4: DoSetTabColorIndex_Current(4);
    sm_TabColor5: DoSetTabColorIndex_Current(5);
    sm_TabColor6: DoSetTabColorIndex_Current(6);
    sm_TabColor7: DoSetTabColorIndex_Current(7);
    sm_TabColor8: DoSetTabColorIndex_Current(8);
    sm_TabColor9: DoSetTabColorIndex_Current(9);
    sm_TabColor10: DoSetTabColorIndex_Current(10);

    sm_HideMenuItemsDialog:       DoConfigHideItems;
    sm_RestoreStylesDialog:       DoConfigRestoreStyles;
    sm_ExternalToolsDialog:       DoConfigTools;
    sm_ExplorerIntegrationDialog: DoConfigShellOptions;

    sm_EditSynIni:                DoOpenFile(SynIni);
    sm_EditSynPluginsIni:         DoOpenFile(SynPluginsIni);
    sm_OpenBySelection:           acOpenBySelection.Execute;
    sm_CustomizeStylesDialog:     acSetupLexHL.Execute;
    sm_CustomizeSpellCheckDialog: DoSpellConfig(nil);

    //Options dialog tabs
    sm_OptionsTab_ProgramOpt: DoOptionsDialog(1);
    sm_OptionsTab_Keys: DoOptionsDialog(2);
    sm_OptionsTab_Colors: DoOptionsDialog(3);
    sm_OptionsTab_Fonts: DoOptionsDialog(4);
    sm_OptionsTab_Tabs: DoOptionsDialog(5);
    sm_OptionsTab_Search: DoOptionsDialog(6);
    sm_OptionsTab_TreeMap: DoOptionsDialog(7);
    sm_OptionsTab_EditorView: DoOptionsDialog(9);
    sm_OptionsTab_EditorSelect: DoOptionsDialog(10);
    sm_OptionsTab_EditorCarets: DoOptionsDialog(11);
    sm_OptionsTab_EditorUndo: DoOptionsDialog(12);
    sm_OptionsTab_EditorInsertFmt: DoOptionsDialog(13);
    sm_OptionsTab_EditorOverrides: DoOptionsDialog(14);
    sm_OptionsTab_AutoComplete: DoOptionsDialog(15);
    sm_OptionsTab_SpellChecker: DoOptionsDialog(16);
    sm_OptionsTab_NewOpen: DoOptionsDialog(18);
    sm_OptionsTab_AutoSave: DoOptionsDialog(19);
    sm_OptionsTab_History: DoOptionsDialog(20);
    sm_OptionsTab_FormatsReload: DoOptionsDialog(21);
    sm_OptionsTab_SessionsProject: DoOptionsDialog(22);
    sm_OptionsTab_Paths: DoOptionsDialog(23);

    //tree
    sm_TreeNextNode: ecTreeNext.Execute;
    sm_TreePrevNode: ecTreePrev.Execute;
    sm_TreeParent: ecTreeParent.Execute;
    sm_TreeNextBrother: ecTreeNextBrother.Execute;
    sm_TreePrevBrother: ecTreePrevBrother.Execute;

    sm_TreeCollapseAll: TBXItemTreeCollapseAll.Click;
    sm_TreeExpandAll: TBXItemTreeExpandAll.Click;

    sm_TreeLevel2: DoTreeLevel(2);
    sm_TreeLevel3: DoTreeLevel(3);
    sm_TreeLevel4: DoTreeLevel(4);
    sm_TreeLevel5: DoTreeLevel(5);
    sm_TreeLevel6: DoTreeLevel(6);
    sm_TreeLevel7: DoTreeLevel(7);
    sm_TreeLevel8: DoTreeLevel(8);
    sm_TreeLevel9: DoTreeLevel(9);

    //project
    sm_NewProject: DoNewProject;
    sm_OpenProject: DoOpenProject;
    sm_AddFileToProject: DoAddFileToProject;
    sm_AddFilesToProject: DoAddFilesToProject;
    sm_FavoriteProjects: DoFavoriteProjects;
    sm_SaveProject: DoSaveProject;
    sm_UpdateProject: DoUpdateProject;

    sm_PasteAndSelect: DoPasteAndSelect;
    sm_InsertBlankLineAbove: EditorInsertBlankLineAboveOrBelow(Ed, false);
    sm_InsertBlankLineBelow: EditorInsertBlankLineAboveOrBelow(Ed, true);
    sm_CopyCurrentURL: DoCopyURL;
    sm_OpenCurrentURL: DoOpenURL;
    sm_FindId: DoFindId;
    sm_AddRecentColorCode: DoAddCurrentColorCodeToRecents;
    sm_SaveFolding: DoSaveFolding;
    sm_LoadFolding: DoLoadFolding;
    sm_OpenLastClosedFile: DoOpenLastClosedFile;
    sm_AcpForceTextOn: opAcpForceText:= true;
    sm_AcpForceTextOff: opAcpForceText:= false;

    //select-mode commands
    smNormalSelect: Ed.SelectModeDefault:= msNormal;
    smColumnSelect: Ed.SelectModeDefault:= msColumn;
    smLineSelect: Ed.SelectModeDefault:= msLine;
    smMarkSelStart: EditorMarkSelStart(Ed);
    smMarkSelEnd: EditorMarkSelEnd(Ed);

    sm_ScrollCurrentLineToTop: EditorScrollCurrentLineTo(Ed, cScrollToTop);
    sm_ScrollCurrentLineToBottom: EditorScrollCurrentLineTo(Ed, cScrollToBottom);
    sm_ScrollCurrentLineToMiddle: EditorScrollCurrentLineTo(Ed, cScrollToMiddle);

    sm_NewPythonPluginDialog: DoPyNewPluginDialog;
    sm_NewSnippetDialog: DoSnippetNew;
    sm_SnippetsDialog: DoSnippetListDialog('');

    //sync bookmarks of master/slave editors
    smSetBookmark0 .. smSetBookmark9:
      begin
        BrotherEditor(Ed).Bookmarks[Command - smSetBookmark0]:= Ed.CaretStrPos;
        Handled:= false;
      end;

    //sync markers of master/slave editors
    smDropMarker:
      begin
        BrotherEditor(Ed).DropMarker(Ed.CaretPos);
        //consider snippets
        Ed.MarkersLen.Clear;
        Handled:= false;
      end;
    smCollectMarker:
      begin
        with BrotherEditor(Ed) do
        begin
          if Markers.Count>0 then
            Markers.Delete(Markers.Count-1);
          Invalidate;
        end;
        //consider snippets
        Ed.MarkersLen.Clear;
        Handled:= false;
      end;
    smSwapMarker:
      begin
        with BrotherEditor(Ed) do
        begin
          DropMarker(Ed.CaretPos);
          if Markers.Count>=2 then
            Markers.Delete(Markers.Count-2);
          Invalidate;
        end;
        //consider snippets
        Ed.MarkersLen.Clear;
        Handled:= false;
      end;

    smUndo:
      begin
        if Ed.IsTabstopMode then
        begin
          Ed.MarkersLen.Clear;
          Ed.Markers.Clear;
        end;
        Handled:= false;
      end;

    sm_MarkersClear:
      begin
        EditorClearMarkers(Ed);
        EditorClearMarkers(BrotherEditor(Ed));
      end;
    sm_JumpToLastMarker:
      EditorJumpToLastMarker(Ed);

    sm_HelpFileContents:
      FOpenURL(FHelpFilename, Handle);
    sm_ResetPythonPlugins:
      DoPyResetPlugins;

    sm_GotoNextTab:
      DoTabSwitch(true, false);
    sm_GotoPrevTab:
      DoTabSwitch(false, false);

    sm_GotoNextOutputResult:
      DoJumpToNextOutputResult(not ListVal.Visible, true);
    sm_GotoPrevOutputResult:
      DoJumpToNextOutputResult(not ListVal.Visible, false);

    sm_GotoNextSearchOrOutputResult:
      begin
        if TreeFind.Visible then
          DoJumpToNextSearchResult(true)
        else
          DoJumpToNextOutputResult(not ListVal.Visible, true);
      end;
    sm_GotoPrevSearchOrOutputResult:
      begin
        if TreeFind.Visible then
          DoJumpToNextSearchResult(false)
        else
          DoJumpToNextOutputResult(not ListVal.Visible, false);
      end;

    sm_ToggleShowFoldersOnTabs:
      DoToggleTabDirs;
    sm_InsertUnicodeHexDialog:
      DoInsertUnicodeHexDialog;

    sm_MoveCurrentTabToNextGroup:
      Groups.MoveCurrentTabToNext(true);
    sm_MoveCurrentTabToPrevGroup:
      Groups.MoveCurrentTabToNext(false);

    smDeleteLastWord:
      begin
        //override to make it work at line-start: move to end of previous line
        P:= Ed.CaretPos;
        if P.X=0 then
        begin
          if P.Y>0 then
            Ed.CaretPos:= Point(Ed.Lines.LineLength(P.Y-1), P.Y-1);
        end
        else
          Handled:= false;
      end;

    //end of commands list
    else
      Handled:= false;
  end;

  //workaround for non-recorded commands
  //(EC issue)
  if Handled or IsCommandAllowedInMacro(Command) then
    DoRecordToMacro(Command, nil);
end;

function TfmMain.IsCommandAllowedInMacro(Cmd: Integer): boolean;
begin
  if Cmd=TemplatePopup.CommandID then
    Result:= true
  else
  if (Cmd>=sm_CaretsRemoveLeaveFirst) and
     (Cmd<=sm_CaretsRemoveLeaveFirst+50) then
    Result:= true
  else
    Result:= false;
end;

procedure TfmMain.UpdateLexList;
var
  ACurLexer: string;
  //
  function DoMakeItem(const SName: string; NTag: Integer): TSpTbxItem;
  begin
    Result:= TSpTbxItem.Create(Self);
    if SName<>'' then
      Result.Caption:= SName
    else
      Result.Caption:= DKLangConstW('None');
    Result.Tag:= NTag;
    Result.OnClick:= LexListClick;
    Result.RadioItem:= true;
    Result.Checked:= SName = ACurLexer;
  end;
  //
var
  menu: TSpTbxSubmenuItem;
  s: TStringList;
  i, nTag: integer;
  ch: char;
begin
  PopupLexers.Items.Clear;
  if SyntaxManager.AnalyzerCount=0 then Exit;

  ACurLexer:= CurrentLexerForFile;
  PopupLexers.Items.Add(DoMakeItem('', -1));

  s:= TStringList.Create;
  try
    s.Sorted:= true;
    s.Duplicates:= dupIgnore;
    for i:= 0 to SyntaxManager.AnalyzerCount-1 do
      if not SyntaxManager.Analyzers[i].Internal then
        s.AddObject(SyntaxManager.Analyzers[i].LexerName, TObject(i));

    if opLexerGroups then
    begin
      for ch:= 'A' to 'Z' do
      begin
        menu:= TSpTbxSubmenuItem.Create(Self);
        menu.Caption:= ch;
        PopupLexers.Items.Add(menu);

        for i:= 0 to s.Count-1 do
          if (UpCase(s[i][1]) = UpCase(ch)) then
          begin
            nTag:= integer(s.Objects[i]);
            if SyntaxManager.Analyzers[nTag].Internal then Continue;
            menu.Add(DoMakeItem(s[i], nTag));
          end;
        if menu.Count=0 then
          FreeAndNil(menu);
      end;
    end
    else //not opLexerGroups
      for i:= 0 to s.Count-1 do
      begin
        nTag:= integer(s.Objects[i]);
        if SyntaxManager.Analyzers[nTag].Internal then Continue;
        PopupLexers.Items.Add(DoMakeItem(s[i], nTag));
      end;
  finally
    FreeAndNil(s);
  end;
end;

procedure TfmMain.LexListClick(Sender: TObject);
var
  n, n1, n2: integer;
begin
  n:= (Sender as TComponent).Tag;
  if n = -1 then
  begin
    CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer:= nil;
    UpdateLexerTo(nil);
  end
  else
  begin
    n1:= CurrentFrame.EditorMaster.TopLine;
    n2:= CurrentFrame.EditorSlave.TopLine;

    CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.Analyzers[n];
    UpdateLexerTo(CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer);

    CurrentFrame.EditorMaster.TopLine:= n1;
    CurrentFrame.EditorSlave.TopLine:= n2;
  end;
end;

procedure TfmMain.acSaveExecute(Sender: TObject);
begin
  if CurrentFrame <> nil then
    SaveFrame(CurrentFrame, False);
end;

procedure TfmMain.acSaveAsExecute(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F<>nil then
  begin
    if F.IsFtp then
      if not MsgConfirmFtp then
        Exit
      else
        F.FreeFtpInfo;

    //add to MRU old name
    if F.FileName<>'' then
      SynMruFiles.AddItem(F.FileName);
    //save-as
    SaveFrame(F, True);
  end;
end;

procedure TfmMain.MRUClick(Sender: TObject; const S: WideString);
begin
  if IsFileExist(S) then
    DoOpenFile(S)
  else
  begin
    MsgNoFile(S);
    SynMruFiles.DeleteItem(S);
  end;
end;

procedure TfmMain.MRU_SessClick(Sender: TObject; const S: WideString);
begin
  if IsFileExist(S) then
  begin
    if not DoConfirmSaveSession(true) then
      Exit;
    DoOpenSession(S);
  end
  else
  begin
    MsgNoFile(S);
    SynMruSessions.DeleteItem(S);
  end;
end;

procedure TfmMain.PopupLexersPopup(Sender: TObject);
begin
  UpdateLexList;
end;

procedure TfmMain.acSetupExecute(Sender: TObject);
begin
  DoOptionsDialog(-1);
end;

procedure TfmMain.DoOptionsDialog(tabId: Integer);
var
  i: Integer;
  L: TTntStringList;
begin
  UpdateMacroKeynames;
  opTabOptionsIndex:= tabId;

  with TfmSetup.Create(Self) do
    try
      fmMain:= Self;
      //center on screen
      Left:= Self.Monitor.Left + (Self.Monitor.Width - Width) div 2;
      Top:= Self.Monitor.Top + (Self.Monitor.Height - Height) div 2;

      //disable some items
      {$ifndef SPELL}
      boxSpellOpt.Visible:= false;
      boxSpellLnk.Visible:= false;
      {$endif}
      cbSavePos.Enabled:= SynExe;
      cbASaveFocus.Enabled:= SynExe;
      cbSessSave.Enabled:= SynExe;
      cbSessLoad.Enabled:= SynExe;
      cbInst.Enabled:= SynExe;
      cbFullTitle.Enabled:= SynExe;

      cbTheme.Items.Clear;
      for i:= Low(cThemes) to High(cThemes) do
        cbTheme.Items.Add(cThemes[i]);

      L:= TTntStringList.Create;
      try
        FFindToList(L, SynSkinsDir, '*.skn', '',
          false{SubDirs}, false, false, false);
        for i:= 0 to L.Count-1 do
          cbTheme.Items.Add('*'+ ChangeFileExt(ExtractFileName(L[i]), ''));
      finally
        FreeAndNil(L);
      end;

      ShowModal;
    finally
      Release;
    end;

  if (not SynExe) and (hLister <> 0) then
    BringWindowToTop(hLister);
  if (not QuickView) then
    FocusEditor;

  //apply lang here
  LangManager.LanguageID:= opLang;
  UpdateLang;

  UpdateShortcuts;
  SyntaxManagerChange(Self);
end;

function TfmMain.DoCloseAllTabs: boolean;
begin
  Result:= Groups.CloseTabs(tabCloseAll, false);
  UpdateListTabs;
end;

function TfmMain.DoCloseOtherTabs(AAllGroups, AForPopupMenu: boolean): boolean;
var
  Id: TATTabCloseId;
begin
  if AAllGroups then
    Id:= tabCloseOthersAllPages
  else
    Id:= tabCloseOthersThisPage;
  Result:= Groups.CloseTabs(Id, AForPopupMenu);
  UpdateListTabs;
end;


procedure TfmMain.TimerTickTimer(Sender: TObject);
begin
  //tree update
  if GetCurrentThreadId = MainThreadID then
    CheckSynchronize;

  //update icons
  UpdateSaveIco;
  UpdateBusyIco;

  if StatusItemTabsize.ImageIndex>=0 then
    UpdateStatusbarTabsize;

  if FUpdatePluginsLang then
  begin
    FUpdatePluginsLang:= false;
    DoRefreshPluginsLang;
  end;

  //repaints
  if FNeedRepaint then
  begin
    FNeedRepaint:= false;

    {$ifndef FixRepaint}
    FixDraw(plOut, true);
    FixDraw(plTree, false);
    FixDraw(plClip, false);
    {$endif}

    //Repaint TBs
    tbMenu.Invalidate;
    tbView.Invalidate;
    tbQS.Invalidate;
    edQs.Invalidate;
    Status.Invalidate;

    //Repaint editor
    if CurrentEditor<>nil then
      FixDraw(CurrentEditor, true);
  end;

  if CurrentFrame<>nil then
    CurrentFrame.DoChangeTick;
end;

procedure TfmMain.acExportRTFBeforeExecute(Sender: TObject);
begin
  if CurrentEditor.HaveSelection then
    acExportRTF.ExportType:= etSelection
  else
    acExportRTF.ExportType:= etAllText;

  UpadateFilenameForExport;
end;

procedure TfmMain.ecReadOnlyExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if DoPyEvent(Ed, cSynEventOnState, [cSynPropRO]) = cPyFalse then Exit;
  Ed.ReadOnly:= not Ed.ReadOnly;

  UpdateStatusbar;
  UpdateEditorCaret(Ed);
  UpdateTitle(CurrentFrame);
end;

//fix for missing EC's cursor hiding
procedure TfmMain.UpdateEditorCaret(Ed: TSyntaxMemo);
begin
  if QuickView then Exit;
  if not Ed.ReadOnly then Exit;
  with TEdit.Create(Ed) do
  try
    Parent:= Ed;
    Left:= 0;
    Top:= 0;
    if Self.Enabled and CanFocus then
      SetFocus;
  finally
    Free;
  end;
  FocusEditor;
end;

procedure TfmMain.UpdateGutter(F: TEditorFrame; AUpdateCur: boolean = true);
var
  NBandNums: integer;
begin
  NBandNums:= F.EditorMaster.LineNumbers.Band;

  if F.EditorMaster.DisableFolding then
  begin
    F.EditorMaster.Gutter.Bands[cBandFolding].Width:= 0;
    F.EditorSlave.Gutter.Bands[cBandFolding].Width:= 0;
  end
  else
  begin
    F.EditorMaster.Gutter.Bands[cBandFolding].Width:= 15;
    F.EditorSlave.Gutter.Bands[cBandFolding].Width:= 15;
  end;

  if F.EditorMaster.LineNumbers.Visible then
  begin
    //none
  end
  else
  begin
    F.EditorMaster.Gutter.Bands[NBandNums].Width:= 0;
    F.EditorSlave.Gutter.Bands[NBandNums].Width:= 0;
  end;

  if AUpdateCur then
    UpdateEditorCaret(F.EditorMaster);
end;

procedure TfmMain.ButtonOnSelect(Sender: TTBCustomItem; Viewer: TTBItemViewer; Selecting: Boolean);
begin
  if Sender is TSpTbxItem then
    DoHint((Sender as TSpTbxitem).Hint)
  else
    DoHint(Sender.Hint);
end;

procedure TfmMain.SynScroll(Sender: TObject);
var
  Ed: TSyntaxMemo;
  N: integer;
begin
  Ed:= Sender as TSyntaxMemo;

  //Send info to Lister
  if not SynExe then
    with Ed do
    begin
      if Lines.Count = 0 then
        N:= 0
      else
        N:= (TopLine * 100) div Lines.Count;
      PostMessage(hLister, WM_COMMAND, MAKELONG(N, itm_percent), Handle);
    end;

  //sync scroll views
  if not FSyncBusy then
  try
    FSyncBusy:= true;
    DoSyncScroll(Ed);
  finally
    FSyncBusy:= false;
  end;

  //update map
  if Ed.Lines.Count<=cMaxLinesInstantMinimap then
    SyncMapPos
  else
  begin
    TimerMinimap.Enabled:= false;
    TimerMinimap.Enabled:= true;
  end;
end;

procedure TfmMain.plTreeResize(Sender: TObject);
begin
  {$ifndef FixRepaint}
  plTree.Invalidate;
  tbTabsLeft.Invalidate;
  {$endif}
  DoResizePlugins;
  tbViewMove(Self);
end;

procedure TfmMain.FinderInit(Sender: TObject);
begin
  Finder.Control:= CurrentEditor;
  DoHint('');
end;

procedure TfmMain.FinderFail(Sender: TObject);
begin
  DoProgressHide;
  DoHint(WideFormat(DKLangConstW('MNFound2'), [Finder.FindText]));
  MsgBeep;
end;

function TfmMain.SynBorderStyle: TBorderStyle;
begin
  {if opShowBorders then
    Result:= bsSingle
  else}
    Result:= bsNone;
end;

function TfmMain.SynBorderStyleEditor: TBorderStyle;
begin
  Result:= bsNone;
end;

procedure TfmMain.ApplyBorders;
begin
  Tree.BorderStyle:= SynBorderStyle;
  ListTabs.BorderStyle:= SynBorderStyle;
  ListOut.BorderStyle:= SynBorderStyle;
  ListVal.BorderStyle:= SynBorderStyle;
  ListPLog.BorderStyle:= SynBorderStyle;
  TreeFind.BorderStyle:= SynBorderStyle;
  MemoConsole.BorderStyle:= SynBorderStyle;
end;

procedure TfmMain.FormShow(Sender: TObject);
begin
  FixSplitters;
  ApplyDefaultFonts;

  {
  //TabAutoFit:= true setting gives exception in SpTBX, sometimes...
  tbTabsLeft.TabAutofit:= true;
  tbTabsRight.TabAutofit:= true;
  tbTabsOut.TabAutofit:= true;
  tbTabsLeft.TabAutofitMaxSize:= 150;
  tbTabsRight.TabAutofitMaxSize:= 150;
  tbTabsOut.TabAutofitMaxSize:= 150;
  }

  //scale sizes for 150% DPI
  if PixelsPerInch<>96 then
  begin
    Font.Size:= ScaleFontSize(Font.Size, Self);
    with Status do
      Height:= ScaleFontSize(Height, Self);
    with tbTabsOut do
      Height:= ScaleFontSize(Height, Self);
    with tbTabsLeft do
      Height:= ScaleFontSize(Height, Self);
    with tbTabsRight do
      Height:= ScaleFontSize(Height, Self);
  end;

  {$ifndef SPELL}
  TbxItemTbSpellLive.Enabled:= false;
  TBXItemVSpellLive.Enabled:= false;
  TBXItemVSpellCheck.Enabled:= false;
  {$endif}

  if SynExe then
    if ParamStr(1)=cSynParamReg then
    begin
      LoadLexLib;
      TBXItemOShellClick(Self);
      Application.Terminate;
    end;

  if SynExe then
  begin
    SetForegroundWindow(Application.Handle); //For focusing taskbar button
    Application.BringToFront;               //For bringing to front
  end;

  TbxItemORo.Visible:= not SynExe;
  TbxItemOShell.Enabled:= SynExe;
  TBXItemOEditSynPluginsIni.Enabled:= SynExe;
  TbxItemCtxCustomize.Visible:= QuickView;

  //init plugins before LoadIni
  LoadPluginsInfo;

  //init main
  LoadIni; //230 msec
  PropsManager.UpdateAll;
  LoadLexLib; //80 msec
  LoadMacros;
  LoadClip;
  LoadHideIni;
  LoadConsoleHist;
  LoadProjPreview;

  //init proj tree
  ApplyProj;

  //init spell-checker
  InitSpell;
  UpdateSpellLang;

  //update panels
  UpdatePanelOut(FTabOut);
  UpdatePanelRight(FTabRight);
  UpdatePanelLeft(FTabLeft);

  //Py fields
  PyExeDir:= ExcludeTrailingPathDelimiter(SynDir);
  PyIniDir:= ExcludeTrailingPathDelimiter(SynIniDir);

  //init groups
  InitGroups;
end;

procedure TfmMain.LoadLexLib;
var
  fn_std, fn: string;
begin
  fn_std:= SynLexLib;

  with TIniFile.Create(SynIni) do
  try
    fn:= ReadString('Setup', 'LexLib', '');
  finally
    Free
  end;

  if fn='' then
    fn:= fn_std
  else
  if SynIsPortable then
  begin
    //for portable variant we allow only filename w/out path
    if (ExtractFileDir(fn)='') then
      fn:= ExtractFilePath(fn_std) + fn
    else
      fn:= fn_std
  end
  else
  begin
    if (ExtractFileDir(fn)='') then
      fn:= ExtractFilePath(fn_std) + fn
    else
    if not IsFileExist(fn) then
      fn:= fn_std;
  end;

  if IsFileExist(fn) then
    SyntaxManager.LoadFromFile(fn);
end;

procedure TfmMain.FindCurrentWord(ANext: boolean);
var
  NStart, NEnd, NMaxLen: integer;
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;
  with Ed do
  begin
    if SelLength>0 then
    begin
      //search for selection
      NMaxLen:= SynHiddenOption('MaxWordLen', 100);
      Finder.FindText:= EditorGetSelTextLimited(Ed, NMaxLen);
      NStart:= SelStart;
      NEnd:= NStart+SelLength;
    end
    else
    begin
      //search for curr word
      WordRangeAtPos(CaretPos, NStart, NEnd);
      if NEnd > NStart then
        Finder.FindText:= WordAtPos(CaretPos)
      else
        Exit;
    end;

    //set needed flags
    Finder.Flags:= Finder.Flags-[ftRegex];
    Finder.Flags:= Finder.Flags+[ftWrapSearch];

    //make sure FindNext won't try to find regex
    if Assigned(fmSR) then
      fmSR.cbRe.Checked:= false;

    //search
    if ANext then
    begin
      CaretStrPos:= NEnd;

      //repeat selection as caret moving may clear it
      SelStart:= NStart;
      SelLength:= NEnd-NStart;

      Finder.FindNext;
    end
    else
    begin
      CaretStrPos:= NStart;

      //repeat selection
      SelStart:= NStart;
      SelLength:= NEnd-NStart;

      Finder.FindPrev;
    end;
  end;
end;

procedure TfmMain.plTreeVisibleChanged(Sender: TObject);
begin
  FixSplitters;
  ecShowTree.Checked:= plTree.Visible;

  if plTree.Visible then //ZD
    RedrawWindow(plTree.Handle, nil, 0,
      RDW_ERASE or RDW_INVALIDATE or RDW_ALLCHILDREN or RDW_FRAME); //ZD
end;

procedure TfmMain.ecShowTreeExecute(Sender: TObject);
begin
  with plTree do
    Visible:= not Visible;
  if not plTree.Visible then
    FocusEditor;

  {$ifndef FixRepaint}
  DoRepaintTBs;
  {$endif}
end;

const
  cDefColors: array[0..Pred(cTabColors)] of TColor =
    ($0000FF, $007FFF, $00FFFF, $00FF00, $007F00,
     $FFFFFF, $FFFF7F, $FF0000, $FF7F7F, $7F7F7F);

procedure TfmMain.FormCreate(Sender: TObject);
var
  i: integer;
  Cur: HIcon;
begin
  SynExe:= true;
  SynDir:= ExtractFilePath(GetModuleName(HInstance));
  SynDirForHelpFiles:= SynDir + 'Readme';
  SynIsPortable:= IsFileExist(SynDir + 'Portable.ini');
  InitSynIniDir;

  EditorSynLexersCfg:= SynLexersCfg;
  EditorSynLexersExCfg:= SynLexersExCfg;

  SynMruFiles:= TSynMruList.Create;
  SynMruSessions:= TSynMruList.Create;
  SynMruProjects:= TSynMruList.Create;
  SynMruNewdoc:= TSynMruList.Create;

  //make panels font non-bold
  plTree.Options.RightAlignSpacer.FontSettings.Style:= [];
  plClip.Options.RightAlignSpacer.FontSettings.Style:= [];
  plOut.Options.RightAlignSpacer.FontSettings.Style:= [];

  InitMenuItemsList;
  LangManager.ScanForLangFiles(SynDir + 'Lang', '*.lng', False);
  ecOnSavingLexer:= DoSaveStyles;

  OD_Swatch.DefaultExt:= cSynColorSwatchExt;
  OD_Swatch.Filter:= Format('*.%s|*.%s', [cSynColorSwatchExt, cSynColorSwatchExt]);
  SD_Swatch.DefaultExt:= cSynColorSwatchExt;
  SD_Swatch.Filter:= OD_Swatch.Filter;
  SD_Snippets.DefaultExt:= cSynSnippetExt;
  SD_Snippets.Filter:= Format('*.%s|*.%s', [cSynSnippetExt, cSynSnippetExt]);
  OD_Session.DefaultExt:= cSynSessionExt;
  OD_Session.Filter:= 'Sessions|*.'+cSynSessionExt+';*.syn';
  SD_Session.DefaultExt:= cSynSessionExt;
  SD_Session.Filter:= 'Sessions|*.'+cSynSessionExt;

  ListOut.Align:= alClient;
  ListVal.Align:= alClient;
  TreeFind.Align:= alClient;
  Tree.Align:= alClient;
  ListPLog.Align:= alClient;
  ListTabs.Align:= alClient;
  plConsole.Align:= alClient;

  //init colors
  Move(cDefColors, opTabColors, SizeOf(opTabColors));

  //init plugins
  FillChar(FPluginsPanel, Sizeof(FPluginsPanel), 0);
  FillChar(FPluginsFindid, Sizeof(FPluginsFindid), 0);
  FillChar(FPluginsCommand, Sizeof(FPluginsCommand), 0);
  FillChar(FPluginsAcp, Sizeof(FPluginsAcp), 0);

  FInitialDir:= 'C:\'; //used on file closing
  FLastCmdId:= 0;
  FLastCmdData:= '';
  FLastCmdCount:= 0;
  FLastCmdPlaying:= false;
  FLastCmdBreak:= false;
  FLastMacro:= -1;

  FPanelDrawBusy:= false;
  FSyncBusy:= false;
  FListNewDocs:= TTntStringList.Create;
  FListConv:= TTntStringList.Create;
  FListFiles:= TTntStringList.Create;
  FListLexersSorted:= TTntStringList.Create;
  FListSnippets:= nil;

  FTabOut:= tbOut;
  FTabRight:= tbClip;
  FTabLeft:= tbTree;

  fmNumConv:= nil;
  fmClip:= nil;
  fmClips:= nil;
  fmMap:= nil;
  fmProj:= nil;
  fmProgress:= nil;
  fmSR:= nil;
  FProjPreview:= nil;
  FProjPreviewEditor:= nil;
  FProjPreviewFilename:= '';

  for i:= Low(TabSwitchers) to High(TabSwitchers) do
  begin
    TabSwitchers[i]:= TTabSwitcher.Create(i);
    TabSwitchers[i].OnGetTab:= GetTabName;
  end;

  opAcpForceText:= false;
  FFullScr:= false;
  FOnTop:= false;
  FLockUpdate:= false;
  FToolbarMoved:= false;
  FNeedRepaint:= true;
  FEnableRepaint:= false;
  FUpdatePluginsLang:= false;

  //ACP
  FAcpList_Display:= TStringList.Create;
  FAcpList_Items:= TStringList.Create;
  FAcpList_Hints:= TStringList.Create;
  FAcpList_Desc:= TStringList.Create;
  FAcpIntHtml:= TStringList.Create;
  FAcpIntCss:= TStringList.Create;

  //finder
  FinderPro:= nil;
  FinderInTree:= nil;
  FinderInList:= nil;
  Finder:= TSynFinderReplacer.Create(Self);
  Finder.OnBeforeExecute:= FinderInit;
  Finder.OnNotFound:= FinderFail;
  Finder.SkipInit:= False;
  Finder.OnProgress:= FinderProgress;

  //clear actions hints (Sepa's code)
  with ActionList do
    for i:= 0 to ActionCount-1 do
       (Actions[i] as TCustomAction).ShortCut:= 0;

  //new cursor for editor's gutter
  Cur:= LoadCursor(HInstance, 'GCURSOR');
  if Cur>0 then
    Screen.Cursors[1]:= Cur;

  //others
  FUserToolbarCommands:= TTntStringList.Create;
  FTempFilenames:= TTntStringList.Create;
end;

procedure TfmMain.ecPrinterSetupExecute(Sender: TObject);
begin
  PrinterSetupDialog.Execute;
end;

procedure TfmMain.SetFormat(Sender: TObject);
begin
  SetLineEnds(Sender, true);
end;

procedure TfmMain.SetLineEnds(Sender: TObject; AManual: boolean);
var
  tf: TTextFormat;
begin
  tf:= TTextFormat((Sender as TComponent).Tag);
  if CurrentFrame <> nil then
    with CurrentFrame do
      if tf <> EditorMaster.TextSource.Lines.TextFormat then
      begin
        EditorMaster.TextSource.Lines.TextFormat:= tf;
        if AManual then
        begin
          Modified:= true;
          LineEndsChg:= true;
        end;
        UpdateStatusbarLineEnds;
      end;
end;

procedure TfmMain.UpdateStatusbarLineEnds;
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F<>nil then
    case F.EditorMaster.TextSource.Lines.TextFormat of
      tfCR: StatusItemEnds.Caption:= 'Mac';
      tfNL: StatusItemEnds.Caption:= 'Unix';
      else StatusItemEnds.Caption:= 'Win';
    end;
end;

procedure TfmMain.UpdateStatusbarTabsize;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Ed<>nil then
  begin
    if Ed.IsTabstopMode then
    begin
      StatusItemTabsize.ImageIndex:= 12;
      StatusItemTabsize.Caption:= '';
    end
    else
    begin
      StatusItemTabsize.ImageIndex:= -1;
      StatusItemTabsize.Caption:=
        IntToStr(EditorTabSize(Ed)) +
        IfThen(Ed.TabMode=tmSpaces, '_');
    end;
  end;
end;

function TfmMain.GetAcpFN(const LexerName: string): string;
begin
  Result:= LexerName;
  SReplaceAll(Result, '/', '_'); //for 'PL/SQL'
  SDeleteFrom(Result, ' ('); //for 'Ada (.ads)', 'PHP (dev)'
  Result:= SynDir + 'HL\' + Result + '.acp';
end;

function TfmMain.GetSpecialHiliteFN(const Id: string): string;
begin
  Result:= SynDir + 'HL\' + Id + '.ini';
end;

function TfmMain.GetHtmlListFN: string;
begin
  Result:= GetSpecialHiliteFN('Html_List');
end;

function TfmMain.GetCssListFN: string;
begin
  Result:= GetSpecialHiliteFN('Css_List');
end;

function TfmMain.GetHtmlTabbingFN: string;
begin
  Result:= GetSpecialHiliteFN('Html_Tabbing');
end;

procedure TfmMain.LoadHtmlAndCssLists;
var
  fn: string;
begin
  if FAcpIntHtml.Count=0 then
  begin
    fn:= GetHtmlListFN;
    if IsFileExist(fn) then
      FAcpIntHtml.LoadFromFile(fn);
  end;

  if FAcpIntCss.Count=0 then
  begin
    fn:= GetCssListFN;
    if IsFileExist(fn) then
      FAcpIntCss.LoadFromFile(fn);
  end;
end;

procedure TfmMain.UpdateAcp(const Lexer: string);
var
  fn: Widestring;
begin
  FAcpLexer:= Lexer;
  FAcpAgain:= false;

  if not Assigned(FAcpList_Display) then Exit;
  FAcpList_Display.Clear;
  FAcpList_Items.Clear;
  FAcpList_Hints.Clear;
  FAcpList_Desc.Clear;

  if Lexer='' then Exit;

  //load default ACP file
  fn:= GetAcpFN(Lexer);
  if IsFileExist(fn) then
  begin
    opAcpChars:= '';
    LoadAcpFromFile(fn, Lexer);
  end;

  //load user ACP file (specified in project)
  if Assigned(fmProj) then
  begin
    fn:= fmProj.GetUserVarValue('AC['+Lexer+']');
    if fn<>'' then
    begin
      if ExtractFilePath(fn)='' then
        fn:= ExtractFilePath(fmProj.ProjectFN)+fn;
      if IsFileExist(fn) then
        LoadAcpFromFile(fn, Lexer);
    end;
  end;
end;


procedure TfmMain.LoadAcpFromFile(const fn, Lexer: string);
  //
  function AcpItem(const s1, s2, s3, s4: string): string;
  begin
    Result:= '\s1\' + s1 + '\t\\s2\' + s2 + '\t\\s0\' + s3 + '\s3\ '+ s4;
  end;
  //
var
  List: TStringList;
  s, SType, SId, SPar, SHint: string;
  i: Integer;
  IsPas, IsBracketSep: boolean;
begin
  IsPas:= IsLexerPas(Lexer);
  IsBracketSep:= true;

  List:= TStringList.Create;
  try
    List.LoadFromFile(fn);
    for i:= 0 to List.Count-1 do
    begin
      s:= List[i];
      if s='' then
        Continue;
      if s[1]='#' then
      begin
        SParseString_AcpControlLine(s, opAcpChars, IsBracketSep);
        Continue;
      end;
      SParseString_AcpStd(s, IsBracketSep, SType, SId, SPar, SHint);
      if SId<>'' then
      begin
        FAcpList_Items.Add(SId + IfThen(Pos('(', SPar)=1, '('));
        FAcpList_Display.Add(AcpItem(SType, SId, SPar, ''{SHint}));
        FAcpList_Desc.Add(SHint);

        if IsPas and (Pos('):', SPar)>0) then
        begin
          SDeleteFrom(SPar, '):');
          SPar:= SPar+')';
        end;
        FAcpList_Hints.Add(SPar);
      end;
    end;
  finally
    FreeAndNil(List);
  end;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  FreeAndNil(SynMruFiles);
  FreeAndNil(SynMruSessions);
  FreeAndNil(SynMruProjects);
  FreeAndNil(SynMruNewdoc);

  DoDeleteTempFiles;
  FreeAndNil(FTempFilenames);
  FreeAndNil(FUserToolbarCommands);

  for i:= Low(TabSwitchers) to High(TabSwitchers) do
    FreeAndNil(TabSwitchers[i]);

  FreeAndNil(FAcpList_Display);
  FreeAndNil(FAcpList_Items);
  FreeAndNil(FAcpList_Hints);
  FreeAndNil(FAcpList_Desc);
  FreeAndNil(FAcpIntHtml);
  FreeAndNil(FAcpIntCss);

  FreeAndNil(Finder);
  FreeAndNil(FListFiles);
  FreeAndNil(FListNewDocs);
  FreeAndNil(FListConv);
  FreeAndNil(FListLexersSorted);

  if Assigned(FListSnippets) then
  begin
    ClearSnippets;
    FreeAndNil(FListSnippets);
  end;
end;

function SAcpItemToId(const S: Widestring): Widestring;
begin
  Result:= S;
  //strip last "(" from id
  if (Result<>'') and (Result[Length(Result)]='(') then
    SetLength(Result, Length(Result)-1);
end;

procedure TfmMain.ParamCompletionGetParams(Sender: TObject;
  const FuncName: WideString; Pos: Integer);
var
  SText, S: Widestring;
  i: integer;
begin
  ParamCompletion.Items.Clear;

  SText:= DoAcpFromPlugins(cActionGetFunctionHint);
  if SText<>'' then
  begin
    ParamCompletion.Items.SetText(PWChar(SText));
  end
  else
  begin
    SText:= LowerCase(FuncName);
    for i:= 0 to FAcpList_Items.Count-1 do
    begin
      S:= LowerCase(FAcpList_Items[i]);
      S:= SAcpItemToId(S);
      if SText=S then
        if FAcpList_Hints[i]<>'' then
          ParamCompletion.Items.Add(FAcpList_Hints[i]);
    end;
  end;
end;

procedure TfmMain.SynGetTokenHint(Sender: TObject; TokenIndex: Integer; var HintText: String);
var
  Ed: TSyntaxMemo;
  Frame: TEditorFrame;
  s, sFilename, sResult: ecString;
  NColor1, NColor2: TColor;
  i, n: integer;
begin
  if not opTipsToken then
    begin HintText:= ''; Exit end;

  Ed:= Sender as TSyntaxMemo;
  Frame:= FrameOfEditor(Ed);
  sFileName:= Frame.FileName;

  //no lexer active
  if Ed.SyntObj=nil then
    begin HintText:= ''; Exit end;

  s:= EditorTokenString(Ed, TokenIndex);

  if IsImageHint(s, sFileName, sResult) then
  begin
    HintText:= sResult;
    DoHint(sResult);
    Exit
  end;

  if IsShowColor(s, NColor1, NColor2) then
  begin
    HintText:= cColorPrefix + IntToStr(NColor1) + IfThen(NColor2<>clNone, ','+IntToStr(NColor2));
    Exit
  end;

  {
  //test mouse over editor
  if not PtInRect(Ed.BoundsRect, Ed.Parent.ScreenToClient(Mouse.CursorPos)) then
  begin
    HintText:= '';
    Exit;
  end;
  }

  try
    s:= EditorTokenFullString(Ed, TokenIndex, Pos('.', opAcpChars)>0);

    //show for strings their ACP hint/description
    n:= -1;
    for i:= 0 to FAcpList_Items.Count-1 do
      if SAcpItemToId(FAcpList_Items[i]) = s then
        begin n:= i; Break; end;

    if n>=0 then
      if FAcpList_Hints[n]<>'' then
        HintText:= Trim(
          '\s4\'+SAcpItemToId(FAcpList_Items[n])+' '+
          '\s5\'+FAcpList_Hints[n]+sLineBreak+
          '\s6\'+FAcpList_Desc[n]);
  except
    on E: Exception do
    begin
      HintText:= '';
      DoHint('Exception on reading hint: '+E.Message);
    end;
  end;
end;

procedure TfmMain.ecACPAfterComplete(Sender: TObject;
  const Item: WideString);
var
  Ed: TSyntaxMemo;
  QuoteChar: WideChar;
begin
  Ed:= CurrentEditor;

  //close tag
  if FAcpHtmClosing then
    Ed.InsertText('>')
  else
  //handle Ctrl+Enter pressing in ACP list
  if FAcpHtmTags and IsCtrlPressed then
    with Ed do
      if (CaretStrPos>0) and (Lines.Chars[CaretStrPos]=' ') then
      begin
        CaretStrPos:= CaretStrPos-1;
        DeleteText(1);
        InsertText('>');
        FAcpAgain:= false;
      end;

  //add quote char after parameter value
  if FAcpHtm and not FAcpHtmTags then
  begin
    if EditorCaretAfterUnclosedQuote(Ed, QuoteChar) then
      Ed.InsertText(QuoteChar);
  end;

  //if CSS completion done, delete ":" after caret
  //(it may left from old text, and we inserted ":" anyway)
  if FAcpCss then
    with Ed do
    begin
      if (Lines.Chars[CaretStrPos+1]=':') then
        DeleteText(1);
    end;

  if FAcpAgain then
    DoAcpPopup //show ACP again
  else
    DoFuncHintPopup; //show func hint
end;

function _IsWordChar_Css(ch: WideChar): boolean;
begin
  Result:= ecStrUtils.IsWordChar(ch) or (Pos(ch, '-.') > 0);
end;

procedure TfmMain.DoAcpCss(List, Display: ecUnicode.TWideStrings);
var
  SProp: string;
  AcpStr, Str: Widestring;
  i: Integer;
begin
  if FAcpIntCss.Count=0 then
    begin MsgBeep; Exit end;

  opAcpChars:= cAcpCharsCss;
  FAcpCss:= true;

  //is there any css property before caret and before ":"?
  EditorGetCssTag(CurrentEditor, SProp);
  //show popup again not always
  FAcpAgain:= SProp='';

  //css property found,
  //return all values of property
  if SProp<>'' then
  begin
    AcpStr:= FAcpIntCss.Values[SProp];
    if AcpStr<>'' then
    repeat
      Str:= SGetItem(AcpStr, ',');
      if Str='' then Break;
      List.Add(Str);
      Display.Add(SAcpItem(SProp+' value', Str)); //show prop name in purple column
    until false;
  end
  //css property not found,
  //return all properties
  else
  begin
    for i:= 0 to FAcpIntCss.Count-1 do
    begin
      Str:= FAcpIntCss.Names[i];
      if Str<>'' then
      begin
        List.Add(Str+': ');
        Display.Add(SAcpItem('css', Str));
      end;
    end;
  end;
end;

procedure TfmMain.DoAcpHtm(List, Display: ecUnicode.TWideStrings);
var
  STag, SAtr: string;
begin
  if FAcpIntHtml.Count=0 then
    begin MsgBeep; Exit end;

  //get current HTML tag and attrib
  EditorGetHtmlTag(CurrentEditor, STag, SAtr);

  //are we inside CSS part style="...."?
  if SAtr='style' then
    DoAcpCss(List, Display)
  else
    DoAcpHtmForTag(STag, SAtr, List, Display);
end;

procedure TfmMain.DoAcpHtmForTag(const STag, SAtr: string;
  List, Display: ecUnicode.TWideStrings);
var
  AcpStr, str: string;
  AtrList: TStringList;
  NTag, j: integer;
  AddBr: boolean;
begin
  FAcpHtm:= true;
  opAcpChars:= cAcpCharsHtm;
  AddBr:= EditorNeedsHtmlOpeningBracket(CurrentEditor);
  AcpStr:= '';

  if STag<>'' then
  begin
    NTag:= FAcpIntHtml.IndexOfName(STag);
    if NTag>=0 then
      AcpStr:= FAcpIntHtml[NTag];

    if AcpStr<>'' then
    begin
      AtrList:= TStringList.Create;
      try
        SParseString_AcpHtml(AcpStr, SAtr, AtrList);
        if SAtr='' then
        //-----------
        //return list of all attribs of tag
        begin
          for j:= 0 to AtrList.Count-1 do
          begin
            str:= AtrList[j];
            List.Add(str+'="'); //with HTML quote
            Display.Add(SAcpItem('attrib', str));
          end;
          FAcpAgain:= true;
          Exit;
        end
        else
        //-----------
        //return list of values of attrib
        begin
          for j:= 0 to AtrList.Count-1 do
          begin
            str:= AtrList[j];
            List.Add(str);
            Display.Add(SAcpItem('value', str));
          end;
          FAcpAgain:= false;
          Exit;
        end;
      finally
        FreeAndNil(AtrList);
      end;
    end; //if AcpStr<>''
  end //if STag<>''
  else
  //------------------
  //return list of tags
  begin
    //is it closing tag?
    FAcpHtmClosing:= false;
    with CurrentEditor do
      if TextLength>0 then
      begin
        j:= CaretStrPos;
        while IsWordChar(Lines.Chars[j]) do Dec(j);
        FAcpHtmClosing:= Lines.Chars[j]='/';
      end;

    if FAcpHtmClosing then
    begin
      //return list of closing tags
      for j:= 0 to FAcpIntHtml.Count-1 do
      begin
        str:= FAcpIntHtml.Names[j];
        if str<>'' then
        begin
          List.Add(str);
          Display.Add(SAcpItem('tag', '</'+str+'>'));
        end;
      end;
      FAcpAgain:= false;
      FAcpHtmTags:= true;
    end
    else
    begin
      //return list of opening tags
      for j:= 0 to FAcpIntHtml.Count-1 do
      begin
        str:= FAcpIntHtml.Names[j];
        if str<>'' then
        begin
          List.Add(IfThen(AddBr, '<') + str + ' ');
          Display.Add(SAcpItem('tag', '<'+str+'>'));
        end;
      end;
      FAcpAgain:= true;
      FAcpHtmTags:= true;
    end;
  end;
end;

procedure TfmMain.ecACPGetAutoCompleteList(Sender: TObject; PosX: TPoint;
  List, Display: ecUnicode.TWideStrings);
var
  Lexer: string;
begin
  List.Clear;
  Display.Clear;

  FAcpCss:= false;
  FAcpHtm:= false;
  FAcpHtmTags:= false;
  FAcpHtmClosing:= false;
  Lexer:= CurrentLexer;

  if opAcpForceText then
  begin
    DoAcpFromFile(List, Display);
    Exit
  end;

  if (opAcpHtm and IsLexerHTML(Lexer)) or
     (opAcpCss and IsLexerCSS(Lexer, false)) then
    begin
      LoadHtmlAndCssLists;
      if IsLexerCSS(Lexer) then
        DoAcpCss(List, Display)
      else
        DoAcpHtm(List, Display);
      DoAcpFromFile(List, Display);
      Exit
    end;

  ParamCompletion.CloseUp(False); //or Stack overflow

  if FAcpList_Items.Count>0 then
  begin
    List.Assign(FAcpList_Items);
    Display.Assign(FAcpList_Display);
    FAcpAgain:= false;
  end;

  //get words from file
  DoAcpFromFile(List, Display);
end;

procedure TfmMain.ecACPCheckChar(Sender: TObject; C: Word;
  var IsWord: Boolean);
begin
  IsWord:= IsWord or
    (Pos(Chr(c), '_' + opAcpChars) > 0);
end;

procedure TfmMain.PopupEditorPopup(Sender: TObject);
var
  Ed: TSyntaxMemo;
  s: Widestring;
begin
  Ed:= CurrentEditor;
  if Ed.TextLength=0 then
  begin
    TBXItemCtxCopyUrl.Enabled:= false;
    TBXItemCtxOpenSel.Enabled:= false;
    TBXItemCtxAddColor.Enabled:= false;
    TBXItemCtxFindID.Enabled:= false;
    TBXItemCtxCopyAppend.Enabled:= false;
    TBXItemCtxCutAppend.Enabled:= false;
    TBXItemCtxCopyHTML.Enabled:= false;
    TBXItemCtxCopyRTF.Enabled:= false;
    Exit;
  end;

  //update all
  TBXItemCtxCopyAppend.Enabled:= Ed.HaveSelection;
  TBXItemCtxCutAppend.Enabled:= Ed.HaveSelection;
  TBXItemCtxCopyHTML.Enabled:= Ed.HaveSelection;
  TBXItemCtxCopyRTF.Enabled:= Ed.HaveSelection;
  TBXItemCtxPaste.Enabled:= Clipboard.HasFormat(cf_text);
  TBXItemCtxFindID.Enabled:= (CurrentFrame.FileName<>'') and IsLexerFindID(CurrentLexer);

  //update "Copy URL"
  {
  //old code (caret pos wasn't corrected for RClick)
  p:= Ed.ScreenToClient(Mouse.CursorPos);
  p:= Ed.MouseToCaret(p.x, p.y);
  p:= CurrentFrame.HyperlinkHighlighter.HltRangeBndAt(Ed.CaretPosToStrPos(p));
  }
  FPopupUrl:= CurrentFrame.SUrlAt(Ed.CaretPos);
  TBXItemCtxCopyUrl.Enabled:= FPopupUrl<>'';

  //update "Add to recent colors"
  TbxItemCtxAddColor.Enabled:= UpdateCurrentColorCode(FPopupColor);

  //update "Open selection"
  s:= EditorSelectionForGotoCommand(Ed);
  TbxItemCtxOpenSel.Caption:= WideFormat(DKLangConstW('opf'), [s]);
  TbxItemCtxOpenSel.Enabled:= s<>'';

  //update External Tools items
  UpdateTools;
end;

procedure TfmMain.TBXItemCtxCopyUrlClick(Sender: TObject);
begin
  Clipboard.AsText:= FPopupUrl;
end;

(*
function TfmMain.EscapedAcpChars: string;
const
  Ch = '.#()[]{}<>^$*+-?|:';
var
  i:Integer;
begin
  Result:= '\w';
  for i:= 1 to Length(opAcpChars) do
    if Pos(opAcpChars[i], Ch)>0 then
      Result:= Result + '\' + opAcpChars[i]
    else
      Result:= Result + opAcpChars[i];
end;
*)

procedure TfmMain.SyntaxManagerChange(Sender: TObject);
var
  en: boolean;
  Lexer: string;
  ATabStop, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
  AOptWordChars, AKeepBlanks, AAutoCase, AIndent: string;
begin
  UpdateTools;
  acSetupLexHL.Enabled:= SyntaxManager.CurrentLexer<>nil;
  Lexer:= '';
  opWordChars:= '';

  if SyntaxManager.CurrentLexer<>nil then
  begin
    Lexer:= SyntaxManager.CurrentLexer.LexerName;

    //some overrides for few lexers
    if IsLexerCSS(Lexer) then
    begin
      opAcpChars:= cAcpCharsCss;
      opWordChars:= cAcpCharsCss;
    end
    else
    if IsLexerHTML(Lexer) then
    begin
      opAcpChars:= cAcpCharsHtm;
      opWordChars:= cAcpCharsHtm;
    end
    else
    if IsLexerPHP(Lexer) then
    begin
      opAcpChars:= cAcpCharsPhp;
      opWordChars:= cAcpCharsPhp;
    end;

    //load external ACP file
    UpdateAcp(Lexer);
  end
  else
  begin
    UpdateAcp('');
    opAcpChars:= '.'; //default ACP chars for curr-file
  end;

  //update status hint
  en:= SyntaxManager.AnalyzerCount > 0;
  TbxSubmenuItemLexer.Enabled:= en;
  StatusItemLexer.Enabled:= en;

  if not en then
  begin
    StatusItemLexer.Caption:= DKLangConstW('nlex');
  end
  else
  begin
    if CurrentFrame<>nil then
      StatusItemLexer.Caption:= CurrentFrame.CurrentLexer;
    if StatusItemLexer.Caption='' then
      StatusItemLexer.Caption:= DKLangConstW('None');
  end;

  //Update ACP regex
  //(special for HTML, auto for others)
  if IsLexerHTML(Lexer) then
    ecACP.StartExpr:= '\<'
  else
    ecACP.StartExpr:= '';

  //here we override editor options:
  //a) overrides for "Lexers overrides" option
  //b) need to reduce LineSpacing for NFO files
  //c) need to set TabMode=tabs for Make files

  if CurrentFrame<>nil then
    with CurrentFrame do
    begin
      EditorMaster.TabList.AsString:= TemplateEditor.TabList.AsString;
      EditorSlave.TabList.AsString:= TemplateEditor.TabList.AsString;

      EditorMaster.TabMode:= TemplateEditor.TabMode;
      EditorSlave.TabMode:= TemplateEditor.TabMode;

      EditorMaster.LineSpacing:= TemplateEditor.LineSpacing;
      EditorSlave.LineSpacing:= TemplateEditor.LineSpacing;

      //optional overrides
      if SGetLexerOverride(opLexersOverride, Lexer,
        ATabStop, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
        AOptWordChars, AKeepBlanks, AAutoCase, AIndent) then
      begin
        //1) override TabStops
        EditorMaster.TabList.AsString:= ATabStop;
        EditorSlave.TabList.AsString:= EditorMaster.TabList.AsString;

        //2) override TabMode
        case StrToIntDef(ATabMode, 1) of
          0: EditorMaster.TabMode:= tmSpaces;
          1: EditorMaster.TabMode:= tmTabChar;
          2: EditorMaster.TabMode:= tmSmartTab;
        end;
        EditorSlave.TabMode:= EditorMaster.TabMode;

        //3) override "word wrap"
        case StrToIntDef(AWrap, 0) of
          0: //as is
            begin end;
          1: //wrap off
            EditorMaster.WordWrap:= false;
          2: //wrap by window edge
            begin
            EditorMaster.WordWrap:= true;
            EditorMaster.Options:= EditorMaster.Options - [soBreakOnRightMargin];
            end;
          3: //wrap by right margin
            begin
            EditorMaster.WordWrap:= true;
            EditorMaster.Options:= EditorMaster.Options + [soBreakOnRightMargin];
            end;
        end;
        EditorSlave.WordWrap:= EditorMaster.WordWrap;
        EditorSlave.Options:= EditorMaster.Options;

        //4) override "Right margin"
        EditorMaster.RightMargin:= StrToIntDef(AMargin, TemplateEditor.RightMargin);
        EditorSlave.RightMargin:= EditorMaster.RightMargin;

        //5) override "Line spacing"
        EditorMaster.LineSpacing:= StrToIntDef(ASpacing, TemplateEditor.LineSpacing);
        EditorSlave.LineSpacing:= EditorMaster.LineSpacing;

        //6) override "Optimal fill"
        case StrToIntDef(AOptFill, 0) of
          1:
          begin
            EditorMaster.Options:= EditorMaster.Options - [soOptimalFill];
            EditorSlave.Options:= EditorSlave.Options - [soOptimalFill];
          end;
          2:
          begin
            EditorMaster.Options:= EditorMaster.Options + [soOptimalFill];
            EditorSlave.Options:= EditorSlave.Options + [soOptimalFill];
          end
        end;

        //7) override "Word chars"
        opWordChars:= AOptWordChars;

        //8) override "Keep trailing blanks"
        case StrToIntDef(AKeepBlanks, 0) of
          1:
          begin
            EditorMaster.Options:= EditorMaster.Options - [soKeepTrailingBlanks];
            EditorSlave.Options:= EditorSlave.Options - [soKeepTrailingBlanks];
          end;
          2:
          begin
            EditorMaster.Options:= EditorMaster.Options + [soKeepTrailingBlanks];
            EditorSlave.Options:= EditorSlave.Options + [soKeepTrailingBlanks];
          end
        end;

        //9) override "Auto-correct case"
        opAutoCase:= AAutoCase='1';

        //10) override "Block indent"
        EditorMaster.BlockIndent:= StrToIntDef(AIndent, TemplateEditor.BlockIndent);
        EditorSlave.BlockIndent:= EditorMaster.BlockIndent;

      end;

      //overrides for "NFO files"
      if IsLexerNFO(Lexer) then
      begin
        EditorMaster.LineSpacing:= 0;
        EditorSlave.LineSpacing:= 0;
      end;

      //overrides for "Make files"
      if IsLexerMake(Lexer) then
      begin
        EditorMaster.TabMode:= tmTabChar;
        EditorSlave.TabMode:= tmTabChar;
      end;
    end;

  //update statusbar
  UpdateStatusbarTabsize;
end;

procedure TfmMain.DoRepaintTBs;
begin
  {$ifndef FixRepaint}
  tbMenu.Invalidate;
  tbFile.Invalidate;
  tbEdit.Invalidate;
  tbView.Invalidate;
  tbQs.Invalidate;
  edQs.Invalidate;

  tbUser1.Invalidate;
  tbUser2.Invalidate;
  tbUser3.Invalidate;

  plTree.Invalidate;
  plOut.Invalidate;
  plClip.Invalidate;

  Tree.Invalidate;
  TreeFind.Invalidate;
  ListOut.Invalidate;
  ListVal.Invalidate;
  ListPLog.Invalidate;
  ListTabs.Invalidate;
  MemoConsole.Invalidate;

  if Assigned(fmProj) then
    fmProj.TreeProj.Invalidate;
  if Assigned(fmClip) then
    fmClip.ListClip.Invalidate;
  if Assigned(fmClips) then
    fmClips.List.Invalidate;

  tbTabsLeft.Invalidate;
  tbTabsOut.Invalidate;
  tbTabsRight.Invalidate;
  {$endif}

  DoPluginsRepaint;
end;

procedure TfmMain.DoRepaintTBs2;
begin
  {$ifndef FixRepaint}
  if Assigned(fmClip) then
    FixDraw(fmClip.ListClip, true);

  if Assigned(fmMap) then
    FixDraw(fmMap.edMap, true);

  FixDraw(Tree);

  if CurrentEditor<>nil then
    FixDraw(CurrentEditor, true);
  {$endif}
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  {$ifndef FixRepaint}
  DoRepaintTBs;
  {$endif}
  SyncMapPos;
end;

procedure TfmMain.ecACPChange(Sender: TObject);
var
  i: integer;
  s: string;
const
  sep: TSysCharSet = ['.',' ',#9,'-'];
begin
  if opAcpUseSingle then
    with ecACP do
      if ListBox.Items.Count=1 then
      begin
        CloseUp(true);
        Exit
      end;

  //update ACP hint
  ecACP.ToolHint.Text:='';
  i:= ecACP.ListBox.ItemIndex;
  if (i>=0) and (i<ecACP.Items.Count) then
  begin
    s:= ecACP.GetListItem(i);
    i:= FAcpList_Items.IndexOf(s);
    if (i>=0) and
      (i<FAcpList_Hints.Count) and
      (i<FAcpList_Desc.Count) then
      ecACP.ToolHint.Text:= Trim(
        '\s4\' + SAcpItemToId(s) + ' ' +
        '\s5\' + WrapText(FAcpList_Hints[i], sLineBreak+'\s5\', sep, 70) + sLineBreak +
        '\s6\' + WrapText(FAcpList_Desc[i], sLineBreak+'\s6\', sep, 65));
  end;
end;

procedure TfmMain.MenuitemSetEncoding(Sender: TObject);
begin
  if Sender is TSpTbxItem then
    if not (Sender as TSpTbxItem).Checked then
      ApplyFrameEncodingAndReload(CurrentFrame, (Sender as TComponent).Tag);
end;

procedure TfmMain.MenuitemConvertEncoding(Sender: TObject);
begin
  if Sender is TSpTbxItem then
    if not (Sender as TSpTbxItem).Checked then
    begin
      ApplyFrameEncodingAndReload(CurrentFrame, (Sender as TComponent).Tag, false{ACanReload});
      CurrentFrame.Modified:= true;
    end;
end;

procedure TfmMain.ApplyFrameEncoding(Frame: TEditorFrame; AEnc: Integer);
begin
  if Frame<>nil then
  with Frame do
  begin
    SkipBom:= False;
    case AEnc of
    cp__UTF8:
      begin
        EditorMaster.TextSource.Lines.CodePage:= 0;
        EditorMaster.TextSource.Lines.TextCoding:= tcUTF8;
      end;
    cp__UTF8_noBOM:
      begin
        SkipBom:= True;
        EditorMaster.TextSource.Lines.CodePage:= 0;
        EditorMaster.TextSource.Lines.TextCoding:= tcUTF8;
      end;
    cp__Unicode:
      begin
        EditorMaster.TextSource.Lines.CodePage:= 0;
        EditorMaster.TextSource.Lines.TextCoding:= tcUnicode;
      end;
    cp__UnicodeBE:
      begin
        EditorMaster.TextSource.Lines.CodePage:= 0;
        EditorMaster.TextSource.Lines.TextCoding:= tcSwapUnicode;
      end;
    else
      begin
        EditorMaster.TextSource.Lines.TextCoding:= tcANSI;
        EditorMaster.TextSource.Lines.CodePage:= AEnc;
      end;
    end;
  end;
end;


procedure TfmMain.ApplyFrameEncodingAndReload(Frame: TEditorFrame; AEnc: Integer;
  ACanReload: boolean = true);
begin
  if Frame<>nil then
    with Frame do
    begin
      ApplyFrameEncoding(Frame, AEnc);

      if ACanReload and (FileName <> '') then
        if (not Modified) or MsgEncReload then
        begin
          if IsFileWithBOM(FileName) then
            MsgWarn(WideFormat(DKLangConstW('cpBOM'), [WideExtractFileName(FileName)]), Handle);
          Modified:= False;
          EditorMaster.TextSource.Lines.SkipSignature:= True;
          DoFrameReloadInt(Frame);
          EditorMaster.TextSource.Lines.SkipSignature:= False;
         end;

      //if not ACanReload then
      //  EditorSetModified(Frame.EditorMaster);
    end;

  UpdateStatusBar;
end;

function TfmMain.MsgConfirmFtp: boolean;
begin
  Result:= MsgConfirm(DKLangConstW('zMFtpOp'), Handle);
end;

function TfmMain.MsgEncReload: boolean;
begin
  with TfmEnc.Create(Self) do
  try
    Left:= Self.Monitor.Left + (Self.Monitor.Width - Width) div 2;
    Top:= Self.Monitor.Top + (Self.Monitor.Height - Height) div 2;
    Result:= ShowModal = mrYes;
  finally
    Release;
  end;
end;

procedure TfmMain.UpdateStatusbarEnc(F: TEditorFrame);
begin
  if F<>nil then
  with F do
  case EditorMaster.TextSource.Lines.TextCoding of
    tcAnsi:
    begin
      case EditorMaster.TextSource.Lines.Codepage of
      CP_ACP:
        StatusItemEnc.Caption:= 'ANSI';
      CP_OEMCP:
        StatusItemEnc.Caption:= 'OEM';
      CP_MACCP:
        StatusItemEnc.Caption:= 'Mac';
      else
        StatusItemEnc.Caption:= IntToStr(EditorMaster.TextSource.Lines.Codepage);
      end;
    end;
    tcUnicode:
      StatusItemEnc.Caption:= 'UTF-16';
    tcSwapUnicode:
      StatusItemEnc.Caption:= 'UTF-16 BE';
    tcUTF8:
    begin
      if SkipBom then
        StatusItemEnc.Caption:= DKLangConstW('cpUTF8no')
      else
        StatusItemEnc.Caption:= 'UTF-8';
    end;
  end;
end;


procedure TfmMain.FindInit(AKeepFlags: boolean = false);
var
  IsSpec, IsSel,
  IsCase, IsWords,
  IsRe, IsRe_s, //IsRe_m,
  IsForw, IsWrap, IsSkipCol: boolean;
  SText: Widestring;
begin
  IsCase:= false;
  IsWords:= false;

  if Assigned(fmSR) then
  begin
    SText:= '';
    IsSel:= fmSR.cbSel.Checked;
    IsForw:= fmSR.bFor.Checked;
    IsRe:= fmSR.cbRe.Checked;
    IsRe_s:= fmSR.cbReDot.Checked;
    //IsRe_m:= fmSR.cbReMulti.Checked;
    if AKeepFlags then
    begin
      IsCase:= fmSR.cbCase.Checked;
      IsWords:= fmSR.cbWords.Checked;
    end;
    IsWrap:= fmSR.cbWrap.Checked;
    IsSpec:= fmSR.cbSpec.Checked;
    IsSkipCol:= fmSR.cbSkipCol.Checked;
  end
  else
  with TIniFile.Create(SynHistoryIni) do
  try
    SText:= DoReadTotalHistory;
    IsSel:= false; //not saved
    IsForw:= ReadBool('Search', 'Forw', true);
    IsRe:= ReadBool('Search', 'RegExp', false);
    IsRe_s:= ReadBool('Search', 'RegExpS', false);
    //IsRe_m:= ReadBool('Search', 'RegExpM', true);
    if AKeepFlags then
    begin
      IsCase:= ReadBool('Search', 'Case', false);
      IsWords:= ReadBool('Search', 'Words', false);
    end;
    IsWrap:= ReadBool('Search', 'Wrap', false);
    IsSpec:= ReadBool('Search', 'Spec', false);
    IsSkipCol:= ReadBool('Search', 'SkipCol', false);
  finally
    Free;
  end;

  //restore text only when a) it empty, b) ini string not empty
  if (Finder.FindText='') and (SText<>'') then
    Finder.FindText:= SText;

  //restore flags, but not all of them
  //(as Case/Words opts are configurable in QSearch)
  Finder.Tokens:= tokensAll;
  Finder.Flags:= [];
  if IsSel then Finder.Flags:= Finder.Flags + [ftSelectedText];
  if not IsForw then Finder.Flags:= Finder.Flags + [ftBackward];
  if IsRe then Finder.Flags:= Finder.Flags + [ftRegex];
  if IsRe_s then Finder.Flags:= Finder.Flags + [ftRegex_s];
  //if IsRe_m then Finder.Flags:= Finder.Flags + [ftRegex_m];
  if AKeepFlags then
  begin
    if IsCase then Finder.Flags:= Finder.Flags + [ftCaseSens];
    if IsWords then Finder.Flags:= Finder.Flags + [ftWholeWords];
  end;
  if IsWrap then Finder.Flags:= Finder.Flags + [ftWrapSearch];
  if IsSkipCol then Finder.Flags:= Finder.Flags + [ftSkipCollapsed];
  if not IsRE and IsSpec then
    Finder.FindText:= SDecodeSpecChars(Finder.FindText);
end;


function TfmMain.DoReadTotalHistory: Widestring;
var
  fnTC: string;
  SA: Ansistring;
begin
  fnTC:= SExpandVars('%Commander_ini%');
  if opListerTcHistory and (not SynExe) and SExpanded(fnTC) then
  begin
    //handle RedirectSection
    FixTcIni(fnTC, 'SearchText');

    //read TC ini
    with TIniFile.Create(fnTC) do
    try
      SA:= ReadString('SearchText', '0', '');
      if Pos(cUtfSign, SA)=1 then
      begin
        Delete(SA, 1, Length(cUtfSign));
        Result:= UTF8Decode(SA);
      end
      else
        Result:= SA;
    finally
      Free;
    end;
  end
  else
    with TIniFile.Create(SynIni) do
    try
      Result:= UTF8Decode(ReadString('SearchText', '0' , ''));
    finally
      Free;
    end;
end;


procedure TfmMain.ecFindExecute(Sender: TObject);
begin
  if IsTreeviewFocused then
    ecFindInTree.Execute
  else
  if IsListboxFocused then
    ecFindInList.Execute
  else
    FindDialog(false);
end;

procedure TfmMain.ecReplaceExecute(Sender: TObject);
begin
  FindDialog(true);
end;

procedure TfmMain.FindDialog(AReplaceMode: boolean);
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;

  if fmSR=nil then
  begin
    fmSR:= TfmSR.Create(Self);
    with fmSR do
    begin
      SRHistTC:= opListerTcHistory and not SynExe;
      SRCount:= opSaveSRHist;
      SRIni:= SynHistoryIni;
      SRIniS:= SynHistoryIni;
      SRProc:= Self.FindActionWrapper;
      OnFocusEditor:= Self.FindFocusEditor;
      cbTokens.Enabled:= SyntaxManager.AnalyzerCount>0;
      LoadIni;

      if not ShowOnTop then
      begin
        //Seems it OK sets ShowOnTop style, only for app
        if opSrOnTop then
          FormStyle:= fsStayOnTop
        else
          FormStyle:= fsNormal;
      end;
    end;
  end;

  with fmSR do
  begin
    SR_SuggestedSel:= '';
    SR_SuggestedSelEn:= Ed.HaveSelection;
    SR_SuggestedSelScope:= SR_SuggestedSelEn and EditorHasMultilineSelection(Ed);

    Sh_FindNext:= GetShortcutOfCmd(smFindNext);
    Sh_FindMode:= GetShortcutOfCmd(smFindDialog);
    Sh_ReplaceMode:= GetShortcutOfCmd(smReplaceDialog);

    if (not SR_SuggestedSelScope){careful} then
    begin
      if opSrSuggestSel and (Ed.SelLength>0) then
        SR_SuggestedSel:= Ed.SelText
      else
      if opSrSuggestWord then
        SR_SuggestedSel:= Ed.WordAtPos(Ed.CaretPos);
    end;

    cbSel.Enabled:= true; //SR_SuggestedSelEn;
    cbSel.Checked:= SR_SuggestedSelScope;

    if SR_SuggestedSel<>'' then
      DoCopyToEdit(ed1, cbSpec.Checked, cbRE.Checked, SR_SuggestedSel);
    ed1Change(Self);

    if IsMultiline then
      ActiveControl:= ed1Memo
    else
      ActiveControl:= ed1;
    IsReplace:= AReplaceMode;
    Show;
  end;
end;

  function TfmMain.IsProgressNeeded(Ed: TSyntaxMemo): boolean;
  const
    cMinProgress = 120*1024;
  begin
    Result:= Ed.TextLength >= cMinProgress;
  end;

  function TfmMain.IsProgressStopped(const NDoneSize, NTotalSize: Int64): boolean;
  begin
    Result:= false;
    try
      if NTotalSize<=0 then
        raise Exception.Create('NTotalSize<=0');
      if Assigned(fmProgress) then
      begin
        fmProgress.Pro.Progress:= NDoneSize * 100 div NTotalSize;
        Application.ProcessMessages;
        Result:= StopFind;
      end;
    except
      on E: Exception do
        MsgExcept('Error on msg processing', E, Handle);
    end;
  end;

  procedure TfmMain.UpdateFormEnabled(En: boolean);
  begin
    Groups.Enabled:= En;
    plTree.Enabled:= En;
    plClip.Enabled:= En;
    plOut.Enabled:= En;

    Menu.Enabled:= En;
    TbxDockTop.Enabled:= En;
    TbxDockLeft.Enabled:= En;
    TbxDockLeft1.Enabled:= En;
    TbxDockRight.Enabled:= En;
    TbxDockRight1.Enabled:= En;
    TbxDockBottom.Enabled:= En;
    TbxDockBottom1.Enabled:= En;

    if Assigned(fmSR) then
    begin
      fmSR.PanelBusy.Align:= alClient;
      fmSR.PanelBusy.Visible:= not En;
      fmSR.StatusFind.Visible:= En;
      fmSR.labMultiline.Visible:= En;
      fmSR.labStyle.Visible:= En;
      fmSR.labRe.Visible:= En;
      fmSR.labEd1.Visible:= En;
      fmSR.labEd2.Visible:= En;
      fmSR.labTransp.Visible:= En;
      if En then
        fmSR.IsReplace:= fmSR.IsReplace;
      fmSR.Cursor:= cDefaultCursor[En];
    end;

    if Assigned(fmNumConv) then
      fmNumConv.Enabled:= En;

    Screen.Cursor:= cDefaultCursor[En];
  end;

  procedure TfmMain.DoProgressShow(AMode: TProgressType);
  begin
    UpdateFormEnabled(false);

    if not Assigned(fmProgress) then
    begin
      fmProgress:= TfmProgress.Create(Self);
      fmProgress.ParentWindow:= Status.Handle; //"Parent:= Status" doesn't work
      fmProgress.BorderStyle:= bsNone;
      fmProgress.Align:= alClient;
    end;
    fmProgress.SetStatusMode(true);
    fmProgress.SetMode(AMode);
    fmProgress.Show;
    with fmProgress.bCan do
      if CanFocus then SetFocus;
    //DoRepaint; //no need

    FinderPro:= fmProgress.Pro;
    StopFind:= false;
    Application.ProcessMessages;
  end;

  procedure TfmMain.DoProgressHide;
  begin
    UpdateFormEnabled(true);

    if Assigned(fmProgress) then
    begin
      fmProgress.Hide;
      DoRepaint; //needed anyway, even if controls not resized
    end;

    if Assigned(fmSR) and fmSR.Enabled and fmSR.Visible and fmSR.CanFocus then
      fmSR.SetFocus
    else
    //test it
    if not edQs.Focused then
      FocusEditor;
  end;

procedure TfmMain.FindActionWrapper(act: TSRAction);
var
  Ed: TSyntaxMemo;
  oldStart, oldLength: integer;
begin
  Ed:= CurrentEditor;
  FinderPro:= nil;
  FinderProNum:= 0;
  oldStart:= Ed.SelStart;
  oldLength:= Ed.SelLength;

  if IsProgressNeeded(Ed) then
    DoProgressShow;

  try
    FindAction(act);
  finally
    FinderPro:= nil;
    FinderProNum:= 0;
    DoProgressHide;
  end;

  //record find action in macro
  if Assigned(fmSR) then
    DoRecordToMacro(
      sm_FindCommand,
      PWChar(WriteFindOptions(act, fmSR.TextOptions, fmSR.Text1, fmSR.Text2)));

  //extend selection
  if act in [arFindNext] then
  if Assigned(fmSR) and fmSR.cbExtSel.Checked then
    EditorExtendSelectionByPosition(Ed,
      oldStart, oldLength,
      Ed.SelStart, Ed.SelLength);

  //set "From caret" dialog option
  if act in [arFindNext, arSkip, arReplaceNext] then
    if Finder.Matches>0 then
      if Assigned(fmSR) then
        fmSR.SetFromCaret;
end;


procedure TfmMain.DoFindDialog_ReplaceOrSkip(ADoReplace: boolean);
var
  Ok, OkReplaced: boolean;
begin
  Finder.Flags:= Finder.Flags-[ftPromtOnReplace];

  //move to sel start
  if (CurrentEditor.SelLength>0) then
    DoFixReplaceCaret(CurrentEditor);

  //replace only when sel present
  OkReplaced:= false;
  Ok:= (CurrentEditor.SelLength>0) or (Finder.Matches>0);
  if Ok then
    if ADoReplace then
    begin
      //Bug1: RepAgain doesn't replace 1st match if caret
      //already at match and match_len =0 (search for '^')
      Finder.ReplaceAgain;
      OkReplaced:= Finder.Matches>0;
      CurrentFrame.DoTitleChanged;
    end;

  //sel next match
  Finder.FindAgain;
  //workaround for Bug1
  DoWorkaround_FindNext1;

  //final actions
  Ok:= Finder.Matches>0;
  if Ok and (CurrentEditor.SelLength>0) then
    DoFixReplaceCaret(CurrentEditor);
  if Ok then
    EditorCheckCaretOverlappedByForm(Finder.Control, fmSR);

  //show message in Find dialog status
  if not OkReplaced then
  begin
    if Ok then
      fmSR.ShowStatus(DKLangConstW('zMResRepNoFoundYes'))
    else
      fmSR.ShowStatus(DKLangConstW('zMResRepNoFoundNo'));
  end
  else
  begin
    if Ok then
      fmSR.ShowStatus(DKLangConstW('zMResRepYesFoundYes'))
    else
      fmSR.ShowStatus(DKLangConstW('zMResRepYesFoundNo'));
  end;
end;

procedure TfmMain.DoFindDialog_FindNext;
var
  Ok: boolean;
begin
  Finder.FindAgain;
  Ok:= Finder.Matches>0;
  if Ok then
    EditorCheckCaretOverlappedByForm(Finder.Control, fmSR);
  if Ok then
    fmSR.ShowStatus(DKLangConstW('zMResFound'))
  else
    fmSR.ShowStatus(DKLangConstW('zMResFoundNo'));
end;

procedure TfmMain.DoFindDialog_CountAllInCurrentTab;
begin
  Finder.CountAll;
  fmSR.ShowError(Finder.Matches=0);
end;

procedure TfmMain.DoFindDialog_ReplaceAllInCurrentTab;
var
  Ok, OkSel: boolean;
  SText: Widestring;
  Sel: TSynSelSave;
  OldScrollPosY: integer;
begin
  Ok:= ftPromtOnReplace in Finder.Flags;
  OkSel:= ftSelectedText in Finder.Flags;
  if Ok then
  begin
    fmSR.Hide;
    SText:= fmSR.Text1;
  end;
  if OkSel then
    EditorSaveSel(CurrentEditor, Sel);
  OldScrollPosY:= CurrentEditor.ScrollPosY;
  //
  Finder.ReplaceAll;
  if Finder.Matches>0 then
    CurrentFrame.DoTitleChanged;
  //
  CurrentEditor.ScrollPosY:= OldScrollPosY;
  if OkSel then
    EditorRestoreSel(CurrentEditor, Sel);
  fmSR.ShowError(Finder.Matches=0);
  if Ok then
  begin
    fmSR.Show;
    fmSR.Text1:= SText;
  end;
end;

procedure TfmMain.DoFindDialog_ReplaceAllInAllTabs(var AFilesReport: Widestring);
var
  nMatches, nFiles: Integer;
begin
  if FrameAllCount<2 then
    MsgWarn(DKLangConstW('fnMul'), Handle)
  else
  begin
    ReplaceInAllTabs(nMatches, nFiles);
    Finder.Matches:= nMatches;
    fmSR.ShowError(Finder.Matches=0);
    AFilesReport:= WideFormat(DKLangConstW('fn_f'), [nFiles]);
  end;
end;

procedure TfmMain.FindAction(act: TSRAction);
var
  SMsg, SMsgFiles: Widestring;
begin
  SMsg:= '';
  SMsgFiles:= '';

  with fmSR do
  begin
    if Text1='' then
      begin MsgBeep(true); Exit end;

    Finder.Flags:= [];
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSens];
    if cbWords.Checked then Finder.Flags:= Finder.Flags + [ftWholeWords];
    if cbRe.Checked then Finder.Flags:= Finder.Flags + [ftRegex];
    if cbReDot.Checked then Finder.Flags:= Finder.Flags + [ftRegex_s];
    //if cbReMulti.Checked then Finder.Flags:= Finder.Flags + [ftRegex_m];
    if cbSel.Checked then Finder.Flags:= Finder.Flags + [ftSelectedText];
    if bBack.Checked then Finder.Flags:= Finder.Flags + [ftBackward];
    if cbCfm.Checked then Finder.Flags:= Finder.Flags + [ftPromtOnReplace];
    if cbWrap.Checked then Finder.Flags:= Finder.Flags + [ftWrapSearch];
    if cbSkipCol.Checked then Finder.Flags:= Finder.Flags + [ftSkipCollapsed];

    //handle "From caret" specially: ignore it for "Replace all" actions
    if (not cbFromCur.Checked) or
      (act in cSearchIngoreFromCaret) then
      Finder.Flags:= Finder.Flags + [ftEntireScope];

    Finder.Tokens:= TSearchTokens(cbTokens.ItemIndex);
    Finder.FindText:= Text1;
    Finder.ReplaceText:= Text2;
    if cbSpec.Checked then
    begin
      Finder.FindText:= SDecodeSpecChars(Finder.FindText);
      Finder.ReplaceText:= SDecodeSpecChars(Finder.ReplaceText);
    end;

    Finder.OnCanAccept:= FinderCanAccept;
  end;

  //check regex valid
  if ftRegex in Finder.Flags then
    if not IsRegexValid(Finder.FindText) then
    begin
      fmSR.ShowStatus(DKLangConstW('zMRegexInvalid'));
      MsgBeep;
      Exit
    end;

  case act of
    arFindNext:
      DoFindDialog_FindNext;
    //
    arReplaceNext,
    arSkip:
      DoFindDialog_ReplaceOrSkip(act<>arSkip);
    //
    arFindAll:
      DoFindDialog_FindAllInCurrentTab(
        fmSR.cbBkmkAll.Checked,
        fmSR.cbSelectAll.Checked);
    //
    arCount:
      DoFindDialog_CountAllInCurrentTab;
    //
    arFindInTabs:
      DoFindDialog_FindAllInAllTabs;
    //
    arReplaceAll:
      DoFindDialog_ReplaceAllInCurrentTab;
    //
    arReplaceAllInAll:
      DoFindDialog_ReplaceAllInAllTabs(SMsgFiles);
  end;

  Finder.OnCanAccept:= nil;
  if Finder.Matches>0 then
  begin
    SMsg:= WideFormat(DKLangConstW('Found'), [Finder.Matches]) + ' ' + SMsgFiles;
    DoHint(SMsg);
    if act in [arCount, arFindAll, arReplaceAll, arReplaceAllInAll] then
      fmSR.ShowStatus(SMsg);
  end;
end;

//Reason of this:
//1- Lister plugin doesnt handle some keys
//2- QuickSearch edit focused doesnt handle keys
procedure TfmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
  S: string;
begin
  //code below needed only for Lister plugin
  if SynExe then Exit;

  //Ctrl+Space
  if (Key = vk_space) and (Shift = [ssCtrl]) then Exit;

  //PgUp/PgDn on ACP list shown
  if (Key = vk_prior) or (Key = vk_next) then
    if ecACP.ListBox.Visible then Exit;

  //Clip keys
  if fmClip.ListClip.Focused then
  begin
    if (Key = Ord('X')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('C')) and (Shift = [ssCtrl]) then Exit;
    if (Key = vk_delete) and (Shift = [ssShift]) then Exit;
  end;

  //Clips keys
  if Assigned(fmClips) and fmClips.List.Focused then
  begin
    if (Key = vk_insert) and (Shift = []) then Exit;
    if (Key = vk_delete) and (Shift = [ssShift]) then Exit;
    if (Key = Ord('C')) and (Shift = [ssCtrl]) then Exit;
  end;

  //QSearch keys
  if edQs.Focused then
  begin
    if (Key = Ord('V')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('X')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('C')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('A')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('Z')) and (Shift = [ssCtrl]) then Exit;
    if (Key = Ord('Y')) and (Shift = [ssCtrl]) then Exit;
    if (key = vk_insert) then Exit;
    if (Key = vk_delete) then Exit;
  end;

  //Esc
  if not QuickView then
    if (Key = VK_ESCAPE) and (Shift = []) then
    begin
      //Esc in QSearch
      if edQs.Focused then
        DoHandleQuickSearchEscape
      else
      {
      //Esc in File/Replace
      if Assigned(fmSR) and fmSR.Focused then
        fmSR.Close
      else
      }
      //Esc in panels
      if (CurrentEditor<>nil) and (not CurrentEditor.Focused) then
        FocusEditor
      else
        //Esc in editor
        case opEsc of
          cEscCloseApp:
            acExit.Execute;
          cEscCloseTab:
            acClose.Execute;
          cEscCloseTabOrApp:
            begin
              if FrameAllCount=1 then
                acExit.Execute
              else
                acClose.Execute;
            end;
          cEscMinimizeApp:
            begin
              if SynExe then
                Application.Minimize
              else
                SendMessage(hLister, WM_SYSCOMMAND, SC_MINIMIZE, 0);
            end;
        end;
      Key:= 0;
      Exit
    end;

  //Ctrl+Tab, Ctrl+Shift+Tab
  if (Key = vk_tab) and ((Shift = [ssCtrl]) or (Shift = [ssCtrl, ssShift])) then
  begin
    DoTabSwitch(Shift = [ssCtrl]);
    Key:= 0;
    Exit
  end;

  //QView Ctrl-Q
  if QuickView and (Shift = [ssCtrl]) and (Key = Ord('Q')) then
  begin
    PostMessage(hLister, wm_keydown, vk_control, 0);
    PostMessage(hLister, wm_keydown, Key, 0);
    PostMessage(hLister, wm_keyup, Key, 0);
    PostMessage(hLister, wm_keyup, vk_control, 0);
    Key:= 0;
    Exit
  end;

  //QSearch needs:
  if ((Shift = []) and (Key = VK_delete)) or
   ((Shift = []) and (Key = vk_back)) or
   (((Shift = []) or (Shift = [ssShift])) and
    ((Key = vk_left) or (Key = vk_right) or (Key = vk_up) or (Key = vk_down)
     or (Key = vk_home) or (Key = vk_end) or (Key = vk_return))) or
   ((Shift = []) and (Key >= Ord('A')) and (Key <= Ord('Z')))
   then
     Exit;

  //Handle configured keys
  S:= ShortcutToText(Shortcut(Key, Shift));
  with SyntKeyMapping do
    for i:= 0 to Items.Count-1 do
      with Items[i] do
        if ((KeyStrokes.Count > 0) and (KeyStrokes[0].AsString = S)) or
          ((KeyStrokes.Count > 1) and (KeyStrokes[1].AsString = S)) then
        begin
          DoDelayedCommandAny(Command);
          Key:= 0;
          Exit
        end;

  //Handle tools
  for i:= Low(opTools) to High(opTools) do
   with opTools[i] do
     if (ToolCaption<>'') and (ToolCommand<>'') and (S=ToolKeys) and
       ((ToolLexer='') or (CurrentFrame.CurrentLexer=ToolLexer)) then
    begin
      RunTool(opTools[i]);
      Key:= 0;
      Exit
    end;
end;

procedure TfmMain.TBXItemAbClick(Sender: TObject);
begin
  with TfmAb.Create(Self) do
    try
      LabelWV.Caption:= cSynVer;
      Left:= Self.Monitor.Left + (Self.Monitor.Width - Width) div 2;
      Top:= Self.Monitor.Top + (Self.Monitor.Height - Height) div 2;
      ShowModal;
    finally
      Release
    end;
end;

procedure TfmMain.ecWrapExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  NPos: Integer;
begin
  Ed:= CurrentEditor;
  if DoPyEvent(Ed, cSynEventOnState, [cSynPropWrap]) = cPyFalse then Exit;

  with Ed do
  begin
    NPos:= TopLine;
    WordWrap:= not WordWrap;
    TopLine:= NPos;
    if not WordWrap then
      ExecCommand(smScrollAbsLeft);
  end;

  PostMessage(hLister, WM_COMMAND, MAKELONG(Ord(Ed.WordWrap), itm_wrap), Handle);
  UpdateStatusbar;
end;

procedure TfmMain.ecLineNumsExecute(Sender: TObject);
begin
  if DoPyEvent(CurrentEditor, cSynEventOnState, [cSynPropNums]) = cPyFalse then Exit;

  with CurrentFrame do
  begin
    EditorMaster.LineNumbers.Visible:= not EditorMaster.LineNumbers.Visible;
    EditorSlave.LineNumbers.Visible:= EditorMaster.LineNumbers.Visible;
    TemplateEditor.LineNumbers.Visible:= EditorMaster.LineNumbers.Visible;
    UpdateGutterWidth(EditorMaster);
    UpdateGutterWidth(EditorSlave);
  end;

  UpdateGutter(CurrentFrame);
  UpdateStatusbar;
end;

procedure TfmMain.ecFoldingExecute(Sender: TObject);
begin
  if DoPyEvent(CurrentEditor, cSynEventOnState, [cSynPropFolding]) = cPyFalse then Exit;

  with CurrentFrame do
  begin
    EditorMaster.DisableFolding:= not EditorMaster.DisableFolding;
    EditorSlave.DisableFolding:= EditorMaster.DisableFolding;
  end;

  UpdateGutter(CurrentFrame);
  UpdateStatusbar;
end;

procedure TfmMain.ecNonPrintExecute(Sender: TObject);
begin
  with CurrentEditor do
    NonPrinted.Visible:= not NonPrinted.Visible;
  UpdateStatusbar;
end;

procedure TfmMain.acRereadExecute(Sender: TObject);
begin
  DoFrameReloadWrapper(CurrentFrame);
end;

procedure TfmMain.DoFrameReloadWrapper(F: TEditorFrame);
begin
  if (F=nil) or (F.FileName='') then
  begin
    MsgBeep;
    Exit
  end;

  if not IsFileExist(F.FileName) then
  begin
    MsgNoFile(F.FileName);
    Exit
  end;

  DoFrameReloadInt(F);
  UpdateFrameEnc(F); //calls DoFrameReloadInt

  F.EditorMaster.Lines.ResetLineStates;
  F.EditorSlave.Lines.ResetLineStates;

  F.EditorMaster.ResetSearchMarks;
  F.EditorSlave.ResetSearchMarks;
  UpdateFrameMicroMap(F);
end;

procedure TfmMain.DoFrameReloadInt(F: TEditorFrame);
var
  p1, p2: integer;
begin
  if (F<>nil) and (F.FileName<>'') then
  begin
    if F.Modified then
      case FrameAskToSave(F, False, True) of
        mrCancel:
          Exit;
        mrYes:
          if not SaveFrame(F, False) then Exit;
      end;

    p1:= F.EditorMaster.TopLine;
    p2:= F.EditorSlave.TopLine;
    F.EditorMaster.TextSource.Lines.LoadFromFile(F.FileName);
    F.EditorMaster.TopLine:= p1;
    F.EditorSlave.TopLine:= p2;

    F.Modified:= False;
    F.DoTitleChanged;
    UpdateStatusbar;
  end;
end;

procedure TfmMain.TBXItemClrClick(Sender: TObject);
begin
  DoClearFilesHistory;
end;

procedure TfmMain.DoClearFilesHistory;
begin
  FDelete(SynHistoryStatesIni);
  SynMruFiles.Items.Clear;
  with TIniFile.Create(SynHistoryIni) do
  try
    EraseSection('MRU');
  finally
    Free;
  end;
end;

procedure TfmMain.tbViewMove(Sender: TObject);
begin
  if Visible then
  begin
    if not TimerLoad.Enabled then
      FToolbarMoved:= True; //set flag only after first delay
    FormResize(Self);
  end;
end;

function tfmMain.GetIcons: integer;
begin
  if tbFile.Images = ImageListIconsStd then Result:= 0
  else
  if tbFile.Images = ImageListIconsFogue16b then Result:= 1
  else
  if tbFile.Images = ImageListIconsFogue24b then Result:= 2
  else
  if tbFile.Images = ImageListIconsTango16b then Result:= 3
  else
  if tbFile.Images = ImageListIconsTango22b then Result:= 4
  else
    Result:= -1;
end;

procedure TfmMain.SetIcons(A: integer);
var L: TCustomImageList;
begin
  case A of
    0: L:= ImageListIconsStd;
    1: L:= ImageListIconsFogue16b;
    2: L:= ImageListIconsFogue24b;
    3: L:= ImageListIconsTango16b;
    4: L:= ImageListIconsTango22b;
    else L:= nil;
  end;
  tbFile.Images:= L;
  tbEdit.Images:= L;
  tbView.Images:= L;
  tbQs.Images:= L;
  if opShowMenuIcons then
    PopupEditor.Images:= L
  else
    PopupEditor.Images:= nil;
end;

procedure TfmMain.ecPrintActionBeforeExecute(Sender: TObject);
begin
  LoadPrintOptions;
  with ecSyntPrinter do
  begin
    SyntMemo:= CurrentEditor;
    PrintSelection:= CurrentEditor.HaveSelection;
  end;
  with ecPrintAction do
  begin
    PrintDialog:= nil;
    SyntPrinter:= ecSyntPrinter;
    SyntMemo:= nil; //runtime breaks this
  end;
end;

procedure TfmMain.ecPreviewActionBeforeExecute(Sender: TObject);
begin
  LoadPrintOptions;
  with ecSyntPrinter do
  begin
    SyntMemo:= CurrentEditor;
    PrintSelection:= CurrentEditor.HaveSelection;
  end;
  with ecPreviewAction do
  begin
    SyntPrinter:= ecSyntPrinter;
    SyntMemo:= nil; //runtime breaks this
  end;
end;

procedure TfmMain.TBXItem2Click(Sender: TObject);
begin
  with CurrentFrame do
  begin
    EditorMaster.ExecCommand(smSearchMarkReset);
    EditorSlave.ExecCommand(smSearchMarkReset);
    UpdateFrameMicroMap(CurrentFrame);
  end;
end;

procedure TfmMain.ecACPKeyPress(Sender: TObject; var Key: Char);
begin
  //These chars close window
  if Pos(Key, '<>/\|.,;: +*=#()[]{}%''"?!@%&') > 0 then
    if Pos(Key, opAcpChars) = 0 then
      ecACP.CloseUp(False);
  //closing tag
  if Key = '/' then
    DoAcpPopup;
end;

procedure TfmMain.DoAcpPopup;
begin
  DoDelayedCommandAny(ecACP.CommandID{650});
end;

procedure TfmMain.DoFuncHintPopup;
begin
  DoDelayedCommandAny(ParamCompletion.CommandID{652});
end;

procedure TfmMain.ecACPListClick;
begin
  ecACP.CloseUp(True); //2nd click appears, 2 ids inserted
end;

procedure TfmMain.ecACPListKeyDown;
//var
//  d: integer;
begin
  {
  with ecACP.ListBox do
    if ItemIndex <> -1 then begin
      D:= Height div ItemHeight;
      if (Key = vk_down) or (Key = vk_right) then begin
        if ItemIndex < Count - 1 then
          itemIndex:= itemIndex + 1;
        Key:= 0;
      end;
      if (Key = vk_up) or (Key = vk_left) then begin
        if ItemIndex > 0 then
          itemIndex:= itemIndex - 1;
        Key:= 0;
      end;
      if (Key = vk_prior) then begin
        if ItemIndex >= D then
          itemIndex:= itemIndex - D
        else
          itemIndex:= 0;
        Key:= 0;
      end;
      if (Key = vk_next) then begin
        if ItemIndex < Count - D then
          itemIndex:= itemIndex + D
        else
          itemIndex:= Count - 1;
        Key:= 0;
      end;
      if (Key = vk_home) then begin
        itemIndex:= 0;
        Key:= 0;
      end;
      if (Key = vk_end) then begin
        itemIndex:= Count - 1;
        Key:= 0;
      end;
    end;
  ecACPChange(Self);
  }
end;

procedure TfmMain.acNewTabExecute(Sender: TObject);
begin
  if Assigned(Groups) then
    DoAddTab(Groups.PagesCurrent);
end;

procedure TfmMain.DoHint(S: WideString);
begin
  SDeleteFromW(S, #10);
  SDeleteFromW(S, #13);
  StatusItemHint.Caption:= S;
  TimerHint.Enabled:= false;
  TimerHint.Enabled:= true;
end;

procedure TfmMain.TBXItemWPriorClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smFindCurrentWordPrior);
end;

procedure TfmMain.TBXItemWNextClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smFindCurrentWordNext);
end;

procedure TfmMain.TBXItemFNextClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smFindNext);
end;

procedure TfmMain.TBXItemFPrevClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smFindPrev);
end;

procedure TfmMain.TimerRedrawTimer(Sender: TObject);
begin
  TimerRedraw.Enabled:= False;
  FEnableRepaint:= True;
end;

procedure TfmMain.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  Action:= caFree;
  UpdateRecentsOnClose;

  //was in FormCloseConfirm before
  for i:= 0 to FrameAllCount-1 do
    SaveFrameState(FramesAll[i]);

  //save ini
  if not QuickView then
  try
    SaveOptionsRecent;
    SaveConsoleHist;
  except
    MsgError(DKLangConstW('Appn'), Handle);
  end;

  //close Spell dialog
  {$ifdef SPELL}
  if Assigned(FSpell) and Assigned(FSpell.DialogForm) then
    FSpell.DialogForm.Close;
  {$endif}

  //unset clip hook
  if Assigned(fmClip) then
    fmClip.Close;
  //clear find results
  DoClearTreeFind;
  //close plugins
  DoClosePlugins;

  //close proj and proj-preview
  FProjectFreeing:= true;
  ProjPreviewClose(Self);
  if Assigned(fmProj) then
  begin
    ProjClose(Self);
    fmProj.Close;
  end;
end;

procedure TfmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Assigned(fmProgress) and fmProgress.Visible then
  begin
    MsgBeep;
    CanClose:= false;
  end
  else
    CanClose:=
      DoConfirmClose and
      DoConfirmSaveSession(true, true);
end;

procedure TfmMain.WMCommandAny(var Msg: TMessage);
begin
  if CurrentEditor<>nil then
    CurrentEditor.ExecCommand(Msg.wParam);
end;

procedure TfmMain.bBk0Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smGotoBookmark0 + (Sender as TComponent).Tag);
  EditorCenterPos(CurrentEditor, true{GotoMode}, opSrOffsetY);
end;

procedure TfmMain.TBXSubmenuItemBkGotoPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateBookmarkMenus;
end;


procedure TfmMain.UpdateBookmarkMenus;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  with Ed do
  begin
    TbxItemB0.Enabled:= Bookmarks[0] <> -1;
    TbxItemB1.Enabled:= Bookmarks[1] <> -1;
    TbxItemB2.Enabled:= Bookmarks[2] <> -1;
    TbxItemB3.Enabled:= Bookmarks[3] <> -1;
    TbxItemB4.Enabled:= Bookmarks[4] <> -1;
    TbxItemB5.Enabled:= Bookmarks[5] <> -1;
    TbxItemB6.Enabled:= Bookmarks[6] <> -1;
    TbxItemB7.Enabled:= Bookmarks[7] <> -1;
    TbxItemB8.Enabled:= Bookmarks[8] <> -1;
    TbxItemB9.Enabled:= Bookmarks[9] <> -1;

    TbxItemB0.Caption:= EditorGetBookmarkDesc(Ed, 0);
    TbxItemB1.Caption:= EditorGetBookmarkDesc(Ed, 1);
    TbxItemB2.Caption:= EditorGetBookmarkDesc(Ed, 2);
    TbxItemB3.Caption:= EditorGetBookmarkDesc(Ed, 3);
    TbxItemB4.Caption:= EditorGetBookmarkDesc(Ed, 4);
    TbxItemB5.Caption:= EditorGetBookmarkDesc(Ed, 5);
    TbxItemB6.Caption:= EditorGetBookmarkDesc(Ed, 6);
    TbxItemB7.Caption:= EditorGetBookmarkDesc(Ed, 7);
    TbxItemB8.Caption:= EditorGetBookmarkDesc(Ed, 8);
    TbxItemB9.Caption:= EditorGetBookmarkDesc(Ed, 9);

    TbxItemG0.Checked:= Bookmarks[0] <> -1;
    TbxItemG1.Checked:= Bookmarks[1] <> -1;
    TbxItemG2.Checked:= Bookmarks[2] <> -1;
    TbxItemG3.Checked:= Bookmarks[3] <> -1;
    TbxItemG4.Checked:= Bookmarks[4] <> -1;
    TbxItemG5.Checked:= Bookmarks[5] <> -1;
    TbxItemG6.Checked:= Bookmarks[6] <> -1;
    TbxItemG7.Checked:= Bookmarks[7] <> -1;
    TbxItemG8.Checked:= Bookmarks[8] <> -1;
    TbxItemG9.Checked:= Bookmarks[9] <> -1;
  end;
end;

procedure TfmMain.bbg0Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSetBookmark0 + (Sender as TComponent).Tag);
end;

procedure TfmMain.TBXSubmenuItemBkSetPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateBookmarkMenus;
end;


procedure TfmMain.ODShow(Sender: TObject);
begin
  DoCenterForm(OD.Handle, Self);
end;

procedure TfmMain.SDShow(Sender: TObject);
begin
  DoCenterForm(SD.Handle, Self);
end;

procedure TfmMain.acNewWindowExecute(Sender: TObject);
begin
  if SynExe then
    FExecute(Application.ExeName, '', '', 0);
end;

procedure TfmMain.TBXItemFExitClick(Sender: TObject);
begin
  if DoCloseAllTabs then
    acExit.Execute;
end;

procedure TfmMain.ecCharPopupChange(Sender: TObject);
begin
  with ecCharPopup do
    ToolHint.Text:= WideFormat(DKLangConstW('MSel'),
      [Byte(SelChar), Byte(SelChar)]);
end;

procedure TfmMain.ecCharPopupShow(Sender: TObject);
var
  Ed: TSyntaxMemo;
  ch: WideChar;
  s: string;
begin
  Ed:= CurrentEditor;
  with ecCharPopup do
  begin
    Font:= Ed.Font;
    if Ed.TextLength>0 then
      if Ed.Lines.TextCoding=tcAnsi then
      begin
        ch:= Ed.Lines.Chars[Ed.CaretStrPos+1];
        s:= UnicodeToAnsiCP(ch, CurrentFrame.EditorMaster.TextSource.Lines.Codepage);
        if s<>'' then SelChar:= s[1];
      end
      else
      begin
        ch:= Ed.Lines.Chars[Ed.CaretStrPos+1];
        SelChar:= Char(ch);
      end;
  end;
end;

procedure TfmMain.ecACPShow(Sender: TObject);
begin
  //if only single item matches the text, then insert this item w/o dialog
  if opAcpUseSingle then
    with ecACP do
      if ListBox.Items.Count=1 then
      begin
        CloseUp(true);
        Exit
      end;

  //CSS: insert space if caret is after ":" char
  if FAcpCss then
    with CurrentEditor do
      if Lines.Chars[CaretStrPos]=':' then
      begin
        InsertText(' ');
        DoAcpPopup;
      end;

  //Work-around for small problem:
  //when ACP called with caret on ID, this ID replaced then with the chosed ID.
  //Need to insert some char before text ID.
  with CurrentEditor do
    if (CaretStrPos<TextLength) then
      if IsWordChar(Lines.Chars[CaretStrPos+1]) then
      begin
        InsertText(' ');
        CaretStrPos:= CaretStrPos-1;
        DoAcpPopup;
        FAcpHtmSpaceAdded:= true;
      end;
end;

procedure TfmMain.FrameSaveState(Sender: TObject);
begin
  SaveFrameState(Sender as TEditorFrame);
end;

procedure TfmMain.acSetupLexerExecuteOK(Sender: TObject);
begin
  SyntaxManager.Modified:= True;
  DoConfirmSaveLexLib;
end;

procedure TfmMain.SaveLexLibFilename;
var
  fn: string;
begin
  fn:= SyntaxManager.FileName;
  if UpperCase(ExtractFileDir(fn)) = UpperCase(ExtractFileDir(SynLexLib)) then
    fn:= ExtractFileName(fn);

  with TIniFile.Create(SynIni) do
  try
    WriteString('Setup', 'LexLib', fn);
  finally
    Free
  end;
end;

  //1st shortcut for command
  function TfmMain.GetShortcutOfCmd(id: integer): TShortcut;
  var
    c: TecCommandItem;
  begin
    Result:= 0;
    c:= SyntKeyMapping.CommandByID(id);
    if Assigned(c) and
      (c.KeyStrokes.Count>0) and
      (c.KeyStrokes[0].KeyDefs.Count>0) then
      Result:= c.KeyStrokes[0].KeyDefs[0].Shortcut;
  end;

  //text representation of command's shortcut
  function TfmMain.GetShortcutTextOfCmd(id: integer): string;
  var
    c: TecCommandItem;
  begin
    c:= SyntKeyMapping.CommandByID(id);
    if Assigned(c) and (c.KeyStrokes.Count>0) then
      Result:= c.KeyStrokes[0].AsString
    else
      Result:= '';
  end;

  //is shortcut assigned to cmd (1st or 2nd shortcut)
  function TfmMain.IsShortcutOfCmd(sh: TShortcut; cmd: integer): boolean;
  var
    c: TecCommandItem;
  begin
    Result:= false;
    if sh=0 then Exit;
    c:= SyntKeyMapping.CommandByID(cmd);
    if Assigned(c) then
      Result:=
        ((c.KeyStrokes.Count>0) and
         (c.KeyStrokes[0].KeyDefs.Count = 1) and
         (c.KeyStrokes[0].KeyDefs[0].Shortcut = sh)) or
        ((c.KeyStrokes.Count>1) and
         (c.KeyStrokes[1].KeyDefs.Count = 1) and
         (c.KeyStrokes[1].KeyDefs[0].Shortcut = sh));
  end;

  //get macro's shortcut
  procedure TfmMain.GetShortcutOfMacro(n: integer; var sh: TShortcut);
  begin
    if n<=9 then
      sh:= GetShortcutOfCmd(sm_Macro1+n-1)
    else
      sh:= GetShortcutOfCmd(sm_Macro10+n-10)
  end;

  //set marco shortcut
  procedure TfmMain.SetShortcutOfMacro(n: integer; const sh: TShortcut);
  var
    c: TecCommandItem;
  begin
    if n<=9 then
      c:= SyntKeyMapping.CommandByID(sm_Macro1+n-1)
    else
      c:= SyntKeyMapping.CommandByID(sm_Macro10+n-10);
    if Assigned(c) then
    begin
      c.KeyStrokes.Clear;
      c.KeyStrokes.Add.KeyDefs.Add.ShortCut:= sh;
    end;
  end;

//set menuitem caption, so that it shows "shortcut" text after a tab char
procedure TfmMain.UpdKey_String(Item: TSpTbxItem; const Cmd: Widestring);
var
  S: Widestring;
begin
  S:= Item.Caption;
  SDeleteFromW(S, #9);
  if Cmd<>'' then
    S:= S + #9 + Cmd;
  Item.Caption:= S;
end;

//set menuitem caption, using Command id
procedure TfmMain.UpdKey(Item: TSpTbxItem; CmdId: integer);
begin
  UpdKey_String(Item, GetShortcutTextOfCmd(CmdId));
end;

procedure TfmMain.UpdateShortcuts;
begin
  plTree.Options.CloseButton.Hint:= GetShortcutTextOfCmd(sm_OptShowLeftPanel);
  plClip.Options.CloseButton.Hint:= GetShortcutTextOfCmd(sm_OptShowRightPanel);
  plOut.Options.CloseButton.Hint:= GetShortcutTextOfCmd(sm_OptShowOutputPanel);

  TbxTabTree.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusTree);
  TbxTabProject.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusProj);
  TbxTabTabs.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusTabs);
  //
  TbxTabClipboard.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusClip);
  TbxTabClips.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusClips);
  TbxTabMinimap.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusMap);
  //
  TbxTabOutput.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusOutput);
  TbxTabResults.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusFindRes);
  TbxTabValidate.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusValidate);
  TbxTabConsole.Hint:= GetShortcutTextOfCmd(sm_ToggleFocusConsole);

  UpdKey(TBXItemHelpTopics, sm_HelpFileContents);
  UpdKey(TbxItemRunSnippets, sm_SnippetsDialog);
  UpdKey(TbxItemRunNewSnippet, sm_NewSnippetDialog);
  UpdKey(TbxItemRunNewPlugin, sm_NewPythonPluginDialog);

  UpdKey(TBXItemONPrintSpaces, sm_OptNonPrintSpaces);
  UpdKey(TBXItemONPrintEol, sm_OptNonPrintEol);
  UpdKey(TBXItemONPrintAll, sm_OptNonPrintBoth);
  UpdKey(TBXItemONPrintEolDetails, sm_OptNonPrintEolDetails);

  UpdKey(TBXItemEExtractDupCase, sm_ExtractDupsCase);
  UpdKey(TBXItemEExtractDupNoCase, sm_ExtractDupsNoCase);
  UpdKey(TBXItemEReverse, sm_ReverseLines);
  UpdKey(TBXItemEShuffle, sm_ShuffleLines);
  UpdKey(TBXItemSSelExtend, sm_SelectionExtend);

  //multi-carets
  UpdKey(TbxItemCaretsRemove1, sm_CaretsRemoveLeaveFirst);
  UpdKey(TbxItemCaretsRemove2, sm_CaretsRemoveLeaveLast);
  UpdKey(TbxItemCaretsFromSelLeft, sm_CaretsFromSelLeft);
  UpdKey(TbxItemCaretsFromSelRight, sm_CaretsFromSelRight);
  UpdKey(TbxItemCaretsFromSelClear, sm_CaretsFromSelClear);
  UpdKey(TbxItemCaretsFromMarksLeft, sm_CaretsFromMarksLeft);
  UpdKey(TbxItemCaretsFromMarksRight, sm_CaretsFromMarksRight);
  UpdKey(TbxItemCaretsFromMarksClear, sm_CaretsFromMarksClear);
  UpdKey(TbxItemCaretsExtUpLine, sm_CaretsExtendUpLine);
  UpdKey(TbxItemCaretsExtDownLine, sm_CaretsExtendDownLine);
  UpdKey(TbxItemCaretsExtUpPage, sm_CaretsExtendUpPage);
  UpdKey(TbxItemCaretsExtDownPage, sm_CaretsExtendDownPage);
  UpdKey(TbxItemCaretsExtUpEnd, sm_CaretsExtendUpEnd);
  UpdKey(TbxItemCaretsExtDownEnd, sm_CaretsExtendDownEnd);

  //folding
  UpdKey(TbxItemFoldAll, smFullCollapse);
  UpdKey(TbxItemUnFoldAll, smFullExpand);
  //K(TbxItemUnFoldLine, sm_); //no sm command
  UpdKey(TbxItemFoldNearestBlock, smToggleCollapseNearest);
  UpdKey(TbxItemFoldSelBlock, smCollapseSelection);
  UpdKey(TbxItemFoldRangesInSel, smInSelCollapse);
  UpdKey(TbxItemUnFoldRangesInSel, smInSelExpand);

  //win
  UpdKey(TbxItemWinTree, sm_ToggleFocusTree);
  UpdKey(TbxItemWinClip, sm_ToggleFocusClip);
  UpdKey(TbxItemWinClips, sm_ToggleFocusClips);
  UpdKey(TbxItemWinOut, sm_ToggleFocusOutput);
  UpdKey(TbxItemWinFRes, sm_ToggleFocusFindRes);
  UpdKey(TbxItemWinVal, sm_ToggleFocusValidate);
  UpdKey(TbxItemWinMap, sm_ToggleFocusMap);
  UpdKey(TbxItemWinProj, sm_ToggleFocusProj);
  UpdKey(TbxItemWinTabs, sm_ToggleFocusTabs);
  UpdKey(TbxItemWinConsole, sm_ToggleFocusConsole);

  //sort
  UpdKey(TBXItemEDedupAll, sm_RemoveDupsAll);
  UpdKey(TBXItemEDedupAdjacent, sm_RemoveDupsAdjacent);
  UpdKey(TbxItemESortDialog, sm_SortDialog);
  UpdKey(tbxItemESortAsc, smSortAscending);
  UpdKey(tbxItemESortDesc, smSortDescending);

  //blank ops
  UpdKey(TBXItemEAlignWithSep, sm_AlignWithSeparator);
  UpdKey(TbxItemECenterLines, sm_CenterLines);
  UpdKey(TbxItemETabToSp, sm_ConvertTabsToSpaces);
  UpdKey(TbxItemESpToTab, sm_ConvertSpacesToTabsAll);
  UpdKey(TBXItemERemDupSp, sm_RemoveDupSpaces);
  UpdKey(TbxItemERemBlanks, sm_RemoveBlanks);
  UpdKey(TbxItemEReduceBlanks, sm_ReduceBlanks);
  UpdKey(TbxItemETrimLead, sm_TrimLeading);
  UpdKey(TbxItemETrimTrail, sm_TrimTrailing);
  UpdKey(TbxItemETrimAll, sm_TrimAll);
  UpdKey(TbxItemEIndentLike1st, sm_IndentLike1st);

  UpdKey(TbxItemMarkClear, sm_MarkersClear);
  UpdKey(TbxItemMarkGoLast, sm_JumpToLastMarker);

  UpdKey(TbxItemHelpCommandList, sm_CommandsList);
  UpdKey(TbxItemERepeatCmd, sm_RepeatLastCommand);
  UpdKey(TbxItemSSelToken, sm_SelectToken);

  UpdKey(TbxItemTidyVal, sm_TidyValidate);
  UpdKey(TbxItemTidyCfg, sm_TidyConfig);

  //macro
  UpdKey(TbxItemMacroRepeat, sm_MacroRepeat);
  UpdKey(TbxItemMacroRecord, smMacroRecStart);
  UpdKey(TbxItemMacroStop, smMacroRecStop);
  UpdKey(TbxItemMacroCancel, smMacroRecCancel);
  UpdKey(TbxItemMacroPlay, smMacroPlay);
  UpdKey(TbxItemMacroDlg, sm_MacrosDialog);

  UpdKey(TbxItemMacro1, sm_Macro1);
  UpdKey(TbxItemMacro2, sm_Macro2);
  UpdKey(TbxItemMacro3, sm_Macro3);
  UpdKey(TbxItemMacro4, sm_Macro4);
  UpdKey(TbxItemMacro5, sm_Macro5);
  UpdKey(TbxItemMacro6, sm_Macro6);
  UpdKey(TbxItemMacro7, sm_Macro7);
  UpdKey(TbxItemMacro8, sm_Macro8);
  UpdKey(TbxItemMacro9, sm_Macro9);
  UpdKey(TbxItemMacro10, sm_Macro10);
  UpdKey(TbxItemMacro11, sm_Macro11);
  UpdKey(TbxItemMacro12, sm_Macro12);
  UpdKey(TbxItemMacro13, sm_Macro13);
  UpdKey(TbxItemMacro14, sm_Macro14);
  UpdKey(TbxItemMacro15, sm_Macro15);
  UpdKey(TbxItemMacro16, sm_Macro16);
  UpdKey(TbxItemMacro17, sm_Macro17);
  UpdKey(TbxItemMacro18, sm_Macro18);
  UpdKey(TbxItemMacro19, sm_Macro19);
  UpdKey(TbxItemMacro20, sm_Macro20);
  UpdKey(TbxItemMacro21, sm_Macro21);
  UpdKey(TbxItemMacro22, sm_Macro22);
  UpdKey(TbxItemMacro23, sm_Macro23);
  UpdKey(TbxItemMacro24, sm_Macro24);
  UpdKey(TbxItemMacro25, sm_Macro25);
  UpdKey(TbxItemMacro26, sm_Macro26);
  UpdKey(TbxItemMacro27, sm_Macro27);
  UpdKey(TbxItemMacro28, sm_Macro28);
  UpdKey(TbxItemMacro29, sm_Macro29);
  UpdKey(TbxItemMacro30, sm_Macro30);

  //view
  UpdKey(TbxItemVSyncHorz, sm_SyncScrollHorz);
  UpdKey(TbxItemVSyncVert, sm_SyncScrollVert);
  UpdKey(TbxItemVSpellLive, sm_SpellLive);
  UpdKey(TbxItemVSpellCheck, sm_SpellCheck);

  //edit
  UpdKey(TbxItemEJoin, sm_JoinLines);
  UpdKey(TbxItemESplit, sm_SplitLines);
  UpdKey(TbxItemECpFN, sm_CopyFilename);
  UpdKey(TbxItemECpFullPath, sm_CopyFullPath);
  UpdKey(TbxItemECpDirPath, sm_CopyDirPath);
  UpdKey(TbxItemEMoveUp, smMoveLinesUp);
  UpdKey(TbxItemEMoveDn, smMoveLinesDown);
  UpdKey(TbxItemEToggleStreamComment, sm_ToggleStreamComment);
  UpdKey(TbxItemEToggleLineComment, sm_ToggleLineComment);
  UpdKey(TbxItemEToggleLineCommentAlt, sm_ToggleLineCommentAlt);

  UpdKey(TbxItemHtmlEmmetExpand, sm_Emmet_Expand);
  UpdKey(TbxItemHtmlEmmetWrap, sm_Emmet_Wrap);

  UpdKey(TBXItemEInsText, sm_InsertTextDialog);
  UpdKey(TBXItemEFillBlock, sm_FillBlockDialog);
  UpdKey(TBXItemOOnTop, sm_ShowOnTop);
  UpdKey(TBXItemOFullScr, sm_ShowFullScreen);
  UpdKey(TBXItemViewColMarkers, sm_ColumnMarkers);

  UpdKey(TBXItemESyncEd, sm_ToggleSyncEditing);
  UpdKey(TbxItemEExtr, sm_ExtractTextDialog);
  UpdKey(TbxItemETime, sm_InsertDateTime);
  UpdKey(TbxItemHtmlInsColor, sm_InsertColor);
  UpdKey(TbxItemHtmlInsImage, sm_InsertImage);

  UpdKey(TBXItemFExit, sm_FileExit);
  UpdKey(TBXItemFClearRecents, sm_ClearFilesHistory);
  UpdKey(TbxItemFClose, sm_FileClose);
  UpdKey(TbxItemFCloseDel, sm_FileCloseAndDelete);
  UpdKey(TbxItemFCloseAll, sm_FileCloseAll);
  UpdKey(TbxItemFCloseOth, sm_FileCloseOthers);
  UpdKey(TbxItemFSaveAll, sm_FileSaveAll);
  UpdKey(TbxItemFRename, sm_FileRenameDialog);
  //
  UpdKey(TbxItemSResNext, sm_GotoNextFindResult);
  UpdKey(TbxItemSResPrev, sm_GotoPrevFindResult);

  UpdKey(TBXItemSMarkAll, smFindAll);
  UpdKey(tbxItemSMarkNext, smSearchMarkNext);
  UpdKey(tbxItemSMarkPrev, smSearchMarkPrev);
  UpdKey(tbxItemSMarkClear, smSearchMarkReset);

  UpdKey(TBXItemQs, sm_QuickSearch);
  UpdKey(tbxItemMarkDrop, smDropMarker);
  UpdKey(tbxItemMarkColl, smCollectMarker);
  UpdKey(tbxItemMarkSwap, smSwapMarker);
  UpdKey(tbxItemZIn, sm_ZoomIn);
  UpdKey(tbxItemZOut, sm_ZoomOut);

  UpdKey(TbxItemHtmlPreview, sm_OpenBrowserPreview);
  UpdKey(TbxItemHtmlLoremIpsum, sm_LoremIpsumDialog);

  UpdKey(TbxItemRunOpenFile, sm_OpenCurrentFile);
  UpdKey(TbxItemRunOpenDir, sm_OpenCurrentFolder);
  UpdKey(TbxItemRunFindPhp, sm_OpenPhp);
  UpdKey(TbxItemRunFindHtml4, sm_OpenHtml4Help);
  UpdKey(TbxItemRunFindHtml5, sm_OpenHtml5Help);
  UpdKey(TbxItemRunNumConv, sm_NumericConverterDialog);

  //file
  UpdKey(tbxItemFPrint, smPrint);
  UpdKey(tbxItemFPreview, smPrintPreview);
  UpdKey(tbxItemFNew, sm_FileNew);
  UpdKey(tbxItemFNewWin, sm_FileNewWindow);
  UpdKey(tbxItemFOpen, sm_FileOpen);
  UpdKey(tbxItemFReopen, sm_FileReopen);
  UpdKey(tbxItemFSave, sm_FileSave);
  UpdKey(tbxItemFSaveAs, sm_FileSaveAs);
  UpdKey(tbxItemFProps, sm_FileProps);

  UpdKey(tbxItemFavAddFile, sm_Fav_AddFile);
  UpdKey(tbxItemFavAddProj, sm_Fav_AddProject);
  UpdKey(tbxItemFavManage, sm_Fav_Organize);

  UpdKey(TBXItemFSesOpen, sm_FileOpenSession);
  UpdKey(TBXItemFSesSave, sm_FileSaveSession);
  UpdKey(TBXItemFSesSaveAs, sm_FileSaveSessionAs);
  UpdKey(TBXItemFSesAdd, sm_FileAddSession);
  UpdKey(TBXItemFSesClose, sm_FileCloseSession);

  UpdKey(tbxItemFExpHtml, sm_FileExportHtml);
  UpdKey(tbxItemFExpRtf, sm_FileExportRtf);
  UpdKey(tbxItemFPageSetup, smPageSetup);
  UpdKey(tbxItemFPrinterSetup, sm_PrinterSetup);

  //edit
  UpdKey(tbxItemEUndo, smUndo);
  UpdKey(tbxItemERedo, smRedo);
  UpdKey(tbxItemECut, smCut);
  UpdKey(tbxItemECopy, smCopy);
  UpdKey(tbxItemEPaste, smPaste);
  UpdKey(tbxItemEDelete, smClearSelection);
  UpdKey(tbxItemESelectAll, smSelectAll);

  UpdKey(tbxItemECopyApp, sm_CopyAppend);
  UpdKey(tbxItemECutApp, sm_CutAppend);
  UpdKey(tbxItemECopyLine, sm_CopyLine);
  UpdKey(tbxItemECutLine, sm_CutLine);

  UpdKey(tbxItemEDup, smDuplicateLine);
  UpdKey(tbxItemEDelLn, smDeleteLine);
  UpdKey(tbxItemETable, smSelCharacter);
  UpdKey(tbxItemEComm, smCommentLines);
  UpdKey(tbxItemEUncomm, smUncommentLines);
  UpdKey(tbxItemEIndent, smBlockIndent);
  UpdKey(tbxItemEUnindent, smBlockUnindent);
  UpdKey(tbxItemECaseUpper, smUpperCaseBlock);
  UpdKey(tbxItemECaseLower, smLowerCaseBlock);
  UpdKey(tbxItemECaseTitle, smTitleCaseBlock);
  UpdKey(tbxItemECaseInvert, smToggleCaseBlock);
  UpdKey(tbxItemECaseSent, smSentCaseBlock);

  //bookmk
  UpdKey(tbxItemG0, smSetBookmark0);
  UpdKey(tbxItemG1, smSetBookmark1);
  UpdKey(tbxItemG2, smSetBookmark2);
  UpdKey(tbxItemG3, smSetBookmark3);
  UpdKey(tbxItemG4, smSetBookmark4);
  UpdKey(tbxItemG5, smSetBookmark5);
  UpdKey(tbxItemG6, smSetBookmark6);
  UpdKey(tbxItemG7, smSetBookmark7);
  UpdKey(tbxItemG8, smSetBookmark8);
  UpdKey(tbxItemG9, smSetBookmark9);

  UpdKey(tbxItemB0, smGotoBookmark0);
  UpdKey(tbxItemB1, smGotoBookmark1);
  UpdKey(tbxItemB2, smGotoBookmark2);
  UpdKey(tbxItemB3, smGotoBookmark3);
  UpdKey(tbxItemB4, smGotoBookmark4);
  UpdKey(tbxItemB5, smGotoBookmark5);
  UpdKey(tbxItemB6, smGotoBookmark6);
  UpdKey(tbxItemB7, smGotoBookmark7);
  UpdKey(tbxItemB8, smGotoBookmark8);
  UpdKey(tbxItemB9, smGotoBookmark9);

  UpdKey(TBXItemBkGotoPortable, sm_GotoPortableBk);
  UpdKey(TBXItemBkDropPortable, sm_DropPortableBk);
  UpdKey(TbxItemBkGoto, sm_GotoBookmarkDialog);
  UpdKey(tbxItemBkClear, sm_BookmarksClear);
  UpdKey(tbxItemBkToggle, sm_BookmarksToggle);
  UpdKey(tbxItemBkNext, sm_BookmarksNext);
  UpdKey(tbxItemBkPrev, sm_BookmarksPrev);
  UpdKey(tbxItemBkCopy, sm_BookmarksCopy);
  UpdKey(tbxItemBkCut, sm_BookmarksCut);
  UpdKey(tbxItemBkDel, sm_BookmarksDelete);
  UpdKey(tbxItemBkDelUnmk, sm_BookmarksDeleteUnmarked);
  UpdKey(tbxItemBkPaste, sm_BookmarksPaste);
  UpdKey(tbxItemBkInverse, sm_BookmarksInverse);

  //opt
  UpdKey(tbxItemOSetup, sm_OptSetup);
  UpdKey(tbxItemOLexer, sm_OptSetupLexer);
  UpdKey(tbxItemOLexerLib, sm_OptSetupLexerLib);
  //search
  UpdKey(tbxItemSRep, smReplaceDialog);
  UpdKey(tbxItemSRepFiles, sm_ReplaceInFiles);
  UpdKey(tbxItemSFind, smFindDialog);
  UpdKey(tbxItemSNext, smFindNext);
  UpdKey(tbxItemSPrev, smFindPrev);
  UpdKey(tbxItemSWordNext, smFindCurrentWordNext);
  UpdKey(tbxItemSWordPrior, smFindCurrentWordPrior);
  UpdKey(tbxItemSGoto, smGotoLine);
  UpdKey(TBXItemSGoBracket, smChangeRangeSide);
  UpdKey(TbxItemSSelBrackets, sm_SelectBrackets);
  //
  UpdKey(tbxItemORO, sm_OptReadOnly);
  UpdKey(tbxItemOTree, sm_OptShowLeftPanel);
  UpdKey(tbxItemOOut, sm_OptShowOutputPanel);
  UpdKey(tbxItemOClip, sm_OptShowRightPanel);
  UpdKey(tbxItemOFold, sm_OptFolding);
  UpdKey(tbxItemOWrap, sm_OptWrap);
  UpdKey(tbxItemONums, sm_OptLineNums);
  UpdKey(tbxItemONPrint, sm_OptNonPrint);
  UpdKey(tbxItemORuler, sm_OptRuler);

  //=========popup menus
  //main popup
  UpdKey(TbxItemCtxUndo, smUndo);
  UpdKey(TbxItemCtxRedo, smRedo);
  UpdKey(TbxItemCtxCut, smCut);
  UpdKey(TbxItemCtxCopy, smCopy);
  UpdKey(TbxItemCtxPaste, smPaste);
  UpdKey(TbxItemCtxDel, smClearSelection);
  UpdKey(TbxItemCtxSelectAll, smSelectAll);
  UpdKey(TbxItemCtxCustomize, sm_OptSetup);
  UpdKey(TbxItemCtxCopyAppend, sm_CopyAppend);
  UpdKey(TbxItemCtxCutAppend, sm_CutAppend);
  UpdKey(TbxItemCtxCopyHTML, sm_CopyAsHTML);
  UpdKey(TbxItemCtxCopyRTF, sm_CopyAsRTF);
  UpdKey(TbxItemCtxPasteNoCurChange, sm_PasteNoCursorChange);
  UpdKey(TBXItemCtxPasteToColumn1, sm_PasteToColumn1);
  UpdKey(TBXItemCtxPasteAsColumn, sm_PasteAsColumnBlock);
  UpdKey(TBXItemCtxPasteBkmkLines, sm_BookmarksPaste);

  //clip popup menu
  UpdKey(TBXItemClipFind, smFindDialog);
  UpdKey_String(TBXItemClipCopyToEd, 'Enter');
  UpdKey_String(TBXItemClipCopyToClip, 'Ctrl+C');
  UpdKey_String(TBXItemClipClr, 'Shift+Delete');

  //clips popup menu
  UpdKey_String(TBXItemClipsAddText, 'Insert');
  UpdKey_String(TBXItemClipsDelText, 'Shift+Delete');

  //output popup menu
  UpdKey_String(TBXItemOutNav, 'Space');
  UpdKey_String(TBXItemOutClear, 'Delete');
  UpdKey(TBXItemOutFind, smFindDialog);

  //find results popup menu
  UpdKey_String(TBXItemTreeFindNav, 'Space');
  UpdKey_String(TBXItemTreeFindCopyToClipNode, 'Ctrl+C');
  UpdKey_String(TBXItemTreeFindClear, 'Delete');
  UpdKey(TBXItemTreeFindFind, smFindDialog);

  //validate popup menu
  UpdKey_String(TBXItemValNav, 'Space');
  //UpdKey_String(TBXItemValCopySel, 'Ctrl+C');
  UpdKey_String(TBXItemValClear, 'Delete');
  UpdKey(TBXItemValFind, smFindDialog);

  //tree popup menu
  UpdKey(TBXItemTreeFind, smFindDialog);

  //tab popup menu
  UpdKey(TBXItemTabClose, sm_FileClose);
  UpdKey(TBXItemTabCloseOthers, sm_FileCloseOthers);
  UpdKey(TBXItemTabNew, sm_FileNew);
  UpdKey(TBXItemTabCopyFN, sm_CopyFilename);
  UpdKey(TBXItemTabCopyFull, sm_CopyFullPath);
  UpdKey(TBXItemTabCopyDir, sm_CopyDirPath);
end;

procedure TfmMain.TBXItemHelpReadmeDirClick(Sender: TObject);
begin
  FOpenURL(SynDir + 'Readme', Handle);
end;

procedure TfmMain.TBXItemHelpTopicsClick(Sender: TObject);
begin
  FOpenURL(FHelpFilename, Handle);
end;

procedure TfmMain.TBXSubmenuEncPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateEncMenu(TbxSubmenuEnc);
end;

procedure TfmMain.TBXItemSMarkNextClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSearchMarkNext);
end;

procedure TfmMain.TBXItemSMarkPrevClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSearchMarkPrev);
end;

procedure TfmMain.TBXItemETableClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSelCharacter);
end;

procedure TfmMain.TBXSubmenuItemLexerPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateLexList;
  TbxSubmenuItemLexer.LinkSubitems:= PopupLexers.Items;
end;

procedure TfmMain.TBXItemEDupClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smDuplicateLine);
end;

function TfmMain.GetTheme: string;
begin
  Result:= FCurrTheme;
end;

procedure TfmMain.SetTheme(const S: string);
begin
  FCurrTheme:= S;
  if S=cThemeWindows then
    SkinManager.SetToDefaultSkin
  else
  if Pos('*', S)=1 then
  begin
    SkinManager.SetToDefaultSkin;
    SkinManager.LoadFromFile(SynSkinFilename(S));
  end
  else
    SkinManager.SetSkin(S);
end;

procedure TfmMain.LoadTools;
begin
  DoLoadToolList(opTools, SynIni, 'Tool');
  UpdateTools;
end;

procedure TfmMain.DoEnableTool(T: TSpTbxItem; n: integer; ForCtx: boolean = false);
begin
  if CurrentFrame <> nil then
  with CurrentFrame.EditorMaster.TextSource do
  with opTools[n] do
   if not ForCtx or ToolContextItem then
   begin
     T.Caption:= ToolCaption;
     T.Enabled:= (ToolCaption <> '') and (ToolCommand <> '') and
       ((ToolLexer = '') or ((SyntaxAnalyzer <> nil) and (SyntaxAnalyzer.LexerName = ToolLexer)));
     if T.Enabled and not ForCtx then
       T.ShortCut:= TextToShortcut(ToolKeys)
     else
       T.ShortCut:= 0;
     T.Visible:= T.Enabled;
     T.Hint:= ToolCommand;
     T.OnSelect:= ButtonOnSelect;
   end
   else
   begin
     T.Visible:= false;
     T.ShortCut:= 0;
   end;
end;

procedure TfmMain.UpdateTools;
begin
  DoEnableTool(TbxItemTool1, 1);
  DoEnableTool(TbxItemTool2, 2);
  DoEnableTool(TbxItemTool3, 3);
  DoEnableTool(TbxItemTool4, 4);
  DoEnableTool(TbxItemTool5, 5);
  DoEnableTool(TbxItemTool6, 6);
  DoEnableTool(TbxItemTool7, 7);
  DoEnableTool(TbxItemTool8, 8);
  DoEnableTool(TbxItemTool9, 9);
  DoEnableTool(TbxItemTool10, 10);
  DoEnableTool(TbxItemTool11, 11);
  DoEnableTool(TbxItemTool12, 12);
  DoEnableTool(TbxItemTool13, 13);
  DoEnableTool(TbxItemTool14, 14);
  DoEnableTool(TbxItemTool15, 15);
  DoEnableTool(TbxItemTool16, 16);

  DoEnableTool(TbxItemCtxTool1, 1, true);
  DoEnableTool(TbxItemCtxTool2, 2, true);
  DoEnableTool(TbxItemCtxTool3, 3, true);
  DoEnableTool(TbxItemCtxTool4, 4, true);
  DoEnableTool(TbxItemCtxTool5, 5, true);
  DoEnableTool(TbxItemCtxTool6, 6, true);
  DoEnableTool(TbxItemCtxTool7, 7, true);
  DoEnableTool(TbxItemCtxTool8, 8, true);
  DoEnableTool(TbxItemCtxTool9, 9, true);
  DoEnableTool(TbxItemCtxTool10, 10, true);
  DoEnableTool(TbxItemCtxTool11, 11, true);
  DoEnableTool(TbxItemCtxTool12, 12, true);
  DoEnableTool(TbxItemCtxTool13, 13, true);
  DoEnableTool(TbxItemCtxTool14, 14, true);
  DoEnableTool(TbxItemCtxTool15, 15, true);
  DoEnableTool(TbxItemCtxTool16, 16, true);
end;

procedure TfmMain.SaveTools;
begin
  DoSaveToolList(opTools, SynIni, 'Tool');
  UpdateTools;
end;

procedure TfmMain.TBXItemOToolsClick(Sender: TObject);
begin
  DoConfigTools;
end;

procedure TfmMain.DoConfigTools;
var
  L: TTntStringList;
begin
  L:= TTntStringList.Create;
  try
    L.Sorted:= true;
    L.Duplicates:= dupIgnore;
    DoEnumLexers(L);

    if DoCustomizeToolList(opTools, Self, L, true, CurrentFrame.CurrentLexer) then
    begin
      Application.ProcessMessages;
      SaveTools;
      ListOut.Invalidate;
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled:= false;
  StatusItemHint.Caption:= '';
end;

procedure TfmMain.DKLanguageController1LanguageChanged(Sender: TObject);
begin
  UpdateLang;
end;

procedure TfmMain.UpdateLang;
begin
  UpdateTitle(CurrentFrame);
  UpdateStatusBar;

  //other
  StatusItemBusy.Hint:= DKLangConstW('MBusyIco');
  //TbxItemSplitCaption.Caption:= DKLangConstW('Split_Vw');
  if SyntaxManager.CurrentLexer = nil then
    StatusItemLexer.Caption:= DKLangConstW('None');

  //Project items:
  SMsgProjNew:= DKLangConstW('Untitled');

  //TBX toolbars:
  tbQS.ChevronHint:= DKLangConstW('MoreB');
  tbFile.ChevronHint:= tbQS.ChevronHint;
  tbEdit.ChevronHint:= tbQS.ChevronHint;
  tbView.ChevronHint:= tbQS.ChevronHint;
  //tbTabsLeft.ChevronHint:= tbQS.ChevronHint;
  //tbTabsRight.ChevronHint:= tbQS.ChevronHint;
  //tbTabsOut.ChevronHint:= tbQS.ChevronHint;
  tbUser1.ChevronHint:= tbQS.ChevronHint;
  tbUser2.ChevronHint:= tbQS.ChevronHint;
  tbUser3.ChevronHint:= tbQS.ChevronHint;
  if Assigned(fmProj) then
    fmProj.tbProject.ChevronHint:= tbQS.ChevronHint;

  //TNT Controls:
  _SMsgDlgWarning:= DKLangConstW('sWarn');
  _SMsgDlgConfirm:= DKLangConstW('sCf');
  _SMsgDlgYes:= DKLangConstW('sy');
  _SMsgDlgNo:= DKLangConstW('sn');
  _SMsgDlgOK:= DKLangConstW('sOk');
  _SMsgDlgCancel:= DKLangConstW('sCan');
  _SMsgDlgAll:= DKLangConstW('sAll');
  _SMsgDlgYesToAll:= DKLangConstW('sYAll');
  _SMsgDlgNoToAll:= DKLangConstW('sNAll');

  //Statusbar items:
  cStatLine:=     ' '+DKLangConstW('stat_line')+' ';
  cStatCol:=      ' '+DKLangConstW('stat_col')+' ';
  cStatSelLines:= ' '+DKLangConstW('stat_sellines')+' ';
  cStatSelCols:=  ' '+DKLangConstW('stat_selcols')+' ';
  cStatSelChars:= ' '+DKLangConstW('stat_selchars')+' ';
  cStatTLines:=   ' '+DKLangConstW('stat_tlines')+' ';
  cStatTChars:=   ' '+DKLangConstW('stat_tchars')+' ';
  cStatFSize:=    ' '+DKLangConstW('stat_fsize')+' ';
  cStatFDate:=    ' '+DKLangConstW('stat_fdate')+' ';
  cStatCarets:=   ' '+DKLangConstW('stat_carets')+' ';
  cStatCaretsTopLn:= ' '+DKLangConstW('stat_carets_top')+' ';
  cStatCaretsBotLn:= ' '+DKLangConstW('stat_carets_btm')+' ';

  FUpdatePluginsLang:= true;
end;

procedure TfmMain.UpdateSpellLang;
begin
  {$ifdef SPELL}
  if Assigned(FSpell) then
      case LangManager.LanguageID of
        1031: FSpell.UILanguage:= ltGerman;
        1049: FSpell.UILanguage:= ltRussian;
        1040: FSpell.UILanguage:= ltItalian;
        3082: FSpell.UILanguage:= ltSpanish;
        1029: FSpell.UILanguage:= ltCzech;
        else FSpell.UILanguage:= ltEnglish;
      end;
  {$endif}
end;

procedure TfmMain.ecACPCloseUp(Sender: TObject; var Accept: Boolean);
begin
  if not Accept then
  begin
    //delete space if added on ACP call
    if FAcpHtm and FAcpHtmSpaceAdded then
      with CurrentEditor do
        if Lines.Chars[CaretStrPos+1] = ' ' then
          DeleteText(1);
  end;

  FAcpHtmSpaceAdded:= false;
end;


procedure FixListScroll(L: TTntListBox);
var
  i, n: integer;
begin
  n:= 50;
  L.Canvas.Font.Assign(L.Font);
  for i:= 0 to L.Count-1 do
    n:= Max(n, ecTextExtent(L.Canvas, L.Items[i]).cx);
  L.ScrollWidth:= n+4;
end;

procedure FixListOutput(L: TWideStringList; NoTags, NoDups: boolean;
  Enc: TOutputEnc; const TabStr: Widestring);
var
  i: Integer;
  S: Widestring;
begin
  L.BeginUpdate;
  try
    if NoTags then
      for i:= 0 to L.Count-1 do
        L[i]:= SDeleteTags(L[i]);
    if NoDups then
      for i:= L.Count-1 downto 1 do
        if L[i-1] = L[i] then
          L.Delete(i);
    //Encoding
    case Enc of
      encOem:
      begin
        for i:= 0 to L.Count-1 do
          L[i]:= AnsiToUnicodeCP(L[i], CP_OEMCP);
      end;
      encUtf8:
      begin
        for i:= 0 to L.Count-1 do
          L[i]:= UTF8Decode(AnsiString(L[i]));
      end;
    end;
    //TabSize
    for i:= 0 to L.Count-1 do
    begin
      S:= L[i];
      if Pos(#9, S)>0 then
      begin
        SReplaceAllW(S, #9, TabStr);
        L[i]:= S;
      end;
    end;
  finally
    L.EndUpdate;
  end;
end;

procedure TfmMain.DoReplaceFileNameMacro(var Str: Widestring; const StrId: string; ViewId: TSynGroupId);
  //
  function SMacro(const MacroName: string): string;
  begin
    Result:= '{'+MacroName+StrId+'}';
  end;
var
  fn: Widestring;
begin
  fn:= CurrentFileName(ViewId);
  SReplaceW(Str, SMacro('FileName'), fn);
  SReplaceW(Str, SMacro('FileNameOnly'), WideExtractFileName(fn));
  SReplaceW(Str, SMacro('FileNameNoExt'), WideChangeFileExt(WideExtractFileName(fn), ''));
  SReplaceW(Str, SMacro('FileDir'), WideExtractFileDir(fn));
  SReplaceW(Str, SMacro('FileExt'), Copy(WideExtractFileExt(fn), 2, MaxInt));
end;

procedure TfmMain.RunTool(const ATool: TSynTool);
  //
  function HandleParams(const s, dir: WideString): WideString;
  var
    fn, SValue: Widestring;
	  p: TPoint;
  begin
    Result:= S;
    p:= CurrentEditor.CaretPos;
    //
    DoReplaceFileNameMacro(Result, '', cSynGroupCurrent);
    DoReplaceFileNameMacro(Result, '2', cSynGroupOpposite);
    DoReplaceFileNameMacro(Result, 'N1', cSynGroup1);
    DoReplaceFileNameMacro(Result, 'N2', cSynGroup2);
    DoReplaceFileNameMacro(Result, 'N3', cSynGroup3);
    DoReplaceFileNameMacro(Result, 'N4', cSynGroup4);
    DoReplaceFileNameMacro(Result, 'N5', cSynGroup5);
    DoReplaceFileNameMacro(Result, 'N6', cSynGroup6);
    //
    SReplaceW(Result, '{ProjectDir}', CurrentProjectDir);
    SReplaceW(Result, '{ProjectWorkDir}', CurrentProjectWorkDir);
    SReplaceW(Result, '{ProjectMainFileName}', CurrentProjectMainFN);
    SReplaceW(Result, '{ProjectMainFileDir}', WideExtractFileDir(CurrentProjectMainFN));
    //
    SReplaceW(Result, '{CurrentWord}', CurrentEditor.WordAtPos(p));
    SReplaceW(Result, '{CurrentLineNum}', IntToStr(p.Y+1));
    SReplaceW(Result, '{CurrentColumnNum}', IntToStr(p.X+1));
    if (p.Y >= 0) and (p.Y < CurrentEditor.Lines.Count) then
      SReplaceW(Result, '{CurrentLine}', CurrentEditor.Lines[p.Y]);
    //
    SValue:= SReplaceAllEols(CurrentEditor.SelText, ' ');
    SReplaceW(Result, '{SelectedText}', SValue);

    if Pos('{SelectionFileName}', Result)>0 then
      SReplaceW(Result, '{SelectionFileName}', CurrentSelectionFN(true));
    if Pos('{SelectionFileNameAnsi}', Result)>0 then
      SReplaceW(Result, '{SelectionFileNameAnsi}', CurrentSelectionFN(false));
    if Pos('{SelectedTextForWeb}', Result)>0 then
      SReplaceW(Result, '{SelectedTextForWeb}', EditorSelectedTextForWeb(CurrentEditor));
    //
    if Pos('{ContentFileName}', Result)>0 then
      SReplaceW(Result, '{ContentFileName}', CurrentContentFN(true));
    if Pos('{ContentFileNameAnsi}', Result)>0 then
      SReplaceW(Result, '{ContentFileNameAnsi}', CurrentContentFN(false));
    //
    SReplaceW(Result, '{SynDir}', ExtractFileDir(SynDir));
    SReplaceW(Result, '{SynIniDir}', ExtractFileDir(SynIni));
    SReplaceW(Result, '{SynDrive}', ExtractFileDrive(SynDir));
    //
	  while Pos('{Interactive}', Result)>0 do
    begin
      fn:= '';
      if not DoInputString(DKLangConstW('cmdInt'), fn, SynHistoryIni, 'ExtToolParam') then
        raise Exception.Create('Param input cancelled');
      SReplaceW(Result, '{Interactive}', fn);
    end;
    //
	  while Pos('{InteractiveFile}', Result)>0 do
    begin
      fn:= '';
      if not WidePromptForFileName(fn, '', '',
        DKLangConstW('cmdIFile'), dir) then
        raise Exception.Create('Filename input cancelled');
      SReplaceW(Result, '{InteractiveFile}', fn);
    end;
    //
	  while Pos('{InteractiveDir}', Result)>0 do
    begin
      fn:= dir;
      if not WideSelectDirectory(
        DKLangConstW('cmdIDir'), '', fn) then
        raise Exception.Create('Dir name input cancelled');
      SReplaceW(Result, '{InteractiveDir}', fn);
    end;
    //
    //user variables (from project)
    if Assigned(fmProj) then
      fmProj.ReplaceUserVars(Result, '', SValue);
  end;
var
  ft, fcmd, fpar, frun, fexe, fdir,
  SCurWord: Widestring;
begin
  if CurrentFrame=nil then Exit;
  with ATool do
  begin
    //check correctness of tool params
    if (Pos('{File', ToolParams)>0) and (CurrentFrame.FileName='') then
      begin MsgWarn(DKLangConstW('NSaved'), Handle); Exit end;

    if (Pos('{Select', ToolParams)>0) and not CurrentEditor.HaveSelection then
      begin MsgNoSelection; Exit end;

    if (Pos('{ProjectWorkDir}', ToolParams)>0) and (CurrentProjectWorkDir='') then
      begin MsgEmptyMacro('{ProjectWorkDir}'); Exit end;
    if (Pos('{ProjectMainFileName}', ToolParams)>0) and (CurrentProjectMainFN='') then
      begin MsgEmptyMacro('{ProjectMainFileName}'); Exit end;
    if (Pos('{ProjectMainFileDir}', ToolParams)>0) and (CurrentProjectMainFN='') then
      begin MsgEmptyMacro('{ProjectMainFileDir}'); Exit end;

    if ToolCommand = '' then
      begin MsgBeep; Exit end;

    //expand macros in "File name", "Initial dir" fields
    fexe:= ToolCommand;
    SReplaceW(fexe, '{SynDir}', ExtractFileDir(SynDir));
    SReplaceW(fexe, '{SynIniDir}', ExtractFileDir(SynIni));

    fdir:= ToolDir;
    SReplaceW(fdir, '{SynDir}', ExtractFileDir(SynDir));
    SReplaceW(fdir, '{SynIniDir}', ExtractFileDir(SynIni));

    //save files if needed
    case ToolSaveMode of
      svCurrent:
        if CurrentFrame.Modified then
          acSave.Execute;
      svAll:
        acSaveAll.Execute;
    end;

    //CHM file
    if SFileExtensionMatch(fexe, 'chm') then
    begin
      if not IsFileExist(fexe) then
        begin MsgNoFile(fexe); Exit end;

      if CurrentEditor.SelLength>0 then
        SCurWord:= CurrentEditor.SelText
      else
        SCurWord:= CurrentEditor.WordAtPos(CurrentEditor.CaretPos);
      SDeleteFromW(SCurWord, #13);
      SDeleteFromW(SCurWord, #10);
      if Trim(SCurWord)='' then
        begin MsgNoSelectionForHelp; Exit end;

      frun:= SynDir + 'Tools\HtmlHelpView.exe';
      if not IsFileExist(frun) then
        begin MsgNoFile(frun); Exit end;

      FExecute(frun,
        '"'+fexe+'" "'+SCurWord+'"',
        '', Handle);
      Exit;
    end;

    //HLP file
    if SFileExtensionMatch(fexe, 'hlp') then
    begin
      if not IsFileExist(fexe) then
        begin MsgNoFile(fexe); Exit end;

      if CurrentEditor.SelLength>0 then
        SCurWord:= CurrentEditor.SelText
      else
        SCurWord:= CurrentEditor.WordAtPos(CurrentEditor.CaretPos);
      SDeleteFromW(SCurWord, #13);
      SDeleteFromW(SCurWord, #10);
      if Trim(SCurWord)='' then
        begin MsgNoSelectionForHelp; Exit end;

      Application.HelpSystem.Hook(
        Longint(Handle),
        string(fexe),
        HELP_PARTIALKEY,
        Integer(PChar(string(SCurWord))));
      Exit;
    end;

    if not ToolOutCapture then
    //don't handle output
    begin
      fdir:= SExpandVars(fdir);
      if fdir='' then
        fdir:= SExtractFileDir(CurrentFrame.FileName);

      try
        frun:= SExpandVars(fexe);
        frun:= HandleParams(frun, fdir);
      except
        Exit
      end;

      try
        fpar:= SExpandVars(ToolParams);
        fpar:= HandleParams(fpar, fdir);
      except
        Exit
      end;

      if not FExecute(frun, fpar, fdir, Handle) then
        begin MsgNoRun(frun); Exit end;
    end
    else
    //handle output by running cmd.exe
    begin
      ft:= FGetTempFilenameDeleted();
      if IsFileExist(ft) then
        begin MsgError('Cannot delete temp file: '#13+ft, Handle); Exit end;

      fdir:= SExpandVars(fdir);
      if fdir='' then
        fdir:= SExtractFileDir(CurrentFrame.FileName);
      if fdir='' then
        fdir:= FTempDir;

      try
        frun:= SExpandVars(fexe);
        frun:= HandleParams(frun, fdir);
      except
        Exit
      end;

      try
        fpar:= SExpandVars(ToolParams);
        fpar:= HandleParams(fpar, fdir);
      except
        Exit
      end;

      fcmd:= WideFormat('cmd.exe /c""%s" %s >"%s" 2>&1"', [frun, fpar, ft]);

      Screen.Cursor:= crHourGlass;
      try
        FDelete(ft);
        if FExecProcess(fcmd, fdir, sw_hide, true{Wait})=exCannotRun then
          begin MsgNoRun(frun); Exit end;
      finally
        Screen.Cursor:= crDefault;
      end;

      DoHandleToolOutput(ft, ATool);
    end;
  end;
end;

procedure TfmMain.TbxItemTool1Click(Sender: TObject);
begin
  RunTool(opTools[1]);
end;

procedure TfmMain.TbxItemTool2Click(Sender: TObject);
begin
  RunTool(opTools[2]);
end;

procedure TfmMain.TbxItemTool3Click(Sender: TObject);
begin
  RunTool(opTools[3]);
end;

procedure TfmMain.TbxItemTool4Click(Sender: TObject);
begin
  RunTool(opTools[4]);
end;

procedure TfmMain.TBXItemTool5Click(Sender: TObject);
begin
  RunTool(opTools[5]);
end;

procedure TfmMain.TBXItemTool6Click(Sender: TObject);
begin
  RunTool(opTools[6]);
end;

procedure TfmMain.TBXItemTool7Click(Sender: TObject);
begin
  RunTool(opTools[7]);
end;

procedure TfmMain.TBXItemTool8Click(Sender: TObject);
begin
  RunTool(opTools[8]);
end;

procedure TfmMain.TBXItemTool9Click(Sender: TObject);
begin
  RunTool(opTools[9]);
end;

procedure TfmMain.TBXItemTool10Click(Sender: TObject);
begin
  RunTool(opTools[10]);
end;

procedure TfmMain.TBXItemTool11Click(Sender: TObject);
begin
  RunTool(opTools[11]);
end;

procedure TfmMain.TBXItemTool12Click(Sender: TObject);
begin
  RunTool(opTools[12]);
end;

procedure TfmMain.TBXItemTool13Click(Sender: TObject);
begin
  RunTool(opTools[13]);
end;

procedure TfmMain.TBXItemTool14Click(Sender: TObject);
begin
  RunTool(opTools[14]);
end;

procedure TfmMain.TBXItemTool15Click(Sender: TObject);
begin
  RunTool(opTools[15]);
end;

procedure TfmMain.TBXItemTool16Click(Sender: TObject);
begin
  RunTool(opTools[16]);
end;

procedure TfmMain.TBXSubmenuItemRunPopup(Sender: TTBCustomItem; FromLink: Boolean);
begin
  TBXItemRunOpenDir.Enabled:= CurrentFrame.Filename <> '';
  TBXItemRunOpenFile.Enabled:= TBXItemRunOpenDir.Enabled;
  UpdateTools;
end;

procedure TfmMain.TBXItemZInClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ZoomIn);
end;

procedure TfmMain.TBXItemZOutClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ZoomOut);
end;

procedure TfmMain.TBXItemZ0Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ZoomOriginal);
end;

procedure TfmMain.TBXItemMarkDropClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smDropMarker);
end;

procedure TfmMain.TBXItemMarkCollClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smCollectMarker);
end;

procedure TfmMain.TBXItemMarkSwapClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSwapMarker);
end;

procedure TfmMain.TBXItemTFileClick(Sender: TObject);
begin
  with tbFile do
    Visible:= not Visible;
  UpdateStatusBar;
  SaveToolbarsProps;
end;

procedure TfmMain.TBXItemTEditClick(Sender: TObject);
begin
  with tbEdit do
    Visible:= not Visible;
  UpdateStatusBar;
  SaveToolbarsProps;
end;

procedure TfmMain.TBXItemTViewClick(Sender: TObject);
begin
  with tbView do
    Visible:= not Visible;
  UpdateStatusBar;
  SaveToolbarsProps;
end;

procedure TfmMain.TBXItemTQsClick(Sender: TObject);
begin
  with tbQs do
    Visible:= not Visible;
  if not tbQs.Visible then
    FocusEditor;
  UpdateStatusBar;
  SaveToolbarsProps;
end;

procedure TfmMain.SaveToolbarsProps;
var
  Ini: TIniFile;
begin
  if ShowFullScreen then Exit;
  Ini:= TIniFile.Create(SynIni);
  try
    SaveToolbarProp(tbFile, Ini, 'File');
    SaveToolbarProp(tbEdit, Ini, 'Edit');
    SaveToolbarProp(tbView, Ini, 'View');
    SaveToolbarProp(tbQs, Ini, 'Qs');
    SaveToolbarProp(tbUser1, Ini, 'U1');
    SaveToolbarProp(tbUser2, Ini, 'U2');
    SaveToolbarProp(tbUser3, Ini, 'U3');
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.tbQsClose(Sender: TObject);
begin
  UpdateStatusBar;
  SaveToolbarsProps;
end;

procedure TfmMain.DoQuickSearch(AMode: TSynQuickSearchType);
var
  bBeep, bFound: boolean;
begin
  if edQs.Text<>'' then
  begin
    Finder.FindText:= edQs.Text;
    Finder.Flags:= [ftWrapSearch];
    if cbCase.Checked then
      Finder.Flags:= Finder.Flags + [ftCaseSens];
    if cbWord.Checked then
      Finder.Flags:= Finder.Flags + [ftWholeWords];

    bBeep:= opBeep;
    opBeep:= false;
    try
      case AMode of
        cQsNext: bFound:= Finder.FindNext;
        cQsPrev: bFound:= Finder.FindPrev;
        cQsAgain: bFound:= Finder.FindFirst;
        else bFound:= false;
      end;
    finally
      opBeep:= bBeep;
    end;

    if not bFound then
      edQs.Color:= cColorNotFound
    else
      edQs.Color:= clWindow;
  end
  else
    edQs.Color:= clWindow;
end;

procedure TfmMain.TBXItemFFPrevClick(Sender: TObject);
begin
  DoQuickSearch(cQsPrev);
end;

procedure TfmMain.TBXItemFFNextClick(Sender: TObject);
begin
  DoQuickSearch(cQsNext);
end;

procedure TfmMain.cbCaseClick(Sender: TObject);
begin
  cbCase.Checked:= not cbCase.Checked;
  edQsChange(Self);
end;

procedure TfmMain.edQsChange(Sender: TObject);
begin
  TBXItemFFNext.Enabled:= edQs.Text <> '';
  TBXItemFFPrev.Enabled:= TBXItemFFNext.Enabled;
  DoQuickSearch(cQsAgain);
end;

procedure TfmMain.TBXItemQsClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_QuickSearch);
end;

procedure TfmMain.edQsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_return) and (Shift=[]) then
  begin
    TbxItemFFNextClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=vk_return) and (Shift=[ssShift]) then
  begin
    TbxItemFFPrevClick(Self);
    Key:= 0;
    Exit
  end;
end;

procedure TfmMain.ApplyQs;
begin
  //find next/prev
  if opShowQsCaptions then
    TbxItemFFNext.DisplayMode:= nbdmImageAndText
  else
    TbxItemFFNext.DisplayMode:= nbdmDefault;
  TbxItemFFPrev.DisplayMode:= TbxItemFFNext.DisplayMode;

  //case/words
  if opShowQsCaptions then
    cbCase.DisplayMode:= nbdmTextOnly
  else
    cbCase.DisplayMode:= nbdmDefault;
  cbWord.DisplayMode:= cbCase.DisplayMode;
end;

procedure TfmMain.cbWordClick(Sender: TObject);
begin
  cbWord.Checked:= not cbWord.Checked;
  edQsChange(Self);
end;

procedure TfmMain.TBXItemSMarkAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smFindAll);
end;

//wrap around CloseFrame, ask for saving etc
procedure TfmMain.CloseFrameWithCfm(F: TEditorFrame;
  var ACanClose, ACanContinue: boolean);
begin
  UpdateColorHint;
  if QuickView then Exit;
  if F=nil then Exit;

  if F.Modified and F.IsAlertEnabled then
    case FrameAskToSave(F, False, ACanContinue) of
      mrYes:
      begin
        SaveFrame(F, False);
        ACanClose:= true;
        ACanContinue:= true;
        F.Modified:= false; //needed if selected Cancel in SaveDialog
      end;
      mrNo:
      begin
        ACanClose:= true;
        ACanContinue:= true;
        F.Modified:= false;
      end;
      mrCancel:
      begin
        ACanClose:= false;
        ACanContinue:= false;
      end;
    end;

  if ACanClose then
    CloseFrame(F);

  UpdateTabList(Groups.PagesCurrent.Tabs.TabIndex, -1, -1);
end;

procedure TfmMain.TBXItemTabCloseClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseCurrent, true);
end;

procedure TfmMain.TBXItemTabNewClick(Sender: TObject);
begin
  if Groups.PopupPages<>nil then
    DoAddTab(Groups.PopupPages);
end;

function TfmMain.SNewDocName(const fn: Widestring): string;
var
  an: TSyntAnalyzer;
  s: string;
begin
  Result:= ChangeFileExt(ExtractFileName(fn), '');
  SDeleteFrom(Result, '_'); //"_UTF8" suffix may exist

  s:= '?';
  an:= SyntaxManager.AnalyzerForFile(fn);
  if an<>nil then s:= an.LexerName;

  Result:= s + #9 + Result;
end;

procedure TfmMain.DoNewDoc(const fn: Widestring);
var
  Enc: Integer;
  Ini: TIniFile;
  Ed: TSyntaxMemo;
begin
  if not IsFileExist(fn) then Exit;

  //add template to MRU list
  Ini:= TIniFile.Create(SynHistoryIni);
  try
    SynMruNewdoc.AddItem(fn);
    SaveMruList(SynMruNewdoc, Ini, 'MRU_Newdoc');
  finally
    FreeAndNil(Ini);
  end;

  //calculate encoding, consider "_UTF8" filename suffix
  Enc:= CP_ACP;
  if Pos('_UTF8', ExtractFileName(fn))>0 then
    Enc:= cp__UTF8_noBOM;

  //need new tab?
  if (CurrentFrame.FileName<>'') or (CurrentEditor.Lines.Count>0) then
    acNewTab.Execute;

  //load template file
  Ed:= CurrentEditor;
  Ed.LoadFromFile(fn);
  Ed.Modified:= true;

  Ed.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(fn);
  UpdateLexerTo(Ed.TextSource.SyntaxAnalyzer);

  //apply encoding
  ApplyFrameEncodingAndReload(CurrentFrame, Enc);
end;

//tab X button rect
procedure TabCtrl_GetXRect(H: THandle; TabIndex: Integer; var R: TRect);
const
  BtnSize = 15; //X button size in SpTbx
begin
  TabCtrl_GetItemRect(H, TabIndex, R);
  Dec(R.Right, 4);
  R.Left:= R.Right - BtnSize;
  R.Top:= (R.Bottom + R.Top - BtnSize) div 2 + 1;
  R.Bottom:= R.Top + BtnSize;
end;

procedure TfmMain.acCloseExecute(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseCurrent, false);
end;

//show filename in statusbar, truncated if needed
procedure TfmMain.DoShowHintFilename(const fn: Widestring);
var
  bmp: TBitmap;
  size: integer;
begin
  //width of last panel
  size:= Status.ClientWidth - 8 - Status.View.Find(StatusItemHint).BoundsRect.Left;

  bmp:= TBitmap.Create;
  try
    bmp.Canvas.Font.Assign(Status.Font);
    DoHint(WideMinimizeName(fn, bmp.Canvas, size));
  finally
    FreeAndNil(bmp);
  end;
end;

procedure TfmMain.acSaveAllExecute(Sender: TObject);
var
  i: Integer;
  F: TEditorFrame;
begin
  for i:= 0 to FrameAllCount-1 do
  begin
    F:= FramesAll[i];
    if F.Modified then
    begin
      SaveFrame(F, False);
      F.Modified:= False;
    end;
  end;
end;

procedure TfmMain.acCloseAllExecute(Sender: TObject);
begin
  DoCloseAllTabs;
end;

procedure TfmMain.acCloseOthersThisGroupExecute(Sender: TObject);
begin
  DoCloseOtherTabs(false, false);
end;

procedure TfmMain.acCloseOthersAllGroupsExecute(Sender: TObject);
begin
  DoCloseOtherTabs(true, false);
end;

procedure TfmMain.TBXItemTabCloseOthersClick(Sender: TObject);
begin
  DoCloseOtherTabs(false, true);
end;

procedure TfmMain.TBXItemTabCloseOthersAllGroupsClick(Sender: TObject);
begin
  DoCloseOtherTabs(true, true);
end;

procedure TfmMain.UpdateClickedFrame;
var
  N, NPages, NTab: Integer;
begin
  FClickedFrame:= nil;

  //handle right-click over Tabs panel
  if ListTabs.Visible and plTree.Visible then
    if PtInControl(ListTabs, Mouse.CursorPos) then
    begin
      N:= ListTab_FrameIndex;
      if N>=0 then
      begin
        FClickedFrame:= FramesAll[N];

        //set PopupPages/PopupTabIndex, so context menu will work on Tabs panel
        Groups.PagesAndTabIndexOfControl(FClickedFrame, NPages, NTab);
        if NPages>0 then
          Groups.PopupPages:= Groups.Pages[NPages];
        Groups.PopupTabIndex:= NTab;
      end;
      Exit;
    end;

  //handle right-click over tabs  
  with Groups do
    if (PopupPages<>nil) and (PopupTabIndex>=0) then
      FClickedFrame:= PopupPages.Tabs.GetTabData(PopupTabIndex).TabObject as TEditorFrame;
end;

procedure TfmMain.PopupTabContextPopup(Sender: TObject);
var
  en_all, en_named, enProj, enWinMove, enWinOpen: boolean;
  F: TEditorFrame;
begin
  UpdateClickedFrame;
  F:= FClickedFrame;

  en_all:= F<>nil;
  en_named:= en_all and (F.FileName<>'');
  enProj:= en_all and Assigned(fmProj) and plTree.Visible;
  enWinOpen:= en_all and SynExe and not opSingleInstance;
  enWinMove:= en_all and enWinOpen and not F.Modified and (FrameAllCount>1);

  TBXSubmenuItemToGroup.Enabled:= en_all and (Groups.PopupTabIndex>=0);
  TBXSubmenuTabColor.Enabled:= en_all;

  TBXItemTabNew.Enabled:= en_all;
  TBXItemTabClose.Enabled:= en_all;
  TBXItemTabCloseOthers.Enabled:= en_all and (FrameAllCount>1);
  TBXItemTabCloseOthersAllGroups.Enabled:= TBXItemTabCloseOthers.Enabled and (Groups.PagesVisibleCount>1);

  TBXItemTabReload.Enabled:= en_all;
  TBXItemTabToggleSplit.Enabled:= en_all;
  TBXItemTabToggleSplit.Checked:= en_all and F.IsSplitted;

  TBXItemTabCopyFN.Enabled:= en_named;
  TBXItemTabCopyFull.Enabled:= en_named;
  TBXItemTabCopyDir.Enabled:= en_named;

  TBXItemTabMoveToWindow.Enabled:= en_named and enWinMove;
  TBXItemTabOpenInWindow.Enabled:= en_named and enWinOpen;
  TBXItemTabAddToProj.Enabled:= en_named and enProj;
end;

procedure TfmMain.TBXItemFSesSaveAsClick(Sender: TObject);
begin
  DoSaveSessionAs;
end;

procedure TfmMain.DoSaveSessionAs;
var
  i: Integer;
begin
  for i:= 0 to FrameCount-1 do
    if Frames[i].FileName = '' then
    begin
      if WideMessageDlg(DKLangConstW('MEmp'), mtWarning, [mbOk, mbCancel], 0) = mrOk
        then Break else Exit;
    end;

  with SD_Session do
  begin
    InitialDir:= opLastDirSession;
    //suggest foldername of curr. file as session name
    if CurrentFrame.FileName<>'' then
      FileName:= WideChangeFileExt(WideExtractFileName(WideExtractFileDir(CurrentFrame.FileName)), '')
    else
      FileName:= '';
    if Execute then
    begin
      SaveLastDir_Session(FileName);
      DoSaveSessionToFile(FileName);
      SynMruSessions.AddItem(FileName);
      UpdateTitle(CurrentFrame);
    end;
  end;
end;

procedure TfmMain.DoSaveSessionToFile(const fn: string);
const
  cSess = 'sess';
var
  i, Num: Integer;
  F: TEditorFrame;
  Str, SSec: string;
begin
  FSessionFN:= fn;

  //session dir may not exist, for portable install
  Str:= SExtractFileDir(fn);
  if not IsDirExist(Str) then
    CreateDir(Str);

  try
    with TIniFile.Create(fn) do
    try
      WriteInteger(cSess, 'gr_mode', Ord(Groups.Mode));
      WriteInteger(cSess, 'gr_act', Groups.PagesIndexOf(Groups.PagesCurrent));
      WriteInteger(cSess, 'split', Groups.SplitPos);

      Str:= '';
      for i:= Low(Groups.Pages) to High(Groups.Pages) do
        Str:= Str+IntToStr(Groups.Pages[i].Tabs.TabIndex)+',';
      WriteString(cSess, 'tab_act', Str);

      Num:= -1;
      for i:= 0 to FrameAllCount-1 do
      begin
        F:= FramesAll[i];
        if F.FileName='' then Continue; //don't save untitled tabs

        Inc(Num); //start with 0
        SSec:= 'f'+IntToStr(Num);

        WriteInteger(SSec, 'gr', Groups.PagesIndexOf(F.Parent as TATPages));
        WriteString(SSec, 'fn', SCollapseFN(UTF8Encode(F.FileName), fn));
        WriteString(SSec, 'top', Format('%d,%d', [F.EditorMaster.TopLine, F.EditorSlave.TopLine]));
        WriteString(SSec, 'caret', Format('%d,%d', [F.EditorMaster.CaretStrPos, F.EditorSlave.CaretStrPos]));
        WriteString(SSec, 'wrap', Format('%d,%d', [Ord(F.EditorMaster.WordWrap), Ord(F.EditorSlave.WordWrap)]));
        WriteString(SSec, 'prop', Format('%d,%d,%d,%d,', [
                                    Ord(F.EditorMaster.TextSource.ReadOnly),
                                    Ord(F.EditorMaster.LineNumbers.Visible),
                                    Ord(not F.EditorMaster.DisableFolding),
                                    Ord(F.EditorMaster.SelectModeDefault)
                                    ]));
        WriteString(SSec, 'color', ColorToString(F.TabColor));
        WriteString(SSec, 'colmark', F.EditorMaster.ColMarkersString);
        WriteString(SSec, 'folded', EditorGetCollapsedRanges(F.EditorMaster)+';'+
                                    EditorGetCollapsedRanges(F.EditorSlave));
      end;

      WriteInteger(cSess, 'tabs', Num+1);
    finally
      Free;
    end;
  except
    //better not show msg, for R/O ini folder
    //MsgError(WideFormat(DKLangConstW('AppNSes'), [fn]), ...
  end;
end;

procedure TfmMain.TBXItemFSesOpenClick(Sender: TObject);
begin
  DoSessionOpenDialog;
end;


procedure TfmMain.DoSessionOpenDialog;
begin
  if not DoConfirmSaveSession(true) then
    Exit;
  with OD_Session do
  begin
    InitialDir:= opLastDirSession;
    if Execute then
    begin
      //confirm creation of new session
      if not IsFileExist(FileName) then
      begin
        if not MsgConfirmCreate(FileName, Handle) then
          Exit;
        with TStringList.Create do
        try
          SaveToFile(FileName);
        finally
          Free
        end;
      end;

      SaveLastDir_Session(FileName);
      DoOpenSession(FileName);

      if ExtractFileExt(FileName)='.syn' then
        FileName:= ChangeFileExt(FileName, '.'+cSynSessionExt);
      SynMruSessions.AddItem(FileName);
    end;
  end;
end;

procedure TfmMain.DoOpenSession(AFilename: string; AddMode: boolean = false);
const
  cSess = 'sess';
var
  F: TEditorFrame;
  SSec, AConvName: string;
  Str, SFilename, SDir: Widestring;
  NTabs, NGroup, i: Integer;
  Nums: array[TATGroupsNums] of Integer;
begin
  //support prev session format (using Py script)
  if ExtractFileExt(AFilename)='.syn' then
  begin
    AConvName:= ChangeFileExt(AFilename, '.'+cSynSessionExt);
    if not FileExists(AConvName) then
    begin
      Py_ConvertSessionToNewFormat(AFilename, AConvName);
      if not FileExists(AConvName) then
      begin
        MsgError('Cannot convert session file to new format', Handle);
        Exit
      end;
    end;

    //rename old .syn file
    FFileMove(AFilename, AFilename+'.bak');

    AFilename:= AConvName;
  end;

  //get session dir, w/o last slash
  SDir:= WideExcludeTrailingBackslash(WideExtractFileDir(AFilename));

  with TMemIniFile.Create(AFilename) do
  try
    NTabs:= ReadInteger(cSess, 'tabs', 1);
    if not MsgConfirmOpenSaveSession(NTabs, AFilename, false) then
      Exit;

    if not AddMode then
    begin
      if not DoCloseAllTabs then Exit;
      FSessionFN:= AFilename; //remember fname: after close-all
    end;

    DoControlLock(Self); //fix flicker
    FLockUpdate:= true;

    try
      Groups.Mode:= TATGroupsMode(ReadInteger(cSess, 'gr_mode', 1));
      Groups.SplitPos:= ReadInteger(cSess, 'split', 50);

      for i:= 0 to NTabs-1 do
      begin
        SSec:= 'f'+IntToStr(i);

        SFilename:= UTF8Decode(ReadString(SSec, 'fn', ''));
        if SFilename='' then Continue;

        //filename stored with ".\"
        if SBegin(SFilename, '.\') then
          SReplaceW(SFilename, '.', SDir)
        else
        //filename stored without path
        if WideExtractFileDir(SFilename) = '' then
          SFilename:= SDir + '\' + SFilename;
        //test filename
        if not IsFileExist(SFilename) then Continue;

        NGroup:= ReadInteger(SSec, 'gr', 1);
        if (NGroup>=1) and (NGroup<=Groups.PagesVisibleCount) then
          Groups.PagesCurrent:= Groups.Pages[NGroup];

        F:= DoOpenFile(SFilename);
        if F=nil then Continue;
        F.NotInRecents:= true;

        if opSaveEdCaret then
        begin
          Str:= ReadString(SSec, 'top', '');
          F.EditorMaster.TopLine:= StrToIntDef(SGetItem(Str), 0);
          F.EditorSlave.TopLine:= StrToIntDef(SGetItem(Str), 0);

          Str:= ReadString(SSec, 'caret', '');
          F.EditorMaster.CaretStrPos:= StrToIntDef(SGetItem(Str), 0);
          F.EditorSlave.CaretStrPos:= StrToIntDef(SGetItem(Str), 0);
        end;

        Str:= ReadString(SSec, 'wrap', '');
        F.EditorMaster.WordWrap:= Bool(StrToIntDef(SGetItem(Str), 0));
        F.EditorSlave.WordWrap:= Bool(StrToIntDef(SGetItem(Str), 0));

        Str:= ReadString(SSec, 'prop', '');
        F.EditorMaster.TextSource.ReadOnly:= Bool(StrToIntDef(SGetItem(Str), 0));
        F.EditorMaster.LineNumbers.Visible:= Bool(StrToIntDef(SGetItem(Str), 0));
        F.EditorMaster.DisableFolding:= not Bool(StrToIntDef(SGetItem(Str), 0));
        F.EditorMaster.SelectModeDefault:= TSyntSelectionMode(StrToIntDef(SGetItem(Str), 0));
        UpdateGutter(F); //apply folding

        DoSetFrameTabColor(F, StringToColor(ReadString(SSec, 'color', ColorToString(clNone))));
        F.EditorMaster.ColMarkersString:= ReadString(SSec, 'colmark', '');

        Str:= ReadString(SSec, 'folded', '');
        F.CollapsedString1:= SGetItem(Str, ';');
        F.CollapsedString2:= SGetItem(Str, ';');
      end;

      //restore TabIndex'es and PageIndex
      //
      NGroup:= ReadInteger(cSess, 'gr_act', 1);
      //
      Str:= ReadString(cSess, 'tab_act', '');
      for i:= Low(Groups.Pages) to High(Groups.Pages) do
      begin
        Nums[i]:= StrToIntDef(SGetItem(Str), 0);
        DoSetPagesAndTabIndex(i, Nums[i]);
      end;
      i:= NGroup;
      DoSetPagesAndTabIndex(i, Nums[i]);

    finally
      FLockUpdate:= false;
      DoControlUnlock(Self);
    end;
  finally
    Free;
  end;

  UpdateStatusBar;
  DoRepaint;
end;

procedure TfmMain.TBXItemFClearRecentsClick(Sender: TObject);
begin
  TBXItemClrClick(Self);
end;


procedure TfmMain.TbxSubmenuItemWindowPopup(Sender: TTBCustomItem; FromLink: Boolean);
  //
  function _Sh(i: Integer): string;
  begin
    {
    //this is wrong: sm_TabN call left-tabs, while menuitems call FramesAll[i]
    if (i>=0) and (i<=9) then
      Result:= #9 + GetShortcutTextOfCmd(sm_Tab0+i)
    else
    }
      Result:= '';
  end;
  //
  function _AccPrefix(i: Integer): string;
  begin
    if i < 9 then
      Result:= Format('&%d   ', [i+1])
    else
    if i < 10 + Ord('Z') - Ord('A') then
      Result:= Format('&%s   ', [Chr(i-9 + Ord('A'))])
    else
      Result:= '';
  end;
  //
var
  mi: TSpTbxItem;
  Frame: TEditorFrame;
  i: integer;
begin
  with CurrentFrame do
  begin
    TbxItemWinSplitH.Checked:= IsSplitted and SplitHorz;
    TbxItemWinSplitV.Checked:= IsSplitted and not SplitHorz;
  end;

  //clear previous items (with Tag>0)
  with TbxSubmenuItemWindow do
    for i:= Count-1 downto 0 do
      if Items[i].Tag>0 then
        Items[i].Free;

  //add items for all frames
  for i:= 0 to FrameAllCount-1 do
  begin
    Frame:= FramesAll[i];
    mi:= TSpTbxItem.Create(Self);
    mi.Caption:= _AccPrefix(i) + Frame.TabCaption + _Sh(i);
    mi.RadioItem:= true;
    mi.Checked:= Frame.Visible;
    mi.Hint:= Frame.FileName;
    mi.Tag:= i+1;
    mi.OnClick:= WindowItemClick;
    mi.OnSelect:= ButtonOnSelect;
    TbxSubmenuItemWindow.Add(mi);
  end;

  //move lower Window items to end
  for i:= 1 to cFixedWindowItems do
    with TbxSubmenuItemWindow do
      Move(0, Count-1);
end;

procedure TfmMain.WindowItemClick(Sender: TObject);
var
  N: integer;
begin
  N:= (Sender as TComponent).Tag - 1;
  CurrentFrame:= FramesAll[N];
end;

procedure TfmMain.DoTabIndexClick(n: integer);
begin
  if not DoSetPagesAndTabIndex(1, n) then
    MsgBeep;
end;

procedure TfmMain.DoRtTabIndexClick(n: integer);
begin
  if not DoSetPagesAndTabIndex(2, n) then
    MsgBeep;
end;

procedure TfmMain.TBXSubmenuEnc2Popup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateEncMenu(TbxSubmenuEnc2, True{AConvEnc});
end;

procedure TfmMain.TBXItemETimeClick(Sender: TObject);
begin
  DoDateTime;
end;

procedure TfmMain.DoDateTime;
begin
  with CurrentEditor do
    if not ReadOnly then
      InsertText(FormatDateTime(opDateFmt, Now));
end;


procedure TfmMain.TBXItemEPasteClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+V, for exe.
  }
  if edQs.Focused then
    edQs.PasteFromClipboard
  else
  if IsSearchEditFocused then
    (fmSR.ActiveControl as TWinControl).Perform(WM_PASTE, 0, 0)
  else
  if IsNumConvEditFocused then
    (fmNumConv.ActiveControl as TWinControl).Perform(WM_PASTE, 0, 0)
  else
    CurrentEditor.ExecCommand(smPaste);
end;

procedure TfmMain.TBXItemEDeleteClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+Del, for exe.
  }
  if edQs.Focused then
    edQs.ClearSelection
  else
  if IsSearchEditFocused then
    (fmSR.ActiveControl as TCustomComboBox).ClearSelection
  else
  if TreeFind.Focused then
    TbxItemTreeFindClearClick(Self)
  else
    CurrentEditor.ExecCommand(smClearSelection);
end;

procedure TfmMain.TBXItemESelectAllClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+A, for exe.
  }
  if edQs.Focused then
    edQs.SelectAll
  else
  if IsSearchEditFocused then
    (fmSR.ActiveControl as TCustomComboBox).SelectAll
  else
  if IsNumConvEditFocused then
    (fmNumConv.ActiveControl as TTntEdit).SelectAll
  else
  if IsProjPreviewFocused then
    FProjPreviewEditor.SelectAll
  else
  //reaction for current editor below
    CurrentEditor.ExecCommand(smSelectAll);
end;

procedure TfmMain.TBXItemECutClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+X, for exe.
  }
  if edQs.Focused then
    edQs.CutToClipboard
  else
  if IsSearchEditFocused then
    (fmSR.ActiveControl as TWinControl).Perform(WM_CUT, 0, 0)
  else
  if IsNumConvEditFocused then
    (fmNumConv.ActiveControl as TWinControl).Perform(WM_CUT, 0, 0)
  else
  if CurrentFrame.CaretsCount>1 then
    CurrentEditor.ExecCommand(smCut)
  else
  if not CurrentEditor.HaveSelection then
  begin
    if opCopyLineIfNoSel then
      CurrentEditor.ExecCommand(sm_CutLine);
  end
  else
    CurrentEditor.ExecCommand(smCut);
end;

procedure TfmMain.TBXItemECopyClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+C, for exe.
  }
  if edQs.Focused then
    edQs.CopyToClipboard
  else
  if Assigned(fmClip) and fmClip.ListClip.Focused then
    DoClipItemCopy
  else
  if Assigned(fmClips) and fmClips.List.Focused then
    DoClipsItemCopy
  else
  if IsSearchEditFocused then
    (fmSR.ActiveControl as TWinControl).Perform(WM_COPY, 0, 0)
  else
  if IsNumConvEditFocused then
    (fmNumConv.ActiveControl as TWinControl).Perform(WM_COPY, 0, 0)
  else
  if TreeFind.Focused then
    TBXItemTreeFindCopyToClipNodeClick(Self)
  else
  if ListPLog.Focused then
    TbxItemPLogCopySelClick(Self)
  else
  if IsProjPreviewFocused then
    FProjPreviewEditor.CopyToClipboard
  else
  //reaction for current editor below
  if CurrentFrame.CaretsCount>1 then
    CurrentEditor.ExecCommand(smCopy)
  else
  if not CurrentEditor.HaveSelection then
  begin
    if opCopyLineIfNoSel then
      CurrentEditor.ExecCommand(sm_CopyLine);
  end
  else
    CurrentEditor.ExecCommand(smCopy);
end;

procedure TfmMain.TBXItemEUndoClick(Sender: TObject);
begin
  {
  Here's reaction to Ctrl+Z, for exe.
  }
  if edQs.Focused then
    edQs.Undo
  else
    CurrentEditor.ExecCommand(smUndo);
end;

procedure TfmMain.DoReplaceTabsToSpaces(F: TEditorFrame);
var
  L: TTntStringList;
begin
  {
  //slow!
  F.EditorMaster.UnTabText;
  }
  L:= TTntStringList.Create;
  try
    L.SetTextW(PWChar(F.EditorMaster.Text));
    DoListCommand_Untab(L, EditorTabSize(F.EditorMaster));
    F.EditorMaster.Text:= L.Text;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.TBXItemRunFindPhpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenPhp);
end;

procedure TfmMain.DoOnlineWordHelp(const url: Widestring);
var
  s: Widestring;
begin
  with CurrentEditor do
    s:= WideTrim(WordAtPos(CaretPos));
  if s='' then
    begin MsgNoSelection; Exit; end;

  s:= WideFormat(url, [s]);
  FOpenURL(s, Handle);
end;

procedure TfmMain.DoOnlineFind(const Site: Widestring);
var
  S: WideString;
begin
  S:= EditorSelectedTextForWeb(CurrentEditor);
  if S='' then
    MsgNoSelection
  else
    FOpenURL(Site + S, Handle);
end;

procedure TfmMain.TBXItemRunFindGoogleClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenGoogle);
end;

procedure TfmMain.TBXItemRunFindWikiClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenWiki);
end;

procedure TfmMain.TBXItemRunFindMSDNClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenMsdn);
end;

procedure TfmMain.RunBrowser(const fn: Widestring);
begin
  if CurrentFrame.FileName <> '' then
  begin
    if CurrentFrame.Modified then
      acSave.Execute;
    if not FExecute(fn, '"' + CurrentFrame.FileName + '"', '', Handle) then
      MsgNoRun(fn);
  end;
end;

procedure TfmMain.TBXItemRunOpenFileClick(Sender: TObject);
begin
  DoOpenCurrentFile;
end;

procedure TfmMain.DoOpenCurrentFile;
begin
  if CurrentFrame.FileName<>'' then
  begin
    if CurrentFrame.Modified then
      SaveFrame(CurrentFrame, false);
    FOpenURL(CurrentFrame.FileName, Handle);
  end
  else
    MsgBeep;
end;

procedure TfmMain.TBXItemRunOpenDirClick(Sender: TObject);
begin
  DoOpenCurrentDir;
end;

procedure TfmMain.DoOpenCurrentDir;
begin
  if CurrentFrame.FileName<>'' then
    FOpenURL(WideExtractFileDir(CurrentFrame.FileName), Handle);
end;

procedure TfmMain.DoOpenCmdPrompt;
var
  SDir: Widestring;
begin
  if CurrentFrame.FileName<>'' then
    SDir:= WideExtractFileDir(CurrentFrame.FileName)
  else
    SDir:= GetCurrentDir;
  FExecute('cmd.exe', '', SDir, Handle);
end;

procedure TfmMain.TimerLoadTimer(Sender: TObject);
begin
  TimerLoad.Enabled:= false;
  LoadTools;
end;

procedure TfmMain.TBXItemTbCloseClick(Sender: TObject);
begin
  acClose.Execute;
end;


procedure TfmMain.acExitExecute(Sender: TObject);
begin
  if SynExe then
    Application.MainForm.Close
  else
    PostMessage(hLister, WM_CLOSE, 0, 0);
end;

procedure TfmMain.ReplaceInAllTabs(var nRep, nFiles: integer);
var
  F: TEditorFrame;
  i: Integer;
begin
  Finder.Flags:= Finder.Flags-[ftSelectedText]+[ftEntireScope];
  Finder.OnNotFound:= nil;
  F:= CurrentFrame;
  nRep:= 0;
  nFiles:= 0;
  for i:= 0 to FrameAllCount-1 do
  begin
    CurrentFrame:= FramesAll[i];
    Finder.ReplaceAll;
    Finder.CfmReset:= false;
    if Finder.Matches>0 then
    begin
      Inc(nFiles);
      Inc(nRep, Finder.Matches);
      CurrentFrame.DoTitleChanged;
    end;
  end;
  CurrentFrame:= F;
  Finder.CfmReset:= true;
  Finder.OnNotFound:= FinderFail;
end;

procedure TfmMain.acCloseAndDeleteExecute(Sender: TObject);
var
  fn: Widestring;
begin
  fn:= CurrentFrame.FileName;
  if fn='' then Exit;
  if MsgConfirm(DKLangConstW('mdel'), Handle) then
  begin
    //close
    acClose.Execute;
    //delete file
    if not FDeleteToRecycle(Handle, fn, true) then
      MsgError(WideFormat(DKLangConstW('mdeln'), [WideExtractFileName(fn)]), Handle);
    //delete proj item
    if Assigned(fmProj) then
      fmProj.DoRemoveFile(fn);

    SynMruFiles.DeleteItem(fn);
    DoRefreshPluginsFiles(fn);
  end;
end;

procedure TfmMain.WMCommandWithClose(var Msg: TMessage);
begin
  case Msg.WParam of
    sm_FileClose:
      acClose.Execute;
    sm_FileCloseAndDelete:
      acCloseAndDelete.Execute;
    sm_FileCloseAll:
      acCloseAll.Execute;
    sm_FileCloseOthers:
      acCloseOthersThisGroup.Execute;
    sm_FileCloseOthersAllGroups:
      acCloseOthersAllGroups.Execute;
    sm_FileRenameDialog:
      acRename.Execute;
    sm_FileOpenSession:
      DoSessionOpenDialog;
    sm_FileAddSession:
      DoSessionAddDialog;
    sm_FileCloseSession:
      DoCloseSession(true);
  end;
  Msg.Result:= 1;
end;

//Finder must be set-up
procedure TfmMain.ReplaceInFile(const fn: Widestring);
var
  Attr: Dword;
const
  fa = (file_attribute_readonly or file_attribute_hidden or file_attribute_system);
begin
  try
    TemplateEditor.LoadFromFile(fn);
  except
    on E: Exception do
    begin
      MsgExcept('Error on loading file'#13+fn, E, Handle);
      Exit;
    end;
  end;

  try
    try
      Finder.ReplaceAll;
    except
      on E: Exception do
      begin
        MsgExcept('Error on replacing in file'#13+fn, E, Handle);
        Exit;
      end;
    end;

    if Finder.Matches > 0 then
    try
      //clear R/O
      Attr:= GetFileAttributesW(PWChar(fn));
      if (Attr and fa) <> 0 then
        SetFileAttributesW(PWChar(fn), Attr and not fa);
      //save
      TemplateEditor.SaveToFile(fn);
      //return R/O back
      if (Attr and fa) <> 0 then
        SetFileAttributesW(PWChar(fn), Attr);
    except
      on E: Exception do
        MsgExcept('Error on saving file'#13+fn, E, Handle);
    end;
  finally
    TemplateEditor.Lines.Clear;
  end;
end;

procedure TfmMain.FindInFile(const fn: Widestring; InCodepage: TSynCpOverride = cp_sr_Def);
var
  Op: TSyntaxMemoOptions;
  OpWrap: boolean;
  //
  procedure ClearEditor;
  begin
    TemplateEditor.Lines.Clear;
    TemplateEditor.Options:= Op;
    TemplateEditor.WordWrap:= OpWrap;
  end;
begin
  //set "Fixed ln height" option to speed-up editor
  Op:= TemplateEditor.Options;
  OpWrap:= TemplateEditor.WordWrap;
  TemplateEditor.Options:= TemplateEditor.Options + [soFixedLineHeight];
  TemplateEditor.WordWrap:= false;

  case InCodepage of
    cp_sr_OEM:
    begin
      TemplateEditor.Lines.SkipSignature:= true;
      TemplateEditor.Lines.TextCoding:= tcAnsi;
      TemplateEditor.Lines.CodePage:= CP_OEMCP;
    end;
    cp_sr_UTF8:
    begin
      TemplateEditor.Lines.SkipSignature:= true;
      TemplateEditor.Lines.TextCoding:= tcUTF8;
      TemplateEditor.Lines.CodePage:= 0;
    end;
    cp_sr_UTF16:
    begin
      TemplateEditor.Lines.SkipSignature:= true;
      TemplateEditor.Lines.TextCoding:= tcUnicode;
      TemplateEditor.Lines.CodePage:= 0;
    end;
    else
    begin
      TemplateEditor.Lines.SkipSignature:= false;
      TemplateEditor.Lines.TextCoding:= tcAnsi;
      TemplateEditor.Lines.CodePage:= CP_ACP;
    end;
  end;

  try
    FListResFN:= fn;
    TemplateEditor.LoadFromFile(fn);
  except
    on E: Exception do
    begin
      MsgExcept('Error on loading file'#13+fn, E, Handle);
      ClearEditor;
      Exit;
    end;
  end;

  Finder.OnFind:= FinderFind_WithResultPane;
  Finder.OnCanAccept:= nil;
  Finder.OnContinue:= FinderContinue;
  FLastOnContinueCheck:= 0;

  try
    try
      Finder.CountAll;
    finally
      Finder.OnFind:= nil;
      Finder.OnCanAccept:= nil;
      Finder.OnContinue:= nil;
      ClearEditor;
    end;
  except
    on E: Exception do
      MsgExcept('Error on counting matches in file'#13+fn, E, Handle);
  end;
end;

procedure TfmMain.ecReplaceInFilesExecute(Sender: TObject);
var
  OFlags: TSearchOptions;
  OTokens: TSearchTokens;
  OTxt, OTxt2: Widestring;
  ON1, ON2, ON3: TNotifyEvent;
  ON4: TOnFindEvent;
  AErrorMode: integer;
  //-------------
  procedure RestoreFinder;
  begin
    Finder.Control:= CurrentEditor;
    Finder.FindText:= '';
    Finder.ReplaceText:= '';
    Finder.Flags:= OFlags;
    Finder.Tokens:= OTokens;
    {
    //leave text
    Finder.FindText:= OTxt;
    Finder.ReplaceText:= OTxt2;
    }
    Finder.OnAfterExecute:= ON1;
    Finder.OnBeforeExecute:= ON2;
    Finder.OnNotFound:= ON3;
    Finder.OnCanAccept:= ON4;
  end;
  //-------------
  procedure MsgNoFiles;
  begin
    AErrorMode:= 1;
  end;
  //-------------
  procedure MsgNoLines;
  begin
    AErrorMode:= 2;
  end;
  //-------------
var
  AShowResult: TModalResult;
  ASortMode: TSynFileSort;
  ANeedFocusResult: boolean;
  AFnOnly, AToTab, AOutAppend, ACloseAfter: boolean;
  InOEM, InUTF8, InUTF16, ThisInUTF8: boolean;
  NTotalSize, NDoneSize: Int64;
  ATextSearch,
  ATextReplace: Widestring;
  ADir: Widestring;
  ACountMatches,
  ACountFiles: Integer;
  ANodeText, AFn: Widestring;
  i, N: Integer;
label
  _Exit, _Show;
begin
  AErrorMode:= 0;

  //save finder
  OFlags:= Finder.Flags;
  OTokens:= Finder.Tokens;
  OTxt:= Finder.FindText;
  OTxt2:= Finder.ReplaceText;
  ON1:= Finder.OnAfterExecute;
  ON2:= Finder.OnBeforeExecute;
  ON3:= Finder.OnNotFound;
  ON4:= Finder.OnCanAccept;

  //get text from "Find" dialog
  if Assigned(fmSR) and fmSR.Visible then
  begin
    ATextSearch:= fmSR.Text1;
    ATextReplace:= fmSR.Text2;
    fmSR.Hide;
  end
  else
  begin
    ATextSearch:= '';
    ATextReplace:= '';
  end;

  _Show:
  ANeedFocusResult:= false;
  with TfmSRFiles.Create(Self) do
  try
    SynIniDir:= Self.SynIniDir;
    SRCurrentDir:= SExtractFileDir(CurrentFrame.FileName);
    SRCurrentFile:= SExtractFileName(CurrentFrame.FileName);
    SRCount:= opSaveSRHist;
    SRIni:= SynHistoryIni;
    SRIniS:= SynHistoryIni;
    SR_SuggestedSel:= '';
    ShFind:= GetShortcutOfCmd(smFindDialog);
    ShReplace:= GetShortcutOfCmd(smReplaceDialog);
    SR_SuggestedFind:= ATextSearch;
    SR_SuggestedReplace:= ATextReplace;

    if (AErrorMode = 0) then //Only suggest text for 1st search
      with CurrentEditor do
      begin
        if opSrSuggestSel and (SelLength>0) then
          SR_SuggestedSel:= SelText
        else
        if opSrSuggestWord then
          SR_SuggestedSel:= WordAtPos(CaretPos);
      end;

    case AErrorMode of
      1: ShowErr(DKLangConstW('FF0')); //No files found
      2: ShowErr(DKLangConstW('FF0_')); //No occurances found
    end;
    AErrorMode:= 0;

    //use last values of fields
    SR_LastLeft:= FDialogFFiles_Left;
    SR_LastTop:= FDialogFFiles_Top;
    SR_LastFind:= FDialogFFiles_Find;
    SR_LastReplace:= FDialogFFiles_Replace;
    SR_LastMaskInc:= FDialogFFiles_MaskInc;
    SR_LastMaskExc:= FDialogFFiles_MaskExc;
    SR_LastDir:= FDialogFFiles_Dir;

    //center form
    Left:= Self.Monitor.Left + (Self.Monitor.Width - Width) div 2;
    Top:= Self.Monitor.Top + (Self.Monitor.Height - Height) div 2;

    repeat
      AShowResult:= ShowModal;
      case AShowResult of
        mrCancel:
          begin
            RestoreFinder;
            Exit
          end;
        resGotoFind:
          begin
            RestoreFinder;
            ecFind.Execute;
            if Assigned(fmSR) then
            begin
              fmSR.Text1:= ed1.Text;
              fmSR.Text2:= ed2.Text;
            end;
            Application.ProcessMessages;
            Exit
          end;
        resGotoRep:
          begin
            RestoreFinder;
            ecReplace.Execute;
            if Assigned(fmSR) then
            begin
              fmSR.Text1:= ed1.Text;
              fmSR.Text2:= ed2.Text;
            end;
            Application.ProcessMessages;
            Exit
          end;
      end;

      //if dir not exists, goto ShowModal
      edDir.Text:= WideExcludeTrailingBackslash(edDir.Text);
      if not IsDirExist(edDir.Text) then
      begin
        ShowErr(DKLangConstW('MNFoundFold'));
        Continue
      end;

      if cbRE.Checked and not IsRegexValid(ed1.Text) then
      begin
        ShowErr(DKLangConstW('zMRegexInvalid'));
        Continue
      end;

      Break;
    until false;

    //confirm mass replace
    if AShowResult = resReplaceAll then
      if not MsgConfirm(WideFormat(DKLangConstW('FFCfm'), [edDir.Text, edFileInc.Text]), Handle) then
        begin RestoreFinder; Exit end;

    //save last dialog field values
    FDialogFFiles_Find:= ed1.Text;
    FDialogFFiles_Replace:= ed2.Text;
    FDialogFFiles_MaskInc:= edFileInc.Text;
    FDialogFFiles_MaskExc:= edFileExc.Text;
    FDialogFFiles_Dir:= edDir.Text;
    FDialogFFiles_Left:= Left;
    FDialogFFiles_Top:= Top;

    //find files to StringList
    FListFiles.Clear;
    ADir:= edDir.Text;
    AFnOnly:= cbFnOnly.Checked;
    AToTab:= cbOutTab.Checked;
    AOutAppend:= cbOutAppend.Checked;
    ACloseAfter:= cbCloseAfter.Checked;
    ASortMode:= TSynFileSort(edSort.ItemIndex);

    DoProgressShow(proFindFiles);
    try
      FFindToList(FListFiles, edDir.Text, edFileInc.Text, edFileExc.Text,
        cbSubDir.Checked, cbNoRO.Checked, cbNoHid.Checked, cbNoHid2.Checked);
      if StopFind then
      begin
        DoProgressHide;
        RestoreFinder;
        Exit
      end;
    except
      on E: Exception do
      begin
        MsgExcept('Error on searching for files', E, Handle);
        DoProgressHide;
        Exit;
      end;
    end;

    //exclude binary files from StringList
    if cbNoBin.Checked then
    try
      fmProgress.SetMode(proExclBinary);
      N:= FListFiles.Count;
      for i:= N-1 downto 0 do
      begin
        if not IsFileText(FListFiles[i]) then
          FListFiles.Delete(i);
        if IsProgressStopped(N-i, N) then
        begin
          DoProgressHide;
          RestoreFinder;
          Exit
        end;
      end;
    except
      on E: Exception do
      begin
        MsgExcept('Error on excluding binary files', E, Handle);
        DoProgressHide;
        Exit;
      end;
    end;

    //sort file list
    case ASortMode of
      sortDate:
        FListFiles.CustomSort(CompareListDate);
      sortDateDesc:
        FListFiles.CustomSort(CompareListDateDesc);
    end;

    //set finder
    Finder.Control:= TemplateEditor;
    Finder.FindText:= ed1.Text;
    Finder.ReplaceText:= ed2.Text;
    Finder.Tokens:= tokensAll;
    Finder.Flags:= [ftEntireScope];
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSens];
    if cbWords.Checked then Finder.Flags:= Finder.Flags + [ftWholeWords];

    if cbRe.Checked then Finder.Flags:= Finder.Flags + [ftRegex];
    //if cbReDot.Checked then Finder.Flags:= Finder.Flags + [ftRegex_s];
    //if cbReMLine.Checked then Finder.Flags:= Finder.Flags + [ftRegex_m];

    if cbSpec.Checked then
    begin
      Finder.FindText:= SDecodeSpecChars(Finder.FindText);
      Finder.ReplaceText:= SDecodeSpecChars(Finder.ReplaceText);
    end;

    Finder.OnAfterExecute:= nil;
    Finder.OnBeforeExecute:= nil;
    Finder.OnNotFound:= nil;
    Finder.OnCanAccept:= nil;
    InOEM:= cbInOEM.Checked;
    InUTF8:= cbInUTF8.Checked;
    InUTF16:= cbInUTF16.Checked;
  finally
    Free; //not Release
  end;

  //"Find in files" dialog is closed, Finder is set, FListFiles is filled,
  //start the work

  //--------------------------
  //"Find in files" work
  if AShowResult = resFindAll then
  if FListFiles.Count = 0 then
    MsgNoFiles
  else
  begin
    FListResFN:= '';
    FListResFN_Prev:= '';

    //init TreeRoot, show Output pane
    if not AOutAppend then
      DoClearTreeFind;
    UpdateTreeFind_Initial(Finder.FindText, ADir);
    UpdatePanelOut(tbFind);
    plOut.Show;

    fmProgress.SetMode(proFindText);
    Application.ProcessMessages;
    try
      NTotalSize:= 0;
      NDoneSize:= 0;
      for i:= 0 to FListFiles.Count-1 do
        Inc(NTotalSize, DWORD(FListFiles.Objects[i]));
      if NTotalSize = 0 then
        NTotalSize:= 1;

      FFinderTotalSize:= NTotalSize;
      FFinderDoneSize:= NDoneSize;

      for i:= 0 to FListFiles.Count-1 do
      begin
        try
          //show filename on progress form
          if Assigned(fmProgress) then
          begin
            AFn:= FListFiles[i];
            Delete(AFn, 1, Length(ADir)+1);
            AFn:= WideMinimizeName(AFn, fmProgress.Canvas, Self.ClientWidth - fmProgress.labFilename.Left);
            fmProgress.labFilename.Caption:= AFn;
          end;

          //first search in auto-detected encoding
          ThisInUTF8:= IsFileUTF8NoBOM(FListFiles[i]);
          if ThisInUTF8 then
            FindInFile(FListFiles[i], cp_sr_UTF8)
          else
            FindInFile(FListFiles[i]);

          //additional searches in OEM/UTF8/UTF16
          if not IsFileWithBOM(FListFiles[i]) then
          begin
            if InOEM then
              FindInFile(FListFiles[i], cp_sr_OEM);
            if InUTF8 and not ThisInUTF8 then
              FindInFile(FListFiles[i], cp_sr_UTF8);
            if InUTF16 then
              FindInFile(FListFiles[i], cp_sr_UTF16);
          end;
        except
          on E: Exception do
            MsgExcept('Error on finding in file'#13+FListFiles[i], E, Handle);
        end;

        Inc(NDoneSize, DWORD(FListFiles.Objects[i]));
        FFinderDoneSize:= NDoneSize;
        if IsProgressStopped(NDoneSize, NTotalSize) then
          Break;
      end;

      FFinderTotalSize:= 0;
      FFinderDoneSize:= 0;
    except
      on E: Exception do
      begin
        DoProgressHide;
        MsgExcept('Error on finding in files', E, Handle);
        Exit
      end;
    end;

    //if "Find in files" stopped
    if StopFind then
    begin
      UpdateTreeFind_Results(Finder.FindText, ADir, true);
      goto _Exit;
    end;

    //show "Find in files" report in Output pane
    if FTreeRoot=nil then
      raise Exception.Create('TreeRoot nil');
    if FTreeRoot.GetFirstChild=nil then
    begin
      UpdateTreeFind_Results(Finder.FindText, ADir, false);
      MsgNoLines;
    end
    else
    begin
      UpdateTreeFind_Results(Finder.FindText, ADir, false);
      if AToTab then
      begin
        DoCopyFindResultToTab(true, AFnOnly);
      end
      else
      begin
        ANeedFocusResult:= true;
        UpdatePanelOut(tbFind);
        plOut.Show;
      end;
    end;
  end;

  //---------------------------
  //"Replace in files" work
  if AShowResult = resReplaceAll then
  if FListFiles.Count = 0 then
    MsgNoFiles
  else
  begin
    //init FTreeRoot, show Output pane
    if not AOutAppend then
      DoClearTreeFind;
    ANodeText:= WideFormat(DKLangConstW('O_fnode_r'),
        [Finder.FindText, Finder.ReplaceText, ADir]);
    FTreeRoot:= TreeFind.Items.Add(nil, ANodeText);

    UpdatePanelOut(tbFind);
    plOut.Show;

    ACountFiles:= 0;
    ACountMatches:= 0;

    fmProgress.SetMode(proFindText);
    Application.ProcessMessages;
    try
      for i:= 0 to FListFiles.Count-1 do
      begin
        try
          ReplaceInFile(FListFiles[i]);
        except
          on E: Exception do
            MsgExcept('Error on replacing in file'#13+FListFiles[i], E, Handle);
        end;

        try
          if Finder.Matches>0 then
          begin
            Inc(ACountFiles);
            Inc(ACountMatches, Finder.Matches);
            //update TreeFind
            UpdateTreeFind_ReplaceResults(ANodeText, ACountFiles, ACountMatches, false);
            FTreeRoot.Expand(false);

            TreeFind.Selected:= TreeFind.Items.AddChild(FTreeRoot,
              FListFiles[i] + Format(' (%d)', [Finder.Matches]));
              //todo: make adding with prefix+str, using FinderFindWithResPane
          end;
        except
          on E: Exception do
            MsgExcept('Error on adding result'#13+FListFiles[i], E, Handle);
        end;

        //if "Replace in files" stopped
        if IsProgressStopped(i+1, FListFiles.Count) then
        begin
          DoProgressHide;
          UpdateTreeFind_ReplaceResults(ANodeText, ACountFiles, ACountMatches, true);
          Break;
        end;
      end;
    except
      on E: Exception do
      begin
        DoProgressHide;
        MsgExcept('Error on replacing in files', E, Handle);
        Exit;
      end;
    end;

    //show "Replace in files" report (activate Results tab)
    if ACountMatches=0 then
      MsgNoLines
    else
    begin
      FTreeRoot.Expand(false);
      TreeFind.Selected:= FTreeRoot;
      if AToTab then
      begin
        DoCopyFindResultToTab(true, true{AFnOnly=true for replace});
      end
      else
      begin
        ANeedFocusResult:= true;
        UpdatePanelOut(tbFind);
        plOut.Show;
      end;
    end;
  end;

  //"Find/Replace in files" work is finished,
  //now a) exit or b) show red error line and goto ShowModal

  if (AErrorMode>0) or (not ACloseAfter) then
  begin
    DoProgressHide;
    goto _Show;
  end;

  //restore finder
  _Exit:
  DoProgressHide;
  StopFind:= false;
  RestoreFinder;

  if ANeedFocusResult then
  begin
    if Self.Enabled and TreeFind.CanFocus then
      TreeFind.SetFocus;
  end
  else
    FocusEditor;
end;

procedure TfmMain.DoMarkAll(const Str: Widestring);
var
  OFl: TSearchOptions;
  OTxt, OTxt2: Widestring;
  ON1, ON2, ON3: TNotifyEvent;
begin
  //save finder
  OFl:= Finder.Flags;
  OTxt:= Finder.FindText;
  OTxt2:= Finder.ReplaceText;
  ON1:= Finder.OnAfterExecute;
  ON2:= Finder.OnBeforeExecute;
  ON3:= Finder.OnNotFound;

  //set finder
  Finder.Control:= CurrentEditor;
  Finder.FindText:= Str;
  Finder.ReplaceText:= '';
  Finder.Flags:= [ftEntireScope];
  if opHiliteSmartWords then
    Finder.Flags:= Finder.Flags + [ftWholeWords];
  if opHiliteSmartCase then
    Finder.Flags:= Finder.Flags + [ftCaseSens];

  Finder.OnAfterExecute:= nil;
  Finder.OnBeforeExecute:= nil;
  Finder.OnNotFound:= nil;

  //find
  Finder.FindAll;
  MsgFound;

  //hide search marks, if only one result found
  if Finder.Matches=1 then
    CurrentEditor.ResetSearchMarks;

  //restore finder
  Finder.Flags:= OFl;
  Finder.FindText:= OTxt;
  Finder.ReplaceText:= OTxt2;
  Finder.OnAfterExecute:= ON1;
  Finder.OnBeforeExecute:= ON2;
  Finder.OnNotFound:= ON3;
end;

procedure TfmMain.DoSmartHilite;
var
  Ed: TSyntaxMemo;
  s: Widestring;
  i: Integer;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;
  if FSelBlank and (Ed.SelLength=0) then Exit;
  Ed.ResetSearchMarks;
  s:= Ed.SelText;
  FSelBlank:= Ed.SelLength=0;

  if opHiliteSmartWords then
  begin
    //Selection must be a word
    for i:= 1 to Length(s) do
      if not IsWordChar(s[i]) then Exit;
  end;

  DoMarkAll(s);
  UpdateFrameMicroMap(CurrentFrame);
end;

procedure TfmMain.TimerSelTimer(Sender: TObject);
begin
  TimerSel.Enabled:= false;
  if opHiliteSmart then
    DoSmartHilite;
end;

procedure TfmMain.TimerBracketsTimer(Sender: TObject);
begin
  TimerBrackets.Enabled:= false;
  DoBracketsHilite(CurrentEditor);
end;

procedure TfmMain.TBXItemCtxCopyAppendClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyAppend);
end;

procedure TfmMain.TBXItemCtxCutAppendClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CutAppend);
end;

procedure TfmMain.TBXSubmenuItemEdPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  en, ro: boolean;
begin
  en:= CurrentEditor.HaveSelection;
  ro:= CurrentEditor.ReadOnly;

  //Need enabled items for S/R dialog:
  //TBXItemECut.Enabled:= en and not ro;
  //TBXItemECopy.Enabled:= en;
  //TBXItemEDelete.Enabled:= en and not ro;
  //TBXItemEPaste.Enabled:= not ro;

  TBXItemEUndo.Enabled:= not ro;
  TBXItemERedo.Enabled:= not ro;
  TBXItemEComm.Enabled:= not ro;
  TBXItemEUncomm.Enabled:= not ro;
  TBXItemEIndent.Enabled:= not ro;
  TBXItemEUnindent.Enabled:= not ro;
  TbxItemEMoveUp.Enabled:= not ro;
  TbxItemEMoveDn.Enabled:= not ro;
  TBXItemEDup.Enabled:= not ro;
  TBXItemEDelLn.Enabled:= not ro;
  TBXItemETable.Enabled:= not ro;
  TBXItemETime.Enabled:= not ro;
  TBXItemEJoin.Enabled:= en and not ro;
  TBXItemESplit.Enabled:= not ro;

  TBXItemEFillBlock.Enabled:= en and not ro;
  TBXItemEColumn.Enabled:= en and not ro;
  TBXItemEInsText.Enabled:= not ro;
  TbxItemHtmlEmmetExpand.Enabled:= not ro;
  TbxItemHtmlEmmetWrap.Enabled:= not ro;
  TbxItemEToggleLineComment.Enabled:= not ro;
  TbxItemEToggleStreamComment.Enabled:= not ro;
end;

procedure TfmMain.TBXItemSGoBracketClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smChangeRangeSide);
end;

procedure TfmMain.plOutResize(Sender: TObject);
begin
  {$ifndef FixRepaint}
  plOut.Invalidate;
  {$endif}
  tbViewMove(Self);
end;

procedure TfmMain.ecShowOutExecute(Sender: TObject);
begin
  with plOut do
  begin
    Visible:= not Visible;
    FOutVisible:= Visible;
    if not Visible then
      FocusEditor;
  end;

  {$ifndef FixRepaint}
  DoRepaintTBs;
  DoRepaintTBs2;
  {$endif}
end;

procedure TfmMain.plOutVisibleChanged(Sender: TObject);
begin
  FixSplitters;

  ecShowOut.Checked:= plOut.Visible;
  if not plOut.Visible then //Apply when X icon pressed
  begin
    FOutVisible:= false;
    DoRepaint;
  end;

  SyncMapPos;
end;

procedure TfmMain.ListOutDblClick(Sender: TObject);
begin
  with ListOut do
   if (ItemIndex>=0) and (ItemIndex<Items.Count) then
     DoNavigate_ListOut(Items[ItemIndex]);
end;

function TfmMain.DoNavigate_ListOut(const Str: Widestring): boolean;
var
  fn: Widestring;
  nLine, nCol: Integer;
begin
  Result:= false;
  if Str='' then Exit;

  fn:= SynPanelPropsOut.DefFilename;
  SParseOut(Str,
    SynPanelPropsOut.RegexStr,
    SynPanelPropsOut.RegexIdName,
    SynPanelPropsOut.RegexIdLine,
    SynPanelPropsOut.RegexIdCol,
    SynPanelPropsOut.ZeroBase,
    fn, nLine, nCol);

  if fn='' then Exit;
  if nLine<1 then Exit;
  if nCol<1 then nCol:= 1;

  Result:= true;

  //correct fn
  if (SExtractFilePath(fn)='') and (CurrentFrame.FileName<>'') then
    fn:= SExtractFilePath(CurrentFrame.FileName)+fn;
  if not IsFileExist(fn) then
    begin MsgError(WideFormat(DKLangConstW('O_fne'), [fn]), Handle); Exit end;

  DoOpenFile(fn);
  FocusEditor;
  CurrentEditor.CaretPos:= Point(nCol-1, nLine-1);
end;

procedure TfmMain.DoHandleKeysInPanels(var Key: Word; Shift: TShiftState);
var
  sh: TShortcut;
  i: integer;
begin
  sh:= Shortcut(Key, Shift);
  if sh=0 then Exit;

  //Cmd list
  if IsShortcutOfCmd(sh, sm_CommandsList) then
  begin
    ecCommandsList.Execute;
    Key:= 0;
    Exit
  end;

  //Find-in-files
  if IsShortcutOfCmd(sh, sm_ReplaceInFiles) then
  begin
    ecReplaceInFiles.Execute;
    Key:= 0;
    Exit
  end;

  //Toggle panels
  if IsShortcutOfCmd(sh, sm_OptShowLeftPanel) then
  begin
    ecShowTree.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_OptShowOutputPanel) then
  begin
    ecShowOut.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_OptShowRightPanel) then
  begin
    ecShowClip.Execute;
    Key:= 0;
    Exit
  end;

  //Next/prev search/output result - 6 commands
  if IsShortcutOfCmd(sh, sm_GotoNextFindResult) then
  begin
    ecGotoNextFindResult.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_GotoPrevFindResult) then
  begin
    ecGotoPrevFindResult.Execute;
    Key:= 0;
    Exit
  end;

  if IsShortcutOfCmd(sh, sm_GotoNextOutputResult) then
  begin
    CurrentEditor.ExecCommand(sm_GotoNextOutputResult);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_GotoPrevOutputResult) then
  begin
    CurrentEditor.ExecCommand(sm_GotoPrevOutputResult);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_GotoNextSearchOrOutputResult) then
  begin
    CurrentEditor.ExecCommand(sm_GotoNextSearchOrOutputResult);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_GotoPrevSearchOrOutputResult) then
  begin
    CurrentEditor.ExecCommand(sm_GotoPrevSearchOrOutputResult);
    Key:= 0;
    Exit
  end;

  //Focus commands
  if IsShortcutOfCmd(sh, sm_ToggleFocusTree) then
  begin
    ecToggleFocusTree.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusValidate) then
  begin
    ecToggleFocusValidate.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusProj) then
  begin
    ecToggleFocusProject.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusMap) then
  begin
    ecToggleFocusMap.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusClip) then
  begin
    ecToggleFocusClip.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusClips) then
  begin
    ecToggleFocusClips.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusFindRes) then
  begin
    ecToggleFocusFindRes.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusOutput) then
  begin
    ecToggleFocusOutput.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusTabs) then
  begin
    ecToggleFocusTabs.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsShortcutOfCmd(sh, sm_ToggleFocusConsole) then
  begin
    ecToggleFocusConsole.Execute;
    Key:= 0;
    Exit
  end;

  //Tree next/prev/parent/next-brother/prev-brother
  if IsShortcutOfCmd(sh, sm_TreeNextNode) then
  begin
    ecTreeNext.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_TreePrevNode) then
  begin
    ecTreePrev.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_TreeParent) then
  begin
    ecTreeParent.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_TreePrevBrother) then
  begin
    ecTreePrevBrother.Execute;
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(sh, sm_TreeNextBrother) then
  begin
    ecTreeNextBrother.Execute;
    Key:= 0;
    Exit
  end;

  //sm_Tab0..sm_Tab9
  for i:= 0 to 9 do
    if IsShortcutOfCmd(sh, sm_Tab0+i) then
    begin
      DoTabIndexClick(i);
      Key:= 0;
      Exit
    end;

  //sm_TreeLevel2..sm_TreeLevel9
  for i:= 2 to 9 do
    if IsShortcutOfCmd(sh, sm_TreeLevel2+i-2) then
    begin
      DoTreeLevel(i);
      Key:= 0;
      Exit
    end;
end;

procedure TfmMain.ListOutKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key=vk_space) or (Key=vk_return)) and (Shift=[]) then
  begin
    ListOutDblClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=vk_delete) and (Shift=[]) then
  begin
    TbxItemOutClearClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    TbxItemOutCopySelClick(Self);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(Shortcut(Key, Shift), smFindDialog) then
  begin
    TBXItemOutFindClick(Self);
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.TBXItemOutClearClick(Sender: TObject);
begin
  ListOut.Clear;
  FocusEditor;
end;

procedure TfmMain.TBXItemOutCopySelClick(Sender: TObject);
begin
  DoListCopy(ListOut);
end;

procedure TfmMain.DoListCopy(Sender: TTntListbox);
var i:Integer;
  S: Widestring;
begin
  with Sender do
   if SelCount>0 then
   begin
     S:= '';
     for i:= 0 to Items.Count-1 do
       if Selected[i] then
         S:= S+Items[i]+sLineBreak;
     if SelCount=1 then
       S:= SDelLastCR(S);
     TntClipboard.AsWideText:= S;
   end;
end;

procedure TfmMain.TBXItemOutNavClick(Sender: TObject);
begin
  with ListOut do
   if FOutItem>=0 then
    DoNavigate_ListOut(Items[FOutItem]);
end;

procedure TfmMain.PopupOutPopup(Sender: TObject);
begin
  with ListOut do
  begin
    TbxItemOutNav.Enabled:= (FOutItem>=0) and (FOutItem<=Items.Count-1);
    TbxItemOutCopySel.Enabled:= SelCount>0;
    TbxItemOutDelSel.Enabled:= SelCount>0;
    TbxItemOutDelNonparsed.Enabled:= Items.Count>0;
    TbxItemOutClear.Enabled:= Items.Count>0;
    TbxItemOutCopyAll.Enabled:= Items.Count>0;
    TbxItemOutFind.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.TBXItemOutCopyAllClick(Sender: TObject);
begin
  DoListCopyAll(ListOut);
end;

procedure TfmMain.DoListCopyAll(Sender: TTntListbox);
begin
  with Sender do
   if Items.Count>0 then
    TntClipboard.AsWideText:= Items.Text;
end;

procedure TfmMain.ApplyACP;
begin
  with ecACP do
  begin
    ItemHeight:= FontHeightToItemHeight(Font);
    Height:= ItemHeight * (DropDownCount+1);
  end;

  PluginACP.Font:= ecACP.Font;
  PluginACP.ItemHeight:= ecACP.ItemHeight;
  PluginACP.Height:= ecACP.Height;
  PluginACP.DropDownCount:= ecACP.DropDownCount;

  TemplatePopup.Font:= ecACP.Font;
  TemplatePopup.ListBox.Font:= ecACP.Font;
  TemplatePopup.ListBox.ItemHeight:= ecACP.ItemHeight;
  TemplatePopup.DropDownCount:= ecACP.DropDownCount;

  ApplyAcpColors;
end;

procedure TfmMain.ApplyOut;
begin
  ListVal.Color:= ListOut.Color;
  ListVal.Font:= ListOut.Font;

  ListTabs.Color:= Tree.Color;
  ListTabs.Font:= Tree.Font;

  TreeFind.Color:= ListOut.Color;
  TreeFind.Font:= ListOut.Font;

  ListPLog.Color:= ListOut.Color;
  ListPLog.Font:= ListOut.Font;

  MemoConsole.Color:= ListOut.Color;
  edConsole.Color:= ListOut.Color;

  ListOut.ItemHeight:= FontHeightToItemHeight(ListOut.Font);
  ListVal.ItemHeight:= ListOut.ItemHeight;
  ListPLog.ItemHeight:= ListOut.ItemHeight;

  ListOut.Invalidate;
  ListVal.Invalidate;
  TreeFind.Invalidate;
  ListPLog.Invalidate;
  ListTabs.Invalidate;
  MemoConsole.Invalidate;

  if Assigned(fmProj) then
  begin
    fmProj.TreeProj.Font:= Tree.Font;
    fmProj.TreeProj.Color:= Tree.Color;
    fmProj.TreeProj.Invalidate;
  end;

  if Assigned(fmClip) then
  begin
    fmClip.ListClip.Color:= ListOut.Color;
    fmClip.ListClip.Font:= ListOut.Font;
    fmClip.ListClip.ItemHeight:= ListOut.ItemHeight;
    fmClip.FColorSel:= opColorOutSelText;
    fmClip.FColorSelBk:= opColorOutSelBk;
    fmClip.ListClip.Invalidate;
  end;

  if Assigned(fmClips) then
  begin
    fmClips.List.Color:= ListOut.Color;
    fmClips.List.Font:= ListOut.Font;
    fmClips.List.ItemHeight:= ListOut.ItemHeight;
    fmClips.Combo.Color:= ListOut.Color;
    fmClips.Combo.Font:= ListOut.Font;
    fmClips.List.Invalidate;
  end;
end;

function TfmMain.IsNavigatableLine(const Str: Widestring): boolean;
var
  fn: Widestring;
  nLine, nCol: Integer;
  LogProps: ^TSynLogPanelProps;
begin
  if ListVal.Visible then
    LogProps:= @SynPanelPropsVal
  else
    LogProps:= @SynPanelPropsOut;

  fn:= LogProps.DefFilename;
  SParseOut(Str,
    LogProps.RegexStr,
    LogProps.RegexIdName,
    LogProps.RegexIdLine,
    LogProps.RegexIdCol,
    LogProps.ZeroBase,
    fn, nLine, nCol);

  Result:= (fn<>'') and (nLine>0);
end;

procedure TfmMain.ListOutDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
begin
  with Control as TTntListbox do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= opColorOutSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    if IsNavigatableLine(Items[Index]) then
    begin
      if odSelected in State then
        c:= opColorOutRedSelText
      else
        c:= opColorOutRedText
    end
    else
    begin
      if odSelected in State then
        c:= opColorOutSelText
      else
        c:= Font.Color;
    end;

    Canvas.Font.Color:= c;
    ecTextOut(Canvas, Rect.Left+1, Rect.Top, Items[Index]);
  end;
end;

procedure TfmMain.TBXItemOutDelSelClick(Sender: TObject);
begin
  ListOut.DeleteSelected;
end;

procedure TfmMain.TBXItemOutDelNonparsedClick(Sender: TObject);
var
  i: Integer;
begin
  with ListOut do
  begin
    Items.BeginUpdate;
    try
      for i:= Count-1 downto 0 do
        if not IsNavigatableLine(Items[i]) then
         Items.Delete(i);
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TfmMain.ListOutMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) then
  with Sender as TTntListbox do
  begin
    FOutItem:= ItemAtPos(Point(x, y), true);
    ItemIndex:= FOutItem;
  end;
end;

procedure TfmMain.ListOutMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  n: Integer;
  S: Widestring;
begin
  if not (Sender is TTntListbox) then
    raise Exception.Create('Sender isn''t Listbox');
  with Sender as TTntListBox do
  begin
    n:= ItemAtPos(Point(x, y), true);
    if n>=0 then
    begin
      S:= Items[n];
      if ecTextExtent(Canvas, S).cx >= ClientWidth then
      begin
        Hint:= S;
        Application.ActivateHint(ClientToScreen(Point(x, y)));
      end
      else
      begin
        Hint:= '';
        Application.HideHint;
      end;
    end;
  end;
end;

procedure TfmMain.FinderContinue(Sender: TObject; var ACanContinue: boolean);
var
  Tick: DWORD;
begin
  //allow to stop every 2 sec
  Tick:= GetTickCount;
  if Tick-FLastOnContinueCheck >= 2*1000 then
  begin
    FLastOnContinueCheck:= Tick;
    Application.ProcessMessages;
  end;
  ACanContinue:= not StopFind;
end;

procedure TfmMain.FinderFind_WithResultPaneAndBkmk(Sender: TObject;
      StartPos, EndPos: integer; var Accept: Boolean);
begin
  FinderFind_WithResultPane(Sender, StartPos, EndPos, Accept);
  FinderFind_WithBkmk(Sender, StartPos, EndPos, Accept);
end;

procedure TfmMain.FinderFind_WithResultPane(Sender: TObject;
      StartPos, EndPos: integer; var Accept: Boolean);
var
  Ed: TCustomSyntaxMemo;
  p: TPoint;
  ColNum, LineNum: integer;
  S: Widestring;
  Node, NodeFile: TTntTreeNode;
  Info: TSynFindInfo;
begin
  //find NodeFile: note with filename
  Node:= TreeFind.Items[TreeFind.Items.Count-1];
  if Node=FTreeRoot then
    NodeFile:= TreeFind.Items.AddChildObject(Node, FListResFN, TSynFindCount.Create)
  else
  begin
    if Assigned(Node.Data) and (TObject(Node.Data) is TSynFindInfo) and (TSynFindInfo(Node.Data).FN<>FListResFN) then
      NodeFile:= TreeFind.Items.AddChildObject(FTreeRoot, FListResFN, TSynFindCount.Create)
    else
      NodeFile:= Node.Parent;
  end;

  //store Finder.Matches into (NodeFile.Data).Matches
  if (TObject(NodeFile.Data) is TSynFindCount) then
    TSynFindCount(NodeFile.Data).Matches:= Finder.Matches;

  if (opMaxTreeMatches>0) then
    if (Finder.Matches>opMaxTreeMatches) then Exit;

  //get info about match and store it into Info
  Ed:= (Sender as TSynFinder).Control;
  p:= Ed.StrPosToCaretPos(StartPos);
  if not ((p.y >= 0) and (p.y < Ed.Lines.Count)) then Exit;
  ColNum:= p.X;
  LineNum:= p.Y;

  S:= Ed.Lines[LineNum];
  SReplaceAllW(S, #9, ' '); //replace tabs with 1 space (to not break BG hiliting) in Treeview

  Info:= TSynFindInfo.Create;
  Info.FN:= FListResFN;
  Info.Str:= S;
  Info.LineNum:= LineNum; //LineNum - 0-based
  Info.ColNum:= ColNum-1; //ColNum - 1-based
  Info.Len:= EndPos-StartPos;

  //add node under NodeFile
  if (opMaxTreeMatches>0) and
    (Finder.Matches=opMaxTreeMatches) then
    TreeFind.Items.AddChildObject(NodeFile, '...', Info)
  else
    TreeFind.Items.AddChildObject(NodeFile,
      SFindResPrefix(LineNum) + Copy(S, 1, cMaxTreeLen), Info);

  //scroll to last file, update
  FTreeRoot.Expand(false);
  if opSrExpand then
    TreeFind.Selected:= TreeFind.Items[TreeFind.Items.Count-1]
  else
    TreeFind.Selected:= NodeFile;
  Application.ProcessMessages;
  //Sleep(250); //debug
end;

procedure TfmMain.FinderFind_WithBkmk(Sender: TObject;
  StartPos, EndPos: integer; var Accept: Boolean);
var
  Ed: TCustomSyntaxMemo;
  LineNum: integer;
begin
  Ed:= (Sender as TSynFinder).Control;
  LineNum:= Ed.StrPosToCaretPos(StartPos).Y;
  if (LineNum>=0) and (LineNum<Ed.Lines.Count) then
    if Ed.BookmarkForLine(LineNum)<0 then
      CurrentFrame.DoBkToggle(Ed, LineNum);
end;

procedure TfmMain.UpdatePanelOut(n: TSynTabOut);
begin
  FTabOut:= n;
  ListOut.Visible:= n=tbOut;
  ListVal.Visible:= n=tbVal;
  TreeFind.Visible:= n=tbFind;
  ListPLog.Visible:= n=tbPluginsLog;
  plConsole.Visible:= n=tbConsole;

  if n=tbOut then
    tbTabsOut.ActiveTabIndex:= 0
  else
  if n=tbFind then
    tbTabsOut.ActiveTabIndex:= 1
  else
  if n=tbVal then
    tbTabsOut.ActiveTabIndex:= 2
  else
  if n=tbPluginsLog then
    tbTabsOut.ActiveTabIndex:= 3
  else
  if n=tbConsole then
    tbTabsOut.ActiveTabIndex:= 4;

  plOut.Caption:= tbTabsOut.ActiveTab.Caption;
end;

procedure TfmMain.UpdatePanelLeft(n: TSynTabLeft);
var
  IsTree, IsProj, IsTabs: boolean;
  i: Integer;
begin
  //is it plugin tab?
  if n>tbProj then
  begin
    i:= Ord(n)-cFixedLeftTabs;
    if (i>=Low(FPluginsPanel)) and (i<=High(FPluginsPanel)) then
      if FPluginsPanel[i].FToolButton<>nil then
      begin
        PluginPanelItemClick(FPluginsPanel[i].FToolButton);
        Exit
      end
      else
        n:= TSynTabLeft(0);
  end;

  FTabLeft:= n;
  IsTree:= n=tbTree;
  IsProj:= n=tbProj;
  IsTabs:= n=tbTabs;

  Tree.Visible:= IsTree;
  SyncTree;

  ListTabs.Visible:= IsTabs;

  if IsProj then
    LoadProj;
  if Assigned(fmProj) then
    fmProj.Visible:= IsProj;

  UpdateCheckLeftTabs(IsTree, IsProj, IsTabs);

  if IsTree then
    plTree.Caption:= DKLangConstW('capTree')
  else
  if IsProj then
    plTree.Caption:= DKLangConstW('capProj')
  else
  if IsTabs then
    plTree.Caption:= DKLangConstW('capTabs')
  else
    plTree.Caption:= '?';

  //plugins
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if FToolButton<>nil then
        FToolButton.Checked:= false;
  DoShowPlugin(-1);
end;

procedure TfmMain.UpdateCheckLeftTabs(IsTree, IsProj, IsTabs: boolean);
begin
  if IsTree then
    tbTabsLeft.ActiveTabIndex:= 0
  else
  if IsProj then
    tbTabsLeft.ActiveTabIndex:= 1
  else
  if IsTabs then
    tbTabsLeft.ActiveTabIndex:= 2;
end;

procedure TfmMain.UpdatePanelRight(n: TSynTabRight);
var
  IsMap, IsClip, IsClips: boolean;
begin
  FTabRight:= n;
  IsMap:= n=tbMap;
  IsClip:= n=tbClip;
  IsClips:= n=tbTextClips;

  if IsMap then
    LoadMap;
  if IsClips then
    LoadClips;

  if Assigned(fmClip) then
    fmClip.Visible:= IsClip;

  if Assigned(fmClips) then
    fmClips.Visible:= IsClips;

  if Assigned(fmMap) then
  begin
    fmMap.Visible:= IsMap;
    SyncMapData;
    SyncMapPos;
  end;

  if IsClip then
    tbTabsRight.ActiveTabIndex:= 0
  else
  if IsMap then
    tbTabsRight.ActiveTabIndex:= 1
  else
  if IsClips then
    tbTabsRight.ActiveTabIndex:= 2;

  if IsMap then
    plClip.Caption:= DKLangConstW('capMap')
  else
  if IsClip then
    plClip.Caption:= DKLangConstW('capClip')
  else
  if IsClips then
    plClip.Caption:= DKLangConstW('capClips')
  else
    plClip.Caption:= '?';
end;

procedure TfmMain.TBXItemOOOutClick(Sender: TObject);
begin
  UpdatePanelOut(tbOut);
end;

procedure TfmMain.TBXItemOOFindClick(Sender: TObject);
begin
  UpdatePanelOut(tbFind);
end;

(*
procedure TfmMain.ListFindDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c, cBk: TColor;
  lpos, n, n_ln, n_col, n_len:Integer;
  fn, S, Str:Widestring;
begin
  with Control as TTntListbox do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= opColorOutSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    n:= Integer(Items.Objects[Index]);
    if n>0 then
    begin
      if odSelected in State then
        c:= opColorOutRedSelText
      else
        c:= opColorOutRedText;
      Canvas.Font.Color:= c;

      S:= FListRes[n];
      fn:= SGetItem(S, '|');
      n_ln:= StrToInt(SGetItem(S, '|'));
      n_col:= StrToInt(SGetItem(S, '|'));
      n_len:= StrToInt(SGetItem(S, '|'));
      Str:= S;

      lpos:= Rect.Left+1;
      S:= ' '+WideExtractFileName(fn)+'('+IntToStr(n_ln)+'): ';
      ecTextOut(Canvas, lpos, Rect.Top, S);

      Inc(lpos, ecTextExtent(Canvas, S).cx);
      S:= Copy(Str, 1, n_col-1);
      ecTextOut(Canvas, lpos, Rect.Top, S);

      Inc(lpos, ecTextExtent(Canvas, S).cx);
      S:= Copy(Str, n_col, n_len);
        cBk:= Canvas.Brush.Color;
        Canvas.Brush.Color:= c xor opColorOutHi;
      ecTextOut(Canvas, lpos, Rect.Top, S);
        Canvas.Brush.Color:= cBk;

      Inc(lpos, ecTextExtent(Canvas, S).cx);
      S:= Copy(Str, n_col+n_len, MaxInt);
      ecTextOut(Canvas, lpos, Rect.Top, S);
    end
    else
    begin
      if odSelected in State then
        c:= opColorOutSelText
      else
        c:= Font.Color;
      Canvas.Font.Color:= c;
      ecTextOut(Canvas, Rect.Left+1, Rect.Top, Items[Index]);
    end;
  end;
end;
*)

procedure TfmMain.PopupFindPopup(Sender: TObject);
begin
  with TreeFind do
  begin
    TBXItemTreeFindNav.Enabled:= Selected<>nil;
    TBXItemTreeFindCopyToTab.Enabled:= Selected<>nil;
    TBXItemTreeFindCopyToClip.Enabled:= Selected<>nil;
    TBXItemTreeFindCopyToClipNode.Enabled:= Selected<>nil;
    TBXItemTreeFindClear.Enabled:= Items.Count>0;
    TBXItemTreeFindFind.Enabled:= Items.Count>0;
    TBXItemTreeFindExpand.Enabled:= Items.Count>0;
    TBXItemTreeFindExpandCur.Enabled:= Selected<>nil;
    TBXItemTreeFindCollapse.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.ecCopyAsRTFExecute(Sender: TObject);
var Exp: TRTFSyntExport;
begin
  Exp:= TRTFSyntExport.Create(nil);
  try
   Exp.SyntMemo:= CurrentEditor;
   Exp.ExportType:= etSelection;
   Exp.SaveToClipboard;
  finally
   Exp.Free;
  end;
end;

procedure TfmMain.acSetupLexHLExecute(Sender: TObject);
begin
  with SyntaxManager do
    if CurrentLexer<>nil then
      if CurrentLexer.Customize then
      begin
        SaveLexLib;
        Modified:= False;
      end;
end;

procedure TfmMain.TBXItemEExtrClick(Sender: TObject);
begin
  DoExtractText;
end;

procedure TfmMain.DoExtractText;
begin
  with TfmExtract.Create(Self) do
  try
    FSynIni:= Self.SynHistoryIni;
    SRCount:= opSaveSRHist;
    Memo:= Self.CurrentEditor;
    case ShowModal of
      mrYes:
      begin
        acNewTab.Execute;
        Frames[FrameCount-1].EditorMaster.Text:= List.Items.Text;
      end;
    end;
  finally
    Release;
  end;
end;

procedure TfmMain.PopupStatusEncPopup(Sender: TObject);
begin
  UpdateEncMenu(PopupStatusEnc);
end;

procedure TfmMain.UpdateEncMenu(M: TObject; AConvEnc: boolean = false);
  procedure Add(const S: Widestring; Tag: Integer);
  var
    Item: TTbCustomItem;
    MI: TSpTbxItem;
  begin
    if S = '-' then
      Item:= TSpTbxSeparatorItem.Create(Self)
    else
    begin
      MI:= TSpTbxItem.Create(Self);
      Item:= MI;
      MI.Caption:= S;
      MI.Tag:= Tag;
      if AConvEnc then
        MI.OnClick:= MenuitemConvertEncoding
      else
        MI.OnClick:= MenuitemSetEncoding;
      MI.RadioItem:= true;
      MI.Checked:= GetFrameEncoding(CurrentFrame) = Tag;
    end;

    if M is TSpTbxPopupMenu then
      (M as TSpTbxPopupMenu).Items.Add(Item)
    else
    if M is TSpTbxSubmenuItem then
      (M as TSpTbxSubmenuItem).Add(Item);
  end;

  function EncOK(n: integer): boolean;
  const
    p: AnsiString = 'pppp';
  begin
    Result:= MultiByteToWideChar(
      n, 0,
      PAnsiChar(p), Length(p),
      nil, 0) > 0;
  end;

  procedure Add2(M: TSpTbxSubmenuItem; const S: Widestring; Tag: Integer;
    IsUnicode: boolean = false);
  var
    MI: TSpTbxItem;
  begin
    if S = '-' then
      M.Add(TSpTbxSeparatorItem.Create(Self))
    else
    begin
      MI:= TSpTbxItem.Create(Self);
      MI.Caption:= S;
      MI.Tag:= Tag;
      if Tag > 0 then
        MI.Hint:= WideFormat(DKLangConstW('cpN'), [Tag]);
      MI.OnSelect:= ButtonOnSelect;
      if AConvEnc then
        MI.OnClick:= MenuitemConvertEncoding
      else
        MI.OnClick:= MenuitemSetEncoding;
      MI.RadioItem:= true;
      MI.Checked:= GetFrameEncoding(CurrentFrame) = Tag;
      if not IsUnicode then
        MI.Enabled:= EncOK(Tag);
      M.Add(MI);
    end;
  end;

  function AddSub(const s: Widestring): TSpTbxSubmenuItem;
  begin
    Result:= TSpTbxSubmenuItem.Create(Self);
    Result.Caption:= LocalizedEncodingName(S);
    if M is TSpTbxPopupMenu then
      (M as TSpTbxPopupMenu).Items.Add(Result)
    else
    if M is TSpTbxSubmenuItem then
      (M as TSpTbxSubmenuItem).Add(Result);
  end;

  procedure AddUni;
  var MSub: TSpTbxSubmenuItem;
  begin
    MSub:= AddSub(DKLangConstW('cpUnicode'));
    Add2(MSub, 'UTF-16', cp__Unicode, true);
    Add2(MSub, 'UTF-16 BE', cp__UnicodeBE, true);
    Add2(MSub, 'UTF-8', cp__UTF8, true);
    Add2(MSub, DKLangConstW('cpUTF8no'), cp__UTF8_noBOM, true);
    Add2(MSub, 'UTF-7', CP_UTF7, true);
  end;
  //----------------------------------
var
  SS, SK: TStringlist;
  Ini: TMemIniFile;
  i, j: Integer;
  MSub: TSpTbxSubmenuItem;
  Main: boolean;
begin
  if M is TSpTbxPopupMenu then
    (M as TSpTbxPopupMenu).Items.Clear
  else
  if M is TSpTbxSubmenuItem then
    (M as TSpTbxSubmenuItem).Clear;

  Main:= M is TSpTbxPopupMenu;
  if not Main then
  begin
    Add('ANSI (Windows)', CP_ACP);
    Add('OEM (DOS)', CP_OEMCP);
    Add('Mac', CP_MACCP);
    Add('-', 0);
    AddUni;
    Add('-', 0);
  end;

  //Read Enc.cfg
  SS:= TStringList.create;
  SK:= TStringlist.create;
  Ini:= TMemIniFile.Create(SynDir + 'Enc.cfg');
  try
    Ini.ReadSections(SS);
    for i:= 0 to SS.Count-1 do
    begin
      MSub:= AddSub(SS[i]);
      Ini.ReadSection(SS[i], SK);
      for j:= 0 to SK.Count-1 do
        Add2(MSub, SK[j],
          StrToInt(Ini.ReadString(SS[i], SK[j], '')) );
    end;
  finally
    FreeAndNil(SS);
    FreeAndNil(SK);
    FreeAndNil(Ini);
  end;

  if Main then
  begin
    Add('-', 0);
    AddUni;
    Add('-', 0);
    Add('Mac', CP_MACCP);
    Add('OEM (DOS)', CP_OEMCP);
    Add('ANSI (Windows)', CP_ACP);
  end;
end;

function TfmMain.GetFrameEncoding(F: TEditorFrame): integer;
begin
  case F.EditorMaster.TextSource.Lines.TextCoding of
    tcUTF8:
      Result:= IfThen(F.SkipBom, cp__UTF8_noBOM, cp__UTF8);
    tcUnicode:
      Result:= cp__Unicode;
    tcSwapUnicode:
      Result:= cp__UnicodeBE;
    tcAnsi:
      Result:= F.EditorMaster.TextSource.Lines.Codepage;
    else
      Result:= cp_ACP;
  end;
end;

function TfmMain.LocalizedEncodingName(const s: Widestring): Widestring;
var
  SL: Widestring;
  n: Integer;
begin
  Result:= s;
  //encoding translations are in DKLang resource
  SL:= DKLangConstW('cpLn');

  n:= Pos(','+s+'=', SL);
  if n=0 then Exit;
  Delete(SL, 1, n+Length(s)+1);
  Delete(SL, Pos(',', SL), MaxInt);
  Result:= SL;
end;

procedure TfmMain.ecSentCaseExecute(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSentCaseBlock);
end;

procedure TfmMain.DoZoomEditor(NZoom: Integer);
begin
  CurrentEditor.Zoom:= NZoom;
  TemplateEditor.Zoom:= CurrentEditor.Zoom;
  StatusItemZoom.Caption:= IntToStr(CurrentEditor.Zoom) + '%';
end;

procedure TfmMain.TBXItemZSet25Click(Sender: TObject);
begin
  DoZoomEditor((Sender as TComponent).Tag);
end;

procedure TfmMain.TBXItemZOtherClick(Sender: TObject);
var
  s: Widestring;
  n: Integer;
begin
  S:= '';
  if MsgInput('zMZoomPrompt', S) then
  begin
    n:= StrToIntDef(S, 0);
    if (n >= 20) and (n <= 500) then
      DoZoomEditor(n);
  end;
end;

procedure TfmMain.ListClipDblClick(Sender: TObject);
begin
  DoClipItemIns;
end;

procedure TfmMain.LoadClip;
//var
//  i: Integer;
begin
  {
  //handle command-line parameter /noclip
  if SynExe then
  begin
    for i:= 1 to ParamCount do
      if ParamStr(i) = '/noclip' then Exit;
  end;
  }

  if Assigned(fmClip) then Exit;
  fmClip:= TfmClip.Create(Self);
  with fmClip do
  begin
    Parent:= plClip;
    Align:= alClient;
    BorderStyle:= bsNone;
    ListClip.OnDblClick:= ListClipDblClick;
    ListClip.OnMouseMove:= ListOutMouseMove;
    ListClip.PopupMenu:= PopupClip;
    ListClip.OnKeyDown:= ListClipKeyDown;
    ListClip.BorderStyle:= SynBorderStyle;
    ApplyOut;
    Show;
    Set_;
  end;
end;

function TfmMain.SynClipsDir: string;
begin
  Result:= SynDir + 'Template\clips';
end;

function TfmMain.SynDictDir: string;
begin
  Result:= SynDir + 'Dictionaries';
end;

procedure TfmMain.LoadClips;
var
  S: string;
begin
  if Assigned(fmClips) then Exit;
  fmClips:= TfmClips.Create(Self);
  with fmClips do
  begin
    Parent:= plClip;
    Align:= alClient;
    BorderStyle:= bsNone;
    OnClick:= ClipsClick;
    OnInsPress:= ClipsInsPress;
    List.OnMouseMove:= ListOutMouseMove;
    List.PopupMenu:= PopupClips;
    List.BorderStyle:= SynBorderStyle;
    ApplyOut;

    //load clips
    InitClips(SynClipsDir);
    //restore recent clip
    with TIniFile.Create(SynHistoryIni) do
    try
      s:= ReadString('Win', 'Clip', '');
      if s<>'' then
      begin
        Combo.ItemIndex:= Combo.Items.IndexOf(s);
        ComboChange(Self);
      end;
    finally
      Free
    end;

    Show;
  end;
end;

procedure TfmMain.LoadProj;
begin
  if not Assigned(fmProj) then
  begin
    fmProj:= TfmProj.Create(Self);
    with fmProj do
    begin
      Parent:= plTree;
      Align:= alClient;
      BorderStyle:= bsNone;
      //
      TreeProj.BorderStyle:= SynBorderStyle;
      TreeProj.Font.Assign(Tree.Font);
      TreeProj.Color:= Tree.Color;
      tbProject.ChevronHint:= tbQS.ChevronHint;
      //
      OnPreview:= ProjPreview;
      OnFileOpen:= ProjFileOpen;
      OnRunTool:= ProjRunTool;
      OnAddEditorFile:= ProjAddEditorFile;
      OnAddEditorFilesAll:= ProjAddEditorFiles;
      OnGetLexer:= ProjGetLexer;
      OnGetLexers:= ProjGetLexers;
      OnGetWorkDir:= ProjGetWorkDir;
      OnGetProjDir:= ProjGetProjDir;
      OnSetProjDir:= ProjSetProjDir;
      OnGotoProjFile:= ProjGotoFile;
      OnLoadMRU:= ProjLoadMRU;
      OnUpdateMRU:= ProjUpdateMRU;
      OnProjectOpen:= ProjOpen;
      OnProjectClose:= ProjClose;
      TreeProj.OnKeyDown:= ProjKeyDown;
      //
      Show;
      //
      Self.TbxSubmenuItemProjTools.LinkSubitems:= TBXItemProjProp;
    end;
  end;
end;

procedure TfmMain.LoadProjPreview;
var
  Ini: TIniFile;
begin
  if not Assigned(FProjPreview) then
  begin
    FProjPreview:= TSpTbxDockablePanel.Create(Self);
    with FProjPreview do
    begin
      Parent:= plTree; //TBXDockRight;
      Options.RightAlignSpacer.FontSettings.Style:= []; //make font non-bold
      ShowCaptionWhenDocked:= opShowPanelTitles;
      DockMode:= dmCanFloat;
      HideWhenInactive:= false;

      OnClose:= ProjPreviewClose;
      OnVisibleChanged:= ProjPreviewVisibleChanged;

      ClientWidth:= 400;
      ClientHeight:= 300;
      FloatingClientWidth:= 600;
      FloatingClientHeight:= 400;
      FloatingPosition:= Point(200, 50);
      Floating:= true;

      FProjPreviewEditor:= TSyntaxMemo.Create(Self);
      with FProjPreviewEditor do
      begin
        Parent:= FProjPreview;
        Align:= alClient;
        BorderStyle:= bsNone;
        ReadOnly:= true;
        Gutter.Visible:= false;
        PopupMenu:= PopupPreviewEditor;
        Options:= Options + [soAlwaysShowCaret] - [soScrollLastLine];
        Lines.Clear;
        OnKeyDown:= ProjPreviewKeyDown;
      end;

      FProjPreviewButton:= TSpTbxItem.Create(Self);
      with FProjPreviewButton do
      begin
        Caption:= 'Open in editor';
        OnClick:= ProjPreviewButtonClick;
      end;
      FProjPreview.Items.Insert(1, FProjPreviewButton);

      Ini:= TIniFile.Create(SynIni);
      try
        LoadPanelProp(FProjPreview, Ini, 'Pre', true{DefFloating});
      finally
        FreeAndNil(Ini);
      end;

      Ini:= TIniFile.Create(SynHistoryIni);
      try
        FProjPreviewEditor.Zoom:= Ini.ReadInteger('Win', 'PreviewZoom', 100);
      finally
        FreeAndNil(Ini);
      end;

      Hide;
    end;
  end;
end;

procedure TfmMain.ApplyPreviewZoom(NValue: Integer);
var
  Ini: TIniFile;
begin
  if Assigned(FProjPreviewEditor) then
  begin
    FProjPreviewEditor.Zoom:= NValue;

    Ini:= TIniFile.Create(SynHistoryIni);
    try
      Ini.WriteInteger('Win', 'PreviewZoom', NValue);
    finally
      FreeAndNil(Ini);
    end;
  end;
end;

procedure TfmMain.LoadMap;
begin
  if Assigned(fmMap) then Exit;
  fmMap:= TfmMap.Create(Self);
  with fmMap do
  begin
    Parent:= plClip;
    Align:= alClient;
    BorderStyle:= bsNone;
    FOnMapClick:= MapClick;
    edMap.BorderStyle:= SynBorderStyle;
    ApplyMap;
    Show;
  end;
end;

procedure TfmMain.plClipResize(Sender: TObject);
begin
  {$ifndef FixRepaint}
  plClip.Invalidate;
  if Assigned(fmClip) then
    fmClip.ListClip.Invalidate;
  {$endif}
  tbViewMove(Self);
end;

procedure TfmMain.plClipVisibleChanged(Sender: TObject);
begin
  FixSplitters;
  ecShowClip.Checked:= plClip.Visible;

  SyncMapData;
  SyncMapPos;
end;

procedure TfmMain.ecShowClipExecute(Sender: TObject);
begin
  with plClip do
    Visible:= not Visible;
  if not plClip.Visible then
    FocusEditor;

  {$ifndef FixRepaint}
  DoRepaintTBs;
  DoRepaintTBs2;
  {$endif}
end;

procedure TfmMain.TBXItemClipClrClick(Sender: TObject);
begin
  fmClip.Clear;
end;

procedure TfmMain.ecGotoNextFindResultExecute(Sender: TObject);
begin
  DoJumpToNextSearchResult(true);
end;

procedure TfmMain.ecGotoPrevFindResultExecute(Sender: TObject);
begin
  DoJumpToNextSearchResult(false);
end;

procedure TfmMain.DoJumpToNextSearchResult(ANext: boolean);
var
  Node: TTntTreeNode;
begin
  with TreeFind do
  begin
    if Items.Count=0 then Exit;
    if Selected=nil then
      Selected:= Items[0];

    repeat
      if ANext then
        Node:= Selected.GetNext
      else
        Node:= Selected.GetPrev;
      if Node=nil then
        begin MsgBeep; Exit end;

      //allow to stop only on leaf nodes
      if Node.GetFirstChild<>nil then
      begin
        if ANext then
          Node:= Node.GetNext
        else
          Node:= Node.GetPrev;
      end;
      if Node=nil then
        begin MsgBeep; Exit end;

      Selected:= Node;
    until Selected.Data<>nil;

    TreeFindDblClick(Self);
  end;
end;

procedure TfmMain.DoJumpToNextOutputResult(AOutputPanel: boolean; ANext: boolean);
var
  List: TTntListbox;
  N, i: Integer;
  ok: boolean;
begin
  if AOutputPanel then
    List:= ListOut
  else
    List:= ListVal;

  //previous index (will be increased or decreased)
  if ANext then
    N:= -1
  else
    N:= List.Items.Count;

  //consider listbox selection
  for i:= 0 to List.Items.Count-1 do
    if List.Selected[i] then
      begin N:= i; Break end;

  repeat
    if ANext then Inc(N) else Dec(N);
    if not ((N>=0) and (N<List.Items.Count)) then
      begin MsgBeep; Exit end;

    List.ItemIndex:= N;
    for i:= 0 to List.Items.Count-1 do
      List.Selected[i]:= i=N;

    if AOutputPanel then
      ok:= DoNavigate_ListOut(List.Items[N])
    else
      ok:= DoNavigate_ListVal(List.Items[N]);
    if ok then Exit;
  until false;

  MsgBeep;
end;

procedure TfmMain.TBXItemESyncEdClick(Sender: TObject);
begin
  DoToggleSyncEditing;
end;

procedure TfmMain.DoToggleSyncEditing;
begin
  if not EditorToggleSyncEditing(CurrentEditor) then
    MsgBeep;
end;


procedure TfmMain.DoBracketsHilite(Ed: TSyntaxMemo);
var
  n1, n2: Integer;
begin
  if Ed<>nil then
    with Ed do
    begin
      if not opHiliteBrackets then
      begin
        //Invalidate needed to prevent bug: "Current line hiliting" leaves on multiple lines,
        //with SelectModeDefault=msColumn
        Invalidate;
        Exit;
      end;

      if HaveSelection then Exit;
      EditorFindBrackets(Ed, n1, n2);
      if n2<0 then Exit;

      Ed.BracketsHilited:= true;
      SearchMarks.Clear;
      SearchMarks.Add(ecLists.TRange.Create(n1, n1+1));
      SearchMarks.Add(ecLists.TRange.Create(n2, n2+1));
      Invalidate;
    end;
end;

procedure TfmMain.TBXItemFSesAddClick(Sender: TObject);
begin
  DoSessionAddDialog;
end;

procedure TfmMain.DoSessionAddDialog;
begin
  {//No need for "Add session":
  if not DoConfirmSaveSession(true) then
    Exit;}
  with OD_Session do
  begin
    InitialDir:= opLastDirSession;
    if Execute then
    begin
      SaveLastDir_Session(FileName);
      DoOpenSession(FileName, True);
      SynMruSessions.AddItem(FileName);
    end;
  end;
end;

procedure TfmMain.MsgBakEr(const fn: Widestring);
begin
  MsgError(WideFormat(DKLangConstW('MBakEr'), [fn]), Handle);
end;

procedure TfmMain.MsgBakOk(const fn: Widestring);
begin
  MsgInfo(WideFormat(DKLangConstW('MBakOk'), [fn]), Handle);
end;

procedure TfmMain.DoBackup(const AFilename: Widestring);
var
  Dest: Widestring;
const
  ROMask = FILE_ATTRIBUTE_READONLY or FILE_ATTRIBUTE_HIDDEN or FILE_ATTRIBUTE_SYSTEM;
begin
  case opFileBackup of
    cBakAppdata:
      begin
      Dest:= FAppDataPath + 'SynWrite\Backup';
      WideForceDirectories(Dest);
      Dest:= Dest+'\'+WideExtractFileName(AFileName);
      end;
    cBakSameDir:
      Dest:= AFileName+'.bak';
    else
      Exit;
  end;
  if IsFileExist(AFileName) and (FGetFileSize(AFileName)>0) then
  begin
    //clear RO/H/S attr
    if IsFileExist(Dest) then
      SetFileAttributesW(PWChar(Dest),
        GetFileAttributesW(PWChar(Dest)) and not ROMask);

    if not FFileCopy(AFileName, Dest) then
      MsgBakEr(Dest);
  end;
end;

function TfmMain.LastDir: Widestring;
begin
  case opLastDir of
    cLastDirCurrentFile:
    begin
      if (CurrentFrame<>nil) and (CurrentFrame.FileName<>'') then
        Result:= WideExtractFileDir(CurrentFrame.FileName)
      else Result:= opLastDirPath
    end
    else
      Result:= opLastDirPath;
  end;

  if (Result<>'') and not IsDirExist(Result) then
  begin
    DoHint(DKLangConstW('MNFoundFold')+': '+Result);
    MsgBeep;
    Result:= 'C:\';
  end;
end;

function TfmMain.LastDir_UntitledFile: Widestring;
begin
  with TIniFile.Create(SynHistoryIni) do
  try
    Result:= UTF8Decode(ReadString('Hist', 'DirUntitled', ''));
  finally
    Free
  end;

  if Result='' then
    Result:= opLastDirPath;
  if (Result<>'') and not IsDirExist(Result) then
  begin
    DoHint(DKLangConstW('MNFoundFold')+': '+Result);
    MsgBeep;
    Result:= 'C:\';
  end;
end;

procedure TfmMain.SaveLastDir_UntitledFile(const FN: Widestring);
begin
  with TIniFile.Create(SynHistoryIni) do
  try
    WriteString('Hist', 'DirUntitled', UTF8Encode(WideExtractFileDir(FN)));
  finally
    Free
  end;
end;

procedure TfmMain.SaveLastDir(const FN, Filter: Widestring; FilterIndex: integer);
begin
  if opLastDir<>cLastDirRemember then Exit;

  opLastDirPath:= WideExtractFileDir(FN);
  opHistFilter:= FilterIndex;
  if FilterIndex >= SFilterNum(Filter) then
    opHistFilter:= 0;

  with TIniFile.Create(SynIni) do
  try
    WriteString('Hist', 'Dir', UTF8Encode(opLastDirPath));
    WriteInteger('Hist', 'Filter', opHistFilter);
  finally
    Free;
  end;
end;

procedure TfmMain.SaveLastDir_Session(const FN: Widestring);
begin
  opLastDirSession:= WideExtractFileDir(FN);
  //
  with TIniFile.Create(SynIni) do
  try
    WriteString('Hist', 'DirSess', UTF8Encode(opLastDirSession));
  finally
    Free;
  end;
end;

procedure TfmMain.ApplyEdOptions;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      //apply "Show wrap mark"
      EditorMaster.Gutter.LineBreakObj:= IfThen(opShowWrapMark, 0, -1);
      EditorSlave.Gutter.LineBreakObj:= EditorMaster.Gutter.LineBreakObj;
      //apply non-printed
      UpdateEditorNonPrinted(EditorMaster);
      UpdateEditorNonPrinted(EditorSlave);
    end;
end;

procedure TfmMain.ApplyFonts;
begin
  TemplateEditor.HorzRuler.Height:=
    5 + Round(Abs(TemplateEditor.HorzRuler.Font.Height) * TemplateEditor.Zoom / 100);

  if Assigned(fmProj) then
  begin
    fmProj.TreeProj.Font:= Tree.Font;
    fmProj.TreeProj.Color:= Tree.Color;
  end;

  ApplyColorsFontsToFrames;
end;

procedure TfmMain.ApplyColorsFontsToFrames;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      DoColorsArrayApply(ColorsArray, EditorMaster);
      DoColorsArrayApply(ColorsArray, EditorSlave);
    end;
end;

procedure TfmMain.ApplyColors;
begin
  ListOut.Invalidate;
  TreeFind.Invalidate;
  ListVal.Invalidate;
  ListPLog.Invalidate;
  MemoConsole.Invalidate;

  ApplyTabOptions;
  Groups.Invalidate;

  ApplyFrames;
  ApplyAcpColors;

  if Assigned(fmClip) then
  begin
    fmClip.ListClip.Color:= ListOut.Color;
    fmClip.FColorSel:= opColorOutSelText;
    fmClip.FColorSelBk:= opColorOutSelBk;
    fmClip.ListClip.Invalidate;
  end;

  if Assigned(fmProj) then
    fmProj.TreeProj.Color:= Tree.Color;
end;

procedure TfmMain.ApplyAcpColors;
begin
  ecACP.BgColor:= opColorAcpBg;
  PluginACP.BgColor:= opColorAcpBg;
  TemplatePopup.BgColor:= opColorAcpBg;

  ecACP.Font.Color:= opColorAcpText;
  PluginACP.Font.Color:= opColorAcpText;
  TemplatePopup.Font.Color:= opColorAcpText;

  //ecACP uses style #1 from SyntStyles
  SyntStyles.Styles[1].Font.Color:= opColorAcpText;
end;

procedure TfmMain.ecFullScrExecute(Sender: TObject);
begin
  ShowFullScreen:= not ShowFullScreen;
  UpdateStatusbar;
end;

procedure TfmMain.SetOnTop(V: boolean);
begin
  if SynExe then
  if FOnTop <> V then
  begin
    FOnTop:= V;
    SetFormOnTop(Application.MainForm.Handle, V);
  end;
end;

procedure TfmMain.SetFS(AValue: boolean);
begin
  if FFullScr <> AValue then
  begin
    FFullScr:= AValue;
    SetFormStyle(Application.MainForm, not AValue);
    if AValue then
    begin
      FBoundsRectOld:= Application.MainForm.BoundsRect;
      Application.MainForm.BoundsRect:= Monitor.BoundsRect;
    end
    else
    begin
      Application.MainForm.BoundsRect:= FBoundsRectOld;
    end;
    TBXDockTop.Visible:= not AValue;
    DoRepaint;
  end;
end;

procedure TfmMain.edQsExit(Sender: TObject);
begin
  if ShowFullScreen then
    if tbQs.CurrentDock= TBXDockTop then
    begin
      TBXDockTop.Hide;
      DoRepaint;
    end;
end;

procedure TfmMain.DoRepaint;
begin
  FNeedRepaint:= true;
end;

procedure TfmMain.FocusEditor;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Self.Enabled then
    if (Ed<>nil) and Ed.CanFocus then
      Ed.SetFocus;
end;

procedure TfmMain.DoClearSearchHistory;
begin
  with TIniFile.Create(SynHistoryIni) do
  try
    EraseSection('SearchText');
    EraseSection('ReplaceHist');
    EraseSection('FilesIncHist');
    EraseSection('FilesExcHist');
    EraseSection('FilesDirHist');
    EraseSection('ExtractHist');
    EraseSection('CharCode');
  finally
    Free;
  end;

  if Assigned(fmSR) then
    with fmSR do
    begin
      ed1.Items.Clear;
      ed2.Items.Clear;
      Text1:= '';
      Text2:= '';
    end;
end;

procedure TfmMain.DoCopyFilenameToClipboard(F: TEditorFrame; Cmd: TSynCopyNameCmd);
begin
  if (F<>nil) and (F.FileName<>'') then
    case Cmd of
      scmdCopyFileName: TntClipboard.AsWideText:= WideExtractFileName(F.FileName);
      scmdCopyFullName: TntClipboard.AsWideText:= F.FileName;
      scmdCopyFilePath: TntClipboard.AsWideText:= WideExtractFileDir(F.FileName);
    end;
end;

procedure TfmMain.TBXItemTabCopyFNClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFileName);
end;

procedure TfmMain.TBXItemTabCopyFullClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFullName);
end;

procedure TfmMain.TBXItemTabCopyDirClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFilePath);
end;

procedure TfmMain.TBXItemSp50Click(Sender: TObject);
begin
  ecSplit50_50.Execute;
end;

procedure TfmMain.TBXItemTbCloseAllClick(Sender: TObject);
begin
  acCloseAll.Execute;
end;

procedure TfmMain.ecSplitViewsVertHorzExecute(Sender: TObject);
begin
  case Groups.Mode of
    gm2Horz: Groups.Mode:= gm2Vert;
    gm2Vert: Groups.Mode:= gm2Horz;
  end;
end;

procedure TfmMain.ecSyncScrollHExecute(Sender: TObject);
begin
  with ecSyncScrollH do
    Checked:= not Checked;
end;

procedure TfmMain.ecSyncScrollVExecute(Sender: TObject);
var
  EdOther: TSyntaxMemo;
  View1st: boolean;
begin
  with ecSyncScrollV do
  begin
    Checked:= not Checked;
    if Checked then
      DoGetOppositeEditor(CurrentEditor, EdOther, FCurrDiffScrollY, View1st);
  end;
end;

procedure TfmMain.DoGetOppositeEditor(
  const EdSrc: TSyntaxMemo;
  var EdOther: TSyntaxMemo;
  var DiffInTopLines: Integer;
  var EdSrcOnGroup1: boolean);
var
  F: TEditorFrame;
begin
  EdOther:= nil;

  EdSrcOnGroup1:= (FrameOfEditor(EdSrc).Parent as TATPages) = Groups.Pages1;
  if EdSrcOnGroup1 then
    F:= GetCurrentFrameInPages(Groups.Pages2)
  else
    F:= GetCurrentFrameInPages(Groups.Pages1);

  if F<>nil then
  begin
    EdOther:= F.EditorMaster;
    DiffInTopLines:= EdOther.TopLine - EdSrc.TopLine;
    if not EdSrcOnGroup1 then
      DiffInTopLines:= -DiffInTopLines;
  end;
end;

procedure TfmMain.DoSyncScroll(EdSrc: TSyntaxMemo);
var
  EdOther: TSyntaxMemo;
  DiffY: Integer;
  View1st: boolean;
begin
  if not (ecSyncScrollV.Checked or ecSyncScrollH.Checked) then Exit;
  if EdSrc=nil then Exit;

  DoGetOppositeEditor(EdSrc, EdOther, DiffY, View1st);
  if EdOther=nil then Exit;
  if EdOther.Lines.Count=0 then Exit;

  DiffY:= FCurrDiffScrollY;
  if not View1st then
    DiffY:= -DiffY;

  if ecSyncScrollV.Checked then
    EdOther.TopLine:= EdSrc.TopLine + DiffY;
  if ecSyncScrollH.Checked then
    EdOther.ScrollPosX:= EdSrc.ScrollPosX;
end;

procedure TfmMain.TBXItemOShellClick(Sender: TObject);
begin
  DoConfigShellOptions;
end;

procedure TfmMain.DoConfigShellOptions;
var
  i: Integer;
begin
  with TfmShell.Create(nil) do
  try
    FLex.Clear;
    for i:= 0 to SyntaxManager.AnalyzerCount-1 do
      with SyntaxManager.Analyzers[i] do
        if (not Internal) and (Extentions <> '') then
          FLex.Add(LexerName + '=' + Extentions);
    ShowModal;
  finally
    Release
  end;
end;

procedure TfmMain.UpdateRO;
  procedure RO;
  begin
    if not ecReadOnly.Checked then
      ecReadOnly.Execute;
  end;
  procedure NoRO;
  begin
    if ecReadOnly.Checked then
      ecReadOnly.Execute;
  end;
var
  s: string;
  i, N: Integer;
begin
  if not SynExe then
  begin
    if not QuickView then
      if opListerStartRO then RO;
    if QuickView then
      if opListerQVReadOnly then RO else NoRO;
  end
  else
  begin
    //consider cmdline param
    for i:= 1 to ParamCount do
    begin
      s:= ParamStr(i);
      if s=cSynParamRO then
      begin
        RO;
        Continue
      end;
      if SBegin(s, cSynParamLineNum) then
      begin
        Delete(s, 1, Length(cSynParamLineNum));
        N:= StrToIntDef(s, -1)-1;
        if N>=0 then
          CurrentEditor.CaretPos:= Point(0, N);
      end;
    end;
  end;
end;

procedure TfmMain.ecOnTopExecute(Sender: TObject);
begin
  ShowOnTop:= not ShowOnTop;
  ecOnTop.Checked:= ShowOnTop;
end;

procedure TfmMain.tbMenuShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Assigned(fmSR) and fmSR.Active then
  begin
    Handled:= fmSR.IsShortCut(Msg);
    Exit
  end;
end;

procedure TfmMain.TBXItemEFillBlockClick(Sender: TObject);
begin
  DoFillBlock;
end;

procedure TfmMain.DoFillBlock;
begin
end;

//this function deprecated.
(*
procedure TfmMain.DoFillBlock;
var
  Ed: TSyntaxMemo;
  sData: Widestring;
  bKeep: boolean;
begin

  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;
  if not Ed.HaveSelection then Exit;

  if Ed.SelectMode <> msColumn then
  begin
    MsgWarn(DKLangConstW('vert'), Handle);
    Exit
  end;

  with TfmFillBlock.Create(Self) do
  try
    if ShowModal<>mrOk then Exit;
    sData:= edLine.Text;
    bKeep:= cbKeepWidth.Checked;
  finally
    Free
  end;

  EditorFillBlockRect(Ed, sData, bKeep);
end;
*)

procedure TfmMain.TBXItemEInsTextClick(Sender: TObject);
begin
  DoInsertTextDialog;
end;

procedure TfmMain.DoInsertTextDialog;
var
  Ed: TSyntaxMemo;
  F: TEditorFrame;
  Data: TSynEditorInsertData;
begin
  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;
  F:= FrameOfEditor(Ed);
  FillChar(Data, SizeOf(Data), 0);

  with TfmInsTxt.Create(nil) do
  try
    SIni:= Self.SynHistoryIni;
    SetMode(EditorHasMultilineSelection(Ed));
    if ShowModal<>mrOk then Exit;

    Data.SText1:= ed1.Text;
    Data.SText2:= ed2.Text;
    if bText.Checked then Data.InsMode:= mTxt else
     if bNumber.Checked then Data.InsMode:= mNum else
      Data.InsMode:= mBul;
    if bAtCol.Checked then Data.InsPos:= pCol else
     if bAfterSp.Checked then Data.InsPos:= pAfterSp else
      Data.InsPos:= pAfterStr;
    Data.InsCol:= edCol.Value;
    Data.InsStrAfter:= edStrAfter.Text;
    Data.SkipEmpty:= cbSkip.Checked;
    Data.NStart:= edStart.Value;
    Data.NDigits:= edDigits.Value;
    Data.NTail:= edTail.Text;
    Data.NBegin:= edBegin.Text;
    Data.NCounter:= edCounter.Value;
  finally
    Free
  end;

  F.LockMapUpdate:= true;
  FLockUpdate:= true;
  try
    EditorInsertTextData(Ed, Data);
  finally
    FLockUpdate:= false;
    F.LockMapUpdate:= false;
  end;
end;

function SDirStrip(const s: Widestring): Widestring;
  begin
    Result:= s;
    while (Result<>'') and
      (char(Result[Length(Result)]) in ['*', '\', ' ']) do
      SetLength(Result, Length(Result)-1);
  end;

function DoFindFileInSubdirs(
  const sel: Widestring;
  dir: Widestring;
  const def_ext: Widestring): Widestring;
var
  SubDirs, WithPath: boolean;
  fn: Widestring;
begin
  Result:= '';
  if (sel='') or (dir='') then Exit;

  WithPath:= WideExtractFileDir(sel) <> '';
  SubDirs:= (dir[Length(dir)] = '*');
  dir:= SDirStrip(dir);

  //try exact name in dir
  fn:= dir + '\' + WideExtractFileName(sel);
  if IsFileExist(fn) then
    begin Result:= fn; Exit end;

  //try name plus default_ext in dir
  if (WideExtractFileExt(fn) = '') and (def_ext <> '') then
    fn:= fn + '.' + def_ext;
  if IsFileExist(fn) then
    begin Result:= fn; Exit end;

  //try recursive search from dir (if * at end)
  if SubDirs and not WithPath then
  begin
    fn:= sel;
    FFindInSubdirs(fn, dir, Result);
    if IsFileExist(Result) then Exit;

    if (WideExtractFileExt(sel) = '') and (def_ext <> '') then
    begin
      fn:= sel + '.' + def_ext;
      FFindInSubdirs(fn, dir, Result);
      if IsFileExist(Result) then Exit;
    end;
  end;
end;

procedure TfmMain.TBXItemCtxOpenSelClick(Sender: TObject);
begin
  acOpenBySelection.Execute;
end;

procedure TfmMain.DoOpenBySelection;
var
  sel, fn, s, dir, ext: Widestring;
  n, LnNum: integer;
  Dirs, Dirs2: TTntStringList;
begin
  LnNum:= 0;
  sel:= CurrentEditor.SelText;
  if (sel='') or (Pos(#13, sel)>0) or (Pos(#10, sel)>0) then
    begin MsgBeep; Exit end;

  //parse text "filename(LineNum)"
  if sel[Length(sel)]=')' then
  begin
    n:= Length(sel);
    while (n>0) and (sel[n]<>'(') do Dec(n);
    if n=0 then
      begin MsgBeep; Exit end;
    s:= Copy(sel, n, MaxInt);
    s:= Copy(s, 2, Length(s)-2);
    LnNum:= StrToIntDef(s, 1);
    Delete(sel, n, MaxInt);
    sel:= Trim(sel);
    if sel='' then
      begin MsgBeep; Exit end;
  end;

  //ext - 1st extension of lexer
  if CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer<>nil then
    ext:= CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer.Extentions
  else
    ext:= '';
  SDeleteFromW(ext, ' ');

  //try filename in current dir
  fn:= sel;
  if WideExtractFileDir(fn)='' then
    if CurrentFrame.FileName<>'' then
      fn:= WideExtractFilePath(CurrentFrame.FileName)+fn
    else
      fn:= WideGetCurrentDir+'\'+fn;

  //try filename + def_ext in current dir
  if not IsFileExist(fn) then
    if ext<>'' then
      fn:= fn + '.' + ext;

  //find filename in Project paths
  if not IsFileExist(fn) then
  try
    Dirs:= TTntStringList.Create;
    Dirs2:= TTntStringList.Create;

    SStringToList(opProjPaths, Dirs);
    if Assigned(fmProj) and (fmProj.FOpts.SearchDirs<>'') then
    begin
      SStringToList(fmProj.FOpts.SearchDirs, Dirs2);
      Dirs.AddStrings(Dirs2);
    end;

    //a. search in matched folder first
    fn:= '';
    for n:= 0 to Dirs.Count-1 do
    begin
      dir:= SDirStrip(Dirs[n]);
      if Pos(
        LowerCase(dir + '\'),
        LowerCase(WideExtractFilePath(CurrentFrame.FileName))) > 0 then
      begin
        //Msg('m'#13+dir);
        fn:= DoFindFileInSubdirs(sel, Dirs[n], ext);
        if IsFileExist(fn) then
        begin
          Dirs.Delete(n);
          Break;
        end;
      end;
    end;

    //b. search in other project folders
    if fn = '' then
      for n:= 0 to Dirs.Count-1 do
      begin
        fn:= DoFindFileInSubdirs(sel, Dirs[n], ext);
        if IsFileExist(fn) then Break;
      end;
  finally
    FreeAndNil(Dirs);
    FreeAndNil(Dirs2);
  end;

  //stop trying, show msg
  if not IsFileExist(fn) then
    MsgNoFile(WideExtractFileName(sel))
  else
  begin
    //open with warning about non-text content
    if IsFileText(fn) or MsgConfirmBinary(fn, Handle) then
    begin
      DoOpenFile(fn);
      if LnNum > 0 then
        CurrentEditor.CaretPos:= Point(0, LnNum-1);
    end;
  end;
end;

procedure TfmMain.TBXItemCtxTool1Click(Sender: TObject);
begin
  RunTool(opTools[1]);
end;

procedure TfmMain.TBXItemCtxTool2Click(Sender: TObject);
begin
  RunTool(opTools[2]);
end;

procedure TfmMain.TBXItemCtxTool3Click(Sender: TObject);
begin
  RunTool(opTools[3]);
end;

procedure TfmMain.TBXItemCtxTool4Click(Sender: TObject);
begin
  RunTool(opTools[4]);
end;

procedure TfmMain.TBXItemCtxTool5Click(Sender: TObject);
begin
  RunTool(opTools[5]);
end;

procedure TfmMain.TBXItemCtxTool6Click(Sender: TObject);
begin
  RunTool(opTools[6]);
end;

procedure TfmMain.TBXItemCtxTool7Click(Sender: TObject);
begin
  RunTool(opTools[7]);
end;

procedure TfmMain.TBXItemCtxTool8Click(Sender: TObject);
begin
  RunTool(opTools[8]);
end;

procedure TfmMain.TBXItemCtxTool9Click(Sender: TObject);
begin
  RunTool(opTools[9]);
end;

procedure TfmMain.TBXItemCtxTool10Click(Sender: TObject);
begin
  RunTool(opTools[10]);
end;

procedure TfmMain.TBXItemCtxTool11Click(Sender: TObject);
begin
  RunTool(opTools[11]);
end;

procedure TfmMain.TBXItemCtxTool12Click(Sender: TObject);
begin
  RunTool(opTools[12]);
end;

procedure TfmMain.TbxItemCtxTool13Click(Sender: TObject);
begin
  RunTool(opTools[13]);
end;

procedure TfmMain.TbxItemCtxTool14Click(Sender: TObject);
begin
  RunTool(opTools[14]);
end;

procedure TfmMain.TbxItemCtxTool15Click(Sender: TObject);
begin
  RunTool(opTools[15]);
end;

procedure TfmMain.TbxItemCtxTool16Click(Sender: TObject);
begin
  RunTool(opTools[16]);
end;

procedure TfmMain.FinderProgress(CurPos, MaxPos: integer);
var
  N: Int64;
begin
  if Assigned(FinderPro) then
  begin
    if MaxPos=0 then
      Inc(MaxPos);

    if FFinderTotalSize>0 then
      N:= Int64(FFinderDoneSize + CurPos) * 100 div FFinderTotalSize
    else
      N:= Int64(CurPos) * 100 div MaxPos;

    //don't check "if FinderProNum<>N", this slows down
    FinderProNum:= N;
    FinderPro.Progress:= N;
    {
    //
    //Need EndUpdate/BeginUpdate if locked
    b:= CurrentEditor.UpdateCount>0;
    if b then
      CurrentEditor.EndUpdate;
      }
    Application.ProcessMessages;
    {
    if b then
      CurrentEditor.BeginUpdate;
      }
  end;
end;

procedure TfmMain.DoAcpFromFile(List, Display: ecUnicode.TWideStrings);
var
  S, SWord: Widestring;
  LL: TTntStringList;
  i, NCaret: Integer;
  IsWord, AtCaret: boolean;
begin
  if not opAcpFile then
    Exit;

  S:= CurrentEditor.Text;
  i:= Round(opAcpFileSize * (1024*1024));
  if Length(S) > i then
    SetLength(S, i);

  LL:= TTntStringList.Create;
  LL.Sorted:= true;
  LL.Duplicates:= dupIgnore;
  SWord:= '';
  NCaret:= CurrentEditor.CaretStrPos;
  AtCaret:= false;

  try
    for i:= 1 to Length(S)+1 {Len+1} do
    begin
      //if i mod 10 = 0 then
      //  MsgAcpFile('Searching '+IntToStr(i*100 div Length(s))+'%');

      if i<=Length(S) then
        IsWord:= IsWordChar(S[i]) or
          (Pos(S[i], opAcpChars)>0) or
          (S[i]='%') or
          ((S[i]='.') and (i<Length(S)) and IsWordChar(S[i+1]))
      else
        IsWord:= false;

      //trailing ':' can't be wordchar (':' is wordchar for CSS)
      if (i>1) and (S[i]=':') and IsWordChar(S[i-1]) then
        IsWord:= false;

      if not IsWord then
      begin
        if Length(SWord) >= opAcpFileChars then
          if not AtCaret then
            LL.Add(SWord);
        SWord:= '';
        AtCaret:= false;
      end
      else
      begin
        SWord:= SWord + S[i];
        if i=NCaret then
          AtCaret:= true;
      end;
    end;

    S:= SAcpItem(DKLangConstW('typed'), ''); //beginning of Display string
    for i:= 0 to LL.Count-1 do
    begin
      //if List.IndexOf(LL[i])<0 then //<-- don't use, it freezes on large file!!
      List.Add(LL[i]);
      Display.Add(S + LL[i]);
    end;
  finally
    FreeAndNil(LL);
    DoHint('');
  end;
end;

procedure TfmMain.DoSaveStyles(Sender: TObject);
begin
  SaveLexerStylesToFile(Sender as TSyntAnalyzer, SynStylesIni);
end;

procedure TfmMain.TBXItemORestoreStylesClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RestoreStylesDialog);
end;


procedure TfmMain.DoConfigRestoreStyles;
  //------
  function FindAn(const S: string): TSyntAnalyzer;
  var i: Integer;
  begin
    Result:= nil;
    with SyntaxManager do
      for i:= 0 to AnalyzerCount-1 do
        if Analyzers[i].LexerName = S {case-sens!} then
          begin Result:= Analyzers[i]; Exit end;
  end;
var
  i: Integer;
  An: TSyntAnalyzer;
  S: string;
begin
  with TfmLoadLex.Create(nil) do
  try
    SIniStyles:= Self.SynStylesIni;
    if ShowModal=mrOk then
    begin
      for i:= 0 to List.Count-1 do
        if List.Checked[i] then
        begin
          An:= FindAn(List.Items[i]);
          if An<>nil then
          begin
            LoadLexerStylesFromFile(An, SynStylesIni);
            S:= S + List.Items[i] + #13;
          end
          else
            MsgWarn(WideFormat(DKLangConstW('MNLex'), [List.Items[i]]), Handle);
        end;
      SaveLexLib;
      //MsgInfo(S);
    end;
  finally
    Release
  end;
end;

procedure TfmMain.TBXItemCtxCustomizeClick(Sender: TObject);
begin
  acSetup.Execute;
end;

type
  TTreeCrack = class(TCustomSyntaxTreeview);

procedure TfmMain.TreeKeyPress(Sender: TObject; var Key: Char);
begin
  //disable beep on Enter/Esc
  if Key=#13 then Key:= #0;
  if Key=#27 then Key:= #0;
end;

procedure TfmMain.TreeKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  sh: TShortcut;
begin
  //Enter in tree
  if (Key=vk_return) and (Shift=[]) then
  begin
    TTreeCrack(Tree).DblClick;
    Key:= 0;
    Exit
  end;

  sh:= Shortcut(Key, Shift);
  if sh=0 then Exit;

  //Ctrl+F in tree
  if IsShortcutOfCmd(sh, smFindDialog) then
  begin
    ecFindInTree.Execute;
    Key:= 0;
    Exit;
  end;
  //F3 in tree
  if IsShortcutOfCmd(sh, smFindNext) then
  begin
    ecFindInTreeNext.Execute;
    Key:= 0;
    Exit;
  end;
  //Ctrl+F3 in tree
  if IsShortcutOfCmd(sh, smFindPrev) then
  begin
    ecFindInTreePrev.Execute;
    Key:= 0;
    Exit;
  end;

  DoHandleKeysInPanels(Key, Shift);
end;

function TfmMain.DoClipItem: Widestring;
begin
  Result:= '';
  if Assigned(fmClip) then
  with fmClip do
    if ListClip.ItemIndex >= 0 then
      Result:= ItemAt(ListClip.ItemIndex);
end;

procedure TfmMain.DoClipItemCopy;
var
  s: Widestring;
begin
  s:= DoClipItem;
  if s<>'' then
    TntClipboard.AsWideText:= s;
end;

procedure TfmMain.DoClipItemIns;
var
  s: Widestring;
begin
  s:= DoClipItem;
  if s<>'' then
    with CurrentEditor do
    begin
      //Need separate action in Undo list (after typing text)
      //EditorSetModified(CurrentEditor);
      InsertText(s);
    end;
end;

procedure TfmMain.ListClipKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Enter in clip
  if (Key=vk_return) and (Shift=[]) then
  begin
    DoClipItemIns;
    Key:= 0;
    Exit
  end;
  //Ctrl+C in clip
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    DoClipItemCopy;
    Key:= 0;
    Exit
  end;
  //Ctrl+F in clip
  if IsShortcutOfCmd(Shortcut(Key, Shift), smFindDialog) then
  begin
    DoFindInClipPanel;
    Key:= 0;
    Exit
  end;
  //Shift+Del in clip
  if (Key=VK_DELETE) and (Shift=[ssShift]) then
  begin
    fmClip.Clear;
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.DoTreeFocus;
begin
  UpdatePanelLeft(tbTree);
  if Self.Enabled and Tree.CanFocus then
    Tree.SetFocus;
end;

procedure TfmMain.ecToggleFocusTreeExecute(Sender: TObject);
begin
  if not plTree.Visible then
  begin
    ecShowTree.Execute;
    DoTreeFocus;
  end
  else
  if Tree.Focused then
    FocusEditor
  else
    DoTreeFocus;
end;

procedure TfmMain.ecToggleFocusClipExecute(Sender: TObject);
begin
  if not plClip.Visible then
  begin
    ecShowClip.Execute;
    UpdatePanelRight(tbClip);
    if fmClip.ListClip.CanFocus then
      fmClip.ListClip.SetFocus;
  end
  else
  if fmClip.ListClip.Focused then
    FocusEditor
  else
  begin
    UpdatePanelRight(tbClip);
    if fmClip.ListClip.CanFocus then
      fmClip.ListClip.SetFocus
  end;
end;

procedure TfmMain.UpdateQVTree;
begin
  if opListerQVTree<>'' then
    plTree.Visible:= SFileExtensionMatch(fn, opListerQVTree);
end;

procedure TfmMain.DoZenExpand;
var
  s: WideString;
  i, iSt, iLen, i1: Integer;
  sPad: string;
begin
  with CurrentEditor do
  begin
    if ReadOnly then Exit;
    if CaretPos.X=0 then
      begin MsgBeep; Exit end;

    i1:= CaretStrPos;
    iSt:= SZenFindLeft(Lines.FText, i1+1)-1;
    iLen:= i1-iSt;
    s:= WideTrim(Copy(Lines.FText, iSt+1, iLen));
    if s='' then
      begin MsgBeep; Exit end;
    //Msginfo('"'+s+'"'); exit;

    //make padding string, maybe with tabs
    sPad:= EditorIndentStringForPos(CurrentEditor, StrPosToCaretPos(iSt));

    //expand abbrev
    s:= DoZenExec(s, sPad);
    if s='' then Exit;
    i:= Pos('|', s);
    SReplaceAllW(s, '|', '');

    BeginUpdate;
    try
      CaretStrPos:= iSt;
      DeleteText(iLen);
      InsertText(s);
      if i>0 then
        CaretStrPos:= iSt+i-1;
    finally
      EndUpdate;
    end;
  end;
end;

function TfmMain.DoZenExec(const s, sPadding: string): string;
const
  fr = 'Tools\emmet.wsf';
var
  fn, ft, fcmd: Widestring;
  L: TStringList;
  Lexer, sAbr, sType: string;
begin
  Result:= '';

  //"Type" param
  Lexer:= CurrentLexer;
  if IsLexerCSS(Lexer) then
    sType:= 'css'
  else
  if IsLexerXML(Lexer) then
    sType:= 'xsl'
  else
    sType:= 'html';

    sAbr:= s;
    SReplaceAll(sAbr, '"', '%Q%'); //for cmdline. Script knows it.

    fn:= SynDir + fr;
    ft:= FTempDir + '\SynwEmmet.txt';
    fcmd:= WideFormat('cmd.exe /c""wscript.exe" "%s" "%s" "%s" "%s" "%s" >"%s""',
      [fn, sAbr, sType, opZenProfile, sPadding, ft]);

    FDelete(ft);
    if not IsFileExist(fn) then
      begin MsgNoFile(fn); Exit end;
    if FExecProcess(fcmd, SExtractFileDir(fn), sw_hide, true{DoWait})<>exOk then
      begin MsgNoRun(fr); Exit end;
    if (not IsFileExist(ft)) or (FGetFileSize(ft)=0) then
      begin MsgError(WideFormat(DKLangConstW('MZen'), [s]), Handle); Exit end;

    L:= TStringList.Create;
    try
      L.LoadFromFile(ft);
      Result:= SDelLastCR(L.Text);
    finally
      FreeAndNil(L);
      FDelete(ft);
    end;
end;

procedure TfmMain.DoZenWrap;
var
  s, abbr: WideString;
  i, iSt: integer;
  sPad: string;
begin
  with CurrentEditor do
  begin
    if ReadOnly then Exit;
    if SelLength=0 then
      begin MsgNoSelection; Exit end;

    abbr:= '';
    if not MsgInput('zenIn', abbr) then Exit;

    sPad:= StringOfChar(' ', StrPosToCaretPos(SelStart).X);
    abbr:= DoZenExec(abbr, sPad);
    if abbr='' then Exit;
    i:= Pos('|', abbr);
    if i=0 then
      begin MsgWarn(DKLangConstW('zenCur'), Handle); Exit; end;
    SReplaceAllW(abbr, '|', '');

    s:= SelText;
    ClearSelection;

    iSt:= CaretStrPos;
    InsertText(abbr);
    CaretStrPos:= iSt+i-1;
    InsertText(s);
  end;
end;

procedure TfmMain.UpdateLexer;
var
  Lexer: string;
begin
  Lexer:= CurrentLexer;
  if Lexer<>FAcpLexer then
    UpdateAcp(Lexer);
end;

procedure TfmMain.TBXItemFReopenClick(Sender: TObject);
begin
  acReread.Execute;
end;

procedure TfmMain.ecToggleLineCommentExecute(Sender: TObject);
begin
  DoToggleLineComment(false);
end;

procedure TfmMain.DoToggleLineComment(Alt: boolean);
var
  Ed: TSyntaxMemo;
  sCom: Widestring;
  nLine1, nLine2, n: Integer;
  NeedUncomm: boolean;
begin
  Ed:= CurrentEditor;

  //get comment chars
  if CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer<>nil then
    sCom:= CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer.LineComment
  else
    sCom:= '';
  if sCom='' then
    begin MsgBeep; Exit; end;

  //get NeedUncomm
  with Ed do
  begin
    if SelLength=0 then
      n:= CaretPos.Y
    else
      n:= StrPosToCaretPos(SelStart).Y;

    if (n>=0) and (n<Lines.Count) then
      NeedUncomm:= SBegin(WideTrim(Lines[n]), sCom)
    else
      begin MsgBeep; Exit; end;
  end;

  //work for: selection is small, 1-line, so better to unselect
  //(to move caret down after toggling comment)
  if Ed.SelLength>0 then
  begin
    Ed.GetSelectedLines(nLine1, nLine2);
    if nLine1=nLine2 then
    begin
      Ed.CaretStrPos:= Ed.SelStart;
      Ed.ResetSelection;
    end;
  end;

  //toggle comment
  if NeedUncomm then
    ecUncommentLines.Execute
  else
  if Alt then
    EditorCommentLinesAlt(Ed, sCom)
  else
    ecCommentLines.Execute;
end;

procedure TfmMain.ecToggleFocusOutputExecute(Sender: TObject);
begin
  if not plOut.Visible then
  begin
    ecShowOut.Execute;
    UpdatePanelOut(tbOut);
    if Self.Enabled and ListOut.CanFocus then
      ListOut.SetFocus;
  end
  else
  if ListOut.Focused then
    FocusEditor
  else
  begin
    UpdatePanelOut(tbOut);
    if Self.Enabled and ListOut.CanFocus then
      ListOut.SetFocus
  end;
end;

procedure TfmMain.acBackupExecute(Sender: TObject);
var Dest:Widestring;
begin
  with CurrentFrame do
    if (FileName<>'') and (FGetFileSize(FileName)>0) then
    begin
      Dest:= FileName+'.bak';
      if not FFileCopy(FileName, Dest) then
        MsgBakEr(Dest)
      else
        MsgBakOk(Dest)
    end
    else
      MsgBeep;
end;

procedure TfmMain.DoGetCommentProps(const Lexer: string;
  UseDefault: boolean;
  var sStart, sEnd: string; var IsMultiLine: boolean);
const
  DefStart = '(*';
  DefEnd = '*)';
var
  n: Integer;
  s: string;
begin
  sStart:= '';
  sEnd:= '';
  IsMultiLine:= false;

  if (Lexer='') and UseDefault then
    begin sStart:= DefStart; sEnd:= DefEnd; Exit end;

  if UseDefault then
  begin
    sStart:= GetLexerComment(Lexer);
    if sStart<>'' then Exit;
  end;

  s:= DoReadLexersCfg('Comments', Lexer);
  if s='' then
  begin
    IsMultiLine:= true;
    s:= DoReadLexersCfg('CommentsForLines', Lexer);
  end;

  n:= Pos(',', s);
  if (s='') or (n=0) then
  begin
    if UseDefault then
      begin sStart:= DefStart; sEnd:= DefEnd; end
    else
      MsgWarn(WideFormat(DKLangConstW('MNCmt'), [Lexer]), Handle);
    Exit;
  end;

  sStart:= Copy(s, 1, n-1);
  sEnd:= Copy(s, n+1, MaxInt);
end;

procedure TfmMain.ecToggleStreamCommentExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  s1, s2, Lexer: string;
  MLine: boolean;
begin
  Ed:= CurrentEditor;
  Lexer:= CurrentLexer;
  if Lexer='' then
    begin MsgBeep; Exit end;

  if Ed.ReadOnly then Exit;
  if Ed.SelLength=0 then
    begin MsgNoSelection; Exit end;

  DoGetCommentProps(Lexer, false, s1, s2, MLine);
  if s1<>'' then
    EditorToggleStreamComment(Ed, s1, s2, MLine);
end;

procedure TfmMain.TBXItemEMoveUpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smMoveLinesUp);
end;

procedure TfmMain.TBXItemEMoveDnClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smMoveLinesDown);
end;

procedure TfmMain.TBXItemEDelLnClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smDeleteLine);
end;

procedure TfmMain.TBXItemHelpDonateClick(Sender: TObject);
begin
  SynHelpTopic(helpDonate, Handle);
end;

procedure TfmMain.TBXItemECpFNClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyFilename);
end;

procedure TfmMain.TBXItemECpFullPathClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyFullPath);
end;

procedure TfmMain.TBXItemECpDirPathClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyDirPath);
end;

procedure TfmMain.ecToggleFocusFindResExecute(Sender: TObject);
begin
  if not plOut.Visible then
  begin
    ecShowOut.Execute;
    UpdatePanelOut(tbFind);
    if Self.Enabled and TreeFind.CanFocus then
      TreeFind.SetFocus;
  end
  else
  if TreeFind.Focused then
    FocusEditor
  else
  begin
    UpdatePanelOut(tbFind);
    if Self.Enabled and TreeFind.CanFocus then
      TreeFind.SetFocus
  end;
end;

procedure TfmMain.InitSpell;
begin
  {$ifdef SPELL}
  FSpellPos:= -1;
  FSpellChecking:= false;
  FSpell:= TLiveAddictSpellBase.Create(Self);
  with FSpell do
  begin
    ConfigAvailableOptions:= [soUpcase, soNumbers, soAbbreviations, soPrimaryOnly, soDUalCaps];
    ConfigFilename:= SynIniDir + 'SynSpell.ini'; //dupped, maybe Addict can't get it only here?
    ConfigStorage:= csFile; //must be upper
    ConfigDefaultMain.Add('American.adm');
    ConfigDefaultActiveCustom:= 'Default.adu';
    ConfigDictionaryDir.Clear;
    ConfigDictionaryDir.Add(ExtractFileDir(SynIniDir));
    ConfigDictionaryDir.Add(SynDir + 'Dictionaries');
    ConfigFilename:= SynIniDir + 'SynSpell.ini'; //dupped
    SuggestionsLearningDict:= SynIniDir + 'SynSpellLearn.adl';

    DialogInitialPos:= ipUserDefined;
    EndMessage:= emNever;
    UILanguageFontControls.Name:= Self.Font.Name;
    UILanguageFontText.Name:= Self.Font.Name;
    UILanguageUseFonts:= true;

    OnPopupCreateMenu:= SpellPopupCreateMenu;
    OnPopupAddMenuItem:= SpellPopupAddMenuItem;
    OnPopupDoMenu:= SpellPopupDoMenu;
    OnSpellDialogShow:= SpellDialogShow;
    OnPositionDialog:= SpellPositionDialog;
  end;
  {$endif}
end;

procedure TfmMain.DoSpellConfig(Sender: TObject);
begin
  {$ifdef SPELL}
  if Assigned(FSpell) then
    FSpell.Setup;
  {$endif}
end;

procedure TfmMain.UpdateFrameSpell(Frame: TEditorFrame; UpdFlag: boolean = true);
begin
  {$ifdef SPELL}
  if Assigned(FSpell) then
  begin
    if UpdFlag then
      Frame.SpellLive:= opSpellEn and
        ((Frame.FileName = '') or SFileExtensionMatch(Frame.FileName, opSpellExt));
    ecSpellLive.Checked:= Frame.SpellLive;
  end;
  {$endif}
end;

procedure TfmMain.TBXItemTbSpellCheckClick(Sender: TObject);
begin
  ecSpellCheck.Execute;
end;

procedure TfmMain.ecSpellCheckExecute(Sender: TObject);
var
  F: TEditorFrame;
  Ed: TSyntaxMemo;
  NStart, NEnd: Integer;
  S, S1: string; //Addict is not Unicode aware
  AMap, ASpellLiveBefore: boolean;
  //ch: Widechar;
begin
  {$ifdef SPELL}
  F:= CurrentFrame;
  if F=nil then Exit;
  if not Assigned(FSpell) then Exit;
  if FSpellChecking then Exit;

  Ed:= F.EditorMaster;
  AMap:= F.ShowMap;
  F.ShowMap:= false;

  //need to set SpellLive
  ASpellLiveBefore:= F.SpellLive;
  if not ASpellLiveBefore then
  begin
    F.SpellLive:= true;
    F.ecSpellChecker.Analyze(false{Background});
  end;

  FSpellPos:= -1;
  FSpellChecking:= true;
  UpdateBusyIco;

  try
    repeat
      if FSpell.DialogForm<>nil then
        FSpell.DialogForm.Close;

      //get next misspelled word
      FSpellPos:= F.DoSpellContinue(FSpellPos+1);
      if FSpellPos<0 then
      begin
        Ed.ResetSelection;
        F.ecSpellChecker.Active:= false;
        F.ecSpellChecker.Active:= true;
        F.SpellLive:= ASpellLiveBefore;
        MsgInfo(DKLangConstW('zMSpellDone'), Handle);
        Exit
      end;

      Ed.WordRangeAtPos(Ed.StrPosToCaretPos(FSpellPos), NStart, NEnd);
      (*
      //WordRangeAtPos works not ok for "we'll", "you've" words
      //work for this:

      NStart:= FSpellPos;
      NEnd:= NStart;
      while (NEnd<Ed.Lines.TextLength-1) do
      begin
        ch:= Ed.Lines.Chars[NEnd+1];
        if not (IsWordChar(ch) or (ch='''')) then Break;
        Inc(NEnd);
      end;
      *)

      if NEnd<=NStart then
        begin MsgBeep; Continue end;
      S:= Copy(Ed.Lines.FText, NStart+1, NEnd-NStart);
      Ed.SetSelection(NStart, NEnd-NStart);

      //process messages
      if (Ed.CaretPos.Y+1) mod 500 = 0 then
        Application.ProcessMessages;
      if Application.Terminated then Exit;

      //show spell dialog
      //if not FSpell.CheckWord(S) then
      begin
        S1:= S;
        FSpell.CheckString(S);
        if FSpell.CheckCanceled then
        begin
          Ed.ResetSelection;
          Exit;
        end;
        if S<>S1 then
          Ed.ReplaceText(NStart, NEnd-NStart, S);
      end;
    until false;
  finally
    FSpellChecking:= false;
    UpdateBusyIco;
    F.ShowMap:= AMap;
    if AMap then
      F.DoSyncMicromap;
  end;
  {$endif}
end;

procedure TfmMain.ecSpellLiveExecute(Sender: TObject);
begin
  with CurrentFrame do
    SpellLive:= not SpellLive;
  UpdateFrameSpell(CurrentFrame, false);
end;

procedure TfmMain.TBXItemSpellLiveClick(Sender: TObject);
begin
  ecSpellLive.Execute;
end;

procedure TfmMain.ecMacroDlgExecute(Sender: TObject);
var
  sh: TShArray;
  idx, i: Integer;
begin
  for i:= Low(sh) to High(sh) do
    GetShortcutOfMacro(i, sh[i]);
  if EditMacro(ecMacroRecorder1, sh, idx) then
  begin
    if idx >= 0 then
      FLastMacro:= idx;
    for i:= Low(sh) to High(sh) do
      SetShortcutOfMacro(i, sh[i]);
    UpdateShortcuts;
    SaveMacros;
  end;
end;

procedure TfmMain.LoadMacros;
var fn: string;
begin
  fn:= SynMacrosIni;
  if FileExists(fn) then
    ecMacroRecorder1.LoadFromFile(fn);
end;

procedure TfmMain.SaveMacros;
begin
  ecMacroRecorder1.SaveToFile(SynMacrosIni);
  PropsManagerKeys.IniFileName:= SynIni;
  PropsManagerKeys.SaveProps;
end;

procedure TfmMain.DoOpenBrowserPreview;
var
  Ed: TSyntaxMemo;
  s: Widestring;
  fn, dir: Widestring;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;

  if Ed.SelLength>0 then
    s:= Ed.SelText
  else
    s:= Ed.Lines.FText;
  if Trim(s)='' then
    begin MsgNoSelection; Exit end;

  if CurrentFrame.FileName='' then
    dir:= FTempDir
  else
    dir:= ExtractFileDir(CurrentFrame.FileName);
  fn:= dir+'\_synwrite_preview.html';

  FDelete(fn);
  FWriteStringToFile(fn, s, Ed.Lines.TextCoding<>tcAnsi);

  if IsFileExist(fn) then
  begin
    DoRememberTempFile(fn);
    FExecute(fn, '', '', Handle);
  end
  else
    MsgBeep;
end;

procedure TfmMain.RunMacro(n: Integer);
begin
  with ecMacroRecorder1 do
    if (n>=0) and (n<Count) then
    begin
      FLastMacro:= n;
      Play(n);
    end;
end;

procedure TfmMain.ecMacro1Execute(Sender: TObject);
begin
  RunMacro(0);
end;

procedure TfmMain.ecMacro2Execute(Sender: TObject);
begin
  RunMacro(1);
end;

procedure TfmMain.ecMacro3Execute(Sender: TObject);
begin
  RunMacro(2);
end;

procedure TfmMain.ecMacro4Execute(Sender: TObject);
begin
  RunMacro(3);
end;

procedure TfmMain.ecMacro5Execute(Sender: TObject);
begin
  RunMacro(4);
end;

procedure TfmMain.ecMacro6Execute(Sender: TObject);
begin
  RunMacro(5);
end;

procedure TfmMain.ecMacro7Execute(Sender: TObject);
begin
  RunMacro(6);
end;

procedure TfmMain.ecMacro8Execute(Sender: TObject);
begin
  RunMacro(7);
end;

procedure TfmMain.ecMacro9Execute(Sender: TObject);
begin
  RunMacro(8);
end;

procedure TfmMain.TBXItemMacro1Click(Sender: TObject);
begin
  ecMacro1.Execute;
end;

procedure TfmMain.TBXItemMacro2Click(Sender: TObject);
begin
  ecMacro2.Execute;
end;

procedure TfmMain.TBXItemMacro3Click(Sender: TObject);
begin
  ecMacro3.Execute;
end;

procedure TfmMain.TBXItemMacro4Click(Sender: TObject);
begin
  ecMacro4.Execute;
end;

procedure TfmMain.TBXItemMacro5Click(Sender: TObject);
begin
  ecMacro5.Execute;
end;

procedure TfmMain.TBXItemMacro6Click(Sender: TObject);
begin
  ecMacro6.Execute;
end;

procedure TfmMain.TBXItemMacro7Click(Sender: TObject);
begin
  ecMacro7.Execute;
end;

procedure TfmMain.TBXItemMacro8Click(Sender: TObject);
begin
  ecMacro8.Execute;
end;

procedure TfmMain.TBXItemMacro9Click(Sender: TObject);
begin
  ecMacro9.Execute;
end;

  function TfmMain.MacroName(n: integer): Widestring;
  begin
    with ecMacroRecorder1 do
      if (n>=0) and (n<Count) and (Macros[n].Name<>'') then
        Result:= '"'+Macros[n].Name+'"'
      else
        Result:= '#'+IntToStr(n+1);
  end;

  function TfmMain.MacroCmdName(n: integer): Widestring;
  begin
    Result:= WideFormat(DKLangConstW('macItem'), [MacroName(n)]);
  end;

procedure TfmMain.TBXSubmenuItemMacrosPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  n: Integer;
  en: boolean;
begin
  n:= ecMacroRecorder1.Count;

  en:= (FLastMacro>=0) and (FLastMacro<n);
  TbxItemMacroRepeat.Enabled:= en;
  TbxItemMacroRepeat.Caption:= DKLangConstW('macRep');
  if en then TbxItemMacroRepeat.Caption:=
    TbxItemMacroRepeat.Caption + ' ' + MacroName(FLastMacro);

  TbxItemMacro1.Visible:= n>=1;
  TbxItemMacro2.Visible:= n>=2;
  TbxItemMacro3.Visible:= n>=3;
  TbxItemMacro4.Visible:= n>=4;
  TbxItemMacro5.Visible:= n>=5;
  TbxItemMacro6.Visible:= n>=6;
  TbxItemMacro7.Visible:= n>=7;
  TbxItemMacro8.Visible:= n>=8;
  TbxItemMacro9.Visible:= n>=9;
  TbxItemMacro10.Visible:= n>=10;
  TbxItemMacro11.Visible:= n>=11;
  TbxItemMacro12.Visible:= n>=12;
  TbxItemMacro13.Visible:= n>=13;
  TbxItemMacro14.Visible:= n>=14;
  TbxItemMacro15.Visible:= n>=15;
  TbxItemMacro16.Visible:= n>=16;
  TbxItemMacro17.Visible:= n>=17;
  TbxItemMacro18.Visible:= n>=18;
  TbxItemMacro19.Visible:= n>=19;
  TbxItemMacro20.Visible:= n>=20;
  TbxItemMacro21.Visible:= n>=21;
  TbxItemMacro22.Visible:= n>=22;
  TbxItemMacro23.Visible:= n>=23;
  TbxItemMacro24.Visible:= n>=24;
  TbxItemMacro25.Visible:= n>=25;
  TbxItemMacro26.Visible:= n>=26;
  TbxItemMacro27.Visible:= n>=27;
  TbxItemMacro28.Visible:= n>=28;
  TbxItemMacro29.Visible:= n>=29;
  TbxItemMacro30.Visible:= n>=30;

  TbxItemMacro1.Caption:= MacroCmdName(0);
  TbxItemMacro2.Caption:= MacroCmdName(1);
  TbxItemMacro3.Caption:= MacroCmdName(2);
  TbxItemMacro4.Caption:= MacroCmdName(3);
  TbxItemMacro5.Caption:= MacroCmdName(4);
  TbxItemMacro6.Caption:= MacroCmdName(5);
  TbxItemMacro7.Caption:= MacroCmdName(6);
  TbxItemMacro8.Caption:= MacroCmdName(7);
  TbxItemMacro9.Caption:= MacroCmdName(8);
  TbxItemMacro10.Caption:= MacroCmdName(9);
  TbxItemMacro11.Caption:= MacroCmdName(10);
  TbxItemMacro12.Caption:= MacroCmdName(11);
  TbxItemMacro13.Caption:= MacroCmdName(12);
  TbxItemMacro14.Caption:= MacroCmdName(13);
  TbxItemMacro15.Caption:= MacroCmdName(14);
  TbxItemMacro16.Caption:= MacroCmdName(15);
  TbxItemMacro17.Caption:= MacroCmdName(16);
  TbxItemMacro18.Caption:= MacroCmdName(17);
  TbxItemMacro19.Caption:= MacroCmdName(18);
  TbxItemMacro20.Caption:= MacroCmdName(19);
  TbxItemMacro21.Caption:= MacroCmdName(20);
  TbxItemMacro22.Caption:= MacroCmdName(21);
  TbxItemMacro23.Caption:= MacroCmdName(22);
  TbxItemMacro24.Caption:= MacroCmdName(23);
  TbxItemMacro25.Caption:= MacroCmdName(24);
  TbxItemMacro26.Caption:= MacroCmdName(25);
  TbxItemMacro27.Caption:= MacroCmdName(26);
  TbxItemMacro28.Caption:= MacroCmdName(27);
  TbxItemMacro29.Caption:= MacroCmdName(28);
  TbxItemMacro30.Caption:= MacroCmdName(29);
end;


procedure TfmMain.ecBkClearAllExecute(Sender: TObject);
begin
  if MsgConfirm(DKLangConstW('MBk'), Handle) then
  begin
    EditorClearBookmarks(CurrentFrame.EditorMaster);
    EditorClearBookmarks(CurrentFrame.EditorSlave);
    UpdateStatusbar;
  end;
end;

procedure TfmMain.ecBkToggleExecute(Sender: TObject);
begin
  if CurrentFrame<>nil then
    with CurrentFrame do
      DoBkToggle(CurrentEditor, CurrentEditor.CurrentLine);
  UpdateStatusbar;
end;

procedure TfmMain.ecBkNextExecute(Sender: TObject);
begin
  DoBkNext(CurrentEditor, true);
end;

procedure TfmMain.ecBkPrevExecute(Sender: TObject);
begin
  DoBkNext(CurrentEditor, false);
end;

procedure TfmMain.DoBkNext(Ed: TSyntaxMemo; Next: boolean);
var
  i, n, nPos: Integer;
  L: TList;
begin
  nPos:= Ed.CaretStrPos;
  L:= TList.Create;
  try
    Screen.Cursor:= crHourGlass;
    try
      EditorGetBookmarksAsSortedList(Ed, L);
    finally
      Screen.Cursor:= crDefault;
    end;

    //find bkmark which is near nPos
    n:= -1;
    if Next then
    begin
      for i:= 0 to L.Count-1 do
        if Ed.Bookmarks[Integer(L[i])] > nPos then
          begin n:= Integer(L[i]); Break end;
    end
    else
    begin
      for i:= L.Count-1 downto 0 do
        if Ed.Bookmarks[Integer(L[i])] < nPos then
          begin n:= Integer(L[i]); Break end;
    end;
    //we're after last bkmark
    if n<0 then
      if L.Count=0 then
      begin
        MsgBeep;
        Exit
      end
      else
      begin
        if Next then
          n:= Integer(L[0])
        else
          n:= Integer(L[L.Count-1]);
      end;
  finally
    FreeAndNil(L);
  end;

  Ed.GotoBookmark(n);
  EditorCenterPos(Ed, true{GotoMode}, opSrOffsetY);
  //Msg(Inttostr(n));
end;

procedure TfmMain.ecBkInverseExecute(Sender: TObject);
var
  N, i: Integer;
begin
  N:= CurrentEditor.Lines.Count;
  if N=0 then Exit;

  DoProgressShow(proBookmarks);

  with CurrentFrame do
  begin
    EditorMaster.BeginUpdate;
    EditorSlave.BeginUpdate;
    try
      for i:= 0 to N-1 do
      begin
        DoBkToggle(EditorMaster, i);
        if IsProgressStopped(i+1, N) then
          Break;
      end;
    finally
      EditorMaster.EndUpdate;
      EditorSlave.EndUpdate;
    end;
  end;

  UpdateStatusbar;
  DoProgressHide;
end;

procedure TfmMain.ecBkCopyExecute(Sender: TObject);
var
  List: TWideStringList;
  i:Integer;
begin
  List:= TWideStringList.Create;
  with CurrentEditor do
    for i:= 0 to Lines.Count-1 do
      if BookmarkForLine(i)>=0 then
        List.Add(Lines[i]);

  if List.Count>0 then
    TntClipboard.AsWideText:= List.Text
  else
    MsgBeep;
  FreeAndNil(List);
end;

procedure TfmMain.ecBkCutExecute(Sender: TObject);
begin
  ecBkCopy.Execute;
  ecBkDelete.Execute;
end;

procedure TfmMain.ecBkDeleteExecute(Sender: TObject);
begin
  DoBkDelete(CurrentEditor, false);
end;

procedure TfmMain.ecBkDeleteUnmkExecute(Sender: TObject);
begin
  DoBkDelete(CurrentEditor, true);
end;

procedure TfmMain.DoBkDelete(ed: TSyntaxMemo; DelUnmarked: boolean);
var
  N, i, bk, NDel: Integer;
begin
  N:= ed.Lines.Count;
  if N=0 then Exit;

  DoProgressShow(proBookmarks);
  NDel:= 0;

  with ed do
  begin
    BeginUpdate;
    for i:= N-1 downto 0 do
    begin
      if IsProgressStopped(N-i, N) then
        Break;

      bk:= BookmarkForLine(i);
      if (bk>=0) xor DelUnmarked then
      begin
        if bk>=0 then
          Bookmarks[bk]:= -1;
        DoDeleteLine(ed, i);
        Inc(NDel);
      end;
    end;
    EndUpdate;
  end;

  MsgDelLines(NDel);
  DoProgressHide;
  UpdateStatusbar;
end;

procedure TfmMain.DoDeleteLine(Ed: TSyntaxMemo; NLine: integer;
  ForceUndo: boolean = false);
begin
  EditorDeleteLine(Ed, NLine, opBkUndo or ForceUndo);
end;

procedure TfmMain.DoReplaceLine(Ed: TSyntaxMemo; NLine: integer;
  const S: ecString; ForceUndo: boolean = false);
begin
  EditorReplaceLine(Ed, NLine, S, opBkUndo or ForceUndo);
end;

procedure TfmMain.ecBkPasteExecute(Sender: TObject);
var
  s: Widestring;
  N, i, bk: Integer;
begin
  s:= TntClipboard.AsWideText;
  if s='' then
    begin MsgBeep; Exit end;

  N:= CurrentEditor.Lines.Count;
  if N=0 then Exit;

  DoProgressShow(proBookmarks);

  with CurrentEditor do
  begin
    BeginUpdate;
    for i:= N-1 downto 0 do
    begin
      if IsProgressStopped(N-i, N) then
        Break;

      bk:= BookmarkForLine(i);
      if bk>=0 then
      begin
        DoReplaceLine(CurrentEditor, i, s);
        Bookmarks[bk]:= CaretPosToStrPos(Point(0, i));
      end;
    end;
    EndUpdate;
  end;

  DoProgressHide;
  UpdateStatusbar;
end;

procedure TfmMain.ecGotoExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  oldSelStart, oldSelLength,
  n, m: Integer;
  AExt: boolean;
  AMode: TSynGotoMode;
  ABkNum: integer;
  Pnt: TPoint;
begin
  Ed:= CurrentEditor;

  Pnt:= Ed.LinesPosToLog(Ed.CaretPos);
  n:= Pnt.Y+1;
  m:= Pnt.X+1;
  oldSelStart:= Ed.SelStart;
  oldSelLength:= Ed.SelLength;
  AMode:= goLine;

  if ShowGotoForm(n, m, AExt, AMode, ABkNum) then
  begin
    case AMode of
      goLine:
        begin
          Pnt:= Point(m-1, n-1);
          DoRecordToMacro(smGotoXY, @Pnt);
          Ed.CaretPos:= Ed.LogToLinesPos(Pnt);
        end;
      goPrevBk:
        ecBkPrev.Execute;
      goNextBk:
        ecBkNext.Execute;
      goNumBk:
        Ed.ExecCommand(smGotoBookmark0+ABkNum);
    end;

    if AExt then
      EditorExtendSelectionByPosition(Ed,
        oldSelStart, oldSelLength,
        Ed.CaretStrPos, 0);

    EditorCenterPos(Ed, true{GotoMode}, opSrOffsetY);
    FocusEditor;
  end;
end;

procedure TfmMain.ecToggleFocusGroupsExecute(Sender: TObject);
begin
  Groups.PagesSetNext(true);
end;

procedure TfmMain.TBXSubmenuItemTidyPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  i: Integer;
  L: TStringList;
  MI: TSpTbxItem;
  en: boolean;
begin
  en:= CurrentFrame.FileName<>'';
  TbxItemTidyVal.Enabled:= en;

  L:= TStringList.Create;
  with TIniFile.Create(SynTidyIni) do
  try
    ReadSections(L);
  finally
    Free;
  end;

  with TbxSubmenuItemTidy do
  begin
    for i:= Count-1 downto 0 do
      if Items[i].Tag=1 then
        Items[i].Free;

    for i:= 0 to L.Count-1 do
    begin
      MI:= TSpTbxItem.Create(Self);
      MI.Caption:= L[i];
      MI.Tag:= 1;
      MI.OnClick:= DoTidyClick;
      MI.Enabled:= en;
      Add(MI);
    end;
  end;

  FreeAndNil(L);
end;

procedure TfmMain.TBXItemTidyCfgClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TidyConfig);
end;

procedure TfmMain.DoTidyClick(Sender: TObject);
begin
  DoTidy((Sender as TTbCustomItem).Caption);
end;

procedure TfmMain.DoTidy(const Cfg: string);
var
  Frame: TEditorFrame;
  fn_cfg, fn_out, fn_err, fn_current,
  fcmd, fdir: string;
begin
  Frame:= CurrentFrame;
  if Frame.FileName='' then Exit;
  if Frame.Modified then acSave.Execute;

  fn_current:= Frame.FileName;
  fn_cfg:= FTempDir + '\SynwTidyCfg.txt';
  fn_out:= FTempDir + '\SynwTidyOut.txt';
  fn_err:= FTempDir + '\SynwTidyErr.txt';
  FDelete(fn_cfg);
  FDelete(fn_out);
  FDelete(fn_err);

  if Cfg<>'' then
  begin
    FWriteIniSectionToFile(SynTidyIni, Cfg, fn_cfg);
    if (not IsFileExist(fn_cfg)) or (FGetFileSize(fn_cfg)=0) then
    begin
      MsgError('Tidy configuration empty:'#13+Cfg, Handle);
      Exit
    end;
    //DoOpenFile(fn_cfg); exit;

    fcmd:= WideFormat('"%s" -output "%s" -config "%s" -file "%s" -quiet "%s"',
      [SynDir + 'Tools\tidy.exe',
       fn_out,
       fn_cfg,
       fn_err,
       fn_current]);
  end
  else
  begin
    fcmd:= WideFormat('"%s" -file "%s" -errors -quiet "%s"',
      [SynDir + 'Tools\tidy.exe',
       fn_err,
       fn_current]);
  end;

  //exec
  fdir:= SynDir + 'Tools';
  if FExecProcess(fcmd, fdir, sw_hide, true{Wait}) = exCannotRun then
    begin MsgNoRun('Tools\Tidy.exe'); Exit end;

  //show errors
  if IsFileExist(fn_err) and (FGetFileSize(fn_err)>0) then
  begin
    SynPanelPropsVal.DefFilename:= fn_current;
    SynPanelPropsVal.RegexStr:= 'line (\d+) column (\d+) .*';
    SynPanelPropsVal.RegexIdLine:= 1;
    SynPanelPropsVal.RegexIdCol:= 2;
    SynPanelPropsVal.RegexIdName:= 0;
    SynPanelPropsVal.ZeroBase:= false;

    ListVal.Items.LoadFromFile(fn_err);
    UpdatePanelOut(tbVal);
    plOut.Show;
  end
  else
  begin
    ListVal.Items.Clear;
    if Cfg='' then Exit;
  end;

  //show output in editor
  if IsFileExist(fn_out) and (FGetFileSize(fn_out)>0) then
  begin
    with TStringList.Create do
    try
      LoadFromFile(fn_out);
      Frame.EditorMaster.CaretStrPos:= 0;
      Frame.EditorMaster.ReplaceText(0, Length(Frame.EditorMaster.Text), Text);
    finally
      Free
    end;
  end;

  FDelete(fn_cfg);
  FDelete(fn_out);
  FDelete(fn_err);
end;

procedure TfmMain.TBXItemTidyValClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TidyValidate);
end;

procedure TfmMain.TBXItemOOValClick(Sender: TObject);
begin
  UpdatePanelOut(tbVal);
end;

procedure TfmMain.ListValDblClick(Sender: TObject);
begin
  with ListVal do
   if (ItemIndex>=0) and (ItemIndex<Items.Count) then
     DoNavigate_ListVal(Items[ItemIndex]);
end;

function TfmMain.DoNavigate_ListVal(const Str: Widestring): boolean;
var
  fn: Widestring;
  nLine, nCol: Integer;
begin
  Result:= false;
  if Str='' then Exit;

  fn:= SynPanelPropsVal.DefFilename;
  SParseOut(Str,
    SynPanelPropsVal.RegexStr,
    SynPanelPropsVal.RegexIdName,
    SynPanelPropsVal.RegexIdLine,
    SynPanelPropsVal.RegexIdCol,
    SynPanelPropsVal.ZeroBase,
    fn, nLine, nCol);

  if fn='' then Exit;
  if nLine<1 then Exit;
  if nCol<1 then nCol:= 1;

  Result:= true;
  if not IsFileExist(fn) then Exit;
  DoOpenFile(fn);
  CurrentEditor.CaretPos:= Point(nCol-1, nLine-1);
  FocusEditor;
end;

procedure TfmMain.TBXItemValNavClick(Sender: TObject);
begin
  ListValDblClick(ListVal);
end;

procedure TfmMain.TBXItemValCopySelClick(Sender: TObject);
begin
  DoListCopy(ListVal);
end;

procedure TfmMain.TBXItemValCopyAllClick(Sender: TObject);
begin
  DoListCopyAll(ListVal);
end;

procedure TfmMain.TBXItemValClearClick(Sender: TObject);
begin
  ListVal.Items.Clear;
  FocusEditor;
  UpdateStatusbar;
end;

procedure TfmMain.PopupValidatePopup(Sender: TObject);
begin
  with ListVal do
  begin
    TbxItemValNav.Enabled:= (ItemIndex>=0) and (ItemIndex<=Items.Count-1);
    TbxItemValCopySel.Enabled:= SelCount>0;
    TbxItemValCopyAll.Enabled:= Items.Count>0;
    TbxItemValClear.Enabled:= Items.Count>0;
    TbxItemValFind.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.ListValKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key=vk_space) or (Key=vk_return)) and (Shift=[]) then
  begin
    ListValDblClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=vk_delete) and (Shift=[]) then
  begin
    TbxItemValClearClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    TbxItemValCopySelClick(Self);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(Shortcut(Key, Shift), smFindDialog) then
  begin
    TBXItemValFindClick(Self);
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.ecToggleFocusValidateExecute(Sender: TObject);
begin
  if not plOut.Visible then
  begin
    ecShowOut.Execute;
    UpdatePanelOut(tbVal);
    if Self.Enabled and ListVal.CanFocus then
      ListVal.SetFocus;
  end
  else
  if ListVal.Focused then
    FocusEditor
  else
  begin
    UpdatePanelOut(tbVal);
    if Self.Enabled and ListVal.CanFocus then
      ListVal.SetFocus
  end;
end;

procedure TfmMain.ecReduceBlanksExecute(Sender: TObject);
begin
  DoLinesCommand(scmdRemoveDupBlanks);
end;


procedure TfmMain.TBXItemSessClrClick(Sender: TObject);
begin
  SynMruSessions.Items.Clear;
  with TIniFile.Create(SynHistoryIni) do
  try
    EraseSection('MRU_Sess');
  finally
    Free;
  end;
end;

procedure TfmMain.TBXItemFSesSaveClick(Sender: TObject);
begin
  DoSaveSession;
end;

procedure TfmMain.DoSaveSession;
begin
  if FSessionFN<>'' then
    DoSaveSessionToFile(FSessionFN)
  else
    DoSaveSessionAs;
end;

procedure TfmMain.TBXItemFSesCloseClick(Sender: TObject);
begin
  DoCloseSession(true);
end;

procedure TfmMain.DoCloseSession(PromptToSave: boolean);
begin
  if PromptToSave then
    if not DoConfirmSaveSession(true) then
      Exit;
  FSessionFN:= '';
  UpdateTitle(CurrentFrame);
end;

function TfmMain.DoConfirmSaveSession(CanCancel: boolean; ExitCmd: boolean = false): boolean;
var
  Buttons: TMsgDlgButtons;
  sName, fn: WideString;
begin
  Result:= true;

  if ExitCmd and opHistSessionSave then
  begin
    //save last session (named of default)
    if (FSessionFN='') or opHistSessionDef then
      fn:= SynIniDir + SynDefaultSyn //default
    else
      fn:= FSessionFN; //named
    DoSaveSessionToFile(fn);
    SynMruSessions.AddItem(fn);
    Exit
  end;

  //save last named session
  if FSessionFN='' then Exit;
  if opHistSessionSave then
  begin
    DoSaveSessionToFile(FSessionFN);
    SynMruSessions.AddItem(FSessionFN);
    Exit
  end;

  //ask to save current named session
  sName:= WideChangeFileExt(WideExtractFileName(FSessionFN), '');
  Buttons:= [mbYes, mbNo];
  if CanCancel then
    Include(Buttons, mbCancel);

  case WideMessageDlg(
         WideFormat(DKLangConstW('MSessSav'), [sName]),
         mtConfirmation, Buttons, 0) of
    mrYes:
      begin
        DoSaveSessionToFile(FSessionFN);
        SynMruSessions.AddItem(FSessionFN);
      end;
    mrCancel:
      Result:= false;
  end;
end;

procedure TfmMain.ecRemoveBlanksExecute(Sender: TObject);
begin
  DoLinesCommand(scmdRemoveBlanks);
end;

{
http://delphi.about.com/cs/adptips2004/a/bltip0304_3.htm
}
procedure TfmMain.TBXSubmenuItemFNewPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateNewDocMenu;
end;

procedure TfmMain.UpdateNewDocMenu();
var
  i: Integer;
  mi: TSpTbxItem;
  miSub: TSpTbxSubmenuItem;
  Names: TStringList;
  ch: char;
  NeedSub: boolean;
  Ini: TIniFile;
const
  chSet = ['A'..'Z', '?'];
begin
  FListNewDocs.Clear;
  FFindToList(FListNewDocs,
    SynDir + 'Template\newdoc',
    '*.*',
    '',
    false{SubDirs},
    false, false, false);

  Names:= TStringList.Create;
  for i:= 0 to FListNewDocs.Count-1 do
    Names.AddObject(SNewDocName(FListNewDocs[i]), Pointer(i));
  Names.Sort;

  //fill MRU items
  Ini:= TIniFile.Create(SynHistoryIni);
  try
    LoadMruList(SynMruNewdoc, Ini, 'MRU_Newdoc', 5{MaxCount}, true);
  finally
    FreeAndNil(Ini);
  end;

  with TBXMRUListItemFNew do
  begin
    Clear;
    for i:= SynMruNewdoc.Items.Count-1 downto 0 do
      MRUAdd(SynMruNewdoc.Items[i]);
  end;

  //del items
  with TbxSubmenuItemFNew do
    for i:= Count-1 downto 0 do
      if Items[i].Tag>0 then
        Items[i].Free;

  //add items
  for ch:= Low(ch) to High(ch) do
    if ch in chSet then
    begin
      NeedSub:= false;
      for i:= 0 to Names.Count-1 do
        if UpCase(Names[i][1]) = ch then
          begin NeedSub:= true; Break end;
      if not NeedSub then Continue;

      //add submenu
      miSub:= TSpTbxSubmenuItem.Create(Self);
      miSub.Caption:= ch;
      miSub.Tag:= 1;

      TbxSubmenuItemFNew.Add(miSub);
      //fill submenu
      for i:= 0 to Names.Count-1 do
        if UpCase(Names[i][1]) = ch then
        begin
          mi:= TSpTbxItem.Create(Self);
          mi.OnClick:= DoNewDocClick;
          mi.Caption:= Names[i];
          mi.Tag:= Integer(Names.Objects[i]) + 1;
          miSub.Add(mi);
        end;
    end;

  //add "Browse folder"
  TbxSubmenuItemFNew.Add(TSpTbxSeparatorItem.Create(Self));
  mi:= TSpTbxItem.Create(Self);
  mi.OnClick:= DoNewDocFolderClick;
  mi.Caption:= DKLangConstW('OpNew');
  mi.Tag:= 1;
  TbxSubmenuItemFNew.Add(mi);

  //fix too big menuitems height
  FixMruBigImageList(TBXMRUListItemFNew);
  FixMenuBigImageList(TbxSubmenuItemFNew);

  FreeAndNil(Names);
end;

procedure TfmMain.FixMenuBigImageList(Menu: TSpTbxSubmenuItem);
var
  i: Integer;
begin
  with Menu do
    for i:= 0 to Count-1 do
      Items[i].Images:= ImageListStatus;
end;

procedure TfmMain.FixMruBigImageList(Menu: TSpTbxMruListItem);
var
  i: Integer;
begin
  with Menu do
    for i:= 0 to Count-1 do
      Items[i].Images:= ImageListStatus;
end;

procedure TfmMain.DoNewDocFolderClick(Sender: TObject);
begin
  FOpenURL(SynDir + 'Template\newdoc', Handle);
end;

procedure TfmMain.DoNewDocClick(Sender: TObject);
var
  n: Integer;
begin
  n:= (Sender as TComponent).Tag - 1;
  if (n>=0) and (n<=FListNewDocs.Count-1) then
    DoNewDoc(FListNewDocs[n])
  else
    MsgBeep(true);
end;

procedure TfmMain.ecRemoveLinesExecute(Sender: TObject);
var
  NDel: integer;
begin
  NDel:= EditorDeleteSelectedLines(CurrentEditor);
  MsgDelLines(NDel);
end;

procedure TfmMain.ecTrimLeadExecute(Sender: TObject);
begin
  DoLinesCommand(scmdTrimLead);
end;

procedure TfmMain.ecTrimTrailExecute(Sender: TObject);
begin
  DoLinesCommand(scmdTrimTrail);
end;

procedure TfmMain.ecTrimAllExecute(Sender: TObject);
begin
  DoLinesCommand(scmdTrimAll);
end;

procedure TfmMain.ecRemoveDupSpacesExecute(Sender: TObject);
begin
  DoLinesCommand(scmdRemoveDupSpaces);
end;

procedure TfmMain.ecTabToSpExecute(Sender: TObject);
begin
  DoLinesCommand(scmdUntab);
  {
  //code from EC demo:
  with CurrentEditor do
    if (SelectMode in [msLine, msNormal]) and HaveSelection then
      UnTabText(SelStart + 1, SelStart + SelLength)
    else
      UnTabText;
      }
end;

procedure TfmMain.ecSpToTabExecute(Sender: TObject);
begin
  DoLinesCommand(scmdSpacesToTabs);
end;

procedure TfmMain.DoFindClip(Next: boolean);
var
  s: Widestring;
begin
  s:= DoClipItem;
  if s='' then
    s:= TntClipboard.AsWideText;
  if s='' then
    begin MsgBeep; Exit end;

  SDeleteFromW(s, #13);
  SDeleteFromW(s, #10);

  DoHint('');
  Finder.FindText:= s;
  Finder.Flags:= Finder.Flags-[ftRegex];
  Finder.Flags:= Finder.Flags+[ftWrapSearch];

  if Next then
    Finder.FindNext
  else
    Finder.FindPrev;
end;

procedure TfmMain.ecFindClipNextExecute(Sender: TObject);
begin
  DoFindClip(true);
end;

procedure TfmMain.ecFindClipPrevExecute(Sender: TObject);
begin
  DoFindClip(false);
end;

type
  TMacroHk = class(TecMacroRecorder);

//Add Cmd to currently recorded macro (if not done by EC)
procedure TfmMain.DoRecordToMacro(Cmd: integer; Data: PWChar);
var
  h: boolean;
begin
  if ecMacroRecorder1.Recording then
    TMacroHk(ecMacroRecorder1).BeforeCommand(Cmd, Data, h);
end;

procedure TfmMain.ecSplit50_50Execute(Sender: TObject);
begin
  Groups.SplitPos:= 50;
end;

procedure TfmMain.ecSplit40_60Execute(Sender: TObject);
begin
  Groups.SplitPos:= 40;
end;

procedure TfmMain.ecSplit60_40Execute(Sender: TObject);
begin
  Groups.SplitPos:= 60;
end;

procedure TfmMain.ecSplit30_70Execute(Sender: TObject);
begin
  Groups.SplitPos:= 30;
end;

procedure TfmMain.ecSplit70_30Execute(Sender: TObject);
begin
  Groups.SplitPos:= 70;
end;

procedure TfmMain.ecSplit20_80Execute(Sender: TObject);
begin
  Groups.SplitPos:= 20;
end;

procedure TfmMain.ecSplit80_20Execute(Sender: TObject);
begin
  Groups.SplitPos:= 80;
end;

{
http://www.addictive-software.com/addict3/other-downloads.htm
Menu demo
}
procedure TfmMain.SpellPopupCreateMenu(Sender: TObject;
     Owner: TComponent; var PopupMenu: TObject);
var
  AMenu: TSpTbxPopupMenu;
  AMenuItem: TSpTbxItem;
begin
  AMenu:= TSpTbxPopupMenu.Create(Owner);
	AMenu.AutoHotkeys:= maManual;
	PopupMenu:= AMenu;

  //info item
	AMenuItem:= TSpTbxItem.Create(AMenu);
	AMenuItem.Caption:= DKLangConstW('zMSpell');
  AMenuItem.Enabled:= false;
	AMenu.Items.Add(AMenuItem);
  //cut
	AMenuItem:= TSpTbxItem.Create(AMenu);
	AMenuItem.Caption:= TbxItemCtxCut.Caption;
  AMenuItem.Enabled:= CurrentEditor.HaveSelection;
  AMenuItem.OnClick:= SpellCutClick;
	AMenu.Items.Add(AMenuItem);
  //copy
	AMenuItem:= TSpTbxItem.Create(AMenu);
	AMenuItem.Caption:= TbxItemCtxCopy.Caption;
  AMenuItem.Enabled:= CurrentEditor.HaveSelection;
  AMenuItem.OnClick:= SpellCopyClick;
	AMenu.Items.Add(AMenuItem);
  //paste
	AMenuItem:= TSpTbxItem.Create(AMenu);
	AMenuItem.Caption:= TbxItemCtxPaste.Caption;
  AMenuItem.OnClick:= SpellPasteClick;
	AMenu.Items.Add(AMenuItem);
  //sep
  AMenu.Items.Add(TSpTbxSeparatorItem.Create(AMenu));
end;

//same Menu demo
procedure TfmMain.SpellPopupDoMenu (Sender, Menu: TObject; XPos,
     YPos: Integer; var PopupAction: Integer; var PopupWord: string);
begin
  TSpTbxPopupMenu(Menu).Popup(XPos, YPos);
  Application.ProcessMessages;

  PopupWord:= FSpellMenuCaption;
  PopupAction:= FSpellMenuTag;
end;


procedure TfmMain.SpellItemClick (Sender: TObject);
begin
  FSpellMenuCaption:= TSpTbxItem (Sender).Caption;
  FSpellMenuTag:= TComponent (Sender).Tag;
end;

procedure TfmMain.SpellCopyClick(Sender: TObject);
begin
  ecCopy.Execute;
end;

procedure TfmMain.SpellCutClick(Sender: TObject);
begin
  ecCut.Execute;
end;

procedure TfmMain.SpellPasteClick(Sender: TObject);
begin
  ecPaste.Execute;
end;

procedure TfmMain.SpellPopupAddMenuItem (Sender, Menu,
     SubMenu: TObject; Caption: string; Enable, HasChildren: Boolean;
     Tag: Integer; var MenuItem: TObject);
var
     vMenuItem: TTBCustomItem;
begin
     FSpellMenuTag:= 0; // New Item
     if HasChildren then
     begin
    		vMenuItem:= TSpTbxItem.Create (TComponent (Menu));
    		TSpTbxPopupMenu (Menu).Items.Add (vMenuItem);
    		(vMenuItem as TSpTbxItem).Caption:= Caption;
    		vMenuItem.Enabled:= Enabled;
    		vMenuItem.Tag:= Tag;
        MenuItem:= vMenuItem;
     end
     else
     begin
    		if Assigned (SubMenu) then
          begin
               vMenuItem:= TSpTbxItem.Create (TComponent (SubMenu));
               TSpTbxItem (SubMenu).Add (vMenuItem);
          end
          else
          begin
               if Caption='-' then
                 vMenuItem:= TSpTbxSeparatorItem.Create(TComponent (Menu))
               else
                 vMenuItem:= TSpTbxItem.Create (TComponent (Menu));
               TSpTbxPopupMenu (Menu).Items.Add (vMenuItem);
          end;

          if (vMenuItem is TSpTbxItem) then
            (vMenuItem as TSpTbxItem).Caption:= Caption;
          vMenuItem.Enabled:= Enabled;
          if (Tag > 0) then
          begin
               vMenuItem.Tag:= Tag;
               vMenuItem.OnClick:= SpellItemClick;
          end;
          MenuItem:= vMenuItem;
     end;
end;


procedure TfmMain.ecMacroPlay1BeforeExecute(Sender: TObject);
begin
  FLastMacro:= ecMacroRecorder1.Count-1;
end;

procedure TfmMain.ecMacroRepeatExecute(Sender: TObject);
begin
  RunMacro(FLastMacro);
end;

procedure TfmMain.ecRepeatCmdExecute(Sender: TObject);
var i: integer;
begin
  if FLastCmdId > 0 then
  begin
    FLastCmdPlaying:= true;
    for i:= 0 to FLastCmdCount{=Count-1} do
      CurrentEditor.ExecCommand(FLastCmdId, PChar(FLastCmdData));
    FLastCmdPlaying:= false;
  end;
end;

function TfmMain.FCanUseLexer(const fn: Widestring): boolean;
begin
  Result:= FGetFileSize(fn) <= opBigSize * 1024 * 1024;
end;

procedure TfmMain.DoFixReplaceCaret(Ed: TSyntaxMemo);
var
  n, nf: Integer;
begin
  with Ed do
  begin
    n:= SelStart;
    nf:= SelLength;
    if ftBackward in Finder.Flags then
      CaretStrPos:= n+nf
    else
      CaretStrPos:= n;
    SetSelection(n, nf, true);
  end;
end;

procedure TfmMain.TBXItemRightClipClick(Sender: TObject);
begin
  UpdatePanelRight(tbClip);
end;

procedure TfmMain.TBXItemRightMapClick(Sender: TObject);
begin
  UpdatePanelRight(tbMap);
end;

procedure TfmMain.MapClick(Sender: TObject);
var
  Ed: TSyntaxMemo;
  P: TPoint;
begin
  Ed:= CurrentEditor;
  if Ed<>nil then
  begin
    P:= (Sender as TSyntaxMemo).CaretPos;
    //Ed.CaretPos:= P; //don't move caret
    Ed.TopLine:= P.Y - Ed.VisibleLines div 2;
  end;
end;

procedure TfmMain.ApplyMap;
begin
  if Assigned(fmMap) then
    with fmMap do
    begin
      //SetMapScrollBars(false, opMapVScroll);
      SetMapZoom(opMapZoom);
      SetMapColor(opColorMap);
    end;
end;

procedure TfmMain.SyncMapData;
begin
  if plClip.Visible then
    if Assigned(fmMap) and fmMap.Visible then
      fmMap.SyncMapData(CurrentEditor);
end;

procedure TfmMain.SyncMapPos;
begin
  if plClip.Visible then
    if Assigned(fmMap) and fmMap.Visible then
      fmMap.SyncMapPos(CurrentEditor);
end;

procedure TfmMain.SynChange(Sender: TObject);
begin
  SyncMapPos;
end;

procedure TfmMain.ecToggleFocusMapExecute(Sender: TObject);
begin
  if not plClip.Visible then
  begin
    ecShowClip.Execute;
    UpdatePanelRight(tbMap);
    if Assigned(fmMap) and fmMap.edMap.CanFocus then
      fmMap.edMap.SetFocus;
  end
  else
  if Assigned(fmMap) and fmMap.edMap.Focused then
    FocusEditor
  else
  begin
    UpdatePanelRight(tbMap);
    if Assigned(fmMap) and fmMap.edMap.CanFocus then
      fmMap.edMap.SetFocus
  end;
end;

procedure TfmMain.FinderTreeFound;
begin
  if Sender is TFinderInTree then
    with Sender as TFinderInTree do
      if Control.CanFocus then
        Control.SetFocus;
end;

procedure TfmMain.FinderTreeNotFound(Sender: TObject);
var
  s: Widestring;
begin
  if Sender is TFinderInTree then
    s:= (Sender as TFinderInTree).FindText
  else
  if Sender is TFinderInList then
    s:= (Sender as TFinderInList).FindText
  else
    s:= '';
  s:= WideFormat(DKLangConstW('MNFound2'), [s]);
  DoHint(s);
  MsgBeep;
end;

procedure TfmMain.ecFindInTreeExecute(Sender: TObject);
begin
  if Assigned(fmSR) and fmSR.Visible then
    fmSR.Hide;
  if not Assigned(FinderInTree) then
    FinderInTree:= TFinderInTree.Create(Self);
  with FinderInTree do
  begin
    IniFN:= Self.SynHistoryIni;
    if Assigned(fmSR) then
      SearchText:= fmSR.Text1;
    Control:= Self.CurrentTreeview;
    OnFind:= Self.FinderTreeFound;
    OnNotFound:= Self.FinderTreeNotFound;
    Execute;
  end;
end;

procedure TfmMain.ecFindInTreeNextExecute(Sender: TObject);
begin
  if not Assigned(FinderInTree) or
    (FinderInTree.FindText='') then
    begin ecFindInTree.Execute; Exit end;
  FinderInTree.FindNext;
end;

procedure TfmMain.ecFindInTreePrevExecute(Sender: TObject);
begin
  if not Assigned(FinderInTree) or
    (FinderInTree.FindText='') then
    begin ecFindInTree.Execute; Exit end;
  FinderInTree.FindPrev;
end;

procedure TfmMain.DoTreeJump(Mode: TSynGotoTree);
var
  tn, tn2: TTreeNode;
begin
  with Tree do
    if Selected<>nil then
    begin
      case Mode of
        tgoNext:
          tn:= Selected.GetNext;
        tgoPrev:
          tn:= Selected.GetPrev;
        tgoParent:
          tn:= Selected.Parent;
        tgoNextBro:
          begin
            tn:= Selected.GetNextSibling;
            tn2:= Selected;
            if tn=nil then
              repeat
                tn2:= tn2.Parent;
                if tn2=nil then Break;
                tn:= tn2.GetNextSibling;
                if tn<>nil then Break;
              until false;
          end;
        tgoPrevBro:
          begin
            tn:= Selected.GetPrevSibling;
            if tn=nil then
              tn:= Selected.Parent;
          end;
        else tn:= nil;
      end;
      if tn<>nil then
      begin
        Selected:= tn;
        Tree.MemoCaretUpdate(True);
      end
      else
        MsgBeep;
    end;
end;

procedure TfmMain.ecTreeNextExecute(Sender: TObject);
begin
  DoTreeJump(tgoNext);
end;

procedure TfmMain.ecTreePrevExecute(Sender: TObject);
begin
  DoTreeJump(tgoPrev);
end;

function TfmMain.IsSearchEditFocused: boolean;
begin
  Result:= Assigned(fmSR) and
    fmSR.Visible and
    fmSR.Enabled and
    (fmSR.ed1.Focused or fmSR.ed2.Focused);
end;

function TfmMain.IsNumConvEditFocused: boolean;
begin
  Result:= Assigned(fmNumConv) and
    fmNumConv.Visible and
    fmNumConv.Enabled and
    (fmNumConv.ActiveControl is TTntEdit) and
    fmNumConv.ActiveControl.Focused;
end;

procedure TfmMain.ecSplitLeftExecute(Sender: TObject);
begin
  Groups.SplitPosDecrease;
end;

procedure TfmMain.ecSplitRightExecute(Sender: TObject);
begin
  Groups.SplitPosIncrease;
end;

function TfmMain.ShowGotoForm(
  var ALine, ACol: integer;
  var AExtSel: boolean;
  var AMode: TSynGotoMode;
  var ABkNum: integer): Boolean;
var
  i: integer;
  en: boolean;
  s: string;
begin
  with TfmGoto.Create(nil) do
   try
     PanelPos.Visible:= AMode=goLine;
     PanelBookmk.Visible:= not PanelPos.Visible;
     case AMode of
       goPrevBk: cbPrev.Checked:= true;
       goNextBk: cbNext.Checked:= true;
       goNumBk: cbNum.Checked:= true;
     end;

     edLine.Text:= IntToStr(ALine);
     edCol.Text:= IntToStr(ACol);
     FMaxLine:= CurrentEditor.Lines.Count;

     //init list of numbered bookmarks
     edNum.Items.Clear;
     for i:= 0 to 9 do
     begin
       edNum.Items.Add(EditorGetBookmarkDesc(CurrentEditor, i));
       FBookSet[i]:= CurrentEditor.Bookmarks[i]>=0;
     end;

     //numbered bookmarks enabled?
     en:= false;
     edNum.ItemIndex:= 0;
     for i:= 0 to 9 do
       if FBookSet[i] then
         begin en:= true; edNum.ItemIndex:= i; Break end;
     cbNum.Enabled:= en;
     edNum.Enabled:= en;

     //any bookmarks enabled?
     en:= CurrentEditor.BookmarkObj.Count>0;
     cbPrev.Enabled:= en;
     cbNext.Enabled:= en;
     labBookmk.Enabled:= en;

     Result:= ShowModal = mrOk;
     if Result then
     begin
       if PanelPos.Visible then AMode:= goLine else
       if cbPrev.Checked then AMode:= goPrevBk else
       if cbNext.Checked then AMode:= goNextBk else
       if cbNum.Checked then AMode:= goNumBk;

       //calc line number
       //limit by [1, Count]
       s:= edLine.Text;
       s:= Trim(s);
       if (s<>'') and (char(s[1]) in ['+', '-']) then
         ALine:= ALine+StrToIntDef(s, 0)
       else
         ALine:= StrToIntDef(s, ALine);
       ALine:= Min2(Max2(ALine, 1), CurrentEditor.Lines.Count);

       //calc column number
       //limit by [1, inf]
       s:= edCol.Text;
       s:= Trim(s);
       if (s<>'') and (char(s[1]) in ['+', '-']) then
         ACol:= ACol+StrToIntDef(s, 0)
       else
         ACol:= StrToIntDef(s, ACol);
       ACol:= Max2(ACol, 1);

       AExtSel:= cbExtSel.Checked;
       ABkNum:= edNum.ItemIndex;
     end;
   finally
     Free;
   end;
end;



procedure TfmMain.DoFindAndExtendSel(ANext: boolean);
var
  Ed: TSyntaxMemo;
  oldStart, oldLength: Integer;
begin
  FindInit;
  if Finder.FindText='' then
  begin
    ecFind.Execute;
    Exit
  end;

  Ed:= CurrentEditor;
  oldStart:= Ed.SelStart;
  oldLength:= Ed.SelLength;
  if ANext then
    Finder.FindNext
  else
    Finder.FindPrev;
  if Finder.Matches>0 then
    EditorExtendSelectionByPosition(Ed,
      oldStart, oldLength,
      Ed.SelStart, Ed.SelLength);
end;

procedure TfmMain.ecFindNextWithExtendExecute(Sender: TObject);
begin
  DoFindAndExtendSel(true);
end;

procedure TfmMain.ecFindPrevWithExtendExecute(Sender: TObject);
begin
  DoFindAndExtendSel(false);
end;

procedure TfmMain.UpdateFrameZoom(F: TEditorFrame);
begin
  //update ruler height
  with F do
  begin
    EditorMasterZoom(EditorMaster);
    EditorMasterZoom(EditorSlave);
  end;
end;

procedure TfmMain.TBXItemHelpKeymapClick(Sender: TObject);
var
  fn: string;
begin
  fn:= FTempDir + '\SynWriteKeys.html';
  UpdateMacroKeynames;
  DoListKeys(SyntKeyMapping, fn);
  FExecute(fn, '', '', Handle);
end;

procedure TfmMain.ecFindInListExecute(Sender: TObject);
begin
  if Assigned(fmSR) and fmSR.Visible then
    fmSR.Hide;
  if not Assigned(FinderInList) then
    FinderInList:= TFinderInList.Create(Self);
  with FinderInList do
  begin
    IniFN:= Self.SynHistoryIni;
    if Assigned(fmSR) then
      SearchText:= fmSR.Text1;
    Control:= CurrentListbox;
    OnNotFound:= Self.FinderTreeNotFound;
    Execute;
  end;
end;

procedure TfmMain.ecFindInListNextExecute(Sender: TObject);
begin
  if not Assigned(FinderInList) or
    (FinderInList.FindText='') then
    begin ecFindInList.Execute; Exit end;
  FinderInList.Control:= CurrentListbox;
  FinderInList.FindNext;
end;

procedure TfmMain.ecFindInListPrevExecute(Sender: TObject);
begin
  if not Assigned(FinderInList) or
    (FinderInList.FindText='') then
    begin ecFindInList.Execute; Exit end;
  FinderInList.Control:= CurrentListbox;
  FinderInList.FindPrev;
end;

function TfmMain.CurrentListbox: TCustomListbox;
begin
  if ListOut.Focused then Result:= ListOut
  else
  if ListVal.Focused then Result:= ListVal
  else
  if ListPLog.Focused then Result:= ListPLog
  else
  if Assigned(fmClip) and fmClip.Visible and fmClip.ListClip.Focused then
    Result:= fmClip.ListClip
  else
    Result:= nil;
end;

function TfmMain.CurrentTreeview: TCustomTreeView;
begin
  if Tree.Focused then Result:= Tree
  else
  if TreeFind.Focused then Result:= TreeFind
  else
    Result:= nil;
end;

function TfmMain.IsListboxFocused: boolean;
begin
  Result:= CurrentListbox <> nil;
end;

function TfmMain.IsTreeviewFocused: boolean;
begin
  Result:= CurrentTreeview <> nil;
end;

procedure TfmMain.TBXItemClipFindClick(Sender: TObject);
begin
  DoFindInClipPanel;
end;

procedure TfmMain.DoFindInClipPanel;
begin
  if Assigned(fmClip) then
    with fmClip.ListClip do
      if CanFocus then
      begin
        SetFocus;
        ecFindInList.Execute;
      end;
end;

procedure TfmMain.TBXItemValFindClick(Sender: TObject);
begin
  DoFindInValidatePanel;
end;

procedure TfmMain.DoFindInValidatePanel;
begin
  with ListVal do
    if CanFocus then
    begin
      SetFocus;
      ecFindInList.Execute;
    end;
end;

procedure TfmMain.TBXItemOutFindClick(Sender: TObject);
begin
  DoFindInOutPanel;
end;

procedure TfmMain.DoFindInOutPanel;
begin
  with ListOut do
    if CanFocus then
    begin
      SetFocus;
      ecFindInList.Execute;
    end;
end;

procedure TfmMain.PopupClipPopup(Sender: TObject);
begin
  with fmClip.ListClip do
  begin
    TbxItemClipCopyToEd.Enabled:= ItemIndex>=0;
    TbxItemClipCopyToClip.Enabled:= ItemIndex>=0;
    TbxItemClipClr.Enabled:= Items.Count>0;
    TbxItemClipFind.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.TBXItemTreeFindClick(Sender: TObject);
begin
  with Tree do
    if CanFocus then
    begin
      SetFocus;
      ecFindInTree.Execute;
    end;
end;

procedure TfmMain.PopupTreePopup(Sender: TObject);
var
  en: boolean;
begin
  with Tree do
  begin
    en:= Items.Count>0;
    TbxItemTreeCollapse.Enabled:= en;
    TbxItemTreeCollapseAll.Enabled:= en;
    TbxItemTreeExpand.Enabled:= en;
    TbxItemTreeExpandAll.Enabled:= en;
    TBXSubmenuTreeLevel.Enabled:= en;
    TbxItemTreeFind.Enabled:= en;
    TbxItemTreeSorted.Checked:= SortType <> stNone;
  end;
end;

procedure TfmMain.TBXItemTreeCollapseClick(Sender: TObject);
begin
  with Tree do
    if Selected<>nil then
      Selected.Collapse(true);
end;

procedure TfmMain.TBXItemTreeExpandClick(Sender: TObject);
begin
  with Tree do
    if Selected<>nil then
    begin
      Selected.Expand(true);
      Selected.MakeVisible;
    end;
end;

procedure TfmMain.ApplyAutoSave;
begin
  with TimerAutoSave do
  begin
    Enabled:= opASaveOnTimer;
    Interval:= 60 * 1000 * Max2(opASaveTimeMin, 1);
  end;
end;

procedure TfmMain.TimerAutoSaveTimer(Sender: TObject);
begin
  DoAutoSave;
end;

procedure TfmMain.DoAutoSave;
  //
  function SizeOk(F: TEditorFrame): boolean;
  begin
    Result:=
      (opASaveMaxSizeKb = 0) or
      (F.EditorMaster.TextSource.Lines.TextLength <= opASaveMaxSizeKb * 1024);
  end;
  //
  function FrameOk(F: TEditorFrame): boolean;
  begin
    Result:= (F<>nil) and
      F.Modified and
      ((F.FileName<>'') or (opASaveUnnamed<>cAutoSaveIgnore)) and
      SizeOk(F);
  end;
  //
  procedure DoSave(F: TEditorFrame);
  var
    dir, ext, fn: Widestring;
  begin
    if F.FileName<>'' then
      SaveFrame(F, false)
    else
    if opASaveUnnamed=cAutoSaveIgnore then
      Exit
    else
    if opASaveUnnamed=cAutoSavePromptFN then
      SaveFrame(F, true)
    else
    if opASaveUnnamed=cAutoSaveSaveToDir then
    begin
      //get save dir
      dir:= SExpandVars(opASaveUnnamedDir);
      SReplaceW(dir, '%AppData%\', FAppDataPath); //force %AppData% expand
      if not IsDirExist(dir) then
        ForceDirectories(dir);

      //get save extention
      if F.EditorMaster.TextSource.SyntaxAnalyzer<>nil then
        ext:= F.EditorMaster.TextSource.SyntaxAnalyzer.Extentions
      else
        ext:= 'txt';
      SDeleteFromW(ext, ' ');

      //save
      fn:= FFreeFN(DKLangConstW('newFnLatin'), ext, dir);
      //msg('"'+fn+'"');
      F.FileName:= fn;
      SaveFrame(F, false);
      UpdateTitle(F);
      SynMruFiles.AddItem(fn);
    end;
  end;
var
  i: integer;
  F: TEditorFrame;
begin
  if opASaveAllFiles then
  begin
    for i:= 0 to FrameAllCount-1 do
    begin
      F:= FramesAll[i];
      if FrameOk(F) then
        DoSave(F);
    end;
  end
  else
  begin
    F:= CurrentFrame;
    if FrameOk(F) then
      DoSave(F);
  end;
end;

procedure TfmMain.UpdateMacroKeynames;
  procedure KeyN(cmd: integer; const NewName: string);
  var i: integer;
  begin
    with SyntKeyMapping do
      for i:= 0 to Items.Count-1 do
        if Items[i].Command=cmd then
        begin
          Items[i].DisplayName:= NewName;
          Exit
        end;
  end;
begin
  KeyN(sm_Macro1, MacroCmdName(0));
  KeyN(sm_Macro2, MacroCmdName(1));
  KeyN(sm_Macro3, MacroCmdName(2));
  KeyN(sm_Macro4, MacroCmdName(3));
  KeyN(sm_Macro5, MacroCmdName(4));
  KeyN(sm_Macro6, MacroCmdName(5));
  KeyN(sm_Macro7, MacroCmdName(6));
  KeyN(sm_Macro8, MacroCmdName(7));
  KeyN(sm_Macro9, MacroCmdName(8));
  KeyN(sm_Macro10, MacroCmdName(9));
  KeyN(sm_Macro11, MacroCmdName(10));
  KeyN(sm_Macro12, MacroCmdName(11));
  KeyN(sm_Macro13, MacroCmdName(12));
  KeyN(sm_Macro14, MacroCmdName(13));
  KeyN(sm_Macro15, MacroCmdName(14));
  KeyN(sm_Macro16, MacroCmdName(15));
  KeyN(sm_Macro17, MacroCmdName(16));
  KeyN(sm_Macro18, MacroCmdName(17));
  KeyN(sm_Macro19, MacroCmdName(18));
  KeyN(sm_Macro20, MacroCmdName(19));
  KeyN(sm_Macro21, MacroCmdName(20));
  KeyN(sm_Macro22, MacroCmdName(21));
  KeyN(sm_Macro23, MacroCmdName(22));
  KeyN(sm_Macro24, MacroCmdName(23));
  KeyN(sm_Macro25, MacroCmdName(24));
  KeyN(sm_Macro26, MacroCmdName(25));
  KeyN(sm_Macro27, MacroCmdName(26));
  KeyN(sm_Macro28, MacroCmdName(27));
  KeyN(sm_Macro29, MacroCmdName(28));
  KeyN(sm_Macro30, MacroCmdName(29));
end;

procedure TfmMain.ecMacro10Execute(Sender: TObject);
begin
  RunMacro(9);
end;

procedure TfmMain.ecMacro11Execute(Sender: TObject);
begin
  RunMacro(10);
end;

procedure TfmMain.ecMacro12Execute(Sender: TObject);
begin
  RunMacro(11);
end;

procedure TfmMain.ecMacro13Execute(Sender: TObject);
begin
  RunMacro(12);
end;

procedure TfmMain.ecMacro14Execute(Sender: TObject);
begin
  RunMacro(13);
end;

procedure TfmMain.ecMacro15Execute(Sender: TObject);
begin
  RunMacro(14);
end;

procedure TfmMain.ecMacro16Execute(Sender: TObject);
begin
  RunMacro(15);
end;

procedure TfmMain.ecMacro17Execute(Sender: TObject);
begin
  RunMacro(16);
end;

procedure TfmMain.ecMacro18Execute(Sender: TObject);
begin
  RunMacro(17);
end;

procedure TfmMain.ecMacro19Execute(Sender: TObject);
begin
  RunMacro(18);
end;

procedure TfmMain.ecMacro20Execute(Sender: TObject);
begin
  RunMacro(19);
end;

procedure TfmMain.ecMacro21Execute(Sender: TObject);
begin
  RunMacro(20);
end;

procedure TfmMain.ecMacro22Execute(Sender: TObject);
begin
  RunMacro(21);
end;

procedure TfmMain.ecMacro23Execute(Sender: TObject);
begin
  RunMacro(22);
end;

procedure TfmMain.ecMacro24Execute(Sender: TObject);
begin
  RunMacro(23);
end;

procedure TfmMain.ecMacro25Execute(Sender: TObject);
begin
  RunMacro(24);
end;

procedure TfmMain.ecMacro26Execute(Sender: TObject);
begin
  RunMacro(25);
end;

procedure TfmMain.ecMacro27Execute(Sender: TObject);
begin
  RunMacro(26);
end;

procedure TfmMain.ecMacro28Execute(Sender: TObject);
begin
  RunMacro(27);
end;

procedure TfmMain.ecMacro29Execute(Sender: TObject);
begin
  RunMacro(28);
end;

procedure TfmMain.ecMacro30Execute(Sender: TObject);
begin
  RunMacro(29);
end;

procedure TfmMain.TBXItemMacro10Click(Sender: TObject);
begin
  ecMacro10.Execute;
end;

procedure TfmMain.TBXItemMacro11Click(Sender: TObject);
begin
  ecMacro11.Execute;
end;

procedure TfmMain.TBXItemMacro12Click(Sender: TObject);
begin
  ecMacro12.Execute;
end;

procedure TfmMain.TBXItemMacro13Click(Sender: TObject);
begin
  ecMacro13.Execute;
end;

procedure TfmMain.TBXItemMacro14Click(Sender: TObject);
begin
  ecMacro14.Execute;
end;

procedure TfmMain.TBXItemMacro15Click(Sender: TObject);
begin
  ecMacro15.Execute;
end;

procedure TfmMain.TBXItemMacro16Click(Sender: TObject);
begin
  ecMacro16.Execute;
end;

procedure TfmMain.TBXItemMacro17Click(Sender: TObject);
begin
  ecMacro17.Execute;
end;

procedure TfmMain.TBXItemMacro18Click(Sender: TObject);
begin
  ecMacro18.Execute;
end;

procedure TfmMain.TBXItemMacro19Click(Sender: TObject);
begin
  ecMacro19.Execute;
end;

procedure TfmMain.TBXItemMacro20Click(Sender: TObject);
begin
  ecMacro20.Execute;
end;

procedure TfmMain.TBXItemMacro21Click(Sender: TObject);
begin
  ecMacro21.Execute;
end;

procedure TfmMain.TBXItemMacro22Click(Sender: TObject);
begin
  ecMacro22.Execute;
end;

procedure TfmMain.TBXItemMacro23Click(Sender: TObject);
begin
  ecMacro23.Execute;
end;

procedure TfmMain.TBXItemMacro24Click(Sender: TObject);
begin
  ecMacro24.Execute;
end;

procedure TfmMain.TBXItemMacro25Click(Sender: TObject);
begin
  ecMacro25.Execute;
end;

procedure TfmMain.TBXItemMacro26Click(Sender: TObject);
begin
  ecMacro26.Execute;
end;

procedure TfmMain.TBXItemMacro27Click(Sender: TObject);
begin
  ecMacro27.Execute;
end;

procedure TfmMain.TBXItemMacro28Click(Sender: TObject);
begin
  ecMacro28.Execute;
end;

procedure TfmMain.TBXItemMacro29Click(Sender: TObject);
begin
  ecMacro29.Execute;
end;

procedure TfmMain.TBXItemMacro30Click(Sender: TObject);
begin
  ecMacro30.Execute;
end;

constructor TSynFindInfo.Create;
begin
  FN:= '';
  Str:= '';
  LineNum:= 0;
  ColNum:= 0;
  Len:= 0;
end;

procedure TfmMain.UpdateTreeFind_Results(
  AStr: Widestring; const ADir: Widestring;
  AStopped: boolean; AInTabs: boolean = false);
  //-------------------
  function STreeText(SEnd: Widestring): Widestring;
  var
    SStart: Widestring;
  begin
    if AStopped then
      SEnd:= SEnd + ', ' + DKLangConstW('O_intr');
    if not AInTabs then
      SStart:= WideFormat(DKLangConstW('O_fnode'), [AStr, ADir])
    else
      SStart:= WideFormat(DKLangConstW('O_ftabs'), [AStr]);
    Result:= SStart + ' (' + SEnd + ')';
  end;
  //-------------------
  function UpdateTreeCounter(NodeFile: TTntTreeNode): integer;
  var
    //Node: TTntTreeNode;
    Obj: TObject;
  begin
    {
    Result:= 1;
    Node:= NodeFile.GetFirstChild;
    if Node<>nil then
    repeat
      Node:= NodeFile.GetNextChild(Node);
      if Node=nil then Break;
      Inc(Result);
    until false;
    }
    Result:= 0;
    Obj:= TObject(NodeFile.Data);
    if Obj is TSynFindCount then
      Result:= (Obj as TSynFindCount).Matches + 1;
    NodeFile.Text:= NodeFile.Text+ Format(' (%d)', [Result]);
  end;
var
  Node: TTntTreeNode;
  NFiles, NItems: integer;
  SEnd: Widestring;
begin
  AStr:= SReplaceAllEols(AStr, '¶');

  NFiles:= 0;
  NItems:= 0;
  if FTreeRoot=nil then
    raise Exception.Create('TreeRoot nil');
  Node:= FTreeRoot.GetFirstChild;
  if Node=nil then
  begin
    SEnd:= DKLangConstW('O_nores');
    FTreeRoot.Text:= STreeText(SEnd);
    Exit
  end;
  repeat
    Inc(NFiles);
    Inc(NItems, UpdateTreeCounter(Node));
    Node:= FTreeRoot.GetNextChild(Node);
    if Node=nil then Break;
  until false;

  //report
  SEnd:= WideFormat(DKLangConstW('O_stat'), [NItems, NFiles]);
  FTreeRoot.Text:= STreeText(SEnd);
  TreeFind.Selected:= FTreeRoot;
  FTreeRoot.Expand(false);
end;

procedure TfmMain.UpdateTreeFind_Initial(AStr: Widestring; const ADir: Widestring; AInTabs: boolean = false);
begin
  AStr:= SReplaceAllEols(AStr, '¶');

  if not AInTabs then
    FTreeRoot:= TreeFind.Items.Add(nil,
      WideFormat(DKLangConstW('O_fnode'), [AStr, ADir]) + '...')
  else
    FTreeRoot:= TreeFind.Items.Add(nil,
      WideFormat(DKLangConstW('O_ftabs'), [AStr]) + '...');

  TreeFind.Selected:= FTreeRoot;
  FTreeRoot.Expand(false);
end;

procedure TfmMain.TreeFindDblClick(Sender: TObject);
var
  Obj: TObject;
  Info: TSynFindInfo;
  fn: Widestring;
  n: integer;
begin
  if TreeFind.Selected=nil then Exit;
  Obj:= TObject(TreeFind.Selected.Data);
  if Obj is TSynFindInfo then
    Info:= Obj as TSynFindInfo
  else
    Info:= nil;

  if Info=nil then
  begin
    //maybe clicked on Replace result: "filename (NN)"
    fn:= TreeFind.Selected.Text;
    if (fn='') or (fn[Length(fn)]<>')') then Exit;
    n:= Length(fn);
    while (n>0) and (fn[n]<>' ') do Dec(n);
    if n=0 then Exit;
    Delete(fn, n, MaxInt);
    if not IsFileExist(fn) then Exit;
    DoOpenFile(fn);
    Exit;
  end;

  //clicked on Find result line (with Info)
  if IsFileExist(Info.FN) then
    DoOpenFile(Info.FN)
  else
  begin
    n:= SGetFrameIndexFromPrefixedStr(Info.FN);
    if (n>=0) and (n<FrameAllCount) then
      CurrentFrame:= FramesAll[n]
    else
      Exit;
  end;

  with CurrentEditor do
  begin
    CaretPos:= Point(Info.ColNum, Info.LineNum);
    SetSelection(CaretPosToStrPos(CaretPos), Info.Len);
  end;
  EditorCenterPos(CurrentEditor, false, opSrOffsetY);
  FocusEditor;
end;

procedure TfmMain.TreeFindCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
  DefaultDraw:= true;
end;

procedure TfmMain.TreeFindAdvancedCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
  var PaintImages, DefaultDraw: Boolean);
var
  r: TRect;
  Obj: TObject;
  Info: TSynFindInfo;
  sInf, s: Widestring;
  n: Integer;
begin
  Obj:= TObject(Node.Data);
  if Obj is TSynFindInfo then
    Info:= Obj as TSynFindInfo
  else
    Exit;

  if Stage<>cdPostPaint then Exit;
  DefaultDraw:= true;
  R:= Node.DisplayRect(true);
  Inc(R.Left, 2); // <---------dx
  Inc(R.Top, 1); //<--------dy

  Sender.Canvas.Font.Assign(TreeFind.Font);
  Sender.Canvas.Font.Color:= opColorOutRedText;
  Sender.Canvas.Brush.Color:= opColorOutHi;

  sInf:= SFindResPrefix({Info.FN,} Info.LineNum);
  s:= Copy(TTntTreeNode(Node).Text, 1, Length(sInf)+Info.ColNum);
  n:= ecTextExtent(Sender.Canvas, s).cx;
  s:= Copy(TTntTreeNode(Node).Text, Length(sInf)+Info.ColNum+1, Info.Len);
  ecTextOut(Sender.Canvas, R.Left+n, R.Top, s);
end;

function TfmMain.SFindResPrefix(LineNum: integer): Widestring;
begin
  Result:= WideFormat('(%d): ', [LineNum+1]);
end;

procedure TfmMain.TreeFindKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Enter, Space
  if ((Key=vk_space) or (Key=vk_return)) and (Shift=[]) then
  begin
    TreeFindDblClick(Sender);
    Key:= 0;
    Exit
  end;
  //Ctrl+F
  if IsShortcutOfCmd(Shortcut(Key, Shift), smFindDialog) then
  begin
    TBXItemTreeFindFindClick(Self);
    Key:= 0;
    Exit
  end;
  //Del, Ctrl+Del
  if (Key=vk_delete) and ((Shift=[]) or (Shift=[ssCtrl])) then
  begin
    TbxItemTreeFindClearClick(Sender);
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.UpdateTreeFind_ReplaceResults(const ANodeText: Widestring; ANumFiles, ANumItems: integer; AStopped: boolean);
var
  SEnd: Widestring;
begin
  if FTreeRoot=nil then
    raise Exception.Create('TreeRoot nil');

  if ANumItems=0 then
    SEnd:= DKLangConstW('O_nores')
  else
    SEnd:= WideFormat(DKLangConstW('O_stat'), [ANumItems, ANumFiles]);
  if AStopped then
    SEnd:= SEnd + ', ' + DKLangConstW('O_intr');

  FTreeRoot.Text:= ANodeText + ' ('+SEnd+')';
end;

procedure TfmMain.TBXItemTreeFindNavClick(Sender: TObject);
begin
  TreeFindDblClick(Self);
end;

procedure TfmMain.TBXItemTreeFindFindClick(Sender: TObject);
begin
  DoFindInFindResults;
end;

procedure TfmMain.DoFindInFindResults;
begin
  with TreeFind do
    if CanFocus then
    begin
      SetFocus;
      ecFindInTree.Execute;
    end;
end;

procedure TfmMain.TBXItemTreeFindCopyToTabClick(Sender: TObject);
begin
  DoCopyFindResultToTab(false, false);
end;

procedure TfmMain.DoCopyFindResultToTab(ALastSearch, AFilesOnly: boolean;
  AToClip: boolean = false);
var
  Node: TTntTreeNode;
  L: TWideStringList;
  S: Widestring;
begin
  if ALastSearch then
  begin
    Node:= FTreeRoot;
    if Node=nil then
      raise Exception.Create('TreeRoot nil');
  end
  else
  begin
    Node:= TreeFind.Selected;
    if Node=nil then Exit;
    if Node.Parent<>nil then //goto file level
      Node:= Node.Parent;
    if Node.Parent<>nil then //goto root level
      Node:= Node.Parent;
  end;

  L:= TWideStringList.Create;
  try
    DoCopyFindResultToList(Node, L, AFilesOnly);
    if AToClip then
    begin
      S:= L.Text;
      SReplaceZeroesW(S);
      TntClipboard.AsWideText:= S;
    end
    else
    begin
      acNewTab.Execute;
      CurrentEditor.Lines.AddStrings(L);
      //EditorSetModified(CurrentEditor);
    end;
  finally
    FreeAndNil(L);
  end;
end;

//copy tree from selected node
procedure TfmMain.DoCopyFindResultNode;
var
  Node: TTntTreeNode;
  L: TWideStringList;
  S: Widestring;
begin
  Node:= TreeFind.Selected;
  if Node=nil then Exit;

  L:= TWideStringList.Create;
  try
    DoCopyFindResultToList(Node, L, true);
    S:= L.Text;
  finally
    FreeAndNil(L);
  end;

  SReplaceZeroesW(S);
  TntClipboard.AsWideText:= S;
end;

procedure TfmMain.DoCopyFindResultToList(ARootNode: TTntTreeNode;
  L: TWideStringList; AFilesOnly: boolean);
var
  Node, Node2: TTntTreeNode;
  Info: TSynFindInfo;
  n: integer;
begin
  L.Clear;
  L.Add(ARootNode.Text);
  L.Add('');
  Node:= ARootNode.GetFirstChild;
  if Node=nil then Exit;

  repeat
    if AFilesOnly then
      L.Add(Node.Text)
    else
    begin
      Node2:= Node.GetFirstChild;
      if Node2<>nil then
        repeat
          if TObject(Node2.Data) is TSynFindInfo then
            Info:= TSynFindInfo(Node2.Data)
          else
            Info:= nil;

          if Info<>nil then
          begin
            n:= Pos('): ', Node2.Text);
            if n>0 then
              L.Add(
                Info.FN + '(' + IntToStr(Info.LineNum+1) + '): ' +
                Info.Str);
          end;
          Node2:= Node.GetNextChild(Node2);
        until Node2=nil;
    end;
    Node:= ARootNode.GetNextChild(Node);
  until Node=nil;
end;

procedure TfmMain.TBXItemTreeFindClearClick(Sender: TObject);
begin
  DoClearTreeFind;
end;

procedure TfmMain.DoClearTreeFind;
var
  i: integer;
  Node: TTntTreeNode;
begin
  for i:= TreeFind.Items.Count-1 downto 0 do
  begin
    Node:= TreeFind.Items[i];
    if Node.Data<>nil then
    begin
      TObject(Node.Data).Free;
      Node.Data:= nil;
    end;
  end;
  TreeFind.Items.Clear;
end;

procedure TfmMain.TBXItemTreeFindCopyToClipClick(Sender: TObject);
begin
  DoCopyFindResultToTab(false, false, true{AToClip});
end;

procedure TfmMain.TBXItemTreeFindExpandClick(Sender: TObject);
var
  Node: TTntTreeNode;
begin
  Node:= TreeFind.Selected;
  TreeFind.FullExpand;
  if Node<>nil then
    Node.MakeVisible;
end;

procedure TfmMain.TBXItemTreeFindCollapseClick(Sender: TObject);
begin
  TreeFind.FullCollapse;
end;

{
procedure TfmMain.MsgAcpFile(const s: Widestring);
begin
  SHint[-1]:= '[ACP from file] ' + s;
  //Application.ProcessMessages; //don't leave in release!
end;
}

procedure TfmMain.MsgNoRun(const fn: Widestring);
begin
  MsgError(WideFormat(DKLangConstW('MRun'), [fn]), Handle);
end;

procedure TfmMain.MsgNoSelection;
begin
  MsgWarn(DKLangConstW('MNSel2'), Handle);
end;

procedure TfmMain.MsgNoSelectionForHelp;
begin
  MsgWarn(DKLangConstW('MNSel'), Handle);
end;

procedure TfmMain.MsgNoFile(const fn: Widestring);
begin
  MsgError(DKLangConstW('MNFound')+#13+fn, Handle);
end;

procedure TfmMain.MsgNoDir(const fn: Widestring);
begin
  MsgWarn(DKLangConstW('MNFoundFold')+#13+fn, Handle);
end;

procedure TfmMain.MsgEmptyMacro(const s: Widestring);
begin
  MsgWarn(WideFormat(DKLangConstW('zMNoMacro'), [s]), Handle);
end;

procedure TfmMain.MsgDelLines(N: integer);
begin
  DoHint(WideFormat(DKLangConstW('zDelLn'), [N]));
end;

procedure TfmMain.MsgDoneLines(N: integer);
begin
  DoHint(WideFormat(DKLangConstW('zDoneLn'), [N]));
end;

procedure TfmMain.MsgTabbing(const s: Widestring);
begin
  DoHint('[SmartTagTabbing] ' + s);
end;

{
procedure TfmMain.MsgID(const s: Widestring);
begin
  SHint[-1]:= '[FindID] ' + s;
end;
}

procedure TfmMain.TBXItemFNewClick(Sender: TObject);
begin
  acNewTab.Execute;
end;

procedure TfmMain.TBXItemTreeFindExpandCurClick(Sender: TObject);
begin
  with TreeFind do
    if Selected<>nil then
      Selected.Expand(true);
end;

procedure TfmMain.ApplyTips;
begin
  Tree.ToolTips:= opTipsPanels;
  TreeFind.ToolTips:= opTipsPanels;
  ListOut.ShowHint:= opTipsPanels;
  ListVal.ShowHint:= opTipsPanels;
  ListPLog.ShowHint:= opTipsPanels;
  MemoConsole.ShowHint:= opTipsPanels;
  if Assigned(fmClip) then
    fmClip.ListClip.ShowHint:= opTipsPanels;
end;


function CurrentLexerForLine(Ed: TSyntaxMemo; NLine: integer): string;
var
  Pos: integer;
begin
  if Assigned(Ed) then
  begin
    Pos:= Ed.CaretPosToStrPos(Point(0, NLine));
    Result:= EditorCurrentLexerForPos(Ed, Pos);
  end
  else
    Result:= '';
end;

function TfmMain.CurrentLexer: string;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Assigned(Ed) then
    Result:= EditorCurrentLexerForPos(Ed, Ed.CaretStrPos)
  else
    Result:= '';
end;

function TfmMain.CurrentLexerForFile: string;
begin
  Result:= '';
  if SyntaxManager.CurrentLexer<>nil then
    Result:= SyntaxManager.CurrentLexer.LexerName;
end;

function TfmMain.GetLexerComment(const Lexer: string): string;
var
  An: TSyntAnalyzer;
begin
  Result:= '';
  An:= SyntaxManager.FindAnalyzer(Lexer);
  if An<>nil then
    Result:= An.LineComment;
end;

function TfmMain.DoSmartTagTabbing: boolean;
var
  Ed: TSyntaxMemo;
  s, sTag, sTagExp, sIndent: Widestring;
  NTagSt, NTagLen, NCaret, NPos: integer;
  SelSt, SelLen: integer;
  fn: string;
  DoInitTab: boolean;
begin
  Result:= false;
  if not opAcpTabbing then Exit;
  if not IsLexerHTML(CurrentLexer) then Exit;

  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;
  if Ed.CaretPos.Y >= Ed.Lines.Count then Exit;
  s:= Ed.Lines[Ed.CaretPos.Y];

  //process tabbing inside <tagName ......>
  NCaret:= Ed.CaretPos.X + 1;
  SGetTagBounds(s, NCaret, NTagSt, NTagLen);
  if (NTagSt>0) and (NTagLen>0) then
  begin
    sTag:= Copy(s, NTagSt, NTagLen);
    SelSt:= NCaret - NTagSt + 1;
    SelLen:= Ed.SelLength;

    SGetTagTabbing(sTag, SelSt, SelLen);
    if SelSt > 0 then
    begin
      Ed.CaretPos:= Point(NTagSt + SelSt - 2,
        Ed.CaretPos.Y);
      Ed.SetSelection(
        Ed.CaretStrPos, SelLen);
      MsgTabbing(DKLangConstW('ztagMovedSelection'));
    end
    else
    begin
      Ed.CaretPos:= Point(NTagSt + NTagLen - 1,
        Ed.CaretPos.Y);
      Ed.ResetSelection;
      MsgTabbing(DKLangConstW('ztagMovedOut'));
    end;
    Result:= true;
  end
  else
  begin
    //process tagName expanding to <tagName ......>
    SGetTagStart(s, NCaret, NTagSt);
    if NTagSt=0 then Exit;
    sTag:= Copy(s, NTagSt, NCaret-NTagSt);

    //read tag expansion from Html_Tabbing.ini
    fn:= GetHtmlTabbingFN;
    if not IsFileExist(fn) then
    begin
      MsgTabbing('File not found: "'+fn+'"');
      MsgBeep;
      Result:= true;
      Exit;
    end;

    with TIniFile.Create(fn) do
    try
      sTagExp:= ReadString('HTML', sTag, '');
    finally
      Free
    end;

    if sTagExp='' then
    begin
      MsgTabbing(DKLangConstW('ztagTagUnknown')+' "'+sTag+'"');
      MsgBeep;
      Result:= true;
      Exit
    end;

    //insert expanded tag
    DoInitTab:=
      (Pos('|', sTagExp) = 0) and
      (Pos(' ', sTagExp) > 0);

    //replace '\n'
    sIndent:= EditorIndentStringForPos(Ed, Point(NTagSt-1, Ed.CaretPos.Y));
    SReplaceAllW(sTagExp, '\n', EditorEOL(Ed) + sIndent);

    //replace '|', save 1st '|' position
    NCaret:= Pos('|', sTagExp);
    if NCaret=0 then NCaret:= 1;
    SReplaceAllW(sTagExp, '|', '');

    Ed.BeginUpdate;
    try
      Ed.CaretPos:= Point(NTagSt-1, Ed.CaretPos.Y);
      NPos:= Ed.CaretStrPos;
      Ed.DeleteText(Length(sTag));
      Ed.InsertText(sTagExp);
      if DoInitTab then
      begin
        //do TagTabbing 2 times to select inner range
        SelSt:= 0;
        SelLen:= 0;
        SGetTagTabbing(sTagExp, SelSt, SelLen);
        SGetTagTabbing(sTagExp, SelSt, SelLen);
        Ed.CaretStrPos:= NPos + SelSt - 1;
        Ed.SetSelection(
          Ed.CaretStrPos, SelLen);
        MsgTabbing(DKLangConstW('ztagExpandAndMove'));
      end
      else
      begin
        //NCaret holds '|' position in sTagExp
        Ed.CaretStrPos:= NPos + NCaret - 1;
        MsgTabbing(DKLangConstW('ztagExpand'));
      end;
    finally
      Ed.EndUpdate;
    end;
    Result:= true;
  end;
end;

procedure TfmMain.ecTreeParentExecute(Sender: TObject);
begin
  DoTreeJump(tgoParent);
end;

procedure TfmMain.ecTreeNextBrotherExecute(Sender: TObject);
begin
  DoTreeJump(tgoNextBro);
end;

procedure TfmMain.ecTreePrevBrotherExecute(Sender: TObject);
begin
  DoTreeJump(tgoPrevBro);
end;

procedure TfmMain.TBXItemSSelTokenClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SelectToken);
end;

procedure TfmMain.TBXItemTreeFindCopyToClipNodeClick(Sender: TObject);
begin
  //if root selected (Parent=nil), do "Copy search",
  //else do "Copy node"
  if (TreeFind.Selected<>nil) and (TreeFind.Selected.Parent=nil) then
    TBXItemTreeFindCopyToClipClick(Self)
  else
    DoCopyFindResultNode;
end;

function TfmMain.CurrentTabSwitcher: TTabSwitcher;
begin
  Result:= TabSwitchers[Groups.PagesIndexOf(Groups.PagesCurrent)];
end;

procedure TfmMain.DoTabSwitch(ANext: boolean; AAllowModernSwitch: boolean = true);
var
  NTabs: integer;
begin
  NTabs:= FrameCount;
  if NTabs<=1 then Exit;

  if opTabSwitcher and (NTabs>2) and AAllowModernSwitch then
  begin
    NTabs:= CurrentTabSwitcher.TabSwitch(ANext, Application.MainForm);
    if NTabs>=0 then
      Groups.PagesCurrent.Tabs.TabIndex:= NTabs;
  end
  else
    Groups.PagesCurrent.Tabs.SwitchTab(ANext);
end;

procedure TfmMain.UpdateTabList(TopItem, NewItem, DelItem: integer);
begin
  CurrentTabSwitcher.UpdateTabList(TopItem, NewItem, DelItem);
end;

procedure TfmMain.UpdateListTabs;
var
  F, FCurrent: TEditorFrame;
  i, NUnnamed: Integer;
begin
  NUnnamed:= 0;
  FCurrent:= CurrentFrame;

  with ListTabs do
  begin
    Items.BeginUpdate;
    try
      Items.Clear;
      for i:= 0 to FrameAllCount-1 do
        with Items.Add do
        begin
          F:= FramesAll[i];
          if F=FCurrent then
            ListTabs.Selected:= Items[i];

          if F.FileName='' then
          begin
            Inc(NUnnamed);
            Caption:= DKLangConstW('Untitled') + ' ['+IntToStr(NUnnamed)+']';
          end
          else
            Caption:= WideExtractFileName(F.FileName);

          SubItems.Add(F.FileName);
          SubItems.Add(IntToStr(i));

          if F.Modified then
            ImageIndex:= 1
          else
            ImageIndex:= -1;
        end;
    finally
      Items.EndUpdate;
    end;

    if Selected<>nil then
      Selected.MakeVisible(false);
  end;
end;


procedure TfmMain.DoMoveTabInList(FromN, ToN: integer);
begin
  CurrentTabSwitcher.MoveTabInList(FromN, ToN);

  {$ifdef TabOrder}
  UpdateTitle(CurrentFrame);
  {$endif}
  UpdateListTabs;
end;

procedure TfmMain.DoClearTabSwitcherList;
var
  i: Integer;
begin
  for i:= Low(TabSwitchers) to High(TabSwitchers) do
    TabSwitchers[i].InitTabList(1);

  {$ifdef TabOrder}
  UpdateTitle(CurrentFrame);
  {$endif}
end;

procedure TfmMain.GetTabName(
  APagesNumber, ATabIndex: Integer;
  var AName, AFN, ALex: Widestring);
var
  F: TEditorFrame;
  D: TATTabData;
begin
  D:= Groups.Pages[APagesNumber].Tabs.GetTabData(ATabIndex);
  if D<>nil then
  begin
    F:= D.TabObject as TEditorFrame;
    AName:= WideFormat('[%d] ', [ATabIndex+1]) + F.TabCaption;
    AFN:= F.FileName;
    if AFN='' then
      AFN:= DKLangConstW('Untitled');
    ALex:= F.CurrentLexer;
  end
  else
  begin
    AName:= WideFormat('[%d]', [ATabIndex+1]);
    AFN:= WideFormat('(index=%d, FrameCount=%d)', [ATabIndex, FrameAllCount]);
    ALex:= '';
  end;
end;

procedure TfmMain.TBXItemFPropsClick(Sender: TObject);
begin
  acProps.Execute;
end;

procedure TfmMain.acPropsExecute(Sender: TObject);
var
  fn: WideString;
  NSize: Int64;
  NTime: TFileTime;
  NWords, NChars, NLines: Int64;
begin
  //this's needed, otherwise *big* (10M) RTF may hang
  //after form showing
  Application.ProcessMessages;

  fn:= CurrentFrame.FileName;
  NWords:= 0;
  NChars:= 0;
  NLines:= 0;
  if (CurrentFrame<>nil) and (CurrentFrame.EditorMaster.TextSource<>nil) then
  try
    Screen.Cursor:= crHourGlass;
    EditorCountWords(CurrentFrame.EditorMaster.TextSource.Lines, NWords, NChars);
    NLines:= CurrentFrame.EditorMaster.TextSource.Lines.Count;
  finally
    Screen.Cursor:= crDefault;
  end;

  with TfmProps.Create(Self) do
  try
    FIniFN:= Self.SynHistoryIni;
    //fill File tab
    edPath.Text:= fn;
    if (fn<>'') and FGetFileInfo(fn, NSize, NTime) then
    begin
      edSize.Text:= FormatSize(NSize, true);
      edTime.Text:= FormatFileTime(NTime);
    end;
    //fill Text tab
    edChars.Text:= FormatSize(NChars, false);
    edWords.Text:= FormatSize(NWords, false);
    edLines.Text:= FormatSize(NLines, false);
    //
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmMain.TemplatePopupShow(Sender: TObject);
begin
  if opAcpUseSingle then
    if TemplatePopup.Listbox.Items.Count=1 then
      TemplatePopup.CloseUp(true);
end;

function TfmMain.DoSnippetTabbing: boolean;
var
  Ed: TSyntaxMemo;
  StrId, StrLexer, StrSelText: Widestring;
  NSnipIndex, i: Integer;
begin
  Result:= false;
  Ed:= CurrentEditor;
  if not opTemplateTabbing then Exit;
  if SFileExtensionMatch(CurrentFrame.FileName, opTemplateTabbingExcept) then Exit;
  if Ed.ReadOnly then Exit;

  StrLexer:= CurrentLexer;
  StrId:= EditorGetWordBeforeCaret(Ed, true);
  if StrId='' then Exit;

  InitSnippets;
  NSnipIndex:= -1;
  for i:= 0 to FListSnippets.Count-1 do
  begin
    with TSynSnippetClass(FListSnippets[i]) do
      if ((Info.Lexers = '') or IsLexerListed(StrLexer, Info.Lexers)) and
        (StrId = Info.Id) then
        if NSnipIndex>=0 then //id exists N times?
        begin
          DoSnippetListDialog(StrId);
          Result:= true;
          Exit
        end
        else
          NSnipIndex:= i;
  end;

  //single snippet found
  if NSnipIndex>=0 then
  begin
    Ed.BeginUpdate;
    try
      StrSelText:= Ed.SelText;
      Ed.ClearSelection;
      Ed.CaretStrPos:= Ed.CaretStrPos - Length(StrId);
      Ed.DeleteText(Length(StrId));
      EditorInsertSnippet(Ed, TSynSnippetClass(FListSnippets[NSnipIndex]).Info.Text, StrSelText);
    finally
      Ed.EndUpdate;
    end;
    Result:= true;
  end;
end;

procedure TfmMain.MsgColorBad;
begin
  DoHint(DKLangConstW('MColorBad')+' "'+s+'"');
end;

procedure TfmMain.MsgColorOK;
begin
  DoHint(WideFormat(DKLangConstW('MColorOk'), ['#'+s]));
end;


function TfmMain.IsShowColor(s: string;
  var NColor, NColorText: TColor): boolean;
var
  SColor, SColorText: ecString;
  Sel: Widestring;
begin
  Result:= false;
  NColor:= clNone;
  NColorText:= clNone;
  UpdateColorHint(false);

  if s='' then Exit;
  if not IsLexerWithColors(CurrentLexer) then Exit;

  //show selected color first
  sel:= CurrentEditor.SelText;

  //show color for HTML color names (Blue, Red..)
  if IsStringRegex(sel, cRegexColorName) then
  begin
    s:= SGetColorNameValue(sel);
    if s='' then Exit;
    Delete(s, 1, 1);

    if not IsHexColorString(s) then
      begin MsgColorBad(s); Exit end;
    NColor:= SHtmlCodeToColor(s);

    MsgColorOK(s);
    Result:= true;
    Exit;
  end;

  //show color for selected color code #AABBCC
  if IsStringRegex(sel, cRegexColorCode) then
  begin
    Delete(sel, 1, 1);
    s:= sel;

    if not IsHexColorString(s) then
      begin MsgColorBad(s); Exit end;
    NColor:= SHtmlCodeToColor(s);

    MsgColorOK(s);
    Result:= true;
    Exit;
  end;

  //parse HTML <div style="color: #AAA; background-color: #BBB;">
  SColorText:= SFindRegex(s, '(?<=background-color\:\s*\#)\w{3,6}');
  SColor:= SFindRegex(s, '(?<=[^-]color\:\s*\#)\w{3,6}');
  if (SColor<>'') and (SColorText<>'') then
  begin
    //Msg(SColor+' '+SColorText);
    if not IsHexColorString(SColor) then
      begin MsgColorBad(SColor); Exit end;
    if not IsHexColorString(SColorText) then
      begin MsgColorBad(SColorText); Exit end;
    NColor:= SHtmlCodeToColor(SColor);
    NColorText:= SHtmlCodeToColor(SColorText);

    MsgColorOK(SColor+ ' / #' +SColorText);
    Result:= true;
    Exit
  end
  else
  if (SColor<>'') then
    s:= '#'+SColor
  else
  if (SColorText<>'') then
    s:= '#'+SColorText;

  //delete quotes
  if (s[1]='"') and (s[Length(s)]='"') then
  begin
    s:= Copy(s, 2, Length(s)-2);
    if s='' then Exit;
  end;
  if (s[1]='''') and (s[Length(s)]='''') then
  begin
    s:= Copy(s, 2, Length(s)-2);
    if s='' then Exit;
  end;

  //is string #AABBCC ?
  if s[1]<>'#' then Exit;
  Delete(s, 1, 1);
  if s='' then Exit;

  if not IsHexColorString(s) then
    begin MsgColorBad(s); Exit end;
  NColor:= SHtmlCodeToColor(s);

  MsgColorOK(s);
  Result:= true;
end;


procedure TfmMain.UpdateColorHint(AClearHint: boolean = true);
begin
  if AClearHint then
    DoHint('');
end;

procedure TfmMain.ecInsertColorExecute(Sender: TObject);
var
  fn: string;
  code: Cardinal;
  wStart, wEnd: integer;
  NColor: integer;
begin
  //auto-compelete may mess up with color picker
  ecACP.CloseUp(false);

  if CurrentEditor.ReadOnly then
    begin MsgBeep; Exit end;

  fn:= SynDir + 'Tools\ColorPicker.exe';
  if not IsFileExist(fn) then
    begin MsgNoFile(fn); Exit end;

  EditorGetColorCodeRange(CurrentEditor, wStart, wEnd, NColor);
  if FExecuteGetCode(fn, IntToStr(NColor), sw_show, true, code) then
    if code<>Cardinal(-1) then
    begin
      EditorInsertColorCode(CurrentEditor, code);
      DoAddRecentColor(code);
      {$ifndef FixRepaint}
      DoRepaintTBs;
      {$endif}
    end;
end;

procedure TfmMain.ApplyShowRecentColors;
begin
  case opShowRecentColors of
    cRecColorsAutoHide:
      TbxSubmenuItemRecentColors.Visible:= ImageListColorRecent.Count>1;
    cRecColorsShow:
      TbxSubmenuItemRecentColors.Visible:= true;
    cRecColorsHide:
      TbxSubmenuItemRecentColors.Visible:= false;
  end;
end;

procedure TfmMain.DoClearRecentColors;
begin
  TbxSubmenuItemRecentColors.Clear;

  //leave only 1st color ico
  with ImageListColorRecent do
    while Count>1 do
      Delete(Count-1);

  ApplyShowRecentColors;
end;

//index in "Recent colors" after "Clear list" and separator
const
  cColorIdxMin = 5;

procedure TfmMain.DoAddRecentColor(N: Integer);
var
  Item: TSpTbxItem;
begin
  DoInitRecentColorsMenu;
  DoAddColorToImageList(ImageListColorRecent, N);
  ApplyShowRecentColors;

  //delete old menuitem with same color
  DoDeleteRecentColor(N);

  //add new menuitem
  Item:= TSpTbxItem.Create(Self);
  Item.Caption:= SColorToHtmlCode(N);
  Item.Tag:= N;
  Item.OnClick:= RecentColorClick;
  Item.Images:= ImageListColorRecent;
  Item.ImageIndex:= Item.Images.Count-1;
  TbxSubmenuItemRecentColors.Insert(cColorIdxMin, Item);
end;

procedure TfmMain.DoDeleteRecentColor(N: Integer);
var
  i: Integer;
begin
  with TbxSubmenuItemRecentColors do
    for i:= cColorIdxMin to Count-1 do
      if Items[i].Tag=N then
      begin
        Items[i].Free;
        Break
      end;
end;


procedure TfmMain.RecentColorClick(Sender: TObject);
var
  Code: Integer;
begin
  Code:= TComponent(Sender).Tag;
  if Code=-1 then
    DoClearRecentColors
  else
  if IsCtrlPressed then
    DoDeleteRecentColor(Code)
  else
  begin
    EditorInsertColorCode(CurrentEditor, Code);
    DoAddRecentColor(Code);
  end;
end;

procedure TfmMain.DoHandleToolOutput(const ft: Widestring; const ATool: TSynTool);
var
  List: TWideStringList;
  AType: TSynOutputType;
  N1, N2: Integer;
begin
  ListOut.Items.Clear;
  if not (IsFileExist(ft) and (FGetFileSize(ft)>0)) then
  begin
    DoHint(WideFormat(DKLangConstW('MRun0'), [ATool.ToolCaption]));
    MsgBeep;
    Exit
  end;

  List:= TWideStringList.Create;
  with ATool do
  try
    List.LoadFromFile(ft);
    FDelete(ft);
    FixListOutput(List, ToolNoTags, IsLexerPas(ToolLexer), ToolOutEncoding,
      EditorTabExpansion(CurrentEditor));

    AType:= OutputTypeStrToType(ToolOutType);
    if AType=outReplaceSelOrDoc then
      if CurrentEditor.SelLength=0 then
        AType:= outReplaceDoc
      else
        AType:= outReplaceSel;

    case AType of
      outIgnore:
        begin end;

      outToPanel:
        begin
          SynPanelPropsOut.DefFilename:= CurrentFrame.FileName;
          SynPanelPropsOut.RegexStr:= ATool.ToolOutRegex;
          SynPanelPropsOut.RegexIdName:= ATool.ToolOutNum_fn;
          SynPanelPropsOut.RegexIdLine:= ATool.ToolOutNum_line;
          SynPanelPropsOut.RegexIdCol:= ATool.ToolOutNum_col;
          SynPanelPropsOut.Encoding:= ATool.ToolOutEncoding;
          SynPanelPropsOut.ZeroBase:= false;

          UpdatePanelOutFromList(List);
          UpdatePanelOut(tbOut);
          plOut.Show;
        end;

      outToNewDoc:
        begin
          acNewTab.Execute;
          CurrentEditor.Lines.AddStrings(List);
          //EditorSetModified(CurrentEditor);
        end;

      outReplaceSel:
        begin
          if CurrentEditor.ReadOnly then
            MsgBeep
          else
          begin
            CurrentEditor.BeginUpdate;
            try
              CurrentEditor.ClearSelection;
              CurrentEditor.InsertText(SDelLastCR(List.Text));
            finally
              CurrentEditor.EndUpdate;
            end;
          end;
        end;

      outReplaceDoc:
        begin
          if CurrentEditor.ReadOnly then
            MsgBeep
          else
          begin
            CurrentEditor.BeginUpdate;
            try
              N1:= CurrentEditor.TopLine;
              N2:= CurrentEditor.CaretPos.Y;

              CurrentEditor.SelectAll;
              CurrentEditor.ClearSelection;
              CurrentEditor.InsertText(List.Text);

              CurrentEditor.TopLine:= N1;
              CurrentEditor.CaretPos:= Point(0, N2);
            finally
              CurrentEditor.EndUpdate;
            end;
          end;
        end;

      outReplaceWord:
        begin
          if CurrentEditor.ReadOnly then
            MsgBeep
          else
          begin
            CurrentEditor.BeginUpdate;
            try
              if CurrentEditor.WordAtPos(CurrentEditor.CaretPos)<>'' then
                CurrentEditor.SelectWord;
              CurrentEditor.InsertText(Trim(SDelLastCR(List.Text)));
            finally
              CurrentEditor.EndUpdate;
            end;
          end;
        end;

      outToClip:
        begin
          TntClipboard.AsWideText:= List.Text;
        end;

      outInsAtLineStart:
        begin
          if CurrentEditor.ReadOnly then
            MsgBeep
          else
            with CurrentEditor do
            begin
              ResetSelection;
              CaretPos:= Point(0, CurrentLine);
              InsertText(List.Text);
            end;
        end;

      else
        raise Exception.Create('Unknown tool type: '+ToolOutType);
    end;
  finally
    FreeAndNil(List);
  end;
end;


function TfmMain.SStatusText(Ed: TSyntaxMemo): Widestring;
var
  Frame: TEditorFrame;
  state: TSynSelState;
  p1, p2: TPoint;
  NLine, NCol,
  NSelLines, NSelCols, NSelChars: integer;
  NCarets, NTopLine, NBottomLine: integer;
  NTime: TFileTime;
  NSize: Int64;
begin
  Result:= '';
  if Ed=nil then Exit;

  Frame:= FrameOfEditor(Ed);
  NCarets:= Frame.CaretsCount;
  Frame.CaretsProps(NTopLine, NBottomLine);

  with Ed do
  begin
    state:= selNone;
    NLine:= CaretPos.Y+1;
    NCol:= LinesPosToLog(CaretPos).X+1;
    NSelLines:= 0;
    NSelCols:= 0;
    NSelChars:= 0;

    if NCarets>1 then
      state:= selCarets
    else
    if HaveSelection then
    begin
      if SelectMode<>msColumn then
      begin
        state:= selStream;
        p1:= StrPosToCaretPos(SelStart);
        p2:= StrPosToCaretPos(SelStart+SelLength);
        NSelChars:= SelLength;
        NSelLines:= p2.Y-p1.Y+1;
        if NSelLines=1 then
          NSelCols:= p2.X-p1.X;
        if p2.X=0 then Dec(NSelLines);
        if NSelLines=1 then
          state:= selSmall;
      end
      else
      begin
        state:= selColumn;
        NSelLines:= SelRect.Bottom-SelRect.Top+1;
        NSelCols:= SelRect.Right-SelRect.Left;
        NSelChars:= NSelLines*NSelCols;
      end;
    end;
  end;

  FCurrSelState:= state;
  Result:= opStatusText[state];

  FillChar(NTime, SizeOf(NTime), 0);
  NSize:= 0;
  if Frame.FileName<>'' then
    if Pos('{File', Result)>0 then
      FGetFileInfo(Frame.FileName, NSize, NTime);

  SReplaceAllW(Result, '{LineNum}', IntToStr(NLine));
  SReplaceAllW(Result, '{ColNum}', IntToStr(NCol));
  SReplaceAllW(Result, '{SelLines}', IntToStr(NSelLines));
  SReplaceAllW(Result, '{SelCols}', IntToStr(NSelCols));
  SReplaceAllW(Result, '{SelChars}', IntToStr(NSelChars));

  SReplaceAllW(Result, '{TotalLines}', IntToStr(Ed.Lines.Count));
  if Pos('{TotalChars}', Result)>0 then
    SReplaceAllW(Result, '{TotalChars}', IntToStr(Ed.Lines.TextLength));

  SReplaceAllW(Result, '{Carets}', IntToStr(NCarets));
  SReplaceAllW(Result, '{CaretsTopLine}', IntToStr(NTopLine+1));
  SReplaceAllW(Result, '{CaretsBottomLine}', IntToStr(NBottomLine+1));

  if Frame.FileName<>'' then
  begin
    //if Pos('{FileSize}', Result)>0 then
    //  SReplaceAllW(Result, '{FileSize}', FormatSize(NSize, true));
    if Pos('{FileDate}', Result)>0 then
      SReplaceAllW(Result, '{FileDate}', FormatFileTime(NTime));
    if Pos('{FileDate2}', Result)>0 then
      SReplaceAllW(Result, '{FileDate2}', FormatFileTimeAlt(NTime));
    if Pos('{FileDateOp}', Result)>0 then
      SReplaceAllW(Result, '{FileDateOp}', FormatFileTimeFmt(NTime, opDateFmt));
  end
  else
  begin
    //SReplaceAllW(Result, '{FileSize}', '?');
    SReplaceAllW(Result, '{FileDate}', '?');
    SReplaceAllW(Result, '{FileDate2}', '?');
    SReplaceAllW(Result, '{FileDateOp}', '?');
  end;
end;

function TfmMain.SStatusHint(state: TSynSelState): Widestring;
begin
  Result:= opStatusText[state];

  SReplaceAllW(Result, '{LineNum}', cStatLine);
  SReplaceAllW(Result, '{ColNum}', cStatCol);
  SReplaceAllW(Result, '{SelLines}', cStatSelLines);
  SReplaceAllW(Result, '{SelCols}', cStatSelCols);
  SReplaceAllW(Result, '{SelChars}', cStatSelChars);
  SReplaceAllW(Result, '{TotalLines}', cStatTLines);
  SReplaceAllW(Result, '{TotalChars}', cStatTChars);

  SReplaceAllW(Result, '{FileDate}', cStatFDate);
  SReplaceAllW(Result, '{FileDate2}', cStatFDate);
  SReplaceAllW(Result, '{FileDateOp}', cStatFDate);

  SReplaceAllW(Result, '{Carets}', cStatCarets);
  SReplaceAllW(Result, '{CaretsTopLine}', cStatCaretsTopLn);
  SReplaceAllW(Result, '{CaretsBottomLine}', cStatCaretsBotLn);

  //del dup spaces
  SReplaceAllW(Result, '  ', ' ');
end;

procedure TfmMain.TBXItemClipCopyToEdClick(Sender: TObject);
begin
  DoClipItemIns;
end;

procedure TfmMain.TBXItemClipCopyToClipClick(Sender: TObject);
begin
  DoClipItemCopy;
end;

procedure TfmMain.ecReplaceSelFromClipAllExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  S: Widestring;
  NLine: Integer;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;
  if Ed.ReadOnly then Exit;
  if Ed.SelLength=0 then
    begin MsgBeep; Exit end;

  S:= TntClipboard.AsWideText;
  if S='' then
    begin MsgBeep; Exit end;

  //set finder
  Finder.FindText:= Ed.SelText;
  Finder.ReplaceText:= S;
  Finder.Flags:= Finder.Flags
    - [ftBackward, ftSelectedText, ftRegex, ftPromtOnReplace]
    + [ftEntireScope];

  //replace
  NLine:= Ed.TopLine;
  Finder.ReplaceAll;
  Ed.TopLine:= NLine;

  MsgFound;
end;

procedure TfmMain.MsgFound;
var
  n: Integer;
begin
  n:= Finder.Matches;
  if n>0 then
    DoHint(WideFormat(DKLangConstW('Found'), [n]));
end;

procedure TfmMain.UpdatePanelOutFromList(List: TWideStringList);
var
  i: integer;
begin
  ListOut.Items.BeginUpdate;
  try
    ListOut.Items.Clear;
    for i:= 0 to List.Count-1 do
      ListOut.Items.Add(List[i]);
    FixListScroll(ListOut);
  finally
    ListOut.Items.EndUpdate;
  end;
end;

procedure TfmMain.acRereadOutExecute(Sender: TObject);
var
  ft: Widestring;
  List: TWideStringList;
begin
  ft:= FGetTempFilenameIndexed(0);
  if not (IsFileExist(ft) and (FGetFileSize(ft)>0)) then
    begin MsgNoFile(ft); Exit end;

  List:= TWideStringList.Create;
  try
    List.LoadFromFile(ft);
    FixListOutput(List, false{NoTags}, false{NoDups},
      SynPanelPropsOut.Encoding,
      EditorTabExpansion(CurrentEditor));
    UpdatePanelOutFromList(List);
    UpdatePanelOut(tbOut);
    plOut.Show;
  finally
    FreeAndNil(List);
  end;
end;

procedure TfmMain.TBXItemLeftTreeClick(Sender: TObject);
begin
  UpdatePanelLeft(tbTree);
end;

procedure TfmMain.TBXItemLeftProjClick(Sender: TObject);
begin
  UpdatePanelLeft(tbProj);
end;

procedure TfmMain.ecToggleFocusProjectExecute(Sender: TObject);
begin
  if not plTree.Visible then
  begin
    ecShowTree.Execute;
    UpdatePanelLeft(tbProj);
    if Assigned(fmProj) then
      if fmProj.TreeProj.CanFocus then
        fmProj.TreeProj.SetFocus
  end
  else
  if Assigned(fmProj) and fmProj.TreeProj.Focused then
    FocusEditor
  else
  begin
    UpdatePanelLeft(tbProj);
    if Assigned(fmProj) then
      if fmProj.TreeProj.CanFocus then
        fmProj.TreeProj.SetFocus
  end;
end;

function TfmMain.DoAutoCloseTag: boolean;
var
  Err: string;
begin
  Result:= false;
  if opAutoCloseTags and IsLexerWithTags(CurrentLexer) then
  begin
    Result:= EditorAutoCloseTag(CurrentEditor, Err);
    if not Result then
      DoHint(Err);
  end;
end;

function TfmMain.DoAutoCloseBracket(ch: Widechar): boolean;
begin
  Result:= EditorAutoCloseBracket(CurrentEditor, ch,
    opAutoCloseBrackets,
    opAutoCloseQuotes,
    opAutoCloseBracketsNoEsc);
end;

function TfmMain.SynImagesDll: string;
begin
  Result:= SynDir + 'Tools\Images.dll';
end;

procedure TfmMain.ecInsertImageExecute(Sender: TObject);
const
  filter = 'Images|*.jpg;*.jpeg;*.png;*.gif;*.bmp|';
var
  fn: string;
begin
  if CurrentEditor.ReadOnly then Exit;
  //if not IsLexerWithImages(CurrentLexer) then
  //  begin MsgBeep; Exit end;

  fn:= '';
  if PromptForFileName(fn, filter, '', '', ExtractFileDir(CurrentFrame.FileName)) then
    DoInsertImageTag(fn);
end;

procedure TfmMain.DoInsertImageTag(const fn: string);
var
  fn_wdx, dir, s: string;
  IsCss: boolean;
  Ed: TSyntaxMemo;
  Frame: TEditorFrame;
begin
  Ed:= CurrentEditor;
  Frame:= CurrentFrame;
  if Ed.ReadOnly then Exit;

  fn_wdx:= SynImagesDll;
  if not IsFileExist(fn_wdx) then
    begin MsgNoFile(fn_wdx); Exit end;

  IsCss:= IsLexerCss(CurrentLexer);
  dir:= ExtractFileDir(Frame.FileName);
  s:= SGetImageTag(fn, fn_wdx, dir, IsCss, EditorEOL(Ed));
  if s='' then
    begin DoHint('Cannot insert tag: '+fn); MsgBeep; Exit end;

  with Ed do
  begin
    InsertText(s);
    CaretStrPos:= CaretStrPos - Length(s) +
      IfThen(IsCss, Pos('url(', s)+4, Pos('"', s));
  end;
end;

procedure TfmMain.ecToggleFocusMasterSlaveExecute(Sender: TObject);
begin
  with CurrentFrame do
  begin
    if not IsSplitted then
      SplitPos:= 50.0;
    if EditorMaster.Focused then
    begin
      if Self.Enabled and EditorSlave.CanFocus then
        EditorSlave.SetFocus;
    end
    else
    begin
      if Self.Enabled and EditorMaster.CanFocus then
        EditorMaster.SetFocus;
    end;
  end;
end;

procedure TfmMain.ecToggleSlaveExecute(Sender: TObject);
begin
  CurrentFrame.ToggleSplitted;
end;

procedure TfmMain.TBXItemSplitEdHorzClick(Sender: TObject);
begin
  with CurrentFrame do
    SplitHorz:= not SplitHorz;
end;

procedure TfmMain.TbxItemRunFindHtml4Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenHTML4Help);
end;

procedure TfmMain.TbxItemRunFindHtml5Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenHTML5Help);
end;

procedure TfmMain.ecRulerExecute(Sender: TObject);
begin
  if DoPyEvent(CurrentEditor, cSynEventOnState, [cSynPropRuler]) = cPyFalse then Exit;

  with CurrentEditor do
  begin
    HorzRuler.Visible:= not HorzRuler.Visible;
  end;
  UpdateStatusbar;
end;

procedure TfmMain.UpdateRecentsOnClose;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
      if FileName<>'' then
        if not NotInRecents then
          SynMruFiles.AddItem(FileName);
end;


procedure TfmMain.ecSplitSlaveVertHorzExecute(Sender: TObject);
begin
  with CurrentFrame do
    SplitHorz:= not SplitHorz;
end;

procedure TfmMain.ecGotoBkExecute(Sender: TObject);
var
  i, nPos: Integer;
  L: TList;
  ed: TSyntaxMemo;
begin
  ed:= CurrentEditor;
  L:= TList.Create;

  try
    //create bookmarks list
    Screen.Cursor:= crHourGlass;
    try
      EditorGetBookmarksAsSortedList(ed, L);
      if L.Count=0 then
        begin MsgBeep; Exit end;
    finally
      Screen.Cursor:= crDefault;
    end;

    with TfmGotoBkmk.Create(nil) do
    try
      FIniFN:= Self.SynHistoryIni;

      //fill form
      List.Font.Assign(ed.Font);
      List.Items.Clear;
      for i:= 0 to L.Count-1 do
        List.Items.Add(EditorGetBookmarkDesc(Ed, Integer(L[i]), 60, true, true));

      //select curr bookmk
      List.ItemIndex:= 0;
      nPos:= ed.CaretStrPos;
      for i:= L.Count-1 downto 0 do
        if ed.Bookmarks[Integer(L[i])] <= nPos then
          begin List.ItemIndex:= i; Break end;
      List.Selected[List.ItemIndex]:= true;

      if ShowModal=mrOk then
      begin
        i:= List.ItemIndex;
        if i>=0 then
        begin
          //Shift pressed?
          if GetKeyState(vk_shift)<0 then
            EditorSelectToPosition(ed, ed.Bookmarks[Integer(L[i])])
          else
            ed.GotoBookmark(Integer(L[i]));

          EditorCenterPos(ed, true{GotoMode}, opSrOffsetY);
        end;
      end;
    finally
      Free
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.ecGotoPortableBkExecute(Sender: TObject);
var
  CmtBegin, CmtEnd,
  CmtBegin1, CmtBegin2: string;
  StripBkmk: boolean;
  //
  function BkStr(const S: Widestring; NLine: Integer): Widestring;
  var
    n: Integer;
  begin
    Result:= S;
    SReplaceAllW(Result, #9, EditorTabExpansion(CurrentEditor));

    try
      if not StripBkmk then Exit;

      n:= Pos(CmtBegin, Result);
      if n=0 then Exit;
      Delete(Result, 1, n+Length(CmtBegin)+4);

      if CmtEnd<>'' then
      begin
        n:= Pos(CmtEnd, Result);
        if n=0 then Exit;
        Delete(Result, n, MaxInt);
      end;

      Result:= WideTrim(Result);
    finally
      Result:= IntToStr(NLine+1)+':  '+Result;
    end;
  end;
  //
  function IsBk(const s: Widestring): boolean;
  var
    n: Integer;
  begin
    if CmtBegin='' then
      begin Result:= false; Exit end;
    n:= Pos(CmtBegin1, s);
    if n=0 then
      n:= Pos(CmtBegin2, s);
    Result:= n>0;
    if Result and (CmtEnd<>'') then
      Result:= PosEx(CmtEnd, s, n)>0;
  end;
  //
var
  i, nPos: Integer;
  L: TList;
  L_Str: TTntStringList;
  ed: TSyntaxMemo;
  MLine: boolean;
  SLastLexer, SLexer: string;
begin
  ed:= CurrentEditor;
  L:= TList.Create;
  L_Str:= TTntStringList.Create;

  CmtBegin:= '';
  CmtEnd:= '';
  CmtBegin1:= '';
  CmtBegin2:= '';
  SLastLexer:= '?';
  StripBkmk:= Bool(SynHiddenOption('BkStrip', 0));

  try
    //create bookmarks list
    Screen.Cursor:= crHourGlass;
    try
      for i:= 0 to ed.Lines.Count-1 do
      begin
        SLexer:= CurrentLexerForLine(ed, i);
        if SLexer<>SLastLexer then
        begin
          SLastLexer:= SLexer;
          DoGetCommentProps(SLexer, true, CmtBegin, CmtEnd, MLine);
          CmtBegin1:= CmtBegin+'NOTE';
          CmtBegin2:= CmtBegin+'TODO';
        end;

        if IsBk(ed.Lines[i]) then
        begin
          L.Add(Pointer(i));
          L_Str.Add(BkStr(ed.Lines[i], i));
        end;
      end;
    finally
      Screen.Cursor:= crDefault;
    end;

    if L.Count=0 then
      begin DoHint(DKlangConstW('zMNoBookmk')); MsgBeep; Exit end;

    with TfmGotoBkmk.Create(nil) do
    try
      FIniFN:= Self.SynHistoryIni;

      //fill form
      List.Font.Assign(ed.Font);
      List.Items.Clear;
      List.Items.AddStrings(L_Str);

      //select curr bookmk
      List.ItemIndex:= 0;
      nPos:= ed.CurrentLine;
      for i:= L.Count-1 downto 0 do
        if Integer(L[i]) <= nPos then
          begin List.ItemIndex:= i; Break end;
      List.Selected[List.ItemIndex]:= true;

      if ShowModal=mrOk then
      begin
        i:= List.ItemIndex;
        if i>=0 then
        begin
          //Shift pressed?
          if GetKeyState(vk_shift)<0 then
            EditorSelectToPosition(ed, ed.CaretPosToStrPos(Point(0, Integer(L[i]))))
          else
            ed.CaretPos:= Point(0, Integer(L[i]));

          EditorCenterPos(ed, true{GotoMode}, opSrOffsetY);
        end;
      end;
    finally
      Free
    end;
  finally
    FreeAndNil(L_Str);
    FreeAndNil(L);
  end;
end;


procedure TfmMain.TBXItemBkGotoClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_GotoBookmarkDialog);
end;

procedure TfmMain.TBXItemHtmlLoremIpsumClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_LoremIpsumDialog);
end;

procedure TfmMain.ecLoremIpsumExecute(Sender: TObject);
var
  res: TModalResult;
  AMode: TLoremMode;
  ACnt: integer;
  ATags: boolean;
  fn: string;
  s: string;
  List: TStringList;
begin
  if CurrentEditor.ReadOnly then Exit;

  fn:= SynDir+'Tools\Lorem.txt';
  if not IsFileExist(fn) then
    begin MsgNoFile(fn); Exit end;

  with TfmLoremIpsum.Create(nil) do
  try
    cbTags.Checked:= IsLexerHTML(CurrentLexer);
    with TIniFile.Create(SynHistoryIni) do
    try
      case ReadInteger('Win', 'LoremTyp', 0) of
        0: cbSent.Checked:= true;
        1: cbPara.Checked:= true;
      end;
      edCount.Value:= ReadInteger('Win', 'LoremCnt', 5);
    finally
      Free
    end;
    res:= ShowModal; //mrOk: Insert, mrYes: Copy
    if res=mrCancel then Exit;

    if cbSent.Checked then AMode:= swSent else
     if cbPara.Checked then AMode:= swPara else
      AMode:= swSent;
    ACnt:= edCount.Value;
    ATags:= cbTags.Checked;

    with TIniFile.Create(SynHistoryIni) do
    try
      WriteInteger('Win', 'LoremTyp', Ord(AMode));
      WriteInteger('Win', 'LoremCnt', ACnt);
    finally
      Free
    end;
  finally
    Free;
  end;

  List:= TStringList.Create;
  try
    List.LoadFromFile(fn);
    s:= SLoremIpsum(List, AMode, ACnt, ATags, EditorEOL(CurrentEditor));
  finally
    FreeAndNil(List);
  end;

  if res=mrOk then
    CurrentEditor.InsertText(s)
  else
    Clipboard.AsText:= s;
end;

procedure TfmMain.TBXItemFavAddFileClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_Fav_AddFile);
end;

procedure TfmMain.TBXItemFavManageClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_Fav_Organize);
end;

procedure TfmMain.DoAddFav(const fn: Widestring);
var
  fn_ini: string;
  L: TTntStringList;
begin
  if fn='' then
    begin MsgBeep; Exit end;
  fn_ini:= SynFavIni;

  L:= TTntStringList.Create;
  try
    if FileExists(fn_ini) then
      L.LoadFromFile(fn_ini);
    if L.IndexOf(fn)<0 then
    begin
      L.Add(fn);
      L.SaveToFile(fn_ini);
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.acFavManageExecute(Sender: TObject);
begin
  DoFavoritesDialog;
end;

procedure TfmMain.DoFavoritesDialog(ATab: Integer = -1);
begin
  with TfmFav.Create(nil) do
  try
    FIniFN:= SynFavIni;
    FOptFN:= SynHistoryIni;
    FFavTab:= ATab;
    if ShowModal=mrOk then
    begin
      if FCurrentFileName<>'' then
        if IsFileExist(FCurrentFileName) then
        begin
          if IsFileProject(FCurrentFileName) then
            DoOpenProject(FCurrentFileName)
          else
            DoOpenFile(FCurrentFileName);
        end
        else
        if not DoOpenPluginFavorite(FCurrentFileName) then
          MsgNoFile(FCurrentFileName);
    end;
  finally
    Free
  end;
end;

procedure TfmMain.ApplyFrames;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      //apply link color
      HyperlinkHighlighter.Style.Font.Color:= opColorLink;
      //apply micro-map props
      ShowMap:= opMicroMap;
      MapColor:= opColorMap;
      //apply tab caption options
      DoTitleChanged;
    end;
end;

procedure TfmMain.ApplyFramesGutters;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    UpdateGutter(FramesAll[i]);
end;

procedure TfmMain.TBXItemCtxAddColorClick(Sender: TObject);
begin
  DoAddRecentColor(FPopupColor);
end;

function TfmMain.GetRecentColors: string;
var
  i: Integer;
begin
  Result:= '';
  with TbxSubmenuItemRecentColors do
    for i:= Count-1 downto cColorIdxMin do
      Result:= Result+ SColorToHtmlCode(Items[i].Tag)+',';
end;

procedure TfmMain.SetRecentColors(const Str: string);
var
  S, SItem: Widestring;
  Code: Integer;
begin
  DoClearRecentColors;
  S:= Str;
  repeat
    SItem:= SGetItem(S); //#AABBCC
    Delete(SItem, 1, 1); //delete #
    if SItem='' then Break;
    //Msg(SItem);
    try
      Code:= SHtmlCodeToColor(SItem);
      DoAddRecentColor(Code);
    except
      Continue
    end;
  until false;
end;

procedure TfmMain.DoInitRecentColorsMenu;
var
  Item: TSpTbxItem;
  ItemSep: TSpTbxSeparatorItem;
begin
  //add menu items and separator
  with TbxSubmenuItemRecentColors do
    if Count=0 then
    begin
      Item:= TSpTbxItem.Create(Self);
      Item.Caption:= 'Select color...';
      Item.Tag:= -1;
      Item.Action:= ecInsertColor;
      Add(Item);
      FMenuItem_Colors_Select:= Item;

      Item:= TSpTbxItem.Create(Self);
      Item.Caption:= 'Clear list';
      Item.Tag:= -1;
      Item.OnClick:= RecentColorClick;
      Add(Item);
      FMenuItem_Colors_Clear:= Item;

      Item:= TSpTbxItem.Create(Self);
      Item.Caption:= 'Open...';
      Item.Tag:= -1;
      Item.OnClick:= RecentColorOpen;
      Add(Item);
      FMenuItem_Colors_Open:= Item;

      Item:= TSpTbxItem.Create(Self);
      Item.Caption:= 'Save as...';
      Item.Tag:= -1;
      Item.OnClick:= RecentColorSave;
      Add(Item);
      FMenuItem_Colors_Save:= Item;

      ItemSep:= TSpTbxSeparatorItem.Create(Self);
      Add(ItemSep);
    end;
end;

procedure TfmMain.TbxSubmenuItemRecentColorsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  en: boolean;
begin
  DoInitRecentColorsMenu;
  if TbxSubmenuItemRecentColors.Count>0 then
    if FMenuItem_Colors_Clear<>nil then
    begin
      FMenuItem_Colors_Clear.Caption:= SStripFromTab(TBXItemFClearRecents.Caption);
      FMenuItem_Colors_Save.Caption:= SStripFromTab(TBXItemFSaveAs.Caption);
      FMenuItem_Colors_Open.Caption:= SStripFromTab(TBXItemFOpen.Caption);
      FMenuItem_Colors_Select.Caption:= SStripFromTab(TBXItemHtmlInsColor.Caption);

      en:= ImageListColorRecent.Count>1;
      FMenuItem_Colors_Select.Enabled:= not CurrentEditor.ReadOnly;
      FMenuItem_Colors_Save.Enabled:= en;
      FMenuItem_Colors_Clear.Enabled:= en;
    end;
end;

function TfmMain.IsMouseOverProject: boolean;
begin
  if Assigned(fmProj) and fmProj.Visible and plTree.Visible then
    Result:= IsMouseOverControl(fmProj)
  else
    Result:= false;
end;

procedure TfmMain.DoDropFile(const fn: Widestring; IntoProj: boolean = false);
var
  i: Integer;
begin
  //drop item to Project tree
  if IntoProj then
    fmProj.DoDropItem(fn)
  else
  //insert image tag
  if SFileExtensionMatch(fn, 'jpg,jpeg,gif,png,bmp') then
    DoInsertImageTag(fn)
  else
  //open file in editor
  if IsDirExist(fn) then
    DoOpenFolder(fn)
  else
  if not IsFileExist(fn) then
  begin
    MsgBeep;
    Exit
  end
  else
  if not IsFileText(fn) and not MsgConfirmBinary(fn, Handle) then
    Exit
  else
  begin
    for i:= Low(Groups.Pages) to High(Groups.Pages) do
      if IsMouseOverControl(Groups.Pages[i]) then
      begin
        //issue: if pages1 is empty (one empty tab), pages2 empty, then
        //dropped on pages1 all times (even with mouse on pages2). maybe leave it.
        //
        Groups.PagesCurrent:= Groups.Pages[i];
        DoOpenFile(fn);
        Break
      end;
  end;
end;

procedure TfmMain.ProjAddEditorFile(Sender: TObject;
  Files: TTntStrings);
begin
  with CurrentFrame do
    if FileName<>'' then
      Files.Add(FileName);
end;

procedure TfmMain.ProjAddEditorFiles(Sender: TObject;
  Files: TTntStrings);
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
      if FileName<>'' then
        Files.Add(FileName);
end;

procedure TfmMain.ProjFileOpen(Sender: TObject; Files: TTntStrings);
var
  i: Integer;
  fn: Widestring;
  Bads: TTntStringList;
const
  cCnt = 10; //ask additional confirmation when many files opened
begin
  if (Files.Count>cCnt) then
    if not MsgConfirmManyOpen(Files.Count, Handle) then Exit;

  Bads:= TTntStringList.Create;
  try
    for i:= 0 to Files.Count-1 do
    begin
      fn:= Files[i];
      if IsFileExist(fn) then
      begin
        if IsFileText(fn) or MsgConfirmBinary(fn, Handle) then
          DoOpenFile(fn);
      end
      else
        Bads.Add(fn);
    end;

    if Bads.Count>0 then
    begin
      if Bads.Count>cCnt then
      begin
        while Bads.Count>cCnt do
          Bads.Delete(Bads.Count-1);
        Bads.Add('...');
      end;
      MsgNoFile(Bads.Text);
    end;
  finally
    FreeAndNil(Bads);
  end;
end;

procedure TfmMain.ProjGetLexers(Sender: TObject; Files: TTntStrings);
begin
  Files.Add(' '+DKLangConstW('None')); //needed for proj too
  DoEnumLexers(Files);
end;

procedure TfmMain.ProjGetLexer(Sender: TObject; Files: TTntStrings);
begin
  Files.Add(CurrentLexerForFile);
end;

procedure TfmMain.TBXItemFavAddProjClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_Fav_AddProject);
end;

procedure TfmMain.acFavAddFileExecute(Sender: TObject);
begin
  DoAddFav(CurrentFrame.FileName);
end;

procedure TfmMain.acFavAddProjExecute(Sender: TObject);
begin
  DoAddFav(CurrentProjectFN);
end;

function TfmMain.CurrentProjectFN: Widestring;
begin
  Result:= '';
  if Assigned(fmProj) then
    Result:= fmProj.ProjectFN;
end;

procedure TfmMain.DoOpenProject(const fn: Widestring);
begin
  if IsFileExist(fn) then
  begin
    ecToggleFocusProject.Execute;
    if Assigned(fmProj) then
      fmProj.ProjectFN:= fn;
  end
  else
    MsgBeep;
end;

procedure TfmMain.TBXSubmenuItemFavPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  TBXItemFavAddFile.Enabled:= CurrentFrame.FileName<>'';
  TBXItemFavAddProj.Enabled:= CurrentProjectFN<>'';
end;

procedure TfmMain.ProjGetWorkDir(Sender: TObject; Files: TTntStrings);
begin
  Files.Add(LastDir);
end;

procedure TfmMain.TBXItemTabAddToProjClick(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= FClickedFrame;
  if (F<>nil) and (F.FileName<>'') then
    if Assigned(fmProj) then
      fmProj.DoDropItem(F.FileName);
end;

function TfmMain.CurrentProjectMainFN: Widestring;
begin
  Result:= '';
  if Assigned(fmProj) then
    Result:= fmProj.FOpts.MainFN;
end;

function TfmMain.CurrentProjectDir: Widestring;
begin
  Result:= '';
  if Assigned(fmProj) then
    Result:= WideExtractFileDir(fmProj.ProjectFN);
end;

function TfmMain.CurrentProjectWorkDir: Widestring;
begin
  Result:= '';
  if Assigned(fmProj) then
    Result:= fmProj.FOpts.WorkDir;
end;

procedure TfmMain.TreeContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Node: TTreeNode;
begin
  Node:= Tree.GetNodeAt(MousePos.X, MousePos.Y);
  if Node<>nil then
    Tree.Selected:= Node;
end;

procedure TfmMain.ApplyProj;
//needed to apply color/font and "Untitled" str to project pane
begin
  if Assigned(fmProj) then
  begin
    ApplyFonts;
    fmProj.UpdateTitle;
  end;
end;

procedure TfmMain.TBXItemRightClipsClick(Sender: TObject);
begin
  UpdatePanelRight(tbTextClips);
end;

procedure TfmMain.ClipsClick(Sender: TObject; const S: Widestring);
begin
  with CurrentEditor do
    if not ReadOnly then
    begin
      InsertText(S);
      FocusEditor;
    end;
end;

procedure TfmMain.ecToggleFocusClipsExecute(Sender: TObject);
begin
  if not plClip.Visible then
  begin
    ecShowClip.Execute;
    UpdatePanelRight(tbTextClips);
    if Assigned(fmClips) then
      if fmClips.List.CanFocus then
        fmClips.List.SetFocus;
  end
  else
  if Assigned(fmClips) and fmClips.List.Focused then
    FocusEditor
  else
  begin
    UpdatePanelRight(tbTextClips);
    if Assigned(fmClips) then
      if fmClips.List.CanFocus then
        fmClips.List.SetFocus
  end;
end;

procedure TfmMain.TBXItemClipsAddTextClick(Sender: TObject);
const
  cName = 'snippet';
var
  fn: string;
  L: TTntStringList;
  S: Widestring;
begin
  S:= SReplaceAllEols(CurrentEditor.SelText, '\n');

  if Pos('=', S)>0 then
    Insert(cName+'=', S, 1);

  if not MsgInput('zClipEnter', S) then Exit;
  if WideTrim(S)='' then Exit;

  if Assigned(fmClips) then
  begin
    fn:= fmClips.GetCurrentFN;
    L:= TTntStringList.Create;
    try
      L.LoadFromFile(fn);
      L.Add(S);
      L.SaveToFile(fn);
    finally
      FreeAndNil(L);
    end;

    fmClips.ComboChange(nil);
    fmClips.List.ItemIndex:= fmClips.List.Count-1;
    fmClips.List.SetFocus;
  end;
end;

procedure TfmMain.TBXItemClipsEditClick(Sender: TObject);
begin
  if Assigned(fmClips) then
    DoOpenFile(fmClips.GetCurrentFN);
end;

procedure TfmMain.TBXItemClipsAddFileClick(Sender: TObject);
var
  s: Widestring;
  fn: string;
begin
  S:= '';
  if not MsgInput('zClipFile', S) then
    Exit;
  if WideTrim(S)='' then
    begin MsgBeep; Exit end;
  if not IsStringRegex(S, '[\w\s\.\-\+]+') then
    begin MsgBeep; Exit end;

  fn:= fmClips.GetClipsFN(S);
  if IsFileExist(fn) then
    begin MsgBeep; Exit end;

  with TTntStringList.Create do
  try
    SaveToFile(fn);
  finally
    Free
  end;

  with fmClips do
  begin
    InitClips(SynClipsDir);
    Combo.ItemIndex:= Combo.Items.IndexOf(S);
    ComboChange(nil);
  end;
end;

procedure TfmMain.TBXItemClipsDirClick(Sender: TObject);
begin
  FOpenURL(SynClipsDir, Handle);
end;

procedure TfmMain.RecentColorOpen(Sender: TObject);
begin
  with OD_Swatch do
  begin
    InitialDir:= LastDir;
    FileName:= '';
    if Execute then
      RecentColorsStr:= DoLoadStringFromIni(FileName);
  end;
end;

function TfmMain.DoLoadStringFromIni(const fn: string): string;
begin
  with TIniFile.Create(fn) do
  try
    Result:= ReadString('ini', 'str', '');
  finally
    Free
  end;
end;

procedure TfmMain.DoSaveStringToIni(const fn: string; const Str: string);
begin
  with TIniFile.Create(fn) do
  try
    WriteString('ini', 'str', Str);
  finally
    Free
  end;
end;


procedure TfmMain.RecentColorSave(Sender: TObject);
begin
  with SD_Swatch do
  begin
    InitialDir:= LastDir;
    FileName:= '';
    if Execute then
      DoSaveStringToIni(FileName, RecentColorsStr);
  end;
end;

procedure TfmMain.ProjGetProjDir(Sender: TObject; Files: TTntStrings);
begin
  Files.Add(opLastDirProject);
end;

procedure TfmMain.ProjSetProjDir(Sender: TObject; Files: TTntStrings);
begin
  if Files.Count>0 then
    opLastDirProject:= Files[0];

  with TIniFile.Create(SynIni) do
  try
    WriteString('Hist', 'DirProj', UTF8Encode(opLastDirProject));
  finally
    Free
  end;
end;

procedure TfmMain.DoClipsItemCopy;
var
  s: Widestring;
begin
  s:= fmClips.GetCurrentClip;
  if s<>'' then
    TntClipboard.AsWideText:= s;
end;

procedure TfmMain.ApplyInst;
begin
  TbxItemFNewWin.Enabled:= SynExe and not opSingleInstance;
end;

procedure TfmMain.ApplyDefaultFonts;
const
  cc = 'Consolas';
begin
  if Screen.Fonts.IndexOf(cc)>=0 then
  begin
    TemplateEditor.Font.Name:= cc;
    TemplateEditor.LineNumbers.Font.Name:= cc;
    TemplateEditor.HorzRuler.Font.Name:= cc;
    MemoConsole.Font.Name:= cc;
    edConsole.Font.Name:= cc;
  end;
end;

function MsgInput(const dkmsg: string; var S: Widestring): boolean;
begin
  Result:= DoInputString(DKLangConstW(dkmsg), S);
end;

procedure TfmMain.TBXTabColorChange(Sender: TObject);
begin
  DoSetTabColorValue(TbxTabColor.Color);
end;

procedure TfmMain.DoSetFrameTabColor(F: TEditorFrame; NColor: Longint);
var
  Index: Integer;
  D: TATTabData;
begin
  if F<>nil then
  begin
    F.TabColor:= NColor;

    Index:= FrameIndex(F);
    if Index<0 then Exit;
    D:= Groups.GetTabDataOfTotalIndex(Index);
    if D=nil then Exit;
    D.TabColor:= NColor;
    Groups.Invalidate;
  end;
end;

procedure TfmMain.DoSetTabColorValue(NColor: Longint);
begin
  DoSetFrameTabColor(FClickedFrame, NColor);
end;

procedure TfmMain.DoSetTabColorIndex_Current(NIndex: Integer);
begin
  FClickedFrame:= CurrentFrame;
  DoSetTabColorIndex(NIndex);
end;

procedure TfmMain.DoSetTabColorIndex(NIndex: Integer);
var
  NColor: TColor;
begin
  case NIndex of
    0:
      NColor:= clNone;
    -1:
      begin
        with ColorDialogTabs do
        begin
          if Execute then
            NColor:= Color
          else
            Exit;
        end;
      end;
    1..10:
      NColor:= opTabColors[NIndex-1];
    else
      raise Exception.Create('Unknown tab color index');
  end;

  DoSetFrameTabColor(FClickedFrame, NColor);
end;

procedure TfmMain.TBXSubmenuTabColorPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  F: TEditorFrame;
begin
  F:= FClickedFrame;
  if F<>nil then
  begin
    TbxTabColor.Color:= F.TabColor;
    TbxItemTabColorDef.Checked:= F.TabColor=clNone;
  end;
end;

procedure TfmMain.TBXItemTabColorMiscClick(Sender: TObject);
begin
  with ColorDialogTabs do
    if Execute then
      DoSetTabColorValue(Color);
end;

procedure TfmMain.TBXItemTabColorDefClick(Sender: TObject);
begin
  DoSetTabColorValue(clNone);
end;

function TfmMain.GetTabColors: Widestring;
var
  i: Integer;
begin
  Result:= '';
  for i:= 0 to High(opTabColors) do
    Result:= Result+ SColorToHtmlCode(opTabColors[i])+',';
end;

procedure TfmMain.SetTabColors(S: Widestring);
var
  SItem: Widestring;
  i: Integer;
begin
  if S='' then Exit;
  for i:= 0 to High(opTabColors) do
  begin
    SItem:= SGetItem(S);
    Delete(SItem, 1, 1);
    if SItem='' then Break;
    opTabColors[i]:= SHtmlCodeToColor(SItem);
  end;
end;

procedure TfmMain.ClipsInsPress;
begin
  TBXItemClipsAddText.Click;
end;

procedure TfmMain.TBXItemClipsDelTextClick(Sender: TObject);
begin
  if Assigned(fmClips) then
    fmClips.DoDeleteClip;
end;


function TfmMain.CurrentSessionFN: string;
begin
  Result:= FSessionFN;
end;

function TfmMain.CurrentContentFN(Unicode: boolean): Widestring;
var
  S, Ext: Widestring;
begin
  Ext:= WideExtractFileExt(CurrentFrame.FileName);
  if Ext='' then
    Ext:= '.txt';

  Result:= FTempDir + '\SynwText' + Ext;
  FDelete(Result);

  with CurrentEditor do
    S:= Lines.FText;

  if Unicode then
    with TTntStringList.Create do
    try
      Text:= S;
      SaveToFile(Result);
    finally
      Free
    end
  else
    with TStringList.Create do
    try
      Text:= S;
      SaveToFile(Result);
    finally
      Free
    end;
end;


function TfmMain.CurrentSelectionFN(Unicode: boolean): Widestring;
var
  S: Widestring;
begin
  Result:= FTempDir + '\SynwSel.txt';
  FDelete(Result);

  with CurrentEditor do
    if HaveSelection then
      S:= SelText
    else
      S:= Lines.FText;

  if Unicode then
    with TTntStringList.Create do
    try
      Text:= S;
      SaveToFile(Result);
    finally
      Free
    end
  else
    with TStringList.Create do
    try
      Text:= S;
      SaveToFile(Result);
    finally
      Free
    end;
end;

procedure TfmMain.ecSmartHlExecute(Sender: TObject);
begin
  opHiliteSmart:= not opHiliteSmart;
  UpdateStatusBar;
end;

procedure TfmMain.TBXItemBkDropPortableClick(Sender: TObject);
begin
  ecDropPortableBk.Execute;
end;

procedure TfmMain.ecDropPortableBkExecute(Sender: TObject);
var
  S, SPadding: Widestring;
  s1, s2: string;
  MLine: boolean;
begin
  if CurrentEditor.ReadOnly then Exit;

  DoGetCommentProps(CurrentLexer, true, s1, s2, MLine);
  if s1='' then Exit;

  if not MsgInput('zMBkName', S) then Exit;

  with CurrentEditor do
  begin
    SPadding:= ''; //StringOfChar(' ', 2);
    InsertText(SPadding+s1+'NOTE: '+s+' '+s2);
  end;
end;


procedure TfmMain.acRenameExecute(Sender: TObject);
var
  F: TEditorFrame;
  fn, fn_new, sName: Widestring;
  NColor: TColor;
begin
  F:= CurrentFrame;
  fn:= F.FileName;
  if fn='' then
    begin MsgBeep; Exit end;
  NColor:= F.TabColor;

  if F.IsFtp then
    if not MsgConfirmFtp then
      Exit
    else
      F.FreeFtpInfo;

  repeat
    sName:= WideExtractFileName(fn);
    if not DoInputFilename(DKLangConstW('zMRename'), sName) then Exit;

    fn_new:= WideExtractFilePath(fn) + sName;

    //allow to rename to non-existent name
    if not IsFileExist(fn_new) then
      Break
    else
    //allow to only change filename case
    if WideUpperCase(fn_new) = WideUpperCase(fn) then
      Break
    else
    //don't allow to overwrite existing file
      MsgBeep;
  until false;

  acClose.Execute;
  if not MoveFileW(PWChar(fn), PWChar(fn_new)) then
  begin
    MsgRenameError(fn, fn_new, Handle);
    DoOpenFile(fn);
  end
  else
  begin
    //rename successful
    SynMruFiles.DeleteItem(fn);
    DoOpenFile(fn_new);
    DoRefreshPluginsFiles(fn_new);
    DoProjectRenameFile(fn, fn_new);
  end;

  CurrentFrame.TabColor:= NColor;
end;

procedure TfmMain.ApplySpell;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    UpdateFrameSpell(FramesAll[i]);
end;


function TfmMain.OppositeFrame: TEditorFrame;
begin
  case Groups.PagesIndexOf(Groups.PagesCurrent) of
    1: Result:= GetCurrentFrameInPages(Groups.Pages2);
    2: Result:= GetCurrentFrameInPages(Groups.Pages1);
    else Result:= nil;
  end;
end;

function TfmMain.CurrentFileName(Id: TSynGroupId): Widestring;
var
  F: TEditorFrame;
begin
  Result:= '';
  case Id of
    cSynGroupCurrent: F:= CurrentFrame;
    cSynGroupOpposite: F:= OppositeFrame;
    cSynGroup1: F:= GetCurrentFrameInPages(Groups.Pages1);
    cSynGroup2: F:= GetCurrentFrameInPages(Groups.Pages2);
    cSynGroup3: F:= GetCurrentFrameInPages(Groups.Pages3);
    cSynGroup4: F:= GetCurrentFrameInPages(Groups.Pages4);
    cSynGroup5: F:= GetCurrentFrameInPages(Groups.Pages5);
    cSynGroup6: F:= GetCurrentFrameInPages(Groups.Pages6);
    else F:= nil;
  end;
  if F<>nil then
    Result:= F.FileName;
end;

procedure TfmMain.TBXItemRunNumConvClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_NumericConverterDialog);
end;

procedure TfmMain.ecNumericConverterExecute(Sender: TObject);
begin
  if not Assigned(fmNumConv) then
  begin
    fmNumConv:= TfmNumConv.Create(Self);
    fmNumConv.FormStyle:= fsStayOnTop;
    fmNumConv.OnInsert:= NumConvInsert;

    with TIniFile.Create(SynHistoryIni) do
    try
      fmNumConv.Left:= ReadInteger('Win', 'NConvX', 400);
      fmNumConv.Top:= ReadInteger('Win', 'NConvY', 300);
    finally
      Free
    end;
  end;
  fmNumConv.Show;
end;

procedure TfmMain.NumConvInsert(Sender: TObject; const S: string; Typ: TSynNumType);
var
  SCode: string;
begin
  SCode:= S;
  if Typ=numHex then
    SCode:= EditorFormatHexCode(CurrentEditor, S);
  CurrentEditor.InsertText(SCode);
end;

procedure TfmMain.TBXItemEUnindentClick(Sender: TObject);
begin
  if Assigned(fmNumConv) and (fmNumConv.ActiveControl.Focused) then
  begin
    fmNumConv.SelNext;
  end
  else
    CurrentEditor.ExecCommand(smBlockUnindent);
end;

procedure TfmMain.ecIndentLike1stExecute(Sender: TObject);
var
  ed: TSyntaxMemo;
  i, Ln1, Ln2: Integer;
  s, Ind_Old, Ind_New: ecString;
begin
  ed:= CurrentEditor;
  with ed do
    if ReadOnly or (Lines.Count=0) then Exit;
  if ed.SelLength=0 then
    begin MsgNoSelection; Exit end;

  EditorGetSelLines(ed, Ln1, Ln2);
  if Ln2=Ln1 then
    begin MsgWarn(DKLangConstW('zMSelMulLine'), Handle); Exit end;

  with ed do
  begin
    Ind_Old:= SIndentOf(Lines[Ln1]);

    BeginUpdate;
    DoProgressShow;

    try
      for i:= Ln1+1 to Ln2 do
      begin
        if IsProgressStopped(i-Ln1+1, Ln2-Ln1+1) then
          Break;

        s:= Lines[i];
        Ind_New:= SIndentOf(s);
        if Ind_New<>Ind_Old then
        begin
          s:= Ind_Old + Copy(s, Length(Ind_New)+1, MaxInt);
          DoReplaceLine(ed, i, s, true{ForceUndo});
        end;
      end;
    finally
      DoProgressHide;
      EndUpdate;
    end;
  end;

  FocusEditor;
end;

procedure TfmMain.acColumnMarkersExecute(Sender: TObject);
  //
  procedure UpdEditor(Ed: TSyntaxMemo);
  begin
    with ATSyntMemo.TSyntaxMemo(Ed) do
      DoUpdateMargins;
  end;
  //
var
  S: Widestring;
begin
  S:= CurrentFrame.EditorMaster.ColMarkersString;

  with TIniFile.Create(SynHistoryIni) do
  try
    if S='' then
      S:= ReadString('Win', 'ColMark', '');
    if not MsgInput('zMColMark', S) then Exit;
    if S<>'' then
      WriteString('Win', 'ColMark', S);
  finally
    Free
  end;

  CurrentFrame.EditorMaster.ColMarkersString:= S;
  CurrentFrame.EditorSlave.ColMarkersString:= S;
  UpdEditor(CurrentFrame.EditorMaster);
  UpdEditor(CurrentFrame.EditorSlave);
end;

procedure TfmMain.TBXItemEToggleLineCommentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ToggleLineComment);
end;

procedure TfmMain.TBXItemEToggleStreamCommentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ToggleStreamComment);
end;

procedure TfmMain.DoLoadPluginsList;
var
  fn_plug_ini,
  fn_plug_def_ini: string;
begin
  fn_plug_ini:= SynPluginsIni;
  fn_plug_def_ini:= SynPluginsSampleIni;
  if not IsFileExist(fn_plug_ini) then
    CopyFileA(PAnsiChar(fn_plug_def_ini), PAnsiChar(fn_plug_ini), true);
  if not IsFileExist(fn_plug_ini) then
    Exit;

  DoLoadPlugins_Panels(fn_plug_ini);
  DoLoadPlugins_Findid(fn_plug_ini);
  DoLoadPlugins_Complete(fn_plug_ini);
  DoLoadPlugins_Commands(fn_plug_ini);
  DoLoadPlugins_Events(fn_plug_ini);

  //debug
  //DoTestPlugins;
end;

procedure TfmMain.LoadPluginsInfo;
var
  i: Integer;
  Item: TSpTbxTabItem;
begin
  //disable plugins in WLX
  if not SynExe then Exit;

  DoLoadPluginsList;
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if SCaption<>'' then
      begin
        Item:= TSpTbxTabItem.Create(Self);
        Item.Caption:= SCaption;
        Item.Tag:= i;
        Item.OnClick:= PluginPanelItemClick;
        FToolButton:= Item;
        tbTabsLeft.Items.Add(Item);
      end;
end;

procedure TfmMain.PluginPanelItemClick(Sender: TObject);
var
  N, i: Integer;
begin
  if (Sender=nil) then Exit;
  N:= (Sender as TComponent).Tag;
  if FPluginsPanel[N].SCaption='' then Exit;

  plTree.Caption:= FPluginsPanel[N].SCaption;
  FTabLeft:= TSynTabLeft(N+cFixedLeftTabs);

  Tree.Visible:= false;
  Tree.SyntaxMemo:= nil;
  if Assigned(fmProj) then
    fmProj.Visible:= false;

  //check buttons
  UpdateCheckLeftTabs(false, false, false);
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if FToolButton<>nil then
        FToolButton.Checked:= i=N;

  DoLoadPlugin_Panel(N);
  DoShowPlugin(N);
end;

procedure TfmMain.DoLoadPlugin_Panel(Index: Integer);
var
  AParent: THandle;
  AIni: Widestring;
begin
  with FPluginsPanel[Index] do
  begin
    //already loaded?
    if FWindow<>0 then Exit;

    if not IsFileExist(SFileName) then
    begin
      MsgNoFile(SFileName);
      Exit;
    end;

    FDll:= LoadLibrary(PChar(string(SFileName)));
    if FDll=0 then
    begin
      MsgError('Can''t load dll:'#13+SFileName, Handle);
      Exit
    end;

    FSynInit:= GetProcAddress(FDll, 'SynInit');
    if @FSynInit=nil then
    begin
      MsgError('Can''t find SynInit'#13+SFileName, Handle);
      Exit
    end;

    FSynOpenForm:= GetProcAddress(FDll, 'SynOpenForm');
    if @FSynOpenForm=nil then
    begin
      MsgError('Can''t find SynOpenForm'#13+SFileName, Handle);
      Exit
    end;

    FSynCloseForm:= GetProcAddress(FDll, 'SynCloseForm');
    if @FSynCloseForm=nil then
    begin
      MsgError('Can''t find SynCloseForm'#13+SFileName, Handle);
      Exit
    end;

    FSynAction:= GetProcAddress(FDll, 'SynAction');
    if @FSynAction=nil then
    begin
      MsgError('Can''t find SynAction'#13+SFileName, Handle);
      Exit
    end;

    AIni:= SynPluginIni(SCaption);
    FSynInit(PWChar(AIni), @_SynActionProc);
    //MsgInfo(AIni);

    AParent:= plTree.Handle;
    FForm:= FSynOpenForm(AParent, FWindow);
    Windows.SetParent(FWindow, AParent);
  end;

  DoResizePlugins;
end;

procedure TfmMain.DoResizePlugins;
var
  X, Y, XSize, YSize, i: Integer;
begin
  X:= 0;
  Y:= IfThen(opShowPanelTitles, plTree.CaptionPanelSize.Y, 0);
  XSize:= plTree.ClientWidth;
  YSize:= plTree.ClientHeight - Y - tbTabsLeft.Height;

  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if FWindow<>0 then
        SetWindowPos(FWindow, 0, X, Y, XSize, YSize, 0);
end;

procedure TfmMain.DoClosePlugins;
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FForm<>nil) and Assigned(FSynCloseForm) then
        FSynCloseForm(FForm);
end;

procedure TfmMain.DoShowPlugin(N: Integer);
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if FWindow<>0 then
        ShowWindow(FWindow, IfThen(i=N, sw_show, sw_hide));
end;

function TfmMain.DoOpenPluginFavorite(const AFileName: Widestring): boolean;
var
  N, i: Integer;
  AName: string;
  ADir: Widestring;
begin
  N:= Pos('::', AFileName);
  Result:= N>0;
  if not Result then Exit;

  AName:= Copy(AFileName, 1, N-1);
  ADir:= Copy(AFileName, N+2, MaxInt);

  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if SCaption=AName then
      begin
        if not plTree.Visible then
          ecShowTree.Execute;
        PluginPanelItemClick(FToolButton);
        with FPluginsPanel[i] do
          if (FForm<>nil) and Assigned(FSynAction) then
            FSynAction(FForm, cActionNavigateToFile, PWChar(ADir), nil, nil, nil);
        Break
      end;
end;

function TfmMain.PluginAction_OpenFile(const fn: Widestring): Integer;
var
  cfm: boolean;
begin
  if fn='' then
  begin
    Result:= cSynError;
    Exit;
  end;
  if (opTextOnly<>1) and (not IsFileText(fn)) then
    cfm:= MsgConfirmBinary(fn, Handle)
  else
    cfm:= true;
  if cfm then
  begin
    DoOpenFile(fn);
    Result:= cSynOK;
  end
  else
    Result:= cSynError;
end;

function TfmMain.PluginAction_OpenFtpFile(const fn: Widestring; AInfoPtr: Pointer; AInfoSize: Integer): Integer;
begin
  Result:= PluginAction_OpenFile(fn);
  if Result=cSynOK then
    CurrentFrame.SetFtpInfo(AInfoPtr, AInfoSize);
end;

function TfmMain.PluginAction_GetOpenedFN(id: Integer; ptr: PWideChar): Integer;
var
  F: TEditorFrame;
begin
  F:= Plugin_FrameById(id);
  if (F<>nil) then //return OK for unnamed tab
  begin
    Result:= cSynOK;
    if F.FileName='' then
      ptr^:= #0
    else
      lstrcpynW(ptr, PWChar(F.FileName), cSynMaxPath);
  end
  else
    Result:= cSynError;
end;

function TfmMain.PluginAction_GetProjectFN(id: Integer; ptr: PWideChar): Integer;
var
  fn: Widestring;
begin
  Result:= cSynError;
  if (fmProj=nil) then Exit;

  if (id=cSynIdCurrentFile) then
  begin
    fn:= fmProj.FOpts.MainFN;
    lstrcpynW(ptr, PWChar(fn), cSynMaxPath);
    Result:= cSynOK;
    Exit
  end;

  if (fmProj.TreeProj.Items.Count<=1) or
    (id<0) or (id>=fmProj.TreeProj.Items.Count) then
    Exit;

  fn:= fmProj.GetFN(fmProj.TreeProj.Items[id]);
  lstrcpynW(ptr, PWChar(fn), cSynMaxPath);
  Result:= cSynOK;
end;


function TfmMain.Plugin_FrameById(id: Integer): TEditorFrame;
begin
  if (id=cSynIdCurrentFile) then
    Result:= CurrentFrame
  else
  if (id=cSynIdOppositeFile) then
    Result:= OppositeFrame
  else
  if (id>=0) and (id<FrameAllCount) then
    Result:= FramesAll[id]
  else
    Result:= nil;
end;

function TfmMain.PluginAction_SaveFile(id: Integer; ACanPrompt: boolean): Integer;
var
  F: TEditorFrame;
begin
  F:= Plugin_FrameById(id);
  if (F<>nil) and ((F.FileName<>'') or ACanPrompt) then
  begin
    SaveFrame(F, False);
    Result:= cSynOK;
  end
  else
    Result:= cSynError;
end;

{
function TfmMain.PluginFilename(AHandle: Pointer): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
    begin
      if FForm=nil then Break;
      if FForm=AHandle then
        begin Result:= SFileName; Break end;
    end;
end;
}

function TfmMain.PluginAction_GetMsg(const ADllFN, AMsg: Widestring; AResult: PWideChar): Integer;
  //
  function GetFN(const fn_dll, Suffix: string): string;
  begin
    Result:= ChangeFileExt(fn_dll, '.'+Suffix+'.lng');
  end;
  //
var
  fn_lng, fn_en_lng: string;
  S: Widestring;
begin
  fn_lng:= GetFN(ADllFN, FHelpLangSuffix);
  fn_en_lng:= GetFN(ADllFN, 'En');

  S:= DoReadLangMsg(fn_lng, fn_en_lng, AMsg);

  lstrcpynW(AResult, PWChar(S), cSynMaxMsg);
  Result:= cSynOK;
end;

function TfmMain.PluginAction(AHandle: Pointer; AName: PWideChar; A1, A2, A3, A4: Pointer): Integer; stdcall;
var
  act: Widestring;
begin
  act:= AName;

  //---------------------
  if (act=cActionGetText) then
  begin
    Result:= PluginAction_GetText(Integer(A1), A2, PInteger(A3)^);
    Exit;
  end;

  //---------------------
  if (act=cActionSetText) then
  begin
    Result:= PluginAction_SetText(Integer(A1), A2, Integer(A3));
    Exit;
  end;

  //---------------------
  if (act=cActionGetMsg) then
  begin
    Result:= PluginAction_GetMsg(PWChar(A1), PWChar(A2), PWChar(A3));
    Exit;
  end;

  //---------------------
  if (act=cActionGetCaretPos) then
  begin
    Result:= PluginAction_GetCaretPos(A1, A2, A3);
    Exit;
  end;

  //---------------------
  if (act=cActionSetCaretPos) then
  begin
    Result:= PluginAction_SetCaretPos(Integer(A1), Integer(A2));
    Exit;
  end;

  //---------------------
  if (act=cActionTranslatePos) then
  begin
    Result:= PluginAction_TranslatePos(PInteger(A1)^, PInteger(A2)^, PInteger(A3)^, Bool(A4));
    Exit;
  end;

  //---------------------
  if (act=cActionGetSelection) then
  begin
    Result:= PluginAction_GetSel(PSynSelection(A1)^);
    Exit;
  end;

  //---------------------
  if (act=cActionSetSelection) then
  begin
    Result:= PluginAction_SetSel(PSynSelection(A1)^);
    Exit;
  end;

  //---------------------
  if (act=cActionSetTopLine) then
  begin
    Result:= PluginAction_SetTopLine(Integer(A1));
    Exit;
  end;

  //---------------------
  if (act=cActionReplaceText) then
  begin
    Result:= PluginAction_ReplaceText(Integer(A1), A2, Integer(A3));
    Exit;
  end;

  //---------------------
  if (act=cActionSuggestCompletion) then
  begin
    Result:= PluginAction_SuggestCompletion(PWChar(A1), Integer(A2), Bool(A3));
    Exit;
  end;

  //---------------------
  if (act=cActionParseRegex) then
  begin
    Result:= PluginAction_ParseRegex(PWChar(A1), PWChar(A2), PSynRegexArray(A3)^);
    Exit;
  end;

  //---------------------
  if (act=cActionOpenFile) then
  begin
    Result:= PluginAction_OpenFile(PWChar(A1));
    Exit;
  end;

  //---------------------
  if (act=cActionSaveFile) then
  begin
    Result:= PluginAction_SaveFile(Integer(A1), Bool(A2));
    Exit;
  end;

  //---------------------
  if (act=cActionOpenFtpFile) then
  begin
    Result:= PluginAction_OpenFtpFile(PWChar(A1), A2, Integer(A3));
    Exit
  end;

  //---------------------
  if (act=cActionControlLog) then
  begin
    Result:= PluginAction_ControlLog(PWChar(A1), Integer(A2), Integer(A3));
    Exit
  end;

  //---------------------
  if (act=cActionGetProperty) then
  begin
    Result:= PluginAction_GetProp(Integer(A1), A2, Integer(A3));
    Exit;
  end;

  //---------------------
  if (act=cActionShowHint) then
  begin
    Result:= PluginAction_ShowHint(PWChar(A1));
    Exit
  end;

  //---------------------
  if (act=cActionGetOpenedFileName) then
  begin
    Result:= PluginAction_GetOpenedFN(Integer(A2), A1);
    Exit;
  end;

  //---------------------
  if (act=cActionGetProjectFileName) then
  begin
    Result:= PluginAction_GetProjectFN(Integer(A2), A1);
    Exit;
  end;

  //---------------------
  if (act=cActionAddToFavorites) then
  begin
    DoAddFav(PWChar(A1));
    Result:= cSynOK;
    Exit
  end;

  //---------------------
  //---------------------

  Result:= cSynBadCmd;
end;


procedure TfmMain.DoRefreshPluginsFiles(const fn: Widestring);
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionRefreshFileList, PWChar(fn), nil, nil, nil);
end;

procedure TfmMain.DoRefreshPluginsLang;
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionUpdateLang, nil, nil, nil, nil);
end;

procedure TfmMain.DoPluginsRepaint;
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionRepaint, nil, nil, nil, nil);
end;

procedure TfmMain.DoPluginSaveFtpFile(F: TEditorFrame);
var
  i: Integer;
begin
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionSaveFtpFile,
          PWideChar(Widestring(F.FileName)),
          F.FtpInfoPtr, Pointer(F.FtpInfoSize), nil);
end;


procedure TfmMain.TBXItemOOPLogClick(Sender: TObject);
begin
  UpdatePanelOut(tbPluginsLog);
end;

function TfmMain.PluginAction_ShowHint(const AMsg: Widestring): Integer;
begin
  DoHint(AMsg);
  Result:= cSynOK;
end;

function TfmMain.PluginAction_ControlLog(const AMsg: Widestring; const ACmd: Integer; AColor: TColor): Integer;
var
  S: Widestring;
begin
  Result:= cSynOK;
  case ACmd of
    cSynLogCmdHide:
      begin
        TbxTabPlugins.Visible:= false;
        UpdatePanelOut(tbOut);
      end;
    cSynLogCmdShow:
      begin
        TbxTabPlugins.Visible:= true;
        UpdatePanelOut(tbPluginsLog);
        plOut.Show;
      end;
    cSynLogCmdAddLine:
      begin
        if opDateFmtPLog<>'' then
          S:= FormatDateTime(opDateFmtPLog, Now) + ' '
        else
          S:= '';
        ListPLog.Items.AddObject(S + AMsg, Pointer(AColor));
        ListPLog.ItemIndex:= ListPLog.Items.Count-1;
      end;
    cSynLogCmdClear:
      ListPLog.Items.Clear;
    cSynLogCmdSetCaption:
      TbxTabPlugins.Caption:= AMsg;
    else
      Result:= cSynBadCmd;
  end;
end;


procedure TfmMain.TBXItemPLogFindClick(Sender: TObject);
begin
  DoFindInPluginsLog;
end;

procedure TfmMain.DoFindInPluginsLog;
begin
  with ListPLog do
    if CanFocus then
    begin
      SetFocus;
      ecFindInList.Execute;
    end;
end;

procedure TfmMain.TBXItemPLogClearClick(Sender: TObject);
begin
  ListPLog.Clear;
  FocusEditor;
end;

procedure TfmMain.TBXItemPLogDeleteClick(Sender: TObject);
begin
  ListPLog.DeleteSelected;
end;

procedure TfmMain.TBXItemPLogCopyAllClick(Sender: TObject);
begin
  DoListCopyAll(ListPLog);
end;

procedure TfmMain.TBXItemPLogCopySelClick(Sender: TObject);
begin
  DoListCopy(ListPLog);
end;

procedure TfmMain.ListPLogKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[]) then
  begin
    TbxItemPLogClearClick(Self);
    Key:= 0;
    Exit
  end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    TbxItemPLogCopySelClick(Self);
    Key:= 0;
    Exit
  end;
  if IsShortcutOfCmd(Shortcut(Key, Shift), smFindDialog) then
  begin
    TBXItemPLogFindClick(Self);
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.ListPLogDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
begin
  with Control as TTntListbox do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= opColorOutSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    if odSelected in State then
      c:= opColorOutSelText
    else
      c:= TColor(Items.Objects[Index]);

    Canvas.Font.Color:= c;
    ecTextOut(Canvas, Rect.Left+1, Rect.Top, Items[Index]);
  end;
end;

//--------------------
function TfmMain.SGetTabPrefix: Widestring;
begin
  Result:= DKLangConstW('Tab') + ':';
end;

procedure TfmMain.DoFindDialog_FindAllInAllTabs;
var
  NTotalSize, NDoneSize: Int64;
  ADir: Widestring;
  F: TEditorFrame;
  i: Integer;
begin
  FListFiles.Clear;
  for i:= 0 to FrameAllCount-1 do
    FListFiles.AddObject('',
      Pointer(FramesAll[i].EditorMaster.TextLength));

  FListResFN:= '';
  FListResFN_Prev:= '';
  ADir:= '';

  //init TreeRoot, show pane
  UpdateTreeFind_Initial(Finder.FindText, ADir, true);
  UpdatePanelOut(tbFind);
  plOut.Show;

  DoProgressShow(proFindText);
  try
    NTotalSize:= 0;
    NDoneSize:= 0;
    for i:= 0 to FListFiles.Count-1 do
      Inc(NTotalSize, DWORD(FListFiles.Objects[i]));
    if NTotalSize = 0 then
      NTotalSize:= 1;

    FFinderTotalSize:= NTotalSize;
    FFinderDoneSize:= NDoneSize;

    for i:= 0 to FListFiles.Count-1 do
    begin
      F:= FramesAll[i];
      FListResFN:= SGetTabPrefix + IntToStr(i+1);
      if F.FileName<>'' then
        FListResFN:= FListResFN + '[' + WideExtractFileName(F.FileName) + ']';

      FindInFrame(F);

      Inc(NDoneSize, DWORD(FListFiles.Objects[i]));
      FFinderDoneSize:= NDoneSize;
      if IsProgressStopped(NDoneSize, NTotalSize) then
        Break;
    end;

    FFinderTotalSize:= 0;
    FFinderDoneSize:= 0;
  except
    on E: Exception do
    begin
      MsgExcept('Error on searching in tabs', E, Handle);
      DoProgressHide;
      Exit;
    end;
  end;

  if StopFind then
  begin
    StopFind:= false;
    UpdateTreeFind_Results(Finder.FindText, ADir, true, true);
    Exit
  end;

  if FTreeRoot=nil then
    raise Exception.Create('TreeRoot nil');
  if FTreeRoot.GetFirstChild=nil then
  begin
    UpdateTreeFind_Results(Finder.FindText, ADir, false, true);
  end
  else
  begin
    UpdateTreeFind_Results(Finder.FindText, ADir, false, true);
    UpdatePanelOut(tbFind);
    plOut.Show;
  end;
end;

procedure TfmMain.FindInFrame(F: TEditorFrame;
  AMarkAll: boolean = false;
  AWithBkmk: boolean = false);
begin
  FLastOnContinueCheck:= 0;
  Finder.OnBeforeExecute:= nil;
  Finder.OnNotFound:= nil;
  Finder.OnCanAccept:= FinderCanAccept;
  Finder.OnContinue:= FinderContinue;
  if AWithBkmk then
    Finder.OnFind:= FinderFind_WithResultPaneAndBkmk
  else
    Finder.OnFind:= FinderFind_WithResultPane;

  try
    Finder.Control:= F.EditorMaster;
    if AMarkAll then
      Finder.FindAll
    else
      Finder.CountAll;
  finally
    Finder.OnBeforeExecute:= FinderInit;
    Finder.OnNotFound:= FinderFail;
    Finder.OnFind:= nil;
    Finder.OnCanAccept:= nil;
    Finder.OnContinue:= nil;
  end;
end;

function TfmMain.SGetFrameIndexFromPrefixedStr(const InfoFN: Widestring): Integer;
var
  s: Widestring;
begin
  Result:= -1;
  s:= SGetTabPrefix; //"Tab#"
  if SBegin(InfoFN, s) then
  begin
    s:= Copy(InfoFN, Length(s)+1, MaxInt);
    SDeleteFromW(s, '['); //delete trailing part with filename
    Result:= Pred(StrToIntDef(s, -1));
  end;
end;

{
procedure TfmMain.DoRepaintFrame(F: TEditorFrame);
begin
  F.Width:= F.Width+1;
  F.Width:= F.Width-1;
end;
}

procedure TfmMain.TBXItemHtmlEmmetHelpClick(Sender: TObject);
begin
  FOpenURL('http://docs.emmet.io/cheat-sheet/', Handle);
end;

procedure TfmMain.ecZenExpandExecute(Sender: TObject);
begin
  DoZenExpand;
end;

procedure TfmMain.ecZenWrapExecute(Sender: TObject);
begin
  DoZenWrap;
end;


function TfmMain.PluginAction_SuggestCompletion(
  const Str: PWideChar;
  NChars: Integer;
  ShowPopup: boolean): Integer;
var
  P: TPoint;
  L: ecUnicode.TWideStrings;
  i: Integer;
  S, S_id, S_type, S_param: Widestring;
begin
  Result:= cSynOK;

  PluginACP.Items.Clear;
  PluginACP.DisplayItems.Clear;

  L:= TWideStringList.Create;
  try
    L.SetText(Str);
    if L.Count=0 then
      begin Result:= cSynError; Exit; end;
    for i:= 0 to L.Count-1 do
    begin
      S:= L[i];
      if Pos('|', S)>0 then
      begin
        S_id:= SGetItem(S, '|');
        S_type:= SGetItem(S, '|');
        S_param:= SGetItem(S, '|');
      end
      else
      begin
        S_id:= S;
        S_type:= '';
        S_param:= '';
      end;
      if S_id='' then Continue;
      S:= IfThen(Pos('(', S_param)>0, '('); //insert text with "(" if params not empty
      PluginACP.Items.Add(S_id+S);
      PluginACP.DisplayItems.Add(WideFormat('\s1\%s\t\\s2\%s\t\\s0\%s', [S_type, S_id, S_param]));
    end;
  finally
    FreeAndNil(L);
  end;

  with CurrentEditor do
  begin
    P:= CaretPos;
    if (TextLength=0) or (P.X=0) then
      begin Result:= cSynError; Exit end;

    if NChars>P.X then
      NChars:= P.X;
    Dec(P.X, NChars);

    if not ShowPopup then
    begin
      ReplaceText(CaretPosToStrPos(P), NChars, L[0]);
    end
    else
    begin
      FCurrPluginAcpStartPos:= P;
      PluginACP.Execute;
    end;
  end;
end;

procedure TfmMain.PluginAcpDefineStartPos(Sender: TObject;
  var StartPos: TPoint);
begin
  StartPos:= FCurrPluginAcpStartPos;
end;

function TfmMain.PluginAction_GetCaretPos(PtrX, PtrY, PtrAbs: PInteger): Integer;
var
  Ed: TSyntaxMemo;
  P: TPoint;
begin
  Ed:= CurrentEditor;
  P:= Ed.CaretPos;
  if PtrX<>nil then PtrX^:= P.X;
  if PtrY<>nil then PtrY^:= P.Y;
  if PtrAbs<>nil then PtrAbs^:= Ed.CaretStrPos;
  Result:= cSynOK;
end;

function TfmMain.PluginAction_SetCaretPos(AX, AY: Integer): Integer;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if (AX>=0) and (AY>=0) and (AY<Ed.Lines.Count) then
  begin
    Ed.CaretPos:= Point(AX, AY);
    Result:= cSynOK;
  end
  else
  if (AX<0) and (AY>=0) then
  begin
    Ed.CaretStrPos:= AY;
    Result:= cSynOK;
  end
  else
    Result:= cSynError;
end;


function TfmMain.PluginAction_ParseRegex(const SRegex, SStr: Widestring; var Res: TSynRegexArray): Integer;
var
  ResL: TSynStrArray;
  i: Integer;
begin
  SParseRegexArray(SStr, SRegex, ResL);
  for i:= Low(Res) to High(Res) do
  begin
    FillChar(Res[i]^, cSynMaxPath, 0);
    lstrcpynw(PWideChar(Res[i]), PWideChar(ResL[i]), cSynMaxPath);
  end;
  Result:= cSynOK;
end;

procedure TfmMain.ecCenterLinesExecute(Sender: TObject);
begin
  EditorCenterSelectedLines(CurrentEditor);
end;

procedure TfmMain.TBXItemLeftTabsClick(Sender: TObject);
begin
  UpdatePanelLeft(tbTabs);
end;

function TfmMain.ListTab_FrameIndex: integer;
begin
  Result:= -1;
  if ListTabs.Selected=nil then Exit;
  if ListTabs.Selected.SubItems.Count<2 then Exit;
  Result:= StrToIntDef(ListTabs.Selected.SubItems[1], -1);
end;

procedure TfmMain.ListTabsClick(Sender: TObject);
var
  N: Integer;
begin
  N:= ListTab_FrameIndex;
  if (N>=0) and (N<FrameAllCount) then
  begin
    CurrentFrame:= FramesAll[N];

    UpdateTabList(Groups.PagesCurrent.Tabs.TabIndex, -1, -1);

    if ListTabs.CanFocus then
      ListTabs.SetFocus;
    FocusEditor;
  end;
end;

procedure TfmMain.ListTabsKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.ListTabsColumnClick(Sender: TObject;
  Column: TListColumn);
begin
  if Column.Index=0 then
    opTabsSortMode:= 0
  else
    opTabsSortMode:= 1;
  UpdateListTabs;
end;

function TfmMain.GetTabsWidths: Widestring;
begin
  with ListTabs do
    Result:= Format('%d,%d,', [Columns[0].Width, Columns[1].Width]);
end;

procedure TfmMain.SetTabsWidths(const S: Widestring);
var
  S1: Widestring;
begin
  S1:= S;
  with ListTabs do
  begin
    Columns[0].Width:= StrToIntDef(SGetItem(S1), 100);
    Columns[1].Width:= StrToIntDef(SGetItem(S1), 400);
  end;
end;

procedure TfmMain.ListTabsCompare(Sender: TObject; Item1, Item2: TListItem;
  Data: Integer; var Compare: Integer);
var
  fn1, fn2,
  cap1, cap2: Widestring;
begin
  cap1:= Item1.Caption;
  cap2:= Item2.Caption;
  fn1:= '';
  fn2:= '';
  if Item1.SubItems.Count>0 then
    fn1:= Item1.SubItems[0];
  if Item2.SubItems.Count>0 then
    fn2:= Item2.SubItems[0];

  case opTabsSortMode of
    0: Compare:= lstrcmpw(PWChar(cap1), PWChar(cap2));
    1: Compare:= lstrcmpw(PWChar(fn1), PWChar(fn2));
    else
      raise Exception.Create('Unknown sort mode')
  end;
end;

procedure TfmMain.ecToggleFocusTabsExecute(Sender: TObject);
begin
  if not plTree.Visible then
  begin
    ecShowTree.Execute;
    UpdatePanelLeft(tbTabs);
    if ListTabs.CanFocus then
      ListTabs.SetFocus
  end
  else
  if ListTabs.Focused then
    FocusEditor
  else
  begin
    UpdatePanelLeft(tbTabs);
    if ListTabs.CanFocus then
      ListTabs.SetFocus
  end;
end;

procedure TfmMain.LoadHideIni;
var
  L: TStringList;
  fn: string;
  i: Integer;
begin
  fn:= SynHideIni;
  if not IsFileExist(fn) then Exit;

  L:= TStringList.Create;
  try
    L.LoadFromFile(fn);
    for i:= 0 to L.Count-1 do
      DoHideMenuItem(L[i]);
  finally
    FreeAndNil(L)
  end;
end;

procedure TfmMain.DoHideMenuItem(const Str: string);
var
  id, s1, sIndex: Widestring;
  NIndex, i: integer;
  Item: TComponent;
begin
  if Trim(Str)='' then Exit;
  s1:= Str;
  id:= SGetItem(s1, ' ');
  if id='' then Exit;
  SIndex:= SGetItem(s1, ' ');
  NIndex:= StrToIntDef(SIndex, -1);

  for i:= Low(FMenuItems) to High(FMenuItems) do
    if FMenuItems[i].Id = id then
    begin
      Item:= FMenuItems[i].Item;

      if Item is TSpTbxSubmenuItem then
      begin
        if NIndex<0 then
          (Item as TSpTbxSubmenuItem).Visible:= false
        else
        if NIndex<(Item as TSpTbxSubmenuItem).Count then
          (Item as TSpTbxSubmenuItem).Items[NIndex].Visible:= false
        else
          MsgError('[SynHide.ini] Bad index: '+Str, Handle);
      end
      else
      if Item is TSpTbxItem then
      begin
        (Item as TSpTbxItem).Visible:= false;
      end
      else
      if Item is TSpTbxPopupMenu then
      begin
        if (NIndex>=0) and (NIndex<(Item as TSpTbxPopupMenu).Items.Count) then
          (Item as TSpTbxPopupMenu).Items[NIndex].Visible:= false
        else
          MsgError('[SynHide.ini] Bad index: '+Str, Handle);
      end
      else
      if Item is TSpTbxToolbar then
      begin
        if (NIndex>=0) and (NIndex<(Item as TSpTbxToolbar).Items.Count) then
          (Item as TSpTbxToolbar).Items[NIndex].Visible:= false
        else
          MsgError('[SynHide.ini] Bad index: '+Str, Handle);
      end
      else
        MsgError('[SynHide.ini] Unknown item type: '+Str, Handle);
      Exit;
    end;

  MsgError('[SynHide.ini] Unknown item id: '+Str, Handle);
end;

function TfmMain.IsLexerFindID(const Lex: string): boolean;
var
  i: Integer;
begin
  Result:= false;
  for i:= Low(FPluginsFindid) to High(FPluginsFindid) do
    with FPluginsFindid[i] do
      if IsLexerListed(Lex, SLexers) then
      begin
        Result:= true;
        Exit
      end;
end;

procedure TfmMain.TBXItemCtxFindIDClick(Sender: TObject);
begin
  DoFindId;
end;

procedure TfmMain.DoFindId;
var
  i: Integer;
begin
  if DoPyEvent(CurrentEditor, cSynEventOnGotoDef, []) = cPyTrue then
  begin
    CurrentEditor.ResetSelection; //reset selection caused by Ctrl+Alt+click
    Exit;
  end;

  for i:= Low(FPluginsFindid) to High(FPluginsFindid) do
    with FPluginsFindid[i] do
      if IsLexerListed(CurrentLexer, SLexers) then
      begin
        DoLoadPlugin_FindID(i);
        CurrentEditor.ResetSelection; //reset selection caused by Ctrl+Alt+click
        Exit
      end;

  //no find-id plugins found
  DoHint(DKLangConstW('zMFindIdNone'));
end;

function TfmMain.DoAcpFromPlugins(const AAction: PWideChar): Widestring;
var
  i: Integer;
begin
  if AAction=cActionGetAutoComplete then
  begin
    Result:= DoPyEvent(CurrentEditor, cSynEventOnComplete, []);
    if Result=cPyTrue then Exit;
  end;

  if AAction=cActionGetFunctionHint then
  begin
    Result:= DoPyEvent(CurrentEditor, cSynEventOnFuncHint, []);
    if Result<>'' then
    begin
      //debug
      Exit;
    end;
  end;

  Result:= '';
  for i:= Low(FPluginsAcp) to High(FPluginsAcp) do
    with FPluginsAcp[i] do
      if IsLexerListed(CurrentLexer, SLexers) then
      begin
        DoHint(DKLangConstW('zMTryAcp')+' '+ExtractFileName(SFileName));

        //auto-completion dll plugin?
        Result:= DoLoadPlugin_GetString(SFilename, AAction);
        DoHint('');
        if Result<>'' then Exit;
      end;
end;


procedure TfmMain.DoLoadPlugin_FindID(Index: Integer);
begin
  DoLoadPlugin_Action(
    FPluginsFindid[Index].SFilename,
    cActionFindID,
    nil, nil, nil, nil);
end;

procedure TfmMain.DoLoadPlugin_Action(
  const AFileName: string;
  const AActionName: Widestring;
  P1, P2, P3, P4: Pointer);
var
  FDll: THandle;
  FSynInit: TSynInit;
  FSynAction: TSynAction;
  AIni: Widestring;
begin
  if not IsFileExist(AFileName) then
  begin
    MsgNoFile(AFileName);
    Exit;
  end;

  FDll:= LoadLibrary(PChar(string(AFileName)));
  if FDll=0 then
  begin
    MsgError('Can''t load dll:'#13+AFileName, Handle);
    Exit
  end;

  FSynInit:= GetProcAddress(FDll, 'SynInit');
  if @FSynInit=nil then
  begin
    MsgError('Can''t find SynInit'#13+AFileName, Handle);
    Exit
  end;

  FSynAction:= GetProcAddress(FDll, 'SynAction');
  if @FSynAction=nil then
  begin
    MsgError('Can''t find SynAction'#13+AFileName, Handle);
    Exit
  end;

  AIni:= SynPluginIni(ChangeFileExt(ExtractFileName(AFileName), ''));
  FSynInit(PWChar(AIni), @_SynActionProc);
  FSynAction(nil, PWChar(AActionName), P1, P2, P3, P4);
  FreeLibrary(FDll);
end;

function TfmMain.DoLoadPlugin_GetString(
  const AFileName: string;
  const AActionName: Widestring): Widestring;
var
  FDll: THandle;
  FSynInit: TSynInit;
  FSynAction: TSynAction;
  AIni: Widestring;
  P1, P2, P3, P4: Pointer;
  AText: array[0..Pred(8*1024)] of WideChar;
begin
  Result:= '';

  if not IsFileExist(AFileName) then
  begin
    MsgNoFile(AFileName);
    Exit;
  end;

  FDll:= LoadLibrary(PChar(string(AFileName)));
  if FDll=0 then
  begin
    MsgError('Can''t load dll:'#13+AFileName, Handle);
    Exit
  end;

  FSynInit:= GetProcAddress(FDll, 'SynInit');
  if @FSynInit=nil then
  begin
    MsgError('Can''t find SynInit'#13+AFileName, Handle);
    Exit
  end;

  FSynAction:= GetProcAddress(FDll, 'SynAction');
  if @FSynAction=nil then
  begin
    MsgError('Can''t find SynAction'#13+AFileName, Handle);
    Exit
  end;

  FillChar(AText, SizeOf(AText), 0);
  P1:= @AText;
  P2:= Pointer(SizeOf(AText) div 2 - 1);
  P3:= nil;
  P4:= nil;

  try
    AIni:= SynPluginIni(ChangeFileExt(ExtractFileName(AFileName), ''));
    FSynInit(PWChar(AIni), @_SynActionProc);
    if FSynAction(nil, PWChar(AActionName), P1, P2, P3, P4) = cSynOK then
      Result:= Widestring(AText);
  finally
    FreeLibrary(FDll);
  end;
end;


procedure TfmMain.PluginCommandItemClick(Sender: TObject);
var
  N: Integer;
begin
  N:= (Sender as TComponent).Tag;
  with FPluginsCommand[N] do
  begin
    if (SFileName='') then
      begin MsgBeep; Exit; end;

    if (SLexers<>'') and not IsLexerListed(CurrentLexer, SLexers) then
    begin
      DoHint(WideFormat(DKLangConstW('zMNoneLexer'), [SLexers]));
      MsgBeep;
      Exit;
    end;

    //MsgInfo(SFileName+#13+SCmd+#13);
    if SBegin(SFilename, cPyPrefix) then
    begin
      //Python command plugin
      DoPyLoadPlugin(
        SFilename,
        SCmd);
    end
    else
    begin
      //DLL command plugin
      DoLoadPlugin_Action(
        SFilename,
        cActionMenuCommand,
        PWChar(WideString(SCmd)),
        nil,
        nil,
        nil);
    end;
  end;
end;

procedure TfmMain.DoAddPluginMenuItem(
  ASubmenu: TSpTbxSubmenuitem;
  const SKey, SShortcut: Widestring; NIndex: Integer);
var
  ItemSub: TSpTbxSubmenuItem;
  Item: TSpTbxItem;
  S, CapMenu, CapItem: Widestring;
  N, i: Integer;
begin
  with ASubmenu do
  begin
    Enabled:= true;

    S:= SKey;
    CapMenu:= SGetItem(S, '\');
    CapItem:= SGetItem(S, '\');

    N:= -1;
    for i:= 0 to Count-1 do
      if Items[i].Caption=CapMenu then
        begin N:= i; Break end;

    if N<0 then
    begin
      if CapItem='' then
        ItemSub:= ASubmenu
      else
      begin
        ItemSub:= TSpTbxSubmenuItem.Create(Self);
        ItemSub.Caption:= CapMenu;
        Add(ItemSub);
      end;
    end
    else
    begin
      if (Items[N] is TSpTbxSubmenuItem) then
        ItemSub:= (Items[N] as TSpTbxSubmenuItem)
      else
        begin MsgBeep; Exit end;
    end;

    if CapItem='-' then
    begin
      ItemSub.Add(TSpTbxSeparatorItem.Create(Self));
    end
    else
    begin
      Item:= TSpTbxItem.Create(Self);
      if CapItem='' then
        Item.Caption:= CapMenu
      else
        Item.Caption:= CapItem;
      Item.Tag:= NIndex;
      Item.ShortCut:= TextToShortcut(SShortcut);
      Item.OnClick:= PluginCommandItemClick;
      ItemSub.Add(Item);
    end;
  end;
end;

procedure TfmMain.FindFocusEditor(Sender: TObject);
begin
  FocusEditor;
end;

procedure TfmMain.TBXItemOEditSynPluginsIniClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_EditSynPluginsIni);
end;

function TfmMain.PluginAction_GetText(const id: Integer; BufferPtr: Pointer; var BufferSize: Integer): Integer;
var
  s, sCR: Widestring;
  NeededSize: Integer;
  Ed: TSyntaxMemo;
  i, Ln1, Ln2: Integer;
begin
  Ed:= CurrentEditor;
  s:= '';
  sCR:= EditorEOL(Ed);

  if (BufferPtr=nil) or (BufferSize<=0) then
  begin
    Result:= cSynError;
    Exit
  end;

  case id of
    cSynIdAllText:
      s:= Ed.Lines.FText;
    cSynIdSelectedText:
      s:= Ed.SelText;
    cSynIdSelectedLines:
      begin
        if Ed.SelLength>0 then
        begin
          EditorGetSelLines(Ed, Ln1, Ln2);
          for i:= Ln1 to Ln2 do
            s:= s+Ed.Lines[i]+sCR;
        end;
      end;
    cSynIdCurrentLine:
      begin
        i:= Ed.CaretPos.Y;
        if (i>=0) and (i<Ed.Lines.Count) then
          s:= Ed.Lines[i]
        else
          begin Result:= cSynError; Exit end;
      end;
    cSynIdSearchPaths:
      begin
        s:= DoGetSearchPaths;
      end;
    cSynIdFavoritesText:
      begin
        s:= DoGetFavList;
      end;
    else
      begin
        if (id>=0) and (id<Ed.Lines.Count) then
          s:= Ed.Lines[id]
        else
          begin Result:= cSynError; Exit end;
      end;
  end;

  NeededSize:= Length(s)+1;
  if BufferSize<NeededSize then
  begin
    BufferSize:= NeededSize;
    Result:= cSynSmallBuffer;
    Exit
  end;

  FillChar(BufferPtr^, BufferSize, 0);
  lstrcpynW(BufferPtr, PWChar(s), NeededSize);
  BufferSize:= Length(s);
  Result:= cSynOK;
end;

function TfmMain.DoGetSearchPaths: Widestring;
begin
  Result:= opProjPaths;
  if Assigned(fmProj) then
    Result:= Result + fmProj.FOpts.SearchDirs;
end;

function TfmMain.PluginAction_SetText(const id: Integer;
  BufferPtr: Pointer; BufferSize: Integer): Integer;
var
  s: Widestring;
  Ed: TSyntaxMemo;
  i: Integer;
  //Ln1, Ln2: Integer;
begin
  Ed:= CurrentEditor;
  s:= '';

  if (BufferPtr=nil) or (BufferSize<=0) then
  begin
    Result:= cSynError;
    Exit
  end;

  s:= SBufferToString(BufferPtr, BufferSize);

  case id of
    cSynIdAllText:
      Ed.ReplaceText(0, Ed.TextLength, s);
    cSynIdSelectedText:
      Ed.ReplaceText(Ed.SelStart, Ed.SelLength, s);
    {
    //not supported for SetText
    cSynIdSelectedLines:
    begin
      if Ed.SelLength>0 then
      begin
        EditorGetSelLines(Ed, Ln1, Ln2);
        for i:= Ln2 downto Ln1 do
          DoDeleteLine(Ed, i, true);
        dd
      end;
    end;
    }
    cSynIdCurrentLine:
    begin
      i:= Ed.CaretPos.Y;
      if (i>=0) and (i<Ed.Lines.Count) then
        DoReplaceLine(Ed, i, s, true{ForceUndo})
      else
        begin Result:= cSynError; Exit end;
    end;
    else
    begin
      if (id>=0) and (id<Ed.Lines.Count) then
        DoReplaceLine(Ed, id, s, true{ForceUndo})
      else
        begin Result:= cSynError; Exit end;
    end;
  end;

  Result:= cSynOK;
end;

function TfmMain.PluginAction_GetSel(var Sel: TSynSelection): Integer;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  Sel.SelStart:= Ed.SelStart;
  Sel.SelLength:= Ed.SelLength;
  Sel.SelRect:= Ed.SelRect;
  Result:= cSynOK;
end;

function TfmMain.PluginAction_SetSel(const Sel: TSynSelection): Integer;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Sel.SelLength<0 then
    Ed.ResetSelection
  else
  if Sel.SelLength>0 then
    Ed.SetSelection(Sel.SelStart, Sel.SelLength)
  else
    Ed.SelRect:= Sel.SelRect;
  Result:= cSynOK;
end;

function TfmMain.PluginAction_SetTopLine(Num: Integer): Integer;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if (Num>=0) and (Num<Ed.Lines.Count) then
  begin
    Ed.TopLine:= Num;
    Result:= cSynOK;
  end
  else
    Result:= cSynError;
end;

function TfmMain.PluginAction_GetProp(id: Integer; Buffer: Pointer; Param: Integer): Integer;
  //
  procedure SetNum(N: Integer);
  begin
    PInteger(Buffer)^:= N;
  end;
  procedure SetStr(const S: Widestring);
  begin
    lstrcpynW(Buffer, PWChar(S), cSynMaxPath);
  end;
var
  Ed: TSyntaxMemo;
begin
  Result:= cSynOK;
  Ed:= CurrentEditor;
  case id of
    cSynPropLinesCount: SetNum(Ed.Lines.Count);
    cSynPropTopLine: SetNum(Ed.TopLine);
    cSynPropReadOnly: SetNum(Ord(Ed.ReadOnly));
    cSynPropLexer: SetStr(CurrentLexer);
    cSynPropLexerForFile: SetStr(CurrentLexerForFile);
    cSynPropLineEnds: SetStr(EditorEOL(Ed));
    cSynPropRightMargin: SetNum(Ed.RightMargin);
    cSynPropTabSpaces: SetNum(Ord(Ed.TabMode=tmSpaces));
    cSynPropTabSize: SetNum(Ed.TabList[0]);
    cSynPropWordWrap: SetNum(Ord(Ed.WordWrap));
    cSynPropCodeFolding: SetNum(Ord(not Ed.DisableFolding));
    cSynPropNonPrintable: SetNum(Ord(Ed.NonPrinted.Visible));
    cSynPropLineNumbers: SetNum(Ord(Ed.LineNumbers.Visible));
    cSynPropTextLength: SetNum(Ed.TextLength);
    cSynPropLineLength:
      begin
        if (Param>=0) and (Param<Ed.Lines.Count) then
          SetNum(Ed.Lines.LineLength(Param))
        else
          Result:= cSynError;
      end;
    cSynPropLineSpace:
      begin
        if (Param>=0) and (Param<Ed.Lines.Count) then
          SetNum(Ed.Lines.LineSpace(Param))
        else
          Result:= cSynError;
      end;
    else
      Result:= cSynError;
  end;
end;

function TfmMain.PluginAction_ReplaceText(DelLen: Integer; BufPtr: Pointer;
  BufSize: Integer): Integer;
var
  Ed: TSyntaxMemo;
  s: Widestring;
begin
  Ed:= CurrentEditor;
  if Ed.ReadOnly or (DelLen<0) or (BufSize<0) then
  begin
    Result:= cSynError;
    Exit
  end;

  s:= SBufferToString(BufPtr, BufSize);
  Ed.ReplaceText(Ed.CaretStrPos, DelLen, s);
  Result:= cSynOK;
end;

function TfmMain.PluginAction_TranslatePos(var PosX, PosY, PosAbs: Integer;
  Direction: Boolean): Integer;
var
  Ed: TSyntaxMemo;
  P: TPoint;
begin
  Ed:= CurrentEditor;
  if Direction then
  begin
    //offset -> col/line
    P:= Ed.StrPosToCaretPos(PosAbs);
    PosX:= P.X;
    PosY:= P.Y;
  end
  else
  begin
    PosAbs:= Ed.CaretPosToStrPos(Point(PosX, PosY));
  end;
  Result:= cSynOK;
end;

procedure TfmMain.TBXItemPLogSaveAsClick(Sender: TObject);
var
  fn: string;
begin
  with TSaveDialog.Create(Self) do
  try
    Options:= Options+[ofOverwritePrompt];
    Filter:= '*.log;*.txt|*.log;*.txt';
    InitialDir:= '';
    FileName:= TbxTabPlugins.Caption;
    if Execute then
    begin
      if ExtractFileExt(FileName)='' then
        fn:= FFreeFN(FileName, 'log', InitialDir)
      else
        fn:= FileName;
      ListPLog.Items.SaveToFile(fn);
    end;
  finally
    Free
  end;
end;

procedure TfmMain.TBXItemTabMoveToWindowClick(Sender: TObject);
begin
  DoMoveTabToWindow(FClickedFrame, true);
end;

procedure TfmMain.TBXItemTabOpenInWindowClick(Sender: TObject);
begin
  DoMoveTabToWindow(FClickedFrame, false);
end;

procedure TfmMain.DoMoveTabToWindow(Frame: TEditorFrame; AndClose: boolean);
begin
  if not SynExe then
    begin MsgBeep; Exit; end;

  if Frame.FileName='' then
    begin MsgBeep; Exit; end;
  if opSingleInstance then
    begin MsgBeep; Exit end;

  if not FExecute(Application.ExeName, '"'+Frame.FileName+'"', '', Handle) then
    begin MsgBeep; Exit end;

  if AndClose then
    Groups.CloseTabs(tabCloseCurrent, true);
end;


function TfmMain.BrotherEditor(Ed: TSyntaxMemo): TSyntaxMemo;
var
  F: TEditorFrame;
begin
  F:= FrameOfEditor(Ed);
  if Ed=F.EditorMaster then
    Result:= F.EditorSlave
  else
    Result:= F.EditorMaster;
end;

procedure TfmMain.DoCheckIfBookmarkSetHere(Ed: TSyntaxMemo; NPos: Integer);
var
  NNew, i: Integer;
begin
  if not ((NPos>=0) and (NPos<Ed.TextLength)) then Exit;
  with Ed.BookmarkObj do
    for i:= 0 to Count-1 do
      if Items[i].Position = NPos then
      begin
        NNew:= NPos+1;
        Items[i].Position:= NNew;
        //need to change Slave's bookmarks too
        with BrotherEditor(Ed).BookmarkObj do
          Items[i].Position:= NNew;
        Exit
      end;
end;

procedure TfmMain.UpdateFrameMicroMap(F: TEditorFrame);
begin
  F.DoSyncMicromap;
end;

procedure TfmMain.ProjLoadMRU(List: TSynMruList);
var
  Ini: TIniFile;
begin
  Ini:= TIniFile.Create(SynHistoryIni);
  try
    LoadMruList(List, Ini, 'MRU_Proj', opSaveState, opMruCheck);
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.ProjUpdateMRU(List: TSynMruList);
var
  Ini: TIniFile;
begin
  Ini:= TIniFile.Create(SynHistoryIni);
  try
    SaveMruList(List, Ini, 'MRU_Proj');
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.ecSortDialogExecute(Sender: TObject);
begin
  DoLinesCommand(scmdSortDialog);
end;

procedure TfmMain.DoLinesCommand(Cmd: TSynLineCmd);
var
  Ed: TSyntaxMemo;
  Ln1, Ln2: Integer;
  Pos1, Pos2, i: Integer;
  Col1, Col2: Integer;
  L: TTntStringList;
  S, Sep: Widestring;
  ok: boolean;
begin
  Ed:= CurrentEditor;
  if not Ed.HaveSelection then
  begin
    Ln1:= 0;
    Ln2:= Ed.Lines.Count-1;
  end
  else
    EditorGetSelLines(Ed, Ln1, Ln2);

  //if (Ln2-Ln1)<1 then
  //  begin MsgNoSelection; Exit end;

  Pos1:= Ed.CaretPosToStrPos(Point(0, Ln1));
  if Ln2>=Ed.Lines.Count-1 then
    Pos2:= Ed.TextLength
  else
    Pos2:= Ed.CaretPosToStrPos(Point(0, Ln2+1));

  Col1:= -1;
  Col2:= -1;
  if Ed.HaveSelection and (Ed.SelectMode=msColumn) then
  begin
    Col1:= Ed.SelRect.Left+1;
    Col2:= Ed.SelRect.Right;
  end;

  L:= TTntStringList.Create;
  try
    for i:= Ln1 to Ln2 do
      L.Add(Ed.Lines[i]);

    case Cmd of
      scmdSortAsc,
      scmdSortDesc:
        ok:= DoListCommand_Sort(L, opSortMode, Cmd=scmdSortAsc, false{AShowDlg}, Col1, Col2);
      scmdSortDialog:
        ok:= DoListCommand_Sort(L, opSortMode, true, true{AShowDlg}, Col1, Col2);

      scmdDedupAll:
        begin
          i:= DoListCommand_Deduplicate(L, dedupAll);
          ok:= i>0;
          MsgDelLines(i);
        end;
      scmdDedupAdjacent:
        begin
          i:= DoListCommand_Deduplicate(L, dedupAdjacent);
          ok:= i>0;
          MsgDelLines(i);
        end;

      scmdTrimLead:
        begin
          i:= DoListCommand_Trim(L, cTrimLead);
          ok:= i>0;
          MsgDoneLines(i);
        end;
      scmdTrimTrail:
        begin
          i:= DoListCommand_Trim(L, cTrimTrail);
          ok:= i>0;
          MsgDoneLines(i);
        end;
      scmdTrimAll:
        begin
          i:= DoListCommand_Trim(L, cTrimAll);
          ok:= i>0;
          MsgDoneLines(i);
        end;
      scmdRemoveDupSpaces:
        begin
          i:= DoListCommand_Trim(L, cTrimDups);
          ok:= i>0;
          MsgDoneLines(i);
        end;

      scmdReverse:
        begin
          ok:= DoListCommand_Reverse(L);
        end;
      scmdShuffle:
        begin
          ok:= DoListCommand_Shuffle(L);
        end;

      scmdUntab:
        begin
          i:= DoListCommand_Untab(L, EditorTabSize(Ed));
          ok:= i>0;
          MsgDoneLines(i);
        end;

      scmdIndent:
        ok:= DoListCommand_Indent(L,
               EditorTabSize(Ed),
               Ed.BlockIndent,
               soOptimalFill in Ed.Options
               );
      scmdUnIndent:
        ok:= DoListCommand_UnIndent(L,
               EditorTabSize(Ed),
               Ed.BlockIndent,
               soOptimalFill in Ed.Options,
               soUnindentKeepAlign in Ed.Options
               );

      scmdSpacesToTabs:
        begin
          ok:= DoListCommand_Unspace(L, EditorTabSize(Ed), false);
        end;
      scmdSpacesToTabsLead:
        begin
          ok:= DoListCommand_Unspace(L, EditorTabSize(Ed), true);
        end;

      scmdRemoveBlanks:
        begin
          i:= DoListCommand_RemoveBlanks(L);
          ok:= i>0;
          MsgDelLines(i);
        end;
      scmdRemoveDupBlanks:
        begin
          i:= DoListCommand_RemoveDupBlanks(L);
          ok:= i>0;
          MsgDelLines(i);
        end;

      scmdExtractDupsCase,
      scmdExtractDupsNoCase:
        begin
          i:= DoListCommand_ExtractDups(L, Cmd=scmdExtractDupsCase);
          ok:= false;
          if i>0 then
          begin
            acNewTab.Execute;
            CurrentEditor.InsertText(L.Text);
          end;
          MsgDoneLines(i);
        end;

      scmdAlignWithSep:
        begin
          //read separator from ini
          with TIniFile.Create(SynHistoryIni) do
          try
            Sep:= UTF8Decode(ReadString('Win', 'AlignSep', '='));
            ok:= DoInputString(DKLangConstW('zMEnterSep'), Sep) and (Sep<>'');
            if ok then
              WriteString('Win', 'AlignSep', UTF8Encode(Sep));
          finally
            Free
          end;
          //do alignment
          if ok then
          begin
            i:= DoListCommand_AlignWithSep(L, Sep, EditorTabSize(Ed){, soOptimalFill in Ed.Options});
            ok:= i>0;
            MsgDoneLines(i);
          end;
        end;
      else
        ok:= false;
    end;

    //are lines processed
    if not ok then
      begin MsgDoneLines(0); MsgBeep; Exit end;

    //get resulting string
    S:= L.Text;
    FixLineEnds(S, Ed.Lines.TextFormat);
  finally
    FreeAndNil(L);
  end;

  //insert string into editor
  Ed.BeginUpdate;
  try
    Ed.CaretStrPos:= Pos1; //needed! otherwise ReplaceText will leave trailing blanks after small block.
    Ed.ReplaceText(Pos1, Pos2-Pos1, S);
    //EditorSetModified(Ed);

    //restore selection Ln1...Ln2
    Ed.SetSelection(Pos1, Length(S));
  finally
    Ed.EndUpdate;
  end;
end;

procedure TfmMain.TBXItemSSelBracketsClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SelectBrackets);
end;

function TfmMain.FrameOfEditor(Ed: TSyntaxMemo): TEditorFrame;
begin
  if Ed.Owner is TEditorFrame then
    Result:= Ed.Owner as TEditorFrame
  else
    raise Exception.Create('Unknown owner of editor');
end;

procedure TfmMain.ecUndoExecuteOK(Sender: TObject);
//needed to work-around minor bug " * doesn't dissapear on tab header after ReplaceAll/Undo"
//Note: tbMenu.ProcessShortcuts must be True
var
  Ed: TSyntaxMemo;
begin
  Ed:= ecUndo.SyntMemo as TSyntaxMemo;
  if not Ed.Modified then
  begin
    FrameOfEditor(Ed).DoTitleChanged;
  end;
end;

procedure TfmMain.LoadPrintOptions;
begin
  PropsManagerPrint.IniFileName:= SynIni;
  PropsManagerPrint.LoadProps;

  with TIniFile.Create(SynIni) do
  try
    StringToFont(ecSyntPrinter.FontFooter, ReadString('Fonts', 'P_Footer', ''));
    StringToFont(ecSyntPrinter.FontHeader, ReadString('Fonts', 'P_Header', ''));
    StringToFont(ecSyntPrinter.FontLineNumders, ReadString('Fonts', 'P_Nums', ''));
  finally
    Free;
  end;
end;

procedure TfmMain.SavePrintOptions;
begin
  PropsManagerPrint.IniFileName:= SynIni;
  PropsManagerPrint.SaveProps;

  with TIniFile.Create(SynIni) do
  try
    WriteString('Fonts', 'P_Footer', FontToString(ecSyntPrinter.FontFooter));
    WriteString('Fonts', 'P_Header', FontToString(ecSyntPrinter.FontHeader));
    WriteString('Fonts', 'P_Nums', FontToString(ecSyntPrinter.FontLineNumders));
  finally
    Free;
  end;
end;

procedure TfmMain.ecPageSetupActionBeforeExecute(Sender: TObject);
begin
  LoadPrintOptions;
end;

procedure TfmMain.ecPreviewActionExecuteOK(Sender: TObject);
begin
  SavePrintOptions;
end;

procedure TfmMain.ecPageSetupActionExecuteOK(Sender: TObject);
begin
  SavePrintOptions;
end;


{
procedure TfmMain.TestApi;
var
  Ed: TSyntaxMemo;
  i: Integer;
  S: string;
begin
  Ed:= CurrentEditor;
  for i:= 0 to Ed.Lines.Count-1 do
    if IsEditorLineCollapsed(Ed, i) then
      S:= S+inttostr(i)+' ';
  Showmessage(s);
end;
}

procedure TfmMain.FinderCanAccept(Sender: TObject;
  StartPos, EndPos: integer; var Accept: Boolean);
var
  Ed: TSyntaxMemo;
  Flags: TSearchOptions;
  Tokens: TSearchTokens;
  p: TPoint;
begin
  Ed:= (Sender as TSynFinder).Control as TSyntaxMemo;
  Flags:= (Sender as TSynFinder).Flags;
  Tokens:= (Sender as TSynFinder).Tokens;

  if ftSkipCollapsed in Flags then
  begin
    p:= Ed.StrPosToCaretPos(StartPos);
    if IsEditorLineCollapsed(Ed, p.y) then
    begin
      Accept:= false;
      Exit
    end;
  end;

  if Tokens<>tokensAll then
  begin
    Accept:= IsPositionMatchesTokens(Ed, StartPos, EndPos, Tokens);
  end;
end;

function TfmMain.IsPositionMatchesTokens(Ed: TSyntaxMemo;
  StartPos, EndPos: Integer; OptTokens: TSearchTokens): boolean;
var
  IsCmt, IsStr: boolean;
begin
  Result:= true;
  if OptTokens=tokensAll then Exit;

  EditorGetTokenType(Ed, StartPos, EndPos, IsCmt, IsStr);
  case OptTokens of
    tokensCmt:
      Result:= IsCmt;
    tokensStr:
      Result:= IsStr;
    tokensCmtStr:
      Result:= IsCmt or IsStr;
    tokensExceptCmtStr:
      Result:= not (IsCmt or IsStr);
  end;
end;

procedure TfmMain.SyncTree;
var
  Ed: TSyntaxMemo;
begin
  //is master<->slave editor switched?
  //then do fast switch.
  Ed:= CurrentEditor;
  if (Ed<>nil) and (Tree.SyntaxMemo<>nil) and (Tree.SyntaxMemo.Parent = Ed.Parent) then
  begin
    Tree.SyntaxMemo:= Ed;
    Exit;
  end;

  //clear tree and sync it after 1s delay
  Tree.SyntaxMemo:= nil;
  if Tree.Visible then
  begin
    TimerTree.Enabled:= false;
    TimerTree.Enabled:= true;
  end;
end;

procedure TfmMain.TimerTreeTimer(Sender: TObject);
begin
  TimerTree.Enabled:= false;
  if Tree.Visible then
    Tree.SyntaxMemo:= CurrentEditor
  else
    Tree.SyntaxMemo:= nil;
end;

function TfmMain.DoCheckUnicodeNeeded(Frame: TEditorFrame): boolean;
  //
  function Cfm(const SEnc: Widestring): integer;
  var
    S: Widestring;
  begin
    S:= WideFormat(DKLangConstW('zMUniNeed'), [SEnc]);
    Result:= MessageBoxW(Handle, PWChar(S), 'SynWrite', mb_yesnocancel or mb_iconquestion);
  end;
  //
begin
  Result:= true;
  if opUnicodeNeeded=0 then Exit;
  if Frame.EditorMaster.TextSource.Lines.TextCoding<>tcAnsi then Exit;
  if not IsTextUnicode(Frame.EditorMaster.Lines.FText) then Exit;

  case opUnicodeNeeded of
    1:
        case Cfm('UTF-8') of
          id_yes: ApplyFrameEncodingAndReload(Frame, cp__UTF8, False{ACanReload});
          id_cancel: Result:= false;
        end;
    2:
        case Cfm(DKLangConstW('cpUTF8no')) of
          id_yes: ApplyFrameEncodingAndReload(Frame, cp__UTF8_noBOM, False{ACanReload});
          id_cancel: Result:= false;
        end;
    3:
        case Cfm('UTF-16') of
          id_yes: ApplyFrameEncodingAndReload(Frame, cp__Unicode, False{ACanReload});
          id_cancel: Result:= false;
        end;
    4:
        case Cfm('UTF-16 BE') of
          id_yes: ApplyFrameEncodingAndReload(Frame, cp__UnicodeBE, False{ACanReload});
          id_cancel: Result:= false;
        end;
    5:
      ApplyFrameEncodingAndReload(Frame, cp__UTF8, False{ACanReload});
    6:
      ApplyFrameEncodingAndReload(Frame, cp__UTF8_noBOM, False{ACanReload});
    7:
      ApplyFrameEncodingAndReload(Frame, cp__Unicode, False{ACanReload});
    8:
      ApplyFrameEncodingAndReload(Frame, cp__UnicodeBE, False{ACanReload});
  end;
end;


procedure TfmMain.PopupStatusLineEndsPopup(Sender: TObject);
begin
  case CurrentFrame.EditorMaster.TextSource.Lines.TextFormat of
    tfCR: TbxItemEndMac.Checked:= true;
    tfNL: TbxItemEndUn.Checked:= true;
    else TbxItemEndWin.Checked:= true;
  end;
end;

procedure TfmMain.TBXSubmenuLineEndsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  case CurrentFrame.EditorMaster.TextSource.Lines.TextFormat of
    tfCR: TbxItemEndMMac.Checked:= true;
    tfNL: TbxItemEndMUn.Checked:= true;
    else TbxItemEndMWin.Checked:= true;
  end;
end;

procedure TfmMain.SynSpellCheckerCheckWord(Sender: TObject;
  const AWord: WideString; APos: Integer; var Valid: Boolean);
  //
  function IsUrlAt(F: TEditorFrame; APos: Integer): boolean;
  var
    P: TPoint;
  begin
    p:= F.HyperlinkHighlighter.HltRangeBndAt(APos);
    Result:= p.y > p.x;
  end;
  //
var
  F: TEditorFrame;
  Ed: TSyntaxMemo;
  En: boolean;
begin
  {$ifdef SPELL}
  F:= Sender as TEditorFrame;
  Ed:= F.EditorMaster;
  En:= F.SpellLive;
  Inc(APos);

  if En and IsPositionMatchesTokens(Ed, APos, APos+1, tokensCmtStr) then
    Valid:= FSpell.CheckWord(AWord) or IsUrlAt(F, APos)
  else
    Valid:= true;
  {$else}
  Valid:= true;
  {$endif}
end;

procedure TfmMain.SynContextGutterPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Ed: TSyntaxMemo;
  //i, XFrom, XTo: Integer;
begin
  Handled:= false;
  Ed:= Sender as TSyntaxMemo;
  if (not Ed.Gutter.Visible) or (Ed.Gutter.Bands[cBandFolding].Width=0) then Exit;

  {
  XFrom:= 0;
  for i:= 0 to cBandFolding-1 do
    Inc(XFrom, Ed.Gutter.Bands[i].Width);
  XTo:= XFrom + Ed.Gutter.Bands[cBandFolding].Width;
  Handled:= (MousePos.X >= XFrom) and (MousePos.X < XTo);
  }
  Handled:= (MousePos.X >= 0) and (MousePos.X < Ed.Gutter.Width);

  if Handled then
    with Mouse.CursorPos do
      PopupFoldLevel.Popup(X, Y);
end;

procedure TfmMain.SynContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  F: TEditorFrame;
  Ed: TSyntaxMemo;
  AWord: Widestring;
  S: Ansistring;
  NStart, NEnd: Integer;
begin
  Handled:= false;
  F:= Sender as TEditorFrame;
  Ed:= F.EditorMaster;

  if not F.IsEditorPosMisspelled(Ed.CaretStrPos) then Exit;
  Handled:= true;

  {$ifdef SPELL}
  AWord:= Ed.WordAtPos(Ed.CaretPos);
  MousePos:= Ed.ClientToScreen(MousePos);
  S:= AWord;
  if FSpell.ShowPopupMenu(Sender,
    [spAdd, spIgnoreAll, spReplace], MousePos.X, MousePos.Y, S) = spReplace then
  begin
    Ed.WordRangeAtPos(Ed.CaretPos, NStart, NEnd);
    Ed.ReplaceText(NStart, NEnd-NStart, S);
  end;
  {$endif}
end;

procedure TfmMain.DoCheckAutoShowACP(Ed: TSyntaxMemo);
var
  N, NLen, i: Integer;
begin
  if (opAcpNum=0) or (ecACP.StartExpr<>'') then Exit;
  if ecACP.Visible then Exit;

  N:= Ed.CaretStrPos;
  if N>Length(Ed.Lines.FText) then Exit;
  //don't do Autocomplete if next char is wordchar
  if IsWordChar(Ed.Lines.Chars[N+1]) then Exit;

  //NLen is length of word before caret
  NLen:= 1;
  i:= N+1;
  repeat
    if (i<=1) or not IsWordChar(Ed.Lines.Chars[i-1]) then Break;
    Inc(NLen);
    Dec(i);
    if NLen>=opAcpNum then
    begin
      DoAcpPopup;
      Break
    end;
  until false;
end;

procedure TfmMain.SpellDialogShow(Sender: TObject);
begin
  {$ifdef SPELL}
  //not needed
  {$endif}
end;

procedure TfmMain.SpellPositionDialog(Sender: TObject);
var
  F: TForm;
begin
  {$ifdef SPELL}
  if Assigned(FSpell) and Assigned(FSpell.DialogForm) then
  begin
    F:= FSpell.DialogForm;
    F.Left:= (Screen.Width - F.Width) div 2;
    F.Top:= (Screen.Height - F.Height) div 2;
    EditorCheckCaretOverlappedByForm(CurrentFrame.EditorMaster, F);
  end;
  {$endif}
end;

procedure TfmMain.UpdateBusyIco;
begin
  if ecMacroRecorder1.Recording then
    StatusItemBusy.ImageIndex:= 7
  else
  {$ifdef SPELL}
  if FSpellChecking then
    StatusItemBusy.ImageIndex:= 11
  else
  {$endif}
    StatusItemBusy.ImageIndex:= 6;
end;

procedure TfmMain.UpdateSaveIco;
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F<>nil then
    if F.Modified then
      acSave.ImageIndex:= 1
    else
      acSave.ImageIndex:= 2;
end;

procedure TfmMain.TBXItemFoldAllClick(Sender: TObject);
begin
  CurrentEditor.FullCollapse();
end;

procedure TfmMain.TBXItemUnfoldAllClick(Sender: TObject);
begin
  CurrentEditor.FullExpand();
end;

procedure TfmMain.TBXItemUnfoldLineClick(Sender: TObject);
begin
  with CurrentEditor do
    ToggleCollapseChildren(CaretPos.Y);
end;

function TfmMain.IsPluginWindowActive(var HWnd: THandle): boolean;
var
  i: Integer;
begin
  Result:= false;
  HWnd:= 0;
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
      if (FDll<>0) and (FWindow<>0) and IsChild(FWindow, Windows.GetFocus) then
      begin
        HWnd:= FWindow;
        Result:= true;
        Exit
      end;
end;

procedure TfmMain.ecCollapseParentExecute(Sender: TObject);
begin
  MsgBeep;
  //EditorCollapseParentRange(CurrentEditor, CurrentEditor.CaretStrPos);
end;

procedure TfmMain.ecCollapseWithNestedExecute(Sender: TObject);
begin
  MsgBeep;
  //EditorCollapseWithNested(CurrentEditor, CurrentEditor.CaretPos.Y);
end;

procedure TfmMain.TBXItemFoldParentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CollapseParent);
end;

procedure TfmMain.TBXItemFoldWithNestedClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CollapseWithNested);
end;

procedure TfmMain.TBXItemFoldSelBlockClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smCollapseSelection);
end;

procedure TfmMain.TBXItemFoldNearestBlockClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smToggleCollapseNearest);
end;

procedure TfmMain.DoFindCommandFromString(const S: Widestring);
var
  Act: TSRAction;
  SText1, SText2: Widestring;
  Opt: TSearchOptions;
  Tok: TSearchTokens;
  OptBkmk, OptExtSel: boolean;
begin
  ReadFindOptions(S, Act, SText1, SText2, Opt, Tok, OptBkmk, OptExtSel);
  DoFindCommand(CurrentEditor, Act, SText1, SText2, Opt, Tok, OptBkmk, OptExtSel);
end;

function TfmMain.DoFindCommand(
  Ed: TSyntaxMemo;
  Act: TSRAction;
  const SText1, SText2: Widestring;
  const Opt: TSearchOptions;
  const Tok: TSearchTokens;
  OptBkmk, OptExtSel: boolean): Integer;
var
  _OptPrev: TSearchOptions;
  _TokPrev: TSearchTokens;
  _PrevSelStart, _PrevSelLength: Integer;
  _BeforePrev: TNotifyEvent;
  Ok: boolean;
begin
  _OptPrev:= Finder.Flags;
  _TokPrev:= Finder.Tokens;
  _BeforePrev:= Finder.OnBeforeExecute;

  Finder.FindText:= SText1;
  Finder.ReplaceText:= SText2;
  Finder.Flags:= Opt;
  Finder.Tokens:= Tok;
  Finder.OnBeforeExecute:= nil;
  Finder.OnCanAccept:= FinderCanAccept;
  Finder.Control:= Ed;

  if OptBkmk then
    Finder.OnFind:= FinderFind_WithBkmk
  else
    Finder.OnFind:= nil;

  _PrevSelStart:= Finder.Control.SelStart;
  _PrevSelLength:= Finder.Control.SelLength;

  case Act of
    arFindNext: Finder.FindAgain;
    arFindAll: Finder.FindAll;
    arFindInTabs: MsgError('Command "Find in all tabs" not supported in macros yet', Handle);
    arCount: Finder.CountAll;
    arSkip: Finder.FindAgain;
    arReplaceNext: Finder.ReplaceAgain;
    arReplaceAll: Finder.ReplaceAll;
    arReplaceAllInAll: MsgError('Command "Replace in all tabs" not supported in macros yet', Handle);
  end;
  Result:= Finder.Matches;

  //restote Finder
  Finder.OnBeforeExecute:= _BeforePrev;
  Finder.OnCanAccept:= nil;
  Finder.OnFind:= nil;
  Finder.Flags:= _OptPrev;
  Finder.Tokens:= _TokPrev;

  //post-find actions
  Ok:= Finder.Matches>0;
  if Ok then
  begin
    if OptExtSel and (Act in [arFindNext]) then
      EditorExtendSelectionByPosition(CurrentEditor,
        _PrevSelStart, _PrevSelLength,
        CurrentEditor.CaretStrPos, 0);

    if Assigned(fmSR) then
      EditorCheckCaretOverlappedByForm(Finder.Control, fmSR);
  end
  else
  begin
    //stop macro if not found
    ecMacroRecorder1.AtFileEnd:= true;
    ecMacroRecorder1.StopPlayback:= true;
  end;
end;

procedure TfmMain.ecSortAscendingExecute(Sender: TObject);
begin
  DoLinesCommand(scmdSortAsc);
end;

procedure TfmMain.ecSortDescendingExecute(Sender: TObject);
begin
  DoLinesCommand(scmdSortDesc);
end;

procedure TfmMain.ecSpToTabLeadingExecute(Sender: TObject);
begin
  DoLinesCommand(scmdSpacesToTabsLead);
end;

procedure TfmMain.TBXItemEToggleLineCommentAltClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ToggleLineCommentAlt);
end;

procedure TfmMain.ecToggleLineCommentAltExecute(Sender: TObject);
begin
  DoToggleLineComment(true);
end;

procedure TfmMain.TBXSubmenuItemCtxMorePopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  clip: boolean;
begin
  clip:= Clipboard.HasFormat(cf_text);
  TBXItemCtxPasteNoCurChange.Enabled:= clip;
  TBXItemCtxPasteToColumn1.Enabled:= clip;
end;

procedure TfmMain.TBXItemFoldRangesInSelClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smInSelCollapse);
end;

procedure TfmMain.TBXItemUnfoldRangesInSelClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smInSelExpand);
end;

procedure TfmMain.ecCommandsListExecute(Sender: TObject);
var
  Cmd: Integer;
begin
  Cmd:= DoShowCmdList;
  if Cmd<=0 then Exit;

  //command plugin selected?
  if Cmd>=cPyListBase then
  begin
    Dec(Cmd, cPyListBase);
    DoPyLoadPlugin(
      FPluginsCommand[Cmd].SFilename,
      FPluginsCommand[Cmd].SCmd);
  end
  else
  //lexer selected?
  if Cmd>=cLexListBase then
  begin
    Dec(Cmd, cLexListBase);
    Cmd:= Integer(FListLexersSorted.Objects[Cmd]);
    if (Cmd>=0) and (Cmd<SyntaxManager.AnalyzerCount) then
    begin
      CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.Analyzers[Cmd];
      UpdateLexerTo(CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer);
    end;
  end
  else
  //usual command selected
    CurrentEditor.ExecCommand(Cmd);
end;


function TfmMain.DoShowCmdListStr: string;
var
  Cmd: Integer;
begin
  Result:= '';
  Cmd:= DoShowCmdList;
  if Cmd>0 then
    Result:= 'cm:'+IntToStr(Cmd);
end;

function TfmMain.DoShowCmdList: Integer;
var
  i: Integer;
begin
  Result:= 0;

  with TfmMenuCmds.Create(Self) do
  try
    Caption:= DKLangConstW('zMCmdList');
    cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');
    //labHelp.Caption:= DKLangConstW('zMHelp');

    UpdateMacroKeynames;
    //1) add commands
    KeysList.Assign(SyntKeyMapping);

    //2) add command-plugins
    for i:= Low(FPluginsCommand) to High(FPluginsCommand) do
      with FPluginsCommand[i] do
        if SCaption<>'' then
          PyList.Add('Plugin: ' + SCaption + #9 + SHotkey);

    //3) add lexers
    FListLexersSorted.Clear;
    FListLexersSorted.Sorted:= true;
    for i:= 0 to SyntaxManager.AnalyzerCount-1 do
      if not SyntaxManager.Analyzers[i].Internal then
        FListLexersSorted.AddObject(SyntaxManager.Analyzers[i].LexerName, Pointer(i));
    for i:= 0 to FListLexersSorted.Count-1 do
      LexList.Add('Lexer: ' + FListLexersSorted[i]);

    FIniFN:= Self.SynHistoryIni;
    FColorSel:= opColorOutSelText;
    FColorSelBk:= opColorOutSelBk;

    if ShowModal=mrOk then
    begin
      if List.ItemIndex>=0 then
        Result:= Integer(List.Items.Objects[List.ItemIndex]);
    end;
  finally
    Free;
  end;
end;

procedure TfmMain.ecProjectListExecute(Sender: TObject);
var
  fn: Widestring;
  Files: TTntStringList;
  i: Integer;
begin
  if (fmProj=nil) or (fmProj.TreeProj.Items.Count<=1) then
  begin
    MsgWarn(DKLangConstW('zMProjEmpty'), Handle);
    Exit
  end;

  Files:= TTntStringList.Create;

  try
    for i:= 0 to fmProj.TreeProj.Items.Count-1 do
    begin
      fn:= fmProj.GetFN(fmProj.TreeProj.Items[i]);
      if fn<>'' then
        Files.Add(fn);
    end;
    if Files.Count=0 then
    begin
      MsgWarn(DKLangConstW('zMProjEmpty'), Handle);
      Exit
    end;

    fn:= '';
    with TfmMenuProj.Create(Self) do
    try
      Caption:= DKLangConstW('zMProjList');
      cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');
      //labHelp.Caption:= DKLangConstW('zMHelp');

      FIniFN:= Self.SynHistoryIni;
      fmProj:= Self.fmProj;
      FListFiles:= Files;
      FColorSel:= opColorOutSelText;
      FColorSelBk:= opColorOutSelBk;

      if ShowModal=mrOk then
      begin
        if List.ItemIndex>=0 then
          fn:= Files[Integer(List.Items.Objects[List.ItemIndex])];
      end;
    finally
      Free;
    end;
  finally
    FreeAndNil(Files);
  end;

  if fn<>'' then
    if IsFileExist(fn) then
    begin
      if IsFileText(fn) or MsgConfirmBinary(fn, Handle) then
        DoOpenFile(fn);
    end;
end;

procedure TfmMain.ApplyUrlClick;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
  begin
    FramesAll[i].HyperlinkHighlighter.Active:= opHiliteUrls;
    FramesAll[i].HyperlinkHighlighter.SingleClick:= opSingleClickURL;
  end;
end;

procedure TfmMain.ApplyCarets;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      CaretsEnabled:= opCaretsEnabled;
      CaretsGutterBand:= opCaretsGutterBand;
      CaretsGutterColor:= opColorCaretsGutter;
      CaretsIndicator:= opCaretsIndicator;

      //apply "Block caret"
      EditorSetCaretShape(EditorMaster, opCaretShape);
      EditorSetCaretShape(EditorSlave, opCaretShape);
    end;
end;

procedure TfmMain.TBXItemCaretsRemove1Click(Sender: TObject);
begin
  if not DoHandleEscapeActions then
    CurrentEditor.ExecCommand(sm_CaretsRemoveLeaveFirst);
end;

procedure TfmMain.TBXItemCaretsRemove2Click(Sender: TObject);
begin
  if not DoHandleEscapeActions then
    CurrentEditor.ExecCommand(sm_CaretsRemoveLeaveLast);
end;

procedure TfmMain.TBXItemCaretsFromSelLeftClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromSelLeft);
end;

procedure TfmMain.TBXItemCaretsFromSelRightClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromSelRight);
end;

procedure TfmMain.TBXItemCaretsFromSelClearClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromSelClear);
end;

procedure TfmMain.TBXItemCaretsExtUpLineClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendUpLine);
end;

procedure TfmMain.TBXItemCaretsExtDownLineClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendDownLine);
end;

procedure TfmMain.TBXItemCaretsExtUpPageClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendUpPage);
end;

procedure TfmMain.TBXItemCaretsExtDownPageClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendDownPage);
end;

procedure TfmMain.TBXItemCaretsExtUpEndClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendUpEnd);
end;

procedure TfmMain.TBXItemCaretsExtDownEndClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsExtendDownEnd);
end;

procedure TfmMain.TBXItemCaretsFromMarksLeftClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromMarksLeft);
end;

procedure TfmMain.TBXItemCaretsFromMarksRightClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromMarksRight);
end;

procedure TfmMain.TBXItemCaretsFromMarksClearClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CaretsFromMarksClear);
end;

procedure TfmMain.TBXItemEColumnClick(Sender: TObject);
begin
  ecEditColumn.Execute;
end;

procedure TfmMain.ecEditColumnExecute(Sender: TObject);
begin
  with CurrentEditor do
    if HaveSelection then
      if SelectMode <> msColumn then
        MsgWarn(DKLangConstW('vert'), Handle)
      else
        ExecCommand(sm_CaretsFromSelLeft);
end;

procedure TfmMain.ecDedupAllExecute(Sender: TObject);
begin
  DoLinesCommand(scmdDedupAll);
end;

procedure TfmMain.ecDedupAdjacentExecute(Sender: TObject);
begin
  DoLinesCommand(scmdDedupAdjacent);
end;

procedure TfmMain.TBXItemEDedupAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupsAll);
end;

procedure TfmMain.TBXItemEDedupAdjacentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupsAdjacent);
end;

procedure TfmMain.TBXItemTbDedupAdjacentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupsAdjacent);
end;

procedure TfmMain.TBXItemTbDedupAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupsAll);
end;

procedure TfmMain.TBXItemESortDialogClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SortDialog);
end;

procedure TfmMain.TBXItemESortAscClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSortAscending);
end;

procedure TfmMain.TBXItemESortDescClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSortDescending);
end;

procedure TfmMain.TBXItemTbSortDialogClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SortDialog);
end;

procedure TfmMain.TBXItemTbSortAscClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSortAscending);
end;

procedure TfmMain.TBXItemTbSortDescClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSortDescending);
end;

procedure TfmMain.TBXItemCCUpperClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smUpperCaseBlock);
end;

procedure TfmMain.TBXItemCCLowerClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smLowerCaseBlock);
end;

procedure TfmMain.TBXItemCCTitleClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smTitleCaseBlock);
end;

procedure TfmMain.TBXItemCCSentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSentCaseBlock);
end;

procedure TfmMain.TBXItemCCInvClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smToggleCaseBlock);
end;

procedure TfmMain.TBXItemECaseUpperClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smUpperCaseBlock);
end;

procedure TfmMain.TBXItemECaseLowerClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smLowerCaseBlock);
end;

procedure TfmMain.TBXItemECaseTitleClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smTitleCaseBlock);
end;

procedure TfmMain.TBXItemECaseSentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSentCaseBlock);
end;

procedure TfmMain.TBXItemECaseInvertClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smToggleCaseBlock);
end;

procedure TfmMain.TBXItemEAlignWithSepClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_AlignWithSeparator);
end;

procedure TfmMain.TBXItemERemBlanksClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveBlanks);
end;

procedure TfmMain.TBXItemEReduceBlanksClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ReduceBlanks);
end;

procedure TfmMain.TBXItemETrimLeadClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TrimLeading);
end;

procedure TfmMain.TBXItemETrimTrailClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TrimTrailing);
end;

procedure TfmMain.TBXItemETrimAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TrimAll);
end;

procedure TfmMain.TBXItemERemDupSpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupSpaces);
end;

procedure TfmMain.TBXItemETabToSpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ConvertTabsToSpaces);
end;

procedure TfmMain.TBXItemESpToTabClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ConvertSpacesToTabsAll);
end;

procedure TfmMain.TBXItemESpToTabLeadClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ConvertSpacesToTabsLeading);
end;

procedure TfmMain.TBXItemECenterLinesClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CenterLines);
end;

procedure TfmMain.ecAlignWithSepExecute(Sender: TObject);
begin
  DoLinesCommand(scmdAlignWithSep);
end;

procedure TfmMain.TBXItemEJoinClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_JoinLines);
end;

procedure TfmMain.TBXItemESplitClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SplitLines);
end;

procedure TfmMain.TBXItemECopyLineClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyLine);
end;

procedure TfmMain.TBXItemECutLineClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CutLine);
end;

procedure TfmMain.TBXItemECopyAppClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyAppend);
end;

procedure TfmMain.TBXItemECutAppClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CutAppend);
end;

procedure TfmMain.TBXItemEIndentClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smBlockIndent);
end;

procedure TfmMain.TBXItemEIndentLike1stClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_IndentLike1st);
end;

procedure TfmMain.TBXItemECommClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smCommentLines);
end;

procedure TfmMain.TBXItemEUncommClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smUncommentLines);
end;

procedure TfmMain.TBXItemHtmlEmmetExpandClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_Emmet_Expand);
end;

procedure TfmMain.TBXItemHtmlEmmetWrapClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_Emmet_Wrap);
end;

procedure TfmMain.TBXItemTabToggleSplitClick(Sender: TObject);
begin
  if Assigned(FClickedFrame) then
    FClickedFrame.ToggleSplitted;
end;

procedure TfmMain.TBXItemCtxCopyClick(Sender: TObject);
begin
  with CurrentEditor do
    if not HaveSelection then
    begin
      if opCopyLineIfNoSel then
        ExecCommand(sm_CopyLine)
      else
        MsgBeep;
    end
    else
      ExecCommand(smCopy);
end;

procedure TfmMain.TBXItemCtxCutClick(Sender: TObject);
begin
  with CurrentEditor do
    if not HaveSelection then
    begin
      if opCopyLineIfNoSel then
        ExecCommand(sm_CutLine)
      else
        MsgBeep;
    end
    else
      ExecCommand(smCut);
end;

procedure TfmMain.TBXItemCtxPasteClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smPaste);
end;

procedure TfmMain.TBXItemCtxDelClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smClearSelection);
end;

procedure TfmMain.TBXItemCtxSelectAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smSelectAll);
end;

procedure TfmMain.TBXItemERedoClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smRedo);
end;

procedure TfmMain.ecToggleShowGroup2Execute(Sender: TObject);
begin
  case Groups.Mode of
    gmOne: Groups.Mode:= gm2Horz;
    gm2Horz,
    gm2Vert: Groups.Mode:= gmOne;
  end;
end;

procedure TfmMain.DoAcpCommand;
var
  Ed: TSyntaxMemo;
  SText: Widestring;
begin
  PluginACP.Items.Clear;
  PluginACP.DisplayItems.Clear;

  if not opAcpForceText then
    SText:= DoAcpFromPlugins(cActionGetAutoComplete)
  else
    SText:= '';

  //Python plugin?
  //it must show popup by itself.
  if (SText=cPyNone) then //plugin didn't handle
    SText:= '';
  if (SText=cPyTrue) then //plugin did handle
    Exit;

  //binary plugin?
  //it must return completions here.
  if (SText<>'') then
  begin
    Ed:= CurrentEditor;
    PluginAction_SuggestCompletion(PWChar(SText), EditorWordLength(Ed), true);
    Exit
  end;

  //usual completion from name.acp file
  DoAcpPopup;
end;

procedure TfmMain.PluginACPAfterComplete(Sender: TObject;
  const Item: WideString);
begin
  //need to force parameter hint, it doesn't appear auto on plugin ACP
  if ParamCompletion.Enabled then
    ParamCompletion.Execute;
end;

procedure TfmMain.DoExtendSelection(Ed: TSyntaxMemo);
var
  Lex, Err: string;
begin
  if Ed.SyntObj=nil then
  begin
    DoHint('Extend selection: no lexer active');
    MsgBeep;
    Exit
  end;

  //we have two variants of code: for usual code (Pascal/C/PHP/etc) and for HTML/XML.
  //HTML/XML case is special, need precise jumps considering "<" and ">".
  Lex:= CurrentLexer;
  if IsLexerHTML(Lex) or IsLexerXML(Lex) then
  begin
    EditorExtendSelectionByLexer_HTML(Ed);
  end
  else
  begin
    EditorExtendSelectionByLexer_All(Ed, Err);
    if Err<>'' then
      begin DoHint(Err); MsgBeep; end;
  end
end;

procedure TfmMain.TBXItemSSelExtendClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SelectionExtend);
end;

procedure TfmMain.TBXItemTreeExpandAllClick(Sender: TObject);
begin
  DoTreeFocus;
  Tree.FullExpand;
  if Tree.Items.Count>0 then
  begin
    Tree.Selected:= Tree.Items[0];
    Tree.Selected.MakeVisible;
  end;
end;

procedure TfmMain.TBXItemTreeCollapseAllClick(Sender: TObject);
begin
  DoTreeFocus;
  Tree.FullCollapse;
end;

procedure TfmMain.DoTreeLevel(NLevel: Integer);
var
  i: Integer;
begin
  DoTreeFocus;
  with Tree do
  begin
    Items.BeginUpdate;
    try
      FullExpand;
      if Items.Count>0 then
      begin
        for i:= 0 to Items.Count-1 do
          if Items[i].Level >= NLevel then
            Items[i].Collapse(true);
        Selected:= Items[0];
        Selected.MakeVisible;
      end;
    finally
      Items.EndUpdate;
    end;
  end;
end;

procedure TfmMain.TBXItemTreeLevel2Click(Sender: TObject);
begin
  DoTreeLevel(2);
end;

procedure TfmMain.TBXItemTreeLevel3Click(Sender: TObject);
begin
  DoTreeLevel(3);
end;

procedure TfmMain.TBXItemTreeLevel4Click(Sender: TObject);
begin
  DoTreeLevel(4);
end;

procedure TfmMain.TBXItemTreeLevel5Click(Sender: TObject);
begin
  DoTreeLevel(5);
end;

procedure TfmMain.TBXItemTreeLevel6Click(Sender: TObject);
begin
  DoTreeLevel(6);
end;

procedure TfmMain.TBXItemTreeLevel7Click(Sender: TObject);
begin
  DoTreeLevel(7);
end;

procedure TfmMain.TBXItemTreeLevel8Click(Sender: TObject);
begin
  DoTreeLevel(8);
end;

procedure TfmMain.TBXItemTreeLevel9Click(Sender: TObject);
begin
  DoTreeLevel(9);
end;

procedure TfmMain.ecReverseLinesExecute(Sender: TObject);
begin
  DoLinesCommand(scmdReverse);
end;

procedure TfmMain.TBXItemEReverseClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ReverseLines);
end;

procedure TfmMain.ecShuffleLinesExecute(Sender: TObject);
begin
  DoLinesCommand(scmdShuffle);
end;

procedure TfmMain.TBXItemEShuffleClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ShuffleLines);
end;

procedure TfmMain.DoFoldLevel(NLevel: Integer);
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Ed.SyntObj=nil then
    begin DoHint('Fold level: no lexer active'); MsgBeep; Exit end;
  EditorFoldLevel(Ed, NLevel);
end;


procedure TfmMain.TBXItemFoldLevel2Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel2);
end;

procedure TfmMain.TBXItemFoldLevel3Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel3);
end;

procedure TfmMain.TBXItemFoldLevel4Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel4);
end;

procedure TfmMain.TBXItemFoldLevel5Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel5);
end;

procedure TfmMain.TBXItemFoldLevel6Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel6);
end;

procedure TfmMain.TBXItemFoldLevel7Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel7);
end;

procedure TfmMain.TBXItemFoldLevel8Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel8);
end;

procedure TfmMain.TBXItemFoldLevel9Click(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FoldLevel9);
end;

procedure TfmMain.TBXItemVCommClick(Sender: TObject);
begin
  DoToolbarCommentUncomment(true);
end;

procedure TfmMain.TBXItemVUncomClick(Sender: TObject);
begin
  DoToolbarCommentUncomment(false);
end;

procedure TfmMain.DoToolbarCommentUncomment(AComment: boolean);
var
  Lex: string;
  Cmd: Integer;
begin
  //this code is to call "Toggle stream comment" for HTML and CSS.
  //on other lexs it should call default commands "Comment lines"/"Uncomment lines"
  Lex:= CurrentLexer;
  if IsLexerHTML(Lex) or IsLexerCSS(Lex) then
    CurrentEditor.ExecCommand(sm_ToggleStreamComment)
  else
  begin
    Cmd:= IfThen(AComment, smCommentLines, smUncommentLines);
    if ecCommentLines.Enabled then
      CurrentEditor.ExecCommand(Cmd)
    else
      MsgBeep;
  end;
end;

{
function TfmMain.DockTypeToName(Typ: TSynDock): string;
begin
  case Typ of
    sdockTop: Result:= TbxDockTop.Name;
    sdockLeft: Result:= TbxDockLeft.Name;
    sdockRight: Result:= TbxDockRight.Name;
    sdockBottom: Result:= TbxDockBottom.Name;
    else raise Exception.Create('Unknown dock type');
  end;
end;
}

procedure TfmMain.LoadToolbarProp(
  Toolbar: TSpTbxToolbar;
  Ini: TCustomIniFile;
  const Id: string);
var
  ADockStr: string;
  ADock: TTBDock;
begin
  Toolbar.Visible:= Ini.ReadBool('Menu', 'tb'+Id+'Vis', Toolbar.Visible);

  if Toolbar.CurrentDock<>nil then
    ADockStr:= Toolbar.CurrentDock.Name
  else
    ADockStr:= '';
  ADockStr:= Ini.ReadString('Menu', 'tb'+Id, ADockStr);

  try
    ADock:= Self.FindComponent(ADockStr) as TTBDock;
    //work for incorrect ini setting (cannot place toolbar on MultiDock)
    if ADock=TbxDockLeft then ADock:= TbxDockLeft1 else
     if ADock=TbxDockRight then ADock:= TbxDockRight1 else
      if ADock=TbxDockBottom then ADock:= TbxDockBottom1;

    Toolbar.CurrentDock:= ADock;
    Toolbar.DockPos:= Ini.ReadInteger('Menu', 'tb'+Id+'Pos', Toolbar.DockPos);
    Toolbar.DockRow:= Ini.ReadInteger('Menu', 'tb'+Id+'Row', Toolbar.DockRow);
  except
    MsgWarn(WideFormat('Cannot dock toolbar "%s" on "%s"', [Id, ADockStr]), Handle);
  end;
end;

procedure TfmMain.SaveToolbarProp(
  Toolbar: TSpTbxToolbar;
  Ini: TCustomIniFile;
  const Id: string);
begin
  Ini.WriteBool('Menu', 'tb'+Id+'Vis', Toolbar.Visible);
  if Toolbar.CurrentDock<>nil then
    Ini.WriteString('Menu', 'tb'+Id, Toolbar.CurrentDock.Name);
  Ini.WriteInteger('Menu', 'tb'+Id+'Pos', Toolbar.DockPos);
  Ini.WriteInteger('Menu', 'tb'+Id+'Row', Toolbar.DockRow);
end;

procedure TfmMain.SavePanelProp(
  Panel: TSpTbxDockablePanel;
  Ini: TCustomIniFile;
  const Id: string);
begin
  try
    with Panel do
    begin
      Ini.WriteBool('pl'+Id, 'Vis', Visible);
      if CurrentDock<>nil then
        Ini.WriteString('pl'+Id, 'Dock', CurrentDock.Name);

      Ini.WriteInteger('pl'+Id, 'DW', Width);
      Ini.WriteInteger('pl'+Id, 'DH', Height);
      Ini.WriteInteger('pl'+Id, 'DPos', DockPos);
      Ini.WriteInteger('pl'+Id, 'DRow', DockRow);
      Ini.WriteBool('pl'+Id, 'Fl', Floating);
      Ini.WriteInteger('pl'+Id, 'FlW', FloatingClientWidth);
      Ini.WriteInteger('pl'+Id, 'FlH', FloatingClientHeight);
      Ini.WriteInteger('pl'+Id, 'FlX', FloatingPosition.X);
      Ini.WriteInteger('pl'+Id, 'FlY', FloatingPosition.Y);
    end;
  except
  end;
end;

procedure TfmMain.LoadPanelProp(
  Panel: TSpTbxDockablePanel;
  Ini: TCustomIniFile;
  const Id: string;
  DefFloating: boolean = false);
var
  p: TPoint;
  ADockStr: string;
  ADock: TTBDock;
begin
  with Panel do
  begin
    if not QuickView then
    begin
      Visible:= Ini.ReadBool('pl'+Id, 'Vis', Visible);
      if Assigned(Panel.OnVisibleChanged) then
        Panel.OnVisibleChanged(Self);
    end;

    if CurrentDock<>nil then
      ADockStr:= CurrentDock.Name
    else
      ADockStr:= '';
    ADockStr:= Ini.ReadString('pl'+Id, 'Dock', ADockStr);

    try
      ADock:= Self.FindComponent(ADockStr) as TTBDock;
      CurrentDock:= ADock;
    except
      MsgWarn(WideFormat('Cannot dock panel "%s" on "%s"', [Id, ADockStr]), Handle);
    end;

    DockPos:= Ini.ReadInteger('pl'+Id, 'DPos', DockPos);
    DockRow:= Ini.ReadInteger('pl'+Id, 'DRow', DockRow);

    Width:= Ini.ReadInteger('pl'+Id, 'DW', Width);
    Height:= Ini.ReadInteger('pl'+Id, 'DH', Height);
    Floating:= Ini.ReadBool('pl'+Id, 'Fl', DefFloating);
    FloatingClientWidth:= Ini.ReadInteger('pl'+Id, 'FlW', FloatingClientWidth);
    FloatingClientHeight:= Ini.ReadInteger('pl'+Id, 'FlH', FloatingClientHeight);
    p.X:= Ini.ReadInteger('pl'+Id, 'FlX', FloatingPosition.X);
    p.Y:= Ini.ReadInteger('pl'+Id, 'FlY', FloatingPosition.Y);
    FloatingPosition:= p;
  end;
end;

procedure TfmMain.TBXItemTUser1Click(Sender: TObject);
begin
  with tbUser1 do
    Visible:= not Visible;
  UpdateStatusbar;
  SaveToolbarsProps;
end;

procedure TfmMain.TBXItemTUser2Click(Sender: TObject);
begin
  with tbUser2 do
    Visible:= not Visible;
  UpdateStatusbar;
  SaveToolbarsProps;
end;

procedure TfmMain.TBXItemTUser3Click(Sender: TObject);
begin
  with tbUser3 do
    Visible:= not Visible;
  UpdateStatusbar;
  SaveToolbarsProps;
end;

procedure TfmMain.DoCustomizeAndReloadToolbar(Id: TSynUserToolbarId);
var
  ToolbarObj: TComponent;
  ToolbarId: string;
begin
  case Id of
    synToolbar1: begin ToolbarObj:= tbUser1; ToolbarId:= '1'; end;
    synToolbar2: begin ToolbarObj:= tbUser2; ToolbarId:= '2'; end;
    synToolbar3: begin ToolbarObj:= tbUser3; ToolbarId:= '3'; end;
    else
      raise Exception.Create('Unknown toolbar id: '+IntToStr(Ord(Id)));
  end;

  if DoCustomizeToolbar(ToolbarId) then
  begin
    LoadToolbarContent(ToolbarObj, ToolbarId, true);
    UpdateStatusbar;
    DoRepaint;
  end;
end;

procedure TfmMain.TBXItemOToolbar1Click(Sender: TObject);
begin
  DoCustomizeAndReloadToolbar(synToolbar1);
end;

procedure TfmMain.TBXItemOToolbar2Click(Sender: TObject);
begin
  DoCustomizeAndReloadToolbar(synToolbar2);
end;

procedure TfmMain.TBXItemOToolbar3Click(Sender: TObject);
begin
  DoCustomizeAndReloadToolbar(synToolbar3);
end;

function TfmMain.DoCustomizeToolbar(const Id: string): boolean;
var
  Dir: string;
begin
  with TIniFile.Create(SynHistoryIni) do
  try
    Dir:= ReadString('Win', 'ImagesDir', '');
    Result:= DoShowToolbarProp(
      SynToolbarsIni,
      Id,
      DoShowCmdListStr,
      DoShowCmdHint,
      DoEnumExtTools,
      DoEnumPyTools,
      0, 0,
      Dir);
    WriteString('Win', 'ImagesDir', Dir);
  finally
    Free
  end;
end;

function TfmMain.DoShowCmdHint(Cmd: Widestring): Widestring;
var
  N, i: Integer;
begin
  Result:= '';
  if Cmd='-' then Exit;

  if SBegin(Cmd, 'cm:') then
  begin
    SDeleteToW(Cmd, ':');
    N:= StrToIntDef(Cmd, 0);
    if N=0 then Exit;

    for i:= 0 to SyntKeyMapping.Items.Count-1 do
      with SyntKeyMapping.Items[i] do
        if Command = N then
        begin
          Result:= Category + ': ' + DisplayName;
          Exit
        end;
  end
  else
    Result:= Cmd;
end;

procedure TfmMain.LoadToolbarContent(Toolbar: TObject; Id: string; AutoShow: boolean = false);
var
  Item: TTbCustomItem;
  i: Integer;
  SCmd, SHint, SIcoFN, SIni, S: Widestring;
  IcoLoaded, IsSubmenu, IsEmpty, IsSep: boolean;
  ImgList: TPngImageList;
begin
  if Toolbar is TSpTbxToolbar then
  begin
    (Toolbar as TSpTbxToolbar).Items.Clear;
    ImgList:= (Toolbar as TSpTbxToolbar).Images as TPngImageList;
  end
  else
  if Toolbar is TSpTbxSubmenuItem then
  begin
    (Toolbar as TSpTbxSubmenuItem).Clear;
    ImgList:= (Toolbar as TSpTbxSubmenuItem).Images as TPngImageList;
  end
  else
    raise Exception.Create('Unknown toolbar class');

  SIni:= SynToolbarsIni;
  with TIniFile.Create(SIni) do
  try
    //Toolbar.Caption:= UTF8Decode(ReadString(IntToStr(NIndex), 'cap', ''));
    if Toolbar is TSpTbxToolbar then
    begin
      ImgList.Width:= ReadInteger(Id, 'ix', 32);
      ImgList.Height:= ReadInteger(Id, 'iy', 32);
    end;

    for i:= 0 to High(TToolbarProps) do
    begin
      SCmd:= UTF8Decode(ReadString(Id, IntToStr(i)+'c', ''));
      SHint:= UTF8Decode(ReadString(Id, IntToStr(i)+'h', ''));
      SIcoFN:= UTF8Decode(ReadString(Id, IntToStr(i)+'i', ''));
      SReplaceAllW(SIcoFN, '{ini}', ExtractFileDir(SIni));

      if (SCmd='') and (SHint='') and (SIcoFN='') then Break;
      IcoLoaded:= false;
      IsSep:= SCmd='-';
      IsSubmenu:= SBegin(SCmd, 'm:');

      if IsSep then
      //create separator
      begin
        Item:= TSpTbxSeparatorItem.Create(Self);
      end
      else
      //create submenu
      if IsSubmenu then
      begin
        Item:= TSpTbxSubmenuItem.Create(Self);
        if SCmd='m:{recent}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemFRecents;
        end
        else
        if SCmd='m:{new}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemFNew;
        end
        else
        if SCmd='m:{sess}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemSess;
        end
        else
        if SCmd='m:{colors}' then
        begin
          Item.LinkSubitems:= TbxSubmenuItemRecentColors;
        end
        else
        if SCmd='m:{enc-chg}' then
        begin
          Item.LinkSubitems:= TBXSubmenuEnc;
        end
        else
        if SCmd='m:{enc-conv}' then
        begin
          Item.LinkSubitems:= TBXSubmenuEnc2;
        end
        else
        if SCmd='m:{folding}' then
        begin
          Item.LinkSubitems:= PopupFoldLevel.Items;
        end
        else
        if SCmd='m:{foldlevel}' then
        begin
          Item.LinkSubitems:= TBXSubmenuFoldLevel;
        end
        else
        if SCmd='m:{nonprint}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemNonPrint;
        end
        else
        if SCmd='m:{tidy}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemTidy;
        end
        else
        if SCmd='m:{conv}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemConv;
        end
        else
        if SCmd='m:{projects}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemProjRecents;
        end
        else
        if SCmd='m:{plugins}' then
        begin
          Item.LinkSubitems:= TBXSubmenuItemPlugins;
        end
        else
        if SCmd='m:{projtools}' then
        begin
          Item.LinkSubitems:= TbxSubmenuItemProjTools;
        end
        else
        begin
          FUserToolbarCommands.Add(SCmd);
          Item.Tag:= FUserToolbarCommands.Count-1;
        end;
        Item.Images:= ImgList; //inherit ImageList
        Item.Options:= [tboDropdownArrow];
        Item.OnSelect:= ButtonOnSelect;
        IcoLoaded:= LoadPngIconEx(ImgList, SIcoFN);
      end
      else
      //create usual command item
      begin
        Item:= TSpTbxItem.Create(Self);
        FUserToolbarCommands.Add(SCmd);
        Item.Enabled:= SCmd<>'';
        Item.Tag:= FUserToolbarCommands.Count-1;
        Item.OnClick:= ToolbarUserClick;
        Item.OnSelect:= ButtonOnSelect;
        IcoLoaded:= LoadPngIconEx(ImgList, SIcoFN);

        //add Action to "options" buttons, so toggling will check/uncheck these buttons
        S:= SCmd;
        SDeleteToW(S, ':');
        case StrToIntDef(S, 0) of
          sm_OptReadOnly:        Item.Action:= ecReadOnly;
          sm_OptWrap:            Item.Action:= ecWrap;
          sm_OptShowLeftPanel:   Item.Action:= ecShowTree;
          sm_OptShowOutputPanel: Item.Action:= ecShowOut;
          sm_OptShowRightPanel:  Item.Action:= ecShowClip;
          sm_ShowFullScreen:     Item.Action:= ecFullScr;
          sm_OptRuler:           Item.Action:= ecRuler;
          sm_OptLineNums:        Item.Action:= ecLineNums;
          sm_OptFolding:         Item.Action:= ecFolding;

          sm_OptNonPrint:       Item.Action:= ecNonPrint;
          sm_OptNonPrintOff:    Item.Action:= ecNonPrintOff;
          sm_OptNonPrintSpaces: Item.Action:= ecNonPrintSpaces;
          sm_OptNonPrintEol:    Item.Action:= ecNonPrintEol;
          sm_OptNonPrintBoth:   Item.Action:= ecNonPrintBoth;
          sm_OptNonPrintEolDetails: Item.Action:= ecNonPrintEolDetails;

          sm_ToggleSmartHl:   Item.Action:= ecSmartHl;
          sm_ShowOnTop:       Item.Action:= ecOnTop;
          sm_SpellLive:       Item.Action:= ecSpellLive;
          sm_SyncScrollHorz:  Item.Action:= ecSyncScrollH;
          sm_SyncScrollVert:  Item.Action:= ecSyncScrollV;
        end;
      end;

      //handle "*" at end of hint
      if (SHint<>'') and (SHint[Length(SHint)]='*') then
      begin
        SetLength(SHint, Length(SHint)-1);
        Item.DisplayMode:= nbdmImageAndText;
      end;
      //set caption and hint last
      Item.Hint:= SHint;
      if Item is TSpTbxItem then
        (Item as TSpTbxItem).Caption:= SHint;

      //now add ready button to toolbar or submenu
      if Toolbar is TSpTbxToolbar then
      begin
        (Toolbar as TSpTbxToolbar).Items.Add(Item);
        if IcoLoaded then
          (Toolbar as TSpTbxToolbar).Items[(Toolbar as TSpTbxToolbar).Items.Count-1].ImageIndex:= ImgList.Count-1;
      end
      else
      if Toolbar is TSpTbxSubmenuItem then
      begin
        (Toolbar as TSpTbxSubmenuItem).Add(Item);
        if IcoLoaded then
          (Toolbar as TSpTbxSubmenuItem).Items[(Toolbar as TSpTbxSubmenuItem).Count-1].ImageIndex:= ImgList.Count-1;
      end;

      //load submenu contents
      if IsSubmenu then
        LoadToolbarContent(Item, SCmd);
    end;
  finally
    Free
  end;

  if Toolbar is TSpTbxToolbar then
    IsEmpty:= (Toolbar as TSpTbxToolbar).Items.Count=0
  else
  {
  if Toolbar is TSpTbxSubmenuItem then
    IsEmpty:= (Toolbar as TSpTbxSubmenuItem).Count=0
  else
    }
    IsEmpty:= false;

  if Toolbar is TControl then
  if IsEmpty then
    (Toolbar as TControl).Visible:= false
  else
  if AutoShow then
  begin
    (Toolbar as TControl).Visible:= true;
    SaveToolbarsProps;
  end;
end;

procedure TfmMain.ToolbarUserClick(Sender: TObject);
var
  Cmd: Widestring;
  PyFile, PyCmd: Widestring;
  NCmd, i: Integer;
begin
  NCmd:= (Sender as TSpTbxItem).Tag;
  if not ((NCmd>=0) and (NCmd<FUserToolbarCommands.Count)) then
    begin MsgBeep; Exit end;
  Cmd:= FUserToolbarCommands[NCmd];

  //run internal command
  if SBegin(Cmd, 'cm:') then
  begin
    SDeleteToW(Cmd, ':');
    NCmd:= StrToIntDef(Cmd, 0);
    if NCmd<=0 then begin MsgBeep; Exit end;
    CurrentEditor.ExecCommand(NCmd);
  end
  else
  //run external tool
  if SBegin(Cmd, 'ext:') then
  begin
    SDeleteToW(Cmd, ':');
    for i:= Low(opTools) to High(opTools) do
      if opTools[i].ToolCaption=Cmd then
      begin
        RunTool(opTools[i]);
        Exit
      end;
    MsgError(WideFormat(DKLangConstW('MRun'), [Cmd]), Handle);
  end
  else
  //run py-plugin
  if SBegin(Cmd, 'py:') then
  begin
    PyCmd:= Cmd;
    PyFile:= SGetItem(PyCmd, '/');
    DoPyLoadPlugin(
      PyFile,
      PyCmd);
  end;
end;

procedure TfmMain.DoEnumExtTools(L: TTntStringList);
var
  i: Integer;
begin
  for i:= Low(opTools) to High(opTools) do
    with opTools[i] do
      if ToolCaption<>'' then
        L.Add(ToolCaption);
end;

procedure TfmMain.DoEnumPyTools(L: TTntStringList);
var
  i: Integer;
  S: Widestring;
begin
  for i:= Low(FPluginsCommand) to High(FPluginsCommand) do
    with FPluginsCommand[i] do
      if SFileName<>'' then
      begin
        S:= SFileName + '/' + SCmd;
        if SBegin(S, cPyPrefix) then
          Delete(S, 1, Length(cPyPrefix));
        L.Add(S);
      end;
end;

procedure TfmMain.ecExtractDupsCaseExecute(Sender: TObject);
begin
  DoLinesCommand(scmdExtractDupsCase);
end;

procedure TfmMain.ecExtractDupsNoCaseExecute(Sender: TObject);
begin
  DoLinesCommand(scmdExtractDupsNoCase);
end;

procedure TfmMain.TBXItemEExtractDupCaseClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ExtractDupsCase);
end;

procedure TfmMain.TBXItemEExtractDupNoCaseClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ExtractDupsNoCase);
end;

procedure TfmMain.ecNonPrintSpacesExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    NonPrinted.Visible:= true;
    NonPrintedSpaces:= true;
    NonPrintedEol:= false;
    Invalidate;
  end;
  UpdateStatusBar;
end;

procedure TfmMain.ecNonPrintEolExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    NonPrinted.Visible:= true;
    NonPrintedSpaces:= false;
    NonPrintedEol:= true;
    Invalidate;
  end;
  UpdateStatusBar;
end;

procedure TfmMain.ecNonPrintBothExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    NonPrinted.Visible:= true;
    NonPrintedSpaces:= true;
    NonPrintedEol:= true;
    Invalidate;
  end;
  UpdateStatusBar;
end;

procedure TfmMain.TBXItemCtxPasteAsColumnClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_PasteAsColumnBlock);
end;

procedure TfmMain.TBXItemCtxPasteBkmkLinesClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_BookmarksPaste);
end;

procedure TfmMain.ecNonPrintEolDetailsExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    NonPrintedEolDetails:= not NonPrintedEolDetails;
    Invalidate;
  end;
  UpdateStatusBar;
end;

procedure TfmMain.InitMenuItemsList;
begin
  SetLength(FMenuItems, 19);
  //
  with FMenuItems[0] do begin Id:= 'file'; Item:= TbxSubmenuItemFile; end;
  with FMenuItems[1] do begin Id:= 'edit'; Item:= TbxSubmenuItemEd; end;
  with FMenuItems[2] do begin Id:= 'search'; Item:= TbxSubmenuItemSr; end;
  with FMenuItems[3] do begin Id:= 'encoding'; Item:= TbxSubmenuItemEnc; end;
  with FMenuItems[4] do begin Id:= 'bookmarks'; Item:= TbxSubmenuItemBk; end;
  with FMenuItems[5] do begin Id:= 'run'; Item:= TbxSubmenuItemRun; end;
  with FMenuItems[6] do begin Id:= 'html'; Item:= TbxSubmenuItemHTML; end;
  with FMenuItems[7] do begin Id:= 'macros'; Item:= TbxSubmenuItemMacros; end;
  with FMenuItems[8] do begin Id:= 'options'; Item:= TbxSubmenuItemOpt; end;
  with FMenuItems[9] do begin Id:= 'view'; Item:= TbxSubmenuItemView; end;
  with FMenuItems[10] do begin Id:= 'window'; Item:= TbxSubmenuItemWindow; end;
  with FMenuItems[11] do begin Id:= 'help'; Item:= TbxSubmenuItemHelp; end;
  //
  with FMenuItems[12] do begin Id:= 'g'; Item:= TBXSubmenuItemGroups; end;
  with FMenuItems[13] do begin Id:= 'x'; Item:= TbxItemMenuX; end;
  with FMenuItems[14] do begin Id:= 'xx'; Item:= TbxItemMenuXX; end;
  //
  with FMenuItems[15] do begin Id:= 'toolbar-file'; Item:= tbFile; end;
  with FMenuItems[16] do begin Id:= 'toolbar-edit'; Item:= tbEdit; end;
  with FMenuItems[17] do begin Id:= 'toolbar-view'; Item:= tbView; end;
  with FMenuItems[18] do begin Id:= 'context'; Item:= PopupEditor; end;
end;

procedure TfmMain.TBXItemOHideItemsClick(Sender: TObject);
begin
  DoConfigHideItems;
end;

procedure TfmMain.DoConfigHideItems;
const
  cSep: Widestring = '———';
  cSub: Widestring = '  >>';
var
  i, j: Integer;
  Item: TComponent;
  Id, S: Widestring;
begin
  with TfmHideItems.Create(nil) do
  try
    FIniFN:= SynHideIni;
    for i:= Low(FMenuItems) to High(FMenUItems) do
    begin
      Item:= FMenuItems[i].Item;
      Id:= FMenuItems[i].Id;

      //is it toolbar?
      if Item is TSpTbxToolbar then
      begin
        for j:= 0 to (Item as TSpTbxToolbar).Items.Count-1 do
        begin
          S:= (Item as TSpTbxToolbar).Items[j].Caption;
          S:= SStripFromTab(S);
          if (Item as TSpTbxToolbar).Items[j] is TSpTbxSeparatorItem then
            S:= cSep;
          if (Item as TSpTbxToolbar).Items[j] is TSpTbxSubmenuItem then
            S:= S+cSub;
          List.Items.Add('['+id+' '+IntToStr(j)+']  '+S);
        end;
      end
      else
      //is it context menu?
      if Item is TSpTbxPopupMenu then
      begin
        for j:= 0 to 14{max index is of "More..." item} do
        begin
          S:= (Item as TSpTbxPopupMenu).Items[j].Caption;
          SDeleteFromW(S, #9);
          if (Item as TSpTbxPopupMenu).Items[j] is TSpTbxSeparatorItem then
            S:= cSep;
          if (Item as TSpTbxPopupMenu).Items[j] is TSpTbxSubmenuItem then
            S:= S+cSub;
          List.Items.Add('['+id+' '+IntToStr(j)+']  '+S);
        end;
      end
      else
      if Item is TSpTbxSubmenuItem then
      begin
        //menu item
        S:= (Item as TSpTbxSubmenuItem).Caption;
        SReplaceAllW(S, '&', '');
        List.Items.Add('['+id+']  '+S);
        //subitems (not for "window" item)
        if id<>'window' then
        for j:= 0 to (Item as TSpTbxSubmenuItem).Count-1 do
        begin
          S:= (Item as TSpTbxSubmenuItem).Items[j].Caption;
          S:= SStripFromTab(S);
          SReplaceAllW(S, '&', '');
          if (Item as TSpTbxSubmenuItem).Items[j] is TSpTbxSeparatorItem then
            S:= cSep;
          if (Item as TSpTbxSubmenuItem).Items[j] is TSpTbxSubmenuItem then
            S:= S+cSub;
          List.Items.Add('    '+'['+id+' '+IntToStr(j)+']  '+S);
        end;
      end
      else
      if Item is TSpTbxItem then
      begin
        List.Items.Add('['+Id+']');
      end
      else
      begin
        MsgError('Unknown item type: '+Id, Handle);
        Exit
      end;
      //separator
      List.Items.Add('');
    end;

    if ShowModal=mrOk then
      begin end;
  finally
    Free
  end;
end;

procedure TfmMain.TBXItemOEditSynIniClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_EditSynIni);
end;

procedure TfmMain.acOpenBySelectionExecute(Sender: TObject);
begin
  DoOpenBySelection;
end;

function TfmMain.opMarkDeletedAsModified: boolean;
begin
  Result:= Bool(SynHiddenOption('MarkDeletedModified', 1));
end;

procedure TfmMain.ApplyTabOptions;
var
  i: Integer;
begin
  Groups.SetTabFont(ToolbarFont);
  if opTabFontSize>0 then
    Groups.SetTabOption(tabOptionFontSize, opTabFontSize);

  Groups.SetTabOption(tabColorFont, opColorTabText);
  Groups.SetTabOption(tabColorActive, opColorTabBgActive);
  Groups.SetTabOption(tabColorPassive, opColorTabBgPassive);
  Groups.SetTabOption(tabColorPassiveOver, opColorTabBgPassiveOver);
  Groups.SetTabOption(tabColorBorderActive, opColorTabBorderActive);
  Groups.SetTabOption(tabColorBorderPassive, opColorTabBorderPassive);

  Groups.SetTabOption(tabOptionShowTabs, Ord(opTabVisible));
  Groups.SetTabOption(tabOptionShowXButtons, Ord(opTabBtn));
  Groups.SetTabOption(tabOptionShowPlus, Ord(opTabPlus));
  Groups.SetTabOption(tabOptionShowNums, Ord(opTabNums));
  Groups.SetTabOption(tabOptionBottomTabs, Ord(opTabAtBottom));
  Groups.SetTabOption(tabOptionDragDrop, Ord(opTabDragDrop));
  Groups.SetTabOption(tabOptionWidthMax, Ord(opTabMaxWidth));

  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      DoTitleChanged;
    end;

  //splitter popup menu
  {
  UpdKey(Groups.SplitterPopupMenu.Items[0] as TSpTbxItem, sm_Split2080);
  UpdKey(TBXItemSp30, sm_Split3070);
  UpdKey(TBXItemSp40, sm_Split4060);
  UpdKey(TBXItemSp50, sm_Split5050);
  UpdKey(TBXItemSp60, sm_Split6040);
  UpdKey(TBXItemSp70, sm_Split7030);
  UpdKey(TBXItemSp80, sm_Split8020);
  }
end;

procedure TfmMain.FixSplitters;
begin
  SplitterBottom.Top:= 0;
  SplitterLeft.Left:= ClientWidth;
  SplitterRight.Left:= 0;

  TbxDockLeft1.Left:= SplitterLeft.Left+4;
  TbxDockRight1.Left:= 0;

  SplitterBottom.Visible:= TbxDockBottom.Height>0;
  SplitterLeft.Visible:= TbxDockLeft.Width>0;
  SplitterRight.Visible:= TbxDockRight.Width>0;
end;

procedure TfmMain.StatusItemCaretClick(Sender: TObject);
begin
  ecGoto.Execute;
end;

procedure TfmMain.StatusItemEncClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupStatusEnc.Popup(X, Y);
end;

procedure TfmMain.StatusItemEndsClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupStatusLineEnds.Popup(X, Y);
end;

procedure TfmMain.StatusItemLexerClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupLexers.Popup(X, Y);
end;

procedure TfmMain.StatusItemCharClick(Sender: TObject);
begin
   with CurrentEditor do
     if not ReadOnly then
       ExecCommand(smSelCharacter);
end;

procedure TfmMain.StatusItemROClick(Sender: TObject);
begin
  ecReadOnly.Execute;
end;

procedure TfmMain.StatusItemWrapClick(Sender: TObject);
begin
  ecWrap.Execute;
end;

procedure TfmMain.StatusItemSelModeClick(Sender: TObject);
begin
  with CurrentEditor do
    case SelectModeDefault of
      msNone,
      msNormal: SelectModeDefault:= msColumn;
      msColumn: SelectModeDefault:= msLine;
      msLine: SelectModeDefault:= msNormal;
    end;
end;

procedure TfmMain.StatusItemInsModeClick(Sender: TObject);
begin
  with CurrentEditor do
    ReplaceMode:= not ReplaceMode;
end;

procedure TfmMain.StatusItemZoomClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupZoom.Popup(X, Y);
end;

procedure TfmMain.TBXTabColorGetColor(Sender: TObject; ACol, ARow: Integer;
  var Color: TColor; var Name: WideString);
begin
  Color:= opTabColors[ACol + ARow * 5];
  Name:= SColorToHtmlCode(Color);
end;

procedure TfmMain.TBXTabColorCellClick(Sender: TObject; ACol,
  ARow: Integer; var Allow: Boolean);
begin
  DoSetTabColorIndex(ACol + ARow * 5 + 1);
end;

procedure TfmMain.StatusItemCaretDrawHint(Sender: TObject;
  AHintBitmap: TBitmap; var AHint: WideString; var PaintDefault: Boolean);
begin
  //update statusbar hint
  AHint:= SStatusHint(FCurrSelState);
  ecTextOut(AHintBitmap.Canvas, 2, 2, AHint);
end;

procedure TfmMain.TBXSubmenuItemFRecentsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  i: Integer;
begin
  with TBXMRUListItemFRecents do
  begin
    Clear;
    for i:= SynMruFiles.Items.Count-1 downto 0 do
      MRUAdd(SynMruFiles.Items[i]);
  end;

  //fix too big menuitems height
  FixMruBigImageList(TBXMRUListItemFRecents);
  FixMenuBigImageList(TbxSubmenuItemFRecents);
end;

procedure TfmMain.TBXSubmenuItemSessPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  i: Integer;
begin
  with TBXMRUListItem_Sess do
  begin
    Clear;
    for i:= SynMruSessions.Items.Count-1 downto 0 do
      MRUAdd(SynMruSessions.Items[i]);
  end;
end;

function TfmMain.SynSkinsDir: string;
begin
  Result:= SynDir + 'template\skins';
end;

function TfmMain.SynSnippetsDir: string;
begin
  Result:= SynDir + 'template\snippets';
end;

function TfmMain.SynPyDir: string;
begin
  //at the time of this call, SynDir not yet inited
  Result:= ExtractFilePath(ParamStr(0)) + 'Py';
end;

function TfmMain.SynSkinFilename(const Name: string): string;
begin
  Result:= SynSkinsDir + '\' + Copy(Name, 2, MaxInt) + '.skn';
end;

procedure TfmMain.DoColorsArrayApply(const C: TSynColors; Ed: TSyntaxMemo);
begin
  Ed.Font.Color:= C[0];
  Ed.Color:= C[1];
  Ed.DefaultStyles.CurrentLine.BgColor:= C[2];
  Ed.LineNumbers.Font.Color:= C[3];
  Ed.LineNumbers.UnderColor:= C[3];
  Ed.Gutter.Bands[1].Color:= C[4];
  Ed.Gutter.Bands[0].Color:= C[4];
  Ed.CollapseBreakColor:= C[5];
  Ed.Gutter.CollapsePen.Color:= C[6];
  Ed.Gutter.Bands[3].Color:= C[7];
  //Ed.Gutter.SeparatorColor:= C[8];
  Ed.DefaultStyles.SelectioMark.Font.Color:= C[9];
  Ed.DefaultStyles.SelectioMark.BgColor:= C[10];
  Ed.RightMarginColor:= C[11];
  Ed.HintProps.Font.Color:= C[12];
  Ed.HintProps.Color:= C[13];
  Ed.NonPrinted.Color:= C[14];
  Ed.StaplePen.Color:= C[15];
  //Ed.Gutter.Bands[1].GradientRight:= C[16];
  //Ed.Gutter.Bands[2].Color:= C[16];
  Tree.Font.Color:= C[17];
  Tree.Color:= C[18];
  Ed.HorzRuler.Font.Color:= C[19];
  Ed.HorzRuler.Color:= C[20];
  opColorTabBgPassive:= C[21];
  opColorTabBgActive:= C[22];
  opColorTabBgActive2:= C[23];
  Ed.DefaultStyles.SearchMark.Font.Color:= C[24];
  Ed.DefaultStyles.SearchMark.BgColor:= C[25];
  ListOut.Font.Color:= C[26];
  ListOut.Color:= C[27];
  TreeFind.Font.Color:= ListOut.Font.Color;
  TreeFind.Color:= ListOut.Color;
  opColorOutSelText:= C[28];
  opColorOutSelBk:= C[29];
  opColorOutRedText:= C[30];
  opColorOutRedSelText:= C[31];
  opColorOutHi:= C[32];
  //opColorBracket:= C[33];
  //opColorBracketBg:= C[34];
  opColorLink:= C[35];
  //opColorSplitViews:= C[36];
  Ed.DefaultStyles.CurrentLine.Font.Color:= C[37];
  Ed.LineStateDisplay.ModifiedColor:= C[38];
  Ed.LineStateDisplay.NewColor:= C[39];
  Ed.LineStateDisplay.SavedColor:= C[40];
  Ed.LineStateDisplay.UnchangedColor:= C[41];
  opColorTabText:= C[42];
  //opColorTabFontUnsav:= C[43];
  opColorBkmk:= C[44];
  opColorMap:= C[45];
  Ed.DefaultStyles.CollapseMark.Font.Color:= C[46];
  //opColorSplitSlave:= C[47];
  Ed.Gutter.Bands[2].Color:= C[48];
  opColorNonPrintedBG:= C[49];
  Ed.DefaultStyles.CollapseMark.BgColor:= C[50];
  Ed.SyncEditing.SyncRangeStyle.BgColor:= C[51];
  opColorMapMarks:= C[52];
  opColorCaretsGutter:= C[53];
  opColorAcpText:= C[54];
  opColorAcpBg:= C[55];
  opColorTabBgPassiveOver:= C[56];
  opColorTabBorderActive:= C[57];
  opColorTabBorderPassive:= C[58];

  //fonts
  Ed.Font.Assign(TemplateEditor.Font);
  Ed.HorzRuler.Font.Assign(TemplateEditor.HorzRuler.Font);
  Ed.LineNumbers.Font.Assign(TemplateEditor.LineNumbers.Font);
end;

procedure TfmMain.DoColorsArrayInit(var C: TSynColors);
begin
  opColorAcpText:= clWindowText;
  opColorAcpBg:= clWindow;
  opColorCaretsGutter:= clLtGray;
  opColorMapMarks:= clGreen;
  opColorBkmk:= RGB(200, 240, 200);
  opColorNonPrintedBG:= clSilver;

  opColorTabText:= clBlack;
  opColorTabBgActive:= clBtnFace;
  opColorTabBgActive2:= clBtnFace;
  opColorTabBgPassive:= $d8d8d8;
  opColorTabBgPassiveOver:= clLtGray;
  opColorTabBorderActive:= clLtGray;
  opColorTabBorderPassive:= clLtGray;

  opColorOutSelBk:= clDkGray;
  opColorOutSelText:= clHighlighttext;
  opColorOutRedText:= clNavy;
  opColorOutRedSelText:= clYellow;
  opColorOutHi:= clSkyBlue;

  opColorLink:= clBlue;
  opColorMap:= clSkyBlue;

  C[0]:= TemplateEditor.Font.Color;
  C[1]:= TemplateEditor.Color;
  C[2]:= TemplateEditor.DefaultStyles.CurrentLine.BgColor;
  C[3]:= TemplateEditor.LineNumbers.Font.Color;
  C[4]:= TemplateEditor.Gutter.Bands[1].Color;
  C[5]:= TemplateEditor.CollapseBreakColor;
  C[6]:= TemplateEditor.Gutter.CollapsePen.Color;
  C[7]:= TemplateEditor.Gutter.Bands[3].Color;
  //C[8]:= TemplateEditor.Gutter.SeparatorColor;
  C[9]:= TemplateEditor.DefaultStyles.SelectioMark.Font.Color;
  C[10]:= TemplateEditor.DefaultStyles.SelectioMark.BgColor;
  C[11]:= TemplateEditor.RightMarginColor;
  C[12]:= TemplateEditor.HintProps.Font.Color;
  C[13]:= TemplateEditor.HintProps.Color;
  C[14]:= TemplateEditor.NonPrinted.Color;
  C[15]:= TemplateEditor.StaplePen.Color;
  //C[16]:= TemplateEditor.Gutter.Bands[1].GradientRight;
  C[17]:= Tree.Font.Color;
  C[18]:= Tree.Color;
  C[19]:= TemplateEditor.HorzRuler.Font.Color;
  C[20]:= TemplateEditor.HorzRuler.Color;
  C[21]:= opColorTabBgPassive;
  C[22]:= opColorTabBgActive;
  C[23]:= opColorTabBgActive2;
  C[24]:= TemplateEditor.DefaultStyles.SearchMark.Font.Color;
  C[25]:= TemplateEditor.DefaultStyles.SearchMark.BgColor;
  C[26]:= ListOut.Font.Color;
  C[27]:= ListOut.Color;
  C[28]:= opColorOutSelText;
  C[29]:= opColorOutSelBk;
  C[30]:= opColorOutRedText;
  C[31]:= opColorOutRedSelText;
  C[32]:= opColorOutHi;
  //C[33]:= opColorBracket;
  //C[34]:= opColorBracketBg;
  C[35]:= opColorLink;
  //C[36]:= opColorSplitViews;
  C[37]:= TemplateEditor.DefaultStyles.CurrentLine.Font.Color;
  C[38]:= TemplateEditor.LineStateDisplay.ModifiedColor;
  C[39]:= TemplateEditor.LineStateDisplay.NewColor;
  C[40]:= TemplateEditor.LineStateDisplay.SavedColor;
  C[41]:= TemplateEditor.LineStateDisplay.UnchangedColor;
  C[42]:= opColorTabText;
  //C[43]:= opColorTabFontUnsav;
  C[44]:= opColorBkmk;
  C[45]:= opColorMap;
  C[46]:= TemplateEditor.DefaultStyles.CollapseMark.Font.Color;
  //C[47]:= opColorSplitSlave;
  C[48]:= TemplateEditor.Gutter.Bands[2].Color;
  C[49]:= opColorNonPrintedBG;
  C[50]:= TemplateEditor.DefaultStyles.CollapseMark.BgColor;
  C[51]:= TemplateEditor.SyncEditing.SyncRangeStyle.BgColor;
  C[52]:= opColorMapMarks;
  C[53]:= opColorCaretsGutter;
  C[54]:= opColorAcpText;
  C[55]:= opColorAcpBg;
  C[56]:= opColorTabBgPassiveOver;
  C[57]:= opColorTabBorderActive;
  C[58]:= opColorTabBorderPassive;
end;

procedure TfmMain.DoHandleQuickSearchEscape;
begin
  FocusEditor;
end;

function TfmMain.DoHandleEscapeActions: boolean;
begin
  Result:= false;
  if GetKeyState(vk_escape)<0 then
  begin
    if edQS.Focused then
    begin
      DoHandleQuickSearchEscape;
      Result:= true;
    end
    else
    if ecACP.Visible then
    begin
      ecACP.CloseUp(false);
      Result:= true;
    end;
  end;
end;


procedure TfmMain.TBXMRUListItemFNewClick(Sender: TObject;
  const Filename: WideString);
begin
  DoNewDoc(Filename);
end;

procedure TfmMain.StatusResize(Sender: TObject);
begin
  Status.InvalidateBackground();
end;

function TfmMain.DoGetFavList: Widestring;
var
  fn: string;
  L: TTntStringList;
begin
  Result:= '';

  fn:= SynFavIni;
  if not IsFileExist(fn) then Exit;

  L:= TTntStringList.Create;
  try
    L.LoadFromFile(fn);
    Result:= L.Text;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.acSetupLexLibExecute(Sender: TObject);
begin
  DoCustomizeLexerLibrary(SyntaxManager);
  SaveLexLibFilename;
  DoConfirmSaveLexLib;
end;

procedure TfmMain.TbxItemTabReloadClick(Sender: TObject);
begin
  DoFrameReloadWrapper(FClickedFrame);
end;

procedure TfmMain.TBXItemHtmlPreviewClick(Sender: TObject);
begin
  DoOpenBrowserPreview;
end;

function TfmMain.SynHiddenOption(const Id: string; Default: integer): Integer;
begin
  with TIniFile.Create(SynIni) do
  try
    Result:= ReadInteger('Setup', Id, Default);
  finally
    Free
  end;
end;

procedure TfmMain.DoRememberTempFile(const fn: Widestring);
begin
  if FTempFilenames.IndexOf(fn)<0 then
    FTempFilenames.Add(fn);
end;

procedure TfmMain.DoDeleteTempFiles;
var
  i: Integer;
begin
  for i:= FTempFilenames.Count-1 downto 0 do
  begin
    FDelete(FTempFilenames[i]);
    FTempFilenames.Delete(i);
  end;
end;

procedure TfmMain.TBXSubmenuItemToolbarsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  TbxItemTFile.Checked:= tbFile.Visible;
  TbxItemTEdit.Checked:= tbEdit.Visible;
  TbxItemTView.Checked:= tbView.Visible;
  TbxItemTQs.Checked:= tbQs.Visible;

  TbxItemTUser1.Checked:= tbUser1.Visible;
  TbxItemTUser2.Checked:= tbUser2.Visible;
  TbxItemTUser3.Checked:= tbUser3.Visible;
  TbxItemTUser1.Visible:= tbUser1.Items.Count>0;
  TbxItemTUser2.Visible:= tbUser2.Items.Count>0;
  TbxItemTUser3.Visible:= tbUser3.Items.Count>0;
end;

procedure TfmMain.DoCopySearchMarks(Ed: TSyntaxMemo);
var
  L: TTntStringList;
begin
  L:= TTntStringList.Create;
  try
    EditorSearchMarksToList(Ed, L);
    if L.Count=0 then
      MsgBeep
    else
      TntClipboard.AsWideText:= L.Text;
  finally
    FreeAndNil(L)
  end;
end;

procedure TfmMain.TimerMinimapTimer(Sender: TObject);
begin
  TimerMinimap.Enabled:= false;
  SyncMapPos;
end;


procedure TfmMain.TBXSubmenuItemConvPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
  //-----
  procedure AddMI(const AConvIndex: Integer; AConvBack: boolean);
  const
    cConvGap = 1000;
    cNoBack: Widechar = '_';
  var
    Cap: Widestring;
    NoBack: boolean;
    MI: TSpTbxItem;
  begin
    Cap:= WideChangeFileExt(WideExtractFileName(FListConv[AConvIndex]), '');
    NoBack:= Cap[Length(Cap)]=cNoBack;
    if NoBack then
    begin
      Delete(Cap, Length(Cap), 1);
      if AConvBack then Exit;
    end;

    MI:= TSpTbxItem.Create(Self);
    MI.Caption:=
      Cap + ' '#151' ' +
      IfThen(AConvBack, DKLangConstW('zMConvDecode'), DKLangConstW('zMConvEncode'));
    MI.Tag:= AConvIndex + IfThen(AConvBack, cConvGap);
    MI.OnClick:= ConvClick;
    TBXSubmenuItemConv.Add(MI);
  end;
  //-----
var
  i: Integer;
begin
  FListConv.Clear;
  FFindToList(FListConv,
    SynDir + 'Template\conv',
    '*.txt', '',
    false{SubDirs}, false, false, false);

  with TbxSubmenuItemConv do
  begin
    Clear;
    for i:= 0 to FListConv.Count-1 do
    begin
      AddMI(i, false);
      AddMI(i, true);
      Add(TSpTBXSeparatorItem.Create(Self));
    end;
  end;
end;

procedure TfmMain.ConvClick(Sender: TObject);
const
  cConvGap = 1000;
var
  N: Integer;
  ToBack: boolean;
begin
  N:= (Sender as TComponent).Tag;
  ToBack:= N>=cConvGap;
  if ToBack then
    Dec(N, cConvGap);

  if (N>=0) and (N<FListConv.Count) then
  begin
    DoTextConverter(CurrentEditor, FListConv[N], ToBack);
    //MsgInfo(FListConv[N]+#13+IntToStr(Ord(ToBack)), Handle);
  end
  else
    MsgError(WideFormat('Invalid text converter index: %d', [N]), Handle);
end;

procedure TfmMain.DoTextConverter(Ed: TSyntaxMemo; const fn: Widestring; ToBack: boolean);
var
  SFrom, STo: Widestring;
  NStart, NLen: Integer;
  ToAll: boolean;
begin
  if Ed.ReadOnly then Exit;
  if not IsFileExist(fn) then
    begin MsgNoFile(fn); Exit end;

  ToAll:= Ed.SelLength=0;
  if ToAll then
  begin
    SFrom:= Ed.Lines.FText;
    NStart:= 0;
    NLen:= Length(SFrom);
  end
  else
  begin
    SFrom:= Ed.SelText;
    NStart:= Ed.SelStart;
    NLen:= Ed.SelLength;
  end;

  STo:= SDecodeUsingFileTable(SFrom, fn, ToBack);
  if STo=SFrom then
    begin MsgDoneLines(0); MsgBeep; Exit end;

  Ed.ReplaceText(NStart, NLen, STo);
  if not ToAll then
    Ed.SetSelection(NStart, Length(STo));
end;

procedure TfmMain.TBXItemEncodeHtmlAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_EncodeHtmlChars);
end;

procedure TfmMain.TBXItemEncodeHtmlNoBracketsClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_EncodeHtmlChars2);
end;

procedure TfmMain.ecEncodeHtmlCharsExecute(Sender: TObject);
begin
  DoTextConverter(CurrentEditor, SynConverterFilename(cConverterHtml1), false);
end;

procedure TfmMain.ecEncodeHtmlChars2Execute(Sender: TObject);
begin
  DoTextConverter(CurrentEditor, SynConverterFilename(cConverterHtml2), false);
end;

procedure TfmMain.ProjGotoFile(Sender: TObject);
begin
  ecProjectList.Execute;
end;

procedure TfmMain.TbxItemMenuXClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FileClose);
end;

procedure TfmMain.TbxItemMenuXXClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FileCloseAll);
end;

function TfmMain.IsWordChar(ch: WideChar): boolean;
begin
  //count '#' as wordchar for HTML color codes
  Result:= ecStrUtils.IsWordChar(ch) or (Pos(ch, opWordChars+'#')>0);
end;

procedure TfmMain.DoFavoriteProjects;
begin
  DoFavoritesDialog(cSynFavTabProjects);
end;

procedure TfmMain.ShowProj;
begin
  if not (Assigned(fmProj) and fmProj.TreeProj.Focused) then
  begin
    //focus project
    ecToggleFocusProject.Execute;
    //repaint project
    plTree.Invalidate;
    if Assigned(fmProj) then
      fmProj.TreeProj.Invalidate;
    Application.ProcessMessages;
  end;
end;

procedure TfmMain.DoOpenProject;
begin
  ShowProj;
  if Assigned(fmProj) then
    fmProj.DoOpenProject;
end;

procedure TfmMain.DoAddFileToProject;
begin
  ShowProj;
  if Assigned(fmProj) then
    fmProj.DoAddEditorFiles(false);
end;

procedure TfmMain.DoAddFilesToProject;
begin
  ShowProj;
  if Assigned(fmProj) then
    fmProj.DoAddEditorFiles(true);
end;

procedure TfmMain.DoNewProject;
begin
  ShowProj;
  if Assigned(fmProj) then
    fmProj.DoNewProject;
end;

procedure TfmMain.DoSaveProject;
begin
  if Assigned(fmProj) then
    fmProj.DoSaveProject;
end;

procedure TfmMain.DoUpdateProject;
begin
  if Assigned(fmProj) then
    fmProj.DoUpdateProject;
end;

procedure TfmMain.TBXItemProjOpenClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_OpenProject);
end;

procedure TfmMain.TBXItemProjAddFileClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_AddFileToProject);
end;

procedure TfmMain.TBXItemProjAddAllFilesClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_AddFilesToProject);
end;

procedure TfmMain.TBXSubmenuItemProjRecentsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  Ini: TIniFile;
  i: Integer;
begin
  Ini:= TIniFile.Create(SynHistoryIni);
  try
    LoadMruList(SynMruProjects, Ini, 'MRU_Proj', opSaveState, opMruCheck);
  finally
    FreeAndNil(Ini);
  end;

  with TBXMRUListItem_Projects do
  begin
    Clear;
    for i:= SynMruProjects.Items.Count-1 downto 0 do
      MRUAdd(SynMruProjects.Items[i]);
  end;
end;

procedure TfmMain.TBXMRUListItem_ProjectsClick(Sender: TObject;
  const Filename: WideString);
begin
  if IsFileExist(Filename) then
    DoOpenProject(Filename)
  else
  begin
    MsgNoFile(Filename);
    SynMruProjects.DeleteItem(Filename);
  end;
end;

procedure TfmMain.TBXItemProjRecentClearClick(Sender: TObject);
begin
  SynMruProjects.Items.Clear;
  with TIniFile.Create(SynHistoryIni) do
  try
    EraseSection('MRU_Proj');
  finally
    Free;
  end;
end;

procedure TfmMain.TBXItemProjGotoClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ProjectList);
end;

procedure TfmMain.TBXItemProjNewClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_NewProject);
end;

procedure TfmMain.SynCaretPosChanged(Sender: TObject);
var
  Ed: TSyntaxMemo;
  NeedDraw: boolean;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;
  NeedDraw:= false;

  ATSyntMemo.TSyntaxMemo(Ed).DoUpdateMargins;

  if Ed.BracketsHilited then
  begin
    Ed.BracketsHilited:= false;
    Ed.SearchMarks.Clear;
    NeedDraw:= true;
  end;

  if NeedDraw then
    Ed.Invalidate;

  DoSmartHiliteOnClick;

  UpdateLexer;
  UpdateStatusBar;
end;

procedure TfmMain.DoSmartHiliteOnClick;
var
  Ed: TSyntaxMemo;
  NPos: Integer;
  S: Widestring;
  F: TEditorFrame;
  MCarets: boolean;
begin
  Ed:= CurrentEditor;

  //don't allow to work for many carets
  F:= FrameOfEditor(Ed);
  MCarets:= (F<>nil) and (F.CaretsCount>1);
  if MCarets and opHiliteSmartOnClick then
  begin
    Ed.ResetSearchMarks;
    Exit
  end;

  if opHiliteSmartOnClick then
  begin
    Ed.ResetSearchMarks;
    NPos:= Ed.CaretStrPos;
    if not Ed.HaveSelection then
	  if IsWordChar(Ed.Lines.Chars[NPos+1]) then
	  begin
		S:= Ed.WordAtPos(Ed.CaretPos);
		if S<>'' then
		  DoMarkAll(S);
	  end;
  end;
end;

procedure TfmMain.DoPasteAndSelect;
begin
  EditorPasteAndSelect(CurrentEditor);
end;

procedure TfmMain.DoCopyURL;
var
  S: Widestring;
begin
  S:= CurrentFrame.SUrlAt(CurrentEditor.CaretPos);
  if S<>'' then
    Clipboard.AsText:= S
  else
    MsgBeep;
end;

procedure TfmMain.DoOpenURL;
const
  cMaxLen = 1000;
var
  S: Widestring;
begin
  S:= CurrentFrame.SUrlAt(CurrentEditor.CaretPos);
  if S<>'' then
    FOpenURL(S, Handle)
  else
  begin
    S:= Trim(EditorGetSelTextLimited(CurrentEditor, cMaxLen));
    if S='' then
      begin MsgBeep; Exit end;
    if Pos('://', S)=0 then
      S:= 'http://' + S;
    FOpenURL(S, Handle);
  end;
end;

//updates TbxItemCtxAddColor.Enabled
function TfmMain.UpdateCurrentColorCode(var AColor: Integer): boolean;
var
  Ed: TSyntaxMemo;
  s: Widestring;
  nStart, nEnd: Integer;
begin
  Ed:= CurrentEditor;
  s:= Ed.SelText;
  if (s<>'') and IsStringRegex(s, cRegexColorCode) then
  begin
    Delete(s, 1, 1);
    Result:= IsHexColorString(s);
    if Result then
      AColor:= SHtmlCodeToColor(s);
  end
  else
  if (s<>'') and IsStringRegex(s, cRegexColorName) then
  begin
    s:= SGetColorNameValue(s);
    Result:= s<>'';
    if Result then
    begin
      Delete(s, 1, 1);
      Result:= IsHexColorString(s);
      if Result then
        AColor:= SHtmlCodeToColor(s);
    end;
  end
  else
  begin
    EditorGetColorCodeRange(Ed, nStart, nEnd, AColor);
    Result:= nEnd>nStart;
  end;
end;

procedure TfmMain.DoAddCurrentColorCodeToRecents;
var
  nColor: Integer;
begin
  if UpdateCurrentColorCode(nColor) then
    DoAddRecentColor(nColor)
  else
    MsgBeep;
end;

procedure TfmMain.DoSaveFolding;
var
  Ed: TSyntaxMemo;
  F: TEditorFrame;
  SFold: string;
begin
  Ed:= CurrentEditor;
  F:= CurrentFrame;

  if F.FileName='' then
  begin
    DoHint('Cannot save folding for unnamed tab');
    MsgBeep;
    Exit
  end;

  if Ed.DisableFolding then
  begin
    DoHint('Cannot save folding when it''s disabled');
    MsgBeep;
    Exit
  end;

  SFold:= EditorGetCollapsedRanges(Ed);
  if SFold='' then
  begin
    DoHint('Cannot save empty folding state');
    MsgBeep;
    Exit
  end;

  with TIniFile.Create(SynFoldStatesIni) do
  try
    WriteString('Fold', UTF8Encode(F.FileName), SFold);
  finally
    Free
  end;

  DoHint('Folding saved to file');
end;

procedure TfmMain.DoLoadFolding;
var
  Ed: TSyntaxMemo;
  F: TEditorFrame;
  SFold: string;
begin
  Ed:= CurrentEditor;
  F:= CurrentFrame;

  if F.FileName='' then
  begin
    DoHint('Cannot load folding for unnamed tab');
    MsgBeep;
    Exit
  end;

  if Ed.DisableFolding then
    ecFolding.Execute;

  with TIniFile.Create(SynFoldStatesIni) do
  try
    SFold:= ReadString('Fold', UTF8Encode(F.FileName), '');
  finally
    Free
  end;

  if SFold='' then
  begin
    DoHint('Cannot load empty folding state');
    MsgBeep;
    Exit
  end;

  EditorSetCollapsedRanges(Ed, SFold);
  DoHint('Folding loaded from file');
end;

procedure TfmMain.PluginACPShow(Sender: TObject);
begin
  if opAcpUseSingle then
    with PluginACP do
      if ListBox.Items.Count=1 then
      begin
        CloseUp(true);
        Exit
      end;
end;

function TfmMain.FrameForFilename(const fn: Widestring): TEditorFrame;
var
  i: Integer;
  F: TEditorFrame;
begin
  Result:= nil;
  for i:= 0 to FrameAllCount-1 do
  begin
    F:= FramesAll[i];
    if F.IsTheFile(fn) then
    begin
      Result:= F;
      Exit;
    end;
  end;
end;

procedure TfmMain.DoOpenLastClosedFile;
var
  fn: Widestring;
  i: Integer;
begin
  fn:= '';
  with SynMruFiles do
    for i:= 0 to Items.Count-1 do
      if FrameForFilename(Items[i])=nil then
      begin
        fn:= Items[i];
        Break
      end;

  if fn<>'' then
  begin
    if IsFileExist(fn) then
      DoOpenFile(fn)
    else
      MsgNoFile(fn);
  end
  else
    MsgBeep();
end;

procedure TfmMain.ProjPreview(Sender: TObject; const AFilename: Widestring; AToggle: boolean);
var
  Ed: TSyntaxMemo;
begin
  FProjPreviewFilename:= '';
  if Assigned(FProjPreview) then
    with FProjPreview do
    begin
      if AToggle then
        Visible:= not Visible;

      FProjPreview.Caption:= DKLangConstW('MPre')+': '+WideExtractFilename(AFilename);
      if Assigned(FProjPreviewButton) then
        FProjPreviewButton.Caption:= '[ ' + DKLangConstW('MPreButton') + ' ]';

      Ed:= FProjPreviewEditor;
      Ed.Lines.Clear;
      if not Visible then Exit;
      if CurrentEditor=nil then Exit;
      if not IsFileExist(AFilename) then Exit;

      //sync preview-editor options
      //don't use Ed.Assign(CurrentEditor), it gives error on exit
      Ed.Font.Assign(CurrentEditor.Font);
      Ed.Color:= CurrentEditor.Color;
      Ed.RightMargin:= CurrentEditor.RightMargin;
      Ed.Options:= CurrentEditor.Options;
      Ed.OptionsEx:= CurrentEditor.OptionsEx;
      Ed.StapleOffset:= CurrentEditor.StapleOffset;
      Ed.StaplePen.Assign(CurrentEditor.StaplePen);

      //detect UTF8-no-bom
      if IsFileUTF8NoBOM(AFilename) then
      begin
        Ed.Lines.SkipSignature:= true;
        Ed.Lines.TextCoding:= tcUTF8;
        Ed.Lines.CodePage:= 0;
      end;

      Screen.Cursor:= crHourGlass;
      try
        Ed.LoadFromFile(AFilename);
        Ed.TopLine:= 0;
        Ed.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(AFilename);
      finally
        Screen.Cursor:= crDefault;
      end;

      FProjPreviewFilename:= AFilename;
    end;
end;

procedure TfmMain.ProjPreviewClose(Sender: TObject);
var
  Ini: TIniFile;
begin
  Ini:= TIniFile.Create(SynIni);
  try
    if Assigned(FProjPreview) then
      SavePanelProp(FProjPreview, Ini, 'Pre');
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.FocusProj;
begin
  if Assigned(fmProj) and fmProj.TreeProj.CanFocus then
    fmProj.TreeProj.SetFocus;
end;

procedure TfmMain.ProjPreviewKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) and (Shift=[]) then
  begin
    FProjPreview.Visible:= false;
    FocusProj;
    Key:= 0;
    Exit
  end;
  {
  if (Key=vk_space) and (Shift=[]) then
  begin
    ProjPreviewButtonClick(Self);
    Key:= 0;
    Exit
  end;
  }
end;

function TfmMain.IsProjPreviewFocused: boolean;
begin
  Result:=
    Assigned(FProjPreview) and FProjPreview.Visible and
    Assigned(FProjPreviewEditor) and FProjPreviewEditor.Focused;
end;

procedure TfmMain.ProjPreviewButtonClick(Sender: TObject);
var
  fn: Widestring;
begin
  fn:= FProjPreviewFilename;
  if (fn<>'') and IsFileExist(fn) then
  begin
    FProjPreview.Hide;
    DoOpenFile(fn);
    FocusEditor;

    CurrentEditor.CaretPos:= FProjPreviewEditor.CaretPos;
    EditorCenterPos(CurrentEditor, true, opSrOffsetY);
  end
  else
    MsgBeep;
end;

function TfmMain.DoCheckCommandLineTwo: boolean;
var
  i: Integer;
  S, SName1, SName2,
  SLine1, SLine2, SCol1, SCol2, SDelta: Widestring;
  NLine1, NLine2, NCol1, NCol2, NDelta: Integer;
  IsParamTwo, IsParamCmp: boolean;
  F: TEditorFrame;
begin
  Result:= false;
  for i:= 1 to WideParamCount do
  begin
    S:= WideParamStr(i);
    IsParamTwo:= SBegin(S, cSynParamTwo);
    IsParamCmp:= SBegin(S, cSynParamCmp);

    if IsParamTwo then
    begin
      Result:= true;
      SDeleteToW(S, '=');

      SName1:= SGetItem(S, '|');
      SName2:= SGetItem(S, '|');
      SLine1:= SGetItem(S, '|');
      SLine2:= SGetItem(S, '|');
      SCol1:= SGetItem(S, '|');
      SCol2:= SGetItem(S, '|');
      SDelta:= SGetItem(S, '|');

      NLine1:= StrToIntDef(SLine1, 1)-1;
      NLine2:= StrToIntDef(SLine2, 1)-1;
      NCol1:= StrToIntDef(SCol1, 1)-1;
      NCol2:= StrToIntDef(SCol2, 1)-1;
      NDelta:= StrToIntDef(SDelta, 0);

      if not IsFileExist(SName1) then
        begin MsgNoFile(SName1); Exit end;
      //if not IsFileExist(SName2) then
      //  begin MsgNoFile(SName2); Exit end;

      //close all tabs
      if not DoCloseAllTabs then Exit;
      Groups.Mode:= gmOne;

      //open 1st file
      F:= DoOpenFile(SName1);
      F.EditorMaster.TopLine:= NLine1 - NDelta;
      F.EditorMaster.CaretPos:= Point(NCol1, NLine1);

      //open 2nd file
      if IsFileExist(SName2) then
      begin
        F:= DoOpenFile(SName2);
        F.EditorMaster.TopLine:= NLine2 - NDelta;
        F.EditorMaster.CaretPos:= Point(NCol2, NLine2);
      end
      else
      begin
        acNewTab.Execute;
        F:= CurrentFrame;
        F.EditorMaster.Lines.Text:= DKLangConstW('MNFound')+' '+SName2;
        F.Modified:= true;
      end;

      //move last file to group2
      with Groups do
      begin
        Mode:= gm2Horz;
        MoveTab(Pages1, Pages1.Tabs.TabCount-1, Pages2, -1, false);
      end;
    end;

    if IsParamCmp then
    begin
      Result:= true;
      SDeleteToW(S, '=');

      SName1:= SGetItem(S, '|');
      SName2:= SGetItem(S, '|');

      if not IsFileExist(SName1) then
        begin MsgNoFile(SName1); Exit end;
      if not IsFileExist(SName2) then
        begin MsgNoFile(SName2); Exit end;

      //close all tabs
      if not DoCloseAllTabs then Exit;
      Groups.Mode:= gmOne;

      DoPyEvent(CurrentEditor, cSynEventOnCompare,
        [SWideStringToPythonString(SName1),
         SWideStringToPythonString(SName2)]);
    end;
  end;
end;


procedure TfmMain.plTreeDockChanged(Sender: TObject);
begin
  //fix splitter position, it may be too right after
  //docking the tree panel to left
  SplitterLeft.Left:= 10;
end;

function TfmMain.CurrentProjectSessionFN: string;
begin
  Result:= CurrentProjectFN;
  if Result<>'' then
    Result:= ChangeFileExt(Result, '.'+cSynSessionExt);
end;

procedure TfmMain.DoSaveProjectSession;
var
  fn: string;
begin
  fn:= CurrentProjectSessionFN;
  if fn<>'' then
  begin
    DoSaveSessionToFile(fn);
    SynMruSessions.AddItem(fn);
  end;
end;

procedure TfmMain.DoOpenProjectSession;
var
  fn: string;
begin
  fn:= CurrentProjectSessionFN;
  if fn<>'' then
  begin
    DoOpenSession(fn);
  end;
end;

procedure TfmMain.ProjOpen;
var
  fn: string;
begin
  if not opHistSessionProjLoad then Exit;

  fn:= CurrentProjectSessionFN;
  if (fn<>'') and IsFileExist(fn) then
  begin
    if FProjectIniting then
    begin
      //if we are called from LoadIni, lexer lib isn't yet loaded,
      //so bad to load session yet. So we save session name to SynProjectSessionFN
      //to open later, in TfmEx.FormShow
      //MsgInfo('open sess delayed '+fn, Handle);
      SynProjectSessionFN:= fn;
    end
    else
    begin
      //usual project opening, load session now
      //MsgInfo('open sess '+fn, Handle);
      DoOpenSession(fn);
    end;
  end;
end;

procedure TfmMain.DoCloseTabsOnProjectClosingIfNeeded;
begin
  //make sure we don't close all tabs during form OnClose (this gives AV)
  if not FProjectFreeing then
    if opHistProjectCloseTabs then
      acCloseAll.Execute;
end;

procedure TfmMain.ProjClose;
var
  fn: string;
begin
  if not opHistSessionProjSave then
  begin
    DoCloseTabsOnProjectClosingIfNeeded;
    Exit;
  end;

  fn:= CurrentProjectSessionFN;
  if fn<>'' then
  begin
    //MsgInfo('save sess '+fn, Handle);
    DoSaveSessionToFile(fn);
    DoCloseSession(false);
    DoCloseTabsOnProjectClosingIfNeeded;
  end;
end;

procedure TfmMain.DoProjectRenameFile(const fn, fn_new: Widestring);
begin
  if Assigned(fmProj) then
    fmProj.DoRenameFile(fn, fn_new);
end;

procedure TfmMain.ProjKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
var
  sh: TShortcut;
begin
  sh:= Shortcut(Key, Shift);
  if sh=0 then Exit;

  //configured shortcut for "Go to project file"
  if IsShortcutOfCmd(sh, sm_ProjectList) then
  begin
    ProjGotoFile(Self);
    Key:= 0;
    Exit
  end;
  //F2 - rename folder
  if (Key=VK_F2) and (Shift=[]) then
  begin
    fmProj.DoRename;
    Key:= 0;
    Exit
  end;
  //F5 - refresh project
  if (Key=VK_F5) and (Shift=[]) then
  begin
    fmProj.DoRefresh;
    Key:= 0;
    Exit
  end;
  //Del
  if (Key=VK_delete) and (Shift=[]) and not fmProj.TreeProj.IsEditing then
  begin
    fmProj.DoRemove;
    Key:= 0;
    Exit
  end;
  //Ins
  if (Key=VK_insert) and (Shift=[]) and not fmProj.TreeProj.IsEditing then
  begin
    fmProj.DoAddFiles;
    Key:= 0;
    Exit
  end;
  //Space - toggle preview pane
  if (Key=VK_space) and (Shift=[]) and not fmProj.TreeProj.IsEditing then
  begin
    fmProj.DoPreview(true);
    Key:= 0;
    Exit
  end;
  //Ctrl+Space - toggle "show paths"
  if (Key=VK_space) and (Shift=[ssCtrl]) then
  begin
    fmProj.DoToggleShowPaths;
    Key:= 0;
    Exit
  end;
  //Enter - open selected files
  if (Key=vk_return) and (Shift=[]) then
  begin
    if not fmProj.IsDirSelected then
      fmProj.DoOpenFiles;
    Key:= 0;
    Exit
  end;

  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.DoZoomEditorInc(AInc: boolean);
const
  cDelta = 10; //increase by N%
begin
  DoZoomEditor(CurrentEditor.Zoom + cDelta * IfThen(AInc, 1, -1));
end;

procedure TfmMain.TbxItemProjSaveClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SaveProject);
end;



const
  cFramePropLexer    = 'lex';
  cFramePropWrap     = 'wrap';
  cFramePropEnc      = 'enc';
  cFramePropSplit    = 'split';
  cFramePropBk       = 'bk';
  //these are for both master/slave:
  cFramePropPos      = 'pos';
  cFramePropSel      = 'sel';
  cFramePropFold     = 'fold';

function TfmMain.FrameGetPropertiesString(F: TEditorFrame): string;
  //
  procedure Add(var res: string; const id, val: string);
  begin
    res:= res + id + '=' + val + ';';
  end;
  //
  procedure AddEd(var res: string; Ed: TSyntaxMemo; const id: string);
  var
    p: TPoint;
  begin
    p:= Ed.CaretPos;
    Add(res, cFramePropPos+id, Format('%d,%d,%d,', [p.X, p.Y, Ed.TopLine]));
    Add(res, cFramePropSel+id, EditorGetSelCoordAsString(Ed));
    Add(res, cFramePropFold+id, EditorGetCollapsedRanges(Ed));
  end;
  //
begin
  Result:= '';
  if F.FileName<>'' then
  begin
    Result:= Utf8Encode(F.FileName) + ';';
    Add(Result, cFramePropEnc, IntToStr(GetFrameEncoding(F)));
    Add(Result, cFramePropLexer, F.CurrentLexer);
    Add(Result, cFramePropWrap, IntToStr(Ord(F.EditorMaster.WordWrap)));
    Add(Result, cFramePropSplit, IntToStr(Ord(F.SplitHorz)) + ',' + IntToStr(Round(F.SplitPos)));
    AddEd(Result, F.EditorMaster, '1');
    AddEd(Result, F.EditorSlave, '2');
    Add(Result, cFramePropBk, EditorGetBookmarksAsString(F.EditorMaster));
  end;
end;

function TfmMain.IsFramePropertiesStringForFilename(const fn: Widestring; const Str: string): boolean;
var
  N: Integer;
  fnData: Widestring;
begin
  Result:= false;
  if fn='' then Exit;

  N:= Pos(';', Str);
  if N=0 then Exit;
  fnData:= Utf8Decode(Copy(Str, 1, N-1));

  Result:= WStrIComp(PWChar(fnData), PWChar(fn)) = 0;
    //WideUpperCase(fnData)=WideUpperCase(fn);
end;

procedure TfmMain.FrameSetPropertiesString(F: TEditorFrame; const Str: string; EncodingOnly: boolean);
var
  S, SItem, SId, SVal: Widestring;
  Ed: TSyntaxMemo;
  pnt: TPoint;
  EdIndex, NVal{, NVal2}: Integer;
  //Analyzer: TSyntAnalyzer;
begin
  (*
  Analyzer:= SyntaxManager.AnalyzerForFile(F.FileName);
  F.EditorMaster.TextSource.SyntaxAnalyzer:= nil;
  *)

  F.EditorMaster.BeginUpdate;
  F.EditorSlave.BeginUpdate;
  try
    S:= Str;
    SItem:= SGetItem(S, ';'); //delete filename
    repeat
      SItem:= SGetItem(S, ';');
      if SItem='' then Break;
      SId:= SGetItem(SItem, '=');
      SVal:= SItem;
      if Length(SId)<2 then Continue;
      EdIndex:= StrToIntDef(SId[Length(SId)], 0);

      if EdIndex=2 then
        Ed:= F.EditorSlave
      else
        Ed:= F.EditorMaster;

      if IsDigitChar(SId[Length(SId)]) then
        SetLength(SId, Length(SId)-1);

      if EncodingOnly then
      begin
        //apply encoding field, don't touch others
        if (SId=cFramePropEnc) and opSaveEdEnc then
          begin
            NVal:= StrToIntDef(SVal, 0);
            ApplyFrameEncoding(F, NVal);
          end
        else
          Continue;
      end;

      if SId=cFramePropLexer then
        begin
          //Analyzer:= SyntaxManager.FindAnalyzer(SVal);
          F.EditorMaster.TextSource.SyntaxAnalyzer:= SyntaxManager.FindAnalyzer(SVal);
        end
      else
      if SId=cFramePropWrap then
        begin
          F.EditorMaster.WordWrap:= Bool(StrToIntDef(SVal, 0));
          F.EditorSlave.WordWrap:= F.EditorMaster.WordWrap;
        end
      else
      if SId=cFramePropSplit then
        begin
          F.SplitHorz:= Bool(StrToIntDef(SGetItem(SVal), 1));
          F.SplitPos:= StrToIntDef(SGetItem(SVal), 50);
        end
      else
      if SId=cFramePropBk then
        begin
          EditorSetBookmarksAsString(F.EditorMaster, SVal);
          EditorSetBookmarksAsString(F.EditorSlave, SVal);
        end
      else
      if (SId=cFramePropPos) and opSaveEdCaret then
        begin
          pnt.X:= StrToIntDef(SGetItem(SVal), 0);
          pnt.Y:= StrToIntDef(SGetItem(SVal), 0);
          Ed.CaretPos:= pnt;
          Ed.TopLine:= StrToIntDef(SGetItem(SVal), 0);
        end
      else
      if SId=cFramePropSel then
        begin
          EditorSetSelCoordAsString(Ed, SVal);
        end
      else
      if SId=cFramePropFold then
        begin
          //this works, if lexer analisys already finished
          EditorSetCollapsedRanges(Ed, SVal);
          //this works if not
          if EdIndex=1 then
            F.CollapsedString1:= SVal
          else
            F.CollapsedString2:= SVal;
        end;
    until false;
  finally
    F.EditorMaster.EndUpdate;
    F.EditorSlave.EndUpdate;
  end;

  (*
  //now repaint and set lexer - this is long operation (5s on unMain.pas, if caret at end)
  Application.ProcessMessages;
  NVal:= F.EditorMaster.TopLine;
  NVal2:= F.EditorSlave.TopLine;
  if FCanUseLexer(F.FileName) then
    F.EditorMaster.TextSource.SyntaxAnalyzer:= Analyzer;
  F.EditorMaster.TopLine:= NVal;
  F.EditorSlave.TopLine:= NVal2;
  *)
end;

procedure TfmMain.StatusItemBusyClick(Sender: TObject);
begin
  {$ifdef DebugAbout}
  DoTest;
  {$endif}
end;

function TfmMain.MsgConfirmOpenSaveSession(
  AFilesCount: Integer;
  const AFileName: string;
  ASaveMode: boolean): boolean;
const
  cMsg: array[boolean] of string = ('zMCfmSessionLoad', 'zMCfmSessionSave');
var
  NOpt: Integer;
  SName, SMsg: Widestring;
begin
  NOpt:= SynHiddenOption('SessionMaxFiles', 0);
  SName:= ChangeFileExt(ExtractFileName(AFileName), '');
  SMsg:= WideFormat(DKLangConstW(cMsg[ASaveMode]), [SName, AFilesCount]);

  if (NOpt=0) or (AFilesCount<=NOpt) then
    Result:= true
  else
    Result:= MsgConfirm(SMsg, Handle);
end;

procedure TfmMain.DoOpenArchive(const fn: Widestring);
const
  cInf = 'install.inf';
  //
  function DoHandleIni(const fn_ini, subdir, section: string; typ: TSynAddonType): boolean;
  var
    s_section, s_id, s_file, s_params, s_value: string;
  begin
    with TIniFile.Create(fn_ini) do
    try
      s_section:= ReadString(section, 'section', '');
      s_id:= ReadString(section, 'id', '');
      s_file:= ReadString(section, 'file', '');
      s_params:= ReadString(section, 'params', '');
    finally
      Free
    end;

    Result:= s_section<>'';
    if not Result then Exit;

    if (s_id='') then
    begin
      MsgError('Section in inf-file is incorrect', Handle);
      Exit
    end;

    case typ of
      cAddonTypeBinPlugin:
        s_value:= subdir + '\' + s_file + ';' + s_params;
      cAddonTypePyPlugin:
        s_value:= 'py:' + subdir + ';' + s_params;
      else
        Exit;
    end;

    with TIniFile.Create(SynPluginsIni) do
    try
      WriteString(s_section, s_id, s_value);
    finally
      Free
    end;

    ///debug
    //MsgInfo(Format('Write key: [%s] %s=%s', [s_section, s_id, '.....']), Handle);
  end;
  //
var
  fn_inf, dir_to: string;
  s_title, s_type, s_desc, s_ver, s_subdir, s_msg: string;
  n_type, i_type: TSynAddonType;
  i: integer;
begin
  dir_to:= FTempDir;
  fn_inf:= dir_to + '\' + cInf;
  FDelete(fn_inf);

  if not FUnpackSingle(fn, dir_to, cInf, false{asAdmin}) then
  begin
    MsgNoFile('Unzip.exe / Unrar.exe');
    Exit
  end;

  if not FileExists(fn_inf) then
  begin
    MsgError(DKLangConstW('zMInstallNoInf'), Handle);
    Exit
  end;

  with TIniFile.Create(fn_inf) do
  try
    s_title:= ReadString('info', 'title', '');
    s_type:= ReadString('info', 'type', '');
    s_desc:= ReadString('info', 'desc', '');
    s_ver:= ReadString('info', 'ver', '');
    s_subdir:= ReadString('info', 'subdir', '');
  finally
    Free
  end;

  n_type:= cAddonTypeNone;
  for i_type:= Low(TSynAddonType) to High(TSynAddonType) do
    if s_type = cSynAddonType[i_type] then
    begin
      n_type:= i_type;
      Break
    end;

  if (s_title='') then
  begin
    MsgError('Invalid field in inf-file: title', Handle);
    Exit
  end;
  if (s_subdir='') or (Pos('\', s_subdir)>0) or (Pos('/', s_subdir)>0) then
  begin
    MsgError('Invalid field in inf-file: subdir', Handle);
    Exit
  end;
  if (n_type = cAddonTypeNone) then
  begin
    MsgError('Invalid field in inf-file: type', Handle);
    Exit
  end;

  //confirm installation
  s_msg:= DKLangConstW('zMInstallThis') + #13#13 +
          DKLangConstW('zMInstallName') + ': ' + s_title + #13 +
          DKLangConstW('zMInstallType') + ': ' + s_type + #13;
  if s_desc<>'' then
    s_msg:= s_msg + DKLangConstW('zMInstallDesc') + ': ' + s_desc + #13;
  if s_ver<>'' then
    s_msg:= s_msg + DKLangConstW('zMInstallVer') + ': ' + s_ver + #13;
  s_msg:= s_msg + #13 + DKLangConstW('zMInstallYesNo');

  if not MsgConfirm(s_msg, Handle, true) then Exit;

  case n_type of
    cAddonTypeBinPlugin:
      dir_to:= SynDir + 'Plugins\' + s_subdir;
    cAddonTypePyPlugin:
      dir_to:= SynPyDir + '\' + s_subdir;
    cAddonTypeTemplate:
      dir_to:= SynDir + 'Template\' + s_subdir;
    cAddonTypeRoot:
      dir_to:= ExcludeTrailingPathDelimiter(SynDir)
    else
      dir_to:= '?';
  end;

  //new inf filename
  fn_inf:= dir_to + '\' + cInf;

  if not FUnpackAll(fn, dir_to, IsElevationNeededForFolder(dir_to)) or
    not FileExists(fn_inf) then
  begin
    MsgError(DKLangConstW('zMInstallCantUnpack'), Handle);
    Exit
  end;

  if n_type in [cAddonTypeBinPlugin, cAddonTypePyPlugin] then
  begin
    DoHandleIni(fn_inf, s_subdir, 'ini', n_type);
    for i:= 1 to cSynMaxPluginsInInf do
    begin
      if not DoHandleIni(fn_inf, s_subdir, 'ini'+IntToStr(i), n_type) then
        Break
    end;
  end;

  FDelete(fn_inf);
  MsgInfo(Format(DKLangConstW('zMInstallOk'), [dir_to]), Handle);
  acExit.Execute;
end;

procedure TfmMain.TbxTabConsoleClick(Sender: TObject);
begin
  UpdatePanelOut(tbConsole);
end;

procedure TfmMain.DoPyConsole_EnterCommand(const Str: Widestring);
var
  SNew: Widestring;
  Handled: boolean;
begin
  DoPyConsole_LogString(cPyConsolePrompt + Str);

  Handled:= DoPyEvent(CurrentEditor, cSynEventOnConsole,
    [SWideStringToPythonString(Str)]) = cPyTrue;

  if not Handled then
  try
    with GetPythonEngine do
    begin
      SNew:= Str;
      if SBegin(SNew, cPyConsolePrint) then
      begin
        Delete(SNew, 1, Length(cPyConsolePrint));
        SNew:= 'print('+SNew+')'
      end
      else
      if IsWordString(SNew, true) then
        SNew:= 'print('+SNew+')';

      ExecString(UTF8Encode(SNew));

      //code fails on entering "import sys"
      {
      Obj:= EvalString(UTF8Encode(Str));
      if Obj<>Py_None then
        DoPyConsole_LogString(PyObjectAsString(Obj));
      }
    end;
  except
    MsgBeep(true);
  end;

  edConsole.Text:= Str;
  ComboUpdate(edConsole, opSaveSRHist);
  edConsole.Text:= '';
  if edConsole.CanFocus then
    edConsole.SetFocus;
end;

procedure TfmMain.edConsoleKeyPress(Sender: TObject; var Key: Char);
var
  Str: Widestring;
begin
  Str:= edConsole.Text;
  if (Key=#13) then
  begin
    if Str=cPyConsoleClear then
    begin
      MemoConsole.Lines.Clear;
      edConsole.Text:= '';
    end
    else
      DoPyConsole_EnterCommand(Str);
    Key:= #0;
    Exit
  end;
end;

procedure TfmMain.ecToggleFocusConsoleExecute(Sender: TObject);
begin
  if not plOut.Visible then
  begin
    ecShowOut.Execute;
    UpdatePanelOut(tbConsole);
    if Self.Enabled and edConsole.CanFocus then
      edConsole.SetFocus;
  end
  else
  if edConsole.Focused or MemoConsole.Focused then
    FocusEditor
  else
  begin
    UpdatePanelOut(tbConsole);
    if Self.Enabled and edConsole.CanFocus then
      edConsole.SetFocus;
  end;
end;

procedure TfmMain.PythonEngine1BeforeLoad(Sender: TObject);
begin
  //note: for Lister plugin DllPath will be wrong, but it's ok:
  //even with correct DllPath Python won't load in Lister plugin
  //(cannot find MSVCRT DLLs).
  //note: need to set FatalAbort = FatalMsgDlg = False.
  //note: don't check SynExe here (not yet inited).
  with Sender as TPythonEngine do
  begin
    DllPath:= ExtractFilePath(ParamStr(0));
    InitScript.Add(cPyConsoleInit);
  end;
end;

procedure TfmMain.edConsoleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.DoPyConsole_RepeatCommand;
var
  S: Widestring;
begin
  S:= MemoConsole.Lines[MemoConsole.CaretPos.Y];
  if SBegin(S, cPyConsolePrompt) then
  begin
    Delete(S, 1, Length(cPyConsolePrompt));
    DoPyConsole_EnterCommand(S);
  end
  else
    MsgBeep;
end;

procedure TfmMain.MemoConsoleKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Enter should repeat command already entered in memoConsole
  if (Key=13) and (Shift=[]) then
  begin
    DoPyConsole_RepeatCommand;
    Key:= 0;
    Exit
  end;

  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.PythonEngine1AfterInit(Sender: TObject);
var
  SDir, S1, S2, S3: string;
begin
  SDir:= ExtractFilePath(ParamStr(0));
  S1:= SDir + 'DLLs';
  S2:= SDir + 'python32.zip';
  S3:= SDir + 'Py';
  Py_SetSysPath([S1, S2, S3]);
end;


//{$I unMainPy.pas}

procedure TfmMain.PythonModuleInitialization(Sender: TObject);
begin
  with Sender as TPythonModule do
  begin
    AddMethod('msg_box', Py_msg_box, '');
    AddMethod('msg_status', Py_msg_status, '');
    AddMethod('dlg_input', Py_dlg_input, '');
    AddMethod('dlg_input_ex', Py_dlg_input_ex, '');
    AddMethod('dlg_input_memo', Py_dlg_input_memo, '');
    AddMethod('dlg_menu', Py_dlg_menu, '');

    AddMethod('app_version', Py_app_version, '');
    AddMethod('app_api_version', Py_app_api_version, '');
    AddMethod('app_exe_dir', Py_app_exe_dir, '');
    AddMethod('app_ini_dir', Py_app_ini_dir, '');
    AddMethod('app_log', Py_app_log, '');
    AddMethod('app_proc', Py_app_proc, '');
    AddMethod('lexer_proc', Py_lexer_proc, '');
    AddMethod('ed_handles', Py_ed_handles, '');

    AddMethod('ini_read', Py_ini_read, '');
    AddMethod('ini_write', Py_ini_write, '');

    AddMethod('file_open', Py_file_open, '');
    AddMethod('file_save', Py_file_save, '');
    AddMethod('file_get_name', Py_file_get_name, '');
    AddMethod('text_local', Py_text_local, '');
    AddMethod('text_convert', Py_text_convert, '');
    AddMethod('regex_parse', Py_regex_parse, '');

    AddMethod('get_app_prop', Py_get_app_prop, '');
    AddMethod('set_app_prop', Py_set_app_prop, '');

    AddMethod('ed_get_staple', Py_ed_get_staple, '');
    AddMethod('ed_get_bk', Py_ed_get_bk, '');
    AddMethod('ed_set_bk', Py_ed_set_bk, '');
    AddMethod('ed_get_sync_ranges', Py_ed_get_sync_ranges, '');
    AddMethod('ed_add_sync_range', Py_ed_add_sync_range, '');
    AddMethod('ed_focus', Py_ed_focus, '');
    AddMethod('ed_complete', Py_ed_complete, '');
    AddMethod('ed_get_split', Py_ed_get_split, '');
    AddMethod('ed_set_split', Py_ed_set_split, '');

    AddMethod('ed_get_text_all', Py_ed_get_text_all, '');
    AddMethod('ed_get_text_sel', Py_ed_get_text_sel, '');
    AddMethod('ed_get_text_line', Py_ed_get_text_line, '');
    AddMethod('ed_get_text_len', Py_ed_get_text_len, '');
    AddMethod('ed_get_text_substr', Py_ed_get_text_substr, '');
    AddMethod('ed_get_indent', Py_ed_get_indent, '');

    AddMethod('ed_get_caret_xy', Py_ed_get_caret_xy, '');
    AddMethod('ed_get_caret_pos', Py_ed_get_caret_pos, '');
    AddMethod('ed_set_caret_xy', Py_ed_set_caret_xy, '');
    AddMethod('ed_set_caret_pos', Py_ed_set_caret_pos, '');
    AddMethod('ed_add_caret_xy', Py_ed_add_caret_xy, '');
    AddMethod('ed_add_mark', Py_ed_add_mark, '');

    AddMethod('ed_pos_xy', Py_ed_pos_xy, '');
    AddMethod('ed_xy_pos', Py_ed_xy_pos, '');
    AddMethod('ed_log_xy', Py_ed_log_xy, '');
    AddMethod('ed_xy_log', Py_ed_xy_log, '');

    AddMethod('ed_get_line_count', Py_ed_get_line_count, '');
    AddMethod('ed_get_line_prop', Py_ed_get_line_prop, '');
    AddMethod('ed_get_carets', Py_ed_get_carets, '');
    AddMethod('ed_get_marks', Py_ed_get_marks, '');
    AddMethod('ed_get_prop', Py_ed_get_prop, '');
    AddMethod('ed_set_prop', Py_ed_set_prop_wrapper, '');
    AddMethod('ed_get_filename', Py_ed_get_filename, '');
    AddMethod('ed_get_alerts', Py_ed_get_alerts, '');
    AddMethod('ed_set_alerts', Py_ed_set_alerts, '');

    AddMethod('ed_get_sel_mode', Py_ed_get_sel_mode, '');
    AddMethod('ed_get_sel_lines', Py_ed_get_sel_lines, '');
    AddMethod('ed_get_sel', Py_ed_get_sel, '');
    AddMethod('ed_get_sel_rect', Py_ed_get_sel_rect, '');
    AddMethod('ed_set_sel', Py_ed_set_sel, '');
    AddMethod('ed_set_sel_rect', Py_ed_set_sel_rect, '');

    AddMethod('ed_replace', Py_ed_replace, '');
    AddMethod('ed_insert', Py_ed_insert, '');
    AddMethod('ed_insert_snippet', Py_ed_insert_snippet, '');
    AddMethod('ed_set_text_all', Py_ed_set_text_all, '');
    AddMethod('ed_set_text_line', Py_ed_set_text_line, '');
    AddMethod('ed_get_word', Py_ed_get_word, '');

    AddMethod('ed_cmd', Py_ed_cmd, '');
    AddMethod('ed_lock', Py_ed_lock, '');
    AddMethod('ed_unlock', Py_ed_unlock, '');
    AddMethod('ed_find', Py_ed_find, '');
  end;
end;

procedure TfmMain.PythonGUIInputOutput1SendUniData(Sender: TObject;
  const Data: WideString);
begin
  DoPyConsole_LogString(Data);
end;

procedure TfmMain.TbxItemRunNewPluginClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_NewPythonPluginDialog);
end;

procedure TfmMain.DoPyRegisterCommandPlugin(const SId: string);
var
  SSection, SKey, SParams: string;
begin
  SSection:= 'Commands';
  SKey:= Py_NameToMixedCase(SId);
  SParams:= cPyPrefix + SId + ';run;;;';

  with TIniFile.Create(SynPluginsIni) do
  try
    WriteString(SSection, SKey, SParams);
  finally
    Free
  end;
end;

procedure TfmMain.DoPyNewPluginDialog;
var
  SId, SDir: Widestring;
  List: TStringList;
  fn_plugin, fn_sample: string;
begin
  if not GetPythonEngine.Initialized then
  begin
    MsgError(cPyNotInited, Handle);
    Exit
  end;

  SId:= 'my_sample';
  if not MsgInput('zMPyNew', SId) then Exit;

  SId:= Trim(SId);
  if SId='' then Exit;
  SId:= 'syn_' + SId; //add prefix, so plugin module name won't mess with default names

  if Py_ModuleNameIncorrect(SId) then
  begin
    MsgError(WideFormat(DKLangConstW('zMPyBadName'), [SId]), Handle);
    Exit
  end;
  if Py_ModuleNameExists(SId) then
  begin
    MsgError(WideFormat(DKLangConstW('zMPyDupName'), [SId]), Handle);
    Exit
  end;

  SDir:= SynPyDir + '\' + SId;
  fn_plugin:= SDir + '\__init__.py';
  fn_sample:= SynPyDir + '\sw_sample_plugin.py';

  if DirectoryExists(SDir) then
  begin
    MsgError(WideFormat(DKLangConstW('zMPyDirExists'), [SDir]), Handle);
    Exit
  end;
  CreateDir(SDir);
  if not DirectoryExists(SDir) then
  begin
    MsgError(WideFormat(DKLangConstW('zMPyDirNotFound'), [SDir]), Handle);
    Exit
  end;

  List:= TStringList.Create;
  try
    if FileExists(fn_sample) then
      List.LoadFromFile(fn_sample);
    List.SaveToFile(fn_plugin);
  finally
    FreeAndNil(List);
  end;

  if FileExists(fn_plugin) then
  begin
    DoPyRegisterCommandPlugin(SId); //write to SynPlugins.ini
    DoLoadPluginsList; //reread SynPlugins.ini, update Plugins menu
    DoOpenFile(fn_plugin);
  end
  else
    MsgBeep;
end;

function TfmMain.DoPyLoadPlugin(const SFilename, SCmd: string): string;
var
  SId: string;
begin
  SId:= SFilename;
  if SBegin(SId, cPyPrefix) then
    Delete(SId, 1, Length(cPyPrefix));

  if not GetPythonEngine.Initialized then
  begin
    DoPyConsole_LogString(cPyNotInited);
    Exit
  end;

  Result:= Py_RunPlugin_Command(SId, SCmd);
end;

function TfmMain.DoPyLoadPluginWithParams(
  const SFilename, SCmd: string;
  AEd: TSyntaxMemo;
  const AParams: array of string): Widestring;
var
  SId: string;
begin
  SId:= SFilename;
  if SBegin(SId, cPyPrefix) then
    Delete(SId, 1, Length(cPyPrefix));

  if not GetPythonEngine.Initialized then
  begin
    DoPyConsole_LogString(cPyNotInited);
    Exit
  end;

  Result:= Py_RunPlugin_Event(SId, SCmd, AEd, AParams);
end;


procedure TfmMain.DoPyConsole_LogString(const Str: Widestring);
begin
  with MemoConsole do
  begin
    Lines.Add(Str);
    while Lines.Count > cPyConsoleMaxCount do
      Lines.Delete(0);
  end;

  MemoScrollToBottom(MemoConsole);
end;

procedure TfmMain.TbxItemHelpPyDirClick(Sender: TObject);
begin
  FOpenURL(SynPyDir, Handle);
end;

procedure TfmMain.PythonGUIInputOutput1ReceiveUniData(Sender: TObject;
  var Data: WideString);
begin
  Data:= '';
  if DoInputString('Python prompt:', Data) then begin end;
end;

procedure TfmMain.MemoConsoleDblClick(Sender: TObject);
begin
  DoPyConsole_RepeatCommand;
end;

procedure TfmMain.LoadConsoleHist;
begin
  ComboLoadFromFile(edConsole, SynHistoryIni, 'Console', false);
end;

procedure TfmMain.SaveConsoleHist;
begin
  ComboSaveToFile(edConsole, SynHistoryIni, 'Console');
end;

procedure TfmMain.InitSnippets;
begin
  if FListSnippets=nil then
  begin
    FListSnippets:= TList.Create;
    LoadSnippets;
  end;
end;

procedure TfmMain.LoadSnippets;
var
  Files: TTntStringList;
  InfoRec: TSynSnippetInfo;
  InfoClass: TSynSnippetClass;
  i: Integer;
begin
  ClearSnippets;

  Files:= TTntStringList.Create;
  try
    FFindToList(Files,
      SynSnippetsDir,
      '*.'+cSynSnippetExt, '',
      true{SubDirs},
      false, false, false,
      false{EnableProcMsg});

    for i:= 0 to Files.Count-1 do
      if DoLoadSnippetFromFile(Files[i], InfoRec) then
      begin
        InfoClass:= TSynSnippetClass.Create;
        InfoClass.Info.Name:= InfoRec.Name;
        InfoClass.Info.Id:= InfoRec.Id;
        InfoClass.Info.Lexers:= InfoRec.Lexers;
        InfoClass.Info.Text:= InfoRec.Text;
        FListSnippets.Add(InfoClass);
      end;
  finally
    FreeAndNil(Files);
  end;
end;

procedure TfmMain.ClearSnippets;
var
  i: Integer;
begin
  if Assigned(FListSnippets) then
  begin
    for i:= FListSnippets.Count-1 downto 0 do
    begin
      TObject(FListSnippets[i]).Free;
      FListSnippets[i]:= nil;
    end;
    FListSnippets.Clear;
  end;
end;

function TfmMain.DoSnippetChoice(const SInitialText: string): integer;
begin
  Result:= -1;
  InitSnippets;

  with TfmMenuSnippets.Create(Self) do
  try
    Caption:= DKLangConstW('zMSnippetList');
    cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');

    Edit.Text:= SInitialText;
    MemoText.Font.Assign(CurrentEditor.Font);

    FInfoList:= Self.FListSnippets;
    FCurrentLexer:= Self.CurrentLexer;

    FIniFN:= Self.SynHistoryIni;
    FColorSel:= opColorOutSelText;
    FColorSelBk:= opColorOutSelBk;

    if ShowModal=mrOk then
      if List.ItemIndex>=0 then
        Result:= Integer(List.Items.Objects[List.ItemIndex]);
  finally
    Free
  end;
end;

procedure TfmMain.DoSnippetListDialog(const SInitialText: string);
var
  Ed: TSyntaxMemo;
  Index: Integer;
  SSelText, SSnippetText: Widestring;
begin
  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;

  Index:= DoSnippetChoice(SInitialText);
  if Index>=0 then
  begin
    SSelText:= Ed.SelText;
    SSnippetText:= TSynSnippetClass(FListSnippets[Index]).Info.Text;

    Ed.BeginUpdate;
    try
      Ed.ClearSelection;
      if SInitialText<>'' then
      begin
        Ed.CaretStrPos:= Ed.CaretStrPos - Length(SInitialText);
        Ed.DeleteText(Length(SInitialText));
      end;
      EditorInsertSnippet(Ed, SSnippetText, SSelText);
    finally
      Ed.EndUpdate;
    end;
  end;
end;

function TfmMain.DoSnippetEditorDialog(var AInfo: TSynSnippetInfo): boolean;
begin
  with TfmSnippetEditor.Create(Self) do
  try
    edName.Text:= AInfo.Text;
    edId.Text:= AInfo.Id;
    edLex.Text:= AInfo.Lexers;
    memoText.Text:= AInfo.Text;
    memoText.Font.Assign(CurrentEditor.Font);

    Result:= ShowModal=mrOk;
    if Result then
    begin
      AInfo.Name:= edName.Text;
      AInfo.Id:= edId.Text;
      AInfo.Lexers:= edLex.Text;
      AInfo.Text:= memoText.Text;
    end;
  finally
    Free
  end;
end;

procedure TfmMain.DoSnippetNew;
var
  AInfo: TSynSnippetInfo;
  ADir: string;
begin
  DoClearSnippet(AInfo);
  AInfo.Lexers:= CurrentLexer;
  ADir:= SynSnippetsDir;

  if DoSnippetEditorDialog(AInfo) then
  begin
    CreateDir(ADir);
    if not DirectoryExists(ADir) then
      begin MsgNoDir(ADir); Exit end;

    with SD_Snippets do
    begin
      InitialDir:= ADir;
      FileName:= AInfo.Name;
      if Execute then
      begin
        DoSaveSnippetToFile(FileName, AInfo);
        DoSnippetsReload;
      end;
    end;
  end;
end;

procedure TfmMain.DoSnippetsReload;
begin
  if FListSnippets<>nil then
    LoadSnippets;
end;

procedure TfmMain.TbxItemRunSnippetsClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SnippetsDialog);
end;

procedure TfmMain.TbxItemRunNewSnippetClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_NewSnippetDialog);
end;


procedure TfmMain.TbxItemTreeSortedClick(Sender: TObject);
begin
  with CurrentFrame do
  begin
    IsTreeSorted:= not IsTreeSorted;
    if IsTreeSorted then
      Tree.SortType:= stText
    else
      Tree.SortType:= stNone;
  end;

  Tree.UpdateTree;
end;

procedure TfmMain.ApplyPanelTitles;
var
  en: boolean;
begin
  en:= opShowPanelTitles;
  plTree.ShowCaptionWhenDocked:= en;
  plOut.ShowCaptionWhenDocked:= en;
  plClip.ShowCaptionWhenDocked:= en;
  if Assigned(FProjPreview) then
    FProjPreview.ShowCaptionWhenDocked:= en;
  DoResizePlugins;
end;

procedure TfmMain.TbxItemPanelTitleBarClick(Sender: TObject);
begin
  opShowPanelTitles:= not opShowPanelTitles;
  ApplyPanelTitles;

  with TIniFile.Create(SynIni) do
  try
    WriteBool('View', 'PaneTitle', opShowPanelTitles);
  finally
    Free
  end;
end;

procedure TfmMain.PopupPanelTitlePopup(Sender: TObject);
begin
  TbxItemPanelTitleBar.Checked:= opShowPanelTitles;
end;

function MainPyEditor(H: Integer): TSyntaxMemo;
var
  nTab: Integer;
begin
  Result:= nil;
  if Assigned(fmMain) then
  begin
    case H of
      0:
        Result:= fmMain.CurrentEditor;
      1:
        Result:= fmMain.BrotherEditor(fmMain.CurrentEditor);
      2:
        Result:= fmMain.OppositeFrame.EditorMaster;
      3:
        Result:= fmMain.OppositeFrame.EditorSlave;
      cPyEditorHandleMin..
      cPyEditorHandleMax:
        begin
          nTab:= H-cPyEditorHandleMin;
          if (nTab>=0) and (nTab<fmMain.FrameAllCount) then
            Result:= fmMain.FramesAll[nTab].EditorMaster
          else
            Result:= nil;
        end;
      else
        Result:= TSyntaxMemo(Pointer(H));
    end;
  end;
end;

procedure TfmMain.DoWorkaround_QViewHorzScroll;
begin
  //fix incorrect ScrollPosX>0
  if CurrentFrame<>nil then
    with CurrentFrame do
    begin
      EditorMaster.ScrollPosX:= 0;
      EditorSlave.ScrollPosX:= 0;
    end;
end;

procedure TfmMain.DoWorkaround_FindNext1;
begin
  if (Finder.Matches>0) and (Finder.MatchLen=0) and (not Finder.IsSpecialCase1) then
    with CurrentEditor do
      if CaretStrPos>0 then
        CaretStrPos:= CaretStrPos-1;
end;

function TfmMain.DoCheckAutoCorrectCase(Ed: TSyntaxMemo): boolean;
var
  NCaret, NLen, i: Integer;
  SId, SAcpId: string;
begin
  Result:= false;
  if not opAutoCase then Exit;

  NCaret:= Ed.CaretStrPos;
  if not IsWordChar(Ed.Lines.Chars[NCaret]) then Exit;

  SId:= EditorGetWordBeforeCaret(Ed, false);
  NLen:= Length(SId);

  for i:= 0 to FAcpList_Items.Count-1 do
  begin
    SAcpId:= FAcpList_Items[i];

    if not IsWordChar(WideChar(SAcpId[Length(SAcpId)])) then
      SetLength(SAcpId, Length(SAcpId)-1);

    if StrIComp(PChar(SAcpId), PChar(SId))=0 then
    begin
      if (SAcpId<>SId) and
        IsPositionMatchesTokens(Ed, NCaret-1, NCaret, tokensExceptCmtStr) then
      begin
        Ed.ReplaceText(NCaret-NLen, NLen, SAcpId);
        DoHint('Id: ' + SAcpId);
        Result:= true;
      end;
      Break;
    end;
  end;
end;

procedure TfmMain.DoOpenFolder(const dir: Widestring);
var
  L: TTntStringList;
  i, NCount: Integer;
  fn: Widestring;
begin
  L:= TTntStringList.Create;
  try
    FFindToList(L, dir, '*', '',
      true{SubDir},
      false{NoRO}, false{NoHidFiles}, true{NoHidFolders});

    //exclude binary files
    NCount:= L.Count;
    for i:= L.Count-1 downto 0 do
    begin
      Application.Title:= Format('filter %d / %d', [NCount-i, NCount]);
      Application.ProcessMessages;
      if Application.Terminated then Exit;

      fn:= L[i];
      if not IsFileText(fn) or IsFileTooBig(fn) then
        L.Delete(i);
    end;

    //confirm
    if L.Count > cMaxFilesInFolder then
      if not MsgConfirm(
        WideFormat(DKLangConstW('zMCfmOpenFolder'), [dir, L.Count]),
        Handle) then Exit;

    //open left files
    for i:= 0 to L.Count-1 do
    begin
      Application.Title:= Format('... %d / %d', [i+1, L.Count]);
      Application.ProcessMessages;
      if Application.Terminated then Exit;

      fn:= L[i];
      DoOpenFile(fn);
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.DoEnumLexers(L: TTntStrings; AlsoDisabled: boolean = false);
var
  i: Integer;
begin
  with SyntaxManager do
    for i:= 0 to AnalyzerCount-1 do
      if AlsoDisabled or not Analyzers[i].Internal then
        L.Add(Analyzers[i].LexerName);
end;

procedure TfmMain.TBXItemMarkGoLastClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_JumpToLastMarker);
end;

procedure TfmMain.TBXItemMarkClearClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_MarkersClear);
end;

procedure TfmMain.TbxItemWinSplitHClick(Sender: TObject);
begin
  with CurrentFrame do
  begin
    if not IsSplitted then
    begin
      SplitHorz:= true;
      SplitPos:= 50;
    end
    else
    if not SplitHorz then
      SplitHorz:= true
    else
      SplitPos:= 0;
  end;
end;

procedure TfmMain.TbxItemWinSplitVClick(Sender: TObject);
begin
  with CurrentFrame do
  begin
    if not IsSplitted then
    begin
      SplitHorz:= false;
      SplitPos:= 50;
    end
    else
    if SplitHorz then
      SplitHorz:= false
    else
      SplitPos:= 0;
  end;
end;

function TfmMain.FrameIndex(F: TEditorFrame): Integer;
var
  i: Integer;
begin
  Result:= -1;
  for i:= 0 to FrameAllCount-1 do
    if F=FramesAll[i] then
    begin
      Result:= i;
      Break
    end;
end;

procedure TfmMain.DoFindDialog_FindAllInCurrentTab(AWithBkmk, ASelectResults: boolean);
var
  ADir: Widestring;
  AFrame: TEditorFrame;
  AFrameIndex: Integer;
begin
  CurrentEditor.ResetSearchMarks;
  CurrentEditor.RemoveCarets;

  ADir:= '';
  AFrame:= CurrentFrame;
  AFrameIndex:= FrameIndex(AFrame);

  //init TreeRoot, show pane
  UpdateTreeFind_Initial(Finder.FindText, ADir, true);
  UpdatePanelOut(tbFind);
  plOut.Show;

  FListFiles.Clear;
  FListResFN_Prev:= '';
  FListResFN:= SGetTabPrefix + IntToStr(AFrameIndex+1);
  if AFrame.FileName<>'' then
    FListResFN:= FListResFN + '[' + WideExtractFileName(AFrame.FileName) + ']';

  try
    FindInFrame(AFrame, true, AWithBkmk);
  except
    on E: Exception do
    begin
      MsgExcept('Error on searching in tab', E, Handle);
      DoProgressHide;
      Exit;
    end;
  end;

  //update states
  if Assigned(fmSR) then
    fmSR.ShowError(Finder.Matches=0);
  UpdateStatusbar; //needed as bookmarks appear
  UpdateFrameMicroMap(AFrame);

  //update "Search Results" pane
  if FTreeRoot=nil then
    raise Exception.Create('TreeRoot nil');
  UpdateTreeFind_Results(Finder.FindText, ADir, false, true);
  UpdatePanelOut(tbFind);
  plOut.Show;

  if ASelectResults then
    CurrentEditor.ExecCommand(smCaretsFromMarksRight);
end;

procedure TfmMain.DoPyStringToEvents(const Str: string;
  var AEvents: TSynPyEvents;
  var AKeycodes: string);
var
  SText, SItem: Widestring;
  ev: TSynPyEvent;
begin
  AEvents:= [];
  AKeycodes:= '';
  SText:= Str;

  repeat
    SItem:= SGetItem(SText);
    if SItem='' then Break;

    if SItem[1]='k' then
    begin
      Delete(SItem, 1, 1);
      AKeyCodes:= AKeyCodes+SItem+',';
      Continue;
    end;

    for ev:= Low(TSynPyEvent) to High(TSynPyEvent) do
      if SItem=cSynPyEvent[ev] then
      begin
        Include(AEvents, ev);
        Break
      end;
  until false;
end;

function TfmMain.DoPyEvent(AEd: TSyntaxMemo; AEvent: TSynPyEvent;
  const AParams: array of string): Widestring;
var
  SCurLexer: string;
  i: Integer;
begin
  //empty string result means "no handlers for event"
  Result:= '';
  SCurLexer:= CurrentLexerForFile;

  for i:= Low(FPluginsEvent) to High(FPluginsEvent) do
    with FPluginsEvent[i] do
    begin
      if (SFilename='') then Break;
      if (AEvent in Events) then
        if (SLexers='') or IsLexerListed(SCurLexer, SLexers) then
        begin
          //check that OnKey event is called for supported keys
          if (AEvent=cSynEventOnKey) then
            if Length(AParams)>=1 then
              if (SKeycodes<>'') and not IsStringListed(AParams[0], SKeycodes) then
                Continue;

          //call Python
          Result:= DoPyLoadPluginWithParams(SFilename, cSynPyEvent[AEvent], AEd, AParams);
          //False result means "stop", others ignored
          if Result=cPyFalse then Exit;
        end;
    end;
end;

procedure TfmMain.DoPyEvent_GetLineNumber(
  AEd: TSyntaxMemo;
  const ALineNum: Integer;
  var AResult: string);
var
  AEvent: TSynPyEvent;
  i: Integer;
begin
  AEvent:= cSynEventOnNumber;

  for i:= Low(FPluginsEvent) to High(FPluginsEvent) do
    with FPluginsEvent[i] do
    begin
      if (SFilename='') then Break;
      if (AEvent in Events) then
      //no check for lexer name, to speed-up
      begin
        AResult:= DoPyLoadPluginWithParams(SFilename, cSynPyEvent[AEvent], AEd, [IntToStr(ALineNum)]);
        Exit;
      end;
    end;
end;


procedure TfmMain.DoLoadPlugins_Events(const fn_plug_ini: string);
var
  ListSec: TStringList;
  NIndex, i: Integer;
  sKey, sValue, sValue2, sValue3, sValue4, sValue5: Widestring;
begin
  //clear Event list
  for i:= Low(FPluginsEvent) to High(FPluginsEvent) do
    with FPluginsEvent[i] do
    begin
      SFileName:= '';
      SLexers:= '';
      Events:= [];
    end;

  //load section "Events"
  ListSec:= TStringList.Create;
  with TIniFile.Create(fn_plug_ini) do
  try
    ReadSectionValues('Events', ListSec);
  finally
    Free
  end;

  //parse section "Events"
  try
    NIndex:= Low(FPluginsEvent);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4, sValue5);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsEvent) then
      begin
        FPluginsEvent[NIndex].SFileName:= sValue;
        DoPyStringToEvents(sValue2,
          FPluginsEvent[NIndex].Events,
          FPluginsEvent[NIndex].SKeycodes);
        FPluginsEvent[NIndex].SLexers:= sValue3;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;
end;


procedure TfmMain.DoLoadPlugins_Commands(const fn_plug_ini: string);
var
  ListSec: TStringList;
  NIndex, i: Integer;
  sKey, sValue, sValue2, sValueLexers, sValueHotkey, sValueFlags: Widestring;
begin
  //clear Command list
  for i:= Low(FPluginsCommand) to High(FPluginsCommand) do
    with FPluginsCommand[i] do
    begin
      SCaption:= '';
      SHotkey:= '';
      SFileName:= '';
      SLexers:= '';
      SCmd:= '';
    end;

  //load section "Commands"
  ListSec:= TStringList.Create;
  with TIniFile.Create(fn_plug_ini) do
  try
    ReadSectionValues('Commands', ListSec);
  finally
    Free
  end;

  //parse section "Commands"
  try
    NIndex:= Low(FPluginsCommand);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValueLexers, sValueHotkey, sValueFlags);
      if (sKey='') or (sValue='') then Continue;
      //field sValueFlags is for future

      if NIndex<=High(FPluginsCommand) then
      begin
        if SBegin(sValue, cPyPrefix) then
          FPluginsCommand[NIndex].SFileName:= sValue
        else
          FPluginsCommand[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsCommand[NIndex].SCmd:= sValue2;
        FPluginsCommand[NIndex].SLexers:= sValueLexers;
        FPluginsCommand[NIndex].SCaption:= sKey;
        FPluginsCommand[NIndex].SHotkey:= sValueHotkey;

        //a) add to main-menu always
        DoAddPluginMenuItem(TBXSubmenuItemPlugins, sKey, sValueHotkey, NIndex);

        //b) add to context menu - if enabled
        if Pos('-', sValueFlags)=0 then
        begin
          TBXSubmenuItemCtxPlugins.Visible:= true;
          DoAddPluginMenuItem(TBXSubmenuItemCtxPlugins, sKey, sValueHotkey, NIndex);
        end;
        
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;
end;

procedure TfmMain.DoLoadPlugins_Complete(const fn_plug_ini: string);
var
  ListSec: TStringList;
  NIndex, i: Integer;
  sKey, sValue, sValue2, sValue3, sValue4, sValue5: Widestring;
begin
  //clear ACP list
  for i:= Low(FPluginsAcp) to High(FPluginsAcp) do
    with FPluginsAcp[i] do
    begin
      SLexers:= '';
      SFileName:= '';
    end;

  //load section "Complete"
  ListSec:= TStringList.Create;
  with TIniFile.Create(fn_plug_ini) do
  try
    ReadSectionValues('Complete', ListSec);
  finally
    Free
  end;

  //parse section "Complete"
  try
    NIndex:= Low(FPluginsAcp);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4, sValue5);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsAcp) then
      begin
        if SBegin(sValue, cPyPrefix) then
          FPluginsAcp[NIndex].SFileName:= sValue
        else
          FPluginsAcp[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsAcp[NIndex].SLexers:= sValue2;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;
end;

procedure TfmMain.DoLoadPlugins_FindId(const fn_plug_ini: string);
var
  ListSec: TStringList;
  NIndex, i: Integer;
  sKey, sValue, sValue2, sValue3, sValue4, sValue5: Widestring;
begin
  //clear FindID list
  for i:= Low(FPluginsFindid) to High(FPluginsFindid) do
    with FPluginsFindid[i] do
    begin
      SLexers:= '';
      SFileName:= '';
    end;

  //load section "FindID"
  ListSec:= TStringList.Create;
  with TIniFile.Create(fn_plug_ini) do
  try
    ReadSectionValues('FindID', ListSec);
  finally
    Free
  end;

  //parse section "FindID"
  try
    NIndex:= Low(FPluginsFindid);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4, sValue5);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsFindid) then
      begin
        if SBegin(sValue, cPyPrefix) then
          FPluginsFindid[NIndex].SFileName:= sValue
        else
          FPluginsFindid[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsFindid[NIndex].SLexers:= sValue2;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;
end;

procedure TfmMain.DoLoadPlugins_Panels(const fn_plug_ini: string);
var
  ListSec: TStringList;
  NIndex, i: Integer;
  sKey, sValue, sValue2, sValue3, sValue4, sValue5: Widestring;
begin
  //clear Panels list
  for i:= Low(FPluginsPanel) to High(FPluginsPanel) do
    with FPluginsPanel[i] do
    begin
      SCaption:= '';
      SFileName:= '';
    end;

  //load section "Panels"
  ListSec:= TStringList.Create;
  with TIniFile.Create(fn_plug_ini) do
  try
    ReadSectionValues('Panels', ListSec);
  finally
    Free
  end;

  //parse section "Panels"
  try
    NIndex:= Low(FPluginsPanel);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4, sValue5);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsPanel) then
      begin
        FPluginsPanel[NIndex].SCaption:= sKey;
        FPluginsPanel[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;
end;

procedure TfmMain.DoTestPlugins;
var
  i: Integer;
  sValue: string;
begin
  //test output
  sValue:= '';
  for i:= 0 to 5 do
    with FPluginsEvent[i] do
      if SFilename<>'' then
        sValue:= sValue+SFilename+#13+SLexers+#13+SKeycodes+#13{+IfThen(cSynEventOnSave in Events, 'on_save')};
  MsgInfo(sValue, Handle);
end;

procedure TfmMain.DoClearFindDialogStatus;
begin
  if Assigned(fmSR) then
    fmSR.ShowStatus('');
end;

procedure TfmMain.DoPyResetPlugins;
var
  fn, Cmd: string;
  L: TStringList;
begin
  fn:= SynPyDir + '\sw_reset_plugins.py';
  if not FileExists(fn) then
    begin MsgNoFile(fn); Exit end;

  L:= TStringList.Create;
  try
    L.LoadFromFile(fn);
    GetPythonEngine.ExecStrings(L);
    Cmd:= Format('_reset_plugins(r"%s")', [SynPyDir]);
    GetPythonEngine.ExecString(Cmd);
  finally
    FreeAndNil(L)
  end;
end;


procedure TfmMain.ecToggleProjPreviewExecute(Sender: TObject);
begin
  if Assigned(FProjPreview) then
  begin
    if Assigned(fmProj) then
      fmProj.DoPreview(true{Toggle})
    else
      ProjPreview(Sender, '', true{Toggle});
  end;
end;

procedure TfmMain.ProjPreviewVisibleChanged(Sender: TObject);
begin
end;

procedure TfmMain.UpdateLexerTo(An: TSyntAnalyzer);
begin
  SyntaxManager.CurrentLexer:= An;
  SyntaxManagerChange(Self);
end;

procedure TfmMain.acExportHTMLBeforeExecute(Sender: TObject);
begin
  UpadateFilenameForExport;
end;

procedure TfmMain.UpadateFilenameForExport;
begin
  //variable in ecActns.pas
  ecActns.ecExportsBaseFilename:= ChangeFileExt(ExtractFileName(CurrentFrame.FileName), '');
end;

function TfmMain.DoGetProjectFilename(id: Integer): Widestring;
begin
  Result:= '';
  if Assigned(fmProj) then
    if (id>=0) and (id<fmProj.TreeProj.Items.Count) then
      Result:= fmProj.GetFN(fmProj.TreeProj.Items[id]);
end;

procedure TfmMain.ProjRunTool(const ATool: TSynTool);
begin
  RunTool(ATool);
end;

procedure TfmMain.TBXSubmenuItemBkPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  bk, ro: boolean;
begin
  ro:= CurrentEditor.ReadOnly;
  bk:= CurrentEditor.BookmarkObj.Count>0;

  TBXItemBkClear.Enabled:= bk;
  TBXItemBkNext.Enabled:= bk;
  TBXItemBkPrev.Enabled:= bk;
  TBXItemBkCopy.Enabled:= bk;
  TBXItemBkCut.Enabled:= bk and not ro;
  TBXItemBkDel.Enabled:= bk and not ro;
  TBXItemBkDelUnmk.Enabled:= not ro;
  TBXItemBkPaste.Enabled:= bk and not ro;
  TBXItemBkGoto.Enabled:= bk;
end;



procedure TfmMain.FrameGetTabCaption(Sender: TFrame; var Str: Widestring);
  function SCut(const S: Widestring): Widestring;
  begin
    //Result:= STruncateLong(S, 40, true); //not needed with new tabs
    Result:= S;
  end;
var
  Frame: TEditorFrame;
begin
  Frame:= Sender as TEditorFrame;
  if Frame.FileName='' then
    Str:= DKLangConstW('Untitled')
  else
  begin
    Str:= SCut(WideExtractFileName(Frame.FileName));
    if opTabDirs then
      Str:= SCut(WideExtractFileName(WideExtractFileDir(Frame.FileName))) + '\' + Str;
  end;

  Str:=
    IfThen(Frame.IsFtp, 'ftp: ') +
    IfThen(Frame.Modified, '*') +
    Str;
end;

procedure TfmMain.DoToggleTabDirs;
begin
  opTabDirs:= not opTabDirs;
  ApplyTabOptions;
end;

procedure TfmMain.TbxItemPreCopyClick(Sender: TObject);
begin
  if Assigned(FProjPreviewEditor) then
    FProjPreviewEditor.CopyToClipboard;
end;

procedure TfmMain.TbxItemPreSelectClick(Sender: TObject);
begin
  if Assigned(FProjPreviewEditor) then
    FProjPreviewEditor.SelectAll;
end;


procedure TfmMain.TbxItemPreZoom25Click(Sender: TObject);
begin
  ApplyPreviewZoom(25);
end;

procedure TfmMain.TbxItemPreZoom50Click(Sender: TObject);
begin
  ApplyPreviewZoom(50);
end;

procedure TfmMain.TbxItemPreZoom75Click(Sender: TObject);
begin
  ApplyPreviewZoom(75);
end;

procedure TfmMain.TbxItemPreZoom100Click(Sender: TObject);
begin
  ApplyPreviewZoom(100);
end;

procedure TfmMain.TbxItemPreEditClick(Sender: TObject);
begin
  ProjPreviewButtonClick(Self);
end;

procedure TfmMain.TbxItemPreZoomOtherClick(Sender: TObject);
var
  Str: Widestring;
begin
  if Assigned(FProjPreviewEditor) then
  begin
    Str:= IntToStr(FProjPreviewEditor.Zoom);
    if DoInputString(DKLangConstW('zMZoomPrompt'), Str) then
      ApplyPreviewZoom(StrToIntDef(Str, FProjPreviewEditor.Zoom));
  end;
end;

procedure TfmMain.PopupPreviewEditorPopup(Sender: TObject);
var
  Ed: TSyntaxMemo;
begin
  //captions
  TbxItemPreCopy.Caption:= TBXItemECopy.Caption;
  TbxItemPreSelect.Caption:= TBXItemESelectAll.Caption;
  UpdKey_String(TbxItemPreCopy, ''); //remove text "Ctrl+C"
  UpdKey_String(TbxItemPreSelect, ''); //remove text "Ctrl+A"

  TbxItemPreZoom25.Caption:= '25%';
  TbxItemPreZoom50.Caption:= '50%';
  TbxItemPreZoom75.Caption:= '75%';
  TbxItemPreZoom100.Caption:= '100%';
  TbxItemPreZoomOther.Caption:= TBXItemZOther.Caption;
  TbxItemPreEdit.Caption:= DKLangConstW('MPreButton');

  //checked states
  Ed:= FProjPreviewEditor;
  if Assigned(Ed) then
  begin
    TbxItemPreCopy.Enabled:= Ed.HaveSelection;
    TbxItemPreEdit.Enabled:= FProjPreviewFilename<>'';

    TbxItemPreZoom25.Checked:= Ed.Zoom=25;
    TbxItemPreZoom50.Checked:= Ed.Zoom=50;
    TbxItemPreZoom75.Checked:= Ed.Zoom=75;
    TbxItemPreZoom100.Checked:= Ed.Zoom=100;
    TbxItemPreZoomOther.Checked:= not (
      TbxItemPreZoom25.Checked or
      TbxItemPreZoom50.Checked or
      TbxItemPreZoom75.Checked or
      TbxItemPreZoom100.Checked );
  end;
end;

procedure TfmMain.PopupStatusEncClosePopup(Sender: TObject);
begin
  //
end;

procedure TfmMain.PopupClipsPopup(Sender: TObject);
begin
  TBXItemClipsDelText.Enabled:= fmClips.GetCurrentClip<>'';
end;

procedure TfmMain.DoInsertUnicodeHexDialog;
var
  Str: Widestring;
  Num: LongWord;
begin
  if CurrentEditor.ReadOnly then Exit;
  if not DoInputCharCode(Str, Num, SynHistoryIni) then Exit;
  CurrentEditor.InsertText(Str);
  DoHint(WideFormat(DKLangConstW('zMInputUnicodeHex'),
    [Str, IntToHex(Num, 4)]));
end;

procedure TfmMain.InitGroups;
begin
  Groups:= TATGroups.Create(Self);
  Groups.Parent:= PanelBg;
  Groups.Align:= alClient;

  Groups.OnTabAdd:= TabAdd;
  Groups.OnTabFocus:= TabFocus;
  Groups.OnTabClose:= TabClose;
  Groups.OnTabPopup:= TabPopup;
  Groups.OnTabOver:= TabOver;

  ApplyTabOptions;
  Groups.Mode:= opGroupMode;
  Groups.SplitPos:= opGroupSplit;
end;

function TfmMain.DoAddTab(Pages: TATPages): TEditorFrame;
begin
  Result:= CreateFrame;
  Result.Parent:= Self;
  Result.Visible:= false;

  UpdateEditorCaret(Result.EditorMaster);
  UpdateEditorCaret(Result.EditorSlave);
  UpdateFrameZoom(Result);
  UpdateColorHint;

  Pages.AddTab(Result, DKLangConstW('Untitled'));
end;

procedure TfmMain.TabAdd(Sender: TObject);
begin
  DoAddTab((Sender as TATTabs).Parent as TATPages);
end;

procedure TfmMain.TabFocus(Sender: TObject);
var
  D: TATTabData;
begin
  D:= (Sender as TATTabs).GetTabData((Sender as TATTabs).TabIndex);
  if D<>nil then
    if D.TabObject<>nil then
    begin
      if QuickView then
      begin
        //don't focus! but set CurrentEditor.
        CurrentEditor:= (D.TabObject as TEditorFrame).EditorMaster;
      end
      else
        FocusFrame(D.TabObject as TEditorFrame);

      UpdateOnFrameChanged;
    end;
end;

procedure TfmMain.TabClose(Sender: TObject; ATabIndex: Integer;
  var ACanClose, ACanContinue: boolean);
var
  D: TATTabData;
begin
  D:= (Sender as TATTabs).GetTabData(ATabIndex);
  if D<>nil then
    CloseFrameWithCfm(D.TabObject as TEditorFrame, ACanClose, ACanContinue);
end;

procedure TfmMain.TabPopup(Sender: TObject);
var
  P: TPoint;
begin
  P:= Mouse.CursorPos;
  PopupTabContext.Popup(P.X, P.Y);
end;

procedure TfmMain.TbxItemGroupOneClick(Sender: TObject);
begin
  Groups.Mode:= gmOne;
end;

procedure TfmMain.TbxItemGroup2HClick(Sender: TObject);
begin
  Groups.Mode:= gm2Horz;
end;

procedure TfmMain.TbxItemGroup2VClick(Sender: TObject);
begin
  Groups.Mode:= gm2Vert;
end;

procedure TfmMain.TbxItemGroup3HClick(Sender: TObject);
begin
  Groups.Mode:= gm3Horz;
end;

procedure TfmMain.TbxItemGroup3VClick(Sender: TObject);
begin
  Groups.Mode:= gm3Vert;
end;

procedure TfmMain.TbxItemGroup3as1p2Click(Sender: TObject);
begin
  Groups.Mode:= gm3Plus;
end;

procedure TfmMain.TbxItemGroup4HClick(Sender: TObject);
begin
  Groups.Mode:= gm4Horz;
end;

procedure TfmMain.TbxItemGroup4VClick(Sender: TObject);
begin
  Groups.Mode:= gm4Vert;
end;

procedure TfmMain.TbxItemGroup4GridClick(Sender: TObject);
begin
  Groups.Mode:= gm4Grid;
end;

procedure TfmMain.TbxItemGroup6GridClick(Sender: TObject);
begin
  Groups.Mode:= gm6Grid;
end;

procedure TfmMain.TBXSubmenuItemGroupsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  TbxItemGroupOne.Checked:= Groups.Mode=gmOne;
  TbxItemGroup2H.Checked:= Groups.Mode=gm2Horz;
  TbxItemGroup2V.Checked:= Groups.Mode=gm2Vert;
  TbxItemGroup3H.Checked:= Groups.Mode=gm3Horz;
  TbxItemGroup3V.Checked:= Groups.Mode=gm3Vert;
  TbxItemGroup3as1p2.Checked:= Groups.Mode=gm3Plus;
  TbxItemGroup4H.Checked:= Groups.Mode=gm4Horz;
  TbxItemGroup4V.Checked:= Groups.Mode=gm4Vert;
  TbxItemGroup4Grid.Checked:= Groups.Mode=gm4Grid;
  TbxItemGroup6Grid.Checked:= Groups.Mode=gm6Grid;
end;

procedure TfmMain.TbxItemToGroup1Click(Sender: TObject);
var
  N: Integer;
begin
  N:= (Sender as TComponent).Tag;
  if N>0 then
  begin
    if (N=2) and (Groups.Mode=gmOne) then
      Groups.Mode:= gm2Horz;
    Groups.MoveTab(Groups.PopupPages, Groups.PopupTabIndex, Groups.Pages[N], -1, false);
  end
  else
  if (N=-1) then
    Groups.MovePopupTabToNext(true)
  else
  if (N=-2) then
    Groups.MovePopupTabToNext(false);
end;

procedure TfmMain.TBXSubmenuItemToGroupPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  Cnt, N: Integer;
begin
  Cnt:= Groups.PagesVisibleCount; //visible groups
  N:= Groups.PagesIndexOf(Groups.PopupPages); //current group

  TbxItemToGroup1.Enabled:= (Cnt>=2) and (N<>1);
  TbxItemToGroup2.Enabled:= {(Cnt>=2) and} (N<>2);
  TbxItemToGroup3.Enabled:= (Cnt>=3) and (N<>3);
  TbxItemToGroup4.Enabled:= (Cnt>=4) and (N<>4);
  TbxItemToGroup5.Enabled:= (Cnt>=5) and (N<>5);
  TbxItemToGroup6.Enabled:= (Cnt>=6) and (N<>6);
  TbxItemToGroupNext.Enabled:= Cnt>=2;
  TbxItemToGroupPrev.Enabled:= Cnt>=2;
end;

function TfmMain.DoSetPagesAndTabIndex(APageIndex, ATabIndex: Integer): boolean;
begin
  Result:= Groups.SetPagesAndTabIndex(APageIndex, ATabIndex);
  if Result then
    UpdateTabList(ATabIndex, -1, -1);
end;


function TfmMain.GetCurrentFrameInPages(Pages: TATPages): TEditorFrame;
var
  D: TATTabData;
begin
  Result:= nil;
  if Pages<>nil then
    with Pages do
      if Tabs.TabCount>0 then
      begin
        D:= Tabs.GetTabData(Tabs.TabIndex);
        if D<>nil then
          Result:= D.TabObject as TEditorFrame;
      end;
end;


procedure TfmMain.TabOver(Sender: TObject; ATabIndex: Integer);
var
  D: TATTabData;
begin
  if ATabIndex>=0 then //discard -1, -2
    with (Sender as TATTabs) do
    begin
      D:= GetTabData(ATabIndex);
      if D<>nil then
        DoShowHintFilename((D.TabObject as TEditorFrame).FileName);
    end
  else
    DoHint('');
end;

procedure TfmMain.DoColorsArrayRead(var C: TSynColors; const StrIni: string);
var
  i: Integer;
  Str: Widestring;
begin
  Str:= StrIni;
  for i:= Low(C) to High(C) do
    C[i]:= StrToIntDef(SGetItem(Str), C[i]);
end;

function TfmMain.DoColorsArrayAsString(const C: TSynColors): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= Low(C) to High(C) do
    Result:= Result+IntToStr(C[i])+',';
end;

procedure TfmMain.UpdateActiveTabColors;
var
  i: Integer;
begin
  for i:= Low(Groups.Pages) to High(Groups.Pages) do
    with Groups.Pages[i] do
    begin
      Tabs.ColorTabActive:= IfThen(
        Groups.Pages[i]=Groups.PagesCurrent,
        opColorTabBgActive,
        opColorTabBgActive2);
      Tabs.Invalidate;
    end;
end;

initialization
  unProcPy.PyEditor:= MainPyEditor;

end.

