unit unPyApi;

interface

uses
  PythonEngine,
  ExtCtrls,
  Menus,
  ecSyntMemo,
  ATSyntMemo,
  unColorBox;

procedure Py_InitApiModule(AModule: TPythonModule);
procedure Py_SetSysPath(const Dirs: array of string);
procedure Py_ConvertSessionToNewFormat(const fnIn, fnOut: Widestring);
function Py_RunPlugin_Command(const SId, SCmd: string): string;
function Py_RunPlugin_Event(const SId, SCmd: string;
  AEd: TSyntaxMemo; const AParams: array of string): Widestring;

const
  cSynPropRO      = 'sw.PROP_RO';
  cSynPropWrap    = 'sw.PROP_WRAP';
  cSynPropFolding = 'sw.PROP_FOLDING';
  cSynPropNums    = 'sw.PROP_NUMS';
  cSynPropRuler   = 'sw.PROP_RULER';

var
  PyEscapeFlag: boolean = false;

implementation

uses
  Windows,
  SysUtils,
  StrUtils,
  Classes,
  Dialogs,
  Math,
  Types,
  Controls,
  Forms,
  IniFiles,
  Variants,
  TntClasses,
  TntStdCtrls,
  TntClipbrd,
  TntDialogs,
  TntFileCtrl,
  unGlobData,
  unPyApiConst,
  unMain,
  unFrame,
  unSR,
  unSearch,
  unProc,
  unProcEditor,
  unMenuPy,
  unInputEx,
  unInputMemo,
  unProcCustomDialog,
  unProcHelp,
  ecSyntAnal,
  ecKeyMap,
  ecLists,
  ecStrUtils,
  ecEmbObj,
  ATTabs,
  ATGroups,
  ATxFProc,
  ATxSProc,
  ATSynPlugins,
  DKLang,
  SpTbxDkPanels,
  TB2Dock;

const
  cPyEditorHandleMin = 20;
  cPyEditorHandleMax = 1000;
  cMaxBookmarks = 10000;


function PyEditor(H: Integer): TSyntaxMemo;
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

  
function Py_app_version(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
    Result:= PyString_FromString(cSynVersion);
end;

function Py_app_api_version(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
    Result:= PyString_FromString(cSynApiVersion);
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
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyBool_FromLong(Ord(not An.Internal))
            else
              Result:= ReturnNone;
          end;
        LEXER_GET_EXT:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyUnicode_FromWideString(An.Extentions)
            else
              Result:= ReturnNone;
          end;
        LEXER_GET_MOD:
          begin
            Result:= PyBool_FromLong(Ord(SyntaxManager.Modified));
          end;

        LEXER_GET_LINKS:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
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
            An:= SyntaxManager.FindAnalyzer(Str1);
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

        LEXER_GET_STYLES_COMMENTS,
        LEXER_GET_STYLES_STRINGS:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              if Id=LEXER_GET_STYLES_COMMENTS then
                Str:= 'styles_cmt'
              else
                Str:= 'styles_str';
              Str:= LexerCommentsProperty(An.LexerName, Str);

              List:= TTntStringList.Create;
              try
                repeat
                  Str1:= SGetItem(Str);
                  if Str1='' then Break;
                  List.Add(Str1);
                until false;
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
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyString_FromString(PChar(string(An.LineComment)))
            else
              Result:= ReturnNone;
          end;

        LEXER_GET_COMMENT_STREAM,
        LEXER_GET_COMMENT_LINED:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              if Id=LEXER_GET_COMMENT_STREAM then
              begin
                Str1:= 'str1';
                Str2:= 'str2'
              end
              else
              begin
                Str1:= 'full1';
                Str2:= 'full2';
              end;

              Str1:= LexerCommentsProperty(An.LexerName, Str1);
              Str2:= LexerCommentsProperty(An.LexerName, Str2);

              if (Str1<>'') and (Str2<>'') then
                Result:= Py_BuildValue('(ss)', PChar(string(Str1)), PChar(string(Str2)))
              else
                Result:= ReturnNone;
            end
            else
              Result:= ReturnNone;
          end;


        LEXER_SET_ENABLED:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Internal:= Str2='0';
            Result:= ReturnNone;
          end;
        LEXER_SET_NAME:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.LexerName:= Str2;
            Result:= ReturnNone;
          end;
        LEXER_SET_EXT:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Extentions:= Str2;
            Result:= ReturnNone;
          end;

        LEXER_SET_LINKS:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              LexerSetSublexers(SyntaxManager, An, Str2);
            Result:= ReturnNone;
          end;

        LEXER_IMPORT:
          begin
            if FileExists(Str1) then
            begin
              An:= SyntaxManager.AddAnalyzer;
              An.LoadFromFile(Str1);

              //also save to data/lexlib
              DoLexerSaveToFile(An, LexerFilename(An.LexerName, SynDataSubdir(cSynDataLexerLib)));

              Result:= PyUnicode_FromWideString(An.LexerName);
            end
            else
              Result:= ReturnNone;
          end;
        LEXER_EXPORT:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
            begin
              DoLexerSaveToFile(An, Str2);
              Result:= PyBool_FromLong(1);
            end
            else
              Result:= PyBool_FromLong(0);
          end;
        LEXER_DETECT:
          begin
            An:= DoFindLexerForFilename(SyntaxManager, Str1);
            if Assigned(An) then
              Result:= PyString_FromString(PChar(An.LexerName))
            else
              Result:= ReturnNone;
          end;
        LEXER_DELETE:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              An.Free;
            Result:= ReturnNone;
          end;
        LEXER_CONFIG:
          begin
            An:= SyntaxManager.FindAnalyzer(Str1);
            if Assigned(An) then
              Result:= PyBool_FromLong(Ord(An.CustomizeLexer))
            else
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
  StrName, StrParam: Widestring;
  NGroup: integer;
  ok: boolean;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'sis:file_open', @PtrName, @NGroup, @PtrParam)) then
    begin
      StrName:= UTF8Decode(AnsiString(PtrName));
      StrParam:= UTF8Decode(AnsiString(PtrParam));
      ok:= (StrName='') or IsFileExist(StrName);
      if ok then
        fmMain.DoOpenFile(StrName, NGroup, StrParam);
      Result:= PyBool_FromLong(Ord(ok));
    end;
  end;
end;

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

function Py_ed_save(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
  Frame: TEditorFrame;
  PtrName: PChar;
  StrName: WideString;
  Ok: Boolean;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:save', @H, @PtrName)) then
    begin
      Ed:= PyEditor(H);
      Frame:= fmMain.FrameOfEditor(Ed);
      StrName:= UTF8Decode(AnsiString(PtrName));

      Ok:= false;
      if Assigned(Frame) then
        Ok:= fmMain.SaveFrame(Frame, False, StrName);

      Result:= PyBool_FromLong(Ord(Ok));
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


function Py_dlg_menu(Self, Args: PPyObject): PPyObject; cdecl;
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

              FIniFN:= SynHistoryIni;
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


function Py_ed_bookmarks(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NId, NPos, NTag, NIcon, NColor: Integer;
  NLen, i: integer;
  Ed, Ed2: TSyntaxMemo;
  PHint: PAnsiChar;
  SHint: Widestring;
  ComArray: Variant;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiiiis:bookmarks',
              @H, @NId, @NPos, @NTag, @NIcon, @NColor, @PHint)) then
    begin
      Ed:= PyEditor(H);
      Ed2:= fmMain.BrotherEditor(Ed);
      SHint:= UTF8Decode(AnsiString(PHint));

      case NId of
        BM_GET:
          begin
            NLen:= Ed.BookmarkObj.Count;
            if NLen>0 then
            begin
              ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
              for i:= 0 to NLen-1 do
              begin
                //get BmIndex (0..9, or bigger), convert to api tag
                NPos:= Ed.BookmarkObj.Items[i].BmIndex;
                if (NPos>=0) and (NPos<=9) then
                  Inc(NPos)
                else
                  NPos:= 0;

                ComArray[i, 0]:= Ed.BookmarkObj.Items[i].Position;
                ComArray[i, 1]:= NPos;
              end;
              Result:= VariantAsPyObject(ComArray);
            end
            else
              Result:= ReturnNone;
          end;

        BM_ADD:
          begin
            EditorBookmarkAddWithTag(Ed, NTag, NPos, NIcon, NColor, SHint);
            EditorBookmarkAddWithTag(Ed2, NTag, NPos, NIcon, NColor, SHint);
            Result:= ReturnNone;
          end;

        BM_DELETE:
          begin
            if (NPos>=0) and (NPos<Ed.BookmarkObj.Count) then
              Ed.BookmarkObj.Delete(NPos);
            if (NPos>=0) and (NPos<Ed2.BookmarkObj.Count) then
              Ed2.BookmarkObj.Delete(NPos);
            Ed.Invalidate;
            Ed2.Invalidate;
            Result:= ReturnNone;
          end;

        BM_DELETE_ALL:
          begin
            EditorClearBookmarks(Ed);
            EditorClearBookmarks(Ed2);
            Result:= ReturnNone;
          end;
          
        else
          Result:= ReturnNone;
      end;
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


function Py_get_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str: Widestring;
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

        PROP_RECENT_FILES:
          Result:= Py_StringList(fmMain.SynMruFiles.Items);
        PROP_RECENT_SESSIONS:
          Result:= Py_StringList(fmMain.SynMruSessions.Items);
        PROP_RECENT_PROJECTS:
          begin
            fmMain.TBXSubmenuItemProjRecentsPopup(nil, false); //update SynMruProjects
            Result:= Py_StringList(fmMain.SynMruProjects.Items);
          end;

        PROP_FILENAME_SESSION:
          Result:= PyUnicode_FromWideString(fmMain.CurrentSessionFN);
        PROP_FILENAME_PROJECT:
          Result:= PyUnicode_FromWideString(fmMain.CurrentProjectFN);
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


function Py_KeyCommandToTuple(ACmdItem: TecCommandItem): PPyObject;
var
  Key1, Key2: string;
begin
  Key1:= Hotkey_AsString(ACmdItem, 0);
  Key2:= Hotkey_AsString(ACmdItem, 1);
  with GetPythonEngine do
  Result:= Py_BuildValue('(issss)',
    ACmdItem.Command,
    PChar(UTF8Encode(ACmdItem.Category)),
    PChar(UTF8Encode(ACmdItem.DisplayName)),
    PChar(UTF8Encode(Key1)),
    PChar(UTF8Encode(Key2))
    );
end;

function Py_Keymap(AKeymap: TSyntKeyMapping): PPyObject;
var
  CmdItem, CmdItemInit: TecCommandItem;
  SKey1, SKey2, SKey1_init, SKey2_init: string;
  SPyFilename, SPyMethod: string;
  NLen, NPluginIndex, i: integer;
begin
  with GetPythonEngine do
  begin
    NLen:= AKeymap.Items.Count;
    Result:= PyList_New(NLen);
    if not Assigned(Result) then
      raise EPythonError.Create('Cannot create PyList');
    for i:= 0 to NLen-1 do
    begin
      CmdItem:= AKeymap.Items[i];
      SKey1:= Hotkey_AsString(CmdItem, 0);
      SKey2:= Hotkey_AsString(CmdItem, 1);
      SKey1_init:= '';
      SKey2_init:= '';

      case CmdItem.Command of
        cPyCommandBase..cPyCommandLast:
          begin
            NPluginIndex:= CmdItem.Command-cPyCommandBase;
            SPyFilename:= FPluginsCommand[NPluginIndex].SFilename;
            SPyMethod:= FPluginsCommand[NPluginIndex].SCmd;
            if SBegin(SPyFilename, cPyPrefix) then
              Delete(SPyFilename, 1, Length(cPyPrefix));

            PyList_SetItem(Result, i,
              Py_BuildValue('{ssssssssssss}',
                PChar('type'),
                PChar('py'),
                PChar('module'),
                PChar(UTF8Encode(SPyFilename)),
                PChar('method'),
                PChar(UTF8Encode(SPyMethod)),
                PChar('name'),
                PChar(UTF8Encode(CmdItem.DisplayName)),
                PChar('hotkey1'),
                PChar(UTF8Encode(SKey1)),
                PChar('hotkey2'),
                PChar(UTF8Encode(SKey2)),
                ));
          end;
        else
          begin
            if i<AppKeymapOriginal.Items.Count then
            begin
              CmdItemInit:= AppKeymapOriginal.Items[i];
              SKey1_init:= Hotkey_AsString(CmdItemInit, 0);
              SKey2_init:= Hotkey_AsString(CmdItemInit, 1);
            end;

            PyList_SetItem(Result, i,
              Py_BuildValue('{sssissssssssssss}',
                PChar('type'),
                PChar('cmd'),
                PChar('command'),
                CmdItem.Command,
                PChar('category'),
                PChar(UTF8Encode(CmdItem.Category)),
                PChar('name'),
                PChar(UTF8Encode(CmdItem.DisplayName)),
                PChar('hotkey1'),
                PChar(UTF8Encode(SKey1)),
                PChar('hotkey2'),
                PChar(UTF8Encode(SKey2)),
                PChar('hotkey1init'),
                PChar(UTF8Encode(SKey1_init)),
                PChar('hotkey2init'),
                PChar(UTF8Encode(SKey2_init)),
                ));
          end;
      end;
    end;
  end;
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
            if (NValue>=0) and (NValue<fmMain.AppKeymap.Items.Count) then
              Result:= Py_KeyCommandToTuple(fmMain.AppKeymap.Items[NValue])
            else
              Result:= ReturnNone;
          end;

        PROC_KEYMAP:
          begin
            Result:= Py_Keymap(fmMain.AppKeymap);
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

        PROC_GET_KEYSTATE:
          begin
            Result:= PyString_FromString(PChar(
              ConvertShiftStateToString(KeyboardStateToShiftState)));
          end;

        PROC_HOTKEY_INT_TO_STR:
          begin
            Str:= ShortCutToText(StrToIntDef(Str, 0));
            Result:= PyString_FromString(PChar(string(Str)));
          end;
        PROC_HOTKEY_STR_TO_INT:
          begin
            Str:= IntToStr(TextToShortCut(Str));
            Result:= PyString_FromString(PChar(string(Str)));
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


function Py_ed_group(Self, Args: PPyObject): PPyObject; cdecl;
var
  Index: integer;
  Pages: TATPages;
  Data: TATTabData;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_group', @Index)) then
    begin
      //need 1-based index
      Inc(Index, Low(TATGroupsNums));
      if not (Index in [Low(TATGroupsNums)..High(TATGroupsNums)]) then
      begin
        Result:= ReturnNone;
        exit
      end;  

      Pages:= fmMain.Groups.Pages[Index];
      Data:= Pages.Tabs.GetTabData(Pages.Tabs.TabIndex);
      if Data=nil then
      begin
        Result:= ReturnNone;
        exit
      end;  

      Ed:= (Data.TabObject as TEditorFrame).EditorMaster;
      Result:= PyLong_FromLong(Integer(Ed));
    end;
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

function Py_dlg_color(Self, Args: PPyObject): PPyObject; cdecl;
var
  NValue: integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:dlg_color', @NValue)) then
    begin
      ColorDialogMain.Color:= NValue;
      if ColorDialogMain.Execute then
        Result:= PyInt_FromLong(ColorDialogMain.Color)
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
        PROP_ENC:
          Result:= PyInt_FromLong(Frame.Encoding);

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
  An: TSyntAnalyzer;
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

        PROP_LEXER_FILE:
          begin
            An:= SyntaxManager.FindAnalyzer(StrVal);
            fmMain.CurrentFrame.EditorMaster.TextSource.SyntaxAnalyzer:= An;
            fmMain.UpdateLexerTo(An);
            fmMain.UpdateStatusBar;
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

        PROP_TAB_TITLE:
          Frame.TabCaption:= StrVal;

        PROP_ENC:
          begin
            Frame.Encoding:= NumVal;
            fmMain.UpdateStatusBar;
          end;
      end;

      Result:= ReturnNone;
    end;
end;

function Py_ed_set_prop_wrapper(Self, Args: PPyObject): PPyObject; cdecl;
begin
  Result:= Py_ed_set_prop(Self, Args);
  fmMain.CurrentEditor.Invalidate;
  fmMain.UpdateStatusBar;
end;


function Py_ed_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_text_all', @H)) then
      Result:= PyUnicode_FromWideString(PyEditor(H).Lines.FText);
end;

function Py_ed_get_text_len(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_text_len', @H)) then
      Result:= PyInt_FromLong(PyEditor(H).TextLength);
end;

function Py_ed_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_text_sel', @H)) then
      Result:= PyUnicode_FromWideString(PyEditor(H).SelText);
end;

function Py_ed_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:get_text_line', @H, @N)) then
    begin
      Ed:= PyEditor(H);
      if N = -1 then
        N:= Ed.CurrentLine;
      if (N >= 0) and (N < Ed.Lines.Count) then
        Result:= PyUnicode_FromWideString(Ed.Lines[N])
      else
        Result:= ReturnNone;
    end;
end;

function Py_ed_add_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y, NSel: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiii:add_caret_xy', @H, @X, @Y, @NSel)) then
    begin
      Ed:= PyEditor(H);
      if (X=-1) then
        Ed.RemoveCarets()
      else
        Ed.AddCaret(Point(X, Y), NSel);
      Result:= ReturnNone;
    end;
end;


function Py_ed_marks(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen, NTag, NId, i: Integer;
  Ed: TSyntaxMemo;
  ComArray: Variant;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiii:marks', @H, @NId, @NStart, @NLen, @NTag)) then
    begin
      Ed:= PyEditor(H);
      case NId of
        MARKS_GET:
          begin
            NLen:= Ed.SearchMarks.Count;
            if NLen>0 then
            begin
              ComArray:= VarArrayCreate([0, NLen-1, 0, 2], varInteger);
              for i:= 0 to NLen-1 do
              begin
                ComArray[i, 0]:= Ed.SearchMarks[i].StartPos;
                ComArray[i, 1]:= Ed.SearchMarks[i].Size;
                ComArray[i, 2]:= Ed.SearchMarks[i].Tag;
              end;
              Result:= VariantAsPyObject(ComArray);
            end
            else
              Result:= ReturnNone;
          end;
        MARKS_ADD:
          begin
            Ed.SearchMarks.Add(TRange.Create(NStart, NStart + NLen, NTag));
            Ed.Invalidate;
            Result:= ReturnNone;
          end;
        MARKS_DELETE:
          begin
            if (NStart>=0) and (NStart<Ed.SearchMarks.Count) then
            begin
              Ed.SearchMarks.Delete(NStart);
              Ed.Invalidate;
            end;  
            Result:= ReturnNone;
          end;
        MARKS_DELETE_ALL:
          begin
            Ed.ResetSearchMarks;
            Ed.Invalidate;
            Result:= ReturnNone;
          end;
        MARKS_DELETE_BY_TAG:
          begin
            for i:= Ed.SearchMarks.Count-1 downto 0 do
              if Ed.SearchMarks[i].Tag=NTag then
                Ed.SearchMarks.Delete(i);
            Ed.Invalidate;
            Result:= ReturnNone;
          end;
        else
          Result:= ReturnNone;
      end;
    end;
end;


function Py_ed_add_sync_range(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:add_sync_range', @H, @NStart, @NLen)) then
    begin
      Ed:= PyEditor(H);
      if (NStart=-1) then
        Ed.SyncEditing.Clear
      else
        Ed.SyncEditing.AddRange(NStart, NStart + NLen);
      Ed.Invalidate;
      Result:= ReturnNone;
    end;
end;


function Py_ed_get_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_caret_xy', @H)) then
    begin
      P:= PyEditor(H).CaretPos;
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
    end;
end;

function Py_ed_get_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_caret_pos', @H)) then
    begin
      Result:= PyInt_FromLong(PyEditor(H).CaretStrPos);
    end;
end;

function Py_ed_get_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_sel', @H)) then
    begin
      Ed:= PyEditor(H);
      Result:= Py_BuildValue('(ii)', Ed.SelStart, Ed.SelLength);
    end;
end;

function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  R: TRect;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_sel_rect', @H)) then
    begin
      R:= PyEditor(H).SelRect;
      Result:= Py_BuildValue('(iiii)', R.Left, R.Top, R.Right, R.Bottom);
    end;
end;

function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_sel_mode', @H)) then
    begin
      Ed:= PyEditor(H);
      case Ed.SelectMode of
        msColumn:
          begin
            if IsRectEmpty(Ed.SelRect) then
              N:= SEL_NORMAL
            else
              N:= SEL_COLUMN;
          end;
        msLine:
          N:= SEL_LINES;
        else
          N:= SEL_NORMAL;
      end;
      Result:= PyInt_FromLong(N);
    end;
end;


function Py_ed_get_line_count(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_line_count', @H)) then
    begin
      Result:= PyInt_FromLong(PyEditor(H).Lines.Count);
    end;
end;



function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  NStart, NLen: Integer;
  P: PAnsiChar;
  StrW: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiis:replace', @H, @NStart, @NLen, @P)) then
    begin
      Ed:= PyEditor(H);
      StrW:= UTF8Decode(AnsiString(P));
      Ed.ReplaceText(NStart, NLen, StrW);
      Result:= ReturnNone;
    end;
end;

function Py_ed_insert(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:insert', @H, @P)) then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor(H).InsertText(StrW);
      Result:= ReturnNone;
    end;
end;

function Py_ed_insert_snippet(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P1, P2, P3: PAnsiChar;
  Str1, Str2, Str3: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'isss:insert_snippet', @H, @P1, @P2, @P3)) then
    begin
      Ed:= PyEditor(H);
      Str1:= UTF8Decode(AnsiString(P1));
      Str2:= UTF8Decode(AnsiString(P2));
      Str3:= UTF8Decode(AnsiString(P3));
      EditorInsertSnippet(Ed, Str1, Str2, Str3);
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_text_all(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P: PAnsiChar;
  StrW: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'is:set_text_all', @H, @P)) then
    begin
      Ed:= PyEditor(H);
      StrW:= UTF8Decode(AnsiString(P));
      Ed.ReplaceText(0, Ed.TextLength, StrW);
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_text_line(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  Ptr: PAnsiChar;
  Str: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:set_text_line', @H, @N, @Ptr)) then
    begin
      Ed:= PyEditor(H);
      Str:= UTF8Decode(AnsiString(Ptr));
      if (N = -1) then
      begin
        N:= Ed.Lines.Add(Str);
        Ed.Modified:= True;
      end
      else
      if (N >= 0) and (N < Ed.Lines.Count) then
        EditorReplaceLine(Ed, N, Str, true);
      Result:= ReturnNone;
    end;
end;

function Py_ed_pos_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:pos_xy', @H, @N)) then
    begin
      P:= PyEditor(H).StrPosToCaretPos(N);
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
    end;
end;


function Py_ed_xy_pos(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:xy_pos', @H, @X, @Y)) then
    begin
      N:= PyEditor(H).CaretPosToStrPos(Point(X, Y));
      Result:= PyInt_FromLong(N);
    end;
end;

function Py_ed_xy_log(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:xy_log', @H, @X, @Y)) then
    begin
      P:= PyEditor(H).LinesPosToLog(Point(X, Y));
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
    end;
end;

function Py_ed_log_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:log_xy', @H, @X, @Y)) then
    begin
      P:= PyEditor(H).LogToLinesPos(Point(X, Y));
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
    end;
end;


function Py_ed_set_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:set_caret_xy', @H, @X, @Y)) then
    begin
      PyEditor(H).CaretPos:= Point(X, Y);
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:set_caret_pos', @H, @N)) then
    begin
      PyEditor(H).CaretStrPos:= N;
      Result:= ReturnNone;
    end;
end;


function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen, NFlag: Integer;
  Ed: TSyntaxMemo;
begin
  NFlag:= 0;
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii|i:set_sel', @H, @NStart, @NLen, @NFlag)) then
    begin
      Ed:= PyEditor(H);
      Ed.SetSelection(NStart, NLen, Bool(NFlag));
      Ed.DragPos:= NStart;
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X1, Y1, X2, Y2: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiii:set_sel_rect', @H, @X1, @Y1, @X2, @Y2)) then
    begin
      PyEditor(H).SelRect:= Rect(X1, Y1, X2, Y2);
      Result:= ReturnNone;
    end;
end;

function Py_ed_get_line_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:get_line_prop', @H, @N)) then
    begin
      Ed:= PyEditor(H);
      if (N >= 0) and (N < Ed.Lines.Count) then
        Result:= Py_BuildValue('(ii)',
          Ed.Lines.LineLength(N),
          Ed.Lines.LineSpace(N))
      else
        Result:= ReturnNone;    
    end;
end;

function Py_ed_cmd(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  P: PAnsiChar;
  Str: Widestring;
  CmdPtr: Pointer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:cmd', @H, @N, @P)) then
    begin
      Str:= UTF8Decode(AnsiString(P));
      if Str='' then
        CmdPtr:= nil
      else
        CmdPtr:= PWChar(Str);
      PyEditor(H).ExecCommand(N, CmdPtr);
      Result:= ReturnNone;
    end;
end;

function Py_ed_lock(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:lock', @H)) then
    begin
      PyEditor(H).BeginUpdate;
      Result:= ReturnNone;
    end;
end;

function Py_ed_unlock(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:unlock', @H)) then
    begin
      PyEditor(H).EndUpdate;
      Result:= ReturnNone;
    end;
end;

function Py_ed_get_sel_lines(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N1, N2: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_sel_lines', @H)) then
    begin
      EditorGetSelLines(PyEditor(H), N1, N2);
      Result:= Py_BuildValue('(ii)', N1, N2);
    end;
end;


function Py_app_exe_dir(Self, Args : PPyObject): PPyObject; cdecl;
var
  dir: string;
begin
  dir:= ExcludeTrailingPathDelimiter(SynDir);
  with GetPythonEngine do
  begin
    Result:= PyString_FromString(PChar(dir));
  end;
end;

function Py_app_ini_dir(Self, Args : PPyObject): PPyObject; cdecl;
var
  dir: string;
begin
  dir:= ExcludeTrailingPathDelimiter(SynIniDir);
  with GetPythonEngine do
  begin
    Result:= PyString_FromString(PChar(dir));
  end;
end;

function Py_ini_readwrite(Self, Args: PPyObject; AWrite: boolean): PPyObject; cdecl;
var
  P1, P2, P3, P4: PAnsiChar;
  StrFN, StrSess, StrKey, StrVal: Widestring;
  fn: string;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'ssss:ini_read', @P1, @P2, @P3, @P4)) then
    begin
      StrFN:= UTF8Decode(AnsiString(P1));
      StrSess:= UTF8Decode(AnsiString(P2));
      StrKey:= UTF8Decode(AnsiString(P3));
      StrVal:= UTF8Decode(AnsiString(P4));

      if (StrFN='') or (StrSess='') or (StrKey='') then
      begin
        Result:= PyString_FromString('');
        exit
      end;

      fn:= StrFN;
      if ExtractFileDir(fn)='' then
        fn:= SynIniDir + fn;

      with TIniFile.Create(fn) do
      try
        if AWrite then
        begin
          WriteString(StrSess, StrKey, UTF8Encode(StrVal));
          Result:= ReturnNone;
        end
        else
        begin
          StrVal:= UTF8Decode(ReadString(StrSess, StrKey, UTF8Encode(StrVal)));
          Result:= PyUnicode_FromWideString(StrVal);
        end;
      finally
        Free
      end;
    end
    else
      Result:= ReturnNone;
  end;
end;

function Py_ini_read(Self, Args: PPyObject): PPyObject; cdecl;
begin
  Result:= Py_ini_readwrite(Self, Args, false);
end;

function Py_ini_write(Self, Args: PPyObject): PPyObject; cdecl;
begin
  Result:= Py_ini_readwrite(Self, Args, true);
end;


function Py_dlg_input_ex(Self, Args: PPyObject): PPyObject; cdecl;
var
  Num: Integer;
  PCaption,
  PLab1, PLab2, PLab3, PLab4, PLab5, PLab6, PLab7, PLab8, PLab9, PLab10,
  PText1, PText2, PText3, PText4, PText5, PText6, PText7, PText8, PText9, PText10: PAnsiChar;
  Form: TfmInputEx;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'isssssssssssssssssssss:dlg_input_ex',
      @Num, @PCaption,
      @PLab1, @PText1,
      @PLab2, @PText2,
      @PLab3, @PText3,
      @PLab4, @PText4,
      @PLab5, @PText5,
      @PLab6, @PText6,
      @PLab7, @PText7,
      @PLab8, @PText8,
      @PLab9, @PText9,
      @PLab10, @PText10)) then
      begin
        Form:= TfmInputEx.Create(nil);
        try
          Form.SetSize(Num);
          Form.Caption:= UTF8Decode(AnsiString(PCaption));
          Form.lab1.Caption:= UTF8Decode(AnsiString(PLab1));
          Form.lab2.Caption:= UTF8Decode(AnsiString(PLab2));
          Form.lab3.Caption:= UTF8Decode(AnsiString(PLab3));
          Form.lab4.Caption:= UTF8Decode(AnsiString(PLab4));
          Form.lab5.Caption:= UTF8Decode(AnsiString(PLab5));
          Form.lab6.Caption:= UTF8Decode(AnsiString(PLab6));
          Form.lab7.Caption:= UTF8Decode(AnsiString(PLab7));
          Form.lab8.Caption:= UTF8Decode(AnsiString(PLab8));
          Form.lab9.Caption:= UTF8Decode(AnsiString(PLab9));
          Form.lab10.Caption:= UTF8Decode(AnsiString(PLab10));
          Form.ed1.Text:= UTF8Decode(AnsiString(PText1));
          Form.ed2.Text:= UTF8Decode(AnsiString(PText2));
          Form.ed3.Text:= UTF8Decode(AnsiString(PText3));
          Form.ed4.Text:= UTF8Decode(AnsiString(PText4));
          Form.ed5.Text:= UTF8Decode(AnsiString(PText5));
          Form.ed6.Text:= UTF8Decode(AnsiString(PText6));
          Form.ed7.Text:= UTF8Decode(AnsiString(PText7));
          Form.ed8.Text:= UTF8Decode(AnsiString(PText8));
          Form.ed9.Text:= UTF8Decode(AnsiString(PText9));
          Form.ed10.Text:= UTF8Decode(AnsiString(PText10));

          if Form.ShowModal=mrOk then
            Result:= PyUnicode_FromWideString(
            Form.ed1.Text+#13+
            Form.ed2.Text+#13+
            Form.ed3.Text+#13+
            Form.ed4.Text+#13+
            Form.ed5.Text+#13+
            Form.ed6.Text+#13+
            Form.ed7.Text+#13+
            Form.ed8.Text+#13+
            Form.ed9.Text+#13+
            Form.ed10.Text+#13
            )
          else
            Result:= ReturnNone;
        finally
          FreeAndNil(Form);
        end;
      end;
  end;
end;

function Py_dlg_input_memo(Self, Args: PPyObject): PPyObject; cdecl;
var
  PCaption, PLab, PText: PAnsiChar;
  Form: TfmInputMemo;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'sss:dlg_input_memo',
      @PCaption, @PLab, @PText)) then
      begin
        Form:= TfmInputMemo.Create(nil);
        try
          Form.Caption:= UTF8Decode(AnsiString(PCaption));
          Form.lab1.Caption:= UTF8Decode(AnsiString(PLab));
          Form.Ed.Lines.Text:= UTF8Decode(AnsiString(PText));
          Form.Ed.Font.Assign(PyEditor(0).Font); //font from active editor

          if Form.ShowModal=mrOk then
            Result:= PyUnicode_FromWideString(Form.Ed.Lines.Text)
          else
            Result:= ReturnNone;
        finally
          FreeAndNil(Form);
        end;
      end;
  end;
end;


function Py_dlg_custom(Self, Args : PPyObject): PPyObject; cdecl;
var
  PtrTitle, PtrText: PChar;
  StrTitle, StrText, StrStateText: string;
  NSizeX, NSizeY, NFocused, NButton: integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'siisi:dlg_custom', @PtrTitle, @NSizeX, @NSizeY, @PtrText, @NFocused)) then
    begin
      StrTitle:= string(PtrTitle);
      StrText:= string(PtrText);
      DoDialogCustom(StrTitle, NSizeX, NSizeY, StrText, NFocused, NButton, StrStateText);
      if NButton<0 then
        Result:= ReturnNone
      else
        Result:= Py_BuildValue('(is)', NButton, PChar(StrStateText));
    end;
end;

function Py_dlg_input(Self, Args: PPyObject): PPyObject; cdecl;
var
  P1, P2, P3, P4: PAnsiChar;
  StrCaption, StrVal, StrFN, StrSection: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'ssss:dlg_input', @P1, @P2, @P3, @P4)) then
    begin
      StrCaption:= UTF8Decode(AnsiString(P1));
      StrVal:= UTF8Decode(AnsiString(P2));
      StrFN:= UTF8Decode(AnsiString(P3));
      StrSection:= UTF8Decode(AnsiString(P4));

      if ExtractFileDir(StrFN)='' then
        StrFN:= SynIniDir + StrFN;

      if DoInputString(StrCaption, StrVal, StrFN, StrSection) then
        Result:= PyUnicode_FromWideString(StrVal)
      else
        Result:= ReturnNone;
    end;
  end;
end;


function Py_msg_box_new(Self, Args: PPyObject): PPyObject; cdecl;
var
  Ptr: PAnsiChar;
  Str: Widestring;
  Flags: integer;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'si:msg_box_new', @Ptr, @Flags)) then
    begin
      Str:= UTF8Decode(AnsiString(Ptr));
      Result:= PyInt_FromLong(MsgBox(Str, Flags));
    end;
  end;
end;


function Py_msg_box(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
  H: THandle;
  P: PAnsiChar;
  Str: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'is:msg_box', @N, @P)) then
    begin
      Str:= UTF8Decode(AnsiString(P));
      H:= Application.MainForm.Handle;
      case N of
        0:
          begin
            MsgInfo(Str, H);
            Result:= ReturnNone;
          end;
        1:
          begin
            MsgWarn(Str, H);
            Result:= ReturnNone;
          end;
        2:
          begin
            MsgError(Str, H);
            Result:= ReturnNone;
          end;
        3:
          begin
            MessageBeep(mb_iconinformation);
            Result:= ReturnNone;
          end;
        4:
          begin
            MessageBeep(mb_iconwarning);
            Result:= ReturnNone;
          end;
        5:
          begin
            MessageBeep(mb_iconerror);
            Result:= ReturnNone;
          end;
        -1:
          begin
            N:= Ord(MsgConfirm(Str, H));
            Result:= PyBool_FromLong(N);
          end;
        -2:
          begin
            N:= Ord(MsgConfirm(Str, H, true));
            Result:= PyBool_FromLong(N);
          end;
        else
          Result:= ReturnNone;
      end;
    end;
  end;
end;


function Py_ModuleNameIncorrect(const S: string): boolean;
var
  i: Integer;
begin
  Result:= true;
  if S='' then Exit;
  if not IsAlphaChar(S[1]) then Exit;
  for i:= 1 to Length(S) do
    if not IsWordChar(S[i]) then Exit;
  Result:= false;
end;

(*
function Py_NameToMixedCase(const S: string): string;
var
  n: Integer;
begin
  Result:= S;
  if Result='' then Exit;
  Result[1]:= UpCase(Result[1]);
  repeat
    n:= Pos('_', Result);
    if n=0 then Exit;
    Delete(Result, n, 1);
    if n<=Length(Result) then
      Result[n]:= UpCase(Result[n]);
  until false;
end;
*)

function Py_ModuleNameExists(const SId: string): boolean;
var
  SCmd: string;
  Obj: PPyObject;
begin
  SCmd:=
    'import pkgutil                                     ' + SLineBreak +
    'def module_exists(m):                              ' + SLineBreak +
    '    for ldr, name, ispkg in pkgutil.iter_modules():' + SLineBreak +
    '        if name == m:                              ' + SLineBreak +
    '            return True                            ' + SLineBreak +
    '    return False                                   ';

  with GetPythonEngine do
  begin
    ExecString(SCmd);
    Obj:= EvalString(Format('module_exists(r"%s")', [SId]));
    Result:= Bool(PyObject_IsTrue(Obj));
  end;
end;

function Py_RunPlugin_Command(const SId, SCmd: string): string;
var
  SObj: string;
  SCmd1, SCmd2: string;
begin
  SObj:= '_syncommand_' + SId;
  SCmd1:=
    Format('import %s               ', [SId]) + SLineBreak +
    Format('if "%s" not in locals():', [SObj]) + SLineBreak +
    Format('    %s = %s.%s()        ', [SObj, SId, 'Command']);
  SCmd2:=
    Format('%s.%s()', [SObj, SCmd]);

  try
    GetPythonEngine.ExecString(SCmd1);
    Result:= GetPythonEngine.EvalStringAsStr(SCmd2);
  except
    MsgBeep(true);
  end;
end;


//No such method on PythonEngine code
function Py_EvalStringAsWideString(const command: string): Widestring;
var
  obj : PPyObject;
  s : PPyObject;
begin
  Result := '';
  with GetPythonEngine do
  begin
    obj := Run_CommandAsObject( command, eval_input );
    try
      if PyUnicode_Check(obj) then
      begin
        Result := PyUnicode_AsWideString(obj);
        Exit;
      end;

      s := PyObject_Str( obj );
      try
        if Assigned(s) and PyString_Check(s) then
          Result := PyString_AsWideString(s);
      finally
        Py_XDECREF(s);
      end;
    finally
      Py_XDECREF(obj);
    end;
  end;  
end;


function Py_RunPlugin_Event(const SId, SCmd: string;
  AEd: TSyntaxMemo; const AParams: array of string): Widestring;
var
  SObj: string;
  SCmd1, SCmd2: string;
  SParams: string;
  i: Integer;
  H: Integer;
begin
  H:= Integer(Pointer(AEd));
  SParams:= Format('sw.Editor(%d)', [H]);
  for i:= 0 to Length(AParams)-1 do
    SParams:= SParams + ', ' + AParams[i];

  SObj:= '_syncommand_' + SId;
  SCmd1:= 'import sw' + SLineBreak +
    Format('import %s               ', [SId]) + SLineBreak +
    Format('if "%s" not in locals():', [SObj]) + SLineBreak +
    Format('    %s = %s.%s()        ', [SObj, SId, 'Command']);
  SCmd2:=
    Format('%s.%s(%s)', [SObj, SCmd, SParams]);

  try
    GetPythonEngine.ExecString(SCmd1);
    //Result:= GetPythonEngine.EvalStringAsStr(SCmd2);
    Result:= Py_EvalStringAsWideString(SCmd2);
  except
    MsgBeep(true);
  end;
end;


function Py_text_local(Self, Args: PPyObject): PPyObject; cdecl;
  //
  function _GetFN(const fn_py, Suffix: string): string;
  begin
    Result:= ExtractFilePath(fn_py) + Suffix + '.lng';
  end;
  //
var
  P1, P2: PAnsiChar;
  fn_py, fn_lng, fn_en_lng, msg_id: string;
  S: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'ss:text_local', @P1, @P2)) then
    begin
      msg_id:= UTF8Decode(AnsiString(P1));
      fn_py:= UTF8Decode(AnsiString(P2));

      fn_lng:= _GetFN(fn_py, FHelpLangSuffix);
      fn_en_lng:= _GetFN(fn_py, 'En');

      S:= DoReadLangMsg(fn_lng, fn_en_lng, msg_id);
      Result:= PyUnicode_FromWideString(S);
    end;
  end;
end;

function Py_ed_get_text_substr(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NSt, NLen: Integer;
  Str: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:get_text_substr', @H, @NSt, @NLen)) then
    begin
      Ed:= PyEditor(H);
      Str:= Copy(Ed.Lines.FText, NSt + 1, NLen);
      Result:= PyUnicode_FromWideString(Str);
    end;
end;


function Py_ed_get_sync_ranges(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NLen, i: Integer;
  ComArray: Variant;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_sync_ranges', @H)) then
    begin
      Ed:= PyEditor(H);
      NLen:= Ed.SyncEditing.Count;
      if NLen>0 then
      begin
        ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
        for i:= 0 to NLen-1 do
        begin
          ComArray[i, 0]:= Ed.SyncEditing[i].StartPos;
          ComArray[i, 1]:= Ed.SyncEditing[i].Size;
        end;
        Result:= VariantAsPyObject(ComArray);
      end
      else
        Result:= ReturnNone;
    end;
end;


function Py_ed_get_carets(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  NLen, NSel, i: Integer;
  ComArray: Variant;
  Pnt: TPoint;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_carets', @H)) then
    begin
      Ed:= PyEditor(H);
      NLen:= Ed.CaretsCount;
      if NLen>0 then
      begin
        ComArray:= VarArrayCreate([0, NLen-1, 0, 2], varInteger);
        for i:= 0 to NLen-1 do
        begin
          Pnt:= Ed.GetCaret(i);
          NSel:= Ed.GetCaretSel(i);
          ComArray[i, 0]:= Pnt.X;
          ComArray[i, 1]:= Pnt.Y;
          ComArray[i, 2]:= NSel;
        end;
        Result:= VariantAsPyObject(ComArray);
      end
      else
        Result:= ReturnNone;
    end;
end;


function Py_regex_parse(Self, Args: PPyObject): PPyObject; cdecl;
var
  P1, P2: PAnsiChar;
  SRegex, SData: Widestring;
  ResL: TSynStrArray;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ss:regex_parse', @P1, @P2)) then
    begin
      SRegex:= UTF8Decode(AnsiString(P1));
      SData:= UTF8Decode(AnsiString(P2));

      SParseRegexArray(SData, SRegex, ResL);
      Result:= Py_BuildValue('(ssssssss)',
        PChar(UTF8Encode(ResL[0])),
        PChar(UTF8Encode(ResL[1])),
        PChar(UTF8Encode(ResL[2])),
        PChar(UTF8Encode(ResL[3])),
        PChar(UTF8Encode(ResL[4])),
        PChar(UTF8Encode(ResL[5])),
        PChar(UTF8Encode(ResL[6])),
        PChar(UTF8Encode(ResL[7]))
        );
    end;
end;


procedure Py_SetSysPath(const Dirs: array of string);
var
  Str: AnsiString;
  i: Integer;
begin
  Str:= '';
  for i:= 0 to Length(Dirs)-1 do
    Str:= Str + SWideStringToPythonString(Dirs[i]) + ',';
  Str:= Format('sys.path = [%s]', [Str]);
  GetPythonEngine.ExecString(Str);
end;

procedure Py_ConvertSessionToNewFormat(const fnIn, fnOut: Widestring);
var
  Str: AnsiString;
begin
  Str:= 'import sw_session_conv; sw_session_conv.convert(r"'+UTF8Encode(fnIn)+'", r"'+UTF8Encode(fnOut)+'");'; 
  GetPythonEngine.ExecString(Str);
end;

function Py_ed_get_word(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
  Ed: TSyntaxMemo;
  NStart, NEnd: Integer;
  Str: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:get_word', @H, @X, @Y)) then
    begin
      Ed:= PyEditor(H);
      Ed.WordRangeAtPos(Point(X, Y), NStart, NEnd);
      Str:= Copy(Ed.Lines.Text, NStart+1, NEnd-NStart);
      Result:= Py_BuildValue('(iis)', NStart, NEnd-NStart, PChar(UTF8Encode(Str)));
    end;
end;


function Py_text_convert(Self, Args: PPyObject): PPyObject; cdecl;
var
  PData, PFName: PAnsiChar;
  StrData, StrFName, StrResult: Widestring;
  NBack: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ssi:text_convert', @PData, @PFName, @NBack)) then
    begin
      StrData:= UTF8Decode(AnsiString(PData));
      StrFName:= UTF8Decode(AnsiString(PFName));
      if IsFileExist(StrFName) then
      begin
        StrResult:= SDecodeUsingFileTable(StrData, StrFName, Bool(NBack));
        Result:= PyUnicode_FromWideString(StrResult);
      end
      else
        Result:= ReturnNone;
    end;
end;

function Py_ed_get_staple(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, PosX, PosY: Integer;
  Ed: TSyntaxMemo;
  Staple: TBlockStaple;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:get_staple', @H, @PosX, @PosY)) then
    begin
      Ed:= PyEditor(H);
      Staple:= EditorGetBlockStaple(Ed, PosX, PosY);
      if Staple=nil then
        Result:= ReturnNone
      else
        Result:= Py_BuildValue('(ii)', Staple.StartPos, Staple.EndPos);
    end;
end;

function Py_ed_set_attr(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NId, NColor: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:set_attr', @H, @NId, @NColor)) then
    begin
      Ed:= PyEditor(H);
      case NId of
        ATTRIB_COLOR_FONT: Ed.SelAttributes.Color:= NColor;
        ATTRIB_COLOR_BG: Ed.SelAttributes.BgColor:= NColor;
        ATTRIB_CLEAR_ALL: Ed.SelAttributes.ClearFormat;
        ATTRIB_CLEAR_SELECTION: Ed.SelAttributes.ClearSelFormat;
        ATTRIB_SET_BOLD: Ed.SelAttributes.Bold:= true;
        ATTRIB_SET_ITALIC: Ed.SelAttributes.Italic:= true;
        ATTRIB_SET_UNDERLINE: Ed.SelAttributes.Underline:= true;
        ATTRIB_SET_STRIKEOUT: Ed.SelAttributes.StrikeOut:= true;
      end;
      Result:= ReturnNone;
    end;
end;

function _EditorGetStyleRanges(Ed: TSyntaxMemo): PPyObject; cdecl;
var
  Ranges: TRangeList;
  Range: TFormatRange;
  Styles: TStyleCache;
  Style: TSyntaxFormat;
  AList: PPyObject;
  i: Integer;
begin
  Ranges:= TecEmbeddedObjects(Ed.TextSource).FFormatRanges;
  Styles:= TecEmbeddedObjects(Ed.TextSource).FStyles;

  with GetPythonEngine do
  begin
    Result:= PyList_New(0);
    for i:= 0 to Ranges.Count-1 do
    begin
      Range:= TFormatRange(Ranges[i]);
      Style:= TSyntaxFormat(Styles[Range.StyleIdx]);

      AList:= ArrayToPyList([
        Range.StartPos,
        Range.EndPos,
        Style.Font.Color,
        Style.BgColor,
        IfThen(ffBold in Style.FormatFlags, 'b')+
        IfThen(ffItalic in Style.FormatFlags, 'i')+
        IfThen(ffUnderline in Style.FormatFlags, 'u')+
        IfThen(ffStrikeOut in Style.FormatFlags, 's')
        ]);
      PyList_Append(Result, AList);
      Py_XDecRef(AList);
    end;
  end;
end;

function Py_ed_get_attr(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:get_attr', @H)) then
    begin
      Ed:= PyEditor(H);
      Result:= _EditorGetStyleRanges(Ed);
    end;
end;


function Py_timer_proc(Self, Args: PPyObject): PPyObject; cdecl;
const
  cMinTime = 150;
var
  NId, NValue, N: integer;
  PtrName: PAnsiChar;
  StrName: WideString;
  Timer: TTimer;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'isi:timer_proc', @NId, @PtrName, @NValue)) then
    begin
      StrName:= UTF8Decode(AnsiString(PtrName));
      if not IsStringRegex(StrName, '[a-z]\w+\.[a-z]\w*') then
      begin
        Result:= PyBool_FromLong(0);
        Exit
      end;

      case NId of
        TIMER_START,
        TIMER_START_ONE:
          begin
            if NValue<cMinTime then
            begin
              Result:= PyBool_FromLong(0);
              Exit
            end;

            N:= fmMain.FListTimers.IndexOf(StrName);
            if N>=0 then
              Timer:= TTimer(fmMain.FListTimers.Objects[N])
            else
            begin
              Timer:= TTimer.Create(fmMain);
              Timer.OnTimer:= fmMain.DoPyTimerTick;
              fmMain.FListTimers.AddObject(StrName, Timer);
            end;

            if NId=TIMER_START_ONE then
              Timer.Tag:= 1
            else
              Timer.Tag:= 0;

            Timer.Enabled:= false;
            Timer.Interval:= NValue;
            Timer.Enabled:= true;
            Result:= PyBool_FromLong(1);
            Exit
          end;

        TIMER_STOP,
        TIMER_DELETE:
          begin
            N:= fmMain.FListTimers.IndexOf(StrName);
            if N<0 then
            begin
              Result:= PyBool_FromLong(0);
              Exit
            end;
            Timer:= TTimer(fmMain.FListTimers.Objects[N]);
            Timer.Enabled:= false;

            if NId=TIMER_DELETE then
            begin
              Timer.Free;
              fmMain.FListTimers.Delete(N);
            end;

            Result:= PyBool_FromLong(1);
            Exit
          end;

        else
          Result:= ReturnNone;
      end;
    end;
  end;
end;


procedure Py_InitApiModule(AModule: TPythonModule);
begin
  with AModule do
  begin
    AddMethod('msg_box', Py_msg_box, '');
    AddMethod('msg_box_new', Py_msg_box_new, '');
    AddMethod('msg_status', Py_msg_status, '');
    AddMethod('dlg_input', Py_dlg_input, '');
    AddMethod('dlg_input_ex', Py_dlg_input_ex, '');
    AddMethod('dlg_input_memo', Py_dlg_input_memo, '');
    AddMethod('dlg_menu', Py_dlg_menu, '');
    AddMethod('dlg_snippet', Py_dlg_snippet, '');
    AddMethod('dlg_file', Py_dlg_file, '');
    AddMethod('dlg_folder', Py_dlg_folder, '');
    AddMethod('dlg_color', Py_dlg_color, '');
    AddMethod('dlg_custom', Py_dlg_custom, '');

    AddMethod('app_version', Py_app_version, '');
    AddMethod('app_api_version', Py_app_api_version, '');
    AddMethod('app_exe_dir', Py_app_exe_dir, '');
    AddMethod('app_ini_dir', Py_app_ini_dir, '');
    AddMethod('app_log', Py_app_log, '');
    AddMethod('app_proc', Py_app_proc, '');
    AddMethod('lexer_proc', Py_lexer_proc, '');
    AddMethod('timer_proc', Py_timer_proc, '');
    AddMethod('ed_handles', Py_ed_handles, '');
    AddMethod('ed_group', Py_ed_group, '');

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
    AddMethod('ed_bookmarks', Py_ed_bookmarks, '');
    AddMethod('ed_get_sync_ranges', Py_ed_get_sync_ranges, '');
    AddMethod('ed_add_sync_range', Py_ed_add_sync_range, '');
    AddMethod('ed_focus', Py_ed_focus, '');
    AddMethod('ed_complete', Py_ed_complete, '');
    AddMethod('ed_get_split', Py_ed_get_split, '');
    AddMethod('ed_set_split', Py_ed_set_split, '');
    AddMethod('ed_set_attr', Py_ed_set_attr, '');
    AddMethod('ed_get_attr', Py_ed_get_attr, '');

    AddMethod('ed_get_text_all', Py_ed_get_text_all, '');
    AddMethod('ed_get_text_sel', Py_ed_get_text_sel, '');
    AddMethod('ed_get_text_line', Py_ed_get_text_line, '');
    AddMethod('ed_get_text_len', Py_ed_get_text_len, '');
    AddMethod('ed_get_text_substr', Py_ed_get_text_substr, '');

    AddMethod('ed_get_caret_xy', Py_ed_get_caret_xy, '');
    AddMethod('ed_get_caret_pos', Py_ed_get_caret_pos, '');
    AddMethod('ed_set_caret_xy', Py_ed_set_caret_xy, '');
    AddMethod('ed_set_caret_pos', Py_ed_set_caret_pos, '');
    AddMethod('ed_add_caret_xy', Py_ed_add_caret_xy, '');

    AddMethod('ed_pos_xy', Py_ed_pos_xy, '');
    AddMethod('ed_xy_pos', Py_ed_xy_pos, '');
    AddMethod('ed_log_xy', Py_ed_log_xy, '');
    AddMethod('ed_xy_log', Py_ed_xy_log, '');

    AddMethod('ed_get_line_count', Py_ed_get_line_count, '');
    AddMethod('ed_get_line_prop', Py_ed_get_line_prop, '');
    AddMethod('ed_get_carets', Py_ed_get_carets, '');
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
    AddMethod('ed_marks', Py_ed_marks, '');
    AddMethod('ed_save', Py_ed_save, '');
  end;
end;

end.

