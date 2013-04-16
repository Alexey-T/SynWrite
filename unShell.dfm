object fmShell: TfmShell
  Left = 273
  Top = 347
  ActiveControl = cbShell
  BorderStyle = bsDialog
  Caption = 'Integration with Explorer'
  ClientHeight = 318
  ClientWidth = 377
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBoxEx: TTntGroupBox
    Left = 9
    Top = 5
    Width = 360
    Height = 276
    TabOrder = 0
    object TntLabel1: TTntLabel
      Left = 8
      Top = 96
      Width = 241
      Height = 13
      Caption = 'Associate SynWrite with additional file extensions:'
    end
    object cbShell: TTntCheckBox
      Left = 8
      Top = 14
      Width = 345
      Height = 19
      Caption = 'Add "SynWrite" item to Explorer context menu'
      TabOrder = 0
      WordWrap = True
      OnClick = cbShellClick
    end
    object cbTxt: TTntCheckBox
      Left = 8
      Top = 40
      Width = 345
      Height = 17
      Caption = 'Associate SynWrite with TXT files'
      TabOrder = 1
      OnClick = cbTxtClick
    end
    object cbIni: TTntCheckBox
      Left = 8
      Top = 56
      Width = 345
      Height = 17
      Caption = 'Associate SynWrite with INI files'
      TabOrder = 2
      OnClick = cbIniClick
    end
    object ed: TTntComboBox
      Left = 64
      Top = 116
      Width = 225
      Height = 21
      Style = csDropDownList
      DropDownCount = 16
      ItemHeight = 13
      TabOrder = 4
      OnChange = edChange
    end
    object List: TCheckListBox
      Left = 64
      Top = 140
      Width = 225
      Height = 101
      OnClickCheck = ListClickCheck
      ItemHeight = 13
      TabOrder = 5
    end
    object bUn: TTntButton
      Left = 64
      Top = 245
      Width = 225
      Height = 23
      Caption = 'Unselect all extensions'
      TabOrder = 6
      OnClick = bUnClick
    end
    object cbProj: TTntCheckBox
      Left = 8
      Top = 72
      Width = 345
      Height = 17
      Caption = 'Associate SynWrite with SynwProj files'
      TabOrder = 3
      OnClick = cbProjClick
    end
  end
  object bOk: TTntButton
    Left = 144
    Top = 287
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object DKLanguageController1: TDKLanguageController
    Left = 304
    Top = 8
    LangData = {
      0700666D5368656C6C010100000001000000070043617074696F6E010A000000
      0A0047726F7570426F7845780000070063625368656C6C010100000003000000
      070043617074696F6E000300624F6B010100000004000000070043617074696F
      6E0005006362547874010100000006000000070043617074696F6E0005006362
      496E69010100000007000000070043617074696F6E0002006564000004004C69
      737400000900546E744C6162656C31010100000008000000070043617074696F
      6E00030062556E010100000009000000070043617074696F6E00060063625072
      6F6A01010000000A000000070043617074696F6E00}
  end
end
