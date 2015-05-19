object fmSetup: TfmSetup
  Left = 445
  Top = 135
  ActiveControl = ListCat
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Options'
  ClientHeight = 429
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  ShowHint = True
  OnClose = FormClose
  OnCreate = TntFormCreate
  OnShow = FormShow
  DesignSize = (
    702
    429)
  PixelsPerInch = 96
  TextHeight = 13
  object Tabs: TTntPageControl
    Left = 152
    Top = 0
    Width = 545
    Height = 397
    ActivePage = tabColors
    Style = tsButtons
    TabOrder = 0
    object tabProgSett: TTntTabSheet
      Caption = 'Program Settings'
      ImageIndex = 4
      OnShow = tabProgSettShow
      object Label11: TTntLabel
        Left = 8
        Top = 364
        Width = 169
        Height = 13
        Caption = '* - saved separately for plugin/app'
      end
      object boxProgSett: TTntGroupBox
        Left = 8
        Top = 64
        Width = 529
        Height = 189
        Caption = 'View'
        TabOrder = 1
        object TntLabel21: TTntLabel
          Left = 288
          Top = 16
          Width = 45
          Height = 13
          Caption = 'Esc key *'
        end
        object TntLabel38: TTntLabel
          Left = 288
          Top = 96
          Width = 82
          Height = 13
          Caption = 'Default sort type'
          Layout = tlCenter
        end
        object TntLabel37: TTntLabel
          Left = 288
          Top = 56
          Width = 120
          Height = 13
          Caption = 'Show recent colors menu'
          Layout = tlCenter
        end
        object cbChar: TTntCheckBox
          Left = 8
          Top = 56
          Width = 280
          Height = 17
          Caption = 'Show status "char at cursor" info'
          TabOrder = 2
        end
        object cbStat: TTntCheckBox
          Left = 8
          Top = 40
          Width = 280
          Height = 17
          Caption = 'Show status line'
          TabOrder = 1
        end
        object cbInst: TTntCheckBox
          Left = 8
          Top = 16
          Width = 280
          Height = 17
          Caption = 'Allow to run single instance only'
          TabOrder = 0
        end
        object cbEsc: TTntComboBox
          Left = 288
          Top = 32
          Width = 225
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
          Items.Strings = (
            'Do nothing'
            'Close editor'
            'Close tab'
            'Close tab or editor'
            'Minimize editor')
        end
        object cbSavePos: TTntCheckBox
          Left = 8
          Top = 104
          Width = 280
          Height = 17
          Caption = 'Save last window position'
          TabOrder = 5
        end
        object cbBeep: TTntCheckBox
          Left = 8
          Top = 148
          Width = 350
          Height = 17
          Caption = 'Allow beep sounds'
          TabOrder = 7
        end
        object cbMenuIcon: TTntCheckBox
          Left = 8
          Top = 88
          Width = 280
          Height = 17
          Caption = 'Show icons in context menu'
          TabOrder = 4
        end
        object cbFullTitle: TTntCheckBox
          Left = 8
          Top = 72
          Width = 280
          Height = 17
          Caption = 'Show full path in window caption'
          TabOrder = 3
        end
        object cbGroupLexers: TTntCheckBox
          Left = 8
          Top = 132
          Width = 350
          Height = 17
          Caption = 'Group lexers list'
          TabOrder = 6
        end
        object cbSortMode: TTntComboBox
          Left = 288
          Top = 112
          Width = 225
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            'Unicode'
            'Unicode (Win API)'
            'ASCII'
            'Numeric')
        end
        object cbRecColors: TTntComboBox
          Left = 288
          Top = 72
          Width = 225
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            'Auto-hide'
            'Always show'
            'Always hide')
        end
        object cbClipHook: TTntCheckBox
          Left = 8
          Top = 164
          Width = 350
          Height = 17
          Caption = 'Allow system-level clipboard hook'
          TabOrder = 8
        end
      end
      object boxLang: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 61
        Caption = 'Language'
        TabOrder = 0
        object labLangInfo: TTntLabel
          Left = 8
          Top = 40
          Width = 16
          Height = 13
          Caption = '----'
          Visible = False
        end
        object LabelLangMore: TTntLabel
          Left = 262
          Top = 20
          Width = 24
          Height = 13
          Cursor = crHandPoint
          Caption = 'More'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelLangMoreClick
        end
        object cbLang: TTntComboBox
          Left = 8
          Top = 16
          Width = 241
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbLangChange
        end
      end
    end
    object tabColors: TTntTabSheet
      Caption = 'Themes/Colors'
      ImageIndex = 1
      TabVisible = False
      OnShow = tabColorsShow
      object boxToolbar: TTntGroupBox
        Left = 8
        Top = 1
        Width = 529
        Height = 100
        Caption = 'Interface'
        TabOrder = 0
        object Label2: TTntLabel
          Left = 8
          Top = 16
          Width = 23
          Height = 13
          Caption = '&Skin:'
          FocusControl = cbTheme
        end
        object Label12: TTntLabel
          Left = 8
          Top = 56
          Width = 30
          Height = 13
          Caption = '&Icons:'
          FocusControl = cbIcons
        end
        object LabMoreSkins: TTntLabel
          Left = 292
          Top = 34
          Width = 24
          Height = 13
          Cursor = crHandPoint
          Caption = 'More'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabMoreSkinsClick
        end
        object LabMoreIcons: TTntLabel
          Left = 292
          Top = 74
          Width = 24
          Height = 13
          Cursor = crHandPoint
          Caption = 'More'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabMoreIconsClick
        end
        object cbTheme: TTntComboBox
          Left = 8
          Top = 32
          Width = 273
          Height = 21
          Style = csDropDownList
          DropDownCount = 25
          ItemHeight = 13
          TabOrder = 0
        end
        object cbIcons: TTntComboBox
          Left = 8
          Top = 72
          Width = 273
          Height = 21
          Style = csDropDownList
          DropDownCount = 25
          ItemHeight = 13
          TabOrder = 1
        end
      end
      object gColors: TTntGroupBox
        Left = 8
        Top = 104
        Width = 529
        Height = 249
        Caption = 'Colors'
        TabOrder = 1
        object Label4: TTntLabel
          Left = 8
          Top = 16
          Width = 47
          Height = 13
          Caption = '&Elements:'
          FocusControl = ListColors
        end
        object Label5: TTntLabel
          Left = 288
          Top = 16
          Width = 29
          Height = 13
          Caption = '&Color:'
          FocusControl = cbColors
        end
        object LabelColorInf: TTntLabel
          Left = 288
          Top = 64
          Width = 233
          Height = 65
          AutoSize = False
          Caption = 
            'Assign color from the right colorbox to any element in the left ' +
            'list. BG means background.'
          WordWrap = True
        end
        object ListColors: TTntListBox
          Left = 8
          Top = 32
          Width = 273
          Height = 205
          Style = lbOwnerDrawFixed
          AutoComplete = False
          ExtendedSelect = False
          ItemHeight = 18
          TabOrder = 0
          OnClick = ListColorsClick
          OnDrawItem = ListColorsDrawItem
        end
        object cbColors: TColorBox
          Left = 288
          Top = 32
          Width = 233
          Height = 24
          NoneColorColor = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbIncludeNone, cbCustomColor, cbPrettyNames]
          DropDownCount = 20
          ItemHeight = 18
          TabOrder = 1
          OnSelect = cbColorsSelect
        end
        object bColorLoad: TTntButton
          Left = 288
          Top = 192
          Width = 230
          Height = 21
          Caption = 'Load color preset...'
          TabOrder = 3
          OnClick = bColorLoadClick
        end
        object bColorSave: TTntButton
          Left = 288
          Top = 216
          Width = 230
          Height = 21
          Caption = 'Save color preset...'
          TabOrder = 2
          OnClick = bColorSaveClick
        end
      end
    end
    object tabFonts: TTntTabSheet
      Caption = 'Fonts'
      TabVisible = False
      OnShow = tabFontsShow
      object gFont: TTntGroupBox
        Left = 8
        Top = -3
        Width = 529
        Height = 244
        Caption = 'Fonts'
        TabOrder = 0
        object bFontText: TTntButton
          Left = 10
          Top = 16
          Width = 242
          Height = 23
          Caption = 'Text'
          TabOrder = 0
          OnClick = bFontTextClick
        end
        object bFontNumbers: TTntButton
          Left = 10
          Top = 40
          Width = 242
          Height = 23
          Caption = 'Line numbers'
          TabOrder = 1
          OnClick = bFontNumbersClick
        end
        object bFontRuler: TTntButton
          Left = 10
          Top = 64
          Width = 242
          Height = 23
          Caption = 'Ruler'
          TabOrder = 2
          OnClick = bFontRulerClick
        end
        object bFontTree: TTntButton
          Left = 10
          Top = 88
          Width = 242
          Height = 23
          Caption = 'Tree panel'
          TabOrder = 3
          OnClick = bFontTreeClick
        end
        object bFontAcp: TTntButton
          Left = 10
          Top = 160
          Width = 242
          Height = 23
          Caption = 'Auto-complete'
          TabOrder = 6
          OnClick = bFontAcpClick
        end
        object bFontOutput: TTntButton
          Left = 10
          Top = 112
          Width = 242
          Height = 23
          Caption = 'Output panel'
          TabOrder = 4
          OnClick = bFontOutputClick
        end
        object bFontConsole: TTntButton
          Left = 10
          Top = 136
          Width = 242
          Height = 23
          Caption = 'Console panel'
          TabOrder = 5
          OnClick = bFontConsoleClick
        end
        object bFontTabs: TTntButton
          Left = 10
          Top = 184
          Width = 242
          Height = 23
          Caption = 'Tabs headers'
          TabOrder = 7
          OnClick = bFontTabsClick
        end
        object bFontMenus: TTntButton
          Left = 10
          Top = 208
          Width = 242
          Height = 23
          Caption = 'Menus'
          TabOrder = 8
          OnClick = bFontMenusClick
        end
      end
    end
    object tabTabs: TTntTabSheet
      Caption = 'Tabs'
      TabVisible = False
      OnShow = tabTabsShow
      object boxTabs: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 281
        Caption = 'Tabs'
        TabOrder = 0
        object TntLabel14: TTntLabel
          Left = 72
          Top = 192
          Width = 88
          Height = 13
          Caption = 'Tab maximal width'
        end
        object TntLabel3: TTntLabel
          Left = 72
          Top = 168
          Width = 112
          Height = 13
          Caption = 'Tab edge angle (pixels)'
        end
        object TntLabel29: TTntLabel
          Left = 72
          Top = 216
          Width = 84
          Height = 13
          Caption = 'Tab minimal width'
        end
        object TntLabel13: TTntLabel
          Left = 336
          Top = 8
          Width = 188
          Height = 65
          AutoSize = False
          Caption = 
            'Tab colors (click items to change, then call colors from the tab' +
            ' context menu)'
          Layout = tlCenter
          WordWrap = True
        end
        object ShapeColor0: TShape
          Left = 344
          Top = 72
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor1: TShape
          Left = 368
          Top = 72
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor2: TShape
          Left = 392
          Top = 72
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor3: TShape
          Left = 416
          Top = 72
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor4: TShape
          Left = 440
          Top = 72
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor5: TShape
          Left = 344
          Top = 96
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor6: TShape
          Left = 368
          Top = 96
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor7: TShape
          Left = 392
          Top = 96
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor8: TShape
          Left = 416
          Top = 96
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object ShapeColor9: TShape
          Left = 440
          Top = 96
          Width = 25
          Height = 25
          OnMouseDown = ShapeColor0MouseDown
        end
        object cbTabBtn: TTntCheckBox
          Left = 8
          Top = 32
          Width = 326
          Height = 17
          Caption = 'Show "x" buttons on tabs'
          TabOrder = 1
        end
        object cbTabDown: TTntCheckBox
          Left = 8
          Top = 64
          Width = 326
          Height = 17
          Caption = 'Show tabs at bottom'
          TabOrder = 3
        end
        object cbTabNums: TTntCheckBox
          Left = 8
          Top = 80
          Width = 326
          Height = 17
          Caption = 'Show numbers on tabs'
          TabOrder = 4
        end
        object cbTabSw: TTntCheckBox
          Left = 8
          Top = 248
          Width = 433
          Height = 17
          Caption = 'Use modern tab switcher (Ctrl+Tab)'
          TabOrder = 11
        end
        object edTabMaxLen: TSpinEdit
          Left = 8
          Top = 188
          Width = 57
          Height = 22
          Increment = 10
          MaxValue = 350
          MinValue = 50
          TabOrder = 9
          Value = 50
          OnKeyDown = edIndentKeyDown
        end
        object cbTabDirs: TTntCheckBox
          Left = 8
          Top = 96
          Width = 326
          Height = 17
          Caption = 'Show file+folder names on tabs'
          TabOrder = 5
        end
        object cbTabVis: TTntCheckBox
          Left = 8
          Top = 16
          Width = 326
          Height = 17
          Caption = 'Show tabs'
          TabOrder = 0
        end
        object cbTabPlus: TTntCheckBox
          Left = 8
          Top = 48
          Width = 326
          Height = 17
          Caption = 'Show "+" tabs'
          TabOrder = 2
        end
        object edTabAngle: TSpinEdit
          Left = 8
          Top = 164
          Width = 57
          Height = 22
          MaxValue = 20
          MinValue = 0
          TabOrder = 8
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edTabMinLen: TSpinEdit
          Left = 8
          Top = 212
          Width = 57
          Height = 22
          Increment = 2
          MaxValue = 100
          MinValue = 4
          TabOrder = 10
          Value = 50
          OnKeyDown = edIndentKeyDown
        end
        object cbTabEntire: TTntCheckBox
          Left = 8
          Top = 112
          Width = 326
          Height = 17
          Caption = 'Show entire tab colored'
          TabOrder = 6
        end
        object cbTabDblClose: TTntCheckBox
          Left = 8
          Top = 128
          Width = 326
          Height = 17
          Caption = 'Close tabs by double click'
          TabOrder = 7
        end
      end
    end
    object tabCarets: TTntTabSheet
      Caption = 'Carets'
      TabVisible = False
      OnShow = tabCaretsShow
      object boxCarets: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 113
        Caption = 'Multi-carets'
        TabOrder = 0
        object TntLabel30: TTntLabel
          Left = 256
          Top = 16
          Width = 162
          Height = 13
          Caption = 'Indicate lines with multiple carets:'
        end
        object TntLabel31: TTntLabel
          Left = 320
          Top = 88
          Width = 67
          Height = 13
          Caption = 'Gutter column'
        end
        object LabelHelpCarets: TTntLabel
          Left = 24
          Top = 32
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '( ? )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelHelpCaretsClick
        end
        object cbCaretMulti: TTntCheckBox
          Left = 8
          Top = 16
          Width = 241
          Height = 17
          Caption = 'Enable multi-carets mode'
          TabOrder = 0
        end
        object cbCaretIndNone: TTntRadioButton
          Left = 256
          Top = 32
          Width = 260
          Height = 17
          Caption = 'Don'#39't indicate'
          TabOrder = 1
        end
        object cbCaretIndLine: TTntRadioButton
          Left = 256
          Top = 48
          Width = 260
          Height = 17
          Caption = 'By line background color'
          TabOrder = 2
        end
        object cbCaretIndGutter: TTntRadioButton
          Left = 256
          Top = 64
          Width = 260
          Height = 17
          Caption = 'By gutter background color'
          TabOrder = 3
        end
        object edCaretGutterCol: TSpinEdit
          Left = 272
          Top = 84
          Width = 41
          Height = 22
          MaxValue = 3
          MinValue = 0
          TabOrder = 4
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
      end
      object boxCarets2: TTntGroupBox
        Left = 8
        Top = 116
        Width = 529
        Height = 149
        Caption = 'Options'
        TabOrder = 1
        object TntLabel40: TTntLabel
          Left = 8
          Top = 20
          Width = 59
          Height = 13
          Caption = 'Caret shape'
        end
        object TntLabel41: TTntLabel
          Left = 8
          Top = 48
          Width = 44
          Height = 13
          Caption = 'Blink time'
        end
        object edCaretType: TTntComboBox
          Left = 128
          Top = 16
          Width = 57
          Height = 22
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 0
          Items.Strings = (
            ' '#9474'x1'
            ' '#9474'x2'
            ' '#9474'x3'
            '  '#9612
            '  '#9608
            '  _'
            '  '#9604)
        end
        object cbCaretSmart: TTntCheckBox
          Left = 8
          Top = 76
          Width = 249
          Height = 17
          Hint = 'Changes caret up/down/home/end behaviour inside wrapped lines.'
          Caption = 'Allow caret navigation in wrapped lines'
          TabOrder = 2
        end
        object cbCaretInText: TTntCheckBox
          Left = 8
          Top = 92
          Width = 258
          Height = 17
          Hint = 'Allows the caret to move only inside the text.'
          Caption = 'Keep caret in text'
          TabOrder = 3
        end
        object cbCaretKeepOnPaste: TTntCheckBox
          Left = 8
          Top = 108
          Width = 256
          Height = 17
          Hint = 'Don'#39't change caret position when performing Paste action.'
          Caption = 'Keep caret on paste'
          TabOrder = 4
        end
        object cbCaretInRO: TTntCheckBox
          Left = 8
          Top = 124
          Width = 256
          Height = 17
          Hint = 'Shows caret in read-only mode.'
          Caption = 'Show caret in read-only'
          TabOrder = 5
        end
        object edCaretTime: TTrackBar
          Left = 120
          Top = 40
          Width = 142
          Height = 33
          LineSize = 200
          Max = 2000
          Min = 200
          PageSize = 200
          Frequency = 300
          Position = 500
          TabOrder = 1
          ThumbLength = 18
          TickMarks = tmBoth
        end
      end
    end
    object tabOvr: TTntTabSheet
      Caption = 'Lexer Overrides'
      TabVisible = False
      OnShow = tabOvrShow
    end
    object tabKey: TTntTabSheet
      Caption = 'Keys'
      ImageIndex = 2
      TabVisible = False
      OnShow = tabKeyShow
      object TntLabel19: TTntLabel
        Left = 8
        Top = 8
        Width = 88
        Height = 13
        Caption = 'Jump to category:'
        FocusControl = cbKeyCat
      end
      object TntLabel25: TTntLabel
        Left = 8
        Top = 32
        Width = 44
        Height = 13
        Caption = 'Filter list:'
        FocusControl = edFilter
      end
      object labHelpKeys: TTntLabel
        Left = 8
        Top = 356
        Width = 19
        Height = 13
        Cursor = crHandPoint
        Caption = '( ? )'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsUnderline]
        ParentFont = False
        OnClick = labHelpKeysClick
      end
      object KeyList: TTntStringGrid
        Left = 8
        Top = 56
        Width = 529
        Height = 269
        Hint = ' '
        ColCount = 4
        Ctl3D = False
        DefaultColWidth = 110
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goDrawFocusSelected, goColSizing, goThumbTracking]
        ParentCtl3D = False
        ScrollBars = ssVertical
        TabOrder = 3
        OnClick = KeyListClick
        OnDrawCell = KeyListDrawCell
        OnMouseMove = KeyListMouseMove
        OnMouseWheelDown = KeyListMouseWheelDown
        OnMouseWheelUp = KeyListMouseWheelUp
        OnSelectCell = KeyListSelectCell
      end
      object ecHotKey: TecHotKey
        Left = 8
        Top = 331
        Width = 145
        Height = 21
        TabStop = False
        HotKey = 0
        TabOrder = 4
        OnChange = ecHotKeyChange
      end
      object bKeySet: TTntButton
        Left = 160
        Top = 330
        Width = 121
        Height = 22
        Caption = 'Set hotkey'
        Enabled = False
        TabOrder = 5
        OnClick = bKeySetClick
      end
      object bKeyClear: TTntButton
        Left = 416
        Top = 330
        Width = 121
        Height = 22
        Caption = 'Clear hotkey'
        Enabled = False
        TabOrder = 7
        OnClick = bKeyClearClick
      end
      object bKeyFind: TTntButton
        Left = 416
        Top = 358
        Width = 121
        Height = 22
        Caption = 'Find hotkey'
        TabOrder = 8
        OnClick = bKeyFindClick
      end
      object cbKeyCat: TTntComboBox
        Left = 152
        Top = 4
        Width = 281
        Height = 21
        Style = csDropDownList
        DropDownCount = 40
        ItemHeight = 13
        TabOrder = 0
        OnChange = cbKeyCatChange
      end
      object edFilter: TTntEdit
        Left = 152
        Top = 28
        Width = 281
        Height = 21
        TabOrder = 1
        OnChange = edFilterChange
      end
      object bFiltClear: TTntButton
        Left = 440
        Top = 28
        Width = 97
        Height = 22
        Caption = 'Clear'
        TabOrder = 2
        OnClick = bFiltClearClick
      end
      object bKeyExtend: TTntButton
        Left = 288
        Top = 330
        Width = 121
        Height = 22
        Caption = 'Extend hotkey'
        Enabled = False
        TabOrder = 6
        OnClick = bKeyExtendClick
      end
    end
    object tabFiles: TTntTabSheet
      Caption = 'Formats/Reload'
      ImageIndex = 3
      TabVisible = False
      OnShow = tabFilesShow
      object boxFGroup: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 89
        Caption = 'File groups'
        TabOrder = 0
        object TntLabel1: TTntLabel
          Left = 8
          Top = 16
          Width = 69
          Height = 13
          Caption = 'Non-text files:'
        end
        object Label17: TTntLabel
          Left = 8
          Top = 36
          Width = 184
          Height = 13
          Caption = 'Open in OEM encoding file extensions:'
        end
        object TntLabel8: TTntLabel
          Left = 8
          Top = 56
          Width = 191
          Height = 13
          Caption = 'Open in UTF-8 encoding file extensions:'
        end
        object TntLabel9: TTntLabel
          Left = 8
          Top = 68
          Width = 103
          Height = 13
          Caption = '(enter "*" for all files)'
        end
        object cbText_: TTntComboBox
          Left = 283
          Top = 12
          Width = 230
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Don'#39't open'
            'Open'
            'Prompt')
        end
        object edOem: TTntEdit
          Left = 283
          Top = 36
          Width = 230
          Height = 21
          TabOrder = 1
        end
        object edUTF8: TTntEdit
          Left = 283
          Top = 60
          Width = 230
          Height = 21
          TabOrder = 2
        end
      end
      object boxReload: TTntGroupBox
        Left = 8
        Top = 92
        Width = 529
        Height = 93
        Caption = 'Misc'
        TabOrder = 1
        object Label9: TTntLabel
          Left = 8
          Top = 16
          Width = 112
          Height = 13
          Caption = 'Watch for file changes:'
        end
        object TntLabel36: TTntLabel
          Left = 8
          Top = 32
          Width = 261
          Height = 13
          Caption = 'Suggest to save Unicode content in Unicode encoding:'
          WordWrap = True
        end
        object cbTail: TTntCheckBox
          Left = 8
          Top = 60
          Width = 313
          Height = 17
          Caption = 'Follow tail on reload'
          TabOrder = 2
        end
        object cbOverRO: TTntCheckBox
          Left = 352
          Top = 60
          Width = 489
          Height = 17
          Caption = 'Ask to overwrite read-only files'
          TabOrder = 3
          Visible = False
        end
        object cbNotif: TTntComboBox
          Left = 283
          Top = 12
          Width = 230
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Don'#39't watch'
            'Watch, reload w/o question'
            'Watch, ask to reload')
        end
        object cbUniNeed: TTntComboBox
          Left = 283
          Top = 36
          Width = 230
          Height = 21
          Style = csDropDownList
          DropDownCount = 15
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Don'#39't suggest'
            'Prompt to save as UTF-8'
            'Prompt to save as UTF-8, no BOM'
            'Prompt to save as UTF-16'
            'Prompt to save as UTF-16 BE'
            'Save as UTF-8'
            'Save as UTF-8, no BOM'
            'Save as UTF-16'
            'Save as UTF-16 BE')
        end
      end
    end
    object tabSearch: TTntTabSheet
      Caption = 'Search'
      TabVisible = False
      OnShow = tabSearchShow
      object TntLabel22: TTntLabel
        Left = 8
        Top = 364
        Width = 169
        Height = 13
        Caption = '* - saved separately for plugin/app'
      end
      object boxFind: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 117
        Caption = 'Search'
        TabOrder = 0
        object TntLabel32: TTntLabel
          Left = 64
          Top = 88
          Width = 211
          Height = 13
          Caption = 'Offset of search result from horizontal edge'
        end
        object cbSrWord: TTntCheckBox
          Left = 8
          Top = 32
          Width = 491
          Height = 17
          Caption = 'Suggest current word as search text'
          TabOrder = 1
        end
        object cbSrOnTop: TTntCheckBox
          Left = 8
          Top = 48
          Width = 483
          Height = 17
          Caption = 'Show search dialog on top *'
          TabOrder = 2
        end
        object cbSrSel: TTntCheckBox
          Left = 8
          Top = 16
          Width = 483
          Height = 17
          Caption = 'Suggest selection as search text'
          TabOrder = 0
        end
        object edSrOffsetY: TSpinEdit
          Left = 8
          Top = 84
          Width = 49
          Height = 22
          MaxValue = 30
          MinValue = 0
          TabOrder = 4
          Value = 3
          OnKeyDown = edIndentKeyDown
        end
        object cbSrQsCap: TTntCheckBox
          Left = 8
          Top = 64
          Width = 483
          Height = 17
          Caption = 'Show button captions on Quick Search panel'
          TabOrder = 3
        end
      end
      object boxFindTree: TTntGroupBox
        Left = 8
        Top = 120
        Width = 529
        Height = 69
        Caption = 'Mass search results panel'
        TabOrder = 1
        object TntLabel17: TTntLabel
          Left = 64
          Top = 40
          Width = 111
          Height = 13
          Caption = 'Max tree nodes per file'
        end
        object cbSrExpand: TTntCheckBox
          Left = 8
          Top = 16
          Width = 505
          Height = 17
          Caption = 'Expand tree on search progress'
          TabOrder = 0
        end
        object edSrMaxTreeMatches: TSpinEdit
          Left = 8
          Top = 36
          Width = 49
          Height = 22
          Increment = 10
          MaxValue = 2000
          MinValue = 0
          TabOrder = 1
          Value = 5
          OnKeyDown = edIndentKeyDown
        end
      end
    end
    object tabTree: TTntTabSheet
      Caption = 'Tree/Map'
      TabVisible = False
      OnShow = tabTreeShow
      object boxTree: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 105
        Caption = 'Syntax tree'
        TabOrder = 0
        object TntLabel39: TTntLabel
          Left = 72
          Top = 72
          Width = 84
          Height = 13
          Caption = 'Update delay, ms'
        end
        object TntLabel28: TTntLabel
          Left = 280
          Top = 16
          Width = 139
          Height = 13
          Caption = 'Sort for these file extensions'
        end
        object TntLabel42: TTntLabel
          Left = 280
          Top = 56
          Width = 101
          Height = 13
          Caption = 'Action of double-click'
        end
        object cbTreeSync: TTntCheckBox
          Left = 8
          Top = 16
          Width = 260
          Height = 17
          Caption = 'Auto synchronize'
          TabOrder = 0
        end
        object cbTreeDelay: TSpinEdit
          Left = 8
          Top = 68
          Width = 57
          Height = 22
          Increment = 500
          MaxValue = 10000
          MinValue = 500
          TabOrder = 3
          Value = 500
          OnKeyDown = edIndentKeyDown
        end
        object edTreeSorted: TTntEdit
          Left = 280
          Top = 32
          Width = 241
          Height = 21
          TabOrder = 4
        end
        object cbTreeExpand: TTntCheckBox
          Left = 8
          Top = 48
          Width = 260
          Height = 17
          Caption = 'Auto expand'
          TabOrder = 2
        end
        object cbTreeCollapse: TTntCheckBox
          Left = 8
          Top = 32
          Width = 260
          Height = 17
          Caption = 'Auto collapse'
          TabOrder = 1
        end
        object cbTreeClick: TTntComboBox
          Left = 280
          Top = 72
          Width = 241
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 5
          Items.Strings = (
            'None'
            'Expand/collapse node'
            'Put caret at range start'
            'Select entire range')
        end
      end
      object boxMicromap: TTntGroupBox
        Left = 8
        Top = 112
        Width = 529
        Height = 45
        Caption = 'Micro-map'
        TabOrder = 1
        object cbMicroMap: TTntCheckBox
          Left = 8
          Top = 20
          Width = 256
          Height = 17
          Caption = 'Show micro-map bar'
          TabOrder = 0
        end
      end
    end
    object tabHist: TTntTabSheet
      Caption = 'History'
      TabVisible = False
      OnShow = tabHistShow
      object boxHist: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 305
        Caption = 'History'
        TabOrder = 0
        object Label8: TTntLabel
          Left = 64
          Top = 20
          Width = 201
          Height = 13
          Caption = 'Length of file state history (0: don'#39't save)'
        end
        object Label7: TTntLabel
          Left = 64
          Top = 160
          Width = 230
          Height = 13
          Caption = 'Length of search/replace history (0: don'#39't save)'
        end
        object TntLabel11: TTntLabel
          Left = 8
          Top = 256
          Width = 107
          Height = 13
          Caption = 'Folder of Open dialog:'
        end
        object TntLabel10: TTntLabel
          Left = 8
          Top = 230
          Width = 96
          Height = 13
          Caption = 'Create backup files:'
        end
        object edFileCount: TSpinEdit
          Left = 8
          Top = 16
          Width = 49
          Height = 22
          MaxValue = 100
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edFindCount: TSpinEdit
          Left = 8
          Top = 156
          Width = 49
          Height = 22
          MaxValue = 50
          MinValue = 0
          TabOrder = 8
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbHistoryCaret: TTntCheckBox
          Left = 64
          Top = 36
          Width = 450
          Height = 17
          Caption = 'Save caret position'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbHistoryEnc: TTntCheckBox
          Left = 64
          Top = 52
          Width = 450
          Height = 17
          Caption = 'Save encoding'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object btnClearFindHistory: TTntButton
          Left = 64
          Top = 180
          Width = 113
          Height = 21
          Caption = 'Clear'
          TabOrder = 9
          OnClick = btnClearFindHistoryClick
        end
        object btnClearEdHistory: TTntButton
          Left = 64
          Top = 136
          Width = 113
          Height = 21
          Caption = 'Clear'
          TabOrder = 7
          OnClick = btnClearEdHistoryClick
        end
        object cbHistoryCleanRecents: TTntCheckBox
          Left = 8
          Top = 204
          Width = 393
          Height = 17
          Caption = 'Remove non-existing items from recents list at startup'
          TabOrder = 10
        end
        object cbDirLast: TTntComboBox
          Left = 280
          Top = 252
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 12
          Items.Strings = (
            'Follow current file'
            'Remember last folder'
            'Custom folder')
        end
        object edDirLast: TTntEdit
          Left = 64
          Top = 276
          Width = 377
          Height = 21
          TabOrder = 13
        end
        object bDirLast: TTntButton
          Left = 448
          Top = 276
          Width = 65
          Height = 21
          Caption = '...'
          TabOrder = 14
          OnClick = bDirLastClick
        end
        object cbBak: TTntComboBox
          Left = 280
          Top = 228
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            'Disabled'
            'In %AppData%\SynWrite'
            'In the same folder')
        end
        object cbHistoryForTemp: TTntCheckBox
          Left = 64
          Top = 116
          Width = 450
          Height = 17
          Caption = 'Save history for %Temp% files'
          Checked = True
          State = cbChecked
          TabOrder = 6
        end
        object cbHistoryBkmk: TTntCheckBox
          Left = 64
          Top = 84
          Width = 450
          Height = 17
          Caption = 'Save bookmarks'
          Checked = True
          State = cbChecked
          TabOrder = 4
        end
        object cbHistoryFold: TTntCheckBox
          Left = 64
          Top = 100
          Width = 450
          Height = 17
          Caption = 'Save folded blocks'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object cbHistoryWrap: TTntCheckBox
          Left = 64
          Top = 68
          Width = 450
          Height = 17
          Caption = 'Save word-wrap'
          Checked = True
          State = cbChecked
          TabOrder = 3
        end
      end
    end
    object tabSess: TTntTabSheet
      Caption = 'Sessions/Projects'
      TabVisible = False
      OnShow = tabSessShow
      object boxSess: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 73
        Caption = 'Sessions'
        TabOrder = 0
        object cbSessDef: TTntCheckBox
          Left = 24
          Top = 32
          Width = 470
          Height = 17
          Caption = 'Save "default" session on exit, not current one'
          TabOrder = 1
        end
        object cbSessLoad: TTntCheckBox
          Left = 8
          Top = 48
          Width = 500
          Height = 17
          Caption = 'Open last session on startup'
          TabOrder = 2
          OnClick = cbSessSaveClick
        end
        object cbSessSave: TTntCheckBox
          Left = 8
          Top = 16
          Width = 500
          Height = 17
          Caption = 'Save last session on exit'
          TabOrder = 0
          OnClick = cbSessSaveClick
        end
      end
      object boxProj: TTntGroupBox
        Left = 8
        Top = 76
        Width = 529
        Height = 117
        Caption = 'Projects'
        TabOrder = 1
        object cbProjLoad: TTntCheckBox
          Left = 8
          Top = 32
          Width = 500
          Height = 17
          Caption = 'Open last project on startup'
          TabOrder = 1
          OnClick = cbSessSaveClick
        end
        object cbProjSave: TTntCheckBox
          Left = 8
          Top = 16
          Width = 500
          Height = 17
          Caption = 'Save current project on exit'
          TabOrder = 0
        end
        object cbProjSessSave: TTntCheckBox
          Left = 8
          Top = 60
          Width = 500
          Height = 17
          Caption = 'Save project-related session on project closing'
          TabOrder = 2
        end
        object cbProjSessOpen: TTntCheckBox
          Left = 8
          Top = 76
          Width = 500
          Height = 17
          Caption = 'Open project-related session on project opening'
          TabOrder = 3
        end
        object cbProjCloseTabs: TTntCheckBox
          Left = 8
          Top = 92
          Width = 500
          Height = 17
          Caption = 'Close all tabs on project closing'
          TabOrder = 4
        end
      end
    end
    object tabACP: TTntTabSheet
      Caption = 'Auto-Complete'
      ImageIndex = -1
      TabVisible = False
      OnShow = tabACPShow
      object gAcpAll: TTntGroupBox
        Left = 8
        Top = 112
        Width = 529
        Height = 149
        Caption = 'Common auto-completion options'
        TabOrder = 1
        object Label42: TTntLabel
          Left = 304
          Top = 76
          Width = 53
          Height = 13
          Caption = 'Filter type:'
        end
        object TntLabel7: TTntLabel
          Left = 64
          Top = 96
          Width = 90
          Height = 13
          Caption = 'Drop-down list size'
        end
        object TntLabel12: TTntLabel
          Left = 64
          Top = 68
          Width = 233
          Height = 29
          AutoSize = False
          Caption = 'After typing ... letters, show list automatically (0 - disabled)'
          WordWrap = True
        end
        object TntLabel34: TTntLabel
          Left = 304
          Top = 20
          Width = 217
          Height = 29
          AutoSize = False
          Caption = 'Disable Tab for snippets for these file extensions:'
          WordWrap = True
        end
        object TntLabel43: TTntLabel
          Left = 64
          Top = 120
          Width = 48
          Height = 13
          Caption = 'Hint delay'
        end
        object cbAcpFilter: TTntComboBox
          Left = 304
          Top = 92
          Width = 217
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
          Items.Strings = (
            'No filtration'
            'Start of string'
            'Any part of string'
            'Characters are in the same order')
        end
        object cbAcpNone: TTntCheckBox
          Left = 8
          Top = 16
          Width = 289
          Height = 17
          Caption = 'Show list even when no items are filtered'
          TabOrder = 0
        end
        object edAcpDrop: TSpinEdit
          Left = 8
          Top = 92
          Width = 52
          Height = 22
          MaxValue = 30
          MinValue = 3
          TabOrder = 4
          Value = 3
          OnKeyDown = edIndentKeyDown
        end
        object edAcpNum: TSpinEdit
          Left = 8
          Top = 68
          Width = 52
          Height = 22
          MaxValue = 30
          MinValue = 0
          TabOrder = 3
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbAcpUseSingle: TTntCheckBox
          Left = 8
          Top = 32
          Width = 289
          Height = 17
          Caption = 'Auto insert single matching item into text'
          TabOrder = 1
        end
        object cbAcpParamHints: TTntCheckBox
          Left = 8
          Top = 48
          Width = 289
          Height = 17
          Caption = 'Auto show parameters hints'
          TabOrder = 2
        end
        object edNoSnippetsExt: TEdit
          Left = 304
          Top = 52
          Width = 217
          Height = 21
          TabOrder = 6
        end
        object edAcpHintDelay: TSpinEdit
          Left = 8
          Top = 116
          Width = 52
          Height = 22
          Increment = 100
          MaxValue = 20000
          MinValue = 100
          TabOrder = 5
          Value = 500
          OnKeyDown = edIndentKeyDown
        end
      end
      object gAcp2: TTntGroupBox
        Left = 8
        Top = 264
        Width = 529
        Height = 89
        Caption = 'Auto-completion from current file'
        TabOrder = 2
        object LabelAcpFileChars: TTntLabel
          Left = 64
          Top = 40
          Width = 184
          Height = 13
          Caption = 'Show words not shorter than ... chars'
        end
        object LabelAcpFileSize: TTntLabel
          Left = 64
          Top = 64
          Width = 200
          Height = 13
          Caption = 'Search for words only in first ... Mb of file'
        end
        object cbAcpFile: TTntCheckBox
          Left = 8
          Top = 16
          Width = 505
          Height = 17
          Caption = 'Also show words from current file'
          TabOrder = 0
          OnClick = cbAcpFileClick
        end
        object edAcpFileChars: TSpinEdit
          Left = 8
          Top = 36
          Width = 52
          Height = 22
          MaxValue = 200
          MinValue = 2
          TabOrder = 1
          Value = 2
          OnKeyDown = edIndentKeyDown
        end
        object edAcpFileSize: TEdit
          Left = 8
          Top = 60
          Width = 52
          Height = 21
          TabOrder = 2
          OnKeyDown = edIndentKeyDown
        end
      end
      object gAcpSp: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 105
        Caption = 'Special auto-completion features'
        TabOrder = 0
        object LabelHelpTabbin: TTntLabel
          Left = 440
          Top = 48
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '( ? )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelHelpTabbinClick
        end
        object LabelHelpAClose: TTntLabel
          Left = 440
          Top = 62
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '( ? )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelHelpACloseClick
        end
        object LabelHelpAcpHtml: TTntLabel
          Left = 440
          Top = 12
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '( ? )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelHelpAcpHtmlClick
        end
        object cbAcpHtm: TTntCheckBox
          Left = 8
          Top = 16
          Width = 430
          Height = 17
          Caption = 'Use special HTML auto-completion'
          TabOrder = 0
        end
        object cbAcpTabbing: TTntCheckBox
          Left = 8
          Top = 48
          Width = 430
          Height = 17
          Caption = 'Use special HTML feature - SmartTagTabbing'
          TabOrder = 2
        end
        object cbAcpCss: TTntCheckBox
          Left = 8
          Top = 32
          Width = 430
          Height = 17
          Caption = 'Use special CSS auto-completion'
          TabOrder = 1
        end
        object cbACloseTags: TTntCheckBox
          Left = 8
          Top = 64
          Width = 409
          Height = 17
          Caption = 'Auto-close HTML/XML tags'
          TabOrder = 3
        end
        object cbACloseBr: TTntCheckBox
          Left = 8
          Top = 80
          Width = 201
          Height = 17
          Caption = 'Auto-close brackets: ( ) [ ] { }'
          TabOrder = 4
          OnClick = cbACloseBrClick
        end
        object cbACloseQuote1: TTntCheckBox
          Left = 208
          Top = 80
          Width = 73
          Height = 17
          Caption = 'quotes '#39
          TabOrder = 5
          OnClick = cbACloseBrClick
        end
        object cbACloseQuote2: TTntCheckBox
          Left = 282
          Top = 80
          Width = 73
          Height = 17
          Caption = 'quotes "'
          TabOrder = 6
          OnClick = cbACloseBrClick
        end
        object cbACloseBrEsc: TTntCheckBox
          Left = 356
          Top = 80
          Width = 165
          Height = 17
          Caption = 'skip escaped \{'
          TabOrder = 7
        end
      end
    end
    object tabASave: TTntTabSheet
      Caption = 'Auto-Save'
      TabVisible = False
      OnShow = tabASaveShow
      object gASave: TTntGroupBox
        Left = 8
        Top = 4
        Width = 529
        Height = 65
        Caption = 'Auto-save when'
        TabOrder = 0
        object labASaveTime: TTntLabel
          Left = 192
          Top = 22
          Width = 37
          Height = 13
          Caption = 'minutes'
        end
        object cbASaveTimer: TTntCheckBox
          Left = 8
          Top = 20
          Width = 129
          Height = 17
          Caption = 'Every'
          TabOrder = 0
          OnClick = cbASaveTimerClick
        end
        object edASaveTime: TSpinEdit
          Left = 136
          Top = 18
          Width = 49
          Height = 22
          MaxValue = 500
          MinValue = 1
          TabOrder = 1
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbASaveFocus: TTntCheckBox
          Left = 8
          Top = 40
          Width = 393
          Height = 17
          Caption = 'On application losing focus'
          TabOrder = 2
        end
      end
      object gASaveWhat: TTntGroupBox
        Left = 8
        Top = 72
        Width = 529
        Height = 77
        Caption = 'Auto-save what'
        TabOrder = 1
        object labASavIgnore: TTntLabel
          Left = 8
          Top = 52
          Width = 110
          Height = 13
          Caption = 'Ignore files larger than'
        end
        object labKByte: TTntLabel
          Left = 344
          Top = 52
          Width = 12
          Height = 13
          Caption = 'Kb'
        end
        object cbASaveCurrFile: TTntRadioButton
          Left = 8
          Top = 16
          Width = 297
          Height = 17
          Caption = 'Current file'
          TabOrder = 0
        end
        object cbASaveAllFiles: TTntRadioButton
          Left = 8
          Top = 32
          Width = 305
          Height = 17
          Caption = 'All opened files'
          TabOrder = 1
        end
        object edASaveMaxSize: TSpinEdit
          Left = 280
          Top = 48
          Width = 57
          Height = 22
          Increment = 100
          MaxValue = 100000
          MinValue = 0
          TabOrder = 2
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
      end
      object gUnnamed: TTntGroupBox
        Left = 8
        Top = 152
        Width = 529
        Height = 97
        Caption = 'Auto-saving of unnamed files'
        TabOrder = 2
        object edASaveUnnamedDir: TEdit
          Left = 24
          Top = 68
          Width = 313
          Height = 21
          TabOrder = 0
        end
        object cbASaveUnIgnore: TTntRadioButton
          Left = 8
          Top = 16
          Width = 420
          Height = 17
          Caption = 'Ignore unnamed files'
          TabOrder = 1
          OnClick = cbASaveUnnamedClick
        end
        object cbASaveUnShowSave: TTntRadioButton
          Left = 8
          Top = 32
          Width = 420
          Height = 17
          Caption = 'Show "Save as" dialog'
          TabOrder = 2
          OnClick = cbASaveUnnamedClick
        end
        object cbASaveUnSaveToDir: TTntRadioButton
          Left = 8
          Top = 48
          Width = 420
          Height = 17
          Caption = 'Save with default name to folder:'
          TabOrder = 3
          OnClick = cbASaveUnnamedClick
        end
        object bUnnamedBrowse: TTntButton
          Left = 344
          Top = 68
          Width = 41
          Height = 21
          Caption = '...'
          TabOrder = 4
          OnClick = bUnnamedBrowseClick
        end
      end
    end
    object tabSpell: TTntTabSheet
      Caption = 'Spell Check'
      TabVisible = False
      OnShow = tabSpellShow
      object boxSpellOpt: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 125
        Caption = 'Spell checker options'
        TabOrder = 0
        object TntLabel16: TTntLabel
          Left = 8
          Top = 36
          Width = 158
          Height = 13
          Caption = 'Check &only these file extensions:'
          FocusControl = edSpellExt
        end
        object TntLabel24: TTntLabel
          Left = 8
          Top = 76
          Width = 156
          Height = 13
          Caption = 'Customize spell checking engine:'
        end
        object edSpellExt: TTntEdit
          Left = 8
          Top = 52
          Width = 329
          Height = 21
          TabOrder = 1
        end
        object cbSpellEn: TTntCheckBox
          Left = 8
          Top = 16
          Width = 313
          Height = 17
          Caption = '&Enable live spell checking'
          TabOrder = 0
        end
        object bSpellOpt: TTntButton
          Left = 8
          Top = 92
          Width = 121
          Height = 23
          Caption = '&Customize...'
          TabOrder = 2
          OnClick = bSpellOptClick
        end
      end
      object boxSpellLnk: TTntGroupBox
        Left = 8
        Top = 128
        Width = 529
        Height = 89
        Caption = 'Additional dictionaries'
        TabOrder = 1
        object TntLabel27: TTntLabel
          Left = 8
          Top = 16
          Width = 513
          Height = 29
          AutoSize = False
          Caption = 
            'You can install additional dictionaries. Download zipped package' +
            's, then unzip them into "Dictionaries" subfolder of SynWrite ins' +
            'tallation folder. Download from:'
          WordWrap = True
        end
        object labDictWww: TTntLabel
          Left = 8
          Top = 48
          Width = 137
          Height = 13
          Cursor = crHandPoint
          Caption = 'www.addictivesoftware.com'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labDictWwwClick
        end
        object labDictDir: TTntLabel
          Left = 8
          Top = 64
          Width = 123
          Height = 13
          Cursor = crHandPoint
          Caption = 'Browse dictionaries folder'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labDictDirClick
        end
      end
    end
    object tabPath: TTntTabSheet
      Caption = 'Path Environment'
      TabVisible = False
      OnShow = tabPathShow
      object boxFolders: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 281
        Caption = 'Folders'
        TabOrder = 0
        object LabelPathHint: TTntLabel
          Left = 168
          Top = 252
          Width = 286
          Height = 13
          Caption = 'Tip: add * after folder name to search also in all subfolders.'
          Visible = False
        end
        object TntLabel15: TTntLabel
          Left = 8
          Top = 16
          Width = 400
          Height = 13
          Caption = 
            'Folders, which are looked by command "Open <selection>" of edito' +
            'r context menu:'
        end
        object edFolders: TTntMemo
          Left = 8
          Top = 32
          Width = 497
          Height = 209
          ScrollBars = ssBoth
          TabOrder = 0
          OnKeyDown = edFoldersKeyDown
        end
        object bAddFolder: TTntButton
          Left = 8
          Top = 248
          Width = 153
          Height = 23
          Caption = 'Add folder...'
          TabOrder = 1
          OnClick = bAddFolderClick
        end
      end
    end
    object tabNewOpen: TTntTabSheet
      Caption = 'New/Open'
      OnShow = tabNewOpenShow
      object boxNew: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 145
        Caption = 'New document'
        TabOrder = 0
        object TntLabel4: TTntLabel
          Left = 8
          Top = 16
          Width = 43
          Height = 13
          Caption = 'Encoding'
        end
        object TntLabel5: TTntLabel
          Left = 8
          Top = 56
          Width = 59
          Height = 13
          Caption = 'Line endings'
        end
        object TntLabel6: TTntLabel
          Left = 8
          Top = 96
          Width = 27
          Height = 13
          Caption = 'Lexer'
        end
        object edEnc: TTntComboBox
          Left = 8
          Top = 32
          Width = 220
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'ANSI (Windows)'
            'OEM (DOS)'
            'UTF-8'
            'UTF-8, no BOM'
            'UTF-16'
            'UTF-16 BE')
        end
        object edLE: TTntComboBox
          Left = 8
          Top = 72
          Width = 220
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Windows'
            'Unix'
            'Mac')
        end
        object edLex: TTntComboBox
          Left = 8
          Top = 112
          Width = 220
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          Sorted = True
          TabOrder = 2
        end
      end
      object boxOpen: TTntGroupBox
        Left = 8
        Top = 148
        Width = 529
        Height = 57
        Caption = 'Open document'
        TabOrder = 1
        object TntLabel23: TTntLabel
          Left = 64
          Top = 28
          Width = 208
          Height = 13
          Caption = 'Disable lexer if file size is bigger than ... Mb'
        end
        object edBigSize: TSpinEdit
          Left = 8
          Top = 23
          Width = 49
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
      end
    end
    object tabView: TTntTabSheet
      Caption = 'View Settings'
      OnShow = tabViewShow
      object boxNonPrint: TTntGroupBox
        Left = 8
        Top = 236
        Width = 249
        Height = 89
        Caption = 'Non-printable chars'
        TabOrder = 1
        object cbNPrintShow: TTntCheckBox
          Left = 8
          Top = 16
          Width = 230
          Height = 17
          Caption = 'Show'
          TabOrder = 0
        end
        object cbNPrintSp: TTntCheckBox
          Left = 8
          Top = 32
          Width = 230
          Height = 17
          Caption = 'Spaces/tabs'
          TabOrder = 1
        end
        object cbNPrintEol: TTntCheckBox
          Left = 8
          Top = 48
          Width = 230
          Height = 17
          Caption = 'Line ends'
          TabOrder = 2
        end
        object cbNPrintEolEx: TTntCheckBox
          Left = 8
          Top = 64
          Width = 230
          Height = 17
          Caption = 'Line ends details'
          TabOrder = 3
        end
      end
      object boxView: TTntGroupBox
        Left = 8
        Top = 1
        Width = 529
        Height = 232
        TabOrder = 0
        object LabelSpace: TTntLabel
          Left = 56
          Top = 156
          Width = 58
          Height = 13
          Caption = 'Line spacing'
        end
        object LabelMargin: TTntLabel
          Left = 56
          Top = 132
          Width = 60
          Height = 13
          Caption = 'Right margin'
        end
        object LabelNums: TTntLabel
          Left = 136
          Top = 180
          Width = 63
          Height = 13
          Caption = 'Line numbers'
        end
        object LabelStaple: TTntLabel
          Left = 136
          Top = 204
          Width = 61
          Height = 13
          Caption = 'Block staples'
        end
        object LabelUnderline: TTntLabel
          Left = 320
          Top = 180
          Width = 110
          Height = 13
          Caption = 'Colored underlines size'
        end
        object cbDrawLineBG: TTntCheckBox
          Left = 272
          Top = 44
          Width = 254
          Height = 17
          Hint = 'Draws custom background for the current line.'
          Caption = 'Draw current line background'
          TabOrder = 13
        end
        object cbHideCursor: TTntCheckBox
          Left = 272
          Top = 12
          Width = 254
          Height = 17
          Hint = 
            'Hides mouse cursor when you type text and mouse cursor is within' +
            ' client area.'
          Caption = 'Hide cursor on typing'
          TabOrder = 11
        end
        object edLineSpace: TSpinEdit
          Left = 8
          Top = 152
          Width = 41
          Height = 22
          Hint = 'Vertical spacing between lines.'
          MaxValue = 10
          MinValue = -2
          TabOrder = 7
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edMargin: TSpinEdit
          Left = 8
          Top = 127
          Width = 41
          Height = 22
          Hint = 'Right margin column position.'
          MaxValue = 300
          MinValue = 1
          TabOrder = 6
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbMargin: TTntCheckBox
          Left = 8
          Top = 104
          Width = 256
          Height = 17
          Hint = 'Shows vertical line after specified column.'
          Caption = 'Show right margin'
          TabOrder = 5
        end
        object edLineNums: TTntComboBox
          Left = 8
          Top = 176
          Width = 121
          Height = 21
          Hint = 'Style of line numbering.'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
          Items.Strings = (
            'Default'
            'Delphi style'
            'Each 5th'
            'Only current')
        end
        object cbDrawFocus: TTntCheckBox
          Left = 272
          Top = 28
          Width = 254
          Height = 17
          Hint = 'Draws focus rectangle around current line when editor has focus.'
          Caption = 'Draw current line focus'
          TabOrder = 12
        end
        object cbRuler: TTntCheckBox
          Left = 8
          Top = 56
          Width = 256
          Height = 17
          Hint = 'Shows ruler above editor area.'
          Caption = 'Show horizontal ruler'
          TabOrder = 2
        end
        object cbStaples: TTntComboBox
          Left = 48
          Top = 200
          Width = 81
          Height = 22
          Hint = 'Line style of block staples.'
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 10
          OnDrawItem = cbStaplesDrawItem
        end
        object edStapleOffset: TSpinEdit
          Left = 8
          Top = 200
          Width = 41
          Height = 22
          Hint = 'Horizontal offset of block staples (in pixels).'
          MaxValue = 5
          MinValue = -5
          TabOrder = 9
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbDrawWrapMark: TTntCheckBox
          Left = 272
          Top = 76
          Width = 254
          Height = 17
          Hint = 'Draw "line is wrapped" icons on gutter.'
          Caption = 'Draw gutter "line wrapped" mark'
          TabOrder = 15
        end
        object cbDrawCol: TTntCheckBox
          Left = 272
          Top = 60
          Width = 254
          Height = 17
          Hint = 'Draw vertical line at caret'#39's column position.'
          Caption = 'Draw current column margin'
          TabOrder = 14
        end
        object cbFold: TTntCheckBox
          Left = 8
          Top = 40
          Width = 256
          Height = 17
          Hint = 'Shows code-folding bar on gutter.'
          Caption = 'Enable code folding'
          TabOrder = 1
        end
        object cbFixLineSize: TTntCheckBox
          Left = 272
          Top = 100
          Width = 254
          Height = 17
          Hint = 
            'Prevents the line height calculation. Line height will be calcul' +
            'ated by means of Default Style.'
          Caption = 'Fixed line height'
          TabOrder = 16
        end
        object cbFixColMove: TTntCheckBox
          Left = 272
          Top = 116
          Width = 254
          Height = 17
          Hint = 
            'Keeps X position of caret before editing text, this position is ' +
            'used when moving up/down caret.'
          Caption = 'Fixed column move'
          TabOrder = 17
        end
        object cbVarHorzBar: TTntCheckBox
          Left = 272
          Top = 156
          Width = 254
          Height = 17
          Hint = 
            'Recalculates horizontal scrollbar for currently displayed text o' +
            'nly.'
          Caption = 'Variable horizontal scrollbar'
          TabOrder = 19
        end
        object edColorUnder: TSpinEdit
          Left = 272
          Top = 176
          Width = 41
          Height = 22
          Hint = 
            'Width of colored lines which are drawn below HTML color codes li' +
            'ke #rrggbb. 0 - disabled.'
          MaxValue = 10
          MinValue = 0
          TabOrder = 20
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbScrollLast: TTntCheckBox
          Left = 272
          Top = 140
          Width = 254
          Height = 17
          Hint = 'After scroll to EOF, last line appears on top instead of bottom.'
          Caption = 'Last line shows on top'
          TabOrder = 18
        end
        object edWrap: TTntComboBox
          Left = 8
          Top = 16
          Width = 209
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Wrap text at editor edge'
            'Wrap text at right margin'
            'Don'#39't wrap text')
        end
        object cbGutterBm: TTntCheckBox
          Left = 8
          Top = 72
          Width = 256
          Height = 17
          Hint = 
            'Shows column for bookmarks on gutter (vertical band at the left ' +
            'side).'
          Caption = 'Show bookmarks gutter column'
          TabOrder = 3
        end
        object cbSyncIcon: TTntCheckBox
          Left = 8
          Top = 88
          Width = 256
          Height = 17
          Hint = 'Shows greenish SyncEditing icon on gutter, for selected block.'
          Caption = 'Show SyncEditing icon'
          TabOrder = 4
        end
      end
    end
    object tabSelHL: TTntTabSheet
      Caption = 'Select/Highlight'
      OnShow = tabSelHLShow
      object boxSelFmt: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 257
        TabOrder = 0
        object TntLabel35: TTntLabel
          Left = 8
          Top = 192
          Width = 100
          Height = 13
          Caption = 'Initial selection mode'
        end
        object cbUrlHilite: TTntCheckBox
          Left = 8
          Top = 16
          Width = 256
          Height = 17
          Hint = 'Underlines links and makes them clickable.'
          Caption = 'Highlight URLs (links)'
          TabOrder = 0
        end
        object cbUrlClick: TTntCheckBox
          Left = 24
          Top = 32
          Width = 243
          Height = 17
          Hint = 
            'Use just a click (without Ctrl pressed) to activate hyperlink (U' +
            'RL) under cursor.'
          Caption = 'Activate URLs by single click'
          TabOrder = 1
        end
        object cbHiliteSmart: TTntCheckBox
          Left = 8
          Top = 48
          Width = 361
          Height = 17
          Caption = 'Highlight all occurences of selected word'
          TabOrder = 2
        end
        object cbHiliteSmartCase: TTntCheckBox
          Left = 24
          Top = 80
          Width = 243
          Height = 17
          Hint = 'Makes "smart highlighting" of selected word case-sensitive.'
          Caption = 'Case sensitive'
          TabOrder = 4
        end
        object cbHiliteBrackets: TTntCheckBox
          Left = 8
          Top = 112
          Width = 256
          Height = 17
          Hint = 
            'Enables highlighting of pair brackets (if not overridden in lexe' +
            'r).'
          Caption = 'Highlight pair brackets'
          TabOrder = 6
        end
        object cbCopyLineNoSel: TTntCheckBox
          Left = 8
          Top = 136
          Width = 260
          Height = 17
          Hint = 
            'Copy/Cut operations will take current line, if no selection is m' +
            'ade in editor.'
          Caption = 'Copy/Cut current line if no selection made'
          TabOrder = 7
        end
        object cbColorOnEmpty: TTntCheckBox
          Left = 8
          Top = 168
          Width = 260
          Height = 17
          Hint = 
            'Colorize selected lines background with white space after line e' +
            'nds.'
          Caption = 'Colorize selection BG with white space'
          TabOrder = 9
        end
        object cbSelMode: TTntComboBox
          Left = 8
          Top = 208
          Width = 113
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
          Items.Strings = (
            'Normal'
            'Columns'
            'Lines')
        end
        object cbCollapseEmpty: TTntCheckBox
          Left = 272
          Top = 232
          Width = 254
          Height = 17
          Hint = 
            'Collapse empty lines after text range when this range has been c' +
            'ollapsed.'
          Caption = 'Collapse empty lines'
          TabOrder = 18
        end
        object cbSelDragDrop: TTntCheckBox
          Left = 272
          Top = 200
          Width = 254
          Height = 17
          Hint = 'Enables drag&drop operation for selected text blocks.'
          Caption = 'Enable text drag-drop'
          TabOrder = 16
        end
        object cbCopyRtf: TTntCheckBox
          Left = 8
          Top = 152
          Width = 260
          Height = 17
          Hint = 'Copies selected text also in RTF format.'
          Caption = 'Copy to clipboard as RTF'
          TabOrder = 8
        end
        object cbSelGreedy: TTntCheckBox
          Left = 272
          Top = 216
          Width = 254
          Height = 17
          Hint = 
            'Selection will contain extra column/line during column/line sele' +
            'ction modes.'
          Caption = 'Greedy selection'
          TabOrder = 17
        end
        object cbSelLineByDClick: TTntCheckBox
          Left = 272
          Top = 168
          Width = 254
          Height = 17
          Hint = 
            'Selects the entire line when you double-click any character in t' +
            'he line.'
          Caption = 'Double-click selects line'
          TabOrder = 14
        end
        object cbSelPreserve: TTntCheckBox
          Left = 272
          Top = 152
          Width = 254
          Height = 17
          Hint = 
            'Keeps marked block selected even when the cursor is moved using ' +
            'the arrow keys, until a new block is selected.'
          Caption = 'Preserve selection'
          TabOrder = 13
        end
        object cbSelOverwrite: TTntCheckBox
          Left = 272
          Top = 136
          Width = 254
          Height = 17
          Hint = 'Replaces marked block of text with whatever is typed next.'
          Caption = 'Overwrite selection'
          TabOrder = 12
        end
        object cbHiliteSmartClick: TTntCheckBox
          Left = 8
          Top = 64
          Width = 361
          Height = 17
          Caption = 'Highlight all occurences of clicked word'
          TabOrder = 3
        end
        object cbHiliteSmartWords: TTntCheckBox
          Left = 24
          Top = 96
          Width = 243
          Height = 17
          Hint = 'Allows "smart highlighting" to highlight only whole words.'
          Caption = 'Whole words only'
          TabOrder = 5
        end
        object cbSelByWords: TTntCheckBox
          Left = 272
          Top = 184
          Width = 254
          Height = 17
          Hint = 
            'Double-click then drag - performs selection by words (not by cha' +
            'rs as usual).'
          Caption = 'Double-click + drag: selects by words'
          TabOrder = 15
        end
        object cbSelJump: TTntCheckBox
          Left = 272
          Top = 120
          Width = 254
          Height = 17
          Caption = 'Left/Right keys jump to selection edge'
          TabOrder = 11
        end
      end
    end
    object tabInsertFormat: TTntTabSheet
      Caption = 'Insert/Format'
      OnShow = tabInsertFormatShow
      object boxDateFormat: TTntGroupBox
        Left = 8
        Top = 172
        Width = 529
        Height = 69
        Caption = 'Misc'
        TabOrder = 2
        object LabelHelpDateFmt: TTntLabel
          Left = 158
          Top = 20
          Width = 19
          Height = 13
          Cursor = crHandPoint
          Caption = '( ? )'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = LabelHelpDateFmtClick
        end
        object TntLabel20: TTntLabel
          Left = 184
          Top = 20
          Width = 82
          Height = 13
          Caption = 'Date/time format'
        end
        object TntLabel33: TTntLabel
          Left = 160
          Top = 44
          Width = 152
          Height = 13
          Caption = 'Date/time format for plugins log'
        end
        object edDateFmt: TTntEdit
          Left = 8
          Top = 16
          Width = 145
          Height = 21
          TabOrder = 0
        end
        object edDateFmtP: TTntEdit
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          TabOrder = 1
        end
      end
      object boxIndent: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 97
        Caption = 'Indents/spaces'
        TabOrder = 0
        object Label1: TTntLabel
          Left = 74
          Top = 20
          Width = 57
          Height = 13
          Caption = 'Block indent'
        end
        object edIndent: TSpinEdit
          Left = 8
          Top = 16
          Width = 61
          Height = 22
          Hint = 'Size of block indentation for commands Indent/Unindent.'
          MaxValue = 32
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbAutoIndent: TTntCheckBox
          Left = 8
          Top = 40
          Width = 258
          Height = 17
          Hint = 
            'Positions the cursor under the first non-blank character of the ' +
            'preceding non-blank line when you press Enter.'
          Caption = 'Auto indent mode'
          TabOrder = 1
        end
        object cbBackspUnindent: TTntCheckBox
          Left = 8
          Top = 56
          Width = 258
          Height = 17
          Hint = 
            'Aligns the insertion point to the previous indentation level (ou' +
            'tdents it) when you press Backspace.'
          Caption = 'Backspace unindents'
          TabOrder = 2
        end
        object cbUnindentAlign: TTntCheckBox
          Left = 8
          Top = 72
          Width = 256
          Height = 17
          Hint = 'Stops unindent when any line is already at pos 0.'
          Caption = 'Unindent keeps align'
          TabOrder = 3
        end
        object cbOptFill: TTntCheckBox
          Left = 264
          Top = 16
          Width = 258
          Height = 17
          Hint = 
            'Begins indented lines with the minimun number of chars possible,' +
            ' using Tab characters.'
          Caption = 'Optimal fill space with Tabs'
          TabOrder = 4
        end
        object cbKeepBlank: TTntCheckBox
          Left = 264
          Top = 32
          Width = 256
          Height = 17
          Hint = 'Don'#39't remove spaces on line ends, on file saving.'
          Caption = 'Keep trailing blanks'
          TabOrder = 5
        end
      end
      object boxTabs2: TTntGroupBox
        Left = 8
        Top = 100
        Width = 529
        Height = 69
        Caption = 'Tabulations'
        TabOrder = 1
        object Label16: TTntLabel
          Left = 112
          Top = 20
          Width = 47
          Height = 13
          Caption = 'Tab stops'
        end
        object Label6: TTntLabel
          Left = 112
          Top = 44
          Width = 47
          Height = 13
          Caption = 'Tab mode'
        end
        object edTabStops: TTntEdit
          Left = 8
          Top = 16
          Width = 97
          Height = 21
          Hint = 
            'Tab key moves cursor onto these column positions (separate with ' +
            'space).'
          TabOrder = 0
        end
        object edTabMode: TTntComboBox
          Left = 8
          Top = 40
          Width = 97
          Height = 21
          Hint = 
            'Behaviour of Tab key. SmartTab: inserts spaces to the first non-' +
            'whitespace character in the preceding line.'
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = edTabModeChange
          Items.Strings = (
            'Spaces'
            'Tab character'
            'SmartTab')
        end
        object cbReplaceTabs: TTntCheckBox
          Left = 264
          Top = 12
          Width = 256
          Height = 17
          Hint = 'Replace existing tabs with spaces also on file opening.'
          Caption = 'Replace tabs with spaces on file opening'
          TabOrder = 2
        end
      end
    end
    object tabUndo: TTntTabSheet
      Caption = 'Undo'
      OnShow = tabUndoShow
      object boxUndo: TTntGroupBox
        Left = 8
        Top = 1
        Width = 529
        Height = 136
        Caption = 'Undo'
        TabOrder = 0
        object TntLabel2: TTntLabel
          Left = 80
          Top = 24
          Width = 46
          Height = 13
          Caption = 'Undo limit'
        end
        object edUndoLimit: TSpinEdit
          Left = 8
          Top = 19
          Width = 65
          Height = 22
          Hint = 'Number of actions that can be undone.'
          Increment = 100
          MaxValue = 100000
          MinValue = 10
          TabOrder = 0
          Value = 1000
          OnKeyDown = edIndentKeyDown
        end
        object cbUndoMass: TTntCheckBox
          Left = 8
          Top = 108
          Width = 350
          Height = 17
          Hint = 
            'Allow Undo for such operations as "Delete bookmarked lines", "Pa' +
            'ste into bookmarked lines". Much slower.'
          Caption = 'Allow Undo for massive strings deletion'
          TabOrder = 5
          WordWrap = True
        end
        object cbGroupRedo: TTntCheckBox
          Left = 8
          Top = 60
          Width = 350
          Height = 17
          Hint = 'Redo will involve group of changes.'
          Caption = 'Group redo'
          TabOrder = 2
        end
        object cbGroupUndo: TTntCheckBox
          Left = 8
          Top = 44
          Width = 350
          Height = 17
          Hint = 
            'Undoes your last editing command as well as any subsequent editi' +
            'ng commands of the same type.'
          Caption = 'Group undo'
          TabOrder = 1
        end
        object cbUndoAfterSave: TTntCheckBox
          Left = 8
          Top = 76
          Width = 350
          Height = 17
          Hint = 'Don'#39't clear Undo buffer after saving file.'
          Caption = 'Undo after save'
          TabOrder = 3
        end
        object cbUndoSimple: TTntCheckBox
          Left = 8
          Top = 92
          Width = 350
          Height = 17
          Hint = 
            'Use old-style Undo procedure. Simply undo last block; otherwise:' +
            ' first move caret to block, then change text.'
          Caption = 'Simplified undo (old-style)'
          TabOrder = 4
        end
      end
    end
  end
  object bApply: TTntButton
    Left = 508
    Top = 399
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'Apply'
    TabOrder = 2
    OnClick = bApplyClick
  end
  object bCan: TTntButton
    Left = 604
    Top = 399
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 3
    OnClick = bCanClick
  end
  object bOk: TTntButton
    Left = 412
    Top = 399
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOkClick
  end
  object ListCat: TTntListBox
    Left = 8
    Top = 8
    Width = 145
    Height = 369
    ItemHeight = 13
    TabOrder = 4
    OnClick = ListCatClick
  end
  object FontDialog: TFontDialog
    OnShow = FontDialogShow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Options = [fdForceFontExist]
    Left = 156
    Top = 400
  end
  object KeyMapping: TSyntKeyMapping
    Items = <>
    Left = 184
    Top = 400
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'edCaretType.*'
      'LabelHelp*'
      'OpenDialogPre.*'
      'SaveDialogPre.*')
    Left = 276
    Top = 400
    LangData = {
      0700666D5365747570010100000001000000070043617074696F6E0168010000
      04005461627300000900746162436F6C6F727301010000009501000007004361
      7074696F6E00070067436F6C6F7273010100000067000000070043617074696F
      6E0006004C6162656C34010100000068000000070043617074696F6E0006004C
      6162656C35010100000069000000070043617074696F6E000A004C697374436F
      6C6F727300000D004C6162656C436F6C6F72496E6601010000006B0000000700
      43617074696F6E000B0074616250726F67536574740101000000780000000700
      43617074696F6E0007004C6162656C3131010100000079000000070043617074
      696F6E000B00626F7850726F675365747401010000007A000000070043617074
      696F6E000600636243686172010100000080000000070043617074696F6E0006
      00636253746174010100000082000000070043617074696F6E0006007461624B
      6579010100000089000000070043617074696F6E0007004B65794C6973740000
      08006563486F744B657900000700624B657953657401010000008A0000000700
      43617074696F6E000900624B6579436C65617201010000008B00000007004361
      7074696F6E000800624B657946696E6401010000008C00000007004361707469
      6F6E00080074616246696C65730101000000BE020000070043617074696F6E00
      060074616241435001010000009C000000070043617074696F6E000600624170
      706C790101000000A4000000070043617074696F6E0004006243616E01010000
      00A5000000070043617074696F6E000300624F6B0101000000A6000000070043
      617074696F6E000A00466F6E744469616C6F6700000A004B65794D617070696E
      67000008006362436F6C6F7273000006006362496E73740101000000B2000000
      070043617074696F6E00070067416370416C6C0101000000B300000007004361
      7074696F6E0007004C6162656C34320101000000B4000000070043617074696F
      6E000B00636241637046696C7465720101000000B700000005004974656D7300
      090063624163704E6F6E650101000000B9000000070043617074696F6E000900
      656441637044726F7000000A0062436F6C6F724C6F61640101000000DC000000
      070043617074696F6E000A0062436F6C6F72536176650101000000DD00000007
      0043617074696F6E000D004F70656E4469616C6F6750726500000D0053617665
      4469616C6F6750726500000700746162486973740101000000E7000000070043
      617074696F6E000700626F78486973740101000000E800000007004361707469
      6F6E0006004C6162656C380101000000E9000000070043617074696F6E000600
      4C6162656C370101000000EA000000070043617074696F6E000A00546E744C61
      62656C31310101000000EB000000070043617074696F6E000B00656446696C65
      436F756E7400000B00656446696E64436F756E7400000E006362486973746F72
      7943617265740101000000EC000000070043617074696F6E000C006362486973
      746F7279456E630101000000ED000000070043617074696F6E00130062746E43
      6C65617246696E64486973746F72790101000000EE000000070043617074696F
      6E00110062746E436C6561724564486973746F72790101000000EF0000000700
      43617074696F6E0015006362486973746F7279436C65616E526563656E747301
      01000000F0000000070043617074696F6E00090063624469724C617374010100
      0000F200000005004974656D7300090065644469724C61737400000800624469
      724C61737400000A00546E744C6162656C31300101000000F900000007004361
      7074696F6E000500636242616B0101000000FA00000005004974656D73000800
      65644163704E756D000005006741637032010100000003010000070043617074
      696F6E000900636241637046696C65010100000004010000070043617074696F
      6E000E00656441637046696C65436861727300000D00656441637046696C6553
      697A65000011004C6162656C41637046696C6543686172730101000000050100
      00070043617074696F6E0010004C6162656C41637046696C6553697A65010100
      000006010000070043617074696F6E00080063624B657943617400000A00546E
      744C6162656C313901010000000B010000070043617074696F6E000500636245
      736301010000000F01000005004974656D73000A00546E744C6162656C323101
      0100000010010000070043617074696F6E000900746162536561726368010100
      0000A5010000070043617074696F6E000700626F7846696E6401010000002101
      0000070043617074696F6E00080063625372576F726401010000002301000007
      0043617074696F6E000900636253724F6E546F70010100000025010000070043
      617074696F6E000A00546E744C6162656C323201010000002A01000007004361
      7074696F6E000800656446696C74657200000A00546E744C6162656C32350101
      00000034010000070043617074696F6E00090054696D657246696C7400000A00
      6246696C74436C656172010100000040010000070043617074696F6E00070063
      62537253656C010100000041010000070043617074696F6E0008007461624153
      617665010100000042010000070043617074696F6E0006006741536176650101
      00000043010000070043617074696F6E000C006362415361766554696D657201
      0100000044010000070043617074696F6E000B006564415361766554696D6500
      000C0063624153617665466F637573010100000045010000070043617074696F
      6E000A0067415361766557686174010100000046010000070043617074696F6E
      000F00636241536176654375727246696C650101000000470100000700436170
      74696F6E000F0063624153617665416C6C46696C657301010000004801000007
      0043617074696F6E000D006C61624153617649676E6F72650101000000490100
      00070043617074696F6E000E00656441536176654D617853697A6500000C006C
      6162415361766554696D6501010000004D010000070043617074696F6E000800
      6C61624B4279746501010000004E010000070043617074696F6E00080067556E
      6E616D656401010000004F010000070043617074696F6E001100656441536176
      65556E6E616D656444697200000F0063624153617665556E49676E6F72650101
      00000052010000070043617074696F6E00110063624153617665556E53686F77
      53617665010100000053010000070043617074696F6E00120063624153617665
      556E53617665546F446972010100000054010000070043617074696F6E000E00
      62556E6E616D656442726F777365000006006741637053700101000000590100
      00070043617074696F6E000800636241637048746D01010000005A0100000700
      43617074696F6E000C00636241637054616262696E6701010000005B01000007
      0043617074696F6E000800636241637043737301010000005C01000007004361
      7074696F6E000F004C6162656C48656C7054616262696E000010006362486973
      746F7279466F7254656D70010100000061010000070043617074696F6E000E00
      636241637055736553696E676C65010100000062010000070043617074696F6E
      000C00636241436C6F73655461677301010000006C010000070043617074696F
      6E000900546E744C6162656C3701010000006D010000070043617074696F6E00
      0A00546E744C6162656C313201010000006E010000070043617074696F6E000F
      004C6162656C48656C7041436C6F736500000A00636241436C6F736542720101
      00000070010000070043617074696F6E000D00636241436C6F73654272457363
      010100000072010000070043617074696F6E0007004C69737443617400000700
      7461625461627301010000007E010000070043617074696F6E000700626F7854
      61627301010000007F010000070043617074696F6E000800636254616242746E
      010100000081010000070043617074696F6E0009006362546162446F776E0101
      00000084010000070043617074696F6E00090063625461624E756D7301010000
      0085010000070043617074696F6E000700636254616253770101000000860100
      00070043617074696F6E000B0065645461624D61784C656E00000A00626F7854
      6F6F6C626172010100000089010000070043617074696F6E0006004C6162656C
      3201010000008A010000070043617074696F6E00070063625468656D65000007
      004C6162656C313201010000008B010000070043617074696F6E000700636249
      636F6E7300000800746162466F6E747301010000008D01000007004361707469
      6F6E00050067466F6E7401010000008E010000070043617074696F6E00090062
      466F6E7454657874010100000096010000070043617074696F6E000C0062466F
      6E744E756D62657273010100000097010000070043617074696F6E000A006246
      6F6E7452756C6572010100000098010000070043617074696F6E00090062466F
      6E7454726565010100000099010000070043617074696F6E00080062466F6E74
      41637001010000009A010000070043617074696F6E000B0062466F6E744F7574
      70757401010000009B010000070043617074696F6E0007007461625472656501
      010000009C010000070043617074696F6E000700626F78547265650101000000
      9D010000070043617074696F6E000A0063625472656553796E6301010000009F
      010000070043617074696F6E000700746162536573730101000000A601000007
      0043617074696F6E000700626F78536573730101000000A70100000700436170
      74696F6E0009006362536573734465660101000000A801000007004361707469
      6F6E000A006362536573734C6F61640101000000A9010000070043617074696F
      6E000A00636253657373536176650101000000AA010000070043617074696F6E
      000700626F7850726F6A0101000000AB010000070043617074696F6E000A0063
      6250726F6A4C6F61640101000000AC010000070043617074696F6E000A006362
      50726F6A536176650101000000AD010000070043617074696F6E000900626F78
      4647726F75700101000000B2010000070043617074696F6E000900546E744C61
      62656C310101000000B3010000070043617074696F6E0007006362546578745F
      0101000000B401000005004974656D730007004C6162656C31370101000000B5
      010000070043617074696F6E000900546E744C6162656C380101000000B60100
      00070043617074696F6E00050065644F656D0000060065645554463800000900
      546E744C6162656C390101000000B7010000070043617074696F6E000900626F
      7852656C6F61640101000000B8010000070043617074696F6E0006004C616265
      6C390101000000B9010000070043617074696F6E00070063624E6F7469660101
      000000BA01000005004974656D7300060063625461696C0101000000BB010000
      070043617074696F6E00080063624F766572524F0101000000BC010000070043
      617074696F6E000700746162506174680101000000CF01000007004361707469
      6F6E000A00626F78466F6C646572730101000000D3010000070043617074696F
      6E000D004C6162656C5061746848696E740101000000D0010000070043617074
      696F6E000A00546E744C6162656C31350101000000D101000007004361707469
      6F6E0009006564466F6C6465727300000A0062416464466F6C64657201010000
      00D2010000070043617074696F6E0008007461625370656C6C0101000000D401
      0000070043617074696F6E000B00626F785370656C6C4F70740101000000D501
      0000070043617074696F6E000A00546E744C6162656C31360101000000D60100
      00070043617074696F6E000A00546E744C6162656C32340101000000D7010000
      070043617074696F6E000A0065645370656C6C4578740000090063625370656C
      6C456E0101000000D8010000070043617074696F6E000900625370656C6C4F70
      740101000000D9010000070043617074696F6E000B00626F785370656C6C4C6E
      6B0101000000DA010000070043617074696F6E000A00546E744C6162656C3237
      0101000000DB010000070043617074696F6E000A006C61624469637457777701
      01000000DC010000070043617074696F6E000A006C6162446963744469720101
      000000DD010000070043617074696F6E0006007461624F76720101000000E101
      0000070043617074696F6E000B00656453724F66667365745900000A00546E74
      4C6162656C33320101000000E3010000070043617074696F6E000A00546E744C
      6162656C33360101000000ED010000070043617074696F6E0009006362556E69
      4E6565640101000000EE01000005004974656D73000B0063625472656544656C
      617900000A00546E744C6162656C33390101000000F601000007004361707469
      6F6E0009007461624361726574730101000000FA010000070043617074696F6E
      000900626F784361726574730101000000FC010000070043617074696F6E000C
      00636243617265744D756C74690101000000FB010000070043617074696F6E00
      0A00546E744C6162656C33300101000000FD010000070043617074696F6E000E
      0063624361726574496E644E6F6E650101000000FE010000070043617074696F
      6E000E0063624361726574496E644C696E650101000000FF0100000700436170
      74696F6E00100063624361726574496E64477574746572010100000000020000
      070043617074696F6E000A00546E744C6162656C333101010000000102000007
      0043617074696F6E00100065644361726574477574746572436F6C00000F004C
      6162656C48656C70436172657473000010004C6162656C48656C704163704874
      6D6C00000B00626F7846696E6454726565010100000016020000070043617074
      696F6E000A0063625372457870616E6401010000001702000007004361707469
      6F6E001200656453724D6178547265654D61746368657300000A00546E744C61
      62656C3137010100000018020000070043617074696F6E000900636253725173
      436170010100000019020000070043617074696F6E000A00626F784361726574
      7332010100000023020000070043617074696F6E000B00656443617265745479
      706500000A00546E744C6162656C343001010000001A02000007004361707469
      6F6E000C0063624361726574536D61727401020000001C020000070043617074
      696F6E1B020000040048696E74000D0063624361726574496E54657874010200
      00001E020000070043617074696F6E1D020000040048696E7400120063624361
      7265744B6565704F6E5061737465010200000020020000070043617074696F6E
      1F020000040048696E74000B0063624361726574496E524F0102000000220200
      00070043617074696F6E21020000040048696E74000A007461624E65774F7065
      6E010100000027020000070043617074696F6E000600626F784E657701010000
      002E020000070043617074696F6E000900546E744C6162656C34010100000029
      020000070043617074696F6E000900546E744C6162656C3501010000002A0200
      00070043617074696F6E000900546E744C6162656C3601010000002B02000007
      0043617074696F6E0005006564456E6301010000002C02000005004974656D73
      00040065644C4501010000002D02000005004974656D7300050065644C657800
      0007007461625669657701010000002F020000070043617074696F6E00080074
      616253656C484C010100000030020000070043617074696F6E000F0074616249
      6E73657274466F726D6174010100000031020000070043617074696F6E000900
      636253617665506F73010100000032020000070043617074696F6E000B00626F
      784D6963726F6D6170010100000033020000070043617074696F6E000A006362
      4D6963726F4D6170010100000034020000070043617074696F6E000600636242
      656570010100000035020000070043617074696F6E000A0063624D656E754963
      6F6E010100000038020000070043617074696F6E000B00636246756C6C546974
      6C65010100000039020000070043617074696F6E000D00636247726F75704C65
      7865727301010000003A020000070043617074696F6E000A006362536F72744D
      6F646501010000003B02000005004974656D73000A00546E744C6162656C3338
      01010000003C020000070043617074696F6E000A00546E744C6162656C333701
      010000003D020000070043617074696F6E000B006362526563436F6C6F727301
      010000003E02000005004974656D73000D00626F7844617465466F726D617401
      01000000B0020000070043617074696F6E000900656444617465466D74000010
      004C6162656C48656C7044617465466D7400000A00546E744C6162656C323001
      0100000040020000070043617074696F6E000A00656444617465466D74500000
      0A00546E744C6162656C3333010100000041020000070043617074696F6E0009
      00626F78496E64656E740101000000B9020000070043617074696F6E0006004C
      6162656C31010100000046020000070043617074696F6E0008006564496E6465
      6E74010100000049020000040048696E74000900626F7853656C466D7400000B
      00636255726C48696C697465010200000050020000070043617074696F6E4F02
      0000040048696E74000A00636255726C436C69636B0102000000520200000700
      43617074696F6E51020000040048696E74000D00636248696C697465536D6172
      74010100000054020000070043617074696F6E001100636248696C697465536D
      61727443617365010200000056020000070043617074696F6E55020000040048
      696E74001000636248696C697465427261636B65747301020000005802000007
      0043617074696F6E57020000040048696E74000F006362436F70794C696E654E
      6F53656C01020000005A020000070043617074696F6E59020000040048696E74
      000E006362436F6C6F724F6E456D70747901020000005C020000070043617074
      696F6E5B020000040048696E74000700626F785669657700000A004C6162656C
      537061636501010000005D020000070043617074696F6E000B004C6162656C4D
      617267696E01010000005E020000070043617074696F6E0009004C6162656C4E
      756D7301010000005F020000070043617074696F6E000B004C6162656C537461
      706C65010100000060020000070043617074696F6E000C006362447261774C69
      6E654247010200000062020000070043617074696F6E61020000040048696E74
      000C00636248696465437572736F72010200000064020000070043617074696F
      6E63020000040048696E74000B0065644C696E65537061636501010000006502
      0000040048696E7400080065644D617267696E01010000006602000004004869
      6E7400080063624D617267696E010200000068020000070043617074696F6E67
      020000040048696E74000A0065644C696E654E756D7301020000006902000004
      0048696E746A02000005004974656D73000B00636244726177466F6375730102
      0000006C020000070043617074696F6E6B020000040048696E74000700636252
      756C657201020000006E020000070043617074696F6E6D020000040048696E74
      0009006362537461706C657301010000006F020000040048696E74000E006564
      537461706C654F6666736574010100000070020000040048696E74000E006362
      44726177577261704D61726B010200000072020000070043617074696F6E7102
      0000040048696E74000900636244726177436F6C010200000074020000070043
      617074696F6E73020000040048696E74000B00626F784E6F6E5072696E740101
      00000075020000070043617074696F6E000C0063624E5072696E7453686F7701
      0100000076020000070043617074696F6E000A0063624E5072696E7453700101
      00000077020000070043617074696F6E000B0063624E5072696E74456F6C0101
      00000078020000070043617074696F6E000D0063624E5072696E74456F6C4578
      010100000079020000070043617074696F6E000700746162556E646F01010000
      007A020000070043617074696F6E000700626F78556E646F01010000007B0200
      00070043617074696F6E000900546E744C6162656C3201010000007C02000007
      0043617074696F6E000B006564556E646F4C696D697401010000007D02000004
      0048696E74000A006362556E646F4D61737301020000007F0200000700436170
      74696F6E7E020000040048696E74000B00636247726F75705265646F01020000
      0081020000070043617074696F6E80020000040048696E74000B00636247726F
      7570556E646F010200000083020000070043617074696F6E8202000004004869
      6E74000F006362556E646F416674657253617665010200000085020000070043
      617074696F6E84020000040048696E74000C0063624175746F496E64656E7401
      0200000087020000070043617074696F6E86020000040048696E740010006362
      4261636B7370556E696E64656E74010200000089020000070043617074696F6E
      88020000040048696E74000F006362556E696E64656E74416C69676E01020000
      008B020000070043617074696F6E8A020000040048696E7400090063624F7074
      46696C6C01020000008D020000070043617074696F6E8C020000040048696E74
      000B0063624B656570426C616E6B01020000008F020000070043617074696F6E
      8E020000040048696E740006006362466F6C6401020000009302000007004361
      7074696F6E92020000040048696E74000D0063624669784C696E6553697A6501
      0200000095020000070043617074696F6E94020000040048696E74000C006362
      466978436F6C4D6F766501020000009B020000070043617074696F6E9A020000
      040048696E74000C006362566172486F727A42617201020000009D0200000700
      43617074696F6E9C020000040048696E74000900636253656C4D6F6465010100
      00009E02000005004974656D73000A00546E744C6162656C333501010000009F
      020000070043617074696F6E000F006362436F6C6C61707365456D7074790102
      000000A3020000070043617074696F6EA2020000040048696E74000D00636253
      656C4472616744726F700102000000A5020000070043617074696F6EA4020000
      040048696E740009006362436F70795274660102000000A70200000700436170
      74696F6EA6020000040048696E74000B00636253656C47726565647901020000
      00A9020000070043617074696F6EA8020000040048696E74001100636253656C
      4C696E65427944436C69636B0102000000AB020000070043617074696F6EAA02
      0000040048696E74000D00636253656C50726573657276650102000000AD0200
      00070043617074696F6EAC020000040048696E74000E00636253656C4F766572
      77726974650102000000AF020000070043617074696F6EAE020000040048696E
      74000800626F7854616273320101000000B1020000070043617074696F6E000A
      00656454616253746F70730101000000B2020000040048696E740007004C6162
      656C31360101000000B3020000070043617074696F6E00090065645461624D6F
      64650102000000B4020000040048696E74B502000005004974656D730006004C
      6162656C360101000000B6020000070043617074696F6E000D0063625265706C
      616365546162730102000000B8020000070043617074696F6EB7020000040048
      696E74000700626F784C616E670101000000BB020000070043617074696F6E00
      0B006C61624C616E67496E666F0000060063624C616E6700000F006362416370
      506172616D48696E74730101000000BF020000070043617074696F6E00120063
      6248696C697465536D617274436C69636B0101000000C1020000070043617074
      696F6E001200636248696C697465536D617274576F7264730102000000C30200
      00070043617074696F6EC2020000040048696E74000E00636250726F6A536573
      73536176650101000000C4020000070043617074696F6E000E00636250726F6A
      536573734F70656E0101000000C6020000070043617074696F6E000F00636250
      726F6A436C6F7365546162730101000000C7020000070043617074696F6E000A
      00624B6579457874656E640101000000C8020000070043617074696F6E000B00
      6C616248656C704B65797300000C0062466F6E74436F6E736F6C650101000000
      C9020000070043617074696F6E000C006564436F6C6F72556E64657201010000
      00CA020000040048696E74000E004C6162656C556E6465726C696E6501010000
      00CB020000070043617074696F6E000F0065644E6F536E697070657473457874
      00000A00546E744C6162656C33340101000000CC020000070043617074696F6E
      000C00656454726565536F7274656400000A00546E744C6162656C3238010100
      0000CD020000070043617074696F6E000C0063625363726F6C6C4C6173740102
      000000CF020000070043617074696F6ECE020000040048696E74000B00506F70
      75704C6578657273000006006564577261700101000000D10200000500497465
      6D73000C00636254726565457870616E640101000000D2020000070043617074
      696F6E000E00636254726565436F6C6C617073650101000000D3020000070043
      617074696F6E0009006362546162446972730101000000D40200000700436170
      74696F6E000700626F784F70656E0101000000D5020000070043617074696F6E
      000900656442696753697A6500000A00546E744C6162656C32330101000000D6
      020000070043617074696F6E000A00546E744C6162656C31340101000000D702
      0000070043617074696F6E00080063625461625669730101000000D802000007
      0043617074696F6E0009006362546162506C75730101000000D9020000070043
      617074696F6E000A006564546162416E676C6500000900546E744C6162656C33
      0101000000DA020000070043617074696F6E00090062466F6E74546162730101
      000000DB020000070043617074696F6E000D004C6162656C4C616E674D6F7265
      0101000000DC020000070043617074696F6E000C004B65794D617070696E6750
      7900000B0065645461624D696E4C656E00000A00546E744C6162656C32390101
      000000DD020000070043617074696F6E000B006362546162456E746972650101
      000000DE020000070043617074696F6E000A00546E744C6162656C3133010100
      0000DF020000070043617074696F6E000A006362436C6970486F6F6B01010000
      00E0020000070043617074696F6E000E00636241436C6F736551756F74653201
      01000000E1020000070043617074696F6E000E00636241436C6F736551756F74
      65310101000000E2020000070043617074696F6E000A0062466F6E744D656E75
      730101000000E3020000070043617074696F6E000C004C61624D6F7265536B69
      6E730101000000E4020000070043617074696F6E000C004C61624D6F72654963
      6F6E730101000000E5020000070043617074696F6E000A00546E744C6162656C
      34310101000000E6020000070043617074696F6E000B00656443617265745469
      6D6500000A00546E744C6162656C34320101000000E702000007004361707469
      6F6E000B00636254726565436C69636B0101000000E802000005004974656D73
      000C00636253656C4279576F7264730102000000EA020000070043617074696F
      6EE9020000040048696E74000D006362486973746F7279426B6D6B0101000000
      EB020000070043617074696F6E000D006362486973746F7279466F6C64010100
      0000EC020000070043617074696F6E000D006362486973746F72795772617001
      01000000ED020000070043617074696F6E000A006362477574746572426D0102
      000000EF020000070043617074696F6EEE020000040048696E74000E00656441
      637048696E7444656C617900000A00546E744C6162656C34330101000000F002
      0000070043617074696F6E000A00636253796E6349636F6E0102000000F20200
      00070043617074696F6EF1020000040048696E74000C006362556E646F53696D
      706C650102000000F4020000070043617074696F6EF3020000040048696E7400
      0900636253656C4A756D700101000000F5020000070043617074696F6E000D00
      636254616244626C436C6F73650101000000F6020000070043617074696F6E00
      0B005368617065436F6C6F723000000B005368617065436F6C6F723100000B00
      5368617065436F6C6F723200000B005368617065436F6C6F723300000B005368
      617065436F6C6F723400000B005368617065436F6C6F723500000B0053686170
      65436F6C6F723600000B005368617065436F6C6F723700000B00536861706543
      6F6C6F723800000B005368617065436F6C6F72390000}
  end
  object OpenDialogPre: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 228
    Top = 400
  end
  object SaveDialogPre: TSaveDialog
    DefaultExt = 'colors'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 252
    Top = 400
  end
  object TimerFilt: TTimer
    Enabled = False
    Interval = 2000
    OnTimer = TimerFiltTimer
    Left = 300
    Top = 402
  end
  object PopupLexers: TTntPopupMenu
    Left = 328
    Top = 400
  end
  object KeyMappingPy: TSyntKeyMapping
    Items = <>
    Left = 200
    Top = 400
  end
end
