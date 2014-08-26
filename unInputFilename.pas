unit unInputFilename;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, TntStdCtrls, TntForms;

type
  TfmInputFilename = class(TTntForm)
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

procedure TfmInputFilename.edNameChange(Sender: TObject);
begin
  btnOK.Enabled:= (edName.Text<>'') and (GetFN<>FOldName);
end;

procedure TfmInputFilename.FormShow(Sender: TObject);
begin
  FOldName:= GetFN;
  edNameChange(Self);
end;

function TfmInputFilename.GetFN: Widestring;
begin
  Result:= edName.Text;
  if edExt.Text<>'' then
    Result:= Result+'.'+edExt.Text;
end;

procedure TfmInputFilename.TntFormCreate(Sender: TObject);
begin
  btnOK.Caption:= DKLangConstW('MButtonOk');
  btnCancel.Caption:= DKLangConstW('MButtonCancel');
end;

end.
