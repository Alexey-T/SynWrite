{ *************************************************************************** }
{                                                                             }
{ EControl Syntax Editor SDK                                                  }
{                                                                             }
{ Copyright (c) 2004 - 2008 EControl Ltd., Zaharov Michael                    }
{     www.econtrol.ru                                                         }
{     support@econtrol.ru                                                     }
{                                                                             }
{ *************************************************************************** }
{$I ecSyntEdit.INC}

unit unLexerItems;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
{$IFDEF EC_DOTNET}Types, Variants, System.ComponentModel,{$ENDIF}
  ecSyntAnal, StdCtrls, Buttons, ExtCtrls, TntButtons,
  unLexerImportRules;

type
  TfmLexerItems = class(TFrame)
    LB: TListBox;
    SpeedButton1: TTntSpeedButton;
    SpeedButton2: TTntSpeedButton;
    SpeedButton3: TTntSpeedButton;
    SpeedButton4: TTntSpeedButton;
    Edit: TEdit;
    SpeedButton5: TTntSpeedButton;
    SpeedButton6: TTntSpeedButton;
    Panel1: TPanel;
    Panel2: TPanel;
    SpeedButton7: TTntSpeedButton;
    procedure LBClick(Sender: TObject);
    procedure EditExit(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure SpeedButton5Click(Sender: TObject);
    procedure LBDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure LBDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure SpeedButton6Click(Sender: TObject);
    procedure LBDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
      State: TOwnerDrawState);
    procedure SpeedButton7Click(Sender: TObject);
  private
    FCollection: TSyntCollection;
    FOnChange: TNotifyEvent;
    FOnChangeName: TNotifyEvent;
    FOnChangeOrder: TNotifyEvent;
    FParentEnabled: Boolean;
    FImportDlg: TfmLexerImportRules;
    procedure FillList;
    procedure SetCollection(const Value: TSyntCollection);
    procedure SetEnabling;
    function GetCurrent: TSyntCollectionItem;
    procedure MoveItem(CurIndex, NewIndex: integer);
    procedure EnableControls(enable: Boolean);
    function GetAllowListOper: Boolean;
    procedure SetAllowListOper(const Value: Boolean);
  protected
    procedure ChangeScale(M: Integer; D: Integer); override;
  public
    constructor Create(AOwner: TComponent); override;
    property Collection: TSyntCollection read FCollection write SetCollection;
    property Current: TSyntCollectionItem read GetCurrent;
    property AllowListEdit: Boolean read GetAllowListOper write SetAllowListOper;
    property OnChange: TNotifyEvent read FOnChange write FOnChange;
    property OnChangeName: TNotifyEvent read FOnChangeName write FOnChangeName;
    property OnChangeOrder: TNotifyEvent read FOnChangeOrder write FOnChangeOrder;
  end;

  TCanRenameSyntItem = procedure(Item: TSyntCollectionItem; var AllowRename: Boolean) of object;
  TCanDeleteSyntItem = procedure(Item: TSyntCollectionItem; var AllowDelete: Boolean) of object;

var
  CanRenameSyntItem: TCanRenameSyntItem = nil;
  CanDeleteSyntItem: TCanDeleteSyntItem = nil;

implementation

uses unLexerProp;

{$R *.dfm}

{ TSyntColFrame }

constructor TfmLexerItems.Create(AOwner: TComponent);
begin
  inherited;
  FParentEnabled := True;
end;

procedure TfmLexerItems.FillList;
var i: integer;
begin
  LB.Clear;
  Edit.Text := '';
  if Assigned(FCollection) then
   begin
    for i := 0 to FCollection.Count - 1 do
     LB.Items.AddObject(FCollection[i].DisplayName, FCollection[i]);
    if LB.Items.Count > 0 then
     LB.ItemIndex := 0;
    LBClick(nil);
   end else SetEnabling;
end;

procedure TfmLexerItems.SetCollection(const Value: TSyntCollection);
begin
  FCollection := Value;
  FillList;
end;

procedure TfmLexerItems.SetEnabling;
var b, b1: Boolean;
begin
  b := Assigned(FCollection);
  SpeedButton1.Enabled := b and (LB.ItemIndex < LB.Items.Count - 1);
  SpeedButton2.Enabled := b and (LB.ItemIndex > 0);
  SpeedButton3.Enabled := b;
  SpeedButton5.Enabled := b and (LB.Items.Count > 0);
  SpeedButton6.Enabled := b and (LB.Items.Count <> -1);
  // Delete button
  b1 := b and (LB.ItemIndex <> -1);
  if b1 and Assigned(CanDeleteSyntItem) then
    CanDeleteSyntItem(Current, b1);
  SpeedButton4.Enabled := b1;
  // Name edit
  b := b and (LB.ItemIndex <> -1);
  if b and Assigned(CanRenameSyntItem) then
    CanRenameSyntItem(Current, b);
  Edit.Enabled := b;
  if Edit.Enabled then Edit.Color := clWindow
   else Edit.Color := clBtnFace;
end;

procedure TfmLexerItems.LBClick(Sender: TObject);
begin
  EnableControls(LB.ItemIndex <> -1);
  if Assigned(FCollection) then
   begin
     if LB.ItemIndex <> -1 then
      begin
       Edit.Text := LB.Items[LB.ItemIndex];
       SpeedButton6.Down := not FCollection[LB.ItemIndex].Enabled;
      end
     else Edit.Text := '';
     Edit.Modified := False;
     if Assigned(FOnChange) then FOnChange(Self);
   end;
  SetEnabling;
end;

function TfmLexerItems.GetCurrent: TSyntCollectionItem;
begin
  if Assigned(FCollection) and (LB.ItemIndex <> -1) then
   Result := FCollection[LB.ItemIndex]
  else
   begin
     Result := nil;
     Abort;
   end;
end;

procedure TfmLexerItems.EditExit(Sender: TObject);
begin
  if (Edit.Modified) and (LB.ItemIndex <> -1) then
   begin
     FCollection[LB.ItemIndex].DisplayName := Edit.Text;
     Edit.Text := FCollection[LB.ItemIndex].DisplayName;
     LB.Items[LB.ItemIndex] := Edit.Text;
     Edit.Modified := False;
     if Assigned(FOnChangeName) then FOnChangeName(Self);
   end;
end;

procedure TfmLexerItems.EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_RETURN: EditExit(nil);
    VK_ESCAPE: begin
                 Edit.Text := Current.DisplayName;
                 Edit.Modified := False;
               end;
  end;
end;

procedure TfmLexerItems.MoveItem(CurIndex, NewIndex: integer);
begin
  if (CurIndex = -1) or (NewIndex = -1) or (CurIndex = NewIndex) then Exit;
  FCollection[CurIndex].Index := NewIndex;
  LB.Items.Move(CurIndex, NewIndex);
  LB.ItemIndex := NewIndex;
  LBClick(nil);
  if Assigned(FOnChangeOrder) then FOnChangeOrder(Self);
end;

procedure TfmLexerItems.LBDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept := Sender = Source;
end;

procedure TfmLexerItems.LBDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  MoveItem(LB.ItemIndex, LB.ItemAtPos(Point(X, Y), True));
end;

procedure TfmLexerItems.SpeedButton1Click(Sender: TObject);
begin
  MoveItem(LB.ItemIndex, LB.ItemIndex + 1);
end;

procedure TfmLexerItems.SpeedButton2Click(Sender: TObject);
begin
  MoveItem(LB.ItemIndex, LB.ItemIndex - 1);
end;

procedure TfmLexerItems.SpeedButton3Click(Sender: TObject);
var Item: TCollectionItem;
begin
  Item := FCollection.Add;
  LB.Items.AddObject(Item.DisplayName, Item);
  LB.ItemIndex := LB.Items.Count - 1;
  LBClick(nil);
  if Assigned(FOnChangeOrder) then FOnChangeOrder(Self);
end;

procedure TfmLexerItems.SpeedButton4Click(Sender: TObject);
var N: integer;
begin
  N := LB.ItemIndex;
  if N < 0 then Exit;
  FCollection.Delete(N);
  LB.Items.Delete(N);
  if N < LB.Items.Count then LB.ItemIndex := N
   else LB.ItemIndex := LB.Items.Count - 1;
  LBClick(nil);
  if Assigned(FOnChangeOrder) then FOnChangeOrder(Self);
end;

procedure TfmLexerItems.SpeedButton5Click(Sender: TObject);
begin
  FCollection.Clear;
  LB.Items.Clear;
  LBClick(nil);
end;

{$IFNDEF EC_DOTNET}
type TControlHack = class(TControl);
{$ENDIF}

procedure TfmLexerItems.EnableControls(enable: Boolean);
  procedure EnableParent(prn: TWinControl);
  var i: integer;
      ctl: TControl;
  begin
   for i := 0 to prn.ControlCount - 1 do
    begin
     ctl := prn.Controls[i];
     if (ctl <> Self) and (ctl.Tag <> 111) then
      begin
        ctl.Enabled := enable;
        if ctl is TWinControl then
          EnableParent(ctl as TWinControl);
        {$IFNDEF EC_DOTNET}
        if (ctl is TCustomEdit) or (ctl is TCustomListBox) or
           (ctl is TCustomComboBox) then
          if enable then TControlHack(ctl as TControl).Color := clWindow
            else TControlHack(ctl as TControl).Color := TControlHack(prn as TControl).Color;
        {$ENDIF}
      end;
    end;
  end;
begin
  if FParentEnabled = enable then Exit;
  EnableParent(Parent);
  FParentEnabled := enable;
end;

procedure TfmLexerItems.SpeedButton6Click(Sender: TObject);
begin
  if LB.ItemIndex < 0 then Exit;
  FCollection[LB.ItemIndex].Enabled := not SpeedButton6.Down;
  LB.Invalidate;
  if Assigned(FOnChange) then FOnChange(Self);
end;

procedure TfmLexerItems.LBDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
begin
  if Assigned(FCollection) then
  with TListBox(Control) do
   begin
    Canvas.FillRect(Rect);
    if not FCollection[Index].Enabled then Canvas.Font.Color := clSilver  else
     if FCollection[Index].IsInvalid then Canvas.Font.Color := clRed  else
      if odSelected in State then
        Canvas.Font.Color := clHighlightText
       else
        Canvas.Font.Color := clWindowText;
    Canvas.TextOut(Rect.Left + 1, Rect.Top, Items[Index]);
   end;
end;

procedure TfmLexerItems.SpeedButton7Click(Sender: TObject);
begin
  if not Assigned(FImportDlg) then
   begin
    FImportDlg := TfmLexerImportRules.Create(Self);
    if Assigned(Owner) and (Owner is TfmLexerProp) then
      FImportDlg.LexOwner := (Owner as TfmLexerProp).EditedLexer.Owner;
    FImportDlg.Collection := FCollection;
   end;
  if FImportDlg.ShowModal = mrOk then
   begin
     FillList;
     if LB.Items.Count > 0 then
      begin
        LB.ItemIndex := LB.Items.Count - 1;
        LBClick(nil);
      end;
     if Assigned(FOnChangeOrder) then FOnChangeOrder(Self);
   end;
end;

function TfmLexerItems.GetAllowListOper: Boolean;
begin
  Result := Panel1.Visible;
end;

procedure TfmLexerItems.SetAllowListOper(const Value: Boolean);
begin
  Panel1.Visible := Value;
  Panel2.Visible := Value;
end;

procedure TfmLexerItems.ChangeScale(M, D: Integer);
begin
  inherited;
  LB.ItemHeight := MulDiv(LB.ItemHeight, M, D);
end;

end.
