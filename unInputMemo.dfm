object fmInputMemo: TfmInputMemo
  Left = 172
  Top = 455
  Width = 780
  Height = 400
  ActiveControl = Ed
  BorderIcons = [biSystemMenu, biMaximize]
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 326
    Width = 772
    Height = 40
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    object PanelBtn: TPanel
      Left = 88
      Top = 0
      Width = 177
      Height = 41
      BevelOuter = bvNone
      TabOrder = 0
      object btnCancel: TTntButton
        Left = 93
        Top = 10
        Width = 81
        Height = 23
        Cancel = True
        Caption = 'Cancel'
        ModalResult = 2
        TabOrder = 1
      end
      object btnOK: TTntButton
        Left = 5
        Top = 10
        Width = 81
        Height = 23
        Caption = 'OK'
        Default = True
        ModalResult = 1
        TabOrder = 0
      end
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 772
    Height = 21
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lab1: TTntLabel
      Left = 6
      Top = 4
      Width = 37
      Height = 13
      Caption = 'Caption'
    end
  end
  object Ed: TTntMemo
    Left = 0
    Top = 21
    Width = 772
    Height = 305
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Courier New'
    Font.Style = []
    ParentFont = False
    ScrollBars = ssBoth
    TabOrder = 2
    WordWrap = False
    OnKeyDown = EdKeyDown
  end
end
