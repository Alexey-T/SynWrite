program Project1;

uses
  Forms,
  ec_SplitLn in 'ec_SplitLn.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
