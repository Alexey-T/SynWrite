program TarExplorer;

uses
  Forms,
  Main in 'Main.pas' {FrmMain};

{$R *.RES}

begin
  Application.Initialize;
  Application.Title := 'TarExplorer';
  Application.CreateForm(TFrmMain, FrmMain);
  Application.Run;
end.
