unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ecPopupCtrl,
  Dialogs, ecSyntMemo, StdCtrls, XPMan;

type
  TForm1 = class(TForm)
    s: TSyntaxMemo;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure sCaretPosChanged(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sClick(Sender: TObject);
    procedure sExecuteCommand(Sender: TObject; Command: Integer;
      Data: Pointer; var Handled: Boolean);
    procedure sKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
    hh: THintWindow;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ecCmdConst;

{$R *.dfm}

type
  ht = class(THintWindow);

procedure TForm1.FormCreate(Sender: TObject);
var i:integer;
begin
  s.NonPrintedEolDetails:= true;
  for i:= 1 to 40 do
    s.Lines.Add('Test test');

  hh:= THintWindow.Create(s);
  hh.Parent:= s;
  hh.Color:= clInfoBk;
  //ht(hh).OnClick:= hClick;
end;

procedure TForm1.sCaretPosChanged(Sender: TObject);
var p:TPoint;
const
  dx = 10;
begin
  with s do
  begin
    p:= CaretPos;
    if (p.X <= ScrollPosX + dx) or
      (p.X >= ScrollPosX + (ClientWidth - Gutter.Width) div DefTextExt.cx - dx) then
      ScrollPosX:= p.X - dx;
  end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if s.WordAtPos(s.CaretPos)<>'' then
    s.SelectWord;
  s.SetFocus;
end;

procedure TForm1.Button2Click(Sender: TObject);
var p: TPoint;
  r: TRect;
  Str: string;
begin
  p:= s.ClientToScreen(Point(1, 1));

  str:= 'bbbb'#13'bbbbbbb'#13'bbbbbbbbbbbbbbbbbbbb';
  r:= hh.CalcHintRect(MaxInt, str, nil);
  hh.ActivateHint(Rect(p.x, p.y, p.x+r.Right, p.y+r.Bottom), str);
end;

procedure TForm1.sClick(Sender: TObject);
begin
  if hh.Visible then
    hh.Hide;
end;

procedure TForm1.sExecuteCommand(Sender: TObject; Command: Integer;
  Data: Pointer; var Handled: Boolean);
begin
  if (Command=smChar) and (string(PChar(Data))='>') then
  begin Messagebeep(0); Handled:= true; exit end;
end;

procedure TForm1.sKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  {
  if s.Dragging then
    if Key=vk_control then
      s.DragCursor:= crCross;
      }
end;

end.
