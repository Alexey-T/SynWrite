unit unInputMemo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntForms;

type
  TfmInputMemo = class(TTntForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lab1: TTntLabel;
    Ed: TTntMemo;
    PanelBtn: TPanel;
    btnCancel: TTntButton;
    btnOK: TTntButton;
    procedure FormResize(Sender: TObject);
    procedure EdKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfmInputMemo.FormResize(Sender: TObject);
begin
  PanelBtn.Left:= (Panel1.ClientWidth - PanelBtn.Width) div 2;
end;

procedure TfmInputMemo.EdKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) then
  begin
    ModalResult:= mrCancel;
    Key:= 0;
    Exit
  end;
end;

end.
