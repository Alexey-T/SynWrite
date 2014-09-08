object fmSRFiles: TfmSRFiles
  Left = 263
  Top = 253
  ActiveControl = ed1
  BorderStyle = bsDialog
  Caption = 'Find/Replace in files'
  ClientHeight = 484
  ClientWidth = 497
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
  object labInProject: TTntLabel
    Left = 24
    Top = 192
    Width = 151
    Height = 13
    Caption = 'Search in project files activated'
    FocusControl = edDir
    Visible = False
  end
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
  object labInDir: TTntLabel
    Left = 8
    Top = 192
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
    FocusControl = edFileInc
  end
  object LabelErr: TTntLabel
    Left = 340
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
    Left = 384
    Top = 148
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
    Left = 384
    Top = 164
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
  object labMaskExc: TTntLabel
    Left = 8
    Top = 152
    Width = 264
    Height = 13
    Caption = 'File and "folder\" mask(s) to exclude, space separated:'
    FocusControl = edFileExc
  end
  object labFav: TTntLabel
    Left = 384
    Top = 112
    Width = 59
    Height = 13
    Cursor = crHandPoint
    Caption = 'Presets (F3)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labFavClick
  end
  object labPreset: TTntLabel
    Left = 384
    Top = 126
    Width = 12
    Height = 13
    Caption = '    '
    FocusControl = edDir
  end
  object ed1: TTntComboBox
    Left = 8
    Top = 20
    Width = 361
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 0
    OnChange = ed1Change
    OnKeyDown = ed1KeyDown
    OnKeyPress = ed1KeyPress
  end
  object ed2: TTntComboBox
    Left = 8
    Top = 60
    Width = 361
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 1
    OnKeyDown = ed2KeyDown
    OnKeyPress = ed1KeyPress
  end
  object bHelp: TTntButton
    Left = 432
    Top = 200
    Width = 114
    Height = 25
    Caption = 'Help'
    TabOrder = 15
    Visible = False
    OnClick = bHelpClick
  end
  object bCan: TTntButton
    Left = 376
    Top = 74
    Width = 114
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 16
  end
  object gOp: TTntGroupBox
    Left = 8
    Top = 280
    Width = 209
    Height = 141
    Caption = 'Options for text search'
    TabOrder = 10
    object Bevel1: TBevel
      Left = 8
      Top = 84
      Width = 193
      Height = 5
      Shape = bsTopLine
    end
    object cbRE: TTntCheckBox
      Left = 8
      Top = 48
      Width = 198
      Height = 17
      Caption = 'Regular e&xpressions'
      TabOrder = 2
      OnClick = cbREClick
    end
    object cbCase: TTntCheckBox
      Left = 8
      Top = 16
      Width = 198
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 0
    end
    object cbWords: TTntCheckBox
      Left = 8
      Top = 32
      Width = 198
      Height = 17
      Caption = '&Whole words'
      TabOrder = 1
    end
    object cbSpec: TTntCheckBox
      Left = 8
      Top = 64
      Width = 198
      Height = 17
      Caption = 'S&pecial chars (\n \r \t...)'
      TabOrder = 3
      OnClick = cbSpecClick
    end
    object cbInOEM: TTntCheckBox
      Left = 8
      Top = 88
      Width = 198
      Height = 17
      Caption = 'Search also in OE&M'
      TabOrder = 4
    end
    object cbInUTF8: TTntCheckBox
      Left = 8
      Top = 104
      Width = 198
      Height = 17
      Caption = 'Search also in UTF-8'
      TabOrder = 5
    end
    object cbInUTF16: TTntCheckBox
      Left = 8
      Top = 120
      Width = 198
      Height = 17
      Caption = 'Search also in UTF-16'
      TabOrder = 6
    end
  end
  object edDir: TTntComboBox
    Left = 8
    Top = 208
    Width = 361
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 6
    OnChange = edDirChange
    OnKeyDown = edDirKeyDown
    OnKeyPress = ed1KeyPress
  end
  object bRAll: TTntButton
    Left = 376
    Top = 38
    Width = 114
    Height = 25
    Caption = 'Replace all'
    TabOrder = 14
  end
  object cbSubDir: TTntCheckBox
    Left = 8
    Top = 232
    Width = 305
    Height = 17
    Caption = 'With all s&ubfolders'
    TabOrder = 7
  end
  object bBrowseDir: TTntButton
    Left = 8
    Top = 252
    Width = 113
    Height = 23
    Caption = '&Browse for folder...'
    TabOrder = 8
    OnClick = bBrowseDirClick
  end
  object edFileInc: TTntComboBox
    Left = 8
    Top = 100
    Width = 361
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 2
    OnChange = edFileIncChange
    OnKeyDown = edFileIncKeyDown
    OnKeyPress = ed1KeyPress
  end
  object bFAll: TTntButton
    Left = 376
    Top = 8
    Width = 114
    Height = 25
    Caption = '&Find all'
    Default = True
    Enabled = False
    TabOrder = 13
  end
  object bCurrDir: TTntButton
    Left = 128
    Top = 252
    Width = 113
    Height = 23
    Caption = 'Curre&nt folder'
    TabOrder = 9
    OnClick = bCurrDirClick
  end
  object gFile: TTntGroupBox
    Left = 224
    Top = 280
    Width = 265
    Height = 109
    Caption = 'Options for files search'
    TabOrder = 11
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
      Width = 254
      Height = 17
      Caption = 'Skip b&inary files'
      TabOrder = 0
    end
    object cbNoRO: TTntCheckBox
      Left = 8
      Top = 32
      Width = 254
      Height = 17
      Caption = 'Skip r&ead-only files'
      TabOrder = 1
    end
    object cbNoHid: TTntCheckBox
      Left = 8
      Top = 48
      Width = 254
      Height = 17
      Caption = 'Skip &hidden files'
      TabOrder = 2
    end
    object cbNoHid2: TTntCheckBox
      Left = 8
      Top = 64
      Width = 254
      Height = 17
      Caption = 'Skip hi&dden folders'
      TabOrder = 3
    end
    object edSort: TTntComboBox
      Left = 128
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
    Left = 224
    Top = 392
    Width = 265
    Height = 85
    Caption = 'Result list'
    TabOrder = 12
    object cbFnOnly: TTntCheckBox
      Left = 8
      Top = 32
      Width = 254
      Height = 17
      Caption = 'Show filenames onl&y'
      TabOrder = 1
    end
    object cbOutTab: TTntCheckBox
      Left = 8
      Top = 16
      Width = 254
      Height = 17
      Caption = 'Show results in edi&tor tab'
      TabOrder = 0
      OnClick = cbOutTabClick
    end
    object cbOutAppend: TTntCheckBox
      Left = 8
      Top = 48
      Width = 254
      Height = 17
      Caption = '&Append results list'
      TabOrder = 2
    end
    object cbCloseAfter: TTntCheckBox
      Left = 8
      Top = 64
      Width = 254
      Height = 17
      Caption = 'Close dialog when finished'
      TabOrder = 3
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
  object edFileExc: TTntComboBox
    Left = 8
    Top = 168
    Width = 361
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 5
    OnKeyDown = edFileExcKeyDown
    OnKeyPress = ed1KeyPress
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'labFind*.*')
    Left = 368
    Top = 200
    LangData = {
      0900666D535246696C6573010100000001000000070043617074696F6E014B00
      000006004C6162656C32010100000002000000070043617074696F6E0006004C
      6162656C34010100000003000000070043617074696F6E0008006C6162496E44
      6972010100000004000000070043617074696F6E000900546E744C6162656C32
      010100000005000000070043617074696F6E0003006564310000030065643200
      0005006248656C70010100000006000000070043617074696F6E000400624361
      6E010100000007000000070043617074696F6E000300674F7001010000000800
      0000070043617074696F6E000400636252450101000000090000000700436170
      74696F6E00060063624361736501010000000A000000070043617074696F6E00
      07006362576F72647301010000000B000000070043617074696F6E0006006362
      5370656301010000000C000000070043617074696F6E00050065644469720000
      05006252416C6C01010000000D000000070043617074696F6E00080063625375
      6244697201010000000E000000070043617074696F6E000A006242726F777365
      44697201010000000F000000070043617074696F6E000900656446696C65496E
      63000005006246416C6C010100000010000000070043617074696F6E00080062
      43757272446972010100000011000000070043617074696F6E0005006746696C
      65010100000012000000070043617074696F6E00070063624E6F42696E010100
      000013000000070043617074696F6E00060063624E6F524F0101000000140000
      00070043617074696F6E00070063624E6F486964010100000015000000070043
      617074696F6E00080063624E6F48696432010100000016000000070043617074
      696F6E00040067526573010100000017000000070043617074696F6E00080063
      62466E4F6E6C79010100000018000000070043617074696F6E00080063624F75
      74546162010100000019000000070043617074696F6E0008004C6162656C4572
      720000080054696D6572457272000008006243757246696C6501010000001A00
      0000070043617074696F6E0007006362496E4F454D01010000001B0000000700
      43617074696F6E000600426576656C31000008006362496E5554463801010000
      001C000000070043617074696F6E0009006362496E555446313601010000001D
      000000070043617074696F6E000B006242726F77736546696C6501010000001E
      000000070043617074696F6E000E00546E744F70656E4469616C6F6731000007
      006C616246696E6400000A006C616246696E6452657000000B0063624F757441
      7070656E6401010000001F000000070043617074696F6E000900546E744C6162
      656C33010100000020000000070043617074696F6E0006006564536F72740000
      0C006362436C6F73654166746572010100000021000000070043617074696F6E
      000A006C61624D61736B457863010100000022000000070043617074696F6E00
      0900656446696C65457863000006006C61624661760101000000230000000700
      43617074696F6E000800506F707570466176000002004E3100000A006D6E7546
      617653617665010100000024000000070043617074696F6E000D005361766544
      69616C6F6746617600000C006D6E754661764669656C64730101000000250000
      00070043617074696F6E0014006D6E754C6F6164536B697048696464656E4469
      72010100000026000000070043617074696F6E0011006D6E754C6F6164536B69
      7048696464656E010100000027000000070043617074696F6E000D006D6E754C
      6F6164536B6970524F010100000028000000070043617074696F6E0011006D6E
      754C6F6164536B697042696E617279010100000029000000070043617074696F
      6E000E006D6E754C6F6164496E555446313601010000002A0000000700436170
      74696F6E000D006D6E754C6F6164496E5554463801010000002B000000070043
      617074696F6E000C006D6E754C6F6164496E4F454D01010000002C0000000700
      43617074696F6E000B006D6E754C6F61645370656301010000002D0000000700
      43617074696F6E000C006D6E754C6F6164526567657801010000002E00000007
      0043617074696F6E000C006D6E754C6F6164576F72647301010000002F000000
      070043617074696F6E000B006D6E754C6F616443617365010100000030000000
      070043617074696F6E000E006D6E754C6F616453756264697273010100000031
      000000070043617074696F6E000D006D6E754C6F6164466F6C64657201010000
      0032000000070043617074696F6E000E006D6E754C6F61644D61736B45786301
      0100000033000000070043617074696F6E000E006D6E754C6F61644D61736B49
      6E63010100000034000000070043617074696F6E000C006D6E754C6F61645465
      787452010100000035000000070043617074696F6E000C006D6E754C6F616454
      65787453010100000036000000070043617074696F6E0002004E32000002004E
      33000002004E34000009006C616250726573657400000B0054696D6572507265
      73657400000B006D6E754C6F6164536F72740101000000370000000700436170
      74696F6E000C006C6162496E50726F6A65637401010000003800000007004361
      7074696F6E00}
  end
  object TimerErr: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerErrTimer
    Left = 392
    Top = 200
  end
  object TntOpenDialog1: TTntOpenDialog
    Filter = '*.*|*.*'
    Left = 336
    Top = 200
  end
  object PopupFav: TTntPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupFavPopup
    Left = 336
    Top = 232
    object mnuFavSave: TTntMenuItem
      Caption = 'Save preset...'
      OnClick = mnuFavSaveClick
    end
    object mnuFavFields: TTntMenuItem
      Caption = 'Fields'
      object mnuLoadTextS: TTntMenuItem
        Caption = 'search for'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadTextR: TTntMenuItem
        Caption = 'replace with'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadMaskInc: TTntMenuItem
        Caption = 'file masks to include'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadMaskExc: TTntMenuItem
        Caption = 'file masks to exclude'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadFolder: TTntMenuItem
        Caption = 'search in folder'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSubdirs: TTntMenuItem
        Caption = 'with all subfolders'
        OnClick = mnuLoadTextSClick
      end
      object N4: TTntMenuItem
        Caption = '-'
      end
      object mnuLoadCase: TTntMenuItem
        Caption = 'case sensitive'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadWords: TTntMenuItem
        Caption = 'whole words'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadRegex: TTntMenuItem
        Caption = 'regular expressions'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSpec: TTntMenuItem
        Caption = 'special chars'
        OnClick = mnuLoadTextSClick
      end
      object N3: TTntMenuItem
        Caption = '-'
      end
      object mnuLoadInOEM: TTntMenuItem
        Caption = 'search also in OEM'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadInUTF8: TTntMenuItem
        Caption = 'search also in UTF-8'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadInUTF16: TTntMenuItem
        Caption = 'search also in UTF-16'
        OnClick = mnuLoadTextSClick
      end
      object N2: TTntMenuItem
        Caption = '-'
      end
      object mnuLoadSkipBinary: TTntMenuItem
        Caption = 'skip binary files'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSkipRO: TTntMenuItem
        Caption = 'skip read-only files'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSkipHidden: TTntMenuItem
        Caption = 'skip hidden files'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSkipHiddenDir: TTntMenuItem
        Caption = 'skip hidden folders'
        OnClick = mnuLoadTextSClick
      end
      object mnuLoadSort: TTntMenuItem
        Caption = 'sort files'
        OnClick = mnuLoadTextSClick
      end
    end
    object N1: TTntMenuItem
      Caption = '-'
    end
  end
  object SaveDialogFav: TTntSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 360
    Top = 232
  end
  object TimerPreset: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerPresetTimer
    Left = 392
    Top = 228
  end
end
