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
  public
    constructor Create(AOwner: TComponent); override;
    function Execute: Boolean;
    property OnNotFound: TNotifyEvent read FOnNotFound write FOnNotFound;
  published
    property Control: TCustomListBox read FControl write FControl;
  end;

type
  TFinderInList = class(TecFindInListDialog)
  public
    IniFN: string;
    SearchText: Widestring;
  protected
    procedure SetDlgControls(Dlg: TCustomForm); override;
    procedure GetDlgControls(Dlg: TCustomForm); override;
    function CreateDlg: TCustomForm; override;
  end;

implementation

uses
  Windows,
  Controls, unSRTree;

{ TecFindInListDialog }

constructor TecFindInListDialog.Create;
begin
  inherited;
  FPrevFound:= -1;
  FControl:= nil;
  FOnNotFound:= nil;
end;

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
    if ToBack then
      Index := Control.Items.Count-1
    else
      Index := 0;
  end;
  
  if Index = FPrevFound then
    TakeNext;

  while ValidIndex do
    if MatchItem(Index) then
      begin
        FPrevFound := Index;
        if Control.ItemIndex >= 0 then
          Control.Selected[Control.ItemIndex] := false;
        Control.ItemIndex := Index;
        Control.Selected[Control.ItemIndex] := true;
        if Control.CanFocus then
          Control.SetFocus;
        Result := True;
        Exit;
      end
      else
        TakeNext;

  Result := False;
  FPrevFound := -1;
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
  Result := Find(FControl.Items[ItemIndex], sp, ep, False, CP_ACP);
    //and CanAccept(Node.AbsoluteIndex, sp);
end;

{ TFinderInList }

function TFinderInList.CreateDlg: TCustomForm;
var
  fm: TfmSRTree;
begin
  fm:= TfmSRTree.Create(Self);
  fm.FIniFN:= IniFN;
  fm.FSearchFor:= SearchText;
  Result:= fm;
end;

procedure TFinderInList.GetDlgControls(Dlg: TCustomForm);
begin
  with Dlg as TfmSRTree do
  begin
    FindText:= edText.Text;
    Flags:= [];
    if not cbFromCur.Checked then Flags:= Flags+[ftEntireScope];
    if cbCase.Checked then Flags:= Flags+[ftCaseSensitive];
    if cbWords.Checked then Flags:= Flags+[ftWholeWordOnly];
    if cbRE.Checked then Flags:= Flags+[ftRegularExpr];
    if bBack.Checked then Flags:= Flags+[ftBackward];
  end;
end;

procedure TFinderInList.SetDlgControls(Dlg: TCustomForm);
begin
  with Dlg as TfmSRTree do
  begin
    edText.Text:= FindText;
    cbFromCur.Checked:= not (ftEntireScope in Flags);
    cbCase.Checked:= ftCaseSensitive in Flags;
    cbWords.Checked:= ftWholeWordOnly in Flags;
    cbRE.Checked:= ftRegularExpr in Flags;
    bBack.Checked:= ftBackward in Flags;
    bFor.Checked:= not bBack.Checked;
  end;
end;


end.
