program SynHelper;
uses
  Windows, SysUtils;

procedure Msg(const s: string);
begin
  MessageBox(0, PChar(s), 'SynHelper', mb_ok or mb_iconerror);
end;

const
  cSleepStep = 300;
  cSleepAfterClose = 200;
var
  h: THandle;
  cmd: string;
begin
  if ParamCount<1 then
    begin Msg('Parameter needed'); Exit end;

  h:= StrToInt(ParamStr(1));
  if not IsWindow(h) then
    begin Msg('Cannot find SynWrite window'); Exit end;

  cmd:= ExtractFilePath(ParamStr(0))+'Syn.exe';
  if not FileExists(cmd) then
    begin Msg('File not found: Syn.exe'); Exit end;

  while IsWindow(h) do
    Sleep(cSleepStep);
  Sleep(cSleepAfterClose);

  WinExec(PChar(cmd), sw_show);
end.
