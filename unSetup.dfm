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
    ActivePage = tabACP
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
          Top = 88
          Width = 233
          Height = 41
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
          Height = 22
          NoneColorColor = clWhite
          Style = [cbStandardColors, cbExtendedColors, cbIncludeNone, cbCustomColor, cbPrettyNames]
          DropDownCount = 30
          ItemHeight = 18
          TabOrder = 1
          OnSelect = cbColorsSelect
        end
        object bColorLoad: TTntButton
          Left = 288
          Top = 192
          Width = 230
          Height = 23
          Caption = 'Load color preset...'
          TabOrder = 3
          OnClick = bColorLoadClick
        end
        object bColorSave: TTntButton
          Left = 288
          Top = 216
          Width = 230
          Height = 23
          Caption = 'Save color preset...'
          TabOrder = 4
          OnClick = bColorSaveClick
        end
        object bColorCustom: TTntButton
          Left = 288
          Top = 64
          Width = 230
          Height = 23
          Caption = 'Choose color...'
          TabOrder = 2
          OnClick = bColorCustomClick
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
          MaxValue = 600
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
          MaxValue = 200
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
      object boxCarets2: TTntGroupBox
        Left = 8
        Top = 2
        Width = 529
        Height = 207
        Caption = 'Options'
        TabOrder = 0
        object TntLabel40: TTntLabel
          Left = 8
          Top = 20
          Width = 59
          Height = 13
          Caption = 'Caret shape'
        end
        object TntLabel41: TTntLabel
          Left = 8
          Top = 88
          Width = 44
          Height = 13
          Caption = 'Blink time'
        end
        object LabelHelpCarets: TTntLabel
          Left = 256
          Top = 116
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
        object TntLabel18: TTntLabel
          Left = 16
          Top = 44
          Width = 75
          Height = 13
          Caption = 'overwrite mode'
        end
        object edCaretShapeIns: TTntComboBox
          Left = 144
          Top = 16
          Width = 81
          Height = 22
          Style = csDropDownList
          DropDownCount = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 0
        end
        object cbCaretSmart: TTntCheckBox
          Left = 8
          Top = 148
          Width = 300
          Height = 17
          Hint = 'Changes caret up/down/home/end behaviour inside wrapped lines.'
          Caption = 'Allow caret navigation in wrapped lines'
          TabOrder = 5
        end
        object cbCaretKeepPos: TTntCheckBox
          Left = 8
          Top = 164
          Width = 300
          Height = 17
          Hint = 'Don'#39't change caret position when performing Paste action.'
          Caption = 'Keep caret position on paste'
          TabOrder = 6
        end
        object edCaretTime: TTrackBar
          Left = 136
          Top = 72
          Width = 193
          Height = 33
          Max = 14
          Min = 3
          PageSize = 1
          Position = 5
          TabOrder = 2
          ThumbLength = 18
          TickMarks = tmBoth
        end
        object cbCaretVirtual: TTntCheckBox
          Left = 8
          Top = 132
          Width = 300
          Height = 17
          Caption = 'Allow caret position after end-of-line'
          TabOrder = 4
        end
        object cbCaretMulti: TTntCheckBox
          Left = 8
          Top = 116
          Width = 241
          Height = 17
          Caption = 'Allow multi-carets'
          TabOrder = 3
        end
        object cbCaretROnly: TTntCheckBox
          Left = 8
          Top = 180
          Width = 300
          Height = 17
          Caption = 'Show caret in read-only mode'
          TabOrder = 7
        end
        object edCaretShapeOvr: TTntComboBox
          Left = 144
          Top = 40
          Width = 81
          Height = 22
          Style = csDropDownList
          DropDownCount = 20
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          ParentFont = False
          TabOrder = 1
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
      object labelHtokeyInfo: TTntLabel
        Left = 8
        Top = 320
        Width = 481
        Height = 41
        AutoSize = False
        Caption = 
          'Hotkeys are read-only here. To change them, call Commands (F1) d' +
          'ialog, select any item, press F9, this will call Hotkey dialog.'
        WordWrap = True
      end
      object KeyList: TTntStringGrid
        Left = 8
        Top = 56
        Width = 529
        Height = 257
        Hint = ' '
        ColCount = 4
        Ctl3D = False
        DefaultColWidth = 110
        DefaultRowHeight = 16
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
      object cbKeyCat: TTntComboBox
        Left = 152
        Top = 4
        Width = 281
        Height = 21
        Style = csDropDownList
        DropDownCount = 60
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
          Top = 224
          Width = 107
          Height = 13
          Caption = 'Folder of Open dialog:'
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
          Left = 64
          Top = 244
          Width = 385
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 11
          Items.Strings = (
            'Follow current file'
            'Remember last folder'
            'Custom folder')
        end
        object edDirLast: TTntEdit
          Left = 64
          Top = 268
          Width = 385
          Height = 21
          TabOrder = 12
        end
        object bDirLast: TTntButton
          Left = 456
          Top = 268
          Width = 57
          Height = 21
          Caption = '...'
          TabOrder = 13
          OnClick = bDirLastClick
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
          Top = 72
          Width = 90
          Height = 13
          Caption = 'Drop-down list size'
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
          Top = 96
          Width = 48
          Height = 13
          Caption = 'Hint delay'
        end
        object lblInfoAutoShowACP: TLabel
          Left = 8
          Top = 120
          Width = 278
          Height = 13
          Caption = '"After typing ... chars auto-show list" moved to Overrides'
          Enabled = False
        end
        object cbAcpFilter: TTntComboBox
          Left = 304
          Top = 92
          Width = 217
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
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
          Top = 68
          Width = 52
          Height = 22
          MaxValue = 30
          MinValue = 3
          TabOrder = 3
          Value = 3
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
          TabOrder = 5
        end
        object edAcpHintDelay: TSpinEdit
          Left = 8
          Top = 92
          Width = 52
          Height = 22
          Increment = 100
          MaxValue = 20000
          MinValue = 100
          TabOrder = 4
          Value = 500
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
        Top = 228
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
        Height = 224
        TabOrder = 0
        object LabelSpace: TTntLabel
          Left = 72
          Top = 124
          Width = 58
          Height = 13
          Caption = 'Line spacing'
        end
        object LabelMargin: TTntLabel
          Left = 72
          Top = 100
          Width = 60
          Height = 13
          Caption = 'Right margin'
        end
        object LabelNums: TTntLabel
          Left = 136
          Top = 172
          Width = 63
          Height = 13
          Caption = 'Line numbers'
        end
        object LabelStaple: TTntLabel
          Left = 136
          Top = 196
          Width = 61
          Height = 13
          Caption = 'Block staples'
        end
        object cbDrawLineBG: TTntCheckBox
          Left = 272
          Top = 44
          Width = 254
          Height = 17
          Hint = 'Draws custom background for the current line.'
          Caption = 'Draw current line background'
          TabOrder = 10
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
          TabOrder = 8
        end
        object edLineSpace: TSpinEdit
          Left = 8
          Top = 120
          Width = 57
          Height = 22
          Hint = 'Vertical spacing between lines.'
          MaxValue = 10
          MinValue = -2
          TabOrder = 5
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edMargin: TSpinEdit
          Left = 8
          Top = 95
          Width = 57
          Height = 22
          Hint = 'Right margin column position.'
          MaxValue = 300
          MinValue = 1
          TabOrder = 4
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbMargin: TTntCheckBox
          Left = 8
          Top = 72
          Width = 256
          Height = 17
          Hint = 'Shows vertical line after specified column.'
          Caption = 'Show right margin'
          TabOrder = 3
        end
        object edLineNums: TTntComboBox
          Left = 8
          Top = 168
          Width = 121
          Height = 21
          Hint = 'Style of line numbering.'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
          Items.Strings = (
            'All'
            'Each 10th'
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
          TabOrder = 9
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
        object cbStapleKind: TTntComboBox
          Left = 8
          Top = 192
          Width = 121
          Height = 21
          Hint = 'Line style of block staples.'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
          Items.Strings = (
            'Solid'
            'Dotted'
            'None')
        end
        object cbGutterWrapMark: TTntCheckBox
          Left = 272
          Top = 82
          Width = 254
          Height = 17
          Hint = 'Draw "line is wrapped" icons on gutter.'
          Caption = 'Show gutter "line wrap" mark'
          TabOrder = 12
        end
        object cbDrawCol: TTntCheckBox
          Left = 272
          Top = 60
          Width = 254
          Height = 17
          Hint = 'Draw vertical line at caret'#39's column position.'
          Caption = 'Draw current column margin'
          TabOrder = 11
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
          Top = 140
          Width = 254
          Height = 17
          Hint = 
            'Prevents the line height calculation. Line height will be calcul' +
            'ated by means of Default Style.'
          Caption = 'Fixed line height'
          TabOrder = 15
        end
        object cbFixColMove: TTntCheckBox
          Left = 272
          Top = 156
          Width = 254
          Height = 17
          Hint = 
            'Keeps X position of caret before editing text, this position is ' +
            'used when moving up/down caret.'
          Caption = 'Fixed column move'
          TabOrder = 16
        end
        object cbVarHorzBar: TTntCheckBox
          Left = 272
          Top = 196
          Width = 254
          Height = 17
          Hint = 
            'Recalculates horizontal scrollbar for currently displayed text o' +
            'nly.'
          Caption = 'Variable horizontal scrollbar'
          TabOrder = 18
        end
        object cbScrollLast: TTntCheckBox
          Left = 272
          Top = 180
          Width = 254
          Height = 17
          Hint = 'After scroll to EOF, last line appears on top instead of bottom.'
          Caption = 'Last line shows on top'
          TabOrder = 17
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
        object cbGutterBmCol: TTntCheckBox
          Left = 272
          Top = 98
          Width = 254
          Height = 17
          Hint = 
            'Shows column for bookmarks on gutter (vertical band at the left ' +
            'side).'
          Caption = 'Show gutter bookmark column'
          TabOrder = 13
        end
        object cbGutterSyncIcon: TTntCheckBox
          Left = 272
          Top = 114
          Width = 254
          Height = 17
          Hint = 'Shows greenish SyncEditing icon on gutter, for selected block.'
          Caption = 'Show gutter SyncEditing icon'
          TabOrder = 14
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
        Height = 185
        TabOrder = 0
        object TntLabel35: TTntLabel
          Left = 8
          Top = 136
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
        object cbColorOnEmpty: TTntCheckBox
          Left = 8
          Top = 104
          Width = 260
          Height = 17
          Hint = 
            'Colorize selected lines background with white space after line e' +
            'nds.'
          Caption = 'Colorize selection BG with white space'
          TabOrder = 5
        end
        object cbSelMode: TTntComboBox
          Left = 8
          Top = 152
          Width = 113
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
          Items.Strings = (
            'Normal'
            'Columns'
            'Lines')
        end
        object cbCollapseEmpty: TTntCheckBox
          Left = 272
          Top = 128
          Width = 254
          Height = 17
          Hint = 
            'Collapse empty lines after text range when this range has been c' +
            'ollapsed.'
          Caption = 'Collapse empty lines'
          TabOrder = 13
        end
        object cbSelDragDrop: TTntCheckBox
          Left = 272
          Top = 96
          Width = 254
          Height = 17
          Hint = 'Enables drag&drop operation for selected text blocks.'
          Caption = 'Enable text drag-drop'
          TabOrder = 11
        end
        object cbCopyRtf: TTntCheckBox
          Left = 8
          Top = 88
          Width = 260
          Height = 17
          Hint = 'Copy: copy text also in RTF format.'
          Caption = 'Copy to clipboard as RTF'
          TabOrder = 4
        end
        object cbSelGreedy: TTntCheckBox
          Left = 272
          Top = 112
          Width = 254
          Height = 17
          Hint = 
            'Selection will contain extra column/line during column/line sele' +
            'ction modes.'
          Caption = 'Greedy selection'
          TabOrder = 12
        end
        object cbSelLineByDClick: TTntCheckBox
          Left = 272
          Top = 56
          Width = 254
          Height = 17
          Hint = 
            'Selects the entire line when you double-click any character in t' +
            'he line.'
          Caption = 'Double-click selects line'
          TabOrder = 9
        end
        object cbSelOverwrite: TTntCheckBox
          Left = 272
          Top = 32
          Width = 254
          Height = 17
          Hint = 'Replaces marked block of text with whatever is typed next.'
          Caption = 'Overwrite selection'
          TabOrder = 8
        end
        object cbSelByWords: TTntCheckBox
          Left = 272
          Top = 72
          Width = 254
          Height = 17
          Hint = 
            'Double-click then drag - performs selection by words (not by cha' +
            'rs as usual).'
          Caption = 'Double-click + drag: selects by words'
          TabOrder = 10
        end
        object cbSelJump: TTntCheckBox
          Left = 272
          Top = 16
          Width = 254
          Height = 17
          Caption = 'Left/Right keys jump to selection edge'
          TabOrder = 7
        end
        object cbCutLineNoSel: TTntCheckBox
          Left = 8
          Top = 72
          Width = 260
          Height = 17
          Hint = 'Cut: take current line, if text not selected.'
          Caption = 'Cut current line if no selection'
          TabOrder = 3
        end
        object cbCopyLineNoSel: TTntCheckBox
          Left = 8
          Top = 56
          Width = 260
          Height = 17
          Hint = 'Copy: take current line, if text not selected.'
          Caption = 'Copy current line if no selection'
          TabOrder = 2
        end
      end
    end
    object tabInsertFormat: TTntTabSheet
      Caption = 'Insert/Format'
      OnShow = tabInsertFormatShow
      object boxIndent: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 113
        Caption = 'Indents/spaces'
        TabOrder = 0
        object LabelBlickIndent: TTntLabel
          Left = 72
          Top = 20
          Width = 214
          Height = 13
          Caption = 'Block indent size (>0: in spaces, <0: in tabs)'
        end
        object edIndent: TSpinEdit
          Left = 8
          Top = 16
          Width = 61
          Height = 22
          Hint = 'Size of block indentation for commands Indent/Unindent.'
          MaxValue = 32
          MinValue = -4
          TabOrder = 0
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbAutoIndent: TTntCheckBox
          Left = 8
          Top = 40
          Width = 400
          Height = 17
          Hint = 
            'Positions the cursor under the first non-blank character of the ' +
            'preceding non-blank line when you press Enter.'
          Caption = 'Auto-indent on Enter'
          TabOrder = 1
        end
        object cbBackspUnindent: TTntCheckBox
          Left = 8
          Top = 56
          Width = 400
          Height = 17
          Hint = 
            'Aligns the insertion point to the previous indentation level (ou' +
            'tdents it) when you press Backspace.'
          Caption = 'Un-indent by BackSpace key'
          TabOrder = 2
        end
        object cbUnindentAlign: TTntCheckBox
          Left = 8
          Top = 72
          Width = 400
          Height = 17
          Hint = 'Stops unindent when any line is already at pos 0.'
          Caption = 'Don'#39't un-indent, if any line already at left edge'
          TabOrder = 3
        end
        object cbKeepBlank: TTntCheckBox
          Left = 8
          Top = 88
          Width = 400
          Height = 17
          Hint = 'Don'#39't remove spaces on line ends, on file saving.'
          Caption = 'Don'#39't remove trailing spaces on saving'
          TabOrder = 4
        end
      end
      object boxTabs2: TTntGroupBox
        Left = 8
        Top = 116
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
        Height = 120
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
          Top = 76
          Width = 350
          Height = 17
          Hint = 
            'Allow Undo for such operations as "Delete bookmarked lines", "Pa' +
            'ste into bookmarked lines". Much slower.'
          Caption = 'Allow undo for massive strings deletion'
          TabOrder = 3
          WordWrap = True
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
          Top = 60
          Width = 350
          Height = 17
          Hint = 'Don'#39't clear Undo buffer after saving file.'
          Caption = 'Allow undo after save'
          TabOrder = 2
        end
        object cbUndoSimple: TTntCheckBox
          Left = 8
          Top = 92
          Width = 350
          Height = 17
          Hint = 
            'Use old-style Undo procedure. Simply undo last block; otherwise:' +
            ' first move caret to block, then change text.'
          Caption = 'Simplified undo (don'#39't move caret first)'
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
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'LabelHelp*'
      'OpenDialogPre.*'
      'SaveDialogPre.*')
    Left = 276
    Top = 400
    LangData = {
      0700666D5365747570010100000001000000070043617074696F6E012C010000
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
      080074616246696C65730101000000BE020000070043617074696F6E00060074
      616241435001010000009C000000070043617074696F6E000600624170706C79
      0101000000A4000000070043617074696F6E0004006243616E0101000000A500
      0000070043617074696F6E000300624F6B0101000000A6000000070043617074
      696F6E000A00466F6E744469616C6F67000008006362436F6C6F727300000600
      6362496E73740101000000B2000000070043617074696F6E0007006741637041
      6C6C0101000000B3000000070043617074696F6E0007004C6162656C34320101
      000000B4000000070043617074696F6E000B00636241637046696C7465720101
      000000B700000005004974656D7300090063624163704E6F6E650101000000B9
      000000070043617074696F6E000900656441637044726F7000000A0062436F6C
      6F724C6F61640101000000DC000000070043617074696F6E000A0062436F6C6F
      72536176650101000000DD000000070043617074696F6E000D004F70656E4469
      616C6F6750726500000D00536176654469616C6F675072650000070074616248
      6973740101000000E7000000070043617074696F6E000700626F784869737401
      01000000E8000000070043617074696F6E0006004C6162656C380101000000E9
      000000070043617074696F6E0006004C6162656C370101000000EA0000000700
      43617074696F6E000A00546E744C6162656C31310101000000EB000000070043
      617074696F6E000B00656446696C65436F756E7400000B00656446696E64436F
      756E7400000E006362486973746F727943617265740101000000EC0000000700
      43617074696F6E000C006362486973746F7279456E630101000000ED00000007
      0043617074696F6E00130062746E436C65617246696E64486973746F72790101
      000000EE000000070043617074696F6E00110062746E436C6561724564486973
      746F72790101000000EF000000070043617074696F6E0015006362486973746F
      7279436C65616E526563656E74730101000000F0000000070043617074696F6E
      00090063624469724C6173740101000000F200000005004974656D7300090065
      644469724C61737400000800624469724C6173740000080063624B6579436174
      00000A00546E744C6162656C313901010000000B010000070043617074696F6E
      000500636245736301010000000F01000005004974656D73000A00546E744C61
      62656C3231010100000010010000070043617074696F6E000900746162536561
      7263680101000000A5010000070043617074696F6E000700626F7846696E6401
      0100000021010000070043617074696F6E00080063625372576F726401010000
      0023010000070043617074696F6E000900636253724F6E546F70010100000025
      010000070043617074696F6E000A00546E744C6162656C323201010000002A01
      0000070043617074696F6E000800656446696C74657200000A00546E744C6162
      656C3235010100000034010000070043617074696F6E00090054696D65724669
      6C7400000A006246696C74436C65617201010000004001000007004361707469
      6F6E0007006362537253656C010100000041010000070043617074696F6E0008
      007461624153617665010100000042010000070043617074696F6E0006006741
      53617665010100000043010000070043617074696F6E000C0063624153617665
      54696D6572010100000044010000070043617074696F6E000B00656441536176
      6554696D6500000C0063624153617665466F6375730101000000450100000700
      43617074696F6E000A0067415361766557686174010100000046010000070043
      617074696F6E000F00636241536176654375727246696C650101000000470100
      00070043617074696F6E000F0063624153617665416C6C46696C657301010000
      0048010000070043617074696F6E000D006C61624153617649676E6F72650101
      00000049010000070043617074696F6E000E00656441536176654D617853697A
      6500000C006C6162415361766554696D6501010000004D010000070043617074
      696F6E0008006C61624B4279746501010000004E010000070043617074696F6E
      00080067556E6E616D656401010000004F010000070043617074696F6E001100
      65644153617665556E6E616D656444697200000F0063624153617665556E4967
      6E6F7265010100000052010000070043617074696F6E00110063624153617665
      556E53686F7753617665010100000053010000070043617074696F6E00120063
      624153617665556E53617665546F446972010100000054010000070043617074
      696F6E000E0062556E6E616D656442726F777365000006006741637053700101
      00000059010000070043617074696F6E000800636241637048746D0101000000
      5A010000070043617074696F6E000C00636241637054616262696E6701010000
      005B010000070043617074696F6E000800636241637043737301010000005C01
      0000070043617074696F6E000F004C6162656C48656C7054616262696E000010
      006362486973746F7279466F7254656D70010100000061010000070043617074
      696F6E000E00636241637055736553696E676C65010100000062010000070043
      617074696F6E000C00636241436C6F73655461677301010000006C0100000700
      43617074696F6E000900546E744C6162656C3701010000006D01000007004361
      7074696F6E000F004C6162656C48656C7041436C6F736500000A00636241436C
      6F73654272010100000070010000070043617074696F6E000D00636241436C6F
      73654272457363010100000072010000070043617074696F6E0007004C697374
      436174000007007461625461627301010000007E010000070043617074696F6E
      000700626F785461627301010000007F010000070043617074696F6E00080063
      6254616242746E010100000081010000070043617074696F6E00090063625461
      62446F776E010100000084010000070043617074696F6E00090063625461624E
      756D73010100000085010000070043617074696F6E0007006362546162537701
      0100000086010000070043617074696F6E000B0065645461624D61784C656E00
      000A00626F78546F6F6C626172010100000089010000070043617074696F6E00
      06004C6162656C3201010000008A010000070043617074696F6E000700636254
      68656D65000007004C6162656C313201010000008B010000070043617074696F
      6E000700636249636F6E7300000800746162466F6E747301010000008D010000
      070043617074696F6E00050067466F6E7401010000008E010000070043617074
      696F6E00090062466F6E7454657874010100000096010000070043617074696F
      6E000C0062466F6E744E756D6265727301010000009701000007004361707469
      6F6E000A0062466F6E7452756C6572010100000098010000070043617074696F
      6E00090062466F6E7454726565010100000099010000070043617074696F6E00
      080062466F6E7441637001010000009A010000070043617074696F6E000B0062
      466F6E744F757470757401010000009B010000070043617074696F6E00070074
      61625472656501010000009C010000070043617074696F6E000700626F785472
      656501010000009D010000070043617074696F6E000A0063625472656553796E
      6301010000009F010000070043617074696F6E00070074616253657373010100
      0000A6010000070043617074696F6E000700626F78536573730101000000A701
      0000070043617074696F6E0009006362536573734465660101000000A8010000
      070043617074696F6E000A006362536573734C6F61640101000000A901000007
      0043617074696F6E000A00636253657373536176650101000000AA0100000700
      43617074696F6E000700626F7850726F6A0101000000AB010000070043617074
      696F6E000A00636250726F6A4C6F61640101000000AC01000007004361707469
      6F6E000A00636250726F6A536176650101000000AD010000070043617074696F
      6E000900626F784647726F75700101000000B2010000070043617074696F6E00
      0900546E744C6162656C310101000000B3010000070043617074696F6E000700
      6362546578745F0101000000B401000005004974656D730007004C6162656C31
      370101000000B5010000070043617074696F6E000900546E744C6162656C3801
      01000000B6010000070043617074696F6E00050065644F656D00000600656455
      54463800000900546E744C6162656C390101000000B701000007004361707469
      6F6E000900626F7852656C6F61640101000000B8010000070043617074696F6E
      0006004C6162656C390101000000B9010000070043617074696F6E0007006362
      4E6F7469660101000000BA01000005004974656D7300060063625461696C0101
      000000BB010000070043617074696F6E00080063624F766572524F0101000000
      BC010000070043617074696F6E000700746162506174680101000000CF010000
      070043617074696F6E000A00626F78466F6C646572730101000000D301000007
      0043617074696F6E000D004C6162656C5061746848696E740101000000D00100
      00070043617074696F6E000A00546E744C6162656C31350101000000D1010000
      070043617074696F6E0009006564466F6C6465727300000A0062416464466F6C
      6465720101000000D2010000070043617074696F6E0006007461624F76720101
      000000E1010000070043617074696F6E000B00656453724F6666736574590000
      0A00546E744C6162656C33320101000000E3010000070043617074696F6E000A
      00546E744C6162656C33360101000000ED010000070043617074696F6E000900
      6362556E694E6565640101000000EE01000005004974656D73000B0063625472
      656544656C617900000A00546E744C6162656C33390101000000F60100000700
      43617074696F6E0009007461624361726574730101000000FA01000007004361
      7074696F6E0010004C6162656C48656C7041637048746D6C00000B00626F7846
      696E6454726565010100000016020000070043617074696F6E000A0063625372
      457870616E64010100000017020000070043617074696F6E001200656453724D
      6178547265654D61746368657300000A00546E744C6162656C31370101000000
      18020000070043617074696F6E00090063625372517343617001010000001902
      0000070043617074696F6E000A00626F78436172657473320101000000230200
      00070043617074696F6E000F00656443617265745368617065496E7300000A00
      546E744C6162656C343001010000001A020000070043617074696F6E000C0063
      624361726574536D61727401020000001C020000070043617074696F6E1B0200
      00040048696E74000E00636243617265744B656570506F730102000000200200
      00070043617074696F6E1F020000040048696E74000A007461624E65774F7065
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
      7865727301010000003A020000070043617074696F6E000A00546E744C616265
      6C333701010000003D020000070043617074696F6E000B006362526563436F6C
      6F727301010000003E02000005004974656D73000900626F78496E64656E7401
      01000000B9020000070043617074696F6E0008006564496E64656E7401010000
      0049020000040048696E74000900626F7853656C466D7400000B00636255726C
      48696C697465010200000050020000070043617074696F6E4F02000004004869
      6E74000A00636255726C436C69636B010200000052020000070043617074696F
      6E51020000040048696E74000E006362436F6C6F724F6E456D70747901020000
      005C020000070043617074696F6E5B020000040048696E74000700626F785669
      657700000A004C6162656C537061636501010000005D02000007004361707469
      6F6E000B004C6162656C4D617267696E01010000005E02000007004361707469
      6F6E0009004C6162656C4E756D7301010000005F020000070043617074696F6E
      000B004C6162656C537461706C65010100000060020000070043617074696F6E
      000C006362447261774C696E654247010200000062020000070043617074696F
      6E61020000040048696E74000C00636248696465437572736F72010200000064
      020000070043617074696F6E63020000040048696E74000B0065644C696E6553
      70616365010100000065020000040048696E7400080065644D617267696E0101
      00000066020000040048696E7400080063624D617267696E0102000000680200
      00070043617074696F6E67020000040048696E74000A0065644C696E654E756D
      73010200000069020000040048696E746A02000005004974656D73000B006362
      44726177466F63757301020000006C020000070043617074696F6E6B02000004
      0048696E74000700636252756C657201020000006E020000070043617074696F
      6E6D020000040048696E74000C006362537461706C654B696E6401020000006F
      020000040048696E74F702000005004974656D73001000636247757474657257
      7261704D61726B010200000072020000070043617074696F6E71020000040048
      696E74000900636244726177436F6C010200000074020000070043617074696F
      6E73020000040048696E74000B00626F784E6F6E5072696E7401010000007502
      0000070043617074696F6E000C0063624E5072696E7453686F77010100000076
      020000070043617074696F6E000A0063624E5072696E74537001010000007702
      0000070043617074696F6E000B0063624E5072696E74456F6C01010000007802
      0000070043617074696F6E000D0063624E5072696E74456F6C45780101000000
      79020000070043617074696F6E000700746162556E646F01010000007A020000
      070043617074696F6E000700626F78556E646F01010000007B02000007004361
      7074696F6E000900546E744C6162656C3201010000007C020000070043617074
      696F6E000B006564556E646F4C696D697401010000007D020000040048696E74
      000A006362556E646F4D61737301020000007F020000070043617074696F6E7E
      020000040048696E74000B00636247726F7570556E646F010200000083020000
      070043617074696F6E82020000040048696E74000F006362556E646F41667465
      7253617665010200000085020000070043617074696F6E84020000040048696E
      74000C0063624175746F496E64656E7401020000008702000007004361707469
      6F6E86020000040048696E7400100063624261636B7370556E696E64656E7401
      0200000089020000070043617074696F6E88020000040048696E74000F006362
      556E696E64656E74416C69676E01020000008B020000070043617074696F6E8A
      020000040048696E74000B0063624B656570426C616E6B01020000008F020000
      070043617074696F6E8E020000040048696E740006006362466F6C6401020000
      0093020000070043617074696F6E92020000040048696E74000D006362466978
      4C696E6553697A65010200000095020000070043617074696F6E940200000400
      48696E74000C006362466978436F6C4D6F766501020000009B02000007004361
      7074696F6E9A020000040048696E74000C006362566172486F727A4261720102
      0000009D020000070043617074696F6E9C020000040048696E74000900636253
      656C4D6F646501010000009E02000005004974656D73000A00546E744C616265
      6C333501010000009F020000070043617074696F6E000F006362436F6C6C6170
      7365456D7074790102000000A3020000070043617074696F6EA2020000040048
      696E74000D00636253656C4472616744726F700102000000A502000007004361
      7074696F6EA4020000040048696E740009006362436F70795274660102000000
      A7020000070043617074696F6EA6020000040048696E74000B00636253656C47
      72656564790102000000A9020000070043617074696F6EA8020000040048696E
      74001100636253656C4C696E65427944436C69636B0102000000AB0200000700
      43617074696F6EAA020000040048696E74000E00636253656C4F766572777269
      74650102000000AF020000070043617074696F6EAE020000040048696E740008
      00626F7854616273320101000000B1020000070043617074696F6E000A006564
      54616253746F70730101000000B2020000040048696E740007004C6162656C31
      360101000000B3020000070043617074696F6E00090065645461624D6F646501
      02000000B4020000040048696E74B502000005004974656D730006004C616265
      6C360101000000B6020000070043617074696F6E000D0063625265706C616365
      546162730102000000B8020000070043617074696F6EB7020000040048696E74
      000700626F784C616E670101000000BB020000070043617074696F6E000B006C
      61624C616E67496E666F0000060063624C616E6700000F006362416370506172
      616D48696E74730101000000BF020000070043617074696F6E000E0063625072
      6F6A53657373536176650101000000C4020000070043617074696F6E000E0063
      6250726F6A536573734F70656E0101000000C6020000070043617074696F6E00
      0F00636250726F6A436C6F7365546162730101000000C7020000070043617074
      696F6E000C0062466F6E74436F6E736F6C650101000000C90200000700436170
      74696F6E000F0065644E6F536E69707065747345787400000A00546E744C6162
      656C33340101000000CC020000070043617074696F6E000C0065645472656553
      6F7274656400000A00546E744C6162656C32380101000000CD02000007004361
      7074696F6E000C0063625363726F6C6C4C6173740102000000CF020000070043
      617074696F6ECE020000040048696E74000B00506F7075704C65786572730000
      06006564577261700101000000D102000005004974656D73000C006362547265
      65457870616E640101000000D2020000070043617074696F6E000E0063625472
      6565436F6C6C617073650101000000D3020000070043617074696F6E00090063
      62546162446972730101000000D4020000070043617074696F6E000700626F78
      4F70656E0101000000D5020000070043617074696F6E00090065644269675369
      7A6500000A00546E744C6162656C32330101000000D602000007004361707469
      6F6E000A00546E744C6162656C31340101000000D7020000070043617074696F
      6E00080063625461625669730101000000D8020000070043617074696F6E0009
      006362546162506C75730101000000D9020000070043617074696F6E000A0065
      64546162416E676C6500000900546E744C6162656C330101000000DA02000007
      0043617074696F6E00090062466F6E74546162730101000000DB020000070043
      617074696F6E000D004C6162656C4C616E674D6F72650101000000DC02000007
      0043617074696F6E000B0065645461624D696E4C656E00000A00546E744C6162
      656C32390101000000DD020000070043617074696F6E000B006362546162456E
      746972650101000000DE020000070043617074696F6E000A006362436C697048
      6F6F6B0101000000E0020000070043617074696F6E000E00636241436C6F7365
      51756F7465320101000000E1020000070043617074696F6E000E00636241436C
      6F736551756F7465310101000000E2020000070043617074696F6E000A006246
      6F6E744D656E75730101000000E3020000070043617074696F6E000C004C6162
      4D6F7265536B696E730101000000E4020000070043617074696F6E000C004C61
      624D6F726549636F6E730101000000E5020000070043617074696F6E000A0054
      6E744C6162656C34310101000000E6020000070043617074696F6E000B006564
      436172657454696D6500000A00546E744C6162656C34320101000000E7020000
      070043617074696F6E000B00636254726565436C69636B0101000000E8020000
      05004974656D73000C00636253656C4279576F7264730102000000EA02000007
      0043617074696F6EE9020000040048696E74000D006362486973746F7279426B
      6D6B0101000000EB020000070043617074696F6E000D006362486973746F7279
      466F6C640101000000EC020000070043617074696F6E000D006362486973746F
      7279577261700101000000ED020000070043617074696F6E000D006362477574
      746572426D436F6C0102000000EF020000070043617074696F6EEE0200000400
      48696E74000E00656441637048696E7444656C617900000A00546E744C616265
      6C34330101000000F0020000070043617074696F6E0010006362477574746572
      53796E6349636F6E0102000000F2020000070043617074696F6EF10200000400
      48696E74000C006362556E646F53696D706C650102000000F402000007004361
      7074696F6EF3020000040048696E74000900636253656C4A756D700101000000
      F5020000070043617074696F6E000D00636254616244626C436C6F7365010100
      0000F6020000070043617074696F6E000E00636243617265745669727475616C
      0101000000F9020000070043617074696F6E000C00636243617265744D756C74
      690101000000FA020000070043617074696F6E000F004C6162656C48656C7043
      617265747300000C0063624361726574524F6E6C790101000000FB0200000700
      43617074696F6E000A00546E744C6162656C31380101000000FD020000070043
      617074696F6E000F006564436172657453686170654F767200000E0063624375
      744C696E654E6F53656C0102000000FF020000070043617074696F6EFE020000
      040048696E74000F006362436F70794C696E654E6F53656C0102000000010300
      00070043617074696F6E00030000040048696E74000C0062436F6C6F72437573
      746F6D010100000002030000070043617074696F6E0010004C6162656C426C69
      636B496E64656E74010100000003030000070043617074696F6E000F006C6162
      656C48746F6B6579496E666F010100000004030000070043617074696F6E0012
      006C626C496E666F4175746F53686F7741435001010000000503000007004361
      7074696F6E00}
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
end
