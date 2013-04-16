{///////////////////////////////////////////////////////////////////////////////
  SynWrite
  Lister plugin
///////////////////////////////////////////////////////////////////////////////}










library Syn2;
{$E wlx}
{$R *.res}
{$R Syn.dkl_const.res}

uses
  FastMM4,
  FastMove,
  FastCode,
  SysUtils,
  Windows,
  Controls,
  Messages,
  unMain in 'unMain.pas' {fmMain},
  unFrame in 'unFrame.pas' {EditorFrame: TFrame},
  unSetup in 'unSetup.pas' {fmSetup},
  unSearch in 'unSearch.pas',
  unSR in 'unSR.pas' {fmSR},
  unAb in 'unAb.pas' {fmAb},
  iniFiles,
  ATxFProc,
  ATSynPlugins,
  VCLFixes;

const
  LISTPLUGIN_OK    = 0;
  LISTPLUGIN_ERROR = 1;
  lc_copy          = 1;
  lc_newparams     = 2;
  lc_selectall     = 3;
  lc_setpercent    = 4;

  lcp_wraptext     = 1;
  lcp_fittowindow  = 2;
  lcp_ansi         = 4;
  lcp_ascii        = 8;
  lcp_variable     = 12;
  lcp_forceshow    = 16;

  lcs_findfirst    = 1;
  lcs_matchcase    = 2;
  lcs_wholewords   = 4;
  lcs_backwards    = 8;

  itm_percent      = $FFFE;
  itm_fontstyle    = $FFFD;
  itm_wrap         = $FFFC;
  itm_fit          = $FFFB;

//============================================================================
procedure ListGetDetectString(DetectString: PAnsiChar; MaxLen: integer); stdcall;
begin
  lstrcpyA(DetectString, nil);
end;

//============================================================================
  function NotText(const s: Widestring): boolean;
  begin
    with TIniFile.Create(LsIni) do
    try
      case ReadInteger('Syn2', 'TxOnly', 0) of
        0: Result:= not IsFileText(S);
        1: Result:= False;
        else Result:= not IsFileText(S) and not MsgConfirmBinary(S);
      end;
    finally
      Free;
    end;
  end;

function ListLoadW(ListerWin: HWND; FileToLoad: PWideChar; ShowFlags: integer): HWND; stdcall;
var S: WideString;
begin
  S:= FileToLoad;
  if (S <> '') and ((S[Length(S)] = '\') or FBigSized(S) or NotText(S)) then
    Result:= 0
  else
    Result:= StartSyn(ListerWin, S);
end;

function ListLoad(ListerWin: HWND; FileToLoad: PAnsiChar; ShowFlags: integer): HWND; stdcall;
begin
  Result:= ListLoadW(ListerWin,
    PWideChar(WideString(AnsiString(FileToLoad))), ShowFlags);
end;

//============================================================================
function ListLoadNextW(ParentWin, ListWin: HWND;
  FileToLoad: PWideChar;
  ShowFlags: integer): integer; stdcall;
var S: WideString;
  f: TfmMain;
begin
  Result:= LISTPLUGIN_ERROR;
  S:= FileToLoad;
  if (S = '') or (S[Length(S)] = '\') or FBigSized(S) or not IsFileText(S) then
    Exit;
  f:= TfmMain(FindControl(ListWin));
  if f <> nil then
  with f do
  begin
    fCloseAll.Execute;
    OpnFile(S);
    UpdateRO;
    UpdateQVTree(S);
    Result:= LISTPLUGIN_OK;
  end;
end;

function ListLoadNext(ParentWin, ListWin: HWND;
  FileToLoad: PAnsiChar;
  ShowFlags: integer): integer; stdcall;
begin
  Result:= ListLoadNextW(ParentWin, ListWin,
    PWideChar(WideString(AnsiString(FileToLoad))), ShowFlags);
end;

//============================================================================
procedure ListCloseWindow(PluginWin: HWND); stdcall;
begin
  StopSyn(PluginWin);
end;

//============================================================================
function ListSearchTextW(ListWin: HWND;
  SearchString: PWideChar;
  SearchParameter: integer): integer; stdcall;
var
  f: TfmMain;
begin
  Result:= LISTPLUGIN_OK;
  f:= TfmMain(FindControl(ListWin));
  if f <> nil then
  with f do begin
    SHint[-1]:= '';
    Finder.Flags:= [];
    if (SearchParameter and lcs_backwards) <> 0 then
      Finder.Flags:= Finder.Flags + [ftBackward];
    if (SearchParameter and lcs_matchcase) <> 0 then
      Finder.Flags:= Finder.Flags + [ftCaseSensitive];
    if (SearchParameter and lcs_findfirst) <> 0 then
      Finder.Flags:= Finder.Flags + [ftEntireScope];
    if (SearchParameter and lcs_wholewords) <> 0 then
      Finder.Flags:= Finder.Flags + [ftWholeWordOnly];

    Finder.SkipInit:= True;
    Finder.FindText:= SearchString;
    Finder.FindAgain;
  end;
end;

function ListSearchText(ListWin: HWND;
  SearchString: PAnsiChar;
  SearchParameter: integer): integer; stdcall;
begin
  Result:= ListSearchTextW(ListWin,
    PWideChar(WideString(AnsiString(SearchString))),
    SearchParameter);
end;

//============================================================================
function ListSendCommand(ListWin: HWND;
  Command, Parameter: integer): integer; stdcall;
var
  f: TfmMain;
begin
  Result:= LISTPLUGIN_OK;
  f:= TfmMain(FindControl(ListWin));
  if f = nil then Exit;
  with f do begin
    case Command of
      lc_copy:       ecCopy.Execute;
      lc_selectall:  ecSelectAll.Execute;
      lc_setpercent: begin
        CurrentEditor.TopLine:= CurrentEditor.Lines.Count*Parameter div 100;
        PostMessage(ListWin, WM_COMMAND, MAKELONG(Parameter, itm_percent), Handle);
      end;
      lc_newparams: begin
        if (Parameter and lcp_ascii)=lcp_ascii then begin
          Parameter:= Parameter-lcp_ascii;
        end;
        if (Parameter and lcp_ansi)=lcp_ansi then begin
        end;
        if (Parameter and lcp_wraptext)=lcp_wraptext then begin
          if (not CurrentEditor.WordWrap) then ecWrap.Execute;
        end
        else begin
          if CurrentEditor.WordWrap then ecWrap.Execute;
        end;
      end;
    end;
  end;
end;

//=================================
function ListPrintW(ListWin: HWND;
  FileToPrint,DefPrinter: PWideChar;
  PrintFlags: integer; var Margins: TRect): integer; stdcall;
var
  f: TfmMain;
begin
  Result:= LISTPLUGIN_OK;
  f:= TfmMain(FindControl(ListWin));
  if f <> nil then
    f.ecPrintAction.Execute;
end;

function ListPrint(ListWin: HWND;
  FileToPrint, DefPrinter: PAnsiChar;
  PrintFlags: integer; var Margins: TRect): integer; stdcall;
begin
  Result:= ListPrintW(ListWin,
    PWideChar(WideString(AnsiString(FileToPrint))),
    PWideChar(WideString(AnsiString(DefPrinter))),
    PrintFlags, Margins);
end;

//========================================
procedure DLLEntryProc(EntryCode: integer);
var
  p: Pointer;
begin
  case EntryCode of
    DLL_PROCESS_ATTACH:
    begin
    end;
    DLL_PROCESS_DETACH:
    begin
    end;
    DLL_THREAD_ATTACH:
    begin
    end;
    DLL_THREAD_DETACH:
    begin
      if @TlsLast = nil then
        Exit;
      if TlsIndex <> -1 then
      begin
        p := TlsGetValue(TlsIndex);
        if p <> nil then
        begin
          // The RTL will check the TLS value fo nil so if we Free it first then
          // set it to nil when the RTL tries to free it will find it set to nil and
          // skip it
          TlsSetValue(TlsIndex, nil); // <- this fixes case (5), the RTL does not nil the value
        end;
      end;
    end;
  end;
end;

//===========================================================
function ListSearchDialog(ListWin: HWND; AFindNext: integer): integer; stdcall;
var f: TfmMain;
begin
  Result := LISTPLUGIN_ERROR;
  f:= TfmMain(FindControl(ListWin));
  if f = nil then Exit;
  with f do begin
    if opSrUseDlg then
      Result := LISTPLUGIN_OK
    else
    begin
      Result := LISTPLUGIN_ERROR;
      Exit
    end;
    if (AFindNext = 1) then
    begin
      if Finder.FindText = '' then FindInit;
      if Finder.FindText <> '' then
      begin
        Finder.Flags:= Finder.Flags - [ftEntireScope];
        if not Finder.FindAgain then
          MessageBeep(mb_iconwarning);
      end
      else
        ecFind.Execute;
    end
    else
      ecFind.Execute;
  end;
end;

type
  TListDefaultParamStruct = record
    size,
    PluginInterfaceVersionLow,
    PluginInterfaceVersionHi: DWORD;
    DefaultIniName: array[0..MAX_PATH-1] of AnsiChar;
  end;
  pListDefaultParamStruct = ^TListDefaultParamStruct;

procedure ListSetDefaultParams(dps: pListDefaultParamStruct); stdcall;
begin
  LsIni:= AnsiString(dps.DefaultIniName);
end;


exports
  ListSetDefaultParams,
  ListGetDetectString,
  ListLoad,
  ListLoadW,
  ListLoadNext,
  ListLoadNextW,
  ListCloseWindow,
  ListSendCommand,
  ListSearchText,
  ListSearchTextW,
  ListSearchDialog,
  ListPrint,
  ListPrintW;

begin
  DLLProc := @DLLEntryProc;
  DLLEntryProc(DLL_PROCESS_ATTACH);

end.
