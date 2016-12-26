program ProjMan1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unProj in '..\..\unProj.pas' {fmProj},
  unProjAddDir in '..\..\unProjAddDir.pas' {fmProjAddDir},
  unProjProps in '..\..\unProjProps.pas' {fmProjProps};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
