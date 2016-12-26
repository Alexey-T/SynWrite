unit ec_SplitLn;

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

uses StrUtils;

{$R *.dfm}

type
  TCharSet = set of AnsiChar;

function SFormatLines(const S: Widestring; BreakChars: TCharSet;
  Margin: integer): Widestring;
var
  nSt, nEnd: integer;
  Ln: Widestring;
begin
  Result:= S;
  if Length(S)<2 then Exit;
  nSt:= 1;
  repeat
    nEnd:= nSt+1;
    while (nEnd-nSt<Margin) and (nEnd<Length(Result)) and
      not (AnsiChar(Result[i]) in BreakChars) do Inc(nEnd);
    if nEnd=Length(S) then Exit;
  until false;  
end;

procedure TForm1.FormCreate(Sender: TObject);
var s: Widestring;
begin
  s:= 'w w w w w w w w w w w w w w w w w w w w w ww ww';
  s:= SFormatLines(s, [' ', #9], 5);
  memo1.Text:= s;
end;

end.
