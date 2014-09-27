object fmSR: TfmSR
  Left = 321
  Top = 311
  ActiveControl = ed1
  BorderStyle = bsDialog
  ClientHeight = 233
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
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
    Top = 52
    Width = 65
    Height = 13
    Caption = '&Replace with:'
    FocusControl = ed2
  end
  object labStyle: TTntLabel
    Left = 352
    Top = 20
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
    OnClick = labStyleClick
  end
  object labRe: TTntLabel
    Left = 352
    Top = 4
    Width = 11
    Height = 13
    Cursor = crHandPoint
    Caption = #187'?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labReClick
  end
  object labMultiline: TTntLabel
    Left = 352
    Top = 36
    Width = 44
    Height = 13
    Cursor = crHandPoint
    Caption = #187'Multiline'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labMultilineClick
  end
  object bCombo1: TSpeedButton
    Left = 152
    Top = 44
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
  object bCombo2: TSpeedButton
    Left = 168
    Top = 44
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
  object labTransp: TTntLabel
    Left = 352
    Top = 68
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
    OnClick = labTranspClick
  end
  object labDocked: TTntLabel
    Left = 352
    Top = 52
    Width = 41
    Height = 13
    Cursor = crHandPoint
    Caption = #187'Docked'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsUnderline]
    ParentFont = False
    OnClick = labDockedClick
  end
  object bFindNext: TTntButton
    Left = 528
    Top = 8
    Width = 114
    Height = 25
    Caption = '&Find next'
    Default = True
    TabOrder = 4
    OnClick = bFindNextClick
  end
  object bCancel: TTntButton
    Left = 528
    Top = 170
    Width = 114
    Height = 25
    Cancel = True
    Caption = 'Close'
    ModalResult = 2
    TabOrder = 13
    OnClick = bCancelClick
  end
  object ed1: TTntComboBox
    Left = 8
    Top = 24
    Width = 335
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
    Left = 8
    Top = 68
    Width = 335
    Height = 21
    AutoComplete = False
    DropDownCount = 15
    ItemHeight = 13
    TabOrder = 1
    OnKeyDown = ed2KeyDown
    OnKeyPress = ed2KeyPress
  end
  object gOp: TTntGroupBox
    Left = 8
    Top = 96
    Width = 335
    Height = 113
    Caption = 'Options'
    TabOrder = 2
    object cbRe: TTntCheckBox
      Left = 8
      Top = 72
      Width = 160
      Height = 17
      Caption = 'Regular e&xpressions'
      TabOrder = 3
      OnClick = cbReClick
    end
    object cbCase: TTntCheckBox
      Left = 8
      Top = 16
      Width = 160
      Height = 17
      Caption = '&Case sensitive'
      TabOrder = 0
    end
    object cbWords: TTntCheckBox
      Left = 8
      Top = 32
      Width = 160
      Height = 17
      Caption = '&Whole words'
      TabOrder = 1
    end
    object cbSpec: TTntCheckBox
      Left = 8
      Top = 56
      Width = 160
      Height = 17
      Caption = 'Special chars (\n \r \t...)'
      TabOrder = 2
      OnClick = cbSpecClick
    end
    object cbCfm: TTntCheckBox
      Left = 176
      Top = 56
      Width = 150
      Height = 17
      Caption = 'Pro&mpt on replace'
      TabOrder = 6
    end
    object cbBkmkAll: TTntCheckBox
      Left = 176
      Top = 72
      Width = 150
      Height = 17
      Caption = 'Boo&kmark results'
      TabOrder = 8
      OnClick = cbBkmkAllClick
    end
    object cbExtSel: TTntCheckBox
      Left = 176
      Top = 88
      Width = 150
      Height = 17
      Caption = 'Extend selecti&on'
      TabOrder = 9
    end
    object cbReDot: TTntCheckBox
      Left = 24
      Top = 88
      Width = 142
      Height = 17
      Caption = 'Dot matches newlines'
      TabOrder = 4
    end
    object cbSelectAll: TTntCheckBox
      Left = 176
      Top = 56
      Width = 150
      Height = 17
      Caption = 'Select res&ults'
      TabOrder = 7
      OnClick = cbSelectAllClick
    end
    object cbBack: TTntCheckBox
      Left = 176
      Top = 16
      Width = 150
      Height = 17
      Caption = 'Backward search'
      TabOrder = 5
    end
  end
  object bFindAll: TTntButton
    Left = 528
    Top = 38
    Width = 114
    Height = 25
    Caption = 'Find all / &mark'
    TabOrder = 5
    OnClick = bFindAllClick
  end
  object gScop: TTntGroupBox
    Left = 352
    Top = 96
    Width = 170
    Height = 113
    Caption = 'Scope'
    TabOrder = 3
    object cbSel: TTntCheckBox
      Left = 8
      Top = 16
      Width = 160
      Height = 17
      Caption = 'Search in selection'
      TabOrder = 0
      OnClick = cbSelClick
    end
    object cbFromCur: TTntCheckBox
      Left = 8
      Top = 32
      Width = 160
      Height = 17
      Caption = 'Search from care&t'
      TabOrder = 1
      OnClick = cbFromCurClick
    end
    object cbWrap: TTntCheckBox
      Left = 24
      Top = 48
      Width = 142
      Height = 17
      Caption = 'Wrap searc&h'
      TabOrder = 2
    end
    object cbSkipCol: TTntCheckBox
      Left = 8
      Top = 64
      Width = 160
      Height = 17
      Caption = 'Skip collapsed'
      TabOrder = 3
    end
    object cbTokens: TTntComboBox
      Left = 8
      Top = 84
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
  object bHelp: TTntButton
    Left = 528
    Top = 140
    Width = 114
    Height = 25
    Caption = 'Help'
    TabOrder = 12
    OnClick = bHelpClick
  end
  object bCount: TTntButton
    Left = 528
    Top = 68
    Width = 114
    Height = 25
    Caption = 'Cou&nt all'
    TabOrder = 10
    OnClick = bCountClick
  end
  object bRepNext: TTntButton
    Left = 576
    Top = 38
    Width = 114
    Height = 25
    Caption = 'R&eplace'
    TabOrder = 7
    OnClick = bRepNextClick
  end
  object bRepAll: TTntButton
    Left = 576
    Top = 68
    Width = 114
    Height = 25
    Caption = 'Repl&ace all'
    TabOrder = 8
    OnClick = bRepAllClick
  end
  object bSkip: TTntButton
    Left = 576
    Top = 8
    Width = 114
    Height = 25
    Caption = '&Find next'
    Default = True
    TabOrder = 6
    OnClick = bSkipClick
  end
  object PanelTr: TTntPanel
    Left = 410
    Top = 16
    Width = 113
    Height = 49
    BevelOuter = bvNone
    TabOrder = 14
    Visible = False
    object TrackBar1: TTrackBar
      Left = 0
      Top = -3
      Width = 113
      Height = 28
      Max = 5
      PageSize = 1
      TabOrder = 0
      ThumbLength = 15
      TickMarks = tmBoth
      OnChange = TrackBar1Change
    end
    object cbLoose: TTntCheckBox
      Left = 0
      Top = 26
      Width = 113
      Height = 17
      Caption = 'on los&ing focus'
      TabOrder = 1
      OnClick = cbLooseClick
    end
  end
  object bFindInTabs: TTntButton
    Left = 528
    Top = 99
    Width = 114
    Height = 35
    Caption = 'Find in all tabs'
    TabOrder = 11
    WordWrap = True
    OnClick = bFindInTabsClick
  end
  object bRepInTabs: TTntButton
    Left = 576
    Top = 99
    Width = 114
    Height = 35
    Caption = 'Rep&lace all in all tabs'
    TabOrder = 9
    WordWrap = True
    OnClick = bRepInTabsClick
  end
  object ed1Memo: TTntMemo
    Left = 600
    Top = 132
    Width = 320
    Height = 66
    MaxLength = 1500
    ScrollBars = ssVertical
    TabOrder = 15
    Visible = False
    WordWrap = False
    OnChange = ed1Change
    OnKeyDown = ed1MemoKeyDown
  end
  object ed2Memo: TTntMemo
    Left = 609
    Top = 144
    Width = 320
    Height = 66
    MaxLength = 1500
    ScrollBars = ssVertical
    TabOrder = 16
    Visible = False
    WordWrap = False
    OnKeyDown = ed1MemoKeyDown
  end
  object StatusFind: TTntStatusBar
    Left = 0
    Top = 214
    Width = 651
    Height = 19
    Panels = <>
    ParentFont = True
    SimplePanel = True
    UseSystemFont = False
  end
  object PanelBusy: TTntPanel
    Left = 160
    Top = 276
    Width = 185
    Height = 25
    BevelOuter = bvNone
    Caption = 'Search in progres...'
    TabOrder = 18
    Visible = False
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'labCnt.Caption'
      'labRe.Caption'
      'labStyle.Caption')
    Left = 104
    Top = 4
    LangData = {
      0400666D535200012F00000006006C6162456431010100000002000000070043
      617074696F6E0006006C6162456432010100000003000000070043617074696F
      6E0009006246696E644E657874010100000005000000070043617074696F6E00
      0800625265704E657874010100000006000000070043617074696F6E00070062
      526570416C6C010100000007000000070043617074696F6E0007006243616E63
      656C010100000008000000070043617074696F6E000300656431000003006564
      3200000300674F70010100000009000000070043617074696F6E000400636252
      6501010000000A000000070043617074696F6E00060063624361736501010000
      000B000000070043617074696F6E0007006362576F72647301010000000C0000
      00070043617074696F6E00060063625370656301010000000D00000007004361
      7074696F6E0008006246696E64416C6C01010000000E00000007004361707469
      6F6E0005006753636F70010100000012000000070043617074696F6E00050062
      48656C70010100000018000000070043617074696F6E000500636243666D0101
      00000019000000070043617074696F6E00060062436F756E7401010000001A00
      0000070043617074696F6E000A0062526570496E5461627301010000001B0000
      00070043617074696F6E00050062536B697001010000001D0000000700436170
      74696F6E00070050616E656C547200000900547261636B426172310000070063
      624C6F6F736501010000001F000000070043617074696F6E0008006C61625374
      796C65000005006D6E755265000005006C61625265000009006362426B6D6B41
      6C6C010100000020000000070043617074696F6E000500636253656C01010000
      0021000000070043617074696F6E000900636246726F6D437572010100000022
      000000070043617074696F6E0006006362577261700101000000230000000700
      43617074696F6E000800636245787453656C0101000000240000000700436170
      74696F6E000B006246696E64496E546162730101000000250000000700436170
      74696F6E0009006362536B6970436F6C01010000002600000007004361707469
      6F6E0008006362546F6B656E7301010000002700000005004974656D73000C00
      6C61624D756C74696C696E65010100000028000000070043617074696F6E0007
      006564314D656D6F000007006564324D656D6F0000070062436F6D626F310000
      070062436F6D626F32000008006D6E75436F6D626F00000A0053746174757346
      696E640000090050616E656C4275737901010000002900000007004361707469
      6F6E00070063625265446F7401010000002A000000070043617074696F6E0009
      006C61625472616E737001010000002C000000070043617074696F6E000B0063
      6253656C656374416C6C01010000002D000000070043617074696F6E00060063
      624261636B01010000002E000000070043617074696F6E0009006C6162446F63
      6B656401010000002F000000070043617074696F6E00}
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
