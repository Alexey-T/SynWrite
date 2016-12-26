unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TTntListBox;
    Button1: TButton;
    edDir: TTntEdit;
    edInc: TTntEdit;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    bR: TTntCheckBox;
    bRO: TCheckBox;
    bHid: TCheckBox;
    bHid2: TCheckBox;
    Button2: TButton;
    TntLabel3: TTntLabel;
    edExc: TTntEdit;
    TntLabel4: TTntLabel;
    edDir2: TTntEdit;
    TntLabel5: TTntLabel;
    edExc2: TTntEdit;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses TntSysUtils, TntClasses, atxSProc,atxFProc;

{$R *.dfm}



procedure TForm1.FormCreate(Sender: TObject);
const c='*Proc*.p?? *Text*.pas';
  d='c:\Prog';
begin
  edDir.text:= 'd:\s';
  edInc.Text:= 's*.*';
  edExc.Text:= '*Syn*\';
  bR.Checked:= True;
  //Button1Click(Self);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  s: TTntStringList;
begin
  S:= TTntStringList.Create;
  FFindToList(S, edDir.Text, edInc.Text, edExc.Text, bR.Checked,
    bRO.Checked, bHid.Checked, bHid2.Checked);
  Listbox1.Items.Clear;
  Listbox1.Items.AddStrings(S);
  S.Free;
end;


//======
procedure TForm1.Button2Click(Sender: TObject);
var
  b: boolean;
begin
  b:= FFilenameMatchesMaskList(edDir.Text, edInc.Text, false);
  if b then
    Caption:= 'dir matches Inc mask' else Caption:= 'dir doesn''t match Inc mask';
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  b: boolean;
begin
  b:= FFilenameMatchesMaskList(edDir2.Text, edExc2.Text, true);
  if b then
    Caption:= 'dir matches Exc mask' else Caption:= 'dir doesn''t match Exc mask';
end;

end.
