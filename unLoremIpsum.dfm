object fmLoremIpsum: TfmLoremIpsum
  Left = 348
  Top = 458
  ActiveControl = edCount
  BorderStyle = bsDialog
  Caption = 'Lorem Ipsum generator'
  ClientHeight = 132
  ClientWidth = 345
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
  object Label2: TTntLabel
    Left = 280
    Top = 100
    Width = 11
    Height = 13
    Cursor = crHandPoint
    Caption = #187'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = Label2Click
  end
  object bOk: TTntButton
    Left = 240
    Top = 8
    Width = 97
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 0
  end
  object bCopy: TTntButton
    Left = 240
    Top = 36
    Width = 97
    Height = 23
    Caption = 'Copy'
    ModalResult = 6
    TabOrder = 1
  end
  object bCan: TTntButton
    Left = 240
    Top = 64
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 225
    Height = 121
    TabOrder = 3
    object Label1: TTntLabel
      Left = 72
      Top = 64
      Width = 29
      Height = 13
      Caption = 'Count'
    end
    object cbSent: TTntRadioButton
      Left = 8
      Top = 16
      Width = 210
      Height = 17
      Caption = 'Sentences'
      Checked = True
      TabOrder = 0
      TabStop = True
      OnClick = cbWordsClick
    end
    object cbPara: TTntRadioButton
      Left = 8
      Top = 32
      Width = 210
      Height = 17
      Caption = 'Paragraphs'
      TabOrder = 1
      OnClick = cbWordsClick
    end
    object edCount: TSpinEdit
      Left = 8
      Top = 60
      Width = 57
      Height = 22
      MaxValue = 10000
      MinValue = 1
      TabOrder = 2
      Value = 5
      OnKeyDown = edCountKeyDown
    end
    object cbTags: TTntCheckBox
      Left = 8
      Top = 96
      Width = 209
      Height = 17
      Caption = 'Use HTML tags'
      TabOrder = 3
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 240
    Top = 92
    LangData = {
      0C00666D4C6F72656D497073756D010100000001000000070043617074696F6E
      010A0000000300624F6B010100000002000000070043617074696F6E00050062
      436F7079010100000003000000070043617074696F6E0004006243616E010100
      000004000000070043617074696F6E00090047726F7570426F78310000060063
      6253656E74010100000005000000070043617074696F6E000600636250617261
      010100000006000000070043617074696F6E0007006564436F756E7400000600
      4C6162656C31010100000008000000070043617074696F6E0006006362546167
      73010100000009000000070043617074696F6E0006004C6162656C3201010000
      000A000000070043617074696F6E00}
  end
end
