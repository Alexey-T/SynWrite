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
      Width = 41
      Height = 13
      Caption = 'Caption:'
    end
    object labId: TTntLabel
      Left = 8
      Top = 52
      Width = 188
      Height = 13
      Caption = 'Alias for Tab key (optional, no spaces):'
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
      Width = 178
      Height = 13
      Caption = 'Lexers (optional, comma-separated):'
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
      OnKeyDown = memoTextKeyDown
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
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCan: TTntButton
    Left = 532
    Top = 484
    Width = 99
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object DKLanguageController1: TDKLanguageController
    Left = 384
    Top = 480
    LangData = {
      0F00666D536E6970706574456469746F72010100000001000000070043617074
      696F6E010B0000000400626F7831000007006C61624E616D6501010000000200
      0000070043617074696F6E0005006C6162496401010000000300000007004361
      7074696F6E0007006C616254657874010100000004000000070043617074696F
      6E0006006C61624C6578010100000005000000070043617074696F6E00060065
      644E616D650000040065644964000008006D656D6F546578740000050065644C
      657800000300624F6B010100000006000000070043617074696F6E0004006243
      616E010100000007000000070043617074696F6E00}
  end
end
