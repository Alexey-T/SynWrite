{
ImageToBmp is GIF/TIFF/JPG to PNG converter,
which uses GDI+ library (needs at last Windows XP).
Uses Delphi GDI+ wrapper (from Jedi?)
Author: A.Torgashin, uvviewsoft.com
License: MPL 1.1
}
program ImageToBmp;

uses
  SysUtils, Windows,
  GDIPAPI, GDIPOBJ, GDIPUTIL;

var
  fn_in, fn_out: string;
  encoderClsid: TGUID;
  Image: TGPImage;
begin
  if ParamCount<2 then
  begin
    MessageBox(0,
      'GIF/JPG/PNG/ICO to BMP/PNG converter using GDI+'#13 +
      '(c) UVViewSoft'#13#13 + 
      'Usage:'#13'ImageToBmp.exe <input_image_path> <output_BMP_or_PNG_path>', 
      'Image converter', 
      mb_ok or mb_iconinformation);
    Exit
  end;

  fn_in:= ParamStr(1);
  fn_out:= ParamStr(2);
  DeleteFile(PChar(fn_out));

  if not FileExists(fn_in) then
  begin
    MessageBox(0, PChar(Format('Input file not found:'#13'"%s"', [fn_in])), 'Image converter', mb_ok or mb_iconerror);
    Exit
  end;

  Image:= TGPImage.Create(fn_in);
  
  if LowerCase(ExtractFileExt(fn_out))='.bmp' then
    GetEncoderClsid('image/bmp', encoderClsid)
  else  
    GetEncoderClsid('image/png', encoderClsid);
  
  image.Save(fn_out, encoderClsid, nil);
  image.Free;
end.
