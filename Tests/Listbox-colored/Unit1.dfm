object Form1: TForm1
  Left = 192
  Top = 114
  Width = 696
  Height = 480
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object List: TTntListBox
    Left = 104
    Top = 120
    Width = 145
    Height = 149
    Style = lbOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnDrawItem = ListDrawItem
  end
end
