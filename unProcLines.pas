unit unProcLines;

interface

uses
  Classes, TntClasses;

type
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

procedure DoList_DeleteLastEmpty(List: TTntStringList);


implementation

uses
  SysUtils, Controls, Forms, Math,
  Dialogs,
  ecStrUtils,
  ATxSProc;

var
  opSort: record
    bCaseSens: boolean;
  end;

procedure DoList_DeleteLastEmpty(List: TTntStringList);
var
  N: Integer;
begin
  N:= List.Count;
  if (N>0) and (List[N-1]='') then
    List.Delete(N-1);
end;

procedure DoRemoveListDups(List: TTntStringList);
var
  i: Integer;
  same: boolean;
begin
  for i:= List.Count-1 downto 1{!} do
  begin
    if opSort.bCaseSens then
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
