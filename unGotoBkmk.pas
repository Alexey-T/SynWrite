unit unGotoBkmk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, TntForms, DKLang;

type
  TfmGotoBkmk = class(TTntForm)
    List: TTntListBox;
    bOk: TTntButton;
    bCan: TTntButton;
    TntLabel1: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    procedure ListDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TfmGotoBkmk.ListDblClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

end.
