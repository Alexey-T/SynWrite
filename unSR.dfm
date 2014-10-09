object fmSR: TfmSR
  Left = 321
  Top = 311
  ActiveControl = ed1
  BorderStyle = bsDialog
  ClientHeight = 180
  ClientWidth = 753
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnActivate = TntFormActivate
  OnClose = TntFormClose
  OnCreate = TntFormCreate
  OnDestroy = TntFormDestroy
  OnDeactivate = TntFormDeactivate
  OnKeyDown = TntFormKeyDown
  OnShortCut = TntFormShortCut
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labEd1: TTntLabel
    Left = 8
    Top = 8
    Width = 54
    Height = 13
    Caption = '&Search for:'
    FocusControl = ed1
  end
  object labEd2: TTntLabel
    Left = 8
    Top = 32
    Width = 65
    Height = 13
    Caption = '&Replace with:'
    FocusControl = ed2
  end
  object labRe: TTntLabel
    Left = 486
    Top = 8
    Width = 11
    Height = 13
    Cursor = crHandPoint
    Hint = 'Show RegEx help menu'
    Caption = #187'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labReClick
  end
  object bCombo1: TTntSpeedButton
    Left = 704
    Top = 68
    Width = 16
    Height = 25
    Flat = True
    Glyph.Data = {
      76040000424D7604000000000000360400002800000008000000080000000100
      0800000000004000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFF00000000FFFFFF0000000000
      00FF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = bCombo1Click
  end
  object bCombo2: TTntSpeedButton
    Left = 720
    Top = 68
    Width = 16
    Height = 25
    Flat = True
    Glyph.Data = {
      76040000424D7604000000000000360400002800000008000000080000000100
      0800000000004000000000000000000000000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFF00000000FFFFFF0000000000
      00FF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    OnClick = bCombo2Click
  end
  object labSmall: TTntLabel
    Left = 486
    Top = 32
    Width = 16
    Height = 13
    Cursor = crHandPoint
    Hint = 'Toggle compact mode'
    Caption = '<<'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labSmallClick
  end
  object labDocked2: TTntLabel
    Left = 510
    Top = 32
    Width = 12
    Height = 13
    Cursor = crHandPoint
    Hint = 'Toggle docked mode'
    Caption = #8595
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labDockedClick
  end
  object btnAltClose: TTntSpeedButton
    Left = 754
    Top = 8
    Width = 20
    Height = 20
    Flat = True
    Glyph.Data = {
      16050000424D160500000000000036040000280000000E0000000E0000000100
      080000000000E0000000C40E0000C40E00000001000000000000000000000000
      80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
      A6000020400000206000002080000020A0000020C0000020E000004000000040
      20000040400000406000004080000040A0000040C0000040E000006000000060
      20000060400000606000006080000060A0000060C0000060E000008000000080
      20000080400000806000008080000080A0000080C0000080E00000A0000000A0
      200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
      200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
      200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
      20004000400040006000400080004000A0004000C0004000E000402000004020
      20004020400040206000402080004020A0004020C0004020E000404000004040
      20004040400040406000404080004040A0004040C0004040E000406000004060
      20004060400040606000406080004060A0004060C0004060E000408000004080
      20004080400040806000408080004080A0004080C0004080E00040A0000040A0
      200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
      200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
      200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
      20008000400080006000800080008000A0008000C0008000E000802000008020
      20008020400080206000802080008020A0008020C0008020E000804000008040
      20008040400080406000804080008040A0008040C0008040E000806000008060
      20008060400080606000806080008060A0008060C0008060E000808000008080
      20008080400080806000808080008080A0008080C0008080E00080A0000080A0
      200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
      200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
      200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
      2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
      2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
      2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
      2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
      2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
      2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
      2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFDFDFDFDFD
      FDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFD0000FDFDFD1414FDFDFD1414FDFDFDFD0000FDFDFD141414
      FD141414FDFDFDFD0000FDFDFDFD1414141414FDFDFDFDFD0000FDFDFDFDFD14
      1414FDFDFDFDFDFD0000FDFDFDFD1414141414FDFDFDFDFD0000FDFDFD141414
      FD141414FDFDFDFD0000FDFDFD1414FDFDFD1414FDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD0000FDFDFDFDFDFD
      FDFDFDFDFDFDFDFD0000FDFDFDFDFDFDFDFDFDFDFDFDFDFD0000}
    OnClick = btnAltCloseClick
  end
  object ed1: TTntComboBox
    Left = 88
    Top = 6
    Width = 393
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 0
    OnChange = ed1Change
    OnKeyDown = ed1KeyDown
    OnKeyPress = ed1KeyPress
    OnSelect = ed1Change
  end
  object ed2: TTntComboBox
    Left = 88
    Top = 30
    Width = 393
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 2
    OnChange = ed2Change
    OnEnter = ed2Enter
    OnExit = ed2Exit
    OnKeyDown = ed2KeyDown
    OnKeyPress = ed2KeyPress
  end
  object gOp: TTntGroupBox
    Left = 8
    Top = 52
    Width = 324
    Height = 106
    Caption = 'Options'
    TabOrder = 4
    object cbOrigRe: TTntCheckBox
      Left = 8
      Top = 64
      Width = 160
      Height = 17
      Caption = 'Re&gular expressions'
      TabOrder = 3
      OnClick = cbOrigReClick
    end
    object cbOrigCase: TTntCheckBox
      Left = 8
      Top = 16
      Width = 160
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 0
    end
    object cbOrigWords: TTntCheckBox
      Left = 8
      Top = 32
      Width = 160
      Height = 17
      Caption = '&Whole words'
      TabOrder = 1
    end
    object cbOrigSpec: TTntCheckBox
      Left = 8
      Top = 48
      Width = 160
      Height = 17
      Caption = 'S&pecial chars (\n \r \t...)'
      TabOrder = 2
      OnClick = cbOrigSpecClick
    end
    object cbOrigCfm: TTntCheckBox
      Left = 176
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Pro&mpt on replace'
      TabOrder = 6
    end
    object cbOrigBkmkAll: TTntCheckBox
      Left = 176
      Top = 64
      Width = 145
      Height = 17
      Caption = 'Boo&kmark results'
      TabOrder = 8
      OnClick = cbOrigBkmkAllClick
    end
    object cbOrigExtSel: TTntCheckBox
      Left = 176
      Top = 80
      Width = 145
      Height = 17
      Caption = 'E&xtend selection'
      TabOrder = 9
    end
    object cbOrigReDot: TTntCheckBox
      Left = 24
      Top = 80
      Width = 142
      Height = 17
      Caption = 'Dot matches newlines'
      TabOrder = 4
    end
    object cbOrigSelectAll: TTntCheckBox
      Left = 176
      Top = 48
      Width = 145
      Height = 17
      Caption = 'Select res&ults'
      TabOrder = 7
      OnClick = cbOrigSelectAllClick
    end
    object cbOrigBack: TTntCheckBox
      Left = 176
      Top = 16
      Width = 145
      Height = 17
      Caption = '&Backward search'
      TabOrder = 5
    end
  end
  object gScop: TTntGroupBox
    Left = 336
    Top = 52
    Width = 170
    Height = 106
    Caption = 'Scope'
    TabOrder = 5
    object cbOrigInSel: TTntCheckBox
      Left = 8
      Top = 14
      Width = 160
      Height = 17
      Caption = 'Search in selecti&on'
      TabOrder = 0
      OnClick = cbOrigInSelClick
    end
    object cbOrigFromCaret: TTntCheckBox
      Left = 8
      Top = 30
      Width = 160
      Height = 17
      Caption = 'Search from care&t'
      TabOrder = 1
      OnClick = cbOrigFromCaretClick
    end
    object cbOrigWrap: TTntCheckBox
      Left = 24
      Top = 46
      Width = 142
      Height = 17
      Caption = 'Wrap searc&h'
      TabOrder = 2
    end
    object cbSkipCol: TTntCheckBox
      Left = 8
      Top = 62
      Width = 160
      Height = 17
      Caption = 'Skip collapse&d'
      TabOrder = 3
    end
    object cbTokens: TTntComboBox
      Left = 8
      Top = 80
      Width = 153
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 4
      Items.Strings = (
        'Entire text'
        'Comments'
        'Strings'
        'Comments and strings'
        'Except comments/strings')
    end
  end
  object StatusFind: TTntStatusBar
    Left = 0
    Top = 161
    Width = 753
    Height = 19
    Panels = <>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object PanelAlt: TPanel
    Left = 8
    Top = 54
    Width = 537
    Height = 21
    BevelOuter = bvNone
    TabOrder = 7
    Visible = False
    object cbAltCase: TTntCheckBox
      Left = 0
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Case sensitive'
      Caption = '&Case'
      TabOrder = 0
    end
    object cbAltWords: TTntCheckBox
      Left = 48
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Whole words'
      Caption = '&Word'
      TabOrder = 1
    end
    object cbAltSpec: TTntCheckBox
      Left = 96
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Special chars (\n \r \t...)'
      Caption = 'S&pec'
      TabOrder = 2
      OnClick = cbOrigSpecClick
    end
    object cbAltRe: TTntCheckBox
      Left = 142
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Regular expressions'
      Caption = 'RE'
      TabOrder = 3
      OnClick = cbOrigReClick
    end
    object cbAltReDot: TTntCheckBox
      Left = 182
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Dot matches newlines'
      Caption = 'Dot'
      TabOrder = 4
    end
    object cbAltBack: TTntCheckBox
      Left = 224
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Backward search'
      Caption = '&Back'
      TabOrder = 5
    end
    object cbAltSelectAll: TTntCheckBox
      Left = 272
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Select results'
      Caption = 'Se&l'
      TabOrder = 7
      OnClick = cbOrigSelectAllClick
    end
    object cbAltBkmkAll: TTntCheckBox
      Left = 312
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Bookmark results'
      Caption = 'Bm'
      TabOrder = 8
      OnClick = cbOrigBkmkAllClick
    end
    object cbAltExtSel: TTntCheckBox
      Left = 352
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Extend selection'
      Caption = 'E&xt'
      TabOrder = 9
    end
    object cbAltInSel: TTntCheckBox
      Left = 392
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Search in selection'
      Caption = '&InSel'
      TabOrder = 10
      OnClick = cbOrigInSelClick
    end
    object cbAltFromCaret: TTntCheckBox
      Left = 440
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Search from caret'
      Caption = 'Care&t'
      TabOrder = 11
      OnClick = cbOrigFromCaretClick
    end
    object cbAltWrap: TTntCheckBox
      Left = 488
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Wrap search'
      Caption = 'Wrap'
      TabOrder = 12
    end
    object cbAltCfm: TTntCheckBox
      Left = 304
      Top = 2
      Width = 49
      Height = 17
      Hint = 'Prompt on replace'
      Caption = 'Pr&mpt'
      TabOrder = 6
      OnClick = cbOrigSelectAllClick
    end
  end
  object PanelBtnOrig: TPanel
    Left = 512
    Top = 8
    Width = 233
    Height = 137
    BevelOuter = bvNone
    TabOrder = 8
    object labStyle: TTntLabel
      Left = 126
      Top = 60
      Width = 26
      Height = 13
      Cursor = crHandPoint
      Hint = 'Toggle Find/Replace mode'
      Caption = 'Mode'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labStyleClick
    end
    object labMultiline: TTntLabel
      Left = 126
      Top = 76
      Width = 44
      Height = 13
      Cursor = crHandPoint
      Hint = 'Toggle multiline mode'
      Caption = #187'Multiline'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labMultilineClick
    end
    object labTran: TTntLabel
      Left = 126
      Top = 108
      Width = 66
      Height = 13
      Cursor = crHandPoint
      Caption = 'Transparency'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labTranClick
    end
    object labDocked: TTntLabel
      Left = 126
      Top = 92
      Width = 41
      Height = 13
      Cursor = crHandPoint
      Hint = 'Toggle docked mode'
      Caption = #187'Docked'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labDockedClick
    end
    object bHelp: TTntButton
      Left = 119
      Top = 30
      Width = 114
      Height = 25
      Caption = 'Help'
      TabOrder = 10
      OnClick = bHelpClick
    end
    object bCancel: TTntButton
      Left = 119
      Top = 0
      Width = 114
      Height = 25
      Cancel = True
      Caption = 'Close'
      ModalResult = 2
      TabOrder = 9
      OnClick = bCancelClick
    end
    object bFindNext: TTntButton
      Left = 0
      Top = 0
      Width = 114
      Height = 25
      Caption = '&Find next'
      Default = True
      TabOrder = 0
      OnClick = bFindNextClick
    end
    object bRepSkip: TTntButton
      Left = 16
      Top = 0
      Width = 114
      Height = 25
      Caption = '&Find next'
      Default = True
      TabOrder = 1
      OnClick = bRepSkipClick
    end
    object bFindAll: TTntButton
      Left = 0
      Top = 30
      Width = 114
      Height = 25
      Caption = '&Mark all'
      TabOrder = 2
      OnClick = bFindAllClick
    end
    object bRepNext: TTntButton
      Left = 16
      Top = 30
      Width = 114
      Height = 25
      Caption = 'R&eplace'
      TabOrder = 3
      OnClick = bRepNextClick
    end
    object bCount: TTntButton
      Left = 0
      Top = 60
      Width = 114
      Height = 25
      Caption = 'Cou&nt all'
      TabOrder = 4
      OnClick = bCountClick
    end
    object bRepAll: TTntButton
      Left = 16
      Top = 60
      Width = 114
      Height = 25
      Caption = 'Repl&ace all'
      TabOrder = 5
      OnClick = bRepAllClick
    end
    object bFindInTabs: TTntButton
      Left = 0
      Top = 92
      Width = 114
      Height = 35
      Caption = 'Find in all tabs'
      TabOrder = 6
      WordWrap = True
      OnClick = bFindInTabsClick
    end
    object bRepInTabs: TTntButton
      Left = 16
      Top = 92
      Width = 114
      Height = 35
      Caption = 'Replace in all tabs'
      TabOrder = 7
      WordWrap = True
      OnClick = bRepInTabsClick
    end
    object PanelTran: TTntPanel
      Left = 120
      Top = -2
      Width = 121
      Height = 59
      BevelOuter = bvNone
      TabOrder = 8
      Visible = False
      object TrackTran: TTrackBar
        Left = 0
        Top = 5
        Width = 113
        Height = 28
        Max = 5
        PageSize = 1
        TabOrder = 0
        ThumbLength = 15
        TickMarks = tmBoth
        OnChange = TrackTranChange
      end
      object cbLoose: TTntCheckBox
        Left = 8
        Top = 34
        Width = 113
        Height = 17
        Caption = 'on los&ing focus'
        TabOrder = 1
        OnClick = cbLooseClick
      end
    end
  end
  object ed1Memo: TTntMemo
    Left = 64
    Top = 172
    Width = 380
    Height = 66
    MaxLength = 1500
    ScrollBars = ssVertical
    TabOrder = 1
    Visible = False
    WordWrap = False
    OnChange = ed1Change
    OnKeyDown = ed1MemoKeyDown
  end
  object ed2Memo: TTntMemo
    Left = 73
    Top = 184
    Width = 380
    Height = 66
    MaxLength = 1500
    ScrollBars = ssVertical
    TabOrder = 3
    Visible = False
    WordWrap = False
    OnChange = ed2MemoChange
    OnEnter = ed2Enter
    OnExit = ed2Exit
    OnKeyDown = ed1MemoKeyDown
  end
  object PanelAltFind: TPanel
    Left = 512
    Top = 160
    Width = 201
    Height = 57
    BevelOuter = bvNone
    TabOrder = 9
    Visible = False
    object bAltFindNext: TTntButton
      Left = 0
      Top = 0
      Width = 96
      Height = 23
      Caption = '&Find'
      Default = True
      TabOrder = 0
      OnClick = bFindNextClick
    end
    object bAltFindAll: TTntButton
      Left = 100
      Top = 0
      Width = 96
      Height = 23
      Caption = '&Mark all'
      TabOrder = 1
      OnClick = bFindAllClick
    end
    object bAltCount: TTntButton
      Left = 100
      Top = 26
      Width = 96
      Height = 23
      Caption = 'Cou&nt'
      TabOrder = 3
      OnClick = bCountClick
    end
    object bAltFindInTabs: TTntButton
      Left = 0
      Top = 26
      Width = 96
      Height = 23
      Caption = 'Find in tabs'
      TabOrder = 2
      WordWrap = True
      OnClick = bFindInTabsClick
    end
  end
  object PanelAltRep: TPanel
    Left = 511
    Top = 216
    Width = 202
    Height = 57
    BevelOuter = bvNone
    TabOrder = 10
    Visible = False
    object bAltRepSkip: TTntButton
      Left = 0
      Top = 0
      Width = 96
      Height = 23
      Caption = '&Find'
      Default = True
      TabOrder = 0
      OnClick = bRepSkipClick
    end
    object bAltRepNext: TTntButton
      Left = 100
      Top = 0
      Width = 96
      Height = 23
      Caption = 'R&eplace'
      TabOrder = 1
      OnClick = bRepNextClick
    end
    object bAltRepAll: TTntButton
      Left = 100
      Top = 26
      Width = 96
      Height = 23
      Caption = 'Repl&ace all'
      TabOrder = 3
      OnClick = bRepAllClick
    end
    object bAltRepInTabs: TTntButton
      Left = 0
      Top = 26
      Width = 96
      Height = 23
      Caption = 'Replace in tabs'
      TabOrder = 2
      WordWrap = True
      OnClick = bRepInTabsClick
    end
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'labCnt.Caption'
      'labRe.Caption'
      'labStyle.Caption')
    Left = 104
    Top = 4
    LangData = {
      0400666D535200014A00000006006C6162456431010100000002000000070043
      617074696F6E0006006C6162456432010100000003000000070043617074696F
      6E0003006564310000030065643200000300674F700101000000090000000700
      43617074696F6E00080063624F726967526501010000000A0000000700436170
      74696F6E000A0063624F7269674361736501010000000B000000070043617074
      696F6E000B0063624F726967576F72647301010000000C000000070043617074
      696F6E000A0063624F7269675370656301010000000D00000007004361707469
      6F6E0005006753636F70010100000012000000070043617074696F6E00090063
      624F72696743666D010100000019000000070043617074696F6E0005006D6E75
      5265000005006C61625265010100000061000000040048696E74000D0063624F
      726967426B6D6B416C6C010100000020000000070043617074696F6E000B0063
      624F726967496E53656C010100000021000000070043617074696F6E000F0063
      624F72696746726F6D4361726574010100000022000000070043617074696F6E
      000A0063624F72696757726170010100000023000000070043617074696F6E00
      0C0063624F72696745787453656C010100000024000000070043617074696F6E
      0009006362536B6970436F6C010100000026000000070043617074696F6E0008
      006362546F6B656E7301010000002700000005004974656D730007006564314D
      656D6F000007006564324D656D6F0000070062436F6D626F310000070062436F
      6D626F32000008006D6E75436F6D626F00000A0053746174757346696E640000
      0B0063624F7269675265446F7401010000002A000000070043617074696F6E00
      0F0063624F72696753656C656374416C6C01010000002D000000070043617074
      696F6E000A0063624F7269674261636B01010000002E00000007004361707469
      6F6E00080050616E656C416C74000009006362416C7443617365010200000030
      000000070043617074696F6E53000000040048696E74000A006362416C74576F
      726473010200000031000000070043617074696F6E54000000040048696E7400
      09006362416C7453706563010200000032000000070043617074696F6E550000
      00040048696E740007006362416C745265010200000033000000070043617074
      696F6E56000000040048696E74000A006362416C745265446F74010200000034
      000000070043617074696F6E57000000040048696E740009006362416C744261
      636B010200000035000000070043617074696F6E58000000040048696E74000E
      006362416C7453656C656374416C6C010200000036000000070043617074696F
      6E59000000040048696E74000C006362416C74426B6D6B416C6C010200000037
      000000070043617074696F6E5A000000040048696E74000B006362416C744578
      7453656C010200000038000000070043617074696F6E5B000000040048696E74
      000A006362416C74496E53656C010200000039000000070043617074696F6E5C
      000000040048696E74000E006362416C7446726F6D436172657401020000003A
      000000070043617074696F6E5E000000040048696E740008006C6162536D616C
      6C010100000062000000040048696E740009006362416C745772617001020000
      003B000000070043617074696F6E5F000000040048696E740008006362416C74
      43666D01020000003C000000070043617074696F6E5D000000040048696E7400
      0C0050616E656C42746E4F726967000009006246696E644E6578740101000000
      3D000000070043617074696F6E00080062526570536B697001010000003E0000
      00070043617074696F6E0008006246696E64416C6C01010000003F0000000700
      43617074696F6E000800625265704E6578740101000000400000000700436170
      74696F6E00060062436F756E74010100000041000000070043617074696F6E00
      070062526570416C6C010100000042000000070043617074696F6E000B006246
      696E64496E54616273010100000043000000070043617074696F6E000A006252
      6570496E54616273010100000044000000070043617074696F6E00090050616E
      656C5472616E00000900547261636B5472616E0000070063624C6F6F73650101
      00000045000000070043617074696F6E0007006243616E63656C010100000046
      000000070043617074696F6E0005006248656C70010100000047000000070043
      617074696F6E0008006C61625374796C65010100000063000000040048696E74
      000C006C61624D756C74696C696E65010200000048000000070043617074696F
      6E64000000040048696E740007006C61625472616E0101000000490000000700
      43617074696F6E0009006C6162446F636B656401020000004A00000007004361
      7074696F6E65000000040048696E74000C0050616E656C416C7446696E640000
      0B0050616E656C416C7452657000000C0062416C7446696E644E657874010100
      00004B000000070043617074696F6E000B0062416C7446696E64416C6C010100
      00004C000000070043617074696F6E00090062416C74436F756E740101000000
      4D000000070043617074696F6E000E0062416C7446696E64496E546162730101
      0000004E000000070043617074696F6E000B0062416C74526570536B69700101
      0000004F000000070043617074696F6E000B0062416C745265704E6578740101
      00000050000000070043617074696F6E000A0062416C74526570416C6C010100
      000051000000070043617074696F6E000D0062416C74526570496E5461627301
      0100000052000000070043617074696F6E000A006C6162446F636B6564320102
      00000060000000070043617074696F6E66000000040048696E74000B0062746E
      416C74436C6F73650000}
  end
  object mnuRe: TTntPopupMenu
    AutoHotkeys = maManual
    OnPopup = mnuRePopup
    Left = 136
    Top = 4
  end
  object mnuCombo: TTntPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    OnPopup = mnuRePopup
    Left = 160
    Top = 4
  end
end
