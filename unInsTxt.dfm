object fmInsTxt: TfmInsTxt
  Left = 190
  Top = 208
  BorderStyle = bsDialog
  Caption = 'Insert text'
  ClientHeight = 417
  ClientWidth = 417
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TntGroupBox1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 401
    Height = 185
    Caption = 'What to insert'
    TabOrder = 0
    object TntLabel1: TTntLabel
      Left = 97
      Top = 36
      Width = 62
      Height = 13
      Alignment = taRightJustify
      Caption = 'at line begin:'
    end
    object TntLabel2: TTntLabel
      Left = 105
      Top = 60
      Width = 54
      Height = 13
      Alignment = taRightJustify
      Caption = 'at line end:'
    end
    object TntLabel3: TTntLabel
      Left = 168
      Top = 96
      Width = 51
      Height = 13
      Caption = 'Start num:'
    end
    object TntLabel4: TTntLabel
      Left = 240
      Top = 96
      Width = 30
      Height = 13
      Caption = 'Digits:'
    end
    object lab1: TTntLabel
      Left = 168
      Top = 136
      Width = 10
      Height = 13
      Caption = '1.'
    end
    object lab2: TTntLabel
      Left = 168
      Top = 148
      Width = 10
      Height = 13
      Caption = '2.'
    end
    object TntLabel5: TTntLabel
      Left = 312
      Top = 96
      Width = 32
      Height = 13
      Caption = 'Suffix:'
    end
    object TntLabel6: TTntLabel
      Left = 88
      Top = 96
      Width = 32
      Height = 13
      Caption = 'Prefix:'
    end
    object bText: TTntRadioButton
      Left = 8
      Top = 16
      Width = 161
      Height = 17
      Caption = 'Text'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = bTextClick
    end
    object bNumber: TTntRadioButton
      Left = 8
      Top = 80
      Width = 161
      Height = 17
      Caption = 'Numbering'
      TabOrder = 1
      OnClick = bTextClick
    end
    object bBullets: TTntRadioButton
      Left = 8
      Top = 160
      Width = 161
      Height = 17
      Caption = 'Bullets'
      TabOrder = 2
      OnClick = bTextClick
    end
    object ed1: TTntComboBox
      Left = 168
      Top = 32
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 3
    end
    object ed2: TTntComboBox
      Left = 168
      Top = 56
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
    object edStart: TSpinEdit
      Left = 168
      Top = 112
      Width = 65
      Height = 22
      MaxValue = 100000
      MinValue = 0
      TabOrder = 6
      Value = 1
      OnChange = edStartChange
      OnKeyDown = edCounterKeyDown
    end
    object edDigits: TSpinEdit
      Left = 240
      Top = 112
      Width = 65
      Height = 22
      MaxValue = 15
      MinValue = 1
      TabOrder = 7
      Value = 1
      OnChange = edStartChange
      OnKeyDown = edCounterKeyDown
    end
    object edTail: TTntComboBox
      Left = 312
      Top = 112
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 8
      OnChange = edStartChange
    end
    object edBegin: TTntComboBox
      Left = 88
      Top = 112
      Width = 73
      Height = 21
      ItemHeight = 13
      TabOrder = 5
      OnChange = edStartChange
    end
  end
  object TntGroupBox2: TTntGroupBox
    Left = 8
    Top = 192
    Width = 401
    Height = 125
    Caption = 'Options'
    TabOrder = 1
    object TntLabel8: TTntLabel
      Left = 8
      Top = 16
      Width = 82
      Height = 13
      Caption = 'Insert beginning:'
    end
    object bAtCol: TTntRadioButton
      Left = 8
      Top = 32
      Width = 169
      Height = 17
      Caption = 'at column:'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object bAfterSp: TTntRadioButton
      Left = 8
      Top = 52
      Width = 169
      Height = 17
      Caption = 'after leading spaces'
      TabOrder = 1
    end
    object cbSkip: TTntCheckBox
      Left = 8
      Top = 100
      Width = 305
      Height = 17
      Caption = 'Skip empty lines'
      TabOrder = 5
    end
    object edCol: TSpinEdit
      Left = 176
      Top = 31
      Width = 65
      Height = 22
      MaxValue = 100000
      MinValue = 1
      TabOrder = 3
      Value = 1
      OnKeyDown = edCounterKeyDown
    end
    object bAfterStr: TTntRadioButton
      Left = 8
      Top = 72
      Width = 169
      Height = 17
      Caption = 'after string:'
      TabOrder = 2
    end
    object edStrAfter: TTntComboBox
      Left = 176
      Top = 72
      Width = 161
      Height = 21
      ItemHeight = 13
      TabOrder = 4
    end
  end
  object bOk: TTntButton
    Left = 224
    Top = 388
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object bCan: TTntButton
    Left = 320
    Top = 388
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object TntGroupBox3: TTntGroupBox
    Left = 8
    Top = 320
    Width = 401
    Height = 61
    Caption = 'Counter'
    TabOrder = 2
    object labNoteNoSel: TTntLabel
      Left = 8
      Top = 16
      Width = 320
      Height = 13
      Caption = 
        'Note: insert operation will be performed specified number of tim' +
        'es.'
    end
    object labNoteSel: TTntLabel
      Left = 8
      Top = 16
      Width = 205
      Height = 13
      Caption = 'Note: only selected lines will be processed.'
    end
    object labCounter: TTntLabel
      Left = 8
      Top = 36
      Width = 79
      Height = 13
      Caption = 'Repeat counter:'
    end
    object edCounter: TSpinEdit
      Left = 176
      Top = 31
      Width = 65
      Height = 22
      MaxValue = 100000
      MinValue = 1
      TabOrder = 0
      Value = 1
      OnKeyDown = edCounterKeyDown
    end
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'lab1.*'
      'lab2.*')
    Left = 368
    Top = 68
    LangData = {
      0800666D496E73547874010100000001000000070043617074696F6E01210000
      000C00546E7447726F7570426F7831010100000002000000070043617074696F
      6E000900546E744C6162656C31010100000003000000070043617074696F6E00
      0900546E744C6162656C32010100000004000000070043617074696F6E000900
      546E744C6162656C33010100000005000000070043617074696F6E000900546E
      744C6162656C34010100000006000000070043617074696F6E0004006C616231
      000004006C616232000005006254657874010100000008000000070043617074
      696F6E000700624E756D626572010100000009000000070043617074696F6E00
      08006242756C6C65747301010000000A000000070043617074696F6E00030065
      6431000003006564320000070065645374617274000008006564446967697473
      0000060065645461696C00000C00546E7447726F7570426F783201010000000B
      000000070043617074696F6E000900546E744C6162656C3801010000000C0000
      00070043617074696F6E000600624174436F6C01010000000D00000007004361
      7074696F6E000800624166746572537001010000000E00000007004361707469
      6F6E0006006362536B697001010000000F000000070043617074696F6E000500
      6564436F6C000009006241667465725374720101000000100000000700436170
      74696F6E000A006564537472416674657200000300624F6B0101000000110000
      00070043617074696F6E0004006243616E010100000012000000070043617074
      696F6E000900546E744C6162656C35010100000013000000070043617074696F
      6E000900546E744C6162656C36010100000014000000070043617074696F6E00
      07006564426567696E00000C00546E7447726F7570426F783301010000001800
      0000070043617074696F6E000A006C61624E6F746553656C0101000000150000
      00070043617074696F6E000C006C61624E6F74654E6F53656C01010000001600
      0000070043617074696F6E000A006C6162436F756E7465720101000000170000
      00070043617074696F6E0009006564436F756E7465720000}
  end
end
