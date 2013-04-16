object EditorFrame: TEditorFrame
  Left = 0
  Top = 0
  Width = 443
  Height = 270
  Align = alClient
  AutoScroll = False
  Color = clWindow
  ParentColor = False
  TabOrder = 0
  OnResize = FrameResize
  object PanelMap: TPaintBox
    Left = 433
    Top = 0
    Width = 10
    Height = 270
    Align = alRight
    ParentShowHint = False
    ShowHint = True
    OnMouseDown = PanelMapMouseDown
    OnMouseMove = PanelMapMouseMove
    OnPaint = PanelMapPaint
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 433
    Height = 270
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object Splitter2: TSplitter
      Left = 0
      Top = 57
      Width = 433
      Height = 5
      Cursor = crVSplit
      Align = alTop
      Color = clBtnFace
      ParentColor = False
      ResizeStyle = rsUpdate
      OnMoved = Splitter2Moved
      OnPaint = Splitter2Paint
    end
    object EditorMaster: TSyntaxMemo
      Left = 0
      Top = 62
      Width = 433
      Height = 208
      TextSource = TextSource
      TabList.AsString = '4'
      NonPrinted.Font.Charset = DEFAULT_CHARSET
      NonPrinted.Font.Color = clSilver
      NonPrinted.Font.Height = -11
      NonPrinted.Font.Name = 'MS Sans Serif'
      NonPrinted.Font.Style = []
      LineNumbers.Margin = 0
      LineNumbers.VertAlignment = vaTop
      LineNumbers.Font.Charset = DEFAULT_CHARSET
      LineNumbers.Font.Color = clWindowText
      LineNumbers.Font.Height = -13
      LineNumbers.Font.Name = 'Courier New'
      LineNumbers.Font.Style = []
      LineNumbers.Band = 0
      LineNumbers.AutoSize = True
      Gutter.Width = 43
      Gutter.ExpandButtons.Data = {
        FA000000424DFA000000000000007600000028000000120000000B0000000100
        0400000000008400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
        1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
        FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
        00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
        FFFFF0000000000000000000000000000000111111111111111111000000}
      Gutter.Bands = <
        item
          Width = 10
          Cursor = 1
        end
        item
          Width = 15
          Cursor = crHandPoint
        end
        item
          Width = 3
          Cursor = 1
        end
        item
          Width = 15
          Color = 11644848
          Cursor = 1
        end>
      Gutter.Objects = <
        item
          ImageIndex = 13
          Band = 0
          Tag = 0
        end>
      Gutter.ExpBtnBand = 3
      Gutter.ShowSeparator = False
      Gutter.CollapsePen.Color = clGray
      Gutter.AutoSize = True
      Gutter.Cursor = 1
      Gutter.MouseMoveCaret = True
      Gutter.LineBreakObj = 0
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -13
      HintProps.Font.Name = 'Tahoma'
      HintProps.Font.Style = []
      HintProps.Color = clCream
      HintProps.ShowHints = [shCollapsed, shGutter, shTokens]
      HintProps.TimeCollapsed = 100000
      HintProps.TimeTokens = 100000
      HintProps.CollapsedLines = 10
      HintProps.Styles = fmMain.SyntStyles
      HintProps.Formated = True
      HintProps.ShowFirstLine = True
      KeyMapping = fmMain.SyntKeyMapping
      UserRanges = <>
      Animation.BookmarkAnim = atNone
      TabMode = tmSmartTab
      StaplePen.Color = clSilver
      StaplePen.Style = psDot
      CollapseStyle = csNameWhenDefined
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
      DefaultStyles.CurrentLine.FormatType = ftColor
      DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CollapseMark.Font.Color = clSilver
      DefaultStyles.CollapseMark.Font.Height = -13
      DefaultStyles.CollapseMark.Font.Name = 'Courier New'
      DefaultStyles.CollapseMark.Font.Style = []
      DefaultStyles.CollapseMark.FormatType = ftColor
      DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
      DefaultStyles.CollapseMark.BorderColorLeft = clGray
      DefaultStyles.CollapseMark.BorderTypeTop = blSolid
      DefaultStyles.CollapseMark.BorderColorTop = clGray
      DefaultStyles.CollapseMark.BorderTypeRight = blSolid
      DefaultStyles.CollapseMark.BorderColorRight = clGray
      DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
      DefaultStyles.CollapseMark.BorderColorBottom = clGray
      LineStateDisplay.Band = 2
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
      BackGround.GradColor = 15066597
      DragTypeOLE = True
      Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soCallapseEmptyLines, soDrawCurLineFocus]
      OptionsEx = [soSmartPaste, soKeepSearchMarks, soCorrectNonPrinted, soRightClickMoveCaret]
      DoubleBuffered = True
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
      Align = alClient
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      OnCaretPosChanged = EditorMasterCaretPosChanged
      OnGetGutterImage = EditorMasterGetGutterImage
      OnGutterClick = EditorMasterGutterClick
      OnGetTokenHint = EditorMasterGetTokenHint
      OnChange = EditorMasterChange
      OnAfterLineDraw = EditorMasterAfterLineDraw
      OnSetBookmark = EditorMasterSetBookmark
      OnFinishAnalysis = EditorMasterFinishAnalysis
      OnExecuteCommand = EditorMasterExecuteCommand
      OnSelectionChanged = EditorMasterSelectionChanged
      OnScroll = EditorScroll
      OnOleDragEnter = EditorMasterOleDragEnter
      OnOleDragOver = EditorMasterOleDragOver
      OnOleDrop = EditorMasterOleDrop
      OnZoom = EditorMasterZoom
      OnClick = EditorMasterEnter
      OnContextPopup = EditorMasterContextPopup
      OnEnter = EditorMasterEnter
      OnKeyDown = EditorMasterKeyDown
    end
    object EditorSlave: TSyntaxMemo
      Left = 0
      Top = 0
      Width = 433
      Height = 57
      TextSource = TextSource
      TabList.AsString = '4'
      NonPrinted.Font.Charset = DEFAULT_CHARSET
      NonPrinted.Font.Color = clSilver
      NonPrinted.Font.Height = -11
      NonPrinted.Font.Name = 'MS Sans Serif'
      NonPrinted.Font.Style = []
      LineNumbers.UnderColor = clGray
      LineNumbers.Margin = 0
      LineNumbers.VertAlignment = vaTop
      LineNumbers.Font.Charset = DEFAULT_CHARSET
      LineNumbers.Font.Color = clWindowText
      LineNumbers.Font.Height = -9
      LineNumbers.Font.Name = 'Courier New'
      LineNumbers.Font.Style = []
      LineNumbers.Band = 0
      LineNumbers.AutoSize = True
      Gutter.Width = 40
      Gutter.ExpandButtons.Data = {
        FA000000424DFA000000000000007600000028000000120000000B0000000100
        0400000000008400000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
        1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
        FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
        00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
        FFFFF0000000000000000000000000000000111111111111111111000000}
      Gutter.Bands = <
        item
          Width = 7
          Cursor = 1
        end
        item
          Width = 15
          Cursor = crHandPoint
        end
        item
          Width = 3
          Cursor = 1
        end
        item
          Width = 15
          Color = 11644848
          Cursor = 1
        end>
      Gutter.Objects = <
        item
          ImageIndex = 13
          Band = 0
          Tag = 0
        end>
      Gutter.ExpBtnBand = 3
      Gutter.ShowSeparator = False
      Gutter.CollapsePen.Color = clGray
      Gutter.AutoSize = True
      Gutter.Cursor = 1
      Gutter.MouseMoveCaret = True
      Gutter.LineBreakObj = 0
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -11
      HintProps.Font.Name = 'Tahoma'
      HintProps.Font.Style = []
      HintProps.Color = clCream
      HintProps.ShowHints = [shCollapsed, shGutter, shTokens]
      HintProps.TimeCollapsed = 100000
      HintProps.TimeTokens = 100000
      HintProps.CollapsedLines = 10
      HintProps.Styles = fmMain.SyntStyles
      HintProps.Formated = True
      KeyMapping = fmMain.SyntKeyMapping
      UserRanges = <>
      Animation.BookmarkAnim = atNone
      TabMode = tmSmartTab
      StaplePen.Color = clSilver
      StaplePen.Style = psDot
      CollapseStyle = csNameWhenDefined
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
      DefaultStyles.CurrentLine.FormatType = ftColor
      DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CollapseMark.Font.Color = clSilver
      DefaultStyles.CollapseMark.Font.Height = -13
      DefaultStyles.CollapseMark.Font.Name = 'Courier New'
      DefaultStyles.CollapseMark.Font.Style = []
      DefaultStyles.CollapseMark.FormatType = ftColor
      DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
      DefaultStyles.CollapseMark.BorderColorLeft = clGray
      DefaultStyles.CollapseMark.BorderTypeTop = blSolid
      DefaultStyles.CollapseMark.BorderColorTop = clGray
      DefaultStyles.CollapseMark.BorderTypeRight = blSolid
      DefaultStyles.CollapseMark.BorderColorRight = clGray
      DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
      DefaultStyles.CollapseMark.BorderColorBottom = clGray
      LineStateDisplay.Band = 2
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
      Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soCallapseEmptyLines, soDrawCurLineFocus]
      OptionsEx = [soSmartPaste, soKeepSearchMarks, soCorrectNonPrinted, soRightClickMoveCaret]
      DoubleBuffered = True
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
      Align = alTop
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 1
      OnCaretPosChanged = EditorMasterCaretPosChanged
      OnGetGutterImage = EditorMasterGetGutterImage
      OnGutterClick = EditorMasterGutterClick
      OnGetTokenHint = EditorMasterGetTokenHint
      OnChange = EditorMasterChange
      OnAfterLineDraw = EditorMasterAfterLineDraw
      OnSetBookmark = EditorMasterSetBookmark
      OnFinishAnalysis = EditorSlaveFinishAnalysis
      OnExecuteCommand = EditorMasterExecuteCommand
      OnSelectionChanged = EditorMasterSelectionChanged
      OnScroll = EditorScroll
      OnOleDragEnter = EditorMasterOleDragEnter
      OnOleDragOver = EditorMasterOleDragOver
      OnOleDrop = EditorMasterOleDrop
      OnZoom = EditorMasterZoom
      OnClick = EditorMasterEnter
      OnEnter = EditorMasterEnter
      OnKeyDown = EditorMasterKeyDown
    end
  end
  object ecSpellChecker: TecSpellChecker
    OnCheckWord = ecSpellCheckerCheckWord
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clWindowText
    Style.Font.Height = -13
    Style.Font.Name = 'Courier New'
    Style.Font.Style = []
    Style.FormatType = ftBackGround
    Style.BorderTypeBottom = blWavyLine
    Style.BorderColorBottom = clRed
    Editor = EditorMaster
    Active = False
    Left = 244
    Top = 156
  end
  object HyperlinkHighlighter: THyperlinkHighlighter
    Rules = <
      item
        DisplayName = 'http & ftp'
        Expression = 
          '(https?|ftp):// (\w+\:\w+@)? [\w\d\-]+(\.[\w\d\-]+)+(:\d\d?\d?\d' +
          '?\d?)? (((/~?[%+\w\d\-\\\.,=]*)+)*) (\?[^\s="'#39']+=[^\s=&"'#39']* (&[^' +
          '\s=&"'#39']+ =?([^\s=&"'#39']*)? )*)?((\#|=)[\w\d\-=,%+]+)?'
        ShellCommand = '\0'
      end
      item
        DisplayName = 'http (www)'
        Expression = 
          'www(\.[\w\d\-]+)+(:\d\d?\d?\d?\d?)?(((/[%+\w\d\-\\\.]*)+)*)(\?[^' +
          '\s=&"]+=?[^\s=&"]+(&[^\s=&"]+=[^\s=&"]+)*)?(\#[\w\d\-%+]+)?'
        ShellCommand = 'http://\0'
      end
      item
        DisplayName = 'e-mail (mailto)'
        Expression = 'mailto:\s*[_a-z\d\-\.]+@[_a-z\d\-]+(\.[_a-z\d\-]+)+'
        ShellCommand = '\0'
      end
      item
        DisplayName = 'e-mail'
        Expression = '\b[_a-z\d\-\.]+@[_a-z\d\-]+(\.[_a-z\d\-]+)+'
        ShellCommand = 'mailto:\0'
      end>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Courier New'
    Style.Font.Style = [fsUnderline]
    Left = 212
    Top = 156
  end
  object TextSource: TecEmbeddedObjects
    Left = 276
    Top = 156
  end
  object PopupSplitter: TTBXPopupMenu
    OnPopup = PopupSplitterPopup
    Left = 208
    Top = 188
    object TBXItemSplitCaption: TTBXItem
      Enabled = False
      Caption = '--- Editor splitter ---'
      Hint = ''
    end
    object TBXItemSplit20_80: TTBXItem
      OnClick = TBXItemSplit20_80Click
      Caption = '20/80'
      Hint = ''
    end
    object TBXItemSplit30_70: TTBXItem
      OnClick = TBXItemSplit30_70Click
      Caption = '30/70'
      Hint = ''
    end
    object TBXItemSplit40_60: TTBXItem
      OnClick = TBXItemSplit40_60Click
      Caption = '40/60'
      Hint = ''
    end
    object TBXItemSplit50_50: TTBXItem
      OnClick = TBXItemSplit50_50Click
      Caption = '50/50'
      Hint = ''
    end
    object TBXItemSplit60_40: TTBXItem
      OnClick = TBXItemSplit60_40Click
      Caption = '60/40'
      Hint = ''
    end
    object TBXItemSplit70_30: TTBXItem
      OnClick = TBXItemSplit70_30Click
      Caption = '70/30'
      Hint = ''
    end
    object TBXItemSplit80_20: TTBXItem
      OnClick = TBXItemSplit80_20Click
      Caption = '80/20'
      Hint = ''
    end
    object TBXSeparatorItem1: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemSplitHorz: TTBXItem
      OnClick = TBXItemSplitHorzClick
      Caption = 'Split horozintally'
      Hint = ''
    end
  end
  object TimerMap: TTimer
    OnTimer = TimerMapTimer
    Left = 240
    Top = 188
  end
end
