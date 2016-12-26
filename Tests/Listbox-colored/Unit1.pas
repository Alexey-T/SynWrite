unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TForm1 = class(TForm)
    List: TTntListBox;
    procedure FormCreate(Sender: TObject);
    procedure ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ecStrUtils;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  List.Items.Add('nn');
  List.Items.Add('nn'#13#10'pp'#13#10'nn'#13#10'nn');
end;

procedure TForm1.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
  S, SS:Widestring;
  n:Integer;
begin
  with TListbox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= clMenuHighlight
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    {if odSelected in State then
      c:= clWindowText
    else}
      c:= Font.Color;

    S:= Items[Index];
    SS:= S;
    repeat
      n:= Pos(#13, S);
      if n>0 then
      begin
        SS:= Copy(S, 1, n-1);
        Canvas.Font.Color:= c;
        ecTextOut(Canvas, rect.left, rect.top, SS);
        Inc(Rect.Left, ecTextExtent(Canvas, SS).cx);
        Canvas.Font.Color:= clBlue;
        ecTextOut(Canvas, rect.left, rect.top, '/');
        Inc(Rect.Left, ecTextExtent(Canvas, '/').cx);
        Delete(S, 1, n);
      end
      else
      begin
        SS:= S;
        Canvas.Font.Color:= c;
        Canvas.TextOut(rect.left, rect.top, SS);
        Break
      end;
    until False;  
  end;
end;

end.
