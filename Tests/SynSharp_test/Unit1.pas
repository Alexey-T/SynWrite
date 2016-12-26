unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  ATxTcp,
  ATxSomeproc;

{$R *.dfm}

const
  cPort = 2000;

procedure TForm1.Button1Click(Sender: TObject);
var
  fn, s: string;
  ln, col: integer;
  L: TStringList;

  function Req(const act: string): string;
  begin
    try
      Result:= HttpRequest(
        Format('/'+act+'?buffer=%s&filename=%s&line=%d&column=%d',
         [UrlEncode(L.Text), UrlEncode(fn), ln, col]),
      cPort);
    except
      Result:= ''
    end
  end;
begin
  fn:= 'g:\_OmniSharpServer\server\OmniSharp.Tests\AutoComplete\NamespaceCompletions.cs';
  ln:= 18;
  col:= 13;

  L:= TStringList.Create;
  L.LoadFromFile(fn);

  Memo1.Lines.Clear;
  s:= Req('gotodefinition');
  //s:= Req('gotoimplementation');
  SParseOmniSharp_Findid(s, fn, ln, col);
  Memo1.Lines.Text:= s;
  Memo1.Lines.Text:= 'File: '+fn+#13+'Line: '+Inttostr(ln)+#13+'Col: '+Inttostr(col);

  {
  s:= HttpRequest(
    Format('/autocomplete?buffer=%s&filename=%s&line=%d&column=%d',
      [UrlEncode(L.Text), UrlEncode(fn), ln, col]),
    cPort);
  s:= SParseOmniSharp(s);
  Memo1.Lines.Text:= s;
  }
end;

end.
