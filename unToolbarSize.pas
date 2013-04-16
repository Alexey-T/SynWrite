unit unToolbarSize;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls, Spin;

type
  TfmToolbarSize = class(TTntForm)
    GroupBoxIco: TGroupBox;
    Label1: TTntLabel;
    btn16: TTntRadioButton;
    btn32: TTntRadioButton;
    btnSize: TTntRadioButton;
    edSizeX: TSpinEdit;
    edSizeY: TSpinEdit;
    bOk: TTntButton;
    bCan: TTntButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
