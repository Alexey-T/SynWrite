object fmLexerImportRules: TfmLexerImportRules
  Left = 304
  Top = 202
  ActiveControl = LList
  BorderStyle = bsDialog
  Caption = 'Import rules/styles'
  ClientHeight = 318
  ClientWidth = 570
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 8
    Width = 36
    Height = 13
    Caption = 'Lexers:'
  end
  object Label2: TTntLabel
    Left = 288
    Top = 8
    Width = 137
    Height = 13
    Caption = 'Select rules/styles to import:'
  end
  object bOk: TTntButton
    Left = 376
    Top = 288
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object bCancel: TTntButton
    Left = 472
    Top = 288
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object LList: TListBox
    Left = 8
    Top = 24
    Width = 273
    Height = 257
    ItemHeight = 13
    TabOrder = 0
    OnClick = LListClick
  end
  object RuleList: TListView
    Left = 288
    Top = 24
    Width = 273
    Height = 257
    Checkboxes = True
    Columns = <
      item
        Width = 250
      end>
    ReadOnly = True
    RowSelect = True
    ShowColumnHeaders = False
    TabOrder = 1
    ViewStyle = vsReport
    OnClick = RuleListClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 464
    Top = 12
    LangData = {
      1200666D4C65786572496D706F727452756C6573010100000001000000070043
      617074696F6E010600000006004C6162656C3101010000000200000007004361
      7074696F6E0006004C6162656C32010100000003000000070043617074696F6E
      000300624F6B010100000004000000070043617074696F6E0007006243616E63
      656C010100000005000000070043617074696F6E0005004C4C69737400000800
      52756C654C6973740000}
  end
end
