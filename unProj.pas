//{$define DD} //debug

unit unProj;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ImgList,
  TB2Item, TBX, TB2Dock, TB2Toolbar,
  TntForms, TntClasses, TntComCtrls, TntDialogs,
  ExtCtrls, Menus, DKLang, unProgress, TBXExtItems, TB2MRU;

var
  SMsgProjNew: Widestring = 'Untitled';
  SMsgProjDefault: Widestring = '(Default)';
  SMsgProjNewFolder: Widestring = 'New folder';
  SMsgProjFolderName: Widestring = 'Enter folder name:';
  SMsgProjCaption: Widestring = 'SynWrite';
  SMsgProjSaveCfm: Widestring = 'Project "%s" has been modified.'#13#13'Save changes?';
  SMsgProjSortCfm: Widestring = 'Project now contains over %d new items, their sorting will be slow.'#13#13'Do you want to sort added items?';

type
  TListProc = procedure(Sender: TObject; Files: TTntStrings) of object;
  TProjSort = (srNone, srName, srExt, srDate, srSize, srDateDesc, srSizeDesc);

type
  TProjectOpts = record
    WorkDir: Widestring;
    MainFN: Widestring;
    DefLexer: string;
    DefLineEnds: integer;
    DefEnc: integer;
    SortType: TProjSort;
    SearchDirs: Widestring;
  end;

type
  TfmProj = class(TForm)
    TreeProj: TTntTreeView;
    tbProject: TTBXToolbar;
    TBXItemProjOpen: TTBXSubmenuItem;
    TBXItemProjSave: TTBXItem;
    TBXItemProjAddVirtDir: TTBXItem;
    TBXItemProjAddFiles: TTBXItem;
    TBXItemProjDelFiles: TTBXItem;
    TBXItemProjRename: TTBXItem;
    ImageList1: TImageList;
    ODFile: TTntOpenDialog;
    TimerHint: TTimer;
    TBXItemProjOpenFiles: TTBXItem;
    ImageListTool: TImageList;
    TBXItemProjProp: TTBXItem;
    PopupProj: TTBXPopupMenu;
    TbxItemMnuAdd: TTBXSubmenuItem;
    TbxItemMnuAddFiles: TTBXItem;
    TbxItemMnuAddDir: TTBXItem;
    TbxItemMnuAddVDir: TTBXItem;
    TbxItemMnuRename: TTBXItem;
    TbxItemMnuRemove: TTBXItem;
    TBXSeparatorItem1: TTBXSeparatorItem;
    TBXItemMnuProjSaveAs: TTBXItem;
    TBXItemMnuProjSave: TTBXItem;
    TBXItemMnuProjOpen: TTBXItem;
    TBXItemMnuProjClose: TTBXItem;
    TBXItemMnuProjProp: TTBXItem;
    TBXSeparatorItem2: TTBXSeparatorItem;
    TBXItemMnuOpenFiles: TTBXItem;
    ODProj: TOpenDialog;
    SDProj: TSaveDialog;
    TBXItemProjAddFilesDir: TTBXItem;
    TBXSeparatorItem3: TTBXSeparatorItem;
    TBXItemMnuAddOpenedFiles: TTBXItem;
    TBXItemMnuAddCurrFile: TTBXItem;
    TBXItemMnuSetMain: TTBXItem;
    TBXSeparatorItem4: TTBXSeparatorItem;
    TBXItemMnuCollapse: TTBXItem;
    TBXItemMnuExpand: TTBXItem;
    TBXSubmenuItemSort: TTBXSubmenuItem;
    TBXItemMnuSortByName: TTBXItem;
    TBXItemMnuSortByExt: TTBXItem;
    DKLanguageController1: TDKLanguageController;
    TBXItemMnuSortBySizeDesc: TTBXItem;
    TBXItemMnuSortByDateDesc: TTBXItem;
    TBXItemMnuSortBySize: TTBXItem;
    TBXItemMnuSortByDate: TTBXItem;
    TBXItemMnuProps: TTBXItem;
    TBXSeparatorItem5: TTBXSeparatorItem;
    TBXItemProjClearRecent: TTBXItem;
    TBXItemProjMRU: TTBXMRUListItem;
    ProjMRUList: TTBXMRUList;
    procedure TBXItemProjAddVirtDirClick(Sender: TObject);
    procedure TBXItemProjDelFilesClick(Sender: TObject);
    procedure TBXItemProjAddFilesClick(Sender: TObject);
    procedure TBXItemProjRenameClick(Sender: TObject);
    procedure TreeProjKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure TreeProjEditing(Sender: TObject; Node: TTreeNode;
      var AllowEdit: Boolean);
    procedure TreeProjDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeProjDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeProjMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TimerHintTimer(Sender: TObject);
    procedure TreeProjDblClick(Sender: TObject);
    procedure TBXItemProjOpenFilesClick(Sender: TObject);
    procedure TBXItemProjNewClick(Sender: TObject);
    procedure TbxItemMnuAddFilesClick(Sender: TObject);
    procedure TbxItemMnuAddVDirClick(Sender: TObject);
    procedure TbxItemMnuAddDirClick(Sender: TObject);
    procedure TbxItemMnuRenameClick(Sender: TObject);
    procedure TbxItemMnuRemoveClick(Sender: TObject);
    procedure TBXItemProjOpenClick(Sender: TObject);
    procedure TBXItemProjSaveClick(Sender: TObject);
    procedure PopupProjPopup(Sender: TObject);
    procedure TreeProjContextPopup(Sender: TObject; MousePos: TPoint;
      var Handled: Boolean);
    procedure TBXItemMnuProjPropClick(Sender: TObject);
    procedure TBXItemProjPropClick(Sender: TObject);
    procedure TBXItemMnuOpenFilesClick(Sender: TObject);
    procedure TBXItemMnuProjOpenClick(Sender: TObject);
    procedure TBXItemMnuProjSaveClick(Sender: TObject);
    procedure TBXItemMnuProjSaveAsClick(Sender: TObject);
    procedure TBXItemMnuProjCloseClick(Sender: TObject);
    procedure TBXItemProjAddFilesDirClick(Sender: TObject);
    procedure TBXItemMnuAddCurrFileClick(Sender: TObject);
    procedure TBXItemMnuAddOpenedFilesClick(Sender: TObject);
    procedure TBXItemMnuSetMainClick(Sender: TObject);
    procedure TBXItemMnuSortByNameClick(Sender: TObject);
    procedure TBXItemMnuExpandClick(Sender: TObject);
    procedure TBXItemMnuCollapseClick(Sender: TObject);
    procedure TBXItemMnuSortByExtClick(Sender: TObject);
    procedure TreeProjEdited(Sender: TObject; Node: TTntTreeNode;
      var S: WideString);
    procedure TBXItemMnuSortByDateClick(Sender: TObject);
    procedure TBXItemMnuSortBySizeClick(Sender: TObject);
    procedure TBXItemMnuSortByDateDescClick(Sender: TObject);
    procedure TBXItemMnuSortBySizeDescClick(Sender: TObject);
    procedure TBXItemMnuPropsClick(Sender: TObject);
    procedure TBXItemProjClearRecentClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure TBXItemProjOpenPopup(Sender: TTBCustomItem;
      FromLink: Boolean);
  private
    { Private declarations }
    FProjectFN: Widestring;
    FModified: boolean;
    FIcoList: TStringList;
    FPathList: TTntStringList;
    FOldItemsCount: integer;
    FOnFileOpen: TListProc;
    FOnUpdateMRU: TListProc;
    FOnLoadMRU: TListProc;
    FOnAddEditorFile: TListProc;
    FOnAddEditorFilesAll: TListProc;
    FOnGetLexers: TListProc;
    FOnGetWorkDir: TListProc;
    FOnGetProjDir: TListProc;
    FOnSetProjDir: TListProc;
    FShellIcons: boolean;
    fmProgress: TfmProgress;
    procedure ProjMRUListClick(Sender: TObject; const Filename: WideString);
    function DoSortCfm: boolean;
    procedure ShowProgress(M: TProgressType);
    procedure HideProgress;
    function IsProgressStopped(Cnt, CntAll: integer): boolean;
    procedure Modify;
    function RootNode: TTntTreeNode;
    function GetWorkDir: Widestring;
    function GetProjDir: Widestring;
    procedure DoUpdateMRU;
    procedure DoLoadMRU;
    procedure SetProjDir(const Dir: string);
    procedure DoUpdateSort(Node: TTntTreeNode);
    procedure DoAddDirDlg(const SDir: Widestring);
    procedure DoSortBy(Mode: TProjSort);
    procedure DoSortDir(Node: TTntTreeNode; Subdirs: boolean; SortType: TProjSort);
    procedure DoAddEditorFiles(All: boolean);
    function CanRename(Node: TTntTreeNode): boolean;
    procedure DoOpenProject;
    procedure DoSaveProject;
    procedure DoSaveProjectAs;
    procedure DoConfigProject;
    procedure DoLoadProjectFromFile(const fn: Widestring);
    procedure DoSaveProjectToFile(const fn: string);
    procedure DoWriteNodesToList(L: TStringList; Node: TTntTreeNode; Level: integer);
    function DirForNode(Node: TTntTreeNode): TTntTreeNode;
    function DoAddDirWithSubdirs(Node: TTntTreeNode; const SDir: Widestring;
      SubDirs, NoBinary: boolean; const ExtInc, ExtExc: string): TTntTreeNode;
    procedure AddFilesToList(L: TTntStringList; Node: TTntTreeNode);
    function IsRoot(Node: TTntTreeNode): boolean;
    function IsFilenameListed(Node: TTntTreeNode; const fn: Widestring): boolean;
    procedure DoRefresh;
    procedure DoAddFiles;
    procedure DoAddFilesDir;
    procedure DoAddVirtualDir;
    function DoAddFile(Sel: TTntTreeNode; const fn: Widestring): TTntTreeNode;
    function DoAddDir(Sel: TTntTreeNode; S: Widestring;
      DoExpand: boolean = true): TTntTreeNode;
    procedure DoRename;
    procedure DoRemove;
    procedure DoOpenFiles;
    procedure DoNewProject;
  public
    { Public declarations }
    FOpts: TProjectOpts;
    function GetFN(Node: TTntTreeNode): Widestring;
    function GetImageIndex(const fn: Widestring): integer;
    property ProjectFN: Widestring read FProjectFN write DoLoadProjectFromFile;
    property Modified: boolean read FModified;
    property OnFileOpen: TListProc read FOnFileOpen write FOnFileOpen;
    property OnUpdateMRU: TListProc read FOnUpdateMRU write FOnUpdateMRU;
    property OnLoadMRU: TListProc read FOnLoadMRU write FOnLoadMRU;
    property OnAddEditorFile: TListProc read FOnAddEditorFile write FOnAddEditorFile;
    property OnAddEditorFilesAll: TListProc read FOnAddEditorFilesAll write FOnAddEditorFilesAll;
    property OnGetLexers: TListProc read FOnGetLexers write FOnGetLexers;
    property OnGetWorkDir: TListProc read FOnGetWorkDir write FOnGetWorkDir;
    property OnGetProjDir: TListProc read FOnGetProjDir write FOnGetProjDir;
    property OnSetProjDir: TListProc read FOnSetProjDir write FOnSetProjDir;
    //
    procedure CheckModified(ClearModified: boolean = false);
    procedure UpdateTitle;
    procedure DoDropItem(const fn: Widestring);
    procedure DoSaveProjectIfNeeded;
  end;

procedure SStringToList(s: Widestring; L: TTntStrings);
procedure SListToString(L: TTntStrings; var S: Widestring);

implementation

uses
  CommCtrl,
  IniFiles,
  ATxFProc,
  AtxSProc,
  ATxIconProc,
  TntWideStrUtils,
  TntFileCtrl,
  TntSysUtils, unProjAddDir, unProjProps;

{$R *.dfm}

const
  cProjVar = '{Proj}'; //used in Proj files
  cHintTimer = 2000;

const
  cImgRoot = 0;
  cImgDir = 1;
  cImgFile = 2;
  cImgMissed = 3;

procedure MsgBeep;
begin
  MessageBeep(mb_iconwarning);
end;

function MsgCfm(const S: Widestring; Handle: THandle): boolean;
begin
  Result:= MessageBoxW(Handle,
    PWChar(S),
    PWChar(SMsgProjCaption),
    mb_okcancel or mb_iconwarning) = id_ok;
end;

function IsDir(Node: TTntTreeNode): boolean;
begin
  if Node=nil then
    raise Exception.Create('node nil');
  Result:= Node.ImageIndex<=1;
end;

procedure SListToString(L: TTntStrings; var S: Widestring);
var
  i: Integer;
begin
  S:= '';
  for i:= 0 to L.Count-1 do
    if Trim(L[i])<>'' then
      S:= S+L[i]+';';
end;

procedure SStringToList(s: Widestring; L: TTntStrings);
var
  ss: Widestring;
begin
  L.Clear;
  repeat
    ss:= SGetItem(s, ';');
    if Trim(ss)='' then Break;
    L.Add(ss);
  until false;
end;

function TfmProj.DirForNode(Node: TTntTreeNode): TTntTreeNode;
begin
  if IsDir(Node) then
    Result:= Node
  else
    Result:= Node.Parent;
end;

procedure TfmProj.DoNewProject;
begin
  CheckModified;

  with TreeProj do
  begin
    Items.Clear;
    with Items.Add(nil, '') do
    begin
      ImageIndex:= cImgRoot;
      SelectedIndex:= ImageIndex;
    end;
    Selected:= RootNode;
  end;

  FProjectFN:= '';
  FModified:= false;
  FOpts.MainFN:= '';
  FOpts.WorkDir:= '';
  FOpts.DefLexer:= '';
  FOpts.DefLineEnds:= 0;
  FOpts.DefEnc:= 0;
  FOpts.SortType:= srExt;
  FOpts.SearchDirs:= '';

  FPathList.Clear;
  UpdateTitle;

  {$ifdef DD}
  {
  DoAddDir(RootNode, 'Test');
  DoAddDir(RootNode, 'ATest');
  DoAddFile(RootNode, 'd:\t\history.txt');
  DoAddFile(RootNode, 'd:\z.txt');
  DoAddFile(RootNode, 'd:\dd.txt');
  //DoAddDirWithSubdirs(TreeProj.Items[1], 'd:\work\Dir');
  //DoSort(TreeProj.Selected);
  }
  {$endif}
end;

procedure TfmProj.TBXItemProjAddVirtDirClick(Sender: TObject);
begin
  DoAddVirtualDir;
end;

procedure TfmProj.DoAddVirtualDir;
var
  S: Widestring;
begin
  SMsgProjNewFolder:= DKLangConstW('zNewFolder');
  SMsgProjFolderName:= DKLangConstW('zNewFolderName');

  S:= SMsgProjNewFolder;
  {$ifndef DD}
  if not WideInputQuery(SMsgProjCaption, SMsgProjFolderName, S) then Exit;
  {$endif}

  with TreeProj do
  begin
    DoAddDir(Selected, S);
    DoUpdateSort(Selected);
  end;

  Modify;
end;

function TfmProj.DoAddDir(Sel: TTntTreeNode; S: Widestring; DoExpand: boolean = true): TTntTreeNode;
begin
  Result:= nil;
  if sel=nil then Exit;
  if S='' then S:= '?';

  with TreeProj do
  begin
    Result:= Items.AddChild(DirForNode(sel), S);
    with Result do
    begin
      ImageIndex:= cImgDir;
      SelectedIndex:= ImageIndex;
    end;
  end;

  if DoExpand then
    sel.Expand(false);
  Modify;
end;

procedure TfmProj.TBXItemProjDelFilesClick(Sender: TObject);
begin
  DoRemove;
end;

procedure TfmProj.DoRemove;
var i: Integer;
begin
  with TreeProj do
    if Selected=nil then
      MsgBeep
    else  
    if RootNode.Selected then //root selected
      MsgBeep
    else
    if SelectionCount=0 then //none selected
      MsgBeep
    else
    begin
      if not MsgCfm(WideFormat(DKLangConstW('zMDelMany'), [SelectionCount]), Self.Handle) then Exit;
      for i:= SelectionCount-1 downto 0 do
        Items.Delete(Selections[i]);
      Modify;
    end;  
end;

procedure TfmProj.TBXItemProjAddFilesClick(Sender: TObject);
begin
  DoAddFiles;
end;

procedure TfmProj.DoAddFiles;
var
  i: Integer;
  Node: TTntTreeNode;
begin
  ODFile.InitialDir:= GetWorkDir;
  if not ODFile.Execute then Exit;
  Node:= nil;
  for i:= 0 to ODFile.Files.Count-1 do
    Node:= DoAddFile(TreeProj.Selected, ODFile.Files[i]);
  if Node<>nil then
  begin
    DoUpdateSort(TreeProj.Selected);
    Node.MakeVisible;
  end;
end;

procedure TfmProj.TBXItemProjRenameClick(Sender: TObject);
begin
  DoRename;
end;

procedure TfmProj.DoRename;
begin
  with TreeProj do
    if (Selected<>nil) and (SelectionCount=1) and CanRename(Selected) then
      TreeView_EditLabel(Handle, Selected.ItemId)
    else
      MsgBeep;
end;

function TfmProj.IsRoot(Node: TTntTreeNode): boolean;
begin
  if Node=nil then
    raise Exception.Create('node nil');
  Result:= (Node.Parent=nil);
end;

procedure TfmProj.TreeProjKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_F2) and (Shift=[]) then
  begin
    DoRename;
    Key:= 0;
    Exit
  end;
  if (Key=VK_F5) and (Shift=[]) then
  begin
    DoRefresh;
    Key:= 0;
    Exit
  end;
  if (Key=VK_delete) and (Shift=[]) and not TreeProj.IsEditing then
  begin
    DoRemove;
    Key:= 0;
    Exit
  end;
  if (Key=VK_insert) and (Shift=[]) then
  begin
    DoAddFiles;
    Key:= 0;
    Exit
  end;
  if (Key=vk_return) and (Shift=[]) then
  begin
    if not IsDir(TreeProj.Selected) then
      DoOpenFiles;
    Key:= 0;
    Exit
  end;
end;

function TfmProj.DoAddFile(Sel: TTntTreeNode; const fn: Widestring): TTntTreeNode;
begin
  Result:= nil;
  if Sel=nil then Exit;
  if IsFilenameListed(Sel, fn) then Exit;

  with TreeProj do
    begin
      if IsDir(Sel) then
        Result:= Items.AddChild(Sel, WideExtractFileName(fn))
      else
        Result:= Items.Add(Sel, WideExtractFileName(fn));

      with Result do
      begin
        ImageIndex:= GetImageIndex(fn);
        SelectedIndex:= ImageIndex;
        Data:= Pointer(FPathList.Add(fn));
      end;
    end;
  Modify;
end;


function TfmProj.GetImageIndex(const fn: Widestring): integer;
var
  ext: string;
  useCache: boolean;
  N: Integer;
begin
  if not IsFileExist(fn) then
  begin
    Result:= cImgMissed;
    Exit
  end;
  if not FShellIcons then
  begin
    Result:= cImgFile;
    Exit
  end;

  ext:= LowerCase(WideExtractFileExt(fn));
  useCache:= (ext<>'') and not SFileExtensionMatch(fn, 'exe,lnk,dll,ocx,scr');

  if useCache then
    N:= FIcoList.IndexOf(ext)
  else
    N:= -1;  
  if (N>=0) then
    Result:= Integer(FIcoList.Objects[N])
  else
  begin
    GetIcon(fn, ImageList1);
    Result:= ImageList1.Count-1;
    FIcoList.AddObject(ext, TObject(Result));
  end;  
end;

procedure TfmProj.FormCreate(Sender: TObject);
begin
  FixImageList32bit(ImageList1);

  FShellIcons:= true; //todo
  FIcoList:= TStringList.Create;
  FPathList:= TTntStringList.Create;
  fmProgress:= nil;

  ProjMRUList.OnClick:= ProjMRUListClick;
  DoNewProject;
end;

procedure TfmProj.FormDestroy(Sender: TObject);
begin
  FreeAndNil(FPathList);
  FreeAndNil(FIcoList);
end;

procedure TfmProj.TreeProjEditing(Sender: TObject; Node: TTreeNode;
  var AllowEdit: Boolean);
begin
  AllowEdit:= CanRename(TTntTreeNode(Node));
end;


(*
procedure TfmProj.MoveNode(TargetNode, SourceNode: TTntTreeNode);
var
  nodeTmp: TTntTreeNode;
  i: Integer;
begin
  with TreeProj do
  begin
    if IsDir(TargetNode) then
      nodeTmp:= Items.AddChild(TargetNode, SourceNode.Text)
    else
      nodeTmp:= Items.Add(TargetNode, SourceNode.Text);
  end;

  nodeTmp.ImageIndex:= SourceNode.ImageIndex;
  nodeTmp.SelectedIndex:= SourceNode.SelectedIndex;
  nodeTmp.Data:= SourceNode.Data;

  for i:= 0 to SourceNode.Count - 1 do
    MoveNode(nodeTmp, SourceNode.Item[i]);
end;
*)

function IsAltPressed: boolean;
begin
  Result:= GetKeyState(vk_menu) < 0;
end;

procedure TfmProj.TreeProjDragDrop(Sender, Source: TObject; X, Y: Integer);
var
  TargetNode, SourceNode: TTntTreeNode;
begin
  with TreeProj do
  begin
    TargetNode:= GetNodeAt(X, Y);
    SourceNode:= Selected;
    if (TargetNode=nil) or IsRoot(SourceNode) then
    begin
      EndDrag(False);
      MsgBeep;
      Exit;
    end;

    if IsAltPressed or not IsDir(TargetNode) then
    begin
      if IsRoot(TargetNode) then
        MsgBeep
      else
        SourceNode.MoveTo(TargetNode, naInsert);
    end
    else
    begin
      SourceNode.MoveTo(TargetNode, naAddChild);
      {
      //from DRKB
      MoveNode(TargetNode, SourceNode);
      SourceNode.Free;
      }
    end;
  end;
end;

procedure TfmProj.TreeProjDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
{var
  Node: TTntTreeNode;
  P: TPoint;}
begin
  Accept:= (Sender = TreeProj)
    and (Source = TreeProj);
  {
  if Accept then
  begin
    Node:= TreeProj.GetNodeAt(X, Y);
    if Node=nil then Exit;
    if not (IsAltPressed or not IsDir(Node)) then Exit;
    P:= TreeProj.ScreenToClient(Point(X, Y));
    TreeProj.Canvas.Pen.Color:= clNavy;
    TreeProj.Canvas.MoveTo(20, P.Y);
    TreeProj.Canvas.MoveTo(TreeProj.Width-20, P.Y);
  end;
  }
end;


procedure TfmProj.TreeProjMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  Node: TTntTreeNode;
  P: TPoint;
begin
  P:= Point(X, Y);
  Node:= TreeProj.GetNodeAt(P.X, P.Y);
  if (Node<>nil) and not IsDir(Node) then
  begin
    TreeProj.Hint:= GetFN(Node);
    TimerHint.Interval:= cHintTimer;
    TimerHint.Enabled:= true;
  end
  else
  begin
    TreeProj.Hint:= '';
    TimerHint.Enabled:= false;
    Application.HideHint;
  end;
end;

procedure TfmProj.TimerHintTimer(Sender: TObject);
begin
  TimerHint.Enabled:= false;
  Application.ActivateHint(Mouse.CursorPos);
end;

function TfmProj.GetFN(Node: TTntTreeNode): Widestring;
var
  N: Integer;
begin
  Result:= '';
  if not IsDir(Node) then
  begin
    N:= Integer(Node.Data);
    if (N>=0) and (N<FPathList.Count) then
      Result:= FPathList[N]
    else
      raise Exception.Create('Bad FN index');  
  end;
end;

procedure TfmProj.DoOpenFiles;
var
  L: TTntStringList;
  i: Integer;
begin
  if Assigned(FOnFileOpen) then
    with TreeProj do
      if (SelectionCount>0) then
      begin
        L:= TTntStringList.Create;
        try
          for i:= 0 to SelectionCount-1 do
          begin
            if IsDir(Selections[i]) then
              AddFilesToList(L, Selections[i])
            else
              L.Add(GetFN(Selections[i]));
          end;    

          if L.Count>0 then
            FOnFileOpen(Self, L)
          else
            MsgBeep;  
        finally
          FreeAndNil(L);
        end;
      end;
end;

procedure TfmProj.TreeProjDblClick(Sender: TObject);
begin
  with TreeProj do
    if Selected<>nil then
      if not IsDir(Selected) then
        DoOpenFiles;
end;

procedure TfmProj.TBXItemProjOpenFilesClick(Sender: TObject);
begin
  DoOpenFiles;
end;

procedure TfmProj.AddFilesToList(L: TTntStringList; Node: TTntTreeNode);
var
  N: TTntTreeNode;
begin
  N:= Node.GetFirstChild;
  while N<>nil do
  begin
    if IsDir(N) then
      AddFilesToList(L, N)
    else
      L.Add(GetFN(N));
    N:= Node.GetNextChild(N);
  end;
end;

function TfmProj.IsFilenameListed(Node: TTntTreeNode; const fn: Widestring): boolean;
var
  N: TTntTreeNode;
begin
  Result:= false;
  N:= Node.GetFirstChild;
  while N<>nil do
  begin
    if not IsDir(N) and
      (UpperCase(fn) = UpperCase(GetFN(N))) then
      begin Result:= true; Exit end;
    N:= Node.GetNextChild(N);
  end;
end;


procedure TfmProj.TBXItemProjNewClick(Sender: TObject);
begin
  DoNewProject;
end;

procedure TfmProj.DoRefresh;
var
  i: Integer;
begin
  Screen.Cursor:= crHourGlass;
  try
    with TreeProj do
    for i:= 0 to Items.Count-1 do
      if not IsDir(Items[i]) then
      begin
        Items[i].ImageIndex:= GetImageIndex(GetFN(Items[i]));
        Items[i].SelectedIndex:= Items[i].ImageIndex;
      end;
  finally
    Screen.Cursor:= crDefault;
  end;
end;

procedure TfmProj.TbxItemMnuAddFilesClick(Sender: TObject);
begin
  DoAddFiles;
end;

procedure TfmProj.TbxItemMnuAddVDirClick(Sender: TObject);
begin
  DoAddVirtualDir;
end;

procedure TfmProj.TbxItemMnuAddDirClick(Sender: TObject);
begin
  DoAddFilesDir;
end;

procedure TfmProj.DoAddFilesDir;
var
  S: Widestring;
  Node: TTntTreeNode;
begin
  S:= GetWorkDir;
  if WideSelectDirectory('', '', S) then
  begin
    Node:= TreeProj.Selected;
    DoAddDirDlg(S);
    DoUpdateSort(Node);
  end;
end;

procedure TfmProj.ShowProgress(M: TProgressType);
begin
  StopFind:= false;
  Application.MainForm.Enabled:= false;
  if not Assigned(fmProgress) then
    fmProgress:= TfmProgress.Create(Self);
  fmProgress.SetMode(M);
  fmProgress.Show;
end;

procedure TfmProj.HideProgress;
begin
  StopFind:= false;
  Application.MainForm.Enabled:= true;
  if Assigned(fmProgress) then
    FreeAndNil(fmProgress);
end;

function TfmProj.IsProgressStopped(Cnt, CntAll: integer): boolean;
var
  NPro: Integer;
begin
  Result:= StopFind;
  if Result then Exit;

  if Assigned(fmProgress) then
  begin
    NPro:= (TreeProj.Items.Count - FOldItemsCount) div 10 * 10;
    fmProgress.labCount.Caption:= IntToStr(NPro);
    fmProgress.Pro.Progress:= Int64(Cnt) * 100 div CntAll;
    Application.ProcessMessages;
  end;
  Result:= StopFind;
end;

function TfmProj.DoSortCfm: boolean;
const
  cItems = 1000;
begin
  if FOpts.SortType=srNone then
    begin Result:= false; Exit end;
  if TreeProj.Items.Count - FOldItemsCount < cItems then
    begin Result:= true; Exit end;

  SMsgProjSortCfm:= DKLangConstW('zMSortProj');
  Result:= MessageBoxW(Handle,
    PWChar(WideFormat(SMsgProjSortCfm, [cItems])),
    PWChar(SMsgProjCaption),
    mb_yesno or mb_iconwarning or mb_taskmodal)=id_yes;
end;

procedure TfmProj.DoAddDirDlg(const SDir: Widestring);
var
  ExtInc, ExtExc: string;
  SubDirs, NoBin: boolean;
  Node: TTntTreeNode;
begin
  with TfmProjAddDir.Create(nil) do
  try
    edDir.Text:= SDir;
    edInc.Text:= '';
    edExc.Text:= 'exe,dll,lnk,zip,rar';
    if ShowModal<>mrOk then Exit;
    ExtInc:= edInc.Text;
    ExtExc:= edExc.Text;
    SubDirs:= cbSubdir.Checked;
    NoBin:= cbNoBin.Checked;
  finally
    Free
  end;

  Screen.Cursor:= crHourGlass;
  TreeProj.Items.BeginUpdate;
  FOldItemsCount:= TreeProj.Items.Count;

  try
    ShowProgress(proAddFolders);
    Node:= DoAddDirWithSubdirs(
      DirForNode(TreeProj.Selected),
      SDir, SubDirs, NoBin, ExtInc, ExtExc);
    HideProgress;

    if (Node<>nil) and DoSortCfm then
    begin
      ShowProgress(proSortFolders);
      DoSortDir(Node, true, FOpts.SortType);
      HideProgress;
      Node.Expand(false);
    end;
  finally
    HideProgress;
    TreeProj.Items.EndUpdate;
    Screen.Cursor:= crDefault;
  end;

  if Node<>nil then
  begin
    TreeProj.Selected:= Node;
    TreeProj.Selected.MakeVisible;
  end;
end;


function TfmProj.DoAddDirWithSubdirs(Node: TTntTreeNode; const SDir: Widestring;
  SubDirs, NoBinary: boolean; const ExtInc, ExtExc: string): TTntTreeNode;
var
  NodeDir: TTntTreeNode;
  Rec: TSearchRecW;
  fn: Widestring;
begin
  if IsProgressStopped(1, 1) then
    begin Result:= nil; Exit; end;
    
  NodeDir:= DoAddDir(Node, WideExtractFileName(SDir));

  FillChar(Rec, SizeOf(Rec), 0);
  if WideFindFirst(SDir+'\*.*', faAnyFile, Rec)=0 then
  repeat
    if (Rec.Name='.') or (Rec.Name='..') then Continue;
    fn:= SDir+'\'+Rec.Name;
    if (Rec.Attr and faDirectory)<>0 then
    begin
      if SubDirs then
        DoAddDirWithSubdirs(NodeDir, fn, SubDirs, NoBinary, ExtInc, ExtExc);
    end
    else
    begin
      if (ExtExc<>'') and SFileExtensionMatch(fn, ExtExc) then Continue;
      if (ExtInc<>'') and not SFileExtensionMatch(fn, ExtInc) then Continue;
      if NoBinary and not IsFileText(fn) then Continue;
      DoAddFile(NodeDir, fn);
    end;  
  until WideFindNext(Rec)<>0;
  WideFindClose(Rec);

  if NodeDir.GetFirstChild=nil then
    FreeAndNil(NodeDir);
  Result:= NodeDir;
end;

procedure TfmProj.TbxItemMnuRenameClick(Sender: TObject);
begin
  DoRename;
end;

procedure TfmProj.TbxItemMnuRemoveClick(Sender: TObject);
begin
  DoRemove;
end;

procedure TfmProj.DoOpenProject;
var
  fn: string;
begin
  ODProj.InitialDir:= GetProjDir;
  ODProj.FileName:= '';
  if not ODProj.Execute then Exit;

  if not FileExists(ODProj.FileName) then
    if not MsgCfm(WideFormat(DKLangConstW('MCre'), [WideExtractFileName(ODProj.FileName)]), Handle) then Exit;

  SetProjDir(ExtractFileDir(ODProj.FileName));
  fn:= ODProj.FileName;
  DoLoadProjectFromFile(fn);
end;

procedure TfmProj.DoLoadProjectFromFile(const fn: Widestring);
  function FExpandFN(const fn: Widestring): Widestring;
  var
    dir: Widestring;
  begin
    Result:= fn;
    if SBegin(Result, cProjVar) then
    begin
      dir:= WideExcludeTrailingBackslash(WideExtractFileDir(FProjectFN));
      SReplaceW(Result, cProjVar, dir);
    end;
  end;
var
  L: TStringList;
  i, j, n: integer;
  Level, LevelDir: integer;
  S: string;
  SName: Widestring;
  dir: boolean;
  Node, NodeDir: TTntTreeNode;
begin
  DoNewProject;
  FProjectFN:= fn;

  //add to recents
  if fn<>'' then
  begin
    n:= ProjMRUList.Items.IndexOf(fn);
    if n>=0 then
      ProjMRUList.Items.Delete(n);
    ProjMRUList.Items.Insert(0, fn);
    DoUpdateMRU;
  end;

  NodeDir:= RootNode;
  LevelDir:= -1;

  with TIniFile.Create(fn) do
  try
    FOpts.WorkDir:= UTF8Decode(ReadString('Ini', 'WorkDir', ''));
    FOpts.MainFN:= UTF8Decode(ReadString('Ini', 'MainFile', ''));
    FOpts.DefLexer:= ReadString('Ini', 'DefLexer', '');
    FOpts.DefLineEnds:= ReadInteger('Ini', 'DefLineEnds', 0);
    FOpts.DefEnc:= ReadInteger('Ini', 'DefEnc', 0);
    FOpts.SortType:= TProjSort(ReadInteger('Ini', 'SortType', Ord(srExt)));
    FOpts.SearchDirs:= UTF8Decode(ReadString('Ini', 'SearchDirs', ''));
  finally
    Free
  end;

  Screen.Cursor:= crHourGlass;
  TreeProj.Items.BeginUpdate;
  L:= TStringList.Create;
  try
    FReadSection(fn, 'Nodes', L);
    for i:= 0 to L.Count-1 do
    begin
      S:= L[i];
      n:= Pos('\', S);
      if n=0 then Continue;
      Level:= n-1;
      Delete(S, 1, n);
      if S='' then Continue;
      dir:= S[1]=':';
      if dir then Delete(S, 1, 1);
      SName:= UTF8Decode(S);

      //new item is deeper than NodeDir
      if Level>LevelDir then
      begin
        if (Level-LevelDir)>1 then
          Application.MessageBox(PChar('Bad level for node:'#13+L[i]),
            'Project loading', mb_ok or mb_iconerror);
        Node:= NodeDir;
      end
      else
      begin
        //new item is at same level or higher than NodeDir
        Node:= NodeDir;
        for j:= 1 to (LevelDir-Level)+1 do
        begin
          Node:= Node.Parent;
          if Node=nil then Break;
        end;
      end;
      if Node=nil then Continue;
      if dir then
      begin
        NodeDir:= DoAddDir(Node, SName, false);
        LevelDir:= Level;
      end
      else
        DoAddFile(Node, FExpandFN(SName));
    end;
  finally
    FreeAndNil(L);
    Screen.Cursor:= crDefault;
    TreeProj.Items.EndUpdate;
  end;

  RootNode.Expand(false);
  RootNode.MakeVisible;

  FModified:= false;
  UpdateTitle;
end;

procedure TfmProj.DoSaveProjectIfNeeded;
begin
  if FModified then
    if FProjectFN<>'' then
      DoSaveProjectToFile(FProjectFN);
end;

procedure TfmProj.DoSaveProject;
begin
  if FProjectFN<>'' then
    DoSaveProjectToFile(FProjectFN)
  else
    DoSaveProjectAs;
end;

procedure TfmProj.DoSaveProjectAs;
begin
  SDProj.InitialDir:= GetProjDir;
  SDProj.FileName:= '';
  if not SDProj.Execute then Exit;
  SetProjDir(ExtractFileDir(SDProj.FileName));
  DoSaveProjectToFile(SDProj.FileName);
end;

procedure TfmProj.DoSaveProjectToFile(const fn: string);
var
  List, ListNodes: TStringList;
  procedure Write(const Id, S: string);
  begin
    List.Add(Id+'='+S);
  end;
const
  cUtfSign = #$EF#$BB#$BF;
begin
  FProjectFN:= fn;
  FModified:= false;
  UpdateTitle;

  List:= TStringList.Create;
  try
    List.Add(cUtfSign);
    List.Add('[Ini]');
    Write('WorkDir', UTF8Encode(FOpts.WorkDir));
    Write('MainFile', UTF8Encode(FOpts.MainFN));
    Write('DefLexer', FOpts.DefLexer);
    Write('DefLineEnds', IntToStr(FOpts.DefLineEnds));
    Write('DefEnc', IntToStr(FOpts.DefEnc));
    Write('SortType', IntToStr(Ord(FOpts.SortType)));
    Write('SearchDirs', UTF8Encode(FOpts.SearchDirs));
    
    List.Add('');
    List.Add('[Nodes]');

    ListNodes:= TStringList.Create;
    try
      DoWriteNodesToList(ListNodes, RootNode, 0);
      List.AddStrings(ListNodes);
    finally
      FreeAndNil(ListNodes);
    end;
        
    List.SaveToFile(fn);
  finally
    FreeAndNil(ListNodes);
    FreeAndNil(List);
  end;
end;

procedure TfmProj.DoWriteNodesToList(L: TStringList; Node: TTntTreeNode; Level: integer);
  function FCollapse(const fn: Widestring): Widestring;
  var
    dir, dirVar: Widestring;
  begin
    Result:= fn;
    dir:= WideExtractFilePath(FProjectFN);
    dirVar:= cProjVar;
    if SBegin(WideLowerCase(fn), WideLowerCase(dir)) then
    begin
      ////SReplaceW(Result, dir, dirVar+'\');
      Delete(Result, 1, Length(dir));
      Insert(dirVar+'\', Result, 1);
    end;
  end;
var
  N: TTntTreeNode;
  pre: string;
begin
  pre:= StringOfChar('.', Level)+'\';
  N:= Node.GetFirstChild;
  while N<>nil do
  begin
    if IsDir(N) then
    begin
      L.Add(pre+':'+UTF8Encode(N.Text));
      DoWriteNodesToList(L, N, Level+1);
    end
    else
      L.Add(pre+UTF8Encode(FCollapse(GetFN(N))));

    N:= Node.GetNextChild(N);
  end;
end;

procedure TfmProj.TBXItemProjOpenClick(Sender: TObject);
begin
  DoOpenProject;
end;

procedure TfmProj.TBXItemProjSaveClick(Sender: TObject);
begin
  DoSaveProject;
end;

procedure TfmProj.PopupProjPopup(Sender: TObject);
var
  pr, dir: boolean;
begin
  pr:= IsRoot(TreeProj.Selected);
  dir:= IsDir(TreeProj.Selected);

  TbxItemMnuProjOpen.Visible:= pr;
  TbxItemMnuProjSave.Visible:= pr;
  TbxItemMnuProjSaveAs.Visible:= pr;
  TbxItemMnuProjClose.Visible:= pr;
  TbxItemMnuProjProp.Visible:= pr;

  TbxItemMnuRename.Enabled:= not pr and dir;
  TbxItemMnuRemove.Enabled:= not pr;
  TbxItemMnuSetMain.Enabled:= not dir;
  TbxItemMnuProps.Enabled:= not dir;
  TbxItemMnuExpand.Enabled:= dir;
  TbxItemMnuCollapse.Enabled:= dir;
end;

procedure TfmProj.TreeProjContextPopup(Sender: TObject; MousePos: TPoint;
  var Handled: Boolean);
var
  Node: TTntTreeNode;
begin
  Node:= TreeProj.GetNodeAt(MousePos.X, MousePos.Y);
  if Node<>nil then
    TreeProj.Selected:= Node;
end;

procedure TfmProj.TBXItemMnuProjPropClick(Sender: TObject);
begin
  DoConfigProject;
end;

procedure TfmProj.TBXItemProjPropClick(Sender: TObject);
begin
  DoConfigProject;
end;

procedure TfmProj.DoConfigProject;
var
  L: TTntStringList;
begin
  with TfmProjProps.Create(nil) do
  try
    SMsgProjDefault:= DKLangConstW('zDefault');
    cbEnc.Items.Insert(0, SMsgProjDefault);
    cbEnds.Items.Insert(0, SMsgProjDefault);
    cbLexer.Items.Insert(0, '  '+SMsgProjDefault);

    L:= TTntStringList.Create;
    try
      if Assigned(FOnGetLexers) then
        FOnGetLexers(Self, L);
      cbLexer.Items.AddStrings(L);
    finally
      FreeAndNil(L);
    end;

    Caption:= Caption+' - '+RootNode.Text;
    if FOpts.DefLexer='' then
      cbLexer.ItemIndex:= 0
    else
      cbLexer.ItemIndex:= cbLexer.Items.IndexOf(FOpts.DefLexer);
    cbEnds.ItemIndex:= FOpts.DefLineEnds;
    cbEnc.ItemIndex:= FOpts.DefEnc;
    edWorkDir.Text:= FOpts.WorkDir;
    edMainFN.Text:= FOpts.MainFN;
    cbSort.ItemIndex:= Ord(FOpts.SortType);
    SStringToList(FOpts.SearchDirs, edDirs.Lines);

    if ShowModal=mrOk then
    begin
      Modify;
      if cbLexer.ItemIndex>0 then
        FOpts.DefLexer:= cbLexer.Text
      else
        FOpts.DefLexer:= '';
      FOpts.DefLineEnds:= cbEnds.ItemIndex;
      FOpts.DefEnc:= cbEnc.ItemIndex;
      FOpts.WorkDir:= edWorkDir.Text;
      FOpts.SortType:= TProjSort(cbSort.ItemIndex);
      SListToString(edDirs.Lines, FOpts.SearchDirs);
    end;
  finally
    Free;
  end;
end;

procedure TfmProj.TBXItemMnuOpenFilesClick(Sender: TObject);
begin
  DoOpenFiles;
end;

procedure TfmProj.TBXItemMnuProjOpenClick(Sender: TObject);
begin
  DoOpenProject;
end;

procedure TfmProj.TBXItemMnuProjSaveClick(Sender: TObject);
begin
  DoSaveProject;
end;

procedure TfmProj.TBXItemMnuProjSaveAsClick(Sender: TObject);
begin
  DoSaveProjectAs;
end;

procedure TfmProj.TBXItemMnuProjCloseClick(Sender: TObject);
begin
  DoNewProject;
end;

function TfmProj.RootNode: TTntTreeNode;
begin
  Result:= TreeProj.Items.GetFirstNode;
end;
  
procedure TfmProj.UpdateTitle;
var
  S: Widestring;
begin
  Caption:= FProjectFN;
  if FProjectFN='' then
    S:= SMsgProjNew
  else
    S:= ExtractFileName(FProjectFN);
  if Modified then
    S:= S+' *';
  RootNode.Text:= S;
end;

function TfmProj.CanRename(Node: TTntTreeNode): boolean;
begin
  Result:= (Node<>nil) and IsDir(Node) and not IsRoot(Node);
end;

procedure TfmProj.TBXItemProjAddFilesDirClick(Sender: TObject);
begin
  DoAddFilesDir;
end;

procedure TfmProj.TBXItemMnuAddCurrFileClick(Sender: TObject);
begin
  DoAddEditorFiles(false);
end;

procedure TfmProj.TBXItemMnuAddOpenedFilesClick(Sender: TObject);
begin
  DoAddEditorFiles(true);
end;

procedure TfmProj.DoAddEditorFiles(All: boolean);
var
  L: TTntStringList;
  i: integer;
begin
  L:= TTntStringList.Create;
  try
    if not All then
    begin
      if Assigned(FOnAddEditorFile) then
        FOnAddEditorFile(Self, L);
    end
    else
    begin
      if Assigned(FOnAddEditorFilesAll) then
        FOnAddEditorFilesAll(Self, L);
    end;

    with TreeProj do
    begin
      for i:= 0 to L.Count-1 do
        DoAddFile(Selected, L[i]);
      if IsDir(Selected) then
        Selected.Expand(false);
     end;   
  finally
    FreeAndNil(L);
  end;
end;

procedure TfmProj.TBXItemMnuSetMainClick(Sender: TObject);
begin
  with TreeProj do
    if Selected<>nil then
      if not IsDir(Selected) then
      begin
        FOpts.MainFN:= GetFN(Selected);
        Modify;
      end;
end;

//----------
var
  _SortMode: TProjSort = srName;
  _SortForm: TfmProj = nil;

function _NodeCompare(Item1, Item2: Pointer): Integer;
var
  N1, N2: TTntTreeNode;
  s1, s2, ext1, ext2: Widestring;
  Dir1, Dir2: boolean;
  fn1, fn2: Widestring;
  size1, size2: Int64;
  date1, date2: TDateTime;
begin
  N1:= TTntTreeNode(Item1);
  N2:= TTntTreeNode(Item2);
  s1:= N1.Text;
  s2:= N2.Text;
  Dir1:= IsDir(N1);
  Dir2:= IsDir(N2);
  if Dir1 then ext1:= '' else ext1:= WideExtractFileExt(s1);
  if Dir2 then ext2:= '' else ext2:= WideExtractFileExt(s2);

  if Dir1 and not Dir2 then Result:= -1 else
   if not Dir1 and Dir2 then Result:= 1 else
    if not Dir1 then
    begin
      //compare files
      case _SortMode of
      srName:
        Result:= WStrIComp(PWChar(s1), PWChar(s2));
      srExt:
        begin
          Result:= WStrIComp(PWChar(ext1), PWChar(ext2));
          if Result=0 then
            Result:= WStrIComp(PWChar(s1), PWChar(s2));
        end;
      srSize,
      srSizeDesc:
        begin
          fn1:= _SortForm.GetFN(N1);
          fn2:= _SortForm.GetFN(N2);
          size1:= FGetFileSize(fn1);
          size2:= FGetFileSize(fn2);
          Result:= Integer(size1-size2);
          if _SortMode=srSizeDesc then
            Result:= -Result;
        end;
      srDate,
      srDateDesc:
        begin
          fn1:= _SortForm.GetFN(N1);
          fn2:= _SortForm.GetFN(N2);
          date1:= FileDateToDateTime(WideFileAge(fn1));
          date2:= FileDateToDateTime(WideFileAge(fn2));
          if date1<date2 then Result:= -1 else
           if date1>date2 then Result:= 1 else
            Result:= 0;
          if _SortMode=srDateDesc then
            Result:= -Result;  
        end;
      else
        Result:= 0;
      end;
    end
    else
    begin
      //compare dirs
      case _SortMode of
      srNone:
        Result:= 0;
      else
        Result:= WStrIComp(PWChar(s1), PWChar(s2));
      end;
    end;
end;

procedure TfmProj.DoSortDir(Node: TTntTreeNode; Subdirs: boolean; SortType: TProjSort);
var
  N: TTntTreeNode;
  L: TList;
  i: Integer;
begin
  if IsProgressStopped(Node.AbsoluteIndex, TreeProj.Items.Count) then
    Exit;

  L:= TList.Create;
  try
    N:= Node.GetFirstChild;

    while N<>nil do
    begin
      if IsProgressStopped(N.AbsoluteIndex, TreeProj.Items.Count) then
        Exit;
      if IsDir(N) and Subdirs then
        DoSortDir(N, Subdirs, SortType);
      L.Add(N);
      N:= Node.GetNextChild(N);
    end;

    if StopFind then
      Exit;

    _SortMode:= SortType;
    _SortForm:= Self;
    L.Sort(_NodeCompare);

    for i:= 0 to L.Count-1 do
      if i<Node.Count then
        TTntTreeNode(L[i]).MoveTo(Node.Item[i], naInsert);
  finally
    FreeAndNil(L);
  end;
  
  Modify;
end;

procedure TfmProj.DoSortBy(Mode: TProjSort);
begin
  with TreeProj do
    if Selected<>nil then
    begin
      Screen.Cursor:= crHourGlass;
      DoSortDir(DirForNode(Selected), false, Mode);
      Screen.Cursor:= crDefault;
      Selected.MakeVisible;
    end;
end;

procedure TfmProj.TBXItemMnuSortByNameClick(Sender: TObject);
begin
  DoSortBy(srName);
end;

procedure TfmProj.TBXItemMnuSortByExtClick(Sender: TObject);
begin
  DoSortBy(srExt);
end;

procedure TfmProj.TBXItemMnuExpandClick(Sender: TObject);
begin
  with TreeProj do
    if Selected<>nil then
    begin
      Selected.Expand(true);
      Selected.MakeVisible;
    end;
end;

procedure TfmProj.TBXItemMnuCollapseClick(Sender: TObject);
begin
  with TreeProj do
    if Selected<>nil then
    begin
      Selected.Collapse(true);
      Selected.MakeVisible;
    end;
end;


procedure TfmProj.DoDropItem(const fn: Widestring);
var
  Node: TTntTreeNode;
begin
  with TreeProj do
    if Selected<>nil then
      if IsFileExist(fn) then
      begin
        Node:= DoAddFile(Selected, fn);
        if Node<>nil then
          Node.MakeVisible;
      end
      else
      if IsDirExist(fn) then
        DoAddDirDlg(fn);
end;


procedure TfmProj.TreeProjEdited(Sender: TObject; Node: TTntTreeNode;
  var S: WideString);
begin
  Modify;
end;

procedure TfmProj.Modify;
begin
  FModified:= true;
  UpdateTitle;
end;

procedure TfmProj.CheckModified(ClearModified: boolean);
var
  fn: Widestring;
begin
  if not Modified then Exit;

  if FProjectFN='' then
    fn:= SMsgProjNew
  else
    fn:= WideExtractFileName(FProjectFN);

  SMsgProjSaveCfm:= DKLangConstW('zMSaveProj');
  if MessageBoxW(Handle,
    PWChar(WideFormat(SMsgProjSaveCfm, [fn])),
    PWChar(SMsgProjcaption),
    mb_yesno or mb_iconwarning or mb_taskmodal)=id_yes then
    DoSaveProject;

  if ClearModified then
    FModified:= false;
end;

function TfmProj.GetWorkDir: Widestring;
var
  L: TTntStringList;
begin
  Result:= FOpts.WorkDir;
  if Result='' then
    if Assigned(FOnGetWorkDir) then
    begin
      L:= TTntStringList.Create;
      try
        FOnGetWorkDir(Self, L);
        if L.Count>0 then
          Result:= L[0];
      finally
        FreeAndNil(L);
      end;
    end;
end;

function TfmProj.GetProjDir: Widestring;
var
  L: TTntStringList;
begin
  Result:= '';
  if Assigned(FOnGetProjDir) then
  begin
    L:= TTntStringList.Create;
    try
      FOnGetProjDir(Self, L);
      if L.Count>0 then
        Result:= L[0];
    finally
      FreeAndNil(L);
    end;
  end;
end;

procedure TfmProj.SetProjDir(const Dir: string);
var
  L: TTntStringList;
begin
  if Assigned(FOnSetProjDir) then
  begin
    L:= TTntStringList.Create;
    try
      L.Add(Dir);
      FOnSetProjDir(Self, L);
    finally
      FreeAndNil(L);
    end;
  end;
end;

procedure TfmProj.DoUpdateSort(Node: TTntTreeNode);
begin
  if (Node<>nil) and (FOpts.SortType<>srNone) then
  begin
    if not IsDir(Node) then
      Node:= Node.Parent;
    DoSortDir(Node, false{SubDirs}, FOpts.SortType);
  end;
end;

procedure TfmProj.TBXItemMnuSortByDateClick(Sender: TObject);
begin
  DoSortBy(srDate);
end;

procedure TfmProj.TBXItemMnuSortBySizeClick(Sender: TObject);
begin
  DoSortBy(srSize);
end;

procedure TfmProj.TBXItemMnuSortByDateDescClick(Sender: TObject);
begin
  DoSortBy(srDateDesc);
end;

procedure TfmProj.TBXItemMnuSortBySizeDescClick(Sender: TObject);
begin
  DoSortBy(srSizeDesc);
end;

procedure TfmProj.TBXItemMnuPropsClick(Sender: TObject);
begin
  with TreeProj do
    if Selected<>nil then
      if not IsDir(Selected) then
        FShowProperties(GetFN(Selected), Self.Handle);
end;

procedure TfmProj.DoUpdateMRU;
begin
  if Assigned(FOnUpdateMRU) then
    FOnUpdateMRU(Self, ProjMRUList.Items);
end;

procedure TfmProj.DoLoadMRU;
begin
  if Assigned(FOnLoadMRU) then
    FOnLoadMRU(Self, ProjMRUList.Items);
end;

procedure TfmProj.TBXItemProjClearRecentClick(Sender: TObject);
begin
  ProjMRUList.Items.Clear;
  DoUpdateMRU;
end;

procedure TfmProj.ProjMRUListClick(Sender: TObject;
  const Filename: WideString);
begin
  DoLoadProjectFromFile(Filename);
end;

procedure TfmProj.FormShow(Sender: TObject);
begin
  DoLoadMRU;
end;

procedure TfmProj.TBXItemProjOpenPopup(Sender: TTBCustomItem;
  FromLink: Boolean);
begin
  TBXItemProjClearRecent.Enabled:= ProjMRUList.Items.Count>0;
end;

end.
