object fmMenuSnippets: TfmMenuSnippets
  Left = 247
  Top = 474
  Width = 510
  Height = 322
  ActiveControl = Edit
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Snippets'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = TntFormClose
  OnCreate = TntFormCreate
  OnKeyDown = FormKeyDown
  OnResize = TntFormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Splitter1: TSplitter
    Left = 0
    Top = 202
    Width = 494
    Height = 5
    Cursor = crVSplit
    Align = alBottom
    AutoSnap = False
    MinSize = 1
    ResizeStyle = rsUpdate
  end
  object List: TTntListBox
    Left = 0
    Top = 24
    Width = 494
    Height = 178
    Style = lbOwnerDrawFixed
    Align = alClient
    ItemHeight = 16
    TabOrder = 1
    OnClick = ListClick
    OnDblClick = ListDblClick
    OnDrawItem = ListDrawItem
    OnKeyDown = ListKeyDown
  end
  object Edit: TTntEdit
    Left = 0
    Top = 0
    Width = 494
    Height = 24
    Align = alTop
    TabOrder = 0
    OnChange = EditChange
    OnKeyDown = EditKeyDown
  end
  object PanelLow: TPanel
    Left = 0
    Top = 207
    Width = 494
    Height = 77
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object MemoText: TTntMemo
      Left = 0
      Top = 0
      Width = 494
      Height = 61
      Align = alClient
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 0
      Top = 61
      Width = 494
      Height = 16
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object btnEdit: TTntSpeedButton
        Left = 160
        Top = 0
        Width = 113
        Height = 17
        Caption = 'Edit [F5]'
        Flat = True
        OnClick = btnEditClick
      end
      object cbFuzzy: TTntCheckBox
        Left = 0
        Top = 0
        Width = 153
        Height = 16
        Align = alLeft
        Caption = 'Fuzzy search'
        TabOrder = 0
        OnClick = cbFuzzyClick
      end
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
