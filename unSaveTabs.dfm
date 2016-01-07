object fmSaveTabs: TfmSaveTabs
  Left = 331
  Top = 477
  Width = 537
  Height = 292
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Save tabs?'
  Color = clBtnFace
  Constraints.MinHeight = 250
  Constraints.MinWidth = 250
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
  object List: TTntCheckListBox
    Left = 0
    Top = 0
    Width = 521
    Height = 222
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object Panel1: TPanel
    Left = 0
    Top = 222
    Width = 521
    Height = 31
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object bYes: TTntButton
      Left = 310
      Top = 6
      Width = 100
      Height = 23
      Caption = '&Save'
      Default = True
      ModalResult = 6
      TabOrder = 0
    end
    object bNo: TTntButton
      Left = 414
      Top = 6
      Width = 100
      Height = 23
      Caption = '&Ignore'
      ModalResult = 7
      TabOrder = 1
    end
    object bCancel: TTntButton
      Left = 6
      Top = 6
      Width = 100
      Height = 23
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 2
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 296
    Top = 24
    LangData = {
      0A00666D5361766554616273010100000001000000070043617074696F6E0105
      00000004004C6973740000060050616E656C3100000400625965730101000000
      02000000070043617074696F6E000300624E6F01010000000300000007004361
      7074696F6E0007006243616E63656C010100000004000000070043617074696F
      6E00}
  end
end
