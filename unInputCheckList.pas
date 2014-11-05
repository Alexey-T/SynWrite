unit unInputCheckList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, 
  TntStdCtrls, TntComCtrls, TntForms;

type
  TfmInputCheckList = class(TTntForm)
    Panel1: TPanel;
    List: TTntListView;
    bOk: TTntButton;
    bCancel: TTntButton;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

end.
