unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DKLang;

type
  TForm1 = class(TForm)
    Button1: TButton;
    DKLanguageController1: TDKLanguageController;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unProc;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  s: Widestring;
begin
  DoInputString('in', S, 'd:\1.ini', 'aa');
end;

end.
