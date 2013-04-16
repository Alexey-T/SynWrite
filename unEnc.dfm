object fmEnc: TfmEnc
  Left = 187
  Top = 456
  ActiveControl = Button2
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Encoding change'
  ClientHeight = 102
  ClientWidth = 289
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TTntButton
    Left = 16
    Top = 44
    Width = 257
    Height = 23
    Cancel = True
    Caption = 'Reopen file in new encoding'
    ModalResult = 6
    TabOrder = 0
  end
  object Button2: TTntButton
    Left = 16
    Top = 72
    Width = 257
    Height = 23
    Caption = 'Change encoding for the modified file'
    Default = True
    ModalResult = 7
    TabOrder = 1
  end
  object StaticText1: TTntStaticText
    Left = 8
    Top = 8
    Width = 273
    Height = 33
    AutoSize = False
    Caption = 
      'The encoding is changed, and file is currently modified.   What ' +
      'would you like to do?'
    TabOrder = 2
  end
  object DKLanguageController1: TDKLanguageController
    Left = 240
    Top = 28
    LangData = {
      0500666D456E63010100000001000000070043617074696F6E01030000000700
      427574746F6E31010100000002000000070043617074696F6E00070042757474
      6F6E32010100000003000000070043617074696F6E000B005374617469635465
      787431010100000004000000070043617074696F6E00}
  end
end
