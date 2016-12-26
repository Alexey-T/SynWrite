unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ComCtrls, StdCtrls, ecCmdConst, ecPrint;

type
  TForm1 = class(TForm)
    ed: TSyntaxMemo;
    track: TTrackBar;
    Label1: TLabel;
    Button1: TButton;
    ecSyntPrinter1: TecSyntPrinter;
    procedure FormCreate(Sender: TObject);
    procedure trackChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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
  ed.Lines.Clear;
  ed.Lines.Add('Some text here..');
  ed.Lines.Add(#9#9'Test www');
end;

procedure TForm1.trackChange(Sender: TObject);
begin
  ed.Zoom:= track.Position;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //
  with ed.SelAttributes.
end;

end.
