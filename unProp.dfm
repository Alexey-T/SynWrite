object fmProps: TfmProps
  Left = 272
  Top = 555
  ActiveControl = Pages
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  Caption = 'File/document properties'
  ClientHeight = 243
  ClientWidth = 378
  Color = clBtnFace
  Constraints.MinHeight = 100
  Constraints.MinWidth = 300
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  DesignSize = (
    378
    243)
  PixelsPerInch = 96
  TextHeight = 13
  object bOk: TTntButton
    Left = 280
    Top = 212
    Width = 90
    Height = 23
    Anchors = [akRight, akBottom]
    Cancel = True
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object Pages: TTntPageControl
    Left = 8
    Top = 4
    Width = 362
    Height = 201
    ActivePage = tabFile
    Anchors = [akLeft, akTop, akRight, akBottom]
    TabOrder = 0
    object tabFile: TTntTabSheet
      Caption = 'File'
      DesignSize = (
        354
        173)
      object TntLabel1: TTntLabel
        Left = 8
        Top = 4
        Width = 45
        Height = 13
        Caption = 'Full path:'
      end
      object TntLabel2: TTntLabel
        Left = 8
        Top = 56
        Width = 84
        Height = 13
        Caption = 'Modification time:'
      end
      object TntLabel3: TTntLabel
        Left = 8
        Top = 80
        Width = 59
        Height = 13
        Caption = 'Size on disk:'
      end
      object edPath: TTntEdit
        Left = 8
        Top = 20
        Width = 339
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object edTime: TTntEdit
        Left = 128
        Top = 52
        Width = 219
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object edSize: TTntEdit
        Left = 128
        Top = 76
        Width = 219
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
    end
    object tabDoc: TTntTabSheet
      Caption = 'Text'
      DesignSize = (
        354
        173)
      object TntLabel4: TTntLabel
        Left = 8
        Top = 8
        Width = 57
        Height = 13
        Caption = 'Characters:'
      end
      object TntLabel5: TTntLabel
        Left = 8
        Top = 32
        Width = 35
        Height = 13
        Caption = 'Words:'
      end
      object TntLabel6: TTntLabel
        Left = 8
        Top = 56
        Width = 28
        Height = 13
        Caption = 'Lines:'
      end
      object edChars: TTntEdit
        Left = 152
        Top = 4
        Width = 188
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 0
      end
      object edWords: TTntEdit
        Left = 152
        Top = 28
        Width = 188
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 1
      end
      object edLines: TTntEdit
        Left = 152
        Top = 52
        Width = 188
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        ParentColor = True
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object DKLanguageController1: TDKLanguageController
    Left = 344
    Top = 84
    LangData = {
      0700666D50726F7073010100000001000000070043617074696F6E0110000000
      0300624F6B010100000005000000070043617074696F6E000500506167657300
      00070074616246696C65010100000006000000070043617074696F6E00090054
      6E744C6162656C31010100000007000000070043617074696F6E000600656450
      61746800000900546E744C6162656C3201010000000800000007004361707469
      6F6E000600656454696D6500000900546E744C6162656C330101000000090000
      00070043617074696F6E000600656453697A6500000600746162446F63010100
      00000A000000070043617074696F6E000900546E744C6162656C340101000000
      0B000000070043617074696F6E0007006564436861727300000900546E744C61
      62656C3501010000000C000000070043617074696F6E0007006564576F726473
      00000900546E744C6162656C3601010000000D000000070043617074696F6E00
      070065644C696E65730000}
  end
end
