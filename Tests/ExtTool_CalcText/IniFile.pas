unit IniFile;

interface

uses Windows;

var
  IniFilename: string = '';

procedure DelIniKey(const section, key: string);
procedure SetIniKey(const section, key, value: string); overload;
procedure SetIniKey(const section, key: string; value: integer); overload;
procedure SetIniKey(const section, key, value: string; const fnIni: string); overload;

function GetIniKey(const section, key, default: string): string; overload;
function GetIniKey(const section, key: string; default: integer): integer; overload;
function GetIniKey(const section, key, default: string; const fnIni: string): string; overload;


implementation

uses
  SysUtils;

procedure DelIniKey(const section, key: string);
begin
  WritePrivateProfileString(PChar(section), PChar(key), nil, PChar(IniFilename));
end;

procedure SetIniKey(const section, key, value: string);
begin
  WritePrivateProfileString(PChar(section), PChar(key), PChar(value), PChar(IniFilename));
end;

procedure SetIniKey(const section, key: string; value: integer);
begin
  WritePrivateProfileString(PChar(section), PChar(key), PChar(IntToStr(value)), PChar(IniFilename));
end;

procedure SetIniKey(const section, key, value: string; const fnIni: string); overload;
begin
  WritePrivateProfileString(PChar(section), PChar(key), PChar(value), PChar(fnIni));
end;


function GetIniKey(const section, key, default: string; const fnIni: string): string;
var
  buf: array[0..2*1024-1] of char;
begin
  Result:= '';
  if (section='') or (key='') then Exit;

  FillChar(buf, SizeOf(buf), 0);
  GetPrivateProfileString(PChar(section), PChar(key), PChar(default),
    buf, SizeOf(buf), PChar(fnIni));
  Result:= buf;
end;

function GetIniKey(const section, key, default: string): string;
begin
  Result:= GetIniKey(section, key, default, IniFilename);
end;

function GetIniKey(const section, key: string; default: integer): integer;
begin
  Result:= StrToIntDef(GetIniKey(section, key, IntToStr(default)), 0);
end;


end.
