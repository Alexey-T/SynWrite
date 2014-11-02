unit unExtr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  ecSyntMemo,
  ATSyntMemo,
  unSearch,
  DKLang,
  TntStdCtrls, TntForms,
  TntClasses, TntComCtrls;

type
  TfmExtract = class(TTntForm)
    DKLanguageController1: TDKLanguageController;
    PanelRt: TPanel;
    bFind: TTntButton;
    bCopy: TTntButton;
    bTab: TTntButton;
    bHelp: TTntButton;
    bCan: TTntButton;
    PanelMid: TPanel;
    b1: TTntGroupBox;
    TntLabel1: TTntLabel;
    ed: TTntComboBox;
    bCase: TTntCheckBox;
    bSel: TTntCheckBox;
    bCur: TTntCheckBox;
    b2: TTntGroupBox;
    List: TTntListBox;
    PanelLeft: TPanel;
    Status: TTntStatusBar;
    procedure bCopyClick(Sender: TObject);
    procedure bFindClick(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure edKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    Finder: TSynFinderReplacer;
    procedure DoClearMarks;
    procedure ReadIni;
    procedure SaveIni;
  public
    { Public declarations }
    FSynIni: string;
    SRCount: Integer;
    Memo: TSyntaxMemo;
  end;

var
  fmExtract: TfmExtract;

implementation

uses
  TntClipbrd,
  Inifiles,
  ATxSProc,
  unSR,
  unProc,
  unProcHelp,
  unProcEditor,
  unProcLines,
  ecStrUtils, ecCmdConst;

{$R *.dfm}

procedure TfmExtract.bCopyClick(Sender: TObject);
begin
  TntClipboard.AsWideText:= List.Items.Text;
  Close;
end;

procedure TfmExtract.DoClearMarks;
begin
  Memo.ExecCommand(smSearchMarkReset);
end;

procedure TfmExtract.bFindClick(Sender: TObject);
var
  L: TTntStringList;
  Msg: string;
begin
  if not IsRegexValid(ed.Text, Msg) then
  begin
    Status.SimpleText:= DKLangConstW('zMRegexInvalid')+': '+Msg;
    Exit;
  end;

  ComboUpdate(ed, SRCount);
  DoClearMarks;
  
  with Finder do
  begin
    Control:= Self.Memo;
    FindText:= ed.Text;
    Flags:= [ftRegex{, ftRegex_m}];
    if bCase.Checked then Flags:= Flags + [ftCaseSens];
    if bSel.Checked then Flags:= Flags + [ftSelectedText];
    if not bCur.Checked then Flags:= Flags + [ftEntireScope];
    FindAll;
  end;

  bCopy.Enabled:= false;
  bTab.Enabled:= false;

  L:= TTntStringList.Create;
  try
    EditorSearchMarksToList(Memo, L);
    DoListCommand_Deduplicate(L, cLineDedupAll);
    List.Items.Clear;
    List.Items.AddStrings(L);
  finally
    FreeAndNil(L);
  end;
  FixListboxHorzScrollbar(List);

  bCopy.Enabled:= List.Items.Count>0;
  bTab.Enabled:= bCopy.Enabled;

  if List.Items.Count=0 then
    Status.SimpleText:= WideFormat(DKLangConstW('MNFound2'), [ed.Text])
  else
    Status.SimpleText:= WideFormat(DKLangConstW('Found'), [List.Items.Count]);
end;

procedure TfmExtract.bHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpRegex, Handle);
end;

procedure TfmExtract.FormCreate(Sender: TObject);
begin
  Finder:= TSynFinderReplacer.Create(Self);
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmExtract.ReadIni;
begin
  with TIniFile.Create(FSynIni) do
  try
    DoCenterForm(Handle, Self);
    Left:= ReadInteger('Extract', 'WinX', Left);
    Top:= ReadInteger('Extract', 'WinY', Top);
    Width:= ReadInteger('Extract', 'WinW', Width);
    Height:= ReadInteger('Extract', 'WinH', Height);
    bCase.Checked:= ReadBool('Extract', 'Case', false);
    bSel.Checked:= ReadBool('Extract', 'Sel', false) and Memo.HaveSelection;
    bCur.Checked:= ReadBool('Extract', 'Cur', false);
  finally
    Free;
  end;

  ComboLoadFromFile(ed, FSynIni, 'ExtractHist');
end;

procedure TfmExtract.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  DoClearMarks;
  SaveIni;
end;

procedure TfmExtract.SaveIni;
begin
  with TIniFile.Create(FSynIni) do
  try
    WriteInteger('Extract', 'WinX', Left);
    WriteInteger('Extract', 'WinY', Top);
    WriteInteger('Extract', 'WinW', Width);
    WriteInteger('Extract', 'WinH', Height);
    WriteBool('Extract', 'Case', bCase.Checked);
    WriteBool('Extract', 'Sel', bSel.Checked);
    WriteBool('Extract', 'Cur', bCur.Checked);
  finally
    Free;
  end;

  ComboSaveToFile(ed, FSynIni, 'ExtractHist');
end;

procedure TfmExtract.FormShow(Sender: TObject);
begin
  ReadIni;
  bSel.Enabled:= Memo.HaveSelection;
end;

procedure TfmExtract.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var
  c: TColor;
  S, SS: Widestring;
  n: Integer;
begin
  with TTntListbox(Control) do
  begin
    if odSelected in State then
      Canvas.Brush.Color:= clMenuHighlight
    else
      Canvas.Brush.Color:= Color;
    Canvas.FillRect(Rect);

    if odSelected in State then
      c:= clHighlightText
    else
      c:= Font.Color;

    S:= Items[Index];
    Delete(S, 400, MaxInt);
    SReplaceAllW(S, #13#10, #13);
    SReplaceAllW(S, #10, #13);
    SS:= S;
    repeat
      n:= Pos(#13, S);
      if n>0 then
      begin
        SS:= Copy(S, 1, n-1);
        Canvas.Font.Color:= c;
        Inc(Rect.Left, 2);
        ecTextOut(Canvas, rect.left, rect.top, SS);
        Inc(Rect.Left, ecTextExtent(Canvas, SS).cx);
        Canvas.Font.Color:= clBlue;
        ecTextOut(Canvas, rect.left, rect.top, '/');
        Inc(Rect.Left, ecTextExtent(Canvas, '/').cx);
        Delete(S, 1, n);
      end
      else
      begin
        SS:= S;
        Canvas.Font.Color:= c;
        Inc(Rect.Left, 2);
        ecTextOut(Canvas, rect.left, rect.top, SS);
        Break
      end;
    until False;
  end;
end;

procedure TfmExtract.edKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[ssAlt]) then
  begin
    DoDeleteComboItem(ed);
    Key:= 0;
    Exit
  end;
end;

procedure TfmExtract.edKeyPress(Sender: TObject; var Key: Char);
begin
  DoHandleCtrlBkSp(ed, Key);
end;

end.
