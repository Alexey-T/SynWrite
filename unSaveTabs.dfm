object fmSaveTabs: TfmSaveTabs
  Left = 331
  Top = 477
  BorderStyle = bsDialog
  Caption = 'Save tabs?'
  ClientHeight = 265
  ClientWidth = 551
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bYes: TTntButton
    Left = 424
    Top = 64
    Width = 120
    Height = 23
    Caption = 'Save'
    Default = True
    ModalResult = 6
    TabOrder = 1
  end
  object bNo: TTntButton
    Left = 424
    Top = 94
    Width = 120
    Height = 23
    Caption = 'Don'#39't save'
    ModalResult = 7
    TabOrder = 2
  end
  object List: TTntCheckListBox
    Left = 8
    Top = 8
    Width = 409
    Height = 249
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object bCancel: TTntButton
    Left = 423
    Top = 174
    Width = 120
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object DKLanguageController1: TDKLanguageController
    Left = 424
    Top = 208
    LangData = {
      0A00666D5361766554616273010100000001000000070043617074696F6E0104
      000000040062596573010100000002000000070043617074696F6E000300624E
      6F010100000003000000070043617074696F6E0004004C697374000007006243
      616E63656C010100000004000000070043617074696F6E00}
  end
end
