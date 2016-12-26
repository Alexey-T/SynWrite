unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FOldEditProc : procedure (var Msg:TMessage) of object;
    FOldEditProc2 : procedure (var Msg:TMessage) of object;
    procedure NewEditProc(var Msg: TMessage);
    procedure NewEditProc2(var Msg: TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses clipbrd;
{$R *.dfm}


procedure TForm1.NewEditProc(var Msg: TMessage);
begin
  case Msg.Msg of
  WM_PASTE:
    Edit1.SelText:='*T*';
  else
    FOldEditProc(Msg);
  end;
end;

procedure TForm1.NewEditProc2(var Msg: TMessage);
begin
  case Msg.Msg of
  WM_PASTE:
    Combobox1.SelText:='*T*';
  else
    FOldEditProc2(Msg);
  end;
end;

type
  TComboHk = class(TComboBox);

procedure TForm1.FormCreate(Sender: TObject);
var
  N: Integer;
begin
  FOldEditProc:=Edit1.WindowProc;
  Edit1.WindowProc:=NewEditProc;

end;

end.
