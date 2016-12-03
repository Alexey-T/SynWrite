(*
This Source Code Form is subject to the terms of the Mozilla Public
License, v. 2.0. If a copy of the MPL was not distributed with this
file, You can obtain one at http://mozilla.org/MPL/2.0/.

Copyright (c) Alexey Torgashin
*)
unit unProcCustomDialog;

interface

uses
  Windows, Classes, SysUtils, Graphics, Controls, StdCtrls, ExtCtrls, Forms,
  CheckLst, Spin, ComCtrls, Dialogs,
  TntControls, TntExtCtrls, TntComCtrls, TntStdCtrls, TntCheckLst, TntForms,
  ATLinkLabel;

procedure DoDialogCustom(const ATitle: string; ASizeX, ASizeY: integer;
  AText: string; AFocusedIndex: integer; out AButtonIndex: integer; out AStateText: string);

function IsDialogCustomShown: boolean;


implementation

const
  cButtonResultStart=100;
  cTagActive=1;

var
  FDialogShown: boolean = false;

type
  TCustomEditHack = class(TCustomEdit);

function SGetItem(var S: string; const sep: Char = ','): string;
var
  i: integer;
begin
  i:= Pos(sep, s);
  if i=0 then i:= MaxInt;
  Result:= Copy(s, 1, i-1);
  Delete(s, 1, i);
end;
  
type
  { TDummyClass }
  TDummyClass = class
  public
    Form: TTntForm;
    procedure DoOnShow(Sender: TObject);
    procedure DoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DoOnChange(Sender: TObject);
    procedure DoOnSelChange(Sender: TObject; User: boolean);
    procedure DoOnListviewChange(Sender: TObject; Item: TListItem; Change: TItemChange);
    procedure DoOnListviewSelect(Sender: TObject; Item: TListItem; Selected: Boolean);
  end;

function StrToBool(const S: string): boolean;
begin
  Result:= S<>'0';
end;

function IsControlAutosizeY(C: TControl): boolean;
begin
  Result:=
    (C is TTntLabel) or
    (C is TTntButton) or
    //(C is TToggleBox) or
    (C is TTntEdit) or
    (C is TTntCombobox) or
    (C is TTntCheckBox) or
    (C is TTntRadioButton) or
    (C is TSpinEdit);
end;

procedure DoFixButtonHeight(Ctl: TControl);
begin
  Ctl.Height:= 23; //smaller
end;

function DoGetListviewState(C: TTntListView): string; forward;
function DoGetControlState(C: TControl): string;
var
  i: integer;
begin
  Result:= '';

  if C is TTntEdit then
  begin
    Result:= UTF8Encode((C as TTntEdit).Text);
  end;

  if C is TTntCheckBox then
    Result:= IntToStr(Ord((C as TTntCheckBox).Checked));

  //if C is TToggleBox then
  //  Result:= IntToStr(Ord((C as TToggleBox).Checked));

  if C is TTntRadioButton then
    Result:= IntToStr(Ord((C as TTntRadioButton).Checked));

  if C is TTntListbox then
    Result:= IntToStr((C as TTntListbox).ItemIndex);

  if C is TTntCombobox then
  begin
    if (C as TTntCombobox).Style=csDropDownList then
      Result:= IntToStr((C as TTntCombobox).ItemIndex)
    else
      Result:= UTF8Encode((C as TTntCombobox).Text);
  end;

  if C is TTntMemo then
  begin
    Result:= UTF8Encode((C as TTntMemo).Lines.Text);
    Result:= StringReplace(Result, #9, #2, [rfReplaceAll]);
    Result:= StringReplace(Result, #13#10, #9, [rfReplaceAll]);
    Result:= StringReplace(Result, #13, #9, [rfReplaceAll]);
    Result:= StringReplace(Result, #10, #9, [rfReplaceAll]);
  end;

  if C is TRadioGroup then
    Result:= IntToStr((C as TRadioGroup).ItemIndex);

  //if C is TCheckGroup then
  //  for i:= 0 to (C as TCheckGroup).Items.Count-1 do
  //    Result:= Result+IntToStr(Ord((C as TCheckGroup).Checked[i]))+',';

  if C is TCheckListBox then
  begin
    Result:= IntToStr((C as TCheckListBox).ItemIndex)+';';
    for i:= 0 to (C as TCheckListBox).Items.Count-1 do
      Result:= Result+IntToStr(Ord((C as TCheckListBox).Checked[i]))+',';
  end;

  if C is TSpinEdit then
    Result:= IntToStr((C as TSpinEdit).Value);

  if C is TTntListView then
    Result:= DoGetListviewState(C as TTntListView);

  if C is TTntTabControl then
    Result:= IntToStr((C as TTntTabControl).TabIndex);
end;


function DoGetFormResult(AForm: TTntForm): string;
var
  Str: string;
  i, j: integer;
begin
  Result:= '';
  //weird loop. reason: VCL gives bad order of controls. 
  for j:= 0 to AForm.ControlCount-1 do
    for i:= 0 to AForm.ControlCount-1 do
      if AForm.Controls[i].Tag=j then
      begin
        Str:= DoGetControlState(AForm.Controls[i]);
        Result:= Result+Str+#10;
      end;
end;


procedure DoSetMemoState(C: TTntMemo; AValue: string);
var
  SItem: string;
begin
  C.Lines.Clear;
  repeat
    SItem:= SGetItem(AValue, #9);
    if SItem='' then break;
    C.Lines.Add(UTF8Decode(SItem));
  until false;
end;

(*
procedure DoSetCheckgroupState(C: TCheckGroup; AValue: string);
var
  SItem: string;
  N: integer;
begin
  N:= 0;
  repeat
    if N>=C.Items.Count then exit;
    SItem:= SGetItem(AValue);
    if SItem='' then break;
    C.Checked[N]:= StrToBool(SItem);
    Inc(N);
  until false;
end;
*)

procedure DoSetChecklistboxState(C: TCheckListBox; AValue: string);
var
  SItem: string;
  N: integer;
begin
  C.ItemIndex:= StrToIntDef(SGetItem(AValue, ';'), 0);

  N:= 0;
  repeat
    if N>=C.Items.Count then exit;
    SItem:= SGetItem(AValue);
    if SItem='' then break;
    C.Checked[N]:= StrToBool(SItem);
    Inc(N);
  until false;
end;


procedure DoSetListviewItem(C: TTntListView; SListItem: string);
var
  SItem: string;
  Col: TTntListColumn;
  i: integer;
begin
  if C.Columns.Count=0 then
  begin
    repeat
      SItem:= SGetItem(SListItem, #13);
      if SItem='' then break;
      Col:= C.Columns.Add;
      Col.Caption:= UTF8Decode(SGetItem(SItem, '='));
      if SItem<>'' then
      begin
        if SItem[1]='L' then begin Delete(SItem, 1, 1); Col.Alignment:= taLeftJustify; end;
        if SItem[1]='R' then begin Delete(SItem, 1, 1); Col.Alignment:= taRightJustify; end;
        if SItem[1]='C' then begin Delete(SItem, 1, 1); Col.Alignment:= taCenter; end;
        Col.Width:= StrToIntDef(SItem, 80);
      end;
    until false;
  end
  else
  begin
    SItem:= SGetItem(SListItem, #13);
    C.Items.Add.Caption:= UTF8Decode(SItem);
    for i:= 1 to C.Columns.Count do
    begin
      SItem:= SGetItem(SListItem, #13);
      C.Items[C.Items.Count-1].SubItems.Add(UTF8Decode(SItem));
    end;
  end;
end;


procedure DoSetListviewState(C: TTntListView; SValue: string);
var
  N: integer;
  SItem: string;
begin
  //index
  SItem:= SGetItem(SValue, ';');
  N:= StrToIntDef(SItem, 0);
  if (N>=0) and (N<C.Items.Count) then
  begin
    C.ItemFocused:= C.Items[N];
    C.Selected:= C.ItemFocused;
  end;

  //check0,check1,..
  if C.Checkboxes then
  begin
    N:= 0;
    repeat
      if N>=C.Items.Count then break;
      SItem:= SGetItem(SValue);
      if SItem='' then break;
      C.Items[N].Checked:= StrToBool(SItem);
      Inc(N);
    until false;
  end;
end;


function DoGetListviewState(C: TTntListView): string;
// index;check0,check1,
var
  i: integer;
begin
  if Assigned(C.ItemFocused) then
    Result:= IntToStr(C.ItemFocused.Index);

  if C.Checkboxes then
  begin
    Result:= Result+';';
    for i:= 0 to C.Items.Count-1 do
      Result:= Result+IntToStr(Ord(C.Items[i].Checked))+',';
  end;
end;


procedure DoAddControl(AForm: TTntForm; ATextItems: string; ADummy: TDummyClass);
var
  SNameValue, SName, SValue, SListItem: string;
  NX1, NX2, NY1, NY2: integer;
  Ctl, CtlPrev: TControl;
begin
  Ctl:= nil;
  SNameValue:= '';
  SName:= '';
  SValue:= '';
  SListItem:= '';

  repeat
    SNameValue:= SGetItem(ATextItems, Chr(1));
    if SNameValue='' then break;
    SName:= SGetItem(SNameValue, '=');
    SValue:= SNameValue;
    if SName='' then Continue;

    //-------type
    if SName='type' then
    begin
      if SValue='check' then
      begin
        Ctl:= TTntCheckBox.Create(AForm);
        (Ctl as TTntCheckBox).OnClick:= ADummy.DoOnChange;
      end;
      if SValue='radio' then
      begin
        Ctl:= TTntRadioButton.Create(AForm);
        (Ctl as TTntRadioButton).OnClick:= ADummy.DoOnChange;
      end;
      if SValue='edit' then
      begin
        Ctl:= TTntEdit.Create(AForm);
      end;
      if SValue='listbox' then
      begin
        Ctl:= TTntListbox.Create(AForm);
        (Ctl as TTntListbox).OnClick:= ADummy.DoOnChange;
      end;
      if SValue='spinedit' then
      begin
        Ctl:= TSpinEdit.Create(AForm);
      end;
      if SValue='memo' then
        begin
          Ctl:= TTntMemo.Create(AForm);
          (Ctl as TTntMemo).WordWrap:= false;
          (Ctl as TTntMemo).ScrollBars:= ssBoth;
        end;
      if SValue='label' then
        begin
          Ctl:= TTntLabel.Create(AForm);
        end;
      if SValue='combo' then
        begin
          Ctl:= TTntCombobox.Create(AForm);
          (Ctl as TTntCombobox).DropDownCount:= 20;
        end;
      if SValue='combo_ro' then
        begin
          Ctl:= TTntCombobox.Create(AForm);
          (Ctl as TTntCombobox).DropDownCount:= 20;
          (Ctl as TTntCombobox).Style:= csDropDownList;
          (Ctl as TTntCombobox).OnChange:= ADummy.DoOnChange;
        end;
      if SValue='button' then
        begin
          Ctl:= TTntButton.Create(AForm);
          (Ctl as TTntButton).ModalResult:= cButtonResultStart+ AForm.ControlCount;
          DoFixButtonHeight(Ctl);
        end;
      if SValue='checkbutton' then
        begin
          Ctl:= TTntCheckBox.Create(AForm); //not TToggleBox in D7
          (Ctl as TTntCheckBox).OnClick:= ADummy.DoOnChange;
          DoFixButtonHeight(Ctl);
        end;
      if SValue='radiogroup' then
      begin
        Ctl:= TTntRadioGroup.Create(AForm);
      end;
      //if SValue='checkgroup' then
      //begin
      //  Ctl:= TCheckGroup.Create(AForm);
      //end;
      if SValue='checklistbox' then
      begin
        Ctl:= TTntCheckListBox.Create(AForm);
        (Ctl as TTntCheckListBox).OnClickCheck:= ADummy.DoOnChange;
        (Ctl as TTntCheckListBox).OnClickCheck:= ADummy.DoOnChange;
      end;

      //disabled: label paints bad onto groupbox, Linux
      //if SValue='group' then
      //  Ctl:= TGroupBox.Create(AForm);

      if (SValue='listview') or
         (SValue='checklistview') then
      begin
        Ctl:= TTntListView.Create(AForm);
        (Ctl as TTntListView).ReadOnly:= true;
        (Ctl as TTntListView).ColumnClick:= false;
        (Ctl as TTntListView).ViewStyle:= vsReport;
        (Ctl as TTntListView).RowSelect:= true;
        (Ctl as TTntListView).HideSelection:= false;
        (Ctl as TTntListView).Checkboxes:= (SValue='checklistview');
        (Ctl as TTntListView).OnChange:= ADummy.DoOnListviewChange;
        (Ctl as TTntListView).OnSelectItem:= ADummy.DoOnListviewSelect;
      end;

      if SValue='linklabel' then
      begin
        Ctl:= TLinkLabel.Create(AForm);
      end;

      if SValue='tabs' then
      begin
        Ctl:= TTntTabControl.Create(AForm);
        (Ctl as TTntTabControl).OnChange:= ADummy.DoOnChange;
      end;

      //set parent
      if Assigned(Ctl) then
      begin
        Ctl.Parent:= AForm;
        Ctl.Tag:= AForm.ControlCount-1; //to get in ok order
      end;
      Continue;
    end;

    //first name must be "type"
    if not Assigned(Ctl) then exit;

    //adjust previous label's FocusControl
    if Ctl is TWinControl then
      if AForm.ControlCount>=2 then
      begin
        CtlPrev:= AForm.Controls[AForm.ControlCount-2];
        if CtlPrev is TTntLabel then
          (CtlPrev as TTntLabel).FocusControl:= Ctl as TWinControl;
      end;

    //-------en
    if SName='en' then
    begin
      Ctl.Enabled:= StrToBool(SValue);
      Continue;
    end;

    //-------cap
    if SName='cap' then
    begin
      if (Ctl is TTntLabel) then (Ctl as TTntLabel).Caption:= UTF8Decode(SValue);
      if (Ctl is TTntButton) then (Ctl as TTntButton).Caption:= UTF8Decode(SValue);
      if (Ctl is TTntCheckBox) then (Ctl as TTntCheckBox).Caption:= UTF8Decode(SValue);
      if (Ctl is TTntRadioButton) then (Ctl as TTntRadioButton).Caption:= UTF8Decode(SValue);
      if (Ctl is TTntEdit) then (Ctl as TTntEdit).Text:= UTF8Decode(SValue);
      Continue;
    end;

    //-------hint
    if SName='hint' then
    begin
      Ctl.Hint:= SValue;
      Continue;
    end;

    //-------act
    if SName='act' then
    begin
      if SValue='1' then
        Ctl.HelpContext:= cTagActive;
      Continue;
    end;

    //-------pos
    if SName='pos' then
    begin
      NX1:= StrToIntDef(SGetItem(SValue, ','), -1);
      NY1:= StrToIntDef(SGetItem(SValue, ','), -1);
      NX2:= StrToIntDef(SGetItem(SValue, ','), -1);
      NY2:= StrToIntDef(SGetItem(SValue, ','), -1);
      if NX1<0 then Continue;
      if NX2<0 then Continue;
      if NY1<0 then Continue;
      if NY2<0 then Continue;
      Ctl.Left:= NX1;
      Ctl.Width:= NX2-NX1;
      Ctl.Top:= NY1;
      if not IsControlAutosizeY(Ctl) then
        Ctl.Height:= NY2-NY1;
      Continue;
    end;

    //-------props
    if SName='props' then
    begin
      if Ctl is TTntButton then
      begin
        (Ctl as TTntButton).Default:= StrToBool(SGetItem(SValue));
      end;

      if Ctl is TSpinEdit then
      begin
        (Ctl as TSpinEdit).MinValue:= StrToIntDef(SGetItem(SValue), 0);
        (Ctl as TSpinEdit).MaxValue:= StrToIntDef(SGetItem(SValue), 100);
        (Ctl as TSpinEdit).Increment:= StrToIntDef(SGetItem(SValue), 1);
      end;

      if Ctl is TLinkLabel then
        (Ctl as TLinkLabel).Link:= SValue;

      if (Ctl is TTntEdit) or (Ctl is TTntMemo) then
      begin
        //RO
        if StrToBool(SGetItem(SValue)) then
        begin
          if (Ctl is TTntEdit) then (Ctl as TTntEdit).ReadOnly:= true;
          if (Ctl is TTntMemo) then (Ctl as TTntMemo).ReadOnly:= true;
          TCustomEditHack(Ctl).ParentColor:= true;
        end;
        //Monospaced
        if StrToBool(SGetItem(SValue)) then
        begin
          if Ctl is TTntEdit then
          begin
            (Ctl as TTntEdit).Font.Name:= 'Courier New';
            (Ctl as TTntEdit).Font.Size:= 9;
          end;
          if Ctl is TTntMemo then
          begin
            (Ctl as TTntMemo).Font.Name:= 'Courier New';
            (Ctl as TTntMemo).Font.Size:= 9;
          end;
        end;
        //Border
        if StrToBool(SGetItem(SValue)) then
          TCustomEditHack(Ctl).BorderStyle:= bsSingle
        else
          TCustomEditHack(Ctl).BorderStyle:= bsNone;
      end;

      if (Ctl is TTntListView) then
      begin
        (Ctl as TTntListView).GridLines:= StrToBool(SGetItem(SValue));
      end;

      if (Ctl is TTntTabControl) then
        if SValue='1' then
          (Ctl as TTntTabControl).TabPosition:= tpBottom;

      Continue;
    end;

    //-------items
    if SName='items' then
    begin
      repeat
        SListItem:= SGetItem(SValue, #9);
        if SListItem='' then break;
        if Ctl is TTntListbox then (Ctl as TTntListbox).Items.Add(UTF8Decode(SListItem));
        if Ctl is TTntCombobox then (Ctl as TTntCombobox).Items.Add(UTF8Decode(SListItem));
        //if Ctl is TCheckGroup then (Ctl as TCheckGroup).Items.Add(SListItem);
        if Ctl is TTntRadioGroup then (Ctl as TTntRadioGroup).Items.Add(UTF8Decode(SListItem));
        if Ctl is TTntCheckListBox then (Ctl as TTntCheckListBox).Items.Add(UTF8Decode(SListItem));
        if Ctl is TTntListView then DoSetListviewItem(Ctl as TTntListView, SListItem);
        if Ctl is TTntTabControl then (Ctl as TTntTabControl).Tabs.Add(UTF8Decode(SListItem));
      until false;
      Continue;
    end;

    //-------val
    if SName='val' then
    begin
      if Ctl is TTntCheckBox then (Ctl as TTntCheckBox).Checked:= StrToBool(SValue);
      //if Ctl is TToggleBox then (Ctl as TToggleBox).Checked:= StrToBool(SValue);
      if Ctl is TTntRadioButton then (Ctl as TTntRadioButton).Checked:= StrToBool(SValue);
      if Ctl is TTntEdit then
      begin
        (Ctl as TTntEdit).Text:= UTF8Decode(SValue);
      end;
      if Ctl is TTntCombobox then
      begin
        if (Ctl as TTntCombobox).Style=csDropDownList then
          (Ctl as TTntCombobox).ItemIndex:= StrToIntDef(SValue, 0)
        else
          (Ctl as TTntCombobox).Text:= UTF8Decode(SValue);
      end;
      if Ctl is TTntListbox then (Ctl as TTntListbox).ItemIndex:= StrToIntDef(SValue, 0);
      if Ctl is TTntRadioGroup then (Ctl as TTntRadioGroup).ItemIndex:= StrToIntDef(SValue, 0);
      //if Ctl is TCheckGroup then DoSetCheckgroupState(Ctl as TCheckGroup, SValue);
      if Ctl is TTntCheckListBox then DoSetChecklistboxState(Ctl as TTntCheckListBox, SValue);
      if Ctl is TTntMemo then DoSetMemoState(Ctl as TTntMemo, SValue);
      if Ctl is TSpinEdit then (Ctl as TSpinEdit).Value:= StrToIntDef(SValue, 0);
      if Ctl is TTntListView then DoSetListviewState(Ctl as TTntListView, SValue);
      if Ctl is TTntTabControl then (Ctl as TTntTabControl).TabIndex:= StrToIntDef(SValue, 0);

      Continue;
    end;

    //-------more?
  until false;
end;


procedure DoDialogCustom(const ATitle: string; ASizeX, ASizeY: integer;
  AText: string; AFocusedIndex: integer; out AButtonIndex: integer; out AStateText: string);
var
  F: TTntForm;
  Res: integer;
  SItem: string;
  Dummy: TDummyClass;
begin
  AButtonIndex:= -1;
  AStateText:= '';

  F:= TTntForm.Create(nil);
  Dummy:= TDummyClass.Create;
  FDialogShown:= true;
  try
    F.BorderStyle:= bsDialog;
    F.Position:= poScreenCenter;
    F.ClientWidth:= ASizeX;
    F.ClientHeight:= ASizeY;
    F.Caption:= UTF8Decode(ATitle);
    F.ShowHint:= true;

    repeat
      SItem:= SGetItem(AText, #10);
      if SItem='' then break;
      DoAddControl(F, SItem, Dummy);
    until false;

    if (AFocusedIndex>=0) and (AFocusedIndex<F.ControlCount) then
      if F.Controls[AFocusedIndex].Enabled then
        if F.Controls[AFocusedIndex] is TWinControl then
          F.ActiveControl:= F.Controls[AFocusedIndex] as TWinControl;

    Dummy.Form:= F;
    F.KeyPreview:= true;
    F.OnKeyDown:= Dummy.DoKeyDown;
    F.OnShow:= Dummy.DoOnShow;

    Res:= F.ShowModal;
    if Res>=cButtonResultStart then
    begin
      AButtonIndex:= Res-cButtonResultStart;
      AStateText:= DoGetFormResult(F);
    end;
  finally
    FreeAndNil(F);
    FreeAndNil(Dummy);
    FDialogShown:= false;
  end;
end;

function IsDialogCustomShown: boolean;
begin
  Result:= FDialogShown;
end;

{ TDummyClass }

procedure TDummyClass.DoOnShow(Sender: TObject);
var
  i: integer;
begin
  for i:= 0 to Form.ControlCount-1 do
    if Form.Controls[i] is TTntListView then
      with (Form.Controls[i] as TTntListView) do
        if ItemFocused<>nil then
          ItemFocused.MakeVisible(false);
end;

procedure TDummyClass.DoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_ESCAPE) then
  begin
    if Assigned(Form) then
      Form.ModalResult:= mrCancel;
    Key:= 0;
    exit;
  end;
end;

procedure TDummyClass.DoOnChange(Sender: TObject);
var
  i: integer;
begin
  if (Sender as TControl).HelpContext=cTagActive then
    for i:= 0 to Form.ControlCount-1 do
      if Form.Controls[i]=Sender then
      begin
        Form.ModalResult:= cButtonResultStart+i;
        exit
      end;
end;

procedure TDummyClass.DoOnSelChange(Sender: TObject; User: boolean);
begin
  DoOnChange(Sender);
end;

procedure TDummyClass.DoOnListviewChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  DoOnChange(Sender);
end;

procedure TDummyClass.DoOnListviewSelect(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
  DoOnChange(Sender);
end;


end.

