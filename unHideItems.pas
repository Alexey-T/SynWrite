unit unHideItems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntForms, TntStdCtrls, CheckLst, TntCheckLst, DKLang;

type
  TfmHideItems = class(TTntForm)
    List: TTntCheckListBox;
    bOk: TTntButton;
    bCancel: TTntButton;
    TntLabel1: TTntLabel;
    DKLanguageController1: TDKLanguageController;
    bUncheck: TTntButton;
    procedure TntFormShow(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure bUncheckClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    FIniFN: string;
    function SId(N: Integer): Widestring;
  end;

implementation

uses ATxSProc;

{$R *.dfm}

procedure TfmHideItems.TntFormShow(Sender: TObject);
var
  L: TStringList;
  S: string;
  i, j: Integer;
begin
  if FIniFN='' then
    raise Exception.Create('SynHide.ini path not set');
  if not FileExists(FIniFN) then Exit;  

  L:= TStringList.Create;
  try
    L.LoadFromFile(FIniFN);
    for i:= 0 to L.Count-1 do
    begin
      S:= L[i];
      if (S='') or (S[1]=' ') then Continue;
      for j:= 0 to List.Items.Count-1 do
        if SId(j)=S then
        begin
          List.Checked[j]:= true;
          Break
        end;
    end;
  finally
    FreeAndNil(L);
  end;
end;


function TfmHideItems.SId(N: Integer): Widestring;
begin
  Result:= List.Items[N];
  if Result='' then Exit;
  SDeleteToW(Result, '[');
  SDeleteFromW(Result, ']');
end;

procedure TfmHideItems.bOkClick(Sender: TObject);
var
  L: TStringList;
  j: integer;
begin
  L:= TStringList.Create;
  try
    for j:= 0 to List.Items.Count-1 do
      if List.Checked[j] then
        L.Add(SId(j));
    L.SaveToFile(FIniFN);
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmHideItems.bUncheckClick(Sender: TObject);
var
  i: Integer;
begin
  for i:= 0 to List.Items.Count-1 do
    List.Checked[i]:= false;
end;

end.
