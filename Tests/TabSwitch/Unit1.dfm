object Form1: TForm1
  Left = 192
  Top = 279
  Width = 696
  Height = 315
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 520
    Top = 156
    Width = 49
    Height = 13
    Caption = '0..Count-1'
  end
  object PageControl1: TPageControl
    Left = 88
    Top = 56
    Width = 425
    Height = 193
    ActivePage = TabSheet5
    TabOrder = 0
    OnChange = PageControl1Change
    OnDragDrop = PageControl1DragDrop
    OnDragOver = PageControl1DragOver
    OnMouseDown = PageControl1MouseDown
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
    end
    object TabSheet4: TTabSheet
      Caption = 'TabSheet4'
      ImageIndex = 3
    end
    object TabSheet5: TTabSheet
      Caption = 'TabSheet5'
      ImageIndex = 4
    end
  end
  object Edit1: TEdit
    Left = 520
    Top = 132
    Width = 57
    Height = 21
    TabOrder = 1
  end
  object del: TButton
    Left = 584
    Top = 132
    Width = 75
    Height = 25
    Caption = 'Del'
    TabOrder = 2
    OnClick = delClick
  end
  object CheckBox1: TCheckBox
    Left = 520
    Top = 180
    Width = 97
    Height = 17
    Caption = 'En'
    TabOrder = 3
  end
end
