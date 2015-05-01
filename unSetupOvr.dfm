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
  object LabelWordChars: TTntLabel
    Left = 160
    Top = 268
    Width = 116
    Height = 13
    Caption = 'Word chars (additional):'
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
    Left = 376
    Top = 218
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
  object ListLex: TTntListBox
    Left = 8
    Top = 20
    Width = 140
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
    TabOrder = 22
    Visible = False
  end
  object cbOvr: TTntCheckBox
    Left = 160
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
    TabOrder = 15
    Value = 1
    OnChange = edTabStopsChange
  end
  object edSpacing: TSpinEdit
    Left = 376
    Top = 192
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = -2
    TabOrder = 17
    Value = 0
    OnChange = edTabStopsChange
  end
  object edWordChars: TTntEdit
    Left = 376
    Top = 264
    Width = 153
    Height = 21
    Hint = 
      'Additional chars, which will be treated as part of words, by wor' +
      'd double-clicking, smart highlighting, etc.'
    TabOrder = 21
    OnChange = edTabStopsChange
  end
  object chkAutoCase: TTntCheckBox
    Left = 160
    Top = 216
    Width = 215
    Height = 17
    Caption = 'Auto-correct identifier case'
    TabOrder = 18
    OnClick = edTabStopsChange
  end
  object edIndent: TSpinEdit
    Left = 376
    Top = 144
    Width = 57
    Height = 22
    MaxValue = 80
    MinValue = 1
    TabOrder = 13
    Value = 1
    OnChange = edTabStopsChange
  end
  object chkTabStops: TTntCheckBox
    Left = 160
    Top = 24
    Width = 215
    Height = 17
    Caption = 'Tab stops'
    TabOrder = 2
    OnClick = chkTabStopsClick
  end
  object chkTabMode: TTntCheckBox
    Left = 160
    Top = 48
    Width = 215
    Height = 17
    Caption = 'Tab mode'
    TabOrder = 4
    OnClick = chkTabStopsClick
  end
  object chkWrap: TTntCheckBox
    Left = 160
    Top = 72
    Width = 215
    Height = 17
    Caption = 'Wrap mode'
    TabOrder = 6
    OnClick = chkTabStopsClick
  end
  object chkOptFill: TTntCheckBox
    Left = 160
    Top = 96
    Width = 215
    Height = 17
    Caption = 'Optimal fill with Tabs'
    TabOrder = 8
    OnClick = chkTabStopsClick
  end
  object chkKeepBlanks: TTntCheckBox
    Left = 160
    Top = 120
    Width = 215
    Height = 17
    Caption = 'Keep trailing blanks'
    TabOrder = 10
    OnClick = chkTabStopsClick
  end
  object chkIndent: TTntCheckBox
    Left = 160
    Top = 144
    Width = 215
    Height = 17
    Caption = 'Block indent'
    TabOrder = 12
    OnClick = chkTabStopsClick
  end
  object chkMargin: TTntCheckBox
    Left = 160
    Top = 168
    Width = 215
    Height = 17
    Caption = 'Right margin'
    TabOrder = 14
    OnClick = chkTabStopsClick
  end
  object chkSpacing: TTntCheckBox
    Left = 160
    Top = 192
    Width = 215
    Height = 17
    Caption = 'Line spacing'
    TabOrder = 16
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
    TabOrder = 5
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
    TabOrder = 7
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
    TabOrder = 9
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
    TabOrder = 11
    OnChange = edTabStopsChange
    Items.Strings = (
      'Off'
      'On')
  end
  object chkTabColor: TTntCheckBox
    Left = 160
    Top = 240
    Width = 215
    Height = 17
    Caption = 'Tab color'
    TabOrder = 19
    OnClick = edTabStopsChange
  end
  object edTabColor: TColorBox
    Left = 376
    Top = 240
    Width = 153
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 20
    OnChange = edTabStopsChange
  end
  object DKLanguageController1: TDKLanguageController
    Left = 120
    Top = 184
    LangData = {
      0A00666D53657475704F7672010100000001000000070043617074696F6E011B
      00000006004C6162656C31010100000002000000070043617074696F6E000700
      4C6973744C657800000A00656454616253746F70730000060065645465787400
      00050063624F767201010000000A000000070043617074696F6E00080065644D
      617267696E00000900656453706163696E6700000B006564576F726443686172
      73010100000012000000040048696E74000E004C6162656C576F726443686172
      73010100000011000000070043617074696F6E000D004C6162656C5465787453
      686F7700000B0063686B4175746F436173650101000000150000000700436170
      74696F6E0011004C6162656C48656C704175746F43617365000008006564496E
      64656E7400000B0063686B54616253746F707301010000001B00000007004361
      7074696F6E000A0063686B5461624D6F646501010000001C0000000700436170
      74696F6E00070063686B5772617001010000001D000000070043617074696F6E
      000A0063686B4F707446696C6C01010000001E000000070043617074696F6E00
      0D0063686B4B656570426C616E6B7301010000001F000000070043617074696F
      6E00090063686B496E64656E74010100000020000000070043617074696F6E00
      090063686B4D617267696E010100000021000000070043617074696F6E000A00
      63686B53706163696E67010100000022000000070043617074696F6E00090065
      645461624D6F646501010000001700000005004974656D730006006564577261
      7001010000001800000005004974656D7300090065644F707446696C6C010100
      00001900000005004974656D73000C0065644B656570426C616E6B7301010000
      001A00000005004974656D73000B0063686B546162436F6C6F72010100000023
      000000070043617074696F6E000A006564546162436F6C6F720000}
  end
end
