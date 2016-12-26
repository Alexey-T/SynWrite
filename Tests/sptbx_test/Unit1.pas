unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item, SpTBXItem, TB2Dock, TB2Toolbar;

type
  TForm1 = class(TForm)
    SpTBXToolbar1: TSpTBXToolbar;
    SpTBXSubmenuItem1: TSpTBXSubmenuItem;
    tab: TSpTBXToolPalette;
    procedure tabDrawCellImage(Sender: TObject;
      ACanvas: TCanvas; ARect: TRect; ACol, ARow: Integer; Selected,
      HotTrack, Enabled: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
uses math;

{$R *.dfm}

procedure TForm1.tabDrawCellImage(Sender: TObject;
  ACanvas: TCanvas; ARect: TRect; ACol, ARow: Integer; Selected, HotTrack,
  Enabled: Boolean);
  var s: string;
begin
  s:= format('%d', [ACol*ARow]);

  with tab.SelectedCell do
    if (ACol<=x) and (ARow<=y) then
      acanvas.Brush.Color:= clBlue
    else
      acanvas.Brush.Color:= clwhite;

  acanvas.Font.Color:= clBlack;
  acanvas.Font.Name:= 'Tahoma';
  acanvas.font.size:= 6;
  acanvas.TextOut(ARect.Left, ARect.Top, s);
end;

end.
