object fmToolbarSize: TfmToolbarSize
  Left = 355
  Top = 539
  BorderStyle = bsDialog
  Caption = 'Icons size'
  ClientHeight = 137
  ClientWidth = 234
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
  object GroupBoxIco: TGroupBox
    Left = 8
    Top = 4
    Width = 217
    Height = 97
    TabOrder = 0
    object Label1: TTntLabel
      Left = 102
      Top = 72
      Width = 6
      Height = 13
      Caption = 'x'
    end
    object btn16: TTntRadioButton
      Left = 8
      Top = 16
      Width = 73
      Height = 17
      Caption = '16x16'
      TabOrder = 0
    end
    object btn32: TTntRadioButton
      Left = 8
      Top = 32
      Width = 73
      Height = 17
      Caption = '32x32'
      TabOrder = 1
    end
    object btnSize: TTntRadioButton
      Left = 8
      Top = 48
      Width = 113
      Height = 17
      Caption = 'Custom:'
      TabOrder = 2
    end
    object edSizeX: TSpinEdit
      Left = 48
      Top = 68
      Width = 49
      Height = 22
      MaxValue = 48
      MinValue = 16
      TabOrder = 3
      Value = 22
    end
    object edSizeY: TSpinEdit
      Left = 112
      Top = 68
      Width = 49
      Height = 22
      MaxValue = 48
      MinValue = 16
      TabOrder = 4
      Value = 22
    end
  end
  object bOk: TTntButton
    Left = 24
    Top = 107
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object bCan: TTntButton
    Left = 120
    Top = 107
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
