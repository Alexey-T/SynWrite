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
    Height = 64
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
          OnSelect = ButtonOnSelect
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
          OnSelect = ButtonOnSelect
        end
        object TBXItemPageS: TSpTBXItem
          Caption = 'Page setup...'
          Action = ecPageSetupActionNew
          OnSelect = ButtonOnSelect
        end
        object TBXItemPrintS: TSpTBXItem
          Caption = 'Printer setup...'
          OnClick = ecPrinterSetupExecute
          OnSelect = ButtonOnSelect
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
        object TBXItemFNext: TSpTBXItem
          Caption = 'Find next'
          OnClick = TBXItemFNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemFPrev: TSpTBXItem
          Caption = 'Find previous'
          OnClick = TBXItemFPrevClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem9: TSpTBXSeparatorItem
        end
        object TBXItemWNext: TSpTBXItem
          Caption = 'Find current word next'
          OnClick = TBXItemWNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemWPrior: TSpTBXItem
          Caption = 'Find current word prior'
          OnClick = TBXItemWPriorClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem11: TSpTBXSeparatorItem
        end
        object TBXItem2: TSpTBXItem
          Caption = 'Clear search marks'
          OnClick = TBXItem2Click
          OnSelect = ButtonOnSelect
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
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOLexSt: TSpTBXItem
          Caption = 'Customize lexer styles...'
          Action = acSetupLexerStyles
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOLexLib: TSpTBXItem
          Caption = 'Customize lexer library...'
          Action = acSetupLexerLib
          OnSelect = ButtonOnSelect
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
      Left = 345
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
          Hint = 'Dialog "Sort lines"'
          OnClick = TBXItemTbSortDialogClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem86: TSpTBXSeparatorItem
        end
        object TBXItemTbSortAsc: TSpTBXItem
          Tag = 562
          Caption = 'Sort ascending'
          Hint = 'Sort selection ascending'
          OnClick = TBXItemTbSortAscClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemTbSortDesc: TSpTBXItem
          Tag = 563
          Caption = 'Sort descending'
          Hint = 'Sort selection descending'
          OnClick = TBXItemTbSortDescClick
          OnSelect = ButtonOnSelect
        end
        object TBXSeparatorItem85: TSpTBXSeparatorItem
        end
        object TBXItemTbDedupAll: TSpTBXItem
          Caption = 'Remove all duplicates'
          OnClick = TBXItemTbDedupAllClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemTbDedupAdjacent: TSpTBXItem
          Caption = 'Remove adjacent duplicates'
          OnClick = TBXItemTbDedupAdjacentClick
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSubmenuCase: TSpTBXSubmenuItem
        Caption = 'Change case'
        Hint = 'Selection case changing'
        ImageIndex = 16
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        object TBXItemCCUpper: TSpTBXItem
          Tag = 365
          Caption = 'UPPER CASE'
          Hint = 'Selection - to upper case'
          OnClick = TBXItemCCUpperClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemCCLower: TSpTBXItem
          Tag = 366
          Caption = 'lower case'
          Hint = 'Selection - to lower case'
          OnClick = TBXItemCCLowerClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemCCTitle: TSpTBXItem
          Tag = 368
          Caption = 'Title Case'
          Hint = 'Selection - to title case'
          OnClick = TBXItemCCTitleClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemCCSent: TSpTBXItem
          Tag = 369
          Caption = 'Sentence case'
          Hint = 'Selection - to sentence case'
          OnClick = TBXItemCCSentClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemCCInv: TSpTBXItem
          Tag = 365
          Caption = 'iNVERT cASE'
          Hint = 'Invert selection case'
          OnClick = TBXItemCCInvClick
          OnSelect = ButtonOnSelect
        end
      end
    end
    object tbUser1: TSpTBXToolbar
      Left = 649
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
      Left = 682
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
      Left = 715
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
      Top = 32
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
        Top = 3
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
    Top = 89
    Width = 250
    Height = 343
    object plTree: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 250
      Height = 343
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
    Top = 89
    Width = 179
    Height = 343
    Position = dpxRight
    object plClip: TSpTBXDockablePanel
      Left = 0
      Top = 0
      Width = 179
      Height = 343
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
            Caption = 'New file'
            Hint = 'Create new file'
            OnClick = TBXItemFNewClick
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
          Hint = 'Reopen file'
          OnClick = TBXItemFReopenClick
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
          Hint = 'Save current file as'
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
          Caption = 'Rename...'
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
          object TBXItemECaseSent: TSpTBXItem
            Tag = 369
            Caption = 'Sentence case'
            Hint = 'Selection - to sentence case'
            OnClick = TBXItemECaseSentClick
            OnSelect = ButtonOnSelect
          end
          object TBXItemECaseInvert: TSpTBXItem
            Tag = 365
            Caption = '&iNVERT cASE'
            Hint = 'Invert selection case'
            OnClick = TBXItemECaseInvertClick
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
          OnClick = TBXItemFNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSPrev: TSpTBXItem
          Caption = 'Find &previous'
          Hint = 'Find previous occurance of search string'
          OnClick = TBXItemFPrevClick
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
          OnClick = TBXItemWNextClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemSWordPrior: TSpTBXItem
          Caption = 'Find current w&ord prior'
          Hint = 'Find previous occurance of word at caret'
          OnClick = TBXItemWPriorClick
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
          OnClick = TBXItem2Click
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
    Left = 301
    Top = 89
    Width = 398
    Height = 343
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
    Top = 89
    Width = 46
    Height = 343
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
    Top = 89
    Width = 9
    Height = 343
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
    Top = 89
    Height = 343
    Cursor = crSizeWE
    MinSize = 50
    ResizeStyle = rsPattern
  end
  object SplitterRight: TSpTBXSplitter
    Left = 708
    Top = 89
    Height = 343
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
      Hint = 'Create new file'
      OnExecute = acNewTabExecute
    end
    object acNewWindow: TAction
      Category = 'File'
      Caption = 'New window'
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
      Hint = 'Reopen file'
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
      Hint = 'Save current file as'
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
                ShortCut = 24666
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16473
              end>
          end>
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
        Command = 369
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
        DisplayName = 'Show commands list'
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
      0600666D4D61696E0001080400000A00544258446F636B546F70000006007462
      46696C650101000000B5020000070043617074696F6E000E005442584974656D
      546F6F6C4E65770102000000B6020000070043617074696F6EB7020000040048
      696E740016005442585375626D656E754974656D546F6F6C4F70656E01020000
      00B8020000070043617074696F6EB9020000040048696E740016005442585375
      626D656E754974656D546F6F6C536176650102000000BC020000070043617074
      696F6EBD020000040048696E740011005442584974656D546F6F6C5361766541
      730102000000BE020000070043617074696F6EBF020000040048696E74001000
      5442584974656D546F6F6C5072696E740102000000C402000007004361707469
      6F6E750A0000040048696E74000E005442584974656D50726576696577010200
      0000C6020000070043617074696F6E760A0000040048696E74000C0054425849
      74656D50616765530101000000C8020000070043617074696F6E000D00544258
      4974656D5072696E74530101000000CA020000070043617074696F6E00150054
      62785375626D656E754974656D54626C46696E640102000000E0090000070043
      617074696F6EE1090000040048696E74000C005442584974656D464E65787401
      01000000CE020000070043617074696F6E000C005442584974656D4650726576
      0101000000D0020000070043617074696F6E001100544258536570617261746F
      724974656D3900000C005442584974656D574E6578740101000000D202000007
      0043617074696F6E000D005442584974656D575072696F720101000000D40200
      00070043617074696F6E001200544258536570617261746F724974656D313100
      0008005442584974656D320101000000D6020000070043617074696F6E001100
      544258536570617261746F724974656D31000015005442585375626D656E7549
      74656D546253657475700102000000F2020000070043617074696F6EF3020000
      040048696E74000C005442584974656D4F4F4C65780101000000F40200000700
      43617074696F6E000F005442584974656D4F4F4C65784C69620101000000250B
      0000070043617074696F6E0006007462456469740101000000FA020000070043
      617074696F6E000D005442584974656D5462436F70790102000000FB02000007
      0043617074696F6EFC020000040048696E74000C005442584974656D54624375
      740102000000FD020000070043617074696F6EFE020000040048696E74000E00
      5442584974656D546250617374650102000000FF020000070043617074696F6E
      00030000040048696E74000C005442584974656D546244656C01020000000103
      0000070043617074696F6E02030000040048696E74000F005442584974656D54
      6253656C416C6C010200000003030000070043617074696F6E04030000040048
      696E74001100544258536570617261746F724974656D3300000D005442584974
      656D5462556E646F010200000005030000070043617074696F6E060300000400
      48696E74000D005442584974656D54625265646F010200000007030000070043
      617074696F6E08030000040048696E74001100544258536570617261746F7249
      74656D34000012005442585375626D656E754974656D536F7274010200000009
      030000070043617074696F6EEC080000040048696E740010005442584974656D
      5462536F727441736301020000000B030000070043617074696F6E0C03000004
      0048696E740011005442584974656D5462536F72744465736301020000000D03
      0000070043617074696F6E0E030000040048696E74000E005442585375626D65
      6E754361736501020000000F030000070043617074696F6E1003000004004869
      6E74000E005442584974656D4343557070657201020000001103000007004361
      7074696F6E12030000040048696E74000E005442584974656D43434C6F776572
      010200000013030000070043617074696F6E14030000040048696E74000E0054
      42584974656D43435469746C65010200000015030000070043617074696F6E16
      030000040048696E74000C005442584974656D4343496E760102000000170300
      00070043617074696F6E18030000040048696E74000B00544258446F636B4C65
      667400000600746256696577010100000019030000070043617074696F6E0011
      005442584974656D5650616E656C5472656501020000001A0300000700436170
      74696F6E460A0000040048696E74000D005442584974656D564E6F6E70720102
      00000022030000070043617074696F6E450A0000040048696E74001100544258
      536570617261746F724974656D3200000C005442584974656D56436F6D6D0102
      00000024030000070043617074696F6E25030000040048696E74000D00544258
      4974656D56556E636F6D010200000026030000070043617074696F6E27030000
      040048696E74001200544258536570617261746F724974656D313000000B0054
      42584974656D56496E64010200000028030000070043617074696F6E29030000
      040048696E74000D005442584974656D56556E696E6401020000002A03000007
      0043617074696F6E2B030000040048696E74000600706C547265650001010000
      000700546F6F6C6261720101000000E2090000070043617074696F6E00040054
      72656500000D00544258446F636B426F74746F6D00000C00544258446F636B52
      69676874000006005374617475730001010000000D00537461747573546F6F6C
      6261720101000000E5090000070043617074696F6E0004004D656E7500000600
      74624D656E750101000000FB050000070043617074696F6E0012005442585375
      626D656E754974656D46696C65010100000035030000070043617074696F6E00
      12005442585375626D656E754974656D464E6577010100000036030000070043
      617074696F6E000B005442584974656D464E6577010200000037030000070043
      617074696F6E38030000040048696E74000E005442584974656D464E65775769
      6E010100000039030000070043617074696F6E000C005442584974656D464F70
      656E01020000003A030000070043617074696F6E3B030000040048696E74000E
      005442584974656D4652656F70656E01020000003C030000070043617074696F
      6E3D030000040048696E74000C005442584974656D465361766501020000003E
      030000070043617074696F6E3F030000040048696E74000E005442584974656D
      46536176654173010200000040030000070043617074696F6E41030000040048
      696E740014005442585375626D656E754974656D4578706F7274010100000042
      030000070043617074696F6E000F005442584974656D4645787048746D6C0102
      00000043030000070043617074696F6E44030000040048696E74000E00544258
      4974656D46457870527466010200000045030000070043617074696F6E460300
      00040048696E74000D005442584974656D465072696E74010200000048030000
      070043617074696F6E780A0000040048696E74000F005442584974656D465072
      657669657701020000004A030000070043617074696F6E790A0000040048696E
      740011005442584974656D4650616765536574757001010000004C0300000700
      43617074696F6E0014005442584974656D465072696E74657253657475700102
      0000004E030000070043617074696F6E7E0A0000040048696E74001200544258
      536570617261746F724974656D313500000C005442584974656D464578697401
      0200000050030000070043617074696F6E26050000040048696E740010005442
      585375626D656E754974656D4564010100000051030000070043617074696F6E
      000C005442584974656D45556E646F010200000052030000070043617074696F
      6E53030000040048696E74000C005442584974656D455265646F010200000054
      030000070043617074696F6E55030000040048696E7400110054425853657061
      7261746F724974656D3600000B005442584974656D4543757401020000005603
      0000070043617074696F6E57030000040048696E74000C005442584974656D45
      436F7079010200000058030000070043617074696F6E59030000040048696E74
      000D005442584974656D45506173746501020000005A03000007004361707469
      6F6E5B030000040048696E74000E005442584974656D4544656C657465010200
      00005C030000070043617074696F6E5D030000040048696E7400110054425849
      74656D4553656C656374416C6C01020000005E030000070043617074696F6E5F
      030000040048696E74001200544258536570617261746F724974656D31370000
      0E005442584974656D45496E64656E7401020000006403000007004361707469
      6F6E65030000040048696E740010005442584974656D45556E696E64656E7401
      0200000066030000070043617074696F6E67030000040048696E74000B005442
      584974656D45447570010200000068030000070043617074696F6E2205000004
      0048696E74000D005442584974656D455461626C650102000000690300000700
      43617074696F6E23050000040048696E740015005442585375626D656E754974
      656D536F72744F707301010000006A030000070043617074696F6E000F005442
      584974656D45536F727441736301020000006C030000070043617074696F6E6D
      030000040048696E740010005442584974656D45536F72744465736301020000
      006E030000070043617074696F6E6F030000040048696E740015005442585375
      626D656E754974656D436173654F707301010000007003000007004361707469
      6F6E0011005442584974656D4543617365557070657201020000007203000007
      0043617074696F6E73030000040048696E740011005442584974656D45436173
      654C6F776572010200000074030000070043617074696F6E7503000004004869
      6E740011005442584974656D45436173655469746C6501020000007603000007
      0043617074696F6E77030000040048696E740012005442584974656D45436173
      65496E76657274010200000078030000070043617074696F6E79030000040048
      696E740010005442585375626D656E754974656D537201010000009003000007
      0043617074696F6E000C005442584974656D534E657874010200000093030000
      070043617074696F6E94030000040048696E74000C005442584974656D535072
      6576010200000095030000070043617074696F6E96030000040048696E740012
      00544258536570617261746F724974656D3139000010005442584974656D5357
      6F72644E657874010200000097030000070043617074696F6E98030000040048
      696E740011005442584974656D53576F72645072696F72010200000099030000
      070043617074696F6E9A030000040048696E7400120054425853657061726174
      6F724974656D3230000010005442584974656D534D61726B4E65787401020000
      009B030000070043617074696F6E12050000040048696E740010005442584974
      656D534D61726B5072657601020000009C030000070043617074696F6E130500
      00040048696E740011005442584974656D534D61726B436C6561720102000000
      9D030000070043617074696F6E9E030000040048696E74001200544258536570
      617261746F724974656D323100000C005442584974656D53476F746F01020000
      009F030000070043617074696F6EA0030000040048696E740010005442585375
      626D656E754974656D426B0101000000A1030000070043617074696F6E001300
      5442585375626D656E754974656D426B5365740102000000A203000007004361
      7074696F6E11070000040048696E740009005442584974656D47300101000000
      A3030000070043617074696F6E0009005442584974656D47310101000000A403
      0000070043617074696F6E0009005442584974656D47320101000000A5030000
      070043617074696F6E0009005442584974656D47330101000000A60300000700
      43617074696F6E0009005442584974656D47340101000000A703000007004361
      7074696F6E0009005442584974656D47350101000000A8030000070043617074
      696F6E0009005442584974656D47360101000000A9030000070043617074696F
      6E0009005442584974656D47370101000000AA030000070043617074696F6E00
      09005442584974656D47380101000000AB030000070043617074696F6E000900
      5442584974656D47390101000000AC030000070043617074696F6E0014005442
      585375626D656E754974656D426B476F746F0102000000AD0300000700436170
      74696F6E12070000040048696E740009005442584974656D42300101000000AE
      030000070043617074696F6E0009005442584974656D42310101000000AF0300
      00070043617074696F6E0009005442584974656D42320101000000B003000007
      0043617074696F6E0009005442584974656D42330101000000B1030000070043
      617074696F6E0009005442584974656D42340101000000B20300000700436170
      74696F6E0009005442584974656D42350101000000B303000007004361707469
      6F6E0009005442584974656D42360101000000B4030000070043617074696F6E
      0009005442584974656D42370101000000B5030000070043617074696F6E0009
      005442584974656D42380101000000B6030000070043617074696F6E00090054
      42584974656D42390101000000B7030000070043617074696F6E001300544258
      5375626D656E754974656D4C657865720101000000BA03000007004361707469
      6F6E0011005442585375626D656E754974656D4F70740101000000BB03000007
      0043617074696F6E000D005442584974656D4F53657475700102000000BC0300
      00070043617074696F6EBD030000040048696E74000D005442584974656D4F4C
      657865720102000000BE030000070043617074696F6EBF030000040048696E74
      0010005442584974656D4F4C657865724C69620102000000C003000007004361
      7074696F6EC1030000040048696E74000A005442584974656D4F524F01020000
      00C3030000070043617074696F6EC4030000040048696E74000C005442584974
      656D4F547265650102000000C5030000070043617074696F6EC6030000040048
      696E74000C005442584974656D4F466F6C640102000000C70300000700436170
      74696F6EC8030000040048696E74000C005442584974656D4F57726170010200
      0000C9030000070043617074696F6ECA030000040048696E74000C0054425849
      74656D4F4E756D730102000000CB030000070043617074696F6ECC0300000400
      48696E74000E005442584974656D4F4E5072696E740102000000CD0300000700
      43617074696F6EC4090000040048696E740012005442585375626D656E754974
      656D48656C700101000000CF030000070043617074696F6E0014005442584974
      656D48656C70526561646D654469720102000000D0030000070043617074696F
      6E20050000040048696E740010005442584974656D48656C7041626F75740102
      000000D1030000070043617074696F6E21050000040048696E7400070050616E
      656C426700000E0054656D706C617465456469746F7200000A00416374696F6E
      4C69737400000D0065635072696E74416374696F6E0102000000060000000700
      43617074696F6E7B0A0000040048696E7400080061634E657754616201020000
      000F000000070043617074696F6E10000000040048696E74000B0061634E6577
      57696E646F77010100000012000000070043617074696F6E000E006563507269
      6E7465725365747570010100000014000000070043617074696F6E0006006163
      4F70656E010200000017000000070043617074696F6E18000000040048696E74
      000800616352657265616401020000001A000000070043617074696F6E1B0000
      00040048696E7400060061635361766501020000001D00000007004361707469
      6F6E1E000000040048696E740008006163536176654173010200000020000000
      070043617074696F6E21000000040048696E74000B0061634578706F72745254
      46010400000023000000070043617074696F6E250000000A0044656661756C74
      45787426000000060046696C74657224000000040048696E74000C0061634578
      706F727448544D4C010400000028000000070043617074696F6E2A0000000A00
      44656661756C744578742B000000060046696C74657229000000040048696E74
      0007006163536574757000000F00616353657475704C657865724C6962000006
      006563436F7079010200000036000000070043617074696F6E37000000040048
      696E74000500656343757401020000003C000000070043617074696F6E3D0000
      00040048696E740007006563506173746501020000003F000000070043617074
      696F6E40000000040048696E740007006563436C656172010200000042000000
      070043617074696F6E43000000040048696E74000B00656353656C656374416C
      6C010200000045000000070043617074696F6E46000000040048696E74000600
      6563556E646F010200000048000000070043617074696F6E4900000004004869
      6E7400060065635265646F01020000004B000000070043617074696F6E4C0000
      00040048696E740008006563496E64656E7401020000004E0000000700436170
      74696F6E4F000000040048696E74000A006563556E696E64656E740102000000
      51000000070043617074696F6E52000000040048696E74000B0065634C6F7765
      7243617365010100000054000000070043617074696F6E000B00656355707065
      7243617365010100000056000000070043617074696F6E000B0065635469746C
      6543617365010100000058000000070043617074696F6E000C006563546F6767
      6C654361736501010000005A000000070043617074696F6E000E006563436F6D
      6D656E744C696E657301020000005C000000070043617074696F6E5D00000004
      0048696E740010006563556E436F6D6D656E744C696E657301020000005F0000
      00070043617074696F6E60000000040048696E74000A00656353686F77547265
      65010100000062000000070043617074696F6E000F006563536F727441736365
      6E64696E67010200000065000000070043617074696F6E66000000040048696E
      740010006563536F727444657363656E64696E67010200000068000000070043
      617074696F6E69000000040048696E74000A006563526561644F6E6C79010200
      00006E000000070043617074696F6E6F000000040048696E7400060065634669
      6E64010100000072000000040048696E74000600656357726170010200000074
      000000070043617074696F6E75000000040048696E74000A0065634C696E654E
      756D73010200000077000000070043617074696F6E78000000040048696E7400
      09006563466F6C64696E6701020000007A000000070043617074696F6E7B0000
      00040048696E74000A0065634E6F6E5072696E7401020000007D000000070043
      617074696F6E7E000000040048696E740002005344000002004F440101000000
      7F000000060046696C746572000D0053796E7461784D616E6167657201010000
      00800000000D004D656E75506C61696E54657874000C0050726F70734D616E61
      67657200000D00656353796E745072696E74657200000B00506F707570456469
      746F7200000E005442584974656D437478556E646F0102000000D20300000700
      43617074696F6ED3030000040048696E74000E005442584974656D4374785265
      646F0102000000D4030000070043617074696F6ED5030000040048696E740012
      00544258536570617261746F724974656D313400000D005442584974656D4374
      784375740102000000D6030000070043617074696F6ED7030000040048696E74
      000E005442584974656D437478436F70790102000000D8030000070043617074
      696F6ED9030000040048696E74000F005442584974656D437478506173746501
      02000000DA030000070043617074696F6EDB030000040048696E74000D005442
      584974656D43747844656C0102000000DC030000070043617074696F6EDD0300
      00040048696E740013005442584974656D43747853656C656374416C6C010200
      0000DE030000070043617074696F6EDF030000040048696E74000D00496D674C
      69737447757474657200000E0053796E744B65794D617070696E670180040000
      F403000011004974656D735B305D2E43617465676F7279890000001400497465
      6D735B305D2E446973706C61794E616D655804000013004974656D735B313030
      5D2E43617465676F72797B01000016004974656D735B3130305D2E446973706C
      61794E616D655904000013004974656D735B3130315D2E43617465676F72797D
      01000016004974656D735B3130315D2E446973706C61794E616D655A04000013
      004974656D735B3130325D2E43617465676F72797F01000016004974656D735B
      3130325D2E446973706C61794E616D655B04000013004974656D735B3130335D
      2E43617465676F72798101000016004974656D735B3130335D2E446973706C61
      794E616D655C04000013004974656D735B3130345D2E43617465676F72798301
      000016004974656D735B3130345D2E446973706C61794E616D655D0400001300
      4974656D735B3130355D2E43617465676F72798501000016004974656D735B31
      30355D2E446973706C61794E616D655E04000013004974656D735B3130365D2E
      43617465676F72798701000016004974656D735B3130365D2E446973706C6179
      4E616D655F04000013004974656D735B3130375D2E43617465676F7279890100
      0016004974656D735B3130375D2E446973706C61794E616D6560040000130049
      74656D735B3130385D2E43617465676F72798C01000016004974656D735B3130
      385D2E446973706C61794E616D656104000013004974656D735B3130395D2E43
      617465676F72798F01000016004974656D735B3130395D2E446973706C61794E
      616D65FE03000012004974656D735B31305D2E43617465676F7279A400000015
      004974656D735B31305D2E446973706C61794E616D656204000013004974656D
      735B3131305D2E43617465676F72799201000016004974656D735B3131305D2E
      446973706C61794E616D656304000013004974656D735B3131315D2E43617465
      676F72799501000016004974656D735B3131315D2E446973706C61794E616D65
      6404000013004974656D735B3131325D2E43617465676F727998010000160049
      74656D735B3131325D2E446973706C61794E616D656504000013004974656D73
      5B3131335D2E43617465676F72799B01000016004974656D735B3131335D2E44
      6973706C61794E616D656604000013004974656D735B3131345D2E4361746567
      6F72799E01000016004974656D735B3131345D2E446973706C61794E616D6567
      04000013004974656D735B3131355D2E43617465676F7279A101000016004974
      656D735B3131355D2E446973706C61794E616D656804000013004974656D735B
      3131365D2E43617465676F7279A401000016004974656D735B3131365D2E4469
      73706C61794E616D656904000013004974656D735B3131375D2E43617465676F
      7279A701000016004974656D735B3131375D2E446973706C61794E616D656A04
      000013004974656D735B3131385D2E43617465676F7279AA0100001600497465
      6D735B3131385D2E446973706C61794E616D656B04000013004974656D735B31
      31395D2E43617465676F7279AD01000016004974656D735B3131395D2E446973
      706C61794E616D65FF03000012004974656D735B31315D2E43617465676F7279
      A600000015004974656D735B31315D2E446973706C61794E616D656C04000013
      004974656D735B3132305D2E43617465676F7279B001000016004974656D735B
      3132305D2E446973706C61794E616D656D04000013004974656D735B3132315D
      2E43617465676F7279B301000016004974656D735B3132315D2E446973706C61
      794E616D656E04000013004974656D735B3132325D2E43617465676F7279B601
      000016004974656D735B3132325D2E446973706C61794E616D656F0400001300
      4974656D735B3132335D2E43617465676F7279B901000016004974656D735B31
      32335D2E446973706C61794E616D657004000013004974656D735B3132345D2E
      43617465676F7279BC01000016004974656D735B3132345D2E446973706C6179
      4E616D657104000013004974656D735B3132355D2E43617465676F7279BF0100
      0016004974656D735B3132355D2E446973706C61794E616D6572040000130049
      74656D735B3132365D2E43617465676F7279C201000016004974656D735B3132
      365D2E446973706C61794E616D657304000013004974656D735B3132375D2E43
      617465676F7279C501000016004974656D735B3132375D2E446973706C61794E
      616D657404000013004974656D735B3132385D2E43617465676F7279C8010000
      16004974656D735B3132385D2E446973706C61794E616D657504000013004974
      656D735B3132395D2E43617465676F7279CA01000016004974656D735B313239
      5D2E446973706C61794E616D650004000012004974656D735B31325D2E436174
      65676F7279A800000015004974656D735B31325D2E446973706C61794E616D65
      7604000013004974656D735B3133305D2E43617465676F7279CC010000160049
      74656D735B3133305D2E446973706C61794E616D657704000013004974656D73
      5B3133315D2E43617465676F7279CE01000016004974656D735B3133315D2E44
      6973706C61794E616D657804000013004974656D735B3133325D2E4361746567
      6F7279D001000016004974656D735B3133325D2E446973706C61794E616D6579
      04000013004974656D735B3133335D2E43617465676F7279D301000016004974
      656D735B3133335D2E446973706C61794E616D657A04000013004974656D735B
      3133345D2E43617465676F7279D601000016004974656D735B3133345D2E4469
      73706C61794E616D657B04000013004974656D735B3133355D2E43617465676F
      7279D801000016004974656D735B3133355D2E446973706C61794E616D657C04
      000013004974656D735B3133365D2E43617465676F7279DA0100001600497465
      6D735B3133365D2E446973706C61794E616D657D04000013004974656D735B31
      33375D2E43617465676F7279DD01000016004974656D735B3133375D2E446973
      706C61794E616D657E04000013004974656D735B3133385D2E43617465676F72
      79E001000016004974656D735B3133385D2E446973706C61794E616D657F0400
      0013004974656D735B3133395D2E43617465676F7279E301000016004974656D
      735B3133395D2E446973706C61794E616D650104000012004974656D735B3133
      5D2E43617465676F7279AA00000015004974656D735B31335D2E446973706C61
      794E616D658004000013004974656D735B3134305D2E43617465676F7279E601
      000016004974656D735B3134305D2E446973706C61794E616D65810400001300
      4974656D735B3134315D2E43617465676F7279E901000016004974656D735B31
      34315D2E446973706C61794E616D658204000013004974656D735B3134325D2E
      43617465676F7279EC01000016004974656D735B3134325D2E446973706C6179
      4E616D658304000013004974656D735B3134335D2E43617465676F7279EF0100
      0016004974656D735B3134335D2E446973706C61794E616D6584040000130049
      74656D735B3134345D2E43617465676F7279F201000016004974656D735B3134
      345D2E446973706C61794E616D658504000013004974656D735B3134355D2E43
      617465676F7279F501000016004974656D735B3134355D2E446973706C61794E
      616D658604000013004974656D735B3134365D2E43617465676F7279F8010000
      16004974656D735B3134365D2E446973706C61794E616D658704000013004974
      656D735B3134375D2E43617465676F7279FB01000016004974656D735B313437
      5D2E446973706C61794E616D658804000013004974656D735B3134385D2E4361
      7465676F7279FE01000016004974656D735B3134385D2E446973706C61794E61
      6D658904000013004974656D735B3134395D2E43617465676F72790102000016
      004974656D735B3134395D2E446973706C61794E616D65020400001200497465
      6D735B31345D2E43617465676F7279AC00000015004974656D735B31345D2E44
      6973706C61794E616D658A04000013004974656D735B3135305D2E4361746567
      6F72790402000016004974656D735B3135305D2E446973706C61794E616D658B
      04000013004974656D735B3135315D2E43617465676F72790702000016004974
      656D735B3135315D2E446973706C61794E616D658C04000013004974656D735B
      3135325D2E43617465676F72790A02000016004974656D735B3135325D2E4469
      73706C61794E616D658D04000013004974656D735B3135335D2E43617465676F
      72790D02000016004974656D735B3135335D2E446973706C61794E616D658E04
      000013004974656D735B3135345D2E43617465676F7279100200001600497465
      6D735B3135345D2E446973706C61794E616D658F04000013004974656D735B31
      35355D2E43617465676F72791302000016004974656D735B3135355D2E446973
      706C61794E616D659004000013004974656D735B3135365D2E43617465676F72
      791602000016004974656D735B3135365D2E446973706C61794E616D65910400
      0013004974656D735B3135375D2E43617465676F72791902000016004974656D
      735B3135375D2E446973706C61794E616D659204000013004974656D735B3135
      385D2E43617465676F72791C02000016004974656D735B3135385D2E44697370
      6C61794E616D659304000013004974656D735B3135395D2E43617465676F7279
      1F02000016004974656D735B3135395D2E446973706C61794E616D6503040000
      12004974656D735B31355D2E43617465676F7279AE00000015004974656D735B
      31355D2E446973706C61794E616D659404000013004974656D735B3136305D2E
      43617465676F72792202000016004974656D735B3136305D2E446973706C6179
      4E616D659504000013004974656D735B3136315D2E43617465676F7279250200
      0016004974656D735B3136315D2E446973706C61794E616D6596040000130049
      74656D735B3136325D2E43617465676F72792802000016004974656D735B3136
      325D2E446973706C61794E616D659704000013004974656D735B3136335D2E43
      617465676F72792B02000016004974656D735B3136335D2E446973706C61794E
      616D659804000013004974656D735B3136345D2E43617465676F72792E020000
      16004974656D735B3136345D2E446973706C61794E616D659904000013004974
      656D735B3136355D2E43617465676F72793102000016004974656D735B313635
      5D2E446973706C61794E616D659A04000013004974656D735B3136365D2E4361
      7465676F72793402000016004974656D735B3136365D2E446973706C61794E61
      6D659B04000013004974656D735B3136375D2E43617465676F72793702000016
      004974656D735B3136375D2E446973706C61794E616D659C0400001300497465
      6D735B3136385D2E43617465676F72793A02000016004974656D735B3136385D
      2E446973706C61794E616D659D04000013004974656D735B3136395D2E436174
      65676F72793D02000016004974656D735B3136395D2E446973706C61794E616D
      650404000012004974656D735B31365D2E43617465676F7279B0000000150049
      74656D735B31365D2E446973706C61794E616D659E04000013004974656D735B
      3137305D2E43617465676F72794002000016004974656D735B3137305D2E4469
      73706C61794E616D659F04000013004974656D735B3137315D2E43617465676F
      72794302000016004974656D735B3137315D2E446973706C61794E616D65A004
      000013004974656D735B3137325D2E43617465676F7279460200001600497465
      6D735B3137325D2E446973706C61794E616D65A104000013004974656D735B31
      37335D2E43617465676F72794902000016004974656D735B3137335D2E446973
      706C61794E616D65A204000013004974656D735B3137345D2E43617465676F72
      794C02000016004974656D735B3137345D2E446973706C61794E616D65A30400
      0013004974656D735B3137355D2E43617465676F72794F02000016004974656D
      735B3137355D2E446973706C61794E616D65A404000013004974656D735B3137
      365D2E43617465676F72795202000016004974656D735B3137365D2E44697370
      6C61794E616D65A504000013004974656D735B3137375D2E43617465676F7279
      5502000016004974656D735B3137375D2E446973706C61794E616D65A6040000
      13004974656D735B3137385D2E43617465676F72795802000016004974656D73
      5B3137385D2E446973706C61794E616D65A704000013004974656D735B313739
      5D2E43617465676F72795B02000016004974656D735B3137395D2E446973706C
      61794E616D650504000012004974656D735B31375D2E43617465676F7279B200
      000015004974656D735B31375D2E446973706C61794E616D65A8040000130049
      74656D735B3138305D2E43617465676F72795E02000016004974656D735B3138
      305D2E446973706C61794E616D65A904000013004974656D735B3138315D2E43
      617465676F72796102000016004974656D735B3138315D2E446973706C61794E
      616D65AA04000013004974656D735B3138325D2E43617465676F727964020000
      16004974656D735B3138325D2E446973706C61794E616D65AB04000013004974
      656D735B3138335D2E43617465676F72796702000016004974656D735B313833
      5D2E446973706C61794E616D65AC04000013004974656D735B3138345D2E4361
      7465676F72796A02000016004974656D735B3138345D2E446973706C61794E61
      6D65AD04000013004974656D735B3138355D2E43617465676F72796D02000016
      004974656D735B3138355D2E446973706C61794E616D65AE0400001300497465
      6D735B3138365D2E43617465676F72797002000016004974656D735B3138365D
      2E446973706C61794E616D65AF04000013004974656D735B3138375D2E436174
      65676F72797302000016004974656D735B3138375D2E446973706C61794E616D
      65B004000013004974656D735B3138385D2E43617465676F7279760200001600
      4974656D735B3138385D2E446973706C61794E616D65B104000013004974656D
      735B3138395D2E43617465676F72797902000016004974656D735B3138395D2E
      446973706C61794E616D650604000012004974656D735B31385D2E4361746567
      6F7279B400000015004974656D735B31385D2E446973706C61794E616D65B204
      000013004974656D735B3139305D2E43617465676F72797C0200001600497465
      6D735B3139305D2E446973706C61794E616D65B304000013004974656D735B31
      39315D2E43617465676F72797E02000016004974656D735B3139315D2E446973
      706C61794E616D65B404000013004974656D735B3139325D2E43617465676F72
      798102000016004974656D735B3139325D2E446973706C61794E616D65B50400
      0013004974656D735B3139335D2E43617465676F72798402000016004974656D
      735B3139335D2E446973706C61794E616D65B604000013004974656D735B3139
      345D2E43617465676F72798702000016004974656D735B3139345D2E44697370
      6C61794E616D65B704000013004974656D735B3139355D2E43617465676F7279
      8A02000016004974656D735B3139355D2E446973706C61794E616D65B8040000
      13004974656D735B3139365D2E43617465676F72798D02000016004974656D73
      5B3139365D2E446973706C61794E616D65B904000013004974656D735B313937
      5D2E43617465676F72799002000016004974656D735B3139375D2E446973706C
      61794E616D65BA04000013004974656D735B3139385D2E43617465676F727993
      02000016004974656D735B3139385D2E446973706C61794E616D65BB04000013
      004974656D735B3139395D2E43617465676F72799602000016004974656D735B
      3139395D2E446973706C61794E616D650704000012004974656D735B31395D2E
      43617465676F7279B600000015004974656D735B31395D2E446973706C61794E
      616D65F503000011004974656D735B315D2E43617465676F72798B0000001400
      4974656D735B315D2E446973706C61794E616D65BC04000013004974656D735B
      3230305D2E43617465676F72799802000016004974656D735B3230305D2E4469
      73706C61794E616D65BD04000013004974656D735B3230315D2E43617465676F
      72799A02000016004974656D735B3230315D2E446973706C61794E616D65BE04
      000013004974656D735B3230325D2E43617465676F72799C0200001600497465
      6D735B3230325D2E446973706C61794E616D65BF04000013004974656D735B32
      30335D2E43617465676F72799E02000016004974656D735B3230335D2E446973
      706C61794E616D65C004000013004974656D735B3230345D2E43617465676F72
      79A002000016004974656D735B3230345D2E446973706C61794E616D65C10400
      0013004974656D735B3230355D2E43617465676F7279A202000016004974656D
      735B3230355D2E446973706C61794E616D65C204000013004974656D735B3230
      365D2E43617465676F7279A402000016004974656D735B3230365D2E44697370
      6C61794E616D65C304000013004974656D735B3230375D2E43617465676F7279
      A602000016004974656D735B3230375D2E446973706C61794E616D65C4040000
      13004974656D735B3230385D2E43617465676F7279A802000016004974656D73
      5B3230385D2E446973706C61794E616D65CB04000013004974656D735B323039
      5D2E43617465676F7279CC04000016004974656D735B3230395D2E446973706C
      61794E616D650804000012004974656D735B32305D2E43617465676F7279B800
      000015004974656D735B32305D2E446973706C61794E616D65CD040000130049
      74656D735B3231305D2E43617465676F7279CE04000016004974656D735B3231
      305D2E446973706C61794E616D65CF04000013004974656D735B3231315D2E43
      617465676F7279D004000016004974656D735B3231315D2E446973706C61794E
      616D65D104000013004974656D735B3231325D2E43617465676F7279D2040000
      16004974656D735B3231325D2E446973706C61794E616D65DC04000013004974
      656D735B3231335D2E43617465676F7279DD04000016004974656D735B323133
      5D2E446973706C61794E616D65EE04000013004974656D735B3231345D2E4361
      7465676F7279EF04000016004974656D735B3231345D2E446973706C61794E61
      6D65F004000013004974656D735B3231355D2E43617465676F7279F104000016
      004974656D735B3231355D2E446973706C61794E616D65F20400001300497465
      6D735B3231365D2E43617465676F7279F304000016004974656D735B3231365D
      2E446973706C61794E616D65F404000013004974656D735B3231375D2E436174
      65676F7279F504000016004974656D735B3231375D2E446973706C61794E616D
      650605000013004974656D735B3231385D2E43617465676F7279070500001600
      4974656D735B3231385D2E446973706C61794E616D652B05000013004974656D
      735B3231395D2E43617465676F72792C05000016004974656D735B3231395D2E
      446973706C61794E616D650904000012004974656D735B32315D2E4361746567
      6F7279BA00000015004974656D735B32315D2E446973706C61794E616D653605
      000013004974656D735B3232305D2E43617465676F7279370500001600497465
      6D735B3232305D2E446973706C61794E616D653805000013004974656D735B32
      32315D2E43617465676F72793905000016004974656D735B3232315D2E446973
      706C61794E616D653A05000013004974656D735B3232325D2E43617465676F72
      793B05000016004974656D735B3232325D2E446973706C61794E616D654A0500
      0013004974656D735B3232335D2E43617465676F72794B05000016004974656D
      735B3232335D2E446973706C61794E616D655105000013004974656D735B3232
      345D2E43617465676F72795205000016004974656D735B3232345D2E44697370
      6C61794E616D656D05000013004974656D735B3232355D2E43617465676F7279
      6E05000016004974656D735B3232355D2E446973706C61794E616D656F050000
      13004974656D735B3232365D2E43617465676F72797005000016004974656D73
      5B3232365D2E446973706C61794E616D657105000013004974656D735B323237
      5D2E43617465676F72797205000016004974656D735B3232375D2E446973706C
      61794E616D657305000013004974656D735B3232385D2E43617465676F727974
      05000016004974656D735B3232385D2E446973706C61794E616D657505000013
      004974656D735B3232395D2E43617465676F72797605000016004974656D735B
      3232395D2E446973706C61794E616D650A04000012004974656D735B32325D2E
      43617465676F7279BC00000015004974656D735B32325D2E446973706C61794E
      616D657705000013004974656D735B3233305D2E43617465676F727978050000
      16004974656D735B3233305D2E446973706C61794E616D657905000013004974
      656D735B3233315D2E43617465676F72797A05000016004974656D735B323331
      5D2E446973706C61794E616D657B05000013004974656D735B3233325D2E4361
      7465676F72797C05000016004974656D735B3233325D2E446973706C61794E61
      6D657D05000013004974656D735B3233335D2E43617465676F72797E05000016
      004974656D735B3233335D2E446973706C61794E616D657F0500001300497465
      6D735B3233345D2E43617465676F72798005000016004974656D735B3233345D
      2E446973706C61794E616D658105000013004974656D735B3233355D2E436174
      65676F72798205000016004974656D735B3233355D2E446973706C61794E616D
      658305000013004974656D735B3233365D2E43617465676F7279840500001600
      4974656D735B3233365D2E446973706C61794E616D65A705000013004974656D
      735B3233375D2E43617465676F7279A805000016004974656D735B3233375D2E
      446973706C61794E616D65B205000013004974656D735B3233385D2E43617465
      676F7279B305000016004974656D735B3233385D2E446973706C61794E616D65
      B405000013004974656D735B3233395D2E43617465676F7279B5050000160049
      74656D735B3233395D2E446973706C61794E616D650B04000012004974656D73
      5B32335D2E43617465676F7279BE00000015004974656D735B32335D2E446973
      706C61794E616D65B705000013004974656D735B3234305D2E43617465676F72
      79B805000016004974656D735B3234305D2E446973706C61794E616D65C20500
      0013004974656D735B3234315D2E43617465676F7279C305000016004974656D
      735B3234315D2E446973706C61794E616D65D005000013004974656D735B3234
      325D2E43617465676F7279D105000016004974656D735B3234325D2E44697370
      6C61794E616D65D505000013004974656D735B3234335D2E43617465676F7279
      D605000016004974656D735B3234335D2E446973706C61794E616D65D8050000
      13004974656D735B3234345D2E43617465676F7279D905000016004974656D73
      5B3234345D2E446973706C61794E616D65F505000013004974656D735B323435
      5D2E43617465676F7279F605000016004974656D735B3234355D2E446973706C
      61794E616D651406000013004974656D735B3234365D2E43617465676F727915
      06000016004974656D735B3234365D2E446973706C61794E616D651606000013
      004974656D735B3234375D2E43617465676F72791706000016004974656D735B
      3234375D2E446973706C61794E616D652A06000013004974656D735B3234385D
      2E43617465676F72792B06000016004974656D735B3234385D2E446973706C61
      794E616D652F06000013004974656D735B3234395D2E43617465676F72793006
      000016004974656D735B3234395D2E446973706C61794E616D650C0400001200
      4974656D735B32345D2E43617465676F7279C000000015004974656D735B3234
      5D2E446973706C61794E616D653106000013004974656D735B3235305D2E4361
      7465676F72793206000016004974656D735B3235305D2E446973706C61794E61
      6D653706000013004974656D735B3235315D2E43617465676F72793806000016
      004974656D735B3235315D2E446973706C61794E616D65390600001300497465
      6D735B3235325D2E43617465676F72793A06000016004974656D735B3235325D
      2E446973706C61794E616D653D06000013004974656D735B3235335D2E436174
      65676F72793E06000016004974656D735B3235335D2E446973706C61794E616D
      653F06000013004974656D735B3235345D2E43617465676F7279400600001600
      4974656D735B3235345D2E446973706C61794E616D654206000013004974656D
      735B3235355D2E43617465676F72794306000016004974656D735B3235355D2E
      446973706C61794E616D654E06000013004974656D735B3235365D2E43617465
      676F72794F06000016004974656D735B3235365D2E446973706C61794E616D65
      5406000013004974656D735B3235375D2E43617465676F727955060000160049
      74656D735B3235375D2E446973706C61794E616D655606000013004974656D73
      5B3235385D2E43617465676F72795706000016004974656D735B3235385D2E44
      6973706C61794E616D655D06000013004974656D735B3235395D2E4361746567
      6F72795E06000016004974656D735B3235395D2E446973706C61794E616D650D
      04000012004974656D735B32355D2E43617465676F7279C20000001500497465
      6D735B32355D2E446973706C61794E616D656006000013004974656D735B3236
      305D2E43617465676F72796106000016004974656D735B3236305D2E44697370
      6C61794E616D656406000013004974656D735B3236315D2E43617465676F7279
      6506000016004974656D735B3236315D2E446973706C61794E616D6570060000
      13004974656D735B3236325D2E43617465676F72797106000016004974656D73
      5B3236325D2E446973706C61794E616D657306000013004974656D735B323633
      5D2E43617465676F72797406000016004974656D735B3236335D2E446973706C
      61794E616D657506000013004974656D735B3236345D2E43617465676F727976
      06000016004974656D735B3236345D2E446973706C61794E616D657E06000013
      004974656D735B3236355D2E43617465676F72797F06000016004974656D735B
      3236355D2E446973706C61794E616D658706000013004974656D735B3236365D
      2E43617465676F72798806000016004974656D735B3236365D2E446973706C61
      794E616D658906000013004974656D735B3236375D2E43617465676F72798A06
      000016004974656D735B3236375D2E446973706C61794E616D658B0600001300
      4974656D735B3236385D2E43617465676F72798C06000016004974656D735B32
      36385D2E446973706C61794E616D658D06000013004974656D735B3236395D2E
      43617465676F72798E06000016004974656D735B3236395D2E446973706C6179
      4E616D650E04000012004974656D735B32365D2E43617465676F7279C5000000
      15004974656D735B32365D2E446973706C61794E616D659F0600001300497465
      6D735B3237305D2E43617465676F7279A006000016004974656D735B3237305D
      2E446973706C61794E616D65A106000013004974656D735B3237315D2E436174
      65676F7279A206000016004974656D735B3237315D2E446973706C61794E616D
      65A306000013004974656D735B3237325D2E43617465676F7279A40600001600
      4974656D735B3237325D2E446973706C61794E616D65A506000013004974656D
      735B3237335D2E43617465676F7279A606000016004974656D735B3237335D2E
      446973706C61794E616D65B206000013004974656D735B3237345D2E43617465
      676F7279B306000016004974656D735B3237345D2E446973706C61794E616D65
      B406000013004974656D735B3237355D2E43617465676F7279B5060000160049
      74656D735B3237355D2E446973706C61794E616D65B806000013004974656D73
      5B3237365D2E43617465676F7279B906000016004974656D735B3237365D2E44
      6973706C61794E616D65BA06000013004974656D735B3237375D2E4361746567
      6F7279BB06000016004974656D735B3237375D2E446973706C61794E616D65D0
      06000013004974656D735B3237385D2E43617465676F7279D106000016004974
      656D735B3237385D2E446973706C61794E616D65DA06000013004974656D735B
      3237395D2E43617465676F7279DB06000016004974656D735B3237395D2E4469
      73706C61794E616D650F04000012004974656D735B32375D2E43617465676F72
      79C800000015004974656D735B32375D2E446973706C61794E616D65DC060000
      13004974656D735B3238305D2E43617465676F7279DD06000016004974656D73
      5B3238305D2E446973706C61794E616D65DE06000013004974656D735B323831
      5D2E43617465676F7279DF06000016004974656D735B3238315D2E446973706C
      61794E616D65E006000013004974656D735B3238325D2E43617465676F7279E1
      06000016004974656D735B3238325D2E446973706C61794E616D65E206000013
      004974656D735B3238335D2E43617465676F7279E306000016004974656D735B
      3238335D2E446973706C61794E616D65E406000013004974656D735B3238345D
      2E43617465676F7279E506000016004974656D735B3238345D2E446973706C61
      794E616D65E606000013004974656D735B3238355D2E43617465676F7279E706
      000016004974656D735B3238355D2E446973706C61794E616D65E80600001300
      4974656D735B3238365D2E43617465676F7279E906000016004974656D735B32
      38365D2E446973706C61794E616D65EA06000013004974656D735B3238375D2E
      43617465676F7279EB06000016004974656D735B3238375D2E446973706C6179
      4E616D65EC06000013004974656D735B3238385D2E43617465676F7279ED0600
      0016004974656D735B3238385D2E446973706C61794E616D65F4060000130049
      74656D735B3238395D2E43617465676F7279F506000016004974656D735B3238
      395D2E446973706C61794E616D651004000012004974656D735B32385D2E4361
      7465676F7279CB00000015004974656D735B32385D2E446973706C61794E616D
      65F606000013004974656D735B3239305D2E43617465676F7279F70600001600
      4974656D735B3239305D2E446973706C61794E616D65F806000013004974656D
      735B3239315D2E43617465676F7279F906000016004974656D735B3239315D2E
      446973706C61794E616D65FD06000013004974656D735B3239325D2E43617465
      676F7279FE06000016004974656D735B3239325D2E446973706C61794E616D65
      FF06000013004974656D735B3239335D2E43617465676F727900070000160049
      74656D735B3239335D2E446973706C61794E616D650107000013004974656D73
      5B3239345D2E43617465676F72790207000016004974656D735B3239345D2E44
      6973706C61794E616D650307000013004974656D735B3239355D2E4361746567
      6F72790407000016004974656D735B3239355D2E446973706C61794E616D6505
      07000013004974656D735B3239365D2E43617465676F72790607000016004974
      656D735B3239365D2E446973706C61794E616D651507000013004974656D735B
      3239375D2E43617465676F72791607000016004974656D735B3239375D2E4469
      73706C61794E616D651B07000013004974656D735B3239385D2E43617465676F
      72791C07000016004974656D735B3239385D2E446973706C61794E616D651F07
      000013004974656D735B3239395D2E43617465676F7279200700001600497465
      6D735B3239395D2E446973706C61794E616D651104000012004974656D735B32
      395D2E43617465676F7279CE00000015004974656D735B32395D2E446973706C
      61794E616D65F603000011004974656D735B325D2E43617465676F72798E0000
      0014004974656D735B325D2E446973706C61794E616D65210700001300497465
      6D735B3330305D2E43617465676F72792207000016004974656D735B3330305D
      2E446973706C61794E616D652A07000013004974656D735B3330315D2E436174
      65676F72792B07000016004974656D735B3330315D2E446973706C61794E616D
      652C07000013004974656D735B3330325D2E43617465676F72792D0700001600
      4974656D735B3330325D2E446973706C61794E616D653307000013004974656D
      735B3330335D2E43617465676F72793407000016004974656D735B3330335D2E
      446973706C61794E616D653507000013004974656D735B3330345D2E43617465
      676F72793607000016004974656D735B3330345D2E446973706C61794E616D65
      3B07000013004974656D735B3330355D2E43617465676F72793C070000160049
      74656D735B3330355D2E446973706C61794E616D653D07000013004974656D73
      5B3330365D2E43617465676F72793E07000016004974656D735B3330365D2E44
      6973706C61794E616D653F07000013004974656D735B3330375D2E4361746567
      6F72794007000016004974656D735B3330375D2E446973706C61794E616D6541
      07000013004974656D735B3330385D2E43617465676F72794207000016004974
      656D735B3330385D2E446973706C61794E616D654307000013004974656D735B
      3330395D2E43617465676F72794407000016004974656D735B3330395D2E4469
      73706C61794E616D651204000012004974656D735B33305D2E43617465676F72
      79D100000015004974656D735B33305D2E446973706C61794E616D6545070000
      13004974656D735B3331305D2E43617465676F72794607000016004974656D73
      5B3331305D2E446973706C61794E616D654707000013004974656D735B333131
      5D2E43617465676F72794807000016004974656D735B3331315D2E446973706C
      61794E616D654907000013004974656D735B3331325D2E43617465676F72794A
      07000016004974656D735B3331325D2E446973706C61794E616D654B07000013
      004974656D735B3331335D2E43617465676F72794C07000016004974656D735B
      3331335D2E446973706C61794E616D654D07000013004974656D735B3331345D
      2E43617465676F72794E07000016004974656D735B3331345D2E446973706C61
      794E616D656007000013004974656D735B3331355D2E43617465676F72796107
      000016004974656D735B3331355D2E446973706C61794E616D65620700001300
      4974656D735B3331365D2E43617465676F72796307000016004974656D735B33
      31365D2E446973706C61794E616D656D07000013004974656D735B3331375D2E
      43617465676F72796E07000016004974656D735B3331375D2E446973706C6179
      4E616D656F07000013004974656D735B3331385D2E43617465676F7279700700
      0016004974656D735B3331385D2E446973706C61794E616D6571070000130049
      74656D735B3331395D2E43617465676F72797207000016004974656D735B3331
      395D2E446973706C61794E616D651304000012004974656D735B33315D2E4361
      7465676F7279D400000015004974656D735B33315D2E446973706C61794E616D
      657307000013004974656D735B3332305D2E43617465676F7279740700001600
      4974656D735B3332305D2E446973706C61794E616D657607000013004974656D
      735B3332315D2E43617465676F72797707000016004974656D735B3332315D2E
      446973706C61794E616D657A07000013004974656D735B3332325D2E43617465
      676F72797B07000016004974656D735B3332325D2E446973706C61794E616D65
      7C07000013004974656D735B3332335D2E43617465676F72797D070000160049
      74656D735B3332335D2E446973706C61794E616D658207000013004974656D73
      5B3332345D2E43617465676F72798307000016004974656D735B3332345D2E44
      6973706C61794E616D658407000013004974656D735B3332355D2E4361746567
      6F72798507000016004974656D735B3332355D2E446973706C61794E616D6588
      07000013004974656D735B3332365D2E43617465676F72798907000016004974
      656D735B3332365D2E446973706C61794E616D658A07000013004974656D735B
      3332375D2E43617465676F72798B07000016004974656D735B3332375D2E4469
      73706C61794E616D658C07000013004974656D735B3332385D2E43617465676F
      72798D07000016004974656D735B3332385D2E446973706C61794E616D658E07
      000013004974656D735B3332395D2E43617465676F72798F0700001600497465
      6D735B3332395D2E446973706C61794E616D651404000012004974656D735B33
      325D2E43617465676F7279D700000015004974656D735B33325D2E446973706C
      61794E616D659007000013004974656D735B3333305D2E43617465676F727991
      07000016004974656D735B3333305D2E446973706C61794E616D659207000013
      004974656D735B3333315D2E43617465676F72799307000016004974656D735B
      3333315D2E446973706C61794E616D659407000013004974656D735B3333325D
      2E43617465676F72799507000016004974656D735B3333325D2E446973706C61
      794E616D659E07000013004974656D735B3333335D2E43617465676F72799F07
      000016004974656D735B3333335D2E446973706C61794E616D65A00700001300
      4974656D735B3333345D2E43617465676F7279A107000016004974656D735B33
      33345D2E446973706C61794E616D65AB07000013004974656D735B3333355D2E
      43617465676F7279AC07000016004974656D735B3333355D2E446973706C6179
      4E616D65B107000013004974656D735B3333365D2E43617465676F7279B20700
      0016004974656D735B3333365D2E446973706C61794E616D65B4070000130049
      74656D735B3333375D2E43617465676F7279B507000016004974656D735B3333
      375D2E446973706C61794E616D65B607000013004974656D735B3333385D2E43
      617465676F7279B707000016004974656D735B3333385D2E446973706C61794E
      616D65BA07000013004974656D735B3333395D2E43617465676F7279BB070000
      16004974656D735B3333395D2E446973706C61794E616D651504000012004974
      656D735B33335D2E43617465676F7279D900000015004974656D735B33335D2E
      446973706C61794E616D65BC07000013004974656D735B3334305D2E43617465
      676F7279BD07000016004974656D735B3334305D2E446973706C61794E616D65
      BE07000013004974656D735B3334315D2E43617465676F7279BF070000160049
      74656D735B3334315D2E446973706C61794E616D65C007000013004974656D73
      5B3334325D2E43617465676F7279C107000016004974656D735B3334325D2E44
      6973706C61794E616D65C207000013004974656D735B3334335D2E4361746567
      6F7279C307000016004974656D735B3334335D2E446973706C61794E616D65C4
      07000013004974656D735B3334345D2E43617465676F7279C507000016004974
      656D735B3334345D2E446973706C61794E616D65C607000013004974656D735B
      3334355D2E43617465676F7279C707000016004974656D735B3334355D2E4469
      73706C61794E616D65C807000013004974656D735B3334365D2E43617465676F
      7279C907000016004974656D735B3334365D2E446973706C61794E616D65CA07
      000013004974656D735B3334375D2E43617465676F7279CB0700001600497465
      6D735B3334375D2E446973706C61794E616D65CC07000013004974656D735B33
      34385D2E43617465676F7279CD07000016004974656D735B3334385D2E446973
      706C61794E616D65CE07000013004974656D735B3334395D2E43617465676F72
      79CF07000016004974656D735B3334395D2E446973706C61794E616D65160400
      0012004974656D735B33345D2E43617465676F7279DC00000015004974656D73
      5B33345D2E446973706C61794E616D65D007000013004974656D735B3335305D
      2E43617465676F7279D107000016004974656D735B3335305D2E446973706C61
      794E616D65D207000013004974656D735B3335315D2E43617465676F7279D307
      000016004974656D735B3335315D2E446973706C61794E616D65D40700001300
      4974656D735B3335325D2E43617465676F7279D507000016004974656D735B33
      35325D2E446973706C61794E616D65D607000013004974656D735B3335335D2E
      43617465676F7279D707000016004974656D735B3335335D2E446973706C6179
      4E616D65D807000013004974656D735B3335345D2E43617465676F7279D90700
      0016004974656D735B3335345D2E446973706C61794E616D65DA070000130049
      74656D735B3335355D2E43617465676F7279DB07000016004974656D735B3335
      355D2E446973706C61794E616D65DC07000013004974656D735B3335365D2E43
      617465676F7279DD07000016004974656D735B3335365D2E446973706C61794E
      616D65DE07000013004974656D735B3335375D2E43617465676F7279DF070000
      16004974656D735B3335375D2E446973706C61794E616D65E007000013004974
      656D735B3335385D2E43617465676F7279E107000016004974656D735B333538
      5D2E446973706C61794E616D65EB07000013004974656D735B3335395D2E4361
      7465676F7279EC07000016004974656D735B3335395D2E446973706C61794E61
      6D651704000012004974656D735B33355D2E43617465676F7279DF0000001500
      4974656D735B33355D2E446973706C61794E616D65ED07000013004974656D73
      5B3336305D2E43617465676F7279EE07000016004974656D735B3336305D2E44
      6973706C61794E616D65EF07000013004974656D735B3336315D2E4361746567
      6F7279F007000016004974656D735B3336315D2E446973706C61794E616D65F1
      07000013004974656D735B3336325D2E43617465676F7279F207000016004974
      656D735B3336325D2E446973706C61794E616D65F307000013004974656D735B
      3336335D2E43617465676F7279F407000016004974656D735B3336335D2E4469
      73706C61794E616D65F507000013004974656D735B3336345D2E43617465676F
      7279F607000016004974656D735B3336345D2E446973706C61794E616D65F707
      000013004974656D735B3336355D2E43617465676F7279F80700001600497465
      6D735B3336355D2E446973706C61794E616D65F907000013004974656D735B33
      36365D2E43617465676F7279FA07000016004974656D735B3336365D2E446973
      706C61794E616D65FB07000013004974656D735B3336375D2E43617465676F72
      79FC07000016004974656D735B3336375D2E446973706C61794E616D65FD0700
      0013004974656D735B3336385D2E43617465676F7279FE07000016004974656D
      735B3336385D2E446973706C61794E616D65FF07000013004974656D735B3336
      395D2E43617465676F72790008000016004974656D735B3336395D2E44697370
      6C61794E616D651804000012004974656D735B33365D2E43617465676F7279E2
      00000015004974656D735B33365D2E446973706C61794E616D65010800001300
      4974656D735B3337305D2E43617465676F72790208000016004974656D735B33
      37305D2E446973706C61794E616D650308000013004974656D735B3337315D2E
      43617465676F72790408000016004974656D735B3337315D2E446973706C6179
      4E616D650508000013004974656D735B3337325D2E43617465676F7279060800
      0016004974656D735B3337325D2E446973706C61794E616D6507080000130049
      74656D735B3337335D2E43617465676F72790808000016004974656D735B3337
      335D2E446973706C61794E616D650908000013004974656D735B3337345D2E43
      617465676F72790A08000016004974656D735B3337345D2E446973706C61794E
      616D650B08000013004974656D735B3337355D2E43617465676F72790C080000
      16004974656D735B3337355D2E446973706C61794E616D650D08000013004974
      656D735B3337365D2E43617465676F72790E08000016004974656D735B333736
      5D2E446973706C61794E616D650F08000013004974656D735B3337375D2E4361
      7465676F72791008000016004974656D735B3337375D2E446973706C61794E61
      6D651108000013004974656D735B3337385D2E43617465676F72791208000016
      004974656D735B3337385D2E446973706C61794E616D65130800001300497465
      6D735B3337395D2E43617465676F72791408000016004974656D735B3337395D
      2E446973706C61794E616D651904000012004974656D735B33375D2E43617465
      676F7279E500000015004974656D735B33375D2E446973706C61794E616D651D
      08000013004974656D735B3338305D2E43617465676F72791E08000016004974
      656D735B3338305D2E446973706C61794E616D651F08000013004974656D735B
      3338315D2E43617465676F72792008000016004974656D735B3338315D2E4469
      73706C61794E616D652108000013004974656D735B3338325D2E43617465676F
      72792208000016004974656D735B3338325D2E446973706C61794E616D652308
      000013004974656D735B3338335D2E43617465676F7279240800001600497465
      6D735B3338335D2E446973706C61794E616D652608000013004974656D735B33
      38345D2E43617465676F72792708000016004974656D735B3338345D2E446973
      706C61794E616D652808000013004974656D735B3338355D2E43617465676F72
      792908000016004974656D735B3338355D2E446973706C61794E616D652A0800
      0013004974656D735B3338365D2E43617465676F72792B08000016004974656D
      735B3338365D2E446973706C61794E616D652C08000013004974656D735B3338
      375D2E43617465676F72792D08000016004974656D735B3338375D2E44697370
      6C61794E616D653208000013004974656D735B3338385D2E43617465676F7279
      3308000016004974656D735B3338385D2E446973706C61794E616D6536080000
      13004974656D735B3338395D2E43617465676F72793708000016004974656D73
      5B3338395D2E446973706C61794E616D651A04000012004974656D735B33385D
      2E43617465676F7279E800000015004974656D735B33385D2E446973706C6179
      4E616D653B08000013004974656D735B3339305D2E43617465676F72793C0800
      0016004974656D735B3339305D2E446973706C61794E616D6540080000130049
      74656D735B3339315D2E43617465676F72794108000016004974656D735B3339
      315D2E446973706C61794E616D654208000013004974656D735B3339325D2E43
      617465676F72794308000016004974656D735B3339325D2E446973706C61794E
      616D654608000013004974656D735B3339335D2E43617465676F727947080000
      16004974656D735B3339335D2E446973706C61794E616D654908000013004974
      656D735B3339345D2E43617465676F72794A08000016004974656D735B333934
      5D2E446973706C61794E616D654D08000013004974656D735B3339355D2E4361
      7465676F72794E08000016004974656D735B3339355D2E446973706C61794E61
      6D655308000013004974656D735B3339365D2E43617465676F72795408000016
      004974656D735B3339365D2E446973706C61794E616D65560800001300497465
      6D735B3339375D2E43617465676F72795708000016004974656D735B3339375D
      2E446973706C61794E616D655808000013004974656D735B3339385D2E436174
      65676F72795908000016004974656D735B3339385D2E446973706C61794E616D
      655A08000013004974656D735B3339395D2E43617465676F72795B0800001600
      4974656D735B3339395D2E446973706C61794E616D651B04000012004974656D
      735B33395D2E43617465676F7279EB00000015004974656D735B33395D2E4469
      73706C61794E616D65F703000011004974656D735B335D2E43617465676F7279
      9100000014004974656D735B335D2E446973706C61794E616D655C0800001300
      4974656D735B3430305D2E43617465676F72795D08000016004974656D735B34
      30305D2E446973706C61794E616D656208000013004974656D735B3430315D2E
      43617465676F72796308000016004974656D735B3430315D2E446973706C6179
      4E616D656608000013004974656D735B3430325D2E43617465676F7279670800
      0016004974656D735B3430325D2E446973706C61794E616D6568080000130049
      74656D735B3430335D2E43617465676F72796908000016004974656D735B3430
      335D2E446973706C61794E616D656A08000013004974656D735B3430345D2E43
      617465676F72796B08000016004974656D735B3430345D2E446973706C61794E
      616D656E08000013004974656D735B3430355D2E43617465676F72796F080000
      16004974656D735B3430355D2E446973706C61794E616D657808000013004974
      656D735B3430365D2E43617465676F72797908000016004974656D735B343036
      5D2E446973706C61794E616D657A08000013004974656D735B3430375D2E4361
      7465676F72797B08000016004974656D735B3430375D2E446973706C61794E61
      6D658208000013004974656D735B3430385D2E43617465676F72798308000016
      004974656D735B3430385D2E446973706C61794E616D65910800001300497465
      6D735B3430395D2E43617465676F72799208000016004974656D735B3430395D
      2E446973706C61794E616D651C04000012004974656D735B34305D2E43617465
      676F7279EE00000015004974656D735B34305D2E446973706C61794E616D6598
      08000013004974656D735B3431305D2E43617465676F72799908000016004974
      656D735B3431305D2E446973706C61794E616D659A08000013004974656D735B
      3431315D2E43617465676F72799B08000016004974656D735B3431315D2E4469
      73706C61794E616D659C08000013004974656D735B3431325D2E43617465676F
      72799D08000016004974656D735B3431325D2E446973706C61794E616D65A208
      000013004974656D735B3431335D2E43617465676F7279A30800001600497465
      6D735B3431335D2E446973706C61794E616D65A608000013004974656D735B34
      31345D2E43617465676F7279A708000016004974656D735B3431345D2E446973
      706C61794E616D65AA08000013004974656D735B3431355D2E43617465676F72
      79AB08000016004974656D735B3431355D2E446973706C61794E616D65AC0800
      0013004974656D735B3431365D2E43617465676F7279AD08000016004974656D
      735B3431365D2E446973706C61794E616D65AE08000013004974656D735B3431
      375D2E43617465676F7279AF08000016004974656D735B3431375D2E44697370
      6C61794E616D65B508000013004974656D735B3431385D2E43617465676F7279
      B608000016004974656D735B3431385D2E446973706C61794E616D65C8080000
      13004974656D735B3431395D2E43617465676F7279C908000016004974656D73
      5B3431395D2E446973706C61794E616D651D04000012004974656D735B34315D
      2E43617465676F7279F100000015004974656D735B34315D2E446973706C6179
      4E616D65CA08000013004974656D735B3432305D2E43617465676F7279CB0800
      0016004974656D735B3432305D2E446973706C61794E616D65CC080000130049
      74656D735B3432315D2E43617465676F7279CD08000016004974656D735B3432
      315D2E446973706C61794E616D65CE08000013004974656D735B3432325D2E43
      617465676F7279CF08000016004974656D735B3432325D2E446973706C61794E
      616D65D708000013004974656D735B3432335D2E43617465676F7279D8080000
      16004974656D735B3432335D2E446973706C61794E616D65E008000013004974
      656D735B3432345D2E43617465676F7279E108000016004974656D735B343234
      5D2E446973706C61794E616D65E408000013004974656D735B3432355D2E4361
      7465676F7279E508000016004974656D735B3432355D2E446973706C61794E61
      6D65EA08000013004974656D735B3432365D2E43617465676F7279EB08000016
      004974656D735B3432365D2E446973706C61794E616D65EF0800001300497465
      6D735B3432375D2E43617465676F7279F008000016004974656D735B3432375D
      2E446973706C61794E616D65F808000013004974656D735B3432385D2E436174
      65676F7279F908000016004974656D735B3432385D2E446973706C61794E616D
      65FA08000013004974656D735B3432395D2E43617465676F7279FB0800001600
      4974656D735B3432395D2E446973706C61794E616D651E04000012004974656D
      735B34325D2E43617465676F7279F400000015004974656D735B34325D2E4469
      73706C61794E616D650109000013004974656D735B3433305D2E43617465676F
      72790209000016004974656D735B3433305D2E446973706C61794E616D650309
      000013004974656D735B3433315D2E43617465676F7279040900001600497465
      6D735B3433315D2E446973706C61794E616D650709000013004974656D735B34
      33325D2E43617465676F72790809000016004974656D735B3433325D2E446973
      706C61794E616D650E09000013004974656D735B3433335D2E43617465676F72
      790F09000016004974656D735B3433335D2E446973706C61794E616D65110900
      0013004974656D735B3433345D2E43617465676F72791209000016004974656D
      735B3433345D2E446973706C61794E616D651509000013004974656D735B3433
      355D2E43617465676F72791609000016004974656D735B3433355D2E44697370
      6C61794E616D652309000013004974656D735B3433365D2E43617465676F7279
      2409000016004974656D735B3433365D2E446973706C61794E616D6525090000
      13004974656D735B3433375D2E43617465676F72792609000016004974656D73
      5B3433375D2E446973706C61794E616D652709000013004974656D735B343338
      5D2E43617465676F72792809000016004974656D735B3433385D2E446973706C
      61794E616D652909000013004974656D735B3433395D2E43617465676F72792A
      09000016004974656D735B3433395D2E446973706C61794E616D651F04000012
      004974656D735B34335D2E43617465676F7279F600000015004974656D735B34
      335D2E446973706C61794E616D652B09000013004974656D735B3434305D2E43
      617465676F72792C09000016004974656D735B3434305D2E446973706C61794E
      616D652D09000013004974656D735B3434315D2E43617465676F72792E090000
      16004974656D735B3434315D2E446973706C61794E616D652F09000013004974
      656D735B3434325D2E43617465676F72793009000016004974656D735B343432
      5D2E446973706C61794E616D653109000013004974656D735B3434335D2E4361
      7465676F72793209000016004974656D735B3434335D2E446973706C61794E61
      6D653309000013004974656D735B3434345D2E43617465676F72793409000016
      004974656D735B3434345D2E446973706C61794E616D65350900001300497465
      6D735B3434355D2E43617465676F72793609000016004974656D735B3434355D
      2E446973706C61794E616D653709000013004974656D735B3434365D2E436174
      65676F72793809000016004974656D735B3434365D2E446973706C61794E616D
      653909000013004974656D735B3434375D2E43617465676F72793A0900001600
      4974656D735B3434375D2E446973706C61794E616D653B09000013004974656D
      735B3434385D2E43617465676F72793C09000016004974656D735B3434385D2E
      446973706C61794E616D653D09000013004974656D735B3434395D2E43617465
      676F72793E09000016004974656D735B3434395D2E446973706C61794E616D65
      2004000012004974656D735B34345D2E43617465676F7279F800000015004974
      656D735B34345D2E446973706C61794E616D654609000013004974656D735B34
      35305D2E43617465676F72794709000016004974656D735B3435305D2E446973
      706C61794E616D654A09000013004974656D735B3435315D2E43617465676F72
      794B09000016004974656D735B3435315D2E446973706C61794E616D654F0900
      0013004974656D735B3435325D2E43617465676F72795009000016004974656D
      735B3435325D2E446973706C61794E616D655109000013004974656D735B3435
      335D2E43617465676F72795209000016004974656D735B3435335D2E44697370
      6C61794E616D655309000013004974656D735B3435345D2E43617465676F7279
      5409000016004974656D735B3435345D2E446973706C61794E616D6557090000
      13004974656D735B3435355D2E43617465676F72795809000016004974656D73
      5B3435355D2E446973706C61794E616D656409000013004974656D735B343536
      5D2E43617465676F72796509000016004974656D735B3435365D2E446973706C
      61794E616D656709000013004974656D735B3435375D2E43617465676F727968
      09000016004974656D735B3435375D2E446973706C61794E616D656909000013
      004974656D735B3435385D2E43617465676F72796A09000016004974656D735B
      3435385D2E446973706C61794E616D656B09000013004974656D735B3435395D
      2E43617465676F72796C09000016004974656D735B3435395D2E446973706C61
      794E616D652104000012004974656D735B34355D2E43617465676F7279FA0000
      0015004974656D735B34355D2E446973706C61794E616D657709000013004974
      656D735B3436305D2E43617465676F72797809000016004974656D735B343630
      5D2E446973706C61794E616D657909000013004974656D735B3436315D2E4361
      7465676F72797A09000016004974656D735B3436315D2E446973706C61794E61
      6D657B09000013004974656D735B3436325D2E43617465676F72797C09000016
      004974656D735B3436325D2E446973706C61794E616D657D0900001300497465
      6D735B3436335D2E43617465676F72797E09000016004974656D735B3436335D
      2E446973706C61794E616D657F09000013004974656D735B3436345D2E436174
      65676F72798009000016004974656D735B3436345D2E446973706C61794E616D
      658109000013004974656D735B3436355D2E43617465676F7279820900001600
      4974656D735B3436355D2E446973706C61794E616D658309000013004974656D
      735B3436365D2E43617465676F72798409000016004974656D735B3436365D2E
      446973706C61794E616D658509000013004974656D735B3436375D2E43617465
      676F72798609000016004974656D735B3436375D2E446973706C61794E616D65
      9409000013004974656D735B3436385D2E43617465676F727995090000160049
      74656D735B3436385D2E446973706C61794E616D659609000013004974656D73
      5B3436395D2E43617465676F72799709000016004974656D735B3436395D2E44
      6973706C61794E616D652204000012004974656D735B34365D2E43617465676F
      7279FC00000015004974656D735B34365D2E446973706C61794E616D65980900
      0013004974656D735B3437305D2E43617465676F72799909000016004974656D
      735B3437305D2E446973706C61794E616D659C09000013004974656D735B3437
      315D2E43617465676F72799D09000016004974656D735B3437315D2E44697370
      6C61794E616D659E09000013004974656D735B3437325D2E43617465676F7279
      9F09000016004974656D735B3437325D2E446973706C61794E616D65A0090000
      13004974656D735B3437335D2E43617465676F7279A109000016004974656D73
      5B3437335D2E446973706C61794E616D65A209000013004974656D735B343734
      5D2E43617465676F7279A309000016004974656D735B3437345D2E446973706C
      61794E616D65A409000013004974656D735B3437355D2E43617465676F7279A5
      09000016004974656D735B3437355D2E446973706C61794E616D65A609000013
      004974656D735B3437365D2E43617465676F7279A709000016004974656D735B
      3437365D2E446973706C61794E616D65A809000013004974656D735B3437375D
      2E43617465676F7279A909000016004974656D735B3437375D2E446973706C61
      794E616D65AA09000013004974656D735B3437385D2E43617465676F7279AB09
      000016004974656D735B3437385D2E446973706C61794E616D65AC0900001300
      4974656D735B3437395D2E43617465676F7279AD09000016004974656D735B34
      37395D2E446973706C61794E616D652304000012004974656D735B34375D2E43
      617465676F7279FE00000015004974656D735B34375D2E446973706C61794E61
      6D65AE09000013004974656D735B3438305D2E43617465676F7279AF09000016
      004974656D735B3438305D2E446973706C61794E616D65B00900001300497465
      6D735B3438315D2E43617465676F7279B109000016004974656D735B3438315D
      2E446973706C61794E616D65B209000013004974656D735B3438325D2E436174
      65676F7279B309000016004974656D735B3438325D2E446973706C61794E616D
      65B409000013004974656D735B3438335D2E43617465676F7279B50900001600
      4974656D735B3438335D2E446973706C61794E616D65B609000013004974656D
      735B3438345D2E43617465676F7279B709000016004974656D735B3438345D2E
      446973706C61794E616D65B809000013004974656D735B3438355D2E43617465
      676F7279B909000016004974656D735B3438355D2E446973706C61794E616D65
      BA09000013004974656D735B3438365D2E43617465676F7279BB090000160049
      74656D735B3438365D2E446973706C61794E616D65C809000013004974656D73
      5B3438375D2E43617465676F7279C909000016004974656D735B3438375D2E44
      6973706C61794E616D65CF09000013004974656D735B3438385D2E4361746567
      6F7279D009000016004974656D735B3438385D2E446973706C61794E616D65D1
      09000013004974656D735B3438395D2E43617465676F7279D209000016004974
      656D735B3438395D2E446973706C61794E616D652404000012004974656D735B
      34385D2E43617465676F72790001000015004974656D735B34385D2E44697370
      6C61794E616D65D309000013004974656D735B3439305D2E43617465676F7279
      D409000016004974656D735B3439305D2E446973706C61794E616D65D5090000
      13004974656D735B3439315D2E43617465676F7279D609000016004974656D73
      5B3439315D2E446973706C61794E616D65D709000013004974656D735B343932
      5D2E43617465676F7279D809000016004974656D735B3439325D2E446973706C
      61794E616D65D909000013004974656D735B3439335D2E43617465676F7279DA
      09000016004974656D735B3439335D2E446973706C61794E616D65DE09000013
      004974656D735B3439345D2E43617465676F7279DF09000016004974656D735B
      3439345D2E446973706C61794E616D65070A000013004974656D735B3439355D
      2E43617465676F7279080A000016004974656D735B3439355D2E446973706C61
      794E616D65090A000013004974656D735B3439365D2E43617465676F72790A0A
      000016004974656D735B3439365D2E446973706C61794E616D650B0A00001300
      4974656D735B3439375D2E43617465676F72790C0A000016004974656D735B34
      39375D2E446973706C61794E616D650D0A000013004974656D735B3439385D2E
      43617465676F72790E0A000016004974656D735B3439385D2E446973706C6179
      4E616D650F0A000013004974656D735B3439395D2E43617465676F7279100A00
      0016004974656D735B3439395D2E446973706C61794E616D6525040000120049
      74656D735B34395D2E43617465676F72790301000015004974656D735B34395D
      2E446973706C61794E616D65F803000011004974656D735B345D2E4361746567
      6F72799400000014004974656D735B345D2E446973706C61794E616D65110A00
      0013004974656D735B3530305D2E43617465676F7279120A000016004974656D
      735B3530305D2E446973706C61794E616D65130A000013004974656D735B3530
      315D2E43617465676F7279140A000016004974656D735B3530315D2E44697370
      6C61794E616D65150A000013004974656D735B3530325D2E43617465676F7279
      160A000016004974656D735B3530325D2E446973706C61794E616D65170A0000
      13004974656D735B3530335D2E43617465676F7279180A000016004974656D73
      5B3530335D2E446973706C61794E616D65190A000013004974656D735B353034
      5D2E43617465676F72791A0A000016004974656D735B3530345D2E446973706C
      61794E616D651B0A000013004974656D735B3530355D2E43617465676F72791C
      0A000016004974656D735B3530355D2E446973706C61794E616D651D0A000013
      004974656D735B3530365D2E43617465676F72791E0A000016004974656D735B
      3530365D2E446973706C61794E616D651F0A000013004974656D735B3530375D
      2E43617465676F7279200A000016004974656D735B3530375D2E446973706C61
      794E616D65210A000013004974656D735B3530385D2E43617465676F7279220A
      000016004974656D735B3530385D2E446973706C61794E616D65230A00001300
      4974656D735B3530395D2E43617465676F7279240A000016004974656D735B35
      30395D2E446973706C61794E616D652604000012004974656D735B35305D2E43
      617465676F72790601000015004974656D735B35305D2E446973706C61794E61
      6D65250A000013004974656D735B3531305D2E43617465676F7279260A000016
      004974656D735B3531305D2E446973706C61794E616D65270A00001300497465
      6D735B3531315D2E43617465676F7279280A000016004974656D735B3531315D
      2E446973706C61794E616D65290A000013004974656D735B3531325D2E436174
      65676F72792A0A000016004974656D735B3531325D2E446973706C61794E616D
      652B0A000013004974656D735B3531335D2E43617465676F72792C0A00001600
      4974656D735B3531335D2E446973706C61794E616D652D0A000013004974656D
      735B3531345D2E43617465676F72792E0A000016004974656D735B3531345D2E
      446973706C61794E616D652F0A000013004974656D735B3531355D2E43617465
      676F7279300A000016004974656D735B3531355D2E446973706C61794E616D65
      310A000013004974656D735B3531365D2E43617465676F7279320A0000160049
      74656D735B3531365D2E446973706C61794E616D65330A000013004974656D73
      5B3531375D2E43617465676F7279340A000016004974656D735B3531375D2E44
      6973706C61794E616D65350A000013004974656D735B3531385D2E4361746567
      6F7279360A000016004974656D735B3531385D2E446973706C61794E616D6537
      0A000013004974656D735B3531395D2E43617465676F7279380A000016004974
      656D735B3531395D2E446973706C61794E616D652704000012004974656D735B
      35315D2E43617465676F72790901000015004974656D735B35315D2E44697370
      6C61794E616D65390A000013004974656D735B3532305D2E43617465676F7279
      3A0A000016004974656D735B3532305D2E446973706C61794E616D653B0A0000
      13004974656D735B3532315D2E43617465676F72793C0A000016004974656D73
      5B3532315D2E446973706C61794E616D653D0A000013004974656D735B353232
      5D2E43617465676F72793E0A000016004974656D735B3532325D2E446973706C
      61794E616D653F0A000013004974656D735B3532335D2E43617465676F727940
      0A000016004974656D735B3532335D2E446973706C61794E616D65410A000013
      004974656D735B3532345D2E43617465676F7279420A000016004974656D735B
      3532345D2E446973706C61794E616D654B0A000013004974656D735B3532355D
      2E43617465676F72794C0A000016004974656D735B3532355D2E446973706C61
      794E616D654D0A000013004974656D735B3532365D2E43617465676F72794E0A
      000016004974656D735B3532365D2E446973706C61794E616D654F0A00001300
      4974656D735B3532375D2E43617465676F7279500A000016004974656D735B35
      32375D2E446973706C61794E616D656E0A000013004974656D735B3532385D2E
      43617465676F72796F0A000016004974656D735B3532385D2E446973706C6179
      4E616D65830A000013004974656D735B3532395D2E43617465676F7279840A00
      0016004974656D735B3532395D2E446973706C61794E616D6528040000120049
      74656D735B35325D2E43617465676F72790C01000015004974656D735B35325D
      2E446973706C61794E616D65850A000013004974656D735B3533305D2E436174
      65676F7279860A000016004974656D735B3533305D2E446973706C61794E616D
      65870A000013004974656D735B3533315D2E43617465676F7279880A00001600
      4974656D735B3533315D2E446973706C61794E616D65910A000013004974656D
      735B3533325D2E43617465676F7279920A000016004974656D735B3533325D2E
      446973706C61794E616D65930A000013004974656D735B3533335D2E43617465
      676F7279940A000016004974656D735B3533335D2E446973706C61794E616D65
      950A000013004974656D735B3533345D2E43617465676F7279960A0000160049
      74656D735B3533345D2E446973706C61794E616D65970A000013004974656D73
      5B3533355D2E43617465676F7279980A000016004974656D735B3533355D2E44
      6973706C61794E616D65990A000013004974656D735B3533365D2E4361746567
      6F72799A0A000016004974656D735B3533365D2E446973706C61794E616D659B
      0A000013004974656D735B3533375D2E43617465676F72799C0A000016004974
      656D735B3533375D2E446973706C61794E616D659D0A000013004974656D735B
      3533385D2E43617465676F72799E0A000016004974656D735B3533385D2E4469
      73706C61794E616D659F0A000013004974656D735B3533395D2E43617465676F
      7279A00A000016004974656D735B3533395D2E446973706C61794E616D652904
      000012004974656D735B35335D2E43617465676F72790F01000015004974656D
      735B35335D2E446973706C61794E616D65A10A000013004974656D735B353430
      5D2E43617465676F7279A20A000016004974656D735B3534305D2E446973706C
      61794E616D65A30A000013004974656D735B3534315D2E43617465676F7279A4
      0A000016004974656D735B3534315D2E446973706C61794E616D65A50A000013
      004974656D735B3534325D2E43617465676F7279A60A000016004974656D735B
      3534325D2E446973706C61794E616D65A70A000013004974656D735B3534335D
      2E43617465676F7279A80A000016004974656D735B3534335D2E446973706C61
      794E616D65A90A000013004974656D735B3534345D2E43617465676F7279AA0A
      000016004974656D735B3534345D2E446973706C61794E616D65AB0A00001300
      4974656D735B3534355D2E43617465676F7279AC0A000016004974656D735B35
      34355D2E446973706C61794E616D65B10A000013004974656D735B3534365D2E
      43617465676F7279B20A000016004974656D735B3534365D2E446973706C6179
      4E616D65B30A000013004974656D735B3534375D2E43617465676F7279B40A00
      0016004974656D735B3534375D2E446973706C61794E616D65B60A0000130049
      74656D735B3534385D2E43617465676F7279B70A000016004974656D735B3534
      385D2E446973706C61794E616D65B80A000013004974656D735B3534395D2E43
      617465676F7279B90A000016004974656D735B3534395D2E446973706C61794E
      616D652A04000012004974656D735B35345D2E43617465676F72791201000015
      004974656D735B35345D2E446973706C61794E616D65BA0A000013004974656D
      735B3535305D2E43617465676F7279BB0A000016004974656D735B3535305D2E
      446973706C61794E616D65BD0A000013004974656D735B3535315D2E43617465
      676F7279BE0A000016004974656D735B3535315D2E446973706C61794E616D65
      C00A000013004974656D735B3535325D2E43617465676F7279C10A0000160049
      74656D735B3535325D2E446973706C61794E616D65C40A000013004974656D73
      5B3535335D2E43617465676F7279C50A000016004974656D735B3535335D2E44
      6973706C61794E616D65CB0A000013004974656D735B3535345D2E4361746567
      6F7279CC0A000016004974656D735B3535345D2E446973706C61794E616D65CD
      0A000013004974656D735B3535355D2E43617465676F7279CE0A000016004974
      656D735B3535355D2E446973706C61794E616D65D70A000013004974656D735B
      3535365D2E43617465676F7279D80A000016004974656D735B3535365D2E4469
      73706C61794E616D65DC0A000013004974656D735B3535375D2E43617465676F
      7279DD0A000016004974656D735B3535375D2E446973706C61794E616D65DF0A
      000013004974656D735B3535385D2E43617465676F7279E00A00001600497465
      6D735B3535385D2E446973706C61794E616D65E10A000013004974656D735B35
      35395D2E43617465676F7279E20A000016004974656D735B3535395D2E446973
      706C61794E616D652B04000012004974656D735B35355D2E43617465676F7279
      1501000015004974656D735B35355D2E446973706C61794E616D65E40A000013
      004974656D735B3536305D2E43617465676F7279E50A000016004974656D735B
      3536305D2E446973706C61794E616D65E60A000013004974656D735B3536315D
      2E43617465676F7279E70A000016004974656D735B3536315D2E446973706C61
      794E616D65E80A000013004974656D735B3536325D2E43617465676F7279E90A
      000016004974656D735B3536325D2E446973706C61794E616D65EA0A00001300
      4974656D735B3536335D2E43617465676F7279EB0A000016004974656D735B35
      36335D2E446973706C61794E616D65ED0A000013004974656D735B3536345D2E
      43617465676F7279EE0A000016004974656D735B3536345D2E446973706C6179
      4E616D65EF0A000013004974656D735B3536355D2E43617465676F7279F00A00
      0016004974656D735B3536355D2E446973706C61794E616D65F10A0000130049
      74656D735B3536365D2E43617465676F7279F20A000016004974656D735B3536
      365D2E446973706C61794E616D65F30A000013004974656D735B3536375D2E43
      617465676F7279F40A000016004974656D735B3536375D2E446973706C61794E
      616D650A0B000013004974656D735B3536385D2E43617465676F72790B0B0000
      16004974656D735B3536385D2E446973706C61794E616D650C0B000013004974
      656D735B3536395D2E43617465676F72790D0B000016004974656D735B353639
      5D2E446973706C61794E616D652C04000012004974656D735B35365D2E436174
      65676F72791801000015004974656D735B35365D2E446973706C61794E616D65
      0E0B000013004974656D735B3537305D2E43617465676F72790F0B0000160049
      74656D735B3537305D2E446973706C61794E616D65150B000013004974656D73
      5B3537315D2E43617465676F7279160B000016004974656D735B3537315D2E44
      6973706C61794E616D65170B000013004974656D735B3537325D2E4361746567
      6F7279180B000016004974656D735B3537325D2E446973706C61794E616D651B
      0B000013004974656D735B3537335D2E43617465676F72791C0B000016004974
      656D735B3537335D2E446973706C61794E616D651D0B000013004974656D735B
      3537345D2E43617465676F72791E0B000016004974656D735B3537345D2E4469
      73706C61794E616D65230B000013004974656D735B3537355D2E43617465676F
      7279240B000016004974656D735B3537355D2E446973706C61794E616D652D04
      000012004974656D735B35375D2E43617465676F72791B01000015004974656D
      735B35375D2E446973706C61794E616D652E04000012004974656D735B35385D
      2E43617465676F72791E01000015004974656D735B35385D2E446973706C6179
      4E616D652F04000012004974656D735B35395D2E43617465676F727921010000
      15004974656D735B35395D2E446973706C61794E616D65F90300001100497465
      6D735B355D2E43617465676F72799600000014004974656D735B355D2E446973
      706C61794E616D653004000012004974656D735B36305D2E43617465676F7279
      2401000015004974656D735B36305D2E446973706C61794E616D653104000012
      004974656D735B36315D2E43617465676F72792701000015004974656D735B36
      315D2E446973706C61794E616D653204000012004974656D735B36325D2E4361
      7465676F72792A01000015004974656D735B36325D2E446973706C61794E616D
      653304000012004974656D735B36335D2E43617465676F72792D010000150049
      74656D735B36335D2E446973706C61794E616D653404000012004974656D735B
      36345D2E43617465676F72793001000015004974656D735B36345D2E44697370
      6C61794E616D653504000012004974656D735B36355D2E43617465676F727933
      01000015004974656D735B36355D2E446973706C61794E616D65360400001200
      4974656D735B36365D2E43617465676F72793601000015004974656D735B3636
      5D2E446973706C61794E616D653704000012004974656D735B36375D2E436174
      65676F72793901000015004974656D735B36375D2E446973706C61794E616D65
      3804000012004974656D735B36385D2E43617465676F72793B01000015004974
      656D735B36385D2E446973706C61794E616D653904000012004974656D735B36
      395D2E43617465676F72793D01000015004974656D735B36395D2E446973706C
      61794E616D65FA03000011004974656D735B365D2E43617465676F7279990000
      0014004974656D735B365D2E446973706C61794E616D653A0400001200497465
      6D735B37305D2E43617465676F72793F01000015004974656D735B37305D2E44
      6973706C61794E616D653B04000012004974656D735B37315D2E43617465676F
      72794101000015004974656D735B37315D2E446973706C61794E616D653C0400
      0012004974656D735B37325D2E43617465676F72794301000015004974656D73
      5B37325D2E446973706C61794E616D653D04000012004974656D735B37335D2E
      43617465676F72794501000015004974656D735B37335D2E446973706C61794E
      616D653E04000012004974656D735B37345D2E43617465676F72794701000015
      004974656D735B37345D2E446973706C61794E616D653F04000012004974656D
      735B37355D2E43617465676F72794901000015004974656D735B37355D2E4469
      73706C61794E616D654004000012004974656D735B37365D2E43617465676F72
      794B01000015004974656D735B37365D2E446973706C61794E616D6541040000
      12004974656D735B37375D2E43617465676F72794D01000015004974656D735B
      37375D2E446973706C61794E616D654204000012004974656D735B37385D2E43
      617465676F72794F01000015004974656D735B37385D2E446973706C61794E61
      6D654304000012004974656D735B37395D2E43617465676F7279510100001500
      4974656D735B37395D2E446973706C61794E616D65FB03000011004974656D73
      5B375D2E43617465676F72799C00000014004974656D735B375D2E446973706C
      61794E616D654404000012004974656D735B38305D2E43617465676F72795301
      000015004974656D735B38305D2E446973706C61794E616D6545040000120049
      74656D735B38315D2E43617465676F72795501000015004974656D735B38315D
      2E446973706C61794E616D654604000012004974656D735B38325D2E43617465
      676F72795701000015004974656D735B38325D2E446973706C61794E616D6547
      04000012004974656D735B38335D2E43617465676F7279590100001500497465
      6D735B38335D2E446973706C61794E616D654804000012004974656D735B3834
      5D2E43617465676F72795B01000015004974656D735B38345D2E446973706C61
      794E616D654904000012004974656D735B38355D2E43617465676F72795D0100
      0015004974656D735B38355D2E446973706C61794E616D654A04000012004974
      656D735B38365D2E43617465676F72795F01000015004974656D735B38365D2E
      446973706C61794E616D654B04000012004974656D735B38375D2E4361746567
      6F72796101000015004974656D735B38375D2E446973706C61794E616D654C04
      000012004974656D735B38385D2E43617465676F72796301000015004974656D
      735B38385D2E446973706C61794E616D654D04000012004974656D735B38395D
      2E43617465676F72796501000015004974656D735B38395D2E446973706C6179
      4E616D65FC03000011004974656D735B385D2E43617465676F72799F00000014
      004974656D735B385D2E446973706C61794E616D654E04000012004974656D73
      5B39305D2E43617465676F72796701000015004974656D735B39305D2E446973
      706C61794E616D654F04000012004974656D735B39315D2E43617465676F7279
      6901000015004974656D735B39315D2E446973706C61794E616D655004000012
      004974656D735B39325D2E43617465676F72796B01000015004974656D735B39
      325D2E446973706C61794E616D655104000012004974656D735B39335D2E4361
      7465676F72796D01000015004974656D735B39335D2E446973706C61794E616D
      655204000012004974656D735B39345D2E43617465676F72796F010000150049
      74656D735B39345D2E446973706C61794E616D655304000012004974656D735B
      39355D2E43617465676F72797101000015004974656D735B39355D2E44697370
      6C61794E616D655404000012004974656D735B39365D2E43617465676F727973
      01000015004974656D735B39365D2E446973706C61794E616D65550400001200
      4974656D735B39375D2E43617465676F72797501000015004974656D735B3937
      5D2E446973706C61794E616D655604000012004974656D735B39385D2E436174
      65676F72797701000015004974656D735B39385D2E446973706C61794E616D65
      5704000012004974656D735B39395D2E43617465676F72797901000015004974
      656D735B39395D2E446973706C61794E616D65FD03000011004974656D735B39
      5D2E43617465676F7279A200000014004974656D735B395D2E446973706C6179
      4E616D6500090054696D65725469636B00000E00506F70757053746174757345
      6E6300001300506F7075705374617475734C696E65456E647300000D00544258
      4974656D456E6457696E00000C005442584974656D456E64556E00000D005442
      584974656D456E644D616300000B00496D674C69737454726565000012005072
      696E74657253657475704469616C6F6700000A0053796E745374796C65730000
      05006563414350000101000000040048696E7400000F00506172616D436F6D70
      6C6574696F6E000101000000040048696E7400000D0054656D706C617465506F
      707570000101000000040048696E7400000B00506F7075704C65786572730000
      0B00656343686172506F707570000101000000040048696E7400000B0054696D
      657252656472617700000D005442584974656D4F546F6F6C730102000000C203
      0000070043617074696F6E18050000040048696E740012005442585365706172
      61746F724974656D323200000E005442584974656D426B436C65617201020000
      00B8030000070043617074696F6EB9030000040048696E7400090054696D6572
      48696E7400001200544258536570617261746F724974656D323600000F005442
      584974656D4D61726B537761700102000000F6040000070043617074696F6E17
      050000040048696E74000F005442584974656D4D61726B436F6C6C0102000000
      F7040000070043617074696F6E16050000040048696E74000F00544258497465
      6D4D61726B44726F700102000000F8040000070043617074696F6E1505000004
      0048696E74000400746251730101000000FA040000070043617074696F6E000D
      005442584974656D46464E65787401020000000B050000070043617074696F6E
      FB040000040048696E74000D005442584974656D46465072657601020000000C
      050000070043617074696F6EFC040000040048696E740016005442585375626D
      656E754974656D546F6F6C626172730101000000FE040000070043617074696F
      6E000A005442584974656D5451730102000000FF040000070043617074696F6E
      1C050000040048696E74000C005442584974656D545669657701020000000005
      0000070043617074696F6E1B050000040048696E74000C005442584974656D54
      45646974010200000001050000070043617074696F6E1A050000040048696E74
      000C005442584974656D5446696C65010200000002050000070043617074696F
      6E19050000040048696E7400060063624361736501020000000D050000070043
      617074696F6E09050000040048696E740004006564517301010000000A050000
      040048696E740010005442436F6E74726F6C4974656D31616100000900544258
      4974656D5173010200000008050000070043617074696F6E1105000004004869
      6E740006006362576F726401020000000E050000070043617074696F6E0F0500
      00040048696E74000F005442584974656D534D61726B416C6C01020000001005
      0000070043617074696F6E14050000040048696E740011005442584974656D48
      656C70546F70696373010200000027050000070043617074696F6E2805000004
      0048696E74000D005442584974656D46436C6F73650102000000290500000700
      43617074696F6E3D050000040048696E740007006163436C6F736500000F0050
      6F707570546162436F6E74657874000015005442584974656D546162436C6F73
      654F746865727301010000002D050000070043617074696F6E000F0054425849
      74656D546162436C6F736501010000002E050000070043617074696F6E000D00
      5442584974656D5461624E657701010000002F050000070043617074696F6E00
      1200544258536570617261746F724974656D323800001100496D6167654C6973
      74436C6F736542746E00000900616353617665416C6C00000F00544258497465
      6D4653617665416C6C010200000033050000070043617074696F6E3C05000004
      0048696E74000A006163436C6F7365416C6C000010005442584974656D46436C
      6F7365416C6C010200000035050000070043617074696F6E3E05000004004869
      6E740016006163436C6F73654F74686572735468697347726F75700000100054
      42584974656D46436C6F73654F7468010200000040050000070043617074696F
      6E41050000040048696E74001200544258536570617261746F724974656D3239
      00000F005442584974656D465365734F70656E01020000004205000007004361
      7074696F6E48050000040048696E740011005442584974656D46536573536176
      654173010200000043050000070043617074696F6E49050000040048696E7400
      0A004F445F53657373696F6E00000A0053445F53657373696F6E000016005442
      585375626D656E754974656D46526563656E747301010000004C050000070043
      617074696F6E001200544258536570617261746F724974656D33300000140054
      42584974656D46436C656172526563656E747301010000004D05000007004361
      7074696F6E0014005462785375626D656E754974656D57696E646F7701010000
      004E050000070043617074696F6E000C005442584974656D4554696D65010200
      000050050000070043617074696F6E53050000040048696E7400110054425853
      75626D656E754974656D52756E010100000054050000070043617074696F6E00
      0C005442584974656D546F6F6C31010100000069050000070043617074696F6E
      000C005442584974656D546F6F6C3201010000006A050000070043617074696F
      6E000C005442584974656D546F6F6C3301010000006B05000007004361707469
      6F6E000C005442584974656D546F6F6C3401010000006C050000070043617074
      696F6E001200544258536570617261746F724974656D33310000110054425849
      74656D52756E46696E64506870010100000059050000070043617074696F6E00
      11005442584974656D52756E4F70656E44697201020000006705000007004361
      7074696F6E68050000040048696E74000C005442584974656D546F6F6C350101
      00000085050000070043617074696F6E000C005442584974656D546F6F6C3601
      0100000086050000070043617074696F6E000C005442584974656D546F6F6C37
      010100000087050000070043617074696F6E000C005442584974656D546F6F6C
      38010100000088050000070043617074696F6E0011005442585375626D656E75
      4974656D456E63010100000089050000070043617074696F6E00120054425853
      75626D656E754C696E65456E647301010000008A050000070043617074696F6E
      000E005442584974656D456E644D57696E00000D005442584974656D456E644D
      556E00000E005442584974656D456E644D4D616300000D005442585375626D65
      6E75456E6301020000008E050000070043617074696F6EA1050000040048696E
      74000E005442585375626D656E75456E63320102000000A00500000700436170
      74696F6EA2050000040048696E7400090054696D65724C6F6164000009006563
      5265706C6163650101000000BD050000040048696E74000B005442584974656D
      535265700102000000AA050000070043617074696F6EAD050000040048696E74
      000C005442584974656D5346696E640102000000AB050000070043617074696F
      6EAC050000040048696E74000600616345786974000010005442584974656D46
      436C6F736544656C0102000000B6050000070043617074696F6EB90500000400
      48696E740010006163436C6F7365416E6444656C657465000010006563526570
      6C616365496E46696C65730101000000BE050000040048696E74001200544258
      4974656D53526570496E46696C65730102000000C0050000070043617074696F
      6EC1050000040048696E7400080054696D657253656C00001500544258537562
      6D656E754974656D4374784D6F72650101000000C4050000070043617074696F
      6E0011005442584974656D437478436F707955726C0102000000C50500000700
      43617074696F6EC6050000040048696E740014005442584974656D437478436F
      7079417070656E640102000000C7050000070043617074696F6EC80500000400
      48696E740013005442584974656D437478437574417070656E640102000000C9
      050000070043617074696F6ECA050000040048696E7400120054425853657061
      7261746F724974656D3334000012005442584974656D437478436F707948544D
      4C0101000000CB050000070043617074696F6E0011005442584974656D437478
      436F70795254460101000000CD050000070043617074696F6E00120054425853
      6570617261746F724974656D333500000E005442584974656D45437574417070
      0102000000DE050000070043617074696F6EDF050000040048696E74000F0054
      42584974656D45436F70794170700102000000E0050000070043617074696F6E
      E1050000040048696E74000C005442584974656D546F6F6C390101000000E405
      0000070043617074696F6E000D005442584974656D546F6F6C31300101000000
      E5050000070043617074696F6E000D005442584974656D546F6F6C3131010100
      0000E6050000070043617074696F6E000D005442584974656D546F6F6C313201
      01000000E7050000070043617074696F6E0011005442584974656D53476F4272
      61636B65740102000000F1050000070043617074696F6EF2050000040048696E
      74000500706C4F75740101000000F3050000070043617074696F6E0101000000
      0700546F6F6C6261720101000000E3090000070043617074696F6E0007004C69
      73744F7574000010005442584974656D5650616E656C4F75740102000000F705
      0000070043617074696F6E470A0000040048696E74000900656353686F774F75
      740101000000F4050000070043617074696F6E000B005442584974656D4F4F75
      740102000000F9050000070043617074696F6EFA050000040048696E74000800
      506F7075704F757400000F005442584974656D4F7574436C6561720101000000
      FC050000070043617074696F6E0011005442584974656D4F7574436F70795365
      6C0101000000FD050000070043617074696F6E000D005442584974656D4F7574
      4E61760101000000FE050000070043617074696F6E0012005442585365706172
      61746F724974656D3138000011005442584974656D4F7574436F7079416C6C01
      01000000FF050000070043617074696F6E001200544258536570617261746F72
      4974656D333200000F00496D6167654C69737453746174757300001000544258
      4974656D4F757444656C53656C010100000004060000070043617074696F6E00
      16005442584974656D4F757444656C4E6F6E7061727365640101000000050600
      00070043617074696F6E000900506F70757046696E6400001200544258497465
      6D5472656546696E644E6176010100000008060000070043617074696F6E0012
      00544258536570617261746F724974656D333600001200544258536570617261
      746F724974656D333700001200616353657475704C657865725374796C657300
      000F005442584974656D4F4C65786572486901020000000E0600000700436170
      74696F6E0F060000040048696E74001200544258536570617261746F72497465
      6D333800000E005442584974656D4F4F4C657853740101000000100600000700
      43617074696F6E000C005442584974656D454578747201020000001206000007
      0043617074696F6E13060000040048696E74001200544258536570617261746F
      724974656D3339000010005442584974656D454361736553656E740102000000
      18060000070043617074696F6E19060000040048696E74000D00544258497465
      6D434353656E7401020000001A060000070043617074696F6E1B060000040048
      696E74000A00656353656E744361736501010000001C06000007004361707469
      6F6E000900506F7075705A6F6F6D00000E005442584974656D5A536574333030
      00000E005442584974656D5A53657432303000000E005442584974656D5A5365
      7431353000000E005442584974656D5A53657431303000000D00544258497465
      6D5A536574373500000D005442584974656D5A536574353000000D0054425849
      74656D5A536574323500000D005442584974656D5A4F74686572010100000025
      060000070043617074696F6E000600706C436C69700001010000000700546F6F
      6C6261720101000000E4090000070043617074696F6E000A00656353686F7743
      6C6970010100000027060000070043617074696F6E0012005442585365706172
      61746F724974656D323500000C005442584974656D4F436C6970010200000028
      060000070043617074696F6E29060000040048696E74000900506F707570436C
      697000000E005442584974656D436C6970436C7201010000002C060000070043
      617074696F6E0014006563476F746F4E65787446696E64526573756C74000014
      006563476F746F5072657646696E64526573756C740000120054425853657061
      7261746F724974656D343000000F005442584974656D53526573507265760102
      0000002D060000070043617074696F6E33060000040048696E74000F00544258
      4974656D535265734E65787401020000002E060000070043617074696F6E3406
      0000040048696E74000E005442584974656D4553796E63456401020000003506
      0000070043617074696F6E36060000040048696E74000E005442584974656D46
      53657341646401020000003B060000070043617074696F6E3C06000004004869
      6E74000900656346756C6C53637200000F005442584974656D4F46756C6C5363
      72010200000041060000070043617074696F6E44060000040048696E74000D00
      54696D6572427261636B65747300001200544258536570617261746F72497465
      6D3431000011005442584974656D546162436F70794469720101000000460600
      00070043617074696F6E0012005442584974656D546162436F707946756C6C01
      0100000047060000070043617074696F6E0010005442584974656D546162436F
      7079464E010100000048060000070043617074696F6E00120054425853657061
      7261746F724974656D343200001200544258536570617261746F724974656D34
      3400000D005442584974656D5653796E63480102000000CB0900000700436170
      74696F6E52060000040048696E74000D005442584974656D5653796E63560102
      000000CC090000070043617074696F6E53060000040048696E74000D00656353
      796E635363726F6C6C4800000D00656353796E635363726F6C6C5600000D0054
      42584974656D4F5368656C6C010200000058060000070043617074696F6E5906
      0000040048696E740012005442585375626D656E754974656D56696577010100
      00005A060000070043617074696F6E000D005442584974656D4F4F6E546F7001
      020000005B060000070043617074696F6E5C060000040048696E740007006563
      4F6E546F70000011005442584974656D4546696C6C426C6F636B01020000005F
      060000070043617074696F6E62060000040048696E74000F005442584974656D
      45496E7354657874010200000063060000070043617074696F6E6B0600000400
      48696E74001200544258536570617261746F724974656D323300001100544258
      4974656D4374784F70656E53656C010100000068060000040048696E74001200
      544258536570617261746F724974656D3435000010005442584974656D437478
      546F6F6C3132000010005442584974656D437478546F6F6C3131000010005442
      584974656D437478546F6F6C313000000F005442584974656D437478546F6F6C
      3900000F005442584974656D437478546F6F6C3800000F005442584974656D43
      7478546F6F6C3700000F005442584974656D437478546F6F6C3600000F005442
      584974656D437478546F6F6C3500000F005442584974656D437478546F6F6C34
      00000F005442584974656D437478546F6F6C3300000F005442584974656D4374
      78546F6F6C3200000F005442584974656D437478546F6F6C3100001200544258
      536570617261746F724974656D313300001200544258536570617261746F7249
      74656D3234000010005442585375626D656E754974656D313001010000006C06
      0000070043617074696F6E0015005442584974656D4F526573746F7265537479
      6C657301020000006D060000070043617074696F6E6E060000040048696E7400
      13005442584974656D437478437573746F6D697A6501010000006F0600000700
      43617074696F6E0011006563546F67676C65466F637573547265650000110065
      63546F67676C65466F637573436C697000000B0065635A656E457870616E6400
      001200544258536570617261746F724974656D34360000090065635A656E5772
      6170000018005442585375626D656E754974656D436F6D6D656E744F70730101
      00000080060000070043617074696F6E000C005442584974656D45436F6D6D01
      0200000081060000070043617074696F6E82060000040048696E74000E005442
      584974656D45556E636F6D6D010200000083060000070043617074696F6E8406
      0000040048696E740019005442584974656D45546F67676C654C696E65436F6D
      6D656E74010200000085060000070043617074696F6E86060000040048696E74
      0013006563546F67676C654C696E65436F6D6D656E74000013006563546F6767
      6C65466F6375734F75747075740000080061634261636B757000001500656354
      6F67676C6553747265616D436F6D6D656E7400001B005442584974656D45546F
      67676C6553747265616D436F6D6D656E7401020000008F060000070043617074
      696F6E90060000040048696E740017005442585375626D656E754974656D496E
      64656E744F7073010100000091060000070043617074696F6E00150054425853
      75626D656E754974656D4C696E654F7073010100000092060000070043617074
      696F6E000E005442584974656D454D6F7665446E010200000093060000070043
      617074696F6E95060000040048696E74000E005442584974656D454D6F766555
      70010200000094060000070043617074696F6E96060000040048696E74001100
      5442584974656D48656C70446F6E617465010200000097060000070043617074
      696F6E98060000040048696E74000D005442584974656D4544656C4C6E010200
      000099060000070043617074696F6E9A060000040048696E7400120054425853
      6570617261746F724974656D3437000015005442585375626D656E754974656D
      436F70794F707301010000009B060000070043617074696F6E00110054425849
      74656D4543704469725061746801010000009C060000070043617074696F6E00
      12005442584974656D45437046756C6C5061746801010000009D060000070043
      617074696F6E000C005442584974656D454370464E01010000009E0600000700
      43617074696F6E0014006563546F67676C65466F63757346696E645265730000
      13005442584974656D54625370656C6C436865636B0102000000A90600000700
      43617074696F6EAA060000040048696E74001200544258536570617261746F72
      4974656D343800000C0065635370656C6C436865636B00000B0065635370656C
      6C4C697665000012005442584974656D54625370656C6C4C6976650102000000
      AB060000070043617074696F6EAC060000040048696E74001200544258497465
      6D565370656C6C436865636B0102000000AE060000070043617074696F6EAF06
      0000040048696E740011005442584974656D565370656C6C4C69766501020000
      00B0060000070043617074696F6EB1060000040048696E740012005442585365
      70617261746F724974656D343900000C005442584974656D454A6F696E010200
      0000B6060000070043617074696F6EB7060000040048696E74000D0054425849
      74656D4553706C69740102000000BC060000070043617074696F6EBD06000004
      0048696E74001200544258536570617261746F724974656D3530000014005442
      585375626D656E754974656D4D6163726F730101000000BE0600000700436170
      74696F6E0010005442584974656D4D6163726F506C61790102000000C7060000
      070043617074696F6ED5060000040048696E740010005442584974656D4D6163
      726F53746F700102000000C9060000070043617074696F6ED306000004004869
      6E740012005442584974656D4D6163726F5265636F72640102000000CB060000
      070043617074696F6ED2060000040048696E740012005442584974656D4D6163
      726F43616E63656C0102000000CD060000070043617074696F6ED40600000400
      48696E74001200544258536570617261746F724974656D353100000F00544258
      4974656D4D6163726F446C670102000000CF060000070043617074696F6ED606
      0000040048696E74000D0061634D6163726F5265636F726400000B0061634D61
      63726F53746F7000000D0061634D6163726F43616E63656C00000B0061634D61
      63726F506C617900000D0061634D6163726F4469616C6F6700000A0065634D61
      63726F526563000012005442584974656D48746D6C5072657669657701020000
      00D8060000070043617074696F6ED9060000040048696E740012005442585365
      70617261746F724974656D35320000080061634D6163726F310000080061634D
      6163726F320000080061634D6163726F330000080061634D6163726F34000008
      0061634D6163726F350000080061634D6163726F360000080061634D6163726F
      370000080061634D6163726F380000080061634D6163726F390000100050726F
      70734D616E616765724B65797300001200544258536570617261746F72497465
      6D353300000D005442584974656D4D6163726F3900000D005442584974656D4D
      6163726F3800000D005442584974656D4D6163726F3700000D00544258497465
      6D4D6163726F3600000D005442584974656D4D6163726F3500000D0054425849
      74656D4D6163726F3400000D005442584974656D4D6163726F3300000D005442
      584974656D4D6163726F3200000D005442584974656D4D6163726F3100000D00
      5442584974656D426B4E6578740102000000EE060000070043617074696F6EF1
      060000040048696E74000D005442584974656D426B507265760102000000EF06
      0000070043617074696F6EF2060000040048696E74000F005442584974656D42
      6B546F67676C650102000000F0060000070043617074696F6EF3060000040048
      696E74000C006563426B436C656172416C6C00000A006563426B546F67676C65
      000008006563426B4E657874000008006563426B5072657600000B006563426B
      496E7665727365000010005442584974656D426B496E76657273650102000000
      FA060000070043617074696F6EFB060000040048696E740008006563426B436F
      7079000007006563426B43757400000A006563426B44656C65746500000E0065
      63426B44656C657465556E6D6B000009006563426B5061737465000010005442
      584974656D426B44656C556E6D6B010200000007070000070043617074696F6E
      0C070000040048696E74000C005442584974656D426B44656C01020000000807
      0000070043617074696F6E0D070000040048696E74000E005442584974656D42
      6B5061737465010200000009070000070043617074696F6E0E07000004004869
      6E74000C005442584974656D426B43757401020000000A070000070043617074
      696F6E0F070000040048696E74000D005442584974656D426B436F7079010200
      00000B070000070043617074696F6E10070000040048696E74000D0054425849
      74656D5462476F746F010200000013070000070043617074696F6E1407000004
      0048696E740006006563476F746F00001200544258536570617261746F724974
      656D3132000010005442584974656D5653796E63566572740102000000170700
      00070043617074696F6E18070000040048696E740010005442584974656D5653
      796E63486F727A010200000019070000070043617074696F6E1A070000040048
      696E740013006563546F67676C65466F63757347726F75707300001200544258
      536570617261746F724974656D353400000F005442584974656D454375744C69
      6E6501020000001D070000070043617074696F6E23070000040048696E740010
      005442584974656D45436F70794C696E6501020000001E070000070043617074
      696F6E24070000040048696E740012005442585375626D656E754974656D5469
      6479010100000025070000070043617074696F6E000E005442584974656D5469
      6479436667010200000026070000070043617074696F6E28070000040048696E
      74000E005442584974656D5469647956616C0102000000270700000700436170
      74696F6E29070000040048696E74001200544258536570617261746F72497465
      6D3535000007004C69737456616C00000D00506F70757056616C696461746500
      000D005442584974656D56616C4E617601010000002F07000007004361707469
      6F6E001200544258536570617261746F724974656D3536000011005442584974
      656D56616C436F707953656C010100000030070000070043617074696F6E0011
      005442584974656D56616C436F7079416C6C0101000000310700000700436170
      74696F6E001200544258536570617261746F724974656D353700000F00544258
      4974656D56616C436C656172010100000032070000070043617074696F6E0015
      006563546F67676C65466F63757356616C696461746500001500544258497465
      6D45446564757041646A6163656E74010100000037070000070043617074696F
      6E0016005442584974656D5462446564757041646A6163656E74010100000039
      070000070043617074696F6E0012005442585375626D656E754974656D536573
      73010100000059070000070043617074696F6E00120054425853657061726174
      6F724974656D353900000E005442584974656D53657373436C7201010000005A
      070000070043617074696F6E000F005442584974656D46536573536176650102
      0000005C070000070043617074696F6E5D070000040048696E74001000544258
      4974656D46536573436C6F736501020000005E070000070043617074696F6E5F
      070000040048696E74000E00656352656D6F7665426C616E6B73000011005442
      584974656D4552656D426C616E6B73010200000064070000070043617074696F
      6E65070000040048696E74000D00656352656D6F76654C696E65730000160054
      42585375626D656E754974656D426C616E6B4F70730101000000660700000700
      43617074696F6E001200544258536570617261746F724974656D363000000F00
      5442584974656D455472696D416C6C010200000067070000070043617074696F
      6E6A070000040048696E740011005442584974656D455472696D547261696C01
      0200000068070000070043617074696F6E6B070000040048696E740010005442
      584974656D455472696D4C656164010200000069070000070043617074696F6E
      6C070000040048696E74000A0065635472696D4C65616400000B006563547269
      6D547261696C0000090065635472696D416C6C00001100656352656D6F766544
      7570537061636573000010005442584974656D4552656D447570537001020000
      0078070000070043617074696F6E79070000040048696E740009006563546162
      546F53700000090065635370546F54616200001200544258536570617261746F
      724974656D363100000F005442584974656D455370546F54616201020000007E
      070000070043617074696F6E7F070000040048696E74000F005442584974656D
      45546162546F5370010200000080070000070043617074696F6E810700000400
      48696E74000E00656346696E64436C69704E65787400000E00656346696E6443
      6C697050726576000016005442585375626D656E754974656D53657373696F6E
      73010100000086070000070043617074696F6E000C00656353706C697435305F
      353000000C00656353706C697434305F363000000C00656353706C697436305F
      343000000C00656353706C697433305F373000000C00656353706C697437305F
      333000000C00656353706C697432305F383000000C00656353706C697438305F
      3230000012005442584974656D4D6163726F5265706561740102000000CD0900
      00070043617074696F6E9D070000040048696E74000D0061634D6163726F5265
      7065617400001200544258536570617261746F724974656D363200000B006563
      526570656174436D64000011005442584974656D45526570656174436D640102
      000000A2070000070043617074696F6EA3070000040048696E74000900544258
      53657057696E00000E005442584974656D57696E465265730101000000A40700
      00070043617074696F6E000D005442584974656D57696E4F75740101000000A5
      070000070043617074696F6E000E005442584974656D57696E436C6970010100
      0000A6070000070043617074696F6E000E005442584974656D57696E54726565
      0101000000A7070000070043617074696F6E000D005442584974656D57696E56
      616C0101000000A8070000070043617074696F6E00090054425853756257696E
      0101000000A9070000070043617074696F6E0010005442584974656D4D61726B
      436C6561720102000000AD070000070043617074696F6EAE070000040048696E
      740010006563546F67676C65466F6375734D617000000D005442584974656D57
      696E4D61700101000000B3070000070043617074696F6E000C00656346696E64
      496E5472656500001000656346696E64496E547265654E657874000010006563
      46696E64496E547265655072657600000A006563547265654E65787400000A00
      6563547265655072657600000E006563526564756365426C616E6B7300001400
      5442584974656D45526564756365426C616E6B730102000000B8070000070043
      617074696F6EB9070000040048696E74000B00656353706C69744C6566740000
      0C00656353706C6974526967687400001400656346696E644E65787457697468
      457874656E6400001400656346696E645072657657697468457874656E640000
      11005442584974656D48656C704B65796D61700102000000E207000007004361
      7074696F6EE3070000040048696E74000C00656346696E64496E4C6973740000
      1000656346696E64496E4C6973744E65787400001000656346696E64496E4C69
      73745072657600000F005442584974656D436C697046696E640101000000E407
      0000070043617074696F6E001200544258536570617261746F724974656D3634
      00001200544258536570617261746F724974656D363500001300544258497465
      6D5472656546696E6446696E640101000000E5070000070043617074696F6E00
      1200544258536570617261746F724974656D363600000E005442584974656D56
      616C46696E640101000000E6070000070043617074696F6E0012005442585365
      70617261746F724974656D363700000E005442584974656D4F757446696E6401
      01000000E7070000070043617074696F6E000900506F7075705472656500000F
      005442584974656D5472656546696E640101000000E807000007004361707469
      6F6E0011005442584974656D54726565457870616E640101000000E907000007
      0043617074696F6E0013005442584974656D54726565436F6C6C617073650101
      000000EA070000070043617074696F6E000D0054696D65724175746F53617665
      00000E005442584974656D4D6163726F323900000E005442584974656D4D6163
      726F323800000E005442584974656D4D6163726F323700000E00544258497465
      6D4D6163726F323600000E005442584974656D4D6163726F323500000E005442
      584974656D4D6163726F323400000E005442584974656D4D6163726F32330000
      0E005442584974656D4D6163726F323200000E005442584974656D4D6163726F
      323100000E005442584974656D4D6163726F323000000E005442584974656D4D
      6163726F313900000E005442584974656D4D6163726F313800000E0054425849
      74656D4D6163726F313700000E005442584974656D4D6163726F313600000E00
      5442584974656D4D6163726F313500000E005442584974656D4D6163726F3134
      00000E005442584974656D4D6163726F313300000E005442584974656D4D6163
      726F313200000E005442584974656D4D6163726F313100000E00544258497465
      6D4D6163726F313000000E005442584974656D4D6163726F3330000009006163
      4D6163726F31300000090061634D6163726F31310000090061634D6163726F31
      320000090061634D6163726F31330000090061634D6163726F31340000090061
      634D6163726F31350000090061634D6163726F31360000090061634D6163726F
      31370000090061634D6163726F31380000090061634D6163726F313900000900
      61634D6163726F32300000090061634D6163726F32310000090061634D616372
      6F32320000090061634D6163726F32330000090061634D6163726F3234000009
      0061634D6163726F32350000090061634D6163726F32360000090061634D6163
      726F32370000090061634D6163726F32380000090061634D6163726F32390000
      090061634D6163726F3330000008005472656546696E64000018005442584974
      656D5472656546696E64436F7079546F54616201010000001508000007004361
      7074696F6E0014005442584974656D5472656546696E64436C65617201010000
      0016080000070043617074696F6E0019005442584974656D5472656546696E64
      436F7079546F436C6970010100000017080000070043617074696F6E00170054
      42584974656D5472656546696E64436F6C6C6170736501010000001808000007
      0043617074696F6E0015005442584974656D5472656546696E64457870616E64
      010100000019080000070043617074696F6E001200544258536570617261746F
      724974656D3639000018005442584974656D5472656546696E64457870616E64
      43757201010000001A080000070043617074696F6E0010005442584974656D43
      747846696E64494401020000001B080000070043617074696F6E1C0800000400
      48696E74000C00656354726565506172656E74000011006563547265654E6578
      7442726F74686572000011006563547265655072657642726F74686572000011
      005442584974656D4D61726B476F4C61737401020000002E0800000700436170
      74696F6E2F080000040048696E740012005442584974656D52756E4F70656E46
      696C65010200000030080000070043617074696F6E31080000040048696E7400
      10005442584974656D5353656C546F6B656E0102000000340800000700436170
      74696F6E35080000040048696E74001D005442584974656D5472656546696E64
      436F7079546F436C69704E6F6465010100000038080000070043617074696F6E
      000D005442584974656D4650726F707301020000003908000007004361707469
      6F6E3A080000040048696E74000700616350726F707300000D006563496E7365
      7274436F6C6F7201010000003D080000070043617074696F6E00130054425849
      74656D48746D6C496E73436F6C6F7201020000003E080000070043617074696F
      6E3F080000040048696E74001200544258536570617261746F724974656D3731
      000013005442584974656D436C6970436F7079546F4564010100000044080000
      070043617074696F6E0015005442584974656D436C6970436F7079546F436C69
      70010100000045080000070043617074696F6E00120054425853657061726174
      6F724974656D37320000170065635265706C61636553656C46726F6D436C6970
      416C6C00000B0061635265726561644F7574000014006563546F67676C65466F
      63757350726F6A65637400000E005442584974656D57696E50726F6A01010000
      0051080000070043617074696F6E000D006563496E73657274496D6167650000
      13005442584974656D48746D6C496E73496D6167650102000000520800000700
      43617074696F6E55080000040048696E740018006563546F67676C65466F6375
      734D6173746572536C61766500000D006563546F67676C65536C617665000013
      005462784974656D52756E46696E6448746D6C3401010000005E080000070043
      617074696F6E0013005462784974656D52756E46696E6448746D6C3501010000
      005F080000070043617074696F6E000700656352756C657200000D0054425849
      74656D4F52756C6572010200000060080000070043617074696F6E6108000004
      0048696E74001400656353706C6974566965777356657274486F727A00001400
      656353706C6974536C61766556657274486F727A000008006563476F746F426B
      00000D005442584974656D426B476F746F01020000006C080000070043617074
      696F6E6D080000040048696E740015005442584974656D48746D6C4C6F72656D
      497073756D010200000070080000070043617074696F6E71080000040048696E
      74000C0065634C6F72656D497073756D000011005442585375626D656E754974
      656D466176010100000072080000070043617074696F6E001100544258497465
      6D46617641646446696C65010200000073080000070043617074696F6E740800
      00040048696E740010005442584974656D4661764D616E616765010200000075
      080000070043617074696F6E76080000040048696E74000C0061634661764164
      6446696C6500000B0061634661764D616E61676500001A005462785375626D65
      6E754974656D526563656E74436F6C6F72730101000000F2080000040048696E
      74001400496D6167654C697374436F6C6F72526563656E740000120054425849
      74656D437478416464436F6C6F7201020000007C080000070043617074696F6E
      7D080000040048696E740011005442584974656D46617641646450726F6A0102
      0000007E080000070043617074696F6E7F080000040048696E74000C00616346
      617641646450726F6A00001200544258536570617261746F724974656D373500
      0013005442584974656D546162416464546F50726F6A01010000008008000007
      0043617074696F6E0012006563546F67676C65466F637573436C69707300000F
      005462784974656D57696E436C69707301010000008408000007004361707469
      6F6E000A00506F707570436C697073000013005442584974656D436C69707341
      646454657874010100000085080000070043617074696F6E0010005442584974
      656D436C69707345646974010100000086080000070043617074696F6E001200
      544258536570617261746F724974656D3736000013005442584974656D436C69
      707341646446696C65010100000087080000070043617074696F6E000F005442
      584974656D436C697073446972010100000088080000070043617074696F6E00
      09004F445F5377617463680000090053445F53776174636800000B0054425854
      6162436F6C6F72000012005442585375626D656E75546162436F6C6F72010100
      00008D080000070043617074696F6E0013005442584974656D546162436F6C6F
      724D69736301010000008E080000070043617074696F6E001200544258536570
      617261746F724974656D3737000012005442584974656D546162436F6C6F7244
      656601010000008F080000070043617074696F6E0013005442584974656D436C
      69707344656C54657874010100000090080000070043617074696F6E00090065
      63536D617274486C000015005442584974656D426B44726F70506F727461626C
      65010200000093080000070043617074696F6E95080000040048696E74001000
      656344726F70506F727461626C65426B00001200544258536570617261746F72
      4974656D3738000010006563476F746F506F727461626C65426B000015005442
      584974656D426B476F746F506F727461626C6501020000009608000007004361
      7074696F6E97080000040048696E74000800616352656E616D6500000E005442
      584974656D4652656E616D6501020000009E080000070043617074696F6E9F08
      0000040048696E740011005442584974656D52756E4E756D436F6E7601020000
      00A0080000070043617074696F6EA1080000040048696E7400120065634E756D
      65726963436F6E76657274657200000F006563496E64656E744C696B65317374
      00001200544258536570617261746F724974656D333300001500544258497465
      6D45496E64656E744C696B653173740102000000A4080000070043617074696F
      6EA5080000040048696E740015005442584974656D56696577436F6C4D61726B
      6572730102000000A8080000070043617074696F6EA9080000040048696E7400
      0F006163436F6C756D6E4D61726B65727300001200544258536570617261746F
      724974656D373900000C00496D6167654C697374467470000008004C69737450
      4C6F6700000F00506F707570506C7567696E734C6F6700001200544258497465
      6D504C6F67436F707953656C0101000000B0080000070043617074696F6E0012
      005442584974656D504C6F67436F7079416C6C0101000000B108000007004361
      7074696F6E001200544258536570617261746F724974656D3831000011005442
      584974656D504C6F6744656C6574650101000000B2080000070043617074696F
      6E0010005442584974656D504C6F67436C6561720101000000B3080000070043
      617074696F6E001200544258536570617261746F724974656D383200000F0054
      42584974656D504C6F6746696E640101000000B4080000070043617074696F6E
      001A005442584974656D43747850617374654E6F4375724368616E6765010200
      0000B7080000070043617074696F6EB8080000040048696E7400120054425853
      6570617261746F724974656D3830000013005442585375626D656E754974656D
      456D6D65740101000000B9080000070043617074696F6E001400544258497465
      6D48746D6C456D6D6574577261700101000000C3080000070043617074696F6E
      0016005442584974656D48746D6C456D6D6574457870616E640101000000C208
      0000070043617074696F6E000900506C7567696E414350000101000000040048
      696E7400000D00656343656E7465724C696E6573000012005442585365706172
      61746F724974656D3833000013005442584974656D4543656E7465724C696E65
      730102000000D0080000070043617074696F6ED1080000040048696E74000800
      4C697374546162730102000000D50800001200436F6C756D6E735B305D2E4361
      7074696F6ED60800001200436F6C756D6E735B315D2E43617074696F6E001100
      6563546F67676C65466F6375735461627300000E005462784974656D57696E54
      6162730101000000D9080000070043617074696F6E0015005442585375626D65
      6E754974656D506C7567696E730101000000DA080000070043617074696F6E00
      1200544258536570617261746F724974656D3834000019005442584974656D4F
      4564697453796E506C7567696E73496E690102000000DB080000070043617074
      696F6EDC080000040048696E740011005442584974656D504C6F675361766541
      730101000000DD080000070043617074696F6E0016005442584974656D546162
      4D6F7665546F57696E646F770101000000DE080000070043617074696F6E0016
      005442584974656D5461624F70656E496E57696E646F770101000000DF080000
      070043617074696F6E0011006563456E636F646548746D6C436861727300000C
      006563536F72744469616C6F67000012005442584974656D45536F7274446961
      6C6F670102000000E6080000070043617074696F6EE7080000040048696E7400
      1200544258536570617261746F724974656D3836000013005442584974656D54
      62536F72744469616C6F670102000000E8080000070043617074696F6EE90800
      00040048696E740013005442584974656D5353656C427261636B657473010200
      0000ED080000070043617074696F6EEE080000040048696E7400110050726F70
      734D616E616765725072696E740000090054696D657254726565000010006563
      436F6C6C61707365506172656E74000014006563436F6C6C6170736557697468
      4E65737465640000100065635370546F5461624C656164696E67000013005442
      584974656D455370546F5461624C6561640102000000FF080000070043617074
      696F6E00090000040048696E740016006563546F67676C654C696E65436F6D6D
      656E74416C7400001C005442584974656D45546F67676C654C696E65436F6D6D
      656E74416C74010200000005090000070043617074696F6E0609000004004869
      6E740018005442584974656D4374785061737465546F436F6C756D6E31010200
      000009090000070043617074696F6E0A090000040048696E74000E006563436F
      6D6D616E64734C697374000016005442584974656D48656C70436F6D6D616E64
      4C69737401020000000D090000070043617074696F6E10090000040048696E74
      000D00656350726F6A6563744C69737400001200544258536570617261746F72
      4974656D3930000017005462785375626D656E754974656D4361726574734F70
      73010100000017090000070043617074696F6E0014005442584974656D436172
      65747352656D6F766532010100000018090000070043617074696F6E00140054
      42584974656D43617265747352656D6F76653101010000001909000007004361
      7074696F6E001200544258536570617261746F724974656D3931000019005442
      584974656D43617265747346726F6D53656C436C65617201010000001A090000
      070043617074696F6E0019005442584974656D43617265747346726F6D53656C
      526967687401010000001B090000070043617074696F6E001800544258497465
      6D43617265747346726F6D53656C4C65667401010000001C0900000700436170
      74696F6E001200544258536570617261746F724974656D393200001700544258
      4974656D436172657473457874446F776E456E6401010000001D090000070043
      617074696F6E0015005442584974656D4361726574734578745570456E640101
      0000001E090000070043617074696F6E0018005442584974656D436172657473
      457874446F776E5061676501010000001F090000070043617074696F6E001600
      5442584974656D43617265747345787455705061676501010000002009000007
      0043617074696F6E0018005442584974656D436172657473457874446F776E4C
      696E65010100000021090000070043617074696F6E0016005442584974656D43
      617265747345787455704C696E65010100000022090000070043617074696F6E
      001200544258536570617261746F724974656D393300001B005442584974656D
      43617265747346726F6D4D61726B73436C65617201010000003F090000070043
      617074696F6E001B005442584974656D43617265747346726F6D4D61726B7352
      69676874010100000040090000070043617074696F6E001A005442584974656D
      43617265747346726F6D4D61726B734C65667401010000004109000007004361
      7074696F6E000E005442584974656D45436F6C756D6E01020000004209000007
      0043617074696F6E43090000040048696E74000C00656345646974436F6C756D
      6E00000A0065634465647570416C6C00000F006563446564757041646A616365
      6E7400001200544258536570617261746F724974656D39340000100054425849
      74656D454465647570416C6C010100000044090000070043617074696F6E0012
      00544258536570617261746F724974656D3835000011005442584974656D5462
      4465647570416C6C010100000045090000070043617074696F6E001200544258
      536570617261746F724974656D3935000014005442584974656D45416C69676E
      57697468536570010200000048090000070043617074696F6E49090000040048
      696E74000E006563416C69676E57697468536570000015005442584974656D54
      6162546F67676C6553706C697401010000004E090000070043617074696F6E00
      12006563546F67676C6553686F7747726F757032000011005442584974656D53
      53656C457874656E64010200000055090000070043617074696F6E5609000004
      0048696E740016005442584974656D54726565436F6C6C61707365416C6C0101
      00000059090000070043617074696F6E0014005442584974656D547265654578
      70616E64416C6C01010000005A090000070043617074696F6E00110054425849
      74656D547265654C6576656C3201010000005B090000070043617074696F6E00
      11005442584974656D547265654C6576656C3501010000005C09000007004361
      7074696F6E0011005442584974656D547265654C6576656C3401010000005D09
      0000070043617074696F6E0011005442584974656D547265654C6576656C3301
      010000005E090000070043617074696F6E001200544258536570617261746F72
      4974656D3936000013005442585375626D656E75547265654C6576656C010100
      00005F090000070043617074696F6E0011005442584974656D547265654C6576
      656C36010100000060090000070043617074696F6E0011005442584974656D54
      7265654C6576656C39010100000061090000070043617074696F6E0011005442
      584974656D547265654C6576656C38010100000062090000070043617074696F
      6E0011005442584974656D547265654C6576656C370101000000630900000700
      43617074696F6E000E006563526576657273654C696E65730000120054425853
      6570617261746F724974656D363800000F005442584974656D45526576657273
      65010100000066090000070043617074696F6E000E00656353687566666C654C
      696E657300000F005442584974656D4553687566666C6501010000006D090000
      070043617074696F6E0007007462557365723101010000008709000007004361
      7074696F6E00070074625573657232010100000088090000070043617074696F
      6E00070074625573657233010100000089090000070043617074696F6E001200
      544258536570617261746F724974656D393700000D005442584974656D545573
      657233010100000093090000070043617074696F6E000D005442584974656D54
      5573657232010100000092090000070043617074696F6E000D00544258497465
      6D545573657231010100000091090000070043617074696F6E00120054425853
      75626D656E75546F6F6C6261727301010000008D090000070043617074696F6E
      0010005442584974656D4F546F6F6C6261723301010000008E09000007004361
      7074696F6E0010005442584974656D4F546F6F6C6261723201010000008F0900
      00070043617074696F6E0010005442584974656D4F546F6F6C62617231010100
      000090090000070043617074696F6E0011006563457874726163744475707343
      61736500001300656345787472616374447570734E6F43617365000011005442
      58536570617261746F724974656D37000018005442584974656D454578747261
      63744475704E6F4361736501010000009A090000070043617074696F6E001600
      5442584974656D45457874726163744475704361736501010000009B09000007
      0043617074696F6E000D0065634E6F6E5072696E744F66660000100065634E6F
      6E5072696E7453706163657300000D0065634E6F6E5072696E74456F6C00000E
      0065634E6F6E5072696E74426F7468000016005442585375626D656E75497465
      6D4E6F6E5072696E740101000000BC090000070043617074696F6E0012005442
      58536570617261746F724974656D3938000011005442584974656D4F4E507269
      6E74416C6C0101000000BD090000070043617074696F6E001100544258497465
      6D4F4E5072696E74456F6C0101000000BE090000070043617074696F6E001400
      5442584974656D4F4E5072696E745370616365730101000000BF090000070043
      617074696F6E000C00506F7075705573657254423100000E005442584974656D
      557365725462310101000000C1090000070043617074696F6E000C00506F7075
      705573657254423200000E005442584974656D557365725442320101000000C2
      090000070043617074696F6E000C00506F7075705573657254423300000E0054
      42584974656D557365725442330101000000C3090000070043617074696F6E00
      18005442584974656D4374785061737465426B6D6B4C696E65730101000000C5
      090000070043617074696F6E0017005442584974656D43747850617374654173
      436F6C756D6E0101000000C6090000070043617074696F6E0012005442585365
      70617261746F724974656D3939000018005442584974656D4F4E5072696E7445
      6F6C44657461696C730101000000C7090000070043617074696F6E0014006563
      4E6F6E5072696E74456F6C44657461696C73000011005442584974656D4F4869
      64654974656D730102000000CA090000070043617074696F6ECE090000040048
      696E74001300544258536570617261746F724974656D31303000001200544258
      4974656D4F4564697453796E496E690102000000DB090000070043617074696F
      6EDC090000040048696E7400110061634F70656E427953656C656374696F6E00
      000E00496D6167654C697374557365723100000E00496D6167654C6973745573
      65723200000E00496D6167654C697374557365723300000C00544258446F636B
      4C6566743100000D00544258446F636B52696768743100000E00544258446F63
      6B426F74746F6D3100000C0053706C69747465724C65667400000D0053706C69
      74746572526967687400000E0053706C6974746572426F74746F6D00000F0053
      74617475734974656D4C657865720101000000F3090000040048696E74000E00
      5374617475734974656D456E64730101000000F2090000040048696E74000D00
      5374617475734974656D456E630101000000F1090000040048696E74000F0053
      74617475734974656D4361726574000013005370544258536570617261746F72
      4974656D31000013005370544258536570617261746F724974656D3200001300
      5370544258536570617261746F724974656D3300001300537054425853657061
      7261746F724974656D3400000E005374617475734974656D4368617201010000
      00F4090000040048696E740013005370544258536570617261746F724974656D
      3500000C005374617475734974656D524F0101000000F5090000040048696E74
      0013005370544258536570617261746F724974656D3600000E00537461747573
      4974656D577261700101000000F6090000040048696E74001300537054425853
      6570617261746F724974656D37000011005374617475734974656D53656C4D6F
      64650101000000F7090000040048696E74001300537054425853657061726174
      6F724974656D38000011005374617475734974656D496E734D6F646501020000
      00EF090000070043617074696F6EF8090000040048696E740013005370544258
      536570617261746F724974656D3900000E005374617475734974656D5A6F6F6D
      0102000000F0090000070043617074696F6EF9090000040048696E7400140053
      70544258536570617261746F724974656D313000000E00537461747573497465
      6D42757379000014005370544258536570617261746F724974656D313100000E
      005374617475734974656D48696E74000016005442584D52554C697374497465
      6D46526563656E7473000013005442584D52554C6973744974656D5F53657373
      000014005370544258536570617261746F724974656D31320000140053705442
      58536570617261746F724974656D313300001400537054425853657061726174
      6F724974656D3134000012005442584D52554C6973744974656D464E65770000
      11005462784974656D5650616E656C436C69700102000000430A000007004361
      7074696F6E480A0000040048696E740011005442585375626D656E754D61726B
      6572730101000000510A0000070043617074696F6E000F005442585375626D65
      6E75426B4F70730101000000520A0000070043617074696F6E00140054425853
      75626D656E75426B506F727461626C650101000000530A000007004361707469
      6F6E0014005370544258536570617261746F724974656D313600001200544258
      5375626D656E754974656D48544D4C0101000000550A0000070043617074696F
      6E0014005370544258536570617261746F724974656D313900000E00506F7075
      70466F6C644C6576656C000014005370544258536570617261746F724974656D
      3233000010005442584974656D556E666F6C64416C6C0101000000590A000007
      0043617074696F6E000E005442584974656D466F6C64416C6C01010000005A0A
      0000070043617074696F6E001200544258536570617261746F724974656D3837
      000011005442584974656D556E666F6C644C696E6501010000005B0A00000700
      43617074696F6E0017005442584974656D466F6C644E656172657374426C6F63
      6B01010000005C0A0000070043617074696F6E0013005442584974656D466F6C
      6453656C426C6F636B01010000005D0A0000070043617074696F6E0012005442
      58536570617261746F724974656D3839000016005442584974656D466F6C6452
      616E676573496E53656C01010000005E0A0000070043617074696F6E00180054
      42584974656D556E666F6C6452616E676573496E53656C01010000005F0A0000
      070043617074696F6E001200544258536570617261746F724974656D38380000
      11005442584974656D466F6C64506172656E740101000000600A000007004361
      7074696F6E0015005442584974656D466F6C64576974684E6573746564010100
      0000610A0000070043617074696F6E0013005442585375626D656E75466F6C64
      4C6576656C0101000000620A0000070043617074696F6E001100544258497465
      6D466F6C644C6576656C320101000000630A0000070043617074696F6E001100
      5442584974656D466F6C644C6576656C330101000000640A0000070043617074
      696F6E0011005442584974656D466F6C644C6576656C340101000000650A0000
      070043617074696F6E0011005442584974656D466F6C644C6576656C35010100
      0000660A0000070043617074696F6E0011005442584974656D466F6C644C6576
      656C360101000000670A0000070043617074696F6E0011005442584974656D46
      6F6C644C6576656C370101000000680A0000070043617074696F6E0011005442
      584974656D466F6C644C6576656C380101000000690A0000070043617074696F
      6E0011005442584974656D466F6C644C6576656C3901010000006A0A00000700
      43617074696F6E0010005462784974656D54616252656C6F616401010000006B
      0A0000070043617074696F6E0012005442585375626D656E7548746D6C48656C
      7001010000006C0A0000070043617074696F6E0014005442584974656D48746D
      6C456D6D657448656C7001010000006D0A0000070043617074696F6E00140053
      70544258536570617261746F724974656D313700000C0054696D65724D696E69
      6D6170000012005442585375626D656E754974656D436F6E760101000000700A
      0000070043617074696F6E0018005442585375626D656E754974656D48746D6C
      456E636F64650101000000710A0000070043617074696F6E001B005442584974
      656D456E636F646548746D6C4E6F427261636B6574730101000000720A000007
      0043617074696F6E0014005442584974656D456E636F646548746D6C416C6C01
      01000000730A0000070043617074696F6E0012006563456E636F646548746D6C
      436861727332000014005370544258536570617261746F724974656D31380000
      13005442585375626D656E754974656D5072696E740101000000740A00000700
      43617074696F6E000D005462784974656D4D656E75585801020000007F0A0000
      070043617074696F6E800A0000040048696E74000C005462784974656D4D656E
      75580102000000810A0000070043617074696F6E820A0000040048696E740016
      005442585375626D656E754974656D50726F6A656374730101000000890A0000
      070043617074696F6E0012005442584974656D50726F6A41646446696C650101
      0000008B0A0000070043617074696F6E000F005442584974656D50726F6A4F70
      656E01010000008C0A0000070043617074696F6E0019005442585375626D656E
      754974656D50726F6A526563656E747301010000008D0A000007004361707469
      6F6E0017005442584D52554C6973744974656D5F50726F6A6563747300001400
      5370544258536570617261746F724974656D3234000016005442584974656D50
      726F6A526563656E74436C65617201010000008E0A0000070043617074696F6E
      0014005370544258536570617261746F724974656D323100000F005442584974
      656D50726F6A476F746F01010000008F0A0000070043617074696F6E000E0054
      42584974656D50726F6A4E65770101000000900A0000070043617074696F6E00
      0D005442584974656D546F6F6C31360101000000AD0A0000070043617074696F
      6E000D005442584974656D546F6F6C31350101000000AE0A0000070043617074
      696F6E000D005442584974656D546F6F6C31340101000000AF0A000007004361
      7074696F6E000D005442584974656D546F6F6C31330101000000B00A00000700
      43617074696F6E0010005462784974656D437478546F6F6C3136000010005462
      784974656D437478546F6F6C3135000010005462784974656D437478546F6F6C
      3134000010005462784974656D437478546F6F6C313300001600544258497465
      6D50726F6A416464416C6C46696C65730101000000B50A000007004361707469
      6F6E000F005462784974656D50726F6A536176650101000000BC0A0000070043
      617074696F6E0014005370544258536570617261746F724974656D3232000009
      00706C436F6E736F6C65000009006564436F6E736F6C65000014006563546F67
      676C65466F637573436F6E736F6C65000011005442584974656D57696E436F6E
      736F6C650101000000C20A0000070043617074696F6E001500507974686F6E47
      5549496E7075744F75747075743100000D00507974686F6E456E67696E653100
      000B004D656D6F436F6E736F6C6500000C00507974686F6E4D6F64756C650000
      14005370544258536570617261746F724974656D323500001300546278497465
      6D52756E4E6577506C7567696E0102000000C30A0000070043617074696F6EC8
      0A0000040048696E740010005462784974656D48656C70507944697201020000
      00C60A0000070043617074696F6EC70A0000040048696E740012005462784974
      656D52756E536E6970706574730102000000C90A0000070043617074696F6ED0
      0A0000040048696E740014005370544258536570617261746F724974656D3236
      000014005462784974656D52756E4E6577536E69707065740102000000CA0A00
      00070043617074696F6ECF0A0000040048696E74000B0053445F536E69707065
      7473000014005370544258536570617261746F724974656D3237000011005374
      617475734974656D54616273697A650101000000D10A0000040048696E740011
      005462784974656D54726565536F727465640101000000D20A00000700436170
      74696F6E000F00436F6C6F724469616C6F675461627300000F00506F70757050
      616E656C5469746C65000014005462784974656D50616E656C5469746C654261
      720101000000D30A0000070043617074696F6E001A005462784974656D50616E
      656C5469746C6553686F7752696768740101000000D40A000007004361707469
      6F6E0018005462784974656D50616E656C5469746C6553686F774F7574010100
      0000D50A0000070043617074696F6E0019005462784974656D50616E656C5469
      746C6553686F774C6566740101000000D60A0000070043617074696F6E001400
      5370544258536570617261746F724974656D3238000014005370544258536570
      617261746F724974656D3239000010005462784974656D57696E53706C697456
      0101000000DA0A0000070043617074696F6E0010005462784974656D57696E53
      706C6974480101000000DB0A0000070043617074696F6E001100546278497465
      6D57696E50726F6A5072650101000000DE0A0000070043617074696F6E001300
      6563546F67676C6550726F6A50726576696577000018005462785375626D656E
      754974656D437478506C7567696E730101000000E30A0000070043617074696F
      6E0017005462785375626D656E754974656D50726F6A546F6F6C730101000000
      EC0A0000070043617074696F6E001200506F7075705072657669657745646974
      6F72000010005462784974656D50726553656C65637400000E00546278497465
      6D507265436F7079000014005370544258536570617261746F724974656D3330
      000013005462784974656D5072655A6F6F6D4F74686572000011005462784974
      656D5072655A6F6F6D313030000010005462784974656D5072655A6F6F6D3735
      000010005462784974656D5072655A6F6F6D3530000010005462784974656D50
      72655A6F6F6D323500000E005462784974656D50726545646974000014005370
      544258536570617261746F724974656D3331000014005442585375626D656E75
      4974656D47726F7570730101000000F50A0000040048696E74000E0054627849
      74656D47726F757032480101000000F60A0000070043617074696F6E000E0054
      62784974656D47726F757032560101000000F70A0000070043617074696F6E00
      0F005462784974656D47726F75704F6E650101000000F80A0000070043617074
      696F6E000E005462784974656D47726F757033480101000000F90A0000070043
      617074696F6E000E005462784974656D47726F757033560101000000FA0A0000
      070043617074696F6E0011005462784974656D47726F75703647726964010100
      0000FB0A0000070043617074696F6E0011005462784974656D47726F75703447
      7269640101000000FC0A0000070043617074696F6E000E005462784974656D47
      726F757034560101000000FD0A0000070043617074696F6E000E005462784974
      656D47726F757034480101000000FE0A0000070043617074696F6E0012005462
      784974656D47726F75703361733170320101000000FF0A000007004361707469
      6F6E0015005442585375626D656E754974656D546F47726F7570010100000000
      0B0000070043617074696F6E0012005462784974656D546F47726F7570507265
      760101000000070B0000070043617074696F6E0012005462784974656D546F47
      726F75704E6578740101000000080B0000070043617074696F6E000F00546278
      4974656D546F47726F7570360101000000010B0000070043617074696F6E000F
      005462784974656D546F47726F7570350101000000020B000007004361707469
      6F6E000F005462784974656D546F47726F7570340101000000030B0000070043
      617074696F6E000F005462784974656D546F47726F7570330101000000040B00
      00070043617074696F6E000F005462784974656D546F47726F75703201010000
      00050B0000070043617074696F6E000F005462784974656D546F47726F757031
      0101000000060B0000070043617074696F6E0014005370544258536570617261
      746F724974656D323000001E005442584974656D546162436C6F73654F746865
      7273416C6C47726F7570730101000000090B0000070043617074696F6E001600
      6163436C6F73654F7468657273416C6C47726F75707300000D004C697374426F
      6F6B6D61726B730103000000110B00001200436F6C756D6E735B305D2E436170
      74696F6E120B00001200436F6C756D6E735B315D2E43617074696F6E130B0000
      1200436F6C756D6E735B325D2E43617074696F6E000E005462784974656D5769
      6E426B6D6B0101000000140B0000070043617074696F6E0016006563546F6767
      6C65466F637573426F6F6B6D61726B7300000E00496D6167654C69737449636F
      6E7300000D005462784974656D57696E4674700101000000190B000007004361
      7074696F6E0012005462784974656D57696E4578706C6F72657201010000001A
      0B0000070043617074696F6E0016005442584974656D546162436C6F73655269
      676874657201010000001F0B0000070043617074696F6E001500544258497465
      6D546162436C6F73654C65667465720101000000200B0000070043617074696F
      6E00120065635265706C616365496E50726F6A65637400001400546278497465
      6D53526570496E50726F6A6563740102000000210B0000070043617074696F6E
      220B0000040048696E74001200656350726576696577416374696F6E4E657700
      000F00616353657475704C657865724E65770000140065635061676553657475
      70416374696F6E4E65770000}
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
    AllocBy = 50
    Height = 22
    Width = 22
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002B04944415478DAA595CF6B134114C7BFF3667793B82B1502B1072F5E
          BC79113CF43F2842153C79133C6A6BA9F622A8878A37ABD0EAB9527B50114445
          503C2988073DD4433D148D84E687242951528DD064D7373FB269DD92B674C8EC
          CCBE99FDBC79DF373311D863897E1E11DCB85CD7C581E5A86B17DDCEC4E5B129
          6EAEED064AD4C160F6370E1FFA05474668B5E8FE99D34B17D8C19F8DE0E8F6AD
          995DAE7711F8FB9897ADFA3EAA2B9F903BB87C16683F4A800B85025CD7451445
          1042E8AA43E39688ECEC102991C77E7A084A05407A147006D15E7B02279C7985
          A8369900178B4548293578935ECA89EA096207EBC8D06704F229847714D837AA
          EDEDB5170CBEF90E51E34A025C2A9562B0862B1644BC621340088FBEC3A7D770
          A802A48601EF18D6EAD308526FEEF1F8DD04B85C2EC3711C6DEB743A1624A154
          D0B228073A8275B8B482343EB29325060FE0C3FB450C1DCF0FF1E89704B852A9
          C41A2B30298C851ABDB995DACACE426E5B5C7FC01F48616A6A16D7C7DFFA3CD4
          4A80E717E6706278C4A4280C3588A89740E54549A26CD60F88F50D82009726C7
          7067DAA8900057AB55E47239ACAEAE228C423DC1008D1CEA41E845206C52FDC0
          67F04506CF6E0DAED56A764584B0139A152994D3039A1D02ABBF49A8EF6F03AE
          D7EB7A572870BBDDD6AB34FB9712FB5A3BE031C9EFE94C667BB04A9E15D900AD
          9E826CF262AD0D80A480E7A5FB831F2CCCE3E4C829FDB13E7D5D106DDCCF8823
          204BF75CAF3F58252D9BCDA2D96CF21D109970BBA74E1ABD559F640FAE30AEEB
          F407371A0DADB1B00982D552C6F704F7256DD69AC71CAE3B070B9371C394F1C1
          D0A7CF7EAE2D52BD8BEDC1DD234DDCEAC0ED2C9246865816E538B239E0DF8EC1
          0EEBA6F524B2379B882350D120766A307DC17B295B82C727CEDF209257F702FE
          F6357FEEF9B397739BC0FF15B10BDEC612FF3BFC03ED781C47D6453B6A000000
          0049454E44AE426082}
        Name = 'PngImage13'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003D74944415478DAA5D57B4C5B551C07F0EFBDB70F6C21C5CE0569E726
          E9C21F4B86FC0526C647420D32A32E8B316AFF9946F10F27947660DCFE3118E3
          7C44B3CC98CC2064EEA102CE65433370D36E38544CA44E6666D3762B65A1BC5A
          0B5CEE6DEFCB736E4A43D97476FED29B9E737BCFE7FCCEEB96F1783CF8B7B812
          0B8B0CC3709AA6912F46BFC730AC5E309BCC7FF24BC2832E976B766D3B86C291
          4884ABAAAA2ABB111C8B475381EF8641517AB12C8B950E0E1CD88FBEE3FD310E
          861AA7D3B9701D6CB158FE200FBB485D5B0B5FBC1434F7741D82288A7A9D640E
          5996A1AA2AEAEBEBD1D9F9BA16387FEE92C08B752473A100361A8D5A6B6BABDE
          8036A48D68288A027F471B3EED39825303A70A3A743734A0A6E61EBDFCD6BE37
          B5D343839FDCE5D8F862014C422530138D46759C8214A79D74751FC467477BF3
          D9EA0FE73AB65AAD90240953535378F5B5F685CA0AA7AD002690E2F57AD97038
          9C1FE60A7EE87037FA7BBF426FFF175064259FF1E38F3D01B3D9AC97A767A6D1
          DEE15B72566E2C2B8045519009CC45225164B2246302AA8AAA67D3F7E5E7043E
          0E3597ADA66A05D96B9A8A54EA2FB478772DC48CDB2B62D5E1AC27955275389D
          4ECB6D6D6DDC995FA2F8784402C772F9CC28C8316CBEAEAD59DF5C3F64747434
          AC4236C1ECFCC966870ECFCDCD493E9FCF702C70154AF966781AB7425BD53EB7
          BB6E18AB7F5ACAC8687EE384D264BB60D0E144229125191B7BCE4EA2D2B515B5
          5B362036C3A398B8CD64C09DE52674EC1F4C37969E2FD7E1783C9E21199B3EFA
          3681BABA3ADCBD611DAE2585A2607A70EC16169D07BF9F705B039B564E9EE8F7
          FBCC1F0CA5B0E391FB61B35931BB90FDCFE8A220C16236C06A50F0CEE11F7E6B
          2809D4EA70281412C85494EC3BBD885D9E06309C1129FEE6B0A268E04519A2A4
          C2612FC132BF8C0FFB7E3E4B60B70E8F8F8F0B7EBFBFA4F31B011DCFB9915519
          2C679502807CF4AD45CF06AD6708A6AC5A610A5F4B2471E4EBE031B7F59C4787
          83C1204F60CBDE9359EC697623BDAC6249944863E53AE09F82C2972353181C09
          BDD75436DCAEC3A3A3A3BC7FF76ECB9E0105AF3CFB10AECCF290959B63ABA3A2
          DC8C8B97E3D2AFBFC7F66EBB7DE4DD1578F1A597BDA5EF0F1BB0A3E95ECC2F66
          8A4269D82C26FC3816E62726675AB6D92E74E7E1679E6F291D8AAF43E303B590
          722F99628223A7E8E8C0583A994CEF7CD43E72821E1C4375757572CBC32F9405
          E7EDB863BDBD6894864C16363E312788C9E9FBB66F0A8D51D8EA7038BA94CD4F
          3F992DAD32DC920A86BC933459484D06323FBDFD14B991A6B0912E2AB9D6D3EC
          6F0DD683CE1FFD7BBA4AA657A430BDB81CCAFC0F58CBE11281B5BF019B0EFB7B
          234C1D4F0000000049454E44AE426082}
        Name = 'PngImage14'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000004104944415478DAADD37B4C5B551C07F0EF6DE9FB456B6743DB958508
          962E284C11A22E2ECEB885648A2EEB8831B0A999D1297B908C4C84D90DC53919
          5BF6D0CDA0C6440467D9BAA97323CC686064CBE4D14155BAA1B4E94A69278EB6
          A1A58FEBBD97B4C29A4D4CF8FD73CF3D8FCFF9DD737F87C0AC28AD2C6FB64F66
          96BAC7C38AD9FD226E3CA896DDB269257DDBCC87AF74631E41241AA626637EF3
          45FDE59CBCFC708E56C3FA7B9AC55F922E648DDE0AC31B9C82CF7A7224E09FE2
          E995FDD5A78F757F392F98464F0EE8CCEAFCE774B6BE2ED674384C44431142BA
          6811B2721F8252C843304AE2F7C15F3079C33EF588B66BEDA9A397CEFE27BCE2
          950DE714CA8CB4F1BFC2AA6CC5D0BB9FBD7FEEAB8A1DCB57FF78BDB08DABD049
          B45979CCBC68240CDF8D3FE29363F6C00A6D87BAE5F050F0AEF0D2B2CDD70D5A
          0C14E85C9BDFAA3CE54E0C96EF28ADFA6138EF43EDFD06707942A4A571C0E58B
          3139D83228E5797B2F7C62AEB82BFCF8C6B2D37AC1B475C21BAB993DC8171138
          3B9E839C871F9BB34819ECC598CB89CCD8CDDBBD6AF309CB0749B862FBEAD7C2
          1EDED1E6E32D293B2F5E674A81852219FA7FFA1ECE13BBE6F4976F7801144C24
          E1B5EB9E7D2A2323A3A3B6C604B1580CBFDF9F9C6C78693F034F05FD1088244C
          9F54AEC2958E76D83EDDCEBC7B7C1EA8942AD4BFF70EDC6E770185F727E0570B
          0B8B3EDE58F132E2641C528994C93411B7C3629912BD9D1670F83C4442615C3E
          B409629118C78E1F81F5AA753D057F9D80BFDB5A5955A2D16821140A9399E63F
          513273D602215CA3C320D86CF0F9333F91205860B3D360ED3A9FCC7C64E41A1A
          9BF6D553706D02269B1A0F211A8D266187DB8E357BCE6369D14A8C8F8D824D10
          889124D82C3662F118E40A1586FBBAF14DF57264673E305309D49CD7DFD8C49C
          3341A1F92291B86FDFDEFD29E7FBDB9F03787E772793398DD3416F2095DF8BA1
          9E0B68AF5B09FD9207997E8944824020803A532D7C5E4F010D1B73B273DBB66E
          D986502804A552C94C0C068388C7E373F09B1E470A4A8374F87C3EEA98F83870
          B009C3F65FD7D3F09E32E38B6F171717936C2A9D588C64C0C40674D8AEF562D5
          CE330C3E74A913DFEE7A1A86FB962541E6564623D43A92ECE9B94858CEB41F20
          4AD6ACB2D4D5989E31180C989898B8E3DDB73BAEC2D8F033CC354F224B9B3B67
          8C46E9C255C8EF81CD66437DC3EE663A63F28BCF5BB090415F1406DEDBD0088F
          C773C78924550DF31DA32E1AAA7756FD0B3B1C0EA8542AB4B6B682C7E3412A13
          43269553B5CA664A90C562314F994C06AFD70B8D460397CB95F2D4EBF5A9B042
          A180C5626110B95C0E0E87C3C0745B201030EDF4F4F4FF073B9D4E70B95CAACC
          02D4CF8831482412497E220D33D799AAF579C35BDEAC22D56A35810508EACBC9
          231F1D2488C2A265469D6E71DB425685C3E17CF41F2163D5330EAB3C83000000
          0049454E44AE426082}
        Name = 'PngImage15'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003414944415478DAAD954B481B511486CF8DD144B16A82212A18852082
          BA11A48BAE4A17225D14A182AE5CF922A25211450C89961845AA96AA352E8A20
          B8F0B1282E2D5DE8A60BB5D2104B0DA63E10D4F8D6C4A63E929E7361A6C9A451
          0B9ECD64EECCFDEE79FCFF8441500C0C0C183C1E4FF1D1D1913A783D2626C61B
          1F1FFF5DA954BEC2F0C13D8205DF984CA62F7ABDFE774A4A8AECF2F252999494
          243B3D3D05AFD70BEBEBEB3F2F2E2E140909092D4D4D4D3FEE0DEEEAEA9ACCCA
          CAD2ADAEAE12945D5D5DB1C4C444C8CCCC84B8B838B8BEBE0697CB05878787BF
          341ACDCBC6C646F79DE09E9E1EAB4AA59263765ACCA8B3AAAACA69B3D934DBDB
          DB138F30D2D2D2F87B373737B0BFBFEF3F3E3EF658ADD66777823B3A3A26B1FC
          6FD5D5D59DC10F4746469E6E6E6EBE494F4F87E8E86890CBE5D46FD8D8D870E0
          EFAFCDCDCDEF6E057777779B3131FBD9D9595BF0438542013B3B3B909D9D1DB2
          89DAE276BBF9619268696D6DFD2C828787871FA31ADED7D7D7879D6C341AC3C0
          D4F3E5E565B0582C21EB7D7D7D80E002118C83532527277F2A2F2F8F08F6F97C
          8072E36B380758585810C1E7E7E78015C3D8D81854565686800B7272726C4545
          45214021A460D4342C2D2DF17EA382C06C36F3B6CCCCCCC0DADA5A2966ED12C0
          AFCBCACA9E6BB55A888A8A12C1F9F9F921BD96C9641C4643648CF17BBBDD2E66
          BEB7B707E3E3E316047F14C08BA84B2E27018CEE83C1C141C8CDCD858383030E
          0A04021CE6F7FB8134EE743A0195049490B4CF1CDCDFDFBF683018C2FA4B590E
          0D0DF1CC09CE7B8707508F1D0E07D4D6D6426A6A6AC89ED1D151A8A9A9296098
          AD5EA7D34D949494F08C68632438BA2E2254D83B3D3D0D5B5B5BA5042E2E2C2C
          34E6E5E50584614A0F40A7416F6F2F87AFACAC405D5D1DA05345A0A06DFC1DC0
          9EB3F9F9F9B7ACBDBDDD545151F102FD2FBEF4AF407B9313815A262D9FA09408
          0D9506F8018309837BC8A001723095462A8814B755227D8646A3EFFA5FF0EEEE
          2EA8D56A989D9DE5BA25DB9211485EB1B1B1BC543208AD9D9C9C700029457ACD
          C8C80807D3C4E7E6E6B896C9A2D43302D33A194358FF2F30359D6C89FF12A251
          E82A048129A8927B83D1CE015405830708AC3C303535C5584343831E3FF2130F
          A90A843FF9033779B44E15990E480000000049454E44AE426082}
        Name = 'PngImage16'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000004184944415478DA95950D4C5B5514C7FFAFC5D26DC0AA4EF91AB0CD8C
          C53928EDB24E8146948F9894954DA626BA38133596354B5C1683B04D6C84D118
          134866E347880C750374095342A38B8445370C2065B36EC258C45A29AC74B5C3
          C2564ADFF3DEB73EF6DA158D373939F7F397FF3DE7BCFB184435A3D15847DCDB
          E16135319BC562F90EFFB33131C09C715F15562B14989898407B7B07FC7E7F79
          5B5B9B952C73FFC1A2C62E074E25CE55F3663582C120265D2E1E4E540B07EF82
          AFDBD59CAA5727B9BEB6CD9EF8BDEBF53D623043804A72F88218BEDF5885C4D5
          0A1C3DDA288025822211348FB891A18F5F40C51B277A5D3700022FE155180C06
          93542A3D42FAF504403D51D9CEA9F39448484A128311432D47A1C3C3C3703A9D
          B05E0AA1ABD9C0D0CD32A2305065781512A92C4000F1B9B9B9D068B66145BC0C
          498A7B51F7D6A10159FC2A8370A368B51DD58FC26EB7A3C13A47A7D388E2295E
          45434383BD42BF63CBCA952B105C5800C771BC098DC2A96A7A88C0A7C4D07ECB
          B3C8377E216C5511E885A518D398CAE5F2CB4F95152B1E7E24070C23E488C1AC
          EFAFDB701AEB46330FEF716D4CA6D0C18F9E5FD4BC76328EF44B0930A22497E2
          46E0795959592D0E8763AB30A7D168822525C5F7FC7DC3C7DF605562123A3B3B
          61E997E1DCB1DD28DC7F2A42A5981B3321A2CAD012EBACADAD81F7BA07BF8CFF
          89774F3BD0F58E0E45074E2F0BA5D75D162CBE09BD76A64A870F7AAEE0CBDA02
          D47EF213F49B83181D1D5389121A51E3CB8269D17B269D2E61BC263D03679B76
          E225F319EC54C9F19CBE14F5F5F54242DDC48762C63816F499B24D506EDE008F
          C78BE6CF0778F8C1F254A429E2B061FD3AA4AFCD80C964E243125D8ACCBF415F
          AC28C4C8C8CF08CAEF43FFF91FD13B328BBDDB6EA1AEAE0ED767AEF1FBEF7F20
          39269C89057DE569252ACBB6C36AFD06979D3EE46BB5F8A1AF0F67EDF314ACA2
          31A770AFC7CD574B2C38130DAD79B91065F939F8F4D4B7F8F5CA384A757A92A4
          AB7039C6717E8CC5AE4DEE0C52F30FCA64B2E168E566B319814080873361681E
          818E98F63D811D8FE7E2D8F16E4C90BC699F2C8E80C62DBA37FA6C9FD12F8FA9
          ACAC54A6A4A49CA370D7A413870E1F416BEB715E397D57787082E6207760CF76
          ECD53F86F6AFFA307071EC2E68D06D53716C48B2F0C7F733E488243B3B3B9980
          D7E4E4E4F450F8DC9C1FA1108BA6A6260A962E819B0FEF86764B3ADEFFB0156B
          73B51150FF6F678AE0B17B70FBD9149E4F6A9C5AADCED6E9741D5EAF172CCB0E
          9237BCB1A5A5A57B095C5E9006D556151E4A55E0E2A5AB181C1AE2A1F38EBE02
          F69ACD134E8524EC59517E68FD0688D1A7ED16B1453AC72F66EADF5379A7A76C
          144EDBCD793F5F5AF192B9A29BBEC999F9D1EE69511509400E777E45A1303018
          EEDFF9A405B8304E4894654EF7364E23F257C4C4F0C23A1B363AE6FE0130C702
          4010905FEF0000000049454E44AE426082}
        Name = 'PngImage20'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002DF4944415478DA9D944B4C134118C7BFD99D6E52D38450C285B3078F
          A4DE4CF4EACD448D1A3D9A9818A20D22112874A9A0F4615B2A8F1ABC78F6E251
          059F2942385821E0C1235E7C9447524DDA65DBDD75BED9EE6E575B284ED3EC3C
          7FF3FFFEDFCC90BE3BBD970C4D3B06872C4414BFA41399A74DC76F04AFCBE9E4
          14392C78243C6824E2E9B1A6E0E0AD1E3919CF90DDDD9D96A1EDED7E90474346
          3C96FA3FB06118646F4F11EBFB74DDE0E0686C1C15CB2D81D7D7375CD0A595C5
          2BBF7F158F62B36E0910C2C7C1DDEF4C60E54553C58A52A6A94C723895C8901A
          A4A5C2A03030745B6FAA58ADAA747EE179888185C3FA3F18EAD79A2A2E954A34
          339D0E25E3932D833132BFBFE35FB0A9D80C5B55F7E8FCEB97B6E2D5D5D503A0
          3A747707A0A3A301187734EDD499E2329D9ACDD88A9BF98C40EBB460623B3B3B
          DDE09D9D6DA6781DAC64ABAA4A5FBD9DDF57314275DD6E412070DC517CB3B747
          C6CC6F6F17F8AE16B8AC287426FBB0A1C7967A076C8020105EB7155BE042E127
          6C6C7CE6937081AA56E99BF70BB6E2B5B53517D00CDFDC2810E8E675AFD70B3E
          9FCF013F88A5C9D656C1568BDF72B944B373332E8F2DFF4D3FC1EEF3783C208A
          22689A066D6D6D301C1E30C1D17B895AF2DCE0478F673918FDCFE73FD95ED6CF
          43857EBF9F8F74757571D5E1D121133C1E9920C562B116AAE91B1E374B31FAAF
          69BA0B68FA2A02A5942B45C5F89724092263231A7F36E591312208029F8070BC
          96954A852652510E46FF1DA80996240F9B27F036AEC53558CF2DBE83DC879C46
          F0A15715A5D1434FD96E21E6BFF0B7FF08425F7516DA44ACE1CB99DFF7816736
          5599FF62BDFF56F8587083BBF765B878EE326F7FFFF10D969673600870ED4030
          F35FB4FC9724CA7CF4F031F413C38F30F0F9331760F3EB267CCCAFC0119F6F3A
          31910C1E080E8722A273B44CFF513182B13D3C3A04274F9CE24A4114AECE4C66
          9F00BFDCFB94BEFEE0B34AB57A96839DBBEBDC40FE039DA56E999D99D3D9A9B9
          9235F607C1331F7F66689F890000000049454E44AE426082}
        Name = 'PngImage2'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000004704944415478DA95947F4C136718C79FBBDED16B2975A554DA520A5B
          04FFD00DAA66A0CE6C0271890B63C24A2B23485436080371C91CC91699663F8C
          71139C8C252E59B2980CA6712C04A70C043333E2B2094C7003872B85B6402DA5
          A5856BEF7ADD7BA44D489192BDC99BCBDDF37D3EF77DBFF7BE8741C438DF74AE
          9FE3B86C8661F6D49F78FF0EAC31CE9CFDB88E975394C85257FB8E26B28E458A
          4522D1E73ADD766C6CF46FFAE891B7446B811B2F7CC6E4ECCD23FA6EF7C2E2A2
          B71D9938B026F88BE6C6B1BCDC7D69B16209F4F474011B604F571CAD6C888422
          5DAB325169C8CEDA0D8E39070C0EFE315E7EE8C8A635C128066F69C921F1D2D2
          12F8193FF4F6760710988858550A41102683FE2004021CD03E1A7A6E75F9ABAB
          6A85D1A2185024289E7B65FFABB8CFE783A13F07C1BDE0EA2D2D29CB096B9A5B
          2E0C6466E832D52A0D080402B87EA303E6E7E78FA3281AA38153D0E55F637109
          162EDDE8EA84CA37ABB150FD05B158FC4B417E21721B588EE1D7FE3BF3C76A8E
          CBA27EBC50F3D714451D7EE36019E6F1786076760626CCA6B162BD71F3C52F9B
          5C2FBD9823155162204912BEBFFA1DB02C9B8ADC4EAC0B0EC19DBB76EEDEA04D
          4EC578677DB77B2008D04409A963D959BB9635230F86C13C696AABA9AE333E89
          B116D880E3786B79D96170BB17C0EFF7C3FD9121502AD5A0465320C0E1A79B9D
          AB3ED8BAE010BC2F6D53FA9E6DBA1D385A2E8CFC350CD23829689353E0E79E9B
          E072CD473D40D1C029C8F5B8FE758380F1B3804E233CFC6714849408264C8F1E
          A06DB805A20C2C5A11C13F959331F52F1719D0E95A04DBB415664786C1505D1B
          B56F5D707B4CCCA9A9AA8A93CFE4ED83FDF905D8F58E1F838FBABB40D372E9F4
          6B7E7FC3FF025F0648DD4051A7700CD3FB5896DABA750BE6108960F2EE6F909C
          F53CC8D1A91C1E1E090A0982E682C12B2E9A6E2805304505238795A440703245
          265351689F9238BEFCFCAED91C0C6983595AED720F8332A71906269C4E1B1308
          F02BF8EA89E06B9AA4BCE0CCECA50C952A757A61C1F1D8EBC5B532992C8000A3
          76FB19B1511FBFD87A656EB342512F402F343B9DCE84D8584E1917271FB2D94C
          58E2C68AC2294BF76A70BCAC75A73CC1609E9B038BDBDDC2729CE35995EA8331
          BB1D5C3E9FB10CA00DC5541C2714B6A52B1470DF66FB88C0717992545AA58D8F
          877EC7E3B6C239A77135384EF2FB5E4DF2F681A929F6A1D79BAF24C96F754949
          8A21ABD5924FD3E948C2F1517450D478865A9D3460B1D8A719A62C2D36B643A7
          D110B726CDF78A3CDE1DBC662518FF81A2ACDB54AA44BBC7C3322C4B68908B01
          ABD56E6698CB6FB36C4BB8A19920AAB424599AA9566F9C42AB230982554824C4
          3D9B6DE6004D3FCDC78F66000BC1059D12C9274FC5C4BC2BA728A051AE56B71B
          6639AEBD9CA6CF86DDF23A1EFE0D45BD9788E3056AA9142894B783A661DAEF6F
          2AF2783E44E5251E1E76CC37105729EA041E0CE6A26D84D982C1EE1A86B916AA
          71215DF8A7CF9E2708BD1AC773090C0BF830ACAF84A6CFF1CF573A5E99373FF1
          D0E42164C496C443F75C0812587185D0AA964DFC07FDBDF22ADD333FFF000000
          0049454E44AE426082}
        Name = 'PngImage4'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003034944415478DA95955F4853511CC7BFF76E9896737F747F208CA2D4
          487C30F1C12859E52626917F8A1426F4600F15893D84053D4844F49284FF22B4
          9714F429ECC5F5A02545224D9F26614A216ACE6DBAB9BBB995CE7B3BF7EE8F9B
          9B6E1EF8F23BE770CFE77CCFEFFCB914121483C1F09904EDAEEEB1FEFEFE8BFB
          8DA3221BADADA0E7C790C2D737D5D70AC587323EB02CA72C2ACA0345053EE538
          0E53533F41D394DDFFCF5D93621D9AE4FB8F6BB149C6B331E0269DA88103DBC1
          B248E7DB7FE525B43AB784CACE56C775B4B464C7CAEC3897EA186739D2A62978
          3896BEDFF569BB2F0CE69D3ABF51B6EAD29399D62D154CCC1938986DE4E7E7A1
          A0E074D843C074204E4FCFC06C9E815C42A338E307A4B06278FCD76AFB089461
          F02D2D522562CA535796231AB296A2E5C90BB8D65D686B7B09B7DB13D7B14492
          8EE6E607902BE478FEB405359AAF181C9943E72847C580EB2FE78AFA162FA0BB
          AB072ED7BA904FBFDF1F172C168B85BC4BA532DCB97B1B0DC7BE60205970A2C2
          4F2C93C903E06C021EDD07FC8E805F07C146A3711F28505EAE8742917970F05E
          2E0362418E22B2B29449821708B83BBEE31D287FC038E8743AA8549A8383A381
          01877C0CC119C68553A7F21283EBF8CD8B000F0F1B056791CBD7EBF5E1FAB265
          19670B8B05B0818007F706E71070A900763A1D614008CCB26C549FD96C261B78
          E560E0B5B5D52868281516CB1F783C1BF07ABD425F45C5D58381ED765B04980D
          3AE660327D4755556D38FF7CCA1E3D7E983CD86AB5C44D8569D2849AEA1B0290
          6118E2DE8DF68E57C983F92587C08C9BC186C7039BCD069FCF87DADA9B585C5C
          2093AFA0E76D0F2A3553C84CD9880F4E178E5B8EE8FDCA79E111526629F7BC75
          BCDBB9B9D928285FF6059B96A598A70AE0DDA413BE15D78F4EE0B06833DC8E01
          F3B1A98CB2569E3BA13C92465E2D6ED7354E3403A1AC7BFCF838F1DBD6390A75
          2418F72EA19AA2E96E9254E5CEE79143E33F1D3B15CAC9A6A99F6D69B46F7A7B
          077C31031A1BEBD34890112988B288F88954C1BA84C84BE4245A25B213AD1139
          82D14DA0C27FEF3F62BB3B352F4EA51C0000000049454E44AE426082}
        Name = 'PngImage6'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000004954944415478DAA5D50B6C13751C07F0EFFFEEDA5EEFDAAD0CCA56D8
          431661F2CAD80045206E0421192482A24647480CDB88864806261A62781A0515
          22430D28F250030641A28489884A180FF790387483C91E303BEC06ED585FD7DD
          B5777FFF6D8A81B84826977C73FF36F7FFFC7FF9FDEF41DE7B9E4B0550CE1152
          490971106A6C5FB15F7F1DF779906DA5DC2657F6B8957993665A3843455DCDD1
          70C87FABACF2807EF0BEE0F79758BCC50B2A8606DB4EC092E282611D89F3270F
          7A0C8A1C8647FF375C55CAFD55FCC43257C47D066AE03A9C1317E1B7861AC5D3
          D5FE9A7DB4D12998CCAB55B756B4EC233AA845E2F05B43331EA82C9C5162553C
          8D88F507208E988AF3E7F6F5DB46CA548FA97CD4D02656ACA3570605B3CD231C
          C19BA2EC58F948F10291AA5EB8032D508C3ECC7BF645D696AF82EEF64B4BCBDF
          A0870705534A13836DA5FCD38249F86C689ECD9AE294F1E8EC1288661B1A571E
          43EF37AD3AD1C98EF9BAFEF2A0E1BD1B482EDBB073D9B9AEF4F185F984FA6EA2
          757907CC372832443B9A3C5DB19ED5B48C5DFA45C5C67BF73B01EF5E4B66101E
          D563F31FB465E566F1810B9D70AF72C3250E814394D0D4ED866DE918042785C2
          3D9EAE801EA32B187EF89E30ABB69A12D35C475AAA22356B92F1695878C83912
          FD510D1D7E2F72368F46FA9C4C58ED53E0EFED4643CD778ABFB7A7391A354AD9
          026DFFD98A4F36904C18189BF10EF7E598B40C874F0DC327A81855452165F3B0
          582498CC32445B2104A900D7AF5DA63FFF784CD1D4D026C3A06FB3056203C2B7
          8F6A9E5FA3F374BDBD28978C78B593702285205812B099253E36093698E4C988
          D25CFC5AF753A4BDE94C9FA6A91BD8F47D6C0175403851FD3AA2CE2F5D6E0E7B
          3F0735C20C33335866B00C93290D6073AD5609BCC901580A1008CAB858775CE9
          B8DC10A5D4D86A1878774078CF46D25E34FFB95CCEF8853D3057C1F326584499
          E1B644E59C908558C403D93E041CCF039C0386A900BDBE5B387AA04AA5BAE118
          10DEBD9E6C9D30657A65664E2AA7F49D60557390243B44C909813992EC44CC70
          41F1B7C1312C9DE156407C0CB5A70EAB577EAFDDFFC21ABD6C4078D75A32DD6A
          934ECC7DAAC216E8DE053DD6CF5A20C39E9A018E4B81C0F5C39E361E8A2220E0
          EB8073D433686DAA8DD59F3E72351AD5F3599F23FF8209211C3B593F5E8BD3D3
          669514A63AFA881AAC03D54556B58C94610588F8BB20CB5648CE12F4F954B45C
          3C196D696EBAD2E78FCD5EB595F6DCB57949D0C622C7B3781EA69614A7ED797C
          E16231EC3BC42A15A1857C481B9E0EC9311337DD97E0183107677F38A25EEB68
          ABDFBC3BFA52570F7AD9DC304B3001339424D178ECB7CF5B5EC196C953F3268D
          2D2C12C2BE6A769B39A14542C8CC5B82DEEE3F50F3FD51ADA523F2EDC69D7A15
          7B1D04D89C501CFD074E567C279A1867A6237D75193E985634CBE9CA1A4ECCA2
          0BFEEE667475B6EA2D97FE548E9F35B67F7D0AE7EF0043C978EFEA31C345768A
          7F03A564AC53C621BB6211D93B63EE42BBC66EB1C6BA06ED86D7385BB59F6EF7
          78718B5D1349466189FF0E32531FF0AE48F6DBCC125FC85CFE24F21F9E802351
          1D179A5AF1E18E43A867FFC7DF701A4B3F4BFC698BD13BB0BF01303C1C52B8D9
          6CF80000000049454E44AE426082}
        Name = 'PngImage9'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002574944415478DA9D953B6F134110C7E7FCC60F6CEC58A2A3098FE097
          5C21F186D491F800B49152411CDB49A0A0A040021402814814F4B4147C08088F
          C68FD23667CBB62C5B028AF84CCE77D959B1A7BD27C623ADE6F6EEE677FF9D9B
          9D15545505664F9F3FF11327C07CA66E951F4ED84460E09DDD67FBB22CAFE10B
          F481F07F7CC211BC5EEFFB8DF5F25D1D98A855CBC56D607397CB05FC6AACAE8D
          F75EEDBD9015555920CA7FE9C09BA507D06834C0EFF7C3743AA5AA9972A3375A
          329984BD37BB1312779A807F9AC0CD6613BE77645014C516669C5F5E0C432291
          7006B75A2DF8D63E827ABDAE0B4EA55250AD5675508C4DA7D370E56C04E2F1B8
          3D18732C8A2205D76A3513D82E0D57CF9D84582CE60C6EB7DBF055FC6302A332
          AB3420142D1A8D3A833B9D0E05E3B279CB643250A95474F7B2D92C5C3B1FA5D7
          9148C41E5CDAD8826EB70B5F7E4C68FE66A988EB1762D487C3616770AFD78383
          9644CBCD0ACABCDBED861B4BA7B40F0483416770BFDF87CFCDB129C746CBE572
          3A70201080D7FB2FADC1C5C2260C06030A66A9B0538CFEE6C5B85676B8A96602
          F3A9B0CA319F925BA904903E610F260D0486C3217C6A1C9AAA82D9A3B53BF0F8
          ED07CDE7F3790AF6783CB381ADD4B2B172E90C7C3C10B58F211895FF138CA920
          2DD4044655B7D30BB4B4C6E3B1F60CFB0A76435B70E17E0946A311051B7B05DB
          24CB992484422190248982319EFDE899C07C55F0AAE751ACACDF2B0AEC253BC3
          7A45B5CCF34636C81189C746FF9B3F9A76485E0B30FF99073E9FEF1D59F52A5D
          1D7FBCF04696E923EE04194132427F07DEC303F3901B126148C6F86366600AF3
          CE3D47720000000049454E44AE426082}
        Name = 'PngImage8'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003744944415478DAAD934D4C134114C7DF7E75596C4B296229A2A45814
          128CC2852092A8185122897A520FC603217830F1A2473501351E858846E30744
          454D4CD088D1A01C14943501A9A246109B620BE51B4B3FB6DD76D7D9CD2E592A
          A04627F96767DE9BF9BDB76FDE60B0C4787137AB92E6BE5DDD7C1830F8CBB1E8
          8196EBABB62EC7BFB74BF3FF0656A1853BCB807DFAECFF80E7A0DBB39157076C
          DBC77F076BA1BC9809149588327E24FBC23C38381EDE8505EC7ECF30F5B2F66C
          24F047602D548CBA40A0F7028E85D0DC8DBC38848222F826463B3EF5B987F53A
          209E7DA18ED59CE3DD4B829F3465161B055787040DF159A04B3069B6E8904424
          0A801F40311818F77C115C9F87BA11BC1AC17B1604BF685E73880E0F364AD020
          9F89B2A480A28DF336F1E8AFF9C82C783D9D6032E700C3D0C08548F8D0C536BC
          7252C7113CB860C60F51195294327051BB84429E0408FA876172FCFD2FD99024
          80256307F47476F58666A7D8F26AA8FEA31A8F8E45C0E7F340B6DD0640A4C97E
          8E0B41C0EF05CE3F051889818E59852E340706BB5BFA4A2B61FD6FBBC24C4EB7
          176DB382D3E9049BCD06ECF38139BF4FD4439A35434C327930923240A2BE00DE
          B3ACBFF4D0B86149707CE6D290C06A1FDFAA5BBE3F3D052EAC4833A526EA6731
          BD6923F4BC71C0F65D85E972892C0F4716054BB6BB97ACBB32989156CDCB2354
          E79DFAD4DD2949624BDE463360B8117AD9AFD8B6F232199C60BDB72818576C78
          535DDACE2CA3577E1D084C6BF6886D3793C70B8A561AA66726C47E478028AF9A
          C5959EFCA514980A4492B22325E3E5F396B23CCBE803049E57C3F646933B7F93
          8D76BA7E889E01F74CC591C86A641614CD03E38A280D185F20B03C5A6F585E15
          6FC9B63ADE76E3936342DFBEA3E152648E2A1216CA9452442A6B5C3397F75EAD
          4DDAB32E873999B32177A4ADF5756A60265C53751A6E235F08298C1493CAA205
          931A301517489A130603908FAEA5B7DBD706271F3FF19163A3E2C5531744E91E
          3824BF0297B3D6964205E95490B2962E8EB0DB7143438DA92E2539AA63BB03E4
          B02B76A6F60A38407EA672A64125C03C3016F7DBF297A2802C29A6934BF209AB
          7199604EA063B98160143F714EBCA974414C51445154590B739772F0808E6018
          91E13812EBEF1784584C20D051A2B222966936136B0687F821AF1726EA9B615A
          D35A6A27C43412D41AC7B79F56F19DA1FD8A1AA901D435FC04C62772268840D6
          F40000000049454E44AE426082}
        Name = 'PngImage12'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002C74944415478DAAD94CF4F135110C7E76D77BBAD48D5A2B5568CE20F
          4C88C241149B204188FC28EAC19B170FC67094F8079810CF7A909B5EE5642224
          24081A4D2460D4A089127F6121D1408152A040D996EEEEDBF16DD36DB6655B81
          38C9645EDEBCF9ECEC77E72D812DDAD5C77664C1D5D72EC70A9D23DB04EBE666
          F0E87F05D7B654C2C8E05841F8B6C1BA1582937F408A58B8C9BCCBBCAF835795
          7970099EBC705200DACAC2F356BB6F8C9E2BAD88EF5CE78D9CA2A8B0262F4132
          A681D7EBB584933CD026165E5C6EF083E4A4B0B21C051913C07104084F404E26
          8163313A2701E100CACACA0C781183C72DC10C7A9485C9C6363F28188748742E
          D382A622703602282459B708C9352D05D6CD0417185CB502F7D79D3DD968F794
          88D34B1380343B8FBC0CBC482016A64015CCED38238715182F042A212ACDA7A0
          25AEFD6C97038188600C300285E0E438F00E8052EF91CD69AC831BDA6A60510A
          C1AEDD2E10C20ABC7E17CC3A531FA886DF33BFF2420B80CF43925F848585088E
          BF5D5E61DB7E56F8D3C8EBFA27A9B4B539D60B2FB5D5824BDC87CF7A7A75855B
          59E12B73DE74F30EB1DCB4D5645982EB0255B458DCA3F6F7BE114FCCC8071F74
          C2AC29AFA5973A3494927C1360C20A27AEFB4EB9A7AAD03932F04D64C5B6F439
          4C83A92CE1E1C13B8AD1295AC149CE9A5C79247437EFD05A12F5558EE181AF4E
          06B683B5610E38EB01C40C65CE5DEC147CC53EF2C7DF541E1FEDFB232770BD63
          A043790AD6B754076926CFC0CD60CEF04097D0CE3B485775DDF1F8E85030F6FE
          A15A11F98E6A013035790A6E09D6BDF9BED022BA48CF01B7F34728129762B378
          77E89EFA218F1C4ADAA9D1F906294C4E6A6EF33EF7317283B341B9928061298C
          1F1783189E784957D544E6B50D19CCE02C29C0009A626A7DE696ADC4739ABBC6
          FE0B1E76CDC35F9ED06E8DA2B657B3695E1FE145076AA1294C7CFE4455E3611B
          C62D8F5B8D66EE44647DBCBFE122742718529F580000000049454E44AE426082}
        Name = 'PngImage7'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000004034944415478DAB5950B4C5B5518C7FFF751FA6E8156D8A6A0304215
          211AB21819334194904563AA713324BA986922D185688041797550E886806471
          4E37D22D1A94E062B6B84D1991CD385C58D4391ED9A44E3A0653481FB485F228
          BDF77AE8CAD26D5488C6939C9C73BF9BF3CBFFFCBF73BE43E17F6AD4F2645F93
          D9EA9B9949215321FC374593001F0C092BADA768EADB3A63C3F311C11555657C
          ADB19E128495D647504551A8AB37F2A65A33F34F608E80E9A929D79AC1D1D131
          3035ECE108988D08AEAC2EE7F6D498D60C5EDA594C4CECEAE070C5838383AB42
          D3D333101BBB0670B8E2483E2FC76F8D14341ACD7F57DC7BE1475CB75D03C7F1
          E0051E22118BDCDC3C58ADBFFD3B8F476C2338F8C941BCB9F30D922C2D161639
          7044B098A1E0713BD166390C955A95FDF181431756553C343414DCAEDBEDC289
          AF4FA0B4C4806F2E8EE3EA140BB1548E45420ECCFB90B95E40FEA60498F799F8
          75F1EB363537B5FEBAAAC74B36965594A2F8DD527CD937899B7372ECC8791009
          5A19023C8781510FBA7E99C003D2196CCBDA40E0F5331D9F772A23825D2E2706
          0606F1FBB561B0AC08B39224F4BB64783B3F19B14A09242206B37E1EDEB9455C
          19F3E2BBFE09E43E14F0FB2606F961ABB57C7FEB87FB57043B9D0EF03C8FF78A
          8B5069A841EDF131BC90ADC3E3496A48A25830E48A93FCC135BD809E013B6C37
          ED504919BC9E1DBD64093A3BBEA256043B1CF6A00DBBCB8B51525281D6B35E6C
          DF7C3FB4AAA8A05A9690FD01013726BD106816DD67CFC1274F45D57371A835D5
          08ED9F75D0F724CF585D17541CF4D75082AA0A235ABA1DC8D26991789F144A99
          084B4762D2330F112380662538D975066E71325796AF65F636D6FBBF68EF14DF
          0D0E90AD336EF75410DCD1D98EC73232D1638B22154E84D4C418C8A26828A52C
          E6E639E2370B8191A0EDD8192427A5F0791B038BA7BB4EF535377E90730FB87C
          7725E3F57A83A762D87A15E77B7BB155FF2A0E7D6FC7131BD588268A15121A6E
          9F1FF16A31BC0BC0E94B9328CCD1A2C96CB0AB55CA0396B64FEBC2C114012F12
          8FEF287FBB8ADEC196ECA7A048C8C4C97E0FC40137B66E7E04638E590C5DF903
          7E891605992C2E9EEF16A6BDDE399B6D84B33BECBA733D3FFC755B71B5B1E238
          C771FA5BB580BF0D1F1DBD015D6A1A5E2AD889533FFF89EB763FFC020D5DBC08
          79E91A343518F86D2F6FA7FB7EEA83CBE9E4DD1EB7432C12E753B8B32DDD7939
          E9CA50573C9CA6CB78343DAD314E13E78FD56845594F66C95352526496A3161B
          A91351D31E9F79FD86F88F5ED4EB71E9F2653CF3F4B3BCE5481B7D3778D91E26
          34B2CBDFBB8A0A5F93CA64FAF1B1F12DE4E59026262674915C1C6BDCDB72B4A0
          A0A081A20543E15B85502854686E791F2B8123353AD4A9F0DC20F416EAF5FA1D
          32B9E47028F6CADFA76EFADE9EA94C300000000049454E44AE426082}
        Name = 'PngImage5'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000029E4944415478DAAD95D96ED34014864F92A248098846D9373BE271B8
          E096148996BB0A0A5225542116D12C4D4A0551545E02AEB9E07552092F094459
          ED84B4CD98338BE3441A73011DEBD8E3F1F89B3FFF1C9F0400DB9B77AFBE2C16
          8B32DC400B87C35F9B27673B017AF3F2E8D0A9551A37C185DAC97B383B6D0536
          C08BF91C20E84E71802CE9991FE0E099B01EBF27E289439FB1D9B0BD1D877AE3
          58025ECC3993D069F425CA236CA8D5FE2855F8E2E090BEC0E6C6623EE039050B
          25E0AA73F80220D4B90A298C0820D38B9D782CE9A3783E83259BE7415C1BDAE7
          ADBF7AFB6CFF39C4133EE0D9CC1620F0D4B185081349B837E239338B5B46F858
          2291F2071342DCEDE12F88CD3BFFDC962A7DBA7F20167720914CCBC1B63D15FE
          0AC5AEC7C28E4EA7036A49657D4236ADA27353C98C1C6C5913BE192B2811621C
          D67FB85386D3661354A52436D15B9CF653E9AC0F783A619E81C8848D3C4570F9
          11FF381B8D06A84555640A083104D2999C1C3C998CA1DB3541D334D00D9D85A1
          1BA0EB3A4CADE986B7F57A1D4AA81CD6F23D93C9FB80C72330BB06680CF6030C
          C3C4908319BC5A07455156F06CD6073C1E0F1958D77406334C1355A37A5CC8B2
          2C796DA8D4105E645EE7B2053978341A40B747ADA01620DC3450B1EE0BAE2254
          45C53C3B08E4738A1C3C1C0EC0EC214C33985266852907D72A5566C32A7B109E
          CFAB72F060D8F77274ED0B0491AF8FF7763D6851612A79DAF3398542C9073CF8
          C53FD1A5E3151D51EDE8B1FB640FAAC755505565ADF279227CC1FDFE4F0F48BC
          AA256A295C742EA0A8A8BC4CAEFF225C78895755BD2707F33AF1EF2D180C6EFE
          83BC7E7BF42D14DABAFF5F54D1AEAFAFBE7F687E7AC0C0A150702B57C8DDED99
          BDC8E5E5550487DCB82D228A7107E316C602C312618BEB8C46341AB16C7B36C4
          FEEF3FC73D7E3661B8B15F0000000049454E44AE426082}
        Name = 'PngImage33'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002924944415478DAAD954B73124110C77B791D2014845D7606245AE6E3
          78C859CF9629CB9315A562798410316AD4108CE10BE8D983DF8785E26094F763
          4198B567F6C5865D2FC96C0DB33B8F5FFFBBA7679000CBE9A777DF168BC543B8
          85128BC5BE1F3C2F3E92F847F5A4621C165FDF0617DE9FBE85E28B5792073CD7
          7500C99E6280C1C4AF78C0E0DFE2CDFC66D688C1C7CCBE546A1B3E7C3CF101CF
          7581ACD53FFBAA79BAFF4C801C43A2B14C61934E0780750EB617DAEA2C0058EA
          6C8538011FEFD8765A0E50ACCF703240FDCBD97FE3F8E4F1BEC9360CD7300767
          02C0B3D9D472135C7502C0048899BEBBE3E08D7326A3048319637071590F56BA
          B6595EE30664E4AC3F783A1D5BF1B515996DB3D584BB851DA7CF0DC1DA4662B7
          22ABFEE0C964E4C4CB6C18682D0D4AE51234BE36443F5B0B15AC19E7EF4A9604
          80C7236BA1B9215C6919A1BC5C5E34DCCC0033A7ED3433C530C8AAD41F3C1A0D
          9DC54D4D83F251C913E34422019452A084824A54A00822D82A4A5678A7AAB900
          F07020D434D17D5BE90618A18412202A564210A6425651846A4202C0C361DF72
          BFEC9B150E9898508250155B459645AC29C9FB8307839E00681AC22B4701600E
          A542A9AD589115E1698EDEF107F7FB3D27C61AC6B8F2A6B20176D5BA8A6554CC
          6391CB15FCC1BD7ED7CD517C5A5A0B8EABC7025AAF9D7B2F1D6638A7D4CEA47C
          7E2700DCFB732D955079BB05D56A15CECF6A1BB799F36E19080477BBBFDD5C65
          E6ADC5EF8776BB0D85425E1864F66D76EDA0F07985C23D7F30BF276E5242A190
          F71F04ADFC0887C30F6E44B5CA72B9FCF9F2E0704F807777EF47688EA6AE7E5D
          C5A7B359FCEF6211C709F1D58A6D31B6C26A24F06425D1DBA8244973AC6354C7
          EB04058D23D1C834168B4E935BC971A7D3E90D0643FD1F0B9F5F362D74A42900
          00000049454E44AE426082}
        Name = 'PngImage34'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003464944415478DAB594694854511886DF7BEFCCDCD9377753B3044B73
          C93682A2289A8202A91F8546410CC8B46829E90FAD46C65D042DCC7E4449A02D
          109148458851608190A215B4588D3A531A849AA9A3CE726F67A61CCCC174840E
          9C7BB9E7FBCEC377DFF37E87C27F1AD4EC8F9272D36DBB7D3A6D6ED2389783BB
          CF7A61FD4A23521D8883FBE490D3D53E309188BD733EBF30DD076C3415F02663
          A9CF8633398370AE1E853CDA8571B310821E252ED584FAE4159514A2F04211B5
          68706AEA13441D0844F80609063A2661B93F84E6E69D4B03D7D6D67AD7BBBAB6
          42BA4384802421865E3B607BEA404A4A9B379E9595E941F95D715E9E05936B6D
          90C5F198784741D22D4355552489F0E07980E338300CE33F58AFEF02B608A04C
          64F0F38D0B78E1427D7D32817204EA86F3100884FE4BD1DA1A07894E0B4DB218
          3F5E4D61A265183ADD3B6FDC6030104788FCAF3837B71F832B6C10C4F0707DA6
          10F4498C8A8A506FB50C438365254B03F7874D8222B2F25620E20B8BCACA651E
          A85B5FF75B2A95FA2F45531321A62C87244681C9CF63C42616ECDF6F9975067A
          C864327F2BE63D15BFA2ED98D632608739ACB1D3282B0BF3543A33150AC5E2C1
          EE0DC44C046C413BE5C0B886816C84C346078DD2D2903FF1DF7653A9548B01F3
          448ACBB3A4888039361AD3914AB0D631ACECE9235258BDF1A3478F40ADD62C0C
          76B99C703A5DDE83A9AEEEC3F5510E7D4A11968FDA714CCE936E0BF7FC0D4921
          1E66A0D168E7079B8A8DFCB9FC0BD876FA0E3ACDC3EEEB0A142B72DF5A58BD6B
          0394363B56AD0C44CB7333842C4BA6080C698CF8101637D2A2505A5EFC6F70FE
          D536D4DCEF86FAA41E13A4D1025C53508D0C219680342A31A98E8558CC105D19
          DC7A68457AB2126777862F0C763A1D28A86F47DDE3F7883E7E181F066C4874FC
          44BC9C054D53C4B342C4C6CA70EB413F0E252990B15E02AD36707EF08CC6369B
          CDA3ADF16627AEB47EC2F68C548806C72025503738315185C6A68F485FA78161
          93DC931B1C1CE69F8F0B1A5EA2AEA507A74EEC81D93C8E8404151AEEBD45C6B6
          28E4EA22FFCA9D175C5C666A1630F4DE594B8CFBD13AA046E76810B23375B8D6
          D881F5AAEFFC66692F37B7F51D0EE723E37953AA0FF85F4379EC6EB9502CCE26
          6EB8F8EDD2EEFC85F27F013A17B2261E292E0F0000000049454E44AE426082}
        Name = 'PngImage10'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002A44944415478DAED947F48136118C7DF778B49AC98AC1FD37E28638B
          560B11211383968B628C9531AC58C5AA3F846AFDF21F032906260C7410814808
          51FF3422318CA845486B0A2BA925FD20B140871A511373F773B7DBEDEDB9BA89
          1021294144070FCFDD73DFE7F3DE7D9FF70EA33F74E0FFE0B9C0650E87E3BEDD
          6ED7FAFDFE7E9EE7EBA0262E148C351A4D4B30186CB2582C2810080891486417
          D4FB160A5E69B55A9FF87CBE0D89448264B359DCDEDEDE99C9644EC23D69DE60
          8CF17197CBD5515E5E8EBBBABA26DC6EF79A5028F41116919FFADD7CC14B753A
          DD43A7D359CD300C0A87C3AD5EAFB771787818C562B15642C8F9F982779ACDE6
          BB269369F1D0D0D0F4D8D8D8B6AAAAAAD7E0398AC7E3232CCBDA4033F1DB6095
          4AD569341AEBD56A351A1D1DED1645D1A3D7EBDF180C86F59393935232993C05
          B2AB79FDE683E37BB04A3A4B10AEC088E808419FB262FAE6E0EDA66BB3C12500
          7CAAD56A570130075B6C1FD4EE80E717A1D69CCBE510C771FD5093BD4ECB0D95
          87461A105657108207108C99675335199ED9CF73A98ED9E0D300B9023ECA3501
          E2110405510C51A3BC9DBC971D108F7F654171654F6F26FD75471EBC04E21980
          AD7379070BDF82E491CFD7B95E9415A8179DC8F0B453E0E8B569368505964669
          8E9AF1B816A03DB39A7F1E06C6F97B1CA46A88571B773F8F080CB55DE0A6DB78
          967A2FF1D3E32CCB1F1319EA401E7C1D1A8F2A8D2F219DCBCF13FDF828348AA6
          44D13443F2976E7D40C0CFEE2F839EBA99272868984002BD5A0617410C425391
          D2D408A9CD66B3E914A82A1A8DCA5E5F02CD0545F316D29665D61B03F0EA2B90
          C4EE6585CF1299120EA32C750621EEBB15F5D0D0A934D0F2D401FA41BE548657
          282F00F04D907B41AB51B4B5A5CB5B0AC725F1728EA3F54890A5A92990DE8393
          23FFCEFFF8EF057F03F9BC2C579DCC7AFA0000000049454E44AE426082}
        Name = 'PngImage38'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000034C4944415478DAAD945D48145114C7CF9D99557377CD52B105496C25
          C3FCA8CC14C5075333CC4C219290D80A1F5C7D914CC9C77A9124431FC47A4B54
          4403A17C3131C5164DD93EDC14B56C43F323FC4A697576766767A7334B86BABA
          7ED481C3702F97DFFCEFFF9C7309EC23EE0D17CDCFFA593C97F925FBD8BBEEEE
          A18CA9F4CD67C87EC0E70D89731F224C7E66F3B27042470F1B523F473881753A
          1DD5D0D0902D97CB35822024F23CEFB613783C6F0ADA4E8E00BDC242DA6028A8
          5BC25FACAEAE3EC168FB0BCECBCBBBEEEBEBFB283E3E7E2832327242A150D876
          025FB5DED6B67BF501CDDA207A26108A474ABA7A7B7BC3388EBB535D5D5DEF00
          171515B525272713041B954AA51CF77C309598B23F56518FBF3E3CF3C3EB17B1
          88BC384F7E32BD8A4FF09D9A04CA6C07954909D1A6E310CC0401B10318A786A0
          E5C21B420A0B0B2D252525B52A954AB220744B858359A73AC22765ACC8022FAC
          02F056209C0DDCCC221CE0003C30DD308920C291B943D09F6E24A4A0A0402C2B
          2BAB41B5C1C8F0C65CC29C6559D68C5F117D17B3BE5CB9A90B9BF2B00B1C8856
          2B883601DC39113C5900770B7124B189007611FC160F427FC6B70DE048E9FA56
          AB75D082B15E71F6EBB45CEEB02863680ACC0C07A3DE9360A778F03413F05956
          4000A702C6E11C2AE719789EDEB9017C1AF76954FA11550AAE8A97AA8FD14EFA
          CE813B4B412C7B0E6AA21B6BA4FDD2D2522D16CFD1C2EBC151D2DA6432BD972C
          7005BE3170593BE039088C450247434D4C934BB05AEA00048FEDD46ED7FA92B4
          63F271A0B031CF5AA2E0696CF3F6E0DD4CDC5ADC6ACFD0DA680108A120C8E318
          DC8FAB7206AFB5DB6E06C355ACACAC30E5E5E59ACACA4A77A701F917704F4F8F
          BAA3A343ACA8A8B8E800EF67A4372B35180C81080E5B5858B88BEF45A303BCDD
          232493C9CC1A8DA655AD562F4A6BA3D1E8535F5F7F09DF03F97A309EB3D234DD
          858F506D4E4E4E53424282DD01DE4E095A54171717179092923222ADABAAAA52
          A6A7A71FA0A2BADDDC644B706E6E2E83964CA082B7212121739D9D9D2178B3A0
          CCCCCCE03545FB02A3EFF9FEFEFEC5F9F9F9AFB020617ABD3E08B793B0E2A3BB
          F5DE098C7D9D86BEBD44C50B581839FA378CBE66617FCEECA5A84E60F4F6197E
          8E22AC197FD08A2AA7F7027469C5FF88DF3CBB9E26D31AF0910000000049454E
          44AE426082}
        Name = 'PngImage0'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003D64944415478DAAD947F4C5B5514C7CFED2B82B41D3F47D3309950B2
          0632D31067A2148C06888B240613133598348B24B6600CA60E43E25FF30F1232
          1298A268D0F0A3C0586232875B506B4110A721652118E9A045712B3F5B28FDF5
          E8EB7BBD9ED7B8A5617429EA496E6EEE7DEF7DDEF77CCF3D97C011E296C542D3
          D7D7C19F9D0D676A6BC9BDFD2F3FBC7055BB7597BAD97DD70BBD036F8B7B2459
          E8E2D414CD703A214D4A800D06009E28837C9D8EAC391CD4FBC5254EE9F88911
          A4B2B043563456DEDBFF1A999E9E960C0D0DBD2A93C9F482203C1F89441E390C
          FC6E7131E4AA94200516A21B7F802F1005385301B06003F9642F30811D10200D
          7C85CF060AFABE521083C1F07A6E6EEE459D4EF79B56AB5D95CBE5FC61E0A5E1
          61639ECF0359C40B920D074437EF40901E8334CF3230C15D1028032B19A57B13
          A1D4CF4D13932DC464328D57575713043B150A850C193938143852FEB14A22CE
          BEBD3DF87960E0A992C55F20CBBB048CF72ED0300B3422004FD261475E28B44B
          8E7B06C7C79F61797E85343737875B5A5AFA552A95684169228FD1260887C3C2
          C2271F3FFDF8A41964EC5F3128E5298452F3E8C4C90AC70D8E579B4746445121
          D2D4D444DBDADA3E45B5C5B891896317C76628146271A608A4E2CC300CB17F7D
          D5A0B8FC191C0FDC06860BE2430A517C2A100904531F13861F2D602E59ADAAF5
          30B7110FD68AE9731CB780CAC20715AFDCB86E3C76A50FB276E680E159E00529
          ECD11C48471D12C241145DDB96A8C0E6163ED2DF76BE130F2EC3EF19547A4B10
          F33E105BAF9C35E6B07660A21C447829B8E41AD83C550699AB4B90EF9E0322E1
          81A712F087B2B74B17FECC8B073F2916C9EFF7DBC4D40F826DEF9B0CF9B6EF49
          86E0853554B652F5123D55FF46CF9CC5F256D1B5CBC289DD65E9B6904EBEDB64
          2F7EB0E5391F0F568B2700C1CB87158F526ABCDEF0A65379C79969AFA85A7DEE
          DCB95F53525280E779F86174B4A4E8E674C1375CB46868EAC7125F94DAEF838F
          D2DA89A2B5B5D5D8DDDD1DEBE6FBC72D5163241B814040DADEDEAEEFECEC4C8D
          81E31BE4BF80676666D416BCA43A3A3ACEC6C0C9B6F4C394CECFCF9F44F069B7
          DBFD5E4F4FCF480C9CE812C2C2B07ABD7E4CAD567BC4B5D3E9CC319BCDB5FBFB
          FBB27830BEC761F34C0483C1FEFAFAFAD1CACACA680C9C48095A34585E5E7EA2
          A6A666515C777575D5B85CAE0BA86830994C0E0537343448D19255547053A3D1
          6C59AD560D6656585757577C4FD1BF02A3EF8D4AA5F27C6363E3B75890D3B3B3
          B385B85D8515B727EBFD03603CD72FA26FD750B11B0B2343FF7E475F5FC6F3B9
          7694A23E00466FFB702A40D815FCC118AA741D05F8502BFE8FF81B8761E726CB
          34F0470000000049454E44AE426082}
        Name = 'PngImage1'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000025A4944415478DA63FCFFFF3F032D0023B50C767575E5D9BD7BF7170C
          8317A869BA6E50515107B17F3233FF41D60453C3C8C888D3E0FFFF189FEED8BA
          7E3386C1015EBE39D619FD93D10D73F97DF61FAB96D67F643188254C301318FE
          FDF9CFD8D0DCF17AFDAAE512441B1C29F890814B5F172E86CDD5EC6C1C0CB109
          196FBEBC7B230D0C8E5FD4339815687062C6DBB7BF7E281D5ABFFE13B50D7EFF
          EBCB3FF5AD5B57BE26C960101F66F0EA234F184EDCFDCCD01BAF0956C3C1C609
          32F8C38F4FBF74B66F5FFB942C83D71C7AC43073D723A0691C0C7B6A4D910DFE
          F4FDE777831D1B36DC27392856EDBDCB3073DB5D869F813E0CECFB8E30ECAD33
          8318CCCAC9109398FEF9F7D75F465BB6ACBD4392C1AB76DF6698B9F106C3FDA0
          50862F3FFF31E89E3E027635B78000033B907EFCECC5BFBFEC82ABEF35984410
          6DF0F1EFFC0C6DF3CF325CF48F6460F80A1464F9C720C6F49941EAD717064309
          01064E2E560601013686255B1F5D7D58ABAB43BAC17E4083BF01058119530868
          83F46F88C1DCDCAC0C82826083AF000DD6252D2876DD6698B1E906C3259F5006
          863FFF18F4CF2105052730289EBEF8FB874368D5FD7AE328B223EFAEBB0F83F2
          09A4C86307465E7CFA87EFBF7EE8EE58BFFE09591964F5C187F0E40633189AA5
          C9CB20C8396F153483F4413308D4E0B7AFBF7D513EB279F347EA656950064948
          7FF3F6F9539943870EFD24CAE058E1670C5C067A0CFFFEFD65F8FBEF0F5683D9
          583818E293325EAD5BB95C1C268652D01FD2D19EF09791F1FF3776F63FC8652F
          3697A2F3FF31FC3BB576D9B2340C8329058E8EA1BCFBF7AFFE4C7583D101004B
          5BD9E4F55BCFD30000000049454E44AE426082}
        Name = 'PngImage43'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002594944415478DA63640082FFFFFF33501B30221BEAEAEACAB37BF7EE
          2F5437D8C33BD09791E9BF342EC530B58C8C8C28E2EC7FFFB280E8803B776E26
          DCBABE1BC3E0C0B0C8170DB515A24C2C8CFF19FE33420DFB877005D4C0DFD7AE
          31EE65336142B7F0D8CCA2DC0DDB364F413118180C6C3C42224F172F9821F2F3
          D70FACAE8519FCEDE26586151F14188832D82E30904F988DE3DEE2F933847FFE
          A6A2C1DEDEE1A26C3C4C3781060B52D5604FCF60690E3EB62B4083057EFCFA0E
          162B5E789DC142999721D446066E30089364B047408022273BE705A0C17C3083
          5D9A4F3330FCF8C190EE26C7106227479EC13E3EC12AACDC6CE796CC9FC9FBE3
          37C460E7A6530C3F9D6C18D8D76F6148F75266087356263D28941ACEAC60FEF9
          3E54564A82E927D0955F3F7C00BBF6B2A90D030F3B1383E2BAD50CE9FE1A0C61
          AEAAA4192CDF7CF94A8CB79CF6870FBF18BE7FFBCD70FEC50786676C3C0CAFFE
          F13230FC0126596E0606FD8DCB19AA128D192C393F9264F065A0C13AEFDFFF62
          F8FA1562F053561E8677201341198B0B68F026320C566C3CBB8CE5C7BB305969
          09E69FDF114171D1C88681818589416FCB6A860C3F6050B89118141E8181329C
          6C1C97972C9C29F0E32722F2EE5AD83028EFA420F2E0196401308340B334C860
          58720BB597272F83D8F8FAF28B72F1DC051A2C0C33B8089A41C2903208C906DB
          D9D9B10B4B4A3F59BC6026B010FA4EBD2C0D0241E1912F17CE9B21F6EB0FF6B2
          8299898581898999E1DB854B0C4BDE49136F707054D42C26062633062C00E662
          6497A3CBFB9C3D578AB5A077740CE5DDBF7FF567062A00465A54A42000008E1B
          EFE4BC19D9540000000049454E44AE426082}
        Name = 'PngImage40'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002D74944415478DAB5D46F4813611C07F0DF1DB9666CA269256A564A89
          A24C0AC4A217498E60A168E89866A86F9C6F7A15416F12D13741F4AA379E6F54
          94994BBBE1B40933942118BE4AB424334D716AED8FEE4FEEEED4BB1E6F9EB8BB
          8D89D5F3E69E7B9EE373CF7D9FDF3D18C771F03F1A769C878EF372B55AADB05A
          AD7E097C4F535682E15C6AB4176058F8B5702C661F1926CD12B8AC52B7D1FCFC
          D939FC14C601871D402C7F7DFD2906FFEE416368E199F12C3CCEDF65310C3F10
          38607739ACB9F5858334F6264B61ADCED1DDD9964433946435BA5E371414A4F0
          FDA9A9357853753664FEB44C0E8FEA1A9D7EB73315C5C188616777475B22BD23
          852BBA3620273705F6A39EFBBC06FDB5C9A1700C82EB1B5D2E86CAB091A4570C
          BB119C100E2E6D5F81ACEC54D843C92C7CB5C360437A387893F1B359C3C37D0E
          31BC89E0788A0948E0E29733805D09C2F8B21D469FE685CCCB65B1FBF016E565
          722D9601BB18F620384E809F74CDC1F4CA61F5C0BA4A05BB7B001767A70FC754
          E90A78559B2DC0DE001DC81F319996C4B0B7A78350523B41D838B10AC4FB45A0
          35C530EF036029BEA60064382864A83AC64741AFC900EDED3490C7C4424DBDDE
          B7F39BB93E3434B020867D085608308F8FFF00C23C0F4BF74BC1EB3A1854A295
          5A07415F720DB4772E07A308C27E8A0EDCB0984CF312B8BB9350D0A28C8D1F16
          8120BFC0B4A682AF6395A51FF4E539A0BD9B71A4DC50147591612F82957498CD
          335ABF01D13FCBF7F515B9A0555F15D5310F478CC2D3D345C405A86D09BCFF1B
          8F4E2EA30573505C7849321F2B3F0335B5FA889BB779B3BA255E380B8473E1B8
          A7DFA4A1692BC050792324B92A86DDB71EB62608F7278023FE204E0427868323
          9D68479F45B0CBB1EDCF9C309B3D62D881A248FA8B289CAE757B9ACD66A343E0
          72ADEE676175CBF993C21F0D4DBFDEF5F55E38DC70A1F3A0AAAA1D07BC20DA27
          478A8505766AC0606890C0D1C068ADA8A8523936F6D6F7CF6171FB038BD387E4
          1308EDB00000000049454E44AE426082}
        Name = 'PngImage19'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000001BE4944415478DADD54CB4AC34014BD6962AB79D007A52268D19DDFE1
          D2856B9516242EBAB11FA0D496D4AA5B3122FA05BA76E147B852F003DC4857E2
          260DA64D32DE9B364D52B468881B2F9CCC646638F79CC3241C60754EB59B7EDF
          DA84042A9DCEDC36F65B5B1CBD34B503A6358F93E08576A705ADC336F70F8875
          5D8F4558AFEFE1934B523103C6005CD7059EE79322265217496964200833C947
          51ABD5F0AAA57FA338AA8A6C0F479C40B0CEF329C864E6E24431D9206842F9D2
          288A62F251A8AA0A9224FD44B1AF306CDD57EA2B87907A068AA24C279ECC2F6C
          DDB71D0615AD67B3D9EF88194671112B8A6AB502B95C3E42CC901888D8716CB0
          6D67AC2AB03E4DED302E41E0219F2FF8C4E0115347DB1E7807772E1F890E37B8
          B14D2A6E68EEEBFB82E7F4EA0A4691F73E12EFBC4F4C655916A8574FE01A6F60
          BF3C84B6B00D9702E66073975C596347B3AB6BC0CB2538AF2C43B1381F08092B
          26EC5E3FC7527CB65D8642A11855EC676C9A6624BF206B88644EB906B721582F
          95162219FFDDFFF8E844BB13F8D47A12C483817DDF6C681B1EB120A484C5F252
          B6FBDA152DAB2FE2920F790409A12028400B618CD01B8D26419625C3307AEF38
          FFF80469CBB022A9CEB6180000000049454E44AE426082}
        Name = 'PngImage18'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000016E4944415478DAC595CF2E035114C6EF7446C46882D4DA14B1608395
          7720DEA38985A557B0B492780FEF810D2B0B41253A8944684B2AE33BFA9DE418
          CCDC49D3F892DFE6FEF9EE77CF9CDC09DC9814FCB7B1ACCB72630D700AB6723E
          27A0250353A0EB7940CD1C7004F6CDDC1C780233E039E0C95D6E0A0B6E21861F
          E095A6BB60C9CCAF822BB008EEC4641E740A522ED0547803298DF74064D66D82
          33B00CDA01AFF00E6230C9C49A5A538AE18068E216D7AB36C03968827B319865
          6D7C14F12031DE062BBF1827E0568D25F17485C4A24370F08771DB3771620E48
          3926DFE618ECB08CD6F8B12CB14DDDA7B12696366D10315C07175513AB26580E
          AD77CCFD37600D5CFAD6B828B1AC09B9E7C50DDBECBA4AE266EE23A6B9F990B7
          4898DCABC6455DA1AA718D35AE5C63EDE332E391FAD82BB118D78DB155E67EBE
          1565C65F359667AEE786ADE4FBBAE58DEBF4C9B8FF2160097A66B0489ADC4AF6
          C444D509F841066E3445EEFB13DA1FDB3FEF13BE83855A7A5228120000000049
          454E44AE426082}
        Name = 'PngImage42'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000031A4944415478DAB595ED4B536114C0CFDD74BA816308730CB42F19CD
          3EEC4BA504A9A194A94D83820ADF322BADBF41EC2F28FA66596AB5ACA50651A4
          5E2791C3B444EB6342969662BAC0743A67DEDD7B3BE7D9BDD32D932DE8B0C3B9
          7BEEB3DF797D9E71F09F84DB6EB1B5ED6E379A5331329ED65DB8783A56B07CF6
          CC3990246947A246A301D793C780602E2EF0D4D414CCCFCFB3359EEF45100745
          4525C0711C64646480D56A55C11ADC22C70526E9EC743158284A0E2A2AAA59B4
          168B450527E02B312EB0D3792F3245C5417DFD55484B4B53C13A5C1262064F4F
          4F8356AB653097AB83BDABACAC61D1D29AD96C8EBDC6F50D97F66767E78C1178
          666606E6E6E6186478780852528CE07094B1EFE430353595814747DF1DB87DEB
          CEF85FC108AD44E3443010787676361CDDE4E427666DB62CB6466A32995430FD
          BC0AE11D6A13B968E88DEB37D9E692E252F0F97C3B8E9BD168849EDE97B0E25B
          868F13132AFC115A898B862E2F2D422FCF433FDF07A228EE08DE852367B3D920
          2FFF08CBAEABBB4B853F54C1324149028100E8F57A8847D45927FB00A708C15C
          18DCD4D8047CBF1B72730FE31859C0E3F180DD6E07599659A34882C1209EC650
          16B22403A7D96C514B4B33E4E41C42061F09AEAE3A0F030303389F976164E42D
          6466EE86F4F474D6066A1439506758143647569225D8D810A0E95A2314161E83
          D783AF22C135D5B5E076BBE1CBE74910821BACBE61984C9FD0890DDF1F7228EA
          247D12DB6B3018A0A0E0280CBDF144821D27CAC1EF5FC5E62DC1E2CF45A0E425
          6568C88110146015A7C4EF5F034D02870E354C4928A3E4A444C8DA67FF135C7C
          BC14D67F054046EF040904D65954A252533128624DB5CC898C6B5402F68C4A75
          97E5D05C8F8D8F1258AB829BD13494394EC2F317CFE29A0855F664EE85851FDF
          C1EBF5F6DC6F779633706D5DCD415DA26E343F2F1F74BA6456574A6FAB882235
          4C5D9322665C1082AC44EF3F8CE1FDF2B590EFEB1FDC7AF258D4FF14EEA683D6
          B6D6F62BF4187D09D1773A1D265433AA15D5886A505452F6905D415D40FD86EA
          455D83D09D2CA9A0ED8472A6C148546CB2F2AC820940B509285682A87F90DF73
          9B902FCF68D9880000000049454E44AE426082}
        Name = 'PngImage23'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000043A4944415478DAA5956B4C9B5518C7FFBD504AB9948DCA75EDDAD0E1
          D04D5049B003A312C54D039F4C249A8831C618C358A2FB62B28B8EC5988C3883
          2E6E51C734914507262C0384116226E112CAD01546ED25BD42DB95968E51DAB7
          7D5B3CEF192540097ED893FC73F2BEEF737EE7C973FEE7BC3C90686AFEF00C19
          4EE211627575B5E5C237974E259E796BE0D5AF5ADB1E858B8F8F37E3DBB68BBC
          6DC17ABD1E42A1905B1D3C1E8F8A269191CFE7AF4312EFD72A8552A9DC196C30
          1820100868B256ABA5091B815B43A3D1D05C8542B133D86834AE83B948494959
          87B02CBBE97963C8E5F29DC1269389B6828BB1B1B1FFED6B5555152DA4B0B070
          67B0D96CA655252AE6422412D1B17FD4848171135CFE1544D83844421ED445BB
          F1E2B34ABC5D776867F0E52B3FE0E59A5AFA616464848EDE25163D938B50AB8A
          50535982FDAA5C6488D3B0B014C4B4D985E149F3C336DDD7A2FD42DBF660ABD5
          4A77D8E170D09D37DA7D38FBD3301AEB34D01C2C84F77E102E9B0929D2224022
          03965D50EEC9C39F5A0B3AFBC711434AD9C42F9FDC4902DB6C36EA020EAAD3E9
          F0FD8003F535CFE0B927F2E05B70235F5D81688CC5722802A77916C23803D59E
          5C6466E7A073E82EBA6E4E8D11B026096CB7DB299853E7CD69E8E71FE06CD3EB
          08F83CB0FB19C8552574C24A3802B76516B20C218A557B2116A74267F1A2ADE3
          168C36EF7B04DE9E044EB8E2C4C521BC527D10156A29DC4C26F27373903817E1
          080B8FE936824C1CB67B21C8D257A1292FC1F571277EED9DE823E0D73681DBAF
          5CC6ABB587692B1A3FEFC617C7EA71DB3887D20365782C4B04FE1AD8EB764153
          9A47F3380759EC4E30A1300C3EE0DC8FFD5E02CEDD04E6368D33BBDBEDC61B9F
          5EC3A5D36F61D4CA40962D8134230D52B1006C2C86E5B919BCA4797ADD929148
          041DBFF7A1A0F829B47CD7132360E126B0D3E9A486E72A6938D98596A3F570CD
          D920CB12C315CF075F2446948D21E4B5A2F14839422106D9D24CF8FD7EE88D26
          CC87B2F0F5CF83C9156F041F6DED43EDF30750F5642E4A8B15309A2DE89D5901
          8354AC84A2F0FBEE218D17C3A9772AE1F178D0F5C72D207B1FBA07A7927BCC81
          139BD7DA3E005F548CE6866A94EF2B78D85B9F1F677ED38385100F48B5C19530
          CE35A8100804306E59C6A8CE0DAB7321D9151BC19CE5DE6DE9C60B958FA3EE90
          1A7BF3A4E81D1AC5B5190198680C41E265CE76E7DF2C802B10C1DF8E280686A7
          C7B51DC7937DBC35864666F159FB108E10DB559715E17CE724BCE15430E40887
          C35188457C1C3BAC80612E4872EFC030F557EDE2DD1BDC5DC052F0474D1FB490
          0A4F6C7783CDFBF9084AD4D8B55B86B2FD72C8F377910321A2A7CFEEF241F7AF
          032EA71DEEE981ABA67F86BF24533C440C6F0B87BBD5B94B574C944624214A27
          CA29AE7EFFB4344F51214895A473FF90589C8D314B01AFCD30D1B76C1AEC2139
          0B4473448BDB81B78BC462A91B1613ADBDE7E673776C883BE96B8A10C5FF035F
          B12B5D053579EA0000000049454E44AE426082}
        Name = 'PngImage3'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003BA4944415478DAA5D30D4C1B651807F0FF5DBFAE2DFD709CC03A6116
          9046639CE262646C09A20D5B9699E25CB10B436573368B31662B719DCBDCDCC6
          C4C260714447D311CD36068B9961CC30226C91C4B0A80873D99444ABF221A405
          DB63E5A31FF77ADD4864C4B4159EE4EE4DDEBBF777CF3DEFF352584A98CFB70A
          F76EB4BCE258F8885A12BCA971F8EE48481DDACAEFC3FF1FBCEE782B68FAE9F9
          53A69DB9BA2F1B7A47C0F375E8DEED581CBCEAE0F0465BA1EEA61FE042FF4EA7
          31C0ED4FBB46D07F70C5E260FD9E5621B3FB32C6F6621D5C1747843FA983BB66
          91192F0CEDEBF76A1C45275C4BA8F1C21099EF7545A425B1AE78EB6DEB2EB95C
          65F37A46F591080F9EF09048C460D934B7A3CA9199C837A9FF42B9C940FD8EF2
          EDD06A59CC862288104026A2E0F78DC3E96A805AA3CEFFE4E4A96F1386A3A8DF
          CFD557D8ECF8EAFA106EFF2D864CAE444890C33301E42E27285A9D8ECA0F0FF3
          69A969ABAB1DB53F2602AB5E2DDFC6ED79A7022D3D63189E56A2AC6025D25905
          C27C0437FEF0A3FD87513C24BF832D793A013F72A7E96CB32A2E5CB17777C723
          5906E314A347FF8402BB8A32B14CC58091883015E4C14D87706B90C3D7FDA328
          7C381C0C8CFEC4FF3230B0F744EDC72762C22596CDE43DFB011CBA388817F30D
          7852AF012315434403C2FE616272169D373C700F7BA0968BF05ABE365A123437
          7D41C5844BCB2CC466DB87DA2E0EE6352BC0AAA577B3150B72304CF0E7180742
          8BD1D1751501650EF66F4CC1A1C307C899CF9BE8B8F0FE7DEFA3A6C38B3C038B
          8C07E550292488B6C4987F061211012D6670A9FD0A7CB2CCC8BB45ACE858D591
          E0B933CDB2B8353616AE3776BAA5A0680972321E80424A432517637A2622D45B
          0C2262E0BC700599FA6CDE98150E5D6E6FEBA9AE3A5E101336994C3B563DF584
          7383A914A7AE79F04C96065A21E32486862F1044AA46066E16B8DC3B066B010B
          47A5DDA351AB4EBA9C9F7D10B7DD765ADFE0D6E6AF43527A2E2EF5FB210BFBB0
          61CDA318F44EE1E6AD5F1164585872C5B8DEDD4126396EDAEDFE2DE2F17A0C57
          3BBFF92BE60189C6D6D21262C8790C2F59CAD1F6FD087EF7041124340CA91218
          1F4F86E3A89DDFF2B299EEF9AE0713E3E3BCCFEFF3CA24B2A27367CFF7C584A3
          B1D95CEC49494E092E4B662579CFE629B3B3B315AE46977B60E067E9A43F50B9
          5C975A5F6C32A1B7AF0FCF3FF702EF3AEDA405988A0B47CB221CEF6D7285C234
          3438B496A2287946467A3B21E442D5B19A468BC57294A289DDFAA61549496A54
          D77C8444E168D0731735EFBDE848E636BB4CA1641AE6E64A04B865FEE27F00E8
          577326F34905120000000049454E44AE426082}
        Name = 'PngImage27'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003BB4944415478DAAD940F4C1B6518C69FBBDEB5D796B60827B04ED002
          D2CC2C4EC962648C04D10617CD529C2BD6305498B3598C211B8DEB5CE6E63636
          2C8C2C8E98D17444B38DC16266C2661811B66C89615110A6994AA255F963490B
          B6C7CA9FD2DE79B7611C71691BC2937C7797F7FBF2CBFB3DEFFB1E8107C972DE
          2E3E8BD0F1DA662C53C4FF222F9FB683206AEE7E77BEB57A65C045C7ED20C91A
          F38E7CFD972D03E34BF678BE1F3776257C83A5E07507C6D6D84AF4DEB9FF425A
          1A58AB032E37F48E63E840C237580A36ECB68B99D5A0BA4C0FF7C5A51993643F
          3C8DCBCC58524AF53DB8A440EB0A79FCAF64967B5D11ED58C1AEB84FEFBE67DB
          A9546A6AFD3EAF211AE5C10B3C689A02CB66789CF5CEEC65812528371D6ADE5E
          558DE46416F30B514405402123100C4CC2E56E8156A72DFCF4E4A96F12064BD0
          60906BB6D73AF0D5CD51FCF4370585528D05911C990B217F9580D2F599A83B76
          88CF48CF58DFE06CFA3E11B0E68DAA6DDCEE1A3B3AFA263036AB4665F1A3C864
          5588F051DCFA2388AE7E2F1E51DEC1D602BD083F7CA7ED6CBB262ED8BE6757F7
          E33946D30C63C0D0940A3B4BB391A261C0D032CC847970B30BB83DC2E1EB212F
          4A1E8B8443DE1FF85F8687F79C68FAE4444C70B9758BF081633F0E5E1CC1E642
          239E32E8C0C829C84840AC1FA6A6E7D173CB07CF980F5AA50C6F16264B96A0BD
          ED0B2226B8A2D22AD4D6EE45532F07CB86D560B5F2BBD95222391C11F0E70407
          81A4D0DD7B1521751EF6BD94868387F60B673E6F23E382F7EDFD108DDD7E1418
          59643DAC844625CEB558B889E01C6899009262D0D97505014576F4FD525676B4
          FE70F8DC9976455C8F4D252F9A7A3C7210248DBCAC87A09293D02829CCCE4545
          BF29083206AE0B57906DC8E54D399185CB5D97FA1AEA8F17C7049BCDE6EDEB9E
          7ED2B5C95C8153D77C782647876431E3248644201446BA4E016E5EFC290D4CC0
          56CCC259E7F0E9B49A936ED7671FC56DB71DB6B7B98D854548CACC47E750108A
          48009B36ACC1887F063FDEFE15618685359FC2CD1BDDC234C7CD7A3CBF457D7E
          9FF16ACFF5BF620E88A4D72BCA0563DE1378C55A854BDF8DE3775F1861818431
          9D86696D2A9C471CFCD6572D64DFB77D989A9CE403C1805F412B4ACF9D3D3F18
          132C698BA5CC97969A164E4965E982670BD4B9B9B92A77ABDB333CFCB37C3A18
          AA5BA54F6F2E339B31303888E79F7B81779F76912298880B966C11C77B9B52A5
          328F8E8C6E240842999595D92508C285FAA38DAD56ABF508410A0EDB3B362425
          69D1D0F83112054B22171771DF79E92D2C16BB52A5665A1663E522B8438AFF03
          1AC36D2661732A550000000049454E44AE426082}
        Name = 'PngImage28'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000001B84944415478DAEDD3DD2B43611C07F0EF39B4E24629B990FF004549
          61A2ADD4D20C336C5E72B10B69A444DEAE089BBC9497D810426EBC2B1229C74B
          1BE5AD884BD3DCF907D81EBF9DE6B4C9DC48144F7DCE393D2FDF7EE739CFE1F0
          4D8DFB0FFEC3C1B6F151B6B4BA8C508EC7FADAA694F7E5604DBE9A5D5E5EC0ED
          F1C06432A1BEAE817B0B56935A924422C823992313E4F6B3D0EDDD2D66341A21
          97CB210802E2E3E2B0E1ABDA7BA9F385DAC90BC9223A3242AADF6531FFB76C6A
          6E64F30BF3E8315B30393D859BEB6B4CD8C6A1546473C1B66287287C212CD8B7
          494E4964CC03CCCCCC6265650963362BF47A03BA3ABAC5E00452455424F6DDBE
          FB3F07543B3B37CD5ADA5AA1D516A2D7D2C70987FBACB4CC80E8A86838ECA762
          F01EC9243DE48E38492529FAAC6243B99E1D1C0808E179F07C88D8F9FCF22CDE
          CD66B3B4709168FD163E9018BF0A03AA759CD85971890E61E1E1484B4F97065C
          AE47784F8842A914FBAE4894F7E410372925351F6C85D43ABBDBD998D58ABC5C
          0D06FA07A53967E7672CAF201732994C5C584EFA49A46FFC89AC938A60C1F28C
          5476FFE0C4F0D0307254EA803925061D3B3A3EFEC5BFF47FF0CF05BF0246B089
          06D228678B0000000049454E44AE426082}
        Name = 'PngImage30'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003454944415478DAE5D46D4814791C07F0EFCCCEECCEECBABB96935A9D
          960FB914D183449CD981D7DD6211C4F6A46C98853D2D1111A5D4765174959DAD
          9E44C951CB16456516D18B1E30C98A82307AD28A1E84DA4A2B6556DB1D5B1FC6
          DDF9371BBE887BE1DADDF5EA7E30FC61F8F1E1C7F7FF40E13B1515AD61DD7AC7
          5A9E3716FBC4B6947058814214B02C034148F4BACA5CA9FF088EA05257B06A65
          D10AC4C60AE8EB0F234C009D8642C0DF01B7E7304C6653F65F070FDD1E321C41
          0301A9AAA4D889CB775AF1EC23031D6F40BF2A877A83C81C49903B2D09A57FEC
          52121312A795BB2A1F0E05362E2B5A2A6DDA5082330DED78D7634061CE182409
          7A8494301EBD09A0F67E1B7EE03F6171D62815DFFDA9FA648D312A5CB26563DD
          B8348BB59B4B4153A71E6B735331DCC8816335E89615483DFD78DA22E16A531B
          668D0DC9C1B6C7CA8BE6E62DFB2B0FEC1F14CEB72F24BF39B763E7F916CCCBB6
          604A8A199C96818606D4FD4367571FEA1F89F0BE1361E235589E1D1B890435D5
          E7A841E182423B292EDE8ACA6B12F2668C8660D27E999651653944F0B65D02A1
          19D45DBB8EA02103DBE6C663E7AEEDE4C4F16A3A2ABC6DEB0E54D4F990651190
          3C828751CF227224DA03BD60350434C3E142ED15F875A9E1CDB982666FD96EF9
          D4891A5DD48CADB3665BEBBD5A50348B8CE461D06B691879063DBD61356F0644
          C3C17DF60A5253D2156B5AA8FF52EDC586F2B23F7306856D36DBCAC95327B9E7
          D80A70E88688E96966C4AA13C77034FC411909661DA43EE0D28376387204B84A
          9DA2D9643CE8711FFB3DEA715BED5825CDCCFE09314999B8D014802EE4C79C19
          E3D1E2EBC693A72F217302EC990CEEDCAA235D92D4E3F5BE0A8B3ED172BDFEE6
          87412F48A49614E4134BC6042CB017E1E2BDF7782DCA90090D4B020BEBC438B8
          F63895C58BF2E886BB0DE8ECE850FC01BF4FC7EA724F9D3CDD18F5AD5898375F
          8C8F8B9787C7096CD68F5986F4F474BDE7A8C7DBDCFC5CDB1508968E1C955035
          DF66C383C646FCF2F3AF8AE7889B56612A2A1C8945BDDE4B79BDDED6DAD23A93
          A2283E3939A9961072B66C6FC551BBDDBE87A289D3B1C681981813CA2BF661A8
          70A4E8818FFA2ABEC84A0636BB506FE00E0FFCCB57E1334385BFB9FE0E936FEC
          FFF78DFFBF89FFB3FA0CF19445267D27B8E00000000049454E44AE426082}
        Name = 'PngImage29'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B0000024B4944415478DAC5D54B6C12411800E07FA1E5B1BC24D55A1B6FC683
          311ED444939E35460F8D477B33A6D21629A54FE923D654A0D0F449115A6C3CAA
          F1E8C1C68B492F4D3C71F064D4730B2285855D1816A903419209F9E7D28393FC
          BBB3F3CFFF253BBB931180B699B9A76F09210FE0844DAFD7BF0BF8427DB5BE50
          BB8C4F7A8E179EFBB945C1253F78A766B973167CCF20B4B822B4C0A458448B56
          C32B30E61E47F33A83015EF8E7119870E0750A7B38B08E031739F0C6C62A8C8C
          8CA179030F2645052D5CDB5C83D1E151CE521871585164B4301C5907B7CB83E6
          8D46F13FC0B29C6726777676A1502A75C83C8BA219870B05098522D14D703987
          D1BCC964E1C079163EDB750E859287072C6CE6C0929443A1E856049C832E346F
          B15839702E8BC3DB2FC139F00487AD361CCEE58EEA93BCFB5720D8F395298C6D
          476168C0C98CCD7DB90ABE9B897ADF6A3D85C3D96C064289DB50526598BFB1CF
          205BF1180C3A8698B160E21648C5DF10E84980CD66C7E199BDEB502A2B746BCB
          5021C74DA05AAD8220082DAFAF336A40A1734989C09BBE3C0E4F7CBE0C25A2D0
          BF438692546D02423B028B00E5B20A2AF903EF1F16703893F905DEBD6B201DC9
          10BDFF8D41E23B7170F43B9831F7EE2550551562BD3FC06E3F8DC3E974AA5EE0
          DABD0091BB3F1964E7F52BE87FF498853F5D84F09DEFF57E47C7191CAEAD25D6
          969617616A621ACD6B349AD613647A76F28356DB760F4ED82A15F56330B0DCDB
          84B55A4D5BF7F96E5BF22029D28F413F09FC0B73234C342C34DA69101A8546C8
          8D7BDA64120BB2ACD43642EDB410FE02EACA562750D5E62E0000000049454E44
          AE426082}
        Name = 'PngImage31'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002884944415478DABDD54B6F12511407F0039442191E45340DC48D1BA3
          F5B1D0A5FD045D148D1BDBB832052CB540A1ADD636556BE92B7D41150AD4EE4C
          5DBBD06A5DB85213FD046A6BDD4850C27B9E4CA9C3053164EE842E8C373999FC
          4FE6FE7266320F1908EBEEF8ED4D9665AFC13F582A95EAD9F4D45CB7AC1C7CC3
          9E83C9FB7EC99367E7FD706764EC50F0E4D404CCCD2CCAEA6096A6B1272F0517
          C1EBF235449BD56A78E8BF878159097845803D62F8C1870EE0F619F05FFA5481
          9B25605A020E0496C0EDF6D65FF2BB0E60790A389E018EE121D0F919D452304B
          5358787975190607066BD9F3F624A8155A60380A688A01A6C003288BB0793D87
          87298AC4C2C1472BE0BAE511F5DD2F4F413E4DC346CF77945B5A34FF1926C9BC
          041C1060B7A8EFD96A47F093EE6F286B345A3C5C28E46A9BDADACC928F552211
          AF4E7C5AB84A1A6257F75026089D049CCF61A1D55010069C2EF1C4AFDA111CBD
          529998D04AC0B95CB6B6C96CB6484E1C8FFF4047EFEB33085EBBBC8BB24EA797
          80B3192C148A3C06A7A35FD4F76E9FADC0D69D0AAC37E0E16C368D85C39110F4
          399CA2BE6FFB1C82C3D6AF28EBF5AD7838934961E1B568186EDAFB44FDA137E7
          111CEAFA82B2C160C4C3E9341E8EC4C2E0B0FD85273E5E00427904725412289A
          049E9541098AF0B427838753E924168EC62260B739EA7AE3EF2F02C51484EF44
          11F63999703B76C0D86A928053BFF0F07A14ECBD7651BF7FEB8430ED0144AC7B
          281B8D47F17032F9130BAF6FC4A0F7860D1A2D93E9181E2E954AD80DF30B3330
          3234DA1096CBE5F57F90D1B1E1E70A455367C39D87583C5F7C313BBDD0856085
          42DE64396E3124E2090DC7153542EB4F69AB4508A5134A29142B54A15A64F558
          FE905304A1299024557E1998DF14438A2773A5C4F60000000049454E44AE4260
          82}
        Name = 'PngImage32'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000002094944415478DAED924B6813511440E793494B4D1103B61441A86423
          0A45138A8A102949BA11FFE04ABB735150A125FD2C04174A45D14576B6D06ED4
          82E0C275C8646169CB98E02601E9C28AD46A2BA292FE98AF6724238813172188
          051F1CEE7D77DE3BEF334F147C5A32997443B3699A5BF97C5EA8A78975CDDAD6
          E268342A148BC5C68B63B198502814FE91AB4824126149929EF13A4EA9AA5A69
          A4B81DF19C6559C772B9DCC7BAC4480248AE3B8ED32D8AE25B64B7E8B790CF53
          7BC890C3E49A611819DEB69E4AA5E2D4FAA089EF63D96CB6E42B8EC7E3014551
          CE907E45D84F2CD8B63D495E66E26378419E263EE2DB0C8B3C25CFC0329438D1
          6B5FB12CCB522412391B0E874FB240173B2EC308F55924BD2CB280F832F102C3
          4BE42118E6041B8C13344D736ADDF111984074831D1C84FDF48760168EBA3B23
          5E62918BC405306198FA2F423F712FDC83AB90864A55ECBEFE4950E1363C8157
          30053761C53D012CD512876014223007364CC31506496CEB10F9CBAAF0339C87
          7360ED0B0AE36F74215F4BECB6266886CDEA37FD4187DC31F0C15ACE74864E5C
          5B5C9BA7B6E5FD166839DD2AB63EAFFCB826E14FE286B59FE2C59EBDCE37C31A
          D9A9C87774DB190C4AE2FD35D31E0A05A4BB5F0C6B7497228F79D1AB7BE3BC79
          9DEA3BF137B1767C4FDBEEA0BCB26EDA6D3B02D2AA173FE956BB5B271E2096BD
          BEDFB8EE99F7AB7FEF2AFE8BBF0354F2FC17FD1FBF060000000049454E44AE42
          6082}
        Name = 'PngImage44'
        Background = clWindow
      end>
    Left = 438
    Top = 98
    Bitmap = {}
  end
end
