object fmToolbarIcon: TfmToolbarIcon
  Left = 227
  Top = 573
  BorderStyle = bsDialog
  Caption = 'Icon'
  ClientHeight = 239
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = TntFormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    Left = 8
    Top = 4
    Width = 385
    Height = 197
    TabOrder = 0
    object Image1: TImage
      Left = 64
      Top = 112
      Width = 65
      Height = 65
      Center = True
    end
    object LabelErr: TTntLabel
      Left = 8
      Top = 176
      Width = 10
      Height = 13
      Caption = '--'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object btnDLL: TTntRadioButton
      Left = 8
      Top = 16
      Width = 300
      Height = 17
      Caption = 'Read EXE/DLL/ICL/ICO file'
      Checked = True
      TabOrder = 0
      TabStop = True
    end
    object btnPNG: TTntRadioButton
      Left = 8
      Top = 32
      Width = 300
      Height = 17
      Caption = 'Read PNG file'
      TabOrder = 1
    end
    object btnBrowse: TTntButton
      Left = 8
      Top = 72
      Width = 97
      Height = 23
      Caption = 'Browse...'
      TabOrder = 3
      OnClick = btnBrowseClick
    end
    object ListBox1: TListBox
      Left = 9
      Top = 112
      Width = 368
      Height = 61
      Style = lbOwnerDrawFixed
      Columns = 10
      ExtendedSelect = False
      ItemHeight = 36
      TabOrder = 5
      OnDrawItem = ListBox1DrawItem
      OnMeasureItem = ListBox1MeasureItem
    end
    object btnShell32: TTntButton
      Left = 112
      Top = 72
      Width = 97
      Height = 23
      Caption = 'shell32.dll'
      TabOrder = 4
      OnClick = btnShell32Click
    end
    object btnPngLink: TTntRadioButton
      Left = 8
      Top = 48
      Width = 300
      Height = 17
      Caption = 'Link PNG file'
      TabOrder = 2
    end
  end
  object bOk: TTntButton
    Left = 208
    Top = 208
    Width = 90
    Height = 23
    Caption = 'OK'
    Default = True
    TabOrder = 1
    OnClick = bOkClick
  end
  object bCan: TTntButton
    Left = 304
    Top = 208
    Width = 90
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 2
  end
  object ImageList32: TImageList
    AllocBy = 20
    Height = 32
    Width = 32
    Left = 320
    Top = 16
  end
  object ImageList16: TImageList
    AllocBy = 20
    Left = 288
    Top = 16
  end
  object OpenDialogDLL: TOpenDialog
    Filter = 'exe, dll, icl, ico|*.exe;*.dll;*.icl;*.ico'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 256
    Top = 16
  end
  object OpenDialogPNG: TOpenDialog
    Filter = 'PNG|*.png|'
    Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
    Left = 232
    Top = 16
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'OpenDialog*')
    Left = 168
    Top = 204
    LangData = {
      0D00666D546F6F6C62617249636F6E010100000001000000070043617074696F
      6E010F000000090047726F7570426F783100000600496D61676531000008004C
      6162656C4572720000060062746E444C4C010100000003000000070043617074
      696F6E00060062746E504E47010100000004000000070043617074696F6E0009
      0062746E42726F777365010100000005000000070043617074696F6E0008004C
      697374426F783100000A0062746E5368656C6C33320101000000060000000700
      43617074696F6E000300624F6B010100000007000000070043617074696F6E00
      04006243616E010100000008000000070043617074696F6E000B00496D616765
      4C697374333200000B00496D6167654C697374313600000D004F70656E446961
      6C6F67444C4C00000D004F70656E4469616C6F67504E4700000A0062746E506E
      674C696E6B010100000009000000070043617074696F6E00}
  end
end
