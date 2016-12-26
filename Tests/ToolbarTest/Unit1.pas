unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, XPMan, TntClasses;

type
  TForm1 = class(TForm)
    Button1: TButton;
    XPManifest1: TXPManifest;
    Button2: TButton;
    Edit1: TEdit;
    Button3: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    function ShowCmdList: string;
    function ShowCmdHint(Cmd: string): Widestring;
    procedure GetTools(L: TTntStringList);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
atxIconProc,
atxFProc,
unToolbarIcon,
unToolbarProp, UnitCmd;

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  fn_png: string;
begin
  fn_png:= 'd:\t\1.png';
  with TfmToolbarIcon.Create(nil) do
  try
    FSizeX:= 32;
    FSizeY:= 32;
    if (ShowModal=mrOk) and Assigned(FImage) then
    begin
      FImage.SaveToFile(fn_png);
      FOpenURL(fn_png, Handle);
    end;
  finally
    Free
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  with TfmToolbarProp.Create(nil) do
  try
    FSizeX:= 32;
    FSizeY:= 32;
    FToolbarIni:= Edit1.Text;
    FToolbarIndex:= 2;
    FShowCmdList:= ShowCmdList;
    FShowCmdHint:= ShowCmdHint;
    FGetExtTools:= GetTools;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  FOpenURL(edit1.text, Handle);
end;

function TForm1.ShowCmdList: string;
begin
  with TForm2.Create(nil) do
  try
    Result:= 'cm:'+IntToStr(ShowModal);
  finally
    free
  end;
end;


function TForm1.ShowCmdHint(Cmd: string): Widestring;
begin
  Result:= Cmd;
  if Pos('cm:', Result)=1 then
  begin
    Delete(Result, 1, 3);
    Result:= 'Hint_'+Result;
  end;
end;

procedure TForm1.GetTools(L: TTntStringList);
begin
  L.Add('Tool1');
  L.Add('Tool__');
  L.Add('ToolN');
end;

end.
