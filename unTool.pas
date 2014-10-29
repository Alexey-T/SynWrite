unit unTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntDialogs, StdCtrls, TntStdCtrls, TntForms, DKLang,
  Menus, ecHotKeyEdit, unProc;

type
  TfmTools = class(TTntForm)
    OpenDlg: TTntOpenDialog;
    boxProp: TTntGroupBox;
    TntLabel1: TTntLabel;
    edCmd: TTntEdit;
    bBr: TTntButton;
    TntLabel2: TTntLabel;
    edPar: TTntEdit;
    TntLabel3: TTntLabel;
    edDir: TTntEdit;
    bOk: TTntButton;
    bCancel: TTntButton;
    DKLanguageController1: TDKLanguageController;
    boxList: TTntGroupBox;
    bBr2: TTntButton;
    bUp: TTntButton;
    bDn: TTntButton;
    bPar: TTntButton;
    mnuPar: TPopupMenu;
    pFileName: TMenuItem;
    pFileDir: TMenuItem;
    pCurWord: TMenuItem;
    pCurLineNum: TMenuItem;
    cbOut: TTntCheckBox;
    bOut: TTntButton;
    TntLabel4: TTntLabel;
    edName: TTntEdit;
    bClr: TTntButton;
    labKey: TTntLabel;
    edKey: TecHotKey;
    TntLabel6: TTntLabel;
    edLexer: TTntComboBox;
    bLex: TTntButton;
    bKey: TTntButton;
    TntLabel7: TTntLabel;
    edSave: TTntComboBox;
    pCurLine: TMenuItem;
    pCurColNum: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    pFileNameOnly: TMenuItem;
    cbCtx: TTntCheckBox;
    bHelp: TTntButton;
    N3: TMenuItem;
    pInter: TMenuItem;
    pInterFile: TMenuItem;
    pInterDir: TMenuItem;
    edOutType: TTntComboBox;
    TntLabel8: TTntLabel;
    TntLabel9: TTntLabel;
    pFileExt: TMenuItem;
    pFileNameNoExt: TMenuItem;
    pSelText: TMenuItem;
    edOutEnc: TTntComboBox;
    N4: TMenuItem;
    pProj1: TMenuItem;
    pProj2: TMenuItem;
    pProj3: TMenuItem;
    pSelFN: TMenuItem;
    pSelFNAnsi: TMenuItem;
    N5: TMenuItem;
    pFileName2: TMenuItem;
    pFileNameN1: TMenuItem;
    pFileNameN2: TMenuItem;
    N6: TMenuItem;
    pSynDir: TMenuItem;
    pSynIniDir: TMenuItem;
    pContFN: TMenuItem;
    pContFNAnsi: TMenuItem;
    pProj4: TMenuItem;
    pSynDrive: TMenuItem;
    List: TTntListBox;
    procedure bBrClick(Sender: TObject);
    procedure bBr2Click(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure edCmdChange(Sender: TObject);
    procedure edParChange(Sender: TObject);
    procedure edDirChange(Sender: TObject);
    procedure TntFormShow(Sender: TObject);
    procedure bUpClick(Sender: TObject);
    procedure bDnClick(Sender: TObject);
    procedure p0Click(Sender: TObject);
    procedure bParClick(Sender: TObject);
    procedure TntFormCreate(Sender: TObject);
    procedure bOutClick(Sender: TObject);
    procedure cbOutClick(Sender: TObject);
    procedure edNameChange(Sender: TObject);
    procedure bClrClick(Sender: TObject);
    procedure edLexerChange(Sender: TObject);
    procedure edKeyChange(Sender: TObject);
    procedure bLexClick(Sender: TObject);
    procedure bKeyClick(Sender: TObject);
    procedure edSaveChange(Sender: TObject);
    procedure TntFormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cbCtxClick(Sender: TObject);
    procedure bHelpClick(Sender: TObject);
    procedure edOutTypeChange(Sender: TObject);
    procedure edOutEncChange(Sender: TObject);
  private
    { Private declarations }
    procedure ListFill;
    procedure ListSwap(N, M: Integer);
    function GetToolIndex: Integer;
  public
    { Public declarations }
    FToolList: TSynToolList;
    FCurrLexer: string;
    FDirPresets: string;
  end;

implementation

uses
  TntSysUtils,
  TntFileCtrl,
  ATxSProc,
  ATxFProc,
  unTool2,
  unProcHelp;

{$R *.dfm}

const
  ccStr: array[0..26] of string = (
    '"{FileName}"',
    '"{FileDir}"',
    '"{FileNameOnly}"',
    '"{FileNameNoExt}"',
    '"{FileExt}"',
    //
    '"{FileName2}"',
    '"{FileNameN1}"',
    '"{FileNameN2}"',
    //
    '"{ProjectDir}"',
    '"{ProjectWorkDir}"',
    '"{ProjectMainFileName}"',
    '"{ProjectMainFileDir}"',
    //
    '{CurrentWord}',
    '{CurrentLineNum}',
    '{CurrentColumnNum}',
    '"{CurrentLine}"',
    //
    '"{SelectedText}"',
    '"{SelectionFileName}"',
    '"{SelectionFileNameAnsi}"',
    '"{ContentFileName}"',
    '"{ContentFileNameAnsi}"',
    //
    '"{Interactive}"',
    '"{InteractiveFile}"',
    '"{InteractiveDir}"',
    //
    '"{SynDir}"',
    '"{SynIniDir}"',
    '{SynDrive}'
    );

procedure TfmTools.bBrClick(Sender: TObject);
begin
  with OpenDlg do
    if Execute then
    begin
      edCmd.Text:= FileName;
      edDir.Text:= WideExtractFileDir(FileName);
      edCmdChange(Self);
      edDirChange(Self);
      if SFileExtensionMatch(FileName, 'chm') then
      begin
        edPar.Text:= '';
        edParChange(Self);
        edDir.Text:= '';
        edDirChange(Self);
      end;
    end;
end;

procedure TfmTools.bBr2Click(Sender: TObject);
var fn: WideString;
begin
  fn:= edDir.Text;
  if WideSelectDirectory('', '', fn) then
  begin
    edDir.Text:= fn;
    edDirChange(Self);
  end;
  SetFocus; //for TC
end;

function TfmTools.GetToolIndex: Integer;
begin
  Result:= List.ItemIndex+1;
end;

procedure TfmTools.ListClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N<Low(TSynToolList) then Exit;

  edName.Text:= FToolList[N].ToolCaption;
  edCmd.Text:= FToolList[N].ToolCommand;
  edPar.Text:= FToolList[N].ToolParams;
  edDir.Text:= FToolList[N].ToolDir;
  cbOut.Checked:= FToolList[N].ToolOutCapture;

  if FToolList[N].ToolLexer='' then
    edLexer.ItemIndex:= 0
  else
    edLexer.ItemIndex:= edLexer.Items.IndexOf(FToolList[N].ToolLexer);

  edKey.HotKey:= TextToShortcut(FToolList[N].ToolKeys);
  edSave.ItemIndex:= Ord(FToolList[N].ToolSaveMode);
  cbCtx.Checked:= FToolList[N].ToolContextItem;

  edOutType.ItemIndex:= OutputTypeStrToOrder(FToolList[N].ToolOutType);
  edOutEnc.ItemIndex:= Ord(FToolList[N].ToolOutEncoding);
  
  edOutType.Enabled:= cbOut.Checked;
  edOutEnc.Enabled:= cbOut.Checked;
  bOut.Enabled:= cbOut.Checked and
    (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);

  bUp.Enabled:= N>Low(TSynToolList);
  bDn.Enabled:= N<High(TSynToolList);
end;

procedure TfmTools.edCmdChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolCommand:= edCmd.Text;
end;

procedure TfmTools.edParChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolParams:= edPar.Text;
end;

procedure TfmTools.edDirChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolDir:= edDir.Text;
end;

procedure TfmTools.TntFormShow(Sender: TObject);
var
  i: integer;
begin
  ListFill;

  //fill Output Type list
  with edOutType do
  begin
    Items.Clear;
    for i:= 0 to High(cOutputTypeOrder) do
      Items.Add(DKLangConstW(
        OutputTypeLangID(cOutputTypeOrder[i])));
  end;

  //init fields
  List.ItemIndex:= 0;
  ListClick(Self);
end;

procedure TfmTools.ListSwap(N, M: Integer);
var
  FTool: TSynTool;
begin
  if (N>=Low(TSynToolList)) and
    (M>=Low(TSynToolList)) then
  begin
    DoTool_CopyItem(FToolList[N], FTool);
    DoTool_CopyItem(FToolList[M], FToolList[N]);
    DoTool_CopyItem(FTool, FToolList[M]);
    ListFill;
  end;
end;

procedure TfmTools.bUpClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  ListSwap(N, N-1);

  List.ItemIndex:= List.ItemIndex-1;
  ListClick(Self);
end;

procedure TfmTools.bDnClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  ListSwap(N, N+1);

  List.ItemIndex:= List.ItemIndex+1;
  ListClick(Self);
end;

procedure TfmTools.p0Click(Sender: TObject);
begin
  edPar.Text:= edPar.Text + ccStr[TMenuItem(Sender).Tag];
  edPar.SelStart:= Length(edPar.Text);
  edParChange(Self);
end;

procedure TfmTools.bParClick(Sender: TObject);
var
  p: TPoint;
begin
  p:= bPar.ClientToScreen(Point(0, 0));
  mnuPar.Popup(p.x, p.y);
end;

procedure TfmTools.TntFormCreate(Sender: TObject);
  //
  procedure S(m: TMenuItem; n: Integer);
  begin
    m.Tag:= n;
    m.OnClick:= p0Click;
    m.Caption:= ccStr[n];
  end;
  //
var
  i: Integer;
begin
  List.Items.Clear;
  for i:= Low(FToolList) to High(FToolList) do
    List.Items.Add('?');

  s(pFileName, 0);
  s(pFileDir, 1);
  s(pFileNameOnly, 2);
  s(pFileNameNoExt, 3);
  s(pFileExt, 4);
  //
  s(pFileName2, 5);
  s(pFileNameN1, 6);
  s(pFileNameN2, 7);
  //
  s(pProj1, 8);
  s(pProj2, 9);
  s(pProj3, 10);
  s(pProj4, 11);
  //
  s(pCurWord, 12);
  s(pCurLineNum, 13);
  s(pCurColNum, 14);
  s(pCurLine, 15);
  //
  s(pSelText, 16);
  s(pSelFN, 17);
  s(pSelFNAnsi, 18);
  s(pContFN, 19);
  s(pContFNAnsi, 20);
  //
  s(pInter, 21);
  s(pInterFile, 22);
  s(pInterDir, 23);
  //
  s(pSynDir, 24);
  s(pSynIniDir, 25);
  s(pSynDrive, 26);

  with OpenDlg do
    Filter:= WideFormat(
      '%s (*.exe;*.bat;*.cmd)|*.exe;*.bat;*.cmd'+
      '|%s (*.chm)|*.chm'+
      '|%s (*.hlp)|*.hlp'+
      '|%s (*.*)|*.*',
      [DKLangConstW('filApp'),
      DKLangConstW('filChm'),
      DKLangConstW('filHlp'),
      DKLangConstW('filAll')]);
end;

procedure TfmTools.bOutClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N<Low(TSynToolList) then Exit;

  with TfmToolOutput.Create(nil) do
  try
    edRE.Text:= FToolList[N].ToolOutRegex;
    edFN.ItemIndex:= FToolList[N].ToolOutNum_fn;
    edLn.ItemIndex:= FToolList[N].ToolOutNum_line;
    edCol.ItemIndex:= FToolList[N].ToolOutNum_col;
    cbNoTag.Checked:= FToolList[N].ToolNoTags;
    FDirPresets:= Self.FDirPresets;
    if ShowModal=mrOk then
    begin
      FToolList[N].ToolOutRegex:= edRE.Text;
      FToolList[N].ToolOutNum_fn:= edFN.ItemIndex;
      FToolList[N].ToolOutNum_line:= edLn.ItemIndex;
      FToolList[N].ToolOutNum_col:= edCol.ItemIndex;
      FToolList[N].ToolNoTags:= cbNoTag.Checked;
    end;
  finally
    Release
  end;
end;

procedure TfmTools.cbOutClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
  begin
    FToolList[N].ToolOutCapture:= cbOut.Checked;
    edOutType.Enabled:= cbOut.Checked;
    edOutEnc.Enabled:= cbOut.Checked;
    bOut.Enabled:= cbOut.Checked and
      (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);
  end;
end;

procedure TfmTools.edNameChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
  begin
    FToolList[N].ToolCaption:= edName.Text;
    ListFill;
  end;
end;

procedure TfmTools.bClrClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
  begin
    DoTool_ClearItem(FToolList[N]);
    ListClick(Self);
  end;
end;

procedure TfmTools.edLexerChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    if edLexer.ItemIndex=0 then
      FToolList[N].ToolLexer:= ''
    else
      FToolList[N].ToolLexer:= edLexer.Text;
end;

procedure TfmTools.edKeyChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolKeys:= ShortcutToText(edKey.HotKey);
end;    

procedure TfmTools.bLexClick(Sender: TObject);
begin
  with edLexer do
    if FCurrLexer = '' then
      ItemIndex:= 0
    else
      ItemIndex:= Items.IndexOf(FCurrLexer);
  edLexerChange(Self);
end;

procedure TfmTools.bKeyClick(Sender: TObject);
begin
  edKey.HotKey:= 0;
  edKeyChange(Self);
end;

procedure TfmTools.edSaveChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolSaveMode:= TSynToolSave(edSave.ItemIndex);
end;

procedure TfmTools.TntFormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var
  i: Integer;
begin
  CanClose:= true;
  for i:= Low(TSynToolList) to High(TSynToolList) do
    with FToolList[i] do
      if (ToolCaption='') and (ToolCommand<>'') then
      begin
        MsgWarn(WideFormat(DKLangConstW('MNCap'), [ToolCommand]), Handle);
        CanClose:= false;
        Exit
      end;
end;

procedure TfmTools.cbCtxClick(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolContextItem:= cbCtx.Checked;
end;

procedure TfmTools.bHelpClick(Sender: TObject);
begin
  SynHelpTopic(helpExtTools, Handle);
end;

procedure TfmTools.edOutTypeChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
  begin
    FToolList[N].ToolOutType:= cOutputTypeString[cOutputTypeOrder[edOutType.ItemIndex]];
    bOut.Enabled:= cbOut.Checked and
      (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);
  end;
end;

procedure TfmTools.edOutEncChange(Sender: TObject);
var
  N: Integer;
begin
  N:= GetToolIndex;
  if N>=Low(TSynToolList) then
    FToolList[N].ToolOutEncoding:= TSynToolOutputEnc(edOutEnc.ItemIndex);
end;

procedure TfmTools.ListFill;
var
  i: Integer;
begin
  for i:= Low(FToolList) to High(FToolList) do
    List.Items[i-1]:= IntToStr(i)+': '+FToolList[i].ToolCaption;
end;

end.
