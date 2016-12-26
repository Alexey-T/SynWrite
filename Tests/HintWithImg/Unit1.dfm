object Form1: TForm1
  Left = 185
  Top = 468
  Width = 870
  Height = 302
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 184
    Top = 208
    Width = 75
    Height = 25
    Hint = 'c:\ProgView\Help\ATBinHex\ModeText.gif'
    Caption = 'gif'
    TabOrder = 0
  end
  object Button2: TButton
    Left = 264
    Top = 208
    Width = 75
    Height = 25
    Hint = 'D:\Work\Demo\Images\Big\fantasy_10.jpg'
    Caption = 'jpg'
    TabOrder = 1
  end
  object Button3: TButton
    Left = 344
    Top = 208
    Width = 75
    Height = 25
    Hint = 'D:\Work\Demo\Images\forum.png'
    Caption = 'png'
    TabOrder = 2
  end
  object Button4: TButton
    Left = 424
    Top = 204
    Width = 75
    Height = 25
    Hint = 'd:\Work\Demo\Images\small.bmp'
    Caption = 'bmp small'
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 520
    Top = 56
    Width = 121
    Height = 149
    Hint = '#00ffff'
    ItemHeight = 13
    Items.Strings = (
      '255'
      '255255,255'
      'ade,fff'
      'abc,zz')
    TabOrder = 4
  end
  object Button5: TButton
    Left = 504
    Top = 204
    Width = 75
    Height = 25
    Hint = 'D:\Work\Demo\Images\img too vertical.png'
    Caption = 'png small'
    TabOrder = 5
  end
  object Button6: TButton
    Left = 584
    Top = 204
    Width = 75
    Height = 25
    Hint = 'd:\Work\Demo\Images\logo.gif'
    Caption = 'gif HQ'
    TabOrder = 6
  end
  object ApplicationEvents1: TApplicationEvents
    OnShowHint = ApplicationEvents1ShowHint
    Left = 472
    Top = 152
  end
end
