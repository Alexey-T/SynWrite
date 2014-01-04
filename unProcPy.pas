unit unProcPy;

interface

uses
  PythonEngine,
  ecSyntMemo,
  ATSyntMemo;

var
  PyEditor: TSyntaxMemo = nil;
  PyExeDir: string = '';
  PyIniDir: string = '';

procedure Py_RunPlugin_Command(const SId, SCmd: string);
function Py_SamplePluginText(const SId: string): string;
function Py_NameToMixedCase(const S: string): string;
function Py_ModuleNameIncorrect(const S: string): boolean;
function Py_ModuleNameExists(const SId: string): boolean;

function Py_ed_add_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_del_carets(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_indent(Self, Args: PPyObject): PPyObject; cdecl;
function Py_regex_parse(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_carets(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_marks(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_cmd(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_lock(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_unlock(Self, Args: PPyObject): PPyObject; cdecl;
function Py_app_exe_dir(Self, Args : PPyObject): PPyObject; cdecl;
function Py_app_ini_dir(Self, Args : PPyObject): PPyObject; cdecl;
function Py_ini_read(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ini_write(Self, Args: PPyObject): PPyObject; cdecl;

function Py_dlg_input(Self, Args: PPyObject): PPyObject; cdecl;
function Py_msg_box(Self, Args: PPyObject): PPyObject; cdecl;
function Py_msg_local(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_len(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_substr(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_pos_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_xy_pos(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_xy_log(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_log_xy(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_line_count(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_line_prop(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_top(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_left(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_top(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_left(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_lines(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_insert(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_all(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_line(Self, Args: PPyObject): PPyObject; cdecl;

implementation

uses
  Windows,
  SysUtils,
  Types,
  Variants,
  Classes,
  IniFiles,
  Forms,
  ecSyntAnal,
  ecStrUtils,
  ATxFProc,
  unProc,
  unProcHelp,
  unProcEditor, ecLists;

function Py_ed_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(PyEditor.Lines.FText);
  end;
end;

function Py_ed_get_text_len(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.TextLength);
  end;
end;

function Py_ed_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(PyEditor.SelText);
  end;
end;

function Py_ed_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_get_text_line', @N) <> 0 then
    begin
      if N = -1 then
        N:= PyEditor.CurrentLine;
      if (N >= 0) and (N < PyEditor.Lines.Count) then
      begin
        Result:= PyUnicode_FromWideString(PyEditor.Lines[N]);
        Exit
      end;
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_del_carets(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    PyEditor.RemoveCarets();
    Result:= ReturnNone;
  end;
end;

function Py_ed_add_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_xy_pos', @X, @Y) <> 0 then
      PyEditor.AddCaret(Point(X, Y));
    Result:= ReturnNone;
  end;
end;

function Py_ed_get_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
begin
  P:= PyEditor.CaretPos;
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(ii)', P.X, P.Y);
  end;
end;

function Py_ed_get_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.CaretStrPos);
  end;
end;

function Py_ed_get_sel(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(ii)', PyEditor.SelStart, PyEditor.SelLength);
  end;
end;

function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
var
  R: TRect;
begin
  R:= PyEditor.SelRect;
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(iiii)', R.Left, R.Top, R.Right, R.Bottom);
  end;
end;


function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  case PyEditor.SelectMode of
    msColumn: N:= 1;
    msLine: N:= 2;
    else N:= 0;
  end;

  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(N);
  end;
end;


function Py_ed_get_line_count(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.Lines.Count);
  end;
end;

function Py_ed_get_top(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.TopLine);
  end;
end;

function Py_ed_get_left(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.ScrollPosX);
  end;
end;


function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;
var
  Pos: Integer;
  Str: string;
  An: TSyntAnalyzer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_get_lexer', @Pos) <> 0 then
    begin
      Str:= '';
      case Pos of
        -1:
          begin
            An:= PyEditor.TextSource.SyntaxAnalyzer;
            if An<>nil then
              Str:= An.LexerName;
          end;
        -2:
          Str:= EditorCurrentLexerForPos(PyEditor, PyEditor.CaretStrPos);
        else
          Str:= EditorCurrentLexerForPos(PyEditor, Pos);
      end;
      Result:= PyUnicode_FromWideString(Str);
    end;
  end;
end;


function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
var
  NStart, NLen: Integer;
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'iis:ed_replace', @NStart, @NLen, @P) <> 0 then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor.ReplaceText(NStart, NLen, StrW);
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_insert(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 's:ed_insert', @P) <> 0 then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor.InsertText(StrW);
    end;
    Result:= ReturnNone;
  end;
end;


function Py_ed_set_text_all(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 's:ed_set_text_all', @P) <> 0 then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor.ReplaceText(0, PyEditor.TextLength, StrW);
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_set_text_line(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'is:ed_set_text_line', @N, @P) <> 0 then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      if (N = -1) then
        N:= PyEditor.CurrentLine;
      if (N >= 0) and (N < PyEditor.Lines.Count) then
        PyEditor.Lines[N]:= StrW;
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_pos_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_pos_xy', @N) <> 0 then
    begin
      P:= PyEditor.StrPosToCaretPos(N);
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
      Exit
    end;
    Result:= ReturnNone;
  end;
end;


function Py_ed_xy_pos(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y, N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_xy_pos', @X, @Y) <> 0 then
    begin
      N:= PyEditor.CaretPosToStrPos(Point(X, Y));
      Result:= PyInt_FromLong(N);
      Exit
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_xy_log(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_xy_log', @X, @Y) <> 0 then
    begin
      P:= PyEditor.LinesPosToLog(Point(X, Y));
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
      Exit
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_log_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_log_xy', @X, @Y) <> 0 then
    begin
      P:= PyEditor.LogToLinesPos(Point(X, Y));
      Result:= Py_BuildValue('(ii)', P.X, P.Y);
      Exit
    end;
    Result:= ReturnNone;
  end;
end;


function Py_ed_set_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_set_caret_xy', @X, @Y) <> 0 then
    begin
      PyEditor.CaretPos:= Point(X, Y);
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_set_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_set_caret_pos', @N) <> 0 then
    begin
      PyEditor.CaretStrPos:= N;
    end;
    Result:= ReturnNone;
  end;
end;


function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  NStart, NLen, NFlag: Integer;
begin
  with GetPythonEngine do
  begin
    NFlag:= 0;
    if PyArg_ParseTuple(Args, 'ii|i:ed_set_sel', @NStart, @NLen, @NFlag) <> 0 then
    begin
      PyEditor.SetSelection(NStart, NLen, Bool(NFlag));
      Result:= ReturnNone;
    end;
  end;
end;

function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
var
  X1, Y1, X2, Y2: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'iiii:ed_set_sel_rect', @X1, @Y1, @X2, @Y2) <> 0 then
    begin
      PyEditor.SelRect:= Rect(X1, Y1, X2, Y2);
      Result:= ReturnNone;
    end;
  end;
end;

function Py_ed_get_line_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_get_line_prop', @N) <> 0 then
      if (N >= 0) and (N < PyEditor.Lines.Count) then
      begin
        Result:= Py_BuildValue('(ii)',
          PyEditor.Lines.LineLength(N),
          PyEditor.Lines.LineSpace(N));
        Exit
      end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_cmd(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
  P: PAnsiChar;
  Str: Widestring;
  CmdPtr: Pointer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'is:ed_cmd', @N, @P) <> 0 then
    begin
      Str:= UTF8Decode(AnsiString(P));
      if Str='' then
        CmdPtr:= nil
      else
        CmdPtr:= PWChar(Str);
      PyEditor.ExecCommand(N, CmdPtr);
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_lock(Self, Args: PPyObject): PPyObject; cdecl;
begin
  PyEditor.BeginUpdate;
  with GetPythonEngine do
    Result:= ReturnNone;
end;

function Py_ed_unlock(Self, Args: PPyObject): PPyObject; cdecl;
begin
  PyEditor.EndUpdate;
  with GetPythonEngine do
    Result:= ReturnNone;
end;

function Py_ed_get_sel_lines(Self, Args: PPyObject): PPyObject; cdecl;
var
  N1, N2: Integer;
begin
  EditorGetSelLines(PyEditor, N1, N2);
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(ii)', N1, N2);
  end;
end;

function Py_ed_set_top(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_set_top', @N) <> 0 then
    begin
      PyEditor.TopLine:= N;
    end;
    Result:= ReturnNone;
  end;
end;

function Py_ed_set_left(Self, Args: PPyObject): PPyObject; cdecl;
var
  N: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'i:ed_set_left', @N) <> 0 then
    begin
      PyEditor.ScrollPosX:= N;
    end;
    Result:= ReturnNone;
  end;
end;


function Py_app_exe_dir(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyString_FromString(PChar(PyExeDir));
  end;
end;

function Py_app_ini_dir(Self, Args : PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyString_FromString(PChar(PyIniDir));
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
    if PyArg_ParseTuple(Args, 'ssss:ini_read', @P1, @P2, @P3, @P4) <> 0 then
    begin
      StrFN:= UTF8Decode(AnsiString(P1));
      StrSess:= UTF8Decode(AnsiString(P2));
      StrKey:= UTF8Decode(AnsiString(P3));
      StrVal:= UTF8Decode(AnsiString(P4));

      fn:= StrFN;
      if ExtractFileDir(fn)='' then
        fn:= PyIniDir + '\' + fn;

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

function Py_dlg_input(Self, Args: PPyObject): PPyObject; cdecl;
var
  P1, P2, P3, P4: PAnsiChar;
  StrCaption, StrVal, StrFN, StrSection: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ssss:dlg_input', @P1, @P2, @P3, @P4) <> 0 then
    begin
      StrCaption:= UTF8Decode(AnsiString(P1));
      StrVal:= UTF8Decode(AnsiString(P2));
      StrFN:= UTF8Decode(AnsiString(P3));
      StrSection:= UTF8Decode(AnsiString(P4));

      if ExtractFileDir(StrFN)='' then
        StrFN:= PyIniDir + '\' + StrFN;

      if DoInputString(StrCaption, StrVal, StrFN, StrSection) then
        Result:= PyUnicode_FromWideString(StrVal)
      else
        Result:= ReturnNone;
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
    if PyArg_ParseTuple(Args, 'is:msg_box', @N, @P) <> 0 then
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
        -1:
          begin
            N:= Ord(MsgConfirm(Str, H));
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

function Py_SamplePluginText(const SId: string): string;
const
  cSamplePlugin =
    'from sw import *'#13+
    'from sw_util import *'#13#13+
    'class Command:'#13+
    '    def run(self):'#13+
    '        s = "Lines count: " + str(ed_get_line_count())'#13+
    '        msg_box(MSG_INFO, s)'#13+
    '';
begin
  Result:=
    cSamplePlugin;
    //Format(cSamplePlugin, [Py_NameToMixedCase(SId)]);
end;

function Py_ModuleNameExists(const SId: string): boolean;
var
  L: TStringList;
  Obj: PPyObject;
begin
  L:= TStringList.Create;
  try
    L.Add('import pkgutil                                     ');
    L.Add('def module_exists(m):                              ');
    L.Add('    for ldr, name, ispkg in pkgutil.iter_modules():');
    L.Add('        if name == m:                              ');
    L.Add('            return True                            ');
    L.Add('    return False                                   ');

    //Messagebox(0, pchar(str), '', 0);
    with GetPythonEngine do
    begin
      ExecStrings(L);
      Obj:= EvalString(Format('module_exists(r"%s")', [SId]));
      Result:= PyObject_IsTrue(Obj) <> 0;
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure Py_RunPlugin_Command(const SId, SCmd: string);
var
  L: TStringList;
  SObj: string;
begin
  //object name from module name
  SObj:= '_syncommand_' + SId;

  L:= TStringList.Create;
  try
    L.Add(Format('import %s               ', [SId]));
    L.Add(Format('if "%s" not in locals():', [SObj]));
    L.Add(Format('    %s = %s.%s()        ', [SObj, SId, 'Command']));
    L.Add(Format('%s.%s()                 ', [SObj, SCmd]));
    try
      GetPythonEngine.ExecStrings(L);
    except
      MsgBeep(true);
    end;
  finally
    FreeAndNil(L);
  end;
end;

function Py_msg_local(Self, Args: PPyObject): PPyObject; cdecl;
  //
  function GetFN(const fn_py, Suffix: string): string;
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
    if PyArg_ParseTuple(Args, 'ss:msg_local', @P1, @P2) <> 0 then
    begin
      msg_id:= UTF8Decode(AnsiString(P1));
      fn_py:= UTF8Decode(AnsiString(P2));

      fn_lng:= GetFN(fn_py, FHelpLangSuffix);
      fn_en_lng:= GetFN(fn_py, 'En');

      S:= DoReadLangMsg(fn_lng, fn_en_lng, msg_id);
      Result:= PyUnicode_FromWideString(S);
    end;
  end;
end;

function Py_ed_get_text_substr(Self, Args: PPyObject): PPyObject; cdecl;
var
  NSt, NLen: Integer;
  Str: Widestring;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_get_text_substr', @NSt, @NLen) <> 0 then
    begin
      Str:= Copy(PyEditor.Lines.FText, NSt + 1, NLen);
      Result:= PyUnicode_FromWideString(Str);
    end;
  end;
end;


function Py_ed_get_marks(Self, Args: PPyObject): PPyObject; cdecl;
var
  NLen, i: Integer;
  ComArray: Variant;
begin
  with GetPythonEngine do
  begin
    NLen:= PyEditor.SearchMarks.Count;
    if NLen>0 then
    begin
      ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
      for i:= 0 to NLen-1 do
      begin
        ComArray[i, 0]:= PyEditor.SearchMarks[i].StartPos;
        ComArray[i, 1]:= PyEditor.SearchMarks[i].Size;
      end;
      Result:= VariantAsPyObject(ComArray);
    end
    else
      Result:= ReturnNone;
  end;
end;

function Py_ed_get_carets(Self, Args: PPyObject): PPyObject; cdecl;
var
  NLen, i: Integer;
  ComArray: Variant;
  Pnt: TPoint;
begin
  with GetPythonEngine do
  begin
    NLen:= PyEditor.CaretsCount;
    if NLen>0 then
    begin
      ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
      for i:= 0 to NLen-1 do
      begin
        Pnt:= PyEditor.GetCaret(i);
        ComArray[i, 0]:= Pnt.X;
        ComArray[i, 1]:= Pnt.Y;
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
  begin
    if PyArg_ParseTuple(Args, 'ss:regex_parse', @P1, @P2) <> 0 then
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
end;

function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  Id: Integer;
  Size: TSize;
begin
  with GetPythonEngine do
    if PyArg_ParseTuple(Args, 'i:ed_get_prop', @Id) <> 0 then
      case Id of
        1:
          Result:= PyBool_FromLong(Ord(PyEditor.LineNumbers.Visible));
        2:
          Result:= PyUnicode_FromWideString(EditorEOL(PyEditor));
        3:
          Result:= PyBool_FromLong(Ord(PyEditor.WordWrap));
        4:
          Result:= PyBool_FromLong(Ord(PyEditor.ReadOnly));
        5:
          Result:= PyInt_FromLong(PyEditor.RightMargin);
        6:
          Result:= PyBool_FromLong(Ord(not PyEditor.DisableFolding));
        7:
          Result:= PyBool_FromLong(Ord(PyEditor.NonPrinted.Visible));
        8:
          Result:= PyBool_FromLong(Ord(PyEditor.TabMode = tmSpaces));
        9:
          Result:= PyInt_FromLong(EditorTabSize(PyEditor));
        10:
          Result:= PyUnicode_FromWideString(PyEditor.ColMarkersString);
        11:
          begin
            Size:= PyEditor.DefTextExt;
            Result:= Py_BuildValue('(ii)', Size.cx, Size.cy);
          end;
        12:
          Result:= PyInt_FromLong(PyEditor.Zoom);
        13:
          Result:= PyBool_FromLong(Ord(not PyEditor.ReplaceMode));
        else
          Result:= ReturnNone;
      end;
end;

function Py_ed_get_indent(Self, Args: PPyObject): PPyObject; cdecl;
var
  X, Y: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_xy_pos', @X, @Y) <> 0 then
      Result:= PyUnicode_FromWideString(EditorIndentStringForPos(PyEditor, Point(X, Y)));
  end;
end;
  
end.
