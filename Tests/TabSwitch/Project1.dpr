program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unProc in 'unProc.pas',
  unTabSwForm in 'd:\s\unTabSwForm.pas' {fmTabs},
  unTabSw in 'd:\s\unTabSw.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmTabSw, fmTabSw);
  Application.Run;
end.
