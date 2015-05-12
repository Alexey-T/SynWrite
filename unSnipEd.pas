unit unSnipEd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, DKLang, ecSyntMemo;

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
    memoText: TSyntaxMemo;
    labLex: TTntLabel;
    edLex: TTntEdit;
    DKLanguageController1: TDKLanguageController;
    procedure bOkClick(Sender: TObject);
    procedure memoTextKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure TntFormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FFontSnippetsEditor: TFont;

implementation

uses
  ecStrUtils,
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
  if (Key=vk_return) and (Shift=[ssCtrl]) then
  begin
    ModalResult:= mrOk;
    Key:= 0;
    Exit
  end;    
end;

procedure TfmSnippetEditor.TntFormCreate(Sender: TObject);
begin
  //internally snippets have #13 line ends
  memoText.Lines.TextFormat:= tfNL;

  memoText.Font:= FFontSnippetsEditor;
  memoText.LineNumbers.Font:= FFontSnippetsEditor;
end;

initialization
  FFontSnippetsEditor:= TFont.Create;
  FFontSnippetsEditor.Name:= 'Courier New';
  FFontSnippetsEditor.Size:= 10;

finalization
  FreeAndNil(FFontSnippetsEditor);

end.
