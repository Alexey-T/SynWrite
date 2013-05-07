object fmMain: TfmMain
  Left = 225
  Top = 163
  AutoScroll = False
  ClientHeight = 624
  ClientWidth = 768
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
  object TBXDockTop: TTBXDock
    Left = 0
    Top = 24
    Width = 768
    Height = 26
    object tbFile: TTBXToolbar
      Left = 0
      Top = 0
      Images = ImageListIconsStd
      TabOrder = 0
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'File'
      object TBXItemToolNew: TTBXSubmenuItem
        Tag = 700
        Action = fNew
        DropdownCombo = True
        LinkSubitems = TBXSubmenuItemFNew
        OnSelect = ButtonOnSelect
      end
      object TBXSubmenuItemToolOpen: TTBXSubmenuItem
        Tag = 701
        Action = fOpen
        DropdownCombo = True
        OnSelect = ButtonOnSelect
        object MRUtbx: TTBXMRUListItem
          MRUList = MRU
          Caption = '(TBX MRU List)'
          Hint = ''
        end
        object TBXSeparatorItem7: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemClr: TTBXItem
          Images = ImageListIconsStd
          OnClick = TBXItemClrClick
          OnSelect = ButtonOnSelect
          Caption = 'Clear list'
          Hint = 'Clear recent file list'
        end
      end
      object TBXSubmenuItemToolSave: TTBXSubmenuItem
        Tag = 702
        Action = fSave
        DropdownCombo = True
        OnSelect = ButtonOnSelect
        object TBXItem4: TTBXItem
          Tag = 703
          Action = fSaveAs
          OnSelect = ButtonOnSelect
        end
        object TBXItem11: TTBXItem
          Tag = 705
          Action = fExportHTMLAction
          OnSelect = ButtonOnSelect
        end
        object TBXItem15: TTBXItem
          Tag = 704
          Action = fExportRTFAction
          OnSelect = ButtonOnSelect
        end
      end
      object TBXItemToolPrint: TTBXSubmenuItem
        Tag = 630
        Action = ecPrintAction
        DropdownCombo = True
        OnSelect = ButtonOnSelect
        object TBXItemPreview: TTBXItem
          Action = ecPreviewAction
          OnSelect = ButtonOnSelect
        end
        object TBXItemPageS: TTBXItem
          Action = ecPageSetupAction
          OnSelect = ButtonOnSelect
        end
        object TBXItemPrintS: TTBXItem
          ImageIndex = 35
          OnClick = ecPrinterSetupExecute
          OnSelect = ButtonOnSelect
          Caption = 'Printer setup...'
          Hint = 'Printer setup'
        end
      end
      object TBXSeparatorItem8: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXSubmenuItemTbFind: TTBXSubmenuItem
        Tag = 600
        Action = ecFind
        DropdownCombo = True
        OnSelect = ButtonOnSelect
        Caption = 'Find'
        Hint = 'Show "Find" dialog'
        object TBXItemFNext: TTBXItem
          OnClick = TBXItemFNextClick
          OnSelect = ButtonOnSelect
          Caption = 'Find next'
          Hint = 'Find next occurance of search string'
        end
        object TBXItemFPrev: TTBXItem
          OnClick = TBXItemFPrevClick
          OnSelect = ButtonOnSelect
          Caption = 'Find previous'
          Hint = 'Find previous occurance of search string'
        end
        object TBXItem8: TTBXItem
          Action = ecReplace
          OnSelect = ButtonOnSelect
          Caption = 'Replace...'
          Hint = 'Show "Replace" dialog'
        end
        object TBXItemRFiles: TTBXItem
          Action = ecReplaceInFiles
          OnSelect = ButtonOnSelect
          Caption = 'Find/replace in files...'
        end
        object TBXSeparatorItem9: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemWNext: TTBXItem
          OnClick = TBXItemWNextClick
          OnSelect = ButtonOnSelect
          Caption = 'Find current word next'
          Hint = 'Find next occurance of word at cursor'
        end
        object TBXItemWPrior: TTBXItem
          OnClick = TBXItemWPriorClick
          OnSelect = ButtonOnSelect
          Caption = 'Find current word prior'
          Hint = 'Find previous occurance of word at cursor'
        end
        object TBXSeparatorItem11: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItem2: TTBXItem
          OnClick = TBXItem2Click
          OnSelect = ButtonOnSelect
          Caption = 'Clear search marks'
          Hint = 'Clear search marks'
        end
      end
      object TBXItemTbGoto: TTBXItem
        Action = ecGoto
        ImageIndex = 26
        OnSelect = ButtonOnSelect
        Caption = 'Go to line'
        Hint = 'Show "Go to" dialog'
      end
      object TBXSeparatorItem1: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXSubmenuItemTbSetup: TTBXSubmenuItem
        Tag = 709
        Action = fSetup
        DropdownCombo = True
        OnSelect = ButtonOnSelect
        Caption = 'Setup'
        object TBXItemOOLex: TTBXItem
          Action = fCustomizeLexer
          OnSelect = ButtonOnSelect
        end
        object TBXItemOOLexSt: TTBXItem
          Action = fCustomizeHi
          OnSelect = ButtonOnSelect
          Caption = 'Customize lexer &styles...'
          Hint = 'Customize current lexer'#39's highlighting properties'
        end
        object TBXItemOOLexLib: TTBXItem
          Action = fCustomizeLexerLib
          OnSelect = ButtonOnSelect
        end
      end
      object TBXSeparatorItem48: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemTbSpellLive: TTBXSubmenuItem
        Action = ecSpellLive
        DropdownCombo = True
        ImageIndex = 44
        OnSelect = ButtonOnSelect
        Caption = 'Live spelling'
        Hint = 'Enable live spelling (red underlines)'
        object TBXItemTbSpellCheck: TTBXItem
          ImageIndex = 43
          OnClick = TBXItemTbSpellCheckClick
          OnSelect = ButtonOnSelect
          Caption = 'Spell check'
          Hint = 'Perform spell checking of current document'
        end
      end
    end
    object tbEdit: TTBXToolbar
      Left = 303
      Top = 0
      DockPos = 204
      Images = ImageListIconsStd
      TabOrder = 1
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'Edit'
      object TBXItemTbCopy: TTBXItem
        Tag = 301
        Action = ecCopy
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbCut: TTBXItem
        Tag = 302
        Action = ecCut
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbPaste: TTBXItem
        Tag = 303
        Action = ecPaste
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbDel: TTBXItem
        Tag = 307
        Action = ecClear
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbSelAll: TTBXItem
        Tag = 306
        Action = ecSelectAll
        OnSelect = ButtonOnSelect
        Hint = 'Select all'
      end
      object TBXSeparatorItem3: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemTbUndo: TTBXItem
        Tag = 304
        Action = ecUndo
        OnSelect = ButtonOnSelect
      end
      object TBXItemTbRedo: TTBXItem
        Tag = 305
        Action = ecRedo
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem4: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXSubmenuItemSort: TTBXSubmenuItem
        Action = ecSortDialog
        DropdownCombo = True
        ImageIndex = 16
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        Caption = 'Sort'
        Hint = 'Show "Sort lines" dialog'
        object TBXItemTbSortDialog: TTBXItem
          OnClick = TBXItemTbSortDialogClick
          OnSelect = ButtonOnSelect
          Caption = 'Sort dialog...'
          Hint = 'Show "Sort lines" dialog'
        end
        object TBXSeparatorItem86: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemTbSortAsc: TTBXItem
          Tag = 562
          ImageIndex = 16
          OnClick = TBXItemTbSortAscClick
          OnSelect = ButtonOnSelect
          Caption = 'Sort ascending'
          Hint = 'Sort selection ascending'
        end
        object TBXItemTbSortDesc: TTBXItem
          Tag = 563
          ImageIndex = 17
          OnClick = TBXItemTbSortDescClick
          OnSelect = ButtonOnSelect
          Caption = 'Sort descending'
          Hint = 'Sort selection descending'
        end
        object TBXSeparatorItem85: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemTbDedupAll: TTBXItem
          OnClick = TBXItemTbDedupAllClick
          OnSelect = ButtonOnSelect
          Caption = 'Remove all duplicates'
          Hint = ''
        end
        object TBXItemTbDedupAdjacent: TTBXItem
          OnClick = TBXItemTbDedupAdjacentClick
          OnSelect = ButtonOnSelect
          Caption = 'Remove adjacent duplicates'
          Hint = ''
        end
      end
      object TBXSubmenuCase: TTBXSubmenuItem
        ImageIndex = 18
        Options = [tboDropdownArrow]
        OnSelect = ButtonOnSelect
        Caption = 'Change case'
        Hint = 'Selection case changing'
        object TBXItemCCUpper: TTBXItem
          Tag = 365
          OnClick = TBXItemCCUpperClick
          OnSelect = ButtonOnSelect
          Caption = 'UPPER CASE'
          Hint = 'Selection - to upper case'
        end
        object TBXItemCCLower: TTBXItem
          Tag = 366
          OnClick = TBXItemCCLowerClick
          OnSelect = ButtonOnSelect
          Caption = 'lower case'
          Hint = 'Selection - to lower case'
        end
        object TBXItemCCTitle: TTBXItem
          Tag = 368
          OnClick = TBXItemCCTitleClick
          OnSelect = ButtonOnSelect
          Caption = 'Title Case'
          Hint = 'Selection - to title case'
        end
        object TBXItemCCSent: TTBXItem
          Tag = 369
          OnClick = TBXItemCCSentClick
          OnSelect = ButtonOnSelect
          Caption = 'Sentence case'
          Hint = 'Selection - to sentence case'
        end
        object TBXItemCCInv: TTBXItem
          Tag = 365
          OnClick = TBXItemCCInvClick
          OnSelect = ButtonOnSelect
          Caption = 'iNVERT cASE'
          Hint = 'Invert selection case'
        end
      end
    end
  end
  object TBXDockLeft: TTBXDock
    Left = 0
    Top = 50
    Width = 201
    Height = 384
    Position = dpLeft
    object tbView: TTBXToolbar
      Left = 174
      Top = 0
      DockPos = -8
      DockRow = 1
      Images = ImageListIconsStd
      TabOrder = 0
      OnClose = tbQsClose
      OnMove = tbViewMove
      Caption = 'View'
      object TBXItemVTree: TTBXItem
        Tag = 715
        Action = ecTree
        OnSelect = ButtonOnSelect
        Caption = 'Toggle structure/project'
        Hint = 'Toggle structure/project panel'
      end
      object TBXItemVFold: TTBXItem
        Tag = 732
        Action = ecFold
        OnSelect = ButtonOnSelect
      end
      object TBXItemVWrap: TTBXItem
        Tag = 730
        Action = ecWrap
        OnSelect = ButtonOnSelect
      end
      object TBXItemVNums: TTBXItem
        Tag = 731
        Action = ecLines
        OnSelect = ButtonOnSelect
      end
      object TBXItemVNonpr: TTBXItem
        Tag = 733
        Action = ecNPrint
        OnSelect = ButtonOnSelect
      end
      object TBXItemVOut: TTBXItem
        Action = ecOut
        ImageIndex = 40
        OnSelect = ButtonOnSelect
        Hint = 'Toggle output panel'
      end
      object TBXSeparatorItem2: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemVComm: TTBXItem
        Tag = 560
        Action = ecCommentLines
        OnSelect = ButtonOnSelect
        Hint = 'Comment selected lines'
      end
      object TBXItemVUncom: TTBXItem
        Tag = 561
        Action = ecUnCommentLines
        OnSelect = ButtonOnSelect
        Hint = 'Uncomment selected lines'
      end
      object TBXSeparatorItem10: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemVInd: TTBXItem
        Tag = 350
        Action = ecIndent
        OnSelect = ButtonOnSelect
      end
      object TBXItemVUnind: TTBXItem
        Tag = 351
        Action = ecUnindent
        OnSelect = ButtonOnSelect
      end
      object TBXSeparatorItem44: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemVSyncH: TTBXItem
        Action = ecSyncH
        OnSelect = ButtonOnSelect
        Hint = 'Synchronize horizontal scrolling'
      end
      object TBXItemVSyncV: TTBXItem
        Action = ecSyncV
        OnSelect = ButtonOnSelect
        Hint = 'Synchronize vertical scrolling'
      end
    end
    object plTree: TTBXDockablePanel
      Left = 0
      Top = 0
      ActivateParent = False
      Align = alClient
      DockableTo = [dpLeft, dpRight]
      DockedWidth = 170
      DockPos = 0
      FloatingWidth = 173
      FloatingHeight = 300
      HideWhenInactive = False
      TabOrder = 1
      OnContextPopup = plTreeContextPopup
      OnMove = tbViewMove
      OnResize = plTreeResize
      OnVisibleChanged = plTreeVisibleChanged
      object Tree: TSyntaxTreeView
        Left = 0
        Top = 0
        Width = 170
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
      object tbPlLeft: TTBXToolbar
        Left = 0
        Top = 343
        Width = 170
        Height = 19
        Align = alBottom
        TabOrder = 1
        object TBXItemLeftTree: TTBXItem
          OnClick = TBXItemLeftTreeClick
          Caption = 'Tree'
          Hint = ''
        end
        object TBXItemLeftProj: TTBXItem
          OnClick = TBXItemLeftProjClick
          Caption = 'Project'
          Hint = ''
        end
        object TBXItemLeftTabs: TTBXItem
          OnClick = TBXItemLeftTabsClick
          Caption = 'Tabs'
          Hint = ''
        end
      end
      object ListTabs: TTntListView
        Left = 0
        Top = 109
        Width = 170
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
        PopupMenu = PopupTb
        SmallImages = ImageListFtp
        SortType = stText
        TabOrder = 2
        ViewStyle = vsReport
        OnClick = ListTabsClick
        OnColumnClick = ListTabsColumnClick
        OnCompare = ListTabsCompare
        OnKeyDown = ListTabsKeyDown
      end
    end
  end
  object TBXDockBottom: TTBXDock
    Left = 0
    Top = 434
    Width = 768
    Height = 171
    Position = dpBottom
    object tbQs: TTBXToolbar
      Left = 0
      Top = 139
      CloseButtonWhenDocked = True
      DockableTo = [dpTop, dpBottom]
      DockPos = 0
      DockRow = 1
      Images = ImageListIconsTango22
      TabOrder = 0
      OnClose = tbQsClose
      Caption = 'Quick search'
      object TBControlItem1aa: TTBControlItem
        Control = edQs
        Caption = ''
        Hint = ''
      end
      object TBXItemFFNext: TTBXItem
        Enabled = False
        ImageIndex = 36
        OnClick = TBXItemFFNextClick
        Caption = 'Next'
        Hint = 'Find next'
      end
      object TBXItemFFPrev: TTBXItem
        Enabled = False
        ImageIndex = 37
        OnClick = TBXItemFFPrevClick
        Caption = 'Previous'
        Hint = 'Find previous'
      end
      object cbCase: TTBXItem
        ImageIndex = 38
        OnClick = cbCaseClick
        Caption = 'Case sensitive'
        Hint = 'Case sensitive'
      end
      object cbWord: TTBXItem
        ImageIndex = 39
        OnClick = cbWordClick
        Caption = 'Whole words'
        Hint = 'Whole words only'
      end
      object edQs: TTntEdit
        Left = 0
        Top = 3
        Width = 121
        Height = 21
        Hint = 'Quick search'
        TabOrder = 0
        OnChange = edQsChange
        OnExit = edQsExit
        OnKeyDown = edQsKeyDown
      end
    end
    object plOut: TTBXDockablePanel
      Left = 0
      Top = 0
      CaptionRotation = dpcrAlwaysHorz
      DockedHeight = 135
      DockPos = 0
      TabOrder = 1
      OnContextPopup = plOutContextPopup
      OnMove = tbViewMove
      OnResize = plOutResize
      OnVisibleChanged = plOutVisibleChanged
      Caption = 'Output'
      object ListOut: TTntListBox
        Left = 0
        Top = 0
        Width = 112
        Height = 98
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
      object tbPlOut: TTBXToolbar
        Left = 0
        Top = 98
        Width = 764
        Height = 19
        Align = alBottom
        TabOrder = 1
        object TBXItemOOOut: TTBXItem
          OnClick = TBXItemOOOutClick
          Caption = 'Output'
          Hint = ''
        end
        object TBXItemOOFind: TTBXItem
          OnClick = TBXItemOOFindClick
          Caption = 'Search Results'
          Hint = ''
        end
        object TBXItemOOVal: TTBXItem
          OnClick = TBXItemOOValClick
          Caption = 'Validation'
          Hint = ''
        end
        object TBXItemOOPLog: TTBXItem
          Visible = False
          OnClick = TBXItemOOPLogClick
          Caption = ''
          Hint = ''
        end
      end
      object ListVal: TTntListBox
        Left = 112
        Top = 0
        Width = 112
        Height = 98
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
        TabOrder = 2
        OnDblClick = ListValDblClick
        OnDrawItem = ListOutDrawItem
        OnKeyDown = ListValKeyDown
        OnMouseMove = ListOutMouseMove
      end
      object TreeFind: TTntTreeView
        Left = 224
        Top = 0
        Width = 113
        Height = 98
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
        TabOrder = 3
        OnAdvancedCustomDrawItem = TreeFindAdvancedCustomDrawItem
        OnCustomDrawItem = TreeFindCustomDrawItem
        OnDblClick = TreeFindDblClick
        OnKeyDown = TreeFindKeyDown
        OnKeyPress = TreeKeyPress
      end
      object ListPLog: TTntListBox
        Left = 337
        Top = 0
        Width = 121
        Height = 98
        Style = lbOwnerDrawFixed
        Align = alLeft
        ItemHeight = 13
        MultiSelect = True
        PopupMenu = PopupPluginsLog
        TabOrder = 4
        OnDrawItem = ListPLogDrawItem
        OnKeyDown = ListPLogKeyDown
        OnMouseMove = ListOutMouseMove
      end
    end
  end
  object TBXDockRight: TTBXDock
    Left = 636
    Top = 50
    Width = 132
    Height = 384
    Position = dpRight
    object plClip: TTBXDockablePanel
      Left = 0
      Top = 0
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnContextPopup = plClipContextPopup
      OnResize = plClipResize
      OnVisibleChanged = plClipVisibleChanged
      object tbClipMap: TTBXToolbar
        Left = 0
        Top = 343
        Width = 128
        Height = 19
        Align = alBottom
        TabOrder = 0
        object TBXItemRightClip: TTBXItem
          OnClick = TBXItemRightClipClick
          Caption = 'Clipboard'
          Hint = ''
        end
        object TBXItemRightMap: TTBXItem
          OnClick = TBXItemRightMapClick
          Caption = 'Minimap'
          Hint = ''
        end
        object TBXItemRightClips: TTBXItem
          OnClick = TBXItemRightClipsClick
          Caption = 'Clips'
          Hint = ''
        end
      end
    end
  end
  object Status: TTBXStatusBar
    Left = 0
    Top = 605
    Width = 768
    Height = 19
    Images = ImageListStatus
    Panels = <
      item
        Alignment = taCenter
        Size = 155
        Tag = 0
      end
      item
        Alignment = taCenter
        Size = 100
        Tag = 0
        Hint = 'Encoding (click to change)'
      end
      item
        Alignment = taCenter
        Size = 35
        Tag = 0
        Hint = 'Line endings (click to change)'
      end
      item
        Alignment = taCenter
        Size = 130
        Tag = 0
        Hint = 'Lexer (click to change)'
      end
      item
        Alignment = taCenter
        Size = 80
        Tag = 0
        Hint = '"Char at cursor" info (click for Character Table)'
      end
      item
        Alignment = taCenter
        ImageIndex = 1
        Size = 20
        Tag = 0
        Hint = 'Read-only (click to change)'
      end
      item
        Alignment = taCenter
        ImageIndex = 3
        Size = 20
        Tag = 0
        Hint = 'Word-wrap mode (click to change)'
      end
      item
        ImageIndex = 5
        Size = 20
        Tag = 0
        Hint = 'Selection mode (click to change)'
      end
      item
        Alignment = taCenter
        Size = 30
        Tag = 0
        Hint = 'Insert/Overwrite mode (click to change)'
      end
      item
        Alignment = taCenter
        Size = 40
        Tag = 0
        Hint = 'Zoom value (click to change)'
      end
      item
        Alignment = taCenter
        ImageIndex = 6
        Size = 20
        Tag = 0
      end
      item
        Size = 1500
        Tag = 0
      end>
    UseSystemFont = False
    OnPanelClick = StatusPanelClick
  end
  object Menu: TTBXDock
    Left = 0
    Top = 0
    Width = 768
    Height = 24
    object tbMenu: TTBXToolbar
      Left = 0
      Top = 0
      CloseButton = False
      DockMode = dmCannotFloatOrChangeDocks
      DockPos = 0
      MenuBar = True
      ProcessShortCuts = True
      ShrinkMode = tbsmWrap
      TabOrder = 0
      OnShortCut = tbMenuShortCut
      Caption = 'Menu'
      object TBXSubmenuItemFile: TTBXSubmenuItem
        Caption = '&File'
        Hint = ''
        object TBXSubmenuItemFNew: TTBXSubmenuItem
          OnPopup = TBXSubmenuItemFNewPopup
          OnSelect = ButtonOnSelect
          Caption = '&New'
          Hint = ''
          object TBXItemFNew: TTBXItem
            ImageIndex = 34
            OnClick = TBXItemFNewClick
            OnSelect = ButtonOnSelect
            Caption = 'New file'
            Hint = 'Create new file'
          end
          object TBXItemFNewWin: TTBXItem
            Action = fNewWin
            OnSelect = ButtonOnSelect
            Hint = 'Create new window'
          end
          object TBXSeparatorItem28: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
        end
        object TBXItemFOpen: TTBXItem
          Action = fOpen
          OnSelect = ButtonOnSelect
          Caption = '&Open...'
        end
        object TBXSubmenuItem25: TTBXSubmenuItem
          Caption = 'Recen&t files'
          Hint = ''
          object MRUtbx2: TTBXMRUListItem
            MRUList = MRU
            Caption = '(TBX MRU List)'
            Hint = ''
          end
          object TBXSeparatorItem30: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemFClr: TTBXItem
            OnClick = TBXItemFClrClick
            Caption = 'Clear list'
            Hint = ''
          end
        end
        object TBXItemFReopen: TTBXItem
          OnClick = TBXItemFReopenClick
          OnSelect = ButtonOnSelect
          Caption = '&Reopen'
          Hint = 'Reopen file'
        end
        object TBXItemFSave: TTBXItem
          Action = fSave
          OnSelect = ButtonOnSelect
          Caption = '&Save'
        end
        object TBXItemFSaveAs: TTBXItem
          Action = fSaveAs
          OnSelect = ButtonOnSelect
          Caption = 'Save &as...'
        end
        object TBXItemFSaveAll: TTBXItem
          Action = fSaveAll
          OnSelect = ButtonOnSelect
          Caption = 'Save a&ll'
          Hint = 'Save all tabs'
        end
        object TBXItemFRename: TTBXItem
          Action = fRename
          OnSelect = ButtonOnSelect
          Caption = 'Rename...'
          Hint = 'Rename current file'
        end
        object TBXItemFClose: TTBXItem
          Action = fClose
          OnSelect = ButtonOnSelect
          Caption = '&Close'
          Hint = 'Close current tab'
        end
        object TBXItemFCloseAll: TTBXItem
          Action = fCloseAll
          OnSelect = ButtonOnSelect
          Caption = 'Close all'
          Hint = 'Close all tabs'
        end
        object TBXItemFCloseOth: TTBXItem
          Action = fCloseOth
          OnSelect = ButtonOnSelect
          Caption = 'Close ot&her tabs'
          Hint = 'Close all but current tab'
        end
        object TBXItemFCloseDel: TTBXItem
          Action = fCloseDel
          OnSelect = ButtonOnSelect
          Caption = 'Close and &delete'
          Hint = 'Close current tab and delete its file'
        end
        object TBXSeparatorItem22: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemFProps: TTBXItem
          OnClick = TBXItemFPropsClick
          OnSelect = ButtonOnSelect
          Caption = 'Properties...'
          Hint = 'Show properties of current file/document'
        end
        object TBXItemFEmail: TTBXItem
          OnClick = TBXItemFEmailClick
          OnSelect = ButtonOnSelect
          Caption = 'Send to E-&mail'
          Hint = 'Send current file to e-mail via MS Outlook'
        end
        object TBXSubmenuItem12: TTBXSubmenuItem
          OnSelect = ButtonOnSelect
          Caption = 'Export'
          Hint = ''
          object TBXItemFExpHtml: TTBXItem
            Action = fExportHTMLAction
            OnSelect = ButtonOnSelect
            Caption = 'Export to &HTML...'
          end
          object TBXItemFExpRtf: TTBXItem
            Action = fExportRTFAction
            OnSelect = ButtonOnSelect
            Caption = 'Export to &RTF...'
          end
        end
        object TBXSeparatorItem16: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemFPrint: TTBXItem
          Action = ecPrintAction
          OnSelect = ButtonOnSelect
          Caption = '&Print...'
        end
        object TBXItemFPreview: TTBXItem
          Action = ecPreviewAction
          OnSelect = ButtonOnSelect
          Caption = 'Pre&view...'
        end
        object TBXItemFPageSetup: TTBXItem
          Action = ecPageSetupAction
          OnSelect = ButtonOnSelect
          Caption = 'Pa&ge setup...'
        end
        object TBXItemFPrinterSetup: TTBXItem
          Action = ecPrinterSetup
          OnSelect = ButtonOnSelect
          Caption = 'Print&er setup...'
        end
        object TBXSeparatorItem15: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubmenuFav: TTBXSubmenuItem
          OnPopup = TBXSubmenuFavPopup
          Caption = 'Favorites'
          Hint = ''
          object TBXItemFavAddFile: TTBXItem
            OnClick = TBXItemFavAddFileClick
            OnSelect = ButtonOnSelect
            Caption = 'Add current file'
            Hint = 'Add current file to favorites list'
          end
          object TBXItemFavAddProj: TTBXItem
            OnClick = TBXItemFavAddProjClick
            OnSelect = ButtonOnSelect
            Caption = 'Add current project'
            Hint = 'Add current project to favorites list'
          end
          object TBXItemFavManage: TTBXItem
            OnClick = TBXItemFavManageClick
            OnSelect = ButtonOnSelect
            Caption = 'Organize...'
            Hint = 'Manage favorites list'
          end
        end
        object TBXSubmenuItem2: TTBXSubmenuItem
          Caption = 'Sess&ions'
          Hint = ''
          object TBXItemFSesOpen: TTBXItem
            OnClick = TBXItemFSesOpenClick
            OnSelect = ButtonOnSelect
            Caption = '&Open session...'
            Hint = 'Open saved tabs list'
          end
          object TBXItemFSesAdd: TTBXItem
            OnClick = TBXItemFSesAddClick
            OnSelect = ButtonOnSelect
            Caption = 'Open/A&dd session...'
            Hint = 'Add saved tabs list to current tabs'
          end
          object TBXItemFSesSave: TTBXItem
            OnClick = TBXItemFSesSaveClick
            OnSelect = ButtonOnSelect
            Caption = '&Save session'
            Hint = 'Save tabs list (keep current session name)'
          end
          object TBXItemFSesSaveAs: TTBXItem
            OnClick = TBXItemFSesSaveAsClick
            OnSelect = ButtonOnSelect
            Caption = 'Save session &as...'
            Hint = 'Save tabs list to chosen file'
          end
          object TBXItemFSesClose: TTBXItem
            OnClick = TBXItemFSesCloseClick
            OnSelect = ButtonOnSelect
            Caption = '&Close session'
            Hint = 'Clear name of current tabs list'
          end
          object TBXSubmenuItemSess: TTBXSubmenuItem
            Caption = 'Recen&t sessions'
            Hint = ''
            object TBXMRUListItem1: TTBXMRUListItem
              MRUList = MRU_Sess
              Caption = '(TBX MRU List)'
              Hint = ''
            end
            object TBXSeparatorItem59: TTBXSeparatorItem
              Caption = ''
              Hint = ''
            end
            object TBXItemSessClr: TTBXItem
              OnClick = TBXItemSessClrClick
              Caption = '&Clear list'
              Hint = ''
            end
          end
        end
        object TBXSeparatorItem29: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemFExit: TTBXItem
          OnClick = TBXItemFExitClick
          OnSelect = ButtonOnSelect
          Caption = 'E&xit'
          Hint = 'Close editor'
        end
      end
      object TBXSubmenuItemEd: TTBXSubmenuItem
        OnPopup = TBXSubmenuItemEdPopup
        Caption = '&Edit'
        Hint = ''
        object TBXItemEUndo: TTBXItem
          ImageIndex = 12
          ShortCut = 16474
          OnClick = TBXItemEUndoClick
          OnSelect = ButtonOnSelect
          Caption = '&Undo'
          Hint = 'Undo last action'
        end
        object TBXItemERedo: TTBXItem
          ImageIndex = 13
          ShortCut = 24666
          OnClick = TBXItemERedoClick
          OnSelect = ButtonOnSelect
          Caption = '&Redo'
          Hint = 'Redo last undone action'
        end
        object TBXSeparatorItem6: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemECut: TTBXItem
          ImageIndex = 8
          ShortCut = 16472
          OnClick = TBXItemECutClick
          OnSelect = ButtonOnSelect
          Caption = '&Cut'
          Hint = 'Cut selection to clipboard'
        end
        object TBXItemECopy: TTBXItem
          ImageIndex = 7
          ShortCut = 16451
          OnClick = TBXItemECopyClick
          OnSelect = ButtonOnSelect
          Caption = 'C&opy'
          Hint = 'Copy selection to clipboard'
        end
        object TBXItemEPaste: TTBXItem
          ImageIndex = 9
          ShortCut = 16470
          OnClick = TBXItemEPasteClick
          OnSelect = ButtonOnSelect
          Caption = '&Paste'
          Hint = 'Paste clipboard'
        end
        object TBXItemEDelete: TTBXItem
          ImageIndex = 10
          ShortCut = 16430
          OnClick = TBXItemEDeleteClick
          OnSelect = ButtonOnSelect
          Caption = '&Delete'
          Hint = 'Clear current selection'
        end
        object TBXItemESelectAll: TTBXItem
          ImageIndex = 11
          ShortCut = 16449
          OnClick = TBXItemESelectAllClick
          OnSelect = ButtonOnSelect
          Caption = '&Select all'
          Hint = 'Select all text'
        end
        object TBXSeparatorItem35: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubmenuItem18: TTBXSubmenuItem
          Caption = 'Copy to clipboard'
          Hint = ''
          object TBXItemECopyLine: TTBXItem
            OnClick = TBXItemECopyLineClick
            OnSelect = ButtonOnSelect
            Caption = 'Copy current line'
            Hint = 'Copy current line to clipboard'
          end
          object TBXItemECutLine: TTBXItem
            OnClick = TBXItemECutLineClick
            OnSelect = ButtonOnSelect
            Caption = 'Cut current line'
            Hint = 'Cut current line to clipboard'
          end
          object TBXSeparatorItem54: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemECopyApp: TTBXItem
            OnClick = TBXItemECopyAppClick
            OnSelect = ButtonOnSelect
            Caption = 'Copy/Append'
            Hint = 'Copy selection and append to clipboard'
          end
          object TBXItemECutApp: TTBXItem
            OnClick = TBXItemECutAppClick
            OnSelect = ButtonOnSelect
            Caption = 'Cut/Append'
            Hint = 'Cut selection and append to clipboard'
          end
          object TBXSeparatorItem17: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemECpFN: TTBXItem
            OnClick = TBXItemECpFNClick
            Caption = 'Copy filename to clipboard'
            Hint = ''
          end
          object TBXItemECpFullPath: TTBXItem
            OnClick = TBXItemECpFullPathClick
            Caption = 'Copy full path to clipboard'
            Hint = ''
          end
          object TBXItemECpDirPath: TTBXItem
            OnClick = TBXItemECpDirPathClick
            Caption = 'Copy dir path to clipboard'
            Hint = ''
          end
        end
        object TBXSubmenuItem16: TTBXSubmenuItem
          Caption = 'Indents'
          Hint = ''
          object TBXItemEIndent: TTBXItem
            ImageIndex = 14
            ShortCut = 16393
            OnClick = TBXItemEIndentClick
            OnSelect = ButtonOnSelect
            Caption = '&Indent'
            Hint = 'Indent selection'
          end
          object TBXItemEUnindent: TTBXItem
            ImageIndex = 15
            ShortCut = 8201
            OnClick = TBXItemEUnindentClick
            OnSelect = ButtonOnSelect
            Caption = 'Unind&ent'
            Hint = 'Unindent selection'
          end
          object TBXSeparatorItem33: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemEIndentLike1st: TTBXItem
            OnClick = TBXItemEIndentLike1stClick
            OnSelect = ButtonOnSelect
            Caption = 'Indent like 1st line'
            Hint = 'Make all selection lines indents equal to first line'#39's one'
          end
        end
        object TBXSubmenuItem17: TTBXSubmenuItem
          Caption = 'Line operations'
          Hint = ''
          object TBXItemEDup: TTBXItem
            OnClick = TBXItemEDupClick
            OnSelect = ButtonOnSelect
            Caption = '&Duplicate line'
            Hint = 'Duplicate current line'
          end
          object TBXItemEDelLn: TTBXItem
            OnClick = TBXItemEDelLnClick
            OnSelect = ButtonOnSelect
            Caption = 'D&elete line'
            Hint = 'Delete current line'
          end
          object TBXSeparatorItem49: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemEJoin: TTBXItem
            OnClick = TBXItemEJoinClick
            OnSelect = ButtonOnSelect
            Caption = '&Join lines'
            Hint = 'Join (concatenate) selected lines'
          end
          object TBXItemESplit: TTBXItem
            OnClick = TBXItemESplitClick
            OnSelect = ButtonOnSelect
            Caption = '&Split lines'
            Hint = 'Split current line/ selected lines to shorter lines'
          end
          object TBXSeparatorItem47: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemEMoveUp: TTBXItem
            OnClick = TBXItemEMoveUpClick
            OnSelect = ButtonOnSelect
            Caption = 'Move lines &up'
            Hint = 'Move selected line(s) up'
          end
          object TBXItemEMoveDn: TTBXItem
            OnClick = TBXItemEMoveDnClick
            OnSelect = ButtonOnSelect
            Caption = 'Move lines &down'
            Hint = 'Move selected line(s) down'
          end
        end
        object TBXSubmenuItem1: TTBXSubmenuItem
          Caption = 'Blank operations'
          Hint = ''
          object TBXItemERemBlanks: TTBXItem
            OnClick = TBXItemERemBlanksClick
            OnSelect = ButtonOnSelect
            Caption = '&Remove blank lines'
            Hint = 'Remove blank lines (from selection or all document)'
          end
          object TBXItemEReduceBlanks: TTBXItem
            OnClick = TBXItemEReduceBlanksClick
            OnSelect = ButtonOnSelect
            Caption = 'Reduce &blank lines'
            Hint = 'Remove adjacent duplicate blank lines'
          end
          object TBXSeparatorItem60: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemETrimLead: TTBXItem
            OnClick = TBXItemETrimLeadClick
            OnSelect = ButtonOnSelect
            Caption = 'Trim &leading spaces'
            Hint = 'Remove leading spaces from lines'
          end
          object TBXItemETrimTrail: TTBXItem
            OnClick = TBXItemETrimTrailClick
            OnSelect = ButtonOnSelect
            Caption = 'Trim &trailing spaces'
            Hint = 'Remove trailing spaces from lines'
          end
          object TBXItemETrimAll: TTBXItem
            OnClick = TBXItemETrimAllClick
            OnSelect = ButtonOnSelect
            Caption = 'Trim leading/trailing &spaces'
            Hint = 'Remove leading+trailing spaces from lines'
          end
          object TBXItemERemDupSp: TTBXItem
            OnClick = TBXItemERemDupSpClick
            OnSelect = ButtonOnSelect
            Caption = 'Remove &duplicate spaces'
            Hint = 'Remove duplicate (adjacent) spaces from lines'
          end
          object TBXSeparatorItem61: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemETabToSp: TTBXItem
            OnClick = TBXItemETabToSpClick
            OnSelect = ButtonOnSelect
            Caption = 'T&abs to spaces'
            Hint = 'Replace Tab characters to spaces'
          end
          object TBXItemESpToTab: TTBXItem
            OnClick = TBXItemESpToTabClick
            OnSelect = ButtonOnSelect
            Caption = 'Spac&es to tabs (all)'
            Hint = 'Replace spaces to Tab characters'
          end
          object TBXItemESpToTabLead: TTBXItem
            OnClick = TBXItemESpToTabLeadClick
            OnSelect = ButtonOnSelect
            Caption = 'Spaces to tabs (leading)'
            Hint = 'Replace leading spaces to Tab characters'
          end
          object TBXSeparatorItem83: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemECenterLines: TTBXItem
            OnClick = TBXItemECenterLinesClick
            OnSelect = ButtonOnSelect
            Caption = 'Center lines'
            Hint = 'Center selected lines by right margin position'
          end
          object TBXItemEAlignWithSep: TTBXItem
            OnClick = TBXItemEAlignWithSepClick
            OnSelect = ButtonOnSelect
            Caption = 'Align by separator...'
            Hint = 'Align two columns, separated by some substring'
          end
        end
        object TBXSubmenuItem13: TTBXSubmenuItem
          Caption = 'Comments'
          Hint = ''
          object TBXItemEToggleLineComment: TTBXItem
            OnClick = TBXItemEToggleLineCommentClick
            OnSelect = ButtonOnSelect
            Caption = 'Toggle &block comment'
            Hint = 'Toggle line comment for selected lines'
          end
          object TBXItemEToggleLineCommentAlt: TTBXItem
            OnClick = TBXItemEToggleLineCommentAltClick
            OnSelect = ButtonOnSelect
            Caption = 'Toggle block comment (alt.)'
            Hint = 
              'Toggle line comment (comment chars placed on 1st non-space posit' +
              'ion)'
          end
          object TBXItemEComm: TTBXItem
            ImageIndex = 21
            OnClick = TBXItemECommClick
            OnSelect = ButtonOnSelect
            Caption = 'Block &comment'
            Hint = 'Comment selected lines'
          end
          object TBXItemEUncomm: TTBXItem
            ImageIndex = 22
            OnClick = TBXItemEUncommClick
            OnSelect = ButtonOnSelect
            Caption = 'Block &uncomment'
            Hint = 'Uncomment selected lines'
          end
          object TBXItemEToggleStreamComment: TTBXItem
            OnClick = TBXItemEToggleStreamCommentClick
            OnSelect = ButtonOnSelect
            Caption = 'Toggle &stream comment'
            Hint = 'Toggle stream comment for selected lines'
          end
        end
        object TBXSubmenuItem19: TTBXSubmenuItem
          ImageIndex = 16
          Options = [tboDropdownArrow]
          OnSelect = ButtonOnSelect
          Caption = 'Sorting'
          Hint = ''
          object TBXItemESortDialog: TTBXItem
            OnClick = TBXItemESortDialogClick
            OnSelect = ButtonOnSelect
            Caption = '&Sort dialog...'
            Hint = 'Show "Sort lines" dialog'
          end
          object TBXSeparatorItem95: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemESortAsc: TTBXItem
            Tag = 562
            ImageIndex = 16
            OnClick = TBXItemESortAscClick
            OnSelect = ButtonOnSelect
            Caption = 'Sort &ascending'
            Hint = 'Sort selection ascending'
          end
          object TBXItemESortDesc: TTBXItem
            Tag = 563
            ImageIndex = 17
            OnClick = TBXItemESortDescClick
            OnSelect = ButtonOnSelect
            Caption = 'Sort &descending'
            Hint = 'Sort selection descending'
          end
          object TBXSeparatorItem94: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemEDedupAll: TTBXItem
            OnClick = TBXItemEDedupAllClick
            OnSelect = ButtonOnSelect
            Caption = 'Remove all duplicates'
            Hint = ''
          end
          object TBXItemEDedupAdjacent: TTBXItem
            OnClick = TBXItemEDedupAdjacentClick
            OnSelect = ButtonOnSelect
            Caption = 'Remove adjacent duplicates'
            Hint = ''
          end
        end
        object TBXSubmenuItem20: TTBXSubmenuItem
          ImageIndex = 18
          Options = [tboDropdownArrow]
          OnSelect = ButtonOnSelect
          Caption = 'Change case'
          Hint = ''
          object TBXItemECaseUpper: TTBXItem
            Tag = 365
            ImageIndex = 20
            ShortCut = 16459
            OnClick = TBXItemECaseUpperClick
            OnSelect = ButtonOnSelect
            Caption = '&UPPER CASE'
            Hint = 'Selection - to upper case'
          end
          object TBXItemECaseLower: TTBXItem
            Tag = 366
            ImageIndex = 19
            ShortCut = 16459
            OnClick = TBXItemECaseLowerClick
            OnSelect = ButtonOnSelect
            Caption = '&lower case'
            Hint = 'Selection - to lower case'
          end
          object TBXItemECaseTitle: TTBXItem
            Tag = 368
            ImageIndex = 18
            OnClick = TBXItemECaseTitleClick
            OnSelect = ButtonOnSelect
            Caption = '&Title Case'
            Hint = 'Selection - to title case'
          end
          object TBXItemECaseSent: TTBXItem
            Tag = 369
            OnClick = TBXItemECaseSentClick
            OnSelect = ButtonOnSelect
            Caption = 'Sentence case'
            Hint = 'Selection - to sentence case'
          end
          object TBXItemECaseInvert: TTBXItem
            Tag = 365
            OnClick = TBXItemECaseInvertClick
            OnSelect = ButtonOnSelect
            Caption = '&iNVERT cASE'
            Hint = 'Invert selection case'
          end
        end
        object TBXSubmenuItemAbbrev: TTBXSubmenuItem
          Caption = 'Abbreviations'
          Hint = ''
          object TBXItemEZenExpand: TTBXItem
            OnClick = TBXItemEZenExpandClick
            OnSelect = ButtonOnSelect
            Caption = 'Emmet - Expand abbreviation'
            Hint = ''
          end
          object TBXItemEZenWrap: TTBXItem
            OnClick = TBXItemEZenWrapClick
            OnSelect = ButtonOnSelect
            Caption = 'Emmet - Wrap with abbreviation...'
            Hint = ''
          end
        end
        object TbxSubmenuCarets: TTBXSubmenuItem
          Caption = 'Multi-carets'
          Hint = ''
          object TBXItemCaretsRemove1: TTBXItem
            OnClick = TBXItemCaretsRemove1Click
            Caption = 'Remove carets, leave first'
            Hint = ''
          end
          object TBXItemCaretsRemove2: TTBXItem
            OnClick = TBXItemCaretsRemove2Click
            Caption = 'Remove carets, leave last'
            Hint = ''
          end
          object TBXSeparatorItem91: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemCaretsFromSelLeft: TTBXItem
            OnClick = TBXItemCaretsFromSelLeftClick
            Caption = 'Carets from selection, left edge'
            Hint = ''
          end
          object TBXItemCaretsFromSelRight: TTBXItem
            OnClick = TBXItemCaretsFromSelRightClick
            Caption = 'Carets from selection, right edge'
            Hint = ''
          end
          object TBXItemCaretsFromSelClear: TTBXItem
            OnClick = TBXItemCaretsFromSelClearClick
            Caption = 'Carets from selection, delete selection'
            Hint = ''
          end
          object TBXSeparatorItem93: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemCaretsFromMarksLeft: TTBXItem
            OnClick = TBXItemCaretsFromMarksLeftClick
            Caption = 'Carets from search marks, left edge'
            Hint = ''
          end
          object TBXItemCaretsFromMarksRight: TTBXItem
            OnClick = TBXItemCaretsFromMarksRightClick
            Caption = 'Carets from search marks, right edge'
            Hint = ''
          end
          object TBXItemCaretsFromMarksClear: TTBXItem
            OnClick = TBXItemCaretsFromMarksClearClick
            Caption = 'Carets from search marks, delete marks'
            Hint = ''
          end
          object TBXSeparatorItem92: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemCaretsExtUpLine: TTBXItem
            OnClick = TBXItemCaretsExtUpLineClick
            Caption = 'Extend carets up 1 line'
            Hint = ''
          end
          object TBXItemCaretsExtDownLine: TTBXItem
            OnClick = TBXItemCaretsExtDownLineClick
            Caption = 'Extend carets down 1 line'
            Hint = ''
          end
          object TBXItemCaretsExtUpPage: TTBXItem
            OnClick = TBXItemCaretsExtUpPageClick
            Caption = 'Extend carets up 1 page'
            Hint = ''
          end
          object TBXItemCaretsExtDownPage: TTBXItem
            OnClick = TBXItemCaretsExtDownPageClick
            Caption = 'Extend carets down 1 page'
            Hint = ''
          end
          object TBXItemCaretsExtUpEnd: TTBXItem
            OnClick = TBXItemCaretsExtUpEndClick
            Caption = 'Extend carets up till beginning'
            Hint = ''
          end
          object TBXItemCaretsExtDownEnd: TTBXItem
            OnClick = TBXItemCaretsExtDownEndClick
            Caption = 'Extend carets down till end'
            Hint = ''
          end
        end
        object TBXSeparatorItem39: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemETable: TTBXItem
          OnClick = TBXItemETableClick
          OnSelect = ButtonOnSelect
          Caption = 'Insert character'
          Hint = 'Show "Character Table" dialog'
        end
        object TBXItemEInsText: TTBXItem
          OnClick = TBXItemEInsTextClick
          OnSelect = ButtonOnSelect
          Caption = 'Insert text...'
          Hint = 'Show "Insert text" dialog'
        end
        object TBXItemEColor: TTBXItem
          Action = ecInsertColor
          OnSelect = ButtonOnSelect
          Caption = 'Insert color...'
          Hint = 'Show "Color picker" dialog'
        end
        object TBXItemEImage: TTBXItem
          Action = ecInsertImage
          OnSelect = ButtonOnSelect
          Caption = 'Insert image tag...'
          Hint = 'Show file dialog for inserting <img> tag'
        end
        object TBXItemETime: TTBXItem
          OnClick = TBXItemETimeClick
          OnSelect = ButtonOnSelect
          Caption = 'Insert date/time'
          Hint = 'Insert current date/time into text'
        end
        object TBXSeparatorItem71: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemEColumn: TTBXItem
          OnClick = TBXItemEColumnClick
          OnSelect = ButtonOnSelect
          Caption = 'Edit column'
          Hint = 'Edit all lines of column selection at once'
        end
        object TBXItemEFillBlock: TTBXItem
          OnClick = TBXItemEFillBlockClick
          OnSelect = ButtonOnSelect
          Caption = 'Fill block...'
          Hint = 'Fill column block lines with custom string'
        end
        object TBXItemESyncEd: TTBXItem
          OnClick = TBXItemESyncEdClick
          OnSelect = ButtonOnSelect
          Caption = 'Toggle S&yncEditing'
          Hint = 'Start/cancel Synchronized Editing mode'
        end
        object TBXItemERepeatCmd: TTBXItem
          Action = ecRepeatCmd
          OnSelect = ButtonOnSelect
          Caption = 'Repeat last edit command'
          Hint = 'Repeat last command which edits text'
        end
        object TBXItemECommandList: TTBXItem
          Action = ecCommandsList
          OnSelect = ButtonOnSelect
          Caption = 'Show commands list'
          Hint = 'Show "Commands list" dialog'
        end
      end
      object TBXSubmenuItemSr: TTBXSubmenuItem
        Caption = '&Search'
        Hint = ''
        object TBXItemSFind: TTBXItem
          Action = ecFind
          OnSelect = ButtonOnSelect
          Caption = '&Find...'
          Hint = 'Show "Find" dialog'
        end
        object TBXItemSNext: TTBXItem
          OnClick = TBXItemFNextClick
          OnSelect = ButtonOnSelect
          Caption = 'Find &next'
          Hint = 'Find next occurance of search string'
        end
        object TBXItemSPrev: TTBXItem
          OnClick = TBXItemFPrevClick
          OnSelect = ButtonOnSelect
          Caption = 'Find &previous'
          Hint = 'Find previous occurance of search string'
        end
        object TBXItemQs: TTBXItem
          OnClick = TBXItemQsClick
          OnSelect = ButtonOnSelect
          Caption = '&Quick search'
          Hint = 'Show "Quick Search" panel'
        end
        object TBXItemSRep: TTBXItem
          Action = ecReplace
          OnSelect = ButtonOnSelect
          Caption = '&Replace...'
          Hint = 'Show "Replace" dialog'
        end
        object TBXItemSRepFiles: TTBXItem
          Action = ecReplaceInFiles
          OnSelect = ButtonOnSelect
          Caption = 'Find/replace in fil&es...'
        end
        object TBXItemEExtr: TTBXItem
          OnClick = TBXItemEExtrClick
          OnSelect = ButtonOnSelect
          Caption = 'E&xtract strings...'
          Hint = 'Show "Extract strings" dialog'
        end
        object TBXSeparatorItem19: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemSWordNext: TTBXItem
          OnClick = TBXItemWNextClick
          OnSelect = ButtonOnSelect
          Caption = 'Find current &word next'
          Hint = 'Find next occurance of word at caret'
        end
        object TBXItemSWordPrior: TTBXItem
          OnClick = TBXItemWPriorClick
          OnSelect = ButtonOnSelect
          Caption = 'Find current w&ord prior'
          Hint = 'Find previous occurance of word at caret'
        end
        object TBXSeparatorItem20: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemSMarkAll: TTBXItem
          OnClick = TBXItemSMarkAllClick
          OnSelect = ButtonOnSelect
          Caption = '&Mark all occurrences'
          Hint = 'Mark all occurrences of search string (place search marks)'
        end
        object TBXItemSMarkNext: TTBXItem
          OnClick = TBXItemSMarkNextClick
          OnSelect = ButtonOnSelect
          Caption = 'Ne&xt search mark'
          Hint = 'Go to next search mark'
        end
        object TBXItemSMarkPrev: TTBXItem
          OnClick = TBXItemSMarkPrevClick
          OnSelect = ButtonOnSelect
          Caption = 'Previous &search mark'
          Hint = 'Go to previous search mark'
        end
        object TBXItemSMarkClear: TTBXItem
          OnClick = TBXItem2Click
          OnSelect = ButtonOnSelect
          Caption = '&Clear search marks'
          Hint = 'Clear search marks, which were left by "Find all" command'
        end
        object TBXSeparatorItem40: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemSResNext: TTBXItem
          Action = ecGotoNextFindResult
          OnSelect = ButtonOnSelect
          Caption = 'Next mass search result'
          Hint = 'Open next result of "Find in files" operation'
        end
        object TBXItemSResPrev: TTBXItem
          Action = ecGotoPrevFindResult
          OnSelect = ButtonOnSelect
          Caption = 'Previous mass search result'
          Hint = 'Open previous result of "Find in files" operation'
        end
        object TBXSeparatorItem21: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemSSelToken: TTBXItem
          OnClick = TBXItemSSelTokenClick
          OnSelect = ButtonOnSelect
          Caption = 'Select token'
          Hint = 'Select entire token at current caret position'
        end
        object TBXItemSSelBrackets: TTBXItem
          OnClick = TBXItemSSelBracketsClick
          OnSelect = ButtonOnSelect
          Caption = 'Select brackets'
          Hint = 'Select the range from the current bracket to matching one'
        end
        object TBXItemSGoBracket: TTBXItem
          OnClick = TBXItemSGoBracketClick
          OnSelect = ButtonOnSelect
          Caption = 'Go to matching bracket'
          Hint = 'Go to bracket, which matches the bracket under caret'
        end
        object TBXItemSGoto: TTBXItem
          Action = ecGoto
          OnSelect = ButtonOnSelect
          Caption = '&Go to line...'
          Hint = 'Show "Go to" dialog'
        end
        object TBXItemSGotoFile: TTBXItem
          Action = ecProjectList
          OnSelect = ButtonOnSelect
          Caption = 'Go to project file...'
          Hint = 'Show "Project files list" dialog'
        end
      end
      object TBXSubmenuItemEnc: TTBXSubmenuItem
        Caption = 'E&ncoding'
        Hint = ''
        object TBXSubmenuEnc: TTBXSubmenuItem
          OnPopup = TBXSubmenuEncPopup
          OnSelect = ButtonOnSelect
          Caption = '&Change encoding'
          Hint = 'Reload file in other encoding or change current encoding'
        end
        object TBXSubmenuEnc2: TTBXSubmenuItem
          OnPopup = TBXSubmenuEnc2Popup
          OnSelect = ButtonOnSelect
          Caption = 'Con&vert encoding to'
          Hint = 'Change current encoding w/o reloading the file'
        end
        object TBXSubmenuLineEnds: TTBXSubmenuItem
          OnPopup = TBXSubmenuLineEndsPopup
          OnSelect = ButtonOnSelect
          Caption = 'Change &line endings'
          Hint = ''
          object TBXItemEndMWin: TTBXItem
            Tag = 1
            Checked = True
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
            Caption = '&Windows (CR LF)'
            Hint = ''
          end
          object TBXItemEndMUn: TTBXItem
            Tag = 3
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
            Caption = '&Unix (LF)'
            Hint = ''
          end
          object TBXItemEndMMac: TTBXItem
            Tag = 2
            GroupIndex = 1
            RadioItem = True
            OnClick = SetFormat
            Caption = '&Mac (CR)'
            Hint = ''
          end
        end
      end
      object TBXSubmenuItemLexer: TTBXSubmenuItem
        OnPopup = TBXSubmenuItemLexerPopup
        Caption = '&Lexer'
        Hint = ''
      end
      object TBXSubmenuItemBk: TTBXSubmenuItem
        Caption = '&Bookmarks'
        Hint = ''
        object TBXSubmenuItemBkSet: TTBXSubmenuItem
          OnPopup = TBXSubmenuItem8Popup
          OnSelect = ButtonOnSelect
          Caption = '&Set numbered bookmark'
          Hint = 'Set numbered (0-9) bookmark for current line'
          object TBXItemG0: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '0'
            Hint = ''
          end
          object TBXItemG1: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '1'
            Hint = ''
          end
          object TBXItemG2: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '2'
            Hint = ''
          end
          object TBXItemG3: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '3'
            Hint = ''
          end
          object TBXItemG4: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '4'
            Hint = ''
          end
          object TBXItemG5: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '5'
            Hint = ''
          end
          object TBXItemG6: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '6'
            Hint = ''
          end
          object TBXItemG7: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '7'
            Hint = ''
          end
          object TBXItemG8: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '8'
            Hint = ''
          end
          object TBXItemG9: TTBXItem
            Images = ImageListIconsStd
            OnClick = bbg0Click
            Caption = '9'
            Hint = ''
          end
        end
        object TBXSubmenuItemBkGoto: TTBXSubmenuItem
          OnPopup = TBXSubmenuItem3Popup
          OnSelect = ButtonOnSelect
          Caption = '&Go to numbered bookmark'
          Hint = 'Go to any numbered bookmark'
          object TBXItemB0: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '0'
            Hint = ''
          end
          object TBXItemB1: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '1'
            Hint = ''
          end
          object TBXItemB2: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '2'
            Hint = ''
          end
          object TBXItemB3: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '3'
            Hint = ''
          end
          object TBXItemB4: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '4'
            Hint = ''
          end
          object TBXItemB5: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '5'
            Hint = ''
          end
          object TBXItemB6: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '6'
            Hint = ''
          end
          object TBXItemB7: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '7'
            Hint = ''
          end
          object TBXItemB8: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '8'
            Hint = ''
          end
          object TBXItemB9: TTBXItem
            Images = ImageListIconsStd
            OnClick = bBk0Click
            Caption = '9'
            Hint = ''
          end
        end
        object TBXItemBkToggle: TTBXItem
          Action = ecBkToggle
          OnSelect = ButtonOnSelect
          Caption = '&Toggle bookmark'
          Hint = 'Toggle bookmark for current line'
        end
        object TBXItemBkClear: TTBXItem
          Action = ecBkClearAll
          Images = ImageListIconsStd
          OnSelect = ButtonOnSelect
          Caption = '&Clear all bookmarks'
          Hint = 'Remove all bookmarks in current file'
        end
        object TBXItemBkInverse: TTBXItem
          Action = ecBkInverse
          OnSelect = ButtonOnSelect
          Caption = '&Inverse bookmarks'
          Hint = 'Toggle bookmarks for all lines in file'
        end
        object TBXItemBkNext: TTBXItem
          Action = ecBkNext
          OnSelect = ButtonOnSelect
          Caption = '&Next bookmark'
          Hint = 'Go to next bookmark'
        end
        object TBXItemBkPrev: TTBXItem
          Action = ecBkPrev
          OnSelect = ButtonOnSelect
          Caption = '&Previous bookmark'
          Hint = 'Go to previous bookmark'
        end
        object TBXSeparatorItem63: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemBkCopy: TTBXItem
          Action = ecBkCopy
          OnSelect = ButtonOnSelect
          Caption = 'Copy bookmarked lines'
          Hint = 'Copy bookmarked lines to clipboard'
        end
        object TBXItemBkCut: TTBXItem
          Action = ecBkCut
          OnSelect = ButtonOnSelect
          Caption = 'Cut bookmarked lines'
          Hint = 'Cut bookmarked lines to clipboard'
        end
        object TBXItemBkPaste: TTBXItem
          Action = ecBkPaste
          OnSelect = ButtonOnSelect
          Caption = 'Paste into bookmarked lines'
          Hint = 'Paste from clipboard and replace bookmarked lines'
        end
        object TBXItemBkDel: TTBXItem
          Action = ecBkDelete
          OnSelect = ButtonOnSelect
          Caption = 'Delete bookmarked lines'
          Hint = 'Delete bookmarked lines from file'
        end
        object TBXItemBkDelUnmk: TTBXItem
          Action = ecBkDeleteUnmk
          OnSelect = ButtonOnSelect
          Caption = 'Delete unmarked lines'
          Hint = 'Delete non-bookmarked lines from file'
        end
        object TBXItemBkGoto: TTBXItem
          OnClick = TBXItemBkGotoClick
          OnSelect = ButtonOnSelect
          Caption = 'Go to bookmark...'
          Hint = 'Show "Go to bookmark" dialog'
        end
        object TBXSeparatorItem78: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemBkDropPortable: TTBXItem
          OnClick = TBXItemBkDropPortableClick
          OnSelect = ButtonOnSelect
          Caption = 'Drop portable bookmark'
          Hint = 'Add so called "portable bookmark" on current line'
        end
        object TBXItemBkGotoPortable: TTBXItem
          Action = ecGotoPortableBk
          OnSelect = ButtonOnSelect
          Caption = 'Go to portable bookmark...'
          Hint = 'Show "Go to portable bookmark" dialog'
        end
        object TBXSeparatorItem27: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemMarkDrop: TTBXItem
          OnClick = TBXItemMarkDropClick
          OnSelect = ButtonOnSelect
          Caption = '&Drop marker'
          Hint = 'Drop marker to current file position'
        end
        object TBXItemMarkColl: TTBXItem
          OnClick = TBXItemMarkCollClick
          OnSelect = ButtonOnSelect
          Caption = 'C&ollect marker'
          Hint = 'Remove last marker'
        end
        object TBXItemMarkSwap: TTBXItem
          OnClick = TBXItemMarkSwapClick
          OnSelect = ButtonOnSelect
          Caption = '&Swap marker'
          Hint = 'Swap last marker and current file position'
        end
        object TBXItemMarkGoLast: TTBXItem
          Action = ecJumpToLastMarker
          OnSelect = ButtonOnSelect
          Caption = 'Go to last marker'
          Hint = 'Go to last marker, don'#39't delete it'
        end
        object TBXItemMarkClear: TTBXItem
          Action = ecMarkersClear
          OnSelect = ButtonOnSelect
          Caption = 'Clear markers'
          Hint = 'Clear all markers in current file'
        end
      end
      object TBXSubmenuItemView: TTBXSubmenuItem
        Caption = '&View'
        Hint = ''
        object TBXItemOTree: TTBXItem
          Action = ecTree
          OnSelect = ButtonOnSelect
          Caption = 'Toggle &structure/project panel'
          Hint = 'Show/hide structure/project panel'
        end
        object TBXItemOOut: TTBXItem
          Action = ecOut
          OnSelect = ButtonOnSelect
          Caption = 'Toggle &output panel'
          Hint = 'Show/hide output window'
        end
        object TBXItemOClip: TTBXItem
          Action = ecClip
          OnSelect = ButtonOnSelect
          Caption = 'Toggle clipboar&d/minimap panel'
          Hint = 'Show/hide clipboard and mini-map panel'
        end
        object TBXSubmenuItemToolbars: TTBXSubmenuItem
          OnSelect = ButtonOnSelect
          Caption = 'Tool&bars'
          Hint = ''
          object TBXItemTFile: TTBXItem
            OnClick = TBXItemTFileClick
            OnSelect = ButtonOnSelect
            Caption = 'File'
            Hint = 'Toggle File toolbar'
          end
          object TBXItemTEdit: TTBXItem
            OnClick = TBXItemTEditClick
            OnSelect = ButtonOnSelect
            Caption = 'Edit'
            Hint = 'Toggle Edit toolbar'
          end
          object TBXItemTView: TTBXItem
            OnClick = TBXItemTViewClick
            OnSelect = ButtonOnSelect
            Caption = 'View'
            Hint = 'Toggle View toolbar'
          end
          object TBXItemTQs: TTBXItem
            OnClick = TBXItemTQsClick
            OnSelect = ButtonOnSelect
            Caption = 'Quick search'
            Hint = 'Toggle Quick Search toolbar'
          end
        end
        object TBXSeparatorItem25: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemORO: TTBXItem
          Action = ecReadOnly
          OnSelect = ButtonOnSelect
          Caption = 'Toggle &read-only'
        end
        object TBXItemOFold: TTBXItem
          Action = ecFold
          OnSelect = ButtonOnSelect
          Caption = 'Toggle &code folding'
        end
        object TBXItemOWrap: TTBXItem
          Action = ecWrap
          OnSelect = ButtonOnSelect
          Caption = 'Toggle &word wrap'
        end
        object TBXItemONums: TTBXItem
          Action = ecLines
          OnSelect = ButtonOnSelect
          Caption = 'Toggle line &numbers'
        end
        object TBXItemONPrint: TTBXItem
          Action = ecNPrint
          OnSelect = ButtonOnSelect
          Caption = 'Toggle non-&printable chars'
        end
        object TBXItemORuler: TTBXItem
          Action = ecRuler
          OnSelect = ButtonOnSelect
          Caption = 'Toggle ruler'
          Hint = 'Toggle horizontal ruler'
        end
        object TBXSeparatorItem50: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemVSpellLive: TTBXItem
          Action = ecSpellLive
          OnSelect = ButtonOnSelect
          Caption = '&Live spelling'
          Hint = 'Toggle live spelling mode (red underlines)'
        end
        object TBXItemVSpellCheck: TTBXItem
          Action = ecSpellCheck
          OnSelect = ButtonOnSelect
          Caption = 'Sp&ell check'
          Hint = 'Perform spell check of current document'
        end
        object TBXSeparatorItem12: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemVSyncHorz: TTBXItem
          Action = ecSyncH
          OnSelect = ButtonOnSelect
          Caption = 'Sync horizontal scrolling'
          Hint = 'Synchronize horizontal scrolling (when both views opened)'
        end
        object TBXItemVSyncVert: TTBXItem
          Action = ecSyncV
          OnSelect = ButtonOnSelect
          Caption = 'Sync vertical scrolling'
          Hint = 'Synchronize vertical scrolling (when both views opened)'
        end
        object TBXSeparatorItem26: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemOFullScr: TTBXItem
          Action = ecFullScr
          OnSelect = ButtonOnSelect
          Caption = 'F&ull screen'
          Hint = 'Toggle full screen mode'
        end
        object TBXItemOOnTop: TTBXItem
          Action = ecOnTop
          OnSelect = ButtonOnSelect
          Caption = '&Always on top'
          Hint = 'Always show main form on top'
        end
        object TBXItemViewColMarkers: TTBXItem
          Action = fColumnMarkers
          OnSelect = ButtonOnSelect
          Caption = 'Column markers...'
          Hint = 'Set column markers for the current file'
        end
        object TBXSubmenuFolding: TTBXSubmenuItem
          Caption = 'Folding'
          Hint = ''
          object TBXItemFoldAll: TTBXItem
            OnClick = TBXItemFoldAllClick
            Caption = 'Collapse all'
            Hint = ''
          end
          object TBXItemUnfoldAll: TTBXItem
            OnClick = TBXItemUnfoldAllClick
            Caption = 'Expand all'
            Hint = ''
          end
          object TBXSeparatorItem87: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemUnfoldLine: TTBXItem
            OnClick = TBXItemUnfoldLineClick
            Caption = 'Expand current block'
            Hint = ''
          end
          object TBXItemFoldNearestBlock: TTBXItem
            OnClick = TBXItemFoldNearestBlockClick
            Caption = 'Collapse/expand nearest block'
            Hint = ''
          end
          object TBXItemFoldSelBlock: TTBXItem
            OnClick = TBXItemFoldSelBlockClick
            Caption = 'Collapse selection'
            Hint = ''
          end
          object TBXSeparatorItem89: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemFoldRangesInSel: TTBXItem
            OnClick = TBXItemFoldRangesInSelClick
            Caption = 'Collapse ranges in selection'
            Hint = ''
          end
          object TBXItemUnfoldRangesInSel: TTBXItem
            OnClick = TBXItemUnfoldRangesInSelClick
            Caption = 'Expand ranges in selection'
            Hint = ''
          end
          object TBXSeparatorItem88: TTBXSeparatorItem
            Visible = False
            Caption = ''
            Hint = ''
          end
          object TBXItemFoldParent: TTBXItem
            Visible = False
            OnClick = TBXItemFoldParentClick
            Caption = 'Collapse parent block'
            Hint = ''
          end
          object TBXItemFoldWithNested: TTBXItem
            Visible = False
            OnClick = TBXItemFoldWithNestedClick
            Caption = 'Collapse/expand current and nested blocks'
            Hint = ''
          end
        end
        object TBXSubmenuItemZoom: TTBXSubmenuItem
          OnSelect = ButtonOnSelect
          Caption = '&Zoom'
          Hint = ''
          object TBXItemZIn: TTBXItem
            OnClick = TBXItemZInClick
            OnSelect = ButtonOnSelect
            Caption = 'Zoom &in'
            Hint = ''
          end
          object TBXItemZOut: TTBXItem
            OnClick = TBXItemZOutClick
            OnSelect = ButtonOnSelect
            Caption = 'Zoom &out'
            Hint = ''
          end
          object TBXItemZ0: TTBXItem
            OnClick = TBXItemZ0Click
            OnSelect = ButtonOnSelect
            Caption = '&Original size'
            Hint = ''
          end
        end
      end
      object TBXSubmenuItemOpt: TTBXSubmenuItem
        Caption = '&Options'
        Hint = ''
        object TBXItemOSetup: TTBXItem
          Action = fSetup
          OnSelect = ButtonOnSelect
          Caption = '&Customize...'
        end
        object TBXItemOTools: TTBXItem
          OnClick = TBXItemOToolsClick
          OnSelect = ButtonOnSelect
          Caption = '&External tools...'
          Hint = 'Customize additional tools'
        end
        object TBXItemOShell: TTBXItem
          OnClick = TBXItemOShellClick
          OnSelect = ButtonOnSelect
          Caption = 'E&xplorer integration...'
          Hint = 'Customize integration with Windows Explorer'
        end
        object TBXSeparatorItem38: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemOLexer: TTBXItem
          Action = fCustomizeLexer
          OnSelect = ButtonOnSelect
          Caption = 'Customi&ze lexer...'
        end
        object TBXItemOLexerHi: TTBXItem
          Action = fCustomizeHi
          OnSelect = ButtonOnSelect
          Caption = 'Customize lexer &styles...'
          Hint = 'Customize current lexer'#39's highlighting properties'
        end
        object TBXItemOLexerLib: TTBXItem
          Action = fCustomizeLexerLib
          OnSelect = ButtonOnSelect
          Caption = 'Customize &lexers library...'
        end
        object TBXSeparatorItem24: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubmenuItem10: TTBXSubmenuItem
          Caption = '&Advanced'
          Hint = ''
          object TBXItemORestoreStyles: TTBXItem
            OnClick = TBXItemORestoreStylesClick
            OnSelect = ButtonOnSelect
            Caption = '&Restore lexer styles...'
            Hint = 'Restore auto-backuped lexers styles'
          end
          object TBXSeparatorItem84: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemOOpenPluginsIni: TTBXItem
            OnClick = TBXItemOOpenPluginsIniClick
            OnSelect = ButtonOnSelect
            Caption = '&Open SynPlugins.ini file'
            Hint = 'Open SynPlugins.ini file, to customize plugins registration'
          end
        end
      end
      object TBXSubmenuItemRun: TTBXSubmenuItem
        OnPopup = TBXSubmenuItemRunPopup
        Caption = '&Run'
        Hint = ''
        object TBXItemT1: TTBXItem
          OnClick = fTool1Execute
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT2: TTBXItem
          OnClick = fTool2Execute
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT3: TTBXItem
          OnClick = fTool3Execute
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT4: TTBXItem
          OnClick = fTool4Execute
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT5: TTBXItem
          OnClick = TBXItemT5Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT6: TTBXItem
          OnClick = TBXItemT6Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT7: TTBXItem
          OnClick = TBXItemT7Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT8: TTBXItem
          OnClick = TBXItemT8Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT9: TTBXItem
          OnClick = TBXItemT9Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT10: TTBXItem
          OnClick = TBXItemT10Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT11: TTBXItem
          OnClick = TBXItemT11Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXItemT12: TTBXItem
          OnClick = TBXItemT12Click
          OnSelect = ButtonOnSelect
          Caption = '-'
          Hint = ''
        end
        object TBXSeparatorItem31: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubmenuItemBr: TTBXSubmenuItem
          OnPopup = TBXSubmenuItemBrPopup
          Caption = '&Browsers'
          Hint = ''
          object TBXItemRunPreview: TTBXItem
            OnClick = TBXItemRunPreviewClick
            OnSelect = ButtonOnSelect
            Caption = '&Preview HTML code'
            Hint = 'Preview selected HTML code in default browser'
          end
          object TBXSeparatorItem52: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemRunFirefox: TTBXItem
            OnClick = TBXItemRunFirefoxClick
            OnSelect = ButtonOnSelect
            Caption = 'Open in &Firefox'
            Hint = 'Open file in Firefox browser'
          end
          object TBXItemRunMSIE: TTBXItem
            OnClick = TBXItemRunMSIEClick
            OnSelect = ButtonOnSelect
            Caption = 'Open in &IE'
            Hint = 'Open file in Internet Explorer browser'
          end
          object TBXItemRunChrome: TTBXItem
            OnClick = TBXItemRunChromeClick
            OnSelect = ButtonOnSelect
            Caption = 'Open in &Chrome'
            Hint = 'Open file in Google Chrome browser'
          end
          object TBXItemRunSafari: TTBXItem
            OnClick = TBXItemRunSafariClick
            OnSelect = ButtonOnSelect
            Caption = 'Open in &Safari'
            Hint = 'Open file in Safari browser'
          end
        end
        object TBXSubmenuItemWb: TTBXSubmenuItem
          Caption = '&Online help'
          Hint = ''
          object TBXItemRunFindGoogle: TTBXItem
            OnClick = TBXItemRunFindGoogleClick
            OnSelect = ButtonOnSelect
            Caption = '&Google search'
            Hint = 'Perform Google search for the current word or selection'
          end
          object TBXItemRunFindWiki: TTBXItem
            OnClick = TBXItemRunFindWikiClick
            OnSelect = ButtonOnSelect
            Caption = '&Wikipedia search'
            Hint = 'Perform Wikipedia search for the current word or selection'
          end
          object TBXItemRunFindMSDN: TTBXItem
            OnClick = TBXItemRunFindMSDNClick
            OnSelect = ButtonOnSelect
            Caption = '&MSDN search'
            Hint = 'Perform online MSDN search for the current word or selection'
          end
          object TBXSeparatorItem73: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TBXItemRunFindPhp: TTBXItem
            OnClick = TBXItemRunFindPhpClick
            OnSelect = ButtonOnSelect
            Caption = '&PHP help'
            Hint = 'Perform PHP.net search for the current word'
          end
          object TBXSeparatorItem74: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
          object TbxItemRunFindHtml4: TTBXItem
            OnClick = TbxItemRunFindHtml4Click
            OnSelect = ButtonOnSelect
            Caption = 'Help for HTML4 tag'
            Hint = 'Show online help on current HTML4 tag'
          end
          object TbxItemRunFindHtml5: TTBXItem
            OnClick = TbxItemRunFindHtml5Click
            OnSelect = ButtonOnSelect
            Caption = 'Help for HTML5 tag'
            Hint = 'Show online help on current HTML5 tag'
          end
        end
        object TBXSubmenuItemTidy: TTBXSubmenuItem
          OnPopup = TBXSubmenuItemTidyPopup
          Caption = '&HTML Tidy'
          Hint = ''
          object TBXItemTidyVal: TTBXItem
            OnClick = TBXItemTidyValClick
            OnSelect = ButtonOnSelect
            Caption = 'Validate document'
            Hint = 'Validate current file using HTML Tidy tool'
          end
          object TBXItemTidyCfg: TTBXItem
            OnClick = TBXItemTidyCfgClick
            OnSelect = ButtonOnSelect
            Caption = 'Configure'
            Hint = 'Edit HTML Tidy configurations file'
          end
          object TBXSeparatorItem55: TTBXSeparatorItem
            Caption = ''
            Hint = ''
          end
        end
        object TBXItemRunNumConv: TTBXItem
          OnClick = TBXItemRunNumConvClick
          OnSelect = ButtonOnSelect
          Caption = 'Numeric converter...'
          Hint = 'Show "Numeric converter" dialog'
        end
        object TBXItemRunLoremIpsum: TTBXItem
          OnClick = TBXItemRunLoremIpsumClick
          OnSelect = ButtonOnSelect
          Caption = 'Lorem Ipsum generator...'
          Hint = 'Show "Lorem Ipsum generator" dialog'
        end
        object TBXItemRunEncodeHtml: TTBXItem
          OnClick = TBXItemRunEncodeHtmlClick
          OnSelect = ButtonOnSelect
          Caption = 'Encode HTML chars'
          Hint = 'Encode special HTML chars in selection: && < > "'
        end
        object TBXSeparatorItem70: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemRunOpenFile: TTBXItem
          OnClick = TBXItemRunOpenFileClick
          OnSelect = ButtonOnSelect
          Caption = 'O&pen file'
          Hint = 'Launch current file using Windows Explorer association'
        end
        object TBXItemRunOpenDir: TTBXItem
          OnClick = TBXItemRunOpenDirClick
          OnSelect = ButtonOnSelect
          Caption = '&Open containing folder'
          Hint = 'Open folder containing the current file'
        end
        object TBXSeparatorItem58: TTBXSeparatorItem
          Visible = False
          Caption = ''
          Hint = ''
        end
        object TBXItemWin0: TTBXItem
          Tag = 1
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin1: TTBXItem
          Tag = 2
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin2: TTBXItem
          Tag = 3
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin3: TTBXItem
          Tag = 4
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin4: TTBXItem
          Tag = 5
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin5: TTBXItem
          Tag = 6
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin6: TTBXItem
          Tag = 7
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin7: TTBXItem
          Tag = 8
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin8: TTBXItem
          Tag = 9
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
        object TBXItemWin9: TTBXItem
          Tag = 10
          Visible = False
          OnClick = TabClick
          Caption = '-'
          Hint = ''
        end
      end
      object TBXSubmenuItemPlugins: TTBXSubmenuItem
        Visible = False
        Caption = '&Plugins'
        Hint = ''
      end
      object TBXSubmenuItemMacros: TTBXSubmenuItem
        OnPopup = TBXSubmenuItemMacrosPopup
        Caption = '&Macros'
        Hint = ''
        object TBXItemMacroRecord: TTBXItem
          Action = ecMacroRecord1
          OnSelect = ButtonOnSelect
          Caption = 'Start &recording'
          Hint = 'Record a new macro'
        end
        object TBXItemMacroStop: TTBXItem
          Action = ecMacroStop1
          OnSelect = ButtonOnSelect
          Caption = '&Stop recording'
          Hint = 'Stop current macro recording'
        end
        object TBXItemMacroCancel: TTBXItem
          Action = ecMacroCancel1
          OnSelect = ButtonOnSelect
          Caption = '&Cancel recording'
          Hint = 'Cancel currently recorded macro'
        end
        object TBXSeparatorItem51: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro1: TTBXItem
          OnClick = TBXItemMacro1Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro2: TTBXItem
          OnClick = TBXItemMacro2Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro3: TTBXItem
          OnClick = TBXItemMacro3Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro4: TTBXItem
          OnClick = TBXItemMacro4Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro5: TTBXItem
          OnClick = TBXItemMacro5Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro6: TTBXItem
          OnClick = TBXItemMacro6Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro7: TTBXItem
          OnClick = TBXItemMacro7Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro8: TTBXItem
          OnClick = TBXItemMacro8Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro9: TTBXItem
          OnClick = TBXItemMacro9Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro10: TTBXItem
          OnClick = TBXItemMacro10Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro11: TTBXItem
          OnClick = TBXItemMacro11Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro12: TTBXItem
          OnClick = TBXItemMacro12Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro13: TTBXItem
          OnClick = TBXItemMacro13Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro14: TTBXItem
          OnClick = TBXItemMacro14Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro15: TTBXItem
          OnClick = TBXItemMacro15Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro16: TTBXItem
          OnClick = TBXItemMacro16Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro17: TTBXItem
          OnClick = TBXItemMacro17Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro18: TTBXItem
          OnClick = TBXItemMacro18Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro19: TTBXItem
          OnClick = TBXItemMacro19Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro20: TTBXItem
          OnClick = TBXItemMacro20Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro21: TTBXItem
          OnClick = TBXItemMacro21Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro22: TTBXItem
          OnClick = TBXItemMacro22Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro23: TTBXItem
          OnClick = TBXItemMacro23Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro24: TTBXItem
          OnClick = TBXItemMacro24Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro25: TTBXItem
          OnClick = TBXItemMacro25Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro26: TTBXItem
          OnClick = TBXItemMacro26Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro27: TTBXItem
          OnClick = TBXItemMacro27Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro28: TTBXItem
          OnClick = TBXItemMacro28Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro29: TTBXItem
          OnClick = TBXItemMacro29Click
          Caption = ''
          Hint = ''
        end
        object TBXItemMacro30: TTBXItem
          OnClick = TBXItemMacro30Click
          Caption = ''
          Hint = ''
        end
        object TBXSeparatorItem62: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemMacroPlay: TTBXItem
          Action = ecMacroPlay1
          OnSelect = ButtonOnSelect
          Caption = '&Play last macro'
          Hint = 'Play last macro'
        end
        object TBXItemMacroRepeat: TTBXItem
          Action = ecMacroRepeat
          OnSelect = ButtonOnSelect
          Hint = 'Repeat last played macro'
        end
        object TBXSeparatorItem53: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemMacroDlg: TTBXItem
          Action = ecMacroDlg
          OnSelect = ButtonOnSelect
          Caption = 'R&un/customize macros...'
          Hint = 'Show macros customization dialog'
        end
      end
      object tbxWin: TTBXSubmenuItem
        OnPopup = tbxWinPopup
        Caption = '&Window'
        Hint = ''
        object TBXSepWin: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubWin: TTBXSubmenuItem
          Caption = 'Panels'
          Hint = ''
          object TBXItemWinTree: TTBXItem
            Action = ecToggleFocusTree
            Caption = 'Structure pane'
          end
          object TBXItemWinProj: TTBXItem
            Action = ecToggleFocusProject
            Caption = 'Project pane'
          end
          object TBXItemWinClip: TTBXItem
            Action = ecToggleFocusClip
            Caption = 'Clipboard pane'
          end
          object TBXItemWinMap: TTBXItem
            Action = ecToggleFocusMap
            Caption = 'Mini-map pane'
          end
          object TBXItemWinOut: TTBXItem
            Action = ecToggleFocusOutput
            Caption = 'Output pane'
          end
          object TBXItemWinFRes: TTBXItem
            Action = ecToggleFocusFindRes
            Caption = 'Find Results pane'
          end
          object TBXItemWinVal: TTBXItem
            Action = ecToggleFocusValidate
            Caption = 'Validate pane'
          end
          object TbxItemWinClips: TTBXItem
            Action = ecToggleFocusClips
            Caption = 'Text Clips pane'
          end
          object TbxItemWinTabs: TTBXItem
            Action = ecToggleFocusTabs
            Caption = 'Tabs pane'
          end
        end
      end
      object TBXSubmenuItemHelp: TTBXSubmenuItem
        Caption = '&Help'
        Hint = ''
        object TBXItemHHelp: TTBXItem
          OnClick = TBXItemHHelpClick
          OnSelect = ButtonOnSelect
          Caption = '&Help topics'
          Hint = 'Show help file'
        end
        object TBXSeparatorItem79: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXSubmenuItemHelpAbbrev: TTBXSubmenuItem
          Caption = 'Cheat sheets'
          Hint = ''
          object TBXItemHEmmet: TTBXItem
            OnClick = TBXItemHEmmetClick
            OnSelect = ButtonOnSelect
            Caption = 'Emmet'
            Hint = ''
          end
        end
        object TBXItemHKeyMap: TTBXItem
          OnClick = TBXItemHKeyMapClick
          OnSelect = ButtonOnSelect
          Caption = 'Show &keyboard mapping'
          Hint = 'Show keyboard mapping as HTML page'
        end
        object TBXItemHRead: TTBXItem
          OnClick = TBXItemHReadClick
          OnSelect = ButtonOnSelect
          Caption = '&Browse Readme folder'
          Hint = 'Browse Readme folder in Explorer'
        end
        object TBXSeparatorItem46: TTBXSeparatorItem
          Caption = ''
          Hint = ''
        end
        object TBXItemHDonate: TTBXItem
          OnClick = TBXItemHDonateClick
          OnSelect = ButtonOnSelect
          Caption = '&Donate...'
          Hint = 'Show "Donate" help topic'
        end
        object TBXItemHAbout: TTBXItem
          OnClick = TBXItemAbClick
          OnSelect = ButtonOnSelect
          Caption = '&About...'
          Hint = 'Show About dialog'
        end
      end
      object TBXItemTbSplit: TTBXItem
        ImageIndex = 3
        Images = ImageListCloseBtn
        OnClick = TBXItemTbSplitClick
        OnSelect = ButtonOnSelect
        Caption = '-'
        Hint = 'Toggle second view visible'
      end
      object TBXItemTbClose: TTBXItem
        ImageIndex = 0
        Images = ImageListCloseBtn
        OnClick = TBXItemTbCloseClick
        OnSelect = ButtonOnSelect
        Caption = '-'
        Hint = 'Close current tab'
      end
      object TBXItemTbCloseAll: TTBXItem
        ImageIndex = 2
        Images = ImageListCloseBtn
        OnClick = TBXItemTbCloseAllClick
        OnSelect = ButtonOnSelect
        Caption = '-'
        Hint = 'Close all tabs'
      end
      object TBXMnuRecentColors: TTBXSubmenuItem
        ImageIndex = 0
        Images = ImageListColorRecent
        Visible = False
        OnPopup = TBXMnuRecentColorsPopup
        OnSelect = ButtonOnSelect
        Caption = ''
        Hint = 'Recent colors menu'
      end
    end
  end
  object Panel1: TPanel
    Left = 201
    Top = 50
    Width = 435
    Height = 384
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 6
    OnResize = Panel1Resize
    object Splitter1: TSplitter
      Left = 315
      Top = 0
      Width = 5
      Height = 384
      Align = alRight
      AutoSnap = False
      MinSize = 50
      OnCanResize = Splitter1CanResize
      OnMoved = Splitter1Moved
      OnPaint = Splitter1Paint
    end
    object PageControl1: TTntPageControl
      Left = 0
      Top = 0
      Width = 315
      Height = 384
      Align = alClient
      OwnerDraw = True
      TabOrder = 0
      OnChange = PageControl1Change
      OnContextPopup = PageControl1ContextPopup
      OnDragDrop = PageControl1DragDrop
      OnDragOver = PageControl1DragOver
      OnDrawTab = PageControl1DrawTab
      OnEnter = PageControl1Enter
      OnMouseDown = PageControl1MouseDown
      OnMouseMove = PageControl1MouseMove
    end
    object TemplateEditor: TSyntaxMemo
      Left = 126
      Top = 8
      Width = 180
      Height = 165
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
      HintProps.Color = clCream
      HintProps.ShowHints = [shCollapsed, shGutter, shTokens]
      HintProps.TimeCollapsed = 100000
      HintProps.TimeTokens = 100000
      HintProps.Styles = SyntStyles
      HintProps.Images = ImgListGutter
      HintProps.Formated = True
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
      TabOrder = 1
      Visible = False
    end
    object PageControl2: TTntPageControl
      Left = 320
      Top = 0
      Width = 115
      Height = 384
      Align = alRight
      OwnerDraw = True
      TabOrder = 2
      OnChange = PageControl1Change
      OnContextPopup = PageControl1ContextPopup
      OnDragDrop = PageControl1DragDrop
      OnDragOver = PageControl1DragOver
      OnDrawTab = PageControl1DrawTab
      OnEnter = PageControl2Enter
      OnMouseDown = PageControl1MouseDown
      OnMouseMove = PageControl1MouseMove
    end
  end
  object ActionList: TActionList
    Images = ImageListIconsStd
    Left = 208
    Top = 280
    object ecPrintAction: TecPrintAction
      Category = 'Print'
      Caption = 'Print...'
      Hint = 'Print document'
      ImageIndex = 29
      BeforeExecute = ecPrintActionBeforeExecute
      Command = 630
      SyntPrinter = ecSyntPrinter
    end
    object ecPreviewAction: TecPreviewAction
      Category = 'Print'
      Caption = 'Preview...'
      Hint = 'Print preview'
      ImageIndex = 30
      BeforeExecute = ecPreviewActionBeforeExecute
      OnExecuteOK = ecPreviewActionExecuteOK
      Command = 632
      SyntPrinter = ecSyntPrinter
    end
    object ecPageSetupAction: TecPageSetupAction
      Category = 'Print'
      Caption = 'Page setup...'
      Hint = 'Page setup'
      ImageIndex = 31
      BeforeExecute = ecPageSetupActionBeforeExecute
      OnExecuteOK = ecPageSetupActionExecuteOK
      Command = 633
      SyntPrinter = ecSyntPrinter
    end
    object fNew: TAction
      Tag = 700
      Category = 'File'
      Caption = 'New file'
      Hint = 'Create new file'
      ImageIndex = 34
      OnExecute = fNewExecute
    end
    object fNewWin: TAction
      Category = 'File'
      Caption = 'New window'
      OnExecute = fNewWinExecute
    end
    object ecPrinterSetup: TAction
      Category = 'Print'
      Caption = 'Printer setup...'
      Hint = 'Printer setup'
      ImageIndex = 35
      OnExecute = ecPrinterSetupExecute
    end
    object fOpen: TAction
      Tag = 701
      Category = 'File'
      Caption = 'Open...'
      Hint = 'Open file'
      ImageIndex = 0
      OnExecute = fOpenExecute
    end
    object fReread: TAction
      Category = 'File'
      Caption = 'Reopen'
      Hint = 'Reopen file'
      OnExecute = fRereadExecute
    end
    object fSave: TAction
      Tag = 702
      Category = 'File'
      Caption = 'Save'
      Hint = 'Save file'
      ImageIndex = 1
      OnExecute = fSaveExecute
    end
    object fSaveAs: TAction
      Tag = 703
      Category = 'File'
      Caption = 'Save as...'
      Hint = 'Save current file as'
      ImageIndex = 3
      OnExecute = fSaveAsExecute
    end
    object fExportRTFAction: TecExportRTFAction
      Tag = 704
      Category = 'File'
      Caption = 'Export to RTF...'
      Hint = 
        'Export the current editor contents to RTF including all highligh' +
        'tings'
      BeforeExecute = fExportRTFActionBeforeExecute
      DefaultExt = '.RTF'
      Filter = 'Rich text files (*.rtf)|*.rtf|All files (*.*)|*.*'
      Options = [ofOverwritePrompt, ofPathMustExist, ofEnableSizing]
      OptionsEx = []
    end
    object fExportHTMLAction: TecExportHTMLAction
      Tag = 705
      Category = 'File'
      Caption = 'Export to HTML...'
      Hint = 
        'Export the current editor contents to HTML including all highlig' +
        'htings'
      DefaultExt = '.HTML'
      Filter = 'HTML files (*.htm, *.html)|*.htm;*.html|All files (*.*)|*.*'
      Options = [ofOverwritePrompt, ofPathMustExist, ofEnableSizing]
      OptionsEx = []
    end
    object fSetup: TAction
      Tag = 709
      Category = 'File'
      Caption = 'Setup...'
      Hint = 'Show options dialog'
      ImageIndex = 4
      OnExecute = fSetupExecute
    end
    object fCustomizeLexer: TecCustomizeLexerPropertiesAction
      Tag = 710
      Category = 'File'
      Caption = 'Customize lexer...'
      Hint = 'Customize current lexer'
      ImageIndex = 5
      OnExecuteOK = fCustomizeLexerExecuteOK
    end
    object fCustomizeLexerLib: TecCustomizeLexerLib
      Tag = 711
      Category = 'File'
      Caption = 'Customize lexer library...'
      Hint = 'Customize lexers library'
      ImageIndex = 6
      AfterExecute = fCustomizeLexerLibAfterExecute
      SyntaxManager = SyntaxManager
    end
    object ecReplaceInFiles: TAction
      Category = 'Find'
      Hint = 'Show "Find/replace in files" dialog'
      OnExecute = ecReplaceInFilesExecute
    end
    object ecReplace: TAction
      Category = 'Find'
      Hint = 'Show Replace dialog'
      OnExecute = ecReplaceExecute
    end
    object ecCopy: TecCopy
      Tag = 301
      Category = 'Edit'
      Caption = 'Copy'
      Hint = 'Copy selection to clipboard'
      ImageIndex = 7
      ShortCut = 16451
    end
    object ecCopyAsHTML: TAction
      Tag = 309
      Category = 'Edit'
      Caption = 'Copy as HTML'
      OnExecute = ecCopyAsHTMLExecute
    end
    object ecCopyAsRTF: TAction
      Tag = 310
      Category = 'Edit'
      Caption = 'Copy as RTF'
      OnExecute = ecCopyAsRTFExecute
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
      OnExecuteOK = ecUndoExecuteOK
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
    object ecTree: TAction
      Tag = 715
      Category = 'View'
      Caption = 'Toggle tree'
      Checked = True
      Hint = 'Toggle tree'
      ImageIndex = 28
      OnExecute = ecTreeExecute
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
      Hint = 'Show Find dialog'
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
    object ecLines: TAction
      Tag = 731
      Category = 'View'
      Caption = 'Toggle line numbers'
      Hint = 'Toggle line numbers'
      ImageIndex = 24
      OnExecute = ecLinesExecute
    end
    object ecFold: TAction
      Tag = 732
      Category = 'View'
      Caption = 'Toggle code folding'
      Hint = 'Toggle code folding'
      ImageIndex = 23
      OnExecute = ecFoldExecute
    end
    object ecNPrint: TAction
      Tag = 733
      Category = 'View'
      Caption = 'Toggle non-printable chars'
      Hint = 'Toggle non-printable chars'
      ImageIndex = 27
      OnExecute = ecNPrintExecute
    end
    object fCustomizeHi: TAction
      Category = 'File'
      OnExecute = fCustomizeHiExecute
    end
    object fClose: TAction
      Category = 'File'
      OnExecute = fCloseExecute
    end
    object fSaveAll: TAction
      Category = 'File'
      OnExecute = fSaveAllExecute
    end
    object fCloseAll: TAction
      Category = 'File'
      OnExecute = fCloseAllExecute
    end
    object fCloseOth: TAction
      Category = 'File'
      OnExecute = fCloseOthExecute
    end
    object fExit: TAction
      Category = 'File'
      OnExecute = fExitExecute
    end
    object fCloseDel: TAction
      Category = 'File'
      OnExecute = fCloseDelExecute
    end
    object ecCopyApp: TAction
      Tag = 720
      Category = 'Edit'
      Caption = 'Copy-Append'
      Hint = 'Copy selection and append to clipboard'
      OnExecute = ecCopyAppExecute
    end
    object ecCutApp: TAction
      Tag = 721
      Category = 'Edit'
      Caption = 'Cut-Append'
      Hint = 'Cut selection and append to clipboard'
      OnExecute = ecCutAppExecute
    end
    object ecOut: TAction
      Tag = 713
      Category = 'View'
      Caption = 'Toggle output'
      Checked = True
      OnExecute = ecOutExecute
    end
    object ecClip: TAction
      Category = 'View'
      Caption = 'Toggle clipboard history'
      Checked = True
      OnExecute = ecClipExecute
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
    object ecSyncH: TAction
      Category = 'View'
      ImageIndex = 41
      OnExecute = ecSyncHExecute
    end
    object ecSyncV: TAction
      Category = 'View'
      ImageIndex = 42
      OnExecute = ecSyncVExecute
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
    object fMakeBak: TAction
      Category = 'File'
      OnExecute = fMakeBakExecute
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
    object ecJoinLines: TAction
      Category = 'Edit'
      OnExecute = ecJoinLinesExecute
    end
    object ecSplitLines: TAction
      Category = 'Edit'
      OnExecute = ecSplitLinesExecute
    end
    object ecMacroRecord1: TecMacroRecord
      Category = 'Macros'
    end
    object ecMacroStop1: TecMacroStop
      Category = 'Macros'
    end
    object ecMacroCancel1: TecMacroCancel
      Category = 'Macros'
    end
    object ecMacroPlay1: TecMacroPlay
      Category = 'Macros'
      BeforeExecute = ecMacroPlay1BeforeExecute
    end
    object ecMacroDlg: TAction
      Category = 'Macros'
      OnExecute = ecMacroDlgExecute
    end
    object ecMacroRepeat: TAction
      Category = 'Macros'
      OnExecute = ecMacroRepeatExecute
    end
    object ecMacro1: TAction
      Category = 'Macros'
      OnExecute = ecMacro1Execute
    end
    object ecMacro2: TAction
      Category = 'Macros'
      OnExecute = ecMacro2Execute
    end
    object ecMacro3: TAction
      Category = 'Macros'
      OnExecute = ecMacro3Execute
    end
    object ecMacro4: TAction
      Category = 'Macros'
      OnExecute = ecMacro4Execute
    end
    object ecMacro5: TAction
      Category = 'Macros'
      OnExecute = ecMacro5Execute
    end
    object ecMacro6: TAction
      Category = 'Macros'
      OnExecute = ecMacro6Execute
    end
    object ecMacro7: TAction
      Category = 'Macros'
      OnExecute = ecMacro7Execute
    end
    object ecMacro8: TAction
      Category = 'Macros'
      OnExecute = ecMacro8Execute
    end
    object ecMacro9: TAction
      Category = 'Macros'
      OnExecute = ecMacro9Execute
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
    object ecToggleView: TAction
      Category = 'View'
      OnExecute = ecToggleViewExecute
    end
    object ecCopyLine: TAction
      Category = 'Edit'
      OnExecute = ecCopyLineExecute
    end
    object ecCutLine: TAction
      Category = 'Edit'
      OnExecute = ecCutLineExecute
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
    object ecMarkersClear: TAction
      Category = 'Bk'
      OnExecute = ecMarkersClearExecute
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
    object ecGotoNextBlank: TAction
      Category = 'Goto'
      OnExecute = ecGotoNextBlankExecute
    end
    object ecGotoPrevBlank: TAction
      Category = 'Goto'
      OnExecute = ecGotoPrevBlankExecute
    end
    object ecSelPara: TAction
      Category = 'Select'
      OnExecute = ecSelParaExecute
    end
    object ecSplitLeft: TAction
      Category = 'View'
      OnExecute = ecSplitLeftExecute
    end
    object ecSplitRight: TAction
      Category = 'View'
      OnExecute = ecSplitRightExecute
    end
    object ecSelToWordEnd: TAction
      Category = 'Select'
      OnExecute = ecSelToWordEndExecute
    end
    object ecJumpToWordEnd: TAction
      Category = 'Goto'
      OnExecute = ecJumpToWordEndExecute
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
    object ecMacro10: TAction
      Category = 'Macros'
      OnExecute = ecMacro10Execute
    end
    object ecMacro11: TAction
      Category = 'Macros'
      OnExecute = ecMacro11Execute
    end
    object ecMacro12: TAction
      Category = 'Macros'
      OnExecute = ecMacro12Execute
    end
    object ecMacro13: TAction
      Category = 'Macros'
      OnExecute = ecMacro13Execute
    end
    object ecMacro14: TAction
      Category = 'Macros'
      OnExecute = ecMacro14Execute
    end
    object ecMacro15: TAction
      Category = 'Macros'
      OnExecute = ecMacro15Execute
    end
    object ecMacro16: TAction
      Category = 'Macros'
      OnExecute = ecMacro16Execute
    end
    object ecMacro17: TAction
      Category = 'Macros'
      OnExecute = ecMacro17Execute
    end
    object ecMacro18: TAction
      Category = 'Macros'
      OnExecute = ecMacro18Execute
    end
    object ecMacro19: TAction
      Category = 'Macros'
      OnExecute = ecMacro19Execute
    end
    object ecMacro20: TAction
      Category = 'Macros'
      OnExecute = ecMacro20Execute
    end
    object ecMacro21: TAction
      Category = 'Macros'
      OnExecute = ecMacro21Execute
    end
    object ecMacro22: TAction
      Category = 'Macros'
      OnExecute = ecMacro22Execute
    end
    object ecMacro23: TAction
      Category = 'Macros'
      OnExecute = ecMacro23Execute
    end
    object ecMacro24: TAction
      Category = 'Macros'
      OnExecute = ecMacro24Execute
    end
    object ecMacro25: TAction
      Category = 'Macros'
      OnExecute = ecMacro25Execute
    end
    object ecMacro26: TAction
      Category = 'Macros'
      OnExecute = ecMacro26Execute
    end
    object ecMacro27: TAction
      Category = 'Macros'
      OnExecute = ecMacro27Execute
    end
    object ecMacro28: TAction
      Category = 'Macros'
      OnExecute = ecMacro28Execute
    end
    object ecMacro29: TAction
      Category = 'Macros'
      OnExecute = ecMacro29Execute
    end
    object ecMacro30: TAction
      Category = 'Macros'
      OnExecute = ecMacro30Execute
    end
    object ecJumpToLastMarker: TAction
      Category = 'Bk'
      OnExecute = ecJumpToLastMarkerExecute
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
    object ecSelToken: TAction
      Category = 'Select'
      OnExecute = ecSelTokenExecute
    end
    object fProps: TAction
      Category = 'File'
      OnExecute = fPropsExecute
    end
    object ecInsertColor: TAction
      Category = 'Edit'
      Caption = 'ecInsertColor'
      OnExecute = ecInsertColorExecute
    end
    object ecGotoSelEdge: TAction
      Category = 'Goto'
      OnExecute = ecGotoSelEdgeExecute
    end
    object ecReplaceSelFromClipAll: TAction
      Category = 'Find'
      OnExecute = ecReplaceSelFromClipAllExecute
    end
    object fRereadOut: TAction
      Category = 'File'
      OnExecute = fRereadOutExecute
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
    object fFavAddFile: TAction
      Category = 'Fav'
      OnExecute = fFavAddFileExecute
    end
    object fFavAddProj: TAction
      Category = 'Fav'
      OnExecute = fFavAddProjExecute
    end
    object fFavManage: TAction
      Category = 'Fav'
      OnExecute = fFavManageExecute
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
    object fRename: TAction
      Category = 'File'
      OnExecute = fRenameExecute
    end
    object ecNumericConverter: TAction
      Category = 'Edit'
      OnExecute = ecNumericConverterExecute
    end
    object ecIndentLike1st: TAction
      Category = 'Edit'
      OnExecute = ecIndentLike1stExecute
    end
    object fColumnMarkers: TAction
      Category = 'File'
      OnExecute = fColumnMarkersExecute
    end
    object ecJumpColumnMarkerLeft: TAction
      Category = 'Goto'
      OnExecute = ecJumpColumnMarkerLeftExecute
    end
    object ecJumpColumnMarkerRight: TAction
      Category = 'Goto'
      OnExecute = ecJumpColumnMarkerRightExecute
    end
    object ecPasteNoCurChange: TAction
      Category = 'Edit'
      OnExecute = ecPasteNoCurChangeExecute
    end
    object ecJumpMixedCaseLeft: TAction
      Category = 'Goto'
      OnExecute = ecJumpMixedCaseLeftExecute
    end
    object ecJumpMixedCaseRight: TAction
      Category = 'Goto'
      OnExecute = ecJumpMixedCaseRightExecute
    end
    object ecCancelSelection: TAction
      Category = 'Edit'
      OnExecute = ecCancelSelectionExecute
    end
    object ecCenterLines: TAction
      Category = 'EditBlank'
      OnExecute = ecCenterLinesExecute
    end
    object ecToggleFocusTabs: TAction
      Category = 'Focus'
      OnExecute = ecToggleFocusTabsExecute
    end
    object ecExtendSelByLine: TAction
      Category = 'Select'
      OnExecute = ecExtendSelByLineExecute
    end
    object ecEncodeHtmlChars: TAction
      Category = 'Edit'
      OnExecute = ecEncodeHtmlCharsExecute
    end
    object ecSortDialog: TAction
      Category = 'Edit'
      OnExecute = ecSortDialogExecute
    end
    object ecSelBrackets: TAction
      Category = 'Select'
      OnExecute = ecSelBracketsExecute
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
    object ecPasteToColumn1: TAction
      Category = 'Edit'
      OnExecute = ecPasteToColumn1Execute
    end
    object ecCommandsList: TAction
      Category = 'View'
      OnExecute = ecCommandsListExecute
    end
    object ecScrollToSel: TAction
      Category = 'Goto'
      OnExecute = ecScrollToSelExecute
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
    object ecToggleView2: TAction
      Category = 'View'
      OnExecute = ecToggleView2Execute
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
    Left = 232
    Top = 280
  end
  object PropsManager: TPropsManager
    Template = TemplateEditor
    IniSection = 'Template'
    UseRegistry = False
    Properties.Strings = (
      ';Editor'
      'BlockIndent'
      'CollapseBreakColor'
      'Color'
      'DefaultStyles.CurrentLine.BgColor'
      'DefaultStyles.CurrentLine.Enabled'
      'DefaultStyles.CurrentLine.Font.Color'
      'DefaultStyles.SearchMark.BgColor'
      'DefaultStyles.SearchMark.Font.Color'
      'DefaultStyles.SelectioMark.BgColor'
      'DefaultStyles.SelectioMark.Font.Color'
      'DefaultStyles.CollapseMark.BgColor'
      'DefaultStyles.CollapseMark.Font.Color'
      'DisableFolding'
      'Font'
      'Gutter.Bands[0].Color'
      'Gutter.Bands[1].Color'
      'Gutter.Bands[2].Color'
      'Gutter.Bands[3].Color'
      'Gutter.CollapsePen.Color'
      'HorzRuler.Color'
      'HorzRuler.Height'
      'HorzRuler.Font'
      'HorzRuler.Visible'
      'LineNumbers.Font'
      'LineNumbers.Margin'
      'LineNumbers.NumberingStyle'
      'LineNumbers.UnderColor'
      'LineNumbers.Visible'
      'LineSpacing'
      'LineStateDisplay.ModifiedColor'
      'LineStateDisplay.NewColor'
      'LineStateDisplay.SavedColor'
      'LineStateDisplay.UnchangedColor'
      'NonPrinted.Color'
      'NonPrinted.Visible'
      'Options'
      'OptionsEx'
      'RightMargin'
      'RightMarginColor'
      'SelectModeDefault'
      'ShowLineEnds'
      'ShowRightMargin'
      'StapleOffset'
      'StaplePen.Color'
      'StaplePen.Style'
      'SyncEditing.SyncRangeStyle.BgColor'
      'TabList.AsString'
      'TabMode'
      'UndoLimit'
      'WordWrap'
      'Zoom'
      ';Out'
      'ListOut.Color'
      'ListOut.Font'
      ';ACP'
      'ecACP.FilterType'
      'ecACP.Font'
      'ecACP.DropDownCount'
      ';Keys'
      'SyntKeyMapping.AsString'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 296
    Top = 280
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
  object PopupEditor: TTBXPopupMenu
    Images = ImageListIconsStd
    OnPopup = PopupEditorPopup
    Left = 296
    Top = 304
    object TBXItemCtxUndo: TTBXItem
      Action = ecUndo
      OnSelect = ButtonOnSelect
    end
    object TBXItemCtxRedo: TTBXItem
      Action = ecRedo
      OnSelect = ButtonOnSelect
    end
    object TBXSeparatorItem14: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemCtxCut: TTBXItem
      ImageIndex = 8
      OnClick = TBXItemCtxCutClick
      OnSelect = ButtonOnSelect
      Caption = 'Cut'
      Hint = 'Cut selection to clipboard'
    end
    object TBXItemCtxCopy: TTBXItem
      ImageIndex = 7
      OnClick = TBXItemCtxCopyClick
      OnSelect = ButtonOnSelect
      Caption = 'Copy'
      Hint = 'Copy selection to clipboard'
    end
    object TBXItemCtxPaste: TTBXItem
      ImageIndex = 9
      OnClick = TBXItemCtxPasteClick
      OnSelect = ButtonOnSelect
      Caption = 'Paste'
      Hint = 'Paste clipboard'
    end
    object TBXItemCtxDel: TTBXItem
      ImageIndex = 10
      OnClick = TBXItemCtxDelClick
      OnSelect = ButtonOnSelect
      Caption = 'Delete'
      Hint = 'Clear current selection'
    end
    object TBXSeparatorItem13: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemCtxSelectAll: TTBXItem
      ImageIndex = 11
      OnClick = TBXItemCtxSelectAllClick
      OnSelect = ButtonOnSelect
      Caption = 'Select all'
      Hint = 'Select all text'
    end
    object TBXSeparatorItem23: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemCtxCopyUrl: TTBXItem
      Enabled = False
      ImageIndex = 33
      OnClick = TBXItemCtxCopyUrlClick
      OnSelect = ButtonOnSelect
      Caption = 'Copy link'
      Hint = 'Copy URL to clipboard'
    end
    object TBXItemCtxOpenSel: TTBXItem
      Enabled = False
      ImageIndex = 0
      OnClick = TBXItemCtxOpenSelClick
      OnSelect = ButtonOnSelect
      Caption = ''
      Hint = 'Open selected filename in separate tab'
    end
    object TBXItemCtxAddColor: TTBXItem
      Enabled = False
      OnClick = TBXItemCtxAddColorClick
      OnSelect = ButtonOnSelect
      Caption = 'Add to recent colors'
      Hint = 'Add color token to "Recent colors" menu'
    end
    object TBXItemCtxFindID: TTBXItem
      Enabled = False
      OnClick = TBXItemCtxFindIDClick
      OnSelect = ButtonOnSelect
      Caption = 'Find ID'
      Hint = 'Find current ID declaration (only for few lexers)'
    end
    object TBXSubmenuItemCtxMore: TTBXSubmenuItem
      OnPopup = TBXSubmenuItemCtxMorePopup
      Caption = 'more'
      Hint = ''
      object TBXItemCtxPasteNoCurChange: TTBXItem
        Action = ecPasteNoCurChange
        OnSelect = ButtonOnSelect
        Caption = 'Paste, keep position'
        Hint = 'Paste from clipboard, and then restore caret position'
      end
      object TBXItemCtxPasteToColumn1: TTBXItem
        Action = ecPasteToColumn1
        OnSelect = ButtonOnSelect
        Caption = 'Paste to 1st column'
        Hint = 'Paste into first line column'
      end
      object TBXSeparatorItem80: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemCtxCopyAppend: TTBXItem
        OnClick = TBXItemCtxCopyAppendClick
        OnSelect = ButtonOnSelect
        Caption = 'Copy/Append'
        Hint = 'Append selection to clipboard'
      end
      object TBXItemCtxCutAppend: TTBXItem
        OnClick = TBXItemCtxCutAppendClick
        OnSelect = ButtonOnSelect
        Caption = 'Cut/Append'
        Hint = 'Cut selection and append it to clipboard'
      end
      object TBXSeparatorItem34: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemCtxCopyHTML: TTBXItem
        Action = ecCopyAsHTML
        OnSelect = ButtonOnSelect
        Hint = 'Copy to clipboard in HTML format'
      end
      object TBXItemCtxCopyRTF: TTBXItem
        Action = ecCopyAsRTF
        OnSelect = ButtonOnSelect
        Hint = 'Copy to clipboard in RTF format'
      end
    end
    object TBXItemCtxCustomize: TTBXItem
      ImageIndex = 4
      OnClick = TBXItemCtxCustomizeClick
      Caption = 'Customize...'
      Hint = ''
    end
    object TBXSeparatorItem45: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemCC1: TTBXItem
      OnClick = TBXItemCC1Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC2: TTBXItem
      OnClick = TBXItemCC2Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC3: TTBXItem
      OnClick = TBXItemCC3Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC4: TTBXItem
      OnClick = TBXItemCC4Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC5: TTBXItem
      OnClick = TBXItemCC5Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC6: TTBXItem
      OnClick = TBXItemCC6Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC7: TTBXItem
      OnClick = TBXItemCC7Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC8: TTBXItem
      OnClick = TBXItemCC8Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC9: TTBXItem
      OnClick = TBXItemCC9Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC10: TTBXItem
      OnClick = TBXItemCC10Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC11: TTBXItem
      OnClick = TBXItemCC11Click
      Caption = ''
      Hint = ''
    end
    object TBXItemCC12: TTBXItem
      OnClick = TBXItemCC12Click
      Caption = ''
      Hint = ''
    end
  end
  object ImgListGutter: TTBImageList
    Left = 232
    Top = 244
    Bitmap = {
      494C01010E001300040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      380092725C000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000002424240063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      63009C6840000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003636360063636300C996
      6300C9966300C9966300C9966300C9966300C9966300C9966300C9966300C996
      6300AF7B4E000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003D3D3D0063636300CC99
      6600CC996600CC9966003633FF00CC996600CC9966003633FF00CC996600CC99
      6600B58153000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000003D3D3D006C6C6C00D09D
      6A00D09D6A00D09D6A003B38FF004542FF004542FF003B38FF00D09D6A00D09D
      6A00B58153000000000000000000000000000000000000000000000000000000
      0000000000008000000080000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000444444006C6C6C00D3A0
      6D00D3A06D00D3A06D00433FFF006969FF006969FF00433FFF00D3A06D00D3A0
      6D00BA8656000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004444440074747400D9A6
      7300D9A67300D9A673004542FF006969FF006969FF004542FF00D7A47100D7A4
      7100BE8A5A000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004444440074747400DBA8
      7500DBA87500DBA875004542FF006969FF006969FF004542FF00D9A67300D9A6
      7300C18E5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4D4D007A7A7A00DEAB
      7800DEAB7800DEAB78004D47FF007A7AFF007A7AFF004D47FF00DEAB7800DEAB
      7800C18E5D000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4D4D007A7A7A00E1AE
      7B00E1AE7B00E1AE7B004D47FF007A7AFF007A7AFF004D47FF00E1AE7B00E1AE
      7B00C69260000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000004D4D4D007A7A7A00E3B0
      7D00E3B07D00E3B07D00514CFF008383FF008383FF004D47FF00E3B07D00E3B0
      7D00C99663000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000005454540054545400CC99
      6600CC996600CC996600514CFF008383FF008383FF00514CFF00CC996600CC99
      6600C99663000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000800000008000000080000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000074747400BBBBAA00C1C1
      B100C7C7B900CFCFC300443EF6008C8CFF008C8CFF00443EF600F7F7F6000000
      0000BBBBAA000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000B8B8B80074747400CC99
      6600CC996600CC996600777FE700555BEF00555BEF00777FE700CC996600CC99
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
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFF000000008007FFFF00000000
      8007FFFF000000008007FEFF000000008007FCFF000000008007F83F00000000
      8007FCDF000000008007FEDF000000008007FFDF000000008007FFDF00000000
      8007FFDF000000008007FFDF000000008007FE3F000000008017FFFF00000000
      8007FFFF00000000FFFFFFFF00000000FFFFFFFF800180018007800700000000
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
  object TBXSwitcher: TTBXSwitcher
    Theme = 'Default'
    FlatMenuStyle = fmsEnable
    Left = 576
    Top = 232
  end
  object MRU: TTBXMRUList
    HidePathExtension = False
    MaxItems = 9
    Prefix = 'MRU'
    Left = 296
    Top = 388
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
        Caption = 'New file'
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
        Caption = 'Open File'
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
        Caption = 'Save File'
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
        Caption = 'Save As'
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
        Caption = 'Export to RTF'
        Category = 'File'
        DisplayName = 'Export to RTF'
      end
      item
        Command = 705
        KeyStrokes = <>
        Caption = 'Export to HTML'
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
        Caption = 'Options'
        Category = 'Options'
        DisplayName = 'Options dialog'
      end
      item
        Command = 710
        KeyStrokes = <>
        Caption = 'Edit Lexer'
        Category = 'Options'
        DisplayName = '"Customize lexer" dialog'
      end
      item
        Command = 711
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = '"Customize lexers library" dialog'
      end
      item
        Command = 565
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 24641
              end>
          end>
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
        Caption = 'Auto Complete Popup'
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
        Caption = 'Parameters Popup'
        Category = 'Hints'
        DisplayName = 'Parameters popup'
      end
      item
        Command = 651
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16458
              end>
          end>
        Caption = 'Template Popup'
        Category = 'Hints'
        DisplayName = 'Code template popup'
      end
      item
        Command = 0
        KeyStrokes = <>
        Caption = 'Context Help'
        Category = 'Hints'
        DisplayName = 'Context help'
      end
      item
        Command = 630
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16464
              end>
          end>
        Caption = 'Print'
        Category = 'Print'
        DisplayName = 'Print'
      end
      item
        Command = 632
        KeyStrokes = <>
        Caption = 'Print preview'
        Category = 'Print'
        DisplayName = 'Print preview'
      end
      item
        Command = 633
        KeyStrokes = <>
        Caption = 'Page setup'
        Category = 'Print'
        DisplayName = 'Page setup'
      end
      item
        Command = 634
        KeyStrokes = <>
        Category = 'Print'
        DisplayName = 'Printer setup'
      end
      item
        Command = 611
        KeyStrokes = <>
        Caption = 'Replace Next'
        Category = 'Search & Replace'
        DisplayName = 'Replace next'
      end
      item
        Command = 613
        KeyStrokes = <>
        Caption = 'Replace All'
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
        Caption = 'Show "Go to" dialog'
        Category = 'Go to'
        DisplayName = '"Go to" dialog'
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
        Caption = 'Find Current Word Prior'
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
        Caption = 'Find Current Word Next'
        Category = 'Search & Replace'
        DisplayName = 'Find current word next'
      end
      item
        Command = 603
        KeyStrokes = <>
        Caption = 'Find All'
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
        Caption = 'Find Previous'
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
        Caption = 'Find Next'
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
        Caption = 'Find Dialog'
        Category = 'Search & Replace'
        DisplayName = '"Find" dialog'
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
        Caption = 'Left-up'
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
        Caption = 'Last Char'
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
        Caption = 'First Char'
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
        Caption = 'End of Text'
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
        Caption = 'Begin of Text'
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
        Caption = 'Bottom of Page'
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
        Caption = 'Top of Page'
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to top of page'
      end
      item
        Command = 12
        KeyStrokes = <>
        Caption = 'Page Right'
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor left one page'
      end
      item
        Command = 11
        KeyStrokes = <>
        Caption = 'Page Left'
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
        Caption = 'Page Down'
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
        Caption = 'Page Up'
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor up one page'
      end
      item
        Command = 8
        KeyStrokes = <>
        Caption = 'End of Line'
        Category = 'Navigation, no select'
        DisplayName = 'Move cursor to end of line'
      end
      item
        Command = 7
        KeyStrokes = <>
        Caption = 'Begin of Line'
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
        Caption = 'Word Right'
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
        Caption = 'Word Left'
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
        Caption = '&Down'
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
        Caption = '&Up'
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
        Caption = '&Right'
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
        Caption = '&Left'
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
        Customizable = False
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
        Customizable = False
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
        Caption = 'Scroll Up'
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
        Caption = 'Scroll Down'
        Category = 'Scrolling'
        DisplayName = 'Scroll down one line leaving cursor position unchanged'
      end
      item
        Command = 313
        KeyStrokes = <>
        Caption = 'Scroll Left'
        Category = 'Scrolling'
        DisplayName = 'Scroll left one char leaving cursor position unchanged'
      end
      item
        Command = 314
        KeyStrokes = <>
        Caption = 'Scroll Right'
        Category = 'Scrolling'
        DisplayName = 'Scroll right one char leaving cursor position unchanged'
      end
      item
        Command = 315
        KeyStrokes = <>
        Caption = 'Scroll Page Up'
        Category = 'Scrolling'
        DisplayName = 'Scroll up one page leaving cursor position unchanged'
      end
      item
        Command = 316
        KeyStrokes = <>
        Caption = 'Scroll Page Down'
        Category = 'Scrolling'
        DisplayName = 'Scroll down one page leaving cursor position unchanged'
      end
      item
        Command = 317
        KeyStrokes = <>
        Caption = 'Scroll Page Left'
        Category = 'Scrolling'
        DisplayName = 'Scroll left one screen leaving cursor position unchanged'
      end
      item
        Command = 318
        KeyStrokes = <>
        Caption = 'Scroll Page Right'
        Category = 'Scrolling'
        DisplayName = 'Scroll right one screen leaving cursor position unchanged'
      end
      item
        Command = 319
        KeyStrokes = <>
        Caption = 'Scroll to begin'
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute beginning leaving cursor position unchanged'
      end
      item
        Command = 320
        KeyStrokes = <>
        Caption = 'Scroll to end'
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute end leaving cursor position unchanged'
      end
      item
        Command = 321
        KeyStrokes = <>
        Caption = 'Scroll to left'
        Category = 'Scrolling'
        DisplayName = 'Scroll to absolute left leaving cursor position unchanged'
      end
      item
        Command = 322
        KeyStrokes = <>
        Caption = 'Scroll to right'
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
        Caption = '&Copy'
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
        Caption = 'Cu&t'
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
        Caption = '&Paste'
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
        Caption = '&Undo'
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
        Caption = '&Redo'
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
        Caption = 'Select &All'
        Category = 'Standard actions'
        DisplayName = 'Select entire contents of editor, cursor to end'
      end
      item
        Command = 307
        KeyStrokes = <>
        Caption = '&Delete'
        Category = 'Standard actions'
        DisplayName = 'Delete current selection'
      end
      item
        Command = 310
        KeyStrokes = <>
        Caption = 'Copy as RTF'
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
          end>
        Caption = 'New Line'
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
        DisplayName = 'Insert a character at current position (Data = PChar)'
      end
      item
        Command = -1
        KeyStrokes = <>
        Category = 'Inserting text'
        DisplayName = 'Insert a whole string (Data = PChar)'
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
        Caption = '&Indent'
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
        Caption = '&Unindent'
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
          end>
        Caption = 'Back Delete Char'
        Category = 'Deleting text'
        DisplayName = 'Delete last char (i.e. backspace key)'
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
        Caption = 'Delete Char'
        Category = 'Deleting text'
        DisplayName = 'Delete char at cursor (i.e. delete key)'
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
        Caption = 'Delete Word'
        Category = 'Deleting text'
        DisplayName = 'Delete from cursor to next word'
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
        Caption = 'Back Delete Word'
        Category = 'Deleting text'
        DisplayName = 'Delete from cursor to start of word'
      end
      item
        Command = 335
        KeyStrokes = <>
        Caption = 'Delete to Line Begin'
        Category = 'Deleting text'
        DisplayName = 'Delete from cursor to beginning of line'
      end
      item
        Command = 336
        KeyStrokes = <>
        Caption = 'Delete to Line End'
        Category = 'Deleting text'
        DisplayName = 'Delete from cursor to end of line'
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
        Caption = 'Delete Line'
        Category = 'Deleting text'
        DisplayName = 'Delete current line'
      end
      item
        Command = 338
        KeyStrokes = <>
        Caption = 'Clear all'
        Category = 'Deleting text'
        DisplayName = 'Delete everything'
      end
      item
        Command = 371
        KeyStrokes = <>
        Caption = 'Insert Mode'
        Category = 'Selection modes'
        DisplayName = 'Set insert mode'
      end
      item
        Command = 372
        KeyStrokes = <>
        Caption = 'Overwrite Mode'
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
        Caption = 'Toggle Insert Mode'
        Category = 'Selection modes'
        DisplayName = 'Toggle insert/overwrite mode'
      end
      item
        Command = 374
        KeyStrokes = <>
        Caption = 'Normal Selection'
        Category = 'Selection modes'
        DisplayName = 'Normal selection mode'
      end
      item
        Command = 375
        KeyStrokes = <>
        Caption = 'Column Selection'
        Category = 'Selection modes'
        DisplayName = 'Column selection mode'
      end
      item
        Command = 376
        KeyStrokes = <>
        Caption = 'Line Selection'
        Category = 'Selection modes'
        DisplayName = 'Line selection mode'
      end
      item
        Command = 377
        KeyStrokes = <>
        Caption = 'Mark Selection Start'
        Category = 'Selection modes'
        DisplayName = 'Marks the beginning of a block'
      end
      item
        Command = 378
        KeyStrokes = <>
        Caption = 'Mark Selection End'
        Category = 'Selection modes'
        DisplayName = 'Marks the end of a block'
      end
      item
        Command = 360
        KeyStrokes = <>
        Caption = 'Word Upper Case'
        Category = 'Change case'
        DisplayName = 'Upper case to current or previous word'
      end
      item
        Command = 361
        KeyStrokes = <>
        Caption = 'Word Lower Case'
        Category = 'Change case'
        DisplayName = 'Lower case to current or previous word'
      end
      item
        Command = 362
        KeyStrokes = <>
        Caption = 'Word Toggle Case'
        Category = 'Change case'
        DisplayName = 'Toggle case to current or previous word'
      end
      item
        Command = 363
        KeyStrokes = <>
        Caption = 'Word Title Case'
        Category = 'Change case'
        DisplayName = 'Title case to current or previous word'
      end
      item
        Command = 365
        KeyStrokes = <>
        Caption = 'Selection Upper Case'
        Category = 'Change case'
        DisplayName = 'Upper case to current selection or current char'
      end
      item
        Command = 366
        KeyStrokes = <>
        Caption = 'Selection Lower Case'
        Category = 'Change case'
        DisplayName = 'Lower case to current selection or current char'
      end
      item
        Command = 367
        KeyStrokes = <>
        Caption = 'Selection Toggle Case'
        Category = 'Change case'
        DisplayName = 'Toggle case to current selection or current char'
      end
      item
        Command = 368
        KeyStrokes = <>
        Caption = 'Selection Title Case'
        Category = 'Change case'
        DisplayName = 'Title case to current selection'
      end
      item
        Command = 520
        KeyStrokes = <>
        Caption = 'Toggle Collapse'
        Category = 'Text folding'
        DisplayName = 'Collapse/expand block at current line'
      end
      item
        Command = 521
        KeyStrokes = <>
        Caption = 'Collapse'
        Category = 'Text folding'
        DisplayName = 'Collapse block at current line'
      end
      item
        Command = 522
        KeyStrokes = <>
        Caption = 'Expand'
        Category = 'Text folding'
        DisplayName = 'Expand block at current line'
      end
      item
        Command = 523
        KeyStrokes = <>
        Caption = 'Full Collapse'
        Category = 'Text folding'
        DisplayName = 'Collapse all blocks'
      end
      item
        Command = 524
        KeyStrokes = <>
        Caption = 'Full Expand'
        Category = 'Text folding'
        DisplayName = 'Expand all blocks'
      end
      item
        Command = 525
        KeyStrokes = <>
        Caption = 'Collapse Selection'
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
        Caption = 'Toggle Collapse Nearest'
        Category = 'Text folding'
        DisplayName = 'Collapse/expand nearest block'
      end
      item
        Command = 527
        KeyStrokes = <>
        Caption = 'Collapse in selection'
        Category = 'Text folding'
        DisplayName = 'Collapse ranges in selection'
      end
      item
        Command = 528
        KeyStrokes = <>
        Caption = 'Expand in selection'
        Category = 'Text folding'
        DisplayName = 'Expand ranges in selection'
      end
      item
        Command = -1
        KeyStrokes = <>
        Caption = 'Toggle Folding'
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
        Caption = 'Goto Bookmark 0'
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
        Caption = 'Goto Bookmark 1'
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
        Caption = 'Goto Bookmark 2'
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
        Caption = 'Goto Bookmark 3'
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
        Caption = 'Goto Bookmark 4'
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
        Caption = 'Goto Bookmark 5'
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
        Caption = 'Goto Bookmark 6'
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
        Caption = 'Goto Bookmark 7'
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
        Caption = 'Goto Bookmark 8'
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
        Caption = 'Goto Bookmark 9'
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
        Caption = 'Toggle Bookmark 0'
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
        Caption = 'Toggle Bookmark 1'
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
        Caption = 'Toggle Bookmark 2'
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
        Caption = 'Toggle Bookmark 3'
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
        Caption = 'Toggle Bookmark 4'
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
        Caption = 'Toggle Bookmark 5'
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
        Caption = 'Toggle Bookmark 6'
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
        Caption = 'Toggle Bookmark 7'
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
        Caption = 'Toggle Bookmark 8'
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
        Caption = 'Toggle Bookmark 9'
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
        Caption = 'Drop marker'
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
        Caption = 'Collect marker'
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
        Caption = 'Swap marker'
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
        Caption = 'Jump to matching bracket'
        Category = 'Go to'
        DisplayName = 'Jump to matching bracket'
      end
      item
        Command = 573
        KeyStrokes = <>
        Caption = 'Play macro'
        Category = 'Macros'
        DisplayName = 'Play last recorded macro'
      end
      item
        Command = 570
        KeyStrokes = <>
        Caption = 'Start macro recording'
        Category = 'Macros'
        DisplayName = 'Start macro recording'
      end
      item
        Command = 571
        KeyStrokes = <>
        Caption = 'Stop macro recording'
        Category = 'Macros'
        DisplayName = 'Stop macro recording'
      end
      item
        Command = 572
        KeyStrokes = <>
        Caption = 'Cancel macro recording'
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
        DisplayName = 'Zoom original'
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
        DisplayName = 'Close other tabs'
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
        DisplayName = '"Replace" dialog'
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
        DisplayName = '"Find/Replace in files" dialog'
      end
      item
        Command = 309
        KeyStrokes = <>
        Caption = 'Copy as HTML'
        Category = 'Clipboard operations'
        DisplayName = 'Copy to clipboard in HTML format'
      end
      item
        Command = 720
        KeyStrokes = <>
        Caption = 'Copy-Append'
        Category = 'Clipboard operations'
        DisplayName = 'Copy and append to clipboard'
      end
      item
        Command = 721
        KeyStrokes = <>
        Caption = 'Cut-Append'
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
        DisplayName = '"Extract strings" dialog'
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
        DisplayName = 'Move tab to other view'
      end
      item
        Command = 821
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Toggle synchronized horizontal scrolling'
      end
      item
        Command = 822
        KeyStrokes = <>
        Category = 'Miscellaneous'
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
        DisplayName = '"Fill block" dialog'
      end
      item
        Command = 825
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = '"Insert text" dialog'
      end
      item
        Command = 734
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16507
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Tree focus'
      end
      item
        Command = 735
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16501
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Clipboard focus'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16503
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Output focus'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16502
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Find Results focus'
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
        Category = 'Miscellaneous'
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
        DisplayName = '"Customize macros" dialog'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16506
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle editor view (panel) focus'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16500
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Validation focus'
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
        Category = 'Tabs'
        DisplayName = 'Split views 20/80'
      end
      item
        Command = 921
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 30/70'
      end
      item
        Command = 922
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 40/60'
      end
      item
        Command = 923
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 50/50'
      end
      item
        Command = 924
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 60/40'
      end
      item
        Command = 925
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 70/30'
      end
      item
        Command = 926
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views 80/20'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16505
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Minimap focus'
      end
      item
        Command = 867
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - select next node'
      end
      item
        Command = 868
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - select previous node'
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
        DisplayName = 'Activate tab on other view #1'
      end
      item
        Command = 931
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #2'
      end
      item
        Command = 932
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #3'
      end
      item
        Command = 933
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #4'
      end
      item
        Command = 934
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #5'
      end
      item
        Command = 935
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #6'
      end
      item
        Command = 936
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #7'
      end
      item
        Command = 937
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #8'
      end
      item
        Command = 938
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #9'
      end
      item
        Command = 939
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Activate tab on other view #10'
      end
      item
        Command = 927
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views - move splitter left'
      end
      item
        Command = 928
        KeyStrokes = <>
        Category = 'Tabs'
        DisplayName = 'Split views - move splitter right'
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
        DisplayName = 'Tree - select parent node'
      end
      item
        Command = 766
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - select next brother node'
      end
      item
        Command = 767
        KeyStrokes = <>
        Category = 'Syntax tree'
        DisplayName = 'Tree - select previous brother node'
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
        DisplayName = 'Open in default application'
      end
      item
        Command = 879
        KeyStrokes = <>
        Category = 'Selection operations'
        DisplayName = 'Select token'
      end
      item
        Command = 708
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 32781
              end>
          end>
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
        DisplayName = '"Color picker" dialog'
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
        KeyStrokes = <
          item
            KeyDefs = <
              item
                ShortCut = 16504
              end>
          end>
        Category = 'Focusing'
        DisplayName = 'Toggle Project focus'
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
        Category = 'Options'
        DisplayName = 'Toggle slave view (same file splitting)'
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
        Category = 'Options'
        DisplayName = 'Toggle views splitter vert/horz'
      end
      item
        Command = 771
        KeyStrokes = <>
        Category = 'Options'
        DisplayName = 'Toggle master/slave splitter vert/horz'
      end
      item
        Command = 772
        KeyStrokes = <>
        Category = 'Bookmarks'
        DisplayName = '"Go to bookmark" dialog'
      end
      item
        Command = 888
        KeyStrokes = <>
        Category = 'Miscellaneous'
        DisplayName = 'Lorem Ipsum generator'
      end
      item
        Command = 773
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Add current file to Favourites'
      end
      item
        Command = 774
        KeyStrokes = <>
        Category = 'File'
        DisplayName = 'Organize Favourites'
      end
      item
        Command = 776
        KeyStrokes = <>
        Category = 'Focusing'
        DisplayName = 'Toggle Text Clips focus'
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
        DisplayName = '"Go to portable bookmark" dialog'
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
        DisplayName = 'Numeric converter'
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
        DisplayName = 'Toggle Tabs pane focus'
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
        DisplayName = 'Show "Sort lines" dialog'
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
        Category = 'Miscellaneous'
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
        Category = 'Go to'
        DisplayName = '"Project files list" dialog'
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
        Category = 'Tabs'
        DisplayName = 'Toggle second view visible'
      end>
    UseFirstControlKeys = True
    Left = 264
    Top = 280
  end
  object Timer1: TTimer
    Interval = 500
    OnTimer = Timer1Timer
    Left = 296
    Top = 360
  end
  object PopupCP: TTBXPopupMenu
    OnPopup = PopupCPPopup
    Left = 232
    Top = 304
  end
  object PopupLE: TTBXPopupMenu
    OnPopup = PopupLEPopup
    Left = 264
    Top = 304
    object TBXItemEndWin: TTBXItem
      Tag = 1
      Checked = True
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
      Caption = 'Windows (CR LF)'
      Hint = ''
    end
    object TBXItemEndUn: TTBXItem
      Tag = 3
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
      Caption = 'Unix (LF)'
      Hint = ''
    end
    object TBXItemEndMac: TTBXItem
      Tag = 2
      GroupIndex = 1
      RadioItem = True
      OnClick = SetFormat
      Caption = 'Mac (CR)'
      Hint = ''
    end
  end
  object ImgListTree: TImageList
    Left = 256
    Top = 244
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
    BgColor = clWindow
    CommandID = 650
    Width = 300
    Height = 200
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 150
    ToolHint.Height = 0
    ToolHint.Active = True
    ToolHint.Styles = SyntStyles
    ToolHint.Formatted = True
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
    Controls = <>
    CommandID = 652
    Left = 512
    Top = 232
  end
  object TemplatePopup: TTemplatePopup
    Templates = <>
    Options = [ctIncludeOwn, ctIncludeLexer, ctEnableSearch, ctDisplayShortCut, ctDisplayDesc, ctRightDesc, ctFiltered]
    SortType = ctsName
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    BgColor = clWindow
    CommandID = 651
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    ToolHint.Styles = SyntStyles
    Controls = <>
    OnShow = TemplatePopupShow
    Left = 544
    Top = 232
  end
  object PopupLex: TTBXPopupMenu
    OnPopup = PopupLexPopup
    Left = 320
    Top = 304
  end
  object ImageListIconsStd: TImageList
    Left = 256
    Top = 168
    Bitmap = {
      494C01012D003100040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      000000000000360000002800000040000000D0000000010020000000000000D0
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000EBEEFA001E42
      DF00ECEFFB001E42DF00ECEFFB001E42DF00EBEEFA001E42DF00EBEEFA001E42
      DF00ECEFFB000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001E42DF0094A4
      E9001E42DF0099A9EE001E42DF0096A6EA001E42DF0093A3E7001E42DF0091A1
      E5001E42DF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000043434300A0A0
      A00043434300000000004343430043434300A0A0A00000000000A0A0A0004242
      4200A0A0A0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000075757500D0D0
      D0004747470000000000474747000000000047474700D1D1D100474747000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A4
      A4004B4B4B00000000004B4B4B00000000004B4B4B00D1D1D1004B4B4B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A6A6A6007A7A
      7A00A6A6A600000000004E4E4E004E4E4E00A6A6A60000000000A6A6A6004E4E
      4E00A6A6A6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000051515100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000A9A9A900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00F8F8
      F800EAEAEA00DBDBDB00CFCFCF00ABC3AA0036823300ABC3AA00D2D2D200DADA
      DA00E3E3E300EDEDED00F7F7F700FDFDFD00000000002E2E2E00303030003030
      3000303030003030300030303000303030002E2E2E0030303000303030003030
      3000303030002E2E2E00303030002E2E2E00000000002D2D2D00303030003030
      3000303030003030300030303000303030002D2D2D0030303000303030003030
      3000303030002D2D2D00303030002D2D2D00000000002D2D2D00303030003030
      30003030300030303000303030002D2D2D003030300030303000303030003030
      3000303030002D2D2D00303030002D2D2D00FFFFFF00FFFFFF00FFFFFF00FBFB
      FB00F4F4F400EDEDED00ADCAAB003B96330024D413003B963300AECAAC00ECEC
      EC00F1F1F100F6F6F600FBFBFB00FEFEFE000000000098989800000000009595
      9500000000000000000000000000959595000000000000000000000000000000
      0000000000000000000095959500303030000000000098989800F8F8F800CCCC
      CC00F8F8F80015AD6100F8F8F800CCCCCC0030303000CCCCCC00F8F8F80011AC
      5E00F8F8F800CACACA00F6F6F600303030000000000098989800F8F8F800CCCC
      CC00F8F8F800CCCCCC00F8F8F80030303000F8F8F800CCCCCC00F8F8F800CCCC
      CC00F8F8F800CACACA00F6F6F60030303000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00BADDB7003D9F330033CA22002EC71D002AC519003D9F3300BADD
      B700FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500959595002E2E2E000000000095959500CACACA00F6F6
      F60014AB5F0027B46D00CACACA00F6F6F6002D2D2D00F6F6F600CACACA001DAF
      660028B46E00F6F6F600CACACA002D2D2D000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA002D2D2D00CACACA00F6F6F600CACACA0020B3
      6900CCCCCC00F6F6F600CACACA002D2D2D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C4E3C1003EA4330049CA380042C531003EA4330037BC260032B921003EA4
      3300BADFB700FFFFFF00FFFFFF00FFFFFF000000000098989800000000009595
      9500000000000000000000000000000000000000000095959500000000000000
      0000000000000000000095959500303030000000000098989800F6F6F6000094
      4A00049A4F0008A1550008964E0008964E0007934D0008904C0008904C000B9F
      550015AD610020B36900F6F6F600303030000000000098989800F6F6F600CCCC
      CC00F6F6F600CCCCCC00F6F6F6002D2D2D00F6F6F600CCCCCC0028B46E0015AD
      610012A45B00CACACA00F6F6F60030303000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF009FD499005ACF490063DA52003FAA33009FD399003FAA330042BB31003CB5
      2B003FAA3300BBE1B700FFFFFF00FFFFFF000000000095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      95009595950095959500959595002E2E2E000000000095959500CCCCCC00F6F6
      F60004954C00099A5100CCCCCC00F6F6F6002D2D2D00F6F6F600CCCCCC000793
      4D0012A45B00F6F6F600CACACA002D2D2D000000000095959500CCCCCC00F6F6
      F600CCCCCC00F6F6F600CCCCCC002D2D2D00CCCCCC0011AC5E001DAF66000B9F
      550007934D0002994E00CACACA002D2D2D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00EBF6EA005DBA510070C26600CFEACC00FFFFFF00CFEACC0041AF33005ED5
      4D005BD24A0041AF3300BCE3B700FFFFFF000000000098989800F8F8F800CCCC
      CC00F8F8F800CCCCCC00F8F8F800CCCCCC00F8F8F800CCCCCC00F8F8F800CCCC
      CC00F8F8F800CACACA00F6F6F600303030000000000098989800F8F8F800CCCC
      CC00F8F8F800049A4F00F8F8F800CCCCCC002D2D2D00CCCCCC00F8F8F8000299
      4E00F8F8F800CACACA00F6F6F600303030000000000098989800F8F8F8000000
      00000000000000000000F8F8F8002D2D2D00F8F8F800CCCCCC00F8F8F8000897
      4F00F8F8F800CACACA00F6F6F60030303000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00CFEBCC0042B3
      33006AE1590068DF570042B33300C5E8C1000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA00F6F6F600CACACA00F6F6F600CACACA00F6F6
      F600CCCCCC00F6F6F600CACACA002E2E2E000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA00F6F6F6002D2D2D00F6F6F600CACACA00F6F6
      F600CCCCCC00F6F6F600CACACA002D2D2D000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA002D2D2D00CACACA00F6F6F600CACACA000897
      4F00CCCCCC00F6F6F600CACACA002D2D2D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0043B7330072E9610060D85000A1DB99000000000098989800F6F6F600CCCC
      CC00F6F6F600CCCCCC00F6F6F600CCCCCC00F6F6F600CCCCCC00F6F6F600CCCC
      CC00F6F6F600CACACA00F6F6F600303030000000000098989800F6F6F600CCCC
      CC00F6F6F600CCCCCC000000000000000000000000000000000000000000CCCC
      CC00F6F6F600CACACA00F6F6F600303030000000000098989800F6F6F6000000
      00000000000000000000F6F6F6002D2D2D00F6F6F60015AD610027B46D0008A1
      5500099A5100049A4F00F6F6F600303030003A3A3A00E6E6E6003A3A3A00E6E6
      E6003A3A3A00E6E6E6003A3A3A00E6E6E6003A3A3A00E6E6E6003A3A3A00FFFF
      FF00D0EDCC0072CB66005FC45100EBF7EA000000000095959500CCCCCC00F6F6
      F600CCCCCC00F6F6F600CCCCCC00F6F6F600CCCCCC00F6F6F600CCCCCC00F6F6
      F600CCCCCC00F6F6F600CACACA002E2E2E000000000095959500CCCCCC00F6F6
      F600CCCCCC00F6F6F600CCCCCC00F6F6F6002D2D2D00F6F6F600CCCCCC00F6F6
      F600CCCCCC00F6F6F600CACACA002D2D2D000000000095959500CCCCCC00F6F6
      F600CCCCCC00F6F6F600CCCCCC002D2D2D00CCCCCC00F6F6F60014AB5F00049A
      4F0004954C00F6F6F600CACACA002D2D2D00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FAFAFA00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000098989800F8F8F800CCCC
      CC00F8F8F800CCCCCC00F8F8F800CCCCCC00F8F8F800CCCCCC00F8F8F800CCCC
      CC00F6F6F600CCCCCC00F6F6F600303030000000000098989800F8F8F800CCCC
      CC00F8F8F800CCCCCC000000000000000000000000000000000000000000CCCC
      CC00F6F6F600CCCCCC00F6F6F600303030000000000098989800F8F8F800CCCC
      CC00F8F8F800CCCCCC00F8F8F8002D2D2D00F8F8F800CCCCCC00F8F8F8000094
      4A00F6F6F600CCCCCC00F6F6F6003030300043434300A0A0A00043434300FFFF
      FF004343430043434300A0A0A000FFFFFF00A0A0A00043434300A0A0A000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA00F6F6F600CACACA00F8F8F800CCCCCC00F8F8
      F800CCCCCC00F8F8F800CCCCCC00303030000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA00F6F6F6002D2D2D00F8F8F800CCCCCC00F8F8
      F800CCCCCC00F8F8F800CCCCCC00303030000000000095959500CACACA00F6F6
      F600CACACA00F6F6F600CACACA002D2D2D00CCCCCC00F8F8F800CCCCCC00F8F8
      F800CCCCCC00F8F8F800CCCCCC003030300075757500D0D0D00047474700FFFF
      FF0047474700FFFFFF0047474700D1D1D10047474700FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000098989800922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002E2E2E000000000098989800922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002D2D2D000000000098989800922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002D2D2D00FFFFFF00A4A4A4004B4B4B00FFFF
      FF004B4B4B00FFFFFF004B4B4B00D1D1D1004B4B4B00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000095959500922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002E2E2E000000000095959500922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002D2D2D000000000095959500922E2E00922E
      2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E2E00922E
      2E00922E2E00922E2E00922E2E002D2D2D00A6A6A6007A7A7A00A6A6A600FFFF
      FF004E4E4E004E4E4E00A6A6A600FFFFFF00A6A6A6004E4E4E00A6A6A600FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595000000000095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      9500959595009595950095959500959595000000000095959500959595009595
      9500959595009595950095959500959595009595950095959500959595009595
      950095959500959595009595950095959500FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0051515100FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00A9A9A900FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000000000000000000000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400000000000000000000000000848484000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000000000008000
      0000000000000000000080000000000000000000000000000000000000000000
      00007F7F7F0000000000000000000000000000000000000000007F7F7F000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000800000008000000080000000000000000000000000000000000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000000000C6C6C600000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000008000
      0000000000000000000080000000000000000000000000000000000000000000
      0000000000007F7F7F000000000000000000000000007F7F7F00000000000000
      000000000000000000000000000000000000000000000000000000000000C6C6
      C60000000000000000000000000000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C60000000000000000000000000000000000C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F7F7F00000000007F7F7F0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000848484000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004040400040404000404040004040400000000000404040004040
      4000404040004040400000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000040404000C0C0C000F0FBFF00C0C0C000F0FBFF0040404000F0FBFF00C0C0
      C000F0FBFF00C0C0C00040404000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF0000FFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004040
      4000C0C0C0004040400040404000404040004040400040404000404040004040
      40004040400040404000C0C0C00040404000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0C0000000
      0000C0C0C00000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000004040
      4000F0FBFF00404040000000000040404000C0C0C000C0C0C000C0C0C0004040
      40000000000040404000F0FBFF0040404000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000004040
      4000C0C0C0004040400040404000404040004040400040404000404040004040
      40004040400040404000C0C0C00040404000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000040404000C040
      400040404000C0C0C000F0FBFF00C0C0C000F0FBFF0040404000F0FBFF00C0C0
      C000F0FBFF00C0C0C0004040400000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000000000000000000000000000000000000000000040404000C0404000C040
      4000C040400040404000404040004040400040404000C0404000404040004040
      400040404000404040000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000FFFF0000FFFF0000FFFF00000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000A4A0A000C0404000C0404000C040
      4000C040400040A0400040A0400040A0400040A04000C0404000C0404000A4A0
      A00000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF000000
      0000C0C0C00000000000C0C0C000000000000000000000000000FFFFFF000000
      00000000000000000000C6C6C6000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000A4A0A000C0404000C0404000C040
      4000C040400040A0400040A0400040A0400040A04000C0A04000C04040004040
      400000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF0000000000C0C0C00000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A0A000C0404000C0404000A4A0
      A00040A0400040A0400040A0400040A0400040A04000C0404000C04040004040
      400000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF00FFFFFF00FFFFFF00FFFFFF0000FFFF0000FFFF0000FF
      FF00C0C0C00000000000C0C0C00000000000000000000000000000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00000000000000
      000000000000000000000000000000000000A4A0A000C0404000A4A0A00040A0
      400040A0400040A0400040A04000C0404000C0A04000C040400040A040004040
      400000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000000000000000000000000000FFFF0000FFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A0A000C0404000C0C0C000A4A0
      A000A4A0A000C040400040A0400040A04000C040400040A0400040A040004040
      400000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000A4A0A000A4A0A000C0404000F0FB
      FF00C0C0C000C0404000C0404000C0404000C040400040A0400040A04000A4A0
      A00000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000000000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      00000000000000000000000000000000000000000000A4A0A000F0FBFF00C0C0
      C000F0FBFF00A4A0A00040A0400040A0400040A0400040A04000404040000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000A4A0A000A4A0
      A000C0A04000C0C0C000A4A0A000A4A0A00040A0400040404000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000A4A0
      A000A4A0A000A4A0A000A4A0A000A4A0A000A4A0A00000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      8000800080008000800080008000800080008000800080008000800080008000
      8000800080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C00000FFFF0000FFFF0000FFFF00C0C0C000C0C0
      C000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6
      C60084848400000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000808080008080800080808000C0C0C000C0C0
      C00000000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6C600FFFF
      000084848400848484000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000C0C0C000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C60084848400C6C6C6000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF0000000000000000000000000000000000C0C0C000C0C0C000C0C0
      C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0000000
      0000C0C0C00000000000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C600FFFF0000C6C6C600C6C6
      C60084848400C6C6C6000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C00000000000C0C0C00000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF000000000084848400FFFF0000FFFF0000C6C6
      C60084848400848484000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000C0C0C00000000000C0C0C000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000084848400C6C6C600C6C6
      C60084848400000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C0008000
      8000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF000000000000000000000000000000000000000000FFFF
      FF00000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000C6C6C6000000
      0000000000000000000000000000000000000000000000000000000000008000
      800080008000800080008000800080008000800080008000800000000000C0C0
      C000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000000000000000
      000000000000000000000000000000000000000000000000000000000000C0C0
      C000C0C0C00080008000C0C0C000C0C0C000C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0008000000080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0008000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008400000084000000840000008400
      0000000000000000000000000000000000000000000000000000000000008383
      8300FFFFFF008484840084848400858585008484840084848400848484008484
      840084848400FFFFFF0011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C00080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084000000000000008484
      8400840000000000000000000000000000000000000000000000000000008585
      8500FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080000000800000008000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008411110000000000000000008585
      8500FFFFFF008585850084848400848484008383830084848400848484008484
      840083838300FFFFFF0011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008411110084111100000000008484
      8400FF001100FF010000FE000000FE010000FE000000FE000900FF000A00FE00
      0000FF020000FF00090011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080000000800000008000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000840000000000000000000000000000008512110084111100000000008383
      8300FE010000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FE00000011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C00080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00008400000000000000000000000000000083151B0000000000000000008383
      8300FE000900FE000900FF010000FF020000FF010000FF030000FF030000FF01
      0000FF001100FF01000011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C0008000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400FFFFFF008383830083838300848484008484840084848400838383008484
      840084848400FFFFFF0011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0008000000080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000000000008484
      8400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0011111100000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C000C0C0C000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000008484
      8400FFFFFF0085858500838383008484840085858500FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0011111100000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C00080000000800000008000
      0000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000008383
      8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000001111110011111100000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C00080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC000000000000000000000000000000000000000000848484000000
      0000000000000000000084848400000000000000000000000000000000008383
      8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000EEEEEE001111110000000000000000000000000000000000000000000000
      0000848484000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C0008000000080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000D8E9EC000000000000000000000000000000000000000000848484008484
      8400848484008484840000000000000000000000000000000000000000008383
      8300FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF001111
      1100111111000000000000000000000000000000000000000000000000000000
      0000000000008484840000000000000000000000000000000000000000000000
      000000000000000000000000000000000000C0C0C000C0C0C00080000000C0C0
      C000C0C0C0000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840085858500848484008585850084848400858585001111
      1100000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008989
      8900898989008989890089898900898989008989890089898900898989008989
      8900898989008989890089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000000000008989
      8900898989008989890089898900898989008989890089898900898989008989
      8900898989008989890089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000008989
      8900898989008989890089898900898989008989890089898900898989008989
      8900898989008989890089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000008989
      8900898989008989890089898900898989008989890089898900898989008989
      8900898989008989890089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008989
      8900898989008989890089898900898989008989890089898900898989008989
      8900898989008989890089898900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F0000007F0000007F0000007F0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F0000000000
      0000000000000000000000000000000000007F0000007F0000007F0000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F0000000000
      0000000000000000000000000000000000007F0000007F0000007F0000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FF000000FF000000FF00
      0000FF000000FF000000FF000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F00
      00000000000000000000000000007F00000000000000000000007F0000000000
      000000000000000000000000000000000000FF000000FF000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008C8F
      8F00070707000000000000000000000000000000000000000000000000008080
      8000000000000000000000000000000000000000000000000000000000000000
      00007F0000007F0000007F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FF0000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000007F0000007F0000007F0000007F000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F0000007F00
      00007F000000000000007F0000007F0000007F00000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000000000000000000000000000007F000000000000000000000000000000
      00007F7F7F00000000007F7F7F000000000000000000000000007F7F7F007F00
      00000000000000000000000000007F0000007F7F7F0000000000000000000000
      00007F7F7F00000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7F0000007F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F00
      00007F0000007F0000007F0000007F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007F0000007F0000000000000000000000000000000000000000007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000007F7F
      7F007F000000000000007F0000007F7F7F000000000000000000000000007F7F
      7F000000000000000000000000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007F0000007F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F0000007F0000007F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      0000000000000000000000007F0000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00007F7F7F007F0000007F7F7F00000000000000000000000000000000000000
      0000000000000000000000000000000000007F7F7F0000000000000000000000
      000000000000000000007F7F7F00000000000000000000000000000000000000
      000000000000000000000000000000000000000000007F7F7F00000000000000
      0000000000007F7F7F0000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000007F0000007F0000007F0000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000007F7F
      7F00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F0000007F00
      00007F000000000000007F0000007F0000007F00000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000007F0000007F0000007F0000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F007F00
      00000000000000000000000000007F0000007F7F7F0000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000000000000000000000000000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F0000007F00
      00007F0000007F00000000000000000000000000000000000000000000007F00
      00007F0000007F0000007F0000007F0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      7F0000007F000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000007F7F7F000000
      00007F7F7F000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F00000000000000000000000000000000000000000000007F00
      00007F0000007F00000000000000000000000000000000000000000000007F7F
      7F007F000000000000007F0000007F7F7F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000007F0000007F0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F00000000000000000000000000000000000000000000007F00
      00007F0000007F00000000000000000000000000000000000000000000000000
      00007F0000007F0000007F000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000007F0000007F00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000007F0000000000000000000000000000007F0000000000
      0000000000007F00000000000000000000000000000000000000000000000000
      00007F7F7F007F0000007F7F7F00000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      0000000000000000000000007F0000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000007F0000007F0000007F000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000007F00000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000007F000000
      7F0000007F0000007F0000007F0000007F000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000800000000000000000000000000000000000000000000000000000008000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000080000000000000000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000808080008000
      0000000000000000000000000000000000000000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000008000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000800000008000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000008000
      0000000000008000000000000000000000000000000000000000000000000000
      0000000000008000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000800000008000000000000000000000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000080000000808080000000000000000000000000000000
      0000800000008080800000000000000000000000000000000000808080008000
      0000000000000000000000000000000000008080800080000000000000000000
      0000000000008000000000000000000000000000000000000000800000008000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000808080008000000080000000800000008000
      0000808080000000000000000000000000000000000000000000000000008080
      8000800000008000000080000000800000008080800000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000800000008000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000800000008000000080000000800000008000
      0000800000008000000080000000800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000092302E0092302E000000
      000092302E0092302E000000000092302E0092302E000000000092302E009230
      2E000000000092302E0092302E00000000000000000000000000000000008000
      0000000000000000000080000000000000000000000080000000800000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000008000FFFFFF00000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000008000
      0000000000000000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF008000000080000000800000008000
      00008000000080000000FFFFFF00800000000000000000000000000000000000
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008000
      0000000000000000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00800000000000000000000000000080000000
      800000008000FFFFFF0000000000000000000000000000000000000000000000
      000000008000FFFFFF0000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000800000008000000080000000000000008000000000000000000000008000
      0000000000000000000000000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00800000008000000080000000FFFF
      FF00800000008000000080000000800000000000000000000000000080000000
      800000008000FFFFFF0000000000000000000000000000000000000000000000
      8000FFFFFF000000000000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000080000000000000008000000080000000800000000000
      0000000000000000000000000000000000000000000000808000808080000080
      8000808080000080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0080000000FFFFFF0080000000000000000000000000000000000000000000
      80000000800000008000FFFFFF00000000000000000000000000000080000000
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080000000000000008000000000000000000000000000
      0000000000000000000000000000000000000000000080808000008080008080
      8000008080008080800080000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00800000008000000000000000000000000000000000000000000000000000
      0000000080000000800000008000FFFFFF00000000000000800000008000FFFF
      FF00000000000000000000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      8000808080000080800080000000800000008000000080000000800000008000
      0000800000000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080000000800000008000FFFFFF000000
      0000000000000000000000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000008080008080
      8000008080008080800000808000808080000080800080808000008080008080
      8000008080000000000000000000000000000000000000000000000000000000
      00000000000000000000000080000000800000008000FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000000
      0000000000000000000000000000000000000000000000000000000000008080
      8000808080000000000000000000000000000000000000000000000000000000
      0000000000000000800000008000000080000000800000008000FFFFFF000000
      0000000000000000000000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000080808000808080000000
      0000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000C0C0C000000000008080
      8000008080000000000000000000000000000000000000000000000000000000
      0000000080000000800000008000FFFFFF000000000000008000FFFFFF000000
      0000000000000000000000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000808000808080000080
      80000000000000FFFF00000000000000000000FFFF0000000000808080000080
      8000808080000000000000000000000000000000000000000000000080000000
      80000000800000008000FFFFFF00000000000000000000000000000080000000
      8000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000FFFF0000FFFF000000000000000000000000000000
      0000000000000000000000000000000000000000000000008000000080000000
      800000008000FFFFFF0000000000000000000000000000000000000000000000
      800000008000FFFFFF0000000000000000000000000092302E00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000800000008000FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      00000000800000008000FFFFFF00000000000000000092302E0092302E000000
      000092302E0092302E000000000092302E0092302E000000000092302E009230
      2E000000000092302E0092302E00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00C0C0C000C0C0C000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000840000008400000084000000840000008400
      00008400000084000000840000008400000084848400C6C6C600FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000000000000080808000FFFFFF00C0C0C000C0C0C000000000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084848400FFFFFF00C6C6C6000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF008400000084848400C6C6C600FFFFFF000000
      0000FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      0000000000008080000000FFFF0000FFFF008080800000FFFF00808000000000
      00000000000000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF000000000000000000000000000000000000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF008080800000FFFF008080800000FFFF000000
      00000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF0000000000000000000000
      00000000000000000000FFFFFF008400000084848400C6C6C600FFFFFF00C6C6
      C60000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C60000000000000000000000000000000000000000000000
      000000FFFF00808080008080800000FFFF008080800000FFFF008080800000FF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF008400000084848400FFFFFF00C6C6C6000000
      00000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000000000000000000000FF
      FF008080800000FFFF0000FFFF0000FFFF0000FFFF008080800000FFFF008080
      800000FFFF0000000000000000000000000000000000FFFFFF00000000000000
      0000FFFFFF00FFFFFF00FFFFFF0000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF000000000000000000FFFF
      FF008400000084000000840000008400000084848400C6C6C600FFFFFF000000
      0000FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080800000FF
      FF008080800000000000000000000000000000000000FFFFFF0000000000C6C6
      C60000000000FFFFFF0000000000C6C6C60000000000C6C6C600000000000000
      0000000000000000000084000000840000000000000000000000FFFFFF000000
      000000000000000000000000000084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF0084000000FFFFFF00840000000000000084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF000000000000000000C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF00000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      800000FFFF0000000000000000000000000000000000FFFFFF00FFFFFF000000
      0000C6C6C60000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6
      C600C6C6C6000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF0084000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF008400000084000000000000000000000084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF00C6C6C600000000000000000000000000000000000000000000FF
      FF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FF
      FF00808080000000000000000000000000000000000000000000000000000000
      000000000000C6C6C60000000000C6C6C60000000000C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084000000840000000000000000000000FFFFFF000000
      000000000000FFFFFF0000000000840000008400000084000000840000008400
      0000840000000000000000000000000000008484840080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF0000FFFF008080
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C60000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600C6C6C60084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF000000000000000000000000000000
      0000000000000000000000000000000000008484840080000000800000008000
      0000800000008000000080000000800000008000000080000000800000008000
      0000800000008000000000000000000000000000000000000000000000000000
      00000000000000FFFF0000FFFF0000FFFF0000FFFF0000FFFF00808080000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000084000000840000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084000000840000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000083888A008388
      8A0083888A0083888A0083888A0083888A0083888A0083888A0083888A008388
      8A0083888A0083888A0083888A00000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A800A1A6
      A80083888A0083888A0083888A0083888A0083888A0083888A00C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000080
      800000000000C0C0C000C0C0C000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A800A1A6
      A80083888A0083888A0083888A0083888A0083888A0083888A00C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000080
      800000000000C0C0C000C0C0C000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000FFFF00000000000080
      8000008080000080800000808000008080000080800000808000008080000080
      8000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A800A1A6
      A80083888A0083888A0083888A0083888A0083888A0083888A00C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000080
      800000000000C0C0C000C0C0C000000000000000000000000000000000000080
      80000080800000000000000000000000000000000000FFFFFF0000FFFF000000
      0000008080000080800000808000008080000080800000808000008080000080
      8000008080000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000084840000000000000000000000000083888A00A1A6A800A1A6
      A80083888A0083888A0083888A0083888A0083888A0083888A0083888A008388
      8A0083888A00A1A6A80083888A00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000080800000808000008080000080800000808000008080000080
      8000008080000080800000000000000000000000000000000000008484000084
      8400008484000084840000848400008484000084840000848400008484000084
      8400008484000084840000000000000000000000000083888A00A1A6A800A1A6
      A800A1A6A800A1A6A800A1A6A800A1A6A800A1A6A800A1A6A800A1A6A800A1A6
      A800A1A6A800A1A6A80083888A00000000000000000000000000008080000080
      8000008080000080800000808000008080000080800000808000008080000080
      80000080800000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000084
      8400000000000000000000000000000000000000000000000000000000000000
      0000008484000084840000000000000000000000000083888A00A1A6A800A1A6
      A80083888A0083888A0083888A0083888A0083888A0083888A0083888A008388
      8A00A1A6A800A1A6A80083888A00000000000000000000000000008080000080
      8000000000000000000000000000000000000000000000000000000000000080
      8000008080000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000
      00000080800000000000000000000000000000000000FFFFFF0000FFFF00FFFF
      FF0000FFFF00FFFFFF0000FFFF00FFFFFF0000FFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      0000008080000000000000000000000000000000000000FFFF00FFFFFF0000FF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000000
      0000FFFFFF00FFFFFF00FF000000FF000000FF000000FFFFFF00FFFFFF000000
      0000008080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000084840000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A00A1A6A80083888A00000000000000000000000000008080000000
      0000FFFFFF00FF000000FF000000FF000000FF000000FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600000000000000000000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A0083888A0083888A00000000000000000000000000000000000000
      0000FF000000FF000000FF000000FFFFFF00FF000000FFFFFF00FFFFFF000000
      0000808080000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000008484000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C60000000000C6C6C60000000000000000000000000083888A00A1A6A8008388
      8A00C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4C600C0C4
      C60083888A00C0C4C60083888A0000000000000000000000000000000000FF00
      0000FF000000FF00000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000083888A0083888A008388
      8A0083888A0083888A0083888A0083888A0083888A0083888A0083888A008388
      8A0083888A0083888A0083888A00000000000000000000000000FF000000FF00
      0000FF0000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FF00
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000D00000000100010000000000800600000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000C007000000000000C007000000000000FFFF000000000000
      C447000000000000C51F000000000000E51F000000000000C447000000000000
      FDFF000000000000FDFF000000000000FFFF000000000000FFFF000000000000
      FFFF000000000000FFFF000000000000FFFFFFFFFFFF00008000800080000000
      8000800080000000800080008000000080008000800000008000800080000000
      8000800080000000800080008000000080008000800000008000800080000000
      8000800080000000800080008000000080008000800000008000800080000000
      8000800080000000FFFFFFFFFFFF0000FE49927FFFFFFFFFFE49927FFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC7C7E3E338F22389C7C7E3E37DED77DD
      C387E1C3016D701DC007E0039231793DC007E003936D793DC007E003C6337C7D
      C007E003C77F7C7DC007E003EFFF3EF9F39FF9CFFFFFFFFFF39FF9CFFFFFFFFF
      F39FF9CFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF843FFFFFFFFFFFFF001C003C007
      07C1E000C003800307C1E208C003000107C1E000C00300010101C001C0030001
      00018003C00300000001000FC00300000001000FC00380008003000FC003C000
      C107000FC003E001C107000FC003E007E38F000FC003F007E38F801FC007F003
      E38FC03FC00FF803FFFFE07FC01FFFFFFFFFFFFFFFFFFFFFFF83C0078006C003
      FF8380038004C003FF0300018000C003FE8300018001C003FDFF00018001C003
      838300008001C003838300008001C003800380008001C0038383C0008003C003
      83FFE0018007C003FD83E0078007C003FE83F0078007C003FF03F003800FC007
      FF83F803801FC00FFFFFFFFF803FC01FFFFFC3FFE001FFFF03FFDDBFE001FEBF
      03FFDD0FE001FEBF03FFDDA7E001FEBF03FFC3F76001FEBF03FFDFF72001FEBF
      03FFDFF72001FEBF03FFFFF76001FEBF03FFFFFFE001FEBF03FF88C3E001F8BF
      03FFDDDDE001F0BF03FFC1DDE001F0BF03FFE3DDE003F0BF03FFE3C3E007F81F
      03FFF7DFE00FFFFFFFFFF7DFFFFFFFFFFFFFFFFFFFFFFFFFFE38A0018001FFFF
      FF7DFFFFFFFFFFFFCB01A0018001E7CFB793FFFFFFFFEFEFB793A0018001EFEF
      C7C7FFFFFFFFEAAFB7C7A0018001EFEFCFEFFFFFFFFFEFEFFFFFA0018001EFEF
      FE1FFFFFEFFFEFEFDF1FDFFFCFFFEFEFDF1F8FFF81FFEFEFEEDF07FFCFFFE7CF
      F1FFDFFFEFFFFFFFFFFFDFFFFFFFFFFFC0FBC47BFFFFFFFFCEF1CE71FFFF38F2
      E7F1E0F1FFFF7DEDF3E0E4E0FFFF01EDF9E0F1E0103993F1DCFBF1FB38D693ED
      C0FBFBFBBAD7C7F3FFFBFFFB8237C7FFC47BC0FBD6D6EFFFCE7BCEFBD438FFC3
      E0FBE7FBC7FFFBE3E4FBF3FBEFFFFBE3F1FBF9FBFFFFFDDBF1FBDCFBFFFFFE3F
      FBFBC0FBFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFF
      FFFFFFFFFFFFFFFFFFFFFFFFC27FC27FFFFFFFFFFFFFFFFFFFE7E7FFC200C200
      C1F3CF83FFFFFFFFC3FBDFC3DE07DE07C7FBDFE3CE079E07CBFBDFD307FF07FF
      DCF3CF3BCE009E00FE07E07FDE00DE00FFFFFFFFFFFFFFFFFFFFFFFFC200C200
      FFFFFFFFFFFFFFFFFFFFFFFFFEFFFEFFFFFFFFFFFFFFFFFFF3FFFC00FFFF9249
      ED9F8000FFF9BFFDED6F0000E7FFFFFFED6F0000C3F3BFFDF16F0000C3E7BFFD
      FD1F0001E1C7FFFFFC7F0003F08FBFFDFEFF0003F81FBFFDFC7F0003FC3FFFFF
      FD7F0003F81FBFFDF93F0003F09FBFFDFBBF0003C1C7FFFFFBBF800783E3BFFD
      FBBFF87F8FF19249FFFFFFFFFFFFFFFFFFFFFC3FFFFFFFFF0001F81F000FFFFF
      0001FC3F000FFE000001F81F000FFE000001F81F000FFE000001F00F000F8000
      0001F00F000F80000001E007000F80000001C003000F80000001C00300048001
      0001C003000080030001C003000080070001E007F800807F0001F00FFC0080FF
      0001F81FFE0481FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC001C001C003
      001F800180018003000F80018001800300078001800180030003800180018003
      00018001800180030000800180018003001F800180018003001F800180018003
      001F8001800180038FF1800180019003FFF980018001B003FF7580018001E3C3
      FF8F80018001C7FFFFFFFFFFFFFFEFFF00000000000000000000000000000000
      000000000000}
  end
  object ImageListIconsFogue16: TTBXImageList
    Left = 264
    Top = 216
    PngDIB = {
      2D00000089504E470D0A1A0A0000000D4948445200000010000002D008060000
      009984F0FC0000492C494441547801ED7D07781555B7F69A53D32B4908292410
      484242098100A1247442EFBD4390A2740411242A52454144A4080A02A2202058
      902A4D3A084110D0D024741202E9C9FCEFDAE7CC704E1AE1FB7CEEBDDFBDFF79
      F63B6BEDB5D75ABBCC9E3D7BF6CC9921FAEFFE495C803593A98E8D91D6904476
      1C67E4E6D099DEB3A83DF32541C7897A3D1DAD53CB485A83445A8D4CA421FAE5
      972CDFAF67D04D4EB7824C599959D4A7FF5C3AC6720D720FCDCB25F22BEB483E
      5EF654B69C03604F3DFAB951C38646DF8288AE6FA8A8D3D2513666202F2644B9
      991ACACBD01265A2563912E53E93C9C3C3963C3CAD616FAF271DCAFDE35CAAC3
      966099C041068A6F20CACFD7D099B3CF28279B4896E10CC9A62D1804967996B1
      472DA5A3FB174B27B49D1A50A05643F195BC1D604074EB7E36D97B3A53F59840
      F20FAF407E55DB924F785FF20D6F25E007EA5FB51595F18FA0BF2F1F7093D64C
      A6BA3A0DFDDA36B22C11CA73EEEE338A6E589E241BD44E8FBCB57A22AD13C9DA
      08CAA71094C114AE9DDE46377EDFB743751057DD9BEEA46791CED99D027CEDB0
      47084EF2888C453B3AB6791A3D49B91B67E5E0F7D42C8A08F4273DDA92903119
      E5221D3DBA9747E70E5DFEA3F1ABCF42540711955C48EB589602DD6C4C6554B6
      45383A71E8263D4C7EDC3E6E326D4725296CDD144A2C1FE02A7237E858A4585B
      50B3A3BF1FA65152D29DCB8D47A507732A6BB798D09966C7C53AD6D4E98C2C13
      3D113BD1C417D8E666665387B169839F119D42D2398042B16902B40E2B47BDAA
      FB51F7DA15A86B5445EAC2A85F993A360EA3F61DEB505C9FC6D41C7AB5800820
      18F81F10B80D480A99BE40227904CA630B942664C8242D952FBD3B41A7099951
      D6686B1CDFA8FF301A1B7A860C7A4D890E1EA765D28AA43AB67B3F5B3C5E13F2
      DA344D7EDE5323A12F6765E5BFD0983DE763C3BA120EA02C723068C93DDA45AF
      B31BEB185895FA4669C8DEDEBE44E4E268DD71D991EE5D3A4DF999A97325AA38
      3AC0E0E89DE417DB837E9988E3193994147EFB2399466F77A71B7BD752CEB387
      AE38FEB8CBC8F4F4690E72762DC956A4196C6C846E3ED70512E1201FC3603A06
      3A1D0F35109614341A2DB12E861EA126AAA0B1F74CD287C4D16FB33C312EBA88
      84E236DB7FB94883D66829E7C2776883C7A62AB0726E7636854DBC0596015262
      C038614ED7098A3AE4E14420786C4ECFAB403EEE7A70A6F0D7DD6C7A9A9E4FE1
      E56DA8F6E43FE9D6A35C8C89A6345105C9B64C925C2EDA24C1F6F4023F72B2E5
      51051184C19FDCA30389E9C4F2B8F792E92E3BB87590F2B31EBB9A1CD8C0817B
      4DA89AC2FED95EE4C463A2294A23563CA263BF6711CB3BCD7D408F53F2487A70
      8264C50119DD93C831CCAC4EB423C1951C2C1C2CD8FE8CCE5CCBA515C31DA9F3
      822794C10ED2CEC1418AABA40D9AE09EAFB37F201B2BC3011A47CEA559F1EE64
      6B44B440C00144E3BFC0509296419A6CE4997C8DC76D9C522B4DFE58A3D5C6CB
      B29C2AE7E7DC2960A746355A4330862BBD2CE75E90F37296D2D5054BD4C47F95
      11E34183060D9AC001B7A269B722F28280D3319D3E74E8D05E5DC3860DED8D46
      6354FBF6EDA9468D1AA4C7B9BE24E3B4B434BA74E9926EF3E6CD51C8F8802637
      3757A7D168281B3DF145C68A63D6D56AB53897CA5AA95EBD7ACE180346A024D4
      BB776F45A758FAF0E143DAB97327EDDFBF9F9E3D7BB6508A8A8A727674741C11
      19194913274E2CD65049B87AF52A6DDDBA954E9C38211C8846C3EEE308D9D9A9
      532445BF1035180C4237DF3C20A80EB2B270662ED578A021D6553C6B7D7C7C6C
      D078B51D1C1CA84E9D3A1895EC95B422E9E5CB97E9F4E9D394929242D8014745
      095833272787264F9ECCEC4B4138E036C8CBC37160369D356B16B9BBBB9B6344
      77EFDEA58C8C0CF2F7F7A737DF7C931E3D7AA4A689BD60636333C2D260EEDCB9
      646BFBFC24B56CD932BA70E102B17CCE9C39F4F8F1637AF0E001B7856937B203
      EC4AD5EB3BEFBC4390A9F155AB5671EF23967FF0C107A2FE4F9E3C79EE005D79
      04A01A4C9F3EDDCAC1F7DF7F4FD7AF5FA7A14387D2A2458B8403DE13C042EE89
      B6E89663B83B2B1E060F1E4CBCBF95B8255DBB76ADDA0F705CCC1369E8CE2D70
      60BC5EBF7EFDD1E0871407D601A6406F68DDBA75F9E82509FD5938F95737BA31
      5B8856BEF1F602381801D802A50919505A3A74F68C0912F9BD5E16DD2FB9D1D0
      31F446D5E36463787E3E8052A1F0203583165F8DA6039FA0FA39B97698A2671B
      49D25246A6FC4263F686D3A8D0258DE883062D39D67521A3ED58870A1114DF40
      4B7C4C9484EC3C0D6DF9DD991E5E384E94913A574B7691AE647418ABF5AD4A13
      5A39881EC8BDB020F86AE6A90693CC7BF769DB39777A76E534514EC65C0D178B
      4FD54F30F7292E679DAD8EC23695A7D85D1134F0526B7AFCEC1A293F5111CCE3
      29333D9BD0A114B915DD72792D3DA9045163E010707E05F2F40783B384D872CB
      6465D38D3B8F45B4D84D26527807E6F1A80E1E4122AF5101E4E0994441AD102D
      10AA3684201B40A801C4007F03DF0059801B9D40B347B990DE762C399547B1F2
      04CE7C5C91E25A9CA1EF0C1B29A73F14A3007FE011900E7802BE403EC93A1053
      C836E78498467E4ACF9E3EA56CF8239E263065E354243E0524C06C69AA022618
      54A636A4A67060513972B493A8DEDE08E22B97CC3B90970582006E83C3A09C9F
      0B259A1CF0FCC0A92AA4A6B0637E19CC50381BA207D9F768E24F3FD35F1E2B89
      AA20FD2F605F0BA24BF016F8B5BF44655F7527BDE3033284220565C5FCE0EDB1
      1E646F40D41C8E667C479BB4AB88B8EEB720DC559FE877E0E669F3FCA0DCD88F
      49AB8B279952293F970B0CAD02A1D3C20A90D80212FD34F8123DB3FF5853B9C1
      12ED8C19339AC546DA346ED3C0353C3A9C5E039FD9AABE4BBB06D5751BA342F3
      E7C5D4348E03CA35B269A407A458BBD82B752A1966C544DAAC88F6BD9DA081C7
      F1D5AB57EF1C1E1E0E964660332236369687F5D730CC1DC449D7C8A7FE810307
      527C7C3C05050555727575FDA26FDFBE62DCC4EC561757B16245BA79F3266C45
      D04992441E1E1E62FC3F76EC98181F434343A95AB56AE2ECB56BD72E3A75EA14
      9FDEF96217936D5926676767AA50A1422D7601AF74FFFE7D7132C14974786666
      E6526420219D30B120C4DF47E926F20949DBA851A39E302E836291A7A7A7C899
      9DE83153B977EFDE059CA5864447473BE3CC558F8FD6A4A424CE790A8CD7CD9F
      3F7F8084461C0D6F8BD87BE5CA953991CE9F3F4FB76FDF26E4FEEADB6FBFBD84
      1D4E9A3449E651283B5F478BE6BF6BEA2448100C9CD4C779E05093264DF88C4B
      BB77EF461255857122338CD8797FCBD7BCB2E9DA2EC4BE0C1476E0444FA7D8D8
      D8B268B8783E79E2944DD7AE5D23188F6205052EF5C7275CAAEE40740687E1B9
      456F2B728DC2A04E227776A0C82C69563E62CF72B0B10EAA0316E35CC7274C66
      8B463A722F9062E500BB87775101158BE8333E042DE26015070E68034A4F4F17
      274EC88B0E2594408B5D26260D3C0F2CDA1AD2221CE82016811B91DB40448AD8
      3C4CC3A1AECF2D9422418261876C31C19A8F5949343BC2197BE782050BDE439A
      29B83473A2B62B769822D87ED9BC05D1D57470587D226A00C60D30022F13789F
      167D1E38398A06038B8F8FA2F5C746D286A32369C9AF23686851DE95BD20D2A0
      5C0B46D38DBEC62E81C3DEEC193A7B55AFA0B7DFEAE93BA0774F7D39EAF1CB30
      7A67DF30AA2594CD1B2B0738AA6BDAF8DAD50F19FF5D6BBBCA35CA90944799D9
      D729DDF50FB70A23DF6D66E3A76F98974F51665B41AC1CE4C954C7A7C39BF5F2
      705EC8CFCF2249D2E37C694779790F2825750FF9B51F1D9593478D84A579C37B
      C1CC12ED7F8576D45DB8B94D6E5E2A64987BE43DA2D4D47D949676928CC6008C
      170369FFABAF1C6CBFE6B9131D34D5909B47DAECAC3BF42CE31C72E7AB985BE8
      9989288511974298FAE24486B395958D56B506D3AB3A35337AD9F84ACE69764F
      9E1CC48175138E7422770787EAF4E8DCB527D74F9CFCEDDB44FA1AEA2258B541
      6E3EEDB9B2E9DB2B768628E4580E86FE64671706849341134227BF5C7A233397
      BE1796E68D551BB0EC9B3E34C735C4AB7DEDD16F85666424924663271CEC9D3B
      ED7AF285BFB7BDF22D8D613D05851CACED4175B0ABDEAE3B7C4423CF081F5BA2
      3CBA7D2A397BDFE24F8FC94493467F675ACD2DD601272CEB4C63BDAB06BE1A33
      7E5C4549CAA79FE72DBA71FD4CD24713BEA7059C6E09AB36501232B2E9DCB5F3
      493692C40DAEA7EB8949B668FDB34A7AA968D5AA5597EDD8B143FEF0C30F654C
      BE4E146754640914E5D0D0102A5FBE9A122D925A3AA80D8DFA4033A00D2046A8
      D4D47BCC32DA62D31C6808B02E8875E083A42944DD80211823C7000F00343EBD
      0ED950A007D002A803885068376E6E4CAF41C8390985E236F0BAABCB3E5AAC2D
      A8D0D187DE6DFBC187ADE532DEC172599FE066AF8D0EAED0AC45B043A5D0609F
      FA0D83CB376C1C5CA169B3E0CBBBF76B3BF9930732B376F1762D9AE8ADA10E15
      3AB46E10DDBC19EDF8F24B6A8BC9C4835BB7E8EF6BD7C8CEDE1EC0A4DCCE967E
      98F3C121A966CD9AADE082EBE4084A41F997429B619ED973CC9BD24F9B3653A3
      962DE9002EF75B75ED420F6EDFA194FB0FC8062B34A9F76FD0E1AFF69ED19629
      53A6DFECD9B3A7F6EEDDBB41949F2EBA92DD834A6D7A0C94967DF821C5B5EB40
      5BBFFE9A9AB66C45FB7FFA89FCCB07D2D327A974E6F8213AF0EDD9BF3373E81B
      2D26151D7095569F6724E73E1F435D7BF6A5B5AB56509AAD3FEDFF6E2BF5EDDF
      9BBEFFEE3B8A69DC987EFEE9073A72EA022DFEF6EE6FE5ED69D8C2EBB44AEBEB
      EBDBE2FDF7DFAF57A54A1572F5F2A36F97CDA6A6C3E651D7891F53191F5FFA76
      C51CEADCB90BFDF4E38FE41ED587AA7679830E9D3FBF7EFBE5E4E55C65095DF6
      83E3C78F8FE3130A0B0AE2B79D9FD3CF9F4CA0E03663C83DAC29061889C68D1B
      F7216631E359570A09095988E58C319E6B1CE96EBF27F413EA8A7611973E7C39
      8C691DEBA940C7A2DAB56B2FC24ACE58164A98E27D8429DB6BC54D2C58C9123C
      83C37ACBE23FFFFC7334CB254C6B3EC68AC4A8C3C38650ED8F97121697701969
      CF6902384F8AB842799503BB7EC98D1B375E6505C9CBCB6BE96FBFFD369CD786
      58F02260324698D97E8A458911AC2BB9B8B82CC3E2C2B0812B3DE8D3BE37C5FA
      082F2E703BB082C23B3939F134574C6FC3C2C296630DE5154E97D0502BB1B032
      8467272C781178A908F3C9CF3097E0A3933460F4DCB2708461DCF842B02EDB20
      231E3B6AF2C1B410111FE065C27D28FF0C3C6207E4D7BDFB3044BC81A2C2DE9B
      5F7F7DB0A804966979E3101CDCFEC2FAF53306B56B17DBAF6DDBD83E6DDAC4F6
      6EDD3AD6DFD13176FFD9B3371D4343F3D32E5EBCCEBA0521B1C0AB5DBB77FED8
      B871FAD3EC6CCAC49298A05898DABB6F1F4D1E3890CA75ECF82EF476DFDDBEFD
      00A855D0700CAB5812CE617C8547364623255EBE4CBF9C3C89A5E0DFA9F3EBAF
      53DDCA95A73FB87F7F3EAA3A03E04195CD0414071AAD46435898154E1EA7A6D2
      2B1D3BD2A7584F5AF8D65B340FAB57E776EC889ADAB367425E6E6EB3729D3BAB
      930C9383EC6C8D16FEF466276071FF3097F2508DBCCC4CCA78F68CD2B0F0C42B
      5837BFF9E62DC89BA1DAC2898E9573B2B234384E1124622779F9F9A454091D83
      5504EE614D6D0296C97AD5AB377DE1DCB99871D00151823C94000BABB8D5C27E
      D0AE5898B3AC12B78B03162207F6EB473D7BF6A4F861C3C8B156AD14F62A1C60
      2AA28119B1113BE2125856490F4DC509161F71CB54873BA2D9C2566CD801331A
      09B74D351ACA4709501F04539594C6559C18A027AA0DC76C87D5980C41B904EC
      240F0EB8240CEEFBDC2E964EEC7045C7D5863D0943BA73C7C811063BC945EB5B
      56A9A013AE1E979AF5D9415D5CEB3DC11CE00B05D3C68CB9C4095C1A7658B024
      62D7F19E8307D6E359E557E017ABD0EB8F82178D5A941309ED84CB5AB61555B8
      08E5D3C02933D2313DCD022F02970025C3B44F2F6040FDF9AAD65CED2A5C55A1
      68B1A90BBE33E009941478E6B1AD9042C78E1DFB15125A087009DC66FCF8F106
      4524EAA144986275F7832143864C63BE2060E883EAAC83BC1320422107583FB6
      C5D9683AE020342C3618C1B7E064EC8C53400D455CC801169DAF40D1D0B469D3
      8D8A12D3D75E7BAD35CE21B5614C183F3258C628E400278C557C16C29248EB66
      CD9A45B352D7AE5D0D305ECFAD8F3505BEBAFD95E58C420EB0D4BB1A279A0C1E
      E6710612A5F0F6F69EEFE7E7E7CC97C677EEDCF913EDB4978D1945ED463E758D
      EED4A9D3229C3769DBB66D8B51929158E1D0E224CC0BD43DBFFDF65BE1981D14
      0B9C447FC6C443C6F4277FE9D2A5F2471F7D2477EEDCF9BB620D0A26942F5FDE
      164B40BFE30A969DC803060CD8CC6D51504F1C1705851CEFD2A54B5E404080CF
      D1A347E57AF5EAE5BBB9B919BFF8E28B6C4E2B15BACEEBF379F58486F2C89123
      BB0E1F3B6852AF4F3ACB7506D46954A271ADCF5AD986CF893A14F241E43DDF25
      21B93E23831315838845B5B2AB2E897812BE38FC46D807419315B9150D9C5E79
      8B7D7BB7D92CB44B70CAD0B57578957946C529E57F2DFF86777CADF1B5B46E09
      651E3365B915CA8C73BD4CC1DA2A2C340ED73EA22ADA60E6199506FBBEED3AC2
      793DF39E23DCAF788FF450BB33CB040C7DE96B6D1BDAAFED4133B49D289D6A99
      96893831AC67058F327D5C1E7BF7712BE7D9DBED96477F3B37965BC1633C1934
      6DE8276A41472992E2AC1211F1EE5A76AE6B57C734F7CEAE9F205A7C9818171A
      8E7D3E055860C614961565A176E525B1B40F0A91004634D2F9B61C6D5B77F068
      8ED2D1551FD1AD9D1F65383B53AE10109D1AB59F1A33AF1E4CF9324536EB36D8
      D1B76AB463E34FCED956ED311267201B01E659C6694DBA0C74645D366648BC61
      2C6C484F9A76EEEB78F6EC593E5C89E7830CACF4F1F12FEE47F2118AC39CF66D
      5D9F36F62039B19DDA957132C242431E05060662BD208DD3E8BAC69532343682
      E78D8D8D0D9DCC34D0535B0F08799E45CF7753331F7A2320B88A11431A8AAD13
      B8A375A5F8996BA8466C070A0782EAB5A2148307FD7EFEB4D6BBE38093970E1E
      BCA25661766D7AD2B8432747BE83C5B931CE93070D7F6F2D6561EEC467EC4C9C
      F20E1C3D4ABDE3E2A8FDE4C98BA0B35B75F06E241CB46BE7988AE90D12C4D2E0
      D93C777AFDA32D7408EDC2C50F295F9EBEDAB68D93053E5AB76EAD384F72AC91
      17BDE15FB18211431A712918C9F9B6D4B4637F3C526434DD7BC124232C389882
      2A56A42A5846DE77F2E421B5046F86D393FA2D621C31A8F25A2AFBA4DFF5BE34
      67F52EDA8962B300C31A139C1633A8465818757EEDB54FD51244BBD31BDEFEDE
      46CC83313DC28C0D27D03BE4402D3B0DA02C4912CBC6BC5B19B84B4C651C1DE9
      F32D5B4EABBB11EB43585AC7DC4AABFAA4BC5CDCAE87F1952B5744CE5C021E99
      314A8BB3727656D673EDDA2ED88D157D8C3C3BE1533A232953476DBB0DA650F4
      8D908000F2F7F2A2405F5F2AE3E4244EFD1F7DFE79A25A02DCA311B9E0DC2728
      6FF43919D4AB754D6655A0407435E93E5DB1F1D88469CF5D2E6F75A456AAA0A1
      3ED5ABFB1B793AC3DD9769797B89AA386B28D449A250678942D07943C0DF3EF6
      47DAE96B774667DCBE7D528231CF07CA45E9692A1EA8A88CF80BC363992E1FCF
      A15950BC0DFC7B814B409DC69E3C892247A27E13B024B8805DBE88C795EEA92D
      0B6BD5120EDA8E3C2C1B6D6C26B06169919599B960C727F52531A0BCAC3167A2
      D80807B80A15C5E684D242B1110E9E3D4B2BAD9DAAA7D80807A1A16113D49452
      328A8D7070E4C8E197AE8262231CE4E5C9A5CCF7B99A62231C346CD8A0C42A54
      39B632BCDDB2966F3265174CE7FDFEEEA38D445D85835F7F3D5B6215CA9FFDA6
      43FF1103DD98D6DD36AE35538EE710CD1447A3DEE0C08E8BC5951ADDB67DBAF4
      F30E837B76705BF5D5B688BEA0EF2DFB96FC895E113DB1CBF853E38BB5362754
      43CE8E777E8F181C5BC76DD5FE638F527C6B1E7BE78F9F5B8B2A5CBE9C566215
      7CD0067A18F7AEECE7F6098C99E6DCBD1E371F6DC025A81214FDF12627AFDA18
      78741392927285B3C0C0E77CDB9FDB3C1AE266EBB6E8A903DDF7F4FBD1E3DECD
      B8310E4FE9B39B3793B8803ED854042A17879A4433E289FEF2227A0D3A31B588
      260F23FA13742AE2FF40C058B00138C7AE98324AC16F601D0118240AE62536FF
      8A4DF1EEE1ED52F1A945A72836A21F40450BBC6CF8576C8AC903C5B95E4C52B1
      62C5E67F4E15EE175BD66212500561A354418C0BC5E81627FE576C8AF3859BDF
      C527159B22738A844D3360195001E0B8482805FF1774C490561B0CA6AEF4B23D
      2B0F7699C07F7AE0462B5487C065A79A64E7530F247405DC000E37B039AB95E8
      F31BC323B78017A19083721F1FC77302D23CF434CC58891CF004753ACE9DB87D
      260CCC9BCFFE1E113994790D6F14047E7C7404269AF364399FEC754475DCB454
      599349D1AE1AAAECA425CDF3EC86F87F7A6A25DB49BE0B0EFE95912FAF7F38A9
      D1B432EF1F943179C42C94A89A6D2E1DDD79E0765ACA934B50F4AE1A553DD4A7
      5A153A9F9A4FB86642D79329C051D756F29FBD474EC33359287292A49102BDF0
      F09237B23FF3E3AEE3290F53A7E5EF99B70B0E48D3F4F5A9FE41FE93CBD68D76
      BA91912F56FA5C34B9FBA5F2EFFE28A74836C4D32D38A0FC94C79477E7D6D3F4
      9B373B2BC6EC800127FDABC5D6FBE2AEABAF70E0989F4152E05BDBE5473A5B4C
      D3B93924E108E5239D4EBB3ED8D5B8F4707CDD436CACC07FCCEA9DD941555A10
      E1319EFC74D29689EE3E238D7478EE1D224906A7213F27035573375475D291F6
      E296955B1563A675FBBFD623C8C3A1B20BF68EF4E471865469D2C63BB724672F
      8341A2005703F93AEA713F29992E9C49BC95FE346329AA318B0D15A01A53EC1C
      EDC694F5F5764B4B49DB4835A76C3C5B6BCE5E396EF13EB9E6E475B25DBBB7FE
      82D262A0B1625490721A301C684E6E5D67CDAEF4CAB27C9BD6D32E41301F8829
      6850629C0D80F140FD1215FF7F62B12D2059A6F87C7CBC137AF9401C1735D0D1
      FC4139F911369B8C5A69E35FC36AEE056F1554079E0B8FAC84C110B1E40B6B3D
      460E3B9D969E6120C0E5A730C2E1FCFACDE191F345C4BC110EBC161C5E994F04
      6371A3832A3B1BC9DB46C293311964B0B7A3C45499D272513609FFD9D24A23AF
      0CABB9D46C4F52E42747DA243DC9DE21E12F155A1C9235CA18E8CEC54B947832
      F12294921D5D9C42EAB58A2D97986D24B820393F8F925FAB23F92C3D35D34E2B
      F59602E7EEDDF7384F8AE543391007D18333A79EDCFAEBE65CE51840076BEEE2
      EE32B356DB9651C95978520ECF15A1AA49A865A003167524FF777E9453354664
      26916FC63DBA78F4D40018AF81400DECC4C1DFFF5B9D5F8083014F8BE1B82538
      21A75C1CCE9E313D13D2F2B410C824A53CD89DF2D5EB13554B30F5571C6D90E9
      57295EE3E119A9C52D635C2F422AB30FB2CFCD246D85865D27FBB83BEA835D6D
      F0C0BFEED2B59FD7AD87861AA2BA0D7DC7D75ED78FAFF7D3B265DC083025B123
      879C0C59F2E839678D83A3438F7B77EF3FCA7896B108C59F6352316D51FCA976
      0EB623C26B55F3F52AEF43B73364BAF9341FCF451079653CBC2B41A139542B02
      7FC0781F68A1009DC61076B6B5B769135A232CD0B7821F3DCAC5632677EFFC26
      21A1D4018E62A0DCD66034B40BAC1C58F9FE9DFB735FCA018C4580231E3BEA20
      720AF8F7825A02EC57DEF76170A7C8981684C69C9E88BDD01DFCBF1F3807E105
      25380D86E3052172458E62B1163AFF6CE0DC0A791CF4EEDDEB58C9F12F946016
      E4E7E7DF583DDDAB3C4775BC2988478F1EFA4FE85FA1A0588D2F58F397EA5C75
      10D573B78C9BD78313BF6BBFFADEBDBB3726CEBDAD2AA99666068B5537CC2C49
      6CC891C78F5398D0959D5D8BAC96482C62A33BFE55336110D4629B9C9F9F3398
      752AB5DC7E1DD39C42259024CD8D2B3BDB89BAB31E43ADC2D59F3B08472CB4B3
      F3F05FFC560D66ADF0DA3B670B39551D586A3A3A7ADD7873E1BD42CA2CB7D4FB
      4778B5D8E889D7E15102344041AAC8F04720D9807406CBC0FE9B41ABD8A304FB
      8039C024E07560B219D3A0D30D5806FCF381EB2ABC22B70D605E663CE804FD7F
      3F5896E03CDC71BC20B8B5258C079590FECF07CEAD90578C07B7311E78174A30
      0B301E24633C28C7D122BB32C603EF178C07AA735D78FBEF86E1E19465CA51C9
      5E311E24633C50955866098C07C94A5CAAD47293CC115757172664E948085EB0
      912A34DB344CA3D12FB33C9C311EDCC67850A804180F92311E88BA2B7E757FED
      EEBA1C11068829603CF02E663C28E4B4C846C4719F8CF1A09032CB4D59FC835B
      B51FE058B80DBF1C173D0FBC255578653C50E250FB3783E5787008A5E02B561E
      07DE003FD58CB790474F6029F0CF07AE7321AFEE093BE221EC0DCC7F98D0F607
      D0624321072E6F6E0D85F619C008AC4E79AFE3605011FC16EE6F0826F5E6D8D8
      73A0221472E03069D32CA470EED9A0CE4FE777F50225B3F101E681EA8A132B07
      C6D15F852391079681445403180BC4647DD4F380EF077B3977D5C1ADF14D4429
      AC7A22FE92FE2A0C3854C52650CEC826C9D6C063DF813C3C8B0C59A1F0BC04FD
      57D446EA712017C8003838627385D6C457F678EF47AB12DC7F334E944075A069
      3F67339439B7B0FCEFA65C044F905D06AD04D470A919E604AA56E15142BBE70E
      0CB153B8E5E741E1A7ECFD7396808A00F96830EC74BE4D749D34F0AA8327B33A
      3D7780841706BB895F5B5521FDFDEEC28155239EF468F0053CF9031C1A60C3E9
      31B5EE1F3A909B958368E120151611C15177C837028B61CCD520ED2B5FC412D1
      3E8043E3BC6503F6137E851C1C758FAA0FF921E060DD87C71B81120DFA4C66CA
      D7554C65B10A83DB93AB87E04A902566FCE2821BA944FBC9F48B8D49494C34B1
      D876588C7FCEE9C12064E6106DE3477AC15B869FEC030E003260CAD994180C52
      9D3C6AB6A09A136F50CD49D7058F9522C883D52A6C31BA8F83E003E021701EE0
      F077A7AC8733C1380365013B80C3536CEE0069C00B83A90444D1D08C25A21880
      F96AA09C06F26F04B50AEC03BBEF0B507F8083553F6081F9902E793C6045382A
      D40FCCC66A5756C6031D1B58E2A447FDFA58C9E24E74B0D6FDC3A39534CC8315
      D68A5A3938E41A119E999BBE0D1ABC274682AAA1B8F1C0CA41666EDA27B07007
      629AA55D4D0455436E4EAECA5B329212D966E3390EFC0700E77E1E94C3DF1D32
      EFF565C62D61BBD5D168351EB0C28BE034758B9503653CB0AA023B7199B62D1E
      B437303F6566871F4045C8CDCE11B4E0C6CA81C3E4CDA1A8EB6228198124E0B9
      8362C6032B07B959B9FD60C47D3C1BB40DA086BCEC5CAD1A21725378B5117523
      BE0C87F03C30902CCE09B94BFB1E28D578200D59FD290C5F011600419495D381
      8CFA85F2678378EF1015331E984AD06B496D181D0772810C808323365768C3A8
      76A0361803BCC8AFC94A2C9E6009634F3CDD3FCD55CD421A91B6F5CCCD403E10
      2A04D880BF0CC89A06AF46205A07E800F432839D72A6216488991C0A6C074621
      510D888F06F6191A4E6C036175201A88A57F7A3C80C3FF750133B3E38CD2564C
      63A908C3CE886703FC6F43E6C1961CAC1C40B519700CD003CC833C0FC8602490
      0C8C54A43A8531D318D019404520062818B83FE442C814043705C4161B78ED06
      C207BD33E84DC0CF2C03AB86BAE01288887B24888503C4B8C785802E01E20103
      C032101C0192D41D4C30C0E97864591A03FE79406EB7811E8A04FC1EE0B6457C
      39E25F01C3004EFB92D3B4D8D407F613F1E30454133409E80A0C051C81FE8003
      C094F7D04EF03D811820950F67766040C408E881D2841C286501EC10E4FF877F
      B605CCFB784F69BD5A1D4C306E0E43DE357C34328F68C9C1CA01549B01C51E8D
      482B14740524DCBB6640561188015E18D412A0F8ADA0CD3DCC19F426E0679681
      2D3EA80EA0C2475E08281F6DF1A0DCBD5986957FA9339C9DB3C074A45B0724FE
      01B456A4E0B7027F701CF41B8699FF1AFCEFCC33B4BC01CE02614038F0293090
      F0B40BE00E94050600EC64146825A01CF011C0770D98884B3C09AB379F93E9F7
      39610C316304726C049C409C1D71C373F5102D10E0E04293A147FBB03838EE27
      B95E9FCBC39887F15960B5999F0DFE0EF30CCB46E4F8146C3EADDC6AB30CCA61
      196F80002232001CEA60630327B154C42F18B250208C4BE0E8597B1CF8DAC06A
      4036633668127006A8CD2312A81A82C171A918DCC00CAE335306CB196CC7C37B
      16F4FFD303D74BD401ADDA19D8088C30A30C120E00A50B30E29EF60D6B83B7EA
      AE2C2B35603C0AD8025C2D8D9146518241E9BAAB625090C241B1DD957591BE87
      C1BC25D412401840C574571836475A365068AC54F702127D81214002112D012A
      034D003E2BBF027A8D4C937076B41BBC75C09138D65AF23C86121C055A026B81
      A3CF53AC2718F1C51CCAAD609003380337013F386119586B07C51DCA6DA01902
      70B5E2410D00CB408A097C285769BA66182723B762C74A91CE1B0B0483D798A1
      055D0354077E03460135808F010E2C8BE7E39A230A0A3A6027FF0DE341F9FA4B
      64A5482FA29A1729BC743AE71ED0605156B5D6AB4A5D0AAB4CFCA217F58203B9
      52934F7A59259414C1BE1E031C06C694A457541AEF2296F77CFDF5D7EBCE9B37
      8FDB64110BE0EC3028EF66059C66C9F38D5B9EBDE2242849E360700C1807A3FF
      86809CF9CED639A62F9BBDD20603860F1F5DE5D34F3F1A0007F3009E959C01E5
      3A73DD8B046E1D55808E6883A9C89D8FBAA942F05FBE41EE09C0DF4002BDDC4F
      FD77E193EEDD5F71FCFAEB6569B0770242E16C07A8C6025AD4D988B88D199740
      BB712381D2FBD84C00160013019E64D881BE289C7A91C27F613A8EC2617C28BF
      6C96DC48C24623E99649522EB11386109662A3F4443218A5576C6D1C979DFB61
      B0D2B0A530FF0754D4DCB0DFCFC11FC715E4158873759534E6793CE8049DFFF4
      C075127528A20DB8DF733AD7B748E0D8F010C6FFD19B3A5C475103CB3640DD1C
      207405385DA93F9FEA0D9029E11E98F6C07F73E0228A2204F5EAC52392B78814
      BFD97B75C3861F2C93B95E22EE1A1EDEF5C4EAD513F0FE8368BCFB201A7FBF8B
      EEDEAA5574AFB838011F0787E823172EDC750B0FD73F4E4CBC228CB0514B10D0
      B5EB07273EFF7C5C26DE7F909D9B4BCFF07FBE4C2017FF90CA070E1F3C4863FB
      F4A1E03E7D3E84DD9E6B9B367D0F8A27ECB06DD56AF110AD232DF776F5D164A6
      E7E255151A2A53D696EA372D475EFE4EC44E366DDA044D53C0AB30D7D2BD7BE2
      CCAC69DAF4FD71EEEE1E2B2B7A876A1CEC9CA94C1977FC8FCF95D29F1869EB97
      57E9AF4B8FF0F4AC445DBB76A5CE5DBAD0902143C8BB4E9DC7265798A96AB586
      848888000A0E762317172355AAE42A28C74343FDE8971FAEE2CD8E06E184FF2C
      C786D939396AD5353A1D39198D5A1A35AA265E3467B4A22CBF73FB11DEA16750
      9DB003BC404175A07571A9393E3030C0D8B1E330BC74348DBA751BA1D2B4B46C
      4A7D7A975AC655232D9E8E948984A365EBD69DCCBA7143EC4E5D72F2B584DDBB
      0F7FE0EF1F4478BE80FEFEFB09F1EFD6AD14BC78EE1A0D1A5E0772890C282ACB
      B9C8D84BDCBD396ADA0BEEEE9D863895755E19E01980FF2EE6E3652A1AF245EB
      F7ED1F43356B0589BDC07FD1C431425ABCA5C2B771E365F9274E0C670FC2D3C3
      875B3E4BD29E5EF1E34F6FD09EFD5369FB0F9369C927AFE01D79C1C40DA743F1
      F91D0038E0C45B2AF2CD6F1E501D30833FB26AB865D8232BE2311261CC86964E
      145D41B1617D1004F3AE61651616EB04A5C13F67392F18A11F882D6FD2D2D4B3
      54494ED839FE49FB5C17B6D58106E89A3C8882350576C2BB8EAB80E74EF010B8
      4EBCFF40C77BE3DE3DD66D00CDEA5C94BA60CA012D000FA034E13E947E066E03
      FF4040832D070E0355D81DE811A6A58132A06C87513C0CB603F7C10F05FD0CF4
      08301488078699F10AE870A03E74B600A600C131208C63A04799960662AFC060
      359499E7191A5875858BF997071C9E28AD15E7CA47DB5A18FD06AC351BF2EE35
      B32513AD39790B8CD3C03702D6801F4844DC88BC283112F151C0ABC06BC06860
      0C30163A8B00315B7F03826D40040B407F655A1A882A40910D797ABB11C6AD11
      2F7515A05B38C0C9F1C2D2A225A20430D80A1C036E98D54A5D029DD9E033D0B7
      814E0007496C24290954634691D37DA4A96124B83F00DEAD6CC86C243625A18A
      52023E78EA41790160194E5946FE67F252DCE06FE41F5775C30E9096A3885500
      0EDC88DC780A65DE123C4FEE5DA3D5D7B2D206781E5D1EC6962F0BD5018A7018
      C69C4B71B9721A838F1F0DCE5295A04FAA0308788461D94B417580121C8725E7
      501444AE48572932F443DCAA04512C78595896E02C8C2D73577333CB39AE43CE
      B688338CA05625A8C1829785528232688355300E06B8149C9B422D7335209DC3
      796CB8EB13714742A40CE0E71BD2B63C6889702BDFDA1F3A5E803D7724C50135
      EAB1BA5754C74F65249418821A2E96431AAFE8C54AEC40A902C7D763935DADE5
      8732FE558FF9461665E3AD0AE2E125FCBB845FCAA9377D6E251B7AACBB01F479
      2322D21B587F6EE738EE89608B0E5C02A4B02EC8FF84A016B77C8F1E0944E40D
      9414F65EDFB871A3A502EF6F11770A0BEB7D69E3C661433A758A1CD8BE7DE480
      76ED22FB80E2FA21B23F787F0787C85FCE9F7FEC1C1666FFE4C2854461848D5A
      02EF8E1D575CDEB46968065E2E9665BE5EC8305F2FF0A344FB7FF98526F5EB47
      E53A755A09BB3DC95BB77E05FAFC348E7F15F2048E787E68C444CA1EAFEDB005
      74904A1A0DDDB97D9BC48BC6EAD61D9ABC6F5F0F3666707765CAEF42D168A1CC
      28CA492F5CADF4ECD58B868F1841EEF5EB3F1646D8A80EF81A800D19C539E192
      C0061DCCE27A81058CDCEC6CD11EDCAA2F72A2E8B29D5A027E79181BF3A49269
      714E0CA826EBB2314375802A9826DB5028C909BF278A75D998A13A402BE29021
      FC3D13AF3229C18991DF3F929727AA6BED2033F3280B3885E7C79A629C88C337
      3353CD58C4E92D92E9C6C589EC40BBDEC8A458A4F54827E55D69AC6472900AD6
      59ACE8113DCA26EF2E1110140EC99BCF10EF62CBEB05938307507E4C5C82F7E9
      3651F2E23310141DB88A78EB8CC90E2A1C6F00EA088461C89E0F5A28E443C263
      5D1E28EF6274EF1FC07E0C88AB145B309E400446E65DA0A5092950629B5CD0FF
      F4C06D625507B4430D60263001E00B8D21A00AB8B18F5919148C409927D9BF82
      2A686EE6FB14D42D320EE583C00905AC64E65B305F106A9FB648B84638A62C00
      96B8AADC6798B782DAA32CA41F809F0884027A8003D3221D70629140B1E3808B
      9CC8148863BE208AAA82A2C33972CE1C67CA71E6AD5092034E63433660CA71E6
      AD50A4D0ACC169B6669E29C7CDD1E2890F9282806AC060800FC04833E57865F0
      E5806283A50336B4444D58BDD00174FECF05A943870E75701A6B8A9ABB030FF1
      4FA13D785FE031F05621B2DFEF1DB066B301425B20031FECE8756A6D956D1A7C
      E5A045BF7EFD86AE5CB9723C538E43A15078FAF4D986A810ADEDD8EE0EC494E3
      AC24E17DB94BCE9D3B3792230C7CE5E113BCE60F3970EC39B22A2E9FF0F6F08A
      AA60C6A77F52F29E16A27BCFC4E7826EE2F5C0325368CC0444C04B17DF170C36
      36115FA57718B94F5EF845A2CC94E3108B108DED6CE0338029C7C11216E56C55
      0714B8AC03F97F920EC840BA880BAD9237CF1D14A3A729465E6AB1AED49A2E0B
      3BE03FDB1BA06FDA8D1A3CE49832765BE94B6070DAD0AE4F2DDBB5EBBA125342
      1CCE4C2B9ACC148309909BA6BFFEDB262C5F108EA8290C9B904874A383F4A22A
      2C30A9636BE73EF2FBBDA9B68DEB1A68DFD16C223BF7427D25186A55001E4C6A
      81D6036280E6401B22DD589BEAC7B36D231365A6888F81BC9EE8496038B0038E
      73BB68212808962B60BD1CE83C03FEBDC09EAC3CE0AB20D7707C94B714F2BB45
      31193F838F7BF0B066996475CDA424941F3F7EBCC20B8A2394DE7BEFBD8869D3
      A67D3C73E6CC5785D0BCE13A99D9E209BF2B8F67AFF842C6A8825A453AC0A022
      F4506C5CFEE1DBA6F8C7FDBBEFBE8BCF27F0B44824A91BAB36E839EDA36995B5
      0FDF1D3F6E9CAAA03098C1D1870B17D2E53CF7E95FCD1C3D5391EB468E1C7911
      91900C5B0FDCD930E09B4B122F87F05A12C4058344AE368677074D98F1AE6DC6
      7D4EBCA42957AE5C489F7E03C8C12B802A560A2663193F5AF8D162C21BFFADC0
      324E631D7B4F7F1A30701005040484E8D88D51AFA5503F37BA743D8972F9E5CC
      466F1617C6B37CD241A78A7F19CCEA4DB5170E5833AA920F319867F04B06992A
      E03D81D15B890ACA2FA895F00133B969D36642C09B5F7FFD15EF7E28BA87E2AF
      9C54AF5E34AB09ECD9B39BA4B7DE7A4B8E8CAC2D04999919F8A0CD39F1653421
      28B0C1888DF7CD46A8D2D3A74F923465CA14B962A5CA42C8EF55BE937C9B1212
      12A8A81FF7052F6F6F5C5BF27146743DE92F92F0C25DD960300A7DEE6DB6B636
      94508403EE5CA82E3EAB912E76331B6467E3631FE8074310090408075125BCAD
      B3BBA50336E4F7D133F09C0A2E159E2CC26B229FB23E7043C2460DC8611614DF
      C051479686781530AEC9F244BFC0DE9882769BAB18153C16AEF20D08DC4B13CA
      78972E2D59B284962F5F4E9F7DF69978BF280CEF006AD0A91C18785E854F20F9
      832DA62721051F2F165BF3466BA6CF89BB7B9F67274FC64F8C8F8F1C038C1A30
      207228F0CAC081915E8E8E91BF1C3992822F20D9E32E56221B15AC02E1F8C553
      08C8066B07791919940D64E045E5180BE8213EB59779FAF450E834C32BF07B16
      ED202B4BE27AF12E65F03A82938D0D39622DE1D68D1BD413877AC7E6CD87D0D5
      AB3DD801EB327D0E5C95A6E2AEE7839414E2CB7D032E75D1F2648FB75B4F9D32
      85D25032BC1E99B66EDAC437E3C434FEB931737A7DE71EDDBA55F7C2A707F963
      807CB1CDFB9A0F24A6987493C1CE8E96BEFFFE395CC16EB52E81C1D0C3A376ED
      72BE786367E72143528F6ED972917D4674EC18BAE1934F9C794984E3B63A9865
      98DE4F0E8E45666467D7FC7AFEFC66FD274E7C7474EFF9D31B0FFE5191537A74
      6A7B72C88409115F7DF2891B3A03D9A05A6848B103AC1D1095AD87AF61EDFEFC
      F3B3433E3EE8FFEB9F5936ECE08D85EB2ACEEE1B7556BB6C599367D82B2E2CC4
      948D89F0C28C195C4DC27ECEF27471D0B5ABED6B64F878381959C67B85DF3F6F
      5232AD0069CD860A6988CF66D4F3080EB6D97D78F7852ECD627C1CF592E6832F
      3E3A15D7AE5578DD4A959C9F609DC9D3C58566CF9CC9EDF34DC112FCBD69D7AE
      EC59F1F17EEDEA570B6B32A2CFBE06C3BAEFAE1F5E3164FAE0C17E67FFF883BC
      F02A5483293B310658B641BC5F6CEC988FA64E350C983831BF63CB9601B7B76D
      0B20FCBEDFB58BCAB9BA9E01FB0050C26D85613AA16CDDBA373190CA1E75EADC
      846032B012F8C10CE60712E185C9D8141576B1B16B44C4DF481C06BC546804ED
      F781DDC03C6000D007E80674045A03CD00D6AB075A1B50830EDC017CD8F21750
      3E9DD5993C79B223F34561EEDCB96938473A701A066389A9404242828C612C4D
      445EB0613DD657D48417E49A06EF8E789B7B1A0E169183A2C014B97E802FA34D
      609EA1E833AFE5CDE1C3876733AD51A3C62C1E79F10936C2B72A099F59C36785
      EC089703F56AD5AAE574F2E4C99F594FD1675E38608681AFC225B46DDB16CB44
      39E2E5C418BEF14DEF24E229CFD75F7F5D0F67262738134E589FC18DC85400AF
      33E186C49947236E13B3106F80A7D5AB57536C6C2CFDF0C30F3C7952ABC2E91A
      DE28E09733A30D84031E407888C75BF0292E2E8E9872BAA2AB50AB12F009840D
      19AA82CEA4C2CE385D912BD4946A8EA1B5D52A984582B03183D385C06263E540
      C959A986855E918E39DDAA0D78F465270CC509F30A389D8D2C51C801272A063C
      0271D1192C2BCA81E8897DFBF64DFBF2CB2F1DF176FB745CEAD9B293A280D747
      67E18B7A368ABEAA3378F06019DF6A4DC39B9B63206C571C90DE6CE8D0A169AC
      0F1D114415F8E481E23AE03A7A07A4DB8B03D2B7B01EEB43E79F0956C7025A7E
      033003E0C163B3651690159926AA60A1188E6776ABE22387F52D64826519A721
      120EA84175801C36E24B3801FC7D01BC16DC15DF6FDC4FE61FF32CE334D6615D
      7392E9EC628E541F3B76AC03BE7880CF34F777802C0A86E90CE6392D32B226F5
      EAD587D3AA4326825A02C4343CF7BD77EF2EDDBA7587BF226CDBA74F1F017C05
      C196D31E3C7888B4DB507D9EB1E5B1A0E52B144672F27556A283070F0ACA9B23
      478E908F8F8F98EE21AE05441025409DB6E1B31181F85001FDF1C765CC1BB2C8
      D7D717CFE2D411609E07965BB76EA204D7F0C0934BA02449DBD88370002662C4
      8811525858150A0C0CC414C048FBF7EFA775EBD60930CF5F980C0DAD42111111
      D4A54B0F896D005380B7DBF83CB5DCBF7F5F19C783DCA64D3719D31B1953DFFE
      0CE63162CB43860C96E3E25AC9AD5A7594D9C6648D2D2277F1D527B94F9F5E72
      E3C68DA1D059B6B3B393912402F31858E5810307C82D5A34979B376FC70EEE8A
      44DEC0C183D1A347CB3D7B769731A443A1838CFDAE3A607ECC983172BF7E7D71
      71D2446ED2A4353B78C0B6CA5ED0F1E4DAD6D64E5C1B6AB53662B2CD0A0C4EE3
      BDC39705EEEE65201266CF37901812F1AA03AD56834F2FA7228A75AAFC7C4179
      C30E2EE003D13CB0F0DE60196000D479E2CC96F82298D168836B475B7273F3A2
      8B1713F9C2E26D560212389D2F46F87BBFCECEEE48BFA087FC6D099B26C072A0
      22A006B4CBDF188527B100FC7CF03ECC5BE04FF0C3D8412D305C1FF6A8055F9A
      9007A51C201778B93068D0A047004F3484A1558E9D9657AB5DBBF11B71F55B8F
      F9B0765CDFC5F53A359B15D5BB6E4295466DFBB6E8F2664EAD0A4E1B30E8FAA4
      A5A50DC199FC677C29E19646B8316F3CD3672CB0B733AE6C52CB3FA647B33087
      9EB135A86FED186A533B2428F5C983A5B8200BEADFBF3F3E84579E4F346DD94C
      75F0CAC2CDA78382321AF6681248E53C1FE2EC7C9D24CA2683D683BCDD3D29B6
      8A2BF6908D38F5F36E85B117605A0219B1E8C73DE57DDD229A57F5A1BB4F4EE1
      09BE6CCAC8CB214DBE23DDC9BA481977F5F4CB965F08C5273E43B303EC992168
      8B1B128CDBE04EE58EB8981072363EA5BFEF1C217B771DA5E63CA53C398BF2A4
      3CBA77C486DCF5F684EF7989533D4E2EC219DAE00E3BF8CAC1C5BE478D2A7924
      4B4994674CC605858407FA32E97E4A0665A5E750E6D17254B542059E60E041C8
      605CED5CA5162D5A8838EFFF28A39D91D2E41C92F0818634ED75B2C997E859E6
      33CAD266504E6E04DA025F4C42D72E5BB62C5DB89B4EB5F1715CEED64A1B3888
      3AE903F0F0A21B5DB8BD93F4AE4F71CFAD0AC9644F8EF641942D278BA14C8FEB
      A6C7B99E684C0369B5A61EC05538A377B0ADE1131C481A3B5BFAF3FAB7743BE7
      63AAE4F23694DCE9F19364D2252651A3A040E2B505CE19BB933FFA46DBB76F27
      76302F2B5F9A64F0F7271B3717C287EBF1A5E96FE849C601CA4E7F8445BB39E4
      FFFB266A1410C4D33D0CF9F808DEF7DF8BEF31F011AC433DB618247952D29FF7
      499F81A88303E5D876238DA13BE5682ED083FB27C933E7223D7CE88A1269B1BA
      912EA680FC8909D8A27DB0C5AE5C979A99DFFBDC137B925CDC48B673C0EED3A1
      DE12E5272F23E7C75F518DEC185E1E207CF0877EC15D701E17D076CBF968840B
      2238D9FFF8697ECC899B12659291F0283E3E5F994779CF30C0A42CA2CCB4E3D4
      2F221E6B28F5085FD9E3AFCE7F81F9E340B52B9F5E9F30D55E7AB2A9498574AA
      E1924A65B36E9327E023A551B07F6B3C003B50141F6FFC179F1A41AE0781E701
      5FBE89AA5BB76E4CEDDAB55FE93C7CFAEE7E6F7E9AD26FFAF28CFED397A7757B
      F5DDDD0195C207636A330DDDF7FAA04183A628966A15BACD98B10C426FA0A4B0
      F79BB7DF5E68A9A05522A18D1ABDF2C55B6FB56BDDA04170ABE8E8E0164073A0
      45BD7A82F7B4B30B3EFBE79FB9556262CA5E3C70E0A862A796A0D3D4A93BD624
      24B4E1EF8EE4E0D328FCDD113C112B96C6301E123ECD27BE41D2F9CD37BF87F1
      9E2DB3667D084A6A2362DC97D81BDFB0D6A39BF227C5F8F15A9D46C38387F858
      F4C7385736A952A54DE299333DD898A13AC0E7C5346CACA0A093264D9A104E7B
      C49FAB0E0E0B7BCCC60CD5412EEEA76390C0FE97541474C2E96CC4BA4C19AA03
      7C094EAD82520AA64539615D3666583AD0B001CF8905853B855A3AD1420E07AA
      9DCA60054BA33462494ED819EB72EE0C4B07A8A2245A5CE48CD61714392A948D
      F9D36B70C079B13DA90EF01CB65A0278323564114E44157272543B9581576484
      12C02F98624BC259B32ED444B07480C292C899954A720207AC62ED006B23188E
      48CD99358A72C27245973D7009BA81199CFAF8B1115404D106E6FAF3F3180C1D
      BA370FA83C1A9B75074359FC21AA3F9872B681812D34B658DE46E445213F23E3
      7E4652D2CFD0BBCD25027D1E5EF6FE8206A611004FE970D4CAECB0FC84091388
      C1070FE687E2817F7CEB54DC5F80AE556007A7612984A87B4F2C30089E3F7488
      EF750A9E2FF7B8EE58531C2504161B766011A5F59611E6799ACF1FF2E135657C
      EC8D455610BB8E259C2353057CD6619EE7034CB9945C4FBE0761797F41832FA0
      5D43D1790ACF7A026C8C0F9D11CF038440DDA8F717F813648C8B1AD43360F5E7
      6B4871A218F3D230562BC4F230DF6B28F1FE42D5F02A6A1EFC0D2A8EE0FE2B13
      9AF1D95641C5A6A4FB0B42011B2E01881A7A3708153CEF091E2744C4BCE10616
      B3747C1DD62C22524AC0FF1AA954A912F1B5929288EB069C1BA395A898D14BF1
      F1F1F28A152B78628D997A0A2925E0463C76EC1861FD4835C02A4EE1FB0B48C5
      1E9285317835B02376824455C67DA1E0FD05B51FF0C79B544D3005FB05E60298
      2FE4D1155CD5294EF9FE82EA0036B4EAB39574F0973DB47ACD068E0AB0210610
      312B61415E5EEE222C506116C631BAC1070F1F4CA739BA7FDF6E71CDD8B2551B
      8ED282F7E7E149B851627A8B539FE813D81B56F717B80467A0CD8EE8C0C12383
      C17FB660C102D1A8FC2720BEBF00990830667A87370AF82DA50A5F24E51EAA26
      F82E92E9D6189119CBB82DB804CC170BBBEA2BF91812E9E90F1F13F9CE879349
      AA130DA7702EC581D30B819D9885C281992F3DB9F5BC042FAC42FA6F43D5E252
      8136E01C0B9500555902ECC710FE292B30E538B0A46003727A21071056C3624B
      0C7A660BF0C494E3E0AB0185829503E4B21CB73F2AF011885D64C4820B5F7C1A
      39CE724E2FE8C1CA011223468D1A558E8F3A7CBFB15CEFDEBDCB31E5E1BD7BF7
      1EE5381DB00EC849152087B3380F6001A2B5ECECECFCD8D90CACE060E1A10D5F
      F29F5595C1B06DC1BDA08713DC8BF0E08347FFECD933070CE94F7924F2F42C03
      13E2CB63A6A2AB3353B00A06BE3263E0E011CE9972FCF2E52BAC6FE08D258492
      85C0067781B1086340094E88341CCA3A93CCC86A36BCB18450320B6AA04E3797
      2D5B26CA8A625F86BC25C6830BB8DB57193C875BD8D4044E032288A391EB8D58
      0580B351EB8978C1C097FB5910FE89CC403021511811FB173698C5606285D911
      9742C0EF23DE5DE24C25E296690578CE4FC71B15E230CD26CB31E0D9D921F0F3
      FC785275CD8CC64C4D03851A79CEC0FA79A408EEB9038B63BC08BD9710F1315F
      4A75DE01FC4F086B750C9A2876F16382B5F6F3B9720179A9C784E76D60F680DC
      5F6A4C28E4007E5E6A4CB0EE07B046D0639D88AE5D4BE2A58E94AB57AF42447C
      CFDD2529E91AE167D5D58B74806A946A4C80B3221BF1A5C684A24AF072630277
      062E8A1935408F00190C8C09BF81B634532143FC5780C704D3B056C0410524F2
      B4AC1A6871E0396145A40B076240E1C8FF61143FD414D328586391F1BD63C212
      BAB02DAA1F14634A74E8D021B975EBD6B472E54A5547B3F19B6FE4F0AA554D08
      0F97A7CF98A1CE89A065C9D3FAF5EBC53A22EE3B126E60AE423A5197AE5D657C
      085928321F121A2A7824325540DF7CF3CD2AACF4739C57B4E419D619112DC2F7
      9BDB77E82057A8585128C1010795C753617CBB40C4F96C8DF9828C2AAD92F6ED
      DF2F4F9A3811A71889BC3C3DC58ADDCD9B580F232C27B20B1324DCC09579026E
      8A9AB68B162D224CDFABCB03060E149E5F9F3C59C6C2ABE04D2A2478AC9989DC
      99B21C33163C8214297349785D50C64C4428C6E2E6042615F2AE3D7B449C9519
      C3860D130E9857C0C6919191B2061FC316AD8B04B94E5494B87A9B58E0C9B8AF
      BEFAEAA0282E9494802AAD56BEF3AAC8FEAF5271401457F9C133EFF5C1703609
      E9D50125FC8669CFFC55D33CD7B140C39BA2D0736AD2CCACAC8C2FFDCB658575
      6A2A3D9A32C82677507BC3D3D0C0BCAA2CE774B6D3F2A6205A8D3CD327373767
      61D306360FEAD6B0D154F6B573D2EB248D8BA3C650A5825192B4598FCEFD9EDA
      B242E4B0AB453AF00CEEB5B66A884D99BA91CEE4E9646BB03568543DCC72C8C3
      4DAFBF999C225D4D4A092AB20DF0450479DCF0B007FEBEF685E6854A69EFDDCD
      CC9DBDF89C8BEA594960EA54BE7342AF4E15F395377B87FA3839E0711C832564
      FCE567F38E3FB138C41605E012D83321B27A99674E8E7A2D1B174816D18B7FA6
      66ED3A90AC2FB2049EC1833BD91875016121CE794E787A498BC9A0B0326FF2F3
      65DAFCE36DFD9F37B27E2BD24190BFA3FEFAA3CA71C10176FA7278998441A751
      DB0ACEE8E4B9A7F96BB63C90248D61622107F5EBD7EFACCDBFD7B253DB865537
      FCA0A1CC2CBDE4E5A6975D9D74D2DF77F268EBEEA7F4F9D6543834BC777A53CD
      4560CCE502C1A323FDECECEC3B8F1F3FA963BF7EBD7E740D1AB3CBA7CA900148
      2AD013F3E6FFB2DA57F444A49902D60A4675EAD465E7A14327E5C0C00AFB70B5
      D6D39452F256940077396754A850B9D9B8716F34E8D7AFCBB1DF7F4F5C85EB84
      E56653D94C8B22C29E6F0D6FB87CF99E1C13D3F437DC88995C946689325CA5F5
      C325DE8F30FEB008452E41712842FD254552B76EDD2AC0A60EE0089436A441F1
      184E6F7F69F1004FDCF8F1E3A762D17D486C6C6CBB8080F2EDCA96F56AE7EAEA
      D6CEDDDDBD9DAFAF5FBB90902AED6AD78E6ED7AA5587760D1A346D171A5A3DF8
      D4A95FAF75EFDEFDBC84617DF8C89123976294217EB0F9C68D1BE4EA1D4815AB
      D6A64AFEDE94F624850EFDB28F92AFFD216E29E31EBD58807A053FDE53783387
      8E6F978B9B6F78D6802A578BA2F0E896E4EB5D96EC6C0CE274D724AE1345D48D
      C18D9A4A3470E0401A3C7830611550EC4209CC702C7B2D459D68E9D2A5145CAF
      356E52D972D40A06CAA1B3FBB7D1F0E1C3851CC51FB179F3E64FB5952B57AE8D
      481B9EEEF1FA6160785DF179C5324E36E4E76E47EE8E46B235E8281B7FE74B3C
      71403C25C5BA68C01F7AF6EC79526AD3A6CDA86FBFFDF663768B0B4CAA1CD59C
      74762E145CCE89452A92EF3FA29F377F41B8C92F64D87BAFEED8B163890E0DA1
      C1F5B110E2C44A97CF1EA1C8D876A214CA41ACD76AE8F753874523425FE8826A
      98D1060404D4EBD1A3472BDCFE147772820203E8C491FD54DECF975C5D9C2833
      3D8D766CFD9ACE9F3D85A5C07AC209EF31FCDD7527EE001F9370208D4B4848F8
      806FC0356CD80C4FC47E42E81B84498678A08B4BC571DC05A3289CBDC9FCEBDA
      B5EB78D87C28610059850E34A863C7BE3467CE34C2931F0499D8D7665D41B8E1
      0463DE605E3511138D0552644CBCBC7EF9BB54BF7977329489217B8F28B3CA8B
      C9E59FDA4ABAB4740D0D1D3E94E25A36A02EBD46BED80A1A7A9D8EA62CF8031C
      9106C316BDF1CEE7D4A3EF5812B700B4DA1752BE24B2B373130EA41A719B0EBA
      78473710B197D8A4241F3974E6872E0DD9C40E1B2FA0DC4B80F5EDB86175E851
      6D60580770044A1BC47880AA7CC3E3C190F1E3C74FC0781089DD19D9A851C3C8
      060DA223710734B24E9D3A40BDC8BA75EB038D8006910D1BB688C478108DF1E0
      E6C58B177FD6A0573961BD88FEFAEB2F5C6C5EA3EBD76FD08D1BB7F0869EDB66
      DC82EC2F74AA4B02898947F13CCE25DABA75AB031717C3BF693CE08802AE1B8A
      470909099400B09C654C15ECDCB953C2049C783C5881F160A892C05451E6BB1D
      9895B3485CA109C6BCC1F1B312E341BC84C7065780B172C0B743CC7A2AC9C9C9
      5179663086ACDCB2654B3CFFA78B3D0D61A102B48B6079297CFAF4E982574A25
      22D8C0C167F8EFD7501E505661401904991AF8EEBE1A3133FCF4A49915045558
      B57DFBF621129E7E5C0D0703C9E2A79460D6AC593475EA549152440956E3D267
      B08447213E475D06082D6C7AAF73A6B53D1F81231CDE73080FB40ABECF7A17FA
      B2D763C1F3061DF08B9F7FFE79A084CBB72FE0A03F0B7BAD71259C1F6975F764
      D1EAFCC829D6533989FA7F59969C5CED6971EBAB228E365883417880D4A44993
      3570D0AFD75A67D21BB5580AD4E3C105A143721E1E2BCA35F1B6CE5A7270B427
      1BA31DBD53F704A10DD6EEDDBBB7BFD4B061C32FBFFBEEBB3EAC3676772572B2
      75A7E951074509F84E0FBA3927D1F423B5C8068F924CADB59FF8872AACC36367
      7D79485B0707BD59C89874208466D53B2F86B4850B17122E6D584C538E84D1EC
      7A8982E70DAAB01E4FCCF6913058AEC76ECBC7ACDCC82DCD5DB82065034B602F
      E11E459606CFB1A9195BA6BF14CFF3836EB078D9F1002624C684971E0FA2A31B
      63BC68AA8E09DA9090906E7838A9263FD591827F0CF0270853525279E1895253
      99A6E2818D87C07DDC4A7A400F1E24E355603791769FDE7FFFFDF3FFF278C075
      E031A154E301EF153678EDC7205A1C7755ACB7B20C9D69A5363838B83DF6694D
      5650C089CCF35381313131A2534DD85995D2B39ED0E6B373A963F82421C31CE1
      74A9C683A1DF79E12F070EF438E511653E45DFD6E7D0A64119848C3F53C70374
      26CE5405DF2AC59A01E15F9722374EE8B1C29D36C63FB4ACC2AA528D074A95FA
      AC2D43EBFA3D501DA004ABD5F100B701381315FCB40F1E8817E381E2A0FF7A2F
      5AD3FBAEEA0007D41756E38162CD531E3652C68309FB2BE35F246E74E7E175CA
      CD92F03FC91C5ADDF51EB7C11A753C508C9962FE23EA8D8E4278F452F013F787
      A223E1F3D5D9F8D0778F3B4286DDB8D66A3C6063060FE15C02653C609EE58337
      95A5555DEF5856615DA1F18015D9010E59B21C0F14279CAE008DB8FE5F1A0FD8
      0132106302F3FF1E78042A80EE05E2A2CEC5C9C46CB340114A75B5A6D8B0835E
      88BC073005110F7E6E03A3C4995AC6916411CC45EB03BA03E0E25AD26A902971
      4E3321DC40F4B507D1571EA483AF79C03A807910212B8AB24C409EEE2C286FB8
      0A3C16F07AB2A583DD48DC009C039872DC74FEACA287C822A088A6624905EEF6
      148E8BFB70B40145DF0898ABC025380C7FDEC08BE87E32E51E09DD6558E7FB16
      D4A3E8DC3BD8159687A2E1301ED0BA322707DD1D2FB7BAD82B0DFC306BC576B6
      244DC07C73A51BD10AE05357925ADB1081D22AB748FAC2FD64AFEB23E51E49C3
      65E681462607C17A93E13257A265AE1E30FE9696BB2D8361242D468B7FEA1A09
      D9C97617FACBADCFF59199A7956EAD68B51BDBE35FA51F4309153287618DEB36
      59E0EAE8EAF0EDAECDA770F1B41CCF180D8BA85C33321B7F49BB702DF1141E4A
      9C467ACD4F62874B23ED893E70B24423C44FD63D1E27471C6E22335F79771D39
      70674DC1D3874EAD68890B51FBC2D796A602B4306272E4D88A663B9EAC703C52
      F6FBB59AEC7DB88ACC719A03794BA49B348BDC72674291F00DAA01365D699ADD
      49F7C42099290DB0E9020B7700C525CE9E7525C4AD02BB472FA120486B505B6D
      371AA23B29285155C82A01BE00761161F7A075102975E05E5B50997B6241D9FF
      9638EADBBD347529A90D4A3536AA0E90632FE03DA09739672DF86D80883305D4
      B859C79A40418C8D2C05BF43A1E0C5D8C8F182C052A3A9334189C7C64428E800
      0EC5514E7B0E188A08E86E6000B09B054CCD106321784EDBC394D35540A0F2FF
      0AC30D25EC929AF8CB837C1D322707B91E1A59DE296D4205972343FD1CD35FAF
      E8727880AF43D69420D7837D7C1C72A606B91E589494FAB630E28D180FC01C6F
      E0E3C94E121BF97A585245AE504E87FAFFA6F0FF002446B4A31C7DB9D1000000
      0049454E4400000000}
  end
  object ImageListIconsTango22: TTBXImageList
    Height = 22
    Width = 22
    Left = 248
    Top = 192
    PngDIB = {
      2D00000089504E470D0A1A0A0000000D4948445200000016000003DE08060000
      0008E7EA7F00007F40494441547801ECBD07801445D7367A7AF2ECCEE69C23B0
      2C1BD9256C2067100451C40028A224119057258812440C280A82011366CC624E
      E420A064910C4B860D6C0EB33BD3F73935D3B3331B10F0FDEEBDFFF7BB5BA7AB
      EA9C534F9F3E5D5D55DD5D5D23DD71C71D74A5BF137947AB254952CBB28C4812
      AA92A41209BD4E7FA8A2BCAA4B5C5C5CBE10386D349C3E76EC983A2626C683D3
      4D907EEDAF1B08A882542A9588596FE9D2175B7FF2F9A73BCE9E3D9B12161656
      CA3C8524B6D8CDCDED000AC68129835CC2DE3F77EBDF7A7D255557570B3E2CA7
      BABA3AB25AADD4A143079A376F8EBC6EC3FA3FAB2AAADBC3F22AA1848D0A44B5
      B5B5ADC78F1FAFBBF7DE7BF563C68CD18F1E3D5AD0A851A3F42C57ABD5B466ED
      1A416BD7ADA58D9B3692D16860113DF6D81CA957CF9E6D7446ED12C1B06F1460
      19E00497D0E1C387E9D0A143F4D75F7F89582549A4D7EBE9E6A137D3D09B860A
      1A327808797878D2A54B97086EA05E3DFB481AB57A981D5344C2C7168B45C6A1
      497C884C481378E270594BABD5D2C79FAE224B9D85B382060DBC916A6A6A449A
      702AAD568B30D2C6201299DA5A332C360BDFD598EBA81A5463B65065959948C2
      BE2535DD7CF36D74EBF03B69D8B03B04E90DEE42260342AB359255565B37E5B7
      33BCEFE32330518AB0673399CDB574E8422DBDB6A596D42A35760C33484756DF
      11943EFE2BE46D4126D7F36BB567ADA6619EB0B3DCEF5472FEFBABEF0B15B5A2
      A0A0A0F6C1071FD47CB0EE2459BCE3E98E3EC924DB0B301CDCCC5193243971CB
      6BEAE8BEF95F5AFA796DD608E00B172E98A74E9DAA7DEBD7331412974C6989E1
      9477A9C2A9C8DF278D3A0D057BEBE8E1177F2CE963DAE02D5C811A21F3492B83
      4B5B7B18898F56A316AEFA7B44BB86054758058BD592AA845902D86CB69DBC72
      B344DE2683708316759715AE86CAAA6AC94DAFC2B9AA259CE7CB5C469885AA85
      5A5147E5A83D9E261DF34983F3F77724E1D02AAB6BA9B6CE4AEE00E6340A1780
      48B15854B54AB80275886A6AEBEB2B2BA19A131FAA2C5B51B709755C868E153C
      1C3F2BD8E9725935C916F92267C5C9DBBD7B77C5B469D3DC66AD36D3CCFB7A52
      49A595CA6109EFA0A6B63100176C48A1BE063A78EC3CFDB8E5F0A27E1E1B1F12
      C0DBB76FAF98F69FFFB8CDFCC642936EEF4A27F22BA88E4D6C58FA0AF9206F3D
      ED3D78BA76E7BEBC59FD7DB63C2B5C017D6B79551D1950650A2BE0B36B044579
      AA32CB5450526D269554C87905984AABAC1419E4417E262D79BAE1CCB1F41A48
      8DABA8ACACBA0E3E2EE2627CE1685AB66C5994D86B8CC7EE425FF20FF065FE35
      531D4EECE9530555D545177306471DDEC5C0EEA1A1A1AF5BE287DF6C36C5388E
      E0DA9025B4FF725DD5E533EB6A7E7B9A9BCF1206D60224141400BA4E609424B2
      625B0A3A895EA91A31B7A6A23E73976004E37A89CBF3D5256A1A5B0C2C5B18FC
      C0C8378E94460D3E7FA9C6D7C6B16DDD75D68A50AF9203E11EBBA67EF6D2EF9B
      6DDC2B6FC525CD2A73170F4BDB793E7A44486CBA6EF8CD432BFB0EBAC53A6EE4
      28EA77E3706ADD79887BADE4E5B7EF7C875583C6E65C79BCC0602001CCA05FEC
      89FC2C29A78F74F4D811B72F7FFAD1F8CB0FAB551FFFFA2BE5575491BF9B9E22
      326F8D55052487FD7EBEE38AC1133AF443D9BF0F5DC7DCF5E34DD367FC9A7BDF
      83FBEF9EDEE7362E31EAE14E7D23873E58127FEF0BD6AE0B7F959972E77D2727
      8C5B66091D3CA5E4F6FBDBA06F62CDA649F8B8CDF089C7D0B6EF498F3C3B71E6
      035F9E5754473E3C78DA0F87931785B74A249DDE8D341A2DE90C262ADDFFC17E
      4F7DFECE352B3E1BA5E8368C0570EEDDC3572718CD7B2FE75B66392B18DC25FA
      FE524B6A9999E3CC26FF8A9D74E1EC698AB288ABD759F6C8679F7CF50C3304F0
      A807FB8EAFB9A85FFEC66B1F30CF85226E99DB08D8CDDD8B76AFFF8E4E7FF2B8
      8BEEC8BB6E27000B4C7141949FD61F090909A1F2F27232994C545656E6528033
      5515656474F7E02469745C65C9A177B1E02205F90711630CBDE5C63480EF16B5
      02DA71E1E19188884ACB4A31CAF1A0C4D1CF0B12CC061B0C4E042775C232A1E3
      6EB49DC7007FBE78A9250B15E0413959B954515181CB50725892D6A53F31F9FA
      87B02E068695B6B8A284DA6475A7D6995D44DEE46E1231865A1C27F34601EE1F
      15154DCE7F3F2C18487F6EFB55B04E9DF80B3DB795EA6ACDC42E29BE9C2FF87F
      FDBE9EBE7ABCA748F3262EAE05478FF246C53E71C71E79E0171414C43C419121
      2D68D5C3B9E224050647D5F76F681E7D7C83E8CFAD6B84BC45548AD0F7F0F010
      B17F401031265BDC322C3442300B0A0A847F598907D809D1A9F4F9633D1CE0DC
      987BFA040A50E6B39C7599B82C83F87A8B66A6A50699E4B6E91918BB9965AD56
      2D151515A127B692BFBF3F4444ED9273E9C7856ED467C6D7C2DFEC9E1F170EA4
      C4F8B642AE00D6D5D55269A9596E9DD05A3A7CE4AF2CA9FFC03E5F3D366BEEA0
      C4C444BA7C598C354481869B23A7F6D1B0851BE8B359DD2936BCB58B984171D6
      C9D7C78F0E1C38404F2C9CF786C668300C4A4E4E168A8A9522D360E3EFDF0D17
      44B706DCC6D9B4B43472331AEE6157D0F9F3E7E9E2C58B8DB5EC1CF43BF654E3
      A8A18C2F12D612C09CE0D139D78A8F3EFA48DC1A787A99C8CBD387F8FE03373F
      C42793632F2F2FCACFCFA7B0B030719BD0306E04CCE01875A205D360508871BA
      A4C105512D808D4623E9743AC167BDAB21AE6E420FB763E2CACBCAEA48191919
      D4A2450B61557070B03802AEE71A8DE30045992B6D84E6B973E7E4888808C9A6
      587F91D8F28DB77E7E7E82999090D0283E75EA940CA624B5EBD076586464C42A
      64FE6BE1D4A9D3D9762B6D984B972E9D80A673302E125F1BC7B6857F2BD09C1E
      30180CB8A3982AC60C3649F35B878F5905677B044645BA9E3D7B5676EEDCD93A
      68D020EAD2A50BA5A4A4B8E31CF8E1025AB568D122DBF173812B900378E1C285
      1F03403A73E68CDB962D5B8C5BB76E5521162794AB59AB56AD623D3D3DC30A0B
      0B573CFFFCF38157C0142271F29E79E699277D7C7C4EE2AF2A202060C17DF7DD
      77F895575E09C04E5681E781A3102EE32B1317841EEDC34728DD1DD46C1005E6
      CE9DFB31AAD59EB163C72E70D67CF5D557BBE6E5E52D428D21BEEDE5EA067FD3
      C99327F723BDF3E1871F5EE2ACEF9C16C04F3DF5D4E368FAF6969696CE721672
      DDE5CB1D6E70668BFB15BE41E79DB908881E993163C6AFCC13AEC065FA3D6AC3
      72DC9D32CF851E7D5474082E3CF85A3C2978E289275CF8F0FDD360648270878D
      6D7171F1116F6F6FA49A0FCA8310D6801B387290D2ABF33950982A7B222E30D0
      F544B3A54C76B94BC48F1D98316FDE3C621DD46FCE121B87DA15C7190578504A
      4A0AE14692790E4A4F4F2726D418C1C31DAC88D9FAA4A424522E69C5D7FC2807
      0AA2715780FBA34A81571FD8DF7FFEF9A7609C3D7B56B46C7CBFCDA038C9827F
      F0E0419A34699248F3869B5DC4E2A4689020E550B8EDE53C93AFAF2FE119112D
      5BB64C588DBACB6CB1039C6CDABF7F3F4D9C3891EC6042C61BE5E854EC13C5BF
      A8FC2C731037DA5C78D7AE5DA273C5654D5C231450962BCA4A59545B624CB638
      D9EE2BC7133B5662102EC485713B4CCF3DF79CB09CDDC379C532D6653D7613D2
      727474B484A6334BDDA953A76168705AB9BBBBF33D15EB34227615EE05E99B6F
      BE215C9D84CBDE458741D9109C4489DDB963C78E3F35B8BA06298A2C7429E194
      E1CBBAE105A18801A82485CF6188AD97E6BE0E6DB043D83081436CC872E41BCA
      948B847D2C94B88E724DF8E9A79F441FC74D251A77D13B7367CA47034BC4F819
      57AA38995C5318A861CC800E60CEB0AFD8476C0577F7BC338E19900F97F9AC77
      35A45C20E2092B577E1E15716BC63EE56AC8167153C9C43BBD1A50D61116A34B
      9251D14513CAEE60C195882F1096A3267144CE311EB5D97AE9C99327C7A1915F
      2534FE4B1B80BBF6D2F72F78E48DBCF2D0C1F945665FE77D18B57245A0A9EC40
      90FB5F5397CCFE74B3B3ACB9B4C3C7CB564E4D3B901F3622202251D7AF77EFCA
      DC6E7DADB7DE38983A75EF4FB1993DDDEB240FBF23F929AB263C7EFB1DCD8139
      F3053083FE7230E4B3166D737139E6B9ADD9BCD9B875D31AD50F5B7FA3A2AA1A
      F231E82838A95FACE4DB32ECCFFCD415F7CFBDB59F334853693533FD93BAAD0C
      F4F3282D397FB8BA8DEFDEA9EFCD9D7FCB1DB7F86F3B7DC938A8A2B24A27194C
      921937367AA31B59F02CF04C8161D02D03DD966E597BB896CB3745A2260C7C70
      DEB1B860DAD33AE4D2C4B1235E72DC4B3FF2ECFDD336E5B558141C1D4F5ADC34
      AA3128D4EADDA8FCF0B7FB4DBAA29D6FCF5F32AA2950E609E03B663EB83A465F
      BBB7F4B275163315D21B25DA581445D16DDA2A2C117B571DA0828B1728D45A2C
      F24E9B4796BCB0ACFE5E7AFA53F78E3717EA963F31F759271D5BB2FBD4658D80
      0D6E1E7470C77A5AB378A24DC9BE9D3EF32102B030565C2095177447B885ABAC
      AC246E23F80ED5AEEB88AAAB2AC860BFB5556B7582AFE8155E2E243FDCD830C6
      035326A601BCFE5E3A38D8765B5B5E512EAEA4818FBE4D4C02A1C1066F0A0467
      C8BC0F848ED16014797BE3DF9233A2BA2131283DB52D555555E1AE4A120341F0
      28A15D17415E3E019CC5F361DB08B6A6AA8CE2D33A526C523BC177436DE104DF
      8F234E06D9062C48A0970E43541F5E9BDC8D8EEED92A18E7CF1CC7BDB48CD715
      B5C42E292BB1DD0F1EDFBF835E9A902D7478131111C591E8A555EC1323F6C8AD
      97720BC0D29080287AFE9E0C71927C0342F13A4266B6D881A7B71F1DDDFD9B90
      47858A2317EE63051FF89A31D9152D8302839927EE4CB9A562E2763826AC152D
      199FE500E7B738262F5F01CA7C96B32E1306E502C3CBD38B63DBBD7462EB3684
      EE49D668D452494989B897B69F084A6AD996564C35D0BD8BD70A7FB37B564CED
      467191890C208CE184C58247F1E5B5725C6C9C7432EF78963476FC98AFC68FBD
      7FD09B6FAF6079B3246BCCB4A3AC25B5F7384C54A76B56EFAE91F7D02BAF2D7F
      43F4D2DCB5B3E694C9FF218C01F0489FEB387C2A219665F42EC2B5AC8247F892
      5D87283636968E1F3F2EE410D0E2171789F19CC1A0B7F5D2E841442137DC8162
      B021D27FB7898F8F172ABEBE3E88F954C110A4142CE6206B0BBE3EBEB6C4556C
      9573E0E5E54D5E5E9E2071D21C25358E14125A9D96DAB5B3557A64FF5170019E
      3CF5FE6B02437DA5E6CA0860DCA8C8D3A63E8C33754DB84D2AE366889D2D49B7
      DC3A74584848F0AA26B5AE9379FEFC05D75E9A71301E7E1CF11CB2FD3D826827
      06DFBF20BEA6E0522BEC25E74C9C309E66CE9C41B7DD36FC69F07E1E356AD400
      C47FE72A963BF01C09145442E8B2E52F13B7B961A1A10CCE03C16F2094415C18
      916B881EF242C803F3DFB4227E4791A8EC09092E48E3340EFB3CE2D0854F3D4D
      35D55514131383AC23488E943D01302E776EF6B88114EA45C1C80BB731B0346E
      DCB8B9D0DB05F0F988F986E67C6E6E2E2E551633C7415647AA3EB16BC76B77D0
      1F7FFC4177E7B8F7488F32F460115737BC6C54CF1E3FEE5E52A9750F81F9684A
      4A0AAEF956B843B2025C22734DC536EC340D47B31B72478075699CE117E5A74F
      9FA605DF55703694376C92393434743F5EFD9241AFD53F70FF04EAD229076FCA
      B40096A9E47211CD99FB440728F311852016C10EBA6BCBB26134FCE9DF14D0F4
      935F4C615792C45AB0260483EB037D7BF7F06EDD26595889F60C22894A8B2F23
      26F2449BF0E4C2A7381DFAEDB9164148ECDAFEEAED75EDC77EC047DD0B80C2B7
      E08B20803905F0B4A8A8A8D7F17C2283F34CEDDBB7AFEDD9B387B6ACA45858EF
      8EF7FDAB56ADA2655B74B469E9CD943BE95356632B7773C289B8C175CA3A25B1
      233EEC4E60ADE23A5D545840FB8F9CA167BECCA32FE60FA0AE53BF84889A0485
      4076588C4C93013B4883605764FA007AF9DBC3F4C9CC1C9AF9E6EF3428B1960E
      1E3C94EE7442198BEB3AD4C9E663916AB0C1C90929387BFA9CC2F60F8BA0758B
      07D35D4FFD4483D30D74EBA05E64BFEF0B05F825E859408EC07B71649484027A
      4BEF56949A184B050545F4C27BDB88C1A7DD1042A178011F1B134D61E11184E7
      49843F67CB91E53A26A2FA8D33E8C81B73C95A8EC7EB78FAD223DD9370047470
      E706C26D32AAA68E0AF32FD2E38F3FCE85B92AB2CB382D88EBB148F046011D73
      532A8DBEA90BFDF4E3CFB4FE8F43D8BD06A3A03A56614A672BFDF0909F6F2A9B
      0377002BA033EEC9A53B0664D3C75FFD423BFE3C41D99D3AE1241DA55A733583
      E2397C69016E2C3318DCD7DFF6B84701C77DB9C372E16380A6E13077CD9DD08D
      067649A1A56F7F4D2770DE3A75EF2140CFE51DA1CD87ACA4A9BBD4A278E7BB7C
      654943870E4DC56DDC2676C539BCD09AF5E86C7AEBADB785CF7132256131834E
      BDB303DDD8359556AD5ED72468EDA59DE99505799E309BBB72BF7DFBF6D58206
      B0E5A1A8312FBDF4121F0DC422085C32B59F26BFBE7AAB7CE8F82979D2C373E5
      A7DF5B23DFFDE86B729F110FC92C23FFE42E506F03E2216A0A623E516D11A7B7
      6DDBF6D6D9B367CBA8EF32A6046DC374A0C1E0AB412480874F7D4E007EFAEB4E
      79F6928F1DA0AAA0B6D9506A69A704C44C9C6F8534533CE208902FC80DA403D9
      8023072D4A67CB189CE9C6B17385A57E1DC775714B189808452EC4E487B4BF9D
      9434F3BDC0730729A0365780410A38EF8029B8C70CB6420B99C68938CFC4004C
      7AC83866623D06141502FCA6031EA76940F74F99423F4E9E4C6791AEE598F348
      DF0F62A0A60B83CB7B40E41A50A81326891DE9D3871601AC379E9B863EF92469
      A64FA7D0D1A3A937AAF6B3B8973CCA7AAE25EB738D80A1DC056FDF7E183B96A2
      31A0D4EFDF4FB4772FD16FBF9115DD9A392F8F6AF05A4AFBC82314151E4E3FB2
      7E3D5C7DCA05184A21B0F4F37BEE21377E6D8A795ED4B2255941B5A01A3CCEAC
      8D88A0723C79BCB46F1F958D1B47067777FA82CBD543DA522EC068F627DF7107
      79E16E818E1C216ADF9E2C3E3E546D3050050098CAF0BEA5066F850AF122AD1C
      63EECA2143C8C4E56C70F55B176058DB3B2080D4870F138584502DA60A61DA1F
      5521AE80AC0C7E2D65321AA9002F1CF3F15EB1042F7864C87AD543DA522E6716
      93EE5AA110DA5F212CC3D60A6B2A51B01231EFC48CA32974C30300E8D6E1DDAD
      0A471488345F3450AF0FB62BC49ECFCAA2D1F0A32F0E93C10AE18252ECA81256
      F24E0AF0DAFAB8D94CE791375B2C1886A8C90B47E8BD762D9DC3C95D6A871191
      0B30A608A6474753AA5E4F6C612176E40FF01A1CF25ECC993B0A3F5763389789
      574DAD4F9EA422D41E3F58EDB67D3BAD05F01702D1BE71F1310E69F1C68D548D
      6AA601A019876F8175519191741BE8411CF624944B069971122FC0BF315F7C81
      D6B48E5E06CF25B8588C3D5F842BB8F54E85B51A54B93CBCB177C3CBC9E77014
      3F6147EF823281B01EFC1BB66C21F3B66DB47AC9125A0E9E4B905C72C8A04E62
      2C475BC78CA1683CF4FE13B5C31D3BF80ABE3E06EB6BA0321CA4C6D3F5E4458B
      A818BEEEB474295583E7121A01B314E078AF44BB66CDA20BF0E51E809E852BB6
      62D2A337A66C6A71C5CD461FAAC5496E07D0E35CA6213509CC4A63C6DF5B33F2
      EE3BD5568B59B57FCF1EA97BF74CFA7DFB6ECACA4AB3B8B9FBCA73E6BC6859F1
      CA1B06D66D8A5C4E9EB382643DB6F0CB4FD7A825D957EADD7B181ECDA453D76E
      B7E1755098FAF5377EC28BD5132F38EB374C376B71D7FEDD477B7AB679E386BE
      9114116216E570A1D0854B449B379FA4D796AF68B62C2BAB78D314ADFB6ECD9B
      39E935E4A1DF4739393750D7AE0328313199FCBCD5141775454C0177458D51A3
      DA7C93989833A063C7608A894BA58AF2325AFDD516BC03D9B2E6DD77F7F71008
      CD6C9AB518FA3A0534ADED200A086C41DE3E9178B59C4E4949D9DD21F7057197
      84E8EA8227D46240199999818F2E5830DC326CD82DF2848963E49B6F1E687DFA
      E9FBD09A49A321678B3310B3AE09F1DF86406824827241B783663270AF5E3935
      1C23FF126806E83610EBB06EB3D50E3A2E819B536F70D89A24C4ED409D411D41
      E9A0045010C8006A32484D72AF97F93CB1316928DEF5BF07FC3C2D26134DF1F4
      208AF3D6921AE8570C85BFDF1FFDC8DD698B1FB93369CA437724DFF59F112977
      3D2428F5AE8746A6727ECA7FEE4C7EE55E6D48C7BAB641D433A60B6547F5BF32
      70E1CE07BAE23E6CADD62DB0A3DE3D345A67F48AD679068142A275DEC87B8646
      EBBD2382DD8213C92B3489AC86208A0CEF4C816EB1CD0317EE9A7617EE24BF30
      BA0718747A13596AAA3025136364AD01732EB49848AD279506A4D6624E6B1551
      6D29E5E3D84FC107870B8F52933ECEDF327EB1DA689AE2E6194A1ACCEFAE2938
      87998816D278C791545528DE3F1117B5CAB88DC02C45959164B58E3E3FB5913E
      762BA3C2CA02D2BCF0F12648B12B7BC80EFA1D058FE1017520698C26922BCB80
      A12603A69DD4969D252B1E35AA746E446A0D5935B8F054886BCAC9527A9AB4F9
      C7E917EB1EAAC0036E75DF5B46CF997C4B0E756C1349E9A1F9E451F31BB99902
      015083B2062ABF70828C41116431575155D10552E98CA4F28820D98299BB3515
      64AD2CA03A502DA8EEAFFDF47269015131115F08C2D6AAA25D5475E613723705
      5155E945DCFD7B50E9C9BD04D3092790CACEA15B3E7584E2DAF7A6BA8A33F079
      05596A2BA9CE5C42B515455474F1181DFCE314EA1AE0BC8587904028CDFB9234
      2A4FAA29BE4006AF60805FA21A733966F87B53D1F1DD540CCB7D5B2563127315
      5D38B4812E1CFB9DCE1DDE46797B37D0B15D6B69D341A2E55134978C00ABA362
      87C5C6D09E54717E2F19B595545D7896AACA2E915B703C555DBE401545E749EF
      ED4F724D2D1D3BB48E369C0C26B355456EBA108A48BA8F62123AD19B8F2CA71D
      5F1E9C434473087F1A9008925B6B524BEBC95A534D97CFE79107BFB237D7D1F9
      B3A748EB1582C9F69729EFDC21DA5879132574EB426D5A4693AFB797286BD24B
      24A95522AD6C1CC075B55564A92EA7D2CB15A40DC43C7AA9822EE41D22355739
      6B19155D2EA1AA168FD03DED7A2865F178DD6A4FABED717DE40026430819929F
      206EAEAA8FBF45D5E7B7913EB23F594AF652256ED20D693329B66567B270DDAD
      2FDF6CCA016C51760E556DF4DDC4842495E5FD42BEADA249E7130F50E65C1DD5
      03E3C9765345DC227B08B6A519B91036B1A907B63421FD07AC7A60D9C917FF00
      5029EA00BECA73A294FBDBD801CCB3FBFF56FB1A1434FCE28AF56303B8A271EA
      BF439A9F7FFA85BE5EFDED7F07CD0945931656335CB658129C785795C4448A83
      CF3FF3C2AAE69435E6EAEA56CF2F5AD29CBC59FEA3B3A7B76A56088146656F3C
      8A8A0A91BDBAE0831731FC04EB4ADA8E5AD19412A63D483535D56A679915F552
      AFE7AF5CAE7C29BA00EFDDBBCF81C1A09B7FDB787B5969493C9832C81ED0444A
      DCA9C83475DAA49976A673848391BED738735252921DD9EAEA2AF537DF7F15FF
      DC332FE085990C2887E88A09A0620AD9B47E2EC0CE169BEBCC0CC0964A97F1D4
      9B335743EC7FE8C92ECD3E5BAC5062426B8C57AEDA5060D9DC2312D83461311B
      4998365C83CED996861EF1EC268E9B23198D585A5A5B87D8C5E2E4E424DC0624
      83DAE0AD82ABC53C4BB7294A4D4D21A694945452A6AB31BAC362D4023CFBD90B
      2B992DC36233D2F516E34B2216B8105B891B7B3B4FA6B66D33EC698C2B94DAC8
      4A6DDAB42185125ABB5ACCF3DE146A6C792A40D39BB6982BFEBE7DFBB1477C28
      077F99D1F5F3518021025BACE4D908662AD6B66D9B0650C2E0C6C86C41C2C7EC
      1B2EA458DB06EF4212125AB9D48AD4D454F8320D948299A7A9826CBE4D819E5A
      4C23C67365C72C3FE1639ED1C4C036B7B0C5AE5587657FFCB1535802097CCF49
      9B9EC96422656E11DE000960D61716DB805104C87C987C047C05717126E629D6
      F17B2885D8E7AD712E78F6132630B1AA00E684BA7DFB8C2EB9399D253C06C748
      5D8D19D3F8E643A743AC516DDEBAA953EF5E7D25CCE984AEAD8D4042049E84A0
      C61899333CDD92E70AB0A56BD7FD4227F34ECAF850C27068DE138F35D9D04B2A
      154E8A15876E3B6C1C13D2A84AE04B924DF6E453F318BB21EDBEE2353B69CA84
      BA854F3CA3E6B61A5E4261CCFD56F1518953436CE5DC058FD1B09B6E838CE8FC
      8573B479CB06424371AF4D43B09BDE38FB5FA7D3C05DB899812ACF24E3F3C053
      7C90E5C3A7DFFFE0BB01D3D2679E5CF4BA4B23CE0ACED4A163BBC772B33BA978
      AE1BFB910F9FC138CDC4E95FD6FC8C19FFBEB46DFB66DC97A8462F7EF6C5858C
      71458BB51ACDEAF94FCE19C28AFC7296636782E7396BC5E16FC199E8B37CF1F2
      4A66344998CAB0F5B9C5CFC84F3DB320B749053B13F22920F98525CF9FB1B35C
      2295730E8A5370423AB46BD781FCFDFC7F7696354CE38DE5B3FDFBDDC027300C
      E5BE68287701C65C94095C6FA3236348AD521B56BCFECADC860538BF74D90B1F
      858586697CF0ED47E74E5D293828B8BE4F6305900B306A4098BF5F00D8449D3A
      7725FCCD02B9045817555353736BC70ED9E22A83E5B861AC88705142C6051805
      0EAFFEFA0B2B5F555A8D16933B43D4EF7DF0CE1AE83902E6BE7E99D5311BCFDF
      F09C1717CABAF5BFF2C73F8F3814EC09C91E8B88AD41E2C4F061B7838F80CC0F
      3F7D4BE3EE9B283290E762AED6C61B07DE24AC2DC42067CBD64DC593274DF581
      AA4B70B178FAC3B3F2207DF3CBD59FCBF0372E5F99D25333E8E34F3E3A043ECF
      01F8B67BB79EB0B68EDB125ABF610DA65955A6B1AC2135BA407EF979CDEAAEDD
      BA4C311A0D7A6F2F1F8967991E3E7CD06FD08D037D4CEE1E5DA2A36205C6DE7D
      B819AF285F85091F6F0846838DAA415EC98EFB6DDB56C9CD0D8F0BD0486475CC
      E5AF872647444689A350E1B3FF33674F99274D9C325C29D030D63464701E2E59
      057F8EDFB86943A7B6E999E292E6F19A05CF78F932FEF1E71FF884F560DDE6A8
      4960BBF2A863C78F1EE39E97DBD98496ADE9C8D14374FCE4717C99AC3E809D6F
      B2EB351935E70A42C13CF424CFFEF2C5678E39E02693075D3E7490EE1D33AE4D
      936857CBFC52A79BFBD2E489F2775F7F2573198E39CF7CCE5F13BD4714FDB5C1
      B0F25BA3B1F273ADD67A383D4DDE9A9D257FAC568B98F3CC6739EBB17E533B70
      71052C19E763346E89F1F51DD92A30D098111E2EE98B4BE8F4B6EDC2628E39CF
      7C96B31EEB73B9A6C005EFF3F0B09E9F69B5278E4646CA9B7C7C0AA05CB43328
      48DE111020C3AA859F0FBFE5558E39CF7C96B31EEB73392E2F801A6E3EF7F5F9
      E87C8B16F2363F3F1987BA1C873EFFAFF070F92BBD5E7E87E856D607F030CE33
      9FE5ACC7FA5C8ECBB34E23FADCC3F4FBE5D6ADE5351E1EB5AFAA547D0170E954
      6CAC0C3F9E81329E878947197ACE339FE5ACC7FA5CEE3393FB1FD093402E41F5
      85C170212F2646FE3D20A076AB8F8F7C3A2E4E5E6D345E7A49A3791E9A2D40F1
      4CCB349AE7BE361A2FB29CF5589FCB7179C879F0A6412C76C01BCDB726D3339B
      7D7DE583A1A1F2EEE060F93B3737F96D83817B862C287600B507713AEB2D83E1
      4B96B31EEB73B9CF4CA61720F706E9412A90086A6CF59F1A0CB33FD7EBD77DAA
      D3AD5FAAD5CE068F2F8414C449764A43CC94B458A399BB4AA7DBF4995EBFFE03
      83612EF81E20178B911741C296F7C487A2439AFDEA85D8DB897C91F60371FBCB
      40ACC3BA6C181397879888C144A2B9CD9D77DEB916B2AEE4FAB7EEBDF7DEEBE6
      CA72CD39F6C0EC3973487557573230DD7EEB8D5923478EB8047ED78C8C569499
      992088D3CC63D9EDB70ECE655D262E0BBE23A894D403BDD4230A374B45EE6AA9
      9CC968C9DF1C1E1E1890939342982E497ABD4E10A7991711111C60B4E66F605D
      379429D824154DECAE1EA1E00960DE9B44D6C5433BC77975CEC9521B93EF51CB
      9EAD243FF4D871712DC946AD283E9E2901DFEE25D83EDD800EEB7641991BB263
      BDD42ACBF30AB0861327D791CE4343DE5AAD8A7E2F4AA4E9B39FA212B411CF3F
      FF1CEDD97380551A91878789A64F9F413E98B7F9E4BC47E8A6E0023C3994FC79
      A8CBCA0298134C922C89A526FC7CFDB83117F38030D66051235206853C6FB3D2
      8C4179030D17E00632DCB448E29BB1867C25CF3D8B92C6BC574792138D8065E6
      DAE9FBEFBFB7A71A47E863A94F9FDE8D05768E3879F674A3A85FBF7ED490FAF6
      ED0BC03EA05EE236A251213BA391C5CE87D4D0623E7485F824F5EAD5CB0ED338
      BA2A8B6D56F6A6DEBD997A21EE450C5A5A5AD218D1CE71B1D8D9BF2CFFEE3BF6
      B12C0629364BAD00ED6DCF5BC567E6ACC7D4B06C038BEBC5E8FAE1C77A0B7BF7
      B659C97CFE269DE3FC4BF98CD9243500AED7E1820A8073FADCB93398D471443C
      8260797D09D7948B2B9C450CC6B7BA8A0B38E62704F83895060F1EEA502DC17C
      4347C62971058B2DA23AB155BC131B8187470E5C9E014F9F3E45E7CE9DE56C23
      BA02302FE662A3129CFDF3E7CFD1BE7D7802637F48515A5A8A6FAC2FD00B4B5E
      A07E417F340276B842396D580483F20BF2318725CCA15C9FB2B1D8DA8B172FD0
      8A3756D080E03FC84F576113386D1DC00A2FC2BA8F9E9C3F9D2ACDCD1E8CA24A
      3787E116572D9ECF39784A42B227A4077A4A170764C704B81B352429E6DB850D
      B276AE530494E2F23AFAE1B7E3975EFA9582580216474413BBD3103C46588EDA
      1F60E3904386BC731A594770EC13D3F82F5B8D414FD406777DF5F5D73FAC6A54
      60CC98DBB80BE79E997B6434DCC43B0A0414A73D1057822E830A407C8514222E
      02715C06502BD2242DBE4DE585C4187C393105DF2A7A4BB275C903EF5B6681F7
      8F02F0687A6854E2822E83EE0DEF3E6084C9CDD367F20BB7AB6FFD47A828AC52
      ABB5F7266676D5579EFC956A8B8F515A87DEEEB8295A0C702DE4D71D54564BAD
      D98ABB21CC96A672BC28747777A3A0B03876CFD8371E9706AE7C42BFE5B5B1D2
      35EF842BEBDBFBB6FF54E519DB95DC83DA50E9A9ED9490DEC94DEF4BCFEA0C1E
      ABD0056548A11443D7F8A7B2CA34ABF0C2C91736FEF061B5C6A725E97DA3E9D4
      A58DE41BE767183C728A312422BE46AAA3946BC4C5B50093B8107C7AB346AB79
      C7AF95C9E819E04E593DFAE14DAF89764FFD868ABE3A62912CD2CB032C9649AC
      7B35C4AE107A5EADAC3B8D31E612FF70BD9C9ED586AA4EFF41DBFBBE45B4FE12
      250687AB2D2A79DC8AC7A491A0ABF2B7007EE331294726DA9998161FD03A2D41
      2ADE7198F60FDE4BBE855A0A77F7A683F9E7C8FBBE044D6844C472B546CA03F8
      CDC29A2B6C04309ED1CD2449EB7EFE4C71C5FE97FFA83B39318F5A7886904652
      D1DE4B6728E299969430299C3AF7BFD3BDF790BB42FC834256BE3D5FBD1D3B88
      6F0E9B5F4508D9EB73A570B252EBE067541FB7F40DF62EC4EBF7424D0DC5BC28
      935BA41A234D377CA3E74E06535BD2B8A5D3D9937FC95B7FFDA6D25C53BE103D
      CBD3F7CE93EB04907DE300B6E7E95BB57AB6452DCFF1E8122B853E9C27A90C32
      1E7AE805B06D211D3D693526D2BA6750AD1C4BBBB6ADA93AB67F63B1D95C3317
      186F6307358849B882130AE1CCCFBF3443AE4B78A9AFA4C6E4411B1F67402430
      F8934C78C282B2E6DDB83F5B43599DD38D8346CC086991D4E179B55A75F18D39
      D26CB8C8A09E33670E35FCDBBD71EEDD61D1713E6AACA866AD2BC6E050456A8D
      1696EB30489448AD8B20736531D23A52593157405B42112D3A6B23E2530D87F6
      6FCF46D3FB5493C03BD7CE8D32797A76F0F10F956AAB8F624A848CC3D7611287
      271A691913C77946483495159F27BD9B1749986321E95AD0DEED3FD75CCE3FF3
      FE3D73AC9F37F2315B8F43C9369ADC7EEC7DD3BDA6D20B2B3071BC1AD6B99307
      6631A830A341A3AA260FDF365459A9A1D2C2E31410730B1DD9FF5BDDF6F59F9F
      A8ADB5A4C2CF558D80F16886FD6E7CED315ADFB15BBFB65EDEC5524DD9364CD4
      3060AA853B79FAA75355C9197C366724B7807E545C584307F7FC5C7BF0CFFD87
      8B4BEA7A3CF89C7C918D63108EE147AC1C29499EC8048142D6FF4ECFEDDDB1AD
      46EF9E496A6D20E9DC02A9B2BC1ABE3D4E1E01EDA9B0504D65A5326D5DFF4DCD
      AE9D7FFEF6F8F2BA5BA73D8FF933C08071B80280C20944EE76F240ECF9FE7774
      EEC2C5A2FD7FEDFCA9CEDD6F10062FB564F48CC3F721784CAC8B219D7B3CFDF0
      C98BE6DFFF38FCFD030B6B1F3B7391F85697CB0A1C872B006E02200B3866F208
      0FA2A019F7D04B1DBB740B088908947498D15072E14F3A9377C472F0C0A9CAEF
      3759977CB996B6A05C39A80CC43153016A46FD30150203885D1183B80D283333
      916E7A75B654B27FE310EBCE9F3A5ADF9CAFAE7E6AB2F44B883F0D82BC132813
      C4BA5C863B615E9BB3BED984D011603DFB5E0706EF48376608A5B64FA2CF6B2D
      F4C7FE23B4ECE54F683B64B5201EAD5423C615437518382A57922BF0D3CF3EC9
      7E92A0783D417EE4A199BC03515623B6D8E0F1F93244E34062AFB01AC9AB0FB0
      567AFE85673F7C70CA43777229C795B771D3FA6F1F9A365DCACECA516567E5AA
      72733A21B6A5399FD591D336C2F36315E7F1701A71B620A4A5AD5BB7246EDABC
      6109CAD6382CE6BDB095274E9C404BA617CF8739CFA4C89C634E3B137FC78B2B
      C1C21F5433DF0598190CF4DBF14AD45BDBC7520A8F6385584749739C1DCFB593
      53F5D424308B0F1E3CC89183F85D1F2F2FE10C0ABFE2FD6A125FB50E3D25E102
      CC8A5C904951708E9393939DB38E345E7138D24AC2059899CD812A7C25665DA6
      DC969E1C35A226811B16E652CCC387259C7410BF306CCA5A567001565CC102F6
      2983715A891988F3CEA4C89C799C76016686A2C8B75FCE7985AFC4FCDAAD4B6B
      1F5669929A056E582B1A96E6B7BECA4E58C647CBB1422EC02C646526C5159C66
      E5A662C5BF5C8E759CC905D859E0EC8A86A0ACC7BC5FF7E5E38DA49ABAB5F163
      960BB900F39EB9006BF0DABC1C37A4C7C60DA679AF7C494ACCAF909532CEBA2E
      C0CE82A424DB15A514E298E9EB6D7934B043147DB3FD94439DF98E8C3DD12430
      2BF263318E995897637E24A61C768FE400C7A5ACB88DF514720166572882C3FC
      518892B1C77C49F30E38CB311397E19879CEE402EC2C688D57EF5C402145C640
      9C566225CD7A9C56C81918BAB2C48B0DF5CBE09B5245C535E6378EBCFA8912B3
      D4A9DAA990B7DD99020D6922744DCFC1AF5391B9DE3E8FA742BC3E75F27FEE05
      06392CC67BB969603021C2136B49E25EDA888C1BC8DD4ECCE30E93EFA715AA86
      71D5905F7DF8F5A3D8319BDE767EC477F565A5E654BF7C33A29BBFEAF41A96E7
      DE85D12B27AE81D8D98DD415D00E7DFB34925D2DA311B003B4670B4CB13E73B5
      388DF45C809D416BE5280C2BE344814DF0F3AF2B68F7B7CBE9ADCF5F92FA3D3A
      53C72753C89ADB38809D41E5BA3C4C0CF71367AD5DCFB6D4AE67266574C9484D
      4E0B8F77D3C977F56D695E397B8636BC3950E6AB79F3DD3B51393E746A7D071C
      7E556D2CA90CE9CC06B096481502F2278D3E14B3A9AD91D12D5BB5D1EAEB12FC
      E5CB9DC35A6BFFD8B0C97A5E2837D8A87EFD306EA4A7356F138356D646A16171
      1C845DD58C6F4C8B319A3F4EC78F63899AA2F364F20D50C5B5EDD0AE534CED3D
      B09CEBB95DB73E9238F915AA961FAA168357D7C5838511AA6400D8397C56BB17
      79D7A0D1100585F7A69D9B7FDB5D5556B4ADFF38E2C1A48B9230EFC6D1A7D716
      5823BA6FFBE508193447A9A4E8089D3EF103F97A95518B56598222A2D2C8D72F
      18AB5FEBC4D8AEB2FC38C524764ED36B28C705D19E1116DBD3C427D05773794D
      56F710E2C1614C4C0CF1CE1479A96CA2E09070D9CBFBACA4D17A605A7C5BDABB
      6D5B798F91F91E8A8E12BB003393C1F98A63B7709E8173EF22A1F7DE12FFE1A1
      7EF46260B077809BA94C3279A7D1CEAD7BA867BF0EA1ACAB09FACA7122450166
      3A91F4D1CB21FDC28DE7BFE52B6FDB0F3F128045ED619D0F9606DCE0E7257F99
      94E68B3B524FDABDEDA8D4BD7F1F016C0859E500665D67629F3388F69D25C103
      37E1C2608202B76A0A697F7EDBA7B8F05092E5E8B6E0BAEF5EF3902197402E81
      8198C1024E33E19C936EE40317D6ECBF18349485200594633D3ECFC2A418ADB9
      B4CCCD6CB1D4B0956C0C9785AA6B60260372FBCBA368BEADF2858A9F9DFC1107
      28F4ED5B41078B4FE496AC5F652CFB7CA97E2BF85C9779A78C83AC2DB0B5BC47
      16701BC0A00CC4F77BB8EC28026AD144E2D95BEC8A27BC1EDCF06970F1A523DD
      FE7AFF057DC16B73683264ACCF65D938C6038BC41967603D726CAD0FE2401083
      46228E03B504B5F6F0A0E4B51F87E69FDEED7DF0E5275547E74E96A682CFF230
      C45E201DC8C56ACEA061203E24B6985DC0E05C2016CA2DE2E3556D7FFAD077D3
      1F3F786E5FBE40BDF3D1FB6828F8F1A02850308847E08D80D97C35846C3583B3
      928F564B01DDBBEA5B3E3ED5ADCB738F1A862C9BAF9DF9CC0CE951E8858378A7
      0CC8BE676BF9FCB0712AC8446050E9F6DB749A7B466B3DEEB8DDE8D92E536F6A
      9BAEF56A9BA6F55D3E5B95FED162EDCD0BA652FB49B7512C4AF880F8A898D800
      761F83B2B56C1CE341C535305305162B6810B3321F05930179260661E234F359
      8775B91C9787DA758441AFE96450A3B6A12114EFA521EF6AF2A500679734AB7B
      5DC0B97D5318B0E84AE0D705CCA87F077E4567C322BE9A46036809C81118B4B4
      F61279E221D4A61FF632DF77F57DE6CB9C5048A5241AC600ED075E793F5DE898
      DEB9EDEB184CA1DADA3A7CE7448495E78879D06BE496262D06686F28FF7843F7
      2CAA305AF056FD3299657C3BA6C2B34D0D2F9F5283E18144972F54A04D462312
      134376CBDD617925CA52236080C64270ACC7802C3C6DADA47C7C7E84BC6851AC
      759810AAC6CF34686BA8A60CBFAD508E470F2A21A5981807B816E0755CB16D92
      FAEDD2CEED5AD54824E92F5D3E8F2784F5024E59A41ABCBE97A8AEC6CA59414E
      A0ECEB3A66DAF7C74907F59703F4FA0BE885F1D8162B8A8780C2283C2096C240
      E13E0914E4168F4576080FF5246A00EA38814D594C5AC9888FA734E4E5EF49DA
      8B95F4EBD6238EBD72A26BFF4CD2E0820E0F8E567CCB963A4059A7298BC197C8
      E465A48BF9E764801683D11A7E939890C64EB5742550A1C31B676A35503D27BE
      6534F96963E48D3FEDB640762300B7231681E56171BE8AA511905D1282069B26
      5D51239759AA650D9F047D8B73E60328E3527BEC558B41CF4276554142753BF6
      E1376D2F3F733ABD1A6919A5D85DDC8C72AC625EDFC5DA483B9F792E3B05BF51
      6005D5C057B51FBCF4AEBAE8D9D36D2B19045ADA66888F9649D9299787AA6B60
      26EF5DD36D8E369201179E4CAAB86989C7E57E2F6A47421575407CD26744DA99
      98AF038F77C0E51907D9FAC00CDE335BA7EFBF443B89C1E71D4CACC0115C0848
      947CA1EAD9047183CF0D15EF80CB360277010680B1CF22ED10061FFBA9D7811B
      5ED6EEE8F298A62FF8DCB83B9337784C0CCE96B3718C05B62D7086F7C687C40A
      06B08D1D1ED0C4C1157307BCA4FDB0F7B3DA0939FFD1B44FB8511DA531128333
      A017F414ABB99C02CC781011718289050AB81E12DE815BC61875047630B9FF52
      ED827E2F681F08CD50F906A749DE49291ACF9E7DB5BE03066BBCD332D4ACCFE5
      D94014750D0CCE0256E01DB0DFD812262ED89098CF3AACCBE5B8BC401489998F
      3EF221E61E0F179C7FB8C117041F3DF9C4D3B7F19EB06262CDF0797316FC4348
      5B717C45C006DA806D2C7CF189251BEBDF97C978C744B8D7C35B076CF1FA014D
      25A76D3C4CBC0217797EE78AEB13DA58B1D94F81AA7F5E2138EC254E58590D85
      90E6E92688F0A0E4598E1A11A60A838759F40047C211842B949C951300159022
      867528C046E1C9098C868433E01161B608C8B6639B215C5C2117607E49CDED24
      8E91830DC896A2C52F3EA79469329E30F67E173E572BCACEE938A75BD71EC40B
      A2C226988900CBF048C6A68C74C70E595897A52375680F6AD791DAB76B2F2813
      7166463BA1E7E6E64E1B36AEA3CD9BB6CE75B198A5325C00589B9D00B4A5657A
      71C9621637A2F16327DA7842D796E4AD72BA388D438797799E09FB50EC00B048
      739907EE9F420307DC48F74F7C80EE9F3089268CBB9F18948F90FD8CD3273094
      8D8BC57CE80C823DD82DC68E58134C2EFCC88C4768E1934F525464345464C286
      A5B6083A2263DFB800331A5B80124219451163CB01C46566CC9C490B162CA028
      B11A28B4C1179862C31A3672718515C20BE7CFD3EFBFFF4EABBFFE8A5E79F565
      ACD4F5188DB9F71E1A7E3B5F50B642B3B02AC989BC13D829E7814CB2F8E79C42
      0D2C8602A6440955C4D056F41AC558598AE6CF9D4F919191907139444EC10518
      626001D609D456F5C1732AA424673F3E9BE6CD9907707C55AF30EDB18B2BF8E4
      315F81E11D71BE399A2B4023854BF8E43AEBB95A0C44F633CC464006C159D939
      3D6FCE5CBBA5BC7B2BCEB7ABB22B30AEFDE0C0200AF40FA4D4B4542823E084B2
      495C7CC4A891025B8046B0A55628700028EB09A96DE302CC0056B65528010A31
      8AA024D2E07391B98FB3A591AC2A0842B08516E2FAE0026C15571B2B0108C6B0
      9AE2770698F7F81C8A402D607F4283C500873ECA35FCB4DC05D8D7979F0E08FD
      26378181E2094D9332664A92E8E938696BE8753AEDD70B9F7EA2BFE0FCC30DC0
      BF734060E4AE89880AF7C30E22C06C054A07E580FA8086824682B8199B82783C
      68046808A837281B94066A895951A1888D2049B8E2D9E79E7E179F19D65FB390
      5C6FC017461FE115F26DC229F85A855F565F2F964BB945CF3F4DFC1A5A58AC48
      6AAAAB6D6322C1C079B7725D40CC558DAB1ECE3EEA0072D88A3464E083812063
      515A1F5192372EC062A005EED2652F62DB388CBB6F82A85E8083105BE033AED8
      3DD2603A820BB0904173227A08DBB801459047400106B211CCB3E5911065446C
      4B4120820B30265BE0A2265AB67CA91036B7B9F79EFB0005296361AF08B00079
      A7207AE99EBD7ACCC9CDE9C48B2BA3804CED32DB13F7BC0EC237BA191999F8AC
      368332D2336C204083FD429F63C6E425A5B7FEB699F0C9FF5C178B59C8BDF4CB
      AF2EE364231296021068088043DA71C923ED5CA0417B8C6A805E7A3C4ED2B87B
      C7D358D07D63C6611E723F5240C5D1332C801814F038A13C2A62493DB48BC542
      91E55C083ADCD89C3A7D8AE6CF9F47AFBDF21A5C20601023400788D0E23422CE
      2352820B300C4110C8A24C9E1D94951DE52016F0828114E741A2002BDAC90558
      F41E0C8D4279A760E913F3EC6A4463C7DF874947EE848525F9D3440A0C0AA460
      2CD31D84D8DF3F804B397439E1522BCC35D5424158EA04CA8A4C6807C8E46EC2
      FB107747ECE6EE8E194F4661B0C9E4414DD60A1C18E59DCE834FE7334EF3C487
      CE521C992DE2929CAA273527957A8C4504F0E34F5E94868FAE376CDCC0221712
      169B602DBE91E62F0EDDED312FC2CED01E26CF662C1696C8141E1E41B366CCA2
      050B17B8007386551884D3E2F8911079BBF5C88AA0125BFB86156C550EE011E1
      3473FA4CBB0497F9D297E8E9854FD3D4C953E9F6E1B751F7AEDDB0165922F9FB
      E2651740B99C431909975AC11628E0A89DB03C8CA6630148FC720F4490C05C1B
      00D2280C3CDEDA0991537001560A31288FB2582F3C341C1F014E4752A0620748
      8ABA833C92A20CF660ABAA60D8830BB0B737DFE4DB254E913F06304ED96693E8
      481D32018CEFA1BF7E71E9F3FFFD5E3A363646939D93E5D7A2457C44587818BE
      E90B48C7E2EA395E5E5E7D3C3C4C4351B546E2D3D089F8E6740ABE8C1D8FFC08
      7C7A3B04F2DEF8343F1B57615A784458CBD6AD1342BDBC3C452F2D3A5387FD44
      5EF8D99ED1989FE2CD3CE5D53BA7AF44CEB315B66CD97216BA9F0A5720A104E3
      679F7DF690C160086150F619DCA4C89A8CF9E4E1D53EE66E61246DC55CFA1F7E
      583372E4C86F9C80E7AB887E4A7E6BFD795DAF365E58990B4F5FD510AB6C07C5
      3B119729E02D200E0CCAB118F359EAF019821F766093A2248B98CCD9943AF5BB
      D9EF57A957F81FA5E78787A0D356E167D8AAB0ECE86F50E0C77084752D12F1EE
      F4A85886C2030D9237BED6BA78E182F8116B7F3F18044D0E4EC0B56EDAD4084D
      6EEB085AFBEB01BA70518FF7D210B325A131AC2BA89674E41F1C83DF2BACC5CC
      532D56D65293B77F389D2B28A1244C42C7F9117A387C116383B7B915D5545256
      4D41815E141B194EF1D121D4222E9ADA67A450878EA9940D4A4B8CA7ACCC64CA
      EE904EED5213B1F0723CB54B4BA0849870FCD6AC1B706C41711B72197114DD62
      84CEDB808FC8AA69FE5D1914151A4091217EE4EDA1C3AFFC0593AFA71B05FA7A
      5248800F1645F4272F771DF9E2B792037C4C58BB3014537B54FCD9CC892FF0A7
      01A23D9809BF1F4185B0D84D6DF3270B3058A44D9B3651C78E1D69DBB66DCC22
      FEFD1BD465F153DCFCAB54A8DFD4AD5B372153364E1627C75178FC088DB73B79
      A98BE9EE1E5178CBA8C2D4600D3E9F8BC7377A0611F3AF138460AD4C3F3F3FE2
      1FDA494848A0A8A838E059D18EC84D595C43A493C9A4B3D2C5C2123A78240F03
      44090B976AB0030905396B8B39C355CD8AD182D5C28D11DE32A0218A090F6691
      202757D48261C584710BE59794D0B98BC5A815A86E5595F4CB4F3FE2593DDCA3
      D2507A46061DD8BF976AF0FCC8C3CB1B2B2E06D1D93367A867AF5E1416E8030C
      5B7002AEC6E40154262DDADACA2A3A535064BB8F506B28B36327EC045FB6A066
      ABB1886C6ABB5CEC08BF3441D819703C03424475ABA9B320670B2A5BC45B9C3C
      E48C3A223FD484F649F8A03235813A80B2DBA7506E6612E5B64BA14EEDDA8838
      B74312E5809F9DDE9AB2D25A53C7B456E4833E9091980095DD8A28371BD77022
      69E0631C43E199125A7FB482F6E157C8E36343C9534F141F19485E4699DC711E
      827C0C14EA6F2293AA16E704036EFCBA4CAB18ACB7A7011CA3820013F233F51B
      108ED9E1D4BB433CF9FB78D01F216134F3A323247FBD937CD6DC43DE75E7C4AF
      771D3D8AD5FC70CBC535827BEC53A74E89112A573765F111608A805DE44DA09D
      C74BA70EEB28A5C50752B89F9EA6DED281E45A33050E6949DD532370D575C4A0
      C44DD46534ABA2DAF1E3849C9C5CCAC9CD255E3C875B388168DF68B47D477C53
      FBC3CA518B676BDF7972F1284FFEA99919AFFE4C54769E3E9CD197F61F3A8693
      2AE1B4A184840344240226FAF39017350E8FE0AC98B90A7785050A116F44C554
      F75E4C969F5E1F44A137BEAF6F1F63E27509DF99D291B45813A4BAA2927EFE15
      D5ADAE16FA6A5897497F6175BF1A7C72E0E1E34781589CF7C29933D4AD473FB4
      1DF1F4DB960D6B468E1C39429860F9692AA97A3DB7DAFAF34377A404BEFAFEDC
      497D4CFB8F9EC1627D62BFF80EA72BAA9E2D2DA9254AC9CCC14E1070E74468AF
      3DFDF0F39805C594CEAFE32C16087090628B8DF5E769BCDDFEE9ACDE6589F1E1
      D433B70D75CF49A61EB9E934A04B5BEADB2583FA75CBA4BE9D33A82FC7C8F7E9
      DC967AE4A452EFDC34501BF2C6EF730244049B19222936DEEBD6AD7B115D93B8
      5BE7EE89B9DC7B70DC14F1A5CD7CEEF798F041E6EEF9F3E72F629E33F18E506B
      9B7C356184E2D590017ACEA71959225FAC797E2BEAA568B1158B85E46F366C2D
      AB1C3A7428EF6BFCA939E344A1F8798377BA76ED3A242727A7774E4EA7DEB9B9
      9D7A77EAA450E7DE9D3A230D5E6EA75CC8727B77CCCEEE9D9595D51BD3B37B67
      6767F58E8E8E36BDFBEEBB5F8A5AE1046C3A78AA44EB6B2AA7C3795850925468
      36D93BDC64E25A72524467CF433C71C389DFD615920EA9B13CD35A147002BE31
      94FCA2563EF0F62E9F1159C1D426D488D512F1E21555E8AFBD7B4423CE574964
      54349D3B7B069D691DE9F1D59697A72715151651621B2C9A88A659719F1D7868
      3885C47CB370C9DDA91E26232DFA681D8DEC104CDDD34200682153870C61911A
      47A0371A292C34109F7258D1BCF01169A836229C4C1EEEE8B5EB3D8BE31B0ED0
      B8CFFFB3F08E1477DC06585178F40D59F4D6967C3A700EBF0F825E2125A1257A
      E3569492D4825AC585534A620B4A4D6A89F520632921369CDA24C4A0730DC007
      56687385097C8168FD3E1D36B97FA6D52A49C5E55574B9C24CA5A0BED98934FB
      E38374A9DC82AF5788BC3DDD49AB560932E8B46472C3DAA6300B2F93F1AA93E5
      26D14BDB7171A5D6567CF2F1F4F776E0F444B6BCB7CFA0ACE4285AF9C9068A8F
      F3A7B80023962996F0F9F81EB15E16FF982F17C40853CCC7E26693AB195EAAE0
      06BE2D8B1C04A7ECDE8A8FB0BE27CA2CF2681B372210ED714A94893E7AB833DD
      D13516CDA5018F1A23496F30525474149EBB4561B25700EEAE3C290C4F0BC3C2
      C229283808EF4CE044B41B172F5E3C8AEAE63CDAD4529D45A22A747DF9672FD1
      CF9BF788BD4B129F205183D0DEE0D80597F09C0437E6A287E66EDFC6CC69DBD2
      96C0D65E2B902200C333BCF2A706BEF4723710B711F8108AB6EDD882CE53466D
      93A855426B3A7E0283C26AB3B83BF5F2F5C50F005FA4CCF61D18C441F52660B0
      27E32BFA3A903B7E23CB172EF1F5F5C0BD7300DD3870203E0C1E4443860CA236
      89ADE986FEFD6830D23D7B76A7CCB6A9D4A7570F0AF0F112275641AE0746B351
      2B6BC80C77787B7952747800C5E0DB98B888608A8F0AA556B191A86A91D4129D
      6B8B98086A198D41233AD0D8C8600C2043C5384F67D02BB8387625A9C18FB9A0
      0E9B31CF40EBC6D5C90D2320152E10195F04151277A0FC7B59ACCE1D29BBA9AC
      AC4C0CB479ACC135C5626FE459A7DEC76A0D2AB89E4C461D6A9EED64715BCBCA
      E7F142800781A74F9F163BC38D0D3EA0D2E2EBE38B029877C4D38B1950A17A60
      AD0E63061D79A3E2D756C9545C5A2E6A810A239F98B89658444BA2782C4BA314
      E455A7DCBD7C49C6E8C782BBCDF2CA6A32EA3110B72BD403636AA31B7ED9CF13
      63DE03C72FD2BADFAA1D2D1B4FFBE063E0AAC7E5D0D6A06553AA9952ED30ECC1
      72142C67AA07C66AC0D5B5B25C6DAE9378251E3F6F13E3E1F7846A68C78EADB8
      00041C86AEADE9C4C963F8B51E33B97B98C8073DF5A54B17F0422B0BD593216D
      E4042CED38FCEE0FAFB9DDD96EC4D47E516EBEDE684870251179E01DD340F8D6
      56804F5A62EB1622039B71BA25ACCE9A823A4E6853D4DC1E0B597D75BB78FF65
      BAFCD8A24F27B728EF9516845F63080005524C4410C5C784E07E24945A70158B
      0A431A550D55303E025FB6A24AC68222715B81E7CF029437EC3A8E150A5FBD7A
      F5629C751FB68C994AC3ADE499A710D71A4E7343C431E7F7ECD9B363CA94294F
      70DE99D02811DFACC11162E9ECEB894D006C683058FF86FFE33D1089238826A2
      6822E234A26B0BF517487DB964DC4FEC8A8D8DDD8ADB81AD5839F10F889241D7
      141A01E339CFB49E3D7BFAE2B38DE098989860FC9C953F9AC5A9D784DA84B2AA
      4D9B3617860D1B262336C7C5C59971AF2CE3F1CD71E8363202BCAB0BB87C7BE0
      B7D1CD186DCA9E9E9EA7F0C4EA14168E94316E2801420FD0F505F4023FB1B5C9
      C9C96CE52674399BE0632C608007F744DF5D1F2AD6E1C4CA9F05DDBB7797F175
      60251A9D114C00AB0471639C879847F4886C2173E8CC8476B73CF272E62DD3B7
      213E9879F3236BD3074F1D03A904B2058D4633026EB0E079045B9B072E8FEA99
      38CDC055E08D003942BB9B1F1ED0EE96E9B3336F9ED13B73E8C3DD93FB8F9F9F
      D07D544574F6D0C90E25F4B2BFF7EFDF5FC6AF25F2A1FFEC1010719A8199B638
      F19B4C46B4BB7179704AB7438AD03F2323E3726262225B6B453D3E8BEE3E0F55
      2F0F27EE3494AC2006E6B4B8A3429E5AF5196B48EE3F612AACFC3936FBE68361
      E97D4F062474CAF78A4A37B31CC34FF52303060CE06504659C30994F1EBB242C
      2C4C46A3CF800AF1038A4744216CDAF4BDEFD5169D6F2F8A6A3F704C7072B7CE
      012D32634CE149F374BED1AC4FBC4CD2C1DCDC5CCE3015A1CCC506C43C9631ED
      814C84D8AC9BF343D3FB3E2932F60DD6565F435A2FD6A378D48202F898335590
      3F044A6840CC6319EB9C872C1E841F01EEFE996F5C870DBED129BEC6D0502F72
      F79F4892B10632D6A3A948F0993F8CF810C8006A1898C732D6615D2E43B1216D
      3ABA05B6DCAAF60C33C34A544BF556149C0912C088FF0DFF7AE09F7AE0861B6E
      F81FAB4EF2F58247E2A8A2A9F95E9A2DBE227853FDD855F5D268B4E89B6FBE91
      B0F32643236034957FDB4B33E8B7DF7EDB2C68537BFAB797165E31FEDB4BB31F
      FEEDA5F992FFB797E6BAF02FFDEFF5C0F5769857E3912B76985703D09C0E5F9A
      4D81FF5D2F8E8750CD41DAF9DC7136E88DAFAA176FD44BDBF144C4A00D7BE3AB
      E9C545E16BDCFC6FEEC5AFEA7ED8E6AF6BEBC5AFEA7E18C0D773AF8D62AEA1E1
      FD304B711F786DF7DA7F7B3FCCA844D7DE8BFFEDFD3080717F7DEDF7DA7F773F
      0CDCEBBBD70E4EBAF2FD3080AFEF5EFB2AEE87F9BE390F3B380CE2FB69BEAF46
      D225308F65ACC3BA5CC645E1DFCCB57960FA8169F977E7DF5F31E4DC1D6549AB
      C3BF69AAF415DBE3A60A306F7BED4EF90BFFDFDCBEF3DE6654EBDDB93761B60B
      491B376E54BDFFFEFBB7E25DD228BC57EA565B5BAB73D168227372DC19FAA1CD
      5FA42EAFA4FEFB1229EEF3E4AF2A2A2A5EC1DF0F8ABA8641F13B358BF0E67C3F
      D6615A89478EFCA44A913719DF6C1E3DDE52872735D63ABAE0534223B2B33DB7
      6CD9F20E5EEF3F881F5F7F8F0B49D3A64DFB018F7525001FC3A3307730FD401E
      202D4802A99E3FFA74DBF39EA5528D5C2BE74B459A2DA6BD744A85376555560A
      29F3A076652D295E13439295E8D899FDF479EF0D92849721350F3FFCF04A4C83
      62172402A851B879DF90B45F924F6B2BE54AAAB55460828E99A4EA3AD2E12D9A
      B19AC800D28124BC430DBEE443DB6E3826A9F184703E1E3D6EC713C12820F215
      7419715E6565E569F8FB3C96F839B7F2D2DBA9C7FCF235B2B9123F8909D01A0B
      1900EA8E7D18B1A6ADA11A4B3AD612A92C44EE957A3AFBE1E5B91A802881DDC0
      33EFCEE023C01A85C9B1EE74AD3AA7023F918997B4559A6A3AE87D9AAC2A2C2F
      582D915FB189C2AB43F02A933D47A45369681B1D479E4BDA4854BD3AFCD9B2F5
      DB553DBE7BBD3E47D4674787F1A7FD2F91BE52C2ACBC36F472D6872FB37CC68C
      19E371F2F8BCB80C580430AA1C4E01AB354F81DA4052D7CAFC721AD4B4BAB32B
      8A01C5E02881D415424D7525BEF25693AA0EB8988ED694AA03186F6C8F35A5D0
      14CFBDD49D922A12F0C65145C1586DB1291DFC0EAAD68CDF63D25CCD85A100BC
      D57BB5F0A992E79831F0F6C1CC6926BCC455AFC5CBBD28CEFC13620CF48D6B15
      0C69DCB871B7395DD279D7623983B0A50CBA79F3E6A4828282FFA0BDF890F9CD
      364238ACAA51A3467D8D972C85AC78ECD831BFF7DE7B6F002E1851DF99C7043D
      335B8A4668E51D77DCB10A3374443511758E151A12DA9077B3B3B3C37BF5EAF5
      17CB5E7CF1C55E67CF9E9D078BDEE5FCDF1157AF463A63C68CD1A03E77C74B2C
      61ED9A356B5A151717AB61D1FB8D949B6138AA9BB31CE3B4FB30C03603B80093
      945276ECD81103790FE53091BEF68036B53F5ABCBA471F7DF402E2B269D3A66D
      032FF4DA911A9400D0DBA035001B07E0B006E2FFEFB3EA6B3161D72FBFC80FF6
      EA35E7AE3163E6BCF6C1077395B26FCE9FF7E563492D6E1D9AD2A6D37B3BF77C
      C77C893757437F6DD8207B1D3B86359D3033A7A29C28399DC27272A473478FCA
      C56F2C31071DDDA4B668DC6B8EBAC77E9DFDFACAE1CD5E200D7736351E733A43
      82D0805791F5C2092AC5A21894994BB4EF0F32AD7B1D3D761166421AA834A673
      79E4DB9F795C752F7DF8830FC6EB4E9D201FA998D4178E92D7C5D354F1D76F64
      283C42EA8ACB9899A6A6E35EF1256BF30A5F63A3343C9EC8C9C9D90F527AE950
      083C405A10BB8A2F22A9C5F0E13BB6BCF34EBBD67FFD493EC5A7495D8CF579F1
      9BD372AD856A25372AF288B1BC22F9D5BCBBF18757508ED49839FAC6D0A143D7
      E3351B77A4DC4B735BC0A00CC8C4E0987286352B52524E1F3F7A2ADC74681769
      AB0B311BD582392C32556B7DE4CDA1E9C70E68B4E13BF7EE9D05E05A0D7A629D
      BD458B26DB1FF7D217D14B57212BE3D296394643231DFCEACB71BE1BBF257DD5
      2592CD004577CF5337B53505524EDE1FB179C64855885EE779BEC65CE97C49B3
      A54DF6D200A6235FAF1EE7F3E93BE4538AA1555D15E66D69A844F62337BA8C8E
      D34C869AD3EA8198CD171A1D3173D4A1630F3803F36163FDE8BA3A066A48A637
      97924FD541525B312D1E9394CE9A5AD1C596E9E49D7798C20A7662224D1D79D5
      5DA0763ADFE128FB800043828348E3D0457BCA0C673A1DD746CEAFF1C4EC320D
      9DB286D091765DE5E009135F3ED06BA0F5987BABDAEA6A9D7CBED2933EBF58B6
      92CB09304E80B8972E41CC3E45E41ADA3EB548FA3D2AF3D87E6D4CE1962E0376
      268C18F90A464FD4AE4F9F577777EEBBF94060DA89B7FCE2E99982A237B8A484
      C6465EB870E1CB9CF9A7E43260E1AE85FBAD7F0ACA188CA5E0FCDB4BFFDB4B2B
      75E10A31EAF5FFA5BDF4159CF2CF445273C5CF9D3BD7ACAC61199E99D390E75C
      F821089F015D6F7818C62C5276E2DCD033E830A07E0205E71D8275E500B09BA1
      F13168114804E7F698199FF0E65A09867CDAB08CB365DCC03BE75D745158C860
      1DEBB9C89071E609BD861643E7BAC2C3F6524A6CCFDAA26F6DD1756DD350EA5D
      502A4804E793779839FDBA8F9B84782688C3E137DE7BAC2BE1CFD905D0590F56
      2C880739AF797AB9BFB0EA8BE7F6C25D7BA107369E0488AD6DB3E59CADEE3E89
      6C30E8060514699760E7F334747F08662E5E36AD00F1B30075F85A0586120E23
      21814C200E3C3788E32609E0058A60ECDD0BA26094331646A58A94680F920C8C
      488426C71742D270236330D480E7D80BF628DD73E7BC4CBBBC12F125D0DF8593
      843F8BC5CA6E41AA3E384E1E403781CDC0758827E050AB11FF5D180D85D5986C
      BB0AE5B7239D05124125B6D8002817119306F17228F2194792C8F9A40846FDE6
      75244D9870772BCAE720ED080E60E640F83BC720375020480476934834DEC432
      4BAD56EDE4D89954CE99066915AC769C40D45D475572E673198D56CD32172C3E
      6C9639533132DEA0701C81CAC90D8E1AC37C804793FDAFBACA5C8CA4C308A45D
      AA1BE799EEC3E63FA0D750F812E22E209700FE3A226257B10BDEFC7ECD2B9743
      435F01EBDFF0BFCF03065F1F99E9BF71648EBAA980317075D165079FF38AEC6A
      632EEF72B55C6DC1EBD2BB1E0B9BDAD1FF98C5FFEF002B6E50E2A60EF15FDE35
      7BC07121D84BCAF6B821DFCEBEFAC819804195BC237D3D27B2E195A7805EBD59
      D7A8C9D65E6391BF57FFFF3FA8B35F1B5AEB2CFBFB63FD57A3390F083F628930
      1EFDBCDA9CD295F8753575E98FCE7E7C77431D3533B0ECCFEF03FA0DA27E7DFB
      53D72EDD8997B26A48EDDB75A0AC8E59A06C6A852F0B939352B03247089D3C75
      7C9C416FFCF4F0E12385C0725400C7A010AF7EC4F78C787E06B92D60402D3EAE
      E4189F10DA570895B118C956CACECE119FD96288CBCAFBB1004CAB8F3FFE94EF
      63385F3F28C4E7E2C4A0BB76ED22AC07210091104ABCDA1418E2A3EBD49414C2
      7B25F12D2F0B79A50DBC7FE2E421000BD772A651D78489B75834209DD2D3D2C4
      4A48A9A929844FC3A96356366583D8F22AACAAF6CA6BCB08BF53462F2D7F918E
      9DB019FAF66292C7CC928219D8E10ACEF021EFDCC92353E4F025262FE5C3CB75
      5460B5825F3EC15A00B79C263D3E69E69D16E6E7D3F6DF77109B18121A46F985
      1769D41D5944EF6F3D8FFB077C010C0C25F0279E6969A9C456A660DD26B6D0D7
      D78F18947530A5071F0763A909AC2C151A16425DBB76A564B886F92C277D5F6A
      997803BDB2981E5709867DC316EE848F77EDDC855FF3ABA282C2425AF58A9146
      4DD826340A913761892ABCDCA298D8784A4E4EC1E26799848F5428583B0BAB72
      44528B16F83171A2392EAEC06917D6BA19DD012403D48D468DFF15E93A10D1AF
      9F468AB8A9CDA8B1ABF0CAB706ABCA240BB10B30D786AACA6AAAC21A21BF7C12
      01D0B544E60D449A041A75FF9F386FD5447835214A621E8088953CD7190BEE2C
      AA3F176C1760232CE535DA56BD62B7B4FA4BA144E62D5869E4380E3514799BF5
      D81BD21CEA5013654E90A489A337562CA50B7A691E9F54C2252D4FC0D304AD56
      633BFC7B570068BF5076D9E0C7255DF29CD1C463AB83BDF85AD9FC1DAD7C7B05
      1DD6AA5A69C07504AE6EADBA2CA5952BEEA5512306D2B1435F3B64574AC4C5F8
      508D6E117DFCEE0ACAD3A8EE7FF27EEB6117E0EAAA2A0A0FB891CA332A68E5BB
      D3013E00E0DF525C8B4E984431D486ADF2B5C5D6225BCC79C99D3E7E6DA8007D
      7C9275190B5C80F9FB73A3C140D919F7D31E2C6FB0F2DD070438594B69E51B53
      58BF49E2A5692E5916D0E353670950566260152798F8A3DF1DB89A7CBCBDB1CC
      012C6FCB96CFA0512387B098BA0E39819A218B34D7204EF8F8F8E26D4F2DBDF9
      36CE0B33ECC4A00C6ECB62D729C949626930835E47596D27528B4E2FD2CA77BE
      10727CB086AF8BEBD00A9AB1B682190B37E02D4EAD59C81A6E1854CFCC0ABC55
      E42B6FEF9EBDA2FAB0450C141636882AD22BE8DCAE99545454487BF7ED85D508
      684B780604FF3C9801D594319C892DE6576C82C7EBAA2425B7A124589D9C9444
      6161A1A4D3AAA943FA041A32FA32719B806F23B1A4446B501B2C8B904835E62A
      51B6E1862DB6284C0DBE4B57D2CE315EC139B226939723DD44826FDCB9BAD4F1
      056298F5E8F4373C3C3D6E6F42F1AA59C5978B3F7E6AE1B36351A00C248C6570
      3D32FEA05850122803D41E9403EA0CEA0EEA01EA05EA09E234F3B2914E014513
      162E0169408C27DA697A62E1DC0F51878783F98F834EA7FFE8D1198FDB96DB66
      D0B98F2DF8C7A00C30EF89C7D9C0DB549CF99FA0FF316076B68BC14B972E75C9
      5F6D66D2A4FBA12ACE1BE2FAD65A64783369D2248EAE81708DA2F9C06348FEFA
      D351EE1FBA8241B1B68215EFA871893B5091F8AFB962ECD8B180AB0F6A4E76E9
      D6694EB72E3D38291680C36B7BA7182B8CB7CFA4CCCC7ACAC8C0DAA68230624A
      B79104F76AB0B8C6FA0DEB68DDDAF573AFC21512E65CA985FFF00C138B37480E
      92244CF452A92157A12985A38569B68DC616D56FAFB7568C1E3DBA1E04293588
      9A7685E282764E6E68E882B6C4ED310F24B923E617E08A2B1A59CC3B62250C6B
      D05BF059772670D1CBB0DC99B88CB22204A7991A00CBB474E94BCCBF661A31E2
      4E9732EC0A19AE20AE1598508043B31D1E1F62DBB67CC6314EE6B132280523CB
      FFA7BDEF00AFA268BF7FEFBDE99D50D33BA124745420F4AE8028A280D2AB4855
      EAA7204D1015EC2828365410150B0AB68808A2200882581008BD07484842FAFD
      9F33F7EEE6B68410E2EFF9BEE7EF7DE6CCFBCECC3B67676767776677E7EE6848
      4E4EC6A090604F92A40E2807EFD6AA9883466219B7171616A8BE6EC8B23D88B0
      7C7E86BBAB15038FCB35D549D2EEF98131EA33C56C7234D0AB82119856C93831
      675D9482233BA06B4D884D0E1F7B29C2C6316DB5B0304F15025DAA78D5E92026
      BF1A2A4C0E64528E553147F063898B91E9D35DE730F9D25BDC6A2488B17ABC98
      204D3528819AB5C5AD561DF1084D128F3022598C9E7EC82DD2352940162D7A5C
      E6CD9BAFC226F87366CFFD8F7468DF590D3C7A34AE2EC46D8DAAC9AD0DAB2ADC
      D6A8AA746F100CBD0A241128DD9203A10781D0A2B33AFCFD03B1628F99679EB0
      2AF47AC69709B09D4A7106128BBBBBE7FAC79F58706B6550E2206FD079DCDC8C
      6ED1B151553D3D3D221099083406D8437785EC030C021E003832BC1F72207007
      D005604FDD08B2B69F9F6F28A437C05A80F85F72E52D32EDB446ADED5F55289F
      0137034C87506E39FC313C78AC931C04CAE38C30D236300BFA2D80E6AA40B904
      4C03D40B3E1F28045B7A20F4A052C034DA21599E81D713B075B5AC8160487C9D
      08776E507280D25C2412584A220F7A3640C7784A0DDA6B3AEE156B422D2DE38B
      D4EA403810013013419D4D88F5C912D30EC9AAC4B950B8310D0DADE128485562
      33942CA03C4E95C46A780C32017074E42B325A6359921AD0594296340A3A413D
      0C7A352008D0767712F4754069CEA49520BB340B6B3C375204DDB68E9F423816
      B80DD00E2A54E5146F105426548774AC63963802F1AC671E6D5FE89A6333A5BD
      56B70D9060069847D53174C9A6570EB8DBD81440CF048C001DC3944411BD8A96
      98671B77997BC192C6828CB2DC258E164B5BE7AE1BA16B7B479242842921843A
      25C10DAA8F3E9556C711B062FD3AB66344EB8E1B23394BAAC9EBAE6355129DB2
      74A5C2EDB8744A4B0AFE2E6151E8F36068609860981D2EEBD70F119410D7746A
      CF0261E601F0E8064032EC0A4CA30D4CEC1CEB98693C1EE148A154C43466224B
      4759166883BC768E71E4A88E580D505DDCE0A8D8EBF358425E47345C5FEEEBB1
      E681D1ECB94BAC064A428BAF902411338E84570C1459F100A427A0A543BD3EC7
      8C2CDD8A55AB56C9FEFDFBE5D2A54B64780E1E3B47D619F78A76046D91746DC7
      4A57C6090909121313231C3C5BB39DB24A4DBC08652A900F70CF204A772C854A
      7520655C3378094024C0F6C9EAF187EE015CD369C413F03925DCAF1914906B11
      C0CE321BF20A4009A1BE43164C05D0F24275ED5815ACCB10242702F5014A8679
      D5631DB3CA78E56A8AB408808EC423A1305EC37884C90561713462044F4D5EF8
      2919663C2D2899B93B02DC3084309D718E608184A5A511419DA04E6819A893B8
      884A39C063B38BBBA8D9DA1269718EB225222E03570056D11129E5674B5C8A89
      5DF44584782049CCBC13107E0ED0DC22283CE810E573AC0AEE5118CC03013A12
      B39E59A7898860DD53328C60F99C46CCF6CC339261926A320034410025E3A196
      CF91C0B1C48C2B353777A7D4C47224B01DAFB0B19B00FD1500FF31845F0EA795
      8EF5675BC7B6A4A4E1816455D9B563269406126F406257E05A4EB56366B89621
      D38BE1F1AC8B858CB02212B254677BA6956A6493E00F9D790823F4FB00EE3E84
      728BE0BF03EC072AEC48CCA6C57A4F044B85DA31F229A79594A4BC2E53923C00
      A9156AC7C8F75FE2B86B4E4559F9DAAB1F20B20F501EF7E1F06123EE72342CED
      CCEBD3EF9EFE78EE56EC686F17C6271E65CD7BAB5D16A034624570F4E851B522
      33035F7EB9513D02EBDAF556D52F46444460D90E3608A6AA138DD71215A0C7A3
      4A592A6AD5AA25DF7FFF1DBE35ED83D520BC65CB96EF84A42CAD4D26271E379B
      4497EAAA556F88ED0F8F66E4D55797CBE8D1636DA3495C641B51263149860E1D
      A1767DCD9A7754BEFBEE1B8C2A31AA381561F10A2CA2C477221E3D6664532D19
      7FEB124E1AE006DCDCDCC5DF3F4027659A66C73CCB5F7E659716A6E42E502AC0
      80E7FE4E15804742D627D1B469337CA238511193D4A18E775AF3EACD5757AC09
      AB962E79864D486EED7E9B64666682BE74171010201B367E2E573233E48F3FFF
      A4E14094FC5D28C5AA2A6C49332E5F44BCC8A449E3F178DCEE78A8785B2F124D
      0EDF3C956EDDBA4B5252B2BCFFC1FBABC025207F5B11C3589514523C3CBD8527
      07C17079C0D5C76362E264D0C021F2D6AA3756218F4E2C972F5D942FBFFA5A5A
      B74EC193C39A68BBDF0B9F15F39925EB14C6FC271CCE46CB5EF06DA5C1A8D7A4
      AC58F112DE44B4A099827EF08E1C3D26FC9CB6BFBFBFE0BFBB128D0FAE0704F8
      E39970A05A1083F17CB5C915BBAA60C191E02A5584925FD0F7F6F296F4F48B58
      2DB7A4D5E9C46C01DCD4F469D3E4FDF7D7C88205F370128C94316346CAA891C3
      65D4A8E13272E430193E7C888C62DCE891088F900913C7CBE40727AAE361FB07
      7C9DF8E2C58B58752751F0274B54414369D6B889346D8285E21A37558FD73997
      22262A5AAD35161A1A2258254922A222B1824C4DBCB4C547F8F1E978B1F9E9C4
      DC1ADE1FE024F0C32CF41009C0AEE23BB28277A912101880E523824014238975
      EB493C3E181E13138BD562A2D4B7EAB9A12AC135C43A4986F446AD55BCBCF18B
      CFC7F4EAD91BEB987ECC84EB46427CA21C38F8A7E4E6E5729880F739A068D030
      F91C8EFCC85AD89DDA097550A2044C19C1171EE213B0C888053131D112179B00
      C403B1128D6AE17D0B111E1E816B87518E1C499313274E8E3974F0D011BDBDA0
      61BF242263800ABB8282C295AFAD7CFD7E1094340F04E8B8211F28A14043A01B
      7037304444C6026300661C0D3900E808240081803BA01F33E82E1D0D68E88354
      7FA03A100AD40242801A00C7685E9026800582F83F702EB7F4C69BAF7F806DF7
      01CAE33E1C327868F97BE9C18386C8F32F3C2B9B376F929E688683060E76DA08
      CFD637DF7AC36501B4766C978937EAF7F4BF1BCB113F201D3A74910BE7CF4ADF
      7BFA4AFF7BFA61D58210342D833A39C2C2C2B47CDC73B316A0E441A2D4317AEC
      88E63F6CFB5E66CF9A239BFFC891473E3C2EDBD372E5B1F98FC9EAF7DEC68A10
      9E8A14ED5ECF03C589C729E2ECD973DFCD99BD40566D3E2DFBAF04C9D81EC9B2
      FBA2BFBCF5DD31ACC1BB50163FB148B86605AB01849A73E2B1AB8A11A3864E6B
      D2A499FB173B4FC8D1ABFE32A377A204F9794AFB7A552575BF4176FC751E5303
      DBC9197C8A9F33FA3456C802C0CED96DE9ECD9338BDBA4B4764F3D58205D1AD5
      528B09E41714CBE1D359E2E766909F4F88B469DD565E7FFD15F5D657631A396A
      58534DD7A41D31A69B1D3C7EFCA42484F8C99F69E9B2E5D713F2D14F87E5A678
      7FFCE13A0BCB1B18D505BD6D9B76AAB7D648207782FC3E481E4408115D6182C9
      DD6D55B5E06AD2B3EF3079FA6B2C7411E52328B054F516F9F6408E3CD8B9863C
      B568A674EBD2553AA2B5E0C30EF2F1271F4966C625D9F7DB6F241CF8CA8AD754
      2FAD88498AD8552B96AF948143EEC5B2506DA45A621BF960D7253991F6B744C4
      24C8D09BDC65EBB7EBE552FA25494B3BA44A141F1787993749580FAB0B0EE851
      59F5F62AD008C9DFD6AA42913276EEA3F32575D3577278C76732AB778C746951
      4FA6760F931797CC97E47AC9C2458A02AB04895F80BF8C9F3059868F182D1E1E
      5EB8BC26A20BBB9F148ADD8D1A7109938BD67FF6394E88F6B2E489A765FACCA9
      78A2950E22933CB5F1308604036435C66FFD70926CC7B4AA5BBBDE260F4E992C
      CB5E58C6ECF2CC334B3105B08DD2E96925964387D3E4C89123E89503B0E6CA5E
      B4D905D2A3470F1C7DB38C1B375EF06D00E9D5F30E7977CD6AB9BD472F351989
      04418141E2EDE583C5472E485E5E49ABD389B5063FF6FEB1C2A1EB8C19D3E4C9
      279F943DBFFC2A8F2F7C5CEEBAEB4E59B7EE0329CC2F90A54B97C8DCF98FE263
      02C53264E8601981DE9BEFB40B0A5C10A7A7A76398545FDAB56B271C00B6C0D2
      279C5ED93AA58DB46AD9529A376F2E756AD796C8F04835090C8B194A54347AED
      5A21AA430D43CFCD3DD060A2D2B469E339090989F84840819AF0C985744C6EEE
      D8456F0CB93C3092F7122F4F2FA9125C4DAD8C56AD6A35544515090A2282D0B3
      FB8BB78F3F4650EEE8F38EC92FBB76CFD70EDECB9F7CBA6E4CDFBBFA6160B786
      DBBA6ED449AC2FBFFFF99B607AEB066436AA1263C6D8393793692477A76E9D24
      4C03C6427B75EA613C5C57477C7CBCB007AF8D3DAB9D90809E3A0E4DCCD28347
      4646E3526A544B0C1E3B7A7C4C5ADA912306B02B8793E4867BE9FCFCC2956FBE
      F1161B73C95154EC22DC103B50769C0D11D70DB81B1822FFFFF4D2931F1A3F0F
      BB3B0BA8B0C3207DFE334B5F984D02ADB9519FB5F4A9E7282B8C07A74C60C19C
      881521EF9FF1111DDC127099A4921B459EF2B6B7600CAB0CF05052E1F367A8BA
      B32DB18A640682243FFDF4931EA714175E9B366DD46C10C7A4528969D8A2450B
      759A52273838C7A724A8DA8105B18B40C08998252590265BB76EA528136DDBB6
      C5A5559DC076766E762104B87512B3DE5AB76E8D18410FE1A1E4F5784EC45F7F
      FB95B077E006BEFFFE7B3BAE59B366E9E1FBEFBF1FF72AA1822FADA9FB3F3DC1
      AA18AD5217DD3A77E7271A715131A8F533DBB76FAFCBB7DE7A4B3D04898E8E16
      2C678705ADBBAA7C2C84526C3CA712D3E8C2850B6ADCA04DD69F3A75AA4C9C38
      1117F870E9DFBFBFE08B538A82AD86B76F0EE33895E6546212B38E29B5C9736C
      A36BD6AC51AB4C51E2DFB2AA1A28355BC566E33995986924A5D4326925621DF3
      E4D1D2A74F9F2E4B962C919898189ADBC18978E3971BB08C522F55C73B76EC50
      C67DFBF6D5775F45583D7C7C47C5E31B7C6A686B8D56C289F8D66EB76171A72A
      EA2108AB82569C6388954ED4C618E669FFD8638F293BDEB8AF5BB74E264F9ECC
      241D4EC4DC7D7CB54B1DBC9D3B77EA868E4AB76EDDF8A17B898D8D551B704C77
      22B635B8E9A69B9C4E0ED62F374EE0FB86929A9A8ADE3AC8369BD25D12331353
      B53AA6EE888E1D3BAA2BDA8001031C9354D825B14A81C70568B911822D83A5D5
      2492CB744EC43C1865E62867A241B39B3079EC7C93D1F48816AE883CF0D7C1E1
      9F7FB6F1B5D2F2722F78342260500FB809680F7404BA009D8176227233501BE0
      FD35EFB799CF80F03FEBF42D3CFEE4C203D95959F1D89C19B03A033EF2842989
      FC46158435D256180C46C3C6798F3ED6C33692BA1B3D223323237EEEA30B0CB8
      C0EB1B637C59602BC164F1EEAE6C746224B2A486CB972F412D9FE3301696CC07
      61EFF4CB26B76E9F5476087B56A6815E625BC37DFBF6959989B64949C965DAB8
      2C7112FE59E10AFC6785069297C5ECB2C4BFFDA6EE32EDF26DDDF6831C493B88
      478D982C8E89E2EEEE6EB8756393B633D3032E4B5C32533759783FF2E6DB6F4A
      FB766D71CD9D2EE3274E93711367C884F15325222C02A3F834D3FDE346B7D419
      AD8A4E6CBB6B2C31EB79CB96CDF2E2B2E765CA83D364DB5F5765C917A7E5956D
      D9B27C6B962CFDF28CEC3E962F0FCF9C8527DE995BA64C9DDCD8CAA9844E6CDB
      2A2CF598249F7EBE5EA63E3443D6FE7846FECA0E94215DEAC9B43BEACAF43B13
      A567AB38D977096B726E3D2ED3A7FEC778F2D4A9EF15A3D5335AA52E58F2BD7B
      F7C9BA8F3E90562D52E4DB5FCFC8C9ABDE32B66BB44456F3166F77A3980C2689
      ABE92FED936BCAD16C5FF9E5607A7EEB9414B78993C74FD488F4B3ECE159338A
      E6CC9E6F4C4FBFA086B0931F9A80DD9C2D733F3A2EBD5A254AA39840AC13E926
      2614A5A858E4E2953C49DD7B5ED24E9E97006F930C6915240B1F9F2FEFADFE50
      71EAAD42DB124B2C62C02893FF07338A5F6015A916E02EB905853031E323A946
      C92F34CBB94BD992141520A70EED928BA6DA7865848554DD3DF4B3D0046BE55A
      B769F5289E9C18F8C71D3392BF49FD4A3AB4EB203B0EE74815AC0DE9ED812A30
      6171DABC2239753147B0DE32FE41E4217F1F3C28578D0145B7447B18B76CDD5C
      B06FEFFE052474A3678599E35F9698C4F8B2301E6E1C93604F0F39702C1D2655
      C407E4FEDE58E8331F0BD4FABB89191BBA906390D89A26C3850BE7F342C3C22C
      237558DB12A3F1F35F12B83E82B971A326B205E3E33B7ADF27CBBF3B2F5105C5
      387026D4BF59AEA25A0A8B4C92893F087AD74894DB9B57333EB97066666080FF
      B7E0544E2356158EC594D50D3953385E5BFBFEFB7260EF4FD2B3611359FF6B86
      78165E96EE2DEB4A46AE597EF865BFE47B5593014DDCE4EBCFD79AE362E27CD3
      D20E4F69DFB1CD2B9B52BF3F6D2409C065C1D6CF99374B8847E73E2C44D5AA41
      F2C5979FCBBEEF3F94076F8DC49AA5D564C3CF2765D7E10C898E0A91073AD692
      95CB9614D74DAC6B2816B38F7F40806F70D5AA7B06DCDBAF912A298835C73DF0
      45C0DF0ABF3AF51293EB27D55B5CA36A8DFCE0AAD5DCF17F5EDFF8F8789F95AF
      AF4C3B70E04F8F2B19D90B43426BBE7847EFDEF2CB9E3DD2B17DA7E295AFBD62
      7424061FDA9A085B0BD3B8214AD3B80963067AFBF8F43E71FC440ACE52EFC8C8
      882F70A0DF5FBC68C9EB18333F66309A678E193D46FCFC02E4A9254F28129295
      07AC36821B229887128D53B0A66CEF413EBE5E2B10C9B87B58224169E6216216
      506187D2CF7FF1F9E5468D40112350A9B7BBE05313F42915FEC4CB3E8ED8B175
      3516465DAA784A8EDF54001EC310CAD1363A3A5A1C7F5A89553C336B9976EEDC
      A9C729C585C73B5712BB48B22F3149091AF27198EDED2D4F77DB306D08CD9EBA
      2DEC4A4C23969A06BCD5A22C0BA5DD8A318F7E1419D08829B99B04EF95895C8F
      30F974F755599E9A2ECF7F791EF282CC5BB94536ED3A22AE7E7625DEBC659374
      C27361126FDBB64DD99FCF2C94CF775DC2BAB1617257373C2D8CA9217E78E378
      21335B7E3B745A36EF3A24A9BBD6887B9187B2D73CBB127768D7493D4E24714A
      4A8AD48CAC2B1FEFCA90013D5BC9C4FE2DA5169E50FFB16FB7EC3970544E6462
      156C6F9171FD5A4AA33A11F2C7E550697EEF92062E8949C8F7A694ECA59F7F7F
      BB0CEC71B3DC54B7BA9C3B735C6A86C54AFD9B3B4868540CFE857B029FDBCE11
      5361B6F46E57577A77E6305A96974A4C521EC0BFCF99F01AB3AAF46A87BFC098
      8AA5C03D500497160F7777F47D5874D90B9F7BAD11249161211252D55FDA358B
      9584A8EAB7A0D443496E57152AC26889DA73E89CB46E1A2FE9E7D94BFB495854
      6D3CA2C11FA6786530E05951719E1C3B7F45DEF8EC67F960E31609F62A9626F5
      A305BFBE805858A801A9DF7E031F5DA9C12027CE6549424475D9F4DB79114F7F
      7C22D742CA317846FA7969DFB299F4EC70B33C704F5BB9A941BCE464E7486448
      30F337A36747DCA963677557CFEAC8C1D36B6F6F4F310684497A668E9CBE9C27
      59570BE572569EE4659C56A73C09681B8E8F016FDFF33BAA483532C5AE341A10
      343A8DB5A429DDDC8C72118401578F4A80BB979CBA524BCEE0217F4161915C3D
      5F202DF3F3E5EAD53CBCFDF5579F4EA88D658C4F65E791E6223D3B624668A81E
      E883972C67A455FD08A91B17297F1F4A930DFB2F4B9E784A4EAEBF4C7DF547F1
      3614C9EC41370BEFBD7FD8F53BDA5F02B3AB8B8C13314BCBD4A8AA26D9F66B9A
      34AB1BC6A024C4C5C880A08B326FED9F98D7EE265730A32D3B275FB88724F6A9
      1E2D3FEE3B4EDBF7E9391133929836BC9B0C99FF897CB5E3A078C22AAA66A06C
      FE71B79CCB34495EC155C9BE9A8F92E7E33FD41751FFF97221D32C69C7CF6FDF
      F9EE943704C71F5920AC2E3C3CDCAA59C494FE2932E7F56FB1683556BB6E1826
      ABB75F94F3B99E92575888B7E60538584639986E960327F3E5DB6D7BE5D09E2D
      EC857C90BBD0004FC68E1B351F27C523D41D71EAA251B27DE2D583FF86387523
      6A55C1D8C3032D245F8E9D4E977D7F1D97D3278EC999DFBE5A7DF0D7AD8F23FF
      59401D4548DDB1F9792284D34C782B1B0B3D19681797326253933EF3AE341FF0
      5471F3014BCC4DFA2D2EAC7FEBCCD37EF19D5E437A1FA02D100F5405FC806B3A
      232CB8B100C89A400C9008D405EA0194D162F92C1B097999C3DB3FC4DC88335F
      AE6D407E77A0C01074C00CA91C2395529127DE46ACD050AB6AB6C4846760DC8C
      C1E255E31BFDEEDCFF003690E3A6582D5E0586007B4472D762781A0A065F3977
      7CE7104CCBDF84BD78CF9658F8E3A32F769AEC7D79B2108CA744CBA10A148BA7
      E1B0F81BD788FA47A1D738F0D592E0D00F70A57AAEBF98CFEF7222767CE6A336
      002A565E7151319ABE515805467C28DC60BC8A703C467A6C403CC6DEB02CF481
      17C810648963C934A8581E055C4619673419F1101A5CB86B2A3654C127CC71BA
      17EE17C9FB04253D2AB9395FA35A32F6211F5A3F7C5BA70870B1D74A6E54A426
      94121777E87C3262C41F110B255AB09E89E41737003108F35E967D7BFF0655F1
      DBF04EB92C31EB921B20504690B29478DA0262F8D8756EC84BCCC638C933DE8E
      BF180DC3CAC903E4EB6D11E094BDF0AEB8C1B3735FA77E21B776EBA92EE4DC00
      28416C5036DC103A3E743BAC676C02556236B88BD91084743FB99CE9296C6A08
      C086BE0DBA75B94DB080832236180D200535780D20E1868CE800505348673CD2
      D9FFE9C36C185AB98C56A90B968AAF391509B66B4046551D8A101AAB03CCB483
      8A7C20838362E75C122B52646641288CA8301A5AC85005A0A0CE0369604BA111
      E26C1DB2D8062D3A89A9B9A90C680DD8024BC7AA4105A01A5844D63343A875DC
      48D2DE162C886D58367EB141855589404C328B4E3294165B40B4B5EE51C72613
      D89D6850898AA6C4E3943F4E1620996AC338802447F9F0561D446035E0A6CA84
      5272CF6887D81202ABE6541534E65C429501A5C37EA344C80A424B1EE8A857A6
      33ACA49EC6180B9C882DD1561F2D82DC967CA80610AA9D46241C8CB011EEB425
      807089537625418BA64A019547DC68E4FFFA091C245433D378383940E4B5C352
      4D4880BDAD2BB3C4A85EB40710A2C8282FF2C1070782A8219609610AA4383A27
      627E7BC5D1A822616CDF926D229E7863B75D0E012C16D7F60F1D3C3CECD34F3E
      7FBD2C4B6EB022D0399DAA82292F2F7F89E3AF3ED4CB810FC78CBEFF2E473B97
      C430FABF9B8A8D8DA125A015A0CDB2C9719CC7D76E8C07586D6648DD955662DD
      8053B149C433D256B2EBD28DD022A11701BABB26F1D9B36755499983C404F5A8
      A8280A0D6CCDE52726097797D2B6C49AAEB142160076CEA9C4C3860F6EAA5990
      8023761213919191AAF4D499A6D931CF6B2BDFDCA58529B90B940A30B80FCA4E
      403912F020111A29093528238BB7D39A970751C5E88A3561D5D225CFCA534B17
      AB447AF7F41D40E1129C8ACD8EE14AE6657D2A364AFE2E8C2D53B1491A1A16BA
      0A1198E09C4E81A7DCD3D5061E7964A624374C5671FB7EDDA7A4E645468463F2
      4C1DBC9FBE15738C2C53B1C12520B7CC9826E99407A7CB2FBFEC94575F7F154F
      00A2E4E4F9A34A92A443BB8EF85E5E33B521DA31CE1696A9D8F132F0BE219841
      F6060B6821A611496BE216B7FFC07E0C2AB46ADB425A490BA5339DCA9933A728
      70C3631623BA271580B77CF9CB988A7D0B348B3351C4C7C7CDB970F102763949
      D270A3F8C5866FE4E4B163B26BE71E09C68369FF407F59FFE97A9938FE41F500
      DAD3C353FDA5D10B0F44F88914F6231B367C8E57C8B172E4689AECDEFDEB5CB7
      4766CF34933C32328A427EDABE53FEDCBF1F8F7CF118148F7B8BD171F61F70A7
      AA96679F5FAA6C545D9B31B0C41DBB879787B2E5B72F9C2679B1DEB8DBCC5525
      C00F5FA56B24CD9A34519FB1AB12E0CD68613AED18C0027382E322E191116A2A
      767878988460EE32D334A876CCE6F5C3E61F555C166EB4993120280873DF0231
      992E4BC5339D760C24C4D796D8D892A9D82121A1B80FAC8EF96E794C56705B30
      6F91014DE42584C6DC5DBD9F346DD65076FDFC2B9EAA7ACAA5CB59725B8FAE48
      123C563F2AA74E5A0E9C265582D58B8FC354ECBF31153B374F8D785489B15B63
      3AA049B189C5C4C5C85DFD7A4BB71EDDA5FF7D7D31893C4065653AECA453C7AE
      4017E9D0BEA38E94566DD4D4B44CFC67E1CC99B34B9841BF566086A96AC7DF7E
      97AA0E14EB94BB7FECD8512129D399F64DEA97CCE712F998E4F56DEAA62D7689
      6C1D04227D28F1A8C04C89F0DD9404F431C0FDC06880E77A47C804201070078C
      40E98E241A605505080142815A00F51A908CF7823401FA3507FA7FB3BB7BCDA7
      72F79AA9AE8AA81F3C5789D78CBB7AB5296C9A4A8FD7443E1BF62474DD5D1F71
      EBA59F62C44D320B019A57EF514D423F5EF1CB2469BD5464CB833A79D947D192
      BDC4CFCC6C7ADB8826A1517D9B8456E96DC1E6732275FB3509C5DC9449258618
      52DB06AEA9C73CF4295E369594981986DF112A2B3F3A853D7946D296E8256652
      C51134F4A410C1C35D1EC08A139BEEFE544C77BB2475D9B05353BF3197F61E7A
      E0BD835CE6712C9DD3C1FB69FB8FE6B2DE43DF3BB0BFD9D57B684762BBAD7FF8
      E15AF3C79F7E2C53A7CC940DDB4FC81F97DCC4D3DB172B829AA530375B9A8498
      A56BB308BE742DAE55B356B3A79E7C7AB723A116D64B8C9ED67C23EFA135424D
      EAC437FA1E5A23D4A45E15F7F4EF637E7866C5DF436B849AD44F6977F71B7B0F
      AD116A522766849787BB7818CD72F6522E1EED62677C109B5B28673372D57B68
      A39B1BEE438BF9ADCD22FC87C9545C5CEC347C450EE574E21B7D0FADD86C3C14
      CB12C29B7333DF4377B7BE87BE292E50827CF8BEC32897B3F3A566A0A764E689
      7CFECB5919D3AE9AE03DF479BC877E61E52B6FCEB330D8FB462DD8A6753BF558
      DCF21E3A50761CCA90CDBB0F4A319E05F13DF4BA4DFB6503486DDF435FC9CCE2
      7BE8108DC356EAC41E1E1E86152FBF62A8E87B685B52EA7A5530A0A1CFDD779C
      BFDEF7D0EFBEB3C68E4B3F781A29E5876B3F8AC59BDF81F985577BBFB3FA2DBE
      87C65823E2AF3A756A6BEFA1C3D77DF491F61E5ADF6BE6D560B7152DD22A9981
      A00DC1684A3395DEBDEDDF43A3C46B19AF81869A5E222D3D6F6B59DBAF5749E4
      F569CEC43D5E9B8A7B2E4BFFB57E68D8F5D19558DB13B75E3A558CC649D69ED7
      32B4D46C8B8B77A1172EF71ED81FBCCCCC4975C7740865CFCB5E989C98BE2249
      8138319EFA96C172C3BEC4310F4D452F3C49B49ED796C668DC855EB8DC25B6CD
      6AD1D9E3B2E7252C3195E8B3E7650F7C0394F655E1407423BD354F00073A4BF0
      467B6B9725AE8CDEDAA9C495D55B3B1157566FED541595D55BDB9F79386E95D5
      5B3B11831BEF426FBCB77622AEACDEDAA98E2BABB7766A1595D55B3B1157566F
      ED54153C781A6EA4B7763A781A29E58DF4D6659698E400AB8BA02D8128F54EA0
      5CBD358DFFC5BF35504935F0CAAB2F9BBBF7EC6AEED9ABBB6A7E95448BD98F77
      F632C7C64799A36223CC4F3DFD844ECE86CFD14D2AB6740928064E024F008940
      99EEABD42FCCBBF7EC9696AD5A29BBEF366D52921E89E3A07000380B722CB015
      E0A38209908ECE6C1BB12975930AF6EAD153EAD6ABA7FE338D077E6646BAC17B
      1AB0752F235015E0461E805486909A63589DDAB8764B75FC4B3629A981B46995
      227FFCFE3BFE12BD49D9B1C40DA0F1A1E95148568519B223A039031402425D23
      94FEF63B6F9ACF9DBF806F80B7977A75EB1B5AB769CB7449FDFA1B2569B4095A
      3B11791238001C078602F70006C00C383AC3BD830698B76EDD2226BC8E341A4D
      2ABDA0B040C9C58B17E30E56A49D887C084C035E05BE045200CD919C3AA5C28E
      9FB79B7FC43F01F84FAC4E5DBA48C74E1D151A3468483BF9EAEBAFD5AEED43A8
      3AD01B2802EE0326007424A2B403669F9B97AF582177DCDE5B9E79FA79DD062D
      C47C479FDBD57FA18CC8C12A7087FC11D80190F84DC852DDC60D1B555AA7CE9D
      95D4BCC68D1A1B5ADC728BDD936F2DED5FF96F0DFC8335603917CBD800EF9CE2
      12E2E6C4C444CC69D020794E72C3A4394D9B359EF3D09429733E5AF7D1DCD2B2
      F204292D0D2FB42AFE9CD3501AEB8DDE39B92C7165DC39B924AE8C3B27975551
      19774EEC9A9CAAB932EE9C5C12734B37FA9CD3257165DC39B9AC63F4BE37FC9C
      D365AB68D3FAC69F73BA24AE8C3B279755C183A7A1A2774E2E0F9E464A59D13B
      A76B9698E400AB8CA03D812835743053B9D6734EDA541AB4AD6B84AA045AC085
      74B47761F20F473996E0BFBFC4FF5885A8AA58B0E8DF35B14478369559CF6BD7
      AD9541C387CBCDADDB2850675C999990E874ADB05DFDA87EC37AF2F4B32FC994
      D90BC5DFDB437CBC3CF1E6EC8A3C35EF3F984A5C55F6FFFA3B282C6EFCF87150
      D42183C45C72E5DB78E3C78FD7432CDDC8F1D3253EAC86C44786E1BFA7263979
      E68230EE8D37DF95B756AE84AD59FD17E7BAD6C43A70E0A0D4AF1B2F89B191C2
      332723FBAA787879E1BB4231C2344CE80169311EEBF3DF9EBC93C376ACAECCAA
      E07A7A172F66486656B6EC3F7854F20B0AF1A75537C9CD2F544B63DAAE94347A
      F4682BA545381D3C568586A47A75C503AF8F8F9DBB8C2F2C06AA4F79F80704A2
      D4BEC2B451A346C88811C365F8F06128799185D1EA3B95D81AAFC4AEDD7BA470
      C5737267BFA1E2EBE5A1E2B273F365F19CA93269DC58BCE0E1EC7433AA02AF3B
      8B5859CA44794EC45AAB78F5ADB7A5CF1DBDE5C38F3E165F4F37D9B397B3D845
      1A3568208F3E3C5DFE3E7050962F5FAE48E80D1B368C42871A1FB775581E6CD4
      B8093AE92F3F6D93EE5DBBCAD0410315BA75E92CD1D151F8A2251789B22C1A55
      AE35B11A36BFD986F407D45D31C02645E09F03155D136BCEC33364CE638FCB88
      41F7C9B2652FE9BB762DC5D59A5878346059298DDF0F8B8B8B97E14306AB5DBD
      8135B1E6AA836732BA61CE9A65F9504F9C00D72A9DABF48BE9E7148796A688B5
      403126C669FA2E4DB14A23643EC027125721B556DB0D3A1DFF3742A9C18ED86C
      D6CC459A6A16E594785D6F67A9888B8A0BC56472C3E3807CC9CECAD25B018DB5
      9258245B064F044B4B2193652F2DF1E4601CA188A9109C1748591950C4EEFF4B
      6B62A9124F9B3175155649EB77A35580399C6B162E58DC9F3C8A98A4F3E63CC6
      70A9C04AB83263DAC3A5A63361DE82D92C5C093123893C2C464BE90A6C1565A5
      B367B1CDA74AAC47F02CD0032E946BA5DB64B123B6EFB56CACA072927359E930
      B17376C4469B53DACECA1AB856BAD54C093BE22233CF2A15EFD2BB56BA6DA6EB
      A835DB6CD7D6ED4AAC1601B7C953A3462D9B90C8FCB90BF5F0B9736774DD95E2
      406C5F1567CF9ED6F3BC80AF9B8C1B3B5E0FB3F9E901178A1DB11AEED818D5AC
      156213B22FF1D933251BB533B206EC8839F2B1C62B71FAF42925E92D7BF90519
      3B86033F86D0A95EE340DB11E3426CC9559A7F0D32DB6C76C4B85CABB419DB92
      E5F196FB946EEB69E95ADC23DB1BCB829B776B413B694F8C122DDEDD59BC4C7E
      28BCFD81642EC703E6EB1E2C337F68240B5B3A93DB113FF16B67FC013807A3C9
      1C999ADA905C0AECA20CB10699F2CD4B2AAC791EDE46C9C9CB96FB3744CABBFD
      AF68D14ADA11E717E5E2E32D5CCE3C5772334BAE0C06F7620C004B46EB2A27BC
      42201FDF382DCC73DE3B3BE2FF34FA4E666C6E22B95985B2ECCEBF90ADC4AD78
      75858C1A31AA2402DA848D75A5A8C020CB6F3F228E3F3B62F6B80B5BEF92711B
      E33034752E05D36D09F0350079B1C7DF2E6DED888383ABA97CEFDE9BA1A4A3A7
      A56BF16FF7BFA4A94E55A5883D3CDCD72F5ABCE056DDAA1465F1930B4B49B144
      E39ABDC1A2597D13066F1151E155B181084425028D81564057A00F3008780098
      047056FA40C83B802E404BA0B6AFAF4F28A43740675025C677782BA59726A3D6
      532BE26BF5D2E5E9A1494A683DB5226604515A2FCC33AEB434E6D360DB53DBF7
      200CB90273BA889FBB23451EFEB1998896463B2BEC4A5C6C8D741438DAE29836
      6F5B8A3AFDF30B7365FC86DAF2ECAD07ECB2D91197D50BDBA64DFAAEB6BA50E5
      E6E7C8D51C9CFE385387AEAD21ABEFCBD4C9ED88CBEA856DD396B4B59CEE1337
      D651D794D7061CD7093585B5A3E9952AED4AECD84B6B5B62AB282D8D36AED21C
      884B2E3C356B86308F0EFC8546D7B5DE5B5DA77149E586F544AB62476CDB4BDB
      F6C2CF2F7B4EC68FD55EA322A775FB6C2D846D3EA42A67476CDB4BF39F3FCAC2
      EAD996D8B6F766B26D3E86093B6274748C53387DEAA492F4962D7F51C68EE635
      8821007D23FC12E718468A1DB1632F8C74DD5D6F9A3DB18B2D6BCCAE0E505969
      0EC49AA9B3B4DDE6EC9F9B08BB7EF6D2EC50C77D5E1BA77C81BC33E0B29ED19E
      18C97A8A838207347ACCDCE63BE5911F9BAAAE9FBD343BD4976E3FA4A753B123
      B63D784CB4836D9191B0E0969DF2C01731C2AE5FF5D20EE976C48EBD30F2EBCE
      55DAF35D0EAB74576976C48EBDB0CA65F5CA4AB39AD8F5D48A189DE8357BE96B
      F5D036E4253D7525F4D28D406CDB533B8FC760209D31BD01F06ADFBE3D839507
      7C6836B84B972E9B3A74E8E05F51D6D22EF4EE208CC295CB17B242CE88D2B9A1
      740F61D7DF835CDCB163477F1092CC80FFEC0E41FC5AC44F41B578C056A0B705
      5E03DEE9DCB97352D3A64D69EB8CB66DDBBA75EAD4E92EA0138CD701FF815E0B
      321D199F83DE17FA0EE8138026D00F424E40FC5D28441DED8BC34ECC263489C4
      C4C43EF81CD8EBF8D8F72FF89ED82A7C3A37AC55AB5647535252EAB46CD9D208
      3904F233E071E82FC0CE17F6067C14D8E0446813710BF47DD8406FECFA23A886
      778030E0A8C16008451ADD40E89F014B8127003BC22F43C4674BF3F065EB23DC
      1AD0580347947B11680B7C06AC06228073C0E30047943F434E06DA89481A3018
      E80684A746B9F96C6E50FDFDED5D1B157F97149CF649845BFD6E3EA206473FC0
      603D3016F806F811C8059E45B1B221C700EB80D5006D6742DE060C8EF59004FF
      5A21AFF88684F509B96BB021B4EF90E8C0A0A08F46860445B1B965C1681E300A
      58062C072E2C0D31BDBEF3F65BEA3E17E3F71CC24F03678002E07D60F8EDFE86
      873E689130DE3F3AAE7FF8BDA30CFE89F5A56AAB0E1279CF8804BF6AA1438C30
      A2CB839701E403793B133C03BB26D75955353AB65FB7260D966FA91F5013F19A
      2BDA1F2DF94B52929606D7AEDBBB7AAF7E06AFB0083167650A1E334A605263A9
      DEA4696B8D58CB247BEBF907FAC5277E10D8B465FB8016ED0C55DA74498868D8
      64ED0F4981D5697438C9DB27B071F3D7FDEA35BC3BA8534F833BD6AE30675C12
      43F615316667992FFDF06DC61B9F6D58E744EC1D5CBD755072B38E5ED56B1A8A
      8FFE2DEE3E3E86A0365D6F8A6D7EF3EA5FEAFBD4F06F7CF34ADF86CDFBF9364B
      3198F09957B99C2EC6AC0C315EC9948C1D5B329E5BFDDE23CF1D4F7FDBC452D8
      626A8398D67EA1E1BDE4223E24505428C6BC1C71F3C68271F17563027C7DEEF2
      AC9D9CE21E116B30E464895CCD1263EE55205732F7EEBCB474DDFA479F3B99B9
      0A7C9938F01036EE8D28AFE4CEF111EB83A263238BBDBC0DE2E925463CAC3655
      AD2986B0687CF1E82ABE43744ACC7856AFBA32FC7333E3B7DD97E66EFF63FA4B
      6773D972B045D77FAE34CEAE696A353E3678555070706471601583F8F889C1D3
      1B5F4E0BB210E7E688645C143973DC9C71EEECA5F9A78B663C9B6E7E5770F800
      E59C4AAC62D1BE17D5943663433CDFF2F7F58D30A34A94A1BB075E2F99816258
      98242B3B277DD1F19C598BCE0B775F95D49A5F4C9AE220CDA9D9722CD0D77757
      C3F05A1DBC6A84041A7C51EA802031045553C834795C78F850E6B4A5A7F3F5DD
      B7E55005B18D70D08D8F358D4919D7ACEE2A7F3FDF08181BD0634A6676CE8519
      DFED9EF2D21F2779B2A05E1C729533685CDCA979FB8CB9F71F297EEAA1E2CB73
      C79E9DDC227918F2FA0037EC8C0B7A756C7DF8C999DB27766C31186CBE40A539
      A3B7877B08D8B4FB65A8D7E9D0430850F9BDF47596E37FCCBCB45EDA78A3FB81
      FEEF46292A313FC60EC118475468A875ADAA7047392B34D4D289513A3794AE5C
      432D6CCC69A8C53897B8D1A1964B5246622464FCAF1D6AB180AED015917B81B6
      C067C06AA0DC432DD896EAFC90F218F01E30099800702CF1302EF0B3A0AF0366
      02B50077A01FB016588DA1567BC8329D27520301746EF862273A5B0CB5421116
      0CB5DA898817A039766BFE186AA9742DF21F97DCAADA485A8748F3D070BFDCE9
      F155B68E8D0AB8F2506CD0B61111FE39D3E2827E181CEE973723BECA164D6AF1
      9A9D96EFD9B48CB98ACCD6DB91125683E4BFB509AF6E2BB578C87A8C872CD5CE
      96EF5FFD9FAF81FF0714FA46F8954BF4450000000049454E4400000000}
  end
  object ImageListIconsTango16: TTBXImageList
    Left = 272
    Top = 192
    PngDIB = {
      2D00000089504E470D0A1A0A0000000D4948445200000010000002D008060000
      009984F0FC000047F9494441547801ED7D077815C5D7F7D9DB526E7A2395345A
      A8A1850EA17744417A1741694A1791005104E9455110A90A48B18174908E7404
      028820105A209010203DB9FBFDCEDCBB9B7B5320E8FB7C6F79FEF7D93373E6B4
      39333B333B3B3BBB57EAD9B32759FFB27333332449D2CAB28C48122C8D462370
      BD5EFF67DAF38C46068321513010E882838357C8B2DC1EB838AEDFF8CB6EE5F2
      D504258296006630BE76DDDA889D3BB79D22992A81F614401A93C9F47AC78E1D
      3D3B74E8E0D9B66D5B4F18A3DBB76FD3D5AB57E9CF3FFFA4CB972FD3C58B17E9
      8F3FFEA05E3D7B51ED5A7583482B1FCDCACA726003BAECEC6C39272787121313
      89632672EEC74F1C6754853AB56B0B7CC890A19276A9AEFC91A3871690890669
      CC06B28532BC112EA38CD4B449536AD2B88980C6D18DC96874129924242450DD
      3A75258D46D3952DEA90AB29272797727373851141D4E968EFBE3D82C66986C6
      D14D086E334A84BA45661A220D090F98A118E0CA426D53DB36EDA843FBD7A87D
      BB0E028C4623315D07E30EF60E848A34B135A96FDFBE0F3A77EEEC3367E753CA
      C86112F300828D589064117220E7A1A4D568EE4A68070F3A75EAE4337D473ACD
      7AAF39CB1400782CDCB66664E59868C2A2BDB2D4A54B97FB30E03B7B6F36CD7D
      BF059DBD91622D5728AED54A54CAD7481317EF35711DA012B3B95E08ED8D0C3A
      CD4B01E5271945944832694B952A352A2222C2E5D41D2D35AE1E4A4F52B3702A
      E131FC96F241AE49A68C2C1365E2ACB939EAE9E0D95BB952AB56ADE25184A06F
      4E3BD2F0EEF5E9414A06E5E4CA940D3041C1845A63C5EC1C9918E732E950047F
      777B5AF9F3C94CA975EBD637D19483579E75A29EEDA328091EB0300B16051AB4
      00038CFCBCFB5C067B70332ABA43F0EE9BAE1418E20FF7E177519A56F4D4D474
      4A7C907C556ADEE6F5E5C9019DFA5BF18A854A44C9B9247597864D1BFFD1ADE7
      FE9AC4A42C3E7F41D06E05A8A0D7C899CEF6698F5DECB256AE9FF1E944D00A3D
      34971203E2BD83CA53EB162D92260CEED9F8AB0F06569833A63FF5E9FEA65D49
      FF10DFC434970F864CEE1150A83688D2D0C93316673F4D7C3747D65042AE1BA5
      DB799356A7A71E2DEB52B8BF07CDDF7C9872EF9CA1104312C40B1C53B551D5CA
      6FFD70EC70EADDB90BD5A9E045752B96A684A719F4CBEEC354A54259F27235D2
      9DC7CF68CCBB03A84FB7AED4BA551B010D1B34E21E1BADB3D3E5524089104A4E
      4E2637A712688D29E4206789ACCE5C4B201F271D3D487A4697AFFF4DBE2EE885
      A83DEE623C66B09034E2FDA1F2DC590B2839E509B59FB882692A348E6E443712
      9FD1CDB8332A8D91ADD3FA939D9D1D4D9CF401696BD58E9AD2BC794B4A4F4BA7
      BA651D69FBA93BD4AFDBEBE4E0E48401269B9CED240A0E0CA0C6B5ABD31F97AE
      52EF26A5A87C7010F1B8B0EFB7BD185260920752777737F2F70EA139036BD0CA
      F53F52D99020302501B5238269F5A62DD4A35128BD56AF26391A1D8975A00A3E
      8780E7CF9F938F8F0F05FB95568DD4A9184EA5430269FE9A9F84F21B0D6B0B19
      1EC1A0220E1D8718DF283535955121C086160F77A0915F6DA4CCEC5C1AD03282
      FAB56B21AE154F9F3E15B2CECECE425E18B0B3B3A3C0C040415082AA156AD1FE
      45B544928D73AEE9E9E9226D1D0803E7CE9D230CEFD67454608EA8282662E4E6
      C806DCDDDD455A18608C85F86AE4E6E646EC9EBDBDBDA8288E6FDEBC491874C4
      558AE3FBF7EF8B119AF5443BE8DB7B00A5A5A5D1FDFBF7C8D1D1482E2E2EA2BC
      7CAAB45A2D5DBF769D22CA47D0E54B971097A77B77EF92A797177DBB7695F92C
      70AE7E7E7E54AD5A752A57AE1C797A7A12BBC875C346CA962B4B5CD165C1E3D8
      17B29C3B037B3085882603FEC93155E76C743BFEECD9B37649494929B0A08E07
      703D131E3C461DAC5CB870E10FE0157A68E1B25D6868A85B6464E47D0CB0DDDB
      B66D5BA56EDDBA8479830E868D898989F5CF9E3DFB75A1DA20EABCBCBC6A633E
      F06E7C7C3C1D3C789090B3387D3044AFBFFEBA66DDBA75F4D65B6F9DE26B23E4
      F31F53B5D5AA55FB7ADCB871D4AD5B37AA58B12255A952859E3C79423B77EE14
      69AEE0478F1ED1D0A143A9478F1E84515C40C3860D69EFDEBDD13ABEE2FAFBFB
      8BF1C0D5D5559C3EBE427356DC2EF8943E7EFC98FEFAEB2F716698CE90371E8C
      18716ACE9C3922D7912347324F85C68D1B134F28789AA31281CC9F3FDF3C1E4C
      9C88F1A056AD412D5AB4206EE7E5CB97A7DF7FFF5DB8CA65E6D689B340414141
      54AF5E3D8A8B8BA3962D5B52585898A8A77DFBF6991B12F76D6E38BEBEBEA2AC
      6BD7AE15425C1406AE9BEFBFFF9E9A356B46EC151B671D386336C088321E706E
      5C616C842B14A79856AC582194D9007775EE99ACC3A0AD85223023252585D3A2
      A2B8524B972E4D5F7DF515714F6DD3A60D611E213A19DA86180FB8127FFBED37
      12BD112DAEC078C0B97FF3CD37C2E8FFF4F100ED003335311EDCBB770F13CA82
      E3C1B56BD7884FF1258C071CDFC578802E40DF7EFBADF92C7073E5F1A07AF5C2
      C7037438311E2831CB8ACA41208D1831A23DE27F3C1EFC677EB0E73FF3033420
      4C5A11E250C683FFEFF303BEB4C9356B44F12D80B8678033C53E4E9E3A61EE4C
      756AD7A3BAB5EA529DDA0CF5A84E2D00E322AE47B581D7864CEF5E7D850CE3AC
      C339891189AFC6FB0FEC8317B8070155161810AB23BA611391F2C0959B64B31C
      138401EECEF67C2BC79422C00DB33866B9BBB973A48230C0A9562D5B73F4CAC0
      953885FEC5FC00BAFFEE105367C5C48C99D3DA01DF0268FFC1B8895B111776B4
      839C2AA3C927B16560FF814CDA022136C6B83508E5C16FBF9B0B221B31B70324
      C4815CA5652B96D13B83DEE5B41060440118DDF2CEA0A1B4E4EB2FB590E5B194
      7420724E5B40902C38A67A4E8A8E1A2BBCA5CBBE24C8B2B228221761CB8861EF
      CB1B377D2F437ACB7BC347E1762E814A8797A6A4A4475341238B327BD47EDC98
      0912684219B12842FB859FCF975AB56C23BF336808E60969B29D83BDEC8CFB85
      A5CB96C4582B236755919519D89A750E4C13D0A6655B3A7FE102DDB917CFE958
      284F66243F0803F9899CDEB1FD57F9DC857354B572353A7BFE0C93F8D46E0382
      FB768496433510D266BA1F68F700E2E85DC74491E54B53506049311F387EEA77
      A6B3119B626898AA28CF19D99C187AB5AE486B8E69E8AFEB7FC5EE3BB097BCBD
      7DA8560DB10CA4B40FA1C7BA1A284702B9F74D4C7B3A79FE8A001F0F2348C4A7
      8BCBDD7EEBF65F88672C0DEB36603A1B613AE3E22C9CE55C771F398775031369
      ECDDE86192F9F687255079EC72FB6FD7AD21175737AA5F471889611E83EA8A5E
      A72583D19332D2B2E8DBED1799A7AEC82846B66EDF42D7FEBEC63C158481BB0F
      9F9283D19D9CECB4F4C36F7F32B3F9CD6D13F630A280C5486CC283FB6C3D56A1
      4BA8832E487C0F508E02CA0AA3B058C284513D952C90BA4A8AD4FB558BD106D5
      EB98F1F83065A7FC81E52EF9892157FE094B2AB18E9DE59B64F5D358E1F468BE
      D44F0AEE7E46DFEC60470A1E449AD2A328C3E845CF1DF56E4976FA7E9926CDDF
      CF564BFDC8EAA751F0A4AFA468BBB25D973BD49F4BA6EC04CACDFA1BAC643206
      B526839B03E93DEC28C3DB8E3275DAE54F564AD164F9A9067225BFB9C62653B0
      C0944A5ABB5092347A9273AE61C1EE09E98C1EA475B423BDD140D93E06CACD91
      622CFAA49D32658AA883D4AB73BED40795228DCE83A04DB91927C894718C4CB9
      B7904E0349C20A8F864C12516E724E885364CC5436A27A60D22653EAFDA994FD
      FC1732655D40EE00299E34FA74D21874003D1A999EF4B821CD253BD615A07A90
      7220F63D4398BDBD44D770C77A0345394792CE04D020770B4051927CE8D99987
      4FDCEB4FFC8C2DA81EE424658F4A3B9A42A4CD8681ABC851425D1810DB91D6BE
      04E91C2A91CEB1263D854C4E62FA285666500D044F92573EFF2B6354D2EE47A8
      072D94C3A1D01215F726949B91A48DA0FB3F9E7DF2F8F8F5016566CB2BC9F22B
      D090CEBEAFEF6708342E0FEF8FDB1A1737DC84B5A7ECA75AFA7BD59A9B8FCF9F
      7DA3FEF29C73165D11A91E8814827A5B7BFD347557EDFDF3E73AD09891C9D4AD
      DF77D4A7FF5AEABADCB83ABF32C4A98081F010BFC80FE77D1D3D72F27EEAD26B
      3979B8B7A41B8F7DE87A8A7B4356C80FBAFC041767A3587CD06A2472C439F1F3
      349093FE39CE8A7D7E51912EE041C2C3273727CFFDF1E6D0612369F6ECD9B465
      CB163A73258532A412366517DA080A18B87E64D6CD7D472EAFF6F42B231622F8
      DE3133339D4CF12BD453073DF5285004E66466E5ACFC72435C87FA915E91590E
      5528D3A8594945FC24DCEE4945F00439F9C6F6E85CD9445E616DF7137EAE735C
      FB919EFA9091A2E919996FFB40578FE45B3B43B494FE83C1F42892E0BA3D4962
      CA957AE50BDCF6C87428BA3FAD71BE4101AE18FACFFD607B1AA11C69909E9DC1
      026024E5A6919C9B0A811C7428B44C0727B44A270AB50FA2FABE9DC8DDA134A5
      E5C8791EB0B23DDDDF47A90FDCB2B1A09CF1F411193CC3C894F99C3499E82399
      4F49D63960B990E8E8F95FE850E63DBA77FB3E4953976E9573915B93B0EB54CA
      3985B2D3A0A0D1A0DB62E0C84825C9DE83F4764692D31E53666A026526C5D398
      BF0ED12F5C68A50E0635D290FC3483921FDCC1FA902F3D7F928C4144A23B37AE
      505878657AFEF83AC9E90F2923E51665653CA3E33789C80FA02514117176662A
      9E5E24915F50697A78FF26B9789480F2052A593A92AEDDB8466B779DA6E53B2E
      53AFD937E87466BBF90F3C69003DA758CAA037443B30FAD6451736D1FD1B07C9
      D3BF0C25DCFE93FC4B96A73BF1B768C6A604CA72694D0D6B55A5ABBFAD22DFCA
      FD57A7BC3D4F6D95C2804EEB40F7EE2791E9791639FA3891C9DE9BC8E04CBB4E
      275044DDBED4E3F50E141EE04EEB7ED90F43955565C24F03C0E0E14C5EE5FB92
      43F911584335D2A3E77A3A77E92F2A5D6F08F5EFF12639BB38B158A1200C3087
      9F58D8B985925FA5EE14507712956A3A87AAD46881CAD412F358A63010456046
      6EAECC511E68ECF194271F2D8FAB62BAB4E7692211EC55787F17CC1704BA6D3B
      76D296ADBFBE40E4C52CDDE18D73D57A78B168E1DC7FA5CC26A5516346BC8675
      A1484EBC0CEC1CF417E77CB668B3B59C2E3B27A7F2DCD90BAD6945E2C8AC2298
      B60640104752D2635CD20A9E365E0A63010F0F4F8E0A80DA0E98C30F258F9F38
      F67AE2A38755385D180C1BF1CE14B2FCB09AB5C9C600964569DBCEAD955EA148
      9D6D0CF0BA19265DC23E17492045044A916C0CF0FA193C5055B018ABE2D648D5
      AA55D5A46A80733E7BF68C4D455A0BAA1AF9102B0326AA5CB90AEDD8BD5D1529
      CC83FC468501CE9D7BE3B973678BE581939333F17306CE4918404B148AECC1EE
      7D3B992EA0300FAA5489C4D53B9B8E1E3B2A648401BE781A8D8EE8FF26415482
      FCEE7E36EB53DAB527AF882CA7B333182E4CFD648A4DC391712D64A635B0DB2E
      2EAE3476F407B8C4E5D0BD84FBF4F9E70B48377BE6FC9F20C8808868F8FB433E
      C2D30E9B5ECACA826909EEDD83F2E2059C3A8D4B03C77950AB76CD9806F51A69
      0C06BD5867E725600C8C74FEFC79BA8E9B8DE09060FAFC0BA13CE5F3855FF514
      7590A78ECBB556BB7ECAC7937AC926DBFA5064E0F67E22DA0FE5A988F32EAE9C
      983567462BC4ADB19A7D69F8D0F72B00570FF0BEC4D38EAE23DF1BD3582502B1
      292B1E0DFC306CC87BEE191919F15F7CB97012F8EAA1D7E95F6BDAA499DBBC05
      B37F5389406CEAA059F3A61FBB7BB86B1A47370D3BF7C7D9E4EDDB766E800CCD
      9C3DBD5150C9A0E1F60EF6129E45F8EEDAB97B1AD3196C3CD06834A9B76EDD24
      7B3B3B293333B382E2055CDFCD0BF209F713F08CC6749D1515B0A944EC006871
      E5CA95A3E5CA464803DF1A5C76F59A15D1B3E77E1688D55CBD840BF9F5BF85EE
      F78A32C71207D63067DECC5BE5CA962BD9A47173FA7CF182675E9E5E4E3E3E25
      24AD4E63BA70E1C2AF68481DACE50B18406D5787C0C92E9DBB4A5EDE3EA6EFD6
      AED6B838BBD0ED3BB73340AF0F03A711AB470103CC8117AB2A55ACD4AB52A52A
      9A43870FD09D3B77644C389760F5E25DE65B834D1D280CD4D4EEB3674EF7311A
      9DC8C1604F2E2B56A527F7E9B54CE1BF30FEC1D777CE461F9F676B0D06794D9B
      E6A6B51A8D7CCCDF4FDE5CA2C413F03ECBAFAC9EC61FFCFC267D6F67975BCADE
      FEFD707B7BA3BB83BD49DABD17FA522EEE98A894838373909DDD98EF1D1D7321
      DBDBC6D08FFEFEBDD61B0CA673C1C1D9EBB5DA1DFBBDBD32D64A92CC422B1DC9
      E5745060EE7E6FCF4CF0B69F0E0ACA5A0759E84C62BE808D5E5EF7E2C2C37321
      F02113CE0405A522A71CC61940CF3D11E0FF94F1751ACDF83F4242725987D302
      363A3B679E85654EFC6A34CEBF101A9ABBC1C9298ED30C1B1C1C4E5E42063B9C
      9DBFE0F41FF074A3BB7B16E3E63A3018EE39393A6A51844C3F0F8FE171F7EE3D
      D0BBB8F4610106BDBBFB3B17EFDE7D14E8EDFD0E32CACC359934B81B4B669E00
      94A7D7061797FB1BDDDC9EE30CA423CD8D49F09400B45E1B9C9D0F6D301A93BE
      371AE3911632051A52AF5EBD24AD56B32B37D7D44C51E618B43DA0B5C0631151
      B94C6310DD7958336960AD30694F549834C3EE79DCE4746385B03A752AE399A3
      2F952C59028F907C283E3E21CC3561FDE45A61340572236A86D2FD9337E8BC66
      4813D2C18D799DA2C3DD6B6399471FD11FC5D3D2C387CFE8C103059E0A9AB65C
      7FAA59BB11B5AF17E6817BF945D0D56861C945A7D58CAF12EEA5DBF3A81A4DFD
      780ED5A9538778242E5932181E04C39310C27E1D6ADBAE237DB7ED245573BF43
      E7AF3FD2A3089F99CF02303E523349DCA9B9B9B952CD9A356C8069FC3C3A13AD
      2317EBCA2CCFA0E38081AF8F1C2B70E8C851051571FDBA75449C3FB0F1C09AD9
      A05E5D52A07EDDDAB81AE55AB3555C7860735E2C2CC503F68CAF11756A475938
      B651911EB0CB756BD7C2427D1416E4A308F797B69A9654A10630A0E04A9D2BDC
      369972C5F3D894A7291615DBA8080366658CD274E7EE1DBA71F36F7AF428D156
      D3921275805B534BD21CB1227BF114B93EC27EB5162D5A9B198584457A9092F2
      84121E24A0182655ED9D216F539F9287D43423DC12EDB1776F4CC5500FDD5F69
      2529AA767DF2F2F2C116026F0A2E1982E5506FF18CF9DDA18354650DDAFE85BF
      1FCB30F0A984F6ACC35EACE40EF5C39C1E9B7CE9D4D3084ACF35970C02EA51C7
      2D4EC5DDE4BBB4E3F71B2938C5E813200F6D2A0D84D199B8517747F2A5872C53
      1294DF5FBC8FD6481FB4A27A580D5D01A243AE89064EDF2EEF7CA9052B018D56
      431BCA97742C1D196E0C04FEC384D652332BFE4B513E0BF64E0E1AF271D353E5
      500C8C1A5A3C6B88A4F966B6140BF07C99058D49A6D88B37D353B371DFE8EB61
      20CC217CDD02E9141427017C002F3C3428FBA2D48CDC55872F3E4D4DC9CCA6A0
      28722E15512DD2DB3BE81934BD002F3C34A834D327BFCA43ED7CE4390F3D52E5
      8A35A3A9526473493E9EA5D76DA475ABE66BCE2F9F238D4771BC0BB3C4754060
      F62811218DAD1FFD9A141C5C96AECFDB43D9BFA4D9D79A3820A04DFB9195AA54
      6D3AC5A077B8B5729E66056403AC0D090320607C93536F5FBF9A7E76C47E7A72
      F221B5DDDB99CAD491C8D3358BAA56AD6BDFA5C76487CA91CD7A62C3D7B595F3
      A43530140DC06209B4DF1A23AFC2BC32F0DEE4CBB79E6624E636FD6530D97939
      12E94331499588B2E3B04EB987CA940ED1B7EB30CA3EB27AEB9E1E9E015BB056
      93A07840309299DD9366788E08CCD4E80D84D508A29CEB5881BD0BC0FA49DA3D
      ACA56CA194074BC8DB9DA41A51ED9CD005641D1CC83B9C68F7DD3BF1D8BB8A51
      3F1B0B2F723665676550069682D2D352F080FF89B8AFD0E89C29FEE6A91C92E4
      DF784533CF00B055F334171B34EE5DC1CD88B593B4F394939D49999969E8D618
      CFC177746F8D3D8A4E74E8C0A6D4DCDC9C72050CA0629ABABAF96F69D0E80D87
      E789DF625D999B03967BB0DE6C746F81ED67D9F289633F3ECBC9C9EE80621F28
      600099106AF94899B25135C3C223F4194F8F91C1B11C96C382E9EFBF8EE4FCF9
      E7994454783494AFB26CA106E08527CECFD91A51AF05B8BA3969EEC6C765FFF5
      D7951C536EC616F4D8A1507EC4CA0C851A60068C04E3349D01F0C8F30B72FD18
      8A3798670DE22C4C9BF1F1E7B9393943AD194431D6C9FE48F48FFD643222F3A1
      D7EBBE98307ED2306100CA43623E9A6AE614339C3623760844CD068048005A7F
      E88658C1671C8D8423A4054BE04AD0B96E10A382213CE014832469E88F73E718
      55A17AF5EA74FA74DEFC9AD32A13888D012557D0D543C2185E03730595900FB1
      31908FA726D93325D1A68A87828AD8C680B25E22389680954F9E382152B56AD5
      2A5027050C7019D96D56548A54BB766D618003DC5771A4828D01A6E65756BC52
      62DC1AB2980A050C9C3A794A65E647EA62DAA3185278EA80C204CEBD66541471
      59D96D86E9C33B122B72CCC562396B28E081359373DB72E621B5AFE62306126B
      9E82173070EAE4498527E23A454CEF0413410103356AD6C4EA3586347443F600
      322F3C943A9059EA8D5A01F47A941FBD56D3973AD42841EDABFBA8EE17624CE8
      080FD03517A3AB0E6523F961EAC731041EE6D0E658E1638162B182171A1F5E49
      228742995644E181559A7EFB86BCF45A4AB4A6BD0857EA40C84C9AA07767E55A
      9D368B747102D5002BB72C9B9D2494533E10BA5C8C7DAB3CEFEF5EE17D76F7AA
      806F3FFAD060140CAB4018B056CE4EFA048D269BA2DA8DA6A8B6EF519D963D7D
      EBB7EE1A21516664F3089713900DB4D2270D088E4ACED98F6345774DCF70C073
      C73D94FE64173DBABB9E52534ED8D56DF16685B00A95229A9577F91D3AD51423
      1A28A7B2DBACACD16805DD60E720620EF47A3BCAC9BC4F4F13B7E2D974AA1452
      BE52407439F7AF60C491F99A5D7FEA3D8E6FEE447AE7369CA6DCDC2CBAF1F779
      BA75338EEEDEFD4BD094E059721C79F896277B477DE54665DD0E305D133B3D3B
      79271BD9329DB4C66674EFCE152A5D691485977F5B80BB6F3B6270C5C596D034
      EE5EFF86CA54ED6CA7D51A22D88068071FC3084DD07B10CD4CAAD57E1CD3E9E4
      B62F45AC060E1295AFFD2EA524AC223BFB2CD495796A20A90240502EF7967C2A
      61E4F8969954BF1F26BFA01F5E4991B8A30B31DAD184AA2D864765E538D0F903
      6BA851EFFBE87210C87F4041665A7D8B01C6190E2C277F3B17CDDDF2F53E95CF
      EDFE4C6AD827195712E6E483FC8A0ABBD100BAA73539C9E9CFE2C8A4F378C274
      D19018C90F85198167616EFE354DC989F7587C3E07451A60662150CFB544F8B6
      87B7CEFC14DDE3FAD442F82F261D5AEBFBEEE175FEEF1E5E49BE2F96CCC7EDB0
      D42003AAE7238BE4AB14E1148C34155A5641B10DF4EB3E88D5F6C04863461490
      144489216007BC11A01BA02A2012401603B472DD524E36F96550D66F8CD81880
      721488131B4B064FFFA60DFCF49EA16168B3A4D7DAD3B3AC243A7DFB57AA17DA
      C5C688E80B50222873778CE9D3A8514DAD4F98E669D6034A7FB88B593670E4C6
      06E10D3CD937FE13AA2F3C80720548CDEBD930BAB97D89607A96FC1B3D9371FB
      63CA0299C835278D0E67E7089C030D1A709D90CEC213C583D1AF952B1F69EFED
      8FA79D07C888B9B191D2C82F33997EC4F3E11CCC3A5951016FD740A18C741361
      C04E6FA8EF55B6BAB7C3B333E49F9A42E73446BC5124D15347072A0F293E6A43
      72E9F36754C2AD241DDE719E49A22241C6ED80C9844553DC9DA43DA3A3A79FCB
      BB339345D1584A810A757D0B282B3CAE40795F7C0B79C95A3DB7B814D4C96880
      387D2C045C9E195F83790C8D9966032CB0E5CF5AB91C035AD93091008D15190A
      34675104C810B6136520764003D981B8B0A30678A70B6370110EFC782CFCE882
      6FF467905B010F0A55B22642A94F8FF5AE9FEEBF5471F1D2259AD9483B59F38B
      854329043004D01310B47DBD4EB763BD4EFB3265890562A64EDC909D95F526E3
      C505BDC1B03176F2B42EA212593976CAA7C5D5157298B9880C85014141909191
      8ED0F6907135C2EB641C0AC0A51BBB078DAA908D01956A413E9B35DD82E54563
      468ECB4B002BD2808C8585AE6F76130B92EC85F9D193C0A09677146A80951926
      4E9A4853264FA5508C2B7C61E532F0CA5E9E3A9E0A592718674521C809C0E831
      2369CEAC39141A128ADD30325707A879873AA8F26EF813B8B1F8F1A7CDB4F08B
      853461E278556AF4D8D174EDC6DF846516D06440DE91AF08162647A63C21C6C6
      8D1B439FCD984521C12164FDB3316082EF58D5019F2D20CA778CFF602CCD983E
      93AA46BAAB1CB5088222F4B8A645AA4030E3D3CF5EEC01371271BA6008878D81
      199FCE2CA0CC026A11020202B0A6EC447CD365C22D3A49120D18D89F65E03672
      C622B5F0CD5C4641E7C0B608A0F04AA68C990DC7480AE5E09238859C40E3CAEF
      99EA01F39D9C5C385261D64CF3F957091644827716D4FCB890BBA6D2BB14C6CB
      62DC806D6419D5032CA870BAD8804C85AC30F03F6B3C286C0C183B1AFD02D5CF
      A7D1FCF449782F025104815982F16327084CF44A60FC4E1B2BE20C22C51822AB
      A38001E6B132C3DFE88193A7C4D0AA956B40162EA04B9B80E71D050CB022FA14
      5D87F2E8D1EFE30520B40D39D73C9EA015E2C8D30666638095191465F0C5F1E1
      C489E41FE04FFE7E011488265FA66C3941E7C0B629A3A0EC36E7CC4C05E0BCF0
      80D30267C4023606AEDDB84EA3E0B6856715E5A9E56166B68D81B0903031FE99
      59B6A1508487A8451B868D012E7F484828CD9E31C74648246081F5056E15E433
      603E45FC847FE68CD9AAD8D429B134F8ED41D4AE5D3BAA5AA52A05F807A83C1B
      034CE57180C703BCDB87B160269384D7700015F99286947F3CE0C193C7040F0F
      0F614809244952D0FF82F1003B40D85C5783C1301866D59919F0E21CEED62D31
      12C6F615474B9141A6E699AA20442F5D68E8B4853AD70BA4A583CB6297C7230C
      CCEC9CE062C4E7EB22C0948B4A95A942B970C11067C1D07AA39BC1CBABE2F2D1
      CDE9871377C8097B52ECEDF4F4EBAF3FD3F65F7F1131A7B76D417AEBCF64D06B
      853207C200B64763013A8B1E3DCBC06EE96CA6E3F6D620DE32ECD6A3BB88EDEC
      0DD4BD4737EADABD3B6F7010321C68274D9A247DBCFC8C3DD9EBC6D728174087
      CFDEA049DD2B105B76B0B723073B3BB2C396124C4491B38EF0745480A3A3237D
      FCF1C7AB580E8BF059D88F994DCFD3907B3600A679D96FFDFAF5C4C038BF9EC8
      F8C68D1B6DEAC66C809570517472306155DF7C93C18D85DFE9C463649823518C
      EE70BF6BD7AE22AD04E6D388450792B349CF23668ED9833B098FE1AA96347855
      D7948BCF3B0038CE3599B0509F4B4AEBCCF3C09443F67AD8B518B03368E9D0C1
      DFE8E0FE7D22E6F4D6AD3F119F093B83395F48634775E56907C9404976D8B7EF
      60C079CFCA2243BD793464C959EAD2B9135E496D25004B5FD40DEE77EBDE1577
      339C13AB132A3B27DB6DE080685A32AA35B9E29B06AB6675A3D7DA57A7AB7793
      F04AB28E9C1CED010EE4E4604FCE681F8E38338E0E06527E12058D2E8B57ED8F
      0E18D5DEA34354082DDD1947DBF65FA09B6B07D0AE2D9B841CBF44BB76ED5A2C
      D0A0156254C1F712F038D193B8296BB2AE4FBF4A59996D96CFDA9C3566E93EDA
      F6D3EF746E690F7273D088F73A5999C708AE7D8637DF7C53346B611981A88DAC
      9B334F180C15C779D857997F644D7FBCD7FED2075C50351F127A206A0EBB4A0D
      0637902201AF729C339FC65751C9272B8A60A695EE53F39D0FE7CF1BD284A2CA
      F999492F09B912850143C8B8280A6A3733394B4BF5FBAEA4536BDF22A32E0B4F
      78C4502ACCF090CF5FA1E007D9322E90EA7860089F50860C76DB068CED64983D
      A809B5E9589B6A0C598FEDC62EB47FFFEE628C07501E8836D0B052103E619143
      5D1B96A3D71A47D21B1FEFA47EBD7BD3CBC603EC6CD6DF5CB67C3F0D9EBB9D52
      D09DFB8E5D4F3F6F394D5E6E46B1ADCCCDD9895C9D8CE48C1B716E89DC22AD5B
      A226EBFCC46694451E9999B9949E85321B0C94756424FDF451135AB3664D31C7
      033D3A87464719DC9375C0516DAF361E68D139243D65CB68531603AF361EB007
      92869EA7A35D69600C1E70FF2FD6780059DC3919F086841EDD16EEB33110B9FF
      B76E6D1E0B38E674E1E30184D1F1F1A28796DC8DF63026DA96E8FF4EA8F9978D
      076669D4810E8F49BD9CEDF158105EB051008F015C99DCA57944E68D0DDC2279
      3C005B1CE2BA30A957858C294B8EBEFEF3E9FB253AD509C4A3012F3178F0DBE6
      952A55C2206AA20A152A88779E232222445AB92E983D605BFB07BD8FAEBD8F51
      067E239FE397419E01A273DCBB5EA6908F7F2E5FFA7F75126F9E7B611B6117D4
      EE607CB2A061D9B265ADEBA7C8B2A1ED9A7978D7B5091467952F5F7E3EDEEFFF
      08E7BFC0B856B77E439D939BA7BE5B8F9EAA9ED046833154A952651E1E91A5E1
      E3014FBDBCBCEEE2CB0C4D05D3120C1BFB81879D63E531F64EF5E6D8FBD6EE30
      61D2B4BC16878F0494C2F70D4E972953E61EBE0370CCCECEEE393C59D8BF7F7F
      744F22AFD03212949B054ED87123B0FD8EE7DE41B337EAED4A993D3C72E488B6
      67CF9EEDE0C1635757D7CDC8B0332011938A23919191DEC069D1AACDCEFE2336
      7E1AF8C68EFB50BE14587B479C6BF341CD672E59A5A3CD9B37BB62E2F0657878
      786A93264D96972A55AA1D3675FE05C547800E0069D1AF7B2B40797F89E0C5FB
      1C5D9A7486812B1E7E1FC66CDABBC78D56AF5E5D1E4A47F105865C7F7FFF5454
      E05334E30C286602A676EDD6C3B5EAC49F7AC1F504DFD05527A1583D307A477C
      40D95F76BEB37073399A3A756A2FAE383CC9BC09B777A2F6B742F120E029E040
      748BB635FDCAAD5F17D871C713CE19703EB0E98EF8C0E63BEEF9BDB5BE0F4169
      0E72BC879A9FDCA041032EB30B14F9F1C71EC4A7249D61A47B89F78F79FA4FD9
      AED579358D6AD7BF3A2A7030BCB9E4E4DE6E0164FE73FCDB1A104DF5454666CE
      9CD902A778A7B50C06D796E3C68DDB654D2B368EA9AF73BF7EFD7011CDA772EB
      D62D09A37004B65B774767EA5EB264C9A84B972E153A26A0D71634909494E488
      B5A495E89569952B574E45D3DE01D74BE6CB879A366D2AE3EB25323EEF616B04
      FD2010DF82490464A16F64962851E2319AB5CD98A0181B3A74A8AD3233BCBDBD
      87E3A332DCA1EE3838385C777272C29B59D257CC2B0EE8F02EEF2E942DD76834
      AE47CE0BD047B2A17893B0A90840ED872DD292975C872ACA1F53B8BC9842E4A1
      44FE5ECC23E4D8AC7EFDFADCA19E40F90D102B011E00D84877C43030574F1172
      530A92A3A98C5C9BF44F17139D5CCD3C2DBEC43219A34F26724F7675755D8178
      1E3CB8072697750562F3F8E72EFB93BDDC138A1389BE5D49F469BC06A72CC8CD
      CD2D1ADBAAF5A8752718E80E8FDE05CEEEC9441405A8DAA8E704674A7E369B32
      E22A135D384B74F830D16E89BF3ED22A2424240586D220B819B0D802EB103F04
      A40286854546FB106DFE8D687C2394DD85C8082FF06A18CA3C0503CA1D08FD01
      0802182DE08BF84700F396F8FA87FB11559B4A546F2F685B006B017701FF398A
      AA81029DA50841AD359D070FF4C86B38A55330DD21F48D29274F9E44CD5B4BBD
      009F33678ECC03068B70B7E5F855C6096203AC640DC51D27840E17412056C1AB
      8C13566A79E84BC78917F673CC9C5F364EBCB09FA357BE749C30FB5A483F07A3
      58E384A6A87E8EB650AC71828AEAE718958A354E5051FDBCB8E3048AFABFFDE0
      0D8E52310A810195DA41AEE4A05E1D6210D3D26F7F89451CAF43208E2FBEF8E2
      2B2083F8A68A01B8582B4163C2B3B650BC4DE044CB3FFF94E6BC9EC52C62436C
      441880B2893FB68529BE6016164041558E4BD050ED109330A281F257AFAA6C9D
      81161F50DB82E1CB9A6683E7CF999997EE6BE8F79B1A510F6C600AAECA4C2F00
      2F52EEFBEE783CCC2CB946D441014D105879EACCB6B87611DDFAF1675088AC72
      A6EDDBB7336D2BB65CCB8CA8C0AB567877494DFF79E9016594ADAD2ACFFC7CB5
      E0FDF5D75F1C3F94162C5820E3635B9CC05B83398457D2C48AE5C8C1DD05AD47
      BF1A74F5F2433A753C9E662C5C2978FC2EC7AC59B368C284091A1D2EE34BF1F9
      DB41BC968E5B5F618063A18D60EDCA5308311398BF9C67F6E2536FD7AF5FC783
      3D97A5CC102D11A7B2D076101F1FCF15C5722A2033DAB3670F7F1A4EC3441160
      D6A50171E9DCB97349016662AE48ECEA679F7D463366CCA0E9D3A7B3F2529667
      3E837A16407C070406BE3E98800BE5B163C78A4C385D1814CAE4BEC039BF4C99
      0D1669A038CA451A28AE72910698911F2E776C23EA45A12B69711A99885359E8
      78C0BCE6FB767024605FF3B64B9BECFE7550624686488BB300E542DB8190E060
      C408428E8C91B572C31DFB34C51A0F5833E2A76D1C09F0C617492EB4EF646E89
      8B162D92870D1B26182F0AD803769B95153918C58B7B5868560845C58A32F343
      D6F16496888D1D6CD5C424EA8019D6C00D09375682842B1495DEF40B25B66B41
      357ED88AEF27A51372A6C4564D88EB40C7C242D212F07880F73B45D76612F3D9
      48F5CD5BB0F93F8DF8B368FC68E068740B6A08019B96C803097F125401FE6A21
      037F94F2E1C387E2B524AC2D08E36C18FAFC0C425B603CE0CF41B231166260AF
      18702B8047A8CE643D1EE8B817A21D0C528676ACE4B06101E7B0051D37220257
      02ABF140F45C51041829743C6065EE95FF190F94EA2B3CE6B9C158B066025EF5
      1877EFDEBDD9DC9459B90B129B8A6B01F3E7CE90DD00982D4EE3AB284389ACE5
      850126BE0AC00313CB73FC8F0C40791C808F715C07DB187BAB57EC30C41F02F8
      B8FACDB731D1841F72915B3779E700D030803D60296023E05BC02E0D82AB003E
      3E45E00B68A728031787255D0D092FC0871DDB8CB883F83CEAE23C1B388A041F
      4E1C009200050E1879A4103333B28C509EC36936A078C0690651418CBC00584F
      B035B0741EE5AF2152846D91440F2D7861D14D32FFB83802D340F93030861CC4
      43E06A06E2A28E01603C076C80DE11C4A481427D200C3AC48BC1E09A065AE8B1
      0C54274017E8D5434C1A0E9038C531C011E00328EA08B330CE5862B301256189
      B958A222E18D4D6CE17324E88C6838B0C0134B1C088F04DD3A86B110CAFB3D55
      502168490C427C02B014C2FBC9EA67496F03895D1F06C34A66C45F1390C0F8C7
      87B507FFC8886A2064C82F6AC5BC8A2561A0DD8C837816693B672EAE116E3CB4
      F583869AE0770B7A8015EF977A250C706E52215589CF35080F995F140881F6D3
      0F8A9C82DE5C671317A5644DFF1F721ADB4D3F600A7EF767E1BEB57BC5C1451D
      6C9DD04873EBCBD7344A1D1447519151CF0237A4DB1BBB0B830AB338A7515462
      BB19074C5B3FC0B7AE14CD5788458EBC77230475A01441898B634778501CC1A2
      64840745318B43D7F1D7EE3191AC8B4F171D2E86428B39B316ECB196D3718295
      C160D40678AEC804BE8FE4E5C1F11346EF1A3DF63D1B23C2000B31FCF0CBF71C
      D9809BD18BE2EFDEA0C6D1CDE9B3E97328BF119B3AA8572B9AEA4635A23A805A
      351B52ADEAF5893F589FF8E811393B39D3DD7B7769C4F0519CC12E0E186C3C38
      727C3F29BFD0E0708186940CA7DA5175E89B954B29F5792A3D7BF654D095C0C6
      03CE31AA5A7D6ADCA005B1E2FE0D3569E56C0F0A0B2F45654A95E5BF93C1F69A
      1E4277DE44C934748A34DAC6C0F1D38729F1F17DBA197F5D288E9CFC9B10B637
      D853E52A5528342C4C2CC8041A16D2C8E19E542A9B66D9148173E6D9F9AA399E
      343286171DB28581D573BD44AC04612581B9AFA4EC9CF6E68D6D488A837366B7
      47C660E93C633B1E4D54A19153F95A22D8E6404E2339EB1A51EA17A447F638CC
      740E85F27B15E8F2C1F69C2C1422CA11495EEB68DE9C1D744D4FC36C0C94A831
      98E62D584223DFC31F15FC7199222AF912390CB435A40BA3799F7417CA5F4C91
      17EBACB92D1B4EA393EE9E30F2A93042A6649A37F3136B11FEDA1F3D3655A42F
      A65C58CC0C1D070A9CF9E30495F07C9D926A3C861178F27E24580914DDE52462
      F351B54A0D4273E6B514992936A7B1546839F2F6F425F624A2F987346FFE3996
      A19281A1E4E6E2294010AC021B0F4243435556ABE869C4A010F0645C41458CD3
      2D31A218D80FB7A2A9F8BFFD64F9693016C8654B5778ECEAEC49AF00D1B1B1B1
      6FB2AE70038F8EE59898188BCDE245304093274F969422082DFE9703BEC1E404
      AC732440C139C6C215F10DA86020B031C0CAFC97092C081E9F2A8E54603AEF02
      5109406C0C204DCAAA260B739A41C19598690AD81860016B0F14212566FE4B3D
      C01E04D57556302B676081D64E2CC699D379A18D074CFE571E708EFFC403D129
      387786E95BEF705424C4BC1E6ACD33BFE4880641D60D29FBAF43A8079693B027
      35073B48D351072672ACD816748919DC8844ACE3102D912395A92FDD40A49540
      AF2088B9988878E38330C206D8A45A8C891D4A0A438AA075ACE06CC002B64D99
      57672C8C6247EC013EA0E2F52B3A47DB626B41105B2E0A5E48417FE5435D0E7C
      654D8B82CD9868A1BD52F4AF0D884AC4E931E5CF1683A6300E1E9FE2B7C15F0A
      B039B02C564F1850846DB87989BA409702C4C1B230CA37289C81B91D304170F3
      052C0C52054091C74B3DC09FBC68E6CD9B57A40176839BAE89BDB0064503CA4B
      80F33D25A282C74B3D6015146519E2659C01629B4318288CC15250141E325E14
      0803C5117CA181C23C28AED1FF037DE1A5B55C54E529F47F6F00676020406989
      0315CBC58DC588CC7B72B1994F6CE4CCA7381FA773543E9A4D52C7293C5F1793
      68C6A1A0168B3D03ED8506B063463398BFB8818D8D7CF51D0C05F64A0124C552
      111BE55D33CD3043B904B887BD2BDD98C9821C1700780207241E38B40A13B925
      024F0378019E6246E3CB8F078A340221EEEAB91C2B00AB4F813F043C07D84EF7
      99901FE089EA01C6C08EC8750E640CF06612E2971B408ED603EE0F5062105B71
      819BC74420451EF0E08545E4DA2D52D9C26003025084A670FD12E01ECE4457E6
      8B76C0C80B80AF0B828D07377C41E5B3E006CF1680F8FDCB0CCCCF5707D0A1E2
      9F05E4320A1A0C88884F694720730106C04780179F05E4AEBACFC2801F2D8048
      1CD2BF1ED284997F13F0E951F557AD5E31158918C0CB8ED8BE7DFA4F66A1FC67
      21A60BDE30668602D3A6C7D2C409793651B1843F3E6142A10684DED1A34745FC
      DB813D2266238D1B3513387F5B512096A0D096C8A393A26C91234ED7A8510333
      56592189B88001F4363A73E60C718E4D1BB710421C376BD292F853C138B582A6
      043A05B18EF9413EDA3B371C410E0B0BE3D14AA4B90E04D1121430C002D81D69
      616327DED80F814B006E8922B20904E7FD91EF4D053586B78C44942B2FFA3A7A
      1B48B6073A93F0E4CA9F97C5934F7063C56853BB4EEDDF66CD9C4D0D1A3424BE
      E1C0766BF11784D8456E13339DEF992A57AA4CF5EBD5A7A3478F34528BC09583
      2FDA12F6A5D1EEDDBB89DF24E4A79C1803C4667FE67305F3E214B61A50F56A55
      E1008AC5218A20C74C9A4C572E5FC657EFBD98242A4C200858910D0015FFF3B8
      79E3066AD0289A7EC17B6EAA075CEB29F87BC9AD5BB7A86B45D9D9F8EA3FD68B
      F9ED999CDC5C945FCBCF58A951E3266C4B8046849680DDAB55BB0E356BDE929A
      366B41AD5AB7A116AD5A0110B76C4D2D5BB5A6E62D5B89EF297286ACA654E294
      3A75EA8A0D1A7CD3815DB2E2CFEFCCB18778830CF70782C6EB08D8D3298CFCF1
      07FEAB83ADA00ED62116972AC4AF72AC7F15E14265256BEAF215CBA622CD5D15
      D10B8FD801FD074E66099B4A0421A64FEF7E78449E4E3B766EC7CB403AE2B435
      F4EED5176214C301837A1A39F1E4490AF5EEDB8B860E198A6DC52DE9516202F5
      E8DD9DDE78ED0D7CCDD2874588FFB751209640B2C43474F8E09A58C1383139E6
      13FAF9683C9D4AD052DD40993AD40DA18F623EA08FA74E273C3A24CC0BE8DBEF
      56138A207445C0463A777923F5E3A9D31CD71CBA4FB7D28C34A071082DFFED06
      851BD3A847037F9A123B09FF1C3594B0219AD67CBB4A35208A3078C8DBE3AA57
      ADA1DF71F22E949D697CC7B2E48EB76A1A97F7A07D71129DB8FA88A2D1749FA4
      24153E223D7890F05983FA0DF4FBAE67538B485FD2C2AFACEC5CBA74E311D951
      369DBC4DD4B04134AD5CBD82F2FF204A3462E4D0DBED5ABF16B8E36F077A92F2
      9C4A1873F192959EDCF177325712B2D143FDA86D991CDAB57B27858596A68B71
      17282D3D8D6DC58AD388374F030F1F3B443D1A0651A69D07058597A1A0E0500A
      2F5B9164D792D4B5AE3F2D59B6447CD09D5F0C1A337A2C4D8999CA0662441D70
      27C20319BA70E2377AB3463DDA782A9912EFDC229FC0607A2B4A4F5B7F584381
      FE41B469F3267CA034948E1D3B8695DE9A6C20EFE2FAE1F80F6952CC8754155B
      252675ED473F1CD353DB6ADE3475C230FC41781F3A7CF430D9E3DDC6790BE690
      BFAF3FBCA92C0C882230E6E7E74F6FBCDE994E9E3A4E0B67C6505ADC0FF4D198
      C1A8501DAD5BBF96EAD5A94B7E78691CFF1246F1B7E3594580468496C0DEDE91
      7AF5E8837F13AD8A2F4E6453DBB6EDF0726C0F2A57B63C8CACA30EED3A881723
      595C190F441D3081B78EF0F82F4912711C8937AB9591993F11CCD78A79F3E7B2
      28757AA333F198C009898377860CFEC7E3812842B932117A576737AC27BE1274
      FD6AF192EEC283F1E3C7CBBCEB8BBD292E7CF0C10784DD21B613CD47780CC043
      381BE1BAE09841C139E6EBC40BD713F1CE827A4D506A9A8D30B0017ECB8C7105
      D4B3A010F8F533C6478D526777347AF468F18FAAF90DB29C8D01CE813D60C1F6
      EDDBD3CA952B897F1F7EF8216FE4139EE5F7409C05165260D9B26562C30EDE2C
      A24F3FFD54341C4F4F37F1CFC28A778A2CC7361E3001C31A718E78D18356C203
      BEA060DB32DDB9731DDF9A2EC322366063808BC0571E96D8B2650BAF70312A60
      EEDC2F08AF9E88BA10044B60638069D665E73403D7094F3EF8BF8A264E9C58F4
      B2300B376DDA949A376FCEA8A8B4F8F878FAFAEBAF8512B620D3AE5DBBC45FAF
      090104361E7011F82C700C9E30C0311BE58D4CBCD98981690AD81860224F63D8
      E5FC46F0D298F8C7DD171A502A900DE5076EBEA1568F0F14BEF0007BD37F45E7
      68AB108B1343876F7F8A23FA621969C1C2B9E71E273FAEF262313357AF336C9A
      3471F29BE69439D43D79925C696ACC27E6D44BC2C9B11F75CE2FA2C3DDB5A0A5
      A43C11715181ABAB5BA12CFE40B5CAC0BF1BA8B83592BF075AF3540F98682DC8
      57AA6FD7AE61326DDD86676FC0306023B43D34784AA352D803869F7FF9915839
      B2DE6B54B6610F0AAFD78BCAD7ED8C4B3BD1E07706F652158068943A004EEC01
      FFE1E7254C79CBD77E8DAEA61829D0AF049509F1A5A79233B9567A83DCDCDDD7
      F47FAB8F79A20CA5021E7CFBDD1A2A55391ACA76D43D3A9C2A9574A7F012F8E4
      4F296F32195CA84495374C3E3E25CE40571C3623127BC054D9E84B617E1E9463
      92291DF3E50C4C36D2327389DF057E90661097029663B054A2CCB80AF6F86004
      DEC7A27428711DA5E0FF0CEDF55A0AC6479BAFDF4B9191AB6A44072D13E607A0
      01B31CB9A989149F9A456E8E0672773188F7DFF9D30697E31F9397438E298948
      9567039864EB3160981B4A675C3837FDB08942EA74A7ABF7932934CB9174F8E2
      C2B5DB0F292D2B9792FED8A87B9AF2F4B6252F9EFE6BD7630AD7CBFA432539F8
      8CC3CD63EBF01DCDB7E9E2AD247A9EA3A50027991E9C5A4FA5C2C5C01AD47740
      DA9555CBD79453CBA25854E2BE037A7FE65BC2779C92E6D8C9E84C55F0C7370F
      308BE1F48DBFAF53910658A030F8F893585931C206441D142658146DD247315A
      18C955F812AE3E9BF04659278550CCB8EBE2C58B37B0AC3464C81019DB4C192F
      36605729C18028BE5A04BE472CCEDC80EFA3AC73520DB0F2F9F3E7D56B010FED
      D6823CCC57ADAAF62195A51A600A8FFD1CB330C70C0A9EDF20F31854032CC81E
      E4173C71E5119DBA9A44496926E2AFC2DBE935A4C90AA47AFD17F53FB262F80A
      B54DB335BC5929C604EE954E9E81B4F0E7EB74EFB9817ABDDE90167FD485D64D
      EF47B3C774A23E5D5B538530BFE575FB2D3CA16345052E5EBC28D0DB0F53E9DB
      0377A86FFB3A54A7923F25A6A4D265BC0FA8770D2072F4C2573A888675AF4BFB
      4FDDA8A97AC045E09CD98B6DA713A977BB5A1415E14D0F136E53898030AA50AB
      09F9E316C0F4F40E6972D2489B934A1DA323F2BA2567CDE3E1E76B7693B7973B
      7588AE48062DCAAD77159DD780DD0AF6F8368C133E9A12E8E3462503FCC8CFD3
      996C8AC0B9AF3DB48B9AD72B458F71CB9790E94C01C125C5602A861C49439229
      93E213D3E950DC49F232CAA4AD59B3E694B66DDBE266334DFC81D1F69309D4A5
      45353A762581BCFD4BE2AB345A768ED84052E2436A50AD0C950D0BA49A1582C9
      688FAFD408AE25600FD2BEBB8C773EED48E312408F9FA6615C7420577B2DFEEB
      35973253F0477F92AF90E63AE3115B2D022ED782A1C7794E82A24BFA2D72D1DB
      D3BD67BE94806D24D939F8CC456236D5CDCAC2024C26B9B93A8B1DE43A2CF9FC
      8ACEA1CE0DECA508BA722381EA5508A288F092F85FDB1BB42DEE0965E206302D
      C399C62E3B460E522EC5F4A92576918B1E25B2B604CD067EBE2828C867D888EE
      F529B2B49FA0263E4EA2D80D57280775FE2C3D13FFB29B41B3BA879A0D6066BA
      E6F6EDDB36972BA16515188DD998B1A6C1ED0C6A18756A9687EB85DD449927B4
      AE94A26365EB47C6567A2AFA2C7919E9356748ABB983452AB7F75333822B1AED
      EF6ECC4D495DAF56224F71B94BB316D730C70C7ACD71B2D39EC5AE973FF0A98B
      CAF8808D466FD2A6B5CCCA497B66D0E55C529B727E6536C2A0911244CE92A612
      FE18B53DA00369B455F011755D39CCA14BAB1E706EAC601D9B716E428C718332
      102C00804B62447FAE1A285C59C2E70E7D007EA4355DC22790EC60098FD373E3
      F06F499A3B7A6D6E9C6A001C9B433168A22A688D77C1CB21AD1C8758C6DB03FE
      F2939467FB1D7C6E5CB331A02859C732B95096DC0E1D2A0067E0160CD8D3AA75
      D735C3867D371309B40C0E01D64A48AA83AB99EE4C39724341E3296F62622C8B
      08D088B01881D95041C102455004AD63052FA82EC61A33B930A1FCB4FC69D62C
      B4088509164663036A1178199009AF0A3A6CA3FC167B0F5ED81BF31B85CEE2FC
      B4FFBEB484ACF9927B0631E1F9422CE2183C3B4044141B3B85F8037422611BA8
      CF17D80056C3F199394CC5DF7977307DF5E512219A9C9C2CD6503F8A9950D8F3
      054226AC9BD794594B5166DC1AA64D8F15ABFD4CCBFF7C413D8D9C230B28A05C
      6895343F5FC03FA5A15329E38399A341548D1B89B2AC8334B17283060DF82D3A
      4ED28B9E2FF0EB89E720A51A5194F9153D9E708047BCAE84AF95103EAC50C003
      5104D4E239F68285F11D088EA8373EEFC408BE098148D417BA33D07C8730306A
      F4C82964F9B1071654443FFEF8A38839C87BBEF02761319B2B23561878F0E081
      BACCAB78B069D326719BDFB16347D6B58194942658A8D7D0ACD93363D837D190
      500C71A9523CE04A3C7EFC38E1032B453E5FF81E8F09D8007465A16C9D0D1B62
      23BC478BAF194A1DE19F15C9FAF9029F46A1C733506B508A327FEE1C9A3F7736
      CD9A3983E6CC9E458B3F5F44E5CA57103A1CA80638B1FC9B65D4BF4F77465578
      D9F3053620DA006B848585E0CB5CE6A181BD99337B26DA40B838FFFCC086DB02
      436868286E915C5985B80EF894AC43AA1BE0558FF5AFAA805DA38BF8FCAB7AC2
      033555145272659ED2C32766A98CF7852ED78199F0AAA1FD7C61F49F1BB07820
      DC50328F8BBB282FFA62A19214F1F0A123B033A2629E9C03EA207DB89A563D58
      FAF59742B94ECBDE54A5CD102ADF7238556B3190D86097AE6F98CF2D9BB452E6
      A4301077F9A27CE6EC59AAD6B4379D4F72A690A000AA5426909E48AEE419D59F
      3C3CBDD674E8D896FB0CEBD88030B068D1424CE7DBD18524071AD2B63C4595F2
      A2880057AA5FDE8F4C76EE1450A7BFC9DF3F408CDC36DA4808038849760EA488
      92DE988D9828352B87D2F0E774CF3372C8C7D581EE3EB753CBCCB2D620C60326
      3838E059068676FCE115FE8B4443C9CF33F1E78F3A2AEDEB4497E39364E454A8
      11D540EEB304BAF62C933C9CECF0074EF86BE61C1379180D74EEFE03F233E698
      1E584D053843058481810306D2B2E5CBA84CB377292EFE1195C974229D9D9EE2
      FEC6BF42A1180F8E7DAD7B92FCE4B6A2641DAB6E0D1CD44FD6E90C14DD7D3C9D
      BE964C29D95A0A719129FEE05754A17C25A1B373F7F63FB7FEBCAD9C485802D5
      00A7DBBDD6E6B3C080C0718C2BC04B60B56AD6C2AEF97B82F4E7954BF823D82F
      553D5104C14100EBE3113120CA3BC64F18275B1BC9E360B26B9D280AFF6CFA4C
      2D8CA86B0645C9BD9CCEFD209F945A967CF482494BF7C5FFB2E5F1E2FBE14630
      2F5934A628172281065608353FC9D2F7F393396D5384978E075C07857567B654
      ACF1209F32EB8922FC673CE0AAC09F38FC673C1015F1BF603C107EFE4F0B6CBA
      73719CC3BA93CCDFC3C08BF642D766547E9981C3870FF377D208EB2EAAA8E6FB
      8D1BE58A952A99A1624579D2E4C962EA6291B0C609DF59242C1BD1B66DDB68C3
      860DCB854CA7CE9DE54E9D3A0941C6CB4544081C4C8E15207C5779399E72719A
      3F24224FB6CD8868C1C2857287D75E93C3C2C385100CF0A1E2D3A64D931503EF
      BFFFBE8CA762328AB45CFA6DFF7E79EC9831C47713257C7CC4821C9686B88254
      655892F029389927E0C0D503DF52213C67AF22F7B57CC66E1C9E3FA38CD68A02
      5FB16285C89D63D6C6AE31197F7220B3273CE7957BF4E82104A31B3796B14221
      EFDEBB57A4599861D0A041C200E30AB0321BD1BCFEFAEBA276C1906B45458987
      F263468D4232EFC0A7500F0977F3488422ADB07C17C68AFA1FF41FD500379802
      8A2FBDC85A69886BA3559A8A7591B552B031F04F2EB23606FEC9A4DBC6007BF6
      AA93EE0223D2AB4EBA0B1878D549B78D817F32E92ED00E5E75D25DC00057E4AB
      4CBA6D8AC0CA0CAF7291B53660330AB1212B109EFED74DBAF35BB6A45FEA8145
      EEBF3612655BB264C9A6848484577EE688ABD30661006F95C92F7BC690DF6F2C
      A3F25B6592F559207EC6F0CD37DFD0771B370BF99E6F76A2010306E0A225F211
      31EFD3C2B543F039B031C0976D3C3EA53F4E1E671E0D1F3E9CD8A0B22791D792
      78A7AC605A021B036B37FD2094511F828D6F275115DCF2BDFDF6DB22CD060462
      15D818B0A2DBA0BC0B86096C20BF0736034AE37A7588BFD6848F9312C3E0C183
      E9CDD7DA53D9B2C16213B0F2F6251B534087DD60AEBCA98D5DEDF47A47BA7A29
      4EB8CD025D3A76A0264D9AD09F7FDEE2A4A8C4FC1EE8B00326A5728D2862E5CD
      3FFE447BB7FF2A0459835DE698E8056F5842595694F7EDD846574A9736EB1411
      56BC71C386A351949553C7DC6B08AE5BE02FC471808B003EF2BCE2149166F2C4
      0FA54EEDDB8A94C22C8554B805D89F0AC02B02F850641867D071600D11D7AE89
      3A5004AD6305B796B731F04F9E310803D83AF6DFF87E2397E79FFC5F1BEBE13F
      9A366A19A95BAFF606FEBFB6C6D14DB1A5B6093569DC4C8D0F1E3A4053277F42
      CC5320BA915966FFFE7D15441DB01186D4D4E762ED9C6B1B6BC5E26C28748E15
      609ED1E82492360648068D0191C0396650688C3358A56D0CF05E1406B38C598A
      7353684C67B04EDB1AC8358922C077F2F0F2625901D33E9E21E2A4478F44CC46
      0582C0C600EF4D62A604462236AB705DCC5B3887468E180D0AFE6945CEF34A10
      10D818C05FFF806416F2C6D41F0971281E3CC2B37741B0AA20CE0C7FEE36569E
      3A791A16E89345113867E1099607172C9A47EF0D1F69D6B384CC7377F7A0D84F
      2693CD9066E1D39883E514D426FEE048459B34276C8AC096A79D8C267BAD93F0
      84051898CEB111FF193BF64005FAACC1054E0AB03130E5446DFC393CBE0BF72C
      9506FF186A36E24734E887F942D8E0489495954D0336F9D14F83B2044D35C0E5
      9E5CE3288DDE5B91329EE7D0D24E7FE36C4AB468F1421A3E6484107E774B38E5
      664BF4CD1B77459A039B3AE0FA9FD504EEE9B389710616E298013B32E8EB37E2
      058FE90C36063C3DBDF094DF8B360FC81031A7598863868DFDD2543A7BCC3C51
      04EE962FFABF363E5D2C9C1F2449B3511860C6ABFE5F1BEB20637AE17870E8F0
      C10263018F09C51E0F38171E233866E8F1AD3BADED656EADC51F0FB8FAA1FDDE
      9ED2A4C79FFFF4FACE9BD6747F088AF9B0390BDCCF6D00BD8FD3A3F697211707
      FE1F1EBD787FA1DF261FB33642B51281637F41DE78C0CD974F958C31627683CB
      CCA6FE1B0369C59BB7CD2D5450F22D0B2BE381B2A985653E899DCE115EC74814
      B1222312086C3C50C603EEF7ECC17C74E5912394FB684B658876A8E058358091
      02E3418912BE4CB681870F1FD0C04D256959673465D48D321EE4F3C0ACC3C2EC
      C1C2CFE717184CCC1279A18D0156626076FE9869A25291BBC2639ACD69644261
      30F650044D3A5A930CD85634704330BDFD53802AA61A10D6F1FF53B215B014A7
      67D68BC3DF4F19C9C9D9482EEE465ADAE136B304A80638C5756B0DD6B409D5F7
      E10FBE1C6976D38BE23C308FC1C600F7796B6001EBF48296575F7D3C286A2C60
      E33C1E88EB022714405D74412D6F50D2D631E805E46D8A6011EE66890B4430CE
      556443D780D81D300DD0DDC2D102FF1920D21C03D4B445468DB4C02E42C00F71
      0FC05AE0BDE06A07C4330017411BC969C48CD39429536C8AC11ECCB430955659
      540C31A25DFE92EE608D80765B4BEADD98C075500D4824405544CE7B905E879C
      CF738CF45E405FE0640C0818E71818B2CC3520E8931D655C7C6DDC618117C1AF
      F54A7F115AAE7C37D7C6AD3D52AF5ECE78F0FBB129BC81818D705D68D704E9ED
      FE6852B6FFD501EDE2CEB6A93AF4E7B24E76F0421AE54EFA8BAD2B8FAD50B356
      2FEF66ED3C1C3C7DC8BD724D7BF7AA51EDB8083C4499AE4405509D1AD5BA7944
      46CDF6A8DDB0BC7FDD46B155EB351878BB7D658F711D9A7F54A2568318B77A8D
      5DF47A94F4F1437A76E5E2BD23C78FFF240CB0DB76AE6E06A3578928BC3CEE21
      3DB84DF62E2E1E2E1195639C4A47CC70285F65987D50A893F6D913D2242752DA
      D5B887470FEC9BFFD3F9B8D5EAABBADBAB94D085FA780D2951C27B8A0E1BB735
      F8AC95C6DD8B2477EF1C29234D27A7A7929C914EA977EF3CD916776DCABACB37
      576F4F4A7FA21A602FC6FA685D7A07B80C29EDE9324EE7E2E22619EC497274C2
      2E3ADCF2A43EA5A7F7EFDED9FBE0D9DC0589A6A58753E534D6B131C084181FC9
      AD5749B77121DE1E23F412399216659634780E9B95B4EBEFFBB1DF3F485FFB7D
      8AFC8865190A1860E2E755033D9A970D1D1652C27B98C1A0F7789E9E91B0EDF2
      DF9FCE3F7D75E5B127992267966328D40033A64657737BB346A5415E1E1EFD7E
      BFFAF7E2A5C7CEADDEFAE7ADA7CCB386220DB0D0072D1BB8940BF2AFFCCB998B
      177F3813F78469F9811B517EDA0BD3DCB0AC05D476604D7C15FCBFDF4091DEA2
      FB76299269C57851118A1C1BADF4F326DBC8F15F8D8DC2288CF4046CE584750C
      BC3240D099670D68E8E62404786CFC0E298556540C91420E18D803E80BE0F190
      27DA9C66106321E8CC53C7C6424CFC33128F8542F346939272FF40A78CF1A5DC
      0F0F097679363ACCEDE8C020E7B471E16E47FA063A657E50CAFD50CF00A7EC0F
      4BB91F5C702365AA50B20E4ED40FF06123171B067A5BC70A5D89996FADF77F00
      FF7F41EA7458D2579C450000000049454E4400000000}
  end
  object ImageListIconsFogue24: TTBXImageList
    Height = 24
    Width = 24
    Left = 240
    Top = 216
    PngDIB = {
      2D00000089504E470D0A1A0A0000000D49484452000000180000043808060000
      0013941CDD00008106494441547801EC7D077C5445D7FEB3259BDE13127A20F4
      DE9B94D0915E14A50922A228BD8822A2208A22D26D88051144109522486F0A08
      022A8AF4DE1320BD27FB7FCEECDECD6E761312D0EFFFBDEFC7FEE6B967CA9973
      A6DDB9E7CE9D7B17F84FFFE9EE5681475F7D7515798A12F9B9EDABA64E9DE28A
      C1E02AD23EAE72F3E6A3974C99F250C7A64D4B7568D2A4543BA22DD1AE7163E5
      2FE2E555EAC2DFFBAA3FD4B84AE3037BFFF8DA3EAFF8EFAAA052D3A643BAB768
      5132232303999999484B4F475A5A1A5209A1972E5DC2CBC3C6787EB365639126
      0D2B353EB8FFA88312A368F9E171CC252D4338B9AF536E54D23156AFD3C1CD60
      571E2ACBCCCEC6EDDBB7B170D932D4AED52268C9F24FDA92D5C1E92594958DC8
      8E1FCDEFDAF1BDD95D3B2E98D5F5E1F9EF106F776D3F6746D7E0E22181225C83
      28F1707383C9688451AF47AB56ADD0B2654B74EDDA154D1EAAE52DF2ECA129D0
      B3FE30A7A4C09C9A8AECD4646425A7D29F828C8C4CE8587A4D81D0DC4A245D84
      4A8D84DA234701AB0BB319D9E62C98B3C9429ACDAA65B129B42612E11A5C2911
      5EE674704A416616F46617C2CD5492C91A28A16C0E45ED6A63AFC4C07819040E
      D219509D9C65061565AB926767A6E3D4CF2B91127719DEEE668C296AC6E98F16
      B1726680B554056146569571F4301AAC7136E9A810A06B6F24BABB613353C41D
      570A580383340758E294980BF0F404AA747943180A8D6A03211DDD23F6C211FC
      3463E9FBD2BCF8A403760DFCF48DE659C929B8716C1BDCFC821058BA1E3B3AA9
      D00A54060EE7D33B16DE3CB525E94DA5E0A376D833F8D3E94DB352927072D7E7
      8868F218F4D93A64B1FD5586421E8C9E1ED83EEF9D43B117F19252F05E6BEC1D
      F2D9D4C629D15770EEC806546A310029B76E15526C0E7B667632BE7BEDCBEF9F
      D98C1E4689CEC882413AF0CE8D0BF0098A407A623C32335224A9F0D0E971F6C8
      1624A7E1B864563598D50CBF0EFF7C72DDBFF77C87B0882A301A3C90999E26E9
      8586D1E48E8D9F2CBD76F93826BCBC1FCB9482B71AE3C8E82F5EAA75F0C765A8
      DEB01D12EEB079D4D95668F930E80D9837E1DBBF38EE9F98F13B0E2B052FD5C4
      89292B2756F87BFF56942C5D094909770A2FD99AE3DAB93FF1F9FC8B2B3E3A8D
      3E12A5A6C71A7E78B16C75935F99B25590959A0639638D06239BAA90309AF0F3
      E67DD9DFEEC0173780BDA2406AD0AC3CD0BF6E51F44DCF844922EF1994F6D74D
      FC7902984419F1442AA3509F1E4FC2839030C93D3B4E18C860EE342B3249FFC3
      9D4E66C77FB30EAACDC3D0E7592A294BE056CBEBA785DE2B82778497B3E63D7B
      035F7D689400AF63E58E8D5831EEE60DA0D8A23889BA671C987A0B6E26131E7B
      7BFCBB22442900CCAAA9785193B8FBC28A39EBF77D8A514D8AA0778E826C706E
      B68AD5C699355828E246EEF1BD47369E1936D25C69C1A3731884EA8320F49A7B
      EC996F465DBFC926FA2C8E96840C65492E1CDC68CE443FED87226140C5858FCE
      BB8DD5A3AD4D9453830CB6532A2D89C289B672D356E2E517D99912B6C8543508
      44F705C7867E3B5C6AE0BFF83692939284A3D0F0F2F646FCD3C1082F0254FEA8
      C7C23BF87E8452E08F6EEF1D1DFCDD73328AFC3E8B41624242A1854B061F5F5F
      243E1D6251F0718FF7E3B0E679A5C00F9D3FF873F0DA674581C72737111F776F
      43D5CFDF1F6943C2541F54FDA4CB87F1583F4CF5811966BD9440904DDB273D2B
      4BBC8586E4D5326932550D7CD0FEE3DFFB6F1C227D609E721E5E65DC35BE42D1
      E473BC96BC5E4635518DA51D162762D3D3AA0689A05D68151534BF8CD55778E2
      C12CB184384DA6520064D89A28FDDE4E0191A9909169860C554DA65541B63E33
      4B07B1B316ED5C0EDAD78AF96E0783E53C75607BB4561FB1801897AD0A6D5590
      A6AECD8C8511EE78EF762FDE2EA8B345A25CC2C8936A54D06A74A9D2CD96FEE3
      B17534A03975AA73CC22D3AA204B99EF3C897951362029291D376F5EB76574E5
      2952245CF1DAA779C18BE666365B42CA9B655F830C7D7A066DD1F42C55838484
      54C4C5A56242ABD5F060A6542463E9B1E771FD7A8E524FCF54C56BAFC01BBE76
      414BBF6A353064B1733378F0A0C8D8D834A5A0291A21C4188E98CCEBD0E23409
      1E1E69E4F4D0828AFA180391C989283B53C4664935580895146FE249882B57B2
      586D370A4FC39D3B62C3B8C1CF87F34B6C4E9C62E7411498201334035627BC59
      3474D35858205E9940A28AC989DF945D1AEA79B25F74DB9367DD59DA0C483379
      B0C3BDBCBCE0119B134766E53C3D335803C713527833B232ADA328DE5318AD0A
      6E2E65C05861999BC7A2627F35CBCE36C0CB2B90D54B83978F0FA91B3359E2C8
      A79CF01873D54078BDBC3DE0A9F4C6AAF6D3913B800824847620ED4EEC220AE2
      5AE4C37494696309D6141005451928F60F81D734F85196AA0BE9BFE77422BA4D
      9B36F549CB12285EBCF869A1F78A2B57AE94B3E63DBB75EBD683466BA0DCF4E9
      D3C7DDE27D59B366CDAC51F746F6EDDB07B9F8BFF9E69BEF52C2413D0FE2AC76
      9159FCF78565CB96EDE302493D0A51ADA36A40FB54051879DFEEB1C71E6BFCDC
      73CFFDFAF2CB2FCF11610639942953A6568B162D1A252727837E89BA675CB820
      2B059ED8B66DDB8173E7CEFD616BA27B96982BA35C97B32CD774D52AAA061111
      11B5A3A2A21AA470BDE87E6BC05273ADC3133B76EC3878FEFCF9DFB41AE845AB
      2057810A1D647F7215460D16255B1D18A968A1A5B9C8204D24D064AA51443E07
      05C2C0B8423BBDDE418C0AA83E285DBA74FD871E7AA84E126DD262C58AC1DDDD
      5DADD3C95A5C6120F9A50F24FFEEDDBB8F7044FDAA6AC0B657DAA4C8870F1F16
      72DFD0642A05946653E06ADD8DE9057614CC6B07D7D820CB74E0B5C492552FED
      2E899B366DD2468125259FA3345FEEE4264D9A382B608FABBE1066E9284E54E2
      BD2B264D9A84BA75EBDAF88E1C39A20A2785D5646A4D63B58BCC3070BDCD96E3
      2E9EDCBC628CC91AB7B404B32AD9AA0FA84D2F6D2F89520326AA6A8E1C399266
      B15EF9172E5CA8A8A409844F207E0DA240F38B4CF12B05F41844AB544DCB94C0
      BB9CD0D0505EFCBD209320796869240851F0A79DA3F1AA081E647852B05610D5
      EC4A01059BBC797F25969B649265FBF8F878557A894FE57AB6164739CA797878
      A87415B01E84575A412032255ACD780D1B36ACC2C080D75F7FBDEDF6EDDB3174
      E850C4C4C4E0DB6FBF45D1A24571EDDA355B1CF9940B0909C1A2458B50B16245
      159683144AAE66C1C1C1983D7BF6965F7EF9E52555037A8ED5AF5FFF2B5E243C
      BA74E9D24CAA294694D4464A25548B134102094BBCF83508AF27978DA5A95803
      0F895735108F804ADA91FE6376D1C183073FA0BC7FD7A98BFDBFA94235D183F5
      22FB267EB05E64DF1ACE7EA351DD84F3368D69EA5ED67227FD60BD88EDA1DCFF
      97F522755130A16CB7A155FBD789E3F524AD460C7CC2BDE1CEF9FE6EF8ECC66B
      F8DA6F15361AD6E293A48FF0E1FB9FA2EF8D51F0E23CFAC11F5F1C49C799756A
      BAD6D676A49E85592FDAF2E84E9CAB7F49B2019701DFD4308B9F474DA6917E3A
      CBBA023D28CC7A516CB2E420C40C4A23E54D78EEF52235D901AD969CE8B3ED89
      6B378095470ABE5EB4F9F37771AEC3114084B322A6D95ED87436114559914A2B
      DA7C016C1F68AD81656D8765A02596F77AD194A31371CD2316995CB24AE60ACC
      39CF73402A7309BC80F49EC99890D418557DCBA05B3FDD236BCEA096B5068D96
      1F7F7C6F1FA9C10FBFADC16B973ABA5C2FAA77BA0A6EB74CA244BA2C4204A790
      4A94349746A546998CFF0397F42474DA7A51B6AA812C84C87AD1D0BACB30B2EE
      7710EAE91980B4EC74F2D2496611A20915C102094BBCA44B01D83706B2D3853D
      36B4FCB355E213D371E3D67594EB178C5BB76291FD75306A186B22243B40C5CD
      B9F4361040F6582B444822FD2258AB4902ADDE14031FD7F3495F2CE2AD35B0AC
      17C95A8FAC01C5C539AE1769715E277CE0359F78DF073EABFD805F295C2BB928
      DA0CF86D0946C59FEA001B3C6E2016FBAD7D5064001F770F90F5A2F51B0EA2CA
      5721EC836B8819E58652C5CAE0E2D573B6388A54AE4891A2E8FE6B0DA436A064
      6996DB80D7B77E5876E122C2C2FCD16453E81620A69DB506B25E14F315D78BF6
      F878FAD3F4B3AC0DC97A90AC010995F5215943D220617F1FEA12E16C6B0E2D3E
      41D42330C8FF1F5C2F7A05A35099AB525954C48A601DC7EE06FCC590B8A33C8C
      25EE63BD6824366034F662247E21F663003EA4C0624418E147B813FF8DEEE79F
      7F3671294096D9FEF1EAE9B814B373FAF4E9E669D3A6999F7FFE79334DF919B9
      B494E9DCB9F3A203070E9869EA9BC9CBE188CEB9786C41EB30B585CDBC9BD1D5
      AB570F7DFBF645A74E9DD0A143871767CD9AF5898D0328B27EFDFA330D1A3498
      FDCA2BAF5CA3B23634FFD7317D04619D19E8B33AA580A518CE92DE91B89A356B
      8E9A3B776EE69F7FFEA96E9D020303E52664F0BBEFBE3B4CD2895F88B789716C
      CACE6FBDF5D6D9A0A020AC59B3667EE5CA95E731DE44D89C52C05BFE7A5CD209
      183D7A740A6F1CCE57AD5AB5D7279F7C02B975921BBBDAB56B233A3ABA962D57
      8EE75287F6EDE3C2C2C220B75413274E7C9E49FD089B53D703AE3104C85D49BF
      7EFD3C962E5DBA2D2B2BAB5CB76EDD20773072AB2A4A084F5BAE1CCF8C607FDF
      DA9F7FFA297EFBE30FC83AC77BEFBDB7807D1748969D000EAB1AF0D6275D6E89
      E47E6BF8F0E175D8FE7EAC11E49E4B6E898E1E3D8A8888889D70FC95A83D79E1
      53439E1F8ED9B366E0D34F3FFD88CDF51BEF4EBD49DFAD56ADDA54B27BE878C0
      FCF9F327FCF1C71F3379E32641C88AC9E9D3A7D5F302DE56212020006CB27383
      060E6C57B94A95D3642A17B5EAD8B69D09254AE1A9FE7C98BB760EE3645A2849
      7A9EFCB7626363DBD37F4429A0C7C492AFE2B240D7C68D1BAB75CFBFFEFA0BE9
      E9E92851A20422222270F6EC596CDBBAF5D42B53A6B443B79173306E7A773CB7
      1CF8F3D9C5CC3F8690D9489AFC03FABF213611DCD32247208BE37A15474C9D0D
      1B365458B972A5ACB9A99BF0A64D9BF2914B92525ABE5CB9E03437EFDEBFF59A
      561F1FFD09ECEAF10BB30F2162097132AFFE48CF4942399D3AE63AB0B4BEECEC
      88BFFFFEFB0FF607A2A2A2F0FBEFBFC3970F2B622F9DC1235FEE45CCCA43D1C0
      EE22B9B23A058D4E318C285BB66C02C951F64DBFAFBEFA6A598D1A35C0310E59
      AC327AF862E9E30DF1CCE9039B2F1E26D75D9CD39967CFBF71E3C6A3552A55B8
      7CE2F8DF5DEBD6A9C5A5360F9C39771E6E1E5E68DBA47E0D3F1F9F43878FFC66
      6B0EFBBC9A5FAF79F2A22BBFF9F693BF74251266BE3D93CF773279390CC3ADDB
      77B815311D4D9A365BC71960DCC081031D1FE6D809BB9B025FD4EBB3786399A7
      7C176C4EC1FCCF3E457868087CF9DC5864C8C9D9A851A3377816AF97B02BE4A7
      4007EF2A2F977AE1A3A7F0E2D7C0E91F2F7CB9F5D0779C73C013131C716A7987
      27A23BD737DAB116AB5D2970398A1463B1E61F1699B9FE999B2F6EA1E5FC5C2A
      70A333E3B78D1D33DA1C125A04323F71924CE166CA384EF1E1324DECDDBBF77D
      4E8ACF93CFE6F2AA418780D914FEC10E0A67E9716301736C23307BCEDC5657AF
      5E4DBE79F3269E7AEAA9B85AB56A5DE2AC8A52A54A49FF040A8F3D5C0E533264
      C6BE7D1938B299DECD313CBC4A686EC7B163C7BE66FB3FD9A74F9F703E920997
      A59FFDFBF7836B4C711A535E94F72628CEC4B2C422E2383184684C74203A11AD
      89CEECD8C30F3FFCB0F989279E304F9932C5CC29FB20E3AB1392DF83D4A5F364
      6C19A21A519F10C14D49456807D287AD880220F1DFF3DAB18F53F93A869B1092
      AF22298D791E0BE0F4E411C83817981816889F5EE524AC3CAE0EFFFA7A9194CE
      49F186917C98AED3E1C51775FE443BE259825744DDCB1327EA5E7AE105DD7344
      8709137401B2BCBC7A98C1498616E15281244E9C8808EA1852BF3E1E1B320403
      C68DC37363C762C2C891786EE0400CE08A721FF20D635C59D23C9DD155CA4E8F
      6C5F9D19BD9E7A0A8F962E8DEABCEE247119F536D76AE52A6AA4E2702A285BBE
      3C4A2F5D0AE36E53F6BC5E7C80EC4A96DE5524E31AD6A9838A145EC36482975E
      0F9D3CB3F0F65634934FC3D2F8F43DDECF0F15C8578E7B019A318F4BE7520133
      546209AB722F37ED30C4F0A9559AE4E6F6213D61A6423377A89859A314F255A2
      5FC6BFB038C1651331832CDE96E0E6F0582ACBD27251116F4EC09107B09924DA
      CC25EC30F28749C0155C2AA02013057B72C93A892516F3088C33536116A1A340
      3DD79E74AC89C87463D8FEBC90381B5C2A60860CB6F3AD941480823244109B0B
      898900E36407B48E8A754CD351712C91619398CBE3B20FA8E0C6F1E3B8CED1E3
      1513035D7434747C12AC679BBBD5AA8532229C9D4F4B03BA53A7200AAEE5926B
      0BB23DCDB680E679EE395DFD224530F8C927D183CF3EE3D95CC2A49A84A5D673
      FD5B27E0A832BEFF3E765FB9820F962C31FFACE5B7A779D5E057AEE89FF9F557
      1C080F871F4B6BE0F29108D5739382501DC3C6BD7BF1F7C58B38CB26DA6B2FD4
      DEEFB20FEA261BCC07DCB396FCF8234A4544A0241F1584B00FD2F9784747F039
      0FF4376E2066CD1A5C6773BE5733DD2035B4976BF3BBAC4126EDB3C58B11CDDD
      702B962FC75F34FF4D6C12036B220A7442BFFC12E799FEE98A15B891457E9BC4
      5C1E970AB83947B151C03E96F4FC2FBFE03C15784824C7BFEED021DC64134AD3
      EC96B80CDB99222147E81D8396507AA685B29466B6EF765AEFD739724C12CB4E
      7663389A4DB369F56AA8A629740DB80B486429B0167F9F3C09691A3789A002A3
      84A9F82F090BB8EB4A884BB81CA651950CD87522A761238275F5DF98BFEC4091
      222570E9D22D0C1EDCE33D4A1B4E3839B991B18F74D944F6C285F9FC2D735DB9
      F314FFEDDB5784FC208782C0A50217190FFDCA9342E283828A0BE9248782A0A0
      0AFEB51AC8C80964498FBBA84110E3DD897C5D5E359078B16DFC993B8088E9DF
      BFDFE876ED5AEC6107BFC3F047842896346FFA859FC4D9B91C45B41474649569
      446A2070B386499493532B83BE742BC4AFCE89DCA3C8A50266FA5FEA4673D173
      34A2B80AF61AD15D4A294D21F4FE311A73B8E96A34A4D78229EE2C1735A72130
      6F938C3CE22E6C6A1F31E6B19273C6F4081B3DB25BD141237A161B3452A1F8A0
      91BD8A4B78F4C8EEE11FF67743A3B34DCD6856A926DA966F8EBDD17F7A50D912
      BD08C90B17B63E1C05DE2598FC4B0DF22E5A37CAAF58B528BF52B5A3FC4A3788
      F22BDB38CAAF4CD328FF7251B5826BF644B996CFA1A7FF63681E390835C2DAA1
      546851F0572B4F0517B6751B049D7187B77FF1004FAF006E754EA1A992CDD7C4
      4C30B9996074F384D1C31B461347737A02AD811B084E77C3C5D89BD879E1272E
      CA73A0E9A0ADBE53979D3BBBB6F51CA3B7FF689FC0D26A1F7BCAF50B7CDD2913
      6EC155A04BBA013D5F24813C219317A058C46C8317CC7CF3E593D31BB0C8270E
      3712AF23212E09D883EF8D63E77E6FB6938DB62576F34D9463F0F12906372F3F
      9813E3288B2BC18121488F3D4FFB280326771FC0C0DD836E3C91F5A4A971C84C
      3A0BD3B5E3389D9D0CD0BC6115B84A8E08EA07A60F6DA730B9A727AA06F1659F
      90D27CD1270966DA2D7157CFC023B404C3E948BE739535E12AB74F09523DCCC9
      7C5871FB0CD2EF9C411A95479EA6F0B32CEE05E21A01E4F44172F45E249CF918
      3E7EC5919C18038359873B277F41B649C7F52033622F9CC4B5E347E0CD5A21E1
      1C3213AEF18DA3AB484DB888E45BA770E5D461FCB687426F119E4411C25D2A41
      2AEECEA9CFF9526120526F5D8657504924B1B42969F1BCE90EC6CDBFF7E2D6A5
      E308ADD100E99949B8F4FB065C3EB60B178E6EC7A90307716CEF056CFA1D9856
      1E53B9FF157CCD2416EC6BD23132DF887C7897EE81F88B07E06D4A44F28D7348
      8ABD0A9F925591147D0909D117E1191CCE870EE938F6C77A6C38590269DCD1E9
      E35E0A65EB7541A55A0FE39DFE5391716AE36B005E83DDCFA8F9753EB561D4FD
      A05E388CBE780A01DCC804EE4CBD78FE344C41A5F8302806972FFC8E1F9306A3
      66974EA85BA3028A04CB8CCD87125C99D3190D9A28076A5390919E8CCCE478DC
      894980A95803BE5391804BA77E872130026ED9AC71F46D24559B8D17A27AD804
      649BB3AD7ED7C225D1A6009EA5E0D5E053D584C9C76721F9E2767896EB83CCDB
      BF20F1FA4D78359987CAD53BF179B1C3A81619F9C2A640AC398DD354613C0412
      8E3BF52D426BBE0AF7906ADC302C3185834D4196ADBA8E027CCA75571179A5AB
      C47C0E360534B0F261BBF7249B827B2DE1DD54DB29B81BEBBDA5E728C82CDCE8
      28A83A635232A75572572A2A13083DFFB033AEFEE63B7CB9F4AB7F586C8E3863
      F4A1559C2E7322FEE37C39A5EFD871144BAFAED4A4F9B9EDD8B061737E0CF669
      390ADAB69D69DEBC5994D8A7CB335075F513DBF0BBAD5BF1D4CC99F3C8B00D5B
      B66C22BDAB53974CC5959696A34C45580E72BB26E3EC0EEF6365AD5415222DAD
      0D9A376F6FE1C8FF98A3203DDDA502B9B57CF7BDF74C135E7FDDB4F9E04153AB
      31634C2DEBD4194FFCD862E448B300919131E8D8F10B621072FD7284D6AE3DDB
      7CF8F0F3B9D25570D0B469A6CFA74C517EA99178844AB3697E6BF32D63589AEF
      3352E56C67321F9AE5D44625B93E88604949E52185109792D37CFD742D5AE8D8
      7C7C38B25B29C9119A9292E3975C76B07FFF5E9A4CE0CBF4002BBC79137D858B
      1623DE7A0BC31F7EB82F76EF7E8C49CAE5084D4DCDF1AB24BB838BB95C2E9232
      B908FCC93AF9C51731864B93D348B9341FCB28E5729AA8803550B9721DA4462A
      8A3571138F5D610BA4C0D51704448E3D34254AA05D61F36E16FBDCF7E1FF1F54
      C075B3BC0A2A8BA479A5D9C79B191070EB327D16F73F58038BC27FFCF8AFD740
      8D2A55EC8C9C7D5E2A6C77C8E2F2965D304FAF9C742A312DCD56709B8709EE84
      4B979196E6323ECF48BBF340AB414B32C7738DE27B5257AE07DE7B4F9DA4AE12
      9DE25C288823D30A4247B8724519D98C28984B4FB7B58C5683FC9E0C77A6D434
      A2304E9ABB0B3358760AD2939F93C9529AEFA7FC9872A5C5331C48C8DDB4907C
      5187A9D2741EA4E2C42FB420705DA85EBD7A7DF4C20B2F942A88844183063D3A
      78F0E080BC788DAE12B853A43B9F190F655ABEA5E5C35263F9F2E557721FCCCF
      E46D4A14CCF19DB4E3CB972F37F7EFDFBF637E393A77EE3C7CC58A15E6471E79
      44CD71AE786DC3C93E913588E5D356D9ABB2DE3E3EB79FBB151670B30D5FB38C
      BD903BED6EE17EEFBFFFBE594AC7F70F16BA62AE53A7CE8B524BEE3D32F3FD85
      F9AE7824CE650D98B08C3B4460E2830276B64B5B89A59F2AB5E4D371D987F419
      F314DA8DE1F37933DFA230474545DDB6CF5DA54A950F3EFBEC333377E498F9C2
      E275FBB4DCFEBC6A207C1FECDCB993F658AA6CC70AF4F1F1192A912CB99EBBA8
      9E95974CE49D912B57AEB86C42E115E8E4900F3EE3CB3C8364E57DD5AA55E036
      141D77234C1D3060C094888808BCF3CE3BE05B8CBA7CF223BF1A48BE27B9DFEB
      E4455A6D8F3EFA28F8DACC0A8E7B255C36D31C3A74A8B130DD2F026AD5AA655E
      B06081992536F3AD45D52FACD589FB156C9F3FBC64C992F13367CE34F34D1733
      373A9DB24FCCCF7FB72652791F7FECF1901E3D7AF87EC9A746D2F6EDDBB72F17
      16169E6FDBAB8C3C144841A46FE91D510DA26032987EE62E9D2FEAD5A9875245
      4B1F64FEBBBA0229F8B6D9BE90453B972022A454AB9A65AA3FBDE8C725481CE3
      5EF7AED2F363A8F7719B62253FAB6DE8FCE223D3F02DCC5E6DC3DED7F8959F71
      92263CC2ABA5DD959678AF5260F5158D0FFB8D2F65F679BB84199F7B9BF12E1F
      C895C623B6CCE29738A6098FF04A1EC96BE3C9CB537479997D684381C23001D5
      B8686FC663D6B0C46990B8398C171E89631E9557FC79C17B86771886335307CC
      B0F1BCC8D5CFEA842DC2EA913849B306217924AF1676450DEF2084FB76CDE88A
      576DE9CF5061199CB585358FC4499A16963C03C8AB85ADD4611465E939757831
      85EBDF3C82DF502AA676E667619B0ADB1F242E8D117D508C4759EDE50E0CE573
      38389F2C43B00FD968843B98CCFDCCD31143FE2D79581F6D59E210A6A7923710
      D359BCFD588CC68CB1B9DC0A3C98520D25F13682D08AEBCF19B886271897B72B
      8A2F50847BAF6F633B2E6122197F25EEC98905E2C69C1A729AB7915ACF6592B3
      CB5D03670EC670DF8F942C865EE56824EBB893B308B78FBEA922F239C8FD743E
      C9FCDAD4A449666E126B43A15DB97B56C1DDDDBD2B5F2E6C1D1515D574D7AE5D
      4BF3139053CD3CB87C7DFDC0578B21FB50357077202A55AA045E36BFCB239B2D
      5ADAD51610CFEE290D47359FF6CB3CFA8F12497BF6EC469932116A5720AC3F6E
      1A134B026FF0C7A831C44DE2A19D939B8F8B9ABEFB5DFA6DCE41C1F0B27EDB61
      D0B5DC3DB2D4DCC9175BA16ED920353EE551AFEC60965CB293864D056E4144CF
      9E3D03FC0303030E1CBF5A6E66B93DE60C767FC70E70DFF0236C7D63904C1A9A
      07B977AB5BCFAFF2DE3F2FA0FE80B7D0BD431468A228D09280A07AF5EAE08661
      1547830BBC74C237B438AEFEF405AA9409C3EE55D757FF9D92FDAB26D3414133
      7FC3A395EB86565911D354768CC3CD9CC1C75A598A979DACA8945E6A216179B4
      2BC3D0C73708CBF65C42B362D1D8B639E187935969360592AE32CA614CB86EED
      E3C3AA779977A21ADA75EA81033FEFE0D3BF1C161128C285D71E751A35C5C635
      AB30BEE25F38763660D293CBF7DB264B873EC8D49959A3743E4ED4E189BE8FA0
      619D6ADCC7C2287B69B9FCDC048E8A1C51BB36AE435A6A0A12F43E321BD8B81C
      1464A5C164E6360FB149A5DC32146D9C77F178789A144762F41D0799224725C8
      616820B60F78B67CCB8F2F36C0125A101257500CECDF0F0383F760F711DD8CA9
      7B2E4ED2F239694B97AF483AA8D558F3A7D2E9B2572B3B358D833587D7E14CCE
      CE8031834D240F5973580AE653DF70CACA42526292BB7D0E07052C3CBF8E28C9
      6639140A72A793CEC5637793316F05F21C3A3D2D1DA929C985122ECC9E7CF49B
      C6D5494F5F4F7F096B70E80343260C695C613617A00F4E717B1AB7E0AA611C14
      C667CF26135212F8E0363BCBB6E8224A1C14C00836998E279724F132CB155D8B
      2FE728279A9CCD7C5D4045F2BA007905BF5CC54AC83CBC9D8F8AAF3B9C380E0A
      1233A0CF48CDE63B4D96E83417CB38325A780FAD5E1DE005472991C3F8F1E3E0
      9D9AC867A06E0EF5B748120E410674195C7CD25BCB909F0229B5643973E60C56
      7EBB0E19E9A9D067F301755A46DE9D5C2ADCCB9091A987B78F6565407654E686
      BCB12282CB9429C3AD89FC52173FDE30F8E9A7E1E7CF9D0B3A23FC3C7D1D1438
      D420D8DFC7C7C3E885E0AC78CCFD7A0BE2F9761DCB24F2C09E51941EBE14EA8E
      6B4946CC59BA1631B732B07AD7AF70BB7D11EE3A1342C2F4411646CBD141C16F
      A919A51F76F74444CC6E647FFC0382D292D557AD746CB24C9E1A6C3DB831878E
      C3AC3CE34C4613C2A4597E3221DCE40DB7A040ECBE9058C522DA7274E81046C9
      E5AE2EA99C089246B10C393A8E341A5C9638F15B7C808E6DA34F03F6336232F1
      C015AC05A49D1567F751077FE5495457A7C326466CE65AB9F407BD6C5C1DC6D1
      D38E71EDC9432F3691CF8947D299483EF3A1EFE6D6AB47BF0C3A2140A7613F99
      3D3C3D451017CF5DF5AD85CFAAC012C8E398969AFAEEFAF71F5285B78D02A39B
      9B943C8F2C858B36188D9BB51C4A8B047A8EF975ACD0BBA120351019AB67D79D
      2DD456838B172FDADA5C12EE1562DAD8CBB229C8C848BF57994EF9D2ED3EE16B
      53601FE994A39011F685B529A85CB9AA1A418594E5C42E7D642FCBA6805F3F6F
      E7C47D0F11D63E68AF65B55370D116A925DE2BBD7CF992ADB09C7C2D62642A96
      EA5942F771E4299E45FB47936053C037810A7DA2497388A0DC056B7B7357CA32
      49206C4D44059B192E9013C182AE8B3ABCDC74EDD84754264E44423B2DEEF27A
      DB98DD295FBA792D91B04DC1FEFDBF15E84413C192B123853F316C50508B126E
      B51EFEA8FDCB1217B5ACFF53E6ACF45489AF5EAF66A72F80776C4DA4379884E7
      AED09AE356789513BF1E3C528B46116A54ABE899B87CC053C5023C034A4654F4
      DCFDEBDF88BB16734284D914180AA84032090E749BF38DEF47ED2BD6A6F05A55
      2B7AFEFAE7DAF062145E9DFE59AB76C23FEDCEC991C0049D300B7A8D3D54A0C9
      4E7815AC6D5E8F25774F8C0E1F1CD530E8C8B9CB29472E5C4959D5E5B3E87D2B
      BA54123E9B821603F76E0A0976DF2491F941EB038D765DD9775C096356207C7C
      F9B18474220D931ABCBBE7E0373DD47945E3C322CEAFE480A541C1EE9B358DD6
      02AA440E6D8B1991EB3A54FFE3875F2EEF63F2AD11E4E7F9C3D92B0961EE46B7
      1A41FE9ED1873746B603AAEEC84C513B73941D53AEC9C26FFCC2EA570E08D06F
      0E0CD46F3A772EF35D259D8732658CE3EEDCC96E1F1B9BCD7C4085D3CB522A9C
      5D9EF2549067D0FE74137E217EEBFEC5E6F25B8697F54E8A2F37CA271187E3E2
      620FC7C7DF61768882D2F44412150A8AC7DDBC362CF5F3BB33CE3BF08F361E21
      1B980F51BEC53FEEE511B285F1B7A7B8BB1F7A1CF846E2EF09A2600870B619A0
      9DB436394F03673A03AB6C11FFA647EB539B0EFF9E3D3F65A0285150B73DEEDB
      6FDFC98BD949816FF7EE3FC67FF79D1A6292C9CC43961599562A71D9F44F9C36
      0D2B8E1CD944EFF684EFBF9F49EAE48CB963B834A0944EDCCB143D4149EAB696
      546EB0B822C9C81C2785F1EEDA55E7D5A50B92D7AD7352E2A4209BF7BA5AF6E3
      676F6B5E54281D84F51B7FB1857BB46F68F327AD5DDBCE93EFF47B74EC88D40D
      1B1C943829D06A60CBAD795883CE0F37E4DE5380B77148957663DA5036130906
      346CD8EEE3575F2D42BF83026904C6E5384D41B655802D4538A94409964E6043
      66D69C82B4CA93316AD428057D9B3631367EABC7A906D91919CC6A4DCD45D66F
      CA69222DA941CDFAA8CAB7DE24EC2AAF944BD2729095E5524116875067B6FBC3
      6D1A42A16D4334AE9FD30F4A808BBC4E35E007C79502770310592C88B63BEFDE
      29DC4CD0A93098C68FCF28994B1EB52BA38BDAE7A9208D7DB071AB739328A9D6
      83530D0AA380AB3AE8D0924D20F5914EB50A557714D61AC8F78EB468455D28B0
      AB9F6291050A11C90DF66C0D0A925B586B8A858832D556C0A7DD2C51B6A30B05
      CE4D94C95B7D6B8EFC9AA84D0BD6CECA67237679B538670576A5C8AF89327975
      D484D8A85D5E2D2ECF269219439A47A031DB53239B6FF01A60E0AA6C3CB222D9
      92E44241BE35C8AF8944626262A210346CD458516D885B0296A3AB1AA838FEB1
      8C1A451D7842495375E609D6A65943088EBFD108D20797E7B541EBA6CD10EEE7
      6591E6628F921A319654EBD1CBEB177352528331BB18B68E162EC53140E74664
      102CC2C2763AA7DB5D9DB7F701AEFB3BF4BE73132527AB381385ACDDE1FA446B
      DDD44106355A9D35AF35A408C5286A7F500AF8FA876A0E690A69168D8A70AEFF
      D9F3DBFB55DE7C2398280D8139ADE9CBC389012C969D46EDD8545EBBB03AF1B5
      F0607A42892E84509242BB68E6F89EB8457C463828E8CB08190EEEA4F7E35299
      594E8CAF481FB8BBB780EEEE2C003F6C2B7CF6906C661E14B80D4228838574DC
      622542656C87A14CB3AEA8D1690CEAF67813B5BB4D438D2E1351AA69578A2C46
      B85979E9757406C7A04348CFBD5B1EA8DDA36BB9E9CBDFAD326C52FFD2BDFA76
      2ADDEDB156C5BB3CDEB448A73E2DFCBB0C6E9951BF5BABB4A0B25E7F2E9F7394
      B969D858EE55E8574EAF8ECE07511C19FCC60FB39B2EFEF68BF03AB59BC11DC5
      0D7A7849758C7A188C6E70379B50DCBB46EDE6A1435E988FF947382CFDAB5394
      3B6173C26F0B583D223CA8C4A2236F8455AFD52D994FBDFC4C30FB262727DE38
      B2E7FCC91D3F5C4D8AB99151BC51547070B31EE5D3FDC283A393793E45D4EA88
      693FB8614AD38994F33761992A5BB66C69E4695F9C11250839D57DD069FCA42A
      BBCC1915779ACD757F329B6BBFB3EE0FA64D259E20DA11AD895EC4E4D0F18B7F
      0E5E979A8E1519667C99928E214B1731DE877D626B9DC0C67337BC5F6747665C
      D1616F3F87924DFB047D79F95CF0BA0C73891F52338B4D58BC87193A105588A2
      4400E14FC8745291B40DCAB5FB180BA23330EB9619EF44F3DDBEAAAD18EF4128
      1782A881B34BAE4DCAF4FFF2C62DDDFC3F8F1ABFE41F202C8B37BB4DDF798A1C
      8389D2840F6164C97402FA0D84175192688911AB0E63FA6533A6118D5F5ACCB8
      400E6F3D294251AAC91B3E4B6EA4E0D3DB662C6629DEBF61C6F473E9086BBF94
      0C0D083FC240E4763A4648492380A0D730F9781A5E3A6346EF65070148ED541F
      07C1AFD238CC3A7107EF5C3263EA3933261C37633C31F28F240CDE79183D96CD
      064AD4632613E1E0ACB5F163E4A318B2F93C46FC65669E73807747C6F14D35F0
      FD4F8475C7CBEB6620DDA72892B3698C32499C9907230B19644CC5D10DF3F0ED
      98998CB943480A89CD79D21785DE6B67C38FFFBD957AFB32BEEC36861FE1D8C8
      DCEA2FDF9AA3FFBA853095286BBB45D2B3F982DD01F7A4DB583269392E6DFA9E
      420E1171446E05D24CADD1F58705F02D5A06F222E7B75D4703995BC8CBFD1FBC
      ED479DB70FA1F72133FA1F31E3197E1673E0B25328D6FA33323C4ED422C20877
      3F3F3F2914BD16676D226F206C38BAEC4B4757CA68FAD1EF4C6D407811DCD501
      94418D977EC4903F32D167D53984B5FB9A094F128D88B2843F21EDAF27CDEDA4
      F3C35173E96EB43B605628F79CE42F4B46135F43D50B43188C7546A064EF8F19
      F90C110540188248DD093DE1E4380C758CE44BB2AD87A1094BDF840ABA1ECE60
      DC1344181FEA19B4A99855541FE529CF84928494D88D540490B87656051C4111
      FDD1E25006A20EA42372E46A725726BCADE9F4F24D571EA5A49EA4793505931C
      9D55809C80D5D072C52FA831631739640A91B35C9D030CDFB7930215A3946E44
      27A22CE1C1F94D477AFFCE3A8AA4F68194164078D88FB47F448B55899EC2CDCB
      B95798069999FE07EE7F490BE4DBC9D6712E3C1AA4D8D2810AF76B0FC9995C4C
      D93E6203892D243691D84662237176A336758523CDD349C97227CADCE48EFE6F
      3FE5DFB8ED2345ABD68EF4F24008FF26D428E60AA7F364733AEE5CFFEBC8D9D3
      EFBD3E1F47BEFB8102D2886CC2C9C9D8B58FE40943DB86368ED83A62F39869FB
      880D24C2E5DC17DB486C24B195C46612DB8902220903E1E4EC6B20F92B63DA4F
      6FA3D6436DF9E4DB5882EFF707C55FBF756BCF77A7AEECDF79CB3B24CCAD42CB
      4EC5C26A378B48F0F2F2894F878E02D26F1CFD6DCDE5A1B59FA7F4DB44166173
      4CE796C63E7DF4DC53ED459B6636A21E1904A3D12DD83B2B43BFEBCB83D1B386
      6C24F7DF442C21A50C278DA4ADD443DFB873F5C44CCE943A641E9B39E155FC30
      6B3ED3A4B9C23817995BB56A758361E53CE0465B466C1AB16DC4C6115B07DC79
      6AB10E42C9E54F041045892A4407B199C476121B4A6C29B1A9C4B6121B4B6C2D
      F204CAF540FA211062CB884D23B68DD838404B329424BC0883CC3702FAA52965
      8A2E4DFF6037B19D6843892D253695D856626389ADC5F4101D0F922192B6CC97
      886C540F063ED49CDE640670FB7300D78934C24CD83B692A6F4654A2ED340223
      3E7C0C415EF28FC1805E071F43466AE22B3D66E3E2DEB9A2C083364C2B0CFEE1
      3D78874620E5CA052C6E37819937F5E9D327817D935B38E7FF1235D0E3EDBE08
      2C1EC57F51ADC8F708BC68FE023EEEFCD82FCBABE34714A6759B8EF8E39F8902
      96C4EF61F45F33071E4125107FE13856761D4B053B01A410F64EF803D173CE0B
      A8DE71146E677A40365C48AC7009F5628B9B12AFE18D2E2FF13381DF4B141518
      DBA2E7DAB9F00C2F8D846BE7B0B6D308F26F2352097B27FCD2D97551B27D770C
      7CB32FD2BC83702B8D9F80B09E67948FF4CB67F16597E1CCB89B507B451B406C
      19B169C4B6111B87EDC6261281C2A360BD52B11D10C6885AC4E3CA76121B4A6C
      29B1A9C4B6121B4B6C2D289B0B6C539485D8329A5D23360E104E01D299240E4E
      CF90E4919A94A5BF11F1A4B2A5FAAC3AA76C2BB1B180328C77CBB18B80272036
      4D93036665E3185B0F2383A77546A5D7C9E91923B509222D4B44017846D95662
      637132CC6D175556368DD83662E380B60E3FE4908F02CA534EC7A3CCBC52A392
      F497278A130E7611C716EF13805ECAB6111B07DC35CE8157000594A59C9E4769
      3A4F52A9594EF372DE9052F07C605F700F0719BA1162EB48067AFF01671D21A2
      2480E2C4C671CF3D8A187F7F4E6A42A17A42CD3DF727ED7F28B7B4BDBDAA2F18
      28428412F6699A5FA806B2A819480B0BBDC948416FD2FF1227D5B2AFCA6106B4
      387B6AEFD7DBF154A1FFBFDC6955CFB39ADEB53EE1E9917351A3ED9F27AFC160
      E4E7E9327549BF3D65932B73509E19B48457C73EAA79F9DC25C7EBC2A79B36FB
      1B8768E9B09C8812F3728A9A137B5F3EA357CDC536A1C9B7EE70CDE31D332EE7
      6C8710E95367AF12A2905F13312D8E4CFE84CDB96EA212394AECDBD396AB101E
      C726D232E6AA81167D2FD4D6DB2AB3F4C1E5510E71328A541A0F1C4E3CB29F75
      0E2C90F8E4DF8738462A4EF25A69DE24F2D3D8B7A7F4CA69571762264E5D1D87
      33AE5FC075DD4476EA0C6E3E39C2EDE2EDBDF9F1B8EE64BBDC1E1E099836C732
      B6A5292489A345880DEEEE66FEB3822DF85FE6C9DD6517583F1D214EFA273FBF
      A409C43C115EB140C42F90B0C8F82F8054D1BE1A3B1808B142D2344895C5CF24
      B588789B1E411DD2FF72A7555BABE617F414214209FB34CD2F5403591ED845D2
      089619579A454242F5F40825511BD084FE1743AB6A9E55942B9A364D0B53EEA9
      5AE234FC7FB68BE47AAC15E51FA4962B9A98294887838D647711BF3FBB4809CF
      BBC8F76F17FD833690AB62E68C22E9835C36916490512454A08DA6DC2349E21F
      D845D242CA44144FEE267A601749ABD84FD19A5F46A040B3831ED845EA022FCD
      E5C683D84482FF0376116B9BBF3B8366BA33E82D23277FC63C526598E591C4E8
      836706E3EBF84FB8910E181F993F2FD95DB9FC333DBACE8C3BBCB70EE46DDA63
      55A6E291C8D750C85FDE55EFB3E331A4F1F989DEF01CAE5CE54708E307B8945D
      F4CCBBA8B6D58C12DC4F21FE5C4C79D7A0F63E33FCCE6CC1AEFEEDD0F22B33F8
      9C0B3F3EE282FFAF79330EEB468ADC97EA98E7734D7C94F835B8AEC153671E41
      720C30B8B185D9DD1DB8799BFDF057732D630E4D4ACF36F18BD104A0FDB1414E
      AAE5A29F13B6F8BE88FD1ADE897F6260E4DF2A222D7D36AEDC1C8BCDDB6630FC
      10E1E092F3F90304670552FA6FF6E9E177A91AC217A471BFBB0E37A2DD70839D
      5DCCAD8983646B202533CBEA7326CE0A8E6C9B07DD8568FE41C414E813C3E0EF
      C32F88E8B2E1E6F9268E5ED061C89951581C39CF5E545ADE7BC1F9CAB33D6791
      A98FE1CCD962A85C2E00FB87C4A9A42475E4E12536CD89CEF438B9A404B3539C
      16E1D8C937BD57C0C378C5265CE312AAEF710228072CFE6CAE04ED911C6780C0
      3E4EF31B358F858E677B5B7C4EC7EC06E31927207174493172CD718CD342B914
      F0ED10CBDBB90D35063E04A13791C826F04B24F8C915F1D9908DF838EDF4503C
      B614F1382990C8C2222EEF41C441984B9A9430F2E533C1A43A0B1278D7692959
      64EDF90373B1AB60342B2050815C0726E58AC9153C63DD2F45652D99B4134EBF
      752F605A85B755F4949313812E3395DF7AC8B78928FC3CF8A3F0D74976C2FE67
      3CF4275F0A4F007E8B435624A712777657EA78C4EFAF05B8D500EA561376C761
      2A315650F837F496262E12530847373DA0119A1D69847175DBF3893F5081C903
      EB84A252681FFC59B70B43CAE9D5D1F9F022A37A6503D7583651C2602EF76264
      2232CB2D440C1B8185570F15B338DAAA603E1F909DD3B8759A47A32C7953FAF7
      10E22223F9BE9378F284E7D00FF1FAC46754FAE437F90F929F0C517E57870D6C
      C5BDDC5AB6991DDB110871C5638D732C58D75D99E8BA9F15B6A6DA116134321C
      40DC62E9CF032845B87247581BEA55FF0D60268317114824137184C4F9907A12
      124E244D2754EB55A0A75C0960A61FFF14971CABBD49C9BD99F4C7306017D3C7
      13458910C29F60346A9036249A124D887A4415229810038DC4B216114A5F0922
      8CA07C35CB0A1598186720C41F64A5526B1140FDFC6B0BFEBB34E3FD085F42E2
      248DDE02B8077691B4A5EB8612BB282996FB24945DC4BF972A31808CAFC1D54F
      8629DCF558DBC8E9C4758AB0E53FEEB10271495BB0B9CF077067FF9D3C53D696
      66EF9113AD7909039A87EAE0F1D462FB24F1EBE5E004B12C0A6217B5D9B5004F
      8E7A468D23193B83473E859E67E6D9CBD3D9076C7EB74359F03E790CB17DAAAB
      B8962BDEC5B1D36311E6B7177F8CE4C59FB16F9DF1C1CE9D0968C0A11FCA3326
      937167892DC4379165B5F9C8598194FE9B7DABE07F89DB487CD27949121E371C
      BB08D40EE11FA74C9430603F5D8F6FD41E37DDF986E6E168C497DC6A3F5D535D
      2E5767D11504BC7C139E139F85F7CBAFA2D88C498878EB45B84DE17F803F6756
      76914316B9E09CE06E6502F43BA4B11C0EE17BB28B42438B1A0C4ACC357EF951
      79EC0E7A3B3FAF4AF7661785729A1338C8B206729D07F76617F95B2A6015E948
      7229B817BB8876B23FABA0E43A368844392990C8C2C23B242BCF2C4E2A2369B9
      15D62EF2F2CF82C09516D7357823F2B6C67C06E69BE2A7E2963832F284F873C3
      DBD7726AE48E97B06B0592429C01CE833F0A7F9D6427F2F8B9BB697DE0CC90A7
      020AFF86ECA5898BC414224FE729AFD7E5919A97029B5D541E10257964B7447B
      B9192C1E174727052C7953F2CD20380DA93F3E156F3EF036E9D333ACE9DE72FD
      B6FA2D446F2196E306DA4537809D54821140682470D692E274CCE9D5A21E992F
      3D71152F757507E8CFCD298C528B00263CB08BFCD80ABE845CDBDC481FB8FFEB
      2DD0860DD0CE0AF1D37B6FCEE14CB68AE8C53F5BDEC23F2BDFC46FB96CE267A8
      B730BE17714FCE49013FC8398E1FC956FF7C5EA64C19942E5D9A3B6E4D63EE49
      BA8B4C95F88FCEE6DEBD7B9B854646469AF9E945333F356A266F25E2FE1CF787
      0EEBDAB5AB392A2ACACCBD8FF25D5333FFBEDBEC2E8F388061F7279DB9030202
      CE4BE9F9814E29F54D83C170937D60E62315A9C169B2DC97AB598B1FCE6ED5AA
      95995FE616A1AF53F0EB9428C235D464D8C1D5EF7BA96B83FEE7B7D5EF7FE10E
      6976FD7EE7AFD4EE7D7C26D0B3A203A3D1687C5D9AA75CB972527A11588B0C02
      F16B10858CCE710DFA9D1DD3A0FF85A5F5FB5D1C5EBFEFD967AB753BF2758576
      7BCC259BAE7F2F878B3E7E692FBE63C78E66FE47BB94FE02A334277E4D418C16
      991F2DDAE0FBADC1353E933C725554AC4D38247DCF9F3FAF3EE357A4489152FC
      D41FFF1BD95F3AB894E2B01C8249E47E98C4E2CA77FEB546B56EBF7DC0525F28
      DD74437658EDAFCC29B1375B27DDBE656190233BF3934E9D3A99F9555033FD66
      E964692AFE8DBA997F6D2F25B1C727924743952E077744B6DC662ED170F5CCE0
      6A9F0D09889CD3DE2DFCCD15F07951F240278CECD4EC8A152BEA7EFAE92709DE
      0DA964F024942BFDD006734A72DCEA9B47FA3CA222E4E03EE632D2128A738952
      27677247C6E9F807F024CA2DE6B15B2E481CA394F3E051F2900089B137FF4CBE
      13D3D4A7E45B8D7445C6D487F1B979488BA6F0DB2A5D0E1FF020D5D15083E1DC
      4EE2B474A19247F1940E99FE843EF0D55B701FCBF821C4A36CFC9E9F7398D28F
      07BF072DF0A005EEB505F80723FFFA4964BE5F256D58BBFCEC22A9418194C864
      47590EAE407611A777AC5FBF5ECDC60EB973059C1414C42E12E13FFCF0C35D85
      E7D2A5820FEC22D50C791D1ED845B6967960173DB08B6C83E181E7410B3C6801
      BB16B85F13C54E549EDE02992879E62E40425E76D0DDEC27DB7DF25D7588A992
      CB0E2A90FDE46417B9D224C273DB4105B19F5CC92A68DCFF35FBA9C06B3E9606
      2CBCFD54E0351F2AB8D77525667574F6B68D7D4A61D795D4302DD09A8F45CBBD
      AD2BDD6DCDC7229B9F8D30180ABDAEA46E22EEB6E6A329B8977525D5440559F3
      A1125923BAB775A502AEF97C40256AD2B3525943A2D7C1499C3D8FE471607810
      F82F6C019DBCBF51D07A71B1DC356B09544530D6D59C803255EA00A6646050C5
      B7906D8A573BA154A63C33ABD47C0E1168C8EF6FAC2CF62C4A95E62075E7EDC9
      A0726F21551F8BFE13DE2AF835D9A58ACAA88F70AC310E44A9B0487E702E1D18
      526106520C31E83BF12DC42CD6CF356A19B76FDFAE5FB870E1635CAB1EC83FD3
      69C9BF02326969AEE8A594EBD89FB4477D7CC2AF24B7B61980A72BCF405CF635
      3CFEE2FCECF82FF8477AC9D9936C0A44787878F8AC76EDDAFDC97F705BC2472C
      99AE044BDCA73BBF0C1F3E776853B4E6473442F8C9644A19576326E2B22EA1F7
      A40548DC14F83D12EE4C125E351789474A2EC289337CCCE5CE3F582B4554256A
      11B589BA0293A7A9F1F059432BA31985070225F9EC755AC35988CD388F9E2F2C
      C84E5C85971EADDDA6A7C814D81448B3B0E41728C48B099589228427C1F2810D
      A056EA75C666C659951A0654420037F9F800735ACC4262E669F49AF47E56EA46
      8CBFFEFBF5B2F623533253063F999F9E6EB2364B042CBF3B24373232325248CD
      2C8039253DC588A218BCFEB1B7F141E24E781609C29DB453787AEA47A9DCEA37
      26F9EFE41AF1F1F164CF7136053951EA0B7D12BC9C929292261E0DC1BD823F2D
      1A1AB8B764D187F0AA6F6B0CFAEE194C5FBF2D1E47313AF9F7E4FA1A9FFD90B7
      35919648AAE258F24CFA1D9D092F5C3B7C0775A63D812A631B5DFCF6FD6D7371
      0C9D920FE40877CC907B03932555296093645B82764713CA2312DFFF75F4F047
      17BEBED027D43FD49DA97D0907E7B20FEC3862E9172572E1A037C7257F95BCDB
      1AEA4A9A44B874D2449A12A73E60BB9F71998B915A267AF374B979F41A279F40
      A573043829D4D20B434596C66F53408B6DC7FEFDFB4B6B09AEA854FD6EF8E597
      5F4A8B2C2DBFADC40909094B366FDE3C4B12E484B39E13122C10A4F65240CAA8
      4659E3B54C3605C3870FFF9AF311BEFBEEBB81FCAFE481DA64C7EAA68C193366
      1DFF52914F978063C78E052F58B0A05372723227094D0CAF012653BA945C848B
      2C2DC576C191AA6B91F674E0C0814BDBB66D5B827FFCF8B7C44F9E3CB92D1F49
      4EE35F4F2F95705ED03ADBD607AE18BB74E962E4F9D08A8F1D55E9D7AC5953F1
      D6AD5B069670992B7E5771B6267295C847ED43694DA753410CFFDAB806FFDDB3
      0CF95AF399B3F349C804572E4F05FC4BE98E6CFFF9FC378118FE3B403FB6EF31
      F64B7DF6CF555782F28ACB5301FFA7B43733ED8E8E8E5E4945EB962C597285E1
      423B5B27173A670133E4DBC90594912F5BA115C8703EB471A3F9C4471F990F7C
      FBAD3C9E87C409168C1BFBFDC13EDDBF5BD7B5FD42098BE63CFB40125DE1D8B6
      6DE6A063C7E0C5BF03F43F7302D776EE34178D8AD25D3F7DDA7C6BE62BE9C52F
      ED3644BAF9A6EDEED23E84F91FB729D8B1634781CC9619D5AAC1A724FF3A1149
      30A65C46ECBAAF7075CDB7E6ECCFDF47E95FBE3219E3B8FD1F77BCCA542AD689
      0A722C3B4E138F15C46C39BA70E130F7D32710AABF05E3A5BF1074F90CE28F6C
      83D78DD3302650B819F83BA868DCBA5337174DA5065B0DECCD165A16DE4C2B46
      F8126E848E90FED2557BEEB9835BE6CCA95FFBB74308E1C63963CC2DF8A5DE42
      763A0D0772DD0C08CB9AAE0B4B5B73E6B70FA75A3391507366664B9945293C3F
      B3055EDEDEE83871E2FE4B951B21E94E2ACCB44545B839831FBF33C0BCA368F5
      B3890101D2FED745B0AD063C4BEF6AB630839967B4EEB7259F3F5B64C3727826
      25219B768799E681FC9D8A2905BAF6A7F6943DED554EBF8DBB0EC99F6C53C080
      E6A479C4EF64B648E49F5F7EF16CC8E2B9088DBDC0CF0F4ACD017EA1193E4C94
      36F44A4933F44BFF1BA58C98C4A891AE14081FFFCA2083E5224B2EE7F7CE1484
      265D8581D39DECA13CEF1786CB351E42C8A93F1071FD34642345504636A2DCF1
      38B3E6AD80D334459025973B53A59E397BCF5A5D10D59FD79B703CAA8BB9FAF0
      111FFEF4FDF7CF247FF17E56D9E81BC6AB59D0AD4EC29259CCAB4A4B6AEFC46C
      E16806079C7DB4C5DFF48BAF74BBCA373973D014706B4BE7BE876B8D1AFD2107
      063F68F9C8477B3BF6FEF950F172E7DE0D2BCB3F4FC72792C336D9C9C625CE98
      1F48E4FD8257C1612B57AED4891C5B0D3825FF23668B5CFC45960817D81470F8
      DDD56C910C77835816224BE3B38D225A03FFE1668B56A5DC74D0A0412ECD96D5
      AB57E76BB668726C4DA445D8536E2A33D2C213B3659FC4FF8F992DFCDABDCB93
      500A911B79D680E745479E404E660BC7F7BF63B67CFEF9E7577297AE20E13C6B
      408183F00FFC6C27DA3F20CBA5887F5D814BADFF64A49AF1EC053EFAEAAB1B19
      2E4A14D46D5F3575EAD8BC980DB913AAB468F1C2E753A6D4ECDCB469B8A023E9
      C30F3D14DE8168DFA449783B0D8D1B87C75EBE1C7E392ECE9B792A1EDBB56B53
      6E5912765250A959B3E7BA356F1E46230099FC63225ED9E4F28974FEDD74467A
      BAFAE767494BA35FFEC77AEED8B1615F6FDFEE5DB979F30A7FEFDEEDA4C4A993
      CDD9D96A5945AFD3C120D0F32F330823C12DBB300865BCA44B0905AB5F7FBD3A
      F3B5EE3169D21C09DBC3E13CE8D061C1E4F453E6EA6386AF476A72263C3CF4B6
      2F9D8416F5C243AD8B21AC941F827C698FB1202268D627EACA882665CB567F7F
      C58A228C1B43D89CAD06AD5BCF9A191C1CFA7A64D12AF0F1F2474848307C7CF8
      0F895624C7BBE3FB2F4FE3ECF1DBF2E15B55932E9D3BA343FBF668DDBA35B890
      856A75EAC4D8245B3D4A810837184C136AD78E405090070202DCE1EF6F829F9F
      9BA2120E0C74E75EEC92D8B5E1340EFC724E29916633B9B9C1D3C303DC690BFE
      FD9CD3A8540A780DADD1A54B6336899125F74470B03B8A14F1E6CB5F9E0C7BD8
      C21E1E4654AE18892B676E4384DBF78948E6DFAD0BB196DD429402F6597B4B10
      183EBCAEE6C58811F56DFEE79FAFC31B0D76B8C1889F769C564D945B096F185D
      2BB876EDFA26BD5E46AC0E0B171EB2095DB0E0A0CD3F7FFE016465652A346B55
      5E299011A5299151E5AA89D428E2BDF01F9F7FBEBA7DF7EE1DF8BF516936A1E2
      D1EED8C5EFEDED81BF4FFE81CEBD1BA821CC8E90680551E0AA064AC1B66DE35F
      2851A21FB66EFD7942A952E55453A85C3CE42830233AFA773CF96C43B46A5199
      2956C7F3427CA220CF1A08C3E5CBCB5E4849E9117FFEE6F1D7238A442025251B
      9E9E39E741C9D2FE1835AE25EAD49302589A5A75A064A612392959035B94440B
      A4E1852AA4A41CDF5DB963CD27767E3B2770D093FC6B9001CDD0FF89E6E847DA
      A94B7D942C19CA0FAA1B5943DBFFA2ABB35ED4D1D8C2D2B56B632FFFFEFB7C25
      CC7A70D2C85208BF4508879704E496549A40A88435BF03A5402D2FBD36E7A440
      DA5113A468019508AFE4B549B67A9C14B0147A29A564B0D18228A140C94BE2E0
      9C1564668A5C4BDBDA09B657A8358D306A7EA159D6BCF61A9C147059530D5D7B
      81224885ED148A40154769E227E1C8E3DAB678ECE0A42029214129101E4D8003
      CD47897D5EC92F7052909294E426091A44B894502636A1323D7087BF65AA3018
      D4B095212AE9B9F38A0CA9BD50C1CB3C84BA972EDD45EFE9194A7FA15D764A4A
      74DA850BDF33E32DE24D42F5A550C1381EE42EDF9DF47E5C2A332713B3897FDF
      D93791D2F61F671739D5A0E7E4C97FD0F0AADEF2A187B82CA0C79A4D9B90450B
      2293E02551F9B3CD6608366CD880F14F3D855EAFBC7294D5DFF6EDF4E90E1605
      E39C9F04D2BE513DBF79C70E885F0D4B4EC7DA954BC2325C052240909F5DE474
      1EB0943C95A06653A58021115AA74D1BD46FDB160D69A63479F861FE5183A5F2
      621709C42EFAEDC0813EA2D01E0ED70349A8D0A4C9F38FB66E5DA475F3E6BCFE
      66E1ABA54B3160D0200C239E1D3810439F780243060C50B52C5FBE3CCA96E12B
      65111110FF9F972E5D38F9F3CFEF8B1C0D06CDA3D1F28D1A3DDFBB4D9BD0FE14
      3668F060F41F34083A260A582DFAA0C2B25222717206CB99ECC7FF8E5DBF6347
      CCA97DFB1C14B86E22368B5C8B0B0AE90F5126CDAB4A60777052C0399DE2ED38
      0AE0953E1225923737BB9302B92AC904D7AD5327346DD8103D697F4A33881019
      494699E0083742263D094BBA2890BCB915D8A6662D414A21D5FD61E346B522D5
      929DAD3293C1561A0E5B0695E3C297C58C64BD25AF8AB43BD8F26871520A5170
      F4E851B4A2F01DBB77B36F75A8D0AC994225C6558B8A42CD56AD2043B71E87AE
      D44E15C2C57FF71A34C11A2D59ABD6A827BB750B7AB4674FDCBE7D1B1FBEF71E
      863DFF3C4672440946900E7FF2493C3F2867E88A0237A311CBD7AF8FBD78E488
      83D962D0046BB4788D1AA39EEADE3D7020853C47C1CF129226FDA2A81C08A9A5
      80D55366A40C55577691CB3E607E7567E3304C19E910E67CA485A5934559C1FB
      801D46790576523B81F45FEE4CFADC112C855E4AD3A7776F346FDA1495CA95A3
      11AD57738FB4B594D69ECAD0950E963C9237B73C670556DB66E537DFA8DB57A1
      4A006B254234BF2B5A68BBE8E0AFBF62A04C6C145EBA71630822482379AD28C7
      DAC9D02DCFE12BCAA4E49A4D257E0D4EA3C8233C7CE2B8C183BD1F6AD204CF0C
      1D0A2EABA14BD7AE18FBF4D3183B6408460B78911945C8B01DC5612BA6BB9CD5
      B3162D4A4DB878F11D4DB850A726D26C9B9F7EFE1919FC4FDD458B170B1F3F99
      24F3A7652655111C45D264E297212A7DA3E595380D1A8F841FD845D20A4EB06F
      2295F81F6717390D536DBD484E7D591FE2D98947F837F62B972D43D75EBD90C9
      7523592F4A4D4BC37DAD1749DBC909B487F691C9DD1DD1376F62DFAE5D6ADA50
      53054F3ED5A63CDC9B5DC48C528B3D3B77A26EBD7AAAE43FF3E2A3E61E5ED144
      3959203691202FBBC8E94413CB40040B44C85EBEF1DB80D7E6BAF5EB633F4F3E
      29BD28115AE0F5222989069972A57904DBB66C019FEB23213E1EC54B94C0D52B
      57B06BDB3675772367AE28D2D68B844A5E4D8E469D2E385A0D8461F38F3FE2E4
      C993983076AC0415B66FDE8C56BC0EAB000F159F0D5F443294809FA948157447
      1F7C8FAF242C706A228E1A9D4C5E5283ED5BB7E223CE45672F5DC2998B17F987
      E48DB073FB76758974E735D8D364C295CF638736ADD91C828CC804EEE0C072F4
      A612914E3829D0AA59BF4E1D350C5F7BE51575B159FEE597D8B07E3D4E9F3A85
      09A347AB66927E107C336E3D26F57A05298929285EBF38FFE7944A285C9CD379
      50BA6EDD114F74EA14FC14A7E74993276308A93056AF51032FBEFC325E983409
      ED695D878EF3C5DE337BF058FD7E928CDAD3ABA06AEDAA5C96F3E0B24F347008
      532521CF1A68A348A88E9C32A2C42F5400DE2E9EE7675DC2A7F89D2050B7595D
      78787A808F8CF9712B66B03A2705EC03E61791568E3C88379F2B57A85001E5CB
      95AF18D5220ABE3EBEA855B316567CBD024CEBAB6573A5409DA3627BAE5DB306
      0D799235E239D09874D65B6F29335186A797A717973DFDB8D45959D1C8C848AC
      5DBB168CEF9BF446D257F92AD012577EFD352AB294870E1F46C54A95B06AE54A
      DA595C8C6211A439F8A1062EDEFA70F93314274E9E806F7628A22747DB848B1C
      A71AC82892B6167C4D052B28F4C30F3E5016864C726C3F659479B87B70C9CD53
      410455AC5011656B1743F985E58F4B5883D389A6FAC09ABA67CF1E4C183F9E17
      621DC28A1481CCAEA258D0A86463F0B9A59533877091B7624E88BBCDED03E22F
      52B1E2D8618F3DE62FFEEEDDBBA346CD9A58B76E1DC4DA3E7CE810C65ACFEA4E
      E5BA6048CDA1C433185C632886D61986CFDEDA79E9CF99BB0324AF06A7F3C02F
      2262C2887EFD7C85E1C5175F84745E4F5E0766CC9881CB3CA31B366A84D21111
      EA3E4D78045223999B162E5D9A7CFBF4E977254E83531FD8AFF9F4E8D103CB97
      2F57676DC3060DB8681E80F1AC818EB9955076B650094BDFD8E7258B724E3530
      06074F9AF8CC331E922A4DF4DA6BAFE135A235EF93B99109CF3CFBAC5A015082
      E5BA6087B7162ECC48BD7EFD6DC9AB41946BFE97E979B05EC4467074F64DA452
      6817EDA2A728515027CFD19ECD8BD9A993F94CEC652EE794E733B460019FA305
      F3395A309FA305F3395A70BB264D2C68DC3898CFD182F91C2D8079AAF139DA7A
      574A9C14D02E1AC5E76841322D14F0395A109FA305F0395A553E477352E2741E
      C8128E8E4591712D974EB962096406959349FC9226209B72B48B22994F9EA37D
      A422EC0E4E0AD4459F0C32CE45487E4AC8666F1745BA5A2F72AD8067A808BF9B
      92FBB38B0AA0449A4DECA1BB3E4793AA6A504D944BF8DD6AA26A4B019297C4C1
      393511AF07140F355BAA8C0CD9D3FCFA44F23A4867C04981FD154D1B4D5A0D34
      EA4A891442F252A683735220A5B0176CEF1721792A614D25AF8374069C144829
      44A82648A884ED854B9C84ED6B2261C94B990ECE49014B415E5A0E64D30409BD
      AB124B0D9CE43945500159D9C93C8A50114E8D1673854A35BF3D959A4858F292
      C5C1B954201C22588101A12240A828D5FC0E947C792B98A2D6FFC8C23FB0E5BA
      9B2648D102D644785DF5815149CDE0711495F093F22C855A2F32AEF064241DD7
      24D83EF4D0899FC4954BE89D244BD14E2D628948661659EB1809B36DCDE7763A
      7CC28210DEB22A8A5A21FEDCF0090FE65EC40C750F61CB4B719AB3D4209E415F
      623E74290FA7C4D2075CE5D795AE5E47E2D6EBEC7115C315172BCD83E4BD5E54
      05AF61B19A1DC0F5A2C95C2F32BDD69AE60AF16AEB573145D06A0A5E217D8574
      72CB573099F465D249519321B0AE176571BDE84D7BFD96265A6E112E09B9D77C
      A4F364B4C8C546A85C7044984665AD4820E9B9F38A3C197542056FF0F04FDA45
      93292FA7E40CBC42F0C608EEA4F7E352995986CD74D207EE7F410B38195E5A99
      383CDB10B389578851C402A22F3182B0F7B7629E6AC40EC2C9E99D621841016D
      494610550913217CD1A49A13BFC469E13CA9FD796063A282350C54203C087B37
      C91A78D34A5FE612FF72ABDF2531E68EA5F0B6CC943B5A0B7F251EF2BC2D9470
      5940C6DB9C5335297C8B2D356F8F1B93048557C08C9CFE75F282C27996945743
      5D20698440D2AC909A0BEEAA4098AC797288D4820225623C0F0D897FCF51D100
      225AA06911BF1503B4B8BCA8531FE4C578AFF12E9B2897306967E950FB682D2C
      69F6F14EFE7FBD06FFF90A0AD207524BADCDB536D6C292A6C5B9A40555E0992B
      B716BEAB82BB8E020A9E438C26C469FC660910738931449E4ECB60CFD0C11A90
      528A11A0358735DA8188A244C60848B0490E0FF0A005FED916B00DD3A8A8A801
      B4905B533CEF28708BCB02DB76EEDCB9946197AE4CB7A31300FDCC9CC4EC17CE
      ADA9FE4E4ED8E2B39D89972E5D6AF7F4D34F0FE40B0C9D854AD8C2E2FA989090
      38F3A16A7CA3EA093F0895B02B4E5B0D98B8E5ECD9B36D4895E3E7A8B772753D
      4505AC075E4A958F5733A45658D1E5DDB11555580EE3669F40E6E1CEF6F224DA
      C17C5F397AF4E847FBF6EDAB567BE7CE9DBB8A1CBD0979FAB7964DD655FC3694
      5E628E6A5E14ED9A8661F34F37B073F735E0C2402705367E7A0601584DEC2184
      0E82F5C7BE596BF5E610DFB913E0F5AED90609E7A416CEE752410145D83AB980
      FC856633163A873543418769BE9D62952544FAC0A193435AED3377681C841675
      BCB0EB70327EDC771B31DB1B3BC9738A10692EB09643563DBB91B47B1DA69237
      2F38D500051CA605AE01353B341164586665E54C1506C30B4818FD0EF9EEC949
      0DEE29E3FFDE610ABCC9D914394D04BC004C726AA27BAF812E6066B3FE8DF1F1
      EA01100A865DB561413BF923662E4AE438AF955DE62DAA6D0B8F1A7A0448EEED
      24AFA067F23336499AC73BD4FCDD8F77D0AE993B36EF4903BC43A9404BCCA1F6
      1AEB59A30D562ACA4DF48BE125945ED8D3E628B17718DCBC818C24E07293F7C9
      B086D84CD89C2B055A9CF48F28D32099C4AF5149D720793298404DD843FA3FE7
      6C2FDF6A2A659ED1FCF742B5CBAA96D7C8E7669ADF462B0D1CB88481A24441DC
      F6E34B96BCA5317207B3E655D4C06760CAA31DF83C0CC1356A3C7F70C99206FD
      1E7EB878DF4E9D8AF721FAD2DFAF63C7E2F628E9E353FCA7A347DD436AD62C71
      EB8F3F7E12197CDC25C4061DF759DB02E2E1DE6994EBD76FEBE1254BEAC52624
      208DFB8952B95B2DC3BAEF5A7834C813F3D13412CAF7EFFF6B7242C28F57D7AE
      9DD572D8302D5951239F7F298FFDC1CC17DD748C703769A39201514242EB8247
      8BBB79E30626CD998347EBD6AD3763E6CC10C6CEBA7CFE3CEC7F7AC3C99310E8
      6EF1657E965212B9535CC70B3D8C5C181725EE7C63CBC368849B9E7B1E09E111
      F47AE4110864F74844F3E6B724AE0A1FD1572F550A35B9EF4220E358E261E0E6
      55E3D5ABCA2FABE8520319517753A232F020794820324496F805FA6FB86952C0
      4F7560F5175F481C64915BADF2B2060555227924B33EC5C118B45876FCEF83E2
      14D4890CC508F917079F9E3D7B8E137F41C1CFACBCCBEB76A295FF2ACF871F4E
      9C3871452F117C661054BB76ED3A3B77EE7C955F8E79B57DFBF6E3F88697EC51
      C913FCA608047C0318FC9003240F77F3BFBA69D3A6576BD6AC5947648A6CA31C
      F86A64489932652262636391969686B8B838BE4917823B77EEA0203F0FBEB227
      791238AC65E19C7F2D11C16FE884485EE94B30E2F169D3A6BD5AA3468D4AAC1A
      264E9C08FA2DFB84848BE01799C057E41113738B4D98C482A4223353E637F03D
      C220BED6178C679E19417F007EFBEDD0F179F3E64EBD72E5CA0AA580FF9A318A
      AF67BF999A9AEA455990ED0D0DB933EDFAF5EB7CD13383426FAB5A6565B97EB1
      5A369AC9FB822346BC444BDCC0177E9293A74D7B61D2CD9B37E729057C23711A
      DBFF95ABD661CA1B10346DDA0CE7CE5D51A5CD966F4588E63CC001C2DADDC01B
      6FBC8F4F9E98856796BFC8770BFBBDCE269EA214B0B3666EDBB66DC2799E85D2
      0F6FBCF106AA55ABCF262A581F88DE1BFCA4C7A8512FF235CB00EE370AC5E0C1
      3DDEE117825E509DCCE7F77A0E31E90BBE2E1926FC7CA264E4D61E3FE52FE8A1
      61C316365691290155037A66B30663A2A36FB1FDB2B07BF70E54ADCAED87FCE3
      65EBEC41BB945C50A39A1E2D9B4681E3C70FA15BB7BE4CB3B8471E693E87BEB1
      1AC7BC8D1B378EBC7A358EE3DE0B9F7DF61ED30AEF9E7EFA655B262A98CFC028
      D544F498D2D3F514EECF5160848CE7B7B89FABF92CA07A29A0011111C4FFB8BD
      B003ABB7F2DACE790BD9BD017F4B136E9AF928A672CB1CE5D83B9304A40695E9
      E9471427347791E7C314BF1780AE5581161581223E40F14060C9D6F7B068D327
      30C4F7E7FBB0018AFFFCD2C130E974D318605178B4B8CB245FEA7990873ACB49
      17100B153C3CCCA490F6BF934273274342DC6568042A16AF007F1F5F8E145F4E
      15DE1C085E9609CD92C7921F98C71C5F12695203D21CE7C3BDEE89A74FBFC11A
      4CCA89CDDB272511213C17DE64DE9799376F66032F126EA1A1C2308E07B99017
      06E324AFC860DEBB3A5F72142B24240FB3FC0F3B693E0795B4937E6244416D22
      B242F6173D2D1E5730E48EA49D3499FB8BCA726F51A080FB8B02B9BF2890FB8B
      02B9BF2890FB8B2C68DC3890FB8B02B9BF289079AAD39E5A9B5B96849D14707F
      D168EE2F0AE05C52D0F7F403B9BF2888065775EE2F725222E78128B241EC2469
      37EDA2AF1EEBD254918D3262CA4858D2045A26EE2F8A603ED95FB4588BD3A893
      021A56B425008E6BF5189D0F71D4463E119C5B8908913DD702EEBB8EF8DFBBBF
      E8CA4F27D17BAA2722FAF8A3DA138168343410D33FF1E135598FFBDA5F14139B
      FDFFDAFB0EF828ABACFDF34ECBCC84F4DE0BA12410402248EF0490AA202A2002
      2A88B22C9FED73711BABEBAEAB8BE8BAEA82CBBA2A58B1A0AE8A0AC8521408BD
      2B104A808484F45EE67B9E3B7987994C1240DD6FFFDF7F99DF7DDE73EEBDE79E
      73EF7DDB9DDB5E59F4A659EE3BD04DC68DD424EB957A39F77EBD6C79A9413AB5
      F791FB9FB1C8FA6D5655953C6FAC5E569B3B4CEE1EF268CF38CF013C151BB64A
      7E510F5930C22489916649C0C393272DCE5F93F9E31D985C699515EFE448CFCE
      7E9839ABE12D584F3B4879D1795DA649D75E7B3FFE03F8E56E3B28776D4C9789
      23AD121362121FB3880D9B8355C3021EB0C2879C7F9026672FD4CAC6B56619D8
      4793F7BFF8A2ECD8B66D8B2FAA6F66E348BD04A145F552175526C9113E525553
      2F35D52225E5685D23358B88F56E98B5892FA85EEB278F7E795AAC79D6664B80
      FC20859B632B99E5AC45EB2E3EC9074D78039AED46890A314AA7584D3288184D
      BA47E0DD10A649528C8F1CB55489B1ACA8E5CD18DCF43317B88734CC4169C0D7
      F5B0641E5930A322837D514510AC075018A96631C0FB5844AA1C46C18A7E9516
      411E0EC93DFC1452494D76B35C38532E98698FBB0E320DCE992720F0381DFF3B
      949662C2712176E9B0B551699D31178FCD1A60F491C0F6727A578538EAF0AAB4
      6852C7B3CA08805548F0123CFC6D83746D0890BA90C0CB33A0CE01CA608FAA91
      84E3BB64E3E67AC1361562F2C1B42C843347A83135BB230F75F5CA071532E1F6
      ED62C6C24FA6857D0F47598F8088B4B487678D1F67DBB96BAB6CDCF28DACDFE3
      2BFE7EB192108596850D971D8C68C077791AEE66919406B3CC98142E565F9B2C
      5FB5AAFADCFEFD4FB82B6449DDFD923E6142D19377DF1DB06AD5DB72FC64BEA4
      24779706B947F26C21121F2AD2C6269257289293EF9081D73E2D5306DD290151
      B8DAF027B1F7CD3717ED79F7DD2077851E06A64D9BD661EDC18387C664F4C4BE
      15E5121F1F2BD3B146B64DA8BF649788E496164A2DFEE2FA5A7C24A28DBF2405
      617ABAC5AA6E3A036E8C6EE3C6957DFBC9271EEF6656A96EB02336871C5C792E
      177F898295F2DBB0D8AD7DBB7612151421BDE2C3D108EB2037A6A74A66FB24E9
      128D5D51AC6813A1BA984B5CDBD2DCBC6B770399D1D129774D9E300D2B57EA85
      DDFCF810A4EBBDC0970D95F0BDC0BF493AE5DC2282F1CDCD2FE295A64A101616
      F7E88C19F7FAFF7EC923C2F6CD92F7DE53CAD10053F1EE079E6477BFCE639DFE
      05F04B8102E06780B3D547063803F0046D07DD017C5FC7A66805122F02FEF54E
      6B6AA2D7BDF72E47581470B96EEDD77FFEF3932D097BDD68313D7ACC5DF7E73F
      8F9C3A6244CA949123536E05BD99C8CC4CB969F8F094493A860D4B2938762CE5
      F8850B0DB13D7A44E76CDBB6A93923EE57918AE7EDCE35F835F843CE3FE5F86B
      8B9D802AA41C1B145694954919FE6C736D5431D6473101723F026986F69833E7
      21FA9BC2CB00DA37EACCF392E4D3924D155E96AA2B073713FD8C63734657B6F5
      C51733916EE8B577DDE565C4CB80FE464387917A99B7668406162E5E2CC4F08E
      1D33B7AF5B772BC3DCE165802D033D879732326DEA54997CD34DC28510EC98EA
      DAAF5FBEBB72F25E06D8EFC34B8B3713ABA13523AC36F688F9DAED12161AAAFA
      99A8D41D5E0658021A6029680475AB365EA8C354506EC8802A947AF0BCC31B1A
      35F1A250FE8606266D0C7512D7A3C2E9E54E9375787C39DF9234A2878F193448
      F4DFEB58084743548C0CA973C5CCA05BC8CB80414FA4535C72CA0095531A5B25
      4A1D2E4D7C8745F0915A89C5D2BD07EFBC5317F7A04CEB11008F09F070CC05AD
      F2E9C8FFB13762B53BBACB94CCD2A54B857E7A5825842A012E5F86312DA93BA8
      CBDDAFDA36CC398B4C23F8EE043A9AE628993973E60836595550018D07569532
      86F9C28D412EE26500B95061BA11DE64C4BDF7DEABF668A151E217F3E6B994E8
      8C9E56F7937A55112F5346D00AAF9237DF79470662B936C3DC813E2659F6C413
      7227BADF18CE12EB69E9D7C18CEABCA22183076FCA5FBBB60F3D6E4D21BCF819
      826E9BFDFB6531EE5E7C4818AD6B763EF9CBB09B6F163F7F7FE93E66CCE68275
      EBFA3A259D47AF123434AE7267B4BB75968861699D3AC94BD8DE6CE68C199298
      98881EAE00062BB8A755013818010F678E8DBDEB6777DC11EB11088FD604D762
      095F7E7E3E7A5C82C43F2A4AF08D65F9F32BAF9CA93975EA2588BA9C9E315740
      7D6D2D75B9FC3AC3EA62C3B70E01B5B893C3A074029E4383478C90243C2622D1
      CFD15C5A2F0315E5E55ED5069D42AB1426E509E595A4DF8CA494692E2DD330EE
      228A8A9A3540012A6702522F231468262DE5197511A5A5E68B1E6F8ECA79E298
      0BF5AEC05DCCBD2A94A266D2525ED7320B0C3B8BC6A2E38E14DE2B740D0DE791
      E27D80EDA2BF81AAAA2525A6E0C0AE651FD01FE2F476D1EBAD2979059159C027
      0079106F87F3F00AF0299005342B67F04EA642C2FBF6ED9B9A94949482759671
      2AA49903E2E271B3B5EDD3A74F1AA2C3012FD79A011B13538957AAC600C4C531
      13C88C1541CD1A40B8A7C3CADC6F4243432F60234247E7CE9D1DE481CF3DA584
      EB613FC7A3FC0265284B1E0FC06F9ACA799400F5F8456C6C6C646FF466F1B99F
      9CDC160315DDD8208EC118C37B7A62F0BC5262B0163928353555BDE93A774E0F
      C2E73D22A1C323331E06F0D288A0010E4E405868A073E72ED41B8337D71094A4
      18392D86DC6004D280A4A676848128494FEFC29EFB488413204EC77BC6C9398F
      F3F079FB1018319E3E7D0AA31EE5525454869EF75A1F0CB9F8F4EFDF5F517CBA
      CC07E23E6DDBB6C5C044891AEBC9CB2B909C9CD30DF9F9E70B11F73CA01C6F48
      C5341E38FC4B40A9438DD3545454A9280E029D3C79D2C593D1FDE45142A6D1C0
      13204EE7E141D0A1010306A420A7C663C78E22F7C58073640A71CAA18E15E581
      43617E7E7EF84FE70FB9528C211CA83F72E4D077A8C28E8C27DC0DBC83B7D458
      344D2C51781463FC85F10AA8327486FB43919FFA5BC5D12802A34C6A55BBD5EA
      0303C56AAF1DA4AB41693F8491494C6CE0A111913D7AF4B0702FA8F0F030F522
      C1652746A349B2B3B305A37A6A8DF29E3D7B147FE2C40925836FBEE3920D572D
      8DE4E4B69296D6D9027D518072EEE7208A6FA9DA5A7D0FD35A35505187611618
      A857D238B8571156B91B39F6A303F3EE701E34D9B2655324443D1D129E78E081
      071C73E7DEED983E7D9A63D8B0618E1123C638468FBE49FF60BC4702D4BDE3C1
      071F74CC9B77AFE38E3B6639468D1AE91839720CD28CE77EFC273C84E9818153
      589EED983367B663DAB4298E2143863832334723E14487AFAFAF8332EE60D8FD
      F7DFEFB8E79E7B1C3367CE80E24CE07AA4194703A7DC65150F03A7F1B50CC7EC
      D97739A64EBDD581FD94518A51C8D58D0E0C887A19C0F97130432CF18C19B743
      F170C7F0E1A390660C0D9C564ADD0F307076FEFCF9AAB8B7DC32D981CB154632
      9168BCC3EA1C3E7117E7D5E3C090A4CAD06DB74D730C1D3A04A5CE449A513470
      561776BF8A0CB8B470191AD044346344CA1763345C876F411B986D3C3D899352
      963797E09D65341AD5588EDD6E431A2B055C7A5D0C420D4C60C06A34F63DA00A
      94B0D56AC195E155432A8C46507275293BE5BD0D98A0587796FD681632018D14
      1515EBE14A99CBD3C830339457CD178341DD648CA25150DE0B209E1B01FC3A23
      23C3C4169AD9EC8CB75A5945768CCA1EA391452A45E30119F975776C9A81F383
      DE49674384F23E3E36250FB1C700F446F2E8848577251E17E8266E83C7823F1E
      0F81687B0653B953C2EDC89C3AE503947C40803F640380204A3973084E03FA03
      631BD111D4CB21B7D950B80611FACB2413FC7020519AFF1D42F087040DF404D3
      01A0F218508611605D8EED9DA3F0118C4B06DF1668DA7EE2D540E4208E460E53
      B82B3C8646984119463FD82B76BC9E69A01629C91360FF858EB975AA0F0CFC29
      18D763167C4B6E2D1EFE3C1F2DC57B845F3460B7FFC1515EFED3328F682C9D84
      BF02E086557FFBDBDFE489050B9E81F74BF47B7E067A4967724954552963F5AE
      002753575525A5E82B2A45FF11F7CE612634A351430319EB5C1B2E69442975AA
      92A77029FEA4AAD1E34E2A1B3DC1730A86E36B1603C5DA902E468950FDF1F55A
      2EBE17B757CAE42BC90CDD2FEDA450BABAFE33CAC51288F3A633362AD3490566
      7F04DF59D94BFC4A6F95B6F25CFF4E65913D53CAFDA2FD30086E2E91624369CD
      F6E3F6411FEF09B8095BD17C2A1F86BE2E12B00FE979253995C243A72E4D5EA7
      3A18B8EA08067E428EFC2CA65BFE8CF15DCFA6A546E484D597045A8BCE773614
      E5861BECBE79D68CCE7BC27E3A717D5AC68D9B6748E4C19FC9E86D7D64E82633
      D32BA56400771E5E9175276AB567B71C3606B73F3BCCD2501A5A17B6CDE8D76E
      97D8C38F63AC40A4B2CA478AF3DB48757D951469E78C711D36877619F7C53049
      3A7BAF941574966E6FE131A854A983878102DC22CF7E75C89053B54FABF23D1C
      5860DCA55585EC919CCA42397A1A7FC84F154B55C24772DEF09D9C282D96DCEA
      4239D390A349C2A6C0C0215B078A7FE12D52591C6852AA9D070F03EBF7176B1F
      6F3F64106BBC2631B8B6AA6AE5E0F94AD977A8A3988A53C46240D352CB92FC9C
      1039B4364D6CD7E48BAD538E1457D5697586A85031C58F93B2E27FB85F452FE2
      2A9AE9B42532F1D98DC677CF7C6D146320264BA6E3128091A01CD44B07EC4FD4
      063D57E7C527E3EF52BD3759E46C00E6467C24D2798FC8D676189341FC868117
      E48DC2E7DC4BA0EB56F48BFDBB3519FDA948BE1933364260008ACE41B959C3B0
      136EBD6AAB547FDE4B24EA6B91DEFB4592F789EC8B43DD41A6B4A38829DA57EA
      72AE69D140C9D15C4DBE8362D4AD587663942E1CAF271F28877DD840C71DC6BD
      0A45BABE8F191D67051FF811797F365ED129F8304E94604693596AAAA24D106F
      DE95E2A1B8AB1B121F427C3514E3AC1B00F85CAE3445E4E505C8FDA7F8E2E13A
      28AF44F57C8B819DB745B26FD0A4AACA6870093765122D0E893B2972F0760CD8
      8C45622B240C17C1A46694AAA183485081BAA9851FE54B592972FD6722831FA8
      157B5E2E532091B7EB9B92E6100CF38ADDDF7952351830F92087A018B71113A8
      0FE067C2451021B2B113E47245BA9F821FFA0ACA2AA541DBD7A28199C3331C52
      E5E710B31D756F836250B32F94805A7195D8FDB057148CDBDA8B9C7C5864C76F
      4552D7E20108E5F978166D6E8BC94AC16BDD0DB8F332BE4FA223A963B843305B
      538C5066027C005F280D040D08147479A17A8245FCD245ACA9F8B662A948110C
      EC910AD999B15934FB2E77A5283F221B5D28DA5B7F9CD9A341DA94A024759562
      41EEFD02C48E11BFB89000E910E6A740DE4E63E85293323F91C352299F8CDA21
      E73A2C17B37F2E2A50691C8C63095A0FEF83BA3B66205AAEFBB856BAF6C83004
      87D9B163BE2104B67C1BB3538E116CBC1D24BBD0DE20B99D2BE4704C961CBDEE
      4F6295CD52723F9E944E75DD416C8006347550758D8F74BCF736E931A89F2131
      22B07D441B9F707FE7A33EAF44EA8EE49655371CC92E925DAF6F94C39FBC2AB2
      731D945402977434688154083040A4CF0392FCE40A19B96193DC987548813CC3
      182702190986AC19605A90D61D859221D219E80950C148D0F1C0A446906718E3
      2843591A40F4FF0F8E55E0510ECC2FFA040151C0E53ACE2FBAAF256163D308CC
      15BAFA1D108F4A3178F8E0C15F238D270677B518C071244A8D1DA37DA006E940
      E9671CC4DDF72F4AFF7F777E1173DB5C4958A21F34BF48AF269D366744AF2E56
      2BAB97D5E60EAF7380F131D43CDE909062CE75E53A6DCD08D3229987F332C0B1
      302A5380E8E51AA11CD3228987F332C05CB0B84C704546506EA6F5D00E8F9701
      E68206A8FC4A8C509669A1D3C37919402E208B893210BB2223CE1278E9F30A80
      0188E224E378252541AED0A477BD21913DA76BD600A3987B057848A980944675
      DE83428E9903F1705E06588FBA22452FB32494655A0FEDF07819402ED063E459
      454CCC9C93EAB9A65FE7158532A605F170DE061A4702A9800A5DF4324AD2DC58
      A697017D0F220FE5C893F2B762042298D67EF53B20AC875680F945FFFBDF0151
      8311EE99E2C974F75F298F7FAA1E49AEAE4793ABEBD1306356134EF16969D19B
      7EC9E84FD2ABEBD1D4C005C66F30B66057C0F00B3AD2FD5A5C8FC6C7FD35A8C7
      1D809C3D7B16ABB730533621815E993D7BB6A2973AB08B9F0BB57E81BDB1391A
      B27CF9F2CF3065E8090C8FADE3FFE41DBCBD9B3E2230A2A706E2386B93062E67
      3DDAC18347D57AB4C8C8A804C847301D0D902A44618851316E8782022CF0CFF7
      5E8FA6695846697626AFAAAA137C211D037BD598F0978FAA0B8BF732C01CBBE9
      957DFBF629EFE9D3E73148843E117484985BF873CAD25FB8908B91105F7D3D9A
      1D06F8DF5A0C9852954D018E7C288D38503946642523631086B3B862C81FB96A
      19361BFA28902E2FEFA44C5B361B8346460C15A3CF0D61268CC3248E1D374168
      84E762233692A7F27EFDC621FACA5C73EBD15425A6774E7369C22400C55F7FFD
      2845F50326E480D5DB08BCF8E0C5181A8FC4A143D19297574856419F8EA50CA8
      90C603AB87EC575F35ED7861E81541FD4536E15F891A27D693EA25E0FC458E2D
      FFD7FB961FB61E0D2B181DCB962D13D63F171CEA25E079C0E24D79F660CF1FB6
      1ECD5D394BC112105CDCCCE90F3F743D9AEB1C606D26F5BBA0DF171FDFED0A52
      4C9788E1326FD870C5F3E0C0419DF2AA2A33D6A365355D8FE6320039BA181E80
      1C40395CBE4F28E6D2870BD55875C1F568F5E5E52E691ABF06BE1D005D5303BA
      9F719742290408907F859BFCC66A99FCC6834D5537ADA2A6F197EFAFACCC8070
      868C592EF2D1AC27C12BF7FD0DF45FBC1A435D54AA144949B14C98DD3DFAFDA5
      3B1648FFC522FFBC4F19D1EF7DA7D0951C4B4A3246DFD93D3AE1A6EED141139C
      F82A0FBDCBB7748FC68C9A05BA2A9E649DBF329A74FF6A3CC72F9680A9EFB821
      5AFEFADE19946C891CFFA32A01837F1C04CECC1122F80EAF13FDE318304E5E2D
      C6C997A71C37D7526013B0B4A9758601CDC63595A5BFA593DCF9A1871EEA8349
      317D29E40E86310E61ECE10569DD791940EE5EC25CAEC4ACAC2CBC2EAD4198D3
      F5A1AE823C9A28418CA30C65F5B896A897010876C55E525158CC8F8526D3D941
      DB138A7309C4F5645C464677B9F5D6A98CEB8AB0565D73060C5C939997972BA7
      4F9FC37299F8F0A953A72AC4C7C787332E3FBF007167A8B8B9F40C77A1B93BD9
      882E01F69CA0A5774209F2DDA0181C366FDEAC16AB53065EF55A046DD179E400
      75FA1A9A2F49FCB6C4E1C347D8F45053D1F9E22162312D9DDF4C3B7DFA144A90
      8D219CC0244DD35E6B513B223C0CC07FCDDCB973FD3B754A93A4A42434A47C64
      FDFAF5E52B56AC50208F0DC430792F4DB079834C9C78B33FD30097E7909BC39C
      8635BD710A56E3F4AB4A7C91FE0602D3AE2A39EDEA8E3BF42957133897E8F0E5
      6987140C7CC75952531B67488D1C79A3C36EB7D7204A39F29C15757146D4581A
      F84E455ECE01068E7396943E436AF870353BAA5E4F8B7BA09EB3A26E73CD88BA
      9E068EEBF1CD51539340D54EB2E13B2B98918936A6150FCC06D779421BCAC0AB
      C782E5622121A148AA92AB033CCDBAA69116B68B8C1808D5273041A92B21794E
      5AE20C2A5E4D8D119646DA2C697A1DFF065B73987D30086AB5DAF06722420E1E
      DCC746D9A2C6D4BF46BCD86C58E866B3612E5108E2F7B384BF6D8CF7229A5B48
      0FF04B816E80CBE1BC1C42ABEF4106807F127C47F26ED8057E36B00D68D57540
      6C27A01B907199A02CD3302D92FC1B9C7B157D3FF3CEB6507F79EB9671CD29F8
      6106C62C7F107F8D1628C51FCE8C51B4C9E1FB1BE8BFF841B41E1634B685CE78
      E86D68C842BB4895A8E97DE021D7AAA7A46441EADD43A2D91662BB88B2FE66CC
      DD0810F9F8A9B5F42A7CFF1224DDFF206EF305A2B78594BAC683C1908576912A
      4163C8F7246C03B12D447C4F15974EC6B610DB449796BC28813BF66ABBC8551D
      7C12BA3C8DCCD57651634538894715E1EAB9DA2E72D64B4B4754D1D5769157E5
      347D1F5C6D177955917B00DB366CE37443E0FF9D7611327BD55DAD81FF881A58
      F6D28B8E51634738C68E1BE5F8971478C28DE31CC929098E84E438C7534FFFC1
      C388FE4E6643F54B582F041A801CE00F001F1F202DBB355F7EEAD8B96BA7F4C1
      97B929B51E1F1326D5A11B688B00B6F17F017A0FB011E01FBFF9A04D9D470ED7
      7DB94EC58F1B335652D3D2642F0697BEF8F233870AC4C104D03DCD831B5E041F
      02D0D8BDA0AE04E0E9E8574DFF2FBE5C2361F853DE19AB1F07F4ED27070F1C90
      2FDD4AA197A00B52BD009C005845543014BCEE343004889012F2DA8ABF3BF2CE
      E7CBC0C183252DB593D67FC040C6CB979F7FA1280F4A10CC3A6090883C091C01
      4E0133819B010D70004D9D3675FA14C7C68DFF54FB7C190C46155F8BF50A649E
      78E209B9E5A6299A5E8241E2DC92FD21D09780CF807E80EE68843CA9C2D66DDF
      38B66CDEA456110DCBCC94A1C3862A74E9D29572B2E6F3CF15A53099BD388401
      13807A601A301FA0D365C8BBF0F8EF1F75FC057B27DC307E822C79FA4F2E195C
      518E1B268E47679645DE7EF31DD70A0A568D19A9B7005B011AF83B688BEE937F
      7CA2E2860D1FAEA87EB8A6DB355A6F7C38951B9AAC5BBF4E0FBE4AAFD6C07F74
      0D685752FA3B7E7BFE1E2C93BC0B69BA01EE6E177A2497FDF591B0E7DD03C93B
      9F50E45AC1949F9FCCBC66C8836F1A0D8E3B53121B223AB76F2818DECB24437B
      F81812A30C9506437DFCB9F375A3D307DC3FB653BF9F66EFDDF0F4515D9DFEB0
      D3FD5E74C27D0733B166F98DA0809A8CB1C3A438235D2A53132DFEB1A156BBAF
      D5606C176FF29D30C82ED3C659CA284359A6D1155DD200123C1E1C5017347290
      B5D4D7AE998D98A818E6EF63D115E83429D2DA66CC105B5948605D10D3E8E1AD
      1A183063E33D353515199983FC8A4D462C71432ABB8FC968327A9F3A86F9D94D
      E69183FC4B6B91866921AEDE4EA4CDA2C7CD9FEFECDB33B4EB98CCA82A8743ED
      68D6AC9C7B20FEA96A9F7E71D6F6D5D7E7776D7B73F835AD9EE4E0B6935E1C39
      34BA3024D8C7AC2B611D8507582D1101569FC840AB19D5E582BFCD6C2E2CAFA9
      45692B367E732631EFF01B8BF497BE9EDE835657D74A72BC9F15810E40B9B850
      BBCDC7D47CCDB29A28D436C1CFC6B4E49B97640C505FEFC0A7D5F95AC5344DF8
      E95A52CE385E00A42683866100679E5A35A06946397EAAAC16095B95A3527764
      9F2CAB655A86B59AD060F0D9B5F740899FDD62F4A130D1DAC6D18CF3311B2D7B
      0F96DA9896F2AD1A309B6DCB366D2BC322D206B1351AA9AD63B38949BD51C7FD
      B0EB34D3BAAF8BB1659D6D19255ABD8ADA857E1B5467491F72F29CAFFFD0DE41
      06D42AEF0187D5EC7D2370DEAF38347972598EE4E63BB2F67ED0EF2E1A68B104
      D86864041E608312ED9F17D65797CBE2970AC4EC3019AC16A3C18421182AC435
      8F46972630285595228FBE902B47B2A5D068B42CA472A2D9CB14CA4741F990D8
      D8B821D3A78EEBFCF49F9EF8AEC832D57F616E46F8E05E36E9DFDD26A9C9CEA7
      C591E3B5B2752FD6576D2CC73A4D4316957FF37ADA1A2A27BCEE79281F0DE599
      F1F109FD66CD9ADDFD77BF7BF4E0B66D5BD70627DEFC71BBDEBF4BD234038BEE
      F5B876381A96ADFB6BA4D7E39A465C80F2B1D868E4F95B6E9992B57EFD16C7E0
      C1430E60706E29469D46BB84BE2F03E5E3A07CD99429D3B2B66CD983AD098653
      F9CB503EF6FBEA74A583F20950FEF2B469B767EDDCF91DF6471841E52BA17CBC
      4BE822838B493DF85AA317A5C941F98ADB6E9B9975E0C0696E0941E5AB8C46E3
      0D8CFB51801D06DEFEEEBB7C6C1D3186CA3FD434ED965614B796733DCE333986
      D217C5C4C47C8C13FA19943FE819FB9FEEF3BAD1DC2B64D66379FCE218AB2CDD
      2D7C2F6EC42797FF3CFC55B7B016599781CCCCCC9990BA0EF003C4377146577B
      44DF4EED930D8EAE2986DAB4643FF3D9F3B5F5DB0FD699761CA8928ADC4DFBCB
      B35FDE4DD9262885FF9B356BD6FC0DD4B9F4910C72D50BBB98CCE64075D6E106
      59FDB58F0CE8512F69EDAC5A42989F05AD15691B673225C56265704095ACFAB4
      73A711931EE9941A5B87C140ECFF6B306180DB07D342F365D9B2C51A742A0346
      30CA61D79FBF74EBD6CD8FD3DFDEFE0A2B8093EDD2F31A7F090FB0F35DA06478
      E0CB3324D822A7CE15CBD6DD85126A3902A5B9F8D2C019CCC3C8C68E41E7E5CD
      37DF8CC086934F2B791E0854D10A7C3F620AF9F4F11FCA7FFF245DA2236DF436
      8BFCF3D5F2E892DDB2F783B15EF118D45E892A9ACA08D7E31A55A43180A8AAAA
      96C8303626E8C38EC4D1FE4EC6ED683196637D73B55BC845D65D97AB8AE2E2E2
      26CF9831A31346BCE599570ECB75DDC3F027DB2C1D9A514E55878F15CB9A0D67
      65FE6D1DE9F50026151FC4E63DEF30D095EB7EFDFABDF5D5575FDD440313E66D
      9184843632695C8C2486DAC5DCA41DC44F463CF3F27772F86889BCF7A75ED4A3
      80A780A283060D7A1B136327D3E332D0BB77EFB7314966128A276FBEBB4E9E7E
      CB263F99192F7D3242C4D7C75550F58AFC6657A93CFAE7E3F2C8EC58B97E4008
      F528E0BF03AE284DB06BCD3B5BB66CB989812E03D8BB68D5A64D9B6E5CB76E1D
      BEE0B041FC2207CBEACDA1326260B88CECE727F1D1663975B64ED67E532E1FAD
      2F969B86FBCA5D1383A8C305DD006AE3DD6DDBB64D6484CB00E6FEBEFBAB5FFD
      EA86AD5BB749FFFE8364E9D2E765D898F9B2F558AA9C387BB1A99210A5C984C1
      2619D2C3A2724B253ADC0CBCB763C78E1B19EEBA8ACC6673DBEDDBB364D42874
      6E2CF9BD8C193346264DEA2EF82A2DE75550F67B41950075B6282A2A76DEC285
      8F063FF6D842E9D9B387DC76DB74A59027CEBDE5AE12A81811EE1CEAF283C14B
      4A956AE080011F602BA8091443B0082627BDF9EAAB1F4EFEAFFBE620B79A648E
      1C2B785D62C8DED96CA2112798048A713BD34F1F58A594D48C99E40C7FFCD147
      3E3C70E0C038C6ABCB03F3B6DABDFCF28B5D22A2DBFADEF7F0331216912C21E1
      4912149A20C18093C64B60709C0486C44B4050AC827F60B4F807C6881F681BFF
      28B1B789101BF08FD5AF7E575050B09206D439387FFEFCEFB0E154DFFB1F5E3C
      FAC3DDA532A2A309BBF9E4A3340D90D12424D4574A4B0A31B3BF1E7EA398CC56
      ECABE38FC555F9525D53835D061C0817CC854994A63F671D20549F883DB6AB9F
      98B193404464AC4444C64978440C9E928112149C083E1948C0ACFE708459315D
      3D5A82021331D72B011369E2D5C4334E0FD27541EDC5C7357AA8D8DC944FF617
      C9E82E46292A2CC024B25AA9C596ECB5B50D50128E9D5A0D525C54889C57487D
      433566E9383031015BA261F63E95B54D49C7F910A4C3DA7A0600AE1260CEB50F
      4FD0F59D83B0572CB7174AC08E106D518A76121BD7017B67721F4D3F898B8F93
      F61DDA6322593A1E27E9D2B66D1749EFD25DBA74ED8E6AB300DC95ACC8F57F42
      5D4530341E9806C4003F863B0D25AF021FEA0646C0C387BF15540F03FBBD1CAF
      844AA4E4B37C0DE855F76FAE01D709C54B7F26F2721DE007FC50570A05AA6D64
      04A35C5252D25C4C339C337EFCF8F4C18307A50F1C38307DC08001E9FDFAF54D
      EFDBB74F7AEFDE44EF7434F5C193F64EBFEE3A86F541D800840D80DCE0F4FEFD
      33D33B76EC726D56D6E6DC63C78E7DE4BAD1708B8FE1A6D908C4465FD9929D7D
      42B829E1A953A731F533073B1E3A71E6CC19C59F3E7D4A4E9DA2DC513976ECA0
      7CFBED5ECCB9CB92DDBBFF89F003929595753D736EE281C00B67FDC48913A790
      6F0DFC94D0C30F3FDC9A888A43BB6803E0EA7DC733A54153319738B051700911
      150D39A5CF554558F9E33A1F4AA28503DE1D2DC47806EBFA941546A125F0169A
      2DAA5D443FDB47A47C00EA3CFD6818C8A2458BC82A305E314D0EB84054DB48D3
      C3D92E42B36592AE4CA7546034B65C385C1CBA0A0F8A0CABB691CB00DB45682C
      DD48C53A988206E8274F3CF2C823F8C8D76FC92A305E318D07DD8FBFC6AA6DE4
      3A07C889CB58A3AC8B708F3B1D4F3DF594E83CA94BA809A3EB735DA68C674E71
      F67945E17DEC7CCF3247F84A18A315162E5C288F3FFEB8E27980221217F4C697
      1EE0AA5C4C3DBF154BF4D417DE688898FB49AC8C69779FCB1813E13F840C1F3E
      9CAC0BF33E4B90EBDB2E507E6688CC5FFEF29723B9B9B96FB80C6077BD29D891
      BB0315133F5B9781D6822623DACEF330808F8409FE6050870B1B4EBE22EF1E78
      5C46B75B8077B2B3A65F78E1856FD15A79DD55456C09B0B8ACA247365C2BD575
      155255532177AD8A732922E3E8EB90D9EFBEE361D4623348053AAD6E5DD94656
      DE5AAA8C501FE55D06E8D151535F253575555259512555256C1BE9312814BA80
      0DE851D34CCE73C4983A1C6A6A6AA5AEFA621882947319D02D32F489817B64EE
      EA44A92AAB931533CF7BE4761EF61A7FEEB9E728A6C03ABFFD8D08A9AFD5E48D
      E9252A8C075D9FB3C21082BE8A4FF7EDDB3F42ED808ECF8AF13CCC5A152E7F9B
      0403AAF706427073E7CE95175F78019CD3A1074C28B77C629EB0279C37258DA6
      A5A67E96939333D26500AB45D7E1113DE8A2015D01BE2CE36660EA945B65E5CA
      D79D9138B6D4C28E8B8D5D5F5E5E3E5837F063B78B605A4EE3F0AA6E60043C3F
      56BB08AAA41E874A806D2390ABEEDF5903FA4996ABEDA21FA55D74B96D229E73
      B489360057D62EE2A39C899B62C127A972CF47491EC190D518E07A27EBED1806
      B684E6DA443FFD3855F8DEA8AAAE90692B425C49757DCA0A43D1CCB864BBA869
      9B68E67BA16235B65106D4BB038F7731D7CA07B3EBD8A573F9ED223EBA99092E
      937FF4D147C92AF0B14CE6B61561525A5829EFCF2B53EF0E8623C357DE2E6ADA
      26620B82C667BC11A90CAC9A5BAC0C30FCB2DB45D83CDED50EBADC36114B85F7
      BBAA7E133D3A981B9C7D8F7611368A51B9A24CD336912ECB38024A952CAB887E
      425921D3A54B97F7B76FDF3E5E4F44630CC79B8EA459A0F35565E68EB7633098
      5729AFDF7E411930994C82A6A8EA337219484B4B5BBD73E7CEB14D0D3037BA31
      FCC5529FE8D0ADF1FD4BF93BDF895506564E2F701940179DEA3372194077CE47
      BB76EDE21097CA95AED4DD00161CCA92254B74FDE871312AD939EF252803AF4E
      CD7319C082B88F8F1C3932C675A3B9525D0133FFF3247964430F61C3CB621761
      F365FA9B176F36AA729D64BD1DC3C09600198FA867871F977B3F4954AD3A36BC
      D8365A31AD40C9405665DE5545CDB58B28A9AAA8B1D9D2B44D64329B5527D4CC
      5521AA55F7EAAD3CC90DE8D0B260D6DAF76817356D13A90C180C6C6F91F56878
      5D6D1739ABE4EAF1FF440D68F8A3A6EE38BC202CC78F1F6F1310105075E8D0A1
      0AE63E3D3DDD9A9F9F8F8780E00B19E115BB77EFAE62B80E6C3B61C53FC944C1
      BEACD0730EFF545DFFB76EDE827D7D10E1328048BE0B17226C03840783E2CB0C
      610B40FF08302133B2018B70471F3D7AB402F2F310FE5BC002F091F338E82F00
      B97DAF5DAB28ABB81D7C2E13B1D9A8C1330D38020C40E20450472340241E873B
      8101F8F64457C4F700FF0CB0D262B1F8830602EF03CA95E4575C8B4D63EFC013
      46333104EF8141224AC910D0D5C074E03780EEDE029328D8E818D801DC07D03D
      85FF613560881D302C37AC9584F23C61C91A02E2442D3B45BC506109180BB007
      6069405C6E39B8E7818EC0F5401D404779528589EB25B8F4AC2C2A3F27FD3181
      76CDDB7DE48409A3E16D107B2350062C01982819B9E9075E77FBC0E40174C938
      AC061E031E87DC0250AB2D5C52FB3E2D7DCBCECAAD665F398A7D86DF42B87293
      712C04D2717235AC4136833F0E3C0DCC050A1B711EF443208C72A03700470107
      50153D483EEFBD58CA7B3D25D5C35E9505F3CF9B785E11F503DD9065123EE969
      F963DF67A5E4BA3F8863C00BB266C49BD2722FFEB065C22ABA2CB3543EF02FB2
      A4DF9FA4A2F71FC5D1EF59C91DFC5719ED9ED8E0EEE9FFBCF856D7C883FDFF24
      9DDCC39BF2BD1E130D321DB04BF2330D753207F136A345EA35A3BC6CD4E473F8
      5DCEE8E2C0C40C15335E4F0F03A36286C9A194BEB6B3D9EBEB1073D1F5FEBDD8
      8C5619AB99E5290C828FC00C3033208E0659EBA89747BE9A2B3C67AE041E0642
      AE917AB34DE28C3E720712F7A9C1C75A63864865CC006088F8C58EC0E5878F0E
      9BECF200AE92F6066407B91674CE64D755CB035BEE93DD2ECD8D8C8781DC8DE2
      88EC270526B3F4B5054817EC44DD174A6E30586486D12E77F9B491A9B86F7B99
      6CD206321806C6D6D61552565D228BAACEC9AADC2DB8771B15EBC4C30003C37B
      483E8A5BE067B3F60F09F10F80D23666DFBA60731B0942CE59D7060B2EE4006B
      80386A8C75C5B9B57FAFBA204FEEC6E5C9F44DE165E0DC26EC9F9D20476C1647
      91BF35ECBA98D044DF10DF4809B48648A02D58826D6112668F15639D4D72B273
      BF28CA73FCF7DE27E57C53C5BABFC59B2179B6986323ED9392939317252527B5
      B3E1C3B37AA2CAAA72D9B977FBC16F0FE7CEDAFFB47CAD8737475B34A084FB88
      D6ABAF4FAFF8B8849F7548491D1A1D156B37A1F2B3F66EC9FB26EB9B053B57C8
      1B72CEBBDE55DA4B1D860C1DAC250675D228173B4E22AEFBA96DFEAC17AFDB31
      FFD5A1A57D1F68F30B539AD84530F9CEC762C43BC2884907067CE14AC9334DB3
      4075600B59CD07917C0006834600B140A288B4B324CBE8B03E72B7F8491FF853
      81F64032100F440221801F60C587ABBCCE2FDF6068F21BAD10A01085A3C03371
      0A6847200DE80C7405BA00F4B7034D149168201408C07F341B5EBD26F02D3BEC
      6AA2615484B9A0A019921680A57307C318873F35262376713260B655EBD50425
      57DDFF6E0D706F4DD749D134CD1FE62BF007B00E54398419C004023CD9205282
      F82A32EE68946B8FB03600BFCF5584300713C38F3F279AD61D4C11701F2088D4
      157687FF10F029F00F6017E29E02DCD3F643F80EE05D6031B011F14B40B96736
      5F176465168E87800988B4209775E0E99823D209380C036E016688C8348019E9
      06FA29F0B2887443BA01A0994011202604344061203C638049C0F3C0F5C0FB80
      EEEAC0E441B60A7417E4B3452416A0FB250E6B10B704E106F0FCAF7C06F4D7F0
      BB7ABC6E44401184B6836E00A603BAAB03130C3C8E04C417E0CB80E700BA2E38
      6C04E80C3C109055BC3A20800A5F02A523ED0E81587A00CA3480D63482B9B383
      4F14E7CF0A5204D0518E94A5503CE65268ED11D2071807A52B417F09C4031300
      3A130E45C0AF5142623AF88D00AB1244F2714801E84CD08169DDAEF3AA266E4C
      43CC1EE0252014A0B212D069C073404323405C8EE7C2BFD1F706E8DD50FC1B64
      80E1F0E2AA0CD5C2C1A8E6FB74304B10F916E85250BD14ED91A81BC2CA804860
      21FCC48BE017007F00E816E37008D883F805C064CDA03D2505F20EC2D4495E0E
      E623808E5714AFAC3C787E0EB401B245640910084403F9C00064E4355001AD01
      BD1EF83D3000980218F03A9A05FAAF779A233ADAF5A8D8959696598F0E8E8CDD
      BBD72C9A3DDBF0ABA54B1BDE1932A463EA9933999D0E1D7AD63D3BFB3B769C7F
      303A7ACDA4B56B0FE9B2595DBB661AD19EEC76E0C01A5DD6A433C59191E3BAE5
      E4BC45FFD98484C950BE7A6BD7AED163F6EE5D692D2FEF561A1E9EEC9797B780
      F1E097743A79727EDB82825D901903D93348332E233B5BA587AEC901E7CEADA6
      AC2A416E4CCCB8888A8A9598B7636720BA192BF647443C147FE1C214BFE2E23E
      E8DA52C127C2C3979049683484BE1C290D08D87C32387865A7DCDC3FB8A7CFB5
      DBA744E4E4ACD6CEF7EC79736879F972F489D9F727253D4F05C8DD3DA4547021
      2868EB91C8C8377A9D38F198BB82AF13127EDEFEDCB95B820B0B7BEA19D81F1F
      EF4C7FFCF83D98DD5491EFEB3BCB64AEAB9BCF8407131296BEDBB7EF422866B5
      D93B1D3F3E03B93BF041CF9E779F8C8C3C5065B5960C3A78F045C4CBFA0E1DE6
      7FD5A5CB6B07CF9D5B3FE9EBAF5F4329D390B99791FE9788AFC3A7E24CA9A74F
      CFC63E45F30D9FA7A5DD09CB0F7FD0ABD7430DF8AC2160F8A077EF85592929BF
      FE2823E34E28CF169150287CE79FEDDADD4D906718E3284359A6615AC0445DD4
      49DDEA1C405870255840090368035005D0CF1281558E6164AC3C34A20EB40660
      989EB606279E61A2E11F9CBA4C6F9B368D910464D50D4823BA9F6104C3489B0B
      67981EDFF0EA6BAFE93CE5FF75F81F2FC082BD7ABA28F80000000049454E4400
      000000}
  end
  object ImageListIconsGnome: TTBXImageList
    Height = 24
    Width = 24
    Left = 280
    Top = 168
    PngDIB = {
      2D00000089504E470D0A1A0A0000000D49484452000000180000043808060000
      0013941CDD00007568494441547801ECBD078015C5F23D5C376DCE890C4B8625
      ED92730E0A888891A0A808A82822828848547214C10028E013117340144CA880
      82011410912048CE79D93CDF397D6FCFCEDDBD9B80F7BEDF7B7F76FB74555757
      5775F7F4CCF4CCED9911F96FFFB3E906D46D90381AFC0420AF70F7AF3F6D598E
      CC4CA0D0C169D19C3074E80352A674498BC8CD1E38785866CD5AF42F5442E0E4
      0DB7B470B1D3AA46E39B7E5A6F1529BE618366523C2E488E1E4FA6937F2961DE
      D13C54E2519DEDE580C23367CE937861F59ACFA4579F5E5E325F891D3B76CB67
      9FAD7D0479793B387FEE22F245F6EE3D2A478F9D513CA3CF3FFF89244F142F16
      29BD7ADF4A075E3AB95AA07369FC974D9B75B2405AAF61921859462EBD5C0EB2
      0C6FA5D4D4CBB90AE514F8FB072A516656A61839CA7B39A0F1ACCC2CC9CCCA52
      05187DF7DDB724F9A243871BF2CC371DD0735666A664A4A316923DD45BB66C95
      67E19C190EBB23A7484C07369B4D6C76BB641A70606966515B403B562FA6030A
      99999E9EEEB5B18AD202DAC8092F07CC4C4F8303839C1B4D5B347533858867CF
      795569618F3750D14A5BB76CDFA33A0D824599191975D77CF1BD9C3A7D494E03
      06B6F3871F7F2877DE76B33CF1C440E972633369DBB69974E808B407DFAE89B4
      69D3485AB66C202D9BD797C68D6A49A74E2DA56EDD24D9BC799B5CBC7061DAA9
      93A72F2807E191E18BDEF8D79CE0DB6FEF22B7F5B8416EEEDE11682FEDDB3691
      B8621172F6EC09B970F1A25C4ABE2429C9297239E5B25CBE7C59522EBBF964F0
      C9972E899F9FBF1C39764AB66CF9C348CFC89C76F2F8C94BAA49356A553BF6D3
      AFAB8CEF37BC6D7CF3DD32E3EB6F97196BBEFE97B1FA8BA5C6AAD58B8D559FBD
      6AAC5CB5C878F7BD79C65B2BE618CBDE9A6D2C5D36D358B2749AB1E8D549C6CB
      0B9F3566CF1D6DAC78F74563C2C491067AE460D5EA952294714670B073D3CF9F
      2A839FAD590C630B8D8F56BE6C7CF8D18BC67BEFCF33DE7EEF0563F98AD9C6E2
      25938D058B9E355E5A30C198F7D25863EEBC31C6EC39A38CE9334718139E1D0C
      E7F38C7BEFBBCB80F1A565E34BBBF73E3AA856A3EA2FDF6FF8108617A116B381
      393038CB7863F97463E9BFA61A8B974E3216BCFAACF1C2BCD1A8E92863D69C91
      30FAA43175DA13C6C449438CF1131E359E1EF500CACC33BADFDAC5888D8B9D07
      BB61803B54AF51F5EB7BFBF5347EF871158C4D345E5DF2ACB170D104347DBCF1
      E2CB638D175EA4E191C6E469438D676170C2C4C130FA883176FCC3C6A8D1038C
      914FF733863ED1D77863D93CA3698B861C832361390670EF683BB6EFBCCFE9B4
      AF5A5BA55242689853B232B2441D3678F0C270E27E9791299295C9516D884DB2
      C4C0BFDD6688D3E927863D0BD490058B96C9A913A777C3F0CF403A005DC6227E
      E191A1AD2B56AAB8DA9DBCF218279B0128BD063808A05A883D814336003C374E
      1028110C1AE2412868B807E429673E419E7D1E897CE6D941FF47824DB5A3FA90
      45929AD64FB049BE899DAF445712B539310823015BDE657F5576CDED4F1B4E46
      929671DFEB0B1E9583874F49A394B794E84AA2FB4EDE20D111A1B61933DFB91F
      E52D0E0CC31EECEF274F8F5B2EB77CFAAD8487735B42A508E1DCB973B2B8CB4B
      3262C45DC211AC8BBA5B8014CE37D2A2433D7022761F6726955140D4B0652D9C
      B0B89F652B9A0EECF0F0DBEE632AE7C0917F242D3D45F18589FC5C0112121022
      5BFE3A262D1A267815311D60FB8A9D11B22B97AF8AB868E1C891431823D8C7BD
      1BE03E54D0941DE7639E32C93B9D2E9222039D802EF22E96DD02C86D7644087F
      EDF9432EA726832B5C08F40F9240BF2061050D1CBBACA52C0E30AB6015905BA3
      5A1DC4450B7BF7EE126E47031D6D2DE9A93347168E92EEDDCE9A5F249E3D9067
      0BD832BBCDA10CB2368A2962648787CC1C2D30BB28035BBF44A9586935F4739C
      0BB4651CF721E7B11F3B8F12B222D63434D87C95175D2C0A732A4C4754CA1D99
      5D9485F968F90A65A4698B7AD2BC653D69D6BCAE346D561FA8278D9BD69346CD
      92A461E34469D81400ADDFA88ED46D585BEA35A825751BD494C4FA35D5D59181
      D1E836ED8EB35B9089AA4276EAD737E5FC9E1FC01522C4D69373114D540B9C2E
      87844604A350F6640289ECFD80A7480ACEEFDD28F35E9A2B21416198E7F8893F
      F6523F3F3FF173E1D4885325E63B9291918109DA29E9FF407FA9D9ACB7DA3DD9
      6D070E9D4417D14A36CC1664F2FC4B393A3938304436FEFABDBCF4FCAB94282C
      7A75915C4EBEA4265F975353A5748932B816C8C4541FD938698707FB4940801F
      12DE217B1BB87B48E53AB0270705B1B922E7AA3FA1646969299292968AD30600
      0759988533C3813E77386C12E4EF1287DD8689BFF758371D64601B383C3B9ACB
      E190201CBC68A04CE968128F6138494D1317FA5B77290F310EBB5382039C380A
      D338A18AA8C874F0F7E1D352BB9C7B03F15814EC69C1F92F9E568AA929A8395A
      60A0E601B864D207463B6AEF70D8C5DFCF01070E3D9A5519466E0736193869C6
      3BC9E72E5CA24C1C4EA7D44C489235ABBF94959FAC9277DE79478A152B2131D1
      C5A444F152121116A18C51393E26584AC5044A44889F948C0A924CF4040E4AE6
      CE90DD9EB81EC324A4C4F43AE1DFB25CA1F1DBB9563974714ECE4A7E5BF6BD76
      3F32BC8E98A520A8728D5009768280FF8160631B264D9AB4282323A31FF91A35
      6A905C11B66FDF8E9DCF301C0EC7ABCF3CF34C7F1A713282F1FB860C1922E7CF
      9F177F7F7F8AAE08F1F1F1121616665BBE7C3937B07260F75852F4B5D75E530E
      E8E44AF0E9A79F62F82A532AA26D9361A27EFDFA24578CDAB56B0B0FFB5603AA
      8BB4E0E0C1839ABD227AE0C001494848F02AEBD502AF9C2B48B867158657492F
      0754F0CA2D6282E57953C55AECBFCB81B5E69AFFCFB6407BBD52EA6B1B38ADC6
      A2A3A3E5DD77DFB58AB8EB2B68A1DE889A52AEF98888082F5DE6797551C99225
      A556AD5A0A356BD6141E973438BEAB57AF2E44B56AD584A85AB5AA54A95245A1
      72E5CA121B1B8B738D8D764D78B580D23D7BF6C8B163EE0B11A6F3436868A804
      0505A95AE30027C1C1C1B9D47339387EFCB8DC77DF7DB9147D09962E5DAA5AA4
      FBFEE449CC8B3085B1EAE672A0FB931775EFBFFFBEA9EBCB298F3BD4270D0C0C
      541335B38087F1DA061E99223C9A92295EBC388917707837D3AC3DA72E9CFD91
      37333C8C9703AB8276C00DE7D1552413F756695025109167FFD3017988BC82E9
      E0F4E9D3C251A473B5B3AD5BB76A913A14B33BAC86C8134E4C75484D650FA3B6
      018C0D5CB162C5EC5B6FBD35C823572467BFD300A1323D516464A41A451C4D38
      9B615E94C99CDCF3A2A79F7E7A584040C0F4A25EE57330D0A205D8EEC6DBDF7F
      FFFDFD5F7EF965B26A0133376DDAB41CF463E05A04B305D7C2D8FFBF366CCAFD
      FFC5FB451B5F3DA5EA56B1B5484CC568E1DF35BB5FB4F396325267B648C0B668
      A123E7635B84A3E99ADC2FDA717349D378CA5A772BF4FDA542DF2FEA7AEB6DF2
      C49007D96A2F149F718F97F1DFF6885C68D6486EE8D65D962F7DADF0F78BBEC4
      14D0CB32129B3B45E6325EFC9EBE92D47B8EAC1591BCEE1799C7221E0270C880
      AAE036B1CB0BBE8C57183159CAF49D2F0E8753E9B2A0CD2685BB5FD4E6864E32
      F4B1812CA3C003363728FB9CDD72AACF08399A890BA2CFDE57C7A1E933E6CB9B
      E8225630CFBB2DB81F669E4FD77DF5B532CC68434B7F69B351E4C6B4CBF2A49F
      48ED055F4A48B516CC52C669F4D69BEFC24F93BEEF1799C722DE0A601355494B
      44E3DF34A2E18F4DC33A9BC6354F8ABB39709A45D644B603C87DDD2FDAB1639B
      523E8EF8F8DE5D88B3435616EE0E596E815EBF5F94DD379A8BBD7EBF085D71FD
      7E91FB6077FD7E9148158C072B2A211D04FC0F049C8372B762C0800163211D27
      EEBF1120BF2E5880130198A206F728CA5D6ADCA0871F92A79F1E293D7BDE3515
      D95FF4EAD5AB0BA8CF0A41AE03F3BD6C7A25B41668C9F92FBE84FBD059520A57
      9E70222121212B2137001A01F10EA5BA4E2FD1F4DED959A0AF5B73EC96840D5D
      93C834BAE30868C9C953A64A6ACA65295FBE3C9266B0999C878151963BFCEEA4
      3B6560D76AC591FED29365FE5C61EBD7AFDF780837C3C9B3A04227CD9B37C779
      DA5A07E6E016BC225ED1E69F16F496BFFFFE5B9A560A6C1711E46CA7739D1E06
      B7AB1DA31F7AB0BFD81D7EC3217B8677AFAA55ABAACEB13CF7A6A55EDA08E789
      70BC05F9662871E3E444260E1E3C28A74E9D928716EC64B22423C2C68818376E
      DCD69BBBDD5433282850D2D3D26018D300CB356F5844A44C9A3499AA25172C58
      70844C44A3871303A24A6FFEE1C59ED274D0DB682DEEBE67A4261D5B3D7A0BF3
      09D3016A570297507FDCD0B15D44F51AB594B2FA69436C72FEEC19EA4A587884
      4C9A3C857CC905EFFC502CAA46FBCDAB67F792AEA33E938C94F31D4E7D37C3EC
      7B2A11A60326E024B15CB9728BF6EFDF5F8F69A261C386E9EDDBB7735D387756
      B52A38344CA64E9D26FFFAFEB4CC1DDA49862DFC45CEEDFF35498E6D326BCD72
      006D1B8CC0FB0E705802399C65ADE03EA15B121D5B4CC68F1F2F4BBE392269BB
      D625899CF1691C65D17EC605008E12A1B279ECD8B158D6700CAC8876824412B6
      C91650065698FB0A79855C6350493D11C6730957AD078D856B2F6E5EF0C91E55
      6B1A66F6A913C7840EC17368B3A50EF05EC69136F703F25EA0F193870E1CEED1
      A18A0CEFD756BA75AC290BDEDF9A9793C303060CA8E565C093F0D9026DFCF68E
      55A56FF756E267A44AA9B215A44EAD52B260E5BEBC9CB025891EBB26C9E5401B
      7FA0471DB9BF472BF9EACBAFE5A71D072432AE948445C68A3D8C937949E246CE
      A3BBBC9C7839D0C647F66B2EBDBB3495B73FFA527EFE639F346FD55AF6FD7304
      7BB9431CFEA1BC2376322D2DAD9E2F27B84BE3D5127DA810184F449F6F1EFF70
      1BB9A9556D7961C927F2F781C3D2A14B37F9F3CFDD72F4C01EF971B75DFCB28E
      57FEE8A38FB8E79DEDD6AD5B733859C78D7DF8D001DC29BB57162F5EC22EDC8C
      3EE288CADEC834FE789F467273EB3AB2E2E3B5CA788BB6ED94F1C3FB77C9FA9D
      59927EFCD7A4E493FBC350380A88DEBA756B3AD0054EA464A932326FDE3CF51B
      04F218BC7A47FC93061B2FBDF79DB16DE71EE3C1C79F319E5BBCDAE83362BED1
      F6AE2106F324BC5A2B94AA0170B4D406655FD7054DC29DCA3B9F7AEA290323C9
      78E0810736F6EDDBB73BE41CB6209E4023B73E3245195EFEF946E3A999CBB28D
      47D56A0A353D6BA8069E60BA2A78A2126819200AE06CC20FD4DB010EBB49DA09
      1D75BEFF1955F3B07AFD5AB92ADE9080022C4C44838FF140F3948743160C68E3
      DE5D840CD14EE888886E398CB57221CF6901D3040D11FEC82325A847C36A0343
      FEFF4CA8F4F88D123F644D58A759E7A23ACDCA88EA3CFB9CD419FD89541A7A63
      417DC0FEF2A913D06E96C3D666561D7B93497F3CD4BFCDAAF1CFDCD261C933DD
      C2BE79F15EC7FA97EF0F5B31AB77D7A66D6BAD92AA23BEA381C88EB3BC470D85
      80CF8D1175E36CBFD317B2122523EDD3A5A36F8A29593252F0B3B1FAB5DB61B3
      8B0B89E040A784FA3BE583EFFF9227C7BD7F48764E2E1DD96996DF99D543D360
      D70C7693B330A73F7B3CCD69CF1C33A0479D98F0A830890E0B94A42A25A57D9D
      12D2A67631695E234E2A968C9273A9222D12CB499B7609A570F87B27A7719AF4
      E980194E9BA3ED806EF5B12AC12E491522252290D26C840588D4AB1026C7CFA5
      CBA4419DC4151AD0313B379BE3B8CD4E59B8F8628158FE6BC8E50C976CFEFB82
      542E1D2A211CFD1E9DE40C91BF8F248BCBCF21C958161A18E80A4DF7E459499E
      0E025CF63FCF5E48A91F62BF6C3B7256E4D79D47E48B1F76623AE36E74CB7AE5
      A57AC512D81E0E3979364D32922F6FB01AD6BCCF2DCFCCE0CAEDAB386DF666B5
      2A9790B44C87FCB5EF84F4BBB5B1B469585902035CF2F58FBBA5514DECE8B845
      B3E9F7BFE5EB8DBB16C9E16FBF63592B7C8E222AD4E9FD524BAC179A35ECBE76
      F5A2A2C2253CC85F82B038C36977C8E4855FC84D6D6A4AE9B808F1B75D965B9E
      784B0EEE3E5C56FE9C768065ADC8D30195CA759BF5FC2D6D6A0EEED121415C01
      E1586BC1C51976F9E4DBED72638B6AE2CABC28239E5F236B36ED1995B66ECC24
      96C9897C1D489D518971C523367FFDEA83C6C514C316E0E792CFD6FF89335E0D
      89745D928FBFDB638C5BF4BDEDD8AE836565F7CC5CB5A73307232B9C6D5FB065
      FDFD995B74ECFBA3FE95BA94A8553EBA7EFDCA4172F6CC69695C71AF38ED3112
      E04A955F7F7ACFF6C5EF8E3E69BF8C5BE72E80357AED5EB019BA3C8479B7A0E5
      74977C373CFDA5D132BC64884C83AE9A066227C64812B1E1208DD98C6C3B2D8F
      3D3959E632DF17ECBE844A06E3A4E5C2645AB7A127A4F3433BA5EBC33F4BC32E
      63A541E7B152BFDD582959B986D48C92E7A99717F276E02951C229833F9B132B
      CED0B2620BA9819DEAB21CDC3647767E3F5E0EEFDA2EA542648847D52729C881
      ED4886CCBDE1913D927AE61739F9C714090A0C94D2358748D516EE161CBA2873
      6039CFAECECB010B7000049C3B29AF7F3EAFA2F847D6939884A7C42F385E0EEC
      FA54367C315DB500CB8E96C2018F543E6DF912DA5080721CCE243A3C46EEB9F1
      B1C39272E27BD582B44BFBA44CE52ED2B4C370B50DFC02A42FF43909A03ECB22
      991D9CD9AC17C7DA639C48C87D63E4B6C552D2FB37608B6AE7E1D20E49CE282E
      81F25C90096A007906D6C20FB9514055A0057003F059D71EDD8CB2952AB330C1
      9D85F236C8E3442C1694C75B1B68BE810A0E680401C58004A029D00EE8E84107
      50A65B82D605E24524147000850ADA893FB4D9FC12A01581EA001D5605AD0294
      0358F310507637CB81FD0F067A64378C86CF41C0B5080B616426F03790CE668D
      FEE79F7F06F1077F08CCC0DB073A5110AFF3F953F0912347FA57AE5C39106587
      02E7E860107F45E5CFBD10E04066CB1705E9E06E0155FA209A04A47287526B82
      588BC240FFD693972E7F578661060E0ECC9CC802BAC0EFBFFF2EBB77EF162E67
      A853A74E9EAD41917CF390EF02B08610B1364EFACD37DFC8638F3D2673E7CE95
      C4C44479EFBDF7A081E33F4EEECC67E2CE3BEF94E9D3A74B7C7CBCF08FF2BBEE
      BACB74489906B781E2A944B46FDF5E196FD7AE9D2A70FBEDB72BCA3C2B468C18
      E155CE9AA7323C512E07EC16D69C05A8439A1F7CE950A6A11C580D701BECDAB5
      4BB8AC84CEAC7979F13466CD635A433960422B70F1CCC2850B05578A92949424
      6FBFEDBE93C57CAD57A14205E9D0A183E0CA522A56ACA8BAB067CF9E8A6A3DEA
      12CA01851A34BEE9C76FB180B815EE99F6146E3C2AEAFC9F7EFA49195FB56A95
      74EEDC592EE111259DA7F54835940326B4D2891327D42A9B13278E8216E76D03
      C1ED01AAA81AB2E67FFEF9A75A9DF3F5D75F2B992E4B25F2A41A6A473B74E810
      D6931633959919161A41225CDAC642DCC170E349C9B8F487C61B376E6C96D13A
      A44AC913A91670A7FA7DCBCFA8318FBCA29ED43A7460AF52E178AF54A992A4A4
      A4C8CC9933056B18D5BDBBAFBEFA4A08A584A865CB96789CACAD3A2A206906E5
      4077CB6F5B7E91A8A818398A670932713BEF8DA58BA44FDF07A47FFFFEB26EDD
      3A9932658A5CB870419E7BEE39D30099B367CFCA8C193344EF3B946938C98484
      84086FAC962E5D5ACA9429A3BA85F2DF7FDB22DDBBDF2CDCF02D5AB490C18307
      CBC48913F17CDA5966E702BB87B066280714D20917436ED8B0C1CC6FD4B889DA
      363776EA289FAD5EA3460CD6BFA8DA9A4A1EA6499326AA7B68CB2352443920C7
      0CD6B24B972E4C2AE09EA96CDAB449DE5AFEA654AC505E6D231CEF65DCB871E6
      C6A522CB12E473C24901EE5EA9023C2F0C99305FFADE7683BCF7C52679EEB19E
      6A8373F5D31F58AC5AB66C192951A2841C3E7C5839E3C8CA69985D4D9B1A74B0
      70C78E1DFD1B356A24A3672C921E9DDBC88ACF7E10FF90702957B58E72B06DDB
      3649C04ADA93278EE381DC636A1DD2BE7DFB94136D88F4CC99336A5B82DF0E64
      02182A22A5C11C98F9CA3269DBA2B12C5BB95E22628AC9C66FD7C8274B6722CB
      3B6CDFB6555E7CF145E10F18DE39668AC62722B50D38C01DED381865FC7D744B
      444C71ABF14EC86B6941BB1A356BC9C08103A5478F1E10CB2244D67CF2FD21A3
      F193A09701755DF1DEE8E7971B0346CE366EEAFB84012191005A2C0F309F98E6
      233F16B208C01F600340447A237E076021A23A78C75580866D28FF3F10BC9AF1
      D0A007C6A34D6380C286B52FCD5FD4263F65EE07D6FC312FCE5B684DE7CB3FFC
      48FFD652C05F4E074AFDA79FD78BCDE1C4A218DCAB56D485074BD291765FE93B
      9C0EA9185F45E91614F974E0C4532B5F7CF1156E86DB71A7CB8E839803AB0433
      15B53B6CD2FDE65B0AB26BE6FB74E0E772C94D37DD845B3578AE03B5E583247C
      309DD4E9442BD02AD342018C4F0769788CFB8B559FFF17B7C0E5F2C72B093EC7
      EA27F4BF0DCFABA0DF8D4C3C4E06EAB039E4B6DB6E373B06439B7BBE99F630E6
      F0F5D9457C2CA9478F5BC489E7711CE86F3B909599812E7362BBB81F87F11812
      5FC3DA3A7C7D3A70FA39F178CCA778420EA3C8C1C38ADB1C27C27448C76E89C8
      D63FB6E43B7C7D3AF073FAC91D9C55A3E634E6723A251D0F5891DAD12AFC74AB
      EDCB975F7C99EFF0F5E9202E9657ADA60DC504F82B922BBAB97B773C036577B7
      0215CAA990D3C108F4DFD49C4A79A5D99A8F3EFCB0F02DC0818B2710C2CB2647
      0A37E6F61D5BB0A15DD8D085DF0173B6C0CB70CE445186AF2E5B24074519BE57
      E4A028C3F78A1C1465F85E9183A20CDFA23A28D2F085F163C0F570ED7AC05608
      5385D1F136D3B3CF1D2B004E1FBD332C29E41B80D621CDE528FB60EF5DF05124
      EF001A023E030CDFECC918E2A1EA7AC0C39BC4A703E4CE1D3A58957B037C5EE1
      A5A7870D67DE0C461678B5222F07121D1D27E5CBC557404DBB590A2B16B24E87
      F6FFA3F882227B5E0ACCB8A16307664F64A401E3ACE1B037DE7833F759C9ADC4
      7C378798764072858F2F5EBE28E74F1D970AE5CB5781D17A168D66E06B5CBE9C
      2C478F1F072B5F33B2C06B96919783C513A74C92843A8DA455F3167E283C07D0
      E1D1A913A7943876F81FF9F1A74D94FDC2282F387D652C7FE3ED8F506BF56344
      50801F5BD110E9B2D06D0EDC919191298141A1E2B915BA02B23C435E2D60336F
      79FCC9C725BE7C1569DEA4295BF111AC2C1B377A821C3EF8B77CFED597BCA47D
      1D95C9D9029685AA3BE4E540509006710E764A667AAA74BFE9E6C4BB6EBB43B6
      FCFAB3848645CA1F3B76C8EACF56AF749BC93BCED3018AB0268E27460C954A15
      AB48093C0AC6BB3215CA9793256FBC2E552A57BE70FAD4395E384235EFE035A4
      7CA831DF81FE4F7F18B774FCFD8365E7AE1DB26AF5EA6568619F1CFAD465A5BC
      C4147A09AC0918663E77D7FB20AF02D04016E81E38A80ECA108CE812E033D87C
      4A452641FE30C0F01BA29A402A701CE002A300D073402440A70B40C702C98057
      F0E5600434A6002CC0613C1AFC09807BF4F3A033805E40096018100BB0CC73A0
      D405C93FEC46F674408717C0B0E62066D80BEE0340874560FE06AC41553EE728
      A2B022B496020EC00590672D03C10779501E741D1000F8011B81781171025E36
      75C2860C1AA4326B3700691A2D07FA107010A8045401AA0207819B804A4069A0
      26B01F88028201DA02C1CFBF2A16B181FA01ACE172D0478189C078E07E60AD88
      9401688CF81A7C2B6006F0003018F8188806420127E015EC480502910047C94B
      A017814BC0FBC06D403B0FDA82B60158918BA0C462503A2E074A272E501B6006
      261C48F9036C4538281DB140BC889405D802A21478E6C581D2186BCCCA717B90
      E6320EBDEB21EF1E60DFE79DEBCE1900F20A90330C846001906FC8E5606855B9
      1325DE025498B553D4CF5ED6076BF9EC196FF14357E978A2BBA0BBC2C39B24D7
      7845CE5B93BE5C2BFCBBE7F1C9223B574B66469AFCBAE9478A14AA24D457B464
      EF21F2C87DDD15FF74FBD66F81C9E5C00EA1CF70FADBD1F2F6BBABE5FCE93D92
      917A42E2E26270A7D78D3327F641FEB70C1B3347F67CFCB8CFF25AE8AB052A2F
      13AFA279F4E63212165551A57D45CCCFCCCCF29565CA1C26E7619AC4C8B876F7
      DC2B17F67C218DAA86CAE06E25E5D1AE25E591AEA5E4E12E256410F050E7E2F2
      E00D25A46E057FBCFE2C4B62133ACB57AF2F911F4EC9788F1993E4DD822C2CEC
      C6C3545CDBCD076E33C1E09954CF7B5AF0C61CE4671AA0909BD67C30B69C328C
      0C831BF9C0AAE158E40E039922EFFE535D0E5D08C8A99A5F3AFFFB452CC9BECD
      E44B5250431AE7AD04CA0B03DCEF682D9EBFBCBB08CDE78D40FAF0E8CA95DCEE
      CCD3414616DE6987DB68D667FCAEE476679E0EB230FF44EFE0290A4337006F00
      2AFAEDCEBC1DC03A1A811FE5B0953D2EAEE476679E0EB8C2800EB2301C3DF6AF
      BA051CB2A643BECFC88007046D5FAEF67E11F76A9E2E95C1CC8C2CC9C0AD4CEE
      5C4A80E86AEE17B1F67410083B9272E1B4D4BC054FB05C3A2BA9C9E745DEDE46
      B15C93FB453FEE9191136EE9315959D451FB07147725F78B587355189113E0A4
      29023412200D010DC04DC1778AB8270B6E302ADB2A821106F274C269070F3C7E
      10729BB86EBAF9867EF8A57638D2850DC7E080531B9FFA74C4139176E60F2D3A
      A5432D635AF3DC7604CB1150FF5F0A6C1ADBC3A6B15B3428D77C51296D11B4AB
      E6F392D4ED91FC4FAC4AB5F0D1E68FE771DE7A012552B9A14045863D788FA257
      13ED3A705C3EFAF4739AA880682FA0966081BAC3AF3B0FAA5FC66D36EF555258
      9A8B970C7BCBA8A3E4D4B5BBF3DC56541C8DF81060B32332030BE58432E23160
      CD53728B71E69986DC17366A3BE4EB401929A471EA5A1C986C9E0E58C05604E3
      395A90BF832B315E6807576ABC500EAEC638BBD3EC170BE3BD0D8AD8E7ACB582
      A79CC5AEC97A3BE0B0B340B588698F011A336594139E3CCA4DAB16264F072C40
      836CBAA23066CAC02B99C538D316BB26EBD38169C86380854D591EC6A9635AB5
      30E6B188322A99860A613CFEC3D7A5CCFB4BC481E738599EE88A0853B5F7CF88
      2CBA4164B0570B8A629CBA345E15EF38AA8AD553CE582CFE06C8575DB9D28583
      D140F8CA7E5C8C09B6A0287DCE9A3B222224A45933A9FAFDF70AE429C3814855
      DEBB8B0AD12DACB9AA08B6052BB5E7965B94E100BCB08AE9949D3B8532F284E9
      80C7720AAE354C079E134591EC738356FCE00361ED597316264FD94E3C7ACC34
      BA8A4462115700A2009E8F410A0E1B45DEC306F5639FEB6EA1F1CCB3676557D7
      AE590D44FCB4830098E37D1F7F502D039B7FF854E49158F75064795319972C69
      E9222F341519AE85346A4782B527D875570A96A72DDA84C9FFF6A09A817911BA
      EDDA3505F32265D7B4782D1DE4B4C58D613AFA7730D71D14D8ABD7BBE87A1715
      D803052A5C1F45D7BBA8C01E2850812776A594F344A184D7A3FF377BE09329D2
      047015B6F5453A16C1700F18FE06E0F410A4E05068072BA7C9B0E0485986EB0E
      DE1C2CD8B247A34007A8B57DD54C7925B264F08446B77F1E60C7E7723C650B45
      CC1DCD97368C073A5DF251F1CA092DAAB69C1BE07006FA52CB5796670B603C0E
      C67F8AAF7753ABEAAD5F087064FE88970161F5B89FD89C7EF2E7E7B3E5AB9553
      6524F4C2F3F3E07363A150552C7EDD54B3FDE0B2656AF476D9D2D6C346322052
      2EE9095BE9846E11C52A352BEF1F94DEFCFCB1BD8FF76E2FFE77B5936F977FA9
      54BCA25C5D04E3F570A3EDDBA42E4F0685C5C6DBD24ECD40810C806123224C9C
      6DA112E08896B235BBFA97AE71B7FF9FDF0F1F7662DFF10494ED75D353828B1B
      A879422E0790EF44BFFD7EF4AF054901C10302524E7F29992990E6111C012295
      1A3E897BDCF3BA1EDB9BFC3CD41E06CC005B26AF18D4E0227E9E6C7D64E7D9AF
      FEDA30FD7240CC53A2B7AD5F78BC04971923C1A51E94C0D88EF852522531D0B8
      9463D3A46283473008E43EB4A2AA32E489D05E0F97834091AF697C35BC98DC59
      A3F588C0F4B32F897FD483F2F3C7D3B2EC2EB91C1613694416AF1C1455A68D3D
      F5E4543C4E102347769FCC3CB85B16767D521ED2E6F274A015B0834D0D8E9047
      6BB71F1AE80A8892756F3E93895F5E92905F05DBEAE9B87849A890D82E20EDCC
      5772EE14DE00F1876CE93C4C980F15F75211C5E415A13623301C8FFDB26AD6C4
      C41B06A1C795E62E74E556B472D5F17DF24370C85775C2F173869F3F3E4994A5
      1E1C524A8C0A6C01950818BB1B065EC19D9B00FCFC1804076AD3AF9A21AF978C
      97BB634A8A6AC13F3B65C38DC3A419CB10BE4611E5B90083FF8293D3C8781750
      01E920FC64DB143BA44AE3B7A534BCEB9907439566949F038E3082AD5480932F
      5F1B211D67BE2ECE620112886DB0322C464A45C48A245F1039794C52F003E21C
      1AD66041CD6B4AA7DCC3695C53F284D631DE7D566645C7CA9D956A49209ED597
      5DBFC9257C1EE4C19B47CA1B5A89D45A88CE9C10122E501E96B1D9841B361069
      220834A86C98C4F9BBE49E0A3524902367C72F72F9EC05791AC657209F764072
      0766D07020B24281082006280E9402CA01E501D2D21F4E92AD185DA99F4C91E3
      D3064A6B11A17356CA063ECF60470E95E824043C8F9451A0741407AA815E97B8
      C77BA8F1CECAD0382B97AF7194370315D9FFDA593072E85083695682F9D4A33E
      54AE877F670F54192FADE50AFEEC4528F369B50932A008FA4AB5D00EEC36F12B
      1B23CF273C27D3AA8C57CBE6948182A2423BA0A1B1772C0E482C1FFD080E6EEF
      C2891F6505A1480EFC70021E74E3D4C08EB56A77C61365EBE024F28A1DA07030
      FA7C68CD29B2A6E664D91B88375463AD886C4A5E22B7367B38A0778BCE897854
      6D33F4E2259F3F1ED87265577F5686D96D32A65D620D6793AA5D02A3834B4818
      4E97FBD3D7CB25E3A46CB8F48A34C27C2926AC5499E73F5D48271DFE1A2B3FE7
      320481571755C1C6ABFE9CBC9C502660FCCC7B6784B6AFDF23F084FFAFF24BDA
      12597D6182FC99B2064504139FCBB2F1D262295BBAAC7DECED23239C766177B5
      51993922AF16D86D32A146D9A07BFAB41A11B8EAE8243994C213587609E4E319
      41C1736A22B17E9192116B93753B3F4CC523BC58CB26BF656B6673660BAA8C97
      D2784AEC89BB9A0D0D5C737CAA9C4A3B2D7522EA4BDBB85BE5B6D243E5BE7253
      A46E447349CF1289B4874A9BA821F2F6BA39296B36EFD888D364137491776D3C
      3E4C0718D9033BD44DF43B92BE153F8B38E4F6D263C57E2ECAF8E5B78D975EFD
      74D6C5096F3E65D409EB26F14125A47DDC3059FACDA4CB9B769DFC1C4B53DAC3
      78B2C75E2E62761126BBCD2A14ABED3898B21EB51E222B364D4DDDBC23652F0C
      8C1391DF81AD769BD3D92C6280BCFCF9D8E47DC76519F206C2B881BC820336EE
      9EE57F3D654CD9DEDC7861732FA3DAB3B217DD16A64B824F7F7BF7D346CBB992
      8CE1FBAC96179AC2C1472FFCDADB58B6F75163C28FAD8DEA93E41B6B613A6838
      4352AA4C9047ACF282788756886A25C5234332DA24946A8651E7940D7FFC1214
      D55A169D5A2B29D4896E234FA6A44B3F74C96B4C1716D91B59E4D5AF7EDB71E1
      F4C5A35226BC9AF468DA34CA6E97AFFDDB4B088CB9522F487718FF003C671A04
      8F453C0F733B5AED40258F806EE8D27AAE5C7A7BD74863F5C1D9C6A08FABA442
      F631D4C3814820CA8208F094B3023CE9D3299D419C77B0557C46EE499C2297E6
      FEDC33EBF303B38C46D3244D1AA8D94309142B0D9401388D613A0E7C34A01D71
      0EC55641E43BB0A97EC5FA4B038C9403ADE7085BB017AA344C94035F1E2065BA
      38784E69D83A4E5F38D3C8D701F4B19FE1E7293041613DA42676C062E0D9356A
      2E049EB526689872769536CE2EB241A750818A2CC0BE65CD82518AFDADC17ED7
      5DC296531F2AD743117B40F5DBC38F0EA8EDE7F29B9A65F0E7C71C1694867BB1
      8A35274B270CCDB8292E4D7F4A4B4F1BF1E20B0B7EA7841B114B0CFD16F7BDE7
      DEA43AB5EB7ACC31CB02DF52DCBBB0E878D8DF7EFFB5D3D2D7977094D5A34839
      40CDEB26D6A9273B776FC3F51D9E15C04D21FE288DDA6094BAAD5B635AD615C7
      C25D7CFE122B6B71ED648336ECD8161BAFD5A5714239204364E0D4F4E79FDBC9
      7AC0D1E761F325EE0EAB5AB5462E2D2F0BFCF44FAD9A75F0BADDBA9258BB9E24
      25D6C5FB73EA4BDDA4FA52BF6E032F5096043975A85BA7565D74B5577D95332F
      077C0708BFBB68C763DB7CF698BC13BC1313203E276E0565CCA30E755986BCB2
      6A89BC5CB205278E9FC4E7128B63C9159E6EB7F12977F4ACDD8697C24CB614F3
      CD0E7E7470AE0CEF16E011F9DE7D07CAAEDD7BF158B6034FB9E37D093859F32B
      F3CF8C1A2D568C7AFA191935F21919F9D42819F1E453327CF808F1F3E729C2DB
      478E16D8E5E8D1A3D2EDD6BBE4C37797633BE0C5DA38EBA00D32E1D97152D0DF
      E38F3F914BC5AB0536B400234D2EE3ED875DBBDF2EBF6EFE4DB5847D3B61FC73
      3261FC440F9E93F1639F93716327C898D1E3D0B2B1C216F917DC02D6D55D092E
      C9E5FEAB3620F68B67463FEDCEC8271E31FCA95CB9B95B00157B70A87CFAC1BB
      D2B471034C15DDDB62EAE41962C59449D364E2B353E4B90913D11AB464CC38BC
      2934F7B9C6CB0197958463ADCA4A186F0CE3EC320786A9DDEE9011238779E1A9
      A79FC41C9523CD81BB5D78BD01469C0DDB0BF5F30A5E0ED8412B962D91C68DEA
      0B9D69E37C4FC5AC197365F6AC1714C8CF9C365B3D9FAF74D08534CEC38BE4F8
      F372C00D9C50B52A09E0CEA25316E650E59B1E14D022CA98477B369C6579AC42
      7B98F482DB8A978809A823C78666A32C9CC1146AC91C8235858463006B23A188
      804324B372C16B3F60EE37DF7D45724568D9AC4DAE72CAB755DAAA655B69DBA6
      A3746C7783DCD8B1AB74B9E166E9D6E516E9DEF536E9D1ED7605F294318F3AD4
      65191B5E9861B5455EB500FDFBD7E12387AA942CC1F914C5F9036F94100C5E71
      A9D2DEBAB0C39D739796DAC8E094D9D2DFCF7F6166566615A6AF0658CAFEF7F1
      A3C71F5CF1D67B6BF2B2C3BD8593A95250A8063402DA019D819B815B80EE4017
      A00D500FA80C940042001B50E4C042DC5EEC14823C654536F4DF574035138BE7
      6BBBFCFCA6620335C8D504A5917B37D2B30A350DB114C24EF813BE0031026BDF
      7FA798FD89A3A0DFE281FD1F4C4AA85ECB638E5957863F766CEDF4CAC297CD79
      9132F8E890878CB9B35F947D07FEC2AD681C017088404D7030E30181DB53B740
      A9C33367432008064AF03911B45E1D52CA95AE28831F7F585E98F39252562D80
      9E0A9C176DDBA65AA6D270E5A10511F7BC2821A1762E4577F53C629EBD9212EB
      49BD24CC81EA359206F51B4A83868DA511D0B851131CC6B34119F3A8531FBA2C
      E3EFE7F258CA265E0E70C8C049C489C7B6F9E62502EFCAC14984AFB3E42B6DAC
      A0CC853CB70C271C1C3FC8679B76735E5DC479119DA8FEC704E0E8B1A3786F5A
      29B52DC68C19ED2E914F3CE2C92773E5E66E81A756070F1F91966D6F542F81A1
      537E64C48A89CF4DC23979923C3B01B38B7113F03D8A71E6CB0DAD5EBC5B00E3
      369CADF6EDDB2F6D3A74914BA74F899DD3468C8F112373D7CE6A88FCA851CF90
      78C1AB0534FED7AEDDD2AC5527659C9AEC5762E6F4593273FA1C0F66C98C69B3
      64DAB49998694CC32754A60A5BA45FCFC8721ADE2DE00C02B5358C4C9D8F8D8E
      59034E9743873E66CAF2623811CB99E7DD02EC60356A26C8BAEFBE14677098D2
      75BF48DE29F39E7FC90B2F3C3F5FE6CC9A2BB366CE416BD092A9D330372D6098
      AA2B1A38A955A3A66CDCF08D72C29165C3F9EB91C71E122B1E7D6C906A9D2A83
      21CA39949A24A86A65475E5DA40E0C98AA734E5413AFF8FB65E33A74984369CF
      7BFE65457346B08D47270D358F32503667BE571799531468D961BA568D047005
      07EAF2C0C30AE6D4F67660E6428CC0099529CA83513AD0CDEBB8E5D545B4B1E6
      CBCF49AE08ED30DDC9593097830EED3B61DAC12B1BF7B1881B3867216BDA904C
      7C6935030FC781666558B314AF1C6072FBD7E93327AB4445F20E8D92173A6205
      F82A2EECF0AA0CECA082F65D2A8188DB4670CA6C89BD10F3A2ACAB9E17656565
      FD7DECC8D107DF7DE7A3EBF32274F0FFAD70877492BBE59C02F96B543BB50F2A
      5B41F29AF1BA11B67AD4C230FC70FB9A925D8328DB018CADD9B908F1BF2BB05B
      0AD1458F3FFEB803AF478E3976ECB7A84FD67F12C7F435AD5242DB84A80F3EF8
      A0CBB163073B7FF2C9BB37319D9F03AF2ECA4F51E7550EAD5C3A3636B25EA664
      35098D8CACC7B4CEF345B31D14B28B82825C3583C3C36AE079FAF8C8D0F084F0
      F0A09ABE0C6B59B683C28E22A79114111A5EE9525A5AB190B0F04AE99969BC84
      D2F672517534D5D282461166D0B6DB7A76AF1B1A125676DF91BF6CE54A542A93
      9E959144396683E62583B6479AED2059EEEF34B1FFDB144AAADCAF688EA84183
      063109352B940C0E09893875E24C56F54A2191F8A24349CAA17A02C815B21DBC
      2DAB911B0EE4195CAECC7265CA5588C932329C99467A1CD6E2E0DDCCF1D1BB76
      EC2C87423E1DD89151E880E958D552254B0427E305552C44CA34E54CFB42760B
      388AFC4577D11DE056376B56BF558664AD15CB5F850A158D4BC917958414E900
      9BDDF646A36675DF504244B80068BD7EFDCFDF82E5448504F0318AA8446597BF
      7FF2D2C56FC88FEB7E91F66D3ADAF6EDDF8B0222A44C53CE7CEA519FE5940222
      1BE00EF7CAA1D54F2D2CC944A729FD0FCB1229459E604BFC830256BDF1FA5B41
      0E974336FFBE49DDAFE6AC2EA97643BC632A53FADC7357726A724A67AB7196CD
      76E0A38BA8A0A19DBCBA7069505070906CD9FEB324D6A82FC99792A55FFFBE3E
      8DB36CB603A6F287AD6EDD1AAD23A22357D2497CB90AAA8B68FCECA9335D7FFD
      75FB5A919C57CD9014227072EA825E0010141F5FB253EB76CD9357AD5E699032
      4D39C07CEA511FC99C815DE47DB866EB9C50F3078200FE94C5FD242A3434A01B
      468D410A79144039F3A9477D96637964E9808D8C5DDE58FDE74243C0434C052A
      B2000BD24004E434180B5A1620659A72E6538FFA2CC7F250D10146699CF03860
      0E951C60FC0076010D8480A7310DA629673EF5A8CF7250B386DC5D64CD25CF42
      2CCCDAE504E5CCA7DEFF2C0AEEA22B6A7AF6D1D4C7B1E88A2CE62894ED001905
      9DD1A06286B66DDBF2175A335D3053842EE271893B1A69C1868BA841A36D3B34
      BFC4430529D3F999F0EAA2FC149947633C6CF3607763C72E42CA34E5CCF7856C
      070574118DD0188DF270BDE6DB95F8DA5850814EB21DE4338AB4719E70824282
      64F3D64DEACA929469CAE99C7A395B91ED0039BE46110BD9FC5DAB5E9CBF20A8
      44F152121D112D01FE3CF488A24C53CE7CEA511FA6CC907DFC601715E2A43F7E
      DC04A35AF5EAB63F76FE2E09556BCB9F3B761863C78DC9B603D3D6F3B25706F2
      F20D0D9B24F5BEF7DE7B17DE7EFB5D813F6DDE200D929ACA3BEFBC7579C99225
      FD37FDB07999AFC25E5DE44BC12AC32173E7A1C3472E0505BABB889469CAAD7A
      569E875D77DA4717B933B2E3F474C7FE03FBF79EC442A60887CD755AC41E7DE0
      C0BE5394676B7973D95D84138EB1D828C90D9D73DAA28BE08CC7C9EF97AFCC5B
      541B93DF039CFC3EF4E880ADEFBCF961BB8227BFB042E32079061AE979F7ADBF
      5EB8783E223C34F6D4F90BE7C565776EA63CAF42D95D5488D9B5329261DB7CF6
      C2B9B2C5A2A3D24E9C3879D6E5F0FB45C9AF5164BBE1861BEAAC5DFBD5D88347
      F63DF7D5DAD5E39986EDECAE46A2A8818539DAD85A97844AB1D75E7BEDE6CD9B
      37DDBC64C9C25B98864117C07CEA511FC99C81A3C87B5E440D167080A101CE18
      38250941AD4BDF7FFF2DA56E7BE0364E5D38ABA09CF9D4A33ECBA19835701461
      98E498B65091055890063835E189863B42308A93324D39F3A9477D9643B635C0
      018D1302DE92C5263B906617D0000DE504E5CCA71EF5A19E33F8EEA29C5A2CCC
      DAE504E53975FF33697A2E0657A38141C0B5080B616426F03790CE7E1B7DE4C8
      9141D1D1D1486707EC9D66C2CADBF11B83CEB0CA29E3DBCBF0ADB5FE152A54E0
      861F0A99FBFB6891919172FCF871A471F8820116B48246759A4A9AB7CAB52C28
      28882A7D104D0252B9B1F01B0DD6B0C0B0AF0239653AADA9364C4A99CBC50105
      D322BC66F0570E98D40AA41A2CA0794D297338DC3F5AF0534D56B9E6690FA027
      541B9CCE20A5012B25AFA1F398A6F1CD9B374BF3E6CD550F50A6019366F06A01
      156844D790690DCA35CF8F23D138AD90366DDA14AB1370731F3FC55087720D8E
      22C533C36A846966E04BDBF2FDF7DFCBF6EDDB055FAA5786D6AF5F6FD69A3AD4
      D5A00DCA34540B98C90C522BF8BA691AE737B866CF9EAD8C339FDDC2AFE9E17E
      B7FAED4CB740DBD0C6499503322C680595F945AB1AF8A965E4C891B268D122E1
      E79D28FFE1871FA46EDDBA2C26F5EBD757DF8EA25C9757199E4839B0665249A7
      596BDC55147EB78E355EBA74A9D98A8D1B379AC65986A04D4DC913CA01196610
      DAF8DAB56B25158F06F18B7ADCE8FCE8DDE4C9934D07D4DDB469934AB3BC06E5
      9A27CD7323B3F654080D0D2531B161C306AFA16966781856D0C32AA21CD02B33
      48097E8E8C1F585BB972A554AF5E5DD592F9BD7BF796E79E7B4ED6AC59A364CA
      428E887A5691724081CEA083575E7945F89D2E7E2E8E690D6E8FDB6EBB4D7D56
      AE78F1E22C960BD4B50ABDB6019D5081DD83EFB2AB5A324D30AF7BF7EEAA2C3F
      B6A6181F1175AD62B305DC90CC2438FE49091A266521EAE0B44D364F50DF9A69
      3AA0112BA84465CAC85F299483F4F4F45CDD71A586F7EEDDEB55179E321760A7
      E91F131323DC703C2BD1B806B5C9EBD690D7A08CF91A7C6DFB6FBFFD261D3B76
      DC0ED90060371D94063319E8035C8B40E31361681B70800EFCC08401B100CF42
      EC36CA91BCA2908152178193C06900BFEB8A682731107096713560452360C71F
      307703F0CA11059C9D5D2D6847F50223D6F6FABCC8DC8FFEE3F3220E496E60B3
      064C587724CD6BCA9D8BBC558F692D27CF3CC005E0B17EC4145A0191396BB0CA
      731AD1795639652CAFC1E1A478661054E65193BC1594EB34E74521F804265F13
      CE3ED7B30A9DAF0C7A222F07562379F134C279919E5590FEF8E38F6617B39CC7
      B622CA010B3183342728E70986E7E6D5AB572B4394E9A90B0E944AC67294932A
      CB9E483920CF0C2BA8ACBBEAE5975F96279E78427D049272ADA78D53CF2AA73D
      0D358AAC992C6C4D6FD9B245F8F1667E0C95D711E7CF9F5769EA115A571BA44C
      F3A4B95AA00B5091983F7FBE0C193244F851CE3BEEB843962C59926F97B00C0D
      6B7839C8699C279FE5CB97CBB061C3F04AF658C1CFBC326FDE3CE540EB6A439A
      52AE7952D545F4CA0C522BF8ED644E1B57AD5AA58C322F3C3C5C76E2B57E0909
      092C9F0BB463159A2D60060D6830FDC20B2FC8030F3C601AA7ECDE7BEF55DF57
      B61AB1F22C6F4DAB1650C00C823C0D91CF39BE29631751272F50C79A673AE050
      6326410552423BA3AC30A0BE55CF744063565089CA9491BF522807D7E74539BA
      6F3BD213816DC0F579119610E2615F74852307B803734AA4265BD7E745E6B18A
      3B25CFD1E8AE3EC024E07FFD7E11AF97792F2F2A2A4A3EF9E413AFB9D235B95F
      B46CD93274A33BF06608FB98E0BC88F78998439ADFBC481DECA8C882FAE8499E
      78F5D557A566CD9AEAA607CFC5972E5D124E5F382FD2BABA2CF509CA29D3E00E
      A1460133A8A0B17FFF7EC12D4AB9EFBEFBA46FDFBE4A9FE767E65B757DF14AD9
      132907E459D00AD69E72CE24B0BC071F5770093F166F35A8F579B2B2CA594E43
      759135938598A631DE6CE206A6325B42D9E1C387052FFA57ADD6BAA4D421AC3C
      D3B95A40E3BC0FC47B457DFAF4C14F8A582E86E7E5EFBEFB6EEAAB3B5F344250
      97546578A29C692F07BA006B4A7D4EB878D7851B962387324E236944EB526605
      E5D6B4EA226B014EB6DE7EFB6D69D4A811969C736F17B33BDE7CF34DF565FAAD
      5BB74A6262A2D58EC9E77460B6801974C44916B5478F1EADEE6CB1E61AE3C78F
      67969A042BC647441B56B1E9801974C23B8D7C7821E7CD28E6F143F16C1975AC
      46AC3CED58D3AA8B28E0506326AF0198264FD0302965042763A47981FAD63CD3
      018D5841252A5346FE4AA11C5C9F17E5E8BEEBF3A23CE742D6B911F72F5B8EAE
      FBCF26E9FD6A60D69646540287E665D8B17AF13A5809AE30BA78F12296889659
      B578F1E29B60C2503B1A18C137CF7A3DFBECB3EACC65F92D8C5945C6A851A33A
      A3900BC8301DF058C45919A729C8B8AAC023030C70A367726B8357936035EF41
      37C98295CF2B4CFAD733A68CF2C2820601D5FDDA01D2A27E51E22D03264E9D3D
      29A99753D52D045E1B4F993245FAF5EB2777DD7597921D397244C68D1BA77EB0
      E01198E534581E500E9C6054E0998CDDC473C169BC812D3D0D6B65712E669A57
      FC4AC91255A9524566CE9C6991F8664D0734CE2E209DF6E83CDFDA5720351DE8
      B26C89E6AF05F5DA069EAD2F53262C571839F4D5ABF661B6803567F7688BE7CE
      26CBA953C754B257AF5EC21DE8D1471F154E88796EE6B6E18DAA9F7EFA490D8E
      871F7E58CD4454014B643AA0713A61DE817F0ECBE5948B929E9ECAA470BAA218
      449C0C80143A980E58824E48E72F7A82E49AC06B1BE8165C13CB1E235E0E740B
      7E78EA5E213EE8D3D6A376E5C4EC22D69ED0A68E1EFC474E25BBB701F7DEE4E4
      64F58335B7016FABCD99334778E7F7E0C1833278F060E9D1A3872EEA454D07BA
      F6CCFDFDCFBF484CBCF5D65B26AF9956AD5A69365F6A3AA0967632F0C30D4C5E
      13D8AD5678A8B0A6AF056F3AA858B1E2B5B0A76C787AC260C2EC22FC40BA6AD0
      A0419DAD1B9A0A4505CF86B868F906E50CC02BB035FCED2B08D2600F42408B0A
      96A50DDA72A0BC197882A013B6EA5A80C669D374F01F65E8F96A6056964654E2
      FABC48758327F29C19B99133395A28565DC53D99A0E01AC06DD36A88AB6DF4DC
      8673219E06391F1A3E7CB8DC7FFFFDC2532797A250E7AAE64574EA6B2E44B9C6
      55CD8BB4916B41F536306D5DEDB1C834E4617868F0B078E324D65798896BC498
      2D60CD3D8759659A1B940C5745F1DE11799E1AAFC9BC88C6AC7321A635784ED6
      7C61A85717595B5098C285D1F172C06E2A4CA1A2E87839F877B4C06B235B5BC0
      B9106BCAF9102917F191721B5CF5BC88867CCD8528D728ECBCE8DFDE455E0EAE
      E191543734FBA9C6EBF322F4899E3FFD3F322F428BFF4B823AF37BEAFA28E85C
      E04A42160A1D00CA010CB7227A1FC8DE0F90A0F166A0745A5438502E5EF04B80
      07EF81AAE0B5274372EDAE9D608C819E49897122321E60B02122580152247305
      CA09AD13008D74609CB8FFC689C83866827A877B7B8EED745FAF71BF011781D3
      48FF010DEE4020EE00F976E002716FCF319B6EE9F27023E4B416EFBF66BE1CE0
      8EBE6D31A25AD0757CB17659E725CBC77705EFE560F19BE3EAED3BF04747E805
      D9ED8E7A21219173A0B313682DEEBF66205E5D6E40C060BFBFF7F82CC0E87BD7
      E8E3103404CA01618035E0D55F01E1D423A0CB5B33D5A040BDE6A02AF86A0133
      D8B79A668249F600C40C19696929946B016D0520C1B3A459730A215341091BD7
      BF91F73B9500CB6F33C01800C73901D60C5ACE0A50485B042B475026142806D1
      51C056A9425247501552522EFD018606721A875805031F05D944CEE17046D64F
      6C9F009E2DA05DD309642A3C8911F127FB93E875EB939B22C3E33A20A70A100A
      E42A0099BD65D31E95EEBE73D4569601B2B02D7643EE73DD6A6F640474EFF2D0
      43503488DB6F1EF20164E58040C097031B86E8E7D4251AD7EFFC28F46A012580
      00C0AB4C3B085C15E36B97A03271CF9DA30E4056190801BC949166B041EF3260
      F4ED39E61C044D814A4004E0046CEC2B5015CE20CED8B3EFF753A02AD86C765E
      ADB3F64A5909BD233A654DF100BD9186AC74E0027009E0B633AC0E8E436800CC
      0051810668DCAAA7323C11F33DAC221C0C19E04869CB6B141D44860E54204FC3
      34A2419989A45AAD1D3A8121CD32CA28649A7A39805C0583AF082287434064B5
      CA0D4A82A7213A01EBBE530FC69650AD71535015D233D20E83A113026CDEC17E
      F38D0FB6EA73FBC8F5F7DCF9CC610CBBA300F7071E0258CAC50843FAF7FB7A8D
      3D8C51B4BFE7ADC3BF4FA8DAF84EC8AB02D463CBC1FA0EACA93FB2B8FEBF2A68
      025001880518B8D1358D035311A8015401A8E3074A1B2079073BB2FC81508043
      8E0806CFE04444304D3941BD42194659AFC09A10744890B7823242CBBC0A33C1
      8C6260460383806B1116C2C84CE06FC0FD3C1A16680CE29D7408CC801349A179
      ADCB0B18DC62E85FB972656EA7A130E07E1E0D37F1D4ED7B08D48F422CA0C129
      BD95A78E354D5ECBFCFCFCC4B30EA30F649380DCEB8B0EE256F1430F3DA45622
      E4344E635AA62965844EF3770518660847E4CFD1008A090D9EC43A74E890B9D4
      411760E1FEFDFBAB965191695242F3A4AFBFFEBAAA1479E601DC5FBCD75D9729
      5346AD9BB03EC1424778545515264F03040CE492E97CE66978B5402BD000A1D3
      7ACD290B516EA5E4A9F7AF7FFD4B39D4F99413A6032A31936086BE66661A3F7C
      9A8599D6BA1C35D4A38C60394DC913CA01851A2CACBB840A4C73950857E5304D
      3D52CA75AD99D6D0F93AAD1C30C10C16222534CFBC891327AA166859CE7CEA68
      304FF3A4CA0185BE0A534E50D1573EE539A1F5B55C3960821984D59035AD7574
      3ED3BEC03256B9970316FEF9E79FE5A5975E12FE78CDFB132C40308F05C993E6
      859CF9CA018534404AE35C91C625577AE7E12232E6F13080DF19D4F6A0039621
      651E471A792D234F980EA844018DF370419E321678E38D37982C1458C6AAE8D4
      0966D0188EACC261C991C334E55CDF454A5DCA48092DD3B5B7CAC813CA0115F5
      0E3376EC5875DC1933668C709C534953F20581B6AC3ACA0105CC60ED8AD21D2C
      5710784633F45A0A3AB18285ADE9BC78EA699C3A754AF8E819D22D81BF1C884A
      E159BF7A3CA3F1E14E4CA0D428A131B688343FA0BC19CE9C39237C2002A36F3B
      841F03A7D982D26026037D806B11687C220C6D03AEAFBB166E435FD07325F4D2
      BF3970232B174F3D3D6C009857802287F4948CA499B3E66CF155D0DCD190F94A
      CF3BEF163E3C62997A409C33184A70FCF809B55494C7ADF73F7C7B7362629D9A
      5BB6FCB60399598019AC0E94719E6709AD816B05E1BE41E03A498C2CBEEB3A4B
      BEFAEA4B3C7FD949B89A96CB77A1BF2D2424B8EABA751BFE026F066E0C33A16B
      CE45C3EBD6AF93EFD67D27EBD6AD13A6D723BD1EFCBA0DEB51F32CB970E18270
      C764613EA85EBD6A2D69DEB2E94EA6ADF072A0339A3469224D9A3495664053C5
      37960E1DDA4BBBF61DA403C0965CC22282E7268D9391A386CBD8F1A364C7CEAD
      AAF8BCF162DCF4A0F0DA42A5BDBA881276096B4D1EFD81D7CA1952A74E1DD4F8
      A2BCBFB0A4F4E87F102FE5F193664D9BCAB1238765ED77DFA96BAA3265CBC9D1
      E38764D0232544E61D39F209268BB4616764052ED0A46953B6A0B1346ED2583A
      A2C6B1B171CA38F5C867E1BB2B5CA65B2EBEAC74EDDA156FF56E287171BCD881
      46C09D523B2951A68D97B148492E072CBC0E0FFAAF5FB71E33EE64D4EAB8BC3C
      D12983C6ACA7BE7ABA3A2C2C422A55AA24D5AAD794860D1B49AB962D052F2A91
      D2FE33449C15B118BC9104E16E170BE4EA22C19BA21B3769242141A1C83760DC
      2583467F063E1D10F9F0D5328AFA8A068DC1F12DED3B892CD300D9AF00F0A762
      4BC441987CF1B2245FBC846E290DE3AB4552E0C05507AD800149867608C07091
      11C0342A00E3E2AA88CF7F2E86CC1D72B52008350F0A0AC9AE79F252B766EA17
      F825EF4F54A92CD2E900838B1180B40D97038E62E045E64C794B0EFACB04266C
      8C081C2A8C31CF4C103F3F97DBF853B360F0676679C316E69D66CA5503B1BFC8
      691C6D82BBC9FC591FCB5697547DE569F92B570BB8C7D6E9FC9CCC9F3254060D
      4E923DBF6D46E18243C56AD0897A43E64FEE23BB1DF2088D4322B91C5CC62300
      E54BF49573CD2FCAFCB953E0A40E9CFC26156BA16B02FBB18C8823D64D334FB8
      29D368D90BCFF591BD7EF2C89C6764BE3B033DAA194D53525324182F16E9D862
      BCFC181A0C27A39513C93A23F3A78FD56AB96856A6C8E18C613267C20CD33895
      740BEC4C10F87C917CFBDD5A89C16B56E2CBA125CDD892A932E8B186C8FE476E
      BA771F8E1459C23F8E38D2989838BCB8214DA6CF9CCCA417B461A72945551A35
      6C2015CA9797A0007FE9D07CACD4BC6182CC7F7E9352E1940437022523235532
      D253253D2D15EFB1485579BE226DD89F9917F0CA26EEC93FFEB0D17D88962CCC
      7162A57CF97BE442938BB2FF876972E2C431D9B8E947B402C1407B0DC171A999
      848647D1442EE816E801AD5E50DEA0613D1C5FEA4BC3060D60BC9CF8FB39A46D
      B33172DFB00B787C324E3D1352AF7E5DA95BAFBED4AB57572EA75E428BB02FE4
      329FBD91B189DCB92E3FD51877C21273219F4E8685F9AEAD273F0EF434900188
      DED1021E7CB8FFAB1111E1BD28BC529C3A79EAED850B160F44F90B805969F0CA
      913F9818A0025013A80734049A012D81B6403BA003D01E204F5953F0B5817811
      61D39CA0BAE260FFCD819EE2E063143018B816612E8C4C050E03EA50310A5735
      8339BBA6408333EAC2F25A97B311DC2F1A8CFB452CFA1823F6D7E0B0B030E1C5
      1D0554CE0F05E94445455185BDA11CD899B25E079C387142A64F9F6E5E23E474
      66D5CD99C7B49EFAD02EC116902A8334CEB7CB5040650DAED021AFE5A48455C6
      0B47A609E66928071412C58A1593A79E7A4AA64E9DAA1C52463CFDF4D35E69CA
      6880D41798A7A11C30E14B51CBF42B6DB49E956A9E57A55A9F320D9F0E98C9BE
      266521AC65CFD502CA3949A31E792B584E4339B06692D75D4225A6F960CFC993
      2799548EC850AE6BADD394114C6B28074C30C317983770E04065D857BE9651CF
      CA334D28073A232F4AC5BCF2AC72AD47AAA1F60326B422E7989AD7D4573FEB3C
      5F94F634540B98D08AE4795AE49EAD65BD47BE407181F8E0F911B974540BB421
      52ADC15D9E6942CB0AA2D4656BAD7AAA05BE32F8D027E584B5407E3C7509AB8E
      7240013308F256E35A467941A02E61D5530E2864D3487DDD797967E6133E8729
      0DB18C159459A11C50605522EF4B46794E58F5C8E78472C0A56E390B324D65D2
      82403D8D53A74E6956518EA2B93B76ECC0A300E9EA191CAB31DD6D56594E5E59
      F144BC5FC4F71721F92DA0025B30860F1222C5B310C855071AEF75D556AE1BB8
      DE03660F384CAE708C0D6ADC77480924F30F85528209CEBA57823604AC654290
      4E03D2019F81B5F19991433806E94680365E0D3C4324223F40CBC17A87C23898
      8B225D006B08F424782420AED8410C0CB17059506BC0A59F4A66A9389FA8302D
      6071AFCB2108B4034D21F21D0A7270D253EC1F0F2D32B117A204E7F9EF1642CF
      A70A3790CF0C8B90DD300DE97811E906040394815CBBC08A84C15C5980C6AB7B
      6819D07087D351989E806ADE8123894E74EDCB43958ECAC07878745CF4553B80
      3D157868A161D5129C3ECB44444584376CD5204F0779662873B9231AA754519E
      B3038303253492BD47F1D58315A271F6BDC1168486878657AC5191F2ABB70E0B
      34643A40BA0C7EE00B0F8D0CA51CC9AB0F34E4E50026C35D7E4ECAC15E7DA021
      3A280D53ECA2D2B88D1206500ED1D5071B4C04C360ACCBDF151B1C1644CA34E5
      C8BA36C189EFDF0404870507C4948C21E5FE716D2C9B566C62430B6C68C135AD
      B969FFFF3CC3666B5C7565ADC32B11D6960159C07280277917289D815C59B03A
      180E13BD00863B118D004201CE1A7890A32E5124877A88B190360E9B2A74474C
      8098613EB8E1401A9009141858232AD1C10A32167C0EBE365001280370EF1D04
      5A05E06C83AD02AB02CBDBC169308D6476A0A03192EF033C147C067A17501188
      05223C605E7DF0A500DDFAFEE029D77814E90080CEB0D383F3041768081006F8
      03EC86F3A097800C80954807A58313A047814C2083CB22F87EC792254B0A5F6C
      085949E00C90C242A02A9067ADE8C8010947531A288DB376AC110D42E41DF82E
      97DAB56BAB3710E01CC1CC6A888E00E7590854051A610D2F23C55A2783324D39
      58332482AB0E9405CA0052BE7C79659CBC07ACA8D5B6479C3F61013AAB08B552
      0027BE11A04F00946B4C44BA2AC0AE06297CD00E4AA3088DB3960EF041400980
      466B7828D301E08B14B403D63E1C25990651BF87D2186BCC169132ADF3A95328
      B000BB21A7837C0BB399F92AF8C83CE44396A788B5CA33338F0C5F2DE010A72D
      0DA655710A147315517F94CD02323D1804EA0F28DB57D245282BAC210D902EC8
      B127CF85C2BBC01920A5A80E56A3D041C02BF007891C3B1B471277D614D6C24B
      399F0447500FE41703B82F1065C0E7BB27B389D4292CB863F941D909B0722CDF
      0FFC0C408749605E078E00E78122071AB5A314E100BD667B326CF90C74C43D97
      FD7E557BB24FEB0509D95C5F3A3D207C0F284AB815CAEF035E212F07C6679F7D
      267CC519AF62BC4A5812FCFD9FBF9DF1194EAE1346562E7B1C0D90E70EFC4A03
      7E74C34A9C4C339306F9B30A2985191919EA7767BD4A07323AE07006EB0E793A
      C0958B7A55071F898F8F8F177EC581AB36B99605EF75574B7FF866079AB1B492
      1B3CBB46C8A40024776021AEFDC5A23C19376E9C7AF90B5F43C74F14C4C6C68A
      7E5B349F78273C1672D9737A327C92DB6FBF5D19E23B1CB99A9C3F77F1C78B3B
      EEB843F86D04FC062AFCB2035FACE431407BE91E5E915C1E9514116F13BFF3CE
      3BC256DC73CF3DC2572EF20D7D3D7BF6541F28E7AA283EC77FEEDC39D55D28C2
      E0CFC80A7AB4A6BDF88F3FFE58A5DBB66D2BBC27CDBEE7D71B0E1C38A0163571
      09107FF3D9B76F9F78FE0241CF0266B0999C3763D03837AE1673E478E63C6A3D
      2A4713B7434A4A8AD061A74E9DA85A09D11EC00C4E93F3C1BCF2CA2BC2CF0D54
      C40B4BD8EFFC95962BA3B83D56AC58C1D769612D5813D18BBE3D26787CCAF4F0
      92731B9447C60040F52B8FF37CA29AC7FA9F7FFE59DAB469A396BDF145DA65CB
      96A59AF0CDDD47F03E2926060DBC6737286D80B883B505D521BA833F56E04185
      7192C71FBAC6C61D8CD9E832AF9D8A32A037C043C63650C386882109D183347E
      E4E05E797EF64C59F3F537B26D3B2B849C02C2FD7D6F93C08020A95E3351A2C3
      FCA5675F9E96E53514DBA45B309EC62190E0B018993273BE4C61E20AB1BF453B
      2957A1DA2814EFA91D94FC7CD547F2F5DAEFE491410F61AFF553BF3A71E4F0F3
      B99919592236439C4E3F94C1C2A9B434FC2493AAF82C2CB6B98035617E8E2C79
      73C5077253970EB275F3469587A894765062D7EEBDF2D7CE5D7848244E56AF5E
      A35ED0F9D75F7F0947D09E3D7BB0ECAD2246D4DF822F26C92FBFFCA2BE26B37B
      F76E8CA45218A607A54EADCAF2DD77DF0A9F434CBE741AB65508E6902237B359
      93C6A1070F1D0E6DD3AA7968A58A15428B172F119A502341D1EAD5AA85C6158B
      0BAD56B572685C4C4C6862529DD0624857AA583EB478B162A155AA540EC50789
      435F7AE9E5502C5F090DF07784AEDFF053280C2F3687A9DDE1C27A9E2CB9E3AE
      3ED2E3966E58E7D840EAD44C903AB5ABA376099258AB8624D6AE2589756A48ED
      9AD5A5568D6A9294585BEAD54D54F2D6AD9A4B46DA652CFEBB20070E1E826D77
      301D5CC617851B36A82F8D1B60244447A14BCA63A94FB4942F5756A26322253C
      225451B44462B07602559668D018E8F2D22924245422A363B0FEE8109610619B
      B9ED67EF68870FECC7676B33502802EB4EABC1588CA04B24B6580C564BC50B77
      AC0AE5E3D5B7424A942CA176C4F0F0306CB3282956220E6B1DA325363A5CC2C3
      22E5ECF9F3A2FFF47EC02BCAE55A788DE818D8F9443B6057650E79E47EA95D3B
      519C2E3F090EE174072A969095992567CF9D1187CD811789A5889FBF4B8E1E3D
      6A6AFCBD778FE25F5BFA2E6953443BB503F0722D5BA16A0FA35E0ED88A3008CB
      0101C0D5841414DE0F646F0C24FE2DC19697D5761DDB46178B2B7652E7FBFB3B
      D2EC7687A1D3A05BF0F5CFC6A0F9069F0E6EECD2B14D6464F4D735B043454685
      CB99D3E764FBB61D52B35682142B1EE7CBE02BFDFA0E7CD057863E1699796DDB
      B78EA6F13A756B49DF5EF7E10ADE3D9AF89BF3DC79CFCB3DBDEFC5FB96B9A9CC
      22F2EE876F0D44AA700E700C62B7DC89B58E2B4E9D3E2D274EEE1097D3A57ECC
      EE7CE30DF2E4534FCA90C71E833D77888A8C713379C41C39BEB2BEF7252C59B2
      942F71BEB25C5DE4D16E417AF1D245ACB7BE204E87431C4EA7F0893BCACF9ECB
      9E99B85CFE14E509AF8DDCAF7FDFA8CB9753FA89D8A7D5AD8B2365FDC672E6CC
      2949494E81A3F35826FABD5A935DA6746965D00EC79111D1B273F776F9F8A395
      58421A752732BEC4E83A0DAA82D9021A87E4917FFE3930BE45F316F2EBAFBFE3
      5AD585C38643B8D662C78E3F65D3CFBF8BD36E17570B77313FAC8B7439DC2D18
      31EC2919F6E4E32BAA57AF3E16B666C3C905D853EBEC488901F8B6C4F8450B97
      A8BB56C39F1A9AF1CBAFBFB82D21F7A79F7F93114F0C9117172C941A8935D221
      121C7E7136DBEF088F08B7E3A423B366CE96A14F0C1D5FBD7AB50DC8FF12508F
      589062BD68C81B53264D8FE0B17DC30FEBE5EEDE77DB3BB4E782FAF6D2BE5D3B
      291B5F465E98FF923C3CA0BFBCB674B9C39E99E9183468B0A3769DDAB6AA55AA
      C9FA1F36E06454572A55AE8489F1279DF6FDFDCF0C1A366B88C96DB99A356B51
      26552B5793B0D008C5EBA87BD79B252430449E9B3C5906C1C9B49973243A325A
      674B8D6A35B1E83E409A3769211352C616D319A6037EF8FD52F2454949E361D8
      299F7FF1A9D651D4C802C181E2C9E14364DAF4395235A18AACFA7CA55B08799D
      A444397864BFC4C614872C3B38345BAA74897177DC768724E3ED049C8A70CD5D
      5CB158C1C91D67AB38372D8E3456F2F39CDD16D3C8B8B858E401C5E224136F12
      C5AC4F82F05DDFB7DE5E2E870E1C194FDB660B9848CFCC504B6BEFEE750FB71F
      456A43BA191FB1E16996D89069C8E2D7174B6A460AF8ECE0D5825B6FBD55B01F
      C887EF7F20A54A97C247D842811000141FD8090D0F119EEC4343418190B05009
      C542CC50D0B35890DCAD5B17AC740E91F7DE7BC76C81D7A182CDCCC84C9512A5
      4A62EA574ECA5728071A2FE5CA8356240514451AB2F8F2654501338FD2C58BCB
      6F5BB60AEFA166D7DFB3A8B85FFFBECEDF7FDF8A273232E5AF1DBB30ABA821FD
      07F4CBD6C34654D364D52556313298444F2D5AF81AA69CFE82A7DD2911D8F4C3
      CE96A6B74108A5D3A74F2351983963BAA24589BEFB76ADF0EFC2F98B24B4795A
      3BF0AB5DBB566F48970D7A6430C89587F9F3E6E2AAA7711F5850B65584C465E0
      08205420BD4AEC13910B8039B34B46E277A021D00DB80DB80BE086E099EA11F0
      4F008381410065FD410700F701D4ED017A2390046C43FFB3D26A00232DDC2836
      300E80ADE2D6B383679AD4051E9B525528C3C3330FAC9265824907582E03C6C9
      23F9DF12F0CE2FB6D26775D92D3AA327983781C206F67106965487F210DFA449
      93DD78C29487E35418605781E0CA4BC5EEC8E04BFB2BE2A2DB72F7C49D932376
      5F30BA6D9C3E7D46DD533A76EC18DFD27A088F8E2542FD34C06DE6754653D763
      344E47BC8DC0B910D39AE7ABAA59015C47ABA726F81AB41F7FFC01E7E966EA9A
      0DDF2B2A85676A8FE17011090717812CAFBEA33108253E3E1E93AB503CE7D450
      6AD5AAA5783ED846E3BCF2E461997A78E64ADD85F1F7F76752DD09C027B6ECB8
      51351D8240C0C62109EA1DD6AE5DAB6E19E02CA70CF01ED1F1E3C72425251557
      36FE78988A5D8D0399D38996A4AB4F69795B9056484700695E2D8040859B6EBA
      0927923875D954AD5A555CABC5E200982049494952AD5A35F43977054C6E30C3
      68D8B081ACFE6C953CFBEC78790E7878603FDA084644D873B5805D306DDA34B5
      821C4AF2C5175FE03A2C12CF7AD46712EFB89E2177F7E9832BA01075F4E52D9D
      8A152BE002304AB874FAF4A913D40B46E400727751666686324E47369B0D57FC
      82094018740593B0336A4AD3A24573295DAA3426C6811211EECE0BC4C3416978
      48283C3480BADCC8BE1DE83B29D422DAB7EF40E285F5EB37E032B792040506AA
      969C3B7B46522E5FC67729EA28994759757FAE2EE28D568F82AAB1E649B76DDB
      4682ED13ABDE5A5C1C277BCE5953522EE3223C4DE595C8BE7EB051A0BC90D1E0
      3381DF7CF315BAC6E6353A689C7782274C188F77C49FC7E971F3FFD7DE75C057
      516CFD736F7AEF09249040086940A483201DC406820511ACCFC61345C4271650
      A93EB020E07B0A2ACF820A62071569F2143B20A8148148974E30040829F7EEF7
      FFCFBDBBD9BDF7A610F07DCFEFCBEF37FF3967CE9C396766B6CDCEEEECAAB98B
      1FD7AFC3CDC946CBDDBD6E8BD4CB018539D939B266CD6AC3896EFC295CE53270
      A4B76DD35A38D59996962A595959D8C372B0C73564512F787511372C07BBBFA3
      5F75EDE6CD9B2B363222423EFC748D44466DC7A0384038B6E1D2266672A71873
      EF35642DF06A4139F6A2040CA8F2F2F20C45B680092EBF08C04D7A725A4BC9C4
      88220BBB6764428EC424E5C019D77669188039A86AC0CB81C3E190C2DF0B85EF
      5EEB5A7A0B9C1855B0A66D73A224213A40A242CA2428344CEC01216A929C65D9
      2ABD1CA9571739E1202828501A354E5785E8882D58B56A959AEEBF6AC8DD622F
      3B2C41768C61031C929B5C26478A440EED420B7872A25513BC1C9495954A724A
      AA619CBA7A0B74271777CD163F3F7F09B0DB2436BA4C4E15EC535DE428E7D7EE
      AD5D6471C0F33CA7F36994703F3E27ABC0F96C32EF2E5E2DB17149128499469B
      ED0045AA42EC3ECF4658B6019784791EC913278C93A79E9CAA8CE851FF8BDACA
      5F6FBE5846DF7D853C78CF5572FF5D03155C0ED4754657B55E70F6EEDD2B1161
      41F2D41353D43140ADC8A84849C1CB00E4D9A21BAEBF0E0BE082307FAD0E548A
      5DB507C761BF130BA4C11AA1420BBD387BD60C09C1EECDF3FE912305981B2A94
      40EC96B171D16A7C7318B2F2B2728CB6C33133162B8181FE706417DD28F7B235
      6BD7C9EC39F3E8E03C44DBCC0E6E80E055E05C844761E45D603B60046EF024A4
      72017A6F09DACA0DF284394D9DCA401BB4459B30F107069B6EFBCEBB6FBF1DFC
      6CE08C43597159AB175F7A79BDAF82E626CCBEF986DBD428421F25781650A702
      F7B9E0E0C143B89F2B577FBF9AB760EEBA060D529AEFDDFBDB6694710246303B
      50C66984E31D5D834314D7FEAD41E4C4A42B4E0970B21817FACB2EEBA77E8CC4
      A724C8DCB072F9E7599B376FD90ADE089603CD5C7398526746EE7A74A0F6714C
      6B3A619C95E0295D1F475D7DF5D5D222B795F4E8DD6D8B61D9CD585AE09661BF
      A619A478DCBB8DD28986B329D6D533434E6099F14363EF075F75F07260E9123C
      1B70D0096CD0382766D94118AF48F76EDD64FF6F7B65D98AE5EA20E4D9F7B703
      7BA0690D962E6216AFC99AC6FF7139441947AD697CD5AA2F64D68BB330573141
      264D99242B562E9513A74F62C07BA574EADC193301F558DC0B5E0E78AFECC0F9
      447D7401C60B8E15C873B39F931F7F5A8F19C738DCE07550C0D483ECDDB347DE
      5BF8BE0407624138AECD5ED621F072C0E6B3056C09BB64DE82F9121A1A285169
      6D24BA5177C96ED547B2F27A8B2DA183C4A4B7959CEC0CF90C17A3962D7990C3
      A247B07BA4B18F60FF71685899EC94555FAF12272E22B6A82CE9D1B1BDB46F96
      22F5E32224292E5C2EEE98299DDAB6125B74A63448AE8FE9B6959EA654DA6B23
      3B60DCB5C768B271E3464C2B24497C7AA624C462B8892B184711785B53CA4ACA
      2426224442C213253C25493E5EBC18A77865D312994F15DAD4C79FC664C8499C
      DFB19B62EF797CEA64B9A04B1769DDBE37E64EFD60C086A74FE5A0781255EE14
      F893A3852765C7E655F8A7EC22ACC68E95E79E7DC1B0494F5E2D60DF7357D4CF
      F18EF252397EA2586223C3E47459993A920F15FC2E9C713C75F2B41C292C12AF
      7EA665377C3860FFC305F6A0F8F8044C6716C9EEFDC7304D132805C74EC8A182
      E39813C2C51DE3271EE5BB0F14491C6EEA5BE6E5C9DE7D7BDD662B887F05EBE2
      9C3806D43640323B2B5B962E5F2EE9A5311216EC879ADAE4041E26210BCFEF34
      292E2D93A8F060D9BFE520EE1FDA55E9C068257A1FA70A0D1750A77468DB5EDE
      98375F724A76CBB7EB9CD228B5A904F9F94BE1C953B2FFC8090C59C2A5E4C0B7
      F2CEFB8BE4E469CB4954D58191DE029D0AEE8F609C5D04A0CC78FC4AEE51FC6D
      A9CD7979D2AC53369EDB04A25C88949644C8223C317FF58DF992775E0B79E2F1
      C990AB703DE2B9800A7ACD83983A7EBC509D1E5417E168768A434DA14D9B3245
      329B66C8B80993E4EE7BEE5520DF24BD11E6547BCB070BDE938C9C6CC1458B66
      5E43442720B88F53B148809BE2831BAE01AC031B599D2E70E86938E9B56ED546
      9E983C419E9B314DFEF1CC34797CC26378AEDF4AEEBEE31655F4C2DE5DB1BDBE
      F0726257B9E818379580A0604C8D85E176150809C77D58848486474B38266A23
      22E3306489C78D493CEED512717308609E74DAF4E9DCFFC5871375A6A5EDE06B
      870E9A13131B3D8489DA60E3A66DF2F98A957A0B9443D8310E3A32DC0EF110A6
      03BCE36803CA09AACEA05D819E402FA00FD01B204F5927F0BC99682422C300EC
      82E85791E7C1FFE74393B2B2B274B84D9B3871622A68EA82050BD2400990330F
      768F22C978952419B2FA3B76EC68400AB0DB08B0671E3C1D64161515B1FF33F1
      4E4B3ACC114D4133805A05BB47A9F38F1E3DDA12328297A8D66EBE0568AD82A7
      8366B0C23DA2E3B469D3B807D1119D7482BC56C1D301774D8E98F3860F1FCE5A
      B783553AC902AD55F0F32835C16EB707E0AF9E8158001D8C89A8E0FCFCFC307C
      CF28027AE301061B22564C07D310D52CDC09358D806145C903FDB23AB5ED95DB
      A7C7BB2DFAF4F9BDDD65FD1CB9BD2E72346ADFA93028B9E18751CD3AB0A5C1D0
      A353908AE029780E59AA46BC3F06CF60AF979B75558B366D163F3D61E6151FBF
      B9286ACAC459F69766BC6E7F60E4F3912D3B0CEDEF74047E1D98D26C0A94D9D2
      00506503141729C615B8142C6B0E6204E7A5FDFB5FFFF2D3CF056467A4890337
      E02909217878EA90C49430BC6A72B55C3764B47F56B3CE23FC13527527FE7A69
      CF162CE2971D783FBC7DFB76CCB8AC51B35F73A63C69B3636B25C78749624C28
      CEB6763CADE275D981B3AB9F9CB61F96E8F85C5B5074EA2D81B1893D613C1440
      094C1C823107E7A851A304F3A236ECA636BC1565E39B5054F865D7415C4A9DD2
      B85E1CA673ED785A5526E1D176691A1E8CAB5C53890B3F29FBF667066C3FB0E9
      5EE8AF064A00A71D91393871AA7042E0C0FC44192802E7ED00700545A7858E76
      ED2BC043BA20C9494B90C21325183AFE243F6E5A26290DE3C42F2080C7510AD4
      83019BA783825DBB761522E3044E15A536BB1D832C9BE0E3E2F213DED0D97D70
      9FA4D68F9520F4F00E38D9987F505E79FB53A997EC2F4D9AE0D4A59DE2682304
      E5638020C00E55908AB0072C9D722F08F50F0CCAD26C01B8A245496A4C03D971
      64B76CD876503E5DB54E521B26486A6282C447D7977A7141B261CB61D9FC4BBE
      D80339285097603FD8F26AC14F106E03B66226FD97C0E0B0B21318FB24D66F24
      5BF7EE9653276DF2E5BA3DB26EC32FB266DDCF9282976AF6EED92BAFCD5D228B
      17FD5B22F1B520719614A37C29A082670B7E8594DBC09F7FEEB9EDAFC3CFDB71
      607F232DD0269B76AE97C8D0A672F0F001898EF497DD3B8EC9ACF9EFE19E2140
      347CA02A3AA181ECDFBA5D4A4F9C62058B60C701A8A763A046183C6CD830DBAD
      B7DE2A292929810F3EFC50CBFC23C7461C2D3C696F909B8BB7A3B264FB962D12
      1E968307724B61BC2164780A1B5A2AEB3F5F25BBF6FD5C5EBC77CB235A996309
      2CEE149142C012A291EA029C8F29FAEE227209669E9637E976A1B3DB8DB76BAD
      AFBA56BB69FC6CADD390915A66DFC15A5AF74BB4C8AC8E5ADC795DB5E094264E
      3CEFFD04657A00E9008F051BA8CF908B17F778566D8DDC7A62B32F8D6C9253DA
      A2D775DAC5D78FD35AF41DAA35EADA4B4BEE74A1169492A9D9131B94E2E85B09
      DD4B8116402CE0D9FD107907D680BB452206387D2530E4C580D8A4F5F698240C
      F9E21D1212B10B47D937E267BF1B457B013C061241598665C1561FA8C8027150
      CD00DA025D81DE6E7403A52C03943AD46519246B1E58C01FEA61008DE0A892C6
      E009F294318F3A36C8FF0F054B731E78F8BEDBD1B6D9C01907CE194D7B66E67A
      CF82EC33B34CCD19655572D76E56248F319465CE082F6C34C71B249B91E70454
      B0ABD81455655CDD98E01E8E33BCE5E565C239234E01F1A3861DDA7696FE032F
      DDD0BE7DDB0C9339AF4BA639CFE07133857B67DC7DE24684D30BBC8FF39C331A
      3870A0CF39237FC34AA58C86DB134C2F6044EE6A015A8FDB2BDCC8D568CEA84A
      0734883B6F75DF46FF9A064798A0628B386952933923AF6D4043E80F04EF3923
      A7318F01479A860B7EA4A437695CE59C914F079E7346BC1974A89AB3F701F07C
      CE9090108753763D3C916A28315191EA798EAAA029F2DD45E80A6C525C5F1114
      8F1EC7DE834A43809B5B6C166C12049EA18331F352A2662C13925264DE82D74D
      E6BD872D2A93C6D91D300B23E8713A41F7A0DF70E78C8D0C2967C5E00D2F5516
      7324811DC1A1CA7A46FE9E02A61D30C60DEC82CB203A0659E0D10C761937381D
      B23298BD826364FB083E1DB0B00BE80BEC92300B5B70C1BEA73588B917A956B0
      75748A56F9B06F7D40A12B58E68C74033CC8A0A05A8516AAEE431E3C632A151E
      F17E11B2BD82EF16A85ABBFB1E4638975A61083DAF6A8C16C1284C43805D1A32
      2FEB10F874609E33A2715596111DC322F3D90258C6785509D041EC4858F40866
      07C63181BAB90AA2F6AA4B60982DC054ADCB2E9C718284326E64B8C001CFD8C3
      3A926607153C1ED6A9C2CA10EB89EEC27EA29CC10E27CA5165A8A02A708E005E
      C3F4DB7198548195554DAA302AC2C1AA52724D29C3284AE2A4801D06BC728614
      5AA55CC2117757CEDB210B3ACA9EB28E8823EBD3A04EB303DEFA40865EC05E82
      E315B54212A5611E06B8219107074C63FB221F2D8023F427765E8B030EBA383E
      B538300E45CE19C1F4D90476912A6FBE2607DF3EEC9639673367448B470E1D59
      30E7A557EF005F041895068FB19B6B3BC423910E70CEA20D687BA033D015E809
      7004D707B437409EB24EE039AA6B24FF1BDF7684D33F2E98B781D9CB1548BC0B
      9C49B812CAEF0196509983BA056F4637D90DCE83C1B48E5A2A762E16BCF583ED
      850083B14D8283F17AED0517D466C15B390CF10402E2BAE82FE4CB02989F5002
      3DDABF7FBFF09FEDE6E79AFC7501F36D369BFA512DCFAE4CB332A44010500258
      1C206D04234397706970CF9E952F78C3AC184E7A46314E239C405927A082BF8A
      11B1C6204658BD7AB5E2F1FE1C1E1C150B978EEDDCB953323333D56B58BCD2F1
      0D06CA3099AB7411F12C6AD9AE746043F768EC264C69424784C6B9E60F13836A
      5121DF4EC3D48EFA2C69045EA0A962C15B3E0C5C07BC09A866E9DEE844F81E9D
      6E9C6BFF58EB3E7DFA48E3C68DD5E4540D16BCC1AEBC8E6808A06CFB8361B882
      11D1AE5D3B121975EF9D67B41E0DABE9D47AB479AF76E07AB4D761847BE49BFE
      6018DE6544B005A43FACDB44522BB8D7A3CD45E18F7407E05D416F416969897B
      EFC0C5134FFDC456ABF568696C062D1B1B596F0137328F626EE09AAE477B68CC
      44E9D8BE1DE6950A64AAEBB3D71DFD60DD300E9ED3380AFC6D2BF79C993367E2
      916EB6701517175F613D9A603D1A1E50274A066E3EB01E0DBB6E531CF1D1F887
      CB2C3CDF89C2A48B9F603D1ACDBDA4B634391EB566E85D75CED6A3D1C9638F3C
      2C77DEF117B2061AA79DFD7AB4FE38D094414D5CEBD198606B5A9D9753B71E6D
      8BBE9BB25706239A079C8BF0288C2C022C0EEC104402690007AF20B50EA75172
      17701CF893075B55F5FFECB3E5DAF61DBFCAB1DF8F29355E0BEA25D59347264C
      C9F879EDEA5F95B09A88FDEEA5B273E776EDA57FBDA06DFB752BDEE58DC642B7
      660A0989F172F0D041197465BFFC166DDA35F12AE843E0D3C1F2CF96E32DC000
      89A8970DB492B4A6ED24B5495BBC05922B91C939D208AB8AAEB9B27F8D9C7839
      58F1D932FE64536C61A9D2BA59AEE4344E90B8A850898D0A918ECD1A4A8BEC4C
      B18537C4ABD2717832FE64BE8F4A5B445ED7831D3BB64B3C6651A2931B62961D
      7BABCDA6AE0B1CAA9497974B4468900485C4480874BEFEE61B8B315F092F07DC
      A0A9F8BF4793945829C7D481CBB0034F42C49D16C94C4D907DBBF649E1F1DF7D
      D9B4C8BC1C30D781B73E4E169708BE6626A578F5D089BBCD635899C2E1E4E9D3
      A5786E734AAADCFD68C40D3F3735C8A06BAE1AE71FE02F0EFF18D51DC78B8AE5
      E09142A1C313A78AF178AB540E169CC24BAD05F85748987CF8E1A2F146611F8C
      570BD252D3E43B0CBA52CA222424300335B5E1F7031C0DA2346E694BD0A2B090
      4039B2FB289617E7425875B0F9CABE6FF47D5ACB96CDA5C43F41EA253514FCFE
      00EFB49CC6AB3EC512198EB7420A36C9279F2C978E1D3BC93D770DF76943B7EB
      339307519F5E5DF3B39A36C18B7A5DF0583140E97388F8E597AB64F192157835
      3D1D2F6A7CAEE43FADF9DEA6181F51A519D4558E7A76CD3FE57E23273424547A
      75EF22EB7FDE2C6FBDF3BE64603156FBB62DE5CD051F4A654EAA7440279521AF
      6D7B6DC8A0CBB1D271BD54E5A4D60EE8B8264EBC4E152C6860D0FC853268FEFD
      46DA8361B7B07BD8028F2C23E9B59B1A39648A8BDB80B491CBFE25F2D15F9E04
      EF15E804420D6098C5C80C6B177599B6106F09D3A8A133E0F6D6C91FBCF0C33E
      4CD94C9755A37C3A31947D30D62E3A7EBCCDA5B7B64E4EBBBA7572CC00173E3F
      249233B87532D6AF8EF451BE5A91B5058DEF5B889A5A5A20B70C4C9639EFEF43
      CBA6CB8EA7CFB80555D720FAE6DF8488BDA5D20D5DB581EA72FD062D14BF417F
      90F1EA9CFFBFC9B7EE451ECDFEAC6E5C841EB11EC910D48D8BD00996E0F3745D
      372E32F791CF03AD6E5C546D1799152AE36B326461599FDB801935414D9CF83C
      0EDC63A12EB26070FFAA1CE943168EF02AD3F37670D9BFEEC744698D4710BA13
      B7836AC745F763F430D2180BB94B29E274AEC5B8A8CA16293D8FC8DA82E3C747
      E60CEB99CCB110C745D48DC4C8BD7994C8C74F7DC6E419C3BA911BDF773FC645
      238DB190D99CDDBE16E3A2336E81D9848BE718886321C225F903628E853826FA
      034CD799ACEB81BA1EA8650FBCF8D22CEDE27E7DB57EFD2FD6EF366B69A99262
      03AEE8AFA567A46969E90DB5A79E79C2E2441F9BF224B602E58F014EE037E009
      200BA8322C5DF1A9B60E2BDDB9AA8E8AFF5EB992C480EEA00924FB8047803B81
      2F01DE9B8D00F50C9A59B072C54A95EC7F593FC9C14BAF3F632DFFF2154B3425
      44E40F303CC3C8045E99E290A6B3E1A04601F00C4CAB53FDF2154BF11DBB787C
      01224FBA76BE40366FDA84F5822BA9A3A0B7200FA9E7815D00BB4803ED05E8C1
      068600C1249828C8EB6FBCAA1D3A7C44BAF5E821B939CD6C5DBA7663BEAC58B6
      5C51467AA195487417912781ADC01EE066E01AC006688067B00DBD6188C6092A
      3FBC9F6DB7FBA9FC32BC414866EAD4A932F8EA21C66BD1DD45840FEB4683BE04
      2C012E00F44027E44915BE5FFD9DF6CDD75FE1E953B8F4BEF042FCBCB997425E
      DE79D493A5CB96294A65323F234A0006000EE03A6004C0A0EB9037F0F89489DA
      EC175E9081970F90E9CF3C6BE8608FD2065E7939DF9F97B7DF7A47F46DC0AE09
      40E96F80EF013A7815B4D2B0F893C52AAF371EA62AC61DB56AD9CA767EC78EF8
      8F6C89ACFCF74AB7B48ED4F5405D0FFCB97BC05655F5EB26A4D83BFAD994BC42
      DD8494EA0653A48F2A4C22BEE15CAE9E9BD53DA863B7F83CD0EA26A4D8353A7C
      76919E5915ADC95C11CBD7DA010BD7C489AFE34063E12A60544A9F2B3AB30929
      F7C8B90A07962CDD895BC861BF9B7511A336AEA48A6BDC02A55D17FDD7F70037
      72226A3906D06F38C09E559889D25301DEB5AA35206376EFDE3D223A3A1AB28A
      C03742F45475BC9ECF0558786F7504DFF244D97B00E560446464A4F0AFDB1450
      F9DB35DFCA471F2F912D5BB7512459994DE5B24BFB4AB7CEDD549A3A95016BCB
      A9C3DE301C602ED6B58A9739F93BB7C933339E97BF3DFAB8448404E263244172
      F058913C35E1617C36254E5AE4E4510DEFBAD87C821F74530AEEC83855B04687
      0F1F96575E7D536EBBFB01C948C1BB8CA92978A7C24F7E3B7044C998171FF5B1
      BB280E79BCB9C304CB3E824F7F901294E9500E2824F86DDFAD5BF365F8A80CC9
      4A4FC5723C7C19EE64B104E215E9CCA68DE58519F9F2CC07EFA99AD300CBF802
      F374702FD28A8A8AF019BF425570C0A0C132FEEFCF489B664D6463FE2EF5764E
      205EA6395D5A2E8F3D78AF74E9D04E95A561C52022AFFF999E3C3FC54831A036
      32A932CECCE6B93958A11A26BB0FFD8E6FF846A93C46CE13A7857963C78E3574
      9D4E7CDE0677F92C6706F57558BA884A6BD7AD97F21766CA15836FC6C7600295
      DE49BC533475DCFD32F2AE3B65D2A4494A465DC520223F6EDC38C3314446F0D7
      392AF5ED77B95C397080BCFBFE071216E42FEB7FFA4965B7CCCB93C7C63C201D
      3B9C2F17F5ED6B1862191D5434F34C13CA0133CCC67B5ED04919E9D8BA95A254
      5CBA64992C5BBA9CAC052C4BE00B1D4A4E5E31EE483938BF5B0FA3E62B97B8A6
      08984F651D9E695D6EA6BA0EA90EE560DC980765DCE429B262F1C7F8CAE74495
      C7827C799E54091099792455A08CE0B6E13B604A688AD46ECA37F4F92D532A9A
      F28CEE31CB3C79FEF98732AE30A503A6DD47336D8B6A010D33736D5C1C756B8D
      6E25255E95326E40E88496B9E7578658287822013202043F22F1F77260690195
      CE06EC05CFF2CA01857A0BBC16D633F32CC00DA1F1CB6EB4412766F89299F375
      9E7A3AB88681AB2A90A66D35A53693DFF3E52B6EF87CAEEA43BD209BACF39551
      1832023FA4C17F1741F039A002BBE8D10E1D3A303182D139008D0F390776EA4C
      9CA31EB0D1CE5F87DF9A87EF824CC5C9AD1DD316280D71CD869B32349D371897
      007BDBEAB2D2D2079EFFE74B3F51C2BD881F1D79F98EDB86B5CACD69E136C72C
      17E054EDBAA4F78C1A2E33A6FDD3955149BCF9970D7D67BF388BA3C53654510E
      50B8358CCBCE3D5B29B30079860366F8D2A15C07ECD850A6B59E560EF444B983
      F3E27ACA45A16C3820EF4BC7A5E93B36CEA6CCE637EAAA02FA577DC7AE2A1DDA
      31C3E2C00F0F19AA025B50553EF3CCC6C95B1DE0BF1EBC225506B6A0B23C5D4E
      A366581DF868416A72BA34ACDF58489F9DFEBCA2E409D6D81366E3E42D1B99CF
      622834E3C0A13DC6469E3479B28C1D33C69C5D2D6F69810D2DF044BDC4869284
      AFCA90FE63C62C21D5E1A9CBB4A7476B0BFC2CFE94EE9163078C168C1F3F5EF4
      75812AB30691C5A20D0FA5AA02F7A2AAF299E7E9D3E2803F1BD171F35BF5F161
      48BB052CACE7EBF4A6F9F5BC74A8A7C3E200374538A9D9E4BAB949B89606285E
      9791B210A919521620772DC2A207B73675CCB06C0358956B5F89C567FFFCC43F
      50931BDE4836EB8A640B642F8B565651AF607C6A2830D85F1EFAA28DFCBDFB5A
      AB3E52159A4830F807D970CB84AF2E8584E1B3A3213E111113223A4242F1912A
      7FC02F98C5BD606D01B2E75E7B54462CCE94C890389974C937C6F20C6EE0B163
      C7E0066432B42AC2E8E52DF14DA95019DFE5AB0AA189F372C0BC99176F957B97
      6591AD16A71D27E489DEEB2BD5535D8423786BC1B1235892116360CE8043061F
      19E692D38ACEEBF4952B8E5AF46807F6B65197502D282929B96DE2A4712FE25B
      21991456055ED5AACAC78DE18E83FB0FDC55954E0032A38114201BE0A8AC17E8
      25C0E5C04060007029D003E0A5B129687D201CB001671C5888DDC91613E4293B
      63437FBE02AA99FF15E3A21158ED5BDD9888FD5BEB71110B573726A2CE598D8B
      7C8D89FEB6A2B994976832FD928DB4EF05EE6E86B0AAF10E47149EF993D776C3
      C2B82075F61DB5F83C3566328CB9198B03CF118239CD939D39FDF80F5DD40931
      34280CAF38B8FE0077DF92E66EB31584078D91E2D8C648B8191A66ED0973FEB8
      0EDF298D0796B591D25322CF5E5E832E32D7D093A7354F19D39413E409F26678
      74911DDF5DAB407252AAA4D44B13520EBAC8EBC01953E9EAC63CD3BADCD2459E
      E39A4347F71B179C891327C8D8B18FE8E5BCA867595DC1DA028C8BFC4C488CAB
      2F49F1C942CA1690D7A1EB711B117A5A37AC536B0B302ED233480B0A0F1B2D78
      F4D14764FCF809145BC09B750E027C8D89A86867A4431FEBF8A2D4A94C6ECE23
      6F86B50518DB9833759EE320F23A25EF89CAF22C2DE0B8A852D022B5DD18B12C
      43467FD65238CC098EB4CBF5AF25CBF5F312A86501D52D829A2666F6CD97E080
      3009C1911C1E11269131613277E861AFE2B576404B13BA7D858FCA8762E17FA8
      FCF3F26D1479C1B20DBC726B20A86CC0A517552DC051E8352ED2C73D3A65019D
      AF8A9ED5B8A8BA31112B51372E622FD4E1DCF6809FC91C47793C2E480966919A
      654C534E9037E751E6052A51D80B91F9F1C60D48BF0D1403E6D00F09EA75015D
      0AE841D72F85C009188135608285483310A503AF0191801E72C1F01E60116838
      B0146030EB87411000E895062BAEE7078A7345542A74B112E2A6249B18014381
      60400FA1607E0712011AB6835A82BF2525F2A329CDDAE8C90E608A804D401A60
      0EC5489C0418CA1801740622EAF2A21877D41E341760303B2F878086407C5EF6
      4E3103A06182DB812DF56702727E9D8E445A213E06EC14910C201F30876B90F8
      06381F780BD0C32D60160274A4B7064989674444206AEC46346814500FA80F34
      0172003A4C054D0098AFE7B15C03C8684C7B72D9531A78220F94FA20AEFF1F70
      EF20D8F7440872884850162092C1B332CC6717308F1522D5DE5EFF8E96DC3999
      7AA3A1D71C480454B021E61E409037C30F79DA134BA7B0209184348D539750F9
      1F6DFC481B396F24F389B6D0490342816A038D3C14D73C4E7BE0CDD11AB409D6
      2C08BC1D3F2AD456EF58ADDDF3DE08CA8987216F06C402FE40B581AD614DB4F9
      ABDFD4EE9E73178D106C89B67EEF7AED9EF7EFD1068FBC9A32A21D2CB2EFD9BD
      2C8B64F58135B9116ADAA79B3ED586CEB85623BF61EF06ED8EF7EFD0AE9F3E54
      A5211B03586ACFFE83ACDA40035BA035A6D7901E180C27C95DA3EE92B91B5F97
      F2A25239BDB958367CBB09D9F210A202A0102803BC0E34CA7C810E58E0C69B3B
      DF22D9F858C9DAFD6B2452C225785F90CC9FFE36CB8C4574123801509765C0D6
      3CB03FD9AFDA9C5573B4473E1CA30D9F3B4CBBE8BA0B6988680F5367DCF72863
      09DC163740A24DC56E3B7CCA301A26C640D60CA8F19E035D9FC168058D9B6ADF
      0EDAA9005B481DB0B50F462B6082B53F1F340788019807727681350C81896420
      1BE02C59026820C03C90B30F3CBA83612612E0B9E99C1A87CDBA50D703FFC91E
      F03C307AC1F972400F3789C8DBC049C01CFA23413D0E219780D7C34D22B20028
      051C80D7E99A85286F86281B78454478510751A13562E62D04E5C842374E99AE
      1F893C1E7820DE43472544140E1C03184219B9F1839BDE2422667918D2478164
      8081473AA9D7D85409117D07E88117779DEF01A610A0A30C503DD8C09C028E03
      E4CB4055303CA95445D45D448DF2402C9560417D7BD010F3CDD0F30C59650E4A
      A0C14B1F88943272E34BD02DC05080A76A52B0C216EF07733B100104023E4314
      A4596EC481C6000D8086402ED012E0C66C0CCAA1652CA89EC7729473381302F9
      7F26F899DDECE899AADDDC20FCF40319315FDE991659745F7AF4D7B7368C3835
      BA49F4573736082F79302366D5D094F0B2873362BEB83D35E2E4FD90EBF4FA94
      F0D287903F6347E1136E9B4E373588EDFB0B5212E96443D7060966AACB755A59
      3EE5B0C6ED1A0C5A17EA7AE0CFD203FF03D6E5334CC5623EA80000000049454E
      4400000000}
  end
  object ecSelCharPopup1: TecSelCharPopup
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
    Controls = <>
    OnChange = ecSelCharPopup1Change
    OnShow = ecSelCharPopup1Show
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
      'bbg*.Caption'
      'bBk*.Caption'
      'ec*.Category'
      'ecACP.*'
      'ecSyntPrinter.*'
      'f*.Category'
      'MRU.*'
      'PropsManager*.*'
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
    Left = 609
    Top = 233
    LangData = {
      0600666D4D61696E00019E0300000A00544258446F636B546F70000006007462
      46696C650101000000B5020000070043617074696F6E000E005442584974656D
      546F6F6C4E65770102000000B6020000070043617074696F6EB7020000040048
      696E740016005442585375626D656E754974656D546F6F6C4F70656E01020000
      00B8020000070043617074696F6EB9020000040048696E740006004D52557462
      7800001100544258536570617261746F724974656D3700000A00544258497465
      6D436C720102000000BA020000070043617074696F6EBB020000040048696E74
      0016005442585375626D656E754974656D546F6F6C536176650102000000BC02
      0000070043617074696F6EBD020000040048696E740008005442584974656D34
      0102000000BE020000070043617074696F6EBF020000040048696E7400090054
      42584974656D31310102000000C0020000070043617074696F6EC10200000400
      48696E740009005442584974656D31350102000000C202000007004361707469
      6F6EC3020000040048696E740010005442584974656D546F6F6C5072696E7401
      02000000C4020000070043617074696F6EC5020000040048696E74000E005442
      584974656D507265766965770102000000C6020000070043617074696F6EC702
      0000040048696E74000C005442584974656D50616765530102000000C8020000
      070043617074696F6EC9020000040048696E74000D005442584974656D507269
      6E74530102000000CA020000070043617074696F6ECB020000040048696E7400
      1100544258536570617261746F724974656D38000014005442585375626D656E
      754974656D546246696E640102000000CC020000070043617074696F6ECD0200
      00040048696E74000C005442584974656D464E6578740102000000CE02000007
      0043617074696F6ECF020000040048696E74000C005442584974656D46507265
      760102000000D0020000070043617074696F6ED1020000040048696E74001100
      544258536570617261746F724974656D3900000C005442584974656D574E6578
      740102000000D2020000070043617074696F6ED3020000040048696E74000D00
      5442584974656D575072696F720102000000D4020000070043617074696F6ED5
      020000040048696E74001200544258536570617261746F724974656D31310000
      08005442584974656D320102000000D6020000070043617074696F6ED7020000
      040048696E74001100544258536570617261746F724974656D31000015005442
      585375626D656E754974656D546253657475700102000000F202000007004361
      7074696F6EF3020000040048696E74000C005442584974656D4F4F4C65780102
      000000F4020000070043617074696F6EF5020000040048696E74000F00544258
      4974656D4F4F4C65784C69620102000000F6020000070043617074696F6EF702
      0000040048696E740006007462456469740101000000FA020000070043617074
      696F6E000D005442584974656D5462436F70790102000000FB02000007004361
      7074696F6EFC020000040048696E74000C005442584974656D54624375740102
      000000FD020000070043617074696F6EFE020000040048696E74000E00544258
      4974656D546250617374650102000000FF020000070043617074696F6E000300
      00040048696E74000C005442584974656D546244656C01020000000103000007
      0043617074696F6E02030000040048696E74000F005442584974656D54625365
      6C416C6C010200000003030000070043617074696F6E04030000040048696E74
      001100544258536570617261746F724974656D3300000D005442584974656D54
      62556E646F010200000005030000070043617074696F6E06030000040048696E
      74000D005442584974656D54625265646F010200000007030000070043617074
      696F6E08030000040048696E74001100544258536570617261746F724974656D
      34000012005442585375626D656E754974656D536F7274010200000009030000
      070043617074696F6EEC080000040048696E740010005442584974656D546253
      6F727441736301020000000B030000070043617074696F6E0C03000004004869
      6E740011005442584974656D5462536F72744465736301020000000D03000007
      0043617074696F6E0E030000040048696E74000E005442585375626D656E7543
      61736501020000000F030000070043617074696F6E10030000040048696E7400
      0E005442584974656D4343557070657201020000001103000007004361707469
      6F6E12030000040048696E74000E005442584974656D43434C6F776572010200
      000013030000070043617074696F6E14030000040048696E74000E0054425849
      74656D43435469746C65010200000015030000070043617074696F6E16030000
      040048696E74000C005442584974656D4343496E760102000000170300000700
      43617074696F6E18030000040048696E74000B00544258446F636B4C65667400
      000600746256696577010100000019030000070043617074696F6E000C005442
      584974656D565472656501020000001A030000070043617074696F6E1B030000
      040048696E74000C005442584974656D56466F6C6401020000001C0300000700
      43617074696F6E1D030000040048696E74000C005442584974656D5657726170
      01020000001E030000070043617074696F6E1F030000040048696E74000C0054
      42584974656D564E756D73010200000020030000070043617074696F6E210300
      00040048696E74000D005442584974656D564E6F6E7072010200000022030000
      070043617074696F6E23030000040048696E7400110054425853657061726174
      6F724974656D3200000C005442584974656D56436F6D6D010200000024030000
      070043617074696F6E25030000040048696E74000D005442584974656D56556E
      636F6D010200000026030000070043617074696F6E27030000040048696E7400
      1200544258536570617261746F724974656D313000000B005442584974656D56
      496E64010200000028030000070043617074696F6E29030000040048696E7400
      0D005442584974656D56556E696E6401020000002A030000070043617074696F
      6E2B030000040048696E74000600706C54726565000004005472656500000D00
      544258446F636B426F74746F6D00000C00544258446F636B5269676874000006
      0053746174757301090000002E0300000E0050616E656C735B315D2E48696E74
      2F0300000E0050616E656C735B325D2E48696E74300300000E0050616E656C73
      5B335D2E48696E74310300000E0050616E656C735B345D2E48696E7432030000
      0E0050616E656C735B355D2E48696E74330300000E0050616E656C735B365D2E
      48696E74030600000E0050616E656C735B375D2E48696E741D0600000E005061
      6E656C735B385D2E48696E74D70600000E0050616E656C735B395D2E48696E74
      0004004D656E750000060074624D656E750101000000FB050000070043617074
      696F6E0012005442585375626D656E754974656D46696C650101000000350300
      00070043617074696F6E0012005442585375626D656E754974656D464E657701
      0100000036030000070043617074696F6E000B005442584974656D464E657701
      0200000037030000070043617074696F6E38030000040048696E74000E005442
      584974656D464E657757696E010200000039030000070043617074696F6E2505
      0000040048696E74000C005442584974656D464F70656E01020000003A030000
      070043617074696F6E3B030000040048696E74000E005442584974656D465265
      6F70656E01020000003C030000070043617074696F6E3D030000040048696E74
      000C005442584974656D465361766501020000003E030000070043617074696F
      6E3F030000040048696E74000E005442584974656D4653617665417301020000
      0040030000070043617074696F6E41030000040048696E740010005442585375
      626D656E754974656D3132010100000042030000070043617074696F6E000F00
      5442584974656D4645787048746D6C010200000043030000070043617074696F
      6E44030000040048696E74000E005442584974656D4645787052746601020000
      0045030000070043617074696F6E46030000040048696E740012005442585365
      70617261746F724974656D313600000D005442584974656D465072696E740102
      00000048030000070043617074696F6E49030000040048696E74000F00544258
      4974656D465072657669657701020000004A030000070043617074696F6E4B03
      0000040048696E740011005442584974656D4650616765536574757001020000
      004C030000070043617074696F6E4D030000040048696E740014005442584974
      656D465072696E746572536574757001020000004E030000070043617074696F
      6E4F030000040048696E74001200544258536570617261746F724974656D3135
      00000C005442584974656D464578697401020000005003000007004361707469
      6F6E26050000040048696E740010005442585375626D656E754974656D456401
      0100000051030000070043617074696F6E000C005442584974656D45556E646F
      010200000052030000070043617074696F6E53030000040048696E74000C0054
      42584974656D455265646F010200000054030000070043617074696F6E550300
      00040048696E74001100544258536570617261746F724974656D3600000B0054
      42584974656D45437574010200000056030000070043617074696F6E57030000
      040048696E74000C005442584974656D45436F70790102000000580300000700
      43617074696F6E59030000040048696E74000D005442584974656D4550617374
      6501020000005A030000070043617074696F6E5B030000040048696E74000E00
      5442584974656D4544656C65746501020000005C030000070043617074696F6E
      5D030000040048696E740011005442584974656D4553656C656374416C6C0102
      0000005E030000070043617074696F6E5F030000040048696E74001200544258
      536570617261746F724974656D313700000E005442584974656D45496E64656E
      74010200000064030000070043617074696F6E65030000040048696E74001000
      5442584974656D45556E696E64656E7401020000006603000007004361707469
      6F6E67030000040048696E74000B005442584974656D45447570010200000068
      030000070043617074696F6E22050000040048696E74000D005442584974656D
      455461626C65010200000069030000070043617074696F6E2305000004004869
      6E740010005442585375626D656E754974656D313901010000006A0300000700
      43617074696F6E000F005442584974656D45536F727441736301020000006C03
      0000070043617074696F6E6D030000040048696E740010005442584974656D45
      536F72744465736301020000006E030000070043617074696F6E6F0300000400
      48696E740010005442585375626D656E754974656D3230010100000070030000
      070043617074696F6E0011005442584974656D45436173655570706572010200
      000072030000070043617074696F6E73030000040048696E7400110054425849
      74656D45436173654C6F776572010200000074030000070043617074696F6E75
      030000040048696E740011005442584974656D45436173655469746C65010200
      000076030000070043617074696F6E77030000040048696E7400120054425849
      74656D4543617365496E76657274010200000078030000070043617074696F6E
      79030000040048696E740010005442585375626D656E754974656D5372010100
      000090030000070043617074696F6E000C005442584974656D534E6578740102
      00000093030000070043617074696F6E94030000040048696E74000C00544258
      4974656D5350726576010200000095030000070043617074696F6E9603000004
      0048696E74001200544258536570617261746F724974656D3139000010005442
      584974656D53576F72644E657874010200000097030000070043617074696F6E
      98030000040048696E740011005442584974656D53576F72645072696F720102
      00000099030000070043617074696F6E9A030000040048696E74001200544258
      536570617261746F724974656D3230000010005442584974656D534D61726B4E
      65787401020000009B030000070043617074696F6E12050000040048696E7400
      10005442584974656D534D61726B5072657601020000009C0300000700436170
      74696F6E13050000040048696E740011005442584974656D534D61726B436C65
      617201020000009D030000070043617074696F6E9E030000040048696E740012
      00544258536570617261746F724974656D323100000C005442584974656D5347
      6F746F01020000009F030000070043617074696F6EA0030000040048696E7400
      10005442585375626D656E754974656D426B0101000000A10300000700436170
      74696F6E0013005442585375626D656E754974656D426B5365740102000000A2
      030000070043617074696F6E11070000040048696E740009005442584974656D
      47300101000000A3030000070043617074696F6E0009005442584974656D4731
      0101000000A4030000070043617074696F6E0009005442584974656D47320101
      000000A5030000070043617074696F6E0009005442584974656D473301010000
      00A6030000070043617074696F6E0009005442584974656D47340101000000A7
      030000070043617074696F6E0009005442584974656D47350101000000A80300
      00070043617074696F6E0009005442584974656D47360101000000A903000007
      0043617074696F6E0009005442584974656D47370101000000AA030000070043
      617074696F6E0009005442584974656D47380101000000AB0300000700436170
      74696F6E0009005442584974656D47390101000000AC03000007004361707469
      6F6E0014005442585375626D656E754974656D426B476F746F0102000000AD03
      0000070043617074696F6E12070000040048696E740009005442584974656D42
      300101000000AE030000070043617074696F6E0009005442584974656D423101
      01000000AF030000070043617074696F6E0009005442584974656D4232010100
      0000B0030000070043617074696F6E0009005442584974656D42330101000000
      B1030000070043617074696F6E0009005442584974656D42340101000000B203
      0000070043617074696F6E0009005442584974656D42350101000000B3030000
      070043617074696F6E0009005442584974656D42360101000000B40300000700
      43617074696F6E0009005442584974656D42370101000000B503000007004361
      7074696F6E0009005442584974656D42380101000000B6030000070043617074
      696F6E0009005442584974656D42390101000000B7030000070043617074696F
      6E0013005442585375626D656E754974656D4C657865720101000000BA030000
      070043617074696F6E0011005442585375626D656E754974656D4F7074010100
      0000BB030000070043617074696F6E000D005442584974656D4F536574757001
      02000000BC030000070043617074696F6EBD030000040048696E74000D005442
      584974656D4F4C657865720102000000BE030000070043617074696F6EBF0300
      00040048696E740010005442584974656D4F4C657865724C69620102000000C0
      030000070043617074696F6EC1030000040048696E74000A005442584974656D
      4F524F0102000000C3030000070043617074696F6EC4030000040048696E7400
      0C005442584974656D4F547265650102000000C5030000070043617074696F6E
      C6030000040048696E74000C005442584974656D4F466F6C640102000000C703
      0000070043617074696F6EC8030000040048696E74000C005442584974656D4F
      577261700102000000C9030000070043617074696F6ECA030000040048696E74
      000C005442584974656D4F4E756D730102000000CB030000070043617074696F
      6ECC030000040048696E74000E005442584974656D4F4E5072696E7401020000
      00CD030000070043617074696F6ECE030000040048696E740012005442585375
      626D656E754974656D48656C700101000000CF030000070043617074696F6E00
      0C005442584974656D48526561640102000000D0030000070043617074696F6E
      20050000040048696E74000D005442584974656D4841626F75740102000000D1
      030000070043617074696F6E21050000040048696E7400060050616E656C3100
      000C0050616765436F6E74726F6C3100000E0054656D706C617465456469746F
      7200000A00416374696F6E4C69737400000D0065635072696E74416374696F6E
      010200000006000000070043617074696F6E07000000040048696E74000F0065
      6350726576696577416374696F6E010200000009000000070043617074696F6E
      0A000000040048696E740011006563506167655365747570416374696F6E0102
      0000000C000000070043617074696F6E0D000000040048696E74000400664E65
      7701020000000F000000070043617074696F6E10000000040048696E74000700
      664E657757696E010100000012000000070043617074696F6E000E0065635072
      696E7465725365747570010200000014000000070043617074696F6E15000000
      040048696E74000500664F70656E010200000017000000070043617074696F6E
      18000000040048696E740007006652657265616401020000001A000000070043
      617074696F6E1B000000040048696E74000500665361766501020000001D0000
      00070043617074696F6E1E000000040048696E74000700665361766541730102
      00000020000000070043617074696F6E21000000040048696E74001000664578
      706F7274525446416374696F6E010400000023000000070043617074696F6E25
      0000000A0044656661756C7445787426000000060046696C7465722400000004
      0048696E74001100664578706F727448544D4C416374696F6E01040000002800
      0000070043617074696F6E2A0000000A0044656661756C744578742B00000006
      0046696C74657229000000040048696E7400060066536574757001020000002D
      000000070043617074696F6E2E000000040048696E74000F0066437573746F6D
      697A654C65786572010200000030000000070043617074696F6E310000000400
      48696E7400120066437573746F6D697A654C657865724C696201020000003300
      0000070043617074696F6E34000000040048696E740006006563436F70790102
      00000036000000070043617074696F6E37000000040048696E74000500656343
      757401020000003C000000070043617074696F6E3D000000040048696E740007
      006563506173746501020000003F000000070043617074696F6E400000000400
      48696E740007006563436C656172010200000042000000070043617074696F6E
      43000000040048696E74000B00656353656C656374416C6C0102000000450000
      00070043617074696F6E46000000040048696E740006006563556E646F010200
      000048000000070043617074696F6E49000000040048696E7400060065635265
      646F01020000004B000000070043617074696F6E4C000000040048696E740008
      006563496E64656E7401020000004E000000070043617074696F6E4F00000004
      0048696E74000A006563556E696E64656E740102000000510000000700436170
      74696F6E52000000040048696E74000B0065634C6F7765724361736501010000
      0054000000070043617074696F6E000B00656355707065724361736501010000
      0056000000070043617074696F6E000B0065635469746C654361736501010000
      0058000000070043617074696F6E000C006563546F67676C6543617365010100
      00005A000000070043617074696F6E000E006563436F6D6D656E744C696E6573
      01020000005C000000070043617074696F6E5D000000040048696E7400100065
      63556E436F6D6D656E744C696E657301020000005F000000070043617074696F
      6E60000000040048696E74000600656354726565010200000062000000070043
      617074696F6E63000000040048696E74000F006563536F7274417363656E6469
      6E67010200000065000000070043617074696F6E66000000040048696E740010
      006563536F727444657363656E64696E67010200000068000000070043617074
      696F6E69000000040048696E74000A006563526561644F6E6C7901020000006E
      000000070043617074696F6E6F000000040048696E74000600656346696E6401
      0100000072000000040048696E74000600656357726170010200000074000000
      070043617074696F6E75000000040048696E7400070065634C696E6573010200
      000077000000070043617074696F6E78000000040048696E740006006563466F
      6C6401020000007A000000070043617074696F6E7B000000040048696E740008
      0065634E5072696E7401020000007D000000070043617074696F6E7E00000004
      0048696E740002005344000002004F4401010000007F000000060046696C7465
      72000D0053796E7461784D616E616765720101000000800000000D004D656E75
      506C61696E54657874000C0050726F70734D616E6167657200000D0065635379
      6E745072696E74657200000B00506F707570456469746F7200000E0054425849
      74656D437478556E646F0102000000D2030000070043617074696F6ED3030000
      040048696E74000E005442584974656D4374785265646F0102000000D4030000
      070043617074696F6ED5030000040048696E7400120054425853657061726174
      6F724974656D313400000D005442584974656D4374784375740102000000D603
      0000070043617074696F6ED7030000040048696E74000E005442584974656D43
      7478436F70790102000000D8030000070043617074696F6ED903000004004869
      6E74000F005442584974656D43747850617374650102000000DA030000070043
      617074696F6EDB030000040048696E74000D005442584974656D43747844656C
      0102000000DC030000070043617074696F6EDD030000040048696E7400130054
      42584974656D43747853656C656374416C6C0102000000DE0300000700436170
      74696F6EDF030000040048696E74000D00496D674C6973744775747465720000
      0B005442585377697463686572000003004D525500000E0053796E744B65794D
      617070696E67010D0400008700000010004974656D735B305D2E43617074696F
      6EF403000011004974656D735B305D2E43617465676F72798900000014004974
      656D735B305D2E446973706C61794E616D655804000013004974656D735B3130
      305D2E43617465676F72797B01000016004974656D735B3130305D2E44697370
      6C61794E616D655904000013004974656D735B3130315D2E43617465676F7279
      7D01000016004974656D735B3130315D2E446973706C61794E616D655A040000
      13004974656D735B3130325D2E43617465676F72797F01000016004974656D73
      5B3130325D2E446973706C61794E616D655B04000013004974656D735B313033
      5D2E43617465676F72798101000016004974656D735B3130335D2E446973706C
      61794E616D655C04000013004974656D735B3130345D2E43617465676F727983
      01000016004974656D735B3130345D2E446973706C61794E616D655D04000013
      004974656D735B3130355D2E43617465676F72798501000016004974656D735B
      3130355D2E446973706C61794E616D655E04000013004974656D735B3130365D
      2E43617465676F72798701000016004974656D735B3130365D2E446973706C61
      794E616D655F04000013004974656D735B3130375D2E43617465676F72798901
      000016004974656D735B3130375D2E446973706C61794E616D65EA0400001200
      4974656D735B3130385D2E43617074696F6E6004000013004974656D735B3130
      385D2E43617465676F72798C01000016004974656D735B3130385D2E44697370
      6C61794E616D658D01000012004974656D735B3130395D2E43617074696F6E61
      04000013004974656D735B3130395D2E43617465676F72798F01000016004974
      656D735B3130395D2E446973706C61794E616D65FE03000012004974656D735B
      31305D2E43617465676F7279A400000015004974656D735B31305D2E44697370
      6C61794E616D659001000012004974656D735B3131305D2E43617074696F6E62
      04000013004974656D735B3131305D2E43617465676F72799201000016004974
      656D735B3131305D2E446973706C61794E616D659301000012004974656D735B
      3131315D2E43617074696F6E6304000013004974656D735B3131315D2E436174
      65676F72799501000016004974656D735B3131315D2E446973706C61794E616D
      659601000012004974656D735B3131325D2E43617074696F6E64040000130049
      74656D735B3131325D2E43617465676F72799801000016004974656D735B3131
      325D2E446973706C61794E616D659901000012004974656D735B3131335D2E43
      617074696F6E6504000013004974656D735B3131335D2E43617465676F72799B
      01000016004974656D735B3131335D2E446973706C61794E616D659C01000012
      004974656D735B3131345D2E43617074696F6E6604000013004974656D735B31
      31345D2E43617465676F72799E01000016004974656D735B3131345D2E446973
      706C61794E616D659F01000012004974656D735B3131355D2E43617074696F6E
      6704000013004974656D735B3131355D2E43617465676F7279A1010000160049
      74656D735B3131355D2E446973706C61794E616D65A201000012004974656D73
      5B3131365D2E43617074696F6E6804000013004974656D735B3131365D2E4361
      7465676F7279A401000016004974656D735B3131365D2E446973706C61794E61
      6D65A501000012004974656D735B3131375D2E43617074696F6E690400001300
      4974656D735B3131375D2E43617465676F7279A701000016004974656D735B31
      31375D2E446973706C61794E616D65A801000012004974656D735B3131385D2E
      43617074696F6E6A04000013004974656D735B3131385D2E43617465676F7279
      AA01000016004974656D735B3131385D2E446973706C61794E616D65AB010000
      12004974656D735B3131395D2E43617074696F6E6B04000013004974656D735B
      3131395D2E43617465676F7279AD01000016004974656D735B3131395D2E4469
      73706C61794E616D65FF03000012004974656D735B31315D2E43617465676F72
      79A600000015004974656D735B31315D2E446973706C61794E616D65AE010000
      12004974656D735B3132305D2E43617074696F6E6C04000013004974656D735B
      3132305D2E43617465676F7279B001000016004974656D735B3132305D2E4469
      73706C61794E616D65B101000012004974656D735B3132315D2E43617074696F
      6E6D04000013004974656D735B3132315D2E43617465676F7279B30100001600
      4974656D735B3132315D2E446973706C61794E616D65B401000012004974656D
      735B3132325D2E43617074696F6E6E04000013004974656D735B3132325D2E43
      617465676F7279B601000016004974656D735B3132325D2E446973706C61794E
      616D65B701000012004974656D735B3132335D2E43617074696F6E6F04000013
      004974656D735B3132335D2E43617465676F7279B901000016004974656D735B
      3132335D2E446973706C61794E616D65BA01000012004974656D735B3132345D
      2E43617074696F6E7004000013004974656D735B3132345D2E43617465676F72
      79BC01000016004974656D735B3132345D2E446973706C61794E616D65BD0100
      0012004974656D735B3132355D2E43617074696F6E7104000013004974656D73
      5B3132355D2E43617465676F7279BF01000016004974656D735B3132355D2E44
      6973706C61794E616D65C001000012004974656D735B3132365D2E4361707469
      6F6E7204000013004974656D735B3132365D2E43617465676F7279C201000016
      004974656D735B3132365D2E446973706C61794E616D65C30100001200497465
      6D735B3132375D2E43617074696F6E7304000013004974656D735B3132375D2E
      43617465676F7279C501000016004974656D735B3132375D2E446973706C6179
      4E616D65C601000012004974656D735B3132385D2E43617074696F6E74040000
      13004974656D735B3132385D2E43617465676F7279C801000016004974656D73
      5B3132385D2E446973706C61794E616D657504000013004974656D735B313239
      5D2E43617465676F7279CA01000016004974656D735B3132395D2E446973706C
      61794E616D650004000012004974656D735B31325D2E43617465676F7279A800
      000015004974656D735B31325D2E446973706C61794E616D6576040000130049
      74656D735B3133305D2E43617465676F7279CC01000016004974656D735B3133
      305D2E446973706C61794E616D657704000013004974656D735B3133315D2E43
      617465676F7279CE01000016004974656D735B3133315D2E446973706C61794E
      616D657804000013004974656D735B3133325D2E43617465676F7279D0010000
      16004974656D735B3133325D2E446973706C61794E616D65EB04000012004974
      656D735B3133335D2E43617074696F6E7904000013004974656D735B3133335D
      2E43617465676F7279D301000016004974656D735B3133335D2E446973706C61
      794E616D65D401000012004974656D735B3133345D2E43617074696F6E7A0400
      0013004974656D735B3133345D2E43617465676F7279D601000016004974656D
      735B3133345D2E446973706C61794E616D657B04000013004974656D735B3133
      355D2E43617465676F7279D801000016004974656D735B3133355D2E44697370
      6C61794E616D657C04000013004974656D735B3133365D2E43617465676F7279
      DA01000016004974656D735B3133365D2E446973706C61794E616D65EC040000
      12004974656D735B3133375D2E43617074696F6E7D04000013004974656D735B
      3133375D2E43617465676F7279DD01000016004974656D735B3133375D2E4469
      73706C61794E616D65DE01000012004974656D735B3133385D2E43617074696F
      6E7E04000013004974656D735B3133385D2E43617465676F7279E00100001600
      4974656D735B3133385D2E446973706C61794E616D65E101000012004974656D
      735B3133395D2E43617074696F6E7F04000013004974656D735B3133395D2E43
      617465676F7279E301000016004974656D735B3133395D2E446973706C61794E
      616D650104000012004974656D735B31335D2E43617465676F7279AA00000015
      004974656D735B31335D2E446973706C61794E616D65E401000012004974656D
      735B3134305D2E43617074696F6E8004000013004974656D735B3134305D2E43
      617465676F7279E601000016004974656D735B3134305D2E446973706C61794E
      616D65E701000012004974656D735B3134315D2E43617074696F6E8104000013
      004974656D735B3134315D2E43617465676F7279E901000016004974656D735B
      3134315D2E446973706C61794E616D65EA01000012004974656D735B3134325D
      2E43617074696F6E8204000013004974656D735B3134325D2E43617465676F72
      79EC01000016004974656D735B3134325D2E446973706C61794E616D65ED0100
      0012004974656D735B3134335D2E43617074696F6E8304000013004974656D73
      5B3134335D2E43617465676F7279EF01000016004974656D735B3134335D2E44
      6973706C61794E616D65F001000012004974656D735B3134345D2E4361707469
      6F6E8404000013004974656D735B3134345D2E43617465676F7279F201000016
      004974656D735B3134345D2E446973706C61794E616D65F30100001200497465
      6D735B3134355D2E43617074696F6E8504000013004974656D735B3134355D2E
      43617465676F7279F501000016004974656D735B3134355D2E446973706C6179
      4E616D65F601000012004974656D735B3134365D2E43617074696F6E86040000
      13004974656D735B3134365D2E43617465676F7279F801000016004974656D73
      5B3134365D2E446973706C61794E616D65F901000012004974656D735B313437
      5D2E43617074696F6E8704000013004974656D735B3134375D2E43617465676F
      7279FB01000016004974656D735B3134375D2E446973706C61794E616D65FC01
      000012004974656D735B3134385D2E43617074696F6E8804000013004974656D
      735B3134385D2E43617465676F7279FE01000016004974656D735B3134385D2E
      446973706C61794E616D65FF01000012004974656D735B3134395D2E43617074
      696F6E8904000013004974656D735B3134395D2E43617465676F727901020000
      16004974656D735B3134395D2E446973706C61794E616D650204000012004974
      656D735B31345D2E43617465676F7279AC00000015004974656D735B31345D2E
      446973706C61794E616D650202000012004974656D735B3135305D2E43617074
      696F6E8A04000013004974656D735B3135305D2E43617465676F727904020000
      16004974656D735B3135305D2E446973706C61794E616D650502000012004974
      656D735B3135315D2E43617074696F6E8B04000013004974656D735B3135315D
      2E43617465676F72790702000016004974656D735B3135315D2E446973706C61
      794E616D650802000012004974656D735B3135325D2E43617074696F6E8C0400
      0013004974656D735B3135325D2E43617465676F72790A02000016004974656D
      735B3135325D2E446973706C61794E616D650B02000012004974656D735B3135
      335D2E43617074696F6E8D04000013004974656D735B3135335D2E4361746567
      6F72790D02000016004974656D735B3135335D2E446973706C61794E616D650E
      02000012004974656D735B3135345D2E43617074696F6E8E0400001300497465
      6D735B3135345D2E43617465676F72791002000016004974656D735B3135345D
      2E446973706C61794E616D651102000012004974656D735B3135355D2E436170
      74696F6E8F04000013004974656D735B3135355D2E43617465676F7279130200
      0016004974656D735B3135355D2E446973706C61794E616D6514020000120049
      74656D735B3135365D2E43617074696F6E9004000013004974656D735B313536
      5D2E43617465676F72791602000016004974656D735B3135365D2E446973706C
      61794E616D651702000012004974656D735B3135375D2E43617074696F6E9104
      000013004974656D735B3135375D2E43617465676F7279190200001600497465
      6D735B3135375D2E446973706C61794E616D651A02000012004974656D735B31
      35385D2E43617074696F6E9204000013004974656D735B3135385D2E43617465
      676F72791C02000016004974656D735B3135385D2E446973706C61794E616D65
      1D02000012004974656D735B3135395D2E43617074696F6E9304000013004974
      656D735B3135395D2E43617465676F72791F02000016004974656D735B313539
      5D2E446973706C61794E616D650304000012004974656D735B31355D2E436174
      65676F7279AE00000015004974656D735B31355D2E446973706C61794E616D65
      2002000012004974656D735B3136305D2E43617074696F6E9404000013004974
      656D735B3136305D2E43617465676F72792202000016004974656D735B313630
      5D2E446973706C61794E616D652302000012004974656D735B3136315D2E4361
      7074696F6E9504000013004974656D735B3136315D2E43617465676F72792502
      000016004974656D735B3136315D2E446973706C61794E616D65260200001200
      4974656D735B3136325D2E43617074696F6E9604000013004974656D735B3136
      325D2E43617465676F72792802000016004974656D735B3136325D2E44697370
      6C61794E616D652902000012004974656D735B3136335D2E43617074696F6E97
      04000013004974656D735B3136335D2E43617465676F72792B02000016004974
      656D735B3136335D2E446973706C61794E616D652C02000012004974656D735B
      3136345D2E43617074696F6E9804000013004974656D735B3136345D2E436174
      65676F72792E02000016004974656D735B3136345D2E446973706C61794E616D
      652F02000012004974656D735B3136355D2E43617074696F6E99040000130049
      74656D735B3136355D2E43617465676F72793102000016004974656D735B3136
      355D2E446973706C61794E616D653202000012004974656D735B3136365D2E43
      617074696F6E9A04000013004974656D735B3136365D2E43617465676F727934
      02000016004974656D735B3136365D2E446973706C61794E616D653502000012
      004974656D735B3136375D2E43617074696F6E9B04000013004974656D735B31
      36375D2E43617465676F72793702000016004974656D735B3136375D2E446973
      706C61794E616D653802000012004974656D735B3136385D2E43617074696F6E
      9C04000013004974656D735B3136385D2E43617465676F72793A020000160049
      74656D735B3136385D2E446973706C61794E616D653B02000012004974656D73
      5B3136395D2E43617074696F6E9D04000013004974656D735B3136395D2E4361
      7465676F72793D02000016004974656D735B3136395D2E446973706C61794E61
      6D650404000012004974656D735B31365D2E43617465676F7279B00000001500
      4974656D735B31365D2E446973706C61794E616D653E02000012004974656D73
      5B3137305D2E43617074696F6E9E04000013004974656D735B3137305D2E4361
      7465676F72794002000016004974656D735B3137305D2E446973706C61794E61
      6D654102000012004974656D735B3137315D2E43617074696F6E9F0400001300
      4974656D735B3137315D2E43617465676F72794302000016004974656D735B31
      37315D2E446973706C61794E616D654402000012004974656D735B3137325D2E
      43617074696F6EA004000013004974656D735B3137325D2E43617465676F7279
      4602000016004974656D735B3137325D2E446973706C61794E616D6547020000
      12004974656D735B3137335D2E43617074696F6EA104000013004974656D735B
      3137335D2E43617465676F72794902000016004974656D735B3137335D2E4469
      73706C61794E616D654A02000012004974656D735B3137345D2E43617074696F
      6EA204000013004974656D735B3137345D2E43617465676F72794C0200001600
      4974656D735B3137345D2E446973706C61794E616D654D02000012004974656D
      735B3137355D2E43617074696F6EA304000013004974656D735B3137355D2E43
      617465676F72794F02000016004974656D735B3137355D2E446973706C61794E
      616D655002000012004974656D735B3137365D2E43617074696F6EA404000013
      004974656D735B3137365D2E43617465676F72795202000016004974656D735B
      3137365D2E446973706C61794E616D655302000012004974656D735B3137375D
      2E43617074696F6EA504000013004974656D735B3137375D2E43617465676F72
      795502000016004974656D735B3137375D2E446973706C61794E616D65560200
      0012004974656D735B3137385D2E43617074696F6EA604000013004974656D73
      5B3137385D2E43617465676F72795802000016004974656D735B3137385D2E44
      6973706C61794E616D655902000012004974656D735B3137395D2E4361707469
      6F6EA704000013004974656D735B3137395D2E43617465676F72795B02000016
      004974656D735B3137395D2E446973706C61794E616D65050400001200497465
      6D735B31375D2E43617465676F7279B200000015004974656D735B31375D2E44
      6973706C61794E616D655C02000012004974656D735B3138305D2E4361707469
      6F6EA804000013004974656D735B3138305D2E43617465676F72795E02000016
      004974656D735B3138305D2E446973706C61794E616D655F0200001200497465
      6D735B3138315D2E43617074696F6EA904000013004974656D735B3138315D2E
      43617465676F72796102000016004974656D735B3138315D2E446973706C6179
      4E616D656202000012004974656D735B3138325D2E43617074696F6EAA040000
      13004974656D735B3138325D2E43617465676F72796402000016004974656D73
      5B3138325D2E446973706C61794E616D656502000012004974656D735B313833
      5D2E43617074696F6EAB04000013004974656D735B3138335D2E43617465676F
      72796702000016004974656D735B3138335D2E446973706C61794E616D656802
      000012004974656D735B3138345D2E43617074696F6EAC04000013004974656D
      735B3138345D2E43617465676F72796A02000016004974656D735B3138345D2E
      446973706C61794E616D656B02000012004974656D735B3138355D2E43617074
      696F6EAD04000013004974656D735B3138355D2E43617465676F72796D020000
      16004974656D735B3138355D2E446973706C61794E616D656E02000012004974
      656D735B3138365D2E43617074696F6EAE04000013004974656D735B3138365D
      2E43617465676F72797002000016004974656D735B3138365D2E446973706C61
      794E616D657102000012004974656D735B3138375D2E43617074696F6EAF0400
      0013004974656D735B3138375D2E43617465676F72797302000016004974656D
      735B3138375D2E446973706C61794E616D657402000012004974656D735B3138
      385D2E43617074696F6EB004000013004974656D735B3138385D2E4361746567
      6F72797602000016004974656D735B3138385D2E446973706C61794E616D6577
      02000012004974656D735B3138395D2E43617074696F6EB10400001300497465
      6D735B3138395D2E43617465676F72797902000016004974656D735B3138395D
      2E446973706C61794E616D650604000012004974656D735B31385D2E43617465
      676F7279B400000015004974656D735B31385D2E446973706C61794E616D657A
      02000012004974656D735B3139305D2E43617074696F6EB20400001300497465
      6D735B3139305D2E43617465676F72797C02000016004974656D735B3139305D
      2E446973706C61794E616D65B304000013004974656D735B3139315D2E436174
      65676F72797E02000016004974656D735B3139315D2E446973706C61794E616D
      65ED04000012004974656D735B3139325D2E43617074696F6EB4040000130049
      74656D735B3139325D2E43617465676F72798102000016004974656D735B3139
      325D2E446973706C61794E616D658202000012004974656D735B3139335D2E43
      617074696F6EB504000013004974656D735B3139335D2E43617465676F727984
      02000016004974656D735B3139335D2E446973706C61794E616D658502000012
      004974656D735B3139345D2E43617074696F6EB604000013004974656D735B31
      39345D2E43617465676F72798702000016004974656D735B3139345D2E446973
      706C61794E616D658802000012004974656D735B3139355D2E43617074696F6E
      B704000013004974656D735B3139355D2E43617465676F72798A020000160049
      74656D735B3139355D2E446973706C61794E616D658B02000012004974656D73
      5B3139365D2E43617074696F6EB804000013004974656D735B3139365D2E4361
      7465676F72798D02000016004974656D735B3139365D2E446973706C61794E61
      6D658E02000012004974656D735B3139375D2E43617074696F6EB90400001300
      4974656D735B3139375D2E43617465676F72799002000016004974656D735B31
      39375D2E446973706C61794E616D659102000012004974656D735B3139385D2E
      43617074696F6EBA04000013004974656D735B3139385D2E43617465676F7279
      9302000016004974656D735B3139385D2E446973706C61794E616D6594020000
      12004974656D735B3139395D2E43617074696F6EBB04000013004974656D735B
      3139395D2E43617465676F72799602000016004974656D735B3139395D2E4469
      73706C61794E616D650704000012004974656D735B31395D2E43617465676F72
      79B600000015004974656D735B31395D2E446973706C61794E616D65F5030000
      11004974656D735B315D2E43617465676F72798B00000014004974656D735B31
      5D2E446973706C61794E616D65BC04000013004974656D735B3230305D2E4361
      7465676F72799802000016004974656D735B3230305D2E446973706C61794E61
      6D65BD04000013004974656D735B3230315D2E43617465676F72799A02000016
      004974656D735B3230315D2E446973706C61794E616D65BE0400001300497465
      6D735B3230325D2E43617465676F72799C02000016004974656D735B3230325D
      2E446973706C61794E616D65BF04000013004974656D735B3230335D2E436174
      65676F72799E02000016004974656D735B3230335D2E446973706C61794E616D
      65C004000013004974656D735B3230345D2E43617465676F7279A00200001600
      4974656D735B3230345D2E446973706C61794E616D65C104000013004974656D
      735B3230355D2E43617465676F7279A202000016004974656D735B3230355D2E
      446973706C61794E616D65C204000013004974656D735B3230365D2E43617465
      676F7279A402000016004974656D735B3230365D2E446973706C61794E616D65
      C304000013004974656D735B3230375D2E43617465676F7279A6020000160049
      74656D735B3230375D2E446973706C61794E616D65C404000013004974656D73
      5B3230385D2E43617465676F7279A802000016004974656D735B3230385D2E44
      6973706C61794E616D65CB04000013004974656D735B3230395D2E4361746567
      6F7279CC04000016004974656D735B3230395D2E446973706C61794E616D6508
      04000012004974656D735B32305D2E43617465676F7279B80000001500497465
      6D735B32305D2E446973706C61794E616D65CD04000013004974656D735B3231
      305D2E43617465676F7279CE04000016004974656D735B3231305D2E44697370
      6C61794E616D65CF04000013004974656D735B3231315D2E43617465676F7279
      D004000016004974656D735B3231315D2E446973706C61794E616D65D1040000
      13004974656D735B3231325D2E43617465676F7279D204000016004974656D73
      5B3231325D2E446973706C61794E616D65DC04000013004974656D735B323133
      5D2E43617465676F7279DD04000016004974656D735B3231335D2E446973706C
      61794E616D65EE04000013004974656D735B3231345D2E43617465676F7279EF
      04000016004974656D735B3231345D2E446973706C61794E616D65F004000013
      004974656D735B3231355D2E43617465676F7279F104000016004974656D735B
      3231355D2E446973706C61794E616D65F204000013004974656D735B3231365D
      2E43617465676F7279F304000016004974656D735B3231365D2E446973706C61
      794E616D65F404000013004974656D735B3231375D2E43617465676F7279F504
      000016004974656D735B3231375D2E446973706C61794E616D65060500001300
      4974656D735B3231385D2E43617465676F72790705000016004974656D735B32
      31385D2E446973706C61794E616D652B05000013004974656D735B3231395D2E
      43617465676F72792C05000016004974656D735B3231395D2E446973706C6179
      4E616D650904000012004974656D735B32315D2E43617465676F7279BA000000
      15004974656D735B32315D2E446973706C61794E616D65360500001300497465
      6D735B3232305D2E43617465676F72793705000016004974656D735B3232305D
      2E446973706C61794E616D653805000013004974656D735B3232315D2E436174
      65676F72793905000016004974656D735B3232315D2E446973706C61794E616D
      653A05000013004974656D735B3232325D2E43617465676F72793B0500001600
      4974656D735B3232325D2E446973706C61794E616D654A05000013004974656D
      735B3232335D2E43617465676F72794B05000016004974656D735B3232335D2E
      446973706C61794E616D655105000013004974656D735B3232345D2E43617465
      676F72795205000016004974656D735B3232345D2E446973706C61794E616D65
      6D05000013004974656D735B3232355D2E43617465676F72796E050000160049
      74656D735B3232355D2E446973706C61794E616D656F05000013004974656D73
      5B3232365D2E43617465676F72797005000016004974656D735B3232365D2E44
      6973706C61794E616D657105000013004974656D735B3232375D2E4361746567
      6F72797205000016004974656D735B3232375D2E446973706C61794E616D6573
      05000013004974656D735B3232385D2E43617465676F72797405000016004974
      656D735B3232385D2E446973706C61794E616D657505000013004974656D735B
      3232395D2E43617465676F72797605000016004974656D735B3232395D2E4469
      73706C61794E616D650A04000012004974656D735B32325D2E43617465676F72
      79BC00000015004974656D735B32325D2E446973706C61794E616D6577050000
      13004974656D735B3233305D2E43617465676F72797805000016004974656D73
      5B3233305D2E446973706C61794E616D657905000013004974656D735B323331
      5D2E43617465676F72797A05000016004974656D735B3233315D2E446973706C
      61794E616D657B05000013004974656D735B3233325D2E43617465676F72797C
      05000016004974656D735B3233325D2E446973706C61794E616D657D05000013
      004974656D735B3233335D2E43617465676F72797E05000016004974656D735B
      3233335D2E446973706C61794E616D657F05000013004974656D735B3233345D
      2E43617465676F72798005000016004974656D735B3233345D2E446973706C61
      794E616D658105000013004974656D735B3233355D2E43617465676F72798205
      000016004974656D735B3233355D2E446973706C61794E616D65830500001300
      4974656D735B3233365D2E43617465676F72798405000016004974656D735B32
      33365D2E446973706C61794E616D65A705000013004974656D735B3233375D2E
      43617465676F7279A805000016004974656D735B3233375D2E446973706C6179
      4E616D65B205000013004974656D735B3233385D2E43617465676F7279B30500
      0016004974656D735B3233385D2E446973706C61794E616D65B4050000130049
      74656D735B3233395D2E43617465676F7279B505000016004974656D735B3233
      395D2E446973706C61794E616D650B04000012004974656D735B32335D2E4361
      7465676F7279BE00000015004974656D735B32335D2E446973706C61794E616D
      65B705000013004974656D735B3234305D2E43617465676F7279B80500001600
      4974656D735B3234305D2E446973706C61794E616D65C205000013004974656D
      735B3234315D2E43617465676F7279C305000016004974656D735B3234315D2E
      446973706C61794E616D65CF05000012004974656D735B3234325D2E43617074
      696F6ED005000013004974656D735B3234325D2E43617465676F7279D1050000
      16004974656D735B3234325D2E446973706C61794E616D65D405000012004974
      656D735B3234335D2E43617074696F6ED505000013004974656D735B3234335D
      2E43617465676F7279D605000016004974656D735B3234335D2E446973706C61
      794E616D65D705000012004974656D735B3234345D2E43617074696F6ED80500
      0013004974656D735B3234345D2E43617465676F7279D905000016004974656D
      735B3234345D2E446973706C61794E616D65F505000013004974656D735B3234
      355D2E43617465676F7279F605000016004974656D735B3234355D2E44697370
      6C61794E616D651406000013004974656D735B3234365D2E43617465676F7279
      1506000016004974656D735B3234365D2E446973706C61794E616D6516060000
      13004974656D735B3234375D2E43617465676F72791706000016004974656D73
      5B3234375D2E446973706C61794E616D652A06000013004974656D735B323438
      5D2E43617465676F72792B06000016004974656D735B3234385D2E446973706C
      61794E616D652F06000013004974656D735B3234395D2E43617465676F727930
      06000016004974656D735B3234395D2E446973706C61794E616D650C04000012
      004974656D735B32345D2E43617465676F7279C000000015004974656D735B32
      345D2E446973706C61794E616D653106000013004974656D735B3235305D2E43
      617465676F72793206000016004974656D735B3235305D2E446973706C61794E
      616D653706000013004974656D735B3235315D2E43617465676F727938060000
      16004974656D735B3235315D2E446973706C61794E616D653906000013004974
      656D735B3235325D2E43617465676F72793A06000016004974656D735B323532
      5D2E446973706C61794E616D653D06000013004974656D735B3235335D2E4361
      7465676F72793E06000016004974656D735B3235335D2E446973706C61794E61
      6D653F06000013004974656D735B3235345D2E43617465676F72794006000016
      004974656D735B3235345D2E446973706C61794E616D65420600001300497465
      6D735B3235355D2E43617465676F72794306000016004974656D735B3235355D
      2E446973706C61794E616D654E06000013004974656D735B3235365D2E436174
      65676F72794F06000016004974656D735B3235365D2E446973706C61794E616D
      655406000013004974656D735B3235375D2E43617465676F7279550600001600
      4974656D735B3235375D2E446973706C61794E616D655606000013004974656D
      735B3235385D2E43617465676F72795706000016004974656D735B3235385D2E
      446973706C61794E616D655D06000013004974656D735B3235395D2E43617465
      676F72795E06000016004974656D735B3235395D2E446973706C61794E616D65
      0D04000012004974656D735B32355D2E43617465676F7279C200000015004974
      656D735B32355D2E446973706C61794E616D656006000013004974656D735B32
      36305D2E43617465676F72796106000016004974656D735B3236305D2E446973
      706C61794E616D656406000013004974656D735B3236315D2E43617465676F72
      796506000016004974656D735B3236315D2E446973706C61794E616D65700600
      0013004974656D735B3236325D2E43617465676F72797106000016004974656D
      735B3236325D2E446973706C61794E616D657306000013004974656D735B3236
      335D2E43617465676F72797406000016004974656D735B3236335D2E44697370
      6C61794E616D657506000013004974656D735B3236345D2E43617465676F7279
      7606000016004974656D735B3236345D2E446973706C61794E616D657E060000
      13004974656D735B3236355D2E43617465676F72797F06000016004974656D73
      5B3236355D2E446973706C61794E616D658706000013004974656D735B323636
      5D2E43617465676F72798806000016004974656D735B3236365D2E446973706C
      61794E616D658906000013004974656D735B3236375D2E43617465676F72798A
      06000016004974656D735B3236375D2E446973706C61794E616D658B06000013
      004974656D735B3236385D2E43617465676F72798C06000016004974656D735B
      3236385D2E446973706C61794E616D658D06000013004974656D735B3236395D
      2E43617465676F72798E06000016004974656D735B3236395D2E446973706C61
      794E616D65E704000011004974656D735B32365D2E43617074696F6E0E040000
      12004974656D735B32365D2E43617465676F7279C500000015004974656D735B
      32365D2E446973706C61794E616D659F06000013004974656D735B3237305D2E
      43617465676F7279A006000016004974656D735B3237305D2E446973706C6179
      4E616D65A106000013004974656D735B3237315D2E43617465676F7279A20600
      0016004974656D735B3237315D2E446973706C61794E616D65A3060000130049
      74656D735B3237325D2E43617465676F7279A406000016004974656D735B3237
      325D2E446973706C61794E616D65A506000013004974656D735B3237335D2E43
      617465676F7279A606000016004974656D735B3237335D2E446973706C61794E
      616D65B206000013004974656D735B3237345D2E43617465676F7279B3060000
      16004974656D735B3237345D2E446973706C61794E616D65B406000013004974
      656D735B3237355D2E43617465676F7279B506000016004974656D735B323735
      5D2E446973706C61794E616D65B806000013004974656D735B3237365D2E4361
      7465676F7279B906000016004974656D735B3237365D2E446973706C61794E61
      6D65BA06000013004974656D735B3237375D2E43617465676F7279BB06000016
      004974656D735B3237375D2E446973706C61794E616D65D00600001300497465
      6D735B3237385D2E43617465676F7279D106000016004974656D735B3237385D
      2E446973706C61794E616D65DA06000013004974656D735B3237395D2E436174
      65676F7279DB06000016004974656D735B3237395D2E446973706C61794E616D
      65C600000011004974656D735B32375D2E43617074696F6E0F04000012004974
      656D735B32375D2E43617465676F7279C800000015004974656D735B32375D2E
      446973706C61794E616D65DC06000013004974656D735B3238305D2E43617465
      676F7279DD06000016004974656D735B3238305D2E446973706C61794E616D65
      DE06000013004974656D735B3238315D2E43617465676F7279DF060000160049
      74656D735B3238315D2E446973706C61794E616D65E006000013004974656D73
      5B3238325D2E43617465676F7279E106000016004974656D735B3238325D2E44
      6973706C61794E616D65E206000013004974656D735B3238335D2E4361746567
      6F7279E306000016004974656D735B3238335D2E446973706C61794E616D65E4
      06000013004974656D735B3238345D2E43617465676F7279E506000016004974
      656D735B3238345D2E446973706C61794E616D65E606000013004974656D735B
      3238355D2E43617465676F7279E706000016004974656D735B3238355D2E4469
      73706C61794E616D65E806000013004974656D735B3238365D2E43617465676F
      7279E906000016004974656D735B3238365D2E446973706C61794E616D65EA06
      000013004974656D735B3238375D2E43617465676F7279EB0600001600497465
      6D735B3238375D2E446973706C61794E616D65EC06000013004974656D735B32
      38385D2E43617465676F7279ED06000016004974656D735B3238385D2E446973
      706C61794E616D65F406000013004974656D735B3238395D2E43617465676F72
      79F506000016004974656D735B3238395D2E446973706C61794E616D65C90000
      0011004974656D735B32385D2E43617074696F6E1004000012004974656D735B
      32385D2E43617465676F7279CB00000015004974656D735B32385D2E44697370
      6C61794E616D65F606000013004974656D735B3239305D2E43617465676F7279
      F706000016004974656D735B3239305D2E446973706C61794E616D65F8060000
      13004974656D735B3239315D2E43617465676F7279F906000016004974656D73
      5B3239315D2E446973706C61794E616D65FD06000013004974656D735B323932
      5D2E43617465676F7279FE06000016004974656D735B3239325D2E446973706C
      61794E616D65FF06000013004974656D735B3239335D2E43617465676F727900
      07000016004974656D735B3239335D2E446973706C61794E616D650107000013
      004974656D735B3239345D2E43617465676F72790207000016004974656D735B
      3239345D2E446973706C61794E616D650307000013004974656D735B3239355D
      2E43617465676F72790407000016004974656D735B3239355D2E446973706C61
      794E616D650507000013004974656D735B3239365D2E43617465676F72790607
      000016004974656D735B3239365D2E446973706C61794E616D65150700001300
      4974656D735B3239375D2E43617465676F72791607000016004974656D735B32
      39375D2E446973706C61794E616D651B07000013004974656D735B3239385D2E
      43617465676F72791C07000016004974656D735B3239385D2E446973706C6179
      4E616D651F07000013004974656D735B3239395D2E43617465676F7279200700
      0016004974656D735B3239395D2E446973706C61794E616D65CC000000110049
      74656D735B32395D2E43617074696F6E1104000012004974656D735B32395D2E
      43617465676F7279CE00000015004974656D735B32395D2E446973706C61794E
      616D658C00000010004974656D735B325D2E43617074696F6EF6030000110049
      74656D735B325D2E43617465676F72798E00000014004974656D735B325D2E44
      6973706C61794E616D652107000013004974656D735B3330305D2E4361746567
      6F72792207000016004974656D735B3330305D2E446973706C61794E616D652A
      07000013004974656D735B3330315D2E43617465676F72792B07000016004974
      656D735B3330315D2E446973706C61794E616D652C07000013004974656D735B
      3330325D2E43617465676F72792D07000016004974656D735B3330325D2E4469
      73706C61794E616D653307000013004974656D735B3330335D2E43617465676F
      72793407000016004974656D735B3330335D2E446973706C61794E616D653507
      000013004974656D735B3330345D2E43617465676F7279360700001600497465
      6D735B3330345D2E446973706C61794E616D653B07000013004974656D735B33
      30355D2E43617465676F72793C07000016004974656D735B3330355D2E446973
      706C61794E616D653D07000013004974656D735B3330365D2E43617465676F72
      793E07000016004974656D735B3330365D2E446973706C61794E616D653F0700
      0013004974656D735B3330375D2E43617465676F72794007000016004974656D
      735B3330375D2E446973706C61794E616D654107000013004974656D735B3330
      385D2E43617465676F72794207000016004974656D735B3330385D2E44697370
      6C61794E616D654307000013004974656D735B3330395D2E43617465676F7279
      4407000016004974656D735B3330395D2E446973706C61794E616D65CF000000
      11004974656D735B33305D2E43617074696F6E1204000012004974656D735B33
      305D2E43617465676F7279D100000015004974656D735B33305D2E446973706C
      61794E616D654507000013004974656D735B3331305D2E43617465676F727946
      07000016004974656D735B3331305D2E446973706C61794E616D654707000013
      004974656D735B3331315D2E43617465676F72794807000016004974656D735B
      3331315D2E446973706C61794E616D654907000013004974656D735B3331325D
      2E43617465676F72794A07000016004974656D735B3331325D2E446973706C61
      794E616D654B07000013004974656D735B3331335D2E43617465676F72794C07
      000016004974656D735B3331335D2E446973706C61794E616D654D0700001300
      4974656D735B3331345D2E43617465676F72794E07000016004974656D735B33
      31345D2E446973706C61794E616D656007000013004974656D735B3331355D2E
      43617465676F72796107000016004974656D735B3331355D2E446973706C6179
      4E616D656207000013004974656D735B3331365D2E43617465676F7279630700
      0016004974656D735B3331365D2E446973706C61794E616D656D070000130049
      74656D735B3331375D2E43617465676F72796E07000016004974656D735B3331
      375D2E446973706C61794E616D656F07000013004974656D735B3331385D2E43
      617465676F72797007000016004974656D735B3331385D2E446973706C61794E
      616D657107000013004974656D735B3331395D2E43617465676F727972070000
      16004974656D735B3331395D2E446973706C61794E616D65D200000011004974
      656D735B33315D2E43617074696F6E1304000012004974656D735B33315D2E43
      617465676F7279D400000015004974656D735B33315D2E446973706C61794E61
      6D657307000013004974656D735B3332305D2E43617465676F72797407000016
      004974656D735B3332305D2E446973706C61794E616D65760700001300497465
      6D735B3332315D2E43617465676F72797707000016004974656D735B3332315D
      2E446973706C61794E616D657A07000013004974656D735B3332325D2E436174
      65676F72797B07000016004974656D735B3332325D2E446973706C61794E616D
      657C07000013004974656D735B3332335D2E43617465676F72797D0700001600
      4974656D735B3332335D2E446973706C61794E616D658207000013004974656D
      735B3332345D2E43617465676F72798307000016004974656D735B3332345D2E
      446973706C61794E616D658407000013004974656D735B3332355D2E43617465
      676F72798507000016004974656D735B3332355D2E446973706C61794E616D65
      8807000013004974656D735B3332365D2E43617465676F727989070000160049
      74656D735B3332365D2E446973706C61794E616D658A07000013004974656D73
      5B3332375D2E43617465676F72798B07000016004974656D735B3332375D2E44
      6973706C61794E616D658C07000013004974656D735B3332385D2E4361746567
      6F72798D07000016004974656D735B3332385D2E446973706C61794E616D658E
      07000013004974656D735B3332395D2E43617465676F72798F07000016004974
      656D735B3332395D2E446973706C61794E616D65D500000011004974656D735B
      33325D2E43617074696F6E1404000012004974656D735B33325D2E4361746567
      6F7279D700000015004974656D735B33325D2E446973706C61794E616D659007
      000013004974656D735B3333305D2E43617465676F7279910700001600497465
      6D735B3333305D2E446973706C61794E616D659207000013004974656D735B33
      33315D2E43617465676F72799307000016004974656D735B3333315D2E446973
      706C61794E616D659407000013004974656D735B3333325D2E43617465676F72
      799507000016004974656D735B3333325D2E446973706C61794E616D659E0700
      0013004974656D735B3333335D2E43617465676F72799F07000016004974656D
      735B3333335D2E446973706C61794E616D65A007000013004974656D735B3333
      345D2E43617465676F7279A107000016004974656D735B3333345D2E44697370
      6C61794E616D65AB07000013004974656D735B3333355D2E43617465676F7279
      AC07000016004974656D735B3333355D2E446973706C61794E616D65B1070000
      13004974656D735B3333365D2E43617465676F7279B207000016004974656D73
      5B3333365D2E446973706C61794E616D65B407000013004974656D735B333337
      5D2E43617465676F7279B507000016004974656D735B3333375D2E446973706C
      61794E616D65B607000013004974656D735B3333385D2E43617465676F7279B7
      07000016004974656D735B3333385D2E446973706C61794E616D65BA07000013
      004974656D735B3333395D2E43617465676F7279BB07000016004974656D735B
      3333395D2E446973706C61794E616D651504000012004974656D735B33335D2E
      43617465676F7279D900000015004974656D735B33335D2E446973706C61794E
      616D65BC07000013004974656D735B3334305D2E43617465676F7279BD070000
      16004974656D735B3334305D2E446973706C61794E616D65BE07000013004974
      656D735B3334315D2E43617465676F7279BF07000016004974656D735B333431
      5D2E446973706C61794E616D65C007000013004974656D735B3334325D2E4361
      7465676F7279C107000016004974656D735B3334325D2E446973706C61794E61
      6D65C207000013004974656D735B3334335D2E43617465676F7279C307000016
      004974656D735B3334335D2E446973706C61794E616D65C40700001300497465
      6D735B3334345D2E43617465676F7279C507000016004974656D735B3334345D
      2E446973706C61794E616D65C607000013004974656D735B3334355D2E436174
      65676F7279C707000016004974656D735B3334355D2E446973706C61794E616D
      65C807000013004974656D735B3334365D2E43617465676F7279C90700001600
      4974656D735B3334365D2E446973706C61794E616D65CA07000013004974656D
      735B3334375D2E43617465676F7279CB07000016004974656D735B3334375D2E
      446973706C61794E616D65CC07000013004974656D735B3334385D2E43617465
      676F7279CD07000016004974656D735B3334385D2E446973706C61794E616D65
      CE07000013004974656D735B3334395D2E43617465676F7279CF070000160049
      74656D735B3334395D2E446973706C61794E616D65E804000011004974656D73
      5B33345D2E43617074696F6E1604000012004974656D735B33345D2E43617465
      676F7279DC00000015004974656D735B33345D2E446973706C61794E616D65D0
      07000013004974656D735B3335305D2E43617465676F7279D107000016004974
      656D735B3335305D2E446973706C61794E616D65D207000013004974656D735B
      3335315D2E43617465676F7279D307000016004974656D735B3335315D2E4469
      73706C61794E616D65D407000013004974656D735B3335325D2E43617465676F
      7279D507000016004974656D735B3335325D2E446973706C61794E616D65D607
      000013004974656D735B3335335D2E43617465676F7279D70700001600497465
      6D735B3335335D2E446973706C61794E616D65D807000013004974656D735B33
      35345D2E43617465676F7279D907000016004974656D735B3335345D2E446973
      706C61794E616D65DA07000013004974656D735B3335355D2E43617465676F72
      79DB07000016004974656D735B3335355D2E446973706C61794E616D65DC0700
      0013004974656D735B3335365D2E43617465676F7279DD07000016004974656D
      735B3335365D2E446973706C61794E616D65DE07000013004974656D735B3335
      375D2E43617465676F7279DF07000016004974656D735B3335375D2E44697370
      6C61794E616D65E007000013004974656D735B3335385D2E43617465676F7279
      E107000016004974656D735B3335385D2E446973706C61794E616D65EB070000
      13004974656D735B3335395D2E43617465676F7279EC07000016004974656D73
      5B3335395D2E446973706C61794E616D65DD00000011004974656D735B33355D
      2E43617074696F6E1704000012004974656D735B33355D2E43617465676F7279
      DF00000015004974656D735B33355D2E446973706C61794E616D65ED07000013
      004974656D735B3336305D2E43617465676F7279EE07000016004974656D735B
      3336305D2E446973706C61794E616D65EF07000013004974656D735B3336315D
      2E43617465676F7279F007000016004974656D735B3336315D2E446973706C61
      794E616D65F107000013004974656D735B3336325D2E43617465676F7279F207
      000016004974656D735B3336325D2E446973706C61794E616D65F30700001300
      4974656D735B3336335D2E43617465676F7279F407000016004974656D735B33
      36335D2E446973706C61794E616D65F507000013004974656D735B3336345D2E
      43617465676F7279F607000016004974656D735B3336345D2E446973706C6179
      4E616D65F707000013004974656D735B3336355D2E43617465676F7279F80700
      0016004974656D735B3336355D2E446973706C61794E616D65F9070000130049
      74656D735B3336365D2E43617465676F7279FA07000016004974656D735B3336
      365D2E446973706C61794E616D65FB07000013004974656D735B3336375D2E43
      617465676F7279FC07000016004974656D735B3336375D2E446973706C61794E
      616D65FD07000013004974656D735B3336385D2E43617465676F7279FE070000
      16004974656D735B3336385D2E446973706C61794E616D65FF07000013004974
      656D735B3336395D2E43617465676F72790008000016004974656D735B333639
      5D2E446973706C61794E616D65E000000011004974656D735B33365D2E436170
      74696F6E1804000012004974656D735B33365D2E43617465676F7279E2000000
      15004974656D735B33365D2E446973706C61794E616D65010800001300497465
      6D735B3337305D2E43617465676F72790208000016004974656D735B3337305D
      2E446973706C61794E616D650308000013004974656D735B3337315D2E436174
      65676F72790408000016004974656D735B3337315D2E446973706C61794E616D
      650508000013004974656D735B3337325D2E43617465676F7279060800001600
      4974656D735B3337325D2E446973706C61794E616D650708000013004974656D
      735B3337335D2E43617465676F72790808000016004974656D735B3337335D2E
      446973706C61794E616D650908000013004974656D735B3337345D2E43617465
      676F72790A08000016004974656D735B3337345D2E446973706C61794E616D65
      0B08000013004974656D735B3337355D2E43617465676F72790C080000160049
      74656D735B3337355D2E446973706C61794E616D650D08000013004974656D73
      5B3337365D2E43617465676F72790E08000016004974656D735B3337365D2E44
      6973706C61794E616D650F08000013004974656D735B3337375D2E4361746567
      6F72791008000016004974656D735B3337375D2E446973706C61794E616D6511
      08000013004974656D735B3337385D2E43617465676F72791208000016004974
      656D735B3337385D2E446973706C61794E616D651308000013004974656D735B
      3337395D2E43617465676F72791408000016004974656D735B3337395D2E4469
      73706C61794E616D65E300000011004974656D735B33375D2E43617074696F6E
      1904000012004974656D735B33375D2E43617465676F7279E500000015004974
      656D735B33375D2E446973706C61794E616D651D08000013004974656D735B33
      38305D2E43617465676F72791E08000016004974656D735B3338305D2E446973
      706C61794E616D651F08000013004974656D735B3338315D2E43617465676F72
      792008000016004974656D735B3338315D2E446973706C61794E616D65210800
      0013004974656D735B3338325D2E43617465676F72792208000016004974656D
      735B3338325D2E446973706C61794E616D652308000013004974656D735B3338
      335D2E43617465676F72792408000016004974656D735B3338335D2E44697370
      6C61794E616D652608000013004974656D735B3338345D2E43617465676F7279
      2708000016004974656D735B3338345D2E446973706C61794E616D6528080000
      13004974656D735B3338355D2E43617465676F72792908000016004974656D73
      5B3338355D2E446973706C61794E616D652A08000013004974656D735B333836
      5D2E43617465676F72792B08000016004974656D735B3338365D2E446973706C
      61794E616D652C08000013004974656D735B3338375D2E43617465676F72792D
      08000016004974656D735B3338375D2E446973706C61794E616D653208000013
      004974656D735B3338385D2E43617465676F72793308000016004974656D735B
      3338385D2E446973706C61794E616D653608000013004974656D735B3338395D
      2E43617465676F72793708000016004974656D735B3338395D2E446973706C61
      794E616D65E600000011004974656D735B33385D2E43617074696F6E1A040000
      12004974656D735B33385D2E43617465676F7279E800000015004974656D735B
      33385D2E446973706C61794E616D653B08000013004974656D735B3339305D2E
      43617465676F72793C08000016004974656D735B3339305D2E446973706C6179
      4E616D654008000013004974656D735B3339315D2E43617465676F7279410800
      0016004974656D735B3339315D2E446973706C61794E616D6542080000130049
      74656D735B3339325D2E43617465676F72794308000016004974656D735B3339
      325D2E446973706C61794E616D654608000013004974656D735B3339335D2E43
      617465676F72794708000016004974656D735B3339335D2E446973706C61794E
      616D654908000013004974656D735B3339345D2E43617465676F72794A080000
      16004974656D735B3339345D2E446973706C61794E616D654D08000013004974
      656D735B3339355D2E43617465676F72794E08000016004974656D735B333935
      5D2E446973706C61794E616D655308000013004974656D735B3339365D2E4361
      7465676F72795408000016004974656D735B3339365D2E446973706C61794E61
      6D655608000013004974656D735B3339375D2E43617465676F72795708000016
      004974656D735B3339375D2E446973706C61794E616D65580800001300497465
      6D735B3339385D2E43617465676F72795908000016004974656D735B3339385D
      2E446973706C61794E616D655A08000013004974656D735B3339395D2E436174
      65676F72795B08000016004974656D735B3339395D2E446973706C61794E616D
      65E900000011004974656D735B33395D2E43617074696F6E1B04000012004974
      656D735B33395D2E43617465676F7279EB00000015004974656D735B33395D2E
      446973706C61794E616D658F00000010004974656D735B335D2E43617074696F
      6EF703000011004974656D735B335D2E43617465676F72799100000014004974
      656D735B335D2E446973706C61794E616D655C08000013004974656D735B3430
      305D2E43617465676F72795D08000016004974656D735B3430305D2E44697370
      6C61794E616D656208000013004974656D735B3430315D2E43617465676F7279
      6308000016004974656D735B3430315D2E446973706C61794E616D6566080000
      13004974656D735B3430325D2E43617465676F72796708000016004974656D73
      5B3430325D2E446973706C61794E616D656808000013004974656D735B343033
      5D2E43617465676F72796908000016004974656D735B3430335D2E446973706C
      61794E616D656A08000013004974656D735B3430345D2E43617465676F72796B
      08000016004974656D735B3430345D2E446973706C61794E616D656E08000013
      004974656D735B3430355D2E43617465676F72796F08000016004974656D735B
      3430355D2E446973706C61794E616D657808000013004974656D735B3430365D
      2E43617465676F72797908000016004974656D735B3430365D2E446973706C61
      794E616D657A08000013004974656D735B3430375D2E43617465676F72797B08
      000016004974656D735B3430375D2E446973706C61794E616D65820800001300
      4974656D735B3430385D2E43617465676F72798308000016004974656D735B34
      30385D2E446973706C61794E616D659108000013004974656D735B3430395D2E
      43617465676F72799208000016004974656D735B3430395D2E446973706C6179
      4E616D65EC00000011004974656D735B34305D2E43617074696F6E1C04000012
      004974656D735B34305D2E43617465676F7279EE00000015004974656D735B34
      305D2E446973706C61794E616D659808000013004974656D735B3431305D2E43
      617465676F72799908000016004974656D735B3431305D2E446973706C61794E
      616D659A08000013004974656D735B3431315D2E43617465676F72799B080000
      16004974656D735B3431315D2E446973706C61794E616D659C08000013004974
      656D735B3431325D2E43617465676F72799D08000016004974656D735B343132
      5D2E446973706C61794E616D65A208000013004974656D735B3431335D2E4361
      7465676F7279A308000016004974656D735B3431335D2E446973706C61794E61
      6D65A608000013004974656D735B3431345D2E43617465676F7279A708000016
      004974656D735B3431345D2E446973706C61794E616D65AA0800001300497465
      6D735B3431355D2E43617465676F7279AB08000016004974656D735B3431355D
      2E446973706C61794E616D65AC08000013004974656D735B3431365D2E436174
      65676F7279AD08000016004974656D735B3431365D2E446973706C61794E616D
      65AE08000013004974656D735B3431375D2E43617465676F7279AF0800001600
      4974656D735B3431375D2E446973706C61794E616D65B508000013004974656D
      735B3431385D2E43617465676F7279B608000016004974656D735B3431385D2E
      446973706C61794E616D65C808000013004974656D735B3431395D2E43617465
      676F7279C908000016004974656D735B3431395D2E446973706C61794E616D65
      EF00000011004974656D735B34315D2E43617074696F6E1D0400001200497465
      6D735B34315D2E43617465676F7279F100000015004974656D735B34315D2E44
      6973706C61794E616D65CA08000013004974656D735B3432305D2E4361746567
      6F7279CB08000016004974656D735B3432305D2E446973706C61794E616D65CC
      08000013004974656D735B3432315D2E43617465676F7279CD08000016004974
      656D735B3432315D2E446973706C61794E616D65CE08000013004974656D735B
      3432325D2E43617465676F7279CF08000016004974656D735B3432325D2E4469
      73706C61794E616D65D708000013004974656D735B3432335D2E43617465676F
      7279D808000016004974656D735B3432335D2E446973706C61794E616D65E008
      000013004974656D735B3432345D2E43617465676F7279E10800001600497465
      6D735B3432345D2E446973706C61794E616D65E408000013004974656D735B34
      32355D2E43617465676F7279E508000016004974656D735B3432355D2E446973
      706C61794E616D65EA08000013004974656D735B3432365D2E43617465676F72
      79EB08000016004974656D735B3432365D2E446973706C61794E616D65EF0800
      0013004974656D735B3432375D2E43617465676F7279F008000016004974656D
      735B3432375D2E446973706C61794E616D65F808000013004974656D735B3432
      385D2E43617465676F7279F908000016004974656D735B3432385D2E44697370
      6C61794E616D65FA08000013004974656D735B3432395D2E43617465676F7279
      FB08000016004974656D735B3432395D2E446973706C61794E616D65F2000000
      11004974656D735B34325D2E43617074696F6E1E04000012004974656D735B34
      325D2E43617465676F7279F400000015004974656D735B34325D2E446973706C
      61794E616D650109000013004974656D735B3433305D2E43617465676F727902
      09000016004974656D735B3433305D2E446973706C61794E616D650309000013
      004974656D735B3433315D2E43617465676F72790409000016004974656D735B
      3433315D2E446973706C61794E616D650709000013004974656D735B3433325D
      2E43617465676F72790809000016004974656D735B3433325D2E446973706C61
      794E616D650E09000013004974656D735B3433335D2E43617465676F72790F09
      000016004974656D735B3433335D2E446973706C61794E616D65110900001300
      4974656D735B3433345D2E43617465676F72791209000016004974656D735B34
      33345D2E446973706C61794E616D651509000013004974656D735B3433355D2E
      43617465676F72791609000016004974656D735B3433355D2E446973706C6179
      4E616D652309000013004974656D735B3433365D2E43617465676F7279240900
      0016004974656D735B3433365D2E446973706C61794E616D6525090000130049
      74656D735B3433375D2E43617465676F72792609000016004974656D735B3433
      375D2E446973706C61794E616D652709000013004974656D735B3433385D2E43
      617465676F72792809000016004974656D735B3433385D2E446973706C61794E
      616D652909000013004974656D735B3433395D2E43617465676F72792A090000
      16004974656D735B3433395D2E446973706C61794E616D651F04000012004974
      656D735B34335D2E43617465676F7279F600000015004974656D735B34335D2E
      446973706C61794E616D652B09000013004974656D735B3434305D2E43617465
      676F72792C09000016004974656D735B3434305D2E446973706C61794E616D65
      2D09000013004974656D735B3434315D2E43617465676F72792E090000160049
      74656D735B3434315D2E446973706C61794E616D652F09000013004974656D73
      5B3434325D2E43617465676F72793009000016004974656D735B3434325D2E44
      6973706C61794E616D653109000013004974656D735B3434335D2E4361746567
      6F72793209000016004974656D735B3434335D2E446973706C61794E616D6533
      09000013004974656D735B3434345D2E43617465676F72793409000016004974
      656D735B3434345D2E446973706C61794E616D653509000013004974656D735B
      3434355D2E43617465676F72793609000016004974656D735B3434355D2E4469
      73706C61794E616D653709000013004974656D735B3434365D2E43617465676F
      72793809000016004974656D735B3434365D2E446973706C61794E616D653909
      000013004974656D735B3434375D2E43617465676F72793A0900001600497465
      6D735B3434375D2E446973706C61794E616D653B09000013004974656D735B34
      34385D2E43617465676F72793C09000016004974656D735B3434385D2E446973
      706C61794E616D653D09000013004974656D735B3434395D2E43617465676F72
      793E09000016004974656D735B3434395D2E446973706C61794E616D65200400
      0012004974656D735B34345D2E43617465676F7279F800000015004974656D73
      5B34345D2E446973706C61794E616D654609000013004974656D735B3435305D
      2E43617465676F72794709000016004974656D735B3435305D2E446973706C61
      794E616D654A09000013004974656D735B3435315D2E43617465676F72794B09
      000016004974656D735B3435315D2E446973706C61794E616D654F0900001300
      4974656D735B3435325D2E43617465676F72795009000016004974656D735B34
      35325D2E446973706C61794E616D652104000012004974656D735B34355D2E43
      617465676F7279FA00000015004974656D735B34355D2E446973706C61794E61
      6D652204000012004974656D735B34365D2E43617465676F7279FC0000001500
      4974656D735B34365D2E446973706C61794E616D652304000012004974656D73
      5B34375D2E43617465676F7279FE00000015004974656D735B34375D2E446973
      706C61794E616D652404000012004974656D735B34385D2E43617465676F7279
      0001000015004974656D735B34385D2E446973706C61794E616D65E904000011
      004974656D735B34395D2E43617074696F6E2504000012004974656D735B3439
      5D2E43617465676F72790301000015004974656D735B34395D2E446973706C61
      794E616D659200000010004974656D735B345D2E43617074696F6EF803000011
      004974656D735B345D2E43617465676F72799400000014004974656D735B345D
      2E446973706C61794E616D650401000011004974656D735B35305D2E43617074
      696F6E2604000012004974656D735B35305D2E43617465676F72790601000015
      004974656D735B35305D2E446973706C61794E616D650701000011004974656D
      735B35315D2E43617074696F6E2704000012004974656D735B35315D2E436174
      65676F72790901000015004974656D735B35315D2E446973706C61794E616D65
      0A01000011004974656D735B35325D2E43617074696F6E280400001200497465
      6D735B35325D2E43617465676F72790C01000015004974656D735B35325D2E44
      6973706C61794E616D650D01000011004974656D735B35335D2E43617074696F
      6E2904000012004974656D735B35335D2E43617465676F72790F010000150049
      74656D735B35335D2E446973706C61794E616D651001000011004974656D735B
      35345D2E43617074696F6E2A04000012004974656D735B35345D2E4361746567
      6F72791201000015004974656D735B35345D2E446973706C61794E616D651301
      000011004974656D735B35355D2E43617074696F6E2B04000012004974656D73
      5B35355D2E43617465676F72791501000015004974656D735B35355D2E446973
      706C61794E616D651601000011004974656D735B35365D2E43617074696F6E2C
      04000012004974656D735B35365D2E43617465676F7279180100001500497465
      6D735B35365D2E446973706C61794E616D651901000011004974656D735B3537
      5D2E43617074696F6E2D04000012004974656D735B35375D2E43617465676F72
      791B01000015004974656D735B35375D2E446973706C61794E616D651C010000
      11004974656D735B35385D2E43617074696F6E2E04000012004974656D735B35
      385D2E43617465676F72791E01000015004974656D735B35385D2E446973706C
      61794E616D651F01000011004974656D735B35395D2E43617074696F6E2F0400
      0012004974656D735B35395D2E43617465676F72792101000015004974656D73
      5B35395D2E446973706C61794E616D65F903000011004974656D735B355D2E43
      617465676F72799600000014004974656D735B355D2E446973706C61794E616D
      652201000011004974656D735B36305D2E43617074696F6E3004000012004974
      656D735B36305D2E43617465676F72792401000015004974656D735B36305D2E
      446973706C61794E616D652501000011004974656D735B36315D2E4361707469
      6F6E3104000012004974656D735B36315D2E43617465676F7279270100001500
      4974656D735B36315D2E446973706C61794E616D652801000011004974656D73
      5B36325D2E43617074696F6E3204000012004974656D735B36325D2E43617465
      676F72792A01000015004974656D735B36325D2E446973706C61794E616D652B
      01000011004974656D735B36335D2E43617074696F6E3304000012004974656D
      735B36335D2E43617465676F72792D01000015004974656D735B36335D2E4469
      73706C61794E616D652E01000011004974656D735B36345D2E43617074696F6E
      3404000012004974656D735B36345D2E43617465676F72793001000015004974
      656D735B36345D2E446973706C61794E616D653101000011004974656D735B36
      355D2E43617074696F6E3504000012004974656D735B36355D2E43617465676F
      72793301000015004974656D735B36355D2E446973706C61794E616D65340100
      0011004974656D735B36365D2E43617074696F6E3604000012004974656D735B
      36365D2E43617465676F72793601000015004974656D735B36365D2E44697370
      6C61794E616D653701000011004974656D735B36375D2E43617074696F6E3704
      000012004974656D735B36375D2E43617465676F72793901000015004974656D
      735B36375D2E446973706C61794E616D653804000012004974656D735B36385D
      2E43617465676F72793B01000015004974656D735B36385D2E446973706C6179
      4E616D653904000012004974656D735B36395D2E43617465676F72793D010000
      15004974656D735B36395D2E446973706C61794E616D65970000001000497465
      6D735B365D2E43617074696F6EFA03000011004974656D735B365D2E43617465
      676F72799900000014004974656D735B365D2E446973706C61794E616D653A04
      000012004974656D735B37305D2E43617465676F72793F01000015004974656D
      735B37305D2E446973706C61794E616D653B04000012004974656D735B37315D
      2E43617465676F72794101000015004974656D735B37315D2E446973706C6179
      4E616D653C04000012004974656D735B37325D2E43617465676F727943010000
      15004974656D735B37325D2E446973706C61794E616D653D0400001200497465
      6D735B37335D2E43617465676F72794501000015004974656D735B37335D2E44
      6973706C61794E616D653E04000012004974656D735B37345D2E43617465676F
      72794701000015004974656D735B37345D2E446973706C61794E616D653F0400
      0012004974656D735B37355D2E43617465676F72794901000015004974656D73
      5B37355D2E446973706C61794E616D654004000012004974656D735B37365D2E
      43617465676F72794B01000015004974656D735B37365D2E446973706C61794E
      616D654104000012004974656D735B37375D2E43617465676F72794D01000015
      004974656D735B37375D2E446973706C61794E616D654204000012004974656D
      735B37385D2E43617465676F72794F01000015004974656D735B37385D2E4469
      73706C61794E616D654304000012004974656D735B37395D2E43617465676F72
      795101000015004974656D735B37395D2E446973706C61794E616D659A000000
      10004974656D735B375D2E43617074696F6EFB03000011004974656D735B375D
      2E43617465676F72799C00000014004974656D735B375D2E446973706C61794E
      616D654404000012004974656D735B38305D2E43617465676F72795301000015
      004974656D735B38305D2E446973706C61794E616D654504000012004974656D
      735B38315D2E43617465676F72795501000015004974656D735B38315D2E4469
      73706C61794E616D654604000012004974656D735B38325D2E43617465676F72
      795701000015004974656D735B38325D2E446973706C61794E616D6547040000
      12004974656D735B38335D2E43617465676F72795901000015004974656D735B
      38335D2E446973706C61794E616D654804000012004974656D735B38345D2E43
      617465676F72795B01000015004974656D735B38345D2E446973706C61794E61
      6D654904000012004974656D735B38355D2E43617465676F72795D0100001500
      4974656D735B38355D2E446973706C61794E616D654A04000012004974656D73
      5B38365D2E43617465676F72795F01000015004974656D735B38365D2E446973
      706C61794E616D654B04000012004974656D735B38375D2E43617465676F7279
      6101000015004974656D735B38375D2E446973706C61794E616D654C04000012
      004974656D735B38385D2E43617465676F72796301000015004974656D735B38
      385D2E446973706C61794E616D654D04000012004974656D735B38395D2E4361
      7465676F72796501000015004974656D735B38395D2E446973706C61794E616D
      659D00000010004974656D735B385D2E43617074696F6EFC0300001100497465
      6D735B385D2E43617465676F72799F00000014004974656D735B385D2E446973
      706C61794E616D654E04000012004974656D735B39305D2E43617465676F7279
      6701000015004974656D735B39305D2E446973706C61794E616D654F04000012
      004974656D735B39315D2E43617465676F72796901000015004974656D735B39
      315D2E446973706C61794E616D655004000012004974656D735B39325D2E4361
      7465676F72796B01000015004974656D735B39325D2E446973706C61794E616D
      655104000012004974656D735B39335D2E43617465676F72796D010000150049
      74656D735B39335D2E446973706C61794E616D655204000012004974656D735B
      39345D2E43617465676F72796F01000015004974656D735B39345D2E44697370
      6C61794E616D655304000012004974656D735B39355D2E43617465676F727971
      01000015004974656D735B39355D2E446973706C61794E616D65540400001200
      4974656D735B39365D2E43617465676F72797301000015004974656D735B3936
      5D2E446973706C61794E616D655504000012004974656D735B39375D2E436174
      65676F72797501000015004974656D735B39375D2E446973706C61794E616D65
      5604000012004974656D735B39385D2E43617465676F72797701000015004974
      656D735B39385D2E446973706C61794E616D655704000012004974656D735B39
      395D2E43617465676F72797901000015004974656D735B39395D2E446973706C
      61794E616D65A000000010004974656D735B395D2E43617074696F6EFD030000
      11004974656D735B395D2E43617465676F7279A200000014004974656D735B39
      5D2E446973706C61794E616D6500060054696D65723100000700506F70757043
      5000000700506F7075704C4500000D005442584974656D456E6457696E00000C
      005442584974656D456E64556E00000D005442584974656D456E644D61630000
      0B00496D674C69737454726565000012005072696E7465725365747570446961
      6C6F6700000A0053796E745374796C6573000005006563414350000101000000
      040048696E7400000F00506172616D436F6D706C6574696F6E00010100000004
      0048696E7400000D0054656D706C617465506F70757000010100000004004869
      6E7400000800506F7075704C657800001100496D6167654C69737449636F6E73
      53746400001500496D6167654C69737449636F6E73466F677565313600001500
      496D6167654C69737449636F6E7354616E676F323200001500496D6167654C69
      737449636F6E7354616E676F313600001500496D6167654C69737449636F6E73
      466F677565323400001300496D6167654C69737449636F6E73476E6F6D650000
      0F00656353656C43686172506F70757031000101000000040048696E7400000B
      0054696D657252656472617700000D005442584974656D4F546F6F6C73010200
      0000C2030000070043617074696F6E18050000040048696E7400120054425853
      6570617261746F724974656D323200000E005442584974656D426B436C656172
      0102000000B8030000070043617074696F6EB9030000040048696E7400090054
      696D657248696E74000012005442585375626D656E754974656D5A6F6F6D0101
      000000D8040000070043617074696F6E001200544258536570617261746F7249
      74656D323600000A005442584974656D5A496E0101000000D904000007004361
      7074696F6E000B005442584974656D5A4F75740101000000DA04000007004361
      7074696F6E0009005442584974656D5A300101000000DB040000070043617074
      696F6E001200544258536570617261746F724974656D323700000F0054425849
      74656D4D61726B537761700102000000F6040000070043617074696F6E170500
      00040048696E74000F005442584974656D4D61726B436F6C6C0102000000F704
      0000070043617074696F6E16050000040048696E74000F005442584974656D4D
      61726B44726F700102000000F8040000070043617074696F6E15050000040048
      696E74000400746251730101000000FA040000070043617074696F6E000D0054
      42584974656D46464E65787401020000000B050000070043617074696F6EFB04
      0000040048696E74000D005442584974656D46465072657601020000000C0500
      00070043617074696F6EFC040000040048696E740016005442585375626D656E
      754974656D546F6F6C626172730101000000FE040000070043617074696F6E00
      0A005442584974656D5451730102000000FF040000070043617074696F6E1C05
      0000040048696E74000C005442584974656D5456696577010200000000050000
      070043617074696F6E1B050000040048696E74000C005442584974656D544564
      6974010200000001050000070043617074696F6E1A050000040048696E74000C
      005442584974656D5446696C65010200000002050000070043617074696F6E19
      050000040048696E7400060063624361736501020000000D0500000700436170
      74696F6E09050000040048696E740004006564517301010000000A0500000400
      48696E740010005442436F6E74726F6C4974656D316161000009005442584974
      656D5173010200000008050000070043617074696F6E11050000040048696E74
      0006006362576F726401020000000E050000070043617074696F6E0F05000004
      0048696E74000F005442584974656D534D61726B416C6C010200000010050000
      070043617074696F6E14050000040048696E74000C005442584974656D484865
      6C70010200000027050000070043617074696F6E28050000040048696E74000D
      005442584974656D46436C6F7365010200000029050000070043617074696F6E
      3D050000040048696E7400060066436C6F736500000700506F70757054620000
      0C005442584974656D54624F746801010000002D050000070043617074696F6E
      000B005442584974656D5462436C01010000002E050000070043617074696F6E
      000C005442584974656D54624E657701010000002F050000070043617074696F
      6E001200544258536570617261746F724974656D323800001100496D6167654C
      697374436C6F736542746E000008006653617665416C6C00000F005442584974
      656D4653617665416C6C010200000033050000070043617074696F6E3C050000
      040048696E7400090066436C6F7365416C6C000010005442584974656D46436C
      6F7365416C6C010200000035050000070043617074696F6E3E05000004004869
      6E7400090066436C6F73654F7468000010005442584974656D46436C6F73654F
      7468010200000040050000070043617074696F6E41050000040048696E740012
      00544258536570617261746F724974656D323900000F005442584974656D4653
      65734F70656E010200000042050000070043617074696F6E4805000004004869
      6E740011005442584974656D4653657353617665417301020000004305000007
      0043617074696F6E49050000040048696E74000A004F445F53657373696F6E01
      02000000440500000A0044656661756C7445787445050000060046696C746572
      000A0053445F53657373696F6E0102000000460500000A0044656661756C7445
      787447050000060046696C7465720010005442585375626D656E754974656D32
      3501010000004C050000070043617074696F6E0007004D525574627832000012
      00544258536570617261746F724974656D333000000B005442584974656D4643
      6C7201010000004D050000070043617074696F6E00060074627857696E010100
      00004E050000070043617074696F6E000C005442584974656D4554696D650102
      00000050050000070043617074696F6E53050000040048696E74001100544258
      5375626D656E754974656D52756E010100000054050000070043617074696F6E
      0009005442584974656D5431010100000069050000070043617074696F6E0009
      005442584974656D543201010000006A050000070043617074696F6E00090054
      42584974656D543301010000006B050000070043617074696F6E000900544258
      4974656D543401010000006C050000070043617074696F6E0012005442585365
      70617261746F724974656D3331000011005442584974656D52756E46696E6450
      6870010200000059050000070043617074696F6E5A050000040048696E740014
      005442584974656D52756E46696E64476F6F676C6501020000005B0500000700
      43617074696F6E5C050000040048696E74000E005442584974656D52756E4D53
      494501020000005D050000070043617074696F6E5E050000040048696E740011
      005442584974656D52756E46697265666F7801020000005F0500000700436170
      74696F6E60050000040048696E740012005442584974656D52756E46696E6457
      696B69010200000061050000070043617074696F6E62050000040048696E7400
      10005442584974656D52756E4368726F6D650102000000630500000700436170
      74696F6E64050000040048696E740010005442584974656D52756E5361666172
      69010200000065050000070043617074696F6E66050000040048696E74001100
      5442584974656D52756E4F70656E446972010200000067050000070043617074
      696F6E68050000040048696E740009005442584974656D543501010000008505
      0000070043617074696F6E0009005442584974656D5436010100000086050000
      070043617074696F6E0009005442584974656D54370101000000870500000700
      43617074696F6E0009005442584974656D543801010000008805000007004361
      7074696F6E0011005442585375626D656E754974656D456E6301010000008905
      0000070043617074696F6E0012005442585375626D656E754C696E65456E6473
      01010000008A050000070043617074696F6E000E005442584974656D456E644D
      57696E00000D005442584974656D456E644D556E00000E005442584974656D45
      6E644D4D616300000D005442585375626D656E75456E6301020000008E050000
      070043617074696F6EA1050000040048696E74000E005442585375626D656E75
      456E63320102000000A0050000070043617074696F6EA2050000040048696E74
      00090054696D65724C6F616400000E005442584974656D5462436C6F73650102
      000000A6050000070043617074696F6EA5050000040048696E74000900656352
      65706C6163650101000000BD050000040048696E74000B005442584974656D53
      5265700102000000AA050000070043617074696F6EAD050000040048696E7400
      0C005442584974656D5346696E640102000000AB050000070043617074696F6E
      AC050000040048696E740008005442584974656D380102000000AE0500000700
      43617074696F6EAF050000040048696E740012005442584974656D52756E4669
      6E644D53444E0102000000B0050000070043617074696F6EB105000004004869
      6E740005006645786974000010005442584974656D46436C6F736544656C0102
      000000B6050000070043617074696F6EB9050000040048696E7400090066436C
      6F736544656C00000D005442584974656D5246696C65730102000000BF050000
      070043617074696F6EBB050000040048696E7400100065635265706C61636549
      6E46696C65730101000000BE050000040048696E740010005442584974656D53
      52657046696C65730102000000C0050000070043617074696F6EC10500000400
      48696E7400080054696D657253656C000015005442585375626D656E75497465
      6D4374784D6F72650101000000C4050000070043617074696F6E001100544258
      4974656D437478436F707955726C0102000000C5050000070043617074696F6E
      C6050000040048696E740014005442584974656D437478436F7079417070656E
      640102000000C7050000070043617074696F6EC8050000040048696E74001300
      5442584974656D437478437574417070656E640102000000C905000007004361
      7074696F6ECA050000040048696E74001200544258536570617261746F724974
      656D3334000012005442584974656D437478436F707948544D4C0102000000CB
      050000070043617074696F6ED3050000040048696E740011005442584974656D
      437478436F70795254460102000000CD050000070043617074696F6E0D060000
      040048696E74000C006563436F7079417348544D4C0101000000D20500000700
      43617074696F6E0009006563436F70794170700102000000DA05000007004361
      7074696F6EDC050000040048696E7400080065634375744170700102000000DB
      050000070043617074696F6EDD050000040048696E7400120054425853657061
      7261746F724974656D333500000E005442584974656D45437574417070010200
      0000DE050000070043617074696F6EDF050000040048696E74000F0054425849
      74656D45436F70794170700102000000E0050000070043617074696F6EE10500
      00040048696E740010005442585375626D656E754974656D57620101000000E2
      050000070043617074696F6E0010005442585375626D656E754974656D427201
      01000000E3050000070043617074696F6E0009005442584974656D5439010100
      0000E4050000070043617074696F6E000A005442584974656D54313001010000
      00E5050000070043617074696F6E000A005442584974656D5431310101000000
      E6050000070043617074696F6E000A005442584974656D5431320101000000E7
      050000070043617074696F6E0011005442584974656D53476F427261636B6574
      0102000000F1050000070043617074696F6EF2050000040048696E7400050070
      6C4F75740101000000F3050000070043617074696F6E0007004C6973744F7574
      00000B005442584974656D564F75740102000000F7050000070043617074696F
      6EF8050000040048696E7400050065634F75740101000000F405000007004361
      7074696F6E000B005442584974656D4F4F75740102000000F905000007004361
      7074696F6EFA050000040048696E74000800506F7075704F757400000B005442
      584974656D4F436C720101000000FC050000070043617074696F6E000A005442
      584974656D4F43700101000000FD050000070043617074696F6E000B00544258
      4974656D4F4E61760101000000FE050000070043617074696F6E001200544258
      536570617261746F724974656D313800000D005442584974656D4F4370416C6C
      0101000000FF050000070043617074696F6E001200544258536570617261746F
      724974656D333200000F00496D6167654C69737453746174757300000B005442
      584974656D4F44656C010100000004060000070043617074696F6E000C005442
      584974656D4F44656C4E010100000005060000070043617074696F6E00070074
      62506C4F757400000C005442584974656D4F4F4F757401010000000606000007
      0043617074696F6E000D005442584974656D4F4F46696E640101000000070600
      00070043617074696F6E000900506F70757046696E6400001200544258497465
      6D5472656546696E644E6176010100000008060000070043617074696F6E0012
      00544258536570617261746F724974656D333600001200544258536570617261
      746F724974656D333700000B006563436F7079417352544601010000000C0600
      00070043617074696F6E000C0066437573746F6D697A65486900000F00544258
      4974656D4F4C65786572486901020000000E060000070043617074696F6E0F06
      0000040048696E74001200544258536570617261746F724974656D333800000E
      005442584974656D4F4F4C65785374010200000010060000070043617074696F
      6E11060000040048696E74000C005442584974656D4545787472010200000012
      060000070043617074696F6E13060000040048696E7400120054425853657061
      7261746F724974656D3339000010005442584974656D454361736553656E7401
      0200000018060000070043617074696F6E19060000040048696E74000D005442
      584974656D434353656E7401020000001A060000070043617074696F6E1B0600
      00040048696E74000A00656353656E744361736501010000001C060000070043
      617074696F6E000900506F7075705A6F6F6D0000110054425853657061726174
      6F724974656D3500000E005442584974656D5A53657433303000000E00544258
      4974656D5A53657432303000000E005442584974656D5A53657431353000000E
      005442584974656D5A53657431303000000D005442584974656D5A5365743735
      00000D005442584974656D5A536574353000000B005442584974656D5A536574
      00000D005442584974656D5A4F74686572010100000025060000070043617074
      696F6E000600706C436C6970000006006563436C697001010000002706000007
      0043617074696F6E001200544258536570617261746F724974656D323500000C
      005442584974656D4F436C6970010200000028060000070043617074696F6E29
      060000040048696E74000900506F707570436C697000000E005442584974656D
      436C6970436C7201010000002C060000070043617074696F6E0014006563476F
      746F4E65787446696E64526573756C74000014006563476F746F507265764669
      6E64526573756C7400001200544258536570617261746F724974656D34300000
      0F005442584974656D535265735072657601020000002D060000070043617074
      696F6E33060000040048696E74000F005442584974656D535265734E65787401
      020000002E060000070043617074696F6E34060000040048696E74000E005442
      584974656D4553796E634564010200000035060000070043617074696F6E3606
      0000040048696E74000E005442584974656D4653657341646401020000003B06
      0000070043617074696F6E3C060000040048696E74000900656346756C6C5363
      7200000F005442584974656D4F46756C6C536372010200000041060000070043
      617074696F6E44060000040048696E74000D0054696D6572427261636B657473
      00001200544258536570617261746F724974656D343100000E00544258497465
      6D54624370446972010100000046060000070043617074696F6E000F00544258
      4974656D5462437046756C6C010100000047060000070043617074696F6E000D
      005442584974656D54624370464E010100000048060000070043617074696F6E
      00090053706C69747465723100000C0050616765436F6E74726F6C3200001200
      544258536570617261746F724974656D3432000013005442584974656D54624D
      6F7665546F5669657701010000004A060000070043617074696F6E000D00506F
      70757053706C6974746572000011005442584974656D5462436C6F7365416C6C
      01020000004C060000070043617074696F6E4D060000040048696E74000D0054
      42584974656D5370486F727A010100000050060000070043617074696F6E0012
      00544258536570617261746F724974656D343300001200544258536570617261
      746F724974656D343400000D005442584974656D5653796E6348010100000052
      060000040048696E74000D005442584974656D5653796E635601010000005306
      0000040048696E74000700656353796E634800000700656353796E635600000D
      005442584974656D4F5368656C6C010200000058060000070043617074696F6E
      59060000040048696E740012005442585375626D656E754974656D5669657701
      010000005A060000070043617074696F6E000D005442584974656D4F4F6E546F
      7001020000005B060000070043617074696F6E5C060000040048696E74000700
      65634F6E546F70000011005442584974656D4546696C6C426C6F636B01020000
      005F060000070043617074696F6E62060000040048696E74000F005442584974
      656D45496E7354657874010200000063060000070043617074696F6E6B060000
      040048696E74001200544258536570617261746F724974656D32330000110054
      42584974656D4374784F70656E53656C010100000068060000040048696E7400
      0D005442584974656D46456D61696C010200000069060000070043617074696F
      6E6A060000040048696E74001200544258536570617261746F724974656D3435
      00000B005442584974656D4343313200000B005442584974656D434331310000
      0B005442584974656D4343313000000A005442584974656D43433900000A0054
      42584974656D43433800000A005442584974656D43433700000A005442584974
      656D43433600000A005442584974656D43433500000A005442584974656D4343
      3400000A005442584974656D43433300000A005442584974656D43433200000A
      005442584974656D43433100001200544258536570617261746F724974656D31
      3300001200544258536570617261746F724974656D3234000010005442585375
      626D656E754974656D313001010000006C060000070043617074696F6E001500
      5442584974656D4F526573746F72655374796C657301020000006D0600000700
      43617074696F6E6E060000040048696E740013005442584974656D4374784375
      73746F6D697A6501010000006F060000070043617074696F6E0011006563546F
      67676C65466F63757354726565000011006563546F67676C65466F637573436C
      697000000B0065635A656E457870616E6400001200544258536570617261746F
      724974656D34360000090065635A656E57726170000010005442585375626D65
      6E754974656D3133010100000080060000070043617074696F6E000C00544258
      4974656D45436F6D6D010200000081060000070043617074696F6E8206000004
      0048696E74000E005442584974656D45556E636F6D6D01020000008306000007
      0043617074696F6E84060000040048696E740019005442584974656D45546F67
      676C654C696E65436F6D6D656E74010200000085060000070043617074696F6E
      86060000040048696E740013006563546F67676C654C696E65436F6D6D656E74
      000013006563546F67676C65466F6375734F757470757400000800664D616B65
      42616B000015006563546F67676C6553747265616D436F6D6D656E7400001B00
      5442584974656D45546F67676C6553747265616D436F6D6D656E740102000000
      8F060000070043617074696F6E90060000040048696E74001000544258537562
      6D656E754974656D3136010100000091060000070043617074696F6E00100054
      42585375626D656E754974656D3137010100000092060000070043617074696F
      6E000E005442584974656D454D6F7665446E0102000000930600000700436170
      74696F6E95060000040048696E74000E005442584974656D454D6F7665557001
      0200000094060000070043617074696F6E96060000040048696E74000E005442
      584974656D48446F6E617465010200000097060000070043617074696F6E9806
      0000040048696E74000D005442584974656D4544656C4C6E0102000000990600
      00070043617074696F6E9A060000040048696E74001200544258536570617261
      746F724974656D3437000010005442585375626D656E754974656D3138010100
      00009B060000070043617074696F6E0011005442584974656D45437044697250
      61746801010000009C060000070043617074696F6E0012005442584974656D45
      437046756C6C5061746801010000009D060000070043617074696F6E000C0054
      42584974656D454370464E01010000009E060000070043617074696F6E001400
      6563546F67676C65466F63757346696E64526573000013005442584974656D54
      625370656C6C436865636B0102000000A9060000070043617074696F6EAA0600
      00040048696E74001200544258536570617261746F724974656D343800000C00
      65635370656C6C436865636B00000B0065635370656C6C4C6976650000120054
      42584974656D54625370656C6C4C6976650102000000AB060000070043617074
      696F6EAC060000040048696E740012005442584974656D565370656C6C436865
      636B0102000000AE060000070043617074696F6EAF060000040048696E740011
      005442584974656D565370656C6C4C6976650102000000B00600000700436170
      74696F6EB1060000040048696E74000B0065634A6F696E4C696E657300001200
      544258536570617261746F724974656D343900000C005442584974656D454A6F
      696E0102000000B6060000070043617074696F6EB7060000040048696E74000C
      00656353706C69744C696E657300000D005442584974656D4553706C69740102
      000000BC060000070043617074696F6EBD060000040048696E74001200544258
      536570617261746F724974656D3530000014005442585375626D656E75497465
      6D4D6163726F730101000000BE060000070043617074696F6E00100054425849
      74656D4D6163726F506C61790102000000C7060000070043617074696F6ED506
      0000040048696E740010005442584974656D4D6163726F53746F700102000000
      C9060000070043617074696F6ED3060000040048696E74001200544258497465
      6D4D6163726F5265636F72640102000000CB060000070043617074696F6ED206
      0000040048696E740012005442584974656D4D6163726F43616E63656C010200
      0000CD060000070043617074696F6ED4060000040048696E7400120054425853
      6570617261746F724974656D353100000F005442584974656D4D6163726F446C
      670102000000CF060000070043617074696F6ED6060000040048696E74000E00
      65634D6163726F5265636F72643100000C0065634D6163726F53746F70310000
      0E0065634D6163726F43616E63656C3100000C0065634D6163726F506C617931
      00000A0065634D6163726F446C670000100065634D6163726F5265636F726465
      7231000011005442584974656D52756E507265766965770102000000D8060000
      070043617074696F6ED9060000040048696E7400120054425853657061726174
      6F724974656D35320000080065634D6163726F310000080065634D6163726F32
      0000080065634D6163726F330000080065634D6163726F340000080065634D61
      63726F350000080065634D6163726F360000080065634D6163726F3700000800
      65634D6163726F380000080065634D6163726F390000100050726F70734D616E
      616765724B65797300001200544258536570617261746F724974656D35330000
      0D005442584974656D4D6163726F3900000D005442584974656D4D6163726F38
      00000D005442584974656D4D6163726F3700000D005442584974656D4D616372
      6F3600000D005442584974656D4D6163726F3500000D005442584974656D4D61
      63726F3400000D005442584974656D4D6163726F3300000D005442584974656D
      4D6163726F3200000D005442584974656D4D6163726F3100000D005442584974
      656D426B4E6578740102000000EE060000070043617074696F6EF10600000400
      48696E74000D005442584974656D426B507265760102000000EF060000070043
      617074696F6EF2060000040048696E74000F005442584974656D426B546F6767
      6C650102000000F0060000070043617074696F6EF3060000040048696E74000C
      006563426B436C656172416C6C00000A006563426B546F67676C650000080065
      63426B4E657874000008006563426B5072657600000B006563426B496E766572
      7365000010005442584974656D426B496E76657273650102000000FA06000007
      0043617074696F6EFB060000040048696E740008006563426B436F7079000007
      006563426B43757400000A006563426B44656C65746500000E006563426B4465
      6C657465556E6D6B000009006563426B5061737465000010005442584974656D
      426B44656C556E6D6B010200000007070000070043617074696F6E0C07000004
      0048696E74000C005442584974656D426B44656C010200000008070000070043
      617074696F6E0D070000040048696E74000E005442584974656D426B50617374
      65010200000009070000070043617074696F6E0E070000040048696E74000C00
      5442584974656D426B43757401020000000A070000070043617074696F6E0F07
      0000040048696E74000D005442584974656D426B436F707901020000000B0700
      00070043617074696F6E10070000040048696E74000D005442584974656D5462
      476F746F010200000013070000070043617074696F6E14070000040048696E74
      0006006563476F746F00001200544258536570617261746F724974656D313200
      0010005442584974656D5653796E635665727401020000001707000007004361
      7074696F6E18070000040048696E740010005442584974656D5653796E63486F
      727A010200000019070000070043617074696F6E1A070000040048696E74000C
      006563546F67676C655669657700000A006563436F70794C696E650000090065
      634375744C696E6500001200544258536570617261746F724974656D35340000
      0F005442584974656D454375744C696E6501020000001D070000070043617074
      696F6E23070000040048696E740010005442584974656D45436F70794C696E65
      01020000001E070000070043617074696F6E24070000040048696E7400120054
      42585375626D656E754974656D54696479010100000025070000070043617074
      696F6E000E005442584974656D54696479436667010200000026070000070043
      617074696F6E28070000040048696E74000E005442584974656D546964795661
      6C010200000027070000070043617074696F6E29070000040048696E74001200
      544258536570617261746F724974656D3535000007004C69737456616C00000C
      005442584974656D4F4F56616C01010000002E070000070043617074696F6E00
      0D00506F70757056616C696461746500000D005442584974656D56616C4E6176
      01010000002F070000070043617074696F6E001200544258536570617261746F
      724974656D353600000C005442584974656D56616C4370010100000030070000
      070043617074696F6E000F005442584974656D56616C4370416C6C0101000000
      31070000070043617074696F6E001200544258536570617261746F724974656D
      353700000D005442584974656D56616C436C7201010000003207000007004361
      7074696F6E0015006563546F67676C65466F63757356616C6964617465000015
      005442584974656D45446564757041646A6163656E7401010000003707000007
      0043617074696F6E0016005442584974656D5462446564757041646A6163656E
      74010100000039070000070043617074696F6E00120054425853657061726174
      6F724974656D353800000B005442584974656D57696E3901010000004F070000
      070043617074696F6E000B005442584974656D57696E38010100000050070000
      070043617074696F6E000B005442584974656D57696E37010100000051070000
      070043617074696F6E000B005442584974656D57696E36010100000052070000
      070043617074696F6E000B005442584974656D57696E35010100000053070000
      070043617074696F6E000B005442584974656D57696E34010100000054070000
      070043617074696F6E000B005442584974656D57696E33010100000055070000
      070043617074696F6E000B005442584974656D57696E32010100000056070000
      070043617074696F6E000B005442584974656D57696E31010100000057070000
      070043617074696F6E000B005442584974656D57696E30010100000058070000
      070043617074696F6E0012005442585375626D656E754974656D536573730101
      00000059070000070043617074696F6E000F005442584D52554C697374497465
      6D3100001200544258536570617261746F724974656D353900000E0054425849
      74656D53657373436C7201010000005A070000070043617074696F6E0008004D
      52555F5365737301010000005B0700000600507265666978000F005442584974
      656D465365735361766501020000005C070000070043617074696F6E5D070000
      040048696E740010005442584974656D46536573436C6F736501020000005E07
      0000070043617074696F6E5F070000040048696E74000E00656352656D6F7665
      426C616E6B73000011005442584974656D4552656D426C616E6B730102000000
      64070000070043617074696F6E65070000040048696E74000D00656352656D6F
      76654C696E657300000F005442585375626D656E754974656D31010100000066
      070000070043617074696F6E001200544258536570617261746F724974656D36
      3000000F005442584974656D455472696D416C6C010200000067070000070043
      617074696F6E6A070000040048696E740011005442584974656D455472696D54
      7261696C010200000068070000070043617074696F6E6B070000040048696E74
      0010005442584974656D455472696D4C65616401020000006907000007004361
      7074696F6E6C070000040048696E74000A0065635472696D4C65616400000B00
      65635472696D547261696C0000090065635472696D416C6C0000110065635265
      6D6F7665447570537061636573000010005442584974656D4552656D44757053
      70010200000078070000070043617074696F6E79070000040048696E74000900
      6563546162546F53700000090065635370546F54616200001200544258536570
      617261746F724974656D363100000F005442584974656D455370546F54616201
      020000007E070000070043617074696F6E7F070000040048696E74000F005442
      584974656D45546162546F5370010200000080070000070043617074696F6E81
      070000040048696E74000E00656346696E64436C69704E65787400000E006563
      46696E64436C69705072657600000F005442585375626D656E754974656D3201
      0100000086070000070043617074696F6E000C00656353706C697435305F3530
      00000C00656353706C697434305F363000000C00656353706C697436305F3430
      00000C00656353706C697433305F373000000C00656353706C697437305F3330
      00000C00656353706C697432305F383000000C00656353706C697438305F3230
      00000B005442584974656D53703530010100000096070000070043617074696F
      6E000B005442584974656D53703830010100000097070000070043617074696F
      6E000B005442584974656D53703730010100000098070000070043617074696F
      6E000B005442584974656D53703630010100000099070000070043617074696F
      6E000B005442584974656D5370343001010000009A070000070043617074696F
      6E000B005442584974656D5370333001010000009B070000070043617074696F
      6E000B005442584974656D5370323001010000009C070000070043617074696F
      6E0012005442584974656D4D6163726F52657065617401010000009D07000004
      0048696E74000D0065634D6163726F5265706561740000120054425853657061
      7261746F724974656D363200000B006563526570656174436D64000011005442
      584974656D45526570656174436D640102000000A2070000070043617074696F
      6EA3070000040048696E7400090054425853657057696E00000E005442584974
      656D57696E465265730101000000A4070000070043617074696F6E000D005442
      584974656D57696E4F75740101000000A5070000070043617074696F6E000E00
      5442584974656D57696E436C69700101000000A6070000070043617074696F6E
      000E005442584974656D57696E547265650101000000A7070000070043617074
      696F6E000D005442584974656D57696E56616C0101000000A807000007004361
      7074696F6E00090054425853756257696E0101000000A9070000070043617074
      696F6E000E0065634D61726B657273436C656172000010005442584974656D4D
      61726B436C6561720102000000AD070000070043617074696F6EAE0700000400
      48696E740009007462436C69704D6170000010005442584974656D5269676874
      436C69700101000000AF070000070043617074696F6E000F005442584974656D
      52696768744D61700101000000B0070000070043617074696F6E001000656354
      6F67676C65466F6375734D617000000D005442584974656D57696E4D61700101
      000000B3070000070043617074696F6E000C00656346696E64496E5472656500
      001000656346696E64496E547265654E65787400001000656346696E64496E54
      7265655072657600000A006563547265654E65787400000A0065635472656550
      72657600000E006563526564756365426C616E6B73000014005442584974656D
      45526564756365426C616E6B730102000000B8070000070043617074696F6EB9
      070000040048696E74000F006563476F746F4E657874426C616E6B00000F0065
      63476F746F50726576426C616E6B00000900656353656C506172610000120054
      4258536570617261746F724974656D363300000B00656353706C69744C656674
      00000C00656353706C6974526967687400000E00656353656C546F576F726445
      6E6400000F0065634A756D70546F576F7264456E6400001400656346696E644E
      65787457697468457874656E6400001400656346696E64507265765769746845
      7874656E6400000E005442584974656D484B65794D61700102000000E2070000
      070043617074696F6EE3070000040048696E74000C00656346696E64496E4C69
      737400001000656346696E64496E4C6973744E65787400001000656346696E64
      496E4C6973745072657600000F005442584974656D436C697046696E64010100
      0000E4070000070043617074696F6E001200544258536570617261746F724974
      656D363400001200544258536570617261746F724974656D3635000013005442
      584974656D5472656546696E6446696E640101000000E5070000070043617074
      696F6E001200544258536570617261746F724974656D363600000E0054425849
      74656D56616C46696E640101000000E6070000070043617074696F6E00120054
      4258536570617261746F724974656D363700000C005442584974656D4F46696E
      640101000000E7070000070043617074696F6E000900506F7075705472656500
      000F005442584974656D5472656546696E640101000000E80700000700436170
      74696F6E0011005442584974656D54726565457870616E640101000000E90700
      00070043617074696F6E0013005442584974656D54726565436F6C6C61707365
      0101000000EA070000070043617074696F6E001200544258536570617261746F
      724974656D363800000D0054696D65724175746F5361766500000E0054425849
      74656D4D6163726F323900000E005442584974656D4D6163726F323800000E00
      5442584974656D4D6163726F323700000E005442584974656D4D6163726F3236
      00000E005442584974656D4D6163726F323500000E005442584974656D4D6163
      726F323400000E005442584974656D4D6163726F323300000E00544258497465
      6D4D6163726F323200000E005442584974656D4D6163726F323100000E005442
      584974656D4D6163726F323000000E005442584974656D4D6163726F31390000
      0E005442584974656D4D6163726F313800000E005442584974656D4D6163726F
      313700000E005442584974656D4D6163726F313600000E005442584974656D4D
      6163726F313500000E005442584974656D4D6163726F313400000E0054425849
      74656D4D6163726F313300000E005442584974656D4D6163726F313200000E00
      5442584974656D4D6163726F313100000E005442584974656D4D6163726F3130
      00000E005442584974656D4D6163726F33300000090065634D6163726F313000
      00090065634D6163726F31310000090065634D6163726F31320000090065634D
      6163726F31330000090065634D6163726F31340000090065634D6163726F3135
      0000090065634D6163726F31360000090065634D6163726F3137000009006563
      4D6163726F31380000090065634D6163726F31390000090065634D6163726F32
      300000090065634D6163726F32310000090065634D6163726F32320000090065
      634D6163726F32330000090065634D6163726F32340000090065634D6163726F
      32350000090065634D6163726F32360000090065634D6163726F323700000900
      65634D6163726F32380000090065634D6163726F32390000090065634D616372
      6F3330000008005472656546696E64000018005442584974656D547265654669
      6E64436F7079546F546162010100000015080000070043617074696F6E001400
      5442584974656D5472656546696E64436C656172010100000016080000070043
      617074696F6E0019005442584974656D5472656546696E64436F7079546F436C
      6970010100000017080000070043617074696F6E0017005442584974656D5472
      656546696E64436F6C6C61707365010100000018080000070043617074696F6E
      0015005442584974656D5472656546696E64457870616E640101000000190800
      00070043617074696F6E001200544258536570617261746F724974656D363900
      0018005442584974656D5472656546696E64457870616E644375720101000000
      1A080000070043617074696F6E0010005442584974656D43747846696E644944
      01020000001B080000070043617074696F6E1C080000040048696E7400120065
      634A756D70546F4C6173744D61726B657200000C00656354726565506172656E
      74000011006563547265654E65787442726F7468657200001100656354726565
      5072657642726F74686572000011005442584974656D4D61726B476F4C617374
      01020000002E080000070043617074696F6E2F080000040048696E7400120054
      4258536570617261746F724974656D3730000012005442584974656D52756E4F
      70656E46696C65010200000030080000070043617074696F6E31080000040048
      696E740010005442584974656D5353656C546F6B656E01020000003408000007
      0043617074696F6E35080000040048696E74000A00656353656C546F6B656E00
      001D005442584974656D5472656546696E64436F7079546F436C69704E6F6465
      010100000038080000070043617074696F6E000D005442584974656D4650726F
      7073010200000039080000070043617074696F6E3A080000040048696E740006
      006650726F707300000D006563496E73657274436F6C6F7201010000003D0800
      00070043617074696F6E000D005442584974656D45436F6C6F7201020000003E
      080000070043617074696F6E3F080000040048696E7400120054425853657061
      7261746F724974656D373100000D006563476F746F53656C4564676500001300
      5442584974656D436C6970436F7079546F456401010000004408000007004361
      7074696F6E0015005442584974656D436C6970436F7079546F436C6970010100
      000045080000070043617074696F6E001200544258536570617261746F724974
      656D37320000170065635265706C61636553656C46726F6D436C6970416C6C00
      000A00665265726561644F7574000008007462506C4C65667400000F00544258
      4974656D4C6566745472656501010000004B080000070043617074696F6E000F
      005442584974656D4C65667450726F6A01010000004C08000007004361707469
      6F6E0014006563546F67676C65466F63757350726F6A65637400000E00544258
      4974656D57696E50726F6A010100000051080000070043617074696F6E000D00
      6563496E73657274496D61676500000D005442584974656D45496D6167650102
      00000052080000070043617074696F6E55080000040048696E74001800656354
      6F67676C65466F6375734D6173746572536C61766500000D006563546F67676C
      65536C617665000013005442584974656D53706C697443617074696F6E000013
      005462784974656D52756E46696E6448746D6C3401020000005E080000070043
      617074696F6E64080000040048696E740013005462784974656D52756E46696E
      6448746D6C3501020000005F080000070043617074696F6E6508000004004869
      6E74001200544258536570617261746F724974656D3733000012005442585365
      70617261746F724974656D373400000700656352756C657200000D0054425849
      74656D4F52756C6572010200000060080000070043617074696F6E6108000004
      0048696E74001400656353706C6974566965777356657274486F727A00001400
      656353706C6974536C61766556657274486F727A000008006563476F746F426B
      00000D005442584974656D426B476F746F01020000006C080000070043617074
      696F6E6D080000040048696E740014005442584974656D52756E4C6F72656D49
      7073756D010200000070080000070043617074696F6E71080000040048696E74
      000C0065634C6F72656D497073756D00000D005442585375626D656E75466176
      010100000072080000070043617074696F6E0011005442584974656D46617641
      646446696C65010200000073080000070043617074696F6E7408000004004869
      6E740010005442584974656D4661764D616E6167650102000000750800000700
      43617074696F6E76080000040048696E74000B006646617641646446696C6500
      000A00664661764D616E616765000012005442584D6E75526563656E74436F6C
      6F72730101000000F2080000040048696E74001400496D6167654C697374436F
      6C6F72526563656E74000012005442584974656D437478416464436F6C6F7201
      020000007C080000070043617074696F6E7D080000040048696E740011005442
      584974656D46617641646450726F6A01020000007E080000070043617074696F
      6E7F080000040048696E74000B006646617641646450726F6A00001200544258
      536570617261746F724974656D3735000012005442584974656D546241646454
      6F50726F6A010100000080080000070043617074696F6E001100544258497465
      6D5269676874436C697073010100000081080000070043617074696F6E001200
      6563546F67676C65466F637573436C69707300000F005462784974656D57696E
      436C697073010100000084080000070043617074696F6E000A00506F70757043
      6C697073000013005442584974656D436C697073416464546578740101000000
      85080000070043617074696F6E0010005442584974656D436C69707345646974
      010100000086080000070043617074696F6E001200544258536570617261746F
      724974656D3736000013005442584974656D436C69707341646446696C650101
      00000087080000070043617074696F6E000F005442584974656D436C69707344
      6972010100000088080000070043617074696F6E0009004F445F537761746368
      0102000000890800000A0044656661756C744578748A080000060046696C7465
      7200090053445F53776174636801020000008B0800000A0044656661756C7445
      78748C080000060046696C746572000B00544258546162436F6C6F7200001200
      5442585375626D656E75546162436F6C6F7201010000008D0800000700436170
      74696F6E0013005442584974656D546162436F6C6F724D69736301010000008E
      080000070043617074696F6E001200544258536570617261746F724974656D37
      37000012005442584974656D546162436F6C6F7244656601010000008F080000
      070043617074696F6E000900544258436F6C6F7273000013005442584974656D
      436C69707344656C54657874010100000090080000070043617074696F6E0009
      006563536D617274486C000015005442584974656D426B44726F70506F727461
      626C65010200000093080000070043617074696F6E95080000040048696E7400
      1000656344726F70506F727461626C65426B0000120054425853657061726174
      6F724974656D3738000010006563476F746F506F727461626C65426B00001500
      5442584974656D426B476F746F506F727461626C650102000000960800000700
      43617074696F6E97080000040048696E740007006652656E616D6500000E0054
      42584974656D4652656E616D6501020000009E080000070043617074696F6E9F
      080000040048696E740011005442584974656D52756E4E756D436F6E76010200
      0000A0080000070043617074696F6EA1080000040048696E7400120065634E75
      6D65726963436F6E76657274657200000F006563496E64656E744C696B653173
      7400001200544258536570617261746F724974656D3333000015005442584974
      656D45496E64656E744C696B653173740102000000A408000007004361707469
      6F6EA5080000040048696E740015005442584974656D56696577436F6C4D6172
      6B6572730102000000A8080000070043617074696F6EA9080000040048696E74
      000E0066436F6C756D6E4D61726B6572730000160065634A756D70436F6C756D
      6E4D61726B65724C6566740000170065634A756D70436F6C756D6E4D61726B65
      72526967687400001200544258536570617261746F724974656D373900000C00
      496D6167654C697374467470000008004C697374504C6F6700000D0054425849
      74656D4F4F504C6F6700000F00506F707570506C7567696E734C6F6700001200
      5442584974656D504C6F67436F707953656C0101000000B00800000700436170
      74696F6E0012005442584974656D504C6F67436F7079416C6C0101000000B108
      0000070043617074696F6E001200544258536570617261746F724974656D3831
      000011005442584974656D504C6F6744656C6574650101000000B20800000700
      43617074696F6E0010005442584974656D504C6F67436C6561720101000000B3
      080000070043617074696F6E001200544258536570617261746F724974656D38
      3200000F005442584974656D504C6F6746696E640101000000B4080000070043
      617074696F6E001200656350617374654E6F4375724368616E676500001A0054
      42584974656D43747850617374654E6F4375724368616E67650102000000B708
      0000070043617074696F6EB8080000040048696E740012005442585365706172
      61746F724974656D3830000014005442585375626D656E754974656D41626272
      65760101000000B9080000070043617074696F6E000F005442584974656D455A
      656E577261700101000000C3080000070043617074696F6E0011005442584974
      656D455A656E457870616E640101000000C2080000070043617074696F6E0018
      005442585375626D656E754974656D48656C704162627265760101000000C408
      0000070043617074696F6E000D005442584974656D48456D6D65740101000000
      C7080000070043617074696F6E000900506C7567696E41435000010100000004
      0048696E740000130065634A756D704D69786564436173654C65667400001400
      65634A756D704D6978656443617365526967687400001100656343616E63656C
      53656C656374696F6E00000D00656343656E7465724C696E6573000012005442
      58536570617261746F724974656D3833000013005442584974656D4543656E74
      65724C696E65730102000000D0080000070043617074696F6ED1080000040048
      696E740008004C697374546162730102000000D50800001200436F6C756D6E73
      5B305D2E43617074696F6ED60800001200436F6C756D6E735B315D2E43617074
      696F6E000F005442584974656D4C656674546162730101000000D40800000700
      43617074696F6E0011006563546F67676C65466F6375735461627300000E0054
      62784974656D57696E546162730101000000D9080000070043617074696F6E00
      15005442585375626D656E754974656D506C7567696E730101000000DA080000
      070043617074696F6E001200544258536570617261746F724974656D38340000
      16005442584974656D4F4F70656E506C7567696E73496E690102000000DB0800
      00070043617074696F6EDC080000040048696E740011005442584974656D504C
      6F675361766541730101000000DD080000070043617074696F6E001500544258
      4974656D54624D6F7665546F57696E646F770101000000DE0800000700436170
      74696F6E0015005442584974656D54624F70656E496E57696E646F7701010000
      00DF080000070043617074696F6E0011006563457874656E6453656C42794C69
      6E65000014005442584974656D52756E456E636F646548746D6C0102000000E2
      080000070043617074696F6EE3080000040048696E740011006563456E636F64
      6548746D6C436861727300000C006563536F72744469616C6F67000012005442
      584974656D45536F72744469616C6F670102000000E608000007004361707469
      6F6EE7080000040048696E74001200544258536570617261746F724974656D38
      36000013005442584974656D5462536F72744469616C6F670102000000E80800
      00070043617074696F6EE9080000040048696E74000D00656353656C42726163
      6B657473000013005442584974656D5353656C427261636B6574730102000000
      ED080000070043617074696F6EEE080000040048696E7400110050726F70734D
      616E616765725072696E740000090054696D6572547265650000110054425853
      75626D656E75466F6C64696E670101000000F3080000070043617074696F6E00
      11005442584974656D556E666F6C644C696E650101000000F408000007004361
      7074696F6E0010005442584974656D556E666F6C64416C6C0101000000F50800
      00070043617074696F6E000E005442584974656D466F6C64416C6C0101000000
      F6080000070043617074696F6E0011005442584974656D466F6C64506172656E
      740101000000F7080000070043617074696F6E0010006563436F6C6C61707365
      506172656E74000014006563436F6C6C61707365576974684E65737465640000
      15005442584974656D466F6C64576974684E65737465640101000000FC080000
      070043617074696F6E001200544258536570617261746F724974656D38370000
      1200544258536570617261746F724974656D3838000017005442584974656D46
      6F6C644E656172657374426C6F636B0101000000FD080000070043617074696F
      6E0013005442584974656D466F6C6453656C426C6F636B0101000000FE080000
      070043617074696F6E00100065635370546F5461624C656164696E6700001300
      5442584974656D455370546F5461624C6561640102000000FF08000007004361
      7074696F6E00090000040048696E740016006563546F67676C654C696E65436F
      6D6D656E74416C7400001C005442584974656D45546F67676C654C696E65436F
      6D6D656E74416C74010200000005090000070043617074696F6E060900000400
      48696E7400100065635061737465546F436F6C756D6E31000018005442584974
      656D4374785061737465546F436F6C756D6E3101020000000909000007004361
      7074696F6E0A090000040048696E740018005442584974656D556E666F6C6452
      616E676573496E53656C01010000000B090000070043617074696F6E00160054
      42584974656D466F6C6452616E676573496E53656C01010000000C0900000700
      43617074696F6E001200544258536570617261746F724974656D383900000E00
      6563436F6D6D616E64734C697374000013005442584974656D45436F6D6D616E
      644C69737401020000000D090000070043617074696F6E10090000040048696E
      74000D0065635363726F6C6C546F53656C00000D00656350726F6A6563744C69
      7374000010005442584974656D53476F746F46696C6501020000001309000007
      0043617074696F6E14090000040048696E74001200544258536570617261746F
      724974656D3930000010005462785375626D656E754361726574730101000000
      17090000070043617074696F6E0014005442584974656D43617265747352656D
      6F766532010100000018090000070043617074696F6E0014005442584974656D
      43617265747352656D6F766531010100000019090000070043617074696F6E00
      1200544258536570617261746F724974656D3931000019005442584974656D43
      617265747346726F6D53656C436C65617201010000001A090000070043617074
      696F6E0019005442584974656D43617265747346726F6D53656C526967687401
      010000001B090000070043617074696F6E0018005442584974656D4361726574
      7346726F6D53656C4C65667401010000001C090000070043617074696F6E0012
      00544258536570617261746F724974656D3932000017005442584974656D4361
      72657473457874446F776E456E6401010000001D090000070043617074696F6E
      0015005442584974656D4361726574734578745570456E6401010000001E0900
      00070043617074696F6E0018005442584974656D436172657473457874446F77
      6E5061676501010000001F090000070043617074696F6E001600544258497465
      6D43617265747345787455705061676501010000002009000007004361707469
      6F6E0018005442584974656D436172657473457874446F776E4C696E65010100
      000021090000070043617074696F6E0016005442584974656D43617265747345
      787455704C696E65010100000022090000070043617074696F6E001200544258
      536570617261746F724974656D393300001B005442584974656D436172657473
      46726F6D4D61726B73436C65617201010000003F090000070043617074696F6E
      001B005442584974656D43617265747346726F6D4D61726B7352696768740101
      00000040090000070043617074696F6E001A005442584974656D436172657473
      46726F6D4D61726B734C656674010100000041090000070043617074696F6E00
      0E005442584974656D45436F6C756D6E01020000004209000007004361707469
      6F6E43090000040048696E74000C00656345646974436F6C756D6E00000A0065
      634465647570416C6C00000F006563446564757041646A6163656E7400001200
      544258536570617261746F724974656D3934000010005442584974656D454465
      647570416C6C010100000044090000070043617074696F6E0012005442585365
      70617261746F724974656D3835000011005442584974656D5462446564757041
      6C6C010100000045090000070043617074696F6E001200544258536570617261
      746F724974656D3935000014005442584974656D45416C69676E576974685365
      70010200000048090000070043617074696F6E49090000040048696E74000E00
      6563416C69676E5769746853657000000E005442584974656D546253706C6974
      01020000004C090000070043617074696F6E4D090000040048696E7400140054
      42584974656D5462546F67676C6553706C697401010000004E09000007004361
      7074696F6E000D006563546F67676C6556696577320000}
  end
  object TimerHint: TTimer
    Enabled = False
    Interval = 7000
    OnTimer = TimerHintTimer
    Left = 344
    Top = 360
  end
  object PopupTb: TTBXPopupMenu
    OnPopup = PopupTbPopup
    Left = 344
    Top = 304
    object TBXItemTbCl: TTBXItem
      OnClick = TBXItemTbClClick
      Caption = 'Close tab'
      Hint = ''
    end
    object TBXItemTbOth: TTBXItem
      OnClick = TBXItemTbOthClick
      Caption = 'Close other tabs'
      Hint = ''
    end
    object TBXItemTbNew: TTBXItem
      OnClick = TBXItemTbNewClick
      Caption = 'New tab'
      Hint = ''
    end
    object TBXSeparatorItem42: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTbMoveToView: TTBXItem
      OnClick = TBXItemTbMoveToViewClick
      Caption = 'Move to other view'
      Hint = ''
    end
    object TBXItemTbToggleSplit: TTBXItem
      OnClick = TBXItemTbToggleSplitClick
      Caption = 'Toggle editor splitting'
      Hint = ''
    end
    object TBXItemTbMoveToWindow: TTBXItem
      OnClick = TBXItemTbMoveToWindowClick
      Caption = 'Move to new window'
      Hint = ''
    end
    object TBXItemTbOpenInWindow: TTBXItem
      OnClick = TBXItemTbOpenInWindowClick
      Caption = 'Open in new window'
      Hint = ''
    end
    object TBXSeparatorItem41: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTbCpFN: TTBXItem
      OnClick = TBXItemTbCpFNClick
      Caption = 'Copy filename to clipboard'
      Hint = ''
    end
    object TBXItemTbCpFull: TTBXItem
      OnClick = TBXItemTbCpFullClick
      Caption = 'Copy full path to clipboard'
      Hint = ''
    end
    object TBXItemTbCpDir: TTBXItem
      OnClick = TBXItemTbCpDirClick
      Caption = 'Copy dir path to clipboard'
      Hint = ''
    end
    object TBXSeparatorItem75: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTbAddToProj: TTBXItem
      OnClick = TBXItemTbAddToProjClick
      Caption = 'Add to project'
      Hint = ''
    end
    object TBXSubmenuTabColor: TTBXSubmenuItem
      OnPopup = TBXSubmenuTabColorPopup
      Caption = 'Set color'
      Hint = ''
      object TBXItemTabColorDef: TTBXItem
        RadioItem = True
        OnClick = TBXItemTabColorDefClick
        Caption = 'Default'
        Hint = ''
      end
      object TBXTabColor: TTBXColorPalette
        ColorSet = TBXColors
        PaletteOptions = [tpoCustomImages]
        OnChange = TBXTabColorChange
        Caption = ''
        Hint = ''
      end
      object TBXSeparatorItem77: TTBXSeparatorItem
        Caption = ''
        Hint = ''
      end
      object TBXItemTabColorMisc: TTBXItem
        OnClick = TBXItemTabColorMiscClick
        Caption = 'Custom...'
        Hint = ''
      end
    end
  end
  object ImageListCloseBtn: TImageList
    Height = 14
    Width = 14
    Left = 305
    Top = 245
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
      0000000000000000000000000000000000000000000047536B0047536B000000
      0000000000000000000047536B0047536B000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000047536B004753
      6B000000000047536B0047536B00000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004753
      6B0047536B0047536B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
      00000000000000000000000000000000000000000000000000005B6E76005E6B
      79004A5164000000000000000000000000005E6A820054637600495969000000
      0000000000000000000000000000000000003548500038455300242B3E000000
      0000000000000000000038445C002E3D50002333430000000000000000000000
      0000000000000000000000000000000000000000000000000000000000004753
      6B0047536B0047536B0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
      0000000000000000000000000000000000000000000000000000000000005666
      76004F586C00585F780000000000545C79004955710054647B00000000000000
      0000000000000000000000000000000000000000000030405000293246003239
      5200000000002E365300232F4B002E3E55000000000000000000000000000000
      000000000000000000000000000000000000000000000000000047536B004753
      6B000000000047536B0047536B00000000000000000000000000000000000000
      0000000000004060800000000000000000004060800040608000000000000000
      0000406080000000000000000000000000000000000000000000000000000000
      00005E667D004F56710053587700535D7B0054627F0000000000000000000000
      0000000000000000000000000000000000000000000000000000384057002930
      4B002D3251002D3755002E3C5900000000000000000000000000000000000000
      0000000000000000000000000000000000000000000047536B0047536B000000
      0000000000000000000047536B0047536B000000000000000000000000000000
      0000406080004060800000000000000000004060800040608000000000000000
      0000406080004060800000000000000000000000000000000000000000000000
      0000000000005D668100656D8B00495571000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000003740
      5B003F476500232F4B0000000000000000000000000000000000000000000000
      0000000000000000000047536B0047536B000000000000000000000000004753
      6B0047536B000000000000000000000000000000000000000000000000004060
      8000406080004060800040608000406080004060800040608000406080004060
      8000406080004060800040608000000000000000000000000000000000000000
      00006472850047536B00495571005B6783004D5E790000000000000000000000
      00000000000000000000000000000000000000000000000000003E4C5F00212D
      4500232F4B0035415D0027385300000000000000000000000000000000000000
      000000000000000000000000000047536B0047536B000000000047536B004753
      6B00000000000000000000000000000000000000000000000000000000000000
      0000406080004060800000000000000000004060800040608000000000000000
      0000406080004060800000000000000000000000000000000000000000004C62
      6E00566676005B697F000000000049557100506279004A627600000000000000
      00000000000000000000000000000000000000000000263C4800304050003543
      590000000000232F4B002A3C5300243C50000000000000000000000000000000
      00000000000000000000000000000000000047536B0047536B0047536B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000004060800000000000000000004060800040608000000000000000
      000040608000000000000000000000000000000000000000000047616800465C
      6700495969000000000000000000000000004C61760048607200566F7F000000
      000000000000000000000000000000000000213B420020364100233343000000
      00000000000000000000263B5000223A4C003049590000000000000000000000
      00000000000000000000000000000000000047536B0047536B0047536B000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000047536B0047536B000000000047536B004753
      6B00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000047536B0047536B000000000000000000000000004753
      6B0047536B000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000004060800040608000000000000000
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
      00000000000000000000000000000000FFFFFFFFFFFFFF00FFFFFFFF9CFFFF00
      FFFC001FC9FF3F00FFFDFFDFE3FF3F00C71D1C5FE3FF3F00E23D88DFC9FB3700
      F07DC1DF9CF33300F8FDE3DCE7E00100F07DC1DE4FF33300E23D88DF1FFB3700
      C71D1C5F1FFF3F00FFFDFFDE4FFF3F00FFFC001CE7FF3F00FFFFFFFFFFFFFF00
      00000000000000000000000000000000000000000000}
  end
  object OD_Session: TTntOpenDialog
    DefaultExt = 'syn'
    Filter = 'Session files|*.syn'
    Options = [ofHideReadOnly, ofPathMustExist, ofEnableSizing]
    Left = 585
    Top = 333
  end
  object SD_Session: TTntSaveDialog
    DefaultExt = 'syn'
    Filter = 'Session files|*.syn'
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
  object PopupOut: TTBXPopupMenu
    OnPopup = PopupOutPopup
    Left = 368
    Top = 304
    object TBXItemONav: TTBXItem
      OnClick = TBXItemONavClick
      Caption = 'Navigate'
      Hint = ''
    end
    object TBXSeparatorItem18: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemOCp: TTBXItem
      OnClick = TBXItemOCpClick
      Caption = 'Copy selected'
      Hint = ''
    end
    object TBXItemOCpAll: TTBXItem
      OnClick = TBXItemOCpAllClick
      Caption = 'Copy all'
      Hint = ''
    end
    object TBXSeparatorItem32: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemODel: TTBXItem
      OnClick = TBXItemODelClick
      Caption = 'Delete selected'
      Hint = ''
    end
    object TBXItemODelN: TTBXItem
      OnClick = TBXItemODelNClick
      Caption = 'Delete non-parsable'
      Hint = ''
    end
    object TBXItemOClr: TTBXItem
      OnClick = TBXItemOClrClick
      Caption = 'Clear'
      Hint = ''
    end
    object TBXSeparatorItem67: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemOFind: TTBXItem
      OnClick = TBXItemOFindClick
      Caption = 'Find...'
      Hint = ''
    end
  end
  object ImageListStatus: TImageList
    Left = 280
    Top = 244
    Bitmap = {
      494C01010C000E00040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
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
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
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
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
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
  object PopupFind: TTBXPopupMenu
    OnPopup = PopupFindPopup
    Left = 368
    Top = 332
    object TBXItemTreeFindNav: TTBXItem
      OnClick = TBXItemTreeFindNavClick
      Caption = 'Navigate'
      Hint = ''
    end
    object TBXSeparatorItem69: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTreeFindExpand: TTBXItem
      OnClick = TBXItemTreeFindExpandClick
      Caption = 'Expand all'
      Hint = ''
    end
    object TBXItemTreeFindExpandCur: TTBXItem
      OnClick = TBXItemTreeFindExpandCurClick
      Caption = 'Expand current node'
      Hint = ''
    end
    object TBXItemTreeFindCollapse: TTBXItem
      OnClick = TBXItemTreeFindCollapseClick
      Caption = 'Collapse all'
      Hint = ''
    end
    object TBXSeparatorItem36: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTreeFindCopyToClipNode: TTBXItem
      OnClick = TBXItemTreeFindCopyToClipNodeClick
      Caption = 'Copy selected node'
      Hint = ''
    end
    object TBXItemTreeFindCopyToClip: TTBXItem
      OnClick = TBXItemTreeFindCopyToClipClick
      Caption = 'Copy selected search'
      Hint = ''
    end
    object TBXItemTreeFindCopyToTab: TTBXItem
      OnClick = TBXItemTreeFindCopyToTabClick
      Caption = 'Copy selected search to tab'
      Hint = ''
    end
    object TBXSeparatorItem37: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTreeFindClear: TTBXItem
      OnClick = TBXItemTreeFindClearClick
      Caption = 'Clear'
      Hint = ''
    end
    object TBXSeparatorItem65: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTreeFindFind: TTBXItem
      OnClick = TBXItemTreeFindFindClick
      Caption = 'Find...'
      Hint = ''
    end
  end
  object PopupZoom: TTBXPopupMenu
    Left = 344
    Top = 332
    object TBXItemZSet: TTBXItem
      Tag = 25
      OnClick = TBXItemZSetClick
      Caption = '25%'
      Hint = ''
    end
    object TBXItemZSet50: TTBXItem
      Tag = 50
      OnClick = TBXItemZSetClick
      Caption = '50%'
      Hint = ''
    end
    object TBXItemZSet75: TTBXItem
      Tag = 75
      OnClick = TBXItemZSetClick
      Caption = '75%'
      Hint = ''
    end
    object TBXItemZSet100: TTBXItem
      Tag = 100
      OnClick = TBXItemZSetClick
      Caption = '100%'
      Hint = ''
    end
    object TBXItemZSet150: TTBXItem
      Tag = 150
      OnClick = TBXItemZSetClick
      Caption = '150%'
      Hint = ''
    end
    object TBXItemZSet200: TTBXItem
      Tag = 200
      OnClick = TBXItemZSetClick
      Caption = '200%'
      Hint = ''
    end
    object TBXItemZSet300: TTBXItem
      Tag = 300
      OnClick = TBXItemZSetClick
      Caption = '300%'
      Hint = ''
    end
    object TBXSeparatorItem5: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemZOther: TTBXItem
      OnClick = TBXItemZOtherClick
      Caption = 'Custom zoom...'
      Hint = ''
    end
  end
  object PopupClip: TTBXPopupMenu
    OnPopup = PopupClipPopup
    Left = 320
    Top = 332
    object TBXItemClipCopyToEd: TTBXItem
      OnClick = TBXItemClipCopyToEdClick
      Caption = 'Copy to editor'
      Hint = ''
    end
    object TBXItemClipCopyToClip: TTBXItem
      OnClick = TBXItemClipCopyToClipClick
      Caption = 'Copy to clipboard'
      Hint = ''
    end
    object TBXSeparatorItem72: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemClipClr: TTBXItem
      OnClick = TBXItemClipClrClick
      Caption = 'Clear'
      Hint = ''
    end
    object TBXSeparatorItem64: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemClipFind: TTBXItem
      OnClick = TBXItemClipFindClick
      Caption = 'Find...'
      Hint = ''
    end
  end
  object TimerBrackets: TTimer
    Enabled = False
    Interval = 60
    OnTimer = TimerBracketsTimer
    Left = 416
    Top = 360
  end
  object PopupSplitter: TTBXPopupMenu
    OnPopup = PopupSplitterPopup
    Left = 288
    Top = 332
    object TBXItemSplitCaption: TTBXItem
      Enabled = False
      Caption = ''
      Hint = ''
    end
    object TBXItemSp20: TTBXItem
      Action = ecSplit20_80
      Caption = '20/80'
    end
    object TBXItemSp30: TTBXItem
      Action = ecSplit30_70
      Caption = '30/70'
    end
    object TBXItemSp40: TTBXItem
      Action = ecSplit40_60
      Caption = '40/60'
    end
    object TBXItemSp50: TTBXItem
      Action = ecSplit50_50
      Caption = '50/50'
    end
    object TBXItemSp60: TTBXItem
      Action = ecSplit60_40
      Caption = '60/40'
    end
    object TBXItemSp70: TTBXItem
      Action = ecSplit70_30
      Caption = '70/30'
    end
    object TBXItemSp80: TTBXItem
      Action = ecSplit80_20
      Caption = '80/20'
    end
    object TBXSeparatorItem43: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemSpHorz: TTBXItem
      OnClick = TBXItemSpHorzClick
      Caption = 'Split horizontally'
      Hint = ''
    end
  end
  object ecMacroRecorder1: TecMacroRecorder
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
    Left = 320
    Top = 280
  end
  object PopupValidate: TTBXPopupMenu
    OnPopup = PopupValidatePopup
    Left = 392
    Top = 332
    object TBXItemValNav: TTBXItem
      OnClick = TBXItemValNavClick
      Caption = 'Navigate'
      Hint = ''
    end
    object TBXSeparatorItem56: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemValCp: TTBXItem
      OnClick = TBXItemValCpClick
      Caption = 'Copy selected'
      Hint = ''
    end
    object TBXItemValCpAll: TTBXItem
      OnClick = TBXItemValCpAllClick
      Caption = 'Copy all'
      Hint = ''
    end
    object TBXSeparatorItem57: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemValClr: TTBXItem
      OnClick = TBXItemValClrClick
      Caption = 'Clear'
      Hint = ''
    end
    object TBXSeparatorItem66: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemValFind: TTBXItem
      OnClick = TBXItemValFindClick
      Caption = 'Find...'
      Hint = ''
    end
  end
  object MRU_Sess: TTBXMRUList
    AddFullPath = False
    HidePathExtension = False
    MaxItems = 20
    Prefix = 'MRU_Sess'
    Left = 320
    Top = 388
  end
  object PopupTree: TTBXPopupMenu
    OnPopup = PopupTreePopup
    Left = 417
    Top = 330
    object TBXItemTreeExpand: TTBXItem
      OnClick = TBXItemTreeExpandClick
      Caption = 'Expand'
      Hint = ''
    end
    object TBXItemTreeCollapse: TTBXItem
      OnClick = TBXItemTreeCollapseClick
      Caption = 'Collapse'
      Hint = ''
    end
    object TBXSeparatorItem68: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemTreeFind: TTBXItem
      OnClick = TBXItemTreeFindClick
      Caption = 'Find...'
      Hint = ''
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
    Left = 329
    Top = 246
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
  object PopupClips: TTBXPopupMenu
    Left = 392
    Top = 304
    object TBXItemClipsAddText: TTBXItem
      OnClick = TBXItemClipsAddTextClick
      Caption = 'Add clip...'
      Hint = ''
    end
    object TBXItemClipsDelText: TTBXItem
      OnClick = TBXItemClipsDelTextClick
      Caption = 'Delete clip'
      Hint = ''
    end
    object TBXSeparatorItem90: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemClipsEdit: TTBXItem
      OnClick = TBXItemClipsEditClick
      Caption = 'Edit this file'
      Hint = ''
    end
    object TBXItemClipsAddFile: TTBXItem
      OnClick = TBXItemClipsAddFileClick
      Caption = 'Add new file...'
      Hint = ''
    end
    object TBXSeparatorItem76: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemClipsDir: TTBXItem
      OnClick = TBXItemClipsDirClick
      Caption = 'Browse folder'
      Hint = ''
    end
  end
  object OD_Swatch: TOpenDialog
    DefaultExt = 'swatches'
    Filter = '*.swatches|*.swatches'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 585
    Top = 358
  end
  object SD_Swatch: TSaveDialog
    DefaultExt = 'swatches'
    Filter = '*.swatches|*.swatches'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 609
    Top = 358
  end
  object TBXColors: TTBXColorSet
    ColCount = 5
    RowCount = 2
    OnGetColorInfo = TBXColorsGetColorInfo
    Left = 481
    Top = 290
  end
  object ImageListFtp: TImageList
    Height = 10
    Width = 10
    Left = 353
    Top = 246
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
  object PopupPluginsLog: TTBXPopupMenu
    OnPopup = PopupOutPopup
    Left = 440
    Top = 332
    object TBXItemPLogCopySel: TTBXItem
      OnClick = TBXItemPLogCopySelClick
      Caption = 'Copy selected'
      Hint = ''
    end
    object TBXItemPLogCopyAll: TTBXItem
      OnClick = TBXItemPLogCopyAllClick
      Caption = 'Copy all'
      Hint = ''
    end
    object TBXSeparatorItem81: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemPLogDelete: TTBXItem
      OnClick = TBXItemPLogDeleteClick
      Caption = 'Delete selected'
      Hint = ''
    end
    object TBXItemPLogClear: TTBXItem
      OnClick = TBXItemPLogClearClick
      Caption = 'Clear'
      Hint = ''
    end
    object TBXSeparatorItem82: TTBXSeparatorItem
      Caption = ''
      Hint = ''
    end
    object TBXItemPLogFind: TTBXItem
      OnClick = TBXItemPLogFindClick
      Caption = 'Find...'
      Hint = ''
    end
    object TBXItemPLogSaveAs: TTBXItem
      OnClick = TBXItemPLogSaveAsClick
      Caption = 'Save as...'
      Hint = ''
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
    BgColor = clWindow
    CommandID = 650
    Width = 300
    Height = 200
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 150
    ToolHint.Height = 0
    ToolHint.Active = True
    ToolHint.Styles = SyntStyles
    ToolHint.Formatted = True
    Controls = <>
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
      'ecSyntPrinter.FontFooter'
      'ecSyntPrinter.FontHeader'
      'ecSyntPrinter.FontLineNumders'
      'ecSyntPrinter.LineNumbersPos'
      'ecSyntPrinter.PrintSelection'
      'ecSyntPrinter.Units'
      '')
    Left = 344
    Top = 280
  end
  object TimerTree: TTimer
    Enabled = False
    OnTimer = TimerTreeTimer
    Left = 465
    Top = 362
  end
end
