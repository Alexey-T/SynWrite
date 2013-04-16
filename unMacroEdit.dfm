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
    object ButtonMRen: TTntButton
      Left = 360
      Top = 20
      Width = 87
      Height = 23
      Action = MacrosRename
      TabOrder = 1
    end
    object ButtonMDel: TTntButton
      Left = 360
      Top = 76
      Width = 87
      Height = 23
      Action = MacrosDelete
      TabOrder = 3
    end
    object ButtonMAdd: TTntButton
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
    object ButtonCCh: TTntButton
      Left = 360
      Top = 20
      Width = 87
      Height = 23
      Action = CommandChange
      TabOrder = 1
    end
    object ButtonCDel: TTntButton
      Left = 360
      Top = 108
      Width = 87
      Height = 23
      Action = CommandDelete
      TabOrder = 3
    end
    object ButtonCAdd: TTntButton
      Left = 360
      Top = 48
      Width = 87
      Height = 23
      Action = CommandInsert
      TabOrder = 2
    end
    object ButtonCClr: TTntButton
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
  object ButtonOk: TTntButton
    Left = 288
    Top = 508
    Width = 87
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 4
  end
  object ButtonCan: TTntButton
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
    Caption = 'Shortcut'
    TabOrder = 1
    object ecHotKey1: TecHotKey
      Left = 8
      Top = 24
      Width = 161
      Height = 21
      TabStop = False
      HotKey = 0
      TabOrder = 0
    end
    object ButtonShClr: TTntButton
      Left = 360
      Top = 40
      Width = 87
      Height = 23
      Caption = 'Clear'
      TabOrder = 2
      OnClick = ButtonShClrClick
    end
    object ButtonShSet: TTntButton
      Left = 360
      Top = 12
      Width = 87
      Height = 23
      Caption = 'Assign'
      TabOrder = 1
      OnClick = ButtonShSetClick
    end
  end
  object boxPlay: TTntGroupBox
    Left = 8
    Top = 268
    Width = 457
    Height = 57
    Caption = 'Play selected macro'
    TabOrder = 2
    object ButtonMPlay: TTntButton
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
      Width = 81
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
    Left = 272
    Top = 332
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
    Left = 240
    Top = 332
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
    Top = 364
    LangData = {
      0B00666D4D6163726F45646974010100000001000000070043617074696F6E01
      200000000700626F784C697374010100000002000000070043617074696F6E00
      0A004D6163726F734C69737400000A00427574746F6E4D52656E010100000036
      000000070043617074696F6E000A00427574746F6E4D44656C01010000003700
      0000070043617074696F6E000A00427574746F6E4D4164640101000000380000
      00070043617074696F6E000600626F78436D6401010000000700000007004361
      7074696F6E000900427574746F6E434368010100000039000000070043617074
      696F6E000A00427574746F6E4344656C01010000003A00000007004361707469
      6F6E000A00427574746F6E4341646401010000003B000000070043617074696F
      6E000A00427574746F6E43436C7201010000003C000000070043617074696F6E
      000700436D644C6973740103000000080000001200436F6C756D6E735B305D2E
      43617074696F6E090000001200436F6C756D6E735B315D2E43617074696F6E0A
      0000001200436F6C756D6E735B325D2E43617074696F6E000800427574746F6E
      4F6B01010000000B000000070043617074696F6E000900427574746F6E43616E
      01010000000C000000070043617074696F6E000B00416374696F6E4C69737431
      00000A004D6163726F73506C617900000C004D6163726F7352656E616D650000
      0C004D6163726F7344656C65746500000D00436F6D6D616E644368616E676501
      010000002A000000070043617074696F6E000D00436F6D6D616E64496E736572
      7401010000002C000000070043617074696F6E000D00436F6D6D616E6444656C
      65746501010000002E000000070043617074696F6E000C00436F6D6D616E6443
      6C656172010100000030000000070043617074696F6E0009004D6163726F7341
      6464000008005265636F7264657200000600626F784B65790101000000310000
      00070043617074696F6E0009006563486F744B65793100000B00427574746F6E
      5368436C72010100000032000000070043617074696F6E000B00427574746F6E
      5368536574010100000033000000070043617074696F6E000700626F78506C61
      7901010000003D000000070043617074696F6E000B00427574746F6E4D506C61
      7901010000003E000000070043617074696F6E000700656454696D657300000A
      0062506C617954696D6573010100000040000000070043617074696F6E000800
      62506C6179456F66010100000041000000070043617074696F6E00}
  end
end
