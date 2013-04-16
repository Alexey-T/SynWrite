object fmAb: TfmAb
  Left = 156
  Top = 114
  ActiveControl = Button1
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 242
  ClientWidth = 330
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  ShowHint = True
  PixelsPerInch = 96
  TextHeight = 13
  object LabelW0: TTntLabel
    Left = 96
    Top = 4
    Width = 96
    Height = 25
    Caption = 'SynWrite'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object LabelWV: TLabel
    Left = 96
    Top = 32
    Width = 16
    Height = 13
    Caption = 'ver'
  end
  object GroupBox4: TTntGroupBox
    Left = 8
    Top = 44
    Width = 313
    Height = 89
    Caption = 'About'
    TabOrder = 0
    object Label12: TTntLabel
      Left = 8
      Top = 32
      Width = 27
      Height = 13
      Caption = 'Sites:'
    end
    object Label11: TTntLabel
      Left = 8
      Top = 48
      Width = 39
      Height = 13
      Caption = 'Forums:'
    end
    object Label9: TTntLabel
      Left = 8
      Top = 16
      Width = 37
      Height = 13
      Caption = 'Author:'
    end
    object LabelWn: TTntLabel
      Left = 88
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Alexey T.'
    end
    object Labelw2: TTntLabel
      Left = 160
      Top = 32
      Width = 61
      Height = 13
      Cursor = crHandPoint
      Hint = 'https://sourceforge.net/projects/synwrite/'
      Caption = 'SourceForge'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Labelw2Click
    end
    object Label4: TTntLabel
      Left = 8
      Top = 64
      Width = 28
      Height = 13
      Caption = 'Email:'
    end
    object LabelWEm: TTntLabel
      Left = 88
      Top = 64
      Width = 123
      Height = 13
      Cursor = crHandPoint
      Hint = 'mailto:support@uvviewsoft.com'
      Caption = 'support@uvviewsoft.com'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = LabelWEmClick
    end
    object Labelw3: TTntLabel
      Left = 88
      Top = 32
      Width = 55
      Height = 13
      Cursor = crHandPoint
      Hint = 'http://www.uvviewsoft.com/synwrite/'
      Caption = 'UVViewSoft'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = Labelw3Click
    end
    object LabelForum: TTntLabel
      Left = 88
      Top = 48
      Width = 62
      Height = 13
      Cursor = crHandPoint
      Hint = 'http://synwrite.sourceforge.net/forums/'
      Caption = 'official forum'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = LabelForumClick
    end
  end
  object GroupBox5: TTntGroupBox
    Left = 8
    Top = 136
    Width = 313
    Height = 69
    Caption = 'Components'
    TabOrder = 1
    object LabelW1: TTntLabel
      Left = 88
      Top = 16
      Width = 109
      Height = 13
      Cursor = crHandPoint
      Hint = 'http://www.econtrol.ru/'
      Caption = 'EControl Syntax Editor'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      OnClick = LabelW1Click
    end
    object LabelWA: TTntLabel
      Left = 88
      Top = 32
      Width = 217
      Height = 29
      Cursor = crHandPoint
      Hint = 'http://www.addictivesoftware.com/'
      AutoSize = False
      Caption = 'Spelling engine powered by Addictive Software'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      WordWrap = True
      OnClick = LabelWAClick
    end
  end
  object Button1: TTntButton
    Left = 120
    Top = 212
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'OK'
    Default = True
    TabOrder = 2
    OnClick = Button1Click
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      '*.Hint'
      'Labelw*')
    Left = 296
    Top = 88
    LangData = {
      0400666D4162010100000001000000070043617074696F6E011000000007004C
      6162656C57300000090047726F7570426F783401010000000400000007004361
      7074696F6E0007004C6162656C3132010100000005000000070043617074696F
      6E0007004C6162656C3131010100000006000000070043617074696F6E000600
      4C6162656C39010100000007000000070043617074696F6E0007004C6162656C
      576E000007004C6162656C7732000006004C6162656C3401010000000D000000
      070043617074696F6E0008004C6162656C57456D0000090047726F7570426F78
      3501010000000F000000070043617074696F6E0007004C6162656C5731000007
      00427574746F6E31010100000018000000070043617074696F6E0007004C6162
      656C5756000007004C6162656C7733000007004C6162656C574100000A004C61
      62656C466F72756D010100000019000000070043617074696F6E00}
  end
end
