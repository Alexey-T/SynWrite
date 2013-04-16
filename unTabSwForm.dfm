object fmTabSw: TfmTabSw
  Left = 184
  Top = 375
  BorderStyle = bsNone
  ClientHeight = 164
  ClientWidth = 520
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
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
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 520
    Height = 164
    Align = alClient
    BevelInner = bvRaised
    Caption = 'Panel1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    DesignSize = (
      520
      164)
    object List: TTntListBox
      Left = 136
      Top = 4
      Width = 249
      Height = 117
      Anchors = [akLeft, akTop, akRight, akBottom]
      ItemHeight = 14
      TabOrder = 0
      OnClick = ListClick
    end
    object Panel2: TPanel
      Left = 2
      Top = 124
      Width = 516
      Height = 38
      Align = alBottom
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 1
      object Label1: TTntLabel
        Left = 6
        Top = 4
        Width = 35
        Height = 14
        Caption = 'Label1'
      end
      object Label2: TTntLabel
        Left = 6
        Top = 20
        Width = 35
        Height = 14
        Caption = 'Label2'
      end
    end
  end
end
