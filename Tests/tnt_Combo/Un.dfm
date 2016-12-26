object Form1: TForm1
  Left = 192
  Top = 124
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
  object TntComboBox1: TTntComboBox
    Left = 232
    Top = 496
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Text = 'TntComboBox1'
  end
  object ComboBox1: TComboBox
    Left = 240
    Top = 464
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Text = 'ComboBox1'
    OnKeyPress = ComboBox1KeyPress
  end
end
