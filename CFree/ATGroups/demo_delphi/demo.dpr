program Demo;

uses
  Forms,
  demoform in 'demoform.pas' {fmTest};

begin
  Application.Title:= 'Demo';
  Application.Initialize;
  Application.CreateForm(TfmTest, fmTest);
  Application.Run;
end.
