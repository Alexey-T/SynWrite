program Project1;

uses
  Forms,
  unClip in 'D:\S\unClip.pas' {FormClip};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFormClip, FormClip);
  Application.Run;
end.
