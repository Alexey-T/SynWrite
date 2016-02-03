unit unColorPalette;

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  ColorPalette,
  StdCtrls,
  DKLang;

type
  { TfmPalette }

  TfmPalette = class(TForm)
    Panel1: TPanel;
    btnCancel: TButton;
    btnReset: TButton;
    DKLang1: TDKLanguageController;
    procedure FormShow(Sender: TObject);
    procedure PalColorPick(Sender: TObject; AColor: TColor; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { private declarations }
    Pal: TColorPalette;
  public
    { public declarations }
    ResColor: TColor;
  end;

var
  fmPalette: TfmPalette;

implementation

{$R *.dfm}

{ TfmPalette }

procedure TfmPalette.FormShow(Sender: TObject);
var
  i: integer;
begin
  Pal.PickedIndex:= -1;
  for i:= 0 to Pal.ColorCount-1 do
    if Pal.Colors[i]=ResColor then
    begin
      Pal.PickedIndex:= i;
      Break
    end;
end;

procedure TfmPalette.PalColorPick(Sender: TObject; AColor: TColor;
  Shift: TShiftState);
begin
  ResColor:= AColor;
  ModalResult:= mrOk;
end;

procedure TfmPalette.FormCreate(Sender: TObject);
begin
  Pal:= TColorPalette.Create(Self);
  Pal.Parent:= Self;
  Pal.Align:= alClient;
  Pal.ButtonWidth:= 24 * PixelsPerInch div 96;
  Pal.ButtonHeight:= Pal.ButtonWidth;
  Pal.ColumnCount:= 3;
  Pal.Flipped:= True;
  Pal.GradientSteps:= 1;
  Pal.SelectionColor:= clCream;
  Pal.SelectionKind:= pskThick;
  Pal.OnColorPick:= PalColorPick;
  Pal.PaletteKind:= pkGradientPalette;
end;

end.

