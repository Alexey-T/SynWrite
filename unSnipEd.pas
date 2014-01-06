unit unSnipEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, DKLang;

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
    DKLanguageController1: TDKLanguageController;
    procedure bOkClick(Sender: TObject);
    procedure memoTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

  if (edId.Text<>'') and not IsWordString(edId.Text, true) then
    begin MessageBeep(mb_iconwarning); edId.SetFocus; Exit end;

  if (memoText.Lines.Count=0) then
    begin MessageBeep(mb_iconwarning); memoText.SetFocus; Exit end;

  ModalResult:= mrOk;
end;

procedure TfmSnippetEditor.memoTextKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) and (Shift=[]) then
  begin
    ModalResult:= mrCancel;
    Key:= 0;
    Exit
  end;  
end;

end.
