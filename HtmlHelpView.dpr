program HtmlHelpView;

{$R WindowsXP.res}

uses Windows, SysUtils, HHelp;
const
  cc =
    'HtmlHelpView (c) UVViewSoft'#13#13+
    'Usage:'#13+
    'HtmlHelpView.exe "<CHM file name>" "<Help topic string>"'#13;
var
  fn: string;
  h: HWND;
begin
  if ParamCount<2 then
  begin
    MessageBox(0, cc, 'HtmlHelpView', mb_ok or mb_iconinformation);
    Exit;
  end;

  fn:= ParamStr(1);
  if not FileExists(fn) then
  begin
    MessageBox(0, PChar('CHM file not found:'#13+fn), 'HtmlHelpView', mb_ok or mb_iconerror);
    Exit;
  end;

  h:= ViewHelp(0, fn, ParamStr(2));
  while IsWindow(h) do
    Sleep(1000);
end.