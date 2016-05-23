unit unSetupOvr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TntForms,
  Dialogs, StdCtrls, TntStdCtrls, DKLang, Spin, ExtCtrls;

type
  TfmSetupOvr = class(TTntForm)
    ListLex: TTntListBox;
    Label1: TTntLabel;
    edTabStops: TTntEdit;
    edText: TEdit;
    cbOvr: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    edMargin: TSpinEdit;
    edSpacing: TSpinEdit;
    edWordChars: TTntEdit;
    LabelWordChars: TTntLabel;
    LabelTextShow: TLabel;
    chkAutoCase: TTntCheckBox;
    LabelHelpAutoCase: TTntLabel;
    edIndent: TSpinEdit;
    chkTabStops: TTntCheckBox;
    chkTabMode: TTntCheckBox;
    chkWrap: TTntCheckBox;
    chkOptFill: TTntCheckBox;
    chkKeepBlanks: TTntCheckBox;
    chkIndent: TTntCheckBox;
    chkMargin: TTntCheckBox;
    chkSpacing: TTntCheckBox;
    edTabMode: TTntComboBox;
    edWrap: TTntComboBox;
    edOptFill: TTntComboBox;
    edKeepBlanks: TTntComboBox;
    chkTabColor: TTntCheckBox;
    edTabColor: TColorBox;
    chkColorUnderline: TTntCheckBox;
    procedure cbOvrClick(Sender: TObject);
    procedure ListLexClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure edTabStopsChange(Sender: TObject);
    procedure LabelTextShowClick(Sender: TObject);
    procedure LabelHelpAutoCaseClick(Sender: TObject);
    procedure chkTabStopsClick(Sender: TObject);
  private
    { Private declarations }
    FUpdLock: boolean;
    procedure DoClearAll;
  public
    { Public declarations }
    FString: string;
    FDefTabStop: string;
    FDefTabMode,
    FDefIndent,
    FDefMargin,
    FDefSpacing,
    FDefOptFill: integer;
    procedure UpdateString;
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
  edTabStops.Enabled:= en;
  edTabMode.Enabled:= en;
  edWrap.Enabled:= en;
  edIndent.Enabled:= en;
  edMargin.Enabled:= en;
  edSpacing.Enabled:= en;
  edOptFill.Enabled:= en;
  edWordChars.Enabled:= en;
  edKeepBlanks.Enabled:= en;
  edTabColor.Enabled:= en;
  LabelWordChars.Enabled:= en;

  chkTabStops.Enabled:= en;
  chkTabMode.Enabled:= en;
  chkWrap.Enabled:= en;
  chkOptFill.Enabled:= en;
  chkKeepBlanks.Enabled:= en;
  chkIndent.Enabled:= en;
  chkMargin.Enabled:= en;
  chkSpacing.Enabled:= en;
  chkAutoCase.Enabled:= en;
  chkTabColor.Enabled:= en;
  chkColorUnderline.Enabled:= en;

  if not en then
  begin
    if ListLex.ItemIndex>=0 then
      SSetLexerOverride(en, FString, ListLex.Items[ListLex.ItemIndex], '', '', '', '', '', '', '', '', '', '', '', '');

    DoClearAll;
    edText.Text:= FString;
  end;
end;

procedure TfmSetupOvr.ListLexClick(Sender: TObject);
var
  Ovr: boolean;
  ATabStops, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
  AOptWordChars, AKeepBlanks, ACaseCorrect, AIndent,
  ATabColor, AColorUnderline: string;
begin
  if ListLex.ItemIndex>=0 then
  begin
    Ovr:= SGetLexerOverride(FString, ListLex.Items[ListLex.ItemIndex],
      ATabStops, ATabMode, AWrap, AMargin, ASpacing, AOptFill,
      AOptWordChars, AKeepBlanks, ACaseCorrect, AIndent,
      ATabColor, AColorUnderline);
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
    chkTabStops.Checked:= ATabStops<>'';
    chkTabMode.Checked:= ATabMode<>'';
    chkWrap.Checked:= AWrap<>'';
    chkOptFill.Checked:= AOptFill<>'';
    chkKeepBlanks.Checked:= AKeepBlanks<>'';
    chkIndent.Checked:= AIndent<>'';
    chkMargin.Checked:= AMargin<>'';
    chkSpacing.Checked:= ASpacing<>'';
    chkTabColor.Checked:= ATabColor<>'';

    edTabStops.Text:= ATabStops;
    edTabMode.ItemIndex:= StrToIntDef(ATabMode, FDefTabMode);
    edWrap.ItemIndex:= StrToIntDef(AWrap, 0);
    edOptFill.ItemIndex:= StrToIntDef(AOptFill, 0);
    edKeepBlanks.ItemIndex:= StrToIntDef(AKeepBlanks, 0);
    edIndent.Value:= StrToIntDef(AIndent, FDefIndent);
    edMargin.Value:= StrToIntDef(AMargin, FDefMargin);
    edSpacing.Value:= StrToIntDef(ASpacing, FDefSpacing);
    if ATabColor<>'' then
      edTabColor.Selected:= StringToColor(ATabColor)
    else
      edTabColor.Selected:= clWhite;
    edWordChars.Text:= AOptWordChars;
    chkAutoCase.Checked:= Bool(StrToIntDef(ACaseCorrect, 0));
    chkColorUnderline.Checked:= Boolean(StrToIntDef(AColorUnderline, 0));
  end
  else
  begin
    DoClearAll;
  end;

  FUpdLock:= false;
  cbOvrClick(Self);
end;

procedure TfmSetupOvr.DoClearAll;
begin
  chkTabStops.Checked:= false;
  chkTabMode.Checked:= false;
  chkWrap.Checked:= false;
  chkOptFill.Checked:= false;
  chkKeepBlanks.Checked:= false;
  chkIndent.Checked:= false;
  chkMargin.Checked:= false;
  chkSpacing.Checked:= false;
  chkTabColor.Checked:= false;
  chkAutoCase.Checked:= false;
  chkColorUnderline.Checked:= false;

  edTabStops.Text:= FDefTabStop;
  edTabMode.ItemIndex:= FDefTabMode;
  edWrap.ItemIndex:= 0;
  edOptFill.ItemIndex:= 0;
  edKeepBlanks.ItemIndex:= 0;
  edIndent.Value:= FDefIndent;
  edMargin.Value:= FDefMargin;
  edSpacing.Value:= FDefSpacing;
  edTabColor.Selected:= clWhite;
  edWordChars.Text:= '';
end;


procedure TfmSetupOvr.TntFormShow(Sender: TObject);
begin
  edTabStops.Text:= FDefTabStop;
  edTabMode.ItemIndex:= FDefTabMode;
  edWrap.ItemIndex:= 0;
  edIndent.Value:= FDefIndent;
  edMargin.Value:= FDefMargin;
  edSpacing.Value:= FDefSpacing;
  edOptFill.ItemIndex:= 0;
  edTabColor.Selected:= clWhite;
  edWordChars.Text:= '';
  edText.Text:= FString;
  ListLex.ItemIndex:= 0;
  ListLexClick(Self);
end;

procedure TfmSetupOvr.TntFormCreate(Sender: TObject);
begin
//
end;

procedure TfmSetupOvr.edTabStopsChange(Sender: TObject);
begin
  UpdateString;
end;  

procedure TfmSetupOvr.UpdateString;
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
        {Op1}IfThen(chkTabStops.Checked, edTabStops.Text),
        {Op2}IfThen(chkTabMode.Checked, IntToStr(edTabMode.ItemIndex)),
        {Op3}IfThen(chkWrap.Checked, IntToStr(edWrap.ItemIndex)),
        {Op4}IfThen(chkMargin.Checked, IntToStr(edMargin.Value)),
        {Op5}IfThen(chkSpacing.Checked, IntToStr(edSpacing.Value)),
        {Op6}IfThen(chkOptFill.Checked, IntToStr(edOptFill.ItemIndex)),
        {Op7}edWordChars.Text,
        {Op8}IfThen(chkKeepBlanks.Checked, IntToStr(edKeepBlanks.ItemIndex)),
        {Op9}IfThen(chkAutoCase.Checked, '1'),
        {Op10}IfThen(chkIndent.Checked, IntToStr(edIndent.Value)),
        {Op11}IfThen(chkTabColor.Checked, ColorToString(edTabColor.Selected)),
        {Op12}IfThen(chkColorUnderline.Checked, '1')
        );
      edText.Text:= FString;
    end;
end;

procedure TfmSetupOvr.LabelTextShowClick(Sender: TObject);
begin
  with edText do
    Visible:= not Visible; 
end;

procedure TfmSetupOvr.LabelHelpAutoCaseClick(Sender: TObject);
begin
  SynHelpTopic(helpAutoCase, Handle);
end;

procedure TfmSetupOvr.chkTabStopsClick(Sender: TObject);
begin
  UpdateString;
end;

end.
