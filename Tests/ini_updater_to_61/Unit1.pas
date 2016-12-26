unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    FIniIn,
    FIniOut: string;
    ListOut: TStringList;
    procedure FMove(const section: string; sectionOut: string = '');
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses IniFiles;

{$R *.dfm}


procedure TForm1.FMove(const section: string; sectionOut: string = '');
var
  IniIn, IniOut: TIniFile;
  L: TStringList;
begin
  if sectionOut='' then
    sectionOut:= section;

  IniIn:= TIniFile.Create(FIniIn);
  IniOut:= TIniFile.Create(FIniOut);
  L:= TStringList.Create;
  try
    {
    if IniOut.SectionExists(section) then
    begin
      ShowMessage('Section ['+section+'] already exists in target file:'#13+FIniOut);
      Exit;
    end;
    }
    if IniIn.SectionExists(section) then
    begin
      IniIn.ReadSectionValues(section, L);
      ListOut.Add('['+sectionOut+']');
      ListOut.AddStrings(L);
      IniIn.EraseSection(section);
      ListBox1.Items.Add('Section moved: ['+section+']');
    end
    else
      ListBox1.Items.Add('Section not exists, skipped: ['+section+']');
  finally
    FreeAndNil(L);
    FreeAndNil(IniIn);
    FreeAndNil(IniOut);
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FIniIn:= ExtractFilePath(Application.ExeName)+'Syn.ini';
  FIniOut:= ExtractFilePath(Application.ExeName)+'SynHistory.ini';
  ListOut:= TStringList.Create;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  if not FileExists(FIniIn) then
  begin
    ShowMessage('Error: Source file not found:'#13+FIniIn+
      #13#13'Run this updater from folder with file Syn.ini');
    Application.Terminate;
    Exit
  end;

  if FileExists(FIniOut) then
  begin
    ShowMessage('Error: Target file already exists:'#13+FIniOut);
    Application.Terminate;
    Exit
  end;

  FMove('Win');
  FMove('Search');
  FMove('SearchText');
  FMove('SearchTree');
  FMove('SearchTreeText');
  FMove('MRU');
  FMove('MRU_Sess');
  FMove('MRU_Newdoc');
  FMove('MRU_Proj');
  FMove('Extract');
  FMove('ExHist', 'ExtractHist');
  FMove('IncHist', 'FilesIncHist');
  FMove('ExcHist', 'FilesExcHist');
  FMove('DirHist', 'FilesDirHist');
  FMove('RHist', 'ReplaceHist');
  FMove('InsTxt');
  FMove('Ins_Ed1Hist');
  FMove('Ins_Ed2Hist');
  FMove('Ins_EdBeginHist');
  FMove('Ins_EdTailHist');
  FMove('Ins_EdStrHist');
  FMove('ExtToolParam');

  ListBox1.Items.Add('');

  if ListOut.Count>0 then
  begin
    ListOut.SaveToFile(FIniOut);
    ListBox1.Items.Add('Completed, new file SynHistory.ini created');
  end
  else
    ListBox1.Items.Add('Completed, no new ini created');
end;

end.
