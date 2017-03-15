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
    Top = 300
    Width = 112
    Height = 13
    Caption = 'Word chars (additional)'
  end
  object LabelHelpAutoCase: TTntLabel
    Left = 376
    Top = 226
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
    Top = 144
    Width = 57
    Height = 22
    MaxValue = 1000
    MinValue = 10
    TabOrder = 13
    Value = 1
    OnChange = edTabStopsChange
  end
  object edSpacing: TSpinEdit
    Left = 376
    Top = 168
    Width = 57
    Height = 22
    MaxValue = 10
    MinValue = -2
    TabOrder = 15
    Value = 0
    OnChange = edTabStopsChange
  end
  object edWordChars: TTntEdit
    Left = 376
    Top = 296
    Width = 153
    Height = 21
    Hint = 
      'Additional chars, which will be treated as part of words, by wor' +
      'd double-clicking, smart highlighting, etc.'
    TabOrder = 22
    OnChange = edTabStopsChange
  end
  object chkAutoCase: TTntCheckBox
    Left = 160
    Top = 224
    Width = 215
    Height = 17
    Caption = 'Auto-correct identifier case'
    TabOrder = 18
    OnClick = chkUpdate
  end
  object edIndent: TSpinEdit
    Left = 376
    Top = 120
    Width = 57
    Height = 22
    MaxValue = 32
    MinValue = -4
    TabOrder = 11
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
    OnClick = chkUpdate
  end
  object chkTabMode: TTntCheckBox
    Left = 160
    Top = 48
    Width = 215
    Height = 17
    Caption = 'Tab mode'
    TabOrder = 4
    OnClick = chkUpdate
  end
  object chkWrap: TTntCheckBox
    Left = 160
    Top = 72
    Width = 215
    Height = 17
    Caption = 'Wrap mode'
    TabOrder = 6
    OnClick = chkUpdate
  end
  object chkIndent: TTntCheckBox
    Left = 160
    Top = 120
    Width = 215
    Height = 17
    Caption = 'Block indent size (<0: in tabs)'
    TabOrder = 10
    OnClick = chkUpdate
  end
  object chkMargin: TTntCheckBox
    Left = 160
    Top = 144
    Width = 215
    Height = 17
    Caption = 'Right margin'
    TabOrder = 12
    OnClick = chkUpdate
  end
  object chkSpacing: TTntCheckBox
    Left = 160
    Top = 168
    Width = 215
    Height = 17
    Caption = 'Line spacing'
    TabOrder = 14
    OnClick = chkUpdate
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
  object edDeleteBlanks: TTntComboBox
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
  object chkTabColor: TTntCheckBox
    Left = 160
    Top = 272
    Width = 215
    Height = 17
    Caption = 'UI tab color'
    TabOrder = 20
    OnClick = chkUpdate
  end
  object edTabColor: TColorBox
    Left = 376
    Top = 270
    Width = 153
    Height = 22
    Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 21
    OnChange = edTabStopsChange
  end
  object chkColorUnderline: TTntCheckBox
    Left = 160
    Top = 248
    Width = 215
    Height = 17
    Caption = 'Underline HTML colors'
    TabOrder = 19
    OnClick = chkUpdate
  end
  object chkAutoShowACP: TTntCheckBox
    Left = 160
    Top = 188
    Width = 215
    Height = 33
    Caption = 'After typing ... chars, auto-show auto-complete (0: disabled)'
    TabOrder = 16
    WordWrap = True
    OnClick = chkUpdate
  end
  object edAutoShowACP: TSpinEdit
    Left = 376
    Top = 192
    Width = 57
    Height = 22
    MaxValue = 20
    MinValue = 0
    TabOrder = 17
    Value = 0
    OnChange = edTabStopsChange
  end
  object chkDeleteBlanks: TTntCheckBox
    Left = 160
    Top = 96
    Width = 209
    Height = 17
    Caption = 'Delete trailing blanks on save'
    TabOrder = 8
    OnClick = chkUpdate
  end
  object DKLang1: TDKLanguageController
    Left = 48
    Top = 200
    LangData = {
      0A00666D53657475704F7672010100000001000000070043617074696F6E011A
      00000006004C6162656C31010100000002000000070043617074696F6E000700
      4C6973744C657800000A00656454616253746F70730000050063624F76720101
      0000000A000000070043617074696F6E00080065644D617267696E0000090065
      6453706163696E6700000B006564576F72644368617273010100000012000000
      040048696E74000E004C6162656C576F72644368617273010100000011000000
      070043617074696F6E000B0063686B4175746F43617365010100000015000000
      070043617074696F6E0011004C6162656C48656C704175746F43617365000008
      006564496E64656E7400000B0063686B54616253746F707301010000001B0000
      00070043617074696F6E000A0063686B5461624D6F646501010000001C000000
      070043617074696F6E00070063686B5772617001010000001D00000007004361
      7074696F6E00090063686B496E64656E74010100000020000000070043617074
      696F6E00090063686B4D617267696E010100000021000000070043617074696F
      6E000A0063686B53706163696E67010100000022000000070043617074696F6E
      00090065645461624D6F646501010000001700000005004974656D7300060065
      645772617001010000001800000005004974656D73000E00656444656C657465
      426C616E6B7301010000001A00000005004974656D73000B0063686B54616243
      6F6C6F72010100000023000000070043617074696F6E000A006564546162436F
      6C6F720000110063686B436F6C6F72556E6465726C696E650101000000240000
      00070043617074696F6E000E0063686B4175746F53686F774143500101000000
      25000000070043617074696F6E000D0065644175746F53686F7741435000000F
      0063686B44656C657465426C616E6B7301010000002600000007004361707469
      6F6E00}
  end
end
