{///////////////////////////////////////////////////////////////////////////////
  Syn
  Popup hints without shadow
  (WinXP shadow has bug when hint disappears on taskbar)
///////////////////////////////////////////////////////////////////////////////}

unit unHints;

interface
uses
  Windows, SysUtils, Controls, Forms, Classes, Graphics, Messages;

type
  TNonShadowedHintWindow = class(THintWindow)
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure NCPaint(DC: HDC); override;
  end;

implementation

procedure TNonShadowedHintWindow.CreateParams(var Params: TCreateParams);
const CS_DROPSHADOW = $00020000;
begin
  inherited;
  { Disable drop shadow effect on Windows XP and later }
  if (Win32Platform = VER_PLATFORM_WIN32_NT) and
     ((Win32MajorVersion > 5) or
      ((Win32MajorVersion = 5) and (Win32MinorVersion >= 1))) then
    Params.WindowClass.Style := Params.WindowClass.Style and not CS_DROPSHADOW;
end;

procedure TNonShadowedHintWindow.NCPaint(DC: HDC);
var R: TRect; BC: TColor;
begin
  R := Rect(0, 0, Width, Height);
  BC := Brush.Color;
  Brush.Color := clBlack;
  Windows.FrameRect(DC, R, Brush.Handle);
  Brush.Color := BC;
end;

initialization
  HintWindowClass := TNonShadowedHintWindow;

end.