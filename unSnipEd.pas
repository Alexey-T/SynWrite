unit unSnipEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls;

type
  TfmSnippetEditor = class(TTntForm)
    box1: TTntGroupBox;
    bOk: TTntButton;
    bCan: TTntButton;
    labName: TTntLabel;
    edName: TTntEdit;
    labId: TTntLabel;
    edId: TTntEdit;
    labText: TTntLabel;
    memoText: TTntMemo;
    labLex: TTntLabel;
    edLex: TTntEdit;
    procedure bOkClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  ATxSProc;

{$R *.dfm}

procedure TfmSnippetEditor.bOkClick(Sender: TObject);
begin
  edName.Text:= Trim(edName.Text);
  edId.Text:= Trim(edId.Text);
  edLex.Text:= Trim(edLex.Text);

  if (edName.Text='') then
    begin MessageBeep(mb_iconwarning); edName.SetFocus; Exit end;

  if (edId.Text<>'') and not IsWordString(edId.Text) then
    begin MessageBeep(mb_iconwarning); edId.SetFocus; Exit end;

  if (memoText.Lines.Count=0) then
    begin MessageBeep(mb_iconwarning); memoText.SetFocus; Exit end;

  ModalResult:= mrOk;
end;

end.
