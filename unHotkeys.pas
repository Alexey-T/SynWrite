unit unHotkeys;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs,
  TntControls, TntClasses, TntForms, StdCtrls, TntStdCtrls;

type
  TfmHotkeys = class(TTntForm)
    btnOk: TTntButton;
    btnCancel: TTntButton;
    labelInfo1: TTntLabel;
    btnClear1: TTntButton;
    btnAdd1: TTntButton;
    labelInfo2: TTntLabel;
    btnClear2: TTntButton;
    btnAdd2: TTntButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmHotkeys: TfmHotkeys;

implementation

{$R *.dfm}

end.
