{
SynWrite main form, for exe version.
The UI form is TfmMain, it's created as a child of this form.
}
unit unEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  TntForms, TntClasses,
  IniFiles,
  unMain,
  ATSynPlugins,
  AppEvnts;

type
  TfmSynEx = class(TTntForm)
    ApplicationEvents1: TApplicationEvents;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure ApplicationEvents1Deactivate(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
  private
    { Private declarations }
    procedure SavePos;
    procedure LoadPos;
    function GetSessionFN: string;
  public
    { Public declarations }
  protected
    procedure WMDropFiles(var m: TMessage); message WM_DROPFILES;
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  end;

var
  fmSynEx: TfmSynEx;

function SynParamsOK: boolean;
function SynInstanceNeeded: boolean;

implementation

uses
  VistaAltFixUnit, DKLang,
  ShellApi,
  ATxSProc, ATxFProc, unProc,
  TntSystem, TntSysUtils;

{$R *.dfm}

var
  SynExePath,
  SynIniPath,
  SynIni,
  SynHistoryIni: string;
  SynTextOnly: integer;


function GetPassedLineNumber: integer;
var
  i: Integer;
  s: string;
begin
  Result:= 0;
  for i:= 1 to ParamCount do
  begin
    s:= ParamStr(i);
    if SBegin(s, cSynParamLineNum) then
    begin
      Delete(s, 1, Length(cSynParamLineNum));
      Result:= StrToIntDef(s, 0);
      Exit
    end;
  end;
end;

function IsUnneededParam(var S: Widestring): boolean;
//need to skip parameter with filename of "notepad.exe",
//special case for debugger under Win
begin
  Result:= (S='') or (S[1]='/') or
    (WideLowerCase(WideExtractFileName(S))='notepad.exe');
  if not Result then
    FixFilenamePath(S);
end;

function SynInstanceNeeded: boolean;
var
  Force: boolean;
  Data: TCopyDataStruct;
  f: THandle;
  S: Widestring;
  i, NParams: integer;
begin
  Result:= true;
  Force:= false;

  //check command-line for "force single instance" key
  for i:= 1 to ParamCount do
    if ParamStr(i)=cSynParamSingleInst then
    begin
      Force:= true;
      Break
    end;

  //check ini option, if false - exit
  if not Force then
    with TIniFile.Create(SynIni) do
    try
      if not ReadBool('Setup', 'Inst', false) then Exit;
    finally
      Free;
    end;

  //check other Syn instances  
  f:= FindWindowW('TfmSynEx.UnicodeClass', nil);
  if f = 0 then Exit;
  Result:= false;
  NParams:= WideParamCount;

  if NParams=0 then
  begin
    FillChar(Data, SizeOf(Data), 0);
    Data.dwData:= 100;
    Data.cbData:= 0;
    Data.lpData:= nil;
    SendMessage(f, WM_COPYDATA, 0, integer(@Data));
  end
  else
  for i:= 1 to NParams do
  begin
    S:= WideParamStr(i);
    if IsUnneededParam(S) then Continue;

    FillChar(Data, SizeOf(Data), 0);
    Data.dwData:= 100 + (GetPassedLineNumber shl 8);
    Data.cbData:= (Length(S) + 1) * 2;
    Data.lpData:= PWideChar(S);
    SendMessage(f, WM_COPYDATA, 0, integer(@Data));
  end;
end;

function IsFileCreatedOk(const S: WideString): boolean;
var
  h: THandle;
begin
  Result:= true;
  if (S <> '') and (not IsFileExist(S)) then
  begin
    h:= CreateFileW(PWChar(S), generic_read or generic_write,
      FILE_SHARE_read or FILE_SHARE_write, nil,
      CREATE_NEW, FILE_ATTRIBUTE_NORMAL, 0);
    if h <> INVALID_HANDLE_VALUE then
      CloseHandle(h)
    else
    begin
      MsgCannotCreate(S, 0);
      Result:= false;
    end;
  end;
end;

procedure InitLang;
var
  Num: Integer;
begin
  with TIniFile.Create(SynIni) do
  try
    LangManager.ScanForLangFiles(SynExePath+'Lang', '*.lng', false);
    Num:= ReadInteger('Setup', 'Lang', LangManager.LanguageID);
    LangManager.LanguageID:= Num;
  finally
    Free;
  end;
end;

procedure InitSynTextOnly;
begin
  with TIniFile.Create(SynIni) do
  try
    SynTextOnly:= ReadInteger('Setup', 'TxOnly', 0);
  finally
    Free;
  end;
end;

//check filename
function CheckFile(const SF: Widestring): boolean;
begin
  Result:= true;

  if (SF<>'') and not IsFileExist(SF) then
  begin
    if MsgConfirmCreate(SF, 0) then
    begin
      Result:= IsFileCreatedOk(SF);
      if not Result then Exit;
    end
    else
    begin
      Result:= false;
      Exit
    end;
  end;

  if (SF<>'') and IsFileTooBig(SF) then
  begin
    InitLang;
    MsgFileTooBig(SF, 0);
    Result:= false;
    Exit
  end;

  if (SF<>'') and (SynTextOnly<>1) and (not IsFileText(SF)) then
    if not IsFileArchive(SF) then
    begin
      InitLang;
      if not MsgConfirmBinary(SF, 0) then
        Result:= false;
    end;
end;

function SynParamsOK: boolean;
var
  i: integer;
  S: Widestring;
begin
  Result:= True;
  InitSynTextOnly;

  for i:= 1 to WideParamCount do
  begin
    S:= WideParamStr(i);
    if IsUnneededParam(S) then
      Continue;

    if IsFileProject(S) then
    begin
      SynCommandlineProjectFN:= S;
      Exit;
    end;

    if IsFileSession(S) then
    begin
      SynCommandlineSessionFN:= S;
      Exit;
    end;    

    if IsDirExist(S) then
    begin
      Exit
    end;  

    if not CheckFile(S) then
    begin
      Result:= False;
      Exit
    end;
  end;
end;

procedure TfmSynEx.FormCreate(Sender: TObject);
begin
  fmMain:= TfmMain.Create(Self);
  fmMain.Parent:= Self;
  fmMain.Align:= alClient;
  //
  TVistaAltFix.Create(Self);
end;

function TfmSynEx.GetSessionFN: string;
begin
  //first, check if project-session is set
  Result:= fmMain.SynProjectSessionFN;
  if Result<>'' then
  begin
    //MsgInfo('load project session', Handle);////////
    Exit;
  end;

  //next check for last MRU session
  with TIniFile.Create(SynHistoryIni) do
  try
    Result:= UTF8Decode(ReadString('MRU_Sess', '0', ''));
  finally
    Free;
  end;

  //use default session
  if Result='' then
    Result:= SynIniPath + SynDefaultSyn;
end;

procedure TfmSynEx.FormShow(Sender: TObject);
var
  i: integer;
  S: Widestring;
begin
  fmMain.hLister:= Handle;
  fmMain.Show;
  fmMain.acNewTab.Execute;
  fmMain.DoCheckCommandLineTwo;

  LoadPos;
  DragAcceptFiles(Handle, True);

  if WideParamCount=0 then
  begin
    //reopen session (only when no params)
    if fmMain.opHistSessionLoad and (SynCommandlineSessionFN='') then
    begin
      S:= GetSessionFN;
      if S<>'' then
        if IsFileExist(S) then
          fmMain.DoOpenSession(S)
        else
        begin
          fmMain.DoHint(DKLangConstW('MNFound')+' '+S);
          MsgBeep;
        end;
    end;
  end
  else
  begin
    if SynCommandlineProjectFN<>'' then
    begin
      //open cmd-line project
      fmMain.DoOpenProject(SynCommandlineProjectFN);
    end
    else
    if SynCommandlineSessionFN<>'' then
    begin
      //open cmd-line session
      fmMain.DoOpenSession(SynCommandlineSessionFN);
    end
    else
    for i:= 1 to WideParamCount do
    begin
      S:= WideParamStr(i);
      if IsUnneededParam(S) then Continue;

      //open cmd-line parameter
      if IsDirExist(S) then
        fmMain.DoOpenFolder(S)
      else
        fmMain.DoOpenFile(S);
      fmMain.UpdateRO;

      //if file empty (new), uncheck R/O
      if FGetFileSize(S)=0 then
        if fmMain.ecReadOnly.Checked then
          fmMain.ecReadOnly.Execute;
    end;
  end;
end;


procedure TfmSynEx.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Dont call fmMain.Close: flicker
  fmMain.FormClose(Self, Action);

  DragAcceptFiles(Handle, False);
  SavePos;
end;

procedure TfmSynEx.LoadPos;
begin
  with TIniFile.Create(SynHistoryIni) do
  try
    Left:= ReadInteger('Win', 'Left', 200);
    Top:= ReadInteger('Win', 'Top', 200);
    Width:= ReadInteger('Win', 'Width', 780);
    Height:= ReadInteger('Win', 'Height', 550);
    if ReadBool('Win', 'Max', false) then
    begin
      WindowState:= wsMaximized;
      fmMain.DoRepaint; //need repaintin for Maximized window
    end;
    //if ReadBool('Win', 'FScr', false) then
    //  fmMain.ecFullScr.Execute;
    if ReadBool('Win', 'OnTop', false) then
      fmMain.ecOnTop.Execute;
  finally
    Free;
  end;

  //for the bad case
  if ClientHeight=0 then
  begin
    SetBounds(20, 20, 780, 560);
    WindowState := wsNormal;
  end;
end;

procedure TfmSynEx.SavePos;
begin
  try
    with TIniFile.Create(SynHistoryIni) do
    try
      //WriteBool('Win', 'FScr', fmMain.ShowFullScreen); //don't save full-screen
      WriteBool('Win', 'OnTop', fmMain.ShowOnTop);
      if fmMain.ShowFullScreen then Exit;
      if not fmMain.opSaveWndPos then Exit;
      if WindowState <> wsMaximized then
      begin
        WriteInteger('Win', 'Left', Left);
        WriteInteger('Win', 'Top', Top);
        WriteInteger('Win', 'Width', Width);
        WriteInteger('Win', 'Height', Height);
      end;
      WriteBool('Win', 'Max', WindowState = wsMaximized);
    finally
      Free;
    end;
  except
  end;
end;

procedure TfmSynEx.WMDropFiles(var m: TMessage);
var
  fn: array[0..MAX_PATH-1] of WideChar;
  nCount, i: Integer;
  InProj: boolean;
begin
  InProj:= fmMain.IsMouseOverProject;
  FillChar(fn, Sizeof(fn), 0);
  nCount:= DragQueryFileW(THandle(M.WParam), $FFFFFFFF, fn, MAX_PATH);
  for i:= 0 to nCount-1 do
  begin
    FillChar(fn, Sizeof(fn), 0);
    DragQueryFileW(THandle(M.WParam), i, fn, MAX_PATH);
    fmMain.DoDropFile(Widestring(fn), InProj);
  end;
  DragFinish(THandle(M.WParam));
end;

procedure TfmSynEx.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = vk_escape) and (Shift = []) then
  begin
    //Esc in QSearch
    if fmMain.edQs.Focused then
      fmMain.DoHandleQuickSearchEscape
    else
    //Esc in progress form
    if Assigned(fmMain.fmProgress) and (fmMain.fmProgress.Visible) then
      fmMain.fmProgress.bCan.Click
    else
    //Esc in panels
    if (fmMain.CurrentEditor<>nil) and (not fmMain.CurrentEditor.Focused) then
      fmMain.FocusEditor
    else
      //Esc in editor
      case fmMain.opEsc of
        cEscCloseApp:
          Close;
        cEscCloseTab:
          fmMain.acClose.Execute;
        cEscCloseTabOrApp:
          begin
            if fmMain.FrameAllCount=1 then
              Close
            else
              fmMain.acClose.Execute;
          end;    
        cEscMinimizeApp:
          Application.Minimize;
      end;
    Key:= 0;
    Exit
  end;

  //Ctrl+Tab, Ctrl+Shift+Tab
  if (Key = vk_tab) and ((Shift = [ssCtrl]) or (Shift = [ssCtrl, ssShift])) then
  begin
    fmMain.DoTabSwitch(Shift = [ssCtrl]);
    Key:= 0;
    Exit
  end;
end;

procedure TfmSynEx.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  fmMain.OnCloseQuery(nil, CanClose);
end;

procedure TfmSynEx.WMCopyData(var Msg: TWMCopyData);
var
  S: WideString;
  N: Integer;
begin
  Msg.Result:= 1;
  with Msg.CopyDataStruct^ do
    case dwData and $FF of
      100: //"Open Unicode filename"
      begin
        S:= WideString(PWideChar(lpData));
        N:= dwData shr 8;
      end
      else
      begin
        S:= '';
        N:= -1;
      end;
    end;

  Application.Restore;
  Application.BringToFront;
  //for W7: it doesn't restore window
  if GetForegroundWindow <> Handle then
  begin
    Application.Minimize;
    Application.Restore;
    Application.BringToFront;
  end;

  if (S <> '') and CheckFile(S) then
  begin
    fmMain.DoOpenFile(S);
    if N > 0 then
      fmMain.CurrentEditor.CaretPos:= Point(0, N-1);
    fmMain.DoRepaint;
  end;
end;

procedure TfmSynEx.ApplicationEvents1Deactivate(Sender: TObject);
begin
  if fmMain.opASaveOnFocus then
    fmMain.DoAutoSave;
end;

function PluginAction(AHandle: Pointer; AName: PWideChar; A1, A2, A3, A4: Pointer): Integer; stdcall;
begin
  Result:= fmMain.PluginAction(AHandle, AName, A1, A2, A3, A4);
end;


procedure TfmSynEx.ApplicationEvents1Message(var Msg: tagMSG;
  var Handled: Boolean);
var
  h: THandle;
begin
  //this needed mainly for SynFTP which doesn't react to
  //cursor keys by default
  Handled:= false;
  if ((Msg.message=wm_keydown) or (Msg.message=wm_keyup)) and
    Assigned(fmMain) and fmMain.IsPluginWindowActive(h) then
  begin
    //there's issue with Enter key: if it's passed to IsDialogMessage
    //then it doesn't work. Others (eg. arrows) need to be passed.
    if (Msg.wParam <> vk_return) then
      Handled:= IsDialogMessage(h, Msg);
  end
end;

procedure InitPaths;
var
  SynSampleIni,
  SynHideIni,
  SynHideSampleIni: string;
begin
  SynExePath:= ExtractFilePath(ParamStr(0));
  if IsFileExist(SynExePath + 'Portable.ini') then
    SynIniPath:= SynExePath
  else
    SynIniPath:= SynAppdataDir + '\';

  SynIni:= SynIniPath + 'Syn.ini';
  SynSampleIni:= SynExePath + 'Syn.sample.ini';
  SynHistoryIni:= SynIniPath + 'SynHistory.ini';
  SynHideIni:= SynExePath + 'SynHide.ini';
  SynHideSampleIni:= SynExePath + 'SynHide.sample.ini';

  if not IsFileExist(SynIni) then
    if IsFileExist(SynSampleIni) then
      CopyFile(PChar(SynSampleIni), PChar(SynIni), true);

  if not IsFileExist(SynHideIni) then
    if IsFileExist(SynHideSampleIni) then
      CopyFile(PChar(SynHideSampleIni), PChar(SynHideIni), true);
end;

procedure InitApi;
begin
  _SynActionProc:= @PluginAction;
end;

initialization
  InitPaths;
  InitApi;

finalization
  SynIni:= '';
  SynHistoryIni:= '';
  SynIniPath:= '';

end.

