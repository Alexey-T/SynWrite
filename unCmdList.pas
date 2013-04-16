unit unCmdList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  ecKeyMap, ExtCtrls;

type
  TfmCmdList = class(TTntForm)
    List: TTntListBox;
    Keys: TSyntKeyMapping;
    Edit: TTntEdit;
    TimerType: TTimer;
    Panel1: TPanel;
    cbFuzzy: TTntCheckBox;
    labHelp: TLabel;
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
    procedure labHelpClick(Sender: TObject);
    procedure cbFuzzyClick(Sender: TObject);
  private
    { Private declarations }
    procedure DoFilter;
  public
    { Public declarations }
    SynDir: string;
    FColorSel: TColor;
    FColorSelBk: TColor;
  end;

implementation

uses
  TntClasses, TntWideStrings,
  Math,
  ecStrUtils,
  unProc,
  ATxSProc;

{$R *.dfm}

procedure TfmCmdList.FormKeyDown(Sender: TObject; var Key: Word;
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
  //F1
  if (Key=vk_f1) and (Shift=[]) then
  begin
    labHelpClick(Self);
    Key:= 0;
    Exit
  end;
end;

procedure TfmCmdList.FormShow(Sender: TObject);
begin
  DoFilter;
end;

procedure TfmCmdList.DoFilter;
  function SFiltered(const S: Widestring): boolean;
  begin
    if cbFuzzy.Checked then
      Result:= SFuzzyMatch(S, Edit.Text)
    else
      Result:= SSubstringMatch(S, Edit.Text);
  end;      
var
  i, j: Integer;
  ListCat: TTntStringList;
  S, SKey: Widestring;
begin
  ListCat:= TTntStringList.Create;
  for i:= 0 to Keys.Items.Count-1 do
    if ListCat.IndexOf(Keys.Items[i].Category)<0 then
      ListCat.Add(Keys.Items[i].Category);

  List.Items.BeginUpdate;
  try
    List.Items.Clear;
    for j:= 0 to ListCat.Count-1 do
      for i:= 0 to Keys.Items.Count-1 do
        if ListCat[j]=Keys.Items[i].Category then
          if Keys.Items[i].Command>0 then
          begin
            S:= Keys.Items[i].Category + ': ' + Keys.Items[i].DisplayName;
            if Keys.Items[i].KeyStrokes.Count>0 then
            begin
              SKey:= Keys.Items[i].KeyStrokes[0].AsString;
              if Keys.Items[i].KeyStrokes.Count>1 then
                SKey:= SKey+' / '+Keys.Items[i].KeyStrokes[1].AsString;
            end
            else
              SKey:= '';
            if SFiltered(S) then
              List.Items.AddObject(S + #9 + SKey, Pointer(Keys.Items[i].Command));
          end;
  finally
    List.Items.EndUpdate;
    FreeAndNil(ListCat);
  end;

  List.ItemIndex:= 0;
end;

procedure TfmCmdList.ListDblClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    ModalResult:= mrOk;
end;

procedure TfmCmdList.EditKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmCmdList.EditChange(Sender: TObject);
begin
  TimerType.Enabled:= false;
  TimerType.Enabled:= true;
end;

procedure TfmCmdList.TimerTypeTimer(Sender: TObject);
begin
  TimerType.Enabled:= false;
  DoFilter;
end;

procedure TfmCmdList.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  S, S1, S2: Widestring;
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
    n:= Pos(#9, S);
    if n=0 then n:= 600;
    S1:= Copy(S, 1, n-1);
    S2:= Copy(S, n+1, MaxInt);
    n:= ecTextExtent(Canvas, S2).cx+4;

    //shortcut
    Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clNavy);
    ecTextOut(Canvas, rect.right-n, rect.top, S2);

    //caption
    Canvas.Font.Color:= IfThen(odSelected in State, FColorSel, Font.Color);
    ecTextOut(Canvas, rect.left, rect.top, S1);

    //filter chars
    if cbFuzzy.Checked then
    begin
      Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clBlue);
      SGetCharArray(S1, Edit.Text, Arr);
      for i:= Low(Arr) to High(Arr) do
        if Arr[i]>0 then
        begin
          n:= ecTextExtent(Canvas, Copy(S1, 1, Arr[i]-1)).cx;
          ecTextOut(Canvas, rect.left+n, rect.top, Copy(S1, Arr[i], 1));
        end
        else
          Break;
    end;      
  end;
end;

procedure TfmCmdList.TntFormResize(Sender: TObject);
begin
  List.Invalidate;
end;

procedure TfmCmdList.TntFormCreate(Sender: TObject);
begin
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmCmdList.labHelpClick(Sender: TObject);
begin
  ShowHelp(SynDir, helpCmdListDlg, Handle);
end;

procedure TfmCmdList.cbFuzzyClick(Sender: TObject);
begin
  DoFilter;
end;

end.
