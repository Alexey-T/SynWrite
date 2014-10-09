object fmMacroCmd: TfmMacroCmd
  Left = 328
  Top = 323
  BorderStyle = bsDialog
  Caption = 'Select macro command'
  ClientHeight = 367
  ClientWidth = 457
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 8
    Width = 51
    Height = 13
    Caption = '&Command:'
    FocusControl = List
  end
  object Label2: TTntLabel
    Left = 8
    Top = 288
    Width = 27
    Height = 13
    Caption = '&Data:'
    FocusControl = DataEdit
  end
  object List: TTntListView
    Left = 8
    Top = 24
    Width = 441
    Height = 257
    Columns = <
      item
        Caption = 'ID'
      end
      item
        Caption = 'Description'
        Width = 355
      end>
    ColumnClick = False
    HideSelection = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
  end
  object DataEdit: TTntEdit
    Left = 8
    Top = 304
    Width = 441
    Height = 21
    TabOrder = 1
  end
  object bOk: TTntButton
    Left = 264
    Top = 336
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object bCancel: TTntButton
    Left = 360
    Top = 336
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object DKLanguageController1: TDKLanguageController
    Left = 376
    Top = 80
    LangData = {
      0A00666D4D6163726F436D64010100000001000000070043617074696F6E0106
      00000006004C6162656C31010100000002000000070043617074696F6E000600
      4C6162656C32010100000003000000070043617074696F6E0004004C69737401
      02000000040000001200436F6C756D6E735B305D2E43617074696F6E05000000
      1200436F6C756D6E735B315D2E43617074696F6E000800446174614564697400
      000300624F6B010100000006000000070043617074696F6E0007006243616E63
      656C010100000007000000070043617074696F6E00}
  end
end
