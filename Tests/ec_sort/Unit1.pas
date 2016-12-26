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

uses ecUnicode;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var l: TWideStringList;
begin
  l:=TWidestringlist.create;
  l.Ascending:= true;
  l.Sorted:= true;
  l.add('-  1');
  l.add('--  4');
  l.add('--  2');
  l.add('-  3');
  //l.Sort;

  showmessage(l.Text);



end;

end.
 