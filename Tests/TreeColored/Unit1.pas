unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    TreeView2: TTreeView;
    Button1: TButton;
    Button2: TButton;
    TreeView1: TTreeView;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure TreeView2KeyPress(Sender: TObject; var Key: Char);
    procedure TreeView2KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure TreeView2AdvancedCustomDrawItem(Sender: TCustomTreeView;
      Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
      var PaintImages, DefaultDraw: Boolean);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

const
  tv_first=$1100;
  tvm_SetLinecolor=(TV_FIRST+40);
  TVM_SETINSERTMARKCOLOR=(TV_FIRST+37);
  TVM_SETTEXTCOLOR=(TV_FIRST+30);
  tvm_setbkcolor=  (TV_FIRST+29);

procedure TForm1.FormCreate(Sender: TObject);
begin
  //SendMessage(TreeView1.Handle, tvm_setbkcolor, 0, ColorToRGB(clYellow));
  Treeview1.FullExpand;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with treeview2 do
  if selected<>nil then
    Selected:= Selected.GetNext;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  with treeview2 do
  if selected<>nil then
    Selected:= Selected.GetPrev;
end;

procedure TForm1.TreeView2KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then Key := #0;
end;

procedure TForm1.TreeView2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_return) then
  begin
    button2.Click;
    key:= 0;
  end;  
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  n1, n2, n3,
  MyTreeNode1, MyTreeNode2: TTreeNode;
begin
  with TreeView1.Items do
  begin
    Clear;
    n1:= Add(nil, 'Find1');
    n2:= AddChild(n1, 'F1');
    AddChild(n2, 'Ln1');
    AddChild(n2, 'Ln2');
    n2:= AddChild(n1, 'F2');
    AddChild(n2, 'Ln1');
    AddChild(n2, 'Ln2');
    n1:= Add(nil, 'Find 2');
    n2:= AddChild(n1, 'F1');
    AddChild(n2, 'Ln1');
    AddChild(n2, 'Ln2');
    n2:= AddChild(n1, 'F2');
    AddChild(n2, 'Ln1');
    AddChild(n2, 'Ln2');
  end;

  Exit;
  with TreeView1.Items do
  begin
    Clear; { remove any existing nodes }
    MyTreeNode1 := Add(nil, 'RootTreeNode1'); { Add a root node }
    { Add a child node to the node just added }
    AddChild(MyTreeNode1,'ChildNode1');

    {Add another root node}
    MyTreeNode2 := Add(MyTreeNode1, 'RootTreeNode2');
    {Give MyTreeNode2 to a child }
    AddChild(MyTreeNode2,'ChildNode2');

    {Change MyTreeNode2 to ChildNode2 }
    { and add a child node to it}
    MyTreeNode2 := TreeView1.Items[3];
    AddChild(MyTreeNode2,'ChildNode2a');

    {Add another child to ChildNode2, after ChildNode2a }
    Add(MyTreeNode2,'ChildNode2b');

    {add another root node}
    Add(MyTreeNode1, 'RootTreeNode3');
  end;

end;

procedure TForm1.TreeView2AdvancedCustomDrawItem(Sender: TCustomTreeView;
  Node: TTreeNode; State: TCustomDrawState; Stage: TCustomDrawStage;
  var PaintImages, DefaultDraw: Boolean);
var r: TRect;
  s: string;
  n:Integer;
begin
  if Stage<>cdPostPaint then Exit;
  DefaultDraw:= true;
  R:= Node.DisplayRect(true);
  Inc(R.Left, 2); // <---------dx
  Inc(R.Top, 1); //<--------dy

  Sender.Canvas.Font.Assign(Treeview2.Font);
  Sender.Canvas.Font.Color:= clred;
  //Sender.Canvas.Brush.Color:= clyellow;
  s:= Copy(Node.Text, 1, 2);
  n:= Sender.Canvas.TextWidth(s);
  Sender.Canvas.TextOut(R.Left+n, R.Top, Copy(Node.Text, 3, 2));
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  with treeview2 do
  if (selected<>nil) and (Selected.Parent<>nil) then
    Selected:= Selected.Parent;
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  with treeview2 do
  if (selected<>nil) then
    Selected:= Selected.getNextSibling;
end;

end.
