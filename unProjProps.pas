unit unProjProps;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls, ComCtrls, TntComCtrls, DKLang;

type
  TfmProjProps = class(TTntForm)
    btnOk: TTntButton;
    btnCan: TTntButton;
    Pages: TTntPageControl;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    edDirs: TTntMemo;
    Label4: TTntLabel;
    edWorkDir: TTntEdit;
    TntLabel1: TTntLabel;
    edMainFN: TTntEdit;
    btnWorkDir: TTntButton;
    TntLabel3: TTntLabel;
    Label1: TTntLabel;
    cbEnc: TTntComboBox;
    Label2: TTntLabel;
    cbEnds: TTntComboBox;
    Label3: TTntLabel;
    cbLexer: TTntComboBox;
    btnDirAdd: TTntButton;
    TntLabel2: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    TntLabel4: TTntLabel;
    cbSort: TTntComboBox;
    procedure btnWorkDirClick(Sender: TObject);
    procedure btnDirAddClick(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure edDirsKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses
  TntFileCtrl;

{$R *.dfm}

procedure TfmProjProps.btnWorkDirClick(Sender: TObject);
var
  SDir: Widestring;
begin
  SDir:= edWorkDir.Text;
  if WideSelectDirectory('', '', SDir) then
    edWorkDir.Text:= SDir;
end;

procedure TfmProjProps.btnDirAddClick(Sender: TObject);
var
  SDir: Widestring;
begin
  SDir:= edWorkDir.Text;
  if WideSelectDirectory('', '', SDir) then
    edDirs.Lines.Add(SDir);
end;

procedure TfmProjProps.TntFormShow(Sender: TObject);
begin
  Pages.ActivePageIndex:= 0;
end;

procedure TfmProjProps.edDirsKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) then btnCan.Click;
end;

end.
