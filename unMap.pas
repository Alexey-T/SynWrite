unit unMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, ecSyntAnal, Menus;

type
  TfmMap = class(TForm)
    edMap: TSyntaxMemo;
    PopupMenu1: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure edMapMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure edMapMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edMapMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure edMapClick(Sender: TObject);
    procedure edMapCanDelete(Sender: TObject; Position, Count: Integer;
      var AllowDelete: Boolean);
    procedure edMapCanInsert(Sender: TObject; Position: Integer;
      var AllowInsert: Boolean);
  private
    { Private declarations }
    FMouseDown: boolean;
    FTopLine,
    FBtmLine: integer;
    procedure DoMapClick;
    procedure DoMapShow;
  public
    { Public declarations }
    FOnMapClick: TNotifyEvent;
    procedure SyncMapData(Src: TSyntaxMemo);
    procedure SyncMapPos(Src: TSyntaxMemo);
    procedure SetMapColor(C: TColor);
    procedure SetMapZoom(N: integer);
    procedure SetMapScrollBars(SHorz, SVert: boolean);
  end;

implementation

uses ecLists,
  StdCtrls;

{$R *.dfm}

procedure TfmMap.FormCreate(Sender: TObject);
begin
  FMouseDown:= false;
  edMap.Lines.Clear;
  edMap.Caret.Visible:= false;
  edMap.Options:= edMap.Options+[soDisableSelection];
  edMap.OptionsEx:= edMap.OptionsEx+[soKeepSearchMarks];
  edMap.DisableFolding:= true;
  edMap.Gutter.Visible:= false;
  edMap.DefaultStyles.SearchMark.Font.Color:= clNone;
  edMap.DefaultStyles.SearchMark.BgColor:= $F4F0F6;
  edMap.Scrollbars:= ssNone;
  edMap.Zoom:= 30;
end;

procedure TfmMap.DoMapShow;
var
  n, nSt, nEnd,
  nBottomLine: integer;
begin
  with edMap do
  begin
    n:= FTopLine;
    nSt:= CaretPosToStrPos(Point(0, n));

    n:= FBtmLine;
    nEnd:= CaretPosToStrPos(Point(0, n));

    BeginUpdate;
    //
    //fix TopLine
    nBottomLine:= edMap.MouseToCaret(0, ClientHeight).Y;
    if FTopLine<TopLine then
      TopLine:= FTopLine
    else
    if FBtmLine>nBottomLine then
    {  showmessage(format('btmLine %d, nBottomLine %d',
        [FBtmLine, nBottomLine]));}
      TopLine:= FBtmLine - (nBottomLine-TopLine);

    SearchMarks.Clear;
    SearchMarks.Add(TRange.Create(nSt, nEnd));
    //
    EndUpdate;
  end;
end;

procedure TfmMap.edMapMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  if FMouseDown then
  begin
    edMap.CaretPos:= edMap.MouseToCaret(X, Y);
    DoMapShow;
    DoMapClick;
  end;
end;

procedure TfmMap.edMapMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    FMouseDown:= true;
end;

procedure TfmMap.edMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
    FMouseDown:= false;
end;

procedure TfmMap.SyncMapData(Src: TSyntaxMemo);
begin
  if Src=nil then
  begin
    edMap.TextSource:= nil;
    edMap.SyntaxAnalyzer:= nil;
  end
  else
  begin
    edMap.RightMargin:= Src.RightMargin;
    edMap.Color:= Src.Color;
    edMap.Font.Color:= Src.Font.Color;

    edMap.TextSource:= Src.TextSource;
    edMap.SyntaxAnalyzer:= Src.SyntaxAnalyzer;
  end;
end;

procedure TfmMap.SyncMapPos(Src: TSyntaxMemo);
begin
  if Src=nil then Exit;

  //have col#0 in map visible
  edMap.CaretPos:= Point(0, Src.CaretPos.Y);

  FTopLine:= Src.TopLine;
  FBtmLine:= FTopLine + Src.ClientHeight div Src.DefLineHeight;
  if FBtmLine>= edMap.Lines.Count then
    FBtmLine:= edMap.Lines.Count-1;

  DoMapShow;
end;

procedure TfmMap.DoMapClick;
begin
  if Assigned(FOnMapClick) then
    FOnMapClick(edMap);
end;

procedure TfmMap.edMapClick(Sender: TObject);
begin
  DoMapClick;
end;

procedure TfmMap.edMapCanDelete(Sender: TObject; Position, Count: Integer;
  var AllowDelete: Boolean);
begin
  AllowDelete:= false;
end;

procedure TfmMap.edMapCanInsert(Sender: TObject; Position: Integer;
  var AllowInsert: Boolean);
begin
  AllowInsert:= false;
end;

procedure TfmMap.SetMapColor(C: TColor);
begin
  edMap.DefaultStyles.SearchMark.BgColor:= C;
end;

procedure TfmMap.SetMapZoom(N: integer);
begin
  edMap.Zoom:= N;
end;

procedure TfmMap.SetMapScrollBars(SHorz, SVert: boolean);
begin
  if SHorz and SVert then
    edMap.ScrollBars:= ssBoth
  else
  if SHorz then
    edMap.ScrollBars:= ssHorizontal
  else
  if SVert then
    edMap.ScrollBars:= ssVertical
  else
    edMap.ScrollBars:= ssNone;
end;

end.
