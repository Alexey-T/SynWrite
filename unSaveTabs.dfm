object fmSaveTabs: TfmSaveTabs
  Left = 331
  Top = 477
  BorderStyle = bsDialog
  Caption = 'Save these tabs?'
  ClientHeight = 265
  ClientWidth = 560
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object bYes: TTntButton
    Left = 424
    Top = 64
    Width = 129
    Height = 23
    Caption = 'Save checked'
    Default = True
    ModalResult = 6
    TabOrder = 1
  end
  object bNo: TTntButton
    Left = 424
    Top = 94
    Width = 129
    Height = 23
    Caption = 'Don'#39't save'
    ModalResult = 7
    TabOrder = 2
  end
  object List: TTntCheckListBox
    Left = 8
    Top = 8
    Width = 409
    Height = 249
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
  end
  object bCancel: TTntButton
    Left = 423
    Top = 174
    Width = 129
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
