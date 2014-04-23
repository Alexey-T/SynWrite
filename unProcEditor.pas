unit unProcEditor;

interface

uses
  Classes,
  TntClasses,
  Types,
  Forms,

  ecSyntAnal,
  ecSyntMemo,
  ATSyntMemo,
  ecMemoStrings,
  ecStrUtils;

function EditorFormatHexCode(Ed: TSyntaxMemo; const SHexCode: string): string;
procedure EditorInsertColorCode(Ed: TSyntaxMemo; Code: Integer);
procedure EditorGetColorCodeRange(Ed: TSyntaxMemo; var NStart, NEnd: integer; var NColor: integer);
function DoReadLexersCfg(const ASection, AId: string): string;

function EditorGetTokenName(Ed: TSyntaxMemo; StartPos, EndPos: integer): string;
procedure EditorGetTokenType(Ed: TSyntaxMemo; StartPos, EndPos: Integer; var IsCmt, IsStr: boolean);

function EditorMouseCursorOnNumbers(Ed: TSyntaxMemo): boolean;
procedure EditorBookmarkCommand(Ed: TSyntaxMemo; NCmd, NPos, NIcon, NColor: Integer; const SHint: string);
procedure EditorClearBookmarks(Ed: TSyntaxMemo);
procedure EditorSetBookmarkUnnumbered(Ed: TSyntaxMemo; NPos, NIcon, NColor: Integer; const SHint: string);
procedure FixLineEnds(var S: Widestring; ATextFormat: TTextFormat);
function EditorGetBottomLineIndex(Ed: TSyntaxMemo): Integer;
function EditorGetWordBeforeCaret(Ed: TSyntaxMemo; AllowDot: boolean): Widestring;
procedure EditorInsertSnippet(Ed: TSyntaxMemo; const AText, ASelText: Widestring);

function EditorIndentStringForPos(Ed: TSyntaxMemo; PntPos: TPoint): Widestring;
procedure EditorUpdateCaretPosFromMousePos(Ed: TSyntaxMemo);
procedure EditorJumpToLastMarker(Ed: TSyntaxMemo);
function EditorJumpMixedCase(Ed: TSyntaxMemo; ARight: boolean): boolean;
procedure EditorJumpColumnMarker(Ed: TSyntaxMemo; ALeft: boolean);
procedure EditorJumpSelectionStartEnd(Ed: TSyntaxMemo);
function EditorJumpBlankLine(Ed: TSyntaxMemo; opSrOffsetY: Integer; ANext: boolean): boolean;
function EditorJumpRange(Ed: TSyntaxMemo): boolean;
function EditorJumpBracket(Ed: TSyntaxMemo): boolean;
procedure EditorFindBrackets(Ed: TSyntaxMemo; var Pos1, Pos2: Integer);
function EditorFindOpeningBracket(Ed: TSyntaxMemo): Integer;
procedure EditorSelectBrackets(Ed: TSyntaxMemo; var FPrevCaretPos: Integer);
procedure EditorSelectOrJumpToWordEnd(Ed: TSyntaxMemo; ASelect: boolean);
procedure EditorSelectParagraph(Ed: TSyntaxMemo);
  
procedure EditorSetSelCoordAsString(Ed: TSyntaxMemo; const Str: string);
function EditorGetSelCoordAsString(Ed: TSyntaxMemo): string;
procedure EditorSetBookmarksAsString(Ed: TSyntaxMemo; const Str: string);
function EditorGetBookmarksAsString(Ed: TSyntaxMemo): string;
procedure EditorGetBookmarksAsSortedList(Ed: TSyntaxMemo; L: TList);

function EditorPasteAsColumnBlock(Ed: TSyntaxMemo): boolean;
procedure EditorPasteToFirstColumn(Ed: TSyntaxMemo);
procedure EditorPasteNoCaretChange(Ed: TSyntaxMemo);
procedure EditorCopyAsRtf(Ed: TSyntaxMemo);
procedure EditorCopyAsHtml(Ed: TSyntaxMemo);
procedure EditorCopyOrCutCurrentLine(Ed: TSyntaxMemo; ACut: boolean);
procedure EditorCopyOrCutAndAppend(Ed: TSyntaxMemo; ACut: boolean);

procedure EditorClearMarkers(Ed: TSyntaxMemo);
function EditorAutoCloseBracket(Ed: TSyntaxMemo; ch: Widechar;
  opAutoCloseBrackets, opAutoCloseQuotes, opAutoCloseBracketsNoEsc: boolean): boolean;
procedure EditorDeleteToFileBegin(Ed: TSyntaxMemo);
procedure EditorDeleteToFileEnd(Ed: TSyntaxMemo);
procedure EditorJoinLines(Ed: TSyntaxMemo);
procedure EditorMoveCaretByNChars(Ed: TSyntaxMemo; DX, DY: Integer);
procedure EditorCommentUncommentLines(Ed: TSyntaxMemo; AComment: boolean);
function EditorToggleSyncEditing(Ed: TSyntaxMemo): boolean;
procedure EditorKeepCaretOnScreen(Ed: TSyntaxMemo);
procedure EditorIndentBlock(Ed: TSyntaxMemo; shift: boolean);
procedure EditorChangeBlockCase(Ed: TSyntaxMemo; Cmd: TChangeCase);
procedure EditorDoHomeKey(Ed: TSyntaxMemo);
procedure EditorInsertBlankLineAboveOrBelow(Ed: TSyntaxMemo; ABelow: boolean);
procedure EditorPasteAndSelect(Ed: TSyntaxMemo);

procedure EditorExtendSelectionByLexer_All(Ed: TSyntaxMemo; var Err: string);
procedure EditorExtendSelectionByLexer_HTML(Ed: TSyntaxMemo);
procedure EditorExtendSelectionByOneLine(Ed: TSyntaxMemo);
procedure EditorExtendSelectionByPosition(Ed: TSyntaxMemo;
  AOldStart, AOldLength, ANewStart, ANewLength: integer);

procedure EditorSplitLinesByPosition(Ed: TSyntaxMemo; nCol: Integer);
procedure EditorScrollToSelection(Ed: TSyntaxMemo; NSearchOffsetY: Integer);
procedure EditorCenterSelectedLines(Ed: TSyntaxMemo);
function EditorDeleteSelectedLines(Ed: TSyntaxMemo): Integer;
function EditorEOL(Ed: TCustomSyntaxMemo): Widestring;
procedure EditorToggleStreamComment(Ed: TSyntaxMemo; s1, s2: string; CmtMLine: boolean);
procedure EditorFillBlockRect(Ed: TSyntaxMemo; SData: Widestring; bKeep: boolean);
function EditorCurrentLexerForPos(Ed: TSyntaxMemo; NPos: integer): string;
function EditorCurrentLexerHasTemplates(Ed: TSyntaxMemo): boolean;

function EditorTokenString(Ed: TSyntaxMemo; TokenIndex: Integer): Widestring;
function EditorTokenFullString(Ed: TSyntaxMemo; TokenIndex: Integer; IsDotNeeded: boolean): Widestring;
procedure EditorFoldLevel(Ed: TSyntaxMemo; NLevel: Integer);
function EditorSelectToken(Ed: TSyntaxMemo; SkipQuotes: boolean = false): boolean;
procedure EditorMarkSelStart(Ed: TSyntaxMemo);
procedure EditorMarkSelEnd(Ed: TSyntaxMemo);

type
  TSynEditorInsertMode = (mTxt, mNum, mBul);
  TSynEditorInsertPos = (pCol, pAfterSp, pAfterStr);
  TSynEditorInsertData = record
    NStart, NDigits: integer;
    NBegin, NTail: Widestring;
    NCounter: integer;
    SText1, SText2: Widestring;
    InsMode: TSynEditorInsertMode;
    InsPos: TSynEditorInsertPos;
    InsCol: Integer;
    InsStrAfter: Widestring;
    SkipEmpty: boolean;
  end;
procedure EditorInsertTextData(Ed: TSyntaxMemo; const Data: TSynEditorInsertData);

type
  TSynScrollLineTo = (cScrollToTop, cScrollToBottom, cScrollToMiddle);
procedure EditorScrollCurrentLineTo(Ed: TSyntaxMemo; Mode: TSynScrollLineTo);

procedure EditorDuplicateLine(Ed: TSyntaxMemo);
procedure EditorDeleteLine(Ed: TSyntaxMemo; NLine: integer; AUndo: boolean);
procedure EditorReplaceLine(Ed: TSyntaxMemo; NLine: integer;
  const S: WideString; AUndo: boolean);

function EditorCaretAfterUnclosedQuote(Ed: TSyntaxMemo; var QuoteChar: WideChar): boolean;
function EditorNeedsHtmlOpeningBracket(Ed: TSyntaxMemo): boolean;

function EditorHasNoCaret(Ed: TSyntaxMemo): boolean;
function EditorTabSize(Ed: TSyntaxMemo): Integer;
function EditorTabExpansion(Ed: TSyntaxMemo): Widestring;

type
  TSynSelSave = record
    FSelStream: boolean;
    FSelStart, FSelEnd: TPoint;
    FSelRect: TRect;
    FCaretPos: TPoint;
  end;

procedure EditorSaveSel(Ed: TSyntaxMemo; var Sel: TSynSelSave);
procedure EditorRestoreSel(Ed: TSyntaxMemo; const Sel: TSynSelSave);


procedure EditorGetSelLines(Ed: TSyntaxMemo; var Ln1, Ln2: Integer);
function EditorHasMultilineSelection(Ed: TSyntaxMemo): boolean;
procedure EditorAddLineToEnd(Ed: TSyntaxMemo);
function EditorSelectionForGotoCommand(Ed: TSyntaxMemo): Widestring;
function EditorSelectWord(Ed: TSyntaxMemo): boolean;
procedure EditorSearchMarksToList(Ed: TSyntaxmemo; List: TTntStrings);
function EditorSelectedTextForWeb(Ed: TSyntaxMemo): Widestring;

procedure EditorSelectToPosition(Ed: TSyntaxMemo; NTo: Integer);
procedure EditorCheckCaretOverlappedByForm(Ed: TCustomSyntaxMemo; Form: TForm);
function SyntaxManagerFilesFilter(M: TSyntaxManager; const SAllText: Widestring): Widestring;

function EditorWordLength(Ed: TSyntaxMemo): Integer;
function EditorGetSelTextLimited(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
function EditorGetCollapsedRanges(Ed: TSyntaxMemo): string;
procedure EditorSetCollapsedRanges(Ed: TSyntaxMemo; S: Widestring);
procedure EditorCommentLinesAlt(Ed: TSyntaxMemo; const sComment: Widestring);

procedure EditorCollapseWithNested(Ed: TSyntaxMemo; Line: Integer);
procedure EditorCollapseParentRange(Ed: TSyntaxMemo; APos: Integer);
procedure EditorUncollapseLine(Ed: TCustomSyntaxMemo; Line: Integer);
function IsEditorLineCollapsed(Ed: TCustomSyntaxMemo; Line: Integer): boolean;

procedure EditorCountWords(L: TSyntMemoStrings; var NWords, NChars: Int64);
procedure EditorCenterPos(Ed: TCustomSyntaxMemo; AGotoMode: boolean; NOffsetY: Integer);

var
  EditorSynLexersCfg: string = '';
  EditorSynLexersExCfg: string = '';

implementation

uses
  Windows,
  Math,
  Clipbrd,
  TntClipbrd,
  SysUtils,
  StrUtils,
  Controls,
  TntSysUtils,
  TntWideStrUtils,
  ATxSProc,
  IniFiles,
  ecCmdConst,
  ecExports;

var
  FListCommentStyles: TStringList = nil; //holds "Comments" style list
  FListStringStyles: TStringList = nil; //holds "Strings" style list

procedure EditorSearchMarksToList(Ed: TSyntaxmemo; List: TTntStrings);
var
  i: Integer;
begin
  List.Clear;
  with Ed.SearchMarks do
    for i:= 0 to Count-1 do
      List.Add(Copy(Ed.Text, Items[i].StartPos+1, Items[i].Size));
end;

function EditorSelectedTextForWeb(Ed: TSyntaxMemo): Widestring;
begin
  with Ed do
    if SelLength>0 then
      Result:= SelText
    else
      Result:= WordAtPos(CaretPos);

  SReplaceAllW(Result, #13, ' ');
  SReplaceAllW(Result, #10, ' ');
  SReplaceAllW(Result, '  ', ' ');
  SReplaceAllW(Result, ' ', '+');
end;

procedure EditorSelectToPosition(Ed: TSyntaxMemo; NTo: Integer);
var
  N1, N2, NFrom: Integer;
begin
  NFrom:= Ed.CaretStrPos;
  if NFrom<=NTo then
    begin N1:= NFrom; N2:= NTo end
  else
    begin N2:= NFrom; N1:= NTo end;
  Ed.SetSelection(N1, N2-N1);
end;

procedure EditorCheckCaretOverlappedByForm(Ed: TCustomSyntaxMemo; Form: TForm);
const
  cDY = 35; //minimal offset from form's border to caret position
var
  P, P2: TPoint;
  NStart, NLen: Integer;
begin
  if Form=nil then Exit;
  P:= Ed.CaretPos;

  //uncollapse found line
  if IsEditorLineCollapsed(Ed, P.Y) then
  begin
    EditorUncollapseLine(Ed, P.Y);
    NStart:= Ed.SelStart;
    NLen:= Ed.SelLength;
    Ed.SetSelection(NStart, NLen);
  end;

  P:= Ed.CaretToMouse(P.X, P.Y);
  P:= Ed.ClientToScreen(P);
  P2:= Point(P.X, P.Y + cDY);
  //P is coord of top caret point,
  //P2 is coord of bottom caret point
  if PtInRect(Form.BoundsRect, P) or
    PtInRect(Form.BoundsRect, P2) then
  begin
    if P.Y >= Form.Height + cDY then
      //move form up
      Form.Top:= P.Y - Form.Height - cDY
    else
      //move form down
      Form.Top:= P.Y + cDY * 2;
  end;
end;

function SyntaxManagerFilesFilter(M: TSyntaxManager; const SAllText: Widestring): Widestring;
  //
  function GetExtString(const Extentions: string): string;
  var
    SAll, SItem: Widestring;
  begin
    Result:= '';
    SAll:= Extentions;
    repeat
      SItem:= SGetItem(SAll, ' ');
      if SItem='' then Break;
      if Pos('/', SItem)=0 then //Makefiles lexer has "/mask"
        SItem:= '*.' + SItem
      else
        SReplaceAllW(SItem, '/', '');
      Result:= Result + IfThen(Result<>'', ';') + SItem;
    until false;
  end;
  //
var
  s: string;
  o: TStringList;
  i, j: integer;
begin
  Result := '';
  o:= TStringList.Create;
  try
    o.Duplicates:= dupIgnore;
    o.Sorted:= True;

    for i:= 0 to M.AnalyzerCount-1 do
      if not M.Analyzers[i].Internal then
        with M.Analyzers[i] do
          o.Add(LexerName);

    for j:= 0 to o.Count-1 do
      for i:= 0 to M.AnalyzerCount-1 do
        if not M.Analyzers[i].Internal then
          with M.Analyzers[i] do
           if LexerName=o[j] then
           begin
             s:= GetExtString(Extentions);
             if s<>'' then
               Result:= Result + Format('%s (%s)|%1:s|', [LexerName, s]);
           end;
  finally
    FreeAndNil(o);
  end;

  Result:= Result + SAllText + ' (*.*)|*.*';
end;

function EditorWordLength(Ed: TSyntaxMemo): Integer;
var
  S: Widestring;
  N: Integer;
begin
  Result:= 0;
  N:= Ed.CurrentLine;
  if (N>=0) and (N<Ed.Lines.Count) then
    S:= Ed.Lines[N]
  else
    Exit;

  N:= Ed.CaretPos.X+1;
  if N>Length(S) then
    N:= Length(S)+1;
  repeat
    Dec(N);
    if N=0 then Break;
    if not IsWordChar(S[N]) then Break;
    Inc(Result);
  until false;
end;

function EditorGetSelTextLimited(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
begin
  Result:= Ed.SelText;
  if Length(Result)>MaxLen then
    SetLength(Result, MaxLen);
end;

function EditorGetCollapsedRanges(Ed: TSyntaxMemo): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= 0 to Ed.Lines.Count-1 do
    if Ed.IsLineCollapsed(i)=1 then
      Result:= Result+IntToStr(i)+',';
end;

procedure EditorSetCollapsedRanges(Ed: TSyntaxMemo; S: Widestring);
var
  S1: Widestring;
  N: Integer;
begin
  repeat
    S1:= SGetItem(S);
    if S1='' then Break;
    N:= StrToIntDef(S1, -1);
    if (N>=0) and (N<Ed.Lines.Count) then
      Ed.CollapseNearest(N);
  until false;
  Ed.Invalidate;
end;

function EditorGetTokenName(Ed: TSyntaxMemo; StartPos, EndPos: integer): string;
var
  n: integer;
  t: TSyntToken;
begin
  Result:= '';
  Dec(StartPos);
  Dec(EndPos);

  if Ed.SyntObj=nil then Exit;
  n:= Ed.SyntObj.TokenAtPos(StartPos);
  if n<0 then Exit;
  t:= Ed.SyntObj.Tags[n];
  if t=nil then Exit;
  if t.Style=nil then Exit;

  //t.StartPos, t.EndPos
  if (StartPos>=t.StartPos) and (EndPos<=t.EndPos) then
    Result:= t.Style.DisplayName;
end;

procedure EditorCommentLinesAlt(Ed: TSyntaxMemo; const sComment: Widestring);
var
  S: ecString;
  i, FirstLine, LastLine: integer;
  CaretOld: TPoint;
  NeedDown: boolean;
begin
  if sComment='' then Exit;

  Ed.GetSelectedLines(FirstLine, LastLine);
  CaretOld:= Ed.CaretPos;
  NeedDown:= not Ed.HaveSelection;
  if NeedDown then
    Inc(CaretOld.Y);

  Ed.BeginUpdate;
  Ed.ResetSelection;
  try
    for i:= LastLine downto FirstLine do
     begin
       if i<Ed.Lines.Count then
         S:= Ed.Lines[i]
       else
         S:= '';

       Ed.CaretPos := Point(SSpacesAtStart(S), i);
       Ed.InsertText(sComment);
     end;
    Ed.CaretPos := CaretOld;
  finally
    Ed.EndUpdate;
  end;
end;

procedure EditorCollapseWithNested(Ed: TSyntaxMemo; Line: Integer);
var
  i: Integer;
begin
  if not ((Line>=0) and (Line<Ed.Lines.Count)) then Exit;

  case Ed.IsLineCollapsed(Line) of
    1:
      Ed.ToggleCollapseChildren(Line);
    0:
      begin
      end;
    else
      begin
        for i:= Line-1 downto 0 do
          if Ed.IsLineCollapsed(i)>=0 then
          begin
            Ed.ToggleCollapseChildren(i);
            Exit
          end;
      end;
  end;
end;

procedure EditorCollapseParentRange(Ed: TSyntaxMemo; APos: Integer);
var
  r, r2: TTextRange;
begin
  with Ed do
    if Assigned(SyntObj) then
    begin
      r:= SyntObj.NearestRangeAtPos(APos);
      if r=nil then Exit;
      r2:= r.Parent;
      if r2<>nil then
        r:= r2;
      CollapseRange(r);
      Exit;
    end;
end;

procedure EditorUncollapseLine(Ed: TCustomSyntaxMemo; Line: Integer);
var
  i, AStartPos, AEndPos: Integer;
  Upd: boolean;
begin
  if (Line>=0) and (Line<Ed.Lines.Count) then
  begin
    AStartPos:= Ed.CaretPosToStrPos(Point(0, Line));
    AEndPos:= Ed.CaretPosToStrPos(Point(Ed.Lines.LineLength(Line), Line));
    Upd:= false;
    with Ed do
    begin
      for i:= Collapsed.Count - 1 downto 0 do
       with Collapsed[i] do
         if (StartPos <= AStartPos) and (EndPos >= AEndPos) then
         begin
           Collapsed.Delete(i);
           Upd:= true;
         end;
      if Upd then
      begin
        CollapsedChanged; //need to be in public (ecSyntMemo.pas)
      end;
    end;
  end;
end;

function IsEditorLineCollapsed(Ed: TCustomSyntaxMemo; Line: Integer): boolean;
var
  i, AStartPos, AEndPos: Integer;
begin
  Result:= false;
  if (Line>=0) and (Line<Ed.Lines.Count) then
  begin
    AStartPos:= Ed.CaretPosToStrPos(Point(0, Line));
    AEndPos:= Ed.CaretPosToStrPos(Point(Ed.Lines.LineLength(Line), Line));
    with Ed do
      for i:= Collapsed.Count - 1 downto 0 do
       with Collapsed[i] do
         if (StartPos <= AStartPos) and (EndPos >= AEndPos) then
         begin
           Result:= true;
           Exit
         end;
  end;
end;

procedure EditorCountWords(L: TSyntMemoStrings; var NWords, NChars: Int64);
var
  s: Widestring;
  i, j: integer;
  w: boolean;
begin
  NWords:= 0 ;
  NChars:= 0;
  for i:= 0 to L.Count-1 do
  begin
    S:= L[i];
    w:= false;
    for j:= 1 to Length(S) do
    begin
      if not IsSpaceChar(s[j]) then
        Inc(NChars);
      if IsWordChar(s[j]) then
        w:= true
      else
        begin if w then Inc(NWords); w:= false; end;
    end;
    if w then Inc(NWords);     
  end;
end;

procedure EditorCenterPos(Ed: TCustomSyntaxMemo; AGotoMode: boolean; NOffsetY: Integer);
var
  p: TPoint;
  w, h: integer;
  dx, dy: integer; //indents from sr result to window edge
begin
  dy:= NOffsetY;
  dx:= dy;
  with Ed do
  begin
    p:= CaretPos;
    w:= VisibleCols;
    h:= VisibleLines;

    {
    //uncollapse - buggy on big Python file folded line
    EditorUncollapseLine(Ed, p.Y);
    }

    //center Y
    if p.Y <= TopLine + 1 then
      TopLine:= TopLine - dy
    else
    if p.Y >= TopLine + h - dy then
      TopLine:= p.Y - dy;

    if WordWrap then
      ScrollCaret
    else
    //center X
    begin
      //ZD start
      if VisibleLinesWidth <= ClientWidth then
        ScrollPosX := 0
      else
      //ZD end
      if AGotoMode or (SelLength=0) then
      begin
        {//center caret
        if (p.X <= ScrollPosX + dx) or
          (p.X >= ScrollPosX + w - dx) then
        ScrollPosX:= p.X - w div 2;}

        //ZD start
        if (p.X <= ScrollPosX + dx) then
          ScrollPosX := p.X - dx
        else if (p.X >= ScrollPosX + w - dx) then
          ScrollPosX := p.X - w + dx;
        //ZD end
      end
      else
      begin
        {//center seltext
        if (StrPosToCaretPos(SelStart).X <= ScrollPosX + dx) or
        (StrPosToCaretPos(SelStart+SelLength).X >= ScrollPosX + w - dx) then
          ScrollPosX:= StrPosToCaretPos(SelStart + SelLength div 2).X - w div 2 + 1;}

        //ZD start
        // Centered selected text doesn't have too much sense when it is
        // on the end of line and none editor has such behavior, they instead
        // try to bring it into the view to the nearest side of editor.
        if (StrPosToCaretPos(SelStart).X <= ScrollPosX + dx) then
          ScrollPosX := StrPosToCaretPos(SelStart).X - dx
        else if (StrPosToCaretPos(SelStart + SelLength).X >= ScrollPosX + w - dx) then
          ScrollPosX := StrPosToCaretPos(SelStart + SelLength).X - w + dx;
        //ZD end
      end;

      //this UpdateEditor call doesn't help: still bug:
      //http://synwrite.sourceforge.net/forums/viewtopic.php?p=5225#p5225
      //ZD - this bug doesn't exist anymore
      UpdateEditor;
    end;
  end;
end;


function EditorSelectWord(Ed: TSyntaxMemo): boolean;
var
  NPos: integer;
begin
  Result:= false;
  NPos:= Ed.CaretStrPos;
  if (NPos>=0) then
  begin
    if (NPos=Ed.TextLength) //caret at EOF
      or not IsWordChar(Ed.Text[NPos+1]) then //caret not under wordchar
    begin
      //previous char is wordchar?
      if (NPos>=1) and IsWordChar(Ed.Text[NPos]) then
        Ed.CaretStrPos:= NPos-1
      else
        Exit;
    end;
    Ed.SelectWord;
    Result:= true;
  end;
end;

function EditorSelectionForGotoCommand(Ed: TSyntaxMemo): Widestring;
const
  cMaxNameLen = 20; //max len of filename in popup menu
begin
  Result:= Ed.SelText;

  //don't show multi-line selection here
  if (Pos(#13, Result)>0) or
     (Pos(#10, Result)>0) or
     (Pos(#9, Result)>0) then
    Result:= '';

  if Length(Result)>cMaxNameLen then
    Result:= Copy(Result, 1, cMaxNameLen) + '...';
end;

procedure EditorAddLineToEnd(Ed: TSyntaxMemo);
var
  n: Integer;
begin
  //Fix: last line must be with EOL
  with Ed do
    if (CaretPos.Y = Lines.Count-1) and (Lines[Lines.Count-1]<>'') then
    begin
      n:= CaretStrPos;
      CaretStrPos:= TextLength;
      InsertNewLine(0, True, false);
      CaretStrPos:= n;
    end;
end;

//Get selected lines nums: from Ln1 to Ln2
procedure EditorGetSelLines(Ed: TSyntaxMemo; var Ln1, Ln2: Integer);
var
  p: TPoint;
begin
  with Ed do
    if HaveSelection then
    begin
      if SelLength>0 then
      begin
        Ln1:= StrPosToCaretPos(SelStart).Y;
        p:= StrPosToCaretPos(SelStart+SelLength);
        Ln2:= p.Y;
        if p.X = 0 then
          Dec(Ln2);
      end
      else
      begin
        Ln1:= SelRect.Top;
        Ln2:= SelRect.Bottom;
      end
    end
    else
    begin
      //no selection
      Ln1:= CaretPos.Y;
      Ln2:= Ln1;
    end;
end;


function EditorHasMultilineSelection(Ed: TSyntaxMemo): boolean;
var
  Ln1, Ln2: integer;
begin
  if not Ed.HaveSelection then
    Result:= false
  else
  begin
    EditorGetSelLines(Ed, Ln1, Ln2);
    Result:= Ln2 > Ln1;
  end;
end;


function EditorTabSize(Ed: TSyntaxMemo): Integer;
begin
  if Ed.TabList.Count>0 then
    Result:= Ed.TabList[0]
  else
    Result:= 8;
end;

function EditorTabExpansion(Ed: TSyntaxMemo): Widestring;
begin
  Result:= StringOfChar(' ', EditorTabSize(Ed));
end;

function EditorHasNoCaret(Ed: TSyntaxMemo): boolean;
begin
  with Ed do
    Result:= ReadOnly and not (soAlwaysShowCaret in Options);
end;


procedure EditorSaveSel(Ed: TSyntaxMemo; var Sel: TSynSelSave);
begin
  FillChar(Sel, SizeOf(Sel), 0);
  with Ed do
  begin
    Sel.FSelStream:= Ed.SelLength>0;
    if Sel.FSelStream then
    begin
      Sel.FSelStart:= Ed.StrPosToCaretPos(Ed.SelStart);
      Sel.FSelEnd:= Ed.StrPosToCaretPos(Ed.SelStart+Ed.SelLength);
    end
    else
      Sel.FSelRect:= SelRect;
    Sel.FCaretPos:= CaretPos;
  end;
end;

procedure EditorRestoreSel(Ed: TSyntaxMemo; const Sel: TSynSelSave);
begin
  with Ed do
  begin
    BeginUpdate;
    try
      CaretPos:= Sel.FCaretPos;
      if Sel.FSelStream then
      begin
        SelStart:= Ed.CaretPosToStrPos(Sel.FSelStart);
        SelLength:= Ed.CaretPosToStrPos(Sel.FSelEnd) - SelStart;
      end
      else
        SelRect:= Sel.FSelRect;
    finally
      EndUpdate;
    end;
  end;
end;


procedure EditorDuplicateLine(Ed: TSyntaxMemo);
var
  n, nn: Integer;
  s: ecString;
begin
  with Ed do
  if SelLength>0 then
  begin
    n:= SelStart;
    nn:= SelLength;
    s:= SelText;
    SetSelection(n, 0);
    InsertText(s);
    SetSelection(n, nn);
  end
  else
  try
    Ed.BeginUpdate;
    EditorAddLineToEnd(Ed);
    Ed.DuplicateLine(Ed.CaretPos.Y);
    Ed.ExecCommand(smDown);
    //EditorSetModified(Ed);
  finally
    Ed.EndUpdate;
  end;
end;


procedure EditorDeleteLine(Ed: TSyntaxMemo; NLine: integer; AUndo: boolean);
var
  p: TPoint;
begin
  //save caret
  p:= Ed.CaretPos;
  if NLine <= p.Y then
    Dec(p.Y); //fix caret pos

  if AUndo then
    with Ed do
    begin
      CaretPos:= Point(0, NLine);
      DeleteText(Lines.LineSpace(NLine));
    end
  else
  begin
    Ed.ClearUndo;
    Ed.Lines.Delete(NLine);
    Ed.Modified:= true;
  end;

  //restore caret
  Ed.CaretPos:= p;
end;


procedure EditorReplaceLine(Ed: TSyntaxMemo; NLine: integer;
  const S: WideString; AUndo: boolean);
var
  p: TPoint;
begin
  if AUndo then
    with Ed do
    begin
      BeginUpdate;
      try
        p:= CaretPos;
        CaretPos:= Point(0, NLine);
        DeleteText(Lines.LineLength(NLine));
        InsertText(S);
        CaretPos:= p;
      finally
        EndUpdate;
      end;    
    end
  else
  begin
    Ed.Lines[NLine]:= S;
    Ed.Modified:= true;
  end;
end;

var
  _CmpMemo: TCustomSyntaxMemo = nil;

function _BookmarkCompare(N1, N2: Pointer): Integer;
begin
  if not Assigned(_CmpMemo) then
    raise Exception.Create('CmpMemo nil');
  with _CmpMemo do
    Result:= Bookmarks[Integer(N1)] - Bookmarks[Integer(N2)];
end;

procedure EditorGetBookmarksAsSortedList(Ed: TSyntaxMemo; L: TList);
var
  i: Integer;
begin
  with Ed.BookmarkObj do
    for i:= 0 to Count-1 do
      L.Add(Pointer(Items[i].BmIndex));

  _CmpMemo:= Ed;
  L.Sort(_BookmarkCompare);
end;

function EditorCaretAfterUnclosedQuote(Ed: TSyntaxMemo; var QuoteChar: WideChar): boolean;
var
  i: Integer;
  ch: WideChar;
begin
  Result:= false;
  QuoteChar:= #0;

  if Ed.TextLength=0 then Exit;
  i:= Ed.CaretStrPos;
  if not IsWordChar(Ed.Lines.Chars[i]) then Exit;
  while IsWordChar(Ed.Lines.Chars[i]) do Dec(i);
  ch:= Ed.Lines.Chars[i];
  Result:= IsQuoteChar(ch);
  if Result then
    QuoteChar:= ch;
end;

//Result must be true only when
//- TextLength=0
//- caret on space/tab/EOL
//- caret prev char is not wordchar, not '<', '/'
function EditorNeedsHtmlOpeningBracket(Ed: TSyntaxMemo): boolean;
var
  i: Integer;
  ch: Widechar;
begin
  Result:= true;
  with Ed do
    if (TextLength>0) then
    begin
      i:= CaretStrPos;
      //check for previous char
      if (i<=TextLength) then
      begin
        ch:= Lines.Chars[i];
        if IsWordChar(ch) or (ch='<') or (ch='/')
          //or (ch=' ') {fix for unneeded "<" at text end}
          then
            Result:= false;
      end;
      //check for current char
      if (i+1<=TextLength) then
      begin
        ch:= Lines.Chars[i+1];
        if not IsSpaceChar(ch) then
          Result:= false;
      end;
    end;
end;

procedure EditorMarkSelStart(Ed: TSyntaxMemo);
begin
  with Ed do
    SelStartMarked:= CaretStrPos;
end;

procedure EditorMarkSelEnd(Ed: TSyntaxMemo);
var
  nFrom, nTo: Integer;
  pFrom, pTo: TPoint;
begin
  with Ed do
    if SelStartMarked>=0 then
    begin
      nTo:= CaretStrPos;
      if SelStartMarked>nTo then
      begin
        nFrom:= nTo;
        nTo:= SelStartMarked;
      end
      else
        nFrom:= SelStartMarked;

      if SelectModeDefault in [msNone, msNormal] then
        //normal select mode
        SetSelection(nFrom, nTo-nFrom)
      else
      begin
        pFrom:= StrPosToCaretPos(nFrom);
        pTo:= StrPosToCaretPos(nTo);
        if SelectModeDefault = msColumn then
          //column select mode
          SelRect:= Rect(pFrom.X, pFrom.Y, pTo.X, pTo.Y)
        else
          //line select mode
          SelectLines(pFrom.Y, pTo.Y);
      end;
    end;
end;

procedure EditorScrollCurrentLineTo(Ed: TSyntaxMemo; Mode: TSynScrollLineTo);
var
  p: TPoint;
  dy, minY, newY, i: Integer;
begin
  if Ed.Lines.Count>1 then
  case Mode of
    cScrollToTop:
      Ed.TopLine:= Ed.CaretPos.Y;

    cScrollToBottom,
    cScrollToMiddle:
      begin
        dy:= Ed.ClientHeight;
        if Mode=cScrollToMiddle then
          dy:= dy div 2 + Ed.DefLineHeight;

        p:= Ed.CaretPos;
        Inc(p.Y); //make next line fully visible
        Ed.TopLine:= p.Y;
        minY:= Ed.ScrollPosY - dy;

        newY:= Ed.ScrollPosY;
        for i:= p.Y-1 downto 0 do
        begin
          Dec(newY, Ed.LineHeight(i));
          if newY<minY then
          begin
            Ed.TopLine:= i+1;
            Exit;
          end;  
        end;
        Ed.TopLine:= 0;
      end;
    else
      raise Exception.Create('Unknown scroll mode');
  end;
end;


function EditorSelectToken(Ed: TSyntaxMemo; SkipQuotes: boolean = false): boolean;
var
  n, nStart, nLen: integer;
  t: TSyntToken;
begin
  Result:= false;
  if Ed.SyntObj=nil then Exit;

  n:= Ed.SyntObj.TokenAtPos(Ed.CaretStrPos);
  if n<0 then Exit;

  t:= Ed.SyntObj.Tags[n];
  if t=nil then Exit;

  nStart:= t.StartPos;
  nLen:= t.EndPos - t.StartPos;
  if (nStart<0) or (nLen<=0) then Exit;

  if SkipQuotes then
  begin
    //skip ending quotes
    while (nLen>0) and IsQuoteChar(Ed.Lines.Chars[nStart+nLen]) do
      Dec(nLen);
    //skip starting quotes
    while (nLen>0) and IsQuoteChar(Ed.Lines.Chars[nStart+1]) do
    begin
      Inc(nStart);
      Dec(nLen);
    end;
  end;

  Ed.SetSelection(nStart, nLen);
  Result:= true;
end;


procedure EditorFoldLevel(Ed: TSyntaxMemo; NLevel: Integer);
var
  An: TClientSyntAnalyzer;
  i: Integer;
begin
  An:= Ed.SyntObj;
  if An=nil then Exit;

  Ed.BeginUpdate;
  try
    Ed.FullExpand;
    for i:= 0 to An.RangeCount-1 do
      if An.Ranges[i].Level > NLevel then
        Ed.CollapseRange(An.Ranges[i]);
  finally
    Ed.EndUpdate;
  end;
end;

function EditorCurrentLexerHasTemplates(Ed: TSyntaxMemo): boolean;
begin
  Result:= false;
  if Assigned(Ed) and
     Assigned(Ed.SyntObj) and
     Assigned(Ed.SyntObj.AnalyzerAtPos(Ed.CaretStrPos)) then
    Result:= Ed.SyntObj.AnalyzerAtPos(Ed.CaretStrPos).CodeTemplates.Count > 0;
end;

function EditorCurrentLexerForPos(Ed: TSyntaxMemo; NPos: integer): string;
var
  An: TSyntAnalyzer;
begin
  Result:= '';
  if Assigned(Ed) and Assigned(Ed.SyntObj) then
  begin
    An:= Ed.SyntObj.AnalyzerAtPos(NPos);
    if An<>nil then
      Result:= An.LexerName;
  end;
end;


function EditorTokenString(Ed: TSyntaxMemo; TokenIndex: Integer): Widestring;
begin
  Result:= '';
  if Ed.SyntObj<>nil then
    with Ed.SyntObj do
      Result:= TagStr[TokenIndex];
end;

function EditorTokenFullString(Ed: TSyntaxMemo; TokenIndex: Integer; IsDotNeeded: boolean): Widestring;
var
  i: Integer;
begin
  Result:= '';
  if Ed.SyntObj<>nil then
    with Ed.SyntObj do
    begin
      Result:= TagStr[TokenIndex];

      //add lefter tokens
      //(needed for complex id.id.id, e.g. for C#)
      i:= TokenIndex;
      while (i-2>=0) do
      begin
        if not ((TagStr[i-1]='.') and IsDotNeeded) then
          Break;
        Insert(TagStr[i-2]+TagStr[i-1], Result, 1);
        Dec(i, 2);
      end;

      //add righter tokens
      i:= TokenIndex;
      while (i+2<=TagCount-1) do
      begin
        if not ((TagStr[i+1]='.') and IsDotNeeded) then
          Break;
        Result:= Result+TagStr[i+1]+TagStr[i+2];
        Inc(i, 2);
      end;
    end;
end;

procedure EditorExtendSelectionByPosition(
  Ed: TSyntaxMemo;
  AOldStart, AOldLength,
  ANewStart, ANewLength: integer);
var
  AOldEnd, ANewEnd: integer;
begin
  AOldEnd:= AOldStart+AOldLength;
  ANewEnd:= ANewStart+ANewLength;
  ANewStart:= Min(AOldStart, ANewStart);
  ANewEnd:= Max(AOldEnd, ANewEnd);
  ANewLength:= ANewEnd-ANewStart;
  Ed.SetSelection(ANewStart, ANewLength, true);
end;


procedure EditorFillBlockRect(Ed: TSyntaxMemo; SData: Widestring; bKeep: boolean);
var
  R: TRect;
  s: Widestring;
  OldCaret: TPoint;
  nLen, i: Integer;
begin
  with Ed do
  begin
    if not HaveSelection then Exit;
    if SelectMode<>msColumn then Exit;
    
    R:= SelRect;
    OldCaret:= CaretPos;
    if bKeep then
    begin
      if Length(sData) > R.Right - R.Left then
        SetLength(sData, R.Right - R.Left);
      nLen:= Length(sData);
    end
    else
      nLen:= R.Right - R.Left;

    BeginUpdate;
    try
      for i:= R.Top to R.Bottom do
      begin
        s:= Lines[i];

        //expand tabs to spaces
        if Pos(#9, s)>0 then
        begin
          s:= SUntab(s, EditorTabSize(Ed));
          EditorReplaceLine(Ed, i, s, true{ForceUndo});
        end;

        //fill line tail with spaces
        if Length(s)<R.Right then
        begin
          CaretPos:= Point(Length(s), i);
          InsertText(StringOfChar(' ', R.Right-Length(s)));
        end;

        //replace block line
        ReplaceText(
          CaretPosToStrPos(Point(R.Left, i)),
          nLen, sData);
      end;

      if bKeep then
        nLen:= R.Right - R.Left
      else
        nLen:= Length(sData);

      CaretPos:= Point(R.Left + nLen, OldCaret.Y);
      SelRect:= Rect(R.Left, R.Top, R.Left + nLen, R.Bottom);
    finally
      EndUpdate;
    end;
  end;
end;

function EditorEOL(Ed: TCustomSyntaxMemo): Widestring;
begin
  case Ed.Lines.TextFormat of
    tfCR: Result:= #13;
    tfNL: Result:= #10;
    else Result:= #13#10;
  end;
end;

//s1 - comment start mark
//s2 - comment end mark
//CmtMLine - need to place comment marks on separate lines
procedure EditorToggleStreamComment(Ed: TSyntaxMemo; s1, s2: string; CmtMLine: boolean);
var
  n, nLen: Integer;
  Uncomm: boolean;
  sCR: string;
begin
  with Ed do
    begin
      //msginfo(s1+#13+s2);
      n:= SelStart;
      nLen:= SelLength;
      SetSelection(n, 0);

      if CmtMLine then
        Uncomm:= false
      else
        Uncomm:= (Copy(Lines.FText, n+1, Length(s1)) = s1) and
               (Copy(Lines.FText, n+nLen-Length(s2)+1, Length(s2)) = s2);
      if not Uncomm then
      begin
        //do comment
        if CmtMLine then
        begin
          sCR:= EditorEOL(Ed);
          if (n-Length(sCR)>=0) and
            (Copy(Lines.FText, n-Length(sCR)+1, Length(sCR)) = sCR) then
            s1:= s1+sCR
          else
            s1:= sCR+s1+sCR;
          if Copy(Lines.FText, n+nLen-Length(sCR)+1, Length(sCR)) = sCR then
            s2:= s2+sCR
          else
            s2:= sCR+s2+sCR;
        end;
        BeginUpdate;
        try
          CaretStrPos:= n;
          InsertText(s1);
          CaretStrPos:= n+nLen+Length(s1);
          InsertText(s2);
        finally
          EndUpdate;
        end;
      end
      else
      begin
        //do uncomment
        BeginUpdate;
        try
          CaretStrPos:= n+nLen-Length(s2);
          DeleteText(Length(s2));
          CaretStrPos:= n;
          DeleteText(Length(s1));
        finally
          EndUpdate;
        end;
      end;
    end;
end;


function EditorDeleteSelectedLines(Ed: TSyntaxMemo): Integer;
var
  i, Ln1, Ln2, NCol, NScroll: Integer;
begin
  Result:= 0;
  if Ed.ReadOnly then Exit;

  EditorGetSelLines(Ed, Ln1, Ln2);
  if Ln1=Ln2 then
  begin
    NCol:= Ed.CaretPos.X;
    NScroll:= Ed.ScrollPosX;
  end
  else
  begin
    NCol:= 0;
    NScroll:= 0;
  end;  

  Ed.BeginUpdate;
  try
    for i:= Ln2 downto Ln1 do
    begin
      EditorDeleteLine(ed, i, true{ForceUndo});
      Inc(Result);
    end;
    Ed.CaretPos:= Point(NCol, Ln1);
    Ed.ScrollPosX:= NScroll;
  finally
    Ed.EndUpdate;
  end;
end;


procedure EditorCenterSelectedLines(Ed: TSyntaxMemo);
var
  Ln1, Ln2, i: Integer;
  s: Widestring;
begin
  with Ed do
    if (not ReadOnly) and (Lines.Count>0) then
    begin
      EditorGetSelLines(Ed, Ln1, Ln2);
      Ed.BeginUpdate;
      try
        for i:= Ln1 to Ln2 do
        begin
          s:= Trim(Lines[i]);
          if Length(s)<RightMargin then
          begin
            s:= StringOfChar(' ', (RightMargin-Length(s)) div 2) + s;
            EditorReplaceLine(Ed, i, s, true{ForceUndo});
          end;
        end;
      finally
        Ed.EndUpdate;
      end;
    end;
end;


procedure EditorExtendSelectionByOneLine(Ed: TSyntaxMemo);
var
  r: TRect;
  p: TPoint;
  n1, n2: Integer;
begin
  if Ed.HaveSelection then
  begin
    case Ed.SelectMode of
      msColumn:
        begin
          r:= Ed.SelRect;
          Inc(r.Bottom);
          Ed.CaretPos:= Point(r.Right, r.Bottom);
          Ed.SelRect:= r;
        end;
      else
        begin
          n1:= Ed.SelStart;
          n2:= Ed.SelStart+Ed.SelLength;
          p:= Ed.StrPosToCaretPos(n2);
          p.X:= 0;
          Inc(p.Y);
          n2:= Ed.CaretPosToStrPos(p);
          Ed.SetSelection(n1, n2-n1);
        end;
    end;
  end
  else
  begin
    Ed.CaretPos:= Point(0, Ed.CaretPos.Y);
    Ed.ExecCommand(smSelDown);
  end;
end;

//this one mimics ST2 more. above one is more handy.
procedure EditorExtendSelectionByOneLine_Prev(Ed: TSyntaxMemo);
var
  DoNext: boolean;
  NStart, NEnd: Integer;
begin
  NStart:= Ed.SelStart;
  NEnd:= Ed.SelStart+Ed.SelLength;

  DoNext:=
    (Ed.SelLength>0) and
    (Ed.CaretStrPos = NEnd) and
    (Ed.StrPosToCaretPos(NStart).X = 0) and
    ((Ed.StrPosToCaretPos(NEnd).X = 0) or (NEnd = Ed.TextLength));

  if not DoNext then
  begin
    Ed.ResetSelection;
    Ed.ExecCommand(smLineStart);
  end;
  Ed.ExecCommand(smSelDown);
end;


procedure EditorScrollToSelection(Ed: TSyntaxMemo; NSearchOffsetY: Integer);
var
  Save: TSynSelSave;
begin
  with Ed do
    if HaveSelection then
    begin
      EditorSaveSel(Ed, Save);
      if SelLength>0 then
        CaretStrPos:= SelStart
      else
        CaretPos:= Point(SelRect.Left, SelRect.Top);
      EditorCenterPos(Ed, true{GotoMode}, NSearchOffsetY);
      EditorRestoreSel(Ed, Save);
    end;
end;


procedure EditorExtendSelectionByLexer_All(Ed: TSyntaxMemo; var Err: string);
var
  An: TClientSyntAnalyzer;
  R: TTextRange;
  SelSave: TSynSelSave;
  EndPos: Integer;
begin
  Err:= '';
  An:= Ed.SyntObj;
  if An=nil then
    begin Err:= 'No lexer active'; Exit end;

  EditorSaveSel(Ed, SelSave);

  //if selection is made, it may be selection from prev ExtendSel call,
  //so need to increment caret pos, to extend selection further
  if Ed.HaveSelection then
  begin
    Ed.ResetSelection;
    Ed.CaretStrPos:= Ed.CaretStrPos+2;
  end;

  R:= An.NearestRangeAtPos(Ed.CaretStrPos);
  if (R=nil) or not R.IsClosed then
  begin
    Err:= 'Extend selection: no range at caret';
    EditorRestoreSel(Ed, SelSave);
    Exit
  end;

  EndPos:= R.EndIdx;
  if not ((EndPos>=0) and (EndPos<An.TagCount)) then
  begin
    Err:= 'Extend selection: no closed range';
    Exit
  end;

  EndPos:= An.Tags[EndPos].EndPos;
  Ed.SetSelection(R.StartPos, EndPos-R.StartPos);
end;


procedure EditorExtendSelectionByLexer_HTML(Ed: TSyntaxMemo);
var
  An: TClientSyntAnalyzer;
  i, StPos, EndPos, NCaret: Integer;
begin
  An:= Ed.SyntObj;
  if An=nil then Exit;

  NCaret:= Ed.CaretStrPos;
  for i:= An.RangeCount-1 downto 0 do
  begin
    //get StPos start of range, EndPos end of range
    StPos:= An.Ranges[i].StartPos;
    EndPos:= An.Ranges[i].EndIdx;
    if EndPos<0 then Continue;
    EndPos:= An.Tags[EndPos].EndPos;

    //take only range, which starts before NCaret, and ends after NCaret
    if (StPos<NCaret) and (EndPos>=NCaret) then
      //and not range which is from "<" to ">" - this is just tag
      if not (Ed.Lines.Chars[StPos+1]='<') then
      begin
        //correct StPos, EndPos coz they don't include "<" and ">" in HTML
        Dec(StPos);
        Inc(EndPos);
        Ed.SetSelection(StPos, EndPos-StPos);
        Break
      end;
  end;
end;


//modified function SysUtils.WrapText from Delphi, got it somewhere
function SWrapText(const S, SInsertBreak, SSeparators, SEol: WideString;
  NTabSize, NMaxCol: Integer): WideString;
var
  NCol, NPos: Integer;
  LinePos, LineLen: Integer;
  BreakLen, BreakPos: Integer;
  QuoteChar, CurChar: WideChar;
  ExistingBreak: Boolean;
begin
  NCol := 1;
  NPos := 1;
  LinePos := 1;
  BreakPos := 0;
  QuoteChar := #0;
  ExistingBreak := False;
  LineLen := Length(S);
  BreakLen := Length(SInsertBreak);
  Result := '';
  while NPos <= LineLen do
  begin
    CurChar := S[NPos];
    if CurChar = #9 then
      Inc(NCol, NTabSize - 1)
    else  
    begin
    if IsQuoteChar(CurChar) then
      if QuoteChar = #0 then
        QuoteChar := CurChar
      else if CurChar = QuoteChar then
        QuoteChar := #0;
    if QuoteChar = #0 then
    begin
      if CurChar = SInsertBreak[1] then
      begin
        ExistingBreak := WStrLComp(PWChar(SInsertBreak), PWChar(@S[NPos]), BreakLen) = 0;
        if ExistingBreak then
        begin
          Inc(NPos, BreakLen-1);
          BreakPos := NPos;
        end;
      end;

      if not ExistingBreak then
        if System.Pos(CurChar, SSeparators)>0 then
          BreakPos := NPos;
      end;
    end;

    Inc(NPos);
    Inc(NCol);

    if not (IsQuoteChar(QuoteChar)) and (ExistingBreak or
      ((NCol > NMaxCol) and (BreakPos > LinePos))) then
    begin
      NCol := 1;
      Result := Result + Copy(S, LinePos, BreakPos - LinePos + 1);
      if not IsQuoteChar(CurChar) then
      begin
        while NPos <= LineLen do
        begin
          if System.Pos(S[NPos], SSeparators)>0 then
          begin
            Inc(NPos);
            ExistingBreak := False;
          end
          else
          begin
            if WStrLComp(PWChar(@S[NPos]), PWChar(SEol), Length(SEol)) = 0 then
            begin
              Inc(NPos, Length(SEol));
              ExistingBreak := True;
            end
            else
              Break;
          end;
        end;
      end;
      if (NPos <= LineLen) and not ExistingBreak then
        Result := Result + SInsertBreak;

      Inc(BreakPos);
      LinePos := BreakPos;
      NPos := LinePos;
      ExistingBreak := False;
    end;
  end;
  Result := Result + Copy(S, LinePos, MaxInt);
end;

procedure EditorSplitLinesByPosition(Ed: TSyntaxMemo; nCol: Integer);
var
  Ln1, Ln2, i: Integer;
  s, sCR: Widestring;
  nTabSize: Integer;
begin
  if Ed.ReadOnly then Exit;
  EditorGetSelLines(Ed, Ln1, Ln2);
  sCR:= EditorEOL(Ed);
  nTabSize:= EditorTabSize(Ed);

  Ed.BeginUpdate;
  try
    for i:= Ln2 downto Ln1 do
    begin
      //WideWrapText is bad in Tnt Controls, doesn't count leading line spaces
      s:= SWrapText(Ed.Lines[i], sCR, ' -+'#9, sCR, nTabSize, nCol);

      EditorReplaceLine(Ed, i, s, true{Undo});
    end;
  finally
    Ed.EndUpdate;
  end;
end;

procedure EditorInsertTextData(Ed: TSyntaxMemo; const Data: TSynEditorInsertData);
var
  iFrom, iTo, iCnt, i, n: Integer;
  IsSel: boolean;
  S: Widestring;
begin
  if Ed.ReadOnly then Exit;
  EditorGetSelLines(Ed, iFrom, iTo);
  IsSel:= iTo > iFrom;

  with Ed do
  with Data do
  begin
    BeginUpdate;
    ResetSelection;
    try
      iCnt:= 0;
      if not IsSel then
      begin
        //----counter times inserting
        for i:= 1 to NCounter do
        begin
          case InsMode of
            mTxt: S:= SText1 + SText2;
            mBul: S:= WideString(#$2022) + ' ';
            mNum: S:= NBegin + SFormatNum(NStart+i-1, NDigits) + NTail;
            else S:= '';
          end;//case
          InsertText(
            StringOfChar(' ', InsCol-1)
            + S + EditorEOL(Ed));
        end;
      end
      else
      //----insert into selection
      for i:= iFrom to iTo do
      begin
        if (Lines[i]='') and SkipEmpty then
          Continue;
        Inc(iCnt);

        //Put caret
        case InsPos of
          pCol:
            begin
              CaretPos:= Point(InsCol-1, i);
              //handle "Keep caret in text"
              if soKeepCaretInText in Ed.Options then
                if CaretPos.X<InsCol-1 then
                  InsertText(StringOfChar(' ', (InsCol-1)-CaretPos.X));
            end;
          pAfterSp:
            begin
              CaretPos:= Point(SNumLeadSpaces(Lines[i]), i);
            end;
          else
            begin
              n:= Pos(InsStrAfter, Lines[i]);
              if n=0 then Continue;
              CaretPos:= Point(n-1+Length(InsStrAfter), i);
            end;
        end;

        case InsMode of
        //Text
        mTxt:
          begin
            if SText1<>'' then
            begin
              InsertText(SText1);
            end;
            if SText2<>'' then
            begin
              CaretPos:= Point(Length(Lines[i]), i);
              InsertText(SText2);
            end;
          end;
        //Bullets
        mBul:
          begin
            InsertText(WideString(#$2022) + ' ');
          end;
        //Nums
        mNum:
          begin
            s:= NBegin + SFormatNum(NStart+iCnt-1, NDigits) + NTail;
            InsertText(s);
          end;
        end;//case
      end;
    finally
      EndUpdate;
    end;
  end;
end;


procedure FixLineEnds(var S: Widestring; ATextFormat: TTextFormat);
begin
  case ATextFormat of
    tfCR: ReplaceStr(S, #13#10, #13);
    tfNL: ReplaceStr(S, #13#10, #10);
  end;
end;


procedure EditorPasteAndSelect(Ed: TSyntaxMemo);
var
  ins_text: Widestring;
  NStart, NLen: Integer;
begin
  if Ed.ReadOnly then Exit;
  if not Clipboard.HasFormat(CF_TEXT) then Exit;

  //column block?
  if (GetClipboardBlockType <> 2) then
  begin
    //part copied from ecSyntMemo.PasteFromClipboard
    //yes, not DRY
    if soSmartPaste in Ed.OptionsEx then
      ins_text:= GetClipboardTextEx(Ed.Charset)
    else
      ins_text:= GetClipboardText(Ed.Charset);
      
    FixLineEnds(ins_text, Ed.Lines.TextFormat);

    Ed.InsertText(''); //fix CaretStrPos when caret is after EOL
    NStart:= Ed.CaretStrPos;
    NLen:= Length(ins_text);

    Ed.InsertText(ins_text);
    Ed.SetSelection(NStart, NLen);
  end
  else
    Ed.PasteFromClipboard();
end;


procedure EditorInsertBlankLineAboveOrBelow(Ed: TSyntaxMemo; ABelow: boolean);
var
  p: TPoint;
  nX: Integer;
begin
  if Ed.ReadOnly then Exit;
  p:= Ed.CaretPos;
  nX:= Ed.ScrollPosX;
  if ABelow then
  begin
    if Ed.CaretPos.Y < Ed.Lines.Count-1 then
    begin
      Ed.CaretPos:= Point(0, Ed.CaretPos.Y+1);
      Ed.InsertNewLine(0, true{DoNotMoveCaret}, false);
    end
    else
    begin
      Ed.ExecCommand(smEditorBottom);
      Ed.InsertNewLine(0, false{DoNotMoveCaret}, false);
    end;
  end
  else
  begin
    Ed.CaretPos:= Point(0, Ed.CaretPos.Y);
    Ed.InsertNewLine(0, true{DoNotMoveCaret}, false);
  end;
  //restore caret X
  Ed.CaretPos:= Point(p.X, Ed.CaretPos.Y);
  Ed.ScrollPosX:= nX;
end;


procedure EditorDoHomeKey(Ed: TSyntaxMemo);
//do Eclipse/Sublime-like jump by Home key
var
  p: TPoint;
  s: Widestring;
  NIndent: Integer;
begin
  p:= Ed.CaretPos;
  if (p.Y>=0) and (p.Y<Ed.Lines.Count) then
  begin
    s:= Ed.Lines[p.Y];
    NIndent:= Length(SIndentOf(s));
    if p.X = NIndent then
      p.X:= 0
    else
      p.X:= NIndent;
    Ed.CaretPos:= p;
  end;
end;


procedure EditorChangeBlockCase(Ed: TSyntaxMemo; Cmd: TChangeCase);
var
  Sel: TSynSelSave;
  en: boolean;
begin
  EditorSaveSel(Ed, Sel);
  en:= true;
  //select current word, if no selection
  if not Ed.HaveSelection then
    en:= EditorSelectWord(Ed);
  //change case
  if en then
  begin
    Ed.SelChangeCase(Cmd);
    //EditorSetModified(Ed);
  end;
  EditorRestoreSel(Ed, Sel);
end;

procedure EditorIndentBlock(Ed: TSyntaxMemo; shift: boolean);
var
  p, pp: TPoint;
  n, i, Ln1, Ln2: integer;
  R: TRect;
  spaces: string;
begin
  if not Ed.HaveSelection then Exit;
  if Ed.SelLength>0 then
  begin
    if Shift then
      n:= Ed.BlockIndent
    else
      n:= -Ed.BlockIndent;
    p:= Ed.StrPosToCaretPos(Ed.SelStart);
    Ed.ShiftSelection(n, not (soUnindentKeepAlign in Ed.Options));
    pp:= Ed.StrPosToCaretPos(Ed.SelStart+Ed.SelLength);
    Ed.SelStart:= Ed.CaretPosToStrPos(p);
    Ed.SelLength:= Ed.CaretPosToStrPos(pp)-Ed.SelStart;
  end
  else
  begin
    //Selrect.Left incorrect for Tabs present at line begin.
    //so bug like EC's
    n:= Ed.SelRect.Left;
    Ln1:= Ed.SelRect.Top;
    Ln2:= Ed.SelRect.Bottom;
    R:= Ed.SelRect;
    p:= Ed.CaretPos;
    spaces:= StringOfChar(' ', Ed.BlockIndent);

    Ed.BeginUpdate;
    for i:= Ln1 to Ln2 do
    begin
      Ed.CaretPos:= Point(n, i);
      Ed.InsertText(spaces);
    end;
    Ed.EndUpdate;

    Ed.CaretPos:= p;
    Ed.SelRect:= R;
  end;
end;


procedure EditorKeepCaretOnScreen(Ed: TSyntaxMemo);
var
  p: TPoint;
  n: Integer;
begin
  with Ed do
  begin
    p:= CaretPos;
    n:= TopLine + 1;
    if p.Y < n then
      CaretPos:= Point(p.X, n) else
    begin
      n:= TopLine + VisibleLines - 2;
      if p.Y > n then
        CaretPos:= Point(p.X, n);
    end;
  end;  
end;

function EditorToggleSyncEditing(Ed: TSyntaxMemo): boolean;
begin
  Result:= true;
  with Ed do
    if SyncEditing.Count>0 then
    begin
      SyncEditing.Clear;
      Invalidate;
    end
    else
    begin
      if SelLength>0 then
      begin
        SyncEditing.Clear;
        SyncEditing.AddCurSelection;
        SyncEditing.Enabled:= true;
      end
      else
        Result:= false;
    end;
end;


//do like Delphi: move caret down after
procedure EditorCommentUncommentLines(Ed: TSyntaxMemo; AComment: boolean);
var
  sel: boolean;
begin
  with Ed do
  begin
    sel:= HaveSelection;
    LineComments(AComment);
    if not sel then
      ExecCommand(smDown);
  end;
end;

procedure EditorMoveCaretByNChars(Ed: TSyntaxMemo; DX, DY: Integer);
begin
  with Ed do
    if DY <> 0 then
      CaretPos:= Point(CaretPos.X, CaretPos.Y + DY)
    else
      //need to goto next/prev line if at edge
      CaretStrPos:= CaretStrPos + DX;
end;

procedure EditorCopyOrCutCurrentLine(Ed: TSyntaxMemo; ACut: boolean);
begin
  with Ed do
    if CaretPos.Y < Lines.Count then
    begin
      TntClipboard.AsWideText:= Lines[CaretPos.Y] + sLineBreak;
      if ACut then
        ExecCommand(smDeleteLine);
    end;
end;

procedure EditorCopyAsHtml(Ed: TSyntaxMemo);
var
  Exp: THTMLSyntExport;
begin
  Exp:= THTMLSyntExport.Create(nil);
  try
    Exp.SyntMemo:= Ed;
    Exp.ExportType:= etSelection;
    Exp.SaveToClipboard;
  finally
    FreeAndNil(Exp);
  end;
end;

procedure EditorCopyAsRtf(Ed: TSyntaxMemo);
var
  Exp: TRtfSyntExport;
begin
  Exp:= TRtfSyntExport.Create(nil);
  try
    Exp.SyntMemo:= Ed;
    Exp.ExportType:= etSelection;
    Exp.SaveToClipboard;
  finally
    FreeAndNil(Exp);
  end;
end;

procedure EditorCopyOrCutAndAppend(Ed: TSyntaxMemo; ACut: boolean);
begin
  with TntClipboard do
    AsWideText:= AsWideText + Ed.SelText;
  if ACut then
    Ed.ClearSelection;
end;

procedure EditorJoinLines(Ed: TSyntaxMemo);
var
  Ln1, Ln2, i: Integer;
  S, SEol: Widestring;
begin
  if Ed.ReadOnly then Exit;
  with Ed do
    if HaveSelection then
    begin
      EditorGetSelLines(Ed, Ln1, Ln2);
      if Ln2=Ln1 then Exit;

      S:= '';
      SEol:= EditorEOL(Ed);
      for i:= Ln1 to Ln2 do
        S:= S + Lines[i] + IfThen(i<Ln2, ' ', SEol);

      BeginUpdate;
      try
        SelectLines(Ln1, Ln2);
        ClearSelection;
        CaretPos:= Point(0, Ln1);
        InsertText(S);
      finally
        EndUpdate;
      end;    
    end;
end;

procedure EditorJoinLines_Prev(Ed: TSyntaxMemo);
var
  s: Widestring;
  nPos, nLen, i, i1: Integer;
begin
  with Ed do
  if SelLength>0 then
  begin
    s:= SelText;
    nLen:= Length(s);
    nPos:= SelStart;

    repeat
      //find CR/LF
      i1:= 0;
      for i:= 1 to Length(s) do
        if IsLineBreakChar(s[i]) then
          begin i1:= i; Break end;
      if i1=0 then Break;
      //delete CR/LF's here
      i:= i1;
      while (i<=Length(s)) and IsLineBreakChar(s[i]) do
        Delete(s, i, 1);
      //if spaces at this pos, continue
      if (i-1>0) and (i-1<=Length(s)) and IsSpaceChar(s[i-1]) then Continue;
      if (i>0) and (i<=Length(s)) and IsSpaceChar(s[i]) then Continue;
      //insert space
      Insert(' ', s, i);
    until false;
    
    CaretStrPos:= nPos;
    DeleteText(nLen);
    InsertText(s);
  end;
end;


procedure EditorPasteNoCaretChange(Ed: TSyntaxMemo);
var
  NPos: TPoint;
  NLine: Integer;
begin
  with Ed do
    if not ReadOnly then
    begin
      NPos:= CaretPos;
      NLine:= TopLine;
      ExecCommand(smPaste);
      CaretPos:= NPos;
      TopLine:= NLine;
    end;
end;

procedure EditorPasteToFirstColumn(Ed: TSyntaxMemo);
var
  P: TPoint;
begin
  with Ed do
  begin
    P:= CaretPos;
    CaretPos:= Point(0, P.Y);
    PasteFromClipboard;
    CaretPos:= Point(P.X, CaretPos.Y);
  end;
end;

procedure EditorDeleteToFileBegin(Ed: TSyntaxMemo);
var
  NCaret: Integer;
begin
  with Ed do
    if not ReadOnly then
    begin
      NCaret:= CaretStrPos;
      CaretStrPos:= 0;
      DeleteText(NCaret);
    end;
end;

procedure EditorDeleteToFileEnd(Ed: TSyntaxMemo);
begin
  with Ed do
    if not ReadOnly then
      DeleteText(TextLength);
end;


function EditorAutoCloseBracket(Ed: TSyntaxMemo; ch: Widechar;
  opAutoCloseBrackets, opAutoCloseQuotes, opAutoCloseBracketsNoEsc: boolean): boolean;
var
  ch2: Widechar;
  NStart, NLen: Integer;
begin
  Result:= false;
  if Ed.ReadOnly then Exit;
  NStart:= Ed.CaretStrPos;

  //options enabled?
  if IsBracketChar(ch) and not opAutoCloseBrackets then Exit;
  if IsQuoteChar(ch) and not opAutoCloseQuotes then Exit;

  //bracket is escaped?
  if opAutoCloseBracketsNoEsc then
    if (NStart>0) and (Ed.Lines.Chars[NStart]='\') then Exit;

  //closing bracket is already under caret?
  if (Pos(ch, ')]}')>0) then
    if Ed.Lines.Chars[NStart+1]=ch then
    begin
      //right 1 char
      Ed.CaretPos:= Point(Ed.CaretPos.X+1, Ed.CaretPos.Y);
      Result:= true;
      Exit
    end;

  case ch of
    '(': ch2:= ')';
    '[': ch2:= ']';
    '{': ch2:= '}';
    '"',
    '''': ch2:= ch;
    else Exit
  end;

  if Ed.SelLength=0 then
  //simply input start+end brackets
  begin
    Ed.InsertText(WideString(ch)+WideString(ch2));
    Ed.CaretStrPos:= Ed.CaretStrPos-1;
  end
  else
  //code to wrap selection with brackets
  begin
    Ed.BeginUpdate;
    try
      NStart:= Ed.SelStart;
      NLen:= Ed.SelLength;
      Ed.ResetSelection;
      Ed.CaretStrPos:= NStart+NLen;
      Ed.InsertText(ch2);
      Ed.CaretStrPos:= NStart;
      Ed.InsertText(ch);
      Ed.SetSelection(NStart+1, NLen);
    finally
      Ed.EndUpdate;
    end;
  end;

  Result:= true;
end;


function EditorGetBookmarksAsString(Ed: TSyntaxMemo): string;
const
  cMaxItems = 200;
var
  i, NIndex: Integer;
begin
  Result:= '';
  with Ed.BookmarkObj do
    for i:= 0 to Min(Count, cMaxItems) - 1 do
    begin
      //don't read bookmarks from SynLint (hint begins with "!")
      if SBegin(Items[i].Hint, '!') then Continue;

      NIndex:= Items[i].BmIndex;
      Result:= Result +
        IfThen(NIndex < 10, ':'+IntToStr(NIndex)+':') +
        IntToStr(Items[i].Position) + ',';
    end;
end;


procedure EditorSetBookmarksAsString(Ed: TSyntaxMemo; const Str: string);
var
  S, SItem: Widestring;
  NIndexCount, NIndexThis, NPos: Integer;
begin
  Ed.ClearBookmarks;
  NIndexCount:= 10; //minimal BmIndex for unnumbered bookmarks is 10
  S:= Str;

  repeat
    SItem:= SGetItem(S, ',');
    if SItem='' then Break;

    //'NNN' for unnumbered bkmk, or ':N:NNN' for numbered bkmk
    if (Length(SItem)>3) and (SItem[1]=':') and (SItem[3]=':') then
    begin
      //numbered
      NIndexThis:= StrToIntDef(SItem[2], 0);
      Delete(SItem, 1, 3);
    end
    else
    begin
      //unnumbered
      NIndexThis:= NIndexCount;
      Inc(NIndexCount);
    end;

    NPos:= StrToIntDef(SItem, -1);
    if NPos>=0 then
      Ed.Bookmarks[NIndexThis]:= NPos;
  until false;
end;

procedure EditorSetSelCoordAsString(Ed: TSyntaxMemo; const Str: string);
var
  S: Widestring;
  p1, p2: TPoint;
  n1, n2: Integer;
begin
  Ed.BeginUpdate;
  try
    Ed.ResetSelection;

    S:= Str;
    Ed.SelectMode:= TSyntSelectionMode(StrToIntDef(SGetItem(S), 0));
    p1.X:= StrToIntDef(SGetItem(S), 0);
    p1.Y:= StrToIntDef(SGetItem(S), 0);
    p2.X:= StrToIntDef(SGetItem(S), 0);
    p2.Y:= StrToIntDef(SGetItem(S), 0);
    if (p1.X=0) and (p1.Y=0) and (p2.X=0) and (p2.Y=0) then Exit;

    case Ed.SelectMode of
      msColumn:
        Ed.SelRect:= Rect(p1.X, p1.Y, p2.X, p2.Y);
      msLine:
        Ed.SelectLines(p1.Y, p2.Y-1);
      else
      begin
        n1:= Ed.CaretPosToStrPos(p1);
        n2:= Ed.CaretPosToStrPos(p2);
        Ed.SetSelection(n1, n2-n1);
      end;
    end;
  finally
    Ed.EndUpdate;
  end;
end;

function EditorGetSelCoordAsString(Ed: TSyntaxMemo): string;
var
  p1, p2: TPoint;
  rect: TRect;
  mode: Integer;
begin
  mode:= Ord(Ed.SelectMode);
  p1:= Point(0, 0);
  p2:= Point(0, 0);
  if Ed.HaveSelection then
  begin
    if Ed.SelectMode=msColumn then
    begin
      rect:= Ed.SelRect;
      p1.X:= rect.Left;
      p1.Y:= rect.Top;
      p2.X:= rect.Right;
      p2.Y:= rect.Bottom;
    end
    else
    begin
      p1:= Ed.StrPosToCaretPos(Ed.SelStart);
      p2:= Ed.StrPosToCaretPos(Ed.SelStart+Ed.SelLength);
    end;
  end;
  Result:= Format('%d,%d,%d,%d,%d,', [mode, p1.X, p1.Y, p2.X, p2.Y]);
end;

procedure EditorSelectParagraph(Ed: TSyntaxMemo);
var
  n1, n2: Integer;
begin
  with Ed do
  if Lines.Count>0 then
  begin
    n1:= CaretPos.Y;
    n2:= n1;
    if Trim(Lines[n1])='' then Exit;

    //n2: last para line
    repeat
      Inc(n2);
      if (n2>=Lines.Count) then Break;
      if Trim(Lines[n2])='' then Break;
    until false;
    Dec(n2);

    //n1: first para line
    repeat
      Dec(n1);
      if (n1<0) then Break;
      if Trim(Lines[n1])='' then Break;
    until false;
    Inc(n1);

    n1:= CaretPosToStrPos(Point(0, n1));
    n2:= CaretPosToStrPos(Point(Lines.LineSpace(n2), n2));
    SetSelection(n1, n2-n1);
  end;
end;

procedure EditorSelectOrJumpToWordEnd(Ed: TSyntaxMemo; ASelect: boolean);
var
  wEnd, wStart, n: Integer;
begin
  with Ed do
  begin
    WordRangeAtPos(CaretPos, wStart, wEnd);
    if (wEnd <= wStart) or (wEnd = CaretStrPos) then
    begin
      if ASelect then
        ExecCommand(smSelWordRight)
      else
        ExecCommand(smWordRight);
      Exit
    end;
    n:= SelStart;
    CaretStrPos:= wEnd;
    if ASelect then
      SetSelection(n, wEnd-n);
  end;
end;


procedure EditorFindBrackets(Ed: TSyntaxMemo; var Pos1, Pos2: Integer);
var
  NStart: Integer;
begin
  NStart:= Ed.CaretStrPos;
  SFindBrackets(Ed.Lines.FText, NStart+1, Pos1, Pos2);
  if Pos2=0 then
    SFindBrackets(Ed.Lines.FText, NStart, Pos1, Pos2);
  Dec(Pos1);
  Dec(Pos2);
end;

function EditorFindOpeningBracket(Ed: TSyntaxMemo): Integer;
begin
  with Ed do
    Result:= SFindOpeningBracket(Lines.FText, CaretStrPos+1)-1;
end;

procedure EditorSelectBrackets(Ed: TSyntaxMemo; var FPrevCaretPos: Integer);
  //-----------------
  function DoSel: boolean;
  var
    n1, n2: Integer;
    nn1, nn2: Integer;
  begin
    EditorFindBrackets(Ed, n1, n2);
    Result:= n2>=0;
    if Result then
    begin
      nn1:= Min(n1, n2);
      nn2:= Max(n1, n2);
      Ed.SetSelection(nn1, nn2-nn1+1);
    end;
  end;
  //-----------------
var
  n1, nCaret: Integer;
  nSelStartOld, nSelLenOld: Integer;
  bSelChanged: boolean;
begin
  nCaret:= Ed.CaretStrPos;
  n1:= nCaret;
  if not ((n1>=0) and (n1<Ed.TextLength)) then Exit;
  nSelStartOld:= Ed.SelStart;
  nSelLenOld:= Ed.SelLength;

  if IsBracketChar(Ed.Lines.Chars[n1+1]) then
  begin
    DoSel;
  end
  else
  begin
    n1:= EditorFindOpeningBracket(Ed);
    if n1<0 then Exit;
    Ed.CaretStrPos:= n1;
    if not DoSel then
      Ed.CaretStrPos:= nCaret;
  end;

  bSelChanged:= (Ed.SelLength>0) and
    ((Ed.SelStart<>nSelStartOld) or (Ed.SelLength<>nSelLenOld));
  if bSelChanged then
    FPrevCaretPos:= nCaret
  else
  begin
    Ed.ResetSelection;
    Ed.CaretStrPos:= FPrevCaretPos;
  end;
end;


function EditorJumpBracket(Ed: TSyntaxMemo): boolean;
var
  n1, n2: Integer;
begin
  EditorFindBrackets(Ed, n1, n2);
  Result:= n2>=0;
  if Result then
    Ed.CaretStrPos:= n2;
end;

function EditorJumpRange(Ed: TSyntaxMemo): boolean;
var
  n: Integer;
  BrHere, BrLefter: boolean;
begin
  Result:= true;
  n:= Ed.CaretStrPos;
  BrHere:= IsBracketChar(Ed.Lines.Chars[n+1]);
  BrLefter:= IsBracketChar(Ed.Lines.Chars[n]);

  if BrHere then
  begin
    if not EditorJumpBracket(Ed) then
      Result:= false;
  end
  else
  begin
    //EC jump
    Ed.JumpToMatchDelim;

    //if bracket jump did nothing, try jump for lefter bracket
    if (n = Ed.CaretStrPos) and BrLefter then
    begin
      Ed.CaretStrPos:= n-1;
      if not EditorJumpBracket(Ed) then
        Result:= false;
    end;
  end;
end;


function EditorJumpBlankLine(Ed: TSyntaxMemo; opSrOffsetY: Integer; ANext: boolean): boolean;
var
  n: Integer;
begin
  Result:= false;
  with Ed do
  begin
    n:= CaretPos.Y;
    repeat
      if ANext then Inc(n) else Dec(n);
      if (n<0) or (n>=Lines.Count) then Exit;
      if Trim(Lines[n])='' then Break;
    until false;

    CaretPos:= Point(0, n);
    EditorCenterPos(Ed, true, opSrOffsetY);
    Result:= true;
  end;
end;

procedure EditorJumpSelectionStartEnd(Ed: TSyntaxMemo);
var
  IsStart: boolean;
  NStart, NLen: integer;
begin
  with Ed do
    if SelLength=0 then
      Exit
    else
    begin
      NStart:= SelStart;
      NLen:= SelLength;
      IsStart:= CaretStrPos = NStart;
      if not IsStart then
        CaretStrPos:= NStart
      else
        CaretStrPos:= NStart + NLen;
      SetSelection(NStart, NLen, true{DoNotMovecaret});
    end;
end;


function _CompareNums(P1, P2: Pointer): Integer;
begin
  Result:= Integer(P1)-Integer(P2);
end;

procedure EditorJumpColumnMarker(Ed: TSyntaxMemo; ALeft: boolean);
var
  i, NLen, NPos: Integer;
  L: TList;
  Pos: TPoint;
  Ed2: ATSyntMemo.TSyntaxMemo;
begin
  Ed2:= Ed as ATSyntMemo.TSyntaxMemo;

  Pos:= Ed.CaretPos;
  if Pos.Y >= Ed.Lines.Count then Exit;
  NLen:= Length(Ed.Lines[Pos.Y]);

  L:= TList.Create;
  try
    //allow to jump to home
    L.Add(Pointer(0));

    //allow to jump to right margin
    if Ed.ShowRightMargin then
      L.Add(Pointer(Ed.RightMargin));

    //make sorted markers list
    for i:= Low(Ed2.ColMarkers) to High(Ed2.Colmarkers) do
    begin
      NPos:= Ed2.ColMarkers[i];
      if NPos>0 then
        L.Add(Pointer(NPos));
    end;

    if L.Count<=1 then Exit;
    L.Sort(_CompareNums);

    //allow to jump to EOL too (if line is long)
    if Integer(L[L.Count-1]) < NLen then
      L.Add(Pointer(NLen));

    if ALeft then
    begin
      for i:= L.Count-1 downto 0 do
        if Integer(L[i])<Pos.X then
        begin
          Ed.CaretPos:= Point(Integer(L[i]), Pos.Y);
          Exit
        end;
    end
    else
    begin
      for i:= 0 to L.Count-1 do
        if Integer(L[i])>Pos.X then
        begin
          Ed.CaretPos:= Point(Integer(L[i]), Pos.Y);
          Exit
        end;
    end;
  finally
    FreeAndNil(L)
  end;    
end;

function EditorPasteAsColumnBlock(Ed: TSyntaxMemo): boolean;
begin
  Result:= TntClipboard.HasFormat(CF_TEXT);
  if Result then
    Ed.PasteFromClipboard(true);
end;

function EditorJumpMixedCase(Ed: TSyntaxMemo; ARight: boolean): boolean;
var
  s: Widestring;
  P: Integer;
begin
  Result:= true;
  with Ed do
  begin
    s:= Lines.FText;
    P:= CaretStrPos;
    if s='' then Exit;
    if ARight then
    begin
      if not ((P>=0) and (P<Length(s)) and IsWordChar(s[P+1])) then
        begin Result:= false; Exit end;
      repeat
        if (P+1>Length(s)) or not IsWordChar(s[P+1]) then Break;
        Inc(P);
        if IsUpperChar(s[P+1]) then Break;
      until false;
    end
    else
    begin
      if not ((P>0) and (P<=Length(s)) and IsWordChar(s[P])) then
        begin Result:= false; Exit end;
      repeat
        if (P=0) or not IsWordChar(s[P]) then Break;
        Dec(P);
        if IsUpperChar(s[P+1]) then Break;
      until false;
    end;
    CaretStrPos:= P;
  end;
end;

procedure EditorClearMarkers(Ed: TSyntaxMemo);
begin
  with Ed do
  begin
    Markers.Clear;
    MarkersLen.Clear;
    Invalidate;
  end;
end;

procedure EditorJumpToLastMarker(Ed: TSyntaxMemo);
begin
  with Ed do
    if Markers.Count>0 then
      GotoMarker(TMarker(Markers.Last))
end;

procedure EditorUpdateCaretPosFromMousePos(Ed: TSyntaxMemo);
var
  p: TPoint;
begin
  p:= Mouse.CursorPos;
  p:= Ed.ScreenToClient(p);
  Ed.CaretPos:= Ed.MouseToCaret(p.x, p.y);
end;


function EditorIndentStringForPos(Ed: TSyntaxMemo; PntPos: TPoint): Widestring;
var
  NPos: Integer;
begin
  NPos:= Ed.LinesPosToLog(PntPos).X;
  Result:= StringOfChar(' ', NPos);
  if Ed.TabMode=tmTabChar then
    SReplaceAllW(Result, EditorTabExpansion(Ed), #9);
end;


function SIndentedSnippetString(const StrText, StrSnippet, StrTextEol, StrSnippetEol: Widestring; NStart: Integer): Widestring;
var
  StrIndent: Widestring;
  Decode: TStringDecodeRecW;
  i: Integer;
begin
  StrIndent:= '';
  i:= NStart;
  while (i>1) and not IsLineBreakChar(StrText[i-1]) do
  begin
    Dec(i);
    if StrText[i]=#9 then
      StrIndent:= StrText[i] + StrIndent
    else
      StrIndent:= ' ' + StrIndent;
  end;

  Decode.SFrom:= StrSnippetEol;
  Decode.STo:= StrTextEol + StrIndent;

  Result:= SDecodeW(StrSnippet, Decode);
end;

procedure EditorInsertSnippet(Ed: TSyntaxMemo; const AText, ASelText: Widestring);
var
  NInsertStart: Integer;
  NInsertPos: array[0..100] of Integer;
  NInsertLen: array[0..100] of Integer;
  //
  procedure DoInsPnt(N: Integer);
  var
    NPos, NLenFull, NLenReal: Integer;
  begin
    if NInsertPos[N]>=0 then
    begin
      NLenFull:= NInsertLen[N];
      NLenReal:= LoWord(NLenFull);
      NPos:= NInsertStart + NInsertPos[N] + NLenReal;
      Ed.DropMarker(Ed.StrPosToCaretPos(NPos));
      Ed.CaretStrPos:= NPos;
      Ed.MarkersLen.Add(Pointer(NLenFull));
    end;
  end;
  //
var
  Str, SId, SVal: Widestring;
  Decode: TStringDecodeRecW;
  NStart, NEnd, i: Integer;
  NIdStart, NIdEnd: Integer;
  NMirrorCnt: Integer;
begin
  Decode.SFrom:= #13;
  Decode.STo:= EditorEOL(Ed) + EditorIndentStringForPos(Ed, Ed.CaretPos);
  Str:= SDecodeW(AText, Decode);

  //snippet may have Tabs
  if Ed.TabMode=tmSpaces then
  begin
    SReplaceAllW(Str, #9, EditorTabExpansion(Ed));
  end;  

  for i:= Low(NInsertLen) to High(NInsertLen) do
  begin
    NInsertLen[i]:= -1;
    NInsertPos[i]:= -1;
  end;

  SReplaceAllW(Str, '\\', #1); //replace double-slashes (so only single slashes remain)
  NMirrorCnt:= 9; //first mirrors index is 10
  NStart:= 0;

  //process macros
  repeat
    NStart:= PosEx('${', Str, NStart+1);
    if NStart=0 then Break;

    //skip escaped "$"
    if (NStart>1) and (Str[NStart-1]='\') then
    begin
      Delete(Str, NStart-1, 1);
      Continue;
    end;

    NEnd:= PosEx('}', Str, NStart);
    if NEnd=0 then Continue;

    NIdStart:= NStart+2;
    NIdEnd:= NIdStart;
    while (NIdEnd<=Length(Str)) and IsWordChar(Str[NIdEnd]) do Inc(NIdEnd);
    SVal:= Copy(Str, NIdStart, NEnd-NIdStart);
    SId:= SGetItem(SVal, ':');

    //is tabstop found?
    for i:= 0 to 9 do
      if SId=IntToStr(i) then
      begin
        if NInsertPos[i]>=0 then
        begin
          //mirror tabstop
          Inc(NMirrorCnt);
          if NMirrorCnt<=High(NInsertPos) then
          begin
            NInsertPos[NMirrorCnt]:= NStart-1;
            NInsertLen[NMirrorCnt]:= MakeLong(Length(SVal), i);
          end;
        end
        else
        begin
          //original tabstop
          NInsertPos[i]:= NStart-1;
          NInsertLen[i]:= MakeLong(Length(SVal), i);
        end;
      end;

    if SId='date' then
    begin
      SVal:= FormatDateTime(SVal, Now);
    end;  

    if SId='sel' then
    begin
      SVal:= SIndentedSnippetString(Str, ASelText, EditorEOL(Ed), EditorEOL(Ed), NStart);
    end;

    if SId='cp' then
    begin
      SVal:= SIndentedSnippetString(Str, TntClipboard.AsWideText, EditorEOL(Ed), #13#10, NStart);
    end;

    Delete(Str, NStart, NEnd-NStart+1);
    Insert(SVal, Str, NStart);

    Inc(NStart, Length(SVal)-1); //skip this macro
  until false;

  SReplaceAllW(Str, #1, '\'); //replace #1 to slash

  //insert text
  Ed.BeginUpdate;
  try
    //fix CaretStrPos, for virtual caret pos
    Ed.InsertText('');
    //remember caret pos
    NInsertStart:= Ed.CaretStrPos;
    Ed.InsertText(Str);
  finally
    Ed.EndUpdate;
  end;

  //place markers (0 is last one, place first)
  Ed.Markers.Clear;
  Ed.MarkersLen.Clear;

  for i:= High(NInsertLen) downto 10 do
    DoInsPnt(i);

  DoInsPnt(0);
  for i:= 9 downto 1 do
    DoInsPnt(i);

  if Ed.IsTabstopMode then
    Ed.DoJumpToNextTabstop;

  //update statusbar  
  if Assigned(Ed.OnSelectionChanged) then
    Ed.OnSelectionChanged(Ed);
end;


function EditorGetWordBeforeCaret(Ed: TSyntaxMemo; AllowDot: boolean): Widestring;
var
  N: Integer;
  ch: WideChar;
begin
  Result:= '';
  N:= Ed.CaretStrPos+1;
  //if IsWordChar(Ed.Lines.Chars[N]) then Exit; //don't allow letter after caret
  repeat
    Dec(N);
    ch:= Ed.Lines.Chars[N];
    if IsWordChar(ch) or (ch='$') or (AllowDot and (ch='.')) then
      Insert(ch, Result, 1)
    else
      Break;
  until false;
end;

function EditorGetBottomLineIndex(Ed: TSyntaxMemo): Integer;
begin
  Result:= Ed.MouseToCaret(0, Ed.ClientHeight-1).Y;
end;

procedure EditorSetBookmarkUnnumbered(Ed: TSyntaxMemo;
  NPos, NIcon, NColor: Integer;
  const SHint: string);
const
  cMaxBk = 1*1000*1000;
var
  nIndex, i: Integer;
begin
  //find free bookmark-index
  nIndex:= -1;
  for i:= 10 to cMaxBk do
    if Ed.Bookmarks[i]<0 then
    begin
      nIndex:= i;
      Break;
    end;

  if nIndex<0 then Exit;
  Ed.Bookmarks[nIndex]:= NPos;

  //correct bookmark color and icon
  if (NIcon<0) and (NColor<0) then Exit;
  
  for i:= 0 to Ed.BookmarkObj.Count-1 do
    if Ed.BookmarkObj.Items[i].BmIndex= nIndex then
    begin
      if NIcon>=0 then
        Ed.BookmarkObj.Items[i].ImageIndex:= NIcon;
      if NColor>=0 then
        Ed.BookmarkObj.Items[i].BgColor:= NColor;
      if SHint<>'' then
        Ed.BookmarkObj.Items[i].Hint:= SHint;
      Break
    end;
end;

procedure EditorClearBookmarks(Ed: TSyntaxMemo);
begin
  Ed.BookmarkObj.Clear;
  Ed.Invalidate;
end;

procedure EditorBookmarkCommand(Ed: TSyntaxMemo; NCmd, NPos, NIcon, NColor: Integer; const SHint: string);
begin
  case NCmd of
    0..9:
      begin
        Ed.Bookmarks[NCmd]:= NPos;
        Ed.Invalidate;
      end;
    -1: EditorSetBookmarkUnnumbered(Ed, NPos, NIcon, NColor, SHint);
    -2: EditorClearBookmarks(Ed);
  end;
end;

function EditorMouseCursorOnNumbers(Ed: TSyntaxMemo): boolean;
var
  P: TPoint;
begin
  P:= Mouse.CursorPos;
  P:= Ed.ScreenToClient(P);
  Result:= Ed.LineNumbers.Visible and
    //assume that line-numbers column is 0
    (P.X >= 0) and (P.X < Ed.Gutter.Bands[0].Width);
end;

procedure InitStyleLists;
var
  AListCmt, AListStr: TStringList;
begin
  if FListCommentStyles=nil then
  begin
    FListCommentStyles:= TStringList.Create;
    FListStringStyles:= TStringList.Create;

    with TIniFile.Create(EditorSynLexersCfg) do
    try
      ReadSectionValues('CommentStyles', FListCommentStyles);
      ReadSectionValues('StringStyles', FListStringStyles);
    finally
      Free
    end;

    AListCmt:= TStringList.Create;
    AListStr:= TStringList.Create;
    try
      with TIniFile.Create(EditorSynLexersExCfg) do
      try
        ReadSectionValues('CommentStyles', AListCmt);
        ReadSectionValues('StringStyles', AListStr);
        FListCommentStyles.AddStrings(AListCmt);
        FListStringStyles.AddStrings(AListStr);
      finally
        Free
      end;
    finally
      FreeAndNil(AListStr);
      FreeAndNil(AListCmt);
    end;
  end;
end;


function IsStyleListed(const Style, Lexer: string; List: TStringList): boolean;
var
  Val: string;
begin
  Result:= false;
  if (Style='') or (Lexer='') then Exit;
  Val:= List.Values[Lexer];
  if Val<>'' then
    Result:= IsStringListed(Style, Val);
end;

procedure EditorGetTokenType(Ed: TSyntaxMemo;
  StartPos, EndPos: Integer;
  var IsCmt, IsStr: boolean);
var
  Lexer, Style: string;
begin
  Lexer:= EditorCurrentLexerForPos(Ed, StartPos);
  if Lexer='' then Exit;
  Style:= EditorGetTokenName(Ed, StartPos, EndPos);

  InitStyleLists;

  //we treat empty Style as string, but only for those lexers, which aren't
  //listed in [CommentStyles], [StringStyles]
  if (Style='') and
    (FListCommentStyles.IndexOfName(Lexer)<0) and
    (FListStringStyles.IndexOfName(Lexer)<0) then
  begin
    IsCmt:= false;
    IsStr:= true;
  end
  else
  begin
    IsCmt:= IsStyleListed(Style, Lexer, FListCommentStyles);
    IsStr:= IsStyleListed(Style, Lexer, FListStringStyles);
  end;
end;


procedure EditorGetColorCodeRange(Ed: TSyntaxMemo; var NStart, NEnd: integer; var NColor: integer);
var
  p: TPoint;
  s: ecString;
  wStart, wEnd: integer;
begin
  NColor:= $FFFFFF;
  NStart:= 0;
  NEnd:= 0;
  with Ed do
    if (Lines.Count>0) then
    begin
      s:= Lines.FText;
      p:= CaretPos;
      if (CaretStrPos<Length(s)) and
        (s[CaretStrPos+1]='#') then Inc(p.X);
      WordRangeAtPos(p, wStart, wEnd);

      //needed for fixed ecSyntMemo's WordRangeAtPos
      if (wStart+1<=Length(s)) and (s[wStart+1]='#') then
        Inc(wStart);

      if (wStart>0) and (wStart<=Length(s)) and (s[wStart]='#') and
        (wEnd>wStart) then
      begin
        s:= Copy(s, wStart+1, wEnd-wStart);
        if IsHexColorString(s) then
        begin
          NColor:= SHtmlCodeToColor(s);
          NStart:= wStart-1;
          NEnd:= wEnd;
        end;
      end;
    end;
end;


function DoReadLexersCfg(const ASection, AId: string): string;
begin
  with TIniFile.Create(EditorSynLexersCfg) do
  try
    Result:= ReadString(ASection, AId, '');
  finally
    Free
  end;

  if Result='' then
    with TIniFile.Create(EditorSynLexersExCfg) do
    try
      Result:= ReadString(ASection, AId, '');
    finally
      Free
    end;
end;


procedure EditorInsertColorCode(Ed: TSyntaxMemo; Code: Integer);
var
  wStart, wEnd, NColor: Integer;
  SLexer, SCode, SFormat: string;
begin
  //get color for HTML
  SCode:= SColorToHtmlCode(Code);

  //get color formatted for current lexer
  SLexer:= EditorCurrentLexerForPos(Ed, Ed.CaretStrPos);
  if SLexer<>'' then
    SFormat:= DoReadLexersCfg('ColorValues', SLexer)
  else
    SFormat:= '';
  if SFormat<>'' then
  begin
    SReplace(SFormat, 'rr', IntToHex(GetRValue(Code), 2));
    SReplace(SFormat, 'gg', IntToHex(GetGValue(Code), 2));
    SReplace(SFormat, 'bb', IntToHex(GetBValue(Code), 2));
    SCode:= SFormat;
  end;

  with Ed do
    if not ReadOnly then
    begin
      BeginUpdate;
      try
        EditorGetColorCodeRange(Ed, wStart, wEnd, NColor);
        if (wEnd>wStart) then
        begin
          CaretStrPos:= wStart;
          DeleteText(wEnd-wStart);
        end;
        InsertText(SCode);
      finally
        EndUpdate;
      end;
    end;
end;


function EditorFormatHexCode(Ed: TSyntaxMemo; const SHexCode: string): string;
var
  SLexer, SFormat: string;
begin
  Result:= SHexCode;
  SLexer:= EditorCurrentLexerForPos(Ed, Ed.CaretStrPos);
  if SLexer<>'' then
    SFormat:= DoReadLexersCfg('HexValues', SLexer)
  else
    SFormat:= '';
  if SFormat<>'' then
  begin
    SReplace(SFormat, '{v}', SHexCode);
    if (SFormat<>'') and (SFormat[1] in ['a'..'f', 'A'..'F']) then
      SFormat:= '0'+SFormat;
    Result:= SFormat;
  end
end;


initialization

finalization
  if Assigned(FListCommentStyles) then
    FreeAndNil(FListCommentStyles);
  if Assigned(FListStringStyles) then
    FreeAndNil(FListStringStyles);

end.
