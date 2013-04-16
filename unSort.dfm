object fmSort: TfmSort
  Left = 295
  Top = 499
  BorderStyle = bsDialog
  Caption = 'Sort lines'
  ClientHeight = 204
  ClientWidth = 411
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TTntButton
    Left = 216
    Top = 172
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object bCan: TTntButton
    Left = 312
    Top = 172
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object boxGeneral: TTntGroupBox
    Left = 8
    Top = 4
    Width = 194
    Height = 101
    Caption = 'General'
    TabOrder = 0
    object cbAsc: TTntRadioButton
      Left = 8
      Top = 16
      Width = 180
      Height = 17
      Caption = 'Ascending'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cbDesc: TTntRadioButton
      Left = 8
      Top = 32
      Width = 180
      Height = 17
      Caption = 'Descending'
      TabOrder = 1
    end
    object cbCase: TTntCheckBox
      Left = 8
      Top = 56
      Width = 180
      Height = 17
      Caption = 'Case sensitive'
      TabOrder = 2
    end
    object cbRemDups: TTntCheckBox
      Left = 8
      Top = 72
      Width = 180
      Height = 17
      Caption = 'Remove duplicates'
      TabOrder = 3
    end
  end
  object boxColumn: TTntGroupBox
    Left = 208
    Top = 4
    Width = 194
    Height = 101
    Caption = 'Columns'
    TabOrder = 1
    object cbCol1: TTntCheckBox
      Left = 8
      Top = 16
      Width = 180
      Height = 17
      Caption = 'Specify start column'
      TabOrder = 0
      OnClick = cbCol1Click
    end
    object cbCol2: TTntCheckBox
      Left = 8
      Top = 56
      Width = 180
      Height = 17
      Caption = 'Specify end column'
      TabOrder = 2
      OnClick = cbCol2Click
    end
    object edCol1: TSpinEdit
      Left = 32
      Top = 32
      Width = 81
      Height = 22
      Enabled = False
      MaxValue = 10000
      MinValue = 1
      TabOrder = 1
      Value = 1
      OnChange = edCol1Change
      OnKeyDown = edCol1KeyDown
    end
    object edCol2: TSpinEdit
      Left = 32
      Top = 72
      Width = 81
      Height = 22
      Enabled = False
      MaxValue = 10000
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnChange = edCol2Change
      OnKeyDown = edCol1KeyDown
    end
  end
  object boxType: TTntGroupBox
    Left = 8
    Top = 108
    Width = 194
    Height = 89
    Caption = 'Sorting type'
    TabOrder = 2
    object cbNumeric: TTntRadioButton
      Left = 8
      Top = 64
      Width = 180
      Height = 17
      Caption = 'Numeric'
      TabOrder = 2
    end
    object cbAscii: TTntRadioButton
      Left = 8
      Top = 48
      Width = 180
      Height = 17
      Caption = 'ASCII'
      TabOrder = 1
    end
    object cbUnicodeRaw: TTntRadioButton
      Left = 8
      Top = 16
      Width = 180
      Height = 17
      Caption = 'Unicode'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cbUnicode: TTntRadioButton
      Left = 8
      Top = 32
      Width = 180
      Height = 17
      Caption = 'Unicode (Win API)'
      TabOrder = 3
    end
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'cbAscii.*'
      'cbUnicode.*'
      'cbUnicodeRaw.*')
    Left = 368
    Top = 124
    LangData = {
      0600666D536F7274010100000001000000070043617074696F6E011100000003
      00624F6B010100000002000000070043617074696F6E0004006243616E010100
      000003000000070043617074696F6E000A00626F7847656E6572616C01010000
      0004000000070043617074696F6E000500636241736301010000000500000007
      0043617074696F6E000600636244657363010100000006000000070043617074
      696F6E000600636243617365010100000007000000070043617074696F6E0009
      00636252656D44757073010100000008000000070043617074696F6E00090062
      6F78436F6C756D6E010100000009000000070043617074696F6E000600636243
      6F6C3101010000000A000000070043617074696F6E0006006362436F6C320101
      0000000B000000070043617074696F6E0006006564436F6C3100000600656443
      6F6C3200000700626F785479706501010000000C000000070043617074696F6E
      00090063624E756D6572696301010000000E000000070043617074696F6E0007
      006362417363696900000C006362556E69636F6465526177000009006362556E
      69636F64650000}
  end
end
