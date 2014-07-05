{
ATGroups - several page-controls, each based on ATTabs
Copyright (c) Alexey Torgashin
License: MPL 2.0
}

{$ifdef FPC}
  {$mode delphi}
{$else}
  {$define SP} //Allow using SpTBXLib
{$endif}

unit ATGroups;

interface

uses
  Classes, Forms, Types, Controls, Graphics,
  ExtCtrls, Menus,
  {$ifdef SP}
  SpTbxDkPanels, SpTbxItem,
  {$endif}
  ATTabs;

type
  TMySplitter = {$ifdef SP}TSpTbxSplitter{$else}TSplitter{$endif};

type
  TATPages = class(TPanel)
  private
    FTabs: TATTabs;
    FOnTabFocus: TNotifyEvent;
    FOnTabClose: TATTabCloseEvent;
    FOnTabAdd: TNotifyEvent;
    FOnTabEmpty: TNotifyEvent;
    procedure SetOnTabClose(AEvent: TATTabCloseEvent);
    procedure SetOnTabAdd(AEvent: TNotifyEvent);
    procedure TabClick(Sender: TObject);
    procedure TabDrawBefore(Sender: TObject;
      AType: TATTabElemType; ATabIndex: Integer;
      C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
    procedure TabEmpty(Sender: TObject);
  public
    constructor Create(AOwner: TComponent); override;
    procedure AddTab(AControl: TControl; const ACaption: Widestring;
      AColor: TColor = clNone);
    property Tabs: TATTabs read FTabs;
    property OnTabFocus: TNotifyEvent read FOnTabFocus write FOnTabFocus;
    property OnTabClose: TATTabCloseEvent read FOnTabClose write SetOnTabClose;
    property OnTabAdd: TNotifyEvent read FOnTabAdd write SetOnTabAdd;
    property OnTabEmpty: TNotifyEvent read FOnTabEmpty write FOnTabEmpty;
  end;

type
  TATTabsColorId = (
    tabColorActive,
    tabColorPassive,
    tabColorPassiveOver,
    tabColorFont,
    tabColorBorderActive,
    tabColorBorderPassive
    );

type
  TATGroupsMode = (
    gmNone,
    gmOne,
    gm2Horz,
    gm2Vert,
    gm3Horz,
    gm3Vert,
    gm4Horz,
    gm4Vert,
    gm4Grid,
    gm6Grid
    );

const
  cModesGroupsCount: array[TATGroupsMode] of Integer = (
    1,
    1,
    2,
    2,
    3,
    3,
    4,
    4,
    4,
    6
    );

type
  TATGroupsNums = 1..6;

type
  TATGroups = class(TPanel)
  private
    FSplit1,
    FSplit2,
    FSplit3,
    FSplit4,
    FSplit5: TMySplitter;
    FPanel1,
    FPanel2: TPanel;
    FPos1,
    FPos2,
    FPos3,
    FPos4,
    FPos5: Real;
    FSplitPopup: {$ifdef SP} TSpTbxPopupMenu {$else} TPopupMenu {$endif};
    FMode: TATGroupsMode;
    FOnTabPopup: TNotifyEvent;
    FOnTabFocus: TNotifyEvent;
    FOnTabClose: TATTabCloseEvent;
    FOnTabAdd: TNotifyEvent;
    FPopupPages: TATPages;
    FPopupTabIndex: Integer;
    procedure TabFocus(Sender: TObject);
    procedure TabEmpty(Sender: TObject);
    procedure TabPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
    procedure TabClose(Sender: TObject; ATabIndex: Integer; var ACanClose: boolean);
    procedure TabAdd(Sender: TObject);
    procedure SetMode(Value: TATGroupsMode);
    procedure SetSplitPercent(N: Integer);
    procedure Split1Moved(Sender: TObject);
    procedure Split2Moved(Sender: TObject);
    procedure Split3Moved(Sender: TObject);
    procedure Split4Moved(Sender: TObject);
    procedure Split5Moved(Sender: TObject);
    procedure SplitClick(Sender: TObject);
    procedure SaveSplitPos;
    procedure RestoreSplitPos;
    procedure InitSplitterPopup;
    procedure MoveTabsOnModeChanging(Value: TATGroupsMode);
  protected
    procedure Resize; override;
  public
    Pages1,
    Pages2,
    Pages3,
    Pages4,
    Pages5,
    Pages6,
    PagesCurrent: TATPages;
    Pages: array[TATGroupsNums] of TATPages;
    constructor Create(AOwner: TComponent); override;
    //
    function PagesSetIndex(ANum: Integer): boolean;
    procedure PagesSetNext(ANext: boolean);
    function PagesIndexOf(APages: TATPages): Integer;
    function PagesIndexOfControl(ACtl: TControl): Integer;
    function PagesNextIndex(AIndex: Integer; ANext: boolean; AEnableEmpty: boolean): Integer;
    //
    procedure MoveTab(AFromPages: TATPages; AFromIndex: Integer;
      AToPages: TATPages; AToIndex: Integer; AActivateTabAfter: boolean);
    procedure MovePopupTabToNext(ANext: boolean);
    procedure MoveCurrentTabToNext(ANext: boolean);
    procedure MoveCurrentTabToOpposite;
    //
    property Mode: TATGroupsMode read FMode write SetMode;
    property PopupPages: TATPages read FPopupPages;
    property PopupTabIndex: Integer read FPopupTabIndex;
    property SplitPercent: Integer write SetSplitPercent;
    procedure SetTabFont(AFont: TFont);
    procedure SetTabColor(Id: TATTabsColorId; N: TColor);
    //
    property OnTabPopup: TNotifyEvent read FOnTabPopup write FOnTabPopup;
    property OnTabFocus: TNotifyEvent read FOnTabFocus write FOnTabFocus;
    property OnTabClose: TATTabCloseEvent read FOnTabClose write FOnTabClose;
    property OnTabAdd: TNotifyEvent read FOnTabAdd write FOnTabAdd;
  end;

implementation

uses
  Windows, SysUtils,
  {$ifdef SP}
  SpTbxSkins,
  {$endif}
  Dialogs;

function PtInControl(Control: TControl; const Pnt: TPoint): boolean;
begin
  Result:= PtInRect(Control.ClientRect, Control.ScreenToClient(Pnt));
end;

{ TATPages }

constructor TATPages.Create(AOwner: TComponent);
begin
  inherited;

  Caption:= '';
  BorderStyle:= bsNone;
  BevelInner:= bvNone;
  BevelOuter:= bvNone;

  FTabs:= TATTabs.Create(Self);
  FTabs.Parent:= Self;
  FTabs.Align:= alTop;
  FTabs.OnTabClick:= TabClick;
  FTabs.OnTabDrawBefore:= TabDrawBefore;
  FTabs.OnTabEmpty:= TabEmpty;

  FTabs.TabAngle:= 0;
  FTabs.TabIndentTop:= 1;
  FTabs.TabIndentInter:= 1;
  FTabs.Height:= FTabs.TabHeight+FTabs.TabIndentTop+4;
  FTabs.ColorBg:= clWindow;
end;

procedure TATPages.AddTab(AControl: TControl;
  const ACaption: Widestring; AColor: TColor);
begin
  FTabs.AddTab(-1, ACaption, AControl);
  AControl.Parent:= Self;
  AControl.Align:= alClient;
  FTabs.TabIndex:= FTabs.TabCount-1;
end;

procedure TATPages.TabClick(Sender: TObject);
var
  i: Integer;
  D: TATTabData;
  Ctl: TWinControl;
begin
  for i:= 0 to FTabs.TabCount-1 do
  begin
    D:= FTabs.GetTabData(i);
    if D<>nil then
    begin
      Ctl:= D.TabObject as TWinControl;
      Ctl.Visible:= i=FTabs.TabIndex;
    end;
  end;

  D:= FTabs.GetTabData(FTabs.TabIndex);
  if D<>nil then
  begin
    Ctl:= D.TabObject as TWinControl;
    if Ctl.Showing then
      if Assigned(FOnTabFocus) then
        FOnTabFocus(FTabs);
  end;
end;

procedure TATPages.SetOnTabClose(AEvent: TATTabCloseEvent);
begin
  FOnTabClose:= AEvent;
  FTabs.OnTabClose:= AEvent;
end;

procedure TATPages.SetOnTabAdd(AEvent: TNotifyEvent);
begin
  FOnTabAdd:= AEvent;
  FTabs.OnTabPlusClick:= AEvent;
end;

procedure TATPages.TabEmpty(Sender: TObject);
begin
  if Assigned(FOnTabEmpty) then
    FOnTabEmpty(Sender);
end;

{ TATGroups }

constructor TATGroups.Create(AOwner: TComponent);
const
  cMinSize = 60;
var
  i: Integer;
begin
  inherited;

  Caption:= '';
  BorderStyle:= bsNone;
  BevelInner:= bvNone;
  BevelOuter:= bvNone;

  Pages1:= TATPages.Create(Self);
  Pages2:= TATPages.Create(Self);
  Pages3:= TATPages.Create(Self);
  Pages4:= TATPages.Create(Self);
  Pages5:= TATPages.Create(Self);
  Pages6:= TATPages.Create(Self);

  PagesCurrent:= Pages1;
  Pages[1]:= Pages1;
  Pages[2]:= Pages2;
  Pages[3]:= Pages3;
  Pages[4]:= Pages4;
  Pages[5]:= Pages5;
  Pages[6]:= Pages6;

  for i:= Low(Pages) to High(Pages) do
    with Pages[i] do
    begin
      Name:= 'aPages'+IntToStr(i);
      Caption:= '';
      Tabs.Name:= 'aPagesTabs'+IntToStr(i);
      //
      Parent:= Self;
      Align:= alLeft;
      //
      OnContextPopup:= Self.TabPopup;
      OnTabEmpty:= Self.TabEmpty;
      OnTabFocus:= Self.TabFocus;
      OnTabClose:= Self.TabClose;
      OnTabAdd:= Self.TabAdd;
    end;

  FSplit1:= TMySplitter.Create(Self);
  FSplit1.Parent:= Self;
  FSplit1.OnMoved:= Split1Moved;
  FSplit1.MinSize:= cMinSize;

  FSplit2:= TMySplitter.Create(Self);
  FSplit2.Parent:= Self;
  FSplit2.OnMoved:= Split2Moved;
  FSplit2.MinSize:= cMinSize;

  FSplit3:= TMySplitter.Create(Self);
  FSplit3.Parent:= Self;
  FSplit3.OnMoved:= Split3Moved;
  FSplit3.MinSize:= cMinSize;

  FSplit4:= TMySplitter.Create(Self);
  FSplit4.Parent:= Self;
  FSplit4.OnMoved:= Split4Moved;
  FSplit4.MinSize:= cMinSize;

  FSplit5:= TMySplitter.Create(Self);
  FSplit5.Parent:= Self;
  FSplit5.OnMoved:= Split5Moved;
  FSplit5.MinSize:= cMinSize;

  FPanel1:= TPanel.Create(Self);
  FPanel1.Parent:= Self;
  FPanel1.Align:= alTop;
  FPanel1.Caption:= '';
  FPanel1.BorderStyle:= bsNone;
  FPanel1.BevelInner:= bvNone;
  FPanel1.BevelOuter:= bvNone;
  FPanel1.Visible:= false;

  FPanel2:= TPanel.Create(Self);
  FPanel2.Parent:= Self;
  FPanel2.Align:= alClient;
  FPanel2.Caption:= '';
  FPanel2.BorderStyle:= bsNone;
  FPanel2.BevelInner:= bvNone;
  FPanel2.BevelOuter:= bvNone;
  FPanel2.Visible:= false;

  InitSplitterPopup;
  FPopupPages:= nil;
  FPopupTabIndex:= -1;
  FMode:= gmNone;
end;

procedure TATGroups.InitSplitterPopup;
  //
  procedure Add(N: Integer);
  var
    MI: {$ifdef SP}TSpTbxItem{$else}TMenuItem{$endif};
  begin
    MI:= {$ifdef SP}TSpTbxItem{$else}TMenuItem{$endif}.Create(Self);
    MI.Caption:= Format('%d/%d', [N, 100-N]);
    MI.Tag:= N;
    MI.OnClick:= SplitClick;
    FSplitPopup.Items.Add(MI);
  end;
  //
begin
  FSplitPopup:= {$ifdef SP}TSpTbxPopupMenu{$else}TPopupMenu{$endif}.Create(Self);
  Add(20);
  Add(30);
  Add(40);
  Add(50);
  Add(60);
  Add(70);
  Add(80);
end;

type
  TControlHack = class(TSplitter);

procedure SetSplitterPopup(ASplitter: TMySplitter; APopup: TPopupMenu);
begin
  {$ifdef SP}
  ASplitter.PopupMenu:= APopup;
  {$else}
  TControlHack(ASplitter).PopupMenu:= APopup;
  {$endif}
end;

procedure TATGroups.MoveTabsOnModeChanging(Value: TATGroupsMode);
var
  NCountBefore, NCountAfter: Integer;
  i, j: Integer;
begin
  NCountBefore:= cModesGroupsCount[FMode];
  NCountAfter:= cModesGroupsCount[Value];

  for i:= NCountAfter+1 to NCountBefore do
    for j:= 0 to Pages[i].Tabs.TabCount-1 do
      MoveTab(Pages[i], 0{first tab}, Pages[NCountAfter], -1, false);
end;

procedure TATGroups.SetMode(Value: TATGroupsMode);
var
  FSplitDiv: Real;
  i: Integer;
begin
  if Value<>FMode then
  begin
    //actions before changing FMode
    MoveTabsOnModeChanging(Value);

    case FMode of
      gm2Horz:
        FSplitDiv:= Pages1.Width / ClientWidth;
      gm2Vert:
        FSplitDiv:= Pages1.Height / ClientHeight;
      else
        FSplitDiv:= 0.5;
    end;

    //changing FMode and actions after changing
    FMode:= Value;

    if FMode in [gm2Horz, gm2Vert] then
      SetSplitterPopup(FSplit1, FSplitPopup)
    else
      SetSplitterPopup(FSplit1, nil);

    for i:= Low(Pages) to High(Pages) do
      Pages[i].Visible:= i<=cModesGroupsCount[FMode];

    case FMode of
      gm4Grid:
      begin
        FPanel1.Visible:= true;
        FPanel2.Visible:= true;
        Pages1.Parent:= FPanel1;
        Pages2.Parent:= FPanel1;
        Pages3.Parent:= FPanel2;
        Pages4.Parent:= FPanel2;
        Pages5.Parent:= FPanel2;
        Pages6.Parent:= FPanel2;
        FSplit1.Parent:= FPanel1;
        FSplit2.Parent:= FPanel2;
        FSplit3.Parent:= Self;
        FSplit4.Parent:= Self;
        FSplit5.Parent:= Self;
      end;
      gm6Grid:
      begin
        FPanel1.Visible:= true;
        FPanel2.Visible:= true;
        Pages1.Parent:= FPanel1;
        Pages2.Parent:= FPanel1;
        Pages3.Parent:= FPanel1;
        Pages4.Parent:= FPanel2;
        Pages5.Parent:= FPanel2;
        Pages6.Parent:= FPanel2;
        FSplit1.Parent:= FPanel1;
        FSplit2.Parent:= FPanel1;
        FSplit3.Parent:= Self;
        FSplit4.Parent:= FPanel2;
        FSplit5.Parent:= FPanel2;
      end
      else
      begin
        FPanel1.Visible:= false;
        FPanel2.Visible:= false;
        Pages1.Parent:= Self;
        Pages2.Parent:= Self;
        Pages3.Parent:= Self;
        Pages4.Parent:= Self;
        Pages5.Parent:= Self;
        Pages6.Parent:= Self;
        FSplit1.Parent:= Self;
        FSplit2.Parent:= Self;
        FSplit3.Parent:= Self;
        FSplit4.Parent:= Self;
        FSplit5.Parent:= Self;
      end;
    end;

    case FMode of
      gmOne:
        begin
          FSplit1.Visible:= false;
          FSplit2.Visible:= false;
          FSplit3.Visible:= false;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alClient;
        end;
      gm2Horz:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= false;
          FSplit3.Visible:= false;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alLeft;
          Pages2.Align:= alClient;
          FSplit1.Align:= alLeft;
          //size
          Pages1.Width:= Trunc(ClientWidth * FSplitDiv);
          //pos
          FSplit1.Left:= ClientWidth;
          Pages2.Left:= ClientWidth;
        end;
      gm2Vert:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= false;
          FSplit3.Visible:= false;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alTop;
          Pages2.Align:= alClient;
          FSplit1.Align:= alTop;
          //size
          Pages1.Height:= Trunc(ClientHeight * FSplitDiv);
          //pos
          FSplit1.Top:= ClientHeight;
          Pages2.Top:= ClientHeight;
        end;
      gm3Horz:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= false;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alLeft;
          Pages2.Align:= alLeft;
          Pages3.Align:= alClient;
          FSplit1.Align:= alLeft;
          FSplit2.Align:= alLeft;
          //size
          Pages1.Width:= ClientWidth div 3;
          Pages2.Width:= ClientWidth div 3;
          //pos
          FSplit1.Left:= ClientWidth;
          Pages2.Left:= ClientWidth;
          FSplit2.Left:= ClientWidth;
          Pages3.Left:= ClientWidth;
        end;
      gm3Vert:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= false;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alTop;
          Pages2.Align:= alTop;
          Pages3.Align:= alClient;
          FSplit1.Align:= alTop;
          FSplit2.Align:= alTop;
          //size
          Pages1.Height:= ClientHeight div 3;
          Pages2.Height:= ClientHeight div 3;
          //pos
          FSplit1.Top:= ClientHeight;
          Pages2.Top:= ClientHeight;
          FSplit2.Top:= ClientHeight;
          Pages3.Top:= ClientHeight;
        end;
      gm4Horz:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= true;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alLeft;
          Pages2.Align:= alLeft;
          Pages3.Align:= alLeft;
          Pages4.Align:= alClient;
          FSplit1.Align:= alLeft;
          FSplit2.Align:= alLeft;
          FSplit3.Align:= alLeft;
          //size
          Pages1.Width:= ClientWidth div 4;
          Pages2.Width:= ClientWidth div 4;
          Pages3.Width:= ClientWidth div 4;
          //pos
          FSplit1.Left:= ClientWidth;
          Pages2.Left:= ClientWidth;
          FSplit2.Left:= ClientWidth;
          Pages3.Left:= ClientWidth;
          FSplit3.Left:= ClientWidth;
          Pages4.Left:= ClientWidth;
        end;
      gm4Vert:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= true;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alTop;
          Pages2.Align:= alTop;
          Pages3.Align:= alTop;
          Pages4.Align:= alClient;
          FSplit1.Align:= alTop;
          FSplit2.Align:= alTop;
          FSplit3.Align:= alTop;
          //size
          Pages1.Height:= ClientHeight div 4;
          Pages2.Height:= ClientHeight div 4;
          Pages3.Height:= ClientHeight div 4;
          //pos
          FSplit1.Top:= ClientHeight;
          Pages2.Top:= ClientHeight;
          FSplit2.Top:= ClientHeight;
          Pages3.Top:= ClientHeight;
          FSplit3.Top:= ClientHeight;
          Pages4.Top:= ClientHeight;
        end;
      gm4Grid:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= true;
          FSplit4.Visible:= false;
          FSplit5.Visible:= false;
          Pages1.Align:= alLeft;
          Pages2.Align:= alClient;
          Pages3.Align:= alLeft;
          Pages4.Align:= alClient;
          FSplit1.Align:= alLeft;
          FSplit2.Align:= alLeft;
          FSplit3.Align:= alTop;
          //size
          Pages1.Width:= ClientWidth div 2;
          Pages3.Width:= ClientWidth div 2;
          FPanel1.Height:= ClientHeight div 2;
          //pos-a
          FSplit1.Left:= ClientWidth;
          Pages2.Left:= ClientWidth;
          //pos-b
          FSplit2.Left:= ClientWidth;
          Pages4.Left:= ClientWidth;
          //pos-c
          FSplit3.Top:= ClientHeight;
          FPanel2.Top:= ClientHeight;
        end;
      gm6Grid:
        begin
          FSplit1.Visible:= true;
          FSplit2.Visible:= true;
          FSplit3.Visible:= true;
          FSplit4.Visible:= true;
          FSplit5.Visible:= true;
          Pages1.Align:= alLeft;
          Pages2.Align:= alLeft;
          Pages3.Align:= alClient;
          Pages4.Align:= alLeft;
          Pages5.Align:= alLeft;
          Pages6.Align:= alClient;
          FSplit1.Align:= alLeft;
          FSplit2.Align:= alLeft;
          FSplit3.Align:= alTop;
          FSplit4.Align:= alLeft;
          FSplit5.Align:= alLeft;
          //size
          Pages1.Width:= ClientWidth div 3;
          Pages2.Width:= ClientWidth div 3;
          Pages4.Width:= ClientWidth div 3;
          Pages5.Width:= ClientWidth div 3;
          FPanel1.Height:= ClientHeight div 2;
          //pos-a
          FSplit1.Left:= ClientWidth;
          Pages2.Left:= ClientWidth;
          FSplit2.Left:= ClientWidth;
          Pages3.Left:= ClientWidth;
          //pos-b
          FSplit4.Left:= ClientWidth;
          Pages5.Left:= ClientWidth;
          FSplit5.Left:= ClientWidth;
          Pages6.Left:= ClientWidth;
          //pos-c
          FSplit3.Top:= ClientHeight;
          FPanel2.Top:= ClientHeight;
        end;
    end;

    SaveSplitPos;
  end;
end;

procedure TATGroups.Split1Moved(Sender: TObject);
begin
  if FMode=gm4Grid then
    Pages3.Width:= Pages1.Width;
  if FMode=gm6Grid then
    Pages4.Width:= Pages1.Width;

  SaveSplitPos;
end;

procedure TATGroups.Split2Moved(Sender: TObject);
begin
  if FMode=gm4Grid then
    Pages1.Width:= Pages3.Width;
  if FMode=gm6Grid then
    Pages5.Width:= Pages2.Width;

  SaveSplitPos;
end;

procedure TATGroups.Split3Moved(Sender: TObject);
begin
  SaveSplitPos;
end;

procedure TATGroups.Split4Moved(Sender: TObject);
begin
  if FMode=gm6Grid then
    Pages1.Width:= Pages4.Width;

  SaveSplitPos;
end;

procedure TATGroups.Split5Moved(Sender: TObject);
begin
  if FMode=gm6Grid then
    Pages2.Width:= Pages5.Width;

  SaveSplitPos;
end;

procedure TATGroups.TabPopup(Sender: TObject; MousePos: TPoint; var Handled: Boolean);
var
  Pnt, PntC: TPoint;
  i: Integer;
begin
  FPopupPages:= nil;
  FPopupTabIndex:= -1;

  Pnt:= (Sender as TControl).ClientToScreen(MousePos);
  for i:= Low(Pages) to High(Pages) do
    if PtInControl(Pages[i].Tabs, Pnt) then
    begin
      FPopupPages:= Pages[i];
      Break
    end;
  if FPopupPages=nil then Exit;

  PntC:= PopupPages.Tabs.ScreenToClient(Pnt);
  FPopupTabIndex:= FPopupPages.Tabs.GetTabAt(PntC.X, PntC.Y);

  if Assigned(FOnTabPopup) then
    FOnTabPopup(Self);
  Handled:= true;
end;

procedure TATPages.TabDrawBefore(Sender: TObject;
  AType: TATTabElemType; ATabIndex: Integer;
  C: TCanvas; const ARect: TRect; var ACanDraw: boolean);
begin
  {$ifndef SP}
  ACanDraw:= true;
  {$else}
  case AType of
    aeBackground:
    begin
      CurrentSkin.PaintBackground(
        C, ARect,
        skncDock, sknsNormal, true{BG}, false{Borders});
      ACanDraw:= false;
    end;
    aeXButton:
    begin
      //if ATabMouseOver then
      //  SpDrawXPToolbarButton(Control.Canvas, R, sknsHotTrack, cpNone);
      SpDrawGlyphPattern(C, ARect, 0{0 is X icon index},
        CurrentSkin.GetTextColor(skncToolbarItem, sknsNormal));
      ACanDraw:= false;
    end;
    aeXButtonOver:
    begin
      SpDrawXPToolbarButton(C,
        Rect(ARect.Left-1, ARect.Top-1, ARect.Right, ARect.Bottom),
        sknsHotTrack, cpNone);
      SpDrawGlyphPattern(C, ARect, 0{0 is X icon index},
        CurrentSkin.GetTextColor(skncToolbarItem, sknsNormal));
      ACanDraw:= false;
    end;
  end;
  {$endif}
end;

procedure TATGroups.SaveSplitPos;
begin
  if ClientWidth<=0 then Exit;
  if ClientHeight<=0 then Exit;

  FPos1:= 0;
  FPos2:= 0;
  FPos3:= 0;
  FPos4:= 0;
  FPos5:= 0;

  case FMode of
    gm2Horz,
    gm3Horz,
    gm4Horz:
      begin
        FPos1:= Pages1.Width / ClientWidth;
        FPos2:= Pages2.Width / ClientWidth;
        FPos3:= Pages3.Width / ClientWidth;
      end;
    gm2Vert,
    gm3Vert,
    gm4Vert:
      begin
        FPos1:= Pages1.Height / ClientHeight;
        FPos2:= Pages2.Height / ClientHeight;
        FPos3:= Pages3.Height / ClientHeight;
      end;
    gm4Grid:
      begin
        FPos1:= Pages1.Width / ClientWidth;
        FPos2:= Pages3.Width / ClientWidth;
        FPos3:= FPanel1.Height / ClientHeight;
      end;
    gm6Grid:
      begin
        FPos1:= Pages1.Width / ClientWidth;
        FPos2:= Pages2.Width / ClientWidth;
        FPos3:= FPanel1.Height / ClientHeight;
        FPos4:= Pages4.Width / ClientWidth;
        FPos5:= Pages5.Width / ClientWidth;
      end;
  end;
end;

procedure TATGroups.RestoreSplitPos;
begin
  if ClientWidth<=0 then Exit;
  if ClientHeight<=0 then Exit;

  case FMode of
    gm2Horz,
    gm3Horz,
    gm4Horz:
      begin
        Pages1.Width:= Trunc(FPos1 * ClientWidth);
        Pages2.Width:= Trunc(FPos2 * ClientWidth);
        Pages3.Width:= Trunc(FPos3 * ClientWidth);
      end;
    gm2Vert,
    gm3Vert,
    gm4Vert:
      begin
        Pages1.Height:= Trunc(FPos1 * ClientHeight);
        Pages2.Height:= Trunc(FPos2 * ClientHeight);
        Pages3.Height:= Trunc(FPos3 * ClientHeight);
      end;
    gm4Grid:
      begin
        Pages1.Width:= Trunc(FPos1 * ClientWidth);
        Pages3.Width:= Trunc(FPos2 * ClientWidth);
        FPanel1.Height:= Trunc(FPos3 * ClientHeight);
      end;
    gm6Grid:
      begin
        Pages1.Width:= Trunc(FPos1 * ClientWidth);
        Pages2.Width:= Trunc(FPos2 * ClientWidth);
        FPanel1.Height:= Trunc(FPos3 * ClientHeight);
        Pages4.Width:= Trunc(FPos4 * ClientWidth);
        Pages5.Width:= Trunc(FPos5 * ClientWidth);
      end;
  end;
end;

procedure TATGroups.Resize;
begin
  RestoreSplitPos;
end;


procedure TATGroups.TabEmpty(Sender: TObject);
begin
  //if last tab closed on Pages1, add new tab
  //if last tab closed on Pages2..Pages4, activate Pages1
  if Sender=Pages1.Tabs then
  begin
    Pages1.OnTabAdd(Pages1.Tabs);
  end
  else
  begin
    if Pages1.Tabs.TabCount>0 then
      Pages1.Tabs.OnTabClick(nil);
  end;
end;

procedure TATGroups.SplitClick(Sender: TObject);
begin
  SetSplitPercent((Sender as TComponent).Tag);
end;

procedure TATGroups.SetSplitPercent(N: Integer);
begin
  case FMode of
    gm2Horz:
      begin
        Pages1.Width:= ClientWidth * N div 100;
        SaveSplitPos;
      end;
    gm2Vert:
      begin
        Pages1.Height:= ClientHeight * N div 100;
        SaveSplitPos;
      end;
  end;
end;

procedure TATGroups.MoveTab(AFromPages: TATPages; AFromIndex: Integer;
  AToPages: TATPages; AToIndex: Integer; AActivateTabAfter: boolean);
var
  D: TATTabData;
begin
  D:= AFromPages.Tabs.GetTabData(AFromIndex);
  if D=nil then Exit;
  AToPages.AddTab(D.TabObject as TControl, D.TabCaption, D.TabColor);
  AFromPages.Tabs.DeleteTab(AFromIndex, false);

  if AActivateTabAfter then
    with AToPages.Tabs do
      TabIndex:= TabCount-1;
end;


function TATGroups.PagesSetIndex(ANum: Integer): boolean;
var
  APages: TATPages;
begin
  if (ANum>=Low(Pages)) and (ANum<=High(Pages)) then
    APages:= Pages[ANum]
  else
    APages:= nil;

  Result:= (APages<>nil) and APages.Visible and (APages.Tabs.TabCount>0);
  if Result then
    APages.Tabs.OnTabClick(nil);
end;

procedure TATGroups.PagesSetNext(ANext: boolean);
var
  Num0, Num1: Integer;
begin
  Num0:= PagesIndexOf(PagesCurrent);
  if Num0<0 then Exit;
  Num1:= PagesNextIndex(Num0, ANext, false);
  if Num1<0 then Exit;
  PagesSetIndex(Num1);
end;


function TATGroups.PagesIndexOfControl(ACtl: TControl): Integer;
var
  i, j: Integer;
begin
  for i:= Low(Pages) to High(Pages) do
    with Pages[i] do
      for j:= 0 to Tabs.TabCount-1 do
        if Tabs.GetTabData(j).TabObject = ACtl then
        begin
          Result:= i;
          Exit
        end;
  Result:= -1;
end;

function TATGroups.PagesIndexOf(APages: TATPages): Integer;
var
  i: Integer;
begin
  Result:= -1;
  for i:= Low(Pages) to High(Pages) do
    if Pages[i] = APages then
    begin
      Result:= i;
      Exit
    end;
end;

function TATGroups.PagesNextIndex(AIndex: Integer; ANext: boolean;
  AEnableEmpty: boolean): Integer;
var
  N: Integer;
begin
  Result:= -1;
  N:= AIndex;

  repeat
    if ANext then Inc(N) else Dec(N);
    if N>High(Pages) then N:= Low(Pages) else
      if N<Low(Pages) then N:= High(Pages);

    if N=AIndex then Exit; //don't return same index

    if Pages[N].Visible then
      if (Pages[N].Tabs.TabCount>0) or AEnableEmpty then
      begin
        Result:= N;
        Exit
      end;
  until false;
end;


procedure TATGroups.TabFocus(Sender: TObject);
begin
  if Assigned(FOnTabFocus) then
    FOnTabFocus(Sender);
end;

procedure TATGroups.MovePopupTabToNext(ANext: boolean);
var
  N0, N1: Integer;
begin
  N0:= PagesIndexOf(PopupPages);
  if N0<0 then Exit;
  N1:= PagesNextIndex(N0, ANext, true);
  if N1<0 then Exit;
  MoveTab(PopupPages, PopupTabIndex, Pages[N1], -1, false);
end;

procedure TATGroups.MoveCurrentTabToNext(ANext: boolean);
var
  N0, N1: Integer;
begin
  N0:= PagesIndexOf(PagesCurrent);
  if N0<0 then Exit;
  N1:= PagesNextIndex(N0, ANext, true);
  if N1<0 then Exit;
  MoveTab(PagesCurrent, PagesCurrent.Tabs.TabIndex, Pages[N1], -1, true);
end;

procedure TATGroups.TabClose(Sender: TObject; ATabIndex: Integer;
  var ACanClose: boolean);
begin
  if Assigned(FOnTabClose) then
    FOnTabClose(Sender, ATabIndex, ACanClose);
end;

procedure TATGroups.TabAdd(Sender: TObject);
begin
  if Assigned(FOnTabAdd) then
    FOnTabAdd(Sender);
end;

procedure TATGroups.SetTabFont(AFont: TFont);
var
  i: Integer;
begin
  for i:= Low(Pages) to High(Pages) do
    Pages[i].Tabs.Font.Assign(AFont);
end;

procedure TATGroups.SetTabColor(Id: TATTabsColorId; N: TColor);
var
  i: Integer;
begin
  for i:= Low(Pages) to High(Pages) do
    with Pages[i].Tabs do
      case Id of
        tabColorActive: ColorTabActive:= N;
        tabColorPassive: ColorTabPassive:= N;
        tabColorPassiveOver: ColorTabOver:= N;
        tabColorFont: Font.Color:= N;
        tabColorBorderActive: ColorBorderActive:= N;
        tabColorBorderPassive: ColorBorderPassive:= N;
      end;
end;

procedure TATGroups.MoveCurrentTabToOpposite;
var
  NFrom, NTo, NTabIndex: Integer;
begin
  NFrom:= PagesIndexOf(PagesCurrent);
  if NFrom<0 then Exit;
  if NFrom=1 then NTo:= 2 else NTo:= 1;

  NTabIndex:= Pages[NFrom].Tabs.TabIndex;
  if NTabIndex<0 then Exit;

  if (NTo>1) and (FMode<=gmOne) then
    SetMode(gm2Horz);

  MoveTab(Pages[NFrom], NTabIndex, Pages[NTo], -1, true);
end;

end.

