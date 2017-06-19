object fmMacroEdit: TfmMacroEdit
  Left = 270
  Top = 192
  BorderStyle = bsDialog
  Caption = 'Edit macros'
  ClientHeight = 466
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
      Caption = 'Rename'
      TabOrder = 1
    end
    object btnMacroDel: TTntButton
      Left = 360
      Top = 76
      Width = 87
      Height = 23
      Action = MacrosDelete
      Caption = 'Delete'
      TabOrder = 3
    end
    object btnMacroAdd: TTntButton
      Left = 360
      Top = 48
      Width = 87
      Height = 23
      Action = MacrosAdd
      Caption = 'Add'
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
    object btnMacroExport: TTntButton
      Left = 360
      Top = 152
      Width = 87
      Height = 23
      Caption = 'Export...'
      TabOrder = 5
      OnClick = btnMacroExportClick
    end
    object btnMacroImport: TTntButton
      Left = 360
      Top = 124
      Width = 87
      Height = 23
      Caption = 'Import...'
      TabOrder = 4
      OnClick = btnMacroImportClick
    end
  end
  object boxCmd: TTntGroupBox
    Left = 8
    Top = 256
    Width = 457
    Height = 173
    Caption = 'Commands'
    TabOrder = 2
    object btnCmdChange: TTntButton
      Left = 360
      Top = 20
      Width = 87
      Height = 23
      Action = CommandChange
      Caption = 'Change'
      TabOrder = 1
    end
    object btnCmdDel: TTntButton
      Left = 360
      Top = 108
      Width = 87
      Height = 23
      Action = CommandDelete
      Caption = 'Delete'
      TabOrder = 3
    end
    object btnCmdAdd: TTntButton
      Left = 360
      Top = 48
      Width = 87
      Height = 23
      Action = CommandInsert
      Caption = 'Insert'
      TabOrder = 2
    end
    object btnCmdClear: TTntButton
      Left = 360
      Top = 136
      Width = 87
      Height = 23
      Action = CommandClear
      Caption = 'Clear'
      TabOrder = 4
    end
    object CmdList: TTntListView
      Left = 8
      Top = 20
      Width = 345
      Height = 145
      Columns = <
        item
          Caption = 'Id'
        end
        item
          Caption = 'Data'
        end
        item
          Caption = 'Name'
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
    Top = 436
    Width = 87
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 3
    OnClick = btnOkClick
  end
  object btnCancel: TTntButton
    Left = 380
    Top = 436
    Width = 87
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object boxPlay: TTntGroupBox
    Left = 8
    Top = 196
    Width = 457
    Height = 57
    Caption = 'Play selected macro'
    TabOrder = 1
    object btnPlay: TTntButton
      Left = 360
      Top = 12
      Width = 87
      Height = 23
      Action = MacrosPlay
      Caption = 'Play'
      TabOrder = 3
    end
    object edTimes: TSpinEdit
      Left = 240
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
    Top = 356
    object MacrosPlay: TAction
      Category = 'Macros'
      OnExecute = MacrosPlayExecute
      OnUpdate = MacrosPlayUpdate
    end
    object MacrosRename: TAction
      Category = 'Macros'
      OnExecute = MacrosRenameExecute
      OnUpdate = MacrosUpdate
    end
    object MacrosDelete: TAction
      Category = 'Macros'
      OnExecute = MacrosDeleteExecute
      OnUpdate = MacrosUpdate
    end
    object CommandChange: TAction
      Category = 'Command'
      OnExecute = CommandChangeExecute
      OnUpdate = CommandChangeUpdate
    end
    object CommandInsert: TAction
      Category = 'Command'
      OnExecute = CommandInsertExecute
      OnUpdate = MacrosUpdate
    end
    object CommandDelete: TAction
      Category = 'Command'
      OnExecute = CommandDeleteExecute
      OnUpdate = CommandDeleteUpdate
    end
    object CommandClear: TAction
      Category = 'Command'
      OnExecute = CommandClearExecute
      OnUpdate = CommandClearUpdate
    end
    object MacrosAdd: TAction
      Category = 'Macros'
      OnExecute = MacrosAddExecute
    end
  end
  object Recorder: TecMacroRecorder
    Left = 224
    Top = 356
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      '*.Category')
    Left = 276
    Top = 356
    LangData = {
      0B00666D4D6163726F45646974010100000001000000070043617074696F6E01
      200000000700626F784C697374010100000002000000070043617074696F6E00
      0A004D6163726F734C69737400000B0062746E4D6163726F52656E0101000000
      46000000070043617074696F6E000B0062746E4D6163726F44656C0101000000
      47000000070043617074696F6E000B0062746E4D6163726F4164640101000000
      48000000070043617074696F6E000600626F78436D6401010000000700000007
      0043617074696F6E000C0062746E436D644368616E6765010100000049000000
      070043617074696F6E00090062746E436D6444656C01010000004A0000000700
      43617074696F6E00090062746E436D6441646401010000004B00000007004361
      7074696F6E000B0062746E436D64436C65617201010000004C00000007004361
      7074696F6E000700436D644C6973740103000000080000001200436F6C756D6E
      735B305D2E43617074696F6E090000001200436F6C756D6E735B315D2E436170
      74696F6E0A0000001200436F6C756D6E735B325D2E43617074696F6E00050062
      746E4F6B01010000000B000000070043617074696F6E00090062746E43616E63
      656C01010000000C000000070043617074696F6E000B00416374696F6E4C6973
      743100000A004D6163726F73506C617900000C004D6163726F7352656E616D65
      00000C004D6163726F7344656C65746500000D00436F6D6D616E644368616E67
      6500000D00436F6D6D616E64496E7365727400000D00436F6D6D616E6444656C
      65746500000C00436F6D6D616E64436C656172000009004D6163726F73416464
      000008005265636F7264657200000700626F78506C617901010000003D000000
      070043617074696F6E00070062746E506C617901010000004D00000007004361
      7074696F6E000700656454696D657300000A0062506C617954696D6573010100
      000040000000070043617074696F6E00080062506C6179456F66010100000041
      000000070043617074696F6E000E0062746E4D6163726F4578706F7274010100
      00004E000000070043617074696F6E00070053617665446C67000007004F7065
      6E446C6700000E0062746E4D6163726F496D706F727401010000004F00000007
      0043617074696F6E00}
  end
  object SaveDlg: TSaveDialog
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 264
    Top = 392
  end
  object OpenDlg: TOpenDialog
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Left = 240
    Top = 392
  end
end
