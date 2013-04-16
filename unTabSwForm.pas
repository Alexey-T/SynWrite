unit unTabSwForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, TntStdCtrls,
  TntClasses;

type
  TfmTabSw = class(TForm)
    Panel1: TPanel;
    List: TTntListBox;
    Panel2: TPanel;
    Label1: TTntLabel;
    Label2: TTntLabel;
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    FY: Integer;
    procedure Upd;
  public
    { Public declarations }
    FListFN,
    FListLex: TTntStringList;
  end;

var
  fmTabSw: TfmTabSw;

implementation

uses unProc;

{$R *.dfm}

procedure TfmTabSw.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_CONTROL) then
  begin
    ModalResult:= mrOk;
    Key:= 0;
  end;
end;

procedure TfmTabSw.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_TAB) then
  begin
    if ssShift in Shift then
    begin
      with List do
        if ItemIndex=0 then
          ItemIndex:= Items.Count-1
        else
          ItemIndex:= ItemIndex-1;
    end
    else
    begin
      with List do
        if ItemIndex=Items.Count-1 then
          ItemIndex:= 0
        else
          ItemIndex:= ItemIndex+1;
    end;
    Upd;
    Key:= 0;
  end;
end;

procedure TfmTabSw.FormShow(Sender: TObject);
begin
  ClientHeight:= FY + List.ItemHeight*List.Items.Count;
  Upd;
end;

procedure TfmTabSw.ListClick(Sender: TObject);
begin
  ModalResult:= mrOk;
end;

procedure TfmTabSw.FormCreate(Sender: TObject);
begin
  FY:= ClientHeight-List.Height + 8;
  FListFN:= TTntStringList.Create;
  FListLex:= TTntStringList.Create;
end;

procedure TfmTabSw.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FListFN);
  FreeAndNil(FListLex);
end;

procedure TfmTabSw.Upd;
var
  N: Integer;
begin
  N:= List.ItemIndex;
  if (N<0) then
    raise Exception.Create('TabSwitcher: list index <0');
  if (N>=FListFN.Count) or
    (N>=FListLex.Count) then
    raise Exception.Create('TabSwitcher: list index bad');

  Label1.Caption:= WideMinimizeName(
    FListFN[N],
    Canvas,
    Panel2.ClientWidth - 4);
  Label2.Caption:= FListLex[N];
end;

end.
