object fmPrintSetup: TfmPrintSetup
  Left = 190
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Page setup'
  ClientHeight = 543
  ClientWidth = 553
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TTntButton
    Left = 360
    Top = 512
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object bCancel: TTntButton
    Left = 456
    Top = 512
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object grHead: TTntGroupBox
    Left = 8
    Top = 284
    Width = 537
    Height = 221
    Caption = 'Header / Footer'
    TabOrder = 3
    object labHint: TTntLabel
      Left = 8
      Top = 188
      Width = 243
      Height = 13
      Caption = 'One tabulation for centering, two for right-aligning'
      FocusControl = cbColors
    end
    object labHint2: TTntLabel
      Left = 8
      Top = 202
      Width = 225
      Height = 13
      Caption = 'Variables are available, call list with Ctrl+Space'
      FocusControl = cbColors
    end
    object edHead: TSyntaxMemo
      Left = 8
      Top = 16
      Width = 521
      Height = 81
      NonPrintedSpaces = True
      NonPrintedEol = True
      NonPrintedEolDetails = False
      SelectModeDefault = msNone
      SyntaxAnalyzer = SyntAnalyzer1
      TabList.AsString = '10'
      NonPrinted.Visible = True
      NonPrinted.Font.Charset = DEFAULT_CHARSET
      NonPrinted.Font.Color = clSilver
      NonPrinted.Font.Height = -11
      NonPrinted.Font.Name = 'MS Sans Serif'
      NonPrinted.Font.Style = []
      LineNumbers.Alignment = taLeftJustify
      LineNumbers.Font.Charset = DEFAULT_CHARSET
      LineNumbers.Font.Color = clWindowText
      LineNumbers.Font.Height = -9
      LineNumbers.Font.Name = 'Courier New'
      LineNumbers.Font.Style = []
      LineNumbers.Band = -1
      Gutter.Visible = False
      Gutter.ExpandButtons.Data = {
        FA000000424DFA000000000000007600000028000000180000000B0000000100
        0400000000008400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
        60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
        BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
        00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
        60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
      Gutter.Bands = <>
      Gutter.Objects = <>
      Gutter.ExpBtnBand = -1
      Gutter.CollapsePen.Color = clGray
      Gutter.AutoSize = False
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -11
      HintProps.Font.Name = 'MS Sans Serif'
      HintProps.Font.Style = []
      HintProps.Color = 13041663
      HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
      UserRanges = <>
      UndoLimit = 0
      TabMode = tmTabChar
      StaplePen.Color = clGray
      DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.SelectioMark.Font.Color = clHighlightText
      DefaultStyles.SelectioMark.Font.Height = -13
      DefaultStyles.SelectioMark.Font.Name = 'Courier New'
      DefaultStyles.SelectioMark.Font.Style = []
      DefaultStyles.SelectioMark.BgColor = clHighlight
      DefaultStyles.SelectioMark.FormatType = ftColor
      DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.SearchMark.Font.Color = clWhite
      DefaultStyles.SearchMark.Font.Height = -13
      DefaultStyles.SearchMark.Font.Name = 'Courier New'
      DefaultStyles.SearchMark.Font.Style = []
      DefaultStyles.SearchMark.BgColor = clBlack
      DefaultStyles.SearchMark.FormatType = ftColor
      DefaultStyles.CurrentLine.Enabled = False
      DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CurrentLine.Font.Color = clWindowText
      DefaultStyles.CurrentLine.Font.Height = -13
      DefaultStyles.CurrentLine.Font.Name = 'Courier New'
      DefaultStyles.CurrentLine.Font.Style = []
      DefaultStyles.CurrentLine.FormatType = ftBackGround
      DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CollapseMark.Font.Color = clSilver
      DefaultStyles.CollapseMark.Font.Height = -13
      DefaultStyles.CollapseMark.Font.Name = 'Courier New'
      DefaultStyles.CollapseMark.Font.Style = []
      DefaultStyles.CollapseMark.FormatType = ftColor
      DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
      DefaultStyles.CollapseMark.BorderColorLeft = clSilver
      DefaultStyles.CollapseMark.BorderTypeTop = blSolid
      DefaultStyles.CollapseMark.BorderColorTop = clSilver
      DefaultStyles.CollapseMark.BorderTypeRight = blSolid
      DefaultStyles.CollapseMark.BorderColorRight = clSilver
      DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
      DefaultStyles.CollapseMark.BorderColorBottom = clSilver
      SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.SyncRangeStyle.Font.Color = clWindowText
      SyncEditing.SyncRangeStyle.Font.Height = -13
      SyncEditing.SyncRangeStyle.Font.Name = 'Courier New'
      SyncEditing.SyncRangeStyle.Font.Style = []
      SyncEditing.SyncRangeStyle.BgColor = 14745568
      SyncEditing.SyncRangeStyle.FormatType = ftBackGround
      SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
      SyncEditing.ActiveWordsStyle.Font.Height = -13
      SyncEditing.ActiveWordsStyle.Font.Name = 'Courier New'
      SyncEditing.ActiveWordsStyle.Font.Style = []
      SyncEditing.ActiveWordsStyle.FormatType = ftBackGround
      SyncEditing.ActiveWordsStyle.BorderTypeLeft = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorLeft = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeTop = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorTop = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeRight = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorRight = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeBottom = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorBottom = clBlue
      SyncEditing.InactiveWordsStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.InactiveWordsStyle.Font.Color = clWindowText
      SyncEditing.InactiveWordsStyle.Font.Height = -13
      SyncEditing.InactiveWordsStyle.Font.Name = 'Courier New'
      SyncEditing.InactiveWordsStyle.Font.Style = []
      SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
      SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
      SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
      Options = [soOverwriteBlocks, soEnableBlockSel, soKeepCaretInText, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soGroupRedo, soDragText, soVariableHorzScrollBar]
      HorzRuler.Font.Charset = DEFAULT_CHARSET
      HorzRuler.Font.Color = clWindowText
      HorzRuler.Font.Height = -11
      HorzRuler.Font.Name = 'MS Sans Serif'
      HorzRuler.Font.Style = []
      TextMargins = <
        item
          Pen.Color = clSilver
          RulerMark = False
        end>
      Caret.Insert.Width = -2
      Caret.Overwrite.Width = 100
      Caret.ReadOnly.Width = -1
      Caret.Custom.Width = -2
      Transparent = False
      Alignment = taLeftJustify
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      OnEnter = edHeadEnter
    end
    object edFoot: TSyntaxMemo
      Left = 8
      Top = 104
      Width = 521
      Height = 81
      NonPrintedSpaces = True
      NonPrintedEol = True
      NonPrintedEolDetails = False
      SelectModeDefault = msNone
      SyntaxAnalyzer = SyntAnalyzer1
      TabList.AsString = '10'
      NonPrinted.Visible = True
      NonPrinted.Font.Charset = DEFAULT_CHARSET
      NonPrinted.Font.Color = clSilver
      NonPrinted.Font.Height = -11
      NonPrinted.Font.Name = 'MS Sans Serif'
      NonPrinted.Font.Style = []
      LineNumbers.Alignment = taLeftJustify
      LineNumbers.Font.Charset = DEFAULT_CHARSET
      LineNumbers.Font.Color = clWindowText
      LineNumbers.Font.Height = -9
      LineNumbers.Font.Name = 'Courier New'
      LineNumbers.Font.Style = []
      LineNumbers.Band = -1
      Gutter.Visible = False
      Gutter.ExpandButtons.Data = {
        FA000000424DFA000000000000007600000028000000180000000B0000000100
        0400000000008400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
        60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
        BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
        00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
        60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
      Gutter.Bands = <>
      Gutter.Objects = <>
      Gutter.ExpBtnBand = -1
      Gutter.CollapsePen.Color = clGray
      Gutter.AutoSize = False
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -11
      HintProps.Font.Name = 'MS Sans Serif'
      HintProps.Font.Style = []
      HintProps.Color = 13041663
      HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
      UserRanges = <>
      UndoLimit = 0
      TabMode = tmTabChar
      StaplePen.Color = clGray
      DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.SelectioMark.Font.Color = clHighlightText
      DefaultStyles.SelectioMark.Font.Height = -13
      DefaultStyles.SelectioMark.Font.Name = 'Courier New'
      DefaultStyles.SelectioMark.Font.Style = []
      DefaultStyles.SelectioMark.BgColor = clHighlight
      DefaultStyles.SelectioMark.FormatType = ftColor
      DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.SearchMark.Font.Color = clWhite
      DefaultStyles.SearchMark.Font.Height = -13
      DefaultStyles.SearchMark.Font.Name = 'Courier New'
      DefaultStyles.SearchMark.Font.Style = []
      DefaultStyles.SearchMark.BgColor = clBlack
      DefaultStyles.SearchMark.FormatType = ftColor
      DefaultStyles.CurrentLine.Enabled = False
      DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CurrentLine.Font.Color = clWindowText
      DefaultStyles.CurrentLine.Font.Height = -13
      DefaultStyles.CurrentLine.Font.Name = 'Courier New'
      DefaultStyles.CurrentLine.Font.Style = []
      DefaultStyles.CurrentLine.FormatType = ftBackGround
      DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CollapseMark.Font.Color = clSilver
      DefaultStyles.CollapseMark.Font.Height = -13
      DefaultStyles.CollapseMark.Font.Name = 'Courier New'
      DefaultStyles.CollapseMark.Font.Style = []
      DefaultStyles.CollapseMark.FormatType = ftColor
      DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
      DefaultStyles.CollapseMark.BorderColorLeft = clSilver
      DefaultStyles.CollapseMark.BorderTypeTop = blSolid
      DefaultStyles.CollapseMark.BorderColorTop = clSilver
      DefaultStyles.CollapseMark.BorderTypeRight = blSolid
      DefaultStyles.CollapseMark.BorderColorRight = clSilver
      DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
      DefaultStyles.CollapseMark.BorderColorBottom = clSilver
      SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.SyncRangeStyle.Font.Color = clWindowText
      SyncEditing.SyncRangeStyle.Font.Height = -13
      SyncEditing.SyncRangeStyle.Font.Name = 'Courier New'
      SyncEditing.SyncRangeStyle.Font.Style = []
      SyncEditing.SyncRangeStyle.BgColor = 14745568
      SyncEditing.SyncRangeStyle.FormatType = ftBackGround
      SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
      SyncEditing.ActiveWordsStyle.Font.Height = -13
      SyncEditing.ActiveWordsStyle.Font.Name = 'Courier New'
      SyncEditing.ActiveWordsStyle.Font.Style = []
      SyncEditing.ActiveWordsStyle.FormatType = ftBackGround
      SyncEditing.ActiveWordsStyle.BorderTypeLeft = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorLeft = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeTop = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorTop = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeRight = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorRight = clBlue
      SyncEditing.ActiveWordsStyle.BorderTypeBottom = blSolid
      SyncEditing.ActiveWordsStyle.BorderColorBottom = clBlue
      SyncEditing.InactiveWordsStyle.Font.Charset = DEFAULT_CHARSET
      SyncEditing.InactiveWordsStyle.Font.Color = clWindowText
      SyncEditing.InactiveWordsStyle.Font.Height = -13
      SyncEditing.InactiveWordsStyle.Font.Name = 'Courier New'
      SyncEditing.InactiveWordsStyle.Font.Style = []
      SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
      SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
      SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
      Options = [soOverwriteBlocks, soEnableBlockSel, soKeepCaretInText, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soGroupRedo, soDragText, soVariableHorzScrollBar]
      HorzRuler.Font.Charset = DEFAULT_CHARSET
      HorzRuler.Font.Color = clWindowText
      HorzRuler.Font.Height = -11
      HorzRuler.Font.Name = 'MS Sans Serif'
      HorzRuler.Font.Style = []
      TextMargins = <
        item
          Pen.Color = clSilver
          RulerMark = False
        end>
      Caret.Insert.Width = -2
      Caret.Overwrite.Width = 100
      Caret.ReadOnly.Width = -1
      Caret.Custom.Width = -2
      Transparent = False
      Alignment = taLeftJustify
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      OnEnter = edHeadEnter
    end
  end
  object grFonts: TTntGroupBox
    Left = 8
    Top = 212
    Width = 537
    Height = 69
    Caption = 'Fonts'
    TabOrder = 2
    object bFontHead: TTntButton
      Left = 272
      Top = 14
      Width = 169
      Height = 23
      Caption = '&Header'
      TabOrder = 2
      OnClick = bFontNumsClick
    end
    object bFontFoot: TTntButton
      Left = 272
      Top = 38
      Width = 169
      Height = 23
      Caption = '&Footer'
      TabOrder = 3
      OnClick = bFontNumsClick
    end
    object bFontNums: TTntButton
      Left = 88
      Top = 38
      Width = 169
      Height = 23
      Caption = 'Line &numbers'
      TabOrder = 1
      OnClick = bFontNumsClick
    end
    object bFontText: TTntButton
      Left = 88
      Top = 14
      Width = 169
      Height = 23
      Caption = 'Text'
      TabOrder = 0
      OnClick = bFontNumsClick
    end
  end
  object grOpt: TTntGroupBox
    Left = 8
    Top = 4
    Width = 537
    Height = 137
    Caption = 'Options'
    TabOrder = 0
    object labOrient: TTntLabel
      Left = 256
      Top = 18
      Width = 58
      Height = 13
      Caption = 'Or&ientation:'
      FocusControl = cbOrient
    end
    object labColor: TTntLabel
      Left = 256
      Top = 42
      Width = 34
      Height = 13
      Caption = 'C&olors:'
      FocusControl = cbColors
    end
    object labNums: TTntLabel
      Left = 256
      Top = 66
      Width = 67
      Height = 13
      Caption = 'Line nu&mbers:'
      FocusControl = cbNums
    end
    object cbOrient: TTntComboBox
      Left = 352
      Top = 16
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        'Portrait'
        'Landscape')
    end
    object cbColors: TTntComboBox
      Left = 352
      Top = 40
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        'Full color'
        'Gray scale'
        'Black and white')
    end
    object cbNums: TTntComboBox
      Left = 352
      Top = 64
      Width = 177
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      Items.Strings = (
        'None'
        'Left '
        'Right'
        'Left on odd pages'
        'Right on odd pages')
    end
    object opHiRanges: TTntCheckBox
      Left = 8
      Top = 32
      Width = 240
      Height = 17
      Caption = 'Highlight &ranges'
      TabOrder = 1
    end
    object opTransp: TTntCheckBox
      Left = 8
      Top = 80
      Width = 240
      Height = 17
      Caption = '&Transparent'
      TabOrder = 4
    end
    object opHiLines: TTntCheckBox
      Left = 8
      Top = 48
      Width = 240
      Height = 17
      Caption = 'Highlight &lines'
      TabOrder = 2
    end
    object opStaples: TTntCheckBox
      Left = 8
      Top = 112
      Width = 240
      Height = 17
      Caption = 'Print &block staples'
      TabOrder = 6
    end
    object opHideCollapsed: TTntCheckBox
      Left = 8
      Top = 64
      Width = 240
      Height = 17
      Caption = 'Hide &collapsed lines'
      TabOrder = 3
    end
    object opWordWrap: TTntCheckBox
      Left = 8
      Top = 16
      Width = 240
      Height = 17
      Caption = '&Word wrap'
      TabOrder = 0
    end
    object opSelOnly: TTntCheckBox
      Left = 8
      Top = 96
      Width = 240
      Height = 17
      Caption = 'Print &selection only'
      TabOrder = 5
    end
  end
  object grMargins: TTntGroupBox
    Left = 8
    Top = 144
    Width = 537
    Height = 65
    Caption = 'Margins'
    TabOrder = 1
    object labUnits: TTntLabel
      Left = 52
      Top = 28
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = '&Units:'
      FocusControl = cbUnits
    end
    object cbUnits: TTntComboBox
      Left = 88
      Top = 24
      Width = 97
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cbUnitsChange
      Items.Strings = (
        'mm'
        'cm'
        'inch'
        '0.001 inch')
    end
    object edLeft: TEdit
      Left = 246
      Top = 24
      Width = 63
      Height = 21
      TabOrder = 2
    end
    object edTop: TEdit
      Left = 321
      Top = 12
      Width = 75
      Height = 21
      TabOrder = 1
    end
    object edRight: TEdit
      Left = 406
      Top = 24
      Width = 63
      Height = 21
      TabOrder = 3
    end
    object edBottom: TEdit
      Left = 321
      Top = 37
      Width = 75
      Height = 21
      TabOrder = 4
    end
  end
  object Dlg: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 480
    Top = 112
  end
  object SyntAnalyzer1: TSyntAnalyzer
    Formats = <
      item
        DisplayName = 'Marked block'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = clHighlight
        FormatType = ftColor
      end
      item
        DisplayName = 'Field'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BorderTypeLeft = blSolid
        BorderColorLeft = clSilver
        BorderTypeTop = blSolid
        BorderColorTop = clSilver
        BorderTypeRight = blSolid
        BorderColorRight = clSilver
        BorderTypeBottom = blSolid
        BorderColorBottom = clSilver
      end>
    TokenRules = <
      item
        DisplayName = 'Field'
        StyleName = 'Field'
        Expression = '\#[^\#]*\#'
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Any text'
        Expression = '[^\#]*'
        ColumnFrom = 0
        ColumnTo = 0
      end>
    BlockRules = <>
    CodeTemplates = <>
    SubAnalyzers = <>
    TokenTypeNames.Strings = (
      'Unknown'
      'Comment'
      'Identifier'
      'Symbol'
      'String'
      'Integer const'
      'Float const'
      'Hex const'
      'Char const'
      'Preprocessor')
    MarkedBlockStyle = 'Marked block'
    SkipSpaces = False
    Charset = DEFAULT_CHARSET
    Left = 416
    Top = 112
  end
  object AcpPopup: TAutoCompletePopup
    ShowWhenNone = False
    Items.WideStrings = (
      '#PAGE#'
      '#PAGECOUNT#'
      '#TITLE#'
      '#DATE#'
      '#TIME#'
      '#DATETIME#')
    DisplayItems.WideStrings = (
      'PAGE'
      'PAGECOUNT'
      'TITLE'
      'DATE'
      'TIME'
      'DATETIME')
    StartString = '#'
    AutoSize = True
    OnCheckChar = AcpPopupCheckChar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    IntegralHeight = True
    ItemHeight = 15
    BgColor = clWindow
    Width = 200
    Height = 200
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    Controls = <>
    Left = 448
    Top = 112
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'SyntAn*')
    Left = 512
    Top = 116
    LangData = {
      0C00666D5072696E745365747570010100000001000000070043617074696F6E
      01240000000300624F6B010100000002000000070043617074696F6E00070062
      43616E63656C010100000003000000070043617074696F6E0006006772486561
      64010100000004000000070043617074696F6E0007006C616248696E74010100
      000005000000070043617074696F6E000600656448656164000006006564466F
      6F74000007006772466F6E7473010100000006000000070043617074696F6E00
      090062466F6E7448656164010100000007000000070043617074696F6E000900
      62466F6E74466F6F74010100000008000000070043617074696F6E0009006246
      6F6E744E756D73010100000009000000070043617074696F6E00050067724F70
      7401010000000A000000070043617074696F6E0009006C61624F7269656E7401
      010000000B000000070043617074696F6E0008006C6162436F6C6F7201010000
      000C000000070043617074696F6E0007006C61624E756D7301010000000D0000
      00070043617074696F6E00080063624F7269656E7401010000000E0000000500
      4974656D730008006362436F6C6F727301010000000F00000005004974656D73
      00060063624E756D7301010000001000000005004974656D73000A006F704869
      52616E676573010100000011000000070043617074696F6E0008006F70547261
      6E7370010100000012000000070043617074696F6E0009006F7048694C696E65
      73010100000013000000070043617074696F6E0009006F70537461706C657301
      0100000014000000070043617074696F6E000F006F7048696465436F6C6C6170
      736564010100000015000000070043617074696F6E000A006F70576F72645772
      6170010100000016000000070043617074696F6E0009006F7053656C4F6E6C79
      010100000017000000070043617074696F6E00090067724D617267696E730101
      00000018000000070043617074696F6E0008006C6162556E6974730101000000
      19000000070043617074696F6E0007006362556E69747301010000001E000000
      05004974656D7300060065644C656674000005006564546F7000000700656452
      69676874000008006564426F74746F6D00000300446C6700000D0053796E7441
      6E616C797A65723100000800416370506F707570000101000000040048696E74
      000008006C616248696E743201010000001F000000070043617074696F6E0009
      0062466F6E7454657874010100000020000000070043617074696F6E00}
  end
end
