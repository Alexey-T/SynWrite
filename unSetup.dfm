object fmSetup: TfmSetup
  Left = 308
  Top = 396
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
  OnDestroy = TntFormDestroy
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
    ActivePage = tabEd2
    Style = tsButtons
    TabOrder = 0
    object tabIntf: TTntTabSheet
      Caption = 'Interface'
      ImageIndex = 4
      TabVisible = False
      OnShow = tabIntfShow
      object Label11: TTntLabel
        Left = 8
        Top = 364
        Width = 169
        Height = 13
        Caption = '* - saved separately for plugin/app'
      end
      object boxIntf: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 205
        Caption = 'View'
        TabOrder = 0
        object Label18: TTntLabel
          Left = 8
          Top = 16
          Width = 51
          Height = 13
          Caption = 'Language:'
        end
        object TntLabel21: TTntLabel
          Left = 8
          Top = 56
          Width = 49
          Height = 13
          Caption = 'Esc key: *'
        end
        object cbChar: TTntCheckBox
          Left = 8
          Top = 132
          Width = 360
          Height = 17
          Caption = 'Show "char at cursor" status info'
          TabOrder = 4
        end
        object cbStat: TTntCheckBox
          Left = 8
          Top = 116
          Width = 360
          Height = 17
          Caption = 'Show status line'
          TabOrder = 3
        end
        object cbMenu: TTntCheckBox
          Left = 8
          Top = 100
          Width = 360
          Height = 17
          Caption = 'Show upper menu *'
          TabOrder = 2
        end
        object cbLang: TTntComboBox
          Left = 8
          Top = 32
          Width = 240
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbLangChange
        end
        object cbInst: TTntCheckBox
          Left = 8
          Top = 164
          Width = 360
          Height = 17
          Caption = 'Allow to run single instance only'
          TabOrder = 6
        end
        object cbEsc: TTntComboBox
          Left = 8
          Top = 72
          Width = 240
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Do nothing'
            'Close editor'
            'Close tab'
            'Close tab or editor'
            'Minimize editor')
        end
        object cbRoStart: TTntCheckBox
          Left = 8
          Top = 180
          Width = 360
          Height = 17
          Caption = 'Set read-only mode at startup *'
          TabOrder = 7
        end
        object cbMicroMap: TTntCheckBox
          Left = 8
          Top = 148
          Width = 256
          Height = 17
          Caption = 'Show micro-map bar'
          TabOrder = 5
        end
      end
      object boxNew: TTntGroupBox
        Left = 8
        Top = 208
        Width = 529
        Height = 61
        Caption = 'New document'
        TabOrder = 1
        object TntLabel4: TTntLabel
          Left = 8
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Encoding:'
        end
        object TntLabel5: TTntLabel
          Left = 168
          Top = 16
          Width = 63
          Height = 13
          Caption = 'Line endings:'
        end
        object TntLabel6: TTntLabel
          Left = 320
          Top = 16
          Width = 31
          Height = 13
          Caption = 'Lexer:'
        end
        object edEnc: TTntComboBox
          Left = 8
          Top = 32
          Width = 153
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
          Left = 168
          Top = 32
          Width = 145
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
          Left = 320
          Top = 32
          Width = 193
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          Sorted = True
          TabOrder = 2
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
        Caption = 'Toolbar'
        TabOrder = 0
        object Label2: TTntLabel
          Left = 8
          Top = 16
          Width = 73
          Height = 13
          Caption = 'Toolbar theme:'
        end
        object Label12: TTntLabel
          Left = 8
          Top = 56
          Width = 67
          Height = 13
          Caption = 'Toolbar icons:'
        end
        object cbTheme: TTntComboBox
          Left = 8
          Top = 32
          Width = 240
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 0
        end
        object cbIcons: TTntComboBox
          Left = 8
          Top = 72
          Width = 240
          Height = 21
          Style = csDropDownList
          DropDownCount = 20
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Standard'
            'Fogue 16x16'
            'Fogue 24x24'
            'Tango 16x16'
            'Tango 22x22'
            'Gnome 24x24')
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
          Width = 242
          Height = 21
          Caption = 'Load color preset...'
          TabOrder = 3
          OnClick = bColorLoadClick
        end
        object bColorSave: TTntButton
          Left = 8
          Top = 220
          Width = 242
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
          Top = 144
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
          Top = 172
          Width = 433
          Height = 17
          Caption = 'Use modern tab switcher (Ctrl+Tab)'
          TabOrder = 8
        end
        object cbTabDnD: TTntCheckBox
          Left = 8
          Top = 120
          Width = 380
          Height = 17
          Caption = 'Allow drag&&drop'
          TabOrder = 6
        end
        object edTabMaxLen: TSpinEdit
          Left = 8
          Top = 140
          Width = 43
          Height = 22
          MaxValue = 200
          MinValue = 0
          TabOrder = 7
          Value = 0
          OnKeyDown = edIndKeyDown
        end
        object cbTabDbl: TTntCheckBox
          Left = 8
          Top = 104
          Width = 380
          Height = 17
          Caption = 'Allow closing by double-click'
          TabOrder = 5
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
    object tabEd: TTntTabSheet
      Caption = 'Editor'
      TabVisible = False
      OnShow = tabEdShow
      object gEdit: TTntGroupBox
        Left = 8
        Top = 4
        Width = 529
        Height = 325
        TabOrder = 0
        object Bevel1: TBevel
          Left = 8
          Top = 96
          Width = 513
          Height = 3
        end
        object Bevel2: TBevel
          Left = 8
          Top = 256
          Width = 513
          Height = 3
        end
        object TntLabel35: TTntLabel
          Left = 112
          Top = 268
          Width = 100
          Height = 13
          Caption = 'Initial selection mode'
        end
        object cbBOver: TTntCheckBox
          Left = 8
          Top = 12
          Width = 258
          Height = 17
          Hint = 'Replaces marked block of text with whatever is typed next.'
          Caption = 'Overwrite blocks'
          TabOrder = 0
        end
        object cbBPers: TTntCheckBox
          Left = 8
          Top = 28
          Width = 258
          Height = 17
          Hint = 
            'Keeps marked block selected even when the cursor is moved using ' +
            'the arrow keys, until a new block is selected.'
          Caption = 'Persistent blocks'
          TabOrder = 1
        end
        object cbDClick: TTntCheckBox
          Left = 8
          Top = 44
          Width = 258
          Height = 17
          Hint = 
            'Selects the entire line when you double-click any character in t' +
            'he line. Otherwise only the current word is selected.'
          Caption = 'Double-click selects line'
          TabOrder = 2
        end
        object cbGrSel: TTntCheckBox
          Left = 8
          Top = 60
          Width = 258
          Height = 17
          Hint = 
            'If this option is set selection will contain extra column/line d' +
            'uring column/line selection modes.'
          Caption = 'Greedy selection'
          TabOrder = 3
        end
        object cbWrap: TTntCheckBox
          Left = 270
          Top = 12
          Width = 256
          Height = 17
          Hint = 'Wraps text at edge of memo.'
          Caption = 'Word wrap'
          TabOrder = 4
        end
        object cbFold: TTntCheckBox
          Left = 270
          Top = 28
          Width = 256
          Height = 17
          Hint = 'Shows codefolding bar on gutter.'
          Caption = 'Code folding'
          TabOrder = 5
        end
        object cbDrag: TTntCheckBox
          Left = 270
          Top = 44
          Width = 256
          Height = 17
          Hint = 'Enables drag&drop operation for text movement.'
          Caption = 'Text dragging'
          TabOrder = 6
        end
        object cbCollap: TTntCheckBox
          Left = 270
          Top = 60
          Width = 256
          Height = 17
          Hint = 
            'Collapse empty lines after text range when this rang have been c' +
            'ollapsed.'
          Caption = 'Collapse empty lines'
          TabOrder = 7
        end
        object cbFLine: TTntCheckBox
          Left = 270
          Top = 76
          Width = 256
          Height = 17
          Hint = 
            'Prevents the line height calculation. Line height will be calcul' +
            'ated by means of Default Style.'
          Caption = 'Fixed line height'
          TabOrder = 8
        end
        object cbAutoInd: TTntCheckBox
          Left = 8
          Top = 104
          Width = 258
          Height = 17
          Hint = 
            'Positions the cursor under the first non-blank character of the ' +
            'preceding non-blank line when you press Enter.'
          Caption = 'Auto indent mode'
          TabOrder = 9
        end
        object cbBackInd: TTntCheckBox
          Left = 8
          Top = 120
          Width = 258
          Height = 17
          Hint = 
            'Aligns the insertion point to the previous indentation level (ou' +
            'tdents it) when you press Backspace.'
          Caption = 'Backspace unindents'
          TabOrder = 10
        end
        object cbGrRedo: TTntCheckBox
          Left = 8
          Top = 136
          Width = 258
          Height = 17
          Hint = 'If it is set Redo will involve group of changes.'
          Caption = 'Group redo'
          TabOrder = 11
        end
        object cbGrUndo: TTntCheckBox
          Left = 8
          Top = 152
          Width = 258
          Height = 17
          Hint = 
            'Undoes your last editing command as well as any subsequent editi' +
            'ng commands of the same type.'
          Caption = 'Group undo'
          TabOrder = 12
        end
        object cbUndoSav: TTntCheckBox
          Left = 8
          Top = 168
          Width = 258
          Height = 17
          Hint = 'Stays Undo buffer unchanged after save.'
          Caption = 'Undo after save'
          TabOrder = 13
        end
        object cbCopyRtf: TTntCheckBox
          Left = 8
          Top = 184
          Width = 258
          Height = 17
          Hint = 'Copies selected text also in RTF format.'
          Caption = 'Copy to clipboard as RTF'
          TabOrder = 14
        end
        object cbSmCaret: TTntCheckBox
          Left = 8
          Top = 200
          Width = 258
          Height = 17
          Hint = 'Acts on the caret movement (up, down, line start, line end).'
          Caption = 'Smart caret behaviour'
          TabOrder = 15
        end
        object cbKeepCaret: TTntCheckBox
          Left = 8
          Top = 216
          Width = 258
          Height = 17
          Hint = 'Allows the caret to move only inside the text.'
          Caption = 'Keep caret in text'
          TabOrder = 16
        end
        object cbOptFill: TTntCheckBox
          Left = 8
          Top = 232
          Width = 258
          Height = 17
          Hint = 
            'Begins every auto-indented line with the minimum number of chara' +
            'cters possible, using tabs and spaces as necessary.'
          Caption = 'Optimal fill'
          TabOrder = 17
        end
        object cbFloatM: TTntCheckBox
          Left = 270
          Top = 104
          Width = 256
          Height = 17
          Hint = 
            'If it is set markers are linked to text, so they will move with ' +
            'text during editing. Otherwise they are linked to caret position' +
            '.'
          Caption = 'Floating markers'
          TabOrder = 18
        end
        object cbScrollLast: TTntCheckBox
          Left = 270
          Top = 120
          Width = 256
          Height = 17
          Hint = 
            'When it is set you may scroll to last line, otherwise you can sc' +
            'roll to last page.'
          Caption = 'Scroll to last line'
          TabOrder = 19
        end
        object cbWrapMar: TTntCheckBox
          Left = 270
          Top = 136
          Width = 256
          Height = 17
          Hint = 'Word wrap works on right margin, not edge of memo.'
          Caption = 'Word wrap on right margin'
          TabOrder = 20
        end
        object cbFixMove: TTntCheckBox
          Left = 270
          Top = 152
          Width = 256
          Height = 17
          Hint = 
            'Keeps X position of caret before editing text, this position is ' +
            'used when moving up/down caret.'
          Caption = 'Fixed column move'
          TabOrder = 21
        end
        object cbVarHorz: TTntCheckBox
          Left = 270
          Top = 168
          Width = 256
          Height = 17
          Hint = 
            'Recalculates horizontal scrollbar for currently displayed text o' +
            'nly.'
          Caption = 'Variable horizontal scrollbar'
          TabOrder = 22
        end
        object cbUnindKeep: TTntCheckBox
          Left = 270
          Top = 184
          Width = 256
          Height = 17
          Hint = 'Stops unindent when any line is already at pos 0.'
          Caption = 'Unindent keeps align'
          TabOrder = 23
        end
        object cbKeepBlank: TTntCheckBox
          Left = 270
          Top = 200
          Width = 256
          Height = 17
          Hint = 'Don'#39't remove spaces on line ends, on file saving.'
          Caption = 'Keep trailing blanks'
          TabOrder = 24
        end
        object cbSelMode: TTntComboBox
          Left = 8
          Top = 264
          Width = 97
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 26
          Items.Strings = (
            'Normal'
            'Columns'
            'Lines')
        end
        object cbKeepPaste: TTntCheckBox
          Left = 270
          Top = 216
          Width = 256
          Height = 17
          Hint = 'Don'#39't change caret position when performing Paste action.'
          Caption = 'Keep caret on paste'
          TabOrder = 25
        end
      end
    end
    object tabEd2: TTntTabSheet
      Caption = 'Editor 2'
      ImageIndex = 6
      TabVisible = False
      OnShow = tabEd2Show
      object gEditor: TTntGroupBox
        Left = 8
        Top = 92
        Width = 529
        Height = 285
        TabOrder = 1
        object Label15: TTntLabel
          Left = 56
          Top = 172
          Width = 58
          Height = 13
          Caption = 'Line spacing'
        end
        object Label3: TTntLabel
          Left = 56
          Top = 148
          Width = 60
          Height = 13
          Caption = 'Right margin'
        end
        object Label14: TTntLabel
          Left = 400
          Top = 160
          Width = 63
          Height = 13
          Caption = 'Line numbers'
        end
        object TntLabel28: TTntLabel
          Left = 400
          Top = 184
          Width = 61
          Height = 13
          Caption = 'Block staples'
        end
        object cbLink: TTntCheckBox
          Left = 8
          Top = 12
          Width = 256
          Height = 17
          Hint = 'Underlines links and makes them clickable.'
          Caption = 'Highlight URLs (links)'
          TabOrder = 0
        end
        object cbDLBack: TTntCheckBox
          Left = 270
          Top = 44
          Width = 256
          Height = 17
          Hint = 'Draws custom background for the current line.'
          Caption = 'Draw current line background'
          TabOrder = 12
        end
        object cbCaret: TTntCheckBox
          Left = 8
          Top = 108
          Width = 256
          Height = 17
          Hint = 'Shows caret in read-only mode.'
          Caption = 'Show caret in read-only'
          TabOrder = 6
        end
        object cbHideCur: TTntCheckBox
          Left = 270
          Top = 12
          Width = 256
          Height = 17
          Hint = 
            'Hides mouse cursor when you type text and mouse cursor is within' +
            ' client area.'
          Caption = 'Hide cursor on typing'
          TabOrder = 10
        end
        object edLSpace: TSpinEdit
          Left = 8
          Top = 168
          Width = 41
          Height = 22
          Hint = 'Vertical spacing between lines.'
          MaxValue = 10
          MinValue = 0
          TabOrder = 9
          Value = 0
          OnKeyDown = edIndKeyDown
        end
        object edMar: TSpinEdit
          Left = 8
          Top = 143
          Width = 41
          Height = 22
          Hint = 'Right margin column position.'
          MaxValue = 300
          MinValue = 1
          TabOrder = 8
          Value = 1
          OnKeyDown = edIndKeyDown
        end
        object cbMar: TTntCheckBox
          Left = 8
          Top = 124
          Width = 256
          Height = 17
          Hint = 'Shows vertical line after specified column.'
          Caption = 'Show right margin'
          TabOrder = 7
        end
        object edNums: TTntComboBox
          Left = 270
          Top = 156
          Width = 123
          Height = 21
          Hint = 'Style of line numbering.'
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 18
          Items.Strings = (
            'Default'
            'Delphi style'
            'Each 5th'
            'Only current')
        end
        object cbDFocus: TTntCheckBox
          Left = 270
          Top = 28
          Width = 256
          Height = 17
          Hint = 'Draws focus rectangle around current line when editor has focus.'
          Caption = 'Draw current line focus'
          TabOrder = 11
        end
        object cbRuler: TTntCheckBox
          Left = 8
          Top = 92
          Width = 256
          Height = 17
          Hint = 'Shows ruler above editor area.'
          Caption = 'Show horizontal ruler'
          TabOrder = 5
        end
        object cbSmHi: TTntCheckBox
          Left = 8
          Top = 44
          Width = 256
          Height = 17
          Hint = 'Marks all occurances of selected word.'
          Caption = 'Smart highlighting'
          TabOrder = 2
        end
        object cbBrHi: TTntCheckBox
          Left = 8
          Top = 76
          Width = 256
          Height = 17
          Hint = 
            'Enables highlighting of pair brackets (if not overridden in lexe' +
            'r).'
          Caption = 'Highlight pair brackets'
          TabOrder = 4
        end
        object cbSmHiCase: TTntCheckBox
          Left = 22
          Top = 60
          Width = 243
          Height = 17
          Hint = 'Makes Smart Highlighting search case-sensitive.'
          Caption = 'Case sensitive'
          TabOrder = 3
        end
        object cbBkUndo: TTntCheckBox
          Left = 270
          Top = 128
          Width = 256
          Height = 25
          Hint = 
            'Allow Undo for such operations as "Delete bookmarked lines", "Pa' +
            'ste into bookmarked lines". Much slower.'
          Caption = 'Allow Undo for massive strings deletion'
          TabOrder = 17
          WordWrap = True
        end
        object cbStaples: TComboBox
          Left = 312
          Top = 180
          Width = 81
          Height = 22
          Hint = 'Line style of block staples.'
          Style = csOwnerDrawFixed
          ItemHeight = 16
          TabOrder = 20
          OnDrawItem = cbStaplesDrawItem
        end
        object edStapleOffset: TSpinEdit
          Left = 270
          Top = 180
          Width = 41
          Height = 22
          Hint = 'Horizontal offset of block staples (in pixels).'
          MaxValue = 5
          MinValue = -5
          TabOrder = 19
          Value = 0
          OnKeyDown = edIndKeyDown
        end
        object cbDWrapMark: TTntCheckBox
          Left = 270
          Top = 76
          Width = 256
          Height = 17
          Hint = 'Draw "line is wrapped" icons on gutter.'
          Caption = 'Draw gutter "line wrapped" mark'
          TabOrder = 14
        end
        object cbColorOnEmpty: TTntCheckBox
          Left = 270
          Top = 108
          Width = 256
          Height = 17
          Hint = 
            'Colorize selected lines background with white space after line e' +
            'nds.'
          Caption = 'Colorize selection BG including white space'
          TabOrder = 16
        end
        object cbCopyLineNSel: TTntCheckBox
          Left = 270
          Top = 92
          Width = 256
          Height = 17
          Hint = 
            'Copy/Cut operations will take current line, if no selection is m' +
            'ade in editor.'
          Caption = 'Copy/Cut current line if no selection made'
          TabOrder = 15
        end
        object cbUrlClick: TTntCheckBox
          Left = 22
          Top = 28
          Width = 243
          Height = 17
          Hint = 
            'Use just a click (without Ctrl pressed) to activate hyperlink (U' +
            'RL) under cursor.'
          Caption = 'Activate URLs by single click'
          TabOrder = 1
        end
        object cbShowCol: TTntCheckBox
          Left = 270
          Top = 60
          Width = 256
          Height = 17
          Hint = 'Draw vertical line at caret'#39's column position.'
          Caption = 'Draw current column margin'
          TabOrder = 13
        end
        object gNonPrint: TTntGroupBox
          Left = 8
          Top = 200
          Width = 249
          Height = 81
          Caption = 'Non-printable chars'
          TabOrder = 21
          object cbNPrintShow: TTntCheckBox
            Left = 8
            Top = 12
            Width = 230
            Height = 17
            Caption = 'Show'
            TabOrder = 0
          end
          object cbNPrintSp: TTntCheckBox
            Left = 8
            Top = 28
            Width = 230
            Height = 17
            Caption = 'Spaces/tabs'
            TabOrder = 1
          end
          object cbNPrintEol: TTntCheckBox
            Left = 8
            Top = 44
            Width = 230
            Height = 17
            Caption = 'Line ends'
            TabOrder = 2
          end
          object cbNPrintEolEx: TTntCheckBox
            Left = 8
            Top = 60
            Width = 230
            Height = 17
            Caption = 'Line ends details'
            TabOrder = 3
          end
        end
      end
      object GroupBox2: TTntGroupBox
        Left = 8
        Top = 4
        Width = 529
        Height = 81
        TabOrder = 0
        object Label1: TTntLabel
          Left = 74
          Top = 16
          Width = 57
          Height = 13
          Caption = 'Block indent'
        end
        object Label13: TTntLabel
          Left = 74
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Undo limit'
        end
        object Label6: TTntLabel
          Left = 376
          Top = 40
          Width = 47
          Height = 13
          Caption = 'Tab mode'
        end
        object Label16: TTntLabel
          Left = 376
          Top = 16
          Width = 47
          Height = 13
          Caption = 'Tab stops'
        end
        object edInd: TSpinEdit
          Left = 8
          Top = 12
          Width = 61
          Height = 22
          Hint = 'Size of block indentation for commands Indent/Unindent.'
          MaxValue = 32
          MinValue = 1
          TabOrder = 0
          Value = 1
          OnKeyDown = edIndKeyDown
        end
        object edULimit: TSpinEdit
          Left = 8
          Top = 36
          Width = 61
          Height = 22
          Hint = 'Number of actions that can be undone.'
          Increment = 100
          MaxValue = 100000
          MinValue = 10
          TabOrder = 1
          Value = 10
          OnKeyDown = edIndKeyDown
        end
        object edTabMode: TTntComboBox
          Left = 270
          Top = 36
          Width = 97
          Height = 21
          Hint = 
            'Behaviour of Tab key. SmartTab: inserts spaces to the first non-' +
            'whitespace character in the preceding line.'
          AutoDropDown = True
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          OnChange = edTabModeChange
          Items.Strings = (
            'Spaces'
            'Tab character'
            'SmartTab')
        end
        object edTab_: TTntEdit
          Left = 270
          Top = 12
          Width = 97
          Height = 21
          Hint = 
            'Tab key moves cursor onto these column positions (separate with ' +
            'space).'
          TabOrder = 2
        end
        object cbTabSp: TTntCheckBox
          Left = 270
          Top = 60
          Width = 256
          Height = 17
          Hint = 'Replace existing tabs with spaces also on file opening.'
          Caption = 'Replace tabs with spaces on file opening'
          TabOrder = 4
        end
      end
    end
    object tabCarets: TTntTabSheet
      Caption = 'Editor carets'
      TabVisible = False
      OnShow = tabCaretsShow
      object boxCarets: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 225
        Caption = 'Carets'
        TabOrder = 0
        object TntLabel30: TTntLabel
          Left = 8
          Top = 56
          Width = 162
          Height = 13
          Caption = 'Indicate lines with multiple carets:'
        end
        object TntLabel31: TTntLabel
          Left = 104
          Top = 128
          Width = 106
          Height = 13
          Caption = 'Gutter column number'
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
        object TntLabel40: TTntLabel
          Left = 80
          Top = 160
          Width = 59
          Height = 13
          Caption = 'Caret shape'
        end
        object cbCaretMulti: TTntCheckBox
          Left = 8
          Top = 16
          Width = 481
          Height = 17
          Caption = 'Enable multi-carets mode'
          TabOrder = 0
        end
        object cbCaretIndNone: TTntRadioButton
          Left = 24
          Top = 72
          Width = 500
          Height = 17
          Caption = 'Don'#39't indicate'
          TabOrder = 1
        end
        object cbCaretIndLine: TTntRadioButton
          Left = 24
          Top = 88
          Width = 500
          Height = 17
          Caption = 'By line background color'
          TabOrder = 2
        end
        object cbCaretIndGutter: TTntRadioButton
          Left = 24
          Top = 104
          Width = 500
          Height = 17
          Caption = 'By gutter background color'
          TabOrder = 3
        end
        object edCaretGutterCol: TSpinEdit
          Left = 48
          Top = 124
          Width = 49
          Height = 22
          MaxValue = 3
          MinValue = 0
          TabOrder = 4
          Value = 1
          OnKeyDown = edIndKeyDown
        end
        object cbCaretWidth: TTrackBar
          Left = 192
          Top = 156
          Width = 105
          Height = 25
          Max = 4
          PageSize = 1
          TabOrder = 5
          ThumbLength = 18
          Visible = False
        end
        object edCaretType: TTntComboBox
          Left = 16
          Top = 156
          Width = 57
          Height = 22
          Style = csDropDownList
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          ItemHeight = 14
          ItemIndex = 4
          ParentFont = False
          TabOrder = 6
          Text = '  '#9604
          Items.Strings = (
            '  '#9474
            '  '#9612
            '  '#9608
            '  _'
            '  '#9604)
        end
      end
    end
    object tabOvr: TTntTabSheet
      Caption = 'Editor overrides'
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
        OnKeyDown = KeyListKeyDown
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
          OnKeyDown = edIndKeyDown
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
      object gSR: TTntGroupBox
        Left = 8
        Top = 4
        Width = 529
        Height = 161
        Caption = 'Search'
        TabOrder = 0
        object TntLabel32: TTntLabel
          Left = 72
          Top = 104
          Width = 201
          Height = 29
          AutoSize = False
          Caption = 'Offset of search result from horizontal edge'
          WordWrap = True
        end
        object TntLabel17: TTntLabel
          Left = 72
          Top = 128
          Width = 201
          Height = 29
          AutoSize = False
          Caption = 'Find result tree: max nodes per file'
          WordWrap = True
        end
        object cbSrDlg: TTntCheckBox
          Left = 8
          Top = 16
          Width = 260
          Height = 17
          Caption = 'Allow Lister to call custom search dialog'
          TabOrder = 0
        end
        object cbSrWord: TTntCheckBox
          Left = 270
          Top = 32
          Width = 256
          Height = 17
          Caption = 'Suggest current word as search text'
          TabOrder = 8
        end
        object cbSrHistTC: TTntCheckBox
          Left = 8
          Top = 32
          Width = 260
          Height = 17
          Caption = 'Use TotalCmd'#39's history section'
          TabOrder = 1
        end
        object cbSrOnTop: TTntCheckBox
          Left = 270
          Top = 52
          Width = 256
          Height = 17
          Caption = 'Show search dialog on top *'
          TabOrder = 9
        end
        object cbSrErr: TTntCheckBox
          Left = 8
          Top = 52
          Width = 260
          Height = 17
          Caption = 'Show messagebox when no results found'
          TabOrder = 2
        end
        object cbSrErr2: TTntCheckBox
          Left = 8
          Top = 68
          Width = 260
          Height = 17
          Caption = 'Same, for "Find/Replace in files"'
          TabOrder = 3
        end
        object cbSrSel: TTntCheckBox
          Left = 270
          Top = 16
          Width = 256
          Height = 17
          Caption = 'Suggest selection as search text'
          TabOrder = 7
        end
        object cbSrExpand: TTntCheckBox
          Left = 8
          Top = 88
          Width = 260
          Height = 17
          Caption = 'Search results: expand tree on progress'
          TabOrder = 4
        end
        object edSrOffsetY: TSpinEdit
          Left = 8
          Top = 108
          Width = 57
          Height = 22
          MaxValue = 30
          MinValue = 3
          TabOrder = 5
          Value = 3
          OnKeyDown = edIndKeyDown
        end
        object edSrMaxTreeMatches: TSpinEdit
          Left = 8
          Top = 132
          Width = 57
          Height = 22
          Increment = 10
          MaxValue = 2000
          MinValue = 0
          TabOrder = 6
          Value = 5
          OnKeyDown = edIndKeyDown
        end
      end
      object gQSr: TTntGroupBox
        Left = 8
        Top = 168
        Width = 529
        Height = 81
        Caption = 'Quick Search'
        TabOrder = 1
        object TntLabel2: TTntLabel
          Left = 8
          Top = 36
          Width = 160
          Height = 13
          Caption = 'Behaviour of Esc in Quick Search:'
        end
        object cbQsEsc: TTntComboBox
          Left = 8
          Top = 52
          Width = 243
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Close Quick Search'
            'Close editor'
            'Focus editor')
        end
        object cbQsCap: TTntCheckBox
          Left = 8
          Top = 16
          Width = 260
          Height = 17
          Caption = 'Show buttons captions'
          TabOrder = 0
        end
      end
    end
    object tabTree: TTntTabSheet
      Caption = 'Tree/Map'
      TabVisible = False
      OnShow = tabTreeShow
      object gTree: TTntGroupBox
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
          OnKeyDown = edIndKeyDown
        end
      end
      object TntGroupBox1: TTntGroupBox
        Left = 8
        Top = 68
        Width = 529
        Height = 65
        Caption = 'Mini-map'
        TabOrder = 1
        object TntLabel26: TTntLabel
          Left = 70
          Top = 40
          Width = 44
          Height = 13
          Caption = 'Zoom, %'
        end
        object cbMapVScroll: TTntCheckBox
          Left = 8
          Top = 16
          Width = 280
          Height = 17
          Caption = 'Vertical scrollbar'
          TabOrder = 0
        end
        object edMapZoom: TSpinEdit
          Left = 8
          Top = 36
          Width = 57
          Height = 22
          Increment = 5
          MaxValue = 60
          MinValue = 10
          TabOrder = 1
          Value = 10
          OnKeyDown = edIndKeyDown
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
        Height = 273
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
          Top = 224
          Width = 140
          Height = 13
          Caption = 'Folder of Open/Save dialogs:'
        end
        object TntLabel10: TTntLabel
          Left = 8
          Top = 198
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
          OnKeyDown = edIndKeyDown
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
          OnKeyDown = edIndKeyDown
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
          Top = 160
          Width = 497
          Height = 17
          Caption = 'Cleanup recent files list at startup'
          TabOrder = 7
        end
        object cbDirLast: TTntComboBox
          Left = 264
          Top = 220
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 10
          OnChange = cbDirLastChange
          Items.Strings = (
            'Follow current file'
            'Remember last folder'
            'Custom folder')
        end
        object edDirLast: TTntEdit
          Left = 24
          Top = 244
          Width = 329
          Height = 21
          TabOrder = 11
        end
        object bDirLast: TTntButton
          Left = 360
          Top = 244
          Width = 41
          Height = 21
          Caption = '...'
          TabOrder = 12
          OnClick = bDirLastClick
        end
        object cbBak: TTntComboBox
          Left = 264
          Top = 196
          Width = 233
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 9
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
        object cbSavePos: TTntCheckBox
          Left = 8
          Top = 176
          Width = 497
          Height = 17
          Caption = 'Save last window position'
          TabOrder = 8
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
      Caption = 'Auto-complete'
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
          OnKeyDown = edIndKeyDown
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
          OnKeyDown = edIndKeyDown
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
          OnKeyDown = edIndKeyDown
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
          OnKeyDown = edIndKeyDown
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
          Left = 424
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
          Left = 424
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
          Left = 424
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
        object cbAcpHtm: TTntCheckBox
          Left = 8
          Top = 16
          Width = 450
          Height = 17
          Caption = 'Use special HTML auto-completion'
          TabOrder = 0
        end
        object cbAcpTabbing: TTntCheckBox
          Left = 8
          Top = 48
          Width = 409
          Height = 17
          Caption = 'Use special HTML feature - SmartTagTabbing'
          TabOrder = 2
        end
        object cbAcpCss: TTntCheckBox
          Left = 8
          Top = 32
          Width = 450
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
      Caption = 'Auto-save'
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
          OnKeyDown = edIndKeyDown
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
          OnKeyDown = edIndKeyDown
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
      Caption = 'Spell checker'
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
      Caption = 'Search folders'
      TabVisible = False
      OnShow = tabFoldersShow
      object boxFolders: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 237
        Caption = 'Search folders'
        TabOrder = 0
        object TntLabel14: TTntLabel
          Left = 8
          Top = 216
          Width = 283
          Height = 13
          Caption = 'Hint: add * after folder name to search in all its subfolders.'
        end
        object TntLabel15: TTntLabel
          Left = 8
          Top = 16
          Width = 345
          Height = 29
          AutoSize = False
          Caption = 
            'Folders, which are looked by command "Open <selection>" of edito' +
            'r context menu:'
          WordWrap = True
        end
        object edFolders: TTntMemo
          Left = 8
          Top = 48
          Width = 345
          Height = 133
          ScrollBars = ssBoth
          TabOrder = 0
          OnKeyDown = edFoldersKeyDown
        end
        object bAddFolder: TTntButton
          Left = 8
          Top = 188
          Width = 129
          Height = 23
          Caption = 'Add folder...'
          TabOrder = 1
          OnClick = bAddFolderClick
        end
      end
    end
    object tabMisc: TTntTabSheet
      Caption = 'Misc'
      TabVisible = False
      OnShow = tabMiscShow
      object boxMisc: TTntGroupBox
        Left = 8
        Top = 0
        Width = 529
        Height = 269
        Caption = 'Misc'
        TabOrder = 0
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
        object TntLabel18: TTntLabel
          Left = 176
          Top = 20
          Width = 65
          Height = 13
          Caption = 'Emmet profile'
          Layout = tlCenter
        end
        object TntLabel33: TTntLabel
          Left = 160
          Top = 68
          Width = 152
          Height = 13
          Caption = 'Date/time format for plugins log'
        end
        object TntLabel37: TTntLabel
          Left = 160
          Top = 92
          Width = 120
          Height = 13
          Caption = 'Show recent colors menu'
          Layout = tlCenter
        end
        object TntLabel38: TTntLabel
          Left = 160
          Top = 116
          Width = 82
          Height = 13
          Caption = 'Default sort type'
          Layout = tlCenter
        end
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
        object TntLabel29: TTntLabel
          Left = 160
          Top = 132
          Width = 313
          Height = 29
          AutoSize = False
          Caption = 'Offsets (horz. and vert.) for commands "Move caret by N chars"'
          Layout = tlCenter
          WordWrap = True
        end
        object cbFullTitle: TTntCheckBox
          Left = 8
          Top = 180
          Width = 360
          Height = 17
          Caption = 'Show full path in window caption'
          TabOrder = 8
        end
        object cbGroupLexers: TTntCheckBox
          Left = 8
          Top = 164
          Width = 360
          Height = 17
          Caption = 'Group lexers list'
          TabOrder = 7
        end
        object cbMenuIcon: TTntCheckBox
          Left = 8
          Top = 196
          Width = 360
          Height = 17
          Caption = 'Show icons in context menu'
          TabOrder = 9
        end
        object edDateFmt: TTntEdit
          Left = 8
          Top = 40
          Width = 145
          Height = 21
          TabOrder = 1
        end
        object cbBeep: TTntCheckBox
          Left = 8
          Top = 244
          Width = 360
          Height = 17
          Caption = 'Allow beep sounds'
          TabOrder = 12
        end
        object cbTips: TTntCheckBox
          Left = 8
          Top = 212
          Width = 360
          Height = 17
          Caption = 'Show panels'#39' tooltips'
          TabOrder = 10
        end
        object edMovX: TSpinEdit
          Left = 8
          Top = 136
          Width = 65
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 5
          Value = 1
          OnKeyDown = edIndKeyDown
        end
        object edMovY: TSpinEdit
          Left = 88
          Top = 136
          Width = 65
          Height = 22
          MaxValue = 200
          MinValue = 1
          TabOrder = 6
          Value = 1
          OnKeyDown = edIndKeyDown
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
        object cbStripBk: TTntCheckBox
          Left = 8
          Top = 228
          Width = 497
          Height = 17
          Caption = 'Strip names in "Go to portable bookmark" dialog'
          TabOrder = 11
        end
        object edDateFmtP: TTntEdit
          Left = 8
          Top = 64
          Width = 145
          Height = 21
          TabOrder = 2
        end
        object cbRecColors: TTntComboBox
          Left = 8
          Top = 88
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Items.Strings = (
            'Auto-hide'
            'Always show'
            'Always hide')
        end
        object cbSortMode: TTntComboBox
          Left = 8
          Top = 112
          Width = 145
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
          Items.Strings = (
            'Unicode'
            'Unicode (Win API)'
            'ASCII'
            'Numeric')
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
      0700666D5365747570010100000001000000070043617074696F6E0146010000
      040054616273000005007461624564010100000002000000070043617074696F
      6E000500674564697400000600426576656C31000007006362424F7665720102
      00000004000000070043617074696F6E03000000040048696E74000700636242
      50657273010200000006000000070043617074696F6E05000000040048696E74
      000800636244436C69636B010200000008000000070043617074696F6E070000
      00040048696E740007006362477253656C01020000000C000000070043617074
      696F6E0B000000040048696E7400060063625772617001020000001000000007
      0043617074696F6E0F000000040048696E740006006362466F6C640102000000
      14000000070043617074696F6E13000000040048696E74000600636244726167
      010200000016000000070043617074696F6E15000000040048696E7400080063
      62436F6C6C6170010200000018000000070043617074696F6E17000000040048
      696E740007006362464C696E6501020000001A000000070043617074696F6E19
      000000040048696E7400090063624175746F496E6401020000001C0000000700
      43617074696F6E1B000000040048696E7400090063624261636B496E64010200
      00001E000000070043617074696F6E1D000000040048696E7400080063624772
      5265646F010200000020000000070043617074696F6E1F000000040048696E74
      00080063624772556E646F010200000022000000070043617074696F6E210000
      00040048696E740009006362556E646F53617601020000002400000007004361
      7074696F6E23000000040048696E740009006362436F70795274660102000000
      26000000070043617074696F6E25000000040048696E740009006362536D4361
      726574010200000028000000070043617074696F6E27000000040048696E7400
      0B0063624B656570436172657401020000002A000000070043617074696F6E29
      000000040048696E7400090063624F707446696C6C01020000002C0000000700
      43617074696F6E2B000000040048696E740008006362466C6F61744D01020000
      0032000000070043617074696F6E31000000040048696E74000C006362536372
      6F6C6C4C617374010200000034000000070043617074696F6E33000000040048
      696E740009006362577261704D6172010200000036000000070043617074696F
      6E35000000040048696E7400090063624669784D6F7665010200000038000000
      070043617074696F6E37000000040048696E740009006362566172486F727A01
      020000003A000000070043617074696F6E39000000040048696E74000B006362
      556E696E644B65657001020000003C000000070043617074696F6E3B00000004
      0048696E74000B0063624B656570426C616E6B01020000003E00000007004361
      7074696F6E3D000000040048696E7400060074616245643201010000003F0000
      00070043617074696F6E00070067456469746F72000007004C6162656C313501
      0100000040000000070043617074696F6E0006004C6162656C33010100000041
      000000070043617074696F6E0007004C6162656C313401010000004200000007
      0043617074696F6E00060063624C696E6B010200000048000000070043617074
      696F6E47000000040048696E740008006362444C4261636B01020000004A0000
      00070043617074696F6E49000000040048696E74000700636243617265740102
      0000004C000000070043617074696F6E4B000000040048696E74000900636248
      69646543757201020000004E000000070043617074696F6E4D00000004004869
      6E7400080065644C5370616365010100000053000000040048696E7400050065
      644D6172010100000054000000040048696E7400050063624D61720102000000
      56000000070043617074696F6E55000000040048696E7400060065644E756D73
      010200000057000000040048696E745800000005004974656D73000800636244
      466F63757301020000005A000000070043617074696F6E59000000040048696E
      74000700636252756C657201020000005C000000070043617074696F6E5B0000
      00040048696E7400090047726F7570426F7832000006004C6162656C31010100
      00005D000000070043617074696F6E0007004C6162656C313301010000005E00
      0000070043617074696F6E0006004C6162656C3601010000005F000000070043
      617074696F6E0007004C6162656C313601010000006000000007004361707469
      6F6E0005006564496E64010100000061000000040048696E740008006564554C
      696D6974010100000062000000040048696E7400090065645461624D6F646501
      0200000063000000040048696E746400000005004974656D7300060065645461
      625F010100000065000000040048696E74000900746162436F6C6F7273010100
      000095010000070043617074696F6E00070067436F6C6F727301010000006700
      0000070043617074696F6E0006004C6162656C34010100000068000000070043
      617074696F6E0006004C6162656C35010100000069000000070043617074696F
      6E000A004C697374436F6C6F727300000B005374617469635465787431010100
      00006B000000070043617074696F6E000700746162496E746601010000007800
      0000070043617074696F6E0007004C6162656C31310101000000790000000700
      43617074696F6E000700626F78496E746601010000007A000000070043617074
      696F6E000600636243686172010100000080000000070043617074696F6E0006
      00636253746174010100000082000000070043617074696F6E00060063624D65
      6E75010100000083000000070043617074696F6E0006007461624B6579010100
      000089000000070043617074696F6E0007004B65794C69737400000800656348
      6F744B657900000700624B657953657401010000008A00000007004361707469
      6F6E000700624B6579436C7201010000008B000000070043617074696F6E0006
      00624B6579466E01010000008C000000070043617074696F6E00080074616246
      696C65730101000000CC010000070043617074696F6E00060074616241435001
      010000009C000000070043617074696F6E000600624170706C790101000000A4
      000000070043617074696F6E0004006243616E0101000000A500000007004361
      7074696F6E000300624F6B0101000000A6000000070043617074696F6E000A00
      466F6E744469616C6F6700000A004B65794D617070696E67000007004C616265
      6C31380101000000A7000000070043617074696F6E00060063624C616E670000
      0900436F6C6F72426F7831000006006362496E73740101000000B20000000700
      43617074696F6E00070067416370416C6C0101000000B3000000070043617074
      696F6E0007004C6162656C34320101000000B4000000070043617074696F6E00
      0B00636241637046696C7465720101000000B700000005004974656D73000900
      63624163704E6F6E650101000000B9000000070043617074696F6E0007006362
      54616253700102000000BF000000070043617074696F6EBE000000040048696E
      74000600626F784E65770101000000C1000000070043617074696F6E00090054
      6E744C6162656C340101000000C2000000070043617074696F6E000500656445
      6E630101000000C300000005004974656D73000900546E744C6162656C350101
      000000C4000000070043617074696F6E00040065644C450101000000C5000000
      05004974656D73000900546E744C6162656C360101000000C600000007004361
      7074696F6E00050065644C6578000006006362536D48690102000000D8000000
      070043617074696F6ED7000000040048696E74000900656441637044726F7000
      000A0062436F6C6F724C6F61640101000000DC000000070043617074696F6E00
      0A0062436F6C6F72536176650101000000DD000000070043617074696F6E000D
      004F70656E4469616C6F6750726500000D00536176654469616C6F6750726500
      0006006362427248690102000000E1000000070043617074696F6EE000000004
      0048696E74000700746162486973740101000000E7000000070043617074696F
      6E000700626F78486973740101000000E8000000070043617074696F6E000600
      4C6162656C380101000000E9000000070043617074696F6E0006004C6162656C
      370101000000EA000000070043617074696F6E000A00546E744C6162656C3131
      0101000000EB000000070043617074696F6E0004006564465300000400656453
      520000080063624843617265740101000000EC000000070043617074696F6E00
      0600636248456E630101000000ED000000070043617074696F6E00060062436C
      7253520101000000EE000000070043617074696F6E00060062436C7246530101
      000000EF000000070043617074696F6E00050063624D72750101000000F00000
      00070043617074696F6E00090063624469724C6173740101000000F200000005
      004974656D7300090065644469724C61737400000800624469724C6173740000
      0A006362536D4869436173650102000000F4000000070043617074696F6EF300
      0000040048696E74000A00546E744C6162656C31300101000000F90000000700
      43617074696F6E000500636242616B0101000000FA00000005004974656D7300
      080065644163704E756D00000500674163703201010000000301000007004361
      7074696F6E000900636241637046696C65010100000004010000070043617074
      696F6E000E00656441637046696C65436861727300000D00656441637046696C
      6553697A65000011004C6162656C41637046696C654368617273010100000005
      010000070043617074696F6E0010004C6162656C41637046696C6553697A6501
      0100000006010000070043617074696F6E00080063624B657943617400000A00
      546E744C6162656C313901010000000B010000070043617074696F6E00050063
      6245736301010000000F01000005004974656D73000A00546E744C6162656C32
      31010100000010010000070043617074696F6E00090074616253656172636801
      01000000A5010000070043617074696F6E000300675352010100000021010000
      070043617074696F6E00070063625372446C6701010000002201000007004361
      7074696F6E00080063625372576F726401010000002301000007004361707469
      6F6E000A0063625372486973745443010100000024010000070043617074696F
      6E000900636253724F6E546F70010100000025010000070043617074696F6E00
      040067515372010100000026010000070043617074696F6E000900546E744C61
      62656C32010100000027010000070043617074696F6E00070063625173457363
      01010000002801000005004974656D7300070063625173436170010100000029
      010000070043617074696F6E000A00546E744C6162656C323201010000002A01
      0000070043617074696F6E0007006362537245727201010000002B0100000700
      43617074696F6E000800636253724572723201010000002C0100000700436170
      74696F6E0008006362426B556E646F01020000002E010000070043617074696F
      6E2D010000040048696E74000800656446696C74657200000A00546E744C6162
      656C3235010100000034010000070043617074696F6E00090054696D65724669
      6C74000009006362537461706C657301010000003C010000040048696E74000A
      00546E744C6162656C323801010000003B010000070043617074696F6E000E00
      6564537461706C654F666673657401010000003D010000040048696E74000A00
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
      62556E6E616D656442726F77736500000A0063625372457870616E6401010000
      0056010000070043617074696F6E000600674163705370010100000059010000
      070043617074696F6E000800636241637048746D01010000005A010000070043
      617074696F6E000C00636241637054616262696E6701010000005B0100000700
      43617074696F6E000800636241637043737301010000005C0100000700436170
      74696F6E000C006C6162536D54616248656C7001010000005D01000007004361
      7074696F6E00070063624854656D70010100000061010000070043617074696F
      6E000E00636241637055736553696E676C650101000000620100000700436170
      74696F6E0009006362526F537461727401010000006301000007004361707469
      6F6E000C00636254706C54616262696E67010100000065010000070043617074
      696F6E000A006C616254706C48656C7001010000006601000007004361707469
      6F6E000C00636241436C6F73655461677301010000006C010000070043617074
      696F6E000900546E744C6162656C3701010000006D010000070043617074696F
      6E000A00546E744C6162656C313201010000006E010000070043617074696F6E
      0010006C61624175746F436C6F736548656C7001010000006F01000007004361
      7074696F6E000A00636241436C6F736542720101000000700100000700436170
      74696F6E000D00636241436C6F73654272457363010100000072010000070043
      617074696F6E000900636241436C6F7365510101000000730100000700436170
      74696F6E000B00636244577261704D61726B01020000007A0100000700436170
      74696F6E79010000040048696E740007004C6973744361740000070074616254
      61627301010000007E010000070043617074696F6E000700626F785461627301
      010000007F010000070043617074696F6E000900546E744C6162656C33010100
      000080010000070043617074696F6E000800636254616242746E010100000081
      010000070043617074696F6E00080063625461624D756C010100000083010000
      070043617074696F6E0009006362546162446F776E0101000000840100000700
      43617074696F6E00090063625461624E756D7301010000008501000007004361
      7074696F6E00070063625461625377010100000086010000070043617074696F
      6E0008006362546162446E44010100000087010000070043617074696F6E000B
      0065645461624D61784C656E00000800636254616244626C0101000000880100
      00070043617074696F6E000A00626F78546F6F6C626172010100000089010000
      070043617074696F6E0006004C6162656C3201010000008A0100000700436170
      74696F6E00070063625468656D65000007004C6162656C313201010000008B01
      0000070043617074696F6E000700636249636F6E7301010000008C0100000500
      4974656D73000800746162466F6E747301010000008D01000007004361707469
      6F6E00050067466F6E7401010000008E010000070043617074696F6E00020062
      31010100000096010000070043617074696F6E00020062320101000000970100
      00070043617074696F6E0002006234010100000098010000070043617074696F
      6E0002006233010100000099010000070043617074696F6E0002006235010100
      00009A010000070043617074696F6E000200623601010000009B010000070043
      617074696F6E0007007461625472656501010000009C01000007004361707469
      6F6E000500675472656501010000009D010000070043617074696F6E000A0063
      625472656553796E6301010000009F010000070043617074696F6E0007007461
      62536573730101000000A6010000070043617074696F6E000700626F78536573
      730101000000A7010000070043617074696F6E00090063625365737344656601
      01000000A8010000070043617074696F6E000A006362536573734C6F61640101
      000000A9010000070043617074696F6E000A0063625365737353617665010100
      0000AA010000070043617074696F6E000700626F7850726F6A0101000000AB01
      0000070043617074696F6E000A00636250726F6A4C6F61640101000000AC0100
      00070043617074696F6E000A00636250726F6A536176650101000000AD010000
      070043617074696F6E000C00546E7447726F7570426F78310101000000AE0100
      00070043617074696F6E000A00546E744C6162656C32360101000000AF010000
      070043617074696F6E000C0063624D6170565363726F6C6C0101000000B10100
      00070043617074696F6E00090065644D61705A6F6F6D00000900626F78464772
      6F75700101000000B2010000070043617074696F6E000900546E744C6162656C
      310101000000B3010000070043617074696F6E0007006362546578745F010100
      0000B401000005004974656D730007004C6162656C31370101000000B5010000
      070043617074696F6E000900546E744C6162656C380101000000B60100000700
      43617074696F6E00050065644F656D0000060065645554463800000900546E74
      4C6162656C390101000000B7010000070043617074696F6E000900626F785265
      6C6F61640101000000B8010000070043617074696F6E0006004C6162656C3901
      01000000B9010000070043617074696F6E00070063624E6F7469660101000000
      BA01000005004974656D7300060063625461696C0101000000BB010000070043
      617074696F6E00080063624F766572524F0101000000BC010000070043617074
      696F6E000900656442696753697A6500000A00546E744C6162656C3233010100
      0000BD010000070043617074696F6E0007007461624D6973630101000000CB01
      0000070043617074696F6E000700626F784D6973630101000000BF0100000700
      43617074696F6E0007006C61624461746500000A00546E744C6162656C323001
      01000000C3010000070043617074696F6E000B00636246756C6C5469746C6501
      01000000C5010000070043617074696F6E000D00636247726F75704C65786572
      730101000000C6010000070043617074696F6E000A0063624D656E7549636F6E
      0101000000C7010000070043617074696F6E000900656444617465466D740000
      06006362426565700101000000C8010000070043617074696F6E000600636254
      6970730101000000C9010000070043617074696F6E00060065644D6F76580000
      060065644D6F765900000C0063625A656E50726F66696C6500000D004C697374
      546162436F6C6F727300000A00546E744C6162656C31330101000000CD010000
      070043617074696F6E00090063625374726970426B0101000000CE0100000700
      43617074696F6E000A00746162466F6C646572730101000000CF010000070043
      617074696F6E000A00626F78466F6C646572730101000000D301000007004361
      7074696F6E000A00546E744C6162656C31340101000000D00100000700436170
      74696F6E000A00546E744C6162656C31350101000000D1010000070043617074
      696F6E0009006564466F6C6465727300000A0062416464466F6C646572010100
      0000D2010000070043617074696F6E0008007461625370656C6C0101000000D4
      010000070043617074696F6E000B00626F785370656C6C4F70740101000000D5
      010000070043617074696F6E000A00546E744C6162656C31360101000000D601
      0000070043617074696F6E000A00546E744C6162656C32340101000000D70100
      00070043617074696F6E000A0065645370656C6C457874000009006362537065
      6C6C456E0101000000D8010000070043617074696F6E000900625370656C6C4F
      70740101000000D9010000070043617074696F6E000B00626F785370656C6C4C
      6E6B0101000000DA010000070043617074696F6E000A00546E744C6162656C32
      370101000000DB010000070043617074696F6E000A006C616244696374577777
      0101000000DC010000070043617074696F6E000A006C61624469637444697201
      01000000DD010000070043617074696F6E000900636253617665506F73010100
      0000DE010000070043617074696F6E0006007461624F76720101000000E10100
      00070043617074696F6E000A00546E744C6162656C31380101000000E2010000
      070043617074696F6E000B00656453724F66667365745900000A00546E744C61
      62656C33320101000000E3010000070043617074696F6E000A00656444617465
      466D745000000A00546E744C6162656C33330101000000E40100000700436170
      74696F6E000E006362436F6C6F724F6E456D7074790102000000E60100000700
      43617074696F6EE5010000040048696E74000800636254616256697301010000
      00E701000005004974656D73000A00656454706C546162457800000A00546E74
      4C6162656C33340101000000E8010000070043617074696F6E00060042657665
      6C3200000900636253656C4D6F64650101000000E901000005004974656D7300
      0A00546E744C6162656C33350101000000EA010000070043617074696F6E000B
      0063624B65657050617374650102000000EC010000070043617074696F6EEB01
      0000040048696E74000A00546E744C6162656C33360101000000ED0100000700
      43617074696F6E0009006362556E694E6565640101000000EE01000005004974
      656D73000B006362526563436F6C6F72730101000000EF01000005004974656D
      73000A00546E744C6162656C33370101000000F0010000070043617074696F6E
      000E006362436F70794C696E654E53656C0102000000F2010000070043617074
      696F6EF1010000040048696E74000A0063624D6963726F4D61700101000000F3
      010000070043617074696F6E000A006362536F72744D6F64650101000000F401
      000005004974656D73000A00546E744C6162656C33380101000000F501000007
      0043617074696F6E0008006C6162456D6D657400000B0063625472656544656C
      617900000A00546E744C6162656C33390101000000F601000007004361707469
      6F6E000A00546E744C6162656C32390101000000F7010000070043617074696F
      6E0009007461624361726574730101000000FA010000070043617074696F6E00
      0900626F784361726574730101000000FC010000070043617074696F6E000C00
      636243617265744D756C74690101000000FB010000070043617074696F6E000A
      00546E744C6162656C33300101000000FD010000070043617074696F6E000E00
      63624361726574496E644E6F6E650101000000FE010000070043617074696F6E
      000E0063624361726574496E644C696E650101000000FF010000070043617074
      696F6E00100063624361726574496E6447757474657201010000000002000007
      0043617074696F6E000A00546E744C6162656C33310101000000010200000700
      43617074696F6E00100065644361726574477574746572436F6C00000C006C61
      62436172657448656C70010100000002020000070043617074696F6E000A0063
      6255726C436C69636B010200000004020000070043617074696F6E0302000004
      0048696E74001200656453724D6178547265654D61746368657300000A00546E
      744C6162656C3137010100000005020000070043617074696F6E000900636253
      686F77436F6C010200000007020000070043617074696F6E0602000004004869
      6E74000C0063624361726574576964746800000A00546E744C6162656C343001
      0100000008020000070043617074696F6E000B00656443617265745479706500
      000900674E6F6E5072696E74010100000009020000070043617074696F6E000C
      0063624E5072696E7453686F7701010000000B020000070043617074696F6E00
      0A0063624E5072696E74537001010000000D020000070043617074696F6E000B
      0063624E5072696E74456F6C01010000000F020000070043617074696F6E000D
      0063624E5072696E74456F6C4578010100000011020000070043617074696F6E
      00}
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
