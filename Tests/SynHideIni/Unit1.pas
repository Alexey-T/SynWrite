unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TB2Item, TBX, TB2Dock, TB2Toolbar;

type
  TForm1 = class(TForm)
    TBXDock1: TTBXDock;
    tbEdit: TTBXToolbar;
    TBItem1: TTBItem;
    TBItem2: TTBItem;
    TBXItem1: TTBXItem;
    tbFile: TTBXToolbar;
    TBItem3: TTBItem;
    TBItem4: TTBItem;
    TBXItem2: TTBXItem;
    tbMenu: TTBXToolbar;
    TbxItemHelp: TTBXSubmenuItem;
    TbxItemEdit: TTBXSubmenuItem;
    TbxItemFile: TTBXSubmenuItem;
    TBXItem3: TTBXItem;
    TBXItem4: TTBXItem;
    TBXItem5: TTBXItem;
    TBXItem6: TTBXItem;
    TBXItem7: TTBXItem;
    TBXItem8: TTBXItem;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure FillMenuList(L: TStringList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses unSynHide;

{$R *.dfm}

type
  TSynMenuRec = record
    MenuId: string;
    MenuItem: TComponent;
  end;

procedure TForm1.FillMenuList(L: TStringList);
var
  cSynMenus: array[0..4] of TSynMenuRec;
  i, j, Cnt: Integer;
  S1, S2: Widestring;
begin
  with cSynMenus[0] do begin menuid:= 'file'; menuitem:= TbxItemFile; end;
  with cSynMenus[1] do begin menuid:= 'edit'; menuitem:= TbxItemEdit; end;
  with cSynMenus[2] do begin menuid:= 'help'; menuitem:= TbxItemHelp; end;
  with cSynMenus[3] do begin menuid:= 'toolbar-file'; menuitem:= tbFile; end;
  with cSynMenus[4] do begin menuid:= 'toolbar-edit'; menuitem:= tbEdit; end;

  L.Clear;
  for i:= Low(cSynMenus) to High(cSynMenus) do
    with cSynMenus[i] do
    begin
      if MenuItem is TTbxToolbar then
      begin
        Cnt:= (MenuItem as TTbxToolbar).Items.Count;
      end
      else
      if MenuItem is TTbxSubmenuItem then
      begin
        L.AddObject((MenuItem as TTbxSubmenuItem).Caption, Pointer(i*100));
        Cnt:= (MenuItem as TTbxSubmenuItem).Count;
      end
      else
        raise Exception.Create('Unknown menu type');

      for j:= 0 to Cnt-1 do
      begin
        if MenuItem is TTbxToolbar then
        begin
          S1:= (MenuItem as TTbxToolbar).Caption;
          S2:= (MenuItem as TTbxToolbar).Items[j].Caption;
        end
        else
        if MenuItem is TTbxSubmenuItem then
        begin
          S1:= (MenuItem as TTbxSubmenuItem).Caption;
          S2:= (MenuItem as TTbxSubmenuItem).Items[j].Caption;
        end
        else
          raise Exception.Create('Unknown menu type');

        L.AddObject(S1 + ' — ' + S2, Pointer(i*100+j+1));
      end;
    end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  with TfmSynHide.Create(Self) do
  begin
    Parent:= Self;
    Align:= alTop;
    BorderStyle:= bsNone;
    FillMenuList(Listitems);
    FillList;
    Show;
  end;
end;

end.
