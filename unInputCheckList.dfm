object fmInputCheckList: TfmInputCheckList
  Left = 326
  Top = 298
  Width = 555
  Height = 392
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
  object Panel1: TPanel
    Left = 0
    Top = 316
    Width = 539
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    DesignSize = (
      539
      38)
    object bOk: TTntButton
      Left = 327
      Top = 7
      Width = 99
      Height = 23
      Anchors = [akRight, akBottom]
      Caption = 'OK'
      Default = True
      ModalResult = 1
      TabOrder = 0
    end
    object bCancel: TTntButton
      Left = 431
      Top = 7
      Width = 99
      Height = 23
      Anchors = [akRight, akBottom]
      Cancel = True
      Caption = 'Cancel'
      ModalResult = 2
      TabOrder = 1
    end
  end
  object List: TTntListView
    Left = 0
    Top = 0
    Width = 539
    Height = 316
    Align = alClient
    Checkboxes = True
    Columns = <
      item
      end
      item
      end>
    ColumnClick = False
    TabOrder = 0
    ViewStyle = vsReport
  end
end
