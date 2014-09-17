{
Original:
EControl Syntax Editor SDK                                                 
Copyright (c) 2004 - 2008 EControl Ltd., Zaharov Michael                   

Modified by: Alexey (SynWrite)
- renamed class, set fonts
- DKLang
Used in open source with permission by M.Zaharov via e-mail.
}
{$I ecSyntEdit.INC}

unit unLexerStyles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
{$IFNDEF EC_VCL6_UP} ecColCombo,{$ENDIF}
  Dialogs, StdCtrls, ExtCtrls, ecSyntAnal, ecSyntMemo, ecsnStyleEdit,
  TntControls, TntForms, TntStdCtrls,
  DKLang;

type
  TfmLexerStyles = class(TTntForm)
    LB: TListBox;
    Label1: TTntLabel;
    Button2: TTntButton;
    Button3: TTntButton;
    SyntaxMemo1: TSyntaxMemo;
    SyntStyleFrame1: TSyntStyleFrame;
    FSynt: TSyntAnalyzer;
    DKLanguageController1: TDKLanguageController;
    procedure LBClick(Sender: TObject);
    procedure SyntaxMemo1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormShow(Sender: TObject);
  public
  end;

function DoLexerStylesDialog(Synt: TSyntAnalyzer): Boolean;

var
  OnBackupLexerStyles: procedure(ALexer: TSyntAnalyzer) of object;


implementation

{$R *.dfm}

function DoLexerStylesDialog(Synt: TSyntAnalyzer): Boolean;
begin
  with TfmLexerStyles.Create(nil) do
  try
    FSynt.Assign(Synt);
    Result := ShowModal = mrOk;
    if Result then
    begin
      Synt.Assign(FSynt);
      OnBackupLexerStyles(Synt);
    end;  
  finally
    Free;
  end;
end;

{ TfmLexerStyles }

procedure TfmLexerStyles.FormShow(Sender: TObject);
var i: integer;
begin
  SyntStyleFrame1.DisableStyle := True;
  SyntaxMemo1.Lines.Assign(FSynt.SampleText);
  for i := 0 to FSynt.Formats.Count - 1 do
    LB.Items.AddObject(FSynt.Formats[i].DisplayName, FSynt.Formats[i]);
  if LB.Items.Count > 0 then
    LB.ItemIndex := 0;
  LBClick(LB);
end;

procedure TfmLexerStyles.LBClick(Sender: TObject);
begin
  if LB.ItemIndex >= 0 then
    SyntStyleFrame1.Style := TSyntaxFormat(LB.Items.Objects[LB.ItemIndex])
  else
    SyntStyleFrame1.Style := nil;
end;

procedure TfmLexerStyles.SyntaxMemo1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var p: integer;
    F: TSyntaxFormat;
begin
  with SyntaxMemo1 do
   begin
    F := FormatAtPos(CaretPosToStrPos(MouseToCaret(X, Y)));
    if F <> nil then
     begin
       p := LB.Items.IndexOfObject(F);
       if p <> -1 then
        begin
          LB.ItemIndex := p;
          LBClick(LB);
        end;
     end;
   end;
  Abort;
end;

end.
