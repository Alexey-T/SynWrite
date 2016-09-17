unit unMainPy;

interface

uses
  PythonEngine;

function Py_app_version(Self, Args : PPyObject): PPyObject; cdecl;
function Py_app_api_version(Self, Args : PPyObject): PPyObject; cdecl;
function Py_app_log(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_split(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_split(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_bk(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_filename(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_alerts(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_alerts(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_enc(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_enc(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_prop_wrapper(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_complete(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_focus(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_find(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_prop(Self, Args: PPyObject): PPyObject; cdecl;
function Py_msg_status(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_menu(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_snippet(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_checklist(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_file(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_folder(Self, Args: PPyObject): PPyObject; cdecl;
function Py_file_get_name(Self, Args: PPyObject): PPyObject; cdecl;
function Py_file_save(Self, Args: PPyObject): PPyObject; cdecl;
function Py_file_open(Self, Args: PPyObject): PPyObject; cdecl;
function Py_lexer_proc(Self, Args : PPyObject): PPyObject; cdecl;
function Py_get_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
function Py_set_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
function Py_app_proc(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_handles(Self, Args : PPyObject): PPyObject; cdecl;

const
  cPyEditorHandleMin = 20;
  cPyEditorHandleMax = 1000;

var
  PyEscapeFlag: boolean = false;  

implementation

uses
  SysUtils,
  Windows,
  Classes,
  Dialogs,
  Math,
  Types,
  Controls,
  Forms,
  TntClasses,
  TntStdCtrls,
  TntClipbrd,
  TntDialogs,
  TntFileCtrl,
  unMain,
  unFrame,
  unSR,
  unSearch,
  unProc,
  unProcPy,
  unProcEditor,
  unMenuPy,
  ecSyntAnal,
  ecSyntMemo,
  ecKeyMap,
  ATGroups,
  ATSyntMemo,
  ATxFProc,
  ATxSProc,
  ATSynPlugins,
  Variants,
  DKLang,
  SpTbxDkPanels,
  TB2Dock;

const
  PROP_NUMS        = 1;
  PROP_EOL         = 2;
  PROP_WRAP        = 3;
  PROP_RO          = 4;
  PROP_MARGIN      = 5;
  PROP_FOLDING     = 6;
  PROP_TAB_SPACES  = 8;
  PROP_TAB_SIZE    = 9;
  PROP_COL_MARKERS = 10;
  PROP_TEXT_EXTENT = 11;
  PROP_ZOOM        = 12;
  PROP_INSERT      = 13;
  PROP_MODIFIED    = 14;
  PROP_VIS_LINES   = 15;
  PROP_VIS_COLS    = 16;
  PROP_LEFT        = 17;
  PROP_TOP         = 18;
  PROP_BOTTOM      = 19;
  PROP_RULER       = 20;
  PROP_TOKEN_TYPE  = 21;
  PROP_LEXER_FILE  = 22;
  PROP_LEXER_CARET = 23;
  PROP_LEXER_POS   = 24;
  PROP_COLOR       = 25;
  PROP_NON_PRINTED         = 26;
  PROP_NON_PRINTED_SPACES  = 27;
  PROP_NON_PRINTED_ENDS    = 28;
  PROP_NON_PRINTED_ENDS_EX = 29;
  PROP_TAG                 = 30;
  PROP_LINE_STATE          = 31;
  PROP_KEEP_TRAIL_BLANKS   = 32;
  PROP_KEEP_CARET_IN_TEXT  = 33;
  PROP_AUTO_INDENT         = 34;
  PROP_LAST_LINE_SHOW      = 35;
  PROP_TAB_FILL            = 36;
  PROP_WRAP_AT_MARGIN      = 37;
  PROP_INDEX_GROUP         = 40;
  PROP_INDEX_TAB           = 41;
  PROP_TAB_TITLE           = 42;
  PROP_TAB_COLOR           = 43;
  PROP_TAB_ID              = 44;

  
function Py_app_version(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
    Result:= PyString_FromString(cSynVer);
end;

function Py_app_api_version(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
    Result:= PyString_FromString(cSynPyVer);
end;

function Py_StringList(List: TTntStrings): PPyObject; cdecl;
var
  NLen, i: Integer;
  ComArray: Variant;
begin
  with GetPythonEngine do
  begin
    NLen:= List.Count;
    if NLen>0 then
    begin
      ComArray:= VarArrayCreate([0, NLen-1], varOleStr);
      for i:= 0 to NLen-1 do
        ComArray[i]:= List[i];
      Result:= VariantAsPyObject(ComArray);
    end
    else
      Result:= ReturnNone;
  end;
end;

function Py_lexer_proc(Self, Args : PPyObject): PPyObject; cdecl;
const
  LEXER_GET_LIST    = 0;
  LEXER_GET_ENABLED = 1;
  LEXER_GET_EXT     = 2;
  LEXER_GET_MOD     = 3;
  LEXER_GET_LINKS   = 4;
  LEXER_GET_STYLES  = 5;
  LEXER_GET_COMMENT = 6;
  LEXER_SET_NAME    = 10;
  LEXER_SET_ENABLED = 11;
  LEXER_SET_EXT     = 12;
  LEXER_SET_LINKS   = 13;
  LEXER_DELETE      = 21;
  LEXER_IMPORT      = 22;
  LEXER_EXPORT      = 23;
  LEXER_CONFIG      = 24;
  LEXER_ACTIVATE    = 26;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str, Str1, Str2: Widestring;
  List: TTntStringList;
  An: TSyntAnalyzer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is', @Id, @Ptr)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));
      Str1:= SGetItem(Str, ';');
      Str2:= SGetItem(Str, ';');

      case Id of
        LEXER_GET_LIST:
          begin
            List:= TTntStringList.Create;
            List.Sorted:= true;
            try
              fmMain.DoEnumLexers(List, true);
              Result:= Py_StringList(List);
            finally
              FreeAndNil(List);
            end;
          end;
        LEXER_GET_ENABLED:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyBool_FromLong(Ord(not An.Internal))
            else
              Result:= ReturnNone;
          end;
        LEXER_GET_EXT:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyUnicode_FromWideString(An.Extentions)
            else
              Result:= ReturnNone;
          end;
        LEXER_GET_MOD:
          begin
            Result:= PyBool_FromLong(Ord(fmMain.SyntaxManager.Modified));
          end;

        LEXER_GET_LINKS:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              List:= TTntStringList.Create;
              try
                LexerEnumSublexers(An, List);
                Result:= Py_StringList(List);
              finally
                FreeAndNil(List);
              end;
            end
            else
              Result:= ReturnNone;
          end;

        LEXER_GET_STYLES:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              List:= TTntStringList.Create;
              try
                LexerEnumStyles(An, List);
                Result:= Py_StringList(List);
              finally
                FreeAndNil(List);
              end;
            end
            else
              Result:= ReturnNone;
          end;

        LEXER_GET_COMMENT:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyString_FromString(PChar(string(An.LineComment)))
            else
              Result:= ReturnNone;
          end;


        LEXER_SET_ENABLED:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Internal:= Str2='0';
            Result:= ReturnNone;
          end;
        LEXER_SET_NAME:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.LexerName:= Str2;
            Result:= ReturnNone;
          end;
        LEXER_SET_EXT:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Extentions:= Str2;
            Result:= ReturnNone;
          end;

        LEXER_SET_LINKS:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              LexerSetSublexers(fmMain.SyntaxManager, An, Str2);
            Result:= ReturnNone;
          end;

        LEXER_IMPORT:
          begin
            if FileExists(Str1) then
            begin
              An:= fmMain.SyntaxManager.AddAnalyzer;
              An.LoadFromFile(Str1);

              //also save to data/lexlib
              DoLexerSaveToFile(An, LexerFilename(An.LexerName, fmMain.SynDataSubdir(cSynDataLexerLib)));

              Result:= PyUnicode_FromWideString(An.LexerName);
            end
            else
              Result:= ReturnNone;
          end;
        LEXER_EXPORT:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              DoLexerSaveToFile(An, Str2);
              Result:= PyBool_FromLong(1);
            end
            else
              Result:= PyBool_FromLong(0);
          end;
        LEXER_DELETE:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Free;
            Result:= ReturnNone;
          end;
        LEXER_CONFIG:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyBool_FromLong(Ord(An.CustomizeLexer))
            else
              Result:= ReturnNone;
          end;
        LEXER_ACTIVATE:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            fmMain.CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer:= An;
            fmMain.UpdateLexerTo(An);
            Result:= ReturnNone;
          end;
        else
          Result:= ReturnNone;
      end;
    end;
end;

function Py_ed_set_split(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NHorz, NValue: Integer;
  Ed: TSyntaxMemo;
  F: TEditorFrame;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii', @H, @NHorz, @NValue)) then
    begin
      Ed:= PyEditor(H);
      F:= fmMain.FrameOfEditor(Ed);
      F.SplitHorz:= Bool(NHorz);
      F.SplitPos:= NValue;
      Result:= ReturnNone;
    end;
end;

function Py_ed_get_split(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NValue: Integer;
  Ed: TSyntaxMemo;
  F: TEditorFrame;
  Obj: PPyIntObject;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i', @H)) then
    begin
      Ed:= PyEditor(H);
      F:= fmMain.FrameOfEditor(Ed);

      NValue:= Trunc(F.SplitPos);
      if F.SplitHorz then
        Obj:= Py_True
      else
        Obj:= Py_False;

      Result:= Py_BuildValue('(Oi)', Obj, NValue);
    end;
end;


function Py_msg_status(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: PAnsiChar;
  Str: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 's:msg_status', @P)) then
    begin
      Str:= UTF8Decode(AnsiString(P));
      fmMain.DoHint(Str);
      Application.ProcessMessages; //PluginManager calls loop with msg_status
    end;
    Result:= ReturnNone;
  end;
end;

const
  FILENAME_CURRENT         = -1;
  FILENAME_OPPOSITE        = -2;
  FILENAME_SESSION         = -3;
  FILENAME_PROJECT         = -10;
  FILENAME_PROJECT_MAIN    = -11;
  FILENAME_PROJECT_WORKDIR = -12;
  FILENAME_PROJECT_SESSION = -13;
  FILENAME_PROJECT_FILES   = -14;
  FILENAME_PATHS           = -21;

function Py_file_get_name(Self, Args: PPyObject): PPyObject; cdecl;
const
  cNone = '?';
var
  N, Id: Integer;
  Str: Widestring;
  List: TTntStringList;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'i:file_get_name', @N)) then
    begin
      Str:= cNone;

      //get editor-tab filename
      if (N >= 0) then
      begin
        id:= N;
        if id < fmMain.FrameAllCount then
          Str:= fmMain.FramesAll[id].FileName;
      end
      else
      case N of
        FILENAME_CURRENT: Str:= fmMain.CurrentFrame.FileName;
        FILENAME_OPPOSITE: Str:= fmMain.CurrentFileName(cSynGroupOpposite);
        FILENAME_SESSION: Str:= fmMain.CurrentSessionFN;
        FILENAME_PROJECT: Str:= fmMain.CurrentProjectFN;
        FILENAME_PROJECT_MAIN: Str:= fmMain.CurrentProjectMainFN;
        FILENAME_PROJECT_WORKDIR: Str:= fmMain.CurrentProjectWorkDir;
        FILENAME_PROJECT_SESSION: Str:= fmMain.CurrentProjectSessionFN;
        FILENAME_PATHS: Str:= fmMain.DoGetSearchPaths;

        FILENAME_PROJECT_FILES:
          begin
            List:= TTntStringList.Create;
            try
              fmMain.DoEnumProjFiles(List);
              Result:= Py_StringList(List);
            finally
              FreeAndNil(List);
            end;
            Exit
          end;
      end;

      if Str=cNone then
        Result:= ReturnNone
      else
        Result:= PyUnicode_FromWideString(Str);
    end;
  end;
end;

function Py_file_save(Self, Args: PPyObject): PPyObject; cdecl;
begin
  fmMain.acSave.Execute;
  with GetPythonEngine do
    Result:= ReturnNone;
end;    

function Py_ed_complete(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P: PAnsiChar;
  Str: Widestring;
  NLen, NShow, NRes: Integer;
  //Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
  begin
    NShow:= 1;
    if Bool(PyArg_ParseTuple(Args, 'isi|i:complete', @H, @P, @NLen, @NShow)) then
    begin
      //Ed:= PyEditor(H); //not used here
      Str:= UTF8Decode(AnsiString(P));
      NRes:= fmMain.PluginAction_SuggestCompletion(PWChar(Str), NLen, Bool(NShow));
      Result:= PyBool_FromLong(Ord(NRes = cSynOK));
    end;
  end;
end;

function Py_ed_focus(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:focus', @H)) then
    begin
      Ed:= PyEditor(H);
      fmMain.CurrentFrame:= fmMain.FrameOfEditor(Ed);
      fmMain.FocusEditor;
      Result:= ReturnNone;
    end;
end;

function Py_file_open(Self, Args: PPyObject): PPyObject; cdecl;
var
  PtrName, PtrParam: PAnsiChar;
  fn, param: Widestring;
  ok: boolean;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'ss:file_open', @PtrName, @PtrParam)) then
    begin
      fn:= UTF8Decode(AnsiString(PtrName));
      param:= UTF8Decode(AnsiString(PtrParam));
      ok:= (fn='') or IsFileExist(fn);
      if ok then
        fmMain.DoOpenFile(fn, param);
      Result:= PyBool_FromLong(Ord(ok));
    end;
  end;
end;

const
  Find_op_Case     = 1;
  Find_op_Words    = 1 shl 1;
  Find_op_Back     = 1 shl 2;
  Find_op_Sel      = 1 shl 3;
  Find_op_Entire   = 1 shl 4;
  Find_op_Regex    = 1 shl 5;
  Find_op_Regex_S  = 1 shl 6;
  Find_op_Prompt   = 1 shl 8;
  Find_op_Wrap     = 1 shl 9;
  Find_op_SkipCol  = 1 shl 10;
  Find_op_Bkmk     = 1 shl 14;
  Find_op_ExtSel   = 1 shl 15;

function Py_ed_find(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
  PText1, PText2: PAnsiChar;
  AText1, AText2: Widestring;
  AAction: TSynSearchAction;
  AOptions: TSearchOptions;
  ATokens: TSearchTokens;
  AOptBkmk, AOptExtSel: boolean;
  EdPrev: TCustomSyntaxMemo;
  NAction, NOptions, NTokens, NFindRes: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiiss:find',
      @H, @NAction, @NOptions, @NTokens,
      @PText1, @PText2)) then
    begin
      Ed:= PyEditor(H);
      EdPrev:= fmMain.Finder.Control;

      AText1:= UTF8Decode(AnsiString(PText1));
      AText2:= UTF8Decode(AnsiString(PText2));
      AAction:= TSynSearchAction(NAction);
      ATokens:= TSearchTokens(NTokens);

      AOptions:= [];
      if (NOptions and Find_op_Case)<>0 then Include(AOptions, ftCaseSens);
      if (NOptions and Find_op_Words)<>0 then Include(AOptions, ftWholeWords);
      if (NOptions and Find_op_Back)<>0 then Include(AOptions, ftBackward);
      if (NOptions and Find_op_Sel)<>0 then Include(AOptions, ftSelectedText);
      if (NOptions and Find_op_Entire)<>0 then Include(AOptions, ftEntireScope);
      if (NOptions and Find_op_Regex)<>0 then Include(AOptions, ftRegex);
      if (NOptions and Find_op_Regex_S)<>0 then Include(AOptions, ftRegex_s);
      //if (NOptions and Find_op_Regex_M)<>0 then Include(AOptions, ftRegex_m);
      if (NOptions and Find_op_Prompt)<>0 then Include(AOptions, ftPromtOnReplace);
      if (NOptions and Find_op_Wrap)<>0 then Include(AOptions, ftWrapSearch);
      if (NOptions and Find_op_SkipCol)<>0 then Include(AOptions, ftSkipCollapsed);
      AOptBkmk:= (NOptions and Find_op_Bkmk)<>0;
      AOptExtSel:= (NOptions and Find_op_ExtSel)<>0;

      try
        NFindRes:= fmMain.DoFindCommand(Ed, AAction, AText1, AText2, AOptions, ATokens, AOptBkmk, AOptExtSel);
      except
        NFindRes:= -1;
      end;

      fmMain.Finder.Control:= EdPrev;
      Result:= PyInt_FromLong(NFindRes);
    end;
end;

function Py_app_log(Self, Args: PPyObject): PPyObject; cdecl;
const
  LOG_CLEAR         = 0;
  LOG_ADD           = 1;
  LOG_SET_PANEL     = 2;
  LOG_SET_REGEX     = 3;
  LOG_SET_LINE_ID   = 4;
  LOG_SET_COL_ID    = 5;
  LOG_SET_NAME_ID   = 6;
  LOG_SET_FILENAME  = 7;
  LOG_SET_ZEROBASE  = 8;
  LOG_CONSOLE_CLEAR = 20;
  LOG_CONSOLE_ADD   = 21;
  LOG_CONSOLE_GET   = 22;
var
  Ptr: PAnsiChar;
  Str: Widestring;
  Id: Integer;
  LogListbox: TTntListbox;
  LogProps: ^TSynLogPanelProps;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:app_log', @Id, @Ptr)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));

      case fmMain.SynPyLog of
        cSynLogOutput:
          begin
            LogListbox:= fmMain.ListOut;
            LogProps:= @fmMain.SynPanelPropsOut;
          end;
        else
          begin
            LogListbox:= fmMain.ListVal;
            LogProps:= @fmMain.SynPanelPropsVal;
          end;
      end;

      case Id of
        LOG_CLEAR:
          LogListbox.Items.Clear;
        LOG_ADD:
          LogListbox.Items.Add(Str);
        LOG_SET_PANEL:
          fmMain.SynPyLog:= TSynLogPanelKind(StrToIntDef(Str, 0));
        LOG_SET_REGEX:
          LogProps.RegexStr:= Str;
        LOG_SET_LINE_ID:
          LogProps.RegexIdLine:= StrToIntDef(Str, 0);
        LOG_SET_COL_ID:
          LogProps.RegexIdCol:= StrToIntDef(Str, 0);
        LOG_SET_NAME_ID:
          LogProps.RegexIdName:= StrToIntDef(Str, 0);
        LOG_SET_FILENAME:
          LogProps.DefFilename:= Str;
        LOG_SET_ZEROBASE:
          LogProps.ZeroBase:= Bool(StrToIntDef(Str, 0));

        LOG_CONSOLE_CLEAR:
          with fmMain do
          begin
            MemoConsole.Lines.Clear;
            edConsole.Text:= '';
          end;
        LOG_CONSOLE_ADD:
          with fmMain do
          begin
            DoPyConsole_LogString(cPyConsolePrompt + Str);
            edConsole.Text:= Str;
            ComboUpdate(edConsole, opSaveFindCount);
            edConsole.Text:= '';
          end;
        LOG_CONSOLE_GET:
          begin
            Result:= Py_StringList(fmMain.edConsole.Items);
            Exit; //skip ReturnNone
          end;
      end;

      Result:= ReturnNone;
    end;
end;

function Py_ed_get_filename(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
  Frame: TEditorFrame;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_filename', @H)) then
    begin
      Ed:= PyEditor(H);
      Frame:= fmMain.FrameOfEditor(Ed);
      Result:= PyUnicode_FromWideString(Frame.FileName);
    end;
end;

function Py_ed_get_alerts(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Flag: boolean;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_alerts', @H)) then
    begin
      Ed:= PyEditor(H);
      Flag:= fmMain.FrameOfEditor(Ed).IsAlertEnabled;
      Result:= PyBool_FromLong(Ord(Flag));
    end;
end;

function Py_ed_set_alerts(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Flag: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:set_alerts', @H, @Flag)) then
    begin
      Ed:= PyEditor(H);
      fmMain.FrameOfEditor(Ed).IsAlertEnabled:= Bool(Flag);
      Result:= ReturnNone;
    end;
end;


function Py_ed_set_prop_wrapper(Self, Args: PPyObject): PPyObject; cdecl;
begin
  Result:= Py_ed_set_prop(Self, Args);
  fmMain.CurrentEditor.Invalidate;
  fmMain.UpdateStatusBar;
end;


function Py_dlg_menu(Self, Args: PPyObject): PPyObject; cdecl;
const
  MENU_SIMPLE = 0;
  MENU_DOUBLE = 1;
  MENU_STD    = 2;
var
  Id: Integer;
  PCaption, PText: PAnsiChar;
  StrCaption, StrText: Widestring;
  MenuItems: TTntStringList;
  NResult, NFocused: Integer;
  Form: TfmMenuPy;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'issi:dlg_menu', @Id, @PCaption, @PText, @NFocused)) then
    begin
      StrCaption:= UTF8Decode(AnsiString(PCaption));
      StrText:= UTF8Decode(AnsiString(PText));
      MenuItems:= TTntStringList.Create;

      try
        MenuItems.Text:= StrText;
        case Id of
          MENU_SIMPLE,
          MENU_DOUBLE:
          begin
            Form:= TfmMenuPy.Create(nil);
            with Form do
            try
              fmMain.UpdateMenuDialogBorder(Form);
              Caption:= StrCaption;
              Font.Assign(fmMain.FFontMenus);

              FListItems:= MenuItems;
              case Id of
                0: FListStyle:= cSynPyMenuSingle;
                1: FListStyle:= cSynPyMenuDouble;
                else
                  raise Exception.Create('Unknown menu style: '+IntToStr(Id))
              end;

              FIniFN:= fmMain.SynHistoryIni;
              FColorSel:= fmMain.opColorOutSelText;
              FColorSelBk:= fmMain.opColorOutSelBk;

              NResult:= -1;
              FInitFocusedIndex:= NFocused;

              if ShowModal=mrOk then
                if List.ItemIndex>=0 then
                  NResult:= Integer(List.Items.Objects[List.ItemIndex]);

              if NResult>=0 then
                Result:= PyInt_FromLong(NResult)
              else
                Result:= ReturnNone;
            finally
              Free
            end;
          end;
          
          MENU_STD:
          begin
            NResult:= DoShowPopupMenu(MenuItems, CenterPoint(Screen.DesktopRect), fmMain.Handle);
            if NResult>=0 then
              Result:= PyInt_FromLong(NResult)
            else
              Result:= ReturnNone;
          end;
          else
            Result:= ReturnNone;
        end;
      finally
        FreeAndNil(MenuItems);
      end;
    end;
end;

function Py_ed_set_bk(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NId, NPos, NIcon, NColor: Integer;
  Ed, Ed2: TSyntaxMemo;
  PHint: PAnsiChar;
  SHint: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiiis:set_bk', @H, @NId, @NPos, @NIcon, @NColor, @PHint)) then
    begin
      Ed:= PyEditor(H);
      Ed2:= fmMain.BrotherEditor(Ed);
      SHint:= UTF8Decode(AnsiString(PHint));
      EditorBookmarkCommand(Ed, NId, NPos, NIcon, NColor, SHint);
      EditorBookmarkCommand(Ed2, NId, NPos, NIcon, NColor, SHint);
      Result:= ReturnNone;
    end;

  fmMain.UpdateListBookmarks;  
end;


function Py_rect(const R: TRect): PPyObject; cdecl;
begin
  with GetPythonEngine do
    Result:= Py_BuildValue('(iiii)', R.Left, R.Top, R.Right, R.Bottom);
end;

function _GetPanelRect(Panel: TSpTBXDockablePanel): TRect;
var
  P: TPoint;
begin
  P:= Panel.FloatingPosition;
  if Panel.Floating then
    Result:= Rect(P.X, P.Y, P.X+Panel.FloatingClientWidth, P.Y+Panel.FloatingClientHeight)
  else
    Result:= Panel.BoundsRect;
end;

procedure _SetPanelRect(Panel: TSpTBXDockablePanel; const R: TRect);
begin
  if Panel.Floating then
  begin
    Panel.FloatingPosition:= Point(R.Left, R.Top);
    Panel.FloatingClientWidth:= R.Right-R.Left;
    Panel.FloatingClientHeight:= R.Bottom-R.Top;
  end
  else
    Panel.BoundsRect:= R;
end;

const
  DOCK_NONE = '';
  DOCK_LEFT = 'l';
  DOCK_LEFT1 = 'L';
  DOCK_RIGHT = 'r';
  DOCK_RIGHT1 = 'R';
  DOCK_BOTTOM = 'b';
  DOCK_BOTTOM1 = 'B';
  DOCK_TOP = 't';

procedure _SetPanelDock(Panel: TSpTBXDockablePanel; const DockId: string);
begin
  if DockId=DOCK_NONE then Panel.Floating:= true else
   if DockId=DOCK_LEFT then Panel.CurrentDock:= fmMain.TbxDockLeft else
    if DockId=DOCK_RIGHT then Panel.CurrentDock:= fmMain.TbxDockRight else
     if DockId=DOCK_BOTTOM then Panel.CurrentDock:= fmMain.TbxDockBottom;
  //other docks aren't valid for panels
end;

function Py_dock_str(Panel: TSpTBXDockablePanel): PPyObject; cdecl;
var
  Dock: TTBDock;
  Str: Widestring;
begin
  Dock:= Panel.CurrentDock;
  if Dock=nil then Str:= DOCK_NONE else
   if Dock=fmMain.TbxDockLeft then Str:= DOCK_LEFT else
    if Dock=fmMain.TbxDockLeft1 then Str:= DOCK_LEFT1 else
     if Dock=fmMain.TbxDockRight then Str:= DOCK_RIGHT else
      if Dock=fmMain.TbxDockRight1 then Str:= DOCK_RIGHT1 else
       if Dock=fmMain.TbxDockBottom then Str:= DOCK_BOTTOM else
        if Dock=fmMain.TbxDockBottom1 then Str:= DOCK_BOTTOM1 else
         if Dock=fmMain.TbxDockTop then Str:= DOCK_TOP else
          Str:= DOCK_NONE;

  with GetPythonEngine do
    Result:= PyUnicode_FromWideString(Str);
end;

function Py_rect_monitor(N: Integer): PPyObject; cdecl;
begin
  if N<Screen.MonitorCount then
    Result:= Py_rect(Screen.Monitors[N].BoundsRect)
  else
    Result:= GetPythonEngine.ReturnNone;
end;

const
  PROP_COORD_WINDOW  = 100;
  PROP_COORD_TREE    = 101;
  PROP_COORD_CLIP    = 102;
  PROP_COORD_OUT     = 103;
  PROP_COORD_PRE     = 104;

  PROP_DOCK_TREE     = 105;
  PROP_DOCK_CLIP     = 106;
  PROP_DOCK_OUT      = 107;
  PROP_DOCK_PRE      = 108;

  PROP_COORD_DESKTOP  = 120;
  PROP_COORD_MONITOR  = 121;
  PROP_COORD_MONITOR0 = 122;
  PROP_COORD_MONITOR1 = 123;
  PROP_COORD_MONITOR2 = 124;
  PROP_COORD_MONITOR3 = 125;

  PROP_SPLIT_MAIN_POS = 129;
  PROP_GROUP_MODE     = 130;
  PROP_GROUP_INDEX    = 131;

  PROP_FILENAME_SESSION = 132;
  PROP_FILENAME_PROJECT = 133;

  PROP_RECENT_FILES    = 135;
  PROP_RECENT_SESSIONS = 136;
  PROP_RECENT_PROJECTS = 137;
  PROP_RECENT_NEWDOC   = 138;
  PROP_RECENT_COLORS   = 139;

  PROP_EVENTS          = 140;
  PROP_EDITOR_BY_INDEX = 141;
  PROP_GROUPS          = 142;

  
function Py_get_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str, Str1, Str2, Str3: Widestring;
  Num1, Num2, Num3, i: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:get_app_prop', @Id, @Ptr)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));

      case Id of
        PROP_COORD_WINDOW:
          Result:= Py_rect(Application.MainForm.BoundsRect);

        PROP_COORD_TREE:
          Result:= Py_rect(_GetPanelRect(fmMain.plTree));
        PROP_COORD_CLIP:
          Result:= Py_rect(_GetPanelRect(fmMain.plClip));
        PROP_COORD_OUT:
          Result:= Py_rect(_GetPanelRect(fmMain.plOut));
        PROP_COORD_PRE:
          Result:= Py_rect(_GetPanelRect(fmMain.FProjPreview));

        PROP_DOCK_TREE:
          Result:= Py_dock_str(fmMain.plTree);
        PROP_DOCK_CLIP:
          Result:= Py_dock_str(fmMain.plClip);
        PROP_DOCK_OUT:
          Result:= Py_dock_str(fmMain.plOut);
        PROP_DOCK_PRE:
          Result:= Py_dock_str(fmMain.FProjPreview);

        PROP_COORD_DESKTOP:
          Result:= Py_rect(Screen.DesktopRect);  
        PROP_COORD_MONITOR:
          Result:= Py_rect(fmMain.Monitor.BoundsRect);
        PROP_COORD_MONITOR0:
          Result:= Py_rect_monitor(0);
        PROP_COORD_MONITOR1:
          Result:= Py_rect_monitor(1);
        PROP_COORD_MONITOR2:
          Result:= Py_rect_monitor(2);
        PROP_COORD_MONITOR3:
          Result:= Py_rect_monitor(3);

        PROP_SPLIT_MAIN_POS:
          Result:= PyInt_FromLong(fmMain.Groups.SplitPos);
        PROP_GROUP_MODE:
          Result:= PyInt_FromLong(Ord(fmMain.Groups.Mode));
        PROP_GROUP_INDEX:
          Result:= PyInt_FromLong(fmMain.Groups.PagesIndexOf(fmMain.Groups.PagesCurrent));

        PROP_RECENT_FILES:
          Result:= Py_StringList(fmMain.SynMruFiles.Items);
        PROP_RECENT_SESSIONS:
          Result:= Py_StringList(fmMain.SynMruSessions.Items);
        PROP_RECENT_PROJECTS:
          begin
            fmMain.TBXSubmenuItemProjRecentsPopup(nil, false); //update SynMruProjects
            Result:= Py_StringList(fmMain.SynMruProjects.Items);
          end;
        PROP_RECENT_NEWDOC:
          begin
            fmMain.TBXSubmenuItemFNewPopup(nil, false); //update SynMruNewdoc
            Result:= Py_StringList(fmMain.SynMruNewdoc.Items);
          end;

        PROP_FILENAME_SESSION:
          Result:= PyUnicode_FromWideString(fmMain.CurrentSessionFN);
        PROP_FILENAME_PROJECT:
          Result:= PyUnicode_FromWideString(fmMain.CurrentProjectFN);

        PROP_EDITOR_BY_INDEX:
          begin
            Str1:= SGetItem(Str);
            Str2:= SGetItem(Str);
            Str3:= SGetItem(Str);
            Num1:= StrToIntDef(Str1, -1);
            Num2:= StrToIntDef(Str2, -1);
            Num3:= StrToIntDef(Str3, -1);
            Ed:= fmMain.GetEditorByIndex(Num1, Num2, Num3);
            if Ed=nil then
              Result:= PyInt_FromLong(-1)
            else
              Result:= PyInt_FromLong(Integer(Pointer(Ed)));
          end;

        PROP_GROUPS:
          begin
            Str:= '';
            for i:= Low(TATGroupsNums) to fmMain.Groups.PagesVisibleCount do
              Str:= Str+IntToStr(fmMain.Groups.Pages[i].Tabs.TabCount)+',';
            Result:= PyUnicode_FromWideString(Str);
          end;  
      end;
    end;
end;


function Py_set_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str, Str1, Str2, Str3, SRect: Widestring;
  R: TRect;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:set_app_prop', @Id, @Ptr)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));

      SRect:= Str;
      R.Left:= StrToIntDef(SGetItem(SRect), 0);
      R.Top:= StrToIntDef(SGetItem(SRect), 0);
      R.Right:= StrToIntDef(SGetItem(SRect), 0);
      R.Bottom:= StrToIntDef(SGetItem(SRect), 0);

      case Id of
        PROP_COORD_WINDOW:
          Application.MainForm.BoundsRect:= R;

        PROP_COORD_TREE:
          _SetPanelRect(fmMain.plTree, R);
        PROP_COORD_CLIP:
          _SetPanelRect(fmMain.plClip, R);
        PROP_COORD_OUT:
          _SetPanelRect(fmMain.plOut, R);
        PROP_COORD_PRE:
          _SetPanelRect(fmMain.FProjPreview, R);

        PROP_DOCK_TREE:
          _SetPanelDock(fmMain.plTree, Str);
        PROP_DOCK_CLIP:
          _SetPanelDock(fmMain.plClip, Str);
        PROP_DOCK_OUT:
          _SetPanelDock(fmMain.plOut, Str);
        PROP_DOCK_PRE:
          _SetPanelDock(fmMain.FProjPreview, Str);

        PROP_SPLIT_MAIN_POS:
          fmMain.Groups.SplitPos:= StrToIntDef(Str, 50);
        PROP_GROUP_MODE:
          fmMain.Groups.Mode:= TATGroupsMode(StrToIntDef(Str, 1));

        PROP_FILENAME_SESSION:
          begin
            if Str<>'' then
              fmMain.DoOpenSession(Str)
            else
              fmMain.DoCloseSession(false);
          end;
        PROP_FILENAME_PROJECT:
          begin
            if Str<>'' then
              fmMain.DoOpenProject(Str)
            else
              fmMain.DoNewProject;
          end;

        PROP_EVENTS:
          begin
            Str1:= SGetItem(Str, ';');
            Str2:= SGetItem(Str, ';');
            Str3:= SGetItem(Str, ';');
            fmMain.DoPyUpdateEvents(cPyPrefix+Str1, Str2, Str3);
          end;
      end;
      Result:= ReturnNone;
    end;
end;

const
  PROC_GET_CLIP         = 1;
  PROC_SET_CLIP         = 2;
  PROC_LOCK_STATUS      = 3;
  PROC_UNLOCK_STATUS    = 4;
  PROC_SOUND            = 5;
  PROC_COLOR_PICKER     = 6;
  PROC_ADD_RECENT_COLOR = 7;
  PROC_GET_COMMAND      = 8;
  PROC_ADD_GUTTER_ICON  = 9;
  PROC_GET_ESCAPE       = 10;
  PROC_SET_ESCAPE       = 11;


function Py_KeyCommandToTuple(Cmd: TecCommandItem): PPyObject;
var
  Key1, Key2: string;
begin
  Key1:= '';
  Key2:= '';
  if Cmd.KeyStrokes.Count>0 then
    Key1:= Cmd.KeyStrokes[0].AsString;
  if Cmd.KeyStrokes.Count>1 then
    Key2:= Cmd.KeyStrokes[1].AsString;

  Result:= GetPythonEngine.Py_BuildValue('(issss)',
    Cmd.Command,
    PChar(UTF8Encode(Cmd.Category)),
    PChar(UTF8Encode(Cmd.DisplayName)),
    PChar(UTF8Encode(Key1)),
    PChar(UTF8Encode(Key2))
    );
end;

function Py_app_proc(Self, Args: PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str: Widestring;
  NValue: Integer;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'is:app_proc', @Id, @Ptr)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));
      case Id of
        PROC_LOCK_STATUS:
          begin
            fmMain.FLockUpdate:= true;
            Result:= ReturnNone;
          end;
        PROC_UNLOCK_STATUS:
          begin
            fmMain.FLockUpdate:= false;
            fmMain.UpdateStatusBar;
            Result:= ReturnNone;
          end;

        PROC_SOUND:
          begin
            if (Str='') or IsFileExist(Str) then
              Result:= PyBool_FromLong(Ord(DoPlayWaveSound(Str)))
            else
              Result:= PyBool_FromLong(0);
          end;

        PROC_GET_CLIP:
          begin
            NValue:= StrToIntDef(Str, 0);
            Str:= TntClipboard.AsWideText;
            if (NValue>0) and (Length(Str)>NValue) then
              SetLength(Str, NValue);
            Result:= PyUnicode_FromWideString(Str);
          end;
        PROC_SET_CLIP:
          begin
            TntClipboard.AsWideText:= Str;
            Result:= ReturnNone;
          end;

        PROC_COLOR_PICKER:
          begin
            NValue:= StrToIntDef(Str, 0);
            with TColorDialog.Create(fmMain) do
            try
              Color:= NValue;
              if Execute then
                Result:= PyInt_FromLong(Color)
              else
                Result:= PyInt_FromLong(-1);
            finally
              Free
            end;
          end;

        PROC_ADD_RECENT_COLOR:
          begin
            NValue:= StrToIntDef(Str, -1);
            if NValue>=0 then
              fmMain.DoAddRecentColor(NValue);
            Result:= ReturnNone;
          end;

        PROC_ADD_GUTTER_ICON:
          begin
            NValue:= fmMain.DoAddGutterIcon(Str);
            if NValue<0 then
              Result:= ReturnNone
            else
              Result:= PyInt_FromLong(NValue);
          end;

        PROC_GET_COMMAND:
          begin
            NValue:= StrToIntDef(Str, -1);
            if (NValue>=0) and (NValue<fmMain.SyntKeyMapping.Items.Count) then
              Result:= Py_KeyCommandToTuple(fmMain.SyntKeyMapping.Items[NValue])
            else
              Result:= ReturnNone;
          end;

        PROC_GET_ESCAPE:
          begin
            Result:= PyBool_FromLong(Ord(PyEscapeFlag or Application.Terminated));
          end;
        PROC_SET_ESCAPE:
          begin
            PyEscapeFlag:= Str='1';
            Result:= ReturnNone;
          end;

        else
          Result:= ReturnNone;
      end;
    end;
  end;
end;


function Py_ed_handles(Self, Args : PPyObject): PPyObject; cdecl;
var
  nMin, nMax: Integer;
begin
  nMin:= cPyEditorHandleMin;
  nMax:= Min(cPyEditorHandleMin + fmMain.FrameAllCount - 1, cPyEditorHandleMax);

  with GetPythonEngine do
    Result:= Py_BuildValue('(ii)', nMin, nMax);
end;

function Py_dlg_snippet(Self, Args: PPyObject): PPyObject; cdecl;
var
  Info: TSynSnippetInfo;
  PtrName, PtrId, PtrLexers, PtrText: PAnsiChar;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ssss:dlg_snippet', @PtrName, @PtrId, @PtrLexers, @PtrText)) then
    begin
      Info.Filename:= '';
      Info.Name:= UTF8Decode(AnsiString(PtrName));
      Info.Id:= UTF8Decode(AnsiString(PtrId));
      Info.Lexers:= UTF8Decode(AnsiString(PtrLexers));
      Info.Text:= UTF8Decode(AnsiString(PtrText));

      if DoSnippetEditorDialog(Info) then
        Result:= Py_BuildValue('(ssss)',
          PChar(UTF8Encode(Info.Name)),
          PChar(UTF8Encode(Info.Id)),
          PChar(UTF8Encode(Info.Lexers)),
          PChar(UTF8Encode(Info.Text))
          )
      else
        Result:= ReturnNone;
    end;
end;

function Py_dlg_checklist(Self, Args: PPyObject): PPyObject; cdecl;
var
  PtrCaption, PtrColumns, PtrItems: PAnsiChar;
  StrCaption, StrColumns, StrItems: Widestring;
  NSizeX, NSizeY: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'sssii:dlg_checklist',
      @PtrCaption, @PtrColumns, @PtrItems, @NSizeX, @NSizeY)) then
    begin
      StrCaption:= UTF8Decode(AnsiString(PtrCaption));
      StrColumns:= UTF8Decode(AnsiString(PtrColumns));
      StrItems:= UTF8Decode(AnsiString(PtrItems));

      StrItems:= DoInputCheckList(StrCaption, StrColumns, StrItems, NSizeX, NSizeY);
      Result:= PyUnicode_FromWideString(StrItems);
    end;
end;

function Py_dlg_folder(Self, Args: PPyObject): PPyObject; cdecl;
var
  PtrFolder, PtrText: PAnsiChar;
  StrFolder, StrText: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ss:dlg_folder',
      @PtrText, @PtrFolder)) then
    begin
      StrText:= UTF8Decode(AnsiString(PtrText));
      StrFolder:= UTF8Decode(AnsiString(PtrFolder));
      if WideSelectDirectory(StrText, '', StrFolder) then
        Result:= PyUnicode_FromWideString(StrFolder)
      else
        Result:= ReturnNone;  
    end;
end;

function Py_dlg_file(Self, Args: PPyObject): PPyObject; cdecl;
var
  PtrFilename, PtrFolder, PtrFilter: PAnsiChar;
  StrFilename, StrFolder, StrFilter: Widestring;
  IsOpen: LongBool;
  Dlg: TTntOpenDialog;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'isss:dlg_file',
      @IsOpen, @PtrFilename, @PtrFolder, @PtrFilter)) then
    begin
      StrFilename:= UTF8Decode(AnsiString(PtrFilename));
      StrFolder:= UTF8Decode(AnsiString(PtrFolder));
      StrFilter:= UTF8Decode(AnsiString(PtrFilter));

      if IsOpen then
      begin
        Dlg:= TTntOpenDialog.Create(nil);
        Dlg.Options:= Dlg.Options+[ofFileMustExist];
      end
      else
      begin
        Dlg:= TTntSaveDialog.Create(nil);
        Dlg.Options:= Dlg.Options+[ofOverwritePrompt];
      end;

      try
        if StrFilename='*' then
        begin
          StrFilename:= '';
          Dlg.Options:= Dlg.Options+[ofAllowMultiSelect];
        end;
        Dlg.FileName:= StrFilename;
        Dlg.InitialDir:= StrFolder;
        Dlg.Filter:= StrFilter;

        if Dlg.Execute then
        begin
          if ofAllowMultiSelect in Dlg.Options then
            Result:= Py_StringList(Dlg.Files)
          else
            Result:= PyUnicode_FromWideString(Dlg.FileName);
        end
        else
          Result:= ReturnNone;
      finally
        FreeAndNil(Dlg);
      end;
    end;
end;

function Py_ed_get_enc(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Value: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_enc', @H)) then
    begin
      Ed:= PyEditor(H);
      Value:= fmMain.DoGetFrameEncoding(fmMain.FrameOfEditor(Ed));
      Result:= PyInt_FromLong(Value);
    end;
end;

function Py_ed_set_enc(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Value: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:set_enc', @H, @Value)) then
    begin
      Ed:= PyEditor(H);
      fmMain.DoSetFrameEncoding(fmMain.FrameOfEditor(Ed), Value);
      fmMain.UpdateStatusBar;
      Result:= ReturnNone;
    end;
end;

function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Id, NValue, Num1, Num2: Integer;
  Size: TSize;
  Ed: TSyntaxMemo;
  Ptr: PAnsiChar;
  Str: Widestring;
  IsCmt, IsStr: boolean;
  An: TSyntAnalyzer;
  Frame: TEditorFrame;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:get_prop', @H, @Id, @Ptr)) then
    begin
      Ed:= PyEditor(H);
      Frame:= fmMain.FrameOfEditor(Ed);
      
      Str:= UTF8Decode(AnsiString(Ptr));
      NValue:= StrToIntDef(Str, 0);

      if Ed=nil then
      begin
        Result:= ReturnNone;
        Exit
      end;  

      case Id of
        PROP_NUMS:
          Result:= PyBool_FromLong(Ord(Ed.LineNumbers.Visible));
        PROP_EOL:
          Result:= PyUnicode_FromWideString(EditorEOL(Ed));
        PROP_WRAP:
          Result:= PyBool_FromLong(Ord(Ed.WordWrap));
        PROP_RO:
          Result:= PyBool_FromLong(Ord(Ed.ReadOnly));
        PROP_MARGIN:
          Result:= PyInt_FromLong(Ed.RightMargin);
        PROP_FOLDING:
          Result:= PyBool_FromLong(Ord(not Ed.DisableFolding));

        PROP_NON_PRINTED:
          Result:= PyBool_FromLong(Ord(Ed.NonPrinted.Visible));
        PROP_NON_PRINTED_SPACES:
          Result:= PyBool_FromLong(Ord(Ed.NonPrintedSpaces));
        PROP_NON_PRINTED_ENDS:
          Result:= PyBool_FromLong(Ord(Ed.NonPrintedEol));
        PROP_NON_PRINTED_ENDS_EX:
          Result:= PyBool_FromLong(Ord(Ed.NonPrintedEolDetails));

        PROP_TAB_SPACES:
          Result:= PyBool_FromLong(Ord(Ed.TabMode = tmSpaces));
        PROP_TAB_SIZE:
          Result:= PyInt_FromLong(EditorTabSize(Ed));
        PROP_COL_MARKERS:
          Result:= PyUnicode_FromWideString(Ed.ColMarkersString);
        PROP_TEXT_EXTENT:
          begin
            Size:= Ed.DefTextExt;
            Result:= Py_BuildValue('(ii)', Size.cx, Size.cy);
          end;
        PROP_ZOOM:
          Result:= PyInt_FromLong(Ed.Zoom);
        PROP_INSERT:
          Result:= PyBool_FromLong(Ord(not Ed.ReplaceMode));
        PROP_MODIFIED:
          Result:= PyBool_FromLong(Ord(Ed.Modified));
        PROP_VIS_LINES:
          Result:= PyInt_FromLong(Ed.VisibleLines);
        PROP_VIS_COLS:
          Result:= PyInt_FromLong(Ed.VisibleCols);
        PROP_LEFT:
          Result:= PyInt_FromLong(Ed.ScrollPosX);
        PROP_TOP:
          Result:= PyInt_FromLong(Ed.TopLine);
        PROP_BOTTOM:
          Result:= PyInt_FromLong(EditorGetBottomLineIndex(Ed));
        PROP_RULER:
          Result:= PyBool_FromLong(Ord(Ed.HorzRuler.Visible));

        PROP_TOKEN_TYPE:
          begin
            //some issue?: needed position incremented
            EditorGetTokenType(Ed, NValue+1, NValue+1, IsCmt, IsStr);
            if IsCmt then Str:= 'c' else
             if IsStr then Str:= 's' else
              Str:= '';
            Result:= PyUnicode_FromWideString(Str);
          end;

        PROP_LEXER_FILE:
          begin
            An:= Ed.TextSource.SyntaxAnalyzer;
            if An<>nil then
              Str:= An.LexerName
            else
              Str:= '';
            Result:= PyUnicode_FromWideString(Str);
          end;
        PROP_LEXER_CARET:
          begin
            Str:= EditorCurrentLexerForPos(Ed, Ed.CaretStrPos);
            Result:= PyUnicode_FromWideString(Str);
          end;
        PROP_LEXER_POS:
          begin
            Str:= EditorCurrentLexerForPos(Ed, NValue);
            Result:= PyUnicode_FromWideString(Str);
          end;

        PROP_COLOR:
          begin
            Result:= PyInt_FromLong(EditorGetColorPropertyById(Ed, Str));
          end;

        PROP_TAG:
          Result:= PyUnicode_FromWideString(Ed.UserTag);

        PROP_LINE_STATE:
          begin
            if (NValue>=0) and (NValue<Ed.Lines.Count) then
              NValue:= Ord(Ed.Lines.LineState[NValue])
            else
              NValue:= 0;
            Result:= PyInt_FromLong(NValue);
          end;

        PROP_KEEP_TRAIL_BLANKS:
          Result:= PyBool_FromLong(Ord(soKeepTrailingBlanks in Ed.Options));
        PROP_KEEP_CARET_IN_TEXT:
          Result:= PyBool_FromLong(Ord(soKeepCaretInText in Ed.Options));
        PROP_AUTO_INDENT:
          Result:= PyBool_FromLong(Ord(soAutoIndentMode in Ed.Options));
        PROP_LAST_LINE_SHOW:
          Result:= PyBool_FromLong(Ord(soScrollLastLine in Ed.Options));
        PROP_TAB_FILL:
          Result:= PyBool_FromLong(Ord(soOptimalFill in Ed.Options));
        PROP_WRAP_AT_MARGIN:
          Result:= PyBool_FromLong(Ord(soBreakOnRightMargin in Ed.Options));

        PROP_TAB_ID:
          Result:= PyInt_FromLong(Frame.TabId);
        PROP_TAB_COLOR:
          Result:= PyInt_FromLong(Frame.TabColor);
        PROP_TAB_TITLE:
          Result:= PyUnicode_FromWideString(Frame.TabCaption);

        PROP_INDEX_GROUP:
          begin
            fmMain.GetEditorIndexes(Ed, Num1, Num2);
            Result:= PyInt_FromLong(Num1-1); //was 1-based
          end;
        PROP_INDEX_TAB:
          begin
            fmMain.GetEditorIndexes(Ed, Num1, Num2);
            Result:= PyInt_FromLong(Num2);
          end;

        else
          Result:= ReturnNone;
      end;
    end;
end;


function Py_ed_set_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Id: Integer;
  Ed: TSyntaxMemo;
  P: PAnsiChar;
  StrVal, Str1, Str2: Widestring;
  NumVal: Integer;
  Frame: TEditorFrame;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:set_prop', @H, @Id, @P)) then
    begin
      Ed:= PyEditor(H);
      Frame:= fmMain.FrameOfEditor(Ed);

      StrVal:= UTF8Decode(AnsiString(P));
      NumVal:= StrToIntDef(StrVal, 0);

      case Id of
        PROP_NUMS:
          Ed.LineNumbers.Visible:= Bool(NumVal);
        PROP_WRAP:
          Ed.WordWrap:= Bool(NumVal);
        PROP_RO:
          Ed.ReadOnly:= Bool(NumVal);
        PROP_MARGIN:
          Ed.RightMargin:= NumVal;
        PROP_FOLDING:
          Ed.DisableFolding:= not Bool(NumVal);

        PROP_NON_PRINTED:
          Ed.NonPrinted.Visible:= Bool(NumVal);
        PROP_NON_PRINTED_SPACES:
          Ed.NonPrintedSpaces:= Bool(NumVal);
        PROP_NON_PRINTED_ENDS:
          Ed.NonPrintedEol:= Bool(NumVal);
        PROP_NON_PRINTED_ENDS_EX:
          Ed.NonPrintedEolDetails:= Bool(NumVal);

        PROP_TAB_SPACES:
          begin
            if Bool(NumVal) then
              Ed.TabMode:= tmSpaces
            else
              Ed.TabMode:= tmTabChar;
          end;      
        PROP_TAB_SIZE:
          begin
            Ed.TabList.Clear;
            Ed.TabList.Add(NumVal);
          end;
        PROP_COL_MARKERS:
        begin
          Ed.ColMarkersString:= StrVal;
          Ed.DoUpdateMargins;
        end;
        PROP_ZOOM:
          Ed.Zoom:= NumVal;
        PROP_INSERT:
          Ed.ReplaceMode:= not Bool(NumVal);
        PROP_LEFT:
          Ed.ScrollPosX:= NumVal;
        PROP_TOP:
          Ed.TopLine:= NumVal;
        PROP_RULER:
          Ed.HorzRuler.Visible:= Bool(NumVal);
        PROP_COLOR:
          begin
            Str1:= SGetItem(StrVal);
            Str2:= SGetItem(StrVal);
            NumVal:= StrToIntDef(Str2, $FF{red color});
            EditorSetColorPropertyById(Ed, Str1, NumVal);
          end;
        PROP_TAG:
          Ed.UserTag:= StrVal;

        PROP_KEEP_TRAIL_BLANKS:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soKeepTrailingBlanks]
            else
              Ed.Options:= Ed.Options - [soKeepTrailingBlanks];
          end;
        PROP_KEEP_CARET_IN_TEXT:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soKeepCaretInText]
            else
              Ed.Options:= Ed.Options - [soKeepCaretInText];
          end;
        PROP_AUTO_INDENT:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soAutoIndentMode]
            else
              Ed.Options:= Ed.Options - [soAutoIndentMode];
          end;
        PROP_LAST_LINE_SHOW:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soScrollLastLine]
            else
              Ed.Options:= Ed.Options - [soScrollLastLine];
          end;
        PROP_TAB_FILL:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soOptimalFill]
            else
              Ed.Options:= Ed.Options - [soOptimalFill];
          end;
        PROP_WRAP_AT_MARGIN:
          begin
            if Bool(NumVal) then
              Ed.Options:= Ed.Options + [soBreakOnRightMargin]
            else
              Ed.Options:= Ed.Options - [soBreakOnRightMargin];
          end;

        PROP_TAB_COLOR:
          begin
            fmMain.DoSetFrameTabColor(Frame, NumVal);
            fmMain.Groups.Pages1.Tabs.Invalidate;
            fmMain.Groups.Pages2.Tabs.Invalidate;
            fmMain.Groups.Pages3.Tabs.Invalidate;
            fmMain.Groups.Pages4.Tabs.Invalidate;
            fmMain.Groups.Pages5.Tabs.Invalidate;
            fmMain.Groups.Pages6.Tabs.Invalidate;
          end;
      end;

      Result:= ReturnNone;
    end;
end;



end.

