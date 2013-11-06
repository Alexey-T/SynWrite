unit unProcImg;

interface

// fn_wdx must be full path to "Image Info" WDX plugin.
// http://totalcmd.net/plugring/wdx_image_info.html
// If other WDX used, correct also wdx_W_field/wdx_H_field .
//
function SGetImageTag(const fn_image, fn_wdx, dir: string; IsCss: boolean; const Eol: string): string;

implementation

uses
  SysUtils,
  ATxWdx,
  ATxSProc;

const
  //constants for WDX plugin: indexes of Width and Height fields
  wdx_W_field = 0;
  wdx_H_field = 1;

function SGetImageTag(const fn_image, fn_wdx, dir: string;
  IsCss: boolean; const Eol: string): string;
var
  fn_ini, fn_dir, fn_insert,
  str_width, str_height: string;
begin
  Result:= '';

  fn_ini:= FTempDir + '\lsplugin.ini';
  str_width:= SGetWdxField(fn_wdx, fn_image, fn_ini, false, wdx_W_field);
  str_height:= SGetWdxField(fn_wdx, fn_image, fn_ini, false, wdx_H_field);
  if StrToIntDef(str_width, 0)<=0 then Exit;
  if StrToIntDef(str_height, 0)<=0 then Exit;

  fn_dir:= ''; //relative folder path to image
  if (dir<>'') and (Pos(UpperCase(dir+'\'), UpperCase(fn_image))=1) then
  begin
    fn_dir:= ExtractFilePath(Copy(fn_image, Length(dir)+2, MaxInt));
    SReplaceAll(fn_dir, '\', '/');
  end;
  fn_insert:= fn_dir + ExtractFileName(fn_image);

  if IsCss then
    Result:= Format('  background: url("%s");' + Eol + '  width: %spx;' + Eol + '  height: %spx;' + Eol,
      [fn_insert, str_width, str_height])
  else
    Result:= Format('<img src="%s" width="%s" height="%s" alt="untitled" />',
      [fn_insert, str_width, str_height]);
end;

end.