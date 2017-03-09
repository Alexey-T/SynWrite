object fmHotkeys: TfmHotkeys
  Left = 399
  Top = 455
  BorderStyle = bsDialog
  Caption = 'Hotkeys'
  ClientHeight = 207
  ClientWidth = 412
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = TntFormCreate
  OnDestroy = TntFormDestroy
  OnKeyDown = TntFormKeyDown
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labelInfo1: TTntLabel
    Left = 8
    Top = 8
    Width = 10
    Height = 13
    Caption = '1)'
  end
  object labelInfo2: TTntLabel
    Left = 8
    Top = 88
    Width = 10
    Height = 13
    Caption = '2)'
  end
  object btnOk: TTntButton
    Left = 216
    Top = 176
    Width = 91
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 5
  end
  object btnCancel: TTntButton
    Left = 312
    Top = 176
    Width = 91
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object btnClear1: TTntButton
    Left = 56
    Top = 32
    Width = 121
    Height = 23
    Caption = 'Clear'
    TabOrder = 0
    OnClick = btnClear1Click
  end
  object btnAdd1: TTntButton
    Left = 184
    Top = 32
    Width = 121
    Height = 23
    Caption = 'Add key'
    TabOrder = 1
    OnClick = btnAdd1Click
  end
  object btnClear2: TTntButton
    Left = 56
    Top = 112
    Width = 121
    Height = 23
    Caption = 'Clear'
    TabOrder = 2
    OnClick = btnClear2Click
  end
  object btnAdd2: TTntButton
    Left = 184
    Top = 112
    Width = 121
    Height = 23
    Caption = 'Add key'
    TabOrder = 3
    OnClick = btnAdd2Click
  end
  object PanelWait: TTntPanel
    Left = 320
    Top = 40
    Width = 89
    Height = 97
    BevelOuter = bvNone
    Caption = 'Press a hotkey...'
    TabOrder = 7
    Visible = False
  end
  object chkForLexer: TTntCheckBox
    Left = 8
    Top = 152
    Width = 305
    Height = 17
    Caption = 'For current lexer only'
    TabOrder = 4
  end
end
