unit unTabSw;

interface

uses
  Classes;

type
  TTabSwitcherGetTab = procedure(N: integer;
    var ATitle, AFN, ALex: Widestring) of object;

type
  TTabSwitcher = class
  private
    FTabList: TList;
  public
    OnGetTab: TTabSwitcherGetTab;
    constructor Create;
    destructor Destroy; override;
    function TabSwitch(ANext: boolean; AOwner: TComponent): integer;
    procedure UpdateTabList(TopItem, NewItem, DelItem: Integer);
    procedure MoveTabInList(NFrom, NTo: integer);
    procedure InitTabList(ACount: integer);
    function GetTabList: string;
  end;

var
  TabSwitcher,
  TabSwitcher2: TTabSwitcher;

implementation

uses
  SysUtils,
  Dialogs,
  Forms,
  Controls,
  unTabSwForm;

function TTabSwitcher.TabSwitch(ANext: boolean; AOwner: TComponent): integer;
var
  i, n: Integer;
  TabName, TabFN, TabLex: Widestring;
begin
  Result:= -1;
  if FTabList.Count=0 then Exit;
  with TfmTabSw.Create(AOwner) do
  try
    FListFN.Clear;
    FListLex.Clear;
    for i:= 0 to FTabList.Count-1 do
    begin
      n:= Integer(FTabList[i]);

      TabName:= IntToStr(n+1);
      TabFN:= TabName;
      TabLex:= '';
      if Assigned(OnGetTab) then
        OnGetTab(n, TabName, TabFN, TabLex);

      List.Items.AddObject(TabName, TObject(n));
      FListFN.Add(TabFN);
      FListLex.Add(TabLex);
    end;

    if List.Items.Count=0 then
      raise Exception.Create('TabSwitcher list empty');

    if ANext then
      List.ItemIndex:= 1
    else
      List.ItemIndex:= List.Items.Count-1;

    if ShowModal=mrOk then
      Result:= Integer(List.Items.Objects[List.ItemIndex]);
  finally
    Release
  end;
end;


procedure TTabSwitcher.UpdateTabList(TopItem, NewItem, DelItem: Integer);
var i:Integer;
begin
  with FTabList do
  begin
    if DelItem>=0 then
    begin
      Remove(Pointer(DelItem));
      for i:= 0 to Count-1 do
        if Integer(Items[i])>DelItem then
          Items[i]:= Pointer(Integer(Items[i])-1);
    end;
    if TopItem>=0 then
    begin
      Remove(Pointer(TopItem));
      Insert(0, Pointer(TopItem));
    end;
    if NewItem>=0 then
      Add(Pointer(NewItem));
  end;
end;


procedure TTabSwitcher.InitTabList(ACount: integer);
var i:Integer;
begin
  with FTabList do
  begin
    Clear;
    for i:= 0 to ACount-1 do
      Add(Pointer(i));
  end;
end;


function TTabSwitcher.GetTabList: string;
var i:Integer;
begin
  Result:= '';
  for i:= 0 to FTabList.Count-1 do
    Result:= Result+' '+Inttostr(Integer(FTabList[i])+1);
  Result:= Trim(Result);  
end;

procedure TTabSwitcher.MoveTabInList(NFrom, NTo: integer);
var
  i: Integer;
begin
  if (NFrom >= 0) and (NFrom < FTabList.Count) and
    (NTo >= 0) and (NTo < FTabList.Count) then
    with FTabList do
    begin
      Remove(Pointer(NFrom));
      for i:= 0 to Count-1 do
        if Integer(Items[i])>NFrom then
          Items[i]:= Pointer(Integer(Items[i])-1);
      for i:= 0 to Count-1 do
        if Integer(Items[i])>=NTo then
          Items[i]:= Pointer(Integer(Items[i])+1);
      Insert(0, Pointer(NTo));
    end;
end;

constructor TTabSwitcher.Create;
begin
  inherited;
  FTabList:= TList.Create;
  OnGetTab:= nil;
end;

destructor TTabSwitcher.Destroy;
begin
  FreeAndNil(FTabList);
  inherited;
end;

initialization
  TabSwitcher:= TTabSwitcher.Create;
  TabSwitcher2:= TTabSwitcher.Create;

finalization
  FreeAndNil(TabSwitcher2);
  FreeAndNil(TabSwitcher);

end.
