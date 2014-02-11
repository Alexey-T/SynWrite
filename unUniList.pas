unit unUniList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls,
  TntStdCtrls, TntForms, TntClasses;

type
  TfmUniList = class(TTntForm)
    List: TTntListBox;
    Edit: TTntEdit;
    TimerType: TTimer;
    Panel1: TPanel;
    cbFuzzy: TTntCheckBox;
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure ListDblClick(Sender: TObject);
    procedure EditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure EditChange(Sender: TObject);
    procedure TimerTypeTimer(Sender: TObject);
    procedure ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure TntFormResize(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure cbFuzzyClick(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure DoFilter;
  public
    { Public declarations }
    FIniFN: string;
    FColorSel: TColor;
    FColorSelBk: TColor;
    FListItems: TTntStringList;
    FListStyle: Integer;
  end;

implementation

uses
  TntSysUtils,
  TntWideStrings,
  Math,
  IniFiles,
  ecUnicode,
  ecStrUtils,
  unProc,
  ATxSProc;

{$R *.dfm}

procedure TfmUniList.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //Esc
  if (Key=vk_escape) and (Shift=[]) then
  begin
    ModalResult:= mrCancel;
    Key:= 0;
    Exit
  end;
  //Enter
  if (Key=vk_return) and (Shift=[]) then
  begin
    if List.ItemIndex>=0 then
      ModalResult:= mrOk;
    Key:= 0;
    Exit
  end;
  //F4
  if (Key=vk_f4) and (Shift=[]) then
  begin
    cbFuzzy.Checked:= not cbFuzzy.Checked;
    DoFilter;
    Key:= 0;
    Exit
  end;
end;

procedure TfmUniList.FormShow(Sender: TObject);
begin
  case FListStyle of
    0: List.ItemHeight:= 20;
    1: List.ItemHeight:= 33;
  end;  

  DoFilter;

  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'PyListX', Left);
    Top:= ReadInteger('Win', 'PyListY', Top);
    Width:= ReadInteger('Win', 'PyListW', Width);
    Height:= ReadInteger('Win', 'PyListH', Height);
    cbFuzzy.Checked:= ReadBool('Win', 'PyListFuzzy', false);
  finally
    Free
  end;
end;

procedure TfmUniList.DoFilter;
  //----------------
  function SFiltered(const Str: Widestring): boolean;
  var
    SFilter,
    SItem, SItemName: Widestring;
    IsFuzzy: boolean;
  begin
    SFilter:= Edit.Text;
    IsFuzzy:= cbFuzzy.Checked;

    SItem:= Str;
    SItemName:= SGetItem(SItem, #9);

    if IsFuzzy then
      Result:= SFuzzyMatch(SItemName, SFilter)
    else
      Result:= SSubstringMatch(SItemName, SFilter);
  end;
  //----------------
var
  i: Integer;
  S: Widestring;
begin
  if not Assigned(FListItems) then
    raise Exception.Create('File list not passed to form');

  List.Items.BeginUpdate;
  Screen.Cursor:= crHourGlass;
  try
    List.Items.Clear;
    for i:= 0 to FListItems.Count-1 do
    begin
      S:= FListItems[i];
      if SFiltered(S) then
        List.Items.AddObject(S, Pointer(i));
    end;
  finally
    Screen.Cursor:= crDefault;
    List.Items.EndUpdate;
  end;

  List.ItemIndex:= 0;
end;

procedure TfmUniList.ListDblClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    ModalResult:= mrOk;
end;

procedure TfmUniList.EditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (((Key=vk_prior) or (Key=vk_next) or (key=vk_up) or (key=vk_down)) and (Shift=[])) or
    (((key=vk_home) or (key=vk_end)) and (Shift=[ssCtrl])) then
    begin
      List.Perform(wm_keydown, key, 0);
      Key:= 0;
      Exit
    end;
end;

procedure TfmUniList.EditChange(Sender: TObject);
begin
  TimerType.Enabled:= false;
  TimerType.Enabled:= true;
end;

procedure TfmUniList.TimerTypeTimer(Sender: TObject);
begin
  TimerType.Enabled:= false;
  DoFilter;
end;

procedure TfmUniList.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  S, SName, SDesc: Widestring;
  i, n: Integer;
  Arr: TSynCharArray;
begin
  with Control as TTntListbox do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= FColorSelBk
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);
    Inc(Rect.Left, 2);

    S:= Items[Index];
    SName:= SGetItem(S, #9);
    SDesc:= SGetItem(S, #9);

    //name
    Canvas.Font.Size:= Self.Font.Size;
    Canvas.Font.Color:= IfThen(odSelected in State, FColorSel, Font.Color);
    ecTextOut(Canvas, rect.left, rect.top, SName);

    if FListStyle=1 then
    begin
      //desc
      Canvas.Font.Size:= Self.Font.Size-2;
      Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clNavy);
      ecTextOut(Canvas, rect.left, rect.top + List.ItemHeight div 2, SDesc);

      //separator
      Canvas.Pen.Color:= clLtGray;
      n:= rect.top+ List.ItemHeight-1;
      Canvas.MoveTo(2, n);
      Canvas.LineTo(ClientWidth-2, n);
    end;

    //filter chars
    if cbFuzzy.Checked then
    begin
      Canvas.Font.Size:= Self.Font.Size;
      Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clBlue);
      SGetCharArray(SName, Edit.Text, Arr);
      for i:= Low(Arr) to High(Arr) do
        if Arr[i]>0 then
        begin
          n:= ecTextExtent(Canvas, Copy(SName, 1, Arr[i]-1)).cx;
          ecTextOut(Canvas, rect.left+n, rect.top, Copy(SName, Arr[i], 1));
        end
        else
          Break;
    end;
  end;
end;

procedure TfmUniList.TntFormResize(Sender: TObject);
begin
  List.Invalidate;
end;

procedure TfmUniList.TntFormCreate(Sender: TObject);
begin
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmUniList.cbFuzzyClick(Sender: TObject);
begin
  DoFilter;
end;

procedure TfmUniList.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'PyListX', Left);
    WriteInteger('Win', 'PyListY', Top);
    WriteInteger('Win', 'PyListW', Width);
    WriteInteger('Win', 'PyListH', Height);
    WriteBool('Win', 'PyListFuzzy', cbFuzzy.Checked);
  finally
    Free
  end;
end;

end.
