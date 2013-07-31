object fmExtract: TfmExtract
  Left = 305
  Top = 426
  Width = 453
  Height = 313
  ActiveControl = ed
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Extract strings'
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
  object PanelRt: TPanel
    Left = 321
    Top = 0
    Width = 124
    Height = 279
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 2
    object bFind: TTntButton
      Left = 8
      Top = 8
      Width = 105
      Height = 23
      Caption = 'Find'
      Default = True
      TabOrder = 0
      OnClick = bFindClick
    end
    object bCopy: TTntButton
      Left = 8
      Top = 36
      Width = 105
      Height = 23
      Caption = 'Copy to clipboard'
      Enabled = False
      TabOrder = 1
      OnClick = bCopyClick
    end
    object bTab: TTntButton
      Left = 8
      Top = 64
      Width = 105
      Height = 23
      Caption = 'Copy to tab'
      Enabled = False
      ModalResult = 6
      TabOrder = 2
      OnClick = bTabClick
    end
    object bHelp: TTntButton
      Left = 8
      Top = 100
      Width = 105
      Height = 23
      Caption = 'Help'
      TabOrder = 3
      OnClick = bHelpClick
    end
    object bCan: TTntButton
      Left = 8
      Top = 128
      Width = 105
      Height = 23
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 4
    end
  end
  object PanelMid: TPanel
    Left = 9
    Top = 0
    Width = 312
    Height = 279
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object b1: TTntGroupBox
      Left = 0
      Top = 0
      Width = 312
      Height = 113
      Align = alTop
      Caption = 'Search'
      TabOrder = 0
      DesignSize = (
        312
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
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 0
        OnKeyDown = edKeyDown
        OnKeyPress = edKeyPress
      end
      object bCase: TTntCheckBox
        Left = 8
        Top = 56
        Width = 299
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Case sensitive'
        TabOrder = 1
      end
      object bSel: TTntCheckBox
        Left = 8
        Top = 72
        Width = 299
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Search in selection only'
        TabOrder = 2
      end
      object bCur: TTntCheckBox
        Left = 8
        Top = 88
        Width = 299
        Height = 17
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Search from caret'
        TabOrder = 3
      end
    end
    object b2: TTntGroupBox
      Left = 0
      Top = 113
      Width = 312
      Height = 166
      Align = alClient
      Caption = 'Found strings'
      TabOrder = 1
      object List: TTntListBox
        Left = 2
        Top = 15
        Width = 308
        Height = 149
        Style = lbOwnerDrawFixed
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
        OnDrawItem = ListDrawItem
      end
    end
  end
  object PanelLeft: TPanel
    Left = 0
    Top = 0
    Width = 9
    Height = 279
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 0
  end
  object DKLanguageController1: TDKLanguageController
    Left = 296
    Top = 56
    LangData = {
      0900666D45787472616374010100000001000000070043617074696F6E011100
      0000070050616E656C5274000005006246696E64010100000002000000070043
      617074696F6E00050062436F7079010100000003000000070043617074696F6E
      00040062546162010100000004000000070043617074696F6E0005006248656C
      70010100000005000000070043617074696F6E0004006243616E010100000006
      000000070043617074696F6E00080050616E656C4D6964000002006231010100
      000007000000070043617074696F6E000900546E744C6162656C310101000000
      08000000070043617074696F6E0006006C61624E6F7401010000000900000007
      0043617074696F6E000200656400000500624361736501010000000A00000007
      0043617074696F6E0004006253656C01010000000B000000070043617074696F
      6E0004006243757201010000000C000000070043617074696F6E000200623201
      010000000D000000070043617074696F6E0004004C6973740000090050616E65
      6C4C6566740000}
  end
end
