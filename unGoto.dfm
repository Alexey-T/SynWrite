object fmGoto: TfmGoto
  Left = 235
  Top = 316
  BorderStyle = bsDialog
  Caption = 'Go to'
  ClientHeight = 161
  ClientWidth = 279
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  ShowHint = True
  OnCloseQuery = FormCloseQuery
  OnKeyDown = TntFormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PanelPos: TPanel
    Left = 8
    Top = 0
    Width = 273
    Height = 89
    BevelOuter = bvNone
    TabOrder = 3
    object Label1: TTntLabel
      Left = 8
      Top = 36
      Width = 23
      Height = 13
      Caption = '&Line:'
      FocusControl = edLine
    end
    object Label2: TTntLabel
      Left = 8
      Top = 60
      Width = 39
      Height = 13
      Caption = '&Column:'
      FocusControl = edCol
    end
    object labBookmk: TTntLabel
      Left = 208
      Top = 8
      Width = 51
      Height = 13
      Cursor = crHandPoint
      Hint = 'Ctrl+G'
      Alignment = taRightJustify
      Caption = 'Bookmarks'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labBookmkClick
    end
    object edLine: TComboBox
      Left = 128
      Top = 32
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 0
    end
    object edCol: TComboBox
      Left = 128
      Top = 56
      Width = 113
      Height = 21
      ItemHeight = 13
      TabOrder = 1
    end
  end
  object ButtonOk: TTntButton
    Left = 48
    Top = 128
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = ButtonOkClick
  end
  object ButtonCan: TTntButton
    Left = 144
    Top = 128
    Width = 88
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object cbExtSel: TTntCheckBox
    Left = 16
    Top = 104
    Width = 265
    Height = 17
    Caption = 'E&xtend selection'
    TabOrder = 0
  end
  object PanelBookmk: TPanel
    Left = 6
    Top = 16
    Width = 273
    Height = 81
    BevelOuter = bvNone
    TabOrder = 4
    Visible = False
    object cbNum: TTntRadioButton
      Left = 8
      Top = 32
      Width = 265
      Height = 17
      Caption = 'To n&umbered bookmark:'
      TabOrder = 2
    end
    object cbPrev: TTntRadioButton
      Left = 8
      Top = 0
      Width = 265
      Height = 17
      Caption = 'To &previous bookmark'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object cbNext: TTntRadioButton
      Left = 8
      Top = 16
      Width = 265
      Height = 17
      Caption = 'To &next bookmark'
      TabOrder = 1
    end
    object edNum: TTntComboBox
      Left = 24
      Top = 50
      Width = 233
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 3
      OnChange = edNumChange
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 232
    Top = 124
    LangData = {
      0600666D476F746F010100000001000000070043617074696F6E010E00000008
      00427574746F6E4F6B010100000003000000070043617074696F6E0009004275
      74746F6E43616E010100000004000000070043617074696F6E00080063624578
      7453656C010100000006000000070043617074696F6E00080050616E656C506F
      73000006004C6162656C3101010000000D000000070043617074696F6E000600
      4C6162656C3201010000000E000000070043617074696F6E0009006C6162426F
      6F6B6D6B01020000000F000000070043617074696F6E13000000040048696E74
      00060065644C696E65000005006564436F6C00000B0050616E656C426F6F6B6D
      6B0000050063624E756D010100000010000000070043617074696F6E00060063
      6250726576010100000011000000070043617074696F6E00060063624E657874
      010100000012000000070043617074696F6E00050065644E756D0000}
  end
end
