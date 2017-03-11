unit unHotkeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Menus,
  TntControls, TntClasses, TntForms, TntStdCtrls,
  ExtCtrls, TntExtCtrls,
  StrUtils,
  ecKeyMap,
  unProc,
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
    procedure btnOkClick(Sender: TObject);
  private
    { Private declarations }
    CurrentIndex: integer;
    procedure DoKeyClear(N: integer);
    procedure DoKeyAdd(N: Integer);
    procedure SetWaitMode(b: Boolean);
    function GetWaitMode: Boolean;
    function CheckDuplicateHotkey(AKeyIndex: integer): Boolean;
    function MsgConfirmOverwriteHotkey(
      const SHotkey, SCategory, SName: Widestring): boolean;
  public
    { Public declarations }
    CommandItem: TecCommandItem;
    Keymap: TSyntKeyMapping;
    CurrentLexer: string;
    procedure UpdateState;
    property WaitMode: boolean read GetWaitMode write SetWaitMode;
  end;

var
  fmHotkeys: TfmHotkeys;

implementation

{$R *.dfm}

{ TfmHotkeys }

procedure TfmHotkeys.UpdateState;
var
  Str1, Str2: string;
begin
  Str1:= Hotkey_AsString(CommandItem, 0);
  Str2:= Hotkey_AsString(CommandItem, 1);
  labelInfo1.Caption:= '1)  '+Str1;
  labelInfo2.Caption:= '2)  '+Str2;

  btnClear1.Enabled:= Str1<>'';
  btnClear2.Enabled:= Str2<>'';

  btnAdd1.Enabled:= (Hotkey_GetHotkeyLen(CommandItem, 0) < Hotkey_MaxComboLen);
  btnAdd2.Enabled:= (Hotkey_GetHotkeyLen(CommandItem, 1) < Hotkey_MaxComboLen) and (Str1<>'');
end;

procedure TfmHotkeys.TntFormShow(Sender: TObject);
begin
  Caption:= DKLangConstW('cap_Hotkey')+': '+CommandItem.DisplayName;
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
  btnClear1.Visible:= not b;
  btnClear2.Visible:= not b;
  btnAdd1.Visible:= not b;
  btnAdd2.Visible:= not b;
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

function TfmHotkeys.MsgConfirmOverwriteHotkey(const SHotkey, SCategory, SName: Widestring): boolean;
var
  s: Widestring;
begin
  s:= SHotkey + #13 + DKLangConstW('zKeyUsed') + #13 + SCategory + ': ' + SName;
  Result:= MsgConfirm(s + #13#13 + DKLangConstW('zKeyOvr'), Handle);
end;

function TfmHotkeys.CheckDuplicateHotkey(AKeyIndex: integer): Boolean;
var
  SCheck: string;
  KeyIndex, i: integer;
begin
  Result:= true;
  SCheck:= Hotkey_AsString(CommandItem, AKeyIndex);
  if SCheck='' then exit;

  for i:= 0 to Keymap.Items.Count-1 do
    for KeyIndex:= 0 to 1 do
    begin
      //skip same item
      if Keymap.Items[i].Command=CommandItem.Command then Continue;
      //compare by AsString
      if SCheck=Hotkey_AsString(Keymap.Items[i], KeyIndex) then
      begin
        Result:= MsgConfirmOverwriteHotkey(
          SCheck,
          Keymap.Items[i].Category,
          Keymap.Items[i].DisplayName);
        if not Result then exit;
        //save overwritten item
        Keymap.Items[i].KeyStrokes.Items[KeyIndex].KeyDefs.Clear;
        Hotkey_SaveToFile('', Keymap.Items[i]);
      end;
    end;
end;

procedure TfmHotkeys.btnOkClick(Sender: TObject);
begin
  if CheckDuplicateHotkey(0) and
    CheckDuplicateHotkey(1) then
  begin
    Hotkey_SaveToFile(
      IfThen(chkForLexer.Checked, CurrentLexer, ''),
      CommandItem
      );
    ModalResult:= mrOk;
  end;
end;


end.
