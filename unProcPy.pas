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

const
  cSynPropRO      = 'sw.PROP_RO';
  cSynPropWrap    = 'sw.PROP_WRAP';
  cSynPropFolding = 'sw.PROP_FOLDING';
  cSynPropNums    = 'sw.PROP_NUMS';
  cSynPropRuler   = 'sw.PROP_RULER';

function Py_text_local(Self, Args: PPyObject): PPyObject; cdecl;
function Py_text_convert(Self, Args: PPyObject): PPyObject; cdecl;
function Py_regex_parse(Self, Args: PPyObject): PPyObject; cdecl;

procedure Py_SetSysPath(const Dirs: array of string);
procedure Py_ConvertSessionToNewFormat(const fnIn, fnOut: Widestring);
function Py_RunPlugin_Command(const SId, SCmd: string): string;
function Py_RunPlugin_Event(const SId, SCmd: string;
  AEd: TSyntaxMemo; const AParams: array of string): Widestring;
function Py_NameToMixedCase(const S: string): string;
function Py_ModuleNameIncorrect(const S: string): boolean;
function Py_ModuleNameExists(const SId: string): boolean;

function Py_ed_get_staple(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_bk(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_sync_ranges(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_add_sync_range(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_carets(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_add_caret_xy(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_marks(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_add_mark(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_get_indent(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_prop(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_word(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_cmd(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_lock(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_unlock(Self, Args: PPyObject): PPyObject; cdecl;
function Py_app_exe_dir(Self, Args : PPyObject): PPyObject; cdecl;
function Py_app_ini_dir(Self, Args : PPyObject): PPyObject; cdecl;
function Py_ini_read(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ini_write(Self, Args: PPyObject): PPyObject; cdecl;

function Py_dlg_input(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_input_ex(Self, Args: PPyObject): PPyObject; cdecl;
function Py_dlg_input_memo(Self, Args: PPyObject): PPyObject; cdecl;
function Py_msg_box(Self, Args: PPyObject): PPyObject; cdecl;

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

function Py_ed_get_sel_mode(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_sel_rect(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_get_sel_lines(Self, Args: PPyObject): PPyObject; cdecl;

function Py_ed_replace(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_insert(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_insert_snippet(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_all(Self, Args: PPyObject): PPyObject; cdecl;
function Py_ed_set_text_line(Self, Args: PPyObject): PPyObject; cdecl;

implementation

uses
  Windows,
  SysUtils,
  StrUtils,
  Types,
  Classes,
  IniFiles,
  Forms,
  Controls,
  Variants,
  ecSyntAnal,
  ecStrUtils,
  ecLists,
  ATxFProc,
  ATxSProc,
  unProc,
  unProcHelp,
  unProcEditor,
  unInputEx,
  unInputMemo;

const
  cMaxBookmarks = 10000;
    
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

function Py_ed_add_mark(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NStart, NLen: Integer;
  Ed: TSyntaxMemo;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:add_mark', @H, @NStart, @NLen)) then
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

const
  SEL_NORMAL = 0;
  SEL_COLUMN = 1;
  SEL_LINES  = 2;

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
        N:= Ed.CurrentLine;
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
    if Bool(PyArg_ParseTuple(Args, 'iii:get_text_substr', @H, @NSt, @NLen)) then
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
    if Bool(PyArg_ParseTuple(Args, 'i:get_marks', @H)) then
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

const
  PROP_NUMS        = 1;
  PROP_EOL         = 2;
  PROP_WRAP        = 3;
  PROP_RO          = 4;
  PROP_MARGIN      = 5;
  PROP_FOLDING     = 6;
  //free 7;
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
  PROP_TAG         = 30;

function Py_ed_get_prop(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, Id, NValue: Integer;
  Size: TSize;
  Ed: TSyntaxMemo;
  Ptr: PAnsiChar;
  Str: Widestring;
  IsCmt, IsStr: boolean;
  An: TSyntAnalyzer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:get_prop', @H, @Id, @Ptr)) then
    begin
      Ed:= PyEditor(H);
      Str:= UTF8Decode(AnsiString(Ptr));
      NValue:= StrToIntDef(Str, 0);
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
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iis:set_prop', @H, @Id, @P)) then
    begin
      Ed:= PyEditor(H);
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
          Ed.ColMarkersString:= StrVal;
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
      end;

      Result:= ReturnNone;
    end;
end;

function Py_ed_get_indent(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, X, Y: Integer;
  Str: Widestring;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'iii:xy_pos', @H, @X, @Y)) then
    begin
      Str:= EditorIndentStringForPos(PyEditor(H), Point(X, Y));
      Result:= PyUnicode_FromWideString(Str);
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


function Py_ed_get_bk(Self, Args: PPyObject): PPyObject; cdecl;
var
  H, NId, NIndex, NPos, NLen: Integer;
  Ed: TSyntaxMemo;
  Allow: boolean;
  ComArray: Variant;
  List: TList;
  i: Integer;
begin
  with GetPythonEngine do
    if Bool(PyArg_ParseTuple(Args, 'ii:get_bk', @H, @NId)) then
    begin
      Ed:= PyEditor(H);

      List:= TList.Create;
      try
        for i:= 0 to Ed.BookmarkObj.Count-1 do
        begin
          NIndex:= Ed.BookmarkObj.Items[i].BmIndex;
          NPos:= Ed.BookmarkObj.Items[i].Position;
          case NId of
            0..9: Allow:= NIndex = NId;
            -1: Allow:= NIndex>=10;
            -2: Allow:= NIndex<10;
            -3: Allow:= true;
            else Allow:= false;
          end;
          if Allow then
            List.Add(Pointer(NPos));
        end;

        NLen:= List.Count;
        if NLen>0 then
        begin
          ComArray:= VarArrayCreate([0, NLen-1], varInteger);
          for i:= 0 to NLen-1 do
          begin
            ComArray[i]:= Integer(List[i]);
          end;
          Result:= VariantAsPyObject(ComArray);
        end
        else
          Result:= ReturnNone;
      finally
        FreeAndNil(List);
      end;
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

end.
