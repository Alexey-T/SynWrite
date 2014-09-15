unit unPrintPreview;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, ecPrint, ExtCtrls, ComCtrls, Menus, ActnList,
  StdCtrls, ecActns, DKLang, TB2Item, TntForms, Buttons,
  TntButtons, TntStdCtrls, SpTBXItem;

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
    btnZoom: TTntSpeedButton;
    btnOpt: TTntSpeedButton;
    btnPrint: TTntSpeedButton;
    btnClose: TTntSpeedButton;
    edView: TTntComboBox;
    edPage: TTntEdit;
    Label1: TLabel;
    edTotal: TTntEdit;
    mnuZoom: TSpTBXPopupMenu;
    mnuWhole: TSpTBXItem;
    mnuWidth: TSpTBXItem;
    mnu25: TSpTBXItem;
    mnu50: TSpTBXItem;
    mnu75: TSpTBXItem;
    mnu100: TSpTBXItem;
    mnu200: TSpTBXItem;
    mnu400: TSpTBXItem;
    SpTBXSeparatorItem1: TSpTBXSeparatorItem;
    procedure mnuWholeClick(Sender: TObject);
    procedure mnuWidthClick(Sender: TObject);
    procedure mnu400Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ActionListUpdate(Action: TBasicAction; var Handled: Boolean);
    procedure FirstCmdExecute(Sender: TObject);
    procedure CloseCmdExecute(Sender: TObject);
    procedure PrintCmdExecute(Sender: TObject);
    procedure ecPreviewPageChanged(Sender: TObject);
    procedure edPageExit(Sender: TObject);
    procedure OptCmdExecute(Sender: TObject);
    procedure OptCmdUpdate(Sender: TObject);
    procedure edViewChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure ZoomCmdExecute(Sender: TObject);
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
    APrinter.UpdatePages;
    ecPreview.SyntPrinter := APrinter;
    APrinter.Title:= ATitle;
    Caption := Caption + ' - ' + ATitle;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TfmPreview.mnuWholeClick(Sender: TObject);
begin
  ecPreview.ZoomMode := zmWholePage;
end;

procedure TfmPreview.mnuWidthClick(Sender: TObject);
begin
  ecPreview.ZoomMode := zmPageWidth;
end;

procedure TfmPreview.mnu400Click(Sender: TObject);
begin
  ecPreview.Zoom := (Sender as TComponent).Tag;
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

procedure TfmPreview.ecPreviewPageChanged(Sender: TObject);
begin
  edPage.Text := IntToStr(ecPreview.Page);
  edTotal.Text := IntToStr(ecPreview.PageCount);
  ecPrint.SyntPrinter := ecPreview.SyntPrinter;
end;

procedure TfmPreview.edPageExit(Sender: TObject);
begin
  try
    ecPreview.Page := StrToInt(edPage.Text);
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

procedure TfmPreview.FormCreate(Sender: TObject);
begin
  edView.ItemIndex:= 0;
end;

procedure TfmPreview.ZoomCmdExecute(Sender: TObject);
var
  p: TPoint;
begin
  p:= btnZoom.ClientToScreen(Point(0, btnZoom.Height));
  mnuZoom.Popup(p.X, p.Y);
end;

end.

