program Project1;

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  unSearchInList in 'D:\S\unSearchInList.pas',
  unSRTree in 'D:\S\unSRTree.pas' {fmSRTree: TTntForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
