unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Memo2: TMemo;
    Memo3: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ATxLoremIpsum;

{$R *.dfm}

procedure IList(L: TStringList);
begin
  L.Clear;
  L.Add('1. This is text.');
  L.Add('This is another text.');
  L.Add('');
  L.Add('2. Hello some text.');
  L.Add('Hi there is ok?');
  L.Add('Hello some some...');
  L.Add('');
  L.Add('3. This is some txt.');
  L.Add('And some.');
end;

procedure TForm1.FormCreate(Sender: TObject);
var l: TstringList;
begin
  l:= TStringList.create;
  IList(L);
  Memo1.Text:= SLoremIpsum(L, swSent, 50, false, sLineBreak);
  Memo2.Text:= SLoremIpsum(L, swPara, 20, true, sLineBreak);
end;

end.
 