object fmFillBlock: TfmFillBlock
  Left = 357
  Top = 511
  ActiveControl = edLine
  BorderStyle = bsDialog
  Caption = 'Fill block'
  ClientHeight = 135
  ClientWidth = 434
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
  object TntGroupBox1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 417
    Height = 93
    TabOrder = 0
    object TntLabel1: TTntLabel
      Left = 8
      Top = 12
      Width = 55
      Height = 13
      Caption = 'New string:'
    end
    object edLine: TTntEdit
      Left = 8
      Top = 28
      Width = 401
      Height = 21
      TabOrder = 0
      OnChange = edLineChange
    end
    object cbKeepWidth: TTntCheckBox
      Left = 8
      Top = 52
      Width = 401
      Height = 33
      Caption = 'Keep block width (uncheck to perform "Column Editing" command)'
      TabOrder = 1
      WordWrap = True
    end
  end
  object bOk: TTntButton
    Left = 224
    Top = 104
    Width = 97
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCan: TTntButton
    Left = 328
    Top = 104
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DKLanguageController1: TDKLanguageController
    Left = 400
    Top = 76
    LangData = {
      0B00666D46696C6C426C6F636B010100000001000000070043617074696F6E01
      060000000C00546E7447726F7570426F783100000300624F6B01010000000200
      0000070043617074696F6E0004006243616E0101000000030000000700436170
      74696F6E000900546E744C6162656C3101010000000400000007004361707469
      6F6E00060065644C696E6500000B0063624B6565705769647468010100000005
      000000070043617074696F6E00}
  end
end
