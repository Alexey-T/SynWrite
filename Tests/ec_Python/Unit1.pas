unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  ecPopupCtrl,
  Dialogs, ecSyntMemo, StdCtrls, XPMan, ecSyntAnal, ComCtrls, ecSyntTree,
  Menus;

type
  TForm1 = class(TForm)
    s: TSyntaxMemo;
    Button2: TButton;
    SyntaxManager1: TSyntaxManager;
    Button1: TButton;
    Button3: TButton;
    SyntaxTreeView1: TSyntaxTreeView;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    PopupMenu1: TPopupMenu;
    ccc1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Edit1Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure sContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
  private
    { Private declarations }
    fn: string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ATxSProc,
  ecCmdConst;

{$R *.dfm}

const
  fn_lxl='d:\t\py\lexlib.lxl';

procedure TForm1.FormCreate(Sender: TObject);
begin
  Syntaxtreeview1.UpdateDelay:= 2000;
  Syntaxmanager1.LoadFromFile(fn_lxl);
  fn:= 'd:\t\id_color.py';
  s.LoadFromFile(fn);
  s.Font.Name:= 'Consolas';
  s.SyntaxAnalyzer:= Syntaxmanager1.AnalyzerForFile(fn);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if syntaxmanager1.AnalyzerForFile(fn).CustomizeLexer then
    syntaxmanager1.SaveToFile(syntaxmanager1.FileName);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  s.Savetofile(fn);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  fn:= 'D:\t\folding.py';
  s.LoadFromFile(fn);
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  fn:= 'D:\WorkLexTest\Py\SublimeCodeIntel.py';
  s.LoadFromFile(fn);
end;

procedure TForm1.Button5Click(Sender: TObject);
var
  n:Integer;
begin
  //s.FullExpand();
  n:= s.CaretPos.Y;
  s.ToggleCollapseChildren(n);
  s.SetFocus;
  //s.CaretPos:= Point(0, n);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  s.FullCollapse();
end;

function EditorGetCollapsedRanges(Ed: TSyntaxMemo): string;
var
  i: Integer;
begin
  Result:= '';
  for i:= 0 to Ed.Lines.Count-1 do
    if Ed.IsLineCollapsed(i)=1 then
      Result:= Result+IntToStr(i)+',';
end;

procedure EditorSetCollapsedRanges(Ed: TSyntaxMemo; S: Widestring);
var
  S1: Widestring;
  N: Integer;
begin
  repeat
    S1:= SGetItem(S);
    if S1='' then Break;
    N:= StrToIntDef(S1, -1);
    if (N>=0) and (N<Ed.Lines.Count) then
      Ed.CollapseNearest(N);
  until false;
  Ed.Invalidate;
end;

{
function EditorGetCollapsedRanges(Ed: TSyntaxMemo): string;
var
  i: Integer;
begin
  Result:= '';
  with Ed do
    for i:= 0 to Collapsed.Count-1 do
      with Collapsed[i] do
        Result:= Result+Format('%d %d,', [StartPos, EndPos]);
end;
}

{
procedure EditorSetCollapsedRanges(Ed: TSyntaxMemo; S: Widestring);
var
  S1, S2: Widestring;
  NLine, NLines, NStart, NEnd, N: integer;
begin
  with Ed do
  begin
    Collapsed.Clear;
    repeat
      S1:= SGetItem(S, ',');
      if S1='' then Break;
      S2:= SGetItem(S1, ' ');
      NStart:= StrToIntDef(S2, -1);
      S2:= SGetItem(S1, ' ');
      NEnd:= StrToIntDef(S2, -1);
      NLine:= Ed.StrPosToCaretPos(NStart).Y;
      NLines:= Ed.StrPosToCaretPos(NEnd).Y - NLine + 1;
      Collapsed.Add(TCollapsedRange.Create(NLine, NStart, NEnd, NLines));
    until false;
    Invalidate;
  end;
end;
}

procedure TForm1.Edit1Click(Sender: TObject);
begin
  Edit1.Text:= EditorGetCollapsedRanges(s);
end;

procedure TForm1.Edit2Click(Sender: TObject);
begin
  EditorSetCollapsedRanges(s, Edit2.Text);
end;

procedure TForm1.sContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
begin
  Handled:= false;
end;

end.
