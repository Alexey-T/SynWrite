unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
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
  ATxHttpProc;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  fn, s: string;
begin
  fn:= 'd:\Work\PyLexImport\split_lexlib_to_lexer_files.py';
  Listbox1.Items.Clear;
  s:= UrlRequest('localhost',
    Format('?action=autocomp&fn=%s&line=%d&column=%d', [UrlEncode(fn), 16, 16]),
    '?action=noclose',
    11112);
  Listbox1.Items.Text:= s;
end;

end.
