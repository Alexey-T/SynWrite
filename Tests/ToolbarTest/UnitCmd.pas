unit UnitCmd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  ModalResult:= 1;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  ModalResult:= 2;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
  ModalResult:= 3;
end;

end.
