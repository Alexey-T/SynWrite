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

uses hh;
{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  viewhelp(0, 'c:\Program Files\AutoHotkey\AutoHotkey.chm', 'file attributes');
end;

end.
 