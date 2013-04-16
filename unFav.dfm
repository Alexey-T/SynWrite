object fmFav: TfmFav
  Left = 248
  Top = 490
  Width = 570
  Height = 380
  ActiveControl = List
  BorderIcons = [biSystemMenu]
  Caption = 'Favorites'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = TntFormCreate
  OnDestroy = TntFormDestroy
  OnKeyDown = TntFormKeyDown
  OnShow = TntFormShow
  DesignSize = (
    562
    346)
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TTntButton
    Left = 456
    Top = 8
    Width = 97
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'Open'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = btnOkClick
  end
  object btnCan: TTntButton
    Left = 456
    Top = 148
    Width = 97
    Height = 23
    Anchors = [akTop, akRight]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 6
  end
  object cbPaths: TTntCheckBox
    Left = 8
    Top = 324
    Width = 249
    Height = 17
    Anchors = [akLeft, akBottom]
    Caption = 'Show paths'
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = cbPathsClick
  end
  object List: TTntListBox
    Left = 8
    Top = 8
    Width = 441
    Height = 313
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListClick
    OnDblClick = ListDblClick
  end
  object btnUp: TTntButton
    Left = 456
    Top = 80
    Width = 97
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'Move up'
    TabOrder = 4
    OnClick = btnUpClick
  end
  object btnDown: TTntButton
    Left = 456
    Top = 108
    Width = 97
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'Move down'
    TabOrder = 5
    OnClick = btnDownClick
  end
  object btnDel: TTntButton
    Left = 456
    Top = 36
    Width = 97
    Height = 23
    Anchors = [akTop, akRight]
    Caption = 'Delete'
    TabOrder = 3
    OnClick = btnDelClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 456
    Top = 184
    LangData = {
      0500666D466176010100000001000000070043617074696F6E01070000000500
      62746E4F6B010100000002000000070043617074696F6E00060062746E43616E
      010100000003000000070043617074696F6E0007006362506174687301010000
      0004000000070043617074696F6E0004004C6973740000050062746E55700101
      00000005000000070043617074696F6E00070062746E446F776E010100000006
      000000070043617074696F6E00060062746E44656C0101000000070000000700
      43617074696F6E00}
  end
end
