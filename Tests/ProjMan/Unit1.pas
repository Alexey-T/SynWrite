unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, XPMan,
  TntClasses;

{$R d:\s\Syn.dkl_const.res}

type
  TForm1 = class(TForm)
    XPManifest1: TXPManifest;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure LoadMRU(Send: TObject; L: TTntStrings);
  public
    { Public declarations }
    procedure Opn(Send: TObject; L: TTntStrings);
    procedure OpnFile(Send: TObject; L: TTntStrings);
    procedure OpnFiles(Send: TObject; L: TTntStrings);
    procedure GetLex(Send: TObject; L: TTntStrings);
    procedure GetDir(Send: TObject; L: TTntStrings);
  end;

var
  Form1: TForm1;

implementation

uses unProj, tbxthemes;

{$R *.dfm}

procedure TForm1.FormShow(Sender: TObject);
begin
  with TfmProj.Create(nil) do
  try
    OnFileOpen:= Opn;
    OnAddEditorFile:= OpnFile;
    OnAddEditorFilesAll:= OpnFiles;
    OnGetLexers:= GetLex;
    OnGetWorkDir:= GetDir;
    OnLoadMRU:= LoadMRU;

    ShowModal;
    CheckModified;
  finally
    Free
  end;
  Application.Terminate;
end;

procedure TForm1.Opn(Send: TObject; L: TTntStrings);
var
  s: Widestring;
  i: Integer;
begin
  s:= '';
  for i:=0 to L.Count-1 do
    s:= s+L[i]+#13;
  Showmessage(s);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  tbxHicontrast:=true;

end;

procedure TForm1.OpnFile(Send: TObject; L: TTntStrings);
begin
  L.Add('d:\aa\aa.txt');
  L.Add('d:\bb\bb.txt');
end;

procedure TForm1.OpnFiles(Send: TObject; L: TTntStrings);
begin
  L.Add('d:\aa\1.txt');
  L.Add('d:\bb\2.txt');
  L.Add('d:\bb\3.txt');
  L.Add('d:\bb\4.txt');
end;

procedure TForm1.GetLex(Send: TObject; L: TTntStrings);
begin
  L.Add('Pascal');
  L.Add('C');
  L.Add('C++');
end;

procedure TForm1.GetDir(Send: TObject; L: TTntStrings);
begin
  L.Add('D:\T');
end;

procedure TForm1.LoadMRU(Send: TObject; L: TTntStrings);
begin
  L.Add('d:\T\SynTest\aaa.synwproj');
  L.Add('d:\T\SynTest\Dir.synwproj');
  L.Add('d:\T\SynTest\Eclipse.synwproj');
end;

end.
