unit unSaveTabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, TntCheckLst, TntForms, TntStdCtrls, DKLang,
  ExtCtrls;

type
  TfmSaveTabs = class(TTntForm)
    List: TTntCheckListBox;
    DKLanguageController1: TDKLanguageController;
    Panel1: TPanel;
    bYes: TTntButton;
    bNo: TTntButton;
    bCancel: TTntButton;
    procedure TntFormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TntWideStrings;

{$R *.dfm}

procedure TfmSaveTabs.TntFormShow(Sender: TObject);
var
  i: Integer;
begin
  for i:= 0 to List.Items.Count-1 do
    List.Checked[i]:= true;
end;

end.
