unit unMenuSnippets;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  ExtCtrls,
  ATxSProc, Buttons, TntButtons;

type
  TfmMenuSnippets = class(TTntForm)
    List: TTntListBox;
    Edit: TTntEdit;
    TimerType: TTimer;
    Splitter1: TSplitter;
    PanelLow: TPanel;
    MemoText: TTntMemo;
    Panel1: TPanel;
    LabelInfo: TTntLabel;
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
    procedure ListClick(Sender: TObject);
    procedure ListKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnEditClick(Sender: TObject);
  private
    { Private declarations }
    FFuzzy: boolean;
    procedure DoFilter;
  public
    { Public declarations }
    FInfoList: TList;
    FCurrentLexer: string;
    FIniFN: string;
    FColorSel: TColor;
    FColorSelBk: TColor;
    FModified: boolean;
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

procedure TfmMenuSnippets.FormKeyDown(Sender: TObject; var Key: Word;
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
    FFuzzy:= not FFuzzy;
    DoFilter;
    Key:= 0;
    Exit
  end;
  //F5
  if (Key=vk_f5) and (Shift=[]) then
  begin
    btnEditClick(Self);
    Key:= 0;
    Exit;
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

procedure TfmMenuSnippets.FormShow(Sender: TObject);
begin
  DoFilter;

  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'SnipX', Left);
    Top:= ReadInteger('Win', 'SnipY', Top);
    Width:= ReadInteger('Win', 'SnipW', Width);
    Height:= ReadInteger('Win', 'SnipH', Height);
    FFuzzy:= ReadBool('Win', 'SnipFuzzy', false);
    PanelLow.Height:= ReadInteger('Win', 'SnipSplit', 100);
    Splitter1.Top:= 0;
  finally
    Free
  end;

  FModified:= false;
  TimerType.Enabled:= false;
end;

function SnippetItemString(const Info: TSynSnippetInfo): Widestring;
begin
  Result:= Info.Name + #9 + Info.Id;
  if Info.Lexers<>'' then
    Result:= Result + '  [' + Info.Lexers + ']';
end;

procedure TfmMenuSnippets.DoFilter;
  function SFiltered(const S: Widestring): boolean;
  begin
    if FFuzzy then
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
          if SFiltered(SName) or SFiltered(SKey) then
            List.Items.AddObject(SnippetItemString(AInfo), Pointer(i));
      end;
  finally
    List.Items.EndUpdate;
  end;

  List.ItemIndex:= 0;
  ListClick(Self);
end;

procedure TfmMenuSnippets.ListDblClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    ModalResult:= mrOk;
end;

procedure TfmMenuSnippets.EditKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmMenuSnippets.EditChange(Sender: TObject);
begin
  TimerType.Enabled:= false;
  TimerType.Enabled:= true;
end;

procedure TfmMenuSnippets.TimerTypeTimer(Sender: TObject);
begin
  TimerType.Enabled:= false;
  DoFilter;
end;

procedure TfmMenuSnippets.ListDrawItem(Control: TWinControl; Index: Integer;
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
    if FFuzzy then
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

procedure TfmMenuSnippets.TntFormResize(Sender: TObject);
begin
  List.Invalidate;
end;

procedure TfmMenuSnippets.TntFormCreate(Sender: TObject);
begin
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmMenuSnippets.cbFuzzyClick(Sender: TObject);
begin
  DoFilter;
end;

procedure TfmMenuSnippets.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'SnipX', Left);
    WriteInteger('Win', 'SnipY', Top);
    WriteInteger('Win', 'SnipW', Width);
    WriteInteger('Win', 'SnipH', Height);
    WriteInteger('Win', 'SnipSplit', PanelLow.Height);
    WriteBool('Win', 'SnipFuzzy', FFuzzy);
  finally
    Free
  end;
end;

procedure TfmMenuSnippets.ListClick(Sender: TObject);
var
  Index: Integer;
begin
  Index:= List.ItemIndex;
  if Index>=0 then
  begin
    Index:= Integer(List.Items.Objects[Index]);
    MemoText.Lines.Text:= TSynSnippetClass(FInfoList[Index]).Info.Text
  end
  else
    MemoText.Lines.Clear;  
end;

procedure TfmMenuSnippets.ListKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_up) and (List.ItemIndex=0) then
  begin
    List.ItemIndex:= List.Items.Count-1;
    Key:= 0;
    Exit
  end;
  if (Key=vk_down) and (List.ItemIndex=List.Items.Count-1) then
  begin
    List.ItemIndex:= 0;
    Key:= 0;
    Exit
  end;
end;

procedure TfmMenuSnippets.btnEditClick(Sender: TObject);
var
  Index: Integer;
  Data: TSynSnippetClass;
begin
  Index:= List.ItemIndex;
  if Index>=0 then
  begin
    Index:= Integer(List.Items.Objects[Index]);
    Data:= TSynSnippetClass(FInfoList[Index]);
    if DoSnippetEditorDialog(Data.Info) then
    begin
      DoSaveSnippetToFile(Data.Info.Filename, Data.Info);
      FModified:= true;

      List.Items[List.ItemIndex]:= SnippetItemString(Data.Info);
      ListClick(Self);
    end;
  end;
end;

end.
