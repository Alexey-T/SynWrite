program Project1;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unToolbarProp in '..\..\unToolbarProp.pas' {fmToolbarProp},
  unToolbarIcon in '..\..\unToolbarIcon.pas' {fmToolbarIcon},
  unToolbarSize in '..\..\unToolbarSize.pas' {fmToolbarSize},
  UnitCmd in 'UnitCmd.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
