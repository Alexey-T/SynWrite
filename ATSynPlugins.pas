unit ATSynPlugins;

interface

uses
  Windows;

type
  TSynInit = procedure (ADefaultIni: PWideChar; AActionProc: Pointer); stdcall;  
  TSynOpenForm = function (AParentWindow: THandle; var AWindow: THandle): Pointer; stdcall;
  TSynCloseForm = procedure (AHandle: Pointer); stdcall;
  TSynAction = function (AHandle: Pointer;
    AName: PWideChar; A1, A2, A3, A4: Pointer): Integer; stdcall;

//exported funcs results    
const
  cSynBadCmd = 0;
  cSynOK = 1;
  cSynError = 2;
  cSynSmallBuffer = 3;

//for string buffers  
const
  cSynMaxPath = 512;
  cSynMaxMsg = 512;

//tab id, for cActionGetOpenedFileName
const
  cSynIdCurrentFile = -1;
  cSynIdOppositeFile = -2;

//text range id, for cActionGetText
const
  cSynIdAllText = -1;
  cSynIdSelectedText = -2;
  cSynIdSelectedLines = -3;
  cSynIdCurrentLine = -4;
  cSynIdSearchPaths = -5;

//log command id, for cActionControlLog
const
  cSynLogCmdHide = -1;
  cSynLogCmdShow = 0;
  cSynLogCmdAddLine = 1;
  cSynLogCmdClear = 2;
  cSynLogCmdSetCaption = 3;

//actions  
const
  cActionOpenFile           : PWideChar = 'OpenFile';
  cActionOpenFtpFile        : PWideChar = 'OpenFtpFile';
  cActionGetOpenedFileName  : PWideChar = 'GetOpenedFile';
  cActionAddToFavorites     : PWideChar = 'AddToFav';
  cActionGetMsg             : PWideChar = 'GetM';
  cActionControlLog         : PWideChar = 'LogCmd';
  cActionParseRegex         : PWideChar = 'ParseRE';
  cActionSaveFile           : PWideChar = 'SaveFile';
  cActionShowHint           : PWideChar = 'ShowHint';
  cActionGetProjectFileName : PWideChar = 'GetProjFN';

  //editor-related
  cActionSuggestCompletion  : PWideChar = 'Complete';
  cActionGetCaretPos        : PWideChar = 'GetCaret';
  cActionSetCaretPos        : PWideChar = 'SetCaret';
  cActionGetText            : PWideChar = 'GetTxt';
  cActionSetText            : PWideChar = 'SetTxt';
  cActionGetSelection       : PWideChar = 'GetSel';
  cActionSetSelection       : PWideChar = 'SetSel';
  cActionGetProperty        : PWideChar = 'GetProp';
  cActionSetTopLine         : PWideChar = 'SetTopLn';
  cActionReplaceText        : PWideChar = 'RepTxt';
  cActionTranslatePos       : PWideChar = 'TrPos';

  //SynWrite can call
  cActionNavigateToFile     : PWideChar = 'NavigateTo';
  cActionRefreshFileList    : PWideChar = 'RefreshFileList';
  cActionUpdateLang         : PWideChar = 'UpdateLang';
  cActionRepaint            : PWideChar = 'Repaint';
  cActionSaveFtpFile        : PWideChar = 'SaveFtpFile';
  cActionFindID             : PWideChar = 'FindID';
  cActionMenuCommand        : PWideChar = 'MenuCmd';

//for cActionParseRegex  
type
  PSynRegexStr = ^TSynRegexStr;
  TSynRegexStr = array[0..cSynMaxPath-1] of WideChar;
  PSynRegexArray = ^TSynRegexArray;
  TSynRegexArray = array[0..7] of PSynRegexStr;

//for cActionGetSelection  
type
  PSynSelection = ^TSynSelection;
  TSynSelection = record
    SelStart,
    SelLength: Integer; //selection start/length for stream selection
    SelRect: Windows.TRect; //selection coord for column selection
  end;

//property id, for cActionGetProperty  
const
  cSynPropLinesCount      = 1;
  cSynPropTopLine         = 2;
  cSynPropReadOnly        = 3;
  cSynPropLexer           = 4;
  cSynPropLexerForFile    = 5;
  cSynPropLineEnds        = 6;
  cSynPropRightMargin     = 7;
  cSynPropTabSpaces       = 8;
  cSynPropTabSize         = 9;
  cSynPropWordWrap        = 10;
  cSynPropCodeFolding     = 11;
  cSynPropNonPrintable    = 12;
  cSynPropLineNumbers     = 13;
  cSynPropTextLength      = 14;
  cSynPropLineLength      = 15;
  cSynPropLineSpace       = 16;

implementation

end.
