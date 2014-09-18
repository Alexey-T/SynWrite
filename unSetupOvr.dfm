object fmSetupOvr: TfmSetupOvr
  Left = 309
  Top = 381
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
  object LabelHelpAutoCase: TTntLabel
    Left = 400
    Top = 242
    Width = 19
    Height = 13
    Cursor = crHandPoint
    Caption = '( ? )'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = LabelHelpAutoCaseClick
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
  object edTabStops: TTntEdit
    Left = 376
    Top = 24
    Width = 153
    Height = 21
    TabOrder = 3
    OnChange = edTabStopsChange
  end
  object edText: TEdit
    Left = 8
    Top = 348
    Width = 505
    Height = 21
    ParentColor = True
    ReadOnly = True
    TabOrder = 16
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
  object edMargin: TSpinEdit
    Left = 376
    Top = 168
    Width = 57
    Height = 22
    MaxValue = 300
    MinValue = 1
    TabOrder = 11
    Value = 1
    OnChange = edTabStopsChange
  end
  object edSpacing: TSpinEdit
    Left = 376
    Top = 192
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = 0
    TabOrder = 13
    Value = 0
    OnChange = edTabStopsChange
  end
  object edWordChars: TTntEdit
    Left = 376
    Top = 216
    Width = 153
    Height = 21
    Hint = 
      'Additional chars, which will be treated as part of words, by wor' +
      'd double-clicking, smart highlighting, etc.'
    TabOrder = 14
    OnChange = edTabStopsChange
  end
  object cbAutoCase: TTntCheckBox
    Left = 184
    Top = 240
    Width = 205
    Height = 17
    Alignment = taLeftJustify
    Caption = 'Auto-correct identifier case'
    TabOrder = 15
    OnClick = edTabStopsChange
  end
  object edIndent: TSpinEdit
    Left = 376
    Top = 144
    Width = 57
    Height = 22
    MaxValue = 80
    MinValue = 1
    TabOrder = 9
    Value = 1
    OnChange = edTabStopsChange
  end
  object chkTabStops: TTntCheckBox
    Left = 352
    Top = 24
    Width = 17
    Height = 17
    TabOrder = 2
    OnClick = chkTabStopsClick
  end
  object chkTabMode: TTntCheckBox
    Left = 352
    Top = 48
    Width = 17
    Height = 17
    TabOrder = 4
    OnClick = chkTabStopsClick
  end
  object chkWrap: TTntCheckBox
    Left = 352
    Top = 72
    Width = 17
    Height = 17
    TabOrder = 5
    OnClick = chkTabStopsClick
  end
  object chkOptFill: TTntCheckBox
    Left = 352
    Top = 96
    Width = 17
    Height = 17
    TabOrder = 6
    OnClick = chkTabStopsClick
  end
  object chkKeepBlanks: TTntCheckBox
    Left = 352
    Top = 120
    Width = 17
    Height = 17
    TabOrder = 7
    OnClick = chkTabStopsClick
  end
  object chkIndent: TTntCheckBox
    Left = 352
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 8
    OnClick = chkTabStopsClick
  end
  object chkMargin: TTntCheckBox
    Left = 352
    Top = 168
    Width = 17
    Height = 17
    TabOrder = 10
    OnClick = chkTabStopsClick
  end
  object chkSpacing: TTntCheckBox
    Left = 352
    Top = 192
    Width = 17
    Height = 17
    TabOrder = 12
    OnClick = chkTabStopsClick
  end
  object edTabMode: TTntComboBox
    Left = 376
    Top = 48
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 17
    OnChange = edTabStopsChange
    Items.Strings = (
      'Spaces'
      'Tab character'
      'SmartTab')
  end
  object edWrap: TTntComboBox
    Left = 376
    Top = 72
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 18
    OnChange = edTabStopsChange
    Items.Strings = (
      'Off'
      'On, at window edge'
      'On, at right margin')
  end
  object edOptFill: TTntComboBox
    Left = 376
    Top = 96
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 19
    OnChange = edTabStopsChange
    Items.Strings = (
      'Off'
      'On')
  end
  object edKeepBlanks: TTntComboBox
    Left = 376
    Top = 120
    Width = 153
    Height = 21
    AutoDropDown = True
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 20
    OnChange = edTabStopsChange
    Items.Strings = (
      'Off'
      'On')
  end
  object DKLanguageController1: TDKLanguageController
    Left = 144
    Top = 192
    LangData = {
      0A00666D53657475704F7672010100000001000000070043617074696F6E0121
      00000006004C6162656C31010100000002000000070043617074696F6E000C00
      4C6162656C54616253746F70010100000003000000070043617074696F6E000C
      004C6162656C5461624D6F6465010100000004000000070043617074696F6E00
      07004C6973744C657800000A00656454616253746F7073000006006564546578
      740000050063624F767201010000000A000000070043617074696F6E0009004C
      6162656C5772617001010000000B000000070043617074696F6E000B004C6162
      656C4D617267696E01010000000D000000070043617074696F6E00080065644D
      617267696E000007004C6162656C537001010000000E00000007004361707469
      6F6E000900656453706163696E6700000C004C6162656C4F707446696C6C0101
      00000010000000070043617074696F6E000B006564576F726443686172730101
      00000012000000040048696E74000E004C6162656C576F726443686172730101
      00000011000000070043617074696F6E000B004C6162656C426C616E6B730101
      00000013000000070043617074696F6E000D004C6162656C5465787453686F77
      00000A0063624175746F43617365010100000015000000070043617074696F6E
      0011004C6162656C48656C704175746F4361736500000B004C6162656C496E64
      656E74010100000016000000070043617074696F6E0008006564496E64656E74
      00000B0063686B54616253746F707300000A0063686B5461624D6F6465000007
      0063686B5772617000000A0063686B4F707446696C6C00000D0063686B4B6565
      70426C616E6B730000090063686B496E64656E740000090063686B4D61726769
      6E00000A0063686B53706163696E670000090065645461624D6F646501010000
      001700000005004974656D730006006564577261700101000000180000000500
      4974656D7300090065644F707446696C6C01010000001900000005004974656D
      73000C0065644B656570426C616E6B7301010000001A00000005004974656D73
      00}
  end
end
