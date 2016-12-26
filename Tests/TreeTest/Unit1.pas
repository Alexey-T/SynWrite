unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    TreeView1: TTreeView;
    RichEdit1: TRichEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure AddSubdirsToTree(Tree: TTreeView; Node: TTreeNode; const SDir: string);
var
  NDir: TTreeNode;
  Rec: TSearchRec;
  fn: string;
begin
  NDir:= Tree.Items.AddChild(Node, '['+ExtractFileName(SDir)+']');
  FillChar(Rec, SizeOf(Rec), 0);
  if FindFirst(SDir+'\*.*', faAnyFile, Rec)=0 then
  repeat
    if (Rec.Name='.') or (Rec.Name='..') then Continue;
    fn:= SDir+'\'+Rec.Name;
    if (Rec.Attr and faDirectory)<>0 then
      AddSubdirsToTree(Tree, NDir, fn)
    else
      Tree.Items.AddChild(NDir, ExtractFileName(fn));
  until FindNext(Rec)<>0;
  FindClose(Rec);
end;

procedure TForm1.FormShow(Sender: TObject);
var
  N: TTreeNode;
begin
  with Treeview1 do
  begin
   FullExpand;
   N:= Items[Items.Count-3];
   AddSubdirsToTree(Treeview1, N, 'd:\work\Dir');
   FullExpand;
  end;
end;

end.
