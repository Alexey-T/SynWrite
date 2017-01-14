{ *************************************************************************** }
{                                                                             }
{ EControl Syntax Editor SDK                                                  }
{                                                                             }
{ Copyright (c) 2004 - 2008 EControl Ltd., Zaharov Michael                    }
{     www.econtrol.ru                                                         }
{     support@econtrol.ru                                                     }
{                                                                             }
{ *************************************************************************** }
// Changed for SynWrite by Alexey T (SynWrite)

unit unLexerPropStyles;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms,
  StdCtrls, ExtCtrls,
  ecSyntAnal,
  TntStdCtrls,
  unColorBox, Dialogs{custom TColorBox};

type
  TfmLexerPropStyles = class(TFrame)
    Label2: TTntLabel;
    Label3: TTntLabel;
    ColorBox1: TColorBox;
    Button3: TTntButton;
    ColorBox2: TColorBox;
    GroupBox1: TTntGroupBox;
    CheckBox2: TTntCheckBox;
    CheckBox3: TTntCheckBox;
    CheckBox4: TTntCheckBox;
    CheckBox5: TTntCheckBox;
    Label1: TTntLabel;
    ComboBox1: TTntComboBox;
    Label4: TTntLabel;
    ComboBox2: TTntComboBox;
    FontDialog1: TFontDialog;
    CheckBox1: TTntCheckBox;
    GroupBox2: TTntGroupBox;
    ColorBox3: TColorBox;
    ComboBox3: TTntComboBox;
    Label5: TTntLabel;
    ColorBox4: TColorBox;
    ComboBox4: TTntComboBox;
    Label6: TTntLabel;
    ColorBox5: TColorBox;
    ComboBox5: TTntComboBox;
    Label7: TTntLabel;
    ColorBox6: TColorBox;
    ComboBox6: TTntComboBox;
    Label8: TTntLabel;
    CheckBox6: TTntCheckBox;
    CheckBox7: TTntCheckBox;
    Label9: TTntLabel;
    ComboBox7: TTntComboBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox2Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox3DrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure ComboBox3Change(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
  private
    FSelfChange: Boolean;
    FStyle: TSyntaxFormat;
    procedure SetStyle(const Value: TSyntaxFormat);
    procedure SetControls;
    procedure SetEnabling;
    procedure UpdateFlags;
  public
    FullEdit: Boolean;
    DisableStyle: Boolean;
    constructor Create(AOwner: TComponent); override;
    property Style: TSyntaxFormat read FStyle write SetStyle;
  protected
    procedure PaintWindow(DC: HDC); override; //AT
  end;

procedure SetColorBox(ColorBox: TColorBox; Color: TColor);

implementation

{$R *.dfm}

procedure SetColorBox(ColorBox: TColorBox; Color: TColor);
var idx: integer;
begin
  ColorBox.Items.Objects[0] := TObject($00010101);
  idx := ColorBox.ItemIndex;
  ColorBox.Selected := Color;
  if idx = ColorBox.ItemIndex then
    ColorBox.Invalidate;
end;

{ TfmLexerPropStyles }

constructor TfmLexerPropStyles.Create(AOwner: TComponent);
begin
  inherited;
  FullEdit := False;
  SetControls;
  
  //for Delphi7, add "none"
  ColorBox1.AddItem('(None)', TObject(clNone));
  ColorBox2.AddItem('(None)', TObject(clNone));
end;

procedure TfmLexerPropStyles.PaintWindow(DC: HDC);
begin
  if DC = 0 then inherited;
end; //AT Mantis

procedure TfmLexerPropStyles.SetStyle(const Value: TSyntaxFormat);
begin
  FStyle := Value;
  SetControls;
end;

procedure TfmLexerPropStyles.SetControls;
  procedure SetCheck(C: TTntCheckBox; en, s: Boolean);
  begin
    if not en then
      C.State := cbGrayed else
    if s then
      C.State := cbChecked else
      C.State := cbUnchecked;
  end;
begin
  ComboBox1.Visible := not FullEdit;
  Label1.Visible := not FullEdit;
  if FStyle <> nil then
   with FStyle do
   begin
     FSelfChange := True;

     SetColorBox(ColorBox1, BgColor);
     SetColorBox(ColorBox2, Font.Color);

     SetCheck(CheckBox2, ffBold in FormatFlags, fsBold in Font.Style);
     SetCheck(CheckBox3, ffItalic in FormatFlags, fsItalic in Font.Style);
     SetCheck(CheckBox4, ffUnderline in FormatFlags, fsUnderline in Font.Style);
     SetCheck(CheckBox5, ffStrikeout in FormatFlags, fsStrikeout in Font.Style);
     SetCheck(CheckBox1, ffHidden in FormatFlags, Hidden);
     SetCheck(CheckBox7, ffReadOnly in FormatFlags, ReadOnly);

     CheckBox6.Checked := MultiLineBorder;
     ComboBox1.ItemIndex := integer(FormatType);
     ComboBox2.ItemIndex := integer(VertAlignment);

     ComboBox3.ItemIndex := integer(BorderTypes[0]);
     ComboBox4.ItemIndex := integer(BorderTypes[1]);
     ComboBox5.ItemIndex := integer(BorderTypes[2]);
     ComboBox6.ItemIndex := integer(BorderTypes[3]);

     SetColorBox(ColorBox3, BorderColors[0]);
     SetColorBox(ColorBox4, BorderColors[1]);
     SetColorBox(ColorBox5, BorderColors[2]);
     SetColorBox(ColorBox6, BorderColors[3]);

     ComboBox7.ItemIndex := integer(ChangeCase);

     FSelfChange := False;
   end;
  SetEnabling;
end;

procedure TfmLexerPropStyles.SetEnabling;
var b: Boolean;
  function GetColor: TColor;
  begin
    if b then Result := clWindow
     else Result := Color;
  end;
begin
  b := FStyle <> nil;
  Label1.Enabled := b;
  ComboBox1.Enabled := b and not DisableStyle;
  ComboBox1.Color := GetColor;
  Label2.Enabled := b;
  ColorBox1.Enabled := b;
  ColorBox1.Color := GetColor;

  b := b and ((FStyle.FormatType <> ftBackGround) or FullEdit);
  Label3.Enabled := b;
  ColorBox2.Enabled := b;
  ColorBox2.Color := GetColor;

  b := b and ((FStyle.FormatType <> ftColor) or FullEdit);
  Label4.Enabled := b;
  ComboBox2.Enabled := b;
  ComboBox2.Color := GetColor;
  CheckBox2.Enabled := b;
  CheckBox3.Enabled := b;
  CheckBox4.Enabled := b;
  CheckBox5.Enabled := b;

  b := b and ((FStyle.FormatType = ftCustomFont) or FullEdit);
  Button3.Enabled := b;
end;

procedure TfmLexerPropStyles.ComboBox1Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.FormatType := TFormatType(ComboBox1.ItemIndex);
  if FStyle.FormatType = ftCustomFont then
    FStyle.FormatFlags := FStyle.FormatFlags + [ffFontName, ffFontSize, ffFontCharset, ffVertAlign];
  SetEnabling;
end;

procedure TfmLexerPropStyles.ComboBox2Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.VertAlignment := TVertAlignment(ComboBox2.ItemIndex);
end;

procedure TfmLexerPropStyles.ColorBox1Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.BgColor := ColorBox1.Selected;
end;

procedure TfmLexerPropStyles.ColorBox2Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.Font.Color := ColorBox2.Selected;
end;

procedure TfmLexerPropStyles.UpdateFlags;
var fs: TFormatFlags;
begin
  fs := FStyle.FormatFlags - [ffBold, ffItalic, ffUnderline, ffStrikeOut, ffReadOnly, ffHidden];
  if CheckBox2.State <> cbGrayed then Include(fs, ffBold);
  if CheckBox3.State <> cbGrayed then Include(fs, ffItalic);
  if CheckBox4.State <> cbGrayed then Include(fs, ffUnderline);
  if CheckBox5.State <> cbGrayed then Include(fs, ffStrikeOut);
  if CheckBox1.State <> cbGrayed then Include(fs, ffHidden);
  if CheckBox7.State <> cbGrayed then Include(fs, ffReadOnly);
  FStyle.FormatFlags := fs;
end;

procedure TfmLexerPropStyles.CheckBox2Click(Sender: TObject);
var fs: TFontStyles;
begin
  if FSelfChange or (FStyle = nil) then Exit;
  fs := [];
  if CheckBox2.Checked then Include(fs, fsBold);
  if CheckBox3.Checked then Include(fs, fsItalic);
  if CheckBox4.Checked then Include(fs, fsUnderline);
  if CheckBox5.Checked then Include(fs, fsStrikeout);
  FStyle.Font.Style := fs;
  UpdateFlags;
end;

procedure TfmLexerPropStyles.CheckBox1Click(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.Hidden := CheckBox1.Checked;
  UpdateFlags;
end;

procedure TfmLexerPropStyles.CheckBox7Click(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.ReadOnly := CheckBox7.Checked;
  UpdateFlags;
end;

procedure TfmLexerPropStyles.Button3Click(Sender: TObject);
begin
  if FStyle = nil then Exit;
  FontDialog1.Font := FStyle.Font;
  if FontDialog1.Execute then
   begin
    FStyle.Font := FontDialog1.Font;
    SetControls;
   end;
end;

procedure TfmLexerPropStyles.ComboBox3DrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
var y: integer;
begin
  y := (Rect.Top + Rect.Bottom) div 2;
  with TComboBox(Control) do
   begin
     Canvas.FillRect(Rect);
     Canvas.Pen.Color := Canvas.Font.Color;
     DrawBorder(Canvas, TBorderLineType(Index), Point(Rect.Left + 2, y), Point(Rect.Right - 2, y));
   end;
end;

procedure TfmLexerPropStyles.ComboBox3Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  if Sender is TCombobox then
    with Sender as TComboBox do
      FStyle.BorderTypes[Tag] := TBorderLineType(ItemIndex);
  if Sender is TTntCombobox then
    with Sender as TTntComboBox do
      FStyle.BorderTypes[Tag] := TBorderLineType(ItemIndex);
end;

procedure TfmLexerPropStyles.ColorBox3Change(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  with Sender as TColorBox do
   FStyle.BorderColors[Tag] := Selected;
end;

procedure TfmLexerPropStyles.CheckBox6Click(Sender: TObject);
begin
  if FSelfChange or (FStyle = nil) then Exit;
  FStyle.MultiLineBorder := CheckBox6.Checked;
end;

procedure TfmLexerPropStyles.ComboBox7Change(Sender: TObject);
begin
//  if FSelfChange or (FStyle = nil) then Exit;
//  FStyle.ChangeCase := TChangeCase(ComboBox7.ItemIndex);
end;

end.
