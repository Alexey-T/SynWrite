object fmProjList: TfmProjList
  Left = 247
  Top = 474
  Width = 510
  Height = 322
  ActiveControl = Edit
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Project list'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = TntFormCreate
  OnKeyDown = FormKeyDown
  OnResize = TntFormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object List: TTntListBox
    Left = 0
    Top = 24
    Width = 502
    Height = 248
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 33
    TabOrder = 1
    OnDblClick = ListDblClick
    OnDrawItem = ListDrawItem
  end
  object Edit: TTntEdit
    Left = 0
    Top = 0
    Width = 502
    Height = 24
    Align = alTop
    TabOrder = 0
    OnChange = EditChange
    OnKeyDown = EditKeyDown
  end
  object Panel1: TPanel
    Left = 0
    Top = 272
    Width = 502
    Height = 16
    Align = alBottom
    BevelOuter = bvNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    object labHelp: TLabel
      Left = 488
      Top = 0
      Width = 14
      Height = 16
      Cursor = crHandPoint
      Align = alRight
      Caption = #187'? '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      OnClick = labHelpClick
    end
    object cbFuzzy: TTntCheckBox
      Left = 0
      Top = 0
      Width = 217
      Height = 16
      Align = alLeft
      Caption = 'Fuzzy search'
      TabOrder = 0
      OnClick = cbFuzzyClick
    end
  end
  object TimerType: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTypeTimer
    Left = 384
    Top = 4
  end
end
