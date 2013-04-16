unit unSetupOvr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  TntForms,
  Dialogs, StdCtrls, TntStdCtrls, DKLang, Spin;

type
  TfmSetupOvr = class(TTntForm)
    ListLex: TListBox;
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
    procedure cbOvrClick(Sender: TObject);
    procedure ListLexClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure edTabChange(Sender: TObject);
  private
    { Private declarations }
    FUpdLock: boolean;
  public
    { Public declarations }
    FString: string;
    FDefTabStop: string;
    FDefTabMode,
    FDefMargin,
    FDefSpacing: integer;
  end;

implementation

uses ATxSProc, StrUtils;

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
  LabelTabStop.Enabled:= en;
  LabelTabMode.Enabled:= en;
  LabelWrap.Enabled:= en;
  LabelMargin.Enabled:= en;
  labelSp.Enabled:= en;
  if not en then
  begin
    if ListLex.ItemIndex>=0 then
      SSetLexerOverride(en, FString, ListLex.Items[ListLex.ItemIndex], '', '', '', '', '');
    edTab.Text:= FDefTabStop;
    edTabMode.ItemIndex:= FDefTabMode;
    edWrap.ItemIndex:= 0;
    edMargin.Value:= FDefMargin;
    edSpacing.Value:= FDefSpacing;
    edText.Text:= FString;
  end;
end;

procedure TfmSetupOvr.ListLexClick(Sender: TObject);
var
  Ovr: boolean;
  ATabStops, ATabMode, AWrap, AMargin, ASpacing: string;
begin
  if ListLex.ItemIndex>=0 then
  begin
    Ovr:= SGetLexerOverride(FString, ListLex.Items[ListLex.ItemIndex],
      ATabStops, ATabMode, AWrap, AMargin, ASpacing);
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
  end
  else
  begin
    edTab.Text:= FDefTabStop;
    edTabMode.ItemIndex:= FDefTabMode;
    edWrap.ItemIndex:= 0;
    edMargin.Value:= FDefMargin;
    edSpacing.Value:= FDefSpacing;
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
  edText.Text:= FString;
  ListLex.ItemIndex:= 0;
  ListLexClick(Self);
end;

procedure TfmSetupOvr.TntFormCreate(Sender: TObject);
begin
//
end;

procedure TfmSetupOvr.edTabChange(Sender: TObject);
begin
  if FUpdLock then Exit;
  if cbOvr.Checked then
  if ListLex.ItemIndex>=0 then
  begin
    SSetLexerOverride(true, FString,
      ListLex.Items[ListLex.ItemIndex],
      {Op1}edTab.Text,
      {Op2}IntToStr(edTabMode.ItemIndex),
      {Op3}IntToStr(edWrap.ItemIndex),
      {Op4}IntToStr(edMargin.Value),
      {Op5}IntToStr(edSpacing.Value)
      );
    edText.Text:= FString;
  end;
end;

end.
