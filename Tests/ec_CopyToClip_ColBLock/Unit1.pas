unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, StdCtrls;

type
  TForm1 = class(TForm)
    ed: TSyntaxMemo;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



function SUntab(const S: Widestring; TabSize: Integer): Widestring;
var
  i, NSize: Integer;
begin
  Result:= S;
  repeat
    i:= Pos(#9, Result);
    if i=0 then Break;

    NSize:= TabSize - ((i-1) mod TabSize);

    //don't do Delete, it's slower
    Result[i]:= ' ';
    Insert(StringOfChar(' ', NSize-1), Result, i);
  until false;
end;


procedure TForm1.FormCreate(Sender: TObject);
begin
  ed.Lines.LoadFromFile('bad-paste.txt');
end;

end.
