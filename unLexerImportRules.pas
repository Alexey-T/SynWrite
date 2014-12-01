{
Original from:
EControl Syntax Editor SDK
Copyright (c) 2004 - 2008 EControl Ltd., Zaharov Michael

Modified for SynWrite by Alexey T.
}

{$I ecSyntEdit.INC}

unit unLexerImportRules;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ecSyntAnal, ComCtrls, DKLang,
  TntForms, TntStdCtrls;

type
  TecCollectionType = (ctNotDefined, ctStyles, ctParserRules, ctRangeRules, SubLexerRulers);

  TfmLexerImportRules = class(TTntForm)
    bOk: TTntButton;
    bCancel: TTntButton;
    LList: TListBox;
    Label1: TTntLabel;
    Label2: TTntLabel;
    RuleList: TListView;
    DKLanguageController1: TDKLanguageController;
    procedure LListClick(Sender: TObject);
    procedure RuleListClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    FCollection: TSyntCollection;
    procedure FillAnalyzers;
    procedure SetEnabling;
    function GetColl(lex: TSyntAnalyzer): TSyntCollection;
    procedure SetCollection(const Value: TSyntCollection);
  public
    LexOwner: TComponent;
    property Collection: TSyntCollection read FCollection write SetCollection;
  end;

implementation

{$R *.dfm}

{ TImportRules }

procedure TfmLexerImportRules.SetCollection(const Value: TSyntCollection);
begin
  FCollection := Value;
  FillAnalyzers;
end;

function TfmLexerImportRules.GetColl(lex: TSyntAnalyzer): TSyntCollection;
begin
  if FCollection.ClassType = TStylesCollection then Result := lex.Formats else
  if FCollection.ClassType = TTokenRuleCollection then Result := lex.TokenRules else
  if FCollection.ClassType = TBlockRuleCollection then Result := lex.BlockRules else
  if FCollection.ClassType = TSubAnalyzerRules then Result := lex.SubAnalyzers else
    Result := nil;
  if Result = nil then Abort;
end;

procedure TfmLexerImportRules.FillAnalyzers;
var i: integer;
    lex: TSyntAnalyzer;
  LNames: TStringList;
begin
  LList.Items.Clear;

  //AT: added sorting of Listbox
  LNames:= TStringList.Create;
  try
    LNames.Sorted:= true;
    if (FCollection <> nil) and (LexOwner <> nil) then
     with LexOwner do
      for i := 0 to ComponentCount - 1 do
       if Components[i] is TSyntAnalyzer then
        begin
          lex := Components[i] as TSyntAnalyzer;
          if GetColl(lex).Count > 0 then
            LNames.AddObject(lex.LexerName, lex)
        end;

    for i:= 0 to LNames.Count-1 do
      LList.Items.AddObject(LNames[i], LNames.Objects[i]);
  finally
    FreeAndNil(LNames);
  end;

  if LList.Items.Count > 0 then
   begin
    LList.ItemIndex := 0;
    LListClick(nil);
   end;
end;

procedure TfmLexerImportRules.LListClick(Sender: TObject);
var i: integer;
    FCol: TSyntCollection;
    li: TListItem;
begin
  RuleList.Items.Clear;
  if LList.ItemIndex >= 0 then
   begin
     FCol := GetColl(TSyntAnalyzer(LList.Items.Objects[LList.ItemIndex]));
     for i := 0 to FCol.Count - 1 do
      begin
       li := RuleList.Items.Add;
       li.Caption := FCol[i].DisplayName;
       li.Data := FCol[i];
      end;
   end;
  SetEnabling;
end;

procedure TfmLexerImportRules.SetEnabling;
var i: integer;
begin
  for i := 0 to RuleList.Items.Count - 1 do
   if RuleList.Items[i].Checked then
    begin
      bOk.Enabled := True;
      Exit;
    end;
  bOk.Enabled := False;
end;

procedure TfmLexerImportRules.RuleListClick(Sender: TObject);
begin
  SetEnabling;
end;

procedure TfmLexerImportRules.FormClose(Sender: TObject;
  var Action: TCloseAction);
var i: integer;
    Item: TSyntCollectionItem;
begin
  if (ModalResult = mrOk) and Assigned(FCollection) then
   begin
     for i := 0 to RuleList.Items.Count - 1 do
      if RuleList.Items[i].Checked then
       begin
         Item := FCollection.Add as TSyntCollectionItem;
         Item.Assign(TSyntCollectionItem(RuleList.Items[i].Data));
       end;
   end;
end;

procedure TfmLexerImportRules.FormShow(Sender: TObject);
var i: integer;
begin
  for i := 0 to RuleList.Items.Count - 1 do
   RuleList.Items[i].Checked := False;
end;

end.
