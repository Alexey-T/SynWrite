unit unAbout;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, DKLang;

type
  TfmAbout = class(TTntForm)
    GroupBox4: TTntGroupBox;
    Label12: TTntLabel;
    Label11: TTntLabel;
    Label9: TTntLabel;
    LabelWn: TTntLabel;
    GroupBox5: TTntGroupBox;
    LabelW1: TTntLabel;
    Button1: TTntButton;
    Labelw2: TTntLabel;
    LabelW0: TTntLabel;
    Label4: TTntLabel;
    LabelWEm: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    LabelWV: TLabel;
    Labelw3: TTntLabel;
    LabelWA: TTntLabel;
    LabelForum: TTntLabel;
    procedure Button1Click(Sender: TObject);
    procedure LabelWEmClick(Sender: TObject);
    procedure LabelW1Click(Sender: TObject);
    procedure Labelw2Click(Sender: TObject);
    procedure Labelw3Click(Sender: TObject);
    procedure LabelWAClick(Sender: TObject);
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

procedure TfmAbout.LabelWEmClick(Sender: TObject);
begin
  FOp('mailto:support@uvviewsoft.com?subject=SynWrite');
end;

procedure TfmAbout.LabelW1Click(Sender: TObject);
begin
  FOp('http://www.econtrol.ru/');
end;

procedure TfmAbout.Labelw2Click(Sender: TObject);
begin
  FOp('https://sourceforge.net/projects/synwrite/');
end;

procedure TfmAbout.Labelw3Click(Sender: TObject);
begin
  FOp('http://www.uvviewsoft.com/synwrite/');
end;

procedure TfmAbout.LabelWAClick(Sender: TObject);
begin
  FOp('http://www.addictivesoftware.com/');
end;

procedure TfmAbout.LabelForumClick(Sender: TObject);
begin
  FOp('http://synwrite.sourceforge.net/forums/');
end;

end.
