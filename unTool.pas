unit unTool;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TntDialogs, StdCtrls, TntStdCtrls, TntForms, DKLang, ComCtrls,
  TntComCtrls, Menus, ecHotKeyEdit;

type
  TfmTools = class(TTntForm)
    TntOpenDialog1: TTntOpenDialog;
    TntGroupBox1: TTntGroupBox;
    TntLabel1: TTntLabel;
    edFN: TTntEdit;
    bBr: TTntButton;
    TntLabel2: TTntLabel;
    edPar: TTntEdit;
    TntLabel3: TTntLabel;
    edDir: TTntEdit;
    bOk: TTntButton;
    bCancel: TTntButton;
    DKLanguageController1: TDKLanguageController;
    TntGroupBox2: TTntGroupBox;
    List: TTntListView;
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
    edCap: TTntEdit;
    bClr: TTntButton;
    TntLabel5: TTntLabel;
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
    pFileDir2: TMenuItem;
    pFileExt2: TMenuItem;
    N6: TMenuItem;
    pSynDir: TMenuItem;
    pSynIniDir: TMenuItem;
    procedure bBrClick(Sender: TObject);
    procedure bBr2Click(Sender: TObject);
    procedure ListClick(Sender: TObject);
    procedure edFNChange(Sender: TObject);
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
    procedure edCapChange(Sender: TObject);
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
    procedure ListChange(Sender: TObject; Item: TListItem;
      Change: TItemChange);
  private
    { Private declarations }
    procedure LSwap(n, m: Integer);
  public
    { Public declarations }
    SynDir: string;
    SCurLex: string;
    SRe,
    SReNums: string;
  end;

var
  fmTools: TfmTools;

implementation

uses tntSysUtils, TntFileCtrl, unTool2,
  atxSProc, atxFProc, unProc;

{$R *.dfm}

const
  ccStr: array[0..22] of string = (
    '"{FileName}"',
    '"{FileDir}"',
    '"{FileNameOnly}"',
    '"{FileNameNoExt}"',
    '"{FileExt}"',
    //
    '"{FileName2}"',
    '"{FileDir2}"',
    '"{FileExt2}"',
    //
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
    //
    '"{Interactive}"',
    '"{InteractiveFile}"',
    '"{InteractiveDir}"',
    //
    '"{SynDir}"',
    '"{SynIniDir}"'
    );

procedure TfmTools.bBrClick(Sender: TObject);
begin
  with TntOpenDialog1 do
    if Execute then
    begin
      edFN.Text:= FileName;
      edDir.Text:= WideExtractFileDir(FileName);
      edFNChange(Self);
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

procedure TfmTools.ListClick(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
    begin
      edCap.Text:= Caption;
      edFN.Text:= SubItems[0];
      edPar.Text:= SubItems[1];
      edDir.Text:= SubItems[2];
      cbOut.Checked:= Bool(StrTointdef(SubItems[3], 0));
      SRe:= SubItems[4];
      SReNums:= SubItems[5];

      with edLexer do
        if SubItems[6] = '' then
          ItemIndex:= 0
        else
          ItemIndex:= Items.IndexOf(SubItems[6]);

      edKey.HotKey:= TextToShortcut(SubItems[7]);
      edSave.ItemIndex:= StrToIntDef(SubItems[8], 0);
      cbCtx.Checked:= Bool(StrToIntDef(SubItems[10], 0));

      edOutType.ItemIndex:= OutputTypeStrToOrder(SubItems[11]);
      edOutTypeChange(Self);
      edOutEnc.ItemIndex:= StrToIntDef(SubItems[12], 0);

      edOutType.Enabled:= cbOut.Checked;
      edOutEnc.Enabled:= cbOut.Checked;
      bOut.Enabled:= cbOut.Checked and
        (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);

      bUp.Enabled:= Index>0;
      bDn.Enabled:= Index<List.Items.Count-1;
    end;
end;

procedure TfmTools.edFNChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
     subItems[0]:= edFN.Text;
end;

procedure TfmTools.edParChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
     SubItems[1]:= edPar.Text;
end;

procedure TfmTools.edDirChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
     SubItems[2]:= edDir.Text;
end;

procedure TfmTools.TntFormShow(Sender: TObject);
var
  i: integer;
begin
  with List do
    Selected:= Items[0];

  //fill Output Type list
  with edOutType do
  begin
    Items.Clear;
    for i:= 0 to High(cOutputTypeOrder) do
      Items.Add(DKLangConstW(
        OutputTypeLangID(cOutputTypeOrder[i])));
  end;

  //init fields
  ListClick(Self);
end;

const cc=12;//List.SubItems.Count-1

procedure TfmTools.LSwap(n, m: Integer);
var s: array[0..cc] of WideString;
  ss: Widestring;
  i:Integer;
begin
  with List do
  begin
    Items.BeginUpdate;

    ss:= Items[n].Caption;
    for i:= 0 to cc do
      s[i]:= Items[n].SubItems[i];

    Items[n].Caption:= Items[m].Caption;
    for i:= 0 to cc do
      Items[n].SubItems[i]:= Items[m].SubItems[i];

    Items[m].Caption:= ss;
    for i:= 0 to cc do
      Items[m].SubItems[i]:= s[i];

    Items.EndUpdate;
    Selected:= Items[m];
  end;
  ListClick(Self);
end;

procedure TfmTools.bUpClick(Sender: TObject);
begin
  with list do
   if Selected <>nil then
    if Selected.Index>0 then
     LSwap(Selected.Index, Selected.Index-1);
end;

procedure TfmTools.bDnClick(Sender: TObject);
begin
  with list do
   if Selected <>nil then
    if Selected.Index<Items.Count-1 then
     LSwap(Selected.Index, Selected.Index+1);
end;

procedure TfmTools.p0Click(Sender: TObject);
begin
  edPar.Text:= edPar.Text + ccStr[TMenuItem(Sender).Tag];
  edPar.SelStart:= Length(edPar.Text);
  edParChange(Self);
end;

procedure TfmTools.bParClick(Sender: TObject);
var p:TPoint;
begin
  p:= bPar.ClientToScreen(Point(0, 0));
  mnuPar.Popup(p.x, p.y);
end;

procedure TfmTools.TntFormCreate(Sender: TObject);
 procedure S(m: TMenuItem; n: Integer);
 begin
   m.Tag:= n;
   m.OnClick:= p0Click;
   m.Caption:= ccStr[n];
 end;
begin
  s(pFileName, 0);
  s(pFileDir, 1);
  s(pFileNameOnly, 2);
  s(pFileNameNoExt, 3);
  s(pFileExt, 4);
  //
  s(pFileName2, 5);
  s(pFileDir2, 6);
  s(pFileExt2, 7);
  //
  s(pProj1, 8);
  s(pProj2, 9);
  s(pProj3, 10);
  //
  s(pCurWord, 11);
  s(pCurLineNum, 12);
  s(pCurColNum, 13);
  s(pCurLine, 14);
  //
  s(pSelText, 15);
  s(pSelFN, 16);
  s(pSelFNAnsi, 17);
  //
  s(pInter, 18);
  s(pInterFile, 19);
  s(pInterDir, 20);
  //
  s(pSynDir, 21);
  s(pSynIniDir, 22);

  with TntOpenDialog1 do
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
var s: Widestring;
begin
  with TfmToolOutput.Create(nil) do
  try
    edRE.Text:= SRe;
    S:= SReNums;
    edFN.ItemIndex:= StrToIntDef(SGetItem(S), 0);
    edLn.ItemIndex:= StrToIntDef(SGetItem(S), 0);
    edCol.ItemIndex:= StrToIntDef(SGetItem(S), 0);
    if List.Selected<>nil then
      cbNoTag.Checked:= Boolean(StrToIntDef(List.Selected.SubItems[9], 0));
    if ShowModal=mrOk then
    begin
      SRe:= edRE.Text;
      SReNums:= Format('%d,%d,%d', [edFN.ItemIndex, edLn.ItemIndex, edCol.ItemIndex]);
      with List do
       if Selected<>nil then
        with Selected do
        begin
          subItems[4]:= SRe;
          subItems[5]:= SReNums;
          subItems[9]:= IntToStr(Ord(cbNoTag.Checked));
        end;
    end;
  finally
    Release
  end;
end;

procedure TfmTools.cbOutClick(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
    begin
      SubItems[3]:= Inttostr(Ord(cbOut.Checked));
      edOutType.Enabled:= cbOut.Checked;
      edOutEnc.Enabled:= cbOut.Checked;
      bOut.Enabled:= cbOut.Checked and
        (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);
    end;
end;

procedure TfmTools.edCapChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
     Caption:= edCap.Text;
end;

procedure TfmTools.bClrClick(Sender: TObject);
var i:Integer;
begin
  with list do
   if Selected <>nil then
     with Selected do
     begin
       Caption:= '';
       for i:= 0 to cc do SubItems[i]:= '';
       ListClick(Self);
       edOutType.ItemIndex:= 1; //"Send to Output"
       edOutTypeChange(Self);
       edOutEnc.ItemIndex:= 1; //OEM
       edOutEncChange(Self);
     end;
end;

procedure TfmTools.edLexerChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
      if edLexer.ItemIndex=0 then
        SubItems[6]:= ''
      else
        SubItems[6]:= edLexer.Text;
end;

procedure TfmTools.edKeyChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
      SubItems[7]:= ShortcutToText(edKey.HotKey);
end;

procedure TfmTools.bLexClick(Sender: TObject);
begin
  with edLexer do
    if SCurLex = '' then
      ItemIndex:= 0
    else
      ItemIndex:= Items.IndexOf(SCurLex);
  edLexerChange(Self);
end;

procedure TfmTools.bKeyClick(Sender: TObject);
begin
  edKey.HotKey:= 0;
  edKeyChange(Self);
end;

procedure TfmTools.edSaveChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
      SubItems[8]:= Inttostr(edSave.ItemIndex);
end;

procedure TfmTools.TntFormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
var i:Integer;
begin
  CanClose:= true;
  for i:= 0 to List.Items.Count-1 do
    with List.Items[i] do
      if (Caption='') and (SubItems[0]<>'') then
      begin
        MsgWarn(WideFormat(DKLangConstW('MNCap'), [SubItems[0]]));
        CanClose:= false;
        Exit
      end;
end;

procedure TfmTools.cbCtxClick(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
    begin
      SubItems[10]:= Inttostr(Ord(cbCtx.Checked));
    end;
end;

procedure TfmTools.bHelpClick(Sender: TObject);
begin
  ShowHelp(SynDir, helpExtTools, Handle);
end;

procedure TfmTools.edOutTypeChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
    begin
      SubItems[11]:= cOutputTypeString[cOutputTypeOrder[edOutType.ItemIndex]];
      bOut.Enabled:= cbOut.Checked and
        (cOutputTypeOrder[edOutType.ItemIndex] = outToPanel);
    end;
end;

procedure TfmTools.edOutEncChange(Sender: TObject);
begin
  with List do
   if Selected<>nil then
    with Selected do
    begin
      SubItems[12]:= IntToStr(edOutEnc.ItemIndex);
    end;
end;

procedure TfmTools.ListChange(Sender: TObject; Item: TListItem;
  Change: TItemChange);
begin
  ListClick(Self);
end;

end.
