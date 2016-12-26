unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ExtCtrls,
  ATSyntMemo, StdCtrls, ecSyntAnal, ecKeyMap, Menus;

type
  TForm1 = class(TForm)
    ed: TSyntaxMemo;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    opEn: TCheckBox;
    Label3: TLabel;
    opInText: TCheckBox;
    MainMenu1: TMainMenu;
    Command1: TMenuItem;
    Caretsfromselectionleftedge1: TMenuItem;
    Caretsfromselectionrightedge1: TMenuItem;
    Caretsfromselectionclearselection1: TMenuItem;
    N1: TMenuItem;
    Removecaretsleave1st1: TMenuItem;
    Removecaretsleavelast1: TMenuItem;
    N2: TMenuItem;
    Extup1line1: TMenuItem;
    Extdown1line1: TMenuItem;
    Extendup1page1: TMenuItem;
    Extenddown1page1: TMenuItem;
    Extenduptillbegin1: TMenuItem;
    Extenddowntillend1: TMenuItem;
    N3: TMenuItem;
    Caretsfrommarksleft1: TMenuItem;
    Caretsfrommarksright1: TMenuItem;
    Caretsfrommarksclear1: TMenuItem;
    N4: TMenuItem;
    EnterIMEstring1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bRemoveClick(Sender: TObject);
    procedure opEnClick(Sender: TObject);
    procedure opInTextClick(Sender: TObject);
    procedure Caretsfromselectionleftedge1Click(Sender: TObject);
    procedure Caretsfromselectionrightedge1Click(Sender: TObject);
    procedure Caretsfromselectionclearselection1Click(Sender: TObject);
    procedure Removecaretsleave1st1Click(Sender: TObject);
    procedure Removecaretsleavelast1Click(Sender: TObject);
    procedure Extup1line1Click(Sender: TObject);
    procedure Extdown1line1Click(Sender: TObject);
    procedure Extendup1page1Click(Sender: TObject);
    procedure Extenddown1page1Click(Sender: TObject);
    procedure Extenduptillbegin1Click(Sender: TObject);
    procedure Extenddowntillend1Click(Sender: TObject);
    procedure edKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Caretsfrommarksleft1Click(Sender: TObject);
    procedure Caretsfrommarksright1Click(Sender: TObject);
    procedure Caretsfrommarksclear1Click(Sender: TObject);
    procedure EnterIMEstring1Click(Sender: TObject);
  private
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ecCmdConst;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
//
end;

procedure TForm1.FormShow(Sender: TObject);
const
  fn_lxl = 'd:\s\hl\LexLib.lxl';
begin
  //SyntaxManager1.LoadFromFile(fn_lxl);

  with ed.Lines do
  begin
    clear;
    add('ttt tttt tt');
    add(#9#9'tt');
    add(#9#9'tt');
    add(#9#9'tt');
    add(#9#9'tt');
    add('a.dd dddddddd, ddddddddd dddd');
    add('b.dd+ dddddddd, dddd');
    add('c.ddd dddddddd, dddddd');
    add('d.dd dddd');
    add('');
    add('dd dddddddd dddd');
    add('  a)dd dddddddd, ddddddddd dddd');
    add('  b)dd dddd, ddddddd dddd ddddd');
    add('dd ddddd, ddddddddd dddd ddd dddd ddd');
    add('  a)dd dddddddd, ddddddddd dddd');
    add('  b)dd dddd, ddd dddd ddd');
    add('  c)dd ddddd, ddddddddd dddd');
    add('  d)dd dddddd, dddddd dddd');
    add('dd dddd, dddddd dddd');
    add('    a)dd dddddd, dddddddddddd dddd');
    add('    b)dd dddddddd, ddddddd dddd');
    add('    c)dd dddddd, dddddd dddd');
    add('');
    add('dddd ddddddd dddddddd');
    add('dddd ddddd ddddd');
    add('dddd dddd dddd');
    add('dddd ddddd ddddd');
    add('ddd dddddd ddddd');
    add('dddd dddd dddddddddd');
    add('ddd ddddd dddddd');
    add('ddd dddddd dddddd');
    add('ddd dddd ddd');
    add('dddd ddddddd dddddddd');
    add('dddd ddddd ddddd');
    add('dddd dddd dddd');
    add('dddd ddddd ddddd');
    add('ddd dddddd ddddd');
    add('dddd dddd dddddddddd');
    add('ddd ddddd dddddd');
    add('ddd dddddd dddddd');
    add('ddd dddd ddd');
  end;

  {
  ed.SetSearchMark(100, 4, true);
  ed.SetSearchMark(106, 3, true);
  ed.SetSearchMark(110, 1, true);
  ed.SetSearchMark(152, 8, true);
  }

  ed.DefaultStyles.CurrentLine.Enabled:= true;
  ed.DefaultStyles.CurrentLine.BgColor:= clCream;
  ed.CaretsColorIndicator:=
    cciGutterbg;
    //cciLineBg;

  //ed.LineNumbers.Visible:= false;

  {
  ed.AddCaret(Point(2, 2));
  ed.AddCaret(Point(4, 2));
  ed.AddCaret(Point(4, 3));
  }
  ed.AddCaret(Point(4, 5), false);
  ed.AddCaret(Point(15, 5));
  ed.AddCaret(Point(10, 5));
  ed.AddCaret(Point(2, 10));
  ed.AddCaret(Point(7, 10));
end;

procedure TForm1.bRemoveClick(Sender: TObject);
begin
  ed.ExecCommand(smCaretsRemoveLeaveFirst);
  ed.SetFocus;
end;

procedure TForm1.opEnClick(Sender: TObject);
begin
  ed.CaretsEnabled:= opEn.Checked;
end;

procedure TForm1.opInTextClick(Sender: TObject);
begin
  if opInText.Checked then
    ed.Options:= ed.Options+[soKeepCaretInText]
  else
    ed.Options:= ed.Options-[soKeepCaretInText];
  ed.SetFocus;  
end;

procedure TForm1.Caretsfromselectionleftedge1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromSelLeft);
end;

procedure TForm1.Caretsfromselectionrightedge1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromSelRight);
end;

procedure TForm1.Caretsfromselectionclearselection1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromSelClear);
end;

procedure TForm1.Removecaretsleave1st1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsRemoveLeaveFirst);
end;

procedure TForm1.Removecaretsleavelast1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsRemoveLeaveLast);
end;

procedure TForm1.Extup1line1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsUpLine);
end;

procedure TForm1.Extdown1line1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsDownLine);
end;

procedure TForm1.Extendup1page1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsUpPage);
end;

procedure TForm1.Extenddown1page1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsDownPage);
end;

procedure TForm1.Extenduptillbegin1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsUpToEnd);
end;

procedure TForm1.Extenddowntillend1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsDownToEnd);
end;

procedure TForm1.edKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=vk_escape then
    ed.RemoveCarets();
end;

procedure TForm1.Caretsfrommarksleft1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromMarksLeft);
end;

procedure TForm1.Caretsfrommarksright1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromMarksRight);
end;

procedure TForm1.Caretsfrommarksclear1Click(Sender: TObject);
begin
  ed.ExecCommand(smCaretsFromMarksClear);
end;

procedure TForm1.EnterIMEstring1Click(Sender: TObject);
var
  S: Widestring;
begin
  S:= '<Проверка>';
  ed.ExecCommand(smString, PWChar(S));
end;

end.
