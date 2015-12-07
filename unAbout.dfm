object fmAbout: TfmAbout
  Left = 156
  Top = 114
  ActiveControl = Button1
  BorderStyle = bsDialog
  Caption = 'About'
  ClientHeight = 226
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
  object LabelWTitle: TTntLabel
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
  object LabelWVersion: TLabel
    Left = 96
    Top = 32
    Width = 8
    Height = 13
    Caption = '--'
  end
  object gInfo: TTntGroupBox
    Left = 8
    Top = 44
    Width = 313
    Height = 69
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
    object LabelWName: TTntLabel
      Left = 88
      Top = 16
      Width = 46
      Height = 13
      Caption = 'Alexey T.'
    end
    object LabelWSite2: TTntLabel
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
      OnClick = LabelWSite2Click
    end
    object LabelWSite: TTntLabel
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
      OnClick = LabelWSiteClick
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
  object gComp: TTntGroupBox
    Left = 8
    Top = 120
    Width = 313
    Height = 69
    Caption = 'Components'
    TabOrder = 1
    object LabelWComp1: TTntLabel
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
      OnClick = LabelWComp1Click
    end
    object LabelWComp2: TTntLabel
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
      OnClick = LabelWComp2Click
    end
  end
  object Button1: TTntButton
    Left = 120
    Top = 196
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
    SectionName = 'fmAb'
    Left = 216
    Top = 8
    LangData = {
      0700666D41626F7574010100000001000000070043617074696F6E010E000000
      0B004C6162656C575469746C650000050067496E666F01010000000400000007
      0043617074696F6E0007004C6162656C31320101000000050000000700436170
      74696F6E0007004C6162656C3131010100000006000000070043617074696F6E
      0006004C6162656C39010100000007000000070043617074696F6E000A004C61
      62656C574E616D6500000B004C6162656C5753697465320000050067436F6D70
      01010000000F000000070043617074696F6E000B004C6162656C57436F6D7031
      00000700427574746F6E31010100000018000000070043617074696F6E000D00
      4C6162656C5756657273696F6E00000A004C6162656C575369746500000B004C
      6162656C57436F6D703200000A004C6162656C466F72756D0101000000190000
      00070043617074696F6E00}
  end
end
