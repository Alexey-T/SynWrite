unit unProjList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms, TntClasses,
  ecKeyMap, ExtCtrls, unProj;

type
  TfmProjList = class(TTntForm)
    List: TTntListBox;
    Edit: TTntEdit;
    TimerType: TTimer;
    Panel1: TPanel;
    labHelp: TLabel;
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
    procedure labHelpClick(Sender: TObject);
    procedure cbFuzzyClick(Sender: TObject);
    procedure TntFormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure DoFilter;
  public
    { Public declarations }
    FIniFN: string;
    fmProj: TfmProj;
    FColorSel: TColor;
    FColorSelBk: TColor;
    FListFiles: TTntStringList;
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
  unProcHelp,
  ATxSProc;

{$R *.dfm}

procedure TfmProjList.FormKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmProjList.FormShow(Sender: TObject);
begin
  DoFilter;

  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Win', 'ProjListX', Left);
    Top:= ReadInteger('Win', 'ProjListY', Top);
    Width:= ReadInteger('Win', 'ProjListW', Width);
    Height:= ReadInteger('Win', 'ProjListH', Height);
    cbFuzzy.Checked:= ReadBool('Win', 'ProjListFuzzy', false);
  finally
    Free
  end;
end;

procedure TfmProjList.DoFilter;
  //----------------
  function SFiltered(const fn: Widestring): boolean;
  var
    SFilter, SContent,
    SRealDir, SRealFN,
    SFilterDir, SFilterFN: Widestring;
    N: Integer;
    IsCaseIgnore, IsFuzzy: boolean;
  begin
    SFilter:= Edit.Text;
    SContent:= '';
    IsCaseIgnore:= false;
    IsFuzzy:= cbFuzzy.Checked;

    // "@Word" starts case-sensitive content search,
    // "@@Word" starts case-insensitive
    N:= Pos('@', SFilter);
    if N>0 then
    begin
      SContent:= Copy(SFilter, N+1, MaxInt);
      IsCaseIgnore:= (SContent<>'') and (SContent[1]='@');
      if IsCaseIgnore then
        Delete(SContent, 1, 1);

      Delete(SFilter, N, MaxInt);
      SFilter:= WideTrim(SFilter);
    end;

    SRealDir:= WideExtractFileDir(fn);
    SRealFN:= WideExtractFileName(fn);

    SFilterDir:= WideExtractFileDir(SFilter);
    SFilterFN:= WideExtractFileName(SFilter);

    if IsFuzzy then
      Result:= SFuzzyMatch(SRealFN, SFilterFN) and SFuzzyMatch(SRealDir, SFilterDir)
    else
      Result:= SSubstringMatch(SRealFN, SFilterFN) and SSubstringMatch(SRealDir, SFilterDir);

    if Result then
      if SContent<>'' then
        Result:= FFindStringInFile(fn, SContent, IsCaseIgnore);
  end;
  //----------------
var
  i: Integer;
  S: Widestring;
begin
  if not Assigned(FListFiles) then
    raise Exception.Create('File list not passed to form');

  List.Items.BeginUpdate;
  Screen.Cursor:= crHourGlass;
  try
    List.Items.Clear;
    for i:= 0 to FListFiles.Count-1 do
    begin
      S:= FListFiles[i];
      if SFiltered(S) then
        List.Items.AddObject(S, Pointer(i));
    end;
  finally
    Screen.Cursor:= crDefault;
    List.Items.EndUpdate;
  end;

  List.ItemIndex:= 0;
end;

procedure TfmProjList.ListDblClick(Sender: TObject);
begin
  if List.ItemIndex>=0 then
    ModalResult:= mrOk;
end;

procedure TfmProjList.EditKeyDown(Sender: TObject; var Key: Word;
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

procedure TfmProjList.EditChange(Sender: TObject);
begin
  TimerType.Enabled:= false;
  TimerType.Enabled:= true;
end;

procedure TfmProjList.TimerTypeTimer(Sender: TObject);
begin
  TimerType.Enabled:= false;
  DoFilter;
end;

procedure TfmProjList.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
const
  dx = 20; //offset of text from left edge (for icon)
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
    S1:= WideExtractFileName(S);
    S2:= WideExtractFileDir(S);

    //icon
    if not Assigned(fmProj) then
      raise Exception.Create('fmProj not inited');
    n:= fmProj.GetImageIndex(S);
    if (n>=0) then
      fmProj.ImageList1.Draw(Canvas, rect.left, rect.top+2, n);

    //filename
    Canvas.Font.Size:= Self.Font.Size;
    Canvas.Font.Color:= IfThen(odSelected in State, FColorSel, Font.Color);
    ecTextOut(Canvas, rect.left+dx, rect.top, S1);

    //path
    Canvas.Font.Size:= Self.Font.Size-2;
    Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clNavy);
    ecTextOut(Canvas, rect.left+dx, rect.top + List.ItemHeight div 2, S2);

    //separator
    Canvas.Pen.Color:= clLtGray;
    n:= rect.top+ List.ItemHeight-1;
    Canvas.MoveTo(2, n);
    Canvas.LineTo(ClientWidth-2, n);

    //filter chars
    if cbFuzzy.Checked then
    begin
      Canvas.Font.Size:= Self.Font.Size;
      Canvas.Font.Color:= IfThen(odSelected in State, clYellow, clBlue);
      SGetCharArray(S1, Edit.Text, Arr);
      for i:= Low(Arr) to High(Arr) do
        if Arr[i]>0 then
        begin
          n:= ecTextExtent(Canvas, Copy(S1, 1, Arr[i]-1)).cx;
          Inc(n, dx); //icon width
          ecTextOut(Canvas, rect.left+n, rect.top, Copy(S1, Arr[i], 1));
        end
        else
          Break;
    end;
  end;
end;

procedure TfmProjList.TntFormResize(Sender: TObject);
begin
  List.Invalidate;
end;

procedure TfmProjList.TntFormCreate(Sender: TObject);
begin
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmProjList.labHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpCmdListDlg, Handle);
end;

procedure TfmProjList.cbFuzzyClick(Sender: TObject);
begin
  DoFilter;
end;

procedure TfmProjList.TntFormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if FIniFN<>'' then
  with TIniFile.Create(FIniFN) do
  try
    WriteInteger('Win', 'ProjListX', Left);
    WriteInteger('Win', 'ProjListY', Top);
    WriteInteger('Win', 'ProjListW', Width);
    WriteInteger('Win', 'ProjListH', Height);
    WriteBool('Win', 'ProjListFuzzy', cbFuzzy.Checked);
  finally
    Free
  end;
end;

end.
