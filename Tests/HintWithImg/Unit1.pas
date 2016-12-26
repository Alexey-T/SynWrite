unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, AppEvnts;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ApplicationEvents1: TApplicationEvents;
    ListBox1: TListBox;
    Button5: TButton;
    Button6: TButton;
    procedure FormCreate(Sender: TObject);
    procedure ApplicationEvents1ShowHint(var HintStr: String;
      var CanShow: Boolean; var HintInfo: THintInfo);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses ATxImgHint;

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  FileNameConverterImageToBmp:= 'd:\s\tools\imagetobmp.exe';
  Listbox1.ItemIndex:= 0;
end;

procedure TForm1.ApplicationEvents1ShowHint(var HintStr: String;
  var CanShow: Boolean; var HintInfo: THintInfo);
begin
  if HintInfo.HintControl is TButton then
    HintInfo.HintWindowClass:= TGraphicHintWindow;
  if HintInfo.HintControl is TListbox then
  begin
    HintStr:= Listbox1.Items[Listbox1.ItemIndex];
    HintInfo.HintWindowClass:= TColorHintWindow;
  end;
end;

end.
