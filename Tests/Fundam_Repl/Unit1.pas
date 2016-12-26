unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs;

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses cStrings;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var s, srep, sfind: Widestring;
n:Integer;
begin
  s:= 'test#wwww testwww test test....test';
  sfind:= 'test';
  srep:= '--';
  s:= StrReplaceW(SFind, SRep, S, false, true, 1, N);
  Showmessage(s+#13+Inttostr(N));
  Application.Terminate;
end;

end.
 