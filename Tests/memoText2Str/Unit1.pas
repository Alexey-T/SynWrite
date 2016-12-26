unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    procedure Memo1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses atxSProc;

{$R *.dfm}

type
  TEscapeRec = record
    sFrom: char;
    sTo: string;
  end;

const
  cRecodeSpec: array[0..3] of TEscapeRec =
    ((sFrom: #13; sTo: '\r'),
     (sFrom: #10; sTo: '\n'),
     (sFrom: #9; sTo: '\t'),
     (sFrom: '\'; sTo: '\\')
     );

  cRecodeRegex: array[0..14] of TEscapeRec =
    ((sFrom: #13; sTo: '\r'),
     (sFrom: #10; sTo: '\n'),
     (sFrom: #9; sTo: '\t'),
     (sFrom: '\'; sTo: '\\'),
     (sFrom: '('; sTo: '\('),
     (sFrom: ')'; sTo: '\)'),
     (sFrom: '['; sTo: '\['),
     (sFrom: ']'; sTo: '\]'),
     (sFrom: '{'; sTo: '\{'),
     (sFrom: '}'; sTo: '\}'),
     (sFrom: '.'; sTo: '\.'),
     (sFrom: '+'; sTo: '\+'),
     (sFrom: '-'; sTo: '\-'),
     (sFrom: '*'; sTo: '\*'),
     (sFrom: '?'; sTo: '\?')
     );

function SEscapeStr(const s: Widestring; const Rec: array of TEscapeRec): Widestring;
var i, j:Integer;
  r: Integer;
begin
  Result:= '';
  for i:= 1 to Length(s) do
  begin
    r:= -1;
    for j:= 0 to Length(Rec)-1 do
      if char(s[i])=Rec[j].sFrom then
        begin r:= j; Break end;
    if r>=0 then
      Result:= Result+Rec[r].sTo
    else
      Result:= Result+s[i];
  end;
end;

{
function SEscapeSpec_(const s: Widestring): Widestring;
begin
  Result:= SEscapeStr(s, cRecodeSpec);
end;

function SEscapeRegex_(const s: Widestring): Widestring;
begin
  Result:= SEscapeStr(s, cRecodeRegex);
end;
}

procedure TForm1.Memo1Change(Sender: TObject);
begin
  Edit1.Text:= SEscapeRegex(Memo1.Lines.Text);
end;

end.
