unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses SpTbxSkins;

{$R *.dfm}

procedure TForm1.FormResize(Sender: TObject);
var r: trect;
begin
  r:= ClientRect;
  if SkinManager.CurrentSkinName='Default' then
    Canvas.Brush.Color:= clBtnFace
  else
    Canvas.Brush.Color:= clCream;

  Canvas.FillRect(r);
  r.Bottom:= r.Bottom div 2;
      CurrentSkin.PaintBackground(
        Canvas, r,
        skncDock, sknsNormal, true{BG}, false{Borders});
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //SkinManager.SetSkin('Aluminum');
  SkinManager.SetSkin('Default');
  //SkinManager.SetToDefaultSkin;
end;

end.
 