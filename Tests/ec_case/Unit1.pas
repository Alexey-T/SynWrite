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

uses ecStrUtils;
{$R *.dfm}

procedure SSentCase__(var s: ecString);
var dot: boolean;
  i:Integer;
begin
  dot:= True;
  for i:= 1 to Length(s) do
  begin
    if IsAlphaChar(s[i]) then
    begin
      if dot then s[i]:= ecUpCase(s[i])
        else s[i]:= ecLoCase(s[i]);
      dot:= False;  
    end
    else
      if s[i] = '.' then
        dot:= True;
  end;
end;

var s: ecString='text aa, test; test. teXT AA. TEXT AA';

procedure TForm1.FormCreate(Sender: TObject);
begin
  ssentCase(s);
  Caption:= s;
end;

end.
