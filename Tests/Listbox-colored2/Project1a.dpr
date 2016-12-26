program Project1a;

uses
  Forms,
  Unit1a in 'Unit1a.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
