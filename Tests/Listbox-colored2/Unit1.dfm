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
  DesignSize = (
    688
    446)
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 224
    Top = 164
    Width = 121
    Height = 89
    Style = lbOwnerDrawFixed
    Anchors = [akLeft, akTop, akRight]
    ItemHeight = 16
    Items.Strings = (
      'ww'
      'www'
      'ww'
      
        'wwwwwwwwwwwwwwwwwwwwwwwwwww wwwwwwwwwwwwwwwwwwwwwwwwww wwwwwwwww' +
        'wwwwwwwww wwwwwwwwwwwwwwwwwwwwwwwwwww wwwwwwwwwwwwwwwwwwwwwwwwww' +
        'w wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww wwwwwwwwwwwwwwwwwwwwwww' +
        'wwwwwwwwwwwwwww'
      'www'
      ''
      'ww'
      'ww')
    MultiSelect = True
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    OnDrawItem = ListBox1DrawItem
    OnMouseDown = ListBox1MouseDown
    OnMouseMove = ListBox1MouseMove
  end
end
