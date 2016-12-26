unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ecSyntMemo, StdCtrls, ecSyntAnal, ecKeyMap, ComCtrls;

type
  TForm1 = class(TForm)
    ed: TSyntaxMemo;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    man: TSyntaxManager;
    SyntKeyMapping1: TSyntKeyMapping;
    edTime: TTrackBar;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edTimeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  man.LoadFromFile('d:\s\hl\Lexlib.lxl');
  ed.SyntaxAnalyzer:= man.AnalyzerForFile('a.php');

  ed.Lines.Clear;
  ed.Lines.Add('    aaaaaaa aaaaaa  aaaa');
  ed.Lines.Add(#9'indent indent');
  ed.Lines.Add(#9#9'indent indent');
  ed.Lines.Add(#9#9'  indent indent');

  ed.Lines.Add('<?php');
  ed.Lines.Add('//ddddddd');
  ed.Lines.Add('ddd');

  CheckBox1Click(Self);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  with ed do
    NonPrinted.Visible:= not NonPrinted.Visible;
end;

procedure TForm1.CheckBox2Click(Sender: TObject);
begin
  with ed do
  begin
    NonPrintedSpaces:= not NonPrintedSpaces;
    Invalidate;
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  with ed do
  begin
    NonPrintedEol:= not NonPrintedEol;
    Invalidate;
  end;
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  with ed do
  begin
    NonPrintedEolDetails:= not NonPrintedEolDetails;
    Invalidate;
  end;
end;

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_tab) and (Shift=[ssCtrl]) then Caption:= 'Ctrl+Tab'
  else
  if (key=vk_tab) and (Shift=[]) then Caption:= 'Tab'
  else
    Caption:= '';
end;

procedure TForm1.edTimeChange(Sender: TObject);
begin
  ed.Caret.Insert.BlinkTime:= edTime.Position;
end;

end.
