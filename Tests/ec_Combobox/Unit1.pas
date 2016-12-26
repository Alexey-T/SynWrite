unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ecEdits, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    cb: TSyntaxComboBox;
    XPManifest1: TXPManifest;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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
var
  s: Widestring;
  i: Integer;
begin
  s:= 'nnn'#13'bbbbbbbb'#13'ccccc';
  cb.Text:= s;
  for i:= 1 to 3 do
    cb.DropDownList.Items.Add(s);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  cb.MultiLine:= Checkbox1.Checked;
end;

end.
