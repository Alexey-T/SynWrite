unit ATxImgHint;

interface

uses
  Windows, Classes, Graphics, Controls;

type
  TGraphicHintWindow = class(THintWindow)
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  private
    FActivating: Boolean;
    FBmp: TBitmap;
    FSizeX, FSizeY: Integer;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
  protected
    procedure Paint; override;
  published
    property Caption;
  end;

type
  TColorHintWindow = class(THintWindow)
  private
    FActivating: Boolean;
  public
    procedure ActivateHint(Rect: TRect; const AHint: string); override;
  protected
    procedure Paint; override;
  published
    property Caption;
  end;

var
  FileNameConverterImageToBmp: string;

implementation

uses
  SysUtils, Forms, Types,
  Math,
  ATxSProc, ATxFProc,
  ATxColorCodes,
  unProc,
  TBXGraphics;

const
  cGap = 4; //hint border width
  cCaptionSize = 12; //hint caption height (for image sizes text)
  cMinHintWidth = 130;
  cMinHintHeight = 50;
  cImgRatio = 4/3;
  cMaxImgWidth = 330;
  cMaxImgHeight = Trunc(cMaxImgWidth/cImgRatio);
const
  cColorTextH = 15;
  cColorW = 130;
  cColorH = 20;

constructor TGraphicHintWindow.Create(AOwner: TComponent);
begin
  inherited;
  FBmp:= TBitmap.Create;
  FBmp.PixelFormat:= pf24bit;
end;

destructor TGraphicHintWindow.Destroy;
begin
  FreeAndNil(FBmp);
  inherited;
end;

procedure TGraphicHintWindow.Paint;
var
  R: TRect;
begin
  with Canvas do
  begin
    Brush.Style:= bsClear;
    Font.Name:= 'Tahoma';
    Font.Size:= 8;
    Font.Color:= clBlack;
    Font.Style:= [];
  end;

  if not FileExists(Caption) then
  begin
    Canvas.TextOut(cGap, cGap, ExtractFileName(Caption));
    Canvas.TextOut(cGap, cGap + Canvas.Font.Size + 16, '???');
    Exit
  end;

  R:= ClientRect;
  if FBmp.Width>0 then
  begin
    Canvas.TextOut(cGap, cGap div 2, Format('%dx%d', [FSizeX, FSizeY]));
    Canvas.Draw((R.Right-FBmp.Width) div 2, cGap+cCaptionSize, FBmp);
  end;
end;

type
  TPngBitmapCracker = class(TPngBitmap);

procedure LoadPngToBitmap(b: TBitmap; const fn: string);
var
  b_png: TPngBitmap;
begin
  b_png:= TPngBitmap.Create;
  try
    b_png.LoadFromFile(fn);
    b.Width:= b_png.Width;
    b.Height:= b_png.Height;
    b.Canvas.Brush.Color:= clInfoBk;
    b.Canvas.FillRect(Types.Rect(0, 0, b.Width, b.Height));
    TPngBitmapCracker(b_png).Draw(b.Canvas, Types.Rect(0, 0, b.Width, b.Height));
  finally
    FreeAndNil(b_png);
  end;    
end;

procedure TGraphicHintWindow.ActivateHint(Rect: TRect; const AHint: string);
var
  fn_png, cmdline: string;
  b: TBitmap;
  pt: TPoint;
begin
  FActivating:= true;
  Caption:= AHint;
  FBmp.Width:= 0;
  FBmp.Height:= 0;
  FSizeX:= 0;
  FSizeY:= 0;
  b:= TBitmap.Create;

  if FileNameConverterImageToBmp='' then
  begin
    MessageBox(0, 'ImageToBmp converter path not set', 'Image preview', mb_ok or mb_iconerror);
    Exit
  end;

  try
    if FileExists(Caption) then
    begin
      //special load of bmp
      if SFileExtensionMatch(Caption, 'bmp') then
      begin
        b.LoadFromFile(Caption);
      end
      //special load of png
      else
      if SFileExtensionMatch(Caption, 'png') then
      begin
        LoadPngToBitmap(b, Caption);
      end
      else
      //load others using converter
      try
        Screen.Cursor:= crHourGlass;
        fn_png:= SExpandVars('%temp%\SynwPreview.png');
        cmdline:= Format('"%s" "%s" "%s"', [FileNameConverterImageToBmp, Caption, fn_png]);
        if FExecProcess(cmdline, SExpandVars('%temp%'), sw_hide, true{Wait}) = exOk then
          if FileExists(fn_png) then
          begin
            LoadPngToBitmap(b, fn_png);
            FDelete(fn_png);
          end
          else
            MessageBeep(mb_iconerror);
      finally
        Screen.Cursor:= crDefault;
      end;

      FSizeX:= b.Width;
      FSizeY:= b.Height;
      if (b.Width <= cMaxImgWidth) and (b.Height <= cMaxImgHeight) then
        FBmp.Assign(b)
      else
      begin
        if (b.Width / b.Height) >= cImgRatio then
        begin
          //zoom by width
          FBmp.Width:= cMaxImgWidth;
          FBmp.Height:= Trunc(b.Height / (b.Width/cMaxImgWidth));
        end
        else
        begin
          //zoom by height
          FBmp.Height:= cMaxImgHeight;
          FBmp.Width:= Trunc(b.Width / (b.Height/cMaxImgHeight));
        end;

        //This gives not smooth picture:
        //FBmp.Canvas.StretchDraw(Types.Rect(0, 0, FBmp.Width, FBmp.Height), b);
        //
        GetBrushOrgEx(FBmp.Canvas.Handle, pt);
        SetStretchBltMode(FBmp.Canvas.Handle, HALFTONE);
        SetBrushOrgEx(FBmp.Canvas.Handle, pt.x, pt.y, @pt);
        StretchBlt(
          FBmp.Canvas.Handle,
          0, 0, FBmp.Width-1, FBmp.Height-1,
          b.Canvas.Handle,
          0, 0, b.Width, b.Height,
          SRCCOPY);
      end;

      Rect.Right:= Rect.Left + FBmp.Width + cGap*2;
      Rect.Bottom:= Rect.Top + FBmp.Height + cGap*2 + cCaptionSize;
    end
    else
    begin
      Rect.Right:= Rect.Left + cGap*2 + cMaxImgWidth;
      Rect.Bottom:= Rect.Top + cGap*2 + cCaptionSize;
    end;

    if Rect.Right < Rect.Left + cMinHintWidth then
      Rect.Right:= Rect.Left + cMinHintWidth;
    if Rect.Bottom < Rect.Top + cMinHintHeight then
      Rect.Bottom:= Rect.Top + cMinHintHeight;
    UpdateBoundsRect(Rect);

    if Rect.Top + Height > Screen.DesktopHeight then
      Rect.Top:= Screen.DesktopHeight - Height;
    if Rect.Left + Width > Screen.DesktopWidth then
      Rect.Left:= Screen.DesktopWidth - Width;
    if Rect.Left < Screen.DesktopLeft then
      Rect.Left:= Screen.DesktopLeft;
    if Rect.Bottom < Screen.DesktopTop then
      Rect.Bottom:= Screen.DesktopTop;
    SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height,
      SWP_SHOWWINDOW or SWP_NOACTIVATE);
    Invalidate;
  finally
    FreeAndNil(b);
    FActivating:= false;
  end;
end;

{ TColorHintWindow }

procedure TColorHintWindow.ActivateHint(Rect: TRect; const AHint: string);
begin
  FActivating:= true;
  Caption:= AHint;

  Rect.Right:= Rect.Left + cGap*2+cColorW + 2;
  Rect.Bottom:= Rect.Top + cGap*2+cColorH+cColorTextH + IfThen(Pos(',', AHint)>0, cColorH+cColorTextH);
  UpdateBoundsRect(Rect);

  if Rect.Top + Height > Screen.DesktopHeight then
    Rect.Top:= Screen.DesktopHeight - Height;
  if Rect.Left + Width > Screen.DesktopWidth then
    Rect.Left:= Screen.DesktopWidth - Width;
  if Rect.Left < Screen.DesktopLeft then
    Rect.Left:= Screen.DesktopLeft;
  if Rect.Bottom < Screen.DesktopTop then
    Rect.Bottom:= Screen.DesktopTop;
  SetWindowPos(Handle, HWND_TOPMOST, Rect.Left, Rect.Top, Width, Height,
    SWP_SHOWWINDOW or SWP_NOACTIVATE);
  Invalidate;

  FActivating:= false;
end;

procedure TColorHintWindow.Paint;
  //
  procedure ColorRect(Top: Integer; NColor: TColor);
  var
    R: TRect;
    S: string;
    i: Integer;
  begin
    S:= Color2Str(NColor);
    for i:= Low(cColorCodes) to High(cColorCodes) do
      if cColorCodes[i].sVal=S then
      begin
        S:= S+ ' ('+cColorCodes[i].sName+')';
        Break
      end;

    Canvas.Brush.Color:= Color;
    Canvas.TextOut(cGap, Top, S);

    if NColor=clNone then
    begin
      Canvas.TextOut(cGap, Top+cColorTextH, '???');
      Exit
    end;

    R:= Rect(cGap, Top+cColorTextH, cGap+cColorW, Top+cColorTextH+cColorH);
    Canvas.Brush.Color:= NColor;
    Canvas.FillRect(R);
    Canvas.Pen.Color:= clBlack;
    Canvas.Rectangle(R);
  end;
  //
var
  N1, N2: TColor;
  S, S1, S2: Widestring;
begin
  S:= Caption;
  SDeleteToW(S, '}'); //delete '{color}'
  S1:= SGetItem(S);
  S2:= SGetItem(S);

  N1:= StrToIntDef(S1, clNone);
  N2:= StrToIntDef(S2, clNone);

  with Canvas do
  begin
    Brush.Style:= bsClear;
    Font.Name:= 'Tahoma';
    Font.Size:= 8;
    Font.Color:= clBlack;
    Font.Style:= [];
  end;

  ColorRect(cGap, N1);
  ColorRect(cGap+cColorTextH+cColorH, N2);
end;

end.
