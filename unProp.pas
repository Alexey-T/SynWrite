unit unProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, DKLang, ComCtrls,
  TntForms, TntComCtrls;

type
  TfmProps = class(TTntForm)
    bOk: TTntButton;
    DKLanguageController1: TDKLanguageController;
    Pages: TTntPageControl;
    tabFile: TTntTabSheet;
    labPath: TTntLabel;
    edPath: TTntEdit;
    labTime: TTntLabel;
    edTime: TTntEdit;
    labSize: TTntLabel;
    edSize: TTntEdit;
    tabDoc: TTntTabSheet;
    labChars: TTntLabel;
    edChars: TTntEdit;
    labWords: TTntLabel;
    edWords: TTntEdit;
    labLines: TTntLabel;
    edLines: TTntEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    FIniFN: string;
  end;

//var
//  fmProps: TfmProps;

implementation

uses
  IniFiles,
  unProc;

{$R *.dfm}

procedure TfmProps.FormShow(Sender: TObject);
begin
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'PropX', Left);
    Top:= ReadInteger('Win', 'PropY', Top);
    Width:= ReadInteger('Win', 'PropW', Width);
    Height:= ReadInteger('Win', 'PropH', Height);
    Pages.ActivePageIndex:= ReadInteger('Win', 'PropTab', 0);
  finally
    Free
  end;
end;

procedure TfmProps.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'PropX', Left);
    WriteInteger('Win', 'PropY', Top);
    WriteInteger('Win', 'PropW', Width);
    WriteInteger('Win', 'PropH', Height);
    WriteInteger('Win', 'PropTab', Pages.ActivePageIndex);
  finally
    Free
  end;
end;

end.

