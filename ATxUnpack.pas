unit ATxUnpack;

interface

function FUnpackAll(const fn, sdir: string; asAdmin: boolean): boolean;
function FUnpackSingle(const fn, sdir, fn_unpack: string; asAdmin: boolean): boolean;

implementation

uses 
  SysUtils, 
  Windows,
  ShellAPI;

function ExecShell(const cmd, params: string; asAdmin: boolean): boolean;
const
  cRunas = 'runas';
  cOpen = 'open';
var
  si: TShellExecuteInfo;
begin
  FillChar(si, SizeOf(si), 0);
  si.cbSize:= SizeOf(si);

  if asAdmin then
  begin
    //Vista? then "runas"
    if Win32MajorVersion >= 6 then
      si.lpVerb:= cRunas
    else
      si.lpVerb:= cOpen;
  end    
  else
    si.lpVerb:= cOpen;

  si.fMask:= SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  si.lpFile:= PChar(cmd);
  si.lpParameters:= PChar(params);
  si.nShow:= SW_MINIMIZE;
  
  Result:= ShellExecuteEx(@si);
  if Result then
    WaitForSingleObject(si.hProcess, INFINITE);
  CloseHandle(si.hProcess);
end;


function UnZipSingle(const fn, sdir, fn_unpack: string; asAdmin: boolean): boolean;
var
  cmd,
  params: string;
begin
  cmd:= Format('%s\Tools\unzip.exe', [ExtractFileDir(ParamStr(0))]);
  params:= Format('-o "%s" "%s" -d "%s"', [fn, fn_unpack, sdir]);
  //Messagebox(0, pchar(cmd), 't', 0);
  Result:= ExecShell(cmd, params, asAdmin);
end;

function UnRarSingle(const fn, sdir, fn_unpack: string; asAdmin: boolean): boolean;
var
  cmd, params: string;
begin
  cmd:= Format('%s\Tools\unrar.exe', [ExtractFileDir(ParamStr(0))]);
  params:= Format('x -y "%s" "%s" "%s\"', [fn, fn_unpack, sdir]);
  Result:= ExecShell(cmd, params, asAdmin);
end;

function FUnpackSingle(const fn, sdir, fn_unpack: string; asAdmin: boolean): boolean;
var
  ext: string;
begin
  ext:= LowerCase(ExtractFileExt(fn));
  if ext='.zip' then Result:= UnZipSingle(fn, sdir, fn_unpack, asAdmin) else
   if ext='.rar' then Result:= UnRarSingle(fn, sdir, fn_unpack, asAdmin) else
    Result:= false;
  if Result then Sleep(200);
end;

function FUnpackAll(const fn, sdir: string; asAdmin: boolean): boolean;
begin
  Result:= FUnpackSingle(fn, sdir, '*.*', asAdmin);
end;

end.
