object Form1: TForm1
  Left = 161
  Top = 224
  Width = 772
  Height = 506
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
  object Label1: TLabel
    Left = 16
    Top = 368
    Width = 22
    Height = 13
    Caption = 'type'
  end
  object Label2: TLabel
    Left = 16
    Top = 392
    Width = 8
    Height = 13
    Caption = 'id'
  end
  object Label3: TLabel
    Left = 16
    Top = 416
    Width = 35
    Height = 13
    Caption = 'params'
  end
  object Label4: TLabel
    Left = 16
    Top = 440
    Width = 18
    Height = 13
    Caption = 'hint'
  end
  object ListBox1: TListBox
    Left = 456
    Top = 20
    Width = 137
    Height = 305
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object ListBox2: TListBox
    Left = 600
    Top = 20
    Width = 137
    Height = 305
    ItemHeight = 13
    TabOrder = 1
  end
  object Memo1: TMemo
    Left = 16
    Top = 20
    Width = 433
    Height = 101
    Lines.Strings = (
      'Memo1')
    TabOrder = 2
  end
  object edType: TEdit
    Left = 64
    Top = 364
    Width = 650
    Height = 21
    TabOrder = 3
  end
  object edId: TEdit
    Left = 64
    Top = 388
    Width = 650
    Height = 21
    TabOrder = 4
  end
  object edPar: TEdit
    Left = 64
    Top = 412
    Width = 650
    Height = 21
    TabOrder = 5
  end
  object edHint: TEdit
    Left = 64
    Top = 436
    Width = 650
    Height = 21
    TabOrder = 6
  end
  object edAcpStr: TEdit
    Left = 64
    Top = 340
    Width = 650
    Height = 21
    TabOrder = 7
    OnChange = edAcpStrChange
  end
end
