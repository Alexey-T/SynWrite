object fmSnippetEditor: TfmSnippetEditor
  Left = 233
  Top = 401
  ActiveControl = edName
  BorderStyle = bsDialog
  Caption = 'New snippet'
  ClientHeight = 516
  ClientWidth = 640
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
  object box1: TTntGroupBox
    Left = 8
    Top = 4
    Width = 625
    Height = 473
    TabOrder = 0
    object labName: TTntLabel
      Left = 8
      Top = 12
      Width = 71
      Height = 13
      Caption = 'Caption string:'
    end
    object labId: TTntLabel
      Left = 8
      Top = 52
      Width = 235
      Height = 13
      Caption = 'Keyword for Tab key (optional word, no spaces):'
    end
    object labText: TTntLabel
      Left = 8
      Top = 132
      Width = 26
      Height = 13
      Caption = 'Text:'
    end
    object labLex: TTntLabel
      Left = 8
      Top = 92
      Width = 194
      Height = 13
      Caption = 'Lexers list (optional, comma-separated):'
    end
    object edName: TTntEdit
      Left = 8
      Top = 28
      Width = 457
      Height = 21
      TabOrder = 0
    end
    object edId: TTntEdit
      Left = 8
      Top = 68
      Width = 457
      Height = 21
      TabOrder = 1
    end
    object memoText: TTntMemo
      Left = 8
      Top = 148
      Width = 609
      Height = 317
      ScrollBars = ssBoth
      TabOrder = 3
      WantTabs = True
    end
    object edLex: TTntEdit
      Left = 8
      Top = 108
      Width = 457
      Height = 21
      TabOrder = 2
    end
  end
  object bOk: TTntButton
    Left = 426
    Top = 484
    Width = 99
    Height = 25
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCan: TTntButton
    Left = 532
    Top = 484
    Width = 99
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
end
