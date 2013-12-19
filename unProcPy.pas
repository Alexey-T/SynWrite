unit unProcPy;

interface

uses
  PythonEngine,
  ecSyntMemo;

var
  PyEditor: TSyntaxMemo = nil;

function Py_ed_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_caret(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_lines(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_eol(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_wrap(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_ro(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_start(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_len(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;

implementation

uses
  Windows,
  Types,
  ecSyntAnal,
  ecStrUtils,
  unProcEditor;

function Py_ed_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(PyEditor.Lines.FText);
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
    if PyArg_ParseTuple(Args, 'i:editor_get_text_line', @N) <> 0 then
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

{
function Py_ed_set_ro(Self, Args: PPyObject): PPyObject; cdecl;
var
  B: Boolean;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'b:editor_set_ro', @B) <> 0 then
      PyEditor.ReadOnly:= B;
  end;
end;
}

function Py_ed_get_caret(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
begin
  P:= PyEditor.CaretPos;
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(ii)', P.X, P.Y);
  end;
end;

function Py_ed_get_sel_start(Self, Args: PPyObject): PPyObject; cdecl;
var
  P: TPoint;
begin
  P:= PyEditor.StrPosToCaretPos(PyEditor.SelStart);
  with GetPythonEngine do
  begin
    Result:= Py_BuildValue('(ii)', P.X, P.Y);
  end;
end;

function Py_ed_get_sel_len(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.SelLength);
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


function Py_ed_get_lines(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyInt_FromLong(PyEditor.Lines.Count);
  end;
end;

function Py_ed_get_wrap(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyBool_FromLong(Ord(PyEditor.WordWrap));
  end;
end;

function Py_ed_get_ro(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyBool_FromLong(Ord(PyEditor.ReadOnly));
  end;
end;


function Py_ed_get_eol(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(EditorEOL(PyEditor));
  end;
end;


function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;
var
  An: TSyntAnalyzer;
  Str: string;
begin
  An:= PyEditor.TextSource.SyntaxAnalyzer;
  if An<>nil then
    Str:= An.LexerName
  else
    Str:= '';

  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(Str);
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
      //MessageBoxW(0, PWChar(StrW), 'Str', 0);
      PyEditor.ReplaceText(NStart, NLen, StrW);
    end;
    Result:= ReturnNone;
  end;
end;

end.
