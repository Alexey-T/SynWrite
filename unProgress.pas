unit unProgress;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  DKLang, Gauges, ExtCtrls;

type
  TProgressType = (
    proFindText,
    proFindFiles,
    proExclBinary,
    proBookmarks,
    proAddFolders,
    proSortFolders
    );

type
  TfmProgress = class(TTntForm)
    laFile: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    bCan: TTntButton;
    laBin: TTntLabel;
    Pro: TGauge;
    LaBk: TTntLabel;
    laText: TTntLabel;
    labCount: TTntLabel;
    laSort: TTntLabel;
    labFilename: TTntLabel;
    procedure bCanClick(Sender: TObject);
    procedure TntFormPaint(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetMode(M: TProgressType);
    procedure SetStatusMode(V: boolean);
  end;

implementation

uses
  ATxFProc;

{$R *.dfm}

procedure TfmProgress.SetStatusMode(V: boolean);
begin
  if V then
  begin
    labCount.Top:= 2;
    Pro.Top:= 1;
    bCan.Top:= 0;
  end;
end;

procedure TfmProgress.SetMode(m: TProgressType);
 //Align center
 procedure A(L: TTntLabel);
 begin
   L.Top:= labCount.Top;
   L.Left:= (Pro.Left - L.Width) div 2;
 end;
begin
  Pro.Progress:= 0; //reset bar on mode change
  Pro.Visible:= (m<>proFindFiles);

  labFilename.Visible:= m=proFindText;
  laText.Visible:= m=proFindText;
  laFile.Visible:= m in [proFindFiles, proAddFolders];
  laBin.Visible:= m=proExclBinary;
  laBk.Visible:= m=proBookmarks;
  labCount.Visible:= m=proAddFolders;
  laSort.Visible:= m=proSortFolders;
  Pro.Visible:= not labCount.Visible;

  A(laFile);
  A(laText);
  A(laBin);
  A(laBk);
  A(laSort);
  labFilename.Top:= labCount.Top;
end;

procedure TfmProgress.bCanClick(Sender: TObject);
begin
  StopFind:= true;
end;

procedure TfmProgress.TntFormPaint(Sender: TObject);
begin
  if BorderStyle=bsNone then
  begin
    Canvas.Brush.Color:= $A0FFFF; //light yellow
    Canvas.FillRect(ClientRect);
  end;  
end;

end.
