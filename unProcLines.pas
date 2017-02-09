unit unProcLines;

interface

uses
  Classes, TntClasses;

type
  TSynTrimMode = (cTrimLead, cTrimTrail, cTrimAll, cTrimDups);

function DoListCommand_Trim(
  L: TTntStringList;
  Mode: TSynTrimMode): Integer;

function DoListCommand_Indent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer): boolean;

function DoListCommand_UnIndent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer;
  KeepAlign: boolean): boolean;

function DoListCommand_Unspace(
  List: TTntStringList;
  TabSize: Integer;
  LeadOnly: boolean): boolean;

function DoListCommand_Untab(
  List: TTntStringList;
  TabSize: Integer): Integer;


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


function DoListCommand_Indent(
  List: TTntStringList;
  TabSize: Integer;
  IndentSize: Integer): boolean;
var
  bUseTabs: Boolean;
  SAdd, STabString, SIndent, SData, SNew: Widestring;
  i, Num: Integer;
begin
  Result:= false;

  bUseTabs:= IndentSize<0;
  if not bUseTabs then
    SAdd:= StringOfChar(' ', IndentSize)
  else
    SAdd:= StringOfChar(#9, Abs(IndentSize));  

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
      if bUseTabs then
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
  KeepAlign: boolean): boolean;
var
  bUseTabs: Boolean;
  i, Num: Integer;
  S, STabString, SIndent, SData, SNew: Widestring;
begin
  Result:= false;
  STabString:= StringOfChar(' ', TabSize);

  bUseTabs:= IndentSize<0;
  if bUseTabs then
    IndentSize:= Abs(IndentSize)*TabSize;

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
      if bUseTabs then
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
