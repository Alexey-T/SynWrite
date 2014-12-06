object fmToolOutput: TfmToolOutput
  Left = 273
  Top = 322
  BorderStyle = bsDialog
  Caption = 'Output pattern'
  ClientHeight = 281
  ClientWidth = 393
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = TntFormCreate
  OnDestroy = TntFormDestroy
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TTntButton
    Left = 200
    Top = 250
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCancel: TTntButton
    Left = 296
    Top = 250
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object TntGroupBox1: TTntGroupBox
    Left = 8
    Top = 8
    Width = 377
    Height = 237
    TabOrder = 0
    object TntLabel1: TTntLabel
      Left = 8
      Top = 64
      Width = 96
      Height = 13
      Caption = '&Regular expression:'
      FocusControl = edRE
    end
    object TntLabel2: TTntLabel
      Left = 8
      Top = 120
      Width = 46
      Height = 13
      Caption = '&Filename:'
      FocusControl = edFN
    end
    object TntLabel3: TTntLabel
      Left = 8
      Top = 104
      Width = 123
      Height = 13
      Caption = 'Subexpressions numbers:'
    end
    object TntLabel4: TTntLabel
      Left = 104
      Top = 120
      Width = 23
      Height = 13
      Caption = '&Line:'
      FocusControl = edLn
    end
    object TntLabel5: TTntLabel
      Left = 200
      Top = 120
      Width = 39
      Height = 13
      Caption = '&Column:'
      FocusControl = edCol
    end
    object TntLabel6: TTntLabel
      Left = 8
      Top = 192
      Width = 79
      Height = 13
      Caption = '&Test output line:'
      FocusControl = edTest
    end
    object Bevel1: TBevel
      Left = 8
      Top = 180
      Width = 361
      Height = 9
      Shape = bsBottomLine
    end
    object Bevel2: TBevel
      Left = 8
      Top = 52
      Width = 361
      Height = 9
      Shape = bsBottomLine
    end
    object edRE: TTntEdit
      Left = 8
      Top = 80
      Width = 361
      Height = 21
      TabOrder = 2
    end
    object edFN: TTntComboBox
      Left = 8
      Top = 136
      Width = 73
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      ItemHeight = 13
      TabOrder = 3
    end
    object edLn: TTntComboBox
      Left = 104
      Top = 136
      Width = 73
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      ItemHeight = 13
      TabOrder = 4
    end
    object edCol: TTntComboBox
      Left = 200
      Top = 136
      Width = 73
      Height = 21
      Style = csDropDownList
      DropDownCount = 10
      ItemHeight = 13
      TabOrder = 5
    end
    object edTest: TTntEdit
      Left = 8
      Top = 208
      Width = 265
      Height = 21
      TabOrder = 7
      OnChange = edTestChange
    end
    object bTest: TTntButton
      Left = 280
      Top = 208
      Width = 89
      Height = 21
      Caption = 'T&est'
      TabOrder = 8
      OnClick = bTestClick
    end
    object cbNoTag: TTntCheckBox
      Left = 8
      Top = 164
      Width = 289
      Height = 17
      Caption = 'Strip HTML tags from output'
      TabOrder = 6
    end
    object bPreLoad: TTntButton
      Left = 8
      Top = 12
      Width = 170
      Height = 21
      Caption = 'Load preset...'
      TabOrder = 0
      OnClick = bPreLoadClick
    end
    object bPreSave: TTntButton
      Left = 8
      Top = 32
      Width = 170
      Height = 21
      Caption = 'Save preset...'
      TabOrder = 1
      OnClick = bPreSaveClick
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 296
    Top = 20
    LangData = {
      0C00666D546F6F6C4F7574707574010100000001000000070043617074696F6E
      01150000000300624F6B010100000002000000070043617074696F6E00070062
      43616E63656C010100000003000000070043617074696F6E000C00546E744772
      6F7570426F783100000900546E744C6162656C31010100000004000000070043
      617074696F6E000900546E744C6162656C320101000000050000000700436170
      74696F6E000900546E744C6162656C3301010000000600000007004361707469
      6F6E000900546E744C6162656C34010100000007000000070043617074696F6E
      000900546E744C6162656C35010100000008000000070043617074696F6E0004
      0065645245000004006564464E0000040065644C6E000005006564436F6C0000
      0900546E744C6162656C36010100000009000000070043617074696F6E000600
      65645465737400000500625465737401010000000A000000070043617074696F
      6E000600426576656C3100000600426576656C32000009006D6E755072657365
      740000070063624E6F54616701010000000D000000070043617074696F6E0008
      00625072655361766501010000000E000000070043617074696F6E0008006250
      72654C6F616401010000000F000000070043617074696F6E00}
  end
  object mnuPreset: TTntPopupMenu
    OnPopup = mnuPresetPopup
    Left = 264
    Top = 16
  end
end
