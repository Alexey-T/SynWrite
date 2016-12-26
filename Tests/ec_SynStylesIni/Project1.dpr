program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unSaveLex in 'D:\S\unSaveLex.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
