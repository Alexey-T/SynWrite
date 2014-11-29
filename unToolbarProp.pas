unit unToolbarProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Spin, ExtCtrls,
  TntForms, TntClasses,
  PngImage, ImgList, DKLang, Menus, TntMenus;

type
  TShowCmdListProc = function: string of object;
  TShowCmdHintProc = function(Cmd: Widestring): Widestring of object;
  TEnumExtProc = procedure(List: TTntStringList) of object;
  TEnumPyProc = procedure(List: TTntStringList) of object;

function DoShowToolbarProp(
  const AIni, AId: string;
  AShowCmdList: TShowCmdListProc;
  AShowCmdHint: TShowCmdHintProc;
  AEnumExt: TEnumExtProc;
  AEnumPy: TEnumPyProc;
  AForceSizeX,
  AForceSizeY: Integer;
  var AImageDir: string): boolean;

type
  TToolbarProp = record
    FHint,
    FCmd: Widestring;
    FImage: TPngObject;
    FImageFN: string;
  end;
  TToolbarProps = array[0..80] of TToolbarProp;

const
  cToolbarSep = '-';

type
  TfmToolbarProp = class(TTntForm)
    bOk: TTntButton;
    bCan: TTntButton;
    GroupBoxCmd: TTntGroupBox;
    ListBox1: TListBox;
    Label2: TTntLabel;
    LabelHint: TTntLabel;
    edHint: TTntEdit;
    LabelCmd: TTntLabel;
    edCmd: TTntEdit;
    LabelIcon: TTntLabel;
    btnBrowseIcon: TTntButton;
    btnBrowseCmd: TTntButton;
    GroupBoxProp: TTntGroupBox;
    Label1: TTntLabel;
    LabelSize: TTntLabel;
    btnIconSize: TTntButton;
    btnAdd: TTntButton;
    btnDel: TTntButton;
    btnSep: TTntButton;
    DKLanguageController1: TDKLanguageController;
    btnBrowseExtTool: TTntButton;
    MenuTool: TTntPopupMenu;
    btnBrowseMenu: TTntButton;
    btnBrowseMenuSys: TTntButton;
    MenuSys: TTntPopupMenu;
    mnuRecFiles: TTntMenuItem;
    mnuNewFile: TTntMenuItem;
    mnuRecColors: TTntMenuItem;
    mnuRecSessions: TTntMenuItem;
    mnuEncChange: TTntMenuItem;
    mnuEncConv: TTntMenuItem;
    mnuTidy: TTntMenuItem;
    mnuFolding: TTntMenuItem;
    mnuFoldLevel: TTntMenuItem;
    mnuNonPrint: TTntMenuItem;
    labInfo: TTntLabel;
    mnuConv: TTntMenuItem;
    mnuRecProjects: TTntMenuItem;
    btnBrowsePy: TTntButton;
    mnuPlugins: TTntMenuItem;
    btnRemoveIcon: TTntButton;
    mnuProjectTools: TTntMenuItem;
    mnuCase: TTntMenuItem;
    mnuBlanks: TTntMenuItem;
    mnuCarets: TTntMenuItem;
    mnuComments: TTntMenuItem;
    mnuWeb: TTntMenuItem;
    mnuAddons: TTntMenuItem;
    procedure FormShow(Sender: TObject);
    procedure btnIconSizeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnDelClick(Sender: TObject);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnBrowseIconClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure edHintChange(Sender: TObject);
    procedure btnSepClick(Sender: TObject);
    procedure ListBox1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure ListBox1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure bOkClick(Sender: TObject);
    procedure btnBrowseCmdClick(Sender: TObject);
    procedure btnBrowseExtToolClick(Sender: TObject);
    procedure btnBrowseMenuClick(Sender: TObject);
    procedure mnuRecFilesClick(Sender: TObject);
    procedure mnuNewFileClick(Sender: TObject);
    procedure btnBrowseMenuSysClick(Sender: TObject);
    procedure mnuRecColorsClick(Sender: TObject);
    procedure mnuRecSessionsClick(Sender: TObject);
    procedure mnuEncChangeClick(Sender: TObject);
    procedure mnuEncConvClick(Sender: TObject);
    procedure mnuTidyClick(Sender: TObject);
    procedure mnuFoldingClick(Sender: TObject);
    procedure mnuFoldLevelClick(Sender: TObject);
    procedure mnuNonPrintClick(Sender: TObject);
    procedure mnuConvClick(Sender: TObject);
    procedure mnuRecProjectsClick(Sender: TObject);
    procedure btnBrowsePyClick(Sender: TObject);
    procedure btnRemoveIconClick(Sender: TObject);
    procedure mnuPluginsClick(Sender: TObject);
    procedure mnuProjectToolsClick(Sender: TObject);
    procedure mnuCaseClick(Sender: TObject);
    procedure mnuBlanksClick(Sender: TObject);
    procedure mnuCaretsClick(Sender: TObject);
    procedure mnuCommentsClick(Sender: TObject);
    procedure mnuWebClick(Sender: TObject);
    procedure mnuAddonsClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoMenuSys(const Cmd, Hint: Widestring);
    procedure MenuToolClick(Sender: TObject);
    procedure MenuPyClick(Sender: TObject);
    procedure SwapBtn(var BFrom, BTo: TToolbarProp);
    procedure ClearBtn(var Btn: TToolbarProp);
    function CanAddBtn: boolean;
    procedure MoveBtn(NFrom, NTo: integer);
  public
    { Public declarations }
    FSizeX,
    FSizeY: integer;
    FImagesDir: string;
    FForceSizeX,
    FForceSizeY: integer;
    FToolbar: TToolbarProps;
    FToolbarIni: string;
    FToolbarId: string;
    FShowCmdList: TShowCmdListProc;
    FShowCmdHint: TShowCmdHintProc;
    FEnumExt: TEnumExtProc;
    FGetPyTools: TEnumPyProc;
  end;

implementation

uses
  Types, IniFiles,
  ATxSProc,
  unProc,
  unToolbarSize,
  unToolbarIcon;

{$R *.dfm}

procedure TfmToolbarProp.FormShow(Sender: TObject);
var
  sCmd, sHint, sFN: Widestring;
  i: Integer;
const
  sSep = ' - ';
begin
  //correct caption
  sCmd:= Caption;
  SDeleteFromW(sCmd, sSep);
  Caption:= sCmd + sSep + FToolbarId;

  //disable icon sizes
  if (FForceSizeX>0) and (FForceSizeY>0) then
  begin
    FSizeX:= FForceSizeX;
    FSizeY:= FForceSizeY;
    btnIconSize.Enabled:= false;
  end;

  LabelSize.Caption:= Format('%dx%d', [FSizeX, FSizeY]);
  with Listbox1 do
  begin
    Items.Clear;
    Columns:= ClientWidth div (FSizeX+4);
    Invalidate;
  end;

  with TIniFile.Create(FToolbarIni) do
  try
    for i:= 0 to High(FToolbar) do
    begin
      sCmd:= UTF8Decode(ReadString(FToolbarId, IntToStr(i)+'c', ''));
      sHint:= UTF8Decode(ReadString(FToolbarId, IntToStr(i)+'h', ''));
      sFN:= ReadString(FToolbarId, IntToStr(i)+'i', '');
      SReplaceAllW(sFN, '{ini}', ExtractFileDir(FToolbarIni));

      if (sCmd='') and (sHint='') and (sFN='') then Break;
      FToolbar[i].FCmd:= sCmd;
      FToolbar[i].FHint:= sHint;
      FToolbar[i].FImageFN:= sFN;
      if FileExists(sFN) then
      begin
        FToolbar[i].FImage:= TPngObject.Create;
        FToolbar[i].FImage.LoadFromFile(sFN);
      end;  
      Listbox1.Items.Add('');
      Listbox1.ItemIndex:= 0;
    end;
  finally
    Free
  end;

  Listbox1Click(Self);
end;

procedure TfmToolbarProp.btnIconSizeClick(Sender: TObject);
begin
  with TfmToolbarSize.Create(nil) do
  try
    if (FSizeX=16) and (FSizeY=16) then
      btn16.Checked:= true
    else
    if (FSizeX=32) and (FSizeY=32) then
      btn32.Checked:= true
    else
    begin
      btnSize.Checked:= true;
      edSizeX.Value:= FSizeX;
      edSizeY.Value:= FSizeY;
    end;  

    if ShowModal=mrOk then
    begin
      if btn16.Checked then
        begin FSizeX:= 16; FSizeY:= 16 end
      else
      if btn32.Checked then
        begin FSizeX:= 32; FSizeY:= 32 end
      else
        begin FSizeX:= edSizeX.Value; FSizeY:= edSizeY.Value end;
      FormShow(Self);  
    end;
  finally
    Free
  end;    
end;

procedure TfmToolbarProp.FormCreate(Sender: TObject);
begin
  FillChar(FToolbar, SizeOf(FToolbar), 0);

  with Listbox1 do
    ItemHeight:= ScaleFontSize(ItemHeight, Self);
end;

procedure TfmToolbarProp.FormDestroy(Sender: TObject);
var
  i: Integer;
begin
  for i:= Low(FToolbar) to High(FToolbar) do
    ClearBtn(FToolbar[i]);
end;

procedure TfmToolbarProp.btnAddClick(Sender: TObject);
begin
  if CanAddBtn then
    with Listbox1 do
    begin
      Items.Add('');
      ItemIndex:= Count-1;
      Listbox1Click(Self);
    end;
end;


procedure TfmToolbarProp.ClearBtn(var Btn: TToolbarProp);
begin
  with Btn do
  begin
    FHint:= '';
    FCmd:= '';
    FImageFN:= '';
    if Assigned(FImage) then
      FreeAndNil(FImage);
  end;
end;

function TfmToolbarProp.CanAddBtn: boolean;
begin
  Result:= Listbox1.Count<=High(FToolbar);
end;

procedure TfmToolbarProp.SwapBtn(var BFrom, BTo: TToolbarProp);
var
  B: TToolbarProp;
begin
  FillChar(B, SizeOf(B), 0);
  B.FHint:= BFrom.FHint;
  B.FCmd:= BFrom.FCmd;
  B.FImage:= BFrom.FImage;
  B.FImageFN:= BFrom.FImageFN;

  BFrom.FHint:= BTo.FHint;
  BFrom.FCmd:= BTo.FCmd;
  BFrom.FImage:= BTo.FImage;
  BFrom.FImageFN:= BTo.FImageFN;

  BTo.FHint:= B.FHint;
  BTo.FCmd:= B.FCmd;
  BTo.FImage:= B.FImage;
  BTo.FImageFN:= B.FImageFN;
end;

procedure TfmToolbarProp.btnDelClick(Sender: TObject);
var
  i, n, nLast: integer;
begin
  with Listbox1 do
    if ItemIndex>=0 then
    begin
      n:= ItemIndex;
      nLast:= Count-1;
      Items.Delete(n);

      for i:= n+1 to nLast do
        SwapBtn(FToolbar[i], FToolbar[i-1]);
      ClearBtn(FToolbar[nLast]);

      if n<Count then
        ItemIndex:= n
      else
      if Count>0 then
        ItemIndex:= n-1;
      Listbox1Click(Self);
    end;
end;

procedure TfmToolbarProp.ListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
const
  cNone = '?';
var
  AImage: TPngObject;
  IsSep: boolean;
begin
  with Listbox1 do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= clHighlight
    else
      Canvas.Brush.Color:= clWindow;
    Canvas.FillRect(Rect);

    if Index>High(FToolbar) then Exit;
    AImage:= FToolbar[Index].FImage;
    IsSep:= FToolbar[Index].FCmd = cToolbarSep;
    Rect.Bottom:= Rect.Top + FSizeY + 4;

    if IsSep then
    begin
      InflateRect(Rect, -1, -1);
      Canvas.Pen.Color:= clGray;
      Canvas.Pen.Width:= 3;
      Canvas.MoveTo((Rect.Left+Rect.Right) div 2, Rect.Top);
      Canvas.LineTo((Rect.Left+Rect.Right) div 2, Rect.Bottom);
    end
    else
    if Assigned(AImage) then
    begin
      Canvas.Draw(Rect.Left+2, Rect.Top+2, AImage);
    end
    else
    begin
      InflateRect(Rect, -1, -1);
      Canvas.Brush.Color:= clBtnFace;
      Canvas.FillRect(Rect);
      Canvas.Brush.Color:= clGray;
      Canvas.FrameRect(Rect);
      Canvas.Font.Name:= 'Tahoma';
      Canvas.Font.Size:= 8;
      Canvas.Font.Color:= clBlack;
      Canvas.Brush.Color:= clBtnFace;
      Canvas.TextOut(
        (Rect.Left+Rect.Right-Canvas.TextWidth(cNone)) div 2,
        (Rect.Top+Rect.Bottom-Canvas.TextHeight(cNone)) div 2,
        cNone);
    end;
  end;
end;

procedure TfmToolbarProp.btnBrowseIconClick(Sender: TObject);
var
  AIndex: integer;
  fn, dir: string;
begin
  AIndex:= ListBox1.ItemIndex;
  if not ((AIndex>=Low(FToolbar)) and (AIndex<=High(FToolbar))) then Exit;

  with TfmToolbarIcon.Create(nil) do
  try
    FSizeX:= Self.FSizeX;
    FSizeY:= Self.FSizeY;
    FImagesDir:= Self.FImagesDir;
    if ShowModal=mrOk then
    begin
      Self.FImagesDir:= FImagesDir;
      //get filename
      if FPngFilename<>'' then
        fn:= FPngFilename
      else
      begin
        dir:= ExtractFileDir(FToolbarIni)+'\Ico';
        CreateDir(dir);
        if not PromptForFileName(fn, '*.png|*.png', 'png', '', dir, true) then Exit;
      end;
      //apply got filename
      if Assigned(FToolbar[AIndex].FImage) then
        FreeAndNil(FToolbar[AIndex].FImage);
      FToolbar[AIndex].FImage:= TPngObject.Create;
      FToolbar[AIndex].FImage.Assign(FImage);
      FToolbar[AIndex].FImageFN:= fn;
      //save to png only if not linked
      if FPngFilename='' then
        FImage.SaveToFile(fn);
      Self.Listbox1.Invalidate;
    end;
  finally
    Free
  end;    
end;

procedure TfmToolbarProp.ListBox1Click(Sender: TObject);
var
  n: integer;
  en: boolean;
begin
  n:= Listbox1.ItemIndex;
  en:= (n>=0) and (n<=High(FToolbar));

  btnDel.Enabled:= en;
  edHint.Enabled:= en;
  edCmd.Enabled:= en;
  btnBrowseIcon.Enabled:= en;
  btnRemoveIcon.Enabled:= en;
  btnBrowseCmd.Enabled:= en;
  btnBrowseExtTool.Enabled:= en;
  btnBrowseMenu.Enabled:= en;
  btnBrowseMenuSys.Enabled:= en;
  btnBrowsePy.Enabled:= en;
  LabelHint.Enabled:= en;
  LabelCmd.Enabled:= en;
  LabelIcon.Enabled:= en;

  if en then
    with FToolbar[n] do
    begin
      edHint.Text:= FHint;
      if Assigned(FShowCmdHint) then
        edCmd.Text:= FShowCmdHint(FCmd)
      else
        edCmd.Text:= '?';  
    end;
end;

procedure TfmToolbarProp.edHintChange(Sender: TObject);
var n:Integer;
begin
  n:= Listbox1.ItemIndex;
  if (n>=0) and (n<=High(FToolbar)) then
  begin
    FToolbar[n].FHint:= edHint.Text;
  end;
end;

procedure TfmToolbarProp.btnSepClick(Sender: TObject);
begin
  if CanAddBtn then
  begin
    btnAddClick(Self);
    with FToolbar[Listbox1.Count-1] do
    begin
      FHint:= '';
      FCmd:= cToolbarSep;
    end;  
    Listbox1Click(Self);
  end;
end;

procedure TfmToolbarProp.ListBox1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
var
  Idx: integer;
  List: TListbox;
begin
  List:= Listbox1;
  if Source = List then
    begin
      Idx:= List.ItemAtPos(Point(X, Y), True);
      Accept:= (Idx <> -1) and (List.ItemIndex <> -1) and
                (Idx <> List.ItemIndex);
    end else
      Accept:= False;
end;

procedure TfmToolbarProp.ListBox1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  Idx, CurIdx: integer;
  List: TListbox;
begin
  List:= Listbox1;
  if Source = List then
    begin
      CurIdx:= List.ItemIndex;
      Idx:= List.ItemAtPos(Point(X, Y), True);
      MoveBtn(CurIdx, Idx);
      List.ItemIndex:= Idx;
      List.Invalidate;
    end;
end;

procedure TfmToolbarProp.MoveBtn(NFrom, NTo: integer);
var
  i: integer;
  B: TToolbarProp;
begin
  //showmessage(format('%d - %d', [NFrom, NTo]));
  FillChar(B, SizeOf(B), 0);
  SwapBtn(B, FToolbar[NFrom]);
  if NTo<NFrom then
  begin
    for i:= NFrom-1 downto NTo do
      SwapBtn(FToolbar[i], FToolbar[i+1]);
  end
  else
  begin
    for i:= NFrom+1 to NTo do
      SwapBtn(FToolbar[i], FToolbar[i-1]);
  end;
  SwapBtn(B, FToolbar[NTo]);
end;

procedure TfmToolbarProp.bOkClick(Sender: TObject);
var
  i: Integer;
  fn: Widestring;
begin
  with TIniFile.Create(FToolbarIni) do
  try
    WriteInteger(FToolbarId, 'ix', FSizeX);
    WriteInteger(FToolbarId, 'iy', FSizeY);
    for i:= 0 to High(FToolbar) do
      if (FToolbar[i].FCmd<>'') or
        (FToolbar[i].FHint<>'') or
        (FToolbar[i].FImageFN<>'') then
      begin
        WriteString(FToolbarId, IntToStr(i)+'c', UTF8Encode(FToolbar[i].FCmd));
        WriteString(FToolbarId, IntToStr(i)+'h', UTF8Encode(FToolbar[i].FHint));

        fn:= FToolbar[i].FImageFN;
        SReplaceAllW(fn, ExtractFileDir(FToolbarIni), '{ini}');
        WriteString(FToolbarId, IntToStr(i)+'i', fn);
      end
      else
      begin
        DeleteKey(FToolbarId, IntToStr(i)+'c');
        DeleteKey(FToolbarId, IntToStr(i)+'h');
        DeleteKey(FToolbarId, IntToStr(i)+'i');
      end;
  finally
    Free
  end;
end;

procedure TfmToolbarProp.btnBrowseCmdClick(Sender: TObject);
var
  Cmd: string;
  n: Integer;
  SameStr: boolean;
begin
  if Assigned(FShowCmdList) then
  begin
    Cmd:= FShowCmdList;
    if Cmd<>'' then
    begin
      n:= Listbox1.ItemIndex;
      FToolbar[n].FCmd:= Cmd;
      SameStr:= (edHint.Text='') or (edHint.Text=edCmd.Text);
      edCmd.Text:= FShowCmdHint(Cmd);
      if SameStr then
        edHint.Text:= edCmd.Text;
    end;
  end;
end;

procedure TfmToolbarProp.btnBrowseExtToolClick(Sender: TObject);
var
  L: TTntStringList;
  i: Integer;
  Item: TTntMenuItem;
  p: TPoint;
begin
  if not Assigned(FEnumExt) then Exit;
  L:= TTntStringList.Create;
  try
    FEnumExt(L);
    MenuTool.Items.Clear;
    for i:= 0 to L.Count-1 do
    begin
      Item:= TTntMenuItem.Create(Self);
      Item.Caption:= L[i];
      Item.OnClick:= MenuToolClick;
      MenuTool.Items.Add(Item);
    end;
  finally
    FreeAndNil(L)
  end;

  p:= btnBrowseExtTool.ClientToScreen(point(0, 0));
  if MenuTool.Items.Count>0 then
    MenuTool.Popup(p.x, p.y)
  else
    MessageBeep(mb_iconwarning);
end;

procedure TfmToolbarProp.MenuToolClick(Sender: TObject);
var
  S: Widestring;
  n: Integer;
begin
  S:= (Sender as TTntMenuItem).Caption;
  n:= Listbox1.ItemIndex;
  FToolbar[n].FCmd:= 'ext:'+S;
  FToolbar[n].FHint:= 'External tool: '+S;
  edCmd.Text:= FToolbar[n].FCmd;
  edHint.Text:= FToolbar[n].FHint;
end;

procedure TfmToolbarProp.MenuPyClick(Sender: TObject);
var
  S: Widestring;
  n: Integer;
begin
  S:= (Sender as TTntMenuItem).Caption;
  n:= Listbox1.ItemIndex;
  FToolbar[n].FCmd:= S;

  SDeleteToW(S, ':');
  FToolbar[n].FHint:= 'Plugin: '+S;

  edCmd.Text:= FToolbar[n].FCmd;
  edHint.Text:= FToolbar[n].FHint;
end;


function DoShowToolbarProp(
  const AIni, AId: string;
  AShowCmdList: TShowCmdListProc;
  AShowCmdHint: TShowCmdHintProc;
  AEnumExt: TEnumExtProc;
  AEnumPy: TEnumPyProc;
  AForceSizeX,
  AForceSizeY: Integer;
  var AImageDir: string): boolean;
begin
  with TfmToolbarProp.Create(nil) do
  try
    FToolbarIni:= AIni;
    FToolbarId:= AId;

    FForceSizeX:= AForceSizeX;
    FForceSizeY:= AForceSizeY;
    with TIniFile.Create(FToolbarIni) do
    try
      FSizeX:= ReadInteger(FToolbarId, 'ix', 32);
      FSizeY:= ReadInteger(FToolbarId, 'iy', 32);
    finally
      Free;
    end;

    FShowCmdList:= AShowCmdList;
    FShowCmdHint:= AShowCmdHint;
    FEnumExt:= AEnumExt;
    FGetPyTools:= AEnumPy;
    FImagesDir:= AImageDir;

    Result:= ShowModal=mrOk;
    if Result then
      AImageDir:= FImagesDir;
  finally
    Free;
  end;
end;

procedure TfmToolbarProp.btnBrowseMenuClick(Sender: TObject);
var
  N: Integer;
  MenuId, S: Widestring;
begin
  N:= Listbox1.ItemIndex;
  if N<0 then Exit;

  MenuId:= '';
  S:= FToolbar[N].FCmd;
  if SBegin(S, 'm:') then
  begin
    SDeleteToW(S, ':');
    MenuId:= S;
  end;

  if DoInputString('Menu id:', MenuId, '', '') and (MenuId<>'') then
  begin
    S:= 'm:'+MenuId;
    FToolbar[N].FCmd:= S;
    edCmd.Text:= S;
    DoShowToolbarProp(
      FToolbarIni,
      S,
      FShowCmdList,
      FShowCmdHint,
      FEnumExt,
      FGetPyTools,
      FSizeX,
      FSizeY,
      FImagesDir);
  end;
end;

procedure TfmToolbarProp.mnuRecFilesClick(Sender: TObject);
begin
  DoMenuSys('m:{recent}', mnuRecFiles.Caption);
end;

procedure TfmToolbarProp.mnuNewFileClick(Sender: TObject);
begin
  DoMenuSys('m:{new}', mnuNewFile.Caption);
end;

procedure TfmToolbarProp.mnuRecColorsClick(Sender: TObject);
begin
  DoMenuSys('m:{colors}', mnuRecColors.Caption);
end;

procedure TfmToolbarProp.DoMenuSys(const Cmd, Hint: Widestring);
var
  N: Integer;
begin
  N:= Listbox1.ItemIndex;
  if N<0 then Exit;
  FToolbar[N].FCmd:= Cmd;
  FToolbar[N].FHint:= Hint;
  edCmd.Text:= Cmd;
  edHint.Text:= Hint;
end;

procedure TfmToolbarProp.btnBrowseMenuSysClick(Sender: TObject);
var
  p: TPoint;
begin
  p:= btnBrowseMenuSys.ClientToScreen(Point(0, 0));
  MenuSys.Popup(p.x, p.y);
end;

procedure TfmToolbarProp.mnuRecSessionsClick(Sender: TObject);
begin
  DoMenuSys('m:{sess}', mnuRecSessions.Caption);
end;

procedure TfmToolbarProp.mnuEncChangeClick(Sender: TObject);
begin
  DoMenuSys('m:{enc-chg}', mnuEncChange.Caption);
end;

procedure TfmToolbarProp.mnuEncConvClick(Sender: TObject);
begin
  DoMenuSys('m:{enc-conv}', mnuEncConv.Caption);
end;

procedure TfmToolbarProp.mnuTidyClick(Sender: TObject);
begin
  DoMenuSys('m:{tidy}', mnuTidy.Caption);
end;

procedure TfmToolbarProp.mnuFoldingClick(Sender: TObject);
begin
  DoMenuSys('m:{folding}', mnuFolding.Caption);
end;

procedure TfmToolbarProp.mnuFoldLevelClick(Sender: TObject);
begin
  DoMenuSys('m:{foldlevel}', mnuFoldLevel.Caption);
end;

procedure TfmToolbarProp.mnuNonPrintClick(Sender: TObject);
begin
  DoMenuSys('m:{nonprint}', mnuNonPrint.Caption);
end;

procedure TfmToolbarProp.mnuConvClick(Sender: TObject);
begin
  DoMenuSys('m:{conv}', mnuConv.Caption);
end;

procedure TfmToolbarProp.mnuRecProjectsClick(Sender: TObject);
begin
  DoMenuSys('m:{projects}', mnuRecProjects.Caption);
end;

procedure TfmToolbarProp.btnBrowsePyClick(Sender: TObject);
var
  L: TTntStringList;
  i: Integer;
  Item: TTntMenuItem;
  p: TPoint;
begin
  if not Assigned(FGetPyTools) then Exit;
  L:= TTntStringList.Create;
  try
    FGetPyTools(L);
    MenuTool.Items.Clear;
    for i:= 0 to L.Count-1 do
    begin
      Item:= TTntMenuItem.Create(Self);
      Item.Caption:= L[i];
      Item.OnClick:= MenuPyClick;
      MenuTool.Items.Add(Item);
    end;
  finally
    FreeAndNil(L)
  end;

  p:= btnBrowsePy.ClientToScreen(point(0, 0));
  if MenuTool.Items.Count>0 then
    MenuTool.Popup(p.x, p.y)
  else
    MessageBeep(mb_iconwarning);
end;

procedure TfmToolbarProp.btnRemoveIconClick(Sender: TObject);
var
  AIndex: Integer;
begin
  AIndex:= ListBox1.ItemIndex;
  if not ((AIndex>=Low(FToolbar)) and (AIndex<=High(FToolbar))) then Exit;

  if Assigned(FToolbar[AIndex].FImage) then
    FreeAndNil(FToolbar[AIndex].FImage);
  FToolbar[AIndex].FImage:= nil;
  FToolbar[AIndex].FImageFN:= '';

  Self.Listbox1.Invalidate;
end;

procedure TfmToolbarProp.mnuPluginsClick(Sender: TObject);
begin
  DoMenuSys('m:{plugins}', mnuPlugins.Caption);
end;

procedure TfmToolbarProp.mnuProjectToolsClick(Sender: TObject);
begin
  DoMenuSys('m:{projtools}', mnuProjectTools.Caption);
end;

procedure TfmToolbarProp.mnuCaseClick(Sender: TObject);
begin
  DoMenuSys('m:{case}', mnuCase.Caption);
end;

procedure TfmToolbarProp.mnuBlanksClick(Sender: TObject);
begin
  DoMenuSys('m:{blank}', mnuBlanks.Caption);
end;

procedure TfmToolbarProp.mnuCommentsClick(Sender: TObject);
begin
  DoMenuSys('m:{cmt}', mnuComments.Caption);
end;

procedure TfmToolbarProp.mnuCaretsClick(Sender: TObject);
begin
  DoMenuSys('m:{carets}', mnuCarets.Caption);
end;

procedure TfmToolbarProp.mnuWebClick(Sender: TObject);
begin
  DoMenuSys('m:{websearch}', mnuWeb.Caption);
end;

procedure TfmToolbarProp.mnuAddonsClick(Sender: TObject);
begin
  DoMenuSys('m:{addman}', mnuAddons.Caption);
end;

end.
