object fmInputEx: TfmInputEx
  Left = 306
  Top = 242
  BorderStyle = bsDialog
  ClientHeight = 460
  ClientWidth = 432
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
  object lab1: TTntLabel
    Left = 8
    Top = 4
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed1
  end
  object lab2: TTntLabel
    Left = 8
    Top = 44
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed2
  end
  object lab3: TTntLabel
    Left = 8
    Top = 84
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed3
  end
  object lab4: TTntLabel
    Left = 8
    Top = 124
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed4
  end
  object lab5: TTntLabel
    Left = 8
    Top = 164
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed5
  end
  object lab6: TTntLabel
    Left = 8
    Top = 204
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed6
  end
  object lab7: TTntLabel
    Left = 8
    Top = 244
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed7
  end
  object lab8: TTntLabel
    Left = 8
    Top = 284
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed8
  end
  object lab9: TTntLabel
    Left = 8
    Top = 324
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed9
  end
  object lab10: TTntLabel
    Left = 8
    Top = 364
    Width = 4
    Height = 13
    Caption = '-'
    FocusControl = ed10
  end
  object ed1: TTntEdit
    Left = 8
    Top = 20
    Width = 417
    Height = 21
    TabOrder = 0
  end
  object ed2: TTntEdit
    Left = 7
    Top = 60
    Width = 417
    Height = 21
    TabOrder = 1
  end
  object ed3: TTntEdit
    Left = 7
    Top = 100
    Width = 417
    Height = 21
    TabOrder = 2
  end
  object ed4: TTntEdit
    Left = 7
    Top = 140
    Width = 417
    Height = 21
    TabOrder = 3
  end
  object ed5: TTntEdit
    Left = 7
    Top = 180
    Width = 417
    Height = 21
    TabOrder = 4
  end
  object ed6: TTntEdit
    Left = 7
    Top = 220
    Width = 417
    Height = 21
    TabOrder = 5
  end
  object ed7: TTntEdit
    Left = 7
    Top = 260
    Width = 417
    Height = 21
    TabOrder = 6
  end
  object ed8: TTntEdit
    Left = 7
    Top = 300
    Width = 417
    Height = 21
    TabOrder = 7
  end
  object ed9: TTntEdit
    Left = 7
    Top = 340
    Width = 417
    Height = 21
    TabOrder = 8
  end
  object ed10: TTntEdit
    Left = 7
    Top = 380
    Width = 417
    Height = 21
    TabOrder = 9
  end
  object Panel1: TPanel
    Left = 0
    Top = 422
    Width = 432
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 10
    object btnOK: TTntButton
      Left = 133
      Top = 8
      Width = 81
      Height = 23
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object btnCancel: TTntButton
      Left = 221
      Top = 8
      Width = 81
      Height = 23
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
end
