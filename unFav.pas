unit unFav;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntForms, TntStdCtrls, TntClasses, DKLang;

type
  TfmFav = class(TTntForm)
    btnOk: TTntButton;
    btnCan: TTntButton;
    cbPaths: TTntCheckBox;
    List: TTntListBox;
    btnUp: TTntButton;
    btnDown: TTntButton;
    btnDel: TTntButton;
    DKLanguageController1: TDKLanguageController;
    procedure TntFormShow(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure cbPathsClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure ListDblClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure btnUpClick(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure btnDownClick(Sender: TObject);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    FFileNames: TTntStringList;
    procedure DoList;
    procedure DoLoad;
    procedure DoSave;
    function AKey(n: integer): char;
  public
    { Public declarations }
    FIniFN: string;
    FCurrentFileName: Widestring;
  end;

implementation

uses
  ATxSProc,
  TntSysUtils;

{$R *.dfm}

procedure TfmFav.DoList;
var
  i, N: Integer;
  s, SShort, SPrefix: Widestring;
  Idx: Integer;
begin
  Idx:= List.ItemIndex;
  List.Items.BeginUpdate;
  try
    List.Items.Clear;
    for i:= 0 to FFileNames.Count-1 do
    begin
      s:= FFileNames[i];

      N:= Pos('::', s);
      if N=0 then
        SPrefix:= ''
      else
      begin
        SPrefix:= '['+Copy(s, 1, N-1)+']';
        Delete(S, 1, N+1);
      end;

      SShort:= WideExtractFileName(s);
      if SShort='' then
        SShort:= s;

      if cbPaths.Checked then
        s:= SShort + '  (' + WideExtractFileDir(s) + ')'
      else
        s:= SShort;

      if IsFileProject(FFileNames[i]) then
        SPrefix:= DKLangConstW('zProj');

      if SPrefix<>'' then
        Insert(SPrefix+'  ', s, 1);

      List.Items.Add(AKey(i)+':  '+s);
    end;
    
    //restore Idx
    if (Idx>=0) and (Idx<=List.Items.Count-1) then
      List.ItemIndex:= Idx
    else
    if (Idx>=0) and (List.Items.Count>0) then
      List.ItemIndex:= List.Items.Count-1
    else
    if (List.Items.Count>0) then
      List.ItemIndex:= 0;
  finally
    List.Items.EndUpdate;
  end;

  ListClick(Self);
end;

procedure TfmFav.TntFormShow(Sender: TObject);
begin
  if FIniFN='' then
    raise Exception.Create('Ini nil');
  DoLoad;
  DoList;
end;

procedure TfmFav.TntFormCreate(Sender: TObject);
begin
  FFileNames:= TTntStringList.Create;
end;

procedure TfmFav.TntFormDestroy(Sender: TObject);
begin
  FreeAndNil(FFileNames);
end;

procedure TfmFav.DoLoad;
begin
  if FileExists(FIniFN) then
  begin
    FFileNames.LoadFromFile(FIniFN);
  end;
end;

procedure TfmFav.DoSave;
begin
  FFileNames.SaveToFile(FIniFN);
end;

procedure TfmFav.cbPathsClick(Sender: TObject);
begin
  DoList;
end;

procedure TfmFav.btnOkClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    FCurrentFileName:= FFileNames[List.ItemIndex];
end;

procedure TfmFav.ListDblClick(Sender: TObject);
begin
  btnOk.Click;
end;

procedure TfmFav.btnDelClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
  begin
    FFileNames.Delete(List.ItemIndex);
    DoSave;
    DoList;
  end;
end;

procedure TfmFav.btnUpClick(Sender: TObject);
var
  n:Integer;
begin
  n:= List.ItemIndex;
  if n>0 then
  begin
    FFileNames.Move(n, n-1);
    DoSave;
    DoList;
    List.ItemIndex:= n-1;
    ListClick(Self);
  end;
end;

procedure TfmFav.ListClick(Sender: TObject);
begin
  btnOk.Enabled:= List.ItemIndex>=0;
  btnDel.Enabled:= List.ItemIndex>=0;

  btnUp.Enabled:= (List.Items.Count>0) and (List.ItemIndex>0);
  btnDown.Enabled:= (List.Items.Count>0) and (List.ItemIndex<List.Items.Count-1);
end;

procedure TfmFav.btnDownClick(Sender: TObject);
var
  n:Integer;
begin
  n:= List.ItemIndex;
  if n<List.Items.Count-1 then
  begin
    FFileNames.Move(n, n+1);
    DoSave;
    DoList;
    List.ItemIndex:= n+1;
    ListClick(Self);
  end;
end;

function TfmFav.AKey(n: integer): char;
begin
  if n<0 then raise Exception.Create('N<0');
  if n<=8 then Result:= Chr(Ord('1')+n) else
   if n=9 then Result:= '0' else
    if n<=10+Ord('Z')-Ord('A') then Result:= Chr(Ord('A')+n-10) else
     Result:= '?';
end;

procedure TfmFav.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i: integer;
begin
  if ((Key>=Ord('0')) and (Key<=Ord('9'))) or
    ((Key>=Ord('A')) and (Key<=Ord('Z'))) then
  begin
    for i:= 0 to FFileNames.Count-1 do
      if Key=Ord(AKey(i)) then
      begin
        List.ItemIndex:= i;
        btnOk.Click;
        Break
      end;
    Key:= 0;
    Exit
  end;

  if (Key=VK_Delete) and (Shift=[]) then
  begin
    btnDel.Click;
    Key:= 0;
    Exit
  end;  
end;

end.
