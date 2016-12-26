unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ImgList, TB2Item, TBX, TB2Dock, TB2Toolbar, XPMan,
  TBXGraphics;

type
  TForm1 = class(TForm)
    Button1: TButton;
    ImageList16: TImageList;
    ImageList32: TImageList;
    TBToolbar1: TTBToolbar;
    TBXItem2: TTBXItem;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    TBXItem1: TTBXItem;
    XPManifest1: TXPManifest;
    TBImageList1: TTBImageList;
    ListBox1: TListBox;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    TBXItem5: TTBXItem;
    TBXItem6: TTBXItem;
    TBXItem7: TTBXItem;
    Button5: TButton;
    TBXImageList1: TTBXImageList;
    TBToolbar2: TTBToolbar;
    TBXItem8: TTBXItem;
    TBXItem9: TTBXItem;
    TBXItem10: TTBXItem;
    TBXItem11: TTBXItem;
    TBXItem12: TTBXItem;
    TBXItem13: TTBXItem;
    TBXItem14: TTBXItem;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure ListBox1MeasureItem(Control: TWinControl; Index: Integer;
      var Height: Integer);
    procedure ListBox1DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure TBXItem4Click(Sender: TObject);
    procedure TBXItem2Click(Sender: TObject);
    procedure TBXItem3Click(Sender: TObject);
    procedure TBXItem1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses CommCtrl, ShellAPI,
TbxImgListEdit,
atxFProc,
atxIconProc,
pngimage;
{$R *.dfm}



procedure TForm1.Button1Click(Sender: TObject);
var i: integer;
begin
  LoadImageListFromDLL(ImageList16, ImageList32, 'shell32.dll');

  TBImageList1.Clear;
  TBImageList1.AddImages(ImageList32);

  for i:= 0 to 12 do
  begin
    ImageList32.Draw(Canvas, i*32, 10, i);
    ImageList16.Draw(Canvas, i*32, 50, i);
  end;

  for i:= 0 to ImageList32.Count-1 do
    Listbox1.Items.Add(IntToStr(i));
end;

procedure TForm1.ListBox1MeasureItem(Control: TWinControl; Index: Integer;
  var Height: Integer);
begin
  Height:= 36;
end;

procedure TForm1.ListBox1DrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  with Listbox1 do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= clHighlight
    else
      Canvas.Brush.Color:= clWindow;
    Canvas.FillRect(Rect);
    ImageList32.Draw(Canvas, Rect.Left+2, Rect.Top+2, Index);
  end;
end;

procedure TForm1.TBXItem4Click(Sender: TObject);
begin
  listbox1.ItemIndex:= 0;
end;

procedure TForm1.TBXItem2Click(Sender: TObject);
begin
  listbox1.ItemIndex:= 2;
end;

procedure TForm1.TBXItem3Click(Sender: TObject);
begin
  listbox1.ItemIndex:= 1;
end;

procedure TForm1.TBXItem1Click(Sender: TObject);
begin
  listbox1.ItemIndex:= 3;
end;

procedure ImgLoadFromFile(Img: TImageList; const fn: string);
var
  b: TBitmap;
begin
  b:= TBitmap.Create;
  b.PixelFormat:= pf32bit;
  b.Transparent:= true;
  b.LoadFromFile(fn);
  Img.Clear;
  Img.Add(b, nil);
  FreeAndNil(b);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  SaveImageListToFile(ImageList32, 'd:\T\Img.png');
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  //TbxHiContrast:= true;
  ImageList16.Handle:= ImageList_Create(16, 16, ILC_COLOR32 or ILC_MASK, 0, 50);
  ImageList32.Handle:= ImageList_Create(32, 32, ILC_COLOR32 or ILC_MASK, 0, 50);
end;


procedure TForm1.Button3Click(Sender: TObject);
var
  b: TBitmap;
  png: TPngObject;
const
  fn='d:\image.png';
begin
  b:= TBitmap.Create;
  b.PixelFormat:= pf32bit;
  LoadIconFromDllToBmp('shell32.dll', 0{IconIndex}, false{SmallIcons}, b);

  png:=Bmp32ToPng(b);
  if png=nil then begin Showmessage('Failed Bmp32topng'); Exit end;
  png.SaveToFile(fn);
  FOpenURL(fn, Handle);
  png.free;
  b.free;
end;


procedure TForm1.Button4Click(Sender: TObject);
begin
  LoadImageListFromFile(ImageList32, 22, 22, 'D:\UV\Icons\Tango 22x22.bmp');

  TBImageList1.Width:= ImageList32.Width;
  TBImageList1.Height:= ImageList32.Height;
  TBImageList1.Clear;
  TBImageList1.AddImages(ImageList32);
end;


procedure TForm1.Button5Click(Sender: TObject);
const
  fn_png = 'D:\T\Toolbars\Tango 22x22.PNG';
begin
  LoadTbxImageListFromFile(TbxImageList1, 22, 22, fn_png);
end;


procedure TForm1.Button6Click(Sender: TObject);
const
  f1= 'D:\T\Toolbars\about_kde.png';
  f2= 'D:\T\Toolbars\amarok---.png';
  f3= 'D:\T\Toolbars\apply.png';
begin
  TbxImageList1.Clear;
  TbxImageList1.Width:= 22;
  TbxImageList1.Height:= 22;

  AddPngToTbxImageList(TbxImageList1, f1);
  AddPngToTbxImageList(TbxImageList1, f2);
  AddPngToTbxImageList(TbxImageList1, f3);
  AddPngToTbxImageList(TbxImageList1, f1);
  AddPngToTbxImageList(TbxImageList1, '"""""""');
end;

end.
