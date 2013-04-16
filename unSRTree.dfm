object fmSRTree: TfmSRTree
  Left = 168
  Top = 374
  ActiveControl = edText
  BorderStyle = bsDialog
  Caption = 'Search in tree/list'
  ClientHeight = 162
  ClientWidth = 433
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 4
    Width = 54
    Height = 13
    Caption = 'Search for:'
  end
  object edText: TTntComboBox
    Left = 8
    Top = 20
    Width = 313
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    OnChange = edTextChange
  end
  object gOp: TTntGroupBox
    Left = 8
    Top = 56
    Width = 153
    Height = 97
    Caption = 'Options'
    TabOrder = 1
    object cbRE: TTntCheckBox
      Left = 8
      Top = 60
      Width = 140
      Height = 17
      Caption = 'Regular e&xpressions'
      TabOrder = 2
    end
    object cbCase: TTntCheckBox
      Left = 8
      Top = 24
      Width = 140
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 0
    end
    object cbWords: TTntCheckBox
      Left = 8
      Top = 42
      Width = 140
      Height = 17
      Caption = '&Whole words'
      TabOrder = 1
    end
  end
  object gDir: TTntGroupBox
    Left = 168
    Top = 56
    Width = 153
    Height = 57
    Caption = 'Direction'
    TabOrder = 2
    object bFor: TTntRadioButton
      Left = 8
      Top = 16
      Width = 140
      Height = 21
      Caption = 'Forwar&d'
      TabOrder = 0
    end
    object bBack: TTntRadioButton
      Left = 8
      Top = 34
      Width = 140
      Height = 17
      Caption = '&Backward'
      TabOrder = 1
    end
  end
  object gScop: TTntGroupBox
    Left = 168
    Top = 116
    Width = 153
    Height = 37
    Caption = 'Scope'
    TabOrder = 3
    object cbFromCur: TTntCheckBox
      Left = 8
      Top = 14
      Width = 140
      Height = 17
      Caption = 'Search from cursor'
      TabOrder = 0
    end
  end
  object bFNext: TTntButton
    Left = 328
    Top = 12
    Width = 97
    Height = 25
    Caption = '&Find'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object bCan: TTntButton
    Left = 328
    Top = 42
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object DKLanguageController1: TDKLanguageController
    Left = 328
    Top = 76
    LangData = {
      0800666D535254726565010100000001000000070043617074696F6E010D0000
      00060065645465787400000900546E744C6162656C3101010000000200000007
      0043617074696F6E000300674F70010100000003000000070043617074696F6E
      00040063625245010100000004000000070043617074696F6E00060063624361
      7365010100000005000000070043617074696F6E0007006362576F7264730101
      00000006000000070043617074696F6E00040067446972010100000007000000
      070043617074696F6E00040062466F7201010000000800000007004361707469
      6F6E000500624261636B010100000009000000070043617074696F6E00050067
      53636F7001010000000A000000070043617074696F6E000900636246726F6D43
      757201010000000B000000070043617074696F6E00060062464E657874010100
      00000C000000070043617074696F6E0004006243616E01010000000D00000007
      0043617074696F6E00}
  end
end
