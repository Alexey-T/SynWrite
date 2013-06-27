unit unShell;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  DKLang, CheckLst;

type
  TfmShell = class(TTntForm)
    GroupBoxEx: TTntGroupBox;
    cbShell: TTntCheckBox;
    bOk: TTntButton;
    DKLanguageController1: TDKLanguageController;
    cbTxt: TTntCheckBox;
    cbIni: TTntCheckBox;
    ed: TTntComboBox;
    List: TCheckListBox;
    TntLabel1: TTntLabel;
    bUn: TTntButton;
    cbProj: TTntCheckBox;
    cbSession: TTntCheckBox;
    procedure FormShow(Sender: TObject);
    procedure cbShellClick(Sender: TObject);
    procedure cbTxtClick(Sender: TObject);
    procedure cbIniClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edChange(Sender: TObject);
    procedure ListClickCheck(Sender: TObject);
    procedure bUnClick(Sender: TObject);
    procedure cbProjClick(Sender: TObject);
    procedure cbSessionClick(Sender: TObject);
  private
    { Private declarations }
    FLock: boolean;
    procedure DoAssoc(const ext: string; en: boolean);
  public
    { Public declarations }
    FLex: TStringList;
  end;

var
  fmShell: TfmShell;

implementation

uses
  ATxShell, ATxSProc, ATxRegistry,
  unProc;

{$R *.dfm}

procedure TfmShell.FormShow(Sender: TObject);
var i:Integer;
begin
  FLock:= true;
  cbShell.Checked:= IsShellExtensionEnabled;
  cbTxt.Checked:= IsFileAssocEnabled('txt');
  cbIni.Checked:= IsFileAssocEnabled('ini');
  cbProj.Checked:= IsFileAssocEnabled('synwproj') or IsFileAssocEnabled('synw-proj');
  cbSession.Checked:= IsFileAssocEnabled('syn');

  for i:= 0 to FLex.Count-1 do
    ed.Items.Add(Copy(FLex[i], 1, Pos('=', FLex[i])-1));
  ed.ItemIndex:= 0;
  edChange(Self);
  FLock:= false;
end;

procedure TfmShell.cbShellClick(Sender: TObject);
begin
  if FLock then Exit;
  if not ApplyShellExtension(cbShell.Checked) then
    MsgError(DKLangConstW('shNN'));
end;

procedure TfmShell.DoAssoc(const ext: string; en: boolean);
begin
  if FLock then Exit;
  if not ApplyFileAssoc(ext, en) then
    MessageBoxW(Handle,
      PWChar(DKLangConstW('shNN')),
      PWChar(WideString(Caption)),
      mb_ok or mb_iconerror);
end;

procedure TfmShell.cbTxtClick(Sender: TObject);
begin
  DoAssoc('txt', cbTxt.Checked);
end;

procedure TfmShell.cbIniClick(Sender: TObject);
begin
  DoAssoc('ini', cbIni.Checked);
end;

procedure TfmShell.cbProjClick(Sender: TObject);
begin
  DoAssoc('synwproj', cbProj.Checked);
  DoAssoc('synw-proj', cbProj.Checked);
end;

procedure TfmShell.FormCreate(Sender: TObject);
begin
  FLex:= TStringList.Create;
  FLex.Sorted:= true;
  FLex.Duplicates:= dupIgnore;

  cbTxt.Caption:= WideFormat(DKLangConstW('ZMAssoc'), ['TXT']);
  cbIni.Caption:= WideFormat(DKLangConstW('ZMAssoc'), ['INI']);
  cbProj.Caption:= WideFormat(DKLangConstW('ZMAssoc'), ['Synw-proj']);
  cbSession.Caption:= WideFormat(DKLangConstW('ZMAssoc'), ['Syn']);
end;

procedure TfmShell.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FLex);
end;

procedure TfmShell.edChange(Sender: TObject);
var
  s, ss: Widestring;
begin
  List.Items.Clear;
  s:= FLex[ed.ItemIndex];
  SDeleteToW(s, '=');
  repeat
    ss:= SGetItem(s, ' ');
    if ss='' then Break;
    if ss[1]='/' then Continue; //see Makefile lexer
    if (ss='txt') or (ss='ini') then Continue;
    List.Items.Add(ss);
    FLock:= true;
    List.Checked[List.Count-1]:= IsFileAssocEnabled(ss);
    FLock:= false;
  until False;
end;

procedure TfmShell.ListClickCheck(Sender: TObject);
begin
  if FLock then Exit;
  with List do
    DoAssoc(Items[ItemIndex], Checked[ItemIndex]);
end;

procedure TfmShell.bUnClick(Sender: TObject);
var
  i:Integer;
  s, ss: Widestring;
begin
  for i:= 0 to FLex.Count-1 do
  begin
    s:= FLex[i];
    SDeleteToW(s, '=');
    repeat
      ss:= SGetItem(s, ' ');
      if ss='' then Break;
      if IsFileAssocEnabled(ss) then
        ApplyFileAssoc(ss, false);
    until False;
  end;

  FLock:= true;
  cbTxt.Checked:= IsFileAssocEnabled('txt');
  cbIni.Checked:= IsFileAssocEnabled('ini');
  cbProj.Checked:= IsFileAssocEnabled('synwproj') or IsFileAssocEnabled('synw-proj');
  cbSession.Checked:= IsFileAssocEnabled('syn');
  edChange(Self);
  FLock:= false;
end;


procedure TfmShell.cbSessionClick(Sender: TObject);
begin
  DoAssoc('syn', cbSession.Checked);
end;

end.
