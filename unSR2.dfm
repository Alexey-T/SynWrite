object fmSRFiles: TfmSRFiles
  Left = 263
  Top = 253
  ActiveControl = ed1
  BorderStyle = bsDialog
  Caption = 'Find/Replace in files'
  ClientHeight = 425
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TTntLabel
    Left = 8
    Top = 4
    Width = 54
    Height = 13
    Caption = '&Search for:'
    FocusControl = ed1
  end
  object Label4: TTntLabel
    Left = 8
    Top = 44
    Width = 65
    Height = 13
    Caption = '&Replace with:'
    FocusControl = ed2
  end
  object TntLabel1: TTntLabel
    Left = 8
    Top = 152
    Width = 79
    Height = 13
    Caption = 'Search in f&older:'
    FocusControl = edDir
  end
  object TntLabel2: TTntLabel
    Left = 8
    Top = 84
    Width = 147
    Height = 13
    Caption = 'File mas&k(s), space separated:'
    FocusControl = edFile
  end
  object LabelErr: TTntLabel
    Left = 292
    Top = 4
    Width = 10
    Height = 13
    Alignment = taRightJustify
    Caption = '--'
    FocusControl = ed1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object labFind: TTntLabel
    Left = 336
    Top = 140
    Width = 26
    Height = 13
    Cursor = crHandPoint
    Caption = 'Mode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labFindClick
  end
  object labFindRep: TTntLabel
    Left = 336
    Top = 156
    Width = 26
    Height = 13
    Cursor = crHandPoint
    Caption = 'Mode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labFindRepClick
  end
  object ed1: TTntComboBox
    Left = 8
    Top = 20
    Width = 321
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 0
    OnChange = ed1Change
    OnKeyDown = ed1KeyDown
  end
  object ed2: TTntComboBox
    Left = 8
    Top = 60
    Width = 321
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 1
    OnKeyDown = ed2KeyDown
  end
  object bHelp: TTntButton
    Left = 392
    Top = 200
    Width = 114
    Height = 25
    Caption = 'Help'
    TabOrder = 14
    Visible = False
    OnClick = bHelpClick
  end
  object bCan: TTntButton
    Left = 336
    Top = 74
    Width = 114
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 15
  end
  object gOp: TTntGroupBox
    Left = 8
    Top = 240
    Width = 185
    Height = 141
    Caption = 'Options for text search'
    TabOrder = 9
    object Bevel1: TBevel
      Left = 8
      Top = 84
      Width = 169
      Height = 5
      Shape = bsTopLine
    end
    object cbRE: TTntCheckBox
      Left = 8
      Top = 48
      Width = 174
      Height = 17
      Caption = 'Regular e&xpressions'
      TabOrder = 2
      OnClick = cbREClick
    end
    object cbCase: TTntCheckBox
      Left = 8
      Top = 16
      Width = 174
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 0
    end
    object cbWords: TTntCheckBox
      Left = 8
      Top = 32
      Width = 174
      Height = 17
      Caption = '&Whole words'
      TabOrder = 1
    end
    object cbSpec: TTntCheckBox
      Left = 8
      Top = 64
      Width = 174
      Height = 17
      Caption = 'S&pecial chars (\n \r \t...)'
      TabOrder = 3
      OnClick = cbSpecClick
    end
    object cbInOEM: TTntCheckBox
      Left = 8
      Top = 88
      Width = 174
      Height = 17
      Caption = 'Search also in OE&M'
      TabOrder = 4
    end
    object cbInUTF8: TTntCheckBox
      Left = 8
      Top = 104
      Width = 174
      Height = 17
      Caption = 'Search also in UTF-&8'
      TabOrder = 5
    end
    object cbInUTF16: TTntCheckBox
      Left = 8
      Top = 120
      Width = 174
      Height = 17
      Caption = 'Search also in UTF-1&6'
      TabOrder = 6
    end
  end
  object edDir: TTntComboBox
    Left = 8
    Top = 168
    Width = 321
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 5
    OnChange = edDirChange
    OnKeyDown = edDirKeyDown
  end
  object bRAll: TTntButton
    Left = 336
    Top = 38
    Width = 114
    Height = 25
    Caption = 'Replace all'
    TabOrder = 13
  end
  object cbSubDir: TTntCheckBox
    Left = 8
    Top = 192
    Width = 305
    Height = 17
    Caption = 'With all s&ubfolders'
    TabOrder = 6
  end
  object bBrowseDir: TTntButton
    Left = 8
    Top = 212
    Width = 113
    Height = 23
    Caption = '&Browse for folder...'
    TabOrder = 7
    OnClick = bBrowseDirClick
  end
  object edFile: TTntComboBox
    Left = 8
    Top = 100
    Width = 321
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 2
    OnChange = edFileChange
    OnKeyDown = edFileKeyDown
  end
  object bFAll: TTntButton
    Left = 336
    Top = 8
    Width = 114
    Height = 25
    Caption = '&Find all'
    Default = True
    Enabled = False
    TabOrder = 12
  end
  object bCurrDir: TTntButton
    Left = 128
    Top = 212
    Width = 113
    Height = 23
    Caption = 'Curre&nt folder'
    TabOrder = 8
    OnClick = bCurrDirClick
  end
  object gFile: TTntGroupBox
    Left = 200
    Top = 240
    Width = 249
    Height = 109
    Caption = 'Options for files search'
    TabOrder = 10
    object TntLabel3: TTntLabel
      Left = 8
      Top = 84
      Width = 46
      Height = 13
      Caption = 'Sort files:'
      FocusControl = edSort
    end
    object cbNoBin: TTntCheckBox
      Left = 8
      Top = 16
      Width = 238
      Height = 17
      Caption = 'Skip b&inary files'
      TabOrder = 0
    end
    object cbNoRO: TTntCheckBox
      Left = 8
      Top = 32
      Width = 238
      Height = 17
      Caption = 'Skip r&ead-only files'
      TabOrder = 1
    end
    object cbNoHid: TTntCheckBox
      Left = 8
      Top = 48
      Width = 238
      Height = 17
      Caption = 'Skip &hidden files'
      TabOrder = 2
    end
    object cbNoHid2: TTntCheckBox
      Left = 8
      Top = 64
      Width = 238
      Height = 17
      Caption = 'Skip hi&dden folders'
      TabOrder = 3
    end
    object edSort: TTntComboBox
      Left = 112
      Top = 80
      Width = 129
      Height = 21
      Style = csDropDownList
      DropDownCount = 15
      ItemHeight = 13
      TabOrder = 4
      OnChange = edDirChange
    end
  end
  object gRes: TTntGroupBox
    Left = 200
    Top = 352
    Width = 249
    Height = 69
    Caption = 'Result list'
    TabOrder = 11
    object cbFnOnly: TTntCheckBox
      Left = 8
      Top = 32
      Width = 238
      Height = 17
      Caption = 'Show filenames onl&y'
      TabOrder = 1
    end
    object cbOutTab: TTntCheckBox
      Left = 8
      Top = 16
      Width = 238
      Height = 17
      Caption = 'Show results in edi&tor tab'
      TabOrder = 0
      OnClick = cbOutTabClick
    end
    object cbOutAppend: TTntCheckBox
      Left = 8
      Top = 48
      Width = 238
      Height = 17
      Caption = '&Append results list'
      TabOrder = 2
    end
  end
  object bCurFile: TTntButton
    Left = 128
    Top = 126
    Width = 113
    Height = 23
    Caption = 'Current file'
    TabOrder = 4
    OnClick = bCurFileClick
  end
  object bBrowseFile: TTntButton
    Left = 8
    Top = 126
    Width = 113
    Height = 23
    Caption = 'Browse for fi&le...'
    TabOrder = 3
    OnClick = bBrowseFileClick
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'labFind*.*')
    Left = 408
    Top = 140
    LangData = {
      0900666D535246696C6573010100000001000000070043617074696F6E012A00
      000006004C6162656C32010100000002000000070043617074696F6E0006004C
      6162656C34010100000003000000070043617074696F6E000900546E744C6162
      656C31010100000004000000070043617074696F6E000900546E744C6162656C
      32010100000005000000070043617074696F6E00030065643100000300656432
      000005006248656C70010100000006000000070043617074696F6E0004006243
      616E010100000007000000070043617074696F6E000300674F70010100000008
      000000070043617074696F6E0004006362524501010000000900000007004361
      7074696F6E00060063624361736501010000000A000000070043617074696F6E
      0007006362576F72647301010000000B000000070043617074696F6E00060063
      625370656301010000000C000000070043617074696F6E000500656444697200
      0005006252416C6C01010000000D000000070043617074696F6E000800636253
      756244697201010000000E000000070043617074696F6E000A006242726F7773
      6544697201010000000F000000070043617074696F6E000600656446696C6500
      0005006246416C6C010100000010000000070043617074696F6E000800624375
      7272446972010100000011000000070043617074696F6E0005006746696C6501
      0100000012000000070043617074696F6E00070063624E6F42696E0101000000
      13000000070043617074696F6E00060063624E6F524F01010000001400000007
      0043617074696F6E00070063624E6F4869640101000000150000000700436170
      74696F6E00080063624E6F48696432010100000016000000070043617074696F
      6E00040067526573010100000017000000070043617074696F6E000800636246
      6E4F6E6C79010100000018000000070043617074696F6E00080063624F757454
      6162010100000019000000070043617074696F6E0008004C6162656C45727200
      00060054696D657231000008006243757246696C6501010000001A0000000700
      43617074696F6E0007006362496E4F454D01010000001B000000070043617074
      696F6E000600426576656C31000008006362496E5554463801010000001C0000
      00070043617074696F6E0009006362496E555446313601010000001D00000007
      0043617074696F6E000B006242726F77736546696C6501010000001E00000007
      0043617074696F6E000E00546E744F70656E4469616C6F6731000007006C6162
      46696E6400000A006C616246696E6452657000000B0063624F7574417070656E
      6401010000001F000000070043617074696F6E000900546E744C6162656C3301
      0100000020000000070043617074696F6E0006006564536F72740000}
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 408
    Top = 168
  end
  object TntOpenDialog1: TTntOpenDialog
    Filter = '*.*|*.*'
    Left = 376
    Top = 140
  end
end
