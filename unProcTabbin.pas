unit unProcTabbin;

interface

procedure SGetTagBounds(const s: Widestring; NCaret: integer;
  var NSt, NLen: integer);
procedure SGetTagStart(const s: Widestring; NCaret: integer;
  var NStart: integer);
function SGetTagRangesStr(const s: Widestring): Widestring;

//SelSt=0: move out of tag
//SelLen may be 0 for empty inner range
procedure SGetTagTabbing(const s: Widestring;
  var SelSt, SelLen: integer);

implementation

uses
  SysUtils,
  Dialogs,
  ecZRegExpr,
  ecStrUtils;

type
  TTagRanges = array[1..20] of record
    OutSt, OutLen,
    InSt, InLen: integer;
  end;

const
  cRE1 = '\s+[\w\-:]+=".*?"'; //get outer part from tag
  cRE2 = '(?<=").*?(?=")'; //get inner part from outer part

//--------------------------
procedure SGetTagStart(const s: Widestring; NCaret: integer;
  var NStart: integer);
var
  i:Integer;
begin
  NStart:= 0;
  if (NCaret=0) then Exit;
  if (NCaret>Length(s)) then NCaret:= Length(s)+1;

  i:= NCaret-1;
  if not ((i>0) and (i<=Length(s)) and IsWordChar(s[i])) then Exit;
  while (i>0) and IsWordChar(s[i]) do Dec(i);
  NStart:= i+1;
end;

//-----------------
procedure SGetTagBounds(const s: Widestring; NCaret: integer;
  var NSt, NLen: integer);
var
  i: integer;
begin
  NSt:= 0;
  NLen:= 0;
  if not ((NCaret>0) and (NCaret<=Length(s))) then Exit;

  //don't do if caret on '<'
  if s[NCaret]='<' then Exit;

  //find '<' lefter
  i:= NCaret;
  if (i>0) and (i<=Length(s)) and (s[i]='>') then Dec(i);
  while (i>0) and (s[i]<>'<') and (s[i]<>'>') do Dec(i);
  if (i=0) or (s[i]='>') then Exit;
  NSt:= i;

  //find '>' righter
  i:= NCaret;
  if (i>0) and (i<=Length(s)) and (s[i]='<') then Inc(i);
  while (i<=Length(s)) and (s[i]<>'>') and (s[i]<>'<') do Inc(i);
  if (i>Length(s)) or (s[i]='<') then Exit;
  NLen:= i - NSt + 1;
end;

//-------------
procedure SGetTagRanges(const s: Widestring;
  var rng: TTagRanges);
var
  R, R2: TecRegExpr;
  j, n, nJ, nRng: Integer;
  sPart: Widestring;
begin
  FillChar(rng, SizeOf(rng), 0);
  R:= TecRegExpr.Create;
  R2:= TecRegExpr.Create;
  nRng:= 0;
  try
    R.Expression:= cRE1;
    R.ModifierX:= false; //to handle ' ' in RE
    R2.Expression:= cRE2;
    R2.ModifierX:= false;
    n:= 1;
    repeat
      if R.Match(s, n) then
      begin
        Inc(nRng);
        if nRng > High(rng) then Exit;
        rng[nRng].OutSt:= R.MatchPos[0];
        rng[nRng].OutLen:= R.MatchLen[0];

        sPart:= Copy(s, rng[nRng].OutSt, rng[nRng].OutLen);
        for j:= 1 to Length(sPart) do
        begin
          nJ:= j;
          if R2.Match(sPart, nJ) then
          begin
            rng[nRng].InSt:= rng[nRng].OutSt + R2.MatchPos[0] - 1;
            rng[nRng].InLen:= R2.MatchLen[0];
          end;
        end;
      end
      else //not R.Match
        Inc(n);
    until n>=Length(s);
  finally
    FreeAndNil(R);
    FreeAndNil(R2);
  end;
end;

//--------------
//get index of (width+height) or (height+width) pair
function SGetTagConcatIdx(const s: Widestring;
  const r: TTagRanges): integer;
var
  nn: array[Low(r)..High(r)] of string;
  i, j: Integer;
  st: Widestring;
begin
  Result:= -1;
  for i:= Low(r) to High(r) do
    nn[i]:= '';
    
  for i:= Low(r) to High(r) do
    if r[i].OutLen>0 then
    begin
      st:= Copy(s, r[i].OutSt, r[i].OutLen);
      j:= Pos('=', st);
      if j=0 then Continue;
      nn[i]:= LowerCase(Trim(Copy(st, 1, j-1)));
    end;

  for i:= Low(r) to Pred(High(r)) do
    if ((nn[i]='width') and (nn[i+1]='height')) or
       ((nn[i]='height') and (nn[i+1]='width')) then
      begin Result:= i; Exit end;
end;

//-----------------
procedure SGetTagTabbing(const s: Widestring;
  var SelSt, SelLen: integer);
var
  rng: TTagRanges;
  nIdx: integer;
  //
  procedure Sel(n: integer; Outer: boolean);
  begin
    if (n<Low(rng)) or (n>High(rng)) or (rng[n].OutLen=0) then
    begin
      SelSt:= 0;
      SelLen:= 0;
    end
    else
    if (n>=Low(rng)) and (n<=High(rng)) then
      if Outer then
      begin
        SelSt:= rng[n].OutSt;
        SelLen:= rng[n].OutLen;
        if n = nIdx then
          Inc(SelLen, rng[n+1].OutLen);
      end
      else
      begin
        SelSt:= rng[n].InSt;
        SelLen:= rng[n].InLen;
      end;
  end;
var
  i: integer;
begin
  SGetTagRanges(s, rng);
  nIdx:= SGetTagConcatIdx(s, rng);

  //we at outer rng
  //(2 ranges width+height can be selected)
  if SelLen>0 then
  for i:= Low(rng) to High(rng) do
    if rng[i].OutLen>0 then
      if (SelSt=rng[i].OutSt) and
        ((SelLen=rng[i].OutLen) or
         ((i<High(rng)) and (SelLen = rng[i].OutLen + rng[i+1].OutLen))) then
      begin
        Sel(i, false);
        Exit
      end;

  //we at inner rng
  for i:= Low(rng) to High(rng) do
    if rng[i].OutLen>0 then
      if (SelSt=rng[i].InSt) and (SelLen=rng[i].InLen) then
      begin
        //if nIdx active, move from inner to next inner
        Sel(i+1, i<>nIdx);
        Exit
      end;

  //we at middle of rng, or no selection
  //(downto)
  for i:= High(rng) downto Low(rng) do
    if rng[i].OutLen>0 then
    begin
      //we at middle of inner rng
      if (SelSt>=rng[i].InSt) and (SelSt<=rng[i].InSt+rng[i].InLen) then
      begin
        Sel(i+1, true);
        Exit
      end;
      //we at middle of outer rng
      if (SelSt>=rng[i].OutSt) and (SelSt<=rng[i].OutSt+rng[i].OutLen) then
      begin
        Sel(i, true);
        Exit
      end;
    end;  

  //we at nowhere    
  Sel(Low(rng), true);
end;

//----------
function SGetTagRangesStr(const s: Widestring): Widestring;
{var i:Integer;
  r: TTagRanges;}
begin
  Result:= '';
  {
  SGetTagRanges(s, r);
  for i:= Low(r) to High(r) do
    if r[i].OutLen>0 then
      s:= s+ Format(
}
end;

end.
