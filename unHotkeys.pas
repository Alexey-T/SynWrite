unit unHotkeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus,
  TntControls, TntClasses, TntForms, TntStdCtrls,
  ExtCtrls, TntExtCtrls,
  ecKeyMap,
  DKLang;

type
  TfmHotkeys = class(TTntForm)
    btnOk: TTntButton;
    btnCancel: TTntButton;
    labelInfo1: TTntLabel;
    btnClear1: TTntButton;
    btnAdd1: TTntButton;
    labelInfo2: TTntLabel;
    btnClear2: TTntButton;
    btnAdd2: TTntButton;
    PanelWait: TTntPanel;
    chkForLexer: TTntCheckBox;
    DKLang1: TDKLanguageController;
    procedure TntFormShow(Sender: TObject);
    procedure btnClear1Click(Sender: TObject);
    procedure btnClear2Click(Sender: TObject);
    procedure btnAdd1Click(Sender: TObject);
    procedure btnAdd2Click(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntFormDestroy(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
  private
    { Private declarations }
    CurrentIndex: integer;
    procedure DoKeyClear(N: integer);
    procedure DoKeyAdd(N: Integer);
    procedure SetWaitMode(b: Boolean);
    function GetWaitMode: Boolean;
  public
    { Public declarations }
    CommandItem: TecCommandItem;
    procedure UpdateState;
    property WaitMode: boolean read GetWaitMode write SetWaitMode;
  end;

var
  fmHotkeys: TfmHotkeys;

const
  Hotkey_ComboSeparator = ' * ';
function Hotkey_GetHotkeyAsString(
  AItem: TecCommandItem; AKeyIndex: integer): string;
procedure Hotkey_SetFromString(
  AItem: TecCommandItem; AKeyIndex: integer; AString: string);

implementation

{$R *.dfm}


function Hotkey_GetItem(var s: string): string;
const
  sep = Hotkey_ComboSeparator;
var
  i: integer;
begin
  i:= Pos(sep, s);
  if i=0 then i:= MaxInt div 2;
  Result:= Copy(s, 1, i-1);
  Delete(s, 1, i+Length(sep)-1);
end;

procedure Hotkey_SetFromString(
  AItem: TecCommandItem; AKeyIndex: integer; AString: string);
var
  SKey: string;
  NKey: TShortCut;
begin
  while (AKeyIndex>=AItem.KeyStrokes.Count) do
  begin
    if AString='' then exit;
    AItem.KeyStrokes.Add;
  end;

  AItem.KeyStrokes[AKeyIndex].KeyDefs.Clear;
  repeat
    SKey:= Hotkey_GetItem(AString);
    if SKey='' then Break;
    NKey:= TextToShortCut(SKey);
    if NKey=0 then Break;
      AItem.KeyStrokes[AKeyIndex].KeyDefs.Add.ShortCut:= NKey;
  until false;
end;

function Hotkey_GetHotkeyAsString(
  AItem: TecCommandItem; AKeyIndex: integer): string;
var
  i: integer;
begin
  Result:= '';
  if (AKeyIndex<AItem.KeyStrokes.Count) then
    for i:= 0 to AItem.KeyStrokes[AKeyIndex].KeyDefs.Count-1 do
    begin
      if Result<>'' then Result:= Result+Hotkey_ComboSeparator;
      Result:= Result+AItem.KeyStrokes[AKeyIndex].KeyDefs[i].AsString;
    end;
end;

function Hotkey_GetHotkeyLen(
  AItem: TecCommandItem; AKeyIndex: integer): integer;
begin
  Result:= 0;
  if (AKeyIndex<AItem.KeyStrokes.Count) then
    Result:= AItem.KeyStrokes[AKeyIndex].KeyDefs.Count;
end;


{ TfmHotkeys }

procedure TfmHotkeys.UpdateState;
const
  cMaxLen=3;
var
  Str1, Str2: string;
begin
  Str1:= Hotkey_GetHotkeyAsString(CommandItem, 0);
  Str2:= Hotkey_GetHotkeyAsString(CommandItem, 1);
  labelInfo1.Caption:= '1)  '+Str1;
  labelInfo2.Caption:= '2)  '+Str2;

  btnClear1.Enabled:= Str1<>'';
  btnClear2.Enabled:= Str2<>'';

  btnAdd1.Enabled:= (Hotkey_GetHotkeyLen(CommandItem, 0)<cMaxLen);
  btnAdd2.Enabled:= (Hotkey_GetHotkeyLen(CommandItem, 1)<cMaxLen) and (Str1<>'');
end;

procedure TfmHotkeys.TntFormShow(Sender: TObject);
begin
  Caption:= DKLangConstW('cap_Hotkey')+': '+
    StringReplace(CommandItem.DisplayName, '&', '', [rfReplaceAll]);
  PanelWait.Align:= alClient;
  UpdateState;
end;

procedure TfmHotkeys.btnClear1Click(Sender: TObject);
begin
  DoKeyClear(0);
end;

procedure TfmHotkeys.btnClear2Click(Sender: TObject);
begin
  DoKeyClear(1);
end;

procedure TfmHotkeys.DoKeyClear(N: integer);
begin
  CommandItem.KeyStrokes.Delete(N);
  UpdateState;
end;

procedure TfmHotkeys.DoKeyAdd(N: Integer);
begin
  CurrentIndex:= N;
  WaitMode:= True;
end;

procedure TfmHotkeys.btnAdd1Click(Sender: TObject);
begin
  DoKeyAdd(0);
end;

procedure TfmHotkeys.btnAdd2Click(Sender: TObject);
begin
  DoKeyAdd(1);
end;

procedure TfmHotkeys.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Sh: TShortCut;
begin
  if not WaitMode then exit;

  if (Key=vk_menu) or (Key=vk_lmenu) or (Key=vk_rmenu) or
    (Key=vk_shift) or (Key=vk_lshift) or (Key=vk_rshift) or
    (Key=vk_control) or (Key=vk_lcontrol) or (Key=vk_rcontrol) or
    (Key=vk_capital)
    then begin Key:= 0; exit end;

  Sh:= ShortCut(Key, Shift);
  if Length(ShortCutToText(Sh))<2 then
    begin Key:= 0; exit; end;

  if CurrentIndex>=CommandItem.KeyStrokes.Count then
    CommandItem.KeyStrokes.Add;
  CommandItem.KeyStrokes[CurrentIndex].KeyDefs.Add.ShortCut:= Sh;

  WaitMode:= False;
  UpdateState;
  Key:= 0;
end;

procedure TfmHotkeys.SetWaitMode(b: Boolean);
begin
  PanelWait.Visible:= b;
  chkForLexer.Visible:= not b;
  btnOk.Visible:= not b;
  btnCancel.Visible:= not b;
end;

procedure TfmHotkeys.TntFormDestroy(Sender: TObject);
begin
  if Assigned(CommandItem) then
    FreeAndNil(CommandItem);
end;

procedure TfmHotkeys.TntFormCreate(Sender: TObject);
begin
  CommandItem:= TecCommandItem.Create(nil);
end;

function TfmHotkeys.GetWaitMode: Boolean;
begin
  Result:= PanelWait.Visible;
end;

end.
