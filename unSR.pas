{$define PS} //escape regex chars on pasting into edit field
unit unSR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DKLang, ComCtrls, Menus, Buttons,
  TntStdCtrls, TntClasses, TntForms, 
  TntMenus, TntComCtrls, TntExtCtrls, TntClipbrd,
  unSearch;

type
  TTrackBar = class(ComCtrls.TTrackBar)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  end;

type
  TFindShowStatusEvent = procedure(const Msg: Widestring) of object;

{$ifdef PS}
type
   TTntCombobox = class(TntStdCtrls.TTntComboBox)
   public
     refSpec,
     refRE: TTntCheckbox;
   protected
     procedure ComboWndProc(var Message: TMessage; ComboWnd: HWnd;
       ComboProc: Pointer); override;
   end;
{$endif}

type
  TSynSearchAction = (
    arFindNext,
    arFindAll,
    arFindInTabs,
    arCount,
    arSkip,
    arReplaceNext,
    arReplaceAll,
    arReplaceAllInAll
    );

const
  cSearchIngoreFromCaret: set of TSynSearchAction =
    [arFindAll, arFindInTabs, arCount, arReplaceAll, arReplaceAllInAll];


type
  TSRProc = procedure(act: TSynSearchAction) of object;

function WriteFindOptions(
  Act: TSynSearchAction;
  const TextOpt, Text1, Text2: Widestring): Widestring;

procedure ReadFindOptions(
  const Str: Widestring;
  var Act: TSynSearchAction;
  var SText1, SText2: Widestring;
  var Opt: TSearchOptions;
  var Tok: TSearchTokens;
  var OptBkmk, OptExtSel: boolean);

type
  TfmSR = class(TTntForm)
    bFindNext: TTntButton;
    bFindAll: TTntButton;
    bRepNext: TTntButton;
    bRepAll: TTntButton;
    bCancel: TTntButton;
    ed1: TTntComboBox;
    labEd1: TTntLabel;
    ed2: TTntComboBox;
    labEd2: TTntLabel;
    gOp: TTntGroupBox;
    cbRe: TTntCheckBox;
    cbCase: TTntCheckBox;
    cbWords: TTntCheckBox;
    gScop: TTntGroupBox;
    bHelp: TTntButton;
    cbSpec: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    cbCfm: TTntCheckBox;
    bCount: TTntButton;
    bRepInTabs: TTntButton;
    bSkip: TTntButton;
    PanelTr: TTntPanel;
    TrackBar1: TTrackBar;
    cbLoose: TTntCheckBox;
    labStyle: TTntLabel;
    mnuRe: TTntPopupMenu;
    labRe: TTntLabel;
    cbBkmkAll: TTntCheckBox;
    cbSel: TTntCheckBox;
    cbFromCur: TTntCheckBox;
    cbWrap: TTntCheckBox;
    cbExtSel: TTntCheckBox;
    bFindInTabs: TTntButton;
    cbSkipCol: TTntCheckBox;
    cbTokens: TTntComboBox;
    labMultiline: TTntLabel;
    ed1Memo: TTntMemo;
    ed2Memo: TTntMemo;
    bCombo1: TSpeedButton;
    bCombo2: TSpeedButton;
    mnuCombo: TTntPopupMenu;
    StatusFind: TTntStatusBar;
    PanelBusy: TTntPanel;
    cbReDot: TTntCheckBox;
    labTransp: TTntLabel;
    cbSelectAll: TTntCheckBox;
    cbBack: TTntCheckBox;
    labDocked: TTntLabel;
    procedure FormShow(Sender: TObject);
    procedure ed1Change(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure cbReClick(Sender: TObject);
    procedure cbSpecClick(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
    procedure bCancelClick(Sender: TObject);
    procedure bFindNextClick(Sender: TObject);
    procedure bFindAllClick(Sender: TObject);
    procedure bSkipClick(Sender: TObject);
    procedure bRepNextClick(Sender: TObject);
    procedure bRepAllClick(Sender: TObject);
    procedure bRepInTabsClick(Sender: TObject);
    procedure bCountClick(Sender: TObject);
    procedure TntFormActivate(Sender: TObject);
    procedure TntFormDeactivate(Sender: TObject);
    procedure cbLooseClick(Sender: TObject);
    procedure labStyleClick(Sender: TObject);
    procedure bGlobClick(Sender: TObject);
    procedure TntFormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure mnuRePopup(Sender: TObject);
    procedure labReClick(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure cbSelClick(Sender: TObject);
    procedure cbFromCurClick(Sender: TObject);
    procedure bFindInTabsClick(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
    procedure labMultilineClick(Sender: TObject);
    procedure ed1MemoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bCombo1Click(Sender: TObject);
    procedure bCombo2Click(Sender: TObject);
    procedure ed1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ed1KeyPress(Sender: TObject; var Key: Char);
    procedure ed2KeyPress(Sender: TObject; var Key: Char);
    procedure TntFormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure labTranspClick(Sender: TObject);
    procedure cbBkmkAllClick(Sender: TObject);
    procedure cbSelectAllClick(Sender: TObject);
    procedure labDockedClick(Sender: TObject);
  private
    { Private declarations }
    CurChecked: boolean;
    FIsReplace: boolean;
    FIsMultiline: boolean;
    FIsDocked: boolean;
    FOnFocusEditor: TNotifyEvent;
    FOnDockedChanged: TNotifyEvent;
    FOnShowStatus: TFindShowStatusEvent;
    FTopEd2,
    FTopLab2,
    FTopGOpt,
    FTopGScope,
    FLeft0,
    FTop0,
    FWidth0,
    FHeight0,
    FMemoDy: Integer;
    procedure mnuComboClick(Sender: TObject);
    procedure DoInsertCharCode;
    procedure DoCombo(ed: TTntCombobox; edMemo: TTntMemo; edNum: integer);
    procedure ReClick(Sender: TObject);
    procedure DoAction(act: TSynSearchAction);
    procedure SetIsReplace(Value: boolean);
    procedure SetIsMultiline(Value: boolean);
    procedure SetIsDocked(Value: boolean);
    procedure UpdOrigSize;
    procedure UpdTransp;
    procedure UpdScope;
    procedure UpdMemoHeight;
    function GetText1: Widestring;
    function GetText2: Widestring;
    procedure SetText1(const Value: Widestring);
    procedure SetText2(const Value: Widestring);
  public
    { Public declarations }
    SRProc: TSRProc;
    SRHistTC: boolean;
    SRCount: integer;
    SRIniS,
    SRIni: string;
    SR_SuggestedSel: WideString;
    SR_SuggestedSelEn,
    SR_SuggestedSelScope: boolean;
    Sh_FindNext,
    Sh_FindMode,
    Sh_ReplaceMode: TShortcut;
    property OnFocusEditor: TNotifyEvent read FOnFocusEditor write FOnFocusEditor;
    property OnDockedChanged: TNotifyEvent read FOnDockedChanged write FOnDockedChanged;
    property OnShowStatus: TFindShowStatusEvent read FOnShowStatus write FOnShowStatus;
    function TextOptions: Widestring;
    property Text1: Widestring read GetText1 write SetText1;
    property Text2: Widestring read GetText2 write SetText2;
    procedure LoadIni;
    procedure SaveIni;
    property IsReplace: boolean read FIsReplace write SetIsReplace;
    property IsMultiline: boolean read FIsMultiline write SetIsMultiline;
    property IsDocked: boolean read FIsDocked write SetIsDocked;
    procedure ShowError(b: boolean);
    procedure ShowStatus(const S: Widestring);
    procedure SetFromCaret;
  end;

  const
    cUtfSign: AnsiString = #$EF#$BB#$BF;

implementation

uses
  IniFiles, ShellApi,
  Math, StrUtils,
  ATxFProc,
  ATxSProc,
  cUtils,
  unProc,
  unProcHelp;

{$R *.dfm}

const
  cc = 50; //Max items in history

procedure TfmSR.FormShow(Sender: TObject);
begin
  cbFromCur.Checked:= CurChecked;
  cbREClick(Self);
  cbSelClick(Self);
  cbFromCurClick(Self);
  ShowStatus('');
end;

procedure TfmSR.SetIsReplace(Value: boolean);
begin
  FIsReplace:= Value;
  bFindNext.Visible:= not Value;
  bFindAll.Visible:= not Value;
  bSkip.Visible:= Value;
  bRepNext.Visible:= Value;
  bRepAll.Visible:= bRepNext.Visible;
  bSkip.Left:= bFindNext.Left;
  bRepNext.Left:= bFindNext.Left;
  bRepAll.Left:= bFindNext.Left;
  bRepInTabs.Left:= bFindNext.Left;

  if Value then
    Caption:= DKLangConstW('fnR')
  else
    Caption:= DKLangConstW('fn');

  if not Value then
    labStyle.Caption:= #$00BB + DKLangConstW('fnR')
  else
    labStyle.Caption:= #$00BB + DKLangConstW('fn');

  ed2.Visible:= Value and not IsMultiline;
  ed2Memo.Visible:= Value and IsMultiline;
  bCombo1.Visible:= ed1Memo.Visible;
  bCombo2.Visible:= ed2Memo.Visible;
  labEd2.Visible:= Value;
  //cbCfm.Enabled:= Value;
  cbCfm.Visible:= Value;
  //cbBk.Enabled:= not Value;
  cbBkmkAll.Visible:= not Value;
  cbSelectAll.Visible:= not Value;
  //cbExtSel.Enabled:= not Value;
  cbExtSel.Visible:= not Value;
  bCount.Visible:= not Value;
  bFindInTabs.Visible:= not Value;
  bRepInTabs.Visible:= Value;

  UpdOrigSize;
  UpdMemoHeight;
end;

procedure TfmSR.LoadIni;
var
  s: WideString;
  SA: Ansistring;
  fnTC: string;
  i:Integer;
begin
  with TIniFile.Create(SRIni) do
  try
    Left:= ReadInteger('Search', 'WLeft', Self.Monitor.Left + (Self.Monitor.Width - Width) div 2);
    Top:= ReadInteger('Search', 'WTop', Self.Monitor.Top + (Self.Monitor.Height - Height) div 2);

    Trackbar1.Position:= ReadInteger('Search', 'Tr', 0);
    cbLoose.Checked:= ReadBool('Search', 'TrLoose', false);
    cbFromCur.Checked:= ReadBool('Search', 'Cur', false);
    CurChecked:= cbFromCur.Checked;
    cbSkipCol.Checked:= ReadBool('Search', 'SkipCol', false);
    cbWrap.Checked:= ReadBool('Search', 'Wrap', false);
    cbBack.Checked:= not ReadBool('Search', 'Forw', true);
    cbRe.Checked:= ReadBool('Search', 'RegExp', false);
    cbReDot.Checked:= ReadBool('Search', 'RegExpS', false);
    cbCase.Checked:= ReadBool('Search', 'Case', false);
    cbWords.Checked:= ReadBool('Search', 'Words', false);
    cbSpec.Checked:= ReadBool('Search', 'Spec', false);
    cbCfm.Checked:= ReadBool('Search', 'Cfm', false);
    cbBkmkAll.Checked:= ReadBool('Search', 'Bk', false);
    cbSelectAll.Checked:= ReadBool('Search', 'SelAll', false);
    cbExtSel.Checked:= ReadBool('Search', 'ExtSel', false);
    cbTokens.ItemIndex:= 0;
    IsMultiline:= ReadBool('Search', 'Multiline', false);
    IsDocked:= ReadBool('Search', 'Docked', false);
  finally
    Free;
  end;

  fnTC:= SExpandVars('%Commander_ini%');
  if SRHistTC and SExpanded(fnTC) then
  begin
    //Use RedirectSection
    FixTcIni(fnTC, 'SearchText');

    //Read from TC ini
    with TIniFile.Create(fnTC) do
    try
      with ed1 do
      begin
        for i:= 0 to cc-1 do
        begin
          SA:= ReadString('SearchText', IntToStr(i), '');
          if Pos(cUtfSign, SA)=1 then
          begin
            Delete(SA, 1, Length(cUtfSign));
            S:= UTF8Decode(SA);
          end
          else
            S:= Widestring(SA);
          if S <> '' then
            Items.Add(S);
        end;
        if Items.Count > 0 then
          Text:= Items[0];
      end;
    finally
      Free;
    end;
  end
  else
    //Read from Syn ini
    ComboLoadFromFile(ed1, SRIniS, 'SearchText');

  ComboLoadFromFile(ed2, SRIni, 'ReplaceHist', false);
  ed1Change(Self);
end;

procedure TfmSR.SaveIni;
var
  i: integer;
  fnTC: string;
  S: Widestring;
  SA: Ansistring;
begin
  with TIniFile.Create(SRIni) do
  try
    if not IsDocked then
    begin
      WriteInteger('Search', 'WLeft', Left);
      WriteInteger('Search', 'WTop', Top);
    end;  

    WriteBool('Search', 'Cur', CurChecked);
    WriteBool('Search', 'SkipCol', cbSkipCol.Checked);
    WriteBool('Search', 'Wrap', cbWrap.Checked);
    //WriteBool('Search', 'SelOnly', bSel.Checked); //no need
    WriteBool('Search', 'Forw', not cbBack.Checked);
    WriteBool('Search', 'RegExp', cbRe.Checked);
    WriteBool('Search', 'RegExpS', cbReDot.Checked);
    WriteBool('Search', 'Case', cbCase.Checked);
    WriteBool('Search', 'Words', cbWords.Checked);
    WriteBool('Search', 'Spec', cbSpec.Checked);
    WriteBool('Search', 'Cfm', cbCfm.Checked);
    WriteBool('Search', 'Bk', cbBkmkAll.Checked);
    WriteBool('Search', 'SelAll', cbSelectAll.Checked);
    WriteBool('Search', 'ExtSel', cbExtSel.Checked);
    WriteInteger('Search', 'Tr', Trackbar1.Position);
    WriteBool('Search', 'TrLoose', cbLoose.Checked);
    WriteBool('Search', 'Multiline', IsMultiline);
    WriteBool('Search', 'Docked', IsDocked);
  finally
    Free;
  end;

  fnTC:= SExpandVars('%Commander_ini%');
  if SRHistTC and SExpanded(fnTC) then
  begin
    //Use RedirectSection
    FixTcIni(fnTC, 'SearchText');
    
    //Write TC ini
    with TIniFile.Create(fnTC) do
    try
      with ed1 do
      begin
        for i:= 0 to Items.Count-1 do
        begin
          S:= Items[i];
          if S = Widestring(Ansistring(S)) then
            SA:= Ansistring(S)
          else
            SA:= cUtfSign + UTF8Encode(S);
          WriteString('SearchText', IntToStr(i), '"' + SA + '"');
        end;
        for i:= Items.Count to cc-1 do
          DeleteKey('SearchText', IntToStr(i));
      end;
    finally
      Free;
    end;
  end
  else
    //Write Syn ini
    ComboSaveToFile(ed1, SRIniS, 'SearchText');

  ComboSaveToFile(ed2, SRIni, 'ReplaceHist');
end;

procedure TfmSR.ed1Change(Sender: TObject);
var
  en: boolean;
begin
  en:= Text1<>'';
  bFindNext.Enabled:= en;
  bFindAll.Enabled:= en;
  bCount.Enabled:= en;
  bSkip.Enabled:= en;
  bRepNext.Enabled:= en and not cbSel.Checked;
  bRepAll.Enabled:= en;
  bRepInTabs.Enabled:= en;
  bFindInTabs.Enabled:= en;
end;

procedure TfmSR.bHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpFindDlg, Handle);
end;

procedure TfmSR.cbReClick(Sender: TObject);
const
  cColorHiliteBG = $B0FFFF; //pale yellow
var
  re: boolean;
  C: TColor;
begin
  re:= cbRe.Checked;
  if re then
  begin
    cbSpec.Checked:= false;
    cbWords.Checked:= false;
  end;
  cbWords.Enabled:= not re;
  cbReDot.Enabled:= re;

  C:= IfThen(re, cColorHiliteBG, clWindow);
  ed1.Color:= C;
  ed2.Color:= C;
  ed1Memo.Color:= C;
  ed2Memo.Color:= C;
end;

procedure TfmSR.cbSpecClick(Sender: TObject);
begin
  if cbSpec.Checked then
    cbRe.Checked:= false;
end;

procedure TfmSR.ShowError(b: boolean);
begin
  if b then
    ShowStatus(WideFormat(DKLangConstW('MNFound2'), [Text1]))
  else
    ShowStatus('');
end;

procedure TfmSR.ShowStatus(const S: Widestring);
begin
  if not IsDocked then
    StatusFind.SimpleText:= S
  else
    if Assigned(FOnShowStatus) then
      FOnShowStatus(S);
end;

procedure TfmSR.TrackBar1Change(Sender: TObject);
begin
  UpdTransp;
end;

procedure TfmSR.UpdTransp;
begin
  if (TrackBar1.Position=0)
    or (cbLoose.Checked and Active)
  then
    AlphaBlend:= false
  else
  begin
    AlphaBlend:= true;
    case TrackBar1.Position of
      1: AlphaBlendValue:= 210;
      2: AlphaBlendValue:= 170;
      3: AlphaBlendValue:= 130;
      4: AlphaBlendValue:= 90;
      5: AlphaBlendValue:= 50;
    end;
  end;
end;

procedure TfmSR.TntFormDestroy(Sender: TObject);
begin
  SaveIni;
end;

procedure TfmSR.bCancelClick(Sender: TObject);
begin
  Close;
end;

procedure TfmSR.DoAction(act: TSynSearchAction);
begin
  if IsMultiline then
  begin
    ed1.Text:= ed1Memo.Text;
    ed2.Text:= ed2Memo.Text;
  end;

  ComboUpdate(ed1, SRCount);
  ComboUpdate(ed2, SRCount);

  if Assigned(SRProc) then
    SRProc(act);
end;

procedure TfmSR.bFindNextClick(Sender: TObject);
begin
  DoAction(arFindNext);
end;

procedure TfmSR.SetFromCaret;
var
  b: boolean;
begin
  b:= CurChecked;
  cbSel.Checked:= false;
  cbFromCur.Checked:= true;
  CurChecked:= b;
end;

procedure TfmSR.bFindAllClick(Sender: TObject);
begin
  DoAction(arFindAll);
end;

procedure TfmSR.bSkipClick(Sender: TObject);
begin
  DoAction(arSkip);
end;

procedure TfmSR.bRepNextClick(Sender: TObject);
begin
  DoAction(arReplaceNext);
end;

procedure TfmSR.bRepAllClick(Sender: TObject);
begin
  DoAction(arReplaceAll);
end;

procedure TfmSR.bRepInTabsClick(Sender: TObject);
begin
  //confirm mass replace
  if not MsgConfirm(DKLangConstW('MCfmTb'), Handle) then Exit;

  //uncheck "Search from caret" for mass replace
  cbFromCur.Checked:= false;

  DoAction(arReplaceAllInAll);
  SetFocus;
end;

procedure TfmSR.bCountClick(Sender: TObject);
begin
  DoAction(arCount);
end;

procedure TfmSR.TntFormActivate(Sender: TObject);
begin
  UpdTransp;
end;

procedure TfmSR.TntFormDeactivate(Sender: TObject);
begin
  UpdTransp;
end;

procedure TfmSR.cbLooseClick(Sender: TObject);
begin
  UpdTransp;
end;

procedure TfmSR.labStyleClick(Sender: TObject);
begin
  IsReplace:= not IsReplace;
end;

procedure TfmSR.bGlobClick(Sender: TObject);
begin
  ed1Change(Self);
  UpdScope;
end;

procedure TfmSR.UpdScope;
var en:boolean;
begin
  en:= not cbSel.Checked;
  cbFromCur.Enabled:= en;
  cbFromCurClick(Self);
end;

function Sh_of(const s: string): char;
var
  i: Integer;
begin
  i:= Pos('&', s);
  if (i>0) and (i<Length(s)) then
    Result:= s[i+1]
  else
    Result:= #0;
end;

function IsShortcutOk(C: TControl; ch1, ch2: char): boolean;
var
  S: string;
  ch: char;
begin
  if C is TTntCheckbox then S:= (C as TTntCheckbox).Caption else
   if C is TTntRadioButton then S:= (C as TTntRadioButton).Caption else
    if C is TTntLabel then S:= (C as TTntLabel).Caption else
     if C is TTntButton then S:= (C as TTntButton).Caption else
      Exception.Create('Unknown control type: '+C.Name);

  ch:= #0;    
  S:= AnsiUpperCase(Sh_of(S));
  if S<>'' then
    ch:= S[1];

  if ch=#0 then
    Result:= false
  else
    Result:= (ch=ch1) or (ch=ch2);
end;

  function H(C: TTntCheckbox; ch1, ch2: char): boolean; overload;
  begin
    Result:= IsShortcutOk(C, ch1, ch2);
    if Result then
      if C.CanFocus then
      begin
        C.SetFocus;
        C.Checked:= not C.Checked;
      end;
  end;

  function H(C: TTntRadioButton; ch1, ch2: char): boolean; overload;
  begin
    Result:= IsShortcutOk(C, ch1, ch2);
    if Result then
    begin
      if C.CanFocus then
      begin
        C.SetFocus;
        C.Checked:= true;
      end;
    end;
  end;

  function H(C: TTntLabel; ch1, ch2: char): boolean; overload;
  begin
    Result:= IsShortcutOk(C, ch1, ch2);
    if Result then
    begin
      if (C.FocusControl<>nil) and (C.FocusControl.CanFocus) then
      begin
        C.FocusControl.SetFocus;
      end;
    end;
  end;

  function H(C: TTntButton; ch1, ch2: char): boolean; overload;
  begin
    Result:= IsShortcutOk(C, ch1, ch2);
    if Result then
    begin
      if (C.CanFocus) then
      begin
        //don't set focus
        C.Click;
      end;
    end;
  end;

procedure DoUndo(ed: TTntCombobox);
begin
  SendMessage(GetEditHandle(ed), wm_undo, 0, 0);
end;

procedure DoCopy(ed: TTntCombobox);
begin
  SendMessage(GetEditHandle(ed), wm_copy, 0, 0);
end;

//OnShortcut needed, because:
//When Find/Replace form opened in exe, Alt+char shortcuts overridden by
//main form's shortcuts. Also Shift+Tab doesnt work.
procedure TfmSR.TntFormShortCut(var Msg: TWMKey; var Handled: Boolean);
const
  _en: string = 'QWERTYUIOPASDFGHJKLZXCVBNM';
  _ru: string = 'ÉÖÓÊÅÍÃØÙÇÔÛÂÀÏÐÎËÄß×ÑÌÈÒÜ';
var
  Shift: TShiftState;
  key: integer;
  ch1, ch2: Char;
begin
  Handled:= false;
  key:= Msg.CharCode;
  Shift:= KeyDataToShiftState(Msg.KeyData);

  //ch1/ch2 are EN/RU characters for given character
  ch1:= UpCase(Char(key));
  if Pos(ch1, _en)>0 then ch2:= _ru[Pos(ch1, _en)] else
   if Pos(ch1, _ru)>0 then ch2:= _en[Pos(ch1, _ru)] else
    ch2:= #0;
  ch2:= UpCase(ch2);

  //Ctrl+Z
  if (key=Ord('Z')) and (Shift=[ssCtrl]) then
  begin
    if ed1.Focused or ed2.Focused then
      DoUndo(ActiveControl as TTntCombobox)
    else
    if ed1Memo.Focused or ed2Memo.Focused then
      (ActiveControl as TTntMemo).Undo;
    Handled:= true;
    Exit;
  end;

  //Esc
  if (Key=vk_escape) and (Shift=[]) then
  begin
    bCancel.Click;
    Handled:= true;
    Exit
  end;

  //F1
  if (Key=vk_f1) and (Shift=[]) then
  begin
    bHelp.Click;
    Handled:= true;
    Exit
  end;

  //Ctrl+F1
  if (Key=vk_f1) and (Shift=[ssCtrl]) then
  begin
    labREClick(Self);
    Handled:= true;
    Exit
  end;

  //F2: switch multiline
  if (Key=vk_f2) and (Shift=[]) then
  begin
    labMultilineClick(Self);
    Handled:= true;
    Exit
  end;

  //F4: switch regex
  if (Key=vk_f4) and (Shift=[]) then
  begin
    cbRE.Checked:= not cbRE.Checked;
    Handled:= true;
    Exit
  end;

  //F5: insert char by code
  if (Key=vk_f5) and (Shift=[]) then
  begin
    DoInsertCharCode;
    Handled:= true;
    Exit
  end;

  //Ctrl+V / Shift+Ins: intercept Paste for Memos
  if ( ((Key=Ord('V')) and (Shift=[ssCtrl])) or
       ((Key=vk_insert) and (Shift=[ssShift])) ) and
     (ed1Memo.Focused or ed2Memo.Focused) then
  begin
    (ActiveControl as TTntMemo).PasteFromClipboard;
    Handled:= true;
    Exit
  end;

  //Ctrl+C
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
    if ed1Memo.Focused or ed2Memo.Focused then
  begin
    (ActiveControl as TTntMemo).CopyToClipboard;
    Handled:= true;
    Exit
  end;

  //Ctrl+X
  if (Key=Ord('X')) and (Shift=[ssCtrl]) then
    if ed1Memo.Focused or ed2Memo.Focused then
  begin
    (ActiveControl as TTntMemo).CutToClipboard;
    Handled:= true;
    Exit
  end;

  //Ctrl+A
  if (Key=Ord('A')) and (Shift=[ssCtrl]) then
    if ed1Memo.Focused or ed2Memo.Focused then
  begin
    (ActiveControl as TTntMemo).SelectAll;
    Handled:= true;
    Exit
  end;

  //Ctrl+Enter - press default btn
  if (Key=vk_return) and (Shift=[ssCtrl]) and (ed1Memo.Focused or ed2Memo.Focused) then
  begin
    if IsReplace then
      bSkip.Click
    else
      bFindNext.Click;
    Handled:= true;
    Exit
  end;

  //Ctrl+Down: copy "Search for" -> "Replace with"
  if (key=vk_down) and (Shift=[ssCtrl]) then
  begin
    if IsMultiline then
    begin
      if ed1Memo.Focused or ed2Memo.Focused then
        ed2Memo.Text:= ed1Memo.Text;
    end
    else
    begin
      if ed1.Focused or ed2.Focused then
        ed2.Text:= ed1.Text;
    end;
    Handled:= true;
    Exit
  end;

  //Alt+Down: drop down combo
  if ((key = vk_down) or (key = vk_up)) and (Shift=[ssAlt]) then
  begin
    if ed1.Focused then
      ed1.DroppedDown:= not ed1.DroppedDown
    else
    if ed2.Focused then
      ed2.DroppedDown:= not ed2.DroppedDown
    else
    if ed1Memo.Focused then
      bCombo1.Click
    else
    if ed2Memo.Focused then
      bCombo2.Click;
    Handled:= true;
    Exit
  end;

  //Tab, Shift+Tab
  if (key = vk_tab) then
  begin
    if Shift=[ssShift] then
      SelectNext(ActiveControl, false, true);
    if Shift=[] then
      SelectNext(ActiveControl, true, true);
    Handled:= true;
    Exit;
  end;

  //Alt pressed for following shortcuts
  if not (Shift=[ssAlt]) then Exit;
  //Alt+F4
  if (key = vk_F4) then
  begin
    Close;
    Handled:= true;
    Exit
  end;

  //handle accelerators for all controls
  if H(cbCase, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbWords, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbRE, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbSpec, ch1, ch2) then begin Handled:= true; Exit end;
  if FIsReplace then
    if H(cbCfm, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbBkmkAll, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbSelectAll, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbExtSel, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbLoose, ch1, ch2) then begin Handled:= true; Exit end;

  if H(cbSel, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbBack, ch1, ch2) then begin Handled:= true; Exit end;
  if H(cbFromCur, ch1, ch2) then begin Handled:= true; Exit end;

  if H(labEd1, ch1, ch2) then begin Handled:= true; Exit end;
  if H(labEd2, ch1, ch2) then begin Handled:= true; Exit end;
  //if H(labTr, ch1, ch2) then begin Handled:= true; Exit end;

  if not FIsReplace then
  begin
    if H(bFindNext, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bFindAll, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bFindInTabs, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bCount, ch1, ch2) then begin Handled:= true; Exit end;
  end
  else
  begin
    if H(bSkip, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bRepNext, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bRepAll, ch1, ch2) then begin Handled:= true; Exit end;
    if H(bRepInTabs, ch1, ch2) then begin Handled:= true; Exit end;
  end;
end;

const
  cRe: array[0..34] of record
    id, s, re: string;
  end = (
   (id: 're_dot'; s: '.'; re: '.'),
   (id: 're_st'; s: '^'; re: '^'),
   (id: 're_end'; s: '$'; re: '$'),
   (id: 're_Diap'; s: '[ab0-9]'; re: '[]'),
   (id: 're_NDiap'; s: '[^ab0-9]'; re: '[^]'),
   (id: ''; s: ''; re: ''),
   (id: 're_0or'; s: '*'; re: '*'),
   (id: 're_1or'; s: '+'; re: '+'),
   (id: 're_0or1'; s: '?'; re: '?'),
   (id: 're_ntim'; s: '{n}'; re: '(){}'),
   (id: 're_ntim2'; s: '{n,m}'; re: '(){,}'),
   (id: 're_sub'; s: '(...)'; re: '()'),
   (id: 're_group'; s: '\number'; re: '\N'),
   (id: ''; s: ''; re: ''),
   (id: 're_text_a'; s: '\A'; re: '\A'),
   (id: 're_text_z'; s: '\Z'; re: '\Z'),
   (id: 're_W'; s: '\w'; re: '\w'),
   (id: 're_NW'; s: '\W'; re: '\W'),
   (id: 're_D'; s: '\d'; re: '\d'),
   (id: 're_ND'; s: '\D'; re: '\D'),
   (id: 're_S'; s: '\s'; re: '\s'),
   (id: 're_NS'; s: '\S'; re: '\S'),
   (id: 're_b'; s: '\b'; re: '\b'),
   (id: 're_nb'; s: '\B'; re: '\B'),
   (id: ''; s: ''; re: ''),
   (id: 're_slash'; s: '\\'; re: '\\'),
   (id: 're_hex'; s: '\xC0'; re: '\x'),
   (id: 're_t'; s: '\t'; re: '\t'),
   (id: 're_r'; s: '\r'; re: '\r'),
   (id: 're_n'; s: '\n'; re: '\n'),
   //(id: 're_z'; s: '\z'; re: '\z'),
   (id: ''; s: ''; re: ''),
   (id: 're_as_pos_a'; s: '(?=...)'; re: '(?=...)'),
   (id: 're_as_neg_a'; s: '(?!...)'; re: '(?!...)'),
   (id: 're_as_pos_b'; s: '(?<=...)'; re: '(?<=...)'),
   (id: 're_as_neg_b'; s: '(?<!...)'; re: '(?<!...)')
   );

procedure TfmSR.mnuRePopup(Sender: TObject);
var
  i: Integer;
  m: TTntMenuitem;
begin
  with mnuRe do
  begin
    Items.Clear;
    for i:= 0 to High(cRe) do
    begin
      m:= TTntMenuItem.Create(Self);
      if cRe[i].id = '' then
        m.Caption:= '-'
      else
        m.Caption:= cRe[i].s + '  -  ' + DKLangConstW(cRe[i].id);
      m.Tag:= i;
      m.OnClick:= ReClick;
      Items.Add(m);
    end;
  end;
end;

procedure TfmSR.ReClick(Sender: TObject);
var
  ed: TTntCombobox;
  edMemo: TTntMemo;
  S: Widestring;
  N: Integer;
begin
  cbRe.Checked:= true;
  S:= cRe[(Sender as TComponent).Tag].re;

  {
  if S=SMod then
  begin
    SModClick(SMod);
    Exit
  end;
  }

  if not IsMultiline then
  begin
    if ed2.Focused then
      ed:= ed2
    else
      ed:= ed1;
    with ed do
    begin
      N:= SelStart;
      SelText:= S;
      SelStart:= N;
      SelLength:= Length(S);
    end;
  end
  else
  begin
    if ed2Memo.Focused then
      edMemo:= ed2Memo
    else
      edMemo:= ed1Memo;
    with edMemo do
    begin
      N:= SelStart;
      SelText:= S;
      SelStart:= N;
      SelLength:= Length(S);
    end;
  end;

  ed1Change(Self);
end;

procedure TfmSR.labReClick(Sender: TObject);
var p: TPoint;
begin
  p:= labRe.ClientToScreen(Point(0, labRe.Height));
  mnuRe.Popup(p.X, p.Y);
end;

procedure TfmSR.TntFormCreate(Sender: TObject);
begin
  {$ifdef PS}
  //make ed1/ed2 Paste interceptable
  ed1.refSpec:= cbSpec;
  ed1.refRE:= cbRE;
  ed2.refSpec:= cbSpec;
  ed2.refRE:= cbRE;
  {$endif}

  //other
  FIsReplace:= false;
  FIsMultiline:= false;
  
  FTopEd2:= ed2.Top;
  FTopLab2:= labEd2.Top;
  FTopGOpt:= gOp.Top;
  FTopGScope:= gScop.Top;
  FWidth0:= ClientWidth;
  FHeight0:= ClientHeight;
  FMemoDy:= ed2Memo.Height - ed2.Height;
end;

procedure TfmSR.cbSelClick(Sender: TObject);
begin
  ed1Change(Self);
  UpdScope;
end;

procedure TfmSR.cbFromCurClick(Sender: TObject);
begin
  CurChecked:= cbFromCur.Checked;
  cbWrap.Enabled:= cbFromCur.Enabled and cbFromCur.Checked;
end;

{$ifdef PS}
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
{$endif}

procedure TfmSR.bFindInTabsClick(Sender: TObject);
begin
  //uncheck "Search from caret" for mass search
  cbFromCur.Checked:= false;

  DoAction(arFindInTabs);
end;

procedure TfmSR.TntFormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Assigned(FOnFocusEditor) then
    FOnFocusEditor(Self);
end;

procedure TTrackBar.CreateParams(var Params: TCreateParams);
//needed to make Trackbar thumb look bigger (hide sunken rectangle)
const
  TBS_ENABLESELRANGE = $0020;
begin
  inherited;
  Params.Style := Params.Style and not TBS_ENABLESELRANGE;
end;

procedure TfmSR.labMultilineClick(Sender: TObject);
begin
  IsMultiline:= not IsMultiline;
end;

procedure TfmSR.UpdMemoHeight;
begin
  ed1Memo.Height:= Trunc(ed2Memo.Height*IfThen(IsReplace, 1, 2.2));

  bCombo1.SetBounds(ed1Memo.Left+ed1Memo.Width, ed1Memo.Top, 16, ed1Memo.Height);
  bCombo2.SetBounds(ed2Memo.Left+ed2Memo.Width, ed2Memo.Top, 16, ed2Memo.Height);
end;

procedure TfmSR.UpdOrigSize;
begin
  ClientWidth:= FWidth0;
  ClientHeight:= FHeight0
    +IfThen(FIsMultiline, FMemoDy*2)
    -IfThen(FIsDocked, StatusFind.Height);
end;

procedure TfmSR.SetIsMultiline(Value: boolean);
var
  NFocus: (f_ed1, f_ed2, f_other);
begin
  if ed1.Focused or ed1Memo.Focused then NFocus:= f_ed1 else
   if ed2.Focused or ed2Memo.Focused then NFocus:= f_ed2 else
     NFocus:= f_other;

  if FIsMultiline<>Value then
  begin
    FIsMultiline:= Value;
    ed1.Visible:= not Value;
    ed2.Visible:= not Value and IsReplace;
    ed1Memo.Visible:= Value;
    ed2Memo.Visible:= Value and IsReplace;
    bCombo1.Visible:= ed1Memo.Visible;
    bCombo2.Visible:= ed2Memo.Visible;

    ed1Memo.Left:= ed1.Left;
    ed2Memo.Left:= ed2.Left;
    ed1Memo.Top:= ed1.Top;
    ed2Memo.Top:= FTopEd2+IfThen(Value, FMemoDy);

    labEd2.Top:= FTopLab2+IfThen(Value, FMemoDy);
    gOp.Top:= FTopGOpt+IfThen(Value, FMemoDy*2);
    gScop.Top:= FTopGScope+IfThen(Value, FMemoDy*2);

    UpdOrigSize;
    UpdMemoHeight;

    if Value then
    begin
      ed1Memo.Text:= ed1.Text;
      ed2Memo.Text:= ed2.Text;
      labEd1.FocusControl:= ed1Memo;
      labEd2.FocusControl:= ed2Memo;
    end
    else
    begin
      ed1.Text:= ed1Memo.Text;
      ed2.Text:= ed2Memo.Text;
      labEd1.FocusControl:= ed1;
      labEd2.FocusControl:= ed2;
    end;

    case NFocus of
      f_ed1:
        begin if Value then ed1Memo.SetFocus else ed1.SetFocus end;
      f_ed2:
        begin if Value then ed2Memo.SetFocus else ed2.SetFocus end;
    end;
  end;
end;


procedure TfmSR.ed1MemoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_escape) and (Shift=[]) then
  begin
    bCancel.Click;
    Key:= 0;
    Exit
  end;
end;

function TfmSR.GetText1: Widestring;
begin
  if IsMultiline then
   Result:= ed1Memo.Text
 else
   Result:= ed1.Text;
end;

function TfmSR.GetText2: Widestring;
begin
  if IsMultiline then
   Result:= ed2Memo.Text
 else
   Result:= ed2.Text;
end;

procedure TfmSR.SetText1(const Value: Widestring);
begin
  ed1.Text:= Value;
  ed1Memo.Text:= Value;
end;

procedure TfmSR.SetText2(const Value: Widestring);
begin
  ed2.Text:= Value;
  ed2Memo.Text:= Value;
end;



procedure TfmSR.bCombo1Click(Sender: TObject);
begin
  DoCombo(ed1, ed1Memo, 1);
end;

procedure TfmSR.mnuComboClick(Sender: TObject);
var
  ed: TTntCombobox;
  edMemo: TTntMemo;
  n: Integer;
begin
  if mnuCombo.Tag=1 then
  begin
    ed:= ed1;
    edMemo:= ed1Memo;
  end
  else
  begin
    ed:= ed2;
    edMemo:= ed2Memo;
  end;
  n:= (Sender as TComponent).Tag;
  edMemo.Text:= ed.Items[n];
  if edMemo.CanFocus then
    edMemo.SetFocus;
end;

procedure TfmSR.DoCombo(ed: TTntCombobox; edMemo: TTntMemo; edNum: integer);
var
  i: Integer;
  mi: TTntMenuItem;
  p: TPoint;
begin
  with mnuCombo do
  begin
    Tag:= edNum;
    Items.Clear;
    for i:= 0 to ed.Items.Count-1 do
    begin
      mi:= TTntMenuitem.Create(Self);
      mi.Caption:= ed.Items[i];
      mi.OnClick:= mnuComboClick;
      mi.Tag:= i;
      Items.Add(mi);
    end;
    p:= Point(edMemo.Width, edMemo.Height);
    p:= edMemo.ClientToScreen(p);
    Popup(p.X, p.Y);
  end;
end;

procedure TfmSR.bCombo2Click(Sender: TObject);
begin
  DoCombo(ed2, ed2Memo, 2);
end;

const
  cFindOptCase = 'c';
  cFindOptWords = 'w';
  cFindOptRegex = 're';
  cFindOptRegex_s = 're_s';
  cFindOptSpec = 'spec';
  cFindOptConfirm = 'cfm';
  cFindOptBookmk = 'bk';
  cFindOptSelAll = 'selall';
  cFindOptExtSel = 'ext';
  cFindOptBack = 'back';
  cFindOptSel = 'sel';
  cFindOptFromCur = 'cur';
  cFindOptWrap = 'wrap';
  cFindOptSkipCol = 'ncol';
  cFindOptTokens = 'tok';

function TfmSR.TextOptions: Widestring;
begin
  Result:=
    IfThen(cbCase.Checked, cFindOptCase+',')+
    IfThen(cbWords.Checked, cFindOptWords+',')+
    IfThen(cbRe.Checked, cFindOptRegex+',')+
    IfThen(cbReDot.Checked, cFindOptRegex_s+',')+
    IfThen(cbSpec.Checked, cFindOptSpec+',')+
    IfThen(cbCfm.Checked, cFindOptConfirm+',')+
    IfThen(cbBkmkAll.Checked, cFindOptBookmk+',')+
    IfThen(cbSelectAll.Checked, cFindOptSelAll+',')+
    IfThen(cbExtSel.Checked, cFindOptExtSel+',')+
    IfThen(cbBack.Checked, cFindOptBack+',')+
    IfThen(cbSel.Checked, cFindOptSel+',')+
    IfThen(cbFromCur.Checked, cFindOptFromCur+',')+
    IfThen(cbWrap.Checked, cFindOptWrap+',')+
    IfThen(cbSkipCol.Checked, cFindOptSkipCol+',')+
    IfThen(cbTokens.ItemIndex>0, cFindOptTokens+IntToStr(cbTokens.ItemIndex)+',');
end;

const
  cFindAction: array[TSynSearchAction] of WideString = (
    'find', 'findall', 'findtabs', 'cnt', 'skip', 'rep', 'repall', 'repallall' );

function FindActionStrToCommand(const S: Widestring): TSynSearchAction;
var
  i: TSynSearchAction;
begin
  Result:= Low(TSynSearchAction);
  for i:= Low(i) to High(i) do
    if cFindAction[i] = S then
    begin
      Result:= i;
      Exit
    end;
end;

procedure ReadFindOptions(
  const Str: Widestring;
  var Act: TSynSearchAction;
  var SText1, SText2: Widestring;
  var Opt: TSearchOptions;
  var Tok: TSearchTokens;
  var OptBkmk, OptExtSel: boolean);
var
  S, SCmd, SOpt: Widestring;
  OptSpec: boolean;
begin
  S:= Str;
  SCmd:= SGetItem(S, #1);
  SOpt:= SGetItem(S, #1);
  SText1:= SGetItem(S, #1);
  SText2:= SGetItem(S, #1);

  //1) action
  Act:= FindActionStrToCommand(SCmd);

  //2) options
  Opt:= [ftEntireScope];
  OptSpec:= false;
  OptBkmk:= false;
  OptExtSel:= false;
  Tok:= tokensAll;
  
  repeat
    S:= SGetItem(SOpt, ',');
    if S='' then Break;
    if S=cFindOptCase then Include(Opt, ftCaseSens);
    if S=cFindOptWords then Include(Opt, ftWholeWords);
    if S=cFindOptRegex then Include(Opt, ftRegex);
    if S=cFindOptRegex_s then Include(Opt, ftRegex_s);
    //if S=cFindOptRegex_m then Include(Opt, ftRegex_m);
    if S=cFindOptSpec then OptSpec:= true;
    if S=cFindOptConfirm then Include(Opt, ftPromtOnReplace);
    if S=cFindOptBookmk then OptBkmk:= true;
    if S=cFindOptExtSel then OptExtSel:= true;
    if S=cFindOptBack then Include(Opt, ftBackward);
    if S=cFindOptSel then Include(Opt, ftSelectedText);
    if S=cFindOptFromCur then Exclude(Opt, ftEntireScope);
    if S=cFindOptWrap then Include(Opt, ftWrapSearch);
    if S=cFindOptSkipCol then Include(Opt, ftSkipCollapsed);
    if Pos(cFindOptTokens, S)=1 then
    begin
      Tok:= TSearchTokens(StrToIntDef(Copy(S, Length(S), 1), 0));
      //Msg(IntToStr(Integer(Tok)));
    end;
  until false;

  if OptSpec then
  begin
    SText1:= SDecodeSpecChars(SText1);
    SText2:= SDecodeSpecChars(SText2);
  end;
end;

function WriteFindOptions(
  Act: TSynSearchAction;
  const TextOpt, Text1, Text2: Widestring): Widestring;
begin
  Result:=
    cFindAction[Act]+#1+
    TextOpt+#1+
    Text1+#1+
    Text2+#1;
end;

procedure TfmSR.ed1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(ed1);
    Key:= 0;
    Exit
  end;
  if (Key=vk_back) and (Shift=[ssCtrl]) then
  begin
    DoDeleteComboLastWord(ed1);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSR.ed2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(ed2);
    Key:= 0;
    Exit
  end;
  if (Key=vk_back) and (Shift=[ssCtrl]) then
  begin
    DoDeleteComboLastWord(ed2);
    Key:= 0;
    Exit
  end;
end;

{
procedure TfmSR.SModClick(const SMod: Widestring);
var
  S: Widestring;
begin
  S:= GetText1;

  if Pos(SMod, S)=1 then
    Delete(S, 1, Length(SMod))
  else
    Insert(SMod, S, 1);

  SetText1(S);
end;
}

procedure TfmSR.ed1KeyPress(Sender: TObject; var Key: Char);
begin
  DoHandleCtrlBkSp(ed1, Key);
end;

procedure TfmSR.ed2KeyPress(Sender: TObject; var Key: Char);
begin
  DoHandleCtrlBkSp(ed2, Key);
end;

procedure TfmSR.TntFormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Str: Widestring;
begin
  if Shortcut(Key, Shift) = Sh_FindNext then
  begin
    if bFindNext.Visible then bFindNext.Click else
     if bSkip.Visible then bSkip.Click;
    Key:= 0;
    Exit
  end;
  if Shortcut(Key, Shift) = Sh_FindMode then
  begin
    IsReplace:= false;
    Key:= 0;
    Exit;
  end;
  if Shortcut(Key, Shift) = Sh_ReplaceMode then
  begin
    IsReplace:= true;
    Key:= 0;
    Exit;
  end;
  //Ctrl+E - paste escaped string
  if (Key=Ord('E')) and (Shift=[ssCtrl]) then
  begin
    Str:= TntClipboard.AsWideText;
    if ed1.Focused then ed1.SelText:= SEscapeRegex(Str) else
     if ed1Memo.Focused then ed1Memo.SelText:= SEscapeRegex(Str) else
      if ed2.Focused then ed2.SelText:= SEscapeRegexAlt(Str) else
       if ed2Memo.Focused then ed2Memo.SelText:= SEscapeRegexAlt(Str);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSR.labTranspClick(Sender: TObject);
begin
  with PanelTr do
    Visible:= not Visible;
end;

procedure TfmSR.cbBkmkAllClick(Sender: TObject);
begin
  if cbBkmkAll.Checked then
    cbSelectAll.Checked:= false;
end;

procedure TfmSR.cbSelectAllClick(Sender: TObject);
begin
  if cbSelectAll.Checked then
    cbBkmkAll.Checked:= false;
end;

procedure TfmSR.DoInsertCharCode;
var
  IsRepl: boolean;
  Str, StrChar: Widestring;
  Num: LongWord;
begin
  IsRepl:= ed2.Focused or ed2Memo.Focused;
  if IsRepl then Str:= Text2 else Str:= Text1;

  if not DoInputCharCode(StrChar, Num, SRIni) then
    begin ShowStatus(''); Exit end;
    
  Str:= Str+StrChar;
  if IsRepl then Text2:= Str else Text1:= Str;
  
  ShowStatus(WideFormat(DKLangConstW('zMInputUnicodeHex'),
    [StrChar, IntToHex(Num, 4)]));
end;

procedure TfmSR.labDockedClick(Sender: TObject);
begin
  IsDocked:= not IsDocked;
end;

procedure TfmSR.SetIsDocked(Value: boolean);
begin
  if Value<>FIsDocked then
  begin
    FIsDocked:= Value;
    StatusFind.Visible:= not Value;

    Visible:= false;
    if Value then
      begin FLeft0:= Left; FTop0:= Top; end;

    if Assigned(FOnDockedChanged) then
      FOnDockedChanged(Self);

    IsReplace:= IsReplace;

    if not Value then
      begin Left:= FLeft0; Top:= FTop0; end;
    Visible:= true;
  end;
end;

end.
