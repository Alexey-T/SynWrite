object fmSetupOvr: TfmSetupOvr
  Left = 241
  Top = 388
  ActiveControl = ListLex
  BorderStyle = bsDialog
  Caption = 'Lexers overrides'
  ClientHeight = 381
  ClientWidth = 576
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnCreate = TntFormCreate
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 4
    Width = 36
    Height = 13
    Caption = 'Lexers:'
  end
  object LabelTabStop: TTntLabel
    Left = 184
    Top = 28
    Width = 51
    Height = 13
    Caption = 'Tab stops:'
  end
  object LabelTabMode: TTntLabel
    Left = 184
    Top = 52
    Width = 51
    Height = 13
    Caption = 'Tab mode:'
  end
  object LabelWrap: TTntLabel
    Left = 184
    Top = 76
    Width = 59
    Height = 13
    Caption = 'Wrap mode:'
  end
  object LabelMargin: TTntLabel
    Left = 184
    Top = 172
    Width = 64
    Height = 13
    Caption = 'Right margin:'
  end
  object LabelSp: TTntLabel
    Left = 184
    Top = 196
    Width = 62
    Height = 13
    Caption = 'Line spacing:'
  end
  object LabelOptFill: TTntLabel
    Left = 184
    Top = 100
    Width = 102
    Height = 13
    Caption = 'Optimal fill with Tabs:'
  end
  object LabelWordChars: TTntLabel
    Left = 184
    Top = 220
    Width = 116
    Height = 13
    Caption = 'Word chars (additional):'
  end
  object LabelBlanks: TTntLabel
    Left = 184
    Top = 124
    Width = 96
    Height = 13
    Caption = 'Keep trailing blanks:'
  end
  object LabelTextShow: TLabel
    Left = 520
    Top = 352
    Width = 8
    Height = 13
    Cursor = crHandPoint
    Caption = '+'
    OnClick = LabelTextShowClick
  end
  object labAutoCloseHelp: TTntLabel
    Left = 400
    Top = 242
    Width = 13
    Height = 13
    Cursor = crHandPoint
    Caption = '(?)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labAutoCloseHelpClick
  end
  object LabelIndent: TTntLabel
    Left = 184
    Top = 148
    Width = 61
    Height = 13
    Caption = 'Block indent:'
  end
  object ListLex: TTntListBox
    Left = 8
    Top = 20
    Width = 161
    Height = 321
    ItemHeight = 13
    Sorted = True
    TabOrder = 0
    OnClick = ListLexClick
  end
  object edTab: TTntEdit
    Left = 376
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 2
    OnChange = edTabChange
  end
  object edTabMode: TTntComboBox
    Left = 376
    Top = 48
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 3
    OnChange = edTabChange
    Items.Strings = (
      'Spaces'
      'Tab character'
      'SmartTab')
  end
  object edText: TEdit
    Left = 8
    Top = 348
    Width = 505
    Height = 21
    ParentColor = True
    ReadOnly = True
    TabOrder = 12
    Visible = False
  end
  object cbOvr: TTntCheckBox
    Left = 184
    Top = 4
    Width = 329
    Height = 17
    Caption = 'Override for selected lexer'
    TabOrder = 1
    WordWrap = True
    OnClick = cbOvrClick
  end
  object edWrap: TTntComboBox
    Left = 376
    Top = 72
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 4
    OnChange = edTabChange
    Items.Strings = (
      'Don'#39't change'
      'Off'
      'On, at window edge'
      'On, at right margin')
  end
  object edMargin: TSpinEdit
    Left = 376
    Top = 168
    Width = 57
    Height = 22
    MaxValue = 300
    MinValue = 1
    TabOrder = 8
    Value = 1
    OnChange = edTabChange
  end
  object edSpacing: TSpinEdit
    Left = 376
    Top = 192
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = 0
    TabOrder = 9
    Value = 0
    OnChange = edTabChange
  end
  object edOptFill: TTntComboBox
    Left = 376
    Top = 96
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 5
    OnChange = edTabChange
    Items.Strings = (
      'Don'#39't change'
      'Off'
      'On')
  end
  object edWordChars: TTntEdit
    Left = 376
    Top = 216
    Width = 153
    Height = 21
    Hint = 
      'Additional chars, which will be treated as part of words, by wor' +
      'd double-clicking, smart highlighting, etc.'
    TabOrder = 10
    OnChange = edTabChange
  end
  object edKeepBlanks: TTntComboBox
    Left = 376
    Top = 120
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
    OnChange = edTabChange
    Items.Strings = (
      'Don'#39't change'
      'Off'
      'On')
  end
  object cbAutoCase: TTntCheckBox
    Left = 184
    Top = 240
    Width = 205
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Auto-correct identifier case'
    TabOrder = 11
    OnClick = edTabChange
  end
  object edIndent: TSpinEdit
    Left = 376
    Top = 144
    Width = 57
    Height = 22
    MaxValue = 80
    MinValue = 1
    TabOrder = 7
    Value = 1
    OnChange = edTabChange
  end
  object DKLanguageController1: TDKLanguageController
    Left = 144
    Top = 192
    LangData = {
      0A00666D53657475704F7672010100000001000000070043617074696F6E0119
      00000006004C6162656C31010100000002000000070043617074696F6E000C00
      4C6162656C54616253746F70010100000003000000070043617074696F6E000C
      004C6162656C5461624D6F6465010100000004000000070043617074696F6E00
      07004C6973744C65780000050065645461620000090065645461624D6F646501
      010000000700000005004974656D730006006564546578740000050063624F76
      7201010000000A000000070043617074696F6E0009004C6162656C5772617001
      010000000B000000070043617074696F6E00060065645772617001010000000C
      00000005004974656D73000B004C6162656C4D617267696E01010000000D0000
      00070043617074696F6E00080065644D617267696E000007004C6162656C5370
      01010000000E000000070043617074696F6E000900656453706163696E670000
      090065644F707446696C6C01010000000F00000005004974656D73000C004C61
      62656C4F707446696C6C010100000010000000070043617074696F6E000B0065
      64576F72644368617273010100000012000000040048696E74000E004C616265
      6C576F72644368617273010100000011000000070043617074696F6E000B004C
      6162656C426C616E6B73010100000013000000070043617074696F6E000C0065
      644B656570426C616E6B7301010000001400000005004974656D73000D004C61
      62656C5465787453686F7700000A0063624175746F4361736501010000001500
      0000070043617074696F6E0010006C61624175746F436C6F736548656C700000
      0B004C6162656C496E64656E74010100000016000000070043617074696F6E00
      08006564496E64656E740000}
  end
end
