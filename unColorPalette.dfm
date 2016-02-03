object fmPalette: TfmPalette
  Left = 479
  Top = 313
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Colors'
  ClientHeight = 127
  ClientWidth = 469
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 86
    Width = 469
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object btnCancel: TButton
      Left = 232
      Top = 8
      Width = 90
      Height = 23
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 0
    end
    object btnReset: TButton
      Left = 136
      Top = 8
      Width = 90
      Height = 23
      Caption = 'Reset'
      ModalResult = 7
      TabOrder = 1
    end
  end
  object DKLang1: TDKLanguageController
    Left = 296
    Top = 56
    LangData = {
      0900666D50616C65747465010100000001000000070043617074696F6E010300
      0000060050616E656C310000090062746E43616E63656C010100000002000000
      070043617074696F6E00080062746E5265736574010100000003000000070043
      617074696F6E00}
  end
end
