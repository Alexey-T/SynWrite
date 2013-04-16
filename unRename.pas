unit unRename;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  StdCtrls, TntStdCtrls, TntForms;

type
  TfmRename = class(TTntForm)
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
    FEnablePrevValue: boolean;
    function GetFN: Widestring;
  end;

implementation

uses
  DKLang,
  ATxSProc;

{$R *.dfm}

procedure TfmRename.edNameChange(Sender: TObject);
begin
  btnOK.Enabled:= FEnablePrevValue or ((edName.Text<>'') and (GetFN<>FOldName));
end;

procedure TfmRename.FormShow(Sender: TObject);
begin
  FOldName:= GetFN;
  edNameChange(Self);
end;

function TfmRename.GetFN: Widestring;
begin
  Result:= edName.Text;
  if edExt.Text<>'' then
    Result:= Result+'.'+edExt.Text;
end;

procedure TfmRename.TntFormCreate(Sender: TObject);
begin
  FEnablePrevValue:= false;

  btnOK.Caption:= DKLangConstW('sOk');
  btnCancel.Caption:= DKLangConstW('sCan');
end;

end.
