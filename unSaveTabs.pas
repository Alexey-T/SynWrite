unit unSaveTabs;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst, TntCheckLst, TntForms, TntStdCtrls;

type
  TfmSaveTabs = class(TTntForm)
    bYes: TTntButton;
    bNo: TTntButton;
    List: TTntCheckListBox;
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
