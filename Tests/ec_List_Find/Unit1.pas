unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ecSyntDlg,
  unSearchInList;

type
  TForm1 = class(TForm)
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    f: TFinderInList;
    procedure NotFnd(Sender: TObject);
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  f:= TFinderInList.Create(Self);
  f.IniFN:= 'd:\t\ini.ini';
  f.Control:= Listbox1;
  f.OnNotFound:= NotFnd;
  Listbox1.ItemIndex:= 0;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  f.Execute;
end;

procedure TForm1.NotFnd(Sender: TObject);
begin
  with (Sender as TecFindInListDialog) do
    ShowMessage('Not found: '+FindText);
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=Ord('F')) and (Shift=[ssCtrl]) then
  begin button1.Click; Key:= 0; Exit end;
  if (key=VK_F3) and (Shift=[]) then
  begin button2.Click; Key:= 0; Exit end;
  if (key=VK_F3) and (Shift=[ssCtrl]) then
  begin button3.Click; Key:= 0; Exit end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if f.FindText<>'' then f.FindNext
  else Button1.Click;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if f.FindText<>'' then f.FindPrev
  else Button1.Click;
end;

end.
