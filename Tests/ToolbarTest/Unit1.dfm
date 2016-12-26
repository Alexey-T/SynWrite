object Form1: TForm1
  Left = 192
  Top = 379
  Width = 870
  Height = 375
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 160
    Top = 96
    Width = 75
    Height = 25
    Caption = 'ico'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 124
    Width = 75
    Height = 25
    Caption = 'bar'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Edit1: TEdit
    Left = 160
    Top = 156
    Width = 281
    Height = 21
    TabOrder = 2
    Text = 'd:\t\Toolbar.ini'
  end
  object Button3: TButton
    Left = 448
    Top = 156
    Width = 75
    Height = 25
    Caption = 'edit'
    TabOrder = 3
    OnClick = Button3Click
  end
  object XPManifest1: TXPManifest
    Left = 296
    Top = 76
  end
end
