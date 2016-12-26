unit unSearchInList;

interface

uses ecSyntDlg, StdCtrls,
  Forms, Classes;

type
  TecFindInListDialog = class(TBaseFindDialog)
  private
    FPrevFound: Integer;
    FControl: TCustomListBox;
    FOnNotFound: TNotifyEvent;
  protected
    function DoSearch(ToAll: Boolean; ToBack: Boolean; FromCur: Boolean): Boolean; override;
    function MatchItem(ItemIndex: Integer): Boolean; virtual;
    //function CreateDlg: TCustomForm; override;
  public
    function Execute: Boolean;
    property OnNotFound: TNotifyEvent read FOnNotFound write FOnNotFound;
  published
    property Control: TCustomListBox read FControl write FControl;
  end;

implementation

uses
  Windows,
  Controls;

{ TecFindInListDialog }

function TecFindInListDialog.DoSearch(ToAll, ToBack,
  FromCur: Boolean): Boolean;
var Index: Integer;

  function ValidIndex: boolean;
  begin
    Result:= (Index>=0) and (Index<=Control.Items.Count-1);
  end;
  procedure TakeNext;
  begin
    if ToBack then
      Dec(Index)
    else
      Inc(Index);
  end;
begin
  if FromCur then
    Index := Control.ItemIndex
  else
  begin
    if ToBack then Index:= Control.Items.Count-1
    else Index:= 0;
  end;
  if Index = FPrevFound then
    TakeNext;

  while ValidIndex do
    if MatchItem(Index) then
      begin
        FPrevFound := Index;
        Control.ItemIndex:= Index;
        Result := True;
        Exit;
      end
      else
        TakeNext;

  Result := False;
  if Assigned(FOnNotFound) then
    FOnNotFound(Self);
end;

function TecFindInListDialog.Execute: Boolean;
begin
  Result := (Control <> nil) and
            (ShowDialog <> mrCancel);
  if Result then
    Result := DoSearch(False, ftBackward in Flags, not (ftEntireScope in Flags));
end;

function TecFindInListDialog.MatchItem(ItemIndex: Integer): Boolean;
var sp, ep: integer;
begin
  sp := 0;
  ep := 0;
  Result := Find(FControl.Items[ItemIndex], sp, ep, False, CP_ACP);// and
            //CanAccept(Node.AbsoluteIndex, sp);
end;

end.
