object fmLoadLex: TfmLoadLex
  Left = 204
  Top = 253
  BorderStyle = bsDialog
  Caption = 'Restore lexer styles'
  ClientHeight = 273
  ClientWidth = 458
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 8
    Width = 441
    Height = 73
    AutoSize = False
    Caption = 
      'Using this dialog you can restore your own lexer styles, after S' +
      'ynWrite reinstallation. This feature works like this. Lexer styl' +
      'es are automatically backed up in the file "SynStyles.ini", on e' +
      'ach OK button pressing in Lexer properties dialog(s). Then you c' +
      'an reinstall SynWrite (with "LexLib.lxl" library replacement), a' +
      'nd call this dialog. Here you can restore backed up styles from ' +
      '"SynStyles.ini" file back to the "LexLib.lxl" lexer library file' +
      '.'
    WordWrap = True
  end
  object TntGroupBox1: TTntGroupBox
    Left = 48
    Top = 80
    Width = 353
    Height = 157
    Caption = 'Choose which saved styles you want to restore'
    TabOrder = 0
    object List: TCheckListBox
      Left = 8
      Top = 20
      Width = 201
      Height = 129
      OnClickCheck = ListClickCheck
      ItemHeight = 13
      TabOrder = 0
    end
    object bSAll: TTntButton
      Left = 216
      Top = 20
      Width = 129
      Height = 23
      Caption = 'Select all'
      TabOrder = 1
      OnClick = bSAllClick
    end
    object bSNone: TTntButton
      Left = 216
      Top = 48
      Width = 129
      Height = 23
      Caption = 'Select none'
      TabOrder = 2
      OnClick = bSNoneClick
    end
    object bRem: TTntButton
      Left = 216
      Top = 96
      Width = 129
      Height = 23
      Caption = 'Remove selected'
      TabOrder = 3
      OnClick = bRemClick
    end
  end
  object bOk: TTntButton
    Left = 136
    Top = 244
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCan: TTntButton
    Left = 232
    Top = 244
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DKLanguageController1: TDKLanguageController
    Left = 408
    Top = 84
    LangData = {
      0900666D4C6F61644C6578010100000001000000070043617074696F6E010800
      000006004C6162656C31010100000002000000070043617074696F6E000C0054
      6E7447726F7570426F7831010100000003000000070043617074696F6E000400
      4C697374000005006253416C6C010100000004000000070043617074696F6E00
      060062534E6F6E65010100000005000000070043617074696F6E000400625265
      6D010100000006000000070043617074696F6E000300624F6B01010000000700
      0000070043617074696F6E0004006243616E0101000000080000000700436170
      74696F6E00}
  end
end
