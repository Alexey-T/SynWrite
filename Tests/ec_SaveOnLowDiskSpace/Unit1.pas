unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo;

type
  TForm1 = class(TForm)
    ed: TSyntaxMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  for i:= 1 to 300*100 do
    ed.Lines.Add('aaaaaaaaaa');
  ed.SaveToFile('f:\ed.txt');  
end;

end.
