unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
    FOutItem:Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


function SIsAct(const s: Widestring): boolean;
begin
  Result:= s='www';
end;

var
  opOutCSelBk: TColor =clDkGray;//clHighlight;
  opOutCSelText: TColor =clHighlighttext;
  opOutCRedText: TColor =clBlue;
  opOutCRedSelText: TColor =clYellow;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
begin
  with TListbox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= opOutCSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    if SIsAct(Items[Index]) then
    begin
      if odSelected in State then
        c:= opOutCRedSelText
      else
        c:= opOutCRedText
    end
    else
    begin
      if odSelected in State then
        c:= opOutCSelText
      else
        c:= Font.Color;
    end;    

    Canvas.Font.Color:= c;
    Canvas.TextOut(rect.left, rect.top, items[Index]);
  end;
end;


function SWr(const s: Widestring): Widestring;
begin
  Result:= s;//WrapText(s, 240);
end;

procedure TForm1.ListBox1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var n:Integer;
  S:Widestring;
begin
  with TListbox(Sender) do
  begin
    n:= ItemAtPos(Point(x, y), true);
    if n>=0 then
    begin
      S:= Items[n];
      if Canvas.TextWidth(S)>=ClientWidth then
      begin
        Hint:= S;
        Application.ActivateHint(ClientToScreen(Point(x, y)));
      end
      else
      begin
        Hint:= '';
        Application.HideHint;
      end;  
    end;
  end;
end;

procedure TForm1.ListBox1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if (Button = mbRight) then
  with TListbox(Sender) do
  begin
    FOutItem:= ItemAtPos(Point(x, y), true);
    ItemIndex:= FOutItem;
  end;
end;

end.
