unit unProcPy;

interface

uses
  PythonEngine,
  ecSyntMemo;

var
  PyEditor: TSyntaxMemo;

function Py_editor_get_text_all(Self, Args : PPyObject): PPyObject; cdecl;
function Py_editor_get_text_sel(Self, Args : PPyObject): PPyObject; cdecl;
function Py_editor_get_text_line(Self, Args : PPyObject): PPyObject; cdecl;

implementation

function Py_editor_get_text_all(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(PyEditor.Lines.FText);
  end;
end;

function Py_editor_get_text_sel(Self, Args: PPyObject): PPyObject; cdecl;
begin
  with GetPythonEngine do
  begin
    Result:= PyUnicode_FromWideString(PyEditor.SelText);
  end;
end;

function Py_editor_get_text_line(Self, Args: PPyObject): PPyObject; cdecl;
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

end.
