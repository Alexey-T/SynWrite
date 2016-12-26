unit Un;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TForm1 = class(TForm)
    TntComboBox1: TTntComboBox;
    ComboBox1: TComboBox;
    procedure ComboBox1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.ComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
  if (key in [#0..#27]) then
  begin
    key:= #0;
    Exit
  end;  
end;

end.
