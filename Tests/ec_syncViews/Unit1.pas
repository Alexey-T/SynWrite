unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ecSyntMemo;

type
  TForm1 = class(TForm)
    SyntaxMemo1: TSyntaxMemo;
    SyntaxMemo2: TSyntaxMemo;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SyntaxMemo1Scroll(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    v,h:Boolean;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  v:= not v;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  h:= not h;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  v:=true;
  h:=true;
  Syntaxmemo1.Lines.LoadFromFile('D:\T\Txt\plug_form.txt');
  Syntaxmemo2.Lines.LoadFromFile('D:\T\Txt\plug_form.txt');
end;

procedure TForm1.SyntaxMemo1Scroll(Sender: TObject);
var src,oth:TSyntaxmemo;
begin
  if (Sender = Syntaxmemo1) then
    begin src:= syntaxmemo1; oth:= Syntaxmemo2; end
  else
    begin src:= syntaxmemo2; oth:= Syntaxmemo1; end;

  if v then oth.TopLine:= src.TopLine;
  if h then oth.Scrollposx:= src.Scrollposx;
end;

end.
