program MulCarets;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ATSyntMemo in 'd:\s\ATSyntMemo.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
