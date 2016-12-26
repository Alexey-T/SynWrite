unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ecSyntMemo;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Ed: TSyntaxMemo;
    procedure FormCreate(Sender: TObject);
    procedure EdChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  unProc;

{$R *.dfm}

procedure TForm1.EdChange(Sender: TObject);
var
  STag, SAttr: string;
begin
  EditorGetHtmlTag(Ed, STag, SAttr);
  Label1.Caption:= STag;
  Label2.Caption:= SAttr;
end;

procedure TForm1.FormCreate(Sender: TObject);
const
  s = '<a pppp><br test="..." style="';
begin
  Ed.Lines.Clear;
  Ed.Lines.Add(s);
  EdChange(Self);
end;


end.
