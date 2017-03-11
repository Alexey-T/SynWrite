object fmHotkeys: TfmHotkeys
  Left = 366
  Top = 446
  BorderStyle = bsDialog
  ClientHeight = 208
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
    TabOrder = 5
    OnClick = btnOkClick
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
    Enabled = False
    TabOrder = 4
  end
  object DKLang1: TDKLanguageController
    Left = 328
    Top = 16
    LangData = {
      0900666D486F746B65797300010A0000000A006C6162656C496E666F3100000A
      006C6162656C496E666F320000050062746E4F6B010100000002000000070043
      617074696F6E00090062746E43616E63656C0101000000030000000700436170
      74696F6E00090062746E436C6561723101010000000400000007004361707469
      6F6E00070062746E41646431010100000005000000070043617074696F6E0009
      0062746E436C65617232010100000006000000070043617074696F6E00070062
      746E41646432010100000007000000070043617074696F6E00090050616E656C
      57616974010100000008000000070043617074696F6E000B0063686B466F724C
      65786572010100000009000000070043617074696F6E00}
  end
end
