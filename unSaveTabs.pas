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
    procedure TntFormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  TntWideStrings, unProc;

{$R *.dfm}

procedure TfmSaveTabs.TntFormShow(Sender: TObject);
var
  i: Integer;
begin
  for i:= 0 to List.Items.Count-1 do
    List.Checked[i]:= true;

  FixCheckListboxHorzScrollbar(List);
end;

procedure TfmSaveTabs.TntFormResize(Sender: TObject);
begin
  bNo.Left:= ClientWidth-bNo.Width-bCancel.Left;
  bYes.Left:= bNo.Left-bYes.Width-bCancel.Left;
end;

end.
