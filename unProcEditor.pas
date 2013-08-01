unit unProcEditor;

interface

uses
  Classes,
  TntClasses,
  Forms,

  ecSyntAnal,
  ecSyntMemo,
  ecMemoStrings;

procedure EditorSearchMarksToList(Ed: TSyntaxmemo; List: TTntStrings);
function EditorSelectedTextForWeb(Ed: TSyntaxMemo): Widestring;

procedure DoEditorSelectToPosition(Ed: TSyntaxMemo; NTo: Integer);
procedure DoCheckDialogOverlapsCaret(Ed: TCustomSyntaxMemo; Form: TForm);
function SyntaxManagerFilesFilter(M: TSyntaxManager; SAllText: Widestring): Widestring;

function EditorWordLength(Ed: TSyntaxMemo): Integer;
procedure EditorSetModified(Ed: TSyntaxMemo);
function EditorShortSelText(Ed: TSyntaxMemo): Widestring;
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
var
  p: TPoint;
begin
  with Ed do
  begin
    BeginUpdate;
    p:= CaretPos;
    InsertText(' ');
    CaretPos:= p;
    DeleteText(1);
    EndUpdate;
  end;
end;

function EditorShortSelText(Ed: TSyntaxMemo): Widestring;
begin
  Result:= Ed.SelText;
  SDeleteFromW(Result, #13);
  SDeleteFromW(Result, #10);
  if Length(Result)>80 then
    SetLength(Result, 80);
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


end.
