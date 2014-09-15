unit unPrintPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ecPrint, ExtCtrls, ComCtrls, Menus, ActnList,
  StdCtrls, ecActns, DKLang, TntForms, Buttons,
  TntButtons, TntStdCtrls;

type
  TfmPreview = class(TTntForm)
    ecPreview: TecSyntPreview;
    ActionList: TActionList;
    FirstCmd: TAction;
    PrevCmd: TAction;
    NextCmd: TAction;
    LastCmd: TAction;
    ZoomCmd: TAction;
    PrintCmd: TAction;
    CloseCmd: TAction;
    OptCmd: TAction;
    ecPrint: TecPrintAction;
    DKLanguageController1: TDKLanguageController;
    Panel1: TPanel;
    btnStart: TTntSpeedButton;
    btnPrev: TTntSpeedButton;
    btnNext: TTntSpeedButton;
    btnLast: TTntSpeedButton;
    btnOpt: TTntSpeedButton;
    btnPrint: TTntSpeedButton;
    btnClose: TTntSpeedButton;
    edView: TTntComboBox;
    edPage: TTntEdit;
    Label1: TLabel;
    edTotal: TTntEdit;
    edZoom: TTntComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FirstCmdExecute(Sender: TObject);
    procedure CloseCmdExecute(Sender: TObject);
    procedure PrintCmdExecute(Sender: TObject);
    procedure edPageExit(Sender: TObject);
    procedure OptCmdExecute(Sender: TObject);
    procedure OptCmdUpdate(Sender: TObject);
    procedure edViewChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edZoomChange(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure ecPreviewPageChanged(Sender: TObject);
  private
    //private
  public
    //public
  end;

procedure DoEditorPrintPreview(APrinter: TecCustomPrinter; const ATitle: Widestring);

implementation

{$R *.dfm}

procedure DoEditorPrintPreview(APrinter: TecCustomPrinter; const ATitle: Widestring);
begin
  with TfmPreview.Create(nil) do
  try
    APrinter.Title:= ATitle;
    APrinter.UpdatePages;
    ecPreview.SyntPrinter := APrinter;
    ecPrint.SyntPrinter := APrinter;
    Caption := Caption + ' - ' + ATitle;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmPreview.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmPreview.ActionListUpdate(Action: TBasicAction;
  var Handled: Boolean);
begin
  with ecPreview do
  begin
    PrintCmd.Enabled := Assigned(ecPreview.SyntPrinter);
    FirstCmd.Enabled := Page > 1;
    PrevCmd.Enabled := Page > 1;
    NextCmd.Enabled := (PageCount > 1) and (Page < PageCount);
    LastCmd.Enabled := (PageCount > 1) and (Page < PageCount);
  end;
end;

procedure TfmPreview.FirstCmdExecute(Sender: TObject);
begin
  with ecPreview do
  case (Sender as TComponent).Tag of
    1: Page := 1;
    2: Page := Page - 1;
    3: Page := Page + 1;
    4: Page := PageCount;
  end;
end;

procedure TfmPreview.CloseCmdExecute(Sender: TObject);
begin
  Close;
end;

procedure TfmPreview.PrintCmdExecute(Sender: TObject);
begin
  ecPreview.SyntPrinter.Print;
end;

procedure TfmPreview.edPageExit(Sender: TObject);
begin
  try
    ecPreview.Page := StrToIntDef(edPage.Text, 1);
  finally
    edPage.Text := IntToStr(ecPreview.Page);
  end;
end;

procedure TfmPreview.OptCmdExecute(Sender: TObject);
begin
  if ecPreview.SyntPrinter.PageSetup then
    ecPreview.UpdatePreview;
end;

procedure TfmPreview.OptCmdUpdate(Sender: TObject);
begin
  OptCmd.Enabled := ecPreview.SyntPrinter <> nil;
end;

procedure TfmPreview.edViewChange(Sender: TObject);
begin
  ecPreview.PreviewMode := TPreviewMode(edView.ItemIndex);
end;

procedure TfmPreview.FormKeyDown(Sender: TObject; var Key: Word;
 Shift: TShiftState);
begin
  if (Shift = []) and (Key = vk_escape) then
    Close;
end;

procedure TfmPreview.edZoomChange(Sender: TObject);
begin
  case edZoom.ItemIndex of
    0: ecPreview.ZoomMode := zmWholePage;
    1: ecPreview.ZoomMode := zmPageWidth;
    //2: none
    3: ecPreview.Zoom := 25;
    4: ecPreview.Zoom := 50;
    5: ecPreview.Zoom := 75;
    6: ecPreview.Zoom := 100;
    7: ecPreview.Zoom := 200;
  end;
end;

procedure TfmPreview.TntFormShow(Sender: TObject);
begin
  with edZoom.Items do
  begin
    Clear;
    Add(DKLangConstW('MPreviewZoomWhole'));
    Add(DKLangConstW('MPreviewZoomWidth'));
    Add('');
    Add('25%');
    Add('50%');
    Add('75%');
    Add('100%');
    Add('200%');
  end;

  edView.ItemIndex := 0;
  edZoom.ItemIndex := 0;
  ecPreviewPageChanged(Self);
end;

procedure TfmPreview.ecPreviewPageChanged(Sender: TObject);
begin
  edPage.Text := IntToStr(ecPreview.Page);
  edTotal.Text := IntToStr(ecPreview.PageCount);
end;

end.

