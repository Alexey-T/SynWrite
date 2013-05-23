object fmToolbarProp: TfmToolbarProp
  Left = 227
  Top = 416
  BorderStyle = bsDialog
  Caption = 'Toolbar properties'
  ClientHeight = 389
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
    Left = 352
    Top = 359
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCan: TTntButton
    Left = 448
    Top = 359
    Width = 90
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
    Height = 281
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
      Top = 232
      Width = 25
      Height = 13
      Caption = 'Icon:'
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
      Top = 248
      Width = 201
      Height = 23
      Caption = 'Browse for icon...'
      TabOrder = 8
      OnClick = btnBrowseIconClick
    end
    object btnBrowseCmd: TTntButton
      Left = 8
      Top = 204
      Width = 201
      Height = 23
      Caption = 'Browse for command...'
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
      Caption = 'Browse for external tool...'
      TabOrder = 7
      OnClick = btnBrowseExtToolClick
    end
  end
  object GroupBoxProp: TTntGroupBox
    Left = 8
    Top = 4
    Width = 529
    Height = 65
    Caption = 'Properties'
    TabOrder = 3
    object Label6: TTntLabel
      Left = 320
      Top = 12
      Width = 78
      Height = 13
      Caption = 'Toolbar caption:'
      Visible = False
    end
    object Label1: TTntLabel
      Left = 8
      Top = 16
      Width = 51
      Height = 13
      Caption = 'Icons size:'
    end
    object LabelSize: TTntLabel
      Left = 160
      Top = 16
      Width = 30
      Height = 13
      Caption = '10x10'
    end
    object edCaption: TTntEdit
      Left = 320
      Top = 28
      Width = 201
      Height = 21
      TabOrder = 0
      Visible = False
    end
    object btnIconSize: TTntButton
      Left = 8
      Top = 34
      Width = 201
      Height = 23
      Caption = 'Change icons size...'
      TabOrder = 1
      OnClick = btnIconSizeClick
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 312
    Top = 352
    LangData = {
      0D00666D546F6F6C62617250726F70010100000001000000070043617074696F
      6E01170000000300624F6B010100000002000000070043617074696F6E000400
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
      004C6162656C3601010000000F000000070043617074696F6E0006004C616265
      6C31010100000010000000070043617074696F6E0009004C6162656C53697A65
      010100000011000000070043617074696F6E000900656443617074696F6E0000
      0B0062746E49636F6E53697A65010100000012000000070043617074696F6E00
      100062746E42726F777365457874546F6F6C0101000000130000000700436170
      74696F6E0008004D656E75546F6F6C0000}
  end
  object MenuTool: TTntPopupMenu
    AutoHotkeys = maManual
    Left = 280
    Top = 348
  end
end
