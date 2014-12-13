unit unProcLines;

interface

uses
  Classes, TntClasses;

type
  TSynSortMode = (sortUnicodeRaw, sortUnicode, sortAscii, sortNumeric);
  TSynDedupMode = (cLineDedupAll, cLineDedupAdjacent, cLineDedupAllAndOrig);
  TSynTrimMode = (cTrimLead, cTrimTrail, cTrimAll, cTrimDups);

function DoListCommand_ExtractDups(
  List: TTntStringList;
  CaseSens: boolean): Integer;
function DoListCommand_ExtractUniq(
  List: TTntStringList): Integer;
function DoListCommand_Reverse(
  L: TTntStringList): boolean;
function DoListCommand_Shuffle(
  L: TTntStringList): boolean;
function DoListCommand_RemoveBlanks(
  L: TTntStringList): Integer;
function DoListCommand_RemoveDupBlanks(
  L: TTntStringList): Integer;

function DoListCommand_Trim(
  L: TTntStringList;
  Mode: TSynTrimMode): Integer;

function DoListCommand_AlignWithSep(
  L: TTntStringList;
  const Sep: Widestring;
  TabSize: Integer): Integer;

function DoListCommand_Indent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer;
  UseTabChar: boolean): boolean;
function DoListCommand_UnIndent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer;
  UseTabChar: boolean;
  KeepAlign: boolean): boolean;

function DoListCommand_Unspace(
  List: TTntStringList;
  TabSize: Integer;
  LeadOnly: boolean): boolean;

function DoListCommand_Untab(
  List: TTntStringList;
  TabSize: Integer): Integer;

function DoListCommand_Deduplicate(
  List: TTntStringList;
  AMode: TSynDedupMode): Integer;

function DoListCommand_Sort(
  List: TTntStringList;
  AMode: TSynSortMode;
  AAscend: boolean;
  AShowDlg: boolean;
  AColStart, AColEnd: integer): boolean;

procedure DoList_DeleteLastEmpty(List: TTntStringList);


implementation

uses
  SysUtils, unSort, Controls, Forms, Math,
  Dialogs,
  ecStrUtils,
  ATxSProc;

var
  opSort: record
    bAsc,
    bCase,
    bRemDups: boolean;
    bType: TSynSortMode;
    Col1, Col2: Integer;
  end;

procedure DoList_DeleteLastEmpty(List: TTntStringList);
var
  N: Integer;
begin
  N:= List.Count;
  if (N>0) and (List[N-1]='') then
    List.Delete(N-1);
end;

{
function IsLastEOL(List: TTntStringList): boolean;
var
  N: Integer;
begin
  N:= List.Count;
  if N>0 then
    Result:= (Length(List[N-1])>=2) and (Copy(List[N-1], Length(List[N-1])-1, 2)=sLineBreak)
  else
    Result:= false;
end;
}

function WideCompareStr_Raw(const S1, S2: Widestring): Integer;
var
  i, LenMin, LenMax: Integer;
begin
  Result:= 0;
  LenMin:= Min(Length(S1), Length(S2));
  LenMax:= Max(Length(S1), Length(S2));
  for i:= 1 to LenMax do
    if i<=LenMin then
    begin
      if S1[i]<>S2[i] then
      begin
        Result:= Ord(S1[i])-Ord(S2[i]);
        Exit
      end;
    end
    else
    begin
      Result:= Length(S1)-Length(S2);
      Exit
    end;
end;

function _CompareLines(const S1, S2: Widestring): Integer;
begin
  case opSort.bType of
    sortAscii:
    begin
      if opSort.bCase then
        Result:= CompareStr(S1, S2)
      else
        Result:= CompareText(S1, S2);
    end;
    sortUnicode:
    begin
      if opSort.bCase then
        Result:= WideCompareStr(S1, S2)
      else
        Result:= WideCompareText(S1, S2);
    end;
    else
    begin
      if opSort.bCase then
        Result:= WideCompareStr_Raw(S1, S2)
      else
        Result:= WideCompareStr_Raw(WideUpperCase(S1), WideUpperCase(S2));
    end;
  end;
end;


function _ListCompare(List: TTntStringList; Index1, Index2: Integer): Integer;
var
  S1, S2,
  S1_org, S2_org: Widestring;
  N1, N2: Integer;
  ForceAlpha: boolean;
const
  cDef = Low(Integer);
begin
  Result:= 0;
  S1:= List[Index1];
  S2:= List[Index2];
  S1_org:= S1;
  S2_org:= S2;

  if opSort.Col2>0 then
  begin
    Delete(S1, opSort.Col2+1, MaxInt);
    Delete(S2, opSort.Col2+1, MaxInt);
  end;
  if opSort.Col1>0 then
  begin
    Delete(S1, 1, opSort.Col1-1);
    Delete(S2, 1, opSort.Col1-1);
  end;

  ForceAlpha:= true;
  if opSort.bType=sortNumeric then
  begin
    N1:= StrToIntDef(S1, cDef);
    N2:= StrToIntDef(S2, cDef);
    ForceAlpha:= (N1=cDef) or (N2=cDef);
    if not ForceAlpha then
      Result:= N1-N2;
  end;

  if ForceAlpha then
  begin
    Result:= _CompareLines(S1, S2);
    //if substrings are equal, compare again the whole strings
    if Result=0 then
      if (S1<>S1_org) or (S2<>S2_org) then
        Result:= _CompareLines(S1_org, S2_org);
  end;

  if not opSort.bAsc then
    Result:= -Result;
end;

procedure DoRemoveListDups(List: TTntStringList);
var
  i: Integer;
  same: boolean;
begin
  for i:= List.Count-1 downto 1{!} do
  begin
    if opSort.bCase then
      same:= List[i]=List[i-1]
    else
      same:= WideSameText(List[i], List[i-1]);
    if same then
      List.Delete(i);
  end;
end;

procedure DoRemoveListBlanks(List: TTntStringList);
var
  i: Integer;
begin
  for i:= List.Count-1 downto 0 do
    if List[i]='' then
      List.Delete(i);
end;

function DoListCommand_Sort(
  List: TTntStringList;
  AMode: TSynSortMode;
  AAscend: boolean;
  AShowDlg: boolean;
  AColStart, AColEnd: integer): boolean;
begin
  Result:= true;
  FillChar(opSort, SizeOf(opSort), 0);

  if AShowDlg then
    with TfmSort.Create(nil) do
    try
      case AMode of
        sortUnicodeRaw: cbUnicodeRaw.Checked:= true;
        sortUnicode: cbUnicode.Checked:= true;
        sortAscii: cbAscii.Checked:= true;
        sortNumeric: cbNumeric.Checked:= true;
      end;

      if AColStart>=0 then
      begin
        cbCol1.Checked:= true;
        cbCol2.Checked:= true;
        edCol1.Value:= AColStart;
        edCol2.Value:= AColEnd;
      end;

      Result:= ShowModal=mrOk;
      if not Result then Exit;

      opSort.bAsc:= cbAsc.Checked;
      opSort.bCase:= cbCase.Checked;
      opSort.bRemDups:= cbRemDups.Checked;

      if cbNumeric.Checked then
        opSort.bType:= sortNumeric
      else
      if cbAscii.Checked then
        opSort.bType:= sortAscii
      else
      if cbUnicodeRaw.Checked then
        opSort.bType:= sortUnicodeRaw
      else
      if cbUnicode.Checked then
        opSort.bType:= sortUnicode;

      if cbCol1.Checked then
        opSort.Col1:= edCol1.Value;
      if cbCol2.Checked then
        opSort.Col2:= edCol2.Value;
    finally
      Free
    end
  else
  begin
    opSort.bType:= AMode;
    opSort.bAsc:= AAscend;
  end;

  Screen.Cursor:= crHourGlass;
  try
    //remove blanks
    DoRemoveListBlanks(List);
    //sort
    List.CustomSort(_ListCompare);
    //remove dups
    if opSort.bRemDups then
      DoRemoveListDups(List);
  finally
    Screen.Cursor:= crDefault;
  end;
end;


function DoListCommand_Untab(
  List: TTntStringList;
  TabSize: Integer): Integer;
var
  i: Integer;
begin
  Result:= 0;
  Screen.Cursor:= crHourGlass;
  try
    DoList_DeleteLastEmpty(List);

    for i:= 0 to List.Count-1 do
      if Pos(#9, List[i])>0 then
      begin
        List[i]:= SUntab(List[i], TabSize);
        Inc(Result);
      end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;


function DoListCommand_Deduplicate(
  List: TTntStringList;
  AMode: TSynDedupMode): Integer;
var
  i: Integer;
  L: TTntStringList;
begin
  Result:= 0;
  Screen.Cursor:= crHourGlass;
  try
    DoList_DeleteLastEmpty(List);

    case AMode of
      cLineDedupAdjacent:
        begin
          for i:= List.Count-1 downto 1{not 0} do
            if (List[i]=List[i-1]) then
            begin
              List.Delete(i);
              Inc(Result);
            end;
        end;
      cLineDedupAll,
      cLineDedupAllAndOrig:
        begin
          L:= TTntStringList.Create;
          try
            for i:= 0 to List.Count-1 do
              L.AddObject(List[i], Pointer(i));
            L.Sort;

            //mark Objects with non-nil, for all duplicate lines
            for i:= L.Count-1 downto 1{not 0} do
              if L[i]=L[i-1] then
              begin
                List.Objects[Integer(L.Objects[i])]:= Pointer(1);
                if AMode=cLineDedupAllAndOrig then
                  List.Objects[Integer(L.Objects[i-1])]:= Pointer(1);
              end;

            //delete marked  
            for i:= List.Count-1 downto 0 do
              if List.Objects[i]<>nil then
              begin
                List.Delete(i);
                Inc(Result);
              end;
          finally
            FreeAndNil(L);
          end;
        end;
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;


function DoListCommand_Unspace(
  List: TTntStringList;
  TabSize: Integer;
  LeadOnly: boolean): boolean;
var
  i: Integer;
  S, Spaces: Widestring;
begin
  Result:= true;
  Screen.Cursor:= crHourGlass;
  try
    DoList_DeleteLastEmpty(List);

    Spaces:= StringOfChar(' ', TabSize);
    for i:= 0 to List.Count-1 do
    begin
      S:= List[i];
      if LeadOnly then
        SReplaceSpToTabLeading(S, Spaces)
      else
        SReplaceAllW(S, Spaces, #9);
      if S<>List[i] then
        List[i]:= S;
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

function DoListCommand_AlignWithSep(
  L: TTntStringList;
  const Sep: Widestring;
  TabSize: Integer): Integer;
  //
  function PosSep(S: Widestring): Integer;
  var
    n: Integer;
  begin
    S:= SUntab(S, TabSize);
    n:= 1;
    while (n<=Length(S)) and ((S[n]=' ') or (S[n]=#9)) do
      Inc(n);
    Result:= ecPosEx(Sep, S, n);
  end;
var
  i, N, NPos, NSize: Integer;
  S, Spaces: Widestring;
begin
  Result:= 0;

  //calculate maximal separator position in lines
  NSize:= 0;
  for i:= 0 to L.Count-1 do
  begin
    N:= PosSep(L[i]);
    if N=0 then Continue;
    //force space before separator:
    if (N>1) and not IsSpaceChar(L[i][N-1]) then
      Inc(N);
    //remember max
    if N>NSize then
      NSize:= N;
  end;
  if NSize=0 then Exit;

  for i:= 0 to L.Count-1 do
  begin
    //skip lines without separator
    N:= PosSep(L[i]);
    if N=0 then Continue;

    S:= L[i];
    NPos:= Pos(Sep, L[i]);
    if NPos=0 then Continue;

    //insert spaces before separator
    if NSize<>N then
    begin
      Spaces:= StringOfChar(' ', NSize-N);
      Insert(Spaces, S, NPos);
    end;

    //leave single space after separator
    N:= Pos(Sep, S)+1;
    while (N<=Length(S)) and (S[N]=' ') do
      Delete(S, N, 1);
    Insert(' ', S, N);

    //change string
    if S<>L[i] then
    begin
      L[i]:= S;
      Inc(Result);
    end;
  end;

  {
  if OptFill then
    DoListCommand_Unspace(L, TabSize, false);
    }
end;

function DoListCommand_RemoveBlanks(
  L: TTntStringList): Integer;
var
  i: Integer;
begin
  Result:= 0;
  for i:= L.Count-1 downto 0 do
    if Trim(L[i])='' then
    begin
      L.Delete(i);
      Inc(Result);
    end;
end;

function DoListCommand_RemoveDupBlanks(
  L: TTntStringList): Integer;
var
  i: Integer;
begin
  Result:= 0;
  for i:= L.Count-1 downto 1{not 0} do
    if (Trim(L[i])='') and (Trim(L[i-1])='') then
    begin
      L.Delete(i);
      Inc(Result);
    end;
end;


function DoListCommand_Trim(
  L: TTntStringList;
  Mode: TSynTrimMode): Integer;
var
  i: Integer;
  S: Widestring;
begin
  Result:= 0;
  for i:= 0 to L.Count-1 do
  begin
    S:= L[i];
    case Mode of
      cTrimLead: S:= TrimLeft(S);
      cTrimTrail: S:= TrimRight(S);
      cTrimAll: S:= Trim(S);
      cTrimDups: SDeleteDupSpaces(S);
      else
        raise Exception.Create('Unknown trim op');
    end;
    if S<>L[i] then
    begin
      L[i]:= S;
      Inc(Result);
    end;
  end;
end;


function DoListCommand_Reverse(
  L: TTntStringList): boolean;
var
  i: Integer;
  LRes: TTntStringList;
begin
  Result:= L.Count>1;
  LRes:= TTntStringList.Create;
  try
    for i:= L.Count-1 downto 0 do
      LRes.Add(L[i]);
    L.Assign(LRes);
  finally
    FreeAndNil(LRes);
  end;
end;

function DoListCommand_Shuffle(
  L: TTntStringList): boolean;
var
  i, N: Integer;
  LRes: TTntStringList;
begin
  Result:= L.Count>1;
  LRes:= TTntStringList.Create;
  try
    for i:= L.Count-1 downto 0 do
    begin
      N:= Random(L.Count);
      LRes.Add(L[N]);
      L.Delete(N);
    end;
    L.Assign(LRes);
  finally
    FreeAndNil(LRes);
  end;
end;

function DoListCommand_ExtractDups(List: TTntStringList; CaseSens: boolean): Integer;
var
  L: TTntStringList;
  i: Integer;
  same: boolean;
begin
  L:= TTntStringList.Create;
  try
    for i:= 0 to List.Count-1 do
      L.AddObject(List[i], Pointer(i));
    L.Sort;

    List.Clear;
    for i:= L.Count-1 downto 1{not 0} do
    begin
      if CaseSens then
        same:= (WideCompareStr(L[i], L[i-1])=0)
      else
        same:= (WideCompareText(L[i], L[i-1])=0);
      if same then
        List.Insert(0, L[i]);
    end;
  finally
    FreeAndNil(L);
  end;

  //remove empty lines
  for i:= List.Count-1 downto 0 do
    if List[i]='' then
      List.Delete(i);

  Result:= List.Count;
end;

function DoListCommand_ExtractUniq(List: TTntStringList): Integer;
var
  L: TTntStringList;
  i: Integer;
  dup: boolean;
begin
  L:= TTntStringList.Create;
  try
    L.AddStrings(List);
    L.Sort;

    List.Clear;
    for i:= L.Count-1 downto 0 do
    begin
      dup:=
        ((i>0) and (L[i]=L[i-1])) or
        ((i<L.Count-1) and (L[i]=L[i+1]));
      if not dup then
        List.Insert(0, L[i]);
    end;
  finally
    FreeAndNil(L);
  end;

  //remove empty lines
  for i:= List.Count-1 downto 0 do
    if List[i]='' then
      List.Delete(i);

  Result:= List.Count;
end;

function DoListCommand_Indent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer;
  UseTabChar: boolean): boolean;
var
  i, Num: Integer;
  SAdd, STabString, SIndent, SData, SNew: Widestring;
begin
  Result:= false;
  SAdd:= StringOfChar(' ', IndentSize);
  STabString:= StringOfChar(' ', TabSize);

  for i:= 0 to List.Count-1 do
    if List[i]<>'' then
    begin
      //get indent part, data part
      Num:= SSpacesAtStart(List[i]);
      SData:= Copy(List[i], Num+1, MaxInt);
      SIndent:= Copy(List[i], 1, Num);

      //add spaces to indent, and reapply tabs to whole indent
      SIndent:= SAdd+SUntab(SIndent, TabSize);
      if UseTabChar then
        SReplaceSpToTabLeading(SIndent, STabString);

      SNew:= '';
      SNew:= SIndent+SData;
      if SNew<>List[i] then
      begin
        List[i]:= SNew;
        Result:= true;
      end;
    end;
end;


function DoListCommand_UnIndent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer;
  UseTabChar: boolean;
  KeepAlign: boolean): boolean;
var
  i, Num: Integer;
  S, STabString, SIndent, SData, SNew: Widestring;
begin
  Result:= false;
  STabString:= StringOfChar(' ', TabSize);

  if KeepAlign then
    for i:= 0 to List.Count-1 do
    begin
      Num:= SSpacesAtStart(List[i]);
      //only spaces in line- skip line
      if Num>=Length(List[i]) then Continue;

      S:= Copy(List[i], 1, Num);
      S:= SUntab(S, TabSize);
      if Length(S)<IndentSize then
        Exit;
    end;

  for i:= 0 to List.Count-1 do
    if List[i]<>'' then
    begin
      //get indent part, data part
      Num:= SSpacesAtStart(List[i]);
      SData:= Copy(List[i], Num+1, MaxInt);
      SIndent:= Copy(List[i], 1, Num);

      //decrease indent, reapply tabs to indent
      SIndent:= SUntab(SIndent, TabSize);
      Delete(SIndent, 1, IndentSize);
      if UseTabChar then
        SReplaceSpToTabLeading(SIndent, STabString);

      //compiler bug? if SIndent='', SData='', SNew is previous line SNew (not '')
      SNew:= ''; //fix it
      SNew:= SIndent+SData;
      if SNew<>List[i] then
      begin
        List[i]:= SNew;
        Result:= true;
      end;
    end;
end;

end.
