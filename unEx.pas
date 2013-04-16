unit unEx;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, Forms,
  TntForms, TntClasses,
  IniFiles,
  unMain, ATSynPlugins,
  XPMan, AppEvnts;

type
  TfmSynEx = class(TTntForm)
    XPManifest1: TXPManifest;
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
  fmMain: TfmMain;
  fmSynEx: TfmSynEx;

function CheckIni: boolean;
function CheckInst: boolean;

implementation

uses
  VistaAltFixUnit, DKLang,
  ShellApi,
  ATxSProc, ATxFProc, unProc,
  TntSystem, TntSysUtils;

{$R *.dfm}

var
  SIni: string = '';

function GetSynIni: string;
begin
  if IsFileExist(ExtractFilePath(ParamStr(0)) + 'Portable.ini') then
    Result:= ExtractFilePath(ParamStr(0)) + 'Syn.ini'
  else
    Result:= SAppDir + '\' + 'Syn.ini';
end;

function GetPassedLineNumber: integer;
var
  i: Integer;
  s: string;
begin
  Result:= 0;
  for i:= 1 to ParamCount do
  begin
    s:= ParamStr(i);
    if Copy(s, 1, 3) = '/N=' then
    begin
      Result:= StrToIntDef(Copy(s, 4, MaxInt), 1);
      Exit
    end;
  end;
end;

function IsUnneededParam(var S: Widestring): boolean;
begin
  Result:=
    (S='') or
    (S[1]='/') or
    (WideLowerCase(WideExtractFileName(S))='notepad.exe');
  if not Result then
    FixFilenamePath(S);
end;

function CheckInst: boolean;
var
  Data: TCopyDataStruct;
  f: THandle;
  S: Widestring;
  i, NParams: integer;
begin
  Result:= true;
  with TIniFile.Create(SIni) do
  try
    if not ReadBool('Setup', 'Inst', false) then Exit;
  finally
    Free;
  end;

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

//create new file
function FNew(const S: WideString): boolean;
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
    else begin
      Msg(DKLangConstW('MNCreate')+#13 + S);
      Result:= false;
    end;
  end;
end;

//check filename
function CheckFile(const SF: Widestring): boolean;
var
  TxOnly: integer;
begin
  Result:= true;
  with TIniFile.Create(SIni) do
  try
    LangManager.LanguageID:= ReadInteger('Setup', 'Lang', LangManager.LanguageID);
    TxOnly:= ReadInteger('Setup', 'TxOnly', 0);
  finally
    Free;
  end;

  if (SF <> '') and (not IsFileExist(SF)) then
  begin
    if MsgConfirmCreate(SF) then
    begin
      Result:= FNew(SF);
      if not Result then Exit;
    end
    else
    begin
      Result:= false;
      Exit
    end;
  end;

  if (SF <> '') and FBigSized(SF) then begin
    Msg(WideFormat(DKLangConstW('MBig'), [WideExtractFileName(SF)]));
    Result:= false;
    Exit
  end;

  if (SF <> '') and (TxOnly<>1) and (not IsFileText(SF)) then
    if not MsgConfirmBinary(SF) then
      Result:= false;
end;

function CheckIni: boolean;
var
  i: integer;
  S: Widestring;
begin
  Result:= True;
  for i:= 1 to WideParamCount do
  begin
    S:= WideParamStr(i);
    if IsUnneededParam(S) then Continue;

    if not CheckFile(S) then
      begin Result:= False; Exit end;
  end;
end;

procedure TfmSynEx.FormCreate(Sender: TObject);
begin
  fmMain:= TfmMain.Create(Self);
  fmMain.Parent:= Self;
  fmMain.Align:= alClient;
  fmMain.SynExe:= True;
  //
  TVistaAltFix.Create(Self);
end;

function TfmSynEx.GetSessionFN: string;
begin
  Result:= SDefSessionFN;
  with TIniFile.Create(SIni) do
  try
    Result:= UTF8Decode(ReadString('MRU_Sess', '0', Result));
  finally
    Free;
  end;
end;

procedure TfmSynEx.FormShow(Sender: TObject);
var
  i: integer;
  S: Widestring;
begin
  fmMain.hLister:= Handle;
  fmMain.Show;
  fmMain.fNew.Execute;

  LoadPos;
  DragAcceptFiles(Handle, True);

  if WideParamCount=0 then
  begin
    //reopen session (only when no params)
    if fmMain.opHistSessionLoad then
    begin
      S:= GetSessionFN;
      fmMain.OpenSession(S);
    end;
  end
  else
    //open params
    for i:= 1 to WideParamCount do
    begin
      S:= WideParamStr(i);
      if IsUnneededParam(S) then Continue;

      //now open file or project
      if IsFileProject(S) then
      begin
        fmMain.OpnProject(S);
      end
      else
      begin
        fmMain.OpnFile(S);
        fmMain.UpdateRO;
        //Is file new?
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
  with TIniFile.Create(SIni) do
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
    with TIniFile.Create(SIni) do
    try
      //WriteBool('Win', 'FScr', fmMain.FullScr);
      WriteBool('Win', 'OnTop', fmMain.OnTop);
      if fmMain.FullScr then Exit;
      if not fmMain.opSavePos then Exit;
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
  n, i: Integer;
  InProj: boolean;
begin
  InProj:= fmMain.IsMouseInProj;
  FillChar(fn, Sizeof(fn), 0);
  n:= DragQueryFileW(THandle(M.WParam), $FFFFFFFF, fn, MAX_PATH);
  for i:= 0 to n-1 do
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
      case fmMain.opQsEsc of
        0: fmMain.TBXItemTQsClick(Self);
        1: fmMain.fExit.Execute;
        else fmMain.FocusEditor;
      end
    else
    //Esc in panels
    if (fmMain.CurrentEditor<>nil) and (not fmMain.CurrentEditor.Focused) then
      fmMain.FocusEditor
    else
      //Esc in editor
      //0: do nothing, 1: close app, 2: close tab, 3: close tab or app, 4: minimize app
      case fmMain.opEsc of
        1: Close;
        2: fmMain.fClose.Execute;
        3: if fmMain.FrameAllCount=1 then Close else fmMain.fClose.Execute;
        4: Application.Minimize;
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
    fmMain.OpnFile(S);
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

initialization
  SIni:= GetSynIni;
  _SynActionProc:= @PluginAction;

end.
