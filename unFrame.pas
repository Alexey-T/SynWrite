{
SynWrite frame which contains actual editor.
Created as a child of TfmMain form.
}
unit unFrame;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  ExtCtrls, ComCtrls, ImgList, ActiveX,
  Menus, Math,
  ecSyntMemo, ecSyntAnal, ecActns, ecExtHighlight, ecOleDrag, ecEmbObj, ecSpell,
  ATFileNotificationSimple,
  ATSyntMemo, //this will replace TSyntaxMemo
  TB2Item, SpTBXItem, SpTBXDkPanels;

const
  cMaxBk = 1*1000*1000; //max bookmarks count
  cTabNumPrefix = 3; //3 spaces before tab caption for "NN."

type
  TEditorEvent = procedure(Sender: TFrame) of object;
type
  TEditorFrame = class(TFrame)
    ecSpellChecker: TecSpellChecker;
    HyperlinkHighlighter: THyperlinkHighlighter;
    TextSource: TecEmbeddedObjects;
    PopupSplitEditors: TSpTBXPopupMenu;
    TBXItemSplitHorz: TSpTbxItem;
    TBXItemSplit70_30: TSpTbxItem;
    TBXItemSplit60_40: TSpTbxItem;
    TBXItemSplit50_50: TSpTbxItem;
    TBXItemSplit40_60: TSpTbxItem;
    TBXItemSplit30_70: TSpTbxItem;
    TBXItemSplit20_80: TSpTbxItem;
    TBXItemSplit80_20: TSpTbxItem;
    TBXSeparatorItem1: TSpTbxSeparatorItem;
    TBXItemSplitCaption: TSpTbxItem;
    PanelMap: TPaintBox;
    Panel1: TPanel;
    EditorMaster: TSyntaxMemo;
    SplitterEds: TSpTBXSplitter;
    EditorSlave: TSyntaxMemo;
    TimerMap: TTimer;
    TBXSeparatorItem2: TSpTbxSeparatorItem;
    TBXItemSplitCancel: TSpTbxItem;
    procedure EditorMasterEnter(Sender: TObject);
    procedure EditorMasterSetBookmark(Snder: TObject; Bookmark: TBookmark;
      var Accept: Boolean);
    procedure FrameResize(Sender: TObject);
    procedure EditorMasterChange(Sender: TObject);
    procedure EditorMasterCaretPosChanged(Sender: TObject);
    procedure EditorMasterGetGutterImage(Sender: TObject;
      const Line: Integer; List: TList);
    procedure SyncEditClick(Sender: TObject; Line: integer; Shift: TShiftState);
    procedure EditorMasterExecuteCommand(Sender: TObject; Command: Integer;
      Data: Pointer; var Handled: Boolean);
    procedure EditorMasterOleDragEnter(Sender: TObject;
      const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
      var Effect: Integer; var Handled: Boolean);
    procedure EditorMasterOleDragOver(Sender: TObject; const DataObject: IDataObject; KeyState: Integer;
      Pt: TPoint; var Effect: Integer; var Handled: Boolean);
    procedure EditorMasterOleDrop(Sender: TObject;
      const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
      var Effect: Integer; var Handled: Boolean);
    procedure EditorMasterKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditorScroll(Sender: TObject);
    procedure EditorMasterGutterClick(Sender: TObject; Line: Integer;
      Buton: TMouseButton; Shift: TShiftState; XY: TPoint);
    procedure EditorMasterGetTokenHint(Sender: TObject;
      TokenIndex: Integer; var HintText: String);
    procedure EditorMasterSelectionChanged(Sender: TObject);
    procedure EditorMasterZoom(Sender: TObject);
    procedure SplitterEdsMoved(Sender: TObject);
    procedure TBXItemSplitHorzClick(Sender: TObject);
    procedure PopupSplitEditorsPopup(Sender: TObject);
    procedure TBXItemSplit20_80Click(Sender: TObject);
    procedure TBXItemSplit30_70Click(Sender: TObject);
    procedure TBXItemSplit40_60Click(Sender: TObject);
    procedure TBXItemSplit50_50Click(Sender: TObject);
    procedure TBXItemSplit60_40Click(Sender: TObject);
    procedure TBXItemSplit70_30Click(Sender: TObject);
    procedure TBXItemSplit80_20Click(Sender: TObject);
    procedure PanelMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TimerMapTimer(Sender: TObject);
    procedure PanelMapPaint(Sender: TObject);
    procedure PanelMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ecSpellCheckerCheckWord(Sender: TObject;
      const AWord: WideString; APos: Integer; var Valid: Boolean);
    procedure EditorMasterContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure EditorMasterFinishAnalysis(Sender: TObject);
    procedure EditorSlaveFinishAnalysis(Sender: TObject);
    procedure TBXItemSplitCancelClick(Sender: TObject);
    procedure SplitterDblClick(Sender: TObject);
    procedure EditorMasterCheckChar(Sender: TObject; C: Word;
      var IsWord: Boolean);
  private
    FNotifAllYes,
    FNotifAllNo: boolean;
    FNotif: TATFileNotificationSimple;
    FCollapsedString: Widestring;
    FCollapsedString2: Widestring;
    FCollapsedRestored: boolean;
    FCollapsedRestored2: boolean;
    FFtpInfoPtr: Pointer;
    FFtpInfoSize: Integer;
    FMapColor: TColor;
    FTabColor: TColor;
    FSelPresent: boolean;
    FLineEndsChg,
    FSpell,
    FNoBOM: boolean;
    FFileName: WideString;
    FOnTitleChanged: TEditorEvent;
    FOnSaveState: TNotifyEvent;
    FModifiedPrev: Boolean;
    FModifiedClr: Boolean;
    FSplitHorz: boolean;
    FSplitPos: Double;
    FNotInRecents: boolean;
    FLockMapUpdate: boolean;
    FSavingBusy: boolean;

    procedure EditorShowHint(Sender: TObject; const HintStr: string; var HintObj: THintWindow);
    procedure SetSplitPos(const F: Double);
    procedure SetSplitHorz(Value: boolean);
    function GetModified: boolean;
    procedure SetModified(Value: boolean);
    function GetTitle: WideString;
    procedure FileReload(Sender: TObject);
    function GetShowMap: boolean;
    procedure SetShowMap(V: boolean);
    function GetMapLine(X, Y: Integer): Integer;
    procedure SetMapColor(C: TColor);
    function FocusedEditor: TSyntaxMemo;
    procedure UpdateMap(Ed: TSyntaxMemo);
    procedure SetSpell(Value: boolean);
    function GetCaretsEnabled: boolean;
    function GetCaretsGutterBand: integer;
    function GetCaretsIndicator: integer;
    procedure SetCaretsEnabled(V: boolean);
    procedure SetCaretsGutterBand(V: integer);
    procedure SetCaretsIndicator(V: integer);
    function GetCaretsGutterColor: TColor;
    procedure SetCaretsGutterColor(V: TColor);
    procedure EditorCtrlClick(Sender: TObject; const Pnt: TPoint; var Handled: boolean);
  protected
  public
    //ftp--------------
    property FtpInfoPtr: Pointer read FFtpInfoPtr;
    property FtpInfoSize: Integer read FFtpInfoSize;
    procedure SetFtpInfo(AInfoPtr: Pointer; AInfoSize: Integer);
    procedure FreeFtpInfo;
    function IsFtp: boolean;
    //---------------------

    function CaretsCount: integer;
    procedure CaretsProps(var NTop, NBottom: integer);
    function SUrlAt(const Pnt: TPoint): Widestring;
    property CaretsEnabled: boolean read GetCaretsEnabled write SetCaretsEnabled;
    property CaretsGutterBand: integer read GetCaretsGutterBand write SetCaretsGutterBand;
    property CaretsGutterColor: TColor read GetCaretsGutterColor write SetCaretsGutterColor;
    property CaretsIndicator: integer read GetCaretsIndicator write SetCaretsIndicator;

    property CollapsedString: Widestring read FCollapsedString write FCollapsedString;
    property CollapsedString2: Widestring read FCollapsedString2 write FCollapsedString2;
    function IsEditorPosMisspelled(APos: Integer): boolean;
    function DoSpellContinue(AFromPos: Integer): Integer;
    procedure SyncMap;
    property ShowMap: boolean read GetShowMap write SetShowMap;
    property MapColor: TColor read FMapColor write SetMapColor;
    property TabColor: TColor read FTabColor write FTabColor;
    procedure DoBkToggle(e: TCustomSyntaxMemo; line: integer);
    procedure DoTitleChanged;
    procedure DoStartNotif;
    procedure DoStopNotif;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SaveFile(AFileName: Widestring);
    procedure LoadFile(const AFileName: Widestring);
    function IsTheFile(const AFileName: Widestring): Boolean;
    function IsNewFile: Boolean;
    function IsSplitted: boolean;
    procedure ToggleSplitted;
    procedure UpdateGutterWidth(Sender: TObject);

    property NotInRecents: boolean read FNotInRecents write FNotInRecents;
    property SplitPos: Double read FSplitPos write SetSplitPos;
    property SplitHorz: boolean read FSplitHorz write SetSplitHorz;
    property LineEndsChg: boolean read FLineEndsChg write FLineEndsChg;
    property SpellLive: boolean read FSpell write SetSpell;
    property SkipSign: boolean read FNoBOM write FNoBOM;
    property FileName: Widestring read FFileName write FFileName;
    property Modified: boolean read GetModified write SetModified;
    property ModifiedClr: boolean read FModifiedClr write FModifiedClr;
    //property Closing: boolean read FClosing write FClosing;
    property LockMapUpdate: boolean read FLockMapUpdate write FLockMapUpdate;
    property Title: Widestring read GetTitle;
    property OnTitleChanged: TEditorEvent read FOnTitleChanged write FOnTitleChanged;
    property OnSaveState: TNotifyEvent read FOnSaveState write FOnSaveState;
  end;

const
  cColorPrefix = '{color}';

implementation

uses
  ecStrUtils, ecCmdConst, ecMemoStrings,
  Types,
  unMain,
  unProc,
  unProcEditor,
  ATxFProc, ATxSProc, ATxImgHint,
  DKLang,

  TntComCtrls,
  TntSysUtils,
  Dialogs, TntDialogs;

{$R *.dfm}


//type
//  TControlHack = class(TControl);

procedure TEditorFrame.FrameResize(Sender: TObject);
begin
  SplitPos:= SplitPos;
  SyncMap;
end;

const
  cManyLines = 5000;

function TEditorFrame.FocusedEditor: TSyntaxMemo;
begin
  if EditorSlave.Focused then
    Result:= EditorSlave
  else
    Result:= EditorMaster;
end;

procedure TEditorFrame.SyncMap;
begin
  //prevent "Control EditorFrame has no parent window" for Wlx
  if Parent=nil then
    Exit;

  //prevent flickering of map when "Insert text" dialog active
  if FLockMapUpdate then
    Exit;

  if TextSource.Lines.Count<=cManyLines then
    UpdateMap(FocusedEditor)
  else
    TimerMap.Enabled:= true;
end;

// Initializing events
constructor TEditorFrame.Create(AOwner: TComponent);
begin
  inherited;

  with EditorMaster do
  begin
    BevelInner:= bvLowered;
    BevelOuter:= bvNone;
    BevelKind:= bkSoft;
  end;
  with EditorSlave do
  begin
    BevelInner:= bvLowered;
    BevelOuter:= bvNone;
    BevelKind:= bkSoft;
  end;

  FNotif:= TATFileNotificationSimple.Create(Self);
  FNotif.Timer.Enabled:= False;
  FNotif.Timer.Interval:= 1000;
  FNotif.OnChanged:= FileReload;

  FFtpInfoPtr:= nil;
  FFtpInfoSize:= 0;
  FMapColor:= clLtGray;
  FTabColor:= clNone;
  FSpell:= false;
  FLineEndsChg:= false;
  FModifiedClr:= false;
  FSplitHorz:= true;
  FSplitPos:= 0;
  FNotInRecents:= false;
  FLockMapUpdate:= false;
  FSavingBusy:= false;

  FCollapsedString:= '';
  FCollapsedRestored:= false;

  //ecSpellChecker.Dictionary:= fmMain.ecDictionary;
  TextSource.Lines.SetObjectsStore;
  EditorMaster.PopupMenu:= TfmMain(Owner).PopupEditor;
  EditorSlave.PopupMenu:= TfmMain(Owner).PopupEditor;
  EditorMaster.Gutter.Images:= TfmMain(Owner).ImgListGutter;
  EditorSlave.Gutter.Images:= TfmMain(Owner).ImgListGutter;

  //special events
  EditorMaster.OnShowHint:= EditorShowHint;
  EditorSlave.OnShowHint:= EditorShowHint;
  EditorMaster.OnCtrlClick:= EditorCtrlClick;
  EditorSlave.OnCtrlClick:= EditorCtrlClick;
end;

procedure TEditorFrame.EditorMasterEnter(Sender: TObject);
var
  Ed: TSyntaxMemo;
begin
  Ed:= Sender as TSyntaxMemo;
  TfmMain(Owner).CurrentEditor:= Ed;

  //Ctrl+Alt+click -- find id
  //(if no line selection is made with Ctrl+Alt+drag)
  if IsCtrlAltPressed then
    if not Ed.HaveSelection then
    begin
      EditorUpdateCaretPosFromMousePos(Ed);
      TfmMain(Owner).DoFindIdDelayed;
    end;

  SyncMap;
end;

procedure TEditorFrame.EditorMasterSetBookmark(Snder: TObject;
  Bookmark: TBookmark; var Accept: Boolean);
begin
  with Bookmark do
   begin
     Band:= 1; //Band index for Bookmarks
     ImageList:= TfmMain(Owner).ImgListGutter;
     if (BmIndex >= 0) and (BmIndex < 10) then
     begin
       ImageIndex:= BmIndex;
       Hint:= '\s5\' + Format(DKLangConstW('Bk'), [BmIndex]);
     end
     else
     begin
       ImageIndex:= 12;
       Hint:= '\s5\' + DKLangConstW('BkUn');
     end;
     Cursor:= crHandPoint;
     BgColor:= TfmMain(Self.Owner).opColorBkmk;
   end;
end;

{$warnings off}
procedure TEditorFrame.SaveFile(AFileName: Widestring);
  procedure ErrorWritable;
  begin
    MsgError(WideFormat(DKLangConstW('MAtt'), [AFileName]), Handle);
  end;
  procedure ErrorCantSave;
  begin
    MsgError(WideFormat(DKLangConstW('zMCantSave'), [AFileName]), Handle);
  end;
  function MsgConfirmOverwrite: boolean;
  begin
    Result:= MsgConfirm(WideFormat(DKLangConstW('MOver'), [WideExtractFileName(AFileName)]), Handle);
  end;
var
  attr: integer;
  ext: string;
const
  fa = (file_attribute_readonly or file_attribute_hidden or file_attribute_system);
begin
  if FSavingBusy then Exit;
  TfmMain(Owner).DoBackup(AFileName);

  //handle ReadOnly/Hidden/System attribs
  attr:= -1;
  if IsFileExist(AFileName) then
  begin
    attr:= GetFileAttributesW(PWChar(AFileName));
    if (attr and fa) <> 0 then begin
      if TfmMain(Owner).opAskOverwrite and not MsgConfirmOverwrite then
        Exit;
      if not SetFileAttributesW(PWChar(AFileName), attr and not fa) then
        begin ErrorWritable; Exit end;
    end
    else
      attr:= -1;
  end;

  //check that file permission enabled
  if IsFileExist(AFileName) and not IsFileWritable(AFileName) then
    begin ErrorWritable; Exit end;

  FSavingBusy:= true;
  TextSource.Lines.SkipSignature:= SkipSign;
  ext:= Copy(WideExtractFileExt(AFileName), 2, MaxInt);

  repeat
    try
      EditorMaster.SaveToFile(AFileName);
      Modified:= False;
    except
      ErrorCantSave;
    end;
    if not Modified then Break;
    if not WidePromptForFileName(AFileName, '', ext, '', '', true) then Break;
  until false;

  FSavingBusy:= false;
  TextSource.Lines.SkipSignature:= False;

  FFileName:= AFileName;
  DoTitleChanged;

  //restore ReadOnly/Hidden/System attribs
  if (attr <> -1) then
    SetFileAttributesW(PWChar(FileName), attr);
end;
{$warnings on}

procedure TEditorFrame.LoadFile(const AFileName: Widestring);
begin
  SkipSign:= False;
  TextSource.Lines.SkipSignature:= False;

  if (AFileName = '') then
    TextSource.Lines.Clear
  else
  try
    Screen.Cursor:= crHourGlass;
    if not TfmMain(Owner).LoadFrameState(Self, AFileName) then
      TextSource.Lines.LoadFromFile(AFileName);
  finally
    Screen.Cursor:= crDefault;
  end;

  Modified:= False;
  ModifiedClr:= False;
  FFileName:= AFileName;
  DoTitleChanged;
end;


function TEditorFrame.GetModified: boolean;
begin
  if FModifiedClr then
    Result:= False
  else
    Result:= EditorMaster.Modified;
end;

procedure TEditorFrame.SetModified(Value: boolean);
begin
  EditorMaster.Modified:= Value;
  EditorSlave.Modified:= Value;
  if not Value then
    FModifiedPrev:= Value;
end;

function TEditorFrame.GetTitle: Widestring;
var
  MaxLen, n: integer;
begin
  if FFileName='' then
    Result:= DKLangConstW('Untitled')
  else
    Result:= WideExtractFileName(FFileName);

  MaxLen:= TfmMain(Owner).opTabMaxLen;
  if (MaxLen>0) and (Length(Result)>MaxLen) then
  begin
    n:= MaxLen div 2;
    Result:= Copy(Result, 1, n) + #$2026 + Copy(Result, Length(Result)-(MaxLen-n)+1, MaxInt);
  end;

  if Modified then
    Result:= Result + '*';
  //spaces for look
  Result:= ' ' + Result + '   ';
  //ftp: more spaces for icon
  if IsFtp then
    Result:= Result + '  ';

  //more spaces for tab numbers
  if TfmMain(Owner).opTabNums then
    Result:= StringOfChar(' ', cTabNumPrefix) + Result;
  //more spaces for X button  
  if TfmMain(Owner).opTabBtn then
    Result:= Result + '   ';
end;

procedure TEditorFrame.DoTitleChanged;
var
  FTab: TTntTabSheet;
begin
  if Parent<>nil then
    if Parent is TTntTabSheet then
    begin
      FTab:= (Parent as TTntTabSheet);
      FTab.Caption:= Title;
      {
      //trying to fix issue with tab header overlapped by [<] and [>] buttons
      //(single line PageControl), but it's not nice code
      if FTab.PageIndex = FTab.PageControl.ActivePageIndex then
      begin
        FTab.PageControl.ScrollTabs(FTab.PageControl.PageCount);
      end;
      }
    end;

  if Assigned(FOnTitleChanged) then
    FOnTitleChanged(Self);
end;

//is filename already opened?
function TEditorFrame.IsTheFile(const AFileName: Widestring): Boolean;
begin
  Result:= (FFileName <> '') and
    (WideUpperCase(FFileName) = WideUpperCase(AFileName));
end;

//is frame hold untitled document?
function TEditorFrame.IsNewFile: Boolean;
begin
  Result:= FFileName = '';
end;

{
procedure TEditorFrame.FixEditorCollapsed(Ed: TSyntaxMemo);
var
  i: Integer;
  S: string;
  AMod: boolean;
begin
  AMod:= false;
  for i:= Ed.Collapsed.Count-1 downto 0 do
    with Ed.Collapsed[i] do
    begin
      S:= EditorTokenName(Ed, StartPos+1, EndPos+1);
      if S='Comment' then
      begin
        Ed.Collapsed.Delete(i);
        AMod:= true;
      end;
    end;
  if AMod then
  begin
    //TfmMain(Owner).SHint[-1]:= 'Adjust';
    //Ed.DoScroll;
    MsgBeep;
  end;
end;
}

procedure TEditorFrame.EditorMasterChange(Sender: TObject);
begin
  if FModifiedPrev <> Modified then
  begin
    DoTitleChanged;
    FModifiedPrev:= Modified;
  end;

  UpdateGutterWidth(Sender);
  TfmMain(Owner).UpdateStatusBar;
  TfmMain(Owner).SynChange(Sender);
  SyncMap;

  //not good, may be slow
  //FixEditorCollapsed(Sender as TSyntaxMemo);
end;

procedure TEditorFrame.EditorMasterCaretPosChanged(Sender: TObject);
begin
  TfmMain(Owner).SynCaretPosChanged(Self);
end;

procedure TEditorFrame.EditorMasterGetGutterImage(Sender: TObject;
  const Line: Integer; List: TList);
var
  Memo: TSyntaxMemo;
  gi: TGutterObject;
begin
  //SyncEdit icon enabled?
  if not TfmMain(Owner).opSyncEditIcon then Exit;

  Memo:= Sender as TSyntaxMemo;
  if (Memo.SelLength > 0) and
     (Line = Memo.StrPosToCaretPos(Memo.SelStart + Memo.SelLength).Y) then
  begin
    gi:= TGutterObject.Create(nil);
    gi.Band:= 1; //Band index for Bookmarks
    gi.OnClick:= SyncEditClick;
    gi.ImageIndex:= 10;
    gi.Hint:= DKLangConstW('Sync');
    List.Add(gi);
    Exit;
  end;
  if Memo.SyncEditing.RangeEndAtLine(Line) <> -1 then
  begin
    gi:= TGutterObject.Create(nil);
    gi.Band:= 1; //Band index for Bookmarks
    gi.ImageIndex:= 11;
    gi.Hint:= DKLangConstW('SynR');
    gi.OnClick:= SyncEditClick;
    List.Add(gi);
    Exit;
  end;
end;

procedure TEditorFrame.SyncEditClick(Sender: TObject; Line: integer;
  Shift: TShiftState);
var
  idx: integer;
  memo: TSyntaxMemo;
begin
  Memo:= FocusedEditor;

  if memo.SelLength > 0 then
    memo.SyncEditing.AddCurSelection
  else
  begin
    idx:= memo.SyncEditing.RangeEndAtLine(Line);
    if idx <> -1 then
      memo.SyncEditing.Delete(idx);
  end;
end;

procedure TEditorFrame.EditorMasterExecuteCommand(Sender: TObject;
  Command: Integer; Data: Pointer; var Handled: Boolean);
begin
  TfmMain(Owner).SynExecuteCommand(Sender, Command, Data, Handled);
end;

//OLE color assignment
var
  CF_DRAGCOLOR: Word = 0;
const
  CFSTR_DRAGCOLOR = 'Datras Drag Color';

procedure TEditorFrame.EditorMasterOleDragEnter(Sender: TObject;
  const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer; var Handled: Boolean);
begin
  Handled:= GetFormatInfo(DataObject, CF_DRAGCOLOR);
end;

procedure TEditorFrame.EditorMasterOleDragOver(Sender: TObject; const DataObject: IDataObject;
  KeyState: Integer; Pt: TPoint; var Effect: Integer;
  var Handled: Boolean);
begin
  Handled:= GetFormatInfo(DataObject, CF_DRAGCOLOR);
end;

procedure TEditorFrame.EditorMasterOleDrop(Sender: TObject;
  const DataObject: IDataObject; KeyState: Integer; Pt: TPoint;
  var Effect: Integer; var Handled: Boolean);
var FormatInfo: TFormatEtc;
    Fg: Boolean;
    C: TColor;
    Medium: TStgMedium;
    Idx, W: integer;
    Data: Pointer;
begin
  with Sender as TSyntaxMemo do
   begin
     Handled:= GetFormatInfo(DataObject, CF_DRAGCOLOR, FormatInfo);
     if Handled then
       begin
         Fg:= (KeyState and MK_CONTROL) <> 0;
         Pt:= ScreenToClient(Pt);
         if DataObject.GetData(FormatInfo, Medium) = S_OK then
         begin
           Data:= GlobalLock(Medium.hGlobal);
           if Data <> nil then
           try
             Move(Data^, C, SizeOf(C));
           finally
             GlobalUnlock(Medium.hGlobal);
           end;
           ReleaseStgMedium(Medium);
         end;
         if Gutter.Visible and (Pt.X < Gutter.Width) then
           begin // Gutter
             if Fg then
               LineNumbers.Font.Color:= C
             else
              begin
               W:= 0;
               for Idx:= 0 to Gutter.Bands.Count - 1 do
                 begin
                   if (Pt.X >= W) and (Pt.X < W + Gutter.Bands[Idx].Width) then
                     begin
                       if Gutter.Bands[Idx].Color = clNone then Break
                        else Gutter.Bands[Idx].Color:= C;
                       Exit;
                     end;
                   Inc(W, Gutter.Bands[Idx].Width);
                 end;
               Gutter.Color:= C;
              end;
           end else
         if ShowRightMargin and (abs(Pt.X - RightMargin * DefTextExt.cx) < 2) then
           begin
             RightMarginColor:= C;
           end else
           begin
             Pt:= MouseToCaret(Pt.X, Pt.Y);
             if (SyntObj = nil) or
                (Pt.Y < 0) or (Pt.Y >= Lines.Count) or
                (Pt.X >= Lines.LineLength(Pt.Y)) then
               begin // Default editor style
                 if Fg then
                   Font.Color:= C
                 else
                   Color:= C;
               end else
               begin
                 Idx:= SyntObj.TokenAtPos(CaretPosToStrPos(Pt));
                 if (Idx <> -1) and (SyntObj.Tags[Idx].Rule <> nil) and
                    (SyntObj.Tags[Idx].Rule.Style <> nil) then
                   begin
                     if Fg then
                       SyntObj.Tags[Idx].Rule.Style.Font.Color:= C
                     else
                       SyntObj.Tags[Idx].Rule.Style.BgColor:= C;
                   end;
               end;
           end;
       end;
   end;
end;

procedure TEditorFrame.EditorMasterKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TfmMain(Owner).SynKeyDown(Sender, Key, Shift);
end;

procedure TEditorFrame.EditorScroll(Sender: TObject);
begin
  TfmMain(Owner).SynScroll(Sender);
  SyncMap;
end;

procedure TEditorFrame.EditorMasterGutterClick(Sender: TObject;
  Line: Integer; Buton: TMouseButton; Shift: TShiftState; XY: TPoint);
var
  Ed: TSyntaxMemo;
  ColX1, ColX2: Integer;
  //IsNums,
  IsBkmk: boolean;
begin
  Ed:= Sender as TSyntaxMemo;
  ColX1:= Ed.Gutter.Bands[0].Width;
  ColX2:= ColX1+Ed.Gutter.Bands[1].Width;
  //IsNums:= (XY.X<ColX1);
  IsBkmk:= (XY.X>=ColX1) and (XY.X<ColX2);

  {
  //doesnt work
  if IsNums and (Buton=mbLeft) then
    if (Line>=0) and (Line<Ed.Lines.Count) then
    begin
      Ed.SetSelection(Ed.CaretPosToStrPos(Point(0, Line)), Ed.Lines.LineSpace(Line));
      //TfmMain(Owner).UpdateStatusBar;
      Exit
    end;
    }

  if IsBkmk and (Buton=mbLeft) and (Shift=[ssLeft]) then
  begin
    DoBkToggle(Ed, Line);
    TfmMain(Owner).UpdateStatusBar;
    Exit
  end;
end;

procedure TEditorFrame.DoBkToggle(e: TCustomSyntaxMemo; line: integer);
var
  i, j, nBk: integer;
begin
    //delete?
    j:= e.BookmarkForLine(line);
    if j<>-1 then
    begin
      for i:=0 to e.BookmarkObj.Count-1 do
        if Assigned(e.BookmarkObj[i]) and (e.BookmarkObj[i].BmIndex=j) then
        begin
          EditorSlave.BookmarkObj.Delete(i);
          EditorMaster.BookmarkObj.Delete(i);
          EditorSlave.Invalidate;
          EditorMaster.Invalidate;
          Break;
        end;
      Exit;
    end;

    //find first non-busy bookmark
    nBk:= -1;
    for i:= Max2(e.BookmarkObj.Count, 10) to cMaxBk do
      if e.Bookmarks[i]<0 then
        begin nBk:= i; Break; end;

    if nBk<0 then
      begin MsgBeep; Exit; end;

    //remember col num?
    if line=e.CaretPos.Y then
      i:= e.CaretPos.X else i:= 0;

    j:= e.CaretPosToStrPos(Point(i, line));
    EditorSlave.Bookmarks[nBk]:= j;
    EditorMaster.Bookmarks[nBk]:= j;
end;

procedure TEditorFrame.EditorMasterGetTokenHint(Sender: TObject;
  TokenIndex: Integer; var HintText: String);
begin
  TfmMain(Owner).SynGetTokenHint(Sender,TokenIndex,HintText);
end;

procedure TEditorFrame.DoStartNotif;
begin
  FNotif.FileName:= FileName;
  FNotif.Timer.Enabled:= (FileName <> '') and (TfmMain(Owner).opReloadMode <> cReloadNone);
end;

procedure TEditorFrame.DoStopNotif;
begin
  FNotif.Timer.Enabled:= False;
  FNotif.FileName:= '';
end;

destructor TEditorFrame.Destroy;
begin
  FreeFtpInfo;

  ecSpellChecker.Active:= false;
  FNotif.Timer.Enabled:= false;
  FreeAndNil(FNotif);

  inherited;
end;

procedure TEditorFrame.FileReload(Sender: TObject);
  //msg about file deleted- not needed
  procedure Msg;
  begin
    //MsgWarn(WideFormat(DKLangConstW('MRelN'), [WideExtractFileName(FileName)]));
  end;
var
  Ln1, Ln2: integer;
  Cfm, WasEnd: boolean;
  r: TModalResult;
  Ed, Ed2: TSyntaxMemo;
  P1, P2: TPoint;
begin
  DoStopNotif;
  if not IsFileExist(FileName) then
  begin
    Msg;
    //mark deleted file as modified
    if TfmMain(Owner).opMarkDeletedAsModified then
      Modified:= true;
    EditorMasterChange(EditorMaster);
    Exit
  end;

  //special confirm on modified
  if Modified then
  begin
    Cfm:= MsgConfirm(WideFormat(DKLangConstW('MRelMod'), [WideExtractFileName(FileName)]), Handle);
  end
  else
  //normal confirm
  //use MsgBox for plugin, MsgDlg for exe
  if not TfmMain(Owner).SynExe then
  begin
    Cfm:= (TfmMain(Owner).opReloadMode = cReloadAuto) or
      MsgConfirm(WideFormat(DKLangConstW('MRel'), [WideExtractFileName(FileName)]), Handle);
  end
  else
  begin
    if FNotifAllYes then
      Cfm:= true
    else
    if FNotifAllNo then
      Cfm:= false
    else
    begin
      Cfm:= (TfmMain(Owner).opReloadMode = cReloadAuto);
      if not Cfm then
      begin
        MsgBeep;
        r:= WideMessageDlg(
          WideFormat(DKLangConstW('MRel'), [WideExtractFileName(FileName)]),
          mtWarning, [mbOk, mbCancel, mbYesToAll, mbNoToAll], 0);
        FNotifAllYes:= r = mrYesToAll;
        FNotifAllNo:= r = mrNoToAll;
        Cfm:= r in [mrOk, mrYesToAll];
      end;
    end;
  end;

  //if confirmed - reload
  if Cfm then
  begin
    if not IsFileExist(FileName) then
      begin Msg; Exit end; //file could be deleted while msg shown
    if Assigned(FOnSaveState) then
      FOnSaveState(Self);

    if EditorSlave.Focused then
      begin Ed:= EditorSlave; Ed2:= EditorMaster end
    else
      begin Ed:= EditorMaster; Ed2:= EditorSlave end;
    Ln1:= Ed.TopLine;
    Ln2:= Ed2.TopLine;
    P1:= Ed.CaretPos;
    P2:= Ed2.CaretPos;
    WasEnd:= Ed.CaretPos.Y = Ed.Lines.Count-1;

    //reload
    Screen.Cursor:= crHourGlass;
    try
      TextSource.Lines.SkipSignature:= True;
      TextSource.Lines.LoadFromFile(FileName);
      TextSource.Lines.SkipSignature:= False;
    finally
      Screen.Cursor:= crDefault;
    end;  

    if TfmMain(Owner).opFollowTail and WasEnd then
    begin
      //follow tail
      Ed.CaretPos:= Point(0, Ed.Lines.Count-1);
      Ed2.CaretPos:= P2;
    end
    else
    begin
      Ed.CaretPos:= P1;
      Ed2.CaretPos:= P2;
      Ed.TopLine:= Ln1;
      Ed2.TopLine:= Ln2;
    end;

    //reset marks/states
    EditorMaster.Lines.ResetLineStates;
    EditorSlave.Lines.ResetLineStates;
    EditorMaster.ResetSearchMarks;
    EditorSlave.ResetSearchMarks;

    //mark file as non-modified
    Modified:= false;
    ModifiedClr:= false;
    DoTitleChanged;
  end;

  DoStartNotif;
end;

procedure TEditorFrame.EditorMasterSelectionChanged(Sender: TObject);
var
  Ed: TSyntaxMemo;
  SelCleared: boolean;
begin
  Ed:= Sender as TSyntaxMemo;
  EditorMasterCaretPosChanged(Sender);

  SelCleared:= FSelPresent and not Ed.HaveSelection;
  FSelPresent:= Ed.HaveSelection;

  if TfmMain(Owner).opHiliteSmart then
  begin
    if Ed.HaveSelection then
      TfmMain(Owner).TimerSel.Enabled:= true;
    if SelCleared then
    begin
      Ed.ResetSearchMarks;
      UpdateMap(Ed);
    end;
  end;    
end;

procedure TEditorFrame.EditorMasterZoom(Sender: TObject);
begin
  with Sender as TSyntaxMemo do
  begin
    HorzRuler.Height:=
      5 + Round(Abs(HorzRuler.Font.Height) * Zoom / 100);
  end;
  UpdateGutterWidth(Sender);
end;

procedure TEditorFrame.UpdateGutterWidth(Sender: TObject);
const
  cSpace = 10; //addition to line-numbers band width
begin
  if Assigned(Parent) then //needed for Gutter.Bands[].Width:=...
    with Sender as TSyntaxMemo do
      if Gutter.Bands[LineNumbers.Band].Width>0 then
      begin
        Canvas.Font.Assign(LineNumbers.Font);
        Gutter.Bands[LineNumbers.Band].Width:=
          Canvas.TextWidth(IntToStr(Max(Lines.Count, 10))) + cSpace;
      end;
end;

procedure TEditorFrame.SetSplitPos(const F: Double);
begin
  if (F < 100.0) then
  begin
    FSplitPos:= F;
    SplitterEds.Visible:= F>1.0;
    if FSplitHorz then
    begin
      SplitterEds.Top:= 0;
      EditorSlave.Height:= Abs(Trunc((Self.Height - SplitterEds.Height) * F / 100.0));
    end
    else
    begin
      SplitterEds.Left:= 0;
      EditorSlave.Width:= Abs(Trunc((Self.Width - SplitterEds.Width) * F / 100.0));
    end;
  end;
end;

procedure TEditorFrame.SetSplitHorz(Value: boolean);
begin
  FSplitHorz:= Value;
  if FSplitHorz then
  begin
    EditorSlave.Align:= alBottom;
    SplitterEds.Align:= alBottom;
    SplitterEds.Top:= 0;
  end
  else
  begin
    EditorSlave.Align:= alRight;
    SplitterEds.Align:= alRight;
    SplitterEds.Left:= 0;
  end;
  SplitPos:= SplitPos;
end;

procedure TEditorFrame.SplitterEdsMoved(Sender: TObject);
begin
  if FSplitHorz then
    FSplitPos:= EditorSlave.Height * 100 / (Self.Height - SplitterEds.Height)
  else
    FSplitPos:= EditorSlave.Width * 100 / (Self.Width - SplitterEds.Width);
end;

function TEditorFrame.IsSplitted: boolean;
begin
  {
  if SplitHorz then
    Result:= SplitterEds.Top > 0
  else
    Result:= SplitterEds.Left > 1; //minimal Left is 0 and 1
    }
  Result:= FSplitPos > 1.0;  
end;

procedure TEditorFrame.ToggleSplitted;
begin
  if IsSplitted then
  begin
    SplitPos:= 0.0;
    with EditorMaster do
      if CanFocus then SetFocus;
  end
  else
    SplitPos:= 50.0;
end;

procedure TEditorFrame.TBXItemSplitHorzClick(Sender: TObject);
begin
  SplitHorz:= not SplitHorz;
end;

procedure TEditorFrame.PopupSplitEditorsPopup(Sender: TObject);
begin
  TbxItemSplitHorz.Checked:= SplitHorz;
  TbxItemSplitHorz.Caption:= TfmMain(Owner).TBXItemSpHorz.Caption;
  TbxItemSplitCaption.Caption:= DKLangConstW('Split_Ed');
  TbxItemSplitCancel.Caption:= DKLangConstW('Split_Cancel');
end;

procedure TEditorFrame.TBXItemSplit20_80Click(Sender: TObject);
begin
  SplitPos:= 80.0;
end;

procedure TEditorFrame.TBXItemSplit30_70Click(Sender: TObject);
begin
  SplitPos:= 70.0;
end;

procedure TEditorFrame.TBXItemSplit40_60Click(Sender: TObject);
begin
  SplitPos:= 60.0;
end;

procedure TEditorFrame.TBXItemSplit50_50Click(Sender: TObject);
begin
  SplitPos:= 50.0;
end;

procedure TEditorFrame.TBXItemSplit60_40Click(Sender: TObject);
begin
  SplitPos:= 40.0;
end;

procedure TEditorFrame.TBXItemSplit70_30Click(Sender: TObject);
begin
  SplitPos:= 30.0;
end;

procedure TEditorFrame.TBXItemSplit80_20Click(Sender: TObject);
begin
  SplitPos:= 20.0;
end;

procedure TEditorFrame.SplitterDblClick(Sender: TObject);
begin
  if IsSplitted then
    SplitPos:= 0.0
  else
    SplitPos:= 50.0;  
end;


function TEditorFrame.IsFtp: boolean;
begin
  Result:= FFtpInfoPtr<>nil;
end;

procedure TEditorFrame.FreeFtpInfo;
begin
  if FFtpInfoPtr<>nil then
  begin
    FreeMem(FFtpInfoPtr);
    FFtpInfoPtr:= nil;
    FFtpInfoSize:= 0;
  end;
end;

procedure TEditorFrame.SetFtpInfo(AInfoPtr: Pointer; AInfoSize: Integer);
begin
  FreeFtpInfo;
  if (AInfoPtr=nil) or (AInfoSize=0) then Exit;

  FFtpInfoSize:= AInfoSize;
  GetMem(FFtpInfoPtr, FFtpInfoSize);
  Move(AInfoPtr^, FFtpInfoPtr^, FFtpInfoSize);

  DoTitleChanged; //to show more spaces on tab
end;

procedure TEditorFrame.SetShowMap(V: boolean);
begin
  PanelMap.Visible:= V;
end;

function TEditorFrame.GetShowMap: boolean;
begin
  Result:= PanelMap.Visible;
end;

function TEditorFrame.GetMapLine(X, Y: Integer): Integer;
begin
  Result:= Int64(TextSource.Lines.Count) * Y div PanelMap.Height;
end;

procedure TEditorFrame.PanelMapMouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var
  N: Integer;
begin
  N:= GetMapLine(X, Y);
  TfmMain(Owner).SetHint(WideFormat(DKLangConstW('zMLine'), [N+1]));
  if ssLeft in Shift then
    PanelMapMouseDown(Self, mbLeft, Shift, X, Y);
end;

type
  TecSpelLCheckerCrack = class(TecSpellChecker);

procedure TEditorFrame.UpdateMap(Ed: TSyntaxMemo);
var
  LinesMarked: TList;
  LinesSpell: TList;
  //
  function IsSearchMarked(NLine: Integer): boolean;
  begin
    Result:= LinesMarked.IndexOf(Pointer(NLine)) >= 0;
  end;
  //
  function IsSpellMarked(NLine: Integer): boolean;
  begin
    Result:= LinesSpell.IndexOf(Pointer(NLine)) >= 0;
  end;
  //
const
  cStateColumnSize = 3; //width of line-state column
  cMinHeight = 2; //min height of frame rect
var
  C: TCanvas;
  NCnt, NCliWidth, NCliHeight: Integer;
  i, N1, N2: Integer; //px coord of current line
  N1_Frame, N2_Frame: Integer; //px coord of visible frame
  NLineTop, NLineBottom: Integer; //number of top/bottom visible lines
  AColor: TColor;
begin
  if not PanelMap.Visible then Exit;

  C:= PanelMap.Canvas;
  NCliWidth:= PanelMap.ClientWidth;
  NCliHeight:= PanelMap.ClientHeight;

  //draw backgnd
  C.Brush.Color:= clBtnFace;
  C.FillRect(Rect(0, 0, NCliWidth, NCliHeight));

  NCnt:= TextSource.Lines.Count;
  if NCnt=0 then Exit;

  //draw current frame
  NLineTop:= Ed.TopLine;
  NLineBottom:= Ed.MouseToCaret(0, Ed.ClientHeight-1).Y+1;
    //Ed.TopLine+ Ed.VisibleLines

  N1_Frame:= Int64(NCliHeight)*NLineTop div NCnt;
  N2_Frame:= Int64(NCliHeight)*NLineBottom div NCnt;
  //make frame height not less than Npx
  if N2_Frame<N1_Frame+cMinHeight then
    N2_Frame:= N1_Frame+cMinHeight;

  C.Brush.Color:= FMapColor;
  C.FillRect(Rect(0, N1_Frame, NCliHeight, N2_Frame));

  LinesMarked:= TList.Create;
  LinesSpell:= TList.Create;
  try
    //fill list of marked line numbers
    with Ed.SearchMarks do
      for i:= 0 to Count-1 do
      begin
        N1:= Ed.StrPosToCaretPos(Items[i].StartPos).Y;
        LinesMarked.Add(Pointer(N1));
      end;

    //fill list of mis-spelled line numbers
    with TecSpellCheckerCrack(ecSpellChecker) do
      for i:= 0 to FRanges.Count-1 do
      begin
        N1:= Ed.StrPosToCaretPos(FRanges[i].StartPos).Y;
        LinesSpell.Add(Pointer(N1));
      end;

    //draw line states
    for i:= 0 to NCnt-1 do
    begin
      case TextSource.Lines.LineState[i] of
        lsModified: AColor:= Ed.LineStateDisplay.ModifiedColor;
        lsNew:      AColor:= Ed.LineStateDisplay.NewColor;
        lsSaved:    AColor:= Ed.LineStateDisplay.SavedColor;
        else        AColor:= clNone;
      end;

      N1:= Int64(NCliHeight)*i div NCnt;
      N2:= Int64(NCliHeight)*(i+1) div NCnt;
      N2:= Max(N2, N1+2); //minimal mark height is 2px

      //hilite line states
      if AColor<>clNone then
      begin
        C.Brush.Color:= AColor;
        C.FillRect(Rect(0, N1, cStateColumnSize, N2));
      end;

      //hilite spell marks
      if IsSpellMarked(i) then
      begin
        C.Brush.Color:= clRed;
        C.FillRect(Rect(NCliWidth-cStateColumnSize, N1, NCliWidth, N2));
      end;

      //hilite search marks
      if IsSearchMarked(i) then
      begin
        C.Brush.Color:= TfmMain(Owner).opColorMapMarks;
          //Ed.DefaultStyles.SearchMark.BgColor;
        C.FillRect(Rect(NCliWidth-cStateColumnSize, N1, NCliWidth, N2));
      end;
    end;
  finally
    FreeAndNil(LinesSpell);
    FreeAndNil(LinesMarked);
  end;
end;


procedure TEditorFrame.TimerMapTimer(Sender: TObject);
begin
  TimerMap.Enabled:= false;
  UpdateMap(FocusedEditor);
end;

procedure TEditorFrame.SetMapColor(C: TColor);
begin
  FMapColor:= C;
  SyncMap;
end;

procedure TEditorFrame.PanelMapPaint(Sender: TObject);
begin
  if TextSource.Lines.Count>cManyLines then
    with PanelMap do
    begin
      Canvas.Brush.Color:= clBtnFace;
      Canvas.FillRect(Rect(0, 0, ClientWidth, ClientHeight));
    end;
  SyncMap;
end;

procedure TEditorFrame.PanelMapMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  NCur, NTop: Integer;
  Ed: TSyntaxMemo;
begin
  Ed:= FocusedEditor;
  NCur:= GetMapLine(X, Y);
  NTop:= NCur - Ed.VisibleLines div 3; //center clicked point in editor
  if NTop<0 then NTop:= 0;

  Ed.TopLine:= NTop;
  Ed.CaretPos:= Point(0, NCur);
  UpdateMap(Ed);
end;

procedure TEditorFrame.EditorShowHint(Sender: TObject;
  const HintStr: string;
  var HintObj: THintWindow);
begin
  opImageHintColorFont:= EditorMaster.HintProps.Font.Color;
  opImageHintColorBG:= EditorMaster.HintProps.Color;

  if IsImageHint(HintStr) then
  begin
    FileNameConverterImageToBmp:= ExtractFilePath(GetModuleName(HInstance)) + 'Tools\ImageToBmp.exe';
    HintObj:= TGraphicHintWindow.Create(Self);
    HintObj.Color:= opImageHintColorBG;
  end
  else
  if SBegin(HintStr, cColorPrefix) then
  begin
    HintObj:= TColorHintWindow.Create(Self);
    HintObj.Color:= opImageHintColorBG;
  end;
end;

procedure TEditorFrame.ecSpellCheckerCheckWord(Sender: TObject;
  const AWord: WideString; APos: Integer; var Valid: Boolean);
begin
  TfmMain(Owner).SynSpellCheckerCheckWord(Self, AWord, APos, Valid);
end;

procedure TEditorFrame.SetSpell(Value: boolean);
begin
  if FSpell<>Value then
  begin
    FSpell:= Value;
    ecSpellChecker.Active:= FSpell;
    //also update micromap after a delay
    TimerMap.Enabled:= true;
  end;
end;

procedure TEditorFrame.EditorMasterContextPopup(Sender: TObject;
  MousePos: TPoint; var Handled: Boolean);
begin
  //needed to show Gutter menu?
  TfmMain(Owner).SynContextGutterPopup(Sender, MousePos, Handled);
  if Handled then Exit;

  //needed to show spell-check menu?
  if not FSpell then
    begin Handled:= false; Exit end;

  TfmMain(Owner).SynContextPopup(Self, MousePos, Handled);
  if Handled then
  begin
    ecSpellChecker.Active:= false;
    ecSpellChecker.Active:= true;
    TimerMap.Enabled:= true;
  end;
end;

function TEditorFrame.IsEditorPosMisspelled(APos: Integer): boolean;
var
  i, NStart, NEnd: Integer;
begin
  Result:= false;
  if not FSpell then Exit;
  with TecSpellCheckerCrack(ecSpellChecker) do
    for i:= 0 to FRanges.Count-1 do
    begin
      NStart:= FRanges[i].StartPos;
      NEnd:= FRanges[i].EndPos;
      if (APos>=NStart) and (APos<NEnd) then
      begin
        Result:= true;
        Break
      end;
    end;
end;

function TEditorFrame.DoSpellContinue(AFromPos: Integer): Integer;
var
  i, NStart: Integer;
begin
  Result:= -1;
  if not FSpell then Exit;
  with TecSpellCheckerCrack(ecSpellChecker) do
    for i:= 0 to FRanges.Count-1 do
    begin
      NStart:= FRanges[i].StartPos;
      //NEnd:= FRanges[i].EndPos;
      if (NStart>=AFromPos) then
      begin
        Result:= NStart;
        Break
      end;
    end;
end;

procedure TEditorFrame.EditorMasterFinishAnalysis(Sender: TObject);
begin
  if not FCollapsedRestored then
  begin
    if FCollapsedString<>'' then
      EditorSetCollapsedRanges(EditorMaster, FCollapsedString);
    FCollapsedString:= '';
    FCollapsedRestored:= true;
  end;
end;

procedure TEditorFrame.EditorSlaveFinishAnalysis(Sender: TObject);
begin
  if not FCollapsedRestored2 then
  begin
    if FCollapsedString2<>'' then
      EditorSetCollapsedRanges(EditorSlave, FCollapsedString2);
    FCollapsedString2:= '';
    FCollapsedRestored2:= true;
  end;
end;

function TEditorFrame.GetCaretsEnabled: boolean;
begin
  Result:= EditorMaster.CaretsEnabled;
end;

function TEditorFrame.GetCaretsGutterBand: integer;
begin
  Result:= EditorMaster.CaretsGutterBand;
end;

function TEditorFrame.GetCaretsIndicator: integer;
begin
  Result:= Ord(EditorMaster.CaretsColorIndicator);
end;

procedure TEditorFrame.SetCaretsGutterBand(V: integer);
begin
  EditorMaster.CaretsGutterBand:= V;
  EditorSlave.CaretsGutterBand:= V;
end;

procedure TEditorFrame.SetCaretsEnabled(V: boolean);
begin
  EditorMaster.CaretsEnabled:= V;
  EditorSlave.CaretsEnabled:= V;
end;

procedure TEditorFrame.SetCaretsIndicator(V: integer);
begin
  EditorMaster.CaretsColorIndicator:= TCaretsColorIndicator(V);
  EditorSlave.CaretsColorIndicator:= TCaretsColorIndicator(V);
end;

function TEditorFrame.GetCaretsGutterColor: TColor;
begin
  Result:= EditorMaster.CaretsGutterColor;
end;

procedure TEditorFrame.SetCaretsGutterColor(V: TColor);
begin
  EditorMaster.CaretsGutterColor:= V;
  EditorSlave.CaretsGutterColor:= V;
end;

function TEditorFrame.SUrlAt(const Pnt: TPoint): Widestring;
var
  Ed: TSyntaxMemo;
  p: TPoint;
begin
  Result:= '';
  Ed:= EditorMaster;
  p:= HyperlinkHighlighter.HltRangeBndAt(Ed.CaretPosToStrPos(Pnt));
  if p.y > p.x then
    Result:= Copy(Ed.Lines.FText, p.x + 1, p.y - p.x);
end;

procedure TEditorFrame.EditorCtrlClick(Sender: TObject; const Pnt: TPoint; var Handled: boolean);
begin
  Handled:= SUrlAt(Pnt)<>'';
end;

function TEditorFrame.CaretsCount: integer;
begin
  Result:= FocusedEditor.CaretsCount;
end;

procedure TEditorFrame.CaretsProps(var NTop, NBottom: integer);
begin
  FocusedEditor.CaretsProps(NTop, NBottom);
end;

procedure TEditorFrame.TBXItemSplitCancelClick(Sender: TObject);
begin
  ToggleSplitted;
end;

procedure TEditorFrame.EditorMasterCheckChar(Sender: TObject; C: Word;
  var IsWord: Boolean);
var
  ch: WideChar;
begin
  ch:= WideChar(C);
  if not IsWord then
    IsWord:= (ch = '$') or (Pos(ch, TfmMain(Owner).opWordChars) > 0);
end;

initialization
  CF_DRAGCOLOR:= RegisterClipboardFormat(CFSTR_DRAGCOLOR);

end.
