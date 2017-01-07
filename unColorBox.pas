unit unColorBox;

interface

uses
  SysUtils, Classes, Graphics,
  Controls, ExtCtrls,
  Dialogs;

type
  TColorBox = class(ExtCtrls.TColorBox)
  protected
    function PickCustomColor: boolean; override;
  end;

var  
  ColorDialogMain: TColorDialog;

implementation

function TColorBox.PickCustomColor: Boolean;
begin
  ColorDialogMain.Color:= Selected;
  Result:= ColorDialogMain.Execute;
  if Result then
  begin
    Selected:= ColorDialogMain.Color;
    Invalidate;
  end;  
end;


initialization
  ColorDialogMain:= TColorDialog.Create(nil);
  ColorDialogMain.Options:= [cdFullOpen, cdSolidColor, cdAnyColor];

finalization
  FreeAndNil(ColorDialogMain);

end.
