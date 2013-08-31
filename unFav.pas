unit unFav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls, TntClasses, DKLang, ComCtrls, TntComCtrls;

const
  cSynFavTabFiles = 0;
  cSynFavTabProjects = 1;
  
type
  TfmFav = class(TTntForm)
    btnOk: TTntButton;
    btnCan: TTntButton;
    cbPaths: TTntCheckBox;
    List: TTntListBox;
    btnUp: TTntButton;
    btnDown: TTntButton;
    btnDel: TTntButton;
    DKLanguageController1: TDKLanguageController;
    Tabs: TTntTabControl;
    procedure TntFormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure cbPathsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ListDblClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TabsChange(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FFileNames: TTntStringList;
    procedure DoList;
    procedure DoListTabs;
    procedure DoLoad;
    procedure DoSave;
    function AKey(n: integer): char;
    procedure DoMoveItem(AUp: boolean);
    function DoGetTabIndex(const s: Widestring): Integer;
  public
    { Public declarations }
    FIniFN: string;
    FOptFN: string;
    FCurrentFileName: Widestring;
    FFavTab: Integer;
  end;

implementation

uses
  IniFiles,
  ATxSProc,
  TntSysUtils;

{$R *.dfm}

function TfmFav.DoGetTabIndex(const s: Widestring): Integer;
var
  SPrefix: Widestring;
  N: Integer;
begin
  Result:= 0;

  if IsFileProject(s) then
  begin
    Result:= 1;
    Exit
  end;

  N:= Pos('::', s);
  if N>0 then
  begin
    SPrefix:= Copy(s, 1, N-1);
    Result:= Tabs.Tabs.IndexOf(SPrefix);
    Exit;
  end;
end;

procedure TfmFav.DoList;
var
  i, iList, n: Integer;
  s, SShort: Widestring;
  Idx, TabIdx: Integer;
begin
  Idx:= List.ItemIndex;
  List.Items.BeginUpdate;
  try
    List.Items.Clear;
    iList:= 0;
    for i:= 0 to FFileNames.Count-1 do
    begin
      s:= FFileNames[i];
      TabIdx:= DoGetTabIndex(s);

      n:= Pos('::', s);
      if n>0 then
        Delete(s, 1, n+1);

      SShort:= WideExtractFileName(s);
      if SShort='' then
        SShort:= s;

      if cbPaths.Checked then
        s:= SShort + '  (' + WideExtractFileDir(s) + ')'
      else
        s:= SShort;

      if TabIdx=Tabs.TabIndex then
      begin
        List.Items.AddObject(AKey(iList)+':  '+s, Pointer(i));
        Inc(iList);
      end;
    end;

    //restore Idx
    if (Idx>=0) and (Idx<=List.Items.Count-1) then
      List.ItemIndex:= Idx
    else
    if (Idx>=0) and (List.Items.Count>0) then
      List.ItemIndex:= List.Items.Count-1
    else
    if (List.Items.Count>0) then
      List.ItemIndex:= 0;
  finally
    List.Items.EndUpdate;
  end;

  ListClick(Self);
end;

procedure TfmFav.TntFormShow(Sender: TObject);
var
  N: Integer;
begin
  if FIniFN='' then
    raise Exception.Create('Ini nil');
  DoLoad;
  DoListTabs;
  DoList;

  with TIniFile.Create(FOptFN) do
  try
    Width:= ReadInteger('Win', 'FavW', Width);
    Height:= ReadInteger('Win', 'FavH', Height);
    cbPaths.Checked:= ReadBool('Win', 'FavPath', true);
    N:= ReadInteger('Win', 'FavTab', 0);
  finally
    Free
  end;

  if FFavTab>=0 then
    N:= FFavTab;

  if (N>=0) and (N<Tabs.Tabs.Count) then
    Tabs.TabIndex:= N
  else
    Tabs.TabIndex:= 0;
  TabsChange(Self);
end;

procedure TfmFav.TntFormCreate(Sender: TObject);
begin
  FFileNames:= TTntStringList.Create;
  FFavTab:= -1;
end;

procedure TfmFav.TntFormDestroy(Sender: TObject);
begin
  FreeAndNil(FFileNames);
end;

procedure TfmFav.DoLoad;
begin
  if FileExists(FIniFN) then
  begin
    FFileNames.LoadFromFile(FIniFN);
  end;
end;

procedure TfmFav.DoSave;
begin
  FFileNames.SaveToFile(FIniFN);
end;

procedure TfmFav.cbPathsClick(Sender: TObject);
begin
  DoList;
end;

procedure TfmFav.btnOkClick(Sender: TObject);
var
  N: Integer;
begin
  if List.ItemIndex>=0 then
  begin
    N:= Integer(List.Items.Objects[List.ItemIndex]);
    FCurrentFileName:= FFileNames[N];
  end;
end;

procedure TfmFav.ListDblClick(Sender: TObject);
begin
  btnOk.Click;
end;

procedure TfmFav.btnDelClick(Sender: TObject);
var
  N: Integer;
begin
  if List.ItemIndex>=0 then
  begin
    N:= Integer(List.Items.Objects[List.ItemIndex]);
    FFileNames.Delete(N);
    DoSave;
    DoList;
  end;
end;

procedure TfmFav.btnUpClick(Sender: TObject);
begin
  DoMoveItem(true);
end;

procedure TfmFav.DoMoveItem(AUp: boolean);
var
  nFrom, nTo, nList: Integer;
begin
  nFrom:= Integer(List.Items.Objects[List.ItemIndex]);
  if AUp then
    nList:= List.ItemIndex-1
  else
    nList:= List.ItemIndex+1;
  nTo:= Integer(List.Items.Objects[nList]);

  FFileNames.Move(nFrom, nTo);
  DoSave;
  DoList;
  List.ItemIndex:= nList;
  ListClick(Self);
end;

procedure TfmFav.ListClick(Sender: TObject);
begin
  btnOk.Enabled:= List.ItemIndex>=0;
  btnDel.Enabled:= List.ItemIndex>=0;

  btnUp.Enabled:= (List.Items.Count>0) and (List.ItemIndex>0);
  btnDown.Enabled:= (List.Items.Count>0) and (List.ItemIndex<List.Items.Count-1);
end;

procedure TfmFav.btnDownClick(Sender: TObject);
begin
  DoMoveItem(false);
end;

function TfmFav.AKey(n: integer): char;
begin
  if n<0 then raise Exception.Create('N<0');
  if n<=8 then Result:= Chr(Ord('1')+n) else
   if n=9 then Result:= '0' else
    if n<=10+Ord('Z')-Ord('A') then Result:= Chr(Ord('A')+n-10) else
     Result:= '?';
end;

procedure TfmFav.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  if ((Key>=Ord('0')) and (Key<=Ord('9'))) or
    ((Key>=Ord('A')) and (Key<=Ord('Z'))) then
  begin
    for i:= 0 to FFileNames.Count-1 do
      if Key=Ord(AKey(i)) then
      begin
        List.ItemIndex:= i;
        btnOk.Click;
        Break
      end;
    Key:= 0;
    Exit
  end;

  if (Key=VK_Delete) and (Shift=[]) then
  begin
    btnDel.Click;
    Key:= 0;
    Exit
  end;

  if (Key=vk_tab) and (Shift=[ssCtrl]) then
  begin
    with Tabs do
      if TabIndex<Tabs.Count-1 then
        TabIndex:= TabIndex+1
      else
        TabIndex:= 0;
    TabsChange(Self);      
  end;
end;

procedure TfmFav.DoListTabs;
var
  i, N: Integer;
  s: Widestring;
begin
  Tabs.Tabs.Clear;
  Tabs.Tabs.Add(DKLangConstW('zFavFiles'));
  Tabs.Tabs.Add(DKLangConstW('zFavProj'));
  for i:= 0 to FFileNames.Count-1 do
  begin
    s:= FFileNames[i];
    N:= Pos('::', s);
    if N>0 then
    begin
      s:= Copy(s, 1, N-1);
      if Tabs.Tabs.IndexOf(s)<0 then
        Tabs.Tabs.Add(s);
    end;
  end;
end;

procedure TfmFav.TabsChange(Sender: TObject);
begin
  DoList;
end;

procedure TfmFav.TntFormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(FOptFN) do
  try
    WriteInteger('Win', 'FavW', Width);
    WriteInteger('Win', 'FavH', Height);
    WriteBool('Win', 'FavPath', cbPaths.Checked);
    WriteInteger('Win', 'FavTab', Tabs.TabIndex);
  finally
    Free
  end;
end;

end.
