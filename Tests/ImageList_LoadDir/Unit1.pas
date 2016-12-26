unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ImgList, PngImageList, TB2Item, SpTBXItem, TB2Dock, TB2Toolbar,
  StdCtrls;

type
  TForm1 = class(TForm)
    IL1: TPngImageList;
    tb1: TSpTBXToolbar;
    SpTBXItem1: TSpTBXItem;
    SpTBXItem2: TSpTBXItem;
    SpTBXItem3: TSpTBXItem;
    SpTBXItem4: TSpTBXItem;
    Button1: TButton;
    SpTBXItem5: TSpTBXItem;
    SpTBXItem6: TSpTBXItem;
    SpTBXItem7: TSpTBXItem;
    SpTBXItem8: TSpTBXItem;
    tb2: TSpTBXToolbar;
    SpTBXItem9: TSpTBXItem;
    SpTBXItem10: TSpTBXItem;
    SpTBXItem11: TSpTBXItem;
    SpTBXItem12: TSpTBXItem;
    SpTBXItem13: TSpTBXItem;
    SpTBXItem14: TSpTBXItem;
    SpTBXItem15: TSpTBXItem;
    SpTBXItem16: TSpTBXItem;
    IL2: TPngImageList;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unProc;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  t: dword;
const
  n=
    'Fugue 24x24';
    //'Fugue 16x16';
    //'Tango 22x22';
    //'LibreOffice Flat 24x24';
begin
  t:= GetTickCount;
  DoIconSet_LoadFromTar(IL2, 'D:\S\Template\icons\'+n+'.tar');
  tb2.Invalidate;
  t:= GetTickCount-t;
  Caption:= Format('Load: %d ms', [t]);
end;

end.
