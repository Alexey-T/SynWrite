object fmMacroEdit: TfmMacroEdit
  Left = 270
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Edit macros'
  ClientHeight = 538
  ClientWidth = 474
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = TntFormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object boxList: TTntGroupBox
    Left = 8
    Top = 4
    Width = 457
    Height = 189
    Caption = 'Macros'
    TabOrder = 0
    object btnMacroRen: TTntButton
      Left = 360
      Top = 20
      Width = 87
      Height = 23
      Action = MacrosRename
      TabOrder = 1
    end
    object btnMacroDel: TTntButton
      Left = 360
      Top = 76
      Width = 87
      Height = 23
      Action = MacrosDelete
      TabOrder = 3
    end
    object btnMacroAdd: TTntButton
      Left = 360
      Top = 48
      Width = 87
      Height = 23
      Action = MacrosAdd
      TabOrder = 2
    end
    object MacrosList: TTntListBox
      Left = 8
      Top = 20
      Width = 345
      Height = 161
      DragMode = dmAutomatic
      ItemHeight = 13
      TabOrder = 0
      OnClick = MacrosListClick
      OnDblClick = MacrosListDblClick
      OnDragDrop = MacrosListDragDrop
      OnDragOver = MacrosListDragOver
    end
  end
  object boxCmd: TTntGroupBox
    Left = 8
    Top = 328
    Width = 457
    Height = 173
    Caption = 'Commands'
    TabOrder = 3
    object btnCmdChange: TTntButton
      Left = 360
      Top = 20
      Width = 87
      Height = 23
      Action = CommandChange
      TabOrder = 1
    end
    object btnCmdDel: TTntButton
      Left = 360
      Top = 108
      Width = 87
      Height = 23
      Action = CommandDelete
      TabOrder = 3
    end
    object btnCmdAdd: TTntButton
      Left = 360
      Top = 48
      Width = 87
      Height = 23
      Action = CommandInsert
      TabOrder = 2
    end
    object btnCmdClear: TTntButton
      Left = 360
      Top = 136
      Width = 87
      Height = 23
      Action = CommandClear
      TabOrder = 4
    end
    object CmdList: TTntListView
      Left = 8
      Top = 20
      Width = 345
      Height = 145
      Columns = <
        item
          Caption = 'ID'
        end
        item
          Caption = 'Data'
        end
        item
          Caption = 'Command Name'
          Width = 220
        end>
      ColumnClick = False
      DragMode = dmAutomatic
      HideSelection = False
      MultiSelect = True
      ReadOnly = True
      RowSelect = True
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = CmdListDblClick
      OnDragDrop = CmdListDragDrop
      OnDragOver = CmdListDragOver
    end
  end
  object btnOk: TTntButton
    Left = 288
    Top = 508
    Width = 87
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object btnCancel: TTntButton
    Left = 380
    Top = 508
    Width = 87
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 5
  end
  object boxKey: TTntGroupBox
    Left = 8
    Top = 196
    Width = 457
    Height = 69
    Caption = 'Hotkey'
    TabOrder = 1
    object ecHotkey: TecHotKey
      Left = 8
      Top = 24
      Width = 161
      Height = 21
      TabStop = False
      HotKey = 0
      TabOrder = 0
    end
    object btnKeyClear: TTntButton
      Left = 360
      Top = 12
      Width = 87
      Height = 23
      Caption = 'Clear'
      TabOrder = 1
      OnClick = btnKeyClearClick
    end
    object btnKeyAdd: TTntButton
      Left = 360
      Top = 40
      Width = 87
      Height = 23
      Caption = 'Set'
      TabOrder = 2
      OnClick = btnKeyAddClick
    end
  end
  object boxPlay: TTntGroupBox
    Left = 8
    Top = 268
    Width = 457
    Height = 57
    Caption = 'Play selected macro'
    TabOrder = 2
    object btnPlay: TTntButton
      Left = 360
      Top = 12
      Width = 87
      Height = 23
      Action = MacrosPlay
      TabOrder = 3
    end
    object edTimes: TSpinEdit
      Left = 232
      Top = 14
      Width = 89
      Height = 22
      MaxValue = 500000
      MinValue = 1
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      Value = 1
      OnKeyDown = edTimesKeyDown
    end
    object bPlayTimes: TTntRadioButton
      Left = 8
      Top = 16
      Width = 217
      Height = 17
      Caption = 'Play specified number of times:'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object bPlayEof: TTntRadioButton
      Left = 8
      Top = 32
      Width = 217
      Height = 17
      Caption = 'Play till the end of file'
      TabOrder = 1
    end
  end
  object ActionList1: TActionList
    Left = 248
    Top = 428
    object MacrosPlay: TAction
      Category = 'Macros'
      Caption = 'Play'
      OnExecute = MacrosPlayExecute
      OnUpdate = MacrosPlayUpdate
    end
    object MacrosRename: TAction
      Category = 'Macros'
      Caption = 'Rename'
      OnExecute = MacrosRenameExecute
      OnUpdate = MacrosUpdate
    end
    object MacrosDelete: TAction
      Category = 'Macros'
      Caption = 'Delete'
      OnExecute = MacrosDeleteExecute
      OnUpdate = MacrosUpdate
    end
    object CommandChange: TAction
      Category = 'Command'
      Caption = 'Change'
      OnExecute = CommandChangeExecute
      OnUpdate = CommandChangeUpdate
    end
    object CommandInsert: TAction
      Category = 'Command'
      Caption = 'Add'
      OnExecute = CommandInsertExecute
      OnUpdate = MacrosUpdate
    end
    object CommandDelete: TAction
      Category = 'Command'
      Caption = 'Delete'
      OnExecute = CommandDeleteExecute
      OnUpdate = CommandDeleteUpdate
    end
    object CommandClear: TAction
      Category = 'Command'
      Caption = 'Clear'
      OnExecute = CommandClearExecute
      OnUpdate = CommandClearUpdate
    end
    object MacrosAdd: TAction
      Category = 'Macros'
      Caption = 'Add'
      OnExecute = MacrosAddExecute
    end
  end
  object Recorder: TecMacroRecorder
    Left = 224
    Top = 428
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      '*.Category'
      '*Dialog1.*'
      'File*.*'
      'Macros*.*')
    StoreList.Strings = (
      'Button*')
    Left = 276
    Top = 428
    LangData = {
      0B00666D4D6163726F45646974010100000001000000070043617074696F6E01
      200000000700626F784C697374010100000002000000070043617074696F6E00
      0A004D6163726F734C69737400000B0062746E4D6163726F52656E00000B0062
      746E4D6163726F44656C00000B0062746E4D6163726F41646400000600626F78
      436D64010100000007000000070043617074696F6E000C0062746E436D644368
      616E67650000090062746E436D6444656C0000090062746E436D644164640000
      0B0062746E436D64436C65617200000700436D644C6973740103000000080000
      001200436F6C756D6E735B305D2E43617074696F6E090000001200436F6C756D
      6E735B315D2E43617074696F6E0A0000001200436F6C756D6E735B325D2E4361
      7074696F6E00050062746E4F6B01010000000B000000070043617074696F6E00
      090062746E43616E63656C01010000000C000000070043617074696F6E000B00
      416374696F6E4C6973743100000A004D6163726F73506C617900000C004D6163
      726F7352656E616D6500000C004D6163726F7344656C65746500000D00436F6D
      6D616E644368616E676501010000002A000000070043617074696F6E000D0043
      6F6D6D616E64496E7365727401010000002C000000070043617074696F6E000D
      00436F6D6D616E6444656C65746501010000002E000000070043617074696F6E
      000C00436F6D6D616E64436C656172010100000030000000070043617074696F
      6E0009004D6163726F73416464000008005265636F7264657200000600626F78
      4B6579010100000031000000070043617074696F6E0008006563486F746B6579
      00000B0062746E4B6579436C656172010100000032000000070043617074696F
      6E00090062746E4B6579416464010100000033000000070043617074696F6E00
      0700626F78506C617901010000003D000000070043617074696F6E0007006274
      6E506C617900000700656454696D657300000A0062506C617954696D65730101
      00000040000000070043617074696F6E00080062506C6179456F660101000000
      41000000070043617074696F6E00}
  end
end
