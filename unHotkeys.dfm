object fmHotkeys: TfmHotkeys
  Left = 399
  Top = 455
  BorderStyle = bsDialog
  Caption = 'Hotkeys'
  ClientHeight = 191
  ClientWidth = 369
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object labelInfo1: TTntLabel
    Left = 8
    Top = 16
    Width = 10
    Height = 13
    Caption = '1)'
  end
  object labelInfo2: TTntLabel
    Left = 8
    Top = 80
    Width = 10
    Height = 13
    Caption = '2)'
  end
  object btnOk: TTntButton
    Left = 176
    Top = 160
    Width = 91
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TTntButton
    Left = 272
    Top = 160
    Width = 91
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object btnClear1: TTntButton
    Left = 32
    Top = 40
    Width = 113
    Height = 23
    Caption = '&Clear'
    TabOrder = 0
  end
  object btnAdd1: TTntButton
    Left = 152
    Top = 40
    Width = 113
    Height = 23
    Caption = '&Add key'
    TabOrder = 1
  end
  object btnClear2: TTntButton
    Left = 32
    Top = 104
    Width = 113
    Height = 23
    Caption = 'Cl&ear'
    TabOrder = 2
  end
  object btnAdd2: TTntButton
    Left = 152
    Top = 104
    Width = 113
    Height = 23
    Caption = 'A&dd key'
    TabOrder = 3
  end
end
