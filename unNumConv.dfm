object fmNumConv: TfmNumConv
  Left = 328
  Top = 320
  ActiveControl = edDec
  BorderStyle = bsDialog
  Caption = 'Numeric converter'
  ClientHeight = 203
  ClientWidth = 514
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object LabelErr: TTntLabel
    Left = 96
    Top = 172
    Width = 62
    Height = 13
    Caption = 'Invalid string'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    Visible = False
  end
  object GroupBox1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 497
    Height = 161
    TabOrder = 0
    object Label1: TTntLabel
      Left = 8
      Top = 48
      Width = 40
      Height = 13
      Caption = '&Decimal:'
      FocusControl = edDec
    end
    object Label2: TTntLabel
      Left = 8
      Top = 76
      Width = 23
      Height = 13
      Caption = '&Hex:'
      FocusControl = edHex
    end
    object Label3: TTntLabel
      Left = 8
      Top = 104
      Width = 34
      Height = 13
      Caption = '&Binary:'
      FocusControl = edBin
    end
    object Label4: TTntLabel
      Left = 8
      Top = 132
      Width = 29
      Height = 13
      Caption = '&Octal:'
      FocusControl = edOct
    end
    object TntLabel1: TTntLabel
      Left = 8
      Top = 20
      Width = 32
      Height = 13
      Caption = '&ASCII:'
      FocusControl = edChar
    end
    object edDec: TTntEdit
      Left = 88
      Top = 44
      Width = 241
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnChange = edDecChange
    end
    object edHex: TTntEdit
      Left = 88
      Top = 72
      Width = 241
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnChange = edHexChange
    end
    object edBin: TTntEdit
      Left = 88
      Top = 100
      Width = 241
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 9
      OnChange = edBinChange
    end
    object edOct: TTntEdit
      Left = 88
      Top = 128
      Width = 241
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 12
      OnChange = edOctChange
    end
    object bCopyDec: TTntButton
      Left = 336
      Top = 44
      Width = 73
      Height = 23
      Caption = 'Copy'
      TabOrder = 4
      OnClick = bCopyDecClick
    end
    object bInsDec: TTntButton
      Left = 416
      Top = 44
      Width = 73
      Height = 23
      Caption = 'Insert'
      TabOrder = 5
      OnClick = bInsDecClick
    end
    object bInsHex: TTntButton
      Left = 416
      Top = 72
      Width = 73
      Height = 23
      Caption = 'Insert'
      TabOrder = 8
      OnClick = bInsHexClick
    end
    object bCopyHex: TTntButton
      Left = 336
      Top = 72
      Width = 73
      Height = 23
      Caption = 'Copy'
      TabOrder = 7
      OnClick = bCopyHexClick
    end
    object bInsBin: TTntButton
      Left = 416
      Top = 100
      Width = 73
      Height = 23
      Caption = 'Insert'
      TabOrder = 11
      OnClick = bInsBinClick
    end
    object bCopyBin: TTntButton
      Left = 336
      Top = 100
      Width = 73
      Height = 23
      Caption = 'Copy'
      TabOrder = 10
      OnClick = bCopyBinClick
    end
    object bInsOct: TTntButton
      Left = 416
      Top = 128
      Width = 73
      Height = 23
      Caption = 'Insert'
      TabOrder = 14
      OnClick = bInsOctClick
    end
    object bCopyOct: TTntButton
      Left = 336
      Top = 128
      Width = 73
      Height = 23
      Caption = 'Copy'
      TabOrder = 13
      OnClick = bCopyOctClick
    end
    object edChar: TTntEdit
      Left = 88
      Top = 16
      Width = 41
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 1
      ParentFont = False
      TabOrder = 0
      OnChange = edCharChange
    end
    object bCopyChar: TTntButton
      Left = 336
      Top = 16
      Width = 73
      Height = 23
      Caption = 'Copy'
      TabOrder = 1
      OnClick = bCopyCharClick
    end
    object bInsChar: TTntButton
      Left = 416
      Top = 16
      Width = 73
      Height = 23
      Caption = 'Insert'
      TabOrder = 2
      OnClick = bInsCharClick
    end
  end
  object bClose: TTntButton
    Left = 408
    Top = 172
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Close'
    TabOrder = 1
    OnClick = bCloseClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 344
    Top = 164
    LangData = {
      0900666D4E756D436F6E76010100000001000000070043617074696F6E011700
      000008004C6162656C457272010100000002000000070043617074696F6E0009
      0047726F7570426F7831000006004C6162656C31010100000003000000070043
      617074696F6E0006004C6162656C32010100000004000000070043617074696F
      6E0006004C6162656C33010100000005000000070043617074696F6E0006004C
      6162656C34010100000006000000070043617074696F6E000900546E744C6162
      656C31010100000007000000070043617074696F6E0005006564446563000005
      00656448657800000500656442696E0000050065644F63740000080062436F70
      7944656301010000000B000000070043617074696F6E00070062496E73446563
      01010000000C000000070043617074696F6E00070062496E7348657801010000
      000D000000070043617074696F6E00080062436F707948657801010000000E00
      0000070043617074696F6E00070062496E7342696E01010000000F0000000700
      43617074696F6E00080062436F707942696E0101000000100000000700436170
      74696F6E00070062496E734F6374010100000011000000070043617074696F6E
      00080062436F70794F6374010100000012000000070043617074696F6E000600
      6564436861720000090062436F70794368617201010000000800000007004361
      7074696F6E00080062496E734368617201010000000900000007004361707469
      6F6E00060062436C6F736501010000000A000000070043617074696F6E00}
  end
end
