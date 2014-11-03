unit unClips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntClasses;

type
  TClipsEvent = procedure(Sender: TObject; const AText: Widestring; AIsSnippet: boolean) of object;

type
  TfmClips = class(TForm)
    Combo: TTntComboBox;
    ListNames: TTntListBox;
    procedure ComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListNamesDblClick(Sender: TObject);
    procedure ListNamesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FClipRootDir: string;
    FClipItems: TList;
    FOnClick: TClipsEvent;
    FOnInsPress: TNotifyEvent;
    procedure LoadClipFolders;
    procedure LoadClipGroup(const Name: string);
    procedure DoClearItems;
  public
    { Public declarations }
    procedure InitClips(const ADir: string);
    procedure DoAddClip(const AText: Widestring);
    function CurrentClipIsSnippet: boolean;
    function CurrentClipContent: Widestring;
    function CurrentClipFN: Widestring;
    property OnClipInsert: TClipsEvent read FOnClick write FOnClick;
    property OnInsPress: TNotifyEvent read FOnInsPress write FOnInsPress;
  end;

implementation

uses
  StrUtils,
  ATxSProc,
  ATxFProc,
  TntSysUtils,
  TntClipbrd;

{$R *.dfm}

const
  cSnippetExt = '.synw-snippet';
  cUserFN = 'User.txt';

type
  TSynClipInfo = class
    ClipFN,
    ClipName,
    ClipContent: Widestring;
    ClipAccel: char;
    ClipIsSnippet: boolean;
  end;

function ClipsFileMask: string;
begin
  Result:= '*.txt *'+cSnippetExt;
end;

procedure ClipNameValue(const s: Widestring; var sName, sValue: Widestring);
const
  Decode: array[0..0] of TStringDecodeRecW =
    ((SFrom: '\='; STo: '='));
var
  i, n: Integer;
begin
  n:= 0;
  //allow to separate with "=" but not with "\="
  for i:= 2 to Length(s) do
    if (s[i]='=') and (s[i-1]<>'\') then
      begin n:= i; Break end;

  if n>0 then
  begin
    sName:= Copy(s, 1, n-1);
    sValue:= Copy(s, n+1, MaxInt);
  end
  else
  begin
    sName:= s;
    sValue:= s;
  end;

  //replace escaped "\=" to usual "="
  sName:= SDecodeW(sName, Decode);
  sValue:= SDecodeW(sValue, Decode);
end;

function ClipHotkey(const SName: Widestring): char;
var
  n1, n2: Integer;
begin
  Result:= #0;
  n1:= Pos('[', SName);
  n2:= PosEx(']', SName, n1);
  if (n1>0) and (n2=n1+2) then
    Result:= UpCase(Char(SName[n1+1]));
end;

procedure TfmClips.DoClearItems;
var
  i: Integer;
begin
  with FClipItems do
    for i:= Count-1 downto 0 do
    begin
      TObject(Items[i]).Free;
      Delete(i);
    end;
end;

procedure TfmClips.LoadClipGroup(const Name: string);
var
  LFiles, LItems: TTntStringList;
  InfoClip: TSynClipInfo;
  InfoSnip: TSynSnippetInfo;
  SGroupName, SClipName, SClipVal, S, fn: Widestring;
  i, j: Integer;
  IsSnippet: boolean;
begin
  ListNames.Items.Clear;
  DoClearItems;

  SGroupName:= Combo.Text;
  if SGroupName='' then Exit;

  LFiles:= TTntStringList.Create;
  LItems:= TTntStringList.Create;
  try
    FFindToList(LFiles,
      FClipRootDir + '\' + SGroupName,
      ClipsFileMask, '',
      false{SubDirs}, false, false, false);

    for i:= 0 to LFiles.Count-1 do
    begin
      fn:= LFiles[i];
      IsSnippet:= ExtractFileExt(fn)=cSnippetExt;
      if IsSnippet then
      begin
        if not DoLoadSnippetFromFile(fn, InfoSnip) then Continue;
        InfoClip:= TSynClipInfo.Create;
        InfoClip.ClipFN:= fn;
        InfoClip.ClipName:= InfoSnip.Name;
        InfoClip.ClipContent:= InfoSnip.Text;
        InfoClip.ClipAccel:= ClipHotkey(InfoSnip.Name);
        InfoClip.ClipIsSnippet:= true;
        FClipItems.Add(InfoClip);
      end
      else
      begin
        LItems.LoadFromFile(fn);
        for j:= 0 to LItems.Count-1 do
        begin
          S:= LItems[j];
          SReplaceAllW(S, '\n', sLineBreak);
          ClipNameValue(S, SClipName, SClipVal);

          InfoClip:= TSynClipInfo.Create;
          InfoClip.ClipFN:= fn;
          InfoClip.ClipName:= SClipName;
          InfoClip.ClipContent:= SClipVal;
          InfoClip.ClipAccel:= ClipHotkey(SClipName);
          InfoClip.ClipIsSnippet:= false;
          FClipItems.Add(InfoClip);
        end;
      end;
    end;
  finally
    FreeAndNil(LItems);
    FreeAndNil(LFiles);
  end;

  for i:= 0 to FClipItems.Count-1 do
    ListNames.Items.Add(' '+TSynClipInfo(FClipItems[i]).ClipName);
    //add space so char-typing works only for accelerators, not list-items

  with ListNames do
    if Items.Count>0 then
      ItemIndex:= 0;  
end;

procedure TfmClips.LoadClipFolders;
var
  L: TTntStringList;
  i: Integer;
  Str: Widestring;
begin
  if FClipRootDir='' then
    raise Exception.Create('Clips dir nil');
  Combo.Items.Clear;

  L:= TTntStringList.Create;
  try
    FFindToList(L, FClipRootDir, ClipsFileMask, '',
      true{SubDir}, false, false, false);
    L.Sort;  

    for i:= 0 to L.Count-1 do
    begin
      Str:= WideExtractFileName(WideExtractFileDir(L[i]));
      if Combo.Items.IndexOf(Str)<0 then
        Combo.Items.Add(Str);
    end;
  finally
    FreeAndNil(L);
  end;

  if Combo.Items.Count>0 then
    Combo.ItemIndex:= 0;
end;

procedure TfmClips.InitClips(const ADir: string);
begin
  FClipRootDir:= ADir;
  LoadClipFolders;
  Combo.OnChange(Self);
end;

procedure TfmClips.ComboChange(Sender: TObject);
begin
  LoadClipGroup(Combo.Text);
end;

procedure TfmClips.FormCreate(Sender: TObject);
begin
  FClipItems:= TList.Create;
end;

procedure TfmClips.FormDestroy(Sender: TObject);
begin
  DoClearItems;
  FreeAndNil(FClipItems);
end;

procedure TfmClips.ListNamesDblClick(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Self, CurrentClipContent, CurrentClipIsSnippet);
end;

function TfmClips.CurrentClipContent: Widestring;
var
  N: integer;
begin
  Result:= '';
  N:= ListNames.ItemIndex;
  if N<0 then Exit;
  if N<FClipItems.Count then
    Result:= TSynClipInfo(FClipItems[N]).ClipContent;
end;

function TfmClips.CurrentClipIsSnippet: boolean;
var
  N: integer;
begin
  Result:= false;
  N:= ListNames.ItemIndex;
  if N<0 then Exit;
  if N<FClipItems.Count then
    Result:= TSynClipInfo(FClipItems[N]).ClipIsSnippet;
end;

function TfmClips.CurrentClipFN: Widestring;
var
  N: integer;
begin
  Result:= '';
  N:= ListNames.ItemIndex;
  if N<0 then Exit;
  if N<FClipItems.Count then
    Result:= TSynClipInfo(FClipItems[N]).ClipFN;
end;

procedure TfmClips.ListNamesKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, iFrom: Integer;
begin
  if (Key=vk_return) and (Shift=[]) then
  begin
    ListNamesDblClick(Self);
    Key:= 0;
    Exit
  end;

  if (Key=vk_insert) and (Shift=[]) then
  begin
    if Assigned(FOnInsPress) then
      FOnInsPress(Self);
    Key:= 0;
    Exit
  end;

  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    TntClipboard.AsWideText:= CurrentClipContent;
    Key:= 0;
    Exit
  end;

  if (Shift=[]) and
    ( ((Key>=Ord('A')) and (Key<=Ord('Z'))) or
      ((Key>=Ord('0')) and (Key<=Ord('9'))) ) then
  begin
    iFrom:= ListNames.ItemIndex;
    i:= iFrom;
    repeat
      Inc(i);
      if i>=ListNames.Items.Count then
        i:= 0;
      if i=iFrom then
        Break;
      if (Key = Ord(TSynClipInfo(FClipItems[i]).ClipAccel)) then
      begin
        ListNames.ItemIndex:= i;
        Break;
      end;
    until false;
    Key:= 0;
    Exit
  end;
end;

procedure TfmClips.DoAddClip(const AText: Widestring);
var
  L: TTntStringList;
  fn: Widestring;
begin
  fn:= WideExtractFilePath(CurrentClipFN)+cUserFN;

  L:= TTntStringList.Create;
  try
    if IsFileExist(fn) then
      L.LoadFromFile(fn);
    L.Add(AText);
    L.SaveToFile(fn);
  finally
    FreeAndNil(L);
  end;

  Combo.OnChange(Self);
  if ListNames.CanFocus then
    ListNames.SetFocus;
end;


end.
