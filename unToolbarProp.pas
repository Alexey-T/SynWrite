unit unToolbarProp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Spin, ExtCtrls,
  TntForms, TntClasses,
  PngImage, ImgList, DKLang, Menus, TntMenus;

type
  TShowCmdListProc = function: string of object;
  TShowCmdHintProc = function(Cmd: string): Widestring of object;
  TGetExtToolsProc = procedure(List: TTntStringList) of object;

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
    Label6: TTntLabel;
    edCaption: TTntEdit;
    Label1: TTntLabel;
    LabelSize: TTntLabel;
    btnIconSize: TTntButton;
    btnAdd: TTntButton;
    btnDel: TTntButton;
    btnSep: TTntButton;
    DKLanguageController1: TDKLanguageController;
    btnBrowseExtTool: TTntButton;
    MenuTool: TTntPopupMenu;
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
  private
    { Private declarations }
    procedure MenuToolClick(Sender: TObject);
    procedure SwapBtn(var BFrom, BTo: TToolbarProp);
    procedure ClearBtn(var Btn: TToolbarProp);
    function CanAddBtn: boolean;
    procedure MoveBtn(NFrom, NTo: integer);
  public
    { Public declarations }
    //FCaption: Widestring;
    FSizeX,
    FSizeY: integer;
    FToolbar: TToolbarProps;
    FToolbarIni: string;
    FToolbarIndex: integer;
    FShowCmdList: TShowCmdListProc;
    FShowCmdHint: TShowCmdHintProc;
    FGetExtTools: TGetExtToolsProc;
  end;

implementation

uses
  Types, IniFiles,
  ATxSProc,
  unToolbarSize, unToolbarIcon;

{$R *.dfm}

procedure TfmToolbarProp.FormShow(Sender: TObject);
var
  sCmd, sHint, sFN: Widestring;
  i: Integer;
begin
  LabelSize.Caption:= Format('%dx%d', [FSizeX, FSizeY]);
  with Listbox1 do
  begin
    Items.Clear;
    Columns:= ClientWidth div (FSizeX+4);
    Invalidate;
  end;

  with TIniFile.Create(FToolbarIni) do
  try
    //edCaption.Text:= UTF8Decode(ReadString(IntToStr(FToolbarIndex), 'cap', IntToStr(FToolbarIndex)));
    for i:= 0 to High(FToolbar) do
    begin
      sCmd:= UTF8Decode(ReadString(IntToStr(FToolbarIndex), IntToStr(i)+'c', ''));
      sHint:= UTF8Decode(ReadString(IntToStr(FToolbarIndex), IntToStr(i)+'h', ''));
      sFN:= ReadString(IntToStr(FToolbarIndex), IntToStr(i)+'i', '');
      SReplaceAllW(sFN, '{ini}', ExtractFileDir(FToolbarIni));

      if sCmd='' then Break;
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
    if (ShowModal=mrOk) and Assigned(FImage) then
    begin
      dir:= ExtractFileDir(FToolbarIni)+'\Ico';
      CreateDir(dir);
      if PromptForFileName(fn, '*.png|*.png', 'png', '', dir, true) then
      begin
        if Assigned(FToolbar[AIndex].FImage) then
          FreeAndNil(FToolbar[AIndex].FImage);
        FToolbar[AIndex].FImage:= FImage;
        FToolbar[AIndex].FImageFN:= fn;
        FImage.SaveToFile(fn);
        Self.Listbox1.Invalidate;
      end;
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
  btnBrowseCmd.Enabled:= en;
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
    //WriteString(IntToStr(FToolbarIndex), 'cap', UTF8Encode(edCaption.Text));
    WriteInteger(IntToStr(FToolbarIndex), 'ix', FSizeX);
    WriteInteger(IntToStr(FToolbarIndex), 'iy', FSizeY);
    for i:= 0 to High(FToolbar) do
      if FToolbar[i].FCmd<>'' then
      begin
        WriteString(IntToStr(FToolbarIndex), IntToStr(i)+'c', UTF8Encode(FToolbar[i].FCmd));
        WriteString(IntToStr(FToolbarIndex), IntToStr(i)+'h', UTF8Encode(FToolbar[i].FHint));

        fn:= FToolbar[i].FImageFN;
        SReplaceAllW(fn, ExtractFileDir(FToolbarIni), '{ini}');
        WriteString(IntToStr(FToolbarIndex), IntToStr(i)+'i', fn);
      end
      else
      begin
        DeleteKey(IntToStr(FToolbarIndex), IntToStr(i)+'c');
        DeleteKey(IntToStr(FToolbarIndex), IntToStr(i)+'h');
        DeleteKey(IntToStr(FToolbarIndex), IntToStr(i)+'i');
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
  if not Assigned(FGetExtTools) then Exit;
  L:= TTntStringList.Create;
  try
    FGetExtTools(L);
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

end.
