unit unHotkey;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Menus,
  TntForms, TntExtCtrls,
  DKLang;

type
  TfmHotkey = class(TTntForm)
    PanelWait: TTntPanel;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ResultHotkey: string;
  end;

var
  fmHotkey: TfmHotkey;

function DoDialogHotkeyInput(const ACaption: WideString): string;

implementation

{$R *.dfm}

function DoDialogHotkeyInput(const ACaption: WideString): string;
var
  Form: TfmHotkey;
begin
  Result:= '';
  Form:= TfmHotkey.Create(nil);
  try
    Form.Caption:= ACaption;
    if Form.ShowModal=mrOk then
      Result:= Form.ResultHotkey;
  finally
    FreeAndNil(Form);
  end;
end;

procedure TfmHotkey.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_menu) or (Key=vk_lmenu) or (Key=vk_rmenu) or
    (Key=vk_shift) or (Key=vk_lshift) or (Key=vk_rshift) or
    (Key=vk_control) or (Key=vk_lcontrol) or (Key=vk_rcontrol) or
    (Key=vk_capital)
    then begin Key:= 0; exit end;

  if (Key=vk_escape) and (Shift=[]) then
  begin
    Key:= 0;
    ModalResult:= mrCancel;
    Exit
  end;

  ResultHotkey:= ShortCutToText(ShortCut(Key, Shift));
  Key:= 0;
  ModalResult:= mrOk;
end;

procedure TfmHotkey.FormCreate(Sender: TObject);
begin
  ResultHotkey:= '';
  PanelWait.Caption:= DKLangConstW('zMHintHotkey')+'...';
end;

end.
