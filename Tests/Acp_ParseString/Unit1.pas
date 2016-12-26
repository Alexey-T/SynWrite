unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    ListBox2: TListBox;
    Memo1: TMemo;
    edType: TEdit;
    edId: TEdit;
    edPar: TEdit;
    edHint: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edAcpStr: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure edAcpStrChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  unProc, ATxSProc,
  ecStrUtils;

{$R *.dfm}

const
  AcpStr = 'caption=align<bottom?left?right?top|class|dir<ltr?rtl|id|lang|onclick|ondblclick|onkeydown|onkeypress|onkeyup|onmousedown|onmousemove|onmouseout|onmouseover|onmouseup|style|title';
  Atr = 'align';

  AcpStdStr1 = 'function WrapText(const Line, BreakStr: string; nBreakChars: TSysCharSet; MaxCol: Integer): string |Returns ....';
  AcpStdStr2 = 'procedure WriteComponentResFile(const FileName: string; Instance: TComponent) |Writes components';


procedure TForm1.FormCreate(Sender: TObject);
var
  L: TStringList;
begin
  //if IsSpaceChar(' ') then caption:= 'y' else caption:= 'n';

  Memo1.Lines.Text:= AcpStr;
  L:= TStringList.Create;

  SParseString_AcpHtml(AcpStr, '', L);
  Listbox1.Items.AddStrings(L);

  SParseString_AcpHtml(AcpStr, Atr, L);
  Listbox2.Items.AddStrings(L);

  FreeAndNil(L);

  //-----------------------
  edAcpStr.Text:= AcpStdStr1;
  edAcpStrChange(Self);
end;

procedure TForm1.ListBox1Click(Sender: TObject);
var
  L: TStringList;
begin
  L:= TStringList.Create;

  SParseString_AcpHtml(AcpStr, Listbox1.Items[Listbox1.ItemIndex], L);
  Listbox2.Items.Clear;
  Listbox2.Items.AddStrings(L);

  FreeAndNil(L);
end;

procedure TForm1.edAcpStrChange(Sender: TObject);
var
  sId, sType, sPar, sHint: string;
begin
  SParseString_AcpStd(edAcpStr.Text, true, sType, sId, sPar, sHint);
  edType.Text:= sType;
  edId.Text:= sId;
  edPar.Text:= sPar;
  edHint.Text:= sHint;
end;

end.
