unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan;

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Cl(Sender: TObject; const s: Widestring);
  end;

var
  Form1: TForm1;

implementation

uses unClips;

{$R *.dfm}

procedure TForm1.Cl(Sender: TObject; const s: Widestring);
begin
  Showmessage('"'+S+'"');
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  with TfmClips.Create(nil) do
  try
    InitClips('d:\s\Template\clips');
    OnClick:= Cl;
    Showmodal
  finally
    Free
  end;
  Application.Terminate;
end;

end.
 