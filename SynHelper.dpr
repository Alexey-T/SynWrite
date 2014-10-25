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

procedure DoRestart(h: THandle);
var
  cmd: string;
begin
  if not IsWindow(h) then
    begin Msg('Cannot find SynWrite window'); Exit end;

  cmd:= ExtractFilePath(ParamStr(0))+'Syn.exe';
  if not FileExists(cmd) then
    begin Msg('File not found: Syn.exe'); Exit end;

  while IsWindow(h) do
    Sleep(cSleepStep);
  Sleep(cSleepAfterClose);

  WinExec(PChar(cmd), sw_show);
end;  

begin
  if ParamCount<1 then
    begin Msg('Parameter needed'); Exit end;

  if ParamStr(1)='restart' then
    DoRestart(StrToInt(ParamStr(2)))
  else
    Msg('Unknown param: '+ParamStr(1));
end.
