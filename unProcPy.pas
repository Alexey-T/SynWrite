unit unProcPy;

interface

uses
  PythonEngine,
  ecSyntMemo,
  ATSyntMemo;

var
  PyEditor: function (AHandle: Integer): TSyntaxMemo = nil;
  PyExeDir: string = '';
  PyIniDir: string = '';

procedure Py_AddSysPath(const Dir: string);
procedure Py_RunPlugin_Command(const SId, SCmd: string);
function Py_SamplePluginText(const SId: string): string;
function Py_NameToMixedCase(const S: string): string;
function Py_ModuleNameIncorrect(const S: string): boolean;
function Py_ModuleNameExists(const SId: string): boolean;

function Py_ed_add_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_add_mark(Self, Args: PPyObject): PPyObject; cdecl;

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
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_text_all', @H)) then
      Result:= PyUnicode_FromWideString(PyEditor(H).Lines.FText);
end;

function Py_ed_get_text_len(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_text_len', @H)) then
      Result:= PyInt_FromLong(PyEditor(H).TextLength);
end;

function Py_ed_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_text_sel', @H)) then
      Result:= PyUnicode_FromWideString(PyEditor(H).SelText);
end;

function Py_ed_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_get_text_line', @H, @N)) then
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
  H, X, Y: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_add_caret_xy', @H, @X, @Y)) then
    begin
      Ed:= PyEditor(H);
      if (X=-1) then
        Ed.RemoveCarets()
      else
        Ed.AddCaret(Point(X, Y));
      Result:= ReturnNone;
    end;
end;

function Py_ed_add_mark(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_add_mark', @H, @NStart, @NLen)) then
    begin
      Ed:= PyEditor(H);
      if (NStart=-1) then
        Ed.ResetSearchMarks
      else
      begin
        Ed.SearchMarks.Add(TRange.Create(NStart, NStart + NLen));
        Ed.Invalidate;
      end;
      Result:= ReturnNone;
    end;
end;


function Py_ed_get_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  P: TPoint;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_caret_xy', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_caret_pos', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_sel', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_sel_rect', @H)) then
    begin
      R:= PyEditor(H).SelRect;
      Result:= Py_BuildValue('(iiii)', R.Left, R.Top, R.Right, R.Bottom);
    end;
end;


function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_sel_mode', @H)) then
    begin
      case PyEditor(H).SelectMode of
        msColumn: N:= 1;
        msLine: N:= 2;
        else N:= 0;
      end;
      Result:= PyInt_FromLong(N);
    end;
end;


function Py_ed_get_line_count(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_line_count', @H)) then
    begin
      Result:= PyInt_FromLong(PyEditor(H).Lines.Count);
    end;
end;

function Py_ed_get_top(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_top', @H)) then
    begin
      Result:= PyInt_FromLong(PyEditor(H).TopLine);
    end;
end;

function Py_ed_get_left(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_left', @H)) then
    begin
      Result:= PyInt_FromLong(PyEditor(H).ScrollPosX);
    end;
end;


function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  Pos: Integer;
  Str: string;
  Ed: TSyntaxMemo;
  An: TSyntAnalyzer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_get_lexer', @H, @Pos)) then
    begin
      Ed:= PyEditor(H);
      Str:= '';
      case Pos of
        -1:
          begin
            An:= Ed.TextSource.SyntaxAnalyzer;
            if An<>nil then
              Str:= An.LexerName;
          end;
        -2:
          Str:= EditorCurrentLexerForPos(Ed, Ed.CaretStrPos);
        else
          Str:= EditorCurrentLexerForPos(Ed, Pos);
      end;
      Result:= PyUnicode_FromWideString(Str);
    end;
end;


function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
var
  H: Integer;
  NStart, NLen: Integer;
  P: PAnsiChar;
  StrW: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiis:ed_replace', @H, @NStart, @NLen, @P)) then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor(H).ReplaceText(NStart, NLen, StrW);
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
    if Bool(PyArg_ParseTuple(Args, 'is:ed_insert', @H, @P)) then
    begin
      StrW:= UTF8Decode(AnsiString(P));
      PyEditor(H).InsertText(StrW);
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
    if Bool(PyArg_ParseTuple(Args, 'is:ed_set_text_all', @H, @P)) then
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
  P: PAnsiChar;
  StrW: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:ed_set_text_line', @H, @N, @P)) then
    begin
      Ed:= PyEditor(H);
      StrW:= UTF8Decode(AnsiString(P));
      if (N = -1) then
        N:= Ed.CurrentLine;
      if (N >= 0) and (N < Ed.Lines.Count) then
        Ed.Lines[N]:= StrW;
      Result:= ReturnNone;
    end;
end;

function Py_ed_pos_xy(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_pos_xy', @H, @N)) then
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
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_xy_pos', @H, @X, @Y)) then
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
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_xy_log', @H, @X, @Y)) then
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
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_log_xy', @H, @X, @Y)) then
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
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_set_caret_xy', @H, @X, @Y)) then
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
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_set_caret_pos', @H, @N)) then
    begin
      PyEditor(H).CaretStrPos:= N;
      Result:= ReturnNone;
    end;
end;


function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen, NFlag: Integer;
begin
  NFlag:= 0;
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii|i:ed_set_sel', @H, @NStart, @NLen, @NFlag)) then
    begin
      PyEditor(H).SetSelection(NStart, NLen, Bool(NFlag));
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X1, Y1, X2, Y2: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iiiii:ed_set_sel_rect', @H, @X1, @Y1, @X2, @Y2)) then
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
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_get_line_prop', @H, @N)) then
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
    if Bool(PyArg_ParseTuple(Args, 'iis:ed_cmd', @H, @N, @P)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_lock', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_unlock', @H)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_sel_lines', @H)) then
    begin
      EditorGetSelLines(PyEditor(H), N1, N2);
      Result:= Py_BuildValue('(ii)', N1, N2);
    end;
end;

function Py_ed_set_top(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_set_top', @H, @N)) then
    begin
      PyEditor(H).TopLine:= N;
      Result:= ReturnNone;
    end;
end;

function Py_ed_set_left(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, N: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_set_left', @H, @N)) then
    begin
      PyEditor(H).ScrollPosX:= N;
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
    if Bool(PyArg_ParseTuple(Args, 'ssss:ini_read', @P1, @P2, @P3, @P4)) then
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
    if Bool(PyArg_ParseTuple(Args, 'ssss:dlg_input', @P1, @P2, @P3, @P4)) then
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
    if Bool(PyArg_ParseTuple(Args, 'ss:msg_local', @P1, @P2)) then
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
  H, NSt, NLen: Integer;
  Str: Widestring;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_get_text_substr', @H, @NSt, @NLen)) then
    begin
      Ed:= PyEditor(H);
      Str:= Copy(Ed.Lines.FText, NSt + 1, NLen);
      Result:= PyUnicode_FromWideString(Str);
    end;
end;


function Py_ed_get_marks(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NLen, i: Integer;
  ComArray: Variant;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_marks', @H)) then
    begin
      Ed:= PyEditor(H);
      NLen:= Ed.SearchMarks.Count;
      if NLen>0 then
      begin
        ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
        for i:= 0 to NLen-1 do
        begin
          ComArray[i, 0]:= Ed.SearchMarks[i].StartPos;
          ComArray[i, 1]:= Ed.SearchMarks[i].Size;
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
  NLen, i: Integer;
  ComArray: Variant;
  Pnt: TPoint;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'i:ed_get_carets', @H)) then
    begin
      Ed:= PyEditor(H);
      NLen:= Ed.CaretsCount;
      if NLen>0 then
      begin
        ComArray:= VarArrayCreate([0, NLen-1, 0, 1], varInteger);
        for i:= 0 to NLen-1 do
        begin
          Pnt:= Ed.GetCaret(i);
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

function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Id: Integer;
  Size: TSize;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:ed_get_prop', @H, @Id)) then
    begin
      Ed:= PyEditor(H);
      case Id of
        1:
          Result:= PyBool_FromLong(Ord(Ed.LineNumbers.Visible));
        2:
          Result:= PyUnicode_FromWideString(EditorEOL(Ed));
        3:
          Result:= PyBool_FromLong(Ord(Ed.WordWrap));
        4:
          Result:= PyBool_FromLong(Ord(Ed.ReadOnly));
        5:
          Result:= PyInt_FromLong(Ed.RightMargin);
        6:
          Result:= PyBool_FromLong(Ord(not Ed.DisableFolding));
        7:
          Result:= PyBool_FromLong(Ord(Ed.NonPrinted.Visible));
        8:
          Result:= PyBool_FromLong(Ord(Ed.TabMode = tmSpaces));
        9:
          Result:= PyInt_FromLong(EditorTabSize(Ed));
        10:
          Result:= PyUnicode_FromWideString(Ed.ColMarkersString);
        11:
          begin
            Size:= Ed.DefTextExt;
            Result:= Py_BuildValue('(ii)', Size.cx, Size.cy);
          end;
        12:
          Result:= PyInt_FromLong(Ed.Zoom);
        13:
          Result:= PyBool_FromLong(Ord(not Ed.ReplaceMode));
        14:
          Result:= PyInt_FromLong(Ed.SyncEditing.Count);
        else
          Result:= ReturnNone;
      end;
    end;
end;

function Py_ed_get_indent(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
  Str: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:ed_xy_pos', @H, @X, @Y)) then
    begin
      Str:= EditorIndentStringForPos(PyEditor(H), Point(X, Y));
      Result:= PyUnicode_FromWideString(Str);
    end;
end;

procedure Py_AddSysPath(const Dir: string);
const
  cCmd = 'sys.path.append(r"%s")';
begin
  with GetPythonEngine do
    ExecString(Format(cCmd, [Dir]));
end;


end.
