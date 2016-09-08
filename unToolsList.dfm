object fmTools: TfmTools
  Left = 144
  Top = 205
  ActiveControl = List
  BorderStyle = bsDialog
  Caption = 'External tools'
  ClientHeight = 342
  ClientWidth = 702
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCloseQuery = TntFormCloseQuery
  OnCreate = TntFormCreate
  OnShow = TntFormShow
  PixelsPerInch = 96
  TextHeight = 13
  object boxProp: TTntGroupBox
    Left = 272
    Top = 4
    Width = 423
    Height = 301
    Caption = 'Tool properties'
    TabOrder = 1
    object TntLabel1: TTntLabel
      Left = 8
      Top = 44
      Width = 49
      Height = 13
      Caption = '&File name:'
      FocusControl = edCmd
    end
    object TntLabel2: TTntLabel
      Left = 8
      Top = 68
      Width = 59
      Height = 13
      Caption = '&Parameters:'
      FocusControl = edPar
    end
    object TntLabel3: TTntLabel
      Left = 8
      Top = 92
      Width = 61
      Height = 13
      Caption = '&Initial folder:'
      FocusControl = edDir
    end
    object TntLabel4: TTntLabel
      Left = 8
      Top = 20
      Width = 31
      Height = 13
      Caption = '&Name:'
      FocusControl = edName
    end
    object labKey: TTntLabel
      Left = 8
      Top = 164
      Width = 38
      Height = 13
      Caption = '&Hotkey:'
      FocusControl = edKey
    end
    object TntLabel6: TTntLabel
      Left = 8
      Top = 116
      Width = 31
      Height = 13
      Caption = '&Lexer:'
      FocusControl = edLexer
    end
    object TntLabel7: TTntLabel
      Left = 8
      Top = 140
      Width = 63
      Height = 13
      Caption = 'Save &before:'
      FocusControl = edLexer
    end
    object TntLabel8: TTntLabel
      Left = 8
      Top = 228
      Width = 63
      Height = 13
      Caption = 'Output type:'
      FocusControl = edOutType
    end
    object TntLabel9: TTntLabel
      Left = 8
      Top = 252
      Width = 47
      Height = 13
      Caption = 'Encoding:'
      FocusControl = edOutType
    end
    object edCmd: TTntEdit
      Left = 96
      Top = 40
      Width = 240
      Height = 21
      TabOrder = 1
      OnChange = edCmdChange
    end
    object bBr: TTntButton
      Left = 342
      Top = 40
      Width = 75
      Height = 21
      Caption = '&Browse...'
      TabOrder = 2
      OnClick = bBrClick
    end
    object edDir: TTntEdit
      Left = 96
      Top = 88
      Width = 240
      Height = 21
      TabOrder = 5
      OnChange = edDirChange
    end
    object edPar: TTntEdit
      Left = 96
      Top = 64
      Width = 240
      Height = 21
      TabOrder = 3
      OnChange = edParChange
    end
    object bBr2: TTntButton
      Left = 342
      Top = 88
      Width = 75
      Height = 21
      Caption = 'B&rowse...'
      TabOrder = 6
      OnClick = bBr2Click
    end
    object bPar: TTntButton
      Left = 342
      Top = 64
      Width = 75
      Height = 21
      Caption = '&Add...'
      TabOrder = 4
      OnClick = bParClick
    end
    object cbOut: TTntCheckBox
      Left = 8
      Top = 206
      Width = 281
      Height = 17
      Caption = '&Capture output'
      TabOrder = 13
      OnClick = cbOutClick
    end
    object bOut: TTntButton
      Left = 96
      Top = 272
      Width = 137
      Height = 21
      Caption = '&Output pattern...'
      TabOrder = 16
      OnClick = bOutClick
    end
    object edName: TTntEdit
      Left = 96
      Top = 16
      Width = 240
      Height = 21
      TabOrder = 0
      OnChange = edNameChange
    end
    object edKey: TecHotKey
      Left = 96
      Top = 160
      Width = 240
      Height = 21
      TabStop = False
      HotKey = 0
      TabOrder = 10
      OnChange = edKeyChange
    end
    object edLexer: TTntComboBox
      Left = 96
      Top = 112
      Width = 240
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 7
      OnChange = edLexerChange
    end
    object bLex: TTntButton
      Left = 342
      Top = 112
      Width = 75
      Height = 21
      Caption = 'C&urrent'
      TabOrder = 8
      OnClick = bLexClick
    end
    object bKey: TTntButton
      Left = 342
      Top = 160
      Width = 75
      Height = 21
      Caption = 'None'
      TabOrder = 11
      OnClick = bKeyClick
    end
    object edSave: TTntComboBox
      Left = 96
      Top = 136
      Width = 240
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 9
      OnChange = edSaveChange
      Items.Strings = (
        'Nothing'
        'Current document'
        'All documents')
    end
    object cbCtx: TTntCheckBox
      Left = 8
      Top = 186
      Width = 281
      Height = 17
      Caption = '&Show in context menu'
      TabOrder = 12
      OnClick = cbCtxClick
    end
    object edOutType: TTntComboBox
      Left = 96
      Top = 224
      Width = 240
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 14
      OnChange = edOutTypeChange
    end
    object edOutEnc: TTntComboBox
      Left = 96
      Top = 248
      Width = 240
      Height = 21
      Style = csDropDownList
      DropDownCount = 20
      ItemHeight = 13
      TabOrder = 15
      OnChange = edOutEncChange
      Items.Strings = (
        'ANSI (Windows)'
        'OEM (DOS)'
        'UTF-8')
    end
  end
  object bOk: TTntButton
    Left = 408
    Top = 312
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 2
  end
  object bCancel: TTntButton
    Left = 600
    Top = 312
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object boxList: TTntGroupBox
    Left = 8
    Top = 4
    Width = 257
    Height = 301
    Caption = 'Tools'
    TabOrder = 0
    object bUp: TTntButton
      Left = 170
      Top = 16
      Width = 75
      Height = 21
      Caption = '&Up'
      TabOrder = 1
      OnClick = bUpClick
    end
    object bDn: TTntButton
      Left = 170
      Top = 40
      Width = 75
      Height = 21
      Caption = '&Down'
      TabOrder = 2
      OnClick = bDnClick
    end
    object bClr: TTntButton
      Left = 170
      Top = 64
      Width = 75
      Height = 21
      Caption = 'Cl&ear'
      TabOrder = 3
      OnClick = bClrClick
    end
    object List: TTntListBox
      Left = 8
      Top = 16
      Width = 153
      Height = 273
      ItemHeight = 13
      TabOrder = 0
      OnClick = ListClick
    end
  end
  object bHelp: TTntButton
    Left = 504
    Top = 312
    Width = 90
    Height = 23
    Caption = 'Help'
    TabOrder = 3
    OnClick = bHelpClick
  end
  object OpenDlg: TTntOpenDialog
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 200
    Top = 116
  end
  object DKLanguageController1: TDKLanguageController
    Left = 224
    Top = 116
    LangData = {
      0700666D546F6F6C73010100000001000000070043617074696F6E0146000000
      0700626F7850726F7001010000000B000000070043617074696F6E000900546E
      744C6162656C31010100000002000000070043617074696F6E000900546E744C
      6162656C32010100000003000000070043617074696F6E000900546E744C6162
      656C33010100000004000000070043617074696F6E0005006564436D64000003
      00624272010100000006000000070043617074696F6E00050065644469720000
      0500656450617200000300624F6B010100000008000000070043617074696F6E
      0007006243616E63656C010100000009000000070043617074696F6E0007004F
      70656E446C6700000700626F784C69737401010000000C000000070043617074
      696F6E00040062427232010100000010000000070043617074696F6E00030062
      5570010100000011000000070043617074696F6E00030062446E010100000012
      000000070043617074696F6E0004006250617201010000001900000007004361
      7074696F6E0006006D6E755061720000080070437572576F7264000008007046
      696C65446972000009007046696C654E616D6500000B00704375724C696E654E
      756D0000050063624F7574010100000013000000070043617074696F6E000400
      624F7574010100000014000000070043617074696F6E000900546E744C616265
      6C34010100000015000000070043617074696F6E00060065644E616D65000004
      0062436C72010100000016000000070043617074696F6E0006006C61624B6579
      010100000017000000070043617074696F6E00050065644B657900000900546E
      744C6162656C36010100000018000000070043617074696F6E00070065644C65
      78657200000400624C657801010000001A000000070043617074696F6E000400
      624B657901010000001B000000070043617074696F6E000900546E744C616265
      6C3701010000001C000000070043617074696F6E000600656453617665010100
      00001D00000005004974656D73000800704375724C696E6500000A0070437572
      436F6C4E756D000002004E31000002004E3200000D007046696C654E616D654F
      6E6C7900000500636243747801010000001E000000070043617074696F6E0005
      006248656C7001010000001F000000070043617074696F6E0002004E3300000A
      0070496E74657246696C650000060070496E7465720000090070496E74657244
      69720000090065644F75745479706500000900546E744C6162656C3801010000
      0020000000070043617074696F6E000900546E744C6162656C39010100000021
      000000070043617074696F6E0008007046696C6545787400000E007046696C65
      4E616D654E6F457874000008007053656C546578740000080065644F7574456E
      6301010000002200000005004974656D730006007050726F6A33000006007050
      726F6A32000006007050726F6A31000002004E34000006007053656C464E0000
      0A007053656C464E416E736900000B007046696C654E616D654E3200000B0070
      46696C654E616D654E3100000A007046696C654E616D6532000002004E350000
      0A007053796E496E69446972000007007053796E446972000002004E3600000B
      0070436F6E74464E416E73690000070070436F6E74464E000006007050726F6A
      34000009007053796E4472697665000004004C6973740000}
  end
  object mnuPar: TPopupMenu
    Left = 248
    Top = 116
    object pFileName: TMenuItem
    end
    object pFileDir: TMenuItem
    end
    object pFileNameOnly: TMenuItem
    end
    object pFileNameNoExt: TMenuItem
    end
    object pFileExt: TMenuItem
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object pFileName2: TMenuItem
    end
    object pFileNameN1: TMenuItem
    end
    object pFileNameN2: TMenuItem
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object pProj1: TMenuItem
    end
    object pProj2: TMenuItem
    end
    object pProj3: TMenuItem
    end
    object pProj4: TMenuItem
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object pCurWord: TMenuItem
    end
    object pCurLineNum: TMenuItem
    end
    object pCurColNum: TMenuItem
    end
    object pCurLine: TMenuItem
    end
    object N2: TMenuItem
      Break = mbBarBreak
      Caption = '-'
    end
    object pSelText: TMenuItem
    end
    object pSelFN: TMenuItem
    end
    object pSelFNAnsi: TMenuItem
    end
    object pContFN: TMenuItem
    end
    object pContFNAnsi: TMenuItem
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object pInter: TMenuItem
    end
    object pInterFile: TMenuItem
    end
    object pInterDir: TMenuItem
    end
    object N6: TMenuItem
      Caption = '-'
    end
    object pSynDir: TMenuItem
    end
    object pSynIniDir: TMenuItem
    end
    object pSynDrive: TMenuItem
    end
  end
end
