unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ATxSProc;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
const
  fn= 'd:\t\s.synw-snippet'; //'D:\T\synwrite.cpp.if.synw-snippet';
var
  Info: TSynSnippetInfo;
begin
  Memo1.Lines.Clear;

  Info.Id:= 'id1';
  Info.Name:= 'name1';
  Info.Lexers:= 'C,Pascal';
  Info.Text:= 'Про.........'#13'Про2...'#13'Про3';
  DoSaveSnippetToFile(fn, Info);

  if DoReadSnippetFromFile(fn, Info) then
  begin
    Memo1.Lines.Add('id: '+Info.Id);
    Memo1.Lines.Add('name: '+Info.Name);
    Memo1.Lines.Add('lex: '+Info.Lexers);
    Memo1.Lines.Add('text:');
    Memo1.Lines.Add(Info.Text);
  end
  else
    Memo1.Lines.Add('bad: '+fn);
end;

end.
