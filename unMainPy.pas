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
function Py_ed_get_tabcolor(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_tabcolor(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_indexes(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_prop_wrapper(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_complete(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_focus(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_find(Self, Args: PPyObject): PPyObject; cdecl;
function Py_msg_status(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_menu(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_snippet(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_checklist(Self, Args: PPyObject): PPyObject; cdecl;
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
  ATGroups,
  ATSyntMemo,
  ATxFProc,
  ATxSProc,
  ATSynPlugins,
  Variants,
  DKLang,
  SpTbxDkPanels,
  TB2Dock;

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
  LEXER_SET_NAME    = 10;
  LEXER_SET_ENABLED = 11;
  LEXER_SET_EXT     = 12;
  LEXER_SET_LINKS   = 13;
  LEXER_SAVE_LIB    = 20;
  LEXER_DELETE      = 21;
  LEXER_IMPORT      = 22;
  LEXER_EXPORT      = 23;
  LEXER_CONFIG      = 24;
  LEXER_CONFIG_ALT  = 25;
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
              An.SaveToFile(Str2);
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
        LEXER_CONFIG_ALT:
          begin
            An:= fmMain.SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyBool_FromLong(Ord(An.Customize))
            else
              Result:= ReturnNone;
          end;
        LEXER_SAVE_LIB:
          begin
            with fmMain.SyntaxManager do
              SaveToFile(FileName);
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
  FILENAME_LEXLIB          = -20;
  FILENAME_PATHS           = -21;
  FILENAME_FAVS            = -22;

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
        FILENAME_LEXLIB: Str:= fmMain.SynLexLib;
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

        FILENAME_FAVS:
          begin
            List:= TTntStringList.Create;
            try
              fmMain.DoEnumFavs(List);
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
  P: PAnsiChar;
  fn: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 's:file_open', @P)) then
    begin
      fn:= UTF8Decode(AnsiString(P));
      if (fn='') or IsFileExist(fn) then
      begin
        fmMain.DoOpenFile(fn);
        Result:= PyBool_FromLong(1);
      end
      else
        Result:= PyBool_FromLong(0);
    end;
  end;
end;

function Py_ed_find(Self, Args: PPyObject): PPyObject; cdecl;
const
  cFlag_Case     = 1;
  cFlag_Words    = 1 shl 1;
  cFlag_Back     = 1 shl 2;
  cFlag_Sel      = 1 shl 3;
  cFlag_Entire   = 1 shl 4;
  cFlag_Regex    = 1 shl 5;
  cFlag_Regex_S  = 1 shl 6;
  //cFlag_Regex_M  = 1 shl 7;
  cFlag_Prompt   = 1 shl 8;
  cFlag_Wrap     = 1 shl 9;
  cFlag_SkipCol  = 1 shl 10;
  cFlag_Bkmk     = 1 shl 14;
  cFlag_ExtSel   = 1 shl 15;
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
      if (NOptions and cFlag_Case)<>0 then Include(AOptions, ftCaseSens);
      if (NOptions and cFlag_Words)<>0 then Include(AOptions, ftWholeWords);
      if (NOptions and cFlag_Back)<>0 then Include(AOptions, ftBackward);
      if (NOptions and cFlag_Sel)<>0 then Include(AOptions, ftSelectedText);
      if (NOptions and cFlag_Entire)<>0 then Include(AOptions, ftEntireScope);
      if (NOptions and cFlag_Regex)<>0 then Include(AOptions, ftRegex);
      if (NOptions and cFlag_Regex_S)<>0 then Include(AOptions, ftRegex_s);
      //if (NOptions and cFlag_Regex_M)<>0 then Include(AOptions, ftRegex_m);
      if (NOptions and cFlag_Prompt)<>0 then Include(AOptions, ftPromtOnReplace);
      if (NOptions and cFlag_Wrap)<>0 then Include(AOptions, ftWrapSearch);
      if (NOptions and cFlag_SkipCol)<>0 then Include(AOptions, ftSkipCollapsed);
      AOptBkmk:= (NOptions and cFlag_Bkmk)<>0;
      AOptExtSel:= (NOptions and cFlag_ExtSel)<>0;

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
  Str: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_filename', @H)) then
    begin
      Ed:= PyEditor(H);
      Str:= fmMain.FrameOfEditor(Ed).FileName;
      Result:= PyUnicode_FromWideString(Str);
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

function Py_ed_get_tabcolor(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Flag: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_tabcolor', @H)) then
    begin
      Ed:= PyEditor(H);
      Flag:= fmMain.FrameOfEditor(Ed).TabColor;
      Result:= PyInt_FromLong(Flag);
    end;
end;

function Py_ed_set_tabcolor(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Flag: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:set_tabcolor', @H, @Flag)) then
    begin
      Ed:= PyEditor(H);
      fmMain.DoSetFrameTabColor(fmMain.FrameOfEditor(Ed), Flag);
      Result:= ReturnNone;
    end;
end;


function Py_ed_get_indexes(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
  Num1, Num2: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_indexes', @H)) then
    begin
      Ed:= PyEditor(H);
      fmMain.GetEditorIndexes(Ed, Num1, Num2);
      Result:= Py_BuildValue('(ii)', Num1, Num2);
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
  NResult: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iss:dlg_menu', @Id, @PCaption, @PText)) then
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
            with TfmMenuPy.Create(nil) do
            try
              Caption:= StrCaption;
              cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');
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
  PROC_GET_CLIP        = 1;
  PROC_SET_CLIP        = 2;
  PROC_LOCK_STATUS     = 3;
  PROC_UNLOCK_STATUS   = 4;
  PROC_SOUND           = 5;
  PROC_COLOR_PICKER    = 6;
  PROC_COLOR_PICKER_EX = 7;
  PROC_REPORT_KEYS     = 8;

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

        PROC_COLOR_PICKER_EX:
          begin
            NValue:= StrToIntDef(Str, 0);
            NValue:= fmMain.DoShowColorPickerEx(NValue);
            Result:= PyInt_FromLong(NValue);
          end;

        PROC_REPORT_KEYS:
          begin
            DoReportKeysHtml(fmMain.SyntKeyMapping, Str);
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
    if Bool(PyArg_ParseTuple(Args, 'ssss', @PtrName, @PtrId, @PtrLexers, @PtrText)) then
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


end.

