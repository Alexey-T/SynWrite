unit OfficeMoreColorsDialog;

{$define EXE}

interface

{$I mxs.inc}

uses
  Windows, Messages, SysUtils, {$IFDEF DELPHI_6_UP}Variants,{$ENDIF} Classes, Graphics, Controls, Forms,
  ComCtrls, HexaColorPicker, HSLColorPicker, StdCtrls, ExtCtrls, RGBHSLUtils,
  mbColorPreview, {$IFDEF mbXP_Lib}mbXPSpinEdit, mbXPSizeGrip,{$ELSE} Spin,{$ENDIF}
  HTMLColors, HSLRingPicker, mbColorPickerControl, HRingPicker, XPMan;

type
  TOfficeMoreColorsWin = class(TForm)
    Pages: TPageControl;
    Standard: TTabSheet;
    Custom: TTabSheet;
    Hexa: THexaColorPicker;
    TabSheet1: TTabSheet;
    CirclePicker: THSLRingPicker;
    XPManifest1: TXPManifest;
    Panel1: TPanel;
    Panel3: TPanel;
    btnOk: TButton;
    btnCopy: TButton;
    btnCancel: TButton;
    Label1: TLabel;
    Panel4: TPanel;
    Label4: TLabel;
    NewSwatch: TmbColorPreview;
    OldSwatch: TmbColorPreview;
    Label5: TLabel;
    Panel2: TPanel;
    cbWebSafe: TCheckBox;
    LRed: TLabel;
    LGreen: TLabel;
    LBlue: TLabel;
    Label6: TLabel;
    edHex: TEdit;
    edRed: TSpinEdit;
    edGreen: TSpinEdit;
    edBlue: TSpinEdit;
    PanelHSL: TPanel;
    HSL: THSLColorPicker;
    labH: TLabel;
    edH: TSpinEdit;
    labS: TLabel;
    edS: TSpinEdit;
    labL: TLabel;
    edL: TSpinEdit;
    procedure HSLChange(Sender: TObject);
    procedure ERedChange(Sender: TObject);
    procedure EGreenChange(Sender: TObject);
    procedure EBlueChange(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure HexaChange(Sender: TObject);
    procedure NewSwatchColorChange(Sender: TObject);
    procedure OldSwatchColorChange(Sender: TObject);
    function GetHint(c: TColor): string;
    procedure SetAllToSel(c: TColor);
    procedure PagesChange(Sender: TObject);
    procedure UpdHex;
    procedure UpdRGB;
    procedure UpdHSL;
    procedure FormShow(Sender: TObject);
    procedure cbWebSafeClick(Sender: TObject);
    procedure CirclePickerChange(Sender: TObject);
    procedure Label1Click(Sender: TObject);
    procedure btnCopyClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edHChange(Sender: TObject);
    procedure edSChange(Sender: TObject);
    procedure edLChange(Sender: TObject);
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
  private
    FLock: boolean;  
  end;

var
  OfficeMoreColorsWin: TOfficeMoreColorsWin;
  h, s, l: integer;

implementation

uses Clipbrd;

{$R *.dfm}

procedure TOfficeMoreColorsWin.CreateParams(var Params: TCreateParams);
begin 
  inherited CreateParams(Params); 
  Params.Style := WS_CAPTION or WS_SIZEBOX or WS_SYSMENU; 
  Params.ExStyle := WS_EX_DLGMODALFRAME or WS_EX_WINDOWEDGE; 
end; 

procedure TOfficeMoreColorsWin.CreateWnd;
begin 
  inherited CreateWnd; 
  SendMessage(Self.Handle, WM_SETICON, 1, 0); 
end;


procedure TOfficeMoreColorsWin.HSLChange(Sender: TObject);
begin
 if HSL.Manual then
 begin
   edRed.Value := HSL.RValue;
   edGreen.Value := HSL.GValue;
   edBlue.Value := HSL.BValue;
   NewSwatch.Color := HSL.SelectedColor;
   edH.Value := HSL.HValue;
   edS.Value := HSL.SValue;
   edL.Value := HSL.LValue;
   UpdHex;
 end; 
end;

procedure TOfficeMoreColorsWin.UpdHex;
begin
  edHex.Text := '#' + ColorToHex(NewSwatch.Color);
end;

procedure TOfficeMoreColorsWin.ERedChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.RValue := edRed.Value;
  NewSwatch.Color := RGB(edRed.Value, edGreen.Value, edBlue.Value);
  UpdHex;
  UpdHSL;
end;

procedure TOfficeMoreColorsWin.EGreenChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.GValue := edGreen.Value;
  NewSwatch.Color := RGB(edRed.Value, edGreen.Value, edBlue.Value);
  UpdHex;
  UpdHSL;
end;

procedure TOfficeMoreColorsWin.EBlueChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.BValue := edBlue.Value;
  NewSwatch.Color := RGB(edRed.Value, edGreen.Value, edBlue.Value);
  UpdHex;
  UpdHSL;
end;

procedure TOfficeMoreColorsWin.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_RETURN) then
  begin
    //ModalResult := mrOK;
    btnOk.Click;
    Key:= 0;
    Exit
  end;
  if (Key=VK_ESCAPE) then
  begin
    //ModalResult := mrCancel;
    btnCancel.Click;
    Key:= 0;
    Exit
  end;
  if (Key=Ord('C')) and (Shift=[ssCtrl]) then
  begin
    btnCopy.Click;
    Key:= 0;
    Exit
  end;
end;

procedure TOfficeMoreColorsWin.HexaChange(Sender: TObject);
begin
 NewSwatch.Color := Hexa.SelectedColor;
end;

function TOfficeMoreColorsWin.GetHint(c: TColor): string;
begin
 Result := Format('RGB(%u, %u, %u)'#13'Hex: %s',
   [GetRValue(c), GetGValue(c), GetBValue(c),
   ColorToHex(c)]);
end;

procedure TOfficeMoreColorsWin.NewSwatchColorChange(Sender: TObject);
begin
  NewSwatch.Hint := GetHint(NewSwatch.Color);
end;

procedure TOfficeMoreColorsWin.OldSwatchColorChange(Sender: TObject);
begin
  OldSwatch.Hint := GetHint(OldSwatch.Color);
  SetAllToSel(OldSwatch.Color);
end;

procedure TOfficeMoreColorsWin.SetAllToSel(c: TColor);
begin
 case Pages.ActivePageIndex of
  // Standard Page
  1: Hexa.SelectedColor := c;
  // Custom Page
  0:
   begin
    HSL.SelectedColor := c;
    edRed.Value := GetRValue(c);
    edGreen.Value := GetGValue(c);
    edBlue.Value := GetBValue(c);
    RGBtoHSLRange(c, h, s, l);
    edH.Value := h;
    edS.Value := s;
    edL.Value := l;
   end;
  2: //Circle
   begin
     CirclePicker.SelectedColor := c;
   end;
 end;
 NewSwatch.Color := c;
 UpdHex;
end;

procedure TOfficeMoreColorsWin.PagesChange(Sender: TObject);
begin
 SetAllToSel(NewSwatch.Color);
end;

procedure TOfficeMoreColorsWin.FormShow(Sender: TObject);
begin
  {$ifdef EXE}
  if ParamCount>0 then
  begin
    OldSwatch.Color:= StrToIntDef(ParamStr(1), clWhite);
    NewSwatch.Color:= OldSwatch.Color;
  end;
  {$endif}

  Hexa.SelectedColor:= OldSwatch.Color;
  HexaChange(Self);

  edH.MaxValue:= Pred(MaxHue);//AT
  edS.MaxValue:= 240;
  edL.MaxValue:= 240;

  Pages.ActivePageIndex:= 0; //debug
end;

procedure TOfficeMoreColorsWin.cbWebSafeClick(Sender: TObject);
begin
  HSL.WebSafe:= cbWebSafe.Checked;
end;

procedure TOfficeMoreColorsWin.CirclePickerChange(Sender: TObject);
begin
  NewSwatch.Color := CirclePicker.SelectedColor;
end;

procedure TOfficeMoreColorsWin.Label1Click(Sender: TObject);
const
  S = 'Color picker for SynWrite'#13+
    'based on mbColorLib'#13#13+
    '(c) UVViewSoft.com';
begin
  Application.MessageBox(S, 'About', mb_ok or mb_iconinformation);
end;

procedure TOfficeMoreColorsWin.btnCopyClick(Sender: TObject);
begin
  Clipboard.AsText:= '#' + ColorToHex(NewSwatch.Color);
  ModalResult:= mrCancel;
  Close;
end;

procedure TOfficeMoreColorsWin.btnOkClick(Sender: TObject);
begin
  ModalResult:= mrOk;
  Close;
end;

procedure TOfficeMoreColorsWin.btnCancelClick(Sender: TObject);
begin
  ModalResult:= mrCancel;
  Close;
end;

procedure TOfficeMoreColorsWin.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  N: Integer;
begin
  Action:= caFree;
  {$ifdef EXE}
  if ModalResult=mrOk then
    N:= NewSwatch.Color
  else
    N:= -1;
  Halt(N);
  {$endif}
end;

procedure TOfficeMoreColorsWin.edHChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.HValue := edH.Value;
  NewSwatch.Color := HSL.SelectedColor;
  UpdHex;
  UpdRGB;
end;

procedure TOfficeMoreColorsWin.edSChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.SValue := edS.Value;
  NewSwatch.Color := HSL.SelectedColor;
  UpdHex;
  UpdRGB;
end;

procedure TOfficeMoreColorsWin.edLChange(Sender: TObject);
begin
  if FLock then Exit;
  HSL.LValue := edL.Value;
  NewSwatch.Color := HSL.SelectedColor;
  UpdHex;
  UpdRGB;
end;

procedure TOfficeMoreColorsWin.UpdRGB;
begin
  FLock:= true;
  edRed.Value := GetRValue(NewSwatch.Color);
  edGreen.Value := GetGValue(NewSwatch.Color);
  edBlue.Value := GetBValue(NewSwatch.Color);
  FLock:= false;
end;

procedure TOfficeMoreColorsWin.UpdHSL;
var
  h, s, l: Integer;
begin
  FLock:= true;
  RGBtoHSLRange(NewSwatch.Color, h, s, l);
  edH.Value := h;
  edS.Value := s;
  edL.Value := l;
  FLock:= false;
end;

end.
