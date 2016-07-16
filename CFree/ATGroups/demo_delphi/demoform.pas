{$define SP} //Use SpTBXLib

unit demoform;

interface

uses
  Windows, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Menus,
  ATGroups,
  ATTabs, 
  {$ifdef SP}
  SpTbxSkins,
  {$endif}
  ComCtrls;

type
  { TfmTest }
  TfmTest = class(TForm)
    PopupMenu1: TPopupMenu;
    mnuClose: TMenuItem;
    MainMenu1: TMainMenu;
    Mode1: TMenuItem;
    N1: TMenuItem;
    m1: TMenuItem;
    m2: TMenuItem;
    m3: TMenuItem;
    m4: TMenuItem;
    Tree: TTreeView;
    Focus1: TMenuItem;
    mnuGNext: TMenuItem;
    mnuG1: TMenuItem;
    mnuG2: TMenuItem;
    mnuG3: TMenuItem;
    mnuG4: TMenuItem;
    N2: TMenuItem;
    mnuGPrev: TMenuItem;
    mNext: TMenuItem;
    mPre: TMenuItem;
    N3: TMenuItem;
    Movetab1: TMenuItem;
    mnuMoveNext: TMenuItem;
    mnuMovePrev: TMenuItem;
    mnuG5: TMenuItem;
    mnuG6: TMenuItem;
    togroup51: TMenuItem;
    togroup61: TMenuItem;
    N4: TMenuItem;
    mnuMoveOpp: TMenuItem;
    mnuCloseThis: TMenuItem;
    mnuCloseOthSame: TMenuItem;
    mnuCloseOthAll: TMenuItem;
    mnuCloseAll: TMenuItem;
    mnuCloseAllThis: TMenuItem;
    mTree: TMenuItem;
    Status: TStatusBar;
    mnuCloseRt: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    mnuCloseLt: TMenuItem;
    mnuTreeToggle: TMenuItem;
    mnuMode1: TMenuItem;
    mnuMode2H: TMenuItem;
    mnuMode2V: TMenuItem;
    mnuMode3H: TMenuItem;
    mnuMode3V: TMenuItem;
    mnuMode12H: TMenuItem;
    mnuMode4H: TMenuItem;
    mnuMode4V: TMenuItem;
    mnuMode4G: TMenuItem;
    mnuMode6: TMenuItem;
    mnuMode12V: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure mnuMode12HClick(Sender: TObject);
    procedure mnuTreeToggleClick(Sender: TObject);
    procedure mnuMode1Click(Sender: TObject);
    procedure mnuMode2VClick(Sender: TObject);
    procedure mnuMode2HClick(Sender: TObject);
    procedure mnuMode3VClick(Sender: TObject);
    procedure mnuMode3HClick(Sender: TObject);
    procedure mnuMode4VClick(Sender: TObject);
    procedure mnuMode4HClick(Sender: TObject);
    procedure mnuMode4GClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure m1Click(Sender: TObject);
    procedure m2Click(Sender: TObject);
    procedure m3Click(Sender: TObject);
    procedure m4Click(Sender: TObject);
    procedure TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure mnuGNextClick(Sender: TObject);
    procedure mnuG1Click(Sender: TObject);
    procedure mnuG2Click(Sender: TObject);
    procedure mnuG3Click(Sender: TObject);
    procedure mnuG4Click(Sender: TObject);
    procedure mnuGPrevClick(Sender: TObject);
    procedure mNextClick(Sender: TObject);
    procedure mPreClick(Sender: TObject);
    procedure mnuMoveNextClick(Sender: TObject);
    procedure mnuMovePrevClick(Sender: TObject);
    procedure TreeDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure mnuMode6Click(Sender: TObject);
    procedure mnuG5Click(Sender: TObject);
    procedure mnuG6Click(Sender: TObject);
    procedure togroup51Click(Sender: TObject);
    procedure togroup61Click(Sender: TObject);
    procedure mnuMoveOppClick(Sender: TObject);
    procedure mnuMode12VClick(Sender: TObject);
    procedure mnuCloseThisClick(Sender: TObject);
    procedure mnuCloseAllClick(Sender: TObject);
    procedure mnuCloseOthSameClick(Sender: TObject);
    procedure mnuCloseOthAllClick(Sender: TObject);
    procedure mnuCloseAllThisClick(Sender: TObject);
    procedure mnuCloseRtClick(Sender: TObject);
    procedure mnuCloseLtClick(Sender: TObject);
  private
    { Private declarations }
    procedure TabClose(Sender: TObject; ATabIndex: Integer;
      var ACanClose, ACanContinue: boolean);
    procedure TabAdd(Sender: TObject);
    procedure AddTab(Pages: TATPages);
    procedure TabPopup(S: TObject);
    procedure TabFocus(S: TObject);
    procedure TabOver(S: TObject; N: Integer);
    procedure MoveTabTo(Num: Integer);
    procedure MemoFocus(S: TObject);
  public
    { Public declarations }
    Groups: TATGroups;
  end;

var
  fmTest: TfmTest;

implementation

{$R *.dfm}

procedure TfmTest.AddTab(Pages: TATPages);
var
  F: TMemo;
  i: Integer;
  ch: Char;
begin
  F:= TMemo.Create(Self);
  F.Visible:= false;
  F.Parent:= Self;
  F.ScrollBars:= ssBoth;
  F.BorderStyle:= bsNone;
  F.OnEnter:= MemoFocus;

  ch:= Chr(Ord('A')+Random(26));
  for i:= 0 to 1+Random(4) do
    F.Lines.Add(StringOfChar(ch, 2+Random(50)));
  Pages.AddTab(F, 'tab'+ch, false);
end;


procedure TfmTest.FormCreate(Sender: TObject);
begin
  Tree.FullExpand;
  {$ifdef SP}
  SkinManager.SetSkin('Aluminum');
  {$endif}

  Groups:= TATGroups.Create(Self);
  Groups.Parent:= Self;
  Groups.Align:= alClient;
  Groups.OnTabPopup:= TabPopup;
  Groups.OnTabFocus:= TabFocus;
  Groups.OnTabClose:= TabClose;
  Groups.OnTabAdd:= TabAdd;
  Groups.OnTabOver:= TabOver;

  Groups.SetTabOption(tabColorText, clBlack);
  Groups.SetTabOption(tabColorBgActive, clBtnFace);
  Groups.SetTabOption(tabColorBgPassive, clLtGray);
  Groups.SetTabOption(tabColorBgPassiveOver, clMedGray);
  Groups.SetTabOption(tabColorBorderActive, clMedGray);
  Groups.SetTabOption(tabColorBorderPassive, clMedGray);

  AddTab(Groups.Pages1);
  AddTab(Groups.Pages1);
  AddTab(Groups.Pages1);
  AddTab(Groups.Pages2);
  AddTab(Groups.Pages2);
end;

procedure TfmTest.mnuMode12HClick(Sender: TObject);
begin
  Groups.Mode:= gm1plus2Horz;
end;

procedure TfmTest.mnuTreeToggleClick(Sender: TObject);
begin
  with Tree do Visible:= not Visible;
end;

procedure TfmTest.TabAdd(Sender: TObject);
begin
  AddTab((Sender as TATTabs).Parent as TATPages);
end;

procedure TfmTest.TabClose(Sender: TObject; ATabIndex: Integer;
  var ACanClose, ACanContinue: boolean);
var
  D: TATTabData;
  Id, Res: Integer;
begin
  D:= (Sender as TATTabs).GetTabData(ATabIndex);

  if ACanContinue then Id:= mb_yesnocancel else Id:= mb_okcancel;
  Res:= Application.MessageBox(PChar(string('Close: '+D.TabCaption)), 'Close', Id);
  
  ACanClose:= (Res=idok) or (Res=idyes);
  ACanContinue:= Res<>idcancel;

  if ACanClose then
    D.TabObject.Free;
end;

procedure TfmTest.TabPopup(S: TObject);
var
  D: TATTabData;
  P: TPoint;
begin
  D:= Groups.PopupPages.Tabs.GetTabData(Groups.PopupTabIndex);
  if D=nil then Exit;
  mnuCloseThis.Caption:= 'this tab: '+D.TabCaption;

  P:= Mouse.CursorPos;
  PopupMenu1.Popup(P.X, P.Y);
end;

procedure TfmTest.mnuMode1Click(Sender: TObject);
begin
  Groups.Mode:= gmOne;
end;

procedure TfmTest.mnuMode2VClick(Sender: TObject);
begin
  Groups.Mode:= gm2Horz;
end;

procedure TfmTest.mnuMode2HClick(Sender: TObject);
begin
  Groups.Mode:= gm2Vert;
end;

procedure TfmTest.mnuMode3VClick(Sender: TObject);
begin
  Groups.Mode:= gm3Horz;
end;

procedure TfmTest.mnuMode3HClick(Sender: TObject);
begin
  Groups.Mode:= gm3Vert;
end;

procedure TfmTest.mnuMode12VClick(Sender: TObject);
begin
  Groups.Mode:= gm1plus2Vert;
end;

procedure TfmTest.mnuMode4VClick(Sender: TObject);
begin
  Groups.Mode:= gm4Horz;
end;

procedure TfmTest.mnuMode4HClick(Sender: TObject);
begin
  Groups.Mode:= gm4Vert;
end;

procedure TfmTest.mnuMode4GClick(Sender: TObject);
begin
  Groups.Mode:= gm4Grid;
end;

procedure TfmTest.mnuMode6Click(Sender: TObject);
begin
  Groups.Mode:= gm6Grid;
end;

procedure TfmTest.FormShow(Sender: TObject);
begin
  Groups.Mode:= gm2Horz;
end;

procedure TfmTest.MoveTabTo(Num: Integer);
begin
  Groups.MoveTab(Groups.PopupPages, Groups.PopupTabIndex, Groups.Pages[Num], -1, false);
end;

procedure TfmTest.m1Click(Sender: TObject);
begin
  MoveTabTo(1);
end;

procedure TfmTest.m2Click(Sender: TObject);
begin
  MoveTabTo(2);
end;

procedure TfmTest.m3Click(Sender: TObject);
begin
  MoveTabTo(3);
end;

procedure TfmTest.m4Click(Sender: TObject);
begin
  MoveTabTo(4);
end;

procedure TfmTest.togroup51Click(Sender: TObject);
begin
  MoveTabTo(5);
end;

procedure TfmTest.togroup61Click(Sender: TObject);
begin
  MoveTabTo(6);
end;

procedure TfmTest.TreeDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  N: TTreeNode;
  S: string;
begin
  if Source is TMemo then
    S:= 'text: '+(Source as TMemo).Lines[0];

  N:= Tree.GetNodeAt(X, Y);
  if N=nil then begin Beep; Exit end;
  Tree.Items.AddChild(N, S);
  Tree.FullExpand;
end;

procedure TfmTest.mnuGNextClick(Sender: TObject);
begin
  Groups.PagesSetNext(true);
end;

procedure TfmTest.mnuGPrevClick(Sender: TObject);
begin
  Groups.PagesSetNext(false);
end;

procedure TfmTest.mnuG1Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(1) then Beep;
end;

procedure TfmTest.mnuG2Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(2) then Beep;
end;

procedure TfmTest.mnuG3Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(3) then Beep;
end;

procedure TfmTest.mnuG4Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(4) then Beep;
end;

procedure TfmTest.mnuG5Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(5) then Beep;
end;

procedure TfmTest.mnuG6Click(Sender: TObject);
begin
  if not Groups.PagesSetIndex(6) then Beep;
end;

procedure TfmTest.mNextClick(Sender: TObject);
begin
  Groups.MovePopupTabToNext(true);
end;

procedure TfmTest.mPreClick(Sender: TObject);
begin
  Groups.MovePopupTabToNext(false);
end;

procedure TfmTest.TabFocus(S: TObject);
var
  D: TATTabData;
begin
  D:= (S as TATTabs).GetTabData((S as TATTabs).TabIndex);
  if D<>nil then
  begin
    (D.TabObject as TMemo).SetFocus;
  end;
end;

procedure TfmTest.MemoFocus(S: TObject);
begin
  Groups.PagesCurrent:= (S as TMemo).Parent as TATPages;
  Caption:= Format('Group: %d', [Groups.PagesIndexOf(Groups.PagesCurrent)]);
end;

procedure TfmTest.mnuMoveNextClick(Sender: TObject);
begin
  Groups.MoveCurrentTabToNext(true);
end;

procedure TfmTest.mnuMovePrevClick(Sender: TObject);
begin
  Groups.MoveCurrentTabToNext(false);
end;

procedure TfmTest.TreeDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
  Accept:= true;
end;

procedure TfmTest.mnuMoveOppClick(Sender: TObject);
begin
  Groups.MoveCurrentTabToOpposite;
end;

procedure TfmTest.mnuCloseThisClick(Sender: TObject);
begin
  Groups.PopupPages.Tabs.DeleteTab(Groups.PopupTabIndex, true, true);
end;

procedure TfmTest.mnuCloseOthSameClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseOthersThisPage, true);
end;

procedure TfmTest.mnuCloseOthAllClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseOthersAllPages, true);
end;

procedure TfmTest.mnuCloseAllClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseAll, false);
end;

procedure TfmTest.mnuCloseAllThisClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseAllThisPage, true);
end;

procedure TfmTest.TabOver(S: TObject; N: Integer);
begin
  if N>=0 then
    Status.SimpleText:= 'Mouse over tab '+IntToStr(N)
  else
    Status.SimpleText:= '';  
end;

procedure TfmTest.mnuCloseRtClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseRighterThisPage, true);
end;

procedure TfmTest.mnuCloseLtClick(Sender: TObject);
begin
  Groups.CloseTabs(tabCloseLefterThisPage, true);
end;


end.
