object fmMain: TfmMain
  Left = 313
  Top = 159
  AutoScroll = False
  ClientHeight = 657
  ClientWidth = 892
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
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
      Images = ImageListIconsTango22b
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
        ImageIndex = 26
        OnSelect = ButtonOnSelect
        DropdownCombo = True
        object TBXItemPreview: TSpTBXItem
          Caption = 'Preview...'
          Hint = ' '
          OnClick = TBXItemPreviewClick
          OnSelect = ButtonOnSelect
        end
        object TBXItemPageS: TSpTBXItem
          Action = ecPageSetupAction
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
        ImageIndex = 24
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
          Action = acSetupLexer
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOLexSt: TSpTBXItem
          Caption = 'Customize lexer &styles...'
          Hint = 'Customize current lexer'#39's highlighting properties'
          Action = acSetupLexHL
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOLexLib: TSpTBXItem
          Action = acSetupLexLib
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSeparatorItem48: TSpTBXSeparatorItem
      end
      object TBXItemTbSpellLive: TSpTBXSubmenuItem
        Caption = 'Live spelling'
        Hint = 'Enable live spelling (red underlines)'
        Action = ecSpellLive
        ImageIndex = 34
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
      Images = ImageListIconsTango22b
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
      Images = ImageListIconsTango22b
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
        ImageIndex = 28
        OnClick = TBXItemFFNextClick
      end
      object TBXItemFFPrev: TSpTBXItem
        Caption = 'Previous'
        Hint = 'Find previous'
        Enabled = False
        ImageIndex = 29
        OnClick = TBXItemFFPrevClick
      end
      object cbCase: TSpTBXItem
        Caption = 'Case'
        Hint = 'Case sensitive'
        DisplayMode = nbdmTextOnly
        ImageIndex = 30
        OnClick = cbCaseClick
      end
      object cbWord: TSpTBXItem
        Caption = 'Words'
        Hint = 'Whole words only'
        DisplayMode = nbdmTextOnly
        ImageIndex = 31
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
            Caption = 'Pa&ge setup...'
            Hint = ' '
            Action = ecPageSetupAction
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
        object TBXSubmenuItem18: TSpTBXSubmenuItem
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
          end
          object TBXItemECpFullPath: TSpTBXItem
            Caption = 'Copy full path to clipboard'
            OnClick = TBXItemECpFullPathClick
          end
          object TBXItemECpDirPath: TSpTBXItem
            Caption = 'Copy dir path to clipboard'
            OnClick = TBXItemECpDirPathClick
          end
        end
        object TBXSubmenuItem16: TSpTBXSubmenuItem
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
        object TBXSubmenuItem17: TSpTBXSubmenuItem
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
          end
          object TBXItemEExtractDupNoCase: TSpTBXItem
            Caption = 'Extract duplicates (case-insensitive)'
            OnClick = TBXItemEExtractDupNoCaseClick
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
          end
        end
        object TBXSubmenuItem1: TSpTBXSubmenuItem
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
        object TBXSubmenuItem13: TSpTBXSubmenuItem
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
        object TBXSubmenuItem19: TSpTBXSubmenuItem
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
        object TBXSubmenuItem20: TSpTBXSubmenuItem
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
        object TbxSubmenuCarets: TSpTBXSubmenuItem
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
          Caption = 'Customi&ze lexer...'
          Hint = 'Customize current lexer'
          Action = acSetupLexer
          OnSelect = ButtonOnSelect
        end
        object TBXItemOLexerHi: TSpTBXItem
          Caption = 'Customize lexer &styles...'
          Hint = 'Customize current lexer'#39's highlighting properties'
          Action = acSetupLexHL
          OnSelect = ButtonOnSelect
        end
        object TBXItemOLexerLib: TSpTBXItem
          Caption = 'Customize &lexers library...'
          Hint = 'Customize lexers library'
          Action = acSetupLexLib
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
      Images = ImageListIconsTango22b
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
        ImageIndex = 25
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
        ImageIndex = 32
        OnSelect = ButtonOnSelect
      end
      object TBXItemVSyncV: TSpTBXItem
        Caption = 'Sync vertical scrolling'
        Hint = 'Synchronize vertical scrolling of groups 1/2'
        Action = ecSyncScrollV
        ImageIndex = 33
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
    object ecPageSetupAction: TecPageSetupAction
      Category = 'Print'
      Caption = 'Page setup...'
      Hint = ' '
      BeforeExecute = ecPageSetupActionBeforeExecute
      OnExecuteOK = ecPageSetupActionExecuteOK
      Command = 633
      SyntPrinter = ecSyntPrinter
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
      Tag = 709
      Category = 'File'
      Caption = 'Setup...'
      Hint = 'Dialog "Options"'
      OnExecute = acSetupExecute
    end
    object acSetupLexer: TecCustomizeLexerPropertiesAction
      Tag = 710
      Category = 'File'
      Caption = 'Customize lexer...'
      Hint = 'Customize current lexer'
      OnExecuteOK = acSetupLexerExecuteOK
    end
    object acSetupLexLib: TAction
      Tag = 711
      Category = 'File'
      Caption = 'Customize lexer library...'
      Hint = 'Customize lexers library'
      OnExecute = acSetupLexLibExecute
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
    object acSetupLexHL: TAction
      Category = 'File'
      OnExecute = acSetupLexHLExecute
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
    Images = ImageListIconsTango22b
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
      ImageIndex = 27
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
      0600666D4D61696E00010A0400000A00544258446F636B546F70000006007462
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
      74656D50616765530102000000C8020000070043617074696F6E770A00000400
      48696E74000D005442584974656D5072696E74530101000000CA020000070043
      617074696F6E0015005462785375626D656E754974656D54626C46696E640102
      000000E0090000070043617074696F6EE1090000040048696E74000C00544258
      4974656D464E6578740101000000CE020000070043617074696F6E000C005442
      584974656D46507265760101000000D0020000070043617074696F6E00110054
      4258536570617261746F724974656D3900000C005442584974656D574E657874
      0101000000D2020000070043617074696F6E000D005442584974656D57507269
      6F720101000000D4020000070043617074696F6E001200544258536570617261
      746F724974656D3131000008005442584974656D320101000000D60200000700
      43617074696F6E001100544258536570617261746F724974656D310000150054
      42585375626D656E754974656D546253657475700102000000F2020000070043
      617074696F6EF3020000040048696E74000C005442584974656D4F4F4C657801
      02000000F4020000070043617074696F6EF5020000040048696E74000F005442
      584974656D4F4F4C65784C69620102000000F6020000070043617074696F6EF7
      020000040048696E740006007462456469740101000000FA0200000700436170
      74696F6E000D005442584974656D5462436F70790102000000FB020000070043
      617074696F6EFC020000040048696E74000C005442584974656D546243757401
      02000000FD020000070043617074696F6EFE020000040048696E74000E005442
      584974656D546250617374650102000000FF020000070043617074696F6E0003
      0000040048696E74000C005442584974656D546244656C010200000001030000
      070043617074696F6E02030000040048696E74000F005442584974656D546253
      656C416C6C010200000003030000070043617074696F6E04030000040048696E
      74001100544258536570617261746F724974656D3300000D005442584974656D
      5462556E646F010200000005030000070043617074696F6E0603000004004869
      6E74000D005442584974656D54625265646F0102000000070300000700436170
      74696F6E08030000040048696E74001100544258536570617261746F72497465
      6D34000012005442585375626D656E754974656D536F72740102000000090300
      00070043617074696F6EEC080000040048696E740010005442584974656D5462
      536F727441736301020000000B030000070043617074696F6E0C030000040048
      696E740011005442584974656D5462536F72744465736301020000000D030000
      070043617074696F6E0E030000040048696E74000E005442585375626D656E75
      4361736501020000000F030000070043617074696F6E10030000040048696E74
      000E005442584974656D43435570706572010200000011030000070043617074
      696F6E12030000040048696E74000E005442584974656D43434C6F7765720102
      00000013030000070043617074696F6E14030000040048696E74000E00544258
      4974656D43435469746C65010200000015030000070043617074696F6E160300
      00040048696E74000C005442584974656D4343496E7601020000001703000007
      0043617074696F6E18030000040048696E74000B00544258446F636B4C656674
      00000600746256696577010100000019030000070043617074696F6E00110054
      42584974656D5650616E656C5472656501020000001A03000007004361707469
      6F6E460A0000040048696E74000D005442584974656D564E6F6E707201020000
      0022030000070043617074696F6E450A0000040048696E740011005442585365
      70617261746F724974656D3200000C005442584974656D56436F6D6D01020000
      0024030000070043617074696F6E25030000040048696E74000D005442584974
      656D56556E636F6D010200000026030000070043617074696F6E270300000400
      48696E74001200544258536570617261746F724974656D313000000B00544258
      4974656D56496E64010200000028030000070043617074696F6E290300000400
      48696E74000D005442584974656D56556E696E6401020000002A030000070043
      617074696F6E2B030000040048696E74000600706C5472656500010100000007
      00546F6F6C6261720101000000E2090000070043617074696F6E000400547265
      6500000D00544258446F636B426F74746F6D00000C00544258446F636B526967
      6874000006005374617475730001010000000D00537461747573546F6F6C6261
      720101000000E5090000070043617074696F6E0004004D656E75000006007462
      4D656E750101000000FB050000070043617074696F6E0012005442585375626D
      656E754974656D46696C65010100000035030000070043617074696F6E001200
      5442585375626D656E754974656D464E65770101000000360300000700436170
      74696F6E000B005442584974656D464E65770102000000370300000700436170
      74696F6E38030000040048696E74000E005442584974656D464E657757696E01
      0100000039030000070043617074696F6E000C005442584974656D464F70656E
      01020000003A030000070043617074696F6E3B030000040048696E74000E0054
      42584974656D4652656F70656E01020000003C030000070043617074696F6E3D
      030000040048696E74000C005442584974656D465361766501020000003E0300
      00070043617074696F6E3F030000040048696E74000E005442584974656D4653
      6176654173010200000040030000070043617074696F6E41030000040048696E
      740014005442585375626D656E754974656D4578706F72740101000000420300
      00070043617074696F6E000F005442584974656D4645787048746D6C01020000
      0043030000070043617074696F6E44030000040048696E74000E005442584974
      656D46457870527466010200000045030000070043617074696F6E4603000004
      0048696E74000D005442584974656D465072696E740102000000480300000700
      43617074696F6E780A0000040048696E74000F005442584974656D4650726576
      69657701020000004A030000070043617074696F6E790A0000040048696E7400
      11005442584974656D4650616765536574757001020000004C03000007004361
      7074696F6E7A0A0000040048696E740014005442584974656D465072696E7465
      72536574757001020000004E030000070043617074696F6E7E0A000004004869
      6E74001200544258536570617261746F724974656D313500000C005442584974
      656D4645786974010200000050030000070043617074696F6E26050000040048
      696E740010005442585375626D656E754974656D456401010000005103000007
      0043617074696F6E000C005442584974656D45556E646F010200000052030000
      070043617074696F6E53030000040048696E74000C005442584974656D455265
      646F010200000054030000070043617074696F6E55030000040048696E740011
      00544258536570617261746F724974656D3600000B005442584974656D454375
      74010200000056030000070043617074696F6E57030000040048696E74000C00
      5442584974656D45436F7079010200000058030000070043617074696F6E5903
      0000040048696E74000D005442584974656D45506173746501020000005A0300
      00070043617074696F6E5B030000040048696E74000E005442584974656D4544
      656C65746501020000005C030000070043617074696F6E5D030000040048696E
      740011005442584974656D4553656C656374416C6C01020000005E0300000700
      43617074696F6E5F030000040048696E74001200544258536570617261746F72
      4974656D313700000E005442584974656D45496E64656E740102000000640300
      00070043617074696F6E65030000040048696E740010005442584974656D4555
      6E696E64656E74010200000066030000070043617074696F6E67030000040048
      696E74000B005442584974656D45447570010200000068030000070043617074
      696F6E22050000040048696E74000D005442584974656D455461626C65010200
      000069030000070043617074696F6E23050000040048696E7400100054425853
      75626D656E754974656D313901010000006A030000070043617074696F6E000F
      005442584974656D45536F727441736301020000006C03000007004361707469
      6F6E6D030000040048696E740010005442584974656D45536F72744465736301
      020000006E030000070043617074696F6E6F030000040048696E740010005442
      585375626D656E754974656D3230010100000070030000070043617074696F6E
      0011005442584974656D45436173655570706572010200000072030000070043
      617074696F6E73030000040048696E740011005442584974656D45436173654C
      6F776572010200000074030000070043617074696F6E75030000040048696E74
      0011005442584974656D45436173655469746C65010200000076030000070043
      617074696F6E77030000040048696E740012005442584974656D454361736549
      6E76657274010200000078030000070043617074696F6E79030000040048696E
      740010005442585375626D656E754974656D5372010100000090030000070043
      617074696F6E000C005442584974656D534E6578740102000000930300000700
      43617074696F6E94030000040048696E74000C005442584974656D5350726576
      010200000095030000070043617074696F6E96030000040048696E7400120054
      4258536570617261746F724974656D3139000010005442584974656D53576F72
      644E657874010200000097030000070043617074696F6E98030000040048696E
      740011005442584974656D53576F72645072696F720102000000990300000700
      43617074696F6E9A030000040048696E74001200544258536570617261746F72
      4974656D3230000010005442584974656D534D61726B4E65787401020000009B
      030000070043617074696F6E12050000040048696E740010005442584974656D
      534D61726B5072657601020000009C030000070043617074696F6E1305000004
      0048696E740011005442584974656D534D61726B436C65617201020000009D03
      0000070043617074696F6E9E030000040048696E740012005442585365706172
      61746F724974656D323100000C005442584974656D53476F746F01020000009F
      030000070043617074696F6EA0030000040048696E740010005442585375626D
      656E754974656D426B0101000000A1030000070043617074696F6E0013005442
      585375626D656E754974656D426B5365740102000000A2030000070043617074
      696F6E11070000040048696E740009005442584974656D47300101000000A303
      0000070043617074696F6E0009005442584974656D47310101000000A4030000
      070043617074696F6E0009005442584974656D47320101000000A50300000700
      43617074696F6E0009005442584974656D47330101000000A603000007004361
      7074696F6E0009005442584974656D47340101000000A7030000070043617074
      696F6E0009005442584974656D47350101000000A8030000070043617074696F
      6E0009005442584974656D47360101000000A9030000070043617074696F6E00
      09005442584974656D47370101000000AA030000070043617074696F6E000900
      5442584974656D47380101000000AB030000070043617074696F6E0009005442
      584974656D47390101000000AC030000070043617074696F6E00140054425853
      75626D656E754974656D426B476F746F0102000000AD03000007004361707469
      6F6E12070000040048696E740009005442584974656D42300101000000AE0300
      00070043617074696F6E0009005442584974656D42310101000000AF03000007
      0043617074696F6E0009005442584974656D42320101000000B0030000070043
      617074696F6E0009005442584974656D42330101000000B10300000700436170
      74696F6E0009005442584974656D42340101000000B203000007004361707469
      6F6E0009005442584974656D42350101000000B3030000070043617074696F6E
      0009005442584974656D42360101000000B4030000070043617074696F6E0009
      005442584974656D42370101000000B5030000070043617074696F6E00090054
      42584974656D42380101000000B6030000070043617074696F6E000900544258
      4974656D42390101000000B7030000070043617074696F6E0013005442585375
      626D656E754974656D4C657865720101000000BA030000070043617074696F6E
      0011005442585375626D656E754974656D4F70740101000000BB030000070043
      617074696F6E000D005442584974656D4F53657475700102000000BC03000007
      0043617074696F6EBD030000040048696E74000D005442584974656D4F4C6578
      65720102000000BE030000070043617074696F6EBF030000040048696E740010
      005442584974656D4F4C657865724C69620102000000C0030000070043617074
      696F6EC1030000040048696E74000A005442584974656D4F524F0102000000C3
      030000070043617074696F6EC4030000040048696E74000C005442584974656D
      4F547265650102000000C5030000070043617074696F6EC6030000040048696E
      74000C005442584974656D4F466F6C640102000000C703000007004361707469
      6F6EC8030000040048696E74000C005442584974656D4F577261700102000000
      C9030000070043617074696F6ECA030000040048696E74000C00544258497465
      6D4F4E756D730102000000CB030000070043617074696F6ECC03000004004869
      6E74000E005442584974656D4F4E5072696E740102000000CD03000007004361
      7074696F6EC4090000040048696E740012005442585375626D656E754974656D
      48656C700101000000CF030000070043617074696F6E0014005442584974656D
      48656C70526561646D654469720102000000D0030000070043617074696F6E20
      050000040048696E740010005442584974656D48656C7041626F757401020000
      00D1030000070043617074696F6E21050000040048696E7400070050616E656C
      426700000E0054656D706C617465456469746F7200000A00416374696F6E4C69
      737400000D0065635072696E74416374696F6E01020000000600000007004361
      7074696F6E7B0A0000040048696E740011006563506167655365747570416374
      696F6E01020000000C000000070043617074696F6E7D0A0000040048696E7400
      080061634E657754616201020000000F000000070043617074696F6E10000000
      040048696E74000B0061634E657757696E646F77010100000012000000070043
      617074696F6E000E0065635072696E7465725365747570010100000014000000
      070043617074696F6E00060061634F70656E0102000000170000000700436170
      74696F6E18000000040048696E74000800616352657265616401020000001A00
      0000070043617074696F6E1B000000040048696E740006006163536176650102
      0000001D000000070043617074696F6E1E000000040048696E74000800616353
      6176654173010200000020000000070043617074696F6E21000000040048696E
      74000B0061634578706F7274525446010400000023000000070043617074696F
      6E250000000A0044656661756C7445787426000000060046696C746572240000
      00040048696E74000C0061634578706F727448544D4C01040000002800000007
      0043617074696F6E2A0000000A0044656661756C744578742B00000006004669
      6C74657229000000040048696E740007006163536574757001020000002D0000
      00070043617074696F6E2E000000040048696E74000C00616353657475704C65
      786572010200000030000000070043617074696F6E31000000040048696E7400
      0D00616353657475704C65784C6962010200000033000000070043617074696F
      6E34000000040048696E740006006563436F7079010200000036000000070043
      617074696F6E37000000040048696E74000500656343757401020000003C0000
      00070043617074696F6E3D000000040048696E74000700656350617374650102
      0000003F000000070043617074696F6E40000000040048696E74000700656343
      6C656172010200000042000000070043617074696F6E43000000040048696E74
      000B00656353656C656374416C6C010200000045000000070043617074696F6E
      46000000040048696E740006006563556E646F01020000004800000007004361
      7074696F6E49000000040048696E7400060065635265646F01020000004B0000
      00070043617074696F6E4C000000040048696E740008006563496E64656E7401
      020000004E000000070043617074696F6E4F000000040048696E74000A006563
      556E696E64656E74010200000051000000070043617074696F6E520000000400
      48696E74000B0065634C6F776572436173650101000000540000000700436170
      74696F6E000B0065635570706572436173650101000000560000000700436170
      74696F6E000B0065635469746C65436173650101000000580000000700436170
      74696F6E000C006563546F67676C654361736501010000005A00000007004361
      7074696F6E000E006563436F6D6D656E744C696E657301020000005C00000007
      0043617074696F6E5D000000040048696E740010006563556E436F6D6D656E74
      4C696E657301020000005F000000070043617074696F6E60000000040048696E
      74000A00656353686F7754726565010100000062000000070043617074696F6E
      000F006563536F7274417363656E64696E670102000000650000000700436170
      74696F6E66000000040048696E740010006563536F727444657363656E64696E
      67010200000068000000070043617074696F6E69000000040048696E74000A00
      6563526561644F6E6C7901020000006E000000070043617074696F6E6F000000
      040048696E74000600656346696E64010100000072000000040048696E740006
      00656357726170010200000074000000070043617074696F6E75000000040048
      696E74000A0065634C696E654E756D7301020000007700000007004361707469
      6F6E78000000040048696E740009006563466F6C64696E6701020000007A0000
      00070043617074696F6E7B000000040048696E74000A0065634E6F6E5072696E
      7401020000007D000000070043617074696F6E7E000000040048696E74000200
      5344000002004F4401010000007F000000060046696C746572000D0053796E74
      61784D616E616765720101000000800000000D004D656E75506C61696E546578
      74000C0050726F70734D616E6167657200000D00656353796E745072696E7465
      7200000B00506F707570456469746F7200000E005442584974656D437478556E
      646F0102000000D2030000070043617074696F6ED3030000040048696E74000E
      005442584974656D4374785265646F0102000000D4030000070043617074696F
      6ED5030000040048696E74001200544258536570617261746F724974656D3134
      00000D005442584974656D4374784375740102000000D6030000070043617074
      696F6ED7030000040048696E74000E005442584974656D437478436F70790102
      000000D8030000070043617074696F6ED9030000040048696E74000F00544258
      4974656D43747850617374650102000000DA030000070043617074696F6EDB03
      0000040048696E74000D005442584974656D43747844656C0102000000DC0300
      00070043617074696F6EDD030000040048696E740013005442584974656D4374
      7853656C656374416C6C0102000000DE030000070043617074696F6EDF030000
      040048696E74000D00496D674C69737447757474657200000E0053796E744B65
      794D617070696E670180040000F403000011004974656D735B305D2E43617465
      676F72798900000014004974656D735B305D2E446973706C61794E616D655804
      000013004974656D735B3130305D2E43617465676F72797B0100001600497465
      6D735B3130305D2E446973706C61794E616D655904000013004974656D735B31
      30315D2E43617465676F72797D01000016004974656D735B3130315D2E446973
      706C61794E616D655A04000013004974656D735B3130325D2E43617465676F72
      797F01000016004974656D735B3130325D2E446973706C61794E616D655B0400
      0013004974656D735B3130335D2E43617465676F72798101000016004974656D
      735B3130335D2E446973706C61794E616D655C04000013004974656D735B3130
      345D2E43617465676F72798301000016004974656D735B3130345D2E44697370
      6C61794E616D655D04000013004974656D735B3130355D2E43617465676F7279
      8501000016004974656D735B3130355D2E446973706C61794E616D655E040000
      13004974656D735B3130365D2E43617465676F72798701000016004974656D73
      5B3130365D2E446973706C61794E616D655F04000013004974656D735B313037
      5D2E43617465676F72798901000016004974656D735B3130375D2E446973706C
      61794E616D656004000013004974656D735B3130385D2E43617465676F72798C
      01000016004974656D735B3130385D2E446973706C61794E616D656104000013
      004974656D735B3130395D2E43617465676F72798F01000016004974656D735B
      3130395D2E446973706C61794E616D65FE03000012004974656D735B31305D2E
      43617465676F7279A400000015004974656D735B31305D2E446973706C61794E
      616D656204000013004974656D735B3131305D2E43617465676F727992010000
      16004974656D735B3131305D2E446973706C61794E616D656304000013004974
      656D735B3131315D2E43617465676F72799501000016004974656D735B313131
      5D2E446973706C61794E616D656404000013004974656D735B3131325D2E4361
      7465676F72799801000016004974656D735B3131325D2E446973706C61794E61
      6D656504000013004974656D735B3131335D2E43617465676F72799B01000016
      004974656D735B3131335D2E446973706C61794E616D65660400001300497465
      6D735B3131345D2E43617465676F72799E01000016004974656D735B3131345D
      2E446973706C61794E616D656704000013004974656D735B3131355D2E436174
      65676F7279A101000016004974656D735B3131355D2E446973706C61794E616D
      656804000013004974656D735B3131365D2E43617465676F7279A40100001600
      4974656D735B3131365D2E446973706C61794E616D656904000013004974656D
      735B3131375D2E43617465676F7279A701000016004974656D735B3131375D2E
      446973706C61794E616D656A04000013004974656D735B3131385D2E43617465
      676F7279AA01000016004974656D735B3131385D2E446973706C61794E616D65
      6B04000013004974656D735B3131395D2E43617465676F7279AD010000160049
      74656D735B3131395D2E446973706C61794E616D65FF03000012004974656D73
      5B31315D2E43617465676F7279A600000015004974656D735B31315D2E446973
      706C61794E616D656C04000013004974656D735B3132305D2E43617465676F72
      79B001000016004974656D735B3132305D2E446973706C61794E616D656D0400
      0013004974656D735B3132315D2E43617465676F7279B301000016004974656D
      735B3132315D2E446973706C61794E616D656E04000013004974656D735B3132
      325D2E43617465676F7279B601000016004974656D735B3132325D2E44697370
      6C61794E616D656F04000013004974656D735B3132335D2E43617465676F7279
      B901000016004974656D735B3132335D2E446973706C61794E616D6570040000
      13004974656D735B3132345D2E43617465676F7279BC01000016004974656D73
      5B3132345D2E446973706C61794E616D657104000013004974656D735B313235
      5D2E43617465676F7279BF01000016004974656D735B3132355D2E446973706C
      61794E616D657204000013004974656D735B3132365D2E43617465676F7279C2
      01000016004974656D735B3132365D2E446973706C61794E616D657304000013
      004974656D735B3132375D2E43617465676F7279C501000016004974656D735B
      3132375D2E446973706C61794E616D657404000013004974656D735B3132385D
      2E43617465676F7279C801000016004974656D735B3132385D2E446973706C61
      794E616D657504000013004974656D735B3132395D2E43617465676F7279CA01
      000016004974656D735B3132395D2E446973706C61794E616D65000400001200
      4974656D735B31325D2E43617465676F7279A800000015004974656D735B3132
      5D2E446973706C61794E616D657604000013004974656D735B3133305D2E4361
      7465676F7279CC01000016004974656D735B3133305D2E446973706C61794E61
      6D657704000013004974656D735B3133315D2E43617465676F7279CE01000016
      004974656D735B3133315D2E446973706C61794E616D65780400001300497465
      6D735B3133325D2E43617465676F7279D001000016004974656D735B3133325D
      2E446973706C61794E616D657904000013004974656D735B3133335D2E436174
      65676F7279D301000016004974656D735B3133335D2E446973706C61794E616D
      657A04000013004974656D735B3133345D2E43617465676F7279D60100001600
      4974656D735B3133345D2E446973706C61794E616D657B04000013004974656D
      735B3133355D2E43617465676F7279D801000016004974656D735B3133355D2E
      446973706C61794E616D657C04000013004974656D735B3133365D2E43617465
      676F7279DA01000016004974656D735B3133365D2E446973706C61794E616D65
      7D04000013004974656D735B3133375D2E43617465676F7279DD010000160049
      74656D735B3133375D2E446973706C61794E616D657E04000013004974656D73
      5B3133385D2E43617465676F7279E001000016004974656D735B3133385D2E44
      6973706C61794E616D657F04000013004974656D735B3133395D2E4361746567
      6F7279E301000016004974656D735B3133395D2E446973706C61794E616D6501
      04000012004974656D735B31335D2E43617465676F7279AA0000001500497465
      6D735B31335D2E446973706C61794E616D658004000013004974656D735B3134
      305D2E43617465676F7279E601000016004974656D735B3134305D2E44697370
      6C61794E616D658104000013004974656D735B3134315D2E43617465676F7279
      E901000016004974656D735B3134315D2E446973706C61794E616D6582040000
      13004974656D735B3134325D2E43617465676F7279EC01000016004974656D73
      5B3134325D2E446973706C61794E616D658304000013004974656D735B313433
      5D2E43617465676F7279EF01000016004974656D735B3134335D2E446973706C
      61794E616D658404000013004974656D735B3134345D2E43617465676F7279F2
      01000016004974656D735B3134345D2E446973706C61794E616D658504000013
      004974656D735B3134355D2E43617465676F7279F501000016004974656D735B
      3134355D2E446973706C61794E616D658604000013004974656D735B3134365D
      2E43617465676F7279F801000016004974656D735B3134365D2E446973706C61
      794E616D658704000013004974656D735B3134375D2E43617465676F7279FB01
      000016004974656D735B3134375D2E446973706C61794E616D65880400001300
      4974656D735B3134385D2E43617465676F7279FE01000016004974656D735B31
      34385D2E446973706C61794E616D658904000013004974656D735B3134395D2E
      43617465676F72790102000016004974656D735B3134395D2E446973706C6179
      4E616D650204000012004974656D735B31345D2E43617465676F7279AC000000
      15004974656D735B31345D2E446973706C61794E616D658A0400001300497465
      6D735B3135305D2E43617465676F72790402000016004974656D735B3135305D
      2E446973706C61794E616D658B04000013004974656D735B3135315D2E436174
      65676F72790702000016004974656D735B3135315D2E446973706C61794E616D
      658C04000013004974656D735B3135325D2E43617465676F72790A0200001600
      4974656D735B3135325D2E446973706C61794E616D658D04000013004974656D
      735B3135335D2E43617465676F72790D02000016004974656D735B3135335D2E
      446973706C61794E616D658E04000013004974656D735B3135345D2E43617465
      676F72791002000016004974656D735B3135345D2E446973706C61794E616D65
      8F04000013004974656D735B3135355D2E43617465676F727913020000160049
      74656D735B3135355D2E446973706C61794E616D659004000013004974656D73
      5B3135365D2E43617465676F72791602000016004974656D735B3135365D2E44
      6973706C61794E616D659104000013004974656D735B3135375D2E4361746567
      6F72791902000016004974656D735B3135375D2E446973706C61794E616D6592
      04000013004974656D735B3135385D2E43617465676F72791C02000016004974
      656D735B3135385D2E446973706C61794E616D659304000013004974656D735B
      3135395D2E43617465676F72791F02000016004974656D735B3135395D2E4469
      73706C61794E616D650304000012004974656D735B31355D2E43617465676F72
      79AE00000015004974656D735B31355D2E446973706C61794E616D6594040000
      13004974656D735B3136305D2E43617465676F72792202000016004974656D73
      5B3136305D2E446973706C61794E616D659504000013004974656D735B313631
      5D2E43617465676F72792502000016004974656D735B3136315D2E446973706C
      61794E616D659604000013004974656D735B3136325D2E43617465676F727928
      02000016004974656D735B3136325D2E446973706C61794E616D659704000013
      004974656D735B3136335D2E43617465676F72792B02000016004974656D735B
      3136335D2E446973706C61794E616D659804000013004974656D735B3136345D
      2E43617465676F72792E02000016004974656D735B3136345D2E446973706C61
      794E616D659904000013004974656D735B3136355D2E43617465676F72793102
      000016004974656D735B3136355D2E446973706C61794E616D659A0400001300
      4974656D735B3136365D2E43617465676F72793402000016004974656D735B31
      36365D2E446973706C61794E616D659B04000013004974656D735B3136375D2E
      43617465676F72793702000016004974656D735B3136375D2E446973706C6179
      4E616D659C04000013004974656D735B3136385D2E43617465676F72793A0200
      0016004974656D735B3136385D2E446973706C61794E616D659D040000130049
      74656D735B3136395D2E43617465676F72793D02000016004974656D735B3136
      395D2E446973706C61794E616D650404000012004974656D735B31365D2E4361
      7465676F7279B000000015004974656D735B31365D2E446973706C61794E616D
      659E04000013004974656D735B3137305D2E43617465676F7279400200001600
      4974656D735B3137305D2E446973706C61794E616D659F04000013004974656D
      735B3137315D2E43617465676F72794302000016004974656D735B3137315D2E
      446973706C61794E616D65A004000013004974656D735B3137325D2E43617465
      676F72794602000016004974656D735B3137325D2E446973706C61794E616D65
      A104000013004974656D735B3137335D2E43617465676F727949020000160049
      74656D735B3137335D2E446973706C61794E616D65A204000013004974656D73
      5B3137345D2E43617465676F72794C02000016004974656D735B3137345D2E44
      6973706C61794E616D65A304000013004974656D735B3137355D2E4361746567
      6F72794F02000016004974656D735B3137355D2E446973706C61794E616D65A4
      04000013004974656D735B3137365D2E43617465676F72795202000016004974
      656D735B3137365D2E446973706C61794E616D65A504000013004974656D735B
      3137375D2E43617465676F72795502000016004974656D735B3137375D2E4469
      73706C61794E616D65A604000013004974656D735B3137385D2E43617465676F
      72795802000016004974656D735B3137385D2E446973706C61794E616D65A704
      000013004974656D735B3137395D2E43617465676F72795B0200001600497465
      6D735B3137395D2E446973706C61794E616D650504000012004974656D735B31
      375D2E43617465676F7279B200000015004974656D735B31375D2E446973706C
      61794E616D65A804000013004974656D735B3138305D2E43617465676F72795E
      02000016004974656D735B3138305D2E446973706C61794E616D65A904000013
      004974656D735B3138315D2E43617465676F72796102000016004974656D735B
      3138315D2E446973706C61794E616D65AA04000013004974656D735B3138325D
      2E43617465676F72796402000016004974656D735B3138325D2E446973706C61
      794E616D65AB04000013004974656D735B3138335D2E43617465676F72796702
      000016004974656D735B3138335D2E446973706C61794E616D65AC0400001300
      4974656D735B3138345D2E43617465676F72796A02000016004974656D735B31
      38345D2E446973706C61794E616D65AD04000013004974656D735B3138355D2E
      43617465676F72796D02000016004974656D735B3138355D2E446973706C6179
      4E616D65AE04000013004974656D735B3138365D2E43617465676F7279700200
      0016004974656D735B3138365D2E446973706C61794E616D65AF040000130049
      74656D735B3138375D2E43617465676F72797302000016004974656D735B3138
      375D2E446973706C61794E616D65B004000013004974656D735B3138385D2E43
      617465676F72797602000016004974656D735B3138385D2E446973706C61794E
      616D65B104000013004974656D735B3138395D2E43617465676F727979020000
      16004974656D735B3138395D2E446973706C61794E616D650604000012004974
      656D735B31385D2E43617465676F7279B400000015004974656D735B31385D2E
      446973706C61794E616D65B204000013004974656D735B3139305D2E43617465
      676F72797C02000016004974656D735B3139305D2E446973706C61794E616D65
      B304000013004974656D735B3139315D2E43617465676F72797E020000160049
      74656D735B3139315D2E446973706C61794E616D65B404000013004974656D73
      5B3139325D2E43617465676F72798102000016004974656D735B3139325D2E44
      6973706C61794E616D65B504000013004974656D735B3139335D2E4361746567
      6F72798402000016004974656D735B3139335D2E446973706C61794E616D65B6
      04000013004974656D735B3139345D2E43617465676F72798702000016004974
      656D735B3139345D2E446973706C61794E616D65B704000013004974656D735B
      3139355D2E43617465676F72798A02000016004974656D735B3139355D2E4469
      73706C61794E616D65B804000013004974656D735B3139365D2E43617465676F
      72798D02000016004974656D735B3139365D2E446973706C61794E616D65B904
      000013004974656D735B3139375D2E43617465676F7279900200001600497465
      6D735B3139375D2E446973706C61794E616D65BA04000013004974656D735B31
      39385D2E43617465676F72799302000016004974656D735B3139385D2E446973
      706C61794E616D65BB04000013004974656D735B3139395D2E43617465676F72
      799602000016004974656D735B3139395D2E446973706C61794E616D65070400
      0012004974656D735B31395D2E43617465676F7279B600000015004974656D73
      5B31395D2E446973706C61794E616D65F503000011004974656D735B315D2E43
      617465676F72798B00000014004974656D735B315D2E446973706C61794E616D
      65BC04000013004974656D735B3230305D2E43617465676F7279980200001600
      4974656D735B3230305D2E446973706C61794E616D65BD04000013004974656D
      735B3230315D2E43617465676F72799A02000016004974656D735B3230315D2E
      446973706C61794E616D65BE04000013004974656D735B3230325D2E43617465
      676F72799C02000016004974656D735B3230325D2E446973706C61794E616D65
      BF04000013004974656D735B3230335D2E43617465676F72799E020000160049
      74656D735B3230335D2E446973706C61794E616D65C004000013004974656D73
      5B3230345D2E43617465676F7279A002000016004974656D735B3230345D2E44
      6973706C61794E616D65C104000013004974656D735B3230355D2E4361746567
      6F7279A202000016004974656D735B3230355D2E446973706C61794E616D65C2
      04000013004974656D735B3230365D2E43617465676F7279A402000016004974
      656D735B3230365D2E446973706C61794E616D65C304000013004974656D735B
      3230375D2E43617465676F7279A602000016004974656D735B3230375D2E4469
      73706C61794E616D65C404000013004974656D735B3230385D2E43617465676F
      7279A802000016004974656D735B3230385D2E446973706C61794E616D65CB04
      000013004974656D735B3230395D2E43617465676F7279CC0400001600497465
      6D735B3230395D2E446973706C61794E616D650804000012004974656D735B32
      305D2E43617465676F7279B800000015004974656D735B32305D2E446973706C
      61794E616D65CD04000013004974656D735B3231305D2E43617465676F7279CE
      04000016004974656D735B3231305D2E446973706C61794E616D65CF04000013
      004974656D735B3231315D2E43617465676F7279D004000016004974656D735B
      3231315D2E446973706C61794E616D65D104000013004974656D735B3231325D
      2E43617465676F7279D204000016004974656D735B3231325D2E446973706C61
      794E616D65DC04000013004974656D735B3231335D2E43617465676F7279DD04
      000016004974656D735B3231335D2E446973706C61794E616D65EE0400001300
      4974656D735B3231345D2E43617465676F7279EF04000016004974656D735B32
      31345D2E446973706C61794E616D65F004000013004974656D735B3231355D2E
      43617465676F7279F104000016004974656D735B3231355D2E446973706C6179
      4E616D65F204000013004974656D735B3231365D2E43617465676F7279F30400
      0016004974656D735B3231365D2E446973706C61794E616D65F4040000130049
      74656D735B3231375D2E43617465676F7279F504000016004974656D735B3231
      375D2E446973706C61794E616D650605000013004974656D735B3231385D2E43
      617465676F72790705000016004974656D735B3231385D2E446973706C61794E
      616D652B05000013004974656D735B3231395D2E43617465676F72792C050000
      16004974656D735B3231395D2E446973706C61794E616D650904000012004974
      656D735B32315D2E43617465676F7279BA00000015004974656D735B32315D2E
      446973706C61794E616D653605000013004974656D735B3232305D2E43617465
      676F72793705000016004974656D735B3232305D2E446973706C61794E616D65
      3805000013004974656D735B3232315D2E43617465676F727939050000160049
      74656D735B3232315D2E446973706C61794E616D653A05000013004974656D73
      5B3232325D2E43617465676F72793B05000016004974656D735B3232325D2E44
      6973706C61794E616D654A05000013004974656D735B3232335D2E4361746567
      6F72794B05000016004974656D735B3232335D2E446973706C61794E616D6551
      05000013004974656D735B3232345D2E43617465676F72795205000016004974
      656D735B3232345D2E446973706C61794E616D656D05000013004974656D735B
      3232355D2E43617465676F72796E05000016004974656D735B3232355D2E4469
      73706C61794E616D656F05000013004974656D735B3232365D2E43617465676F
      72797005000016004974656D735B3232365D2E446973706C61794E616D657105
      000013004974656D735B3232375D2E43617465676F7279720500001600497465
      6D735B3232375D2E446973706C61794E616D657305000013004974656D735B32
      32385D2E43617465676F72797405000016004974656D735B3232385D2E446973
      706C61794E616D657505000013004974656D735B3232395D2E43617465676F72
      797605000016004974656D735B3232395D2E446973706C61794E616D650A0400
      0012004974656D735B32325D2E43617465676F7279BC00000015004974656D73
      5B32325D2E446973706C61794E616D657705000013004974656D735B3233305D
      2E43617465676F72797805000016004974656D735B3233305D2E446973706C61
      794E616D657905000013004974656D735B3233315D2E43617465676F72797A05
      000016004974656D735B3233315D2E446973706C61794E616D657B0500001300
      4974656D735B3233325D2E43617465676F72797C05000016004974656D735B32
      33325D2E446973706C61794E616D657D05000013004974656D735B3233335D2E
      43617465676F72797E05000016004974656D735B3233335D2E446973706C6179
      4E616D657F05000013004974656D735B3233345D2E43617465676F7279800500
      0016004974656D735B3233345D2E446973706C61794E616D6581050000130049
      74656D735B3233355D2E43617465676F72798205000016004974656D735B3233
      355D2E446973706C61794E616D658305000013004974656D735B3233365D2E43
      617465676F72798405000016004974656D735B3233365D2E446973706C61794E
      616D65A705000013004974656D735B3233375D2E43617465676F7279A8050000
      16004974656D735B3233375D2E446973706C61794E616D65B205000013004974
      656D735B3233385D2E43617465676F7279B305000016004974656D735B323338
      5D2E446973706C61794E616D65B405000013004974656D735B3233395D2E4361
      7465676F7279B505000016004974656D735B3233395D2E446973706C61794E61
      6D650B04000012004974656D735B32335D2E43617465676F7279BE0000001500
      4974656D735B32335D2E446973706C61794E616D65B705000013004974656D73
      5B3234305D2E43617465676F7279B805000016004974656D735B3234305D2E44
      6973706C61794E616D65C205000013004974656D735B3234315D2E4361746567
      6F7279C305000016004974656D735B3234315D2E446973706C61794E616D65D0
      05000013004974656D735B3234325D2E43617465676F7279D105000016004974
      656D735B3234325D2E446973706C61794E616D65D505000013004974656D735B
      3234335D2E43617465676F7279D605000016004974656D735B3234335D2E4469
      73706C61794E616D65D805000013004974656D735B3234345D2E43617465676F
      7279D905000016004974656D735B3234345D2E446973706C61794E616D65F505
      000013004974656D735B3234355D2E43617465676F7279F60500001600497465
      6D735B3234355D2E446973706C61794E616D651406000013004974656D735B32
      34365D2E43617465676F72791506000016004974656D735B3234365D2E446973
      706C61794E616D651606000013004974656D735B3234375D2E43617465676F72
      791706000016004974656D735B3234375D2E446973706C61794E616D652A0600
      0013004974656D735B3234385D2E43617465676F72792B06000016004974656D
      735B3234385D2E446973706C61794E616D652F06000013004974656D735B3234
      395D2E43617465676F72793006000016004974656D735B3234395D2E44697370
      6C61794E616D650C04000012004974656D735B32345D2E43617465676F7279C0
      00000015004974656D735B32345D2E446973706C61794E616D65310600001300
      4974656D735B3235305D2E43617465676F72793206000016004974656D735B32
      35305D2E446973706C61794E616D653706000013004974656D735B3235315D2E
      43617465676F72793806000016004974656D735B3235315D2E446973706C6179
      4E616D653906000013004974656D735B3235325D2E43617465676F72793A0600
      0016004974656D735B3235325D2E446973706C61794E616D653D060000130049
      74656D735B3235335D2E43617465676F72793E06000016004974656D735B3235
      335D2E446973706C61794E616D653F06000013004974656D735B3235345D2E43
      617465676F72794006000016004974656D735B3235345D2E446973706C61794E
      616D654206000013004974656D735B3235355D2E43617465676F727943060000
      16004974656D735B3235355D2E446973706C61794E616D654E06000013004974
      656D735B3235365D2E43617465676F72794F06000016004974656D735B323536
      5D2E446973706C61794E616D655406000013004974656D735B3235375D2E4361
      7465676F72795506000016004974656D735B3235375D2E446973706C61794E61
      6D655606000013004974656D735B3235385D2E43617465676F72795706000016
      004974656D735B3235385D2E446973706C61794E616D655D0600001300497465
      6D735B3235395D2E43617465676F72795E06000016004974656D735B3235395D
      2E446973706C61794E616D650D04000012004974656D735B32355D2E43617465
      676F7279C200000015004974656D735B32355D2E446973706C61794E616D6560
      06000013004974656D735B3236305D2E43617465676F72796106000016004974
      656D735B3236305D2E446973706C61794E616D656406000013004974656D735B
      3236315D2E43617465676F72796506000016004974656D735B3236315D2E4469
      73706C61794E616D657006000013004974656D735B3236325D2E43617465676F
      72797106000016004974656D735B3236325D2E446973706C61794E616D657306
      000013004974656D735B3236335D2E43617465676F7279740600001600497465
      6D735B3236335D2E446973706C61794E616D657506000013004974656D735B32
      36345D2E43617465676F72797606000016004974656D735B3236345D2E446973
      706C61794E616D657E06000013004974656D735B3236355D2E43617465676F72
      797F06000016004974656D735B3236355D2E446973706C61794E616D65870600
      0013004974656D735B3236365D2E43617465676F72798806000016004974656D
      735B3236365D2E446973706C61794E616D658906000013004974656D735B3236
      375D2E43617465676F72798A06000016004974656D735B3236375D2E44697370
      6C61794E616D658B06000013004974656D735B3236385D2E43617465676F7279
      8C06000016004974656D735B3236385D2E446973706C61794E616D658D060000
      13004974656D735B3236395D2E43617465676F72798E06000016004974656D73
      5B3236395D2E446973706C61794E616D650E04000012004974656D735B32365D
      2E43617465676F7279C500000015004974656D735B32365D2E446973706C6179
      4E616D659F06000013004974656D735B3237305D2E43617465676F7279A00600
      0016004974656D735B3237305D2E446973706C61794E616D65A1060000130049
      74656D735B3237315D2E43617465676F7279A206000016004974656D735B3237
      315D2E446973706C61794E616D65A306000013004974656D735B3237325D2E43
      617465676F7279A406000016004974656D735B3237325D2E446973706C61794E
      616D65A506000013004974656D735B3237335D2E43617465676F7279A6060000
      16004974656D735B3237335D2E446973706C61794E616D65B206000013004974
      656D735B3237345D2E43617465676F7279B306000016004974656D735B323734
      5D2E446973706C61794E616D65B406000013004974656D735B3237355D2E4361
      7465676F7279B506000016004974656D735B3237355D2E446973706C61794E61
      6D65B806000013004974656D735B3237365D2E43617465676F7279B906000016
      004974656D735B3237365D2E446973706C61794E616D65BA0600001300497465
      6D735B3237375D2E43617465676F7279BB06000016004974656D735B3237375D
      2E446973706C61794E616D65D006000013004974656D735B3237385D2E436174
      65676F7279D106000016004974656D735B3237385D2E446973706C61794E616D
      65DA06000013004974656D735B3237395D2E43617465676F7279DB0600001600
      4974656D735B3237395D2E446973706C61794E616D650F04000012004974656D
      735B32375D2E43617465676F7279C800000015004974656D735B32375D2E4469
      73706C61794E616D65DC06000013004974656D735B3238305D2E43617465676F
      7279DD06000016004974656D735B3238305D2E446973706C61794E616D65DE06
      000013004974656D735B3238315D2E43617465676F7279DF0600001600497465
      6D735B3238315D2E446973706C61794E616D65E006000013004974656D735B32
      38325D2E43617465676F7279E106000016004974656D735B3238325D2E446973
      706C61794E616D65E206000013004974656D735B3238335D2E43617465676F72
      79E306000016004974656D735B3238335D2E446973706C61794E616D65E40600
      0013004974656D735B3238345D2E43617465676F7279E506000016004974656D
      735B3238345D2E446973706C61794E616D65E606000013004974656D735B3238
      355D2E43617465676F7279E706000016004974656D735B3238355D2E44697370
      6C61794E616D65E806000013004974656D735B3238365D2E43617465676F7279
      E906000016004974656D735B3238365D2E446973706C61794E616D65EA060000
      13004974656D735B3238375D2E43617465676F7279EB06000016004974656D73
      5B3238375D2E446973706C61794E616D65EC06000013004974656D735B323838
      5D2E43617465676F7279ED06000016004974656D735B3238385D2E446973706C
      61794E616D65F406000013004974656D735B3238395D2E43617465676F7279F5
      06000016004974656D735B3238395D2E446973706C61794E616D651004000012
      004974656D735B32385D2E43617465676F7279CB00000015004974656D735B32
      385D2E446973706C61794E616D65F606000013004974656D735B3239305D2E43
      617465676F7279F706000016004974656D735B3239305D2E446973706C61794E
      616D65F806000013004974656D735B3239315D2E43617465676F7279F9060000
      16004974656D735B3239315D2E446973706C61794E616D65FD06000013004974
      656D735B3239325D2E43617465676F7279FE06000016004974656D735B323932
      5D2E446973706C61794E616D65FF06000013004974656D735B3239335D2E4361
      7465676F72790007000016004974656D735B3239335D2E446973706C61794E61
      6D650107000013004974656D735B3239345D2E43617465676F72790207000016
      004974656D735B3239345D2E446973706C61794E616D65030700001300497465
      6D735B3239355D2E43617465676F72790407000016004974656D735B3239355D
      2E446973706C61794E616D650507000013004974656D735B3239365D2E436174
      65676F72790607000016004974656D735B3239365D2E446973706C61794E616D
      651507000013004974656D735B3239375D2E43617465676F7279160700001600
      4974656D735B3239375D2E446973706C61794E616D651B07000013004974656D
      735B3239385D2E43617465676F72791C07000016004974656D735B3239385D2E
      446973706C61794E616D651F07000013004974656D735B3239395D2E43617465
      676F72792007000016004974656D735B3239395D2E446973706C61794E616D65
      1104000012004974656D735B32395D2E43617465676F7279CE00000015004974
      656D735B32395D2E446973706C61794E616D65F603000011004974656D735B32
      5D2E43617465676F72798E00000014004974656D735B325D2E446973706C6179
      4E616D652107000013004974656D735B3330305D2E43617465676F7279220700
      0016004974656D735B3330305D2E446973706C61794E616D652A070000130049
      74656D735B3330315D2E43617465676F72792B07000016004974656D735B3330
      315D2E446973706C61794E616D652C07000013004974656D735B3330325D2E43
      617465676F72792D07000016004974656D735B3330325D2E446973706C61794E
      616D653307000013004974656D735B3330335D2E43617465676F727934070000
      16004974656D735B3330335D2E446973706C61794E616D653507000013004974
      656D735B3330345D2E43617465676F72793607000016004974656D735B333034
      5D2E446973706C61794E616D653B07000013004974656D735B3330355D2E4361
      7465676F72793C07000016004974656D735B3330355D2E446973706C61794E61
      6D653D07000013004974656D735B3330365D2E43617465676F72793E07000016
      004974656D735B3330365D2E446973706C61794E616D653F0700001300497465
      6D735B3330375D2E43617465676F72794007000016004974656D735B3330375D
      2E446973706C61794E616D654107000013004974656D735B3330385D2E436174
      65676F72794207000016004974656D735B3330385D2E446973706C61794E616D
      654307000013004974656D735B3330395D2E43617465676F7279440700001600
      4974656D735B3330395D2E446973706C61794E616D651204000012004974656D
      735B33305D2E43617465676F7279D100000015004974656D735B33305D2E4469
      73706C61794E616D654507000013004974656D735B3331305D2E43617465676F
      72794607000016004974656D735B3331305D2E446973706C61794E616D654707
      000013004974656D735B3331315D2E43617465676F7279480700001600497465
      6D735B3331315D2E446973706C61794E616D654907000013004974656D735B33
      31325D2E43617465676F72794A07000016004974656D735B3331325D2E446973
      706C61794E616D654B07000013004974656D735B3331335D2E43617465676F72
      794C07000016004974656D735B3331335D2E446973706C61794E616D654D0700
      0013004974656D735B3331345D2E43617465676F72794E07000016004974656D
      735B3331345D2E446973706C61794E616D656007000013004974656D735B3331
      355D2E43617465676F72796107000016004974656D735B3331355D2E44697370
      6C61794E616D656207000013004974656D735B3331365D2E43617465676F7279
      6307000016004974656D735B3331365D2E446973706C61794E616D656D070000
      13004974656D735B3331375D2E43617465676F72796E07000016004974656D73
      5B3331375D2E446973706C61794E616D656F07000013004974656D735B333138
      5D2E43617465676F72797007000016004974656D735B3331385D2E446973706C
      61794E616D657107000013004974656D735B3331395D2E43617465676F727972
      07000016004974656D735B3331395D2E446973706C61794E616D651304000012
      004974656D735B33315D2E43617465676F7279D400000015004974656D735B33
      315D2E446973706C61794E616D657307000013004974656D735B3332305D2E43
      617465676F72797407000016004974656D735B3332305D2E446973706C61794E
      616D657607000013004974656D735B3332315D2E43617465676F727977070000
      16004974656D735B3332315D2E446973706C61794E616D657A07000013004974
      656D735B3332325D2E43617465676F72797B07000016004974656D735B333232
      5D2E446973706C61794E616D657C07000013004974656D735B3332335D2E4361
      7465676F72797D07000016004974656D735B3332335D2E446973706C61794E61
      6D658207000013004974656D735B3332345D2E43617465676F72798307000016
      004974656D735B3332345D2E446973706C61794E616D65840700001300497465
      6D735B3332355D2E43617465676F72798507000016004974656D735B3332355D
      2E446973706C61794E616D658807000013004974656D735B3332365D2E436174
      65676F72798907000016004974656D735B3332365D2E446973706C61794E616D
      658A07000013004974656D735B3332375D2E43617465676F72798B0700001600
      4974656D735B3332375D2E446973706C61794E616D658C07000013004974656D
      735B3332385D2E43617465676F72798D07000016004974656D735B3332385D2E
      446973706C61794E616D658E07000013004974656D735B3332395D2E43617465
      676F72798F07000016004974656D735B3332395D2E446973706C61794E616D65
      1404000012004974656D735B33325D2E43617465676F7279D700000015004974
      656D735B33325D2E446973706C61794E616D659007000013004974656D735B33
      33305D2E43617465676F72799107000016004974656D735B3333305D2E446973
      706C61794E616D659207000013004974656D735B3333315D2E43617465676F72
      799307000016004974656D735B3333315D2E446973706C61794E616D65940700
      0013004974656D735B3333325D2E43617465676F72799507000016004974656D
      735B3333325D2E446973706C61794E616D659E07000013004974656D735B3333
      335D2E43617465676F72799F07000016004974656D735B3333335D2E44697370
      6C61794E616D65A007000013004974656D735B3333345D2E43617465676F7279
      A107000016004974656D735B3333345D2E446973706C61794E616D65AB070000
      13004974656D735B3333355D2E43617465676F7279AC07000016004974656D73
      5B3333355D2E446973706C61794E616D65B107000013004974656D735B333336
      5D2E43617465676F7279B207000016004974656D735B3333365D2E446973706C
      61794E616D65B407000013004974656D735B3333375D2E43617465676F7279B5
      07000016004974656D735B3333375D2E446973706C61794E616D65B607000013
      004974656D735B3333385D2E43617465676F7279B707000016004974656D735B
      3333385D2E446973706C61794E616D65BA07000013004974656D735B3333395D
      2E43617465676F7279BB07000016004974656D735B3333395D2E446973706C61
      794E616D651504000012004974656D735B33335D2E43617465676F7279D90000
      0015004974656D735B33335D2E446973706C61794E616D65BC07000013004974
      656D735B3334305D2E43617465676F7279BD07000016004974656D735B333430
      5D2E446973706C61794E616D65BE07000013004974656D735B3334315D2E4361
      7465676F7279BF07000016004974656D735B3334315D2E446973706C61794E61
      6D65C007000013004974656D735B3334325D2E43617465676F7279C107000016
      004974656D735B3334325D2E446973706C61794E616D65C20700001300497465
      6D735B3334335D2E43617465676F7279C307000016004974656D735B3334335D
      2E446973706C61794E616D65C407000013004974656D735B3334345D2E436174
      65676F7279C507000016004974656D735B3334345D2E446973706C61794E616D
      65C607000013004974656D735B3334355D2E43617465676F7279C70700001600
      4974656D735B3334355D2E446973706C61794E616D65C807000013004974656D
      735B3334365D2E43617465676F7279C907000016004974656D735B3334365D2E
      446973706C61794E616D65CA07000013004974656D735B3334375D2E43617465
      676F7279CB07000016004974656D735B3334375D2E446973706C61794E616D65
      CC07000013004974656D735B3334385D2E43617465676F7279CD070000160049
      74656D735B3334385D2E446973706C61794E616D65CE07000013004974656D73
      5B3334395D2E43617465676F7279CF07000016004974656D735B3334395D2E44
      6973706C61794E616D651604000012004974656D735B33345D2E43617465676F
      7279DC00000015004974656D735B33345D2E446973706C61794E616D65D00700
      0013004974656D735B3335305D2E43617465676F7279D107000016004974656D
      735B3335305D2E446973706C61794E616D65D207000013004974656D735B3335
      315D2E43617465676F7279D307000016004974656D735B3335315D2E44697370
      6C61794E616D65D407000013004974656D735B3335325D2E43617465676F7279
      D507000016004974656D735B3335325D2E446973706C61794E616D65D6070000
      13004974656D735B3335335D2E43617465676F7279D707000016004974656D73
      5B3335335D2E446973706C61794E616D65D807000013004974656D735B333534
      5D2E43617465676F7279D907000016004974656D735B3335345D2E446973706C
      61794E616D65DA07000013004974656D735B3335355D2E43617465676F7279DB
      07000016004974656D735B3335355D2E446973706C61794E616D65DC07000013
      004974656D735B3335365D2E43617465676F7279DD07000016004974656D735B
      3335365D2E446973706C61794E616D65DE07000013004974656D735B3335375D
      2E43617465676F7279DF07000016004974656D735B3335375D2E446973706C61
      794E616D65E007000013004974656D735B3335385D2E43617465676F7279E107
      000016004974656D735B3335385D2E446973706C61794E616D65EB0700001300
      4974656D735B3335395D2E43617465676F7279EC07000016004974656D735B33
      35395D2E446973706C61794E616D651704000012004974656D735B33355D2E43
      617465676F7279DF00000015004974656D735B33355D2E446973706C61794E61
      6D65ED07000013004974656D735B3336305D2E43617465676F7279EE07000016
      004974656D735B3336305D2E446973706C61794E616D65EF0700001300497465
      6D735B3336315D2E43617465676F7279F007000016004974656D735B3336315D
      2E446973706C61794E616D65F107000013004974656D735B3336325D2E436174
      65676F7279F207000016004974656D735B3336325D2E446973706C61794E616D
      65F307000013004974656D735B3336335D2E43617465676F7279F40700001600
      4974656D735B3336335D2E446973706C61794E616D65F507000013004974656D
      735B3336345D2E43617465676F7279F607000016004974656D735B3336345D2E
      446973706C61794E616D65F707000013004974656D735B3336355D2E43617465
      676F7279F807000016004974656D735B3336355D2E446973706C61794E616D65
      F907000013004974656D735B3336365D2E43617465676F7279FA070000160049
      74656D735B3336365D2E446973706C61794E616D65FB07000013004974656D73
      5B3336375D2E43617465676F7279FC07000016004974656D735B3336375D2E44
      6973706C61794E616D65FD07000013004974656D735B3336385D2E4361746567
      6F7279FE07000016004974656D735B3336385D2E446973706C61794E616D65FF
      07000013004974656D735B3336395D2E43617465676F72790008000016004974
      656D735B3336395D2E446973706C61794E616D651804000012004974656D735B
      33365D2E43617465676F7279E200000015004974656D735B33365D2E44697370
      6C61794E616D650108000013004974656D735B3337305D2E43617465676F7279
      0208000016004974656D735B3337305D2E446973706C61794E616D6503080000
      13004974656D735B3337315D2E43617465676F72790408000016004974656D73
      5B3337315D2E446973706C61794E616D650508000013004974656D735B333732
      5D2E43617465676F72790608000016004974656D735B3337325D2E446973706C
      61794E616D650708000013004974656D735B3337335D2E43617465676F727908
      08000016004974656D735B3337335D2E446973706C61794E616D650908000013
      004974656D735B3337345D2E43617465676F72790A08000016004974656D735B
      3337345D2E446973706C61794E616D650B08000013004974656D735B3337355D
      2E43617465676F72790C08000016004974656D735B3337355D2E446973706C61
      794E616D650D08000013004974656D735B3337365D2E43617465676F72790E08
      000016004974656D735B3337365D2E446973706C61794E616D650F0800001300
      4974656D735B3337375D2E43617465676F72791008000016004974656D735B33
      37375D2E446973706C61794E616D651108000013004974656D735B3337385D2E
      43617465676F72791208000016004974656D735B3337385D2E446973706C6179
      4E616D651308000013004974656D735B3337395D2E43617465676F7279140800
      0016004974656D735B3337395D2E446973706C61794E616D6519040000120049
      74656D735B33375D2E43617465676F7279E500000015004974656D735B33375D
      2E446973706C61794E616D651D08000013004974656D735B3338305D2E436174
      65676F72791E08000016004974656D735B3338305D2E446973706C61794E616D
      651F08000013004974656D735B3338315D2E43617465676F7279200800001600
      4974656D735B3338315D2E446973706C61794E616D652108000013004974656D
      735B3338325D2E43617465676F72792208000016004974656D735B3338325D2E
      446973706C61794E616D652308000013004974656D735B3338335D2E43617465
      676F72792408000016004974656D735B3338335D2E446973706C61794E616D65
      2608000013004974656D735B3338345D2E43617465676F727927080000160049
      74656D735B3338345D2E446973706C61794E616D652808000013004974656D73
      5B3338355D2E43617465676F72792908000016004974656D735B3338355D2E44
      6973706C61794E616D652A08000013004974656D735B3338365D2E4361746567
      6F72792B08000016004974656D735B3338365D2E446973706C61794E616D652C
      08000013004974656D735B3338375D2E43617465676F72792D08000016004974
      656D735B3338375D2E446973706C61794E616D653208000013004974656D735B
      3338385D2E43617465676F72793308000016004974656D735B3338385D2E4469
      73706C61794E616D653608000013004974656D735B3338395D2E43617465676F
      72793708000016004974656D735B3338395D2E446973706C61794E616D651A04
      000012004974656D735B33385D2E43617465676F7279E800000015004974656D
      735B33385D2E446973706C61794E616D653B08000013004974656D735B333930
      5D2E43617465676F72793C08000016004974656D735B3339305D2E446973706C
      61794E616D654008000013004974656D735B3339315D2E43617465676F727941
      08000016004974656D735B3339315D2E446973706C61794E616D654208000013
      004974656D735B3339325D2E43617465676F72794308000016004974656D735B
      3339325D2E446973706C61794E616D654608000013004974656D735B3339335D
      2E43617465676F72794708000016004974656D735B3339335D2E446973706C61
      794E616D654908000013004974656D735B3339345D2E43617465676F72794A08
      000016004974656D735B3339345D2E446973706C61794E616D654D0800001300
      4974656D735B3339355D2E43617465676F72794E08000016004974656D735B33
      39355D2E446973706C61794E616D655308000013004974656D735B3339365D2E
      43617465676F72795408000016004974656D735B3339365D2E446973706C6179
      4E616D655608000013004974656D735B3339375D2E43617465676F7279570800
      0016004974656D735B3339375D2E446973706C61794E616D6558080000130049
      74656D735B3339385D2E43617465676F72795908000016004974656D735B3339
      385D2E446973706C61794E616D655A08000013004974656D735B3339395D2E43
      617465676F72795B08000016004974656D735B3339395D2E446973706C61794E
      616D651B04000012004974656D735B33395D2E43617465676F7279EB00000015
      004974656D735B33395D2E446973706C61794E616D65F703000011004974656D
      735B335D2E43617465676F72799100000014004974656D735B335D2E44697370
      6C61794E616D655C08000013004974656D735B3430305D2E43617465676F7279
      5D08000016004974656D735B3430305D2E446973706C61794E616D6562080000
      13004974656D735B3430315D2E43617465676F72796308000016004974656D73
      5B3430315D2E446973706C61794E616D656608000013004974656D735B343032
      5D2E43617465676F72796708000016004974656D735B3430325D2E446973706C
      61794E616D656808000013004974656D735B3430335D2E43617465676F727969
      08000016004974656D735B3430335D2E446973706C61794E616D656A08000013
      004974656D735B3430345D2E43617465676F72796B08000016004974656D735B
      3430345D2E446973706C61794E616D656E08000013004974656D735B3430355D
      2E43617465676F72796F08000016004974656D735B3430355D2E446973706C61
      794E616D657808000013004974656D735B3430365D2E43617465676F72797908
      000016004974656D735B3430365D2E446973706C61794E616D657A0800001300
      4974656D735B3430375D2E43617465676F72797B08000016004974656D735B34
      30375D2E446973706C61794E616D658208000013004974656D735B3430385D2E
      43617465676F72798308000016004974656D735B3430385D2E446973706C6179
      4E616D659108000013004974656D735B3430395D2E43617465676F7279920800
      0016004974656D735B3430395D2E446973706C61794E616D651C040000120049
      74656D735B34305D2E43617465676F7279EE00000015004974656D735B34305D
      2E446973706C61794E616D659808000013004974656D735B3431305D2E436174
      65676F72799908000016004974656D735B3431305D2E446973706C61794E616D
      659A08000013004974656D735B3431315D2E43617465676F72799B0800001600
      4974656D735B3431315D2E446973706C61794E616D659C08000013004974656D
      735B3431325D2E43617465676F72799D08000016004974656D735B3431325D2E
      446973706C61794E616D65A208000013004974656D735B3431335D2E43617465
      676F7279A308000016004974656D735B3431335D2E446973706C61794E616D65
      A608000013004974656D735B3431345D2E43617465676F7279A7080000160049
      74656D735B3431345D2E446973706C61794E616D65AA08000013004974656D73
      5B3431355D2E43617465676F7279AB08000016004974656D735B3431355D2E44
      6973706C61794E616D65AC08000013004974656D735B3431365D2E4361746567
      6F7279AD08000016004974656D735B3431365D2E446973706C61794E616D65AE
      08000013004974656D735B3431375D2E43617465676F7279AF08000016004974
      656D735B3431375D2E446973706C61794E616D65B508000013004974656D735B
      3431385D2E43617465676F7279B608000016004974656D735B3431385D2E4469
      73706C61794E616D65C808000013004974656D735B3431395D2E43617465676F
      7279C908000016004974656D735B3431395D2E446973706C61794E616D651D04
      000012004974656D735B34315D2E43617465676F7279F100000015004974656D
      735B34315D2E446973706C61794E616D65CA08000013004974656D735B343230
      5D2E43617465676F7279CB08000016004974656D735B3432305D2E446973706C
      61794E616D65CC08000013004974656D735B3432315D2E43617465676F7279CD
      08000016004974656D735B3432315D2E446973706C61794E616D65CE08000013
      004974656D735B3432325D2E43617465676F7279CF08000016004974656D735B
      3432325D2E446973706C61794E616D65D708000013004974656D735B3432335D
      2E43617465676F7279D808000016004974656D735B3432335D2E446973706C61
      794E616D65E008000013004974656D735B3432345D2E43617465676F7279E108
      000016004974656D735B3432345D2E446973706C61794E616D65E40800001300
      4974656D735B3432355D2E43617465676F7279E508000016004974656D735B34
      32355D2E446973706C61794E616D65EA08000013004974656D735B3432365D2E
      43617465676F7279EB08000016004974656D735B3432365D2E446973706C6179
      4E616D65EF08000013004974656D735B3432375D2E43617465676F7279F00800
      0016004974656D735B3432375D2E446973706C61794E616D65F8080000130049
      74656D735B3432385D2E43617465676F7279F908000016004974656D735B3432
      385D2E446973706C61794E616D65FA08000013004974656D735B3432395D2E43
      617465676F7279FB08000016004974656D735B3432395D2E446973706C61794E
      616D651E04000012004974656D735B34325D2E43617465676F7279F400000015
      004974656D735B34325D2E446973706C61794E616D650109000013004974656D
      735B3433305D2E43617465676F72790209000016004974656D735B3433305D2E
      446973706C61794E616D650309000013004974656D735B3433315D2E43617465
      676F72790409000016004974656D735B3433315D2E446973706C61794E616D65
      0709000013004974656D735B3433325D2E43617465676F727908090000160049
      74656D735B3433325D2E446973706C61794E616D650E09000013004974656D73
      5B3433335D2E43617465676F72790F09000016004974656D735B3433335D2E44
      6973706C61794E616D651109000013004974656D735B3433345D2E4361746567
      6F72791209000016004974656D735B3433345D2E446973706C61794E616D6515
      09000013004974656D735B3433355D2E43617465676F72791609000016004974
      656D735B3433355D2E446973706C61794E616D652309000013004974656D735B
      3433365D2E43617465676F72792409000016004974656D735B3433365D2E4469
      73706C61794E616D652509000013004974656D735B3433375D2E43617465676F
      72792609000016004974656D735B3433375D2E446973706C61794E616D652709
      000013004974656D735B3433385D2E43617465676F7279280900001600497465
      6D735B3433385D2E446973706C61794E616D652909000013004974656D735B34
      33395D2E43617465676F72792A09000016004974656D735B3433395D2E446973
      706C61794E616D651F04000012004974656D735B34335D2E43617465676F7279
      F600000015004974656D735B34335D2E446973706C61794E616D652B09000013
      004974656D735B3434305D2E43617465676F72792C09000016004974656D735B
      3434305D2E446973706C61794E616D652D09000013004974656D735B3434315D
      2E43617465676F72792E09000016004974656D735B3434315D2E446973706C61
      794E616D652F09000013004974656D735B3434325D2E43617465676F72793009
      000016004974656D735B3434325D2E446973706C61794E616D65310900001300
      4974656D735B3434335D2E43617465676F72793209000016004974656D735B34
      34335D2E446973706C61794E616D653309000013004974656D735B3434345D2E
      43617465676F72793409000016004974656D735B3434345D2E446973706C6179
      4E616D653509000013004974656D735B3434355D2E43617465676F7279360900
      0016004974656D735B3434355D2E446973706C61794E616D6537090000130049
      74656D735B3434365D2E43617465676F72793809000016004974656D735B3434
      365D2E446973706C61794E616D653909000013004974656D735B3434375D2E43
      617465676F72793A09000016004974656D735B3434375D2E446973706C61794E
      616D653B09000013004974656D735B3434385D2E43617465676F72793C090000
      16004974656D735B3434385D2E446973706C61794E616D653D09000013004974
      656D735B3434395D2E43617465676F72793E09000016004974656D735B343439
      5D2E446973706C61794E616D652004000012004974656D735B34345D2E436174
      65676F7279F800000015004974656D735B34345D2E446973706C61794E616D65
      4609000013004974656D735B3435305D2E43617465676F727947090000160049
      74656D735B3435305D2E446973706C61794E616D654A09000013004974656D73
      5B3435315D2E43617465676F72794B09000016004974656D735B3435315D2E44
      6973706C61794E616D654F09000013004974656D735B3435325D2E4361746567
      6F72795009000016004974656D735B3435325D2E446973706C61794E616D6551
      09000013004974656D735B3435335D2E43617465676F72795209000016004974
      656D735B3435335D2E446973706C61794E616D655309000013004974656D735B
      3435345D2E43617465676F72795409000016004974656D735B3435345D2E4469
      73706C61794E616D655709000013004974656D735B3435355D2E43617465676F
      72795809000016004974656D735B3435355D2E446973706C61794E616D656409
      000013004974656D735B3435365D2E43617465676F7279650900001600497465
      6D735B3435365D2E446973706C61794E616D656709000013004974656D735B34
      35375D2E43617465676F72796809000016004974656D735B3435375D2E446973
      706C61794E616D656909000013004974656D735B3435385D2E43617465676F72
      796A09000016004974656D735B3435385D2E446973706C61794E616D656B0900
      0013004974656D735B3435395D2E43617465676F72796C09000016004974656D
      735B3435395D2E446973706C61794E616D652104000012004974656D735B3435
      5D2E43617465676F7279FA00000015004974656D735B34355D2E446973706C61
      794E616D657709000013004974656D735B3436305D2E43617465676F72797809
      000016004974656D735B3436305D2E446973706C61794E616D65790900001300
      4974656D735B3436315D2E43617465676F72797A09000016004974656D735B34
      36315D2E446973706C61794E616D657B09000013004974656D735B3436325D2E
      43617465676F72797C09000016004974656D735B3436325D2E446973706C6179
      4E616D657D09000013004974656D735B3436335D2E43617465676F72797E0900
      0016004974656D735B3436335D2E446973706C61794E616D657F090000130049
      74656D735B3436345D2E43617465676F72798009000016004974656D735B3436
      345D2E446973706C61794E616D658109000013004974656D735B3436355D2E43
      617465676F72798209000016004974656D735B3436355D2E446973706C61794E
      616D658309000013004974656D735B3436365D2E43617465676F727984090000
      16004974656D735B3436365D2E446973706C61794E616D658509000013004974
      656D735B3436375D2E43617465676F72798609000016004974656D735B343637
      5D2E446973706C61794E616D659409000013004974656D735B3436385D2E4361
      7465676F72799509000016004974656D735B3436385D2E446973706C61794E61
      6D659609000013004974656D735B3436395D2E43617465676F72799709000016
      004974656D735B3436395D2E446973706C61794E616D65220400001200497465
      6D735B34365D2E43617465676F7279FC00000015004974656D735B34365D2E44
      6973706C61794E616D659809000013004974656D735B3437305D2E4361746567
      6F72799909000016004974656D735B3437305D2E446973706C61794E616D659C
      09000013004974656D735B3437315D2E43617465676F72799D09000016004974
      656D735B3437315D2E446973706C61794E616D659E09000013004974656D735B
      3437325D2E43617465676F72799F09000016004974656D735B3437325D2E4469
      73706C61794E616D65A009000013004974656D735B3437335D2E43617465676F
      7279A109000016004974656D735B3437335D2E446973706C61794E616D65A209
      000013004974656D735B3437345D2E43617465676F7279A30900001600497465
      6D735B3437345D2E446973706C61794E616D65A409000013004974656D735B34
      37355D2E43617465676F7279A509000016004974656D735B3437355D2E446973
      706C61794E616D65A609000013004974656D735B3437365D2E43617465676F72
      79A709000016004974656D735B3437365D2E446973706C61794E616D65A80900
      0013004974656D735B3437375D2E43617465676F7279A909000016004974656D
      735B3437375D2E446973706C61794E616D65AA09000013004974656D735B3437
      385D2E43617465676F7279AB09000016004974656D735B3437385D2E44697370
      6C61794E616D65AC09000013004974656D735B3437395D2E43617465676F7279
      AD09000016004974656D735B3437395D2E446973706C61794E616D6523040000
      12004974656D735B34375D2E43617465676F7279FE00000015004974656D735B
      34375D2E446973706C61794E616D65AE09000013004974656D735B3438305D2E
      43617465676F7279AF09000016004974656D735B3438305D2E446973706C6179
      4E616D65B009000013004974656D735B3438315D2E43617465676F7279B10900
      0016004974656D735B3438315D2E446973706C61794E616D65B2090000130049
      74656D735B3438325D2E43617465676F7279B309000016004974656D735B3438
      325D2E446973706C61794E616D65B409000013004974656D735B3438335D2E43
      617465676F7279B509000016004974656D735B3438335D2E446973706C61794E
      616D65B609000013004974656D735B3438345D2E43617465676F7279B7090000
      16004974656D735B3438345D2E446973706C61794E616D65B809000013004974
      656D735B3438355D2E43617465676F7279B909000016004974656D735B343835
      5D2E446973706C61794E616D65BA09000013004974656D735B3438365D2E4361
      7465676F7279BB09000016004974656D735B3438365D2E446973706C61794E61
      6D65C809000013004974656D735B3438375D2E43617465676F7279C909000016
      004974656D735B3438375D2E446973706C61794E616D65CF0900001300497465
      6D735B3438385D2E43617465676F7279D009000016004974656D735B3438385D
      2E446973706C61794E616D65D109000013004974656D735B3438395D2E436174
      65676F7279D209000016004974656D735B3438395D2E446973706C61794E616D
      652404000012004974656D735B34385D2E43617465676F727900010000150049
      74656D735B34385D2E446973706C61794E616D65D309000013004974656D735B
      3439305D2E43617465676F7279D409000016004974656D735B3439305D2E4469
      73706C61794E616D65D509000013004974656D735B3439315D2E43617465676F
      7279D609000016004974656D735B3439315D2E446973706C61794E616D65D709
      000013004974656D735B3439325D2E43617465676F7279D80900001600497465
      6D735B3439325D2E446973706C61794E616D65D909000013004974656D735B34
      39335D2E43617465676F7279DA09000016004974656D735B3439335D2E446973
      706C61794E616D65DE09000013004974656D735B3439345D2E43617465676F72
      79DF09000016004974656D735B3439345D2E446973706C61794E616D65070A00
      0013004974656D735B3439355D2E43617465676F7279080A000016004974656D
      735B3439355D2E446973706C61794E616D65090A000013004974656D735B3439
      365D2E43617465676F72790A0A000016004974656D735B3439365D2E44697370
      6C61794E616D650B0A000013004974656D735B3439375D2E43617465676F7279
      0C0A000016004974656D735B3439375D2E446973706C61794E616D650D0A0000
      13004974656D735B3439385D2E43617465676F72790E0A000016004974656D73
      5B3439385D2E446973706C61794E616D650F0A000013004974656D735B343939
      5D2E43617465676F7279100A000016004974656D735B3439395D2E446973706C
      61794E616D652504000012004974656D735B34395D2E43617465676F72790301
      000015004974656D735B34395D2E446973706C61794E616D65F8030000110049
      74656D735B345D2E43617465676F72799400000014004974656D735B345D2E44
      6973706C61794E616D65110A000013004974656D735B3530305D2E4361746567
      6F7279120A000016004974656D735B3530305D2E446973706C61794E616D6513
      0A000013004974656D735B3530315D2E43617465676F7279140A000016004974
      656D735B3530315D2E446973706C61794E616D65150A000013004974656D735B
      3530325D2E43617465676F7279160A000016004974656D735B3530325D2E4469
      73706C61794E616D65170A000013004974656D735B3530335D2E43617465676F
      7279180A000016004974656D735B3530335D2E446973706C61794E616D65190A
      000013004974656D735B3530345D2E43617465676F72791A0A00001600497465
      6D735B3530345D2E446973706C61794E616D651B0A000013004974656D735B35
      30355D2E43617465676F72791C0A000016004974656D735B3530355D2E446973
      706C61794E616D651D0A000013004974656D735B3530365D2E43617465676F72
      791E0A000016004974656D735B3530365D2E446973706C61794E616D651F0A00
      0013004974656D735B3530375D2E43617465676F7279200A000016004974656D
      735B3530375D2E446973706C61794E616D65210A000013004974656D735B3530
      385D2E43617465676F7279220A000016004974656D735B3530385D2E44697370
      6C61794E616D65230A000013004974656D735B3530395D2E43617465676F7279
      240A000016004974656D735B3530395D2E446973706C61794E616D6526040000
      12004974656D735B35305D2E43617465676F72790601000015004974656D735B
      35305D2E446973706C61794E616D65250A000013004974656D735B3531305D2E
      43617465676F7279260A000016004974656D735B3531305D2E446973706C6179
      4E616D65270A000013004974656D735B3531315D2E43617465676F7279280A00
      0016004974656D735B3531315D2E446973706C61794E616D65290A0000130049
      74656D735B3531325D2E43617465676F72792A0A000016004974656D735B3531
      325D2E446973706C61794E616D652B0A000013004974656D735B3531335D2E43
      617465676F72792C0A000016004974656D735B3531335D2E446973706C61794E
      616D652D0A000013004974656D735B3531345D2E43617465676F72792E0A0000
      16004974656D735B3531345D2E446973706C61794E616D652F0A000013004974
      656D735B3531355D2E43617465676F7279300A000016004974656D735B353135
      5D2E446973706C61794E616D65310A000013004974656D735B3531365D2E4361
      7465676F7279320A000016004974656D735B3531365D2E446973706C61794E61
      6D65330A000013004974656D735B3531375D2E43617465676F7279340A000016
      004974656D735B3531375D2E446973706C61794E616D65350A00001300497465
      6D735B3531385D2E43617465676F7279360A000016004974656D735B3531385D
      2E446973706C61794E616D65370A000013004974656D735B3531395D2E436174
      65676F7279380A000016004974656D735B3531395D2E446973706C61794E616D
      652704000012004974656D735B35315D2E43617465676F727909010000150049
      74656D735B35315D2E446973706C61794E616D65390A000013004974656D735B
      3532305D2E43617465676F72793A0A000016004974656D735B3532305D2E4469
      73706C61794E616D653B0A000013004974656D735B3532315D2E43617465676F
      72793C0A000016004974656D735B3532315D2E446973706C61794E616D653D0A
      000013004974656D735B3532325D2E43617465676F72793E0A00001600497465
      6D735B3532325D2E446973706C61794E616D653F0A000013004974656D735B35
      32335D2E43617465676F7279400A000016004974656D735B3532335D2E446973
      706C61794E616D65410A000013004974656D735B3532345D2E43617465676F72
      79420A000016004974656D735B3532345D2E446973706C61794E616D654B0A00
      0013004974656D735B3532355D2E43617465676F72794C0A000016004974656D
      735B3532355D2E446973706C61794E616D654D0A000013004974656D735B3532
      365D2E43617465676F72794E0A000016004974656D735B3532365D2E44697370
      6C61794E616D654F0A000013004974656D735B3532375D2E43617465676F7279
      500A000016004974656D735B3532375D2E446973706C61794E616D656E0A0000
      13004974656D735B3532385D2E43617465676F72796F0A000016004974656D73
      5B3532385D2E446973706C61794E616D65830A000013004974656D735B353239
      5D2E43617465676F7279840A000016004974656D735B3532395D2E446973706C
      61794E616D652804000012004974656D735B35325D2E43617465676F72790C01
      000015004974656D735B35325D2E446973706C61794E616D65850A0000130049
      74656D735B3533305D2E43617465676F7279860A000016004974656D735B3533
      305D2E446973706C61794E616D65870A000013004974656D735B3533315D2E43
      617465676F7279880A000016004974656D735B3533315D2E446973706C61794E
      616D65910A000013004974656D735B3533325D2E43617465676F7279920A0000
      16004974656D735B3533325D2E446973706C61794E616D65930A000013004974
      656D735B3533335D2E43617465676F7279940A000016004974656D735B353333
      5D2E446973706C61794E616D65950A000013004974656D735B3533345D2E4361
      7465676F7279960A000016004974656D735B3533345D2E446973706C61794E61
      6D65970A000013004974656D735B3533355D2E43617465676F7279980A000016
      004974656D735B3533355D2E446973706C61794E616D65990A00001300497465
      6D735B3533365D2E43617465676F72799A0A000016004974656D735B3533365D
      2E446973706C61794E616D659B0A000013004974656D735B3533375D2E436174
      65676F72799C0A000016004974656D735B3533375D2E446973706C61794E616D
      659D0A000013004974656D735B3533385D2E43617465676F72799E0A00001600
      4974656D735B3533385D2E446973706C61794E616D659F0A000013004974656D
      735B3533395D2E43617465676F7279A00A000016004974656D735B3533395D2E
      446973706C61794E616D652904000012004974656D735B35335D2E4361746567
      6F72790F01000015004974656D735B35335D2E446973706C61794E616D65A10A
      000013004974656D735B3534305D2E43617465676F7279A20A00001600497465
      6D735B3534305D2E446973706C61794E616D65A30A000013004974656D735B35
      34315D2E43617465676F7279A40A000016004974656D735B3534315D2E446973
      706C61794E616D65A50A000013004974656D735B3534325D2E43617465676F72
      79A60A000016004974656D735B3534325D2E446973706C61794E616D65A70A00
      0013004974656D735B3534335D2E43617465676F7279A80A000016004974656D
      735B3534335D2E446973706C61794E616D65A90A000013004974656D735B3534
      345D2E43617465676F7279AA0A000016004974656D735B3534345D2E44697370
      6C61794E616D65AB0A000013004974656D735B3534355D2E43617465676F7279
      AC0A000016004974656D735B3534355D2E446973706C61794E616D65B10A0000
      13004974656D735B3534365D2E43617465676F7279B20A000016004974656D73
      5B3534365D2E446973706C61794E616D65B30A000013004974656D735B353437
      5D2E43617465676F7279B40A000016004974656D735B3534375D2E446973706C
      61794E616D65B60A000013004974656D735B3534385D2E43617465676F7279B7
      0A000016004974656D735B3534385D2E446973706C61794E616D65B80A000013
      004974656D735B3534395D2E43617465676F7279B90A000016004974656D735B
      3534395D2E446973706C61794E616D652A04000012004974656D735B35345D2E
      43617465676F72791201000015004974656D735B35345D2E446973706C61794E
      616D65BA0A000013004974656D735B3535305D2E43617465676F7279BB0A0000
      16004974656D735B3535305D2E446973706C61794E616D65BD0A000013004974
      656D735B3535315D2E43617465676F7279BE0A000016004974656D735B353531
      5D2E446973706C61794E616D65C00A000013004974656D735B3535325D2E4361
      7465676F7279C10A000016004974656D735B3535325D2E446973706C61794E61
      6D65C40A000013004974656D735B3535335D2E43617465676F7279C50A000016
      004974656D735B3535335D2E446973706C61794E616D65CB0A00001300497465
      6D735B3535345D2E43617465676F7279CC0A000016004974656D735B3535345D
      2E446973706C61794E616D65CD0A000013004974656D735B3535355D2E436174
      65676F7279CE0A000016004974656D735B3535355D2E446973706C61794E616D
      65D70A000013004974656D735B3535365D2E43617465676F7279D80A00001600
      4974656D735B3535365D2E446973706C61794E616D65DC0A000013004974656D
      735B3535375D2E43617465676F7279DD0A000016004974656D735B3535375D2E
      446973706C61794E616D65DF0A000013004974656D735B3535385D2E43617465
      676F7279E00A000016004974656D735B3535385D2E446973706C61794E616D65
      E10A000013004974656D735B3535395D2E43617465676F7279E20A0000160049
      74656D735B3535395D2E446973706C61794E616D652B04000012004974656D73
      5B35355D2E43617465676F72791501000015004974656D735B35355D2E446973
      706C61794E616D65E40A000013004974656D735B3536305D2E43617465676F72
      79E50A000016004974656D735B3536305D2E446973706C61794E616D65E60A00
      0013004974656D735B3536315D2E43617465676F7279E70A000016004974656D
      735B3536315D2E446973706C61794E616D65E80A000013004974656D735B3536
      325D2E43617465676F7279E90A000016004974656D735B3536325D2E44697370
      6C61794E616D65EA0A000013004974656D735B3536335D2E43617465676F7279
      EB0A000016004974656D735B3536335D2E446973706C61794E616D65ED0A0000
      13004974656D735B3536345D2E43617465676F7279EE0A000016004974656D73
      5B3536345D2E446973706C61794E616D65EF0A000013004974656D735B353635
      5D2E43617465676F7279F00A000016004974656D735B3536355D2E446973706C
      61794E616D65F10A000013004974656D735B3536365D2E43617465676F7279F2
      0A000016004974656D735B3536365D2E446973706C61794E616D65F30A000013
      004974656D735B3536375D2E43617465676F7279F40A000016004974656D735B
      3536375D2E446973706C61794E616D650A0B000013004974656D735B3536385D
      2E43617465676F72790B0B000016004974656D735B3536385D2E446973706C61
      794E616D650C0B000013004974656D735B3536395D2E43617465676F72790D0B
      000016004974656D735B3536395D2E446973706C61794E616D652C0400001200
      4974656D735B35365D2E43617465676F72791801000015004974656D735B3536
      5D2E446973706C61794E616D650E0B000013004974656D735B3537305D2E4361
      7465676F72790F0B000016004974656D735B3537305D2E446973706C61794E61
      6D65150B000013004974656D735B3537315D2E43617465676F7279160B000016
      004974656D735B3537315D2E446973706C61794E616D65170B00001300497465
      6D735B3537325D2E43617465676F7279180B000016004974656D735B3537325D
      2E446973706C61794E616D651B0B000013004974656D735B3537335D2E436174
      65676F72791C0B000016004974656D735B3537335D2E446973706C61794E616D
      651D0B000013004974656D735B3537345D2E43617465676F72791E0B00001600
      4974656D735B3537345D2E446973706C61794E616D65230B000013004974656D
      735B3537355D2E43617465676F7279240B000016004974656D735B3537355D2E
      446973706C61794E616D652D04000012004974656D735B35375D2E4361746567
      6F72791B01000015004974656D735B35375D2E446973706C61794E616D652E04
      000012004974656D735B35385D2E43617465676F72791E01000015004974656D
      735B35385D2E446973706C61794E616D652F04000012004974656D735B35395D
      2E43617465676F72792101000015004974656D735B35395D2E446973706C6179
      4E616D65F903000011004974656D735B355D2E43617465676F72799600000014
      004974656D735B355D2E446973706C61794E616D653004000012004974656D73
      5B36305D2E43617465676F72792401000015004974656D735B36305D2E446973
      706C61794E616D653104000012004974656D735B36315D2E43617465676F7279
      2701000015004974656D735B36315D2E446973706C61794E616D653204000012
      004974656D735B36325D2E43617465676F72792A01000015004974656D735B36
      325D2E446973706C61794E616D653304000012004974656D735B36335D2E4361
      7465676F72792D01000015004974656D735B36335D2E446973706C61794E616D
      653404000012004974656D735B36345D2E43617465676F727930010000150049
      74656D735B36345D2E446973706C61794E616D653504000012004974656D735B
      36355D2E43617465676F72793301000015004974656D735B36355D2E44697370
      6C61794E616D653604000012004974656D735B36365D2E43617465676F727936
      01000015004974656D735B36365D2E446973706C61794E616D65370400001200
      4974656D735B36375D2E43617465676F72793901000015004974656D735B3637
      5D2E446973706C61794E616D653804000012004974656D735B36385D2E436174
      65676F72793B01000015004974656D735B36385D2E446973706C61794E616D65
      3904000012004974656D735B36395D2E43617465676F72793D01000015004974
      656D735B36395D2E446973706C61794E616D65FA03000011004974656D735B36
      5D2E43617465676F72799900000014004974656D735B365D2E446973706C6179
      4E616D653A04000012004974656D735B37305D2E43617465676F72793F010000
      15004974656D735B37305D2E446973706C61794E616D653B0400001200497465
      6D735B37315D2E43617465676F72794101000015004974656D735B37315D2E44
      6973706C61794E616D653C04000012004974656D735B37325D2E43617465676F
      72794301000015004974656D735B37325D2E446973706C61794E616D653D0400
      0012004974656D735B37335D2E43617465676F72794501000015004974656D73
      5B37335D2E446973706C61794E616D653E04000012004974656D735B37345D2E
      43617465676F72794701000015004974656D735B37345D2E446973706C61794E
      616D653F04000012004974656D735B37355D2E43617465676F72794901000015
      004974656D735B37355D2E446973706C61794E616D654004000012004974656D
      735B37365D2E43617465676F72794B01000015004974656D735B37365D2E4469
      73706C61794E616D654104000012004974656D735B37375D2E43617465676F72
      794D01000015004974656D735B37375D2E446973706C61794E616D6542040000
      12004974656D735B37385D2E43617465676F72794F01000015004974656D735B
      37385D2E446973706C61794E616D654304000012004974656D735B37395D2E43
      617465676F72795101000015004974656D735B37395D2E446973706C61794E61
      6D65FB03000011004974656D735B375D2E43617465676F72799C000000140049
      74656D735B375D2E446973706C61794E616D654404000012004974656D735B38
      305D2E43617465676F72795301000015004974656D735B38305D2E446973706C
      61794E616D654504000012004974656D735B38315D2E43617465676F72795501
      000015004974656D735B38315D2E446973706C61794E616D6546040000120049
      74656D735B38325D2E43617465676F72795701000015004974656D735B38325D
      2E446973706C61794E616D654704000012004974656D735B38335D2E43617465
      676F72795901000015004974656D735B38335D2E446973706C61794E616D6548
      04000012004974656D735B38345D2E43617465676F72795B0100001500497465
      6D735B38345D2E446973706C61794E616D654904000012004974656D735B3835
      5D2E43617465676F72795D01000015004974656D735B38355D2E446973706C61
      794E616D654A04000012004974656D735B38365D2E43617465676F72795F0100
      0015004974656D735B38365D2E446973706C61794E616D654B04000012004974
      656D735B38375D2E43617465676F72796101000015004974656D735B38375D2E
      446973706C61794E616D654C04000012004974656D735B38385D2E4361746567
      6F72796301000015004974656D735B38385D2E446973706C61794E616D654D04
      000012004974656D735B38395D2E43617465676F72796501000015004974656D
      735B38395D2E446973706C61794E616D65FC03000011004974656D735B385D2E
      43617465676F72799F00000014004974656D735B385D2E446973706C61794E61
      6D654E04000012004974656D735B39305D2E43617465676F7279670100001500
      4974656D735B39305D2E446973706C61794E616D654F04000012004974656D73
      5B39315D2E43617465676F72796901000015004974656D735B39315D2E446973
      706C61794E616D655004000012004974656D735B39325D2E43617465676F7279
      6B01000015004974656D735B39325D2E446973706C61794E616D655104000012
      004974656D735B39335D2E43617465676F72796D01000015004974656D735B39
      335D2E446973706C61794E616D655204000012004974656D735B39345D2E4361
      7465676F72796F01000015004974656D735B39345D2E446973706C61794E616D
      655304000012004974656D735B39355D2E43617465676F727971010000150049
      74656D735B39355D2E446973706C61794E616D655404000012004974656D735B
      39365D2E43617465676F72797301000015004974656D735B39365D2E44697370
      6C61794E616D655504000012004974656D735B39375D2E43617465676F727975
      01000015004974656D735B39375D2E446973706C61794E616D65560400001200
      4974656D735B39385D2E43617465676F72797701000015004974656D735B3938
      5D2E446973706C61794E616D655704000012004974656D735B39395D2E436174
      65676F72797901000015004974656D735B39395D2E446973706C61794E616D65
      FD03000011004974656D735B395D2E43617465676F7279A20000001400497465
      6D735B395D2E446973706C61794E616D6500090054696D65725469636B00000E
      00506F707570537461747573456E6300001300506F7075705374617475734C69
      6E65456E647300000D005442584974656D456E6457696E00000C005442584974
      656D456E64556E00000D005442584974656D456E644D616300000B00496D674C
      69737454726565000012005072696E74657253657475704469616C6F6700000A
      0053796E745374796C6573000005006563414350000101000000040048696E74
      00000F00506172616D436F6D706C6574696F6E000101000000040048696E7400
      000D0054656D706C617465506F707570000101000000040048696E7400000B00
      506F7075704C657865727300000B00656343686172506F707570000101000000
      040048696E7400000B0054696D657252656472617700000D005442584974656D
      4F546F6F6C730102000000C2030000070043617074696F6E1805000004004869
      6E74001200544258536570617261746F724974656D323200000E005442584974
      656D426B436C6561720102000000B8030000070043617074696F6EB903000004
      0048696E7400090054696D657248696E7400001200544258536570617261746F
      724974656D323600000F005442584974656D4D61726B537761700102000000F6
      040000070043617074696F6E17050000040048696E74000F005442584974656D
      4D61726B436F6C6C0102000000F7040000070043617074696F6E160500000400
      48696E74000F005442584974656D4D61726B44726F700102000000F804000007
      0043617074696F6E15050000040048696E74000400746251730101000000FA04
      0000070043617074696F6E000D005442584974656D46464E6578740102000000
      0B050000070043617074696F6EFB040000040048696E74000D00544258497465
      6D46465072657601020000000C050000070043617074696F6EFC040000040048
      696E740016005442585375626D656E754974656D546F6F6C6261727301010000
      00FE040000070043617074696F6E000A005442584974656D5451730102000000
      FF040000070043617074696F6E1C050000040048696E74000C00544258497465
      6D5456696577010200000000050000070043617074696F6E1B05000004004869
      6E74000C005442584974656D5445646974010200000001050000070043617074
      696F6E1A050000040048696E74000C005442584974656D5446696C6501020000
      0002050000070043617074696F6E19050000040048696E740006006362436173
      6501020000000D050000070043617074696F6E09050000040048696E74000400
      6564517301010000000A050000040048696E740010005442436F6E74726F6C49
      74656D316161000009005442584974656D517301020000000805000007004361
      7074696F6E11050000040048696E740006006362576F726401020000000E0500
      00070043617074696F6E0F050000040048696E74000F005442584974656D534D
      61726B416C6C010200000010050000070043617074696F6E1405000004004869
      6E740011005442584974656D48656C70546F7069637301020000002705000007
      0043617074696F6E28050000040048696E74000D005442584974656D46436C6F
      7365010200000029050000070043617074696F6E3D050000040048696E740007
      006163436C6F736500000F00506F707570546162436F6E746578740000150054
      42584974656D546162436C6F73654F746865727301010000002D050000070043
      617074696F6E000F005442584974656D546162436C6F736501010000002E0500
      00070043617074696F6E000D005442584974656D5461624E657701010000002F
      050000070043617074696F6E001200544258536570617261746F724974656D32
      3800001100496D6167654C697374436C6F736542746E00000900616353617665
      416C6C00000F005442584974656D4653617665416C6C01020000003305000007
      0043617074696F6E3C050000040048696E74000A006163436C6F7365416C6C00
      0010005442584974656D46436C6F7365416C6C01020000003505000007004361
      7074696F6E3E050000040048696E740016006163436C6F73654F746865727354
      68697347726F7570000010005442584974656D46436C6F73654F746801020000
      0040050000070043617074696F6E41050000040048696E740012005442585365
      70617261746F724974656D323900000F005442584974656D465365734F70656E
      010200000042050000070043617074696F6E48050000040048696E7400110054
      42584974656D4653657353617665417301020000004305000007004361707469
      6F6E49050000040048696E74000A004F445F53657373696F6E00000A0053445F
      53657373696F6E000016005442585375626D656E754974656D46526563656E74
      7301010000004C050000070043617074696F6E00120054425853657061726174
      6F724974656D3330000014005442584974656D46436C656172526563656E7473
      01010000004D050000070043617074696F6E0014005462785375626D656E7549
      74656D57696E646F7701010000004E050000070043617074696F6E000C005442
      584974656D4554696D65010200000050050000070043617074696F6E53050000
      040048696E740011005442585375626D656E754974656D52756E010100000054
      050000070043617074696F6E000C005442584974656D546F6F6C310101000000
      69050000070043617074696F6E000C005442584974656D546F6F6C3201010000
      006A050000070043617074696F6E000C005442584974656D546F6F6C33010100
      00006B050000070043617074696F6E000C005442584974656D546F6F6C340101
      0000006C050000070043617074696F6E001200544258536570617261746F7249
      74656D3331000011005442584974656D52756E46696E64506870010100000059
      050000070043617074696F6E0011005442584974656D52756E4F70656E446972
      010200000067050000070043617074696F6E68050000040048696E74000C0054
      42584974656D546F6F6C35010100000085050000070043617074696F6E000C00
      5442584974656D546F6F6C36010100000086050000070043617074696F6E000C
      005442584974656D546F6F6C37010100000087050000070043617074696F6E00
      0C005442584974656D546F6F6C38010100000088050000070043617074696F6E
      0011005442585375626D656E754974656D456E63010100000089050000070043
      617074696F6E0012005442585375626D656E754C696E65456E64730101000000
      8A050000070043617074696F6E000E005442584974656D456E644D57696E0000
      0D005442584974656D456E644D556E00000E005442584974656D456E644D4D61
      6300000D005442585375626D656E75456E6301020000008E0500000700436170
      74696F6EA1050000040048696E74000E005442585375626D656E75456E633201
      02000000A0050000070043617074696F6EA2050000040048696E740009005469
      6D65724C6F61640000090065635265706C6163650101000000BD050000040048
      696E74000B005442584974656D535265700102000000AA050000070043617074
      696F6EAD050000040048696E74000C005442584974656D5346696E6401020000
      00AB050000070043617074696F6EAC050000040048696E740006006163457869
      74000010005442584974656D46436C6F736544656C0102000000B60500000700
      43617074696F6EB9050000040048696E740010006163436C6F7365416E644465
      6C6574650000100065635265706C616365496E46696C65730101000000BE0500
      00040048696E740012005442584974656D53526570496E46696C657301020000
      00C0050000070043617074696F6EC1050000040048696E7400080054696D6572
      53656C000015005442585375626D656E754974656D4374784D6F726501010000
      00C4050000070043617074696F6E0011005442584974656D437478436F707955
      726C0102000000C5050000070043617074696F6EC6050000040048696E740014
      005442584974656D437478436F7079417070656E640102000000C70500000700
      43617074696F6EC8050000040048696E740013005442584974656D4374784375
      74417070656E640102000000C9050000070043617074696F6ECA050000040048
      696E74001200544258536570617261746F724974656D33340000120054425849
      74656D437478436F707948544D4C0101000000CB050000070043617074696F6E
      0011005442584974656D437478436F70795254460101000000CD050000070043
      617074696F6E001200544258536570617261746F724974656D333500000E0054
      42584974656D454375744170700102000000DE050000070043617074696F6EDF
      050000040048696E74000F005442584974656D45436F70794170700102000000
      E0050000070043617074696F6EE1050000040048696E74000C00544258497465
      6D546F6F6C390101000000E4050000070043617074696F6E000D005442584974
      656D546F6F6C31300101000000E5050000070043617074696F6E000D00544258
      4974656D546F6F6C31310101000000E6050000070043617074696F6E000D0054
      42584974656D546F6F6C31320101000000E7050000070043617074696F6E0011
      005442584974656D53476F427261636B65740102000000F10500000700436170
      74696F6EF2050000040048696E74000500706C4F75740101000000F305000007
      0043617074696F6E01010000000700546F6F6C6261720101000000E309000007
      0043617074696F6E0007004C6973744F7574000010005442584974656D565061
      6E656C4F75740102000000F7050000070043617074696F6E470A000004004869
      6E74000900656353686F774F75740101000000F4050000070043617074696F6E
      000B005442584974656D4F4F75740102000000F9050000070043617074696F6E
      FA050000040048696E74000800506F7075704F757400000F005442584974656D
      4F7574436C6561720101000000FC050000070043617074696F6E001100544258
      4974656D4F7574436F707953656C0101000000FD050000070043617074696F6E
      000D005442584974656D4F75744E61760101000000FE05000007004361707469
      6F6E001200544258536570617261746F724974656D3138000011005442584974
      656D4F7574436F7079416C6C0101000000FF050000070043617074696F6E0012
      00544258536570617261746F724974656D333200000F00496D6167654C697374
      537461747573000010005442584974656D4F757444656C53656C010100000004
      060000070043617074696F6E0016005442584974656D4F757444656C4E6F6E70
      6172736564010100000005060000070043617074696F6E000900506F70757046
      696E64000012005442584974656D5472656546696E644E617601010000000806
      0000070043617074696F6E001200544258536570617261746F724974656D3336
      00001200544258536570617261746F724974656D333700000C00616353657475
      704C6578484C00000F005442584974656D4F4C65786572486901020000000E06
      0000070043617074696F6E0F060000040048696E740012005442585365706172
      61746F724974656D333800000E005442584974656D4F4F4C6578537401020000
      0010060000070043617074696F6E11060000040048696E74000C005442584974
      656D4545787472010200000012060000070043617074696F6E13060000040048
      696E74001200544258536570617261746F724974656D33390000100054425849
      74656D454361736553656E74010200000018060000070043617074696F6E1906
      0000040048696E74000D005442584974656D434353656E7401020000001A0600
      00070043617074696F6E1B060000040048696E74000A00656353656E74436173
      6501010000001C060000070043617074696F6E000900506F7075705A6F6F6D00
      000E005442584974656D5A53657433303000000E005442584974656D5A536574
      32303000000E005442584974656D5A53657431353000000E005442584974656D
      5A53657431303000000D005442584974656D5A536574373500000D0054425849
      74656D5A536574353000000D005442584974656D5A536574323500000D005442
      584974656D5A4F74686572010100000025060000070043617074696F6E000600
      706C436C69700001010000000700546F6F6C6261720101000000E40900000700
      43617074696F6E000A00656353686F77436C6970010100000027060000070043
      617074696F6E001200544258536570617261746F724974656D323500000C0054
      42584974656D4F436C6970010200000028060000070043617074696F6E290600
      00040048696E74000900506F707570436C697000000E005442584974656D436C
      6970436C7201010000002C060000070043617074696F6E0014006563476F746F
      4E65787446696E64526573756C74000014006563476F746F5072657646696E64
      526573756C7400001200544258536570617261746F724974656D343000000F00
      5442584974656D535265735072657601020000002D060000070043617074696F
      6E33060000040048696E74000F005442584974656D535265734E657874010200
      00002E060000070043617074696F6E34060000040048696E74000E0054425849
      74656D4553796E634564010200000035060000070043617074696F6E36060000
      040048696E74000E005442584974656D4653657341646401020000003B060000
      070043617074696F6E3C060000040048696E74000900656346756C6C53637200
      000F005442584974656D4F46756C6C5363720102000000410600000700436170
      74696F6E44060000040048696E74000D0054696D6572427261636B6574730000
      1200544258536570617261746F724974656D3431000011005442584974656D54
      6162436F7079446972010100000046060000070043617074696F6E0012005442
      584974656D546162436F707946756C6C01010000004706000007004361707469
      6F6E0010005442584974656D546162436F7079464E0101000000480600000700
      43617074696F6E001200544258536570617261746F724974656D343200001200
      544258536570617261746F724974656D343400000D005442584974656D565379
      6E63480102000000CB090000070043617074696F6E52060000040048696E7400
      0D005442584974656D5653796E63560102000000CC090000070043617074696F
      6E53060000040048696E74000D00656353796E635363726F6C6C4800000D0065
      6353796E635363726F6C6C5600000D005442584974656D4F5368656C6C010200
      000058060000070043617074696F6E59060000040048696E7400120054425853
      75626D656E754974656D5669657701010000005A060000070043617074696F6E
      000D005442584974656D4F4F6E546F7001020000005B06000007004361707469
      6F6E5C060000040048696E7400070065634F6E546F7000001100544258497465
      6D4546696C6C426C6F636B01020000005F060000070043617074696F6E620600
      00040048696E74000F005442584974656D45496E735465787401020000006306
      0000070043617074696F6E6B060000040048696E740012005442585365706172
      61746F724974656D3233000011005442584974656D4374784F70656E53656C01
      0100000068060000040048696E74001200544258536570617261746F72497465
      6D3435000010005442584974656D437478546F6F6C3132000010005442584974
      656D437478546F6F6C3131000010005442584974656D437478546F6F6C313000
      000F005442584974656D437478546F6F6C3900000F005442584974656D437478
      546F6F6C3800000F005442584974656D437478546F6F6C3700000F0054425849
      74656D437478546F6F6C3600000F005442584974656D437478546F6F6C350000
      0F005442584974656D437478546F6F6C3400000F005442584974656D43747854
      6F6F6C3300000F005442584974656D437478546F6F6C3200000F005442584974
      656D437478546F6F6C3100001200544258536570617261746F724974656D3133
      00001200544258536570617261746F724974656D323400001000544258537562
      6D656E754974656D313001010000006C060000070043617074696F6E00150054
      42584974656D4F526573746F72655374796C657301020000006D060000070043
      617074696F6E6E060000040048696E740013005442584974656D437478437573
      746F6D697A6501010000006F060000070043617074696F6E0011006563546F67
      676C65466F63757354726565000011006563546F67676C65466F637573436C69
      7000000B0065635A656E457870616E6400001200544258536570617261746F72
      4974656D34360000090065635A656E57726170000010005442585375626D656E
      754974656D3133010100000080060000070043617074696F6E000C0054425849
      74656D45436F6D6D010200000081060000070043617074696F6E820600000400
      48696E74000E005442584974656D45556E636F6D6D0102000000830600000700
      43617074696F6E84060000040048696E740019005442584974656D45546F6767
      6C654C696E65436F6D6D656E74010200000085060000070043617074696F6E86
      060000040048696E740013006563546F67676C654C696E65436F6D6D656E7400
      0013006563546F67676C65466F6375734F75747075740000080061634261636B
      7570000015006563546F67676C6553747265616D436F6D6D656E7400001B0054
      42584974656D45546F67676C6553747265616D436F6D6D656E7401020000008F
      060000070043617074696F6E90060000040048696E740010005442585375626D
      656E754974656D3136010100000091060000070043617074696F6E0010005442
      585375626D656E754974656D3137010100000092060000070043617074696F6E
      000E005442584974656D454D6F7665446E010200000093060000070043617074
      696F6E95060000040048696E74000E005442584974656D454D6F766555700102
      00000094060000070043617074696F6E96060000040048696E74001100544258
      4974656D48656C70446F6E617465010200000097060000070043617074696F6E
      98060000040048696E74000D005442584974656D4544656C4C6E010200000099
      060000070043617074696F6E9A060000040048696E7400120054425853657061
      7261746F724974656D3437000010005442585375626D656E754974656D313801
      010000009B060000070043617074696F6E0011005442584974656D4543704469
      725061746801010000009C060000070043617074696F6E001200544258497465
      6D45437046756C6C5061746801010000009D060000070043617074696F6E000C
      005442584974656D454370464E01010000009E060000070043617074696F6E00
      14006563546F67676C65466F63757346696E6452657300001300544258497465
      6D54625370656C6C436865636B0102000000A9060000070043617074696F6EAA
      060000040048696E74001200544258536570617261746F724974656D34380000
      0C0065635370656C6C436865636B00000B0065635370656C6C4C697665000012
      005442584974656D54625370656C6C4C6976650102000000AB06000007004361
      7074696F6EAC060000040048696E740012005442584974656D565370656C6C43
      6865636B0102000000AE060000070043617074696F6EAF060000040048696E74
      0011005442584974656D565370656C6C4C6976650102000000B0060000070043
      617074696F6EB1060000040048696E74001200544258536570617261746F7249
      74656D343900000C005442584974656D454A6F696E0102000000B60600000700
      43617074696F6EB7060000040048696E74000D005442584974656D4553706C69
      740102000000BC060000070043617074696F6EBD060000040048696E74001200
      544258536570617261746F724974656D3530000014005442585375626D656E75
      4974656D4D6163726F730101000000BE060000070043617074696F6E00100054
      42584974656D4D6163726F506C61790102000000C7060000070043617074696F
      6ED5060000040048696E740010005442584974656D4D6163726F53746F700102
      000000C9060000070043617074696F6ED3060000040048696E74001200544258
      4974656D4D6163726F5265636F72640102000000CB060000070043617074696F
      6ED2060000040048696E740012005442584974656D4D6163726F43616E63656C
      0102000000CD060000070043617074696F6ED4060000040048696E7400120054
      4258536570617261746F724974656D353100000F005442584974656D4D616372
      6F446C670102000000CF060000070043617074696F6ED6060000040048696E74
      000D0061634D6163726F5265636F726400000B0061634D6163726F53746F7000
      000D0061634D6163726F43616E63656C00000B0061634D6163726F506C617900
      000D0061634D6163726F4469616C6F6700000A0065634D6163726F5265630000
      12005442584974656D48746D6C507265766965770102000000D8060000070043
      617074696F6ED9060000040048696E74001200544258536570617261746F7249
      74656D35320000080061634D6163726F310000080061634D6163726F32000008
      0061634D6163726F330000080061634D6163726F340000080061634D6163726F
      350000080061634D6163726F360000080061634D6163726F370000080061634D
      6163726F380000080061634D6163726F390000100050726F70734D616E616765
      724B65797300001200544258536570617261746F724974656D353300000D0054
      42584974656D4D6163726F3900000D005442584974656D4D6163726F3800000D
      005442584974656D4D6163726F3700000D005442584974656D4D6163726F3600
      000D005442584974656D4D6163726F3500000D005442584974656D4D6163726F
      3400000D005442584974656D4D6163726F3300000D005442584974656D4D6163
      726F3200000D005442584974656D4D6163726F3100000D005442584974656D42
      6B4E6578740102000000EE060000070043617074696F6EF1060000040048696E
      74000D005442584974656D426B507265760102000000EF060000070043617074
      696F6EF2060000040048696E74000F005442584974656D426B546F67676C6501
      02000000F0060000070043617074696F6EF3060000040048696E74000C006563
      426B436C656172416C6C00000A006563426B546F67676C65000008006563426B
      4E657874000008006563426B5072657600000B006563426B496E766572736500
      0010005442584974656D426B496E76657273650102000000FA06000007004361
      7074696F6EFB060000040048696E740008006563426B436F7079000007006563
      426B43757400000A006563426B44656C65746500000E006563426B44656C6574
      65556E6D6B000009006563426B5061737465000010005442584974656D426B44
      656C556E6D6B010200000007070000070043617074696F6E0C07000004004869
      6E74000C005442584974656D426B44656C010200000008070000070043617074
      696F6E0D070000040048696E74000E005442584974656D426B50617374650102
      00000009070000070043617074696F6E0E070000040048696E74000C00544258
      4974656D426B43757401020000000A070000070043617074696F6E0F07000004
      0048696E74000D005442584974656D426B436F707901020000000B0700000700
      43617074696F6E10070000040048696E74000D005442584974656D5462476F74
      6F010200000013070000070043617074696F6E14070000040048696E74000600
      6563476F746F00001200544258536570617261746F724974656D313200001000
      5442584974656D5653796E635665727401020000001707000007004361707469
      6F6E18070000040048696E740010005442584974656D5653796E63486F727A01
      0200000019070000070043617074696F6E1A070000040048696E740013006563
      546F67676C65466F63757347726F75707300001200544258536570617261746F
      724974656D353400000F005442584974656D454375744C696E6501020000001D
      070000070043617074696F6E23070000040048696E740010005442584974656D
      45436F70794C696E6501020000001E070000070043617074696F6E2407000004
      0048696E740012005442585375626D656E754974656D54696479010100000025
      070000070043617074696F6E000E005442584974656D54696479436667010200
      000026070000070043617074696F6E28070000040048696E74000E0054425849
      74656D5469647956616C010200000027070000070043617074696F6E29070000
      040048696E74001200544258536570617261746F724974656D3535000007004C
      69737456616C00000D00506F70757056616C696461746500000D005442584974
      656D56616C4E617601010000002F070000070043617074696F6E001200544258
      536570617261746F724974656D3536000011005442584974656D56616C436F70
      7953656C010100000030070000070043617074696F6E0011005442584974656D
      56616C436F7079416C6C010100000031070000070043617074696F6E00120054
      4258536570617261746F724974656D353700000F005442584974656D56616C43
      6C656172010100000032070000070043617074696F6E0015006563546F67676C
      65466F63757356616C6964617465000015005442584974656D45446564757041
      646A6163656E74010100000037070000070043617074696F6E00160054425849
      74656D5462446564757041646A6163656E740101000000390700000700436170
      74696F6E0012005442585375626D656E754974656D5365737301010000005907
      0000070043617074696F6E001200544258536570617261746F724974656D3539
      00000E005442584974656D53657373436C7201010000005A0700000700436170
      74696F6E000F005442584974656D465365735361766501020000005C07000007
      0043617074696F6E5D070000040048696E740010005442584974656D46536573
      436C6F736501020000005E070000070043617074696F6E5F070000040048696E
      74000E00656352656D6F7665426C616E6B73000011005442584974656D455265
      6D426C616E6B73010200000064070000070043617074696F6E65070000040048
      696E74000D00656352656D6F76654C696E657300000F005442585375626D656E
      754974656D31010100000066070000070043617074696F6E0012005442585365
      70617261746F724974656D363000000F005442584974656D455472696D416C6C
      010200000067070000070043617074696F6E6A070000040048696E7400110054
      42584974656D455472696D547261696C01020000006807000007004361707469
      6F6E6B070000040048696E740010005442584974656D455472696D4C65616401
      0200000069070000070043617074696F6E6C070000040048696E74000A006563
      5472696D4C65616400000B0065635472696D547261696C000009006563547269
      6D416C6C00001100656352656D6F766544757053706163657300001000544258
      4974656D4552656D4475705370010200000078070000070043617074696F6E79
      070000040048696E740009006563546162546F53700000090065635370546F54
      616200001200544258536570617261746F724974656D363100000F0054425849
      74656D455370546F54616201020000007E070000070043617074696F6E7F0700
      00040048696E74000F005442584974656D45546162546F537001020000008007
      0000070043617074696F6E81070000040048696E74000E00656346696E64436C
      69704E65787400000E00656346696E64436C6970507265760000160054425853
      75626D656E754974656D53657373696F6E730101000000860700000700436170
      74696F6E000C00656353706C697435305F353000000C00656353706C69743430
      5F363000000C00656353706C697436305F343000000C00656353706C69743330
      5F373000000C00656353706C697437305F333000000C00656353706C69743230
      5F383000000C00656353706C697438305F3230000012005442584974656D4D61
      63726F5265706561740102000000CD090000070043617074696F6E9D07000004
      0048696E74000D0061634D6163726F5265706561740000120054425853657061
      7261746F724974656D363200000B006563526570656174436D64000011005442
      584974656D45526570656174436D640102000000A2070000070043617074696F
      6EA3070000040048696E7400090054425853657057696E00000E005442584974
      656D57696E465265730101000000A4070000070043617074696F6E000D005442
      584974656D57696E4F75740101000000A5070000070043617074696F6E000E00
      5442584974656D57696E436C69700101000000A6070000070043617074696F6E
      000E005442584974656D57696E547265650101000000A7070000070043617074
      696F6E000D005442584974656D57696E56616C0101000000A807000007004361
      7074696F6E00090054425853756257696E0101000000A9070000070043617074
      696F6E0010005442584974656D4D61726B436C6561720102000000AD07000007
      0043617074696F6EAE070000040048696E740010006563546F67676C65466F63
      75734D617000000D005442584974656D57696E4D61700101000000B307000007
      0043617074696F6E000C00656346696E64496E5472656500001000656346696E
      64496E547265654E65787400001000656346696E64496E547265655072657600
      000A006563547265654E65787400000A006563547265655072657600000E0065
      63526564756365426C616E6B73000014005442584974656D4552656475636542
      6C616E6B730102000000B8070000070043617074696F6EB9070000040048696E
      74000B00656353706C69744C65667400000C00656353706C6974526967687400
      001400656346696E644E65787457697468457874656E6400001400656346696E
      645072657657697468457874656E64000011005442584974656D48656C704B65
      796D61700102000000E2070000070043617074696F6EE3070000040048696E74
      000C00656346696E64496E4C69737400001000656346696E64496E4C6973744E
      65787400001000656346696E64496E4C6973745072657600000F005442584974
      656D436C697046696E640101000000E4070000070043617074696F6E00120054
      4258536570617261746F724974656D363400001200544258536570617261746F
      724974656D3635000013005442584974656D5472656546696E6446696E640101
      000000E5070000070043617074696F6E001200544258536570617261746F7249
      74656D363600000E005442584974656D56616C46696E640101000000E6070000
      070043617074696F6E001200544258536570617261746F724974656D36370000
      0E005442584974656D4F757446696E640101000000E707000007004361707469
      6F6E000900506F7075705472656500000F005442584974656D5472656546696E
      640101000000E8070000070043617074696F6E0011005442584974656D547265
      65457870616E640101000000E9070000070043617074696F6E00130054425849
      74656D54726565436F6C6C617073650101000000EA070000070043617074696F
      6E000D0054696D65724175746F5361766500000E005442584974656D4D616372
      6F323900000E005442584974656D4D6163726F323800000E005442584974656D
      4D6163726F323700000E005442584974656D4D6163726F323600000E00544258
      4974656D4D6163726F323500000E005442584974656D4D6163726F323400000E
      005442584974656D4D6163726F323300000E005442584974656D4D6163726F32
      3200000E005442584974656D4D6163726F323100000E005442584974656D4D61
      63726F323000000E005442584974656D4D6163726F313900000E005442584974
      656D4D6163726F313800000E005442584974656D4D6163726F313700000E0054
      42584974656D4D6163726F313600000E005442584974656D4D6163726F313500
      000E005442584974656D4D6163726F313400000E005442584974656D4D616372
      6F313300000E005442584974656D4D6163726F313200000E005442584974656D
      4D6163726F313100000E005442584974656D4D6163726F313000000E00544258
      4974656D4D6163726F33300000090061634D6163726F31300000090061634D61
      63726F31310000090061634D6163726F31320000090061634D6163726F313300
      00090061634D6163726F31340000090061634D6163726F31350000090061634D
      6163726F31360000090061634D6163726F31370000090061634D6163726F3138
      0000090061634D6163726F31390000090061634D6163726F3230000009006163
      4D6163726F32310000090061634D6163726F32320000090061634D6163726F32
      330000090061634D6163726F32340000090061634D6163726F32350000090061
      634D6163726F32360000090061634D6163726F32370000090061634D6163726F
      32380000090061634D6163726F32390000090061634D6163726F333000000800
      5472656546696E64000018005442584974656D5472656546696E64436F707954
      6F546162010100000015080000070043617074696F6E0014005442584974656D
      5472656546696E64436C656172010100000016080000070043617074696F6E00
      19005442584974656D5472656546696E64436F7079546F436C69700101000000
      17080000070043617074696F6E0017005442584974656D5472656546696E6443
      6F6C6C61707365010100000018080000070043617074696F6E00150054425849
      74656D5472656546696E64457870616E64010100000019080000070043617074
      696F6E001200544258536570617261746F724974656D36390000180054425849
      74656D5472656546696E64457870616E6443757201010000001A080000070043
      617074696F6E0010005442584974656D43747846696E64494401020000001B08
      0000070043617074696F6E1C080000040048696E74000C006563547265655061
      72656E74000011006563547265654E65787442726F7468657200001100656354
      7265655072657642726F74686572000011005442584974656D4D61726B476F4C
      61737401020000002E080000070043617074696F6E2F080000040048696E7400
      12005442584974656D52756E4F70656E46696C65010200000030080000070043
      617074696F6E31080000040048696E740010005442584974656D5353656C546F
      6B656E010200000034080000070043617074696F6E35080000040048696E7400
      1D005442584974656D5472656546696E64436F7079546F436C69704E6F646501
      0100000038080000070043617074696F6E000D005442584974656D4650726F70
      73010200000039080000070043617074696F6E3A080000040048696E74000700
      616350726F707300000D006563496E73657274436F6C6F7201010000003D0800
      00070043617074696F6E0013005442584974656D48746D6C496E73436F6C6F72
      01020000003E080000070043617074696F6E3F080000040048696E7400120054
      4258536570617261746F724974656D3731000013005442584974656D436C6970
      436F7079546F4564010100000044080000070043617074696F6E001500544258
      4974656D436C6970436F7079546F436C69700101000000450800000700436170
      74696F6E001200544258536570617261746F724974656D373200001700656352
      65706C61636553656C46726F6D436C6970416C6C00000B006163526572656164
      4F7574000014006563546F67676C65466F63757350726F6A65637400000E0054
      42584974656D57696E50726F6A010100000051080000070043617074696F6E00
      0D006563496E73657274496D616765000013005442584974656D48746D6C496E
      73496D616765010200000052080000070043617074696F6E5508000004004869
      6E740018006563546F67676C65466F6375734D6173746572536C61766500000D
      006563546F67676C65536C617665000013005462784974656D52756E46696E64
      48746D6C3401010000005E080000070043617074696F6E001300546278497465
      6D52756E46696E6448746D6C3501010000005F080000070043617074696F6E00
      0700656352756C657200000D005442584974656D4F52756C6572010200000060
      080000070043617074696F6E61080000040048696E74001400656353706C6974
      566965777356657274486F727A00001400656353706C6974536C617665566572
      74486F727A000008006563476F746F426B00000D005442584974656D426B476F
      746F01020000006C080000070043617074696F6E6D080000040048696E740015
      005442584974656D48746D6C4C6F72656D497073756D01020000007008000007
      0043617074696F6E71080000040048696E74000C0065634C6F72656D49707375
      6D000011005442585375626D656E754974656D46617601010000007208000007
      0043617074696F6E0011005442584974656D46617641646446696C6501020000
      0073080000070043617074696F6E74080000040048696E740010005442584974
      656D4661764D616E616765010200000075080000070043617074696F6E760800
      00040048696E74000C00616346617641646446696C6500000B0061634661764D
      616E61676500001A005462785375626D656E754974656D526563656E74436F6C
      6F72730101000000F2080000040048696E74001400496D6167654C697374436F
      6C6F72526563656E74000012005442584974656D437478416464436F6C6F7201
      020000007C080000070043617074696F6E7D080000040048696E740011005442
      584974656D46617641646450726F6A01020000007E080000070043617074696F
      6E7F080000040048696E74000C00616346617641646450726F6A000012005442
      58536570617261746F724974656D3735000013005442584974656D5461624164
      64546F50726F6A010100000080080000070043617074696F6E0012006563546F
      67676C65466F637573436C69707300000F005462784974656D57696E436C6970
      73010100000084080000070043617074696F6E000A00506F707570436C697073
      000013005442584974656D436C69707341646454657874010100000085080000
      070043617074696F6E0010005442584974656D436C6970734564697401010000
      0086080000070043617074696F6E001200544258536570617261746F72497465
      6D3736000013005442584974656D436C69707341646446696C65010100000087
      080000070043617074696F6E000F005442584974656D436C6970734469720101
      00000088080000070043617074696F6E0009004F445F53776174636800000900
      53445F53776174636800000B00544258546162436F6C6F720000120054425853
      75626D656E75546162436F6C6F7201010000008D080000070043617074696F6E
      0013005442584974656D546162436F6C6F724D69736301010000008E08000007
      0043617074696F6E001200544258536570617261746F724974656D3737000012
      005442584974656D546162436F6C6F7244656601010000008F08000007004361
      7074696F6E0013005442584974656D436C69707344656C546578740101000000
      90080000070043617074696F6E0009006563536D617274486C00001500544258
      4974656D426B44726F70506F727461626C650102000000930800000700436170
      74696F6E95080000040048696E74001000656344726F70506F727461626C6542
      6B00001200544258536570617261746F724974656D3738000010006563476F74
      6F506F727461626C65426B000015005442584974656D426B476F746F506F7274
      61626C65010200000096080000070043617074696F6E97080000040048696E74
      000800616352656E616D6500000E005442584974656D4652656E616D65010200
      00009E080000070043617074696F6E9F080000040048696E7400110054425849
      74656D52756E4E756D436F6E760102000000A0080000070043617074696F6EA1
      080000040048696E7400120065634E756D65726963436F6E7665727465720000
      0F006563496E64656E744C696B6531737400001200544258536570617261746F
      724974656D3333000015005442584974656D45496E64656E744C696B65317374
      0102000000A4080000070043617074696F6EA5080000040048696E7400150054
      42584974656D56696577436F6C4D61726B6572730102000000A8080000070043
      617074696F6EA9080000040048696E74000F006163436F6C756D6E4D61726B65
      727300001200544258536570617261746F724974656D373900000C00496D6167
      654C697374467470000008004C697374504C6F6700000F00506F707570506C75
      67696E734C6F67000012005442584974656D504C6F67436F707953656C010100
      0000B0080000070043617074696F6E0012005442584974656D504C6F67436F70
      79416C6C0101000000B1080000070043617074696F6E00120054425853657061
      7261746F724974656D3831000011005442584974656D504C6F6744656C657465
      0101000000B2080000070043617074696F6E0010005442584974656D504C6F67
      436C6561720101000000B3080000070043617074696F6E001200544258536570
      617261746F724974656D383200000F005442584974656D504C6F6746696E6401
      01000000B4080000070043617074696F6E001A005442584974656D4374785061
      7374654E6F4375724368616E67650102000000B7080000070043617074696F6E
      B8080000040048696E74001200544258536570617261746F724974656D383000
      0013005442585375626D656E754974656D456D6D65740101000000B908000007
      0043617074696F6E0014005442584974656D48746D6C456D6D65745772617001
      01000000C3080000070043617074696F6E0016005442584974656D48746D6C45
      6D6D6574457870616E640101000000C2080000070043617074696F6E00090050
      6C7567696E414350000101000000040048696E7400000D00656343656E746572
      4C696E657300001200544258536570617261746F724974656D38330000130054
      42584974656D4543656E7465724C696E65730102000000D00800000700436170
      74696F6ED1080000040048696E740008004C697374546162730102000000D508
      00001200436F6C756D6E735B305D2E43617074696F6ED60800001200436F6C75
      6D6E735B315D2E43617074696F6E0011006563546F67676C65466F6375735461
      627300000E005462784974656D57696E546162730101000000D9080000070043
      617074696F6E0015005442585375626D656E754974656D506C7567696E730101
      000000DA080000070043617074696F6E001200544258536570617261746F7249
      74656D3834000019005442584974656D4F4564697453796E506C7567696E7349
      6E690102000000DB080000070043617074696F6EDC080000040048696E740011
      005442584974656D504C6F675361766541730101000000DD0800000700436170
      74696F6E0016005442584974656D5461624D6F7665546F57696E646F77010100
      0000DE080000070043617074696F6E0016005442584974656D5461624F70656E
      496E57696E646F770101000000DF080000070043617074696F6E001100656345
      6E636F646548746D6C436861727300000C006563536F72744469616C6F670000
      12005442584974656D45536F72744469616C6F670102000000E6080000070043
      617074696F6EE7080000040048696E74001200544258536570617261746F7249
      74656D3836000013005442584974656D5462536F72744469616C6F6701020000
      00E8080000070043617074696F6EE9080000040048696E740013005442584974
      656D5353656C427261636B6574730102000000ED080000070043617074696F6E
      EE080000040048696E7400110050726F70734D616E616765725072696E740000
      090054696D657254726565000010006563436F6C6C61707365506172656E7400
      0014006563436F6C6C61707365576974684E6573746564000010006563537054
      6F5461624C656164696E67000013005442584974656D455370546F5461624C65
      61640102000000FF080000070043617074696F6E00090000040048696E740016
      006563546F67676C654C696E65436F6D6D656E74416C7400001C005442584974
      656D45546F67676C654C696E65436F6D6D656E74416C74010200000005090000
      070043617074696F6E06090000040048696E740018005442584974656D437478
      5061737465546F436F6C756D6E31010200000009090000070043617074696F6E
      0A090000040048696E74000E006563436F6D6D616E64734C6973740000160054
      42584974656D48656C70436F6D6D616E644C69737401020000000D0900000700
      43617074696F6E10090000040048696E74000D00656350726F6A6563744C6973
      7400001200544258536570617261746F724974656D3930000010005462785375
      626D656E75436172657473010100000017090000070043617074696F6E001400
      5442584974656D43617265747352656D6F766532010100000018090000070043
      617074696F6E0014005442584974656D43617265747352656D6F766531010100
      000019090000070043617074696F6E001200544258536570617261746F724974
      656D3931000019005442584974656D43617265747346726F6D53656C436C6561
      7201010000001A090000070043617074696F6E0019005442584974656D436172
      65747346726F6D53656C526967687401010000001B090000070043617074696F
      6E0018005442584974656D43617265747346726F6D53656C4C65667401010000
      001C090000070043617074696F6E001200544258536570617261746F72497465
      6D3932000017005442584974656D436172657473457874446F776E456E640101
      0000001D090000070043617074696F6E0015005442584974656D436172657473
      4578745570456E6401010000001E090000070043617074696F6E001800544258
      4974656D436172657473457874446F776E5061676501010000001F0900000700
      43617074696F6E0016005442584974656D436172657473457874557050616765
      010100000020090000070043617074696F6E0018005442584974656D43617265
      7473457874446F776E4C696E65010100000021090000070043617074696F6E00
      16005442584974656D43617265747345787455704C696E650101000000220900
      00070043617074696F6E001200544258536570617261746F724974656D393300
      001B005442584974656D43617265747346726F6D4D61726B73436C6561720101
      0000003F090000070043617074696F6E001B005442584974656D436172657473
      46726F6D4D61726B735269676874010100000040090000070043617074696F6E
      001A005442584974656D43617265747346726F6D4D61726B734C656674010100
      000041090000070043617074696F6E000E005442584974656D45436F6C756D6E
      010200000042090000070043617074696F6E43090000040048696E74000C0065
      6345646974436F6C756D6E00000A0065634465647570416C6C00000F00656344
      6564757041646A6163656E7400001200544258536570617261746F724974656D
      3934000010005442584974656D454465647570416C6C01010000004409000007
      0043617074696F6E001200544258536570617261746F724974656D3835000011
      005442584974656D54624465647570416C6C0101000000450900000700436170
      74696F6E001200544258536570617261746F724974656D393500001400544258
      4974656D45416C69676E57697468536570010200000048090000070043617074
      696F6E49090000040048696E74000E006563416C69676E576974685365700000
      15005442584974656D546162546F67676C6553706C697401010000004E090000
      070043617074696F6E0012006563546F67676C6553686F7747726F7570320000
      11005442584974656D5353656C457874656E6401020000005509000007004361
      7074696F6E56090000040048696E740016005442584974656D54726565436F6C
      6C61707365416C6C010100000059090000070043617074696F6E001400544258
      4974656D54726565457870616E64416C6C01010000005A090000070043617074
      696F6E0011005442584974656D547265654C6576656C3201010000005B090000
      070043617074696F6E0011005442584974656D547265654C6576656C35010100
      00005C090000070043617074696F6E0011005442584974656D547265654C6576
      656C3401010000005D090000070043617074696F6E0011005442584974656D54
      7265654C6576656C3301010000005E090000070043617074696F6E0012005442
      58536570617261746F724974656D3936000013005442585375626D656E755472
      65654C6576656C01010000005F090000070043617074696F6E00110054425849
      74656D547265654C6576656C36010100000060090000070043617074696F6E00
      11005442584974656D547265654C6576656C3901010000006109000007004361
      7074696F6E0011005442584974656D547265654C6576656C3801010000006209
      0000070043617074696F6E0011005442584974656D547265654C6576656C3701
      0100000063090000070043617074696F6E000E006563526576657273654C696E
      657300001200544258536570617261746F724974656D363800000F0054425849
      74656D4552657665727365010100000066090000070043617074696F6E000E00
      656353687566666C654C696E657300000F005442584974656D4553687566666C
      6501010000006D090000070043617074696F6E00070074625573657231010100
      000087090000070043617074696F6E0007007462557365723201010000008809
      0000070043617074696F6E000700746255736572330101000000890900000700
      43617074696F6E001200544258536570617261746F724974656D393700000D00
      5442584974656D545573657233010100000093090000070043617074696F6E00
      0D005442584974656D545573657232010100000092090000070043617074696F
      6E000D005442584974656D545573657231010100000091090000070043617074
      696F6E0012005442585375626D656E75546F6F6C6261727301010000008D0900
      00070043617074696F6E0010005442584974656D4F546F6F6C62617233010100
      00008E090000070043617074696F6E0010005442584974656D4F546F6F6C6261
      723201010000008F090000070043617074696F6E0010005442584974656D4F54
      6F6F6C62617231010100000090090000070043617074696F6E00110065634578
      7472616374447570734361736500001300656345787472616374447570734E6F
      4361736500001100544258536570617261746F724974656D3700001800544258
      4974656D45457874726163744475704E6F4361736501010000009A0900000700
      43617074696F6E0016005442584974656D454578747261637444757043617365
      01010000009B090000070043617074696F6E000D0065634E6F6E5072696E744F
      66660000100065634E6F6E5072696E7453706163657300000D0065634E6F6E50
      72696E74456F6C00000E0065634E6F6E5072696E74426F746800001600544258
      5375626D656E754974656D4E6F6E5072696E740101000000BC09000007004361
      7074696F6E001200544258536570617261746F724974656D3938000011005442
      584974656D4F4E5072696E74416C6C0101000000BD090000070043617074696F
      6E0011005442584974656D4F4E5072696E74456F6C0101000000BE0900000700
      43617074696F6E0014005442584974656D4F4E5072696E745370616365730101
      000000BF090000070043617074696F6E000C00506F7075705573657254423100
      000E005442584974656D557365725462310101000000C1090000070043617074
      696F6E000C00506F7075705573657254423200000E005442584974656D557365
      725442320101000000C2090000070043617074696F6E000C00506F7075705573
      657254423300000E005442584974656D557365725442330101000000C3090000
      070043617074696F6E0018005442584974656D4374785061737465426B6D6B4C
      696E65730101000000C5090000070043617074696F6E0017005442584974656D
      43747850617374654173436F6C756D6E0101000000C609000007004361707469
      6F6E001200544258536570617261746F724974656D3939000018005442584974
      656D4F4E5072696E74456F6C44657461696C730101000000C709000007004361
      7074696F6E00140065634E6F6E5072696E74456F6C44657461696C7300001100
      5442584974656D4F486964654974656D730102000000CA090000070043617074
      696F6ECE090000040048696E74001300544258536570617261746F724974656D
      313030000012005442584974656D4F4564697453796E496E690102000000DB09
      0000070043617074696F6EDC090000040048696E7400110061634F70656E4279
      53656C656374696F6E00001600496D6167654C69737449636F6E73466F677565
      32346200001600496D6167654C69737449636F6E73466F67756531366200000E
      00496D6167654C697374557365723100000E00496D6167654C69737455736572
      3200000E00496D6167654C697374557365723300000C00544258446F636B4C65
      66743100000D00544258446F636B52696768743100000E00544258446F636B42
      6F74746F6D3100000C0053706C69747465724C65667400000D0053706C697474
      6572526967687400000E0053706C6974746572426F74746F6D00000F00537461
      7475734974656D4C657865720101000000F3090000040048696E74000E005374
      617475734974656D456E64730101000000F2090000040048696E74000D005374
      617475734974656D456E630101000000F1090000040048696E74000F00537461
      7475734974656D4361726574000013005370544258536570617261746F724974
      656D31000013005370544258536570617261746F724974656D32000013005370
      544258536570617261746F724974656D33000013005370544258536570617261
      746F724974656D3400000E005374617475734974656D436861720101000000F4
      090000040048696E740013005370544258536570617261746F724974656D3500
      000C005374617475734974656D524F0101000000F5090000040048696E740013
      005370544258536570617261746F724974656D3600000E005374617475734974
      656D577261700101000000F6090000040048696E740013005370544258536570
      617261746F724974656D37000011005374617475734974656D53656C4D6F6465
      0101000000F7090000040048696E740013005370544258536570617261746F72
      4974656D38000011005374617475734974656D496E734D6F64650102000000EF
      090000070043617074696F6EF8090000040048696E7400130053705442585365
      70617261746F724974656D3900000E005374617475734974656D5A6F6F6D0102
      000000F0090000070043617074696F6EF9090000040048696E74001400537054
      4258536570617261746F724974656D313000000E005374617475734974656D42
      757379000014005370544258536570617261746F724974656D313100000E0053
      74617475734974656D48696E74000016005442584D52554C6973744974656D46
      526563656E7473000013005442584D52554C6973744974656D5F536573730000
      14005370544258536570617261746F724974656D313200001400537054425853
      6570617261746F724974656D3133000014005370544258536570617261746F72
      4974656D3134000012005442584D52554C6973744974656D464E657700001100
      5462784974656D5650616E656C436C69700102000000430A0000070043617074
      696F6E480A0000040048696E740011005442585375626D656E754D61726B6572
      730101000000510A0000070043617074696F6E000F005442585375626D656E75
      426B4F70730101000000520A0000070043617074696F6E001400544258537562
      6D656E75426B506F727461626C650101000000530A0000070043617074696F6E
      0014005370544258536570617261746F724974656D3136000012005442585375
      626D656E754974656D48544D4C0101000000550A0000070043617074696F6E00
      14005370544258536570617261746F724974656D313900000E00506F70757046
      6F6C644C6576656C000014005370544258536570617261746F724974656D3233
      000010005442584974656D556E666F6C64416C6C0101000000590A0000070043
      617074696F6E000E005442584974656D466F6C64416C6C01010000005A0A0000
      070043617074696F6E001200544258536570617261746F724974656D38370000
      11005442584974656D556E666F6C644C696E6501010000005B0A000007004361
      7074696F6E0017005442584974656D466F6C644E656172657374426C6F636B01
      010000005C0A0000070043617074696F6E0013005442584974656D466F6C6453
      656C426C6F636B01010000005D0A0000070043617074696F6E00120054425853
      6570617261746F724974656D3839000016005442584974656D466F6C6452616E
      676573496E53656C01010000005E0A0000070043617074696F6E001800544258
      4974656D556E666F6C6452616E676573496E53656C01010000005F0A00000700
      43617074696F6E001200544258536570617261746F724974656D383800001100
      5442584974656D466F6C64506172656E740101000000600A0000070043617074
      696F6E0015005442584974656D466F6C64576974684E65737465640101000000
      610A0000070043617074696F6E0013005442585375626D656E75466F6C644C65
      76656C0101000000620A0000070043617074696F6E0011005442584974656D46
      6F6C644C6576656C320101000000630A0000070043617074696F6E0011005442
      584974656D466F6C644C6576656C330101000000640A0000070043617074696F
      6E0011005442584974656D466F6C644C6576656C340101000000650A00000700
      43617074696F6E0011005442584974656D466F6C644C6576656C350101000000
      660A0000070043617074696F6E0011005442584974656D466F6C644C6576656C
      360101000000670A0000070043617074696F6E0011005442584974656D466F6C
      644C6576656C370101000000680A0000070043617074696F6E00110054425849
      74656D466F6C644C6576656C380101000000690A0000070043617074696F6E00
      11005442584974656D466F6C644C6576656C3901010000006A0A000007004361
      7074696F6E0010005462784974656D54616252656C6F616401010000006B0A00
      00070043617074696F6E0012005442585375626D656E7548746D6C48656C7001
      010000006C0A0000070043617074696F6E0014005442584974656D48746D6C45
      6D6D657448656C7001010000006D0A0000070043617074696F6E001400537054
      4258536570617261746F724974656D313700000C0054696D65724D696E696D61
      70000012005442585375626D656E754974656D436F6E760101000000700A0000
      070043617074696F6E0018005442585375626D656E754974656D48746D6C456E
      636F64650101000000710A0000070043617074696F6E001B005442584974656D
      456E636F646548746D6C4E6F427261636B6574730101000000720A0000070043
      617074696F6E0014005442584974656D456E636F646548746D6C416C6C010100
      0000730A0000070043617074696F6E0012006563456E636F646548746D6C4368
      61727332000014005370544258536570617261746F724974656D313800001300
      5442585375626D656E754974656D5072696E740101000000740A000007004361
      7074696F6E000D005462784974656D4D656E75585801020000007F0A00000700
      43617074696F6E800A0000040048696E74000C005462784974656D4D656E7558
      0102000000810A0000070043617074696F6E820A0000040048696E7400160054
      42585375626D656E754974656D50726F6A656374730101000000890A00000700
      43617074696F6E0012005442584974656D50726F6A41646446696C6501010000
      008B0A0000070043617074696F6E000F005442584974656D50726F6A4F70656E
      01010000008C0A0000070043617074696F6E0019005442585375626D656E7549
      74656D50726F6A526563656E747301010000008D0A0000070043617074696F6E
      0017005442584D52554C6973744974656D5F50726F6A65637473000014005370
      544258536570617261746F724974656D3234000016005442584974656D50726F
      6A526563656E74436C65617201010000008E0A0000070043617074696F6E0014
      005370544258536570617261746F724974656D323100000F005442584974656D
      50726F6A476F746F01010000008F0A0000070043617074696F6E000E00544258
      4974656D50726F6A4E65770101000000900A0000070043617074696F6E000D00
      5442584974656D546F6F6C31360101000000AD0A0000070043617074696F6E00
      0D005442584974656D546F6F6C31350101000000AE0A0000070043617074696F
      6E000D005442584974656D546F6F6C31340101000000AF0A0000070043617074
      696F6E000D005442584974656D546F6F6C31330101000000B00A000007004361
      7074696F6E0010005462784974656D437478546F6F6C31360000100054627849
      74656D437478546F6F6C3135000010005462784974656D437478546F6F6C3134
      000010005462784974656D437478546F6F6C3133000016005442584974656D50
      726F6A416464416C6C46696C65730101000000B50A0000070043617074696F6E
      000F005462784974656D50726F6A536176650101000000BC0A00000700436170
      74696F6E0014005370544258536570617261746F724974656D32320000090070
      6C436F6E736F6C65000009006564436F6E736F6C65000014006563546F67676C
      65466F637573436F6E736F6C65000011005442584974656D57696E436F6E736F
      6C650101000000C20A0000070043617074696F6E001500507974686F6E475549
      496E7075744F75747075743100000D00507974686F6E456E67696E653100000B
      004D656D6F436F6E736F6C6500000C00507974686F6E4D6F64756C6500001400
      5370544258536570617261746F724974656D3235000013005462784974656D52
      756E4E6577506C7567696E0102000000C30A0000070043617074696F6EC80A00
      00040048696E740010005462784974656D48656C7050794469720102000000C6
      0A0000070043617074696F6EC70A0000040048696E740012005462784974656D
      52756E536E6970706574730102000000C90A0000070043617074696F6ED00A00
      00040048696E740014005370544258536570617261746F724974656D32360000
      14005462784974656D52756E4E6577536E69707065740102000000CA0A000007
      0043617074696F6ECF0A0000040048696E74000B0053445F536E697070657473
      000014005370544258536570617261746F724974656D32370000110053746174
      75734974656D54616273697A650101000000D10A0000040048696E7400110054
      62784974656D54726565536F727465640101000000D20A000007004361707469
      6F6E000F00436F6C6F724469616C6F675461627300000F00506F70757050616E
      656C5469746C65000014005462784974656D50616E656C5469746C6542617201
      01000000D30A0000070043617074696F6E001A005462784974656D50616E656C
      5469746C6553686F7752696768740101000000D40A0000070043617074696F6E
      0018005462784974656D50616E656C5469746C6553686F774F75740101000000
      D50A0000070043617074696F6E0019005462784974656D50616E656C5469746C
      6553686F774C6566740101000000D60A0000070043617074696F6E0014005370
      544258536570617261746F724974656D32380000140053705442585365706172
      61746F724974656D3239000010005462784974656D57696E53706C6974560101
      000000DA0A0000070043617074696F6E0010005462784974656D57696E53706C
      6974480101000000DB0A0000070043617074696F6E0011005462784974656D57
      696E50726F6A5072650101000000DE0A0000070043617074696F6E0013006563
      546F67676C6550726F6A50726576696577000018005462785375626D656E7549
      74656D437478506C7567696E730101000000E30A0000070043617074696F6E00
      17005462785375626D656E754974656D50726F6A546F6F6C730101000000EC0A
      0000070043617074696F6E001200506F70757050726576696577456469746F72
      000010005462784974656D50726553656C65637400000E005462784974656D50
      7265436F7079000014005370544258536570617261746F724974656D33300000
      13005462784974656D5072655A6F6F6D4F74686572000011005462784974656D
      5072655A6F6F6D313030000010005462784974656D5072655A6F6F6D37350000
      10005462784974656D5072655A6F6F6D3530000010005462784974656D507265
      5A6F6F6D323500000E005462784974656D507265456469740000140053705442
      58536570617261746F724974656D3331000014005442585375626D656E754974
      656D47726F7570730101000000F50A0000040048696E74000E00546278497465
      6D47726F757032480101000000F60A0000070043617074696F6E000E00546278
      4974656D47726F757032560101000000F70A0000070043617074696F6E000F00
      5462784974656D47726F75704F6E650101000000F80A0000070043617074696F
      6E000E005462784974656D47726F757033480101000000F90A00000700436170
      74696F6E000E005462784974656D47726F757033560101000000FA0A00000700
      43617074696F6E0011005462784974656D47726F757036477269640101000000
      FB0A0000070043617074696F6E0011005462784974656D47726F757034477269
      640101000000FC0A0000070043617074696F6E000E005462784974656D47726F
      757034560101000000FD0A0000070043617074696F6E000E005462784974656D
      47726F757034480101000000FE0A0000070043617074696F6E00120054627849
      74656D47726F75703361733170320101000000FF0A0000070043617074696F6E
      0015005442585375626D656E754974656D546F47726F75700101000000000B00
      00070043617074696F6E0012005462784974656D546F47726F75705072657601
      01000000070B0000070043617074696F6E0012005462784974656D546F47726F
      75704E6578740101000000080B0000070043617074696F6E000F005462784974
      656D546F47726F7570360101000000010B0000070043617074696F6E000F0054
      62784974656D546F47726F7570350101000000020B0000070043617074696F6E
      000F005462784974656D546F47726F7570340101000000030B00000700436170
      74696F6E000F005462784974656D546F47726F7570330101000000040B000007
      0043617074696F6E000F005462784974656D546F47726F757032010100000005
      0B0000070043617074696F6E000F005462784974656D546F47726F7570310101
      000000060B0000070043617074696F6E0014005370544258536570617261746F
      724974656D323000001E005442584974656D546162436C6F73654F7468657273
      416C6C47726F7570730101000000090B0000070043617074696F6E0016006163
      436C6F73654F7468657273416C6C47726F75707300000D004C697374426F6F6B
      6D61726B730103000000110B00001200436F6C756D6E735B305D2E4361707469
      6F6E120B00001200436F6C756D6E735B315D2E43617074696F6E130B00001200
      436F6C756D6E735B325D2E43617074696F6E000E005462784974656D57696E42
      6B6D6B0101000000140B0000070043617074696F6E0016006563546F67676C65
      466F637573426F6F6B6D61726B7300001600496D6167654C69737449636F6E73
      54616E676F32326200000D005462784974656D57696E4674700101000000190B
      0000070043617074696F6E0012005462784974656D57696E4578706C6F726572
      01010000001A0B0000070043617074696F6E0016005442584974656D54616243
      6C6F73655269676874657201010000001F0B0000070043617074696F6E001500
      5442584974656D546162436C6F73654C65667465720101000000200B00000700
      43617074696F6E00120065635265706C616365496E50726F6A65637400001400
      5462784974656D53526570496E50726F6A6563740102000000210B0000070043
      617074696F6E220B0000040048696E7400120065635072657669657741637469
      6F6E4E65770000}
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
      494C01010200040004000A000A00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000280000000A00000001002000000000004006
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000AF927400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000BD9D7500BA82
      3E00B8792B00BA823E00BD9D750000000000000000000000000000000000AF92
      74000000000000000000AF9274000000000000000000AF927400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B0834E00C07C2F00E399
      4C00EEA65C00DB914900957D2800B0834E000000000000000000000000000000
      0000AF927400AF927400AF927400AF927400AF92740000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000AF927400AB702B00DA8A2F00E092
      3500DE923900D0812E004CA91C0076832500AF92740000000000000000000000
      0000AF927400AF927400AF927400AF927400AF92740000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000976A3E00A18F3300C8801F00CB84
      2200CB8422007F9A1A005EA0140055B72F00976A3E0000000000AF927400AF92
      7400AF927400AF927400AF927400AF927400AF927400AF927400AF9274000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000915E2B0089B44500B1882100C785
      2500B88224005DC12E0087881E00AB7D3600915E2B0000000000000000000000
      0000AF927400AF927400AF927400AF927400AF92740000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A3764100A6AB5900B8933C00C5AA
      5A00B7B96A00A6AB590073CF5300A4A05400A376410000000000000000000000
      0000AF927400AF927400AF927400AF927400AF92740000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000BD9D7500B39E5300B6C27600AFDB
      8F00D2C38C00A3E6960098E48A00B39E5300BD9D75000000000000000000AF92
      74000000000000000000AF9274000000000000000000AF927400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C9995500CBA95800CEC6
      8100C6D18C00BAD38800C5AA5A00C99955000000000000000000000000000000
      00000000000000000000AF927400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000D0AD7A00D89E
      4A00DA993800D89E4A00D0AD7A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000280000000A0000000100010000000000500000000000000000000000
      000000000000000000000000FFFFFF00FFFDF00000000000C1EDB00000000000
      80F0700000000000007070000000000000401000000000000070700000000000
      0070700000000000006DB0000000000080FDF00000000000C1FFF00000000000
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
  object ImageListIconsFogue24b: TPngImageList
    AllocBy = 50
    Height = 24
    Width = 24
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000002CF4944415478DA6364A03160441708ADAFDF0EA424493063DFEAC6C6
          22A22D08A9ABBBB8A0AE4EEFCFDFBF0CFFFEFF67F80BC4FFD0F07FA0BAFF407A
          D5AA550C271F3DBA04B2644D535321511604D5D45C025AA0FBF3E74FB0E17FFF
          FD03E33F40FC0FCA8659B46DDB368692E46486E0DADACB40AD7BD7B5B41412B4
          20B0AAEAD2A28606DD5FBF7EC17D80CB922D5BB7822D003BACBA1A6CC9FAB6B6
          42BC16F857545C5EDAD4A4F3EBF76F7030E0B364D3962D287AA7AD58F1F2FE9E
          3D12782DF02D2BBBB2A2B555FB37D0027078E3B1044483D4FDFEF38781999999
          A166CA94AB9BBBBA74F05AE05D5C7C75754787164813CC70423E01C971F3F030
          6436345CDBDADBAB8DD702CFC2C26BEBBABB35FF002D40369C90255CDCDC0C69
          7575D7B7F7F76BE1B5C02D2FEFFAA6BE3E0D9005A0E448AC259C5C5C0C895555
          37764D9AA489D70297ECEC1B5B274D52FF030D22622DE1E4E464882D2BBBB967
          EA540DBC16386664DCDC3975AADA5F684623D612760E0E8688A2A25BFB67CC50
          C76B817D6AEAAD3D3366A88234211B48C8123676768690BCBCDB0767CF56C36B
          814D52D29D0373E628837C002B1288B1848D8D8DC12F2BEBEE9179F354F05A60
          191F7FF7C8FCF94A301F106B092BD002CFB4B47BC7172E54C66B81594CCCBDE3
          8B1629C20D24D21216565606D7E4E4FBA7962C51C26B814964E4FD53CB962980
          921ECC60622C0159E0141FFFE0CCF2E58A782D300C0B7B786EE54AB97F680613
          B284998585C12E26E6D1F955ABE4F15AA01714F4E8E2DAB5B228861361090BD0
          02CBF0F0C797D6AD93C36B81AAA7E7B35BDBB6816B34522C61021676067E7ECF
          6F6FDF2E85D702291B9B574F0F1F1685F189B5041444CA0E0EAF9F1D392286D7
          024143C3F7EFCE9D134017871988CCFE8FC466646262903036FEF0FEFC79415C
          165403B128BBBCBC2F1327A7280319E0DFF7EFAF7F3E7CB801C87C0BC46DE816
          1403311710B393633812F801C4DF80B80FC40100DF3A1546363F2C0600000000
          49454E44AE426082}
        Name = 'PngImage11'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003414944415478DAC5957948147114C7BFEB7AACA841FD5148854A1812
          4441174A76904877995DDA0515955164C4625ABA0AD9266A5E692C1E79B4662A
          198547561B665E64E982DA89925861619A3ABBEBEC1CFD66DA225D4B9A081FBC
          7973BCF97E7EBFF77EF31B19FEB3C9261DB043A52A21C17582345D494C4C9424
          406064645DBE4AE543B32CCC82731C589E074F5CB0D6D656DC2DD77E71640D8F
          D3120A02FE1A101011519F1F1DED3D42D322C0643683661830042440F47A3D82
          D7ADC321E51102A11EA72715065801CA772399048FF100375D0FF966C45D9D4A
          13618E088E85E874BA9FB97985D95473C523672BC09D9DB8BB29337523C84BB0
          8C8C9C80633928B503883D75013F00E341847C17171724A6A9907A2E49660528
          DB8EF2AD9ACBEB79A311104558F01C7940E2E9220AF1CA38987F018C07717676
          465C4A24322253AC01A5DB5019A84958CB9B4CA3C4851984DE1842527822991C
          330A3016E2E8E484D884B3D0C4A45B038AB6E0DECECC787FCE641825CE9378B2
          6010E9AA5430448C2323FD1DC45EA14094FA0CB26335D600ED66DC0FCA8AF363
          0D64060C8D3775C5307EED819303E905479CB7F4C5526F610CC27DB155DFDB25
          A6C96D81AE06500E76A8B6E8BF1401791BA0DB93A55ECD9B8CA07A3BD1D7DD04
          0FBF908956F01F6DE05D0B9EA80B324440F65AD41CC8895DC11A8CE8ED7808BB
          29D330D56D315803254D5D2EC7DB47573EBDB94F5D14011A7FD41ECCB9B09C35
          52785D930B779F5DB0E16460CD8C247D5B47057429F1CF06BA112E02D2D7A0FE
          F0B5186FE3E7F7E86AA980D7CA7D30F6F5492E0FC31950167DFDF6D16A048880
          E455680AC9552DFDD0D108C64461BAC7028C0C0F4A5397D9A0B3A50A0DA5BD97
          4ED7586690E08BE613B9E717BDA82DC30CF779B0952BC0D023D2CA63EF80CAEC
          828F3D2FA13CD708AD08B8E48D96D0FCF0854FABB498BFCC1F43FD7DF8FE41FC
          BDC96DE44851DE6AB701F6ABF5782E02C217E0555471D8DC178D0F30DBCD0BD4
          50BFE4FA7FEC6A436E6A7791E62D82C48A0987E39EE839A65E3DD36DD61CD0C3
          C3645BA025D7BFBCB0944BCB43989E54FE07C0D713D8BBC815C134037BC943B7
          A8B57F42DB2B20825C09ABC4240096107724AEC0BFFFA3858DC34C7CC4E2CCE4
          FFF4FFD5BE016018EB5E3FF235790000000049454E44AE426082}
        Name = 'PngImage12'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003F04944415478DAB5D57D4C1B651C07F06F85626D8176A5EB0BCE65BC
          64C239E7C8324320CCC8DE37364618B20AA8742B4CC7ACB2F9AF99F12F13A7E2
          A6325E9D38DE04266C0C37B7F9BA4DA7A6731BB781C09669E8712BB52D504B5A
          ACCF1DD7626242966BFC25BFDEE57797DFE7FA3CCF3D27090402F83F43C2FDE8
          60DC430E89DCF9F8D3CC50380DE3BED2270BA7236368A9E6012D0ADFA6F7B5EE
          67C780F81A57584F7CE58D7148A3A250F8D681432CDA0E08C03387FA2B5A2B39
          E0E15A775840A5EAD8E5065832B89E2CDAF7F380063BDEB959D1FE2AFF0F08E0
          13D95C4AD256A6845607A41C2E78D78E8E4A1E5023FF3DBABCC3C2B0046874C1
          E7134748A552DC33C7F2C0A3470AAA1CE87C4500F2AAE8F2AE9739606183135E
          AF57142093C960DFA5845E0BA456E7BFEFC0090B0F2CC0F6C3745957050728EB
          1CF04C4D8902E40A05DCE6B859E068DE913FF1F93E1E5022F783EBA6132F7173
          10DB68C7E4C48428203A26069366CD2C509BF7A10BDD7B792016391FDD30F5EC
          E100593D0BB74BDC528D552A31BD5BC7CFC163F55BABDD38F5220FC460CBD17E
          D3C9320E88AA65E0703A45016A950ABE32030F50F5393513E82DE781686CA8FD
          B5B86F37370781D7EF409EF0A028C0737B1A0FBC99C00FD1F2A68D7593386396
          CC5EDA543F5CDC6BE280052A89A8E6C17092D1E580C4A6CD0D40DF2EA1DBDAC6
          E1E2B32F708042111EE07207602043B4B479FDC7C0B952A15BF6B101E3F9E76C
          640EDAADCD98C1FDEDB011F8EFC314AC30F2404AEBDA4F800BCF0B77647E3A60
          FCBE8803BAAC9DA872E4C3EFF7CFDB3C323212167527B652B9A1DA17F4496C59
          9E0BBD4E02AA3DEB3870B15800D29B6FEDBC64E480DEABDD38F8FB66B02C332F
          A0D5EA71F091D3D840E5846ADFD2E7B13A750DB4FA083CD195D102FCF0AC00AC
          6CBD96FF7321CBCCE01C7D16163A130CC3E0B5EC4EC82087171E34D17BF95A30
          F47A3DAAA88B5843AD0BD57EA1AF6065EA9302B0AA8D54760AC08ACFACDBAC3B
          18D68B1F072EA3F0D2328C8DD9F075DE3834917AD8FD4CA8160C9DCE80B68C1B
          C8A4B242B581C1DF9094C42D5319D27AD23A80AB050290D83D5232BC8DA6A770
          6DC48AECBE25B0D958DC3479B048B5187F38EF866AC13018B4B8B0E90E5651E9
          A19A6D74146A751C345A05D2FB927AC8472D5700B425C0DF258345F7D69D3AFD
          13A8160D99031BEC162916C727E0EEE8ED506D6E0E0CA08D763C4EA5CD2D51B2
          0344902D5BA75322E3CCC22F01FBFA7FAFB352B2364A6BE2FBB316D5C9E0F14C
          61D43C8DE4A529181ABC85E4E36ABE160CB95C81A1220752A965A19A8FAC3CB9
          42066534C81049BF03FCAB3940056EC79E3D6E24B99DE437F7F522004FCD73ED
          3A49FE8B2623F990700CEF359E8B19927F919CFE07CD4B773A3F6FCBAA000000
          0049454E44AE426082}
        Name = 'PngImage13'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003294944415478DAB5D54B485B511000D079820B155154047123A1A288
          88204151E33FDD59BA28141B14AB1244D2142B95C64FD4FA215AA2568295A012
          528C148A8B6EEB2F468D210BC1806E6A76228A0A8A9F95DA99C1FBA8144AF0D9
          0BC9BB99BCCCB99F793712FCE726D15B4545851A2F2AEA272727FF5292706F6F
          EFC95D37383F3FEF1740555F5F5FCBF1F13168341A4523F67ABD101E1E0E0303
          0356046605F0AAB7B7F71D014545458A0083C1E0753A9D6F2827022E06CACBCB
          753883E6C7003C1E0FC4C7C7437B7BFBC8C2C2C20C03656565D53D3D3D6F4F4E
          4EA0B4B45411B0B2B22280CF8B8B8B5F05508380F13180E5E565888B8B03B3D9
          3C868093014C5A8B808100C414014B4B4B02B061DF21803A0C3411A0D56A1501
          386A06BABABAC6119866A0A4A4A401038D8F0160E530D0DDDD3D81CB3529003D
          027A01DCDCDC3C28795858D89F801D013B03C5C5C58DB8EB0D04601FA2A2A21E
          045C5C5C70151180653FE976BB2718282C2C6CC23DA823203A3A5AD1129D9F9F
          33804533BDBABA3A2E000302B50444444428026816F41CE0C9E040C026006347
          47470D3DC96B6B6B707B7B1B52324992FE8AE5E7E733D0DFDFEF44608CEF2828
          2868EEECECD4114087151E5421016D6D6D909393237FDEDCDC04B55ACD4B8439
          6670B0230268C1195411E0F7FB697A21013828C8CECE963F070201C8CCCC8484
          8404181C1C9C45C02ADD4DEBBDC9647A797474045B5B5BB4415CAA46A3914B8F
          FA369BED5EF9521C4B1BB2B2B2E4D8CECE0EA4A7A73360B158BEADAFAF7F12C0
          87D6D6D6173483EDED6DFEE1E9E9298C8E8E426464245C5E5ECA31D162626278
          203462D182C120A4A4A4F01E0C0D0D7D47C0C2405E5E9E1997E5D9EEEE2ED00B
          31383C3C0487C3C137132C62A22526265212C8C8C89063070707101B1BCBBFB1
          5AAD3F3636363E32909B9B4B775523A2A5B344AFD7032DD7DCDC1C242525C1FE
          FEBE1C138D96C16EB7435A5A9A1C3B3B3BE37F33028687877FFA7C3E935C67B8
          FBB498AF2B2B2B353A9D0EAEAEAEC0E572814AA5E2A9D7D7D7734C347A5EA6A6
          A6203535558E5D5F5F739C4E022C530F164CF3BD4246E4295E9EE3CB1D5219E1
          29F38FEF02087C91424CF4E0F61BE5AA8E28609A17400000000049454E44AE42
          6082}
        Name = 'PngImage16'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000049E4944415478DAC5556B4C9B55187E9182DC2A2C5C1C040A982644F8
          E13A4482241548333461A28309258B20E5520BB24B19B204AB9126101CD43161
          83001D14D4D0854C255B1A206C26DCA276D040115661B6042850A85D5D8102F5
          3DB544E8A232A7F14D9EEF3BDF39E73BCF792FE7390EF01F9BC3FF42303030E0
          BCB9B9E91E1F1FBFF66F1338F078BCFE8080805776767640ABD582D96CAE6C6C
          6CBCB0674E685252D2058140906B341A617070B0B7ACACEC12F6771FC883ACAC
          AC3BE9E9E94C3A9D0ED3D3D3B0BEBE0E3333332DC5C5C51CDB9468441CC22F36
          36965D5757E7BFB1B101D1D1D145D8578FD87E8440281416AAD5EA72DCE92191
          48744426937DC7E572295B5B5BE0EDED0DF3F3F3B0B8B8C8E3F3F957ECF67314
          37232D2F2F7F4EA95442696969DDE4E4E439ECDFDC47909B9B7B2D3434347369
          69693D2828C81F1764E2EEBF4A4B4B83E0E0602B495B5B5B63656565BE1D81EF
          35B15876222585313434040B0B0B2402D9D82FDE47909191712332323299C964
          824422916F6F6FD3190CC6336E6E6E101212023E3E3E8440829EBE6D47D0F44D
          D775CEAC7A0E46150AC0DC81BFBFFFAF050505021CBB8D90EF7AD01916167632
          2F2F8F8402969797C16432814AA522B1253980B5B5354E4E4E4ECB9EC5031965
          9F69E69B85E0EA6881FB73DA060A85128D9B384206DBDBDBBBC7C7C74F5A096A
          6B6BCF2B148AAA9A9A1AEB9FB3B3B3D6C50959545414787979417373F36C5666
          E6B1E7C3C35538851E2755F6DD7E104803CE2900CBD722EC23B10F42DCC7F93A
          BD5E9F88EDBBBB55E45C585828C530BD1E1313034E4E4E303131017816203030
          D01A26E2455F6FEFBD0F048263905C2402BEF00DE07D0E30CE6DC2FFCF228C08
          0A8214C27584CCBE4C1D3141370C06431286C31A22168B05D9D9D9562252515B
          66335C6A96CC8B591F0540DB3840D7CB23F8DF71C4F29E759C10E63F3D07C470
          B7544C7608969C020B00E2E2E2606C6C0CA81EEEA0D7FC04A9ED83B0D2F9032E
          FAADDFE39EE47D86B9C9C0F2EBA8A8A8000F0F0F90CBE518831DD830EA215F78
          B9432D1F38F54404C4DE4A3DC1A1D1684DA74F1781E1C14318C372249E90B0DD
          BA79F378538BB8FB890888BDC6BF68A09B54D4221E17D45A1D68341A6B211089
          181E1E2EC6776D6B6BABF99F1050E145B608B2EA39F0E919782FD913B8991CF8
          F19ECAAA51C470F18D9191913B0D0D0D898F4BE000EEE11534F1F0FBEA6C2C47
          E3873F1F7A812E3F9F9AF8E6D1A89780A82DEA17787A7A02954A05A954DA855E
          A41C9C208079D5AFAA3B7FA9B407608E87DBD526616FDFB9B3672C3EBE7E8052
          4244D2B4BABAFA0B4AFC61221328DDF5D5D5D505072178D5EB4BC32DFDE57EBC
          7D3AF0B3F3137C94D8C6E2F15076E3097743CD5AECE9E9D1582C9628545AE8EF
          EFFFA2A4A424E320042C60287BE06E1D363B5600F4346C9876071312125AD083
          77D86C36E8743A20A2383A3A4A927FB5AAAAEADDBF22704178239E4694229888
          8B88098427C21141B2EBEAE2E2F2315EA90C5F5F5FAB946092BFC71B9048F52A
          42679BF708812BE230C2DDD6A6D81625844E7BE6136FB610C5111111CF4E4D4D
          ADA09454E0B7017E97090DE2E1DF5511B1A76C6F473B8F2DF087DE38C39E1BCC
          DE7E03823FF9303867E2140000000049454E44AE426082}
        Name = 'PngImage24'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000021C4944415478DA6364A0316084B3BCBCF281A424117AF6316CDBB68B
          740B5C5DBBFEEFDA958FAEE00F10FF00E2DF40BC7ECF1E86E4AEAE8940E65E86
          DDBB779266819D5DF7FF8307F3D015800CFF08C45F7FFF6658B57A3543455414
          03A3BDFD24A0D01E864387085A82B0C0C2A2E7FFF1E3B9D814954D9DCA76F7E5
          4B86F79F3FA388FFFBF70F4C1FDCBAF52D83BAFA3668F02DC06E81A161DFFF73
          E7B2B15990D0D4C4B6A0AE0E1E6430FA37121B1A7C4BA1C1371FD3024DCD09FF
          AF5DCB2464C10FA4A0FB0E657F470DBE65D0E09B8F6A8182C2A4FFF7EFA763B3
          20A6A1816D4943038AD85F20FE05657F02E2968E0EB8DC94CA4A50DC78A05A20
          2131E5FFF3E7A9582DA8A9615BD2D2823322911382202B2B839091D14A86F3E7
          23502DE0E79FF6FFC387646C06445455B1AD686B63C0076096700331AF96D66A
          86EBD7C3502D60639BF1FFE7CF446C9A43CBCAD8567775311002204B58809855
          51712DC3830721C3CD0256D619FF7FFDC26A41484909DB9A9E1E82167C875AC0
          A6A0B096E1E1C3510B48B5808161D6FFFFFFE3B1690C2C2A625BDFD747D00218
          6094945CCFF0E24510BA050B81164460D3E0939DCDB665EA54E22D1010D8C8F0
          F16300B2058E400CB2510C879E40A0E5AC445BC0CEBE99E1D72F3F640B8C8098
          13CD47C8A00D68812DD11630326E05799C018F81282104C4F9400B5C48B0600F
          9002D57A9B89B1209A40F06103AF807823102F22C60223A84F39600E24C1A223
          00A29BFD19C40D594C0000000049454E44AE426082}
        Name = 'PngImage1'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003CE4944415478DAAD926D4C5B6514C7FFBD638E94196D413A3679A9A8
          287408D8389A8811DD0C66C017D6B4284C022CB53A9640209B8C5989AC059AFA
          8139C8DE6A360864A19F8C22B1D5106569D1928925A1239B4DA7B4BB22D6C682
          C084EB2999269D6DE974E7E6B9E7DEF39C737ECF39CFE1218C5454549CC9CCCC
          3CD9DDDD7D139B484D4D8D9C6118B3D168FC2DDC3E2F9CB1A4A48495C964C91A
          8D86172D796565659C4422B93D3D3D7D656868E8F998014545454EB55A9D3532
          32B27F6060602412A0B4B4F4705555D52993C9045ABC9801050505B6B6B6B63D
          369B8DA336319100ADADAD1C55006A8FDB62B164C40C2079BDB7B777402814A2
          B1B1F1B4D7EB3D1CE610C79A9B9B751E8F07C3C3C3A72626268EDC0B20583E57
          5B5B0BB7DB1D84FCCB8F2E77A5BCBCFC81F1F17198CDE60287C371F59E00248D
          0683E103B1588C9E9E1EDFD8D898F0EF8DECECECBE96969637398EC3E0E0204B
          EDD911294934407C5959D91F3429080402686A6A52913E9B9B9BCBE4E4E4ACC9
          E572389D4EF4F7F79F989999E9F82F80A07C44175923954A837D068D222F3F3F
          BFBDBABAFADD8C8C0CE8F57A58ADD6A839360380CFE75FD36AB54FA6A5A541A5
          525D2E2E2E5628954A4C4D4D41A7D3C95657576DFF0B40F2705E5E9EAFAEAE0E
          CBCBCBB0DBED50281420E82C7D676D161C0B20283B525353671B1A1A1EF4FBFD
          181D1DBD3E3939F9442C813101940AA5245994ECA0490241E072B970E1829161
          D95BDC7D011CAF3F3AFFEC8B7B92B406ED15FFEFFE1B5D9D5D07751D5D93DF7E
          3721BD2F80A72FBEC0A57F2DC076F7966DC1FF40FADA8ABBC8879937BEDA343E
          A283F4DCDE9D6CDC02FBCCB54CCD27CF994EF0FB447D4B66F6ADE01E7F9FA877
          49CDAA4BBF39F0FE54D68D76D19F8922FB218B2726C0A3A79F120812055FB8ED
          73F9EB8FAC2320F2010B8B400FE470C3B4E1948E033882612426603B2B0033CF
          205DBAEBAA6FC1F7F24F6F3B7D5101298362ABD7E82A8485F65A20C14E38109C
          F4CB77F92AC0A190B407BBA1C734F6824BA915DBBCAFB964110109BA04D1E2DC
          E22D5C472746F1CE86F1186EE353D20E6C0D01EC26FB7ED29D77EC25D0E171F2
          FE303467C8CF163D92D6BEC73CFC780F1FA37DC3A8A2937E0E173D8F8500C4F8
          01AFD0FBCC9D1CE5D0E0218AEB8F028001C998058B9BD0E2331C472535681BE6
          F025CE93ED50886F1ACEE125D46305BB30448D7A1527C9D6FA0F30E214D5C38A
          75EAAE0F6D8847077E219B39C2B4EDA3EA92482F93AF807C19BAADF3904503C4
          D39220155D10D2F97EA63E7B7110D1240597A8EEADF895EAFC1147C9628F5E41
          6489BBCB7F8DD6FAC65721F874F6A570417F01FDB6662802C782990000000049
          454E44AE426082}
        Name = 'PngImage4'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004364944415478DAAD950D4C535714C7FFAF14CA97D096A9D3A9083A20
          4319930D50A65937750EB66C8605154B3B7005868E65C022ABA48A2E54C98489
          8B66B2B088150338CC603A71CA148A021A05757C8C151DC65AA11DCC769502ED
          DB7D8D10CC1EB866FE939B7BEF79E7DE5FEEB9EF9E43E13F682B11E9F463738A
          6878787846414141DE93D6524F7290CBE5B4ABAB2B464646C66D5C2E1756AB95
          019DCDCDCD5DF5BF004AE56E3A3CFC15582C96719B9393130C0603743ADDE68C
          8C8C030E01EA15119FACD8D9BC8F0C6F90F67774747484442281D1687CEC0466
          B3190A8562908098D0F59116753E6745E66B5FD4EF9D14B0C5DFAB2E4EFA8208
          062D727A5F4798BFD0EEC0E17030343464F761C6CC09DCDCDCD0DFDF0F6F8100
          2D9D5AE42F6CC088B72F9497EAB79D3A8D3C5640D602AFAAF84D0BD69E6FEAC0
          34C98F880A7E0E430F1FDAE34DD3B4DD67AC6740CC495C783C5C68EB015DBE0E
          A2A5A1C8C96F49AB328C1C64056C9DEF7EFCFDE4A0D83DAD81D89CF939F82E56
          8C8E8E8E7F673667369E28676767FC39E484AFF214D811710B8A1D9AB49AE107
          EC804F9FA5AAD77FB4F89D7D5D8BB03A662D5A1A7F61FE9429018C9644BE8A9F
          7EA84456E0AF68EFE1CB13CB9A94AC808F67E1A4383528FAA0260C258755E8EA
          ECB4C77B2A31E10B0C0A42A2588C4DB3D468D54DDF99AEBAB29D159026C4CF92
          2D012B4BB451F8A6B8048E285596848DFC3AA86F70F3E4B59A6DAC806401EA12
          529F1715F786E3B04AE510402ADE08A94F03EAAF51CADC865E392B208500E264
          0B4547B411F8EE8863800F12C4D8F08C1A8D8D962F775DD67DC60A9079A23E36
          C57F79996EA9E327908A11EF7D0167CEFEB5BFA0C398CE0A48F240635CB2FFB2
          B2BE480238EA102021211E71EE6A5C6A361D52B60DA44C16A2E6980D73C255BA
          9751FEFD098700C94989584DD5A2E337AA5CA1D6AE6705A44DC315D1BAB96115
          0361A8383E35A0BBBB1B7ABDDEFE1B0B67CE46A17217228D35B875DB56BDFDE2
          FD77D901025C15C5CE7BA9727009CA2B4F3C96A2C734968BB2B3B3ED735217EC
          AFDDCFCF0FFCAB07D0755D7772CF75D3DBAC0089275AD7BC37E7C56A4B248E55
          54C26432FD0BC0BC6C0F0F0F90340D5270C6ED59599908F8A30C9A6ECBA9FCB6
          811876000F6D6FC4CE0EA9B52DC3D16395F69CCF06100A85484F4F4751511134
          1A0D2AAA6AA0BBD38DC577ABA069379DDBDD695AC90AC8F175BF393F4218DCEC
          B506878A8BA7BC83C2C242C8643294969622365E8AAFF7E6616E47290C3D56B5
          FCDABDE5AC80C29019B7A72FE2FBDEE48562E69B1FE28141C744FD912335BE82
          E7CAC3BDBB5A087D7CC845F723302414FA33DFC2B7EF22864D9CF6E4D3BF07B3
          02A40102FAADA87918D4DF87CD6C84D562066DA341917C374ACA80CD46D23397
          2CA2297088CD85EB62B77198DEC5039E4201CE75985072F90EC50A2062CA5D18
          69E647DF6896E87026D827E66E8A47E6A4723731D19E0CF0D4F50F9D3FA32899
          7ECA020000000049454E44AE426082}
        Name = 'PngImage6'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003174944415478DA6364A03160A49B0501F9A7CF3032321A333232EC04
          7277FDFFCFD00B57C4C8500CA4DC8062EE403520A19D400A430D481EA2EEFFD9
          F5134C4C502CF0CE3CF29F83931364100350016E173112F6F4CF1F3F7AB74CB3
          6644B1C03FEFE40E1616965DD4B0E0CF9F3FEE1B2799BBA358105478A688A830
          25C2021058DB67DC87628149F0BAFF727272C5945A00F2FDE3C78F7B4FAF0944
          0D227DBF15FF959555A862C1DDBB777A2F6E8A40B540D363E17F4D4D6DAA5870
          E3C6B5DE6BDBE3502DA0791C9886ACDF212B2BBB8B1A3E00C6813B300E505391
          84F9C4FF5656D65409A2E3C78FF53E3F91871A4462A613FFDBDADA10B4801000
          E5A023878FF4BE3A9D8F6A8149F0FA1DF2F272048308DDB5E8BE028970AE6D6D
          59FA701D178A054185678B888C3FB8C17EB33CAADF4968DD3CEADFBF86012406
          34C06B8E6F33F3DF5F3F587E7DDB12F3FB5B3CDC4829CBB9FF2D2D0D080611CC
          702FA0E149990942E74F9FFF7EFECCC5EFDBD376B43A2C8B4DE6FCF25A02247E
          F9E8D1B7178F1F9F0FB740C666F17F73332DA2E3C06C636188A30CAB01B0E001
          153E0CC71EBCBB2F2BC02900C482DF3805383F3EB875ECE383DBC7E016C8DBAF
          FC6F624C38272303E799EED5863AEA9C06DAEA9CF3576E7A0763F7AC3EC0C0FF
          F3FD82BC5FEF13E11604179D252AA3218515983201060B3B28581CCC85CEDF7F
          F2FDFCC3A7DF57FBCE7F7D7C85AF064A24DBC71FDB2922CCBE93D8388047F4AA
          A8621996BF820C3CBC0C0CBF7E01F14F862AB3DEC318194DD7E7C07F5535DE62
          4654078201287581B908026C81E96CCF6A43613E4E03213ECEF9B79FBC83B0F9
          39273DF8C6C0F9E3CDEABA1F6FC340E6698134A8584D59C3276EAA2920C0B44B
          509069E7FDFB7FE0D5A1A2224BF1FBF7FFDC3F7CF8E706E2ABDD59FA5DEDDEB2
          EFC9429C42277EB1319C04E20B018B76A9EECE51E2FEFA49259FE70BC3B98F1F
          3F9CFBF4E93DCC82AF40CC02C4CCC44641042BD7046F4E16CB0B7F991F5FFCCB
          FC64CF8F375E0EBCD2B3857FFF540860FB657CFBE7CFFBB78098EC5605D0826D
          3CBFBF69DC6460387E9881211A592E9581E1EE730686735B18184201803A61E1
          595B78D80000000049454E44AE426082}
        Name = 'PngImage9'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003064944415478DAB5955F48537114C7CF9D7FAA59A482424A28A4A181
          9314BD53679B6EBA52341383E825E8B91785F22514F6680F3D642F05464F0585
          8AFFA79B6E6E9A0BD45248491F94D007ADD4DCD65CDB7E9D7B77AF6E73FE6642
          07BE1CCED93DE773CFB9BF7BC7C07F36263471BEBEBE03DD857FE831BAD3D9F9
          E4D88073757543BFBABAB4624C505E411EC173391FAA59A783B7B3B37A0EB2DB
          DDDD762C80B4A646EFE8E9A96C9EC440E2EFE4133B0AB1683B633A78D1D20271
          B5B5C3181A9DBDBD6D1101A7ABAAF4BFFBFB79C0E2CACFFDFCE5B444E81BB4ED
          C7B7B42C7C17009C9DA9AEE621AE8181362A2046AB1D760F0D551C025C4CE427
          88C1095C3EFF9EECE3BAA0DA97ADAD9FD05DA502241ACD88776444F3D002F0F5
          5BF004DC7ABCDE83CAED6D8CDD3E7854B9CBA7640D0D069FC150410580526920
          26933A1C207045A215E616C0EBDB127F3395CA0866B3860E50288CC462290F05
          5C4A4D842849F809F601A5A5A360B5AAE900961D255353658FF11938DDFE2B88
          27A4220AF8F3BA839BE9B819F0935C3E06365B391D90973746A6A755DC047DFA
          C32B09B4A2023618909F6F829999323A2027C744E6E6944D66E1CEB92BC83127
          90C9CC303FAFA203B2B2CC6461E11A3701BFEFD01505543E2D0F4965678FC3E2
          A2920EC8C8B090A52545A41569942C3CAB080164665A6179B9940E484BB39295
          95120EE0711FBD22EEB74380F4F409585D55D001292913646DADB8C9747005ED
          1471C7D4E175C1FB3B5260525327617DBD840E484A9A241B1B451C60D0403F45
          76BB9DF7ACBCC80F484EFE009B9BC574407CFC14D9DA621B8D421C0DFC773A1A
          EFDAB5E74FB55F67E0C13081F64A06EEBDDB83B3D25868AFC2660909367CFBE4
          7480546A230E4761A3D9DF98338FB8A218D41FE03F7A5C73424850291317F711
          9C4E960E0098C6C2BC667CC83D479C22B58285E737C2001866065D7E24C0672C
          94712BE2EF5CFC93113CD7333616DF017558C01CBADC48802F58984D7BB8D888
          6F2EFA80FC02BA2B4701EEA3925035823F896DA2BA513F50AF4201775152D4A9
          133617CD8572A2DE70C15F0A2F4E28135E05C30000000049454E44AE426082}
        Name = 'PngImage8'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004034944415478DAB5945B4C1C6514C7FF333B97DD6517164A0B681AC1
          72B116BB1781B6D6363B8A51939AE8431B1393020F8DD1440DB15EDE80B78668
          A48D89466D581A6D7C30A1D87A7B82C4A811B02C94D6168ADD488B5C1698BDCF
          5E663E0FAB6D7A813624DBEFE5CB9CF9CEF99D73BEF3FF38DCE7C5ADE7F0D603
          7D0EDABCE0B892AC33C7FF7EE1EB7DFE7B02AAF67DE59A3CF3CA9A07B7EE3FB5
          12B4CD2C4B5E9BCD06D96C43C6E0B0ACAAC864B40018EB387FF279DF9A80EA17
          4E2E83E79589BE97FDB7052EA7ADBBA8D0EEDDB4A904BC60454C6348A474A432
          0CA22883E949C4A38BD0B430F972CAF92F9F55EF00380F7CC3244950C3B1B472
          A977BFFF7AD6B224F43EB4B9CC61B11521184A63219444463728B000136F8224
          71100513449388642282903AEB6760CAF88967D45B003B0FF6B11D7535F87568
          428DC4330AC7F3E5568BD45B53FD301269097FCFC79148EAB098455864337482
          E87A0A168B15BC89A3EEE90492108B2C4355E707C67B9E566E05347DCBF6EC76
          23168B6370E4B24A1EA8A9DEE2D03212A6AE45A1338642BB357B3846ED482663
          2A63FA8049905FB4580B60CF2F8249004C1C8FE0C20CE2F148CB39DF53BE9B00
          A7D9EE5D2E44123AF47412E1A80688F9F86B86821B40617E1ED9356AC11C7D67
          3AC8AD6BFC44A3FA584BBF83E7F9A3A2683E58BCF101889209A96412B3FF4C07
          468FEFADB801D8D17C86ED6A70C13F19C2E6D23C30F094790469BA4807659ED2
          623431739475B6BF774C9BEBD0CFC76439EF8D92D23208D4B2E9E969AA32E11E
          3BBED79F0534347F4777E0C4E85428CB14041E51AAC6663503868E60F0AA6A18
          06056F5C73949D877EE92F2E2EF59AAD5684D52584C3CB1DA39F3FD9FE3FE07B
          E6F16CC79F81308D34A8E72088005992B1B8700DC954BC75BCA7B1EB6E8272BE
          FA9B5712E57E7B6119D25A14E1D0C2A9D1CF9E78290BA86FFA81399DB5989A89
          507B38180460D94ACCD012299AF359D5608672AEDB7B57D5BA5F1BBCB261E383
          E52BDEC1F9AB03FE4F772A59405DD38F6C5BED36CC2E2556F44F2A058989519B
          0CAAC20C13D2D062F3AA014319FB62CF9A10F7EB43DD8EC2E2E61501CECF11E0
          9386FF009EA69F586565155D2A90D2577F9E96C26924B4A04AC52954FAAA10CF
          9BFE76BBCDDE269010971617BB463EF6B4DEA800EB58C33DCFAD9A85E7ADB176
          4741415B269346341A6D397BCCE55BD76B7AAFF578EB78FB8622475B588DD05B
          95AE387B747B20A780BAB72F74E75BADCDA168D4FFC747B5EE155B6E01872F8E
          9805D1A5A5932DC31F3EEACB29A0FEBD49070F2C93DA03839DD515D7ED390334
          BC7FB99944DA4D4A6D19EAACF2DD07C0542F6D8EC1235B949BED3901D4BF3BE1
          20815EE138CE3D78A432907340DD3B97DA29F8C05067F5C0EDFF7203387CB17C
          F8834702ABFDFB17E7CFC92860FC7E9B0000000049454E44AE426082}
        Name = 'PngImage10'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003D54944415478DAB595EB6FDB6414C61FBFB6E3DCEBACB4440D1B0942
          6AB7862A83A2211022631A6C8C4D944B27A08C767C45A8FC0168DD5FB00F206E
          029AB12BB7751A026D0C48E133B48525AD26AD6B5AA06A93E6D2DCDA3889CD71
          9A651A6BCBA6AE478AADBCB69FDF798ECF7BCC619D83FBBF1B5A5EF8C6C731B6
          AD722BC7CDD26170ECCB7DA93503BC9D670ED2E5771C7516B7A3BE116555433A
          9345269B83522C0D12ECF0E8A93D832B3DDFFAEA795FF8C4AE919B00CD1D5FC9
          F4707093ABDEE76A7282E34D984E28608C41E0794003F2F91C92C939140A791D
          D4133EB13B728378D7051F9D82E1E34F3BB8FF8A8B221F6CDBECF699AC0ECC26
          156416CA10041E85A24A9997C1F30C9241225D1EF94C12F95C3CA541ED081D7B
          AAE2C67BE0A28F674250D354F9CFA33BB81B002DCF7F4DE2F7FA6D8E46CC2616
          61B74A609C86647A014C30A25866C82E2828AA255A27478204AD54443AF50F54
          B5DC43051FD1C5ED0E979C4E4DE38FCF9EB80E20F1EE8DAEFA7E8FC78374AE4C
          5932C46231CC4413582CA9670541F09BCD75B2D17217CA6028A905FDA543BC06
          494EA7F4FF758E26592087896804239F3E7E1DE0ED1C9868DFDAE206D59CECE1
          CAF80412F3B900C7716F8F9EDE9B6AED3A2F93622F2F180E59ED4E8846333959
          244D82F0E46E315B71C48B065A6388EB804F1E5B02E8ADD8B0C136DCDCDC4C99
          0193539388C5E7DF0D9DDAFBD64DDD75E047BD6D8336FBDDB264B6A1A8152A82
          065E82DE018AA64022607C7612C31F3F5A03F4DDE76E3AD4E874219B49237CF9
          EAE0D817FBB6AFD4820F74FFEC63D55A97190F4555A8C30432A8EA5582453453
          89A630F4D12355C08B67065A5BEE7FCE6C95313E7E05A94C6E3B9565C51ED7A3
          EDE02FBDA2C17CC444E52AA8457A2F4BE27AC92CA20999F85F18FA70DB35C040
          F0219FD75FD2388C8E5D8E5C3AB9C7B3AAF81BBF561C58EA9C3227880450AA1B
          9DAB9C2D8209E9B9BFF1FB070F2F0136BF7436D8D6E6F5E772795C8D4C05464F
          3FDBB3AA384FE276A7CC4409251497C4195701E88A466640324A80F7DBAB80CE
          7347EED9B8A957518A88CD45F511D0B772E67CD0626B947912AF89B26AF640AD
          4CA9F80C7E7BEFC12A60FFB9EE0D8E867E8D89984F450F874F3EB32CA0FDCD21
          0DB71135C096FDDFBA25A369C260AA47363D4380DD7DB723B45AD436DA9697BF
          1BB6D81A7CF95C224053B0672DA2CB035EF9BE5B92ACFD4A313F123EBE6BEB1D
          07E8E1EDBA30C131DE4DA3C241D3F1963F2AB70CA079D34D4BFDB4F57B42C776
          06EE38A0E2E2B51F82D467A9D0E73B3BD60970D14D8061FA79424777ACB94CCB
          7E93BDAFFFE4A7CDE2BF1478B26F5D007AD0C4741320B256C0BF6DC07728B668
          F28B0000000049454E44AE426082}
        Name = 'PngImage7'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004424944415478DA9D965B4F635514C7D739ED142850186241A0826104
          472742545012C22D04E203F340F079DEB88440022121E133F00D7C9887799818
          4332287144900CCC28234314C1008511A660DB29A5DC4AEF657AFCAF3D07A4C7
          D3685CC93F3DDD67EDF5DB7BEDB5762B91BEDD836E415EE800BAA3E7244912FB
          E54356684D51947FF8492900537575750D6EB7DB0573C662B1663DA7B4B4B4B9
          A2A2A262C8B6B0B0300FC067FF15F0EBC8C8C8874B4B4B0AF4221008DCD073CA
          CECEDEAEA9A929ABAEAEA6B1B1B165003EFA57406666E662464646795555D5F5
          FDFD7DF2783CC718FEC5E7F3B55EF5B35AAD33F8F8B8A0A0E03A44ABABABC7C1
          60F0792814FA34250039FDA1A2A2A21C2AB1582C747616A0402088C9BF6DC8B2
          BCE9F57A3BD82F3F3F7F02ABADA8ADAD7D2F3D3D9D584EA78B1C8E177B0E8763
          0BEF5A53EDE0F79696968AE6E666D3D1D11125122474FFFE3DFF95455C3A0F0E
          0E5AA2D10845A3510A8763B4B8F873ECD9B345067C900AB0D6D4D454DED0D070
          6D67679BE2718214ACCC4EA5A5A55452522200BBBBBBB4B7B747EDEDED747A7A
          4A7EBF9F4E4E02B4B1B116B7DBD79F03702B1560BDB1B1910146060483110A85
          22E4F37928373797727272841307655556565E4E3C3E3E23043FDFDCDC60C0FB
          A90076047FA7BEBEDEC080939353E844A4402F457979795C4990057E02F06A6B
          CBFE070037F500E358E56DD4B4A9B0B0102B3ABE7C61B3D9880F9D83318053C2
          428FD0EB434E138BE173C3BC18763709C8E75AC08FADADAD7566B399CCE60CF2
          7A0FC4CAA3D118F141A2A984D8781CCDC7A54AAFFDCDA8B8338A44F8B023F4F4
          E94F0B00D46901DBA3A3A365F1784C4C76B9DC6292DF7F46EBEB6BAFF452D4D6
          D666C8CACA2256381CC6884C8A22D1DDBB5FEC007023098089BBC3C3C325C160
          80586EB7870C8674321A33E8F1E32986259D17D2A5F4F6F622704804C7B582E0
          46C840D3D3DFEC0150AA05FC39343464BB0AE0E00C6100BA3409808E57016101
          61009151406666269D00BCA50538D138C57A3B989FFF8E03250190F7943B989D
          FDD605804D0B78393030F0A61EE0C993EF7180912400AA47E9E9E9D105CCCD4D
          790028D402F6FBFBFBF3D9391209D3E1E111C9B20910134D4D7DCD079F044045
          29DDDDDD6A4545D18C8718350020D3C387135E000AB48083BEBEBE372EAA882F
          3A593662DC480F1E7C852B239E0430994C0280713A3F3F1715775145E3E35FFA
          00B06A01A7B8262C5C86B22C89C6B9B09595150E9204301A8D0A3A1EBEB21037
          191B02D3F2F2B21F9F39DA3E88747676A625707DB2B8532549167AF46896C792
          00068341E9E8E810011525A12E48C233B13FDF2DE95A40025B9678CB5753C4E2
          1429BCF72B86552B5D5D5DD8595CA4E9EF14C9343131AE882F2AA01EBAADEA26
          E918D2E600601A8F33174D0CF18FCADBA46F766892C5804FA077D5E0C52A547B
          CBF23F8B6D55FCAE0CE2ABC0AAF15354B954C8263B57A9DB615D5303C8F4FF2C
          A102E2EA73E22FFF1392D9C5A200E80000000049454E44AE426082}
        Name = 'PngImage5'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000FA4944415478DA636440058B80580C8845819811499C118966C4C107
          E157501C86AE916680EE169C43F33E7230C0D84C487CAD41E703FA5BC06D30F7
          3F10203430E2D6C2CCCCF2FFEFDF3F8C5F2F24C3151165415D6108D14E6AEA5B
          C380DB029989FF199EE43352D5022EFD3970FF7F7BFB1EC27852CA886C01B141
          0494FB0854CB4FD802344B2801047D40B105283C1C710063C3820A3D9840E2DF
          2EA63012B6001B509EF7A1B32E981F9F8EF2C6B51F19EE2609906501B3C6AAFF
          6D95EE787554B5ED64F87B238C3C1FD03E88280474B7E02192181301360C3343
          C5D8A06C187F9806D17E20168162E460400E2256207E07C54683CE07540700FE
          F36619772AF0F10000000049454E44AE426082}
        Name = 'PngImage36'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000000F74944415478DA636440058B80580C8845819811499C118966C4C107
          E157501C86AE916680EE169C43F33E7230C0D84C487CAD41E703FA5BC06D30F7
          3F10203430E2D6C2CCCCF2FFEFDF3F8C5F2F24C3151165415D6108D14E6AEA5B
          C380DD029989FF199EE433D2C602996E701870090BC2157EBB98C2486A1001E5
          3E02D5F2A35A00351C97059402823EA08E05604B70C7018C0D0B2AF4600289E3
          721061572ACFFBD05917CC8F4F4779E3DA8F0C779304C8B2805963D5FFB64A77
          BC3AAADA7632FCBD11469E0F681F441402BA5BF010498C89001B8699A1626C50
          368C3F4C83683F108B403172302007112B10BF8362A341E703AA03005C226019
          699DF8B00000000049454E44AE426082}
        Name = 'PngImage37'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003634944415478DAAD946B48544114C7FF77755BCDC5475966F4A06E49
          99456B654B0FA2888A5E5F3245088A92820A0BB3CC5624CBCDCA55CA482212FA
          12998A1F92A2304833D48CDA30DB28BAF6422CB372D7679A7B3BF7EE68ADBBEB
          5EA181C3BCFE737E7366CE0C072F45C04A0E08E77814DBBD69DD156EC4D9A7C2
          6EDCB21562522090C2730A7D8E02B0BD5CC44F2B101204C4476622963FF9FF00
          090FE3D1D55E84DEDEFDE8B41560714C13F275BC8B2E5CC8C5F8F7C9689F010C
          200F2DFC1165005DAD8840A102553BD661F54D111A35702FD68DFED5C5ECE75C
          92D44A8B16F3817987BC03F608B1786C29C189C848ECE45F63439988D63660CD
          F25530CD7BE42CAECF313686A4482D43D44F131073D43B40FD6C00016F2D684F
          982FF75717E5C2F22E1961813568485A3E1C603007CA00A3CEA60020EDBEB4B6
          04419F81B1DA3EA8648D1A964F746CA18039951B0E487E1A2003F29674290044
          5F6D46D347357EFDCE80CA370C41DA7E8CE1EC68EE3E03B18DC3AE2387718DBF
          F82FE0408D56065C5ED6E9053031331EBF7A8A30775630EA12ADCEE4B47272B6
          1989575D00BBEE3B22B8BEDE6B04261161EDCDF89A35C5253255BD09F6424AC1
          09D4C9E2FE05C4153BEEA0384EC91D8CBAD4E76C2A7064D19DFD0AB24800EAA8
          5AFA7784BE097492C95FD1137A697AE71575392BB3436540755A1B01F4FF1FB0
          20CB0168485700908B41180723FF83492608105BA516AFCB9F0373D29BE18070
          A303D062500A708E48949DD373A3AAD255517E0CA722CEC9CD8CB7A9C096F38A
          01E4FC0355D3C9F96969B9D3A4EFB34668B80EE0851529FAF568D500379E7F83
          6DEA037A970B8045512302C8792955DBC83E1160BA8BE0ACA045656507621653
          E66A81DF34D644564156CACF4414DE8F04384E806CBAD696D9C0648F21AEADBA
          8488D08358E8277DD5C04B4A862FDA7C94F1433FAABB2C5A415535EBF2BC635F
          9E8BFFDE2B389DBA4F6EA79F29446F61A2C73BB84B39190CFCA07DF85CA0C0A9
          DFE6C1ADB44E1CEA6DADA203D2A8705BAF7227F42523BFF8CE2E759A07A7668A
          66231C8F42723E962C84AC9BCCCAC6B4524CAC2FE9FA24801F736AA70F68AF0D
          88EA077A682BFE34E94BABECB4CAFF2BE523696E90F53393D68531876A385E62
          1F03921C3649C7B128E8A387862DB4B15ACD763EC06C0C73D6C3E63936E6C376
          3F786C832049833F4A802928095BC1670000000049454E44AE426082}
        Name = 'PngImage38'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000002C54944415478DAED936D48536114C79F678B49AC58AC17B5174534B2
          16224226062D8D628C95215658B1F28350AD37210CA4189860A810814848515F
          9248142BCA087199614599A491AC40C52DA23473DB7DD9DDDDDDED7FF34E0641
          412AF5C10BE79EFB9CE77FCEEFDE739E4BC91C5F741EF0DF02322C16CB83FCFC
          7CBDD3E9ECE679BE083171B60054A7D355D5D5D555A4A7A793EAEA6AC1E572ED
          44FCE96C0156984CA6270E8763FDC8C8881C0E87697D7D7D6328143A8E3D69C6
          004AE9519BCDD6909999499B9B9BBD858585AB9B9A9A3E01A67CC5FB9902161B
          0C864756AB35976118D2DEDE5E63B7DBCBDD6E37E9E9E9A99165F9DC4C013BD2
          D2D2EEA6A6A62E1C1C1C9C1C1D1DDD9A9393D38F9990DEDEDE219665CDD078FF
          1AA0D1681A5352524AB55A2D191E1E6E1145B1D868340EC4C7C7AF1B1F1F97C6
          C6C64E4076353667D301CF6EAA914ECB846651221B64997C0E8BC15B7D772AAE
          13D2EA8E0524A1F073BD5EBF128523389A7B116BC54C2E205619894408C771DD
          8829B3084693B20F0E9511AACD9265FA92E048F0AC2F2FC433FB78CED7E07966
          73C4024EA2D815F4598909B0C7303F2C1196A77EADF22F58609DBF6B4B62765B
          4728F87DFBB7FE121A052C82BD00C0F4A79EE2056EC31547D76B6DAF33E2B40B
          8E85F88055E0026B82AC8F0A6C8004393F097ACF4E030A50BC2DA6C8AFC352A5
          D8E3E072616F95F5865DAF5C02E3DF267093B53CEBFF20F1931E96E54B44C6BF
          9F3097A6013750E0885AE00DDC99E8DCC9D4CFA5533549AAA612CEA93C276F79
          28A3DF2D5FFB8A8BA6DF26AECC4B84C02A42AEFD0424C0FA909CA02697C3D59A
          CD66835A5CD3D5D5A5CCE22234E755CD3BB8CD306EA9E9E6005AB29C48EC1E56
          F822C913C22112F69FC2D6D419C1BD14898D6A6240392528FE5159AA435EA280
          00D908DF01AD4ED516C0DD4B5E5665F748E2E5081730124191FB2620BF8F87C3
          51C09C5EF3807F0FF801F7C63A28E3E4F6170000000049454E44AE426082}
        Name = 'PngImage41'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003894944415478DAB5946F4C535718C69FB24BB525A5480345713AC404
          2C0C9C8E8C0F40524889CE900C9AA228B1FD20D32C402481652A916C5F600612
          10A2631F0C1D25C6026D1826561283C444D1C42C0B8699080674BACE80D8166E
          A1FFEEDEBB5846A7FD83C693BCB939E79EFBFE9EFB9CF7BC028EE310E9100804
          6F7FB11519906138BB01298A3D80900574692DF009ED10F801413F0E373EC117
          90C3B8E504B67DBE1788F750F21D2D588E7E85CA532DEF09D8851C4831CC1C85
          FCD34C205B0C1C4B6F86839BC79153AD787929AA7D15303A3A1AD5D5D5755022
          91683D1E8FD2E5720943E57EEAB4627CE916708054A701F9F1C0B7BB9B61F3FD
          8543DF9DF7D97FC18F70E0F42A40AD5657242525B51617173FC8CDCD9D8D8D8D
          F5044B7EE9A621A9BAFDEB3C142081FC478E1C68CB3B8745EE29CA4F7762D1B2
          C984A905F5BFCEF8013A9DCE525A5A2A20C0B448248AA125198584229ADF4711
          C5EFF3C22B648A988D50221DA4FAE344E0E7A256B8F198925FF02D9B714653A0
          69EEEFEF1704002A2B2B57DADADAF472B99CB74611B492F2051DE9F97186875B
          5E213A16B8BCBF151CA670F8EC4F5EF7353458EF5A77555757570D0C0C0402CA
          CBCB39BD5E7F91D4EFA4691CC502C5DF6EB7DB494F8ECE8573BA9C8CAC4AB663
          EA4C77E1C5C59B1025C663BBC883AAEFBB9731863AF67736CB6EB733E100D9AF
          6D99703A9D2B6BD58B4BC4BD9B1336DD9EE9B88515C946E8CCC761BA7AC38E09
          9C64EFB139FC1E1E50535353F586456B009FD1F42352FE1BA9F60600D4E2CD98
          C65719AA3DB0799F3CF97362CE84450CB277D8C3FE3D9100F6F2EBA4FE3E6F4D
          00A0425C00171E6109DDB357662B12A4094BFF3FA3482C4AE52B86008FD67FF3
          FEFB03A3D1F87640A88F23E95B3CA0B6B6F64D80BF4C435DB04801F5F5F55A83
          C1B02100B0F6A2BD8B35FE313232926A369BB99E9E9E7D0180F5B48A60CAC7C7
          C7B71320D36AB5D60F0E0E5E0E00046B7642A1D059575737AC5028E6F9F9E4E4
          A4ACB3B3F300CBB2316B01B4CFC530CCA8C3E1D053155D512A95BE0040B076AD
          D56A7B552AD5D6B2B2B23FF8796363A36A6666E60793C9D41BEA8F56F3860294
          94943064D52C95DD9DACACAC1743434369168B2585A03B0B0B0B7DEF0D20D5DF
          242727373435355D27C59963636329B45CD4D7D7F730DC99840568349A2FC9D7
          5FA552E99CCD668B217F27C9F7526A01CF2339F4B000B2A1871EDB28A99140C3
          A4FA59248983023ED4F8E0807F00AF66EC4C118594EA0000000049454E44AE42
          6082}
        Name = 'PngImage0'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003D54944415478DAD5946D4C935714C7CFD33ED4146C61282B1574F232
          B50DC31833AD5BB64866D1B88CAC34414DD0F26DD694250CF41386CCC42C1AD0
          44BAC9FCD44E828EA4BC35918A1B483011A7C646A590D99202DA14B09B7DB72F
          4FAFE771DA08B6A444BFEC263737F7794EFEBF73FFE79E4B1142603983A228B8
          73E50A59393D0DEE9C1CD8AE5452AFFF9DFBA1AE47E698244E7FF049857140C3
          6A53CB058C0F0E926C8B05D2D328F07B3C00DB3E03F1CE9D94D36A25AED3C7C3
          7963262E9326088D0924C62FFA4CFBE380A1A1218E56ABDD27100854D168B42C
          1C0EF312017E2A2981DCB56B200DFCC0CCFC0DCF3C0CC097BB016EDF00A1F10C
          D06E8028C6FDBB49E6CBEFBF298803944AE581DCDCDCE6F2F2F28732996C4A28
          144613011E68B5EA35CFE62087E302CECC18C41EDBC0433E80F4592BD05E1447
          B9F16CB1DBE8E35FF8D16A3B1607D4D4D498140A0585001B9FCFCFC04FAB700A
          70A6B1D6E3E4B06BC0EF876B67CF7EBAC53C08AB5DF7817EEA02F21C20164671
          8C9ACB1431F51CB1ABD76CDE81DA937140757575A8A5A5452F1289586BA44BD5
          211289307F9D68926D309E03210259711201F0F181F47DBCCB7A39142DFAF3FA
          75016A07E280AAAA2AA2D7EBCF63F6C5B8CD626DC4398B62415C09D6850D2434
          4D5366BDEE70D6F99320F64C0137C4FEC41390FF4EE0E5AF607E4E2FE69E7A38
          26466D6722C0E657B63C080683A1C5D94F5CEE5067FD7A0672E62DC0C5ACA328
          FE0F4AAC643D44400C5707970323CE58EB9108F93E11600B6EB998F93DCC9A59
          0C706C2D568BFC0EE0A252180176A1081E977E0EAB1FDD87F54E2B5058A9084A
          BA7D302FF5910F1301B6B2C5C4ECEFB2962C068C1CDC7FB860A48FCAC6CCED1C
          1E4C280E914F34B56D377A7ABE93FCF60B53383F4B3B18A00C7E686E26E46822
          40117B5A043C4A54608C577794CB6DF9364B9679CFB753DF3434DCE2F1786CE1
          A1BBAD4D22F9A37F5D47285668989C9460ECC45B8065B57592A152A9D49D9D9D
          2F9F90B7AE69B2064B75783C1EBABEBE5ED5DEDEBE6201E0CD467B17C0C0C040
          51777737D1E9747B1600527D2A96CA7C7474F4230494389DCE0683C170690120
          D96387050CD6D5D519A552A98BDD5B2C9655ADADAD5F0702818C37011817C626
          1CF27ABD7A8D46F37B5959596C0120D940EB2ECAE5F2FCCACACA7176DFD8D828
          B7DBED2730C38BA99C6C49404545058D564DD5D6D6DE2C2D2D9DEBEDEDDD6832
          990AF09614BFCEF09D00589723797979479B9A9AAE767575950C0F0F17E0E7AF
          F0864CA45A9BA400EC8BBDE86B5F6666E653B7DB9D81FE5AD07705DE6F47AAE2
          4B02D07B1D2EEB50B4134146CCFAC9728453B2E87D8CFF3FE00504811FEFB3CA
          92670000000049454E44AE426082}
        Name = 'PngImage3'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004044944415478DABD956B4C9B5518C7FFEFDB0BD0E9074D64865D2A66
          09860F13129986051259C6A52D9702A50EE7948D811FF8A021D16F26FB2038D9
          60CE4BB271DDD81858DA2115B2B158A5281BED0CCA66B399CAE6DC70935237E8
          7AEF5BCF39B5842A3398B09DE49FF35ECE797EEF39FFE7392F8787DCB84702D0
          68345AD2BD48F4F82AC55D209AD0E9747D0C505656D6525F5FFF56626222C261
          01822020140A11D13EB8E43A44DE878940C481E3E87431E979F0BC9889E34498
          9B73A0B5B5F9905EAF7F9B014A4B4BDB9B9A9A76470205110C0611080416FB08
          4460A20080FF3BA88848C2028B4412A228448CC6C6773A0C06C31E06282E2EEE
          A8ABABAB8A7C5D447415D17EA55A3AAFB6B6B68D5CEF8D7AD0DAD0DC591D222F
          97369E6CC1CF53A3502A9531CF6980C8F6C43E5BDAB45A6D1BF1606FD483B627
          2B747BBCDE00DC6E2F5C2E0F93C3710F4D7937A052A96202FC1720FABCA2A2A2
          9D7850CDEE4A4A4A3ADE6FEEACF2F97C3193A45229EC97CCFF029CBE3C0FEB2D
          1F1AF29E7A2080EC4AE7C0C0C0EEFF0D304CDD45BBC5C9AE87AA9F5D19A0B0B0
          B09378F046B7D981E27429FE7446026CD8286700F29E99D7FF83136D1766F1F2
          3639BEFEEA579C79336559005579797997D168AC6200854271ACA1A56B178F50
          CC0AE617FCF8FD9A85017AADB771E4BB3BC855A4900F08C07A61FA1FB515013C
          9FB4062D9A4DD4D7E3C3C3C3AF33406E6EEEF1C643C75EEB197342B959440238
          E07107B0F6E98D98BB6545C2A6ADD837684741491AA67EBC07994C4CC4432031
          05215A78A4E4C41C2E5DBC8AB177B740AD56778F8C8CEC62809C9C9C131F1EEE
          7E55C4874931854926054033361004FEB8711E09C92F619FE10AB6A9B7C0669B
          87388E4CE305B8EE7BE0F1FAE123C5289079F1F152F87EBB8DB1F7B2A8AF274D
          26D34E06C8CECEEE39F069CF8E53DFDE45963C04A7738EEDA35C9E8C9969332D
          449C1C9DC691B3BF60AD2A1B96D900E413E797DFA2E42770B8FA051415159D32
          9BCD950C909999D97BF0B35E6DD04FD7CA2D1AE5F109B869373180DFEF876EEC
          3A8E0E5DC535551192BF1CC4B90FF29635592291D0CCEB1B1F1F7F8501323232
          3EDFFF51BFC670D185ED293CF3800E5CBFE1195CBF72962E17D114D67F338DA3
          C69FC831CCE1CC41D5B2009ADE0505053AABD55AC100E9E9E9FD073E192C4B88
          17B3F33B92CB1CEE7B42B05F3652C3B0B446F4263B2CB63BD85FB7F58180FCFC
          7CFDE4E4643903A4A6A61A3E6E3DA7FE62720179CF89C9713BCB06AF5B2FC794
          A50F959595F07ABD2B3E2AE2E2E268E29CB6D96CA56C545252D2D089FEEF158F
          AD112FFA45872FB8FC9818ED424D4D0D3BBA570A108944484B4B1B9E999951D2
          51DB6532D94E9EE7D761151BA9FC9B6EB7BB9B02B2881288E2B17AFF687A2478
          887C8FE6A7FF30DB5F506342B621569DC70000000049454E44AE426082}
        Name = 'PngImage46'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004074944415478DABD556D4C9357147EDEB75FC036B7910804C40A632B
          EB589564456501B5135CA808B416D9746C149098B045D3C519B748A2C9C842B2
          EDC77E2C80E864AB8302E5A37C48224BEA249B98807F484CCC88C942B608B80D
          6CE9F7CEBDB5041C262C416FDE27E7E6DE7BCE73EF7DCE3DAF8027DC84A74260
          32990E91D94E786E9DE2CE137EB5D96C6D9CC068347E65B1588EC7C5C521140A
          22180C2210081098F52FEB07683E44004180203077295911A228E51004096667
          67D0D4F4E5D79D9D9D273881C16038DFD0D0600E07F2C3EFF7C3E7F32DD93049
          90831100E2C3A012828C0796486484088914F5F5275BBABABA2A39415151514B
          6D6D6D45787761B05344EC5AB1DCAFA6A6A699FAD5110D9ADADADAAA568823AC
          D49F393D3AD6DFDF0FD5D6DD0850D0E54DA4759F5ACCCDA441754483E6F6F6F6
          CA48A0B510B0BEC3E1409F7B3F16177D70B916B1B0E0E69899F91B197F9C3B4F
          1A54718FE2E2E21662AB781CC1E92BF7A04D52A02463C37F085ED6EC82C7E359
          B119B95C8ECF2CE60BDDDDDDE63511E89B7FE3B6322B1606CD0BFF9FA0B0B0F0
          424747C70711811F2578FBDBDBD8F396123F5DBD8BAA1D1B71705B2C658B88BE
          BE3EBC4204ADCE191465CA717F6E8EAF4FDEAC64041769BE8247292828F88EEE
          ABFC84ED0E6E4D3F58FE06979A76472A5E8C956178E0366ADE8C4799368113B0
          138808AC58FBCFBC179F9F3976696060E07D1E253F3FFF92DD6E7F2FE78B1B78
          FD0D15E53F13141CA228505680440C12FCD06C7D1E83DD13A83B9006F79DEB9C
          C07A6D0E7A8D844E3003B7CB87F884CD683877AC757878B89C13E874BAEFE9BE
          0EE79CBD06457202658517A2448042264374941CCF3E130D0445F83D21A8D51B
          70D57E03758674B8A77EE1692A1143F40843B4011F58C6FAFC407D5DD50F2323
          234738416E6EAEB5B7B7F79D8F9A6FE2D6D4FD55AFE8EEF69DC8DA28C39F0E27
          6AF6BD84C3BB52D1D3D383F44C1D2EFFFC17729401CCCDCD72ED94CA149C3D5D
          7ED9E974BECBA3646767FF481971889585D544CE3B750553FB0F20C5D18BA37A
          154C395B78A63002D5361DFC5E569CC2B589C1ED09E2CCC9B2B6D1D1D1321E45
          ABD5B60F0E0E9ABC5EEFEA59647180F20B470B5F8371772A1F532814A06B45CA
          AB7BD1757301792A916BC0FC36256FC1A9E325B6B1B1B1521E253333B3636868
          C8F838824FBEB98E2C753C8CBAB4A53146408981B48C02D249CA2F34EC23E081
          3B808F6BF59DE3E3E3077914B55ADD458294B007B3D65211151505ABD50A4D56
          297AC6E7B12F5D4A65FA1E9F4BDAA4C487D57BED93939306EE919898D83F3131
          5110A9F76B21904AA5686C6CC4CE3D66CA32E9C345FCC3FC8217E5A5DA81E9E9
          693DF3C88B898939422F3309EBD8A854FFEE72B95A19410E219A9D1AEBF78F66
          4FDB4DF03C9D9FFE936CFF02DC4217B65C1739750000000049454E44AE426082}
        Name = 'PngImage45'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000037E4944415478DABD557B489351143FFB363545A5C00C144ACCA40CC1
          516609A9A9894D4C373737CD2C5F48656049417F48E53FFE21644409E5DB69B6
          CD4D873862998FFD61C5A019D620493212A18710D37CEDD5BD777E9FAF3912D4
          0B3FCEBDE73BE7FEEEB9E79CFBB1609B076B4708442291188928049F2DDA771A
          E19D42A19011828C8C8CEAB2B2B2527F7F7FB0DB6D60B3D9C06AB522606921F3
          2723EE3066A2C08EEC83BD2D50183A072C1676E7204901457108582C364C4DFD
          86DADA070F954AE50D42201008EAABAAAAF21D9B5AC062B180D96C6624D6DDD1
          FB426C5C3039DE40FF18544498D0866C0437B2319BED86409370A0B2F276834A
          A52A20046969690D2525257976BB1D68E02868895131E20751A70E211D8AFDCD
          28DC0AF9CE7CA3B1D2AFB8B8B80ECD8BE81CD4CAE5F242FCC111F6F2C03A3CE2
          AA3FC0C1507F40B706E35F7EC2E0CD08E630CE864422A9433928A273801705CE
          8C69DD89FB3AB0EDDF4708DC267E80FE5EEC2A82B507138BC5F5280785449B9E
          9EDED0D1D191B796E0CA333DBCFFFA87594F841F058B1520C8F889D171837643
          4DD1B175049999998D5D5D5DF92E09DA06C6E091DA08B3C971308A0ACF368F43
          4221B853E0ED0E10AA1B80EBE78F40766CB06B82D4D4D44614CE656777DAF67A
          141E778EC0182F054C534B4AD42DDCDE1E28E18743D699905557444B94D7A6EE
          EEEE3CB2E2F178CDA8A472E90A589B83F6DE51A8510E83E19C007023705FAAE0
          9A30022409A1EB724051149142A1B045A3D15C22DAA4A4A41614CE45BADC9C25
          59F6EA33D4280C647E55C40549D261A749C604788E7A4BAAD56A7389363E3EBE
          55AD565F7045809D7ADF8E9379E2C920E6DB46047C3EBFADAFAF2F8768636262
          9E97979767B96AB4FFC14A3FA954DAAED3E9B209417474F48B6699564C9F9A38
          AC38D946CDB4B672A8A535B6CFCB4A960D0D0D498826323252DE24D38AEE6A7D
          1D45E243818787C3A934721A9E7E5C7E64BDBD1D32FB80C925418E3041A1D7EB
          338986CBE576B42AFB326843C70367DD5404F8EE391C0E43902B4A541A0C0621
          B1080B0B53C9D43A3E9E0F1A4DF0EDD702310CDCC386E3416CC6E9EFCC0C2C2E
          2EAEAA79F27EA1CD3D3D3DC1CF6F2F639BCD8FEB341A8D0262191010D0A3E91F
          E63127039BA363371181D96C83B9790B43204E8BD64C4E4EA6608BB35E5E5E39
          28C440D8C2810A65627676568A094E237822EC82ADFB47E304CE212CECCC4F7F
          3BC73F9E0F16B6E7AC64720000000049454E44AE426082}
        Name = 'PngImage23'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003924944415478DAB5957F2CD4611CC73FF7C39DA33FB2D1CA2A49CAAF
          2C3F4A5726D764B34623914DA38C89EDB6A3594397ACCCB4B419758D554CE12A
          95DCDDB4F3235964768A2824515209FD55B99F7D9E9B6BDCF484AD67FBEC79BE
          3F9ECFEBFBFE3CEFE7F932E03F3786F98D2367CF2AB05BB78C1C4D77CE9D4B5B
          3220522C7E79532CF6D4EA74A037184087A1370B03BE67C05E2A95C2F3B1B11E
          02B99B9B2B5A1220223BBB0701DB057BF70283C984870D0DA0D3EB418BA1C720
          6313482E97C3A98404387CE64C2F4E6DAC3D7F5EF44F407866664F454ECE76B5
          5A0DC10201C81A1B8D491783D4CB644680F1C3B2B28C90FB7979222AE0D0E9D3
          BDB772733DD41A0D04050440434B8BB14C1E8181C6B298DA338502EAEAEB17CC
          BD525DFD6544A95C4B05846664BCAABE70C17D1F96488B10369B0D8AA62623C4
          5C09E935F88E46AB05168B05D9C5C57D8F0A0A3CA88083E9E97D77F2F3DDC824
          836951E7FAC520A67259AF5A05277372FA65972EB953012122517FEDC58BAEB3
          B8064B0530180CB0B2B68624B1F8B5E2F265372A2058287C5D5758E8F26B1900
          369687676505C73333DF3C2E2A72A502825253DFC88A8AB6050705C1B7C949B0
          B5B585FBE8161A848976E6F178702C2363405952E24205089293071A4A4AB612
          1711CF08D0494A74124D091B015C4B4B389A9636D82C916CA302F625260E2A25
          12E72E950A84A9A9D0D4DA6A4CEA84AE32D994D4DCD4C8B3DEE666E070B91029
          140E3D292DDD4A05F89F38F1B6A5ACCC69CFEEDD30353D4DCE0478D1D7B74081
          B912162AE0703810969232DC76FDFA162A801F1737DC76E3C6660D9E45F3131A
          E6BE7631080B155920202429E95D7B79B91315B02B36F65D7B4585A3DA6C1FD0
          001C7411DBC2020E24248C7456566EA6027C6362463A6FDFDE344B167989002E
          EE7602D81F17F7BEABAACA910AF08A8A1A55D5D46C0C0F0F878FE3E3F0796202
          068687A9100B54C04248406CEC58B754EA40057846448CBDBC776F0359839DBE
          BE705522012F6F6FAA12B2D1C899C58F8EFED0535BBB910A700E09F9342897AF
          23FE2693DD5D5DA1B7BF1FD6FBF9FDD5A6A3EDEDC044C88EB0B0892185C29E0A
          B0F7F7FF3AFEF4A91D9FCF878E8E0E888F8F876BA5A57FFE628B29211B8D94C8
          293070F2535BDB1A2AC0C6CB6B665AA55AAD9B53604A3C7F6C0EB1448B92BFDF
          5A1F9FEF33DDDD367F036461D8711D1C42993C9E1DACA0E97FFE9C9C1D1D7D80
          C3298C3C73403A8615067725C9E7B55F183F300AC9C56FF23DD637E533074A00
          00000049454E44AE426082}
        Name = 'PngImage43'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004644944415478DAB5950B4C935714C7FF8019E212834BCA90469CAB4E
          18E0DA14976078B8A0730C65193826C4C4A181B039CD184CB054C08E321494C5
          80330E260361E5D51984B22C60349210058A160A2B2F575E46C97459A28CF2DA
          B997D541B19D33D9494EBE73EF77EFF9DDEF3CBE6B87FF59EC2C273E484F6FA0
          C7EAFFE0E34AD5F1E39F3F3360775ADAEDE2B4B44DD33333989D9BC30CE9AC85
          CED1BA397A565656E2C6D0908E41AA158A84670284CBE53A02F8307B72729203
          76EFDCC99D96AAD5989D9DC50CE934A946A341D28103883876AC935E37A93333
          13FE15F0BE4CA62BC9C8E00093C9842B4D4DF8263F1F23C3C348572AE11714C4
          2153F48575F5F51CC00F969ACA213F666525D804BC9792D259A6507873C0D414
          32E472382E5F8E1A0AC73BF42529E9E9FCF453D3D3A8ADAB5BB4F7AC4A75EF4E
          63A3AB4DC0AE2347BA544AA517B3A708B08D4E9C9C9A8A4A950A03FDFDB8DCD8
          C84364220007D11A06737070803C3F5F7FF9E4496F9B80D0C4447D5576F6EBCC
          6EA018E79E3881D8F878E8743AA8CACA709AC215141C8C49726ACE074B3C93A4
          DCDCEEFA53A7BC6C02421212BAD539399ECCFEECD0215457552DCE5144043273
          72F098F2C300EBE35CCED3741C7BB7F20517FC61BA1F8D4BF8C12AE0EDC3877B
          EAF2F23CD8A97C3C3DF11539DBBE63072FCBE8C848F41A0C68D16A61A2249BE5
          C3BC30FE6C37B56262608299D1A89C872C016C3B78F017CD99331BA512093A29
          2CDE3E3E68696D456949093E89E307C5475439D979798BF6697FBD8177BFDD0E
          A1BB10A3BA51AAE979DF4B006FC5C71B7E2E2878CDDC68737F3796D936C7FBA5
          8417B145E40FF5C71A3E764D5A092FDFF9F0EBDBF4C0792B80A0D8D8DEC673E7
          36B0E4991D5A429838CB56C06DB51BC6EE8E1968B8512A95F279F11B62147D57
          047C6D05E0BF7F7FFFD5C24211FB025B00A15280CDBE9B313A3A0AA150C8E744
          221154152A9E8347CA474FCF81DFBE7D03CD172EBCCAECEA9A1A7CA950CCBF20
          C7AC82928F1EE5C375B96BE0E7E7F7649F4020406D6D2D773E2E1FB75E456FEE
          DD3BD85252B28ED9915435CC71393559745414F47A3DDA6FDDE2EB3CF2D723C0
          3F80DB4E4E4E30F41A30D6FD008369DD8B7C2E01F84645DDB9595EFE0AB3599D
          B3809C2D284013FD93BABABAA0EFE9E1CD2529F4416060E0A2BD46A391A9A1EF
          D33E0FAB004964A4515B51E1CEECABD7AEE18BA4245A6587975D5C7837F70D0E
          7240FC4FB1D0DE6BC7D3441FA7B7B30AD8141E3E74BBA6660DAF08B11862EA87
          A2A222C864327C5F5C8CA191917FEE8505C967FFA22D7BF60CEBD46A779B21DA
          101232D6ABD1F01BCDD9D919A1A1A128BD7811C1F4FFE9A00EAEA63B21804263
          5961F604108785DDED6B6870B30970F3F7BF3F7AFDBA80D931313128A6533349
          4E4E868A92CDA037DBDA9EDC6A6688C3B265106DDD3A3ED6DCEC6213B04A2279
          F840AB75B69C373B5C68CF2DB0EDECEDE12A95FEFEB0A3639535402A2B67C7B5
          6B77D93B3909F01C323B31313E69345E22F337D22C4B4022E90A52C7E771BE40
          FE247D4C7A9A0DFE024C9B423775B282480000000049454E44AE426082}
        Name = 'PngImage47'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003194944415478DA6364A03160441708ADAF3F08A424493063DFEAC6C6
          0CA22D08A9ABBBBDA0AE4EE5CFDFBF0CFFFEFF67F80BC4FFD0F07FA0BAFF407A
          D5AA550C271F3DBA03B2644D53533A511604D5D4DC015AA0FCF3E74FB0E17FFF
          FD03E33F40FC0FCA8659B46DDB368692E46486E0DADABB40AD7BD7B5B4A413B4
          20B0AAEACEA28606E55FBF7EC17D80CB922D5BB7822D003BACBA1A6CC9FAB6B6
          74BC16F85754DC5DDAD4A4F4EBF76F7030E0B364D3962D287AA7AD58F1F9FE9E
          3D7C782DF02D2BBBB7A2B555F137D0027078E3B1044483D4FDFEF38781999999
          A166CA94FB9BBBBA94F05AE05D5C7C7F754787024813CC70423E01C971F3F030
          6436343CD8DADBAB88D702CFC2C207EBBABBE5FF002D40369C90255CDCDC0C69
          75750FB7F7F72BE0B5C02D2FEFE1A6BE3E399005A0E448AC259C5C5C0C895555
          8F764D9A248FD70297ECEC475B274D92FD030D22622DE1E4E464882D2B7BBC67
          EA5439BC163866643CDE3975AACC5F684623D612760E0E8688A2A227FB67CC90
          C56B817D6AEA933D3366488334211B48C8123676768690BCBCA70767CF96C16B
          814D52D2B30373E648827C002B1288B1848D8D8DC12F2BEBF99179F3A4F05A60
          191FFFFCC8FCF912301F106B092BD002CFB4B417C7172E94C46B81594CCC8BE3
          8B1689C30D24D21216565606D7E4E497A7962C91C0B4A00EA8A709C236898C7C
          796AD9323150D283194C8C25200B9CE2E35F9D59BE5C1CD3824AA0FA6F407A22
          03A36158D8EB732B578A302E6387A8006A66606444B07180CF615F19EC6262DE
          9C5FB54A14D3827C0688938040EF49D0DB8B6BD70A334E6164E0D194006346A8
          05FFB158F0E5FA0B862FD75E307CCDFCCD60191EFEF6D2BA7522981624028DE7
          05D2931818553D3D3FDCDAB68D9FB10AE66AA498C2ED0186AFCDBF190CFCFC3E
          DEDEBE5D00D38228A0D66510B6948DCD97A7870F73C31420873FBE3861666161
          507670F8FAECC8111EBCA948D0D0F0E7BB73E7D8D0C5610622B3FF23B1199998
          18248C8D7FBD3F7F9E1D9705AD402CCA2E2FEFCBC4C929CA4006F8F7FDFBEB9F
          0F1F6E0032DF02710DBA05B540CC05C4EC64988D0C7E0031284DB68038006CBF
          E63789F82EB00000000049454E44AE426082}
        Name = 'PngImage21'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000010E4944415478DA6364A031601CB5806C0B1819195D80540E10AB0231
          0B10AB01F12DA83432FBEAFFFFFFAF02E95AA22D001AEE0A355C0B49981F88DF
          43D98240FC1188FF916BC146A82B39D0A4AAA0741B94AE061ABE8CA42002B91E
          A8290787058A50358FA0FC4AA0DAA5E4C4012E1FC02C780EE597022D5842B205
          D0382802626D20E683863F03D03046A8FC6BA8D222A0D862727C00B3A40488CD
          6962019245B140AA0F6A81E890B4200E484D825A200015FB0095CE038A2D1AB5
          80E6162400A9A9500BB8A1625FA1D2D940B105945A9004A4E6402D60828AFD83
          4AA700C5E651640110F40371019AFAFF507A021017926A810794E604622E2066
          C5A31F64D1172806819DE4F8802230F42D0000A29F8719BC516BF00000000049
          454E44AE426082}
        Name = 'PngImage44'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000047E4944415478DAA5957B48DB5714C7BF4974688C6F143651524CB162
          2BEBA69341E7D0C246199BD41712D3582CE264756EB68B4EAB627CD4399D3AB0
          DB0AB5F840C4AA6B3A86936A15FDB38B0A65A0E0685696A0A6BE35EFC7CEEFA7
          0989B53565070EF7DE5F7EF77CCE39F7FBBBE1D8ED76B81A87C3C1FFB117E265
          5657BB3D1892CB712A2FAF9BA66F7A18F3D14277779363917EE3C6F180984B97
          1E3EEEE949D4198D30D96CB05056761A0FDBF4F4349A06061E3390C5DEDE9B47
          020E3F18A9AF872837777CB6BB3B6173670746B319068B056602D80E41666666
          F095588C9312C99FBA9D9D3F340F1EB4A41415B9032E5654B83DF8B5B111D139
          39E3F37D7D094C054693E9A590E1A121E7FC6673B30ACBCB6F9FBC70E1508B32
          33D9892D3414D6E060289A9A20CCCE9EF86B60E05D83C1C0B6E75510C68269DF
          F92B5794AAC1C1F369E5E5E06D6C80BBB6E60E60D463F3F5C5704F0FA232321E
          2DDCBBF78E812A6054711C8401A45CBE3CFB6C783835432A0557AF77AAE9484D
          46A4A54DFE7DFFFE592301ACCC011F036100C912C99C5AA148C9CACA72932B0B
          88898989A00A3EA1E95BCC7A777757909E9E7ECD4399EE8B6364A4552010EC1E
          2C3504F87D717151CD024422D199C4C4C42FDADADA0A4D94656D6D2D222323C1
          54F0327364C88C5E5E5E74BECBA8ACAC048FC7834C26FB45A954762E2D2D3D61
          0142A130452C169749A5D28F99A0757575888E8EC6061D9627E6E3E3038D4683
          AAAA2A16D0D5D53546157DA752A92659404444448E5C2EAF898F8F3FC5645456
          56069A43ABD53A8398A9F7DBDBDB78FE7C8D5AB847D591C22C66F6B790901084
          920A0B0B8B691E84F979E54247477BAD5AAD1E6001E1E1E1250A85A29164C967
          D6252525484A4A62CB3699CC14741D5B5B5BB05A6D4756E0EDED4D5578A1B8F8
          5B70B93CE8F53A9D5C2EAB585D5DEDE01CA8403E353555C594C958414101CE9D
          FB004F9FAAD96C6D363B5E658CC4B7B757D0D0700B77A42D28EC2FC7D5ABB975
          D4E26A16C0E7F39B272626BEA19E617373935E6CC0E9D389D422CFCE80B19595
          25AABC1C818141080808437EFEC5EF753A9D8C05900A5AE6E6E6AE31876A365B
          909727456CECFB54AAD163804A358BFEFE51E73A35F56CABC562B9EEF8D07EA0
          0ABED66AD728A8956EC949C4C525D0215AE1F860F755C97534E5D0082C2C2891
          962676AE333393DB682875BCD1313A3AFAA546B3053F3F3EEEDEEDF43873572B
          28A87405FCC8E8C501F849A118FB5CAFB7910ABCD0DE5E8326BAF4925B803351
          C07BE4C21060FE9F490C8FDF02D6D7E976CC060203D8CD63CD59A8A56BBFB4B4
          C915F0330D450C20963C973CC2259967F43D5407C880CFE2800F6348CA027A21
          18E81EEFC4EDB13BE06D4B487D41FBFDEFCDC71B1C8E9CA6512E31FE25EF6300
          27C87DC97D9C4DF5F1F9D4AED7D708AE537011F011418414FC4418FD8B3D7908
          F9603DB8BB12F8FB07B057C5C2ED1C78FBFAD6C260F8ED20B8955C4F6E7CE136
          158844D85D5A6AA08D15F0C0EC0759D1B7D0487B2B69AFDBEF6E009E9F1FB87C
          3ECC5A2D739386BDE6196BBDC3C25A6D3A1DAC7B7B47035CCCFFC05FC7760EDC
          CDFE0318B23ACD7138EACB0000000049454E44AE426082}
        Name = 'PngImage26'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004D34944415478DAB5956B6C544514C77FF7DE7DB4DBD6BEA0AD2D2094
          162AC8CBA51411520C6004BE088A8F0F4A0C281882909888C64848FC60AAC660
          051F552C888A31C19208116B798858280FE91369036D2D1128ED966EB7BBDDF7
          F52CBBAB4BD346F8C02467676667EEF9CD9CF9CF1985BB5C947F5B29291BE4F7
          DEDBF8E630BDBD95770EB058DED59DCE0DFD832684FA2E319FDF4F797939251B
          377E28DD43B85C3FDF194055DFD3038157EC832638DC6E6C4E270E8F87B2B232
          BEDAB20545D34A65A88A60F07F214A4CFB7D5DD7D7BB87983410A9D3D6D81691
          483171C1296864820E01A513B7DA205BFD9547473491CF0DA6111C0AF08100D6
          F9063977F97DA4AC1E984D92E35946F3D8BCC9FD59B3F29C49D9499814631F76
          D5E13DD366711CA84FBE4653DA416C23F6B02BB93114D5C180AD027839D67968
          C6EEF36E65D58EC67D39938CF3678EF2A565A6F769167D2C49A65112AA8B24E4
          9DC089803C81C0F1C6AC9EB33FE61FA551DB8EDB5BCDA1877DB1805201AC8905
          54FEE5535EAB3AAF5DF677D893D5D49449D606A560FC00E6DE69609B872F7819
          63D61902A9AD5C0BD8B07B5D7A6B4B4E6FFD9EA9559CE61D3CEEBA58C03601BC
          18EDD8248A2BBF6ED06A1CF5AA2BF92A066F9C52B8A08991E611E897E6E3EB9E
          4ACE9C6F71FBFA71A80E7AB52E7AF46EE9FBF48E53D6AEDE4FF277D2E12D8905
          7C2C8055D1CEDE06BBF2E4E79506E2B21472DA902FC95EF01B810B8B30D8E762
          526DE4AED84A775B3A170E4F227E460DF1936BB1BBFDF81BAD41EF67B35BA8B7
          AF8D057C2A8017A29D274A8F6B3F5C39A9A1A5C8614C11190720F56F91D44430
          2782BF0BB375179E865CB89A0CC5FBE1817A38950F26193F56DCC37737B60D0B
          485EB3DDD0B7B442A5DB08B52F09401C2932DD28A68A7904489DDCFD93705F13
          1488705A47C31FF3E4F214C8DC6C0F3B4F540E0B50166E36B2A459C173430E64
          0EF42D02CDFC9FB8037207E2AB617109E45C45A424417E5DC6F2C02B19273D3D
          C897DF9C1B1E50F49691891689FF050951365C5F222B37DF7A49BC5D72D764F5
          B90761E911289374668A8331B5D0BE4CA7FC6CDDF080A7DF36907745A56985AC
          543E3219C3218A164DCC2FBB705F81C2CDF090C4BF742D580FC0C2CBF067A297
          B50B8E0C0B98FBE65EEDF7F3DD1AF156716E0AC7C54038FED130E9020876C078
          C97FAA809A26C0F31590246335D879E3F12F8605EC38DAAEAE2EA9D6C898AE60
          90D56BAA5804A244DA7AE82CBCB21359718F03A6AF941DD8432920C8EEF1ED7C
          5FBC3E1650268095D14EB71765D6A62AADAD73A44AA2E435833835C9F438255C
          AB86F0C4A05FC224B7B253C430E57E89BFB42F49EADBF9D43E2E666C8A05EC12
          C033B16758516F57976FABD7708F7393961A4F92519E0D8574314B0848281906
          B1F5EBB8AED94439224FCD3EC02F8B4F5337738B48F95814F088D872B18C5B65
          42C84B3645077C4C2BB4AA39232D635250D31320212228A747542C126DEFE80B
          E25CE2A239E72CCD451FE1673FD75FF544010F8AC5736B768D167135C34CC1BA
          E7289C3F571D9B99322133D19C71CFCDD3E07A1FFE96CE7E4FB0A5BD97DA3DC7
          69FE69379C13CD869F91A11CC696D0B89CF04D5D4C8639B3C85D3683094563B1
          24A48763E4B4D152D34E6BC539A83E25FF84DE024748C4219DDD0E609C982562
          7191DA1C01874AE8D9F0107EBADD91BA99211E9CBB52FE01EDCFF0330DE533AF
          0000000049454E44AE426082}
        Name = 'PngImage2'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000030B4944415478DAAD955F4853511CC77FDBAEF3B630A6A82DB7202932
          F461E1EAA160083DF8500AF52211BDF4874D14415A0922880F3E298521484923
          88B050C89A520992E0A01ECCE1A02D8D9C8BB69B4DDBE6E6AE73EA6EBF73B4BA
          8EC2BBDC0FCE3DF7FEBE87DFE7FCCE39BF73659029AB796AC3A71DFA2F768ADD
          B28C01AA1FFA692F085D307CF537E4FF01C63B3690CB0D62D7795379D1F35E07
          07C96417D86F74EE0EA06FF39FBB79A6E8C3124064ED8F5BC3027CBCF7860367
          9B767780628B0D67BA2D03B876A108AC831C66D60573B7779941AAA9AF6CEE01
          091EB466600F524D51B3798A36FA773E453299AC17BB326C2E41104C52B5BFC6
          FA07E06D5353D3A99E9E1E77341A2D136B393939AEBABABAD28E8E8E7708389D
          3600833FC8CFCF3FABD7EB0F389DCE6FE89A5C5858A8265A4141C11076865FDA
          E2E2E24B845C4F1730D1DEDE7E22180CC2FA3A405FDFA380586F6C6C2C8C4496
          60652501DDDD77DF23E064BA80C9D6D6D6728F6716785E00AF771A8C4623D5EC
          763B54555581CFE78350280A8383030E0418D2054CB5B4B4E809C0EBFD02ABAB
          ABDBF4BCBC3CD06AB51460B33D7322E0B86400067FAC56ABAB0D06C3BE502844
          7D3A9D8E0624E6F7FBE9EC7373D5080883C7E38984C3E121845C960A70353737
          97C662CB188CA3CDED76C5C4632A2B2BF76A341ADC8315FC62C06ABDEF464099
          54C08CC562391A08CC03C7CD4376762E8C8FBF8EA3FF12D131505F6D6D2D1B0C
          FE409DC36F1646465E7C427F8954C0673C258753006B3CCF2B89AE52A91208C8
          1203464787671170442A60AEA1A1E1901860B78F24E3F1B882E82CCB6E98CD66
          B9183036F6CA8B8062A980AFF5F5F53AB207D1E83228142C1EC57E482412749C
          52A9144C26135D7FAC70BA0703034F7C08382815F0BDA2A2A250A1904338BC44
          7D58B15870EB741CC33002A909EC8114223187C31140C07E4900341E97604F2C
          16A31930CC6606C964928E93CBE55B19F03403416048B191E3A4920220254F6E
          CA6D8583594DE30C6F6DBD77E2FBB1941853D8C8AD3AB113A0842E2A40163605
          48B30D6CE48789B716CC4859A28CDB4F30DE87286A5931490000000049454E44
          AE426082}
        Name = 'PngImage30'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003054944415478DAAD955F4853511CC77FBBF73AD7429B43CDDC82A4C8
          D260E1EAA160083DF81053EA45227A09630E45188D0922880F3ED91F084148B2
          20C242214BFB274882837AB00DF7B0A19173D1B66CDA7675EE3AA7EEF63B47A5
          4D82EE983F383BE7FEBE87DFE7FCCE39BF3319646BF52F6CF86B80C16B75FF92
          655905373EB6814C66A1E3D19B9AFD0518EEDB80612C574C55A5AFFA9CC1342D
          997480FD765D76005D67E0B4F952E942FCAF2B3F07E0CC2180B7773F06C1D5A9
          C90E5066B5E14A2DD070B514FA87D333601807CCDFCB320362EA866D0831FEC9
          3E9FC1AEB1F5DBB7686B50FA2D92C9647DD85562738BA26892AA6502F8D4DADA
          7AA1B7B7D7138D462B53B5BCBC3C77535353457777F767045CCC1880C11F1516
          165ED6E974475C2ED74F74391617176B89565454348A9D7E575B5A5A7A87905B
          9902A6BABABACE85C361D8DC041818781A4AD52D164BF1CACA32ACAD25A0A7E7
          C117049CCF14E0E8E8E8A8F27AE7401044F0F966C0603050CD6EB783D16804BF
          DF0F9148148687879C08D0670A986E6F6FD71180CFF71DD6D7D7D374B55A0D1A
          8D860246465EBA1070563200833F53A954B57ABD3E3F1289509F56ABA5018905
          0201BAFA8202150278F07ABD2B3CCF8F22E4865480BBADADAD22165BC56041DA
          3C1E772C754E4D4DCDC19292123C8335FCE2A0BFFFA10701955201B356ABF564
          28B400C1E002E4E616C0E4E48738FAAF131D030D98CD664538FC1BF5207E2B60
          6CECF557F4974B057CC35B727C0F6043100439D1954A65020139A980F1F13773
          0838211530DFD2D2722C1560B78F25E3F1384B748542B1D5D8D8C8A4022626DE
          FB10502615F0A3B9B9594BCE201A5D059655E0551C84442241E7C9E572D16432
          D1FDC70AA7673034F4DC8F80A35201BFAAABAB8B5996019E5FA63EAC582CB84D
          3A8FE33891D404F6400A9198D3E90C21E0B024009A805B7020168BD10C386E3B
          83643249E7310CB39381403310458E141BB94E4A290052F2E4A54C2B1CCC6A06
          5768DB19DFC1F1A93D31A6B1915775EA7F8072BAA900F8C7072C48B32D6C1BD8
          F0D58259295BB4EFF607270E8128C9112F150000000049454E44AE426082}
        Name = 'PngImage31'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000001D34944415478DA6364A031601CB560D482C161C1EC3933FEAFDBB89E
          8185918961F3A6ED286652C5828020BFFF972E5D64F8FBEF1F436E6E2E434961
          19DC5C18C30F88F381D80888F981F839102F05E2B9407C139FE1BBF6EEF89F9A
          9ACA606B6BCB70F8F061065D1D1D862D48BE80310AA1869F04E23F40EC08C461
          403C0D88B3D1CCFC8FECF3CAAAF2FFCB562C63E8EEEC6298B77001C3F56BD718
          E6CE9EC3E0E2ECCE482888F600B13354CD7F2CF260BDA6E686FFFFFF636058B4
          6809C3860DEB1866CE9EC5101515CDD0DED28162811E106702B11710CBA2598C
          CC4671FD92A50BFF57D7D63084848432F476F5311E3E7AE87F4C6C3483B8A838
          C3A99367502CD80FC40E40DC0DC4B780F83110270271383E1F44C745FD3F72E4
          30033313130313133358F0F79FDF60BAB3B3932122348A9111C9656B813804C9
          8027402C8DE40814D79F3A7DF27F4464180327171783B58D0D5CE2D9B3E70CA0
          14E5ECE2C2306FD67CB8059781581494E280F82F10C700711E96208283B68EE6
          FF3367CD6208F40F6098D03F19AEE6FC85F3FF0383FD19D8D8D81856AF5C03D7
          1C07C4FD402C04E5BF03E2CD401C8FCB025B3BABFF8F9E3C66983A652A838F97
          1F8A9AC8E8B0FFC78E1F67282C281A2245C5A80523DC0200C0BC8F3BDA9CC3FB
          0000000049454E44AE426082}
        Name = 'PngImage33'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003E34944415478DA6364A0316024457172EBEB2C2626A65420D3004DEA
          C2BF7FFF66CFAD169D46960551358FDC585858DA5859188D551519FF4B8933BC
          559365E312E461637FF6EADF8FABF77E719FBFFE9BE1F79FFF67FFFCF953B5AC
          456E17D11604145D776365655D2125C122E868C9FE919B8B9155808B8D455290
          830D59DDEDA7DFBF6CD8FB99E7D98B3FEF7FFFFE1DB1A14F7317511678E75E3C
          2323C96E1CE029F0998599819999899141498C878B851955EB9FBFFF196E3FFF
          F265EDB6F73C8F9FFD3CBB75B2BE09410BEC128E64B1B3334FCD8897FBC8C7C3
          CC0A12E3E564659611E264C7A6FEC9BBEF3F5FBCF9F96BDA8287BC3F7EFECD3E
          B4C0661A5E0B4CC3779FB73613D1F77193FCF1FF3FC37F62E28B110876EC79CE
          79F0C4EB0BA757BA1AE2B540C76FE3FFAC24CD776ACA7C9C300B58816124CCCB
          CECACDCECCC2C6C284A2FEE7EF7F0CF75E7DF9F6E0E197DF13675FE5BFB2C99F
          11AF05AAEE6BFE4F6EB7FEC6C2CAC8F01FEA7E25711E2E76348361E0EFBFFF0C
          B79E7FFEC6CCC0C8925E7A98EDF6CE10FC1628B9ACFE3FABC7F6070333E37F10
          0089694AF371E1D373FDE9A76FEC4C4C6C09050759EEED09C56F81B2EBBAFF15
          797A9F5594F8D8FEFCFDF797580B9E3FF9C6D8D87F81F3EEEE204241B4F5BCA7
          93A44174903CC3A7EFBFBF81C4D4A5F8B89870E8028610C383D75FFF6CDEF68C
          65C3AE27176EEFF4C61FC95A3EFBB2383958A6F6D46A32B0B233FCFDFEEBEF4F
          501E6067C51E07BFFEFC6378F2EA074351D335866FDFFF645FDBE2843F995A59
          59B9FD102E9CA7A1A52D5D9129CDF019984C04B85819F8B9306D600206C69F3F
          FF19AAFB1F305CB9F5F5ECF9B5A6F8331AD070776001662F25AFE7CB2A99AAC3
          C923CC901523C4202CC8C2C0CDCEC2F0EF1F24DD82820B9874193E7DFEC7D03E
          E705C3A51BDFDFFFFDFB3BE2CC2A7DDC4505D0704FA0E14E3232B24E7171F146
          FD9317DCF9C016CD272C652CE668C1C9606BC4C9A0A904298A6EDDFFCD70EAF2
          4F86ED47BE327CFFF1EF2CD0F0AA634B5470177640C3BD8186BBC9C9C9DB2425
          A519B5B7375F3F7DFAD43E2185F0ADAA96ED8A8C8CD88BEBFFFFFFCDDE3F5702
          7F710D34DC1768B8A7828292794646AE516363F5F593274F1CF9F5EBD7466031
          BC95810CC08864B81FD0705F252515A3DCDC32A39A9AE2EBC78F1F3D05347C2D
          D0F0CDE4180EB700687800D0F000151575DDE2E25AA3B2B2ECEB478F1EBE0034
          7C25D0F08D687A8829F41851181616164B555535352A2B9B8D0A0BD3AE1F3E7C
          E0FACF9F3F97FCFDFB773DB92E47B1C0D8D878F5CA953B43727212AE1F3AB4EF
          EEF7EFDF97028B9E1538F490EE033939B946A06B4DDEBF7FCF02347C0FD0F06E
          4A5D8E6113AD00005923A828AC3181730000000049454E44AE426082}
        Name = 'PngImage32'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F80000031A4944415478DA6364A03160A49B056E6E6E8940CA1C8879A960EE67
          203EB96BD7AEF9700B5C5C5C66161717A789898931FCFDFB0788FF02F13F14F6
          BF7F100C02FFFF833023032323C8081620CDC4C0C4C4C2C0CCCCCEF0F6ED1B86
          D9B3FB66EDD9B3271D6E81A3A3E3D3ECEC6CA9FF409D308390D9C862D8C46118
          E418907C6B6BEB93F7EFDFCB2207D1D29D3B774611F27B47470743454505C130
          7277775F060CA268E4205AB67BF7EE48421ADBDADA18AAAAAA085AE0EAEABA1C
          184451700BECEDED571E3870208C90C68686063026041C1C1C561D3C78301C6E
          818D8DCDAAC3870F8782C20F1289101A1489303608D4D7D733343636C2F99048
          C604767676AB8F1C39120697B5B4B45C7DF4E8D1106C16303333E374292852B1
          01A083D71C3F7E3C146E81A9A9E95AA040102C95E0F2417575352885E0F4018C
          6F6565B5EEF4E9D3C170592323A375A74E9D0AC466011B1B1B4E1FFCFAF50BAB
          05E6E6E6EBCF9D3B178462C1C993270391D33B361F8052102825E1F201131313
          58CCC2C202D5023D3DBD0D67CE9CF147B62073BB0CC30CAFA728169495953174
          7575A15890B3539E618AFB43140B8041BEF1D2A54B01700BB4B4B4369D3F7FDE
          176641E57E63861FBFBF32F4BBDD40B1A0A8A888A1AFAF0FC5828AFD460C9FBE
          BF6598E6F5106E013044365FBB76CD0F6E819A9ADA960B172E78830CAF3E64C2
          F0E3D73786EF3FBF32FCF9F91F25084096A1071B1B2713C337A0DA9F3F7E322C
          8BFC0C96373434DC7AEBD62D1FAC1694EED761F8F1F31BC397CF5F197E7CFA87
          61011333B0906341B2800B14D9BF197EFFFCCBB02AE10B760B949494B65DB972
          C5131644999B14183EBDFFCAB034FE358A6B73727218A64C99821244F12BC419
          7EFFFECDB02CF61D3C88747575B7DFBB77CF0B6E81B4B4F48E2B57AEBAFF0325
          51682427AD1563981F02B480016141666626C38CE9D3912C6002AB9B17FC0A5C
          BB803225C8022D4DCD9D4F9F3EF5805BC0CDCDBDFFC183870E080B102E44B620
          3A2A9261D9B2E5080B402E86731016C8CAC81CF8FAF5AB234CCE1F8863401E61
          A01E7802C48B6116B803312710733050A79E061550DF81F827FD2A7D5A01004E
          36CABBB8B80DF70000000049454E44AE426082}
        Name = 'PngImage19'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000003434944415478DABD955D48536118C79FB30F67AC6EFA90684A21216C
          A0A0205311DD405D1F966969E8EC430A656CD0D21B51444514AF86179295175D
          98B3FCB6329B4A4D54642A2AB2BCF0C20CDC4DB886E9CE8EFBB2F79CB1D77DE8
          08521FF8F3BEE7793F7EEFF3BCCF3987806336E2C40059595925A811239D3982
          7DB7910CA3A3A36F30202323E35545454569444404B85C4E241792DBAFEF767B
          44DBDE1E2D020882DE82835A16B0581C60B37960366F427BBBE6F5F8F8781906
          48A5529352A9BCB487567A37F2EDFBFA0EF27B451F861E6F6C6CDCB0582C51BE
          29EAD4E97445A1E26E6E6E86CACACA7FCA914C26D3A214C97D53A41D1B1B2B0C
          B5A8A9A909AAAAAA82FCEA1121D85D14BCC8FE817D9999995D28454518909E9E
          FE5EAFD7178402D4D5D531F2B567C342D8759260775260A79CF0566E66FC1289
          A47B6262E23E06A4A6A6764F4E4EE6D3F9F35CA2A7A52FD1DBAFADAD85FAFA7A
          BC79C9C07908679F06CA4E828DA480DA7102701D3054EA84B4B4B49EA9A9A902
          0C484E4EEE999E9EBE170A505353030D0D0D18E0A92080079D1760DB628341D5
          0E3397F6A303F7CECCCCE463406262621F72E479ABE420407575355D1D18C062
          B198B1C7EF2E32803EC516F34CFB535252FAE7E6E6EE6240424242FFECEC6C6E
          2080C7E31D7A270E87E35080582C1E585858C8F303180C865CDF7A0F8C80AE20
          BA92BCC666B399B94F7A040CA0BBF4373397C3E1405252923F202E2E6E707E7E
          3E2710C0E7F30F8D80A2280C20491B743DDA07A0940F2D2F2FDFC1009148F461
          7171F156A808CACBCB41A3D10445F0B4379201681F9A310065E4E3CACACA6D0C
          888989F9B4B4B474331440AD56434B4B4B10A06CE03203E890FFC280F8F8F8E1
          D5D5D5ECFF023CFF7A15F8DCB3F087DC04D26605E72E016E708056BE150C888E
          8EFE6C341AAF8702A8542A686D6DF58B40397205486A07BDC50E70D909E82C36
          3311C4C6C68EACADADDDC0008140F0C568FC2E73D3251A08004F5FA150C0CBB6
          360CE070B9CCD7B3A4EF1C3AFD1E7414D297EC066E58188884429DC964BA8601
          A85ABEADAFFF94EC032008202F2A04ADB6CBAF920854F37813C21315BD262A32
          526FB55AA5DEB11CA4623A10383ADB40EAF0026448A790C2E168FED32E241BD2
          EEC9FDF48FCBFE02145D2ACA92A62EDF0000000049454E44AE426082}
        Name = 'PngImage20'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000018000000180806000000E0773D
          F8000004054944415478DAED555D685349149E9B36FD497F524B6963D44465A9
          490B6DC8CAA568ABA50F5D10CD43292A92151109A50F7559965216B1884B1F8A
          C85264913E886828A2A14856448B948AB694A0D206FB431525B1C6C49F9AA4ED
          B56DDAC4EF2473E3DDBAE093FBB4173EE69C33E7CC3767CE99B902FBCE9FF03F
          C137091289449A441084420C126CAB0A9B0A431190C94D51CC2F7DB550CAAF1C
          C8079EC3270C5B224D00C58AE111D0015B37F44C22C2B813B6DBC02C10E70BDC
          02DA311FE7B1B5182E0059C07BA018B8079CA4C533C8114EE4D00084817AD856
          78703D86EB00114581AD3CF857F85CC1BC05F243E014F017C5C1A687EC003A93
          19E0A32318039AC909E882FDA682A00FD82E1F0D6C94693FF42EC8FD6483DC44
          C72467C5FD1232C171E86D902D90CFF1C59A14E9DFE3C44420F27AD8E013C5FC
          73BEF3F3F2B12A6AB226130C417141BE00D904F90E500B7D16FA1EAEF77082ED
          00F99CC0BC17F3549BD3902FFD6B061877004F81215E20FA0EF38C8890EAE25C
          7744E72913E8B590E9686F43FE1D321579959A3F114FD635497016D807740325
          BCC8B46B0B826A780D88E00705411786FDD0AB2077406EA1AC94ED2B9408A5EC
          030B11818F3A00934E456B96C236CDBB8ACE7B940ACF8FC8001CA52EE131B46B
          373F3AAA530019882C91AC551D1174D2F9F28B418551719256C85E4ED4C17B5C
          C533BC099F47EB2ED931CA2AE923B0172C1764127BF61F3C157A7D9A64ACA2A2
          714DAD663F8E8F0F9C7138549DBDBD71574383C91C0834564E4FF72803274CA6
          B629BD7EA07970705AF67D5C5DDD98118B31CBE4E4C05704119DCEA6FDF4896E
          2C7B53547470A3CFE7F65457EBAB02815B398B8B96F9FCFC9E82B76F7FA1F9F9
          D2D23F0B1616DA96F2F2C6BC7AFD7E717C3CF0C668B46D0C8793F191DCDC83DA
          60D09D26086DDA642B93A43EB6BCAC49D266674B136565ED86B9B9230591C82E
          96919134FBB0308D464EC4D6D6D8BC563BE22F2EEEAB0C85BA95F1218DE648D9
          EBD76EE19D281E2A595CBCC4244933B16D1B7501ABF4FB5BE505E6366CF0CCE8
          74D76A7CBE3F940B8C1A8DA7CA83C1C3C51F3F8AF206260C8654FCCB97AD4CA3
          91DEE7E51D17C256EBB0361ADD35B57973AFABAEAE9DDAB26978F81C9C8E6177
          93AE9A1ABB5FA79BDCEBF5DAEBA7A62ED202436673CBFDAA2AA72118AC681E1D
          7522CB0A6CEE72FFEEDDBFD1456B7EF0A0DB3C3BEB8814168E0837EC76338A68
          FB5B142F2EE7E450CFABD4B158E64F1E8F63C6601898D9B285DA9476BED0F0E4
          093D866CD06A75B1D4B32D95BF7A652AF7FB1BEF8A626F4CADA677289EBDB4B4
          7AC0E3694113B8D345462764297A3DCE2F5516FBF2A361DC465F8EC2468BAE70
          9B1CBB82AE4A3DF709FEDBFCD96E577107A67054B17F7E71C5FC7ABB4A311FBF
          EA74A67E46DFFBA27D067F09E14B49F185BF0000000049454E44AE426082}
        Name = 'PngImage17'
        Background = clWindow
      end>
    Left = 390
    Top = 134
    Bitmap = {}
  end
  object ImageListIconsFogue16b: TPngImageList
    AllocBy = 50
    PngImages = <
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002004944415478DA63648082D0FAFA99404A92013FD8B7BAB17102B200
          238C115C5BBB79517DBDCFAFBF7F197E83F0BF7F0C7FFFFF67F80FC42070E1C2
          058645BB776F0119B2B6B9B91FC380C0AAAA2D8B1A1ABC7FFEFA0536E0C7EFDF
          0CBFFEFC61F803340864C8C58B1719A23C3D1982AAABB70295EF5DDFD6D68F62
          805F79F9D665CDCD5EBF801AFF0135A01BB26FDF3EB8B3272D5D7AF2F6F6ED16
          2806F894946C5FD5DEEE0133009B212097F0F2F232643735EDD8D2D3E3896280
          4761E18EF5DDDDEEBF910CC066080F0F0F437A7DFDCE1DFDFD1E2806B8E6E6EE
          DCDCDFEFF607A810D900744338B9B91992ABAA76ED9E3CD91DC500A7CCCCDD3B
          A64C71F90354FC0F68132E43D8383818624B4BF7EC9B3EDD15C500BBD4D4BD7B
          67CC70FA0BD38CC3106636368690BCBC7D8766CF764631C02A3171DFA1B9731D
          FF42030B9721CCACAC0CDE1919FB8FCD9FEF846280794CCC81638B16D9C314E2
          32840568806B52D2C1934B9638A018601C1171E8F4F2E5B6200DA0B487CB1066
          16160687B8B8C36757ACB04331403F24E4F085D5AB6D609A70190232C02A32F2
          C8C5356B6C510C50F3F43C7E73DB3670EAC2670813333383819FDF895BDBB75B
          C20C0805625E710B8B9C17C78F1BC20CFC0F3508990619C2C8C4C420676575FE
          E589135380429F4106C401B114A7A2A21B1327A7280311E0DFF7EFAFBFDFBFBF
          0BC87C06008175B0D3C5C707E40000000049454E44AE426082}
        Name = 'PngImage6'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001F04944415478DAAD93CB4B1B5114C6BF7B6726334463AC8AC6223E0A
          A58AA0A4C5D60A05B32944AA42162E145CB8B50BC1852E5C2BFE1B82B87221EA
          A65D488A206968855082BAB1D8569382CF30D13C666ECF643490668482BD7016
          7766CEEF7CDF3967181E78D87F012CCDE095A662896EEEBB17F91C7647E731F4
          4F80953988BE972A241783C405C081703803CEF1B32C43207393C1D8F8222205
          0055EFE00CF1D1501D9842C90A3DB520329038D2CBF20D43E053380B52C74A00
          2303F5E09424B94C8208E44D13CC02FDD5A5D4550E1F3FE8F054A03738834811
          100A3450320A2A76F774E4B2A456B0B24E0B621AA620970C2663510BD023737C
          1E7CDD004EF28F2FC97B75259E74F9484E1584E48789F6322BD797494437E7AF
          2D402F0176DEBDF0157CC7923AFADEB48069D449856A4B8A23E8FBD7351CC5B7
          368A8060772312E90C646F2D5A9BDCB61DCD0054675064750E5717C96009204E
          F2FD6DCD5024D8D3508523E8ECB781D8F6C17EE0BDDE5E04F89F5643F2F8D056
          A3959A750045B77FE0F4E47C88A6B06E35B8737916DF5A5A1F15AABBE47BB6FB
          16F4EB3485C3C3C4416032FDEC6E426FA7435808F67B9ECBB26A7FCCED95733A
          F99B2C86A75213B4625FE81AB3001D148D145AE763786509864BB1466C1394DB
          BBB712B90A37F2CB5B38B71692224DB1FFE0BFF10F675FAD1F01E2F698000000
          0049454E44AE426082}
        Name = 'PngImage7'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000021E4944415478DAA5D34D6813411407F0FFECBA49B64D4AE2B669B494
          D4D68F887A1143C1830A9E0A3DA805BD48C142C55E8A1821A7A220565472D236
          8728623DE8C583C68317835510BFB056D31AF163830DC6CA36A9C67C6F769C24
          36C9419B827318E6CDCCFB0D3CDE10FCE720A5C931E221A0436C29AE302F4D41
          BC3474C64538C7299B5ED44777F51FC5F1CD53D009DCB299F144063EB91B81AB
          97C0A9B106820D2EBB686E0977F70D60C4F9B6EED30B0C180F39F1E4A617B96C
          C65C068CCD61476F3F260EC6EA0251250177C08EE09D2BC827172C045DC31D3A
          D31AB97DCF214C9ED4D505A6DF4731EC97F02570A30A08269BBC7A471F4217AD
          758197B3111CBEA683F2F4160AE93F006FB4C90DDB7AF1D5BBAE2EF03C38877D
          632A52AF6F33205E06B846AB2C387A303D6A455BAB7959C03FF90E472678E467
          EE42CBD400A473EF0A5BA03CE887FB3580D8226B1DBB2B87AF2E74A24D122AF1
          E7F91C7EA5346CB51BE0747F4224A682931F54012236CB74EDCE2AE0694793C8
          57E281F1EF78144C95F67BCE46315F04228FA16597000303A4ED958487E75AD1
          64A876E4902F8667B3D9D2FEFEF30AE28B0510E505E81200BD24C3B4A59270EF
          B405C61AC0E34F622AACC277CC84039E9F481781C41B062C5A08BFDE2569AB1A
          15AADFC8AE165875548C0E4A10F57F291CFB7B27AE2781441A5C8EBD190D0BC5
          DFC8DAD97D99E3F9414AE90FAAE5BFFDABF21CAFDBC4668152758616F25E7CF4
          8CFD06B53DDC2EC8880A2A0000000049454E44AE426082}
        Name = 'PngImage8'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001B44944415478DAA593BD6BC24014C05F103F1A3F68284A51A45504D1
          41707110C4CDC1C5C1C5CD413A74EEEABFD0ADA58B08FA17B8BA298288208252
          51442EE8902255888A51F1A377914642110E7AF0727079BF1F97F75E18F8E762
          C8A35028BCE2ED19C70D2527E1F848A7D32F4CB158BC37180C42201000AFD74B
          450F060368B55AB0DFEF59269FCF3F582C16DEE7F381DFEFA712F47A3DE8743A
          B0DD6E6F6581C964E23D1E0F0483412A41BBDD867EBF0FEBF59A6372B9DC2316
          2097CB05A150884AD06C3661341AA9054EA713C2E13095A05EAF03CFF32049D2
          5960341A91C3E18048244225A8D56A301E8F61B3D99C052CCB22BBDD0ED16894
          4A50AD5661329990225E04369B8D0AFE5D82205C04780E90D56A555EC662B1AB
          20E9FF6C3683E974AA16701CA724C5E3711544AEDBED76E5F346A301F3F95C0E
          45A0D7EB91D96C56804422A1120C87437978C879A55201511461B95C5E043A9D
          0EE13A28403299FCF3BD0821B9CDE5721956AB159901D8ED761C99C43B8D46F3
          8D6F21279F4E2748A552576B502A9548FB080C8BC542CB64B359C6ED76BF61C9
          1386C5E3F1F8750DC639E46FD3E2BCCFC3E1F091C964DE7F0029CBD591B022FB
          120000000049454E44AE426082}
        Name = 'PngImage45'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002514944415478DA9593D16BD25114C7BF3FFDCD39A44C07137CDB0449
          5C73812954A60D8B094DA17FA197820A06896F99582F99C188E8217A08F61082
          2F1141E842992C9C3D14164392B9D814EBA56CEA649ABFCEBD355FFCEDA10317
          CE3DF79CCF3DE7DC73857038EC05704DA3D15C6EB55A57489F55ABD5373A9DCE
          A376BB9D104531AD502846F14F48FF426777C9FEBCDFEF4320C06B9BCDE6A320
          E4F3F9F70C303F3F2F160A0554AB55B8DD6E8C8F8F43AFD763646404D96C96DB
          0381001289048468342AF9FD7E6C6F6F838218C0EEF3F950A954502A95204912
          542A152C160B666666D0EBF5904AA5A0D56A512E97FF02161616B0BBBB8BCDCD
          4D9EA6D56AC5DADA1ABF89D2BC4A693F311A8D02CB26994C824A7840B65B0CCE
          4AD8703A9DC70D06030F664626F57A9D65F43912894C0783C187D4A345BBDD8E
          D5D555063D472EAA582CB6C2003789B634353505B3D9CC01C56211B55A8D395E
          27C063062488048588FDBE88A5585438682A57087286EACCCDCDCDF11AD3E934
          339FA0E04F078E9EFB5569CBB08FAD146D96278700A7E859D63D1E0F07643219
          50F0C089C9EC9D1DE9837B0C78F64B1EA0542AD75D2E1707E472B92180E5F68E
          B4E11081177B87031C0E0707B01990054CFF065EF60F071CBC336BA22C60926E
          5F116501E7A9076F4D2613BADD2E9F075980E127F04E230BF0D253A6743A1DCF
          A0D168C8038E7C033EEAE5018220A46858B8B1D96C0E012616BF4ADFF575A034
          310438496B2C140AC5E8439D668344BFF24D3C1EBF37883EE63D8A4B4F5F0DF6
          CB172E02E536697B0C709616E58551FC9F7469FDF8035B14274B4E82C82F0000
          000049454E44AE426082}
        Name = 'PngImage17'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002374944415478DA63640002D9B0B0342025C9801DEC7BBC6AD5611C72
          0C8C20422A28A8F1DA8A1575DF7FFF66F8F1E70FC3AFBF7F19FEFCFBC770E8D0
          2186E6254B9A804AF63E5BB7EE104E03C47D7D9B6EAE5C59FBE5D72F861F3F7F
          328069A061FBF6EF67284F4860900A0868062ADBF372F3E643580D10F2F068BE
          B76143CDCF1F3F187E03F907CE9E6578FAF62DC3B19327E10AB71C3D7A4A4A4E
          6E1BBA97C006F03A3BB73EDBBEBD0A64FB3FA0F357EDDBC710EBE3C3408C97C0
          0670D8DAB6BFDBBBB7E21750C36FA0C215BB7733C47A783010E325B001CC6666
          9D9F8F1E2DFB0D54F4FFFF7F8605DBB73324005D00F312CC90058B17C3BD34A1
          B3731AC3C78FD96003180C0CBA7F9D3D5B023200E4D4F99B373324070632C0BC
          846C08C825BC7C7C0C16E1E16D9FF7EEAD8618A0A9D9FBFBCA95A2BF40C57F81
          06CC58BF9E2133389801E625744338797919F47D7D3B7E1C3E5C09314049A9FF
          EFEDDB0520CDFF805E98BC6A154376783803CC4BE88630737030A8B8BA76FD3D
          75AA1C6280A4E4C4BF4F9EE481982043FA962D63288A8961807909DD10563636
          06712BAB1E860B174A21063032CEF8FBE74F3A2C80DAE7CF67284F4C64807909
          DD1066A00122C6C67D0CD7AF17830CB000E220201683073137B7F9DF4F9F3460
          5E4237849599994140476702C3BD7B852003348198139626C0404020E7EFDBB7
          09302FA11BC20834805F517112C3F3E7F9084D08A009F4523EB297FE01F17F20
          061900340198709819B858586602D993B01980E925ECE015106F040098888685
          74CE7D340000000049454E44AE426082}
        Name = 'PngImage0'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000029A4944415478DA63644003010101B11B366C58CC80039496967AFFFD
          FB77775F5FDF2F109F115D417272F26B203571EEDCB92DE872454545D26C6C6C
          577FFDFA950E3460255603A2A2A2BEE8EAEAB2020D10BE73E7CE1764B9A6A6A6
          533C3C3CA6F7EEDDEB9832654A2556033C3C3CCEFBFBFB1B5CB87061DBCC9933
          BD61E2B9B9B95E3A3A3A5BDFBF7FCF70FFFEFD7AA05C1356030C0D0D73A3A3A3
          27B1B3B3336CDCB8D17ACF9E3DC7424242D80C0C0C5E494949F15FB97285E1ED
          DBB76E0B172EDC8DD5001515151E5B5BDB579696969C376FDE7CD2DBDB2B0BB4
          7DA2898949DED7AF5F198E1C3972574242421D18067FB11A0002FAFAFA798181
          8113E5E4E440AE98ECE2E292252828C87CF6EC5986870F1F46AC5BB76E254C2D
          560340C0DCDC7C576868A8EBEFDFBFFF0B08083002698603070E6C066AF64356
          87D3007979794EA00BCE02D3852630DA186EDCB8B10EE885C8356BD6FC22CA00
          609CB3292828BC3E71E2042F303CFE01A36E477F7FBF0FBA3A9C068474452FB8
          FDED51BCF52BDDD07F6CDF153FAA7DECBA77F2A9FDC985270FE134C064AE07E7
          8FD7EF76FF61FBABF685FDABD0FFABFF6F3C9D7653071CBD134D7EFD61F9FBE3
          FFBFDF1FFEFFFE31F56AD19D4E0C03146BD5D6BFBAF8E6C6D74DEF2AB91AF8BE
          FF3AF3AFF4CF962F534072CA15F2C7FF30FE9A27FA537ADE3DBE076F943E2988
          9CE93BF317C5009142C15B6FB67D0A60B8F9F71A7B06F3BB9F87182C19AEFDBD
          0992534D92697CC3FE59F5FDF48F516299C2B7991999429F4F7B7D01C500B618
          86557FDF338831F030EC67F8C550FEF731032FC319067082D18E50127DC9FCEE
          162B0393F6DFFF0CA7FEB3FCD07BBDE8DB3B1403448B18D8DEDE64D8F4EF3783
          00C35B864686B30CDB91E52543243A7F307CCD62FAC7B2F8EDBAF759203100BA
          14252030C20A560000000049454E44AE426082}
        Name = 'PngImage2'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002A04944415478DA8D937B48145114C6BF197377B2A66D494353B12896
          C4050529B7A78F48B3DC42212153021312428908172A082A2BC2C036240932CB
          9442F1013D30CDCD349030D9C8CA1E608214B66439B3BAEFDDEEDD9C0B6BFDD1
          078773B873EEEF9E7BEE190EFFD089DC44FD97254979248C9A5FB2AD9E7DFBA0
          E6F1FBD185B99C12D465C0425C2A8D6766B0282EA772B1A1B432F86DA8C18CC9
          6EB343A381773EFDD5D167C80C015C4B87945D582A8E8D8D6165513D0441058D
          6629FE00ED703ADDF8DE520E9D4E87DEB646B9A21FCB4200B5DB20ED282816AD
          562B497642A552058DE779783C1EB8DD6EA8D56AE8F57A583A5BE463030B0057
          3653C001D16EB74396E5E0DA04AF858317D87D05410842BFF5B77B4E3FB1A942
          00970D04905F284A92C4368C921E1E3EDB08AFCF07B7DF0F97D78BE1911158EA
          4C98589795D7515DFD90012E6E8094B92F3F04F08600CAAB9BE022E5FB08C049
          AEF27C680845B9B9D86B325D2529BD0C702E95008C4671863C0195979C66F5AD
          4095B90383A42FB4FCF50909B8D7D5C50E3037373731C0991448197B7689D3D3
          D3989B9B83CBE5C207753CCE37F46082AC51454644B04A78D2D0435555750C70
          4A0F694B76BA383535053F49A27A171E874BB77AD04DCAA6D26AB541EF703890
          929484828A8A7A06302542326419D815A85E73D1A8B9FD14A393937F4DEB9AE8
          68649795DD6080E33A485B771A82CFA868D81B89DABB16B4F7F5B10AE88CC4C4
          C440171B8BED25253719A0722DE9414E9A48CB5334302BE2FAFD4104481C0804
          E0A74662EA398E43B2D17887018EC443CA31A68974E214BDF8C1C1E60C84FE3C
          64C7E7711B3E09516D7C58D83805241313F72FC7A383C59B441F191A7A1A3545
          4AACF8B6D611B9F517769350A60003B1551BC37152CB4187FFD0CF003EBEF4E0
          0209BFFE06CCC51B1B4A1218AD0000000049454E44AE426082}
        Name = 'PngImage3'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000019B4944415478DA6364A010308288C08233671819198D1919198AFFFF
          67E8054B1060FFFFFFFFECFA09262660037CB28EFE67E7E02826C5E69F3F7EF4
          6E9966CD083620B8E86C1139CE5FDB67DC0736C03464FD7F393939925CF0E8D1
          A3DED36B02212ED0F25CF45F53539B2403AE5FBFDA7B6D7B1C95BC206931E9BF
          959535492E3876EC68EFF31379101788994EFC6F6B6B439201870F1FE97D753A
          9F382F689D9CA3A37C61B5FF5D83D08DD7CC53AEC0F89C5FDFA4830D90B29CFB
          DFD2D200A70B3C67BA5727652608CD9BBEE0DD7B09ADF3822FAE1982F8CB7A7A
          6E820D90B75FF9DFC45805A7012A401BE581362645F80BCD5BB1F11D88EE5EB5
          9F41EEF33D07A263416F63A1172FC8660773A179074EBEFB206374B2E9E62E2F
          B001BA3E07FEABA9F1E2748134D005122017A8C90ACDBBF5F81D889E78FF1B83
          D0879BA12003B454ACA6ACE11337D554546429BE7FFF0F38D320B37D7679BF4B
          16E2149AF88587E1B598EC76D1578F3DF379BE30CC7DFCF83EC8006920E60062
          665C2E3062608834666088DFC4C0D0FF9281E19209038305502CED1C03C35C00
          4EBDB053A27F99D20000000049454E44AE426082}
        Name = 'PngImage26'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000009D4944415478DA6364A01030820946C6E5404AFBFFFFFF7A40F62590
          1811ECAB407624CC802B408E0E493643F53052CB0B3780A66990E802B01E9801
          B7811C55120D00EBA19A171E024D9327D105603D30039E003932241A00D64335
          2FBC069A264AA20BC07A6006BC077204493400AC873A5E0082FF486C6201580F
          48930B10CF046225A821FF910CC7C7BE07C4E9208E291073003133892EF80BC4
          3F00E59D578AD03088AB0000000049454E44AE426082}
        Name = 'PngImage25'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002214944415478DACD935D48936114C7FFE77DDFAD36B7B50F652EC7F2
          85852434A141AC2EFA84BAF12A84EEA40B83BCF26A6921DD040A5277967421E5
          8DB08BF2628588491F2698100A7D605109DB5C1BA44E67EF6BD33D6F679A605F
          50D445070ECFC3C3FFFCCE79FE3C0FE12F83FE4F807AE3D9B182C069DE3670BA
          BF1E2738A764C2ADC4B9F0C02F013BBB27A206A88B88204980CD24412B1A288A
          6F64BDB3CDE1A61F006AF778338BAF1357DACD32424E19AB9F74586D16645709
          6FF345086343CB93F4F2244DE4BF3AFA5E1746FF5CF4507BF99551439265C8DC
          396459C3F8D0E3743EB734CD7ADFDEFD757BAA42B578BE28362086816ABB524F
          81CE11234F3278E4199248F55A14F8CA144C0E0E4FE4E616DBC548D770A9A374
          FCFCC54030D05A1939E848E8A2A487535A7B48BB2E0F1A39DA0EE2AE0C80C82D
          A098492D6BC9E4A9CDE2CD604863E8C881BEACCBBF0EB00B1DA45E8A1BF38A05
          EB8EB1252510CF074591FB6B5CDB7AC6CE469E6C85045A6E0E1582B5274A5AAF
          D040C10B0322A358A9649CC4CE28EC4195C304D5A14021F4DD6E8C9CD90A3879
          ED7EDC56EEAE5F2A005A36A3D3EE682C93A21D5EB39950ED32C36F37E163FA03
          5E4EBE4869CB7A0F5FA3E3BB6BB459EDD6964ABFCF9DCFE563B4AF2D3625392B
          EA2ACA08D9541AD3AF5ECFAC682BF7587B878B1FFCECA131E4282F359CEFC8DD
          D0D1E9F1785A93C9E49BC2E7429C0FEF72E1A3DF7ECA4C3BCC6B98F329178EFD
          93BFF027F1057ABDC1659A244B230000000049454E44AE426082}
        Name = 'PngImage5'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000021C4944415478DA6364A010300E2E03A4A79C0AFCC7C098C0C8C86800
          949103D220E17740BC869D9971E5BD34A37D380D109B706C0E50433223131358
          98959991818B8599E1EBDF7F0CFFA1CA981819CA1E671877631820DE7B74CE3F
          0606A0664606907E357E7606490E46866FDFBE33B07173315CF9F89FE1F31FA0
          DB802EE26266CCBA9D66341D6E80F1B463DEF73FFDDAC2C8CCC4C0CCC8C46020
          C2C6F0E2FA0D862B67AE5C07CA3FE715E0D3B0F47090BAF28B9D016804C3FF7F
          7F199EE79A334A4F3FDB02342C8A51B173DFFEF77F191D40B62BF2B131BC397F
          F6D3937B8F3BFFEDED6A033BDBB9CC554058A0C5C4C7DDECF94F0686373FC12E
          B90F344B9187E10F03A35CD3F6FF1F99D8C1BE91F9FE8AE1FA89B3F140CD8B90
          FD093284474E6E1D8BAC020F9BA828582DC83B7C7FBE3130AA366CFEFFE23F07
          031330D0F8DF3CDAF36852922BB266EBD9276C6E7FFC93F9EFFFBF2826161670
          A8813483025BE8D717064693DAB5DFD845443805395919BE7EFAB06D7F899737
          B201C18B4E2CF8CBC014FFE8DB1F86A75FFF03C30168001323D820B19F9FFE33
          8A46742CE2E1E5097FF5F2F5BBEF5FBF4F043ABF03CDF9555C3C9C993A267A32
          E2F2D20CCFBEFF6778FCE51FC35F50EC7D7FFB9211E43F205B19886F0235EFC7
          96DA806A1C815410273787B7A681B6A28C922CC3BB3F4C0CBF5EBEB848525206
          1A640FA47CD8D8D97C15D514D55EBF78DD49565E001A640DA4CC81F82CC59909
          004CFBB45034915C1D0000000049454E44AE426082}
        Name = 'PngImage4'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000025F4944415478DA8D934F88127114C7DFE8E4BA92A4A665E9EEA1652B
          A8F06057313A7808A36374EAA6A208822488E0C9939D624128D8431D7629A165
          B7A884858DF59C20B5CB5638D8AEDAA6AE8E3B3AFEC99CDEFC762774BAEC8337
          BFDFFCBEBFF7F9BDDF9B37148C194551CB385C43DF1204E1C149344AB6E97324
          12B99E4AA5F6388E9B1DD7B45AEDAEDFEF9F4926935F1070E33F0006BF341A8D
          776C36DBE97C3EDFC6A54FB55AED96A8994CA68F38D825AD5EAFBF43C87D3960
          2791485C69341A301C022C2DBDE88E67100A85A60F0F5BD0ED0E6061E1C95704
          5C9503BEC5E3F179862900CF0B502CEE80C3E1205A369B05B7DB0DA552099A4D
          0E5656D2DF1170590E28C462B14B22A058FC01FD7E7F3C0130180C60B1580860
          6DED358380B97F000C5ED5E97477ED763BD56C364980D56A2501A295CB6572BA
          5EAF43000B0CC3082CCBBE41C83D09B01B8D46673A9D366EAE10DFDEDE9AC8C0
          E57281D96CC61A88A5A16171F1E91E02662540251C0E5FA856F7A152D987A929
          3D6C6E7E10D71F8A3A6E7CEEF3F9A0D13840BD82EF6AC864567FE2FA4509F00B
          AB7C4E0EE0799EE81A8D469003D6D7DF5611705E02D483C1E0D97140369B815E
          AF4774B55A2D78BDDE09C0C6C6FB03041825001B0804CE8835E0B83628956AFC
          54AF603018105DA552091E8F87DC1F3B94D4209D5E6E2140270178A7D339AD54
          2A80655BA468D871D85043A2D3342D883D8123888D265A2E97EB224023F50149
          B1D3E9900C68FA2883D16844748542719C014F3210045A6CA6A3B3F1711BFD19
          FA9CECC72AE3098F8EE78F716E81492BA07B44C04D72298053E84A3899FD41FF
          8D3EFC0BC0CA509619BFA8C00000000049454E44AE426082}
        Name = 'PngImage24'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001034944415478DA636480024646C645404A1BC4840961C14C50FACAFF
          FFFFC3189014930DE006005D700E9FAD401BB5F01A40B10B904162F3CB874C4C
          4C72B834FDFBF7EFD1FC5A71799C06F8175EFB5F1CA784D3D6DE45F71836F66B
          31A2186016B1E7FFB76FDF92AE6CF29B6F19BDFFE1DFBF7F71BA809999F9D1F1
          A58E101780348218EFDF7F004BDEDE194252B8C015ABB86DFCFFEFDFEFA47B7B
          42E6ABBA6F7EF8FFFF3F0C173032323DBABDD3579E6020EA079EF83FB9CE0043
          3CB7E902C3C5F5168C040DB089BBFF90919119C305FFFFFF7D74649122611790
          1506C094F8900135BD23D330362B3045B2016936A818755DB01F4869E0B0F50E
          9036C26B00B900001C4C57110EE71A810000000049454E44AE426082}
        Name = 'PngImage27'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001014944415478DA636480024646C6E5404A1BC4840961C14C50FACAFF
          FFFF03199014930DE006005D70199FAD401B55F11A40B10B904162F3CB674C4C
          4C92B834FDFBF7EFF9FC5A71299C06F8175EFB5F1CA784D3D6DE45F71836F66B
          81F532EAF86D4AE3E2E29A796A850BDC30CBE8FDCFFEFEFD8BD305CCCCCCCF8F
          2F7584B840D57DCD7F10435050002C896C105161A0E4B2268D898975E69D5DFE
          708DAAEE9B9FFDFFFF0FC3058C8C4CCF6FEFF495221888FA8127FE4FAE33C010
          CF6DBAC07071BD052341036CE2EE3F636464C670C1FFFF7F9F1F59A448D80524
          8501C27F8CCF1850D33B320D63B30253241B129FBA2E3802A43470D87A0748EB
          E235805C0000CDAD4C111E8C7F680000000049454E44AE426082}
        Name = 'PngImage28'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001EA4944415478DA6364C002841BB6A402A92820EE7EDBE0B38D010F60
          441710A8DEA009A4CE03313B10CFFFD01A900493939D70C016487D7C5CE07009
          A7013CA56BDAA0B6FF0262FE2FDD21E2489A0F4195E9C30C4131803D6F850E90
          BA0CC409406C00C405406CFF7352C42199BE7D28063C2972C23480396DD10C20
          950EC4BD40ACF2FFFB2F7F464EB6097F67C5154A76ED4631E079992B9A0171B3
          4D81E42920FE03C4DFA1A2BC407C9B6151AA9A68EB7614035E577BA21AC0E4D7
          B116480502B1F6BF4D15D7A162B780942AC83B0246DA7CC806BC6BF04518C0E6
          50010AF92E20DEF1EB40C75498A140F13CA8A1DD1C56E69F910DF8D416881906
          F80057C92A142F7CEB09C334E08CA8CD42202507E5DA00310B28164C5E1F39C4
          96BB14C5805F93A371BB00685018905A09C493819AF3C03194BED00148ED872A
          71FC3B33FE0056034E089B5903A923407CD8E2ED293BB060E2DCFF60C54C10E5
          FFFF81B9FF19E62733A1187050400794900E40B90EF61FAE5C814BFA4FFECFC0
          C10A61FFF8CDC0B0319711C3053BB815407E04F9D5DEE3EB03987FD581988341
          D4489C41D6690E50CB7F86C77B53195E9F7B0114FF0937603DBB702190EA03E2
          B70C90E40C024F037FBE6D01D2FC402C018A0CA8F817200619F099986884B880
          81811B9434C07E6760F80D35E42700D2A99E872154AE700000000049454E44AE
          426082}
        Name = 'PngImage29'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000F04944415478DA6364A010300E43031819194F81E8FFFFFF9B916C00
          507310902A026239202E001AB28E5403A601A9EF401C05C4EB810664A1C983F8
          B540DC0C949B86CD80AB40AA1E8863805815A8481B4D7E2690F202E26D40B974
          14038092A140AA1A882703B10110C703713250E16A24351781D42420EE078AF3
          A11BB0004845A0797105506102543E0C482D42922B07CA4D4436E019902A040A
          AE84F2F702294D205F0ACA9F05A440B6EE03E270207E0E948B0119600D355909
          88EF81421F887581B8156A36486C2E10E701F12D20EE06E20950F5853003D880
          981D885989897B20F80DC43F81F8D7204CCAA402001A334CBCB968765F000000
          0049454E44AE426082}
        Name = 'PngImage34'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000F44944415478DA6364C002E4ADA7FE7F78349B918108C0487503409A
          1919FFFCE2E3E365BBB42D89A021180A64AD26463233312C6365638DBABD2F6B
          395106303232E603A930205EF5FFFFFF89C4381DDD80E3656565165D5D5D2780
          065842C58E42E56198098D7D05A8360E664021908A00E21540C17E925D400980
          B9A00C48C500F112A00BBAC831E06A46469ED68C1993AE010DD0868A9D47F22F
          560C54AB0433A00A48C503F142A060DB80844103904A05E2D940173490A05F0B
          E6824F6161E9BCAB56CDFC0C64F301B126D0D02D687E66061ACE0EA439A0F806
          1087C20CE801E26220EE05E212900140CC45840BCE521C06007A13526523E9AC
          1B0000000049454E44AE426082}
        Name = 'PngImage15'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000814944415478DA6364A01030C218B25613D3981859663E3C9ACD4896
          01F2D653FF3332FE61F8FF9F05CC27D620B82255A769699C1C1C332F6D4B22CF
          051487012323E325281F86FFA2F199D0D857FEFFFF1F483D170CBC0158C2801D
          C9BF5831300C44079117C804E658C300E8371E202D881606CC40CC86A4F91510
          FB0DB8171800F9541E7F5B7817810000000049454E44AE426082}
        Name = 'PngImage16'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000002804944415478DA630C0D0D556260603007625E06E2C167
          203EB96AD5AA7B8CC1C1C151C5C5C595A2A2A23A7FFFFE65F8F3E73718FFFEFD
          0748FF61F8F70FA49E098859189898581998995919DEBD7B7765F6ECFEF6356B
          D62C634C6D7FFB1FD9E800BD130C2083FE0175420C40D02071985C3A1000C567
          31C6D43DFE9F16280AD63C6BFD6B86C58D3244F9212C2C2C03E885998C0145D7
          FF17C62A3230FCFFCFD0BFE401C3DA6E35829A1919191942424232D7AE5D3B83
          D129E5C4FFBA4C3DA0FEFF0CCD332E33EC98660456B4FFF43B86ED47DE307415
          621AC8C4C4C4000CBBAC0D1B364C67340DDFF5BFB3D41A68C03F868A9EE30C87
          16D832EC39F18AA169C64DB062101F9B01414141395BB66C99CAA8E5B3E1FFE4
          7A6770C0E437EF6768CED561A89D7C85A1A7C296A1A4E33003273B3383BEBA00
          83ADB10883859E30838C042730269819020303F376ECD8319951D975F5FF192D
          6E0CFFFEFE63C8AADF03B66172BD13DC3666600CF272313208F13132F0733330
          70B00123948585212020A060CF9E3D1319955CD6FE9FDEEC0C8E9E9C86034017
          68005D7083614A8303980F71011FD005C2401708015DC0C1C0C6C6C6E0EBEB5B
          74F0E0C17E4655F7ADFF27D75982E3BAB0ED34D0CF46C03078070C8307D03030
          C20803767676066F6FEF9263C78EF5326AFB1EFCDF5DAE034E7D95BD3719764E
          5786C6C267866D873F317417496335C0D3D3B3ECF4E9D3DD8CC6A1E7FF37E5CA
          30FC06BAA079FA0B86753D4204D301070707839B9B5BE5850B173A18AD63EFFE
          AF4EE307C742FB9CCF0C6BBAB8081A000A44131393FA070F1E34311A7AAD3B2C
          20696D03933CB34AA59D98A40CB4F0D1972F5F663002D9202B41599999A84C00
          017F81F83330F57E0300DA0E12F0398288960000000049454E44AE426082}
        Name = 'PngImage38'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C0000027A4944415478DA8D935D48936114C7FFE77DB79BC42EA4
          451791E28D5E187631B1418E4463A917639B7611055D446DAB1132671ACD9C11
          5A99AB140DBD4B8818EAA4318C8551A8F4C1129205255A171905E5F083749BFB
          E8BCEF8C120477E0709EF3F23CFFF7F79C731EAAABABCB0750CA9E8DCC6D95FD
          8DC7E3F94C2693E9A4DD6E6F56A95445894402F1F886EC1B1B718E712493D27E
          815D0141504214950887C3A1810177FBD0D0D02332180C66ABD5DA97E49DA954
          0A9288E4529E16F8175F7EADDA82D1DF9443C45738CF280F32E13E7D6D01E70C
          AAF461EF4F0CBAF613198D4633A3F4497FDFC94C8E59D49FCA0388E01EFC02EF
          9D4222BD5E6F191E1EEE4DA62FBBC51ADDB3A83AB207E52539727EDC3A0DA7F9
          209F27B4F5CD607CA094A8A6A6E6C2C8C848CF7602DA3313726C3117A0F2F05E
          39EF68D0B08080CBB7A7F0F6F131229D4E67F37ABDF7A5C22DFC58C7EB99454C
          BCFB85F79F96B01E4DA0B3A90C0D1D13B86E2B82B33B847BCE72EE86009B6B1C
          1F7C7AA28A8A8A4BA3A3A377A54A4762C0F26F20BC92C2EA1A77E43F289BEBB9
          1C7B5D95104401E6AB01CC056A89B45A6DBDCFE7EB8AC5624C10618230132C32
          C18A4CD0D37A14175B5F304121137C9473511461718E63FE999148A3D1D8FD7E
          7F67341ADDA606D39B35C8E31AE4C8B9FB4A09140A056C6DAF30FBB49A48AD56
          3BC6C6C66E6D27E0E8FA86EAB2DDDC85F494EB2CF368B717B080128E9B21849E
          68898A8B8B9B0281407B2412D9710E8C0D61382DFBA0648296EE05043D878872
          73735B82C1A04B2AE24E56DBB886E6B3D972176EF42F63F2613E51565696993F
          1CC86494D527E69AFFAE97BE4F4D4EFB0D65C4EB5D483F653113914D4BB0AFF2
          F8AFFD010A7A19F049AA51AC0000000049454E44AE426082}
        Name = 'PngImage31'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000001974455874536F6674776172650041646F626520496D616765526561
          647971C9653C000002454944415478DA630C0D0D556260603007625E06E2C167
          203EB96AD5AA7B8CC1C1C151C5C5C595A2A2A23A7FFFFE65F8F3E73718FFFEFD
          0748FF61F8F70FA49E098859189898581998995919DEBD7B7765F6ECFEF6356B
          D62C630C0C0CCCC8CACA9AFE0FA8F2FFFFFF0C20434018C4871880A091E5D281
          00283E8B11E88574A05366A0BBF1D5FB7F0CDC1C0C0C5F7F303088093261F821
          2C2C2C03A86F266350505006D029D341B6238303E77F312849FE67B8F79C91C1
          C1900D458E9191912124242473EDDAB53318FDFDFD418C69FF209E8583C9ABBF
          32D8E831321CB9F49F2137941B458E898989011876591B366C98CEE8EDED9DBD
          6EDDBA29E806A4B7BF6488F6E06358BAE313C3CC4A710C03802ECFD9B265CB54
          467777F7DCF5EBD74F02050E08D4CD78CC70EDDE77303B3F5A8161E2D20760B6
          9612274353862C98CDCCCCCC000CFCBC1D3B764C66747676CE073A650228A4C1
          7E3FF39EA16DCE5D86C65C23B88DF593CF3154A5283338980882F92C2C2C0C01
          0101057BF6EC99C868676757B879F3E6BE5FBF7EC135EC3DF19AA161FA0D86BE
          2A7B86A2B6830C0D991A0CCE16A27079363636065F5FDFA283070FF6335A5A5A
          166FDDBAB5E7E7CF9F28FEDC7D1C68C8B49B0C0D59EA0CAE96A22872ECECEC0C
          C0B02B3976EC582FA3AAFB66D4F82301DCDAE1C3C8A8EB7FE47F47B13AC36F68
          18100358816150D17B93E1D2066B4646F3C86BFFEBB3C418D0A3111F004563E3
          B4570C27966932321A78AE392C20696543AAF33F3C3F76E4FCB6605B46209B8B
          0192959949D00F4A349F81C9FF1B0036CF01F0FF3693FF0000000049454E44AE
          426082}
        Name = 'PngImage44'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000F74944415478DA6364A01030820946C659404A1B8853FFFFFF7F0DC8
          3F06A4AD8836006AC871209502D47815C406D2962083A06A4098098D7D05A826
          0ED98093402A096AC009206D418A17E603291DA8A98940FE29206D4692175004
          19194F030D3025C5058B81941E105F026A8C05F2CF0069135203311A1A06CEB0
          5800D217A001861503D528C15C5009A44081D600143C0F8B0552BCB00A481940
          C50A80B88EA458C01288A4C50250C306202509C2408D72E4C4822F906A648024
          E5B3B05800D2F791028D1928C60EA439A0F8061087227B210B88F381581DA411
          A85811C83626E080EF300340691E14EABD405C8264007981480A000088367665
          75C7F4370000000049454E44AE426082}
        Name = 'PngImage32'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000E94944415478DA6364A010307A26ADFEBF7D5E282310CC02F2B560E2
          40CC8444A3E32BFFFFFF8F32F058F51F6E0039B6A31800044709D80AC3CC201A
          E80255AABBE014215B9169A00B64A9EE820B846C056216A0CD9C401A84D9A9EA
          0251A00BE601C5D409D8CA06D57B19882D81067C811B005220A3E1C3F4E4C616
          BCB60AC97BFD7FF770DB4F20F30BB2018C76E1F3237FFCFCB9ECD4860CBCDE51
          B19DFC9F858523EAC6FED4E528610034E03FD0805F3FBE7F67FBF9E307C3AF5F
          3F197EFDFECBF0FFDF7F60D2626260646465606561676061E5FC0534800D6800
          23BA01E4B9809CD04706141B0000B6349EBE7D43E0260000000049454E44AE42
          6082}
        Name = 'PngImage39'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002044944415478DA63648002F9F0F0062025C9801FEC7BB872E54A6401
          461843362C6CD6CD952B53BFFFFDCBF0F3F76F86DF40FAD7FFFF0CFFFFFD03CB
          1FD8BF9FA179D9B2D920431EAF5AB502C300C98080D9B7D6AC49F9FEE307C3CF
          3F7F18BEFEFAC5F01D88FF400D3970F02043696C2C835460E01CA0F2BDCF376C
          5881628098AFEF9C7BEBD727FF006AFA07D4806EC8F2A54BE1CEEE6B6FDFC0F0
          F163208A01C25E5EF39E6CDE9C0832E02F50033643402E11101060B08C8C9CFF
          76DBB6241403785D5DE7BFD9B52B01E6025C86F0F3F1311887842CF8BC7B7722
          8A019CF6F60B3E1C3810FF1BE402201F97213CFCFC0C7A3E3E0BBF1F3C988062
          009BA5E5A26FC78EC58242FF2F08E33084938B8B41D5D575F1AFE3C7E3500C60
          303159F2F7F4E9E83F40C5FF809A7019C2CCC9C920656DBD94E1CC991854030C
          0D97FE3F772E0AA4E92F1E4398393818844D4D97319C3F1F8D6A80A666EEFF6B
          D7268192CD7F3C86B0B2B131F0EBEAAE60B87E3D1261401D50CF238692FFF3FF
          F7302E63C79B963F877F63E055535BC570EF5E38C2807CB0A50CFF27FC67609C
          C2C820196C8855F3F3B5E719BE65FD65E0525058CDF0F87118C28068A001EF81
          2ED80A744115235E177C6FF9CBC02924B41E9812836006D880D211106BFFFFFF
          BF1B9B2678B800313310B330326E035253403E0219E00AC45240EC06C4A20CC4
          81D740BC0B889F0100ACC058A12ACE38740000000049454E44AE426082}
        Name = 'PngImage14'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000DE4944415478DACD913F0B01610087BDE50A1FC062B0301C2984EF40
          F22998C8200629830FA08809932C46C9BF9589B2182C168BC16C7F3D0375DDE0
          DEEB166F3DFD9E7BAFDFAFAB132E8747FCDF8010224E54200C6ED3EBB994B267
          3530212286AB3674604079A6F2057BC2F37DA694E6EE84B6F09DCAC094881A06
          92DC9DD126BE5519481075D041A314E3EE8237F08DF25FA09425BA9474FC8AD7
          F0B59D811CD1A714C26F78155FD919C813434A41FC8E97F1A59D810231A6E4C7
          9F78115F580D04C00B3E48C108327084121CE0050F9501CDF44E7ECA3F076C1F
          C7036FDADB5311D828DF550000000049454E44AE426082}
        Name = 'PngImage33'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000002104944415478DA9593CD6B134118C69FC9EA6E9340C0945A4391F841
          4A4F295A2CD45B8942FE02F12288DE8251E32985369F1BC15CD2164A4E1EBCF5
          4FC8C146C54340A482055D1462549A169B2A0437C96E76B39D5D9A35BBAC882F
          0CB3EFB333BFF9789F21B0453A9D6EF87CBEE0A8268A2254557D97CD662FDBC7
          13078096C9642C5AB3D944A15080DFEFDFE079FEDE7F035AAD1672B91C144541
          B95C26FF04A45229B85C2E7DDB66936519A55209F4187F07DC5C5E5F9E660EF3
          8F12093B179AA6A1B4BA8A4FEAF8CA267F9F3701B158EC23ED67BAEE098C9D0A
          60A2BF8FC4C30720843800D67070F20C7ABFF6E0EE1EE8B240E8A5688B91EBD8
          7CFD01C1E039483FEA907FEE0203D5BA051703D63F05EEF405341A75DC5A0CE3
          D5CB173000D168146F3EEF42F87E08C53ED116272868E6EC38E64353A856AB7F
          00F6E8F57A969C6559E36247A352A980D0F26891C83553ACD56AE87444C7D53D
          1E0F1616AE9AF9D6D673105A326D6EEECAF1AA5DECECBC8720088E8070388CD9
          D94B66BEBDFD1624994C6A1743D386A0F4FBD8DF6BC26EA461E4F3794C0602F4
          288C917FFD520789C7E31ACB7286C0300CDCEE3147C0603030DC288A1DA3A47A
          C8B264F8E02EFD3EAF0BF41185388EBB310AD027EA16D65BB15844BBDD5E9324
          E9F7F1EF6F16B7D0151ED3814BD4AE96897D7A34DDCEBA95693592F4DE9E984E
          B401EED0EEA9D7EB35B6396CB6D2DEA6806743ED08623AFC49AAE40B0F000000
          0049454E44AE426082}
        Name = 'PngImage20'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000003454944415478DA95D35F485B7714C0F1EFBDC94D62723569D2D64EAD
          D6A24D912A8A66A26C0A13A452EC986C0C84C21C2DB2B78DB1A70DC65E46190C
          56188C15AAECC191D175824ECBD0B1A50FA6B5B313493727AE3AFFC4A82CA931
          E6E68FF7DEDD1B98748FFBBDFC38DCDFF9FC38F7778EC0FF5C0303037163BB34
          3C3C1C3663E1D98FAFDC6C08C8A9371B648BFF8A11365B1D31592F8E91DA752C
          9F74367F9A8DDC79D7E3F1D46C6C6CA0695ABB89FC0718FCECCE3DC1B1F36257
          7D07273CC548D6BFB1880AEBBB7B4C8715DCDBF7191C1C64646484D5D5D58F87
          8686DE179E497E5453A334B59C3B8E4D70A26B0222361C9297743EC9FA9324BF
          877FA2BFBF9F6030C8DADADA2D03B85A00DEBA71F7C7AA0AEF4B175BCAD94ECE
          61730828F93CA2564C5A8BA26C4B846E87282D2DA5AFAF8FD1D151363737CD32
          3E148CE44BA245F8BEA7F33C6E7B8ACDD80C2E9F95BD7C0A55CFA20A2A3B330E
          7C928BA5A5257A7A7A989E9E2E60F3F3F3311308CA1ED7EB8D752ABAB0826ADF
          C2E61438D433EC3E55C8A6F364EE97517FF62C939393F8FD7E969797E9EEEE2E
          C426F0C457E6ADAEA8CA231C3E66BF680E872C709039207BA8904F3421FCE2E0
          C2994AF34636321281EAE35454543036365600768E9DF29CA83A771A8790642E
          FA01D2B114C4EBD07151ECAA27F7608B86CA532C2E2EF24839C9E55A5BA104F3
          5F98C0AF925CD458EEAF467416F1E75FDF11CD7F4EADE7232C161F89E416D6C8
          0A1D35D584C361AC562B76BB9D4020C0F8F87801F824AB09EFD92A2B71783D64
          B1B216BB4D52B9472E1DC7E9BB4EE56FDFD271A686858585C2334E4C4CE076BB
          89442205A04DD79959C93991CA9E03592667205955607FFF31F9E41FD445EFD2
          EC6D27168BD1DBDBCBD4D414922499BDC0BF7D30B297D1FA17922E048F17DD29
          1BCF674535106DEB4BDC89208DB94E4A4A4AE8EAEA22140A118FC7CD3EB879D4
          8906F27322A5753E5C17C86047340043403DD883A737C8ECCF72A5E91A6D6D6D
          CCCECE924824BE3266E18D23A0B5B5B5FDC2CB6FBF235AA557A371919D9D2C9A
          0188AA866C0C543AB74A8398A7B6B6D69C031445B96A00B78E00437E5ED7F522
          5555CF9F6EBEF89ACB57DE8228DA8D03874A62FBC1C31FBEF9FA85D6C632A3F6
          6BC6F12F8CE4EB66DE3F9E156E532A2F78F30000000049454E44AE426082}
        Name = 'PngImage1'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001D94944415478DAAD93CB4B626118C69FA347D371EC32114146CC4A2A
          A70B0E65ED8284208A96D1426811D185665A15FD096DB3524AAA45D065115D27
          AA556D04B38466AC94082A3C74D3A3A35D3DFA75B46966028D6ECFE6BDF0BEBF
          EFF93EF828BC54523DC1551BF55052CF5ACA1A217FF353EF7DBC6EA7DE06F803
          795F0776FB2FA2EFEB79B4DBD6FA0D2AD5977F73F1DE6060D040366D369456E8
          7029942318124242AEB0B96C82C77DAE9B9C981A8D652E0AB0EFF027EB7BA02E
          D7C1F15B0EAD5A018998C6BAF3143ED603B765180CE352CF4E2FD862029A5A1A
          894A5305E76D06DA6BF2912C13F10E08F64F0298B332F8C0B16197795860EC1F
          A0E20272B54DA065A9282F48873441088E23D83B0EC07EE487E3C04DF0D3483D
          09F85AFD1D41FEEE25CA54C8A522B0811BDCF010DF4510B396C3B060CBF0B483
          C2B25A38FD2928CE51202D45821017C6279918E61D06E71E2F77621EA4E302AC
          560B310D99A0D43683BD154399FE11748208C7672C02D71C5CAB7DF0B2DEA3F1
          B1C9AC9880881A1AEB094D8B5156D7898D3D16BEA0109F13090ED78C50E5E645
          679656161DF3333FB2630222AAAAA9ECCE546476FCDF4B4A4A86A6480317C344
          6BC7EE367A7B0D2FFB4C9D5D1DE401F22A002F010F0945920BBFFF11E00E922C
          D611AB4D10F70000000049454E44AE426082}
        Name = 'PngImage41'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001DD4944415478DA9DD0DF4B5A611807F0EFD1A3E9CCB4A20533A22B59
          B96A1865BB0B1206A3D1E5E842E862442B5A5D15FD09DD45D69492BA09FA7111
          5BB562DBD57623389750595322C8F0504D3D3AEDA747DF8E8264702CEB7BF39E
          F7E13C9FF7795F0A0F89DC4C70DE476597A8BC9B65A324BD3E55DFD47C9D547E
          40A6F9D140BE13B8DDDBC43C3176ABAFAFF72374BA17D4BD6F303965211B2E17
          5EBD36E14CAC443C21868C9C63E3BB0DA160C0B4B8B0342B34581A70EFF2279B
          C7A06F35C1F35F09A35E039994C66FEF09226C0841C70C18C6AF5FFEFCD52508
          74F774119DA10DDEAB671868AF835A21E12720D83F8E61C5C9E009C726FDF619
          91F5D3249513A83176835694A2B5BE1CF20231388E60EF2806F761149E8320C1
          9695BA136878DB8F387FF7666D29947209D8D8252E7924721AC7B2C397146D5A
          EE9EE065CB3B78A3C568AAD6A0AC588604974489420AFB2E834028CC1DDBA7E8
          9C80D3E920B6691BB4C60F60AFA4D09617822E90E0E81F8BD80507FFCF0984D9
          F0E1FCDC62A52090CAFBAE4E42D352B4740CE1CF1E8B485C8CAA2202DF2F2B74
          35B5E97FBEFD58F7AC7E597B2E08A4D2D6FE66A4425331985D53A9D430341AE0
          6798F4DEF37707E3E3164A10C895A1E14192411E05F011F14822F5711A8DDE02
          AE016C00D0112C3E9FC00000000049454E44AE426082}
        Name = 'PngImage42'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001694944415478DAD592B16A02411086FF7901B5328F612C6C848388A6
          D12A28D65E140B415430B95A45C4F2ACC5330862BC28588B44A2581A14C534A6
          B1B2F50526B71A0F8355481A07965D8699EFFF6777097F0CBA3C80CBE5E252A9
          049FCF47BF068CC763F6FBFD10ABD56A1D00CFBACE857CFE50C18CBB6010855C
          EE08E653914422C1FD7E1FDBED16D56A550B87C3F7140C855834763A9DFD79B9
          5CE263B5A2EF6673545DD76BD16854DEED7664B1583893C92067089974B552E1
          C16080C56281CFF5FACC41B158E472B90C0148A7D3DC6834D0EBF5347A1D0EF9
          219B35CA0857763BE6F339369BCD9903B7DBCD027E1AAAAA821C0E075F3B9D78
          AAD7E95151D8D8C58C3F1C689AC6A9546ADF20CB324D26134E269390240964B5
          5A391008A0D96CD28DC7C3EFD3295EBA5DDC7ABDE678F1789C8D5BDFDB3FE6C4
          18A3D108148944B86EA88A5014453C0F6C361B66B399596C5CDA9BA12E09F563
          AEDD6ED762B1987C815FF9DF015F3831A3E7EF07F6F90000000049454E44AE42
          6082}
        Name = 'PngImage40'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000001C94944415478DA6364A010306213BC7AF5CAFFC95327A188E566E731
          686BEB30123460D6ECE9FFCF9D3FCF60E91ECBF08D9997E1F75F66068EFFDF19
          CEED9AC3F0EEED9BD8552BD72DC169C0D5EB409B274F6230728E65B8F98997C1
          C5489A81838D85E1F4AD570C1FDFBF63787B6A3EC3B3674F8D366DD87A1EAB01
          195969FFB5CD7D186EFD926228F0D76310E06605BAE03FC3BD975F18369F79C6
          C0F5E7FDBFA7C7E733CD98368B11A7015A2E190C2CDCC20CCEFAE20C9CECCC0C
          7FFEFC67B8F3E20BC3D5C79F196E3E7CFB9FE1F20C46BC0618FBE633FC06FADD
          424D9881979395E1FD979F0C3F81867CFCFA9B61D3A947FF982E4DC7EF020387
          70865B9F0519CC34A51944053918FEFEF9C720C4CDC670FCFA338637EF3EFC79
          797C360B4E03CE9C39F57FCEBC390C6A2E990CEF7FB131A889F330B0B0B332BC
          78FD9EE1CB8F3F0C4F0F4E65F8F0FEC3E315CB57C9E18CC694B484FF2C2C6C0C
          0E91E50C67EFBC67F8F89B994181EF3FC3A3433318B4B574C16A76EEDE7E73CB
          C66D1A3813928FBF57A78CB44C19B2183FBF0083B9A939C3D367CFC0FC9B37AE
          314C99329D11AB01B8407965D97F9821D80CF88F472F4C1D13D090BF20C6D7CF
          9F4977013E93897501F112C40200793CC311C52142C00000000049454E44AE42
          6082}
        Name = 'PngImage43'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000023A4944415478DA9552CD8B5251143F577BF366C6666C08A17F2008DA
          0EE520B31111CC855FA4A9E54C8D26B812251141D404132113DACD9BC6C6AF85
          F9810A2E44241207A3652DDBB7B34520E4F3A3FBEEF4CAD119A81F1CEEB9F79C
          FB7BBFDF7917DDC70080BB3836E0DFF103C7C77718C86030BCF47ABD1E894402
          93C904C6639604CB8EF13A86E994EB17E0B8426E52D43A0C0603609857C972B9
          EC453A9D8E71B95CF629EE9CCD6684840B6E7F46F077E5301A8D48EE743A0F71
          9F13610787C562D131AF8F23420841381C26C19FCDC3643231D8C153A4D7EB99
          52A9645F24E010894420140A5D4670842D389056AB6570728E4028142E4D8D65
          D9737BA3D17854AD561D48A3D1704C07F345DE6F341A85603078A1024CF0A656
          ABD9915AAD3EAE542A8FE78B344D2F29180E878B168E1B8DC60152A954694CB0
          7F9182582C068140E03205E966B3F9042995CAB7D8CB1E5FB0E4C5907D302079
          3C1E07BFDF4F726BE11AE4CCDFFF10E0BF77D26AB5F69142A138C10436EED09C
          D9C20F8582B4F11BF9622291009FCF472ED8723760734B04AFEF7DE51564DAED
          F61E92CBE5194CF0C89C1503450B61658582D16FBBB309B6333ECBD7C442B8BA
          2182557A1D9E4B3F7133C8763A1D1BDADDDDCDD5EB752BD7E46EDF84CDB5EB10
          BCD3250A92C924783C1E42103CDD86554A0481EDF7BC857CB7DB7D886432591E
          1358786FCF3EDC82D8CE6732C8542A056EB79B9CFB4F6FC38B9D2FF3432CF47A
          3D2B924AA505FCDBA6028180E69FF0E2BA084CFE1343D0EFF72DCBD5FFC42FB9
          B21820AB390BFB0000000049454E44AE426082}
        Name = 'PngImage12'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          610000021F4944415478DA9592CD6B1A4118C69F592B166C2F6D43FA0794420F
          3D57102F4104F1E057AA252169D31A04A1202A4114511145C45AA1B7ACD568AA
          50F103BC94DE72EDFFD04B6F3634464CC124BB6A6736B8DD88A5E48197D99979
          E7B7EF33F392E754009ED1B88B9BE98CC637E2743ADF0583C1C0CACA0A269309
          4451904210443A8A984E592E47E396748AE3D450A9D4180C06E0F9F70562B7DB
          799FCFE799D2CCD96C264158B0F915E0EFC8A4DCF77ABDFB843AD86F369BBBCA
          DA18881082442221C57C6D516EB79B270E87836FB55A9E4500533299443C1E97
          E76FBF3CC207F37709CED628A0446C361BDF6EB7FF0B087E7D8AB3F3012ECF45
          545F1C4B6B2E97AB44AC566B8902DE280173BFA9540AB1580C9EDE2A6EABEEE0
          7438C0F96F11500B68ED8C19E023B1582CE54EA7B3A3D168AEF91B8FC748A7D3
          8846A372456EFE3E3EEF9E282D9489D96CAE50C0AB651564321944221119B079
          F800F5AD5F32805650212693E9A0DBEDBED46AB5D72A188D46C866B30887C332
          60BBB18ADAC64F19405FB04A8C46639502B69587D93BB3845C2E87BDBD3D048F
          1E43ABBE87FEC90F8817045308A8AC1FB30A6A646D6DAD46015B4A006B1C06C8
          E7F3088542D277E8E80986C3534C2E090EDCFDF91D1C1283C1F0A9D7EB6D2A01
          82204809854201814040B6F0BAF510E5F5BED2429DE8F5FA3A056C2C02D84516
          8B45F8FDFE7F7622B5D0203A9DAE419F70CA719C66DEC28BE332D11F5C5071CB
          776FA03F8AE94626A3CD1FF90000000049454E44AE426082}
        Name = 'PngImage13'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D49484452000000100000001008060000001FF3FF
          61000000FA4944415478DA63642001303232628AD1D500AC86D2CC00A073C3FE
          FFFFBF8A1203D6010D0822DA00A0864820A503C457801A9703F91BA1522BA07C
          907C048C8FD5054045D1402A12A8C007C8DE02A381625540DC06E26371292303
          5002C4E802F29702712790EF01E4EF80D140B13220EE02F1F119B007C85F0CC4
          B140BE0B940F028B81FC85407E3C901D07C48B407C0C03C88E469801F79DE4FE
          7FFCFDB7829F95B9E3D7BFFFC56C4C8CBD5FFEFC2BE36161EA7AFFFB6FA5202B
          73FBEB5F7FAB45D9985B15F73D420AFC2C6E86FFD3BE329CB29116034ABEFCFA
          E79F18370BD32B180DD4240E1287D120719D434F5E134C07447B61C00D000024
          648017E0A338940000000049454E44AE426082}
        Name = 'PngImage10'
        Background = clWindow
      end>
    Left = 414
    Top = 134
    Bitmap = {}
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
  object ImageListIconsTango22b: TPngImageList
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
          3B000000644944415478DA6364A01160A48BC11C4282FF41F48F77EF29B610C3
          0090E1C806C32C230580F40F9CC1340B8AC16D307278526A387DD2F19034F83F
          0E718A0CFE8FC487B3A99641686930B2CBA91214543314DD60AA198ACD607CBE
          A12828A806869EC100D6EE341710607F600000000049454E44AE426082}
        Name = 'PngImage41'
        Background = clWindow
      end
      item
        PngImage.Data = {
          89504E470D0A1A0A0000000D4948445200000016000000160806000000C4B46C
          3B000003E24944415478DAA5956F6C13651CC7BFD7DDB56BCBD8DA98090C5E98
          AAE505C1EC9509C4A0D13706302EA889265894E084300C2F749341302653A2BE
          231A10615614B36144B4634B84980D0222D0AE8D3ADA65197F22D9BAB5BDB5BD
          DA75D73B7FCFD36BE1E830469EE4F7DC73774F3FCFF77EFF2A80C6BE8FBADEA0
          CB41FC8FA1CEAACDBBF7EC1DBEFBB96080F5B5CF3E078FC703BBDD3E2FA05028
          D0ACF375329942B158C4E4E4247E3E33807343E75704027D23F44AAB02EFD8BE
          936FBE73E8BA5E3106D5359DCD181C1CC4AA55ABD1D8D8884020803F4622085E
          0E797B7BBF8B5581DBDFDE856C368B5028C47FCC617AF9008D4D5CCE632B5762
          606000EBD6AD477D7D3D1445417F7F3FC6C663E878A753B827982BE434ADA290
          B947370E51940C4EFC70128964BCCA5D8BA44E9C9B16167FD1A54F98C0994C06
          C160D090A941239AD7EBE5D0D3C797E299176FC2669570FDC64D24A6A6F0DBE5
          4B5CD9E2254D984A4CA27D5300FE6F2E60D34E0826707A66A6E206660EBB83AB
          EF39500AE84BAD0A1D9EE6C153E76621CFB075121A7D59747404EDAD2A2EFC7A
          09913F03EF99C0B22C23341CA2D8EA789494B2C194FAB65D84FFB3C7F1F40B37
          E076BB2B815555150AB9CF6AB3A1EFEB46F8B674633A3E8ABE931F987D2CA7E8
          7430A54E9E053D071CF06D3D4391A825F0EA7FCD675F6B0F099A052C12FC075F
          368353A90472B93C879E3EBE8CA0BF50020F01E272405A418FE99DE030629033
          C26FDCB39C295240F3DFC3DFBDDF0CCEE7F366A5F91F6F4BB22C026A96B05A33
          1E88E5DA33F29CCE103D38BCFF294CD884F72BE06D6FB64192C41274CB21DAFF
          7BF5F70A0BAA9F890FD36425BD0E580AA7E0FFF2106292C56B028B620DC2578F
          203AD806DFC6F5188BFE84FF323C0FB9F0B7F513F41EDD8CEBA265FBDE36ED53
          13589D2B40C9E57075FC18FEBAD241F0B504EF83E7912780DA0D864BDC864B93
          B7EF0527FC9F6FA8404D95C7C039AA2A5194607738B8F2D8D00E0E8796A6C43F
          7B4FC51AC52D5EECAA2A690B818B0C9C55D2080F87E16A68A06A5A8AE8B563B8
          157C17BE575BE0FFEA049E6C1947B9B68DC287CBE5A6CE378723E4DBBBC15602
          CF727046AE549D24D9E0703A11897663F4EC5B7C73CBEB3212D371DE944AFB80
          0602EBBA302FB88EC069DFC6D7A86DCE21128E188D4827352E34352D43ECDAB7
          B815DA8535CF8F211C0EF1AE578203CDCDCDA8A582F21FEDAE02BB099C606016
          3CD61C4BEDB704B74A5638172C44B987C6E3131568698F46EDF38179C1F50496
          19F87E86017E90962C5D5406AEEDDCDD71B86E61DD2BF703965372EFBE0F3F6E
          A56586AC289403C87C4DC6BE9915BF8DAC864C32AE6239830C9F948DF5802C59
          FA0E63FF6FFA3FDC312A33F5F832CA0000000049454E44AE426082}
        Name = 'PngImage44'
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
    Left = 366
    Top = 138
    Bitmap = {}
  end
end
