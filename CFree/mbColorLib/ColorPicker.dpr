program ColorPicker;

uses
  Forms,
  OfficeMoreColorsDialog in 'OfficeMoreColorsDialog.pas' {OfficeMoreColorsWin};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Color Picker';
  Application.CreateForm(TOfficeMoreColorsWin, OfficeMoreColorsWin);
  Application.Run;
end.
