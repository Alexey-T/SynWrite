object fmExtract: TfmExtract
  Left = 258
  Top = 326
  ActiveControl = ed
  BorderIcons = [biSystemMenu, biMaximize]
  BorderStyle = bsDialog
  Caption = 'Extract strings'
  ClientHeight = 271
  ClientWidth = 441
  Color = clBtnFace
  Constraints.MinHeight = 200
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object b1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 313
    Height = 113
    Caption = 'Search'
    TabOrder = 0
    DesignSize = (
      313
      113)
    object TntLabel1: TTntLabel
      Left = 8
      Top = 16
      Width = 96
      Height = 13
      Caption = 'Regular expression:'
    end
    object labNot: TTntLabel
      Left = 240
      Top = 16
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Not found...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object ed: TTntComboBox
      Left = 8
      Top = 32
      Width = 297
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      OnKeyDown = edKeyDown
    end
    object bCase: TTntCheckBox
      Left = 8
      Top = 56
      Width = 300
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Case sensitive'
      TabOrder = 1
    end
    object bSel: TTntCheckBox
      Left = 8
      Top = 72
      Width = 300
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Search in selection only'
      TabOrder = 2
    end
    object bCur: TTntCheckBox
      Left = 8
      Top = 88
      Width = 300
      Height = 17
      Anchors = [akLeft, akTop, akRight]
      Caption = 'Search from cursor'
      TabOrder = 3
    end
  end
  object bFind: TTntButton
    Left = 328
    Top = 8
    Width = 105
    Height = 23
    Caption = 'Find'
    Default = True
    TabOrder = 2
    OnClick = bFindClick
  end
  object bCopy: TTntButton
    Left = 328
    Top = 36
    Width = 105
    Height = 23
    Caption = 'Copy to clipboard'
    Enabled = False
    TabOrder = 3
    OnClick = bCopyClick
  end
  object b2: TTntGroupBox
    Left = 8
    Top = 120
    Width = 313
    Height = 147
    Caption = 'Preview of found strings'
    TabOrder = 1
    object List: TTntListBox
      Left = 2
      Top = 15
      Width = 309
      Height = 130
      Style = lbOwnerDrawFixed
      Align = alClient
      ItemHeight = 13
      TabOrder = 0
      OnDrawItem = ListDrawItem
    end
  end
  object bCan: TTntButton
    Left = 328
    Top = 128
    Width = 105
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object bHelp: TTntButton
    Left = 328
    Top = 100
    Width = 105
    Height = 23
    Caption = 'Help'
    TabOrder = 5
    OnClick = bHelpClick
  end
  object bTab: TTntButton
    Left = 328
    Top = 64
    Width = 105
    Height = 23
    Caption = 'Copy to tab'
    Enabled = False
    ModalResult = 6
    TabOrder = 4
    OnClick = bTabClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 328
    Top = 136
    LangData = {
      0900666D45787472616374010100000001000000070043617074696F6E010E00
      000002006231010100000002000000070043617074696F6E000900546E744C61
      62656C31010100000003000000070043617074696F6E00020065640000050062
      43617365010100000004000000070043617074696F6E0005006246696E640101
      00000005000000070043617074696F6E00050062436F70790101000000060000
      00070043617074696F6E0002006232010100000007000000070043617074696F
      6E0004004C697374000004006243616E01010000000800000007004361707469
      6F6E0005006248656C70010100000009000000070043617074696F6E00040062
      53656C01010000000A000000070043617074696F6E0004006254616201010000
      000B000000070043617074696F6E0004006243757201010000000C0000000700
      43617074696F6E0006006C61624E6F7401010000000D00000007004361707469
      6F6E00}
  end
end
