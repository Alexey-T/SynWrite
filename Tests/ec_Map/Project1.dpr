program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unMap in 'D:\S\unMap.pas' {fmMap};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
