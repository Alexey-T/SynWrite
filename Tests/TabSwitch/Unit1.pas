unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Edit1: TEdit;
    del: TButton;
    Label1: TLabel;
    CheckBox1: TCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure delClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageControl1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure PageControl1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
    procedure UpdL;
    procedure UpdateTabList(TopItem: Integer = -1; NewItem: Integer = -1; DelItem: Integer = -1);
    procedure MoveTabInList(FromN, ToN: integer);
    procedure GetTabName(n: Integer; var AName, AFN, ALex: Widestring);
    function TabN: integer;
  public
    { Public declarations }
  protected
    procedure CMDialogKey(var Message: TCMDialogKey); message CM_DIALOGKEY;
  end;

var
  Form1: TForm1;

implementation

uses unTabSw;

{$R *.dfm}

procedure TForm1.CMDialogKey(var Message: TCMDialogKey);
begin
  if (Focused or Windows.IsChild(Handle, Windows.GetFocus)) and
    (Message.CharCode = VK_TAB) and (GetKeyState(VK_CONTROL) < 0) then
  begin
    if not Checkbox1.Checked then
    begin
      PageControl1.SelectNextPage(GetKeyState(VK_SHIFT) >= 0);
      Message.Result := 1;
    end
    else
      Message.Result:= 0;
  end
  else
    inherited;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  n: integer;
begin
  if (Key=VK_TAB) and ((Shift=[ssCtrl]) or (Shift=[ssCtrl, ssShift])) then
  begin
    n:= TabSwitcher.TabSwitch(Shift=[ssCtrl], Self);
    if n>=0 then
    begin
      PageControl1.ActivePageIndex:= n;
      UpdateTabList(n);
    end;
    Key:= 0;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  TabSwitcher.OnGetTab:= GetTabName;
  TabSwitcher.InitTabList(PageControl1.PageCount);
end;

procedure TForm1.UpdateTabList(TopItem, NewItem, DelItem: Integer);
begin
  TabSwitcher.UpdateTabList(TopItem, NewItem, DelItem);
  UpdL;
end;

procedure TForm1.delClick(Sender: TObject);
var n:Integer;
begin
  n:= StrToInt(Edit1.Text);
  PageControl1.Pages[n].Free;
  UpdateTabList(-1, -1, n);
end;

procedure TForm1.UpdL;
begin
  Label1.Caption:= TabSwitcher.GetTabList;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  UpdateTabList(TabN);
end;

function TForm1.TabN: integer;
var
  s: string;
begin
  s:= PageControl1.ActivePage.Caption;
  Delete(s, 1, Length(s)-1);
  Result:= StrToInt(s)-1;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  PageControl1Change(Self);
end;


procedure TForm1.PageControl1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  PageControl1.BeginDrag(False) ;
end;

procedure TForm1.PageControl1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
const
    TCM_GETITEMRECT = $130A;
 var
    TabRect: TRect;
    j: Integer;
 begin
    if (Sender is TPageControl) then
    for j := 0 to PageControl1.PageCount - 1 do
    begin
      PageControl1.Perform(TCM_GETITEMRECT, j, LParam(@TabRect)) ;
      if PtInRect(TabRect, Point(X, Y)) then
      begin
        if PageControl1.ActivePage.PageIndex <> j then
        begin
          MoveTabInList(PageControl1.ActivePage.PageIndex, j);
          PageControl1.ActivePage.PageIndex := j;
        end;
        Exit;
      end;
    end;
 end;

procedure TForm1.PageControl1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  if (Sender is TPageControl) then Accept := True;
end;


procedure TForm1.GetTabName(n: Integer; var AName, AFN, ALex: Widestring);
begin
  AName:= PageControl1.Pages[n].Caption;
  AFN:= AName + ' filename';
  ALex:= '';
end;


procedure TForm1.MoveTabInList(FromN, ToN: integer);
begin
  TabSwitcher.MoveTabInList(FromN, ToN);
  UpdL;
end;

end.
