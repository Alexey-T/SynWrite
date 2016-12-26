unit Unit1a;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    t: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure tClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  t.Items.AddObject('a', TObject(11));
  t.Items.AddObject('b', TObject(22));
end;

procedure TForm1.tClick(Sender: TObject);
begin
  with t do
  if ItemIndex>=0 then
    Showmessage(Items[ItemIndex]+#13+Inttostr(integer(Items.Objects[ItemIndex])));
end;

end.
