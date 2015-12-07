program Demo;

uses
  Forms,
  {$ifdef FPC}
  Interfaces,
  {$endif}
  ATGroups in 'ATGroups.pas',
  demoform in 'demoform.pas' {fmTest};

begin
  Application.Title:= 'Demo';
  Application.Initialize;
  Application.CreateForm(TfmTest, fmTest);
  Application.Run;
end.
