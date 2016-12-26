unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, VclFixes;

type
  TPageControl = class(comctrls.TPageControl)
  protected
    procedure CNDrawitem(var Message: TWMDrawItem); message CN_DRAWITEM;
  end;

  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    procedure FormCreate(Sender: TObject);
    procedure PageControl1DrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  xpman;

{$R *.dfm}

procedure TPageControl.CNDrawitem(var Message: TWMDrawItem);
var
  Color: TColor;
  Rect: TRect;
  Rgn: HRGN;
begin
  Color := 0;
  // draw in different colors so we see where we've drawn
  case Message.DrawItemStruct.itemID of
    0: Color := $D0C0BF;
    1: Color := $D0C0DF;
    2: Color := $D0C0FF;
  end;
  SetDCBrushColor(Message.DrawItemStruct.hDC, Color);

  // we don't want to get clipped in the passed rectangle
  SelectClipRgn(Message.DrawItemStruct.hDC, 0);

  // magic numbers corresponding to where the OS draw the borders
  Rect := Message.DrawItemStruct.rcItem;
  if Bool(Message.DrawItemStruct.itemState and ODS_SELECTED) then begin
    Inc(Rect.Left, 2);
//    Inc(Rect.Top, 1);
    Dec(Rect.Right, 2);
    Dec(Rect.Bottom, 3);
  end else begin
    Dec(Rect.Left, 2);
    Dec(Rect.Top, 2);
    Inc(Rect.Right, 2);
    Inc(Rect.Bottom);
  end;
  FillRect(Message.DrawItemStruct.hDC, Rect,
      GetStockObject(DC_BRUSH));

  // just some indication for the active tab
  SetROP2(Message.DrawItemStruct.hDC, R2_NOTXORPEN);
  if Bool(Message.DrawItemStruct.itemState and ODS_SELECTED) then
    Ellipse(Message.DrawItemStruct.hDC, Rect.Left + 4, Rect.Top + 4,
      Rect.Left + 12, Rect.Top + 12);

  SetBkMode(Message.DrawItemStruct.hDC, TRANSPARENT);
  TextOut(Message.DrawItemStruct.hDC, 4, 2, 'sheet', 5);

  // we want to clip the DC so that the borders to be drawn are out of region
  Rgn := CreateRectRgn(0, 0, 0, 0);
  SelectClipRgn(Message.DrawItemStruct.hDC, Rgn);
  DeleteObject(Rgn);

  Message.Result := 1;
  inherited;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  PageControl1.OwnerDraw := True;
end;

procedure TForm1.PageControl1DrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
begin
  beep;
end;

end.
