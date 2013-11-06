unit unToolbarIcon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ImgList, ExtDlgs, ExtCtrls,
  TntForms,
  PngImage, DKLang;

var
  MsgIcoCannotSave: Widestring = 'Can''t save icon as png';
  MsgIcoBadSize: Widestring = 'Bad size (%dx%d) of image "%s"';
  MsgIcoBadDLL: Widestring = 'No icons in file "%s"';

type
  TfmToolbarIcon = class(TTntForm)
    GroupBox1: TGroupBox;
    btnDLL: TTntRadioButton;
    btnPNG: TTntRadioButton;
    btnBrowse: TTntButton;
    bOk: TTntButton;
    bCan: TTntButton;
    ListBox1: TListBox;
    ImageList32: TImageList;
    ImageList16: TImageList;
    OpenDialogDLL: TOpenDialog;
    OpenDialogPNG: TOpenDialog;
    Image1: TImage;
    LabelErr: TTntLabel;
    btnShell32: TTntButton;
    DKLanguageController1: TDKLanguageController;
    btnPngLink: TTntRadioButton;
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShell32Click(Sender: TObject);
    procedure TntFormDestroy(Sender: TObject);
  private
    { Private declarations }
    FFileNameDLL: string;
    FFileNamePNG: string;
    procedure OpnFile(const fn: string);
    procedure MsgError(const Msg: Widestring);
  public
    { Public declarations }
    FImage: TPngObject;
    FPngFilename: string;
    FSizeX,
    FSizeY: integer;
    FImagesDir: string;
  end;

implementation

uses
  CommCtrl,
  ATxSProc,
  ATxIconProc;

{$R *.dfm}

procedure TfmToolbarIcon.ListBox1MeasureItem(Control: TWinControl;
  Index: Integer; var Height: Integer);
begin
  Height:= 36;
end;

procedure TfmToolbarIcon.ListBox1DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var
  IL: TImageList;
begin
  with Listbox1 do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= clHighlight
    else
      Canvas.Brush.Color:= clWindow;
    Canvas.FillRect(Rect);

    if FSizeX=32 then
      IL:= ImageList32
    else
      IL:= ImageList16;
    IL.Draw(Canvas, Rect.Left+2, Rect.Top+2, Index);
  end;
end;

procedure TfmToolbarIcon.MsgError(const Msg: Widestring);
begin
  LabelErr.Caption:= Msg;
  LabelErr.Visible:= true;
  bOk.Enabled:= false;
end;

procedure TfmToolbarIcon.btnBrowseClick(Sender: TObject);
var
  OD: TOpenDialog;
begin
  if btnDLL.Checked then
    OD:= OpenDialogDLL
  else
    OD:= OpenDialogPNG;

  FPngFilename:= '';
  OD.FileName:= '';
  OD.InitialDir:= FImagesDir;
  if OD.Execute then
  begin
    OpnFile(OD.FileName);
    if btnPngLink.Checked then
      FPngFilename:= OD.Filename;
    FImagesDir:= ExtractFileDir(OD.FileName);
  end;
end;

procedure TfmToolbarIcon.OpnFile(const fn: string);
var
  i: integer;
begin
  if btnDLL.Checked then
    FFileNameDLL:= fn
  else
    FFileNamePNG:= fn;

  ListBox1.Visible:= btnDLL.Checked;
  Image1.Visible:= btnPNG.Checked or btnPngLink.Checked;
  LabelErr.Visible:= false;
  bOk.Enabled:= true;

  ImageList16.Clear;
  ImageList32.Clear;
  Listbox1.Invalidate;
  if FSizeX=32 then
    Listbox1.Columns:= 10
  else
    ListBox1.Columns:= 20;
  
  if btnDLL.Checked then
  begin
    LoadImageListFromDLL(ImageList16, ImageList32, FFileNameDLL);
    if ImageList32.Count=0 then
    begin
      MsgError(WideFormat(MsgIcoBadDLL, [ExtractFileName(FFileNameDLL)]));
      Exit
    end;
    for i:= 0 to ImageList32.Count-1 do
      Listbox1.Items.Add(IntToStr(i));
    Listbox1.ItemIndex:= 0;
  end
  else
    with Image1 do
    begin
      Picture.LoadFromFile(FFileNamePNG);
      if (Picture.Width<>FSizeX) or
        (Picture.Height<>FSizeY) then
      begin
        MsgError(WideFormat(MsgIcoBadSize,
          [Picture.Width, Picture.Height, ExtractFileName(FFileNamePNG)]));
        Exit;  
      end;
    end;
end;

procedure TfmToolbarIcon.FormShow(Sender: TObject);
begin
  MsgIcoCannotSave:= DKLangConstW('zMIcoCantsave');
  MsgIcoBadSize:= DKLangConstW('zMIcoBadsize');
  MsgIcoBadDLL:= DKLangConstW('zMIcoBadDll');

  if (FSizeX=0) or (FSizeY=0) then
    raise Exception.Create('Size not set');

  btnDLL.Enabled:= ((FSizeX=16) and (FSizeY=16)) or ((FSizeX=32) and (FSizeY=32));
  btnShell32.Enabled:= btnDLL.Enabled;
  if not btnDLL.Enabled then
    btnPNG.Checked:= true;
end;

procedure TfmToolbarIcon.bOkClick(Sender: TObject);
var
  fn_png: string;
begin
  fn_png:= FTempDir + '\icon.png';
  DeleteFile(fn_png);

  if btnDLL.Checked then
  begin
    if Listbox1.ItemIndex>=0 then
      SaveIconFromDllToPng(FFileNameDLL, Listbox1.ItemIndex, FSizeX=16, fn_png);
  end
  else
    CopyFile(PChar(string(FFileNamePNG)), PChar(string(fn_png)), false);

  if FileExists(fn_png) then
  begin
    FImage.LoadFromFile(fn_png);
    DeleteFile(fn_png);
    ModalResult:= mrOk;
  end
  else
    //MessageBoxW(Handle, PWChar(Widestring(MsgIcoCannotSave)), 'SynWrite', mb_ok or mb_iconerror);
    MsgError(MsgIcoCannotSave);
end;

procedure TfmToolbarIcon.FormCreate(Sender: TObject);
begin
  FImage:= TPngObject.Create;
  FPngFilename:= '';
end;

procedure TfmToolbarIcon.btnShell32Click(Sender: TObject);
begin
  if btnDll.Checked then
    OpnFile(SExpandVars('%windir%\system32\shell32.dll'))
  else
    MessageBeep(mb_iconwarning);  
end;

procedure TfmToolbarIcon.TntFormDestroy(Sender: TObject);
begin
  if Assigned(FImage) then
    FreeAndNil(FImage);
end;

end.
