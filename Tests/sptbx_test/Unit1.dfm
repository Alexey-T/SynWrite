object Form1: TForm1
  Left = 221
  Top = 209
  Width = 870
  Height = 640
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object SpTBXToolbar1: TSpTBXToolbar
    Left = 0
    Top = 0
    Width = 38
    Height = 21
    TabOrder = 0
    Caption = 'SpTBXToolbar1'
    object SpTBXSubmenuItem1: TSpTBXSubmenuItem
      Caption = 'TTTT'
      object tab: TSpTBXToolPalette
        Caption = 'TTT'
        ColCount = 10
        RowCount = 10
        OnDrawCellImage = tabDrawCellImage
      end
    end
  end
end
