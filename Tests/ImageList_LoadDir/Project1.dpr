program Project1;

uses
  Windows,
  SysUtils,
  Forms,
  Unit1 in 'Unit1.pas' {Form1};

{$R *.res}

var
  t: Dword;
begin
  Application.Initialize;
  t:= GetTickCount;
  Application.CreateForm(TForm1, Form1);
  t:= GetTickCount-t;
  Form1.Caption:= Format('Load: %d ms', [t]);

  Application.Run;
end.
