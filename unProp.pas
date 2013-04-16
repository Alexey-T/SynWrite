unit unProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, DKLang, ComCtrls, TntComCtrls;

type
  TfmProps = class(TForm)
    bOk: TTntButton;
    DKLanguageController1: TDKLanguageController;
    Pages: TTntPageControl;
    tabFile: TTntTabSheet;
    TntLabel1: TTntLabel;
    edPath: TTntEdit;
    TntLabel2: TTntLabel;
    edTime: TTntEdit;
    TntLabel3: TTntLabel;
    edSize: TTntEdit;
    tabDoc: TTntTabSheet;
    TntLabel4: TTntLabel;
    edChars: TTntEdit;
    TntLabel5: TTntLabel;
    edWords: TTntEdit;
    TntLabel6: TTntLabel;
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

uses IniFiles;

{$R *.dfm}

procedure TfmProps.FormShow(Sender: TObject);
begin
  with TIniFile.Create(FIniFN) do
  try
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
    WriteInteger('Win', 'PropW', Width);
    WriteInteger('Win', 'PropH', Height);
    WriteInteger('Win', 'PropTab', Pages.ActivePageIndex);
  finally
    Free
  end;
end;

end.

