unit unExtr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  TntStdCtrls, TntForms,
  ecSyntMemo, unSearch, DKLang;

type
  TfmExtract = class(TTntForm)
    b1: TTntGroupBox;
    bFind: TTntButton;
    bCopy: TTntButton;
    b2: TTntGroupBox;
    List: TTntListBox;
    ed: TTntComboBox;
    TntLabel1: TTntLabel;
    bCan: TTntButton;
    bHelp: TTntButton;
    bCase: TTntCheckBox;
    DKLanguageController1: TDKLanguageController;
    bSel: TTntCheckBox;
    bTab: TTntButton;
    bCur: TTntCheckBox;
    labNot: TTntLabel;
    procedure bCopyClick(Sender: TObject);
    procedure bFindClick(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure bTabClick(Sender: TObject);
    procedure ListDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure edKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
    Finder: TSynFindReplace;
    procedure Clr;
    procedure ReadIni;
    procedure SaveIni;
  public
    { Public declarations }
    SynDir: string;
    SynIni: string;
    SRCount: Integer;
    Memo: TSyntaxMemo;
  end;

var
  fmExtract: TfmExtract;

implementation

uses TntClipbrd,
  Inifiles, ATxSProc,
  unSR, unProc, ecStrUtils, ecCmdConst;

{$R *.dfm}

const
  cc = 30; //Max items in history

procedure TfmExtract.bCopyClick(Sender: TObject);
begin
  TntClipboard.AsWideText:= List.Items.Text;
  Close;
end;

procedure TfmExtract.Clr;
begin
  Memo.ExecCommand(smSearchMarkReset);
end;

procedure TfmExtract.bFindClick(Sender: TObject);
var i:Integer;
begin
  SSave(ed, SRCount);

  Clr;
  with Finder do
  begin
    Control:= Self.Memo;
    FindText:= ed.Text;
    Flags:= [ftRegularExpr];
    if bCase.Checked then
      Flags:= Flags + [ftCaseSensitive];
    if bSel.Checked then
      Flags:= Flags + [ftSelectedText];
    if not bCur.Checked then
      Flags:= Flags + [ftEntireScope];
    FindAll;
    labNot.Visible:= Matches=0;
  end;

  List.Items.Clear;
  bCopy.Enabled:= false;
  bTab.Enabled:= false;
  with Memo.SearchMarks do
    for i:= 0 to Count-1 do
    begin
      List.Items.Add(Copy(Memo.Text, Items[i].StartPos+1, Items[i].Size));
    end;
  bCopy.Enabled:= List.Items.Count>0;
  bTab.Enabled:= bCopy.Enabled;
end;

procedure TfmExtract.bHelpClick(Sender: TObject);
begin
  ShowHelp(SynDir, helpRegex, Handle);
end;

procedure TfmExtract.FormCreate(Sender: TObject);
begin
  Finder:= TSynFindReplace.Create(Self);
  List.ItemHeight:= ScaleFontSize(List.ItemHeight, Self);
end;

procedure TfmExtract.ReadIni;
begin
  with TIniFile.Create(SynIni) do
  try
    //Width:= ReadInteger('Extract', 'WinW', Width);
    //Height:= ReadInteger('Extract', 'WinH', Height);
    bCase.Checked:= ReadBool('Extract', 'Case', false);
    bSel.Checked:= ReadBool('Extract', 'Sel', false) and Memo.HaveSelection;
    bCur.Checked:= ReadBool('Extract', 'Cur', false);
  finally
    Free;
  end;

  SLoadCombo(ed, SynIni, 'ExHist');
end;

procedure TfmExtract.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Clr;
  SaveIni;
end;

procedure TfmExtract.SaveIni;
begin
  with TIniFile.Create(SynIni) do
  try
    WriteInteger('Extract', 'WinW', Width);
    WriteInteger('Extract', 'WinH', Height);
    WriteBool('Extract', 'Case', bCase.Checked);
    WriteBool('Extract', 'Sel', bSel.Checked);
    WriteBool('Extract', 'Cur', bCur.Checked);
  finally
    Free;
  end;

  SSaveCombo(ed, SynIni, 'ExHist');
end;

procedure TfmExtract.FormShow(Sender: TObject);
begin
  ReadIni;
  bSel.Enabled:= Memo.HaveSelection;
end;

procedure TfmExtract.bTabClick(Sender: TObject);
begin
  //
end;

procedure TfmExtract.ListDrawItem(Control: TWinControl; Index: Integer;
  Rect: TRect; State: TOwnerDrawState);
var c: TColor;
  S, SS:Widestring;
  n:Integer;
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

end.
