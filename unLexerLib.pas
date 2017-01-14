unit unLexerLib;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  TntForms,
  Dialogs, StdCtrls, Buttons, ActnList, ImgList, ToolWin,
  CheckLst, ComCtrls,
  unGlobData,
  ecSyntAnal, DKLang, TntCheckLst, TntComCtrls;

type
  TfmLexerLibrary = class(TTntForm)
    ToolBar1: TTntToolBar;
    ImageList1: TImageList;
    ActionList1: TActionList;
    actLexerProps: TAction;
    actDeleteLexer: TAction;
    actNewLexer: TAction;
    btnNew: TTntToolButton;
    btnConf: TTntToolButton;
    ToolButtonSep2: TTntToolButton;
    btnDelete: TTntToolButton;
    btnCopy: TTntToolButton;
    ToolButtonSep1: TTntToolButton;
    actCopy: TAction;
    DKLanguageController1: TDKLanguageController;
    LV: TTntCheckListBox;
    procedure actLexerPropsUpdate(Sender: TObject);
    procedure actLexerPropsExecute(Sender: TObject);
    procedure actNewLexerExecute(Sender: TObject);
    procedure actDeleteLexerExecute(Sender: TObject);
    procedure actCopyExecute(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LVClickCheck(Sender: TObject);
  private
    FLexLib: TSyntaxManager;
    FTreeImages: TImageList;
    procedure UpdateList;
  public
  end;

procedure DoLexerLibraryDialog(ALexerLib: TSyntaxManager; ATreeImages: TImageList;
  const ALexerLibDir: string);

implementation

uses
  StrUtils,
  ATxSProc,
  unProc,
  unLexerProp;

{$R *.dfm}

procedure DoLexerLibraryDialog(ALexerLib: TSyntaxManager; ATreeImages: TImageList;
  const ALexerLibDir: string);
var
  PrevNames: TStringList;
  an: TSyntAnalyzer;
  i: integer;
begin
  PrevNames:= TStringList.Create;
  for i:= 0 to ALexerLib.AnalyzerCount-1 do
    PrevNames.Add(ALexerLib.Analyzers[i].LexerName);

  with TfmLexerLibrary.Create(nil) do
  try
    FLexLib:= ALexerLib;
    FTreeImages:= ATreeImages;
    ShowModal;
  finally
    Free;
  end;

  //find analizers which were deleted/renamed,
  //and del their old files
  for i:= 0 to PrevNames.Count-1 do
    if ALexerLib.FindAnalyzer(PrevNames[i])=nil then
      DeleteFile(LexerFilename(PrevNames[i], ALexerLibDir));

  //find modified analizers, and export to files
  for i:= 0 to ALexerLib.AnalyzerCount-1 do
  begin
    an:= ALexerLib.Analyzers[i];
    if an.Tag>0 then
    begin
      an.Tag:= 0;
      DoLexerSaveToFile(an, LexerFilename(an.LexerName, ALexerLibDir));
    end;
  end;

  FreeAndNil(PrevNames);
end;

procedure TfmLexerLibrary.FormShow(Sender: TObject);
begin
  Caption:= DKLangConstW('zMLexerLib');
  UpdateList;
end;


procedure TfmLexerLibrary.actLexerPropsUpdate(Sender: TObject);
begin
  (Sender as TAction).Enabled:= LV.ItemIndex>=0;
end;

procedure TfmLexerLibrary.UpdateList;
var
  sl: TStringList;
  an: TSyntAnalyzer;
  i, cur: Integer;
begin
  sl:= TStringList.Create;
  try
    sl.Duplicates:= dupAccept;
    sl.Sorted:= true;
    for i:= 0 to FLexLib.AnalyzerCount-1 do
      sl.AddObject(FLexLib.Analyzers[i].LexerName, FLexLib.Analyzers[i]);

    LV.Items.BeginUpdate;
    try
      cur:= LV.ItemIndex;
      LV.Items.Clear;
      for i:= 0 to sl.Count-1 do
      begin
        an:= sl.Objects[i] as TSyntAnalyzer;
        LV.Items.AddObject(LexerNameWithLinks(an), an);
        LV.Checked[LV.Items.Count-1]:= not an.Internal;
      end;
      //restore ItemIndex
      if cur>=LV.Items.Count then
        cur:= LV.Items.Count-1;
      LV.ItemIndex:= cur;
    finally
      LV.Items.EndUpdate;
    end;
  finally
    FreeAndNil(sl);
  end;
end;


procedure TfmLexerLibrary.actLexerPropsExecute(Sender: TObject);
var
  An: TSyntAnalyzer;
  fnLexmap: string;
begin
  if LV.ItemIndex>=0 then
  begin
    An:= LV.Items.Objects[LV.ItemIndex] as TSyntAnalyzer;
    if DoLexerPropDialog(An, FTreeImages, SynLexerMapFilename(An.LexerName)) then
    begin
      LV.Items[LV.ItemIndex]:= LexerNameWithLinks(An);
      FLexLib.Modified:= True;
      An.Tag:= 1;
    end;
  end;
end;

procedure TfmLexerLibrary.actNewLexerExecute(Sender: TObject);
var
  An: TSyntAnalyzer;
begin
  An:= FLexLib.AddAnalyzer;
  if DoLexerPropDialog(An, FTreeImages, SynLexerMapFilename(An.LexerName)) then
  begin
    FLexLib.Modified:= True;
    An.Tag:= 1;
    UpdateList;
  end
  else
    FreeAndNil(An);
end;

procedure TfmLexerLibrary.actDeleteLexerExecute(Sender: TObject);
begin
  if (LV.ItemIndex>=0) then
    if MsgConfirm(DKLangConstW('MDLex'), Handle) then
    begin
      LV.Items.Objects[LV.ItemIndex].Free;
      FLexLib.Modified:= True;
      UpdateList;
    end;
end;

procedure TfmLexerLibrary.actCopyExecute(Sender: TObject);
var
  an, anPrev: TSyntAnalyzer;
begin
  if LV.ItemIndex>=0 then
  begin
    anPrev:= LV.Items.Objects[LV.ItemIndex] as TSyntAnalyzer;
    an:= FLexLib.AddAnalyzer;
    an.Assign(anPrev);
    an.LexerName:= anPrev.LexerName+' (copy)';
    an.Tag:= 1;
    LV.Items.AddObject(an.LexerName, an);
    LV.Checked[LV.Items.Count-1]:= not an.Internal;
    UpdateList;
  end;
end;

procedure TfmLexerLibrary.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=vk_delete) and (Shift=[]) then
    if LV.ItemIndex>=0 then
    begin
      actDeleteLexer.Execute;
      Key:= 0;
      Exit
    end;

  if (Key=vk_escape) and (Shift=[]) then
  begin
    Close;
    Key:= 0;
    Exit
  end;  
end;

procedure TfmLexerLibrary.LVClickCheck(Sender: TObject);
var
  an: TSyntAnalyzer;
begin
  if LV.ItemIndex>=0 then
  begin
    an:= LV.Items.Objects[LV.ItemIndex] as TSyntAnalyzer;
    an.Internal:= not LV.Checked[LV.ItemIndex];
    an.Tag:= 1;
    FLexLib.Modified:= True;
  end;
end;


end.

