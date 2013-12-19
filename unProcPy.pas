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
function Py_ed_get_text_len(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_caret_pos(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_pos_xy(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_xy_pos(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_lines(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_lexer(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_eol(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_wrap(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_ro(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_all(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_line(Self, Args: PPyObject): PPyObject; cdecl;

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

{
function Py_ed_set_ro(Self, Args: PPyObject): PPyObject; cdecl;
var
  B: Boolean;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'b:ed_set_ro', @B) <> 0 then
      PyEditor.ReadOnly:= B;
  end;
end;
}

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
    end;
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
    end;
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
  NStart, NLen: Integer;
begin
  with GetPythonEngine do
  begin
    if PyArg_ParseTuple(Args, 'ii:ed_set_sel', @NStart, @NLen) <> 0 then
    begin
      PyEditor.SetSelection(NStart, NLen);
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


end.
