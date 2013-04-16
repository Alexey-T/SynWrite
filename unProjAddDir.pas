unit unProjAddDir;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls, DKLang;

type
  TfmProjAddDir = class(TTntForm)
    btnOk: TTntButton;
    btnCan: TTntButton;
    GroupBox1: TTntGroupBox;
    Label1: TTntLabel;
    Label2: TTntLabel;
    edInc: TTntEdit;
    edExc: TTntEdit;
    cbNoBin: TTntCheckBox;
    Label3: TTntLabel;
    edDir: TTntEdit;
    cbSubdir: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfmProjAddDir.FormShow(Sender: TObject);
begin
  edDir.SelStart:= Length(edDir.Text);
end;

end.
