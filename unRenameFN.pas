unit unRenameFN;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, TntStdCtrls, TntForms;

type
  TfmRenameFN = class(TTntForm)
    btnOK: TTntButton;
    btnCancel: TTntButton;
    edName: TTntEdit;
    labRename: TTntLabel;
    edExt: TTntEdit;
    Label1: TTntLabel;
    procedure edNameChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
  private
    { Private declarations }
    FOldName: WideString;
  public
    { Public declarations }
    function GetFN: Widestring;
  end;

implementation

uses
  DKLang,
  ATxSProc;

{$R *.dfm}

procedure TfmRenameFN.edNameChange(Sender: TObject);
begin
  btnOK.Enabled:= (edName.Text<>'') and (GetFN<>FOldName);
end;

procedure TfmRenameFN.FormShow(Sender: TObject);
begin
  FOldName:= GetFN;
  edNameChange(Self);
end;

function TfmRenameFN.GetFN: Widestring;
begin
  Result:= edName.Text;
  if edExt.Text<>'' then
    Result:= Result+'.'+edExt.Text;
end;

procedure TfmRenameFN.TntFormCreate(Sender: TObject);
begin
  btnOK.Caption:= DKLangConstW('sOk');
  btnCancel.Caption:= DKLangConstW('sCan');
end;

end.
