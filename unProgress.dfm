object fmProgress: TfmProgress
  Left = 283
  Top = 475
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Search progress'
  ClientHeight = 40
  ClientWidth = 516
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnPaint = TntFormPaint
  PixelsPerInch = 96
  TextHeight = 13
  object laFile: TTntLabel
    Left = 136
    Top = 0
    Width = 98
    Height = 13
    Caption = 'Searching for files...'
    Visible = False
  end
  object laBin: TTntLabel
    Left = 8
    Top = 24
    Width = 112
    Height = 13
    Caption = 'Excluding binary files...'
    Visible = False
  end
  object Pro: TGauge
    Left = 224
    Top = 12
    Width = 169
    Height = 18
    ForeColor = clNavy
    Progress = 20
    ShowText = False
  end
  object LaBk: TTntLabel
    Left = 8
    Top = 12
    Width = 182
    Height = 13
    Caption = 'Performing operation on bookmarks...'
    Visible = False
  end
  object laText: TTntLabel
    Left = 8
    Top = 0
    Width = 99
    Height = 13
    Caption = 'Searching for text...'
    Visible = False
  end
  object labCount: TTntLabel
    Left = 312
    Top = 16
    Width = 16
    Height = 13
    Caption = '----'
    Visible = False
  end
  object laSort: TTntLabel
    Left = 136
    Top = 24
    Width = 82
    Height = 13
    Caption = 'Sorting folders...'
    Visible = False
  end
  object bCan: TTntButton
    Left = 400
    Top = 8
    Width = 97
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = bCanClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 376
    LangData = {
      0A00666D50726F6772657373010100000001000000070043617074696F6E0108
      00000006006C6146696C65010100000002000000070043617074696F6E000400
      6243616E010100000003000000070043617074696F6E0005006C6142696E0101
      00000006000000070043617074696F6E00030050726F000004004C61426B0101
      00000007000000070043617074696F6E0006006C615465787401010000000800
      0000070043617074696F6E0008006C6162436F756E74000006006C61536F7274
      010100000009000000070043617074696F6E00}
  end
end
