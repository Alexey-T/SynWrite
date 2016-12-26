unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ecSyntAnal, ExtCtrls, unMap, StdCtrls, Spin;

type
  TForm1 = class(TForm)
    sm: TSyntaxManager;
    s: TSyntaxMemo;
    Panel1: TPanel;
    SyntTextSource1: TSyntTextSource;
    Panel2: TPanel;
    Splitter1: TSplitter;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Label3: TLabel;
    Button2: TButton;
    ColorBox1: TColorBox;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button3: TButton;
    PanelTest: TPanel;
    Box1: TPaintBox;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure sScroll(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sResize(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure sAfterLineDraw(Sender: TObject; Rect: TRect; Line: Integer);
    procedure sExit(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sChange(Sender: TObject);
    procedure Box1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Box1Click(Sender: TObject);
  private
    { Private declarations }
    fmMap: TfmMap;
    procedure UpdateStatesBar(Ed: TSyntaxMemo);
    function GetStatesBarLine(X, Y: Integer): Integer;
  public
    { Public declarations }
    procedure MapClick(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses
  ecMemoStrings;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  fmMap:= TfmMap.Create(Self);
  with fmMap do
  begin
    Parent:= Panel1;
    Align:= alClient;
    BorderStyle:= bsNone;
    FOnMapClick:= MapClick;
    Show;
  end;

  s.Lines.Add('wwwwwwwwwwww');
  s.Lines.Add('wwwwwwwww');
end;

procedure TForm1.MapClick(Sender: TObject);
begin
  s.CaretPos:= (Sender as TSyntaxMemo).CaretPos;
  s.TopLine:= s.CaretPos.Y - s.ClientHeight div s.DefLineHeight div 2;
end;

procedure TForm1.sScroll(Sender: TObject);
begin
  fmMap.SyncMapPos(s);
  Timer1.Enabled:= true;
end;

procedure TForm1.Button1Click(Sender: TObject);
var a: TSyntAnalyzer;
begin
if not fileexists(edit2.text) then raise exception.Create('lxl');
if not fileexists(edit1.text) then raise exception.Create('file');

  sm.LoadFromFile(Edit2.Text);
  s.LoadFromFile(Edit1.Text);
  a:= sm.AnalyzerForFile(Edit1.text);
  if a<>nil then
    s.SyntaxAnalyzer:= a;

  fmMap.SyncMapData(s);
  fmMap.SyncMapPos(s);
  Checkbox1Click(Self);

  //showmessage(inttostr(fmMap.edMap.StapleOffset));
end;

procedure TForm1.sResize(Sender: TObject);
begin
  fmMap.SyncMapPos(s);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  fmMap.SyncMapData(nil);
end;

procedure TForm1.ColorBox1Change(Sender: TObject);
begin
  fmMap.SetMapColor(Colorbox1.Selected);
end;

procedure TForm1.SpinEdit1Change(Sender: TObject);
begin
  fmMap.SetMapZoom(spinedit1.Value);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  fmMap.SetMapScrollBars(Checkbox2.Checked, Checkbox1.Checked);
end;

procedure TForm1.sAfterLineDraw(Sender: TObject; Rect: TRect;
  Line: Integer);
var p:TPoint;
begin
  if s.Focused then
    Exit;
  p:= s.CaretPos;
  p:= s.CaretToMouse(p.x, p.y);
  s.Canvas.Pen.Color:= clRed;
  s.Canvas.Pen.Width:= 2;
  s.Canvas.MoveTo(p.X, p.y);
  s.Canvas.LineTo(p.x, p.y+s.DefLineHeight);
end;

procedure TForm1.sExit(Sender: TObject);
begin
  s.Invalidate;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  s.BeginUpdate;
  Application.ProcessMessages;
  Application.Minimize;
  Application.Restore;

  s.Lines.Add('wwwwwwwwww');
  s.Lines.Add('wwwwwwwwww');
  s.Lines.Delete(0);
  
  Application.ProcessMessages;
  with TForm.Create(Self) do
  try
    showmodal
  finally
    free
  end;    
  s.EndUpdate();
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  UpdateStatesBar(s);
end;


procedure TForm1.UpdateStatesBar(Ed: TSyntaxMemo);
const
  cStateColumnSize = 4;
  cColorFrame = clLtGray;
var
  T: TSyntTextSource;
  C: TCanvas;
  NCnt, C_w, C_h: Integer;
  i: Integer;
  N1, N2: Integer; //px coord of current line
  N1_Frame, N2_Frame: Integer; //px coord of visible frame
  NLineTop, NLineBottom: Integer; //number of top/bottom visible lines
  AColor: TColor;
begin
  Timer1.Enabled:= false;
  T:= SyntTextSource1;

  NCnt:= T.Lines.Count;
  if NCnt=0 then Exit;
  NLineTop:= Ed.TopLine;
  NLineBottom:= Ed.TopLine+ Ed.ClientHeight div Ed.DefLineHeight;

  C:= Box1.Canvas;
  C_w:= Box1.ClientWidth;
  C_h:= Box1.ClientHeight;

  //draw backgnd
  C.Brush.Color:= clBtnFace;
  C.FillRect(Rect(0, 0, C_w, C_h));

  //draw current frame
  N1_Frame:= Int64(C_h)*NLineTop div NCnt;
  N2_Frame:= Int64(C_h)*NLineBottom div NCnt;
  C.Brush.Color:= cColorFrame;
  C.FillRect(Rect(0, N1_Frame, C_h, N2_Frame));

  //draw line states
  for i:= 0 to NCnt-1 do
  begin
    case T.Lines.LineState[i] of
      lsModified: AColor:= Ed.LineStateDisplay.ModifiedColor;
      lsNew:      AColor:= Ed.LineStateDisplay.NewColor;
      lsSaved:    AColor:= Ed.LineStateDisplay.SavedColor;
      else        AColor:= clNone;
    end;

    if AColor<>clNone then
    begin
      N1:= Int64(C_h)*i div NCnt;
      N2:= Int64(C_h)*(i+1) div NCnt;
      C.Brush.Color:= AColor;
      C.FillRect(Rect(0, N1, Pred(cStateColumnSize), N2));
    end;
  end;
end;

procedure TForm1.sChange(Sender: TObject);
begin
  Timer1.Enabled:= true;
end;

procedure TForm1.Box1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var N: Integer;
begin
  N:= GetStatesBarLine(X, Y);
  Caption:= Format('Line %d', [N+1]);
end;

function TForm1.GetStatesBarLine(X, Y: Integer): Integer;
begin
  Result:= Int64(SyntTextSource1.Lines.Count) * Y div Box1.Height;
end;

procedure TForm1.Box1Click(Sender: TObject);
var
  N: Integer;
  P: TPoint;
begin
  P:= Mouse.CursorPos;
  P:= Box1.ScreenToClient(P);
  N:= GetStatesBarLine(P.X, P.Y);
  Dec(N, s.ClientHeight div s.DefLineHeight div 2); //center clicked point in editor
  if N<0 then N:= 0;
  s.TopLine:= N;
  UpdateStatesBar(s);
end;

end.
