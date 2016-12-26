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
  object TreeView2: TTreeView
    Left = 32
    Top = 144
    Width = 169
    Height = 157
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    HideSelection = False
    Indent = 19
    ParentFont = False
    TabOrder = 0
    OnAdvancedCustomDrawItem = TreeView2AdvancedCustomDrawItem
    OnKeyDown = TreeView2KeyDown
    OnKeyPress = TreeView2KeyPress
    Items.Data = {
      03000000220000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      09747474747474747474210000000000000000000000FFFFFFFFFFFFFFFF0000
      0000010000000874747474747474741C0000000000000000000000FFFFFFFFFF
      FFFFFF0000000000000000036464641B0000000000000000000000FFFFFFFFFF
      FFFFFF00000000000000000264641C0000000000000000000000FFFFFFFFFFFF
      FFFF0000000001000000037474321B0000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000232321C0000000000000000000000FFFFFFFFFFFFFF
      FF000000000000000003747433240000000000000000000000FFFFFFFFFFFFFF
      FF00000000000000000B74747474747474747474742000000000000000000000
      00FFFFFFFFFFFFFFFF000000000100000007777777777777771C000000000000
      0000000000FFFFFFFFFFFFFFFF000000000000000003646464}
  end
  object Button1: TButton
    Left = 208
    Top = 248
    Width = 75
    Height = 25
    Caption = 'Prev'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 208
    Top = 276
    Width = 75
    Height = 25
    Caption = 'Next'
    TabOrder = 2
    OnClick = Button2Click
  end
  object TreeView1: TTreeView
    Left = 336
    Top = 100
    Width = 201
    Height = 217
    Indent = 19
    TabOrder = 3
  end
  object Button3: TButton
    Left = 464
    Top = 292
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 4
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 208
    Top = 308
    Width = 75
    Height = 25
    Caption = 'parent'
    TabOrder = 5
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 208
    Top = 336
    Width = 75
    Height = 25
    Caption = 'broth'
    TabOrder = 6
    OnClick = Button5Click
  end
end
