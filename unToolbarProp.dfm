object fmToolbarProp: TfmToolbarProp
  Left = 227
  Top = 416
  BorderStyle = bsDialog
  Caption = 'Toolbar properties'
  ClientHeight = 417
  ClientWidth = 545
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TTntButton
    Left = 336
    Top = 387
    Width = 97
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCan: TTntButton
    Left = 440
    Top = 387
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBoxCmd: TTntGroupBox
    Left = 8
    Top = 72
    Width = 529
    Height = 309
    Caption = 'Buttons'
    TabOrder = 0
    object Label2: TTntLabel
      Left = 8
      Top = 16
      Width = 52
      Height = 13
      Caption = 'Button list:'
    end
    object LabelHint: TTntLabel
      Left = 8
      Top = 124
      Width = 23
      Height = 13
      Caption = 'Hint:'
    end
    object LabelCmd: TTntLabel
      Left = 8
      Top = 164
      Width = 51
      Height = 13
      Caption = 'Command:'
    end
    object LabelIcon: TTntLabel
      Left = 8
      Top = 260
      Width = 25
      Height = 13
      Caption = 'Icon:'
    end
    object labInfo: TTntLabel
      Left = 424
      Top = 124
      Width = 97
      Height = 53
      AutoSize = False
      Caption = 'Add * to button hint to show both icon and caption.'
      WordWrap = True
    end
    object ListBox1: TListBox
      Left = 9
      Top = 32
      Width = 512
      Height = 61
      Style = lbOwnerDrawFixed
      Columns = 10
      DragMode = dmAutomatic
      ExtendedSelect = False
      ItemHeight = 36
      TabOrder = 0
      OnClick = ListBox1Click
      OnDragDrop = ListBox1DragDrop
      OnDragOver = ListBox1DragOver
      OnDrawItem = ListBox1DrawItem
    end
    object edHint: TTntEdit
      Left = 8
      Top = 140
      Width = 409
      Height = 21
      TabOrder = 4
      OnChange = edHintChange
    end
    object edCmd: TTntEdit
      Left = 8
      Top = 180
      Width = 409
      Height = 21
      ParentColor = True
      ReadOnly = True
      TabOrder = 5
    end
    object btnBrowseIcon: TTntButton
      Left = 8
      Top = 276
      Width = 201
      Height = 23
      Caption = 'Browse for icon...'
      TabOrder = 11
      OnClick = btnBrowseIconClick
    end
    object btnBrowseCmd: TTntButton
      Left = 8
      Top = 204
      Width = 201
      Height = 23
      Caption = 'Select command...'
      TabOrder = 6
      OnClick = btnBrowseCmdClick
    end
    object btnAdd: TTntButton
      Left = 8
      Top = 96
      Width = 97
      Height = 23
      Caption = 'Add'
      TabOrder = 1
      OnClick = btnAddClick
    end
    object btnDel: TTntButton
      Left = 216
      Top = 96
      Width = 97
      Height = 23
      Caption = 'Delete'
      TabOrder = 3
      OnClick = btnDelClick
    end
    object btnSep: TTntButton
      Left = 112
      Top = 96
      Width = 97
      Height = 23
      Caption = 'Separator'
      TabOrder = 2
      OnClick = btnSepClick
    end
    object btnBrowseExtTool: TTntButton
      Left = 216
      Top = 204
      Width = 201
      Height = 23
      Caption = 'Select external tool...'
      TabOrder = 7
      OnClick = btnBrowseExtToolClick
    end
    object btnBrowseMenu: TTntButton
      Left = 8
      Top = 232
      Width = 169
      Height = 23
      Caption = 'Select submenu...'
      TabOrder = 8
      OnClick = btnBrowseMenuClick
    end
    object btnBrowseMenuSys: TTntButton
      Left = 176
      Top = 232
      Width = 33
      Height = 23
      Caption = '...'
      TabOrder = 9
      OnClick = btnBrowseMenuSysClick
    end
    object btnBrowsePy: TTntButton
      Left = 216
      Top = 232
      Width = 201
      Height = 23
      Caption = 'Select plugin...'
      TabOrder = 10
      OnClick = btnBrowsePyClick
    end
    object btnRemoveIcon: TTntButton
      Left = 216
      Top = 276
      Width = 201
      Height = 23
      Caption = 'Remove icon'
      TabOrder = 12
      OnClick = btnRemoveIconClick
    end
  end
  object GroupBoxProp: TTntGroupBox
    Left = 8
    Top = 4
    Width = 529
    Height = 65
    Caption = 'Properties'
    TabOrder = 3
    object Label1: TTntLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Icons size:'
    end
    object LabelSize: TTntLabel
      Left = 168
      Top = 16
      Width = 30
      Height = 13
      Caption = '10x10'
    end
    object btnIconSize: TTntButton
      Left = 8
      Top = 34
      Width = 201
      Height = 23
      Caption = 'Change icons size...'
      TabOrder = 0
      OnClick = btnIconSizeClick
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 312
    Top = 380
    LangData = {
      0D00666D546F6F6C62617250726F70010100000001000000070043617074696F
      6E01290000000300624F6B010100000002000000070043617074696F6E000400
      6243616E010100000003000000070043617074696F6E000B0047726F7570426F
      78436D64010100000004000000070043617074696F6E0006004C6162656C3201
      0100000005000000070043617074696F6E0009004C6162656C48696E74010100
      000006000000070043617074696F6E0008004C6162656C436D64010100000007
      000000070043617074696F6E0009004C6162656C49636F6E0101000000080000
      00070043617074696F6E0008004C697374426F783100000600656448696E7400
      0005006564436D6400000D0062746E42726F77736549636F6E01010000000900
      0000070043617074696F6E000C0062746E42726F777365436D6401010000000A
      000000070043617074696F6E00060062746E41646401010000000B0000000700
      43617074696F6E00060062746E44656C01010000000C00000007004361707469
      6F6E00060062746E53657001010000000D000000070043617074696F6E000C00
      47726F7570426F7850726F7001010000000E000000070043617074696F6E0006
      004C6162656C31010100000010000000070043617074696F6E0009004C616265
      6C53697A65010100000011000000070043617074696F6E000B0062746E49636F
      6E53697A65010100000012000000070043617074696F6E00100062746E42726F
      777365457874546F6F6C010100000013000000070043617074696F6E0008004D
      656E75546F6F6C00000D0062746E42726F7773654D656E750101000000140000
      00070043617074696F6E00100062746E42726F7773654D656E75537973000007
      004D656E7553797300000A006D6E754E657746696C6501010000001500000007
      0043617074696F6E000B006D6E7552656346696C657301010000001600000007
      0043617074696F6E000C006D6E75526563436F6C6F7273010100000017000000
      070043617074696F6E000E006D6E7552656353657373696F6E73010100000018
      000000070043617074696F6E000A006D6E75456E63436F6E7601010000001900
      0000070043617074696F6E000C006D6E75456E634368616E676501010000001A
      000000070043617074696F6E0007006D6E755469647901010000001B00000007
      0043617074696F6E000B006D6E754E6F6E5072696E7401010000001C00000007
      0043617074696F6E000C006D6E75466F6C644C6576656C01010000001D000000
      070043617074696F6E000A006D6E75466F6C64696E6701010000001E00000007
      0043617074696F6E0007006C6162496E666F01010000001F0000000700436170
      74696F6E0007006D6E75436F6E76010100000020000000070043617074696F6E
      000E006D6E7552656350726F6A65637473010100000021000000070043617074
      696F6E000B0062746E42726F7773655079010100000022000000070043617074
      696F6E000A006D6E75506C7567696E7301010000002400000007004361707469
      6F6E000D0062746E52656D6F766549636F6E0101000000250000000700436170
      74696F6E000F006D6E7550726F6A656374546F6F6C7301010000002600000007
      0043617074696F6E00}
  end
  object MenuTool: TTntPopupMenu
    AutoHotkeys = maManual
    Left = 280
    Top = 376
  end
  object MenuSys: TTntPopupMenu
    AutoHotkeys = maManual
    Left = 256
    Top = 376
    object mnuNewFile: TTntMenuItem
      Caption = 'New file'
      OnClick = mnuNewFileClick
    end
    object mnuRecFiles: TTntMenuItem
      Caption = 'Recent files'
      OnClick = mnuRecFilesClick
    end
    object mnuRecProjects: TTntMenuItem
      Caption = 'Recent projects'
      OnClick = mnuRecProjectsClick
    end
    object mnuRecSessions: TTntMenuItem
      Caption = 'Recent sessions'
      OnClick = mnuRecSessionsClick
    end
    object mnuRecColors: TTntMenuItem
      Caption = 'Recent colors'
      OnClick = mnuRecColorsClick
    end
    object mnuEncChange: TTntMenuItem
      Caption = 'Encoding - change'
      OnClick = mnuEncChangeClick
    end
    object mnuEncConv: TTntMenuItem
      Caption = 'Encoding - convert to'
      OnClick = mnuEncConvClick
    end
    object mnuNonPrint: TTntMenuItem
      Caption = 'Non-printable chars'
      OnClick = mnuNonPrintClick
    end
    object mnuFolding: TTntMenuItem
      Caption = 'Folding'
      OnClick = mnuFoldingClick
    end
    object mnuFoldLevel: TTntMenuItem
      Caption = 'Fold level'
      OnClick = mnuFoldLevelClick
    end
    object mnuTidy: TTntMenuItem
      Caption = 'Html Tidy'
      OnClick = mnuTidyClick
    end
    object mnuConv: TTntMenuItem
      Caption = 'Text converters'
      OnClick = mnuConvClick
    end
    object mnuPlugins: TTntMenuItem
      Caption = 'Command plugins'
      OnClick = mnuPluginsClick
    end
    object mnuProjectTools: TTntMenuItem
      Caption = 'Project tools'
      Enabled = False
      OnClick = mnuProjectToolsClick
    end
  end
end
