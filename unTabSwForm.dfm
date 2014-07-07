object fmTabSw: TfmTabSw
  Left = 184
  Top = 375
  BorderStyle = bsNone
  ClientHeight = 164
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 164
    Align = alClient
    Caption = 'Panel1'
    TabOrder = 0
    DesignSize = (
      520
      164)
    object List: TTntListBox
      Left = 136
      Top = 4
      Width = 249
      Height = 113
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelKind = bkFlat
      BorderStyle = bsNone
      ItemHeight = 16
      TabOrder = 0
      OnClick = ListClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 121
      Width = 518
      Height = 42
      Align = alBottom
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TTntLabel
        Left = 6
        Top = 4
        Width = 37
        Height = 16
        Caption = 'Label1'
      end
      object Label2: TTntLabel
        Left = 6
        Top = 20
        Width = 37
        Height = 16
        Caption = 'Label2'
      end
    end
  end
end
