unit HHelp;

interface

uses Windows;

function ViewHelp(H: HWND; const HelpFile, HelpStr: Widestring): HWND;

implementation

type
  THH_AKLINK = packed record
    cbStruct: Integer;
    fReserved: Boolean; { must be FALSE }
    pszKeywords: PWChar;
    pszUrl: PWChar;
    pszMsgText: PWChar;
    pszMsgTitle: PWChar;
    pszWindow: PWChar;
    fIndexOnFail: Boolean;
  end;

type
  THtmlHelpAProc = function(hWndCaller: HWND; pszFile: PAnsiChar; uCommand: UINT; dwData: DWORD): HWnd; stdcall;
  THtmlHelpWProc = function(hWndCaller: HWND; pszFile: PWideChar; uCommand: UINT; dwData: DWORD): HWnd; stdcall;

var
  HtmlHelpModule : HModule;
  HtmlHelpAProc : THtmlHelpAProc;
  HtmlHelpWProc: THtmlHelpWPRoc;

function _HtmlHelpSetup : Boolean;
begin
  Result := false;
  if (HtmlHelpModule = 0) then
  begin
    HtmlHelpModule := LoadLibrary('hhctrl.ocx');
    if (HtmlHelpModule <> 0) then
    begin
      @HtmlHelpAProc := GetProcAddress(HtmlHelpModule, 'HtmlHelpA');
      @HtmlHelpWProc := GetProcAddress(HtmlHelpModule, 'HtmlHelpW');
    end;
  end;
  if Assigned(HtmlHelpAProc) and Assigned(HtmlHelpWProc) then Result := true;
end;

function HtmlHelpW(hWndCaller: HWND; pszFile: PWideChar; uCommand: UINT; dwData:DWORD): HWND;
begin
  Result := 0;
  if _HtmlHelpSetup then
  begin
   Result := HtmlHelpWProc(hWndCaller, pszFile, uCommand, dwData);
  end;
end;

const
  HH_DISPLAY_TOPIC      = 0;
  HH_HELP_FINDER         =    0;
  HH_DISPLAY_TOC         =    1;
  HH_DISPLAY_INDEX       =    2;
  HH_DISPLAY_SEARCH      =    3;
  HH_SET_WIN_TYPE        =    4;
  HH_GET_WIN_TYPE        =    5;
  HH_GET_WIN_HANDLE      =    6;
  HH_ENUM_INFO_TYPE      =    7;
  HH_SET_INFO_TYPE       =    8;
  HH_SYNC                =    9;
  HH_KEYWORD_LOOKUP      =   $d;

function ViewHelp(H: HWND; const HelpFile, HelpStr: Widestring): HWND;
var
  lnk: THH_AKLINK;
begin
  FillChar(lnk, SizeOf(lnk), 0);
  lnk.cbStruct := sizeof(lnk);
  lnk.pszKeywords := PWChar(HelpStr);

  {Result:= }HtmlHelpW(H, PWChar(HelpFile), HH_DISPLAY_INDEX, DWORD(PWChar(HelpStr)));
  Result:= HtmlHelpW(H, PWChar(HelpFile), HH_KEYWORD_LOOKUP, DWORD(@lnk));
end;

initialization
  HtmlHelpModule := 0;
finalization
  if HtmlHelpModule <> 0 then FreeLibrary(HtmlHelpModule);
end.
