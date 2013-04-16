object fmProjAddDir: TfmProjAddDir
  Left = 228
  Top = 443
  ActiveControl = edInc
  BorderStyle = bsDialog
  Caption = 'Add folder contents to project'
  ClientHeight = 235
  ClientWidth = 385
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object btnOk: TTntButton
    Left = 192
    Top = 204
    Width = 91
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object btnCan: TTntButton
    Left = 288
    Top = 204
    Width = 91
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object GroupBox1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 369
    Height = 193
    TabOrder = 0
    object Label1: TTntLabel
      Left = 8
      Top = 88
      Width = 289
      Height = 13
      Caption = 'Include file extensions, comma-separated (all files if empty):'
    end
    object Label2: TTntLabel
      Left = 8
      Top = 128
      Width = 283
      Height = 13
      Caption = 'Exclude file extensions, comma-separated (none if empty):'
    end
    object Label3: TTntLabel
      Left = 8
      Top = 12
      Width = 59
      Height = 13
      Caption = 'Folder path:'
    end
    object edInc: TTntEdit
      Left = 8
      Top = 104
      Width = 353
      Height = 21
      TabOrder = 2
    end
    object edExc: TTntEdit
      Left = 8
      Top = 144
      Width = 353
      Height = 21
      TabOrder = 3
    end
    object cbNoBin: TTntCheckBox
      Left = 8
      Top = 168
      Width = 337
      Height = 17
      Caption = 'Exclude binary files'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object edDir: TTntEdit
      Left = 8
      Top = 28
      Width = 353
      Height = 21
      ParentColor = True
      ReadOnly = True
      TabOrder = 0
    end
    object cbSubdir: TTntCheckBox
      Left = 8
      Top = 52
      Width = 337
      Height = 17
      Caption = 'Include subfolders'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 320
    Top = 164
    LangData = {
      0C00666D50726F6A416464446972010100000001000000070043617074696F6E
      010B000000050062746E4F6B010100000002000000070043617074696F6E0006
      0062746E43616E010100000003000000070043617074696F6E00090047726F75
      70426F7831000006004C6162656C31010100000004000000070043617074696F
      6E0006004C6162656C32010100000005000000070043617074696F6E0006004C
      6162656C33010100000006000000070043617074696F6E0005006564496E6300
      00050065644578630000070063624E6F42696E01010000000700000007004361
      7074696F6E000500656444697200000800636253756264697201010000000800
      0000070043617074696F6E00}
  end
end
