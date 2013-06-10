object fmHideItems: TfmHideItems
  Left = 327
  Top = 412
  ActiveControl = List
  BorderStyle = bsDialog
  Caption = 'Hide menu items'
  ClientHeight = 469
  ClientWidth = 473
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
  object labInf: TTntLabel
    Left = 8
    Top = 4
    Width = 457
    Height = 45
    AutoSize = False
    Caption = 
      'This dialog allows to hide all predefined menus and toolbars ite' +
      'ms, using SynHide.ini file (see help topic in Misc section). Che' +
      'ck items to hide. Program must be restarted to apply these setti' +
      'ngs.'
    WordWrap = True
  end
  object List: TTntCheckListBox
    Left = 8
    Top = 52
    Width = 457
    Height = 381
    ItemHeight = 13
    TabOrder = 0
  end
  object bOk: TTntButton
    Left = 264
    Top = 440
    Width = 97
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
    OnClick = bOkClick
  end
  object bCancel: TTntButton
    Left = 368
    Top = 440
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
  object bUncheck: TTntButton
    Left = 8
    Top = 440
    Width = 153
    Height = 23
    Caption = 'Uncheck all'
    TabOrder = 1
    OnClick = bUncheckClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 400
    Top = 44
    LangData = {
      0B00666D486964654974656D73010100000001000000070043617074696F6E01
      0500000006006C6162496E66010100000002000000070043617074696F6E0004
      004C69737400000300624F6B010100000003000000070043617074696F6E0007
      006243616E63656C010100000004000000070043617074696F6E00080062556E
      636865636B010100000005000000070043617074696F6E00}
  end
end
