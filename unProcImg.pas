unit unProcImg;

interface

// fn_wdx must be full path to "Image Info" WDX plugin.
// http://totalcmd.net/plugring/wdx_image_info.html
// If other WDX used, correct also wdx_W_field/wdx_H_field .
//
function SGetImageTag(const fn, fn_wdx: string; IsCss: boolean): string;

implementation

uses
  SysUtils,
  ATxWdx,
  ATxSProc;

const
  wdx_W_field = 0;
  wdx_H_field = 1;

function SGetImageTag(const fn, fn_wdx: string; IsCss: boolean): string;
var
  fn_ini, sw, sh: string;
begin
  fn_ini:= SExpandVars('%temp%\lsplugin.ini');

  sw:= SGetWdxField(fn_wdx, fn, fn_ini, false, wdx_W_field);
  sh:= SGetWdxField(fn_wdx, fn, fn_ini, false, wdx_H_field);

  if (StrToIntDef(sw, -1)<=0) or
    (StrToIntDef(sh, -1)<=0) then
    begin Result:= ''; Exit end;

  if IsCss then
    Result:= Format('  background: url("./%s");'#13#10'  width: %spx;'#13#10'  height: %spx;'#13#10,
      [ExtractFileName(fn), sw, sh])
  else
    Result:= Format('<img src="./%s" width="%s" height="%s" alt="untitled" />',
      [ExtractFileName(fn), sw, sh]);
end;

end.