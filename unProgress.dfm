object fmProgress: TfmProgress
  Left = 283
  Top = 475
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Search progress'
  ClientHeight = 105
  ClientWidth = 316
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object laFile: TTntLabel
    Left = 64
    Top = 24
    Width = 98
    Height = 13
    Caption = 'Searching for files...'
    Visible = False
  end
  object laBin: TTntLabel
    Left = 104
    Top = 24
    Width = 112
    Height = 13
    Caption = 'Excluding binary files...'
    Visible = False
  end
  object Pro: TGauge
    Left = 64
    Top = 40
    Width = 193
    Height = 18
    ForeColor = clNavy
    Progress = 20
    ShowText = False
  end
  object LaBk: TTntLabel
    Left = 88
    Top = 24
    Width = 182
    Height = 13
    Caption = 'Performing operation on bookmarks...'
    Visible = False
  end
  object laText: TTntLabel
    Left = 8
    Top = 24
    Width = 99
    Height = 13
    Caption = 'Searching for text...'
    Visible = False
  end
  object labCount: TTntLabel
    Left = 144
    Top = 44
    Width = 16
    Height = 13
    Caption = '----'
    Visible = False
  end
  object laSort: TTntLabel
    Left = 224
    Top = 24
    Width = 82
    Height = 13
    Caption = 'Sorting folders...'
    Visible = False
  end
  object bCan: TTntButton
    Left = 112
    Top = 64
    Width = 97
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    TabOrder = 0
    OnClick = bCanClick
  end
  object DKLanguageController1: TDKLanguageController
    Left = 216
    Top = 8
    LangData = {
      0A00666D50726F6772657373010100000001000000070043617074696F6E0109
      00000006006C6146696C65010100000002000000070043617074696F6E000400
      6243616E010100000003000000070043617074696F6E0005006C6142696E0101
      00000006000000070043617074696F6E00030050726F000004004C61426B0101
      00000007000000070043617074696F6E000A0054696D65724F6E546F70000006
      006C6154657874010100000008000000070043617074696F6E0008006C616243
      6F756E74000006006C61536F7274010100000009000000070043617074696F6E
      00}
  end
  object TimerOnTop: TTimer
    Interval = 200
    OnTimer = TimerOnTopTimer
    Left = 224
    Top = 52
  end
end
