unit unInputEx;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ExtCtrls, TntForms;

type
  TfmInputEx = class(TTntForm)
    lab1: TTntLabel;
    ed1: TTntEdit;
    lab2: TTntLabel;
    ed2: TTntEdit;
    lab3: TTntLabel;
    ed3: TTntEdit;
    lab4: TTntLabel;
    ed4: TTntEdit;
    lab5: TTntLabel;
    ed5: TTntEdit;
    lab6: TTntLabel;
    ed6: TTntEdit;
    lab7: TTntLabel;
    ed7: TTntEdit;
    lab8: TTntLabel;
    ed8: TTntEdit;
    lab9: TTntLabel;
    ed9: TTntEdit;
    lab10: TTntLabel;
    ed10: TTntEdit;
    Panel1: TPanel;
    btnOK: TTntButton;
    btnCancel: TTntButton;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure SetSize(N: Integer);
  end;

implementation

{$R *.dfm}

{ TfmInputEx }

procedure TfmInputEx.SetSize(N: Integer);
begin
  if not ((N>=1) and (N<=10)) then
    N:= 1;

  ed2.Visible:= N>=2;
  ed3.Visible:= N>=3;
  ed4.Visible:= N>=4;
  ed5.Visible:= N>=5;
  ed6.Visible:= N>=6;
  ed7.Visible:= N>=7;
  ed8.Visible:= N>=8;
  ed9.Visible:= N>=9;
  ed10.Visible:= N>=10;

  lab2.Visible:= N>=2;
  lab3.Visible:= N>=3;
  lab4.Visible:= N>=4;
  lab5.Visible:= N>=5;
  lab6.Visible:= N>=6;
  lab7.Visible:= N>=7;
  lab8.Visible:= N>=8;
  lab9.Visible:= N>=9;
  lab10.Visible:= N>=10;

  ClientHeight:= (ed1.Top+ed1.Height) * N + Panel1.Height;
end;


end.
