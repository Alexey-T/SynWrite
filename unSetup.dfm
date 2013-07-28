object fmSetup: TfmSetup
  Left = 405
  Top = 387
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
    ActivePage = tabNewOpen
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
        Height = 221
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
          Top = 72
          Width = 280
          Height = 17
          Caption = 'Show status "char at cursor" info'
          TabOrder = 3
        end
        object cbStat: TTntCheckBox
          Left = 8
          Top = 56
          Width = 280
          Height = 17
          Caption = 'Show status line'
          TabOrder = 2
        end
        object cbMenu: TTntCheckBox
          Left = 8
          Top = 40
          Width = 280
          Height = 17
          Caption = 'Show upper menu *'
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
          TabOrder = 11
          Items.Strings = (
            'Do nothing'
            'Close editor'
            'Close tab'
            'Close tab or editor'
            'Minimize editor')
        end
        object cbSavePos: TTntCheckBox
          Left = 8
          Top = 120
          Width = 280
          Height = 17
          Caption = 'Save last window position'
          TabOrder = 6
        end
        object cbBeep: TTntCheckBox
          Left = 8
          Top = 196
          Width = 350
          Height = 17
          Caption = 'Allow beep sounds'
          TabOrder = 10
        end
        object cbStripBk: TTntCheckBox
          Left = 8
          Top = 180
          Width = 350
          Height = 17
          Caption = 'Strip names in "Go to portable bookmark" dialog'
          TabOrder = 9
        end
        object cbTips: TTntCheckBox
          Left = 8
          Top = 164
          Width = 350
          Height = 17
          Caption = 'Show panels'#39' tooltips'
          TabOrder = 8
        end
        object cbMenuIcon: TTntCheckBox
          Left = 8
          Top = 104
          Width = 280
          Height = 17
          Caption = 'Show icons in context menu'
          TabOrder = 5
        end
        object cbFullTitle: TTntCheckBox
          Left = 8
          Top = 88
          Width = 280
          Height = 17
          Caption = 'Show full path in window caption'
          TabOrder = 4
        end
        object cbGroupLexers: TTntCheckBox
          Left = 8
          Top = 148
          Width = 350
          Height = 17
          Caption = 'Group lexers list'
          TabOrder = 7
        end
        object cbSortMode: TTntComboBox
          Left = 288
          Top = 112
          Width = 225
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 13
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
          TabOrder = 12
          Items.Strings = (
            'Auto-hide'
            'Always show'
            'Always hide')
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
      Caption = 'Colors'
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
          Caption = 'Skin:'
        end
        object Label12: TTntLabel
          Left = 8
          Top = 56
          Width = 30
          Height = 13
          Caption = 'Icons:'
        end
        object cbTheme: TTntComboBox
          Left = 8
          Top = 32
          Width = 249
          Height = 21
          Style = csDropDownList
          DropDownCount = 40
          ItemHeight = 13
          TabOrder = 0
        end
        object cbIcons: TTntComboBox
          Left = 8
          Top = 72
          Width = 249
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Simple'
            'Fogue 16x16'
            'Fogue 24x24'
            'Tango 16x16'
            'Tango 22x22')
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
          Caption = 'Elements:'
        end
        object Label5: TTntLabel
          Left = 286
          Top = 16
          Width = 29
          Height = 13
          Caption = 'Color:'
        end
        object ListColors: TTntListBox
          Left = 8
          Top = 32
          Width = 273
          Height = 157
          Style = lbOwnerDrawFixed
          AutoComplete = False
          ExtendedSelect = False
          ItemHeight = 13
          TabOrder = 0
          OnClick = ListColorsClick
          OnDrawItem = ListColorsDrawItem
        end
        object StaticText1: TTntStaticText
          Left = 288
          Top = 56
          Width = 233
          Height = 65
          AutoSize = False
          Caption = 
            'You can assign color from the right colorbox to any element in t' +
            'he left list. (BG means background)'
          TabOrder = 2
        end
        object ColorBox1: TColorBox
          Left = 286
          Top = 32
          Width = 177
          Height = 22
          Style = [cbStandardColors, cbExtendedColors, cbSystemColors, cbIncludeNone, cbCustomColor, cbPrettyNames]
          DropDownCount = 20
          ItemHeight = 16
          TabOrder = 1
          OnSelect = ColorBox1Select
        end
        object bColorLoad: TTntButton
          Left = 8
          Top = 196
          Width = 249
          Height = 21
          Caption = 'Load color preset...'
          TabOrder = 3
          OnClick = bColorLoadClick
        end
        object bColorSave: TTntButton
          Left = 8
          Top = 220
          Width = 249
          Height = 21
          Caption = 'Save color preset...'
          TabOrder = 4
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
        Height = 172
        Caption = 'Fonts'
        TabOrder = 0
        object b1: TTntButton
          Left = 10
          Top = 16
          Width = 242
          Height = 23
          Caption = 'Text'
          TabOrder = 0
          OnClick = b1Click
        end
        object b2: TTntButton
          Left = 10
          Top = 40
          Width = 242
          Height = 23
          Caption = 'Line numbers'
          TabOrder = 1
          OnClick = b2Click
        end
        object b4: TTntButton
          Left = 10
          Top = 64
          Width = 242
          Height = 23
          Caption = 'Ruler'
          TabOrder = 2
          OnClick = b4Click
        end
        object b3: TTntButton
          Left = 10
          Top = 88
          Width = 242
          Height = 23
          Caption = 'Tree'
          TabOrder = 3
          OnClick = b3Click
        end
        object b5: TTntButton
          Left = 10
          Top = 112
          Width = 242
          Height = 23
          Caption = 'Auto-complete'
          TabOrder = 4
          OnClick = b5Click
        end
        object b6: TTntButton
          Left = 10
          Top = 136
          Width = 242
          Height = 23
          Caption = 'Output panel'
          TabOrder = 5
          OnClick = b6Click
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
        Height = 217
        Caption = 'Tabs'
        TabOrder = 0
        object TntLabel3: TTntLabel
          Left = 56
          Top = 112
          Width = 109
          Height = 13
          Caption = 'Maximal caption length'
        end
        object TntLabel13: TTntLabel
          Left = 445
          Top = 12
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tabs colors:'
        end
        object cbTabBtn: TTntCheckBox
          Left = 8
          Top = 72
          Width = 380
          Height = 17
          Caption = 'Show close buttons on tabs'
          TabOrder = 3
        end
        object cbTabMul: TTntCheckBox
          Left = 8
          Top = 88
          Width = 380
          Height = 17
          Caption = 'Show multiple tab lines'
          TabOrder = 4
        end
        object cbTabDown: TTntCheckBox
          Left = 8
          Top = 40
          Width = 380
          Height = 17
          Caption = 'Show tabs at bottom'
          TabOrder = 1
        end
        object cbTabNums: TTntCheckBox
          Left = 8
          Top = 56
          Width = 380
          Height = 17
          Caption = 'Show tabs numbers'
          TabOrder = 2
        end
        object cbTabSw: TTntCheckBox
          Left = 8
          Top = 140
          Width = 433
          Height = 17
          Caption = 'Use modern tab switcher (Ctrl+Tab)'
          TabOrder = 6
        end
        object cbTabDnD: TTntCheckBox
          Left = 8
          Top = 184
          Width = 380
          Height = 17
          Caption = 'Allow drag&&drop'
          TabOrder = 8
        end
        object edTabMaxLen: TSpinEdit
          Left = 8
          Top = 108
          Width = 43
          Height = 22
          MaxValue = 200
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbTabDbl: TTntCheckBox
          Left = 8
          Top = 168
          Width = 380
          Height = 17
          Caption = 'Allow closing by double-click'
          TabOrder = 7
        end
        object ListTabColors: TTntListBox
          Left = 448
          Top = 28
          Width = 57
          Height = 181
          Style = lbOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 9
          OnDblClick = ListTabColorsDblClick
          OnDrawItem = ListTabColorsDrawItem
          OnKeyDown = ListTabColorsKeyDown
        end
        object cbTabVis: TTntComboBox
          Left = 8
          Top = 16
          Width = 321
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Always show tabs'
            'Never show tabs'
            'Show tabs when 2 or more')
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
        object labCaretHelp: TTntLabel
          Left = 24
          Top = 32
          Width = 29
          Height = 13
          Cursor = crHandPoint
          Caption = '(Help)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labCaretHelpClick
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
        Height = 117
        Caption = 'Options'
        TabOrder = 1
        object TntLabel40: TTntLabel
          Left = 72
          Top = 20
          Width = 59
          Height = 13
          Caption = 'Caret shape'
        end
        object TntLabel29: TTntLabel
          Left = 320
          Top = 12
          Width = 201
          Height = 49
          AutoSize = False
          Caption = 'Offsets (horz. and vert.) for commands "Move caret by N chars"'
          Layout = tlCenter
          WordWrap = True
        end
        object edCaretType: TTntComboBox
          Left = 8
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
            '  '#9474
            '  '#9612
            '  '#9608
            '  _'
            '  '#9604)
        end
        object cbCaretSmart: TTntCheckBox
          Left = 8
          Top = 44
          Width = 249
          Height = 17
          Hint = 'Acts on the caret movement (up, down, line start, line end).'
          Caption = 'Smart caret behaviour'
          TabOrder = 1
        end
        object cbCaretInText: TTntCheckBox
          Left = 8
          Top = 60
          Width = 258
          Height = 17
          Hint = 'Allows the caret to move only inside the text.'
          Caption = 'Keep caret in text'
          TabOrder = 2
        end
        object cbCaretKeepOnPaste: TTntCheckBox
          Left = 8
          Top = 76
          Width = 256
          Height = 17
          Hint = 'Don'#39't change caret position when performing Paste action.'
          Caption = 'Keep caret on paste'
          TabOrder = 3
        end
        object cbCaretInRO: TTntCheckBox
          Left = 8
          Top = 92
          Width = 256
          Height = 17
          Hint = 'Shows caret in read-only mode.'
          Caption = 'Show caret in read-only'
          TabOrder = 4
        end
        object edMovX: TSpinEdit
          Left = 256
          Top = 15
          Width = 57
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 5
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object edMovY: TSpinEdit
          Left = 256
          Top = 39
          Width = 57
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 6
          Value = 1
          OnKeyDown = edIndentKeyDown
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
      object KeyList: TTntStringGrid
        Left = 8
        Top = 56
        Width = 521
        Height = 281
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
        Top = 347
        Width = 185
        Height = 21
        TabStop = False
        HotKey = 0
        TabOrder = 4
        OnChange = ecHotKeyChange
      end
      object bKeySet: TTntButton
        Left = 200
        Top = 346
        Width = 105
        Height = 22
        Caption = 'Set'
        TabOrder = 5
        OnClick = bKeySetClick
      end
      object bKeyClr: TTntButton
        Left = 312
        Top = 346
        Width = 105
        Height = 22
        Caption = 'Clear'
        TabOrder = 6
        OnClick = bKeyClrClick
      end
      object bKeyFn: TTntButton
        Left = 424
        Top = 346
        Width = 105
        Height = 22
        Caption = 'Find'
        TabOrder = 7
        OnClick = bKeyFnClick
      end
      object cbKeyCat: TTntComboBox
        Left = 152
        Top = 4
        Width = 265
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
        Width = 265
        Height = 21
        TabOrder = 1
        OnChange = edFilterChange
      end
      object bFiltClear: TTntButton
        Left = 424
        Top = 28
        Width = 97
        Height = 22
        Caption = 'Clear'
        TabOrder = 2
        OnClick = bFiltClearClick
      end
    end
    object tabFiles: TTntTabSheet
      Caption = 'Files'
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
        Height = 125
        Caption = 'Misc'
        TabOrder = 1
        object Label9: TTntLabel
          Left = 8
          Top = 16
          Width = 112
          Height = 13
          Caption = 'Watch for file changes:'
        end
        object TntLabel23: TTntLabel
          Left = 64
          Top = 100
          Width = 208
          Height = 13
          Caption = 'Disable lexer if file size is bigger than ... Mb'
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
          Width = 481
          Height = 17
          Caption = 'Follow tail on reload'
          TabOrder = 2
        end
        object cbOverRO: TTntCheckBox
          Left = 8
          Top = 76
          Width = 489
          Height = 17
          Caption = 'Ask to overwrite read-only files'
          TabOrder = 3
        end
        object edBigSize: TSpinEdit
          Left = 8
          Top = 95
          Width = 49
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 4
          Value = 1
          OnKeyDown = edIndentKeyDown
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
          MinValue = 3
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
        Height = 65
        Caption = 'Syntax tree'
        TabOrder = 0
        object TntLabel39: TTntLabel
          Left = 72
          Top = 40
          Width = 84
          Height = 13
          Caption = 'Update delay, ms'
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
          Top = 36
          Width = 57
          Height = 22
          Increment = 500
          MaxValue = 10000
          MinValue = 500
          TabOrder = 1
          Value = 500
          OnKeyDown = edIndentKeyDown
        end
      end
      object boxMinimap: TTntGroupBox
        Left = 8
        Top = 68
        Width = 529
        Height = 53
        Caption = 'Mini-map'
        TabOrder = 1
        object TntLabel26: TTntLabel
          Left = 70
          Top = 24
          Width = 44
          Height = 13
          Caption = 'Zoom, %'
        end
        object edMapZoom: TSpinEdit
          Left = 8
          Top = 20
          Width = 57
          Height = 22
          Increment = 5
          MaxValue = 60
          MinValue = 10
          TabOrder = 0
          Value = 10
          OnKeyDown = edIndentKeyDown
        end
      end
      object boxMicromap: TTntGroupBox
        Left = 8
        Top = 124
        Width = 529
        Height = 45
        Caption = 'Micro-map'
        TabOrder = 2
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
        Height = 257
        Caption = 'History'
        TabOrder = 0
        object Label8: TTntLabel
          Left = 56
          Top = 20
          Width = 201
          Height = 13
          Caption = 'Length of file state history (0: don'#39't save)'
        end
        object Label7: TTntLabel
          Left = 56
          Top = 112
          Width = 230
          Height = 13
          Caption = 'Length of search/replace history (0: don'#39't save)'
        end
        object TntLabel11: TTntLabel
          Left = 8
          Top = 208
          Width = 140
          Height = 13
          Caption = 'Folder of Open/Save dialogs:'
        end
        object TntLabel10: TTntLabel
          Left = 8
          Top = 182
          Width = 96
          Height = 13
          Caption = 'Create backup files:'
        end
        object edFS: TSpinEdit
          Left = 8
          Top = 16
          Width = 41
          Height = 22
          MaxValue = 50
          MinValue = 0
          TabOrder = 0
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edSR: TSpinEdit
          Left = 8
          Top = 108
          Width = 41
          Height = 22
          MaxValue = 50
          MinValue = 0
          TabOrder = 5
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object cbHCaret: TTntCheckBox
          Left = 56
          Top = 36
          Width = 409
          Height = 17
          Caption = 'Save caret position'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
        object cbHEnc: TTntCheckBox
          Left = 56
          Top = 52
          Width = 409
          Height = 17
          Caption = 'Save encoding'
          Checked = True
          State = cbChecked
          TabOrder = 2
        end
        object bClrSR: TTntButton
          Left = 56
          Top = 132
          Width = 113
          Height = 21
          Caption = 'Clear'
          TabOrder = 6
          OnClick = bClrSRClick
        end
        object bClrFS: TTntButton
          Left = 56
          Top = 88
          Width = 113
          Height = 21
          Caption = 'Clear'
          TabOrder = 4
          OnClick = bClrFSClick
        end
        object cbMru: TTntCheckBox
          Left = 8
          Top = 156
          Width = 393
          Height = 17
          Caption = 'Remove non-existing items from recents list at startup'
          TabOrder = 7
        end
        object cbDirLast: TTntComboBox
          Left = 264
          Top = 204
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
          Items.Strings = (
            'Follow current file'
            'Remember last folder'
            'Custom folder')
        end
        object edDirLast: TTntEdit
          Left = 56
          Top = 228
          Width = 329
          Height = 21
          TabOrder = 10
        end
        object bDirLast: TTntButton
          Left = 392
          Top = 228
          Width = 41
          Height = 21
          Caption = '...'
          TabOrder = 11
          OnClick = bDirLastClick
        end
        object cbBak: TTntComboBox
          Left = 264
          Top = 180
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 8
          Items.Strings = (
            'Disabled'
            'In %AppData%\SynWrite'
            'In the same folder')
        end
        object cbHTemp: TTntCheckBox
          Left = 56
          Top = 68
          Width = 449
          Height = 17
          Caption = 'Save history for %Temp% files'
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
          Width = 470
          Height = 17
          Caption = 'Restore last session on startup'
          TabOrder = 2
          OnClick = cbSessSaveClick
        end
        object cbSessSave: TTntCheckBox
          Left = 8
          Top = 16
          Width = 470
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
        Height = 57
        Caption = 'Projects'
        TabOrder = 1
        object cbProjLoad: TTntCheckBox
          Left = 8
          Top = 32
          Width = 470
          Height = 17
          Caption = 'Restore last project on startup'
          TabOrder = 1
          OnClick = cbSessSaveClick
        end
        object cbProjSave: TTntCheckBox
          Left = 8
          Top = 16
          Width = 470
          Height = 17
          Caption = 'Save current project on exit'
          TabOrder = 0
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
        Top = 148
        Width = 529
        Height = 105
        Caption = 'Common auto-completion options'
        TabOrder = 1
        object Label42: TTntLabel
          Left = 304
          Top = 48
          Width = 53
          Height = 13
          Caption = 'Filter type:'
        end
        object TntLabel7: TTntLabel
          Left = 64
          Top = 80
          Width = 90
          Height = 13
          Caption = 'Drop-down list size'
        end
        object TntLabel12: TTntLabel
          Left = 64
          Top = 52
          Width = 233
          Height = 29
          AutoSize = False
          Caption = 'After typing ... letters, show list automatically (0 - disabled)'
          WordWrap = True
        end
        object cbAcpFilter: TTntComboBox
          Left = 304
          Top = 64
          Width = 201
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
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
          Top = 76
          Width = 49
          Height = 22
          MaxValue = 30
          MinValue = 3
          TabOrder = 3
          Value = 3
          OnKeyDown = edIndentKeyDown
        end
        object edAcpNum: TSpinEdit
          Left = 8
          Top = 52
          Width = 49
          Height = 22
          MaxValue = 30
          MinValue = 0
          TabOrder = 2
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
      end
      object gAcp2: TTntGroupBox
        Left = 8
        Top = 256
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
          Width = 457
          Height = 17
          Caption = 'Also show words from current file'
          TabOrder = 0
          OnClick = cbAcpFileClick
        end
        object edAcpFileChars: TSpinEdit
          Left = 8
          Top = 36
          Width = 49
          Height = 22
          MaxValue = 200
          MinValue = 2
          TabOrder = 1
          Value = 2
          OnKeyDown = edIndentKeyDown
        end
        object edAcpFileSize: TSpinEdit
          Left = 8
          Top = 60
          Width = 49
          Height = 22
          MaxValue = 20
          MinValue = 1
          TabOrder = 2
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
      end
      object gAcpSp: TTntGroupBox
        Left = 8
        Top = 4
        Width = 529
        Height = 141
        Caption = 'Special auto-completion features'
        TabOrder = 0
        object labSmTabHelp: TTntLabel
          Left = 440
          Top = 48
          Width = 29
          Height = 13
          Cursor = crHandPoint
          Caption = '(Help)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labSmTabHelpClick
        end
        object labTplHelp: TTntLabel
          Left = 440
          Top = 98
          Width = 29
          Height = 13
          Cursor = crHandPoint
          Caption = '(Help)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labTplHelpClick
        end
        object labAutoCloseHelp: TTntLabel
          Left = 440
          Top = 62
          Width = 29
          Height = 13
          Cursor = crHandPoint
          Caption = '(Help)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labAutoCloseHelpClick
        end
        object TntLabel34: TTntLabel
          Left = 47
          Top = 116
          Width = 156
          Height = 13
          Alignment = taRightJustify
          Caption = 'Except for these file extensions:'
        end
        object labAcpHelp: TTntLabel
          Left = 440
          Top = 12
          Width = 29
          Height = 13
          Cursor = crHandPoint
          Caption = '(Help)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labAcpHelpClick
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
        object cbTplTabbing: TTntCheckBox
          Left = 8
          Top = 96
          Width = 409
          Height = 17
          Caption = 'Use Tab key to expand code templates'
          TabOrder = 7
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
          Width = 208
          Height = 17
          Caption = 'Auto-close brackets: ( ) [ ] { }'
          TabOrder = 4
          OnClick = cbACloseBrClick
        end
        object cbACloseBrEsc: TTntCheckBox
          Left = 336
          Top = 80
          Width = 185
          Height = 17
          Caption = 'Skip escaped: \{'
          TabOrder = 6
        end
        object cbACloseQ: TTntCheckBox
          Left = 216
          Top = 80
          Width = 120
          Height = 17
          Caption = 'And quotes: " '#39
          TabOrder = 5
          OnClick = cbACloseBrClick
        end
        object edTplTabEx: TEdit
          Left = 216
          Top = 114
          Width = 201
          Height = 21
          TabOrder = 8
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
    object tabFolders: TTntTabSheet
      Caption = 'Path Environment'
      TabVisible = False
      OnShow = tabFoldersShow
      object boxFolders: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 269
        Caption = 'Folders'
        TabOrder = 0
        object TntLabel14: TTntLabel
          Left = 8
          Top = 244
          Width = 286
          Height = 13
          Caption = 'Tip: add * after folder name to search also in all subfolders.'
        end
        object TntLabel15: TTntLabel
          Left = 8
          Top = 16
          Width = 513
          Height = 29
          AutoSize = False
          Caption = 
            'Folders, which are looked by command "Open <selection>" of edito' +
            'r context menu:'
          WordWrap = True
        end
        object edFolders: TTntMemo
          Left = 8
          Top = 52
          Width = 481
          Height = 157
          ScrollBars = ssBoth
          TabOrder = 0
          OnKeyDown = edFoldersKeyDown
        end
        object bAddFolder: TTntButton
          Left = 8
          Top = 216
          Width = 137
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
    end
    object tabView: TTntTabSheet
      Caption = 'View Settings'
      OnShow = tabViewShow
      object boxNonPrint: TTntGroupBox
        Left = 8
        Top = 204
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
        Height = 200
        TabOrder = 0
        object Label15: TTntLabel
          Left = 56
          Top = 124
          Width = 58
          Height = 13
          Caption = 'Line spacing'
        end
        object Label3: TTntLabel
          Left = 56
          Top = 100
          Width = 60
          Height = 13
          Caption = 'Right margin'
        end
        object Label14: TTntLabel
          Left = 136
          Top = 148
          Width = 63
          Height = 13
          Caption = 'Line numbers'
        end
        object TntLabel28: TTntLabel
          Left = 136
          Top = 172
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
          TabOrder = 12
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
          TabOrder = 10
        end
        object edLSpace: TSpinEdit
          Left = 8
          Top = 120
          Width = 41
          Height = 22
          Hint = 'Vertical spacing between lines.'
          MaxValue = 10
          MinValue = 0
          TabOrder = 6
          Value = 0
          OnKeyDown = edIndentKeyDown
        end
        object edMargin: TSpinEdit
          Left = 8
          Top = 95
          Width = 41
          Height = 22
          Hint = 'Right margin column position.'
          MaxValue = 300
          MinValue = 1
          TabOrder = 5
          Value = 1
          OnKeyDown = edIndentKeyDown
        end
        object cbMargin: TTntCheckBox
          Left = 8
          Top = 76
          Width = 256
          Height = 17
          Hint = 'Shows vertical line after specified column.'
          Caption = 'Show right margin'
          TabOrder = 4
        end
        object edLineNums: TTntComboBox
          Left = 8
          Top = 144
          Width = 121
          Height = 21
          Hint = 'Style of line numbering.'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 7
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
          TabOrder = 11
        end
        object cbRuler: TTntCheckBox
          Left = 8
          Top = 60
          Width = 256
          Height = 17
          Hint = 'Shows ruler above editor area.'
          Caption = 'Show horizontal ruler'
          TabOrder = 3
        end
        object cbStaples: TComboBox
          Left = 48
          Top = 168
          Width = 81
          Height = 22
          Hint = 'Line style of block staples.'
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 9
          OnDrawItem = cbStaplesDrawItem
        end
        object edStapleOffset: TSpinEdit
          Left = 8
          Top = 168
          Width = 41
          Height = 22
          Hint = 'Horizontal offset of block staples (in pixels).'
          MaxValue = 5
          MinValue = -5
          TabOrder = 8
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
          TabOrder = 14
        end
        object cbDrawCol: TTntCheckBox
          Left = 272
          Top = 60
          Width = 254
          Height = 17
          Hint = 'Draw vertical line at caret'#39's column position.'
          Caption = 'Draw current column margin'
          TabOrder = 13
        end
        object cbWrap: TTntCheckBox
          Left = 8
          Top = 12
          Width = 256
          Height = 17
          Hint = 'Wraps text at edge of memo.'
          Caption = 'Word wrap'
          TabOrder = 0
        end
        object cbFold: TTntCheckBox
          Left = 8
          Top = 44
          Width = 256
          Height = 17
          Hint = 'Shows codefolding bar on gutter.'
          Caption = 'Code folding'
          TabOrder = 2
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
          TabOrder = 15
        end
        object cbScrollLast: TTntCheckBox
          Left = 272
          Top = 140
          Width = 254
          Height = 17
          Hint = 
            'When it is set you may scroll to last line, otherwise you can sc' +
            'roll to last page.'
          Caption = 'Scroll to last line'
          TabOrder = 17
        end
        object cbWrapMargin: TTntCheckBox
          Left = 8
          Top = 28
          Width = 257
          Height = 17
          Hint = 'Word wrap works on right margin, not edge of memo.'
          Caption = 'Word wrap on right margin'
          TabOrder = 1
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
          TabOrder = 16
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
          TabOrder = 18
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
        Height = 325
        TabOrder = 0
        object TntLabel35: TTntLabel
          Left = 112
          Top = 296
          Width = 100
          Height = 13
          Caption = 'Initial selection mode'
        end
        object cbLink: TTntCheckBox
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
        object cbSmHi: TTntCheckBox
          Left = 8
          Top = 48
          Width = 256
          Height = 17
          Hint = 'Marks all occurrences of selected word.'
          Caption = 'Smart highlighting'
          TabOrder = 2
        end
        object cbSmHiCase: TTntCheckBox
          Left = 24
          Top = 64
          Width = 243
          Height = 17
          Hint = 'Makes Smart Highlighting search case-sensitive.'
          Caption = 'Case sensitive'
          TabOrder = 3
        end
        object cbBrHi: TTntCheckBox
          Left = 8
          Top = 80
          Width = 256
          Height = 17
          Hint = 
            'Enables highlighting of pair brackets (if not overridden in lexe' +
            'r).'
          Caption = 'Highlight pair brackets'
          TabOrder = 4
        end
        object cbCopyLineNSel: TTntCheckBox
          Left = 8
          Top = 104
          Width = 256
          Height = 17
          Hint = 
            'Copy/Cut operations will take current line, if no selection is m' +
            'ade in editor.'
          Caption = 'Copy/Cut current line if no selection made'
          TabOrder = 5
        end
        object cbColorOnEmpty: TTntCheckBox
          Left = 8
          Top = 136
          Width = 256
          Height = 17
          Hint = 
            'Colorize selected lines background with white space after line e' +
            'nds.'
          Caption = 'Colorize selection BG including white space'
          TabOrder = 7
        end
        object cbSelMode: TTntComboBox
          Left = 8
          Top = 292
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 15
          Items.Strings = (
            'Normal'
            'Columns'
            'Lines')
        end
        object cbFloatM: TTntCheckBox
          Left = 8
          Top = 268
          Width = 256
          Height = 17
          Hint = 
            'If it is set markers are linked to text, so they will move with ' +
            'text during editing. Otherwise they are linked to caret position' +
            '.'
          Caption = 'Floating markers'
          TabOrder = 14
        end
        object cbCollap: TTntCheckBox
          Left = 8
          Top = 252
          Width = 256
          Height = 17
          Hint = 
            'Collapse empty lines after text range when this rang have been c' +
            'ollapsed.'
          Caption = 'Collapse empty lines'
          TabOrder = 13
        end
        object cbDrag: TTntCheckBox
          Left = 8
          Top = 236
          Width = 256
          Height = 17
          Hint = 'Enables drag&drop operation for text movement.'
          Caption = 'Text dragging'
          TabOrder = 12
        end
        object cbCopyRtf: TTntCheckBox
          Left = 8
          Top = 120
          Width = 258
          Height = 17
          Hint = 'Copies selected text also in RTF format.'
          Caption = 'Copy to clipboard as RTF'
          TabOrder = 6
        end
        object cbGrSel: TTntCheckBox
          Left = 8
          Top = 208
          Width = 258
          Height = 17
          Hint = 
            'Selection will contain extra column/line during column/line sele' +
            'ction modes.'
          Caption = 'Greedy selection'
          TabOrder = 11
        end
        object cbDClick: TTntCheckBox
          Left = 8
          Top = 192
          Width = 258
          Height = 17
          Hint = 
            'Selects the entire line when you double-click any character in t' +
            'he line.'
          Caption = 'Double-click selects line'
          TabOrder = 10
        end
        object cbBPers: TTntCheckBox
          Left = 8
          Top = 176
          Width = 258
          Height = 17
          Hint = 
            'Keeps marked block selected even when the cursor is moved using ' +
            'the arrow keys, until a new block is selected.'
          Caption = 'Preserve selection'
          TabOrder = 9
        end
        object cbBOver: TTntCheckBox
          Left = 8
          Top = 160
          Width = 258
          Height = 17
          Hint = 'Replaces marked block of text with whatever is typed next.'
          Caption = 'Overwrite selection'
          TabOrder = 8
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
        Height = 93
        Caption = 'Misc'
        TabOrder = 2
        object labEmmet: TTntLabel
          Left = 158
          Top = 20
          Width = 13
          Height = 13
          Cursor = crHandPoint
          Caption = '(?)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labEmmetClick
        end
        object TntLabel18: TTntLabel
          Left = 176
          Top = 20
          Width = 65
          Height = 13
          Caption = 'Emmet profile'
          Layout = tlCenter
        end
        object labDate: TTntLabel
          Left = 158
          Top = 44
          Width = 13
          Height = 13
          Cursor = crHandPoint
          Caption = '(?)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsUnderline]
          ParentFont = False
          OnClick = labDateClick
        end
        object TntLabel20: TTntLabel
          Left = 176
          Top = 44
          Width = 82
          Height = 13
          Caption = 'Date/time format'
        end
        object TntLabel33: TTntLabel
          Left = 160
          Top = 68
          Width = 152
          Height = 13
          Caption = 'Date/time format for plugins log'
        end
        object cbZenProfile: TTntComboBox
          Left = 8
          Top = 16
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
        end
        object edDateFmt: TTntEdit
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object edDateFmtP: TTntEdit
          Left = 8
          Top = 64
          Width = 145
          Height = 21
          TabOrder = 2
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
            'Begins every auto-indented line with the minimum number of chara' +
            'cters possible, using tabs and spaces as necessary.'
          Caption = 'Optimal fill'
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
        Height = 117
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
          Value = 10
          OnKeyDown = edIndentKeyDown
        end
        object cbUndoMass: TTntCheckBox
          Left = 8
          Top = 92
          Width = 377
          Height = 17
          Hint = 
            'Allow Undo for such operations as "Delete bookmarked lines", "Pa' +
            'ste into bookmarked lines". Much slower.'
          Caption = 'Allow Undo for massive strings deletion'
          TabOrder = 4
          WordWrap = True
        end
        object cbGroupRedo: TTntCheckBox
          Left = 8
          Top = 60
          Width = 258
          Height = 17
          Hint = 'If it is set Redo will involve group of changes.'
          Caption = 'Group redo'
          TabOrder = 2
        end
        object cbGroupUndo: TTntCheckBox
          Left = 8
          Top = 44
          Width = 258
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
          Width = 258
          Height = 17
          Hint = 'Stays Undo buffer unchanged after save.'
          Caption = 'Undo after save'
          TabOrder = 3
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
    Left = 172
    Top = 400
  end
  object KeyMapping: TSyntKeyMapping
    Items = <>
    Left = 200
    Top = 400
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'edCaretType.*'
      'OpenDialogPre.*'
      'SaveDialogPre.*')
    Left = 276
    Top = 400
    LangData = {
      0700666D5365747570010100000001000000070043617074696F6E0143010000
      04005461627300000900746162436F6C6F727301010000009501000007004361
      7074696F6E00070067436F6C6F7273010100000067000000070043617074696F
      6E0006004C6162656C34010100000068000000070043617074696F6E0006004C
      6162656C35010100000069000000070043617074696F6E000A004C697374436F
      6C6F727300000B00537461746963546578743101010000006B00000007004361
      7074696F6E000B0074616250726F675365747401010000007800000007004361
      7074696F6E0007004C6162656C3131010100000079000000070043617074696F
      6E000B00626F7850726F675365747401010000007A000000070043617074696F
      6E000600636243686172010100000080000000070043617074696F6E00060063
      6253746174010100000082000000070043617074696F6E00060063624D656E75
      010100000083000000070043617074696F6E0006007461624B65790101000000
      89000000070043617074696F6E0007004B65794C697374000008006563486F74
      4B657900000700624B657953657401010000008A000000070043617074696F6E
      000700624B6579436C7201010000008B000000070043617074696F6E00060062
      4B6579466E01010000008C000000070043617074696F6E00080074616246696C
      65730101000000CC010000070043617074696F6E000600746162414350010100
      00009C000000070043617074696F6E000600624170706C790101000000A40000
      00070043617074696F6E0004006243616E0101000000A5000000070043617074
      696F6E000300624F6B0101000000A6000000070043617074696F6E000A00466F
      6E744469616C6F6700000A004B65794D617070696E6700000900436F6C6F7242
      6F7831000006006362496E73740101000000B2000000070043617074696F6E00
      070067416370416C6C0101000000B3000000070043617074696F6E0007004C61
      62656C34320101000000B4000000070043617074696F6E000B00636241637046
      696C7465720101000000B700000005004974656D7300090063624163704E6F6E
      650101000000B9000000070043617074696F6E000900656441637044726F7000
      000A0062436F6C6F724C6F61640101000000DC000000070043617074696F6E00
      0A0062436F6C6F72536176650101000000DD000000070043617074696F6E000D
      004F70656E4469616C6F6750726500000D00536176654469616C6F6750726500
      000700746162486973740101000000E7000000070043617074696F6E00070062
      6F78486973740101000000E8000000070043617074696F6E0006004C6162656C
      380101000000E9000000070043617074696F6E0006004C6162656C3701010000
      00EA000000070043617074696F6E000A00546E744C6162656C31310101000000
      EB000000070043617074696F6E00040065644653000004006564535200000800
      63624843617265740101000000EC000000070043617074696F6E000600636248
      456E630101000000ED000000070043617074696F6E00060062436C7253520101
      000000EE000000070043617074696F6E00060062436C7246530101000000EF00
      0000070043617074696F6E00050063624D72750101000000F000000007004361
      7074696F6E00090063624469724C6173740101000000F200000005004974656D
      7300090065644469724C61737400000800624469724C61737400000A00546E74
      4C6162656C31300101000000F9000000070043617074696F6E00050063624261
      6B0101000000FA00000005004974656D7300080065644163704E756D00000500
      6741637032010100000003010000070043617074696F6E000900636241637046
      696C65010100000004010000070043617074696F6E000E00656441637046696C
      65436861727300000D00656441637046696C6553697A65000011004C6162656C
      41637046696C654368617273010100000005010000070043617074696F6E0010
      004C6162656C41637046696C6553697A65010100000006010000070043617074
      696F6E00080063624B657943617400000A00546E744C6162656C313901010000
      000B010000070043617074696F6E000500636245736301010000000F01000005
      004974656D73000A00546E744C6162656C323101010000001001000007004361
      7074696F6E0009007461625365617263680101000000A5010000070043617074
      696F6E000700626F7846696E64010100000021010000070043617074696F6E00
      080063625372576F7264010100000023010000070043617074696F6E00090063
      6253724F6E546F70010100000025010000070043617074696F6E000A00546E74
      4C6162656C323201010000002A010000070043617074696F6E00080065644669
      6C74657200000A00546E744C6162656C32350101000000340100000700436170
      74696F6E00090054696D657246696C7400000A006246696C74436C6561720101
      00000040010000070043617074696F6E0007006362537253656C010100000041
      010000070043617074696F6E0008007461624153617665010100000042010000
      070043617074696F6E0006006741536176650101000000430100000700436170
      74696F6E000C006362415361766554696D657201010000004401000007004361
      7074696F6E000B006564415361766554696D6500000C0063624153617665466F
      637573010100000045010000070043617074696F6E000A006741536176655768
      6174010100000046010000070043617074696F6E000F00636241536176654375
      727246696C65010100000047010000070043617074696F6E000F006362415361
      7665416C6C46696C6573010100000048010000070043617074696F6E000D006C
      61624153617649676E6F7265010100000049010000070043617074696F6E000E
      00656441536176654D617853697A6500000C006C6162415361766554696D6501
      010000004D010000070043617074696F6E0008006C61624B4279746501010000
      004E010000070043617074696F6E00080067556E6E616D656401010000004F01
      0000070043617074696F6E00110065644153617665556E6E616D656444697200
      000F0063624153617665556E49676E6F72650101000000520100000700436170
      74696F6E00110063624153617665556E53686F77536176650101000000530100
      00070043617074696F6E00120063624153617665556E53617665546F44697201
      0100000054010000070043617074696F6E000E0062556E6E616D656442726F77
      736500000600674163705370010100000059010000070043617074696F6E0008
      00636241637048746D01010000005A010000070043617074696F6E000C006362
      41637054616262696E6701010000005B010000070043617074696F6E00080063
      6241637043737301010000005C010000070043617074696F6E000C006C616253
      6D54616248656C7001010000005D010000070043617074696F6E000700636248
      54656D70010100000061010000070043617074696F6E000E0063624163705573
      6553696E676C65010100000062010000070043617074696F6E000C0063625470
      6C54616262696E67010100000065010000070043617074696F6E000A006C6162
      54706C48656C70010100000066010000070043617074696F6E000C0063624143
      6C6F73655461677301010000006C010000070043617074696F6E000900546E74
      4C6162656C3701010000006D010000070043617074696F6E000A00546E744C61
      62656C313201010000006E010000070043617074696F6E0010006C6162417574
      6F436C6F736548656C7001010000006F010000070043617074696F6E000A0063
      6241436C6F73654272010100000070010000070043617074696F6E000D006362
      41436C6F73654272457363010100000072010000070043617074696F6E000900
      636241436C6F736551010100000073010000070043617074696F6E0007004C69
      7374436174000007007461625461627301010000007E01000007004361707469
      6F6E000700626F785461627301010000007F010000070043617074696F6E0009
      00546E744C6162656C33010100000080010000070043617074696F6E00080063
      6254616242746E010100000081010000070043617074696F6E00080063625461
      624D756C010100000083010000070043617074696F6E0009006362546162446F
      776E010100000084010000070043617074696F6E00090063625461624E756D73
      010100000085010000070043617074696F6E0007006362546162537701010000
      0086010000070043617074696F6E0008006362546162446E4401010000008701
      0000070043617074696F6E000B0065645461624D61784C656E00000800636254
      616244626C010100000088010000070043617074696F6E000A00626F78546F6F
      6C626172010100000089010000070043617074696F6E0006004C6162656C3201
      010000008A010000070043617074696F6E00070063625468656D65000007004C
      6162656C313201010000008B010000070043617074696F6E000700636249636F
      6E7301010000008C01000005004974656D73000800746162466F6E7473010100
      00008D010000070043617074696F6E00050067466F6E7401010000008E010000
      070043617074696F6E0002006231010100000096010000070043617074696F6E
      0002006232010100000097010000070043617074696F6E000200623401010000
      0098010000070043617074696F6E000200623301010000009901000007004361
      7074696F6E000200623501010000009A010000070043617074696F6E00020062
      3601010000009B010000070043617074696F6E00070074616254726565010100
      00009C010000070043617074696F6E000700626F785472656501010000009D01
      0000070043617074696F6E000A0063625472656553796E6301010000009F0100
      00070043617074696F6E000700746162536573730101000000A6010000070043
      617074696F6E000700626F78536573730101000000A701000007004361707469
      6F6E0009006362536573734465660101000000A8010000070043617074696F6E
      000A006362536573734C6F61640101000000A9010000070043617074696F6E00
      0A00636253657373536176650101000000AA010000070043617074696F6E0007
      00626F7850726F6A0101000000AB010000070043617074696F6E000A00636250
      726F6A4C6F61640101000000AC010000070043617074696F6E000A0063625072
      6F6A536176650101000000AD010000070043617074696F6E000A00626F784D69
      6E696D61700101000000AE010000070043617074696F6E000A00546E744C6162
      656C32360101000000AF010000070043617074696F6E00090065644D61705A6F
      6F6D00000900626F784647726F75700101000000B2010000070043617074696F
      6E000900546E744C6162656C310101000000B3010000070043617074696F6E00
      07006362546578745F0101000000B401000005004974656D730007004C616265
      6C31370101000000B5010000070043617074696F6E000900546E744C6162656C
      380101000000B6010000070043617074696F6E00050065644F656D0000060065
      645554463800000900546E744C6162656C390101000000B70100000700436170
      74696F6E000900626F7852656C6F61640101000000B801000007004361707469
      6F6E0006004C6162656C390101000000B9010000070043617074696F6E000700
      63624E6F7469660101000000BA01000005004974656D7300060063625461696C
      0101000000BB010000070043617074696F6E00080063624F766572524F010100
      0000BC010000070043617074696F6E000900656442696753697A6500000A0054
      6E744C6162656C32330101000000BD010000070043617074696F6E000D004C69
      7374546162436F6C6F727300000A00546E744C6162656C31330101000000CD01
      0000070043617074696F6E000A00746162466F6C646572730101000000CF0100
      00070043617074696F6E000A00626F78466F6C646572730101000000D3010000
      070043617074696F6E000A00546E744C6162656C31340101000000D001000007
      0043617074696F6E000A00546E744C6162656C31350101000000D10100000700
      43617074696F6E0009006564466F6C6465727300000A0062416464466F6C6465
      720101000000D2010000070043617074696F6E0008007461625370656C6C0101
      000000D4010000070043617074696F6E000B00626F785370656C6C4F70740101
      000000D5010000070043617074696F6E000A00546E744C6162656C3136010100
      0000D6010000070043617074696F6E000A00546E744C6162656C323401010000
      00D7010000070043617074696F6E000A0065645370656C6C4578740000090063
      625370656C6C456E0101000000D8010000070043617074696F6E000900625370
      656C6C4F70740101000000D9010000070043617074696F6E000B00626F785370
      656C6C4C6E6B0101000000DA010000070043617074696F6E000A00546E744C61
      62656C32370101000000DB010000070043617074696F6E000A006C6162446963
      745777770101000000DC010000070043617074696F6E000A006C616244696374
      4469720101000000DD010000070043617074696F6E0006007461624F76720101
      000000E1010000070043617074696F6E000B00656453724F6666736574590000
      0A00546E744C6162656C33320101000000E3010000070043617074696F6E0008
      0063625461625669730101000000E701000005004974656D73000A0065645470
      6C546162457800000A00546E744C6162656C33340101000000E8010000070043
      617074696F6E000A00546E744C6162656C33360101000000ED01000007004361
      7074696F6E0009006362556E694E6565640101000000EE01000005004974656D
      73000B0063625472656544656C617900000A00546E744C6162656C3339010100
      0000F6010000070043617074696F6E0009007461624361726574730101000000
      FA010000070043617074696F6E000900626F784361726574730101000000FC01
      0000070043617074696F6E000C00636243617265744D756C74690101000000FB
      010000070043617074696F6E000A00546E744C6162656C33300101000000FD01
      0000070043617074696F6E000E0063624361726574496E644E6F6E6501010000
      00FE010000070043617074696F6E000E0063624361726574496E644C696E6501
      01000000FF010000070043617074696F6E00100063624361726574496E644775
      74746572010100000000020000070043617074696F6E000A00546E744C616265
      6C3331010100000001020000070043617074696F6E0010006564436172657447
      7574746572436F6C00000C006C6162436172657448656C700101000000020200
      00070043617074696F6E000A006C616241637048656C70010100000012020000
      070043617074696F6E000B00626F7846696E6454726565010100000016020000
      070043617074696F6E000A0063625372457870616E6401010000001702000007
      0043617074696F6E001200656453724D6178547265654D61746368657300000A
      00546E744C6162656C3137010100000018020000070043617074696F6E000900
      636253725173436170010100000019020000070043617074696F6E000A00626F
      7843617265747332010100000023020000070043617074696F6E000B00656443
      617265745479706500000A00546E744C6162656C343001010000001A02000007
      0043617074696F6E000C0063624361726574536D61727401020000001C020000
      070043617074696F6E1B020000040048696E74000D0063624361726574496E54
      65787401020000001E020000070043617074696F6E1D020000040048696E7400
      1200636243617265744B6565704F6E5061737465010200000020020000070043
      617074696F6E1F020000040048696E74000B0063624361726574496E524F0102
      00000022020000070043617074696F6E21020000040048696E7400060065644D
      6F76580000060065644D6F765900000A00546E744C6162656C32390101000000
      24020000070043617074696F6E000A007461624E65774F70656E010100000027
      020000070043617074696F6E000600626F784E657701010000002E0200000700
      43617074696F6E000900546E744C6162656C3401010000002902000007004361
      7074696F6E000900546E744C6162656C3501010000002A020000070043617074
      696F6E000900546E744C6162656C3601010000002B020000070043617074696F
      6E0005006564456E6301010000002C02000005004974656D7300040065644C45
      01010000002D02000005004974656D7300050065644C65780000070074616256
      69657701010000002F020000070043617074696F6E00080074616253656C484C
      010100000030020000070043617074696F6E000F00746162496E73657274466F
      726D6174010100000031020000070043617074696F6E00090063625361766550
      6F73010100000032020000070043617074696F6E000B00626F784D6963726F6D
      6170010100000033020000070043617074696F6E000A0063624D6963726F4D61
      70010100000034020000070043617074696F6E00060063624265657001010000
      0035020000070043617074696F6E00090063625374726970426B010100000036
      020000070043617074696F6E0006006362546970730101000000370200000700
      43617074696F6E000A0063624D656E7549636F6E010100000038020000070043
      617074696F6E000B00636246756C6C5469746C65010100000039020000070043
      617074696F6E000D00636247726F75704C657865727301010000003A02000007
      0043617074696F6E000A006362536F72744D6F646501010000003B0200000500
      4974656D73000A00546E744C6162656C333801010000003C0200000700436170
      74696F6E000A00546E744C6162656C333701010000003D020000070043617074
      696F6E000B006362526563436F6C6F727301010000003E02000005004974656D
      73000D00626F7844617465466F726D61740101000000B0020000070043617074
      696F6E000C0063625A656E50726F66696C65000008006C6162456D6D65740000
      0A00546E744C6162656C313801010000003F020000070043617074696F6E0009
      00656444617465466D74000007006C61624461746500000A00546E744C616265
      6C3230010100000040020000070043617074696F6E000A00656444617465466D
      745000000A00546E744C6162656C333301010000004102000007004361707469
      6F6E000900626F78496E64656E740101000000B9020000070043617074696F6E
      0006004C6162656C31010100000046020000070043617074696F6E0008006564
      496E64656E74010100000049020000040048696E74000900626F7853656C466D
      740000060063624C696E6B010200000050020000070043617074696F6E4F0200
      00040048696E74000A00636255726C436C69636B010200000052020000070043
      617074696F6E51020000040048696E740006006362536D486901020000005402
      0000070043617074696F6E53020000040048696E74000A006362536D48694361
      7365010200000056020000070043617074696F6E55020000040048696E740006
      00636242724869010200000058020000070043617074696F6E57020000040048
      696E74000E006362436F70794C696E654E53656C01020000005A020000070043
      617074696F6E59020000040048696E74000E006362436F6C6F724F6E456D7074
      7901020000005C020000070043617074696F6E5B020000040048696E74000700
      626F7856696577000007004C6162656C313501010000005D0200000700436170
      74696F6E0006004C6162656C3301010000005E020000070043617074696F6E00
      07004C6162656C313401010000005F020000070043617074696F6E000A00546E
      744C6162656C3238010100000060020000070043617074696F6E000C00636244
      7261774C696E654247010200000062020000070043617074696F6E6102000004
      0048696E74000C00636248696465437572736F72010200000064020000070043
      617074696F6E63020000040048696E7400080065644C53706163650101000000
      65020000040048696E7400080065644D617267696E0101000000660200000400
      48696E7400080063624D617267696E010200000068020000070043617074696F
      6E67020000040048696E74000A0065644C696E654E756D730102000000690200
      00040048696E746A02000005004974656D73000B00636244726177466F637573
      01020000006C020000070043617074696F6E6B020000040048696E7400070063
      6252756C657201020000006E020000070043617074696F6E6D02000004004869
      6E740009006362537461706C657301010000006F020000040048696E74000E00
      6564537461706C654F6666736574010100000070020000040048696E74000E00
      636244726177577261704D61726B010200000072020000070043617074696F6E
      71020000040048696E74000900636244726177436F6C01020000007402000007
      0043617074696F6E73020000040048696E74000B00626F784E6F6E5072696E74
      010100000075020000070043617074696F6E000C0063624E5072696E7453686F
      77010100000076020000070043617074696F6E000A0063624E5072696E745370
      010100000077020000070043617074696F6E000B0063624E5072696E74456F6C
      010100000078020000070043617074696F6E000D0063624E5072696E74456F6C
      4578010100000079020000070043617074696F6E000700746162556E646F0101
      0000007A020000070043617074696F6E000700626F78556E646F01010000007B
      020000070043617074696F6E000900546E744C6162656C3201010000007C0200
      00070043617074696F6E000B006564556E646F4C696D697401010000007D0200
      00040048696E74000A006362556E646F4D61737301020000007F020000070043
      617074696F6E7E020000040048696E74000B00636247726F75705265646F0102
      00000081020000070043617074696F6E80020000040048696E74000B00636247
      726F7570556E646F010200000083020000070043617074696F6E820200000400
      48696E74000F006362556E646F41667465725361766501020000008502000007
      0043617074696F6E84020000040048696E74000C0063624175746F496E64656E
      74010200000087020000070043617074696F6E86020000040048696E74001000
      63624261636B7370556E696E64656E7401020000008902000007004361707469
      6F6E88020000040048696E74000F006362556E696E64656E74416C69676E0102
      0000008B020000070043617074696F6E8A020000040048696E7400090063624F
      707446696C6C01020000008D020000070043617074696F6E8C02000004004869
      6E74000B0063624B656570426C616E6B01020000008F02000007004361707469
      6F6E8E020000040048696E740006006362577261700102000000910200000700
      43617074696F6E90020000040048696E740006006362466F6C64010200000093
      020000070043617074696F6E92020000040048696E74000D0063624669784C69
      6E6553697A65010200000095020000070043617074696F6E9402000004004869
      6E74000C0063625363726F6C6C4C617374010200000097020000070043617074
      696F6E96020000040048696E74000C006362577261704D617267696E01020000
      0099020000070043617074696F6E98020000040048696E74000C006362466978
      436F6C4D6F766501020000009B020000070043617074696F6E9A020000040048
      696E74000C006362566172486F727A42617201020000009D0200000700436170
      74696F6E9C020000040048696E74000900636253656C4D6F646501010000009E
      02000005004974656D73000A00546E744C6162656C333501010000009F020000
      070043617074696F6E0008006362466C6F61744D0102000000A1020000070043
      617074696F6EA0020000040048696E740008006362436F6C6C61700102000000
      A3020000070043617074696F6EA2020000040048696E74000600636244726167
      0102000000A5020000070043617074696F6EA4020000040048696E7400090063
      62436F70795274660102000000A7020000070043617074696F6EA60200000400
      48696E740007006362477253656C0102000000A9020000070043617074696F6E
      A8020000040048696E74000800636244436C69636B0102000000AB0200000700
      43617074696F6EAA020000040048696E74000700636242506572730102000000
      AD020000070043617074696F6EAC020000040048696E740007006362424F7665
      720102000000AF020000070043617074696F6EAE020000040048696E74000800
      626F7854616273320101000000B1020000070043617074696F6E000A00656454
      616253746F70730101000000B2020000040048696E740007004C6162656C3136
      0101000000B3020000070043617074696F6E00090065645461624D6F64650102
      000000B4020000040048696E74B502000005004974656D730006004C6162656C
      360101000000B6020000070043617074696F6E000D0063625265706C61636554
      6162730102000000B8020000070043617074696F6EB7020000040048696E7400
      0700626F784C616E670101000000BB020000070043617074696F6E000B006C61
      624C616E67496E666F0000060063624C616E670000}
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
end
