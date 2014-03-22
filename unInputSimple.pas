unit unInputSimple;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, TntStdCtrls, TntForms;

type
  TfmInputSimple = class(TTntForm)
    btnOK: TTntButton;
    btnCancel: TTntButton;
    edName: TTntComboBox;
    labRename: TTntLabel;
    procedure edNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOldName: WideString;
  public
    { Public declarations }
    FEnablePrevValue: boolean;
  end;

implementation

uses
  DKLang,
  ATxSProc;

{$R *.dfm}

procedure TfmInputSimple.edNameChange(Sender: TObject);
begin
  btnOK.Enabled:= FEnablePrevValue or ((edName.Text<>'') and (edName.Text<>FOldName));
end;

procedure TfmInputSimple.FormShow(Sender: TObject);
begin
  FOldName:= edName.Text;
  edNameChange(Self);
end;

procedure TfmInputSimple.TntFormCreate(Sender: TObject);
begin
  FEnablePrevValue:= false;

  btnOK.Caption:= DKLangConstW('sOk');
  btnCancel.Caption:= DKLangConstW('sCan');
end;

end.
