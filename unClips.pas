unit unClips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntClasses;

type
  TClipsEvent = procedure(Sender: TObject; const S: Widestring) of object;

type
  TfmClips = class(TForm)
    Combo: TTntComboBox;
    List: TTntListBox;
    procedure ComboChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure ListDblClick(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FClipsDir: string;
    FClips: TTntStringList;
    FOnClick: TClipsEvent;
    FOnInsPress: TNotifyEvent;
    procedure LoadClips;
    procedure LoadClip(const Name: string);
  public
    { Public declarations }
    property OnClick: TClipsEvent read FOnClick write FOnClick;
    property OnInsPress: TNotifyEvent read FOnInsPress write FOnInsPress;
    procedure InitClips(const dir: string);
    function GetClipsFN(const Name: string): string;
    function GetCurrentFN: string;
    function GetCurrentClip: Widestring;
    procedure DoDeleteClip;
  end;

implementation

uses
  StrUtils,
  ATxSProc,
  ATxFProc,
  TntSysUtils,
  TntClipbrd;

{$R *.dfm}

procedure SGetNameValue(const s: Widestring; var sName, sValue: Widestring);
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

function SGetHotkey(const s: Widestring): Widechar;
var
  SName, SVal: Widestring;
  n1, n2: Integer;
begin
  Result:= #0;
  SGetNameValue(s, SName, SVal);
  n1:= Pos('[', SName);
  n2:= PosEx(']', SName, n1);
  if (n1>0) and (n2=n1+2) then
  begin
    SVal:= UpperCase(SName[n1+1]);
    if SVal<>'' then
      Result:= SVal[1];
  end;
end;

function TfmClips.GetClipsFN(const Name: string): string;
begin
  Result:= FClipsDir + '\' + Name + '.txt';
end;

procedure TfmClips.LoadClip(const Name: string);
var
  fn: string;
  i: Integer;
  S, SName, SVal: Widestring;
begin
  List.Items.Clear;
  FClips.Clear;

  fn:= GetClipsFN(Name);
  if not FileExists(fn) then Exit;

  FClips.LoadFromFile(fn);
  for i:= 0 to FClips.Count-1 do
  begin
    S:= FClips[i];
    SReplaceAllW(S, '\n', sLineBreak);
    FClips[i]:= S;

    SGetNameValue(S, SName, SVal);
    List.Items.Add(' '+SName);
  end;
end;

procedure TfmClips.LoadClips;
var
  L: TTntStringList;
  i: Integer;
begin
  if FClipsDir='' then
    raise Exception.Create('Clips dir nil');
  Combo.Items.Clear;

  L:= TTntStringList.Create;
  try
    FFindToList(L, FClipsDir, '*.txt', '',
      false{SubDir}, false, false, false);

    for i:= 0 to L.Count-1 do
      Combo.Items.Add(WideChangeFileExt(WideExtractFileName(L[i]), ''));
    if L.Count>0 then
      Combo.ItemIndex:= 0;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmClips.InitClips(const dir: string);
begin
  FClipsDir:= dir;
  LoadClips;
  ComboChange(Self);
end;

procedure TfmClips.ComboChange(Sender: TObject);
begin
  LoadClip(Combo.Text);
end;

procedure TfmClips.FormCreate(Sender: TObject);
begin
  FClips:= TTntStringList.Create;
end;

procedure TfmClips.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FClips);
end;

procedure TfmClips.ListDblClick(Sender: TObject);
begin
  if Assigned(FOnClick) then
    FOnClick(Self, GetCurrentClip);
end;

function TfmClips.GetCurrentClip: Widestring;
var
  n: integer;
  SName: Widestring;
begin
  Result:= '';
  n:= List.ItemIndex;
  if (n>=0) and (n<FClips.Count) then
    SGetNameValue(FClips[n], SName, Result);
end;


function TfmClips.GetCurrentFN: string;
begin
  Result:= GetClipsFN(Combo.Text);
end;

procedure TfmClips.ListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i, iFrom: Integer;
begin
  if (Key=vk_return) and (Shift=[]) then
  begin
    ListDblClick(Self);
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
  if (Key=vk_delete) and (Shift=[ssShift]) then
  begin
    DoDeleteClip;
    Key:= 0;
    Exit
  end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    TntClipboard.AsWideText:= GetCurrentClip;
    Key:= 0;
    Exit
  end;
  if (Shift=[]) and
    ( ((Key>=Ord('A')) and (Key<=Ord('Z'))) or
      ((Key>=Ord('0')) and (Key<=Ord('9'))) ) then
  begin
    iFrom:= List.ItemIndex;
    i:= iFrom;
    repeat
      Inc(i);
      if i>=List.Items.Count then
        i:= 0;
      if i=iFrom then
        Break;
      if (Key = Ord(SGetHotkey(FClips[i]))) then
      begin
        List.ItemIndex:= i;
        Break;
      end;
    until false;  
    Key:= 0;
    Exit
  end;
end;

procedure TfmClips.DoDeleteClip;
var
  L: TTntStringList;
  Idx: integer;
begin
  Idx:= List.ItemIndex;
  if Idx<0 then Exit;

  L:= TTntStringList.Create;
  try
    L.LoadFromFile(GetCurrentFN);
    L.Delete(Idx);
    L.SaveToFile(GetCurrentFN);
  finally
    FreeAndNil(L);
  end;

  ComboChange(Self);
  if Idx<List.Items.Count then
    List.ItemIndex:= Idx
  else
    List.ItemIndex:= List.Items.Count-1;
end;



end.
