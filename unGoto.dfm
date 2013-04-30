object fmGoto: TfmGoto
  Left = 235
  Top = 316
  ActiveControl = edLine
  BorderStyle = bsDialog
  Caption = 'Go to'
  ClientHeight = 214
  ClientWidth = 283
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 24
    Top = 28
    Width = 23
    Height = 13
    Caption = '&Line:'
    FocusControl = edLine
  end
  object Label2: TTntLabel
    Left = 24
    Top = 52
    Width = 39
    Height = 13
    Caption = '&Column:'
    FocusControl = edCol
  end
  object Bevel1: TBevel
    Left = 8
    Top = 76
    Width = 265
    Height = 9
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 8
    Top = 156
    Width = 265
    Height = 9
    Shape = bsTopLine
  end
  object edLine: TComboBox
    Left = 144
    Top = 24
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 1
  end
  object ButtonOk: TTntButton
    Left = 57
    Top = 184
    Width = 80
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 8
    OnClick = ButtonOkClick
  end
  object ButtonCan: TTntButton
    Left = 145
    Top = 184
    Width = 80
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 9
  end
  object edCol: TComboBox
    Left = 144
    Top = 48
    Width = 113
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object cbExtSel: TTntCheckBox
    Left = 8
    Top = 160
    Width = 265
    Height = 17
    Caption = 'E&xtend selection'
    TabOrder = 7
  end
  object cbPos: TTntRadioButton
    Left = 8
    Top = 6
    Width = 265
    Height = 17
    Caption = '&Go to position'
    Checked = True
    TabOrder = 0
    TabStop = True
    OnClick = cbPosClick
  end
  object cbPrev: TTntRadioButton
    Left = 8
    Top = 80
    Width = 265
    Height = 17
    Caption = 'Go to &previous bookmark'
    TabOrder = 3
    OnClick = cbPosClick
  end
  object cbNext: TTntRadioButton
    Left = 8
    Top = 96
    Width = 265
    Height = 17
    Caption = 'Go to &next bookmark'
    TabOrder = 4
    OnClick = cbPosClick
  end
  object cbNum: TTntRadioButton
    Left = 8
    Top = 112
    Width = 265
    Height = 17
    Caption = 'Go to n&umbered bookmark:'
    TabOrder = 5
    OnClick = cbPosClick
  end
  object edNum: TTntComboBox
    Left = 24
    Top = 130
    Width = 233
    Height = 21
    Style = csDropDownList
    DropDownCount = 20
    ItemHeight = 13
    TabOrder = 6
    OnChange = edNumChange
  end
  object DKLanguageController1: TDKLanguageController
    Left = 192
    Top = 4
    LangData = {
      0600666D476F746F010100000001000000070043617074696F6E010E00000006
      004C6162656C31010100000002000000070043617074696F6E00060065644C69
      6E6500000800427574746F6E4F6B010100000003000000070043617074696F6E
      000900427574746F6E43616E010100000004000000070043617074696F6E0005
      006564436F6C000006004C6162656C3201010000000500000007004361707469
      6F6E000800636245787453656C010100000006000000070043617074696F6E00
      0600426576656C31000005006362506F73010100000007000000070043617074
      696F6E000600636250726576010100000008000000070043617074696F6E0006
      0063624E657874010100000009000000070043617074696F6E00050063624E75
      6D01010000000A000000070043617074696F6E00050065644E756D0000060042
      6576656C320000}
  end
end
