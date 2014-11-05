unit unInputCheckList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, 
  TntStdCtrls, TntComCtrls, TntForms;

type
  TfmInputCheckList = class(TTntForm)
    Panel1: TPanel;
    List: TTntListView;
    bOk: TTntButton;
    bCancel: TTntButton;
    procedure TntFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses DKLang;

{$R *.dfm}

procedure TfmInputCheckList.TntFormShow(Sender: TObject);
begin
  bOk.Caption:= DKLangConstW('MButtonOk');
  bCancel.Caption:= DKLangConstW('MButtonCancel');
end;

end.
