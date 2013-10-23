unit unProcEditor;

interface

uses
  Classes,
  TntClasses,
  Types,
  Forms,

  ecSyntAnal,
  ecSyntMemo,
  ecMemoStrings;

procedure EditorDuplicateLine(Ed: TSyntaxMemo);
procedure EditorDeleteLine(Ed: TSyntaxMemo; NLine: integer; AUndo: boolean);
procedure EditorReplaceLine(Ed: TSyntaxMemo; NLine: integer;
  const S: WideString; AUndo: boolean);
procedure EditorAddBookmarksToSortedList(Ed: TSyntaxMemo; L: TList);

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

procedure DoEditorSelectToPosition(Ed: TSyntaxMemo; NTo: Integer);
procedure DoCheckDialogOverlapsCaret(Ed: TCustomSyntaxMemo; Form: TForm);
function SyntaxManagerFilesFilter(M: TSyntaxManager; SAllText: Widestring): Widestring;

function EditorWordLength(Ed: TSyntaxMemo): Integer;
procedure EditorSetModified(Ed: TSyntaxMemo);
function EditorShortSelText(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
function EditorGetCollapsedRanges(Ed: TSyntaxMemo): string;
procedure EditorSetCollapsedRanges(Ed: TSyntaxMemo; S: Widestring);
function EditorTokenName(Ed: TSyntaxMemo; StartPos, EndPos: integer): string;
procedure EditorCommentLinesAlt(Ed: TSyntaxMemo; const sComment: Widestring);

procedure EditorCollapseWithNested(Ed: TSyntaxMemo; Line: Integer);
procedure EditorCollapseParentRange(Ed: TSyntaxMemo; APos: Integer);
procedure EditorUncollapseLine(Ed: TCustomSyntaxMemo; Line: Integer);
function IsEditorLineCollapsed(Ed: TCustomSyntaxMemo; Line: Integer): boolean;

procedure EditorCountWords(L: TSyntMemoStrings; var NWords, NChars: Int64);
procedure EditorCenterPos(Ed: TCustomSyntaxMemo; AGotoMode: boolean; NOffsetY: Integer);

implementation

uses
  Windows,
  Math,
  SysUtils,
  ecStrUtils,
  ecCmdConst,
  ATxSProc;

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

procedure DoEditorSelectToPosition(Ed: TSyntaxMemo; NTo: Integer);
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

procedure DoCheckDialogOverlapsCaret(Ed: TCustomSyntaxMemo; Form: TForm);
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

function SyntaxManagerFilesFilter(M: TSyntaxManager; SAllText: Widestring): Widestring;
  function GetExtStr(const Extentions: string): string;
  var i: integer;
      st: TzStringList;
  begin
    st := TzStringList.Create;
    st.Delimiter := ' ';
    st.DelimitedText := Extentions;
    Result := '';
    for i := 0 to st.Count - 1 do
     if i = 0 then Result := '*.' + st[0]
      else Result := Result + ';*.' + st[i];
    st.Free;
  end;
var
  i, j: integer;
  s: string;
  o: TStringList;
begin
 Result := '';
 o:= TStringList.Create;
 try
   o.Duplicates:= dupIgnore;
   o.Sorted:= True;

   for i := 0 to M.AnalyzerCount - 1 do
    if not M.Analyzers[i].Internal then
      with M.Analyzers[i] do
       o.Add(LexerName);

    for j := 0 to o.Count - 1 do
      for i := 0 to M.AnalyzerCount - 1 do
        if not M.Analyzers[i].Internal then
          with M.Analyzers[i] do
           if LexerName=o[j] then
           begin
            s := GetExtStr(Extentions);
            if s <> '' then
              if Pos('/', s) = 0 then //skip "Makefiles" lexer
                Result := Result + Format('%s (%s)|%1:s|', [LexerName, s]);
           end;
  finally
    FreeAndNil(o);
  end;  

  if SAllText = '' then
    SAllText:= 'All files';
  Result := Result + SAllText + ' (*.*)|*.*';
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

procedure EditorSetModified(Ed: TSyntaxMemo);
const
  S: Widestring = ' ';
var
  p: TPoint;
begin
  with Ed do
  begin
    BeginUpdate;
    try
      p:= CaretPos;
      if HaveSelection then
        ResetSelection;
      InsertText(S);
      CaretPos:= p;
      DeleteText(Length(S));
    finally
      EndUpdate;
    end;
  end;
end;

function EditorShortSelText(Ed: TSyntaxMemo; MaxLen: Integer): Widestring;
begin
  Result:= Ed.SelText;
  SDeleteFromW(Result, #13);
  SDeleteFromW(Result, #10);
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

function EditorTokenName(Ed: TSyntaxMemo; StartPos, EndPos: integer): string;
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
        Invalidate;
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
  ext: TSize;
  w, h: integer;
  dx, dy: integer; //indents from sr result to window edge
begin
  dy:= NOffsetY;
  dx:= dy;
  with Ed do
  begin
    p:= CaretPos;
    ext:= DefTextExt;
    w:= (ClientWidth - IfThen(Gutter.Visible, Gutter.Width)) div ext.cx;
    h:= (ClientHeight - IfThen(HorzRuler.Visible, HorzRuler.Height)) div ext.cy;

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
      if AGotoMode or (SelLength=0) then
      begin
        //center caret
        if (p.X <= ScrollPosX + dx) or
          (p.X >= ScrollPosX + w - dx) then
        ScrollPosX:= p.X - w div 2;
      end
      else
      begin
        //center seltext
        if (StrPosToCaretPos(SelStart).X <= ScrollPosX + dx) or
          (StrPosToCaretPos(SelStart+SelLength).X >= ScrollPosX + w - dx) then
        ScrollPosX:= StrPosToCaretPos(SelStart + SelLength div 2).X - w div 2 + 1;
      end
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
    EditorSetModified(Ed);
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
      p:= CaretPos;
      CaretPos:= Point(0, NLine);
      DeleteText(Lines.LineLength(NLine));
      InsertText(S);
      CaretPos:= p;
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

procedure EditorAddBookmarksToSortedList(Ed: TSyntaxMemo; L: TList);
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

end.
