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
  object Button1: TButton
    Left = 168
    Top = 224
    Width = 129
    Height = 25
    Caption = 'Init from Shell.dll'
    TabOrder = 0
    OnClick = Button1Click
  end
  object TBToolbar1: TTBToolbar
    Left = 40
    Top = 112
    Width = 273
    Height = 38
    Images = TBImageList1
    TabOrder = 1
    Caption = 'TBToolbar1'
    object TBXItem4: TTBXItem
      ImageIndex = 0
      OnClick = TBXItem4Click
      Caption = ''
      Hint = ''
    end
    object TBXItem3: TTBXItem
      ImageIndex = 1
      OnClick = TBXItem3Click
      Caption = ''
      Hint = ''
    end
    object TBXItem2: TTBXItem
      ImageIndex = 2
      OnClick = TBXItem2Click
      Caption = ''
      Hint = ''
    end
    object TBXItem1: TTBXItem
      ImageIndex = 3
      OnClick = TBXItem1Click
      Caption = ''
      Hint = ''
    end
    object TBXItem7: TTBXItem
      ImageIndex = 4
      Caption = ''
      Hint = ''
    end
    object TBXItem6: TTBXItem
      ImageIndex = 5
      Caption = ''
      Hint = ''
    end
    object TBXItem5: TTBXItem
      ImageIndex = 6
      Caption = ''
      Hint = ''
    end
  end
  object ListBox1: TListBox
    Left = 40
    Top = 156
    Width = 368
    Height = 61
    Style = lbOwnerDrawFixed
    Columns = 10
    ExtendedSelect = False
    ItemHeight = 36
    TabOrder = 2
    OnDrawItem = ListBox1DrawItem
    OnMeasureItem = ListBox1MeasureItem
  end
  object Button2: TButton
    Left = 168
    Top = 348
    Width = 75
    Height = 25
    Caption = 'Save'
    TabOrder = 3
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 168
    Top = 320
    Width = 75
    Height = 25
    Caption = 'bmp-png'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 168
    Top = 252
    Width = 129
    Height = 25
    Caption = 'Init from Theme.bmp'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 168
    Top = 280
    Width = 129
    Height = 25
    Caption = 'Init from Theme.png'
    TabOrder = 6
    OnClick = Button5Click
  end
  object TBToolbar2: TTBToolbar
    Left = 40
    Top = 68
    Width = 203
    Height = 28
    Images = TBXImageList1
    TabOrder = 7
    Caption = 'TBToolbar1'
    object TBXItem8: TTBXItem
      ImageIndex = 0
      OnClick = TBXItem4Click
      Caption = ''
      Hint = ''
    end
    object TBXItem9: TTBXItem
      ImageIndex = 1
      OnClick = TBXItem3Click
      Caption = ''
      Hint = ''
    end
    object TBXItem10: TTBXItem
      ImageIndex = 2
      OnClick = TBXItem2Click
      Caption = ''
      Hint = ''
    end
    object TBXItem11: TTBXItem
      ImageIndex = 3
      OnClick = TBXItem1Click
      Caption = ''
      Hint = ''
    end
    object TBXItem12: TTBXItem
      ImageIndex = 4
      Caption = ''
      Hint = ''
    end
    object TBXItem13: TTBXItem
      ImageIndex = 5
      Caption = ''
      Hint = ''
    end
    object TBXItem14: TTBXItem
      ImageIndex = 6
      Caption = ''
      Hint = ''
    end
  end
  object Button6: TButton
    Left = 304
    Top = 280
    Width = 121
    Height = 25
    Caption = 'Add png to imagelist'
    TabOrder = 8
    OnClick = Button6Click
  end
  object ImageList16: TImageList
    Left = 328
    Top = 96
  end
  object ImageList32: TImageList
    Height = 32
    Width = 32
    Left = 328
    Top = 124
  end
  object XPManifest1: TXPManifest
    Left = 448
    Top = 124
  end
  object TBImageList1: TTBImageList
    Height = 32
    Width = 32
    Left = 360
    Top = 124
  end
  object TBXImageList1: TTBXImageList
    Height = 22
    Width = 22
    Left = 392
    Top = 124
  end
end
