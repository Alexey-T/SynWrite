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
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 48
    Top = 120
    Width = 73
    Height = 13
    Caption = 'mask(s) include'
  end
  object TntLabel2: TTntLabel
    Left = 48
    Top = 84
    Width = 12
    Height = 13
    Caption = 'dir'
  end
  object TntLabel3: TTntLabel
    Left = 48
    Top = 160
    Width = 77
    Height = 13
    Caption = 'mask(s) exclude'
  end
  object TntLabel4: TTntLabel
    Left = 48
    Top = 356
    Width = 12
    Height = 13
    Caption = 'dir'
  end
  object TntLabel5: TTntLabel
    Left = 48
    Top = 400
    Width = 77
    Height = 13
    Caption = 'mask(s) exclude'
  end
  object ListBox1: TTntListBox
    Left = 296
    Top = 88
    Width = 281
    Height = 345
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 184
    Top = 244
    Width = 89
    Height = 25
    Caption = 'Go'
    TabOrder = 1
    OnClick = Button1Click
  end
  object edDir: TTntEdit
    Left = 48
    Top = 96
    Width = 225
    Height = 21
    TabOrder = 2
    Text = 'ftext.txt'
  end
  object edInc: TTntEdit
    Left = 48
    Top = 132
    Width = 225
    Height = 21
    TabOrder = 3
    Text = 'f*.txt text.t?? *ex*.nfo'
  end
  object bR: TTntCheckBox
    Left = 48
    Top = 204
    Width = 97
    Height = 17
    Caption = 'recurs'
    TabOrder = 5
  end
  object bRO: TCheckBox
    Left = 48
    Top = 220
    Width = 97
    Height = 17
    Caption = 'no r/o files'
    TabOrder = 6
  end
  object bHid: TCheckBox
    Left = 48
    Top = 236
    Width = 97
    Height = 17
    Caption = 'no hid files'
    TabOrder = 7
  end
  object bHid2: TCheckBox
    Left = 48
    Top = 252
    Width = 97
    Height = 17
    Caption = 'no hid folders'
    TabOrder = 8
  end
  object Button2: TButton
    Left = 200
    Top = 148
    Width = 75
    Height = 25
    Caption = 'check mask'
    TabOrder = 9
    OnClick = Button2Click
  end
  object edExc: TTntEdit
    Left = 48
    Top = 172
    Width = 225
    Height = 21
    TabOrder = 4
  end
  object edDir2: TTntEdit
    Left = 48
    Top = 368
    Width = 225
    Height = 21
    TabOrder = 10
    Text = 'c:\path\path2\cfd'
  end
  object edExc2: TTntEdit
    Left = 48
    Top = 412
    Width = 225
    Height = 21
    TabOrder = 11
    Text = 'cfd\'
  end
  object Button3: TButton
    Left = 160
    Top = 388
    Width = 115
    Height = 25
    Caption = 'check dir exclude mask'
    TabOrder = 12
    OnClick = Button3Click
  end
end
