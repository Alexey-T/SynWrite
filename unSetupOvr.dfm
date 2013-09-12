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
    Top = 40
    Width = 51
    Height = 13
    Caption = 'Tab stops:'
  end
  object LabelTabMode: TTntLabel
    Left = 184
    Top = 64
    Width = 51
    Height = 13
    Caption = 'Tab mode:'
  end
  object LabelWrap: TTntLabel
    Left = 184
    Top = 88
    Width = 59
    Height = 13
    Caption = 'Wrap mode:'
  end
  object LabelMargin: TTntLabel
    Left = 184
    Top = 160
    Width = 64
    Height = 13
    Caption = 'Right margin:'
  end
  object LabelSp: TTntLabel
    Left = 184
    Top = 184
    Width = 62
    Height = 13
    Caption = 'Line spacing:'
  end
  object LabelOptFill: TTntLabel
    Left = 184
    Top = 112
    Width = 53
    Height = 13
    Caption = 'Optimal fill:'
  end
  object LabelWordChars: TTntLabel
    Left = 184
    Top = 208
    Width = 116
    Height = 13
    Caption = 'Word chars (additional):'
  end
  object LabelBlanks: TTntLabel
    Left = 184
    Top = 136
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
  object ListLex: TListBox
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
    Top = 36
    Width = 153
    Height = 21
    TabOrder = 2
    OnChange = edTabChange
  end
  object edTabMode: TTntComboBox
    Left = 376
    Top = 60
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
    TabOrder = 10
    Visible = False
  end
  object cbOvr: TTntCheckBox
    Left = 184
    Top = 8
    Width = 329
    Height = 17
    Caption = 'Override for selected lexer'
    TabOrder = 1
    WordWrap = True
    OnClick = cbOvrClick
  end
  object edWrap: TTntComboBox
    Left = 376
    Top = 84
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
    Top = 156
    Width = 57
    Height = 22
    MaxValue = 300
    MinValue = 1
    TabOrder = 7
    Value = 1
    OnChange = edTabChange
  end
  object edSpacing: TSpinEdit
    Left = 376
    Top = 180
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = 0
    TabOrder = 8
    Value = 0
    OnChange = edTabChange
  end
  object edOptFill: TTntComboBox
    Left = 376
    Top = 108
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
    Top = 204
    Width = 153
    Height = 21
    Hint = 
      'Additional chars, which will be treated as part of words, by wor' +
      'd double-clicking, smart highlighting, etc.'
    TabOrder = 9
    OnChange = edTabChange
  end
  object edKeepBlanks: TTntComboBox
    Left = 376
    Top = 132
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
  object DKLanguageController1: TDKLanguageController
    Left = 144
    Top = 192
    LangData = {
      0A00666D53657475704F7672010100000001000000070043617074696F6E0115
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
      62656C5465787453686F770000}
  end
end
