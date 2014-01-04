unit unSnipList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  ExtCtrls,
  ATxSProc;

type
  TfmSnippetList = class(TTntForm)
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
    FInfoList: TList;
    FCurrentLexer: string;
    FIniFN: string;
    FColorSel: TColor;
    FColorSelBk: TColor;
  end;

implementation

uses
  TntClasses, TntWideStrings,
  Math,
  IniFiles,
  ecStrUtils,
  unProc,
  unProcHelp;

{$R *.dfm}

procedure TfmSnippetList.FormKeyDown(Sender: TObject; var Key: Word;
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
  {
  if (Key=vk_f1) and (Shift=[]) then
  begin
    labHelpClick(Self);
    Key:= 0;
    Exit
  end;
  }
end;

procedure TfmSnippetList.FormShow(Sender: TObject);
begin
  DoFilter;

  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'CmdListX', Left);
    Top:= ReadInteger('Win', 'CmdListY', Top);
    Width:= ReadInteger('Win', 'CmdListW', Width);
    Height:= ReadInteger('Win', 'CmdListH', Height);
    cbFuzzy.Checked:= ReadBool('Win', 'CmdListFuzzy', false);
  finally
    Free
  end;
end;

procedure TfmSnippetList.DoFilter;
  function SFiltered(const S: Widestring): boolean;
  begin
    if cbFuzzy.Checked then
      Result:= SFuzzyMatch(S, Edit.Text)
    else
      Result:= SSubstringMatch(S, Edit.Text);
  end;
var
  i: Integer;
  SName, SKey: Widestring;
  AInfo: TSynSnippetInfo;
begin
  List.Items.BeginUpdate;
  try
    List.Items.Clear;
    for i:= 0 to FInfoList.Count-1 do
      begin
        AInfo:= TSynSnippetClass(FInfoList[i]).Info;
        SName:= AInfo.Name;
        SKey:= AInfo.Id;
        if AInfo.Lexers<>'' then
          SKey:= SKey + '  [' + AInfo.Lexers + ']';

        if (AInfo.Lexers='') or (IsStringListed(FCurrentLexer, AInfo.Lexers)) then
          if SFiltered(SName) then
            List.Items.AddObject(SName + #9 + SKey, Pointer(i));
      end;
  finally
    List.Items.EndUpdate;
  end;

  List.ItemIndex:= 0;
end;

procedure TfmSnippetList.ListDblClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    ModalResult:= mrOk;
end;

procedure TfmSnippetList.EditKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmSnippetList.EditChange(Sender: TObject);
begin
  TimerType.Enabled:= false;
  TimerType.Enabled:= true;
end;

procedure TfmSnippetList.TimerTypeTimer(Sender: TObject);
begin
  TimerType.Enabled:= false;
  DoFilter;
end;

procedure TfmSnippetList.ListDrawItem(Control: TWinControl; Index: Integer;
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

procedure TfmSnippetList.TntFormResize(Sender: TObject);
begin
  List.Invalidate;
end;

procedure TfmSnippetList.TntFormCreate(Sender: TObject);
begin
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmSnippetList.cbFuzzyClick(Sender: TObject);
begin
  DoFilter;
end;

procedure TfmSnippetList.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'CmdListX', Left);
    WriteInteger('Win', 'CmdListY', Top);
    WriteInteger('Win', 'CmdListW', Width);
    WriteInteger('Win', 'CmdListH', Height);
    WriteBool('Win', 'CmdListFuzzy', cbFuzzy.Checked);
  finally
    Free
  end;
end;

end.
