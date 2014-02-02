unit unSetupOvr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TntForms,
  Dialogs, StdCtrls, TntStdCtrls, DKLang, Spin;

type
  TfmSetupOvr = class(TTntForm)
    ListLex: TTntListBox;
    Label1: TTntLabel;
    edTab: TTntEdit;
    LabelTabStop: TTntLabel;
    edTabMode: TTntComboBox;
    LabelTabMode: TTntLabel;
    edText: TEdit;
    cbOvr: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    LabelWrap: TTntLabel;
    edWrap: TTntComboBox;
    LabelMargin: TTntLabel;
    edMargin: TSpinEdit;
    LabelSp: TTntLabel;
    edSpacing: TSpinEdit;
    edOptFill: TTntComboBox;
    LabelOptFill: TTntLabel;
    edWordChars: TTntEdit;
    LabelWordChars: TTntLabel;
    LabelBlanks: TTntLabel;
    edKeepBlanks: TTntComboBox;
    LabelTextShow: TLabel;
    cbAutoCase: TTntCheckBox;
    labAutoCloseHelp: TTntLabel;
    procedure cbOvrClick(Sender: TObject);
    procedure ListLexClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure edTabChange(Sender: TObject);
    procedure LabelTextShowClick(Sender: TObject);
    procedure labAutoCloseHelpClick(Sender: TObject);
  private
    { Private declarations }
    FUpdLock: boolean;
  public
    { Public declarations }
    FString: string;
    FDefTabStop: string;
    FDefTabMode,
    FDefMargin,
    FDefSpacing,
    FDefOptFill: integer;
  end;

implementation

uses
  StrUtils,
  ATxSProc,
  unProcHelp;

{$R *.dfm}

procedure TfmSetupOvr.cbOvrClick(Sender: TObject);
var
  en: boolean;
begin
  en:= cbOvr.Checked;
  edTab.Enabled:= en;
  edTabMode.Enabled:= en;
  edWrap.Enabled:= en;
  edMargin.Enabled:= en;
  edSpacing.Enabled:= en;
  edOptFill.Enabled:= en;
  edWordChars.Enabled:= en;
  edKeepBlanks.Enabled:= en;
  cbAutoCase.Enabled:= en;
  LabelTabStop.Enabled:= en;
  LabelTabMode.Enabled:= en;
  LabelWrap.Enabled:= en;
  LabelMargin.Enabled:= en;
  LabelOptFill.Enabled:= en;
  LabelSp.Enabled:= en;
  LabelWordChars.Enabled:= en;
  LabelBlanks.Enabled:= en;

  if not en then
  begin
    if ListLex.ItemIndex>=0 then
      SSetLexerOverride(en, FString, ListLex.Items[ListLex.ItemIndex], '', '', '', '', '', '', '', '', '');
    edTab.Text:= FDefTabStop;
    edTabMode.ItemIndex:= FDefTabMode;
    edWrap.ItemIndex:= 0;
    edMargin.Value:= FDefMargin;
    edSpacing.Value:= FDefSpacing;
    edOptFill.ItemIndex:= 0;
    edWordChars.Text:= '';
    edText.Text:= FString;
  end;
end;

procedure TfmSetupOvr.ListLexClick(Sender: TObject);
var
  Ovr: boolean;
  ATabStops, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
  AOptWordChars, AKeepBlanks, ACaseCorrect: string;
begin
  if ListLex.ItemIndex>=0 then
  begin
    Ovr:= SGetLexerOverride(FString, ListLex.Items[ListLex.ItemIndex],
      ATabStops, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
      AOptWordChars, AKeepBlanks, ACaseCorrect);
    cbOvr.Enabled:= true;
  end
  else
  begin
    Ovr:= false;
    cbOvr.Enabled:= false;
  end;

  FUpdLock:= true;
  cbOvr.Checked:= Ovr;
  if Ovr then
  begin
    edTab.Text:= ATabStops;
    edTabMode.ItemIndex:= StrToIntDef(ATabMode, FDefTabMode);
    edWrap.ItemIndex:= StrToIntDef(AWrap, 0);
    edMargin.Value:= StrToIntDef(AMargin, FDefMargin);
    edSpacing.Value:= StrToIntDef(ASpacing, FDefSpacing);
    edOptFill.ItemIndex:= StrToIntDef(AOptFill, 0);
    edKeepBlanks.ItemIndex:= StrToIntDef(AKeepBlanks, 0);
    edWordChars.Text:= AOptWordChars;
    cbAutoCase.Checked:= Bool(StrToIntDef(ACaseCorrect, 0));
  end
  else
  begin
    edTab.Text:= FDefTabStop;
    edTabMode.ItemIndex:= FDefTabMode;
    edWrap.ItemIndex:= 0;
    edMargin.Value:= FDefMargin;
    edSpacing.Value:= FDefSpacing;
    edOptFill.ItemIndex:= 0;
    edKeepBlanks.ItemIndex:= 0;
    edWordChars.Text:= '';
    cbAutoCase.Checked:= false;
  end;

  FUpdLock:= false;
  cbOvrClick(Self);
end;

procedure TfmSetupOvr.TntFormShow(Sender: TObject);
begin
  edTab.Text:= FDefTabStop;
  edTabMode.ItemIndex:= FDefTabMode;
  edWrap.ItemIndex:= 0;
  edMargin.Value:= FDefMargin;
  edSpacing.Value:= FDefSpacing;
  edOptFill.ItemIndex:= 0;
  edWordChars.Text:= '';
  edText.Text:= FString;
  ListLex.ItemIndex:= 0;
  ListLexClick(Self);
end;

procedure TfmSetupOvr.TntFormCreate(Sender: TObject);
begin
//
end;

procedure TfmSetupOvr.edTabChange(Sender: TObject);
var
  S: Widestring;
begin
  if FUpdLock then Exit;
  if cbOvr.Checked then
    if ListLex.ItemIndex>=0 then
    begin
      //don't allow to enter ',' or ';' into edit fields
      if (Pos(',', edWordChars.Text)>0) or
        (Pos(';', edWordChars.Text)>0) then
      begin
        MessageBeep(mb_iconwarning);
        S:= edWordChars.Text;
        SReplaceAllW(S, ',', '');
        SReplaceAllW(S, ';', '');
        edWordChars.Text:= S;
      end;

      SSetLexerOverride(true, FString,
        ListLex.Items[ListLex.ItemIndex],
        {Op1}edTab.Text,
        {Op2}IntToStr(edTabMode.ItemIndex),
        {Op3}IntToStr(edWrap.ItemIndex),
        {Op4}IntToStr(edMargin.Value),
        {Op5}IntToStr(edSpacing.Value),
        {Op6}IntToStr(edOptFill.ItemIndex),
        {Op7}edWordChars.Text,
        {Op8}IntToStr(edKeepBlanks.ItemIndex),
        {Op9}IntToStr(Ord(cbAutoCase.Checked))
        );
      edText.Text:= FString;
    end;
end;

procedure TfmSetupOvr.LabelTextShowClick(Sender: TObject);
begin
  with edText do
    Visible:= not Visible; 
end;

procedure TfmSetupOvr.labAutoCloseHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpAutoCase, Handle);
end;

end.
