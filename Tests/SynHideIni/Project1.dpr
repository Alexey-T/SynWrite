program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unSynHide in '..\..\unSynHide.pas' {fmSynHide};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfmSynHide, fmSynHide);
  Application.Run;
end.
