unit unToolbarIcon;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, ImgList, ExtDlgs, ExtCtrls,
  TntForms,
  PngImage;

const
  MsgIcoCannotSave = 'Can''t save icon as png';

type
  TfmToolbarIcon = class(TTntForm)
    GroupBox1: TGroupBox;
    btnDLL: TTntRadioButton;
    btnPNG: TTntRadioButton;
    btnBrowse: TTntButton;
    bOk: TTntButton;
    bCan: TTntButton;
    ListBox1: TListBox;
    Label2: TTntLabel;
    ImageList32: TImageList;
    ImageList16: TImageList;
    OpenDialogDLL: TOpenDialog;
    OpenDialogPNG: TOpenDialog;
    Image1: TImage;
    LabelErr: TTntLabel;
    btnShell32: TTntButton;
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnBrowseClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure bOkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnShell32Click(Sender: TObject);
  private
    { Private declarations }
    FFileNameDLL: string;
    FFileNamePNG: string;
    procedure OpnFile(const fn: string);
    procedure Err(const Msg: string);
  public
    { Public declarations }
    FImage: TPngObject;
    FSizeX,
    FSizeY: integer;
  end;

var
  MsgIcoBadSize: Widestring = 'Bad size (%dx%d) of image "%s"';
  MsgIcoBadDLL: Widestring = 'No icons in file "%s"';

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

procedure TfmToolbarIcon.Err(const Msg: string);
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
  OD.FileName:= '';
  OD.InitialDir:= 'C:\';
  if not OD.Execute then Exit;
  OpnFile(OD.FileName);
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
  Image1.Visible:= btnPNG.Checked;
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
      Err(Format(MsgIcoBadDLL, [ExtractFileName(FFileNameDLL)]));
      Exit
    end;
    for i:= 0 to ImageList32.Count-1 do
      Listbox1.Items.Add(IntToStr(i));
    Listbox1.ItemIndex:= 0;
  end
  else
  if btnPNG.Checked then
    with Image1 do
    begin
      Picture.LoadFromFile(FFileNamePNG);
      if (Picture.Width<>FSizeX) or
        (Picture.Height<>FSizeY) then
      begin
        Err(Format(MsgIcoBadSize,
          [Picture.Width, Picture.Height, ExtractFileName(FFileNamePNG)]));
        Exit;  
      end;
    end;
end;

procedure TfmToolbarIcon.FormShow(Sender: TObject);
begin
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
  fn_png:= SExpandVars('%temp%\icon.png');
  DeleteFile(fn_png);

  if btnDLL.Checked then
    SaveIconFromDllToPng(FFileNameDLL, Listbox1.ItemIndex, FSizeX=16, fn_png)
  else
    CopyFile(PChar(FFileNamePNG), PChar(fn_png), false);
    
  if FileExists(fn_png) then
  begin
    FImage:= TPngObject.Create;
    FImage.LoadFromFile(fn_png);
    DeleteFile(fn_png);
    ModalResult:= mrOk;
  end
  else
    Application.MessageBox(MsgIcoCannotSave, 'SynWrite', mb_ok or mb_iconerror);
end;

procedure TfmToolbarIcon.FormCreate(Sender: TObject);
begin
  FImage:= nil;
end;

procedure TfmToolbarIcon.btnShell32Click(Sender: TObject);
begin
  OpnFile(SExpandVars('%windir%\system32\shell32.dll'));
end;

end.
