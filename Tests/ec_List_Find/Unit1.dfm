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
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 104
    Top = 116
    Width = 297
    Height = 117
    ItemHeight = 13
    Items.Strings = (
      'dd ddddd ddd'
      'dd ddd'
      '12+34'
      '12'
      'dd'
      'dd'
      '+'
      '12'
      '')
    TabOrder = 0
  end
  object Button1: TButton
    Left = 136
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Find...'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 216
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Next'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 296
    Top = 240
    Width = 75
    Height = 25
    Caption = 'Prev'
    TabOrder = 3
    OnClick = Button3Click
  end
end
