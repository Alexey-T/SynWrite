object fmPrintSetup: TfmPrintSetup
  Left = 190
  Top = 123
  BorderStyle = bsDialog
  Caption = 'Page setup'
  ClientHeight = 545
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
  object bOk: TButton
    Left = 344
    Top = 512
    Width = 97
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 5
  end
  object bCancel: TButton
    Left = 448
    Top = 512
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object grHead: TGroupBox
    Left = 8
    Top = 208
    Width = 537
    Height = 101
    Caption = 'Header'
    TabOrder = 2
    object edHead: TSyntaxMemo
      Left = 8
      Top = 16
      Width = 521
      Height = 77
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
  end
  object grFoot: TGroupBox
    Left = 8
    Top = 312
    Width = 537
    Height = 101
    Caption = 'Footer'
    TabOrder = 3
    object edFoot: TSyntaxMemo
      Left = 8
      Top = 16
      Width = 521
      Height = 77
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
  end
  object grFonts: TGroupBox
    Left = 8
    Top = 152
    Width = 537
    Height = 49
    Caption = 'Fonts'
    TabOrder = 1
    object bFontHead: TButton
      Left = 16
      Top = 16
      Width = 149
      Height = 25
      Caption = '&Header'
      TabOrder = 0
      OnClick = bFontNumsClick
    end
    object bFontFoot: TButton
      Left = 184
      Top = 16
      Width = 149
      Height = 25
      Caption = '&Footer'
      TabOrder = 1
      OnClick = bFontNumsClick
    end
    object bFontNums: TButton
      Left = 352
      Top = 16
      Width = 149
      Height = 25
      Caption = 'Line numbers'
      TabOrder = 2
      OnClick = bFontNumsClick
    end
  end
  object grOpt: TGroupBox
    Left = 8
    Top = 8
    Width = 537
    Height = 137
    Caption = 'Options'
    TabOrder = 0
    object Label6: TLabel
      Left = 264
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Or&ientation:'
      FocusControl = cbOrient
    end
    object Label7: TLabel
      Left = 264
      Top = 40
      Width = 34
      Height = 13
      Caption = 'C&olors:'
      FocusControl = cbColors
    end
    object Label8: TLabel
      Left = 264
      Top = 64
      Width = 67
      Height = 13
      Caption = 'Line numbers:'
      FocusControl = cbColors
    end
    object cbOrient: TComboBox
      Left = 360
      Top = 16
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      Items.Strings = (
        'Portrait'
        'Landscape')
    end
    object cbColors: TComboBox
      Left = 360
      Top = 40
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 8
      Items.Strings = (
        'RGB'
        'Gray Scale'
        'Black-and-white')
    end
    object cbNums: TComboBox
      Left = 360
      Top = 64
      Width = 169
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
    end
    object CheckRangeHL: TCheckBox
      Left = 8
      Top = 32
      Width = 240
      Height = 17
      Caption = 'Highlight ranges'
      TabOrder = 1
    end
    object CheckTransparent: TCheckBox
      Left = 8
      Top = 80
      Width = 240
      Height = 17
      Caption = 'Transparent'
      TabOrder = 4
    end
    object CheckLineHL: TCheckBox
      Left = 8
      Top = 48
      Width = 240
      Height = 17
      Caption = 'Highlight lines'
      TabOrder = 2
    end
    object CheckStaples: TCheckBox
      Left = 8
      Top = 112
      Width = 240
      Height = 17
      Caption = 'Print staples'
      TabOrder = 6
    end
    object CheckHideCollapsed: TCheckBox
      Left = 8
      Top = 64
      Width = 240
      Height = 17
      Caption = 'Hide collapsed lines'
      TabOrder = 3
    end
    object CheckWordWrap: TCheckBox
      Left = 8
      Top = 16
      Width = 240
      Height = 17
      Caption = 'Word wrap'
      TabOrder = 0
    end
    object CheckSel: TCheckBox
      Left = 8
      Top = 96
      Width = 240
      Height = 17
      Caption = 'Print selection only'
      TabOrder = 5
    end
  end
  object grMargins: TGroupBox
    Left = 8
    Top = 416
    Width = 537
    Height = 89
    Caption = 'Margins'
    TabOrder = 4
    object Label5: TLabel
      Left = 26
      Top = 22
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = '&Units:'
      FocusControl = cbUnits
    end
    object Label1: TLabel
      Left = 208
      Top = 40
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = '&Left:'
      FocusControl = EditLeft
    end
    object Label2: TLabel
      Left = 400
      Top = 40
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = '&Right:'
      FocusControl = EditRight
    end
    object Label4: TLabel
      Left = 280
      Top = 64
      Width = 38
      Height = 13
      Alignment = taRightJustify
      Caption = '&Bottom:'
      FocusControl = EditBottom
    end
    object Label3: TLabel
      Left = 296
      Top = 16
      Width = 22
      Height = 13
      Alignment = taRightJustify
      Caption = '&Top:'
      FocusControl = EditTop
    end
    object cbUnits: TComboBox
      Left = 62
      Top = 18
      Width = 107
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
    object EditLeft: TEdit
      Left = 238
      Top = 36
      Width = 63
      Height = 21
      TabOrder = 2
    end
    object EditTop: TEdit
      Left = 329
      Top = 12
      Width = 75
      Height = 21
      TabOrder = 1
    end
    object EditRight: TEdit
      Left = 438
      Top = 37
      Width = 63
      Height = 21
      TabOrder = 3
    end
    object EditBottom: TEdit
      Left = 329
      Top = 61
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
  object AutoCompletePopup1: TAutoCompletePopup
    ShowWhenNone = False
    Items.WideStrings = (
      '#PAGE#'
      '#TITLE#'
      '#DATE#'
      '#TIME#'
      '#DATETIME#')
    DisplayItems.WideStrings = (
      'PAGE'
      'TITLE'
      'DATE'
      'TIME'
      'DATETIME')
    StartString = '#'
    AutoSize = True
    OnCheckChar = AutoCompletePopup1CheckChar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
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
end
