unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ecSyntAnal;

type
  TForm1 = class(TForm)
    SyntaxManager1: TSyntaxManager;
    SyntAnalyzer1: TSyntAnalyzer;
    SyntaxMemo1: TSyntaxMemo;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    fn: string;
    procedure Saving(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

uses unSaveLex;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
  f: TSyntAnalyzer;
begin
  ecOnSavingLexer:= Saving;

  with syntaxmanager1 do
  begin
   LoadFromFile('d:\s\hl\LexLib.lxl');
   f:= FindAnalyzer('HTML documents');
  end;

  fn:= 'd:\t\S.ini';
  LoadLexerStylesFromFile(f, fn);

  //f.Customize;
  f.CustomizeLexer;

  SyntaxMemo1.Lines.LoadFromFile(fn);
end;

procedure TForm1.Saving(Sender: TObject);
begin
  SaveLexerStylesToFile(Sender as TSyntAnalyzer, fn);
end;

end.
