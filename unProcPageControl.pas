//deprecated, not used now

type
  TTntPageControl = class(TntComCtrls.TTntPageControl)
  protected
    procedure AdjustClientRect(var Rect: TRect); override;
    procedure WMNCHitTest(var Message: TWMNCHitTest); message WM_NCHITTEST; //URL below
    procedure CNDrawitem(var Message: TWMDrawItem); message CN_DRAWITEM; //URL below
  end;

procedure TTntPageControl.AdjustClientRect(var Rect: TRect);
begin
  Rect:= DisplayRect;
  Rect:= Types.Rect(Rect.Left-4, Rect.Top-4, Rect.Right+4, Rect.Bottom+4);
end;

procedure TTntPageControl.WMNCHitTest(var Message: TWMNCHitTest);
// http://stackoverflow.com/questions/14283304/delphi-how-to-handle-click-on-pagecontrols-empty-space
begin
  inherited;
  if Message.Result = HTTRANSPARENT then
    Message.Result := HTCLIENT;
end;

procedure TTntPageControl.CNDrawitem(var Message: TWMDrawItem);
// http://stackoverflow.com/questions/18282728/make-owner-drawn-tpagecontrol-tabs-look-nicer-like-without-owner-draw
var
  Rgn: HRgn;
begin
  //we don't want to get clipped in the passed rectangle
  SelectClipRgn(Message.DrawItemStruct.hDC, 0);

  //we want to clip the DC so that the borders to be drawn are out of region
  Rgn:= CreateRectRgn(0, 0, 0, 0);
  SelectClipRgn(Message.DrawItemStruct.hDC, Rgn);
  DeleteObject(Rgn);

  Message.Result:= 1;
  inherited;

  if Assigned(OnDrawTab) then
    OnDrawTab(Self,
      Message.DrawItemStruct.itemID,
      Message.DrawItemStruct.rcItem,
      Bool(Message.DrawItemStruct.itemState and ODS_FOCUS)
      );
end;

