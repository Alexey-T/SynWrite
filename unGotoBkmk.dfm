object fmGotoBkmk: TfmGotoBkmk
  Left = 315
  Top = 446
  ActiveControl = List
  AutoScroll = False
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Go to bookmark'
  ClientHeight = 305
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  DesignSize = (
    483
    305)
  PixelsPerInch = 96
  TextHeight = 13
  object TntLabel1: TTntLabel
    Left = 8
    Top = 8
    Width = 71
    Height = 13
    Caption = 'Bookmarks list:'
  end
  object List: TTntListBox
    Left = 8
    Top = 24
    Width = 465
    Height = 245
    Anchors = [akLeft, akTop, akRight, akBottom]
    ItemHeight = 13
    TabOrder = 0
    OnDblClick = ListDblClick
  end
  object bOk: TTntButton
    Left = 288
    Top = 275
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCan: TTntButton
    Left = 384
    Top = 275
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DKLanguageController1: TDKLanguageController
    Left = 424
    Top = 144
    LangData = {
      0A00666D476F746F426B6D6B010100000001000000070043617074696F6E0104
      0000000900546E744C6162656C31010100000002000000070043617074696F6E
      0004004C69737400000300624F6B010100000003000000070043617074696F6E
      0004006243616E010100000004000000070043617074696F6E00}
  end
end
