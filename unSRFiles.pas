unit unSRFiles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DKLang, Menus,
  TntStdCtrls,
  TntClasses,
  TntDialogs,
  TntForms,
  TntClipbrd,
  TntMenus;

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
    labInDir: TTntLabel;
    edDir: TTntComboBox;
    bBrowseDir: TTntButton;
    bRAll: TTntButton;
    cbSubDir: TTntCheckBox;
    TntLabel2: TTntLabel;
    edFileInc: TTntComboBox;
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
    TimerErr: TTimer;
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
    cbCloseAfter: TTntCheckBox;
    labMaskExc: TTntLabel;
    edFileExc: TTntComboBox;
    labFav: TTntLabel;
    PopupFav: TTntPopupMenu;
    mnuFavSave: TTntMenuItem;
    N1: TTntMenuItem;
    SaveDialogFav: TTntSaveDialog;
    mnuFavFields: TTntMenuItem;
    mnuLoadTextS: TTntMenuItem;
    mnuLoadTextR: TTntMenuItem;
    mnuLoadMaskInc: TTntMenuItem;
    mnuLoadMaskExc: TTntMenuItem;
    mnuLoadFolder: TTntMenuItem;
    mnuLoadSubdirs: TTntMenuItem;
    mnuLoadCase: TTntMenuItem;
    mnuLoadWords: TTntMenuItem;
    mnuLoadRegex: TTntMenuItem;
    mnuLoadSpec: TTntMenuItem;
    mnuLoadInOEM: TTntMenuItem;
    mnuLoadInUTF8: TTntMenuItem;
    mnuLoadInUTF16: TTntMenuItem;
    mnuLoadSkipBinary: TTntMenuItem;
    mnuLoadSkipRO: TTntMenuItem;
    mnuLoadSkipHidden: TTntMenuItem;
    mnuLoadSkipHiddenDir: TTntMenuItem;
    N2: TTntMenuItem;
    N3: TTntMenuItem;
    N4: TTntMenuItem;
    labPreset: TTntLabel;
    TimerPreset: TTimer;
    mnuLoadSort: TTntMenuItem;
    labInProject: TTntLabel;
    procedure FormCreate(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ed1Change(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edFileIncChange(Sender: TObject);
    procedure bCurrDirClick(Sender: TObject);
    procedure bBrowseDirClick(Sender: TObject);
    procedure edDirChange(Sender: TObject);
    procedure cbREClick(Sender: TObject);
    procedure cbSpecClick(Sender: TObject);
    procedure TimerErrTimer(Sender: TObject);
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
    procedure edFileIncKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDirKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed1KeyPress(Sender: TObject; var Key: Char);
    procedure edFileExcKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure mnuFavSaveClick(Sender: TObject);
    procedure labFavClick(Sender: TObject);
    procedure PopupFavPopup(Sender: TObject);
    procedure TimerPresetTimer(Sender: TObject);
    procedure mnuLoadTextSClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoCopyToEdit(ed: TTntCombobox;
      IsSpec, IsRegex: boolean; const Str: Widestring);
    procedure FavClick(Sender: TObject);
    procedure DoLoadFav(const fn: string);
    procedure DoSaveFav(const fn: string);
    procedure DoLoadFavIndex(N: Integer);
    function FavDir: string;
    procedure FindFavs(L: TTntStringList);
  public
    { Public declarations }
    SR_IniDir,
    SR_CurrentDir,
    SR_CurrentFile: Widestring;
    SR_Count: integer;
    SR_Ini,
    SR_Ini_S: string;
    SR_InProject: boolean;

    SR_SuggestedSel, //suggested selection text
    SR_SuggestedFind, //suggested search text
    SR_SuggestedReplace: WideString; //sugg. replace text

    SR_LastFind,
    SR_LastReplace,
    SR_LastMaskInc,
    SR_LastMaskExc,
    SR_LastDir: Widestring;
    SR_LastLeft,
    SR_LastTop: Integer;

    FKeyGotoFind, //shortcuts for Find/Replace dialogs
    FKeyGotoReplace: TShortcut;
    
    procedure DoMessage(const S: Widestring);
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
  IniFiles,
  unSR, unProc,
  TntFileCtrl, TntSysUtils,
  ATxFProc,
  ATxSProc;

{$R *.dfm}

const
  cSecSR = 'Search'; //ini section
  cSecPre = 'preset'; //ini section
  cPresetExt = 'synw-findpreset'; //file ext

procedure TfmSRFiles.FormCreate(Sender: TObject);
begin
  SaveDialogFav.DefaultExt:= cPresetExt;
  SaveDialogFav.Filter:= Format('*.%s|*.%s|', [cPresetExt, cPresetExt]);

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
  {
  if IsSpec then
    ed.Text:= SEscapeSpec(Str)
  else
  if IsRegex then
    ed.Text:= SEscapeRegex(Str)
  else
  }
  if IsRegex or IsSpec then
    ed.Text:= SEscapeEols(Str)
  else
    ed.Text:= Str;
end;

procedure TfmSRFiles.FormShow(Sender: TObject);
var
  bExcludeEmpty: boolean;
begin
  labFind.Caption:= #$00BB + DKLangConstW('fn');
  labFindRep.Caption:= #$00BB + DKLangConstW('fnR');

  bCurrDir.Enabled:= SR_CurrentDir <> '';
  bCurFile.Enabled:= bCurrDir.Enabled;

  labInProject.Visible:= SR_InProject;
  if SR_InProject then
  begin
    bBrowseFile.Visible:= false;
    bBrowseDir.Visible:= false;
    bCurFile.Visible:= false;
    bCurrDir.Visible:= false;
    labMaskExc.Visible:= false;
    labInDir.Visible:= false;
    edFileExc.Visible:= false;
    edDir.Visible:= false;
    cbSubDir.Visible:= false;
    cbNoRO.Enabled:= false;
    cbNoHid.Enabled:= false;
    cbNoHid2.Enabled:= false;
  end;

  with TIniFile.Create(SR_Ini) do
  try
    Left:= ReadInteger(cSecSR, 'WLeftFiles', Self.Monitor.Left + (Self.Monitor.Width - Width) div 2);
    Top:= ReadInteger(cSecSR, 'WTopFiles', Self.Monitor.Top + (Self.Monitor.Height - Height) div 2);

    edSort.ItemIndex:= ReadInteger(cSecSR, 'Sort', 0);
    cbCloseAfter.Checked:= ReadBool(cSecSR, 'CloseAfter', true);
    cbOutAppend.Checked:= ReadBool(cSecSR, 'OutAdd', true);
    cbOutTab.Checked:= ReadBool(cSecSR, 'OutTab', false);
    cbFnOnly.Checked:= ReadBool(cSecSR, 'FnOnly', false);
    cbNoBin.Checked:= ReadBool(cSecSR, 'NoBin', true);
    cbNoRO.Checked:= ReadBool(cSecSR, 'NoRO', true);
    cbNoHid.Checked:= ReadBool(cSecSR, 'NoHid', true);
    cbNoHid2.Checked:= ReadBool(cSecSR, 'NoHid2', true);
    cbSubDir.Checked:= ReadBool(cSecSR, 'SubDir', false);
    cbRE.Checked:= ReadBool(cSecSR, 'RegExp', false);
    cbCase.Checked:= ReadBool(cSecSR, 'Case', false);
    cbWords.Checked:= ReadBool(cSecSR, 'Words', false);
    cbSpec.Checked:= ReadBool(cSecSR, 'Spec', false);
    cbInOEM.Checked:= ReadBool(cSecSR, 'InOEM', false);
    cbInUTF8.Checked:= ReadBool(cSecSR, 'InUTF8', false);
    cbInUTF16.Checked:= ReadBool(cSecSR, 'InUTF16', false);
    bExcludeEmpty:= ReadBool(cSecSR, 'Exc_em', true);

    mnuLoadTextS.Checked:= ReadBool(cSecSR, 'l_search', true);
    mnuLoadTextR.Checked:= ReadBool(cSecSR, 'l_replace', true);
    mnuLoadMaskInc.Checked:= ReadBool(cSecSR, 'l_maskInc', true);
    mnuLoadMaskExc.Checked:= ReadBool(cSecSR, 'l_maskExc', true);
    mnuLoadFolder.Checked:= ReadBool(cSecSR, 'l_folder', true);
    mnuLoadSubdirs.Checked:= ReadBool(cSecSR, 'l_subdirs', true);
    mnuLoadCase.Checked:= ReadBool(cSecSR, 'l_case', true);
    mnuLoadWords.Checked:= ReadBool(cSecSR, 'l_words', true);
    mnuLoadRegex.Checked:= ReadBool(cSecSR, 'l_regex', true);
    mnuLoadSpec.Checked:= ReadBool(cSecSR, 'l_spec', true);
    mnuLoadInOEM.Checked:= ReadBool(cSecSR, 'l_inOem', true);
    mnuLoadInUTF8.Checked:= ReadBool(cSecSR, 'l_inUtf8', true);
    mnuLoadInUTF16.Checked:= ReadBool(cSecSR, 'l_inUtf16', true);
    mnuLoadSkipBinary.Checked:= ReadBool(cSecSR, 'l_nobin', true);
    mnuLoadSkipRO.Checked:= ReadBool(cSecSR, 'l_noro', true);
    mnuLoadSkipHidden.Checked:= ReadBool(cSecSR, 'l_nohid', true);
    mnuLoadSkipHiddenDir.Checked:= ReadBool(cSecSR, 'l_nohiddir', true);
    mnuLoadSort.Checked:= ReadBool(cSecSR, 'l_sort', true);
  finally
    Free;
  end;

  ComboLoadFromFile(ed1, SR_Ini_S, 'SearchText');
  ComboLoadFromFile(ed2, SR_Ini, 'ReplaceHist', False);
  ComboLoadFromFile(edFileInc, SR_Ini, 'FilesIncHist');
  ComboLoadFromFile(edFileExc, SR_Ini, 'FilesExcHist');
  ComboLoadFromFile(edDir, SR_Ini, 'FilesDirHist'{, False});

  if edFileInc.Text='' then
    edFileInc.Text:= '*.*';

  if bExcludeEmpty then
    edFileExc.Text:= '';

  //use last values of fields (if not empty passed from main form)
  if SR_LastFind<>'' then
  begin
    ed1.Text:= SR_LastFind;
    ed2.Text:= SR_LastReplace;
    edFileInc.Text:= SR_LastMaskInc;
    edFileExc.Text:= SR_LastMaskExc;
    edDir.Text:= SR_LastDir;
    Left:= SR_LastLeft;
    Top:= SR_LastTop;
  end;

  //use suggested text (current selection or curr word)
  if SR_SuggestedFind<>'' then
    ed1.Text:= SR_SuggestedFind
  else
  if SR_SuggestedSel<>'' then
    DoCopyToEdit(ed1, cbSpec.Checked, cbRE.Checked, SR_SuggestedSel);

  if SR_SuggestedReplace<>'' then
    ed2.Text:= SR_SuggestedReplace;


  ed1Change(Self);
  cbREClick(Self);
  cbOutTabClick(Self);
end;

procedure TfmSRFiles.ed1Change(Sender: TObject);
var
  en: boolean;
begin
  en:=
    (ed1.Text<>'') and
    (edFileInc.Text<>'') and
    (SR_InProject or ((edDir.Text<>'') and IsDirExist(edDir.Text)));
  bFAll.Enabled:= en;
  bRAll.Enabled:= en;
end;

procedure TfmSRFiles.FormDestroy(Sender: TObject);
begin
  if SR_Ini<>'' then
  with TIniFile.Create(SR_Ini) do
  try
    WriteInteger(cSecSR, 'WLeftFiles', Left);
    WriteInteger(cSecSR, 'WTopFiles', Top);
    WriteInteger(cSecSR, 'Sort', edSort.ItemIndex);
    WriteBool(cSecSR, 'CloseAfter', cbCloseAfter.Checked);
    WriteBool(cSecSR, 'OutAdd', cbOutAppend.Checked);
    WriteBool(cSecSR, 'OutTab', cbOutTab.Checked);
    WriteBool(cSecSR, 'FnOnly', cbFnOnly.Checked);
    WriteBool(cSecSR, 'NoBin', cbNoBin.Checked);
    WriteBool(cSecSR, 'NoRO', cbNoRO.Checked);
    WriteBool(cSecSR, 'NoHid', cbNoHid.Checked);
    WriteBool(cSecSR, 'NoHid2', cbNoHid2.Checked);
    WriteBool(cSecSR, 'SubDir', cbSubDir.Checked);
    WriteBool(cSecSR, 'RegExp', cbRE.Checked);
    WriteBool(cSecSR, 'Case', cbCase.Checked);
    WriteBool(cSecSR, 'Words', cbWords.Checked);
    WriteBool(cSecSR, 'Spec', cbSpec.Checked);
    WriteBool(cSecSR, 'InOEM', cbInOEM.Checked);
    WriteBool(cSecSR, 'InUTF8', cbInUTF8.Checked);
    WriteBool(cSecSR, 'InUTF16', cbInUTF16.Checked);
    WriteBool(cSecSR, 'Exc_em', edFileExc.Text='');

    WriteBool(cSecSR, 'l_search', mnuLoadTextS.Checked);
    WriteBool(cSecSR, 'l_replace', mnuLoadTextR.Checked);
    WriteBool(cSecSR, 'l_maskInc', mnuLoadMaskInc.Checked);
    WriteBool(cSecSR, 'l_maskExc', mnuLoadMaskExc.Checked);
    WriteBool(cSecSR, 'l_folder', mnuLoadFolder.Checked);
    WriteBool(cSecSR, 'l_subdirs', mnuLoadSubdirs.Checked);
    WriteBool(cSecSR, 'l_case', mnuLoadCase.Checked);
    WriteBool(cSecSR, 'l_words', mnuLoadWords.Checked);
    WriteBool(cSecSR, 'l_regex', mnuLoadRegex.Checked);
    WriteBool(cSecSR, 'l_spec', mnuLoadSpec.Checked);
    WriteBool(cSecSR, 'l_inOem', mnuLoadInOEM.Checked);
    WriteBool(cSecSR, 'l_inUtf8', mnuLoadInUTF8.Checked);
    WriteBool(cSecSR, 'l_inUtf16', mnuLoadInUTF16.Checked);
    WriteBool(cSecSR, 'l_nobin', mnuLoadSkipBinary.Checked);
    WriteBool(cSecSR, 'l_noro', mnuLoadSkipRO.Checked);
    WriteBool(cSecSR, 'l_nohid', mnuLoadSkipHidden.Checked);
    WriteBool(cSecSR, 'l_nohiddir', mnuLoadSkipHiddenDir.Checked);
    WriteBool(cSecSR, 'l_sort', mnuLoadSort.Checked);
  finally
    Free;
  end;

  ComboUpdate(ed1, SR_Count);
  ComboUpdate(ed2, SR_Count);
  ComboUpdate(edFileInc, SR_Count);
  ComboUpdate(edFileExc, SR_Count);
  ComboUpdate(edDir, SR_Count);

  ComboSaveToFile(ed1, SR_Ini_S, 'SearchText');
  ComboSaveToFile(ed2, SR_Ini, 'ReplaceHist');
  ComboSaveToFile(edFileInc, SR_Ini, 'FilesIncHist');
  ComboSaveToFile(edFileExc, SR_Ini, 'FilesExcHist');
  ComboSaveToFile(edDir, SR_Ini, 'FilesDirHist');
end;

procedure TfmSRFiles.edFileIncChange(Sender: TObject);
begin
  ed1Change(Self);
end;

procedure TfmSRFiles.bCurrDirClick(Sender: TObject);
var s: Widestring;
begin
  s:= SR_CurrentDir;
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
  begin
    cbSpec.Checked:= false;
    cbWords.Checked:= false;
  end;
  cbWords.Enabled:= not re;

  ed1.Color:= C[re];
  ed2.Color:= C[re];
end;

procedure TfmSRFiles.cbSpecClick(Sender: TObject);
begin
  if cbSpec.Checked then
    cbRe.Checked:= false;
end;

procedure TfmSRFiles.TimerErrTimer(Sender: TObject);
begin
  TimerErr.Enabled:= false;
  LabelErr.Hide;
  LabelErr.Caption:= '--';
end;

procedure TfmSRFiles.DoMessage(const S: Widestring);
begin
  LabelErr.Caption:= S;
  LabelErr.Show;
  TimerErr.Enabled:= true;
end;

procedure TfmSRFiles.bCurFileClick(Sender: TObject);
begin
  edDir.Text:= SR_CurrentDir;
  edDirChange(Self);
  edFileInc.Text:= '"'+SR_CurrentFile+'"';
  edFileIncChange(Self);
  cbSubDir.Checked:= false;
end;

procedure TfmSRFiles.bBrowseFileClick(Sender: TObject);
var
  CfmAppend: boolean;
begin
  with TntOpenDialog1 do
  begin
    InitialDir:= SR_CurrentDir;
    if InitialDir='' then InitialDir:= 'C:\';
    FileName:= '';
    if not Execute then Exit;

    if edFileInc.Text<>'' then
      CfmAppend:= MsgConfirm(DKLangConstW('zMAddMask'), Handle)
    else
      CfmAppend:= false;

    if CfmAppend then
    begin
      edFileInc.Text:= edFileInc.Text+ ' "'+WideExtractFileName(FileName)+'"';
    end
    else
    begin
      edDir.Text:= WideExtractFileDir(FileName);
      edDirChange(Self);
      edFileInc.Text:= '"'+WideExtractFileName(FileName)+'"';
    end;

    edFileIncChange(Self);
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
var
  Str: Widestring;
begin
  //Alt+1..Alt+9
  if ((Key>=Ord('1')) and (Key<=Ord('9'))) and (Shift=[ssAlt]) then
  begin
    DoLoadFavIndex(Key-Ord('1'));
    Key:= 0;
    Exit
  end;

  //Ctrl+Down
  if (Key=vk_down) and (Shift=[ssCtrl]) then
  begin
    if ed1.Focused or ed2.Focused then
      ed2.Text:= ed1.Text;
    key:= 0;
    Exit;
  end;
  //F3
  if (key=vk_f3) and (Shift=[]) then
  begin
    labFavClick(Self);
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
  if Shortcut(Key, Shift)=FKeyGotoFind then
  begin
    labFindClick(Self);
    key:= 0;
    Exit;
  end;
  //Ctrl+H
  if Shortcut(Key, Shift)=FKeyGotoReplace then
  begin
    labFindRepClick(Self);
    key:= 0;
    Exit;
  end;
  //Ctrl+E - paste escaped string
  if (Key=Ord('E')) and (Shift=[ssCtrl]) then
  begin
    Str:= SEscapeRegex(TntClipboard.AsWideText);
    if ed1.Focused then ed1.SelText:= Str else
     if ed2.Focused then ed2.SelText:= Str;
    Key:= 0;
    Exit
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

procedure TfmSRFiles.edFileIncKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(edFileInc);
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

procedure TfmSRFiles.ed1KeyPress(Sender: TObject; var Key: Char);
begin
  DoHandleCtrlBkSp(Sender as TTntCombobox, Key);
end;

procedure TfmSRFiles.edFileExcKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(edFileExc);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSRFiles.mnuFavSaveClick(Sender: TObject);
begin
  CreateDir(FavDir);
  with SaveDialogFav do
  begin
    InitialDir:= FavDir;
    FileName:= '';
    if Execute then
      DoSaveFav(FileName);
  end;
end;

procedure TfmSRFiles.labFavClick(Sender: TObject);
var
  P: TPoint;
begin
  P:= labFav.ClientToScreen(Point(0, labFav.Height));
  PopupFav.Popup(P.X, P.Y);
end;

procedure TfmSRFiles.FindFavs(L: TTntStringList);
begin
  FFindToList(L, FavDir, '*.'+cPresetExt, '',
    false{SubDir}, false, false, false);
end;

procedure TfmSRFiles.PopupFavPopup(Sender: TObject);
var
  L: TTntStringList;
  i: Integer;
  MI: TTntMenuItem;
begin
  with PopupFav do
    while Items.Count>3 do
      Items.Delete(Items.Count-1);

  L:= TTntStringList.Create;
  try
    FindFavs(L);
    for i:= 0 to L.Count-1 do
    begin
      MI:= TTntMenuItem.Create(Self);
      MI.Caption:= ChangeFileExt(ExtractFileName(L[i]), '');
      MI.OnClick:= FavClick;
      PopupFav.Items.Add(MI);
    end;
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmSRFiles.FavClick(Sender: TObject);
var
  fn: string;
begin
  fn:= (Sender as TTntMenuItem).Caption;
  fn:= FavDir + '\' + fn + '.' + cPresetExt;
  DoLoadFav(fn);
end;


procedure TfmSRFiles.DoSaveFav(const fn: string);
begin
  with TIniFile.Create(fn) do
  try
    WriteString(cSecPre, 'search',  '"'+UTF8Encode(ed1.Text)+'"');
    WriteString(cSecPre, 'replace', '"'+UTF8Encode(ed2.Text)+'"');
    WriteString(cSecPre, 'maskInc', '"'+UTF8Encode(edFileInc.Text)+'"');
    WriteString(cSecPre, 'maskExc', '"'+UTF8Encode(edFileExc.Text)+'"');
    WriteString(cSecPre, 'dir',     '"'+UTF8Encode(edDir.Text)+'"');
    WriteBool(cSecPre, 'subdir', cbSubDir.Checked);
    WriteBool(cSecPre, 'case', cbCase.Checked);
    WriteBool(cSecPre, 'words', cbWords.Checked);
    WriteBool(cSecPre, 're', cbRE.Checked);
    WriteBool(cSecPre, 'spec', cbSpec.Checked);
    WriteBool(cSecPre, 'inOem', cbInOEM.Checked);
    WriteBool(cSecPre, 'inUTF8', cbInUTF8.Checked);
    WriteBool(cSecPre, 'inUTF16', cbInUTF16.Checked);
    WriteBool(cSecPre, 'noBin', cbNoBin.Checked);
    WriteBool(cSecPre, 'noRO', cbNoRO.Checked);
    WriteBool(cSecPre, 'noHid', cbNoHid.Checked);
    WriteBool(cSecPre, 'noHid2', cbNoHid2.Checked);
    {
    WriteBool(cSecPre, 'outTab', cbOutTab.Checked);
    WriteBool(cSecPre, 'fnOnly', cbFnOnly.Checked);
    WriteBool(cSecPre, 'outAppend', cbOutAppend.Checked);
    WriteBool(cSecPre, 'close', cbCloseAfter.Checked);
    }
    WriteInteger(cSecPre, 'sort', edSort.ItemIndex);
  finally
    Free
  end;
end;

procedure TfmSRFiles.DoLoadFav(const fn: string);
begin
  TimerPreset.Enabled:= false;
  TimerPreset.Enabled:= true;
  labPreset.Caption:= ChangeFileExt(ExtractFileName(fn), '');

  with TIniFile.Create(fn) do
  try
    if mnuLoadTextS.Checked then
      ed1.Text:=       UTF8Decode(ReadString(cSecPre, 'search', ''));
    if mnuLoadTextR.Checked then
      ed2.Text:=       UTF8Decode(ReadString(cSecPre, 'replace', ''));
    if mnuLoadMaskInc.Checked then
      edFileInc.Text:= UTF8Decode(ReadString(cSecPre, 'maskInc', ''));
    if mnuLoadMaskExc.Checked then
      edFileExc.Text:= UTF8Decode(ReadString(cSecPre, 'maskExc', ''));
    if mnuLoadFolder.Checked then
      edDir.Text:=     UTF8Decode(ReadString(cSecPre, 'dir', ''));
    if mnuLoadSubdirs.Checked then
      with cbSubDir do     Checked:= ReadBool(cSecPre, 'subdir', Checked);
    if mnuLoadCase.Checked then
      with cbCase do       Checked:= ReadBool(cSecPre, 'case', Checked);
    if mnuLoadWords.Checked then
      with cbWords do      Checked:= ReadBool(cSecPre, 'words', Checked);
    if mnuLoadRegex.Checked then
      with cbRE do         Checked:= ReadBool(cSecPre, 're', Checked);
    if mnuLoadSpec.Checked then
      with cbSpec do       Checked:= ReadBool(cSecPre, 'spec', Checked);
    if mnuLoadInOEM.Checked then
      with cbInOEM do      Checked:= ReadBool(cSecPre, 'inOem', Checked);
    if mnuLoadInUTF8.Checked then
      with cbInUTF8 do     Checked:= ReadBool(cSecPre, 'inUTF8', Checked);
    if mnuLoadInUTF16.Checked then
      with cbInUTF16 do    Checked:= ReadBool(cSecPre, 'inUTF16', Checked);
    if mnuLoadSkipBinary.Checked then
      with cbNoBin do      Checked:= ReadBool(cSecPre, 'noBin', Checked);
    if mnuLoadSkipRO.Checked then
      with cbNoRO do       Checked:= ReadBool(cSecPre, 'noRO', Checked);
    if mnuLoadSkipHidden.Checked then
      with cbNoHid do      Checked:= ReadBool(cSecPre, 'noHid', Checked);
    if mnuLoadSkipHiddenDir.Checked then
      with cbNoHid2 do     Checked:= ReadBool(cSecPre, 'noHid2', Checked);
    {
    with cbOutTab do     Checked:= ReadBool(cSecPre, 'outTab', Checked);
    with cbFnOnly do     Checked:= ReadBool(cSecPre, 'fnOnly', Checked);
    with cbOutAppend do  Checked:= ReadBool(cSecPre, 'outAppend', Checked);
    with cbCloseAfter do Checked:= ReadBool(cSecPre, 'close', Checked);
    }
    if mnuLoadSort.Checked then
      with edSort do ItemIndex:= ReadInteger(cSecPre, 'sort', ItemIndex);
  finally
    Free
  end;
  edDirChange(Self);
end;

function TfmSRFiles.FavDir: string;
begin
  Result:= SR_IniDir + 'IniPresets';
end;

procedure TfmSRFIles.DoLoadFavIndex(N: Integer);
var
  L: TTntStringList;
begin
  L:= TTntStringList.Create;
  try
    FindFavs(L);
    if (N>=0) and (N<L.Count) then
      DoLoadFav(L[N])
    else
      MessageBeep(mb_iconwarning);
  finally
    FreeAndNil(L);
  end;
end;


procedure TfmSRFiles.TimerPresetTimer(Sender: TObject);
begin
  TimerPreset.Enabled:= false;
  labPreset.Caption:= '';
end;

procedure TfmSRFiles.mnuLoadTextSClick(Sender: TObject);
begin
  with (Sender as TTntMenuItem) do
    Checked:= not Checked;
end;

end.
