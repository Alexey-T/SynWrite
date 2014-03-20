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


function Py_lexer_proc(Self, Args : PPyObject): PPyObject; cdecl;
const
  LEXER_GET_LIST    = 0;
  LEXER_GET_ENABLED = 1;
  LEXER_GET_EXT     = 2;
  LEXER_GET_MOD     = 3;
  LEXER_SET_NAME    = 10;
  LEXER_SET_ENABLED = 11;
  LEXER_SET_EXT     = 12;
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
            try
              fmMain.DoEnumLexers(List, true);
              List.Sort;
              Result:= PyUnicode_FromWideString(List.Text);
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
    end;
    Result:= ReturnNone;
  end;
end;

function Py_file_get_name(Self, Args: PPyObject): PPyObject; cdecl;
const
  cSynPyProjectIndexBase = 10000;
  cNone = '?';
var
  N, Id: Integer;
  Str: Widestring;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'i:file_get_name', @N)) then
    begin
      Str:= cNone;

      //get project's file name
      if (N >= cSynPyProjectIndexBase) then
      begin
        id:= N - cSynPyProjectIndexBase;
        with fmMain do
          if Assigned(fmProj) then
            if (id < fmProj.TreeProj.Items.Count) then
              Str:= fmProj.GetFN(fmProj.TreeProj.Items[id]);
      end
      else
      //get editor-tab filename
      if (N >= 0) then
      begin
        id:= N;
        if id < fmMain.FrameAllCount then
          Str:= fmMain.FramesAll[id].FileName;
      end
      else
      case N of
        -1: Str:= fmMain.CurrentFrame.FileName;
        -2: Str:= fmMain.CurrentFileName(cSynViewOpposite);
        -3: Str:= fmMain.FSessionFN;
        -10: Str:= fmMain.CurrentProjectFN;
        -11: Str:= fmMain.CurrentProjectMainFN;
        -12: Str:= fmMain.CurrentProjectWorkDir;
        -13: Str:= fmMain.CurrentProjectSessionFN;
        -20: Str:= fmMain.SynLexLib;
        -21: Str:= fmMain.DoGetSearchPaths;
        -22: Str:= fmMain.DoGetFavList;
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
    if Bool(PyArg_ParseTuple(Args, 'isi|i:ed_complete', @H, @P, @NLen, @NShow)) then
    begin
      //Ed:= PyEditor(H); //not used here
      Str:= UTF8Decode(AnsiString(P));
      NRes:= fmMain.PluginAction_SuggestCompletion(PWChar(Str), NLen, Bool(NShow));
      Result:= PyBool_FromLong(Ord(NRes = cSynOK));
    end;
  end;
end;

function Py_ed_focus(Self, Args: PPyObject): PPyObject; cdecl;
begin
  fmMain.FocusEditor;
  with GetPythonEngine do
    Result:= ReturnNone;
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
  cFlag_Regex_M  = 1 shl 7;
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
  AAction: TSRAction;
  AOptions: TSearchOptions;
  ATokens: TSearchTokens;
  AOptBkmk, AOptExtSel: boolean;
  EdPrev: TCustomSyntaxMemo;
  NAction, NOptions, NTokens, NFindRes: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiiss:ed_find',
      @H, @NAction, @NOptions, @NTokens,
      @PText1, @PText2)) then
    begin
      Ed:= PyEditor(H);
      EdPrev:= fmMain.Finder.Control;

      AText1:= UTF8Decode(AnsiString(PText1));
      AText2:= UTF8Decode(AnsiString(PText2));
      AAction:= TSRAction(NAction);
      ATokens:= TSearchTokens(NTokens);

      AOptions:= [];
      if (NOptions and cFlag_Case)<>0 then Include(AOptions, ftCaseSens);
      if (NOptions and cFlag_Words)<>0 then Include(AOptions, ftWholeWords);
      if (NOptions and cFlag_Back)<>0 then Include(AOptions, ftBackward);
      if (NOptions and cFlag_Sel)<>0 then Include(AOptions, ftSelectedText);
      if (NOptions and cFlag_Entire)<>0 then Include(AOptions, ftEntireScope);
      if (NOptions and cFlag_Regex)<>0 then Include(AOptions, ftRegex);
      if (NOptions and cFlag_Regex_S)<>0 then Include(AOptions, ftRegex_s);
      if (NOptions and cFlag_Regex_M)<>0 then Include(AOptions, ftRegex_m);
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

function Py_get_console_list: PPyObject; cdecl;
var
  NLen, i: Integer;
  ComArray: Variant;
begin
  with GetPythonEngine do
  begin
    NLen:= fmMain.edConsole.Items.Count;
    if NLen>0 then
    begin
      ComArray:= VarArrayCreate([0, NLen-1], varOleStr);
      for i:= 0 to NLen-1 do
      begin
        ComArray[i]:= fmMain.edConsole.Items[i];
      end;
      Result:= VariantAsPyObject(ComArray);
    end
    else
      Result:= ReturnNone;
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
            ComboUpdate(edConsole, opSaveSRHist);
            edConsole.Text:= '';
          end;
        LOG_CONSOLE_GET:
          begin
            Result:= Py_get_console_list;
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_filename', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_alerts', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_set_alerts', @H, @Flag)) then
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
          0, 1:
          begin
            with TfmUniList.Create(nil) do
            try
              Caption:= StrCaption;
              cbFuzzy.Caption:= DKLangConstW('zMCmdListFuzzy');
              FListItems:= MenuItems;
              FListStyle:= Id;
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
          2:
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

function Py_app_lock(Self, Args: PPyObject): PPyObject; cdecl;
var
  Id: Integer;
begin
  with GetPythonEngine do
  begin
    if Bool(PyArg_ParseTuple(Args, 'i:app_lock', @Id)) then
    begin
      case Id of
        0: fmMain.FLockUpdate:= true;
        1: fmMain.FLockUpdate:= false;
      end;
      Result:= ReturnNone;
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
    if Bool(PyArg_ParseTuple(Args, 'iiiiis:ed_set_bk', @H, @NId, @NPos, @NIcon, @NColor, @PHint)) then
    begin
      Ed:= PyEditor(H);
      Ed2:= fmMain.BrotherEditor(Ed);
      SHint:= UTF8Decode(AnsiString(PHint));
      EditorBookmarkCommand(Ed, NId, NPos, NIcon, NColor, SHint);
      EditorBookmarkCommand(Ed2, NId, NPos, NIcon, NColor, SHint);
      Result:= ReturnNone;
    end;
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
  if DockId='' then Panel.Floating:= true else
   if DockId='l' then Panel.CurrentDock:= fmMain.TbxDockLeft else
    if DockId='r' then Panel.CurrentDock:= fmMain.TbxDockRight else
     if DockId='b' then Panel.CurrentDock:= fmMain.TbxDockBottom else
      //if DockId='L' then Panel.CurrentDock:= fmMain.TbxDockLeft1 else
       //if DockId='R' then Panel.CurrentDock:= fmMain.TbxDockRight1 else
        //if DockId='B' then Panel.CurrentDock:= fmMain.TbxDockBottom1 else
         //if DockId='t' then Panel.CurrentDock:= fmMain.TbxDockTop else
          begin end;
end;

function Py_dock_str(Panel: TSpTBXDockablePanel): PPyObject; cdecl;
var
  Dock: TTBDock;
  Str: Widestring;
begin
  Dock:= Panel.CurrentDock;
  if Dock=nil then Str:= '' else
   if Dock=fmMain.TbxDockLeft then Str:= 'l' else
    if Dock=fmMain.TbxDockLeft1 then Str:= 'L' else
     if Dock=fmMain.TbxDockRight then Str:= 'r' else
      if Dock=fmMain.TbxDockRight1 then Str:= 'R' else
       if Dock=fmMain.TbxDockBottom then Str:= 'b' else
        if Dock=fmMain.TbxDockBottom1 then Str:= 'B' else
         if Dock=fmMain.TbxDockTop then Str:= 't' else
          Str:= '?';

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

  PROP_COORD_MONITOR  = 120;
  PROP_COORD_MONITOR0 = 121;
  PROP_COORD_MONITOR1 = 122;
  PROP_COORD_MONITOR2 = 123;
  PROP_COORD_MONITOR3 = 124;

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
      end;
    end;
end;


function Py_set_app_prop(Self, Args : PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Ptr: PAnsiChar;
  Str, SRect: Widestring;
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
      end;
      Result:= ReturnNone;
    end;
end;

