unit unProc;

interface

uses
  ExtCtrls, Types, Forms, SysUtils,
  Classes, Graphics, Controls, StdCtrls,
  Messages,

  TntComCtrls,
  TntStdCtrls,
  TntClasses,
  TntCheckLst,

  ecSyntMemo,
  ecKeyMap,
  ecStrUtils,
  ecMemoStrings,
  ecSyntDlg,
  ecUnicode,
  ecEdits,

  IniFiles,
  PngImageList,
  SpTbxItem,
  ATxSProc;

procedure DoSortMenu(Menu: TSpTbxSubmenuItem);
procedure DoRemovePluginsIniLines(const fn_ini, dir: string; IsBinaryPlugin: boolean);
  
procedure DoIconSet_DetectSizes(const dir: string; var SizeX, SizeY: Integer);
function DoIconSet_LoadFromTar(L: TPngImageList; const fn_tar: string): boolean;
function DoIconSet_LoadFromDir(L: TPngImageList; const dir: string): boolean;

function DoSnippetEditorDialog(var AInfo: TSynSnippetInfo): boolean;
procedure DoKeymappingSplit(MapIn, MapOut1, MapOut2: TSyntKeyMapping; NCountInFirst: Integer);
procedure DoKeymappingJoin(MapIn1, MapIn2, MapOut: TSyntKeyMapping);
procedure DoKeymappingTruncate(Map: TSyntKeyMapping; NCount: Integer);

function STrimFolderName(const s: Widestring): Widestring;
function DoGetLocalizedEncodingName(const Id: Widestring): Widestring;
procedure DoUpdateIniFileForNewRelease(const SynIni: string);
function FontStylesToString(const f: TFontStyles): string;
function StringToFontStyles(const s: string): TFontStyles;
function FontToString(F: TFont): string;
procedure StringToFont(F: TFont; const Str: string);

function IsMouseOverControl(Control: TControl): boolean;
function IsElevationNeededForFolder(const Dir: Widestring): boolean;

function DoShowPopupMenu(List: TTntStringList; Pnt: TPoint; hWnd: THandle): Integer;
procedure MemoScrollToBottom(Memo: TTntMemo);
function SZenFindLeft(const s: ecString; iFrom: integer): integer;
function DoReadLangMsg(const fn_lng, fn_en_lng, msg_id: string): Widestring;
function DoPlayWaveSound(const fn: string): boolean;
function ShiftStateToString(const Shift: TShiftState): string;

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

function EditorAutoCloseTag(Ed: TSyntaxMemo; var Err: string): boolean;
function EditorStringBeforeCaret(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
procedure EditorGetHtmlTag(Ed: TSyntaxMemo; var STag, SAttr: string);
procedure EditorGetCssTag(Ed: TSyntaxMemo; var STag: string);

function FGetTempFilenameIndexed(Index: Integer): Widestring;
function FGetTempFilenameDeleted(NMaxCount: Integer = 20): Widestring;

procedure DoCenterForm(h: THandle; fm: TCustomForm);
function FontHeightToItemHeight(Font: TFont): Integer;
function SDecodeUsingFileTable(const SData, fn: Widestring; ToBack: boolean): Widestring;
function GetControlEditHandle(Target: TObject): THandle;
procedure DoHandleCtrlBkSp(Ed: TTntCombobox; var Key: Char);

procedure _Time1;
procedure _Time2;

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

function LoadPngIconEx(ImageList: TPngImageList; const fn: string): boolean;

function DoInputCharCode(
  var Str: Widestring; var Num: LongWord; const fnIni: string): boolean;
function DoInputFilename(
  const SCaption: Widestring;
  var SValue: Widestring): boolean;
function DoInputString(
  const SCaption: Widestring;
  var SValue: Widestring;
  const IniFN: string = ''; const IniSection: string = ''): boolean;
function DoInputCheckList(const ACaption, AColumns, AItems: Widestring;
  ASizeX, ASizeY: Integer): string;

procedure DoDeleteComboLastWord(ed: TTntCombobox);
procedure DoDeleteComboItem(ed: TTntCombobox);
function ScaleFontSize(Size: Integer; Form: TForm): Integer;

procedure FixDraw(Ctl: TWinControl; SizeX: boolean = true);
procedure FixFPU;
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
  IndexFN, IndexLine, IndexCol: integer; ZeroBase: boolean;
  var ResultFN: Widestring;
  var ResultLine, ResultCol: integer);

procedure FWriteStringToFile(const fn: string; const S: WideString; UseUTF8: boolean);
function FFindStringInFile(const fn: Widestring;
  const Str: Widestring;
  IgnoreCase: boolean): boolean;

procedure FixTcIni(var fnTC: string; const section: string);

type
  TSynIntArray4 = array[0..4] of Integer;

function SFindRegex(
  const Str, StrRegex: Widestring): Widestring;
function SFindRegexEx(
  const Str, StrRegex: Widestring;
  const PosFrom: Integer;
  var ResStart, ResLen: TSynIntArray4
  ): boolean;
function IsStringRegex(const S, Regex: Widestring): boolean;

function CompareListDate(List: TTntStringList; Index1, Index2: Integer): Integer;
function CompareListDateDesc(List: TTntStringList; Index1, Index2: Integer): Integer;

function IsCtrlPressed: boolean;
function IsCtrlAltPressed: boolean;

procedure DoAddColorToImageList(ImageList: TImageList;
  NColor: Integer; NColorText: Integer = -1);

procedure DoReportKeysHtml(SyntKeymapping: TSyntKeyMapping;
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
procedure ComboAltUpdate(ed: TTntCombobox; memo: TSyntaxCombobox);
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

function FFreeFN(const Name, ext, Dir: Widestring): Widestring;
function SFilterNum(const s: string): integer;
function SFilterIdxToExt(const Filter: string; Index: integer): string;
function SFilterNameToIdx(const AFilter, ALexerName: string): integer;

procedure MsgInfo(const S: WideString; H: THandle);
procedure MsgWarn(const S: WideString; H: THandle);
procedure MsgError(const S: WideString; H: THandle);
function MsgConfirm(const S: Widestring; H: THandle; IsQuestion: boolean = false): boolean;
function MsgConfirmYesNoCancel(const S: Widestring; H: THandle; CanCancel: boolean): Integer;
procedure MsgExcept(const S: Widestring; E: Exception; H: THandle);
procedure MsgRenameError(const fnPrev, fnNew: Widestring; H: THandle);
function MsgInput(const dkmsg: string; var S: Widestring): boolean;

type
  TSynTaskDialogResult = (taskResYes, taskResNo, taskResYesAll, taskResNoAll);

function MsgConfirmOkCancelForAll(const Caption, Text, CheckText: Widestring;
  CheckShow: boolean; ParentWnd: THandle): TSynTaskDialogResult;

procedure SetFormStyle(Form: TForm; Value: Boolean);
procedure SetFormOnTop(H: THandle; V: boolean);

type
  TSynToolSave = (svNone, svCurrent, svAll);

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
  TSynToolOutputEnc = (encAnsi, encOem, encUtf8{, encUni, encUniBE});

procedure FixListboxHorzScrollbar(L: TTntListBox);
procedure FixCheckListboxHorzScrollbar(L: TTntCheckListBox);
procedure FixListOutput(L: TWideStringList; NoTags, NoDups: boolean;
  Enc: TSynToolOutputEnc; const TabStr: Widestring);

type
  TSynTool = record
    ToolCaption,
    ToolCommand,
    ToolDir,
    ToolParams,
    ToolLexer,
    ToolKeys: WideString;
    ToolOutCapture: boolean;
    ToolOutType: string;
    ToolOutEncoding: TSynToolOutputEnc;
    ToolOutRegex: string;
    ToolOutNum_fn,
    ToolOutNum_line,
    ToolOutNum_col: integer;
    ToolSaveMode: TSynToolSave;
    ToolNoTags: boolean;
    ToolContextItem: boolean;
  end;
type
  TSynToolList = array[1..16] of TSynTool;

procedure DoTool_CopyItem(var FIn, FOut: TSynTool);
procedure DoTool_CopyList(var FIn, FOut: TSynToolList);
procedure DoTool_ClearItem(var Item: TSynTool);
procedure DoTool_LoadList(var AToolList: TSynToolList; const AIniFN, ASection: string);
procedure DoTool_SaveList(var AToolList: TSynToolList; const AIniFN, ASection: string);
function DoTool_ConfigList(var AToolList: TSynToolList;
  AParentForm: TForm;
  ALexersList: TTntStringList;
  AKeyEnabled: boolean;
  const ACurrentLexer: string;
  const ADirPresets: string): boolean;

var
  opFindOffsetTop: integer = 6;

implementation

uses
  Windows,
  ecZRegExpr,
  Math, Dialogs, CommCtrl, StrUtils,
  TntClipbrd, TntSysUtils,
  DKLang,
  PngImage,
  cUtils, //Fundamentals
  ATxFProc,
  unSRTree,
  unInputSimple,
  unInputFilename,
  unInputCheckList,
  unTool,
  unSnipEd,
  SynTaskDialog, //Synopse http://blog.synopse.info/post/2011/03/05/Open-Source-SynTaskDialog-unit-for-XP,Vista,Seven
  ComCtrls,
  LibTar;

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

procedure MsgRenameError(const fnPrev, fnNew: Widestring; H: THandle);
const
  cArrow = '-->';
begin
  MsgError(DKLangConstW('zMRenameErr')+#13+fnPrev+#13+cArrow+#13+fnNew, H);
end;

function MsgInput(const dkmsg: string; var S: Widestring): boolean;
begin
  Result:= DoInputString(DKLangConstW(dkmsg), S);
end;

function MsgConfirm(const S: Widestring; H: THandle; IsQuestion: boolean = false): boolean;
var
  Flags: Integer;
begin
  Flags:= mb_okcancel or mb_taskmodal or IfThen(IsQuestion, mb_iconquestion, mb_iconwarning);
  Result:= MessageBoxW(H, PWChar(S), 'SynWrite', Flags) = id_ok;
end;

function MsgConfirmYesNoCancel(const S: Widestring; H: THandle; CanCancel: boolean): Integer;
var
  Flags: Integer;
begin
  Flags:= IfThen(CanCancel, mb_yesnocancel, mb_yesno) or mb_iconwarning;
  Result:= MessageBoxW(H, PWChar(S), 'SynWrite', Flags);
end;  


procedure MsgExcept(const S: Widestring; E: Exception; H: THandle);
begin
  MsgError(S + #13#13 + E.ClassName + #13 + E.Message, H);
end;

function IsStringRegex(const S, Regex: Widestring): boolean;
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

function SFindRegex(const Str, StrRegex: Widestring): Widestring;
var
  R: TecRegExpr;
  n, nRes: integer;
begin
  Result:= '';
  R:= TecRegExpr.Create;
  try
    R.Expression:= StrRegex;
    R.ModifierX:= false; //to handle ' ' in RE
    for n:= 1 to Length(Str) do
    begin
      nRes:= n;
      if R.Match(Str, nRes) then
      begin
        Result:= Copy(Str, n, R.MatchLen[0]);
        Exit
      end;
    end;
  finally
    R.Free;
  end;
end;

function SFindRegexEx(
  const Str, StrRegex: Widestring;
  const PosFrom: Integer;
  var ResStart, ResLen: TSynIntArray4
  ): boolean;
var
  R: TecRegExpr;
  n, nRes, i: integer;
begin
  Result:= false;
  FillChar(ResStart, SizeOf(ResStart), 0);
  FillChar(ResLen, SizeOf(ResLen), 0);

  R:= TecRegExpr.Create;
  try
    R.Expression:= StrRegex;
    R.ModifierX:= false; //to handle ' ' in RE
    for n:= PosFrom to Length(Str) do
    begin
      nRes:= n;
      if R.Match(Str, nRes) then
      begin
        Result:= true;
        for i:= 0 to High(ResLen) do
        begin
          ResStart[i]:= R.MatchPos[i];
          ResLen[i]:= R.MatchLen[i];
        end;
        Exit
      end;
    end;
  finally
    R.Free;
  end;
end;


procedure SParseOut(const SStr, SRegex: Widestring;
  IndexFN, IndexLine, IndexCol: integer; ZeroBase: boolean;
  var ResultFN: Widestring;
  var ResultLine, ResultCol: integer);
var
  StrArray: TSynStrArray;
begin
  ResultLine:= 0;
  ResultCol:= 0;
  SParseRegexArray(SStr, SRegex, StrArray);

  if IndexFN>0 then
  begin
    ResultFN:= StrArray[Pred(IndexFN)];
    SReplaceAllW(ResultFN, '/', '\'); //needed for TypeScript compiler
  end;
  if IndexLine>0 then
    ResultLine:= StrToIntDef(StrArray[Pred(IndexLine)], -1);
  if IndexCol>0 then
    ResultCol:= StrToIntDef(StrArray[Pred(IndexCol)], -1);

  if ZeroBase then
  begin
    //results must be 1-based
    if ResultLine>=0 then Inc(ResultLine);
    if ResultCol>=0 then Inc(ResultCol);
  end;
end;

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

(*
procedure _Log(const s: string);
var
  fn: string;
  f: System.Text;
begin
  fn:= 'c:\SynWr.log';
  AssignFile(f, fn);
  {$I-}
  System.Append(f);
  if IOREsult<>0 then Rewrite(f);
  {$I+}
  Writeln(f, s);
  CloseFile(f);
end;
*)

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

procedure ComboAltUpdate(ed: TTntCombobox; memo: TSyntaxCombobox);
var
  i: Integer;
begin
  memo.DropDownList.Items.Clear;
  for i:= 0 to ed.Items.Count-1 do
    memo.DropDownList.Items.Add(ed.Items[i]);

  memo.DropDownList.DisplayItems:= memo.DropDownList.Items;
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
    if cbBack.Checked then Flags:= Flags+[ftBackward];
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
    cbBack.Checked:= ftBackward in Flags;
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
  {
  if IsSpec then
    ed.SelText:= SEscapeSpec(S)
  else
  if IsRegex then
    ed.SelText:= SEscapeRegex(S)
  else
    ed.SelText:= S;
    }
  if IsRegex or IsSpec then
    ed.SelText:= SEscapeEols(S)
  else
    ed.SelText:= S;
end;

procedure DoCopyToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean; const Str: Widestring);
begin
  {
  if IsSpec then
    ed.Text:= SEscapeSpec(Str)
  else
  if IsRegex then
    ed.Text:= SEscapeRegex(Str)
  else
    }
  if IsRegex or IsSpec then
    ed.Text:= SEscapeEols(Str)
  else
    ed.Text:= Str;
end;

function _KeymapStyle: string;
var
  Res: TResourceStream;
  List: TStringList;
begin
  Res:= TResourceStream.Create(hInstance, 'KeymapHtml', RT_RCDATA);
  List:= TStringList.Create;
  try
    List.LoadFromStream(Res);
    Result:= List.Text;
  finally
    FreeAndNil(List);
    FreeAndNil(Res);
  end;
end;

procedure DoReportKeysHtml(SyntKeymapping: TSyntKeyMapping;
  const fn: string);
var
  i, j, k: integer;
  f: TextFile;
  old, sname, s: Widestring;
  LCat: TTntStringList;
  LKeys: TTntStringList;
  LKeysText: TTntStringList;
begin
  AssignFile(f, fn);
  Rewrite(f);
  Writeln(f, '<html><head> <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> <title>SynWrite keyboard mapping</title><head><body>');
  Writeln(f, _KeymapStyle);

  LCat:= TTntStringList.Create;
  LKeys:= TTntStringList.Create;
  LKeysText:= TTntStringList.Create;
  old:='';

  try
    for i:= 0 to SyntKeyMapping.Items.Count-1 do
      if SyntKeyMapping.Items[i].Customizable then
        if LCat.IndexOf(SyntKeyMapping.Items[i].Category)<0 then
          LCat.Add(SyntKeyMapping.Items[i].Category);

    //list categories
    Writeln(f, '<table><tr>');
    for i:= 1 to 3 do
    begin
      Writeln(f, '<td width="30%">');
      for j:= 1 to Ceil(LCat.Count/3) do //categories
      begin
        k:= (i-1)*Ceil(LCat.Count/3) + j-1;
        if k<= LCat.Count-1 then
          Writeln(f, '<li><a href="#c'+IntToStr(k)+'">'+UTF8Encode(LCat[k])+'</a><br>');
      end;
      Writeln(f, '</td>');
    end;
    Writeln(f, '</tr></table>');

    //list keys
    Writeln(f, '<p><table class="sample">');
    for k:= 0 to LCat.Count-1 do //categories
     for i:= 0 to SyntKeyMapping.Items.Count-1 do //items
      if SyntKeyMapping.Items[i].Category = LCat[k] then
      begin
        if not SyntKeyMapping.Items[i].Customizable then Continue;
        if SyntKeyMapping.Items[i].Command <= 0 then Continue;

        if old<>SyntKeyMapping.Items[i].Category then
        begin
          old:= SyntKeyMapping.Items[i].Category;
          Writeln(f, '<tr><td colspan=2 align="center"><font color="DarkBlue"><b>');
          Writeln(f, '<a name="c'+IntToStr(k)+'">'+ UTF8Encode(old));
          Writeln(f, '</b></font></td></tr>');
        end;

        sname:= SyntKeyMapping.Items[i].DisplayName;
        SReplaceAllW(sname, '<', '&lt;');
        SReplaceAllW(sname, '>', '&gt;');

        Writeln(f, '<tr><td>');
        Write(f, '&nbsp;'+ UTF8Encode(sname));
        Writeln(f, '</td><td><font color="DarkBlue">');

        if SyntKeyMapping.Items[i].KeyStrokes.Count>0 then
        begin
          S:= SyntKeyMapping.Items[i].KeyStrokes.Items[0].AsString;
          Write(f, '&nbsp;'+ UTF8Encode(S));
          if S<>'' then
            if LKeys.IndexOf(S)>=0 then
              LKeysText.Add(sname + ': ' + S)
            else
              LKeys.Add(S);
        end;
        if SyntKeyMapping.Items[i].KeyStrokes.Count>1 then
        begin
          S:= SyntKeyMapping.Items[i].KeyStrokes.Items[1].AsString;
          Write(f, '<br>&nbsp;'+ UTF8Encode(S));
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
        Writeln(f, '<li>'+ UTF8Encode(LKeysText[i]));
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

//-----------------------------------------------
function IsImageHint(const S: string): boolean;
const
  cImageHintList = 'jpg,jpeg,jpe,jfif,bmp,png,gif,ico';
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

function DoInputFilename(const SCaption: Widestring; var SValue: Widestring): boolean;
begin
  with TfmInputFilename.Create(nil) do
  try
    labRename.Caption:= SCaption;

    edName.Text:= WideChangeFileExt(SValue, '');
    edExt.Text:= Copy(WideExtractFileExt(SValue), 2, MaxInt);

    Result:= ShowModal=mrOk;
    if Result then
      SValue:= GetFN;
  finally
    Free
  end;
end;

function DoInputString(const SCaption: Widestring; var SValue: Widestring;
  const IniFN: string = ''; const IniSection: string = ''): boolean;
begin
  with TfmInputSimple.Create(nil) do
  try
    labRename.Caption:= SCaption;

    ComboLoadFromFile(edName, IniFN, IniSection);
    FEnablePrevValue:= true;
    edName.Text:= SValue;

    Result:= ShowModal=mrOk;
    if Result then
    begin
      SValue:= edName.Text;
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
begin
  Result:= FileExists(fn);
  if Result then
  begin
    ImageList.BeginUpdate;
    ImageList.PngImages.Add.PngImage.LoadFromFile(fn);
    ImageList.EndUpdate;
  end;
end;

function GetControlEditHandle(Target: TObject): THandle;
begin
  Result := 0;
  {
  if (Target is TCustomEdit) then
    Result := GetControl(Target).Handle
  else
  }
  if (Target is TComboBox) then
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
const
  cStart = ';;{';
  cEnd = '} ';
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
      if (L[i]='') or ((L[i][1]=';') and not SBegin(L[i], cStart)) then
        L.Delete(i);
    if L.Count=0 then Exit;

    SetLength(Decode, L.Count);
    for i:= 0 to L.Count-1 do
    begin
      S1:= L[i];
      S2:= S1;

      //is line started with ";;{" ?
      if SBegin(S1, cStart) then
      begin
        SDeleteToW(S1, cStart);
        SDeleteFromW(S1, cEnd);
        SDeleteToW(S2, cEnd);
      end
      else
      //no, usual space separated
      begin
        SDeleteFromW(S1, ' ');
        SDeleteToW(S2, ' ');
      end;

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

//debug stuff
var
  _Time: DWORD;

procedure _Time1;
begin
  _Time:= GetTickCount;
end;

procedure _Time2;
begin
  _Time:= GetTickCount - _Time;
  Application.MessageBox(PChar('Time: '+IntToStr(_Time)+' ms'), 'Time', mb_ok);
end;


function EditorStringBeforeCaret(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
//get last MaxLen chars before caret
var
  N, NEnd: Integer;
begin
  Result:= '';
  if Ed.TextLength=0 then Exit;
  if Ed.CaretStrPos=0 then Exit;

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

  SReplaceAllPercentChars(SId);
  SReplaceAllPercentChars(SPar);

  SReplaceAll(SPar, ';', ','); //Pascal lexer has ";" param separator
  SReplaceAll(SPar, '[,', ',['); //for optional params
end;


function FGetTempFilenameIndexed(Index: Integer): Widestring;
begin
  Result:= FTempDir + '\' + WideFormat('Synw$%d.txt', [Index]);
end;

function FGetTempFilenameDeleted(NMaxCount: Integer = 20): Widestring;
var
  i: Integer;
begin
  for i:= 0 to NMaxCount do
  begin
    Result:= FGetTempFilenameIndexed(i);
    FDelete(Result);
    if not IsFileExist(Result) then Break;
  end;
end;


function EditorAutoCloseTag(Ed: TSyntaxMemo; var Err: string): boolean;
  //
  function IsNoPairTag(const STagName: string): boolean;
  const
    cTagList = 'area,base,basefont,br,col,command,embed,frame,hr,img,input,keygen,link,meta,param,source,track,wbr';
  begin
    Result:= IsStringListed(LowerCase(STagName), cTagList);
  end;
  //
  function IsTagChar(ch: Widechar): boolean;
  begin
    //count ":" char as part of xml tag name
    Result:= IsWordChar(ch) or (ch=':');
  end;
  //
const
  cOpenTagRegex = '\<\w+[ \w''"=\.,;\#\-\+:/]*'; //opening tag w/o ending '>'
var
  S, STag: ecString;
  nCaret, iEnd, i: integer;
begin
  Result:= false;
  Err:= '';
  with Ed do
  begin
    nCaret:= CaretStrPos;
    if (nCaret >= 1) and (nCaret <= TextLength) and
      (Lines.Chars[nCaret] <> '/') then
    begin
      S:= Lines[CurrentLine];

      //get opening tag
      iEnd:= StrPosToCaretPos(nCaret).X;
      i:= iEnd;
      while (i>0) and (S[i]<>'<') do Dec(i);
      if i=0 then Exit;
      STag:= Copy(S, i, iEnd-i+1);
      if STag='' then Exit;

      if not IsStringRegex(STag, cOpenTagRegex) then
        begin Err:= 'Auto-closing failed for tag: '+STag; Exit end;

      //get closing tag
      i:= 2;
      while (i<Length(STag)) and IsTagChar(STag[i+1]) do Inc(i);
      STag:= Copy(STag, 2, i-1);
      if IsNoPairTag(STag) then Exit;
      STag:= '></'+STag+'>';

      //insert closing tag after caret
      //then position on 2nd STag character
      InsertText(STag);
      CaretStrPos:= CaretStrPos-Length(STag)+1;
      Result:= true;
    end;
  end;
end;


{
<tag>
</tag>
<tag ... >
<tag ... />
<tag vv="100">
<tag vv='100'>
<tag vv=100>
}
function IsTagEnd(i: Integer; const s: Widestring): boolean;
begin
  Result:= false;
  if (i<=1) or (s[i]<>'>') then Exit;

  if Pos(s[i-1], ' "''/')>0 then
    begin Result:= true; Exit end;

  if IsWordChar(s[i-1]) then
  begin
    while (i>1) and IsWordChar(s[i-1]) do Dec(i);
    if (i>1) and (Pos(s[i-1], '<=/')>0) then
      Result:= true;
  end;
end;

function SZenFindLeft(const s: ecString; iFrom: integer): integer;
const
  brEnd = ']}';
  brBegin = '[{';
var
  i, Br: Integer;
begin
  i:= iFrom;
  Br:= 0;
  if i>1 then
  repeat
    Dec(i);
    if i=1 then Break;
    if Pos(s[i], brEnd)>0 then Inc(Br);
    if Pos(s[i], brBegin)>0 then Dec(Br);
    if IsSpaceChar(s[i-1]) and (Br<=0) then Break;
    if IsTagEnd(i-1, s) then Break;
  until false;
  Result:= i;
end;


procedure DoCenterForm(h: THandle; fm: TCustomForm);
var r: TRect;
begin
  GetWindowRect(h, r);
  SetWindowPos(h, 0,
    fm.Monitor.Left + (fm.Monitor.Width - (r.Right - r.Left)) div 2,
    fm.Monitor.Top + (fm.Monitor.Height - (r.Bottom - r.Top)) div 2,
    0, 0, SWP_NOSIZE);
end;

procedure MemoScrollToBottom(Memo: TTntMemo);
begin
  with Memo do
    Perform(EM_LINESCROLL, 0, Lines.Count);
end;


function DoReadLangMsg(const fn_lng, fn_en_lng, msg_id: string): Widestring;
const
  cSection = 'L';
begin
  if fn_lng<>fn_en_lng then
    with TIniFile.Create(fn_lng) do
    try
      Result:= UTF8Decode(ReadString(cSection, msg_id, ''));
    finally
      Free
    end;

  if Result='' then
    with TIniFile.Create(fn_en_lng) do
    try
      Result:= UTF8Decode(ReadString(cSection, msg_id, ''));
    finally
      Free
    end;
end;


function DoShowPopupMenu(List: TTntStringList; Pnt: TPoint; hWnd: THandle): Integer;
var
  hMenu: THandle;
  n, nFlag: integer;
  Str: Widestring;
begin
  hMenu:= CreatePopupMenu;
  for n:= 0 to List.Count-1 do
  begin
    Str:= List[n];
    if Str='-' then
      nFlag:= MF_SEPARATOR
    else
    if SBegin(Str, '!') then
      begin nFlag:= MF_CHECKED; Delete(Str, 1, 1); end
    else
    if SBegin(Str, '?') then
      begin nFlag:= MF_CHECKED or MFT_RADIOCHECK; Delete(Str, 1, 1); end
    else
    if SBegin(Str, '*') then
      begin nFlag:= MF_DISABLED or MF_GRAYED; Delete(Str, 1, 1); end
    else
      nFlag:= 0;
    AppendMenuW(hMenu, MF_STRING or nFlag, 100+n, PWChar(Str));
  end;

  n:= Integer(TrackPopupMenu(hMenu, {TPM_LEFTALIGN}TPM_CENTERALIGN or TPM_VCENTERALIGN or TPM_LEFTBUTTON or TPM_RETURNCMD,
    Pnt.X, Pnt.Y, 0, hWnd, nil));
  SendMessage(hWnd, WM_NULL, 0, 0);

  if n>0 then
    Result:= n-100
  else
    Result:= -1;

  for n:= List.Count-1 downto 0 do
    DeleteMenu(hMenu, n, MF_BYCOMMAND);
  DestroyMenu(hMenu);
end;

function IsElevationNeededForFolder(const Dir: Widestring): boolean;
begin
  Result:= (Win32MajorVersion >= 6) and (
    SBegin(Dir, SExpandVars('%ProgramFiles%')) or
    SBegin(Dir, SExpandVars('%ProgramFiles(x86)%'))
    );
end;

function IsMouseOverControl(Control: TControl): boolean;
var
  P: TPoint;
begin
  P:= Control.ScreenToClient(Mouse.CursorPos);
  Result:= PtInRect(Control.ClientRect, P);
end;

type
  TPlaySoundFunc = function(Name: PAnsiChar; Flags: UINT): BOOL; stdcall;

var
  _DllMedia: THandle = 0;
  _FuncPlay: TPlaySoundFunc = nil;

function DoPlayWaveSound(const fn: string): boolean;
const
  SND_SYNC            = $0000;  { play synchronously (default) }
  SND_ASYNC           = $0001;  { play asynchronously }
  SND_NODEFAULT       = $0002;  { don't use default sound }
  SND_MEMORY          = $0004;  { lpszSoundName points to a memory file }
  SND_LOOP            = $0008;  { loop the sound until next sndPlaySound }
  SND_NOSTOP          = $0010;  { don't stop any currently playing sound }
begin
  Result:= false;
  if _DllMedia=0 then
  begin
    _DllMedia:= LoadLibrary('winmm.dll');
    if _DllMedia<>0 then
      @_FuncPlay:= GetProcAddress(_DllMedia, 'sndPlaySoundA');
  end;

  if @_FuncPlay<>nil then
  begin
    if fn='' then
      Result:= _FuncPlay(nil, 0)
    else
      Result:= _FuncPlay(PChar(fn), SND_ASYNC);
  end;
end;


procedure DoTool_LoadList(var AToolList: TSynToolList; const AIniFN, ASection: string);
var
  i: integer;
  s: Widestring;
begin
  with TIniFile.Create(AIniFN) do
  try
    for i:= Low(AToolList) to High(AToolList) do
    with AToolList[i] do
    begin
      ToolCaption:= UTF8Decode(ReadString(ASection, 'C'+IntToStr(i), ''));
      ToolCommand:= UTF8Decode(ReadString(ASection, 'Ex'+IntToStr(i), ''));
      ToolDir:= UTF8Decode(ReadString(ASection, 'Dir'+IntToStr(i), ''));
      ToolParams:= UTF8Decode(ReadString(ASection, 'Par'+IntToStr(i), ''));
      ToolLexer:= ReadString(ASection, 'Lex'+IntToStr(i), '');
      ToolKeys:= ReadString(ASection, 'Key'+IntToStr(i), '');
      ToolOutRegex:= ReadString(ASection, 'Re'+IntToStr(i), '');

      S:= ReadString(ASection, 'S'+IntToStr(i), '');
      ToolOutCapture:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolOutNum_fn:= StrToIntDef(SGetItem(S), 0);
      ToolOutNum_line:= StrToIntDef(SGetItem(S), 0);
      ToolOutNum_col:= StrToIntDef(SGetItem(S), 0);
      ToolSaveMode:= TSynToolSave(StrToIntDef(SGetItem(S), 0));
      ToolNoTags:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolContextItem:= Boolean(StrToIntDef(SGetItem(S), 0));
      ToolOutType:= SGetItem(S);
      if ToolOutType='' then
        ToolOutType:= cOutputTypeString[outToPanel];
      ToolOutEncoding:= TSynToolOutputEnc(StrToIntDef(SGetItem(S), Ord(encOem)));
    end;
  finally
    Free;
  end;
end;

procedure DoTool_SaveList(var AToolList: TSynToolList; const AIniFN, ASection: string);
var
  i: Integer;
begin
  with TIniFile.Create(AIniFN) do
  try
    for i:= Low(AToolList) to High(AToolList) do
    with AToolList[i] do
    begin
      WriteString(ASection, 'C'+IntToStr(i), '"'+UTF8Encode(ToolCaption)+'"');
      WriteString(ASection, 'Ex'+IntToStr(i), '"'+UTF8Encode(ToolCommand)+'"');
      WriteString(ASection, 'Dir'+IntToStr(i), '"'+UTF8Encode(ToolDir)+'"');
      WriteString(ASection, 'Par'+IntToStr(i), '"'+UTF8Encode(ToolParams)+'"');
      WriteString(ASection, 'Lex'+IntToStr(i), ToolLexer);
      WriteString(ASection, 'Key'+IntToStr(i), ToolKeys);
      WriteString(ASection, 'Re'+IntToStr(i), '"'+ToolOutRegex+'"');
      WriteString(ASection, 'S'+IntToStr(i), Format('%d,%d,%d,%d,%d,%d,%d,%s,%d',
        [Ord(ToolOutCapture),
        ToolOutNum_fn,
        ToolOutNum_line,
        ToolOutNum_col,
        Ord(ToolSaveMode),
        Ord(ToolNoTags),
        Ord(ToolContextItem),
        ToolOutType,
        Ord(ToolOutEncoding)]));
    end;
  finally
    Free;
  end;
end;


function DoTool_ConfigList(
  var AToolList: TSynToolList;
  AParentForm: TForm;
  ALexersList: TTntStringList;
  AKeyEnabled: boolean;
  const ACurrentLexer: string;
  const ADirPresets: string): boolean;
begin
  with TfmTools.Create(AParentForm) do
  try
    labKey.Enabled:= AKeyEnabled;
    edKey.Enabled:= AKeyEnabled;
    bKey.Enabled:= AKeyEnabled;
    cbCtx.Enabled:= AKeyEnabled;

    DoTool_CopyList(AToolList, FToolList);

    edLexer.Items.Add(DKLangConstW('MAllLexers'));
    edLexer.Items.AddStrings(ALexersList);
    FCurrLexer:= ACurrentLexer;
    FDirPresets:= ADirPresets;

    Left:= AParentForm.Monitor.Left + (AParentForm.Monitor.Width - Width) div 2;
    Top:= AParentForm.Monitor.Top + (AParentForm.Monitor.Height - Height) div 2;

    Result:= ShowModal=mrOk;
    if Result then
      DoTool_CopyList(FToolList, AToolList);
  finally
    Release;
  end;
end;

function ShiftStateToString(const Shift: TShiftState): string;
begin
  Result:=
    IfThen(ssShift in Shift, 's')+
    IfThen(ssCtrl in Shift, 'c')+
    IfThen(ssAlt in Shift, 'a');
end;


function DoInputCharCode(var Str: Widestring; var Num: LongWord;
  const fnIni: string): boolean;
var
  Ok: boolean;
begin
  Result:= false;
  Str:= '';
  Num:= 0;

  repeat
    if not DoInputString(DKLangConstW('zMInputCharCode'), Str, fnIni, 'CharCode') then Exit;
    if SBegin(Str, '.') then
      Num:= DecStrToLongWord(Copy(Str, 2, MaxInt), Ok)
    else
      Num:= HexStrToLongWord(Str, Ok);
    if not Ok then MsgBeep(true);
  until Ok;

  Str:= WideChar(Num);
  Result:= true;
end;


function FontStylesToString(const f: TFontStyles): string;
begin
  Result:= '';
  if fsBold in f then Result:= Result+'b';
  if fsItalic in f then Result:= Result+'i';
  if fsUnderline in f then Result:= Result+'u';
  if fsStrikeout in f then Result:= Result+'s';
end;

function StringToFontStyles(const s: string): TFontStyles;
var
  i: Integer;
begin
  Result:= [];
  for i:= 1 to Length(s) do
    case s[i] of
      'b': Include(Result, fsBold);
      'i': Include(Result, fsItalic);
      'u': Include(Result, fsUnderline);
      's': Include(Result, fsStrikeout);
    end;
end;

function FontToString(F: TFont): string;
begin
  Result:= F.Name+','+IntToStr(F.Size)+','+FontStylesToString(F.Style);
end;

procedure StringToFont(F: TFont; const Str: string);
var
  S, S1: Widestring;
begin
  S:= Str;

  S1:= SGetItem(S);
  if S1<>'' then F.Name:= S1;

  S1:= SGetItem(S);
  F.Size:= StrToIntDef(S1, F.Size);

  S1:= SGetItem(S);
  F.Style:= StringToFontStyles(S1);
end;


function StringToEditorOptionsEx(const S: string): TSyntaxMemoOptionsEx;
begin
  Result:= [];
  if Pos('soSmartPaste', S)>0 then Include(Result, soSmartPaste);
  if Pos('soUseCaseFormat', S)>0 then Include(Result, soUseCaseFormat);
  if Pos('soAutoFormat', S)>0 then Include(Result, soAutoFormat);
  if Pos('soKeepSearchMarks', S)>0 then Include(Result, soKeepSearchMarks);
  if Pos('soExtractAnsiParts', S)>0 then Include(Result, soExtractAnsiParts);
  if Pos('soCorrectNonPrinted', S)>0 then Include(Result, soCorrectNonPrinted);
  if Pos('soVirtualCaretPos', S)>0 then Include(Result, soVirtualCaretPos);
  if Pos('soUnlimitedCaretPos', S)>0 then Include(Result, soUnlimitedCaretPos);
  if Pos('soNormalSelToLineEnd', S)>0 then Include(Result, soNormalSelToLineEnd);
  if Pos('soRightClickMoveCaret', S)>0 then Include(Result, soRightClickMoveCaret);
  if Pos('soDisableAutoClose', S)>0 then Include(Result, soDisableAutoClose);
  if Pos('soAllowZeroTab', S)>0 then Include(Result, soAllowZeroTab);
  if Pos('soNotSuppressAltNNNN', S)>0 then Include(Result, soNotSuppressAltNNNN);
  if Pos('eoShowCaretWhenUnfocused', S)>0 then Include(Result, eoShowCaretWhenUnfocused);
  if Pos('soKeepCaretPaste', S)>0 then Include(Result, soKeepCaretPaste);
end;

function StringToEditorOptions(const S: string): TSyntaxMemoOptions;
begin
  Result:= [];
  if Pos('soOverwriteBlocks', S)>0 then Include(Result, soOverwriteBlocks);
  if Pos('soPersistentBlocks', S)>0 then Include(Result, soPersistentBlocks);
  if Pos('soEnableBlockSel', S)>0 then Include(Result, soEnableBlockSel);
  if Pos('soDoubleClickLine', S)>0 then Include(Result, soDoubleClickLine);
  if Pos('soKeepCaretInText', S)>0 then Include(Result, soKeepCaretInText);
  if Pos('soCopyAsRTF', S)>0 then Include(Result, soCopyAsRTF);
  if Pos('soHideSelection', S)>0 then Include(Result, soHideSelection);
  if Pos('soHideDynamic', S)>0 then Include(Result, soHideDynamic);
  if Pos('soAutoIndentMode', S)>0 then Include(Result, soAutoIndentMode);
  if Pos('soBackUnindent', S)>0 then Include(Result, soBackUnindent);
  if Pos('soGroupUndo', S)>0 then Include(Result, soGroupUndo);
  if Pos('soGroupRedo', S)>0 then Include(Result, soGroupRedo);
  if Pos('soFixedLineHeight', S)>0 then Include(Result, soFixedLineHeight);
  if Pos('soDragText', S)>0 then Include(Result, soDragText);
  if Pos('soCallapseEmptyLines', S)>0 then Include(Result, soCallapseEmptyLines);
  if Pos('soAutoSelect', S)>0 then Include(Result, soAutoSelect);
  if Pos('soKeepTrailingBlanks', S)>0 then Include(Result, soKeepTrailingBlanks);
  if Pos('soFloatMarkers', S)>0 then Include(Result, soFloatMarkers);
  if Pos('soUndoAfterSave', S)>0 then Include(Result, soUndoAfterSave);
  if Pos('soDisableSelection', S)>0 then Include(Result, soDisableSelection);
  if Pos('soAlwaysShowCaret', S)>0 then Include(Result, soAlwaysShowCaret);
  if Pos('soDrawCurLineFocus', S)>0 then Include(Result, soDrawCurLineFocus);
  if Pos('soHideCursorOnType', S)>0 then Include(Result, soHideCursorOnType);
  if Pos('soScrollLastLine', S)>0 then Include(Result, soScrollLastLine);
  if Pos('soGreedySelect', S)>0 then Include(Result, soGreedySelect);
  if Pos('soKeepSelMode', S)>0 then Include(Result, soKeepSelMode);
  if Pos('soSmartCaret', S)>0 then Include(Result, soSmartCaret);
  if Pos('soBreakOnRightMargin', S)>0 then Include(Result, soBreakOnRightMargin);
  if Pos('soOptimalFill', S)>0 then Include(Result, soOptimalFill);
  if Pos('soFixedColumnMove', S)>0 then Include(Result, soFixedColumnMove);
  if Pos('soVariableHorzScrollBar', S)>0 then Include(Result, soVariableHorzScrollBar);
  if Pos('soUnindentKeepAlign', S)>0 then Include(Result, soUnindentKeepAlign);
end;

function DoReadIniString_LargeData(const fn, section, key: string): string;
var
  i: Integer;
  sSec: string;
begin
  with TIniFile.Create(fn) do
  try
    Result:= ReadString(section, key, '');
    if Result='LARGE_DATA' then
    begin
      Result:= '';
      sSec:= section+'__'+key;
      for i:= 0 to Pred(ReadInteger(sSec, 'COUNT', 0)) do
        Result:= Result + ReadString(sSec, 'DATA'+IntToStr(i), '');
    end;
  finally
    Free
  end;
end;


procedure DoUpdateIniFileForNewRelease(const SynIni: string);
const
  secTpl = 'Template';
var
  Op: TSyntaxMemoOptions;
  OpEx: TSyntaxMemoOptionsEx;
  S: string;
begin
  with TIniFile.Create(SynIni) do
  try
    //1) Options
    S:= DoReadIniString_LargeData(SynIni, secTpl, 'Options');
    if S='' then
    begin
      MsgInfo('Ini file doesn''t need an update. Command ignored.', 0);
      Exit
    end;

    Op:= StringToEditorOptions(S);
    WriteString('Setup', 'Flags', IntToHex(LongWord(Op), 8));

    //2) OptionsEx
    S:= DoReadIniString_LargeData(SynIni, secTpl, 'OptionsEx');
    OpEx:= StringToEditorOptionsEx(S);
    WriteString('Setup', 'FlagsEx', IntToHex(LongWord(OpEx), 8));

    //Erase old
    DeleteKey(secTpl, 'Options');
    DeleteKey(secTpl, 'OptionsEx');
    EraseSection('Template__Options');

    MsgInfo('Ini file updated, restart SynWrite now without saving options', 0);
  finally
    Free
  end;
end;

procedure DoKeymappingSplit(MapIn, MapOut1, MapOut2: TSyntKeyMapping; NCountInFirst: Integer);
var
  i: Integer;
  MapOut: TSyntKeyMapping;
begin
  MapOut1.Items.Clear;
  MapOut2.Items.Clear;

  MapOut1.UseFirstControlKeys:= MapIn.UseFirstControlKeys;
  MapOut2.UseFirstControlKeys:= MapIn.UseFirstControlKeys;

  for i:= 0 to MapIn.Items.Count-1 do
  begin
    if i<NCountInFirst then
      MapOut:= MapOut1
    else
      MapOut:= MapOut2;
    MapOut.Items.Add.Assign(MapIn.Items[i]);
  end;
end;

procedure DoKeymappingJoin(MapIn1, MapIn2, MapOut: TSyntKeyMapping);
var
  i: Integer;
begin
  MapOut.Items.Clear;
  MapOut.Assign(MapIn1);
  for i:= 0 to MapIn2.Items.Count-1 do
    MapOut.Items.Add.Assign(MapIn2.Items[i]);
end;    

procedure DoKeymappingTruncate(Map: TSyntKeyMapping; NCount: Integer);
begin
  while Map.Items.Count>NCount do
    Map.Items.Delete(Map.Items.Count-1);
end;

function MsgConfirmOkCancelForAll(const Caption, Text, CheckText: Widestring;
  CheckShow: boolean; ParentWnd: THandle): TSynTaskDialogResult;
var
  Task: TTaskDialog;
  Res: Integer;
begin
  Task.Title:= 'SynWrite';
  Task.Inst:= Caption;
  Task.Content:= Text;
  Task.Verify:= CheckText;
  Task.VerifyChecked:= false;

  Res:= Task.Execute([cbOK, cbCancel], 0, [], tiQuestion, tfiWarning, 0, 0, ParentWnd);

  case Res of
    1:
      begin
        if Task.VerifyChecked then Result:= taskResYesAll else Result:= taskResYes;
      end;
    2:
      begin
        if Task.VerifyChecked then Result:= taskResNoAll else Result:= taskResNo;
      end
    else
      Result:= taskResNo;
  end;
end;

function DoGetLocalizedEncodingName(const Id: Widestring): Widestring;
var
  SL: Widestring;
  n: Integer;
begin
  Result:= Id;
  //encoding translations are in DKLang resource
  SL:= DKLangConstW('cpLn');

  n:= Pos(','+Id+'=', SL);
  if n=0 then Exit;
  Delete(SL, 1, n+Length(Id)+1);
  Delete(SL, Pos(',', SL), MaxInt);
  Result:= SL;
end;

procedure FixListboxHorzScrollbar(L: TTntListBox);
const
  cDelta = 5;
var
  i, n: integer;
begin
  n:= 50;
  L.Canvas.Font.Assign(L.Font);
  for i:= 0 to L.Count-1 do
    n:= Max(n, ecTextExtent(L.Canvas, L.Items[i]).cx);
  L.ScrollWidth:= n+cDelta;
end;

procedure FixCheckListboxHorzScrollbar(L: TTntCheckListBox);
const
  cDelta = 30;
var
  i, n: integer;
begin
  n:= 50;
  L.Canvas.Font.Assign(L.Font);
  for i:= 0 to L.Count-1 do
    n:= Max(n, ecTextExtent(L.Canvas, L.Items[i]).cx);
  L.ScrollWidth:= n+cDelta;
end;


procedure FixListOutput(L: TWideStringList; NoTags, NoDups: boolean;
  Enc: TSynToolOutputEnc; const TabStr: Widestring);
var
  i: Integer;
  S: Widestring;
begin
  L.BeginUpdate;
  try
    if NoTags then
      for i:= 0 to L.Count-1 do
        L[i]:= SDeleteTags(L[i]);
    if NoDups then
      for i:= L.Count-1 downto 1 do
        if L[i-1] = L[i] then
          L.Delete(i);
    //Encoding
    case Enc of
      encOem:
      begin
        for i:= 0 to L.Count-1 do
          L[i]:= AnsiToUnicodeCP(L[i], CP_OEMCP);
      end;
      encUtf8:
      begin
        for i:= 0 to L.Count-1 do
          L[i]:= UTF8Decode(AnsiString(L[i]));
      end;
    end;
    //TabSize
    for i:= 0 to L.Count-1 do
    begin
      S:= L[i];
      if Pos(#9, S)>0 then
      begin
        SReplaceAllW(S, #9, TabStr);
        L[i]:= S;
      end;
    end;
  finally
    L.EndUpdate;
  end;
end;

procedure DoTool_CopyItem(var FIn, FOut: TSynTool);
begin
  FOut.ToolCaption:= FIn.ToolCaption;
  FOut.ToolCommand:= FIn.ToolCommand;
  FOut.ToolDir:= FIn.ToolDir;
  FOut.ToolParams:= FIn.ToolParams;
  FOut.ToolLexer:= FIn.ToolLexer;
  FOut.ToolKeys:= FIn.ToolKeys;
  FOut.ToolOutCapture:= FIn.ToolOutCapture;
  FOut.ToolOutType:= FIn.ToolOutType;
  FOut.ToolOutEncoding:= FIn.ToolOutEncoding;
  FOut.ToolOutRegex:= FIn.ToolOutRegex;
  FOut.ToolOutNum_fn:= FIn.ToolOutNum_fn;
  FOut.ToolOutNum_line:= FIn.ToolOutNum_line;
  FOut.ToolOutNum_col:= FIn.ToolOutNum_col;
  FOut.ToolSaveMode:= FIn.ToolSaveMode;
  FOut.ToolNoTags:= FIn.ToolNoTags;
  FOut.ToolContextItem:= FIn.ToolContextItem;
end;

procedure DoTool_CopyList(var FIn, FOut: TSynToolList);
var
  i: Integer;
begin
  for i:= Low(TSynToolList) to High(TSynToolList) do
    DoTool_CopyItem(FIn[i], FOut[i]);
end;

procedure DoTool_ClearItem(var Item: TSynTool);
begin
  with Item do
  begin
    ToolCaption:= '';
    ToolCommand:= '';
    ToolDir:= '';
    ToolParams:= '';
    ToolLexer:= '';
    ToolKeys:= '';
    ToolOutCapture:= false;
    ToolOutType:= '';
    ToolOutEncoding:= Low(ToolOutEncoding);
    ToolOutRegex:= '';
    ToolOutNum_fn:= 0;
    ToolOutNum_line:= 0;
    ToolOutNum_col:= 0;
    ToolSaveMode:= Low(ToolSaveMode);
    ToolNoTags:= false;
    ToolContextItem:= false;
  end;
end;

function IsWindowsVista: Boolean;
begin
  Result:=
    (Win32Platform = VER_PLATFORM_WIN32_NT) and
    (Win32MajorVersion >= 6);
end;

function STrimFolderName(const s: Widestring): Widestring;
begin
  Result:= s;
  while (Result<>'') and
    (Char(Result[Length(Result)]) in ['*', '\', ' ']) do
    SetLength(Result, Length(Result)-1);
end;


function DoSnippetEditorDialog(var AInfo: TSynSnippetInfo): boolean;
begin
  with TfmSnippetEditor.Create(nil) do
  try
    edName.Text:= AInfo.Name;
    edId.Text:= AInfo.Id;
    edLex.Text:= AInfo.Lexers;
    memoText.Text:= AInfo.Text;

    Result:= ShowModal=mrOk;
    if Result then
    begin
      AInfo.Name:= edName.Text;
      AInfo.Id:= edId.Text;
      AInfo.Lexers:= edLex.Text;
      AInfo.Text:= memoText.Text;
    end;
  finally
    Free
  end;
end;


procedure DoIconSet_DetectSizes(const dir: string; var SizeX, SizeY: Integer);
const
  cRegex = '.+? (\d+)x(\d+).*?$';
var
  List: TSynStrArray;
begin
  SParseRegexArray(ExtractFileName(dir), cRegex, List);
  SizeX:= StrToIntDef(List[0], 0);
  SizeY:= StrToIntDef(List[1], 0);
end;

const
  cIconsId: array[0..32] of string = (
  'f_new',
  'f_open',
  'f_save',
  'f_save2',
  'o_dialog',
  'e_copy',
  'e_cut',
  'e_paste',
  'e_del',
  'e_select',
  'e_undo',
  'e_redo',
  'c_find',
  'c_indent',
  'c_indent_un',
  'c_sort',
  'c_case',
  'c_cmt',
  'c_cmt_un',
  'o_panel_l',
  'o_panel_r',
  'o_panel_b',
  'c_goto',
  'o_nprint',
  'c_print',
  'e_copy_link',
  'qs_next',
  'qs_prev',
  'qs_case',
  'qs_words',
  'o_sync_h',
  'o_sync_v',
  'o_spell'
  );

function DoIconSet_LoadFromTar(L: TPngImageList; const fn_tar: string): boolean;
const
  cMin = 4; //smallest icons size
var
  Str: array[Low(cIconsId)..High(cIconsId)] of TMemoryStream;
  Arc: TTarArchive;
  DirRec: TTarDirRec;
  PngObj: TPngObject;
  i, sizeX, sizeY: Integer;
begin
  DoIconSet_DetectSizes(fn_tar, sizeX, sizeY);
  if (sizeX<cMin) or (sizeY<cMin) then
  begin
    Application.MessageBox(
      PChar('Cannot detect icon size:'#13+fn_tar),
      'SynWrite', mb_ok or mb_iconerror);
    Result:= false;
    Exit
  end;

  Result:= true;
  L.PngImages.Clear;
  L.Width:= sizeX;
  L.Height:= sizeY;

  for i:= Low(Str) to High(Str) do
    Str[i]:= TMemoryStream.Create;

  try
    Arc:= TTarArchive.Create(fn_tar);
    try
      Arc.Reset;
      while Arc.FindNext(DirRec) do
        for i:= Low(Str) to High(Str) do
          if DirRec.Name=cIconsId[i]+'.png' then
          begin
            Arc.ReadFile(Str[i]);
            Str[i].Seek(0, soFromBeginning);
            Break
          end;
    finally
      FreeAndNil(Arc);
    end;

    L.BeginUpdate;
    try
      for i:= Low(Str) to High(Str) do
        try
          PngObj:= L.PngImages.Add.PngImage;
          PngObj.LoadFromStream(Str[i]);
          if not ((PngObj.Width=sizeX) and (PngObj.Height=sizeY)) then
          begin
            MsgError(Format('Incorrect icon size: %s %dx%d'#13'%s',
              [cIconsId[i], PngObj.Width, PngObj.Height, fn_tar]), 0);
            Result:= false;
            Exit
          end;
        except
          MsgError(Format('Cannot load icon: %s'#13'%s',
            [cIconsId[i], fn_tar]), 0);
          Result:= false;
          Exit
        end;
    finally
      L.EndUpdate;
    end;

  finally
    for i:= Low(Str) to High(Str) do
      FreeAndNil(Str[i]);
  end;
end;

function DoIconSet_LoadFromDir(L: TPngImageList; const dir: string): boolean;
const
  cMin = 4; //smallest icons size
var
  i, sizeX, sizeY: Integer;
  fn: string;
begin
  DoIconSet_DetectSizes(dir, sizeX, sizeY);
  if (sizeX<cMin) or (sizeY<cMin) then
  begin
    Application.MessageBox(
      PChar('Cannot detect icons size:'#13+dir),
      'SynWrite', mb_ok or mb_iconerror);
    Result:= false;
    Exit
  end;

  Result:= true;
  L.PngImages.Clear;
  L.Width:= sizeX;
  L.Height:= sizeY;

  for i:= Low(cIconsId) to High(cIconsId) do
    try
      fn:= dir+'\'+cIconsId[i]+'.png';
      L.PngImages.Add.PngImage.LoadFromFile(fn);
    except
      Application.MessageBox(
        PChar('Cannot load icon:'#13+fn),
        'SynWrite', mb_ok or mb_iconerror);
      Result:= false;
      Exit
    end;

  //workaround for missing last icon: add empty icon
  L.PngImages.Add;
end;

function DoInputCheckList(const ACaption, AColumns, AItems: Widestring;
  ASizeX, ASizeY: Integer): string;
const
  sepLine=#10;
  sepTab=#9;
var
  S, SItem, SSubItem: Widestring;
  i: Integer;
begin
  Result:= '';
  with TfmInputCheckList.Create(nil) do
  try
    Caption:= ACaption;
    Width:= ASizeX;
    Height:= ASizeY;

    List.Columns.Clear;
    List.Items.Clear;

    S:= AColumns;
    repeat
      SItem:= SGetItem(S, sepLine);
      if SItem='' then Break;
      with List.Columns.Add do
      begin
        Caption:= SGetItem(SItem, sepTab);
        i:= StrToIntDef(SGetItem(SItem, sepTab), 0);
        if i>0 then
          Width:= i
        else
          AutoSize:= true;
      end;
    until false;

    S:= AItems;
    repeat
      SItem:= SGetItem(S, sepLine);
      if SItem='' then Break;
      with List.Items.Add do
      begin
        SSubItem:= SGetItem(SItem, sepTab);
        Checked:= SBegin(SSubItem, '*');
        if Checked then System.Delete(SSubItem, 1, 1);
        Caption:= SSubItem;
        repeat
          SSubItem:= SGetItem(SItem, sepTab);
          if SSubItem='' then Break;
          SubItems.Add(SSubItem);
        until false;
      end;
    until false;

    if ShowModal=mrOk then
    begin
      for i:= 0 to List.Items.Count-1 do
        Result:= Result+ IfThen(List.Items[i].Checked, '1', '0');
    end;
  finally
    Free
  end;
end;

procedure DoRemovePluginsIniLines(const fn_ini, dir: string; IsBinaryPlugin: boolean);
var
  L: TStringList;
  i: Integer;
  Substr: string;
begin
  if not FileExists(fn_ini) then Exit;

  if IsBinaryPlugin then
    Substr:= '='+dir+'\'
  else
    Substr:= '=py:'+dir+';';

  L:= TStringList.Create;
  try
    L.LoadFromFile(fn_ini);
    for i:= L.Count-1 downto 0 do
      if Pos(Substr, L[i])>0 then
        L.Delete(i);
    L.SaveToFile(fn_ini);    
  finally
    FreeAndNil(L);
  end;
end;

procedure DoSortMenu(Menu: TSpTbxSubmenuItem);
var
  L: TTntStringList;
  i: Integer;
begin
  L:= TTntStringList.Create;
  try
    L.Sorted:= true;
    for i:= 0 to Menu.Count-1 do
      L.AddObject((Menu.Items[i] as TSpTBXCustomItem).Caption, Menu.Items[i]);

    for i:= 0 to L.Count-1 do
      Menu.Move(
        Menu.IndexOf(L.Objects[i] as TSpTBXCustomItem),
        Menu.Count-1
        );
  finally
    FreeAndNil(L);
  end;
end;

end.
