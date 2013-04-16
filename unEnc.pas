unit unEnc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, DKLang;

type
  TfmEnc = class(TTntForm)
    Button1: TTntButton;
    Button2: TTntButton;
    StaticText1: TTntStaticText;
    DKLanguageController1: TDKLanguageController;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmEnc: TfmEnc;

implementation

{$R *.dfm}

end.
