unit unProcSort;

interface

uses
  Classes, TntClasses;

type
  TSynSortMode = (sortUnicodeRaw, sortUnicode, sortAscii, sortNumeric);
  TSynDedupMode = (dedupAll, dedupAdjacent);

function DoDedupStringList(
  List: TTntStringList;
  AMode: TSynDedupMode): Integer;

function DoSortStringList(
  List: TTntStringList;
  AMode: TSynSortMode;
  AAscend: boolean;
  AShowDlg: boolean;
  AColStart, AColEnd: integer): boolean;

implementation

uses
  SysUtils, unSort, Controls, Forms, Math;

var
  opSort: record
    bAsc,
    bCase,
    bRemDups: boolean;
    bType: TSynSortMode;
    Col1, Col2: Integer;
  end;

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

function DoSortStringList(
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


function DoDedupStringList(
  List: TTntStringList;
  AMode: TSynDedupMode): Integer;
var
  i, N: Integer;
  L: TTntStringList;
begin
  Result:= 0;
  Screen.Cursor:= crHourGlass;
  try
    //delete last empty line
    N:= List.Count;
    if (N>0) and (List[N-1]='') then
      List.Delete(N-1);

    case AMode of
      dedupAdjacent:
        begin
          for i:= List.Count-1 downto 1{not 0} do
            if (List[i]=List[i-1]) then
            begin
              List.Delete(i);
              Inc(Result);
            end;
        end;
      dedupAll:
        begin
          L:= TTntStringList.Create;
          try
            for i:= 0 to List.Count-1 do
              L.AddObject(List[i], Pointer(i));
            L.Sort;

            for i:= L.Count-1 downto 1{not 0} do
              if (L[i]=L[i-1]) then
                List.Objects[Integer(L.Objects[i])]:= Pointer(1);

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

end.
