unit unAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, DKLang;

type
  TfmAbout = class(TTntForm)
    gInfo: TTntGroupBox;
    Label12: TTntLabel;
    Label11: TTntLabel;
    Label9: TTntLabel;
    LabelWName: TTntLabel;
    gComp: TTntGroupBox;
    LabelWComp1: TTntLabel;
    Button1: TTntButton;
    LabelWSite2: TTntLabel;
    LabelWTitle: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    LabelWVersion: TLabel;
    LabelWSite: TTntLabel;
    LabelForum: TTntLabel;
    procedure Button1Click(Sender: TObject);
    procedure LabelWComp1Click(Sender: TObject);
    procedure LabelWSite2Click(Sender: TObject);
    procedure LabelWSiteClick(Sender: TObject);
    procedure LabelForumClick(Sender: TObject);
  private
    { Private declarations }
    procedure FOp(const s: string);
  public
    { Public declarations }
  end;

var
  fmAbout: TfmAbout;

implementation

uses ATxFProc;

{$R *.dfm}

procedure TfmAbout.Button1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmAbout.FOp(const s: string);
begin
  FOpenUrl(s, Handle);
end;

procedure TfmAbout.LabelWComp1Click(Sender: TObject);
begin
  FOp('http://www.econtrol.ru/');
end;

procedure TfmAbout.LabelWSite2Click(Sender: TObject);
begin
  FOp('https://sourceforge.net/projects/synwrite/');
end;

procedure TfmAbout.LabelWSiteClick(Sender: TObject);
begin
  FOp('http://www.uvviewsoft.com/synwrite/');
end;

procedure TfmAbout.LabelForumClick(Sender: TObject);
begin
  FOp('http://synwrite.sourceforge.net/forums/');
end;

end.
