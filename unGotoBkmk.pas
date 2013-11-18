unit unGotoBkmk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, TntForms, DKLang;

type
  TfmGotoBkmk = class(TTntForm)
    List: TTntListBox;
    bOk: TTntButton;
    bCan: TTntButton;
    TntLabel1: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    TntLabel2: TTntLabel;
    procedure ListDblClick(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntFormShow(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FIniFN: string;
  end;

implementation

uses
  IniFiles,
  unProc;

{$R *.dfm}

procedure TfmGotoBkmk.ListDblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfmGotoBkmk.ListClick(Sender: TObject);
begin
  //Shift+click must close dialog, it's handled
  if GetKeyState(vk_shift)<0 then
    bOk.Click;
end;

procedure TfmGotoBkmk.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_return) and (Shift=[ssShift]) then
  begin
    bOk.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TfmGotoBkmk.TntFormShow(Sender: TObject);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'BkX', Left);
    Top:= ReadInteger('Win', 'BkY', Top);
    Width:= ReadInteger('Win', 'BkW', Width);
    Height:= ReadInteger('Win', 'BkH', Height);
  finally
    Free
  end;
end;

procedure TfmGotoBkmk.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'BkX', Left);
    WriteInteger('Win', 'BkY', Top);
    WriteInteger('Win', 'BkW', Width);
    WriteInteger('Win', 'BkH', Height);
  finally
    Free
  end;
end;

end.
