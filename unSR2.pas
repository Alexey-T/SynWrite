unit unSR2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls,
  TntStdCtrls,
  TntClasses,
  TntDialogs,
  TntForms,
  DKLang;

type
   TTntCombobox = class(TntStdCtrls.TTntComboBox)
   public
     refSpec,
     refRE: TTntCheckbox;
   protected
     procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
       ComboProc: Pointer); override;
   end;
  
type
  TfmSRFiles = class(TTntForm)
    Label2: TTntLabel;
    ed1: TTntComboBox;
    Label4: TTntLabel;
    ed2: TTntComboBox;
    bHelp: TTntButton;
    bCan: TTntButton;
    gOp: TTntGroupBox;
    cbRE: TTntCheckBox;
    cbCase: TTntCheckBox;
    cbWords: TTntCheckBox;
    cbSpec: TTntCheckBox;
    TntLabel1: TTntLabel;
    edDir: TTntComboBox;
    bBrowseDir: TTntButton;
    bRAll: TTntButton;
    cbSubDir: TTntCheckBox;
    TntLabel2: TTntLabel;
    edFile: TTntComboBox;
    bFAll: TTntButton;
    bCurrDir: TTntButton;
    DKLanguageController1: TDKLanguageController;
    gFile: TTntGroupBox;
    cbNoBin: TTntCheckBox;
    cbNoRO: TTntCheckBox;
    cbNoHid: TTntCheckBox;
    cbNoHid2: TTntCheckBox;
    gRes: TTntGroupBox;
    cbFnOnly: TTntCheckBox;
    cbOutTab: TTntCheckBox;
    LabelErr: TTntLabel;
    Timer1: TTimer;
    bCurFile: TTntButton;
    cbInOEM: TTntCheckBox;
    Bevel1: TBevel;
    cbInUTF8: TTntCheckBox;
    cbInUTF16: TTntCheckBox;
    bBrowseFile: TTntButton;
    TntOpenDialog1: TTntOpenDialog;
    labFind: TTntLabel;
    labFindRep: TTntLabel;
    cbOutAppend: TTntCheckBox;
    TntLabel3: TTntLabel;
    edSort: TTntComboBox;
    procedure FormCreate(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edFileChange(Sender: TObject);
    procedure bCurrDirClick(Sender: TObject);
    procedure bBrowseDirClick(Sender: TObject);
    procedure edDirChange(Sender: TObject);
    procedure cbREClick(Sender: TObject);
    procedure cbSpecClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bCurFileClick(Sender: TObject);
    procedure bBrowseFileClick(Sender: TObject);
    procedure labFindClick(Sender: TObject);
    procedure labFindRepClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cbOutTabClick(Sender: TObject);
    procedure ed1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edFileKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    procedure DoCopyToEdit(ed: TTntCombobox;
      IsSpec, IsRegex: boolean; const Str: Widestring);
  public
    { Public declarations }
    SynDir,
    SRCurrentDir,
    SRCurrentFile: Widestring;
    SRCount: integer;
    SRIniS,
    SRIni: string;
    SRSel, //suggested selection text
    SRTextS, //suggested search text
    SRTextR: WideString; //sugg. replace text 
    ShFind, //shortcuts for Find/Replace dialogs
    ShReplace: TShortcut;
    procedure ShowErr(const s: Widestring);
  end;

var
  fmSRFiles: TfmSRFiles;

const
  resFindAll = 101;
  resReplaceAll = 102;
  resGotoFind = 103;
  resGotoRep = 104;

implementation

uses
  Menus,
  unSR, iniFiles, unProc,
  TntFileCtrl, TntSysUtils,
  ATxFProc,
  ATxSProc;

{$R *.dfm}

const cc = 50;//Max items in history

procedure TfmSRFiles.FormCreate(Sender: TObject);
begin
  bFAll.ModalResult:= resFindAll;
  bRAll.ModalResult:= resReplaceAll;

  //make ed1/ed2 Paste interceptable
  //(Paste for other comboboxes - is default)
  ed1.refSpec:= cbSpec;
  ed1.refRE:= cbRE;
  ed2.refSpec:= cbSpec;
  ed2.refRE:= cbRE;

  //init "Sort files" combo
  with edSort do
  begin
    Items.Clear;
    Items.Add(DKLangConstW('zzsort_0'));
    Items.Add(DKLangConstW('zzsort_date'));
    Items.Add(DKLangConstW('zzsort_date2'));
  end;
end;

procedure TfmSRFiles.bHelpClick(Sender: TObject);
begin
  //
end;

procedure TfmSRFiles.DoCopyToEdit(ed: TTntCombobox;
  IsSpec, IsRegex: boolean; const Str: Widestring);
begin
  if IsSpec then
    ed.Text:= SEscapeSpec(Str)
  else
  if IsRegex then
    ed.Text:= SEscapeRegex(Str)
  else
    ed.Text:= Str;
end;

procedure TfmSRFiles.FormShow(Sender: TObject);
begin
  labFind.Caption:= #$00BB + DKLangConstW('fn');
  labFindRep.Caption:= #$00BB + DKLangConstW('fnR');

  bCurrDir.Enabled:= SRCurrentDir <> '';
  bCurFile.Enabled:= bCurrDir.Enabled;

  with TIniFile.Create(SRIni) do
  try
    Left:= ReadInteger('Search', 'WLeftFiles', Self.Monitor.Left + (Self.Monitor.Width - Width) div 2);
    Top:= ReadInteger('Search', 'WTopFiles', Self.Monitor.Top + (Self.Monitor.Height - Height) div 2);

    edSort.ItemIndex:= ReadInteger('Search', 'Sort', 0);
    cbOutAppend.Checked:= ReadBool('Search', 'OutAdd', true);
    cbOutTab.Checked:= ReadBool('Search', 'OutTab', false);
    cbFnOnly.Checked:= ReadBool('Search', 'FnOnly', false);
    cbNoBin.Checked:= ReadBool('Search', 'NoBin', true);
    cbNoRO.Checked:= ReadBool('Search', 'NoRO', true);
    cbNoHid.Checked:= ReadBool('Search', 'NoHid', true);
    cbNoHid2.Checked:= ReadBool('Search', 'NoHid2', true);
    cbSubDir.Checked:= ReadBool('Search', 'SubDir', false);
    cbRE.Checked:= ReadBool('Search', 'RegExp', false);
    cbCase.Checked:= ReadBool('Search', 'Case', false);
    cbWords.Checked:= ReadBool('Search', 'Words', false);
    cbSpec.Checked:= ReadBool('Search', 'Spec', false);
    cbInOEM.Checked:= ReadBool('Search', 'InOEM', false);
    cbInUTF8.Checked:= ReadBool('Search', 'InUTF8', false);
    cbInUTF16.Checked:= ReadBool('Search', 'InUTF16', false);
  finally
    Free;
  end;

  SLoadCombo(ed1, SRIniS, 'SearchText');
  SLoadCombo(ed2, SRIni, 'RHist', False);
  SLoadCombo(edFile, SRIni, 'IncHist');
  SLoadCombo(edDir, SRIni, 'DirHist'{, False});

  if edFile.Text='' then
    edFile.Text:= '*.*';

  if SRTextS<>'' then
    ed1.Text:= SRTextS
  else
  if SRSel<>'' then
    DoCopyToEdit(ed1, cbSpec.Checked, cbRE.Checked, SRSel);

  if SRTextR<>'' then
    ed2.Text:= SRTextR;  

  ed1Change(Self);
  cbREClick(Self);
  cbOutTabClick(Self);
end;

procedure TfmSRFiles.ed1Change(Sender: TObject);
begin
  bFAll.Enabled:=
    (ed1.Text <> '') and
    (edFile.Text <> '') and
    (edDir.Text <> '') and
    IsDirExist(edDir.Text);
  bRAll.Enabled:= bFAll.Enabled;
end;

procedure TfmSRFiles.FormDestroy(Sender: TObject);
begin
  with TIniFile.Create(SRIni) do
  try
    WriteInteger('Search', 'WLeftFiles', Left);
    WriteInteger('Search', 'WTopFiles', Top);
  finally
    Free
  end;    

  if ModalResult = mrCancel then Exit;

  with TIniFile.Create(SRIni) do
  try
    WriteInteger('Search', 'Sort', edSort.ItemIndex);
    WriteBool('Search', 'OutAdd', cbOutAppend.Checked);
    WriteBool('Search', 'OutTab', cbOutTab.Checked);
    WriteBool('Search', 'FnOnly', cbFnOnly.Checked);
    WriteBool('Search', 'NoBin', cbNoBin.Checked);
    WriteBool('Search', 'NoRO', cbNoRO.Checked);
    WriteBool('Search', 'NoHid', cbNoHid.Checked);
    WriteBool('Search', 'NoHid2', cbNoHid2.Checked);
    WriteBool('Search', 'SubDir', cbSubDir.Checked);
    WriteBool('Search', 'RegExp', cbRE.Checked);
    WriteBool('Search', 'Case', cbCase.Checked);
    WriteBool('Search', 'Words', cbWords.Checked);
    WriteBool('Search', 'Spec', cbSpec.Checked);
    WriteBool('Search', 'InOEM', cbInOEM.Checked);
    WriteBool('Search', 'InUTF8', cbInUTF8.Checked);
    WriteBool('Search', 'InUTF16', cbInUTF16.Checked);
  finally
    Free;
  end;

  SSave(ed1, SRCount);
  SSave(ed2, SRCount);
  SSave(edFile, SRCount);
  SSave(edDir, SRCount);

  SSaveCombo(ed1, SRIniS, 'SearchText');
  SSaveCombo(ed2, SRIni, 'RHist');
  SSaveCombo(edFile, SRIni, 'IncHist');
  SSaveCombo(edDir, SRIni, 'DirHist');
end;

procedure TfmSRFiles.edFileChange(Sender: TObject);
begin
  ed1Change(Self);
end;

procedure TfmSRFiles.bCurrDirClick(Sender: TObject);
var s: Widestring;
begin
  s:= SRCurrentDir;
  if (S<>'') and (S[Length(s)]=':') then
    S:= S+'\';
  edDir.Text:= S;
  edDirChange(Self);
end;

procedure TfmSRFiles.bBrowseDirClick(Sender: TObject);
var
  S: Widestring;
begin
  S:= edDir.Text;
  if WideSelectDirectory('', '', S) then
  begin
    edDir.Text:= S;
    edDirChange(Self)
  end;
  SetFocus; //for TC
end;

procedure TfmSRFiles.edDirChange(Sender: TObject);
begin
  ed1Change(Self);
end;

procedure TfmSRFiles.cbREClick(Sender: TObject);
const C: array[boolean] of TColor = (clWindow, $B0FFFF);
var re: boolean;
begin
  re:= cbRe.Checked;
  if re then
    cbSpec.Checked:= false;
  ed1.Color:= C[re];
  ed2.Color:= C[re];  
end;

procedure TfmSRFiles.cbSpecClick(Sender: TObject);
begin
  if cbSpec.Checked then
    cbRe.Checked:= false;
end;

procedure TfmSRFiles.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:= false;
  LabelErr.Hide;
  LabelErr.Caption:= '--';
end;

procedure TfmSRFIles.ShowErr(const s: Widestring);
begin
  LabelErr.Caption:= s;
  LabelErr.Show;
  Timer1.Enabled:= true;
end;

procedure TfmSRFiles.bCurFileClick(Sender: TObject);
begin
  edDir.Text:= SRCurrentDir;
  edDirChange(Self);
  edFile.Text:= '"'+SRCurrentFile+'"';
  edFileChange(Self);
  cbSubDir.Checked:= false;
end;

procedure TfmSRFiles.bBrowseFileClick(Sender: TObject);
var
  CfmAppend: boolean;
begin
  with TntOpenDialog1 do
  begin
    InitialDir:= SRCurrentDir;
    if InitialDir='' then InitialDir:= 'C:\';
    FileName:= '';
    if not Execute then Exit;

    if edFile.Text<>'' then
      CfmAppend:= MessageBoxW(Self.Handle, PWChar(DKLangConstW('zMAddMask')), 'SynWrite',
        mb_iconquestion or mb_yesno) = id_yes
    else
      CfmAppend:= false;

    if CfmAppend then
    begin
      edFile.Text:= edFile.Text+ ' "'+WideExtractFileName(FileName)+'"';
    end
    else
    begin
      edDir.Text:= WideExtractFileDir(FileName);
      edDirChange(Self);
      edFile.Text:= '"'+WideExtractFileName(FileName)+'"';
    end;

    edFileChange(Self);
    cbSubDir.Checked:= false;
  end;
end;

procedure TfmSRFiles.labFindClick(Sender: TObject);
begin
  ModalResult:= resGotoFind;
end;

procedure TfmSRFiles.labFindRepClick(Sender: TObject);
begin
  ModalResult:= resGotoRep;
end;

procedure TfmSRFiles.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Ctrl+Down
  if (Key=vk_down) and (Shift=[ssCtrl]) then
  begin
    if ed1.Focused or ed2.Focused then
      ed2.Text:= ed1.Text;
    key:= 0;
    Exit;
  end;
  //F4
  if (key=vk_f4) and (Shift=[]) then
  begin
    cbRE.Checked:= not cbRE.Checked;
    key:= 0;
    Exit;
  end;
  //Ctrl+F
  if Shortcut(Key, Shift)=ShFind then
  begin
    labFindClick(Self);
    key:= 0;
    Exit;
  end;
  //Ctrl+H
  if Shortcut(Key, Shift)=ShReplace then
  begin
    labFindRepClick(Self);
    key:= 0;
    Exit;
  end;
end;

procedure TTntCombobox.ComboWndProc(var Message: TMessage;
  ComboWnd: HWnd; ComboProc: Pointer);
begin
  if (Message.Msg = WM_PASTE) and
    Assigned(refSpec) and Assigned(refRE) then
  begin
    DoPasteToEdit(Self, refSpec.Checked, refRE.Checked);
    Message.Result:= 1;
  end
  else
    inherited;
end;


procedure TfmSRFiles.cbOutTabClick(Sender: TObject);
begin
  cbFnOnly.Enabled:= cbOutTab.Checked;
  cbOutAppend.Enabled:= not cbOutTab.Checked;
end;

procedure TfmSRFiles.ed1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(ed1);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSRFiles.ed2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(ed2);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSRFiles.edFileKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(edFile);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSRFiles.edDirKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(edDir);
    Key:= 0;
    Exit
  end;
end;

end.
