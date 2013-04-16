unit ATxIconProc;

interface

uses
  Windows,
  Graphics,
  Controls,
  TbxGraphics,
  PngImage;

procedure FixImageList32Bit(ImageList: TImageList);
procedure GetIcon(const FileName: Widestring;
  ResultImageList: TImageList);

//load from BMP 32bpp
procedure LoadImageListFromFile(IL: TImageList; SizeX, SizeY: integer; const fn: string);
//load from PNG
procedure LoadTbxImageListFromFile(IL: TTbxImageList; SizeX, SizeY: integer; const fn: string);
//load from DLL
procedure LoadImageListFromDLL(ImageList16, ImageList32: TImageList; const FN: Widestring);
//load/add 1 icon from PNG
procedure AddPngToTbxImageList(IL: TTbxImageList; const fn: string);
//save to PNG
procedure SaveImageListToFile(Img: TImageList; const fn: string);

//load 1 icon from DLL to BMP
procedure LoadIconFromDllToBmp(const FN: Widestring;
  AIndex: integer; ASmallIcon: boolean; Bmp: TBitmap);
//convert Bitmap 32bpp -> PngObject
function Bmp32ToPng(bmp: TBitmap): TPngObject;
//save 1 icon from DLL to PNG file
procedure SaveIconFromDllToPng(const fn_dll: string; AIndex: integer;
  ASmallIcon: boolean; const fn_png: string);

implementation

uses
  SysUtils,
  ShellApi,
  Classes,
  CommCtrl,
  ComObj, ActiveX, ShlObj, //for GetIcon
  Dialogs,
  Types,
  ImgList,
  TbxImgListEdit;


procedure LoadTbxImageListFromFile(IL: TTbxImageList; SizeX, SizeY: integer; const fn: string);
var
  i: integer;
  dlg: TTBXImageListDlg;
  DibList: TDibList32;
begin
  IL.Width:= SizeX;
  IL.Height:= SizeY;
  IL.Clear;
  DibList:= TDibList32.Create(SizeX, SizeY);
  dlg:= TTBXImageListDlg.Create;
  try
    dlg.DIBList:= DibList;
    dlg.AddImagesFromFile(fn);
    for i:= 0 to dlg.DIBList.Count-1 do
      IL.Add(dlg.DIBList.GetImage(i));
  finally
    FreeAndNil(dlg);
    FreeAndNil(DibList);
  end;  
end;


procedure LoadImageListFromFile(IL: TImageList; SizeX, SizeY: integer;
  const fn: string);
var
  b: TBitmap;
begin
  b:= TBitmap.Create;
  try
    try
      b.LoadFromFile(FN);
    except
      Exit;
    end;

    with IL do
    begin
      Clear;
      Width := SizeX;
      Height := SizeY;
      AddMasked(b, b.Canvas.Pixels[0, SizeY - 1]);
    end;
  finally
    b.Free;
  end;
end;

//----------
function IsBmpEmpty(b: TBitmap): boolean;
var i, j: Integer;
  c: TColor;
begin
  c:= b.Canvas.Pixels[0, 0];
  for i:= 0 to b.Width-1 do
    for j:= 0 to b.Height-1 do
      if b.Canvas.Pixels[i, j]<>c then
        begin Result:= false; Exit end;
  Result:= true;
end;

//workaround for:
//icon "folder" from shell32.dll is converted to PNG ok,
//but icon 0 from shell32.dll converted to bad (visual empty) PNG
function Bmp32ToPngEx(bmp: TBitmap): TPngObject;
var
  b: TBitmap;
begin
  Result:= Bmp32ToPng(bmp);

  b:= TBitmap.Create;
  try
    //if icon doesn't draw OK in 24bpp bitmap,
    //consider it empty
    b.PixelFormat:= pf24bit;
    b.Assign(Result);
    if IsBmpEmpty(b) then
    begin
      //showmessage('bbb');
      FreeAndNil(Result);
      Result:= TPngObject.Create;
      bmp.PixelFormat:= pf24bit;
      bmp.Transparent:= true;
      Result.Assign(bmp);
    end;
  finally
    FreeAndNil(b);
  end;
end;

function Bmp32ToPng(bmp: TBitmap): TPngObject;
var
  x, y: integer;
  src, dst: PngImage.pByteArray;
begin
  Result:= nil;
  if bmp.PixelFormat<>pf32bit then
    Exit;
    {
    это если раскомментить (вместо Exit)- не работает, дает прозрачную пустую png
  if bmp.PixelFormat<>pf32bit then
  begin
    Result:= TPngObject.CreateBlank(COLOR_RGB, 8, bmp.Width, bmp.Height);
    Result.Canvas.Draw(0, 0, bmp);
    Exit;
  end;
  }

  Result:= TPngObject.CreateBlank(COLOR_RGBALPHA, 8, bmp.Width, bmp.Height);
  Result.Canvas.Draw(0, 0, bmp);
  for y:= 0 to bmp.Height-1 do begin
    src:= bmp.ScanLine[y];
    dst:= Result.AlphaScanLine[y];
    for x:= 0 to bmp.Width-1 do
      dst[x]:= src[x*4+3];
  end;
end;

//----------------
procedure LoadImageListFromDLL(ImageList16, ImageList32: TImageList; const FN: Widestring);
var
  Ico1, Ico2: TIcon;
  hIco1, hIco2: array of hIcon;
  h: hIcon;
  n, i: Integer;
begin
  ImageList16.Handle:= ImageList_Create(16, 16, ILC_COLOR32 or ILC_MASK, 0, 50);
  ImageList32.Handle:= ImageList_Create(32, 32, ILC_COLOR32 or ILC_MASK, 0, 50);

  Ico1:= TIcon.Create;
  Ico2:= TIcon.Create;
  
 try
  h:= 0;
  n:= ExtractIconExW(PWChar(FN), -1, h, h, 1);
  if n=0 then Exit;
  SetLength(hIco1, n);
  SetLength(hIco2, n);

  ExtractIconExW(PWChar(FN), 0, hIco2[0], hIco1[0], n);
  for i:= 0 to n-1 do
  begin
    Ico1.Handle:= hIco1[i];
    Ico2.Handle:= hIco2[i];
    ImageList16.AddIcon(Ico1);
    ImageList32.AddIcon(Ico2);
    DestroyIcon(hIco1[i]);
    DestroyIcon(hIco2[i]);
    hIco1[i]:= 0;
    hIco2[i]:= 0;
  end;
 finally
  FreeAndNil(Ico1);
  FreeAndNil(Ico2);
 end;
end;

//------------
procedure SaveImageListToFile(Img: TImageList; const fn: string);
var
  b: TBitmap;
  bb: TPngObject;
  i:Integer;
begin
  b:= TBitmap.Create;
  bb:= TPngObject.Create;
  b.PixelFormat:= pf32bit;
  //b.Transparent:= true;
  b.Height:= Img.Height;
  b.Width:= Img.Width * 12{Img.Count};
  b.Canvas.Brush.Color:= Low(TColor);
  b.Canvas.FillRect(Rect(0, 0, b.Width, b.Height));
  for i:= 0 to Img.Count-1 do
//    Img.Draw(b.Canvas, i*Img.Width, 0, i);
    img.Draw(b.Canvas, i*Img.Width, 0, i, dsTransparent, itImage);

  bb.Assign(b);
  bb.SaveToFile(fn);

  FreeAndNil(bb);
  FreeAndNil(b);
end;

//------------
procedure AddPngToTbxImageList(IL: TTbxImageList; const fn: string);
  procedure AddNone;
  var
    S: string;
    bmp: TBitmap;
  begin
    S:= IntToStr(IL.Count);
    bmp:= TBitmap.Create;
    try
      bmp.Width:= IL.Width;
      bmp.Height:= IL.Height;
      bmp.Canvas.Brush.Color:= clBtnFace;
      bmp.Canvas.FillRect(Rect(0, 0, bmp.Width-1, bmp.Height-1));
      bmp.Canvas.Font.Name:= 'Tahoma';
      bmp.Canvas.Font.Size:= 9;
      bmp.Canvas.Font.Color:= clWindowText;
      bmp.Canvas.TextOut((bmp.Width - bmp.Canvas.TextWidth(S)) div 2, 2, S);
      IL.AddMasked(bmp, clNone);
    finally
      FreeAndNil(bmp);
    end;
  end;
var
  png: TPngBitmap;
begin
  png:= TPngBitmap.Create;
  try
    try
      png.LoadFromFile(fn);
      IL.Add(png.DIB);
    finally
      FreeAndNil(png);
    end;
  except
    AddNone;
  end;
end;

//------------
procedure SaveIconFromDllToPng(const fn_dll: string; AIndex: integer;
  ASmallIcon: boolean; const fn_png: string);
var
  png: TPngObject;
  bmp: TBitmap;
begin
  DeleteFile(fn_png);

  bmp:= TBitmap.Create;
  try
    LoadIconFromDllToBmp(fn_dll, AIndex, ASmallIcon, bmp);
    png:= Bmp32ToPngEx(bmp);
    if png<>nil then
    try
      png.SaveToFile(fn_png);
    finally
      FreeAndNil(png);
    end;
  finally
    FreeAndNil(bmp);
  end;
end;

//----------
procedure LoadIconFromDllToBmp(const FN: Widestring;
  AIndex: integer; ASmallIcon: boolean; Bmp: TBitmap);
var
  hIco1, hIco2: hIcon;
  piconinfo: TIconInfo;
begin
  ExtractIconExW(PWChar(FN), AIndex, hIco2, hIco1, 1);

  if ASmallIcon then
    GetIconInfo(hIco1, piconinfo)
  else
    GetIconInfo(hIco2, piconinfo);
  try
    Bmp.Handle:= piconinfo.hbmColor;
    Bmp.PixelFormat:= pf32bit;
  finally
    DeleteObject(piconinfo.hbmMask);
    DeleteObject(piconinfo.hbmColor);
  end;

  DestroyIcon(hIco1);
  DestroyIcon(hIco2);
end;

procedure FixImageList32Bit(ImageList: TImageList);
const
  Mask: array[Boolean] of Longint = (0, ILC_MASK);
var
  TempList: TImageList;
begin
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and Assigned(ImageList) then
  begin
    TempList := TImageList.Create(nil);
    try
      TempList.Assign(ImageList);
      with ImageList do
      begin
        Handle := ImageList_Create(Width, Height, ILC_COLOR32 or Mask[Masked],
          0, AllocBy);
        if not HandleAllocated then
          raise EInvalidOperation.Create('Bad Image list');
      end;

      Imagelist.AddImages(TempList);
    finally
      FreeAndNil(TempList);
    end;
  end;
end;

{ **** UBPFD *********** by delphibase.endimus.com ****
>> Получение системной иконки, ассоциированной с файлом в данной системе
Функция позволяет получить такую же иконку любой директории или любого файла,
какую вы видите в "проводнике". Размеры - 16 * 16 (по умолчанию) или 32 * 32
(второй параметр - itLarge)
Зависимости: Юниты VCL + ComObj, ActiveX, ShellApi, ShlObj;
Автор:       Дмитрий Баранов, kda@pisem.net, Москва
***************************************************** }
type
	TIconType = (itSmall, itLarge);

procedure GetIcon(const FileName: Widestring;
  ResultImageList: TImageList);
var
  FileInfo: TShFileInfoW;
  ImageList: TImageList;
  IT: DWORD;
begin
  // CoInitialize; лучше - поместите вызов этой ф. в раздел initialization
  IT := SHGFI_SMALLICON;
  ImageList := TImageList.Create(nil);
  {if (IconType = itLarge) then
  begin
   IT := SHGFI_LARGEICON;
   ImageList.Height := 32;
   ImageList.Width := 32;
  end;}
  FillChar(FileInfo, Sizeof(FileInfo), #0);
  ImageList.ShareImages := true;
  ImageList.Handle := SHGetFileInfoW(
     PAnsiChar{bug in D7 ShellAPI}(PWideChar(FileName)),
     SFGAO_SHARE,
     FileInfo,
     sizeof(FileInfo),
     IT or SHGFI_SYSICONINDEX
     );
  ResultImageList.AddImage(ImageList, FileInfo.iIcon);
  FreeAndNil(ImageList);
end;

//------------
initialization
  CoInitialize(nil);

finalization
  CoUninitialize;

end.
