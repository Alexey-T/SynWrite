unit unProc;

interface

uses
  ExtCtrls, Types, Forms, SysUtils,
  Classes, Graphics, Controls, StdCtrls,
  Messages,

  TntComCtrls,
  TntStdCtrls,
  TntClasses,

  ecSyntMemo,
  ecKeyMap,
  ecStrUtils,
  ecMemoStrings,
  ecSyntDlg,

  IniFiles,
  PngImageList;

procedure SParseString_AcpHtml(
  const AcpStr, Atr: string; List: TStringList);
procedure SParseString_AcpControlLine(
  const s: string;
  var AcpChars: string;
  var IsBracketSep: boolean);
procedure SParseString_AcpStd(
  const S: string;
  IsBracketSep: boolean;
  var SType, SId, SPar, SHint: string);

function EditorStringBeforeCaret(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
procedure EditorGetHtmlTag(Ed: TSyntaxMemo; var STag, SAttr: string);
procedure EditorGetCssTag(Ed: TSyntaxMemo; var STag: string);

function FontHeightToItemHeight(Font: TFont): Integer;
function SDecodeUsingFileTable(const SData, fn: Widestring; ToBack: boolean): Widestring;
function GetEditHandle(Target: TObject): THandle;
procedure DoHandleCtrlBkSp(Ed: TTntCombobox; var Key: Char);

//debug functions: _1 starts, _2 prints time since _1
procedure _1;
procedure _2;

type
  TSynMruList = class
  public
    Items: TTntStringList;
    MaxCount: Integer;
    constructor Create; virtual;
    destructor Destroy; override;
    procedure AddItem(const S: Widestring);
    procedure DeleteItem(const S: Widestring);
  end;

procedure LoadMruList(List: TSynMruList; Ini: TCustomIniFile; const Section: string;
  MaxCount: Integer; CheckExist: boolean);
procedure SaveMruList(List: TSynMruList; Ini: TCustomIniFile; const Section: string);
  
//function LoadPngIcon(ImageList: TTbxImageList; const fn: string): boolean;
function LoadPngIconEx(ImageList: TPngImageList; const fn: string): boolean;
function DoInputFilename(const dkmsg: string; var S: Widestring): boolean;
function DoInputString(const dkmsg: string; var S: Widestring;
  const IniFN: string = ''; const IniSection: string = ''): boolean;

procedure DoDeleteComboLastWord(ed: TTntCombobox);
procedure DoDeleteComboItem(ed: TTntCombobox);
function ScaleFontSize(Size: Integer; Form: TForm): Integer;

procedure SFindBrackets(const S: Widestring; const FromPos: Integer; var Pos1, Pos2: Integer);
function SFindOpeningBracket(const S: Widestring; nFromPos: Integer): Integer;

procedure FixDraw(Ctl: TWinControl; SizeX: boolean = true);
procedure FixFPU;
procedure FixLineEnds(var S: Widestring; const ATextFormat: TTextFormat);
procedure FixFilenamePath(var S: Widestring);
function IsDirOkForSaving(const S: Widestring): boolean;

function IsImageHint(const S: string): boolean; overload;
function IsImageHint(S: string; const SFilename: Widestring; var SResult: Widestring): boolean; overload;

type
  TSynStrArray = array[0..7] of Widestring;
procedure SParseRegexArray(const SStr, SRegex: Widestring;
  var Res: TSynStrArray);
//parse tool output string.
//res_fn: filename, res_line/res_col: line/column number.
procedure SParseOut(const SStr, SRegex: Widestring;
  num_fn, num_line, num_col: integer; //1-based
  var res_fn: Widestring; var res_line, res_col: integer);

procedure FWriteStringToFile(const fn: string; const S: WideString; UseUTF8: boolean);
function FFindStringInFile(const fn: Widestring;
  const Str: Widestring;
  IgnoreCase: boolean): boolean;
  
procedure FixTcIni(var fnTC: string; const section: string);

function SFindRegex(const S, Regex: ecString): ecString;
function IsStringRegex(const S, Regex: ecString): boolean;

function CompareListDate(List: TTntStringList; Index1, Index2: Integer): Integer;
function CompareListDateDesc(List: TTntStringList; Index1, Index2: Integer): Integer;

function Color2str(C: TColor): string;
function Hex2color(const s: string): TColor;
function IsHexColorString(const s: Widestring): boolean;

function IsCtrlPressed: boolean;
function IsCtrlAltPressed: boolean;

procedure DoAddColorToImageList(ImageList: TImageList;
  NColor: Integer; NColorText: Integer = -1);

procedure DoListKeys(SyntKeymapping: TSyntKeyMapping;
  const fn: string);
procedure DoCopyToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean; const Str: Widestring);
procedure DoPasteToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean);

function Min2(N, M: integer): integer;
function Max2(N, M: integer): integer;

function WideMinimizeName(const Filename: WideString; Canvas: TCanvas;
  MaxLen: Integer): WideString;

procedure ComboUpdate(ed: TTntCombobox; SRCount: integer);
procedure ComboSaveToFile(ed: TTntCombobox; const fn, section: string);
procedure ComboLoadFromFile(ed: TTntCombobox; const fn, section: string; UseLast: boolean = true);

type
  TFinderInTree = class(TecFindInTreeDialog)
  public
    IniFN: string;
    SearchText: Widestring;
  protected
    procedure SetDlgControls(Dlg: TCustomForm); override;
    procedure GetDlgControls(Dlg: TCustomForm); override;
    function CreateDlg: TCustomForm; override;
  end;

type
  TTntPageControl = class(TntComCtrls.TTntPageControl)
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST; //Info url below
  end;

function FFreeFN(const Name, ext, Dir: Widestring): Widestring;
function SFilterNum(const s: string): integer;
function SFilterIdxToExt(const Filter: string; Index: integer): string;
function SFilterNameToIdx(const AFilter, ALexerName: string): integer;

procedure MsgInfo(const S: WideString; H: THandle);
procedure MsgWarn(const S: WideString; H: THandle);
procedure MsgError(const S: WideString; H: THandle);
function MsgConfirm(const S: Widestring; H: THandle): boolean;
procedure MsgExcept(const S: Widestring; E: Exception; H: THandle);

procedure SetFormStyle(Form: TForm; Value: Boolean);
procedure SetFormOnTop(H: THandle; V: boolean);

type
  TSynToolSave = (
    svNone, svCurrent, svAll
    );

type
  TSynOutputType = (
    outIgnore, outToPanel, outToNewDoc,
    outReplaceSel, outReplaceDoc, outReplaceWord, outReplaceSelOrDoc,
    outToClip, outInsAtLineStart
    );

const
  cOutputTypeString: array[TSynOutputType] of string = (
    'ignore', 'toPanel', 'toNewDoc',
    'repSel', 'repDoc', 'repWord', 'repSelOrDoc',
    'toClip', 'insLnStart'
    );
  cOutputTypeOrder: array[0..Ord(High(TSynOutputType))] of TSynOutputType = (
    outIgnore,
    outToPanel, outToNewDoc, outToClip,
    outReplaceWord,
    outReplaceSel, outReplaceDoc, outReplaceSelOrDoc,
    outInsAtLineStart
    );

function OutputTypeLangID(n: TSynOutputType): Widestring;
function OutputTypeStrToType(const s: string): TSynOutputType;
function OutputTypeStrToOrder(const s: string): integer;

type
  TOutputEnc = (encAnsi, encOem, encUtf8{, encUni, encUniBE});

var
  opSrOffsetY: integer = 6;

implementation

uses
  Windows,
  ecZRegExpr,
  ecUnicode,
  ATxFProc, ATxSProc,
  Math, Dialogs, CommCtrl, StrUtils,
  TntClipbrd, TntSysUtils,
  DKLang,
  PngImage,
  unSRTree, unRename, unRenameFN;

procedure MsgInfo(const S: WideString; H: THandle);
begin
  MessageBoxW(H, PWChar(S), 'SynWrite',
    mb_ok or mb_iconinformation or mb_taskmodal);
end;

procedure MsgWarn(const S: WideString; H: THandle);
begin
  MessageBoxW(H, PWChar(S), 'SynWrite',
    mb_ok or mb_iconwarning or mb_taskmodal);
end;

procedure MsgError(const S: WideString; H: THandle);
begin
  MessageBoxW(H, PWChar(S), 'SynWrite',
    mb_ok or mb_iconerror or mb_taskmodal);
end;

function MsgConfirm(const S: Widestring; H: THandle): boolean;
begin
  Result:= MessageBoxW(H, PWChar(S), 'SynWrite',
    MB_okcancel or MB_iconwarning or mb_taskmodal) = id_ok;
end;

procedure MsgExcept(const S: Widestring; E: Exception; H: THandle);
begin
  MsgError(S + #13#13 + E.ClassName + #13 + E.Message, H);
end;

procedure TTntPageControl.AdjustClientRect(var Rect: TRect);
begin
  Rect:= DisplayRect;
  Rect:= Types.Rect(Rect.Left-4, Rect.Top-4, Rect.Right+4, Rect.Bottom+4);
end;

function IsStringRegex(const S, Regex: ecString): boolean;
var
  R: TecRegExpr;
  n: integer;
begin
  R:= TecRegExpr.Create;
  try
    R.Expression:= Regex;
    R.ModifierX:= false; //to handle ' ' in RE
    n:= 1;
    Result:= R.Match(S, n) and
      (R.MatchLen[0] = Length(S));
  finally
    R.Free;
  end;
end;

function SFindRegex(const S, Regex: ecString): ecString;
var
  R: TecRegExpr;
  n, nRes: integer;
begin
  Result:= '';
  R:= TecRegExpr.Create;
  try
    R.Expression:= Regex;
    R.ModifierX:= false; //to handle ' ' in RE
    for n:= 1 to Length(S) do
    begin
      nRes:= n;
      if R.Match(S, nRes) then
      begin
        Result:= Copy(S, n, R.MatchLen[0]);
        Exit
      end;
    end;
  finally
    R.Free;
  end;
end;


procedure SParseOut(const SStr, SRegex: Widestring;
  num_fn, num_line, num_col: integer;
  var res_fn: Widestring; var res_line, res_col: integer);
var
  Res: TSynStrArray;
begin
  res_line:= 0;
  res_col:= 0;
  SParseRegexArray(SStr, SRegex, Res);
  if num_fn>0 then
  begin
    res_fn:= Res[Pred(num_fn)];
    SReplaceAllW(res_fn, '/', '\'); //needed for TypeScript compiler 0.8
  end;
  if num_line>0 then
    res_line:= StrToIntDef(Res[Pred(num_line)], -1);
  if num_col>0 then
    res_col:= StrToIntDef(Res[Pred(num_col)], -1);
end;

{
procedure SParseOut(const s, re: Widestring;
  num_fn, num_line, num_col: integer;
  var res_fn: Widestring; var res_line, res_col: integer);
var
  r: TecRegExpr;
  n: Integer;
begin
  res_line:= 0;
  res_col:= 0;
  R:= TecRegExpr.Create;
  try
    R.Expression:= re;
    R.ModifierX:= false; //to handle ' ' in RE
    n:= 1;
    if R.Match(s, n) then
    begin
      if num_fn>0 then
      begin
        res_fn:= R.GetMatch(s, num_fn);
        SReplaceAllW(res_fn, '/', '\'); //needed for TypeScript compiler 0.8
      end;
      if num_line>0 then
        res_line:= StrToIntDef(R.GetMatch(s, num_line), -1);
      if num_col>0 then
        res_col:= StrToIntDef(R.GetMatch(s, num_col), -1);
    end;
  finally
    FreeAndNil(R);
  end;
end;
}

procedure SParseRegexArray(const SStr, SRegex: Widestring;
  var Res: TSynStrArray);
var
  r: TecRegExpr;
  i, n: Integer;
begin
  for i:= Low(Res) to High(Res) do
    Res[i]:= '';
  R:= TecRegExpr.Create;
  try
    R.Expression:= SRegex;
    R.ModifierX:= false; //to handle ' ' in RE
    n:= 1;
    if R.Match(SStr, n) then
    begin
      for i:= Low(Res) to High(Res) do
        Res[i]:= R.GetMatch(SStr, i+1);
    end;
  finally
    FreeAndNil(R);
  end;
end;

procedure _Log(const s: string);
var fn:string; f:Text;
begin
  fn:= 'c:\SynWr.log';
  Assign(f, fn);
  {$I-}
  Append(f);
  if IOREsult<>0 then Rewrite(f);
  {$I+}
  Writeln(f, s);
  Close(f);
end;

procedure SetFormStyle(Form: TForm; Value: Boolean);
const
  cNormalStyles = WS_BORDER or WS_DLGFRAME or WS_CAPTION or WS_THICKFRAME;
begin
  with Form do
  begin
    if Value then
      SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) or cNormalStyles)
    else
      SetWindowLong(Handle, GWL_STYLE, GetWindowLong(Handle, GWL_STYLE) and not cNormalStyles);

    SetWindowPos(Handle, 0, 0, 0, 0, 0, SWP_NOZORDER or SWP_NOSIZE or SWP_NOMOVE or SWP_FRAMECHANGED);
  end;
end;

// 'Text files (*.txt)|*.TXT|Pascal files (*.pas)|*.PAS'
function SFilterIdxToExt(const Filter: string; Index: integer): string;
var
  s: string;
  i: Integer;
begin
  S:= Filter;
  for i:= 1 to Index-1 do
  begin
    SDeleteTo(s, '|');
    SDeleteTo(s, '|');
  end;
  SDeleteTo(s, '|');
  SDeleteFrom(s, '|');
  SDeleteFrom(s, ';');
  SDeleteTo(s, '*.');
  Result:= LowerCase(s);
  if Result='*' then
    Result:= 'txt';
end;

// 'Text files (*.txt)|*.TXT|Pascal files (*.pas)|*.PAS'
// 'Text files' - 1, 'Pascal files' - 2
function SFilterNameToIdx(const AFilter, ALexerName: string): integer;
var
  s, sLexer: string;
  i: Integer;
begin
  Result:= 0;
  s:= AFilter;
  repeat
    Inc(Result);
    i:= Pos('|', s);
    if i=0 then //ALexerName not found in AFilter - return last index
      begin Dec(Result); Exit end;
    sLexer:= Copy(s, 1, i-1);
    SDeleteFrom(sLexer, '(*.');
    sLexer:= Trim(sLexer);
    //msg(Format('"%s" "%s" %d', [ss, Name, Result]));
    if LowerCase(sLexer)=LowerCase(ALexerName) then Exit;
    SDeleteTo(s, '|');
    SDeleteTo(s, '|');
  until false;
end;

//----------------------------------------------------------------------------------
// 'Text files (*.txt)|*.TXT|Pascal files (*.pas)|*.PAS'
// count of '|' is N+N-1
function SFilterNum(const s: string): integer;
var i: integer;
begin
  Result:= 1;
  for i:= 1 to Length(S) do
    if S[i]='|' then Inc(Result);
  Result:= Result div 2;
end;


function FFreeFN(const Name, ext, Dir: Widestring): Widestring;
var
  i: Integer;
  D: Widestring;
begin
  D:= Dir;
  if (D<>'') and (D[Length(D)]<>'\') then
    D:= D+'\';
  //w/o Num
  Result:= D + WideFormat('%s.%s', [Name, ext]);
  if not IsFileExist(Result) then Exit;
  //with Num
  for i:= 1 to 100 do
  begin
    Result:= D + WideFormat('%s%d.%s', [Name, i, ext]);
    if not IsFileExist(Result) then Exit;
  end;
end;

procedure SetFormOnTop(H: THandle; V: boolean);
begin
  if V then
    SetWindowPos(H, HWND_TOPMOST, 0,0,0,0,
                 SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE )
  else
    SetWindowPos(H, HWND_NOTOPMOST, 0,0,0,0,
                 SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE )
end;

const
  SRCount = 50;
  SR_EOL = '<<SW_EOL>>';

procedure ComboSaveToFile(ed: TTntCombobox; const fn, section: string);
var
  i: Integer;
  S: Ansistring;
begin
  if (fn='') or (section='') then Exit;
  with TIniFile.Create(fn) do
  try
    with ed do
    begin
      for i:= 0 to Items.Count-1 do
      begin
        S:= UTF8Encode(Items[i]);
        SReplaceAll(S, sLineBreak, SR_EOL);
        WriteString(section, IntToStr(i), '"' + S + '"');
      end;
      for i:= Items.Count to SRCount-1 do
        DeleteKey(section, IntToStr(i));
    end;
  finally
    Free;
  end;
end;

procedure ComboLoadFromFile(ed: TTntCombobox; const fn, section: string;
  UseLast: boolean = true);
var
  i: Integer;
  S: Widestring;
begin
  if (fn='') or (section='') then Exit;
  with TIniFile.Create(fn) do
  try
    with ed do
    begin
      for i:= 0 to SRCount-1 do
      begin
        S:= UTF8Decode(ReadString(section, IntToStr(i), ''));
        SReplaceAllW(S, SR_EOL, sLineBreak);
        if S<>'' then
          Items.Add(S);
      end;
      if UseLast then
        if Items.Count > 0 then
          Text:= Items[0];
    end;
  finally
    Free
  end;
end;

procedure ComboUpdate(ed: TTntCombobox; SRCount: integer);
var
  idx: integer;
  S: Widestring;
begin
  with ed do
  begin
    S:= Text;
    if S = '' then Exit;
    idx:= Items.IndexOf(S);
    if idx >= 0 then
      Items.Delete(idx);
    Items.Insert(0, S);
    while Items.Count > SRCount do
      Items.Delete(Items.Count - 1);
    Text:= S;
  end;
end;

{ TFinderInTree }

function TFinderInTree.CreateDlg: TCustomForm;
var
  fm: TfmSRTree;
begin
  fm:= TfmSRTree.Create(Self);
  fm.FIniFN:= IniFN;
  fm.FSearchFor:= SearchText;
  Result:= fm;
end;

procedure TFinderInTree.GetDlgControls(Dlg: TCustomForm);
begin
  with Dlg as TfmSRTree do
  begin
    FindText:= edText.Text;
    Flags:= [];
    if not cbFromCur.Checked then Flags:= Flags+[ftEntireScope];
    if cbCase.Checked then Flags:= Flags+[ftCaseSensitive];
    if cbWords.Checked then Flags:= Flags+[ftWholeWordOnly];
    if cbRE.Checked then Flags:= Flags+[ftRegularExpr];
    if bBack.Checked then Flags:= Flags+[ftBackward];
  end;
end;

procedure TFinderInTree.SetDlgControls(Dlg: TCustomForm);
begin
  with Dlg as TfmSRTree do
  begin
    edText.Text:= FindText;
    cbFromCur.Checked:= not (ftEntireScope in Flags);
    cbCase.Checked:= ftCaseSensitive in Flags;
    cbWords.Checked:= ftWholeWordOnly in Flags;
    cbRE.Checked:= ftRegularExpr in Flags;
    bBack.Checked:= ftBackward in Flags;
    bFor.Checked:= not bBack.Checked;
  end;
end;

function Min2(N, M: integer): integer;
begin
  if N<M then Result:= N else Result:= M;
end;

function Max2(N, M: integer): integer;
begin
  if N>M then Result:= N else Result:= M;
end;

procedure DoPasteToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean);
var
  S: Widestring;
begin
  S:= TntClipboard.AsWideText;
  if IsSpec then
    ed.SelText:= SEscapeSpec(S)
  else
  if IsRegex then
    ed.SelText:= SEscapeRegex(S)
  else
    ed.SelText:= S;
end;

procedure DoCopyToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean; const Str: Widestring);
begin
  if IsSpec then
    ed.Text:= SEscapeSpec(Str)
  else
  if IsRegex then
    ed.Text:= SEscapeRegex(Str)
  else
    ed.Text:= Str;
end;

//===================================
const
  _CssDoc =
  '<style type="text/css">                             '#13+
  'td, body {                                          '#13+
  'color:#000;                                         '#13+
  //'line-height: 1.5;                                   '#13+
  'font-family: Verdana, Arial, Helvetica, sans-serif; '#13+
  'font-size: 13px;                                    '#13+
  '}                                                   '#13+
  'table.sample {                                      '#13+
  '	border-width: 1px;                                 '#13+
  '	border-spacing: 2px;                               '#13+
  '	border-style: none;                                '#13+
  '	border-color: gray;                                '#13+
  '	border-collapse: collapse;                         '#13+
  '}                                                   '#13+
  'table.sample td{                                    '#13+
  '	border-width: 1px;                                 '#13+
  '	padding: 1px;                                      '#13+
  '	border-style: solid;                               '#13+
  '	border-color: gray;                                '#13+
  '}                                                   '#13+
  '</style>                                            '#13+
  '';

procedure DoListKeys(SyntKeymapping: TSyntKeyMapping;
  const fn: string);
var
  i, j, k: integer;
  old, sname, s: string;
  f: TextFile;
  LCat: TStringList;
  LKeys: TStringList;
  LKeysText: TStringList;
begin
  AssignFile(f, fn);
  Rewrite(f);
  Writeln(f, '<html><head><title>SynWrite keyboard mapping</title><head>'+
    '<body>');
  Writeln(f, _CssDoc);

  LCat:= TStringList.Create;
  LKeys:= TStringList.Create;
  LKeysText:= TStringList.Create;
  old:='';

  try
    for i:=0 to SyntKeyMapping.Items.Count-1 do
      if SyntKeyMapping.Items[i].Customizable then
        if LCat.IndexOf(SyntKeyMapping.Items[i].Category)<0 then
          LCat.Add(SyntKeyMapping.Items[i].Category);

    //list categories
    Writeln(f, '<table><tr>');
    for i:= 1 to 3 do
    begin
      Writeln(f, '<td>');
      for j:= 1 to Ceil(LCat.Count/3) do //categories
      begin
        k:= (i-1)*Ceil(LCat.Count/3) + j-1;
        if k<= LCat.Count-1 then
          Writeln(f, '<li><a href="#c'+IntToStr(k)+'">'+LCat[k]+'</a><br>');
      end;
      Writeln(f, '</td>');
    end;
    Writeln(f, '</tr></table>');

    //list keys
    Writeln(f, '<p><table class="sample">');
    for k:=0 to LCat.Count-1 do //categories
     for i:=0 to SyntKeyMapping.Items.Count-1 do //items
      if SyntKeyMapping.Items[i].Category = LCat[k] then
      begin
        if not SyntKeyMapping.Items[i].Customizable then Continue;
        if SyntKeyMapping.Items[i].Command = -1 then Continue;

        if old<>SyntKeyMapping.Items[i].Category then
        begin
          old:= SyntKeyMapping.Items[i].Category;
          Writeln(f, '<tr><td colspan=2 align="center"><font color="DarkBlue"><b>');
          Writeln(f, '<a name="c'+IntToStr(k)+'">'+old);
          Writeln(f, '</b></font></td></tr>');
        end;

        sname:= SyntKeyMapping.Items[i].DisplayName;
        SReplaceAll(sname, '<', '&lt;');
        SReplaceAll(sname, '>', '&gt;');

        Writeln(f, '<tr><td>');
        Write(f, '&nbsp;'+sname);
        Writeln(f, '</td><td><font color="DarkBlue">');

        if SyntKeyMapping.Items[i].KeyStrokes.Count>0 then
        begin
          S:= SyntKeyMapping.Items[i].KeyStrokes.Items[0].AsString;
          Write(f, '&nbsp;'+S);
          if S<>'' then
            if LKeys.IndexOf(S)>=0 then
              LKeysText.Add(sname + ': ' + S)
            else
              LKeys.Add(S);
        end;
        if SyntKeyMapping.Items[i].KeyStrokes.Count>1 then
        begin
          S:= SyntKeyMapping.Items[i].KeyStrokes.Items[1].AsString;
          Write(f, '<br>&nbsp;'+S);
          if S<>'' then
            if LKeys.IndexOf(S)>=0 then
              LKeysText.Add(sname + ': ' + S)
            else
              LKeys.Add(S);
        end;
        Writeln(f, '</font></td></tr>');
    end;

    Writeln(f, '</table>');

    if LKeysText.Count>0 then
    begin
      Writeln(f, '<p>Duplicate shortcuts:');
      Writeln(f, '<ul>');
      for i:= 0 to LKeysText.Count-1 do
        Writeln(f, '<li>'+LKeysText[i]);
      Writeln(f, '</ul></p>');
    end;

    Writeln(f, '</body></html>');
    CloseFile(f);
  finally
    FreeAndNil(LCat);
    FreeAndNil(LKeys);
    FreeAndNil(LKeysText);
  end;  
end;


procedure WideCutFirstDirectory(var S: WideString);
var
  Root: Boolean;
  P: Integer;
begin
  if S = '\' then
    S := ''
  else
  begin
    if S[1] = '\' then
    begin
      Root := True;
      Delete(S, 1, 1);
    end
    else
      Root := False;
    if S[1] = '.' then
      Delete(S, 1, 4);
    P := Pos('\',S);
    if P <> 0 then
    begin
      Delete(S, 1, P);
      S := '...\' + S;
    end
    else
      S := '';
    if Root then
      S := '\' + S;
  end;
end;


function WideMinimizeName(const Filename: WideString; Canvas: TCanvas;
  MaxLen: Integer): WideString;
var
  Drive: WideString;
  Dir: WideString;
  Name: WideString;
begin
  Result := FileName;
  Dir := WideExtractFilePath(Result);
  Name := WideExtractFileName(Result);

  if (Length(Dir) >= 2) and (Dir[2] = ':') then
  begin
    Drive := Copy(Dir, 1, 2);
    Delete(Dir, 1, 2);
  end
  else
    Drive := '';
  while ((Dir <> '') or (Drive <> '')) and (ecTextExtent(Canvas, Result).cx > MaxLen) do
  begin
    if Dir = '\...\' then
    begin
      Drive := '';
      Dir := '...\';
    end
    else if Dir = '' then
      Drive := ''
    else
      WideCutFirstDirectory(Dir);
    Result := Drive + Dir + Name;
  end;
end;


  function Hex2digit(ch: char): integer;
  begin
    ch:= UpCase(ch);
    if ch>'9' then
      Result:= Ord(ch)-Ord('A')+10
    else
      Result:= Ord(ch)-Ord('0');
  end;

  function Hex2Byte(const s: string): integer;
  begin
    if Length(s)<>2 then
      raise Exception.Create('Not 2-digit hex string: '+s);
    Result:= hex2digit(s[1])*16 + hex2digit(s[2]);
  end;

  function Hex2color(const s: string): TColor;
  var n1, n2, n3: integer;
  begin
    if Length(s)=6 then
    begin
      n1:= hex2byte(s[1]+s[2]);
      n2:= hex2byte(s[3]+s[4]);
      n3:= hex2byte(s[5]+s[6]);
      Result:= RGB(n1, n2, n3);
    end
    else
    if Length(s)=3 then
    begin
      n1:= hex2byte(s[1]+s[1]);
      n2:= hex2byte(s[2]+s[2]);
      n3:= hex2byte(s[3]+s[3]);
      Result:= RGB(n1, n2, n3);
    end
    else
      raise Exception.Create('Not ok color string: '+s);
  end;

function IsHexChar(Ch: WideChar): boolean;
begin
  Result:= Pos(Ch, '1234567890abcdefABCDEF') > 0;
end;

function IsHexColorString(const s: Widestring): boolean;
var i: integer;
begin
  Result:= false;
  if (Length(s)<>3) and (Length(s)<>6) then Exit;
  for i:= 1 to Length(s) do
    if not IsHexChar(s[i]) then
      Exit;
  Result:= true;
end;

function Color2str(C: TColor): string;
begin
  Result:= '#' +
    IntToHex(GetRValue(C), 2) +
    IntToHex(GetGValue(C), 2) +
    IntToHex(GetBValue(C), 2)
end;

//-----------------------
function OutputTypeLangID(n: TSynOutputType): Widestring;
begin
  Result:= 'zztyp_' + cOutputTypeString[n];
end;

function OutputTypeStrToType(const s: string): TSynOutputType;
var
  i: TSynOutputType;
begin
  Result:= Low(TSynOutputType);
  for i:= Low(TSynOutputType) to High(TSynOutputType) do
    if s = cOutputTypeString[i] then
      begin Result:= i; Exit end;
end;

function OutputTypeStrToOrder(const s: string): integer;
var
  t: TSynOutputType;
  n: integer;
begin
  Result:= 0;
  t:= OutputTypeStrToType(s);
  for n:= 0 to High(cOutputTypeOrder) do
    if cOutputTypeOrder[n] = t then
      begin Result:= n; Exit end;
end;


function CompareListDate(List: TTntStringList; Index1, Index2: Integer): Integer;
var d1, d2: integer;
begin
  d1:= WideFileAge(List[Index1]);
  d2:= WideFileAge(List[Index2]);
  Result:= Trunc(FileDateToDateTime(d1) - FileDateToDateTime(d2));
end;

function CompareListDateDesc(List: TTntStringList; Index1, Index2: Integer): Integer;
begin
  Result:= -CompareListDate(List, Index1, Index2);
end;

function IsCtrlPressed: boolean;
begin
  Result:= GetKeyState(vk_control) < 0;
end;

function IsCtrlAltPressed: boolean;
begin
  Result:=
    (GetKeyState(vk_control) < 0) and
    (GetKeyState(vk_menu) < 0) and
    (GetKeyState(vk_shift) >= 0);
end;


procedure DoAddColorToImageList(ImageList: TImageList;
  NColor: Integer; NColorText: Integer = -1);
var
  b: Graphics.TBitmap;
const
  cc = 'Text';
begin
  b:= Graphics.TBitmap.Create;
  try
    b.PixelFormat:= pf24bit;
    b.Width:= ImageList.Width;
    b.Height:= ImageList.Height;
    b.Canvas.Brush.Color:= NColor;
    b.Canvas.FillRect(Rect(0, 0, b.Width, b.Height));

    if NColorText<>-1 then
    begin
      b.Canvas.Font.Name:= 'Tahoma';
      b.Canvas.Font.Style:= [fsBold];
      b.Canvas.Font.Size:= 10;
      b.Canvas.Font.Color:= NColorText;
      b.Canvas.TextOut((b.Width-b.Canvas.TextWidth(cc)) div 2, -1, cc);
    end;

    b.Canvas.Brush.Color:= clBlack;
    b.Canvas.FrameRect(Rect(0, 0, b.Width, b.Height));

    ImageList.Add(b, nil);
  finally
    FreeAndNil(b);
  end;
end;


procedure FixTcIni(var fnTC: string; const section: string);
var
  S: string;
begin
  with TIniFile.Create(fnTC) do
  try
    S:= ReadString(section, 'RedirectSection', '');
    if S<>'' then
      if ExtractFileDir(S)='' then
        fnTC:= ExtractFilePath(fnTC) + S
      else
        fnTC:= S;
    fnTC:= SExpandVars(fnTC);
  finally
    Free
  end;
end;

procedure TTntPageControl.WMNCHitTest(var Message: TWMNCHitTest);
// http://stackoverflow.com/questions/14283304/delphi-how-to-handle-click-on-pagecontrols-empty-space
begin
  inherited;
  if Message.Result = HTTRANSPARENT then
    Message.Result := HTCLIENT;
end;

//-----------------------------------------------
const
  cImageHintList = 'jpg,jpeg,jpe,jfif,bmp,png,gif,ico';

function IsImageHint(const S: string): boolean;
begin
  Result:= SFileExtensionMatch(S, cImageHintList);
end;  

function IsImageHint(S: string; const SFilename: Widestring; var SResult: Widestring): boolean;
begin
  Result:= false;
  SResult:= '';
  if S='' then Exit;
  if Pos('http://', S)>0 then Exit;

  if S[1]='''' then
    S:= Copy(S, 2, Length(S)-2)
  else
  if S[1]='"' then
    S:= Copy(S, 2, Length(S)-2);

  Result:= IsImageHint(S);
  if Result then
  begin
    SReplaceAll(S, '/', '\');
    //append path only for local filenames w/o drive, w/o "http://"
    if Pos(':', S)=0 then
      SResult:= WideExtractFilePath(SFileName) + S
    else
      SResult:= S;
  end;
end;

//-----------------------------------------------
function IsDirInWindowsDir(const S: Widestring): boolean;
begin
  Result:= Pos(
    WideUpperCase(SExpandVars('%windir%\')), 
    WideUpperCase(S)+'\')
    = 1;
end;  

function IsDirOkForSaving(const S: Widestring): boolean;
begin
  Result:= (Pos(':', S)=0) or IsDirInWindowsDir(S) or IsDirExist(S);
end;

procedure FixFilenamePath(var S: Widestring);
begin
  if WideExtractFileDir(S)='' then
    S:= WideExcludeTrailingBackslash(WideGetCurrentDir)+'\'+S;
end;

procedure FixLineEnds(var S: Widestring; const ATextFormat: TTextFormat);
begin
  case ATextFormat of
    tfCR: ReplaceStr(S, #13#10, #13);
    tfNL: ReplaceStr(S, #13#10, #10);
  end;
end;

//------------------------------

function SFindOpeningBracket(const S: Widestring; nFromPos: Integer): Integer;
var
  n, nLockRound, nLockSquare, nLockCurly: Integer;
begin
  Result:= -1;
  n:= nFromPos;
  nLockRound:= 0;
  nLockSquare:= 0;
  nLockCurly:= 0;

  repeat
    Dec(n);
    if n<1 then Break;

    if S[n]=')' then begin Inc(nLockRound); Continue end;
    if S[n]=']' then begin Inc(nLockSquare); Continue end;
    if S[n]='}' then begin Inc(nLockCurly); Continue end;

    if S[n]='(' then
    begin
      if nLockRound=0 then
        begin Result:= n; Exit end
      else
        begin Dec(nLockRound); Continue end;
    end;
    if S[n]='[' then
    begin
      if nLockSquare=0 then
        begin Result:= n; Exit end
      else
        begin Dec(nLockSquare); Continue end;
    end;
    if S[n]='{' then
    begin
      if nLockCurly=0 then
        begin Result:= n; Exit end
      else
        begin Dec(nLockCurly); Continue end;
    end;
  until false;
end;

procedure SFindBrackets(const S: Widestring; const FromPos: Integer; var Pos1, Pos2: Integer);
var
  ch1, ch2: ecChar;
  fw: Boolean;
  n, nLock: integer;
begin
  Pos1:= 0;
  Pos2:= 0;
  if (FromPos>0) and (FromPos<=Length(S)) then
  begin
    ch1:= S[FromPos];
    if ch1='[' then begin ch2:= ']'; fw:= true; end else
    if ch1='(' then begin ch2:= ')'; fw:= true; end else
    if ch1='{' then begin ch2:= '}'; fw:= true; end else
    if ch1=']' then begin ch2:= '['; fw:= false; end else
    if ch1=')' then begin ch2:= '('; fw:= false; end else
    if ch1='}' then begin ch2:= '{'; fw:= false; end else
      Exit;
      
    n:= FromPos;
    nLock:= 0;

    while (n>0) and (n<=Length(S)) do
    begin
      if fw then Inc(n) else Dec(n);
      if (S[n]=ch2) and (nLock<=0) then Break;
      if (S[n]=ch1) then Inc(nLock);
      if (S[n]=ch2) then Dec(nLock);
    end;
    
    if (n>0) and (n<=Length(S)) then
    begin
      Pos1:= FromPos;
      Pos2:= n;
    end;
  end;
end;

procedure FixFPU;
begin
  //to prevent EInvalidOp "Floating point error"
  SetExceptionMask(GetExceptionMask+[exInvalidOp]);
end;

function ScaleFontSize(Size: Integer; Form: TForm): Integer;
begin
  Result:= Size * Form.PixelsPerInch div 96 + 1;
end;

function SMultilineSelection(s: Widestring): boolean;
var i: Integer;
begin
  Result:= false;
  s:= TrimRight(s);
  for i:= 1 to Length(s) do
    if (s[i]=#13) or (s[i]=#10) then
      begin Result:= true; Exit end;
end;

procedure DoDeleteComboItem(ed: TTntCombobox);
begin
  if ed.DroppedDown then
    ed.Items.Delete(ed.ItemIndex);
end;

procedure DoDeleteComboLastWord(ed: TTntCombobox);
var
  N1, N2: Integer;
begin
  Exit; //todo
  N1:= ed.SelStart;
  if N1=0 then Exit;
  N2:= N1-1;
  while (N2>0) and IsWordChar(ed.Text[N2]) do
    Dec(N2);
  ed.SelStart:= N2;
  ed.SelLength:= N1-N2;
  ed.SelText:= '';
end;

function DoInputFilename(const dkmsg: string; var S: Widestring): boolean;
begin
  with TfmRenameFN.Create(nil) do
  try
    labRename.Caption:= DKLangConstW(dkmsg);

    edName.Text:= WideChangeFileExt(S, '');
    edExt.Text:= Copy(WideExtractFileExt(S), 2, MaxInt);

    Result:= ShowModal=mrOk;
    if Result then
      S:= GetFN;
  finally
    Free
  end;
end;

function DoInputString(const dkmsg: string; var S: Widestring;
  const IniFN: string = ''; const IniSection: string = ''): boolean;
begin
  with TfmRename.Create(nil) do
  try
    labRename.Caption:= DKLangConstW(dkmsg);

    ComboLoadFromFile(edName, IniFN, IniSection);
    FEnablePrevValue:= true;
    edName.Text:= S;

    Result:= ShowModal=mrOk;
    if Result then
    begin
      S:= edName.Text;
      ComboUpdate(edName, 10);
      ComboSaveToFile(edName, IniFN, IniSection);
    end;
  finally
    Free
  end;
end;


(*
function LoadPngIcon(ImageList: TTbxImageList; const fn: string): boolean;
var
  FileHandle: THandle;
  HandleStream: THandleStream;
  Image: TDib32;
begin
  Result:= false;
  FileHandle:= CreateFileW(PWideChar(Widestring(fn)), GENERIC_READ, FILE_SHARE_READ,
    nil, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, 0);
  if FileHandle<>INVALID_HANDLE_VALUE then
  begin
    HandleStream:= THandleStream.Create(FileHandle);
    Image:= TDib32.Create;
    try
      LoadPNGGraphic(HandleStream, Image);
      ImageList.Add(Image);
      Result:= true;
    finally
      FreeAndNil(HandleStream);
      FreeAndNil(Image);
    end;
  end;
end;
*)

function LoadPngIconEx(ImageList: TPngImageList; const fn: string): boolean;
var
  AImage: TPngObject;
begin
  if not FileExists(fn) then
    Result:= false
  else
  begin
    AImage:= TPngObject.Create;
    try
      AImage.LoadFromFile(fn);
      ImageList.PngImages.Add.PngImage:= AImage;
      Result:= true;
    finally
      FreeAndNil(AImage);
    end;
  end;
end;


{
function SHAutoComplete(H: THandle; Flags: DWord): HResult; stdcall; external 'shlwapi.dll';
const
  SHACF_AUTOAPPEND_FORCE_OFF: DWord = $80000000;
  SHACF_AUTOSUGGEST_FORCE_OFF: DWord = $20000000;

procedure FixEditBkSp(H: THandle);
begin
  SHAutoComplete(H,
    SHACF_AUTOAPPEND_FORCE_OFF or SHACF_AUTOSUGGEST_FORCE_OFF)
end;
}

function GetEditHandle(Target: TObject): THandle;
begin
    Result := 0;
    {
    if (Target is TCustomEdit) then
        Result := GetControl(Target).Handle
    else} if (Target is TComboBox) then
    begin
        Result := GetWindow((Target as TWinControl).Handle, GW_CHILD);
        if (Result <> 0) then
        begin
          if ((Target as TComboBox).Style = csSimple) then
            Result := GetWindow(Result, GW_HWNDNEXT);
        end;
    end
    else if (Target is TTntComboBox) then
    begin
        Result := GetWindow((Target as TWinControl).Handle, GW_CHILD);
        if (Result <> 0) then
        begin
          if ((Target as TTntComboBox).Style = csSimple) then
            Result := GetWindow(Result, GW_HWNDNEXT);
        end;
    end;
end;


procedure DoHandleCtrlBkSp(Ed: TTntCombobox; var Key: Char);
var
  S: Widestring;
  n1, n2: Integer;
begin
  if Key=#127 then
  begin
    if Ed.SelLength>0 then
    begin
      n1:= Ed.SelStart+Ed.SelLength;
      Ed.SelLength:= 0;
      Ed.SelStart:= n1;
    end;

    S:= Ed.Text;
    n2:= Ed.SelStart;
    n1:= n2;
    while (n1>0) and (S[n1]=' ') do Dec(n1);
    while (n1>0) and (S[n1]<>' ') do Dec(n1);
    Delete(S, n1+1, n2-n1);
    Ed.Text:= S;
    Ed.SelStart:= n1;
    Key:= #0;
  end;
end;


{ TSynMruList }

constructor TSynMruList.Create;
begin
  inherited;
  Items:= TTntStringList.Create;
  MaxCount:= 10;
end;

destructor TSynMruList.Destroy;
begin
  FreeAndNil(Items);
  inherited;
end;

procedure TSynMruList.AddItem(const S: Widestring);
begin
  if S<>'' then
  begin
    DeleteItem(S);
    Items.Insert(0, S);
    while Items.Count>MaxCount do
      Items.Delete(Items.Count-1);
  end;
end;

procedure TSynMruList.DeleteItem(const S: Widestring);
var
  N: Integer;
begin
  N:= Items.IndexOf(S);
  if N>=0 then
    Items.Delete(N);
end;

procedure FixDraw(Ctl: TWinControl; SizeX: boolean = true);
begin
  with Ctl do
    if SizeX then
      begin Width:= Width+2; Width:= Width-2; end
    else
      begin Height:= Height+2; Height:= Height-2; end;
end;


procedure LoadMruList(List: TSynMruList; Ini: TCustomIniFile; const Section: string;
  MaxCount: Integer; CheckExist: boolean);
var
  i, NCount: Integer;
  S: Widestring;
begin
  List.MaxCount:= MaxCount;
  NCount:= Ini.ReadInteger(Section, 'Num', 0);
  if NCount>MaxCount then
    NCount:= MaxCount;

  for i:= Pred(NCount) downto 0 do
  begin
    S:= UTF8Decode(Ini.ReadString(Section, IntToStr(i), ''));
    if S='' then Continue;
    if CheckExist then
      if IsFilenameFixed(S) and not IsFileExist(S) then
        Continue;
    List.AddItem(S);
  end;
end;

procedure SaveMruList(List: TSynMruList; Ini: TCustomIniFile; const Section: string);
var
  i: Integer;
begin
  Ini.WriteInteger(Section, 'Num', List.Items.Count);
  for i:= 0 to List.Items.Count-1 do
    Ini.WriteString(Section, IntToStr(i), UTF8Encode(List.Items[i]));
end;


//returns string from file, which contains Str
function FFindStringInFile(const fn: Widestring; const Str: Widestring; IgnoreCase: boolean): boolean;
const
  cMaxSize = 2 * 1024 * 1024; //max file size
var
  Ed: TSyntaxMemo;
  NPos: Integer;
  AllText: Widestring;
  //P: TPoint;
begin
  Result:= false;

  if not IsFileExist(fn) then Exit;
  if not IsFileText(fn) then Exit;
  if FGetFileSize(fn)>cMaxSize then Exit;

  Ed:= TSyntaxMemo.Create(nil);
  try
    Ed.Lines.Clear;
    Ed.Lines.LoadFromFile(fn);
    AllText:= Ed.Lines.FText;

    if IgnoreCase then
      NPos:= Pos(WideUpperCase(Str), WideUpperCase(AllText))
    else
      NPos:= Pos(Str, AllText);
      
    if NPos>0 then
    begin
      Result:= true;
      {
      P:= Ed.StrPosToCaretPos(NPos);
      if P.Y>=0 then
        S:= Ed.Lines[P.Y];
      }
    end;
    Ed.Lines.Clear;
  finally
    FreeAndNil(Ed);
  end;
end;

procedure FWriteStringToFile(const fn: string; const S: WideString; UseUTF8: boolean);
const
  cSign: array[0..2] of byte = ($EF, $BB, $BF);
var
  SData: AnsiString;
begin
  if S<>'' then
  begin
    if UseUTF8 then
      SData:= UTF8Encode(S)
    else
      SData:= S;

    with TFileStream.Create(fn, fmCreate) do
    try
      if UseUTF8 then
        WriteBuffer(cSign, Sizeof(cSign));
      WriteBuffer(SData[1], Length(SData)*SizeOf(AnsiChar));
    finally
      Free
    end;
  end;
end;


function SDecodeUsingFileTable(const SData, fn: Widestring; ToBack: boolean): Widestring;
var
  L: TTntStringList;
  S1, S2: Widestring;
  Decode: array of TStringDecodeRecW;
  i: Integer;
begin
  Result:= SData;
  if not IsFileExist(fn) then Exit;

  L:= TTntStringList.Create;
  try
    L.LoadFromFile(fn);
    //delete empty/commented lines
    for i:= L.Count-1 downto 0 do
      if (L[i]='') or (L[i][1]=';') then
        L.Delete(i);
    if L.Count=0 then Exit;
    
    SetLength(Decode, L.Count);
    for i:= 0 to L.Count-1 do
    begin
      S1:= WideTrim(L[i]);
      S2:= S1;
      SDeleteFromW(S1, ' ');
      SDeleteToW(S2, ' ');
      if not ToBack then
      begin
        Decode[i].SFrom:= S1;
        Decode[i].STo:= S2;
      end
      else
      begin
        Decode[i].SFrom:= S2;
        Decode[i].STo:= S1;
      end;
    end;

    Result:= SDecodeW(SData, Decode);
  finally
    FreeAndNil(L)
  end;
end;

function FontHeightToItemHeight(Font: TFont): Integer;
begin
  //don't remember where i got this formula,
  //maybe just calculated const
  Result:= Trunc(Abs(Font.Height) * 1.36);
end;

var
  _Time: DWORD;

procedure _1;
begin
  _Time:= GetTickCount;
end;

procedure _2;
begin
  _Time:= GetTickCount - _Time;
  Application.MessageBox(PChar('Time: '+IntToStr(_Time)+'ms'), 'Time', mb_ok);
end;


function EditorStringBeforeCaret(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
var
  N, NEnd: Integer;
begin
  Result:= '';
  if Ed.TextLength=0 then Exit;
  if Ed.CaretStrPos=0 then Exit;

  //get last cMaxLen chars before caret
  NEnd:= Ed.CaretStrPos+1;
  N:= NEnd - MaxLen;
  if N<1 then N:= 1;
  Result:= Copy(Ed.Text, N, NEnd-N);
end;

procedure EditorGetHtmlTag(Ed: TSyntaxMemo; var STag, SAttr: string);
//can't be placed into unProcEditor.pas, uses SFindRegex
const
  cMaxLen = 500;
const
  //regex to catch tag name at line start
  cRegexTag = '^\w+\b';
  //character class for all chars inside quotes
  cRegexChars = '[\s\w,\.:;\-\+\*\?=\(\)\[\]\{\}/\\\|~`\^\$&%\#@!]';
  //regex to catch attrib name, followed by "=" and not-closed quote, only at line end
  cRegexAttr = '\b\w+(?=\s*\=\s*([''"]' + cRegexChars + '*)?\Z)';

  //simpler, but gives exception in TecRegExpr when caret is at line and in test-app
  //cRegexAttr = '\b\w+(?=\s*\=\s*(("[^"]*)?)$)';
var
  S: Widestring;
  N: Integer;
begin
  STag:= '';
  SAttr:= '';
  S:= EditorStringBeforeCaret(Ed, cMaxLen);
  if S='' then Exit;

  //cut string before last "<" or ">" char
  N:= Length(S);
  while (N>0) and (S[N]<>'<') and (S[N]<>'>') do Dec(N);
  if N=0 then Exit;
  Delete(S, 1, N);

  STag:= SFindRegex(S, cRegexTag);
  if STag<>'' then
    SAttr:= SFindRegex(S, cRegexAttr);
end;


procedure EditorGetCssTag(Ed: TSyntaxMemo; var STag: string);
//can't be placed into unProcEditor.pas, uses SFindRegex
const
  cMaxLen = 300;
const
  //char class for all chars in css values
  cRegexChars = '[''"\w\s\.,:/~&%@!=\#\$\^\-\+\(\)\?]';
  //regex to catch css property name, before css attribs and before ":", at line end
  cRegexProp = '\b[\w\-]+(?=:\s*' + cRegexChars + '*\Z)';
var
  S: Widestring;
begin
  STag:= '';
  S:= EditorStringBeforeCaret(Ed, cMaxLen);
  if S<>'' then
    STag:= SFindRegex(S, cRegexProp);
end;


procedure SParseString_AcpHtml(const AcpStr, Atr: string; List: TStringList);
{ example:
  AcpStr = 'caption=align<bottom?left?right?top|class|dir<ltr?rtl|id|lang';
  Atr = 'align' -> get list of attr values,
  Atr = '' -> get list of all attrs
}
var
  S, S1, S2: Widestring;
begin
  if List=nil then
    raise Exception.Create('Parse list nil');
  List.Clear;

  S:= AcpStr;
  SDeleteToW(S, '=');

  if Atr='' then
    //list all attribs
    repeat
      S1:= SGetItem(S, '|');
      if S1='' then Break;
      SDeleteFromW(S1, '<');
      List.Add(S1);
    until false
  else
    //list all values of attrib Atr
    repeat
      S1:= SGetItem(S, '|');
      if S1='' then Break;
      S2:= S1;
      SDeleteFromW(S2, '<');
      if S2=Atr then
      begin
        if Pos('<', S1)=0 then Exit;
        SDeleteToW(S1, '<');
        repeat
          S2:= SGetItem(S1, '?');
          if S2='' then Break;
          List.Add(S2);
        until false;
        Exit;
      end;
    until false;
end;


procedure SParseString_AcpControlLine(const s: string;
  var AcpChars: string;
  var IsBracketSep: boolean);
var
  n: Integer;
begin
  if SBegin(s, '#chars') then
  begin
    AcpChars:= '';
    IsBracketSep:= true;
    n:= Pos(' ', s);
    if n>0 then
    begin
      AcpChars:= Copy(s, n+1, MaxInt);
      IsBracketSep:= Pos('(', AcpChars)=0;
    end;
  end;
end;

//parse string from usual .ACP file
procedure SParseString_AcpStd(
  const S: string;
  IsBracketSep: boolean;
  var SType, SId, SPar, SHint: string);
const
  cMaxHintLen = 300;
var
  a, b, c: Integer;
begin
  SType:= '';
  SId:= '';
  SPar:= '';
  SHint:= '';
  if Trim(s)='' then Exit;

  a:= PosEx(' ', s, 1);
  b:= PosEx(' ', s, a+1);
  if b=0 then
    b:= Length(s)+1;

  if IsBracketSep then
  begin
    c:= PosEx('(', s, a+1);
    if (c<b) and (c<>0) then
      b:= c;
  end;

  c:= PosEx('|', s, b);
  if c=0 then
    c:= MaxInt div 2;

  SType:= Copy(s, 1, a-1);
  SId:= Copy(s, a+1, b-a-1);
  SPar:= Copy(s, b, c-b);
  SHint:= Copy(s, c+1, cMaxHintLen);

  SReplaceAll(SPar, ';', ','); //Pascal lexer has ";" param separator
  SReplaceAll(SPar, '[,', ',['); //for optional params
end;


end.
