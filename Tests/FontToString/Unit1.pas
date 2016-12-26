unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  unSaveLex;

{$R *.dfm}

function FontToString(F: TFont): string;
begin

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Caption:= FontTo String(Font);
end;

end.
