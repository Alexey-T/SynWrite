unit ATxUnpack;

interface

function FUnpackAll(const fn, sdir: string): boolean;
function FUnpackSingle(const fn, sdir, fn_unpack: string): boolean;

implementation

uses 
  SysUtils, 
  Windows,
  ShellAPI;


function ExecShell(const cmd, params: string): boolean;
var
  si: TShellExecuteInfo;
begin
  FillChar(si, SizeOf(si), 0);
  si.cbSize:= SizeOf(si);
  si.fMask:= SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  si.lpFile:= PChar(cmd);
  si.lpParameters:= PChar(params);
  si.nShow:= SW_SHOWNORMAL;
  Result:= ShellExecuteEx(@si);
  if Result then
    WaitForSingleObject(si.hProcess, INFINITE);
  CloseHandle(si.hProcess);
end;


function ExecCmd(const cmd: string): boolean;
var
  pi: TProcessInformation;
  si: TStartupInfo;
begin
  FillChar(pi, SizeOf(pi), 0);
  FillChar(si, SizeOf(si), 0);
  si.cb:= SizeOf(si);
  si.dwFlags:= STARTF_USESHOWWINDOW;
  si.wShowWindow:= SW_MINIMIZE; //SW_SHOWNORMAL;

  Result:= CreateProcess(nil, PChar(cmd), nil, nil, false, 0,
    nil, nil, si, pi);
  if Result then
  begin
    WaitForSingleObject(pi.hProcess, INFINITE);
    CloseHandle(pi.hThread);
    CloseHandle(pi.hProcess);
  end;
end;


function UnZipSingle(const fn, sdir, fn_unpack: string): boolean;
var
  cmd: string;
begin
  cmd:= Format('"%s\Tools\unzip.exe" -o "%s" "%s" -d "%s"',
      [ExtractFileDir(ParamStr(0)), fn, fn_unpack, sdir]);
  //Messagebox(0, pchar(cmd), 't', 0);
  Result:= ExecCmd(cmd);
end;

function UnRarSingle(const fn, sdir, fn_unpack: string): boolean;
var
  cmd: string;
begin
  cmd:= Format('"%s\Tools\unrar.exe" x -y "%s" "%s" "%s\"',
    [ExtractFileDir(ParamStr(0)), fn, fn_unpack, sdir]);
  Result:= ExecCmd(cmd);
end;

function FUnpackSingle(const fn, sdir, fn_unpack: string): boolean;
var
  ext: string;
begin
  ext:= LowerCase(ExtractFileExt(fn));
  if ext='.zip' then Result:= UnZipSingle(fn, sdir, fn_unpack) else
   if ext='.rar' then Result:= UnRarSingle(fn, sdir, fn_unpack) else
    Result:= false;
  if Result then Sleep(200);
end;

function FUnpackAll(const fn, sdir: string): boolean;
begin
  Result:= FUnpackSingle(fn, sdir, '*.*');
end;

end.
