object fmRename: TfmRename
  Left = 313
  Top = 545
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'SynWrite'
  ClientHeight = 87
  ClientWidth = 371
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = TntFormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object labRename: TTntLabel
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Rename to:'
    FocusControl = edName
  end
  object Label1: TTntLabel
    Left = 282
    Top = 24
    Width = 4
    Height = 16
    Caption = '.'
    FocusControl = edName
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnOK: TTntButton
    Left = 101
    Top = 56
    Width = 81
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object btnCancel: TTntButton
    Left = 189
    Top = 56
    Width = 81
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object edName: TTntEdit
    Left = 8
    Top = 24
    Width = 273
    Height = 21
    TabOrder = 0
    OnChange = edNameChange
  end
  object edExt: TTntEdit
    Left = 288
    Top = 24
    Width = 73
    Height = 21
    TabOrder = 1
    OnChange = edNameChange
  end
end
