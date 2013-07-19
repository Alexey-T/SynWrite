//-------------------------------------------------------
// SynWrite
// Main form class
//-------------------------------------------------------
//
//{$define TabOrder} //Show tabs switch-order in caption
//SPELL word must be defined in project options (if spell lib available)
{$Q-} //Disable to avoid integer exception in TabCtrl_GetXRect (can't find)

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
  unProcSort,
  unTabSw,

  TB2Item, TB2Dock, TB2Toolbar,
  TB2MDI, TB2ExtItems,

  SpTBXItem, SpTbxMDIMRU, SpTBXDkPanels, SpTBXSkins,
  SpTBXControls, SpTBXTabs, SpTBXEditors, 

  ecActns, ecPrint, ecSyntMemo, ecKeyMap, ecPropManager, ecSyntAnal,
  ecSyntTree, ecStrUtils, ecPopupCtrl, ecUnicode,

  TntDialogs, TntStdCtrls, TntComCtrls,
  DKLang,
  PngImageList,
  
  unProc,
  ATSynPlugins,
  ecMacroRec,
  ecExtHighlight,
  ecSpell;

const
  opMruForPlugin = false; //use MRU list for Lister-plugin
  cTabColors = 10; //number of misc tab colors (user-defined)
  cFixedLeftTabs = 3; //number of fixed tabs on left panel (Tree; Project; Tabs)
  cMaxTreeLen = 400; //"find in files" result tree: max node length
  SynDefaultSyn = '(default).syn';

type
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
    scmdExtractDupsNoCase
    );

  TSynCopyNameCmd = (
    scmdCopyFileName,
    scmdCopyFullName,
    scmdCopyFilePath
    );

  TPluginList_Command = array[0..19] of record
    SFilename: string;
    SLexers: string;
    SCmd: string;
  end;

  TPluginList_Findid = array[0..7] of record
    SFilename: string;
    SLexers: string;
  end;

  TPluginList_Acp = TPluginList_FindId;

  TPluginList_Panel = array[0..7] of record
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
  TSynTool = record
    ToolCaption,
    ToolCommand,
    ToolDir,
    ToolParams,
    ToolLexer,
    ToolKeys: WideString;
    ToolOutCapture: boolean;
    ToolOutType: string;
    ToolOutEncoding: TOutputEnc;
    ToolOutRegex: string;
    ToolOutNum_fn,
    ToolOutNum_line,
    ToolOutNum_col: integer;
    ToolSaveMode: TSynToolSave;
    ToolNoTags: boolean;
    ToolContextItem: boolean;
  end;

  TSynFindInfo = class
    FN: Widestring;
    LineNum, ColNum, Len: integer;
    constructor Create;
  end;

  TSynFindCount = class
    Matches: integer;
  end;

type
  TSynDock = (sdockTop, sdockLeft, sdockRight, sdockBottom);
  TSynPanelType = (plTypeTree, plTypeClip, plTypeOut);
  TSynFileSort = (sortNone, sortDate, sortDateDesc);
  TSynSelState = (selNone, selSmall, selStream, selColumn, selCarets);
  TSynGotoTree = (tgoNext, tgoPrev, tgoParent, tgoNextBro, tgoPrevBro);
  TSynGotoMode = (goLine, goPrevBk, goNextBk, goNumBk);
  TSynTabOut = (tbOut, tbFind, tbVal, tbPluginsLog);
  TSynTabRight = (tbClip, tbMap, tbTextClips);
  TSynTabLeft = (tbTree, tbProj, tbTabs, tbPugin1, tbPugin2, tbPugin3, tbPugin4, tbPugin5);
  TSynCpOverride = (cp_sr_Def, cp_sr_OEM, cp_sr_UTF8, cp_sr_UTF16);

  TSynSelSave = record
    FSelStream: boolean;
    FSelStart, FSelEnd: TPoint;
    FSelRect: TRect;
    FCaretPos: TPoint;
  end;

const
  cColorsNum = 54;
type
  TSynColors = array[0..cColorsNum-1] of TColor;

type
  TfmMain = class(TTntForm)
    ActionList: TActionList;
    TBXDockTop: TSpTbxDock;
    tbFile: TSpTbxToolbar;
    fOpen: TAction;
    fSave: TAction;
    fSaveAs: TAction;
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
    fCustomizeLexer: TecCustomizeLexerPropertiesAction;
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
    fSetup: TAction;
    TBXDockLeft: TSpTbxMultiDock;
    TBXSubmenuItemToolSave: TSpTbxSubmenuItem;
    fExportRTFAction: TecExportRTFAction;
    fExportHTMLAction: TecExportHTMLAction;
    ecCommentLines: TecCommentLines;
    ecUnCommentLines: TecUnCommentLines;
    ecSortAscending: TAction;
    ecSortDescending: TAction;
    fCustomizeLexerLib: TAction;
    Timer1: TTimer;
    TBXItem11: TSpTbxItem;
    TBXItem15: TSpTbxItem;
    PopupCP: TSpTbxPopupMenu;
    PopupLE: TSpTbxPopupMenu;
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
    TBXItemVFold: TSpTbxItem;
    TBXItemVNonpr: TSpTbxSubmenuItem;
    TBXItemVNums: TSpTbxItem;
    TBXItemVWrap: TSpTbxItem;
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
    TBXItemVTree: TSpTbxItem;
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
    PopupLex: TSpTbxPopupMenu;
    ecWrap: TAction;
    ecLineNums: TAction;
    ecFolding: TAction;
    ecNonPrint: TAction;
    fReread: TAction;
    ImageListIconsStd: TImageList;
    TbxSubmenuItemTblFind: TSpTBXSubmenuItem;
    TBXItem2: TSpTbxItem;
    fNew: TAction;
    TBXItemToolNew: TSpTbxSubmenuItem;
    TBXItemCCInv: TSpTbxItem;
    TBXSeparatorItem10: TSpTbxSeparatorItem;
    Status: TSpTbxStatusBar;
    TBXSubmenuItemSort: TSpTbxSubmenuItem;
    TBXItemTbSortAsc: TSpTbxItem;
    TBXItemTbSortDesc: TSpTbxItem;
    ecSelCharPopup1: TecSelCharPopup;
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
    fNewWin: TAction;
    TBXItemFExit: TSpTbxItem;
    TBXItemFSaveAs: TSpTbxItem;
    TBXItemFSave: TSpTbxItem;
    TBXItemFReopen: TSpTbxItem;
    TBXItemFNewWin: TSpTbxItem;
    TBXItemFNew: TSpTbxItem;
    TBXSeparatorItem15: TSpTbxSeparatorItem;
    TBXSubmenuItemFNew: TSpTbxSubmenuItem;
    TBXSeparatorItem16: TSpTbxSeparatorItem;
    TBXItemFPreview: TSpTbxItem;
    TBXItemFPrint: TSpTbxItem;
    TBXItemFPageSetup: TSpTbxItem;
    TBXItemFPrinterSetup: TSpTbxItem;
    TBXSubmenuItem12: TSpTbxSubmenuItem;
    TBXItemFExpRtf: TSpTbxItem;
    TBXItemFExpHtml: TSpTbxItem;
    Panel1: TPanel;
    PageControl1: TTntPageControl;
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
    TBXItemHAbout: TSpTbxItem;
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
    TBXItemHRead: TSpTbxItem;
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
    TBXSubmenuItemZoom: TSpTbxSubmenuItem;
    TBXSeparatorItem26: TSpTbxSeparatorItem;
    TBXItemZIn: TSpTbxItem;
    TBXItemZOut: TSpTbxItem;
    TBXItemZ0: TSpTbxItem;
    TBXSeparatorItem27: TSpTbxSeparatorItem;
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
    TBXItemHHelp: TSpTbxItem;
    TBXItemFClose: TSpTbxItem;
    fClose: TAction;
    PopupTb: TSpTbxPopupMenu;
    TBXItemTbOth: TSpTbxItem;
    TBXItemTbCl: TSpTbxItem;
    TBXItemTbNew: TSpTbxItem;
    TBXSeparatorItem28: TSpTbxSeparatorItem;
    ImageListCloseBtn: TImageList;
    fSaveAll: TAction;
    TBXItemFSaveAll: TSpTbxItem;
    fCloseAll: TAction;
    TBXItemFCloseAll: TSpTbxItem;
    fCloseOth: TAction;
    TBXItemFCloseOth: TSpTbxItem;
    TBXSeparatorItem29: TSpTbxSeparatorItem;
    TBXItemFSesOpen: TSpTbxItem;
    TBXItemFSesSaveAs: TSpTbxItem;
    OD_Session: TTntOpenDialog;
    SD_Session: TTntSaveDialog;
    TBXSubmenuItemFRecents: TSpTbxSubmenuItem;
    TBXSeparatorItem30: TSpTbxSeparatorItem;
    TBXItemFClr: TSpTbxItem;
    tbxWin: TSpTbxSubmenuItem;
    TBXItemETime: TSpTbxItem;
    TBXSubmenuItemRun: TSpTbxSubmenuItem;
    TBXItemT1: TSpTbxItem;
    TBXItemT2: TSpTbxItem;
    TBXItemT3: TSpTbxItem;
    TBXItemT4: TSpTbxItem;
    TBXSeparatorItem31: TSpTbxSeparatorItem;
    TBXItemRunFindPhp: TSpTbxItem;
    TBXItemRunFindGoogle: TSpTbxItem;
    TBXItemRunMSIE: TSpTbxItem;
    TBXItemRunFirefox: TSpTbxItem;
    TBXItemRunFindWiki: TSpTbxItem;
    TBXItemRunChrome: TSpTbxItem;
    TBXItemRunSafari: TSpTbxItem;
    TBXItemRunOpenDir: TSpTbxItem;
    TBXItemT5: TSpTbxItem;
    TBXItemT6: TSpTbxItem;
    TBXItemT7: TSpTbxItem;
    TBXItemT8: TSpTbxItem;
    TBXSubmenuItemEnc: TSpTbxSubmenuItem;
    TBXSubmenuLineEnds: TSpTbxSubmenuItem;
    TBXItemEndMWin: TSpTbxItem;
    TBXItemEndMUn: TSpTbxItem;
    TBXItemEndMMac: TSpTbxItem;
    TBXSubmenuEnc: TSpTbxSubmenuItem;
    TBXSubmenuEnc2: TSpTbxSubmenuItem;
    TimerLoad: TTimer;
    TBXItemTbClose: TSpTbxItem;
    ecReplace: TAction;
    TBXItemSRep: TSpTbxItem;
    TBXItemSFind: TSpTbxItem;
    TBXItem8: TSpTbxItem;
    TBXItemRunFindMSDN: TSpTbxItem;
    fExit: TAction;
    TBXItemFCloseDel: TSpTbxItem;
    fCloseDel: TAction;
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
    ecCopyAsHTML: TAction;
    ecCopyApp: TAction;
    ecCutApp: TAction;
    TBXSeparatorItem35: TSpTbxSeparatorItem;
    TBXItemECutApp: TSpTbxItem;
    TBXItemECopyApp: TSpTbxItem;
    TBXSubmenuItemWb: TSpTbxSubmenuItem;
    TBXSubmenuItemBr: TSpTbxSubmenuItem;
    TBXItemT9: TSpTbxItem;
    TBXItemT10: TSpTbxItem;
    TBXItemT11: TSpTbxItem;
    TBXItemT12: TSpTbxItem;
    TBXItemSGoBracket: TSpTbxItem;
    plOut: TSpTbxDockablePanel;
    ListOut: TTntListBox;
    TBXItemVOut: TSpTbxItem;
    ecShowOut: TAction;
    TBXItemOOut: TSpTbxItem;
    PopupOut: TSpTbxPopupMenu;
    TBXItemOClr: TSpTbxItem;
    TBXItemOCp: TSpTbxItem;
    TBXItemONav: TSpTbxItem;
    TBXSeparatorItem18: TSpTbxSeparatorItem;
    TBXItemOCpAll: TSpTbxItem;
    TBXSeparatorItem32: TSpTbxSeparatorItem;
    ImageListStatus: TImageList;
    TBXItemODel: TSpTbxItem;
    TBXItemODelN: TSpTbxItem;
    PopupFind: TSpTbxPopupMenu;
    TBXItemTreeFindNav: TSpTbxItem;
    TBXSeparatorItem36: TSpTbxSeparatorItem;
    TBXSeparatorItem37: TSpTbxSeparatorItem;
    ecCopyAsRTF: TAction;
    fCustomizeHi: TAction;
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
    TBXItemZSet: TSpTbxItem;
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
    TBXItemTbCpDir: TSpTbxItem;
    TBXItemTbCpFull: TSpTbxItem;
    TBXItemTbCpFN: TSpTbxItem;
    Splitter1: TSpTBXSplitter;
    PageControl2: TTntPageControl;
    TBXSeparatorItem42: TSpTbxSeparatorItem;
    TBXItemTbMoveToView: TSpTbxItem;
    PopupSplitter: TSpTbxPopupMenu;
    TBXItemTbCloseAll: TSpTbxItem;
    TBXItemSpHorz: TSpTbxItem;
    TBXSeparatorItem43: TSpTbxSeparatorItem;
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
    TBXItemFEmail: TSpTbxItem;
    TBXSeparatorItem45: TSpTbxSeparatorItem;
    TBXItemCC12: TSpTbxItem;
    TBXItemCC11: TSpTbxItem;
    TBXItemCC10: TSpTbxItem;
    TBXItemCC9: TSpTbxItem;
    TBXItemCC8: TSpTbxItem;
    TBXItemCC7: TSpTbxItem;
    TBXItemCC6: TSpTbxItem;
    TBXItemCC5: TSpTbxItem;
    TBXItemCC4: TSpTbxItem;
    TBXItemCC3: TSpTbxItem;
    TBXItemCC2: TSpTbxItem;
    TBXItemCC1: TSpTbxItem;
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
    fMakeBak: TAction;
    ecToggleStreamComment: TAction;
    TBXItemEToggleStreamComment: TSpTbxItem;
    TBXSubmenuItem16: TSpTbxSubmenuItem;
    TBXSubmenuItem17: TSpTbxSubmenuItem;
    TBXItemEMoveDn: TSpTbxItem;
    TBXItemEMoveUp: TSpTbxItem;
    TBXItemHDonate: TSpTbxItem;
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
    ecJoinLines: TAction;
    TBXSeparatorItem49: TSpTbxSeparatorItem;
    TBXItemEJoin: TSpTbxItem;
    ecSplitLines: TAction;
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
    TBXItemRunPreview: TSpTbxItem;
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
    ecToggleView: TAction;
    ecCopyLine: TAction;
    ecCutLine: TAction;
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
    TBXItemValCp: TSpTbxItem;
    TBXItemValCpAll: TSpTbxItem;
    TBXSeparatorItem57: TSpTbxSeparatorItem;
    TBXItemValClr: TSpTbxItem;
    ecToggleFocusValidate: TAction;
    TBXItemEDedupAdjacent: TSpTbxItem;
    TBXItemTbDedupAdjacent: TSpTbxItem;
    TBXSeparatorItem58: TSpTbxSeparatorItem;
    TBXItemWin9: TSpTbxItem;
    TBXItemWin8: TSpTbxItem;
    TBXItemWin7: TSpTbxItem;
    TBXItemWin6: TSpTbxItem;
    TBXItemWin5: TSpTbxItem;
    TBXItemWin4: TSpTbxItem;
    TBXItemWin3: TSpTbxItem;
    TBXItemWin2: TSpTbxItem;
    TBXItemWin1: TSpTbxItem;
    TBXItemWin0: TSpTbxItem;
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
    TBXSubmenuItem2: TSpTbxSubmenuItem;
    ecSplit50_50: TAction;
    ecSplit40_60: TAction;
    ecSplit60_40: TAction;
    ecSplit30_70: TAction;
    ecSplit70_30: TAction;
    ecSplit20_80: TAction;
    ecSplit80_20: TAction;
    TBXItemSp50: TSpTbxItem;
    TBXItemSp80: TSpTbxItem;
    TBXItemSp70: TSpTbxItem;
    TBXItemSp60: TSpTbxItem;
    TBXItemSp40: TSpTbxItem;
    TBXItemSp30: TSpTbxItem;
    TBXItemSp20: TSpTbxItem;
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
    ecMarkersClear: TAction;
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
    ecGotoNextBlank: TAction;
    ecGotoPrevBlank: TAction;
    ecSelPara: TAction;
    TBXSeparatorItem63: TSpTbxSeparatorItem;
    ecSplitLeft: TAction;
    ecSplitRight: TAction;
    ecSelToWordEnd: TAction;
    ecJumpToWordEnd: TAction;
    ecFindNextWithExtend: TAction;
    ecFindPrevWithExtend: TAction;
    TBXItemHKeyMap: TSpTbxItem;
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
    TBXItemOFind: TSpTbxItem;
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
    ecJumpToLastMarker: TAction;
    ecTreeParent: TAction;
    ecTreeNextBrother: TAction;
    ecTreePrevBrother: TAction;
    TBXItemMarkGoLast: TSpTbxItem;
    TBXSeparatorItem70: TSpTbxSeparatorItem;
    TBXItemRunOpenFile: TSpTbxItem;
    TBXItemSSelToken: TSpTbxItem;
    ecSelToken: TAction;
    TBXItemTreeFindCopyToClipNode: TSpTbxItem;
    TBXItemFProps: TSpTbxItem;
    fProps: TAction;
    ecInsertColor: TAction;
    TBXItemEColor: TSpTbxItem;
    TBXSeparatorItem71: TSpTbxSeparatorItem;
    ecGotoSelEdge: TAction;
    TBXItemClipCopyToEd: TSpTbxItem;
    TBXItemClipCopyToClip: TSpTbxItem;
    TBXSeparatorItem72: TSpTbxSeparatorItem;
    ecReplaceSelFromClipAll: TAction;
    fRereadOut: TAction;
    ecToggleFocusProject: TAction;
    TBXItemWinProj: TSpTbxItem;
    ecInsertImage: TAction;
    TBXItemEImage: TSpTbxItem;
    ecToggleFocusMasterSlave: TAction;
    ecToggleSlave: TAction;
    TBXItemSplitCaption: TSpTbxItem;
    TbxItemRunFindHtml4: TSpTbxItem;
    TbxItemRunFindHtml5: TSpTbxItem;
    TBXSeparatorItem73: TSpTbxSeparatorItem;
    TBXSeparatorItem74: TSpTbxSeparatorItem;
    ecRuler: TAction;
    TBXItemORuler: TSpTbxItem;
    ecSplitViewsVertHorz: TAction;
    ecSplitSlaveVertHorz: TAction;
    ecGotoBk: TAction;
    TBXItemBkGoto: TSpTbxItem;
    TBXItemRunLoremIpsum: TSpTbxItem;
    ecLoremIpsum: TAction;
    TBXSubmenuFav: TSpTbxSubmenuItem;
    TBXItemFavAddFile: TSpTbxItem;
    TBXItemFavManage: TSpTbxItem;
    fFavAddFile: TAction;
    fFavManage: TAction;
    TbxSubmenuItemRecentColors: TSpTbxSubmenuItem;
    ImageListColorRecent: TImageList;
    TBXItemCtxAddColor: TSpTbxItem;
    TBXItemFavAddProj: TSpTbxItem;
    fFavAddProj: TAction;
    TBXSeparatorItem75: TSpTbxSeparatorItem;
    TBXItemTbAddToProj: TSpTbxItem;
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
    fRename: TAction;
    TBXItemFRename: TSpTbxItem;
    TBXItemRunNumConv: TSpTbxItem;
    ecNumericConverter: TAction;
    ecIndentLike1st: TAction;
    TBXSeparatorItem33: TSpTbxSeparatorItem;
    TBXItemEIndentLike1st: TSpTbxItem;
    TBXItemViewColMarkers: TSpTbxItem;
    fColumnMarkers: TAction;
    ecJumpColumnMarkerLeft: TAction;
    ecJumpColumnMarkerRight: TAction;
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
    ecPasteNoCurChange: TAction;
    TBXItemCtxPasteNoCurChange: TSpTbxItem;
    TBXSeparatorItem80: TSpTbxSeparatorItem;
    TBXSubmenuItemAbbrev: TSpTbxSubmenuItem;
    TBXItemEZenWrap: TSpTbxItem;
    TBXItemEZenExpand: TSpTbxItem;
    TBXSubmenuItemHelpAbbrev: TSpTbxSubmenuItem;
    TBXItemHEmmet: TSpTbxItem;
    PluginACP: TAutoCompletePopup;
    ecJumpMixedCaseLeft: TAction;
    ecJumpMixedCaseRight: TAction;
    ecCancelSelection: TAction;
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
    TBXItemTbMoveToWindow: TSpTbxItem;
    TBXItemTbOpenInWindow: TSpTbxItem;
    ecExtendSelByLine: TAction;
    TBXItemRunEncodeHtml: TSpTbxItem;
    ecEncodeHtmlChars: TAction;
    ecSortDialog: TAction;
    TBXItemESortDialog: TSpTbxItem;
    TBXSeparatorItem86: TSpTbxSeparatorItem;
    TBXItemTbSortDialog: TSpTbxItem;
    ecSelBrackets: TAction;
    TBXItemSSelBrackets: TSpTbxItem;
    PropsManagerPrint: TPropsManager;
    TimerTree: TTimer;
    TBXSubmenuFolding: TSpTbxSubmenuItem;
    TBXItemUnfoldLine: TSpTbxItem;
    TBXItemUnfoldAll: TSpTbxItem;
    TBXItemFoldAll: TSpTbxItem;
    TBXItemFoldParent: TSpTbxItem;
    ecCollapseParent: TAction;
    ecCollapseWithNested: TAction;
    TBXItemFoldWithNested: TSpTbxItem;
    TBXSeparatorItem87: TSpTbxSeparatorItem;
    TBXSeparatorItem88: TSpTbxSeparatorItem;
    TBXItemFoldNearestBlock: TSpTbxItem;
    TBXItemFoldSelBlock: TSpTbxItem;
    ecSpToTabLeading: TAction;
    TBXItemESpToTabLead: TSpTbxItem;
    ecToggleLineCommentAlt: TAction;
    TBXItemEToggleLineCommentAlt: TSpTbxItem;
    ecPasteToColumn1: TAction;
    TBXItemCtxPasteToColumn1: TSpTbxItem;
    TBXItemUnfoldRangesInSel: TSpTbxItem;
    TBXItemFoldRangesInSel: TSpTbxItem;
    TBXSeparatorItem89: TSpTbxSeparatorItem;
    ecCommandsList: TAction;
    TBXItemECommandList: TSpTbxItem;
    ecScrollToSel: TAction;
    ecProjectList: TAction;
    TBXItemSGotoFile: TSpTbxItem;
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
    TBXItemTbSplit: TSpTbxItem;
    TBXItemTbToggleSplit: TSpTbxItem;
    ecToggleView2: TAction;
    ecSelExtend: TAction;
    ecSelShrink: TAction;
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
    ecDeleteToFileBegin: TAction;
    ecDeleteToFileEnd: TAction;
    ecShuffleLines: TAction;
    TBXItemEShuffle: TSpTbxItem;
    TBXSubmenuIFoldLevel: TSpTbxSubmenuItem;
    TBXItemFoldLevel9: TSpTbxItem;
    TBXItemFoldLevel8: TSpTbxItem;
    TBXItemFoldLevel7: TSpTbxItem;
    TBXItemFoldLevel6: TSpTbxItem;
    TBXItemFoldLevel5: TSpTbxItem;
    TBXItemFoldLevel4: TSpTbxItem;
    TBXItemFoldLevel3: TSpTbxItem;
    TBXItemFoldLevel2: TSpTbxItem;
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
    ecPasteAsColumnBlock: TAction;
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
    fOpenBySelection: TAction;
    ImageListIconsTango22b: TPngImageList;
    ImageListIconsTango16b: TPngImageList;
    ImageListIconsFogue24b: TPngImageList;
    ImageListIconsFogue16b: TPngImageList;
    ImageListUser1: TPngImageList;
    ImageListUser2: TPngImageList;
    ImageListUser3: TPngImageList;
    TBXDockLeft1: TSpTbxDock;
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
    TBXMRUListItem1: TSpTBXMRUListItem;
    TBXMRUListItem_Sess: TSpTBXMRUListItem;
    tbTabsRight: TSpTBXTabSet;
    TbxTabMinimap: TSpTBXTabItem;
    TbxTabClips: TSpTBXTabItem;
    TbxTabClipboard: TSpTBXTabItem;
    tbTabsOut: TSpTBXTabSet;
    TbxTabPlugins: TSpTBXTabItem;
    TbxTabTidy: TSpTBXTabItem;
    TbxTabResults: TSpTBXTabItem;
    TbxTabOutput: TSpTBXTabItem;
    tbTabsLeft: TSpTBXTabSet;
    TbxTabTabs: TSpTBXTabItem;
    TbxTabProject: TSpTBXTabItem;
    TbxTabTree: TSpTBXTabItem;
    SpTBXSeparatorItem12: TSpTBXSeparatorItem;
    SpTBXSeparatorItem13: TSpTBXSeparatorItem;
    SpTBXSeparatorItem14: TSpTBXSeparatorItem;
    TbxItemMruNewdoc: TSpTBXMRUListItem;
    procedure fOpenExecute(Sender: TObject);
    procedure ecTitleCaseExecute(Sender: TObject);
    procedure TabClick(Sender: TObject);

    procedure UpdateMicroMap(F: TEditorFrame);
    procedure UpdateStatusBar;
    procedure UpdateGutter(F: TEditorFrame; AUpdateCur: boolean = true);
    procedure UpdateCh;

    procedure PageControl1Change(Sender: TObject);
    procedure fSaveExecute(Sender: TObject);
    procedure fSaveAsExecute(Sender: TObject);
    procedure MRUClick(Sender: TObject; const S: WideString);
    procedure MRU_SessClick(Sender: TObject; const S: WideString);
    procedure PopupLexPopup(Sender: TObject);
    procedure fSetupExecute(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure fExportRTFActionBeforeExecute(Sender: TObject);
    procedure ecReadOnlyExecute(Sender: TObject);
    procedure ButtonOnSelect(Sender: TTBCustomItem; Viewer: TTBItemViewer;
      Selecting: Boolean);
    procedure plTreeResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure IncSearchChange(Sender: TObject; State: TIncSearchState);
    procedure plTreeVisibleChanged(Sender: TObject);
    procedure ecShowTreeExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ecPrinterSetupExecute(Sender: TObject);
    procedure SetFormat(Sender: TObject);
    procedure SetEncoding(Sender: TObject);
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
    procedure fRereadExecute(Sender: TObject);
    procedure TBXItemClrClick(Sender: TObject);
    procedure tbViewMove(Sender: TObject);
    procedure ecPrintActionBeforeExecute(Sender: TObject);
    procedure ecPreviewActionBeforeExecute(Sender: TObject);
    procedure TBXItem2Click(Sender: TObject);
    procedure ecACPKeyPress(Sender: TObject; var Key: Char);
    procedure ecACPListClick(Sender: TObject);
    procedure ecACPListKeyDown(Sender: TObject;
      var key: Word; Shift: TShiftState);
    procedure fNewExecute(Sender: TObject);
    procedure TBXItemWPriorClick(Sender: TObject);
    procedure TBXItemWNextClick(Sender: TObject);
    procedure TBXItemFNextClick(Sender: TObject);
    procedure TBXItemFPrevClick(Sender: TObject);
    procedure TimerRedrawTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure bBk0Click(Sender: TObject);
    procedure TBXSubmenuItem3Popup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure bbg0Click(Sender: TObject);
    procedure TBXSubmenuItem8Popup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure ODShow(Sender: TObject);
    procedure SDShow(Sender: TObject);
    procedure fNewWinExecute(Sender: TObject);
    procedure TBXItemFExitClick(Sender: TObject);
    procedure ecSelCharPopup1Change(Sender: TObject);
    procedure ecSelCharPopup1Show(Sender: TObject);
    procedure ecACPShow(Sender: TObject);
    procedure fCustomizeLexerExecuteOK(Sender: TObject);
    procedure TBXItemHReadClick(Sender: TObject);
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
    procedure fTool1Execute(Sender: TObject);
    procedure fTool2Execute(Sender: TObject);
    procedure fTool3Execute(Sender: TObject);
    procedure fTool4Execute(Sender: TObject);
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
    procedure TBXItemHHelpClick(Sender: TObject);
    procedure TBXItemTbClClick(Sender: TObject);
    procedure TBXItemTbNewClick(Sender: TObject);
    procedure DKLanguageController1LanguageChanged(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure fCloseExecute(Sender: TObject);
    procedure PageControl1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure PageControl1ContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure fSaveAllExecute(Sender: TObject);
    procedure fCloseAllExecute(Sender: TObject);
    procedure fCloseOthExecute(Sender: TObject);
    procedure TBXItemTbOthClick(Sender: TObject);
    procedure PopupTbPopup(Sender: TObject);
    procedure TBXItemFSesSaveAsClick(Sender: TObject);
    procedure TBXItemFSesOpenClick(Sender: TObject);
    procedure TBXItemFClrClick(Sender: TObject);
    procedure tbxWinPopup(Sender: TTBCustomItem; FromLink: Boolean);
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
    procedure TBXItemRunFirefoxClick(Sender: TObject);
    procedure TBXItemRunMSIEClick(Sender: TObject);
    procedure TBXItemRunFindWikiClick(Sender: TObject);
    procedure TBXItemRunChromeClick(Sender: TObject);
    procedure TBXItemRunSafariClick(Sender: TObject);
    procedure TBXItemRunOpenDirClick(Sender: TObject);
    procedure TBXItemT5Click(Sender: TObject);
    procedure TBXItemT6Click(Sender: TObject);
    procedure TBXItemT7Click(Sender: TObject);
    procedure TBXItemT8Click(Sender: TObject);
    procedure TimerLoadTimer(Sender: TObject);
    procedure TBXItemTbCloseClick(Sender: TObject);
    procedure ecReplaceExecute(Sender: TObject);
    procedure TBXItemRunFindMSDNClick(Sender: TObject);
    procedure fExitExecute(Sender: TObject);
    procedure fCloseDelExecute(Sender: TObject);
    procedure ecReplaceInFilesExecute(Sender: TObject);
    procedure TimerSelTimer(Sender: TObject);
    procedure TBXItemCtxCopyAppendClick(Sender: TObject);
    procedure TBXItemCtxCutAppendClick(Sender: TObject);
    procedure ecCopyAsHTMLExecute(Sender: TObject);
    procedure ecCopyAppExecute(Sender: TObject);
    procedure ecCutAppExecute(Sender: TObject);
    procedure TBXSubmenuItemEdPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemT9Click(Sender: TObject);
    procedure TBXItemT10Click(Sender: TObject);
    procedure TBXItemT11Click(Sender: TObject);
    procedure TBXItemT12Click(Sender: TObject);
    procedure TBXItemSGoBracketClick(Sender: TObject);
    procedure plOutResize(Sender: TObject);
    procedure ecShowOutExecute(Sender: TObject);
    procedure plOutVisibleChanged(Sender: TObject);
    procedure ListOutDblClick(Sender: TObject);
    procedure ListOutKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TBXItemOClrClick(Sender: TObject);
    procedure TBXItemOCpClick(Sender: TObject);
    procedure TBXItemONavClick(Sender: TObject);
    procedure PopupOutPopup(Sender: TObject);
    procedure TBXItemOCpAllClick(Sender: TObject);
    procedure ListOutDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure TBXItemODelClick(Sender: TObject);
    procedure TBXItemODelNClick(Sender: TObject);
    procedure ListOutMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ListOutMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TBXItemOOOutClick(Sender: TObject);
    procedure TBXItemOOFindClick(Sender: TObject);
    procedure PopupFindPopup(Sender: TObject);
    procedure ecCopyAsRTFExecute(Sender: TObject);
    procedure fCustomizeHiExecute(Sender: TObject);
    procedure TBXItemEExtrClick(Sender: TObject);
    procedure PopupCPPopup(Sender: TObject);
    procedure ecSentCaseExecute(Sender: TObject);
    procedure TBXItemZSetClick(Sender: TObject);
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
    //procedure SDTypeChange(Sender: TObject);
    procedure TBXItemTbCpFNClick(Sender: TObject);
    procedure TBXItemTbCpFullClick(Sender: TObject);
    procedure TBXItemTbCpDirClick(Sender: TObject);
    procedure PageControl2Enter(Sender: TObject);
    procedure PageControl1Enter(Sender: TObject);
    procedure Splitter1Paint(Sender: TObject);
    procedure TBXItemTbMoveToViewClick(Sender: TObject);
    procedure Splitter1Moved(Sender: TObject);
    procedure TBXItemSp50Click(Sender: TObject);
    procedure TBXItemTbCloseAllClick(Sender: TObject);
    procedure TBXItemSpHorzClick(Sender: TObject);
    procedure PopupSplitterPopup(Sender: TObject);
    procedure ecSyncScrollHExecute(Sender: TObject);
    procedure ecSyncScrollVExecute(Sender: TObject);
    procedure Panel1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TBXItemOShellClick(Sender: TObject);
    procedure ecOnTopExecute(Sender: TObject);
    procedure tbMenuShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure TBXItemEFillBlockClick(Sender: TObject);
    procedure TBXItemEInsTextClick(Sender: TObject);
    procedure TBXItemCtxOpenSelClick(Sender: TObject);
    procedure TBXItemFEmailClick(Sender: TObject);
    procedure TBXItemCC1Click(Sender: TObject);
    procedure TBXItemCC2Click(Sender: TObject);
    procedure TBXItemCC3Click(Sender: TObject);
    procedure TBXItemCC4Click(Sender: TObject);
    procedure TBXItemCC5Click(Sender: TObject);
    procedure TBXItemCC6Click(Sender: TObject);
    procedure TBXItemCC7Click(Sender: TObject);
    procedure TBXItemCC8Click(Sender: TObject);
    procedure TBXItemCC9Click(Sender: TObject);
    procedure TBXItemCC10Click(Sender: TObject);
    procedure TBXItemCC11Click(Sender: TObject);
    procedure TBXItemCC12Click(Sender: TObject);
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
    procedure fMakeBakExecute(Sender: TObject);
    procedure ecToggleStreamCommentExecute(Sender: TObject);
    procedure TBXItemEMoveUpClick(Sender: TObject);
    procedure TBXItemEMoveDnClick(Sender: TObject);
    procedure TBXItemHDonateClick(Sender: TObject);
    procedure TBXItemEDelLnClick(Sender: TObject);
    procedure TBXItemECpFNClick(Sender: TObject);
    procedure TBXItemECpFullPathClick(Sender: TObject);
    procedure TBXItemECpDirPathClick(Sender: TObject);
    procedure ecToggleFocusFindResExecute(Sender: TObject);
    procedure TBXItemTbSpellCheckClick(Sender: TObject);
    procedure ecSpellCheckExecute(Sender: TObject);
    procedure ecSpellLiveExecute(Sender: TObject);
    procedure TBXItemSpellLiveClick(Sender: TObject);
    procedure ecJoinLinesExecute(Sender: TObject);
    procedure ecSplitLinesExecute(Sender: TObject);
    procedure ecMacroDlgExecute(Sender: TObject);
    procedure TBXItemRunPreviewClick(Sender: TObject);
    procedure TBXSubmenuItemBrPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
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
    procedure ecToggleViewExecute(Sender: TObject);
    procedure ecCopyLineExecute(Sender: TObject);
    procedure ecCutLineExecute(Sender: TObject);
    procedure TBXSubmenuItemTidyPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemTidyCfgClick(Sender: TObject);
    procedure TBXItemTidyValClick(Sender: TObject);
    procedure TBXItemOOValClick(Sender: TObject);
    procedure ListValDblClick(Sender: TObject);
    procedure TBXItemValNavClick(Sender: TObject);
    procedure TBXItemValCpClick(Sender: TObject);
    procedure TBXItemValCpAllClick(Sender: TObject);
    procedure TBXItemValClrClick(Sender: TObject);
    procedure PopupValidatePopup(Sender: TObject);
    procedure ListValKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ecToggleFocusValidateExecute(Sender: TObject);
    procedure TBXItemSessClrClick(Sender: TObject);
    procedure TBXItemFSesSaveClick(Sender: TObject);
    procedure TBXItemFSesCloseClick(Sender: TObject);
    procedure ecRemoveBlanksExecute(Sender: TObject);
    procedure PageControl1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
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
    procedure Splitter1CanResize(Sender: TObject; var NewSize: Integer;
      var Accept: Boolean);
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
    procedure ecMarkersClearExecute(Sender: TObject);
    procedure TBXItemRightClipClick(Sender: TObject);
    procedure TBXItemRightMapClick(Sender: TObject);
    procedure ecToggleFocusMapExecute(Sender: TObject);
    procedure ecFindInTreeExecute(Sender: TObject);
    procedure ecFindInTreeNextExecute(Sender: TObject);
    procedure ecFindInTreePrevExecute(Sender: TObject);
    procedure ecTreeNextExecute(Sender: TObject);
    procedure ecTreePrevExecute(Sender: TObject);
    procedure ecReduceBlanksExecute(Sender: TObject);
    procedure ecGotoNextBlankExecute(Sender: TObject);
    procedure ecGotoPrevBlankExecute(Sender: TObject);
    procedure ecSelParaExecute(Sender: TObject);
    procedure ecSplitLeftExecute(Sender: TObject);
    procedure ecSplitRightExecute(Sender: TObject);
    procedure ecSelToWordEndExecute(Sender: TObject);
    procedure TreeKeyPress(Sender: TObject; var Key: Char);
    procedure ecJumpToWordEndExecute(Sender: TObject);
    procedure ecFindNextWithExtendExecute(Sender: TObject);
    procedure ecFindPrevWithExtendExecute(Sender: TObject);
    procedure TBXItemHKeyMapClick(Sender: TObject);
    procedure ecFindInListExecute(Sender: TObject);
    procedure ecFindInListNextExecute(Sender: TObject);
    procedure ecFindInListPrevExecute(Sender: TObject);
    procedure TBXItemClipFindClick(Sender: TObject);
    procedure TBXItemValFindClick(Sender: TObject);
    procedure TBXItemOFindClick(Sender: TObject);
    procedure PopupClipPopup(Sender: TObject);
    procedure TBXItemTreeFindClick(Sender: TObject);
    procedure PopupTreePopup(Sender: TObject);
    procedure TBXItemTreeCollapseClick(Sender: TObject);
    procedure TBXItemTreeExpandClick(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
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
    procedure ecJumpToLastMarkerExecute(Sender: TObject);
    procedure ecTreeParentExecute(Sender: TObject);
    procedure ecTreeNextBrotherExecute(Sender: TObject);
    procedure ecTreePrevBrotherExecute(Sender: TObject);
    procedure TBXItemRunOpenFileClick(Sender: TObject);
    procedure TBXItemSSelTokenClick(Sender: TObject);
    procedure ecSelTokenExecute(Sender: TObject);
    procedure TBXItemTreeFindCopyToClipNodeClick(Sender: TObject);
    procedure TBXItemFPropsClick(Sender: TObject);
    procedure fPropsExecute(Sender: TObject);
    procedure TemplatePopupShow(Sender: TObject);
    procedure ecInsertColorExecute(Sender: TObject);
    procedure ecGotoSelEdgeExecute(Sender: TObject);
    procedure TBXItemClipCopyToEdClick(Sender: TObject);
    procedure TBXItemClipCopyToClipClick(Sender: TObject);
    procedure ecReplaceSelFromClipAllExecute(Sender: TObject);
    procedure fRereadOutExecute(Sender: TObject);
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
    procedure TBXItemRunLoremIpsumClick(Sender: TObject);
    procedure ecLoremIpsumExecute(Sender: TObject);
    procedure TBXItemFavAddFileClick(Sender: TObject);
    procedure TBXItemFavManageClick(Sender: TObject);
    procedure fFavManageExecute(Sender: TObject);
    procedure TBXItemCtxAddColorClick(Sender: TObject);
    procedure TbxSubmenuItemRecentColorsPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemFavAddProjClick(Sender: TObject);
    procedure fFavAddFileExecute(Sender: TObject);
    procedure fFavAddProjExecute(Sender: TObject);
    procedure TBXSubmenuFavPopup(Sender: TTBCustomItem; FromLink: Boolean);
    procedure TBXItemTbAddToProjClick(Sender: TObject);
    procedure TreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TBXItemRightClipsClick(Sender: TObject);
    procedure ecToggleFocusClipsExecute(Sender: TObject);
    procedure TBXItemClipsAddTextClick(Sender: TObject);
    procedure TBXItemClipsEditClick(Sender: TObject);
    procedure TBXItemClipsAddFileClick(Sender: TObject);
    procedure TBXItemClipsDirClick(Sender: TObject);
    procedure plTreeContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure plClipContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure plOutContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
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
    procedure fRenameExecute(Sender: TObject);
    procedure TBXItemRunNumConvClick(Sender: TObject);
    procedure ecNumericConverterExecute(Sender: TObject);
    procedure TBXItemEUnindentClick(Sender: TObject);
    procedure ecIndentLike1stExecute(Sender: TObject);
    procedure fColumnMarkersExecute(Sender: TObject);
    procedure ecJumpColumnMarkerLeftExecute(Sender: TObject);
    procedure ecJumpColumnMarkerRightExecute(Sender: TObject);
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
    procedure ecPasteNoCurChangeExecute(Sender: TObject);
    procedure TBXItemHEmmetClick(Sender: TObject);
    procedure ecZenExpandExecute(Sender: TObject);
    procedure ecZenWrapExecute(Sender: TObject);
    procedure ecJumpMixedCaseLeftExecute(Sender: TObject);
    procedure ecJumpMixedCaseRightExecute(Sender: TObject);
    procedure ecCancelSelectionExecute(Sender: TObject);
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
    procedure TBXItemTbMoveToWindowClick(Sender: TObject);
    procedure TBXItemTbOpenInWindowClick(Sender: TObject);
    procedure ecExtendSelByLineExecute(Sender: TObject);
    procedure TBXItemRunEncodeHtmlClick(Sender: TObject);
    procedure ecEncodeHtmlCharsExecute(Sender: TObject);
    procedure ecSortDialogExecute(Sender: TObject);
    procedure ecSelBracketsExecute(Sender: TObject);
    procedure TBXItemSSelBracketsClick(Sender: TObject);
    procedure ecUndoExecuteOK(Sender: TObject);
    procedure ecPageSetupActionBeforeExecute(Sender: TObject);
    procedure ecPreviewActionExecuteOK(Sender: TObject);
    procedure TimerTreeTimer(Sender: TObject);
    procedure PopupLEPopup(Sender: TObject);
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
    procedure ecPasteToColumn1Execute(Sender: TObject);
    procedure TBXSubmenuItemCtxMorePopup(Sender: TTBCustomItem;
      FromLink: Boolean);
    procedure TBXItemFoldRangesInSelClick(Sender: TObject);
    procedure TBXItemUnfoldRangesInSelClick(Sender: TObject);
    procedure ecCommandsListExecute(Sender: TObject);
    procedure ecScrollToSelExecute(Sender: TObject);
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
    procedure TBXItemEZenExpandClick(Sender: TObject);
    procedure TBXItemEZenWrapClick(Sender: TObject);
    procedure TBXItemTbSplitClick(Sender: TObject);
    procedure TBXItemTbToggleSplitClick(Sender: TObject);
    procedure TBXItemCtxCopyClick(Sender: TObject);
    procedure TBXItemCtxCutClick(Sender: TObject);
    procedure TBXItemCtxPasteClick(Sender: TObject);
    procedure TBXItemCtxDelClick(Sender: TObject);
    procedure TBXItemCtxSelectAllClick(Sender: TObject);
    procedure TBXItemERedoClick(Sender: TObject);
    procedure ecToggleView2Execute(Sender: TObject);
    procedure PluginACPAfterComplete(Sender: TObject;
      const Item: WideString);
    procedure ecSelExtendExecute(Sender: TObject);
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
    procedure ecDeleteToFileBeginExecute(Sender: TObject);
    procedure ecDeleteToFileEndExecute(Sender: TObject);
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
    procedure ecPasteAsColumnBlockExecute(Sender: TObject);
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
    procedure fOpenBySelectionExecute(Sender: TObject);
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
    procedure TbxItemMruNewdocClick(Sender: TObject;
      const Filename: WideString);
    procedure StatusResize(Sender: TObject);
    procedure fCustomizeLexerLibExecute(Sender: TObject);

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
    FSpellMenuCaption: Widestring;
    FSpellMenuTag: integer;
    {$ifdef SPELL}
    FSpell: TLiveAddictSpellBase;
    FSpellPos: Integer;
    FSpellChecking: boolean;
    {$endif}

    FPlugins: TPluginList_Panel;
    FPluginsFindid: TPluginList_Findid;
    FPluginsCommand: TPluginList_Command;
    FPluginsAcp: TPluginList_Acp;
    FPanelDrawBusy: boolean;
    FSyncBusy: boolean;
    FSplitHorz: boolean; //views splitter is horizontal
    FSplitter: Double; //views splitter position (%)
    FPageControl: TTntPageControl; //current TPageControl: PageControl1 or PageControl2
    FListNewDocs: TTntStringList; //filenames list of templates (template\newdoc)
    FListFiles: TTntStringList; //filenames list of mass search/replace operation
    FListValFN: Widestring; //filename for which HTML Tidy is called
    FSelBlank: boolean; //selection is blank (for Smart Hilite)
    FFullScr: boolean; //full-screen
    FOnTop: boolean; //always-on-top
    FBoundsRectOld: TRect;
    FListCommentStyles: TStringList; //holds "Comments" style list
    FListStringStyles: TStringList; //holds "Strings" style list

    //forms
    fmNumConv: TfmNumConv;
    fmClip: TfmClip;
    fmClips: TfmClips;
    fmMap: TfmMap;
    fmProj: TfmProj;
    fmSR: TfmSR;

    TabSwitcher,
    TabSwitcher2: TTabSwitcher;

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
    orig_TabsSort: integer;
    orig_TabsWidths: string;

    //Auto-complete
    slINTatr, //Htm.acp: section [HTML]
    slINTcss, //Htm.acp: section [CSS]
    slACPdisp, //ACP: display list (in form "\s1\...\s2\...")
    slACPitem, //ACP: names with brackets+parameters
    slACPHint, //ACP: hints (in form "(param1; param2)")
    slACPdesc: //ACP: descriptions (text after "|")
               TStringList;

    FLockUpdate: boolean;
    FTabOut: TSynTabOut;
    FTabRight: TSynTabRight;
    FTabLeft: TSynTabLeft;
    FTreeRoot: TTntTreeNode; //root tree node of last find result
    FListResFN,              //current filename for mass search/replace operation
    FListResFN_Prev: Widestring; //previous filename for mass search/replace
    FOutItem: Integer; //ListOut item index for right-click 
    FOutVisible: boolean; //Visible state for Output panel

    FPagesDblClickTime: Dword; //PageControl dbl-click time
    FPagesDblClickPoint: TPoint; //PageControl dbl-click coord
    FPagesNTab,            //PageControl mouse-over tab index
    FPagesNTabCtx: Integer; //PageControl context-menu tab index
    FPrevCaretPos: Integer; //saved caret pos before executing "Select brackets"

    FLexerACP: string; //ACP list was loaded for this lexer
    FTagList: boolean; //ACP shows tags, not attribs
    FTagCss: boolean; //ACP called for CSS
    FTagClosing: boolean; //ACP called for closing tag </tag>
    FBrAdd: boolean; //Added '<' on ACP call

    QuickView: boolean;    //QuickView mode for TotalCmd plugin
    QuickDestroy: boolean; //?? (inherited from Sepa)
    FUpdatePluginsLang: boolean; //need to update plugins' language ASAP
    FNeedRepaint: boolean;   //need full repaint ASAP
    FEnableRepaint: boolean; //enable repaint, it's set after 500ms
    
    FToolbarMoved: boolean;  //set when toolbars are moved
    FPopupUrl: string;       //current URL for editor popup menu
    FPopupColor: integer;    //current color-id-in-text for editor popup menu
    FCurrTool: integer;      //number of last called ext-tool
    FCurrToolFN: Widestring; //filename for last called ext-tool
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
    function FrameOfEditor(Ed: TSyntaxMemo): TEditorFrame;
    function BrotherEditor(Ed: TSyntaxMemo): TSyntaxMemo;
    procedure SetCurrentEditor(Value: TSyntaxMemo);
    function GetFrameCount: integer;
    function GetFrameAllCount: integer;
    function PagesToFrame(APages: TTntPageControl; ATabIndex: Integer): TEditorFrame;
    function GetFrames(Index: integer): TEditorFrame;
    function GetFramesAll(Index: integer): TEditorFrame;
    procedure SetCurrentFrame(Value: TEditorFrame);
    function GetCurrentFrame: TEditorFrame;
    procedure FrameChanged;
    function PromtToSave(Frame: TEditorFrame; AllowAll: Boolean; AllowCancel: boolean=true): TModalResult;
    procedure CreateBind(Frame: TEditorFrame);
    function SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean): boolean;
    function GetModifiedCount(FExcept: TEditorFrame = nil): integer;
    function OppositeFrame: TEditorFrame;
    function OppositeFileName: Widestring;
    //frame related------------------------------

    //private methods
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
    procedure LoadPluginsInfo;
    procedure PluginPanelItemClick(Sender: TObject);
    procedure PluginCommandItemClick(Sender: TObject);
    procedure DoAddPluginMenuItem(const SKey, SShortcut: Widestring; NIndex: Integer);
    //-------------------------------------------
    //
    procedure DoCheckIfBookmarkSetHere(Ed: TSyntaxMemo; NPos: Integer);
    function SGetFrameIndexFromPrefixedStr(const InfoFN: Widestring): Integer;
    function SGetTabPrefix: Widestring;
    procedure DoFindCommandFromString(const S: Widestring);
    procedure DoFindInTabs;
    procedure DoAddFav(const fn: Widestring);
    procedure NumConvInsert(Sender: TObject; const S: string);
    procedure DoGetCommentProps(const Lexer: string;
      UseDefault: boolean;
      var sStart, sEnd: string; var IsMultiLine: boolean);
    function GetTabColors: Widestring;
    procedure SetTabColors(S: Widestring);
    property TabColorsString: Widestring read GetTabColors write SetTabColors;
    procedure DoSetFrameTabColor(F: TEditorFrame; NColor: Longint);
    procedure DoSetTabColorValue(NColor: Longint);
    procedure DoSetTabColorIndex(NIndex: Integer);
    procedure ClipsClick(Sender: TObject; const S: Widestring);
    procedure ClipsInsPress(Sender: TObject);
    function IsProgressNeeded(Ed: TSyntaxMemo): boolean;
    function IsProgressStopped(const NDoneSize, NTotalSize: Int64): boolean;
    procedure ShowProgress(AMode: TProgressType = proFindText);
    procedure HideProgress;
    function CurrentSelectionFN(Unicode: boolean): Widestring;
    function CurrentProjectFN: Widestring;
    function CurrentProjectMainFN: Widestring;
    function CurrentProjectWorkDir: Widestring;
    procedure ProjLoadMRU(List: TSynMruList);
    procedure ProjUpdateMRU(List: TSynMruList);
    procedure ProjFileOpen(Sender: TObject; Files: TTntStrings);
    procedure ProjAddEditorFile(Sender: TObject; Files: TTntStrings);
    procedure ProjAddEditorFiles(Sender: TObject; Files: TTntStrings);
    procedure ProjGetLexers(Sender: TObject; Files: TTntStrings);
    procedure ProjGetWorkDir(Sender: TObject; Files: TTntStrings);
    procedure ProjGetProjDir(Sender: TObject; Files: TTntStrings);
    procedure ProjSetProjDir(Sender: TObject; Files: TTntStrings);
    function GetRecentColors: string;
    procedure SetRecentColors(const Str: string);
    property RecentColorsStr: string read GetRecentColors write SetRecentColors;
    procedure DoInsertColorCode(Code: Integer);
    procedure DoClearRecentColors;
    procedure RecentColorClick(Sender: TObject);
    procedure RecentColorOpen(Sender: TObject);
    procedure RecentColorSave(Sender: TObject);
    procedure DoAddRecentColor(N: Integer);
    procedure DoInitRecentColorsMenu;
    procedure DoDeleteRecentColor(N: Integer);
    procedure AddBookmarksToSortedList(ed: TSyntaxMemo; L: TList);
    procedure UpdateRecentsOnClose;
    function SynImagesDll: string;
    function DoAutoCloseBracket(const ch: Widechar): boolean;
    function DoAutoCloseTag: boolean;
    procedure UpdateOutFromList(List: TWideStringList);
    function SStatusText: Widestring;
    function SStatusHint(state: TSynSelState): Widestring;
    function SStatusCharInfo: Widestring;
    procedure HandleToolOutput(const ft: Widestring; NTool: integer);
    procedure GetColorRange(var NStart, NEnd: integer; var NColor: integer);
    procedure UpdateColorHint(AClearHint: boolean = true);
    function IsShowColor(s: string; var NColor, NColorText: TColor): boolean;
    procedure GetTabName(APagesNumber, ATabIndex: Integer; var AName, AFN, ALex: Widestring);
    procedure ClearTabList;
    procedure MoveTabInList(FromN, ToN: integer);
    procedure UpdateListTabs;
    procedure UpdateTabList(TopItem, NewItem, DelItem: integer);
    procedure DoMoveCaretXY(DX, DY: integer);
    function GetHtmlAcpFN: string;
    function GetAcpFN(const LexerName: string): string;
    function IsMultilineSelection(Ed: TSyntaxMemo): boolean;
    function CurrentTabSize(Ed: TSyntaxMemo): Integer;
    function CurrentTabExpansion(Ed: TSyntaxMemo): Widestring;
    function CurrentCR(Ed: TSyntaxMemo = nil): ecString;
    function CurrentLexer: string;
    function CurrentLexerForFile: string;
    function CurrentLexerHasTemplates: boolean;
    function SLexerComment(const Lexer: string): string;
    function DoTemplateTabbing: boolean;
    function DoSmartTagTabbing: boolean;
    procedure DoHandleLastCmd(Command: integer; Data: pointer);
    function MsgInput(const dkmsg: string; var S: Widestring): boolean;
    procedure MsgCloseHint(panelType: TSynPanelType);
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
    procedure UpdateSaveIco;
    procedure UpdateBusyIco;
    //procedure MsgID(const s: Widestring);
    procedure ClearTreeFind;
    procedure CopyFindResultToTab(ALastSearch, AFilesOnly: boolean;
      AToClip: boolean = false);
    procedure CopyFindResultToList(ARootNode: TTntTreeNode;
      L: TWideStringList; AFilesOnly: boolean);
    procedure CopyFindResultNode;
    function SFindResPrefix(const FN: Widestring; LineNum: integer): Widestring;
    procedure UpdateTreeInit(const AStr, ADir: Widestring; AInTabs: boolean = false);
    procedure UpdateTreeFind(const AStr, ADir: Widestring; AStopped: boolean; AInTabs: boolean = false);
    procedure UpdateTreeReplace(const ANodeText: Widestring; ANumFiles, ANumItems: integer; AStopped: boolean);
    function MacroName(n: integer): Widestring;
    function MacroCmdName(n: integer): Widestring;
    procedure UpdateMacroKeynames;
    procedure SetLineEnds(Sender: TObject; AManual: boolean);
    function IsListboxFocused: boolean;
    function IsTreeviewFocused: boolean;
    function CurrentListbox: TCustomListbox;
    function CurrentTreeview: TCustomTreeView;
    procedure DoFileReopen;
    procedure UpdateZoom(F: TEditorFrame);
    procedure DoFindExtSel(ANext: boolean);
    procedure DoJumpMixedCase(ARight: boolean);
    procedure DoJumpToWordEnd(ASel: boolean);
    function BookmarkDesc(i: integer;
      ALenLimit: integer = 30;
      AShowLineNum: boolean = false;
      AShowNumberedChar: boolean = false): WideString;
    function ShowGotoForm(
      var ALine, ACol: integer;
      var AExtSel: boolean;
      var AMode: TSynGotoMode;
      var ABkNum: integer): Boolean;
    procedure DoExtendSelection(Ed: TSyntaxMemo;
      AOldStart, AOldLength,
      ANewStart, ANewLength: integer);
    procedure DoGotoBlank(ANext: boolean);
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
    procedure DoSaveSel(Ed: TSyntaxMemo; var Sel: TSynSelSave);
    procedure DoRestoreSel(Ed: TSyntaxMemo; const Sel: TSynSelSave);
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

    procedure DoSplitterPos(const Pos: Double);
    procedure DoBlockIndent(Ed: TSyntaxMemo; shift: boolean);
    procedure DoRecordToMacro(Cmd: integer; Data: PWChar);
    procedure DoFindClip(Next: boolean);
    function SNewDocName(const fn: Widestring): string;
    procedure NewDocClick(Sender: TObject);
    procedure NewDocFolderClick(Sender: TObject);
    //function EscapedAcpChars: string;
    function AskSession(CanCancel: boolean; ExitCmd: boolean = false): boolean;
    procedure TabClickN(n: integer);
    procedure TabRightClickN(n: integer);
    procedure DoTidy(const Cfg: string);
    procedure TidyClick(Sender: TObject);
    procedure DoBkDelete(ed: TSyntaxMemo; DelUnmarked: boolean);
    procedure DoDeleteLine(ed: TSyntaxMemo; N: integer; ForceUndo: boolean = false);
    procedure DoReplaceLine(ed: TSyntaxMemo; N: integer; const S: ecString; ForceUndo: boolean = false);
    procedure DoBkNext(e: TSyntaxMemo; Next: boolean);
    procedure DoBkClear(ed: TSyntaxMemo);
    procedure DoGetSelLines(Ed: TSyntaxMemo; var Ln1, Ln2: Integer);
    procedure InitSpell;
    procedure DoZenExpand;
    procedure DoZenWrap;
    function SZenExpand(const s, sPadding: string): string;
    function DoClipItem: Widestring;
    procedure DoClipsItemCopy;
    procedure DoClipItemCopy;
    procedure DoClipItemIns;
    procedure DoSaveStyles(Sender: TObject);
    procedure DoAcpCss(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpHtm(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpFromFile(List, Display: ecUnicode.TWideStrings);
    procedure DoAcpCommand;
    function DoAcpFromPlugins(const AAction: PWideChar): Widestring;
    procedure DoInsertTextDialog;
    procedure DoFillBlock;
    procedure DoCommentLines(Comm: boolean);
    procedure DoRepaintTBs;
    procedure DoRepaintTBs2;
    procedure DoRepaintTabCaptions;
    procedure DoSyncScroll(EdSrc: TSyntaxMemo);
    function GetPageControl: TTntPageControl;
    procedure UpdateClickedFrame;
    function CloseAll(CanCancel, CanClose: Boolean; FExcept: TEditorFrame = nil): boolean;
    procedure CloseOth(F: TEditorFrame);
    procedure SetSplitter(const F: Double);
    function PagesEmpty(P: TTntPageControl): boolean;
    procedure DoMoveTabToOtherView(NTab: integer);
    procedure DoMoveTabToWindow(NTab: integer; AndClose: boolean);
    function LastDir: Widestring;
    function LastDir_UntitledFile: Widestring;
    procedure SaveLastDir(const FN, Filter: Widestring; FilterIndex: integer);
    procedure SaveLastDir_Session(const FN: Widestring);
    procedure SaveLastDir_UntitledFile(const FN: Widestring);
    procedure SetFS(AValue: boolean);
    procedure SetOnTop(V: boolean);
    procedure AddLineToEnd(E: TSyntaxMemo);
    procedure ConvEncoding(Sender: TObject);
    procedure DoRangeJump(Ed: TSyntaxMemo);
    procedure DoBracketJump;
    procedure DoFindBrackets(var Pos1, Pos2: Integer);
    function DoFindOpeningBracket: Integer;
    procedure HiliteBrackets;
    procedure HiliteSmart;
    procedure DoListCopy(Sender: TTntListbox);
    procedure DoListCopyAll(Sender: TTntListbox);
    procedure FinderContinue(Sender: TObject; var ACanContinue: boolean);
    procedure FinderFind(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure FinderFindBk(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure FinderCanAccept(Sender: TObject;
      StartPos, EndPos: integer;
      var Accept: Boolean);
    procedure DoHandleKeysInPanels(var Key: Word; Shift: TShiftState);
    procedure ListOutNav(const s: Widestring);
    procedure ListValNav(const s: Widestring);
    function IsNavigatableLine(const s: Widestring): boolean;
    procedure DoNewDoc(const fn: Widestring);
    procedure RunIn(const fn: Widestring);
    procedure RunTool(NTool: Integer);
    procedure RunMacro(n: Integer);
    procedure AppException(Sender: TObject; E: Exception);
    function MsgEncReload: boolean;
    function MsgConfirmFtp: boolean;
    function SynLexLib: string;
    function SynPluginIni(const SCaption: string): string;
    function SynIni: string;
    function SynToolbarsIni: string;
    function SynFavIni: string;
    function SynIniDir: string;
    function SynStylesIni: string;
    function SynStateIni: string;
    function SynMacrosIni: string;
    function SynHideIni: string;
    function SynTidyIni: string;
    function SynPluginsIni: string;
    function SynPluginsSampleIni: string;
    function SynSkinsDir: string;
    function SynSkinFilename(const Name: string): string;
    function NoCursor(E: TSyntaxMemo): boolean;
    procedure LexListClick(Sender: TObject);
    procedure FinderInit(Sender: TObject);
    procedure FinderFail(Sender: TObject);
    procedure FinderProgress(CurPos, MaxPos: integer);
    procedure FindCurrentWord(Next: boolean);
    procedure RefreshACP(const Lexer: string);
    function EncLocal(const s: Widestring): Widestring;

    procedure UpdateTabs(P: TTntPageControl);
    procedure UpdatePages;
    procedure UpdateNPrint(E: TSyntaxMemo);
    procedure UpdateTitle(Sender: TFrame);
    procedure DoReplaceTabsToSpaces(F: TEditorFrame);
    procedure UpdOut(n: TSynTabOut);
    procedure UpdLeft(n: TSynTabLeft);
    procedure UpdRight(n: TSynTabRight);
    procedure UpdateCheckLeftTabs(IsTree, IsProj, IsTabs: boolean);
    procedure UpdateCPMenu(M: TObject; AConvEnc: boolean = false);
    procedure UpdateSpell(Frame: TEditorFrame; UpdFlag: boolean = true);
    procedure UpdateNew;
    procedure UpdateBookmk;
    procedure UpdateShortcuts;
    procedure UpdateLang;
    procedure UpdateSpellLang;
    procedure UpdateCur(Ed: TSyntaxMemo);
    procedure UpdateLexList;
    procedure UpdateEnc(Frame: TEditorFrame);
    procedure UpdateStatusbarLineEnds;
    procedure UpdateStatusbarEnc(F: TEditorFrame);

    function IsSh(sh: TShortcut; cmd: integer): boolean;
    function ShFor(id: integer): TShortcut;
    procedure ShMacroGet(n: integer; var sh: TShortcut);
    procedure ShMacroSet(n: integer; const sh: TShortcut);
    procedure FOnlineWordHelp(const url: string);
    procedure FOnlineFind(const site: string);

    procedure FindAction(act: TSRAction);
    procedure FindActionWrapper(act: TSRAction);
    procedure FindFocusEditor(Sender: TObject);
    procedure FindDialog(ARep: boolean);
    procedure FindInFile(const fn: Widestring; InCodepage: TSynCpOverride = cp_sr_Def);
    procedure FindInFrame(F: TEditorFrame);
    procedure ReplaceInFile(const fn: Widestring);
    procedure ReplaceInAllTabs(var nRep, nFiles: integer);
    procedure MarkAll(const s: Widestring);

    function GetIcons: integer;
    function GetTheme: string;
    procedure SetIcons(A: integer);
    procedure SetTheme(const S: string);
    procedure LoadTools;
    procedure SaveTools;
    procedure UpdTools;
    procedure ToolEn(T: TSpTbxItem; n: integer; ForCtx: boolean = false);

    procedure GetTag(var tagName, attri:string);
    procedure SaveState_(Sender: TObject);

    function AskClose(CanCancel: boolean= false): boolean;
    function AskLexer(CanCancel: boolean= false): boolean;

    procedure LoadClip;
    procedure LoadProj;
    procedure LoadMap;
    procedure LoadClips;
    procedure LoadIni;
    procedure LoadLexLib;
    procedure LoadMacros;
    procedure LoadPrintOptions;
    procedure LoadHideIni;
    procedure SaveIni2;
    procedure SaveMacros;
    procedure SavePrintOptions;
    procedure SaveLexLib;
    procedure SaveLexLibFilename;
    procedure SaveToolbarsProps;
    function ReadTCHist: Widestring;

    procedure InitStyleLists;
    function IsPositionMatchesTokens(Ed: TSyntaxMemo; StartPos, EndPos: Integer;
      OptTokens: TSearchTokens): boolean;

    procedure DoJumpToNextSearchResult(ANext: boolean);
    procedure DoHideMenuItem(const Str: string);
    function IsLexerFindID(const Lex: string): boolean;

    procedure MsgBakEr(const fn: Widestring);
    procedure MsgBakOk(const fn: Widestring);
    procedure DoDupLine(Ed: TSyntaxMemo);
    procedure DoDateTime;
    procedure DoExtract;
    procedure DoACP;
    procedure DoACPHint;
    procedure DoInsertImageTag(const fn: string);
    procedure DoCheckUnicodeNeeded(Frame: TEditorFrame);

    function GetCP(F: TEditorFrame): integer;
    procedure SetCP(Frame: TEditorFrame; enc: Integer);
    procedure ChangeEncoding(Frame: TEditorFrame; ATag: Integer;
      ACanReload: boolean = true);
    procedure DoCheckAutoShowACP(Ed: TSyntaxMemo);
    procedure DoLinesCommand(Cmd: TSynLineCmd);
    procedure DoToggleLineComment(Alt: boolean);
    procedure DoCopyFilenameToClipboard(F: TEditorFrame; Cmd: TSynCopyNameCmd);
    function IsCommandAllowedInMacro(Cmd: Integer): boolean;
    procedure UpdateFormEnabled(En: boolean);
    procedure DoTreeLevel(NLevel: Integer);
    procedure DoFoldLevel(NLevel: Integer);
    procedure DoToolbarCommentUncomment(AComment: boolean);
    procedure LoadToolbarProp(Toolbar: TSpTbxToolbar; Ini: TCustomIniFile; const Id: string);
    procedure SaveToolbarProp(Toolbar: TSpTbxToolbar; Ini: TCustomIniFile; const Id: string);
    procedure SavePanelProp(Panel: TSpTbxDockablePanel; Ini: TCustomIniFile; const Id: string);
    procedure LoadPanelProp(Panel: TSpTbxDockablePanel; Ini: TCustomIniFile; const Id: string);
    procedure LoadToolbarContent(Toolbar: TObject; Id: string; AutoShow: boolean = false);
    function DoShowCmdList: Integer;
    function DoShowCmdListStr: string;
    function DoShowCmdHint(Cmd: Widestring): Widestring;
    procedure DoCustomizeToolbar(NIndex: Integer);
    procedure ToolbarUserClick(Sender: TObject);
    procedure DoExtToolsList(L: TTntStringList);
    procedure EditorNonPrintUpdate(Ed: TSyntaxMemo);
    procedure InitMenuItemsList;
    procedure DoOpenBySelection;
    procedure FixSplitters;
    function SynFilesFilter: Widestring;
    procedure DoOptionsDialog(tabId: Integer);
    procedure DoTreeFocus;
    function DoGetFavList: Widestring;
    procedure DoGetOppositeEditor(
      EdSrc: TSyntaxMemo;
      var EdOther: TSyntaxMemo;
      var DiffY: Integer;
      var View1st: boolean);
    procedure LoadAcpFromFile(const fn, Lexer: string);
    //end of private

  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure WM1(var m: TMessage); message WM_USER + 1;
    procedure WM2(var m: TMessage); message WM_USER + 2;
    //end of protected

  public
    //fields
    SynDir: string;
    SynExe: boolean;
    SynIsPortable: boolean;
    hLister: HWND;
    fmProgress: TfmProgress;

    SynMruFiles: TSynMruList;
    SynMruSessions: TSynMruList;
    SynMruNewdoc: TSynMruList;

    //opt
    opNonPrint,
    opNonPrintSpaces,
    opNonPrintEol,
    opNonPrintEolDetail: boolean;
    opCaretType: integer;
    opShowCurrentColumn: boolean;
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
    opShowRecentColors: integer; //0: auto-hide, 1: always show, 2: always hide
    opUnicodeNeeded: integer;
    opTabColors: array[0..Pred(cTabColors)] of integer;
    opStripBkmk: boolean;
    opColorCaretsGutter: integer;
    opColorMapMarks: integer;
    opColorBkmk: integer;
    opShowWrapMark: boolean;
    opTabVisible: integer;
    opTabMultiLine: boolean;
    opTabAtBottom: boolean;
    opTabNums: boolean; //show numbers on tabs
    opTabBtn: boolean; //show [x] button on tabs
    opTabOptionsIndex: integer; //id of active tab in Options dialog
    opTabOptionsLast: integer; //index of last closed tab in Options dialog
    opTabMaxLen: integer; //max length of tabs captions
    opTabDblClick: boolean; //close tabs by Dbl-click
    opTabDragDrop: boolean; //allow D&D of tabs
    opTabsSortMode: integer; //sort mode for Tabs panel
    opTabSwitcher: boolean; //use modern tab switcher (Ctrl+Tab)
    opStateForTemp: boolean;
    opCaretMoveX,
    opCaretMoveY: integer;
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
    opASaveUnnamed: integer; //0: ignore, 1: prompt for fn, 2: save to dir
    opASaveUnnamedDir: string;
    opMapZoom: integer;
    opMicroMap: boolean;
    opColorMap: integer;
    opBigSize: integer; //size in Mb for lexer-off
    opBkUndo: boolean;
    opZenProfile: string;
    opProjPaths: Widestring;
    opBracketHi: boolean;
    opColorBracket,
    opColorBracketBg,
    opColorOutSelBk,
    opColorOutSelText,
    opColorOutRedText,
    opColorOutRedSelText,
    opColorOutHi: integer;
    opTools: array[1..12] of TSynTool;
    opStatusText: array[TSynSelState] of string;
    opSpellEn: boolean;
    opSpellExt: string;
    opFixBlocks: boolean;
    opMenuIcon: boolean;
    opSmartHi: boolean;
    opSmartHiCase: boolean;
    opDateFmt,
    opDateFmtPLog: string;
    opBak: integer; //0: None, 1: AppData, 2: same folder
    opEsc: integer; //0: do nothing, 1: close app, 2: close tab, 3: close tab or app, 4: minimize app
    opHistProjectSave,
    opHistProjectLoad: boolean;
    opHistFilter: integer;
    opHistSessionSave,
    opHistSessionLoad,
    opHistSessionDef: boolean;
    opNewEnc,
    opNewLineEnds: integer;
    opNewLex: string;
    opMruCheck: boolean; //check MRU on start
    opTabsReplace: boolean; //replace tabs->spaces on reading
    opTemplateTabbing: boolean; //use Tab key for code templates
    opTemplateTabbingExcept: string; //exclution file-ext list for ^^
    opAcpUseSingle: boolean; //auto insert single match
    opAcpChars: string; //additional word chars (lexer specific)
    opAcpHtm: boolean; //Special ACP for HTML
    opAcpCss: boolean; //Special ACP for CSS
    opAcpTabbing: boolean; //Special SmartTagTabbing feature
    opAcpFile: boolean; //ACP from curr file
    opAcpFileChars: integer; //Min word length for ACP from file
    opAcpFileSize: integer; //Max file size for ACP from file
    opAcpNum: integer; //Num of chars that starts ACP
    opSingleInstance: boolean; //single instance
    opLang: integer;
    opLexerCat: boolean; //group lexers
    opNotif: integer; //0: none, 1: reload, 2: ask to reload
    opLink: boolean;
    opColorLink: integer;
    opKeepScr: boolean;
    opLastDir: integer; //0: of current file, 1: remember last, 2: custom folder
    opLastDirPath,
    opLastDirSession,
    opLastDirProject: Widestring;
    opSaveSRHist,
    opSaveState: integer;
    opSavePos,
    opSaveCaret,
    opSaveEnc: boolean;
    opAskOverwrite: boolean;
    opTextOnly: integer; //dont open/open/prompt
    opTitleFull: boolean;
    opQsCap: boolean; //captions in QSearch
    opColorSplitViews,
    opColorSplitSlave: integer;
    opColorTab1,
    opColorTab2,
    opColorTab3,
    opColorTabFont1,
    opColorTabFont2: integer;
    opStartRO: boolean; //"R/O at start"
    opChInf: boolean;
    opOem,
    opUTF8: string;

    FFinderTotalSize: Int64;
    FFinderDoneSize: Int64;

    Finder: TSynFindReplace;
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

    procedure UpdateLexer;
    procedure UpdateQVTree(const fn: Widestring);
    procedure UpdateRO;
    property opTabsWidths: Widestring read GetTabsWidths write SetTabsWidths;
    property PageControl: TTntPageControl read GetPageControl write FPageControl;
    property FullScr: boolean read FFullScr write SetFS;
    property OnTop: boolean read FOnTop write SetOnTop;

    procedure ApplyTabOptions;
    procedure ApplyCarets;
    procedure ApplyUrlClick;
    procedure ApplyShowRecentColors;
    procedure ApplySpell;
    procedure ApplyProj;
    procedure ApplyFrames;
    procedure ApplyTips;
    procedure ApplyAutoSave;
    procedure ApplyDefaultFonts;
    procedure ApplyInst;
    procedure ApplyIntf;
    procedure ApplyQs;
    procedure ApplyEd2;
    procedure ApplyFonts;
    procedure ApplyColors;
    procedure ApplyColorsArrayToEditor(var C: TSynColors; Ed: TSyntaxMemo);
    procedure InitColorsArray(var C: TSynColors);
    procedure ApplyACP;
    procedure ApplyOut;
    procedure ApplyMap;

    procedure DoSpellCfg(Sender: TObject);
    procedure DoAutoSave;
    procedure DoBackup(const AFilename: Widestring);
    procedure DoClearHistory;
    procedure DoRepaint;
    procedure DoDropFile(const fn: Widestring; IntoProj: boolean = false);
    procedure DoTabSwitch(ANext: boolean);
    procedure FocusEditor;
    procedure FindInit(AKeepFlags: boolean = false);
    function IsMouseInProj: boolean;

    constructor CreateParented(hWindow: HWND);
    function DoOpenFile(const AFileName: WideString): TEditorFrame;
    procedure DoOpenProject(const fn: Widestring);
    procedure DoOpenSession(const fn: string; Add: boolean = False);
    procedure SaveIni;
    procedure SaveState(F: TEditorFrame);
    procedure SaveSession(const fn: string);
    function LoadState(Frame: TEditorFrame; const FN: WideString): boolean;

    //event handlers
    procedure SynKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure SynExecuteCommand(Sender: TObject; Command: Integer; Data: Pointer; var Handled: Boolean);
    procedure SynScroll(Sender: TObject);
    procedure SynChange(Sender: TObject);
    procedure SynGetTokenHint(Sender: TObject; TokenIndex: Integer; var HintText: String);
    procedure SynSpellCheckerCheckWord(Sender: TObject;
      const AWord: WideString; APos: Integer; var Valid: Boolean);
    procedure SynContextPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);

    //frame---------------------------------------------------------------------
    property CurrentEditor: TSyntaxMemo read FCurrentEditor write SetCurrentEditor;
    property FrameCount: integer read GetFrameCount;
    property FrameAllCount: integer read GetFrameAllCount;
    property Frames[Index: integer]: TEditorFrame read GetFrames;
    property FramesAll[Index: integer]: TEditorFrame read GetFramesAll;
    property CurrentFrame: TEditorFrame read GetCurrentFrame write SetCurrentFrame;
    function CreateFrame: TEditorFrame;
    procedure CloseFrame(Frame: TEditorFrame);
    procedure CloseFrameWithCfm(F: TEditorFrame);
    //---------------------------------------------------------------------

    property Icons: integer read GetIcons write SetIcons;
    property Theme: string read GetTheme write SetTheme;
    //procedure TestApi;
    function IsPluginWindowActive(var HWnd: THandle): boolean;
    function opMarkDeletedAsModified: boolean;
    procedure SetHint(const S: WideString);
    procedure DoHandleQuickSearchEscape;
    function DoHandleEscapeActions: boolean;
    //end of public
  end;

  TEdState = packed record
    TopLine,
    CursorPos,
    ColStart,
    ColEnd,
    SelStart,
    SelEnd: Longint;
    Bookmarks: array[0..9] of Longint;
  end;

  TFileState = packed record
    Name,            //last 100 chars of filename
    HL: string[100]; //lexer
    _NoneRO,         //(not used)
    Wrap: ByteBool;  //word wrap
    M, S: TEdState;  //master/slave states
    _None: Word;     //(not used)
    SplitPos: byte;  //splitter position in %
    SplitVert: ByteBool; //splitted vertically
    CP: Longint;     //encoding
  end;

var
  LsIni: string = '';
  opListerSynDialog: boolean;
  opListerTcHistory: boolean;
  opListerQVReadOnly: boolean;
  opListerQVToolbars,
  opListerQVTree: string;
  opListerTextOnly: integer;

function StartSyn(ListerWin: HWND; const FileToLoad: WideString): HWND;
procedure StopSyn(hWin: HWND);
function FBigSized(const fn: WideString): boolean;
procedure WndCenter(H: THandle; fm: TCustomForm);

function MsgConfirmBinary(const fn: WideString): boolean;
function MsgConfirmCreate(const fn: Widestring): boolean;
function SAppDir: string;

var
  _SynActionProc: TSynAction = nil;

const
  cSynVer = '5.7.690';

const  
  cSynParamRO = '/RO';
  cSynParamSingleInst = '/S';
  cSynParamLineNum = '/N=';
  cSynParamReg = '/reg';

implementation

uses
  Clipbrd, Registry, CommCtrl,
  StrUtils, Types, Math, ShellApi,

  TntSysUtils, TntClipbrd, TntFileCtrl,

  ATxFProc, ATxSProc, ATxUtilMail,
  ATxColorCodes,
  ATxLoremIpsum,

  unSaveLex,
  unProcImg,

  {$ifdef SPELL}
  ad3SpellBase,
  ad3SpellLanguages,
  ad3Ignore,
  {$endif}

  TB2Consts,

  ecExports,
  ecZRegExpr,
  ecCmdConst,

  unSetup, unAb, unEnc, unTool, unSR2, unExtr, unShell, unInsTxt,
  unLoadLexStyles, unMacroEdit, unGoto, unCmds,
  unProcTabbin, unProp, unGotoBkmk, unLoremIpsum, unFav, unFillBlock,
  unCmdList, unProjList, unToolbarProp, unHideItems, TntWideStrings,
  unLexerLib;

{$R *.dfm}
{$R Cur.res}

const
  cRegexColorCode = '\#\w{3,6}';
  cRegexColorName = '[a-z]{3,30}';

const
  cThemeWindows = 'Windows';
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
    //'Office 2007',
    'Office 2007 Blue',
    'Office 2007 Black',
    'Office 2007 Silver'
    );

const    
  cAcpCharsCss = '-#!@:.';

const
  cp__UTF8       = -1;
  cp__UTF8_noBOM = -2;
  cp__Unicode    = -3;
  cp__UnicodeBE  = -4;

function MsgConfirmBinary(const fn: Widestring): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('MNText'), [WideExtractFileName(fn)]), 0);
end;

function MsgConfirmCreate(const fn: Widestring): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('MCre'), [WideExtractFileName(fn)]), 0);
end;

function MsgConfirmManyOpen(N: Integer): boolean;
begin
  Result:= MsgConfirm(WideFormat(DKLangConstW('zMOpenFiles'), [N]), 0);
end;

const
  cLexerHtmlList = 'HTML documents,HTML with scripts,PHP_dev_HTML';
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

function IsStringListed(const Lexer, List: string): boolean;
begin
  Result:= (Lexer <> '') and
    (Pos(','+Lexer+',', ','+List+',') > 0);
end;

function IsLexerListed(const Lexer, List: string): boolean;
begin
  Result:= IsStringListed(
    LowerCase(Lexer),
    LowerCase(List));
end;

function IsLexerHTML(const s: string): boolean;
begin
  Result:= IsLexerListed(s, cLexerHtmlList);
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
var p: ^TPlugInfo;
begin //hook destroy our window
  p:= Pointer(GetWindowLong(hWin, GWL_USERDATA));
  Result:= 0;
  if Msg = WM_DESTROY then StopSyn(hWin) //plugin close
  else
  if Msg = WM_SETFOCUS then begin
    if (p^.PlugForm.CurrentEditor <> nil) then
      p^.PlugForm.FocusEditor;
  end
  else
    Result:= CallWindowProc(p^.PlugWinProc, hWin, Msg, wParam, lParam);
end;

//hook close button of lister window to make 'Cancel' possible
function HookList(hWin: HWND; Msg, wParam, lParam: LongInt): LongInt; stdcall;
var p: ^TPlugInfo;
begin
  p:= Pointer(GetWindowLong(hWin, GWL_USERDATA));
  if (Msg = WM_ACTIVATE) and (wParam<>0) and
     (not p^.PlugForm.QuickDestroy) and
     (not p^.PlugForm.CurrentEditor.Focused) then begin
        p^.PlugForm.FocusEditor;
        Result:= 0;
        Exit;
  end;
  if (Msg = WM_CLOSE) and (not p^.PlugForm.AskClose(True)) then begin
    Result:= 0;
    Exit;
  end;
  Result:= CallWindowProc(p^.PlugWinProc, hWin, Msg, wParam, lParam);
end;

procedure StopSyn(hWin: HWND);
var
  p: ^TPlugInfo;
  i: integer;
begin
  i:= GetWindowLong(GetParent(hWin), GWL_USERDATA);
  if i <> 0 then
  try
    p:= Pointer(i);
    with p^.PlugForm do
      if not QuickDestroy then
      begin
        Close;
      end;
    //restore callback function
    SetWindowLong(GetParent(hWin), GWL_WNDPROC, Integer(p^.PlugWinProc));
    Dispose(p);
  except
    on E: Exception do
      MsgExcept('Exception on plugin unhooking', E, 0);
  end;

  i:= GetWindowLong(hWin, GWL_USERDATA);
  if i <> 0 then
  try
    p:= Pointer(i);
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

function StartSyn(ListerWin: HWND; const FileToLoad: WideString): HWND;
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

      QuickDestroy:= False;
      Show;
      DoOpenFile(FileToLoad);
      UpdateRO;
      Result:= Handle;

      //workaround for QView horz scroll
      if not SynExe then//QuickView then
      begin
        if CurrentFrame<>nil then
          with CurrentFrame do
          begin
            EditorMaster.ScrollPosX:= 0;
            EditorSlave.ScrollPosX:= 0;
          end;
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

//file too big
function FBigSized(const fn: WideString): boolean;
begin
  Result:= FGetFileSize(fn) >= 200 * 1024 * 1024;
end;

function TfmMain.SynFilesFilter: Widestring;
begin
  Result:= SyntaxManagerFilesFilter(SyntaxManager, DKLangConstW('AllF'));
end;

procedure TfmMain.fOpenExecute(Sender: TObject);
var
  i: Integer;
  s: Widestring;
begin
  OD.Filter:= SynFilesFilter;
  if (opLastDir=1) and (opHistFilter>0) then
    OD.FilterIndex:= opHistFilter
  else
    OD.FilterIndex:= SFilterNum(OD.Filter);
  OD.FileName:= '';
  OD.InitialDir:= LastDir;

  if not OD.Execute then Exit;

  if (OD.Files.Count=1) and not IsFileExist(OD.FileName) then
  begin
    if not MsgConfirmCreate(OD.FileName) then Exit;
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
    if FBigSized(S) then
      MsgError(WideFormat(DKLangConstW('MBig'), [WideExtractFileName(S)]), Handle)
    else
      DoOpenFile(S);
  end;

  //save last dir
  SaveLastDir(OD.FileName, OD.Filter, OD.FilterIndex);

  PageControl1.Invalidate;
  PageControl2.Invalidate;
  if CurrentEditor<>nil then
    CurrentEditor.Invalidate;
end;


function TfmMain.DoOpenFile(const AFileName: WideString): TEditorFrame;
var
  i: Integer;
  F: TEditorFrame;
begin
  UpdateColorHint;

  if AFileName = '' then
  begin
    fNew.Execute;
    Result:= CurrentFrame;
    Exit
  end;

  //If file is already opened?
  for i:= 0 to FrameAllCount - 1 do
  begin
    F:= FramesAll[i];
    if F.IsTheFile(AFileName) then
    begin
      Result:= F;
      CurrentFrame:= F;
      Exit;
    end;
  end;

  //Create new frame and load file
  F:= CurrentFrame;
  if (F <> nil) and (F.FileName = '') and (not F.Modified) then
    Result:= F
  else
    Result:= CreateFrame;
  //reset encoding for new frame  
  SetCP(Result, 0);

  if FCanUseLexer(AFileName) then
    Result.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(AFileName)
  else
    Result.TextSource.SyntaxAnalyzer:= nil;
  SyntaxManager.CurrentLexer:= Result.TextSource.SyntaxAnalyzer;
  SyntaxManagerChange(Self);

  Result.DoStopNotif;
  Result.LoadFile(AFileName);
  Result.DoStartNotif;

  FrameChanged;
  UpdateEnc(Result);
  UpdateSpell(Result);
  UpdateZoom(Result);

  //maybe set opened editor R/O for Lister plugin
  if not SynExe then
    UpdateRO;

  if not SynExe then
    BringWindowToTop(hLister);
  UpdateGutter(Result);
  if opTabsReplace and (TemplateEditor.TabMode=tmSpaces) then
    DoReplaceTabsToSpaces(Result);
end;

procedure TfmMain.UpdateEnc(Frame: TEditorFrame);
var
  IsBE: boolean;
begin
  //dont reread files with BOM
  if IsFileWithBOM(Frame.FileName) then Exit;

  if SFileExtensionMatch(Frame.FileName, opOem) then
  begin
    ChangeEncoding(Frame, CP_OEMCP); //Reread as OEM
  end
  else
  if SFileExtensionMatch(Frame.FileName, opUTF8) or (opUTF8 = '*')
    or IsFileUTF8NoBOM(Frame.FileName)
    or IsFileXmlUTF8(Frame.FileName) then
  begin
    ChangeEncoding(Frame, cp__UTF8_noBOM); //Reread as UTF8 no BOM
  end
  else
  if IsFileUnicodeNoBOM(Frame.FileName, IsBE) then
  begin
    if IsBE then
      ChangeEncoding(Frame, cp__UnicodeBE) //UTF-16 BE
    else
      ChangeEncoding(Frame, cp__Unicode); //UTF-16 LE
  end;
end;

//Save specified frame
function TfmMain.SaveFrame(Frame: TEditorFrame; PromtDialog: Boolean): boolean;
var
  AUntitled: boolean;
begin
  Result:= true;
  if Frame=nil then Exit;
  Frame.DoStopNotif;

  DoCheckUnicodeNeeded(Frame);

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

    if Frame.TextSource.SyntaxAnalyzer<>nil then
      SD.FilterIndex:= SFilterNameToIdx(SD.Filter, Frame.TextSource.SyntaxAnalyzer.LexerName)
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

      //update lexer
      if FCanUseLexer(SD.FileName) then
        Frame.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(SD.FileName)
      else
        Frame.TextSource.SyntaxAnalyzer:= nil;
      SyntaxManager.CurrentLexer:= Frame.TextSource.SyntaxAnalyzer;
      SyntaxManagerChange(Self);

      //save last dir
      if AUntitled then
        SaveLastDir_UntitledFile(SD.FileName)
      else
        SaveLastDir(SD.FileName, SD.Filter, SD.FilterIndex);
      //spell
      UpdateSpell(Frame);
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
    DoFileReopen;
    UpdateEnc(Frame);
  end;
end;

function TfmMain.GetFrameCount: integer;
begin
  Result:= PageControl.PageCount;
end;

function TfmMain.GetFrameAllCount: integer;
begin
  Result:= PageControl1.PageCount;
  if PageControl2.Visible then
    Inc(Result, PageControl2.PageCount);
end;

function TfmMain.PagesToFrame(APages: TTntPageControl; ATabIndex: Integer): TEditorFrame;
begin
  if (APages<>nil) and (ATabIndex>=0) and (ATabIndex<APages.PageCount) and
    (APages.Pages[ATabIndex].ControlCount>0) then
    Result:= APages.Pages[ATabIndex].Controls[0] as TEditorFrame
  else
    Result:= nil;
end;

function TfmMain.GetFrames(Index: integer): TEditorFrame;
begin
  Result:= PagesToFrame(PageControl, Index);
end;

function TfmMain.GetFramesAll(Index: integer): TEditorFrame;
begin
  if (Index >= 0) and (Index <= PageControl1.PageCount - 1) then
    Result:= PagesToFrame(PageControl1, Index)
  else
  if (Index - PageControl1.PageCount >= 0) and (Index - PageControl1.PageCount <= PageControl2.PageCount - 1) then
    Result:= PagesToFrame(PageControl2, Index - PageControl1.PageCount)
  else
    Result:= nil;
end;

procedure TfmMain.SetCurrentFrame(Value: TEditorFrame);
var
  tab: TTntTabSheet;
begin
  if Value <> nil then
  begin
    tab:= Value.Parent as TTntTabSheet;
    PageControl:= tab.PageControl as TTntPageControl;
    PageControl.ActivePage:= tab;
    FrameChanged;
  end;
end;

function TfmMain.GetCurrentFrame: TEditorFrame;
begin
  Result:= PagesToFrame(PageControl, PageControl.ActivePageIndex);
end;

procedure TfmMain.EditorNonPrintUpdate(Ed: TSyntaxMemo);
begin
  Ed.NonPrinted.Visible:= opNonPrint;
  Ed.NonPrintedSpaces:= opNonPrintSpaces;
  Ed.NonPrintedEol:= opNonPrintEol;
  Ed.NonPrintedEolDetails:= opNonPrintEolDetail;
end;  

procedure EditorCaretUpdate(Ed: TSyntaxMemo; Opt: Integer);
begin
  case Opt of
    0:
      begin
        Ed.Caret.Insert.Width:= -2; //negative default value
        Ed.Caret.Insert.Height:= 100;
      end;
    1:
      begin
        Ed.Caret.Insert.Width:= 50;
        Ed.Caret.Insert.Height:= 100;
      end;
    2:
      begin
        Ed.Caret.Insert.Width:= 100;
        Ed.Caret.Insert.Height:= 100;
      end;
    3:
      begin
        Ed.Caret.Insert.Width:= 100;
        Ed.Caret.Insert.Height:= 20;
      end;
    4:
      begin
        Ed.Caret.Insert.Width:= 100;
        Ed.Caret.Insert.Height:= 50;
      end;
    else
      raise Exception.Create('Unknown caret type');  
  end;
end;

function TfmMain.CreateFrame: TEditorFrame;
begin
  Result:= TEditorFrame.Create(Self);
  Result.Name:= '';
  Result.OnTitleChanged:= UpdateTitle;
  Result.OnSaveState:= SaveState_;

  Result.EditorMaster.KeyMapping:= SyntKeyMapping;
  Result.EditorSlave.KeyMapping:= SyntKeyMapping;
  Result.HyperlinkHighlighter.Active:= opLink;
  Result.HyperlinkHighlighter.Style.Font.Color:= opColorLink;
  Result.HyperlinkHighlighter.SingleClick:= opSingleClickURL;

  EditorNonPrintUpdate(Result.EditorMaster);
  EditorNonPrintUpdate(Result.EditorSlave);

  Result.ShowMap:= opMicroMap;
  Result.MapColor:= opColorMap;
  Result.CaretsEnabled:= opCaretsEnabled;
  Result.CaretsGutterBand:= opCaretsGutterBand;
  Result.CaretsGutterColor:= opColorCaretsGutter;
  Result.CaretsIndicator:= opCaretsIndicator;

  EditorCaretUpdate(Result.EditorMaster, opCaretType);
  EditorCaretUpdate(Result.EditorSlave, opCaretType);

  PropsManager.Add(Result.EditorMaster);
  PropsManager.Add(Result.EditorSlave);
  Result.EditorMaster.OnIncSearchChange:= IncSearchChange;
  Result.EditorSlave.OnIncSearchChange:= IncSearchChange;

  Result.EditorMaster.Gutter.LineBreakObj:= IfThen(opShowWrapMark, 0, -1);
  Result.EditorSlave.Gutter.LineBreakObj:= Result.EditorMaster.Gutter.LineBreakObj;

  CreateBind(Result);
  UpdateGutter(Result, False);
  CurrentFrame:= Result;
  UpdateNew;
  UpdateTabList(PageControl.PageCount-1, -1, -1);
end;

procedure TfmMain.UpdateNew;
var
  F: TEditorFrame;
  Val: integer;
  Str: string;
begin
  F:= CurrentFrame;
  if F=nil then Exit;

  //upd encoding
  if Assigned(fmProj) and (fmProj.FOpts.DefEnc<>0) then
    Val:= Pred(fmProj.FOpts.DefEnc)
  else
    Val:= opNewEnc;

  case Val of
    0: ChangeEncoding(F, cp_ACP);
    1: ChangeEncoding(F, cp_OEMCP);
    2: ChangeEncoding(F, cp__UTF8);
    3: ChangeEncoding(F, cp__UTF8_noBOM);
    4: ChangeEncoding(F, cp__Unicode);
    5: ChangeEncoding(F, cp__UnicodeBE);
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
    F.TextSource.SyntaxAnalyzer:= nil
  else
    F.TextSource.SyntaxAnalyzer:= SyntaxManager.FindAnalyzer(Str);
  SyntaxManager.CurrentLexer:= F.TextSource.SyntaxAnalyzer;
  SyntaxManagerChange(Self);

  //other
  F.Modified:= false;
  F.ModifiedClr:= false;
  F.LineEndsChg:= false;
  F.DoTitleChanged;
end;

procedure TfmMain.UpdateTabs(P: TTntPageControl);
var
  i, n: integer;
begin
  if not Assigned(P) then
    Exception.Create('PageControl nil');

  if opTabVisible=1 then
  begin
    n:= P.ActivePageIndex;
    for i:= 0 to P.PageCount-1 do
      P.Pages[i].TabVisible:= false;
    P.ActivePageIndex:= n;
  end
  else
  begin
    for i:= 0 to P.PageCount-1 do
      P.Pages[i].TabVisible:= true;
  end;

  if opTabVisible=2 then
    if P.PageCount=1 then
    begin
      P.Pages[0].TabVisible:= false;
      P.ActivePageIndex:= 0;
    end;

  UpdatePages;
end;

procedure TfmMain.UpdatePages;
var
  v: boolean;
begin
  v:= not PagesEmpty(PageControl2);
  PageControl2.Visible:= v;
  Splitter1.Visible:= v;
  //fix splitter
  if FSplitHorz then
    Splitter1.Top:= 5
  else
    Splitter1.Left:= 5;

  if not v then
  begin
    PageControl:= PageControl1;
    if PageControl.ActivePage<>nil then
      CurrentFrame:= PagesToFrame(PageControl, PageControl.ActivePageIndex);
  end;
end;

procedure TfmMain.CreateBind(Frame: TEditorFrame);
var
  tab: TTntTabSheet;
begin
  tab:= TTntTabSheet.Create(Self);
  tab.PageControl:= PageControl;
  tab.Caption:= Frame.Title;
  Frame.Parent:= tab;
  UpdateTabs(PageControl);
  UpdateSpell(Frame);
end;

procedure TfmMain.CloseFrame(Frame: TEditorFrame);
var
  ts: TTntTabSheet;
  n: integer;
begin
  if opSaveState>0 then
    SaveState(Frame);
  if Frame.FileName<>'' then
    if not Frame.NotInRecents then
      SynMruFiles.AddItem(Frame.FileName);

  CurrentEditor:= nil;
  ts:= Frame.Parent as TTntTabSheet;
  n:= ts.TabIndex;
  Frame.Free;
  ts.Free;
  FrameChanged;

  //free directory of closed file
  WideSetCurrentDir(FInitialDir);

  //hide tab if only one left
  UpdateTabs(PageControl);
  if PageControl.PageCount=1 then
    PageControl.ActivePageIndex:= 0;
  UpdateTabList(PageControl.ActivePageIndex, -1, n);
end;

procedure TfmMain.FrameChanged;
  //Checks tree images
  procedure SetImages;
  var i: integer;
  begin
    if (ImgListTree.Count > 0) and (CurrentFrame.TextSource.SyntaxAnalyzer <> nil) then
     with CurrentFrame.TextSource.SyntaxAnalyzer do
      for i:= 0 to BlockRules.Count - 1 do
       if (BlockRules[i].TreeItemImage <> -1) or
          (BlockRules[i].TreeGroupImage <> -1) then
        begin
          Tree.Images:= ImgListTree;
          Exit;
        end;
    Tree.Images:= nil;
  end;
begin
  if CurrentFrame <> nil then
    with CurrentFrame do
    begin
       SyntaxManager.CurrentLexer:= TextSource.SyntaxAnalyzer;
       SyntaxManagerChange(Self);
       CurrentEditor:= EditorMaster;
       ecSyntPrinter.Title:= WideExtractFileName(CurrentFrame.FileName);
       SetImages;
       UpdateTitle(CurrentFrame);
       UpdateStatusbar;
       UpdateNPrint(EditorMaster);
       UpdateNPrint(EditorSlave);
       SynScroll(CurrentEditor);
       UpdateTabList(-1, -1, -1);
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

  if not opTitleFull then
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
begin
  if FCurrentEditor = Value then Exit;
  ecSyntPrinter.SyntMemo:= Value;
  ecSelCharPopup1.SyntMemo:= Value;

  for i:= 0 to ActionList.ActionCount - 1 do
    if (ActionList.Actions[i] is TecBaseMemoAction) then
      (ActionList.Actions[i] as TecBaseMemoAction).SyntMemo:= Value;

  fCustomizeLexer.SyntMemo:= Value;
  ecACP.SyntMemo:= Value;
  PluginACP.SyntMemo:= Value;
  ParamCompletion.SyntMemo:= Value;
  TemplatePopup.SyntMemo:= Value;
  ecMacroRecorder1.SyntMemo:= Value;

  FCurrentEditor:= Value;
  if FCurrentEditor <> nil then
  begin
    if CurrentFrame<>nil then
      CurrentFrame.HyperlinkHighlighter.Editor:= FCurrentEditor;

    if FCurrentEditor.SyntObj <> nil then
      SyntaxManager.CurrentLexer:= FCurrentEditor.SyntObj.Owner
    else
      SyntaxManager.CurrentLexer:= nil;
    SyntaxManagerChange(Self);

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

function TfmMain.PromtToSave(Frame: TEditorFrame; AllowAll: Boolean; AllowCancel: boolean=true): TModalResult;
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
  bk, ro, sel, sel2, en_lex: boolean;
  ed: TSyntaxMemo;
  frame: TEditorFrame;
begin
  if QuickDestroy then Exit;
  if FLockUpdate then Exit;

  ed:= CurrentEditor;
  frame:= CurrentFrame;
  if ed=nil then Exit;
  if frame=nil then Exit;

  bk:= ed.BookmarkObj.Count>0;
  ro:= ed.ReadOnly;
  sel:= ed.SelLength>0;
  sel2:= ed.HaveSelection;
  en_lex:= SyntaxManager.CurrentLexer<>nil;

  if frame.Modified then
    fSave.ImageIndex:= 1
  else
    fSave.ImageIndex:= 2;

  //Hilite brackets
  TimerBrackets.Enabled:= true;

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

  ecReadOnly.Checked:= ro;
  ecWrap.Checked:= ed.WordWrap;
  ecLineNums.Checked:= ed.LineNumbers.Visible;
  ecFolding.Checked:= not ed.DisableFolding;
  ecRuler.Checked:= ed.HorzRuler.Visible;
  ecSmartHl.Checked:= opSmartHi;
  ecFullScr.Checked:= FullScr;

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
  if ro then
    StatusItemRO.ImageIndex:= 0
  else
    StatusItemRO.ImageIndex:= 1;

  if Assigned(Status) then
    case ed.SelectModeDefault of
      msColumn: StatusItemSelMode.ImageIndex:= 9;
      msLine: StatusItemSelMode.ImageIndex:= 10;
      else StatusItemSelMode.ImageIndex:= 8;
    end;

  if Assigned(Status) then
    if ed.WordWrap then
      StatusItemWrap.ImageIndex:= 3
    else
      StatusItemWrap.ImageIndex:= 4;

  UpdateStatusbarEnc(frame);
  UpdateStatusbarLineEnds;

  fSave.Enabled:= not ro;
  fNew.Enabled:= not Quickview;
  fClose.Enabled:= not Quickview;
  fOpen.Enabled:= not Quickview;
  fNewWin.Enabled:= SynExe;
  fCustomizeHi.Enabled:= en_lex;
  ecFullScr.Enabled:= SynExe;
  ecOnTop.Enabled:= SynExe;

  ecCopy.Update;
  ecCopyAsRTF.Update;
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
  ecPasteNoCurChange.Enabled:= ecPaste.Enabled;
  ecSortDialog.Enabled:= (ed.Lines.Count>0) and not ro;
  ecSortAscending.Enabled:= ecSortDialog.Enabled;
  ecSortDescending.Enabled:= ecSortDialog.Enabled;
  ecDedupAll.Enabled:= ecSortDialog.Enabled;
  ecDedupAdjacent.Enabled:= ecSortDialog.Enabled;

  TBXItemVComm.Enabled:= (ed.Lines.Count>0) and not ro and en_lex;
  TBXItemVUncom.Enabled:= TBXItemVComm.Enabled;
  TbxSubmenuCase.Enabled:= sel and not ro;

  ecSpellLive.Checked:= Frame.SpellLive;
  ecSyncScrollV.Enabled:= PageControl2.Visible;
  ecSyncScrollH.Enabled:= ecSyncScrollV.Enabled;

  ecPrintAction.Update;
  ecPreviewAction.Update;
  ecPageSetupAction.Update;
  ecPrinterSetup.Update;

  ecBkClearAll.Enabled:= bk;
  ecBkNext.Enabled:= bk;
  ecBkPrev.Enabled:= bk;
  ecBkCopy.Enabled:= bk;
  ecBkCut.Enabled:= bk and not ro;
  ecBkDelete.Enabled:= bk and not ro;
  ecBkDeleteUnmk.Enabled:= not ro;
  ecBkPaste.Enabled:= bk and not ro;
  TBXItemBkGoto.Enabled:= bk;

  with ed do
  begin
    StatusItemCaret.Caption:= SStatusText;

    if ReplaceMode then
      StatusItemInsMode.Caption:= DKLangConstW('sOvr')
    else
      StatusItemInsMode.Caption:= DKLangConstW('sIns');

    StatusItemZoom.Caption:= IntToStr(Zoom) + '%';

    if opChInf and (TextLength>0) and (not NoCursor(ed)) then
      StatusItemChar.Caption:= SStatusCharInfo
    else
      StatusItemChar.Caption:= '';
  end;
end;

function TfmMain.SStatusCharInfo: Widestring;
var
  ch: Widechar;
  sAnsi: string;
begin
  Result:= '';
  with CurrentEditor do
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

procedure TfmMain.UpdateCh;
begin
  with StatusItemChar do
    if opChInf then
      begin CustomWidth:= 100; ImageIndex:= -1; end
    else
      begin CustomWidth:= 20; ImageIndex:= 2; end;
end;

procedure TfmMain.PageControl1Change(Sender: TObject);
var
  P: TTntPageControl;
begin
  P:= Sender as TTntPageControl;
  P.Invalidate;
  PageControl:= P;
  FrameChanged;
  UpdateTabList(P.ActivePageIndex, -1, -1);
end;

const
  c_exe: array[boolean] of string = ('', 'Exe');

procedure TfmMain.LoadIni;
var
  i, NCount: integer;
  s: Widestring;
  ini: TMemIniFile;
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
    opASaveUnnamed:= ReadInteger('ASave', 'Unnm', 0);
    opASaveUnnamedDir:= ReadString('ASave', 'UnnmDir', '%AppData%\SynWrite\AutoSave');
    ApplyAutoSave;

    //hist
    opLastDir:= ReadInteger('Hist', 'DirVar', 1);
    opLastDirPath:= UTF8Decode(ReadString('Hist', 'Dir', ''));
    opLastDirSession:= UTF8Decode(ReadString('Hist', 'DirSess', SAppDir));
    opLastDirProject:= UTF8Decode(ReadString('Hist', 'DirProj', SAppDir));
    opHistFilter:= ReadInteger('Hist', 'Filter', 0);

    if SynExe then
    begin
      opHistSessionSave:= ReadBool('Hist', 'Sess', false);
      opHistSessionLoad:= ReadBool('Hist', 'SessLd', false);
      opHistSessionDef:= ReadBool('Hist', 'SessDef', false);
    end
    else
    begin
      opHistSessionSave:= false;
      opHistSessionLoad:= false;
      opHistSessionDef:= false;
    end;

    opStateForTemp:= ReadBool('Hist', 'TempFN', false);
    opHistProjectSave:= ReadBool('Hist', 'ProjSv', false);
    opHistProjectLoad:= ReadBool('Hist', 'ProjLd', false);
    opSavePos:= ReadBool('Hist', 'SavePos', true);

    //setup
    opNewEnc:= ReadInteger('Setup', 'NEnc', 0);
    opNewLineEnds:= ReadInteger('Setup', 'NLe', 0);
    opNewLex:= ReadString('Setup', 'NLex', '');

    opAutoCloseTags:= ReadBool('Setup', 'ACloseTag', false);
    opAutoCloseBrackets:= ReadBool('Setup', 'ACloseBr', false);
    opAutoCloseBracketsNoEsc:= ReadBool('Setup', 'ACloseBrEsc', false);
    opAutoCloseQuotes:= ReadBool('Setup', 'ACloseQ', false);

    opLexerCat:= ReadBool('Setup', 'LexCat', true);
    opLexersOverride:= ReadString('Setup', 'LexOvr', '');

    opTabVisible:= ReadInteger('Setup', 'TabVMode', 0);
    opTabMaxLen:= ReadInteger('Setup', 'TabMaxL', 24);
    opTabDblClick:= ReadBool('Setup', 'TabDbl', true);
    opTabDragDrop:= ReadBool('Setup', 'TabDnD', true);
    opTabSwitcher:= ReadBool('Setup', 'TabSw', true);
    opTabNums:= ReadBool('View', 'TabNum', false);
    opTabBtn:= ReadBool('View', 'TabBtn', true);
    opTabMultiLine:= ReadBool('View', 'TabMul', false);
    opTabAtBottom:= ReadBool('View', 'TabDown', false);
    ApplyTabOptions;

    opSingleInstance:= ReadBool('Setup', 'Inst', false);
    ApplyInst;
    opQsCap:= ReadBool('Setup', 'QsCap', false);
    ApplyQs;
    opLink:= ReadBool('Setup', 'Link', true);
    opColorLink:= ReadInteger('Setup', 'LinkCl', clBlue);
      //opFixBlocks:= ReadBool('Setup', 'FixBl', true);
      //opKeepScr:= ReadBool('Setup', 'KeepScr', false);
      opFixBlocks:= true;
      opKeepScr:= true;
    ApplyEd2;

    opShowWrapMark:= ReadBool('Setup', 'WrapMk', true);
    opTextOnly:= ReadInteger('Setup', 'TxOnly', 0);
    opSaveSRHist:= ReadInteger('Setup', 'SaveSRHist', 10);
    opSaveState:= ReadInteger('Setup', 'SaveState', 10);
    opSaveCaret:= ReadBool('Setup', 'SaveCaret', true);
    opSaveEnc:= ReadBool('Setup', 'SaveEnc', true);
    opAskOverwrite:= ReadBool('Setup', 'AskRO', true);
    opTitleFull:= ReadBool('Setup', 'TitleFull', false);

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

    opUtf8BufferSizeKb:= ReadInteger('Setup', 'Utf8Buffer', 32);
    opMenuIcon:= ReadBool('Setup', 'MenuIcon', true);
    opBeep:= ReadBool('Setup', 'Beep', true);
    opSmartHi:= ReadBool('Setup', 'SmHi', false);
    opSmartHiCase:= ReadBool('Setup', 'SmHiCase', false);
    opDateFmt:= ReadString('Setup', 'DateFmt', 'h:mm dd.mm.yyyy');
    opDateFmtPLog:= ReadString('Setup', 'DateFmtP', 'hh:mm:ss');
    opBak:= ReadInteger('Setup', 'Back', 0);
    opEsc:= ReadInteger('Setup', 'Esc' + c_exe[SynExe], 1);
    opMruCheck:= ReadBool('Setup', 'MruCheck', false);
    opTabsReplace:= ReadBool('Setup', 'TabSp', false);

    opSpellEn:= ReadBool('Setup', 'SpellEn', false);
    opSpellExt:= ReadString('Setup', 'SpellExt', 'txt,diz');

    opTemplateTabbing:= ReadBool('ACP', 'TplTab', true);
    opTemplateTabbingExcept:= ReadString('ACP', 'TplTabEx', 'txt,nfo,diz');
    opAcpUseSingle:= ReadBool('ACP', 'UseSingl', false);
    opAcpHtm:= ReadBool('ACP', 'Htm', true);
    opAcpCss:= ReadBool('ACP', 'Css', true);
    opAcpTabbing:= ReadBool('ACP', 'Tabbing', true);
    opAcpFile:= ReadBool('ACP', 'File', true);
    opAcpFileChars:= ReadInteger('ACP', 'FChars', 3);
    opAcpFileSize:= ReadInteger('ACP', 'FSize', 2);
    opAcpNum:= ReadInteger('ACP', 'Num', 0);
    ecACP.ShowWhenNone:= ReadBool('ACP', 'IfNone', true);

    opNotif:= ReadInteger('Setup', 'Notif', 2);
    ApplyIntf;

    opTipsToken:= ReadBool('View', 'Tips', true);
    opTipsPanels:= opTipsToken;
    ApplyTips;

    opSingleClickURL:= ReadBool('Setup', 'UrlClick', false);
    ApplyUrlClick;

    opSortMode:= TSynSortMode(ReadInteger('Setup', 'SortM', 0));
    opCopyLineIfNoSel:= ReadBool('Setup', 'CopyLnNoSel', false);
    opShowRecentColors:= ReadInteger('Setup', 'RecColors', 0);
    opUnicodeNeeded:= ReadInteger('Setup', 'UnNeed', 0{don't suggest});
    opFollowTail:= ReadBool('Setup', 'Tail', false);
    opCaretMoveX:= ReadInteger('Setup', 'MovX', 5);
    opCaretMoveY:= ReadInteger('Setup', 'MovY', 5);

    Tree.ClickAction:= TSyntaxTreeAction(ReadInteger('Tree', 'Click', Ord(Tree.ClickAction)));
    Tree.Color:= ReadInteger('Tree', 'Color', Tree.Color);
    Tree.Font.Name:= ReadString('Tree', 'FontName', Tree.Font.Name);
    Tree.Font.Size:= ReadInteger('Tree', 'FontSize', Tree.Font.Size);
    Tree.Font.Color:= ReadInteger('Tree', 'FontColor', Tree.Font.Color);
    Tree.AutoSynchronize:= ReadBool('Tree', 'ASync', true);
    Tree.UpdateDelay:= ReadInteger('Tree', 'Delay', 1000);

    opSrOffsetY:= ReadInteger('SR', 'OffY', 6);
    opSrExpand:= ReadBool('SR', 'Expand', false);
    opSrOnTop:= ReadBool('SR', 'OnTop' + c_exe[SynExe], SynExe);
    opSrSuggestSel:= ReadBool('SR', 'SugSel', false);
    opSrSuggestWord:= ReadBool('SR', 'SugWord', false);
    opMaxTreeMatches:= ReadInteger('SR', 'MaxTreeMatches', 100);

    opTabOptionsLast:= ReadInteger('View', 'TabLast', 0);
    opTabsSortMode:= ReadInteger('Win', 'TabSort', 0);
    opTabsWidths:= ReadString('Win', 'TabWdt', '100,400,');

    //opMapVScroll:= ReadBool('View', 'MapVSc', true);
    opMapZoom:= ReadInteger('View', 'MapZoom', 25);
    opMicroMap:= ReadBool('View', 'MicroMap', false);
    opColorMap:= ReadInteger('View', 'MapColor', clSkyBlue);
    opShowCurrentColumn:= ReadBool('View', 'CurrCol', false);
    opCaretType:= ReadInteger('View', 'CarWidth', 0);

    NCount:= ReadInteger('View', 'NPrint', 0+2+4);
    opNonPrint:=       (NCount and 1)<>0;
    opNonPrintSpaces:= (NCount and 2)<>0;
    opNonPrintEol:=    (NCount and 4)<>0;
    opNonPrintEolDetail:= (NCount and 8)<>0;

    opBigSize:= ReadInteger('Setup', 'BigSize', 4);
    opBkUndo:= ReadBool('Setup', 'BkUndo', false);
    opZenProfile:= ReadString('Setup', 'ZenPr', 'html');
    opProjPaths:= UTF8Decode(ReadString('Setup', 'Paths', ''));
    opBracketHi:= ReadBool('Setup', 'BrHi', true);

    opColorBracket:= ReadInteger('Setup', 'BrCl', clYellow);
    opColorBracketBg:= ReadInteger('Setup', 'BrClBg', clGreen);

    opColorOutSelBk:= ReadInteger('Setup', 'OutCSelBk', clDkGray);
    opColorOutSelText:= ReadInteger('Setup', 'OutCSelT', clHighlighttext);
    opColorOutRedText:= ReadInteger('Setup', 'OutCRedT', clNavy);
    opColorOutRedSelText:= ReadInteger('Setup', 'OutCRedSelT', clYellow);
    opColorOutHi:= ReadInteger('Setup', 'OutCHi', clSkyBlue);

    //Integer holds 3 options: enabled (1 bit), indicator (2 bits), gutter column (2 bits)
    i:= ReadInteger('Setup', 'CaretsOpt', 1{Enabled} + 2 shl 1{Indicator=2});
    opCaretsEnabled:= (i and 1)<>0;
    opCaretsIndicator:= (i shr 1) and 3;
    opCaretsGutterBand:= (i shr 3) and 3;
    ApplyCarets;

    opColorCaretsGutter:= ReadInteger('View', 'CaretsGut', clLtGray);
    opColorMapMarks:= ReadInteger('View', 'MapMkC', clGreen);
    opColorBkmk:= ReadInteger('View', 'BkC', RGB(200, 240, 200));
    opColorNonPrintedBG:= ReadInteger('View', 'NPrintBG', clSilver);
    opColorSplitViews:= ReadInteger('View', 'SplitC', clBtnFace);
    opColorSplitSlave:= ReadInteger('View', 'SplitS', clBtnFace);
    opColorTab1:= ReadInteger('View', 'TabC1', clBtnFace);
    opColorTab2:= ReadInteger('View', 'TabC2', clBtnHighlight);
    opColorTab3:= ReadInteger('View', 'TabC3', $80DDDD);
    opColorTabFont1:= ReadInteger('View', 'TabCF1', clBlack);
    opColorTabFont2:= ReadInteger('View', 'TabCF2', clNavy);
    TabColorsString:= ReadString('View', 'TabMisc', '');
    opStripBkmk:= ReadBool('View', 'BkStrip', false);

    opChInf:= ReadBool('Setup', 'ChInf', false);
    UpdateCh;

    opLang:= ReadInteger('Setup', 'Lang', 0);
    Status.Visible:= ReadBool('Setup', 'Stat', true);
    if not QuickView then
      Menu.Visible:= ReadBool('Setup', 'Menu' + c_exe[SynExe], true);
    opStartRO:= ReadBool('Setup', 'InitRO' + c_exe[SynExe], false);
    opOem:= ReadString('Setup', 'Oem', 'bat,cmd,nfo,diz');
    opUTF8:= ReadString('Setup', 'UTF8', '');

    if not QuickView then
      Theme:= ReadString('Setup', 'Theme', 'Aluminum');
    Icons:= ReadInteger('Setup', 'Icons', 2{Fogue 24x24});

    //MRU
    if SynExe or opMruForPlugin then
    begin
      //load recent files
      LoadMruList(SynMruFiles, Ini, 'MRU', opSaveState, opMruCheck);

      //load recent sessions
      LoadMruList(SynMruSessions, Ini, 'MRU_Sess', opSaveState, opMruCheck);

      //load recent project
      if opHistProjectLoad then
      begin
        ecToggleFocusProject.Execute;
        if Assigned(fmProj) then
        begin
          S:= UTF8Decode(ReadString('MRU', 'Proj', ''));
          if S<>'' then
            fmProj.ProjectFN:= S;
        end;
      end;
      
      //load recent colors
      RecentColorsStr:= ReadString('MRU', 'Col', '');
    end;

    LoadPanelProp(plTree, Ini, 'Tree');
    LoadPanelProp(plOut, Ini, 'Out');
    LoadPanelProp(plClip, Ini, 'Clip');
    FOutVisible:= plOut.Visible;
    FTabLeft:= TSynTabLeft(ReadInteger('plTree', 'Tab', 0));
    FTabRight:= TSynTabRight(ReadInteger('plClip', 'Tab', 0));

    //opt
    ApplyDefaultFonts;
    PropsManager.LoadProps(ini);
    //always set KeepSelMode (override old value)
    with TemplateEditor do
    begin
      Options:= Options+[soKeepSelMode];
      OptionsEx:= OptionsEx+[soKeepSearchMarks];
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
    orig_TabsSort:= opTabsSortMode;
    orig_TabsWidths:= opTabsWidths;
  finally
    Free;
  end;

  //lang
  LangManager.LanguageID:= opLang;
  UpdateLang;
  UpdateShortcuts;
end;

//save only visible on window
procedure TfmMain.SaveIni2;
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
    if opTabsSortMode <> orig_TabsSort then
      WriteInteger('Win', 'TabSort', opTabsSortMode);
    if opTabsWidths <> orig_TabsWidths then
      WriteString('Win', 'TabWdt', opTabsWidths);

    //save last clip
    if Assigned(fmClips) then
      WriteString('Win', 'Clip', fmClips.Combo.Text);

    //save NumConv pos
    if Assigned(fmNumConv) then
    begin
      WriteInteger('Win', 'NConvX', fmNumConv.Left);
      WriteInteger('Win', 'NConvY', fmNumConv.Top);
    end;

    if SynExe or opMruForPlugin then
    begin
      //save recent files list
      SaveMruList(SynMruFiles, Ini, 'MRU');

      //save recent session list
      SaveMruList(SynMruSessions, Ini, 'MRU_Sess');

      //save project name
      if Assigned(fmProj) then
        WriteString('MRU', 'Proj', UTF8Encode(fmProj.ProjectFN));
        
      //save recent colors
      WriteString('MRU', 'Col', RecentColorsStr);
    end;

    //save toolbars and panels
    if not FullScr then
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
end;

//save all
procedure TfmMain.SaveIni;
var
  f: TIniFile;
begin
  if not SynExe then
    with TIniFile.Create(LsIni) do
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
    WriteInteger('View', 'MapColor', opColorMap);
    WriteBool('View', 'MicroMap', opMicroMap);
    WriteBool('View', 'CurrCol', opShowCurrentColumn);
    WriteInteger('View', 'CarWidth', opCaretType);
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
    WriteInteger('ASave', 'Unnm', opASaveUnnamed);
    WriteString('ASave', 'UnnmDir', opASaveUnnamedDir);

    //setup
    WriteInteger('Setup', 'BigSize', opBigSize);
    WriteBool('Setup', 'BkUndo', opBkUndo);
    WriteString('Setup', 'ZenPr', opZenProfile);
    WriteBool('Setup', 'BrHi', opBracketHi);

    WriteString('Setup', 'Paths', UTF8Encode(opProjPaths));
    WriteBool('Setup', 'SpellEn', opSpellEn);
    WriteString('Setup', 'SpellExt', opSpellExt);

    WriteInteger('Setup', 'BrCl', opColorBracket);
    WriteInteger('Setup', 'BrClBg', opColorBracketBg);
    WriteInteger('Setup', 'OutCSelBk', opColorOutSelBk);
    WriteInteger('Setup', 'OutCSelT', opColorOutSelText);
    WriteInteger('Setup', 'OutCRedT', opColorOutRedText);
    WriteInteger('Setup', 'OutCRedSelT', opColorOutRedSelText);
    WriteInteger('Setup', 'OutCHi', opColorOutHi);

    if SynExe then
    begin
      WriteBool('Hist', 'Sess', opHistSessionSave);
      WriteBool('Hist', 'SessLd', opHistSessionLoad);
      WriteBool('Hist', 'SessDef', opHistSessionDef);
    end;  
    WriteBool('Hist', 'TempFN', opStateForTemp);
    WriteBool('Hist', 'ProjSv', opHistProjectSave);
    WriteBool('Hist', 'ProjLd', opHistProjectLoad);
    WriteBool('Hist', 'SavePos', opSavePos);

    WriteInteger('Setup', 'NEnc', opNewEnc);
    WriteInteger('Setup', 'NLe', opNewLineEnds);
    WriteString('Setup', 'NLex', opNewLex);

    WriteBool('Setup', 'ACloseTag', opAutoCloseTags);
    WriteBool('Setup', 'ACloseBr', opAutoCloseBrackets);
    WriteBool('Setup', 'ACloseBrEsc', opAutoCloseBracketsNoEsc);
    WriteBool('Setup', 'ACloseQ', opAutoCloseQuotes);

    WriteInteger('Setup', 'TabVMode', opTabVisible);
    WriteInteger('Setup', 'TabMaxL', opTabMaxLen);
    WriteBool('Setup', 'TabDbl', opTabDblClick);
    WriteBool('Setup', 'TabDnD', opTabDragDrop);
    WriteBool('Setup', 'TabSw', opTabSwitcher);

    WriteString('Setup', 'LexOvr', opLexersOverride);
    WriteBool('Setup', 'Inst', opSingleInstance);
    WriteBool('Setup', 'QsCap', opQsCap);
    WriteBool('Setup', 'LexCat', opLexerCat);
    WriteBool('Setup', 'Link', opLink);
    WriteInteger('Setup', 'LinkCl', opColorLink);
    WriteBool('Setup', 'FixBl', opFixBlocks);
    WriteBool('Setup', 'KeepScr', opKeepScr);
    WriteBool('Setup', 'WrapMk', opShowWrapMark);
    WriteInteger('Setup', 'TxOnly', opTextOnly);

    WriteInteger('Setup', 'SaveSRHist', opSaveSRHist);
    WriteInteger('Setup', 'SaveState', opSaveState);
    WriteBool('Setup', 'SaveCaret', opSaveCaret);
    WriteBool('Setup', 'SaveEnc', opSaveEnc);
    WriteBool('Setup', 'AskRO', opAskOverwrite);
    WriteBool('Setup', 'TitleFull', opTitleFull);

    WriteInteger('Hist', 'DirVar', opLastDir);
    if opLastDir=2 then
      WriteString('Hist', 'Dir', UTF8Encode(opLastDirPath));

    WriteBool('Setup', 'MenuIcon', opMenuIcon);
    WriteBool('Setup', 'Beep', opBeep);
    WriteBool('Setup', 'SmHi', opSmartHi);
    WriteBool('Setup', 'SmHiCase', opSmartHiCase);
    WriteString('Setup', 'DateFmt', opDateFmt);
    WriteString('Setup', 'DateFmtP', opDateFmtPLog);
    WriteInteger('Setup', 'Back', opBak);
    WriteInteger('Setup', 'Esc' + c_exe[SynExe], opEsc);
    WriteBool('Setup', 'MruCheck', opMruCheck);
    WriteBool('Setup', 'TabSp', opTabsReplace);
    WriteInteger('Setup', 'Notif', opNotif);

    WriteInteger('Setup', 'MovX', opCaretMoveX);
    WriteInteger('Setup', 'MovY', opCaretMoveY);
    WriteBool('Setup', 'Tail', opFollowTail);
    WriteInteger('Setup', 'UnNeed', opUnicodeNeeded);
    WriteInteger('Setup', 'RecColors', opShowRecentColors);
    WriteBool('Setup', 'CopyLnNoSel', opCopyLineIfNoSel);
    WriteInteger('Setup', 'SortM', Ord(opSortMode));
    WriteBool('Setup', 'UrlClick', opSingleClickURL);

    WriteInteger('Setup', 'CaretsOpt',
      Ord(opCaretsEnabled) + (opCaretsIndicator shl 1) + (opCaretsGutterBand shl 3));

    WriteInteger('Tree', 'Click', Ord(Tree.ClickAction));
    WriteInteger('Tree', 'Color', Tree.Color);
    WriteString('Tree', 'FontName', Tree.Font.Name);
    WriteInteger('Tree', 'FontSize', Tree.Font.Size);
    WriteInteger('Tree', 'FontColor', Tree.Font.Color);
    WriteBool('Tree', 'ASync', Tree.AutoSynchronize);
    WriteInteger('Tree', 'Delay', Tree.UpdateDelay);

    WriteBool('ACP', 'TplTab', opTemplateTabbing);
    WriteString('ACP', 'TplTabEx', opTemplateTabbingExcept);
    WriteBool('ACP', 'UseSingl', opAcpUseSingle);
    WriteBool('ACP', 'Htm', opAcpHtm);
    WriteBool('ACP', 'Css', opAcpCss);
    WriteBool('ACP', 'Tabbing', opAcpTabbing);
    WriteBool('ACP', 'File', opAcpFile);
    WriteInteger('ACP', 'FChars', opAcpFileChars);
    WriteInteger('ACP', 'FSize', opAcpFileSize);
    WriteInteger('ACP', 'Num', opAcpNum);
    WriteBool('ACP', 'IfNone', ecACP.ShowWhenNone);

    WriteInteger('SR', 'OffY', opSrOffsetY);
    WriteBool('SR', 'Expand', opSrExpand);
    WriteBool('SR', 'OnTop' + c_exe[SynExe], opSrOnTop);
    WriteBool('SR', 'SugSel', opSrSuggestSel);
    WriteBool('SR', 'SugWord', opSrSuggestWord);
    WriteInteger('SR', 'MaxTreeMatches', opMaxTreeMatches);

    WriteBool('View', 'Tips', opTipsToken);
    WriteInteger('View', 'TabLast', opTabOptionsLast);
    WriteBool('View', 'TabNum', opTabNums);
    WriteBool('View', 'TabBtn', opTabBtn);
    WriteBool('View', 'TabMul', opTabMultiLine);
    WriteBool('View', 'TabDown', opTabAtBottom);

    WriteInteger('View', 'CaretsGut', opColorCaretsGutter);
    WriteInteger('View', 'MapMkC', opColorMapMarks);
    WriteInteger('View', 'BkC', opColorBkmk);
    WriteInteger('View', 'NPrintBG', opColorNonPrintedBG);
    WriteInteger('View', 'TabC1', opColorTab1);
    WriteInteger('View', 'TabC2', opColorTab2);
    WriteInteger('View', 'TabC3', opColorTab3);
    WriteInteger('View', 'TabCF1', opColorTabFont1);
    WriteInteger('View', 'TabCF2', opColorTabFont2);
    WriteInteger('View', 'SplitC', opColorSplitViews);
    WriteInteger('View', 'SplitS', opColorSplitSlave);
    WriteString('View', 'TabMisc', TabColorsString);
    WriteBool('View', 'BkStrip', opStripBkmk);

    WriteBool('Setup', 'ChInf', opChInf);
    WriteInteger('Setup', 'Lang', opLang);
    if not QuickView then
      WriteBool('Setup', 'Menu' + c_exe[SynExe], Menu.Visible);
    WriteBool('Setup', 'Stat', Status.Visible);
    WriteBool('Setup', 'InitRO' + c_exe[SynExe], opStartRO);
    WriteString('Setup', 'Oem', opOem);
    WriteString('Setup', 'UTF8', opUTF8);
    WriteString('Setup', 'Theme', Theme);
    WriteInteger('Setup', 'Icons', Icons);
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

function SAppDir: string;
begin
  Result:= FAppDataPath + 'SynWrite';
end;

{
function TfmMain.SynPluginsDir: string;
begin
  Result:= SynDir + 'Plugins';
end;
}

function TfmMain.SynPluginIni(const SCaption: string): string;
begin
  Result:= SynIniDir + 'SynPlugin' + SCaption + '.ini';
end;

function TfmMain.SynIniDir: string;
begin
  if SynIsPortable then
    Result:= SynDir
  else
    if SynExe then
    begin
      Result:= SAppDir;
      if not IsDirExist(Result) then
        CreateDir(Result);
      Result:= Result + '\';
    end
    else
      Result:= ExtractFilePath(LsIni);
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

function TfmMain.SynStateIni: string;
begin
  Result:= SynIniDir + 'SynState.ini';
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

//------------
function EncodeBkmkPos(Ed: TSyntaxMemo; NPos: Integer): Integer;
begin
  Result:= NPos;
end;

function DecodeBkmkPos(Ed: TSyntaxMemo; NPos: Integer): Integer;
begin
  Result:= NPos;
end;

{
//these are made to work-around SyntMemo bug with bad bookmark-gutter-obj position
//after file reopening. Don't help.
function EncodeBkmkPos(Ed: TSyntaxMemo; NPos: Integer): Integer;
var
  p: TPoint;
begin
  if NPos=-1 then
    Result:= -1
  else
  begin
    p:= Ed.StrPosToCaretPos(NPos);
    //msg(format('enc %d', [p.y]));
    Result:= p.Y or $40000000;
  end;
end;
}
{
function DecodeBkmkPos(Ed: TSyntaxMemo; NPos: Integer): Integer;
var
  p: TPoint;
begin
  if NPos=-1 then
    Result:= -1
  else
  if NPos and $40000000 = 0 then
    Result:= NPos
  else
  begin
    NPos:= NPos shl 2 shr 2;
    p:= Point(0, NPos);
    //msg(format('dec %d', [p.y]));
    Result:= Ed.CaretPosToStrPos(p);
  end;
end;
}

//------------
procedure LoadStateBookmarks(const State: TEdState; Ed: TSyntaxMemo);
var
  i, NIndex: Integer;
  NPos: integer;
  IsNumbered: boolean;
begin
  NIndex:= 9;
  for i:= 0 to 9 do
  begin
    NPos:= State.Bookmarks[i];
    if NPos = -1 then Continue;
    IsNumbered:= NPos > 0; //is high bit clear?
    if IsNumbered then
      Ed.Bookmarks[i]:= DecodeBkmkPos(Ed, NPos)
    else
    begin
      NPos:= NPos and $7FFFFFFF; //clear high bit
      Inc(NIndex);
      Ed.Bookmarks[NIndex]:= DecodeBkmkPos(Ed, NPos);
      //msg(format('set UN %d', [NIndex]));
    end;
  end;
end;

procedure SaveStateBookmarks(var State: TEdState; Ed: TSyntaxMemo);
  function FirstNonBusy: integer;
  var i: Integer;
  begin
    Result:= -1;
    for i:= 0 to 9 do
      if State.Bookmarks[i] = -1 then
        begin Result:= i; Exit end;
  end;
var
  i, NIndex, NStore: integer;
  NPos: integer;
begin
  //store numbered bookmk
  for i:= 0 to 9 do
    State.Bookmarks[i]:= EncodeBkmkPos(Ed, Ed.Bookmarks[i]);

  //store unnumbered bookmk
  with Ed.BookmarkObj do
    for i:= 0 to Count-1 do
    begin
      NIndex:= Items[i].BmIndex;
      NPos:= Items[i].Position;
      if NIndex<=9 then Continue;
      if NPos<0 then Continue;
      NStore:= FirstNonBusy;
      if NStore<0 then Exit;
      //save UNnumbered with high bit = 1
      State.Bookmarks[NStore]:= EncodeBkmkPos(Ed, NPos) or (1 shl 31); 
      //msg(format('%d pos, %d bk', [NPos, NIndex]));
    end;
end;
//------------

function TfmMain.LoadState(Frame: TEditorFrame; const FN: WideString): boolean; //isFileLoaded
var
  tmp: TFileState;
  f: file of TFileState;
  i: integer;
  s: string[100];
begin
  Result:=false;
  if (opSaveState=0) or
    (FN='') or
    (Frame=nil) or
    (not IsFileExist(SynStateIni)) then Exit;
  if IsTempFN(FN) and
    (not opStateForTemp) then Exit;

  i:= Length(FN);
  if i<=100 then s:=FN
  else s:=Copy(FN, i-100, 100);

  AssignFile(f, SynStateIni);
  Reset(f);
  while not Eof(f) do begin
    Read(f, tmp);
    if tmp.Name=s then
    with Frame do begin
      Result:= True;

      //encoding
      if opSaveEnc then
      begin
        case tmp.CP of
        cp__UTF8_noBOM:
        begin
          TextSource.Lines.TextCoding:= tcUTF8;
          SkipSign:= True;
        end;
        cp__UTF8:
        begin
          TextSource.Lines.TextCoding:= tcUTF8;
          SkipSign:= False;
        end;
        cp__Unicode:
          TextSource.Lines.TextCoding:= tcUnicode;
        cp__UnicodeBE:
          TextSource.Lines.TextCoding:= tcSwapUnicode;
        else
        begin
          TextSource.Lines.TextCoding:= tcAnsi;
          TextSource.Lines.Codepage:= tmp.CP;
        end;
        end;
      end;

      TextSource.Lines.SkipSignature:=true;
      TextSource.Lines.LoadFromFile(FN);
      TextSource.Lines.SkipSignature:=false;

      //Lexer
      if (tmp.HL<>'') and FCanUseLexer(FN) then
        TextSource.SyntaxAnalyzer:=SyntaxManager.FindAnalyzer(tmp.HL)
      else
        TextSource.SyntaxAnalyzer:=nil;
      SyntaxManager.CurrentLexer:=TextSource.SyntaxAnalyzer;
      SyntaxManagerChange(Self);

      if QuickView then
        TextSource.ReadOnly:= true;

      EditorMaster.WordWrap:=tmp.Wrap;
      EditorSlave.WordWrap:=tmp.Wrap;

      EditorMaster.ScrollPosX:= 0;
      EditorSlave.ScrollPosX:= 0;

      SplitPos:= tmp.SplitPos;
      SplitHorz:= not tmp.SplitVert;

      //caret/top-line
      if opSaveCaret then
      begin
        EditorMaster.CaretStrPos:=tmp.M.CursorPos;
        EditorSlave.CaretStrPos:=tmp.S.CursorPos;
        EditorMaster.TopLine:=tmp.M.TopLine;
        EditorSlave.TopLine:=tmp.S.TopLine;
      end
      else
      begin
        EditorMaster.CaretStrPos:=0;
        EditorSlave.CaretStrPos:=0;
        EditorMaster.TopLine:=0;
        EditorSlave.TopLine:=0;
      end;

      //selection
      if opSaveCaret then
      begin
        if tmp.M.ColStart>0 then
          EditorMaster.SelRect:=Rect(tmp.M.ColStart,tmp.M.SelStart,tmp.M.ColEnd,tmp.M.SelEnd)
        else
        begin
          EditorMaster.SelStart:=tmp.M.SelStart;
          EditorMaster.SelLength:=tmp.M.SelEnd;
        end;
        if tmp.S.ColStart>0 then
          EditorSlave.SelRect:=Rect(tmp.S.ColStart,tmp.S.SelStart,tmp.S.ColEnd,tmp.S.SelEnd)
        else
        begin
          EditorSlave.SelStart:=tmp.S.SelStart;
          EditorSlave.SelLength:=tmp.S.SelEnd;
        end;
      end;

      LoadStateBookmarks(tmp.M, EditorMaster);
      LoadStateBookmarks(tmp.S, EditorSlave);
      Break;
    end;
  end;
  CloseFile(f);
end;

procedure TfmMain.SaveState(F: TEditorFrame);
var
  tmp: TFileState;
  a: array of TFileState;
  t: file of TFileState;
  i,j: integer;
begin
  if (opSaveState=0) or
   (F=nil) or
   (F.FileName='') then Exit;
  if IsTempFN(F.FileName) and
    (not opStateForTemp) then Exit;

  //fill data
  FillChar(tmp, SizeOf(tmp), 0);
  i:= Length(F.FileName);
  if i<=100 then
    tmp.Name:= F.FileName
  else
    tmp.Name:= Copy(F.FileName, i-100, 100);
  if F.TextSource.SyntaxAnalyzer<>nil then
    tmp.HL:= F.TextSource.SyntaxAnalyzer.LexerName
  else
    tmp.HL:= '';

  tmp.Wrap:= F.EditorMaster.WordWrap;
  tmp.SplitPos:= byte(Round(F.SplitPos));
  tmp.SplitVert:= not F.SplitHorz;
  tmp.CP:= GetCP(F);

  //fill master
  tmp.M.TopLine:= F.EditorMaster.TopLine;
  tmp.M.CursorPos:= F.EditorMaster.CaretStrPos;
  if F.EditorMaster.SelectMode=msColumn then
  begin
    tmp.M.ColStart:= F.EditorMaster.SelRect.Left;
    tmp.M.ColEnd:= F.EditorMaster.SelRect.Right;
    tmp.M.SelStart:= F.EditorMaster.SelRect.Top;
    tmp.M.SelEnd:= F.EditorMaster.SelRect.Bottom;
  end
  else
  begin
    tmp.M.ColStart:= -1;
    tmp.M.ColEnd:= -1;
    tmp.M.SelStart:= F.EditorMaster.SelStart;
    tmp.M.SelEnd:= F.EditorMaster.SelLength;
  end;

  //fill slave
  tmp.S.TopLine:= F.EditorSlave.TopLine;
  tmp.S.CursorPos:= F.EditorSlave.CaretStrPos;
  if F.EditorSlave.SelectMode=msColumn then
  begin
    tmp.S.ColStart:= F.EditorSlave.SelRect.Left;
    tmp.S.ColEnd:= F.EditorSlave.SelRect.Right;
    tmp.S.SelStart:= F.EditorSlave.SelRect.Top;
    tmp.S.SelEnd:= F.EditorSlave.SelRect.Bottom;
  end
  else
  begin
    tmp.S.ColStart:= -1;
    tmp.S.ColEnd:= -1;
    tmp.S.SelStart:= F.EditorSlave.SelStart;
    tmp.S.SelEnd:= F.EditorSlave.SelLength;
  end;

  //save bookmarks
  SaveStateBookmarks(tmp.M, F.EditorMaster);
  SaveStateBookmarks(tmp.S, F.EditorSlave);

  //read old data
  AssignFile(t, SynStateIni);
  if IsFileExist(SynStateIni) then begin
    Reset(t);
    i:=0;
    while not Eof(t) do begin
      SetLength(a, i+1);
      Read(t, a[i]);
      Inc(i);
    end;
  end;

  //save history, new first
  Rewrite(t);
  Write(t, tmp);
  if opSaveState>Length(a) then
    j:=Length(a)-1
  else
    j:=opSaveState;
  for i:=0 to j do
    if a[i].Name<>tmp.Name then
      Write(t, a[i]);
  CloseFile(t);
end;

function TfmMain.GetModifiedCount(FExcept: TEditorFrame = nil): integer;
var
  i: integer;
begin
  Result:= 0;
  for i:= 0 to FrameAllCount-1 do
    if FramesAll[i] <> FExcept then
      if FramesAll[i].Modified then Inc(Result);
end;

function TfmMain.AskClose(CanCancel: boolean = false): boolean;
var
  i: integer;
begin
  if GetModifiedCount = 0 then
  begin
    for i:= 0 to FrameAllCount-1 do
      SaveState(FramesAll[i]);
    Result:= True;
  end
  else
    Result:= CloseAll(CanCancel, False);

  if Assigned(fmProj) then
  begin
    if opHistProjectSave then
      fmProj.DoSaveProjectIfNeeded
    else
      fmProj.CheckModified(true);
  end;
end;

function TfmMain.SynLexLib: string;
begin
  Result:= SynDir + 'HL\LexLib.LXL';
end;  

procedure TfmMain.SaveLexLib;
begin
  SyntaxManager.SaveToFile(SyntaxManager.FileName);
end;

function TfmMain.AskLexer(CanCancel: boolean = false): boolean;
var
  buttons: TMsgDlgButtons;
begin
  Result:= True;
  if SyntaxManager.Modified then
  begin
    buttons:= [mbYes, mbNo];
    if CanCancel then
      Include(buttons, mbCancel);
      
    case WideMessageDlg(DKLangConstW('MSavLex'), mtConfirmation, buttons, 0) of
      mrYes:
        begin
          SaveLexLib;
          SyntaxManager.Modified:= False;
        end;
      mrNo:
        SyntaxManager.Modified:= False;
      mrCancel:
        Result:= False;
    end;
  end;
end;

procedure TfmMain.SynKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if CurrentEditor = nil then Exit;

  {
  if Assigned(fmSR) and fmSR.Focused then
  begin
    MsgError('1');
    Key:= 0;
    Exit
  end;
  }

  if CurrentEditor.ReadOnly or (Shift = [ssAlt]) then
  begin
    if Chr(Lo(Key)) in ['N', 'P'] then
    begin
      PostMessage(hLister, WM_KEYDOWN, Key, 0); //File -> Next (N) or Prev (P)
      Key:= 0;
      Exit
    end
    else
    if Chr(Lo(Key)) in ['1'..'7'] then
    begin
      PostMessage(hLister, WM_KEYDOWN, Key, 0); //Options -> 1..7
      Key:= 0;
      Exit
    end;
  end;

  if CurrentEditor.ReadOnly and (Key = VK_SPACE) and (Shift = []) then
  begin
    CurrentEditor.ExecCommand(smScrollPageDown);
    Key:= 0;
    Exit
  end;

  if not CurrentEditor.ReadOnly and (Key = vk_tab) and (Shift = []) then
    if ecACP.Visible then
    begin
      Key:= 0;
      Exit;
    end;
end;

function TfmMain.NoCursor(E: TSyntaxMemo): boolean;
begin
  with E do
    Result:= ReadOnly and not (soAlwaysShowCaret in Options);
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

procedure TfmMain.SynExecuteCommand(Sender: TObject; Command: Integer;
  Data: Pointer; var Handled: Boolean);
var
  ch: WideChar;
  p: TPoint;
  n: integer;
  Ed: TSyntaxMemo;
  Sel: TSynSelSave;
begin
  //remember last edit cmd
  DoHandleLastCmd(Command, Data);

  Handled:= True;
  Ed:= Sender as TSyntaxMemo;

  ////debug
  //Application.MainForm.Caption:= IntToStr(Command);

  case Command of
    //auto-close tag
    smChar:
      begin
        Handled:= false;
        if Data<>nil then
          ch:= PWideChar(Data)^
        else
          ch:= #0;
        if (ch='>') then
          Handled:= DoAutoCloseTag
        else
        if Pos(ch, '()[]{}"''')>0 then
          Handled:= DoAutoCloseBracket(ch)
        else
        if IsWordChar(ch) then
          DoCheckAutoShowACP(Ed);
      end;

    //case
    smUpperCaseBlock,
    smLowerCaseBlock,
    smToggleCaseBlock,
    smTitleCaseBlock,
    smSentCaseBlock:
      begin
        DoSaveSel(Ed, Sel);
        Ed.SelChangeCase(TChangeCase(Command - smUpperCaseBlock + 1));
        DoRestoreSel(Ed, Sel);
      end;

    //indent
    smTab:
      begin
        if Ed.HaveSelection and IsMultilineSelection(Ed) then
        begin
          Ed.ExecCommand(smBlockIndent);
          Exit;//don't record Tab cmd
        end
        else
        if DoSmartTagTabbing then
          begin end
        else
        if DoTemplateTabbing then
          begin end
        else
          Handled:= false;
      end;

    smCopy:
      begin
        if not CurrentEditor.HaveSelection and opCopyLineIfNoSel then
          ecCopyLine.Execute
        else
          Handled:= false;
      end;
    smCut:
      begin
        if not CurrentEditor.HaveSelection and opCopyLineIfNoSel then
          ecCutLine.Execute
        else
          Handled:= false;
      end;

    smBlockIndent,
    smBlockUnindent:
      begin
        //if Ed.HaveSelection then
        if Ed.SelLength>0 then
          DoBlockIndent(Ed, Command=smBlockIndent)
        else
          Handled:= false;
      end;

    smScrollUp,
    smScrollDown:
      with Ed do
      begin
        Handled:= False;
        if opKeepScr and not NoCursor(Ed) then
        begin
          p:= CaretPos;
          n:= TopLine + 1;
          if p.Y < n then
            CaretPos:= Point(p.X, n) else
          begin
            n:= TopLine + ClientHeight div LineHeight(0) - 2;
            if p.Y > n then
              CaretPos:= Point(p.X, n);
          end;
        end;
      end;

    smDuplicateLine:
      DoDupLine(Ed);

    smGotoLine:
      ecGoto.Execute;

    (*//doesnt work in RO, marks 1..7
    smGotoBookmark0 .. smGotoBookmark9:
    begin
      Ed.CaretStrPos:= Ed.Bookmarks[Command - smGotoBookmark0];
      Handled:= False;
    end;*)
    smSetBookmark0 .. smSetBookmark9:
      begin
        BrotherEditor(Ed).Bookmarks[Command - smSetBookmark0]:= Ed.CaretStrPos;
        Handled:= False;
      end;

    sm_AutoComplete:
      DoAcpCommand;

    //bkmarks
    sm_BkClear:
      ecBkClearAll.Execute;
    sm_BkToggle:
      ecBkToggle.Execute;
    sm_BkPrev:
      ecBkPrev.Execute;
    sm_BkNext:
      ecBkNext.Execute;
    sm_BkCopy:
      ecBkCopy.Execute;
    sm_BkCut:
      ecBkCut.Execute;
    sm_BkDelete:
      ecBkDelete.Execute;
    sm_BkDeleteUnmk:
      ecBkDeleteUnmk.Execute;
    sm_BkPaste:
      ecBkPaste.Execute;
    sm_BkInverse:
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
      if NoCursor(Ed) then
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
      if NoCursor(Ed) then
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
      if NoCursor(Ed) then Ed.ExecCommand(smScrollUp)
      else Handled:= False;
    smDown:
      if NoCursor(Ed) then Ed.ExecCommand(smScrollDown)
      else Handled:= False;
    smPageUp:
      if NoCursor(Ed) then Ed.ExecCommand(smScrollPageUp)
      else Handled:= False;
    smPageDown:
      if NoCursor(Ed) then Ed.ExecCommand(smScrollPageDown)
      else Handled:= False;
    smFirstLetter{home}:
      if NoCursor(Ed) then Ed.ExecCommand(smEditorTop{smScrollPageLeft})
      else Handled:= False;
    smLastLetter{end}:
      if NoCursor(Ed) then Ed.ExecCommand(smEditorBottom{smScrollPageRight})
      else Handled:= False;

    //Shift+
    smSelLeft..smSelDown:
      Handled:= NoCursor(Ed);

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
            DoCheckDialogOverlapsCaret(Finder.Control, fmSR);
        end
        else
          ecFind.Execute;
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
            DoCheckDialogOverlapsCaret(Finder.Control, fmSR);
        end
        else
          ecFind.Execute;
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
        UpdateMicroMap(CurrentFrame);
      end;
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
    end;

    smReplaceNext:
    begin
      FindInit(true{KeepFlags});
      if Finder.FindText='' then
        ecReplace.Execute
      else
      begin
        Finder.Flags:= Finder.Flags-[ftEntireScope];
        DoFixReplaceCaret(CurrentEditor);
        if CurrentEditor.SelLength>0 then
          Finder.ReplaceAgain;
        Finder.FindAgain;
      end;
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
    sm_ListerFind:
      PostMessage(hLister, WM_KEYDOWN, VK_F7, 0);
    sm_ListerFNext:
      PostMessage(hLister, WM_KEYDOWN, VK_F3, 0);
    sm_ListerFPrev:
      begin
        PostMessage(hLister, WM_KEYDOWN, VK_SHIFT, 0);
        PostMessage(hLister, WM_KEYDOWN, VK_F3, 0);
      end;

    //clip
    sm_CopyAsHTML:
      ecCopyAsHTML.Execute;
    sm_CopyAsRTF:
      ecCopyAsRTF.Execute;
    sm_CopyAppend:
      ecCopyApp.Execute;
    sm_CutAppend:
      ecCutApp.Execute;
    sm_CopyLine:
      ecCopyLine.Execute;
    sm_CutLine:
      ecCutLine.Execute;

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
    sm_OpenFirefox: TbxItemRunFirefoxClick(Self);
    sm_OpenMSIE: TbxItemRunMSIEClick(Self);
    sm_OpenChrome: TbxItemRunChromeClick(Self);
    sm_OpenSafari: TbxItemRunSafariClick(Self);
    sm_OpenCurrentFile: TbxItemRunOpenFileClick(Self);
    sm_OpenCurrentFolder: TbxItemRunOpenDirClick(Self);
    sm_OpenPhp: TbxItemRunFindPhpClick(Self);
    sm_OpenGoogle: TbxItemRunFindGoogleClick(Self);
    sm_OpenWiki: TbxItemRunFindWikiClick(Self);
    sm_OpenMsdn: TbxItemRunFindMSDNClick(Self);
    sm_OpenHTML4Help: TbxItemRunFindHtml4Click(Self);
    sm_OpenHTML5Help: TbxItemRunFindHtml5Click(Self);
    sm_OpenPreview: TbxItemRunPreviewClick(Self);
    sm_LoremIpsum: ecLoremIpsum.Execute;
    sm_NumericConverter: ecNumericConverter.Execute;
    sm_EncodeHtmlChars: ecEncodeHtmlChars.Execute;
    sm_SortDialog: ecSortDialog.Execute;
    sm_ToggleLineCommentAlt: ecToggleLineCommentAlt.Execute;

    sm_TidyValidate: TbxItemTidyValClick(Self);
    sm_TidyConfig: TbxItemTidyCfgClick(Self);
    sm_InsertColor: ecInsertColor.Execute;
    sm_InsertImage: ecInsertImage.Execute;
    sm_GotoSelEdge: ecGotoSelEdge.Execute;
    sm_GotoBookmkDialog: ecGotoBk.Execute;
    sm_ReplaceFromClipAll: ecReplaceSelFromClipAll.Execute;
    sm_RereadOutPanel: fRereadOut.Execute;
    sm_DropPortableBk: ecDropPortableBk.Execute;
    sm_GotoPortableBk: ecGotoPortableBk.Execute;
    sm_IndentLike1st: ecIndentLike1st.Execute;
    sm_JumpColumnMarkerLeft: ecJumpColumnMarkerLeft.Execute;
    sm_JumpColumnMarkerRight: ecJumpColumnMarkerRight.Execute;
    sm_PasteNoCursorChange: ecPasteNoCurChange.Execute;
    sm_PasteToColumn1: ecPasteToColumn1.Execute;
    sm_PasteAsColumnBlock: ecPasteAsColumnBlock.Execute;
    sm_JumpMixedCaseLeft: ecJumpMixedCaseLeft.Execute;
    sm_JumpMixedCaseRight: ecJumpMixedCaseRight.Execute;
    sm_CancelSelection: ecCancelSelection.Execute;
    sm_CenterLines: ecCenterLines.Execute;
    sm_ExtendSelByLine: ecExtendSelByLine.Execute;
    sm_SelectBrackets: ecSelBrackets.Execute;
    sm_CollapseParent: ecCollapseParent.Execute;
    sm_CollapseWithNested: ecCollapseWithNested.Execute;
    sm_AlignWithSep: ecAlignWithSep.Execute;
    sm_ToggleView2: ecToggleView2.Execute;
    sm_SelectionExtend: ecSelExtend.Execute;
    sm_SelectionShrink: ecSelShrink.Execute;
    sm_ReverseLines: ecReverseLines.Execute;
    sm_ShuffleLines: ecShuffleLines.Execute;
    sm_DeleteToFileBegin: ecDeleteToFileBegin.Execute;
    sm_DeleteToFileEnd: ecDeleteToFileEnd.Execute;

    //blank operations
    sm_RemoveBlanks: ecRemoveBlanks.Execute;
    sm_ReduceBlanks: ecReduceBlanks.Execute;
    sm_TrimLead: ecTrimLead.Execute;
    sm_TrimTrail: ecTrimTrail.Execute;
    sm_TrimAll: ecTrimAll.Execute;
    sm_RemoveDupSp: ecRemoveDupSpaces.Execute;
    sm_TabToSp: ecTabToSp.Execute;
    sm_SpToTab: ecSpToTab.Execute;
    sm_SpToTabLead: ecSpToTabLeading.Execute;

    sm_GotoNextBlank: ecGotoNextBlank.Execute;
    sm_GotoPrevBlank: ecGotoPrevBlank.Execute;
    sm_SelectParagraph: ecSelPara.Execute;
    sm_SelectToken: ecSelToken.Execute;
    sm_SelectToWordEnd: ecSelToWordEnd.Execute;
    sm_JumpToWordEnd: ecJumpToWordEnd.Execute;
    sm_FindNextExtSel: ecFindNextWithExtend.Execute;
    sm_FindPrevExtSel: ecFindPrevWithExtend.Execute;
    sm_FindClipNext: ecFindClipNext.Execute;
    sm_FindClipPrev: ecFindClipPrev.Execute;
    sm_RepeatCmd: ecRepeatCmd.Execute;
    sm_FindCommand: DoFindCommandFromString(WideString(PWideChar(Data)));
    sm_CommandsList: ecCommandsList.Execute;
    sm_ScrollToSel: ecScrollToSel.Execute;
    sm_ProjectList: ecProjectList.Execute;

    sm_MarkersClear: ecMarkersClear.Execute;
    sm_JumpToLastMarker: ecJumpToLastMarker.Execute;

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
    sm_Tab0: TabClickN(0);
    sm_Tab1: TabClickN(1);
    sm_Tab2: TabClickN(2);
    sm_Tab3: TabClickN(3);
    sm_Tab4: TabClickN(4);
    sm_Tab5: TabClickN(5);
    sm_Tab6: TabClickN(6);
    sm_Tab7: TabClickN(7);
    sm_Tab8: TabClickN(8);
    sm_Tab9: TabClickN(9);

    sm_TabRt0: TabRightClickN(0);
    sm_TabRt1: TabRightClickN(1);
    sm_TabRt2: TabRightClickN(2);
    sm_TabRt3: TabRightClickN(3);
    sm_TabRt4: TabRightClickN(4);
    sm_TabRt5: TabRightClickN(5);
    sm_TabRt6: TabRightClickN(6);
    sm_TabRt7: TabRightClickN(7);
    sm_TabRt8: TabRightClickN(8);
    sm_TabRt9: TabRightClickN(9);

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
    sm_EncAnsi: ChangeEncoding(CurrentFrame, cp_ACP);
    sm_EncOem: ChangeEncoding(CurrentFrame, cp_OEMCP);
    sm_EncUtf: ChangeEncoding(CurrentFrame, cp__UTF8);
    sm_EncUtf2: ChangeEncoding(CurrentFrame, cp__UTF8_noBOM);
    sm_EncUni: ChangeEncoding(CurrentFrame, cp__Unicode);
    sm_EncUniBE: ChangeEncoding(CurrentFrame, cp__UnicodeBE);
    sm_EncKoi: ChangeEncoding(CurrentFrame, 20866);
    sm_EncMac: ChangeEncoding(CurrentFrame, cp_MACCP);

    sm_MenuEnc:
      begin
      p:= Mouse.CursorPos;
      PopupCP.Popup(p.x, p.y);
      end;
    sm_MenuLex:
      begin
      p:= Mouse.CursorPos;
      PopupLex.Popup(p.x, p.y);
      end;
    sm_MenuLE:
      begin
      p:= Mouse.CursorPos;
      PopupLE.Popup(p.x, p.y);
      end;
    sm_QS:
      begin
      if not tbQs.Visible then
        TbxItemTQsClick(Self);
      tbQs.CurrentDock.Show;
      if Self.Enabled and edQs.CanFocus then
        edQs.SetFocus;
      end;
    sm_DateTime:
      DoDateTime;
    sm_ExStr:
      TBXItemEExtrClick(Self);
    sm_GotoNextFindResult:
      ecGotoNextFindResult.Execute;
    sm_GotoPrevFindResult:
      ecGotoPrevFindResult.Execute;
    sm_ClrHist:
      TBXItemClrClick(Self);
    sm_SyncEdit:
      TBXItemESyncEdClick(Self);
    sm_FullScr:
      ecFullScr.Execute;
    sm_OnTop:
      ecOnTop.Execute;
    sm_SyncScrollH:
      ecSyncScrollH.Execute;
    sm_SyncScrollV:
      ecSyncScrollV.Execute;
    sm_FillBlock:
      DoFillBlock;
    sm_InsText:
      DoInsertTextDialog;
    sm_SpellLive:
      ecSpellLive.Execute;
    sm_SpellCheck:
      ecSpellCheck.Execute;
    sm_JoinLines:
      ecJoinLines.Execute;
    sm_SplitLines:
      ecSplitLines.Execute;

    smSelCharacter:
      with ecSelCharPopup1 do
        if Visible then
          CloseUp(false)
        else
          Handled:= false;

    smCommentLines,
    smUncommentLines:
      DoCommentLines(Command = smCommentLines);

    //file
    sm_FNew: fNew.Execute;
    sm_FNewWin: fNewWin.Execute;
    sm_FOpen: fOpen.Execute;
    sm_FReopen: fReread.Execute;
    sm_FSave: if fSave.Enabled then fSave.Execute;
    sm_FSaveAs: if fSaveAs.Enabled then fSaveAs.Execute;
    sm_FSaveAll: fSaveAll.Execute;
    sm_FProps: fProps.Execute;
    sm_FavAddFile: fFavAddFile.Execute;
    sm_FavAddProj: fFavAddProj.Execute;
    sm_FavOrganize: fFavManage.Execute;

    //Closing handling is special
    sm_FClose,
    sm_FCloseDel,
    sm_FCloseAll,
    sm_FCloseOth,
    sm_FileRename:
    begin
      PostMessage(Handle, WM_USER+2, Command, 0);
    end;

    sm_FMoveTab:
      DoMoveTabToOtherView(-1);

    sm_FExit:
      fExit.Execute;
    sm_FSaveSession:
      TBXItemFSesSaveClick(Self);
    sm_FSaveSessionAs:
      TBXItemFSesSaveAsClick(Self);
    sm_FOpenSession:
      TBXItemFSesOpenClick(Self);
    sm_FAddSession:
      TBXItemFSesAddClick(Self);
    sm_FCloseSession:
      TBXItemFSesCloseClick(Self);

    sm_FExpRtf: fExportRTFAction.Execute;
    sm_FExpHtml: fExportHTMLAction.Execute;

    sm_OSetup: fSetup.Execute;
    sm_OSetupLexer: fCustomizeLexer.Execute;
    sm_OSetupLexerLib: fCustomizeLexerLib.Execute;
    sm_OReadOnly: ecReadOnly.Execute;
    sm_OShowTree: ecShowTree.Execute;
    sm_OShowClip: ecShowClip.Execute;
    sm_OShowOut: ecShowOut.Execute;
    sm_OWrap: ecWrap.Execute;
    sm_OLineNums: ecLineNums.Execute;
    sm_OFolding: ecFolding.Execute;
    sm_ONonPrint: ecNonPrint.Execute;
    sm_ORuler: ecRuler.Execute;
    sm_ToggleSmartHl: ecSmartHl.Execute;

    sm_ToggleFocusTree: ecToggleFocusTree.Execute;
    sm_ToggleFocusClip: ecToggleFocusClip.Execute;
    sm_ToggleFocusClips: ecToggleFocusClips.Execute;
    sm_ToggleFocusOutput: ecToggleFocusOutput.Execute;
    sm_ToggleFocusFindRes: ecToggleFocusFindRes.Execute;
    sm_ToggleFocusView: ecToggleView.Execute;
    sm_ToggleFocusValidate: ecToggleFocusValidate.Execute;
    sm_ToggleFocusMap: ecToggleFocusMap.Execute;
    sm_ToggleFocusProj: ecToggleFocusProject.Execute;
    sm_ToggleFocusTabs: ecToggleFocusTabs.Execute;
    sm_ToggleSlaveView: ecToggleSlave.Execute;
    sm_ToggleFocusMasterSlave: ecToggleFocusMasterSlave.Execute;
    sm_SplitViewsVertHorz: ecSplitViewsVertHorz.Execute;
    sm_SplitSlaveVertHorz: ecSplitSlaveVertHorz.Execute;

    sm_ZenExpand: ecZenExpand.Execute;
    sm_ZenWrap: ecZenWrap.Execute;

    sm_ToggleLineComment:
      ecToggleLineComment.Execute;
    sm_ToggleStreamComment:
      ecToggleStreamComment.Execute;
    sm_MakeBak:
      fMakeBak.Execute;
    sm_ColumnMarkers:
      fColumnMarkers.Execute;

    //copy path
    sm_CopyFN:
      DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFileName);
    sm_CopyFullPath:
      DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFullName);
    sm_CopyDirPath: 
      DoCopyFilenameToClipboard(CurrentFrame, scmdCopyFilePath);

    //move caret
    sm_CaretIncX:
      DoMoveCaretXY(opCaretMoveX, 0);
    sm_CaretDecX:
      DoMoveCaretXY(-opCaretMoveX, 0);
    sm_CaretIncY:
      DoMoveCaretXY(0, opCaretMoveY);
    sm_CaretDecY:
      DoMoveCaretXY(0, -opCaretMoveY);

    //goto bracket
    smChangeRangeSide:
      DoRangeJump(Ed);

    //Macros
    {
    //Disable! Or Stack-over.
    smMacroRecStart: ecMacroRecord1.Execute;
    smMacroRecStop:  ecMacroStop1.Execute;
    smMacroRecCancel: ecMacroCancel1.Execute;
    smMacroPlay:     ecMacroPlay1.Execute;
    }
    sm_MacroDlg:     ecMacroDlg.Execute;

    //Zoom
    sm_ZoomIn,
    sm_ZoomOut:
      begin
        n:= 10;
        if Command = sm_ZoomOut then n:= -n;
        Ed.Zoom:= Ed.Zoom + n;
        TemplateEditor.Zoom:= Ed.Zoom;
        StatusItemZoom.Caption:= IntToStr(Ed.Zoom) + '%';
        StatusItemHint.Caption:= WideFormat(DKLangConstW('Zoom'), [Ed.Zoom]);
      end;
    sm_Zoom0:
      begin
        Ed.Zoom:= 100;
        TemplateEditor.Zoom:= Ed.Zoom;
        StatusItemZoom.Caption:= IntToStr(Ed.Zoom) + '%';
        StatusItemHint.Caption:= WideFormat(DKLangConstW('Zoom'), [Ed.Zoom]);
      end;

    sm_ONonPrintOff: ecNonPrintOff.Execute;
    sm_ONonPrintSpaces: ecNonPrintSpaces.Execute;
    sm_ONonPrintEol: ecNonPrintEol.Execute;
    sm_ONonPrintBoth: ecNonPrintBoth.Execute;
    sm_ONonPrintEolDetails: ecNonPrintEolDetails.Execute;

    sm_FoldLevel2: DoFoldLevel(2);
    sm_FoldLevel3: DoFoldLevel(3);
    sm_FoldLevel4: DoFoldLevel(4);
    sm_FoldLevel5: DoFoldLevel(5);
    sm_FoldLevel6: DoFoldLevel(6);
    sm_FoldLevel7: DoFoldLevel(7);
    sm_FoldLevel8: DoFoldLevel(8);
    sm_FoldLevel9: DoFoldLevel(9);

    sm_TabColorDefault: DoSetTabColorIndex(0);
    sm_TabColorCustom: DoSetTabColorIndex(-1);
    sm_TabColor1: DoSetTabColorIndex(1);
    sm_TabColor2: DoSetTabColorIndex(2);
    sm_TabColor3: DoSetTabColorIndex(3);
    sm_TabColor4: DoSetTabColorIndex(4);
    sm_TabColor5: DoSetTabColorIndex(5);
    sm_TabColor6: DoSetTabColorIndex(6);
    sm_TabColor7: DoSetTabColorIndex(7);
    sm_TabColor8: DoSetTabColorIndex(8);
    sm_TabColor9: DoSetTabColorIndex(9);
    sm_TabColor10: DoSetTabColorIndex(10);

    sm_OHideMenuItems: TBXItemOHideItems.Click;
    sm_ORestoreStyles: TBXItemORestoreStyles.Click;
    sm_OExternalTools: TbxItemOTools.Click;
    sm_OExplorerIntegration: TbxItemOShell.Click;
    sm_OEditSynIni: TBXItemOEditSynIni.Click;
    sm_OEditSynPluginsIni: TBXItemOEditSynPluginsIni.Click;
    sm_OpenBySelection: fOpenBySelection.Execute;
    sm_OCustomizeStyles: fCustomizeHi.Execute;

    //Options dialog tabs
    sm_Options_Interface: DoOptionsDialog(0);
    sm_Options_Colors: DoOptionsDialog(1);
    sm_Options_Fonts: DoOptionsDialog(2);
    sm_Options_Tabs: DoOptionsDialog(3);
    sm_Options_Editor: DoOptionsDialog(4);
    sm_Options_Editor2: DoOptionsDialog(5);
    sm_Options_EditorCarets: DoOptionsDialog(6);
    sm_Options_EditorOverrides: DoOptionsDialog(7);
    sm_Options_Keys: DoOptionsDialog(8);
    sm_Options_Files: DoOptionsDialog(9);
    sm_Options_Search: DoOptionsDialog(10);
    sm_Options_TreeMap: DoOptionsDialog(11);
    sm_Options_History: DoOptionsDialog(12);
    sm_Options_SessionsProject: DoOptionsDialog(13);
    sm_Options_AutoComplete: DoOptionsDialog(14);
    sm_Options_AutoSave: DoOptionsDialog(15);
    sm_Options_SpellChecker: DoOptionsDialog(16);
    sm_Options_SearchFolders: DoOptionsDialog(17);
    sm_Options_Misc: DoOptionsDialog(18);

    //tree
    sm_TreeNext: ecTreeNext.Execute;
    sm_TreePrev: ecTreePrev.Execute;
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
  i: integer;
  but: TSpTbxItem;
  menu: TSpTbxSubmenuItem;
  s: TStringList;
  ch: char;
begin
 PopupLex.Items.Clear;
 if (SyntaxManager.AnalyzerCount>0) then
 begin
   but:= TSpTbxItem.Create(Self);
   but.Caption:= DKLangConstW('None');
   but.Tag:= -1;
   but.OnClick:= LexListClick;
   but.RadioItem:= true;
   but.Checked:= (CurrentFrame<>nil) and (CurrentFrame.TextSource.SyntaxAnalyzer=nil);
   PopupLex.Items.Add(but);

   s:=TStringList.Create;
   s.Sorted:=true;
   s.Duplicates:=dupIgnore;
   for i:=0 to SyntaxManager.AnalyzerCount-1 do
     if not SyntaxManager.Analyzers[i].Internal then
       s.AddObject(SyntaxManager.Analyzers[i].LexerName, TObject(i));

  if opLexerCat then
   for ch:='A' to 'Z' do begin
     menu:=TSpTbxSubmenuItem.Create(Self);
     menu.Caption:=ch;
     PopupLex.Items.Add(menu);

     for i:=0 to s.Count-1 do
       if (UpCase(s[i][1]) = UpCase(ch)) then begin
         if SyntaxManager.Analyzers[integer(s.Objects[i])].Internal then Continue;
         but:=TSpTbxItem.Create(Self);
         but.Caption:=s[i];
         but.Tag:=integer(s.Objects[i]);
         but.OnClick:=LexListClick;
         but.RadioItem:=true;
         but.Checked:=(CurrentFrame<>nil)
            and (CurrentFrame.TextSource.SyntaxAnalyzer<>nil)
            and (s[i] = CurrentFrame.TextSource.SyntaxAnalyzer.LexerName);
         menu.Add(but);
       end;
     if menu.Count = 0 then
       FreeAndNil(menu);
   end
   else //not opLexerCat
     for i:=0 to s.Count-1 do
     begin
       if SyntaxManager.Analyzers[integer(s.Objects[i])].Internal then Continue;
       but:=TSpTbxItem.Create(Self);
       but.Caption:=s[i];
       but.Tag:=integer(s.Objects[i]);
       but.OnClick:=LexListClick;
       but.RadioItem:=true;
       but.Checked:=(CurrentFrame<>nil)
          and (CurrentFrame.TextSource.SyntaxAnalyzer<>nil)
          and (s[i] = CurrentFrame.TextSource.SyntaxAnalyzer.LexerName);
       PopupLex.Items.Add(but);
     end;
   FreeAndNil(s);
 end;
end;

procedure TfmMain.LexListClick(Sender: TObject);
var
  i, j, n: integer;
begin
  n:= (Sender as TComponent).Tag;
  if n = -1 then
  begin
    CurrentFrame.TextSource.SyntaxAnalyzer:= nil;
    SyntaxManager.CurrentLexer:= nil;
    SyntaxManagerChange(Self);
  end
  else
  begin
    i:= CurrentFrame.EditorMaster.TopLine;
    j:= CurrentFrame.EditorSlave.TopLine;

    CurrentFrame.TextSource.SyntaxAnalyzer:= SyntaxManager.Analyzers[n];
    SyntaxManager.CurrentLexer:= CurrentFrame.TextSource.SyntaxAnalyzer;
    SyntaxManagerChange(Self);

    CurrentFrame.EditorMaster.TopLine:= i;
    CurrentFrame.EditorSlave.TopLine:= j;
  end;
end;

procedure TfmMain.fSaveExecute(Sender: TObject);
begin
  if CurrentFrame <> nil then
    SaveFrame(CurrentFrame, False);
end;

procedure TfmMain.fSaveAsExecute(Sender: TObject);
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
  if not AskSession(true) then
    Exit;
  if IsFileExist(S) then
    DoOpenSession(S)
  else
  begin
    MsgNoFile(S);
    SynMruSessions.DeleteItem(S);
  end;
end;

procedure TfmMain.PopupLexPopup(Sender: TObject);
begin
  UpdateLexList;
end;

procedure TfmMain.fSetupExecute(Sender: TObject);
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
      cbRoStart.Enabled:= not SynExe;
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

function TfmMain.CloseAll(CanCancel, CanClose: boolean; FExcept: TEditorFrame = nil): boolean;
var
  i, j, ModifiedCount, res: integer;
  F: TEditorFrame;
  P: TTntPageControl;
begin
  Result:= True;
  ModifiedCount:= GetModifiedCount(FExcept);
  res:= mrCancel;
  for i:= FrameAllCount - 1 downto 0 do
  begin
   F:= FramesAll[i];
   if F <> FExcept then
   begin
    if F.Modified then
    begin
      CurrentFrame:= F;
      if (res <> mrYesToAll) and (res <> mrNoToAll) then
        res:= PromtToSave(F, ModifiedCount > 1, CanCancel);
      case res of
        mrYes, mrYesToAll:
          begin
            if not SaveFrame(F, False) then
              begin Result:= False; Exit end;
            F.Modified:= False; //needed if selected Cancel in SaveDialog
            F.ModifiedClr:= True;
          end;
        mrNo, mrNoToAll:
          begin
            F.Modified:= False;
            F.ModifiedClr:= True;
          end;
        mrCancel:
          begin
            Result:= False;
            for j:= 0 to FrameAllCount - 1 do
              FramesAll[j].ModifiedClr:= False;
            Exit
          end;
      end;
      Dec(ModifiedCount);
    end;
    if CanClose then
      CloseFrame(F);
   end;
  end;

  P:= PageControl;
  PageControl:= PageControl2;
  if FrameCount = 0 then FNew.Execute;
  PageControl:= PageControl1;
  if FrameCount = 0 then FNew.Execute;
  PageControl:= P;
  FocusEditor;

  if (PageControl1.PageCount<=1) and
    (PageControl2.PageCount<=1) then
    ClearTabList;
end;

procedure TfmMain.Timer1Timer(Sender: TObject);
begin
  if QuickDestroy then Exit;

  //tree update
  if GetCurrentThreadId = MainThreadID then
    CheckSynchronize;

  //update icons  
  UpdateSaveIco;
  UpdateBusyIco;

  if FUpdatePluginsLang then
  begin
    FUpdatePluginsLang:= false;
    DoRefreshPluginsLang;
  end;

  //repaints
  if FNeedRepaint then
  begin
    FNeedRepaint:= false;

    FixDraw(plOut, true);
    FixDraw(plTree, false);
    FixDraw(plClip, false);

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
end;

procedure TfmMain.fExportRTFActionBeforeExecute(Sender: TObject);
begin
  if CurrentEditor.HaveSelection then
    fExportRTFAction.ExportType:= etSelection
  else
    fExportRTFAction.ExportType:= etAllText;
end;

procedure TfmMain.ecReadOnlyExecute(Sender: TObject);
begin
  CurrentEditor.ReadOnly:= not CurrentEditor.ReadOnly;
  UpdateStatusbar;
  UpdateCur(CurrentEditor);
  UpdateTitle(CurrentFrame);
end;

//fix for missing EC's cursor hiding
procedure TfmMain.UpdateCur(Ed: TSyntaxMemo);
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
  NBandFolding, NBandNums: integer;
begin
  NBandFolding:= 3;
  NBandNums:= F.EditorMaster.LineNumbers.Band;

  if F.EditorMaster.DisableFolding then
  begin
    F.EditorMaster.Gutter.Bands[NBandFolding].Width:= 0;
    F.EditorSlave.Gutter.Bands[NBandFolding].Width:= 0;
  end
  else
  begin
    F.EditorMaster.Gutter.Bands[NBandFolding].Width:= 15;
    F.EditorSlave.Gutter.Bands[NBandFolding].Width:= 15;
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
    UpdateCur(F.EditorMaster);
end;

procedure TfmMain.ButtonOnSelect(Sender: TTBCustomItem; Viewer: TTBItemViewer; Selecting: Boolean);
begin
  SetHint(Sender.Hint);
end;

procedure TfmMain.SynScroll(Sender: TObject);
var
  n: integer;
begin
  //Send info to Lister
  if not SynExe then
    with (Sender as TSyntaxMemo) do
    begin
      if Lines.Count = 0 then n:= 0
      else n:= (TopLine * 100) div Lines.Count;
      PostMessage(hLister, WM_COMMAND, MAKELONG(n, itm_percent), Handle);
    end;

  //sync scroll views
  if not FSyncBusy then
  try
    FSyncBusy:= true;
    DoSyncScroll(Sender as TSyntaxMemo);
  finally
    FSyncBusy:= false;
  end;

  //update map
  SyncMapPos;
end;

procedure TfmMain.plTreeResize(Sender: TObject);
begin
  plTree.Invalidate;
  tbTabsLeft.Invalidate;
  DoResizePlugins;
end;

procedure TfmMain.FinderInit(Sender: TObject);
begin
  Finder.Control:= CurrentEditor;
  SetHint('');
end;

procedure TfmMain.FinderFail(Sender: TObject);
var
  s: WideString;
begin
  HideProgress;

  s:= WideFormat(DKLangConstW('MNFound2'), [Finder.FindText]);
  SetHint(s);
  {if opSrShowMsg and not (Assigned(fmSR) and fmSR.Visible) then
    MsgWarn(s, Handle)
  else}
    MsgBeep;
end;

{
procedure TfmMain.Replace;
var
  R: TecRegExpr;
begin
  if Finder.FindAgain then
   if CurrentEditor.HaveSelection then
    if ftRegularExpr in Finder.Flags then
    begin
      R:= TecRegExpr.Create;
      R.Expression:= Finder.FindText;
      R.ModifierI:= not (ftCaseSensitive in Finder.Flags);
      CurrentEditor.SelText:= R.Substitute(CurrentEditor.Lines.FText, Finder.ReplaceText);
      R.Free;
    end
    else
      CurrentEditor.SelText:= Finder.ReplaceText;
end;
}

procedure TfmMain.FormShow(Sender: TObject);
begin
  FixSplitters;

  {
  //gives exception in SpTBX
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
    begin
      Height:= ScaleFontSize(Height, Self);
      //X
      {
      with Panels[cc0] do Size:= ScaleFontSize(Size, Self);
      with Panels[ccEnc] do Size:= ScaleFontSize(Size, Self);
      with Panels[ccLE] do Size:= ScaleFontSize(Size, Self);
      with Panels[ccLex] do Size:= ScaleFontSize(Size, Self);
      with Panels[ccIns] do Size:= ScaleFontSize(Size, Self);
      with Panels[ccZoom] do Size:= ScaleFontSize(Size, Self);
      }
    end;
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
  LoadIni; //300 msec
  PropsManager.UpdateAll;
  LoadLexLib; //340 msec
  LoadMacros;
  LoadClip;
  LoadHideIni;

  //for proj tree
  ApplyProj;

  //spell
  InitSpell;
  UpdateSpellLang;

  //Init other view
  if PageControl2.PageCount=0 then
  begin
    PageControl:= PageControl2;
    FNew.Execute;
    PageControl:= PageControl1;
  end;

  //update panels
  UpdOut(FTabOut);
  UpdRight(FTabRight);
  UpdLeft(FTabLeft);
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

procedure TfmMain.IncSearchChange(Sender: TObject;
  State: TIncSearchState);
begin
  {
  if State = isStart then
   with Sender as TSyntaxMemo do
     begin
      IncSearchBack:= ftBackward in Finder.Flags;
      IncSearchIgnoreCase:= not (ftCaseSensitive in Finder.Flags);
     end;
  if State <> isStop then
   SB.SimpleText:= 'Search for: ' + (Sender as TSyntaxMemo).IncSearchStr
  else
   SB.SimpleText:= '';
  SB.SimplePanel:= State <> isStop;
  }
end;

procedure TfmMain.FindCurrentWord(Next: boolean);
var
  wStart, wEnd: integer;
begin
  if CurrentEditor=nil then Exit;
  with CurrentEditor do
  begin
    if SelLength>0 then
    begin
      //search for selection
      Finder.FindText:= EditorShortSelText(CurrentEditor);
      wStart:= SelStart;
      wEnd:= wStart+SelLength;
    end
    else
    begin
      //search for curr word
      WordRangeAtPos(CaretPos, wStart, wEnd);
      if wEnd > wStart then
        Finder.FindText:= WordAtPos(CaretPos)
      else
        Exit;
    end;

    //clear RegEx
    Finder.Flags:= Finder.Flags-[ftRegularExpr];
    //search
    if Next then
    begin
      CaretStrPos:= wEnd;
       //repeat selection as caret moving may clear it
       SelStart:= wStart;
       SelLength:= wEnd-wStart;
      Finder.FindNext;
    end
    else
    begin
      CaretStrPos:= wStart;
       //repeat selection
       SelStart:= wStart;
       SelLength:= wEnd-wStart;
      Finder.FindPrev;
    end;
  end;
end;

procedure TfmMain.plTreeVisibleChanged(Sender: TObject);
begin
  FixSplitters;
  ecShowTree.Checked:= plTree.Visible;
end;

procedure TfmMain.ecShowTreeExecute(Sender: TObject);
begin
  with plTree do
    Visible:= not Visible;
  if not plTree.Visible then
    FocusEditor;

  DoRepaintTBs;
end;

const
  cDefColors: array[0..Pred(cTabColors)] of TColor =
    ($9999FF, $CC99FF, $99CCFF, $99FFFF, $CCFFCC, $FFFFCC,
     $FFCC99, $FF9999, $FF99CC, $DDDDDD);

procedure TfmMain.FormCreate(Sender: TObject);
var
  i: integer;
  Cur: HIcon;
begin
  SynDir:= ExtractFilePath(GetModuleName(HInstance));
  SynIsPortable:= IsFileExist(SynDir + 'Portable.ini');

  SynMruFiles:= TSynMruList.Create;
  SynMruSessions:= TSynMruList.Create;
  SynMruNewdoc:= TSynMruList.Create;

  //make panels font non-bold
  plTree.Options.RightAlignSpacer.FontSettings.Style:= [];
  plClip.Options.RightAlignSpacer.FontSettings.Style:= [];
  plOut.Options.RightAlignSpacer.FontSettings.Style:= [];

  InitMenuItemsList;
  LangManager.ScanForLangFiles(SynDir + 'Lang', '*.lng', False);
  Splitter1.PopupMenu:= PopupSplitter;
  ecOnSavingLexer:= DoSaveStyles;

  ListOut.Align:= alClient;
  ListVal.Align:= alClient;
  TreeFind.Align:= alClient;
  Tree.Align:= alClient;
  ListPLog.Align:= alClient;
  ListTabs.Align:= alClient;

  //init colors
  Move(cDefColors, opTabColors, SizeOf(opTabColors));

  //init plugins
  FillChar(FPlugins, Sizeof(FPlugins), 0);
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
  FPageControl:= PageControl1;
  FSplitter:= 50.0;
  FListNewDocs:= TTntStringList.Create;
  FListFiles:= TTntStringList.Create;

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

  TabSwitcher:= TTabSwitcher.Create(0);
  TabSwitcher2:= TTabSwitcher.Create(1);
  TabSwitcher.OnGetTab:= GetTabName;
  TabSwitcher2.OnGetTab:= GetTabName;

  FFullScr:= false;
  FOnTop:= false;
  FLockUpdate:= false;
  FPagesNTab:= -1;
  FPagesNTabCtx:= -1;
  FToolbarMoved:= false;
  FNeedRepaint:= true;
  FEnableRepaint:= false;
  FUpdatePluginsLang:= false;

  //ACP
  slACPdisp:= TStringList.Create;
  slACPitem:= TStringList.Create;
  slACPHint:= TStringList.Create;
  slACPdesc:= TStringList.Create;
  slINTatr:= TStringList.Create;
  slINTcss:= TStringList.Create;

  //finder
  FinderPro:= nil;
  FinderInTree:= nil;
  FinderInList:= nil;
  Finder:= TSynFindReplace.Create(Self);
  Finder.OnBeforeExecute:= FinderInit;
  Finder.OnNotFound:= FinderFail;
  Finder.SkipInit:= False;
  Finder.OnProgress:= FinderProgress;

  //clear actions hints Delphi7 bug
  for i:= 0 to ActionList.ActionCount - 1 do
    (ActionList.Actions[i] as TCustomAction).ShortCut:= 0;

  //new cursor for editor's gutter: 1
  Cur:= LoadCursor(HInstance, 'GCURSOR');
  if Cur>0 then
    Screen.Cursors[1]:= Cur;

  //others
  FUserToolbarCommands:= TTntStringList.Create;  
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
      if tf <> TextSource.Lines.TextFormat then
      begin
        TextSource.Lines.TextFormat:= tf;
        if AManual then
        begin
          Modified:= true;
          LineEndsChg:= true;
        end;
        UpdateStatusbarLineEnds;
      end;
end;

procedure TfmMain.UpdateStatusbarLineEnds;
begin
  case CurrentFrame.TextSource.Lines.TextFormat of
    tfCR: StatusItemEnds.Caption:= 'Mac';
    tfNL: StatusItemEnds.Caption:= 'Unix';
    else StatusItemEnds.Caption:= 'Win';
  end;
end;

function TfmMain.GetAcpFN(const LexerName: string): string;
begin
  Result:= LexerName;
  SReplaceAll(Result, '/', '_'); //for 'PL/SQL'
  SDeleteFrom(Result, ' ('); //for 'Ada (.ads)', 'PHP (dev)'
  Result:= SynDir + 'HL\' + Result + '.acp';
end;

function TfmMain.GetHtmlAcpFN: string;
begin
  Result:= GetAcpFN('Htm');
end;

procedure TfmMain.RefreshACP(const Lexer: string);
var
  fn: Widestring;
begin
  FLexerACP:= Lexer;
  if not Assigned(slACPdisp) then Exit;
  slACPdisp.Clear;
  slACPitem.Clear;
  slACPHint.Clear;
  slACPdesc.Clear;
  slINTatr.Clear;
  slINTcss.Clear;

  ecACP.Tag:= 0; //not loaded any list
  ecACP.Items.Clear;
  ecACP.DisplayItems.Clear;

  if Lexer='' then Exit;

  //read special HTML/CSS ACP
  fn:= GetHtmlAcpFN;
  if IsFileExist(fn) then
    if (IsLexerHTML(Lexer) and opAcpHtm) or
       (IsLexerCSS(Lexer, false) and opAcpCss) then
  begin
    SReadFileIntoSomeLists(fn,
      '[HTML]', '[CSS]',
      slINTatr, slINTcss);
  end;

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
var
  acp: TStringList;
  i, a, b, c: Integer;
  s, tmp: string;
  IsPas, IsBracketSep: boolean;
begin
  IsPas:= IsLexerPas(Lexer);
  IsBracketSep:= true;

  acp:= TStringList.Create;
  try
    acp.LoadFromFile(fn);
    if acp.Count>0 then
    for i:=0 to acp.Count-1 do
    begin
      s:= acp[i];
      if Trim(s)='' then Continue;
      if s[1]='#' then
      begin
        a:= Pos(' ',s);
        if a=0 then Continue;
        if Copy(s,1,a-1)='#chars' then
        begin
          opAcpChars:= Copy(s, a+1, MaxInt);
          IsBracketSep:= Pos('(', opAcpChars)=0;
        end;
        Continue;
      end;

      //parse ACP
      a:= PosEx(' ',s,1);
      b:= PosEx(' ',s,a+1);
      if b=0 then b:= Length(s)+1;
      if IsBracketSep then
        c:= PosEx('(',s,a+1)
      else
        c:= 0;
      //item has '('
      if IsBracketSep and (c<b) and (c<>0) then
      begin
        b:=c;
        c:=PosEx(')',s,b+1);
        if (b+1=c) then tmp:='void'
        else tmp:='( '+copy(s,b+1,c-b-1)+' )';
        if IsPas then
          tmp:=StringReplace(tmp, ';', ',', [rfReplaceAll]);
        tmp:=StringReplace(tmp, '[,', ',[', [rfReplaceAll]);
        slACPHint.Add(tmp);
      end
      else
      begin
        slACPHint.Add('');
      end;
      s:=Copy(acp[i],a+1,b-a-1);

      //strip type for Pascal funcs
      if IsPas then
        SDeleteFrom(s, ':');
      //insert text with "(" if params not empty
      if Pos('(', acp[i])>0 then
        s:= s+'(';
      slACPitem.Add(s);

      c:=PosEx('|',acp[i],b);
      if c=0 then c:= MaxInt div 2;
      slACPdisp.Add('\s1\'+
        copy(acp[i],1,a-1) + '\t\\s2\' +
        copy(acp[i],a+1,b-a-1) + '\t\\s0\' +
        copy(acp[i],b,c-b) + '\s3\ '+
        copy(acp[i],c+1,100) );
      slACPdesc.Add(copy(acp[i],c+1,MaxInt));
    end;
  finally
    FreeAndNil(acp);
  end;
end;

procedure TfmMain.FormDestroy(Sender: TObject);
begin
  FreeAndNil(SynMruFiles);
  FreeAndNil(SynMruSessions);
  FreeAndNil(SynMruNewdoc);

  FreeAndNil(FUserToolbarCommands);

  FreeAndNil(TabSwitcher2);
  FreeAndNil(TabSwitcher);

  FreeAndNil(slACPdisp);
  FreeAndNil(slACPitem);
  FreeAndNil(slACPHint);
  FreeAndNil(slACPdesc);
  FreeAndNil(slINTatr);
  FreeAndNil(slINTcss);

  FreeAndNil(Finder);
  FreeAndNil(FListFiles);
  FreeAndNil(FListNewDocs);

  if Assigned(FListCommentStyles) then
    FreeAndNil(FListCommentStyles);
  if Assigned(FListStringStyles) then
    FreeAndNil(FListStringStyles);
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
    for i:= 0 to slACPitem.Count-1 do
    begin
      S:= LowerCase(slACPitem[i]);
      S:= SAcpItemToId(S);
      if SText=S then
        if slACPHint[i]<>'' then
          ParamCompletion.Items.Add(slACPHint[i]);
    end;
  end;
end;

procedure TfmMain.SynGetTokenHint(Sender: TObject; TokenIndex: Integer; var HintText: String);
var
  p, p1: TPoint;
  i, n: integer;
  e: TSyntaxMemo;
  Frame: TEditorFrame;
  s, sFilename, sResult: ecString;
  NColor1, NColor2: TColor;
begin
  if not opTipsToken then
    begin HintText:= ''; Exit end;

  e:= Sender as TSyntaxMemo;
  Frame:= FrameOfEditor(e);
  sFileName:= Frame.FileName;

  if e.SyntObj<>nil then
    with e.SyntObj do
    begin
      s:= TagStr[TokenIndex];

      if IsImageHint(s, sFileName, sResult) then
      begin
        HintText:= sResult;
        SetHint(sResult);
        Exit
      end;

      if IsShowColor(s, NColor1, NColor2) then
      begin
        HintText:= cColorPrefix + IntToStr(NColor1) + IfThen(NColor2<>clNone, ','+IntToStr(NColor2));
        Exit
      end;
    end;

  //test mouse over editor
  p:= e.ClientToScreen(e.BoundsRect.TopLeft);
  p1:= e.ClientToScreen(e.BoundsRect.BottomRight);
  if (Mouse.CursorPos.X<p.x) or (Mouse.CursorPos.y<p.Y) or
     (Mouse.CursorPos.X>p1.x) or (Mouse.CursorPos.y>p1.Y) then
    begin
      HintText:= '';
      Exit;
    end;

  try
    if e.SyntObj<>nil then
    with e.SyntObj do
    begin
      s:= TagStr[TokenIndex];

      //add lefter tokens
      //(needed for complex id.id.id, e.g. for C#)
      i:= TokenIndex;
      while (i-2>=0) do
      begin
        if not ((TagStr[i-1]='.') and (Pos('.', opAcpChars)>0)) then
          Break;
        Insert(TagStr[i-2]+TagStr[i-1], s, 1);
        Dec(i, 2);
      end;

      //add righter tokens
      i:= TokenIndex;
      while (i+2<=TagCount-1) do
      begin
        if not ((TagStr[i+1]='.') and (Pos('.', opAcpChars)>0)) then
          Break;
        s:= s+TagStr[i+1]+TagStr[i+2];
        Inc(i, 2);
      end;

      //show for strings their ACP hint/description
      n:= -1;
      for i:= 0 to slACPitem.Count-1 do
        if SAcpItemToId(slACPitem[i]) = s then
          begin n:= i; Break; end;

      if n>=0 then
        if slACPHint[n]<>'' then
          HintText:= Trim(
            '\s4\'+SAcpItemToId(slACPitem[n])+' '+
            '\s5\'+slACPHint[n]+sLineBreak+
            '\s6\'+slACPdesc[n]);
     end;
  except
    on E: Exception do
    begin
      HintText:= '';
      SetHint('Exception on reading hint: '+E.Message);
    end;
  end;
end;

procedure TfmMain.ecACPAfterComplete(Sender: TObject;
  const Item: WideString);
//var
//  n: integer;
begin
 //Closing tag
 if FTagClosing then
   with CurrentEditor do
     InsertText('>')
 else
 //handle Ctrl+Enter pressing in ACP list
 if FTagList and (KeyboardStateToShiftState=[ssCtrl]) then
   with CurrentEditor do
     if (TextLength>0) and (CaretStrPos>=1) and (Lines.FText[CaretStrPos]=' ') then
     begin
       CaretStrPos:= CaretStrPos-1;
       DeleteText(1);
       InsertText('>');
       ecACP.Tag:= 1;
     end;

 if ecACP.Tag=2 then
   DoACP //ACP again
 else
   DoACPHint; //func hint
end;

function _IsWordChar(ch: WideChar): boolean;
begin
  Result:= IsWordChar(ch) or (Pos(ch, '-.') > 0);
end;

procedure TfmMain.DoAcpCss(List, Display: ecUnicode.TWideStrings);
var
  i,j,sx:Integer;
  t,ins: string;
begin
  opAcpChars:= cAcpCharsCss;
  with CurrentEditor do
  begin
      FTagCss:= true;
      //is there any property?
      i:=CaretStrPos;
      t:='';
      while (i>0) and (i<=TextLength) do begin
        case Lines.FText[i] of
          ';','{','}','>','=': Break;
          ':': begin
                 j:=i-1;
                 while(j>0)and _IsWordChar(text[j]) do dec(j);
                 if (j>0)and((i-j)>0)then t:=copy(text,j+1,i-j);
                 break;
               end;
        end;
        dec(i);
      end;
      //property found
      if t<>'' then begin
        i:=slINTcss.IndexOfName(t);
        if i>=0 then begin
          sx:=pos('=',slINTcss[i]);
          while sx<length(slINTcss[i]) do begin
            inc(sx);
            j:=PosEx(',',slINTcss[i],sx);
            if j=0 then j:=length(slINTcss[i])+1;
            ins:=copy(slINTcss[i],sx,j-sx);
            //color
            if ins='color' then begin
              ins:='#000000';
              Display.Add('\s1\color\t\\s2\#000000');
            end
            else Display.Add('\s1\css\t\\s2\'+copy(slINTcss[i],sx,j-sx));
            List.Add(ins);
            sx:=j;
          end
        end
      end
      //property not found
      else begin
        for i:=0 to slINTcss.Count-1 do begin
          j:=pos('=',slINTcss[i]);
          if j=0 then Continue;
          List.Add(copy(slINTcss[i],1,j-1)+' ' );
          Display.Add('\s1\css\t\\s2\'+copy(slINTcss[i],1,j-2) );
        end
      end;

      ecACP.Tag:=2;
      Exit;
    end;//CSS
end;

procedure TfmMain.DoAcpHtm(List, Display: ecUnicode.TWideStrings);
var
  t, atr: string;
  i,sx,j,k,a: integer;
  AddBr: boolean;
begin
    GetTag(t,atr); //get tag/attr

    //CSS
    if (atr='style') then
    begin
      DoAcpCss(List, Display);
      Exit
    end;

    //search tag attributes
    if t<>'' then begin
      i:=slINTatr.IndexOfName(t);
      if i>=0 then
      //attrib names needed
      if atr='' then begin
        sx:=pos('=',slINTatr[i]);
        while sx<length(slINTatr[i]) do begin
          inc(sx);
          a:=PosEx(',',slINTatr[i],sx);
          if a=0 then a:=length(slINTatr[i])+1;
          k:=PosEx(':',slINTatr[i],sx);
          if (k<>0)and(k<a)then j:=k
          else j:=a;
          List.Add( copy(slINTatr[i],sx,j-sx)+'="' ); //HTML quote
          Display.Add( '\s1\attrib\t\\s2\'+copy(slINTatr[i],sx,j-sx) );
          sx:=a;
        end;
        ecACP.Tag:=2;
        Exit;
      end
      //attrib params needed
      else begin
        j:=pos('='+atr+':',slINTatr[i]);
        k:=pos(','+atr+':',slINTatr[i]);
        if (j=0)and(k=0) then exit
        else if k<>0 then j:=k;
        j:=PosEx(':',slINTatr[i],j+1);
        //color
        if posex('color',slINTatr[i],j)=j+1 then begin
          List.Add( '#000000' );
          Display.Add('\s1\color\t\\s2\#000000');
          exit;
        end
        // {var1|var2}
        else if slINTatr[i][j+1]<>'{' then exit;
        inc(j);
        k:=PosEx('}',slINTatr[i],j);
        t:=copy(slINTatr[i],j+1,k-j-1);
        sx:=0;
        while sx<length(t) do begin
        inc(sx);
          j:=posex('|',t,sx);
          if j=0 then j:=length(t)+1;
          List.Add( copy(t,sx,j-sx) );
          Display.Add( '\s1\value\t\\s2\'+copy(t,sx,j-sx) );
          sx:=j;
        end;
        ecACP.Tag:=3;
        exit;
      end;
    end

    //search tag names
    else begin
      with CurrentEditor do
        if TextLength>0 then
        begin
          i:=CaretStrPos;
          while (i>0) and (i<=TextLength) and
            IsWordChar(Lines.FText[i]) do Dec(i);
          FTagClosing:=(i>0) and (i<=TextLength) and (Lines.FText[i]='/');
        end;
      if FTagClosing then begin
        //closing tag
        for i:=0 to slINTatr.Count-1 do begin
          j:=pos('=',slINTatr[i]);
          if j=0 then Continue;
          List.Add(copy(slINTatr[i],1,j-1));
          Display.Add( '\s1\tag\t\\s2\</'+
            copy(slINTatr[i],1,j-1)+'>' );
        end;
        ecACP.Tag:=3;
        FTagList:= true;
      end
      else
      begin
        //opening tag
        AddBr:= false;
        for i:=0 to slINTatr.Count-1 do
        begin
          j:=pos('=',slINTatr[i]);
          if j=0 then continue;
          if AddBr then List.Add( '<'+copy(slINTatr[i],1,j-1)+' ' )
                       else List.Add( copy(slINTatr[i],1,j-1)+' ' );
          Display.Add( '\s1\tag\t\\s2\<'+
            copy(slINTatr[i],1,j-1)+'>' );
        end;
        ecACP.Tag:=2;
        FTagList:= true;
        Exit;
      end;
    end
end;

procedure TfmMain.ecACPGetAutoCompleteList(Sender: TObject; PosX: TPoint;
  List, Display: ecUnicode.TWideStrings);
var
  Lexer: string;
begin
  {ecACP.Tag:
  0: not loaded any list
  1: list from .acp file
  2,3: internal Html list (recalc each time for CursorPos)
  3: don't show ACP again after success
  }

  List.Clear;
  Display.Clear;

  FTagList:= false;
  FTagCss:= false;
  FTagClosing:= false;
  Lexer:= CurrentLexer;

  if (opAcpHtm and IsLexerHTML(Lexer)) or
     (opAcpCss and IsLexerCSS(Lexer, false)) then
    begin
      if IsLexerCSS(Lexer) then
        DoAcpCss(List, Display)
      else
        DoAcpHtm(List, Display);
      DoAcpFromFile(List, Display);
      Exit
    end;

  ParamCompletion.CloseUp(False); //or Stack overflow

  if slAcpItem.Count>0 then
  begin
    List.Assign(slACPitem);
    Display.Assign(slACPdisp);
    ecACP.Tag:= 1;
  end;

  //get words from file
  DoAcpFromFile(List, Display);
end;

//-------------------------------------------------
procedure TfmMain.GetTag(var tagName, attri: string);
var
 i, j, k: integer;
 s: WideString;
begin
  tagName:= '';
  attri:= '';
  if CurrentEditor.TextLength=0 then Exit;
  i:= 0;
  with CurrentEditor do
  begin
    //if (CaretPos.X-1)>TextLength then exit;
    if TextLength<500 then begin s:= Lines.FText; i:= CaretStrPos; end
    else if CaretStrPos<500 then s:= Copy(Lines.FText, 1, CaretStrPos+1)
    else s:= Copy(Lines.FText, CaretStrPos-500+1, 501);
  end;
  if i=0 then
    i:= Length(s)-1;
  k:=i;

  //get first non whitespace char
  while (i>0) and (s[i]=' ') do dec(i);
  if i=0 then exit;
  //is it attrib?
  if (i>0) and (s[i]<>'=') then while (i>0) do begin
    if (s[i]='>') or (s[i]='<') then break;
    if (s[i]='"') or (s[i]='''') then begin
      if (i>1) and (s[i-1]='=') then
      begin dec(i); break; end
      else
      if (i>1) and (s[i-1]=' ') then begin
        dec(i);
        while (i>1) and (s[i]=' ') do dec(i);
        if (i>0) and (s[i]='=') then break;
      end
      else break;
    end;
    dec(i);
  end;
  if (i>0) and (s[i]='=') then begin
    j:= i-1;
    dec(i);
    while (i>0) and IsWordChar(s[i]) do dec(i);
    attri:= LowerCase( copy(s,i+1,j-i) );
  end;

  //get tag name
  while (i>0) do
  begin
    if (s[i]='>') then exit;
    if (s[i]='<') then
    begin
      j:=i;
      if j=length(s) then exit;
      inc(i);
      while (i<=length(s)) and IsWordChar(s[i]) do inc(i);
      if (i>length(s)) or (i>k) then exit;
      tagName:= LowerCase( copy(s,j+1,i-j-1) );
      exit;
    end;
    dec(i);
  end;
end;

procedure TfmMain.ecACPCheckChar(Sender: TObject; C: Word;
  var IsWord: Boolean);
begin
  IsWord:= IsWord or
    (Pos(Chr(c), '_' + opAcpChars) > 0);
end;

procedure TfmMain.PopupEditorPopup(Sender: TObject);
const
  cMaxNameLen = 20; //max len of filename in popup menu
var
  Ed: TSyntaxMemo;
  s: Widestring;
  nStart, nEnd, nColor: integer;
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
  s:= Ed.SelText;
  if (s<>'') and IsStringRegex(s, cRegexColorCode) then
  begin
    Delete(s, 1, 1);
    TbxItemCtxAddColor.Enabled:= IsHexColorString(s);
    if TbxItemCtxAddColor.Enabled then
      FPopupColor:= Hex2color(s);
  end
  else
  if (s<>'') and IsStringRegex(s, cRegexColorName) then
  begin
    s:= SGetColorNameValue(s);
    TbxItemCtxAddColor.Enabled:= s<>'';
    if TbxItemCtxAddColor.Enabled then
    begin
      Delete(s, 1, 1);
      TbxItemCtxAddColor.Enabled:= IsHexColorString(s);
      if TbxItemCtxAddColor.Enabled then
        FPopupColor:= Hex2color(s);
    end;
  end
  else
  begin
    GetColorRange(nStart, nEnd, nColor);
    TbxItemCtxAddColor.Enabled:= nEnd>nStart;
    FPopupColor:= nColor;
  end;

  //update "Open selection"
  s:= Ed.SelText;
  if (Pos(#13, s)>0) or (Pos(#10, s)>0) or (Pos(#9, s)>0) then
    s:= '';
  if Length(s)>cMaxNameLen then
    s:= Copy(s, 1, cMaxNameLen)+'...';
  TbxItemCtxOpenSel.Caption:= WideFormat(DKLangConstW('opf'), [s]);
  TbxItemCtxOpenSel.Enabled:= s<>'';

  //update External Tools items
  UpdTools;
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
  ATabStop, ATabMode, AWrap, AMargin, ASpacing, AOptFill: string;
begin
  UpdTools;
  fCustomizeHi.Enabled:= SyntaxManager.CurrentLexer<>nil;
  Lexer:= '';

  if SyntaxManager.CurrentLexer<>nil then
  begin
    Lexer:= SyntaxManager.CurrentLexer.LexerName;
    if IsLexerCSS(Lexer) then
      opAcpChars:= cAcpCharsCss;
    RefreshACP(Lexer);
  end
  else
  begin
    RefreshACP('');
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
    if (CurrentFrame<>nil) and (CurrentFrame.TextSource.SyntaxAnalyzer<>nil) then
      StatusItemLexer.Caption:= CurrentFrame.TextSource.SyntaxAnalyzer.LexerName
    else
      StatusItemLexer.Caption:= DKLangConstW('None');
  end;

  //Update ACP regex
  //(special for HTML, auto for others)
  if IsLexerHTML(Lexer) then
    ecACP.StartExpr:= '\<'
  else
  begin
    ecACP.StartExpr:= '';
    (*
    if opAcpNum=0 then
      ecACP.StartExpr:= ''
    else
      ecACP.StartExpr:= Format('[%s]{%d,}',
        [EscapedAcpChars, opAcpNum]);
    *)
  end;

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
        ATabStop, ATabMode, AWrap, AMargin, ASpacing, AOptFill) then
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
end;

procedure TfmMain.DoRepaintTBs;
begin
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

  if Assigned(fmProj) then
    fmProj.TreeProj.Invalidate;
  if Assigned(fmClip) then
    fmClip.ListClip.Invalidate;
  if Assigned(fmClips) then
    fmClips.List.Invalidate;
  DoPluginsRepaint;

  tbTabsLeft.Invalidate;
  tbTabsOut.Invalidate;
  tbTabsRight.Invalidate;
end;

procedure TfmMain.DoRepaintTBs2;
begin
  if Assigned(fmClip) then
    FixDraw(fmClip.ListClip, true);

  if Assigned(fmMap) then
    FixDraw(fmMap.edMap, true);

  FixDraw(Tree);

  if CurrentEditor<>nil then
    FixDraw(CurrentEditor, true);
end;

procedure TfmMain.FormResize(Sender: TObject);
begin
  DoRepaintTBs;
  SyncMapPos;
end;

procedure TfmMain.Panel1Resize(Sender: TObject);
begin
  SetSplitter(FSplitter);
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
    i:= slACPitem.IndexOf(s);
    if (i>=0) and
      (i<slACPHint.Count) and
      (i<slACPdesc.Count) then
      ecACP.ToolHint.Text:= Trim(
        '\s4\' + SAcpItemToId(s) + ' ' +
        '\s5\' + WrapText(slACPHint[i], sLineBreak+'\s5\', sep, 70) + sLineBreak +
        '\s6\' + WrapText(slACPdesc[i], sLineBreak+'\s6\', sep, 65));
  end;
end;

procedure TfmMain.SetEncoding(Sender: TObject);
begin
  if Sender is TSpTbxItem then
    if not (Sender as TSpTbxItem).Checked then
      ChangeEncoding(CurrentFrame, (Sender as TComponent).Tag);
end;

procedure TfmMain.ConvEncoding(Sender: TObject);
begin
  if Sender is TSpTbxItem then
    if not (Sender as TSpTbxItem).Checked then
      ChangeEncoding(CurrentFrame, (Sender as TComponent).Tag, False{ACanReload});
end;

procedure TfmMain.SetCP(Frame: TEditorFrame; enc: Integer);
begin
  if Frame<>nil then
  with Frame do
  begin
    SkipSign:= False;
    case Enc of
    cp__UTF8:
      begin
        TextSource.Lines.CodePage:= 0;
        TextSource.Lines.TextCoding:= tcUTF8;
      end;
    cp__UTF8_noBOM:
      begin
        SkipSign:= True;
        TextSource.Lines.CodePage:= 0;
        TextSource.Lines.TextCoding:= tcUTF8;
      end;
    cp__Unicode:
      begin
        TextSource.Lines.CodePage:= 0;
        TextSource.Lines.TextCoding:= tcUnicode;
      end;
    cp__UnicodeBE:
      begin
        TextSource.Lines.CodePage:= 0;
        TextSource.Lines.TextCoding:= tcSwapUnicode;
      end;
    else
      begin
        TextSource.Lines.TextCoding:= tcANSI;
        TextSource.Lines.CodePage:= Enc;
      end;
    end;
  end;
end;


procedure TfmMain.ChangeEncoding(Frame: TEditorFrame; ATag: Integer;
  ACanReload: boolean = true);
begin
  if Frame<>nil then
  with Frame do
  begin
    SetCP(Frame, ATag);
    UpdateNPrint(EditorMaster);
    UpdateNPrint(EditorSlave);

    if ACanReload and (FileName <> '') then
      if (not Modified) or MsgEncReload then
      begin
        if IsFileWithBOM(FileName) then
          MsgWarn(WideFormat(DKLangConstW('cpBOM'), [WideExtractFileName(FileName)]), Handle);
        Modified:= False;
        TextSource.Lines.SkipSignature:= True;
        DoFileReopen;
        TextSource.Lines.SkipSignature:= False;
       end;

    if not ACanReload then
      EditorSetModified(Frame.EditorMaster);
  end; //with Frame
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
  case TextSource.Lines.TextCoding of
    tcAnsi:
    begin
      case Textsource.Lines.Codepage of
      CP_ACP:
        StatusItemEnc.Caption:= 'ANSI';
      CP_OEMCP:
        StatusItemEnc.Caption:= 'OEM';
      CP_MACCP:
        StatusItemEnc.Caption:= 'Mac';
      else
        StatusItemEnc.Caption:= IntToStr(Textsource.Lines.Codepage);
      end;
    end;
    tcUnicode:
      StatusItemEnc.Caption:= 'UTF-16';
    tcSwapUnicode:
      StatusItemEnc.Caption:= 'UTF-16 BE';
    tcUTF8:
    begin
      if SkipSign then
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
  IsForw, IsRE, IsWrap,
  IsSkipCol: boolean;
  SText: Widestring;
begin
  IsCase:= false;
  IsWords:= false;

  if Assigned(fmSR) then
  begin
    SText:= '';
    IsSel:= fmSR.cbSel.Checked;
    IsForw:= fmSR.bFor.Checked;
    IsRE:= fmSR.cbRE.Checked;
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
  with TIniFile.Create(SynIni) do
  try
    SText:= ReadTCHist;
    IsSel:= false; //ReadBool('Search', 'SelOnly', false); //not saved
    IsForw:= ReadBool('Search', 'Forw', true);
    IsRE:= ReadBool('Search', 'RegExp', false);
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
  if IsRE then Finder.Flags:= Finder.Flags + [ftRegularExpr];
  if AKeepFlags then
  begin
    if IsCase then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if IsWords then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
  end;
  if IsWrap then Finder.Flags:= Finder.Flags + [ftWrapSearch];
  if IsSkipCol then Finder.Flags:= Finder.Flags + [ftSkipCollapsed];
  if not IsRE and IsSpec then
    Finder.FindText:= SDecodeSpecChars(Finder.FindText);
end;


function TfmMain.ReadTCHist: Widestring;
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

procedure TfmMain.FindDialog;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;

  if fmSR=nil then
  begin
    fmSR:= TfmSR.Create(Self);
    with fmSR do
    begin
      SynDir:= Self.SynDir;
      SRHistTC:= opListerTcHistory and not SynExe;
      SRCount:= opSaveSRHist;
      SRIni:= SynIni;
      SRIniS:= SynIni;
      SRProc:= Self.FindActionWrapper;
      OnFocusEditor:= Self.FindFocusEditor;
      cbTokens.Enabled:= SyntaxManager.AnalyzerCount>0;
      LoadIni;

      if not OnTop then
      begin
        //Seems it OK sets OnTop style, only for app
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
    SR_SuggestedSelScope:= SR_SuggestedSelEn and IsMultilineSelection(Ed);

    if (not SR_SuggestedSelScope){careful} then
    begin
      if opSrSuggestSel and (Ed.SelLength>0) then
        SR_SuggestedSel:= Ed.SelText
      else
      if opSrSuggestWord then
        SR_SuggestedSel:= Ed.WordAtPos(Ed.CaretPos);
    end;

    cbSel.Enabled:= SR_SuggestedSelEn;
    cbSel.Checked:= SR_SuggestedSelScope;

    if SR_SuggestedSel<>'' then
      DoCopyToEdit(ed1, cbSpec.Checked, cbRE.Checked, SR_SuggestedSel);
    ed1Change(Self);

    if IsMultiline then
      ActiveControl:= ed1Memo
    else
      ActiveControl:= ed1;
    IsReplace:= ARep;
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
    plTree.Enabled:= En;
    plClip.Enabled:= En;
    plOut.Enabled:= En;

    PageControl1.Enabled:= En;
    PageControl2.Enabled:= En;

    TbxDockTop.Enabled:= En;
    TbxDockLeft.Enabled:= En;
    TbxDockRight.Enabled:= En;
    TbxDockBottom.Enabled:= En;
    Menu.Enabled:= En;
    //Status.Enabled:= En;

    if Assigned(fmSR) then
      fmSR.Enabled:= En;
    if Assigned(fmNumConv) then
      fmNumConv.Enabled:= En;

    if En then
      Screen.Cursor:= crDefault
    else
      Screen.Cursor:= crHourGlass;
  end;

  procedure TfmMain.ShowProgress(AMode: TProgressType);
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

  procedure TfmMain.HideProgress;
  begin
    UpdateFormEnabled(true);

    if Assigned(fmProgress) then
    begin
      fmProgress.Hide;
      DoRepaint; //needed anyway, even if controls not resized
    end;
    if Assigned(fmSR) then
    begin
      if fmSR.Enabled and fmSR.Visible and fmSR.CanFocus then
        fmSR.SetFocus;
    end;
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
    ShowProgress;

  try
    FindAction(act);
  finally
    FinderPro:= nil;
    FinderProNum:= 0;
    HideProgress;
  end;

  //record find action in macro
  if Assigned(fmSR) then
    DoRecordToMacro(
      sm_FindCommand,
      PWChar(WriteFindOptions(act, fmSR.TextOptions, fmSR.Text1, fmSR.Text2)));

  //extend selection
  if act in [arFindNext] then
  if Assigned(fmSR) and fmSR.cbExtSel.Checked then
    DoExtendSelection(Ed,
      oldStart, oldLength,
      Ed.SelStart, Ed.SelLength);
end;

procedure TfmMain.FindAction(act: TSRAction);
var
  S, Sfiles: Widestring;
  n, nf: Integer;
  Ok, OkSel: boolean;
  Sel: TSynSelSave;
  OldScrollPosY: integer;
begin
  with fmSR do
  begin
    if Text1='' then
      begin MsgBeep(true); Exit end;

    Finder.Flags:= [];
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if cbWords.Checked then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
    if cbRE.Checked then Finder.Flags:= Finder.Flags + [ftRegularExpr];
    if cbSel.Checked then Finder.Flags:= Finder.Flags + [ftSelectedText];
    if not cbFromCur.Checked then Finder.Flags:= Finder.Flags + [ftEntireScope];
    if bBack.Checked then Finder.Flags:= Finder.Flags + [ftBackward];
    if cbCfm.Checked then Finder.Flags:= Finder.Flags + [ftPromtOnReplace];
    if cbWrap.Checked then Finder.Flags:= Finder.Flags + [ftWrapSearch];
    if cbSkipCol.Checked then Finder.Flags:= Finder.Flags + [ftSkipCollapsed];

    Finder.Tokens:= TSearchTokens(cbTokens.ItemIndex);
    Finder.FindText:= Text1;
    Finder.ReplaceText:= Text2;
    if cbSpec.Checked then
    begin
      Finder.FindText:= SDecodeSpecChars(Finder.FindText);
      Finder.ReplaceText:= SDecodeSpecChars(Finder.ReplaceText);
    end;
  end;

  Finder.OnCanAccept:= FinderCanAccept;

  case act of
    arFindNext:
      begin
        Finder.FindAgain;
        Ok:= Finder.Matches>0;
        fmSR.ShowError(not Ok);
        if Ok then
          DoCheckDialogOverlapsCaret(Finder.Control, fmSR);
      end;
    //
    arReplaceNext,
    arSkip:
      begin
        Finder.Flags:= Finder.Flags-[ftPromtOnReplace];

        //move to sel start
        if (CurrentEditor.SelLength>0) then
          DoFixReplaceCaret(CurrentEditor);

        //replace only when sel present
        Ok:= (CurrentEditor.SelLength>0) or (Finder.Matches>0);
        if Ok then
          if (act<>arSkip) then
          begin
            //Bug1: RepAgain doesn't replace 1st match if caret
            //already at match and match_len =0 (search for '^')
            Finder.ReplaceAgain;
            CurrentFrame.DoTitleChanged;
          end;

        //sel next match
        Finder.FindAgain;
        //workaround for Bug1
        if (Finder.MatchLen=0) and (not Finder.IsSpecialCase1) then
          with CurrentEditor do
            if CaretStrPos>0 then
              CaretStrPos:= CaretStrPos-1;

        //show msg
        Ok:= Finder.Matches>0;
        fmSR.ShowError(not Ok);
        if Ok and (CurrentEditor.SelLength>0) then
          DoFixReplaceCaret(CurrentEditor);
        if Ok then
          DoCheckDialogOverlapsCaret(Finder.Control, fmSR);
      end;
    //
    arFindAll:
      begin
        CurrentEditor.ResetSearchMarks;
        if fmSR.cbBk.Checked then
          Finder.OnFind:= FinderFindBk
        else
          Finder.OnFind:= nil;
        Finder.FindAll;
        Finder.OnFind:= nil;
        fmSR.ShowError(Finder.Matches=0);
        UpdateStatusbar; //needed as Bkmk appear
        UpdateMicroMap(CurrentFrame);
      end;
    //
    arCount:
      begin
        Finder.CountAll;
        fmSR.ShowError(Finder.Matches=0);
      end;
    //
    arFindInTabs:
      begin
        DoFindInTabs;
      end;
    //
    arReplaceAll:
      begin
        Ok:= ftPromtOnReplace in Finder.Flags;
        OkSel:= ftSelectedText in Finder.Flags;
        if Ok then
          begin fmSR.Hide; s:= fmSR.Text1; end;
        if OkSel then
          DoSaveSel(CurrentEditor, Sel);
        OldScrollPosY:= CurrentEditor.ScrollPosY;
        //
        Finder.ReplaceAll;
        if Finder.Matches>0 then
          CurrentFrame.DoTitleChanged;
        //
        CurrentEditor.ScrollPosY:= OldScrollPosY;
        if OkSel then
          DoRestoreSel(CurrentEditor, Sel);
        fmSR.ShowError(Finder.Matches=0);
        if Ok then
        begin
          fmSR.Show;
          fmSR.Text1:= s;
        end;
      end;
    //
    arReplaceAllInAll:
      if FrameAllCount<2 then
        MsgWarn(DKLangConstW('fnMul'), Handle)
      else
      begin
        ReplaceInAllTabs(n, nf);
        Finder.Matches:= n;
        fmSR.ShowError(Finder.Matches=0);
        Sfiles:= WideFormat(DKLangConstW('fn_f'), [nf]);
      end;
    end;

  Finder.OnCanAccept:= nil;
  if Finder.Matches > 0 then
  begin
    S:= WideFormat(DKLangConstW('Found'), [Finder.Matches]) + ' ' + Sfiles;
    SetHint(S);
    if act in [arCount, arFindAll, arReplaceAll, arReplaceAllInAll] then
      fmSR.ShowStatus(S);
  end;
end;

//1- Plugin doesnt handle some keys
//2- QS focused doesnt handle keys
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

  //Ctrl+BkSp may produce #127 char
  ////if (Key = vk_back) and (Shift=[ssCtrl]) then begin Key:= 0; MsgBeep); Exit; end;

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
        //0: do nothing, 1: close app, 2: close tab,
        //3: close tab or app, 4: minimize app
        case opEsc of
          1: fExit.Execute;
          2: fClose.Execute;
          3: begin
               if FrameAllCount=1 then
                 fExit.Execute
               else
                 fClose.Execute;
             end;
          4: begin
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
          PostMessage(Handle, WM_user+1, Command, 0);
          Key:= 0;
          Exit
        end;

  //Handle tools
  for i:= Low(opTools) to High(opTools) do
   with opTools[i] do
    with CurrentFrame.TextSource do
     if (ToolCaption<>'') and (ToolCommand<>'') and (S=ToolKeys) and
      ((ToolLexer='') or
       ((SyntaxAnalyzer<>nil) and (ToolLexer=SyntaxAnalyzer.LexerName))) then
    begin
      RunTool(i);
      Key:= 0;
      Exit
    end;
end;

procedure TfmMain.TBXItemAbClick(Sender: TObject);
begin
  {
  TestApi;
  Exit;
  }
  
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
var p: integer;
begin
  with CurrentEditor do begin
    p:= TopLine;
    WordWrap:= not WordWrap;
    TopLine:= p;
    if not WordWrap then
      ExecCommand(smScrollAbsLeft);
  end;

  TemplateEditor.WordWrap:= CurrentEditor.WordWrap;
  PostMessage(hLister, WM_COMMAND, MAKELONG(Ord(CurrentEditor.WordWrap), itm_wrap), Handle);
  UpdateStatusbar;
end;

procedure TfmMain.ecLineNumsExecute(Sender: TObject);
begin
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
  with CurrentFrame do begin
    EditorMaster.DisableFolding:= not EditorMaster.DisableFolding;
    EditorSlave.DisableFolding:= EditorMaster.DisableFolding;
    TemplateEditor.DisableFolding:= EditorMaster.DisableFolding;
  end;
  UpdateGutter(CurrentFrame);
  UpdateStatusbar;
end;

procedure TfmMain.ecNonPrintExecute(Sender: TObject);
begin
  with CurrentEditor do
    NonPrinted.Visible:= not NonPrinted.Visible;
  //TemplateEditor.NonPrinted.Visible:= CurrentEditor.NonPrinted.Visible;
  UpdateStatusbar;
end;

procedure TfmMain.fRereadExecute(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F.FileName='' then
    begin MsgBeep; Exit end;

  if not IsFileExist(F.FileName) then
  begin
    MsgNoFile(F.FileName);
    Exit
  end;

  DoFileReopen;
  UpdateEnc(F); //calls DoFileReopen

  F.EditorMaster.Lines.ResetLineStates;
  F.EditorSlave.Lines.ResetLineStates;

  F.EditorMaster.ResetSearchMarks;
  F.EditorSlave.ResetSearchMarks;
  UpdateMicroMap(F);
end;

procedure TfmMain.DoFileReopen;
var
  p: integer;
begin
  if CurrentFrame <> nil then
    with CurrentFrame do
      if FileName <> '' then
      begin
        if Modified then
          case PromtToSave(CurrentFrame, False, True) of
            mrCancel: Exit;
            mrYes: if not SaveFrame(CurrentFrame, False) then Exit;
          end;
        p:= CurrentEditor.TopLine;
        TextSource.Lines.LoadFromFile(FileName);
        CurrentEditor.TopLine:= p;

        Modified:= False;
        DoTitleChanged;
        UpdateStatusbar;
      end;
end;

procedure TfmMain.TBXItemClrClick(Sender: TObject);
begin
  DeleteFile(PChar(SynStateIni));
  SynMruFiles.Items.Clear;
  with TIniFile.Create(SynIni) do
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
  if opMenuIcon then
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
    UpdateMicroMap(CurrentFrame);
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
    DoACP;
end;

procedure TfmMain.DoACP;
begin
  PostMessage(Handle, WM_USER + 1, 650{ecACP.CommandID}, 0);
end;

procedure TfmMain.DoACPHint;
begin
  PostMessage(Handle, WM_USER + 1, 652{ParamCompletion.CommandID}, 0);
end;

procedure TfmMain.ecACPListClick;
begin
  ecACP.CloseUp(True); //2nd click appears, 2 ids inserted
end;

procedure TfmMain.ecACPListKeyDown;
//var d: integer;
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

procedure TfmMain.fNewExecute(Sender: TObject);
begin
  CreateFrame;
  UpdateCur(CurrentEditor);
  UpdateZoom(CurrentFrame);
  UpdateColorHint;
end;

procedure TfmMain.SetHint(const S: WideString);
begin
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
begin
  Action:= caFree;
  AskClose;
  UpdateRecentsOnClose;

  //save ini
  if not QuickView then
  try
    SaveIni2;
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
  ClearTreeFind;
  //close plugins
  DoClosePlugins;
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
      AskClose(not QuickView) and
      AskSession(true, true);
end;

procedure TfmMain.WM1(var m: TMessage);
begin
  if CurrentEditor <> nil then
    CurrentEditor.ExecCommand(m.wParam);
end;

procedure TfmMain.bBk0Click(Sender: TObject);
var
  s: string;
  N: integer;
begin
  s:= (Sender as TSpTbxItem).Caption;
  N:= StrToInt(s[1]);
  CurrentEditor.ExecCommand(smGotoBookmark0 + N);
  CenterMemoPos(CurrentEditor, true{GotoMode});
end;

procedure TfmMain.TBXSubmenuItem3Popup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateBookmk;
end;

  function TfmMain.BookmarkDesc(i: integer;
    ALenLimit: integer;
    AShowLineNum, AShowNumberedChar: boolean): WideString;
  var
    NLine: integer;
    SMark: string;
  begin
    Result:= '';
    NLine:= 0;
    if (i<=9) and AShowNumberedChar then SMark:= '*' else SMark:= '';
    with CurrentEditor do
      if Bookmarks[i]<>-1 then
      begin
        NLine:= StrPosToCaretPos(Bookmarks[i]).Y;
        Result:= Lines[NLine];
      end;

    SReplaceAllW(Result, #9, CurrentTabExpansion(CurrentEditor));

    if Length(Result)>ALenLimit then
      Result:= Copy(Result, 1, ALenLimit) + '...';

    if AShowLineNum then
      Result:= WideFormat('%d%s: %s', [NLine+1, SMark, Result])
    else
      Result:= WideFormat('%d: %s', [i, Result]);
  end;

procedure TfmMain.UpdateBookmk;
begin
  with CurrentEditor do
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

    TbxItemB0.Caption:= BookmarkDesc(0);
    TbxItemB1.Caption:= BookmarkDesc(1);
    TbxItemB2.Caption:= BookmarkDesc(2);
    TbxItemB3.Caption:= BookmarkDesc(3);
    TbxItemB4.Caption:= BookmarkDesc(4);
    TbxItemB5.Caption:= BookmarkDesc(5);
    TbxItemB6.Caption:= BookmarkDesc(6);
    TbxItemB7.Caption:= BookmarkDesc(7);
    TbxItemB8.Caption:= BookmarkDesc(8);
    TbxItemB9.Caption:= BookmarkDesc(9);

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
  CurrentEditor.ExecCommand(smSetBookmark0 +
    StrToInt((Sender as TSpTbxItem).Caption));
end;

procedure TfmMain.TBXSubmenuItem8Popup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateBookmk;
end;

procedure WndCenter(h: THandle; fm: TCustomForm);
var r: TRect;
begin
  GetWindowRect(h, r);
  SetWindowPos(h, 0,
    fm.Monitor.Left + (fm.Monitor.Width - (r.Right - r.Left)) div 2,
    fm.Monitor.Top + (fm.Monitor.Height - (r.Bottom - r.Top)) div 2,
    0, 0, SWP_NOSIZE);
end;


procedure TfmMain.ODShow(Sender: TObject);
begin
  WndCenter(OD.Handle, Self);
end;

procedure TfmMain.SDShow(Sender: TObject);
begin
  WndCenter(SD.Handle, Self);
end;

procedure TfmMain.fNewWinExecute(Sender: TObject);
begin
  if SynExe then
    FExecute(Application.ExeName, '', '', 0);
end;

procedure TfmMain.TBXItemFExitClick(Sender: TObject);
begin
  if CloseAll(True, False) then
    fExit.Execute;
end;

procedure TfmMain.ecSelCharPopup1Change(Sender: TObject);
begin
  with ecSelCharPopup1 do
    ToolHint.Text:= WideFormat(DKLangConstW('MSel'),
      [Byte(SelChar), Byte(SelChar)]);
end;

procedure TfmMain.ecSelCharPopup1Show(Sender: TObject);
var
  ch: WideChar;
  s: string;
begin
  with ecSelCharPopup1 do begin
    Font:= CurrentEditor.Font;
    if CurrentEditor.TextLength>0 then
      if CurrentEditor.Lines.TextCoding=tcAnsi then
      begin
        ch:= CurrentEditor.Lines.FText[CurrentEditor.CaretStrPos+1];
        s:= UnicodeToAnsiCP(ch, CurrentFrame.TextSource.Lines.Codepage);
        if s<>'' then SelChar:= s[1];
      end
      else
      begin
        ch:= CurrentEditor.Lines.FText[CurrentEditor.CaretStrPos+1];
        SelChar:= Char(ch);
      end;
  end;
end;

procedure TfmMain.ecACPShow(Sender: TObject);
var
  i: integer;
  ch: ecChar;
begin
  //if only single item matches the text, then insert this item w/o dialog
  if opAcpUseSingle then
    with ecACP do
      if ListBox.Items.Count=1 then
      begin
        CloseUp(true);
        Exit
      end;

  //HTML: insert "<" char, except cases:
  //we are at "<", we are at middle of a tag
  if FTagList then
    with CurrentEditor do
    begin
      //FBrAdd must be true only when
      //- TextLength=0
      //- caret on space/tab/EOL
      //- caret prev char is not wordchar, not '<', '/'
      FBrAdd:= true;
      if (TextLength>0) then
      begin
        i:= CaretStrPos;
        if (i<=TextLength) then
        begin
          ch:= Lines.FText[i];
          if IsWordChar(ch) or (ch='<') or (ch='/')
            or (ch=' ') {fix for unneeded "<" at text end} then
            FBrAdd:= false;
          //else
          //  MsgError(WideFormat('%d %d %d', [i, TextLength, Ord(ch)])); ////
        end;
        if (i+1<=TextLength) then
        begin
          ch:= Lines.FText[i+1];
          if not ((ch=' ') or (ch=#13) or (ch=#10) or (ch=#9)) then
            FBrAdd:= false;
        end;
      end; //if TextLength>0
      if FBrAdd then
      begin
        InsertText('<');
      end;
    end;

  //Work-around for small problem:
  //when ACP called with caret on ID, this ID replaced then with the chosed ID.
  //Need to insert some char before text ID.
  with CurrentEditor do
    if (CaretStrPos<TextLength) then
      if IsWordChar(Lines.FText[CaretStrPos+1]) then
      begin
        InsertText(' ');
        CaretStrPos:= CaretStrPos-1;
        DoACP;
      end;
end;

procedure TfmMain.UpdateNPrint(E: TSyntaxMemo);
begin
  with E do
    {
    //not needed now
    if (Lines.TextCoding=tcAnsi) and (Lines.Codepage=CP_OEMCP) then
    begin
      NonPrinted.SpaceChar:= '.';
      NonPrinted.TabChar:= '>';
    end
    else
    }
    begin
      NonPrinted.SpaceChar:= #183;
      NonPrinted.TabChar:= #187;
    end;
end;

procedure TfmMain.SaveState_(Sender: TObject);
begin
  SaveState(Sender as TEditorFrame);
end;

procedure TfmMain.fCustomizeLexerExecuteOK(Sender: TObject);
begin
  SyntaxManager.Modified:= True;
  AskLexer(True);
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
  function TfmMain.ShFor(id: integer): TShortcut;
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

  //is shortcut assigned to cmd (1st or 2nd shortcut)
  function TfmMain.IsSh(sh: TShortcut; cmd: integer): boolean;
  var
    c: TecCommandItem;
  begin
    Result:= false;
    if sh=0 then Exit;
    c:= SyntKeyMapping.CommandByID(cmd);
    if Assigned(c) then
      Result:=
        ((c.KeyStrokes.Count>0) and
         (c.KeyStrokes[0].KeyDefs.Count>0) and
         (c.KeyStrokes[0].KeyDefs[0].Shortcut = sh)) or
        ((c.KeyStrokes.Count>1) and
         (c.KeyStrokes[1].KeyDefs.Count>0) and
         (c.KeyStrokes[1].KeyDefs[0].Shortcut = sh));
  end;

  //get macro's shortcut
  procedure TfmMain.ShMacroGet(n: integer; var sh: TShortcut);
  begin
    if n<=9 then
      sh:= ShFor(sm_Macro1+n-1)
    else
      sh:= ShFor(sm_Macro10+n-10)
  end;

  //set marco shortcut
  procedure TfmMain.ShMacroSet(n: integer; const sh: TShortcut);
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

procedure TfmMain.UpdateShortcuts;
  //for main menu items
  procedure K(item: TSpTbxItem; id: integer);
  begin
    item.ShortCut:= ShFor(id);
  end;
  //for popup menu items (this doesn't use Shortcut property)
  procedure K2str(item: TSpTbxItem; const cmd: string);
  var
    S: Widestring;
  begin
    S:= item.Caption;
    SDeleteFromW(S, #9);
    if cmd<>'' then
      S:= S + #9 + cmd;
    item.Caption:= S;
  end;
  procedure K2(item: TSpTbxItem; id: integer);
  begin
    K2str(item, ShortcutToText(ShFor(id)));
  end;
begin
  K(TBXItemONPrintSpaces, sm_ONonPrintSpaces);
  K(TBXItemONPrintEol, sm_ONonPrintEol);
  K(TBXItemONPrintAll, sm_ONonPrintBoth);
  K(TBXItemONPrintEolDetails, sm_ONonPrintEolDetails);

  K(TBXItemEExtractDupCase, sm_ExtractDupsCase);
  K(TBXItemEExtractDupNoCase, sm_ExtractDupsNoCase);
  K(TBXItemEReverse, sm_ReverseLines);
  K(TBXItemEShuffle, sm_ShuffleLines);
  K(TBXItemSSelExtend, sm_SelectionExtend);

  //multi-carets
  K(TbxItemCaretsRemove1, sm_CaretsRemoveLeaveFirst);
  K(TbxItemCaretsRemove2, sm_CaretsRemoveLeaveLast);
  K(TbxItemCaretsFromSelLeft, sm_CaretsFromSelLeft);
  K(TbxItemCaretsFromSelRight, sm_CaretsFromSelRight);
  K(TbxItemCaretsFromSelClear, sm_CaretsFromSelClear);
  K(TbxItemCaretsFromMarksLeft, sm_CaretsFromMarksLeft);
  K(TbxItemCaretsFromMarksRight, sm_CaretsFromMarksRight);
  K(TbxItemCaretsFromMarksClear, sm_CaretsFromMarksClear);
  K(TbxItemCaretsExtUpLine, sm_CaretsExtendUpLine);
  K(TbxItemCaretsExtDownLine, sm_CaretsExtendDownLine);
  K(TbxItemCaretsExtUpPage, sm_CaretsExtendUpPage);
  K(TbxItemCaretsExtDownPage, sm_CaretsExtendDownPage);
  K(TbxItemCaretsExtUpEnd, sm_CaretsExtendUpEnd);
  K(TbxItemCaretsExtDownEnd, sm_CaretsExtendDownEnd);

  //folding
  K(TbxItemFoldAll, smFullCollapse);
  K(TbxItemUnFoldAll, smFullExpand);
  //K(TbxItemUnFoldLine, sm_); //no sm command
  K(TbxItemFoldNearestBlock, smToggleCollapseNearest);
  K(TbxItemFoldSelBlock, smCollapseSelection);
  K(TbxItemFoldRangesInSel, smInSelCollapse);
  K(TbxItemUnFoldRangesInSel, smInSelExpand);

  //win
  K(TbxItemWinTree, sm_ToggleFocusTree);
  K(TbxItemWinClip, sm_ToggleFocusClip);
  K(TbxItemWinClips, sm_ToggleFocusClips);
  K(TbxItemWinOut, sm_ToggleFocusOutput);
  K(TbxItemWinFRes, sm_ToggleFocusFindRes);
  K(TbxItemWinVal, sm_ToggleFocusValidate);
  K(TbxItemWinMap, sm_ToggleFocusMap);
  K(TbxItemWinProj, sm_ToggleFocusProj);
  K(TbxItemWinTabs, sm_ToggleFocusTabs);

  //sort
  K(TBXItemEDedupAll, sm_RemoveDupsAll);
  K(TBXItemEDedupAdjacent, sm_RemoveDupsAdjacent);
  K(TbxItemESortDialog, sm_SortDialog);
  K(tbxItemESortAsc, smSortAscending);
  K(tbxItemESortDesc, smSortDescending);

  //blank ops
  K(TBXItemEAlignWithSep, sm_AlignWithSep);
  K(TbxItemECenterLines, sm_CenterLines);
  K(TbxItemETabToSp, sm_TabToSp);
  K(TbxItemESpToTab, sm_SpToTab);
  K(TBXItemERemDupSp, sm_RemoveDupSp);
  K(TbxItemERemBlanks, sm_RemoveBlanks);
  K(TbxItemEReduceBlanks, sm_ReduceBlanks);
  K(TbxItemETrimLead, sm_TrimLead);
  K(TbxItemETrimTrail, sm_TrimTrail);
  K(TbxItemETrimAll, sm_TrimAll);
  K(TbxItemEIndentLike1st, sm_IndentLike1st);

  K(TbxItemMarkClear, sm_MarkersClear);
  K(TbxItemMarkGoLast, sm_JumpToLastMarker);

  K(TBXItemSGotoFile, sm_ProjectList);
  K(TbxItemECommandList, sm_CommandsList);
  K(TbxItemERepeatCmd, sm_RepeatCmd);
  K(TbxItemSSelToken, sm_SelectToken);

  K(TbxItemTidyVal, sm_TidyValidate);
  K(TbxItemTidyCfg, sm_TidyConfig);

  //macro
  K(TbxItemMacroRepeat, sm_MacroRepeat);
  K(TbxItemMacroRecord, smMacroRecStart);
  K(TbxItemMacroStop, smMacroRecStop);
  K(TbxItemMacroCancel, smMacroRecCancel);
  K(TbxItemMacroPlay, smMacroPlay);
  K(TbxItemMacroDlg, sm_MacroDlg);

  K(TbxItemMacro1, sm_Macro1);
  K(TbxItemMacro2, sm_Macro2);
  K(TbxItemMacro3, sm_Macro3);
  K(TbxItemMacro4, sm_Macro4);
  K(TbxItemMacro5, sm_Macro5);
  K(TbxItemMacro6, sm_Macro6);
  K(TbxItemMacro7, sm_Macro7);
  K(TbxItemMacro8, sm_Macro8);
  K(TbxItemMacro9, sm_Macro9);
  K(TbxItemMacro10, sm_Macro10);
  K(TbxItemMacro11, sm_Macro11);
  K(TbxItemMacro12, sm_Macro12);
  K(TbxItemMacro13, sm_Macro13);
  K(TbxItemMacro14, sm_Macro14);
  K(TbxItemMacro15, sm_Macro15);
  K(TbxItemMacro16, sm_Macro16);
  K(TbxItemMacro17, sm_Macro17);
  K(TbxItemMacro18, sm_Macro18);
  K(TbxItemMacro19, sm_Macro19);
  K(TbxItemMacro20, sm_Macro20);
  K(TbxItemMacro21, sm_Macro21);
  K(TbxItemMacro22, sm_Macro22);
  K(TbxItemMacro23, sm_Macro23);
  K(TbxItemMacro24, sm_Macro24);
  K(TbxItemMacro25, sm_Macro25);
  K(TbxItemMacro26, sm_Macro26);
  K(TbxItemMacro27, sm_Macro27);
  K(TbxItemMacro28, sm_Macro28);
  K(TbxItemMacro29, sm_Macro29);
  K(TbxItemMacro30, sm_Macro30);

  //tabs
  K(TbxItemWin0, sm_Tab0);
  K(TbxItemWin1, sm_Tab1);
  K(TbxItemWin2, sm_Tab2);
  K(TbxItemWin3, sm_Tab3);
  K(TbxItemWin4, sm_Tab4);
  K(TbxItemWin5, sm_Tab5);
  K(TbxItemWin6, sm_Tab6);
  K(TbxItemWin7, sm_Tab7);
  K(TbxItemWin8, sm_Tab8);
  K(TbxItemWin9, sm_Tab9);

  //view
  K(TbxItemVSyncHorz, sm_SyncScrollH);
  K(TbxItemVSyncVert, sm_SyncScrollV);
  K(TbxItemVSpellLive, sm_SpellLive);
  K(TbxItemVSpellCheck, sm_SpellCheck);

  //edit
  K(TbxItemEJoin, sm_JoinLines);
  K(TbxItemESplit, sm_SplitLines);
  K(TbxItemECpFN, sm_CopyFN);
  K(TbxItemECpFullPath, sm_CopyFullPath);
  K(TbxItemECpDirPath, sm_CopyDirPath);
  K(TbxItemEMoveUp, smMoveLinesUp);
  K(TbxItemEMoveDn, smMoveLinesDown);
  K(TbxItemEToggleStreamComment, sm_ToggleStreamComment);
  K(TbxItemEToggleLineComment, sm_ToggleLineComment);
  K(TbxItemEToggleLineCommentAlt, sm_ToggleLineCommentAlt);

  K(TbxItemEZenWrap, sm_ZenWrap);
  K(TbxItemEZenExpand, sm_ZenExpand);

  K(TBXItemEInsText, sm_InsText);
  K(TBXItemEFillBlock, sm_FillBlock);
  K(TBXItemOOnTop, sm_OnTop);
  K(TBXItemOFullScr, sm_FullScr);
  K(TBXItemViewColMarkers, sm_ColumnMarkers);

  K(TBXItemESyncEd, sm_SyncEdit);
  K(TbxItemEExtr, sm_ExStr);
  K(TbxItemETime, sm_DateTime);
  K(TbxItemEColor, sm_InsertColor);
  K(TbxItemEImage, sm_InsertImage);

  K(TBXItemFExit, sm_FExit);
  K(TBXItemFClr, sm_ClrHist);
  K(TbxItemFClose, sm_FClose);
  K(TbxItemFCloseDel, sm_FCloseDel);
  K(TbxItemFCloseAll, sm_FCloseAll);
  K(TbxItemFCloseOth, sm_FCloseOth);
  K(TbxItemFSaveAll, sm_FSaveAll);
  K(TbxItemFRename, sm_FileRename);
  //
  K(TbxItemSResNext, sm_GotoNextFindResult);
  K(TbxItemSResPrev, sm_GotoPrevFindResult);

  K(TBXItemSMarkAll, smFindAll);
  K(tbxItemSMarkNext, smSearchMarkNext);
  K(tbxItemSMarkPrev, smSearchMarkPrev);
  K(tbxItemSMarkClear, smSearchMarkReset);

  K(TBXItemQs, sm_QS);
  K(tbxItemMarkDrop, smDropMarker);
  K(tbxItemMarkColl, smCollectMarker);
  K(tbxItemMarkSwap, smSwapMarker);
  K(tbxItemZIn, sm_ZoomIn);
  K(tbxItemZOut, sm_ZoomOut);
  K(tbxItemZ0, sm_Zoom0);
  //
  K(TbxItemRunPreview, sm_OpenPreview);
  K(TbxItemRunFirefox, sm_OpenFirefox);
  K(TbxItemRunMSIE, sm_OpenMSIE);
  K(TbxItemRunChrome, sm_OpenChrome);
  K(TbxItemRunSafari, sm_OpenSafari);
  K(TbxItemRunOpenFile, sm_OpenCurrentFile);
  K(TbxItemRunOpenDir, sm_OpenCurrentFolder);
  K(TbxItemRunFindPhp, sm_OpenPhp);
  K(TbxItemRunFindGoogle, sm_OpenGoogle);
  K(TbxItemRunFindWiki, sm_OpenWiki);
  K(TbxItemRunFindMSDN, sm_OpenMsdn);
  K(TbxItemRunFindHtml4, sm_OpenHtml4Help);
  K(TbxItemRunFindHtml5, sm_OpenHtml5Help);
  K(TbxItemRunLoremIpsum, sm_LoremIpsum);
  K(TbxItemRunNumConv, sm_NumericConverter);
  K(TbxItemRunEncodeHtml, sm_EncodeHtmlChars);

  //file
  K(tbxItemFPrint, smPrint);
  K(tbxItemFPreview, smPrintPreview);
  K(tbxItemFNew, sm_FNew);
  K(tbxItemFNewWin, sm_FNewWin);
  K(tbxItemFOpen, sm_FOpen);
  K(tbxItemFReopen, sm_FReopen);
  K(tbxItemFSave, sm_FSave);
  K(tbxItemFSaveAs, sm_FSaveAs);
  K(tbxItemFProps, sm_FProps);

  K(tbxItemFavAddFile, sm_FavAddFile);
  K(tbxItemFavAddProj, sm_FavAddProj);
  K(tbxItemFavManage, sm_FavOrganize);

  K(TBXItemFSesOpen, sm_FOpenSession);
  K(TBXItemFSesSave, sm_FSaveSession);
  K(TBXItemFSesSaveAs, sm_FSaveSessionAs);
  K(TBXItemFSesAdd, sm_FAddSession);
  K(TBXItemFSesClose, sm_FCloseSession);

  K(tbxItemFExpHtml, sm_FExpHtml);
  K(tbxItemFExpRtf, sm_FExpRtf);
  K(tbxItemFPageSetup, smPageSetup);
  K(tbxItemFPrinterSetup, sm_PrinterSetup);

  //edit
  K(tbxItemEUndo, smUndo);
  K(tbxItemERedo, smRedo);
  K(tbxItemECut, smCut);
  K(tbxItemECopy, smCopy);
  K(tbxItemEPaste, smPaste);
  K(tbxItemEDelete, smClearSelection);
  K(tbxItemESelectAll, smSelectAll);

  K(tbxItemECopyApp, sm_CopyAppend);
  K(tbxItemECutApp, sm_CutAppend);
  K(tbxItemECopyLine, sm_CopyLine);
  K(tbxItemECutLine, sm_CutLine);

  K(tbxItemEDup, smDuplicateLine);
  K(tbxItemEDelLn, smDeleteLine);
  K(tbxItemETable, smSelCharacter);
  K(tbxItemEComm, smCommentLines);
  K(tbxItemEUncomm, smUncommentLines);
  K(tbxItemEIndent, smBlockIndent);
  K(tbxItemEUnindent, smBlockUnindent);
  K(tbxItemECaseUpper, smUpperCaseBlock);
  K(tbxItemECaseLower, smLowerCaseBlock);
  K(tbxItemECaseTitle, smTitleCaseBlock);
  K(tbxItemECaseInvert, smToggleCaseBlock);
  K(tbxItemECaseSent, smSentCaseBlock);

  //bookmk
  K(tbxItemG0, smSetBookmark0);
  K(tbxItemG1, smSetBookmark1);
  K(tbxItemG2, smSetBookmark2);
  K(tbxItemG3, smSetBookmark3);
  K(tbxItemG4, smSetBookmark4);
  K(tbxItemG5, smSetBookmark5);
  K(tbxItemG6, smSetBookmark6);
  K(tbxItemG7, smSetBookmark7);
  K(tbxItemG8, smSetBookmark8);
  K(tbxItemG9, smSetBookmark9);

  K(tbxItemB0, smGotoBookmark0);
  K(tbxItemB1, smGotoBookmark1);
  K(tbxItemB2, smGotoBookmark2);
  K(tbxItemB3, smGotoBookmark3);
  K(tbxItemB4, smGotoBookmark4);
  K(tbxItemB5, smGotoBookmark5);
  K(tbxItemB6, smGotoBookmark6);
  K(tbxItemB7, smGotoBookmark7);
  K(tbxItemB8, smGotoBookmark8);
  K(tbxItemB9, smGotoBookmark9);

  K(TBXItemBkGotoPortable, sm_GotoPortableBk);
  K(TBXItemBkDropPortable, sm_DropPortableBk);
  K(TbxItemBkGoto, sm_GotoBookmkDialog);
  K(tbxItemBkClear, sm_BkClear);
  K(tbxItemBkToggle, sm_BkToggle);
  K(tbxItemBkNext, sm_BkNext);
  K(tbxItemBkPrev, sm_BkPrev);
  K(tbxItemBkCopy, sm_BkCopy);
  K(tbxItemBkCut, sm_BkCut);
  K(tbxItemBkDel, sm_BkDelete);
  K(tbxItemBkDelUnmk, sm_BkDeleteUnmk);
  K(tbxItemBkPaste, sm_BkPaste);
  K(tbxItemBkInverse, sm_BkInverse);

  //opt
  K(tbxItemOSetup, sm_OSetup);
  K(tbxItemOLexer, sm_OSetupLexer);
  K(tbxItemOLexerLib, sm_OSetupLexerLib);
  //search
  K(tbxItemSRep, smReplaceDialog);
  K(tbxItemSRepFiles, sm_ReplaceInFiles);
  K(tbxItemSFind, smFindDialog);
  K(tbxItemSNext, smFindNext);
  K(tbxItemSPrev, smFindPrev);
  K(tbxItemSWordNext, smFindCurrentWordNext);
  K(tbxItemSWordPrior, smFindCurrentWordPrior);
  K(tbxItemSGoto, smGotoLine);
  K(TBXItemSGoBracket, smChangeRangeSide);
  K(TbxItemSSelBrackets, sm_SelectBrackets);
  //
  K(tbxItemORO, sm_OReadOnly);
  K(tbxItemOTree, sm_OShowTree);
  K(tbxItemOOut, sm_OShowOut);
  K(tbxItemOClip, sm_OShowClip);
  K(tbxItemOFold, sm_OFolding);
  K(tbxItemOWrap, sm_OWrap);
  K(tbxItemONums, sm_OLineNums);
  K(tbxItemONPrint, sm_ONonPrint);
  K(tbxItemORuler, sm_ORuler);

  //=========popup menus
  //main popup
  K2(TbxItemCtxUndo, smUndo);
  K2(TbxItemCtxRedo, smRedo);
  K2(TbxItemCtxCut, smCut);
  K2(TbxItemCtxCopy, smCopy);
  K2(TbxItemCtxPaste, smPaste);
  K2(TbxItemCtxDel, smClearSelection);
  K2(TbxItemCtxSelectAll, smSelectAll);
  K2(TbxItemCtxCustomize, sm_OSetup);
  K2(TbxItemCtxCopyAppend, sm_CopyAppend);
  K2(TbxItemCtxCutAppend, sm_CutAppend);
  K2(TbxItemCtxCopyHTML, sm_CopyAsHTML);
  K2(TbxItemCtxCopyRTF, sm_CopyAsRTF);
  K2(TbxItemCtxPasteNoCurChange, sm_PasteNoCursorChange);
  K2(TBXItemCtxPasteToColumn1, sm_PasteToColumn1);
  K2(TBXItemCtxPasteAsColumn, sm_PasteAsColumnBlock);
  K2(TBXItemCtxPasteBkmkLines, sm_BkPaste);

  //clip popup menu
  K2(TBXItemClipFind, smFindDialog);
  K2str(TBXItemClipCopyToEd, 'Enter');
  K2str(TBXItemClipCopyToClip, 'Ctrl+C');
  K2str(TBXItemClipClr, 'Shift+Delete');

  //clips popup menu
  K2str(TBXItemClipsAddText, 'Insert');
  K2str(TBXItemClipsDelText, 'Shift+Delete');

  //output popup menu
  K2str(TBXItemONav, 'Space');
  K2str(TBXItemOClr, 'Delete');
  K2(TBXItemOFind, smFindDialog);

  //find results popup menu
  K2str(TBXItemTreeFindNav, 'Space');
  K2str(TBXItemTreeFindCopyToClipNode, 'Ctrl+C');
  K2str(TBXItemTreeFindClear, 'Delete');
  K2(TBXItemTreeFindFind, smFindDialog);

  //validate popup menu
  K2str(TBXItemValNav, 'Space');
  //K2str(TBXItemValCp, 'Ctrl+C');
  K2str(TBXItemValClr, 'Delete');
  K2(TBXItemValFind, smFindDialog);

  //tree popup menu
  K2(TBXItemTreeFind, smFindDialog);

  //splitter popup menu
  K2(TBXItemSp20, sm_Split2080);
  K2(TBXItemSp30, sm_Split3070);
  K2(TBXItemSp40, sm_Split4060);
  K2(TBXItemSp50, sm_Split5050);
  K2(TBXItemSp60, sm_Split6040);
  K2(TBXItemSp70, sm_Split7030);
  K2(TBXItemSp80, sm_Split8020);

  //tab popup menu
  K2(TBXItemTbCl, sm_FClose);
  K2(TBXItemTbOth, sm_FCloseOth);
  K2(TBXItemTbNew, sm_FNew);
  K2(TBXItemTbMoveToView, sm_FMoveTab);
  K2(TBXItemTbCpFN, sm_CopyFN);
  K2(TBXItemTbCpFull, sm_CopyFullPath);
  K2(TBXItemTbCpDir, sm_CopyDirPath);
end;

procedure TfmMain.TBXItemHReadClick(Sender: TObject);
begin
  FOpenURL(SynDir + 'Readme', Handle);
end;

procedure TfmMain.TBXItemHHelpClick(Sender: TObject);
begin
  FOpenURL(FHelpFilename(SynDir), Handle);
end;

procedure TfmMain.TBXSubmenuEncPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateCPMenu(TbxSubmenuEnc);
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
  TbxSubmenuItemLexer.LinkSubitems:= PopupLex.Items;
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

  PageControl1.Invalidate;
  PageControl2.Invalidate;
end;

procedure TfmMain.LoadTools;
var i: integer;
  s: Widestring;
begin
  with TIniFile.Create(SynIni) do
  try
    for i:= Low(opTools) to High(opTools) do
    with opTools[i] do begin
      ToolCaption:= UTF8Decode(ReadString('Tool', 'C'+IntToStr(i), ''));
      ToolCommand:= UTF8Decode(ReadString('Tool', 'Ex'+IntToStr(i), ''));
      ToolDir:= UTF8Decode(ReadString('Tool', 'Dir'+IntToStr(i), ''));
      ToolParams:= UTF8Decode(ReadString('Tool', 'Par'+IntToStr(i), ''));
      ToolLexer:= ReadString('Tool', 'Lex'+IntToStr(i), '');
      ToolKeys:= ReadString('Tool', 'Key'+IntToStr(i), '');
      ToolOutRegex:= ReadString('Tool', 'Re'+IntToStr(i), '');
      S:= ReadString('Tool', 'S'+IntToStr(i), '');
      ToolOutCapture:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolOutNum_fn:= StrToIntDef(SGetItem(S), 0);
      ToolOutNum_line:= StrToIntDef(SGetItem(S), 0);
      ToolOutNum_col:= StrToIntDef(SGetItem(S), 0);
      ToolSaveMode:= TSynToolSave(StrToIntDef(SGetItem(S), 0));
      ToolNoTags:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolContextItem:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolOutType:= SGetItem(S);
      if ToolOutType='' then ToolOutType:= cOutputTypeString[outToPanel];
      ToolOutEncoding:= TOutputEnc(StrToIntDef(SGetItem(S), Ord(encOem)));
    end;
  finally
    Free;
  end;
  UpdTools;
end;

procedure TfmMain.ToolEn(T: TSpTbxItem; n: integer; ForCtx: boolean = false);
begin
  if CurrentFrame <> nil then
  with CurrentFrame.TextSource do
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

procedure TfmMain.UpdTools;
begin
  ToolEn(TbxItemT1, 1);
  ToolEn(TbxItemT2, 2);
  ToolEn(TbxItemT3, 3);
  ToolEn(TbxItemT4, 4);
  ToolEn(TbxItemT5, 5);
  ToolEn(TbxItemT6, 6);
  ToolEn(TbxItemT7, 7);
  ToolEn(TbxItemT8, 8);
  ToolEn(TbxItemT9, 9);
  ToolEn(TbxItemT10, 10);
  ToolEn(TbxItemT11, 11);
  ToolEn(TbxItemT12, 12);

  ToolEn(TbxItemCC1, 1, true);
  ToolEn(TbxItemCC2, 2, true);
  ToolEn(TbxItemCC3, 3, true);
  ToolEn(TbxItemCC4, 4, true);
  ToolEn(TbxItemCC5, 5, true);
  ToolEn(TbxItemCC6, 6, true);
  ToolEn(TbxItemCC7, 7, true);
  ToolEn(TbxItemCC8, 8, true);
  ToolEn(TbxItemCC9, 9, true);
  ToolEn(TbxItemCC10, 10, true);
  ToolEn(TbxItemCC11, 11, true);
  ToolEn(TbxItemCC12, 12, true);
end;

procedure TfmMain.SaveTools;
var
  i: Integer;
begin
  with TIniFile.Create(SynIni) do
  try
    for i:= Low(opTools) to High(opTools) do
    with opTools[i] do
    begin
      WriteString('Tool', 'C'+IntToStr(i), '"'+UTF8Encode(ToolCaption)+'"');
      WriteString('Tool', 'Ex'+IntToStr(i), '"'+UTF8Encode(ToolCommand)+'"');
      WriteString('Tool', 'Dir'+IntToStr(i), '"'+UTF8Encode(ToolDir)+'"');
      WriteString('Tool', 'Par'+IntToStr(i), '"'+UTF8Encode(ToolParams)+'"');
      WriteString('Tool', 'Lex'+IntToStr(i), ToolLexer);
      WriteString('Tool', 'Key'+IntToStr(i), ToolKeys);
      WriteString('Tool', 'Re'+IntToStr(i), '"'+ToolOutRegex+'"');
      WriteString('Tool', 'S'+IntToStr(i), Format('%d,%d,%d,%d,%d,%d,%d,%s,%d',
        [Ord(ToolOutCapture), ToolOutNum_fn, ToolOutNum_line, ToolOutNum_col, Ord(ToolSaveMode), Ord(ToolNoTags), Ord(ToolContextItem), ToolOutType, Ord(ToolOutEncoding)]));
    end;
  finally
    Free;
  end;

  UpdTools;
end;

procedure TfmMain.TBXItemOToolsClick(Sender: TObject);
var i: Integer;
  s: Widestring;
  L: TStringList;
begin
  L:= TStringList.Create;
  L.Sorted:= true;
  L.Duplicates:= dupIgnore;
  for i:= 0 to SyntaxManager.AnalyzerCount-1 do
    if not SyntaxManager.Analyzers[i].Internal then
      L.Add(SyntaxManager.Analyzers[i].LexerName);

  with TfmTools.Create(Self) do
  try
    SynDir:= Self.SynDir;
    List.Items.Clear;
    for i:= Low(opTools) to High(opTools) do
      with List.Items.Add do
       with opTools[i] do
      begin
        Caption:= ToolCaption;
        SubItems.Add(ToolCommand);
        SubItems.Add(ToolParams);
        SubItems.Add(ToolDir);
        SubItems.Add(Inttostr(Ord(ToolOutCapture)));
        SubItems.Add(ToolOutRegex);
        SubItems.Add(Format('%d,%d,%d', [ToolOutNum_fn, ToolOutNum_line, ToolOutNum_col]));
        SubItems.Add(ToolLexer);
        SubItems.Add(ToolKeys);
        SubItems.Add(Inttostr(Ord(ToolSaveMode)));
        SubItems.Add(Inttostr(Ord(ToolNoTags)));
        SubItems.Add(Inttostr(Ord(ToolContextItem)));
        SubItems.Add(ToolOutType);
        SubItems.Add(Inttostr(Ord(ToolOutEncoding)));
        {
        Note: when adding SubItems, correct const cc in unTool.pas
        }
      end;

    edLexer.Items.Add(DKLangConstW('AllL'));
    edLexer.Items.AddStrings(L);

    if CurrentFrame.TextSource.SyntaxAnalyzer<>nil then
      SCurLex:= CurrentFrame.TextSource.SyntaxAnalyzer.LexerName;

    Left:= Self.Monitor.Left + (Self.Monitor.Width - Width) div 2;
    Top:= Self.Monitor.Top + (Self.Monitor.Height - Height) div 2;
    if ShowModal = mrOk then
    begin
      for i:= Low(opTools) to High(opTools) do
       with opTools[i] do
        with List.Items[i-1] do
        begin
          ToolCaption:= Caption;
          ToolCommand:= SubItems[0];
          ToolParams:= SubItems[1];
          ToolDir:= SubItems[2];
          ToolOutCapture:= Bool(StrToIntDef(SubItems[3], 0));
          ToolOutRegex:= SubItems[4];
          S:= SubItems[5];
          ToolOutNum_fn:= StrToIntDef(SGetItem(S), 0);
          ToolOutNum_line:= StrToIntDef(SGetItem(S), 0);
          ToolOutNum_col:= StrToIntDef(SGetItem(S), 0);
          ToolLexer:= SubItems[6];
          ToolKeys:= SubItems[7];
          ToolSaveMode:= TSynToolSave(StrToIntDef(SubItems[8], 0));
          ToolNoTags:= Boolean(StrToIntDef(SubItems[9], 0));
          ToolContextItem:= Boolean(StrToIntDef(SubItems[10], 0));
          ToolOutType:= SubItems[11];
          ToolOutEncoding:= TOutputEnc(StrToIntDef(SubItems[12], 0));
        end;
      Application.ProcessMessages;
      SaveTools;
      ListOut.Invalidate;
    end;
  finally
    Release;
  end;
  L.Free;
end;

procedure TfmMain.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled:= false;
  StatusItemHint.Caption:= '';
  PageControl1.Hint:= '';
  PageControl2.Hint:= '';
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
  TbxItemSplitCaption.Caption:= DKLangConstW('Split_Vw');
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
  cStatFSize:=   ' '+DKLangConstW('stat_fsize')+' ';
  cStatFDate:=   ' '+DKLangConstW('stat_fdate')+' ';
  cStatCarets:=  ' '+DKLangConstW('stat_carets')+' ';
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
  //delete '<' if was added on ACP call
  if not Accept then
    if FBrAdd then
      with CurrentEditor do
        if (CaretStrPos >= 1) and (CaretStrPos <= TextLength) then
          if Lines.FText[CaretStrPos] = '<' then
          begin
            CaretStrPos:= CaretStrPos - 1;
            DeleteText(1);
          end;
end;


procedure FixListScroll(L: TTntListBox);
var
  i, n, n2: integer;
begin
  n:= 50;
  for i:= 0 to L.Count-1 do
  begin
    n2:= ecTextExtent(L.Canvas, L.Items[i]).cx;
    if n2>n then n:= n2;
  end;
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

procedure TfmMain.RunTool(NTool: Integer);
  function HandleParams(const s, dir: WideString): WideString;
  var
    fn, SVarValue: Widestring;
  begin
    Result:= S;
    //
    SReplaceW(Result, '{FileName}', CurrentFrame.FileName);
    SReplaceW(Result, '{FileNameOnly}', WideExtractFileName(CurrentFrame.FileName));
    SReplaceW(Result, '{FileNameNoExt}', WideChangeFileExt(WideExtractFileName(CurrentFrame.FileName), ''));
    SReplaceW(Result, '{FileDir}', WideExtractFileDir(CurrentFrame.FileName));
    SReplaceW(Result, '{FileExt}', Copy(WideExtractFileExt(CurrentFrame.FileName), 2, MaxInt));
    //
    SReplaceW(Result, '{ProjectWorkDir}', CurrentProjectWorkDir);
    SReplaceW(Result, '{ProjectMainFileName}', CurrentProjectMainFN);
    SReplaceW(Result, '{ProjectMainFileDir}', WideExtractFileDir(CurrentProjectMainFN));
    //
    SReplaceW(Result, '{CurrentWord}', CurrentEditor.WordAtPos(CurrentEditor.CaretPos));
    SReplaceW(Result, '{CurrentLineNum}', IntToStr(CurrentEditor.CaretPos.Y+1));
    SReplaceW(Result, '{CurrentColumnNum}', IntToStr(CurrentEditor.CaretPos.X+1));
    if CurrentEditor.CurrentLine < CurrentEditor.Lines.Count then
      SReplaceW(Result, '{CurrentLine}', CurrentEditor.Lines[CurrentEditor.CurrentLine]);
    //
    SReplaceW(Result, '{SelectedText}', CurrentEditor.SelText);
    if Pos('{SelectionFileName}', Result)>0 then
      SReplaceW(Result, '{SelectionFileName}', CurrentSelectionFN(true));
    if Pos('{SelectionFileNameAnsi}', Result)>0 then
      SReplaceW(Result, '{SelectionFileNameAnsi}', CurrentSelectionFN(false));
    //
    if Pos('{FileName2}', Result)>0 then
      SReplaceW(Result, '{FileName2}', OppositeFileName);
    if Pos('{FileDir2}', Result)>0 then
      SReplaceW(Result, '{FileDir2}', WideExtractFileDir(OppositeFileName));
    if Pos('{FileExt2}', Result)>0 then
      SReplaceW(Result, '{FileExt2}', WideExtractFileExt(OppositeFileName));
    //
    SReplaceW(Result, '{SynDir}', ExtractFileDir(SynDir));
    SReplaceW(Result, '{SynIniDir}', ExtractFileDir(SynIni));
    //
	  while Pos('{Interactive}', Result)>0 do
    begin
      fn:= '';
      if not MsgInput('cmdInt', fn) then
        raise Exception.Create('Cancel');
      SReplaceW(Result, '{Interactive}', fn);
    end;
    //
	  while Pos('{InteractiveFile}', Result)>0 do
    begin
      fn:= '';
      if not WidePromptForFileName(fn, '', '',
        DKLangConstW('cmdIFile'), dir) then
        raise Exception.Create('Cancel');
      SReplaceW(Result, '{InteractiveFile}', fn);
    end;
    //
	  while Pos('{InteractiveDir}', Result)>0 do
    begin
      fn:= dir;
      if not WideSelectDirectory(
        DKLangConstW('cmdIDir'), '', fn) then
        raise Exception.Create('Cancel');
      SReplaceW(Result, '{InteractiveDir}', fn);
    end;
    //
    //user variables (from project)
    if Assigned(fmProj) then
      fmProj.ReplaceUserVars(Result, '', SVarValue);
  end;
var
  ft, fcmd, fpar, frun, fexe, fdir,
  SCurWord: Widestring;
begin
  if CurrentFrame = nil then Exit;
  with opTools[NTool] do
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
          FSave.Execute;
      svAll:
        FSaveAll.Execute;
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
      frun:= SExpandVars(fexe);
      fdir:= SExpandVars(fdir);
      if fdir='' then
        fdir:= SExtractFileDir(CurrentFrame.FileName);

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
      ft:= SExpandVars('%temp%\SynWr$$.txt');
      frun:= SExpandVars(fexe);
      fdir:= SExpandVars(fdir);
      if fdir='' then
        fdir:= SExtractFileDir(CurrentFrame.FileName);
      if fdir='' then
        fdir:= SExpandVars('%temp%');
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

      HandleToolOutput(ft, NTool);
    end;
  end;
end;

procedure TfmMain.fTool1Execute(Sender: TObject);
begin
  RunTool(1);
end;

procedure TfmMain.fTool2Execute(Sender: TObject);
begin
  RunTool(2);
end;

procedure TfmMain.fTool3Execute(Sender: TObject);
begin
  RunTool(3);
end;

procedure TfmMain.fTool4Execute(Sender: TObject);
begin
  RunTool(4);
end;

procedure TfmMain.TBXSubmenuItemRunPopup(Sender: TTBCustomItem; FromLink: Boolean);
begin
  TBXItemRunOpenDir.Enabled:= CurrentFrame.Filename <> '';
  TBXItemRunOpenFile.Enabled:= TBXItemRunOpenDir.Enabled;
  UpdTools;
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
  CurrentEditor.ExecCommand(sm_Zoom0);
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
  if FullScr then Exit;
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

procedure TfmMain.TBXItemFFPrevClick(Sender: TObject);
begin
  if Finder.FindText <> '' then
  begin
    Finder.FindText:= edQs.Text;
    Finder.Flags:= [ftWrapSearch];
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if cbWord.Checked then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
    Finder.FindPrev;
  end;
end;

procedure TfmMain.TBXItemFFNextClick(Sender: TObject);
begin
  if Finder.FindText <> '' then
  begin
    Finder.FindText:= edQs.Text;
    Finder.Flags:= [ftWrapSearch];
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if cbWord.Checked then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
    Finder.FindNext;
  end;
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
  if edQs.Text = '' then Exit;

  Finder.FindText:= edQs.Text;
  Finder.Flags:= [ftEntireScope, ftWrapSearch];
  if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
  if cbWord.Checked then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
  Finder.FindAgain;
end;

procedure TfmMain.TBXItemQsClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_QS);
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
  if opQsCap then
    TbxItemFFNext.DisplayMode:= nbdmImageAndText
  else
    TbxItemFFNext.DisplayMode:= nbdmDefault;
  TbxItemFFPrev.DisplayMode:= TbxItemFFNext.DisplayMode;

  //case/words
  if opQsCap then
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
procedure TfmMain.CloseFrameWithCfm(F: TEditorFrame);
var
  n: integer;
  FNew: TEditorFrame;
begin
  UpdateColorHint;
  if QuickView then Exit;
  if (F = nil) or (FrameCount = 0) then
    Exit;
  if (FrameCount = 1) and (F.FileName = '') and not F.Modified then
    Exit;

  if F.Modified then
    case PromtToSave(F, False, True) of
      mrYes:
      begin
        if not SaveFrame(F, False) then Exit;
        F.Modified:= False; //needed if selected Cancel in SaveDialog
        F.ModifiedClr:= True;
      end;
      mrNo:
      begin
        F.Modified:= False;
        F.ModifiedClr:= True;
      end;
      mrCancel:
        Exit;
    end;

  if CurrentFrame = F then
  with PageControl do
  begin
    n:= ActivePageIndex;
    if n < PageCount-1 then Inc(n)
    else
    if n > 0 then Dec(n)
    else
      n:= -1;
    if n >= 0 then
    begin
      ActivePageIndex:= n;
      FNew:= Frames[ActivePageIndex];
    end
    else
      FNew:= nil;
  end
  else
    FNew:= CurrentFrame;

  //If it is last tab
  if FrameCount = 1 then
  begin
    CreateFrame;
    FNew:= CurrentFrame;
  end;

  CloseFrame(F);
  FPagesNTab:= -1;
  if Assigned(FNew) then
  begin
    CurrentFrame:= FNew;
    FocusEditor;
  end;
  //If all closed
  if FrameCount = 0 then
    CreateFrame;

  UpdateTabList(PageControl.ActivePageIndex, -1, -1);
end;

procedure TfmMain.TBXItemTbClClick(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= FClickedFrame;
  if F<>nil then
  begin
    CloseFrameWithCfm(F);
    UpdatePages;
  end;  
end;

procedure TfmMain.TBXItemTbNewClick(Sender: TObject);
begin
  fNew.Execute;
end;

function TfmMain.SNewDocName(const fn: Widestring): string;
var
  an: TSyntAnalyzer;
  s: string;
begin
  Result:= ChangeFileExt(ExtractFileName(fn), '');
  SDeleteFrom(Result, '_'); //_UTF8 may exist

  s:= '?';
  an:= SyntaxManager.AnalyzerForFile(fn);
  if an<>nil then s:= an.LexerName;

  Result:= s + #9 {or ' '#151' '} + Result;
end;

procedure TfmMain.DoNewDoc(const fn: Widestring);
var
  Enc: Integer;
  Ini: TIniFile;
begin
  if not IsFileExist(fn) then Exit;

  //add template to MRU list
  Ini:= TIniFile.Create(SynIni);
  try
    SynMruNewdoc.AddItem(fn);
    SaveMruList(SynMruNewdoc, Ini, 'MRU_Newdoc');
  finally
    FreeAndNil(Ini);
  end;

  Enc:= CP_ACP;
  if Pos('_UTF8', ExtractFileName(fn))>0 then
    Enc:= cp__UTF8_noBOM;

  if (CurrentFrame.FileName<>'') or (CurrentEditor.Lines.Count>0) then
    fNew.Execute;
  CurrentEditor.LoadFromFile(fn);

  CurrentFrame.TextSource.SyntaxAnalyzer:= SyntaxManager.AnalyzerForFile(fn);
  SyntaxManager.CurrentLexer:= CurrentFrame.TextSource.SyntaxAnalyzer;
  SyntaxManagerChange(Self);

  ChangeEncoding(CurrentFrame, Enc);
  EditorSetModified(CurrentFrame.EditorMaster);
end;

//tab [X] button rect
procedure TabCtrl_GetXRect(H: THandle; TabIndex, BtnSize: Integer; var R: TRect);
begin
  TabCtrl_GetItemRect(H, TabIndex, R);
  Dec(R.Right, 4);
  R.Left:= R.Right-BtnSize;
  R.Top:= (R.Bottom + R.Top - BtnSize) div 2;
  R.Bottom:= R.Top + BtnSize;
end;

procedure TfmMain.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  F: TEditorFrame;
  R, RLine: TRect;
  SCaption: Widestring;
  c, ColorMisc: TColor;
  PageControl: TTntPageControl;
  AFtp: boolean;
begin
  PageControl:= Control as TTntPageControl;

  //AT --todo
  //get frame properties
  ColorMisc:= clNone;
  AFtp:= false;
  F:= PagesToFrame(PageControl, TabIndex);
  if F<>nil then
  begin
    ColorMisc:= F.TabColor;
    AFtp:= F.IsFtp;
  end;

  //get title string
  SCaption:= (PageControl.Pages[TabIndex] as TTntTabSheet).Caption;
  if opTabNums then
  begin
    //Title has 3 lead spaces, replace em:
    Delete(SCaption, 1, cTabNumPrefix);
    SCaption:= Format('%d.', [TabIndex+1]) + SCaption;
  end;
  if AFtp then
    SCaption:= '  ' + IfThen(opTabNums, ' ') + SCaption; //add 2+1 spaces

  //paint theme on PageControl
  if not FPanelDrawBusy then
  if (TabIndex = PageControl.PageCount-1) then
  begin
    TabCtrl_GetItemRect(PageControl.Handle, TabIndex, R);
    if PageControl.TabPosition=tpTop then
      R:= Types.Rect(R.Right, R.Top-2, ClientWidth, R.Bottom)
    else
      R:= Types.Rect(R.Right, R.Top, ClientWidth, R.Bottom+2);
    Inc(R.Left, 2); //prevent visual glitch with Aluminum theme:
      //if you hover over X button of last tab, theme BG drawn little over last tab

    if R.Left<=R.Right then
      (*
      CurrentSkin.PaintThemedElementBackground(
        PageControl.Canvas, R,
        skncTab, true, false{Pushed}, false{Hottrack}, false{Checked}, false, false, false);
        *)
      CurrentSkin.PaintBackground(
        PageControl.Canvas, R,
        skncDock, sknsNormal, true{BG}, false{Borders});
  end;

  //Paint tab
  TabCtrl_GetItemRect(PageControl.Handle, TabIndex, R);

  if TabIndex=PageControl.ActivePageIndex then
  begin
    Control.Canvas.Brush.Color:= IfThen(ColorMisc<>clNone, ColorMisc, opColorTab2);
  end
  else
  begin
    Control.Canvas.Brush.Color:= IfThen(ColorMisc<>clNone, ColorMisc, opColorTab1);
    InflateRect(R, -2, -1);
  end;
  Control.Canvas.FillRect(R);

  //tab top line
  if (TabIndex=PageControl.ActivePageIndex)
    and (PageControl=Self.PageControl) then
  begin
    c:= Control.Canvas.Brush.Color;
    Control.Canvas.Brush.Color:= opColorTab3;
    if PageControl.TabPosition=tpTop then
      RLine:= Types.Rect(R.Left,R.Top,R.Right,R.Top+3)
    else
      RLine:= Types.Rect(R.Left,R.Bottom-3,R.Right,R.Bottom);
    Control.Canvas.FillRect(RLine);
    Control.Canvas.Brush.Color:= c;
  end;
  {
  else
  if (opColorTab4<>clNone) and (Pos('*', SCaption)>0) then
  begin
    c:= Control.Canvas.Brush.Color;
    Control.Canvas.Brush.Color:= opColorTab4;
    Control.Canvas.FillRect(Types.Rect(R.Left,R.Top,R.Right,R.Top+3));
    Control.Canvas.Brush.Color:= c;
  end;
  }

  //tab caption
  if Pos('*', SCaption)>0 then
    Control.Canvas.Font.Color:= opColorTabFont2
  else
    Control.Canvas.Font.Color:= opColorTabFont1;
  TextOutW(Control.Canvas.Handle, R.Left+6, R.Top+3, PWChar(SCaption), Length(SCaption));

  //tab ftp icon
  if AFtp then
    ImageListFtp.Draw(Control.Canvas, R.Left+3, R.Top+5, 0);

  //tab X btn
  if opTabBtn then
  begin
    TabCtrl_GetXRect(PageControl.Handle, TabIndex, ImageListCloseBtn.Width, R);
    ImageListCloseBtn.Draw(Control.Canvas, R.Left, R.Top, Ord(FPagesNTab=TabIndex));
  end;
end;

procedure TfmMain.PageControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  i:Integer;
  r:TRect;
  PageControl: TTntPageControl;
begin
  PageControl:= Sender as TTntPageControl;

  //drag start
  if opTabDragDrop and
    (Button = mbLeft) then
    PageControl.BeginDrag(false, 20); //20px threshold: tryin to solve issue

  //double click
  if (Button = mbLeft) and
    (GetTickCount-FPagesDblClickTime < GetDoubleClickTime) and
    (Abs(FPagesDblClickPoint.X-X)<10) and (Abs(FPagesDblClickPoint.Y-Y)<10) then
  begin
    FPagesDblClickTime:= 0;
    //double click on a tab -> close this tab
    for i:= 0 to PageControl.PageCount-1 do
    begin
      TabCtrl_GetItemRect(PageControl.Handle, i, R);
      if PtInRect(R, Point(x, y)) then
      begin
        if opTabDblClick then
        begin
          CloseFrameWithCfm(Frames[i]);
          UpdatePages;
        end;
        Exit
      end;
    end;
    //double click, but not on tabs -> create new tab
    fNew.Execute;
    Exit
  end;

  //first click of double click
  FPagesDblClickTime:= GetTickCount;
  FPagesDblClickPoint:= Point(X, Y);

  //click on [X] tab button
  if opTabBtn and (Button = mbLeft) then
  for i:= 0 to PageControl.PageCount-1 do
  begin
    TabCtrl_GetXRect(PageControl.Handle, i, ImageListCloseBtn.Width, R);
    if PtInRect(R, Point(x, y)) then
    begin
      CloseFrameWithCfm(Frames[i]);
      UpdatePages;
      Exit
    end;
  end;

  //middle button click
  if Button=mbMiddle then
  for i:= 0 to PageControl.PageCount-1 do
  begin
    TabCtrl_GetItemRect(PageControl.Handle, i, R);
    if PtInRect(R, Point(x, y)) then
    begin
      CloseFrameWithCfm(Frames[i]);
      UpdatePages;
      Exit
    end;
  end;
end;

procedure TfmMain.fCloseExecute(Sender: TObject);
begin
  if CurrentFrame=nil then Exit;
  CloseFrameWithCfm(CurrentFrame);
  UpdatePages;
end;

procedure TfmMain.PageControl1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
  //show filename in statusbar, truncated if needed
  procedure ShowFN(const fn: Widestring);
  var
    bmp: TBitmap;
    size: integer;
  begin
    //width of last panel
    size:= Status.ClientWidth - 8 - Status.View.Find(StatusItemHint).BoundsRect.Left;
     
    bmp:= TBitmap.Create;
    try
      bmp.Canvas.Font.Assign(Status.Font);
      SetHint(WideMinimizeName(fn, bmp.Canvas, size));
    finally
      FreeAndNil(bmp);
    end;
  end;
var
  i,n: Integer;
  r: TRect;
  PageControl: TTntPageControl;
begin
  PageControl:= Sender as TTntPageControl;
  n:= FPagesNTab;
  FPagesNTab:= -1;
  for i:= 0 to PageControl.PageCount-1 do
  begin
    //draw tab hint
    TabCtrl_GetItemRect(PageControl.Handle, i, R);
    if PtInRect(R, Point(x, y)) then
      ShowFN(PagesToFrame(PageControl, i).FileName);

    //handle X btn mouse-over
    TabCtrl_GetXRect(PageControl.Handle, i, ImageListCloseBtn.Width, R);
    if PtInRect(R, Point(x, y)) then
    begin
      FPagesNTab:= i;
      Break
    end;
  end;

  //redraw X btn
  if (n<>FPagesNTab) then
    //PageControl.Invalidate;
    DoRepaintTabCaptions;
end;

type
  TPageControlHack = class(TTntPageControl);

procedure TfmMain.PageControl1ContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
var
  PagesThis: TTntPageControl;
  i: Integer;
  r: TRect;
  P: TPoint;
begin
  PagesThis:= Sender as TTntPageControl;
  if PagesThis<>PageControl then
  begin
    PageControl:= PagesThis;
    if PageControl.CanFocus then
      PageControl.SetFocus;
  end;

  FPagesNTabCtx:= -1;
  for i:= 0 to PageControl.PageCount-1 do
  begin
    TabCtrl_GetItemRect(PageControl.Handle, i, R);
    if PtInRect(R, MousePos) then
    begin
      FPagesNTabCtx:= i;
      Break
    end;
  end;

  //we show PopupMenu by hands (and clear PageControl.PopupMenu prop) because of issue:
  //editors' scrollbars don't show system popup menu.
  //This handling works around this issue.
  P:= MousePos;
  Handled:= not PtInRect(TPageControlHack(PagesThis).DisplayRect, P);
  if Handled then
  begin
    P:= PagesThis.ClientToScreen(P);
    PopupTb.Popup(P.X, P.Y);
  end;
end;

procedure TfmMain.fSaveAllExecute(Sender: TObject);
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

procedure TfmMain.fCloseAllExecute(Sender: TObject);
begin
  CloseAll(True, True);
  UpdatePages;
end;

procedure TfmMain.fCloseOthExecute(Sender: TObject);
begin
  CloseOth(CurrentFrame);
  UpdatePages;
end;

procedure TfmMain.CloseOth(F: TEditorFrame);
begin
  CloseAll(True, True, F);
  if not PagesEmpty(PageControl2) then
  begin
    PageControl:= PageControl2;
    CurrentFrame:= Frames[0];
    DoMoveTabToOtherView(0);
  end;
end;

procedure TfmMain.TBXItemTbOthClick(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= FClickedFrame;
  if F<>nil then
    CloseOth(F);
end;

procedure TfmMain.UpdateClickedFrame;
var
  P: TPoint;
  N: Integer;
begin
  FClickedFrame:= nil;
  if ListTabs.Visible and plTree.Visible then
  begin
    P:= ListTabs.ScreenToClient(Mouse.CursorPos);
    if PtInRect(ListTabs.BoundsRect, P) then
    begin
      N:= ListTab_FrameIndex;
      if N>=0 then
        FClickedFrame:= FramesAll[N]
      else
        FClickedFrame:= nil;
      Exit;  
    end;
  end;

  if FPagesNTabCtx >= 0 then
    FClickedFrame:= Frames[FPagesNTabCtx]
  else
    FClickedFrame:= CurrentFrame;
end;

procedure TfmMain.PopupTbPopup(Sender: TObject);
var
  en_all, en, en2, enProj, enWinMove, enWinOpen: boolean;
  F: TEditorFrame;
begin
  UpdateClickedFrame;
  F:= FClickedFrame;

  en_all:= F<>nil;//FPagesNTabCtx>=0;
  en:= en_all and (F<>nil) and (F.FileName<>'');
  en2:= en_all and (F<>nil) and (F.Modified or (F.FileName<>''));
  enProj:= en_all and Assigned(fmProj) and fmProj.Visible and plTree.Visible;
  enWinOpen:= en_all and SynExe and not opSingleInstance;
  enWinMove:= en_all and enWinOpen and not F.Modified and (FrameAllCount>1);

  TBXItemTbCl.Enabled:= en_all;
  TBXItemTbOth.Enabled:= en_all and (FrameAllCount>1);
  TBXSubmenuTabColor.Enabled:= en_all;
  TBXItemTbToggleSplit.Enabled:= en_all;
  TBXItemTbToggleSplit.Checked:= (F<>nil) and F.IsSplitted;
  TBXItemTbCpFN.Enabled:= en;
  TBXItemTbCpFull.Enabled:= en;
  TBXItemTbCpDir.Enabled:= en;
  TBXItemTbMoveToView.Enabled:= en2;
  TBXItemTbMoveToWindow.Enabled:= en and enWinMove;
  TBXItemTbOpenInWindow.Enabled:= en and enWinOpen;
  TBXItemTbAddToProj.Enabled:= en and enProj;
end;

procedure TfmMain.TBXItemFSesSaveAsClick(Sender: TObject);
var i:Integer;
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
      SaveSession(FileName);
      SynMruSessions.AddItem(FileName);
      UpdateTitle(CurrentFrame);
    end;
  end;
end;

procedure TfmMain.SaveSession(const fn: string);
var
  i: Integer;
  F: TEditorFrame;
  dir: string;
begin
  FSessionFN:= fn;

  //session dir may not exist, for portable install
  dir:= SExtractFileDir(fn);
  if not IsDirExist(dir) then
    CreateDir(dir);

  try
    with TIniFile.Create(fn) do
    try
      WriteInteger('Ini', 'Files', FrameAllCount);
      WriteInteger('Ini', 'Page', PageControl1.ActivePageIndex);
      WriteInteger('Ini', 'Page2', PageControl2.ActivePageIndex);
      WriteInteger('Ini', 'PageCount', PageControl1.PageCount);
      WriteBool('Ini', 'PageActive', PageControl=PageControl2);
      WriteBool('Ini', 'SplitHorz', FSplitHorz);
      WriteFloat('Ini', 'SplitPos', Trunc(FSplitter * 100)/100);
      for i:= 0 to FrameAllCount-1 do
      begin
        F:= FramesAll[i];
        WriteString('FN', IntToStr(i), SCollapseFN(UTF8Encode(F.FileName), fn));
        WriteInteger('Top', IntToStr(i), F.EditorMaster.TopLine);
        WriteInteger('Top2', IntToStr(i), F.EditorSlave.TopLine);
        WriteInteger('Cur', IntToStr(i), F.EditorMaster.CaretStrPos);
        WriteInteger('Cur2', IntToStr(i), F.EditorSlave.CaretStrPos);
        WriteBool('RO', IntToStr(i), F.TextSource.ReadOnly);
        WriteBool('Wrap', IntToStr(i), F.EditorMaster.WordWrap);
        WriteBool('Wrap2', IntToStr(i), F.EditorSlave.WordWrap);
        WriteBool('Line', IntToStr(i), F.EditorMaster.LineNumbers.Visible);
        WriteBool('Fold', IntToStr(i), F.EditorMaster.DisableFolding);
        WriteInteger('SelMode', IntToStr(i), Ord(F.EditorMaster.SelectModeDefault));
        WriteInteger('SelMode2', IntToStr(i), Ord(F.EditorSlave.SelectModeDefault));
        WriteString('Color', IntToStr(i), ColorToString(F.TabColor));
        WriteString('ColMarkers', IntToStr(i), F.ColMarkers);
        WriteString('Collapsed', IntToStr(i), EditorGetCollapsedRanges(F.EditorMaster));
        WriteString('Collapsed2', IntToStr(i), EditorGetCollapsedRanges(F.EditorSlave));
      end;
    finally
      Free;
    end;
  except
    MsgError(WideFormat(DKLangConstW('AppNSes'), [fn]), Handle);
  end;
end;

procedure TfmMain.TBXItemFSesOpenClick(Sender: TObject);
begin
  if not AskSession(true) then
    Exit;
  with OD_Session do
  begin
    InitialDir:= opLastDirSession;
    if Execute then
    begin
      //confirm creation of new session
      if not IsFileExist(FileName) then
      begin
        if not MsgConfirmCreate(FileName) then
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
      SynMruSessions.AddItem(FileName);
    end;
  end;
end;

procedure TfmMain.DoOpenSession(const fn: string; Add: boolean = False);
var
  F: TEditorFrame;
  NFiles, NPage1, NPage2, NPageCount: integer;
  NPageAct, NSplitHorz: boolean;
  NSplitPos: Double;
  i, NTabCount1, NTabCount2, N: Integer;
  s, sdir: Widestring;
begin
  if not Add then
    FSessionFN:= fn;
  if Add then
  begin
    NTabCount1:= PageControl1.PageCount;
    NTabCount2:= PageControl2.PageCount;
  end
  else
  begin
    NTabCount1:= 0;
    NTabCount2:= 0;
    fCloseAll.Execute;
  end;

  with TIniFile.Create(fn) do
    try
      {
      Page: active page index for left view
      Page2: --""--           for right view
      PageCount: left view pages count
      PageActive: active view number (0/1)
      }
      NFiles:= ReadInteger('Ini', 'Files', 0);
      NPage1:= ReadInteger('Ini', 'Page', 0);
      NPage2:= ReadInteger('Ini', 'Page2', 0);
      NPageCount:= ReadInteger('Ini', 'PageCount', NFiles);
      NPageAct:= ReadBool('Ini', 'PageActive', false);
      NSplitHorz:= ReadBool('Ini', 'SplitHorz', false);
      NSplitPos:= ReadFloat('Ini', 'SplitPos', 50.0);

      for i:= 0 to NFiles-1 do
      begin
        s:= UTF8Decode(ReadString('FN', IntToStr(i), ''));

        //get session dir, w/o last slash
        sdir:= WideExcludeTrailingBackslash(WideExtractFileDir(fn));

        //filename stored with ".\"
        if SBegin(s, '.\') then
          SReplaceW(s, '.', sdir)
        else
        //filename stored without path
        if WideExtractFileDir(s) = '' then
          s:= sdir + '\' + s;

        //test filename
        if not IsFileExist(s) then
          Continue;

        if i<NPageCount then
          PageControl:= PageControl1
        else
          PageControl:= PageControl2;
        DoOpenFile(s);
        UpdatePages;

        F:= CurrentFrame;
        F.NotInRecents:= true;
        if opSaveCaret then
        begin
          F.EditorMaster.TopLine:= ReadInteger('Top', IntToStr(i), 0);
          F.EditorSlave.TopLine:= ReadInteger('Top2', IntToStr(i), 0);
          F.EditorMaster.CaretStrPos:= ReadInteger('Cur', IntToStr(i), 0);
          F.EditorSlave.CaretStrPos:= ReadInteger('Cur2', IntToStr(i), 0);
        end;
        F.TextSource.ReadOnly:= ReadBool('RO', IntToStr(i), false);
        F.EditorMaster.WordWrap:= ReadBool('Wrap', IntToStr(i), false);
        F.EditorSlave.WordWrap:= ReadBool('Wrap2', IntToStr(i), false);
        F.EditorMaster.LineNumbers.Visible:= ReadBool('Line', IntToStr(i), false);
        F.EditorMaster.DisableFolding:= ReadBool('Fold', IntToStr(i), false);
        F.EditorMaster.SelectModeDefault:= TSyntSelectionMode(ReadInteger('SelMode', IntToStr(i), 0));
        F.EditorSlave.SelectModeDefault:= TSyntSelectionMode(ReadInteger('SelMode2', IntToStr(i), 0));
        F.TabColor:= StringToColor(ReadString('Color', IntToStr(i), ColorToString(clNone)));
        F.ColMarkers:= ReadString('ColMarkers', IntToStr(i), '');
        F.CollapsedString:= ReadString('Collapsed', IntToStr(i), '');
        F.CollapsedString2:= ReadString('Collapsed2', IntToStr(i), '');
      end;

      //restore active frame
      if NPageAct then
        PageControl:= PageControl2
      else
        PageControl:= PageControl1;
      N:= NPage1+NTabCount1;
      if N <= PageControl1.PageCount-1 then
        PageControl1.ActivePageIndex:= N;
      N:= NPage2+NTabCount2;
      if N <= PageControl2.PageCount-1 then
        PageControl2.ActivePageIndex:= N;

      //bad session file  
      if (PageControl=PageControl2) and (PageControl2.PageCount=0) then
        PageControl:= PageControl1;

      N:= PageControl.ActivePageIndex;
      if N<0 then N:= 0;
      if (N>=FrameCount) then
        MsgError('Incorrect tab index to set', Handle)
      else
        CurrentFrame:= Frames[N];

      FSplitter:= NSplitPos;
      SetSplitter(FSplitter);

      if FSplitHorz<>NSplitHorz then
        ecSplitViewsVertHorz.Execute;
    finally
      Free;
    end;

  FocusEditor;
  DoRepaint;
  PageControl1.Invalidate;
  PageControl2.Invalidate;
end;

procedure TfmMain.TBXItemFClrClick(Sender: TObject);
begin
  TBXItemClrClick(Self);
end;


procedure TfmMain.tbxWinPopup(Sender: TTBCustomItem; FromLink: Boolean);
  function Sh(i: integer): string;
  begin
    if (i>=0) and (i<=9) then
      Result:= ShortCutToText(ShFor(sm_Tab0+i))
    else
      Result:= '';
    if Result<>'' then
      Result:= #9 + Result;
  end;
var
  i: integer;
  b: TSpTbxItem;
  bSep: TSpTbxSeparatorItem;
begin
  //clear
  with tbxWin do
    for i:= Count-1 downto 0 do
      if Items[i].Tag>0 then
        Items[i].Free;
  //add tabs
  for i:= 0 to FrameAllCount-1 do
  begin
    if i = PageControl1.PageCount then
    begin
      bSep:= TSpTbxSeparatorItem.Create(Self);
      bSep.Tag:= 1;
      tbxWin.Add(bSep);
    end;
    b:= TSpTbxItem.Create(Self);
    b.Caption:= FramesAll[i].Title + Sh(i);
    if i < 9 then
      b.Caption:= WideFormat('&%d   ', [i+1]) + b.Caption
    else
    if i < 10 + Ord('Z') - Ord('A') then
      b.Caption:= WideFormat('&%s   ', [Chr(i-9 + Ord('A'))]) + b.Caption;
    b.Hint:= FramesAll[i].FileName;
    b.Tag:= i+1;
    b.OnClick:= TabClick;
    b.OnSelect:= ButtonOnSelect;
    b.RadioItem:= true;
    if i < PageControl1.PageCount then
      b.Checked:= i = PageControl1.ActivePageIndex
    else
      b.Checked:= i-PageControl1.PageCount = PageControl2.ActivePageIndex;
    tbxWin.Add(b);
  end;
  //move Cmds to end
  with TbxWin do
  begin
    Move(0, Count-1);
    Move(0, Count-1);
  end;
end;

procedure TfmMain.TabClick(Sender: TObject);
//Note: TabClick called by TbxItemWin0..TbxItemWin9
//which are hidden in the Tools menu
var
  n: integer;
begin
  n:= (Sender as TComponent).Tag - 1;
  TabClickN(n);
end;

procedure TfmMain.TabClickN(n: integer);
begin
  if (n>=0) and (n<FrameAllCount) then
  begin
    CurrentFrame:= FramesAll[n];
    UpdateTabList(PageControl.ActivePageIndex, -1, -1);
  end
  else
    MsgBeep;
end;

procedure TfmMain.TabRightClickN(n: integer);
var
  PrevPages: TTntPageControl;
begin
  if PagesEmpty(PageControl2) then
    begin MsgBeep; Exit end;
  PrevPages:= PageControl;
  PageControl:= PageControl2;
  if (n>=0) and (n<FrameCount) then //not FrameAllCount
  begin
    CurrentFrame:= Frames[n]; //not FramesAll
    UpdateTabList(PageControl.ActivePageIndex, -1, -1);
  end
  else
  begin
    MsgBeep;
    PageControl:= PrevPages;
  end;
end;

procedure TfmMain.TBXSubmenuEnc2Popup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  UpdateCPMenu(TbxSubmenuEnc2, True{AConvEnc});
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
    DoListCommand_Untab(L, CurrentTabSize(F.EditorMaster));
    F.EditorMaster.Text:= L.Text;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmMain.TBXItemRunFindPhpClick(Sender: TObject);
begin
  FOnlineWordHelp('http://www.php.net/%s');
end;

procedure TfmMain.FOnlineWordHelp(const url: string);
var
  s: ecString;
begin
  with CurrentEditor do
    s:= WordAtPos(CaretPos);
  if s='' then
    begin MsgBeep; Exit; end;
  s:= Format(url, [s]);
  FOpenURL(s, Handle);
end;

procedure TfmMain.FOnlineFind(const site: string);
var
  s: WideString;
begin
  with CurrentEditor do
    if SelLength>0 then
      s:= SelText
    else
      s:= WordAtPos(CaretPos);
  if s='' then
    begin MsgBeep; Exit; end;
  SReplaceAllW(s, ' ', '+');
  FOpenURL(site + s, Handle);
end;

procedure TfmMain.TBXItemRunFindGoogleClick(Sender: TObject);
begin
  FOnlineFind('http://www.google.com/search?q=');
end;

procedure TfmMain.TBXItemRunFindWikiClick(Sender: TObject);
begin
  FOnlineFind('http://en.wikipedia.org/w/index.php?title=Special:Search&search=');
end;

procedure TfmMain.TBXItemRunFindMSDNClick(Sender: TObject);
begin
  FOnlineFind('http://social.msdn.microsoft.com/Search/en-US?query=');
end;

procedure TfmMain.RunIn(const fn: Widestring);
begin
  if CurrentFrame.FileName <> '' then
  begin
    if CurrentFrame.Modified then
      FSave.Execute;
    if not FExecute(fn, '"' + CurrentFrame.FileName + '"', '', Handle) then
      MsgNoRun(fn);
  end;
end;

procedure TfmMain.TBXItemRunFirefoxClick(Sender: TObject);
begin
  RunIn('firefox.exe');
end;

procedure TfmMain.TBXItemRunMSIEClick(Sender: TObject);
begin
  RunIn('iexplore.exe');
end;

procedure TfmMain.TBXItemRunChromeClick(Sender: TObject);
begin
  RunIn('chrome.exe');
end;

procedure TfmMain.TBXItemRunSafariClick(Sender: TObject);
begin
  RunIn('safari.exe');
end;

procedure TfmMain.TBXItemRunOpenFileClick(Sender: TObject);
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
  if CurrentFrame.FileName<>'' then
    FOpenURL(WideExtractFileDir(CurrentFrame.FileName), Handle);
end;

procedure TfmMain.TBXItemT5Click(Sender: TObject);
begin
  RunTool(5);
end;

procedure TfmMain.TBXItemT6Click(Sender: TObject);
begin
  RunTool(6);
end;

procedure TfmMain.TBXItemT7Click(Sender: TObject);
begin
  RunTool(7);
end;

procedure TfmMain.TBXItemT8Click(Sender: TObject);
begin
  RunTool(8);
end;

procedure TfmMain.TimerLoadTimer(Sender: TObject);
begin
  TimerLoad.Enabled:= false;
  LoadTools;
end;

procedure TfmMain.TBXItemTbCloseClick(Sender: TObject);
begin
  fClose.Execute;
end;


procedure TfmMain.fExitExecute(Sender: TObject);
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

procedure TfmMain.fCloseDelExecute(Sender: TObject);
var
  fn: Widestring;
begin
  if CurrentFrame.FileName <> '' then
  if MsgConfirm(DKLangConstW('mdel'), Handle) then
  begin
    fn:= CurrentFrame.FileName;
    FClose.Execute;
    if not FDeleteToRecycle(Handle, fn, true) then
      MsgError(WideFormat(DKLangConstW('mdeln'), [WideExtractFileName(fn)]), Handle);
    SynMruFiles.DeleteItem(fn);
    DoRefreshPluginsFiles(fn);
  end;
end;

procedure TfmMain.WM2(var m: TMessage);
begin
  case m.WParam of
    sm_FClose:   FClose.Execute;
    sm_FCloseDel: FCloseDel.Execute;
    sm_FCloseAll: FCloseAll.Execute;
    sm_FCloseOth: FCloseOth.Execute;
    sm_FileRename: FRename.Execute;
  end;
  m.Result:= 1;
end;

//Finder must be setup
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

  Finder.OnFind:= FinderFind;
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
    {if opSrShowMsg2 then
      MsgWarn(DKLangConstW('FF0'), Handle)
    else}
      AErrorMode:= 1;
  end;
  //-------------
  procedure MsgNoLines;
  begin
    {if opSrShowMsg2 then
      MsgWarn(DKLangConstW('FF0_'), Handle)
    else}
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
    SynDir:= Self.SynDir;
    SynIniDir:= Self.SynIniDir;
    SRCurrentDir:= SExtractFileDir(CurrentFrame.FileName);
    SRCurrentFile:= SExtractFileName(CurrentFrame.FileName);
    SRCount:= opSaveSRHist;
    SRIni:= SynIni;
    SRIniS:= SynIni;
    SR_SuggestedSel:= '';
    ShFind:= ShFor(smFindDialog);
    ShReplace:= ShFor(smReplaceDialog);
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

      //if dir exists, break and start work,
      //if not then goto ShowModal
      edDir.Text:= WideExcludeTrailingBackslash(edDir.Text);
      if IsDirExist(edDir.Text) then
        Break
      else
        ShowErr(DKLangConstW('MNFoundFold'));
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

    ShowProgress(proFindFiles);
    try
      FFindToList(FListFiles, edDir.Text, edFileInc.Text, edFileExc.Text,
        cbSubDir.Checked, cbNoRO.Checked, cbNoHid.Checked, cbNoHid2.Checked);
      if StopFind then
      begin
        HideProgress;
        RestoreFinder;
        Exit
      end;
    except
      on E: Exception do
      begin
        MsgExcept('Error on searching for files', E, Handle);
        HideProgress;
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
          HideProgress;
          RestoreFinder;
          Exit
        end;
      end;
    except
      on E: Exception do
      begin
        MsgExcept('Error on excluding binary files', E, Handle);
        HideProgress;
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
    if cbCase.Checked then Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if cbWords.Checked then Finder.Flags:= Finder.Flags + [ftWholeWordOnly];
    if cbRE.Checked then Finder.Flags:= Finder.Flags + [ftRegularExpr];
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
      ClearTreeFind;
    UpdateTreeInit(Finder.FindText, ADir);
    UpdOut(tbFind);
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
        HideProgress;
        MsgExcept('Error on finding in files', E, Handle);
        Exit
      end;
    end;

    //if "Find in files" stopped
    if StopFind then
    begin
      UpdateTreeFind(Finder.FindText, ADir, true);
      goto _Exit;
    end;

    //show "Find in files" report in Output pane
    if FTreeRoot=nil then
      raise Exception.Create('TreeRoot nil');
    if FTreeRoot.GetFirstChild=nil then
    begin
      UpdateTreeFind(Finder.FindText, ADir, false);
      MsgNoLines;
    end
    else
    begin
      UpdateTreeFind(Finder.FindText, ADir, false);
      if AToTab then
      begin
        CopyFindResultToTab(true, AFnOnly);
      end
      else
      begin
        ANeedFocusResult:= true;
        UpdOut(tbFind);
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
      ClearTreeFind;
    ANodeText:= WideFormat(DKLangConstW('O_fnode_r'),
        [Finder.FindText, Finder.ReplaceText, ADir]);
    FTreeRoot:= TreeFind.Items.Add(nil, ANodeText);

    UpdOut(tbFind);
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
            UpdateTreeReplace(ANodeText, ACountFiles, ACountMatches, false);
            FTreeRoot.Expand(false);

            TreeFind.Selected:= TreeFind.Items.AddChild(FTreeRoot,
              FListFiles[i] + Format(' (%d)', [Finder.Matches]));
              //todo: make adding with prefix+str, using FinderFind
          end;
        except
          on E: Exception do
            MsgExcept('Error on adding result'#13+FListFiles[i], E, Handle);
        end;    

        //if "Replace in files" stopped
        if IsProgressStopped(i+1, FListFiles.Count) then
        begin
          HideProgress;
          UpdateTreeReplace(ANodeText, ACountFiles, ACountMatches, true);
          Break;
        end;
      end;
    except
      on E: Exception do
      begin
        HideProgress;
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
        CopyFindResultToTab(true, true{AFnOnly=true for replace});
      end
      else
      begin
        ANeedFocusResult:= true;
        UpdOut(tbFind);
        plOut.Show;
      end;
    end;
  end;

  //"Find/Replace in files" work is finished,
  //now a) exit or b) show red error line and goto ShowModal

  if (AErrorMode>0) or (not ACloseAfter) then
  begin
    HideProgress;
    goto _Show;
  end;

  //restore finder
  _Exit:
  HideProgress;
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

procedure TfmMain.MarkAll(const s: Widestring);
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
  Finder.FindText:= s;
  Finder.ReplaceText:= '';
  Finder.Flags:= [ftEntireScope, ftWholeWordOnly];
  if opSmartHiCase then
    Finder.Flags:= Finder.Flags + [ftCaseSensitive];
  Finder.OnAfterExecute:= nil;
  Finder.OnBeforeExecute:= nil;
  Finder.OnNotFound:= nil;

  //find
  Finder.FindAll;
  MsgFound;

  //restore finder
  Finder.Flags:= OFl;
  Finder.FindText:= OTxt;
  Finder.ReplaceText:= OTxt2;
  Finder.OnAfterExecute:= ON1;
  Finder.OnBeforeExecute:= ON2;
  Finder.OnNotFound:= ON3;
end;

procedure TfmMain.HiliteSmart;
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

  {
  //Selection must be whole word (like N++)
  with Ed do
    if WordAtPos(StrPosToCaretPos(SelStart)) <> s then Exit;
  }
  //Selection is 1 word
  for i:= 1 to Length(s) do
    if not (IsWordChar(s[i]) or (s[i]='#')) then Exit;
    
  MarkAll(s);
  UpdateMicroMap(CurrentFrame);
end;

procedure TfmMain.TimerSelTimer(Sender: TObject);
begin
  TimerSel.Enabled:= false;
  if opSmartHi then
    HiliteSmart;
end;

procedure TfmMain.TimerBracketsTimer(Sender: TObject);
begin
  TimerBrackets.Enabled:= false;
  HiliteBrackets;
end;

procedure TfmMain.TBXItemCtxCopyAppendClick(Sender: TObject);
begin
  ecCopyApp.Execute;
end;

procedure TfmMain.TBXItemCtxCutAppendClick(Sender: TObject);
begin
  ecCutApp.Execute;
end;

procedure TfmMain.ecCopyAsHTMLExecute(Sender: TObject);
var Exp: THTMLSyntExport;
begin
  Exp:= THTMLSyntExport.Create(nil);
  try
   Exp.SyntMemo:= CurrentEditor;
   Exp.ExportType:= etSelection;
   Exp.SaveToClipboard;
  finally
   Exp.Free;
  end;
end;

procedure TfmMain.ecCopyAppExecute(Sender: TObject);
begin
  with TntClipboard do
    AsWideText:= AsWideText + CurrentEditor.SelText;
end;

procedure TfmMain.ecCutAppExecute(Sender: TObject);
begin
  ecCopyApp.Execute;
  CurrentEditor.ClearSelection;
end;

procedure TfmMain.TBXSubmenuItemEdPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var
  en, ro: boolean;
begin
  en:= CurrentEditor.HaveSelection;
  ro:= CurrentEditor.ReadOnly;
  
  ////Need enabled items for S/R dialog:
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
  ecJoinLines.Enabled:= en and not ro;
  ecSplitLines.Enabled:= not ro;

  TBXItemEFillBlock.Enabled:= en and not ro;
  TBXItemEColumn.Enabled:= en and not ro;
  TBXItemEInsText.Enabled:= not ro;
  TbxItemEZenExpand.Enabled:= not ro;
  TbxItemEZenWrap.Enabled:= not ro;
  TbxItemEToggleLineComment.Enabled:= not ro;
  TbxItemEToggleStreamComment.Enabled:= not ro;
end;

procedure TfmMain.TBXItemT9Click(Sender: TObject);
begin
  RunTool(9);
end;

procedure TfmMain.TBXItemT10Click(Sender: TObject);
begin
  RunTool(10);
end;

procedure TfmMain.TBXItemT11Click(Sender: TObject);
begin
  RunTool(11);
end;

procedure TfmMain.TBXItemT12Click(Sender: TObject);
begin
  RunTool(12);
end;

procedure TfmMain.TBXItemSGoBracketClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(smChangeRangeSide);
end;

procedure TfmMain.plOutResize(Sender: TObject);
begin
  plOut.Invalidate;
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
  DoRepaintTBs;
  DoRepaintTBs2;
end;

procedure TfmMain.plOutVisibleChanged(Sender: TObject);
begin
  FixSplitters;
  ecShowOut.Checked:= plOut.Visible;
  if not plOut.Visible then //Apply when X icon pressed
    FOutVisible:= false;
  SyncMapPos;
end;

procedure TfmMain.ListOutDblClick(Sender: TObject);
begin
  with ListOut do
   if (ItemIndex>=0) and (ItemIndex<Items.Count) then
     ListOutNav(Items[ItemIndex]);
end;

procedure TfmMain.ListOutNav(const s: Widestring);
var
  fn: Widestring;
  n_line, n_col: Integer;
begin
  if s='' then Exit;

  fn:= FCurrToolFN;
  with opTools[FCurrTool] do
    SParseOut(s, ToolOutRegex, ToolOutNum_fn, ToolOutNum_line, ToolOutNum_col, fn, n_line, n_col);

  if fn='' then Exit;
  if n_line<=0 then Exit;
  if n_col<=0 then n_col:= 1;

  //correct fn
  if (SExtractFilePath(fn)='') and (CurrentFrame.FileName<>'') then
    fn:= SExtractFilePath(CurrentFrame.FileName)+fn;
  if not IsFileExist(fn) then
    begin MsgError(WideFormat(DKLangConstW('O_fne'), [fn]), Handle); Exit end;

  DoOpenFile(fn); //must activate tab too
  FocusEditor;
  CurrentEditor.CaretPos:= Point(n_col-1, n_line-1);
end;

procedure TfmMain.DoHandleKeysInPanels(var Key: Word; Shift: TShiftState);
var
  sh: TShortcut;
  i: integer;
begin
  sh:= Shortcut(Key, Shift);
  if sh=0 then Exit;

  //Next/prev mass search result
  if IsSh(sh, sm_GotoNextFindResult) then
  begin
    ecGotoNextFindResult.Execute;
    Key:= 0;
    Exit
  end;
  if IsSh(sh, sm_GotoPrevFindResult) then
  begin
    ecGotoPrevFindResult.Execute;
    Key:= 0;
    Exit
  end;

  //Focus commands
  if IsSh(sh, sm_ToggleFocusTree) then
  begin
    ecToggleFocusTree.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusValidate) then
  begin
    ecToggleFocusValidate.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusProj) then
  begin
    ecToggleFocusProject.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusMap) then
  begin
    ecToggleFocusMap.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusClip) then
  begin
    ecToggleFocusClip.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusClips) then
  begin
    ecToggleFocusClips.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusFindRes) then
  begin
    ecToggleFocusFindRes.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusOutput) then
  begin
    ecToggleFocusOutput.Execute;
    Key:= 0;
    Exit
  end;
  //
  if IsSh(sh, sm_ToggleFocusTabs) then
  begin
    ecToggleFocusTabs.Execute;
    Key:= 0;
    Exit
  end;

  //Tree next/prev/parent/next-brother/prev-brother
  if IsSh(sh, sm_TreeNext) then
  begin
    ecTreeNext.Execute;
    Key:= 0;
    Exit
  end;
  if IsSh(sh, sm_TreePrev) then
  begin
    ecTreePrev.Execute;
    Key:= 0;
    Exit
  end;
  if IsSh(sh, sm_TreeParent) then
  begin
    ecTreeParent.Execute;
    Key:= 0;
    Exit
  end;
  if IsSh(sh, sm_TreePrevBrother) then
  begin
    ecTreePrevBrother.Execute;
    Key:= 0;
    Exit
  end;
  if IsSh(sh, sm_TreeNextBrother) then
  begin
    ecTreeNextBrother.Execute;
    Key:= 0;
    Exit
  end;

  //sm_Tab0..sm_Tab9
  for i:= 0 to 9 do
    if IsSh(sh, sm_Tab0+i) then
    begin
      TabClickN(i);
      Key:= 0;
      Exit
    end;

  //sm_TreeLevel2..sm_TreeLevel9
  for i:= 2 to 9 do
    if IsSh(sh, sm_TreeLevel2+i-2) then
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
    begin ListOutDblClick(Self); Key:= 0 end;
  if (Key=vk_delete) and (Shift=[]) then
    begin TbxItemOClrClick(Self); Key:= 0 end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
    begin TbxItemOCpClick(Self); Key:= 0 end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.TBXItemOClrClick(Sender: TObject);
begin
  ListOut.Clear;
  FocusEditor;
end;

procedure TfmMain.TBXItemOCpClick(Sender: TObject);
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

procedure TfmMain.TBXItemONavClick(Sender: TObject);
begin
  with ListOut do
   if FOutItem>=0 then
    ListOutNav(Items[FOutItem]);
end;

procedure TfmMain.PopupOutPopup(Sender: TObject);
begin
  with ListOut do
  begin
    TbxItemONav.Enabled:= (FOutItem>=0) and (FOutItem<=Items.Count-1);
    TbxItemOCp.Enabled:= SelCount>0;
    TbxItemODel.Enabled:= SelCount>0;
    TbxItemODelN.Enabled:= Items.Count>0;
    TbxItemOClr.Enabled:= Items.Count>0;
    TbxItemOCpAll.Enabled:= Items.Count>0;
    TbxItemOFind.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.TBXItemOCpAllClick(Sender: TObject);
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
    ItemHeight:= Trunc(Abs(Font.Height) * 1.36);
    Height:= ItemHeight * (DropDownCount+1);
  end;
  PluginACP.ItemHeight:= ecACP.ItemHeight;
  PluginACP.Height:= ecACP.Height;
end;

procedure TfmMain.ApplyOut;
begin
  ListVal.Color:= ListOut.Color;
  ListVal.Font:= ListOut.Font;

  ListTabs.Color:= ListOut.Color;
  ListTabs.Font:= ListOut.Font;

  TreeFind.Color:= ListOut.Color;
  TreeFind.Font:= ListOut.Font;

  ListPLog.Color:= ListOut.Color;
  ListPLog.Font:= ListOut.Font;

  ListOut.ItemHeight:= Trunc(Abs(ListOut.Font.Height) * 1.36);
  ListVal.ItemHeight:= ListOut.ItemHeight;
  ListPLog.ItemHeight:= ListOut.ItemHeight;

  ListOut.Invalidate;
  ListVal.Invalidate;
  TreeFind.Invalidate;
  ListPLog.Invalidate;
  ListTabs.Invalidate;

  if Assigned(fmProj) then
  begin
    fmProj.TreeProj.Font:= ListOut.Font;
    fmProj.TreeProj.Color:= ListOut.Color;
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

function TfmMain.IsNavigatableLine(const s: Widestring): boolean;
var
  fn: Widestring;
  n_line, n_col: Integer;
begin
  //ListVal
  if (ListVal.Visible) then
    begin Result:= True; Exit end;
  //ListOut
  if (s='') or (FCurrTool<=0) then
    begin Result:= False; Exit end;

  fn:= FCurrToolFN;
  with opTools[FCurrTool] do
    SParseOut(s, ToolOutRegex, ToolOutNum_fn, ToolOutNum_line, ToolOutNum_col, fn, n_line, n_col);

  Result:= (fn<>'') and (n_line>0);
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

procedure TfmMain.TBXItemODelClick(Sender: TObject);
begin
  ListOut.DeleteSelected;
end;

procedure TfmMain.TBXItemODelNClick(Sender: TObject);
var i:Integer;
begin
  with ListOut do
    begin
    Items.BeginUpdate;
    for i:= Count-1 downto 0 do
      if not IsNavigatableLine(Items[i]) then
       Items.Delete(i);
    Items.EndUpdate;
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

procedure TfmMain.FinderFind(Sender: TObject;
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
  Ed:= (Sender as TTextFinder).Control;
  p:= Ed.StrPosToCaretPos(StartPos);
  if not ((p.y >= 0) and (p.y < Ed.Lines.Count)) then Exit;
  ColNum:= p.X;
  LineNum:= p.Y;

  S:= Copy(Ed.Lines[LineNum], 1, cMaxTreeLen); //cut so Treeview doesn't crash
  SReplaceAllW(S, #9, ' '); //replace tabs with 1 space (to not break BG hiliting) in Treeview

  Info:= TSynFindInfo.Create;
  Info.FN:= FListResFN;
  Info.LineNum:= LineNum; //LineNum - 0-based
  Info.ColNum:= ColNum-1; //ColNum - 1-based
  Info.Len:= EndPos-StartPos;

  //add node under NodeFile
  if (opMaxTreeMatches>0) and
    (Finder.Matches=opMaxTreeMatches) then
    TreeFind.Items.AddChildObject(NodeFile, '...', Info)
  else
    TreeFind.Items.AddChildObject(NodeFile,
      SFindResPrefix(FListResFN, LineNum)+S, Info);

  //scroll to last file, update
  FTreeRoot.Expand(false);
  if opSrExpand then
    TreeFind.Selected:= TreeFind.Items[TreeFind.Items.Count-1]
  else
    TreeFind.Selected:= NodeFile;
  Application.ProcessMessages;
  //Sleep(250); //debug
end;

procedure TfmMain.FinderFindBk(Sender: TObject;
  StartPos, EndPos: integer; var Accept: Boolean);
var
  Ed: TCustomSyntaxMemo;
  LineNum: integer;
begin
  Ed:= (Sender as TTextFinder).Control;
  LineNum:= Ed.StrPosToCaretPos(StartPos).Y;
  if (LineNum>=0) and (LineNum<Ed.Lines.Count) then
    if Ed.BookmarkForLine(LineNum)<0 then
      CurrentFrame.DoBkToggle(Ed, LineNum);
end;

procedure TfmMain.UpdOut(n: TSynTabOut);
begin
  FTabOut:= n;
  ListOut.Visible:= n=tbOut;
  ListVal.Visible:= n=tbVal;
  TreeFind.Visible:= n=tbFind;
  ListPLog.Visible:= n=tbPluginsLog;

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
    tbTabsOut.ActiveTabIndex:= 3;
end;

procedure TfmMain.UpdLeft(n: TSynTabLeft);
var
  IsTree, IsProj, IsTabs: boolean;
  i: Integer;
begin
  //is it plugin tab?
  if n>tbProj then
  begin
    i:= Ord(n)-cFixedLeftTabs;
    if (i>=Low(FPlugins)) and (i<=High(FPlugins)) then
      if FPlugins[i].FToolButton<>nil then
      begin
        PluginPanelItemClick(FPlugins[i].FToolButton);
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
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
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

procedure TfmMain.UpdRight(n: TSynTabRight);
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
  UpdOut(tbOut);
end;

procedure TfmMain.TBXItemOOFindClick(Sender: TObject);
begin
  UpdOut(tbFind);
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

procedure TfmMain.fCustomizeHiExecute(Sender: TObject);
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
  DoExtract;
end;

procedure TfmMain.DoExtract;
begin
  with TfmExtract.Create(Self) do
  try
    SynDir:= Self.SynDir;
    SynIni:= Self.SynIni;
    SRCount:= opSaveSRHist;
    Memo:= Self.CurrentEditor;
    case ShowModal of
      mrYes:
      begin
        FNew.Execute;
        Frames[FrameCount-1].EditorMaster.Text:= List.Items.Text;
      end;
    end;
  finally
    Release;
  end;
end;

procedure TfmMain.PopupCPPopup(Sender: TObject);
begin
  UpdateCPMenu(PopupCP);
end;

procedure TfmMain.UpdateCPMenu(M: TObject; AConvEnc: boolean = false);
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
        MI.OnClick:= ConvEncoding
      else
        MI.OnClick:= SetEncoding;
      MI.RadioItem:= true;
      MI.Checked:= GetCP(CurrentFrame) = Tag;
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
        MI.OnClick:= ConvEncoding
      else
        MI.OnClick:= SetEncoding;
      MI.RadioItem:= true;
      MI.Checked:= GetCP(CurrentFrame) = Tag;
      if not IsUnicode then
        MI.Enabled:= EncOK(Tag);
      M.Add(MI);
    end;
  end;

  function AddSub(const s: Widestring): TSpTbxSubmenuItem;
  begin
    Result:= TSpTbxSubmenuItem.Create(Self);
    Result.Caption:= EncLocal(S);
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

  //Read CP.cfg
  SS:= TStringList.create;
  SK:= TStringlist.create;
  Ini:= TMemIniFile.Create(SynDir + 'CP.cfg');
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

function TfmMain.GetCP(F: TEditorFrame): integer;
begin
  case F.TextSource.Lines.TextCoding of
    tcUTF8:
    begin
      if F.SkipSign then
        Result:= cp__UTF8_noBOM
      else
        Result:= cp__UTF8;
    end;
    tcUnicode:
      Result:= cp__Unicode;
    tcSwapUnicode:
      Result:= cp__UnicodeBE;
    tcAnsi:
      Result:= F.TextSource.Lines.Codepage;
    else
      Result:= cp_ACP;
  end;
end;

function TfmMain.EncLocal(const s: Widestring): Widestring;
var
  SL: Widestring;
  n:Integer;
begin
  Result:= s;
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

procedure TfmMain.TBXItemZSetClick(Sender: TObject);
begin
  CurrentEditor.Zoom:= (Sender as TSpTbxItem).Tag;
  TemplateEditor.Zoom:= CurrentEditor.Zoom;
  StatusItemZoom.Caption:= IntToStr(CurrentEditor.Zoom) + '%';
end;

procedure TfmMain.TBXItemZOtherClick(Sender: TObject);
var
  s: Widestring;
  n: Integer;
begin
  S:= '';
  if MsgInput('ZmIn', S) then
  begin
    n:= StrToIntDef(S, 0);
    if (n >= 20) and (n <= 500) then
    begin
      CurrentEditor.Zoom:= n;
      TemplateEditor.Zoom:= CurrentEditor.Zoom;
      StatusItemZoom.Caption:= IntToStr(CurrentEditor.Zoom) + '%';
    end;
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
    ApplyOut;

    //load clips
    InitClips(SynClipsDir);
    //restore recent clip
    with TIniFile.Create(SynIni) do
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
  if Assigned(fmProj) then Exit;
  fmProj:= TfmProj.Create(Self);
  with fmProj do
  begin
    Parent:= plTree;
    Align:= alClient;
    BorderStyle:= bsNone;
    FSynDir:= Self.SynDir;
    //
    TreeProj.Font.Assign(Tree.Font);
    TreeProj.Color:= Tree.Color;
    tbProject.ChevronHint:= tbQS.ChevronHint;
    //
    OnFileOpen:= ProjFileOpen;
    OnAddEditorFile:= ProjAddEditorFile;
    OnAddEditorFilesAll:= ProjAddEditorFiles;
    OnGetLexers:= ProjGetLexers;
    OnGetWorkDir:= ProjGetWorkDir;
    OnGetProjDir:= ProjGetProjDir;
    OnSetProjDir:= ProjSetProjDir;
    OnLoadMRU:= ProjLoadMRU;
    OnUpdateMRU:= ProjUpdateMRU;
    //
    Show;
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
    ApplyMap;
    Show;
  end;
end;

procedure TfmMain.plClipResize(Sender: TObject);
begin
  plClip.Invalidate;
  if Assigned(fmClip) then
    fmClip.ListClip.Invalidate;
  tbViewMove(Self);
end;

procedure TfmMain.plClipVisibleChanged(Sender: TObject);
begin
  FixSplitters;
  ecShowClip.Checked:= plClip.Visible;
end;

procedure TfmMain.ecShowClipExecute(Sender: TObject);
begin
  with plClip do
    Visible:= not Visible;
  if not plClip.Visible then
    FocusEditor;
  DoRepaintTBs;
  DoRepaintTBs2;
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

procedure TfmMain.TBXItemESyncEdClick(Sender: TObject);
begin
  with CurrentEditor do
    if SyncEditing.Count>0 then
    begin
      SyncEditing.Clear;
      Invalidate;
    end
    else
    begin
      if SelLength>0 then
      begin
        SyncEditing.Clear;
        SyncEditing.AddCurSelection;
        SyncEditing.Enabled:= true;
      end
      else
        MsgBeep;
    end;
end;


procedure TfmMain.DoFindBrackets(var Pos1, Pos2: Integer);
begin
  with CurrentEditor do
  begin
    SFindBrackets(Lines.FText, CaretStrPos+1, Pos1, Pos2);
    Dec(Pos1);
    Dec(Pos2);
  end;
end;

function TfmMain.DoFindOpeningBracket: Integer;
begin
  with CurrentEditor do
    Result:= SFindOpeningBracket(Lines.FText, CaretStrPos+1)-1;
end;

procedure TfmMain.DoBracketJump;
var
  n1, n2: Integer;
begin
  DoFindBrackets(n1, n2);
  if n2>=0 then
    CurrentEditor.CaretStrPos:= n2
  else
    MsgBeep;
end;

procedure TfmMain.HiliteBrackets;
var
  n1, n2: Integer;
begin
  if CurrentEditor<>nil then
    with CurrentEditor do
    begin
      SelAttributes.Enabled:= opBracketHi;
      if not opBracketHi then
      begin
        //Invalidate needed to prevent bug: "Current line hiliting" leaves on multiple lines,
        //with SelectModeDefault=msColumn
        Invalidate;
        Exit;
      end;

      SelAttributes.ClearFormat;
      if HaveSelection then Exit;
      DoFindBrackets(n1, n2);
      if n2<0 then Exit;

      FLockUpdate:= true;
      BeginUpdate;
      try
        SetSelection(n1, 1, True);
        if opColorBracket<>clNone then
          SelAttributes.Color:= opColorBracket;
        if opColorBracketBg<>clNone then
          SelAttributes.BgColor:= opColorBracketBg;
        SelAttributes.Bold:= true;

        SetSelection(n2, 1, True);
        if opColorBracket<>clNone then
          SelAttributes.Color:= opColorBracket;
        if opColorBracketBg<>clNone then
          SelAttributes.BgColor:= opColorBracketBg;
        SelAttributes.Bold:= true;

        ResetSelection;
      finally
        EndUpdate;
        FLockUpdate:= false;
      end;
    end;
end;

procedure TfmMain.TBXItemFSesAddClick(Sender: TObject);
begin
  {//No need for "Add session":
  if not AskSession(true) then
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
  case opBak of
    1:
      begin
      Dest:= FAppDataPath + 'SynWrite\Backup';
      WideForceDirectories(Dest);
      Dest:= Dest+'\'+WideExtractFileName(AFileName);
      end;
    2:
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
    0:
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
    SetHint(DKLangConstW('MNFoundFold')+': '+Result);
    MsgBeep;
    Result:= 'C:\';
  end;
end;

function TfmMain.LastDir_UntitledFile: Widestring;
begin
  with TIniFile.Create(SynIni) do
  try
    Result:= UTF8Decode(ReadString('Hist', 'DirUntitled', ''));
  finally
    Free
  end;

  if Result='' then
    Result:= opLastDirPath;
  if (Result<>'') and not IsDirExist(Result) then
  begin
    SetHint(DKLangConstW('MNFoundFold')+': '+Result);
    MsgBeep;
    Result:= 'C:\';
  end;
end;

procedure TfmMain.SaveLastDir_UntitledFile(const FN: Widestring);
begin
  with TIniFile.Create(SynIni) do
  try
    WriteString('Hist', 'DirUntitled', UTF8Encode(WideExtractFileDir(FN)));
  finally
    Free
  end;
end;

procedure TfmMain.SaveLastDir(const FN, Filter: Widestring; FilterIndex: integer);
begin
  if opLastDir<>1 then Exit;
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

procedure TfmMain.ApplyEd2;
var
  i: Integer;
begin
  //must add code to ecExports unit
  ecExports.ecCanFixBlocks:= opFixBlocks;

  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      //apply "Show wrap mark"
      EditorMaster.Gutter.LineBreakObj:= IfThen(opShowWrapMark, 0, -1);
      EditorSlave.Gutter.LineBreakObj:= EditorMaster.Gutter.LineBreakObj;
      //apply non-printed
      EditorNonPrintUpdate(EditorMaster);
      EditorNonPrintUpdate(EditorSlave);
    end;
end;

procedure TfmMain.ApplyFonts;
begin
  TemplateEditor.HorzRuler.Height:=
    5 + Round(Abs(TemplateEditor.HorzRuler.Font.Height) *
      TemplateEditor.Zoom / 100);

  if Assigned(fmProj) then
  begin
    fmProj.TreeProj.Font.Assign(Tree.Font);
    fmProj.TreeProj.Color:= Tree.Color;
  end;
end;

procedure TfmMain.ApplyColors;
begin
  PageControl.Invalidate;
  ListOut.Invalidate;
  TreeFind.Invalidate;
  ListVal.Invalidate;
  ListPLog.Invalidate;
  Splitter1.Invalidate;

  ApplyFrames;

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

procedure TfmMain.DoDupLine(Ed: TSyntaxMemo);
var
  n, nn: Integer;
  s: ecString;
begin
  with Ed do
  if SelLength>0 then
  begin
    n:= SelStart;
    nn:= SelLength;
    s:= SelText;
    SetSelection(n, 0);
    InsertText(s);
    SetSelection(n, nn);
  end
  else
  try
    Ed.BeginUpdate;
    AddLineToEnd(Ed);
    Ed.DuplicateLine(Ed.CaretPos.Y);
    Ed.ExecCommand(smDown);
    EditorSetModified(Ed);
  finally
    Ed.EndUpdate;
  end;
end;

(*
procedure TfmMain.DoSelWordJump(ANext: boolean);
var
  n, Len, nn: Integer;
  Rt: boolean;
begin
  with CurrentEditor do
  begin
    n:= SelStart;
    Len:= SelLength;
    Rt:= (Len=0) or (CaretStrPos<>n); //Move right edge of selection
    DoWordJump(ANext);
    nn:= CaretStrPos;
    if Rt then
    begin
      if nn>=n then
        SetSelection(n, nn-n, True)
      else
        SetSelection(nn, n-nn, True);
    end
    else
    begin
      if nn<=n+Len then
        SetSelection(nn, n+Len-nn, True)
      else
        SetSelection(n+Len, nn-(n+Len), True);
    end;
  end;
end;
*)

procedure TfmMain.AddLineToEnd(E: TSyntaxMemo);
var n:Integer;
begin
  //Fix: last line must be with EOL
  with E do
    if (CaretPos.Y = Lines.Count-1) and (Lines[Lines.Count-1]<>'') then
    begin
      n:= CaretStrPos;
      CaretStrPos:= TextLength;
      InsertNewLine(0, True, false);
      CaretStrPos:= n;
    end;
end;

procedure TfmMain.ecFullScrExecute(Sender: TObject);
begin
  FullScr:= not FullScr;
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
  if FullScr then
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

(*
procedure TfmMain.SDTypeChange(Sender: TObject);
var ext: Widestring;
begin
  Exit;//TODO
  with SD do
  begin
    if FileName='' then Exit;
    ext:= '.' + SFilterIdxToExt(Filter, FilterIndex);
    if WideExtractFileExt(FileName)='' then
      FileName:= FileName+ ext
    else
      FileName:= WideChangeFileExt(FileName, ext);
  end;
end;
*)

procedure TfmMain.FocusEditor;
var
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Self.Enabled then
    if (Ed<>nil) and Ed.CanFocus then
      Ed.SetFocus;
end;

procedure TfmMain.DoClearHistory;
begin
  with TIniFile.Create(SynIni) do
  try
    EraseSection('SearchText');
    EraseSection('RHist');
    EraseSection('IncHist');
    EraseSection('DirHist');
    EraseSection('ExHist');
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

procedure TfmMain.TBXItemTbCpFNClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFileName);
end;

procedure TfmMain.TBXItemTbCpFullClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFullName);
end;

procedure TfmMain.TBXItemTbCpDirClick(Sender: TObject);
begin
  DoCopyFilenameToClipboard(FClickedFrame, scmdCopyFilePath);
end;

procedure TfmMain.ApplyIntf;
begin
  UpdateTabs(PageControl);
  if PageControl.PageCount=1 then
    PageControl.ActivePageIndex:= 0;
end;

procedure TfmMain.PageControl1Enter(Sender: TObject);
begin
  FPageControl:= PageControl1;
  FrameChanged;
  //draw tab line
  PageControl1.Invalidate;
  PageControl2.Invalidate;
end;

procedure TfmMain.PageControl2Enter(Sender: TObject);
begin
  FPageControl:= PageControl2;
  FrameChanged;
  //draw tab line
  PageControl1.Invalidate;
  PageControl2.Invalidate;
end;

procedure TfmMain.Splitter1Paint(Sender: TObject);
const
  c=3;//Size of dot
  cc=8;//Num of dots
  procedure D(Y: integer);
  begin
    with Sender as TSplitter do
    begin
      Canvas.Pen.Color:= clGray;
      Canvas.Rectangle(1, y, 1+c, y+c);
    end;
  end;
  procedure DH(X: integer);
  begin
    with Sender as TSplitter do
    begin
      Canvas.Pen.Color:= clGray;
      Canvas.Rectangle(x, 1, x+c, 1+c);
    end;
  end;
var
  i: integer;
begin
  with Sender as TSplitter do
  begin
    Color:= opColorSplitViews;
    if FSplitHorz then
    begin
      for i:= 0 to cc-1 do
        DH((Width - cc*(c+1)) div 2 + (c+1)*i)
    end
    else
    begin
      for i:= 0 to cc-1 do
        D((Height - cc*(c+1)) div 2 + (c+1)*i);
    end;
    {
    Canvas.Brush.Color:= clBlack;
    y:= 8;
    Canvas.Polygon([Point(1+c, y), Point(1+c, y+c*2), Point(1, y+c)]);
    y:= Height-12;
    Canvas.Polygon([Point(1, y), Point(1, y+c*2), Point(1+c, y+c)]);
    }
  end;
end;

procedure TfmMain.TBXItemTbMoveToViewClick(Sender: TObject);
begin
  DoMoveTabToOtherView(FPagesNTabCtx);
end;

function TfmMain.PagesEmpty(P: TTntPageControl): boolean;
var
  F: TEditorFrame;
begin
  if P.PageCount=0 then
    begin Result:= true; Exit end;
  if P.PageCount>1 then
    begin Result:= false; Exit end;
  F:= PagesToFrame(P, 0);
  Result:= (not F.Modified) and (F.FileName = '');
end;


procedure TfmMain.DoMoveTabToOtherView(NTab: integer);
var
  Page_S, Page_D: TTntPageControl;
  tab: TTntTabSheet;
  Frame, F2: TEditorFrame;
begin
  if NTab<0 then
    NTab:= PageControl.ActivePageIndex;
  if NTab<0 then
    begin MsgBeep; Exit; end;
  Frame:= Frames[NTab];
  {
  if (not Frame.Modified) and (Frame.FileName='') then
    begin MsgBeep; Exit; end;
    }

  Page_S:= PageControl;
  if Page_S=PageControl1 then
    Page_D:= PageControl2
  else Page_D:= PageControl1;

  //msg(format('p %d tab %d', [1+Ord(Page_S=Pagecontrol2), NTab]));

  //if other view's last tab empty, delete it
  if Page_D.PageCount>0 then
  begin
    tab:= Page_D.Pages[Page_D.PageCount-1] as TTntTabSheet;
    F2:= tab.Controls[0] as TEditorFrame;
    if (not F2.Modified) and (F2.FileName = '') then
    begin
      FreeAndNil(F2);
      FreeAndNil(tab);
    end;
  end;

  //create Dest tab
  tab:= TTntTabSheet.Create(Self);
  tab.PageControl:= Page_D;
  tab.Caption:= Frame.Title;
  Frame.Parent:= tab;

  Page_S.Pages[NTab].Free;
  if Page_S.PageCount=0 then
    FNew.Execute;
  Page_S.Invalidate; //To draw themed bkgnd

  PageControl:= Page_D;
  UpdateTabs(Page_D);
  UpdateTabs(Page_S);
  CurrentFrame:= Frame;
  FocusEditor;

  with Page_S do
    if ActivePageIndex<0 then
      ActivePageIndex:= 0;
  //msg(format('p %d a %d', [Page_S.PageCount, Page_S.ActivePageIndex]));

  //update lists
  PageControl:= Page_S;
  UpdateTabList(PageControl.ActivePageIndex, -1, NTab);
  PageControl:= Page_D;
  UpdateTabList(PageControl.ActivePageIndex, -1, -1);
end;

procedure TfmMain.Splitter1Moved(Sender: TObject);
begin
  if FSplitHorz then
    FSplitter:= PageControl2.Height * 100 / (Panel1.Height - Splitter1.Height)
  else
    FSplitter:= PageControl2.Width * 100 / (Panel1.Width - Splitter1.Width);
end;

procedure TfmMain.SetSplitter(const F: Double);
begin
  if FSplitHorz then
    PageControl2.Height:= Trunc((Panel1.Height - Splitter1.Height) * F / 100.0)
  else
    PageControl2.Width:= Trunc((Panel1.Width - Splitter1.Width) * F / 100.0);
end;

procedure TfmMain.DoSplitterPos(const Pos: Double);
begin
  if Splitter1.Visible then
  begin
    FSplitter:= Pos;
    SetSplitter(FSplitter);
  end;
end;


procedure TfmMain.TBXItemSp50Click(Sender: TObject);
begin
  ecSplit50_50.Execute;
end;

procedure TfmMain.TBXItemTbCloseAllClick(Sender: TObject);
begin
  fCloseAll.Execute;
end;

function TfmMain.GetPageControl: TTntPageControl;
begin
  if FPageControl=nil then
    FPageControl:= PageControl1;
  Result:= FPageControl;
end;

procedure TfmMain.TBXItemSpHorzClick(Sender: TObject);
begin
  ecSplitViewsVertHorz.Execute;
end;

procedure TfmMain.ecSplitViewsVertHorzExecute(Sender: TObject);
begin
  if not PageControl2.Visible then Exit;
  FSplitHorz:= not FSplitHorz;
  if FSplitHorz then
  begin
    PageControl2.Align:= alBottom;
    Splitter1.Align:= alBottom;
    Splitter1.Top:= 5;
  end
  else
  begin
    PageControl2.Align:= alRight;
    Splitter1.Align:= alRight;
    Splitter1.Left:= 5;
  end;
  SetSplitter(FSplitter);
end;

procedure TfmMain.PopupSplitterPopup(Sender: TObject);
begin
  TBXItemSpHorz.Checked:= FSplitHorz;
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
  EdSrc: TSyntaxMemo;
  var EdOther: TSyntaxMemo;
  var DiffY: Integer;
  var View1st: boolean);
var
  PagesSrc, PagesOther: TTntPageControl;
  F: TEditorFrame;
begin
  EdOther:= nil;
  DiffY:= 0;

  //parents are:
  //Editor->Panel1->Frame->TabSheet->PageControl
  PagesSrc:= (((EdSrc.Parent.Parent as TEditorFrame).Parent as TTntTabSheet).Parent as TTntPageControl);
  View1st:= PagesSrc=PageControl1;

  if View1st then
    PagesOther:= PageControl2
  else
    PagesOther:= PageControl1;

  F:= PagesToFrame(PagesOther, PagesOther.ActivePageIndex);
  if F=nil then Exit;

  EdOther:= F.EditorMaster;
  DiffY:= EdOther.TopLine - EdSrc.TopLine;
  if not View1st then
    DiffY:= -DiffY;
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

procedure TfmMain.Panel1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  FPagesNTab:= -1;
end;

procedure TfmMain.TBXItemOShellClick(Sender: TObject);
var i: Integer;
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
      if opStartRO then RO;
    if QuickView then
      if opListerQVReadOnly then RO else NoRO;
  end
  else
  begin
    //consider option
    if opStartRO then RO;
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
  OnTop:= not OnTop;
  ecOnTop.Checked:= OnTop;
end;

procedure TfmMain.tbMenuShortCut(var Msg: TWMKey; var Handled: Boolean);
begin
  if Assigned(fmSR) and fmSR.Active then
  begin
    Handled:= fmSR.IsShortCut(Msg);
    Exit
  end;
end;

//Do like Delphi: go down after
procedure TfmMain.DoCommentLines(Comm: boolean);
var
  b: boolean;
begin
  with CurrentEditor do
  begin
    b:= HaveSelection;
    LineComments(Comm);
    if not b then
      ExecCommand(smDown);
  end;
end;

procedure TfmMain.TBXItemEFillBlockClick(Sender: TObject);
begin
  DoFillBlock;
end;

procedure TfmMain.DoFillBlock;
var
  Ed: TSyntaxMemo;
  R: TRect;
  OldCaret: TPoint;
  i, nLen: Integer;
  s, sData: ecString;
  bKeep: boolean;
begin
  Ed:= CurrentEditor;
  with Ed do
  begin
    if ReadOnly then Exit;
    if not HaveSelection then Exit;
    if SelectMode <> msColumn then
      begin MsgWarn(DKLangConstW('vert'), Handle); Exit end;

    with TfmFillBlock.Create(Self) do
    try
      if ShowModal<>mrOk then Exit;
      sData:= edLine.Text;
      bKeep:= cbKeepWidth.Checked;
    finally
      Free
    end;

    R:= SelRect;
    OldCaret:= CaretPos;
    if bKeep then
    begin
      if Length(sData) > R.Right - R.Left then
        SetLength(sData, R.Right - R.Left);
      nLen:= Length(sData);
    end
    else
      nLen:= R.Right - R.Left;

    BeginUpdate;
    try
      for i:= R.Top to R.Bottom do
      begin
        s:= Lines[i];

        //expand tabs to spaces
        if Pos(#9, s)>0 then
        begin
          SReplaceAllW(s, #9, CurrentTabExpansion(Ed));
          DoReplaceLine(Ed, i, s, true{ForceUndo});
        end;

        //fill line tail with spaces
        if Length(s)<R.Right then
        begin
          CaretPos:= Point(Length(s), i);
          InsertText(StringOfChar(' ', R.Right-Length(s)));
        end;

        //replace block line
        ReplaceText(
          CaretPosToStrPos(Point(R.Left, i)),
          nLen, sData);
      end;

      if bKeep then
        nLen:= R.Right - R.Left
      else
        nLen:= Length(sData);

      CaretPos:= Point(R.Left + nLen, OldCaret.Y);
      SelRect:= Rect(R.Left, R.Top, R.Left + nLen, R.Bottom);
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfmMain.TBXItemEInsTextClick(Sender: TObject);
begin
  DoInsertTextDialog;
end;

procedure TfmMain.DoInsertTextDialog;
type
  TMode=(mTxt, mNum, mBul);
  TPos=(pCol, pAfterSp, pAfterStr);
var
  InsMode: TMode;
  InsPos: TPos;
  txt1, txt2, s: ecString;
  InsCol: integer;
  InsStrAfter: ecString;
  SkipEmpty: boolean;
  i, n, iFrom, iTo, iCnt: integer;
  NStart, NDigits: integer;
  NBegin, NTail: ecString;
  IsSel: boolean;
  NCounter: integer;
  {
  _SelStart, _SelLen: integer;
  _SelRect: TRect;
  _CaretPos: TPoint;
  }
  Ed: TSyntaxMemo;
begin
  Ed:= CurrentEditor;
  if Ed=nil then Exit;
  if Ed.ReadOnly then Exit;
  DoGetSelLines(Ed, iFrom, iTo);
  IsSel:= iTo > iFrom;

  with TfmInsTxt.Create(nil) do
  try
    SIni:= Self.SynIni;
    SetMode(IsSel);
    if ShowModal<>mrOk then Exit;
    txt1:= ed1.Text;
    txt2:= ed2.Text;
    if bText.Checked then InsMode:= mTxt else
     if bNumber.Checked then InsMode:= mNum else
      InsMode:= mBul;
    if bAtCol.Checked then InsPos:= pCol else
     if bAfterSp.Checked then InsPos:= pAfterSp else
      InsPos:= pAfterStr;
    InsCol:= edCol.Value;
    InsStrAfter:= edStrAfter.Text;
    SkipEmpty:= cbSkip.Checked;
    NStart:= edStart.Value;
    NDigits:= edDigits.Value;
    NTail:= edTail.Text;
    NBegin:= edBegin.Text;
    NCounter:= edCounter.Value;
  finally
    Release
  end;

  with Ed do
  begin
    {
    //save sel
    _SelStart:= SelStart;
    _SelLen:= SelLength;
    _SelRect:= SelRect;
    _CaretPos:= CaretPos;
    }
    ResetSelection;

    //msg(format('%d %d', [iFrom, iTo]));
    BeginUpdate;
    FrameOfEditor(Ed).LockMapUpdate:= true;
    try
      iCnt:= 0;
      if not IsSel then
      begin
        //----counter times inserting
        for i:= 1 to NCounter do
        begin
          case InsMode of
            mTxt: S:= txt1 + txt2;
            mBul: S:= WideString(#$2022) + ' ';
            mNum: S:= NBegin + SFormatNum(NStart+i-1, NDigits) + NTail;
            else S:= '';
          end;//case
          InsertText(
            StringOfChar(' ', InsCol-1)
            + S + CurrentCR);
        end;
      end
      else
      //----insert into selection
      for i:= iFrom to iTo do
      begin
        if (Lines[i]='') and SkipEmpty then
          Continue;
        Inc(iCnt);

        //Put caret
        case InsPos of
          pCol:
            begin
              CaretPos:= Point(InsCol-1, i);
              //handle "Keep caret in text"
              if soKeepCaretInText in Ed.Options then
                if CaretPos.X<InsCol-1 then
                  InsertText(StringOfChar(' ', (InsCol-1)-CaretPos.X));
            end;
          pAfterSp:
            begin
              CaretPos:= Point(SNumLeadSpaces(Lines[i]), i);
            end;  
          else
            begin
              n:= Pos(InsStrAfter, Lines[i]);
              if n=0 then Continue;
              CaretPos:= Point(n-1+Length(InsStrAfter), i);
            end;
        end;

        case InsMode of
        //Text
        mTxt:
          begin
            if txt1<>'' then
            begin
              InsertText(txt1);
            end;
            if txt2<>'' then
            begin
              CaretPos:= Point(Length(Lines[i]), i);
              InsertText(txt2);
            end;
          end;
        //Bullets
        mBul:
          begin
            InsertText(WideString(#$2022) + ' ');
          end;
        //Nums
        mNum:
          begin
            s:= NBegin + SFormatNum(NStart+iCnt-1, NDigits) + NTail;
            InsertText(s);
          end;
        end;//case
      end;
    finally
      EndUpdate;
      FrameOfEditor(Ed).LockMapUpdate:= false;
    end;

    {
    //restore sel
    CaretPos:= _CaretPos;
    if _SelLen>0 then
      SetSelection(_SelStart, _SelLen, true)
    else
      SelRect:= _SelRect;
      }
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
  fOpenBySelection.Execute;
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
  if CurrentFrame.TextSource.SyntaxAnalyzer<>nil then
    ext:= CurrentFrame.TextSource.SyntaxAnalyzer.Extentions
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
    if IsFileText(fn) or MsgConfirmBinary(fn) then
    begin
      DoOpenFile(fn);
      if LnNum > 0 then
        CurrentEditor.CaretPos:= Point(0, LnNum-1);
    end;
  end;
end;

procedure TfmMain.TBXItemFEmailClick(Sender: TObject);
begin
  with CurrentFrame do
    if FileName<>'' then
      FSendEmail('', '', '', '', FileName)
    else
      MsgBeep;
end;

procedure TfmMain.TBXItemCC1Click(Sender: TObject);
begin
  RunTool(1);
end;

procedure TfmMain.TBXItemCC2Click(Sender: TObject);
begin
  RunTool(2);
end;

procedure TfmMain.TBXItemCC3Click(Sender: TObject);
begin
  RunTool(3);
end;

procedure TfmMain.TBXItemCC4Click(Sender: TObject);
begin
  RunTool(4);
end;

procedure TfmMain.TBXItemCC5Click(Sender: TObject);
begin
  RunTool(5);
end;

procedure TfmMain.TBXItemCC6Click(Sender: TObject);
begin
  RunTool(6);
end;

procedure TfmMain.TBXItemCC7Click(Sender: TObject);
begin
  RunTool(7);
end;

procedure TfmMain.TBXItemCC8Click(Sender: TObject);
begin
  RunTool(8);
end;

procedure TfmMain.TBXItemCC9Click(Sender: TObject);
begin
  RunTool(9);
end;

procedure TfmMain.TBXItemCC10Click(Sender: TObject);
begin
  RunTool(10);
end;

procedure TfmMain.TBXItemCC11Click(Sender: TObject);
begin
  RunTool(11);
end;

procedure TfmMain.TBXItemCC12Click(Sender: TObject);
begin
  RunTool(12);
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
  i:= opAcpFileSize * (1024*1024);
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

    S:= '\s1\' + DKLangConstW('typed') + '\t\\s2\';
    for i:= 0 to LL.Count-1 do
    begin
      //if i mod 10 = 0 then
      //  MsgAcpFile('Adding items '+IntToStr(i*100 div LL.Count)+'%');

      //if List.IndexOf(LL[i])<0 then //<-- Freeze on large file!!
      //begin
        List.Add(LL[i]);
        Display.Add(S + LL[i]);
      //end;
    end;
  finally
    FreeAndNil(LL);
    SetHint('');
  end;
end;

procedure TfmMain.DoSaveStyles(Sender: TObject);
begin
  SaveLexerStylesToFile(Sender as TSyntAnalyzer, SynStylesIni);
end;

procedure TfmMain.TBXItemORestoreStylesClick(Sender: TObject);
  //------
  function FindAn(const S: string): TSyntAnalyzer;
  var i:Integer;
  begin
    Result:= nil;
    with SyntaxManager do
      for i:= 0 to AnalyzerCount-1 do
        if Analyzers[i].LexerName = S {case-sens!} then
          begin Result:= Analyzers[i]; Exit end;
  end;
var
  i:Integer;
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
  fSetup.Execute;
end;

type
  TTrCrk = class(TCustomSyntaxTreeview);

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
    TTrCrk(Tree).DblClick;
    Key:= 0;
    Exit
  end;

  sh:= Shortcut(Key, Shift);
  if sh=0 then Exit;
  //Ctrl+F in tree
  if IsSh(sh, smFindDialog) then
  begin
    ecFindInTree.Execute;
    Key:= 0;
    Exit;
  end;
  //F3 in tree
  if IsSh(sh, smFindNext) then
  begin
    ecFindInTreeNext.Execute;
    Key:= 0;
    Exit;
  end;
  //Ctrl+F3 in tree
  if IsSh(sh, smFindPrev) then
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
      EditorSetModified(CurrentEditor);
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
  UpdLeft(tbTree);
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
    UpdRight(tbClip);
    if fmClip.ListClip.CanFocus then
      fmClip.ListClip.SetFocus;
  end
  else
  if fmClip.ListClip.Focused then
    FocusEditor
  else
  begin
    UpdRight(tbClip);
    if fmClip.ListClip.CanFocus then
      fmClip.ListClip.SetFocus
  end;
end;

procedure TfmMain.UpdateQVTree;
begin
  if opListerQVTree<>'' then
    plTree.Visible:= SFileExtensionMatch(fn, opListerQVTree);
end;

{
<tag>
</tag>
<tag ... >
<tag ... />
<tag vv="100">
<tag vv='100'>
<tag vv=100>
}
function IsTagEnd(i: Integer; const s: ecString): boolean;
begin
  Result:= false;
  if (i<=1) or (s[i]<>'>') then Exit;
  if Pos(s[i-1], ' "''/')>0 then
    begin Result:= true; Exit end;
  if IsWordChar(s[i-1]) then
  begin
    while (i>1) and IsWordChar(s[i-1]) do Dec(i);
    if (i>1) and (Pos(s[i-1], '<=/')>0) then
      Result:= true;
  end;
end;

function ZenDoLeft(const s: ecString; iFrom: integer): integer;
const
  sep = #13#10#9' ';
  brEnd = ']}';
  brBegin = '[{';
var i, Br: Integer;
begin
  i:= iFrom;
  Br:= 0;
  if i>1 then
  repeat
    Dec(i);
    if i=1 then Break;
    if Pos(s[i], brEnd)>0 then Inc(Br);
    if Pos(s[i], brBegin)>0 then Dec(Br);
    if (Pos(s[i-1], sep)>0) and (Br<=0) then Break;
    if IsTagEnd(i-1, s) then Break;
  until false;
  Result:= i;
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
    iSt:= ZenDoLeft(Lines.FText, i1+1)-1;
    iLen:= i1-iSt;
    s:= WideTrim(Copy(Lines.FText, iSt+1, iLen));
    if s='' then
      begin MsgBeep; Exit end;
    //Msginfo('"'+s+'"'); exit;

    sPad:= StringOfChar(' ', StrPosToCaretPos(iSt).X);
    s:= SZenExpand(s, sPad);
    if s='' then Exit;
    i:= Pos('|', s);
    SReplaceAllW(s, '|', '');

    BeginUpdate;
    CaretStrPos:= iSt;
    DeleteText(iLen);
    InsertText(s);
    if i>0 then
      CaretStrPos:= iSt+i-1;
    EndUpdate;
  end;
end;

function TfmMain.SZenExpand(const s, sPadding: string): string;
const
  fr =
    //'Tools\zencoding.wsf',
    'Tools\emmet.wsf';
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
    ft:= SExpandVars('%temp%\SynWrZen$$.txt');
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
    abbr:= SZenExpand(abbr, sPad);
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
  if Lexer<>FLexerACP then
    RefreshACP(Lexer);
end;

procedure TfmMain.TBXItemFReopenClick(Sender: TObject);
begin
  fReread.Execute;
end;

procedure TfmMain.ecToggleLineCommentExecute(Sender: TObject);
begin
  DoToggleLineComment(false);
end;

procedure TfmMain.DoToggleLineComment(Alt: boolean);
var
  Ed: TSyntaxMemo;
  sCom: Widestring;
  n: Integer;
  NeedUncomm: boolean;
begin
  Ed:= CurrentEditor;

  //get comment chars
  if CurrentFrame.TextSource.SyntaxAnalyzer<>nil then
    sCom:= CurrentFrame.TextSource.SyntaxAnalyzer.LineComment
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
    UpdOut(tbOut);
    if Self.Enabled and ListOut.CanFocus then
      ListOut.SetFocus;
  end
  else
  if ListOut.Focused then
    FocusEditor
  else
  begin
    UpdOut(tbOut);
    if Self.Enabled and ListOut.CanFocus then
      ListOut.SetFocus
  end;
end;

procedure TfmMain.fMakeBakExecute(Sender: TObject);
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
    sStart:= SLexerComment(Lexer);
    if sStart<>'' then Exit;
  end;

  with TIniFile.Create(SynDir + 'Lexers.cfg') do
  try
    s:= ReadString('Comments', Lexer, '');
    if s='' then
    begin
      IsMultiLine:= true;
      s:= ReadString('CommentsForLines', Lexer, '');
    end;
    n:= Pos(',', s);
  finally
    Free
  end;

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
  s1, s2, sCR, Lexer: string;
  n, nLen: integer;
  Uncomm, CmtMLine: boolean;
begin
  Ed:= CurrentEditor;
  Lexer:= CurrentLexer;
  if Lexer='' then
    begin MsgBeep; Exit end;

  if Ed.ReadOnly then Exit;
  if Ed.SelLength=0 then
    begin MsgNoSelection; Exit end;

  DoGetCommentProps(Lexer, false, s1, s2, CmtMLine);
  if s1='' then Exit;

  with Ed do
    begin
      //msginfo(s1+#13+s2);
      n:= SelStart;
      nLen:= SelLength;
      SetSelection(n, 0);

      if CmtMLine then
        Uncomm:= false
      else
        Uncomm:= (Copy(Lines.FText, n+1, Length(s1)) = s1) and
               (Copy(Lines.FText, n+nLen-Length(s2)+1, Length(s2)) = s2);
      if not Uncomm then
      begin
        //do comment
        if CmtMLine then
        begin
          sCR:= CurrentCR;
          if (n-Length(sCR)>=0) and
            (Copy(Lines.FText, n-Length(sCR)+1, Length(sCR)) = sCR) then
            s1:= s1+sCR
          else
            s1:= sCR+s1+sCR;
          if Copy(Lines.FText, n+nLen-Length(sCR)+1, Length(sCR)) = sCR then
            s2:= s2+sCR
          else
            s2:= sCR+s2+sCR;
        end;
        BeginUpdate;
        try
          CaretStrPos:= n;
          InsertText(s1);
          CaretStrPos:= n+nLen+Length(s1);
          InsertText(s2);
        finally
          EndUpdate;
        end;    
      end
      else
      begin
        //do uncomment
        BeginUpdate;
        try
          CaretStrPos:= n+nLen-Length(s2);
          DeleteText(Length(s2));
          CaretStrPos:= n;
          DeleteText(Length(s1));
        finally
          EndUpdate;
        end;
      end;
    end;
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

procedure TfmMain.TBXItemHDonateClick(Sender: TObject);
begin
  ShowHelp(SynDir, helpDonate, Handle);
end;

procedure TfmMain.TBXItemECpFNClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_CopyFN);
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
    UpdOut(tbFind);
    if Self.Enabled and TreeFind.CanFocus then
      TreeFind.SetFocus;
  end
  else
  if TreeFind.Focused then
    FocusEditor
  else
  begin
    UpdOut(tbFind);
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

procedure TfmMain.DoSpellCfg(Sender: TObject);
begin
  {$ifdef SPELL}
  if Assigned(FSpell) then
    FSpell.Setup;
  {$endif}
end;

procedure TfmMain.UpdateSpell(Frame: TEditorFrame; UpdFlag: boolean = true);
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
  AMap: boolean;
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
  if not F.SpellLive then
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
        MsgInfo(DKLangConstW('zMSpellDone'), Handle);
        Exit
      end;

      Ed.WordRangeAtPos(Ed.StrPosToCaretPos(FSpellPos), NStart, NEnd);
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
      F.SyncMap;
  end;
  {$endif}
end;

procedure TfmMain.ecSpellLiveExecute(Sender: TObject);
begin
  with CurrentFrame do
    SpellLive:= not SpellLive;
  UpdateSpell(CurrentFrame, false);
end;

procedure TfmMain.TBXItemSpellLiveClick(Sender: TObject);
begin
  ecSpellLive.Execute;
end;

procedure TfmMain.ecJoinLinesExecute(Sender: TObject);
var
  s: ecString;
  nPos, nLen,
  i, i1: Integer;
begin
  if CurrentEditor<>nil then
    with CurrentEditor do
    begin
      s:= SelText;
      nLen:= Length(s);
      nPos:= SelStart;
      repeat
        //find CR/LF
        i1:= 0;
        for i:= 1 to Length(s) do
          if IsLineBreakChar(s[i]) then
            begin i1:= i; Break end;
        if i1=0 then Break;
        //delete CR/LF's here
        i:= i1;
        while (i<=Length(s)) and IsLineBreakChar(s[i]) do
          Delete(s, i, 1);
        //if spaces at this pos, continue
        if (i-1>0) and (i-1<=Length(s)) and IsSpaceChar(s[i-1]) then Continue;
        if (i>0) and (i<=Length(s)) and IsSpaceChar(s[i]) then Continue;
        //insert space
        Insert(' ', s, i);
      until false;
      CaretStrPos:= nPos;
      DeleteText(nLen);
      InsertText(s);
    end;
end;

//Get selected lines nums: from Ln1 to Ln2
procedure TfmMain.DoGetSelLines(Ed: TSyntaxMemo; var Ln1, Ln2: Integer);
var p: TPoint;
begin
  with Ed do
    if HaveSelection then
    begin
      if SelLength>0 then
      begin
        Ln1:= StrPosToCaretPos(SelStart).Y;
        p:= StrPosToCaretPos(SelStart+SelLength);
        Ln2:= p.Y;
        if p.X = 0 then
          Dec(Ln2);
      end
      else
      begin
        Ln1:= SelRect.Top;
        Ln2:= SelRect.Bottom;
      end
    end
    else
    begin
      //no selection
      Ln1:= CaretPos.Y;
      Ln2:= Ln1;
    end;
end;

procedure TfmMain.ecSplitLinesExecute(Sender: TObject);
var
  Ln1, Ln2, i, nLen, nCol: Integer;
  s, sCR: ecString;
begin
  if CurrentEditor<>nil then
    with CurrentEditor do
    begin
      sCR:= CurrentCR;

      nCol:= RightMargin;
      s:= IntToStr(nCol);
      if not MsgInput('MRtMargin', s) then Exit;
      nCol:= StrToIntDef(s, nCol);
      if nCol<3 then begin MsgBeep; Exit end;

      DoGetSelLines(CurrentEditor, Ln1, Ln2);
      BeginUpdate;
      try
        for i:= Ln2 downto Ln1 do
        begin
          s:= Lines[i];
          nLen:= Lines.LineLength(i);
          s:= WideWrapText(s, sCR, [' ', '-', '+', #9], nCol);
          ReplaceText(CaretPosToStrPos(Point(0, i)), nLen, s);
        end;
      finally
        EndUpdate;
      end;
    end;
end;

procedure TfmMain.ecMacroDlgExecute(Sender: TObject);
var
  sh: TShArray;
  idx, i: Integer;
begin
  for i:= Low(sh) to High(sh) do
    ShMacroGet(i, sh[i]);
  if EditMacro(ecMacroRecorder1, sh, idx) then
  begin
    if idx >= 0 then
      FLastMacro:= idx;
    for i:= Low(sh) to High(sh) do
      ShMacroSet(i, sh[i]);
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

procedure TfmMain.TBXItemRunPreviewClick(Sender: TObject);
var
  s: AnsiString;
  fn: string;
begin
  if CurrentEditor<>nil then
    with CurrentEditor do
    begin
      if SelLength>0 then
        s:= SelText
      else
        s:= Lines.FText;
      if Trim(s)='' then
        begin MsgNoSelection; Exit end;
      fn:= SExpandVars('%Temp%\SynPreview.html');
      FDelete(fn);
      with TFileStream.Create(fn, fmCreate) do
      try
        WriteBuffer(s[1], Length(s)*SizeOf(AnsiChar));
      finally
        Free
      end;
      FExecute(fn, '', '', Handle);
    end;
end;

procedure TfmMain.TBXSubmenuItemBrPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
var en:boolean;
begin
  en:= CurrentFrame.Filename <> '';
  TbxItemRunFirefox.Enabled:= en;
  TbxItemRunMSIE.Enabled:= en;
  TbxItemRunSafari.Enabled:= en;
  TbxItemRunChrome.Enabled:= en;
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

procedure TfmMain.DoBkClear(ed: TSyntaxMemo);
begin
  with Ed do
  begin
    BookmarkObj.Clear;
    Invalidate;
  end;
end;

procedure TfmMain.ecBkClearAllExecute(Sender: TObject);
begin
  if MsgConfirm(DKLangConstW('MBk'), Handle) then
  begin
    DoBkClear(CurrentFrame.EditorMaster);
    DoBkClear(CurrentFrame.EditorSlave);
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

var
  _CmpMemo: TCustomSyntaxMemo;

function BookmarkCompare(N1, N2: Pointer): Integer;
begin
  if not Assigned(_CmpMemo) then
    raise Exception.Create('CmpMemo nil');
  with _CmpMemo do
    Result:= Bookmarks[Integer(N1)] - Bookmarks[Integer(N2)];
end;

procedure TfmMain.AddBookmarksToSortedList(ed: TSyntaxMemo; L: TList);
var
  i: Integer;
begin
  with ed.BookmarkObj do
    for i:= 0 to Count-1 do
      L.Add(Pointer(Items[i].BmIndex));

  _CmpMemo:= ed;
  L.Sort(BookmarkCompare);
end;

procedure TfmMain.DoBkNext(e: TSyntaxMemo; Next: boolean);
var
  i, n, nPos: Integer;
  L: TList;
begin
  nPos:= e.CaretStrPos;
  L:= TList.Create;
  try
    Screen.Cursor:= crHourGlass;
    try
      AddBookmarksToSortedList(e, L);
    finally
      Screen.Cursor:= crDefault;
    end;    

    //find bkmark which is near nPos
    n:= -1;
    if Next then
    begin
      for i:= 0 to L.Count-1 do
        if e.Bookmarks[Integer(L[i])] > nPos then
          begin n:= Integer(L[i]); Break end;
    end
    else
    begin
      for i:= L.Count-1 downto 0 do
        if e.Bookmarks[Integer(L[i])] < nPos then
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

  e.GotoBookmark(n);
  CenterMemoPos(e, true{GotoMode});
  //Msg(Inttostr(n));
end;

procedure TfmMain.ecBkInverseExecute(Sender: TObject);
var
  N, i: Integer;
begin
  N:= CurrentEditor.Lines.Count;
  if N=0 then Exit;

  ShowProgress(proBookmarks);

  with CurrentFrame do
  begin
    EditorMaster.BeginUpdate;
    EditorSlave.BeginUpdate;
    for i:= 0 to N-1 do
    begin
      DoBkToggle(EditorMaster, i);
      if IsProgressStopped(i+1, N) then
        Break;
    end;
    EditorMaster.EndUpdate;
    EditorSlave.EndUpdate;
  end;

  UpdateStatusbar;
  HideProgress;
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

  ShowProgress(proBookmarks);
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
  HideProgress;
  UpdateStatusbar;
end;

procedure TfmMain.DoDeleteLine(ed: TSyntaxMemo; N: integer;
  ForceUndo: boolean = false);
var p: TPoint;
begin
  p:= ed.CaretPos;
  if N<=p.Y then Dec(p.Y); //fix caret pos
  if opBkUndo or ForceUndo then
    with ed do
    begin
      CaretPos:= Point(0, N);
      DeleteText(Lines.LineSpace(N));
    end
  else
  begin
    ed.ClearUndo;
    ed.Lines.Delete(N);
    ed.Modified:= true;
  end;
  ed.CaretPos:= p;
end;

procedure TfmMain.DoReplaceLine(ed: TSyntaxMemo; N: integer;
  const S: ecString; ForceUndo: boolean = false);
var p: TPoint;
begin
  if opBkUndo or ForceUndo then
    with ed do
    begin
      p:= CaretPos;
      CaretPos:= Point(0, N);
      DeleteText(Lines.LineLength(N));
      InsertText(S);
      CaretPos:= p;
    end
  else
  begin
    ed.Lines[N]:= S;
    ed.Modified:= true;
  end;
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

  ShowProgress(proBookmarks);

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

  HideProgress;
  UpdateStatusbar;
end;

procedure TfmMain.DoExtendSelection(
  Ed: TSyntaxMemo;
  AOldStart, AOldLength,
  ANewStart, ANewLength: integer);
var
  AOldEnd, ANewEnd: integer;
begin
  AOldEnd:= AOldStart+AOldLength;
  ANewEnd:= ANewStart+ANewLength;
  ANewStart:= Min2(AOldStart, ANewStart);
  ANewEnd:= Max2(AOldEnd, ANewEnd);
  ANewLength:= ANewEnd-ANewStart;
  Ed.SetSelection(ANewStart, ANewLength, true);
end;

procedure TfmMain.ecGotoExecute(Sender: TObject);
var
  oldSelStart, oldSelLength,
  n, m: Integer;
  AExt: boolean;
  AMode: TSynGotoMode;
  ABkNum: integer;
  Pnt: TPoint;
begin
  with CurrentEditor do
  begin
    n:= CaretPos.Y + 1;
    m:= CaretPos.X + 1;
    oldSelStart:= SelStart;
    oldSelLength:= SelLength;
    AMode:= goLine;
    if ShowGotoForm(n, m, AExt, AMode, ABkNum) then
    begin
      case AMode of
        goLine:
          begin
            Pnt:= Point(m-1, n-1);
            DoRecordToMacro(smGotoXY, @Pnt);
            CaretPos:= Point(m-1, n-1);
          end;
        goPrevBk:
          ecBkPrev.Execute;
        goNextBk:
          ecBkNext.Execute;
        goNumBk:
          CurrentEditor.ExecCommand(smGotoBookmark0+ABkNum);
      end;

      if AExt then
        DoExtendSelection(CurrentEditor,
          oldSelStart, oldSelLength,
          CaretStrPos, 0);

      CenterMemoPos(CurrentEditor, true{GotoMode});
      FocusEditor;
    end;
  end;
end;

procedure TfmMain.ecToggleViewExecute(Sender: TObject);
var
  F: TEditorFrame;
begin
  F:= OppositeFrame;
  if F<>nil then
  begin
    CurrentFrame:= F;
    FocusEditor;
  end
  else
    MsgBeep;
end;

procedure TfmMain.ecCopyLineExecute(Sender: TObject);
begin
  with CurrentEditor do
    if CaretPos.Y < Lines.Count then
      TntClipboard.AsWideText:= Lines[CaretPos.Y] + sLineBreak;
end;

procedure TfmMain.ecCutLineExecute(Sender: TObject);
begin
  ecCopyLine.Execute;
  CurrentEditor.ExecCommand(smDeleteLine);
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
      MI.OnClick:= TidyClick;
      MI.Enabled:= en;
      Add(MI);
    end;
  end;

  FreeAndNil(L);
end;

procedure TfmMain.TBXItemTidyCfgClick(Sender: TObject);
begin
  DoOpenFile(SynTidyIni);
end;

procedure TfmMain.TidyClick(Sender: TObject);
begin
  DoTidy((Sender as TTbCustomItem).Caption);
end;

procedure TfmMain.DoTidy(const Cfg: string);
var
  L: TStringList;
  L2: TWideStringList;
  fn_cfg, fn_out, fn_err,
  fcmd, fdir: string;
begin
  if CurrentFrame.FileName='' then Exit;
  if CurrentFrame.Modified then
    FSave.Execute;
  FListValFN:= CurrentFrame.FileName;

  fn_cfg:= SExpandVars('%Temp%\SynTidyCfg.txt');
  fn_out:= SExpandVars('%Temp%\SynTidyOut.txt');
  fn_err:= SExpandVars('%Temp%\SynTidyErr.txt');
  FDelete(fn_cfg);
  FDelete(fn_out);
  FDelete(fn_err);

  if Cfg<>'' then
  begin
    L:= TStringList.Create;
    FReadSection(SynTidyIni, Cfg, L);
    L.SaveToFile(fn_cfg);
    FreeAndNil(L);

    if (not IsFileExist(fn_cfg)) or (FGetFileSize(fn_cfg)=0) then
      begin MsgError('Tidy configuration empty:'#13+Cfg, Handle); Exit end;
    //DoOpenFile(fn_cfg); exit;

    fcmd:= WideFormat('"%s" -output "%s" -config "%s" -file "%s" -quiet "%s"',
      [SynDir + 'Tools\tidy.exe',
       fn_out,
       fn_cfg,
       fn_err,
       FListValFN]);
  end
  else
  begin
    fcmd:= WideFormat('"%s" -file "%s" -errors -quiet "%s"',
      [SynDir + 'Tools\tidy.exe',
       fn_err,
       FListValFN]);
  end;

  //exec
  fdir:= SynDir + 'Tools';
  if FExecProcess(fcmd, fdir, sw_hide, true{Wait}) = exCannotRun then
    begin MsgNoRun('Tools\Tidy.exe'); Exit end;

  //show errors
  if IsFileExist(fn_err) and (FGetFileSize(fn_err)>0) then
  begin
    ListVal.Items.LoadFromFile(fn_err);
    UpdOut(tbVal);
    plOut.Show;
  end
  else
  begin
    ListVal.Items.Clear;
    if Cfg='' then Exit;
  end;

  //show output
  if IsFileExist(fn_out) and (FGetFileSize(fn_out)>0) then
  begin
    L2:= TWideStringList.Create;
    L2.LoadFromFile(fn_out);
    with CurrentEditor do
    begin
      BeginUpdate;
      CaretStrPos:= 0;
      DeleteText(TextLength);
      InsertTextBlock(L2, Point(0, 0));
      EndUpdate;
    end;
    FreeAndNil(L2);
  end;

  FDelete(fn_cfg);
  FDelete(fn_out);
  FDelete(fn_err);
end;

procedure TfmMain.TBXItemTidyValClick(Sender: TObject);
begin
  DoTidy('');
end;

procedure TfmMain.TBXItemOOValClick(Sender: TObject);
begin
  UpdOut(tbVal);
end;

procedure TfmMain.ListValDblClick(Sender: TObject);
begin
  with ListVal do
   if (ItemIndex>=0) and (ItemIndex<Items.Count) then
     ListValNav(Items[ItemIndex]);
end;

procedure TfmMain.ListValNav(const s: Widestring);
var
  Ln, Col: Integer;
  ss, sLn, sCol: Widestring;
begin
  if s='' then Exit;
  ss:= s;
  sLn:= SGetItem(ss, ' ');
  sLn:= SGetItem(ss, ' ');
  sCol:= SGetItem(ss, ' ');
  sCol:= SGetItem(ss, ' ');
  Ln:= StrToIntDef(sLn, 1)-1;
  Col:= StrToIntDef(sCol, 1)-1;
  DoOpenFile(FListValFN);
  CurrentEditor.CaretPos:= Point(Col, Ln);
  FocusEditor;
end;

procedure TfmMain.TBXItemValNavClick(Sender: TObject);
begin
  ListValDblClick(ListVal);
end;

procedure TfmMain.TBXItemValCpClick(Sender: TObject);
begin
  DoListCopy(ListVal);
end;

procedure TfmMain.TBXItemValCpAllClick(Sender: TObject);
begin
  DoListCopyAll(ListVal);
end;

procedure TfmMain.TBXItemValClrClick(Sender: TObject);
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
    TbxItemValCp.Enabled:= SelCount>0;
    TbxItemValCpAll.Enabled:= Items.Count>0;
    TbxItemValClr.Enabled:= Items.Count>0;
    TbxItemValFind.Enabled:= Items.Count>0;
  end;
end;

procedure TfmMain.ListValKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ((Key=vk_space) or (Key=vk_return)) and (Shift=[]) then
    begin ListValDblClick(Self); Key:= 0 end;
  if (Key=vk_delete) and (Shift=[]) then
    begin TbxItemValClrClick(Self); Key:= 0 end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
    begin TbxItemValCpClick(Self); Key:= 0 end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.ecToggleFocusValidateExecute(Sender: TObject);
begin
  if not plOut.Visible then
  begin
    ecShowOut.Execute;
    UpdOut(tbVal);
    if Self.Enabled and ListVal.CanFocus then
      ListVal.SetFocus;
  end
  else
  if ListVal.Focused then
    FocusEditor
  else
  begin
    UpdOut(tbVal);
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
  with TIniFile.Create(SynIni) do
  try
    EraseSection('MRU_Sess');
  finally
    Free;
  end;
end;

procedure TfmMain.TBXItemFSesSaveClick(Sender: TObject);
begin
  if FSessionFN<>'' then
    SaveSession(FSessionFN)
  else
    TbxItemFSesSaveAsClick(Self);
end;

procedure TfmMain.TBXItemFSesCloseClick(Sender: TObject);
begin
  if not AskSession(true) then
    Exit;
  FSessionFN:= '';
  UpdateTitle(CurrentFrame);
end;

function TfmMain.AskSession(CanCancel: boolean; ExitCmd: boolean = false): boolean;
var
  Buttons: TMsgDlgButtons;
  sName, fn: WideString;
begin
  Result:= true;

  if ExitCmd and opHistSessionSave then
  begin
    if (FSessionFN='') or opHistSessionDef then
      fn:= SynIniDir + SynDefaultSyn
    else
      fn:= FSessionFN;
    SaveSession(fn);
    SynMruSessions.AddItem(fn);
    Exit
  end;

  if FSessionFN='' then Exit;
  if opHistSessionSave then
  begin
    SaveSession(FSessionFN);
    SynMruSessions.AddItem(FSessionFN);
    Exit
  end;

  sName:= WideChangeFileExt(WideExtractFileName(FSessionFN), '');
  Buttons:= [mbYes, mbNo];
  if CanCancel then
    Include(Buttons, mbCancel);
  //MsgBeep;
  case WideMessageDlg(
    WideFormat(DKLangConstW('MSessSav'), [sName]),
    mtConfirmation, Buttons, 0) of
    mrYes:
      begin
        SaveSession(FSessionFN);
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
procedure TfmMain.PageControl1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
  TCM_GETITEMRECT = $130A;
var
  ARect: TRect;
  j: Integer;
begin
  //Dont allow to drag between views
  if Sender <> Source then
    begin MsgBeep(true); Exit end;

  with (Sender as TTntPageControl) do
    for j:= 0 to PageCount - 1 do
    begin
      Perform(TCM_GETITEMRECT, j, Integer(@ARect));
      if PtInRect(ARect, Point(X, Y)) then
      begin
        if ActivePage.PageIndex <> j then
        begin
          MoveTabInList(PageControl.ActivePage.PageIndex, j);
          ActivePage.PageIndex:= j;
        end;
        Exit;
      end;
    end;
end;

procedure TfmMain.PageControl1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Sender is TTntPageControl) then
    Accept:= opTabDragDrop;
end;

procedure TfmMain.TBXSubmenuItemFNewPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
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
  Ini:= TIniFile.Create(SynIni);
  try
    LoadMruList(SynMruNewdoc, Ini, 'MRU_Newdoc', 5{MaxCount}, true);
  finally
    FreeAndNil(Ini);
  end;

  with TBXItemMruNewdoc do
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
          mi.OnClick:= NewDocClick;
          mi.Caption:= Names[i];
          mi.Tag:= Integer(Names.Objects[i]) + 1;
          miSub.Add(mi);
        end;
    end;

  //add "Browse folder"
  TbxSubmenuItemFNew.Add(TSpTbxSeparatorItem.Create(Self));
  mi:= TSpTbxItem.Create(Self);
  mi.OnClick:= NewDocFolderClick;
  mi.Caption:= DKLangConstW('OpNew');
  mi.Tag:= 1;
  TbxSubmenuItemFNew.Add(mi);

  FreeAndNil(Names);
end;

procedure TfmMain.NewDocFolderClick(Sender: TObject);
begin
  FOpenURL(SynDir + 'Template\newdoc', Handle);
end;

procedure TfmMain.NewDocClick(Sender: TObject);
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
  Ed: TSyntaxMemo;
  i, Ln1, Ln2, NDel, NCol: Integer;
begin
  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;

  DoGetSelLines(Ed, Ln1, Ln2);
  if Ln1=Ln2 then
    NCol:= Ed.CaretPos.X
  else
    NCol:= 0;

  Ed.BeginUpdate;
  try
    NDel:= 0;
    for i:= Ln2 downto Ln1 do
    begin
      DoDeleteLine(ed, i, true{ForceUndo});
      Inc(NDel);
    end;
    Ed.CaretPos:= Point(NCol, Ln1);
  finally
    Ed.EndUpdate;
  end;

  MsgDelLines(NDel);
end;

function TfmMain.CurrentTabSize(Ed: TSyntaxMemo): Integer;
begin
  if Ed.TabList.Count>0 then
    Result:= Ed.TabList[0]
  else
    Result:= 8;
end;

function TfmMain.CurrentTabExpansion(Ed: TSyntaxMemo): Widestring;
begin
  Result:= StringOfChar(' ', CurrentTabSize(Ed));
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

  SetHint('');
  Finder.FindText:= s;
  Finder.Flags:= Finder.Flags-[ftRegularExpr];
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

procedure TfmMain.DoBlockIndent(Ed: TSyntaxMemo; shift: boolean);
var
  p, pp: TPoint;
  n, i, Ln1, Ln2: integer;
  R: TRect;
  spaces: string;
begin
  if not Ed.HaveSelection then Exit;
  if Ed.SelLength>0 then
  begin
    if Shift then
      n:= Ed.BlockIndent
    else
      n:= -Ed.BlockIndent;
    p:= Ed.StrPosToCaretPos(Ed.SelStart);
    Ed.ShiftSelection(n, not (soUnindentKeepAlign in Ed.Options));
    pp:= Ed.StrPosToCaretPos(Ed.SelStart+Ed.SelLength);
    Ed.SelStart:= Ed.CaretPosToStrPos(p);
    Ed.SelLength:= Ed.CaretPosToStrPos(pp)-Ed.SelStart;
  end
  else
  begin
  //Selrect.Left incorr for Tabs present at line begin.
  //so bug like EC's
    n:= Ed.SelRect.Left;
    Ln1:= Ed.SelRect.Top;
    Ln2:= Ed.SelRect.Bottom;
    R:= Ed.SelRect;
    p:= Ed.CaretPos;
    spaces:= StringOfChar(' ', Ed.BlockIndent);

    Ed.BeginUpdate;
    for i:= Ln1 to Ln2 do
    begin
      Ed.CaretPos:= Point(n, i);
      Ed.InsertText(spaces);
    end;
    Ed.EndUpdate;

    Ed.CaretPos:= p;
    Ed.SelRect:= R;
  end;
end;

procedure TfmMain.Splitter1CanResize(Sender: TObject; var NewSize: Integer;
  var Accept: Boolean);
var
  n: Integer;
  b: boolean;
begin
  b:= (GetKeyState(vk_control) and 128)>0;
  if b then Splitter1.ResizeStyle:= rsUpdate
  else Splitter1.ResizeStyle:= rsPattern;
  if not b then Exit;

  n:= Panel1.Width div 10;
  newsize:= newsize div n;
  if newsize=0 then Inc(newsize);
  newsize:= newsize * n;
end;

procedure TfmMain.ecSplit50_50Execute(Sender: TObject);
begin
  DoSplitterPos(50.0);
end;

procedure TfmMain.ecSplit40_60Execute(Sender: TObject);
begin
  DoSplitterPos(60.0);
end;

procedure TfmMain.ecSplit60_40Execute(Sender: TObject);
begin
  DoSplitterPos(40.0);
end;

procedure TfmMain.ecSplit30_70Execute(Sender: TObject);
begin
  DoSplitterPos(70.0);
end;

procedure TfmMain.ecSplit70_30Execute(Sender: TObject);
begin
  DoSplitterPos(30.0);
end;

procedure TfmMain.ecSplit20_80Execute(Sender: TObject);
begin
  DoSplitterPos(80.0);
end;

procedure TfmMain.ecSplit80_20Execute(Sender: TObject);
begin
  DoSplitterPos(20.0);
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

procedure TfmMain.DoSaveSel(Ed: TSyntaxMemo; var Sel: TSynSelSave);
begin
  FillChar(Sel, SizeOf(Sel), 0);
  with Ed do
  begin
    Sel.FSelStream:= Ed.SelLength>0;
    if Sel.FSelStream then
    begin
      Sel.FSelStart:= Ed.StrPosToCaretPos(Ed.SelStart);
      Sel.FSelEnd:= Ed.StrPosToCaretPos(Ed.SelStart+Ed.SelLength);
    end
    else
      Sel.FSelRect:= SelRect;
    Sel.FCaretPos:= CaretPos;
  end;
end;

procedure TfmMain.DoRestoreSel(Ed: TSyntaxMemo; const Sel: TSynSelSave);
begin
  with Ed do
  begin
    BeginUpdate;
    try
      CaretPos:= Sel.FCaretPos;
      if Sel.FSelStream then
      begin
        SelStart:= Ed.CaretPosToStrPos(Sel.FSelStart);
        SelLength:= Ed.CaretPosToStrPos(Sel.FSelEnd) - SelStart;
      end
      else
        SelRect:= Sel.FSelRect;
    finally
      EndUpdate;
    end;
  end;
end;

procedure TfmMain.DoFixReplaceCaret(Ed: TSyntaxMemo);
var n, nf: Integer;
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

procedure TfmMain.ecMarkersClearExecute(Sender: TObject);
begin
  with CurrentFrame do
  begin
    with EditorMaster do
      if Markers.Count>0 then
      begin
        Markers.Clear;
        Invalidate
      end;
    with EditorSlave do
      if Markers.Count>0 then
      begin
        Markers.Clear;
        Invalidate
      end;
  end;
end;

procedure TfmMain.TBXItemRightClipClick(Sender: TObject);
begin
  UpdRight(tbClip);
end;

procedure TfmMain.TBXItemRightMapClick(Sender: TObject);
begin
  UpdRight(tbMap);
end;

procedure TfmMain.MapClick(Sender: TObject);
begin
  if CurrentEditor<>nil then
  with CurrentEditor do
  begin
    CaretPos:= (Sender as TSyntaxMemo).CaretPos;
    TopLine:= CaretPos.Y - ClientHeight div DefLineHeight div 2;
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
  if Assigned(fmMap) and fmMap.Visible then
    fmMap.SyncMapData(CurrentEditor);
end;

procedure TfmMain.SyncMapPos;
begin
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
    UpdRight(tbMap);
    if Assigned(fmMap) and fmMap.edMap.CanFocus then
      fmMap.edMap.SetFocus;
  end
  else
  if Assigned(fmMap) and fmMap.edMap.Focused then
    FocusEditor
  else
  begin
    UpdRight(tbMap);
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
  SetHint(s);
  {if opSrShowMsg then
    MsgWarn(s, Handle)
  else}
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
    IniFN:= Self.SynIni;
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

procedure TfmMain.ecGotoNextBlankExecute(Sender: TObject);
begin
  DoGotoBlank(true);
end;

procedure TfmMain.ecGotoPrevBlankExecute(Sender: TObject);
begin
  DoGotoBlank(false);
end;

procedure TfmMain.DoGotoBlank(ANext: boolean);
var
  n: Integer;
begin
  with CurrentEditor do
  begin
    n:= CaretPos.Y;
    repeat
      if ANext then Inc(n) else Dec(n);
      if (n<0) or (n>=Lines.Count) then
        begin MsgBeep; Exit end;
      if Trim(Lines[n])='' then Break;
    until false;

    CaretPos:= Point(0, n);
    CenterMemoPos(CurrentEditor, true);
  end;
end;

procedure TfmMain.ecSelParaExecute(Sender: TObject);
var
  n1, n2: Integer;
begin
  with CurrentEditor do
  if Lines.Count>0 then
  begin
    n1:= CaretPos.Y;
    n2:= n1;
    if Trim(Lines[n1])='' then
      begin MsgBeep; Exit end;

    //n2: last para line
    repeat
      Inc(n2);
      if (n2>=Lines.Count) then Break;
      if Trim(Lines[n2])='' then Break;
    until false;
    Dec(n2);

    //n1: first para line
    repeat
      Dec(n1);
      if (n1<0) then Break;
      if Trim(Lines[n1])='' then Break;
    until false;
    Inc(n1);

    n1:= CaretPosToStrPos(Point(0, n1));
    n2:= CaretPosToStrPos(Point(Lines.LineSpace(n2), n2));
    SetSelection(n1, n2-n1);
  end;
end;

const
  cMinSplitter: double = 5.0;

procedure TfmMain.ecSplitLeftExecute(Sender: TObject);
begin
  //Increase FSplitter
  if Splitter1.Visible then
  begin
    if FSplitter <= (100.0-cMinSplitter*2) then
      FSplitter:= Round(FSplitter) + cMinSplitter
    else
      FSplitter:= 100.0-cMinSplitter;
    SetSplitter(FSplitter);
  end;
end;

procedure TfmMain.ecSplitRightExecute(Sender: TObject);
begin
  //decrease FSplitter
  if Splitter1.Visible then
  begin
    if FSplitter >= cMinSplitter*2 then
      FSplitter:= Round(FSplitter) - cMinSplitter
    else
      FSplitter:= cMinSplitter;
    SetSplitter(FSplitter);
  end;
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
     case AMode of
       goLine: cbPos.Checked:= true;
       goPrevBk: cbPrev.Checked:= true;
       goNextBk: cbNext.Checked:= true;
       goNumBk: cbNum.Checked:= true;
     end;
     edLine.Text:= IntToStr(ALine);
     edCol.Text:= IntToStr(ACol);
     FMaxLine:= CurrentEditor.Lines.Count;

     edNum.Items.Clear;
     for i:= 0 to 9 do
     begin
       edNum.Items.Add(BookmarkDesc(i));
       FBookSet[i]:= CurrentEditor.Bookmarks[i]>=0;
     end;

     en:= false;
     edNum.ItemIndex:= 0;
     for i:= 0 to 9 do
       if FBookSet[i] then
         begin en:= true; edNum.ItemIndex:= i; Break end;
     cbNum.Enabled:= en;

     en:= CurrentEditor.BookmarkObj.Count>0;
     cbPrev.Enabled:= en;
     cbNext.Enabled:= en;

     if not cbPrev.Enabled and not cbNext.Enabled and not cbNum.Enabled then
       cbPos.Enabled:= false;

     Result:= ShowModal = mrOk;
     if Result then
     begin
       if cbPos.Checked then AMode:= goLine else
       if cbPrev.Checked then AMode:= goPrevBk else
       if cbNext.Checked then AMode:= goNextBk else
       if cbNum.Checked then AMode:= goNumBk;

       //calc line num
       //limit by [1, Count]
       s:= edLine.Text;
       s:= Trim(s);
       if (s<>'') and (char(s[1]) in ['+', '-']) then
         ALine:= ALine+StrToIntDef(s, 0)
       else
         ALine:= StrToIntDef(s, ALine);
       ALine:= Min2(Max2(ALine, 1), CurrentEditor.Lines.Count);

       //calc col num
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


procedure TfmMain.DoJumpToWordEnd(ASel: boolean);
var
  wEnd, wStart, n: Integer;
begin
  with CurrentEditor do
  begin
    WordRangeAtPos(CaretPos, wStart, wEnd);
    if (wEnd <= wStart) or (wEnd = CaretStrPos) then
    begin
      if ASel then
        ExecCommand(smSelWordRight)
      else
        ExecCommand(smWordRight);
      Exit
    end;
    n:= SelStart;
    CaretStrPos:= wEnd;
    if ASel then
      SetSelection(n, wEnd-n);
  end;
end;

procedure TfmMain.ecSelToWordEndExecute(Sender: TObject);
begin
  DoJumpToWordEnd(true);
end;

procedure TfmMain.ecJumpToWordEndExecute(Sender: TObject);
begin
  DoJumpToWordEnd(false);
end;

procedure TfmMain.DoFindExtSel(ANext: boolean);
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
    DoExtendSelection(Ed,
      oldStart, oldLength,
      Ed.SelStart, Ed.SelLength);
end;

procedure TfmMain.ecFindNextWithExtendExecute(Sender: TObject);
begin
  DoFindExtSel(true);
end;

procedure TfmMain.ecFindPrevWithExtendExecute(Sender: TObject);
begin
  DoFindExtSel(false);
end;

procedure TfmMain.UpdateZoom(F: TEditorFrame);
begin
  //update ruler height
  with F do
  begin
    EditorMasterZoom(EditorMaster);
    EditorMasterZoom(EditorSlave);
  end;
end;

procedure TfmMain.TBXItemHKeyMapClick(Sender: TObject);
var
  fn: string;
begin
  fn:= SExpandVars('%temp%\SynWriteKeys.html');
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
    IniFN:= Self.SynIni;
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
  with fmClip.ListClip do
    if CanFocus then
    begin
      SetFocus;
      ecFindInList.Execute;
    end;
end;

procedure TfmMain.TBXItemValFindClick(Sender: TObject);
begin
  with ListVal do
    if CanFocus then
    begin
      SetFocus;
      ecFindInList.Execute;
    end;
end;

procedure TfmMain.TBXItemOFindClick(Sender: TObject);
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
      (F.TextSource.Lines.TextLength <= opASaveMaxSizeKb * 1024);
  end;
  //
  function FrameOk(F: TEditorFrame): boolean;
  begin
    Result:= (F<>nil) and
      F.Modified and
      ((F.FileName<>'') or (opASaveUnnamed<>0)) and
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
    if opASaveUnnamed=0 then
      Exit
    else
    if opASaveUnnamed=1 then
      SaveFrame(F, true)
    else
    begin
      //get save dir
      dir:= SExpandVars(opASaveUnnamedDir);
      SReplaceW(dir, '%AppData%\', FAppDataPath); //force %AppData% expand
      if not IsDirExist(dir) then
        ForceDirectories(dir);

      //get save extention
      if F.TextSource.SyntaxAnalyzer<>nil then
        ext:= F.TextSource.SyntaxAnalyzer.Extentions
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
  LineNum:= 0;
  ColNum:= 0;
  Len:= 0;
end;

procedure TfmMain.UpdateTreeFind(const AStr, ADir: Widestring;
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

procedure TfmMain.UpdateTreeInit(const AStr, ADir: Widestring; AInTabs: boolean = false);
begin
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
  CenterMemoPos(CurrentEditor, false);
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

  sInf:= SFindResPrefix(Info.FN, Info.LineNum);
  s:= Copy(TTntTreeNode(Node).Text, 1, Length(sInf)+Info.ColNum);
  n:= ecTextExtent(Sender.Canvas, s).cx;
  s:= Copy(TTntTreeNode(Node).Text, Length(sInf)+Info.ColNum+1, Info.Len);
  ecTextOut(Sender.Canvas, R.Left+n, R.Top, s);
end;

function TfmMain.SFindResPrefix(const FN: Widestring; LineNum: integer): Widestring;
begin
  Result:= WideExtractFileName(FN)+
    WideFormat('(%d): ', [LineNum+1]);
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
  //Del, Ctrl+Del
  if (Key=vk_delete) and ((Shift=[]) or (Shift=[ssCtrl])) then
  begin
    TbxItemTreeFindClearClick(Sender);
    Key:= 0;
    Exit
  end;
  DoHandleKeysInPanels(Key, Shift);
end;

procedure TfmMain.UpdateTreeReplace(const ANodeText: Widestring; ANumFiles, ANumItems: integer; AStopped: boolean);
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
  with TreeFind do
    if CanFocus then
    begin
      SetFocus;
      ecFindInTree.Execute;
    end;
end;

procedure TfmMain.TBXItemTreeFindCopyToTabClick(Sender: TObject);
begin
  CopyFindResultToTab(false, false);
end;

procedure TfmMain.CopyFindResultToTab(ALastSearch, AFilesOnly: boolean;
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
    CopyFindResultToList(Node, L, AFilesOnly);
    if AToClip then
    begin
      S:= L.Text;
      SReplaceZeroesW(S);
      TntClipboard.AsWideText:= S;
    end
    else
    begin
      fNew.Execute;
      CurrentEditor.Lines.AddStrings(L);
      EditorSetModified(CurrentEditor);
    end;
  finally
    FreeAndNil(L);
  end;
end;

//copy tree from selected node
procedure TfmMain.CopyFindResultNode;
var
  Node: TTntTreeNode;
  L: TWideStringList;
  S: Widestring;
begin
  Node:= TreeFind.Selected;
  if Node=nil then Exit;

  L:= TWideStringList.Create;
  try
    CopyFindResultToList(Node, L, true);
    S:= L.Text;
  finally
    FreeAndNil(L);
  end;

  SReplaceZeroesW(S);
  TntClipboard.AsWideText:= S;
end;

procedure TfmMain.CopyFindResultToList(ARootNode: TTntTreeNode;
  L: TWideStringList; AFilesOnly: boolean);
var
  Node, Node2: TTntTreeNode;
  Info: TSynFindInfo;
  n: integer;
begin
  L.Clear;
  L.Add(ARootNode.Text);
  L.Add('');
  Node:= ARootNode.getFirstChild;
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
                Copy(Node2.Text, n+3, MaxInt));
          end;
          Node2:= Node.GetNextChild(Node2);
        until Node2=nil;
    end;
    Node:= ARootNode.GetNextChild(Node);
  until Node=nil;
end;

procedure TfmMain.TBXItemTreeFindClearClick(Sender: TObject);
begin
  ClearTreeFind;
end;

procedure TfmMain.ClearTreeFind;
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
  CopyFindResultToTab(false, false, true{AToClip});
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
  SetHint(WideFormat(DKLangConstW('zDelLn'), [N]));
end;

procedure TfmMain.MsgDoneLines(N: integer);
begin
  SetHint(WideFormat(DKLangConstW('zDoneLn'), [N]));
end;

procedure TfmMain.MsgTabbing(const s: Widestring);
begin
  SetHint('[SmartTagTabbing] ' + s);
end;

{
procedure TfmMain.MsgID(const s: Widestring);
begin
  SHint[-1]:= '[FindID] ' + s;
end;
}

procedure TfmMain.TBXItemFNewClick(Sender: TObject);
begin
  fNew.Execute;
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
  if Assigned(fmClip) then
    fmClip.ListClip.ShowHint:= opTipsPanels;
end;


function CurrentLexerForPos(Ed: TSyntaxMemo; NPos: integer): string;
var
  An: TSyntAnalyzer;
begin
  Result:= '';
  if Assigned(Ed) and
     Assigned(Ed.SyntObj) then
  begin
    An:= Ed.SyntObj.AnalyzerAtPos(NPos);
    if An<>nil then
      Result:= An.LexerName;
  end;
end;

function CurrentLexerForLine(Ed: TSyntaxMemo; NLine: integer): string;
var
  Pos: integer;
begin
  if Assigned(Ed) then
  begin
    Pos:= Ed.CaretPosToStrPos(Point(0, NLine));
    Result:= CurrentLexerForPos(Ed, Pos);
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
    Result:= CurrentLexerForPos(Ed, Ed.CaretStrPos)
  else
    Result:= '';  
end;

function TfmMain.CurrentLexerForFile: string;
begin
  Result:= '';
  if SyntaxManager.CurrentLexer<>nil then
    Result:= SyntaxManager.CurrentLexer.LexerName;
end;

function TfmMain.CurrentLexerHasTemplates: boolean;
begin
  Result:= false;
  if Assigned(CurrentEditor) and
     Assigned(CurrentEditor.SyntObj) and
     Assigned(CurrentEditor.SyntObj.AnalyzerAtPos(CurrentEditor.CaretStrPos)) then
    Result:= CurrentEditor.SyntObj.AnalyzerAtPos(CurrentEditor.CaretStrPos).CodeTemplates.Count > 0;
end;

function TfmMain.SLexerComment(const Lexer: string): string;
var
  An: TSyntAnalyzer;
begin
  Result:= '';
  An:= SyntaxManager.FindAnalyzer(Lexer);
  if An<>nil then
    Result:= An.LineComment;
end;

function TfmMain.CurrentCR(Ed: TSyntaxMemo = nil): ecString;
begin
  if Ed = nil then
    Ed:= CurrentEditor;
  case Ed.Lines.TextFormat of
    tfCR: Result:= #13;
    tfNL: Result:= #10;
    else Result:= #13#10;
  end;
end;

function TfmMain.IsMultilineSelection(Ed: TSyntaxMemo): boolean;
var
  Ln1, Ln2: integer;
begin
  if not Ed.HaveSelection then
    Result:= false
  else
  begin
    DoGetSelLines(Ed, Ln1, Ln2);
    Result:= Ln2 > Ln1;
  end;
end;

function TfmMain.DoSmartTagTabbing: boolean;
var
  s, sTag, sTagExp: Widestring;
  NTagSt, NTagLen, NCaret, NPos: integer;
  SelSt, SelLen: integer;
  fn: string;
  DoInitTab: boolean;
begin
  Result:= false;
  if not opAcpTabbing then Exit;
  if not IsLexerHTML(CurrentLexer) then Exit;

  if CurrentEditor.CaretPos.Y >= CurrentEditor.Lines.Count then Exit;
  if CurrentEditor.ReadOnly then Exit;
  s:= CurrentEditor.Lines[CurrentEditor.CaretPos.Y];

  //process tabbing inside <tagName ......>
  NCaret:= CurrentEditor.CaretPos.X + 1;
  SGetTagBounds(s, NCaret, NTagSt, NTagLen);
  if (NTagSt>0) and (NTagLen>0) then
  begin
    sTag:= Copy(s, NTagSt, NTagLen);
    SelSt:= NCaret - NTagSt + 1;
    SelLen:= CurrentEditor.SelLength;

    SGetTagTabbing(sTag, SelSt, SelLen);
    if SelSt > 0 then
    begin
      CurrentEditor.CaretPos:= Point(NTagSt + SelSt - 2,
        CurrentEditor.CaretPos.Y);
      CurrentEditor.SetSelection(
        CurrentEditor.CaretStrPos, SelLen);
      MsgTabbing(DKLangConstW('ztagMovedSelection'));
    end
    else
    begin
      CurrentEditor.CaretPos:= Point(NTagSt + NTagLen - 1,
        CurrentEditor.CaretPos.Y);
      CurrentEditor.ResetSelection;
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

    //read tag expansion from Html.Tabbing.acp
    fn:= GetAcpFN('Html.Tabbing');
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
    SReplaceAllW(sTagExp, '\n',
      CurrentCR + StringOfChar(' ', NTagSt-1));
    //replace '|', save 1st '|' position
    NCaret:= Pos('|', sTagExp);
    if NCaret=0 then NCaret:= 1;
    SReplaceAllW(sTagExp, '|', '');

    CurrentEditor.BeginUpdate;
    try
      CurrentEditor.CaretPos:= Point(NTagSt-1, CurrentEditor.CaretPos.Y);
      NPos:= CurrentEditor.CaretStrPos;
      CurrentEditor.DeleteText(Length(sTag));
      CurrentEditor.InsertText(sTagExp);
      if DoInitTab then
      begin
        //do TagTabbing 2 times to select inner range
        SelSt:= 0;
        SelLen:= 0;
        SGetTagTabbing(sTagExp, SelSt, SelLen);
        SGetTagTabbing(sTagExp, SelSt, SelLen);
        CurrentEditor.CaretStrPos:= NPos + SelSt - 1;
        CurrentEditor.SetSelection(
          CurrentEditor.CaretStrPos, SelLen);
        MsgTabbing(DKLangConstW('ztagExpandAndMove'));
      end
      else
      begin
        //NCaret holds '|' position in sTagExp
        CurrentEditor.CaretStrPos:= NPos + NCaret - 1;
        MsgTabbing(DKLangConstW('ztagExpand'));
      end;
    finally
      CurrentEditor.EndUpdate;
    end;
    Result:= true;
  end;
end;

procedure TfmMain.DoMoveCaretXY(DX, DY: integer);
begin
  with CurrentEditor do
    if DY <> 0 then
      CaretPos:= Point(CaretPos.X, CaretPos.Y + DY)
    else
      //need to goto next/prev line if at edge
      CaretStrPos:= CaretStrPos + DX;
end;

procedure TfmMain.ecJumpToLastMarkerExecute(Sender: TObject);
begin
  with CurrentEditor do
    if Markers.Count>0 then
      GotoMarker(TMarker(Markers.Last))
    else
      MsgBeep;
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

procedure TfmMain.ecSelTokenExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  n: integer;
  t: TSyntToken;
begin
  Ed:= CurrentEditor;
  if Ed.SyntObj=nil then
    begin MsgBeep; Exit end;
  n:= Ed.SyntObj.TokenAtPos(Ed.CaretStrPos);
  if n<0 then
    begin MsgBeep; Exit end;
  t:= Ed.SyntObj.Tags[n];
  if t=nil then
    begin MsgBeep; Exit end;
  Ed.SetSelection(t.StartPos, t.EndPos - t.StartPos);
end;

procedure TfmMain.TBXItemTreeFindCopyToClipNodeClick(Sender: TObject);
begin
  //if root selected (Parent=nil), do "Copy search",
  //else do "Copy node"
  if (TreeFind.Selected<>nil) and (TreeFind.Selected.Parent=nil) then
    TBXItemTreeFindCopyToClipClick(Self)
  else
    CopyFindResultNode;
end;

procedure TfmMain.DoTabSwitch(ANext: boolean);
var
  nTabs: integer;
begin
  nTabs:= PageControl.PageCount;
  if nTabs<=1 then Exit;

  if opTabSwitcher and (nTabs>2) then
  begin
    if PageControl=PageControl1 then
      PageControl.ActivePageIndex:= TabSwitcher.TabSwitch(ANext, Application.MainForm)
    else
      PageControl.ActivePageIndex:= TabSwitcher2.TabSwitch(ANext, Application.MainForm);
  end
  else
  with PageControl do
    if ANext then
    begin
      //next tab
      if ActivePageIndex < PageCount-1 then
        ActivePageIndex:= ActivePageIndex+1
      else
        ActivePageIndex:= 0;
    end
    else
    begin
      //prev tab
      if ActivePageIndex >0  then
        ActivePageIndex:= ActivePageIndex-1
      else
        ActivePageIndex:= PageCount-1;
    end;

  CurrentFrame:= Frames[PageControl.ActivePageIndex];
  FocusEditor;
  PageControl1Change(PageControl);
end;

procedure TfmMain.UpdateTabList(TopItem, NewItem, DelItem: integer);
begin
  if PageControl=PageControl1 then
    TabSwitcher.UpdateTabList(TopItem, NewItem, DelItem)
  else
    TabSwitcher2.UpdateTabList(TopItem, NewItem, DelItem);

  UpdateTitle(CurrentFrame);
end;

procedure TfmMain.UpdateListTabs;
var
  i: Integer;
  F: TEditorFrame;
begin
  with ListTabs do
  begin
    Items.BeginUpdate;
    Items.Clear;
    for i:= 0 to FrameAllCount-1 do
      with Items.Add do
      begin
        F:= FramesAll[i];
        if F=CurrentFrame then
          ListTabs.Selected:= Items[i];

        if F.FileName='' then
          Caption:= DKLangConstW('Untitled')
        else
          Caption:= WideExtractFileName(F.FileName);

        SubItems.Add(F.FileName);
        SubItems.Add(IntToStr(i));

        if F.Modified then
          ImageIndex:= 1
        else
          ImageIndex:= -1;  
      end;
    Items.EndUpdate;
    if Selected<>nil then
      Selected.MakeVisible(false);
  end;
end;


procedure TfmMain.MoveTabInList(FromN, ToN: integer);
begin
  if PageControl=PageControl1 then
    TabSwitcher.MoveTabInList(FromN, ToN)
  else
    TabSwitcher2.MoveTabInList(FromN, ToN);
  {$ifdef TabOrder}
  UpdateTitle(CurrentFrame);
  {$endif}
  UpdateListTabs;
end;

procedure TfmMain.ClearTabList;
begin
  TabSwitcher.InitTabList(1);
  TabSwitcher2.InitTabList(1);
  {$ifdef TabOrder}
  UpdateTitle(CurrentFrame);
  {$endif}
end;

procedure TfmMain.GetTabName(
  APagesNumber, ATabIndex: Integer;
  var AName, AFN, ALex: Widestring);
var
  P: TTntPageControl;
  F: TEditorFrame;
  NFrames: Integer;
begin
  case APagesNumber of
    0: P:= PageControl1;
    1: P:= PageControl2;
    else raise Exception.Create('Unknown pages number');
  end;
  NFrames:= P.PageCount;

  if (ATabIndex>=0) and (ATabIndex<NFrames) then
  begin
    F:= PagesToFrame(P, ATabIndex);
    AName:= WideFormat('[%d] ', [ATabIndex+1]) + F.Title;
    AFN:= F.FileName;
    if AFN='' then
      AFN:= DKLangConstW('Untitled');
    ALex:= '';
    if F.TextSource.SyntaxAnalyzer<>nil then
      ALex:= F.TextSource.SyntaxAnalyzer.LexerName;
  end
  else
  begin
    AName:= WideFormat('[%d]', [ATabIndex+1]);
    AFN:= WideFormat('(index=%d, FrameCount=%d)', [ATabIndex, NFrames]);
    ALex:= '';
  end;
end;

procedure TfmMain.TBXItemFPropsClick(Sender: TObject);
begin
  fProps.Execute;
end;

procedure TfmMain.fPropsExecute(Sender: TObject);
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
  if (CurrentFrame<>nil) and (CurrentFrame.TextSource<>nil) then
  try
    Screen.Cursor:= crHourGlass;
    CountWords(CurrentFrame.TextSource.Lines, NWords, NChars);
    NLines:= CurrentFrame.TextSource.Lines.Count;
  finally
    Screen.Cursor:= crDefault;
  end;

  with TfmProps.Create(Self) do
  try
    FIniFN:= Self.SynIni;
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

function TfmMain.DoTemplateTabbing: boolean;
var
  Ed: TSyntaxMemo;
  ch: ecChar;
begin
  Ed:= CurrentEditor;
  Result:= false;
  if not opTemplateTabbing then Exit;
  if SFileExtensionMatch(CurrentFrame.FileName, opTemplateTabbingExcept) then Exit;
  if Ed.ReadOnly then Exit;
  if not CurrentLexerHasTemplates then Exit;
  if Ed.Lines.Count=0 then Exit;
  if Ed.CaretStrPos=0 then Exit;
  ch:= Ed.Lines.FText[Ed.CaretStrPos];
  if not IsWordChar(ch) then Exit;
  Ed.ExecCommand(TemplatePopup.CommandID); //not smCodeTemplate!
  Result:= true;
end;

procedure TfmMain.MsgColorBad;
begin
  SetHint(DKLangConstW('MColorBad')+' "'+s+'"');
end;

procedure TfmMain.MsgColorOK;
begin
  SetHint(WideFormat(DKLangConstW('MColorOk'), ['#'+s]));
end;


//todo
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
    NColor:= Hex2color(s);

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
    NColor:= Hex2color(s);

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
    NColor:= Hex2color(SColor);
    NColorText:= Hex2color(SColorText);

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
  NColor:= Hex2color(s);

  MsgColorOK(s);
  Result:= true;
end;


procedure TfmMain.UpdateColorHint(AClearHint: boolean = true);
begin
  if AClearHint then
    SetHint('');
end;

procedure TfmMain.ecInsertColorExecute(Sender: TObject);
var
  fn: string;
  code: Cardinal;
  wStart, wEnd: integer;
  NColor: integer;
begin
  ecACP.CloseUp(false);

  if CurrentEditor.ReadOnly then
    begin MsgBeep; Exit end;

  fn:= SynDir + 'Tools\ColorPicker.exe';
  if not IsFileExist(fn) then
    begin MsgNoFile(fn); Exit end;

  GetColorRange(wStart, wEnd, NColor);
  if FExecuteGetCode(fn, IntToStr(NColor), sw_show, true, code) then
    if code<>Cardinal(-1) then
    begin
      DoInsertColorCode(code);
      DoAddRecentColor(code);
    end;
end;

procedure TfmMain.DoInsertColorCode(Code: Longint);
var
  wStart, wEnd, NColor: Integer;
begin
  with CurrentEditor do
    if not ReadOnly then
    begin
      BeginUpdate;
      GetColorRange(wStart, wEnd, NColor);
      if (wEnd>wStart) then
      begin
        CaretStrPos:= wStart;
        DeleteText(wEnd-wStart);
      end;
      InsertText(Color2str(Code));
      EndUpdate;
    end;
end;

procedure TfmMain.ApplyShowRecentColors;
begin
  case opShowRecentColors of
    0: TbxSubmenuItemRecentColors.Visible:= ImageListColorRecent.Count>1;
    1: TbxSubmenuItemRecentColors.Visible:= true;
    2: TbxSubmenuItemRecentColors.Visible:= false;
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
  Item.Caption:= Color2str(N);
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
    DoInsertColorCode(Code);
    DoAddRecentColor(Code);
  end;
end;

procedure TfmMain.GetColorRange(var NStart, NEnd: integer; var NColor: integer);
var
  p: TPoint;
  s: ecString;
  wStart, wEnd: integer;
begin
  NColor:= clWhite;
  NStart:= 0;
  NEnd:= 0;
  with CurrentEditor do
    if (Lines.Count>0) then
    begin
      s:= Lines.FText;
      p:= CaretPos;
      if (CaretStrPos<Length(s)) and
        (s[CaretStrPos+1]='#') then Inc(p.X);
      WordRangeAtPos(p, wStart, wEnd);

      //needed for fixed ecSyntMemo's WordRangeAtPos
      if (wStart+1<=Length(s)) and (s[wStart+1]='#') then
        Inc(wStart);

      if (wStart>0) and (wStart<=Length(s)) and (s[wStart]='#') and
        (wEnd>wStart) then
      begin
        s:= Copy(s, wStart+1, wEnd-wStart);
        if IsHexColorString(s) then
        begin
          NColor:= Hex2color(s);
          NStart:= wStart-1;
          NEnd:= wEnd;
        end;
      end;
    end;
end;


procedure TfmMain.HandleToolOutput(const ft: Widestring; NTool: integer);
var
  List: TWideStringList;
  AType: TSynOutputType;
  N1, N2: Integer;
begin
  ListOut.Items.Clear;
  if not (IsFileExist(ft) and (FGetFileSize(ft)>0)) then
  begin
    SetHint(WideFormat(DKLangConstW('MRun0'), [opTools[NTool].ToolCaption]));
    MsgBeep;
    Exit
  end;

  List:= TWideStringList.Create;
  with opTools[NTool] do
  try
    List.LoadFromFile(ft);
    FDelete(ft);
    FixListOutput(List, ToolNoTags, IsLexerPas(ToolLexer), ToolOutEncoding,
      CurrentTabExpansion(CurrentEditor));

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
          UpdateOutFromList(List);
          FCurrTool:= NTool;
          FCurrToolFN:= CurrentFrame.FileName;
          UpdOut(tbOut);
          plOut.Show;
        end;

      outToNewDoc:
        begin
          FNew.Execute;
          CurrentEditor.Lines.AddStrings(List);
          EditorSetModified(CurrentEditor);
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
        
      else
        raise Exception.Create('Unknown tool type: '+ToolOutType);
    end;
  finally
    FreeAndNil(List);
  end;
end;

procedure TfmMain.ecGotoSelEdgeExecute(Sender: TObject);
var
  IsStart: boolean;
  NStart, NLen: integer;
begin
  with CurrentEditor do
    if SelLength=0 then
      MsgBeep
    else
    begin
      NStart:= SelStart;
      NLen:= SelLength;
      IsStart:= CaretStrPos = NStart;
      if not IsStart then
        CaretStrPos:= NStart
      else
        CaretStrPos:= NStart + NLen;
      SetSelection(NStart, NLen, true{DoNotMovecaret});
    end;
end;


function TfmMain.SStatusText: Widestring;
var
  state: TSynSelState;
  p1, p2: TPoint;
  NLine, NCol,
  NSelLines, NSelCols, NSelChars: integer;
  NCarets, NTopLine, NBottomLine: integer;
  NTime: TFileTime;
  NSize: Int64;
begin
  Result:= '';
  if CurrentEditor=nil then Exit;

  with CurrentFrame do
  begin
    NCarets:= CaretsCount;
    CaretsProps(NTopLine, NBottomLine);
  end;

  with CurrentEditor do
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
  if (CurrentFrame.FileName<>'') then
    if Pos('{File', Result)>0 then
      if FGetFileInfo(CurrentFrame.FileName, NSize, NTime) then begin end;

  SReplaceAllW(Result, '{LineNum}', IntToStr(NLine));
  SReplaceAllW(Result, '{ColNum}', IntToStr(NCol));
  SReplaceAllW(Result, '{SelLines}', IntToStr(NSelLines));
  SReplaceAllW(Result, '{SelCols}', IntToStr(NSelCols));
  SReplaceAllW(Result, '{SelChars}', IntToStr(NSelChars));

  SReplaceAllW(Result, '{TotalLines}', IntToStr(CurrentEditor.Lines.Count));
  if Pos('{TotalChars}', Result)>0 then
    SReplaceAllW(Result, '{TotalChars}', IntToStr(CurrentEditor.Lines.TextLength));

  SReplaceAllW(Result, '{Carets}', IntToStr(NCarets));
  SReplaceAllW(Result, '{CaretsTopLine}', IntToStr(NTopLine+1));
  SReplaceAllW(Result, '{CaretsBottomLine}', IntToStr(NBottomLine+1));

  if CurrentFrame.FileName<>'' then
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
  if Ed.SelLength=0 then begin MsgBeep; Exit end;

  S:= TntClipboard.AsWideText;
  if S='' then begin MsgBeep; Exit end;

  //set finder
  Finder.FindText:= Ed.SelText;
  Finder.ReplaceText:= S;
  Finder.Flags:= Finder.Flags
    - [ftBackward, ftSelectedText, ftRegularExpr, ftPromtOnReplace]
    + [ftEntireScope];

  //replace
  NLine:= Ed.TopLine;
  Finder.ReplaceAll;
  if Finder.Matches>0 then
    EditorSetModified(Ed);
  Ed.TopLine:= NLine;

  MsgFound;
end;

procedure TfmMain.MsgFound;//(AllowOne: boolean = true);
var
  n: Integer;
begin
  n:= Finder.Matches;
  if n>0 then
    //if (n>1) or AllowOne then
      SetHint(WideFormat(DKLangConstW('Found'), [n]));
end;

procedure TfmMain.UpdateOutFromList(List: TWideStringList);
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

procedure TfmMain.fRereadOutExecute(Sender: TObject);
var
  ft: Widestring;
  List: TWideStringList;
  Enc: TOutputEnc;
begin
  ft:= SExpandVars('%temp%\SynWr$$.txt');
  if not (IsFileExist(ft) and (FGetFileSize(ft)>0)) then
    begin MsgNoFile(ft); Exit end;

  if FCurrTool>0 then
    Enc:= opTools[FCurrTool].ToolOutEncoding
  else
    Enc:= encOem;

  List:= TWideStringList.Create;
  try
    List.LoadFromFile(ft);
    FixListOutput(List, false{NoTags}, false{NoDups}, Enc,
      CurrentTabExpansion(CurrentEditor));
    UpdateOutFromList(List);
    UpdOut(tbOut);
    plOut.Show;
  finally
    FreeAndNil(List);
  end;
end;

procedure TfmMain.TBXItemLeftTreeClick(Sender: TObject);
begin
  UpdLeft(tbTree);
end;

procedure TfmMain.TBXItemLeftProjClick(Sender: TObject);
begin
  UpdLeft(tbProj);
end;

procedure TfmMain.ecToggleFocusProjectExecute(Sender: TObject);
begin
  if not plTree.Visible then
  begin
    ecShowTree.Execute;
    UpdLeft(tbProj);
    if Assigned(fmProj) then
      if fmProj.TreeProj.CanFocus then
        fmProj.TreeProj.SetFocus
  end
  else
  if Assigned(fmProj) and fmProj.TreeProj.Focused then
    FocusEditor
  else
  begin
    UpdLeft(tbProj);
    if Assigned(fmProj) then
      if fmProj.TreeProj.CanFocus then
        fmProj.TreeProj.SetFocus
  end;
end;

function TfmMain.DoAutoCloseTag: boolean;
  function IsNoPairTag(const s: string): boolean;
  const cList = 'area base basefont br col command embed frame hr img input keygen link meta param source track wbr';
  begin
    Result:= Pos(' '+LowerCase(s)+' ', ' '+cList+' ')>0;
  end;
const
  cOpenTagRegex = '\<\w+[ \w''"=\.,;\#\-\+:/]*'; //opening tag w/o ending '>'
var
  S, STag: ecString;
  nCaret, iEnd, i: integer;
begin
  Result:= false;
  if opAutoCloseTags and IsLexerWithTags(CurrentLexer) then
    with CurrentEditor do
    begin
      nCaret:= CaretStrPos;
      if (nCaret >= 1) and (nCaret <= Length(Lines.FText)) and
        (Lines.FText[nCaret] <> '/') then
      begin
        S:= Lines[CurrentLine];

        //get opening tag
        iEnd:= StrPosToCaretPos(nCaret).X;
        i:= iEnd;
        while (i>0) and (S[i]<>'<') do Dec(i);
        if i=0 then Exit;
        STag:= Copy(S, i, iEnd-i+1);
        if STag='' then Exit;

        if not IsStringRegex(STag, cOpenTagRegex) then
          begin SetHint('Auto-closing failed for tag: '+STag); Exit end;

        //get closing tag
        i:= 2;
        while (i<Length(STag)) and IsWordChar(STag[i+1]) do Inc(i);
        STag:= Copy(STag, 2, i-1);
        if IsNoPairTag(STag) then Exit;
        STag:= '></'+STag+'>';

        //insert closing tag after caret
        //then position on 2nd STag character
        InsertText(STag);
        CaretStrPos:= CaretStrPos-Length(STag)+1;
        Result:= true;
      end;
    end;
end;

function TfmMain.DoAutoCloseBracket(const ch: Widechar): boolean;
var
  Ed: TSyntaxMemo;
  ch2: Widechar;
  NStart, NLen: Integer;
begin
  Result:= false;
  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;
  NStart:= Ed.CaretStrPos;

  //options enabled?
  if (Pos(ch, '()[]{}')>0) and not opAutoCloseBrackets then Exit;
  if (Pos(ch, '"''')>0) and not opAutoCloseQuotes then Exit;

  //bracket is escaped?
  if opAutoCloseBracketsNoEsc then
    if (NStart>0) and (Ed.Lines.FText[NStart]='\') then Exit;

  //closing bracket is already under caret?
  if (Pos(ch, ')]}')>0) then
    if (NStart+1<=Length(Ed.Lines.FText)) and (Ed.Lines.FText[NStart+1]=ch) then
    begin
      //right 1 char
      Ed.CaretPos:= Point(Ed.CaretPos.X+1, Ed.CaretPos.Y);
      Result:= true;
      Exit
    end;

  case ch of
    '(': ch2:= ')';
    '[': ch2:= ']';
    '{': ch2:= '}';
    '"',
    '''': ch2:= ch;
    else Exit
  end;

  if Ed.SelLength=0 then
  //simply input start+end brackets
  begin
    Ed.InsertText(WideString(ch)+WideString(ch2));
    Ed.CaretStrPos:= Ed.CaretStrPos-1;
  end
  else
  //code to wrap selection with brackets
  begin
    Ed.BeginUpdate;
    try
      NStart:= Ed.SelStart;
      NLen:= Ed.SelLength;
      Ed.ResetSelection;
      Ed.CaretStrPos:= NStart+NLen;
      Ed.InsertText(ch2);
      Ed.CaretStrPos:= NStart;
      Ed.InsertText(ch);
      Ed.SetSelection(NStart+1, NLen);
    finally
      Ed.EndUpdate;
    end;
  end;

  Result:= true;
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
  if not IsLexerWithImages(CurrentLexer) then
    begin MsgBeep; Exit end;

  fn:= '';
  if PromptForFileName(fn, filter, '', '', ExtractFileDir(CurrentFrame.FileName)) then
    DoInsertImageTag(fn);
end;

procedure TfmMain.DoInsertImageTag(const fn: string);
var
  fn_wdx, s: string;
  IsCss: boolean;
begin
  if CurrentEditor.ReadOnly then Exit;
  if not IsLexerWithImages(CurrentLexer) then
    begin MsgBeep; Exit end;

  fn_wdx:= SynImagesDll;
  if not IsFileExist(fn_wdx) then
    begin MsgNoFile(fn_wdx); Exit end;

  IsCss:= IsLexerCss(CurrentLexer);
  s:= SGetImageTag(fn, fn_wdx, IsCss);
  if s='' then
    begin MsgBeep; Exit end;
    
  with CurrentEditor do
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
  FOnlineWordHelp('http://www.w3schools.com/tags/tag_%s.asp');
end;

procedure TfmMain.TbxItemRunFindHtml5Click(Sender: TObject);
begin
  FOnlineWordHelp('http://dev.w3.org/html5/markup/%s.html');
end;

procedure TfmMain.ecRulerExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    HorzRuler.Visible:= not HorzRuler.Visible;
    TemplateEditor.HorzRuler.Visible:= HorzRuler.Visible;
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

procedure TfmMain.DoRangeJump(Ed: TSyntaxMemo);
var
  n: Integer;
  BrHere, BrLefter: boolean;
begin
  n:= Ed.CaretStrPos;
  BrHere:= (n >= 0) and (n < Ed.TextLength) and (Pos(Ed.Lines.FText[n+1], '()[]{}') > 0);
  BrLefter:= (n > 0) and (n-1 < Ed.TextLength) and (Pos(Ed.Lines.FText[n], '()[]{}') > 0);

  if BrHere then
    DoBracketJump
  else
  begin
    //EC jump
    Ed.JumpToMatchDelim;

    //bracket jump
    //if (n = Ed.CaretStrPos) and BrHere then
    //  DoBracketJump;
    
    //if bracket jump did nothing, try jump for lefter bracket
    if (n = Ed.CaretStrPos) and BrLefter then
    begin
      Ed.CaretStrPos:= n-1;
      DoBracketJump;
    end;
  end;
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
      AddBookmarksToSortedList(ed, L);
    finally
      Screen.Cursor:= crDefault;
    end;

    if L.Count=0 then
      begin MsgBeep; Exit end;

    with TfmGotoBkmk.Create(nil) do
    try
      with TIniFile.Create(SynIni) do
      try
        Width:= ReadInteger('Win', 'BkW', Width);
        Height:= ReadInteger('Win', 'BkH', Height);
      finally
        Free
      end;

      //fill form
      List.Font.Assign(ed.Font);
      List.Items.Clear;
      for i:= 0 to L.Count-1 do
        List.Items.Add(BookmarkDesc(Integer(L[i]), 60, true, true));

      //select curr bookmk
      List.ItemIndex:= 0;
      nPos:= ed.CaretStrPos;
      for i:= L.Count-1 downto 0 do
        if ed.Bookmarks[Integer(L[i])] <= nPos then
          begin List.ItemIndex:= i; Break end;
      List.Selected[List.ItemIndex]:= true;

      if ShowModal=mrOk then
      begin
        with TIniFile.Create(SynIni) do
        try
          WriteInteger('Win', 'BkW', Width);
          WriteInteger('Win', 'BkH', Height);
        finally
          Free
        end;

        i:= List.ItemIndex;
        if i>=0 then
        begin
          //Shift pressed?
          if GetKeyState(vk_shift)<0 then
            DoEditorSelectToPosition(ed, ed.Bookmarks[Integer(L[i])])
          else
            ed.GotoBookmark(Integer(L[i]));
            
          CenterMemoPos(ed, true{GotoMode});
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
  //
  function BkStr(const S: Widestring; NLine: Integer): Widestring;
  var
    n: Integer;
  begin
    Result:= S;
    SReplaceAllW(Result, #9, CurrentTabExpansion(CurrentEditor));

    try
      if not opStripBkmk then Exit;

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
      begin SetHint(DKlangConstW('zMNoBookmk')); MsgBeep; Exit end;

    with TfmGotoBkmk.Create(nil) do
    try
      with TIniFile.Create(SynIni) do
      try
        Width:= ReadInteger('Win', 'BkW', Width);
        Height:= ReadInteger('Win', 'BkH', Height);
      finally
        Free
      end;

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
        with TIniFile.Create(SynIni) do
        try
          WriteInteger('Win', 'BkW', Width);
          WriteInteger('Win', 'BkH', Height);
        finally
          Free
        end;

        i:= List.ItemIndex;
        if i>=0 then
        begin
          //Shift pressed?
          if GetKeyState(vk_shift)<0 then
            DoEditorSelectToPosition(ed, ed.CaretPosToStrPos(Point(0, Integer(L[i]))))
          else
            ed.CaretPos:= Point(0, Integer(L[i]));

          CenterMemoPos(ed, true{GotoMode});
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
  CurrentEditor.ExecCommand(sm_GotoBookmkDialog);
end;

procedure TfmMain.TBXItemRunLoremIpsumClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_LoremIpsum);
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
    with TIniFile.Create(SynIni) do
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

    with TIniFile.Create(SynIni) do
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
    s:= SLoremIpsum(List, AMode, ACnt, ATags, CurrentCR(CurrentEditor));
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
  CurrentEditor.ExecCommand(sm_FavAddFile);
end;

procedure TfmMain.TBXItemFavManageClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FavOrganize);
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

procedure TfmMain.fFavManageExecute(Sender: TObject);
begin
  with TfmFav.Create(nil) do
  try
    FIniFN:= SynFavIni;
    FOptFN:= SynIni;
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
      //apply splitter color
      SplitterEds.Invalidate;
      //apply tab caption options
      DoTitleChanged;
    end;
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
      Result:= Result+ Color2str(Items[i].Tag)+',';
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
      Code:= Hex2color(SItem);
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
      FMenuItem_Colors_Clear.Caption:= TBXItemFClr.Caption;
      FMenuItem_Colors_Save.Caption:= TBXItemFSaveAs.Caption;
      FMenuItem_Colors_Open.Caption:= TBXItemFOpen.Caption;
      FMenuItem_Colors_Select.Caption:= TBXItemEColor.Caption;

      en:= ImageListColorRecent.Count>1;
      FMenuItem_Colors_Select.Enabled:= not CurrentEditor.ReadOnly;
      FMenuItem_Colors_Save.Enabled:= en;
      FMenuItem_Colors_Clear.Enabled:= en;
    end;
end;

function TfmMain.IsMouseInProj: boolean;
begin
  if Assigned(fmProj) and fmProj.Visible and plTree.Visible then
    Result:= PtInRect(
      Rect(0, 0, fmProj.Width, fmProj.Height),
      fmProj.ScreenToClient(Mouse.CursorPos))
  else
    Result:= false;
end;
        
procedure TfmMain.DoDropFile(const fn: Widestring; IntoProj: boolean = false);
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
  if not IsFileExist(fn) then
    Exit ////MsgNoFile(fn)
  else
  if not IsFileText(fn) and not MsgConfirmBinary(fn) then
    Exit
  else
    DoOpenFile(fn);
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
    if not MsgConfirmManyOpen(Files.Count) then Exit;

  Bads:= TTntStringList.Create;
  try
    for i:= 0 to Files.Count-1 do
    begin
      fn:= Files[i];
      if IsFileExist(fn) then
      begin
        if IsFileText(fn) or MsgConfirmBinary(fn) then
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
var
  i: Integer;
begin
  Files.Add(' '+DKLangConstW('None')); //needed for proj too
  with SyntaxManager do
    for i:= 0 to AnalyzerCount-1 do
      if not Analyzers[i].Internal then
        Files.Add(Analyzers[i].LexerName);
end;

procedure TfmMain.TBXItemFavAddProjClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_FavAddProj);
end;

procedure TfmMain.fFavAddFileExecute(Sender: TObject);
begin
  DoAddFav(CurrentFrame.FileName);
end;

procedure TfmMain.fFavAddProjExecute(Sender: TObject);
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

procedure TfmMain.TBXSubmenuFavPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  TBXItemFavAddFile.Enabled:= CurrentFrame.FileName<>'';
  TBXItemFavAddProj.Enabled:= CurrentProjectFN<>'';
end;

procedure TfmMain.ProjGetWorkDir(Sender: TObject; Files: TTntStrings);
begin
  Files.Add(LastDir);
end;

procedure TfmMain.TBXItemTbAddToProjClick(Sender: TObject);
var F: TEditorFrame;
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
  UpdRight(tbTextClips);
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
    UpdRight(tbTextClips);
    if Assigned(fmClips) then
      if fmClips.List.CanFocus then
        fmClips.List.SetFocus;
  end
  else
  if Assigned(fmClips) and fmClips.List.Focused then
    FocusEditor
  else
  begin
    UpdRight(tbTextClips);
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
  S:= CurrentEditor.SelText;
  SReplaceAllW(S, #13#10, '\n');
  SReplaceAllW(S, #13, '\n');
  SReplaceAllW(S, #10, '\n');

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
var
  fn: string;
begin
  with OD_Swatch do
  begin
    InitialDir:= LastDir;
    FileName:= '';
    if not Execute then Exit;
    fn:= FileName;
  end;

  with TIniFile.Create(fn) do
  try
    RecentColorsStr:= ReadString('Ini', 'Col', '');
  finally
    Free
  end;
end;

procedure TfmMain.RecentColorSave(Sender: TObject);
var
  fn: string;
begin
  with SD_Swatch do
  begin
    InitialDir:= LastDir;
    FileName:= '';
    if not Execute then Exit;
    fn:= FileName;
  end;

  with TIniFile.Create(fn) do
  try
    WriteString('Ini', 'Col', RecentColorsStr);
  finally
    Free
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
  end;
end;

function TfmMain.MsgInput(const dkmsg: string; var S: Widestring): boolean;
begin
  //Result:= WideInputQuery('SynWrite', DKLangConstW(dkmsg), S);
  Result:= DoInputString(dkmsg, S);
end;

procedure TfmMain.MsgCloseHint(panelType: TSynPanelType);
const
  Cmd: array[TSynPanelType] of integer = (sm_OShowTree, sm_OShowClip, sm_OShowOut);
begin
  SetHint(DKLangConstW('zMCloseHint') + ' ' + ShortcutToText(ShFor(Cmd[panelType])));
end;

procedure TfmMain.plTreeContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  MsgCloseHint(plTypeTree);
end;

procedure TfmMain.plClipContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  MsgCloseHint(plTypeClip);
end;

procedure TfmMain.plOutContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  MsgCloseHint(plTypeOut);
end;

procedure TfmMain.TBXTabColorChange(Sender: TObject);
begin
  DoSetTabColorValue(TbxTabColor.Color);
end;

procedure TfmMain.DoSetFrameTabColor(F: TEditorFrame; NColor: Longint);
begin
  if F<>nil then
  begin
    F.TabColor:= NColor;
    PageControl1.Invalidate;
    PageControl2.Invalidate;
  end;
end;

procedure TfmMain.DoSetTabColorValue(NColor: Longint);
begin
  DoSetFrameTabColor(FClickedFrame, NColor);
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
        with TColorDialog.Create(nil) do
        try
          Options:= Options+[cdFullOpen];
          if Execute then
            NColor:= Color
          else
            Exit;
        finally
          Free
        end;
      end;
    1..10:
      NColor:= opTabColors[NIndex-1];
    else
      raise Exception.Create('Unknown tab color index');
  end;
  
  DoSetFrameTabColor(CurrentFrame, NColor);
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
  with TColorDialog.Create(nil) do
  try
    Options:= Options+[cdFullOpen];
    if Execute then
      DoSetTabColorValue(Color);
  finally
    Free
  end;
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
    Result:= Result+ Color2Str(opTabColors[i])+',';
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
    opTabColors[i]:= Hex2Color(SItem);
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

function TfmMain.CurrentSelectionFN(Unicode: boolean): Widestring;
var
  S: Widestring;
begin
  Result:= SExpandVars('%temp%\SynWrSel.txt');
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
  opSmartHi:= not opSmartHi;
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


procedure TfmMain.fRenameExecute(Sender: TObject);
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
    if not DoInputFilename('zMRename', sName) then Exit;

    fn_new:= WideExtractFilePath(fn) + sName;
    if not IsFileExist(fn_new) then
      Break
    else
      MsgBeep;
  until false;

  fClose.Execute;
  if not MoveFileW(PWChar(fn), PWChar(fn_new)) then
  begin
    MsgError(DKLangConstW('zMRenameErr')+#13+fn+#13'-->'#13+fn_new, Handle);
    DoOpenFile(fn);
  end
  else
  begin
    SynMruFiles.DeleteItem(fn);
    DoOpenFile(fn_new);
    DoRefreshPluginsFiles(fn_new);
  end;

  CurrentFrame.TabColor:= NColor;
end;

procedure TfmMain.ApplySpell;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    UpdateSpell(FramesAll[i]);
end;


function TfmMain.OppositeFrame: TEditorFrame;
var
  P: TTntPageControl;
begin
  if PageControl=PageControl2 then
    P:= PageControl1
  else
    P:= PageControl2;

  Result:= PagesToFrame(P, P.ActivePageIndex);
end;

function TfmMain.OppositeFileName: Widestring;
var
  F: TEditorFrame;
begin
  Result:= '';
  F:= OppositeFrame;
  if F<>nil then
    Result:= F.FileName;
end;

procedure TfmMain.TBXItemRunNumConvClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_NumericConverter);
end;

procedure TfmMain.ecNumericConverterExecute(Sender: TObject);
begin
  if not Assigned(fmNumConv) then
  begin
    fmNumConv:= TfmNumConv.Create(Self);
    fmNumConv.FormStyle:= fsStayOnTop;
    fmNumConv.OnInsert:= NumConvInsert;
    with TIniFile.Create(SynIni) do
    try
      fmNumConv.Left:= ReadInteger('Win', 'NConvX', 400);
      fmNumConv.Top:= ReadInteger('Win', 'NConvY', 300);
    finally
      Free
    end;    
  end;
  fmNumConv.Show;
end;

procedure TfmMain.NumConvInsert(Sender: TObject; const S: string);
begin
  CurrentEditor.InsertText(S);
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
  function SIndentOf(const s: Widestring): Widestring;
  var
    i: Integer;
  begin
    Result:= '';
    for i:= 1 to Length(s) do
      if not IsSpaceChar(s[i]) then
        begin Result:= Copy(s, 1, i-1); Break end;
  end;

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

  DoGetSelLines(ed, Ln1, Ln2);
  if Ln2=Ln1 then
    begin MsgWarn(DKLangConstW('zMSelMulLine'), Handle); Exit end;

  with ed do
  begin
    Ind_Old:= SIndentOf(Lines[Ln1]);
      
    BeginUpdate;
    ShowProgress;

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
      HideProgress;
      EndUpdate;
    end;
  end;

  FocusEditor;
end;

procedure TfmMain.fColumnMarkersExecute(Sender: TObject);
var
  S: Widestring;
begin
  S:= CurrentFrame.ColMarkers;
  
  with TIniFile.Create(SynIni) do
  try
    if S='' then
      S:= ReadString('Win', 'ColMark', '');
    if not MsgInput('zMColMark', S) then Exit;
    if S<>'' then
      WriteString('Win', 'ColMark', S);
  finally
    Free
  end;

  CurrentFrame.ColMarkers:= S;
  CurrentFrame.EditorMaster.Invalidate;
  CurrentFrame.EditorSlave.Invalidate;
end;

procedure TfmMain.ecJumpColumnMarkerLeftExecute(Sender: TObject);
begin
  CurrentFrame.JumpToColumnMarker(true);
end;

procedure TfmMain.ecJumpColumnMarkerRightExecute(Sender: TObject);
begin
  CurrentFrame.JumpToColumnMarker(false);
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
  i, NIndex: Integer;
  fn_plug_ini,
  fn_plug_def_ini: string;
  sKey, sValue, sValue2, sValue3, sValue4: Widestring;
  ListSec: TStringList;
begin
  //clear Panels list
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
    begin
      SCaption:= '';
      SFileName:= '';
    end;

  //clear FindID list
  for i:= Low(FPluginsFindid) to High(FPluginsFindid) do
    with FPluginsFindid[i] do
    begin
      SLexers:= '';
      SFileName:= '';
    end;

  //clear ACP list
  for i:= Low(FPluginsAcp) to High(FPluginsAcp) do
    with FPluginsAcp[i] do
    begin
      SLexers:= '';
      SFileName:= '';
    end;

  //clear Command list
  for i:= Low(FPluginsCommand) to High(FPluginsCommand) do
    with FPluginsCommand[i] do
    begin
      SFileName:= '';
      SLexers:= '';
      SCmd:= '';
    end;

  fn_plug_ini:= SynPluginsIni;
  fn_plug_def_ini:= SynPluginsSampleIni;
  if not IsFileExist(fn_plug_ini) then
    CopyFileA(PAnsiChar(fn_plug_def_ini), PAnsiChar(fn_plug_ini), true);
  if not IsFileExist(fn_plug_ini) then
    Exit;

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
    NIndex:= Low(FPlugins);
    for i:= 0 to ListSec.Count-1 do
    begin
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPlugins) then
      begin
        FPlugins[NIndex].SCaption:= sKey;
        FPlugins[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
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
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsFindid) then
      begin
        FPluginsFindid[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsFindid[NIndex].SLexers:= sValue2;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
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
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsAcp) then
      begin
        FPluginsAcp[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsAcp[NIndex].SLexers:= sValue2;
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
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
      SGetKeyAndValues(ListSec[i], sKey, sValue, sValue2, sValue3, sValue4);
      if (sKey='') or (sValue='') then Continue;

      if NIndex<=High(FPluginsCommand) then
      begin
        FPluginsCommand[NIndex].SFileName:= SynDir + 'Plugins\' + sValue;
        FPluginsCommand[NIndex].SCmd:= sValue2;
        FPluginsCommand[NIndex].SLexers:= sValue3;
        DoAddPluginMenuItem(sKey, sValue4, NIndex);
        Inc(NIndex);
      end;
    end;
  finally
    FreeAndNil(ListSec);
  end;


  //test
  {
  sValue:= '';
  for i:= 0 to 7 do
    with FPluginsCommand[i] do
      sValue:= sValue+sFilename+#13+sLexers+#13+SCmd+#13#13;
  MsgError(sValue);
  }
end;

procedure TfmMain.LoadPluginsInfo;
var
  i: Integer;
  Item: TSpTbxTabItem;
begin
  //disable plugins in WLX
  if not SynExe then Exit;

  DoLoadPluginsList;
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
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
  if FPlugins[N].SCaption='' then Exit;

  plTree.Caption:= FPlugins[N].SCaption;
  FTabLeft:= TSynTabLeft(N+cFixedLeftTabs);

  Tree.Visible:= false;
  Tree.SyntaxMemo:= nil;
  if Assigned(fmProj) then
    fmProj.Visible:= false;

  //check buttons
  UpdateCheckLeftTabs(false, false, false);
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
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
  with FPlugins[Index] do
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
  i: Integer;
  X, Y, XSize, YSize: Integer;
begin
  X:= 0;
  Y:= plTree.CaptionPanelSize.Y;
  XSize:= plTree.ClientWidth;
  YSize:= plTree.ClientHeight - Y - tbTabsLeft.Height;

  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if FWindow<>0 then
        SetWindowPos(FWindow, 0, X, Y, XSize, YSize, 0);
end;

procedure TfmMain.DoClosePlugins;
var
  i: Integer;
begin
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if (FForm<>nil) and Assigned(FSynCloseForm) then
        FSynCloseForm(FForm);
end;

procedure TfmMain.DoShowPlugin(N: Integer);
var
  i: Integer;
begin
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
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

  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if SCaption=AName then
      begin
        if not plTree.Visible then
          ecShowTree.Execute;
        PluginPanelItemClick(FToolButton);
        with FPlugins[i] do
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
    cfm:= MsgConfirmBinary(fn)
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
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
    begin
      if FForm=nil then Break;
      if FForm=AHandle then
        begin Result:= SFileName; Break end;
    end;
end;
}

function TfmMain.PluginAction_GetMsg(const ADllFN, AMsg: Widestring; AResult: PWideChar): Integer;
  function GetFN(const fn_dll, Suffix: string): string;
  begin
    Result:= ChangeFileExt(fn_dll, '.'+Suffix+'.lng');
  end;
const
  cSection = 'L';
var
  S: Widestring;
  fn_lng, fn_en_lng: string;
begin
  fn_lng:= GetFN(ADllFN, FHelpLangSuffix);
  fn_en_lng:= GetFN(ADllFN, 'En');
  S:= '';

  if fn_lng<>fn_en_lng then
    with TIniFile.Create(fn_lng) do
    try
      S:= UTF8Decode(ReadString(cSection, AMsg, ''));
    finally
      Free
    end;

  if S='' then
    with TIniFile.Create(fn_en_lng) do
    try
      S:= UTF8Decode(ReadString(cSection, AMsg, ''));
    finally
      Free
    end;

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
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionRefreshFileList, PWChar(fn), nil, nil, nil);
end;

procedure TfmMain.DoRefreshPluginsLang;
var
  i: Integer;
begin
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionUpdateLang, nil, nil, nil, nil);
end;

procedure TfmMain.DoPluginsRepaint;
var
  i: Integer;
begin
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionRepaint, nil, nil, nil, nil);
end;

procedure TfmMain.DoPluginSaveFtpFile(F: TEditorFrame);
var
  i: Integer;
begin
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
      if (FForm<>nil) and Assigned(FSynAction) then
        FSynAction(FForm, cActionSaveFtpFile,
          PWideChar(Widestring(F.FileName)),
          F.FtpInfoPtr, Pointer(F.FtpInfoSize), nil);
end;


procedure TfmMain.TBXItemOOPLogClick(Sender: TObject);
begin
  UpdOut(tbPluginsLog);
end;

function TfmMain.PluginAction_ShowHint(const AMsg: Widestring): Integer;
begin
  SetHint(AMsg);
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
        UpdOut(tbOut);
      end;
    cSynLogCmdShow:
      begin
        TbxTabPlugins.Visible:= true;
        UpdOut(tbPluginsLog);
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
    begin TbxItemPLogClearClick(Self); Key:= 0 end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
    begin TbxItemPLogCopySelClick(Self); Key:= 0 end;
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

procedure TfmMain.DoRepaintTabCaptions;
var
  i: Integer;
begin
  for i:= 0 to PageControl.PageCount-1 do
    PageControl1DrawTab(PageControl, i, Rect(0, 0, 0, 0), false);
end;

//--------------------
function TfmMain.SGetTabPrefix: Widestring;
begin
  Result:= DKLangConstW('Tab') + ':';
end;

procedure TfmMain.DoFindInTabs;
var
  NTotalSize, NDoneSize: Int64;
  i: Integer;
  ADir: Widestring;
  F: TEditorFrame;
begin
  FListFiles.Clear;
  for i:= 0 to FrameAllCount-1 do
    FListFiles.AddObject('',
      Pointer(FramesAll[i].EditorMaster.TextLength));

  {
  if FListFiles.Count=0 then
  begin
    MsgWarn(DKLangConstW('fnMul'));
    Exit
  end;
  }

  FListResFN:= '';
  FListResFN_Prev:= '';
  ADir:= '';

  //Init TreeRoot, show pane
  UpdateTreeInit(Finder.FindText, ADir, true);
  UpdOut(tbFind);
  plOut.Show;

  ShowProgress(proFindText);
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
      HideProgress;
      Exit;
    end;
  end;

  if StopFind then
  begin
    StopFind:= false;
    UpdateTreeFind(Finder.FindText, ADir, true, true);
    Exit
  end;

  if FTreeRoot=nil then
    raise Exception.Create('TreeRoot nil');
  if FTreeRoot.GetFirstChild=nil then
  begin
    UpdateTreeFind(Finder.FindText, ADir, false, true);
  end
  else
  begin
    UpdateTreeFind(Finder.FindText, ADir, false, true);
    UpdOut(tbFind);
    plOut.Show;
  end;
end;

procedure TfmMain.FindInFrame(F: TEditorFrame);
begin
  Finder.OnBeforeExecute:= nil;
  Finder.OnNotFound:= nil;
  Finder.OnFind:= FinderFind;
  Finder.OnCanAccept:= FinderCanAccept;
  Finder.OnContinue:= FinderContinue;
  FLastOnContinueCheck:= 0;
  try
    Finder.Control:= F.EditorMaster;
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

procedure TfmMain.ecPasteNoCurChangeExecute(Sender: TObject);
var
  NPos: TPoint;
  NLine: Integer;
begin
  with CurrentEditor do
    if not ReadOnly then
    begin
      NPos:= CaretPos;
      NLine:= TopLine;
      ExecCommand(smPaste);
      CaretPos:= NPos;
      TopLine:= NLine;
    end;
end;

procedure TfmMain.TBXItemHEmmetClick(Sender: TObject);
begin
{
  fn:= SynDir + 'Readme\ZenCodingCheatSheet.pdf';
  if not IsFileExist(fn) then
    MsgNoFile(fn)
  else
    FExecute(fn, '', '', Handle);
}
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

procedure TfmMain.ecJumpMixedCaseLeftExecute(Sender: TObject);
begin
  DoJumpMixedCase(false);
end;

procedure TfmMain.ecJumpMixedCaseRightExecute(Sender: TObject);
begin
  DoJumpMixedCase(true);
end;

procedure TfmMain.DoJumpMixedCase(ARight: boolean);
var
  s: ecString;
  P: Integer;
begin
  with CurrentEditor do
  begin
    s:= Lines.FText;
    P:= CaretStrPos;
    if s='' then Exit;
    if ARight then
    begin
      if not ((P>=0) and (P<Length(s)) and IsWordChar(s[P+1])) then
        begin MsgBeep; Exit end;
      repeat
        if (P+1>Length(s)) or not IsWordChar(s[P+1]) then Break;
        Inc(P);
        if IsUpperChar(s[P+1]) then Break;
      until false;
    end
    else
    begin
      if not ((P>0) and (P<=Length(s)) and IsWordChar(s[P])) then
        begin MsgBeep; Exit end;
      repeat
        if (P=0) or not IsWordChar(s[P]) then Break;
        Dec(P);
        if IsUpperChar(s[P+1]) then Break;
      until false;
    end;
    CaretStrPos:= P;
  end;
end;

procedure TfmMain.ecCancelSelectionExecute(Sender: TObject);
begin
  with CurrentEditor do
  begin
    ResetSelection;
  end;
end;

procedure TfmMain.ecCenterLinesExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  Ln1, Ln2, i: Integer;
  s: ecString;
begin
  Ed:= CurrentEditor;
  with Ed do
    if (not ReadOnly) and (Lines.Count>0) then
    begin
      DoGetSelLines(Ed, Ln1, Ln2);
      Ed.BeginUpdate;
      try
        for i:= Ln1 to Ln2 do
        begin
          s:= WideTrim(Lines[i]);
          if Length(s)<RightMargin then
          begin
            s:= StringOfChar(' ', (RightMargin-Length(s)) div 2) + s;
            DoReplaceLine(Ed, i, s, true{ForceUndo});
          end;
        end;
      finally
        Ed.EndUpdate;
      end;
    end;
end;

procedure TfmMain.TBXItemLeftTabsClick(Sender: TObject);
begin
  UpdLeft(tbTabs);
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
    UpdateTabList(PageControl.ActivePageIndex, -1, -1);
    {
    if ListTabs.CanFocus then
      ListTabs.SetFocus;
      }
    FocusEditor;  
  end;
end;

procedure TfmMain.ListTabsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  N: Integer;
begin
  if (Key=vk_delete) and (Shift=[]) then
  begin
    N:= ListTab_FrameIndex;
    if (N>=0) and (N<FrameAllCount) then
    begin
      CloseFrameWithCfm(FramesAll[N]);
      if FrameAllCount=0 then
        fNew.Execute;
      UpdatePages;
      
      if ListTabs.CanFocus then
        ListTabs.SetFocus;
    end;
    Key:= 0;
    Exit;
  end;

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
    UpdLeft(tbTabs);
    if ListTabs.CanFocus then
      ListTabs.SetFocus
  end
  else
  if ListTabs.Focused then
    FocusEditor
  else
  begin
    UpdLeft(tbTabs);
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
var
  i: Integer;
begin
  for i:= Low(FPluginsFindid) to High(FPluginsFindid) do
    with FPluginsFindid[i] do
      if IsLexerListed(CurrentLexer, SLexers) then
      begin
        DoLoadPlugin_FindID(i);
        Exit
      end;
end;

function TfmMain.DoAcpFromPlugins(const AAction: PWideChar): Widestring;
var
  i: Integer;
begin
  Result:= '';
  for i:= Low(FPluginsAcp) to High(FPluginsAcp) do
    with FPluginsAcp[i] do
      if IsLexerListed(CurrentLexer, SLexers) then
      begin
        SetHint(DKLangConstW('zMTryAcp')+' '+ExtractFileName(SFileName));
        Result:= DoLoadPlugin_GetString(
          SFilename,
          AAction);
        SetHint('');
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
  AText: array[0..2047] of WideChar;
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
      SetHint(WideFormat(DKLangConstW('zMNoneLexer'), [SLexers]));
      MsgBeep;
      Exit;
    end;

    //MsgInfo(SFileName+#13+SCmd+#13);
    DoLoadPlugin_Action(
      SFilename,
      cActionMenuCommand,
      PWChar(WideString(SCmd)),
      nil,
      nil,
      nil);
  end;
end;

procedure TfmMain.DoAddPluginMenuItem(const SKey, SShortcut: Widestring; NIndex: Integer);
var
  ItemSub: TSpTbxSubmenuItem;
  Item: TSpTbxItem;
  S, CapMenu, CapItem: Widestring;
  N, i: Integer;
begin
  with TbxSubmenuItemPlugins do
  begin
    Visible:= true;

    S:= SKey;
    CapMenu:= SGetItem(S, '\');
    CapItem:= SGetItem(S, '\');

    N:= -1;
    for i:= 0 to Count-1 do
      if Items[i].Caption=CapMenu then
        begin N:= i; Break end;

    if N<0 then
    begin
      ItemSub:= TSpTbxSubmenuItem.Create(Self);
      ItemSub.Caption:= CapMenu;
      Add(ItemSub);
    end
    else
      ItemSub:= (Items[N] as TSpTbxSubmenuItem);

    Item:= TSpTbxItem.Create(Self);
    Item.Caption:= CapItem;
    Item.Tag:= NIndex;
    Item.ShortCut:= TextToShortcut(SShortcut);
    Item.OnClick:= PluginCommandItemClick;
    ItemSub.Add(Item);
  end;
end;

procedure TfmMain.FindFocusEditor(Sender: TObject);
begin
  FocusEditor;
end;

procedure TfmMain.TBXItemOEditSynPluginsIniClick(Sender: TObject);
begin
  DoOpenFile(SynPluginsIni);
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
  sCR:= CurrentCR(Ed);

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
          DoGetSelLines(Ed, Ln1, Ln2);
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
        s:= opProjPaths;
        if Assigned(fmProj) then
          s:= s + fmProj.FOpts.SearchDirs;
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
        DoGetSelLines(Ed, Ln1, Ln2);
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
    cSynPropLineEnds: SetStr(CurrentCR(Ed));
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

procedure TfmMain.TBXItemTbMoveToWindowClick(Sender: TObject);
begin
  DoMoveTabToWindow(FPagesNTabCtx, true);
end;

procedure TfmMain.TBXItemTbOpenInWindowClick(Sender: TObject);
begin
  DoMoveTabToWindow(FPagesNTabCtx, false);
end;

procedure TfmMain.DoMoveTabToWindow(NTab: integer; AndClose: boolean);
var
  Frame: TEditorFrame;
begin
  if not SynExe then
    begin MsgBeep; Exit; end;

  if NTab<0 then
    NTab:= PageControl.ActivePageIndex;
  if NTab<0 then
    begin MsgBeep; Exit; end;
  Frame:= Frames[NTab];

  if Frame.FileName='' then
    begin MsgBeep; Exit; end;
  if opSingleInstance then
    begin MsgBeep; Exit end;

  if not FExecute(Application.ExeName, '"'+Frame.FileName+'"', '', Handle) then
    begin MsgBeep; Exit end;

  if AndClose then
  begin
    CloseFrameWithCfm(Frame);
    UpdatePages;
  end;
end;


procedure TfmMain.ecExtendSelByLineExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  DoNext: boolean;
  NStart, NEnd: Integer;
begin
  Ed:= CurrentEditor;
  NStart:= Ed.SelStart;
  NEnd:= Ed.SelStart+Ed.SelLength;

  DoNext:=
    (Ed.SelLength>0) and
    (Ed.CaretStrPos = NEnd) and
    (Ed.StrPosToCaretPos(NStart).X = 0) and
    ((Ed.StrPosToCaretPos(NEnd).X = 0) or (NEnd = Ed.TextLength));
    
  if not DoNext then
  begin
    Ed.ResetSelection;
    Ed.ExecCommand(smLineStart);
  end;
  Ed.ExecCommand(smSelDown);
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

procedure TfmMain.UpdateMicroMap(F: TEditorFrame);
begin
  F.SyncMap;
end;

procedure TfmMain.ProjLoadMRU(List: TSynMruList);
var
  Ini: TIniFile;
begin
  Ini:= TIniFile.Create(SynIni);
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
  Ini:= TIniFile.Create(SynIni);
  try
    SaveMruList(List, Ini, 'MRU_Proj');
  finally
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.TBXItemRunEncodeHtmlClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_EncodeHtmlChars);
end;

procedure TfmMain.ecEncodeHtmlCharsExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  S: Widestring;
begin
  Ed:= CurrentEditor;
  if Ed.ReadOnly then Exit;
  if Ed.SelLength=0 then
    begin MsgNoSelection; Exit end;
  S:= SEncodeHtmlChars(Ed.SelText);
  Ed.ReplaceText(Ed.SelStart, Ed.SelLength, S);
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
    begin Ln1:= 0; Ln2:= Ed.Lines.Count-1; end
  else
    DoGetSelLines(Ed, Ln1, Ln2);
  if (Ln2-Ln1)<1 then
    begin MsgBeep; Exit end;

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
          i:= DoListCommand_Untab(L, CurrentTabSize(Ed));
          ok:= i>0;
          MsgDoneLines(i);
        end;

      scmdSpacesToTabs:
        begin
          ok:= DoListCommand_Unspace(L, CurrentTabSize(Ed), false);
        end;
      scmdSpacesToTabsLead:
        begin
          ok:= DoListCommand_Unspace(L, CurrentTabSize(Ed), true);
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
            FNew.Execute;
            CurrentEditor.InsertText(L.Text);
          end;  
          MsgDoneLines(i);
        end;

      scmdAlignWithSep:
        begin
          //read separator from ini
          with TIniFile.Create(SynIni) do
          try
            Sep:= UTF8Decode(ReadString('Win', 'AlignSep', '='));
            ok:= DoInputString('zMEnterSep', Sep) and (Sep<>'');
            if ok then
              WriteString('Win', 'AlignSep', UTF8Encode(Sep));
          finally
            Free
          end;
          //do alignment
          if ok then
          begin
            i:= DoListCommand_AlignWithSep(L, Sep, CurrentTabSize(Ed){, soOptimalFill in Ed.Options});
            ok:= i>0;
            MsgDoneLines(i);
          end;
        end;
      else
        ok:= false;
    end;
    if not ok then Exit;

    //get resulting string
    S:= L.Text;
    //correct EOLs
    FixLineEnds(S, Ed.Lines.TextFormat);
  finally
    FreeAndNil(L);
  end;

  //insert string into editor
  Ed.BeginUpdate;
  try
    Ed.ReplaceText(Pos1, Pos2-Pos1, S);
    Ed.CaretStrPos:= Pos1+Length(S);
    EditorSetModified(Ed);
  finally
    Ed.EndUpdate;
  end;
end;

procedure TfmMain.ecSelBracketsExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  //-----------------
  function DoSel: boolean;
  var
    n1, n2: Integer;
    nn1, nn2: Integer;
  begin
    DoFindBrackets(n1, n2);
    Result:= n2>=0;
    if Result then
    begin
      nn1:= Min(n1, n2);
      nn2:= Max(n1, n2);
      Ed.SetSelection(nn1, nn2-nn1+1);
    end
    else
      MsgBeep;
  end;
  //-----------------
var
  n1, nCaret: Integer;
  nSelStartOld, nSelLenOld: Integer;
  bSelChanged: boolean;
begin
  Ed:= CurrentEditor;
  nCaret:= Ed.CaretStrPos;
  n1:= nCaret;
  if not ((n1>=0) and (n1<Ed.TextLength)) then Exit;
  nSelStartOld:= Ed.SelStart;
  nSelLenOld:= Ed.SelLength;
  
  if Pos(Ed.Lines.FText[n1+1], '()[]{}')>0 then
  begin
    DoSel;
  end
  else
  begin
    n1:= DoFindOpeningBracket;
    if n1<0 then
      begin MsgBeep; Exit end;
    Ed.CaretStrPos:= n1;
    if not DoSel then
      Ed.CaretStrPos:= nCaret;
  end;

  bSelChanged:= (Ed.SelLength>0) and
    ((Ed.SelStart<>nSelStartOld) or (Ed.SelLength<>nSelLenOld));
  if bSelChanged then
    FPrevCaretPos:= nCaret
  else
  begin
    Ed.ResetSelection;
    Ed.CaretStrPos:= FPrevCaretPos;
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
end;

procedure TfmMain.SavePrintOptions;
begin
  PropsManagerPrint.IniFileName:= SynIni;
  PropsManagerPrint.SaveProps;
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
  Ed:= (Sender as TTextFinder).Control as TSyntaxMemo;
  Flags:= (Sender as TTextFinder).Flags;
  Tokens:= (Sender as TTextFinder).Tokens;

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

procedure TfmMain.InitStyleLists;
begin
  if FListCommentStyles=nil then
  begin
    FListCommentStyles:= TStringList.Create;
    FListStringStyles:= TStringList.Create;
    with TIniFile.Create(SynDir + 'Lexers.cfg') do
    try
      ReadSectionValues('CommentStyles', FListCommentStyles);
      ReadSectionValues('StringStyles', FListStringStyles);
    finally
      Free
    end;
  end;
end;

function IsStyleListed(const Style, Lexer: string; List: TStringList): boolean;
var
  Val: string;
begin
  Result:= false;
  if (Style='') or (Lexer='') then Exit;
  Val:= List.Values[Lexer];
  if Val<>'' then
    Result:= IsStringListed(Style, Val);
end;

function TfmMain.IsPositionMatchesTokens(Ed: TSyntaxMemo;
  StartPos, EndPos: Integer; OptTokens: TSearchTokens): boolean;
var
  IsCmt, IsStr: boolean;
  Lexer, Style: string;
begin
  Result:= true;
  if OptTokens=tokensAll then Exit;

  Lexer:= CurrentLexerForPos(Ed, StartPos);
  if Lexer='' then Exit;
  Style:= EditorTokenName(Ed, StartPos, EndPos);

  InitStyleLists;
  
  //we treat empty Style as string, but only for those lexers, which aren't
  //listed in [CommentStyles], [StringStyles]
  if (Style='') and
    (FListCommentStyles.IndexOfName(Lexer)<0) and
    (FListStringStyles.IndexOfName(Lexer)<0) then
  begin
    IsCmt:= false;
    IsStr:= true;
  end
  else
  begin
    IsCmt:= IsStyleListed(Style, Lexer, FListCommentStyles);
    IsStr:= IsStyleListed(Style, Lexer, FListStringStyles);
  end;

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

procedure TfmMain.DoCheckUnicodeNeeded(Frame: TEditorFrame);
  //
  function Cfm(const SEnc: Widestring): boolean;
  begin
    Result:= MsgConfirm(WideFormat(DKLangConstW('zMUniNeed'), [SEnc]), Handle);
  end;
  //
begin
  if opUnicodeNeeded=0 then Exit;
  if Frame.TextSource.Lines.TextCoding<>tcAnsi then Exit;
  if not Frame.TextSource.Lines.ContainUnicode then Exit;

  case opUnicodeNeeded of
    1:
      begin
        if Cfm('UTF-8') then
          ChangeEncoding(Frame, cp__UTF8, False{ACanReload});
      end;
    2:
      begin
        if Cfm(DKLangConstW('cpUTF8no')) then
          ChangeEncoding(Frame, cp__UTF8_noBOM, False{ACanReload});
      end;
    3:
      begin
        if Cfm('UTF-16') then
          ChangeEncoding(Frame, cp__Unicode, False{ACanReload});
      end;
    4:
      begin
        if Cfm('UTF-16 BE') then
          ChangeEncoding(Frame, cp__UnicodeBE, False{ACanReload});
      end;
    5:
      ChangeEncoding(Frame, cp__UTF8, False{ACanReload});
    6:
      ChangeEncoding(Frame, cp__UTF8_noBOM, False{ACanReload});
    7:
      ChangeEncoding(Frame, cp__Unicode, False{ACanReload});
    8:
      ChangeEncoding(Frame, cp__UnicodeBE, False{ACanReload});
  end;
end;


procedure TfmMain.PopupLEPopup(Sender: TObject);
begin
  case CurrentFrame.TextSource.Lines.TextFormat of
    tfCR: TbxItemEndMac.Checked:= true;
    tfNL: TbxItemEndUn.Checked:= true;
    else TbxItemEndWin.Checked:= true;
  end;
end;

procedure TfmMain.TBXSubmenuLineEndsPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  case CurrentFrame.TextSource.Lines.TextFormat of
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
  F:= Sender as TEditorFrame;
  Ed:= F.EditorMaster;
  En:= F.SpellLive;
  Inc(APos);

  if En and IsPositionMatchesTokens(Ed, APos, APos+1, tokensCmtStr) then
    Valid:= FSpell.CheckWord(AWord) or IsUrlAt(F, APos)
  else
    Valid:= true;
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
  begin
    if not F.IsEditorPosMisspelled(Ed.CaretStrPos) then Exit;
    Handled:= true;

    AWord:= Ed.WordAtPos(Ed.CaretPos);
    MousePos:= Ed.ClientToScreen(MousePos);
    S:= AWord;
    if FSpell.ShowPopupMenu(Sender,
      [spAdd, spIgnoreAll, spReplace], MousePos.X, MousePos.Y, S) = spReplace then
    begin
      Ed.WordRangeAtPos(Ed.CaretPos, NStart, NEnd);
      Ed.ReplaceText(NStart, NEnd-NStart, S);
    end;
  end;
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
  if (N<Length(Ed.Lines.FText)) and IsWordChar(Ed.Lines.FText[N+1]) then Exit;

  //NLen is length of word before caret
  NLen:= 1;
  i:= N+1;
  repeat
    if (i<=1) or not IsWordChar(Ed.Lines.FText[i-1]) then Break;
    Inc(NLen);
    Dec(i);
    if NLen>=opAcpNum then
    begin
      DoACP;
      Break
    end;
  until false;
end;

procedure TfmMain.SpellDialogShow(Sender: TObject);
begin
  {$ifdef SPELL}
  {
  if Assigned(FSpell) and Assigned(FSpell.DialogForm) then
    FSpell.DialogForm.Font.Name:= Self.Font.Name;
    }
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
    DoCheckDialogOverlapsCaret(CurrentFrame.EditorMaster, F);
  end;
  {$endif}
end;

procedure TfmMain.UpdateBusyIco;
begin
  if ecMacroRecorder1.Recording then
    StatusItemBusy.ImageIndex:= 7
  else
  if FSpellChecking then
    StatusItemBusy.ImageIndex:= 11
  else
    StatusItemBusy.ImageIndex:= 6;
end;

procedure TfmMain.UpdateSaveIco;
var
  F: TEditorFrame;
begin
  F:= CurrentFrame;
  if F<>nil then
    if F.Modified then
      fSave.ImageIndex:= 1
    else
      fSave.ImageIndex:= 2;
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
  for i:= Low(FPlugins) to High(FPlugins) do
    with FPlugins[i] do
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
  Opt, OptPrev: TSearchOptions;
  Tok, TokPrev: TSearchTokens;
  OptBkmk, OptExtSel, Ok: boolean;
  SText1, SText2: Widestring;
  oldSelStart, oldSelLength: Integer;
begin
  ReadFindOptions(S, Act, SText1, SText2, Opt, Tok, OptBkmk, OptExtSel);

  OptPrev:= Finder.Flags;
  TokPrev:= Finder.Tokens;
  Finder.FindText:= SText1;
  Finder.ReplaceText:= SText2;
  Finder.Flags:= Opt;
  Finder.Tokens:= Tok;

  Finder.Control:= CurrentEditor;
  Finder.OnCanAccept:= FinderCanAccept;
  if OptBkmk then
    Finder.OnFind:= FinderFindBk
  else
    Finder.OnFind:= nil;

  oldSelStart:= Finder.Control.SelStart;
  oldSelLength:= Finder.Control.SelLength;

  case Act of
    arFindNext: Finder.FindNext;
    arFindAll: Finder.FindAll;
    arFindInTabs: MsgError('Command "Find in all tabs" not supported in macros yet', Handle);
    arCount: Finder.CountAll;
    arSkip: Finder.FindNext;
    arReplaceNext: Finder.ReplaceAgain;
    arReplaceAll: Finder.ReplaceAll;
    arReplaceAllInAll: MsgError('Command "Replace in all tabs" not supported in macros yet', Handle);
  end;

  //restote Finder
  Finder.OnCanAccept:= nil;
  Finder.OnFind:= nil;
  Finder.Flags:= OptPrev;
  Finder.Tokens:= TokPrev;

  //post-find actions
  Ok:= Finder.Matches>0;
  if Ok then
  begin
    if OptExtSel and (Act in [arFindNext]) then
      DoExtendSelection(CurrentEditor,
        oldSelStart, oldSelLength,
        CurrentEditor.CaretStrPos, 0);

    if Assigned(fmSR) then
      DoCheckDialogOverlapsCaret(Finder.Control, fmSR);
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

procedure TfmMain.ecPasteToColumn1Execute(Sender: TObject);
var
  P: TPoint;
begin
  with CurrentEditor do
  begin
    P:= CaretPos;
    CaretPos:= Point(0, P.Y);
    PasteFromClipboard;
    CaretPos:= Point(P.X, CaretPos.Y);
  end;
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
  if Cmd>0 then
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
  Ini: TIniFile;
begin
  Result:= 0;
  Ini:= TIniFile.Create(SynIni);

  with TfmCmdList.Create(Self) do
  try
    Caption:= DKLangConstW('zMCmdList');
    cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');

    Width:= Ini.ReadInteger('Win', 'CmdListW', Width);
    Height:= Ini.ReadInteger('Win', 'CmdListH', Height);
    Left:= Ini.ReadInteger('Win', 'CmdListX', (Screen.Width-Width) div 2);
    Top:= Ini.ReadInteger('Win', 'CmdListY', (Screen.Height-Height) div 2);
    cbFuzzy.Checked:= Ini.ReadBool('Win', 'CmdListFuzzy', false);

    UpdateMacroKeynames;
    Keys.Assign(SyntKeyMapping);

    SynDir:= Self.SynDir;
    FColorSel:= opColorOutSelText;
    FColorSelBk:= opColorOutSelBk;

    if ShowModal=mrOk then
    begin
      if List.ItemIndex>=0 then
        Result:= Integer(List.Items.Objects[List.ItemIndex]);

      Ini.WriteInteger('Win', 'CmdListW', Width);
      Ini.WriteInteger('Win', 'CmdListH', Height);
      Ini.WriteInteger('Win', 'CmdListX', Left);
      Ini.WriteInteger('Win', 'CmdListY', Top);
      Ini.WriteBool('Win', 'CmdListFuzzy', cbFuzzy.Checked);
    end;
  finally
    Free;
    FreeAndNil(Ini);
  end;
end;

procedure TfmMain.ecScrollToSelExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  Save: TSynSelSave;
begin
  Ed:= CurrentEditor;
  with Ed do
    if HaveSelection then
    begin
      DoSaveSel(Ed, Save);
      if SelLength>0 then
        CaretStrPos:= SelStart
      else
        CaretPos:= Point(SelRect.Left, SelRect.Top);
      CenterMemoPos(Ed, true{GotoMode});
      DoRestoreSel(Ed, Save);
    end;
end;

procedure TfmMain.ecProjectListExecute(Sender: TObject);
var
  fn: Widestring;
  Ini: TIniFile;
  Files: TTntStringList;
  i: Integer;
begin
  if (fmProj=nil) or (fmProj.TreeProj.Items.Count<=1) then
    begin MsgBeep; Exit end;

  Ini:= TIniFile.Create(SynIni);
  Files:= TTntStringList.Create;

  try
    for i:= 0 to fmProj.TreeProj.Items.Count-1 do
    begin
      fn:= fmProj.GetFN(fmProj.TreeProj.Items[i]);
      if fn<>'' then
        Files.Add(fn);
    end;
    if Files.Count=0 then
      begin MsgBeep; Exit end;

    fn:= '';
    with TfmProjList.Create(Self) do
    try
      Caption:= DKLangConstW('zMProjList');
      cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');

      Width:= Ini.ReadInteger('Win', 'ProjListW', Width);
      Height:= Ini.ReadInteger('Win', 'ProjListH', Height);
      Left:= Ini.ReadInteger('Win', 'ProjListX', (Screen.Width-Width) div 2);
      Top:= Ini.ReadInteger('Win', 'ProjListY', (Screen.Height-Height) div 2);
      cbFuzzy.Checked:= Ini.ReadBool('Win', 'ProjListFuzzy', false);

      SynDir:= Self.SynDir;
      fmProj:= Self.fmProj;
      FListFiles:= Files;
      FColorSel:= opColorOutSelText;
      FColorSelBk:= opColorOutSelBk;

      if ShowModal=mrOk then
      begin
        if List.ItemIndex>=0 then
          fn:= Files[Integer(List.Items.Objects[List.ItemIndex])];

        Ini.WriteInteger('Win', 'ProjListW', Width);
        Ini.WriteInteger('Win', 'ProjListH', Height);
        Ini.WriteInteger('Win', 'ProjListX', Left);
        Ini.WriteInteger('Win', 'ProjListY', Top);
        Ini.WriteBool('Win', 'ProjListFuzzy', cbFuzzy.Checked);
      end;
    finally
      Free;
    end;
  finally
    FreeAndNil(Ini);
    FreeAndNil(Files);
  end;

  if fn<>'' then
    if IsFileExist(fn) then
    begin
      if IsFileText(fn) or MsgConfirmBinary(fn) then
        DoOpenFile(fn);
    end;
end;

procedure TfmMain.ApplyUrlClick;
var
  i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
  begin
    FramesAll[i].HyperlinkHighlighter.Active:= opLink;
    FramesAll[i].HyperlinkHighlighter.SingleClick:= opSingleClickURL;
  end;
end;

procedure TfmMain.ApplyCarets;
var i: Integer;
begin
  for i:= 0 to FrameAllCount-1 do
    with FramesAll[i] do
    begin
      CaretsEnabled:= opCaretsEnabled;
      CaretsGutterBand:= opCaretsGutterBand;
      CaretsGutterColor:= opColorCaretsGutter;
      CaretsIndicator:= opCaretsIndicator;

      //apply "Block caret"
      EditorCaretUpdate(EditorMaster, opCaretType);
      EditorCaretUpdate(EditorSlave, opCaretType);
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
        ExecCommand(sm_CaretsFromSelClear);
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
  CurrentEditor.ExecCommand(sm_AlignWithSep);
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
  CurrentEditor.ExecCommand(sm_TrimLead);
end;

procedure TfmMain.TBXItemETrimTrailClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TrimTrail);
end;

procedure TfmMain.TBXItemETrimAllClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TrimAll);
end;

procedure TfmMain.TBXItemERemDupSpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_RemoveDupSp);
end;

procedure TfmMain.TBXItemETabToSpClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_TabToSp);
end;

procedure TfmMain.TBXItemESpToTabClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SpToTab);
end;

procedure TfmMain.TBXItemESpToTabLeadClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_SpToTabLead);
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

procedure TfmMain.TBXItemEZenExpandClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ZenExpand);
end;

procedure TfmMain.TBXItemEZenWrapClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ZenWrap);
end;

procedure TfmMain.TBXItemTbSplitClick(Sender: TObject);
begin
  CurrentEditor.ExecCommand(sm_ToggleView2);
end;  

procedure TfmMain.TBXItemTbToggleSplitClick(Sender: TObject);
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

procedure TfmMain.ecToggleView2Execute(Sender: TObject);
var
  F: TEditorFrame;
  en, two: boolean;
begin
  two:= not PagesEmpty(PageControl2);
  if two then
  begin
    //be carefull
    //(test it isn't looped forever for e.g. empty tabs in view2)
    repeat
      PageControl:= PageControl2;
      DoMoveTabToOtherView(0);
      two:= not PagesEmpty(PageControl2);
    until not two;
  end
  else
  begin
    F:= CurrentFrame;
    en:= (F<>nil) and (F.Modified or (F.FileName<>''));
    if en then
    begin
      PageControl:= PageControl1;
      DoMoveTabToOtherView(PageControl.ActivePageIndex);
    end
    else
      MsgBeep;
  end;
end;

procedure TfmMain.DoAcpCommand;
var
  Ed: TSyntaxMemo;
  SText: Widestring;
begin
  PluginACP.Items.Clear;
  PluginACP.DisplayItems.Clear;

  SText:= DoAcpFromPlugins(cActionGetAutoComplete);
  if SText<>'' then
  begin
    Ed:= CurrentEditor;
    PluginAction_SuggestCompletion(PWChar(SText), EditorWordLength(Ed), true);
  end
  else
    DoACP;
end;

procedure TfmMain.PluginACPAfterComplete(Sender: TObject;
  const Item: WideString);
begin
  //need to force parameter hint, it doesn't appear auto on plugin ACP
  ParamCompletion.Execute;
end;

procedure TfmMain.ecSelExtendExecute(Sender: TObject);
var
  Ed: TSyntaxMemo;
  An: TClientSyntAnalyzer;
  R: TTextRange;
  i, StPos, EndPos, NCaret: Integer;
  SelSave: TSynSelSave;
  Lex: string;
begin
  Ed:= CurrentEditor;
  An:= nil;

  if Assigned(Ed) then
    An:= Ed.SyntObj;
  if An=nil then
    begin SetHint('Extend selection: no lexer active'); MsgBeep; Exit end;

  //we have two variants of code: for usual code (Pascal/C/PHP/etc) and for HTML,
  //HTML case is special, need precise jumps considering "<" and ">"
  DoSaveSel(Ed, SelSave);
  Lex:= CurrentLexer;
  if not IsLexerHTML(Lex) and not IsLexerXML(Lex) then
  begin
    //if selection is made, it may be selection from prev ExtendSel call,
    //so need to increment caret pos, to extend selection further
    if Ed.HaveSelection then
    begin
      Ed.ResetSelection;
      Ed.CaretStrPos:= Ed.CaretStrPos+2;
    end;

    R:= An.NearestRangeAtPos(Ed.CaretStrPos);
    if (R=nil) or not R.IsClosed then
      begin SetHint('Extend selection: no range at caret'); MsgBeep; DoRestoreSel(Ed, SelSave); Exit end;

    EndPos:= R.EndIdx;
    if not ((EndPos>=0) and (EndPos<An.TagCount)) then
      begin SetHint('Extend selection: no closed range'); MsgBeep; Exit end;

    EndPos:= An.Tags[EndPos].EndPos;
    Ed.SetSelection(R.StartPos, EndPos-R.StartPos);
  end
  else
  //code for HTML/XML
  begin
    NCaret:= Ed.CaretStrPos;
    for i:= An.RangeCount-1 downto 0 do
    begin
      //get StPos start of range, EndPos end of range
      StPos:= An.Ranges[i].StartPos;
      EndPos:= An.Ranges[i].EndIdx;
      if EndPos<0 then Continue;
      EndPos:= An.Tags[EndPos].EndPos;

      //take only range, which starts before NCaret, and ends after NCaret
      if (StPos<NCaret) and (EndPos>=NCaret) then
        //and not range which is from "<" to ">" - this is just tag
        if not (Ed.Lines.FText[StPos+1]='<') then
        begin
          //correct StPos, EndPos coz they don't include "<" and ">" in HTML
          Dec(StPos);
          Inc(EndPos);
          Ed.SetSelection(StPos, EndPos-StPos);
          Break
        end;
    end;
  end;
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

procedure TfmMain.ecDeleteToFileBeginExecute(Sender: TObject);
var
  NCaret: Integer;
begin
  with CurrentEditor do
  begin
    NCaret:= CaretStrPos;
    CaretStrPos:= 0;
    DeleteText(NCaret);
  end;  
end;

procedure TfmMain.ecDeleteToFileEndExecute(Sender: TObject);
begin
  with CurrentEditor do
    DeleteText(TextLength);
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
  An: TClientSyntAnalyzer;
  i: Integer;
begin
  Ed:= CurrentEditor;
  An:= Ed.SyntObj;
  if An=nil then
    begin SetHint('Fold level: no lexer active'); MsgBeep; Exit end;

  Ed.BeginUpdate;
  try
    Ed.FullExpand;
    for i:= 0 to An.RangeCount-1 do
      if An.Ranges[i].Level > NLevel then
        Ed.CollapseRange(An.Ranges[i]);
  finally
    Ed.EndUpdate;
  end;
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
end;

procedure TfmMain.LoadPanelProp(
  Panel: TSpTbxDockablePanel;
  Ini: TCustomIniFile;
  const Id: string);
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
    Floating:= Ini.ReadBool('pl'+Id, 'Fl', false);
    FloatingClientWidth:= Ini.ReadInteger('pl'+Id, 'FlW', FloatingClientWidth);
    FloatingClientHeight:= Ini.ReadInteger('pl'+Id, 'FlH', FloatingClientHeight);
    p.X:= Ini.ReadInteger('pl'+Id, 'FlX', 0);
    p.Y:= Ini.ReadInteger('pl'+Id, 'FlY', 0);
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

procedure TfmMain.TBXItemOToolbar1Click(Sender: TObject);
begin
  DoCustomizeToolbar(1);
  LoadToolbarContent(tbUser1, '1', true);
  UpdateStatusbar;
end;

procedure TfmMain.TBXItemOToolbar2Click(Sender: TObject);
begin
  DoCustomizeToolbar(2);
  LoadToolbarContent(tbUser2, '2', true);
  UpdateStatusbar;
end;

procedure TfmMain.TBXItemOToolbar3Click(Sender: TObject);
begin
  DoCustomizeToolbar(3);
  LoadToolbarContent(tbUser3, '3', true);
  UpdateStatusbar;
end;

procedure TfmMain.DoCustomizeToolbar(NIndex: Integer);
var
  Dir: string;
begin
  with TIniFile.Create(SynIni) do
  try
    Dir:= ReadString('Win', 'ImagesDir', '');
    DoShowToolbarProp(
      SynToolbarsIni,
      IntToStr(NIndex),
      DoShowCmdListStr,
      DoShowCmdHint,
      DoExtToolsList,
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
          Item.LinkSubitems:= TBXSubmenuFolding;
        end
        else
        if SCmd='m:{foldlevel}' then
        begin
          Item.LinkSubitems:= TBXSubmenuIFoldLevel;
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
          sm_OReadOnly:  Item.Action:= ecReadOnly;
          sm_OWrap:      Item.Action:= ecWrap;
          sm_OShowTree:  Item.Action:= ecShowTree;
          sm_OShowOut:   Item.Action:= ecShowOut;
          sm_OShowClip:  Item.Action:= ecShowClip;
          sm_FullScr:    Item.Action:= ecFullScr;
          sm_ORuler:     Item.Action:= ecRuler;
          sm_OLineNums:  Item.Action:= ecLineNums;
          sm_OFolding:   Item.Action:= ecFolding;

          sm_ONonPrint:       Item.Action:= ecNonPrint;
          sm_ONonPrintOff:    Item.Action:= ecNonPrintOff;
          sm_ONonPrintSpaces: Item.Action:= ecNonPrintSpaces;
          sm_ONonPrintEol:    Item.Action:= ecNonPrintEol;
          sm_ONonPrintBoth:   Item.Action:= ecNonPrintBoth;
          sm_ONonPrintEolDetails: Item.Action:= ecNonPrintEolDetails;

          sm_ToggleSmartHl:   Item.Action:= ecSmartHl;
          sm_OnTop:           Item.Action:= ecOnTop;
          sm_SpellLive:       Item.Action:= ecSpellLive;
          sm_SyncScrollH:     Item.Action:= ecSyncScrollH;
          sm_SyncScrollV:     Item.Action:= ecSyncScrollV;
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
        RunTool(i);
        Exit
      end;
    MsgError(WideFormat(DKLangConstW('MRun'), [Cmd]), Handle);
  end;
end;

procedure TfmMain.DoExtToolsList(L: TTntStringList);
var
  i: Integer;
begin
  for i:= Low(opTools) to High(opTools) do
    with opTools[i] do
      if ToolCaption<>'' then
        L.Add(ToolCaption);
end;

procedure TfmMain.ecPasteAsColumnBlockExecute(Sender: TObject);
begin
  if TntClipboard.HasFormat(CF_TEXT) then
    CurrentEditor.PasteFromClipboard(true)
  else
    MsgBeep;  
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
  CurrentEditor.ExecCommand(sm_BkPaste);
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
  with FMenuItems[0] do begin Id:= 'file'; Item:= TbxSubmenuItemFile; end;
  with FMenuItems[1] do begin Id:= 'edit'; Item:= TbxSubmenuItemEd; end;
  with FMenuItems[2] do begin Id:= 'search'; Item:= TbxSubmenuItemSr; end;
  with FMenuItems[3] do begin Id:= 'encoding'; Item:= TbxSubmenuItemEnc; end;
  with FMenuItems[4] do begin Id:= 'lexer'; Item:= TbxSubmenuItemLexer; end;
  with FMenuItems[5] do begin Id:= 'bookmarks'; Item:= TbxSubmenuItemBk; end;
  with FMenuItems[6] do begin Id:= 'view'; Item:= TbxSubmenuItemView; end;
  with FMenuItems[7] do begin Id:= 'options'; Item:= TbxSubmenuItemOpt; end;
  with FMenuItems[8] do begin Id:= 'run'; Item:= TbxSubmenuItemRun; end;
  with FMenuItems[9] do begin Id:= 'macros'; Item:= TbxSubmenuItemMacros; end;
  with FMenuItems[10] do begin Id:= 'window'; Item:= TbxWin; end;
  with FMenuItems[11] do begin Id:= 'help'; Item:= TbxSubmenuItemHelp; end;
  with FMenuItems[12] do begin Id:= 'x'; Item:= TBXItemTbClose; end;
  with FMenuItems[13] do begin Id:= 'xx'; Item:= TBXItemTbCloseAll; end;
  with FMenuItems[14] do begin Id:= 'split'; Item:= TbxItemTbSplit; end;

  with FMenuItems[15] do begin Id:= 'toolbar-file'; Item:= tbFile; end;
  with FMenuItems[16] do begin Id:= 'toolbar-edit'; Item:= tbEdit; end;
  with FMenuItems[17] do begin Id:= 'toolbar-view'; Item:= tbView; end;

  with FMenuItems[18] do begin Id:= 'context'; Item:= PopupEditor; end;
end;

procedure TfmMain.TBXItemOHideItemsClick(Sender: TObject);
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

      if Item is TSpTbxToolbar then
      begin
        for j:= 0 to (Item as TSpTbxToolbar).Items.Count-1 do
        begin
          S:= (Item as TSpTbxToolbar).Items[j].Caption;
          if (Item as TSpTbxToolbar).Items[j] is TSpTbxSeparatorItem then
            S:= cSep;
          if (Item as TSpTbxToolbar).Items[j] is TSpTbxSubmenuItem then
            S:= S+cSub;
          List.Items.Add('['+id+' '+IntToStr(j)+']  '+S);
        end;
      end
      else
      if Item is TSpTbxPopupMenu then
      begin
        for j:= 0 to 14{max index is "More..." item} do
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
  DoOpenFile(SynIni);
end;

procedure TfmMain.fOpenBySelectionExecute(Sender: TObject);
begin
  DoOpenBySelection;
end;

function TfmMain.opMarkDeletedAsModified: boolean;
begin
  with TIniFile.Create(SynIni) do
  try
    Result:= ReadBool('Setup', 'MarkDeletedModified', true);
  finally
    Free
  end;
end;

procedure TfmMain.ApplyTabOptions;
var
  Pos: TTabPosition;
begin
  //apply visible-mode
  UpdateTabs(PageControl1);
  UpdateTabs(PageControl2);

  PageControl1.MultiLine:= opTabMultiLine;
  PageControl2.MultiLine:= opTabMultiLine;

  if opTabAtBottom then Pos:= tpBottom else Pos:= tpTop;
  PageControl1.TabPosition:= Pos;
  PageControl2.TabPosition:= Pos;
end;

procedure TfmMain.FixSplitters;
begin
  SplitterBottom.Top:= 0;
  SplitterLeft.Left:= ClientWidth;
  SplitterRight.Left:= 0;

  TbxDockLeft1.Left:= ClientWidth;
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
    PopupCP.Popup(X, Y);
end;

procedure TfmMain.StatusItemEndsClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupLE.Popup(X, Y);
end;

procedure TfmMain.StatusItemLexerClick(Sender: TObject);
begin
  with Mouse.CursorPos do
    PopupLex.Popup(X, Y);
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
  Name:= Color2Str(Color);
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
  with TBXMRUListItem1 do
  begin
    Clear;
    for i:= SynMruFiles.Items.Count-1 downto 0 do
      MRUAdd(SynMruFiles.Items[i]);
  end;
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

function TfmMain.SynSkinFilename(const Name: string): string;
begin
  Result:= SynSkinsDir + '\' + Copy(Name, 2, MaxInt) + '.skn';
end;

procedure TfmMain.ApplyColorsArrayToEditor(var C: TSynColors; Ed: TSyntaxMemo);
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
  //Ed.HintProps.Font.Color:= C[12];
  //Ed.HintProps.Color:= C[13];
  Ed.NonPrinted.Color:= C[14];
  Ed.StaplePen.Color:= C[15];
  //Ed.Gutter.Bands[1].GradientRight:= C[16];
  Ed.Gutter.Bands[2].Color:= C[16];
  Tree.Font.Color:= C[17];
  Tree.Color:= C[18];
  Ed.HorzRuler.Font.Color:= C[19];
  Ed.HorzRuler.Color:= C[20];
  opColorTab1:= C[21];
  opColorTab2:= C[22];
  opColorTab3:= C[23];
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
  opColorBracket:= C[33];
  opColorBracketBg:= C[34];
  opColorLink:= C[35];
  opColorSplitViews:= C[36];
  Ed.DefaultStyles.CurrentLine.Font.Color:= C[37];
  Ed.LineStateDisplay.ModifiedColor:= C[38];
  Ed.LineStateDisplay.NewColor:= C[39];
  Ed.LineStateDisplay.SavedColor:= C[40];
  Ed.LineStateDisplay.UnchangedColor:= C[41];
  opColorTabFont1:= C[42];
  opColorTabFont2:= C[43];
  opColorBkmk:= C[44];
  opColorMap:= C[45];
  Ed.DefaultStyles.CollapseMark.Font.Color:= C[46];
  opColorSplitSlave:= C[47];
  Ed.Gutter.Bands[2].Color:= C[48];
  opColorNonPrintedBG:= C[49];
  Ed.DefaultStyles.CollapseMark.BgColor:= C[50];
  Ed.SyncEditing.SyncRangeStyle.BgColor:= C[51];
  opColorMapMarks:= C[52];
  opColorCaretsGutter:= C[53];
end;

procedure TfmMain.InitColorsArray(var C: TSynColors);
begin
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
  C[21]:= opColorTab1;
  C[22]:= opColorTab2;
  C[23]:= opColorTab3;
  C[24]:= TemplateEditor.DefaultStyles.SearchMark.Font.Color;
  C[25]:= TemplateEditor.DefaultStyles.SearchMark.BgColor;
  C[26]:= ListOut.Font.Color;
  C[27]:= ListOut.Color;
  C[28]:= opColorOutSelText;
  C[29]:= opColorOutSelBk;
  C[30]:= opColorOutRedText;
  C[31]:= opColorOutRedSelText;
  C[32]:= opColorOutHi;
  C[33]:= opColorBracket;
  C[34]:= opColorBracketBg;
  C[35]:= opColorLink;
  C[36]:= opColorSplitViews;
  C[37]:= TemplateEditor.DefaultStyles.CurrentLine.Font.Color;
  C[38]:= TemplateEditor.LineStateDisplay.ModifiedColor;
  C[39]:= TemplateEditor.LineStateDisplay.NewColor;
  C[40]:= TemplateEditor.LineStateDisplay.SavedColor;
  C[41]:= TemplateEditor.LineStateDisplay.UnchangedColor;
  C[42]:= opColorTabFont1;
  C[43]:= opColorTabFont2;
  C[44]:= opColorBkmk;
  C[45]:= opColorMap;
  C[46]:= TemplateEditor.DefaultStyles.CollapseMark.Font.Color;
  C[47]:= opColorSplitSlave;
  C[48]:= TemplateEditor.Gutter.Bands[2].Color;
  C[49]:= opColorNonPrintedBG;
  C[50]:= TemplateEditor.DefaultStyles.CollapseMark.BgColor;
  C[51]:= TemplateEditor.SyncEditing.SyncRangeStyle.BgColor;
  C[52]:= opColorMapMarks;
  C[53]:= opColorCaretsGutter;
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


procedure TfmMain.TbxItemMruNewdocClick(Sender: TObject;
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

procedure TfmMain.fCustomizeLexerLibExecute(Sender: TObject);
begin
  DoCustomizeLexerLibrary(SyntaxManager);
  SaveLexLibFilename; //always save lexer filename
  AskLexer(True); //save lexer file, if modified
end;


end.

