unit unMap;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus,
  ecSyntMemo, ecSyntAnal,
  ATSyntMemo;

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
    FLineTop,
    FLineBottom: integer;
    FOnMapClick: TNotifyEvent;
    procedure DoMapClick;
    procedure DoMapShow;
  public
    { Public declarations }
    property OnMapClick: TNotifyEvent read FOnMapClick write FOnMapClick;
    procedure SyncMapData(Src: TSyntaxMemo);
    procedure SyncMapPos(Src: TSyntaxMemo);
    procedure SetMapColor(C: TColor);
    procedure SetMapFontSize(N: integer);
    procedure SetMapScrollBars(SHorz, SVert: boolean);
  end;

implementation

uses
  Math,
  StdCtrls,
  ecLists,
  unProcEditor;

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
end;


procedure TfmMap.DoMapShow;
var
  nPosStart, nPosEnd: integer;
begin
  with edMap do
  begin
    nPosStart:= CaretPosToStrPos(Point(0, FLineTop));
    nPosEnd:= CaretPosToStrPos(Point(0, FLineBottom));

    BeginUpdate;
    try
      SearchMarks.Clear;
      SearchMarks.Add(TRange.Create(nPosStart, nPosEnd));
    finally
      EndUpdate;
    end;  
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
  begin
    FMouseDown:= true;
    edMap.Cursor:= crSizeNS;
    SetCursor(Screen.Cursors[edMap.Cursor]);
  end;
end;

procedure TfmMap.edMapMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if Button=mbLeft then
  begin
    FMouseDown:= false;
    edMap.Cursor:= crDefault;
    SetCursor(Screen.Cursors[edMap.Cursor]);
  end;
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
(*
function TATSynEdit.GetMinimapScrollPos: integer;
begin
  Result:=
    Int64(FScrollVert.NPos) *
    Max(0, FScrollVert.NMax-GetVisibleLinesMinimap) div
    Max(1, FScrollVert.NMax-FScrollVert.NPage);
end;
*)
begin
  if Src=nil then Exit;

  edMap.TopLine:=
    Int64(Src.TopLine) *
    Max(0, Src.Lines.Count-edMap.VisibleLines) div
    Max(1, Src.Lines.Count-Src.VisibleLines);
  FLineTop:= Src.TopLine;
  FLineBottom:= Min(FLineTop + Src.VisibleLines, edMap.Lines.Count-1);

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

procedure TfmMap.SetMapFontSize(N: integer);
begin
  edMap.Font.Size:= N;
end;

procedure TfmMap.SetMapScrollBars(SHorz, SVert: boolean);
begin
  (*
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
    *)
end;

end.
