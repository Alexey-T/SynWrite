unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan, StdCtrls;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unNumConv;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  with TfmNumConv.Create(nil) do
  try showmodal
  finally
    free
  end;
  Application.Terminate;
end;

end.
 