object fmMain: TfmMain
  Left = 207
  Top = 167
  AutoScroll = False
  ClientHeight = 657
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBXDockTop: TSpTBXDock
    Left = 0
    Top = 25
    Width = 892
    Height = 51
    object tbFile: TSpTBXToolbar
      Left = 0
      Top = 0
      Images = ImageListIcons
      TabOrder = 0
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'File'
      object TBXItemToolNew: TSpTBXSubmenuItem
        Tag = 700
        Action = acNewTab
        ImageIndex = 0
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        LinkSubitems = TBXSubmenuItemFNew
      end
      object TBXSubmenuItemToolOpen: TSpTBXSubmenuItem
        Tag = 701
        Action = acOpen
        ImageIndex = 1
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        LinkSubitems = TBXSubmenuItemFRecents
      end
      object TBXSubmenuItemToolSave: TSpTBXSubmenuItem
        Tag = 702
        Action = acSave
        ImageIndex = 2
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemToolSaveAs: TSpTBXItem
          Tag = 703
          Action = acSaveAs
        end
      end
      object TBXItemToolPrint: TSpTBXSubmenuItem
        Tag = 630
        Action = ecPrintAction
        ImageIndex = 24
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemPreview: TSpTBXItem
          Caption = 'Preview...'
          Hint = ' '
          OnClick = TBXItemPreviewClick
        end
        object TBXItemPageS: TSpTBXItem
          Caption = 'Page setup...'
          Action = ecPageSetupActionNew
        end
        object TBXItemPrintS: TSpTBXItem
          Caption = 'Printer setup...'
          OnClick = ecPrinterSetupExecute
        end
      end
      object TbxSubmenuItemTblFind: TSpTBXSubmenuItem
        Tag = 600
        Caption = 'Find'
        Hint = 'Dialog "Find"'
        Action = ecFind
        ImageIndex = 12
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemBarFNext: TSpTBXItem
          Caption = 'Find next'
          OnClick = TBXItemBarFNextClick
        end
        object TBXItemBarFPrev: TSpTBXItem
          Caption = 'Find previous'
          OnClick = TBXItemBarFPrevClick
        end
        object TBXSeparatorItem9: TSpTBXSeparatorItem
        end
        object TBXItemBarWordNext: TSpTBXItem
          Caption = 'Find current word next'
          OnClick = TBXItemBarWordNextClick
        end
        object TBXItemBarWordPrev: TSpTBXItem
          Caption = 'Find current word prior'
          OnClick = TBXItemBarWordPrevClick
        end
        object TBXSeparatorItem11: TSpTBXSeparatorItem
        end
        object TBXItemBarMarks: TSpTBXItem
          Caption = 'Clear search marks'
          OnClick = TBXItemBarMarksClick
        end
      end
      object TBXItemTbGoto: TSpTBXItem
        Caption = 'Go to line'
        Hint = 'Dialog "Go to"'
        Action = ecGoto
        ImageIndex = 22
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem1: TSpTBXSeparatorItem
      end
      object TBXSubmenuItemTbSetup: TSpTBXSubmenuItem
        Tag = 709
        Caption = 'Setup'
        Hint = 'Dialog "Options"'
        Action = acSetup
        ImageIndex = 4
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemOOLex: TSpTBXItem
          Caption = 'Customize lexer...'
          Action = acSetupLexerNew
        end
        object TBXItemOOLexSt: TSpTBXItem
          Caption = 'Customize lexer styles...'
          Action = acSetupLexerStyles
        end
        object TBXItemOOLexLib: TSpTBXItem
          Caption = 'Customize lexer library...'
          Action = acSetupLexerLib
        end
      end
      object TBXSeparatorItem48: TSpTBXSeparatorItem
      end
      object TBXItemTbSpellLive: TSpTBXSubmenuItem
        Caption = 'Live spelling'
        Hint = 'Enable live spelling (red underlines)'
        Action = ecSpellLive
        ImageIndex = 32
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemTbSpellCheck: TSpTBXItem
          Caption = 'Spell check'
          Hint = 'Perform spell checking of current document'
          OnClick = TBXItemTbSpellCheckClick
          OnSelect = ButtonOnSelect
        end
      end
    end
    object tbEdit: TSpTBXToolbar
      Left = 233
      Top = 0
      DockPos = 204
      Images = ImageListIcons
      TabOrder = 1
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'Edit'
      object TBXItemTbCopy: TSpTBXItem
        Tag = 301
        Action = ecCopy
        ImageIndex = 5
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbCut: TSpTBXItem
        Tag = 302
        Action = ecCut
        ImageIndex = 6
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbPaste: TSpTBXItem
        Tag = 303
        Action = ecPaste
        ImageIndex = 7
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbDel: TSpTBXItem
        Tag = 307
        Action = ecClear
        ImageIndex = 8
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbSelAll: TSpTBXItem
        Tag = 306
        Action = ecSelectAll
        ImageIndex = 9
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem3: TSpTBXSeparatorItem
      end
      object TBXItemTbUndo: TSpTBXItem
        Tag = 304
        Action = ecUndo
        ImageIndex = 10
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbRedo: TSpTBXItem
        Tag = 305
        Action = ecRedo
        ImageIndex = 11
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem4: TSpTBXSeparatorItem
      end
      object TBXSubmenuItemSort: TSpTBXSubmenuItem
        Caption = 'Sort'
        Hint = 'Dialog "Sort lines"'
        Action = ecSortDialog
        ImageIndex = 15
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemTbSortDialog: TSpTBXItem
          Caption = 'Sort dialog...'
          OnClick = TBXItemTbSortDialogClick
        end
        object TBXSeparatorItem86: TSpTBXSeparatorItem
        end
        object TBXItemTbSortAsc: TSpTBXItem
          Tag = 562
          Caption = 'Sort ascending'
          OnClick = TBXItemTbSortAscClick
        end
        object TBXItemTbSortDesc: TSpTBXItem
          Tag = 563
          Caption = 'Sort descending'
          OnClick = TBXItemTbSortDescClick
        end
        object TBXSeparatorItem85: TSpTBXSeparatorItem
        end
        object TBXItemTbDedupAll: TSpTBXItem
          Caption = 'Remove all duplicates'
          OnClick = TBXItemTbDedupAllClick
        end
        object TBXItemTbDedupAdjacent: TSpTBXItem
          Caption = 'Remove adjacent duplicates'
          OnClick = TBXItemTbDedupAdjacentClick
        end
      end
      object TBXSubmenuCase: TSpTBXSubmenuItem
        Caption = 'Change case'
        Hint = 'Selection case changing'
        ImageIndex = 16
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        object TBXItemBarCaseUpper: TSpTBXItem
          Tag = 365
          Caption = 'UPPER CASE'
          OnClick = TBXItemBarCaseUpperClick
        end
        object TBXItemBarCaseLower: TSpTBXItem
          Tag = 366
          Caption = 'lower case'
          OnClick = TBXItemBarCaseLowerClick
        end
        object TBXItemBarCaseTitle: TSpTBXItem
          Tag = 368
          Caption = 'Title Case'
          OnClick = TBXItemBarCaseTitleClick
        end
        object TBXItemBarCaseInvert: TSpTBXItem
          Tag = 365
          Caption = 'iNVERT cASE'
          OnClick = TBXItemBarCaseInvertClick
        end
        object TBXItemBarCaseSent: TSpTBXItem
          Tag = 369
          Caption = 'Sentence case'
          OnClick = TBXItemBarCaseSentClick
        end
        object TBXItemBarCaseRandom: TSpTBXItem
          Caption = 'RanDoM case'
          OnClick = TBXItemBarCaseRandomClick
        end
      end
    end
    object tbUser1: TSpTBXToolbar
      Left = 624
      Top = 0
      DockPos = 624
      Images = ImageListUser1
      PopupMenu = PopupUserTB1
      TabOrder = 2
      Visible = False
      OnMove = tbViewMove
      Caption = '1'
    end
    object tbUser2: TSpTBXToolbar
      Left = 657
      Top = 0
      DockPos = 650
      Images = ImageListUser2
      PopupMenu = PopupUserTB2
      TabOrder = 3
      Visible = False
      OnMove = tbViewMove
      Caption = '2'
    end
    object tbUser3: TSpTBXToolbar
      Left = 690
      Top = 0
      DockPos = 686
      Images = ImageListUser3
      PopupMenu = PopupUserTB3
      TabOrder = 4
      Visible = False
      OnMove = tbViewMove
      Caption = '3'
    end
    object tbQs: TSpTBXToolbar
      Left = 359
      Top = 26
      CloseButtonWhenDocked = True
      DockableTo = [dpTop, dpBottom]
      DockPos = 359
      DockRow = 1
      Images = ImageListIcons
      TabOrder = 5
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'Quick search'
      object TBControlItem1aa: TTBControlItem
        Control = edQs
      end
      object TBXItemFFNext: TSpTBXItem
        Caption = 'Next'
        Hint = 'Find next'
        Enabled = False
        ImageIndex = 26
        OnClick = TBXItemFFNextClick
      end
      object TBXItemFFPrev: TSpTBXItem
        Caption = 'Previous'
        Hint = 'Find previous'
        Enabled = False
        ImageIndex = 27
        OnClick = TBXItemFFPrevClick
      end
      object cbCase: TSpTBXItem
        Caption = 'Case'
        Hint = 'Case sensitive'
        DisplayMode = nbdmTextOnly
        ImageIndex = 28
        OnClick = cbCaseClick
      end
      object cbWord: TSpTBXItem
        Caption = 'Words'
        Hint = 'Whole words only'
        DisplayMode = nbdmTextOnly
        ImageIndex = 29
        OnClick = cbWordClick
      end
      object edQs: TSpTBXEdit
        Left = 0
        Top = 0
        Width = 121
        Height = 21
        Hint = 'Quick search'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        OnChange = edQsChange
        OnExit = edQsExit
        OnKeyDown = edQsKeyDown
        OnKeyPress = edQsKeyPress
      end
    end
  end
  object TBXDockLeft: TSpTBXMultiDock
    Left = 0
    Top = 76
    Width = 250
    Height = 356
    object plTree: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 250
      Height = 356
      ActivateParent = False
      DockableTo = [dpLeft, dpRight]
      DockPos = 4
      HideWhenInactive = False
      TabOrder = 0
      OnDockChanged = plTreeDockChanged
      OnMove = tbViewMove
      OnResize = plTreeResize
      OnVisibleChanged = plTreeVisibleChanged
      object Tree: TSyntaxTreeView
        Left = 0
        Top = 19
        Width = 246
        Height = 109
        ClickAction = staMoveCaret
        AutoSynchronize = True
        Align = alTop
        UpdateDelay = 500
        DragMode = dmAutomatic
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        Indent = 19
        ParentFont = False
        PopupMenu = PopupTree
        RightClickSelect = True
        RowSelect = True
        TabOrder = 0
        OnContextPopup = TreeContextPopup
        OnKeyDown = TreeKeyDown
        OnKeyPress = TreeKeyPress
      end
      object ListTabs: TTntListView
        Left = 0
        Top = 128
        Width = 246
        Height = 150
        Align = alTop
        Columns = <
          item
            Caption = 'Name'
            Width = 80
          end
          item
            Caption = 'Path'
            Width = 400
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        PopupMenu = PopupTabContext
        SmallImages = ImageListFtp
        SortType = stText
        TabOrder = 1
        ViewStyle = vsReport
        OnClick = ListTabsClick
        OnColumnClick = ListTabsColumnClick
        OnCompare = ListTabsCompare
        OnKeyDown = ListTabsKeyDown
      end
    end
  end
  object TBXDockBottom: TSpTBXMultiDock
    Left = 0
    Top = 437
    Width = 892
    Height = 185
    Position = dpxBottom
    object plOut: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 892
      Height = 185
      Caption = 'Output'
      DockPos = 0
      TabOrder = 0
      Visible = False
      OnMove = tbViewMove
      OnResize = plOutResize
      OnVisibleChanged = plOutVisibleChanged
      object ListOut: TTntListBox
        Left = 0
        Top = 19
        Width = 112
        Height = 162
        Style = lbOwnerDrawFixed
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        MultiSelect = True
        ParentFont = False
        PopupMenu = PopupOut
        TabOrder = 0
        OnDblClick = ListOutDblClick
        OnDrawItem = ListOutDrawItem
        OnKeyDown = ListOutKeyDown
        OnMouseDown = ListOutMouseDown
        OnMouseMove = ListOutMouseMove
      end
      object ListVal: TTntListBox
        Left = 112
        Top = 19
        Width = 112
        Height = 162
        Style = lbOwnerDrawFixed
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        ItemHeight = 13
        MultiSelect = True
        ParentFont = False
        PopupMenu = PopupValidate
        TabOrder = 1
        OnDblClick = ListValDblClick
        OnDrawItem = ListOutDrawItem
        OnKeyDown = ListValKeyDown
        OnMouseMove = ListOutMouseMove
      end
      object TreeFind: TTntTreeView
        Left = 224
        Top = 19
        Width = 113
        Height = 162
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Tahoma'
        Font.Style = []
        HideSelection = False
        Indent = 19
        ParentFont = False
        PopupMenu = PopupFind
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        OnAdvancedCustomDrawItem = TreeFindAdvancedCustomDrawItem
        OnChange = TreeFindChange
        OnCustomDrawItem = TreeFindCustomDrawItem
        OnDblClick = TreeFindDblClick
        OnKeyDown = TreeFindKeyDown
        OnKeyPress = TreeKeyPress
      end
      object ListPLog: TTntListBox
        Left = 337
        Top = 19
        Width = 121
        Height = 162
        Style = lbOwnerDrawFixed
        Align = alLeft
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = PopupPluginsLog
        TabOrder = 3
        OnDrawItem = ListPLogDrawItem
        OnKeyDown = ListPLogKeyDown
        OnMouseMove = ListOutMouseMove
      end
      object plConsole: TPanel
        Left = 458
        Top = 19
        Width = 151
        Height = 162
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 5
        object edConsole: TTntComboBox
          Left = 0
          Top = 139
          Width = 151
          Height = 23
          Align = alBottom
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ItemHeight = 15
          ParentFont = False
          TabOrder = 0
          OnKeyDown = edConsoleKeyDown
          OnKeyPress = edConsoleKeyPress
        end
        object MemoConsole: TTntMemo
          Left = 0
          Top = 0
          Width = 151
          Height = 139
          Align = alClient
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 1
          OnDblClick = MemoConsoleDblClick
          OnKeyDown = MemoConsoleKeyDown
        end
      end
      object ListBookmarks: TTntListView
        Left = 608
        Top = 16
        Width = 129
        Height = 137
        BorderStyle = bsNone
        Columns = <
          item
            Caption = 'Filename'
            Width = 500
          end
          item
            Alignment = taRightJustify
            Caption = 'Line'
            Width = 70
          end
          item
            Caption = 'Description'
            Width = 400
          end>
        HideSelection = False
        ReadOnly = True
        RowSelect = True
        SmallImages = ImgListGutter
        TabOrder = 6
        ViewStyle = vsReport
        OnDblClick = ListBookmarksDblClick
        OnKeyDown = ListBookmarksKeyDown
      end
    end
  end
  object TBXDockRight: TSpTBXMultiDock
    Left = 713
    Top = 76
    Width = 179
    Height = 356
    Position = dpxRight
    object plClip: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 179
      Height = 356
      DockPos = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnMove = tbViewMove
      OnResize = plClipResize
      OnVisibleChanged = plClipVisibleChanged
    end
  end
  object Status: TSpTBXStatusBar
    Left = 0
    Top = 631
    Width = 892
    Height = 26
    OnResize = StatusResize
    Images = ImageListStatus
    object StatusItemCaret: TSpTBXLabelItem
      Wrapping = twNone
      OnClick = StatusItemCaretClick
      Alignment = taCenter
      MinWidth = 155
      OnDrawHint = StatusItemCaretDrawHint
    end
    object SpTBXSeparatorItem1: TSpTBXSeparatorItem
    end
    object StatusItemEnc: TSpTBXLabelItem
      Hint = 'Encoding (click to change)'
      Wrapping = twNone
      OnClick = StatusItemEncClick
      Alignment = taCenter
      MinWidth = 85
    end
    object SpTBXSeparatorItem2: TSpTBXSeparatorItem
    end
    object StatusItemEnds: TSpTBXLabelItem
      Hint = 'Line endings (click to change)'
      Wrapping = twNone
      OnClick = StatusItemEndsClick
      Alignment = taCenter
      MinWidth = 30
    end
    object SpTBXSeparatorItem3: TSpTBXSeparatorItem
    end
    object StatusItemLexer: TSpTBXLabelItem
      Hint = 'Lexer (click to change)'
      Wrapping = twNone
      OnClick = StatusItemLexerClick
      Alignment = taCenter
      MinWidth = 130
    end
    object SpTBXSeparatorItem4: TSpTBXSeparatorItem
    end
    object StatusItemChar: TSpTBXLabelItem
      Hint = 'Char at caret position (click to call Char Table)'
      Wrapping = twNone
      ImageIndex = 2
      OnClick = StatusItemCharClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem5: TSpTBXSeparatorItem
    end
    object StatusItemRO: TSpTBXLabelItem
      Hint = 'Read-only (click to change)'
      Wrapping = twNone
      ImageIndex = 1
      OnClick = StatusItemROClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem6: TSpTBXSeparatorItem
    end
    object StatusItemWrap: TSpTBXLabelItem
      Hint = 'Word wrap (click to change)'
      Wrapping = twNone
      ImageIndex = 3
      OnClick = StatusItemWrapClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem7: TSpTBXSeparatorItem
    end
    object StatusItemSelMode: TSpTBXLabelItem
      Hint = 'Mouse selection mode (click to change)'
      Wrapping = twNone
      ImageIndex = 8
      OnClick = StatusItemSelModeClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem8: TSpTBXSeparatorItem
    end
    object StatusItemInsMode: TSpTBXLabelItem
      Caption = 'Ins'
      Hint = 'Insert/overwrite mode (click to change)'
      Wrapping = twNone
      OnClick = StatusItemInsModeClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem9: TSpTBXSeparatorItem
    end
    object StatusItemZoom: TSpTBXLabelItem
      Caption = '100%'
      Hint = 'Zoom value (click to change)'
      Wrapping = twNone
      OnClick = StatusItemZoomClick
      Alignment = taCenter
    end
    object SpTBXSeparatorItem10: TSpTBXSeparatorItem
    end
    object StatusItemTabsize: TSpTBXLabelItem
      Hint = 'Tabulation size'
      Wrapping = twNone
    end
    object SpTBXSeparatorItem11: TSpTBXSeparatorItem
    end
    object StatusItemBusy: TSpTBXLabelItem
      Wrapping = twNone
      ImageIndex = 6
      Alignment = taCenter
    end
    object SpTBXSeparatorItem27: TSpTBXSeparatorItem
    end
    object StatusItemHint: TSpTBXLabelItem
      Wrapping = twNone
    end
  end
  object Menu: TSpTBXDock
    Left = 0
    Top = 0
    Width = 892
    Height = 25
    object tbMenu: TSpTBXToolbar
      Left = 0
      Top = 0
      CloseButton = False
      DockMode = dmCannotFloatOrChangeDocks
      DockPos = 0
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      UpdateActions = False
      OnShortCut = tbMenuShortCut
      Caption = 'Menu'
      Customizable = False
      MenuBar = True
      object TBXSubmenuItemFile: TSpTBXSubmenuItem
        Caption = '&File'
        object TBXSubmenuItemFNew: TSpTBXSubmenuItem
          Caption = '&New'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuItemFNewPopup
          object TBXItemFNew: TSpTBXItem
            Action = acNewTab
            OnSelect = ButtonOnSelect
          end
          object TBXItemFNewWin: TSpTBXItem
            Action = acNewWindow
            OnSelect = ButtonOnSelect
          end
          object SpTBXSeparatorItem14: TSpTBXSeparatorItem
          end
          object TBXMRUListItemFNew: TSpTBXMRUListItem
            MaxItems = 10
            OnClick = TBXMRUListItemFNewClick
          end
          object TBXSeparatorItem28: TSpTBXSeparatorItem
          end
        end
        object TBXItemFOpen: TSpTBXItem
          Caption = '&Open...'
          Hint = 'Open file'
          Action = acOpen
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemFRecents: TSpTBXSubmenuItem
          Caption = 'Recen&t files'
          OnPopup = TBXSubmenuItemFRecentsPopup
          object TBXMRUListItemFRecents: TSpTBXMRUListItem
            HidePathExtension = False
            MaxItems = 10
            OnClick = MRUClick
          end
          object TBXSeparatorItem30: TSpTBXSeparatorItem
          end
          object TBXItemFClearRecents: TSpTBXItem
            Caption = 'Clear list'
            OnClick = TBXItemFClearRecentsClick
          end
        end
        object TBXItemFReopen: TSpTBXItem
          Caption = '&Reopen'
          Hint = 'Reread file from disk'
          Action = acReread
          OnSelect = ButtonOnSelect
        end
        object TBXItemFSave: TSpTBXItem
          Caption = '&Save'
          Hint = 'Save file'
          Action = acSave
          OnSelect = ButtonOnSelect
        end
        object TBXItemFSaveAs: TSpTBXItem
          Caption = 'Save &as...'
          Hint = 'Save file under different name'
          Action = acSaveAs
          OnSelect = ButtonOnSelect
        end
        object TBXItemFSaveAll: TSpTBXItem
          Caption = 'Save a&ll'
          Hint = 'Save all tabs'
          Action = acSaveAll
          OnSelect = ButtonOnSelect
        end
        object TBXItemFRename: TSpTBXItem
          Caption = 'Rena&me...'
          Hint = 'Rename current file'
          Action = acRename
          OnSelect = ButtonOnSelect
        end
        object SpTBXSeparatorItem18: TSpTBXSeparatorItem
        end
        object TBXItemFClose: TSpTBXItem
          Caption = '&Close'
          Hint = 'Close current tab'
          Action = acClose
          OnSelect = ButtonOnSelect
        end
        object TBXItemFCloseAll: TSpTBXItem
          Caption = 'Close all'
          Hint = 'Close all tabs'
          Action = acCloseAll
          OnSelect = ButtonOnSelect
        end
        object TBXItemFCloseOth: TSpTBXItem
          Caption = 'Close ot&her tabs'
          Hint = 'Close all but current tab'
          Action = acCloseOthersThisGroup
          OnSelect = ButtonOnSelect
        end
        object TBXItemFCloseDel: TSpTBXItem
          Caption = 'Close and &delete'
          Hint = 'Close current tab and delete its file'
          Action = acCloseAndDelete
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem22: TSpTBXSeparatorItem
        end
        object TBXSubmenuItemPrint: TSpTBXSubmenuItem
          Caption = 'Print'
          object TBXItemFPrint: TSpTBXItem
            Caption = '&Print...'
            Hint = ' '
            Action = ecPrintAction
            OnSelect = ButtonOnSelect
          end
          object TBXItemFPreview: TSpTBXItem
            Caption = 'Pre&view...'
            Hint = ' '
            OnClick = TBXItemFPreviewClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFPageSetup: TSpTBXItem
            Caption = 'Page setup...'
            Action = ecPageSetupActionNew
            OnSelect = ButtonOnSelect
          end
          object TBXItemFPrinterSetup: TSpTBXItem
            Caption = 'Print&er setup...'
            Hint = ' '
            Action = ecPrinterSetup
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemExport: TSpTBXSubmenuItem
          Caption = 'Export'
          OnSelect = ButtonOnSelect
          object TBXItemFExpHtml: TSpTBXItem
            Caption = 'Export to &HTML...'
            Hint = 
              'Export the current editor contents to HTML including all highlig' +
              'htings'
            Action = acExportHTML
            OnSelect = ButtonOnSelect
          end
          object TBXItemFExpRtf: TSpTBXItem
            Caption = 'Export to &RTF...'
            Hint = 
              'Export the current editor contents to RTF including all highligh' +
              'tings'
            Action = acExportRTF
            OnSelect = ButtonOnSelect
          end
        end
        object TBXItemFProps: TSpTBXItem
          Caption = 'Properties...'
          Hint = 'Show properties of current file/document'
          OnClick = TBXItemFPropsClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem15: TSpTBXSeparatorItem
        end
        object TBXSubmenuItemFav: TSpTBXSubmenuItem
          Caption = 'Favorites'
          OnPopup = TBXSubmenuItemFavPopup
          object TBXItemFavAddFile: TSpTBXItem
            Caption = 'Add current file'
            Hint = 'Add current file to favorites list'
            OnClick = TBXItemFavAddFileClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFavAddProj: TSpTBXItem
            Caption = 'Add current project'
            Hint = 'Add current project to favorites list'
            OnClick = TBXItemFavAddProjClick
            OnSelect = ButtonOnSelect
          end
          object SpTBXSeparatorItem21: TSpTBXSeparatorItem
          end
          object TBXItemFavManage: TSpTBXItem
            Caption = 'Organize Favorites...'
            Hint = 'Manage favorites list'
            OnClick = TBXItemFavManageClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemProjects: TSpTBXSubmenuItem
          Caption = 'Projects'
          object TBXItemProjNew: TSpTBXItem
            Caption = 'New project'
            OnClick = TBXItemProjNewClick
          end
          object TBXItemProjOpen: TSpTBXItem
            Caption = 'Open project...'
            OnClick = TBXItemProjOpenClick
          end
          object TbxItemProjSave: TSpTBXItem
            Caption = 'Save project'
            OnClick = TbxItemProjSaveClick
          end
          object TBXItemProjAddFile: TSpTBXItem
            Caption = 'Add current file to project'
            OnClick = TBXItemProjAddFileClick
          end
          object TBXItemProjAddAllFiles: TSpTBXItem
            Caption = 'Add all files to project'
            OnClick = TBXItemProjAddAllFilesClick
          end
          object TBXItemProjGoto: TSpTBXItem
            Caption = 'Go to project file...'
            OnClick = TBXItemProjGotoClick
          end
          object TBXSubmenuItemProjRecents: TSpTBXSubmenuItem
            Caption = 'Recent projects'
            OnPopup = TBXSubmenuItemProjRecentsPopup
            object TBXMRUListItem_Projects: TSpTBXMRUListItem
              HidePathExtension = False
              MaxItems = 8
              OnClick = TBXMRUListItem_ProjectsClick
            end
            object SpTBXSeparatorItem24: TSpTBXSeparatorItem
            end
            object TBXItemProjRecentClear: TSpTBXItem
              Caption = 'Clear list'
              OnClick = TBXItemProjRecentClearClick
            end
          end
        end
        object TBXSubmenuItemSessions: TSpTBXSubmenuItem
          Caption = 'Sess&ions'
          object TBXItemFSesOpen: TSpTBXItem
            Caption = '&Open session...'
            Hint = 'Open saved tabs list'
            OnClick = TBXItemFSesOpenClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFSesAdd: TSpTBXItem
            Caption = 'Open/A&dd session...'
            Hint = 'Add saved tabs list to current tabs'
            OnClick = TBXItemFSesAddClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFSesSave: TSpTBXItem
            Caption = '&Save session'
            Hint = 'Save tabs list (keep current session name)'
            OnClick = TBXItemFSesSaveClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFSesSaveAs: TSpTBXItem
            Caption = 'Save session &as...'
            Hint = 'Save tabs list to chosen file'
            OnClick = TBXItemFSesSaveAsClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemFSesClose: TSpTBXItem
            Caption = '&Close session'
            Hint = 'Clear name of current tabs list'
            OnClick = TBXItemFSesCloseClick
            OnSelect = ButtonOnSelect
          end
          object TBXSubmenuItemSess: TSpTBXSubmenuItem
            Caption = 'Recen&t sessions'
            OnPopup = TBXSubmenuItemSessPopup
            object TBXMRUListItem_Sess: TSpTBXMRUListItem
              HidePathExtension = False
              MaxItems = 10
              OnClick = MRU_SessClick
            end
            object TBXSeparatorItem59: TSpTBXSeparatorItem
            end
            object TBXItemSessClr: TSpTBXItem
              Caption = '&Clear list'
              OnClick = TBXItemSessClrClick
            end
          end
        end
        object TBXSeparatorItem29: TSpTBXSeparatorItem
        end
        object TBXItemFExit: TSpTBXItem
          Caption = 'E&xit'
          Hint = 'Close editor'
          OnClick = TBXItemFExitClick
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemEd: TSpTBXSubmenuItem
        Caption = '&Edit'
        OnPopup = TBXSubmenuItemEdPopup
        object TBXItemEUndo: TSpTBXItem
          Caption = '&Undo'
          Hint = 'Undo last action'
          ImageIndex = 12
          OnClick = TBXItemEUndoClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemERedo: TSpTBXItem
          Caption = '&Redo'
          Hint = 'Redo last undone action'
          ImageIndex = 13
          OnClick = TBXItemERedoClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem6: TSpTBXSeparatorItem
        end
        object TBXItemECut: TSpTBXItem
          Caption = '&Cut'
          Hint = 'Cut selection to clipboard'
          ImageIndex = 8
          OnClick = TBXItemECutClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemECopy: TSpTBXItem
          Caption = 'C&opy'
          Hint = 'Copy selection to clipboard'
          ImageIndex = 7
          OnClick = TBXItemECopyClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemEPaste: TSpTBXItem
          Caption = '&Paste'
          Hint = 'Paste clipboard'
          ImageIndex = 9
          OnClick = TBXItemEPasteClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemEDelete: TSpTBXItem
          Caption = '&Delete'
          Hint = 'Clear current selection'
          ImageIndex = 10
          OnClick = TBXItemEDeleteClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemESelectAll: TSpTBXItem
          Caption = '&Select all'
          Hint = 'Select all text'
          ImageIndex = 11
          OnClick = TBXItemESelectAllClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem35: TSpTBXSeparatorItem
        end
        object TBXSubmenuItemCopyOps: TSpTBXSubmenuItem
          Caption = 'Copy to clipboard'
          object TBXItemECopyLine: TSpTBXItem
            Caption = 'Copy current line'
            Hint = 'Copy current line to clipboard'
            OnClick = TBXItemECopyLineClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECutLine: TSpTBXItem
            Caption = 'Cut current line'
            Hint = 'Cut current line to clipboard'
            OnClick = TBXItemECutLineClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem54: TSpTBXSeparatorItem
          end
          object TBXItemECopyApp: TSpTBXItem
            Caption = 'Copy/Append'
            Hint = 'Copy selection and append to clipboard'
            OnClick = TBXItemECopyAppClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECutApp: TSpTBXItem
            Caption = 'Cut/Append'
            Hint = 'Cut selection and append to clipboard'
            OnClick = TBXItemECutAppClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem17: TSpTBXSeparatorItem
          end
          object TBXItemECpFN: TSpTBXItem
            Caption = 'Copy filename to clipboard'
            OnClick = TBXItemECpFNClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECpFullPath: TSpTBXItem
            Caption = 'Copy full path to clipboard'
            OnClick = TBXItemECpFullPathClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECpDirPath: TSpTBXItem
            Caption = 'Copy dir path to clipboard'
            OnClick = TBXItemECpDirPathClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemIndentOps: TSpTBXSubmenuItem
          Caption = 'Indents'
          object TBXItemEIndent: TSpTBXItem
            Caption = '&Indent'
            Hint = 'Indent selection'
            ImageIndex = 14
            OnClick = TBXItemEIndentClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEUnindent: TSpTBXItem
            Caption = 'Unind&ent'
            Hint = 'Unindent selection'
            ImageIndex = 15
            OnClick = TBXItemEUnindentClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem33: TSpTBXSeparatorItem
          end
          object TBXItemEIndentLike1st: TSpTBXItem
            Caption = 'Indent like 1st line'
            Hint = 'Make all selection lines indents equal to first line'#39's one'
            OnClick = TBXItemEIndentLike1stClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemLineOps: TSpTBXSubmenuItem
          Caption = 'Line operations'
          object TBXItemEDup: TSpTBXItem
            Caption = '&Duplicate line'
            Hint = 'Duplicate current line'
            OnClick = TBXItemEDupClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEDelLn: TSpTBXItem
            Caption = 'D&elete line'
            Hint = 'Delete current line'
            OnClick = TBXItemEDelLnClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem49: TSpTBXSeparatorItem
          end
          object TBXItemEJoin: TSpTBXItem
            Caption = '&Join lines'
            Hint = 'Join (concatenate) selected lines'
            OnClick = TBXItemEJoinClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemESplit: TSpTBXItem
            Caption = '&Split lines...'
            Hint = 'Split current line/ selected lines to shorter lines'
            OnClick = TBXItemESplitClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem47: TSpTBXSeparatorItem
          end
          object TBXItemEMoveUp: TSpTBXItem
            Caption = 'Move lines &up'
            Hint = 'Move selected line(s) up'
            OnClick = TBXItemEMoveUpClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEMoveDn: TSpTBXItem
            Caption = 'Move lines d&own'
            Hint = 'Move selected line(s) down'
            OnClick = TBXItemEMoveDnClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem94: TSpTBXSeparatorItem
          end
          object TBXItemEDedupAll: TSpTBXItem
            Caption = 'Remove all duplicates'
            OnClick = TBXItemEDedupAllClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEDedupAllOrig: TSpTBXItem
            Caption = 'Remove all duplicates+origins'
            OnClick = TBXItemEDedupAllOrigClick
          end
          object TBXItemEDedupAdjacent: TSpTBXItem
            Caption = 'Remove adjacent duplicates'
            OnClick = TBXItemEDedupAdjacentClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem7: TSpTBXSeparatorItem
          end
          object TBXItemEExtractDupCase: TSpTBXItem
            Caption = 'Extract duplicates (case-sensitive)'
            OnClick = TBXItemEExtractDupCaseClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEExtractDupNoCase: TSpTBXItem
            Caption = 'Extract duplicates (case-insensitive)'
            OnClick = TBXItemEExtractDupNoCaseClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEExtractUniq: TSpTBXItem
            Caption = 'Extract unique lines'
            OnClick = TBXItemEExtractUniqClick
          end
          object TBXSeparatorItem68: TSpTBXSeparatorItem
          end
          object TBXItemEReverse: TSpTBXItem
            Caption = 'Reverse lines'
            OnClick = TBXItemEReverseClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEShuffle: TSpTBXItem
            Caption = 'Shuffle lines'
            OnClick = TBXItemEShuffleClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemBlankOps: TSpTBXSubmenuItem
          Caption = 'Blank operations'
          object TBXItemERemBlanks: TSpTBXItem
            Caption = '&Remove blank lines'
            Hint = 'Remove blank lines (from selection or all document)'
            OnClick = TBXItemERemBlanksClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEReduceBlanks: TSpTBXItem
            Caption = 'Reduce &blank lines'
            Hint = 'Remove adjacent duplicate blank lines'
            OnClick = TBXItemEReduceBlanksClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem60: TSpTBXSeparatorItem
          end
          object TBXItemETrimLead: TSpTBXItem
            Caption = 'Trim &leading spaces'
            Hint = 'Remove leading spaces from lines'
            OnClick = TBXItemETrimLeadClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemETrimTrail: TSpTBXItem
            Caption = 'Trim &trailing spaces'
            Hint = 'Remove trailing spaces from lines'
            OnClick = TBXItemETrimTrailClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemETrimAll: TSpTBXItem
            Caption = 'Trim leading/trailing &spaces'
            Hint = 'Remove leading+trailing spaces from lines'
            OnClick = TBXItemETrimAllClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemERemDupSp: TSpTBXItem
            Caption = 'Remove &duplicate spaces'
            Hint = 'Remove duplicate (adjacent) spaces from lines'
            OnClick = TBXItemERemDupSpClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem61: TSpTBXSeparatorItem
          end
          object TBXItemETabToSp: TSpTBXItem
            Caption = 'T&abs to spaces'
            Hint = 'Replace Tab characters to spaces'
            OnClick = TBXItemETabToSpClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemESpToTab: TSpTBXItem
            Caption = 'Spac&es to tabs (all)'
            Hint = 'Replace spaces to Tab characters'
            OnClick = TBXItemESpToTabClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemESpToTabLead: TSpTBXItem
            Caption = 'Spaces to tabs (leading)'
            Hint = 'Replace leading spaces to Tab characters'
            OnClick = TBXItemESpToTabLeadClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem83: TSpTBXSeparatorItem
          end
          object TBXItemECenterLines: TSpTBXItem
            Caption = 'Center lines'
            Hint = 'Center selected lines by right margin position'
            OnClick = TBXItemECenterLinesClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEAlignWithSep: TSpTBXItem
            Caption = 'Align by separator...'
            Hint = 'Align two columns, separated by some substring'
            OnClick = TBXItemEAlignWithSepClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemCommentOps: TSpTBXSubmenuItem
          Caption = 'Comments'
          object TBXItemEToggleLineComment: TSpTBXItem
            Caption = 'Toggle &block comment'
            Hint = 'Toggle line comment for selected lines'
            OnClick = TBXItemEToggleLineCommentClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEToggleLineCommentAlt: TSpTBXItem
            Caption = 'Toggle block comment (alt.)'
            Hint = 
              'Toggle line comment (comment chars placed on 1st non-space posit' +
              'ion)'
            OnClick = TBXItemEToggleLineCommentAltClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEComm: TSpTBXItem
            Caption = 'Block &comment'
            Hint = 'Comment selected lines'
            ImageIndex = 21
            OnClick = TBXItemECommClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEUncomm: TSpTBXItem
            Caption = 'Block &uncomment'
            Hint = 'Uncomment selected lines'
            ImageIndex = 22
            OnClick = TBXItemEUncommClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemEToggleStreamComment: TSpTBXItem
            Caption = 'Toggle &stream comment'
            Hint = 'Toggle stream comment for selected lines'
            OnClick = TBXItemEToggleStreamCommentClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemSortOps: TSpTBXSubmenuItem
          Caption = 'Sorting'
          ImageIndex = 16
          Options = [tboDropdownArrow]
          OnSelect = ButtonOnSelect
          object TBXItemESortDialog: TSpTBXItem
            Caption = '&Sort dialog...'
            Hint = 'Dialog "Sort lines"'
            OnClick = TBXItemESortDialogClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem95: TSpTBXSeparatorItem
          end
          object TBXItemESortAsc: TSpTBXItem
            Tag = 562
            Caption = 'Sort &ascending'
            Hint = 'Sort selection ascending'
            ImageIndex = 16
            OnClick = TBXItemESortAscClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemESortDesc: TSpTBXItem
            Tag = 563
            Caption = 'Sort &descending'
            Hint = 'Sort selection descending'
            ImageIndex = 17
            OnClick = TBXItemESortDescClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemCaseOps: TSpTBXSubmenuItem
          Caption = 'Change case'
          ImageIndex = 18
          Options = [tboDropdownArrow]
          OnSelect = ButtonOnSelect
          object TBXItemECaseUpper: TSpTBXItem
            Tag = 365
            Caption = '&UPPER CASE'
            Hint = 'Selection - to upper case'
            ImageIndex = 20
            OnClick = TBXItemECaseUpperClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseLower: TSpTBXItem
            Tag = 366
            Caption = '&lower case'
            Hint = 'Selection - to lower case'
            ImageIndex = 19
            OnClick = TBXItemECaseLowerClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseTitle: TSpTBXItem
            Tag = 368
            Caption = '&Title Case'
            Hint = 'Selection - to title case'
            ImageIndex = 18
            OnClick = TBXItemECaseTitleClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseInvert: TSpTBXItem
            Tag = 365
            Caption = '&iNVERT cASE'
            Hint = 'Invert selection case'
            OnClick = TBXItemECaseInvertClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseSent: TSpTBXItem
            Tag = 369
            Caption = 'Sentence case'
            Hint = 'Selection - to sentence case'
            OnClick = TBXItemECaseSentClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseRandom: TSpTBXItem
            Caption = 'RanDoM case'
            Hint = 'Selection - to random case'
            OnClick = TBXItemECaseRandomClick
            OnSelect = ButtonOnSelect
          end
        end
        object TbxSubmenuItemCaretsOps: TSpTBXSubmenuItem
          Caption = 'Multi-carets'
          object TBXItemCaretsRemove1: TSpTBXItem
            Caption = 'Remove carets, leave first'
            OnClick = TBXItemCaretsRemove1Click
          end
          object TBXItemCaretsRemove2: TSpTBXItem
            Caption = 'Remove carets, leave last'
            OnClick = TBXItemCaretsRemove2Click
          end
          object TBXSeparatorItem91: TSpTBXSeparatorItem
          end
          object TBXItemCaretsFromSelLeft: TSpTBXItem
            Caption = 'Carets from selection, left edge'
            OnClick = TBXItemCaretsFromSelLeftClick
          end
          object TBXItemCaretsFromSelRight: TSpTBXItem
            Caption = 'Carets from selection, right edge'
            OnClick = TBXItemCaretsFromSelRightClick
          end
          object TBXItemCaretsFromSelClear: TSpTBXItem
            Caption = 'Carets from selection, delete selection'
            OnClick = TBXItemCaretsFromSelClearClick
          end
          object TBXSeparatorItem93: TSpTBXSeparatorItem
          end
          object TBXItemCaretsFromMarksLeft: TSpTBXItem
            Caption = 'Carets from search marks, left edge'
            OnClick = TBXItemCaretsFromMarksLeftClick
          end
          object TBXItemCaretsFromMarksRight: TSpTBXItem
            Caption = 'Carets from search marks, right edge'
            OnClick = TBXItemCaretsFromMarksRightClick
          end
          object TBXItemCaretsFromMarksClear: TSpTBXItem
            Caption = 'Carets from search marks, delete marks'
            OnClick = TBXItemCaretsFromMarksClearClick
          end
          object TBXSeparatorItem92: TSpTBXSeparatorItem
          end
          object TBXItemCaretsExtUpLine: TSpTBXItem
            Caption = 'Extend carets up 1 line'
            OnClick = TBXItemCaretsExtUpLineClick
          end
          object TBXItemCaretsExtDownLine: TSpTBXItem
            Caption = 'Extend carets down 1 line'
            OnClick = TBXItemCaretsExtDownLineClick
          end
          object TBXItemCaretsExtUpPage: TSpTBXItem
            Caption = 'Extend carets up 1 page'
            OnClick = TBXItemCaretsExtUpPageClick
          end
          object TBXItemCaretsExtDownPage: TSpTBXItem
            Caption = 'Extend carets down 1 page'
            OnClick = TBXItemCaretsExtDownPageClick
          end
          object TBXItemCaretsExtUpEnd: TSpTBXItem
            Caption = 'Extend carets up till beginning'
            OnClick = TBXItemCaretsExtUpEndClick
          end
          object TBXItemCaretsExtDownEnd: TSpTBXItem
            Caption = 'Extend carets down till end'
            OnClick = TBXItemCaretsExtDownEndClick
          end
        end
        object TBXSeparatorItem39: TSpTBXSeparatorItem
        end
        object TBXItemETable: TSpTBXItem
          Caption = 'Insert character'
          Hint = 'Dialog "Character Table"'
          OnClick = TBXItemETableClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemEInsText: TSpTBXItem
          Caption = 'Insert text...'
          Hint = 'Dialog "Insert text"'
          OnClick = TBXItemEInsTextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemETime: TSpTBXItem
          Caption = 'Insert date/time'
          Hint = 'Insert current date/time into text'
          OnClick = TBXItemETimeClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem71: TSpTBXSeparatorItem
        end
        object TBXItemEColumn: TSpTBXItem
          Caption = 'Edit column'
          Hint = 'Edit all lines of column selection at once'
          OnClick = TBXItemEColumnClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemEFillBlock: TSpTBXItem
          Caption = 'Fill block...'
          Hint = 'Fill column block lines with custom string'
          Visible = False
          OnClick = TBXItemEFillBlockClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemESyncEd: TSpTBXItem
          Caption = 'Toggle S&yncEditing'
          Hint = 'Start/cancel Synchronized Editing mode'
          OnClick = TBXItemESyncEdClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemERepeatCmd: TSpTBXItem
          Caption = 'Repeat last edit command'
          Hint = 'Repeat last command which edits text'
          Action = ecRepeatCmd
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemSr: TSpTBXSubmenuItem
        Caption = '&Search'
        object TBXItemSFind: TSpTBXItem
          Caption = '&Find...'
          Hint = 'Dialog "Find"'
          Action = ecFind
          OnSelect = ButtonOnSelect
        end
        object TBXItemSNext: TSpTBXItem
          Caption = 'Find &next'
          Hint = 'Find next occurance of search string'
          OnClick = TBXItemBarFNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSPrev: TSpTBXItem
          Caption = 'Find &previous'
          Hint = 'Find previous occurance of search string'
          OnClick = TBXItemBarFPrevClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemQs: TSpTBXItem
          Caption = '&Quick search'
          Hint = 'Show "Quick Search" panel'
          OnClick = TBXItemQsClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSRep: TSpTBXItem
          Caption = '&Replace...'
          Hint = 'Dialog "Replace"'
          Action = ecReplace
          OnSelect = ButtonOnSelect
        end
        object TBXItemSRepInFiles: TSpTBXItem
          Caption = 'Find/Replace in fil&es...'
          Hint = 'Dialog "Find/Replace in files"'
          Action = ecReplaceInFiles
          OnSelect = ButtonOnSelect
        end
        object TbxItemSRepInProject: TSpTBXItem
          Caption = 'Find/Replace in project...'
          Hint = 'Dialog "Find/Replace in project files"'
          Action = ecReplaceInProject
          OnSelect = ButtonOnSelect
        end
        object TBXItemEExtr: TSpTBXItem
          Caption = 'E&xtract strings...'
          Hint = 'Dialog "Extract strings"'
          OnClick = TBXItemEExtrClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem19: TSpTBXSeparatorItem
        end
        object TBXItemSWordNext: TSpTBXItem
          Caption = 'Find current &word next'
          Hint = 'Find next occurance of word at caret'
          OnClick = TBXItemBarWordNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSWordPrior: TSpTBXItem
          Caption = 'Find current w&ord prior'
          Hint = 'Find previous occurance of word at caret'
          OnClick = TBXItemBarWordPrevClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem20: TSpTBXSeparatorItem
        end
        object TBXItemSMarkAll: TSpTBXItem
          Caption = '&Mark all occurrences'
          Hint = 'Mark all occurrences of search string (place search marks)'
          OnClick = TBXItemSMarkAllClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSMarkNext: TSpTBXItem
          Caption = 'Ne&xt search mark'
          Hint = 'Go to next search mark'
          OnClick = TBXItemSMarkNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSMarkPrev: TSpTBXItem
          Caption = 'Previous &search mark'
          Hint = 'Go to previous search mark'
          OnClick = TBXItemSMarkPrevClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSMarkClear: TSpTBXItem
          Caption = '&Clear search marks'
          Hint = 'Clear search marks, which were left by "Find all" command'
          OnClick = TBXItemBarMarksClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem40: TSpTBXSeparatorItem
        end
        object TBXItemSResNext: TSpTBXItem
          Caption = 'Next mass search result'
          Hint = 'Open next result of "Find in files" operation'
          Action = ecGotoNextFindResult
          OnSelect = ButtonOnSelect
        end
        object TBXItemSResPrev: TSpTBXItem
          Caption = 'Previous mass search result'
          Hint = 'Open previous result of "Find in files" operation'
          Action = ecGotoPrevFindResult
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem21: TSpTBXSeparatorItem
        end
        object TBXItemSSelToken: TSpTBXItem
          Caption = 'Select token'
          Hint = 'Select entire token at current caret position'
          OnClick = TBXItemSSelTokenClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSSelBrackets: TSpTBXItem
          Caption = 'Select brackets'
          Hint = 'Select the range from the current bracket to matching one'
          OnClick = TBXItemSSelBracketsClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSSelExtend: TSpTBXItem
          Caption = 'Extend selection'
          Hint = 'Select nearest outer syntax range'
          OnClick = TBXItemSSelExtendClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSGoBracket: TSpTBXItem
          Caption = 'Go to matching bracket'
          Hint = 'Go to bracket, which matches the bracket under caret'
          OnClick = TBXItemSGoBracketClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSGoto: TSpTBXItem
          Caption = '&Go to line...'
          Hint = 'Dialog "Go to"'
          Action = ecGoto
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemEnc: TSpTBXSubmenuItem
        Caption = 'E&ncoding'
        object TBXSubmenuEnc: TSpTBXSubmenuItem
          Caption = '&Change encoding'
          Hint = 'Reload file in other encoding or change current encoding'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuEncPopup
        end
        object TBXSubmenuEnc2: TSpTBXSubmenuItem
          Caption = 'Con&vert encoding to'
          Hint = 'Change current encoding w/o reloading the file'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuEnc2Popup
        end
        object SpTBXSeparatorItem22: TSpTBXSeparatorItem
        end
        object TBXSubmenuLineEnds: TSpTBXSubmenuItem
          Caption = 'Change &line endings'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuLineEndsPopup
          object TBXItemEndMWin: TSpTBXItem
            Tag = 1
            Caption = '&Windows (CR LF)'
            Checked = True
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
          end
          object TBXItemEndMUn: TSpTBXItem
            Tag = 3
            Caption = '&Unix (LF)'
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
          end
          object TBXItemEndMMac: TSpTBXItem
            Tag = 2
            Caption = '&Mac (CR)'
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
          end
        end
      end
      object TBXSubmenuItemBk: TSpTBXSubmenuItem
        Caption = '&Bookmarks'
        OnPopup = TBXSubmenuItemBkPopup
        object TBXSubmenuItemBkSet: TSpTBXSubmenuItem
          Caption = '&Set numbered bookmark'
          Hint = 'Set numbered (0-9) bookmark for current line'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuItemBkSetPopup
          object TBXItemG0: TSpTBXItem
            Caption = '0'
            OnClick = bbg0Click
          end
          object TBXItemG1: TSpTBXItem
            Tag = 1
            Caption = '1'
            OnClick = bbg0Click
          end
          object TBXItemG2: TSpTBXItem
            Tag = 2
            Caption = '2'
            OnClick = bbg0Click
          end
          object TBXItemG3: TSpTBXItem
            Tag = 3
            Caption = '3'
            OnClick = bbg0Click
          end
          object TBXItemG4: TSpTBXItem
            Tag = 4
            Caption = '4'
            OnClick = bbg0Click
          end
          object TBXItemG5: TSpTBXItem
            Tag = 5
            Caption = '5'
            OnClick = bbg0Click
          end
          object TBXItemG6: TSpTBXItem
            Tag = 6
            Caption = '6'
            OnClick = bbg0Click
          end
          object TBXItemG7: TSpTBXItem
            Tag = 7
            Caption = '7'
            OnClick = bbg0Click
          end
          object TBXItemG8: TSpTBXItem
            Tag = 8
            Caption = '8'
            OnClick = bbg0Click
          end
          object TBXItemG9: TSpTBXItem
            Tag = 9
            Caption = '9'
            OnClick = bbg0Click
          end
        end
        object TBXSubmenuItemBkGoto: TSpTBXSubmenuItem
          Caption = '&Go to numbered bookmark'
          Hint = 'Go to any numbered bookmark'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuItemBkGotoPopup
          object TBXItemB0: TSpTBXItem
            Caption = '0'
            OnClick = bBk0Click
          end
          object TBXItemB1: TSpTBXItem
            Tag = 1
            Caption = '1'
            OnClick = bBk0Click
          end
          object TBXItemB2: TSpTBXItem
            Tag = 2
            Caption = '2'
            OnClick = bBk0Click
          end
          object TBXItemB3: TSpTBXItem
            Tag = 3
            Caption = '3'
            OnClick = bBk0Click
          end
          object TBXItemB4: TSpTBXItem
            Tag = 4
            Caption = '4'
            OnClick = bBk0Click
          end
          object TBXItemB5: TSpTBXItem
            Tag = 5
            Caption = '5'
            OnClick = bBk0Click
          end
          object TBXItemB6: TSpTBXItem
            Tag = 6
            Caption = '6'
            OnClick = bBk0Click
          end
          object TBXItemB7: TSpTBXItem
            Tag = 7
            Caption = '7'
            OnClick = bBk0Click
          end
          object TBXItemB8: TSpTBXItem
            Tag = 8
            Caption = '8'
            OnClick = bBk0Click
          end
          object TBXItemB9: TSpTBXItem
            Tag = 9
            Caption = '9'
            OnClick = bBk0Click
          end
        end
        object TBXItemBkToggle: TSpTBXItem
          Caption = '&Toggle bookmark'
          Hint = 'Toggle bookmark for current line'
          Action = ecBkToggle
          OnSelect = ButtonOnSelect
        end
        object TBXItemBkClear: TSpTBXItem
          Caption = '&Clear all bookmarks'
          Hint = 'Remove all bookmarks in current file'
          Action = ecBkClearAll
          OnSelect = ButtonOnSelect
        end
        object TBXItemBkInverse: TSpTBXItem
          Caption = '&Inverse bookmarks'
          Hint = 'Toggle bookmarks for all lines in file'
          Action = ecBkInverse
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuBkOps: TSpTBXSubmenuItem
          Caption = 'Bookmark operations'
          object TBXItemBkCopy: TSpTBXItem
            Caption = 'Copy bookmarked lines'
            Hint = 'Copy bookmarked lines to clipboard'
            Action = ecBkCopy
            OnSelect = ButtonOnSelect
          end
          object TBXItemBkCut: TSpTBXItem
            Caption = 'Cut bookmarked lines'
            Hint = 'Cut bookmarked lines to clipboard'
            Action = ecBkCut
            OnSelect = ButtonOnSelect
          end
          object TBXItemBkPaste: TSpTBXItem
            Caption = 'Paste into bookmarked lines'
            Hint = 'Paste from clipboard and replace bookmarked lines'
            Action = ecBkPaste
            OnSelect = ButtonOnSelect
          end
          object TBXItemBkDel: TSpTBXItem
            Caption = 'Delete bookmarked lines'
            Hint = 'Delete bookmarked lines from file'
            Action = ecBkDelete
            OnSelect = ButtonOnSelect
          end
          object TBXItemBkDelUnmk: TSpTBXItem
            Caption = 'Delete unmarked lines'
            Hint = 'Delete non-bookmarked lines from file'
            Action = ecBkDeleteUnmk
            OnSelect = ButtonOnSelect
          end
        end
        object SpTBXSeparatorItem16: TSpTBXSeparatorItem
        end
        object TBXItemBkNext: TSpTBXItem
          Caption = '&Next bookmark'
          Hint = 'Go to next bookmark'
          Action = ecBkNext
          OnSelect = ButtonOnSelect
        end
        object TBXItemBkPrev: TSpTBXItem
          Caption = '&Previous bookmark'
          Hint = 'Go to previous bookmark'
          Action = ecBkPrev
          OnSelect = ButtonOnSelect
        end
        object TBXItemBkGoto: TSpTBXItem
          Caption = 'Go to bookmark...'
          Hint = 'Dialog "Go to bookmark"'
          OnClick = TBXItemBkGotoClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem78: TSpTBXSeparatorItem
        end
        object TBXSubmenuBkPortable: TSpTBXSubmenuItem
          Caption = 'Portable bookmarks'
          object TBXItemBkDropPortable: TSpTBXItem
            Caption = 'Drop portable bookmark'
            Hint = 'Add so called "portable bookmark" on current line'
            OnClick = TBXItemBkDropPortableClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemBkGotoPortable: TSpTBXItem
            Caption = 'Go to portable bookmark...'
            Hint = 'Dialog "Go to portable bookmark"'
            Action = ecGotoPortableBk
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuMarkers: TSpTBXSubmenuItem
          Caption = 'Markers'
          object TBXItemMarkDrop: TSpTBXItem
            Caption = '&Drop marker'
            Hint = 'Drop marker to current file position'
            OnClick = TBXItemMarkDropClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemMarkColl: TSpTBXItem
            Caption = 'C&ollect marker'
            Hint = 'Remove last marker'
            OnClick = TBXItemMarkCollClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemMarkSwap: TSpTBXItem
            Caption = '&Swap marker'
            Hint = 'Swap last marker and current file position'
            OnClick = TBXItemMarkSwapClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemMarkGoLast: TSpTBXItem
            Caption = 'Go to last marker'
            Hint = 'Go to last marker, don'#39't delete it'
            OnClick = TBXItemMarkGoLastClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemMarkClear: TSpTBXItem
            Caption = 'Clear markers'
            Hint = 'Clear all markers in current file'
            OnClick = TBXItemMarkClearClick
            OnSelect = ButtonOnSelect
          end
        end
      end
      object TBXSubmenuItemRun: TSpTBXSubmenuItem
        Caption = '&Tools'
        OnPopup = TBXSubmenuItemRunPopup
        object TBXItemTool1: TSpTBXItem
          Caption = '-'
          OnClick = TbxItemTool1Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool2: TSpTBXItem
          Caption = '-'
          OnClick = TbxItemTool2Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool3: TSpTBXItem
          Caption = '-'
          OnClick = TbxItemTool3Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool4: TSpTBXItem
          Caption = '-'
          OnClick = TbxItemTool4Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool5: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool5Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool6: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool6Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool7: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool7Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool8: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool8Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool9: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool9Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool10: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool10Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool11: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool11Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool12: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool12Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool13: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool13Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool14: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool14Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool15: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool15Click
          OnSelect = ButtonOnSelect
        end
        object TBXItemTool16: TSpTBXItem
          Caption = '-'
          OnClick = TBXItemTool16Click
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem31: TSpTBXSeparatorItem
        end
        object TBXItemOTools: TSpTBXItem
          Caption = '&Customize external tools...'
          Hint = 'Customize additional tools'
          OnClick = TBXItemOToolsClick
          OnSelect = ButtonOnSelect
        end
        object SpTBXSeparatorItem19: TSpTBXSeparatorItem
        end
        object TBXItemRunOpenFile: TSpTBXItem
          Caption = 'O&pen current file'
          Hint = 'Launch current file using Windows Explorer association'
          OnClick = TBXItemRunOpenFileClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemRunOpenDir: TSpTBXItem
          Caption = '&Open containing folder'
          Hint = 'Open folder containing the current file'
          OnClick = TBXItemRunOpenDirClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemRunNumConv: TSpTBXItem
          Caption = 'Numeric converter...'
          Hint = 'Dialog "Numeric converter"'
          OnClick = TBXItemRunNumConvClick
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemConv: TSpTBXSubmenuItem
          Caption = 'Text converters'
          OnPopup = TBXSubmenuItemConvPopup
        end
        object TbxSubmenuItemProjTools: TSpTBXSubmenuItem
          Caption = 'Project tools'
        end
        object SpTBXSeparatorItem26: TSpTBXSeparatorItem
        end
        object TbxItemRunNewSnippet: TSpTBXItem
          Caption = 'New snippet...'
          Hint = 'Dialog "New snippet"'
          OnClick = TbxItemRunNewSnippetClick
          OnSelect = ButtonOnSelect
        end
        object TbxItemRunSnippets: TSpTBXItem
          Caption = 'Snippets...'
          Hint = 'Dialog "Snippets list"'
          OnClick = TbxItemRunSnippetsClick
          OnSelect = ButtonOnSelect
        end
        object SpTBXSeparatorItem25: TSpTBXSeparatorItem
        end
        object TbxItemRunNewPlugin: TSpTBXItem
          Caption = 'New plugin...'
          Hint = 'Dialog "New Python plugin"'
          OnClick = TbxItemRunNewPluginClick
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemPlugins: TSpTBXSubmenuItem
          Caption = 'Plugins'
          Enabled = False
        end
      end
      object TBXSubmenuItemHTML: TSpTBXSubmenuItem
        Caption = '&HTML'
        object TBXSubmenuItemHtmlEncode: TSpTBXSubmenuItem
          Caption = 'Encode HTML chars'
          object TBXItemEncodeHtmlAll: TSpTBXItem
            Caption = 'all entities'
            OnClick = TBXItemEncodeHtmlAllClick
          end
          object TBXItemEncodeHtmlNoBrackets: TSpTBXItem
            Caption = 'all except < > "  '#39
            OnClick = TBXItemEncodeHtmlNoBracketsClick
          end
        end
        object TBXItemHtmlPreview: TSpTBXItem
          Caption = '&Preview HTML code'
          Hint = 'Preview selected HTML code in default browser'
          OnClick = TBXItemHtmlPreviewClick
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemEmmet: TSpTBXSubmenuItem
          Caption = 'Emmet'
          object TBXItemHtmlEmmetExpand: TSpTBXItem
            Caption = 'Emmet - Expand abbreviation'
            OnClick = TBXItemHtmlEmmetExpandClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemHtmlEmmetWrap: TSpTBXItem
            Caption = 'Emmet - Wrap with abbreviation...'
            OnClick = TBXItemHtmlEmmetWrapClick
            OnSelect = ButtonOnSelect
          end
          object SpTBXSeparatorItem17: TSpTBXSeparatorItem
          end
          object TBXItemHtmlEmmetHelp: TSpTBXItem
            Caption = 'Emmet - Cheat-sheet'
            OnClick = TBXItemHtmlEmmetHelpClick
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSubmenuItemTidy: TSpTBXSubmenuItem
          Caption = '&HTML Tidy'
          OnPopup = TBXSubmenuItemTidyPopup
          object TBXItemTidyVal: TSpTBXItem
            Caption = 'Validate document'
            Hint = 'Validate current file using HTML Tidy tool'
            OnClick = TBXItemTidyValClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemTidyCfg: TSpTBXItem
            Caption = 'Configure'
            Hint = 'Edit HTML Tidy configurations file'
            OnClick = TBXItemTidyCfgClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem55: TSpTBXSeparatorItem
          end
        end
        object TBXSubmenuHtmlHelp: TSpTBXSubmenuItem
          Caption = 'Online help'
          object TBXItemRunFindPhp: TSpTBXItem
            Caption = 'PHP.net'
            OnClick = TBXItemRunFindPhpClick
            OnSelect = ButtonOnSelect
          end
          object TbxItemRunFindHtml4: TSpTBXItem
            Caption = 'HTML4 tag'
            OnClick = TbxItemRunFindHtml4Click
            OnSelect = ButtonOnSelect
          end
          object TbxItemRunFindHtml5: TSpTBXItem
            Caption = 'HTML5 tag'
            OnClick = TbxItemRunFindHtml5Click
            OnSelect = ButtonOnSelect
          end
        end
        object TBXSeparatorItem52: TSpTBXSeparatorItem
        end
        object TBXItemHtmlInsColor: TSpTBXItem
          Caption = 'Insert color...'
          Hint = 'Dialog "Color picker"'
          Action = ecInsertColor
          OnSelect = ButtonOnSelect
        end
        object TBXItemHtmlInsImage: TSpTBXItem
          Caption = 'Insert image tag...'
          Hint = 'Show file dialog for inserting <img> tag'
          Action = ecInsertImage
          OnSelect = ButtonOnSelect
        end
        object TBXItemHtmlLoremIpsum: TSpTBXItem
          Caption = 'Lorem Ipsum generator...'
          Hint = 'Dialog "Lorem Ipsum generator"'
          OnClick = TBXItemHtmlLoremIpsumClick
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemMacros: TSpTBXSubmenuItem
        Caption = '&Macros'
        OnPopup = TBXSubmenuItemMacrosPopup
        object TBXItemMacroRecord: TSpTBXItem
          Caption = 'Start &recording'
          Hint = 'Record a new macro'
          Action = acMacroRecord
          OnSelect = ButtonOnSelect
        end
        object TBXItemMacroStop: TSpTBXItem
          Caption = '&Stop recording'
          Hint = 'Stop current macro recording'
          Action = acMacroStop
          OnSelect = ButtonOnSelect
        end
        object TBXItemMacroCancel: TSpTBXItem
          Caption = '&Cancel recording'
          Hint = 'Cancel currently recorded macro'
          Action = acMacroCancel
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem51: TSpTBXSeparatorItem
        end
        object TBXItemMacro1: TSpTBXItem
          OnClick = TBXItemMacro1Click
        end
        object TBXItemMacro2: TSpTBXItem
          OnClick = TBXItemMacro2Click
        end
        object TBXItemMacro3: TSpTBXItem
          OnClick = TBXItemMacro3Click
        end
        object TBXItemMacro4: TSpTBXItem
          OnClick = TBXItemMacro4Click
        end
        object TBXItemMacro5: TSpTBXItem
          OnClick = TBXItemMacro5Click
        end
        object TBXItemMacro6: TSpTBXItem
          OnClick = TBXItemMacro6Click
        end
        object TBXItemMacro7: TSpTBXItem
          OnClick = TBXItemMacro7Click
        end
        object TBXItemMacro8: TSpTBXItem
          OnClick = TBXItemMacro8Click
        end
        object TBXItemMacro9: TSpTBXItem
          OnClick = TBXItemMacro9Click
        end
        object TBXItemMacro10: TSpTBXItem
          OnClick = TBXItemMacro10Click
        end
        object TBXItemMacro11: TSpTBXItem
          OnClick = TBXItemMacro11Click
        end
        object TBXItemMacro12: TSpTBXItem
          OnClick = TBXItemMacro12Click
        end
        object TBXItemMacro13: TSpTBXItem
          OnClick = TBXItemMacro13Click
        end
        object TBXItemMacro14: TSpTBXItem
          OnClick = TBXItemMacro14Click
        end
        object TBXItemMacro15: TSpTBXItem
          OnClick = TBXItemMacro15Click
        end
        object TBXItemMacro16: TSpTBXItem
          OnClick = TBXItemMacro16Click
        end
        object TBXItemMacro17: TSpTBXItem
          OnClick = TBXItemMacro17Click
        end
        object TBXItemMacro18: TSpTBXItem
          OnClick = TBXItemMacro18Click
        end
        object TBXItemMacro19: TSpTBXItem
          OnClick = TBXItemMacro19Click
        end
        object TBXItemMacro20: TSpTBXItem
          OnClick = TBXItemMacro20Click
        end
        object TBXItemMacro21: TSpTBXItem
          OnClick = TBXItemMacro21Click
        end
        object TBXItemMacro22: TSpTBXItem
          OnClick = TBXItemMacro22Click
        end
        object TBXItemMacro23: TSpTBXItem
          OnClick = TBXItemMacro23Click
        end
        object TBXItemMacro24: TSpTBXItem
          OnClick = TBXItemMacro24Click
        end
        object TBXItemMacro25: TSpTBXItem
          OnClick = TBXItemMacro25Click
        end
        object TBXItemMacro26: TSpTBXItem
          OnClick = TBXItemMacro26Click
        end
        object TBXItemMacro27: TSpTBXItem
          OnClick = TBXItemMacro27Click
        end
        object TBXItemMacro28: TSpTBXItem
          OnClick = TBXItemMacro28Click
        end
        object TBXItemMacro29: TSpTBXItem
          OnClick = TBXItemMacro29Click
        end
        object TBXItemMacro30: TSpTBXItem
          OnClick = TBXItemMacro30Click
        end
        object TBXSeparatorItem62: TSpTBXSeparatorItem
        end
        object TBXItemMacroPlay: TSpTBXItem
          Caption = '&Play last macro'
          Hint = 'Play last macro'
          Action = acMacroPlay
          OnSelect = ButtonOnSelect
        end
        object TBXItemMacroRepeat: TSpTBXItem
          Caption = 'Play last played macro'
          Hint = 'Repeat last played macro'
          Action = acMacroRepeat
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem53: TSpTBXSeparatorItem
        end
        object TBXItemMacroDlg: TSpTBXItem
          Caption = 'R&un/customize macros...'
          Hint = 'Dialog "Run/customize macros"'
          Action = acMacroDialog
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemOpt: TSpTBXSubmenuItem
        Caption = '&Options'
        object TBXItemOSetup: TSpTBXItem
          Caption = '&Customize...'
          Hint = 'Dialog "Options"'
          Action = acSetup
          OnSelect = ButtonOnSelect
        end
        object TBXItemOShell: TSpTBXItem
          Caption = 'E&xplorer integration...'
          Hint = 'Customize integration with Windows Explorer'
          OnClick = TBXItemOShellClick
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuToolbars: TSpTBXSubmenuItem
          Caption = 'Customize toolbars'
          object TBXItemOToolbar1: TSpTBXItem
            Caption = '1'
            OnClick = TBXItemOToolbar1Click
          end
          object TBXItemOToolbar2: TSpTBXItem
            Caption = '2'
            OnClick = TBXItemOToolbar2Click
          end
          object TBXItemOToolbar3: TSpTBXItem
            Caption = '3'
            OnClick = TBXItemOToolbar3Click
          end
        end
        object TBXSeparatorItem38: TSpTBXSeparatorItem
        end
        object TBXItemOLexer: TSpTBXItem
          Caption = 'Customize le&xer...'
          Hint = 'Show dialog "Lexer properties"'
          Action = acSetupLexerNew
          OnSelect = ButtonOnSelect
        end
        object TBXItemOLexerHi: TSpTBXItem
          Caption = 'Customize lexer &styles...'
          Hint = 'Show dialog "Lexer styles"'
          Action = acSetupLexerStyles
          OnSelect = ButtonOnSelect
        end
        object TBXItemOLexerLib: TSpTBXItem
          Caption = 'Customize &lexers library...'
          Hint = 'Show dialog "Lexer library"'
          Action = acSetupLexerLib
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem24: TSpTBXSeparatorItem
        end
        object TBXSubmenuItem10: TSpTBXSubmenuItem
          Caption = '&Advanced'
          object TBXItemOHideItems: TSpTBXItem
            Caption = 'Hide menu items...'
            Hint = 'Check menu items, which you want to hide in menus'
            OnClick = TBXItemOHideItemsClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem100: TSpTBXSeparatorItem
          end
          object TBXItemORestoreStyles: TSpTBXItem
            Caption = 'Restore lexer styles...'
            Hint = 'Restore auto-backuped lexers styles'
            OnClick = TBXItemORestoreStylesClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem84: TSpTBXSeparatorItem
          end
          object TBXItemOEditSynIni: TSpTBXItem
            Caption = 'Edit file Syn.ini'
            Hint = 'Edit file "Syn.ini", main SynWrite configuration file'
            OnClick = TBXItemOEditSynIniClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemOEditSynPluginsIni: TSpTBXItem
            Caption = 'Edit file SynPlugins.ini'
            Hint = 'Edit file "SynPlugins.ini", to customize plugins registration'
            OnClick = TBXItemOEditSynPluginsIniClick
            OnSelect = ButtonOnSelect
          end
        end
      end
      object TBXSubmenuItemView: TSpTBXSubmenuItem
        Caption = '&View'
        object TBXSubmenuItemToolbars: TSpTBXSubmenuItem
          Caption = 'Tool&bars'
          OnSelect = ButtonOnSelect
          OnPopup = TBXSubmenuItemToolbarsPopup
          object TBXItemTFile: TSpTBXItem
            Caption = 'File'
            Hint = 'Toggle File toolbar'
            OnClick = TBXItemTFileClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemTEdit: TSpTBXItem
            Caption = 'Edit'
            Hint = 'Toggle Edit toolbar'
            OnClick = TBXItemTEditClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemTView: TSpTBXItem
            Caption = 'View'
            Hint = 'Toggle View toolbar'
            OnClick = TBXItemTViewClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemTQs: TSpTBXItem
            Caption = 'Quick search'
            Hint = 'Toggle Quick Search toolbar'
            OnClick = TBXItemTQsClick
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem97: TSpTBXSeparatorItem
          end
          object TBXItemTUser1: TSpTBXItem
            Caption = '1'
            OnClick = TBXItemTUser1Click
          end
          object TBXItemTUser2: TSpTBXItem
            Caption = '2'
            OnClick = TBXItemTUser2Click
          end
          object TBXItemTUser3: TSpTBXItem
            Caption = '3'
            OnClick = TBXItemTUser3Click
          end
        end
        object TBXItemOTree: TSpTBXItem
          Caption = 'Toggle &structure/project panel'
          Hint = 'Show/hide structure and project panel'
          Action = ecShowTree
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOut: TSpTBXItem
          Caption = 'Toggle &output panel'
          Hint = 'Show/hide output panel'
          Action = ecShowOut
          OnSelect = ButtonOnSelect
        end
        object TBXItemOClip: TSpTBXItem
          Caption = 'Toggle clipboar&d/minimap panel'
          Hint = 'Show/hide clipboard and mini-map panel'
          Action = ecShowClip
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem25: TSpTBXSeparatorItem
        end
        object TBXItemORO: TSpTBXItem
          Caption = 'Toggle &read-only'
          Hint = 'Toggle read-only'
          Action = ecReadOnly
          OnSelect = ButtonOnSelect
        end
        object TBXItemOFold: TSpTBXItem
          Caption = 'Toggle &code folding'
          Hint = 'Toggle code folding'
          Action = ecFolding
          OnSelect = ButtonOnSelect
        end
        object TBXItemOWrap: TSpTBXItem
          Caption = 'Toggle &word wrap'
          Hint = 'Toggle word wrap'
          Action = ecWrap
          OnSelect = ButtonOnSelect
        end
        object TBXItemONums: TSpTBXItem
          Caption = 'Toggle line &numbers'
          Hint = 'Toggle line numbers'
          Action = ecLineNums
          OnSelect = ButtonOnSelect
        end
        object TBXItemORuler: TSpTBXItem
          Caption = 'Toggle ruler'
          Hint = 'Toggle horizontal ruler'
          Action = ecRuler
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemNonPrint: TSpTBXSubmenuItem
          Caption = 'Toggle non-printable chars'
          object TBXItemONPrint: TSpTBXItem
            Caption = 'Toggle'
            Hint = 'Toggle non-printable chars'
            Action = ecNonPrint
            OnSelect = ButtonOnSelect
          end
          object TBXSeparatorItem98: TSpTBXSeparatorItem
          end
          object TBXItemONPrintSpaces: TSpTBXItem
            Caption = 'Show spaces/tabs'
            Action = ecNonPrintSpaces
            RadioItem = True
          end
          object TBXItemONPrintEol: TSpTBXItem
            Caption = 'Show line ends'
            Action = ecNonPrintEol
            RadioItem = True
          end
          object TBXItemONPrintAll: TSpTBXItem
            Caption = 'Show all'
            Action = ecNonPrintBoth
            RadioItem = True
          end
          object TBXSeparatorItem99: TSpTBXSeparatorItem
          end
          object TBXItemONPrintEolDetails: TSpTBXItem
            Caption = 'Detailed line ends'
            Action = ecNonPrintEolDetails
          end
        end
        object TBXSeparatorItem50: TSpTBXSeparatorItem
        end
        object TBXItemVSpellLive: TSpTBXItem
          Caption = '&Live spelling'
          Hint = 'Toggle live spelling mode (red underlines)'
          Action = ecSpellLive
          OnSelect = ButtonOnSelect
        end
        object TBXItemVSpellCheck: TSpTBXItem
          Caption = 'Sp&ell check'
          Hint = 'Perform spell check of current document'
          Action = ecSpellCheck
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem12: TSpTBXSeparatorItem
        end
        object TBXItemVSyncHorz: TSpTBXItem
          Caption = 'Sync horizontal scrolling'
          Hint = 'Synchronize horizontal scrolling of groups 1/2'
          Action = ecSyncScrollH
          OnSelect = ButtonOnSelect
        end
        object TBXItemVSyncVert: TSpTBXItem
          Caption = 'Sync vertical scrolling'
          Hint = 'Synchronize vertical scrolling of groups 1/2'
          Action = ecSyncScrollV
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem26: TSpTBXSeparatorItem
        end
        object TBXItemOFullScr: TSpTBXItem
          Caption = 'F&ull screen'
          Hint = 'Toggle full screen mode'
          Action = ecFullScr
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOnTop: TSpTBXItem
          Caption = '&Always on top'
          Hint = 'Always show main form on top'
          Action = ecOnTop
          OnSelect = ButtonOnSelect
        end
        object TBXItemViewColMarkers: TSpTBXItem
          Caption = 'Column markers...'
          Hint = 'Set column markers for the current file'
          Action = acColumnMarkers
          OnSelect = ButtonOnSelect
        end
        object TBXSubmenuItemLexer: TSpTBXSubmenuItem
          Caption = 'Le&xer'
          OnPopup = TBXSubmenuItemLexerPopup
        end
      end
      object TbxSubmenuItemWindow: TSpTBXSubmenuItem
        Caption = '&Window'
        OnPopup = TbxSubmenuItemWindowPopup
        object SpTBXSeparatorItem29: TSpTBXSeparatorItem
        end
        object TbxItemWinSplitH: TSpTBXItem
          Caption = 'Horizontal split'
          RadioItem = True
          OnClick = TbxItemWinSplitHClick
        end
        object TbxItemWinSplitV: TSpTBXItem
          Caption = 'Vertical split'
          RadioItem = True
          OnClick = TbxItemWinSplitVClick
        end
        object TBXSepWin: TSpTBXSeparatorItem
        end
        object TBXSubWin: TSpTBXSubmenuItem
          Caption = 'Panels'
          object TBXItemWinTree: TSpTBXItem
            Caption = 'Tree panel'
            Action = ecToggleFocusTree
          end
          object TBXItemWinProj: TSpTBXItem
            Caption = 'Project panel'
            Action = ecToggleFocusProject
          end
          object TbxItemWinTabs: TSpTBXItem
            Caption = 'Tabs panel'
            Action = ecToggleFocusTabs
          end
          object TbxItemWinExplorer: TSpTBXItem
            Caption = 'Explorer plugin panel'
            OnClick = TbxItemWinExplorerClick
          end
          object TbxItemWinFtp: TSpTBXItem
            Caption = 'FTP plugin panel'
            OnClick = TbxItemWinFtpClick
          end
          object TbxItemWinProjPre: TSpTBXItem
            Caption = 'Preview panel'
            Action = ecToggleProjPreview
          end
          object SpTBXSeparatorItem13: TSpTBXSeparatorItem
          end
          object TBXItemWinClip: TSpTBXItem
            Caption = 'Clipboard panel'
            Action = ecToggleFocusClip
          end
          object TBXItemWinMap: TSpTBXItem
            Caption = 'Minimap panel'
            Action = ecToggleFocusMap
          end
          object TbxItemWinClips: TSpTBXItem
            Caption = 'Text Clips panel'
            Action = ecToggleFocusClips
          end
          object SpTBXSeparatorItem12: TSpTBXSeparatorItem
          end
          object TBXItemWinOut: TSpTBXItem
            Caption = 'Output panel'
            Action = ecToggleFocusOutput
          end
          object TBXItemWinFRes: TSpTBXItem
            Caption = 'Search Results panel'
            Action = ecToggleFocusFindRes
          end
          object TbxItemWinBkmk: TSpTBXItem
            Caption = 'Bookmarks panel'
            Action = ecToggleFocusBookmarks
          end
          object TBXItemWinVal: TSpTBXItem
            Caption = 'Validation panel'
            Action = ecToggleFocusValidate
          end
          object TBXItemWinConsole: TSpTBXItem
            Caption = 'Console panel'
            Action = ecToggleFocusConsole
          end
        end
      end
      object TBXSubmenuItemHelp: TSpTBXSubmenuItem
        Caption = 'Help'
        object TBXItemHelpTopics: TSpTBXItem
          Caption = '&Help topics'
          Hint = 'Show help file'
          OnClick = TBXItemHelpTopicsClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem79: TSpTBXSeparatorItem
        end
        object TBXItemHelpCommandList: TSpTBXItem
          Caption = 'Show commands list'
          Hint = 'Dialog "Commands list"'
          Action = ecCommandsList
          OnSelect = ButtonOnSelect
        end
        object TBXItemHelpKeymap: TSpTBXItem
          Caption = 'Show &keyboard mapping'
          Hint = 'Show keyboard mapping as HTML page'
          OnClick = TBXItemHelpKeymapClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemHelpReadmeDir: TSpTBXItem
          Caption = '&Browse Readme folder'
          Hint = 'Browse Readme folder contents'
          OnClick = TBXItemHelpReadmeDirClick
          OnSelect = ButtonOnSelect
        end
        object TbxItemHelpPyDir: TSpTBXItem
          Caption = 'Browse Python-plugins folder'
          Hint = 'Browse Python-plugins folder contents'
          OnClick = TbxItemHelpPyDirClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem46: TSpTBXSeparatorItem
        end
        object TBXItemHelpDonate: TSpTBXItem
          Caption = '&Donate...'
          Hint = 'Show "Donate" help topic'
          OnClick = TBXItemHelpDonateClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemHelpAbout: TSpTBXItem
          Caption = '&About...'
          Hint = 'Dialog "About"'
          OnClick = TBXItemAbClick
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuItemGroups: TSpTBXSubmenuItem
        Hint = 'Choose grouping mode'
        ImageIndex = 1
        Images = ImageListCloseBtn
        OnSelect = ButtonOnSelect
        OnPopup = TBXSubmenuItemGroupsPopup
        object TbxItemGroupOne: TSpTBXItem
          Caption = 'One group'
          RadioItem = True
          OnClick = TbxItemGroupOneClick
        end
        object TbxItemGroup2H: TSpTBXItem
          Caption = '2 horz'
          RadioItem = True
          OnClick = TbxItemGroup2HClick
        end
        object TbxItemGroup2V: TSpTBXItem
          Caption = '2 vert'
          RadioItem = True
          OnClick = TbxItemGroup2VClick
        end
        object TbxItemGroup3H: TSpTBXItem
          Caption = '3 horz'
          RadioItem = True
          OnClick = TbxItemGroup3HClick
        end
        object TbxItemGroup3V: TSpTBXItem
          Caption = '3 vert'
          RadioItem = True
          OnClick = TbxItemGroup3VClick
        end
        object TbxItemGroup3as1p2: TSpTBXItem
          Caption = '3 as 1+2'
          RadioItem = True
          OnClick = TbxItemGroup3as1p2Click
        end
        object TbxItemGroup4H: TSpTBXItem
          Caption = '4 horz'
          RadioItem = True
          OnClick = TbxItemGroup4HClick
        end
        object TbxItemGroup4V: TSpTBXItem
          Caption = '4 vert'
          RadioItem = True
          OnClick = TbxItemGroup4VClick
        end
        object TbxItemGroup4Grid: TSpTBXItem
          Caption = '4 grid'
          RadioItem = True
          OnClick = TbxItemGroup4GridClick
        end
        object TbxItemGroup6Grid: TSpTBXItem
          Caption = '6 grid'
          RadioItem = True
          OnClick = TbxItemGroup6GridClick
        end
      end
      object TbxItemMenuX: TSpTBXItem
        Caption = '-'
        Hint = 'Close current tab'
        ImageIndex = 0
        Images = ImageListCloseBtn
        OnClick = TbxItemMenuXClick
        OnSelect = ButtonOnSelect
      end
      object TbxItemMenuXX: TSpTBXItem
        Caption = '-'
        Hint = 'Close all tabs'
        ImageIndex = 2
        Images = ImageListCloseBtn
        OnClick = TbxItemMenuXXClick
        OnSelect = ButtonOnSelect
      end
      object TbxSubmenuItemRecentColors: TSpTBXSubmenuItem
        Hint = 'Recent colors menu'
        ImageIndex = 0
        Images = ImageListColorRecent
        Visible = False
        OnSelect = ButtonOnSelect
        OnPopup = TbxSubmenuItemRecentColorsPopup
      end
    end
  end
  object PanelBg: TPanel
    Left = 287
    Top = 76
    Width = 412
    Height = 356
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    object TemplateEditor: TSyntaxMemo
      Left = 328
      Top = 72
      Width = 129
      Height = 145
      NonPrintedSpaces = True
      NonPrintedEol = True
      NonPrintedEolDetails = False
      SelectModeDefault = msNone
      Lines.Strings = (
        'Template'
        'editor')
      TabList.AsString = '2'
      NonPrinted.Color = clGray
      NonPrinted.Font.Charset = DEFAULT_CHARSET
      NonPrinted.Font.Color = clGray
      NonPrinted.Font.Height = -11
      NonPrinted.Font.Name = 'MS Sans Serif'
      NonPrinted.Font.Style = []
      LineNumbers.UnderColor = clBlack
      LineNumbers.Margin = 4
      LineNumbers.VertAlignment = vaTop
      LineNumbers.Font.Charset = ANSI_CHARSET
      LineNumbers.Font.Color = clBlack
      LineNumbers.Font.Height = -11
      LineNumbers.Font.Name = 'Microsoft Sans Serif'
      LineNumbers.Font.Style = []
      LineNumbers.Band = 0
      Gutter.Width = 63
      Gutter.Images = ImgListGutter
      Gutter.ExpandButtons.Data = {
        62010000424D62010000000000004200000028000000160000000C0000000100
        08000000000020010000120B0000120B0000030000000300000000000000FFFF
        FF00FFFFFF000101010101010101010101010101010101010101010100000000
        0000000000000000000000000000000000000000000000010101010101010101
        0000010101010101010101000000000101010101010101010000010101010001
        0101010000000001010101010101010100000101010100010101010000000001
        0101010101010101000001010101000101010100000000010000000000000001
        0000010000000000000001000000000101010101010101010000010101010001
        0101010000000001010101010101010100000101010100010101010000000001
        0101010101010101000001010101000101010100000000010101010101010101
        0000010101010101010101000000000000000000000000000000000000000000
        000000000000}
      Gutter.Bands = <
        item
          Width = 15
        end
        item
          Width = 30
          GradientRight = clNone
        end
        item
          Width = 3
        end
        item
          Width = 15
          Color = clSilver
        end>
      Gutter.Objects = <
        item
          Tag = 0
        end>
      Gutter.ExpBtnBand = 2
      Gutter.ShowSeparator = False
      Gutter.CollapsePen.Color = clGray
      Gutter.SeparatorColor = clNone
      Gutter.AutoSize = True
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -11
      HintProps.Font.Name = 'MS Sans Serif'
      HintProps.Font.Style = []
      HintProps.Color = clInfoBk
      HintProps.ShowHints = [shCollapsed, shGutter, shTokens]
      HintProps.TimeCollapsed = 100000
      HintProps.TimeTokens = 100000
      HintProps.Styles = SyntStyles
      HintProps.Images = ImgListGutter
      HintProps.ShowFirstLine = True
      UserRanges = <>
      UndoLimit = 0
      StaplePen.Color = clGray
      StaplePen.Style = psDot
      StapleOffset = -1
      CollapseBreakColor = clBlack
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
      DefaultStyles.SearchMark.BgColor = clGreen
      DefaultStyles.SearchMark.FormatType = ftColor
      DefaultStyles.CurrentLine.Enabled = False
      DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
      DefaultStyles.CurrentLine.Font.Color = clNone
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
      DefaultStyles.CollapseMark.BorderColorLeft = clSilver
      DefaultStyles.CollapseMark.BorderTypeTop = blSolid
      DefaultStyles.CollapseMark.BorderColorTop = clSilver
      DefaultStyles.CollapseMark.BorderTypeRight = blSolid
      DefaultStyles.CollapseMark.BorderColorRight = clSilver
      DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
      DefaultStyles.CollapseMark.BorderColorBottom = clSilver
      LineStateDisplay.Band = 1
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
      Options = [soOverwriteBlocks, soEnableBlockSel, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soGroupRedo, soFixedLineHeight, soDragText, soKeepTrailingBlanks, soUndoAfterSave, soScrollLastLine, soKeepSelMode, soSmartCaret, soVariableHorzScrollBar]
      OptionsEx = [soSmartPaste, soKeepSearchMarks, soCorrectNonPrinted, soNormalSelToLineEnd, soRightClickMoveCaret]
      BorderStyle = bsNone
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
      BevelInner = bvNone
      BevelOuter = bvNone
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Courier New'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      Visible = False
    end
  end
  object TBXDockLeft1: TSpTBXDock
    Left = 255
    Top = 76
    Width = 32
    Height = 356
    Position = dpLeft
    object tbView: TSpTBXToolbar
      Left = 0
      Top = 0
      DockPos = -4
      Images = ImageListIcons
      TabOrder = 0
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'View'
      object TBXItemVPanelTree: TSpTBXItem
        Tag = 715
        Caption = 'Toggle tree/project panel'
        Hint = 'Toggle tree/project panel'
        Action = ecShowTree
        ImageIndex = 19
        OnSelect = ButtonOnSelect
      end
      object TBXItemVPanelOut: TSpTBXItem
        Caption = 'Toggle output panel'
        Hint = 'Toggle output panel'
        Action = ecShowOut
        ImageIndex = 21
        OnSelect = ButtonOnSelect
      end
      object TbxItemVPanelClip: TSpTBXItem
        Caption = 'Toggle clipboard/minimap panel'
        Hint = 'Toggle clipboard/minimap panel'
        Action = ecShowClip
        ImageIndex = 20
        OnSelect = ButtonOnSelect
      end
      object TBXItemVNonpr: TSpTBXSubmenuItem
        Tag = 733
        Action = ecNonPrint
        ImageIndex = 23
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        LinkSubitems = TBXSubmenuItemNonPrint
      end
      object TBXSeparatorItem2: TSpTBXSeparatorItem
      end
      object TBXItemVComm: TSpTBXItem
        Tag = 560
        Caption = 'Comment lines'
        Hint = 'Comment selected lines'
        ImageIndex = 17
        OnClick = TBXItemVCommClick
        OnSelect = ButtonOnSelect
      end
      object TBXItemVUncom: TSpTBXItem
        Tag = 561
        Caption = 'Uncomment lines'
        Hint = 'Uncomment selected lines'
        ImageIndex = 18
        OnClick = TBXItemVUncomClick
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem10: TSpTBXSeparatorItem
      end
      object TBXItemVInd: TSpTBXItem
        Tag = 350
        Action = ecIndent
        ImageIndex = 13
        OnSelect = ButtonOnSelect
      end
      object TBXItemVUnind: TSpTBXItem
        Tag = 351
        Action = ecUnindent
        ImageIndex = 14
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem44: TSpTBXSeparatorItem
      end
      object TBXItemVSyncH: TSpTBXItem
        Caption = 'Sync horizontal scrolling'
        Hint = 'Synchronize horizontal scrolling of groups 1/2'
        Action = ecSyncScrollH
        ImageIndex = 30
        OnSelect = ButtonOnSelect
      end
      object TBXItemVSyncV: TSpTBXItem
        Caption = 'Sync vertical scrolling'
        Hint = 'Synchronize vertical scrolling of groups 1/2'
        Action = ecSyncScrollV
        ImageIndex = 31
        OnSelect = ButtonOnSelect
      end
    end
  end
  object TBXDockRight1: TSpTBXDock
    Left = 699
    Top = 76
    Width = 9
    Height = 356
    Position = dpRight
  end
  object TBXDockBottom1: TSpTBXDock
    Left = 0
    Top = 622
    Width = 892
    Height = 9
    Position = dpBottom
  end
  object SplitterLeft: TSpTBXSplitter
    Left = 250
    Top = 76
    Height = 356
    Cursor = crSizeWE
    MinSize = 50
    ResizeStyle = rsPattern
  end
  object SplitterRight: TSpTBXSplitter
    Left = 708
    Top = 76
    Height = 356
    Cursor = crSizeWE
    Align = alRight
    MinSize = 50
    ResizeStyle = rsPattern
  end
  object SplitterBottom: TSpTBXSplitter
    Left = 0
    Top = 432
    Width = 892
    Height = 5
    Cursor = crSizeNS
    Align = alBottom
    MinSize = 70
    ResizeStyle = rsPattern
  end
  object ActionList: TActionList
    Left = 312
    Top = 252
    object ecToggleFocusGroups: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusGroupsExecute
    end
    object ecPrintAction: TecPrintAction
      Category = 'Print'
      Caption = 'Print...'
      Hint = 'Print current file'
      BeforeExecute = ecPrintActionBeforeExecute
      Command = 630
      SyntPrinter = ecSyntPrinter
    end
    object ecPreviewActionNew: TAction
      Category = 'Print'
      OnExecute = ecPreviewActionNewExecute
    end
    object acNewTab: TAction
      Tag = 700
      Category = 'File'
      Caption = 'New file'
      Hint = 'Create new tab'
      OnExecute = acNewTabExecute
    end
    object acNewWindow: TAction
      Category = 'File'
      Caption = 'New window'
      Hint = 'Open new program instance'
      OnExecute = acNewWindowExecute
    end
    object ecPageSetupActionNew: TAction
      Category = 'Print'
      OnExecute = ecPageSetupActionNewExecute
    end
    object ecPrinterSetup: TAction
      Category = 'Print'
      Caption = 'Printer setup...'
      OnExecute = ecPrinterSetupExecute
    end
    object acOpen: TAction
      Tag = 701
      Category = 'File'
      Caption = 'Open...'
      Hint = 'Open file'
      OnExecute = acOpenExecute
    end
    object acReread: TAction
      Category = 'File'
      Caption = 'Reopen'
      Hint = 'Reread file from disk'
      OnExecute = acRereadExecute
    end
    object acRename: TAction
      Category = 'File'
      OnExecute = acRenameExecute
    end
    object acSave: TAction
      Tag = 702
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save file'
      OnExecute = acSaveExecute
    end
    object acSaveAs: TAction
      Tag = 703
      Category = 'File'
      Caption = 'Save as...'
      Hint = 'Save file under different name'
      OnExecute = acSaveAsExecute
    end
    object acSaveAll: TAction
      Category = 'File'
      OnExecute = acSaveAllExecute
    end
    object acClose: TAction
      Category = 'File'
      OnExecute = acCloseExecute
    end
    object acCloseAll: TAction
      Category = 'File'
      OnExecute = acCloseAllExecute
    end
    object acCloseOthersThisGroup: TAction
      Category = 'File'
      OnExecute = acCloseOthersThisGroupExecute
    end
    object ecToggleShowGroup2: TAction
      Category = 'View'
      OnExecute = ecToggleShowGroup2Execute
    end
    object acCloseOthersAllGroups: TAction
      Category = 'File'
      OnExecute = acCloseOthersAllGroupsExecute
    end
    object acCloseAndDelete: TAction
      Category = 'File'
      OnExecute = acCloseAndDeleteExecute
    end
    object acSetup: TAction
      Category = 'File'
      OnExecute = acSetupExecute
    end
    object acSetupLexerNew: TAction
      Category = 'File'
      OnExecute = acSetupLexerNewExecute
    end
    object acSetupLexerLib: TAction
      Category = 'File'
      OnExecute = acSetupLexerLibExecute
    end
    object ecReplace: TAction
      Category = 'Find'
      Hint = 'Dialog "Replace"'
      OnExecute = ecReplaceExecute
    end
    object ecReplaceInFiles: TAction
      Category = 'Find'
      Hint = 'Dialog "Find/replace in files"'
      OnExecute = ecReplaceInFilesExecute
    end
    object ecReplaceInProject: TAction
      Category = 'Find'
      OnExecute = ecReplaceInProjectExecute
    end
    object ecCopy: TecCopy
      Tag = 301
      Category = 'Edit'
      Caption = 'Copy'
      Hint = 'Copy selection to clipboard'
      ImageIndex = 7
      ShortCut = 16451
    end
    object ecCut: TecCut
      Tag = 302
      Category = 'Edit'
      Caption = 'Cut'
      Hint = 'Cut selection to clipboard'
      ImageIndex = 8
      ShortCut = 16472
    end
    object ecPaste: TecPaste
      Tag = 303
      Category = 'Edit'
      Caption = 'Paste'
      Hint = 'Paste clipboard'
      ImageIndex = 9
      ShortCut = 16470
    end
    object ecClear: TecClear
      Tag = 307
      Category = 'Edit'
      Caption = 'Delete'
      Hint = 'Clear current selection'
      ImageIndex = 10
      ShortCut = 16430
    end
    object ecSelectAll: TecSelectAll
      Tag = 306
      Category = 'Edit'
      Caption = 'Select all'
      Hint = 'Select all text'
      ImageIndex = 11
      ShortCut = 16449
    end
    object ecUndo: TecUndo
      Tag = 304
      Category = 'Edit'
      Caption = 'Undo'
      Hint = 'Undo last action'
      ImageIndex = 12
      ShortCut = 16474
    end
    object ecRedo: TecRedo
      Tag = 305
      Category = 'Edit'
      Caption = 'Redo'
      Hint = 'Redo last undone action'
      ImageIndex = 13
      ShortCut = 24666
    end
    object ecIndent: TecIndent
      Tag = 350
      Category = 'Edit'
      Caption = 'Indent'
      Hint = 'Indent selection'
      ImageIndex = 14
      ShortCut = 16393
    end
    object ecUnindent: TecUnindent
      Tag = 351
      Category = 'Edit'
      Caption = 'Unindent'
      Hint = 'Unindent selection'
      ImageIndex = 15
      ShortCut = 8201
    end
    object ecLowerCase: TecLowerCase
      Tag = 366
      Category = 'Edit'
      Caption = 'Lower case'
      ImageIndex = 19
      ShortCut = 16459
    end
    object ecUpperCase: TecUpperCase
      Tag = 365
      Category = 'Edit'
      Caption = 'Upper case'
      ImageIndex = 20
      ShortCut = 16459
    end
    object ecTitleCase: TAction
      Tag = 368
      Category = 'Edit'
      Caption = 'Title case'
      ImageIndex = 18
      OnExecute = ecTitleCaseExecute
    end
    object ecSentCase: TAction
      Tag = 369
      Category = 'Edit'
      Caption = 'Sentence case'
      OnExecute = ecSentCaseExecute
    end
    object ecToggleCase: TecToggleCase
      Tag = 367
      Category = 'Edit'
      Caption = 'Invert case'
    end
    object ecCommentLines: TecCommentLines
      Tag = 560
      Category = 'Comment'
      Caption = 'Comment lines'
      Hint = 'Comment lines'
      ImageIndex = 21
    end
    object ecUnCommentLines: TecUnCommentLines
      Tag = 561
      Category = 'Comment'
      Caption = 'Uncomment lines'
      Hint = 'Uncomment lines'
      ImageIndex = 22
    end
    object ecShowTree: TAction
      Tag = 715
      Category = 'View'
      Caption = 'Toggle tree'
      Checked = True
      OnExecute = ecShowTreeExecute
    end
    object ecSortAscending: TAction
      Category = 'Edit'
      Caption = 'Sort ascending'
      Hint = 'Sort selection ascending'
      ImageIndex = 16
      OnExecute = ecSortAscendingExecute
    end
    object ecSortDescending: TAction
      Category = 'Edit'
      Caption = 'Sort descending'
      Hint = 'Sort selection descending'
      ImageIndex = 17
      OnExecute = ecSortDescendingExecute
    end
    object ecReadOnly: TAction
      Tag = 712
      Category = 'View'
      Caption = 'Read only'
      Hint = 'Toggle read-only'
      OnExecute = ecReadOnlyExecute
    end
    object ecFind: TAction
      Category = 'Find'
      Hint = 'Dialog "Find"'
      ImageIndex = 32
      ShortCut = 16454
      OnExecute = ecFindExecute
    end
    object ecWrap: TAction
      Tag = 730
      Category = 'View'
      Caption = 'Toggle word wrap'
      Hint = 'Toggle word wrap'
      ImageIndex = 25
      OnExecute = ecWrapExecute
    end
    object ecLineNums: TAction
      Tag = 731
      Category = 'View'
      Caption = 'Toggle line numbers'
      Hint = 'Toggle line numbers'
      ImageIndex = 24
      OnExecute = ecLineNumsExecute
    end
    object ecFolding: TAction
      Tag = 732
      Category = 'View'
      Caption = 'Toggle code folding'
      Hint = 'Toggle code folding'
      OnExecute = ecFoldingExecute
    end
    object ecNonPrint: TAction
      Tag = 733
      Category = 'View'
      Caption = 'Toggle non-printable chars'
      Hint = 'Toggle non-printable chars'
      OnExecute = ecNonPrintExecute
    end
    object acSetupLexerStyles: TAction
      Category = 'File'
      OnExecute = acSetupLexerStylesExecute
    end
    object acExit: TAction
      Category = 'File'
      OnExecute = acExitExecute
    end
    object ecShowOut: TAction
      Tag = 713
      Category = 'View'
      Caption = 'Toggle output'
      Checked = True
      OnExecute = ecShowOutExecute
    end
    object ecShowClip: TAction
      Category = 'View'
      Caption = 'Toggle clipboard history'
      Checked = True
      OnExecute = ecShowClipExecute
    end
    object ecGotoNextFindResult: TAction
      Category = 'Goto'
      OnExecute = ecGotoNextFindResultExecute
    end
    object ecGotoPrevFindResult: TAction
      Category = 'Goto'
      OnExecute = ecGotoPrevFindResultExecute
    end
    object ecFullScr: TAction
      Category = 'View'
      OnExecute = ecFullScrExecute
    end
    object ecSyncScrollH: TAction
      Category = 'View'
      ImageIndex = 41
      OnExecute = ecSyncScrollHExecute
    end
    object ecSyncScrollV: TAction
      Category = 'View'
      ImageIndex = 42
      OnExecute = ecSyncScrollVExecute
    end
    object ecOnTop: TAction
      Category = 'View'
      OnExecute = ecOnTopExecute
    end
    object ecToggleFocusTree: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusTreeExecute
    end
    object ecToggleFocusClip: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusClipExecute
    end
    object ecZenExpand: TAction
      Category = 'Zen'
      OnExecute = ecZenExpandExecute
    end
    object ecZenWrap: TAction
      Category = 'Zen'
      OnExecute = ecZenWrapExecute
    end
    object ecToggleLineComment: TAction
      Category = 'Comment'
      OnExecute = ecToggleLineCommentExecute
    end
    object ecToggleFocusOutput: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusOutputExecute
    end
    object ecToggleFocusValidate: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusValidateExecute
    end
    object acBackup: TAction
      Category = 'File'
      OnExecute = acBackupExecute
    end
    object ecToggleStreamComment: TAction
      Category = 'Comment'
      OnExecute = ecToggleStreamCommentExecute
    end
    object ecToggleFocusFindRes: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusFindResExecute
    end
    object ecSpellCheck: TAction
      Category = 'View'
      OnExecute = ecSpellCheckExecute
    end
    object ecSpellLive: TAction
      Category = 'View'
      OnExecute = ecSpellLiveExecute
    end
    object acMacroRecord: TecMacroRecord
      Category = 'Macros'
    end
    object acMacroStop: TecMacroStop
      Category = 'Macros'
    end
    object acMacroCancel: TecMacroCancel
      Category = 'Macros'
    end
    object acMacroPlay: TecMacroPlay
      Category = 'Macros'
      BeforeExecute = acMacroPlayBeforeExecute
    end
    object acMacroDialog: TAction
      Category = 'Macros'
      OnExecute = acMacroDialogExecute
    end
    object acMacroRepeat: TAction
      Category = 'Macros'
      OnExecute = acMacroRepeatExecute
    end
    object acMacro1: TAction
      Category = 'Macros'
      OnExecute = acMacro1Execute
    end
    object acMacro2: TAction
      Category = 'Macros'
      OnExecute = acMacro2Execute
    end
    object acMacro3: TAction
      Category = 'Macros'
      OnExecute = acMacro3Execute
    end
    object acMacro4: TAction
      Category = 'Macros'
      OnExecute = acMacro4Execute
    end
    object acMacro5: TAction
      Category = 'Macros'
      OnExecute = acMacro5Execute
    end
    object acMacro6: TAction
      Category = 'Macros'
      OnExecute = acMacro6Execute
    end
    object acMacro7: TAction
      Category = 'Macros'
      OnExecute = acMacro7Execute
    end
    object acMacro8: TAction
      Category = 'Macros'
      OnExecute = acMacro8Execute
    end
    object acMacro9: TAction
      Category = 'Macros'
      OnExecute = acMacro9Execute
    end
    object ecBkClearAll: TAction
      Category = 'Bk'
      OnExecute = ecBkClearAllExecute
    end
    object ecBkToggle: TAction
      Category = 'Bk'
      OnExecute = ecBkToggleExecute
    end
    object ecBkNext: TAction
      Category = 'Bk'
      OnExecute = ecBkNextExecute
    end
    object ecBkPrev: TAction
      Category = 'Bk'
      OnExecute = ecBkPrevExecute
    end
    object ecBkInverse: TAction
      Category = 'Bk'
      OnExecute = ecBkInverseExecute
    end
    object ecBkCopy: TAction
      Category = 'Bk'
      OnExecute = ecBkCopyExecute
    end
    object ecBkCut: TAction
      Category = 'Bk'
      OnExecute = ecBkCutExecute
    end
    object ecBkDelete: TAction
      Category = 'Bk'
      OnExecute = ecBkDeleteExecute
    end
    object ecBkDeleteUnmk: TAction
      Category = 'Bk'
      OnExecute = ecBkDeleteUnmkExecute
    end
    object ecBkPaste: TAction
      Category = 'Bk'
      OnExecute = ecBkPasteExecute
    end
    object ecGoto: TAction
      Category = 'Goto'
      OnExecute = ecGotoExecute
    end
    object ecRemoveBlanks: TAction
      Category = 'EditBlank'
      OnExecute = ecRemoveBlanksExecute
    end
    object ecRemoveLines: TAction
      Category = 'Edit'
      OnExecute = ecRemoveLinesExecute
    end
    object ecTrimLead: TAction
      Category = 'EditBlank'
      OnExecute = ecTrimLeadExecute
    end
    object ecTrimTrail: TAction
      Category = 'EditBlank'
      OnExecute = ecTrimTrailExecute
    end
    object ecTrimAll: TAction
      Category = 'EditBlank'
      OnExecute = ecTrimAllExecute
    end
    object ecRemoveDupSpaces: TAction
      Category = 'EditBlank'
      OnExecute = ecRemoveDupSpacesExecute
    end
    object ecTabToSp: TAction
      Category = 'EditBlank'
      OnExecute = ecTabToSpExecute
    end
    object ecSpToTab: TAction
      Category = 'EditBlank'
      OnExecute = ecSpToTabExecute
    end
    object ecSpToTabLeading: TAction
      Category = 'EditBlank'
      OnExecute = ecSpToTabLeadingExecute
    end
    object ecFindClipNext: TAction
      Category = 'Find'
      OnExecute = ecFindClipNextExecute
    end
    object ecFindClipPrev: TAction
      Category = 'Find'
      OnExecute = ecFindClipPrevExecute
    end
    object ecSplit50_50: TAction
      Category = 'View'
      OnExecute = ecSplit50_50Execute
    end
    object ecSplit40_60: TAction
      Category = 'View'
      OnExecute = ecSplit40_60Execute
    end
    object ecSplit60_40: TAction
      Category = 'View'
      OnExecute = ecSplit60_40Execute
    end
    object ecSplit30_70: TAction
      Category = 'View'
      OnExecute = ecSplit30_70Execute
    end
    object ecSplit70_30: TAction
      Category = 'View'
      OnExecute = ecSplit70_30Execute
    end
    object ecSplit20_80: TAction
      Category = 'View'
      OnExecute = ecSplit20_80Execute
    end
    object ecSplit80_20: TAction
      Category = 'View'
      OnExecute = ecSplit80_20Execute
    end
    object ecRepeatCmd: TAction
      Category = 'Edit'
      OnExecute = ecRepeatCmdExecute
    end
    object ecToggleFocusMap: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusMapExecute
    end
    object ecFindInTree: TAction
      Category = 'Find'
      OnExecute = ecFindInTreeExecute
    end
    object ecFindInTreeNext: TAction
      Category = 'Find'
      OnExecute = ecFindInTreeNextExecute
    end
    object ecFindInTreePrev: TAction
      Category = 'Find'
      OnExecute = ecFindInTreePrevExecute
    end
    object ecTreeNext: TAction
      Category = 'Tree'
      OnExecute = ecTreeNextExecute
    end
    object ecTreePrev: TAction
      Category = 'Tree'
      OnExecute = ecTreePrevExecute
    end
    object ecReduceBlanks: TAction
      Category = 'EditBlank'
      OnExecute = ecReduceBlanksExecute
    end
    object ecSplitLeft: TAction
      Category = 'View'
      OnExecute = ecSplitLeftExecute
    end
    object ecSplitRight: TAction
      Category = 'View'
      OnExecute = ecSplitRightExecute
    end
    object ecFindNextWithExtend: TAction
      Category = 'Find'
      OnExecute = ecFindNextWithExtendExecute
    end
    object ecFindPrevWithExtend: TAction
      Category = 'Find'
      OnExecute = ecFindPrevWithExtendExecute
    end
    object ecFindInList: TAction
      Category = 'Find'
      OnExecute = ecFindInListExecute
    end
    object ecFindInListNext: TAction
      Category = 'Find'
      OnExecute = ecFindInListNextExecute
    end
    object ecFindInListPrev: TAction
      Category = 'Find'
      OnExecute = ecFindInListPrevExecute
    end
    object acMacro10: TAction
      Category = 'Macros'
      OnExecute = acMacro10Execute
    end
    object acMacro11: TAction
      Category = 'Macros'
      OnExecute = acMacro11Execute
    end
    object acMacro12: TAction
      Category = 'Macros'
      OnExecute = acMacro12Execute
    end
    object acMacro13: TAction
      Category = 'Macros'
      OnExecute = acMacro13Execute
    end
    object acMacro14: TAction
      Category = 'Macros'
      OnExecute = acMacro14Execute
    end
    object acMacro15: TAction
      Category = 'Macros'
      OnExecute = acMacro15Execute
    end
    object acMacro16: TAction
      Category = 'Macros'
      OnExecute = acMacro16Execute
    end
    object acMacro17: TAction
      Category = 'Macros'
      OnExecute = acMacro17Execute
    end
    object acMacro18: TAction
      Category = 'Macros'
      OnExecute = acMacro18Execute
    end
    object acMacro19: TAction
      Category = 'Macros'
      OnExecute = acMacro19Execute
    end
    object acMacro20: TAction
      Category = 'Macros'
      OnExecute = acMacro20Execute
    end
    object acMacro21: TAction
      Category = 'Macros'
      OnExecute = acMacro21Execute
    end
    object acMacro22: TAction
      Category = 'Macros'
      OnExecute = acMacro22Execute
    end
    object acMacro23: TAction
      Category = 'Macros'
      OnExecute = acMacro23Execute
    end
    object acMacro24: TAction
      Category = 'Macros'
      OnExecute = acMacro24Execute
    end
    object acMacro25: TAction
      Category = 'Macros'
      OnExecute = acMacro25Execute
    end
    object acMacro26: TAction
      Category = 'Macros'
      OnExecute = acMacro26Execute
    end
    object acMacro27: TAction
      Category = 'Macros'
      OnExecute = acMacro27Execute
    end
    object acMacro28: TAction
      Category = 'Macros'
      OnExecute = acMacro28Execute
    end
    object acMacro29: TAction
      Category = 'Macros'
      OnExecute = acMacro29Execute
    end
    object acMacro30: TAction
      Category = 'Macros'
      OnExecute = acMacro30Execute
    end
    object ecTreeParent: TAction
      Category = 'Tree'
      OnExecute = ecTreeParentExecute
    end
    object ecTreeNextBrother: TAction
      Category = 'Tree'
      OnExecute = ecTreeNextBrotherExecute
    end
    object ecTreePrevBrother: TAction
      Category = 'Tree'
      OnExecute = ecTreePrevBrotherExecute
    end
    object acProps: TAction
      Category = 'File'
      OnExecute = acPropsExecute
    end
    object ecInsertColor: TAction
      Category = 'Edit'
      Caption = 'ecInsertColor'
      OnExecute = ecInsertColorExecute
    end
    object ecReplaceSelFromClipAll: TAction
      Category = 'Find'
      OnExecute = ecReplaceSelFromClipAllExecute
    end
    object acRereadOut: TAction
      Category = 'File'
      OnExecute = acRereadOutExecute
    end
    object ecToggleFocusProject: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusProjectExecute
    end
    object ecInsertImage: TAction
      Category = 'Edit'
      OnExecute = ecInsertImageExecute
    end
    object ecToggleFocusMasterSlave: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusMasterSlaveExecute
    end
    object ecToggleSlave: TAction
      Category = 'View'
      OnExecute = ecToggleSlaveExecute
    end
    object ecRuler: TAction
      Category = 'View'
      OnExecute = ecRulerExecute
    end
    object ecSplitViewsVertHorz: TAction
      Category = 'View'
      OnExecute = ecSplitViewsVertHorzExecute
    end
    object ecSplitSlaveVertHorz: TAction
      Category = 'View'
      OnExecute = ecSplitSlaveVertHorzExecute
    end
    object ecGotoBk: TAction
      Category = 'Bk'
      OnExecute = ecGotoBkExecute
    end
    object ecLoremIpsum: TAction
      Category = 'Edit'
      OnExecute = ecLoremIpsumExecute
    end
    object acFavAddFile: TAction
      Category = 'Fav'
      OnExecute = acFavAddFileExecute
    end
    object acFavAddProj: TAction
      Category = 'Fav'
      OnExecute = acFavAddProjExecute
    end
    object acFavManage: TAction
      Category = 'Fav'
      OnExecute = acFavManageExecute
    end
    object ecToggleFocusClips: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusClipsExecute
    end
    object ecSmartHl: TAction
      Category = 'View'
      OnExecute = ecSmartHlExecute
    end
    object ecDropPortableBk: TAction
      Category = 'Bk'
      OnExecute = ecDropPortableBkExecute
    end
    object ecGotoPortableBk: TAction
      Category = 'Bk'
      OnExecute = ecGotoPortableBkExecute
    end
    object ecNumericConverter: TAction
      Category = 'Edit'
      OnExecute = ecNumericConverterExecute
    end
    object ecIndentLike1st: TAction
      Category = 'Edit'
      OnExecute = ecIndentLike1stExecute
    end
    object acColumnMarkers: TAction
      Category = 'File'
      OnExecute = acColumnMarkersExecute
    end
    object ecCenterLines: TAction
      Category = 'EditBlank'
      OnExecute = ecCenterLinesExecute
    end
    object ecToggleFocusTabs: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusTabsExecute
    end
    object ecEncodeHtmlChars: TAction
      Category = 'Edit'
      OnExecute = ecEncodeHtmlCharsExecute
    end
    object ecSortDialog: TAction
      Category = 'Edit'
      OnExecute = ecSortDialogExecute
    end
    object ecCollapseParent: TAction
      Category = 'View'
      OnExecute = ecCollapseParentExecute
    end
    object ecCollapseWithNested: TAction
      Category = 'View'
      OnExecute = ecCollapseWithNestedExecute
    end
    object ecToggleLineCommentAlt: TAction
      Category = 'Comment'
      OnExecute = ecToggleLineCommentAltExecute
    end
    object ecCommandsList: TAction
      Category = 'View'
      OnExecute = ecCommandsListExecute
    end
    object ecProjectList: TAction
      Category = 'Goto'
      OnExecute = ecProjectListExecute
    end
    object ecEditColumn: TAction
      Category = 'Edit'
      OnExecute = ecEditColumnExecute
    end
    object ecDedupAll: TAction
      Category = 'Edit'
      OnExecute = ecDedupAllExecute
    end
    object ecDedupAdjacent: TAction
      Category = 'Edit'
      OnExecute = ecDedupAdjacentExecute
    end
    object ecAlignWithSep: TAction
      Category = 'EditBlank'
      OnExecute = ecAlignWithSepExecute
    end
    object ecReverseLines: TAction
      Category = 'Edit'
      OnExecute = ecReverseLinesExecute
    end
    object ecShuffleLines: TAction
      Category = 'Edit'
      OnExecute = ecShuffleLinesExecute
    end
    object ecExtractDupsCase: TAction
      Category = 'Edit'
      OnExecute = ecExtractDupsCaseExecute
    end
    object ecExtractDupsNoCase: TAction
      Category = 'Edit'
      OnExecute = ecExtractDupsNoCaseExecute
    end
    object ecNonPrintOff: TAction
      Category = 'View'
    end
    object ecNonPrintSpaces: TAction
      Category = 'View'
      OnExecute = ecNonPrintSpacesExecute
    end
    object ecNonPrintEol: TAction
      Category = 'View'
      OnExecute = ecNonPrintEolExecute
    end
    object ecNonPrintBoth: TAction
      Category = 'View'
      OnExecute = ecNonPrintBothExecute
    end
    object ecNonPrintEolDetails: TAction
      Category = 'View'
      OnExecute = ecNonPrintEolDetailsExecute
    end
    object acOpenBySelection: TAction
      Category = 'File'
      OnExecute = acOpenBySelectionExecute
    end
    object acExportRTF: TecExportRTFAction
      Tag = 704
      Category = 'File'
      Caption = 'Export to RTF...'
      Hint = 
        'Export the current editor contents to RTF including all highligh' +
        'tings'
      BeforeExecute = acExportRTFBeforeExecute
      DefaultExt = '.RTF'
      Filter = 'Rich text files (*.rtf)|*.rtf|All files (*.*)|*.*'
      Options = [ofOverwritePrompt, ofPathMustExist, ofEnableSizing]
      OptionsEx = []
    end
    object acExportHTML: TecExportHTMLAction
      Tag = 705
      Category = 'File'
      Caption = 'Export to HTML...'
      Hint = 
        'Export the current editor contents to HTML including all highlig' +
        'htings'
      BeforeExecute = acExportHTMLBeforeExecute
      DefaultExt = '.HTML'
      Filter = 'HTML files (*.htm, *.html)|*.htm;*.html|All files (*.*)|*.*'
      Options = [ofOverwritePrompt, ofPathMustExist, ofEnableSizing]
      OptionsEx = []
    end
    object ecEncodeHtmlChars2: TAction
      Category = 'Edit'
      OnExecute = ecEncodeHtmlChars2Execute
    end
    object ecToggleFocusConsole: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusConsoleExecute
    end
    object ecToggleProjPreview: TAction
      Category = 'View'
      OnExecute = ecToggleProjPreviewExecute
    end
    object ecToggleFocusBookmarks: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusBookmarksExecute
    end
    object acRestart: TAction
      Category = 'File'
      OnExecute = acRestartExecute
    end
    object ecDedupAllAndOrig: TAction
      Category = 'Edit'
      OnExecute = ecDedupAllAndOrigExecute
    end
    object ecExtractUniq: TAction
      Category = 'Edit'
      OnExecute = ecExtractUniqExecute
    end
  end
  object SD: TTntSaveDialog
    OnShow = SDShow
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing, ofForceShowHidden]
    Left = 608
    Top = 308
  end
  object OD: TTntOpenDialog
    OnShow = ODShow
    Filter = 'All files (*.*)|*.*'
    Options = [ofHideReadOnly, ofAllowMultiSelect, ofPathMustExist, ofEnableSizing, ofForceShowHidden]
    Left = 584
    Top = 308
  end
  object SyntaxManager: TSyntaxManager
    MenuPlainText = 'Plain Text'
    OnChange = SyntaxManagerChange
    Left = 336
    Top = 252
  end
  object PropsManager: TPropsManager
    Template = TemplateEditor
    IniSection = 'Template'
    UseRegistry = False
    Properties.Strings = (
      ';Editor'
      'BlockIndent'
      'DefaultStyles.CurrentLine.Enabled'
      'DisableFolding'
      'HorzRuler.Height'
      'HorzRuler.Visible'
      'LineNumbers.Margin'
      'LineNumbers.NumberingStyle'
      'LineNumbers.Visible'
      'LineSpacing'
      'RightMargin'
      'SelectModeDefault'
      'ShowRightMargin'
      'StapleOffset'
      'StaplePen.Style'
      'TabList.AsString'
      'TabMode'
      'WordWrap'
      'ecACP.FilterType'
      'ecACP.DropDownCount'
      'SyntKeyMapping.AsString'
      ''
      ''
      ''
      '')
    Left = 368
    Top = 276
  end
  object ecSyntPrinter: TecSyntPrinter
    Units = puMM
    MarginLeft = 20.000000000000000000
    MarginRight = 10.000000000000000000
    MarginTop = 10.000000000000000000
    MarginBottom = 10.000000000000000000
    Orientation = poPortrait
    FontHeader.Charset = DEFAULT_CHARSET
    FontHeader.Color = clWindowText
    FontHeader.Height = -13
    FontHeader.Name = 'Courier New'
    FontHeader.Style = []
    FontFooter.Charset = DEFAULT_CHARSET
    FontFooter.Color = clWindowText
    FontFooter.Height = -13
    FontFooter.Name = 'Courier New'
    FontFooter.Style = []
    Header = #9#9'#title#'#13#10' '#13#10
    Footer = ' '#13#10'#datetime#'#9#9'Page #page#'#13#10
    Copies = 1
    Options = [mpWordWrap, mpBlockHighlight, mpBackColor, mpHideCollapsed, mpBlockStaples]
    FontLineNumders.Charset = DEFAULT_CHARSET
    FontLineNumders.Color = clWindowText
    FontLineNumders.Height = -11
    FontLineNumders.Name = 'Courier New'
    FontLineNumders.Style = []
    LineNumbersPos = lnpLeft
    PrintSelection = False
    Left = 453
    Top = 264
  end
  object PopupEditor: TSpTBXPopupMenu
    Images = ImageListIcons
    OnPopup = PopupEditorPopup
    Left = 352
    Top = 304
    object TBXItemCtxUndo: TSpTBXItem
      Action = ecUndo
      ImageIndex = 10
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxRedo: TSpTBXItem
      Action = ecRedo
      ImageIndex = 11
      OnSelect = ButtonOnSelect
    end
    object TBXSeparatorItem14: TSpTBXSeparatorItem
    end
    object TBXItemCtxCut: TSpTBXItem
      Caption = 'Cut'
      Hint = 'Cut selection to clipboard'
      ImageIndex = 6
      OnClick = TBXItemCtxCutClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxCopy: TSpTBXItem
      Caption = 'Copy'
      Hint = 'Copy selection to clipboard'
      ImageIndex = 5
      OnClick = TBXItemCtxCopyClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxPaste: TSpTBXItem
      Caption = 'Paste'
      Hint = 'Paste clipboard'
      ImageIndex = 7
      OnClick = TBXItemCtxPasteClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxDel: TSpTBXItem
      Caption = 'Delete'
      Hint = 'Clear current selection'
      ImageIndex = 8
      OnClick = TBXItemCtxDelClick
      OnSelect = ButtonOnSelect
    end
    object TBXSeparatorItem13: TSpTBXSeparatorItem
    end
    object TBXItemCtxSelectAll: TSpTBXItem
      Caption = 'Select all'
      Hint = 'Select all text'
      ImageIndex = 9
      OnClick = TBXItemCtxSelectAllClick
      OnSelect = ButtonOnSelect
    end
    object TBXSeparatorItem23: TSpTBXSeparatorItem
    end
    object TBXItemCtxCopyUrl: TSpTBXItem
      Caption = 'Copy link'
      Hint = 'Copy URL to clipboard'
      Enabled = False
      ImageIndex = 25
      OnClick = TBXItemCtxCopyUrlClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxOpenSel: TSpTBXItem
      Hint = 'Open selected filename in separate tab'
      Enabled = False
      OnClick = TBXItemCtxOpenSelClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxAddColor: TSpTBXItem
      Caption = 'Add to recent colors'
      Hint = 'Add color token to "Recent colors" menu'
      Enabled = False
      OnClick = TBXItemCtxAddColorClick
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxFindID: TSpTBXItem
      Caption = 'Go to definition'
      Hint = 'Go to definition of identifier (only with plugin installed)'
      Enabled = False
      OnClick = TBXItemCtxFindIDClick
      OnSelect = ButtonOnSelect
    end
    object TBXSubmenuItemCtxMore: TSpTBXSubmenuItem
      Caption = 'more'
      OnPopup = TBXSubmenuItemCtxMorePopup
      object TBXItemCtxPasteNoCurChange: TSpTBXItem
        Caption = 'Paste, keep position'
        Hint = 'Paste from clipboard, then restore caret position'
        OnSelect = ButtonOnSelect
      end
      object TBXItemCtxPasteToColumn1: TSpTBXItem
        Caption = 'Paste, to 1st column'
        Hint = 'Paste into first column of current line'
        OnSelect = ButtonOnSelect
      end
      object TBXItemCtxPasteAsColumn: TSpTBXItem
        Caption = 'Paste, as column block'
        OnClick = TBXItemCtxPasteAsColumnClick
      end
      object TBXItemCtxPasteBkmkLines: TSpTBXItem
        Caption = 'Paste, into bookmarked lines'
        OnClick = TBXItemCtxPasteBkmkLinesClick
      end
      object TBXSeparatorItem80: TSpTBXSeparatorItem
      end
      object TBXItemCtxCopyAppend: TSpTBXItem
        Caption = 'Copy/Append'
        Hint = 'Append selection to clipboard'
        OnClick = TBXItemCtxCopyAppendClick
        OnSelect = ButtonOnSelect
      end
      object TBXItemCtxCutAppend: TSpTBXItem
        Caption = 'Cut/Append'
        Hint = 'Cut selection and append it to clipboard'
        OnClick = TBXItemCtxCutAppendClick
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem34: TSpTBXSeparatorItem
      end
      object TBXItemCtxCopyHTML: TSpTBXItem
        Caption = 'Copy as HTML'
        OnSelect = ButtonOnSelect
      end
      object TBXItemCtxCopyRTF: TSpTBXItem
        Caption = 'Copy as RTF'
        OnClick = ecCopyAsRTFExecute
        OnSelect = ButtonOnSelect
      end
    end
    object TBXItemCtxCustomize: TSpTBXItem
      Caption = 'Customize...'
      ImageIndex = 4
      OnClick = TBXItemCtxCustomizeClick
    end
    object TBXSeparatorItem45: TSpTBXSeparatorItem
    end
    object TBXItemCtxTool1: TSpTBXItem
      OnClick = TBXItemCtxTool1Click
    end
    object TBXItemCtxTool2: TSpTBXItem
      OnClick = TBXItemCtxTool2Click
    end
    object TBXItemCtxTool3: TSpTBXItem
      OnClick = TBXItemCtxTool3Click
    end
    object TBXItemCtxTool4: TSpTBXItem
      OnClick = TBXItemCtxTool4Click
    end
    object TBXItemCtxTool5: TSpTBXItem
      OnClick = TBXItemCtxTool5Click
    end
    object TBXItemCtxTool6: TSpTBXItem
      OnClick = TBXItemCtxTool6Click
    end
    object TBXItemCtxTool7: TSpTBXItem
      OnClick = TBXItemCtxTool7Click
    end
    object TBXItemCtxTool8: TSpTBXItem
      OnClick = TBXItemCtxTool8Click
    end
    object TBXItemCtxTool9: TSpTBXItem
      OnClick = TBXItemCtxTool9Click
    end
    object TBXItemCtxTool10: TSpTBXItem
      OnClick = TBXItemCtxTool10Click
    end
    object TBXItemCtxTool11: TSpTBXItem
      OnClick = TBXItemCtxTool11Click
    end
    object TBXItemCtxTool12: TSpTBXItem
      OnClick = TBXItemCtxTool12Click
    end
    object TbxItemCtxTool13: TSpTBXItem
      OnClick = TbxItemCtxTool13Click
    end
    object TbxItemCtxTool14: TSpTBXItem
      OnClick = TbxItemCtxTool14Click
    end
    object TbxItemCtxTool15: TSpTBXItem
      OnClick = TbxItemCtxTool15Click
    end
    object TbxItemCtxTool16: TSpTBXItem
      OnClick = TbxItemCtxTool16Click
    end
    object TbxSubmenuItemCtxPlugins: TSpTBXSubmenuItem
      Caption = 'Plugins'
      Visible = False
    end
  end
  object ImgListGutter: TTBImageList
    AllocBy = 30
    Left = 288
    Top = 192
    Bitmap = {
      494C010117001800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000006000000001002000000000000060
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001AA41C001AA41C00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C0550000C055000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000022B72B002DCE3D0025BE2F0021B529000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BF540000D47A0B00C0550000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000000000000020B4
      270031D548002DD4410023CD350025BD2E0022B62A0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BE510000F4BA2300D5770800C9681A000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001EB4240031D4
      4A0030D74A004ADE63006DE4810025CE360024BF2F0021B52900000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000BE510000E6910100F0AD1500D4760800C968
      1900000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000002516A0001F19BD001A12B7001B12
      B8001B12B7001A12B7001A12B6001B12B5001D16B4001C14B3001D18B4001A10
      B300190DB200221FCB001F1ECD002A29C100000000001CB41E0033D44D0035DA
      530056E06D0051E167009BF1B00079E78D0022CE350024BD2E001AA51E000000
      000000000000000000000000000000000000CA671300C45E0600C45E0700C55F
      0800C5600900C5600A00C5610B00CA670900E9930000E18B0000F0A90E00D073
      0A00C96818000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000001820D4002C4AF2001930EE001C31
      EE00172DEE001629EE001328ED001223ED00101FED000F1BEC000D16EC000C12
      EC000B0EEB000A0BEA000A07EC000301CD001C9B210030D14A0039DD5D005FE5
      780038C5400011B4130022BC2700A6F5B8006CE3810021CF340021B529001FAE
      260000000000000000000000000000000000DC8C2500FFE76700FFD55500FDCD
      4700FCC63E00F8BC3300F5B42700F3AB1C00ED9F1200E9950500E48C0000ED9E
      0200CE720C00C968170000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000005155E7004674FF002148FF002A50
      FF00294BFF002646FF002341FF00203DFF001D38FF001B35FF00182DFF001628
      FF001421FF00121CFF001118FF00070BE00030C7410041E1690073E8910045CA
      4E000D9D0B000000000011A310002DC03200AFF7C0005BDF6F0022CF360025BE
      3000169A1800000000000000000000000000DE912800FFE67600FAD06300F8CD
      5600F7CA4D00F6C44300F4BD3900F2B32F00EFA82400EEA41A00EC9C0E00E68F
      0200EF9B0000D27C1600C7631200000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007674ED0081A0FF004668FF003256
      FF002649FF002445FF002140FF001D3BFF001A36FF001732FF00142EFF00122A
      FF000F25FF000D1DFF000E1EFF000906E6002BC1350080EB9E005BD36B000C9F
      0A000000000000000000000000000EA70D003CC64700B3F8C50046DA5C0024D0
      380020AD2500159814000000000000000000E3982E00FFEB8300FBDA6F00F9D3
      6500F9CF5C00F7C95200F6C74900F5BF4000F3B63500F1B02C00EFA92100EDA4
      1800E68A0000F6BF2900EDBD6500C96511000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006F6FF2008EB0FF007493FF007594
      FF006989FF005578FF00476BFF003F60FF003252FF002E4DFF002B49FF002944
      FF002541FF00223AFF00223CFF001C1EF1000000000010B8390013B83A000000
      0000000000000000000000000000000000000CA10B0053CE6000B3F7C70041DA
      560026D039001CA92100159A140000000000E9A23100FFF08E00FDE17A00FCDC
      7200FBD76900F9D26000F8CB5500F7C84E00F5C54700F4BD3C00F3B53400EFA7
      1B00F2B62B00F5D67500DD963B00C5600D000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007176FF00A6C4FF0091ACFF0094B1
      FF0096AFFF0095B0FF0094B0FF0093B0FF0093ACFF0090AAFF008EA6FF008CA4
      FF008A9FFF00869CFF0088A6FF006168FF000000000000000000000000000000
      000000000000000000000000000000000000000000000DA70C006BD97B00BFF9
      D10044DC5A0024CB360019A41C001BA62500EDAC3800FFF49D00FEE78900FEE3
      8000FDE07A00FBDC7100FBD76900FAD26100F7CD5500F6C95100F5BD3600F2BD
      3800FCDC6E00DE922C00C45D0B00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000006B5DE4007D7FFE007877FC007878
      FB007878FB007878FA007878FB007776F8007771ED007770E9007571EF007674
      F1007467E5006F61E3005F72E7004758DA000000000000000000000000000000
      000000000000000000000000000000000000000000000000000017B71F0068DB
      7900B8F8CB004ADF5F0022C6330018A11B00F1BC5A00FFFFFA00FFFFE300FFFF
      E000FFFEDD00FFFCD800FFFDD900FFF7C700FBD46300F8C94700F7D47400FEE6
      8C00E3931F00C45D0D0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000001ABA
      220054D464009DEEAD004FE167001FB52B00EEA42A00EEB14400EDAB3E00ECAA
      3D00EBA83C00EAA83D00E8A03700E7A33B00FDDE6700FDE9A200FFF3B100E59F
      2E00C25809000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000016B81E0050D55F007EE690001CB627000000000000000000000000000000
      0000000000000000000000000000ECA01A00FFFBC800FFFCCC00E5A54000C157
      0700000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000003BCF4C0091DC9100000000000000000000000000000000000000
      0000000000000000000000000000F3B83B00FFFEC800E5A63F00C15605000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000F8BE3300E4A54100C1550500000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000DA8A2600C157080000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000090C5000090C5000090
      C5000090C5000090C5000090C5000090C5000090C5000090C5000090C5000090
      C5000090C5000090C5000090C500000000000000000000000000000000000000
      0000000000000701AF000702B9000500A9000500A9000702B9000701AF000000
      000000000000000000000000000000000000000000002C2BEB003B44EB003B44
      EB00393EE600393EE6003237E0001119DA001119DA002B2DD4003031D7002B2D
      D4002B29CF002926CE001410B300000000000000000000000000000000000000
      0000000000001A751C001A751C000B6F0F000B6F0D00086B0B00086B0B000000
      0000000000000000000000000000000000000090C5000EB8E90010CAFA0010CA
      FA0010CAFA0010CAFA0010CAFA0010CAFA0010CAFA0010CAFA0010CAFA0010CA
      FA0010CAFA0010CAFA000AB4E6000090C5000000000000000000000000000701
      AF000D08DF001712F6001712F4000F0BF1000E0AF0001713F3001813F5000D08
      DF000701AF000000000000000000000000003C39EE006D97F6004E71F4004E71
      F400496BF4004461F2002C4CF400889AF90096A6FA00112FF1003147F900303E
      F8002D34F9002D34F9002C2CFB001410B3000000000000000000000000000000
      0000000000001A751C006ED0840021BE4C0021BE4A001CA83900086B0B000000
      0000000000000000000000000000000000000395CA0012B8E80018CDFA0018CD
      FA0018CDFA0018CDFA0018CDFA00000000000000000018CDFA0018CDFA0018CD
      FA0017CDFA0017CDFA000FB6E7000395CA0000000000000000000701AF001614
      F9001816F6001A17F1001511F1009B98F9009B98F9001511F1001A17F1001A16
      F4001715F8000701AF0000000000000000003F3DF000688BF500425CF1004461
      F200425CF1002945EF006376F300FEFEFE00FEFEFE005B6BF1001B2CED002E39
      ED002B30EC002729EC002A27FE00140FB4000000000000000000000000000000
      0000000000001A751C006ED1840021C04F0021C04D001CAA3B00086B0B000000
      00000000000000000000000000000000000000000000059ACD0023D1FA0024D1
      FA0024D1FA0024D1FA0024D1FA00000000000000000024D1FA0023D1FA0024D1
      FA0024D1FA0024D1FA00059ACD0000000000000000000906C1001A1EF8001D20
      F2001D20F200191CF200494CF400FFFFFF00FFFFFF00494CF400191CF2001D20
      F2001D20F2001B1FF7000906C10000000000000000006376F3004E71F4004461
      F2004461F2002F4BEF00566CF200FEFEFE00FEFEFE004E60F0001F30EE002E39
      ED002B30EC002C2CFB00221EDD00000000000000000000000000000000000000
      0000000000001A751C006ED287001EC2520021C250001CAD3E00086B0B000000
      00000000000000000000000000000000000000000000079ED1001DBEEA0031D6
      FB0031D6FB0031D6FB0031D6FB0031D6FB0031D6FB0031D6FB0031D6FB0031D6
      FB0031D6FB001FBBE700079ED10000000000000000000D08DF001C23F7001D24
      F2001D24F2001A21F200373FF300FFFFFF00FFFFFF00373FF3001A21F2001D24
      F2001D24F2001D25F500110EE20000000000000000003C33EC00678AF5003C59
      F1004461F200425CF1002542EF003F52EF003F52F0000D27EC00313FEF002E39
      ED002B30EC002C2CFB001F1BAE00000000000000000000000000000000000000
      0000000000001A751C006FD58C0021C353001EC353001CAF3F00086B0B000000
      000000000000000000000000000000000000000000000000000009A3D60041DB
      FB0041DBFC0041DCFC0041DCFC00000000000000000041DBFC0041DCFC0041DC
      FC0041DCFC0009A3D60000000000000000000F0CD200202EFA00202DF300202D
      F300202DF300202DF3001C2AF3001426F2001426F2001C2AF300202DF300202D
      F300202DF300202DF300212EF4002B25D20000000000000000004C54EE004E71
      F400425CF100304CEF00566CF200FEFEFE00FEFEFE00495EF0001B2CED002E39
      ED002D34F9001F1CD0000000000000000000208329001A751C001A751C001A75
      1C001A751C00086B0B005CCB7C001FC65A001FC658001BAE4200086B0B00086B
      0B00086B0B00086B0B00086B0B00086B0B0000000000000000000BA7DA0039D1
      F40051E1FC0051E1FC0051E1FC00000000000000000051E1FC0051E1FC0051E1
      FC0040D0F1000BA7DA0000000000000000000F0CD2001F2EEA002231F3002231
      F3002231F3002130F3001221F200FFFFFF00FFFFFF001221F2002130F3002231
      F3002231F3002231F3002232F4002B25D20000000000000000003C33EC006980
      F5003C59F100203DEE005F74F300FEFEFE00FEFEFE005B6BF100172AED00313D
      F4002C30F0004B47BB000000000000000000278D34001BB44D001BB44D001BB4
      4D001BB44D001BB44D005CCB7C001FC95D001FC85B001BAE42001BAE42001BB4
      4D001BB44D001BB44D001BB44D0010801C000000000000000000000000000EAD
      DF0063E7FD0063E7FD0063E8FD00000000000000000063E7FD0063E8FD0063E8
      FD000EADDF000000000000000000000000002B25D200273DF0002238F300253B
      F300253BF3001F36F3005168F500FFFFFF00FFFFFF005168F5001F36F300253B
      F300253BF300253BF300253BF3000C05D2000000000000000000000000004C54
      EE007C96F7003C59F1006376F300FEFEFE00FEFEFE005161F1001023ED002B3A
      F9003C33EC000000000000000000000000002893380018D471001CD573001CD3
      6E001ED16D001ED069001ED068001FCD65001FCD62001FC95E001FC95D001FC8
      5B001FC657001FC5570021C555001287200000000000000000000000000010B2
      E4005EE1F80074EDFD0074EDFD00000000000000000074EDFD0074EDFD005EE1
      F80010B2E400000000000000000000000000453BE800647AF7004058F500263D
      F400283FF400223AF400546CF600FFFFFF00FFFFFF00546CF600223AF400283F
      F400283FF400283FF400283FF4000800C8000000000000000000000000003C33
      EC008B99F5006980F5008997F600FEFEFE00FEFEFE007180F3004151F500585F
      EF004C54EE0000000000000000000000000029963B0017D875001CD876001CD5
      73001CD571001ED36D001ED16B001ED068001ECE66001FCD63001FCB60001FC9
      5D001FC85D001FC65A001FC65800128B23000000000000000000000000000000
      000012B8E80083F3FE0084F3FE00000000000000000084F3FE0083F3FE0012B8
      E800000000000000000000000000000000005E55EE00637BF400647CF700687F
      F7006078F7002C47F500566EF600FFFFFF00FFFFFF005871F600253FF4002944
      F4002742F4004A65F600617AF9000C05D2000000000000000000000000000000
      00006864E900728AF9008393F600FEFEFE00FEFEFE008393F6005C6BF9005956
      D100000000000000000000000000000000002B9E41004CEFA3004EF0A2004FEE
      9E004FED9C0053E89A0018D570001CD370001ED36E001DCF68001CCC610052E3
      8D0052E28B0052E0880052DD86001E9832000000000000000000000000000000
      000014BCEC0075EAF90091F8FE00000000000000000091F8FE0075EAF90014BC
      EC00000000000000000000000000000000005E55EE006C88FB00657EF700667F
      F7006780F700667FF70092A6FA00FFFFFF00FFFFFF00748DF7004360F6005975
      F7006780F7006880F7006E8AFA000C05D2000000000000000000000000000000
      00004C54EE00728AF9008393F600FEFEFE00FEFEFE008393F6005C6BF9004C54
      EE0000000000000000000000000000000000249E3C00249E3C00249E3C00249E
      3C00249E3C00249E3C006EE5A0001CD673001CD5710019C35E00128C2300128C
      2300128C2300128C2300128C2300128C23000000000000000000000000000000
      00000000000016C0F0009EFCFE0000000000000000009EFCFE0016C0F0000000
      000000000000000000000000000000000000000000005B58FB0090AAFC006985
      F7006A86F7006683F70092A8FA00FFFFFF00FFFFFF0092A8FA006683F7006A86
      F7006985F70092ABFD004B4ACD00000000000000000000000000000000000000
      000000000000737AF000869CFA00FEFEFE00FEFEFE007F8FFB005057E6000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E9832006DEAA6001BDB7C001BDB7B001BC864001E9832000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000018C5F50085EFFA00A6FFFF00A6FFFF0085EFFA0018C5F5000000
      00000000000000000000000000000000000000000000443AF400828DFC006A87
      F7006D89F7006B87F70099AEFA00FFFFFF00FFFFFF0099AEFA006B87F7006D89
      F7006A87F700727CE5003C35DB00000000000000000000000000000000000000
      000000000000746DE5008393F6008B99F500919DF6005C73FA006D68D5000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E98320070ECA60019DE810019DC7E001BCB68001E9832000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001AC8F700A6FFFF00A6FFFF001AC8F700000000000000
      00000000000000000000000000000000000000000000000000004338EF00828D
      FB00AAC2FF007A95FD006D8CFA00C9D4FC00C9D4FC006B8AF8007995FA00ABC3
      FF007D8BEF004338EF0000000000000000000000000000000000000000000000
      000000000000000000006E72E9006F8AFA005C73FA005C5FE200000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E9832006FEEAA0019E0840019E0840019D273001E9832000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000001BCAF90085EFFA0085EFFA001BCAF900000000000000
      000000000000000000000000000000000000000000000000000000000000443A
      F4004338EF00ACC2FF00A6BDFE0094ADFB0094ADFB00A6BDFB00ACC3FF005150
      DC003B35DE000000000000000000000000000000000000000000000000000000
      000000000000000000004C54EE00787DEB006E72E9004C54EE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000001E9832006EF0AA0012DE7F0012DE7F0014D370001E9832000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000001BCAF9001BCAF90000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004338EF004338EF004338EF004338EE004B4ADD004B4ADD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000004C54EE004C54EE0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000249E3C002CBB530031C1570031C157002CBB5300249E3C000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C19A8000A8724E009D6037009D603700A8724E00C19A80000000
      0000000000000000000000000000000000000000000000000000000000000000
      00003F3EB7001210C300100DC000100DC0001210C300100DC000100DC0003C39
      B60000000000000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C19A
      800098572B009451240094512400945124009451240094512400945124009857
      2B00C09A7F000000000000000000000000000000000000000000000000003938
      B9001715EB00100EF7000F0CF4000F0CF4000F0CF4000F0BF500100EF7000C09
      EA003330B900000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C6840000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000B48566009451
      2400945124009451240094512400945124009451240094512400945124009451
      240094512400B4856600000000000000000000000000000000003B38BF00191A
      EC001417F4001010ED001010ED001010ED001010ED000F0FED000F0FED00100F
      F2000F0DE9003432BE000000000000000000000000003636360063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      6300AF7B4E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000000000000000
      00000000000000000000000000000000000000000000C19A8000945124009451
      240094512400D8D8D800F3F3F300FFFFFF00FFFFFF00F3F3F300D8D8D8009451
      24009451240094512400C19A800000000000000000003C39C5001A1FEB001417
      F4001115EE001115EE001115EE001115EE001115EE001115EE001115EE001115
      EE001113F2001010EA003634C30000000000000000003D3D3D0063636300CC99
      6600CC996600CC9966003633FF00CC996600CC9966003633FF00CC996600CC99
      6600B58153000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000096552900945124009451
      24009451240094512400EFEFEF00FFFFFF00FFFFFF00EFEFEF00945124009451
      2400945124009451240096552900000000004543CC001D27EF000A16F5000E1A
      F100141DEF001119F1001119F100141BEF001016F0000A12F0001016F0001016
      F0000F14F1001417F4001215EA003E3DCC00000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A003B38FF004542FF004542FF003B38FF00D09D6A00D09D
      6A00B58153000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      000000000000000000000000000000000000C29C830094512400924E20009450
      23009451240094512400EFEFEF00FFFFFF00FFFFFF00EFEFEF00945124009451
      2400945124009451240094512400C19A80002126D9002934E600151DF700151D
      F700151DF700151DF700151DF700151DF700151DF700151DF700151DF700151D
      F700151DF700151DF700151DF7001113D50000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00433FFF006969FF006969FF00433FFF00D3A06D00D3A0
      6D00BA8656000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000800000000000
      000000000000000000000000000000000000B07E5C00A66E49009B5C32009451
      2400924E200093502300EFEFEF00FFFFFF00FFFFFF00EFEFEF00945124009451
      2400945124009451240094512400A8724E002126D900AFAAE600FFFFFF00FFFF
      FF00292AD100FFFFFF000006DA000006DA00EBE8F200FFFFFF00EBE8F2002B34
      E100FFFFFF000E1AF1001520F000191DD900000000004444440074747400D9A6
      7300D9A67300D9A673004542FF006969FF006969FF004542FF00D7A47100D7A4
      7100BE8A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000800000000000
      000000000000000000000000000000000000AA755200B07E5C00AD7A5800A872
      4E009E633A0098572B00F3F3F300FFFFFF00FFFFFF00EFEFEF00935023009350
      23009450230094502300945124009D6037002B32E0000816E9008F88EC00FFFF
      FF002B34E100FFFFFF002B34E1002B34E100FFFFFF000D21F300FFFFFF002B34
      E100FFFFFF00FFFFFF00FFFFFF000D0FD900000000004444440074747400DBA8
      7500DBA87500DBA875004542FF006969FF006969FF004542FF00D9A67300D9A6
      7300C18E5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      000000000000000000000000000000000000AC785500B0805E00B0805E00B080
      5E00B0805E00AF7D5C00EBEBEB00EFEFEF00EFEFEF00E3E3E300965529009451
      24009451240093502300935023009D6037004B51E800AFAAE600FFFFFF000611
      E4000611E400FFFFFF002B34E1002B34E100FFFFFF001029F200FFFFFF002B34
      E100FFFFFF00766FED00FFFFFF002D2CDF00000000004D4D4D007A7A7A00DEAB
      7800DEAB7800DEAB78004D47FF007A7AFF007A7AFF004D47FF00DEAB7800DEAB
      7800C18E5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      000000000000000000000000000000000000B2816100B4836400B2816100B281
      6100B2816100CDCDCD00D8D8D800DCDCDC00DCDCDC00D6D6D600AA755200A66E
      4900A3694200A0653D009E633A00AC785500575FEC00FFFFFF00FFFFFF00AFAA
      E600FFFFFF00FFFFFF00FFFFFF00AFAAE600EBE8F200FFFFFF00EBE8F2002B34
      E100FFFFFF00FFFFFF00FFFFFF004041E800000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B004D47FF007A7AFF007A7AFF004D47FF00E1AE7B00E1AE
      7B00C69260000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      000000000000000000000000000000000000C5A18900B2846400B4856600B485
      6600B6886900B4856600B2846400B2816100B2816100B0805E00AF7D5C00AE7C
      5A00AC785500AA755200A7704C00C49F86006067EE004E67F3004E67F3004E67
      F3004E67F3004E67F3004E67F3004E67F3004E67F3004E67F3004E67F3004E67
      F3004E67F3004E67F3004E67F300424AEC00000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00514CFF008383FF008383FF004D47FF00E3B07D00E3B0
      7D00C99663000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      00000000000000000000000000000000000000000000AD7A5800B88C6E00B78A
      6C00B78A6C00B6886900D2BDB000FBFBFB00FBFBFB00D0BBAD00B0805E00AE7C
      5A00AC785500AC785500A46C4600000000006D6BEE00778DF6005374F4004A69
      F4005170F4004C6AF4004A69F400506EF4005170F4004765F3004C6AF400506E
      F4004866F4004A69F4004E67F3006664ED00000000005454540054545400CC99
      6600CC996600CC996600514CFF008383FF008383FF00514CFF00CC996600CC99
      6600C99663000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      00000000000000000000000000000000000000000000C5A18900B78A6C00BB90
      7500B88C6E00B88B6D00DCDCDC00EBEBEB00EBEBEB00DCDCDC00B2816100B07E
      5C00AF7D5C00AA755200C49F860000000000000000006A67F1007D91F6005F7C
      F5005875F4005E78F5005875F4005875F4005875F4005875F4005875F4005672
      F4005875F400546DF4005F5EEF00000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300443EF6008C8CFF008C8CFF00443EF600F7F7F6000000
      0000BBBBAA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD937800B98D
      7000BD947800BC917500C1AEA100CDCDCD00CDCDCD00BFAB9D00B2846400B483
      6400AD7A5800B98D7000000000000000000000000000000000006A67F1007D91
      F6006282F6005875F4005875F4005E78F5005875F4005875F4005875F4005B7C
      F4005672F400605EF200000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600777FE700555BEF00555BEF00777FE700CC996600CC99
      6600D8B28C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C5A1
      8900B2816100BB907500BD947800BC917500B98D7000B88B6D00B4836400AA75
      5200C49F86000000000000000000000000000000000000000000000000006B68
      F4008095F7007190F7006C8BF7006D8CF6006D8CF6006C8BF7006D8CF6005E78
      F500605EF2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C5A18900B6886900B2816100B2816100B4856600C5A189000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000716EF400686FF500636AF500646BF500646BF500646BF500676EF5006D6B
      F400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCBDB200A5999000A599
      9000A5999000A5999000A5999000A5999000A5999000A5999000A5999000A599
      9000A5999000AEA19800CCBDB2000000000000000000BDB1A9007D7670006A64
      60006A6460006A6460006A6460006A6460006A6460006A6460006A6460006A64
      60006A6460007D767000BDB1A90000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000CCBDB200B8ADA600F5ECE500F5EC
      E500F5ECE500F5ECE500F5ECE500F5ECE500F5ECE500F5ECE500F5ECE500F5EC
      E500F5ECE500ECE3DC00B8ADA600CCBDB200BDB1A90080787300D7CAC000F6E6
      DB00F6E6DB00F6E6DB000000000022667B005B65680084848400848484008B8B
      8B008B8B8B009595950095959500BDB1A900000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000AEA19800FCF3EB00FBECE100FBEC
      E100FBECE100FBECE1000000000022667B005B65680084848400848484008B8B
      8B008B8B8B009595950095959500AEA198007D767000C2B7B000EADBD100F9E9
      DD00F9E9DD00F9E9DD00408BA300A5D4E5004FC0D300829FA800F9E9DD00F9E9
      DD00F9E9DD00F9E9DD00F9E9DD007D767000000000003636360063636300C996
      6300C9966300C9966300F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300F7F7F600F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000A5999000FFFAF400FBECE100FBEC
      E100FBECE100FBECE100408BA300A5D4E5004FC0D300829FA800FBECE100FBEC
      E100FBECE100FBECE100FFFAF400A59990006A646000CDC1B900EADBD100F9E9
      DD00F9E9DD00F9E9DD00CAE0E7004A96AE00CBEDFE004FC0D30052879800F9E9
      DD00F9E9DD00F6E6DB00F6E6DB006A646000000000003D3D3D0063636300CC99
      6600CC996600F7F7F600F7F7F600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600CC996600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000A5999000FFFAF400FBECE100FBEC
      E100FBECE100FBECE100CAE0E7004A96AE00CBEDFE004FC0D30052879800FBEC
      E100FBECE100FBECE100FFFAF400A59990006A646000CDC1B900EADBD100F9E9
      DD00F9E9DD00F9E9DD00F9E9DD00ADD3DF0057A2BA0065DCED0033A1B5000873
      8900F9E9DD00F6E6DB00F6E6DB006A646000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00F7F7F600F7F7F600D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000A5999000FCF5F100F8E9DE00F8E9
      DE00F8E9DE00F8E9DE00F8E9DE00ADD3DF0057A2BA0065DCED0033A1B5000873
      8900F8E9DE00F8E9DE00FCF5F100A59990006A6460000000000022667B00636D
      70008B8B8B008B8B8B0095959500B2B2B20046AEBE000196AC007AE7F8004EBE
      D000006D8300F6E6DB00F6E6DB006A64600000000000444444006C6C6C00D3A0
      6D00D3A06D00F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00F7F7F600F7F7F600F7F7F600F7F7F600D3A06D00D3A0
      6D00BA865600000000000000000000000000A59990000000000022667B00636D
      70008B8B8B008B8B8B0095959500B2B2B20046AEBE000196AC007AE7F8004EBE
      D000006D8300F2E4D900FCF3EB00A59990006A646000408BA300A5D4E5004FC0
      D300829FA800F9E9DD00F9E9DD00F9E9DD00F9E9DD004B4B490008869A004FC0
      D30032A9BB004B4B4900F6E6DB006A646000000000004444440074747400D8A5
      7200D8A57200D8A57200F7F7F600F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300F7F7F600F7F7F600D7A47100F7F7F600F7F7F600D7A47100D7A4
      7100BE8A5A00000000000000000000000000A5999000408BA300A5D4E5004FC0
      D300829FA800F2E4D900F2E4D900F2E4D900F2E4D9004B4B490008869A004FC0
      D30032A9BB004B4B4900FCF3EB00A59990006A646000CAE0E7004A96AE00CBED
      FE004FC0D30052879800F9E9DD00C1C1C1007B554900943A1E00705445008484
      8400FEFEFE00ABABAB000707AB006A646000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600DBA87500F7F7F600F7F7F600D8A57200D8A5
      7200C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600D9A67300F7F7F600F7F7F600D9A67300D9A6
      7300C18E5D00000000000000000000000000A5999000CAE0E7004A96AE00CBED
      FE004FC0D30052879800F5ECE500C1C1C1007B554900943A1E00705445008484
      8400FEFEFE00ABABAB000707AB00A59990006A646000C9BEB500ADD3DF0057A2
      BA0065DCED004FC0D300087389007D594E00943A1E00943A1E00943A1E00C1C1
      C100848484007474FD004646E1006A646000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000A5999000FEFEFE00ADD3DF0057A2
      BA0065DCED004FC0D300087389007D594E00943A1E00943A1E00943A1E00C1C1
      C100848484007474FD004646E100A59990006A646000C6BBB300E3D5CB004EBE
      D000029AB1007AE7F8004FC0D300006D8300943A1E00943A1E00F0E0D500F0E0
      D5008F8FF2001E1EE3004545DB006A646000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000A5999000FEFEFE00FBF0E7004EBE
      D000029AB1007AE7F8004FC0D300006D8300943A1E00943A1E00FBF0E700FBF0
      E7008F8FF2001E1EE3004545DB00A59990006A646000C2B7B000DCCEC400EADB
      D1008CD5E00018A2B8007AE7F80032A9BB004B4B4900EADBD100EADBD100EADB
      D100EADBD100EADBD100EADBD1006A646000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000A5999000FEFEFE00FCF3EB00FCF3
      EB008CD5E00018A2B8007AE7F80032A9BB004B4B4900FCF3EB00FCF3EB00FCF3
      EB00FCF3EB00FCF3EB00FEFEFE00A59990006A646000BDB1A900DCCEC400E3D5
      CB00E3D5CB00C1C1C10084848400FEFEFE00ABABAB000707AB00E3D5CB00E3D5
      CB00E3D5CB00E6D8CD00E6D8CD006A646000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000A5999000FEFEFE00FCF5F100FCF5
      F100FCF5F100C1C1C10084848400FEFEFE00ABABAB000707AB00FCF5F100FCF5
      F100FCF5F100FCF5F100FEFEFE00A59990006A646000B1A8A100CDC1B900DCCE
      C400DCCEC400DCCEC400C1C1C100848484007474FD004646E100DCCEC400DCCE
      C400DCCEC400E3D5CB00DCCEC4006A6460000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA00000000000000000000000000AEA19800FFFAF400FFFAF400FFFA
      F400FFFAF400FFFAF400C1C1C100848484007474FD004646E100FFFAF400FFFA
      F400FFFAF400FEFEFE00FFFAF400AEA198007D767000A69E9800BDB1A900C9BE
      B500C9BEB500C9BEB500C9BEB5008F8FF2001E1EE3004545DB00C9BEB500C9BE
      B500C9BEB500CCC0B700A49B95007D76700000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C00000000000000000000000000CCBDB200B8ADA600FCF5F100FCF5
      F100FCF5F100FCF5F100FCF5F1008F8FF2001E1EE3004545DB00FCF5F100FCF5
      F100FCF5F100EEE8E400B8ADA600CCBDB200BDB1A90079726E00A49B9500B1A8
      A100B1A8A100B1A8A100B1A8A100B1A8A100B1A8A100B1A8A100B1A8A100B1A8
      A100B1A8A100A49B9500706A6600BDB1A9000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000CCBDB200A5999000A599
      9000A5999000A5999000A5999000A5999000A5999000A5999000A5999000A599
      9000A5999000AEA19800CCBDB2000000000000000000C0B3AB00807873006A64
      60006A6460006A6460006A6460006A6460006A6460006A6460006A6460006A64
      60006A64600080787300C0B3AB00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000003636360063636300C996
      6300C9966300C9966300C9966300F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300F7F7F600F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300C9966300F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300C9966300F7F7F600F7F7F600C9966300C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600CC996600F7F7F600F7F7F600CC996600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600CC996600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600F7F7F600F7F7F600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600F7F7F600F7F7F600CC996600CC996600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00F7F7F600F7F7F600D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D6A00D09D
      6A00B581530000000000000000000000000000000000444444006C6C6C00D3A0
      6D00F7F7F600F7F7F600D3A06D00F7F7F600F7F7F600D3A06D00D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00D3A06D00D3A06D00F7F7F600F7F7F600D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00F7F7F600F7F7F600D3A06D00F7F7F600F7F7F600D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00D3A06D00F7F7F600F7F7F600D3A06D00D3A06D00D3A0
      6D00BA865600000000000000000000000000000000004444440074747400D9A6
      7300D9A67300F7F7F600D7A47100F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300F7F7F600F7F7F600F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300F7F7F600F7F7F600F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300D9A67300D7A47100F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600F7F7F600F7F7F600D9A67300D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600DBA87500D9A67300D9A67300D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600DBA87500D9A67300D9A67300D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500DBA87500D9A67300DBA87500F7F7F600F7F7F600D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800DEAB7800F7F7F600F7F7F600F7F7F600DEAB7800DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800DEAB7800DEAB7800DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800DEAB7800DEAB7800DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800DEAB7800DEAB7800DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00E1AE7B00F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600F7F7F600F7F7F600E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C99663000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000007A7A7A00181818008F5B
      38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B38008F5B
      380092725C00000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C684000000000000000000000000000000000003636360063636300C996
      6300C9966300C9966300F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300F7F7F600F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300F7F7F600F7F7F600F7F7F600F7F7F600F7F7F600C9966300C996
      6300AF7B4E00000000000000000000000000000000003636360063636300C996
      6300C9966300F7F7F600F7F7F600F7F7F600F7F7F600C9966300C9966300C996
      6300AF7B4E00000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600F7F7F600F7F7F600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600F7F7F600F7F7F600CC996600CC996600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600F7F7F600F7F7F600CC996600CC996600CC996600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC996600CC996600CC996600F7F7F600F7F7F600CC996600CC99
      6600B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00F7F7F600F7F7F600D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D6A00D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D6A00D09D6A00D09D
      6A00B5815300000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A00D09D6A00D09D6A00F7F7F600F7F7F600D09D6A00D09D
      6A00B581530000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00F7F7F600F7F7F600D3A06D00F7F7F600F7F7F600D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00F7F7F600F7F7F600D3A06D00D3A06D00D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00D3A06D00F7F7F600F7F7F600D3A06D00D3A06D00D3A0
      6D00BA86560000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00D3A06D00D3A06D00F7F7F600F7F7F600D3A06D00D3A0
      6D00BA865600000000000000000000000000000000004444440074747400D8A5
      7200D8A57200F7F7F600F7F7F600D8A57200F7F7F600F7F7F600D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300D9A67300F7F7F600F7F7F600D7A47100D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D8A5
      7200D8A57200D8A57200D7A47100D8A57200F7F7F600F7F7F600D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400D9A6
      7300D9A67300D9A67300F7F7F600F7F7F600F7F7F600D7A47100D7A47100D7A4
      7100BE8A5A00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600DBA87500F7F7F600F7F7F600D8A57200D8A5
      7200C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500DBA87500F7F7F600F7F7F600D9A67300D9A67300D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500F7F7F600F7F7F600DBA87500F7F7F600F7F7F600D8A57200D8A5
      7200C18E5D00000000000000000000000000000000004444440074747400DBA8
      7500DBA87500DBA87500D9A67300DBA87500F7F7F600F7F7F600D9A67300D9A6
      7300C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600F7F7F600DEAB7800DEAB7800DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800F7F7F600F7F7F600DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800DEAB7800DEAB7800DEAB7800F7F7F600F7F7F600DEAB7800DEAB
      7800C18E5D00000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B00F7F7F600F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00F7F7F600F7F7F600F7F7F600F7F7F600E1AE7B00E1AE7B00E1AE
      7B00C6926000000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B07D00E3B0
      7D00C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C9966300000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600C99663000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300D7D7CD00DFDFD700E8E8E200EFEFEC00F7F7F6000000
      0000BBBBAA0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C0000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600CC996600CC996600CC996600CC996600CC996600CC99
      6600D8B28C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000600000000100010000000000000300000000000000000000
      000000000000000000000000FFFFFF00FFFFF9FFFE7F0000FFFFF0FFFE3F0000
      FFFFE07FFE1F0000FFFFC03FFE0F00000000801F000700000000000F00030000
      000004070001000000000E030000000000009F01000000000000FF8000010000
      0000FFC000030000FFFFFFE000070000FFFFFFF0FE0F0000FFFFFFF9FE1F0000
      FFFFFFFFFE3F0000FFFFFFFFFE7F00008001F81F8001F81F0000E0070000F81F
      0000C0030000F81F800180018001F81F800180018001F81FC0030000C0030000
      C0030000C0030000E0070000E0070000E0070000E0070000F00F0000F00F0000
      F00F0000F00F0000F81F8001F81FF81FF81F8001F81FF81FFC3FC003FC3FF81F
      FC3FE007FC3FF81FFE7FF81FFE7FF81FFFFFFFFFF81FF00F8007FFFFE007E007
      8007FFFFC003C0038007FEFF800180018007FCFF800100008007F83F00000000
      8007FCDF000000008007FEDF000000008007FFDF000000008007FFDF00000000
      8007FFDF000000008007FFDF800100008007FE3F800180018017FFFFC003C003
      8007FFFFE007E007FFFFFFFFF81FF00FFFFFFFFF800180018007800700000000
      8007800700000000800780070000000080078007000000008007800700000000
      8007800700000000800780070000000080078007000000008007800700000000
      8007800700000000800780070000000080078007000000008017801700000000
      8007800700000000FFFFFFFF80018001FFFFFFFFFFFFFFFF8007800780078007
      8007800780078007800780078007800780078007800780078007800780078007
      8007800780078007800780078007800780078007800780078007800780078007
      8007800780078007800780078007800780078007800780078017801780178017
      8007800780078007FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8007800780078007
      8007800780078007800780078007800780078007800780078007800780078007
      8007800780078007800780078007800780078007800780078007800780078007
      8007800780078007800780078007800780078007800780078017801780178017
      8007800780078007FFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object SyntKeyMapping: TSyntKeyMapping
    Items = <
      item
        Command = 700
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16462
              end>
          end>
        Category = 'File'
        DisplayName = 'New file'
      end
      item
        Command = 740
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24654
              end>
          end>
        Category = 'File'
        DisplayName = 'New window'
      end
      item
        Command = 701
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16463
              end>
          end>
        Category = 'File'
        DisplayName = 'Open file'
      end
      item
        Command = 702
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16467
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 113
              end>
          end>
        Category = 'File'
        DisplayName = 'Save file'
      end
      item
        Command = 706
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24659
              end>
          end>
        Category = 'File'
        DisplayName = 'Save file as'
      end
      item
        Command = 707
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Reopen file'
      end
      item
        Command = 704
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Export to RTF'
      end
      item
        Command = 705
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Export to HTML'
      end
      item
        Command = 709
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 120
              end>
          end>
        Category = 'Options'
        DisplayName = 'Dialog "Options"'
      end
      item
        Command = 710
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Customize lexer"'
      end
      item
        Command = 711
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Customize lexers library"'
      end
      item
        Command = 565
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Align tokens'
      end
      item
        Command = 562
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Sort selected lines ascending'
      end
      item
        Command = 563
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Sort selected lines descending'
      end
      item
        Command = 560
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16575
              end>
          end>
        Category = 'Comments'
        DisplayName = 'Block comment'
      end
      item
        Command = 561
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24767
              end>
          end>
        Category = 'Comments'
        DisplayName = 'Block uncomment'
      end
      item
        Command = 715
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 123
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle tree panel'
      end
      item
        Command = 712
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16466
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle read-only'
      end
      item
        Command = 730
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16469
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle word wrap'
      end
      item
        Command = 731
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle line numbers'
      end
      item
        Command = 732
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle code folding'
      end
      item
        Command = 733
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle non-printable chars'
      end
      item
        Command = 717
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16491
              end>
          end>
        Category = 'Zoom'
        DisplayName = 'Zoom in'
      end
      item
        Command = 716
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16493
              end>
          end>
        Category = 'Zoom'
        DisplayName = 'Zoom out'
      end
      item
        Command = 566
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32806
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Move lines up'
      end
      item
        Command = 567
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32808
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Move lines down'
      end
      item
        Command = 670
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16416
              end>
          end>
        Category = 'Hints'
        DisplayName = 'Auto-complete popup'
      end
      item
        Command = 652
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24608
              end>
          end>
        Category = 'Hints'
        DisplayName = 'Function parameters popup'
      end
      item
        Command = 651
        KeyStrokes = <>
        Category = 'Hints'
        DisplayName = 'Code template popup (obsolete)'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Hints'
        DisplayName = 'Context help'
      end
      item
        Command = 630
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Dialog "Print"'
      end
      item
        Command = 632
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Dialog "Print preview"'
      end
      item
        Command = 633
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Dialog "Page setup"'
      end
      item
        Command = 634
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Dialog "Printer setup"'
      end
      item
        Command = 611
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Replace next'
      end
      item
        Command = 613
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Replace all'
      end
      item
        Command = 564
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16455
              end>
          end>
        Category = 'Go to'
        DisplayName = 'Dialog "Go to"'
      end
      item
        Command = 608
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24614
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Find current word prior'
      end
      item
        Command = 607
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24616
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Find current word next'
      end
      item
        Command = 603
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Find all (mark)'
      end
      item
        Command = 602
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16498
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Find previous'
      end
      item
        Command = 601
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 114
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Find next'
      end
      item
        Command = 600
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16454
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Find"'
      end
      item
        Command = 641
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next search mark'
      end
      item
        Command = 642
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous search mark'
      end
      item
        Command = 640
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Clear search marks'
      end
      item
        Command = 620
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Lister Find'
      end
      item
        Command = 621
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Lister Find next'
      end
      item
        Command = 17
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to specified position'
      end
      item
        Command = 20
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left and up at line start'
      end
      item
        Command = 19
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 35
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to last char of line'
      end
      item
        Command = 18
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 36
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to first char of line'
      end
      item
        Command = 16
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16419
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to absolute end'
      end
      item
        Command = 15
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16420
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to absolute beginning'
      end
      item
        Command = 14
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16418
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to bottom of page'
      end
      item
        Command = 13
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16417
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to top of page'
      end
      item
        Command = 12
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left one page'
      end
      item
        Command = 11
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor right one page'
      end
      item
        Command = 10
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 34
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor down one page'
      end
      item
        Command = 9
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 33
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor up one page'
      end
      item
        Command = 8
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to end of line'
      end
      item
        Command = 7
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to beginning of line'
      end
      item
        Command = 6
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16423
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor right one word'
      end
      item
        Command = 5
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16421
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left one word'
      end
      item
        Command = 4
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor down one line'
      end
      item
        Command = 3
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 38
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor up one line'
      end
      item
        Command = 2
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 39
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor right one char'
      end
      item
        Command = 1
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 37
              end>
          end>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left one char'
      end
      item
        Command = 101
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8229
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select left one char'
      end
      item
        Command = 102
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8231
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select right one char'
      end
      item
        Command = 103
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8230
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select up one line'
      end
      item
        Command = 104
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8232
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select down one line'
      end
      item
        Command = 105
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24613
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select left one word'
      end
      item
        Command = 106
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24615
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select right one word'
      end
      item
        Command = 107
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to beginning of line'
      end
      item
        Command = 108
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to end of line'
      end
      item
        Command = 109
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8225
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select up one page'
      end
      item
        Command = 110
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8226
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select down one page'
      end
      item
        Command = 111
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select right one page'
      end
      item
        Command = 112
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select left one page'
      end
      item
        Command = 113
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24609
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to top of page'
      end
      item
        Command = 114
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24610
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to bottom of page'
      end
      item
        Command = 115
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24612
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to absolute beginning'
      end
      item
        Command = 116
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24611
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to absolute end'
      end
      item
        Command = 118
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8228
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to first char of line'
      end
      item
        Command = 119
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8227
              end>
          end>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to last char of line'
      end
      item
        Command = 120
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select left and up at line start'
      end
      item
        Command = 117
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor to specified position and select'
      end
      item
        Command = 201
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40997
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select left one char'
      end
      item
        Command = 202
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40999
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select right one char'
      end
      item
        Command = 203
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40998
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select up one line'
      end
      item
        Command = 204
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 41000
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select down one line'
      end
      item
        Command = 205
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57381
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select left one word'
      end
      item
        Command = 206
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57383
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select right one word'
      end
      item
        Command = 207
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to beginning of line'
      end
      item
        Command = 208
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to end of line'
      end
      item
        Command = 209
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40993
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select up one page'
      end
      item
        Command = 210
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40994
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select down one page'
      end
      item
        Command = 211
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select right one page'
      end
      item
        Command = 212
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select left one page'
      end
      item
        Command = 213
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57377
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to top of page'
      end
      item
        Command = 214
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57378
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to bottom of page'
      end
      item
        Command = 215
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57380
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to absolute beginning'
      end
      item
        Command = 216
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 57379
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to absolute end'
      end
      item
        Command = 218
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to first char of line'
      end
      item
        Command = 219
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40995
              end>
          end>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select to last char of line'
      end
      item
        Command = 220
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor and column select left and up at line start'
      end
      item
        Command = 217
        KeyStrokes = <>
        Category = 'Navigation, columnar select'
        DisplayName = 'Move cursor to specified position and column select'
      end
      item
        Command = 311
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16422
              end>
          end>
        Category = 'Scrolling'
        DisplayName = 'Scroll up one line leaving cursor position unchanged'
      end
      item
        Command = 312
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16424
              end>
          end>
        Category = 'Scrolling'
        DisplayName = 'Scroll down one line leaving cursor position unchanged'
      end
      item
        Command = 313
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll left one char leaving cursor position unchanged'
      end
      item
        Command = 314
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll right one char leaving cursor position unchanged'
      end
      item
        Command = 315
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll up one page leaving cursor position unchanged'
      end
      item
        Command = 316
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll down one page leaving cursor position unchanged'
      end
      item
        Command = 317
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll left one screen leaving cursor position unchanged'
      end
      item
        Command = 318
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll right one screen leaving cursor position unchanged'
      end
      item
        Command = 319
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute beginning leaving cursor position unchanged'
      end
      item
        Command = 320
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute end leaving cursor position unchanged'
      end
      item
        Command = 321
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute left leaving cursor position unchanged'
      end
      item
        Command = 322
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute right leaving cursor position unchanged'
      end
      item
        Command = 301
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16451
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 16429
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Copy selection to clipboard'
      end
      item
        Command = 302
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16472
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 8238
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Cut selection to clipboard'
      end
      item
        Command = 303
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16470
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 8237
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Paste from clipboard'
      end
      item
        Command = 304
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16474
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 32776
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Perform undo if available'
      end
      item
        Command = 305
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16473
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Perform redo if available'
      end
      item
        Command = 306
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16449
              end>
          end>
        Category = 'Standard actions'
        DisplayName = 'Select entire contents of document'
      end
      item
        Command = 307
        KeyStrokes = <>
        Category = 'Standard actions'
        DisplayName = 'Delete current selection'
      end
      item
        Command = 310
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy to clipboard in RTF format'
      end
      item
        Command = 339
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 13
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 16397
              end>
          end>
        Category = 'Inserting text'
        DisplayName = 'Break line at current position, move caret to new line'
      end
      item
        Command = 340
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Break line at current position, leave caret'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Insert a character (uses parameter)'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Insert a whole string (uses parameter)'
      end
      item
        Command = 568
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16452
              end>
          end>
        Category = 'Inserting text'
        DisplayName = 'Duplicate line'
      end
      item
        Command = 350
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24649
              end>
          end>
        Category = 'Indents and Tabs'
        DisplayName = 'Indent selection'
      end
      item
        Command = 351
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8201
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 24661
              end>
          end>
        Category = 'Indents and Tabs'
        DisplayName = 'Unindent selection'
      end
      item
        Command = 352
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 9
              end>
          end>
        Category = 'Indents and Tabs'
        DisplayName = 'Tab key'
      end
      item
        Command = 353
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16457
              end>
          end>
        Category = 'Indents and Tabs'
        DisplayName = 'Insert Tab char'
      end
      item
        Command = 331
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 8200
              end>
          end>
        Category = 'Deleting text'
        DisplayName = 'Delete last char (i.e. BackSpace key)'
      end
      item
        Command = 332
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 46
              end>
          end>
        Category = 'Deleting text'
        DisplayName = 'Delete char at caret (i.e. Delete key)'
      end
      item
        Command = 333
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16430
              end>
          end>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to next word'
      end
      item
        Command = 334
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16392
              end>
          end>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to start of word'
      end
      item
        Command = 335
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to beginning of line'
      end
      item
        Command = 336
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to end of line'
      end
      item
        Command = 337
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete current line'
      end
      item
        Command = 338
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete everything'
      end
      item
        Command = 371
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Set insert mode'
      end
      item
        Command = 372
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Set overwrite mode'
      end
      item
        Command = 373
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 45
              end>
          end>
        Category = 'Selection modes'
        DisplayName = 'Toggle insert/overwrite mode'
      end
      item
        Command = 374
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Normal selection mode'
      end
      item
        Command = 375
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Column selection mode'
      end
      item
        Command = 376
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Line selection mode'
      end
      item
        Command = 377
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Mark start of selection'
      end
      item
        Command = 378
        KeyStrokes = <>
        Category = 'Selection modes'
        DisplayName = 'Mark end of selection'
      end
      item
        Command = 360
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Upper case to current or previous word'
      end
      item
        Command = 361
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Lower case to current or previous word'
      end
      item
        Command = 362
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Toggle case to current or previous word'
      end
      item
        Command = 363
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Title case to current or previous word'
      end
      item
        Command = 365
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Upper case to current selection or current char'
      end
      item
        Command = 366
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Lower case to current selection or current char'
      end
      item
        Command = 367
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Toggle case to current selection or current char'
      end
      item
        Command = 368
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Title case to current selection'
      end
      item
        Command = 520
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse/expand block at current line'
      end
      item
        Command = 521
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse block at current line'
      end
      item
        Command = 522
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Expand block at current line'
      end
      item
        Command = 523
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse all blocks'
      end
      item
        Command = 524
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Expand all blocks'
      end
      item
        Command = 525
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse selected block'
      end
      item
        Command = 526
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16571
              end>
          end>
        Category = 'Text folding'
        DisplayName = 'Collapse/expand nearest block'
      end
      item
        Command = 527
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse ranges in selection'
      end
      item
        Command = 528
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Expand ranges in selection'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Toggle folding'
      end
      item
        Command = 401
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16432
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #0'
      end
      item
        Command = 402
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16433
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #1'
      end
      item
        Command = 403
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16434
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #2'
      end
      item
        Command = 404
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16435
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #3'
      end
      item
        Command = 405
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16436
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #4'
      end
      item
        Command = 406
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16437
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #5'
      end
      item
        Command = 407
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16438
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #6'
      end
      item
        Command = 408
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16439
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #7'
      end
      item
        Command = 409
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16440
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #8'
      end
      item
        Command = 410
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16441
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Go to bookmark #9'
      end
      item
        Command = 411
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24624
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #0'
      end
      item
        Command = 412
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24625
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #1'
      end
      item
        Command = 413
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24626
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #2'
      end
      item
        Command = 414
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24627
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #3'
      end
      item
        Command = 415
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24628
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #4'
      end
      item
        Command = 416
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24629
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #5'
      end
      item
        Command = 417
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24630
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #6'
      end
      item
        Command = 418
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24631
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #7'
      end
      item
        Command = 419
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24632
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #8'
      end
      item
        Command = 420
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24633
              end>
          end>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark #9'
      end
      item
        Command = 841
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Clear all bookmarks'
      end
      item
        Command = 430
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32804
              end>
          end>
        Category = 'Markers'
        DisplayName = 'Drop marker to current position'
      end
      item
        Command = 431
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32803
              end>
          end>
        Category = 'Markers'
        DisplayName = 'Collect marker (jump back)'
      end
      item
        Command = 432
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 40996
              end>
          end>
        Category = 'Markers'
        DisplayName = 'Swap marker (keep position, jump back)'
      end
      item
        Command = 433
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16603
              end>
          end>
        Category = 'Go to'
        DisplayName = 'Jump to matching bracket'
      end
      item
        Command = 573
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play last recorded macro'
      end
      item
        Command = 570
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Start macro recording'
      end
      item
        Command = 571
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Stop macro recording'
      end
      item
        Command = 572
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Cancel macro recording'
      end
      item
        Command = 800
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - ANSI'
      end
      item
        Command = 801
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - OEM'
      end
      item
        Command = 802
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - UTF-8'
      end
      item
        Command = 805
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - UTF-8, no BOM'
      end
      item
        Command = 803
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - Unicode'
      end
      item
        Command = 804
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - Unicode BE'
      end
      item
        Command = 806
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - KOI8'
      end
      item
        Command = 807
        KeyStrokes = <>
        Category = 'Encodings'
        DisplayName = 'Set encoding - Mac'
      end
      item
        Command = 703
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16574
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Character table popup'
      end
      item
        Command = 718
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16490
              end>
          end>
        Category = 'Zoom'
        DisplayName = 'Reset zoom'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 1'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 2'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 3'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 4'
      end
      item
        Command = 622
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Lister Find previous'
      end
      item
        Command = 810
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Menu - encodings'
      end
      item
        Command = 811
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Menu - lexers'
      end
      item
        Command = 812
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Menu - line endings'
      end
      item
        Command = 814
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16465
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Quick search'
      end
      item
        Command = 741
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16471
              end>
          end
          item
            KeyDefs = <
              item
                ShortCut = 16499
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Close tab'
      end
      item
        Command = 742
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Close all tabs'
      end
      item
        Command = 743
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Close other tabs (current group)'
      end
      item
        Command = 744
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 49235
              end>
          end>
        Category = 'File'
        DisplayName = 'Save all'
      end
      item
        Command = 813
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24622
              end>
          end>
        Category = 'File'
        DisplayName = 'Clear files history'
      end
      item
        Command = 815
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Insert current date/time'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 5'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 6'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 7'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Run external tool 8'
      end
      item
        Command = 830
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open in Firefox'
      end
      item
        Command = 831
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open in IE'
      end
      item
        Command = 832
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open in Chrome'
      end
      item
        Command = 833
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open in Safari'
      end
      item
        Command = 834
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open containing folder'
      end
      item
        Command = 835
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online search on PHP site'
      end
      item
        Command = 836
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online search in Google'
      end
      item
        Command = 837
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online search in Wikipedia'
      end
      item
        Command = 610
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16456
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Replace"'
      end
      item
        Command = 838
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online search in MSDN'
      end
      item
        Command = 745
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Exit program'
      end
      item
        Command = 746
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Close and delete file'
      end
      item
        Command = 617
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16461
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Find/Replace in files"'
      end
      item
        Command = 309
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy to clipboard in HTML format'
      end
      item
        Command = 720
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy and append to clipboard'
      end
      item
        Command = 721
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Cut and append to clipboard'
      end
      item
        Command = 713
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 119
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle output panel'
      end
      item
        Command = 816
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16453
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Extract strings"'
      end
      item
        Command = 1070
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Sentence case to current selection'
      end
      item
        Command = 719
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 117
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle clipboard/minimap panel'
      end
      item
        Command = 817
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 8306
              end>
          end>
        Category = 'Go to'
        DisplayName = 'Next mass search result'
      end
      item
        Command = 818
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 41074
              end>
          end>
        Category = 'Go to'
        DisplayName = 'Previous mass search result'
      end
      item
        Command = 722
        KeyStrokes = <>
        Category = 'Sessions'
        DisplayName = 'Save session as...'
      end
      item
        Command = 723
        KeyStrokes = <>
        Category = 'Sessions'
        DisplayName = 'Open session'
      end
      item
        Command = 724
        KeyStrokes = <>
        Category = 'Sessions'
        DisplayName = 'Open/Add session'
      end
      item
        Command = 819
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Toggle SyncEdit mode'
      end
      item
        Command = 820
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 122
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle full screen'
      end
      item
        Command = 747
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Move tab to group 1/2'
      end
      item
        Command = 821
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle synchronized horizontal scrolling'
      end
      item
        Command = 822
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle synchronized vertical scrolling'
      end
      item
        Command = 823
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle always on top'
      end
      item
        Command = 824
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Fill block"'
      end
      item
        Command = 825
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Insert text"'
      end
      item
        Command = 734
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Tree panel focus'
      end
      item
        Command = 735
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Clipboard panel focus'
      end
      item
        Command = 736
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16572
              end>
          end>
        Category = 'Abbreviations'
        DisplayName = 'Emmet - Expand abbreviation'
      end
      item
        Command = 737
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 49340
              end>
          end>
        Category = 'Abbreviations'
        DisplayName = 'Emmet - Wrap with abbreviation'
      end
      item
        Command = 738
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 49343
              end>
          end>
        Category = 'Comments'
        DisplayName = 'Toggle block comment'
      end
      item
        Command = 739
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Output panel focus'
      end
      item
        Command = 750
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Create backup copy'
      end
      item
        Command = 751
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32959
              end>
          end>
        Category = 'Comments'
        DisplayName = 'Toggle stream comment'
      end
      item
        Command = 752
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy filename to clipboard'
      end
      item
        Command = 753
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy full path to clipboard'
      end
      item
        Command = 754
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy dir path to clipboard'
      end
      item
        Command = 755
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Search Results panel focus'
      end
      item
        Command = 826
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 118
              end>
          end>
        Category = 'Options'
        DisplayName = 'Toggle live spelling'
      end
      item
        Command = 827
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32886
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Perform spell check'
      end
      item
        Command = 828
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24650
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Join lines'
      end
      item
        Command = 829
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Split lines'
      end
      item
        Command = 839
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Dialog "Run/customize macros"'
      end
      item
        Command = 840
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32885
              end>
          end>
        Category = 'Run'
        DisplayName = 'Preview selected HTML code'
      end
      item
        Command = 901
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #1'
      end
      item
        Command = 902
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #2'
      end
      item
        Command = 903
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #3'
      end
      item
        Command = 904
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #4'
      end
      item
        Command = 905
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #5'
      end
      item
        Command = 906
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #6'
      end
      item
        Command = 907
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #7'
      end
      item
        Command = 908
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #8'
      end
      item
        Command = 909
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Play macro #9'
      end
      item
        Command = 842
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Toggle bookmark'
      end
      item
        Command = 843
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Go to next bookmark'
      end
      item
        Command = 844
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Go to previous bookmark'
      end
      item
        Command = 845
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Copy bookmarked lines'
      end
      item
        Command = 846
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Cut bookmarked lines'
      end
      item
        Command = 849
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Paste into bookmarked lines'
      end
      item
        Command = 847
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Delete bookmarked lines'
      end
      item
        Command = 848
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Delete unmarked lines'
      end
      item
        Command = 850
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Inverse bookmarks'
      end
      item
        Command = 756
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle groups focus'
      end
      item
        Command = 725
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy current line to clipboard'
      end
      item
        Command = 726
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Cut current line to clipboard'
      end
      item
        Command = 853
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'HTML Tidy - validate'
      end
      item
        Command = 854
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'HTML Tidy - configure'
      end
      item
        Command = 757
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Validation panel focus'
      end
      item
        Command = 855
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Remove adjacent duplicates'
      end
      item
        Command = 910
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32817
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Activate tab #1'
      end
      item
        Command = 911
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32818
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Activate tab #2'
      end
      item
        Command = 912
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32819
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Activate tab #3'
      end
      item
        Command = 913
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32820
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Activate tab #4'
      end
      item
        Command = 914
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32821
              end>
          end>
        Category = 'Tabs'
        DisplayName = 'Activate tab #5'
      end
      item
        Command = 915
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab #6'
      end
      item
        Command = 916
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab #7'
      end
      item
        Command = 917
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab #8'
      end
      item
        Command = 918
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab #9'
      end
      item
        Command = 919
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab #10'
      end
      item
        Command = 727
        KeyStrokes = <>
        Category = 'Sessions'
        DisplayName = 'Save session'
      end
      item
        Command = 728
        KeyStrokes = <>
        Category = 'Sessions'
        DisplayName = 'Close session'
      end
      item
        Command = 857
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Trim leading spaces'
      end
      item
        Command = 858
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Trim trailing spaces'
      end
      item
        Command = 859
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Trim leading/trailing spaces'
      end
      item
        Command = 856
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Delete blank lines'
      end
      item
        Command = 860
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Delete duplicate spaces'
      end
      item
        Command = 862
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Replace spaces to tabs (all)'
      end
      item
        Command = 861
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Replace tabs to spaces'
      end
      item
        Command = 863
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Find string from clipboard - next'
      end
      item
        Command = 864
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Find string from clipboard - previous'
      end
      item
        Command = 920
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 20/80'
      end
      item
        Command = 921
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 30/70'
      end
      item
        Command = 922
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 40/60'
      end
      item
        Command = 923
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 50/50'
      end
      item
        Command = 924
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 60/40'
      end
      item
        Command = 925
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 70/30'
      end
      item
        Command = 926
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups 80/20'
      end
      item
        Command = 900
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = 'Repeat last played macro'
      end
      item
        Command = 865
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Repeat last editing command'
      end
      item
        Command = 866
        KeyStrokes = <>
        Category = 'Markers'
        DisplayName = 'Clear markers'
      end
      item
        Command = 758
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Minimap panel focus'
      end
      item
        Command = 867
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Select next node'
      end
      item
        Command = 868
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Select previous node'
      end
      item
        Command = 869
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Reduce blank lines'
      end
      item
        Command = 870
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next blank line'
      end
      item
        Command = 871
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous blank line'
      end
      item
        Command = 872
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Select paragraph'
      end
      item
        Command = 930
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #1'
      end
      item
        Command = 931
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #2'
      end
      item
        Command = 932
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #3'
      end
      item
        Command = 933
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #4'
      end
      item
        Command = 934
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #5'
      end
      item
        Command = 935
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #6'
      end
      item
        Command = 936
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #7'
      end
      item
        Command = 937
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #8'
      end
      item
        Command = 938
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #9'
      end
      item
        Command = 939
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on 2nd group #10'
      end
      item
        Command = 927
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups - splitter lefter'
      end
      item
        Command = 928
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups - splitter righter'
      end
      item
        Command = 873
        KeyStrokes = <>
        Category = 'Navigation, normal select'
        DisplayName = 'Move cursor and select to word end'
      end
      item
        Command = 874
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to word end'
      end
      item
        Command = 875
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Find next - and extend selection'
      end
      item
        Command = 876
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Find previous - and extend selection'
      end
      item
        Command = 940
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#10'
      end
      item
        Command = 941
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#11'
      end
      item
        Command = 942
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#12'
      end
      item
        Command = 943
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#13'
      end
      item
        Command = 944
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#14'
      end
      item
        Command = 945
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#15'
      end
      item
        Command = 946
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#16'
      end
      item
        Command = 947
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#17'
      end
      item
        Command = 948
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#18'
      end
      item
        Command = 949
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#19'
      end
      item
        Command = 950
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#20'
      end
      item
        Command = 951
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#21'
      end
      item
        Command = 952
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#22'
      end
      item
        Command = 953
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#23'
      end
      item
        Command = 954
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#24'
      end
      item
        Command = 955
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#25'
      end
      item
        Command = 956
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#26'
      end
      item
        Command = 957
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#27'
      end
      item
        Command = 958
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#28'
      end
      item
        Command = 959
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#29'
      end
      item
        Command = 960
        KeyStrokes = <>
        Category = 'Macros'
        DisplayName = '#30'
      end
      item
        Command = 761
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor right <N> chars'
      end
      item
        Command = 762
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left <N> chars'
      end
      item
        Command = 763
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor down <N> lines'
      end
      item
        Command = 764
        KeyStrokes = <>
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor up <N> lines'
      end
      item
        Command = 877
        KeyStrokes = <>
        Category = 'Markers'
        DisplayName = 'Go to last marker (don'#39't delete)'
      end
      item
        Command = 765
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Select parent node'
      end
      item
        Command = 766
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Select next brother node'
      end
      item
        Command = 767
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Select previous brother node'
      end
      item
        Command = 878
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 116
              end>
          end>
        Category = 'Run'
        DisplayName = 'Open current file in default application'
      end
      item
        Command = 879
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Select token'
      end
      item
        Command = 708
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Show file properties'
      end
      item
        Command = 880
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32835
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Color picker"'
      end
      item
        Command = 881
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Move caret to selection start/end'
      end
      item
        Command = 883
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Replace all occurences of selected string with clipboard'
      end
      item
        Command = 884
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Reread Output panel from file'
      end
      item
        Command = 759
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Project panel focus'
      end
      item
        Command = 885
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32841
              end>
          end>
        Category = 'Miscellaneous'
        DisplayName = 'Insert image tag'
      end
      item
        Command = 768
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split tab - toggle split'
      end
      item
        Command = 769
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle editor master/slave focus'
      end
      item
        Command = 886
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online help for HTML4 tag'
      end
      item
        Command = 887
        KeyStrokes = <>
        Category = 'Online help'
        DisplayName = 'Online help for HTML5 tag'
      end
      item
        Command = 729
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle ruler'
      end
      item
        Command = 770
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups - toggle splitter vert/horz'
      end
      item
        Command = 771
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split tab - toggle splitter vert/horz'
      end
      item
        Command = 772
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Dialog "Go to bookmark"'
      end
      item
        Command = 888
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Lorem Ipsum generator"'
      end
      item
        Command = 773
        KeyStrokes = <>
        Category = 'Favorites'
        DisplayName = 'Add current file to Favorites'
      end
      item
        Command = 774
        KeyStrokes = <>
        Category = 'Favorites'
        DisplayName = 'Organize Favorites'
      end
      item
        Command = 776
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Text Clips panel focus'
      end
      item
        Command = 777
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle smart highlighting'
      end
      item
        Command = 778
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Drop portable bookmark'
      end
      item
        Command = 779
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = 'Dialog "Go to portable bookmark"'
      end
      item
        Command = 748
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16497
              end>
          end>
        Category = 'File'
        DisplayName = 'Rename file'
      end
      item
        Command = 889
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Numeric converter"'
      end
      item
        Command = 780
        KeyStrokes = <>
        Category = 'Indents and Tabs'
        DisplayName = 'Indent selection like 1st line'
      end
      item
        Command = 749
        KeyStrokes = <>
        Category = 'Markers'
        DisplayName = 'Set column markers'
      end
      item
        Command = 781
        KeyStrokes = <>
        Category = 'Markers'
        DisplayName = 'Jump to column marker left'
      end
      item
        Command = 782
        KeyStrokes = <>
        Category = 'Markers'
        DisplayName = 'Jump to column marker right'
      end
      item
        Command = 783
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Paste from clipboard, keep caret position'
      end
      item
        Command = 784
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Jump over MixedCaseName left'
      end
      item
        Command = 785
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Jump over MixedCaseName right'
      end
      item
        Command = 786
        KeyStrokes = <>
        Category = 'Standard actions'
        DisplayName = 'Cancel selection'
      end
      item
        Command = 787
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Center lines'
      end
      item
        Command = 760
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Tabs panel focus'
      end
      item
        Command = 788
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16460
              end>
          end>
        Category = 'Selection operations'
        DisplayName = 'Extend selection by line'
      end
      item
        Command = 890
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Encode special HTML chars'
      end
      item
        Command = 891
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Dialog "Sort lines"'
      end
      item
        Command = 789
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Select brackets'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse parent block'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Collapse/Expand current block with nested blocks'
      end
      item
        Command = 852
        KeyStrokes = <>
        Category = 'Blank operations'
        DisplayName = 'Replace spaces to tabs (leading)'
      end
      item
        Command = 892
        KeyStrokes = <>
        Category = 'Comments'
        DisplayName = 'Toggle block comment (alt.)'
      end
      item
        Command = 793
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Paste from clipboard, to 1st column'
      end
      item
        Command = 794
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32848
              end>
          end>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Commands"'
      end
      item
        Command = 795
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll to selection'
      end
      item
        Command = 796
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32839
              end>
          end>
        Category = 'Projects'
        DisplayName = 'Dialog "Project files list"'
      end
      item
        Command = 2000
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Remove carets, leave first'
      end
      item
        Command = 2001
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Remove carets, leave last'
      end
      item
        Command = 2002
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from selection, left edge'
      end
      item
        Command = 2003
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from selection, right edge'
      end
      item
        Command = 2004
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from selection, delete selection'
      end
      item
        Command = 2005
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from search marks, left edge'
      end
      item
        Command = 2006
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from search marks, right edge'
      end
      item
        Command = 2007
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Carets from search marks, delete marks'
      end
      item
        Command = 2008
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets up 1 line'
      end
      item
        Command = 2009
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets down 1 line'
      end
      item
        Command = 2010
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets up 1 page'
      end
      item
        Command = 2011
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets down 1 page'
      end
      item
        Command = 2012
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets up till beginning'
      end
      item
        Command = 2013
        KeyStrokes = <>
        Category = 'Multi-carets'
        DisplayName = 'Extend carets down till end'
      end
      item
        Command = 851
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Remove all duplicates'
      end
      item
        Command = 797
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24763
              end>
          end>
        Category = 'Blank operations'
        DisplayName = 'Align by separator'
      end
      item
        Command = 798
        KeyStrokes = <>
        Category = 'Split view'
        DisplayName = 'Split groups - toggle split'
      end
      item
        Command = 893
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Extend selection'
      end
      item
        Command = 0
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Shrink selection'
      end
      item
        Command = 775
        KeyStrokes = <>
        Category = 'Favorites'
        DisplayName = 'Add current project to Favorites'
      end
      item
        Command = 895
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Reverse lines'
      end
      item
        Command = 896
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to beginning of file'
      end
      item
        Command = 897
        KeyStrokes = <>
        Category = 'Deleting text'
        DisplayName = 'Delete from caret to end of file'
      end
      item
        Command = 898
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Shuffle lines'
      end
      item
        Command = 982
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 2'
      end
      item
        Command = 983
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 3'
      end
      item
        Command = 984
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 4'
      end
      item
        Command = 985
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 5'
      end
      item
        Command = 986
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 6'
      end
      item
        Command = 987
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 7'
      end
      item
        Command = 988
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 8'
      end
      item
        Command = 989
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Fold level 9'
      end
      item
        Command = 799
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Paste from clipboard, as column block'
      end
      item
        Command = 1000
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Extract duplicate lines (case sensitive)'
      end
      item
        Command = 1001
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Extract duplicate lines (case insensitive)'
      end
      item
        Command = 1100
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - default'
      end
      item
        Command = 1111
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - custom'
      end
      item
        Command = 1101
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 1'
      end
      item
        Command = 1102
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 2'
      end
      item
        Command = 1103
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 3'
      end
      item
        Command = 1104
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 4'
      end
      item
        Command = 1105
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 5'
      end
      item
        Command = 1106
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 6'
      end
      item
        Command = 1107
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 7'
      end
      item
        Command = 1108
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 8'
      end
      item
        Command = 1109
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 9'
      end
      item
        Command = 1110
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Set tab color - color 10'
      end
      item
        Command = 1002
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Non-printable chars: hide'
      end
      item
        Command = 1005
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Non-printable chars: show all'
      end
      item
        Command = 1003
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Non-printable chars: show spaces/tabs'
      end
      item
        Command = 1004
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Non-printable chars: show line ends'
      end
      item
        Command = 1006
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Non-printable chars: show detailed line ends'
      end
      item
        Command = 1007
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Hide menu items"'
      end
      item
        Command = 1008
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Restore lexer styles"'
      end
      item
        Command = 1009
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "External tools"'
      end
      item
        Command = 1010
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Explorer integration"'
      end
      item
        Command = 1012
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Edit file "Syn.ini"'
      end
      item
        Command = 1011
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Edit file "SynPlugins.ini"'
      end
      item
        Command = 1013
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Open filename selected in editor'
      end
      item
        Command = 1115
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Program Settings"'
      end
      item
        Command = 1116
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Colors"'
      end
      item
        Command = 1117
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Fonts"'
      end
      item
        Command = 1118
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Tabs"'
      end
      item
        Command = 1119
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "View Settings"'
      end
      item
        Command = 1120
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Select/Highlight"'
      end
      item
        Command = 1121
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Carets"'
      end
      item
        Command = 1122
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Lexer Overrides"'
      end
      item
        Command = 1123
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Keys"'
      end
      item
        Command = 1124
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Formats/Reload"'
      end
      item
        Command = 1125
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Search"'
      end
      item
        Command = 1126
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Tree/Map"'
      end
      item
        Command = 1127
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "History"'
      end
      item
        Command = 1128
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Sessions/Projects"'
      end
      item
        Command = 1129
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Auto-Complete"'
      end
      item
        Command = 1130
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Auto-Save"'
      end
      item
        Command = 1131
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Spell Check"'
      end
      item
        Command = 1132
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Path Environment"'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Misc"'
      end
      item
        Command = 1014
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Customize lexer styles"'
      end
      item
        Command = 1092
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 2'
      end
      item
        Command = 1093
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 3'
      end
      item
        Command = 1094
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 4'
      end
      item
        Command = 1095
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 5'
      end
      item
        Command = 1096
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 6'
      end
      item
        Command = 1097
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 7'
      end
      item
        Command = 1098
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 8'
      end
      item
        Command = 1099
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse level 9'
      end
      item
        Command = 1090
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Collapse all'
      end
      item
        Command = 1091
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - Expand all'
      end
      item
        Command = 1135
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Undo"'
      end
      item
        Command = 1136
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "Insert/Format"'
      end
      item
        Command = 1137
        KeyStrokes = <>
        Category = 'Options dialog tabs'
        DisplayName = 'Tab "New/Open"'
      end
      item
        Command = 1020
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Copy search marks to clipboard'
      end
      item
        Command = 1023
        KeyStrokes = <>
        Category = 'Favorites'
        DisplayName = 'Organize Favorite projects'
      end
      item
        Command = 1021
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Open project'
      end
      item
        Command = 1022
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Add current file to project'
      end
      item
        Command = 1024
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Create new project'
      end
      item
        Command = 1025
        KeyStrokes = <>
        Category = 'Clipboard operations'
        DisplayName = 'Paste from clipboard, then select'
      end
      item
        Command = 1026
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Insert blank line above caret'
      end
      item
        Command = 1027
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Insert blank line below caret'
      end
      item
        Command = 1028
        KeyStrokes = <>
        Category = 'Run'
        DisplayName = 'Open cmd.exe prompt in current folder'
      end
      item
        Command = 1029
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Copy current URL to clipboard'
      end
      item
        Command = 1030
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Open current URL in browser'
      end
      item
        Command = 1031
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Go to definition'
      end
      item
        Command = 1032
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Add current color to recents'
      end
      item
        Command = 1033
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Save folding to file'
      end
      item
        Command = 1034
        KeyStrokes = <>
        Category = 'Text folding'
        DisplayName = 'Load folding from file'
      end
      item
        Command = 1035
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Open last closed file'
      end
      item
        Command = 1036
        KeyStrokes = <>
        Category = 'Hints'
        DisplayName = 'Turn on auto-complete mode "Only words from file"'
      end
      item
        Command = 1037
        KeyStrokes = <>
        Category = 'Hints'
        DisplayName = 'Turn off auto-complete mode "Only words from file"'
      end
      item
        Command = 1038
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Select token, without quotes'
      end
      item
        Command = 1039
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Add all files to project'
      end
      item
        Command = 1040
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll current line to top of window'
      end
      item
        Command = 1041
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll current line to bottom of window'
      end
      item
        Command = 1042
        KeyStrokes = <>
        Category = 'Scrolling'
        DisplayName = 'Scroll current line to middle of window'
      end
      item
        Command = 1043
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Save project'
      end
      item
        Command = 1044
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16576
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Console panel focus'
      end
      item
        Command = 1045
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "New plugin"'
      end
      item
        Command = 1046
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "New snippet"'
      end
      item
        Command = 1047
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Dialog "Snippets"'
      end
      item
        Command = 1048
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Show help file contents'
      end
      item
        Command = 1049
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Reset Python plugins'
      end
      item
        Command = 1050
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next tab'
      end
      item
        Command = 1051
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous tab'
      end
      item
        Command = 1052
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next output result'
      end
      item
        Command = 1053
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous output result'
      end
      item
        Command = 1054
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next search or output result'
      end
      item
        Command = 1055
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous search or output result'
      end
      item
        Command = 1056
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle show folders on tab captions'
      end
      item
        Command = 1015
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Dialog "Spelling options"'
      end
      item
        Command = 1057
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Dialog "Insert char code"'
      end
      item
        Command = 1058
        KeyStrokes = <>
        Category = 'Projects'
        DisplayName = 'Update project (add missing files)'
      end
      item
        Command = 1059
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Close other tabs (all groups)'
      end
      item
        Command = 1060
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Move tab to next group'
      end
      item
        Command = 1061
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Move tab to previous group'
      end
      item
        Command = 1062
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Bookmarks panel focus'
      end
      item
        Command = 1900
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Update ini file'
      end
      item
        Command = 1063
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Print now, all text'
      end
      item
        Command = 1064
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Print now, selection'
      end
      item
        Command = 618
        KeyStrokes = <>
        Category = 'Search & Replace'
        DisplayName = 'Dialog "Find/Replace in project"'
      end
      item
        Command = 1065
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next modified line'
      end
      item
        Command = 1066
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous modified line'
      end
      item
        Command = 1067
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Next modified/saved line'
      end
      item
        Command = 1068
        KeyStrokes = <>
        Category = 'Go to'
        DisplayName = 'Previous modified/saved line'
      end
      item
        Command = 1069
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Open all files in folder'
      end
      item
        Command = 1071
        KeyStrokes = <>
        Category = 'Change case'
        DisplayName = 'Random case to current selection'
      end
      item
        Command = 1072
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Restart program'
      end
      item
        Command = 1073
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Remove all duplicates+origins'
      end
      item
        Command = 1074
        KeyStrokes = <>
        Category = 'Sorting'
        DisplayName = 'Extract unique lines (case sensitive)'
      end>
    UseFirstControlKeys = True
    Left = 360
    Top = 252
  end
  object TimerTick: TTimer
    Interval = 500
    OnTimer = TimerTickTimer
    Left = 296
    Top = 360
  end
  object PopupStatusEnc: TSpTBXPopupMenu
    OnPopup = PopupStatusEncPopup
    OnClosePopup = PopupStatusEncClosePopup
    Left = 288
    Top = 304
  end
  object PopupStatusLineEnds: TSpTBXPopupMenu
    OnPopup = PopupStatusLineEndsPopup
    Left = 320
    Top = 304
    object TBXItemEndWin: TSpTBXItem
      Tag = 1
      Caption = 'Windows (CR LF)'
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
    end
    object TBXItemEndUn: TSpTBXItem
      Tag = 3
      Caption = 'Unix (LF)'
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
    end
    object TBXItemEndMac: TSpTBXItem
      Tag = 2
      Caption = 'Mac (CR)'
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
    end
  end
  object ImgListTree: TImageList
    Left = 312
    Top = 192
    Bitmap = {
      494C010108000900040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000003000000001002000000000000030
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000848484008484840084848400C6C6C60084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840084848400FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484000000
      0000000000000000000000000000000000000000000000000000000000003131
      3100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840000000000000000000000
      000000000000000000000000000000000000000000000000000084848400C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600C6C6C60084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000080808000000000000000000000000000000000010101000000000002121
      2100212121000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400000000008484
      840084848400848484008484840000000000000000000000000084848400FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000080808003131310000000000000000000000000000000000101010002121
      2100000000000000000000000000000000000000000000000000000000000000
      00000000000000FF000000FF000000840000000000008484840000FF000000FF
      000000FF000000FF000084848400000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000848400000000008484840000FFFF0000FF
      FF0000FFFF0000FFFF008484840000000000000000000000000084848400C6C6
      C600FFFFFF00FFFFFF00C6C6C600C6C6C600C6C6C60084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000080808001010100000000000000000000000000000000000393939000808
      0800313131000000000000000000000000000000000000000000000000000000
      000000FF000000FF000000FF00000084000000000000848484000084000000FF
      000000FF000000FF000084848400000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF000084840000000000848484000084840000FF
      FF0000FFFF0000FFFF008484840000000000000000000000000084848400FFFF
      FF00C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000001818180021212100000000000000000031313100313131000000
      00000000000018181800000000000000000000000000000000008484840000FF
      000000FF000000FF0000848484000084000000000000000000000000000000FF
      000000FF000000FF0000848484000000000000000000000000008484840000FF
      FF0000FFFF0000FFFF00848484000084840000000000000000000000000000FF
      FF0000FFFF0000FFFF008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000002921210021212100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000FF0000848484008484840000840000008400000084000000FF000000FF
      000000FF000000FF000084848400000000000000000000000000000000008484
      840000FFFF00848484008484840000848400008484000084840000FFFF0000FF
      FF0000FFFF0000FFFF008484840000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C6008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000002929210000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484000000000084848400008400000084000000FF000000FF000000FF
      00000000000000FF000000000000000000000000000000000000000000000000
      0000848484000000000084848400008484000084840000FFFF0000FFFF0000FF
      FF000000000000FFFF0000000000000000000000000000000000000000008484
      8400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600848484008484840000000000000000000000000000000000000000000000
      0000181018001010100018181800080808000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000084000000FF000000FF000000FF00000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000848484000084840000FFFF0000FFFF0000FFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000084848400C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      000000000000000000004A4A4A004A4A4A000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FF000000FF000000FF0000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000FFFF0000FFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000084848400C6C6C600C6C6C6008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000029292900313131000000000021212100424242000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FF000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000005A5A5A00292929004A4A4A00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000000000008484
      8400000000000000000084848400000000000000000084848400000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000848400008484000084
      8400000000008484840084848400000000000000000000000000000000008484
      8400000000000000000000000000000000008484840000848400848484000084
      8400000000008484840000000000000000000000000000000000000000008484
      8400000000000000000084848400000000000000000084848400848484008484
      8400848484000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000848484008484
      8400848484000000000000000000000000000084840000848400008484000084
      8400008484000000000084848400000000000000000000000000848484008484
      8400848484000000000000000000000000000084840084848400FFFFFF00FFFF
      FF00008484000000000084848400000000000000000084848400848484000000
      0000848484008484840000000000848484008484840000000000000000008484
      84008484840084848400848484000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000FF0000000000000000008484
      8400848484008484840084848400008484000084840000848400008484000084
      8400008484000000000084848400000000000000FF0000000000000000008484
      84008484840084848400848484000084840084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000084848400000000000000000000000000000000008484
      840084848400FFFFFF0084848400FFFFFF008484840000848400008484000000
      00008484840000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000FF000000FF000000FF000000
      00008484840084848400848484000084840000FFFF0000848400008484000084
      8400008484000084840000000000000000000000FF00848484000000FF000000
      0000848484008484840084848400008484008484840084848400FFFFFF00FFFF
      FF00FFFFFF0000848400848484000000000000000000000000000000FF000000
      0000848484008484840084848400008484000084840000848400008484000084
      84000000000000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000FF000000FF000000FF000000
      FF000000000000000000848484000084840000FFFF0000FFFF00008484000084
      8400008484000084840000000000000000000000FF0084848400FFFFFF000000
      FF000000000000000000848484000084840000FFFF008484840084848400FFFF
      FF00FFFFFF0000848400000000000000000000000000848484000000FF000000
      FF000000000084848400848484000084840000FFFF0000848400008484000084
      84000084840084848400848484000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000FF000000FF000000FF000000
      8400000084000000840000000000FFFFFF008484840000FFFF0000FFFF000084
      8400008484000000000000000000000000000000FF0084848400FFFFFF00FFFF
      FF00848484008484840000000000FFFFFF00FFFFFF0000FFFF00848484008484
      84000084840000000000000000000000000000000000000000000000FF000000
      FF000000FF0000000000000000000084840000FFFF0000FFFF00008484000084
      84000084840000000000000000000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000FF000000FF00000084000000
      84000000840000008400FFFFFF00FFFFFF00FFFFFF0000848400008484000084
      8400000000000000000000000000000000000000FF0084848400848484008484
      84000000840000008400FFFFFF00FFFFFF00FFFFFF0000848400008484000084
      84000000000000000000000000000000000000000000000000000000FF000000
      FF00000084000000840000008400FFFFFF00FFFFFF000084840000848400FFFF
      FF008484840000000000000000000000000084848400FFFFFF00C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FF
      FF00C6C6C6008484840000000000000000000000FF000000FF00000084000000
      8400000000000000000084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000FF0084848400000084000000
      8400000000000000000084848400848484008484840084848400848484008484
      84008484840000000000000000000000000000000000848484000000FF000000
      FF00000084008484840000000000848484008484840084848400848484008484
      84000000000084848400848484000000000084848400FFFFFF0000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6C60000FFFF00C6C6
      C60000FFFF008484840000000000000000000000FF0000008400000000000000
      00000000000084848400FFFFFF00FF00000084840000FF000000FF0000000000
      0000848484000000000000000000000000000000FF0000008400000000000000
      0000000000008484840084848400FF00000084840000FF000000FF0000000000
      00008484840000000000000000000000000000000000000000000000FF000000
      8400FFFFFF00FFFFFF0084848400FF00000084840000FF000000000000008484
      84008484840000000000000000000000000084848400FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF008484840000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FF000000FF000000FF0000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000FFFF000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00848484008484000084840000FF000000000000008484
      84008484840000000000000000000000000084848400C6C6C60000FFFF00C6C6
      C60000FFFF00C6C6C60000FFFF00C6C6C6008484840084848400848484008484
      8400848484008484840000000000000000000000000000000000000000000000
      00000000000000000000000000008484000084840000FF000000FF0000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000084848400848484000000
      000084848400848484000000000084848400FF000000FF000000000000008484
      8400000000008484840084848400000000000000000084848400C6C6C60000FF
      FF00C6C6C60000FFFF00C6C6C600848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFFFF00FF000000FF000000FF0000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000FFFF000084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000008484
      84000000000000000000848484008484000084840000FF000000840000000000
      0000848484000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484000084840000FF000000FF0000008400
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400848484008400
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000084848400000000000000000084848400000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000300000000100010000000000800100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFF3FFFFFFFFFFFFF
      F81FDFFFFFFFFFFFE00FE7FFFC7FFC7FC007F727F821F821C003F38FF001F001
      C003F3C7E001E001C003F193C001C001C003F9FFE001E001C003F9FFF40BF40B
      E003F07FFC1FFC1FF00FFCFFFC3FFC3FF83FFC9FFE7FFE7FFCFFFE3FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7FFC7FFFFFFFFFF83FF83EDB7
      8001EF01EF03ED870001C701C7018001000100010001E007000100030001C007
      0001000300038001000100070007C0070001000F000FC00700010C070C078001
      000138073807C0070001FC07F807E0070003FE07FC07800180FFFC07F807EC17
      C1FFFE0FFC0FEDB7FFFFFC0FFC0FFFFF00000000000000000000000000000000
      000000000000}
  end
  object PrinterSetupDialog: TPrinterSetupDialog
    Left = 576
    Top = 260
  end
  object SyntStyles: TSyntStyles
    Styles = <
      item
        DisplayName = 'type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
      end
      item
        DisplayName = 'name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        FormatFlags = [ffBold, ffItalic, ffUnderline, ffStrikeOut, ffReadOnly, ffHidden]
      end
      item
        DisplayName = 'desc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
      end
      item
        DisplayName = 'hintsB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'hints'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'hintsDesc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'none'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = []
        BgColor = clWindow
        FormatType = ftColor
      end>
    Left = 480
    Top = 264
  end
  object ecACP: TAutoCompletePopup
    ShowWhenNone = False
    Images = ImgListTree
    Delay = 200
    Styles = SyntStyles
    FixedItemHeight = True
    ColumnSpace = 4
    Options = [aoFormatted, aoExactClose]
    OnGetAutoCompleteList = ecACPGetAutoCompleteList
    OnAfterComplete = ecACPAfterComplete
    OnCheckChar = ecACPCheckChar
    OnKeyPress = ecACPKeyPress
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    DropDownCount = 10
    IntegralHeight = True
    ItemHeight = 15
    AutoSelect = False
    BgColor = clWindow
    CommandID = 650
    Width = 400
    Height = 200
    Constraints.MinWidth = 320
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 150
    ToolHint.Height = 0
    ToolHint.Active = True
    ToolHint.Styles = SyntStyles
    ToolHint.Formatted = True
    ToolHint.Font.Charset = DEFAULT_CHARSET
    ToolHint.Font.Color = clWindowText
    ToolHint.Font.Height = -11
    ToolHint.Font.Name = 'Tahoma'
    ToolHint.Font.Style = []
    Controls = <>
    OnChange = ecACPChange
    OnCloseUp = ecACPCloseUp
    OnShow = ecACPShow
    Left = 480
    Top = 232
  end
  object ParamCompletion: TParamCompletion
    DeclSeparator = ','
    Color = clInfoBk
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    OnGetParams = ParamCompletionGetParams
    Delay = 100
    UpDownWidth = 32
    Shadow = False
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    ToolHint.Font.Charset = DEFAULT_CHARSET
    ToolHint.Font.Color = clWindowText
    ToolHint.Font.Height = -11
    ToolHint.Font.Name = 'Tahoma'
    ToolHint.Font.Style = []
    Controls = <>
    CommandID = 652
    Left = 512
    Top = 232
  end
  object TemplatePopup: TTemplatePopup
    Templates = <>
    Options = [ctIncludeOwn, ctIncludeLexer, ctEnableSearch, ctDisplayShortCut, ctDisplayDesc, ctRightDesc, ctFiltered]
    SortType = ctsName
    DropDownCount = 15
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    AutoSelect = False
    BgColor = clWindow
    CommandID = 651
    Constraints.MinWidth = 220
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    ToolHint.Styles = SyntStyles
    ToolHint.Font.Charset = DEFAULT_CHARSET
    ToolHint.Font.Color = clWindowText
    ToolHint.Font.Height = -12
    ToolHint.Font.Name = 'Tahoma'
    ToolHint.Font.Style = []
    Controls = <>
    OnShow = TemplatePopupShow
    Left = 544
    Top = 232
  end
  object PopupLexers: TSpTBXPopupMenu
    OnPopup = PopupLexersPopup
    Left = 376
    Top = 304
  end
  object ecCharPopup: TecSelCharPopup
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    CellWidth = 16
    CellHeight = 18
    ShowCodeHint = False
    BgColor = clWindow
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    ToolHint.Active = True
    ToolHint.Font.Charset = DEFAULT_CHARSET
    ToolHint.Font.Color = clWindowText
    ToolHint.Font.Height = -11
    ToolHint.Font.Name = 'Tahoma'
    ToolHint.Font.Style = []
    Controls = <>
    OnChange = ecCharPopupChange
    OnShow = ecCharPopupShow
    Left = 512
    Top = 264
  end
  object TimerRedraw: TTimer
    OnTimer = TimerRedrawTimer
    Left = 320
    Top = 360
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'ac*.Category'
      'bbg*.Caption'
      'bBk*.Caption'
      'ec*.Category'
      'ecACP.*'
      'ecSyntPrinter.*'
      'ImageList*'
      'MRU.*'
      'PropsManager*.*'
      'Python*'
      'SyntStyles.*'
      'TBXItemEnd*'
      'TBXItemZSet*'
      'TBXSwitcher.*'
      'TemplateEditor.*')
    Options = [dklcoAutoSaveLangSource, dklcoIgnoreEmptyProps, dklcoIgnoreFontProps]
    StoreList.Strings = (
      '*.Caption'
      '*.Hint')
    OnLanguageChanged = DKLanguageController1LanguageChanged
    Left = 577
    Top = 233
    LangData = {
      0600666D4D61696E0001100400000A00544258446F636B546F70000006007462
      46696C650101000000B5020000070043617074696F6E000E005442584974656D
      546F6F6C4E65770102000000B6020000070043617074696F6EB7020000040048
      696E740016005442585375626D656E754974656D546F6F6C4F70656E01020000
      00B8020000070043617074696F6EB9020000040048696E740016005442585375
      626D656E754974656D546F6F6C536176650102000000BC020000070043617074
      696F6EBD020000040048696E740011005442584974656D546F6F6C5361766541
      730102000000BE020000070043617074696F6E370B0000040048696E74001000
      5442584974656D546F6F6C5072696E740102000000C402000007004361707469
      6F6E750A0000040048696E74000E005442584974656D50726576696577010200
      0000C6020000070043617074696F6E760A0000040048696E74000C0054425849
      74656D50616765530101000000C8020000070043617074696F6E000D00544258
      4974656D5072696E74530101000000CA020000070043617074696F6E00150054
      62785375626D656E754974656D54626C46696E640102000000E0090000070043
      617074696F6EE1090000040048696E74000F005442584974656D426172464E65
      78740101000000CE020000070043617074696F6E000F005442584974656D4261
      7246507265760101000000D0020000070043617074696F6E0011005442585365
      70617261746F724974656D39000012005442584974656D426172576F72644E65
      78740101000000D2020000070043617074696F6E0012005442584974656D4261
      72576F7264507265760101000000D4020000070043617074696F6E0012005442
      58536570617261746F724974656D313100000F005442584974656D4261724D61
      726B730101000000D6020000070043617074696F6E0011005442585365706172
      61746F724974656D31000015005442585375626D656E754974656D5462536574
      75700102000000F2020000070043617074696F6EF3020000040048696E74000C
      005442584974656D4F4F4C65780101000000F4020000070043617074696F6E00
      0F005442584974656D4F4F4C65784C69620101000000250B0000070043617074
      696F6E0006007462456469740101000000FA020000070043617074696F6E000D
      005442584974656D5462436F70790102000000FB020000070043617074696F6E
      FC020000040048696E74000C005442584974656D54624375740102000000FD02
      0000070043617074696F6EFE020000040048696E74000E005442584974656D54
      6250617374650102000000FF020000070043617074696F6E0003000004004869
      6E74000C005442584974656D546244656C010200000001030000070043617074
      696F6E02030000040048696E74000F005442584974656D546253656C416C6C01
      0200000003030000070043617074696F6E04030000040048696E740011005442
      58536570617261746F724974656D3300000D005442584974656D5462556E646F
      010200000005030000070043617074696F6E06030000040048696E74000D0054
      42584974656D54625265646F010200000007030000070043617074696F6E0803
      0000040048696E74001100544258536570617261746F724974656D3400001200
      5442585375626D656E754974656D536F72740102000000090300000700436170
      74696F6EEC080000040048696E740010005442584974656D5462536F72744173
      6301010000000B030000070043617074696F6E0011005442584974656D546253
      6F72744465736301010000000D030000070043617074696F6E000E0054425853
      75626D656E754361736501020000000F030000070043617074696F6E10030000
      040048696E740013005442584974656D42617243617365557070657201010000
      0011030000070043617074696F6E0013005442584974656D426172436173654C
      6F776572010100000013030000070043617074696F6E0013005442584974656D
      426172436173655469746C65010100000015030000070043617074696F6E0014
      005442584974656D42617243617365496E766572740101000000170300000700
      43617074696F6E000B00544258446F636B4C6566740000060074625669657701
      0100000019030000070043617074696F6E0011005442584974656D5650616E65
      6C5472656501020000001A030000070043617074696F6E460A0000040048696E
      74000D005442584974656D564E6F6E7072010200000022030000070043617074
      696F6E450A0000040048696E74001100544258536570617261746F724974656D
      3200000C005442584974656D56436F6D6D010200000024030000070043617074
      696F6E25030000040048696E74000D005442584974656D56556E636F6D010200
      000026030000070043617074696F6E27030000040048696E7400120054425853
      6570617261746F724974656D313000000B005442584974656D56496E64010200
      000028030000070043617074696F6E29030000040048696E74000D0054425849
      74656D56556E696E6401020000002A030000070043617074696F6E2B03000004
      0048696E74000600706C547265650001010000000700546F6F6C626172010100
      0000E2090000070043617074696F6E0004005472656500000D00544258446F63
      6B426F74746F6D00000C00544258446F636B5269676874000006005374617475
      730001010000000D00537461747573546F6F6C6261720101000000E509000007
      0043617074696F6E0004004D656E750000060074624D656E750101000000FB05
      0000070043617074696F6E0012005442585375626D656E754974656D46696C65
      010100000035030000070043617074696F6E0012005442585375626D656E7549
      74656D464E6577010100000036030000070043617074696F6E000B0054425849
      74656D464E6577010200000037030000070043617074696F6E38030000040048
      696E74000E005442584974656D464E657757696E010200000039030000070043
      617074696F6E380B0000040048696E74000C005442584974656D464F70656E01
      020000003A030000070043617074696F6E3B030000040048696E74000E005442
      584974656D4652656F70656E01020000003C030000070043617074696F6E3D03
      0000040048696E74000C005442584974656D465361766501020000003E030000
      070043617074696F6E3F030000040048696E74000E005442584974656D465361
      76654173010200000040030000070043617074696F6E41030000040048696E74
      0014005442585375626D656E754974656D4578706F7274010100000042030000
      070043617074696F6E000F005442584974656D4645787048746D6C0102000000
      43030000070043617074696F6E44030000040048696E74000E00544258497465
      6D46457870527466010200000045030000070043617074696F6E460300000400
      48696E74000D005442584974656D465072696E74010200000048030000070043
      617074696F6E780A0000040048696E74000F005442584974656D465072657669
      657701020000004A030000070043617074696F6E790A0000040048696E740011
      005442584974656D4650616765536574757001010000004C0300000700436170
      74696F6E0014005442584974656D465072696E74657253657475700102000000
      4E030000070043617074696F6E7E0A0000040048696E74001200544258536570
      617261746F724974656D313500000C005442584974656D464578697401020000
      0050030000070043617074696F6E26050000040048696E740010005442585375
      626D656E754974656D4564010100000051030000070043617074696F6E000C00
      5442584974656D45556E646F010200000052030000070043617074696F6E5303
      0000040048696E74000C005442584974656D455265646F010200000054030000
      070043617074696F6E55030000040048696E7400110054425853657061726174
      6F724974656D3600000B005442584974656D4543757401020000005603000007
      0043617074696F6E57030000040048696E74000C005442584974656D45436F70
      79010200000058030000070043617074696F6E59030000040048696E74000D00
      5442584974656D45506173746501020000005A030000070043617074696F6E5B
      030000040048696E74000E005442584974656D4544656C65746501020000005C
      030000070043617074696F6E5D030000040048696E740011005442584974656D
      4553656C656374416C6C01020000005E030000070043617074696F6E5F030000
      040048696E74001200544258536570617261746F724974656D313700000E0054
      42584974656D45496E64656E74010200000064030000070043617074696F6E65
      030000040048696E740010005442584974656D45556E696E64656E7401020000
      0066030000070043617074696F6E67030000040048696E74000B005442584974
      656D45447570010200000068030000070043617074696F6E2205000004004869
      6E74000D005442584974656D455461626C650102000000690300000700436170
      74696F6E23050000040048696E740015005442585375626D656E754974656D53
      6F72744F707301010000006A030000070043617074696F6E000F005442584974
      656D45536F727441736301020000006C030000070043617074696F6E6D030000
      040048696E740010005442584974656D45536F72744465736301020000006E03
      0000070043617074696F6E6F030000040048696E740015005442585375626D65
      6E754974656D436173654F7073010100000070030000070043617074696F6E00
      11005442584974656D4543617365557070657201020000007203000007004361
      7074696F6E73030000040048696E740011005442584974656D45436173654C6F
      776572010200000074030000070043617074696F6E75030000040048696E7400
      11005442584974656D45436173655469746C6501020000007603000007004361
      7074696F6E77030000040048696E740012005442584974656D4543617365496E
      76657274010200000078030000070043617074696F6E79030000040048696E74
      0010005442585375626D656E754974656D537201010000009003000007004361
      7074696F6E000C005442584974656D534E657874010200000093030000070043
      617074696F6E94030000040048696E74000C005442584974656D535072657601
      0200000095030000070043617074696F6E96030000040048696E740012005442
      58536570617261746F724974656D3139000010005442584974656D53576F7264
      4E657874010200000097030000070043617074696F6E98030000040048696E74
      0011005442584974656D53576F72645072696F72010200000099030000070043
      617074696F6E9A030000040048696E74001200544258536570617261746F7249
      74656D3230000010005442584974656D534D61726B4E65787401020000009B03
      0000070043617074696F6E12050000040048696E740010005442584974656D53
      4D61726B5072657601020000009C030000070043617074696F6E130500000400
      48696E740011005442584974656D534D61726B436C65617201020000009D0300
      00070043617074696F6E9E030000040048696E74001200544258536570617261
      746F724974656D323100000C005442584974656D53476F746F01020000009F03
      0000070043617074696F6EA0030000040048696E740010005442585375626D65
      6E754974656D426B0101000000A1030000070043617074696F6E001300544258
      5375626D656E754974656D426B5365740102000000A203000007004361707469
      6F6E11070000040048696E740009005442584974656D47300101000000A30300
      00070043617074696F6E0009005442584974656D47310101000000A403000007
      0043617074696F6E0009005442584974656D47320101000000A5030000070043
      617074696F6E0009005442584974656D47330101000000A60300000700436170
      74696F6E0009005442584974656D47340101000000A703000007004361707469
      6F6E0009005442584974656D47350101000000A8030000070043617074696F6E
      0009005442584974656D47360101000000A9030000070043617074696F6E0009
      005442584974656D47370101000000AA030000070043617074696F6E00090054
      42584974656D47380101000000AB030000070043617074696F6E000900544258
      4974656D47390101000000AC030000070043617074696F6E0014005442585375
      626D656E754974656D426B476F746F0102000000AD030000070043617074696F
      6E12070000040048696E740009005442584974656D42300101000000AE030000
      070043617074696F6E0009005442584974656D42310101000000AF0300000700
      43617074696F6E0009005442584974656D42320101000000B003000007004361
      7074696F6E0009005442584974656D42330101000000B1030000070043617074
      696F6E0009005442584974656D42340101000000B2030000070043617074696F
      6E0009005442584974656D42350101000000B3030000070043617074696F6E00
      09005442584974656D42360101000000B4030000070043617074696F6E000900
      5442584974656D42370101000000B5030000070043617074696F6E0009005442
      584974656D42380101000000B6030000070043617074696F6E00090054425849
      74656D42390101000000B7030000070043617074696F6E001300544258537562
      6D656E754974656D4C657865720101000000BA030000070043617074696F6E00
      11005442585375626D656E754974656D4F70740101000000BB03000007004361
      7074696F6E000D005442584974656D4F53657475700102000000BC0300000700
      43617074696F6EBD030000040048696E74000D005442584974656D4F4C657865
      720102000000BE030000070043617074696F6EBF030000040048696E74001000
      5442584974656D4F4C657865724C69620102000000C003000007004361707469
      6F6EC1030000040048696E74000A005442584974656D4F524F0102000000C303
      0000070043617074696F6EC4030000040048696E74000C005442584974656D4F
      547265650102000000C5030000070043617074696F6EC6030000040048696E74
      000C005442584974656D4F466F6C640102000000C7030000070043617074696F
      6EC8030000040048696E74000C005442584974656D4F577261700102000000C9
      030000070043617074696F6ECA030000040048696E74000C005442584974656D
      4F4E756D730102000000CB030000070043617074696F6ECC030000040048696E
      74000E005442584974656D4F4E5072696E740102000000CD0300000700436170
      74696F6EC4090000040048696E740012005442585375626D656E754974656D48
      656C700101000000CF030000070043617074696F6E0014005442584974656D48
      656C70526561646D654469720102000000D0030000070043617074696F6E2005
      0000040048696E740010005442584974656D48656C7041626F75740102000000
      D1030000070043617074696F6E21050000040048696E7400070050616E656C42
      6700000E0054656D706C617465456469746F7200000A00416374696F6E4C6973
      7400000D0065635072696E74416374696F6E0102000000060000000700436170
      74696F6E7B0A0000040048696E7400080061634E657754616201020000000F00
      0000070043617074696F6E10000000040048696E74000B0061634E657757696E
      646F77010200000012000000070043617074696F6E390B0000040048696E7400
      0E0065635072696E746572536574757001010000001400000007004361707469
      6F6E00060061634F70656E010200000017000000070043617074696F6E180000
      00040048696E74000800616352657265616401020000001A0000000700436170
      74696F6E1B000000040048696E7400060061635361766501020000001D000000
      070043617074696F6E1E000000040048696E7400080061635361766541730102
      00000020000000070043617074696F6E21000000040048696E74000B00616345
      78706F7274525446010400000023000000070043617074696F6E250000000A00
      44656661756C7445787426000000060046696C74657224000000040048696E74
      000C0061634578706F727448544D4C010400000028000000070043617074696F
      6E2A0000000A0044656661756C744578742B000000060046696C746572290000
      00040048696E740007006163536574757000000F00616353657475704C657865
      724C6962000006006563436F7079010200000036000000070043617074696F6E
      37000000040048696E74000500656343757401020000003C0000000700436170
      74696F6E3D000000040048696E740007006563506173746501020000003F0000
      00070043617074696F6E40000000040048696E740007006563436C6561720102
      00000042000000070043617074696F6E43000000040048696E74000B00656353
      656C656374416C6C010200000045000000070043617074696F6E460000000400
      48696E740006006563556E646F010200000048000000070043617074696F6E49
      000000040048696E7400060065635265646F01020000004B0000000700436170
      74696F6E4C000000040048696E740008006563496E64656E7401020000004E00
      0000070043617074696F6E4F000000040048696E74000A006563556E696E6465
      6E74010200000051000000070043617074696F6E52000000040048696E74000B
      0065634C6F77657243617365010100000054000000070043617074696F6E000B
      006563557070657243617365010100000056000000070043617074696F6E000B
      0065635469746C6543617365010100000058000000070043617074696F6E000C
      006563546F67676C654361736501010000005A000000070043617074696F6E00
      0E006563436F6D6D656E744C696E657301020000005C00000007004361707469
      6F6E5D000000040048696E740010006563556E436F6D6D656E744C696E657301
      020000005F000000070043617074696F6E60000000040048696E74000A006563
      53686F7754726565010100000062000000070043617074696F6E000F00656353
      6F7274417363656E64696E67010200000065000000070043617074696F6E6600
      0000040048696E740010006563536F727444657363656E64696E670102000000
      68000000070043617074696F6E69000000040048696E74000A00656352656164
      4F6E6C7901020000006E000000070043617074696F6E6F000000040048696E74
      000600656346696E64010100000072000000040048696E740006006563577261
      70010200000074000000070043617074696F6E75000000040048696E74000A00
      65634C696E654E756D73010200000077000000070043617074696F6E78000000
      040048696E740009006563466F6C64696E6701020000007A0000000700436170
      74696F6E7B000000040048696E74000A0065634E6F6E5072696E740102000000
      7D000000070043617074696F6E7E000000040048696E74000200534400000200
      4F4401010000007F000000060046696C746572000D0053796E7461784D616E61
      6765720101000000800000000D004D656E75506C61696E54657874000C005072
      6F70734D616E6167657200000D00656353796E745072696E74657200000B0050
      6F707570456469746F7200000E005442584974656D437478556E646F01020000
      00D2030000070043617074696F6ED3030000040048696E74000E005442584974
      656D4374785265646F0102000000D4030000070043617074696F6ED503000004
      0048696E74001200544258536570617261746F724974656D313400000D005442
      584974656D4374784375740102000000D6030000070043617074696F6ED70300
      00040048696E74000E005442584974656D437478436F70790102000000D80300
      00070043617074696F6ED9030000040048696E74000F005442584974656D4374
      7850617374650102000000DA030000070043617074696F6EDB03000004004869
      6E74000D005442584974656D43747844656C0102000000DC0300000700436170
      74696F6EDD030000040048696E740013005442584974656D43747853656C6563
      74416C6C0102000000DE030000070043617074696F6EDF030000040048696E74
      000D00496D674C69737447757474657200000E0053796E744B65794D61707069
      6E670192040000F403000011004974656D735B305D2E43617465676F72798900
      000014004974656D735B305D2E446973706C61794E616D655804000013004974
      656D735B3130305D2E43617465676F72797B01000016004974656D735B313030
      5D2E446973706C61794E616D655904000013004974656D735B3130315D2E4361
      7465676F72797D01000016004974656D735B3130315D2E446973706C61794E61
      6D655A04000013004974656D735B3130325D2E43617465676F72797F01000016
      004974656D735B3130325D2E446973706C61794E616D655B0400001300497465
      6D735B3130335D2E43617465676F72798101000016004974656D735B3130335D
      2E446973706C61794E616D655C04000013004974656D735B3130345D2E436174
      65676F72798301000016004974656D735B3130345D2E446973706C61794E616D
      655D04000013004974656D735B3130355D2E43617465676F7279850100001600
      4974656D735B3130355D2E446973706C61794E616D655E04000013004974656D
      735B3130365D2E43617465676F72798701000016004974656D735B3130365D2E
      446973706C61794E616D655F04000013004974656D735B3130375D2E43617465
      676F72798901000016004974656D735B3130375D2E446973706C61794E616D65
      6004000013004974656D735B3130385D2E43617465676F72798C010000160049
      74656D735B3130385D2E446973706C61794E616D656104000013004974656D73
      5B3130395D2E43617465676F72798F01000016004974656D735B3130395D2E44
      6973706C61794E616D65FE03000012004974656D735B31305D2E43617465676F
      7279A400000015004974656D735B31305D2E446973706C61794E616D65620400
      0013004974656D735B3131305D2E43617465676F72799201000016004974656D
      735B3131305D2E446973706C61794E616D656304000013004974656D735B3131
      315D2E43617465676F72799501000016004974656D735B3131315D2E44697370
      6C61794E616D656404000013004974656D735B3131325D2E43617465676F7279
      9801000016004974656D735B3131325D2E446973706C61794E616D6565040000
      13004974656D735B3131335D2E43617465676F72799B01000016004974656D73
      5B3131335D2E446973706C61794E616D656604000013004974656D735B313134
      5D2E43617465676F72799E01000016004974656D735B3131345D2E446973706C
      61794E616D656704000013004974656D735B3131355D2E43617465676F7279A1
      01000016004974656D735B3131355D2E446973706C61794E616D656804000013
      004974656D735B3131365D2E43617465676F7279A401000016004974656D735B
      3131365D2E446973706C61794E616D656904000013004974656D735B3131375D
      2E43617465676F7279A701000016004974656D735B3131375D2E446973706C61
      794E616D656A04000013004974656D735B3131385D2E43617465676F7279AA01
      000016004974656D735B3131385D2E446973706C61794E616D656B0400001300
      4974656D735B3131395D2E43617465676F7279AD01000016004974656D735B31
      31395D2E446973706C61794E616D65FF03000012004974656D735B31315D2E43
      617465676F7279A600000015004974656D735B31315D2E446973706C61794E61
      6D656C04000013004974656D735B3132305D2E43617465676F7279B001000016
      004974656D735B3132305D2E446973706C61794E616D656D0400001300497465
      6D735B3132315D2E43617465676F7279B301000016004974656D735B3132315D
      2E446973706C61794E616D656E04000013004974656D735B3132325D2E436174
      65676F7279B601000016004974656D735B3132325D2E446973706C61794E616D
      656F04000013004974656D735B3132335D2E43617465676F7279B90100001600
      4974656D735B3132335D2E446973706C61794E616D657004000013004974656D
      735B3132345D2E43617465676F7279BC01000016004974656D735B3132345D2E
      446973706C61794E616D657104000013004974656D735B3132355D2E43617465
      676F7279BF01000016004974656D735B3132355D2E446973706C61794E616D65
      7204000013004974656D735B3132365D2E43617465676F7279C2010000160049
      74656D735B3132365D2E446973706C61794E616D657304000013004974656D73
      5B3132375D2E43617465676F7279C501000016004974656D735B3132375D2E44
      6973706C61794E616D657404000013004974656D735B3132385D2E4361746567
      6F7279C801000016004974656D735B3132385D2E446973706C61794E616D6575
      04000013004974656D735B3132395D2E43617465676F7279CA01000016004974
      656D735B3132395D2E446973706C61794E616D650004000012004974656D735B
      31325D2E43617465676F7279A800000015004974656D735B31325D2E44697370
      6C61794E616D657604000013004974656D735B3133305D2E43617465676F7279
      CC01000016004974656D735B3133305D2E446973706C61794E616D6577040000
      13004974656D735B3133315D2E43617465676F7279CE01000016004974656D73
      5B3133315D2E446973706C61794E616D657804000013004974656D735B313332
      5D2E43617465676F7279D001000016004974656D735B3133325D2E446973706C
      61794E616D657904000013004974656D735B3133335D2E43617465676F7279D3
      01000016004974656D735B3133335D2E446973706C61794E616D657A04000013
      004974656D735B3133345D2E43617465676F7279D601000016004974656D735B
      3133345D2E446973706C61794E616D657B04000013004974656D735B3133355D
      2E43617465676F7279D801000016004974656D735B3133355D2E446973706C61
      794E616D657C04000013004974656D735B3133365D2E43617465676F7279DA01
      000016004974656D735B3133365D2E446973706C61794E616D657D0400001300
      4974656D735B3133375D2E43617465676F7279DD01000016004974656D735B31
      33375D2E446973706C61794E616D657E04000013004974656D735B3133385D2E
      43617465676F7279E001000016004974656D735B3133385D2E446973706C6179
      4E616D657F04000013004974656D735B3133395D2E43617465676F7279E30100
      0016004974656D735B3133395D2E446973706C61794E616D6501040000120049
      74656D735B31335D2E43617465676F7279AA00000015004974656D735B31335D
      2E446973706C61794E616D658004000013004974656D735B3134305D2E436174
      65676F7279E601000016004974656D735B3134305D2E446973706C61794E616D
      658104000013004974656D735B3134315D2E43617465676F7279E90100001600
      4974656D735B3134315D2E446973706C61794E616D658204000013004974656D
      735B3134325D2E43617465676F7279EC01000016004974656D735B3134325D2E
      446973706C61794E616D658304000013004974656D735B3134335D2E43617465
      676F7279EF01000016004974656D735B3134335D2E446973706C61794E616D65
      8404000013004974656D735B3134345D2E43617465676F7279F2010000160049
      74656D735B3134345D2E446973706C61794E616D658504000013004974656D73
      5B3134355D2E43617465676F7279F501000016004974656D735B3134355D2E44
      6973706C61794E616D658604000013004974656D735B3134365D2E4361746567
      6F7279F801000016004974656D735B3134365D2E446973706C61794E616D6587
      04000013004974656D735B3134375D2E43617465676F7279FB01000016004974
      656D735B3134375D2E446973706C61794E616D658804000013004974656D735B
      3134385D2E43617465676F7279FE01000016004974656D735B3134385D2E4469
      73706C61794E616D658904000013004974656D735B3134395D2E43617465676F
      72790102000016004974656D735B3134395D2E446973706C61794E616D650204
      000012004974656D735B31345D2E43617465676F7279AC00000015004974656D
      735B31345D2E446973706C61794E616D658A04000013004974656D735B313530
      5D2E43617465676F72790402000016004974656D735B3135305D2E446973706C
      61794E616D658B04000013004974656D735B3135315D2E43617465676F727907
      02000016004974656D735B3135315D2E446973706C61794E616D658C04000013
      004974656D735B3135325D2E43617465676F72790A02000016004974656D735B
      3135325D2E446973706C61794E616D658D04000013004974656D735B3135335D
      2E43617465676F72790D02000016004974656D735B3135335D2E446973706C61
      794E616D658E04000013004974656D735B3135345D2E43617465676F72791002
      000016004974656D735B3135345D2E446973706C61794E616D658F0400001300
      4974656D735B3135355D2E43617465676F72791302000016004974656D735B31
      35355D2E446973706C61794E616D659004000013004974656D735B3135365D2E
      43617465676F72791602000016004974656D735B3135365D2E446973706C6179
      4E616D659104000013004974656D735B3135375D2E43617465676F7279190200
      0016004974656D735B3135375D2E446973706C61794E616D6592040000130049
      74656D735B3135385D2E43617465676F72791C02000016004974656D735B3135
      385D2E446973706C61794E616D659304000013004974656D735B3135395D2E43
      617465676F72791F02000016004974656D735B3135395D2E446973706C61794E
      616D650304000012004974656D735B31355D2E43617465676F7279AE00000015
      004974656D735B31355D2E446973706C61794E616D659404000013004974656D
      735B3136305D2E43617465676F72792202000016004974656D735B3136305D2E
      446973706C61794E616D659504000013004974656D735B3136315D2E43617465
      676F72792502000016004974656D735B3136315D2E446973706C61794E616D65
      9604000013004974656D735B3136325D2E43617465676F727928020000160049
      74656D735B3136325D2E446973706C61794E616D659704000013004974656D73
      5B3136335D2E43617465676F72792B02000016004974656D735B3136335D2E44
      6973706C61794E616D659804000013004974656D735B3136345D2E4361746567
      6F72792E02000016004974656D735B3136345D2E446973706C61794E616D6599
      04000013004974656D735B3136355D2E43617465676F72793102000016004974
      656D735B3136355D2E446973706C61794E616D659A04000013004974656D735B
      3136365D2E43617465676F72793402000016004974656D735B3136365D2E4469
      73706C61794E616D659B04000013004974656D735B3136375D2E43617465676F
      72793702000016004974656D735B3136375D2E446973706C61794E616D659C04
      000013004974656D735B3136385D2E43617465676F72793A0200001600497465
      6D735B3136385D2E446973706C61794E616D659D04000013004974656D735B31
      36395D2E43617465676F72793D02000016004974656D735B3136395D2E446973
      706C61794E616D650404000012004974656D735B31365D2E43617465676F7279
      B000000015004974656D735B31365D2E446973706C61794E616D659E04000013
      004974656D735B3137305D2E43617465676F72794002000016004974656D735B
      3137305D2E446973706C61794E616D659F04000013004974656D735B3137315D
      2E43617465676F72794302000016004974656D735B3137315D2E446973706C61
      794E616D65A004000013004974656D735B3137325D2E43617465676F72794602
      000016004974656D735B3137325D2E446973706C61794E616D65A10400001300
      4974656D735B3137335D2E43617465676F72794902000016004974656D735B31
      37335D2E446973706C61794E616D65A204000013004974656D735B3137345D2E
      43617465676F72794C02000016004974656D735B3137345D2E446973706C6179
      4E616D65A304000013004974656D735B3137355D2E43617465676F72794F0200
      0016004974656D735B3137355D2E446973706C61794E616D65A4040000130049
      74656D735B3137365D2E43617465676F72795202000016004974656D735B3137
      365D2E446973706C61794E616D65A504000013004974656D735B3137375D2E43
      617465676F72795502000016004974656D735B3137375D2E446973706C61794E
      616D65A604000013004974656D735B3137385D2E43617465676F727958020000
      16004974656D735B3137385D2E446973706C61794E616D65A704000013004974
      656D735B3137395D2E43617465676F72795B02000016004974656D735B313739
      5D2E446973706C61794E616D650504000012004974656D735B31375D2E436174
      65676F7279B200000015004974656D735B31375D2E446973706C61794E616D65
      A804000013004974656D735B3138305D2E43617465676F72795E020000160049
      74656D735B3138305D2E446973706C61794E616D65A904000013004974656D73
      5B3138315D2E43617465676F72796102000016004974656D735B3138315D2E44
      6973706C61794E616D65AA04000013004974656D735B3138325D2E4361746567
      6F72796402000016004974656D735B3138325D2E446973706C61794E616D65AB
      04000013004974656D735B3138335D2E43617465676F72796702000016004974
      656D735B3138335D2E446973706C61794E616D65AC04000013004974656D735B
      3138345D2E43617465676F72796A02000016004974656D735B3138345D2E4469
      73706C61794E616D65AD04000013004974656D735B3138355D2E43617465676F
      72796D02000016004974656D735B3138355D2E446973706C61794E616D65AE04
      000013004974656D735B3138365D2E43617465676F7279700200001600497465
      6D735B3138365D2E446973706C61794E616D65AF04000013004974656D735B31
      38375D2E43617465676F72797302000016004974656D735B3138375D2E446973
      706C61794E616D65B004000013004974656D735B3138385D2E43617465676F72
      797602000016004974656D735B3138385D2E446973706C61794E616D65B10400
      0013004974656D735B3138395D2E43617465676F72797902000016004974656D
      735B3138395D2E446973706C61794E616D650604000012004974656D735B3138
      5D2E43617465676F7279B400000015004974656D735B31385D2E446973706C61
      794E616D65B204000013004974656D735B3139305D2E43617465676F72797C02
      000016004974656D735B3139305D2E446973706C61794E616D65B30400001300
      4974656D735B3139315D2E43617465676F72797E02000016004974656D735B31
      39315D2E446973706C61794E616D65B404000013004974656D735B3139325D2E
      43617465676F72798102000016004974656D735B3139325D2E446973706C6179
      4E616D65B504000013004974656D735B3139335D2E43617465676F7279840200
      0016004974656D735B3139335D2E446973706C61794E616D65B6040000130049
      74656D735B3139345D2E43617465676F72798702000016004974656D735B3139
      345D2E446973706C61794E616D65B704000013004974656D735B3139355D2E43
      617465676F72798A02000016004974656D735B3139355D2E446973706C61794E
      616D65B804000013004974656D735B3139365D2E43617465676F72798D020000
      16004974656D735B3139365D2E446973706C61794E616D65B904000013004974
      656D735B3139375D2E43617465676F72799002000016004974656D735B313937
      5D2E446973706C61794E616D65BA04000013004974656D735B3139385D2E4361
      7465676F72799302000016004974656D735B3139385D2E446973706C61794E61
      6D65BB04000013004974656D735B3139395D2E43617465676F72799602000016
      004974656D735B3139395D2E446973706C61794E616D65070400001200497465
      6D735B31395D2E43617465676F7279B600000015004974656D735B31395D2E44
      6973706C61794E616D65F503000011004974656D735B315D2E43617465676F72
      798B00000014004974656D735B315D2E446973706C61794E616D65BC04000013
      004974656D735B3230305D2E43617465676F72799802000016004974656D735B
      3230305D2E446973706C61794E616D65BD04000013004974656D735B3230315D
      2E43617465676F72799A02000016004974656D735B3230315D2E446973706C61
      794E616D65BE04000013004974656D735B3230325D2E43617465676F72799C02
      000016004974656D735B3230325D2E446973706C61794E616D65BF0400001300
      4974656D735B3230335D2E43617465676F72799E02000016004974656D735B32
      30335D2E446973706C61794E616D65C004000013004974656D735B3230345D2E
      43617465676F7279A002000016004974656D735B3230345D2E446973706C6179
      4E616D65C104000013004974656D735B3230355D2E43617465676F7279A20200
      0016004974656D735B3230355D2E446973706C61794E616D65C2040000130049
      74656D735B3230365D2E43617465676F7279A402000016004974656D735B3230
      365D2E446973706C61794E616D65C304000013004974656D735B3230375D2E43
      617465676F7279A602000016004974656D735B3230375D2E446973706C61794E
      616D65C404000013004974656D735B3230385D2E43617465676F7279A8020000
      16004974656D735B3230385D2E446973706C61794E616D65CB04000013004974
      656D735B3230395D2E43617465676F7279CC04000016004974656D735B323039
      5D2E446973706C61794E616D650804000012004974656D735B32305D2E436174
      65676F7279B800000015004974656D735B32305D2E446973706C61794E616D65
      CD04000013004974656D735B3231305D2E43617465676F7279CE040000160049
      74656D735B3231305D2E446973706C61794E616D65CF04000013004974656D73
      5B3231315D2E43617465676F7279D004000016004974656D735B3231315D2E44
      6973706C61794E616D65D104000013004974656D735B3231325D2E4361746567
      6F7279D204000016004974656D735B3231325D2E446973706C61794E616D65DC
      04000013004974656D735B3231335D2E43617465676F7279DD04000016004974
      656D735B3231335D2E446973706C61794E616D65EE04000013004974656D735B
      3231345D2E43617465676F7279EF04000016004974656D735B3231345D2E4469
      73706C61794E616D65F004000013004974656D735B3231355D2E43617465676F
      7279F104000016004974656D735B3231355D2E446973706C61794E616D65F204
      000013004974656D735B3231365D2E43617465676F7279F30400001600497465
      6D735B3231365D2E446973706C61794E616D65F404000013004974656D735B32
      31375D2E43617465676F7279F504000016004974656D735B3231375D2E446973
      706C61794E616D650605000013004974656D735B3231385D2E43617465676F72
      790705000016004974656D735B3231385D2E446973706C61794E616D652B0500
      0013004974656D735B3231395D2E43617465676F72792C05000016004974656D
      735B3231395D2E446973706C61794E616D650904000012004974656D735B3231
      5D2E43617465676F7279BA00000015004974656D735B32315D2E446973706C61
      794E616D653605000013004974656D735B3232305D2E43617465676F72793705
      000016004974656D735B3232305D2E446973706C61794E616D65380500001300
      4974656D735B3232315D2E43617465676F72793905000016004974656D735B32
      32315D2E446973706C61794E616D653A05000013004974656D735B3232325D2E
      43617465676F72793B05000016004974656D735B3232325D2E446973706C6179
      4E616D654A05000013004974656D735B3232335D2E43617465676F72794B0500
      0016004974656D735B3232335D2E446973706C61794E616D6551050000130049
      74656D735B3232345D2E43617465676F72795205000016004974656D735B3232
      345D2E446973706C61794E616D656D05000013004974656D735B3232355D2E43
      617465676F72796E05000016004974656D735B3232355D2E446973706C61794E
      616D656F05000013004974656D735B3232365D2E43617465676F727970050000
      16004974656D735B3232365D2E446973706C61794E616D657105000013004974
      656D735B3232375D2E43617465676F72797205000016004974656D735B323237
      5D2E446973706C61794E616D657305000013004974656D735B3232385D2E4361
      7465676F72797405000016004974656D735B3232385D2E446973706C61794E61
      6D657505000013004974656D735B3232395D2E43617465676F72797605000016
      004974656D735B3232395D2E446973706C61794E616D650A0400001200497465
      6D735B32325D2E43617465676F7279BC00000015004974656D735B32325D2E44
      6973706C61794E616D657705000013004974656D735B3233305D2E4361746567
      6F72797805000016004974656D735B3233305D2E446973706C61794E616D6579
      05000013004974656D735B3233315D2E43617465676F72797A05000016004974
      656D735B3233315D2E446973706C61794E616D657B05000013004974656D735B
      3233325D2E43617465676F72797C05000016004974656D735B3233325D2E4469
      73706C61794E616D657D05000013004974656D735B3233335D2E43617465676F
      72797E05000016004974656D735B3233335D2E446973706C61794E616D657F05
      000013004974656D735B3233345D2E43617465676F7279800500001600497465
      6D735B3233345D2E446973706C61794E616D658105000013004974656D735B32
      33355D2E43617465676F72798205000016004974656D735B3233355D2E446973
      706C61794E616D658305000013004974656D735B3233365D2E43617465676F72
      798405000016004974656D735B3233365D2E446973706C61794E616D65A70500
      0013004974656D735B3233375D2E43617465676F7279A805000016004974656D
      735B3233375D2E446973706C61794E616D65B205000013004974656D735B3233
      385D2E43617465676F7279B305000016004974656D735B3233385D2E44697370
      6C61794E616D65B405000013004974656D735B3233395D2E43617465676F7279
      B505000016004974656D735B3233395D2E446973706C61794E616D650B040000
      12004974656D735B32335D2E43617465676F7279BE00000015004974656D735B
      32335D2E446973706C61794E616D65B705000013004974656D735B3234305D2E
      43617465676F7279B805000016004974656D735B3234305D2E446973706C6179
      4E616D65C205000013004974656D735B3234315D2E43617465676F7279C30500
      0016004974656D735B3234315D2E446973706C61794E616D65D0050000130049
      74656D735B3234325D2E43617465676F7279D105000016004974656D735B3234
      325D2E446973706C61794E616D65D505000013004974656D735B3234335D2E43
      617465676F7279D605000016004974656D735B3234335D2E446973706C61794E
      616D65D805000013004974656D735B3234345D2E43617465676F7279D9050000
      16004974656D735B3234345D2E446973706C61794E616D65F505000013004974
      656D735B3234355D2E43617465676F7279F605000016004974656D735B323435
      5D2E446973706C61794E616D651406000013004974656D735B3234365D2E4361
      7465676F72791506000016004974656D735B3234365D2E446973706C61794E61
      6D651606000013004974656D735B3234375D2E43617465676F72791706000016
      004974656D735B3234375D2E446973706C61794E616D652A0600001300497465
      6D735B3234385D2E43617465676F72792B06000016004974656D735B3234385D
      2E446973706C61794E616D652F06000013004974656D735B3234395D2E436174
      65676F72793006000016004974656D735B3234395D2E446973706C61794E616D
      650C04000012004974656D735B32345D2E43617465676F7279C0000000150049
      74656D735B32345D2E446973706C61794E616D653106000013004974656D735B
      3235305D2E43617465676F72793206000016004974656D735B3235305D2E4469
      73706C61794E616D653706000013004974656D735B3235315D2E43617465676F
      72793806000016004974656D735B3235315D2E446973706C61794E616D653906
      000013004974656D735B3235325D2E43617465676F72793A0600001600497465
      6D735B3235325D2E446973706C61794E616D653D06000013004974656D735B32
      35335D2E43617465676F72793E06000016004974656D735B3235335D2E446973
      706C61794E616D653F06000013004974656D735B3235345D2E43617465676F72
      794006000016004974656D735B3235345D2E446973706C61794E616D65420600
      0013004974656D735B3235355D2E43617465676F72794306000016004974656D
      735B3235355D2E446973706C61794E616D654E06000013004974656D735B3235
      365D2E43617465676F72794F06000016004974656D735B3235365D2E44697370
      6C61794E616D655406000013004974656D735B3235375D2E43617465676F7279
      5506000016004974656D735B3235375D2E446973706C61794E616D6556060000
      13004974656D735B3235385D2E43617465676F72795706000016004974656D73
      5B3235385D2E446973706C61794E616D655D06000013004974656D735B323539
      5D2E43617465676F72795E06000016004974656D735B3235395D2E446973706C
      61794E616D650D04000012004974656D735B32355D2E43617465676F7279C200
      000015004974656D735B32355D2E446973706C61794E616D6560060000130049
      74656D735B3236305D2E43617465676F72796106000016004974656D735B3236
      305D2E446973706C61794E616D656406000013004974656D735B3236315D2E43
      617465676F72796506000016004974656D735B3236315D2E446973706C61794E
      616D657006000013004974656D735B3236325D2E43617465676F727971060000
      16004974656D735B3236325D2E446973706C61794E616D657306000013004974
      656D735B3236335D2E43617465676F72797406000016004974656D735B323633
      5D2E446973706C61794E616D657506000013004974656D735B3236345D2E4361
      7465676F72797606000016004974656D735B3236345D2E446973706C61794E61
      6D657E06000013004974656D735B3236355D2E43617465676F72797F06000016
      004974656D735B3236355D2E446973706C61794E616D65870600001300497465
      6D735B3236365D2E43617465676F72798806000016004974656D735B3236365D
      2E446973706C61794E616D658906000013004974656D735B3236375D2E436174
      65676F72798A06000016004974656D735B3236375D2E446973706C61794E616D
      658B06000013004974656D735B3236385D2E43617465676F72798C0600001600
      4974656D735B3236385D2E446973706C61794E616D658D06000013004974656D
      735B3236395D2E43617465676F72798E06000016004974656D735B3236395D2E
      446973706C61794E616D650E04000012004974656D735B32365D2E4361746567
      6F7279C500000015004974656D735B32365D2E446973706C61794E616D659F06
      000013004974656D735B3237305D2E43617465676F7279A00600001600497465
      6D735B3237305D2E446973706C61794E616D65A106000013004974656D735B32
      37315D2E43617465676F7279A206000016004974656D735B3237315D2E446973
      706C61794E616D65A306000013004974656D735B3237325D2E43617465676F72
      79A406000016004974656D735B3237325D2E446973706C61794E616D65A50600
      0013004974656D735B3237335D2E43617465676F7279A606000016004974656D
      735B3237335D2E446973706C61794E616D65B206000013004974656D735B3237
      345D2E43617465676F7279B306000016004974656D735B3237345D2E44697370
      6C61794E616D65B406000013004974656D735B3237355D2E43617465676F7279
      B506000016004974656D735B3237355D2E446973706C61794E616D65B8060000
      13004974656D735B3237365D2E43617465676F7279B906000016004974656D73
      5B3237365D2E446973706C61794E616D65BA06000013004974656D735B323737
      5D2E43617465676F7279BB06000016004974656D735B3237375D2E446973706C
      61794E616D65D006000013004974656D735B3237385D2E43617465676F7279D1
      06000016004974656D735B3237385D2E446973706C61794E616D65DA06000013
      004974656D735B3237395D2E43617465676F7279DB06000016004974656D735B
      3237395D2E446973706C61794E616D650F04000012004974656D735B32375D2E
      43617465676F7279C800000015004974656D735B32375D2E446973706C61794E
      616D65DC06000013004974656D735B3238305D2E43617465676F7279DD060000
      16004974656D735B3238305D2E446973706C61794E616D65DE06000013004974
      656D735B3238315D2E43617465676F7279DF06000016004974656D735B323831
      5D2E446973706C61794E616D65E006000013004974656D735B3238325D2E4361
      7465676F7279E106000016004974656D735B3238325D2E446973706C61794E61
      6D65E206000013004974656D735B3238335D2E43617465676F7279E306000016
      004974656D735B3238335D2E446973706C61794E616D65E40600001300497465
      6D735B3238345D2E43617465676F7279E506000016004974656D735B3238345D
      2E446973706C61794E616D65E606000013004974656D735B3238355D2E436174
      65676F7279E706000016004974656D735B3238355D2E446973706C61794E616D
      65E806000013004974656D735B3238365D2E43617465676F7279E90600001600
      4974656D735B3238365D2E446973706C61794E616D65EA06000013004974656D
      735B3238375D2E43617465676F7279EB06000016004974656D735B3238375D2E
      446973706C61794E616D65EC06000013004974656D735B3238385D2E43617465
      676F7279ED06000016004974656D735B3238385D2E446973706C61794E616D65
      F406000013004974656D735B3238395D2E43617465676F7279F5060000160049
      74656D735B3238395D2E446973706C61794E616D651004000012004974656D73
      5B32385D2E43617465676F7279CB00000015004974656D735B32385D2E446973
      706C61794E616D65F606000013004974656D735B3239305D2E43617465676F72
      79F706000016004974656D735B3239305D2E446973706C61794E616D65F80600
      0013004974656D735B3239315D2E43617465676F7279F906000016004974656D
      735B3239315D2E446973706C61794E616D65FD06000013004974656D735B3239
      325D2E43617465676F7279FE06000016004974656D735B3239325D2E44697370
      6C61794E616D65FF06000013004974656D735B3239335D2E43617465676F7279
      0007000016004974656D735B3239335D2E446973706C61794E616D6501070000
      13004974656D735B3239345D2E43617465676F72790207000016004974656D73
      5B3239345D2E446973706C61794E616D650307000013004974656D735B323935
      5D2E43617465676F72790407000016004974656D735B3239355D2E446973706C
      61794E616D650507000013004974656D735B3239365D2E43617465676F727906
      07000016004974656D735B3239365D2E446973706C61794E616D651507000013
      004974656D735B3239375D2E43617465676F72791607000016004974656D735B
      3239375D2E446973706C61794E616D651B07000013004974656D735B3239385D
      2E43617465676F72791C07000016004974656D735B3239385D2E446973706C61
      794E616D651F07000013004974656D735B3239395D2E43617465676F72792007
      000016004974656D735B3239395D2E446973706C61794E616D65110400001200
      4974656D735B32395D2E43617465676F7279CE00000015004974656D735B3239
      5D2E446973706C61794E616D65F603000011004974656D735B325D2E43617465
      676F72798E00000014004974656D735B325D2E446973706C61794E616D652107
      000013004974656D735B3330305D2E43617465676F7279220700001600497465
      6D735B3330305D2E446973706C61794E616D652A07000013004974656D735B33
      30315D2E43617465676F72792B07000016004974656D735B3330315D2E446973
      706C61794E616D652C07000013004974656D735B3330325D2E43617465676F72
      792D07000016004974656D735B3330325D2E446973706C61794E616D65330700
      0013004974656D735B3330335D2E43617465676F72793407000016004974656D
      735B3330335D2E446973706C61794E616D653507000013004974656D735B3330
      345D2E43617465676F72793607000016004974656D735B3330345D2E44697370
      6C61794E616D653B07000013004974656D735B3330355D2E43617465676F7279
      3C07000016004974656D735B3330355D2E446973706C61794E616D653D070000
      13004974656D735B3330365D2E43617465676F72793E07000016004974656D73
      5B3330365D2E446973706C61794E616D653F07000013004974656D735B333037
      5D2E43617465676F72794007000016004974656D735B3330375D2E446973706C
      61794E616D654107000013004974656D735B3330385D2E43617465676F727942
      07000016004974656D735B3330385D2E446973706C61794E616D654307000013
      004974656D735B3330395D2E43617465676F72794407000016004974656D735B
      3330395D2E446973706C61794E616D651204000012004974656D735B33305D2E
      43617465676F7279D100000015004974656D735B33305D2E446973706C61794E
      616D654507000013004974656D735B3331305D2E43617465676F727946070000
      16004974656D735B3331305D2E446973706C61794E616D654707000013004974
      656D735B3331315D2E43617465676F72794807000016004974656D735B333131
      5D2E446973706C61794E616D654907000013004974656D735B3331325D2E4361
      7465676F72794A07000016004974656D735B3331325D2E446973706C61794E61
      6D654B07000013004974656D735B3331335D2E43617465676F72794C07000016
      004974656D735B3331335D2E446973706C61794E616D654D0700001300497465
      6D735B3331345D2E43617465676F72794E07000016004974656D735B3331345D
      2E446973706C61794E616D656007000013004974656D735B3331355D2E436174
      65676F72796107000016004974656D735B3331355D2E446973706C61794E616D
      656207000013004974656D735B3331365D2E43617465676F7279630700001600
      4974656D735B3331365D2E446973706C61794E616D656D07000013004974656D
      735B3331375D2E43617465676F72796E07000016004974656D735B3331375D2E
      446973706C61794E616D656F07000013004974656D735B3331385D2E43617465
      676F72797007000016004974656D735B3331385D2E446973706C61794E616D65
      7107000013004974656D735B3331395D2E43617465676F727972070000160049
      74656D735B3331395D2E446973706C61794E616D651304000012004974656D73
      5B33315D2E43617465676F7279D400000015004974656D735B33315D2E446973
      706C61794E616D657307000013004974656D735B3332305D2E43617465676F72
      797407000016004974656D735B3332305D2E446973706C61794E616D65760700
      0013004974656D735B3332315D2E43617465676F72797707000016004974656D
      735B3332315D2E446973706C61794E616D657A07000013004974656D735B3332
      325D2E43617465676F72797B07000016004974656D735B3332325D2E44697370
      6C61794E616D657C07000013004974656D735B3332335D2E43617465676F7279
      7D07000016004974656D735B3332335D2E446973706C61794E616D6582070000
      13004974656D735B3332345D2E43617465676F72798307000016004974656D73
      5B3332345D2E446973706C61794E616D658407000013004974656D735B333235
      5D2E43617465676F72798507000016004974656D735B3332355D2E446973706C
      61794E616D658807000013004974656D735B3332365D2E43617465676F727989
      07000016004974656D735B3332365D2E446973706C61794E616D658A07000013
      004974656D735B3332375D2E43617465676F72798B07000016004974656D735B
      3332375D2E446973706C61794E616D658C07000013004974656D735B3332385D
      2E43617465676F72798D07000016004974656D735B3332385D2E446973706C61
      794E616D658E07000013004974656D735B3332395D2E43617465676F72798F07
      000016004974656D735B3332395D2E446973706C61794E616D65140400001200
      4974656D735B33325D2E43617465676F7279D700000015004974656D735B3332
      5D2E446973706C61794E616D659007000013004974656D735B3333305D2E4361
      7465676F72799107000016004974656D735B3333305D2E446973706C61794E61
      6D659207000013004974656D735B3333315D2E43617465676F72799307000016
      004974656D735B3333315D2E446973706C61794E616D65940700001300497465
      6D735B3333325D2E43617465676F72799507000016004974656D735B3333325D
      2E446973706C61794E616D659E07000013004974656D735B3333335D2E436174
      65676F72799F07000016004974656D735B3333335D2E446973706C61794E616D
      65A007000013004974656D735B3333345D2E43617465676F7279A10700001600
      4974656D735B3333345D2E446973706C61794E616D65AB07000013004974656D
      735B3333355D2E43617465676F7279AC07000016004974656D735B3333355D2E
      446973706C61794E616D65B107000013004974656D735B3333365D2E43617465
      676F7279B207000016004974656D735B3333365D2E446973706C61794E616D65
      B407000013004974656D735B3333375D2E43617465676F7279B5070000160049
      74656D735B3333375D2E446973706C61794E616D65B607000013004974656D73
      5B3333385D2E43617465676F7279B707000016004974656D735B3333385D2E44
      6973706C61794E616D65BA07000013004974656D735B3333395D2E4361746567
      6F7279BB07000016004974656D735B3333395D2E446973706C61794E616D6515
      04000012004974656D735B33335D2E43617465676F7279D90000001500497465
      6D735B33335D2E446973706C61794E616D65BC07000013004974656D735B3334
      305D2E43617465676F7279BD07000016004974656D735B3334305D2E44697370
      6C61794E616D65BE07000013004974656D735B3334315D2E43617465676F7279
      BF07000016004974656D735B3334315D2E446973706C61794E616D65C0070000
      13004974656D735B3334325D2E43617465676F7279C107000016004974656D73
      5B3334325D2E446973706C61794E616D65C207000013004974656D735B333433
      5D2E43617465676F7279C307000016004974656D735B3334335D2E446973706C
      61794E616D65C407000013004974656D735B3334345D2E43617465676F7279C5
      07000016004974656D735B3334345D2E446973706C61794E616D65C607000013
      004974656D735B3334355D2E43617465676F7279C707000016004974656D735B
      3334355D2E446973706C61794E616D65C807000013004974656D735B3334365D
      2E43617465676F7279C907000016004974656D735B3334365D2E446973706C61
      794E616D65CA07000013004974656D735B3334375D2E43617465676F7279CB07
      000016004974656D735B3334375D2E446973706C61794E616D65CC0700001300
      4974656D735B3334385D2E43617465676F7279CD07000016004974656D735B33
      34385D2E446973706C61794E616D65CE07000013004974656D735B3334395D2E
      43617465676F7279CF07000016004974656D735B3334395D2E446973706C6179
      4E616D651604000012004974656D735B33345D2E43617465676F7279DC000000
      15004974656D735B33345D2E446973706C61794E616D65D00700001300497465
      6D735B3335305D2E43617465676F7279D107000016004974656D735B3335305D
      2E446973706C61794E616D65D207000013004974656D735B3335315D2E436174
      65676F7279D307000016004974656D735B3335315D2E446973706C61794E616D
      65D407000013004974656D735B3335325D2E43617465676F7279D50700001600
      4974656D735B3335325D2E446973706C61794E616D65D607000013004974656D
      735B3335335D2E43617465676F7279D707000016004974656D735B3335335D2E
      446973706C61794E616D65D807000013004974656D735B3335345D2E43617465
      676F7279D907000016004974656D735B3335345D2E446973706C61794E616D65
      DA07000013004974656D735B3335355D2E43617465676F7279DB070000160049
      74656D735B3335355D2E446973706C61794E616D65DC07000013004974656D73
      5B3335365D2E43617465676F7279DD07000016004974656D735B3335365D2E44
      6973706C61794E616D65DE07000013004974656D735B3335375D2E4361746567
      6F7279DF07000016004974656D735B3335375D2E446973706C61794E616D65E0
      07000013004974656D735B3335385D2E43617465676F7279E107000016004974
      656D735B3335385D2E446973706C61794E616D65EB07000013004974656D735B
      3335395D2E43617465676F7279EC07000016004974656D735B3335395D2E4469
      73706C61794E616D651704000012004974656D735B33355D2E43617465676F72
      79DF00000015004974656D735B33355D2E446973706C61794E616D65ED070000
      13004974656D735B3336305D2E43617465676F7279EE07000016004974656D73
      5B3336305D2E446973706C61794E616D65EF07000013004974656D735B333631
      5D2E43617465676F7279F007000016004974656D735B3336315D2E446973706C
      61794E616D65F107000013004974656D735B3336325D2E43617465676F7279F2
      07000016004974656D735B3336325D2E446973706C61794E616D65F307000013
      004974656D735B3336335D2E43617465676F7279F407000016004974656D735B
      3336335D2E446973706C61794E616D65F507000013004974656D735B3336345D
      2E43617465676F7279F607000016004974656D735B3336345D2E446973706C61
      794E616D65F707000013004974656D735B3336355D2E43617465676F7279F807
      000016004974656D735B3336355D2E446973706C61794E616D65F90700001300
      4974656D735B3336365D2E43617465676F7279FA07000016004974656D735B33
      36365D2E446973706C61794E616D65FB07000013004974656D735B3336375D2E
      43617465676F7279FC07000016004974656D735B3336375D2E446973706C6179
      4E616D65FD07000013004974656D735B3336385D2E43617465676F7279FE0700
      0016004974656D735B3336385D2E446973706C61794E616D65FF070000130049
      74656D735B3336395D2E43617465676F72790008000016004974656D735B3336
      395D2E446973706C61794E616D651804000012004974656D735B33365D2E4361
      7465676F7279E200000015004974656D735B33365D2E446973706C61794E616D
      650108000013004974656D735B3337305D2E43617465676F7279020800001600
      4974656D735B3337305D2E446973706C61794E616D650308000013004974656D
      735B3337315D2E43617465676F72790408000016004974656D735B3337315D2E
      446973706C61794E616D650508000013004974656D735B3337325D2E43617465
      676F72790608000016004974656D735B3337325D2E446973706C61794E616D65
      0708000013004974656D735B3337335D2E43617465676F727908080000160049
      74656D735B3337335D2E446973706C61794E616D650908000013004974656D73
      5B3337345D2E43617465676F72790A08000016004974656D735B3337345D2E44
      6973706C61794E616D650B08000013004974656D735B3337355D2E4361746567
      6F72790C08000016004974656D735B3337355D2E446973706C61794E616D650D
      08000013004974656D735B3337365D2E43617465676F72790E08000016004974
      656D735B3337365D2E446973706C61794E616D650F08000013004974656D735B
      3337375D2E43617465676F72791008000016004974656D735B3337375D2E4469
      73706C61794E616D651108000013004974656D735B3337385D2E43617465676F
      72791208000016004974656D735B3337385D2E446973706C61794E616D651308
      000013004974656D735B3337395D2E43617465676F7279140800001600497465
      6D735B3337395D2E446973706C61794E616D651904000012004974656D735B33
      375D2E43617465676F7279E500000015004974656D735B33375D2E446973706C
      61794E616D651D08000013004974656D735B3338305D2E43617465676F72791E
      08000016004974656D735B3338305D2E446973706C61794E616D651F08000013
      004974656D735B3338315D2E43617465676F72792008000016004974656D735B
      3338315D2E446973706C61794E616D652108000013004974656D735B3338325D
      2E43617465676F72792208000016004974656D735B3338325D2E446973706C61
      794E616D652308000013004974656D735B3338335D2E43617465676F72792408
      000016004974656D735B3338335D2E446973706C61794E616D65260800001300
      4974656D735B3338345D2E43617465676F72792708000016004974656D735B33
      38345D2E446973706C61794E616D652808000013004974656D735B3338355D2E
      43617465676F72792908000016004974656D735B3338355D2E446973706C6179
      4E616D652A08000013004974656D735B3338365D2E43617465676F72792B0800
      0016004974656D735B3338365D2E446973706C61794E616D652C080000130049
      74656D735B3338375D2E43617465676F72792D08000016004974656D735B3338
      375D2E446973706C61794E616D653208000013004974656D735B3338385D2E43
      617465676F72793308000016004974656D735B3338385D2E446973706C61794E
      616D653608000013004974656D735B3338395D2E43617465676F727937080000
      16004974656D735B3338395D2E446973706C61794E616D651A04000012004974
      656D735B33385D2E43617465676F7279E800000015004974656D735B33385D2E
      446973706C61794E616D653B08000013004974656D735B3339305D2E43617465
      676F72793C08000016004974656D735B3339305D2E446973706C61794E616D65
      4008000013004974656D735B3339315D2E43617465676F727941080000160049
      74656D735B3339315D2E446973706C61794E616D654208000013004974656D73
      5B3339325D2E43617465676F72794308000016004974656D735B3339325D2E44
      6973706C61794E616D654608000013004974656D735B3339335D2E4361746567
      6F72794708000016004974656D735B3339335D2E446973706C61794E616D6549
      08000013004974656D735B3339345D2E43617465676F72794A08000016004974
      656D735B3339345D2E446973706C61794E616D654D08000013004974656D735B
      3339355D2E43617465676F72794E08000016004974656D735B3339355D2E4469
      73706C61794E616D655308000013004974656D735B3339365D2E43617465676F
      72795408000016004974656D735B3339365D2E446973706C61794E616D655608
      000013004974656D735B3339375D2E43617465676F7279570800001600497465
      6D735B3339375D2E446973706C61794E616D655808000013004974656D735B33
      39385D2E43617465676F72795908000016004974656D735B3339385D2E446973
      706C61794E616D655A08000013004974656D735B3339395D2E43617465676F72
      795B08000016004974656D735B3339395D2E446973706C61794E616D651B0400
      0012004974656D735B33395D2E43617465676F7279EB00000015004974656D73
      5B33395D2E446973706C61794E616D65F703000011004974656D735B335D2E43
      617465676F72799100000014004974656D735B335D2E446973706C61794E616D
      655C08000013004974656D735B3430305D2E43617465676F72795D0800001600
      4974656D735B3430305D2E446973706C61794E616D656208000013004974656D
      735B3430315D2E43617465676F72796308000016004974656D735B3430315D2E
      446973706C61794E616D656608000013004974656D735B3430325D2E43617465
      676F72796708000016004974656D735B3430325D2E446973706C61794E616D65
      6808000013004974656D735B3430335D2E43617465676F727969080000160049
      74656D735B3430335D2E446973706C61794E616D656A08000013004974656D73
      5B3430345D2E43617465676F72796B08000016004974656D735B3430345D2E44
      6973706C61794E616D656E08000013004974656D735B3430355D2E4361746567
      6F72796F08000016004974656D735B3430355D2E446973706C61794E616D6578
      08000013004974656D735B3430365D2E43617465676F72797908000016004974
      656D735B3430365D2E446973706C61794E616D657A08000013004974656D735B
      3430375D2E43617465676F72797B08000016004974656D735B3430375D2E4469
      73706C61794E616D658208000013004974656D735B3430385D2E43617465676F
      72798308000016004974656D735B3430385D2E446973706C61794E616D659108
      000013004974656D735B3430395D2E43617465676F7279920800001600497465
      6D735B3430395D2E446973706C61794E616D651C04000012004974656D735B34
      305D2E43617465676F7279EE00000015004974656D735B34305D2E446973706C
      61794E616D659808000013004974656D735B3431305D2E43617465676F727999
      08000016004974656D735B3431305D2E446973706C61794E616D659A08000013
      004974656D735B3431315D2E43617465676F72799B08000016004974656D735B
      3431315D2E446973706C61794E616D659C08000013004974656D735B3431325D
      2E43617465676F72799D08000016004974656D735B3431325D2E446973706C61
      794E616D65A208000013004974656D735B3431335D2E43617465676F7279A308
      000016004974656D735B3431335D2E446973706C61794E616D65A60800001300
      4974656D735B3431345D2E43617465676F7279A708000016004974656D735B34
      31345D2E446973706C61794E616D65AA08000013004974656D735B3431355D2E
      43617465676F7279AB08000016004974656D735B3431355D2E446973706C6179
      4E616D65AC08000013004974656D735B3431365D2E43617465676F7279AD0800
      0016004974656D735B3431365D2E446973706C61794E616D65AE080000130049
      74656D735B3431375D2E43617465676F7279AF08000016004974656D735B3431
      375D2E446973706C61794E616D65B508000013004974656D735B3431385D2E43
      617465676F7279B608000016004974656D735B3431385D2E446973706C61794E
      616D65C808000013004974656D735B3431395D2E43617465676F7279C9080000
      16004974656D735B3431395D2E446973706C61794E616D651D04000012004974
      656D735B34315D2E43617465676F7279F100000015004974656D735B34315D2E
      446973706C61794E616D65CA08000013004974656D735B3432305D2E43617465
      676F7279CB08000016004974656D735B3432305D2E446973706C61794E616D65
      CC08000013004974656D735B3432315D2E43617465676F7279CD080000160049
      74656D735B3432315D2E446973706C61794E616D65CE08000013004974656D73
      5B3432325D2E43617465676F7279CF08000016004974656D735B3432325D2E44
      6973706C61794E616D65D708000013004974656D735B3432335D2E4361746567
      6F7279D808000016004974656D735B3432335D2E446973706C61794E616D65E0
      08000013004974656D735B3432345D2E43617465676F7279E108000016004974
      656D735B3432345D2E446973706C61794E616D65E408000013004974656D735B
      3432355D2E43617465676F7279E508000016004974656D735B3432355D2E4469
      73706C61794E616D65EA08000013004974656D735B3432365D2E43617465676F
      7279EB08000016004974656D735B3432365D2E446973706C61794E616D65EF08
      000013004974656D735B3432375D2E43617465676F7279F00800001600497465
      6D735B3432375D2E446973706C61794E616D65F808000013004974656D735B34
      32385D2E43617465676F7279F908000016004974656D735B3432385D2E446973
      706C61794E616D65FA08000013004974656D735B3432395D2E43617465676F72
      79FB08000016004974656D735B3432395D2E446973706C61794E616D651E0400
      0012004974656D735B34325D2E43617465676F7279F400000015004974656D73
      5B34325D2E446973706C61794E616D650109000013004974656D735B3433305D
      2E43617465676F72790209000016004974656D735B3433305D2E446973706C61
      794E616D650309000013004974656D735B3433315D2E43617465676F72790409
      000016004974656D735B3433315D2E446973706C61794E616D65070900001300
      4974656D735B3433325D2E43617465676F72790809000016004974656D735B34
      33325D2E446973706C61794E616D650E09000013004974656D735B3433335D2E
      43617465676F72790F09000016004974656D735B3433335D2E446973706C6179
      4E616D651109000013004974656D735B3433345D2E43617465676F7279120900
      0016004974656D735B3433345D2E446973706C61794E616D6515090000130049
      74656D735B3433355D2E43617465676F72791609000016004974656D735B3433
      355D2E446973706C61794E616D652309000013004974656D735B3433365D2E43
      617465676F72792409000016004974656D735B3433365D2E446973706C61794E
      616D652509000013004974656D735B3433375D2E43617465676F727926090000
      16004974656D735B3433375D2E446973706C61794E616D652709000013004974
      656D735B3433385D2E43617465676F72792809000016004974656D735B343338
      5D2E446973706C61794E616D652909000013004974656D735B3433395D2E4361
      7465676F72792A09000016004974656D735B3433395D2E446973706C61794E61
      6D651F04000012004974656D735B34335D2E43617465676F7279F60000001500
      4974656D735B34335D2E446973706C61794E616D652B09000013004974656D73
      5B3434305D2E43617465676F72792C09000016004974656D735B3434305D2E44
      6973706C61794E616D652D09000013004974656D735B3434315D2E4361746567
      6F72792E09000016004974656D735B3434315D2E446973706C61794E616D652F
      09000013004974656D735B3434325D2E43617465676F72793009000016004974
      656D735B3434325D2E446973706C61794E616D653109000013004974656D735B
      3434335D2E43617465676F72793209000016004974656D735B3434335D2E4469
      73706C61794E616D653309000013004974656D735B3434345D2E43617465676F
      72793409000016004974656D735B3434345D2E446973706C61794E616D653509
      000013004974656D735B3434355D2E43617465676F7279360900001600497465
      6D735B3434355D2E446973706C61794E616D653709000013004974656D735B34
      34365D2E43617465676F72793809000016004974656D735B3434365D2E446973
      706C61794E616D653909000013004974656D735B3434375D2E43617465676F72
      793A09000016004974656D735B3434375D2E446973706C61794E616D653B0900
      0013004974656D735B3434385D2E43617465676F72793C09000016004974656D
      735B3434385D2E446973706C61794E616D653D09000013004974656D735B3434
      395D2E43617465676F72793E09000016004974656D735B3434395D2E44697370
      6C61794E616D652004000012004974656D735B34345D2E43617465676F7279F8
      00000015004974656D735B34345D2E446973706C61794E616D65460900001300
      4974656D735B3435305D2E43617465676F72794709000016004974656D735B34
      35305D2E446973706C61794E616D654A09000013004974656D735B3435315D2E
      43617465676F72794B09000016004974656D735B3435315D2E446973706C6179
      4E616D654F09000013004974656D735B3435325D2E43617465676F7279500900
      0016004974656D735B3435325D2E446973706C61794E616D6551090000130049
      74656D735B3435335D2E43617465676F72795209000016004974656D735B3435
      335D2E446973706C61794E616D655309000013004974656D735B3435345D2E43
      617465676F72795409000016004974656D735B3435345D2E446973706C61794E
      616D655709000013004974656D735B3435355D2E43617465676F727958090000
      16004974656D735B3435355D2E446973706C61794E616D656409000013004974
      656D735B3435365D2E43617465676F72796509000016004974656D735B343536
      5D2E446973706C61794E616D656709000013004974656D735B3435375D2E4361
      7465676F72796809000016004974656D735B3435375D2E446973706C61794E61
      6D656909000013004974656D735B3435385D2E43617465676F72796A09000016
      004974656D735B3435385D2E446973706C61794E616D656B0900001300497465
      6D735B3435395D2E43617465676F72796C09000016004974656D735B3435395D
      2E446973706C61794E616D652104000012004974656D735B34355D2E43617465
      676F7279FA00000015004974656D735B34355D2E446973706C61794E616D6577
      09000013004974656D735B3436305D2E43617465676F72797809000016004974
      656D735B3436305D2E446973706C61794E616D657909000013004974656D735B
      3436315D2E43617465676F72797A09000016004974656D735B3436315D2E4469
      73706C61794E616D657B09000013004974656D735B3436325D2E43617465676F
      72797C09000016004974656D735B3436325D2E446973706C61794E616D657D09
      000013004974656D735B3436335D2E43617465676F72797E0900001600497465
      6D735B3436335D2E446973706C61794E616D657F09000013004974656D735B34
      36345D2E43617465676F72798009000016004974656D735B3436345D2E446973
      706C61794E616D658109000013004974656D735B3436355D2E43617465676F72
      798209000016004974656D735B3436355D2E446973706C61794E616D65830900
      0013004974656D735B3436365D2E43617465676F72798409000016004974656D
      735B3436365D2E446973706C61794E616D658509000013004974656D735B3436
      375D2E43617465676F72798609000016004974656D735B3436375D2E44697370
      6C61794E616D659409000013004974656D735B3436385D2E43617465676F7279
      9509000016004974656D735B3436385D2E446973706C61794E616D6596090000
      13004974656D735B3436395D2E43617465676F72799709000016004974656D73
      5B3436395D2E446973706C61794E616D652204000012004974656D735B34365D
      2E43617465676F7279FC00000015004974656D735B34365D2E446973706C6179
      4E616D659809000013004974656D735B3437305D2E43617465676F7279990900
      0016004974656D735B3437305D2E446973706C61794E616D659C090000130049
      74656D735B3437315D2E43617465676F72799D09000016004974656D735B3437
      315D2E446973706C61794E616D659E09000013004974656D735B3437325D2E43
      617465676F72799F09000016004974656D735B3437325D2E446973706C61794E
      616D65A009000013004974656D735B3437335D2E43617465676F7279A1090000
      16004974656D735B3437335D2E446973706C61794E616D65A209000013004974
      656D735B3437345D2E43617465676F7279A309000016004974656D735B343734
      5D2E446973706C61794E616D65A409000013004974656D735B3437355D2E4361
      7465676F7279A509000016004974656D735B3437355D2E446973706C61794E61
      6D65A609000013004974656D735B3437365D2E43617465676F7279A709000016
      004974656D735B3437365D2E446973706C61794E616D65A80900001300497465
      6D735B3437375D2E43617465676F7279A909000016004974656D735B3437375D
      2E446973706C61794E616D65AA09000013004974656D735B3437385D2E436174
      65676F7279AB09000016004974656D735B3437385D2E446973706C61794E616D
      65AC09000013004974656D735B3437395D2E43617465676F7279AD0900001600
      4974656D735B3437395D2E446973706C61794E616D652304000012004974656D
      735B34375D2E43617465676F7279FE00000015004974656D735B34375D2E4469
      73706C61794E616D65AE09000013004974656D735B3438305D2E43617465676F
      7279AF09000016004974656D735B3438305D2E446973706C61794E616D65B009
      000013004974656D735B3438315D2E43617465676F7279B10900001600497465
      6D735B3438315D2E446973706C61794E616D65B209000013004974656D735B34
      38325D2E43617465676F7279B309000016004974656D735B3438325D2E446973
      706C61794E616D65B409000013004974656D735B3438335D2E43617465676F72
      79B509000016004974656D735B3438335D2E446973706C61794E616D65B60900
      0013004974656D735B3438345D2E43617465676F7279B709000016004974656D
      735B3438345D2E446973706C61794E616D65B809000013004974656D735B3438
      355D2E43617465676F7279B909000016004974656D735B3438355D2E44697370
      6C61794E616D65BA09000013004974656D735B3438365D2E43617465676F7279
      BB09000016004974656D735B3438365D2E446973706C61794E616D65C8090000
      13004974656D735B3438375D2E43617465676F7279C909000016004974656D73
      5B3438375D2E446973706C61794E616D65CF09000013004974656D735B343838
      5D2E43617465676F7279D009000016004974656D735B3438385D2E446973706C
      61794E616D65D109000013004974656D735B3438395D2E43617465676F7279D2
      09000016004974656D735B3438395D2E446973706C61794E616D652404000012
      004974656D735B34385D2E43617465676F72790001000015004974656D735B34
      385D2E446973706C61794E616D65D309000013004974656D735B3439305D2E43
      617465676F7279D409000016004974656D735B3439305D2E446973706C61794E
      616D65D509000013004974656D735B3439315D2E43617465676F7279D6090000
      16004974656D735B3439315D2E446973706C61794E616D65D709000013004974
      656D735B3439325D2E43617465676F7279D809000016004974656D735B343932
      5D2E446973706C61794E616D65D909000013004974656D735B3439335D2E4361
      7465676F7279DA09000016004974656D735B3439335D2E446973706C61794E61
      6D65DE09000013004974656D735B3439345D2E43617465676F7279DF09000016
      004974656D735B3439345D2E446973706C61794E616D65070A00001300497465
      6D735B3439355D2E43617465676F7279080A000016004974656D735B3439355D
      2E446973706C61794E616D65090A000013004974656D735B3439365D2E436174
      65676F72790A0A000016004974656D735B3439365D2E446973706C61794E616D
      650B0A000013004974656D735B3439375D2E43617465676F72790C0A00001600
      4974656D735B3439375D2E446973706C61794E616D650D0A000013004974656D
      735B3439385D2E43617465676F72790E0A000016004974656D735B3439385D2E
      446973706C61794E616D650F0A000013004974656D735B3439395D2E43617465
      676F7279100A000016004974656D735B3439395D2E446973706C61794E616D65
      2504000012004974656D735B34395D2E43617465676F72790301000015004974
      656D735B34395D2E446973706C61794E616D65F803000011004974656D735B34
      5D2E43617465676F72799400000014004974656D735B345D2E446973706C6179
      4E616D65110A000013004974656D735B3530305D2E43617465676F7279120A00
      0016004974656D735B3530305D2E446973706C61794E616D65130A0000130049
      74656D735B3530315D2E43617465676F7279140A000016004974656D735B3530
      315D2E446973706C61794E616D65150A000013004974656D735B3530325D2E43
      617465676F7279160A000016004974656D735B3530325D2E446973706C61794E
      616D65170A000013004974656D735B3530335D2E43617465676F7279180A0000
      16004974656D735B3530335D2E446973706C61794E616D65190A000013004974
      656D735B3530345D2E43617465676F72791A0A000016004974656D735B353034
      5D2E446973706C61794E616D651B0A000013004974656D735B3530355D2E4361
      7465676F72791C0A000016004974656D735B3530355D2E446973706C61794E61
      6D651D0A000013004974656D735B3530365D2E43617465676F72791E0A000016
      004974656D735B3530365D2E446973706C61794E616D651F0A00001300497465
      6D735B3530375D2E43617465676F7279200A000016004974656D735B3530375D
      2E446973706C61794E616D65210A000013004974656D735B3530385D2E436174
      65676F7279220A000016004974656D735B3530385D2E446973706C61794E616D
      65230A000013004974656D735B3530395D2E43617465676F7279240A00001600
      4974656D735B3530395D2E446973706C61794E616D652604000012004974656D
      735B35305D2E43617465676F72790601000015004974656D735B35305D2E4469
      73706C61794E616D65250A000013004974656D735B3531305D2E43617465676F
      7279260A000016004974656D735B3531305D2E446973706C61794E616D65270A
      000013004974656D735B3531315D2E43617465676F7279280A00001600497465
      6D735B3531315D2E446973706C61794E616D65290A000013004974656D735B35
      31325D2E43617465676F72792A0A000016004974656D735B3531325D2E446973
      706C61794E616D652B0A000013004974656D735B3531335D2E43617465676F72
      792C0A000016004974656D735B3531335D2E446973706C61794E616D652D0A00
      0013004974656D735B3531345D2E43617465676F72792E0A000016004974656D
      735B3531345D2E446973706C61794E616D652F0A000013004974656D735B3531
      355D2E43617465676F7279300A000016004974656D735B3531355D2E44697370
      6C61794E616D65310A000013004974656D735B3531365D2E43617465676F7279
      320A000016004974656D735B3531365D2E446973706C61794E616D65330A0000
      13004974656D735B3531375D2E43617465676F7279340A000016004974656D73
      5B3531375D2E446973706C61794E616D65350A000013004974656D735B353138
      5D2E43617465676F7279360A000016004974656D735B3531385D2E446973706C
      61794E616D65370A000013004974656D735B3531395D2E43617465676F727938
      0A000016004974656D735B3531395D2E446973706C61794E616D652704000012
      004974656D735B35315D2E43617465676F72790901000015004974656D735B35
      315D2E446973706C61794E616D65390A000013004974656D735B3532305D2E43
      617465676F72793A0A000016004974656D735B3532305D2E446973706C61794E
      616D653B0A000013004974656D735B3532315D2E43617465676F72793C0A0000
      16004974656D735B3532315D2E446973706C61794E616D653D0A000013004974
      656D735B3532325D2E43617465676F72793E0A000016004974656D735B353232
      5D2E446973706C61794E616D653F0A000013004974656D735B3532335D2E4361
      7465676F7279400A000016004974656D735B3532335D2E446973706C61794E61
      6D65410A000013004974656D735B3532345D2E43617465676F7279420A000016
      004974656D735B3532345D2E446973706C61794E616D654B0A00001300497465
      6D735B3532355D2E43617465676F72794C0A000016004974656D735B3532355D
      2E446973706C61794E616D654D0A000013004974656D735B3532365D2E436174
      65676F72794E0A000016004974656D735B3532365D2E446973706C61794E616D
      654F0A000013004974656D735B3532375D2E43617465676F7279500A00001600
      4974656D735B3532375D2E446973706C61794E616D656E0A000013004974656D
      735B3532385D2E43617465676F72796F0A000016004974656D735B3532385D2E
      446973706C61794E616D65830A000013004974656D735B3532395D2E43617465
      676F7279840A000016004974656D735B3532395D2E446973706C61794E616D65
      2804000012004974656D735B35325D2E43617465676F72790C01000015004974
      656D735B35325D2E446973706C61794E616D65850A000013004974656D735B35
      33305D2E43617465676F7279860A000016004974656D735B3533305D2E446973
      706C61794E616D65870A000013004974656D735B3533315D2E43617465676F72
      79880A000016004974656D735B3533315D2E446973706C61794E616D65910A00
      0013004974656D735B3533325D2E43617465676F7279920A000016004974656D
      735B3533325D2E446973706C61794E616D65930A000013004974656D735B3533
      335D2E43617465676F7279940A000016004974656D735B3533335D2E44697370
      6C61794E616D65950A000013004974656D735B3533345D2E43617465676F7279
      960A000016004974656D735B3533345D2E446973706C61794E616D65970A0000
      13004974656D735B3533355D2E43617465676F7279980A000016004974656D73
      5B3533355D2E446973706C61794E616D65990A000013004974656D735B353336
      5D2E43617465676F72799A0A000016004974656D735B3533365D2E446973706C
      61794E616D659B0A000013004974656D735B3533375D2E43617465676F72799C
      0A000016004974656D735B3533375D2E446973706C61794E616D659D0A000013
      004974656D735B3533385D2E43617465676F72799E0A000016004974656D735B
      3533385D2E446973706C61794E616D659F0A000013004974656D735B3533395D
      2E43617465676F7279A00A000016004974656D735B3533395D2E446973706C61
      794E616D652904000012004974656D735B35335D2E43617465676F72790F0100
      0015004974656D735B35335D2E446973706C61794E616D65A10A000013004974
      656D735B3534305D2E43617465676F7279A20A000016004974656D735B353430
      5D2E446973706C61794E616D65A30A000013004974656D735B3534315D2E4361
      7465676F7279A40A000016004974656D735B3534315D2E446973706C61794E61
      6D65A50A000013004974656D735B3534325D2E43617465676F7279A60A000016
      004974656D735B3534325D2E446973706C61794E616D65A70A00001300497465
      6D735B3534335D2E43617465676F7279A80A000016004974656D735B3534335D
      2E446973706C61794E616D65A90A000013004974656D735B3534345D2E436174
      65676F7279AA0A000016004974656D735B3534345D2E446973706C61794E616D
      65AB0A000013004974656D735B3534355D2E43617465676F7279AC0A00001600
      4974656D735B3534355D2E446973706C61794E616D65B10A000013004974656D
      735B3534365D2E43617465676F7279B20A000016004974656D735B3534365D2E
      446973706C61794E616D65B30A000013004974656D735B3534375D2E43617465
      676F7279B40A000016004974656D735B3534375D2E446973706C61794E616D65
      B60A000013004974656D735B3534385D2E43617465676F7279B70A0000160049
      74656D735B3534385D2E446973706C61794E616D65B80A000013004974656D73
      5B3534395D2E43617465676F7279B90A000016004974656D735B3534395D2E44
      6973706C61794E616D652A04000012004974656D735B35345D2E43617465676F
      72791201000015004974656D735B35345D2E446973706C61794E616D65BA0A00
      0013004974656D735B3535305D2E43617465676F7279BB0A000016004974656D
      735B3535305D2E446973706C61794E616D65BD0A000013004974656D735B3535
      315D2E43617465676F7279BE0A000016004974656D735B3535315D2E44697370
      6C61794E616D65C00A000013004974656D735B3535325D2E43617465676F7279
      C10A000016004974656D735B3535325D2E446973706C61794E616D65C40A0000
      13004974656D735B3535335D2E43617465676F7279C50A000016004974656D73
      5B3535335D2E446973706C61794E616D65CB0A000013004974656D735B353534
      5D2E43617465676F7279CC0A000016004974656D735B3535345D2E446973706C
      61794E616D65CD0A000013004974656D735B3535355D2E43617465676F7279CE
      0A000016004974656D735B3535355D2E446973706C61794E616D65D70A000013
      004974656D735B3535365D2E43617465676F7279D80A000016004974656D735B
      3535365D2E446973706C61794E616D65DC0A000013004974656D735B3535375D
      2E43617465676F7279DD0A000016004974656D735B3535375D2E446973706C61
      794E616D65DF0A000013004974656D735B3535385D2E43617465676F7279E00A
      000016004974656D735B3535385D2E446973706C61794E616D65E10A00001300
      4974656D735B3535395D2E43617465676F7279E20A000016004974656D735B35
      35395D2E446973706C61794E616D652B04000012004974656D735B35355D2E43
      617465676F72791501000015004974656D735B35355D2E446973706C61794E61
      6D65E40A000013004974656D735B3536305D2E43617465676F7279E50A000016
      004974656D735B3536305D2E446973706C61794E616D65E60A00001300497465
      6D735B3536315D2E43617465676F7279E70A000016004974656D735B3536315D
      2E446973706C61794E616D65E80A000013004974656D735B3536325D2E436174
      65676F7279E90A000016004974656D735B3536325D2E446973706C61794E616D
      65EA0A000013004974656D735B3536335D2E43617465676F7279EB0A00001600
      4974656D735B3536335D2E446973706C61794E616D65ED0A000013004974656D
      735B3536345D2E43617465676F7279EE0A000016004974656D735B3536345D2E
      446973706C61794E616D65EF0A000013004974656D735B3536355D2E43617465
      676F7279F00A000016004974656D735B3536355D2E446973706C61794E616D65
      F10A000013004974656D735B3536365D2E43617465676F7279F20A0000160049
      74656D735B3536365D2E446973706C61794E616D65F30A000013004974656D73
      5B3536375D2E43617465676F7279F40A000016004974656D735B3536375D2E44
      6973706C61794E616D650A0B000013004974656D735B3536385D2E4361746567
      6F72790B0B000016004974656D735B3536385D2E446973706C61794E616D650C
      0B000013004974656D735B3536395D2E43617465676F72790D0B000016004974
      656D735B3536395D2E446973706C61794E616D652C04000012004974656D735B
      35365D2E43617465676F72791801000015004974656D735B35365D2E44697370
      6C61794E616D650E0B000013004974656D735B3537305D2E43617465676F7279
      0F0B000016004974656D735B3537305D2E446973706C61794E616D65150B0000
      13004974656D735B3537315D2E43617465676F7279160B000016004974656D73
      5B3537315D2E446973706C61794E616D65170B000013004974656D735B353732
      5D2E43617465676F7279180B000016004974656D735B3537325D2E446973706C
      61794E616D651B0B000013004974656D735B3537335D2E43617465676F72791C
      0B000016004974656D735B3537335D2E446973706C61794E616D651D0B000013
      004974656D735B3537345D2E43617465676F72791E0B000016004974656D735B
      3537345D2E446973706C61794E616D65230B000013004974656D735B3537355D
      2E43617465676F7279240B000016004974656D735B3537355D2E446973706C61
      794E616D65260B000013004974656D735B3537365D2E43617465676F7279270B
      000016004974656D735B3537365D2E446973706C61794E616D65280B00001300
      4974656D735B3537375D2E43617465676F7279290B000016004974656D735B35
      37375D2E446973706C61794E616D652A0B000013004974656D735B3537385D2E
      43617465676F72792B0B000016004974656D735B3537385D2E446973706C6179
      4E616D652C0B000013004974656D735B3537395D2E43617465676F72792D0B00
      0016004974656D735B3537395D2E446973706C61794E616D652D040000120049
      74656D735B35375D2E43617465676F72791B01000015004974656D735B35375D
      2E446973706C61794E616D652E0B000013004974656D735B3538305D2E436174
      65676F72792F0B000016004974656D735B3538305D2E446973706C61794E616D
      65300B000013004974656D735B3538315D2E43617465676F7279310B00001600
      4974656D735B3538315D2E446973706C61794E616D65350B000013004974656D
      735B3538325D2E43617465676F7279360B000016004974656D735B3538325D2E
      446973706C61794E616D653C0B000013004974656D735B3538335D2E43617465
      676F72793D0B000016004974656D735B3538335D2E446973706C61794E616D65
      3E0B000013004974656D735B3538345D2E43617465676F72793F0B0000160049
      74656D735B3538345D2E446973706C61794E616D652E04000012004974656D73
      5B35385D2E43617465676F72791E01000015004974656D735B35385D2E446973
      706C61794E616D652F04000012004974656D735B35395D2E43617465676F7279
      2101000015004974656D735B35395D2E446973706C61794E616D65F903000011
      004974656D735B355D2E43617465676F72799600000014004974656D735B355D
      2E446973706C61794E616D653004000012004974656D735B36305D2E43617465
      676F72792401000015004974656D735B36305D2E446973706C61794E616D6531
      04000012004974656D735B36315D2E43617465676F7279270100001500497465
      6D735B36315D2E446973706C61794E616D653204000012004974656D735B3632
      5D2E43617465676F72792A01000015004974656D735B36325D2E446973706C61
      794E616D653304000012004974656D735B36335D2E43617465676F72792D0100
      0015004974656D735B36335D2E446973706C61794E616D653404000012004974
      656D735B36345D2E43617465676F72793001000015004974656D735B36345D2E
      446973706C61794E616D653504000012004974656D735B36355D2E4361746567
      6F72793301000015004974656D735B36355D2E446973706C61794E616D653604
      000012004974656D735B36365D2E43617465676F72793601000015004974656D
      735B36365D2E446973706C61794E616D653704000012004974656D735B36375D
      2E43617465676F72793901000015004974656D735B36375D2E446973706C6179
      4E616D653804000012004974656D735B36385D2E43617465676F72793B010000
      15004974656D735B36385D2E446973706C61794E616D65390400001200497465
      6D735B36395D2E43617465676F72793D01000015004974656D735B36395D2E44
      6973706C61794E616D65FA03000011004974656D735B365D2E43617465676F72
      799900000014004974656D735B365D2E446973706C61794E616D653A04000012
      004974656D735B37305D2E43617465676F72793F01000015004974656D735B37
      305D2E446973706C61794E616D653B04000012004974656D735B37315D2E4361
      7465676F72794101000015004974656D735B37315D2E446973706C61794E616D
      653C04000012004974656D735B37325D2E43617465676F727943010000150049
      74656D735B37325D2E446973706C61794E616D653D04000012004974656D735B
      37335D2E43617465676F72794501000015004974656D735B37335D2E44697370
      6C61794E616D653E04000012004974656D735B37345D2E43617465676F727947
      01000015004974656D735B37345D2E446973706C61794E616D653F0400001200
      4974656D735B37355D2E43617465676F72794901000015004974656D735B3735
      5D2E446973706C61794E616D654004000012004974656D735B37365D2E436174
      65676F72794B01000015004974656D735B37365D2E446973706C61794E616D65
      4104000012004974656D735B37375D2E43617465676F72794D01000015004974
      656D735B37375D2E446973706C61794E616D654204000012004974656D735B37
      385D2E43617465676F72794F01000015004974656D735B37385D2E446973706C
      61794E616D654304000012004974656D735B37395D2E43617465676F72795101
      000015004974656D735B37395D2E446973706C61794E616D65FB030000110049
      74656D735B375D2E43617465676F72799C00000014004974656D735B375D2E44
      6973706C61794E616D654404000012004974656D735B38305D2E43617465676F
      72795301000015004974656D735B38305D2E446973706C61794E616D65450400
      0012004974656D735B38315D2E43617465676F72795501000015004974656D73
      5B38315D2E446973706C61794E616D654604000012004974656D735B38325D2E
      43617465676F72795701000015004974656D735B38325D2E446973706C61794E
      616D654704000012004974656D735B38335D2E43617465676F72795901000015
      004974656D735B38335D2E446973706C61794E616D654804000012004974656D
      735B38345D2E43617465676F72795B01000015004974656D735B38345D2E4469
      73706C61794E616D654904000012004974656D735B38355D2E43617465676F72
      795D01000015004974656D735B38355D2E446973706C61794E616D654A040000
      12004974656D735B38365D2E43617465676F72795F01000015004974656D735B
      38365D2E446973706C61794E616D654B04000012004974656D735B38375D2E43
      617465676F72796101000015004974656D735B38375D2E446973706C61794E61
      6D654C04000012004974656D735B38385D2E43617465676F7279630100001500
      4974656D735B38385D2E446973706C61794E616D654D04000012004974656D73
      5B38395D2E43617465676F72796501000015004974656D735B38395D2E446973
      706C61794E616D65FC03000011004974656D735B385D2E43617465676F72799F
      00000014004974656D735B385D2E446973706C61794E616D654E040000120049
      74656D735B39305D2E43617465676F72796701000015004974656D735B39305D
      2E446973706C61794E616D654F04000012004974656D735B39315D2E43617465
      676F72796901000015004974656D735B39315D2E446973706C61794E616D6550
      04000012004974656D735B39325D2E43617465676F72796B0100001500497465
      6D735B39325D2E446973706C61794E616D655104000012004974656D735B3933
      5D2E43617465676F72796D01000015004974656D735B39335D2E446973706C61
      794E616D655204000012004974656D735B39345D2E43617465676F72796F0100
      0015004974656D735B39345D2E446973706C61794E616D655304000012004974
      656D735B39355D2E43617465676F72797101000015004974656D735B39355D2E
      446973706C61794E616D655404000012004974656D735B39365D2E4361746567
      6F72797301000015004974656D735B39365D2E446973706C61794E616D655504
      000012004974656D735B39375D2E43617465676F72797501000015004974656D
      735B39375D2E446973706C61794E616D655604000012004974656D735B39385D
      2E43617465676F72797701000015004974656D735B39385D2E446973706C6179
      4E616D655704000012004974656D735B39395D2E43617465676F727979010000
      15004974656D735B39395D2E446973706C61794E616D65FD0300001100497465
      6D735B395D2E43617465676F7279A200000014004974656D735B395D2E446973
      706C61794E616D6500090054696D65725469636B00000E00506F707570537461
      747573456E6300001300506F7075705374617475734C696E65456E647300000D
      005442584974656D456E6457696E00000C005442584974656D456E64556E0000
      0D005442584974656D456E644D616300000B00496D674C697374547265650000
      12005072696E74657253657475704469616C6F6700000A0053796E745374796C
      6573000005006563414350000101000000040048696E7400000F00506172616D
      436F6D706C6574696F6E000101000000040048696E7400000D0054656D706C61
      7465506F707570000101000000040048696E7400000B00506F7075704C657865
      727300000B00656343686172506F707570000101000000040048696E7400000B
      0054696D657252656472617700000D005442584974656D4F546F6F6C73010200
      0000C2030000070043617074696F6E18050000040048696E7400120054425853
      6570617261746F724974656D323200000E005442584974656D426B436C656172
      0102000000B8030000070043617074696F6EB9030000040048696E7400090054
      696D657248696E7400001200544258536570617261746F724974656D32360000
      0F005442584974656D4D61726B537761700102000000F6040000070043617074
      696F6E17050000040048696E74000F005442584974656D4D61726B436F6C6C01
      02000000F7040000070043617074696F6E16050000040048696E74000F005442
      584974656D4D61726B44726F700102000000F8040000070043617074696F6E15
      050000040048696E74000400746251730101000000FA04000007004361707469
      6F6E000D005442584974656D46464E65787401020000000B0500000700436170
      74696F6EFB040000040048696E74000D005442584974656D4646507265760102
      0000000C050000070043617074696F6EFC040000040048696E74001600544258
      5375626D656E754974656D546F6F6C626172730101000000FE04000007004361
      7074696F6E000A005442584974656D5451730102000000FF0400000700436170
      74696F6E1C050000040048696E74000C005442584974656D5456696577010200
      000000050000070043617074696F6E1B050000040048696E74000C0054425849
      74656D5445646974010200000001050000070043617074696F6E1A0500000400
      48696E74000C005442584974656D5446696C6501020000000205000007004361
      7074696F6E19050000040048696E7400060063624361736501020000000D0500
      00070043617074696F6E09050000040048696E74000400656451730101000000
      0A050000040048696E740010005442436F6E74726F6C4974656D316161000009
      005442584974656D5173010200000008050000070043617074696F6E11050000
      040048696E740006006362576F726401020000000E050000070043617074696F
      6E0F050000040048696E74000F005442584974656D534D61726B416C6C010200
      000010050000070043617074696F6E14050000040048696E7400110054425849
      74656D48656C70546F70696373010200000027050000070043617074696F6E28
      050000040048696E74000D005442584974656D46436C6F736501020000002905
      0000070043617074696F6E3D050000040048696E740007006163436C6F736500
      000F00506F707570546162436F6E74657874000015005442584974656D546162
      436C6F73654F746865727301010000002D050000070043617074696F6E000F00
      5442584974656D546162436C6F736501010000002E050000070043617074696F
      6E000D005442584974656D5461624E657701010000002F050000070043617074
      696F6E001200544258536570617261746F724974656D323800001100496D6167
      654C697374436C6F736542746E00000900616353617665416C6C00000F005442
      584974656D4653617665416C6C010200000033050000070043617074696F6E3C
      050000040048696E74000A006163436C6F7365416C6C00001000544258497465
      6D46436C6F7365416C6C010200000035050000070043617074696F6E3E050000
      040048696E740016006163436C6F73654F74686572735468697347726F757000
      0010005442584974656D46436C6F73654F746801020000004005000007004361
      7074696F6E41050000040048696E74001200544258536570617261746F724974
      656D323900000F005442584974656D465365734F70656E010200000042050000
      070043617074696F6E48050000040048696E740011005442584974656D465365
      73536176654173010200000043050000070043617074696F6E49050000040048
      696E74000A004F445F53657373696F6E00000A0053445F53657373696F6E0000
      16005442585375626D656E754974656D46526563656E747301010000004C0500
      00070043617074696F6E001200544258536570617261746F724974656D333000
      0014005442584974656D46436C656172526563656E747301010000004D050000
      070043617074696F6E0014005462785375626D656E754974656D57696E646F77
      01010000004E050000070043617074696F6E000C005442584974656D4554696D
      65010200000050050000070043617074696F6E53050000040048696E74001100
      5442585375626D656E754974656D52756E010100000054050000070043617074
      696F6E000C005442584974656D546F6F6C310101000000690500000700436170
      74696F6E000C005442584974656D546F6F6C3201010000006A05000007004361
      7074696F6E000C005442584974656D546F6F6C3301010000006B050000070043
      617074696F6E000C005442584974656D546F6F6C3401010000006C0500000700
      43617074696F6E001200544258536570617261746F724974656D333100001100
      5442584974656D52756E46696E64506870010100000059050000070043617074
      696F6E0011005442584974656D52756E4F70656E446972010200000067050000
      070043617074696F6E68050000040048696E74000C005442584974656D546F6F
      6C35010100000085050000070043617074696F6E000C005442584974656D546F
      6F6C36010100000086050000070043617074696F6E000C005442584974656D54
      6F6F6C37010100000087050000070043617074696F6E000C005442584974656D
      546F6F6C38010100000088050000070043617074696F6E001100544258537562
      6D656E754974656D456E63010100000089050000070043617074696F6E001200
      5442585375626D656E754C696E65456E647301010000008A0500000700436170
      74696F6E000E005442584974656D456E644D57696E00000D005442584974656D
      456E644D556E00000E005442584974656D456E644D4D616300000D0054425853
      75626D656E75456E6301020000008E050000070043617074696F6EA105000004
      0048696E74000E005442585375626D656E75456E63320102000000A005000007
      0043617074696F6EA2050000040048696E7400090054696D65724C6F61640000
      090065635265706C6163650101000000BD050000040048696E74000B00544258
      4974656D535265700102000000AA050000070043617074696F6EAD0500000400
      48696E74000C005442584974656D5346696E640102000000AB05000007004361
      7074696F6EAC050000040048696E740006006163457869740000100054425849
      74656D46436C6F736544656C0102000000B6050000070043617074696F6EB905
      0000040048696E740010006163436C6F7365416E6444656C6574650000100065
      635265706C616365496E46696C65730101000000BE050000040048696E740012
      005442584974656D53526570496E46696C65730102000000C005000007004361
      7074696F6EC1050000040048696E7400080054696D657253656C000015005442
      585375626D656E754974656D4374784D6F72650101000000C405000007004361
      7074696F6E0011005442584974656D437478436F707955726C0102000000C505
      0000070043617074696F6EC6050000040048696E740014005442584974656D43
      7478436F7079417070656E640102000000C7050000070043617074696F6EC805
      0000040048696E740013005442584974656D437478437574417070656E640102
      000000C9050000070043617074696F6ECA050000040048696E74001200544258
      536570617261746F724974656D3334000012005442584974656D437478436F70
      7948544D4C0101000000CB050000070043617074696F6E001100544258497465
      6D437478436F70795254460101000000CD050000070043617074696F6E001200
      544258536570617261746F724974656D333500000E005442584974656D454375
      744170700102000000DE050000070043617074696F6EDF050000040048696E74
      000F005442584974656D45436F70794170700102000000E00500000700436170
      74696F6EE1050000040048696E74000C005442584974656D546F6F6C39010100
      0000E4050000070043617074696F6E000D005442584974656D546F6F6C313001
      01000000E5050000070043617074696F6E000D005442584974656D546F6F6C31
      310101000000E6050000070043617074696F6E000D005442584974656D546F6F
      6C31320101000000E7050000070043617074696F6E0011005442584974656D53
      476F427261636B65740102000000F1050000070043617074696F6EF205000004
      0048696E74000500706C4F75740101000000F3050000070043617074696F6E01
      010000000700546F6F6C6261720101000000E3090000070043617074696F6E00
      07004C6973744F7574000010005442584974656D5650616E656C4F7574010200
      0000F7050000070043617074696F6E470A0000040048696E7400090065635368
      6F774F75740101000000F4050000070043617074696F6E000B00544258497465
      6D4F4F75740102000000F9050000070043617074696F6EFA050000040048696E
      74000800506F7075704F757400000F005442584974656D4F7574436C65617201
      01000000FC050000070043617074696F6E0011005442584974656D4F7574436F
      707953656C0101000000FD050000070043617074696F6E000D00544258497465
      6D4F75744E61760101000000FE050000070043617074696F6E00120054425853
      6570617261746F724974656D3138000011005442584974656D4F7574436F7079
      416C6C0101000000FF050000070043617074696F6E0012005442585365706172
      61746F724974656D333200000F00496D6167654C697374537461747573000010
      005442584974656D4F757444656C53656C010100000004060000070043617074
      696F6E0016005442584974656D4F757444656C4E6F6E70617273656401010000
      0005060000070043617074696F6E000900506F70757046696E64000012005442
      584974656D5472656546696E644E617601010000000806000007004361707469
      6F6E001200544258536570617261746F724974656D3336000012005442585365
      70617261746F724974656D333700001200616353657475704C65786572537479
      6C657300000F005442584974656D4F4C65786572486901020000000E06000007
      0043617074696F6E0F060000040048696E74001200544258536570617261746F
      724974656D333800000E005442584974656D4F4F4C6578537401010000001006
      0000070043617074696F6E000C005442584974656D4545787472010200000012
      060000070043617074696F6E13060000040048696E7400120054425853657061
      7261746F724974656D3339000010005442584974656D454361736553656E7401
      0200000018060000070043617074696F6E19060000040048696E740012005442
      584974656D4261724361736553656E7401010000001A06000007004361707469
      6F6E000A00656353656E744361736501010000001C060000070043617074696F
      6E000900506F7075705A6F6F6D00000E005442584974656D5A53657433303000
      000E005442584974656D5A53657432303000000E005442584974656D5A536574
      31353000000E005442584974656D5A53657431303000000D005442584974656D
      5A536574373500000D005442584974656D5A536574353000000D005442584974
      656D5A536574323500000D005442584974656D5A4F7468657201010000002506
      0000070043617074696F6E000600706C436C69700001010000000700546F6F6C
      6261720101000000E4090000070043617074696F6E000A00656353686F77436C
      6970010100000027060000070043617074696F6E001200544258536570617261
      746F724974656D323500000C005442584974656D4F436C697001020000002806
      0000070043617074696F6E29060000040048696E74000900506F707570436C69
      7000000E005442584974656D436C6970436C7201010000002C06000007004361
      7074696F6E0014006563476F746F4E65787446696E64526573756C7400001400
      6563476F746F5072657646696E64526573756C74000012005442585365706172
      61746F724974656D343000000F005442584974656D5352657350726576010200
      00002D060000070043617074696F6E33060000040048696E74000F0054425849
      74656D535265734E65787401020000002E060000070043617074696F6E340600
      00040048696E74000E005442584974656D4553796E6345640102000000350600
      00070043617074696F6E36060000040048696E74000E005442584974656D4653
      657341646401020000003B060000070043617074696F6E3C060000040048696E
      74000900656346756C6C53637200000F005442584974656D4F46756C6C536372
      010200000041060000070043617074696F6E44060000040048696E74000D0054
      696D6572427261636B65747300001200544258536570617261746F724974656D
      3431000011005442584974656D546162436F7079446972010100000046060000
      070043617074696F6E0012005442584974656D546162436F707946756C6C0101
      00000047060000070043617074696F6E0010005442584974656D546162436F70
      79464E010100000048060000070043617074696F6E0012005442585365706172
      61746F724974656D343200001200544258536570617261746F724974656D3434
      00000D005442584974656D5653796E63480102000000CB090000070043617074
      696F6E52060000040048696E74000D005442584974656D5653796E6356010200
      0000CC090000070043617074696F6E53060000040048696E74000D0065635379
      6E635363726F6C6C4800000D00656353796E635363726F6C6C5600000D005442
      584974656D4F5368656C6C010200000058060000070043617074696F6E590600
      00040048696E740012005442585375626D656E754974656D5669657701010000
      005A060000070043617074696F6E000D005442584974656D4F4F6E546F700102
      0000005B060000070043617074696F6E5C060000040048696E7400070065634F
      6E546F70000011005442584974656D4546696C6C426C6F636B01020000005F06
      0000070043617074696F6E62060000040048696E74000F005442584974656D45
      496E7354657874010200000063060000070043617074696F6E6B060000040048
      696E74001200544258536570617261746F724974656D32330000110054425849
      74656D4374784F70656E53656C010100000068060000040048696E7400120054
      4258536570617261746F724974656D3435000010005442584974656D43747854
      6F6F6C3132000010005442584974656D437478546F6F6C313100001000544258
      4974656D437478546F6F6C313000000F005442584974656D437478546F6F6C39
      00000F005442584974656D437478546F6F6C3800000F005442584974656D4374
      78546F6F6C3700000F005442584974656D437478546F6F6C3600000F00544258
      4974656D437478546F6F6C3500000F005442584974656D437478546F6F6C3400
      000F005442584974656D437478546F6F6C3300000F005442584974656D437478
      546F6F6C3200000F005442584974656D437478546F6F6C310000120054425853
      6570617261746F724974656D313300001200544258536570617261746F724974
      656D3234000010005442585375626D656E754974656D313001010000006C0600
      00070043617074696F6E0015005442584974656D4F526573746F72655374796C
      657301020000006D060000070043617074696F6E6E060000040048696E740013
      005442584974656D437478437573746F6D697A6501010000006F060000070043
      617074696F6E0011006563546F67676C65466F63757354726565000011006563
      546F67676C65466F637573436C697000000B0065635A656E457870616E640000
      1200544258536570617261746F724974656D34360000090065635A656E577261
      70000018005442585375626D656E754974656D436F6D6D656E744F7073010100
      000080060000070043617074696F6E000C005442584974656D45436F6D6D0102
      00000081060000070043617074696F6E82060000040048696E74000E00544258
      4974656D45556E636F6D6D010200000083060000070043617074696F6E840600
      00040048696E740019005442584974656D45546F67676C654C696E65436F6D6D
      656E74010200000085060000070043617074696F6E86060000040048696E7400
      13006563546F67676C654C696E65436F6D6D656E74000013006563546F67676C
      65466F6375734F75747075740000080061634261636B7570000015006563546F
      67676C6553747265616D436F6D6D656E7400001B005442584974656D45546F67
      676C6553747265616D436F6D6D656E7401020000008F06000007004361707469
      6F6E90060000040048696E740017005442585375626D656E754974656D496E64
      656E744F7073010100000091060000070043617074696F6E0015005442585375
      626D656E754974656D4C696E654F707301010000009206000007004361707469
      6F6E000E005442584974656D454D6F7665446E01020000009306000007004361
      7074696F6E95060000040048696E74000E005442584974656D454D6F76655570
      010200000094060000070043617074696F6E96060000040048696E7400110054
      42584974656D48656C70446F6E61746501020000009706000007004361707469
      6F6E98060000040048696E74000D005442584974656D4544656C4C6E01020000
      0099060000070043617074696F6E9A060000040048696E740012005442585365
      70617261746F724974656D3437000015005442585375626D656E754974656D43
      6F70794F707301010000009B060000070043617074696F6E0011005442584974
      656D4543704469725061746801010000009C060000070043617074696F6E0012
      005442584974656D45437046756C6C5061746801010000009D06000007004361
      7074696F6E000C005442584974656D454370464E01010000009E060000070043
      617074696F6E0014006563546F67676C65466F63757346696E64526573000013
      005442584974656D54625370656C6C436865636B0102000000A9060000070043
      617074696F6EAA060000040048696E74001200544258536570617261746F7249
      74656D343800000C0065635370656C6C436865636B00000B0065635370656C6C
      4C697665000012005442584974656D54625370656C6C4C6976650102000000AB
      060000070043617074696F6EAC060000040048696E740012005442584974656D
      565370656C6C436865636B0102000000AE060000070043617074696F6EAF0600
      00040048696E740011005442584974656D565370656C6C4C6976650102000000
      B0060000070043617074696F6EB1060000040048696E74001200544258536570
      617261746F724974656D343900000C005442584974656D454A6F696E01020000
      00B6060000070043617074696F6EB7060000040048696E74000D005442584974
      656D4553706C69740102000000BC060000070043617074696F6EBD0600000400
      48696E74001200544258536570617261746F724974656D353000001400544258
      5375626D656E754974656D4D6163726F730101000000BE060000070043617074
      696F6E0010005442584974656D4D6163726F506C61790102000000C706000007
      0043617074696F6ED5060000040048696E740010005442584974656D4D616372
      6F53746F700102000000C9060000070043617074696F6ED3060000040048696E
      740012005442584974656D4D6163726F5265636F72640102000000CB06000007
      0043617074696F6ED2060000040048696E740012005442584974656D4D616372
      6F43616E63656C0102000000CD060000070043617074696F6ED4060000040048
      696E74001200544258536570617261746F724974656D353100000F0054425849
      74656D4D6163726F446C670102000000CF060000070043617074696F6ED60600
      00040048696E74000D0061634D6163726F5265636F726400000B0061634D6163
      726F53746F7000000D0061634D6163726F43616E63656C00000B0061634D6163
      726F506C617900000D0061634D6163726F4469616C6F6700000A0065634D6163
      726F526563000012005442584974656D48746D6C507265766965770102000000
      D8060000070043617074696F6ED9060000040048696E74001200544258536570
      617261746F724974656D35320000080061634D6163726F310000080061634D61
      63726F320000080061634D6163726F330000080061634D6163726F3400000800
      61634D6163726F350000080061634D6163726F360000080061634D6163726F37
      0000080061634D6163726F380000080061634D6163726F390000100050726F70
      734D616E616765724B65797300001200544258536570617261746F724974656D
      353300000D005442584974656D4D6163726F3900000D005442584974656D4D61
      63726F3800000D005442584974656D4D6163726F3700000D005442584974656D
      4D6163726F3600000D005442584974656D4D6163726F3500000D005442584974
      656D4D6163726F3400000D005442584974656D4D6163726F3300000D00544258
      4974656D4D6163726F3200000D005442584974656D4D6163726F3100000D0054
      42584974656D426B4E6578740102000000EE060000070043617074696F6EF106
      0000040048696E74000D005442584974656D426B507265760102000000EF0600
      00070043617074696F6EF2060000040048696E74000F005442584974656D426B
      546F67676C650102000000F0060000070043617074696F6EF306000004004869
      6E74000C006563426B436C656172416C6C00000A006563426B546F67676C6500
      0008006563426B4E657874000008006563426B5072657600000B006563426B49
      6E7665727365000010005442584974656D426B496E76657273650102000000FA
      060000070043617074696F6EFB060000040048696E740008006563426B436F70
      79000007006563426B43757400000A006563426B44656C65746500000E006563
      426B44656C657465556E6D6B000009006563426B506173746500001000544258
      4974656D426B44656C556E6D6B010200000007070000070043617074696F6E0C
      070000040048696E74000C005442584974656D426B44656C0102000000080700
      00070043617074696F6E0D070000040048696E74000E005442584974656D426B
      5061737465010200000009070000070043617074696F6E0E070000040048696E
      74000C005442584974656D426B43757401020000000A07000007004361707469
      6F6E0F070000040048696E74000D005442584974656D426B436F707901020000
      000B070000070043617074696F6E10070000040048696E74000D005442584974
      656D5462476F746F010200000013070000070043617074696F6E140700000400
      48696E740006006563476F746F00001200544258536570617261746F72497465
      6D3132000010005442584974656D5653796E6356657274010200000017070000
      070043617074696F6E18070000040048696E740010005442584974656D565379
      6E63486F727A010200000019070000070043617074696F6E1A07000004004869
      6E740013006563546F67676C65466F63757347726F7570730000120054425853
      6570617261746F724974656D353400000F005442584974656D454375744C696E
      6501020000001D070000070043617074696F6E23070000040048696E74001000
      5442584974656D45436F70794C696E6501020000001E07000007004361707469
      6F6E24070000040048696E740012005442585375626D656E754974656D546964
      79010100000025070000070043617074696F6E000E005442584974656D546964
      79436667010200000026070000070043617074696F6E28070000040048696E74
      000E005442584974656D5469647956616C010200000027070000070043617074
      696F6E29070000040048696E74001200544258536570617261746F724974656D
      3535000007004C69737456616C00000D00506F70757056616C69646174650000
      0D005442584974656D56616C4E617601010000002F070000070043617074696F
      6E001200544258536570617261746F724974656D353600001100544258497465
      6D56616C436F707953656C010100000030070000070043617074696F6E001100
      5442584974656D56616C436F7079416C6C010100000031070000070043617074
      696F6E001200544258536570617261746F724974656D353700000F0054425849
      74656D56616C436C656172010100000032070000070043617074696F6E001500
      6563546F67676C65466F63757356616C6964617465000015005442584974656D
      45446564757041646A6163656E74010100000037070000070043617074696F6E
      0016005442584974656D5462446564757041646A6163656E7401010000003907
      0000070043617074696F6E0012005442585375626D656E754974656D53657373
      010100000059070000070043617074696F6E001200544258536570617261746F
      724974656D353900000E005442584974656D53657373436C7201010000005A07
      0000070043617074696F6E000F005442584974656D4653657353617665010200
      00005C070000070043617074696F6E5D070000040048696E7400100054425849
      74656D46536573436C6F736501020000005E070000070043617074696F6E5F07
      0000040048696E74000E00656352656D6F7665426C616E6B7300001100544258
      4974656D4552656D426C616E6B73010200000064070000070043617074696F6E
      65070000040048696E74000D00656352656D6F76654C696E6573000016005442
      585375626D656E754974656D426C616E6B4F7073010100000066070000070043
      617074696F6E001200544258536570617261746F724974656D363000000F0054
      42584974656D455472696D416C6C010200000067070000070043617074696F6E
      6A070000040048696E740011005442584974656D455472696D547261696C0102
      00000068070000070043617074696F6E6B070000040048696E74001000544258
      4974656D455472696D4C656164010200000069070000070043617074696F6E6C
      070000040048696E74000A0065635472696D4C65616400000B0065635472696D
      547261696C0000090065635472696D416C6C00001100656352656D6F76654475
      70537061636573000010005442584974656D4552656D44757053700102000000
      78070000070043617074696F6E79070000040048696E74000900656354616254
      6F53700000090065635370546F54616200001200544258536570617261746F72
      4974656D363100000F005442584974656D455370546F54616201020000007E07
      0000070043617074696F6E7F070000040048696E74000F005442584974656D45
      546162546F5370010200000080070000070043617074696F6E81070000040048
      696E74000E00656346696E64436C69704E65787400000E00656346696E64436C
      697050726576000016005442585375626D656E754974656D53657373696F6E73
      010100000086070000070043617074696F6E000C00656353706C697435305F35
      3000000C00656353706C697434305F363000000C00656353706C697436305F34
      3000000C00656353706C697433305F373000000C00656353706C697437305F33
      3000000C00656353706C697432305F383000000C00656353706C697438305F32
      30000012005442584974656D4D6163726F5265706561740102000000CD090000
      070043617074696F6E9D070000040048696E74000D0061634D6163726F526570
      65617400001200544258536570617261746F724974656D363200000B00656352
      6570656174436D64000011005442584974656D45526570656174436D64010200
      0000A2070000070043617074696F6EA3070000040048696E7400090054425853
      657057696E00000E005442584974656D57696E465265730101000000A4070000
      070043617074696F6E000D005442584974656D57696E4F75740101000000A507
      0000070043617074696F6E000E005442584974656D57696E436C697001010000
      00A6070000070043617074696F6E000E005442584974656D57696E5472656501
      01000000A7070000070043617074696F6E000D005442584974656D57696E5661
      6C0101000000A8070000070043617074696F6E00090054425853756257696E01
      01000000A9070000070043617074696F6E0010005442584974656D4D61726B43
      6C6561720102000000AD070000070043617074696F6EAE070000040048696E74
      0010006563546F67676C65466F6375734D617000000D005442584974656D5769
      6E4D61700101000000B3070000070043617074696F6E000C00656346696E6449
      6E5472656500001000656346696E64496E547265654E65787400001000656346
      696E64496E547265655072657600000A006563547265654E65787400000A0065
      63547265655072657600000E006563526564756365426C616E6B730000140054
      42584974656D45526564756365426C616E6B730102000000B807000007004361
      7074696F6EB9070000040048696E74000B00656353706C69744C65667400000C
      00656353706C6974526967687400001400656346696E644E6578745769746845
      7874656E6400001400656346696E645072657657697468457874656E64000011
      005442584974656D48656C704B65796D61700102000000E20700000700436170
      74696F6EE3070000040048696E74000C00656346696E64496E4C697374000010
      00656346696E64496E4C6973744E65787400001000656346696E64496E4C6973
      745072657600000F005442584974656D436C697046696E640101000000E40700
      00070043617074696F6E001200544258536570617261746F724974656D363400
      001200544258536570617261746F724974656D3635000013005442584974656D
      5472656546696E6446696E640101000000E5070000070043617074696F6E0012
      00544258536570617261746F724974656D363600000E005442584974656D5661
      6C46696E640101000000E6070000070043617074696F6E001200544258536570
      617261746F724974656D363700000E005442584974656D4F757446696E640101
      000000E7070000070043617074696F6E000900506F7075705472656500000F00
      5442584974656D5472656546696E640101000000E8070000070043617074696F
      6E0011005442584974656D54726565457870616E640101000000E90700000700
      43617074696F6E0013005442584974656D54726565436F6C6C61707365010100
      0000EA070000070043617074696F6E000D0054696D65724175746F5361766500
      000E005442584974656D4D6163726F323900000E005442584974656D4D616372
      6F323800000E005442584974656D4D6163726F323700000E005442584974656D
      4D6163726F323600000E005442584974656D4D6163726F323500000E00544258
      4974656D4D6163726F323400000E005442584974656D4D6163726F323300000E
      005442584974656D4D6163726F323200000E005442584974656D4D6163726F32
      3100000E005442584974656D4D6163726F323000000E005442584974656D4D61
      63726F313900000E005442584974656D4D6163726F313800000E005442584974
      656D4D6163726F313700000E005442584974656D4D6163726F313600000E0054
      42584974656D4D6163726F313500000E005442584974656D4D6163726F313400
      000E005442584974656D4D6163726F313300000E005442584974656D4D616372
      6F313200000E005442584974656D4D6163726F313100000E005442584974656D
      4D6163726F313000000E005442584974656D4D6163726F33300000090061634D
      6163726F31300000090061634D6163726F31310000090061634D6163726F3132
      0000090061634D6163726F31330000090061634D6163726F3134000009006163
      4D6163726F31350000090061634D6163726F31360000090061634D6163726F31
      370000090061634D6163726F31380000090061634D6163726F31390000090061
      634D6163726F32300000090061634D6163726F32310000090061634D6163726F
      32320000090061634D6163726F32330000090061634D6163726F323400000900
      61634D6163726F32350000090061634D6163726F32360000090061634D616372
      6F32370000090061634D6163726F32380000090061634D6163726F3239000009
      0061634D6163726F3330000008005472656546696E6400001800544258497465
      6D5472656546696E64436F7079546F5461620101000000150800000700436170
      74696F6E0014005442584974656D5472656546696E64436C6561720101000000
      16080000070043617074696F6E0019005442584974656D5472656546696E6443
      6F7079546F436C6970010100000017080000070043617074696F6E0017005442
      584974656D5472656546696E64436F6C6C617073650101000000180800000700
      43617074696F6E0015005442584974656D5472656546696E64457870616E6401
      0100000019080000070043617074696F6E001200544258536570617261746F72
      4974656D3639000018005442584974656D5472656546696E64457870616E6443
      757201010000001A080000070043617074696F6E0010005442584974656D4374
      7846696E64494401020000001B080000070043617074696F6E1C080000040048
      696E74000C00656354726565506172656E74000011006563547265654E657874
      42726F74686572000011006563547265655072657642726F7468657200001100
      5442584974656D4D61726B476F4C61737401020000002E080000070043617074
      696F6E2F080000040048696E740012005442584974656D52756E4F70656E4669
      6C65010200000030080000070043617074696F6E31080000040048696E740010
      005442584974656D5353656C546F6B656E010200000034080000070043617074
      696F6E35080000040048696E74001D005442584974656D5472656546696E6443
      6F7079546F436C69704E6F6465010100000038080000070043617074696F6E00
      0D005442584974656D4650726F7073010200000039080000070043617074696F
      6E3A080000040048696E74000700616350726F707300000D006563496E736572
      74436F6C6F7201010000003D080000070043617074696F6E0013005442584974
      656D48746D6C496E73436F6C6F7201020000003E080000070043617074696F6E
      3F080000040048696E74001200544258536570617261746F724974656D373100
      0013005442584974656D436C6970436F7079546F456401010000004408000007
      0043617074696F6E0015005442584974656D436C6970436F7079546F436C6970
      010100000045080000070043617074696F6E001200544258536570617261746F
      724974656D37320000170065635265706C61636553656C46726F6D436C697041
      6C6C00000B0061635265726561644F7574000014006563546F67676C65466F63
      757350726F6A65637400000E005442584974656D57696E50726F6A0101000000
      51080000070043617074696F6E000D006563496E73657274496D616765000013
      005442584974656D48746D6C496E73496D616765010200000052080000070043
      617074696F6E55080000040048696E740018006563546F67676C65466F637573
      4D6173746572536C61766500000D006563546F67676C65536C61766500001300
      5462784974656D52756E46696E6448746D6C3401010000005E08000007004361
      7074696F6E0013005462784974656D52756E46696E6448746D6C350101000000
      5F080000070043617074696F6E000700656352756C657200000D005442584974
      656D4F52756C6572010200000060080000070043617074696F6E610800000400
      48696E74001400656353706C6974566965777356657274486F727A0000140065
      6353706C6974536C61766556657274486F727A000008006563476F746F426B00
      000D005442584974656D426B476F746F01020000006C08000007004361707469
      6F6E6D080000040048696E740015005442584974656D48746D6C4C6F72656D49
      7073756D010200000070080000070043617074696F6E71080000040048696E74
      000C0065634C6F72656D497073756D000011005442585375626D656E75497465
      6D466176010100000072080000070043617074696F6E0011005442584974656D
      46617641646446696C65010200000073080000070043617074696F6E74080000
      040048696E740010005442584974656D4661764D616E61676501020000007508
      0000070043617074696F6E76080000040048696E74000C006163466176416464
      46696C6500000B0061634661764D616E61676500001A005462785375626D656E
      754974656D526563656E74436F6C6F72730101000000F2080000040048696E74
      001400496D6167654C697374436F6C6F72526563656E74000012005442584974
      656D437478416464436F6C6F7201020000007C080000070043617074696F6E7D
      080000040048696E740011005442584974656D46617641646450726F6A010200
      00007E080000070043617074696F6E7F080000040048696E74000C0061634661
      7641646450726F6A00001200544258536570617261746F724974656D37350000
      13005442584974656D546162416464546F50726F6A0101000000800800000700
      43617074696F6E0012006563546F67676C65466F637573436C69707300000F00
      5462784974656D57696E436C697073010100000084080000070043617074696F
      6E000A00506F707570436C697073000013005442584974656D436C6970734164
      6454657874010100000085080000070043617074696F6E001000544258497465
      6D436C69707345646974010100000086080000070043617074696F6E00120054
      4258536570617261746F724974656D3736000013005442584974656D436C6970
      7341646446696C65010100000087080000070043617074696F6E000F00544258
      4974656D436C697073446972010100000088080000070043617074696F6E0009
      004F445F5377617463680000090053445F53776174636800000B005442585461
      62436F6C6F72000012005442585375626D656E75546162436F6C6F7201010000
      008D080000070043617074696F6E0013005442584974656D546162436F6C6F72
      4D69736301010000008E080000070043617074696F6E00120054425853657061
      7261746F724974656D3737000012005442584974656D546162436F6C6F724465
      6601010000008F080000070043617074696F6E0013005442584974656D436C69
      707344656C54657874010100000090080000070043617074696F6E0009006563
      536D617274486C000015005442584974656D426B44726F70506F727461626C65
      010200000093080000070043617074696F6E95080000040048696E7400100065
      6344726F70506F727461626C65426B00001200544258536570617261746F7249
      74656D3738000010006563476F746F506F727461626C65426B00001500544258
      4974656D426B476F746F506F727461626C650102000000960800000700436170
      74696F6E97080000040048696E74000800616352656E616D6500000E00544258
      4974656D4652656E616D6501020000009E080000070043617074696F6E9F0800
      00040048696E740011005442584974656D52756E4E756D436F6E760102000000
      A0080000070043617074696F6EA1080000040048696E7400120065634E756D65
      726963436F6E76657274657200000F006563496E64656E744C696B6531737400
      001200544258536570617261746F724974656D3333000015005442584974656D
      45496E64656E744C696B653173740102000000A4080000070043617074696F6E
      A5080000040048696E740015005442584974656D56696577436F6C4D61726B65
      72730102000000A8080000070043617074696F6EA9080000040048696E74000F
      006163436F6C756D6E4D61726B65727300001200544258536570617261746F72
      4974656D373900000C00496D6167654C697374467470000008004C697374504C
      6F6700000F00506F707570506C7567696E734C6F67000012005442584974656D
      504C6F67436F707953656C0101000000B0080000070043617074696F6E001200
      5442584974656D504C6F67436F7079416C6C0101000000B10800000700436170
      74696F6E001200544258536570617261746F724974656D383100001100544258
      4974656D504C6F6744656C6574650101000000B2080000070043617074696F6E
      0010005442584974656D504C6F67436C6561720101000000B308000007004361
      7074696F6E001200544258536570617261746F724974656D383200000F005442
      584974656D504C6F6746696E640101000000B4080000070043617074696F6E00
      1A005442584974656D43747850617374654E6F4375724368616E676501020000
      00B7080000070043617074696F6EB8080000040048696E740012005442585365
      70617261746F724974656D3830000013005442585375626D656E754974656D45
      6D6D65740101000000B9080000070043617074696F6E0014005442584974656D
      48746D6C456D6D6574577261700101000000C3080000070043617074696F6E00
      16005442584974656D48746D6C456D6D6574457870616E640101000000C20800
      00070043617074696F6E000900506C7567696E41435000010100000004004869
      6E7400000D00656343656E7465724C696E657300001200544258536570617261
      746F724974656D3833000013005442584974656D4543656E7465724C696E6573
      0102000000D0080000070043617074696F6ED1080000040048696E740008004C
      697374546162730102000000D50800001200436F6C756D6E735B305D2E436170
      74696F6ED60800001200436F6C756D6E735B315D2E43617074696F6E00110065
      63546F67676C65466F6375735461627300000E005462784974656D57696E5461
      62730101000000D9080000070043617074696F6E0015005442585375626D656E
      754974656D506C7567696E730101000000DA080000070043617074696F6E0012
      00544258536570617261746F724974656D3834000019005442584974656D4F45
      64697453796E506C7567696E73496E690102000000DB08000007004361707469
      6F6EDC080000040048696E740011005442584974656D504C6F67536176654173
      0101000000DD080000070043617074696F6E0016005442584974656D5461624D
      6F7665546F57696E646F770101000000DE080000070043617074696F6E001600
      5442584974656D5461624F70656E496E57696E646F770101000000DF08000007
      0043617074696F6E0011006563456E636F646548746D6C436861727300000C00
      6563536F72744469616C6F67000012005442584974656D45536F72744469616C
      6F670102000000E6080000070043617074696F6EE7080000040048696E740012
      00544258536570617261746F724974656D3836000013005442584974656D5462
      536F72744469616C6F670101000000E8080000070043617074696F6E00130054
      42584974656D5353656C427261636B6574730102000000ED0800000700436170
      74696F6EEE080000040048696E7400110050726F70734D616E61676572507269
      6E740000090054696D657254726565000010006563436F6C6C61707365506172
      656E74000014006563436F6C6C61707365576974684E65737465640000100065
      635370546F5461624C656164696E67000013005442584974656D455370546F54
      61624C6561640102000000FF080000070043617074696F6E0009000004004869
      6E740016006563546F67676C654C696E65436F6D6D656E74416C7400001C0054
      42584974656D45546F67676C654C696E65436F6D6D656E74416C740102000000
      05090000070043617074696F6E06090000040048696E74001800544258497465
      6D4374785061737465546F436F6C756D6E310102000000090900000700436170
      74696F6E0A090000040048696E74000E006563436F6D6D616E64734C69737400
      0016005442584974656D48656C70436F6D6D616E644C69737401020000000D09
      0000070043617074696F6E10090000040048696E74000D00656350726F6A6563
      744C69737400001200544258536570617261746F724974656D39300000170054
      62785375626D656E754974656D4361726574734F707301010000001709000007
      0043617074696F6E0014005442584974656D43617265747352656D6F76653201
      0100000018090000070043617074696F6E0014005442584974656D4361726574
      7352656D6F766531010100000019090000070043617074696F6E001200544258
      536570617261746F724974656D3931000019005442584974656D436172657473
      46726F6D53656C436C65617201010000001A090000070043617074696F6E0019
      005442584974656D43617265747346726F6D53656C526967687401010000001B
      090000070043617074696F6E0018005442584974656D43617265747346726F6D
      53656C4C65667401010000001C090000070043617074696F6E00120054425853
      6570617261746F724974656D3932000017005442584974656D43617265747345
      7874446F776E456E6401010000001D090000070043617074696F6E0015005442
      584974656D4361726574734578745570456E6401010000001E09000007004361
      7074696F6E0018005442584974656D436172657473457874446F776E50616765
      01010000001F090000070043617074696F6E0016005442584974656D43617265
      7473457874557050616765010100000020090000070043617074696F6E001800
      5442584974656D436172657473457874446F776E4C696E650101000000210900
      00070043617074696F6E0016005442584974656D43617265747345787455704C
      696E65010100000022090000070043617074696F6E0012005442585365706172
      61746F724974656D393300001B005442584974656D43617265747346726F6D4D
      61726B73436C65617201010000003F090000070043617074696F6E001B005442
      584974656D43617265747346726F6D4D61726B73526967687401010000004009
      0000070043617074696F6E001A005442584974656D43617265747346726F6D4D
      61726B734C656674010100000041090000070043617074696F6E000E00544258
      4974656D45436F6C756D6E010200000042090000070043617074696F6E430900
      00040048696E74000C00656345646974436F6C756D6E00000A00656344656475
      70416C6C00000F006563446564757041646A6163656E74000012005442585365
      70617261746F724974656D3934000010005442584974656D454465647570416C
      6C010100000044090000070043617074696F6E00120054425853657061726174
      6F724974656D3835000011005442584974656D54624465647570416C6C010100
      000045090000070043617074696F6E001200544258536570617261746F724974
      656D3935000014005442584974656D45416C69676E5769746853657001020000
      0048090000070043617074696F6E49090000040048696E74000E006563416C69
      676E57697468536570000015005442584974656D546162546F67676C6553706C
      697401010000004E090000070043617074696F6E0012006563546F67676C6553
      686F7747726F757032000011005442584974656D5353656C457874656E640102
      00000055090000070043617074696F6E56090000040048696E74001600544258
      4974656D54726565436F6C6C61707365416C6C01010000005909000007004361
      7074696F6E0014005442584974656D54726565457870616E64416C6C01010000
      005A090000070043617074696F6E0011005442584974656D547265654C657665
      6C3201010000005B090000070043617074696F6E0011005442584974656D5472
      65654C6576656C3501010000005C090000070043617074696F6E001100544258
      4974656D547265654C6576656C3401010000005D090000070043617074696F6E
      0011005442584974656D547265654C6576656C3301010000005E090000070043
      617074696F6E001200544258536570617261746F724974656D39360000130054
      42585375626D656E75547265654C6576656C01010000005F0900000700436170
      74696F6E0011005442584974656D547265654C6576656C360101000000600900
      00070043617074696F6E0011005442584974656D547265654C6576656C390101
      00000061090000070043617074696F6E0011005442584974656D547265654C65
      76656C38010100000062090000070043617074696F6E0011005442584974656D
      547265654C6576656C37010100000063090000070043617074696F6E000E0065
      63526576657273654C696E657300001200544258536570617261746F72497465
      6D363800000F005442584974656D455265766572736501010000006609000007
      0043617074696F6E000E00656353687566666C654C696E657300000F00544258
      4974656D4553687566666C6501010000006D090000070043617074696F6E0007
      0074625573657231010100000087090000070043617074696F6E000700746255
      73657232010100000088090000070043617074696F6E00070074625573657233
      010100000089090000070043617074696F6E001200544258536570617261746F
      724974656D393700000D005442584974656D5455736572330101000000930900
      00070043617074696F6E000D005442584974656D545573657232010100000092
      090000070043617074696F6E000D005442584974656D54557365723101010000
      0091090000070043617074696F6E0012005442585375626D656E75546F6F6C62
      61727301010000008D090000070043617074696F6E0010005442584974656D4F
      546F6F6C6261723301010000008E090000070043617074696F6E001000544258
      4974656D4F546F6F6C6261723201010000008F090000070043617074696F6E00
      10005442584974656D4F546F6F6C626172310101000000900900000700436170
      74696F6E00110065634578747261637444757073436173650000130065634578
      7472616374447570734E6F4361736500001100544258536570617261746F7249
      74656D37000018005442584974656D45457874726163744475704E6F43617365
      01010000009A090000070043617074696F6E0016005442584974656D45457874
      726163744475704361736501010000009B090000070043617074696F6E000D00
      65634E6F6E5072696E744F66660000100065634E6F6E5072696E745370616365
      7300000D0065634E6F6E5072696E74456F6C00000E0065634E6F6E5072696E74
      426F7468000016005442585375626D656E754974656D4E6F6E5072696E740101
      000000BC090000070043617074696F6E001200544258536570617261746F7249
      74656D3938000011005442584974656D4F4E5072696E74416C6C0101000000BD
      090000070043617074696F6E0011005442584974656D4F4E5072696E74456F6C
      0101000000BE090000070043617074696F6E0014005442584974656D4F4E5072
      696E745370616365730101000000BF090000070043617074696F6E000C00506F
      7075705573657254423100000E005442584974656D5573657254623101010000
      00C1090000070043617074696F6E000C00506F7075705573657254423200000E
      005442584974656D557365725442320101000000C2090000070043617074696F
      6E000C00506F7075705573657254423300000E005442584974656D5573657254
      42330101000000C3090000070043617074696F6E0018005442584974656D4374
      785061737465426B6D6B4C696E65730101000000C5090000070043617074696F
      6E0017005442584974656D43747850617374654173436F6C756D6E0101000000
      C6090000070043617074696F6E001200544258536570617261746F724974656D
      3939000018005442584974656D4F4E5072696E74456F6C44657461696C730101
      000000C7090000070043617074696F6E00140065634E6F6E5072696E74456F6C
      44657461696C73000011005442584974656D4F486964654974656D7301020000
      00CA090000070043617074696F6ECE090000040048696E740013005442585365
      70617261746F724974656D313030000012005442584974656D4F456469745379
      6E496E690102000000DB090000070043617074696F6EDC090000040048696E74
      00110061634F70656E427953656C656374696F6E00000E00496D6167654C6973
      74557365723100000E00496D6167654C697374557365723200000E00496D6167
      654C697374557365723300000C00544258446F636B4C6566743100000D005442
      58446F636B52696768743100000E00544258446F636B426F74746F6D3100000C
      0053706C69747465724C65667400000D0053706C697474657252696768740000
      0E0053706C6974746572426F74746F6D00000F005374617475734974656D4C65
      7865720101000000F3090000040048696E74000E005374617475734974656D45
      6E64730101000000F2090000040048696E74000D005374617475734974656D45
      6E630101000000F1090000040048696E74000F005374617475734974656D4361
      726574000013005370544258536570617261746F724974656D31000013005370
      544258536570617261746F724974656D32000013005370544258536570617261
      746F724974656D33000013005370544258536570617261746F724974656D3400
      000E005374617475734974656D436861720101000000F4090000040048696E74
      0013005370544258536570617261746F724974656D3500000C00537461747573
      4974656D524F0101000000F5090000040048696E740013005370544258536570
      617261746F724974656D3600000E005374617475734974656D57726170010100
      0000F6090000040048696E740013005370544258536570617261746F72497465
      6D37000011005374617475734974656D53656C4D6F64650101000000F7090000
      040048696E740013005370544258536570617261746F724974656D3800001100
      5374617475734974656D496E734D6F64650102000000EF090000070043617074
      696F6EF8090000040048696E740013005370544258536570617261746F724974
      656D3900000E005374617475734974656D5A6F6F6D0102000000F00900000700
      43617074696F6EF9090000040048696E74001400537054425853657061726174
      6F724974656D313000000E005374617475734974656D42757379000014005370
      544258536570617261746F724974656D313100000E005374617475734974656D
      48696E74000016005442584D52554C6973744974656D46526563656E74730000
      13005442584D52554C6973744974656D5F536573730000140053705442585365
      70617261746F724974656D3132000014005370544258536570617261746F7249
      74656D3133000014005370544258536570617261746F724974656D3134000012
      005442584D52554C6973744974656D464E6577000011005462784974656D5650
      616E656C436C69700102000000430A0000070043617074696F6E480A00000400
      48696E740011005442585375626D656E754D61726B6572730101000000510A00
      00070043617074696F6E000F005442585375626D656E75426B4F707301010000
      00520A0000070043617074696F6E0014005442585375626D656E75426B506F72
      7461626C650101000000530A0000070043617074696F6E001400537054425853
      6570617261746F724974656D3136000012005442585375626D656E754974656D
      48544D4C0101000000550A0000070043617074696F6E00140053705442585365
      70617261746F724974656D313900000E00506F707570466F6C644C6576656C00
      0014005370544258536570617261746F724974656D3233000010005442584974
      656D556E666F6C64416C6C0101000000590A0000070043617074696F6E000E00
      5442584974656D466F6C64416C6C01010000005A0A0000070043617074696F6E
      001200544258536570617261746F724974656D3837000011005442584974656D
      556E666F6C644C696E6501010000005B0A0000070043617074696F6E00170054
      42584974656D466F6C644E656172657374426C6F636B01010000005C0A000007
      0043617074696F6E0013005442584974656D466F6C6453656C426C6F636B0101
      0000005D0A0000070043617074696F6E001200544258536570617261746F7249
      74656D3839000016005442584974656D466F6C6452616E676573496E53656C01
      010000005E0A0000070043617074696F6E0018005442584974656D556E666F6C
      6452616E676573496E53656C01010000005F0A0000070043617074696F6E0012
      00544258536570617261746F724974656D3838000011005442584974656D466F
      6C64506172656E740101000000600A0000070043617074696F6E001500544258
      4974656D466F6C64576974684E65737465640101000000610A00000700436170
      74696F6E0013005442585375626D656E75466F6C644C6576656C010100000062
      0A0000070043617074696F6E0011005442584974656D466F6C644C6576656C32
      0101000000630A0000070043617074696F6E0011005442584974656D466F6C64
      4C6576656C330101000000640A0000070043617074696F6E0011005442584974
      656D466F6C644C6576656C340101000000650A0000070043617074696F6E0011
      005442584974656D466F6C644C6576656C350101000000660A00000700436170
      74696F6E0011005442584974656D466F6C644C6576656C360101000000670A00
      00070043617074696F6E0011005442584974656D466F6C644C6576656C370101
      000000680A0000070043617074696F6E0011005442584974656D466F6C644C65
      76656C380101000000690A0000070043617074696F6E0011005442584974656D
      466F6C644C6576656C3901010000006A0A0000070043617074696F6E00100054
      62784974656D54616252656C6F616401010000006B0A0000070043617074696F
      6E0012005442585375626D656E7548746D6C48656C7001010000006C0A000007
      0043617074696F6E0014005442584974656D48746D6C456D6D657448656C7001
      010000006D0A0000070043617074696F6E001400537054425853657061726174
      6F724974656D313700000C0054696D65724D696E696D61700000120054425853
      75626D656E754974656D436F6E760101000000700A0000070043617074696F6E
      0018005442585375626D656E754974656D48746D6C456E636F64650101000000
      710A0000070043617074696F6E001B005442584974656D456E636F646548746D
      6C4E6F427261636B6574730101000000720A0000070043617074696F6E001400
      5442584974656D456E636F646548746D6C416C6C0101000000730A0000070043
      617074696F6E0012006563456E636F646548746D6C4368617273320000140053
      70544258536570617261746F724974656D3138000013005442585375626D656E
      754974656D5072696E740101000000740A0000070043617074696F6E000D0054
      62784974656D4D656E75585801020000007F0A0000070043617074696F6E800A
      0000040048696E74000C005462784974656D4D656E75580102000000810A0000
      070043617074696F6E820A0000040048696E740016005442585375626D656E75
      4974656D50726F6A656374730101000000890A0000070043617074696F6E0012
      005442584974656D50726F6A41646446696C6501010000008B0A000007004361
      7074696F6E000F005442584974656D50726F6A4F70656E01010000008C0A0000
      070043617074696F6E0019005442585375626D656E754974656D50726F6A5265
      63656E747301010000008D0A0000070043617074696F6E0017005442584D5255
      4C6973744974656D5F50726F6A65637473000014005370544258536570617261
      746F724974656D3234000016005442584974656D50726F6A526563656E74436C
      65617201010000008E0A0000070043617074696F6E0014005370544258536570
      617261746F724974656D323100000F005442584974656D50726F6A476F746F01
      010000008F0A0000070043617074696F6E000E005442584974656D50726F6A4E
      65770101000000900A0000070043617074696F6E000D005442584974656D546F
      6F6C31360101000000AD0A0000070043617074696F6E000D005442584974656D
      546F6F6C31350101000000AE0A0000070043617074696F6E000D005442584974
      656D546F6F6C31340101000000AF0A0000070043617074696F6E000D00544258
      4974656D546F6F6C31330101000000B00A0000070043617074696F6E00100054
      62784974656D437478546F6F6C3136000010005462784974656D437478546F6F
      6C3135000010005462784974656D437478546F6F6C3134000010005462784974
      656D437478546F6F6C3133000016005442584974656D50726F6A416464416C6C
      46696C65730101000000B50A0000070043617074696F6E000F00546278497465
      6D50726F6A536176650101000000BC0A0000070043617074696F6E0014005370
      544258536570617261746F724974656D323200000900706C436F6E736F6C6500
      0009006564436F6E736F6C65000014006563546F67676C65466F637573436F6E
      736F6C65000011005442584974656D57696E436F6E736F6C650101000000C20A
      0000070043617074696F6E001500507974686F6E475549496E7075744F757470
      75743100000D00507974686F6E456E67696E653100000B004D656D6F436F6E73
      6F6C6500000C00507974686F6E4D6F64756C6500001400537054425853657061
      7261746F724974656D3235000013005462784974656D52756E4E6577506C7567
      696E0102000000C30A0000070043617074696F6EC80A0000040048696E740010
      005462784974656D48656C7050794469720102000000C60A0000070043617074
      696F6EC70A0000040048696E740012005462784974656D52756E536E69707065
      74730102000000C90A0000070043617074696F6ED00A0000040048696E740014
      005370544258536570617261746F724974656D3236000014005462784974656D
      52756E4E6577536E69707065740102000000CA0A0000070043617074696F6ECF
      0A0000040048696E74000B0053445F536E697070657473000014005370544258
      536570617261746F724974656D3237000011005374617475734974656D546162
      73697A650101000000D10A0000040048696E740011005462784974656D547265
      65536F727465640101000000D20A0000070043617074696F6E000F00436F6C6F
      724469616C6F675461627300000F00506F70757050616E656C5469746C650000
      14005462784974656D50616E656C5469746C654261720101000000D30A000007
      0043617074696F6E001A005462784974656D50616E656C5469746C6553686F77
      52696768740101000000D40A0000070043617074696F6E001800546278497465
      6D50616E656C5469746C6553686F774F75740101000000D50A00000700436170
      74696F6E0019005462784974656D50616E656C5469746C6553686F774C656674
      0101000000D60A0000070043617074696F6E0014005370544258536570617261
      746F724974656D3238000014005370544258536570617261746F724974656D32
      39000010005462784974656D57696E53706C6974560101000000DA0A00000700
      43617074696F6E0010005462784974656D57696E53706C6974480101000000DB
      0A0000070043617074696F6E0011005462784974656D57696E50726F6A507265
      0101000000DE0A0000070043617074696F6E0013006563546F67676C6550726F
      6A50726576696577000018005462785375626D656E754974656D437478506C75
      67696E730101000000E30A0000070043617074696F6E0017005462785375626D
      656E754974656D50726F6A546F6F6C730101000000EC0A000007004361707469
      6F6E001200506F70757050726576696577456469746F72000010005462784974
      656D50726553656C65637400000E005462784974656D507265436F7079000014
      005370544258536570617261746F724974656D3330000013005462784974656D
      5072655A6F6F6D4F74686572000011005462784974656D5072655A6F6F6D3130
      30000010005462784974656D5072655A6F6F6D3735000010005462784974656D
      5072655A6F6F6D3530000010005462784974656D5072655A6F6F6D323500000E
      005462784974656D50726545646974000014005370544258536570617261746F
      724974656D3331000014005442585375626D656E754974656D47726F75707301
      01000000F50A0000040048696E74000E005462784974656D47726F7570324801
      01000000F60A0000070043617074696F6E000E005462784974656D47726F7570
      32560101000000F70A0000070043617074696F6E000F005462784974656D4772
      6F75704F6E650101000000F80A0000070043617074696F6E000E005462784974
      656D47726F757033480101000000F90A0000070043617074696F6E000E005462
      784974656D47726F757033560101000000FA0A0000070043617074696F6E0011
      005462784974656D47726F757036477269640101000000FB0A00000700436170
      74696F6E0011005462784974656D47726F757034477269640101000000FC0A00
      00070043617074696F6E000E005462784974656D47726F757034560101000000
      FD0A0000070043617074696F6E000E005462784974656D47726F757034480101
      000000FE0A0000070043617074696F6E0012005462784974656D47726F757033
      61733170320101000000FF0A0000070043617074696F6E001500544258537562
      6D656E754974656D546F47726F75700101000000000B0000070043617074696F
      6E0012005462784974656D546F47726F7570507265760101000000070B000007
      0043617074696F6E0012005462784974656D546F47726F75704E657874010100
      0000080B0000070043617074696F6E000F005462784974656D546F47726F7570
      360101000000010B0000070043617074696F6E000F005462784974656D546F47
      726F7570350101000000020B0000070043617074696F6E000F00546278497465
      6D546F47726F7570340101000000030B0000070043617074696F6E000F005462
      784974656D546F47726F7570330101000000040B0000070043617074696F6E00
      0F005462784974656D546F47726F7570320101000000050B0000070043617074
      696F6E000F005462784974656D546F47726F7570310101000000060B00000700
      43617074696F6E0014005370544258536570617261746F724974656D32300000
      1E005442584974656D546162436C6F73654F7468657273416C6C47726F757073
      0101000000090B0000070043617074696F6E0016006163436C6F73654F746865
      7273416C6C47726F75707300000D004C697374426F6F6B6D61726B7301030000
      00110B00001200436F6C756D6E735B305D2E43617074696F6E120B0000120043
      6F6C756D6E735B315D2E43617074696F6E130B00001200436F6C756D6E735B32
      5D2E43617074696F6E000E005462784974656D57696E426B6D6B010100000014
      0B0000070043617074696F6E0016006563546F67676C65466F637573426F6F6B
      6D61726B7300000E00496D6167654C69737449636F6E7300000D005462784974
      656D57696E4674700101000000190B0000070043617074696F6E001200546278
      4974656D57696E4578706C6F72657201010000001A0B0000070043617074696F
      6E0016005442584974656D546162436C6F73655269676874657201010000001F
      0B0000070043617074696F6E0015005442584974656D546162436C6F73654C65
      667465720101000000200B0000070043617074696F6E00120065635265706C61
      6365496E50726F6A656374000014005462784974656D53526570496E50726F6A
      6563740102000000210B0000070043617074696F6E220B0000040048696E7400
      1200656350726576696577416374696F6E4E657700000F00616353657475704C
      657865724E6577000014006563506167655365747570416374696F6E4E657700
      0012005442584974656D454361736552616E646F6D0102000000320B00000700
      43617074696F6E330B0000040048696E740014005442584974656D4261724361
      736552616E646F6D0101000000340B0000070043617074696F6E000900616352
      657374617274000016005442584974656D5472656546696E6450726576696577
      01010000003A0B0000070043617074696F6E0014005442584974656D45446564
      7570416C6C4F72696701010000003B0B0000070043617074696F6E0011006563
      4465647570416C6C416E644F72696700000D00656345787472616374556E6971
      000013005442584974656D4545787472616374556E69710101000000400B0000
      070043617074696F6E00}
  end
  object TimerHint: TTimer
    Enabled = False
    Interval = 7000
    OnTimer = TimerHintTimer
    Left = 344
    Top = 360
  end
  object PopupTabContext: TSpTBXPopupMenu
    OnPopup = PopupTabContextPopup
    Left = 400
    Top = 304
    object TBXItemTabClose: TSpTBXItem
      Caption = 'Close tab'
      OnClick = TBXItemTabCloseClick
    end
    object TBXItemTabCloseOthers: TSpTBXItem
      Caption = 'Close others'
      OnClick = TBXItemTabCloseOthersClick
    end
    object TBXItemTabCloseOthersAllGroups: TSpTBXItem
      Caption = 'Close others (all groups)'
      OnClick = TBXItemTabCloseOthersAllGroupsClick
    end
    object TBXItemTabCloseLefter: TSpTBXItem
      Caption = 'Close left tabs'
      OnClick = TBXItemTabCloseLefterClick
    end
    object TBXItemTabCloseRighter: TSpTBXItem
      Caption = 'Close right tabs'
      OnClick = TBXItemTabCloseRighterClick
    end
    object TBXItemTabNew: TSpTBXItem
      Caption = 'Create new tab'
      OnClick = TBXItemTabNewClick
    end
    object TbxItemTabReload: TSpTBXItem
      Caption = 'Reopen tab'
      OnClick = TbxItemTabReloadClick
    end
    object TBXSeparatorItem42: TSpTBXSeparatorItem
    end
    object TBXItemTabToggleSplit: TSpTBXItem
      Caption = 'Split this tab'
      OnClick = TBXItemTabToggleSplitClick
    end
    object TBXItemTabMoveToWindow: TSpTBXItem
      Caption = 'Move to new window'
      OnClick = TBXItemTabMoveToWindowClick
    end
    object TBXItemTabOpenInWindow: TSpTBXItem
      Caption = 'Open in new window'
      OnClick = TBXItemTabOpenInWindowClick
    end
    object TBXSubmenuItemToGroup: TSpTBXSubmenuItem
      Caption = 'Move to group'
      OnPopup = TBXSubmenuItemToGroupPopup
      object TbxItemToGroup1: TSpTBXItem
        Tag = 1
        Caption = '1'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroup2: TSpTBXItem
        Tag = 2
        Caption = '2'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroup3: TSpTBXItem
        Tag = 3
        Caption = '3'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroup4: TSpTBXItem
        Tag = 4
        Caption = '4'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroup5: TSpTBXItem
        Tag = 5
        Caption = '5'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroup6: TSpTBXItem
        Tag = 6
        Caption = '6'
        OnClick = TbxItemToGroup1Click
      end
      object SpTBXSeparatorItem20: TSpTBXSeparatorItem
      end
      object TbxItemToGroupNext: TSpTBXItem
        Tag = -1
        Caption = 'Next'
        OnClick = TbxItemToGroup1Click
      end
      object TbxItemToGroupPrev: TSpTBXItem
        Tag = -2
        Caption = 'Previous'
        OnClick = TbxItemToGroup1Click
      end
    end
    object TBXSeparatorItem41: TSpTBXSeparatorItem
    end
    object TBXItemTabCopyFN: TSpTBXItem
      Caption = 'Copy filename to clipboard'
      OnClick = TBXItemTabCopyFNClick
    end
    object TBXItemTabCopyFull: TSpTBXItem
      Caption = 'Copy full path to clipboard'
      OnClick = TBXItemTabCopyFullClick
    end
    object TBXItemTabCopyDir: TSpTBXItem
      Caption = 'Copy dir path to clipboard'
      OnClick = TBXItemTabCopyDirClick
    end
    object TBXSeparatorItem75: TSpTBXSeparatorItem
    end
    object TBXItemTabAddToProj: TSpTBXItem
      Caption = 'Add to project'
      OnClick = TBXItemTabAddToProjClick
    end
    object TBXSubmenuTabColor: TSpTBXSubmenuItem
      Caption = 'Set color'
      OnPopup = TBXSubmenuTabColorPopup
      object TBXItemTabColorDef: TSpTBXItem
        Caption = 'Default'
        RadioItem = True
        OnClick = TBXItemTabColorDefClick
      end
      object TBXTabColor: TSpTBXColorPalette
        CustomColors = True
        ColCount = 5
        Options = []
        RowCount = 2
        OnCellClick = TBXTabColorCellClick
        OnGetColor = TBXTabColorGetColor
      end
      object TBXSeparatorItem77: TSpTBXSeparatorItem
      end
      object TBXItemTabColorMisc: TSpTBXItem
        Caption = 'Custom...'
        OnClick = TBXItemTabColorMiscClick
      end
    end
  end
  object ImageListCloseBtn: TImageList
    Height = 14
    Width = 14
    Left = 361
    Top = 193
    Bitmap = {
      494C01010400090004000E000E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000380000002A0000000100200000000000C024
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000004080000040
      8000000000000000000000000000004080000040800000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000408000004080000040800000408000004080000040
      8000004080000040800000408000004080000040800000408000004080000000
      0000000000000000000000000000000000000000000000000000004080000040
      8000004080000000000000408000004080000040800000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000040
      8000004080000000000000000000000000000040800000408000000000000000
      0000000000000000000000408000004080000040800000408000004080000040
      8000004080000040800000408000004080000040800000408000004080000000
      0000000000000000000000000000000000000000000000000000000000000040
      8000004080000040800000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000040
      8000004080000040800000000000004080000040800000408000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000004080000040800000408000000000000000000000000000000000000000
      0000000000000040800000000000000000000040800000408000000000000000
      0000004080000000000000000000000000000000000000000000000000000000
      0000004080000040800000408000004080000040800000000000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000408000004080000000000000000000000000000040
      8000004080000040800000408000004080000000000000000000000000000000
      0000004080000040800000000000000000000040800000408000000000000000
      0000004080000040800000000000000000000000000000000000000000000000
      0000000000000040800000408000004080000000000000000000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000408000004080000040800000000000004080000040
      8000004080000000000000408000004080000040800000000000000000000040
      8000004080000040800000408000004080000040800000408000004080000040
      8000004080000040800000408000000000000000000000000000000000000000
      0000004080000040800000408000004080000040800000000000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000000000004080000040800000408000004080000040
      8000000000000000000000000000004080000040800000000000000000000000
      0000004080000040800000000000000000000040800000408000000000000000
      0000004080000040800000000000000000000000000000000000000000000040
      8000004080000040800000000000004080000040800000408000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000000000000000000040800000408000004080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000040800000000000000000000040800000408000000000000000
      0000004080000000000000000000000000000000000000000000000000000040
      8000004080000000000000000000000000000040800000408000000000000000
      0000000000000000000000408000004080000000000000000000000000000000
      0000000000000000000000000000000000000000000000408000004080000000
      0000000000000000000000000000004080000040800000408000004080000040
      8000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000408000004080000040800000408000004080000040
      8000004080000040800000408000004080000040800000408000004080000000
      0000000000000000000000408000004080000040800000000000004080000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000408000004080000040800000408000004080000040
      8000004080000040800000408000004080000040800000408000004080000000
      0000000000000000000000408000004080000000000000000000000000000040
      8000004080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000040800000408000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000380000002A0000000100010000000000500100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFF00FFFFFFFFCE7F3F00
      FFFC001FC47F3F00E73C001FE0FF3F00E23CFF9FF1FB3700F07CFF9CE0F33300
      F8FCFF9C44600100F07CFF9E0E733300E23CFF9F1FFB3700E73CFF9E0FFF3F00
      FFFC001C47FF3F00FFFC001CE7FF3F00FFFFFFFFFFFFFF00FFFFFFFFFFFFFF00
      00000000000000000000000000000000000000000000}
  end
  object OD_Session: TTntOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 585
    Top = 333
  end
  object SD_Session: TTntSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 609
    Top = 333
  end
  object TimerLoad: TTimer
    Interval = 1100
    OnTimer = TimerLoadTimer
    Left = 368
    Top = 360
  end
  object TimerSel: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerSelTimer
    Left = 392
    Top = 360
  end
  object PopupOut: TSpTBXPopupMenu
    OnPopup = PopupOutPopup
    Left = 424
    Top = 304
    object TBXItemOutNav: TSpTBXItem
      Caption = 'Navigate'
      OnClick = TBXItemOutNavClick
    end
    object TBXSeparatorItem18: TSpTBXSeparatorItem
    end
    object TBXItemOutCopySel: TSpTBXItem
      Caption = 'Copy selected'
      OnClick = TBXItemOutCopySelClick
    end
    object TBXItemOutCopyAll: TSpTBXItem
      Caption = 'Copy all'
      OnClick = TBXItemOutCopyAllClick
    end
    object TBXSeparatorItem32: TSpTBXSeparatorItem
    end
    object TBXItemOutDelSel: TSpTBXItem
      Caption = 'Delete selected'
      OnClick = TBXItemOutDelSelClick
    end
    object TBXItemOutDelNonparsed: TSpTBXItem
      Caption = 'Delete non-parsable'
      OnClick = TBXItemOutDelNonparsedClick
    end
    object TBXItemOutClear: TSpTBXItem
      Caption = 'Clear'
      OnClick = TBXItemOutClearClick
    end
    object TBXSeparatorItem67: TSpTBXSeparatorItem
    end
    object TBXItemOutFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemOutFindClick
    end
  end
  object ImageListStatus: TImageList
    Left = 336
    Top = 192
    Bitmap = {
      494C01010D000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000004000000001002000000000000040
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      FF000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000FF000000FF000000FF000000FF000000FF000000FF000000FF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000FF000000FF000000FF000000FF000000FF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000FF000000FF000000FF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000EFE3DF00C6938400B1675200A6543C00B1675200C6938400EFE3DF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000E9C7
      BF00C65B4300EF402400FF351800FF311300FF351800EF402400C65B4300E9C7
      BF00000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000F5E3DF00D45C
      4400FF3E2200FF311300FF301200FF301200FF301200FF301200FF381B00D35B
      4300F5E3DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E2938300F34B
      3100FF331600FF311300FF311300FF311300FF311300FF311300FF311300ED40
      2500E29383000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000DD665000FF54
      3C00F7341700F7311400F7311400F7311400F7311400F7311400F7311400F43A
      1D00DD6650000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000E0533A00FF61
      4A00F44A3000EC3C2000E6321500E5311400E5311400E5311400E5311400ED3B
      1F00E0533A000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000E8665000FF66
      5000FB523900FB523900F64D3300EC452A00E33B1F00DD361A00D9331600EC46
      2C00E86650000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000F1928200FF64
      4E00FF624B00FF5D4600FF5D4600FF5D4600FF5D4600FF5D4600FF604900FF5D
      4600F19282000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000FBE2DE00F45F
      4800FF715D00FF6F5A00FF6C5600FF6C5600FF6C5600FF6E5900FF6D5800F35E
      4700FBE2DE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FAC6
      BE00F75F4800FF675200FF776400FF7D6A00FF776400FF675100F75F4800FAC6
      BE00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FCE2DE00F9928200F7654F00F6523900F7654F00F9928200FCE2DE000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002D2D0D002B2B0B002B2B
      0B002B2B0B002B2B0B002B2B0B002B2B0B002B2B0B002B2B0B002B2B0B002B2B
      0B002B2B0B002B2B0B002D2D0D00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003A3A1800F9F9E900F3F3
      E200F3F3E200F3F3E200F3F3E200F3F3E200F3F3E200F3F3E200F3F3E200F3F3
      E200F3F3E200F9F9E9003A3A1800000000000000000000000000000000000000
      000000000000C3C3C300ABABAB00A0A0A000ABABAB00C3C3C300000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEEA008080AF004C4C8F00363681004C4C8F008080AF00DEDEEA000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000000000000000
      000000000000000000000000000000000000000000004D4D2900F4F4E400FFCC
      4400FECB4300ECD28600D8D8C700D6D6C500D4D4C300D3D3C200D1D1C000CFCF
      BE00CDCDBC00F4F4E4004D4D2900000000000000000000000000000000000000
      0000A9A9A900A4A4A400A7A7A700A8A8A800A7A7A700A4A4A400A9A9A9000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      DB003F3F9B002020AF001515CA001111D4001515CA002020AF003F3F9B00BDBD
      DB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000055553000F5F5E600FFCC
      4400FFEE8800ECD28600F5F5EE00D6D6C500F5F5EE00F5F5EE00D1D1C000F5F5
      EE00CDCDBC00F5F5E6005555300000000000000000000000000000000000ABAB
      AB00A9A9A900A7A7A700A6A6A600A6A6A600A6A6A600A6A6A600A5A5A500ABAB
      AB00000000000000000000000000000000000000000000000000DEDEEE004040
      A5001F1FC1001111CC001010CB001010CB001010CB001010CB001919BE003F3F
      A400DEDEEE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005A5A3400F6F6E900FFCC
      4400FECB4300ECD28600D8D8C700DCDCCC00D4D4C300D3D3C200D8D8C800CFCF
      BE00CDCDBC00F6F6E9005A5A3400000000000000000000000000C8C8C800ACAC
      AC00A5A5A500A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3A300A3A3
      A300C8C8C80000000000000000000000000000000000000000008080C3002E2E
      B6001313C0001010BE001010BE001010BE001010BE001010BE001010BE002121
      AE008080C3000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000000000000000000000000000000000000000000063633C00F8F8EE00C461
      3F00C05D3B00B6533100AC472500AB442200AA432100B1452300BD4B2900CC53
      3100E8634100F8F8EE0063633C00000000000000000000000000B2B2B200B7B7
      B700A2A2A200A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A1A1A100A3A3
      A300B2B2B20000000000000000000000000000000000000000004C4CB0003939
      C3001313B1001010B0001010B0001010B0001010B0001010B0001010B0001A1A
      B1004C4CB0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000067674000F9F9F100C461
      3F00F8C57A00EDB57900F5CCBC00E0B79F00F5CCBC00F5CCBC00DDB49C00F5CC
      BC00E8634100F9F9F10067674000000000000000000000000000A9A9A900C1C1
      C100B0B0B000A5A5A5009F9F9F009E9E9E009E9E9E009E9E9E009E9E9E00A4A4
      A400A9A9A90000000000000000000000000000000000000000003636AB004848
      CF002D2DB7001C1CAC001111A4001010A3001010A3001010A3001010A3001B1B
      AC003636AB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000006B6B4400FBFBF400C461
      3F00C05D3B00B6533100AC472500AB442200AA432100B1452300BD4B2900CC53
      3100E8634100FBFBF4006B6B4400000000000000000000000000B4B4B400C4C4
      C400B5B5B500B5B5B500B2B2B200ABABAB00A3A3A3009F9F9F009C9C9C00AAAA
      AA00B4B4B40000000000000000000000000000000000000000004C4CB7004E4E
      D4003636BE003636BE003030B9002626AF001B1BA50015159F0011119B002828
      AF004C4CB7000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000000000000000
      000000000000000000000000000000000000000000006F6F4700FCFCF700FFCC
      4400FFEE8800ECD28600FCFCFA00D6D6C500FCFCFA00FCFCFA00D1D1C000FCFC
      FA00CDCDBC00FCFCF7006F6F4700000000000000000000000000CACACA00BFBF
      BF00C2C2C200BFBFBF00BFBFBF00BFBFBF00BFBFBF00BFBFBF00C1C1C100BABA
      BA00CACACA0000000000000000000000000000000000000000008080CE004C4C
      D0004949D1004444CC004444CC004444CC004444CC004444CC004747CF004444
      C8008080CE000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000073734B00FDFDF900FFCC
      4400FECB4300F5CE6400E9D08300E7CE8100E5CC8000E4CB7E00E2C97C00E0C7
      7A00DEC57800FDFDF90073734B0000000000000000000000000000000000B4B4
      B400CDCDCD00CDCDCD00CBCBCB00CBCBCB00CBCBCB00CDCDCD00CACACA00B3B3
      B300000000000000000000000000000000000000000000000000DEDEF2004545
      BE005C5CE3005959E1005555DD005555DD005555DD005858E0005757DE004444
      BD00DEDEF2000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000077774E00FEFEFC00FFCC
      4400FFEE8800FDCA4200FBEA8400F8C53D00F6E57F00F4E37D00F3C03800F1E0
      7A00EFBC3400FEFEFC0077774E00000000000000000000000000000000000000
      0000B4B4B400C4C4C400D4D4D400D9D9D900D4D4D400C4C4C400B4B4B4000000
      000000000000000000000000000000000000000000000000000000000000BDBD
      E7004545C0005050D8006363EC006A6AF2006363EB004F4FD7004545C000BDBD
      E700000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      000000000000000000000000000000000000000000007A7A5100FFFFFE00FFCC
      4400FECB4300FDCA4200FAC73F00F8C53D00F6C33C00F5C23A00F3C03800F1BE
      3600EFBC3400FFFFFE007A7A5100000000000000000000000000000000000000
      000000000000CBCBCB00B6B6B600ADADAD00B6B6B600CBCBCB00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000DEDEF3008080D4004C4CC2003636BB004C4CC2008080D400DEDEF3000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007D7D5300FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF007D7D5300000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F55007F7F55007F7F
      55007F7F55007F7F55007F7F55007F7F55007F7F55007F7F55007F7F55007F7F
      55007F7F55007F7F55007F7F5500000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000031587E001948
      7300295C860034719B00327FAA002682B1001946700019467000194670001946
      7100194671003A61860000000000000000000000000000000000AEAEAE009D9D
      9D00ADADAD00BABABA00C0C0C000BEBEBE009B9B9B009B9B9B009B9B9B009B9B
      9B009B9B9B00B6B6B60000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000089520E000000
      000000000000000000000000000000000000000000000000000010436C00A9ED
      FF00A4E7FC009CDFF80094D6F4008BCFF00066BCDE0066C2E40066CAEC0066D2
      F40066DAFC0010436C00000000000000000000000000000000009F9F9F00F2F2
      F200EFEFEF00ECECEC00E7E7E700E4E4E400D9D9D900DCDCDC00E0E0E000E4E4
      E400E7E7E7009F9F9F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844E0D009A641C00915E
      1A009A7F5D00000000000000000000000000000000000000000023638D005599
      B900579BBD005B9FC1005DA0C200599DBF00448CAE00448FB1004494B900449A
      C20049A7CD0021618C0000000000000000000000000000000000B4B4B400C6C6
      C600C8C8C800CACACA00CACACA00C9C9C900BFBFBF00C0C0C000C4C4C400C7C7
      C700CECECE00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000800000000000000085500E00BEA57000B2813400B281
      3400A06D2700814E1000000000000000000000000000000000002A7EAE00A5E9
      FF009CDFFA0094D7F4008CCEEE0083C7E8005EB4D7005EBADE005EC2E8005ECA
      F20062D6FB00277BAA0000000000000000000000000000000000B5B5B500F1F1
      F100ECECEC00E8E8E800E4E4E400E0E0E000D5D5D500D8D8D800DCDCDC00E0E0
      E000E6E6E600B4B4B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844E0D00AC783200C19C
      6400AC783200956220009A7F5D000000000000000000000000002890C4005599
      B900579BBD005B9FC1005DA0C200599DBF00448CAE00448FB1004494B900449A
      C20049A7CD00238BBF0000000000000000000000000000000000B5B5B500C6C6
      C600C8C8C800CACACA00CACACA00C9C9C900BFBFBF00C0C0C000C4C4C400C7C7
      C700CECECE00B4B4B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000875211000000
      000000000000C5AE7E00875211000000000000000000000000002793C800A5E9
      FF009CDFFA0094D7F4008CCEEE0083C7E8005EB4D7005EBADE005EC2E8005ECA
      F20062D6FB00228EC30000000000000000000000000000000000B4B4B400F1F1
      F100ECECEC00E8E8E800E4E4E400E0E0E000D5D5D500D8D8D800DCDCDC00E0E0
      E000E6E6E600B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000000000000000000000000
      00000000000000000000875211000000000000000000000000002793C8005599
      B900579BBD005B9FC1005DA0C200599DBF00448CAE00448FB1004494B900449A
      C20049A7CD00228EC30000000000000000000000000000000000B4B4B400C6C6
      C600C8C8C800CACACA00CACACA00C9C9C900BFBFBF00C0C0C000C4C4C400C7C7
      C700CECECE00B3B3B30000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000089520E000000
      00000000000000000000000000000000000000000000000000002793C800A5E9
      FF009CDFFA0094D7F4008CCEEE0083C7E8005EB4D7005EBADE005EC2E8005ECA
      F20062D6FB00228EC30000000000000000000000000000000000B5B5B500F1F1
      F100ECECEC00E8E8E800E4E4E400E0E0E000D5D5D500D8D8D800DCDCDC00E0E0
      E000E6E6E600B4B4B40000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844E0D009A641C00915E
      1A009A7F5D00000000000000000000000000000000000000000049A4D000238D
      C200085E8900157DB10003679900076D9E00005783000367990001649600085E
      89001681B600459FCC0000000000000000000000000000000000C8C8C800A9A9
      A900A9A9A900BDBDBD00ADADAD00B1B1B100A3A3A300ADADAD00AAAAAA00A9A9
      A900A9A9A900BFBFBF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      00008000000080000000800000000000000085500E00BEA57000B2813400B281
      3400A06D2700814E100000000000000000000000000000000000000000000000
      00000D68950076BADB000164940000000000000000000164940078BCDD000D68
      9500000000000000000000000000000000000000000000000000000000000000
      0000B0B0B000D9D9D900AAAAAA000000000000000000AAAAAA00DADADA00B0B0
      B000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000844E0D00AC783200C19C
      6400AC783200956220009A7F5D00000000000000000000000000000000000000
      00001A77A60084C9E6000665940000000000000000000665940084C9E6001A77
      A600000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00E0E0E000AAAAAA000000000000000000AAAAAA00E0E0E000BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000875211000000
      000000000000C5AE7E0087521100000000000000000000000000000000000000
      0000378FBC007CC8E700388AB2001F6E96001F6E9600388AB2007CC8E700378F
      BC00000000000000000000000000000000000000000000000000000000000000
      0000BBBBBB00DFDFDF00BEBEBE00B8B8B800B8B8B800BEBEBE00DFDFDF00BBBB
      BB00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000080000000800000008000000000000000000000000000
      0000000000000000000087521100000000000000000000000000000000000000
      00007CB9D8002F95C7007ECDEB006AB5D1006AB5D1007ECDEB002F95C7007CB9
      D800000000000000000000000000000000000000000000000000000000000000
      000000000000BBBBBB00E2E2E200D5D5D500D5D5D500E2E2E200BBBBBB000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007EBEDD00409ECE002993C8002993C800409ECE007EBEDD000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000BEBEBE00BBBBBB00BBBBBB00BEBEBE00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000400000000100010000000000000200000000000000000000
      000000000000000000000000FFFFFF00FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF0000000000008003000000000000C007000000000000
      E00F000000000000F01F000000000000F83F000000000000FC7F000000000000
      FEFF000000000000FFFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFF01FFFFFF81FFFFFE00FC03FFFFFC003C007FFFFF81FFFFFC007
      C003FFFFC003C007FFFFF81FFFFFC007C003FFFFC003C007FFFFF81FFFFFC007
      F803FFFFC003C007FFFFF81FFFFFE00FFFFFFFFFFFFFF01FFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF8001FFFFFFFF
      FFFF8001F83FF01F803F8001F01FE00FFFFF8001E00FC007FFFF8001C007C007
      800F8001C007C007FFFF8001C007C007FFFF8001C007C007803F8001C007C007
      FFFF8001E00FC007FFFF8001F01FE00F800F8001F83FF01FFFFF8001FFFFFFFF
      FFFF8001FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC003C003FFFFFFDF
      C003C003C7C3FF87C003C003EFE78103C003C003EFE7FF81C003C003F00FFFD9
      C003C003F7CF807DC003C003F79FFFDFC003C003FB9FFF87C003C003FB3F8103
      F18FF18FF93FFF81F18FF18FFC7FFFD9F00FF00FFC7F807DF00FF81FFEFFFFFF
      F81FFC3FFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      000000000000}
  end
  object PopupFind: TSpTBXPopupMenu
    OnPopup = PopupFindPopup
    Left = 368
    Top = 332
    object TBXItemTreeFindNav: TSpTBXItem
      Caption = 'Navigate'
      OnClick = TBXItemTreeFindNavClick
    end
    object TBXItemTreeFindPreview: TSpTBXItem
      Caption = 'Preview'
      OnClick = TBXItemTreeFindPreviewClick
    end
    object TBXSeparatorItem69: TSpTBXSeparatorItem
    end
    object TBXItemTreeFindExpand: TSpTBXItem
      Caption = 'Expand all'
      OnClick = TBXItemTreeFindExpandClick
    end
    object TBXItemTreeFindExpandCur: TSpTBXItem
      Caption = 'Expand current node'
      OnClick = TBXItemTreeFindExpandCurClick
    end
    object TBXItemTreeFindCollapse: TSpTBXItem
      Caption = 'Collapse all'
      OnClick = TBXItemTreeFindCollapseClick
    end
    object TBXSeparatorItem36: TSpTBXSeparatorItem
    end
    object TBXItemTreeFindCopyToClipNode: TSpTBXItem
      Caption = 'Copy selected node'
      OnClick = TBXItemTreeFindCopyToClipNodeClick
    end
    object TBXItemTreeFindCopyToClip: TSpTBXItem
      Caption = 'Copy selected search'
      OnClick = TBXItemTreeFindCopyToClipClick
    end
    object TBXItemTreeFindCopyToTab: TSpTBXItem
      Caption = 'Copy selected search to tab'
      OnClick = TBXItemTreeFindCopyToTabClick
    end
    object TBXSeparatorItem37: TSpTBXSeparatorItem
    end
    object TBXItemTreeFindClear: TSpTBXItem
      Caption = 'Clear'
      OnClick = TBXItemTreeFindClearClick
    end
    object TBXSeparatorItem65: TSpTBXSeparatorItem
    end
    object TBXItemTreeFindFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemTreeFindFindClick
    end
  end
  object PopupZoom: TSpTBXPopupMenu
    Left = 344
    Top = 332
    object TBXItemZSet25: TSpTBXItem
      Tag = 25
      Caption = '25%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet50: TSpTBXItem
      Tag = 50
      Caption = '50%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet75: TSpTBXItem
      Tag = 75
      Caption = '75%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet100: TSpTBXItem
      Tag = 100
      Caption = '100%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet150: TSpTBXItem
      Tag = 150
      Caption = '150%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet200: TSpTBXItem
      Tag = 200
      Caption = '200%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZSet300: TSpTBXItem
      Tag = 300
      Caption = '300%'
      OnClick = TBXItemZSet25Click
    end
    object TBXItemZOther: TSpTBXItem
      Caption = 'Custom zoom...'
      OnClick = TBXItemZOtherClick
    end
  end
  object PopupClip: TSpTBXPopupMenu
    OnPopup = PopupClipPopup
    Left = 320
    Top = 332
    object TBXItemClipCopyToEd: TSpTBXItem
      Caption = 'Copy to editor'
      OnClick = TBXItemClipCopyToEdClick
    end
    object TBXItemClipCopyToClip: TSpTBXItem
      Caption = 'Copy to clipboard'
      OnClick = TBXItemClipCopyToClipClick
    end
    object TBXSeparatorItem72: TSpTBXSeparatorItem
    end
    object TBXItemClipClr: TSpTBXItem
      Caption = 'Clear'
      OnClick = TBXItemClipClrClick
    end
    object TBXSeparatorItem64: TSpTBXSeparatorItem
    end
    object TBXItemClipFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemClipFindClick
    end
  end
  object TimerBrackets: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerBracketsTimer
    Left = 416
    Top = 360
  end
  object ecMacroRec: TecMacroRecorder
    Left = 545
    Top = 262
  end
  object PropsManagerKeys: TPropsManager
    Template = TemplateEditor
    IniSection = 'Template'
    UseRegistry = False
    Properties.Strings = (
      'SyntKeyMapping.AsString'
      '')
    Left = 392
    Top = 276
  end
  object PopupValidate: TSpTBXPopupMenu
    OnPopup = PopupValidatePopup
    Left = 392
    Top = 332
    object TBXItemValNav: TSpTBXItem
      Caption = 'Navigate'
      OnClick = TBXItemValNavClick
    end
    object TBXSeparatorItem56: TSpTBXSeparatorItem
    end
    object TBXItemValCopySel: TSpTBXItem
      Caption = 'Copy selected'
      OnClick = TBXItemValCopySelClick
    end
    object TBXItemValCopyAll: TSpTBXItem
      Caption = 'Copy all'
      OnClick = TBXItemValCopyAllClick
    end
    object TBXSeparatorItem57: TSpTBXSeparatorItem
    end
    object TBXItemValClear: TSpTBXItem
      Caption = 'Clear'
      OnClick = TBXItemValClearClick
    end
    object TBXSeparatorItem66: TSpTBXSeparatorItem
    end
    object TBXItemValFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemValFindClick
    end
  end
  object PopupTree: TSpTBXPopupMenu
    OnPopup = PopupTreePopup
    Left = 417
    Top = 330
    object TBXItemTreeExpand: TSpTBXItem
      Caption = 'Expand'
      OnClick = TBXItemTreeExpandClick
    end
    object TBXItemTreeExpandAll: TSpTBXItem
      Caption = 'Expand all'
      OnClick = TBXItemTreeExpandAllClick
    end
    object TBXItemTreeCollapse: TSpTBXItem
      Caption = 'Collapse'
      OnClick = TBXItemTreeCollapseClick
    end
    object TBXItemTreeCollapseAll: TSpTBXItem
      Caption = 'Collapse all'
      OnClick = TBXItemTreeCollapseAllClick
    end
    object TBXSubmenuTreeLevel: TSpTBXSubmenuItem
      Caption = 'Collapse level'
      object TBXItemTreeLevel2: TSpTBXItem
        Caption = '2'
        OnClick = TBXItemTreeLevel2Click
      end
      object TBXItemTreeLevel3: TSpTBXItem
        Caption = '3'
        OnClick = TBXItemTreeLevel3Click
      end
      object TBXItemTreeLevel4: TSpTBXItem
        Caption = '4'
        OnClick = TBXItemTreeLevel4Click
      end
      object TBXItemTreeLevel5: TSpTBXItem
        Caption = '5'
        OnClick = TBXItemTreeLevel5Click
      end
      object TBXItemTreeLevel6: TSpTBXItem
        Caption = '6'
        OnClick = TBXItemTreeLevel6Click
      end
      object TBXItemTreeLevel7: TSpTBXItem
        Caption = '7'
        OnClick = TBXItemTreeLevel7Click
      end
      object TBXItemTreeLevel8: TSpTBXItem
        Caption = '8'
        OnClick = TBXItemTreeLevel8Click
      end
      object TBXItemTreeLevel9: TSpTBXItem
        Caption = '9'
        OnClick = TBXItemTreeLevel9Click
      end
    end
    object TBXSeparatorItem96: TSpTBXSeparatorItem
    end
    object TBXItemTreeFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemTreeFindClick
    end
    object TbxItemTreeSorted: TSpTBXItem
      Caption = 'Sorted'
      OnClick = TbxItemTreeSortedClick
    end
  end
  object TimerAutoSave: TTimer
    Enabled = False
    Interval = 10000
    OnTimer = TimerAutoSaveTimer
    Left = 441
    Top = 362
  end
  object ImageListColorRecent: TImageList
    Height = 14
    Width = 40
    Left = 385
    Top = 194
    Bitmap = {
      494C010101000400040028000E00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000A00000000E00000001002000000000000023
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080E0E00080E0E00080E0
      E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0E00080E0
      E00080E0E0008080000080800000808000008080000080800000808000008080
      0000808000008080000080800000808000008080000080800000F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CAA600F0CA
      A600F0CAA600F0CAA600F0CAA600000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000A00000000E0000000100010000000000180100000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000}
  end
  object PopupClips: TSpTBXPopupMenu
    OnPopup = PopupClipsPopup
    Left = 448
    Top = 304
    object TBXItemClipsAddText: TSpTBXItem
      Caption = 'Add clip...'
      OnClick = TBXItemClipsAddTextClick
    end
    object TBXItemClipsDelText: TSpTBXItem
      Caption = 'Delete clip'
      OnClick = TBXItemClipsDelTextClick
    end
    object TBXSeparatorItem90: TSpTBXSeparatorItem
    end
    object TBXItemClipsEdit: TSpTBXItem
      Caption = 'Edit this file'
      OnClick = TBXItemClipsEditClick
    end
    object TBXItemClipsAddFile: TSpTBXItem
      Caption = 'Add new file...'
      OnClick = TBXItemClipsAddFileClick
    end
    object TBXSeparatorItem76: TSpTBXSeparatorItem
    end
    object TBXItemClipsDir: TSpTBXItem
      Caption = 'Browse folder'
      OnClick = TBXItemClipsDirClick
    end
  end
  object OD_Swatch: TOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 585
    Top = 358
  end
  object SD_Swatch: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 609
    Top = 358
  end
  object ImageListFtp: TImageList
    Height = 10
    Width = 10
    Left = 409
    Top = 194
    Bitmap = {
      494C01010100040004000A000A00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000280000000A00000001002000000000004006
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C040
      4000C0404000C040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0404000C040
      4000C0404000C0404000C0404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0404000C040
      4000C0404000C0404000C0404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000C0404000C040
      4000C0404000C0404000C0404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C040
      4000C0404000C040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000280000000A0000000100010000000000500000000000000000000000
      000000000000000000000000FFFFFF00FFC0000000000000FFC0000000000000
      E3C0000000000000C1C0000000000000C1C0000000000000C1C0000000000000
      E3C0000000000000FFC0000000000000FFC0000000000000FFC0000000000000
      00000000000000000000000000000000000000000000}
  end
  object PopupPluginsLog: TSpTBXPopupMenu
    OnPopup = PopupPluginsLogPopup
    Left = 440
    Top = 332
    object TBXItemPLogCopySel: TSpTBXItem
      Caption = 'Copy selected'
      OnClick = TBXItemPLogCopySelClick
    end
    object TBXItemPLogCopyAll: TSpTBXItem
      Caption = 'Copy all'
      OnClick = TBXItemPLogCopyAllClick
    end
    object TBXSeparatorItem81: TSpTBXSeparatorItem
    end
    object TBXItemPLogDelete: TSpTBXItem
      Caption = 'Delete selected'
      OnClick = TBXItemPLogDeleteClick
    end
    object TBXItemPLogClear: TSpTBXItem
      Caption = 'Clear'
      OnClick = TBXItemPLogClearClick
    end
    object TBXSeparatorItem82: TSpTBXSeparatorItem
    end
    object TBXItemPLogFind: TSpTBXItem
      Caption = 'Find...'
      OnClick = TBXItemPLogFindClick
    end
    object TBXItemPLogSaveAs: TSpTBXItem
      Caption = 'Save as...'
      OnClick = TBXItemPLogSaveAsClick
    end
  end
  object PluginACP: TAutoCompletePopup
    ShowWhenNone = True
    Images = ImgListTree
    Delay = 200
    Styles = SyntStyles
    FixedItemHeight = True
    ColumnSpace = 4
    Options = [aoFormatted]
    OnAfterComplete = PluginACPAfterComplete
    OnDefineStartPos = PluginAcpDefineStartPos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    DropDownCount = 10
    IntegralHeight = True
    ItemHeight = 15
    AutoSelect = False
    BgColor = clWindow
    CommandID = 650
    Width = 400
    Height = 200
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 150
    ToolHint.Height = 0
    ToolHint.Active = True
    ToolHint.Styles = SyntStyles
    ToolHint.Formatted = True
    ToolHint.Font.Charset = DEFAULT_CHARSET
    ToolHint.Font.Color = clWindowText
    ToolHint.Font.Height = -11
    ToolHint.Font.Name = 'Tahoma'
    ToolHint.Font.Style = []
    Controls = <>
    OnShow = PluginACPShow
    Left = 456
    Top = 232
  end
  object PropsManagerPrint: TPropsManager
    Template = TemplateEditor
    IniSection = 'Template'
    UseRegistry = False
    Properties.Strings = (
      'ecSyntPrinter.ColorMode'
      'ecSyntPrinter.Copies'
      'ecSyntPrinter.Footer'
      'ecSyntPrinter.Header'
      'ecSyntPrinter.MarginLeft'
      'ecSyntPrinter.MarginTop'
      'ecSyntPrinter.MarginRight'
      'ecSyntPrinter.MarginBottom'
      'ecSyntPrinter.Options'
      'ecSyntPrinter.Orientation'
      'ecSyntPrinter.LineNumbersPos'
      'ecSyntPrinter.PrintSelection'
      'ecSyntPrinter.Units'
      '')
    Left = 416
    Top = 276
  end
  object TimerTree: TTimer
    Enabled = False
    OnTimer = TimerTreeTimer
    Left = 465
    Top = 362
  end
  object PopupUserTB1: TSpTBXPopupMenu
    Left = 393
    Top = 386
    object TBXItemUserTb1: TSpTBXItem
      Caption = 'Customize toolbar...'
      OnClick = TBXItemOToolbar1Click
    end
  end
  object PopupUserTB2: TSpTBXPopupMenu
    Left = 417
    Top = 386
    object TBXItemUserTB2: TSpTBXItem
      Caption = 'Customize toolbar...'
      OnClick = TBXItemOToolbar2Click
    end
  end
  object PopupUserTB3: TSpTBXPopupMenu
    Left = 441
    Top = 386
    object TBXItemUserTB3: TSpTBXItem
      Caption = 'Customize toolbar...'
      OnClick = TBXItemOToolbar3Click
    end
  end
  object ImageListUser1: TPngImageList
    AllocBy = 40
    PngImages = <>
    Left = 358
    Top = 98
  end
  object ImageListUser2: TPngImageList
    AllocBy = 40
    PngImages = <>
    Left = 382
    Top = 98
  end
  object ImageListUser3: TPngImageList
    AllocBy = 40
    PngImages = <>
    Left = 406
    Top = 98
  end
  object PopupFoldLevel: TSpTBXPopupMenu
    Left = 470
    Top = 304
    object TBXItemUnfoldAll: TSpTBXItem
      Caption = 'Expand all'
      OnClick = TBXItemUnfoldAllClick
    end
    object TBXItemFoldAll: TSpTBXItem
      Caption = 'Collapse all'
      OnClick = TBXItemFoldAllClick
    end
    object TBXSeparatorItem87: TSpTBXSeparatorItem
    end
    object TBXItemUnfoldLine: TSpTBXItem
      Caption = 'Expand current block'
      OnClick = TBXItemUnfoldLineClick
    end
    object TBXItemFoldNearestBlock: TSpTBXItem
      Caption = 'Collapse/expand nearest block'
      OnClick = TBXItemFoldNearestBlockClick
    end
    object TBXItemFoldSelBlock: TSpTBXItem
      Caption = 'Collapse selection'
      OnClick = TBXItemFoldSelBlockClick
    end
    object TBXSeparatorItem89: TSpTBXSeparatorItem
    end
    object TBXItemFoldRangesInSel: TSpTBXItem
      Caption = 'Collapse ranges in selection'
      OnClick = TBXItemFoldRangesInSelClick
    end
    object TBXItemUnfoldRangesInSel: TSpTBXItem
      Caption = 'Expand ranges in selection'
      OnClick = TBXItemUnfoldRangesInSelClick
    end
    object TBXSeparatorItem88: TSpTBXSeparatorItem
    end
    object TBXItemFoldParent: TSpTBXItem
      Caption = 'Collapse parent block'
      Visible = False
      OnClick = TBXItemFoldParentClick
    end
    object TBXItemFoldWithNested: TSpTBXItem
      Caption = 'Collapse/expand current and nested blocks'
      Visible = False
      OnClick = TBXItemFoldWithNestedClick
    end
    object SpTBXSeparatorItem23: TSpTBXSeparatorItem
    end
    object TBXSubmenuFoldLevel: TSpTBXSubmenuItem
      Caption = 'Fold level'
      object TBXItemFoldLevel2: TSpTBXItem
        Caption = '2'
        OnClick = TBXItemFoldLevel2Click
      end
      object TBXItemFoldLevel3: TSpTBXItem
        Caption = '3'
        OnClick = TBXItemFoldLevel3Click
      end
      object TBXItemFoldLevel4: TSpTBXItem
        Caption = '4'
        OnClick = TBXItemFoldLevel4Click
      end
      object TBXItemFoldLevel5: TSpTBXItem
        Caption = '5'
        OnClick = TBXItemFoldLevel5Click
      end
      object TBXItemFoldLevel6: TSpTBXItem
        Caption = '6'
        OnClick = TBXItemFoldLevel6Click
      end
      object TBXItemFoldLevel7: TSpTBXItem
        Caption = '7'
        OnClick = TBXItemFoldLevel7Click
      end
      object TBXItemFoldLevel8: TSpTBXItem
        Caption = '8'
        OnClick = TBXItemFoldLevel8Click
      end
      object TBXItemFoldLevel9: TSpTBXItem
        Caption = '9'
        OnClick = TBXItemFoldLevel9Click
      end
    end
  end
  object TimerMinimap: TTimer
    Enabled = False
    OnTimer = TimerMinimapTimer
    Left = 489
    Top = 362
  end
  object PythonGUIInputOutput1: TPythonGUIInputOutput
    OnSendUniData = PythonGUIInputOutput1SendUniData
    OnReceiveUniData = PythonGUIInputOutput1ReceiveUniData
    UnicodeIO = True
    RawOutput = False
    Output = MemoConsole
    Left = 487
    Top = 200
  end
  object PythonEngine1: TPythonEngine
    DllName = 'python32.dll'
    APIVersion = 1013
    RegVersion = '3.2'
    FatalAbort = False
    FatalMsgDlg = False
    UseLastKnownVersion = False
    OnBeforeLoad = PythonEngine1BeforeLoad
    IO = PythonGUIInputOutput1
    PyFlags = [pfUnicode, pfIgnoreEnvironmentFlag]
    OnAfterInit = PythonEngine1AfterInit
    Left = 463
    Top = 200
  end
  object PythonModule: TPythonModule
    Engine = PythonEngine1
    OnInitialization = PythonModuleInitialization
    ModuleName = 'sw_api'
    Errors = <>
    Left = 511
    Top = 200
  end
  object SD_Snippets: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 609
    Top = 382
  end
  object ColorDialogTabs: TColorDialog
    Options = [cdFullOpen]
    Left = 639
    Top = 308
  end
  object PopupPanelTitle: TSpTBXPopupMenu
    OnPopup = PopupPanelTitlePopup
    Left = 465
    Top = 386
    object TbxItemPanelTitleBar: TSpTBXItem
      Caption = 'Show title bar (docked)'
      OnClick = TbxItemPanelTitleBarClick
    end
    object SpTBXSeparatorItem28: TSpTBXSeparatorItem
    end
    object TbxItemPanelTitleShowLeft: TSpTBXItem
      Caption = 'Show structure/project panel'
      Action = ecShowTree
    end
    object TbxItemPanelTitleShowOut: TSpTBXItem
      Caption = 'Show output panel'
      Action = ecShowOut
    end
    object TbxItemPanelTitleShowRight: TSpTBXItem
      Caption = 'Show clipboard/minimap panel'
      Action = ecShowClip
    end
  end
  object PopupPreviewEditor: TSpTBXPopupMenu
    OnPopup = PopupPreviewEditorPopup
    Left = 487
    Top = 389
    object TbxItemPreCopy: TSpTBXItem
      OnClick = TbxItemPreCopyClick
    end
    object TbxItemPreSelect: TSpTBXItem
      OnClick = TbxItemPreSelectClick
    end
    object SpTBXSeparatorItem30: TSpTBXSeparatorItem
    end
    object TbxItemPreZoom25: TSpTBXItem
      RadioItem = True
      OnClick = TbxItemPreZoom25Click
    end
    object TbxItemPreZoom50: TSpTBXItem
      RadioItem = True
      OnClick = TbxItemPreZoom50Click
    end
    object TbxItemPreZoom75: TSpTBXItem
      RadioItem = True
      OnClick = TbxItemPreZoom75Click
    end
    object TbxItemPreZoom100: TSpTBXItem
      RadioItem = True
      OnClick = TbxItemPreZoom100Click
    end
    object TbxItemPreZoomOther: TSpTBXItem
      RadioItem = True
      OnClick = TbxItemPreZoomOtherClick
    end
    object SpTBXSeparatorItem31: TSpTBXSeparatorItem
    end
    object TbxItemPreEdit: TSpTBXItem
      OnClick = TbxItemPreEditClick
    end
  end
  object ImageListIcons: TPngImageList
    AllocBy = 40
    Height = 8
    Width = 8
    PngImages = <>
    Left = 438
    Top = 98
  end
end
