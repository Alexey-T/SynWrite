unit unSynHide;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, CheckLst;

type
  TfmSynHide = class(TForm)
    List: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ListItems: TStringList;
    function Encode(MenuId, SubmenuId, ItemId: Integer): Integer;
    procedure FillList;
  end;

var
  fmSynHide: TfmSynHide;

implementation

{$R *.dfm}

function TfmSynHide.Encode(MenuId, SubmenuId, ItemId: Integer): Integer;
begin
  Result:= 0;
end;

procedure TfmSynHide.FormCreate(Sender: TObject);
begin
  ListItems:= TStringList.Create;
  ListItems.Add('Main menu');
  ListItems.Add('  File');
  Listitems.Add('    New');
  Listitems.Add('    Open');
  Listitems.Add('    Recent files');
  Listitems.Add('  Edit');
  Listitems.Add('    Undo');
  Listitems.Add('    Redo');
  Listitems.Add('Toolbar File');
  Listitems.Add('  Item1');
  Listitems.Add('  Item2');
end;

procedure TfmSynHide.FormDestroy(Sender: TObject);
begin
  FreeAndNil(ListItems);
end;

procedure TfmSynHide.FillList;
var
  i: Integer;
begin
  List.Items.AddStrings(ListItems);
end;

end.
