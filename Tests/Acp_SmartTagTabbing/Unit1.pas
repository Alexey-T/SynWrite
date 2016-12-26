unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unProcTabbin;

{$R *.dfm}

type
TTagAction = record RngNum: integer; IsOuter: boolean end;

const
  s1p='<a href="www"  pp="pp" ></a>';
  //s1='<a   href="http://www.com/"  title=""  target="_blank" pp="pp"></a>';
  s1='<img src="ww"  aa="aa" width="10"  height="10"  alt="" />';
  
procedure TForm1.FormCreate(Sender: TObject);
var
  s: string;
begin
  s:= 'source:'#13+s1+#13#13+SGetTagRangesStr(s1);
  Showmessage(s);

  Edit1.Text:= s1p+s1;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key=VK_F1 then
    begin Button1Click(Self); Key:= 0; exit end;
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  selst, sellen:integer;
  s:string;
begin
  s:= s1;
  SelSt:= Edit1.SelStart+1;
  SelLen:= Edit1.SelLength;
  Dec(SelSt, Length(s1p));

  SGetTagTabbing(s, selst, sellen);
  if selst>0 then
  begin
    Edit1.SelStart:= selst-1+Length(s1p);
    Edit1.SelLength:= sellen;
  end
  else
  begin
    Edit1.SelStart:= Length(s1p+s);
  end;
end;

end.
