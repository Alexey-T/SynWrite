object fmLexerStyles: TfmLexerStyles
  Left = 280
  Top = 80
  BorderStyle = bsDialog
  Caption = 'Lexer styles'
  ClientHeight = 552
  ClientWidth = 463
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  ShowHint = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TTntLabel
    Left = 8
    Top = 4
    Width = 38
    Height = 13
    Caption = '&Element'
  end
  object LB: TListBox
    Left = 8
    Top = 20
    Width = 153
    Height = 313
    ItemHeight = 13
    TabOrder = 0
    OnClick = LBClick
  end
  object Button2: TTntButton
    Left = 144
    Top = 520
    Width = 89
    Height = 23
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 3
  end
  object Button3: TTntButton
    Left = 240
    Top = 520
    Width = 89
    Height = 23
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 4
  end
  object SyntaxMemo1: TSyntaxMemo
    Left = 8
    Top = 340
    Width = 449
    Height = 173
    Cursor = crDefault
    NonPrintedSpaces = True
    NonPrintedEol = True
    NonPrintedEolDetails = False
    SelectModeDefault = msNone
    SyntaxAnalyzer = FSynt
    TabList.AsString = '4'
    NonPrinted.Font.Charset = DEFAULT_CHARSET
    NonPrinted.Font.Color = clSilver
    NonPrinted.Font.Height = -11
    NonPrinted.Font.Name = 'Consolas'
    NonPrinted.Font.Style = []
    LineNumbers.Visible = False
    LineNumbers.Alignment = taLeftJustify
    LineNumbers.Font.Charset = DEFAULT_CHARSET
    LineNumbers.Font.Color = clWindowText
    LineNumbers.Font.Height = -9
    LineNumbers.Font.Name = 'Consolas'
    LineNumbers.Font.Style = []
    LineNumbers.Band = -1
    Gutter.Width = 15
    Gutter.ExpandButtons.Data = {
      FA000000424DFA000000000000007600000028000000120000000B0000000100
      0400000000008400000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
      1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
      FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
      00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
      FFFFF0000000000000000000000000000000111111111111111111000000}
    Gutter.Bands = <>
    Gutter.Objects = <>
    Gutter.ExpBtnBand = -1
    Gutter.CollapsePen.Color = clGray
    Gutter.AutoSize = False
    HintProps.Font.Charset = DEFAULT_CHARSET
    HintProps.Font.Color = clWindowText
    HintProps.Font.Height = -11
    HintProps.Font.Name = 'Consolas'
    HintProps.Font.Style = []
    HintProps.Color = 13041663
    HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
    UserRanges = <>
    UndoLimit = 0
    TabMode = tmDialog
    StaplePen.Color = clGray
    DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SelectioMark.Font.Color = clHighlightText
    DefaultStyles.SelectioMark.Font.Height = -13
    DefaultStyles.SelectioMark.Font.Name = 'Consolas'
    DefaultStyles.SelectioMark.Font.Style = []
    DefaultStyles.SelectioMark.BgColor = clHighlight
    DefaultStyles.SelectioMark.FormatType = ftColor
    DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SearchMark.Font.Color = clWhite
    DefaultStyles.SearchMark.Font.Height = -13
    DefaultStyles.SearchMark.Font.Name = 'Consolas'
    DefaultStyles.SearchMark.Font.Style = []
    DefaultStyles.SearchMark.BgColor = clBlack
    DefaultStyles.SearchMark.FormatType = ftColor
    DefaultStyles.CurrentLine.Enabled = False
    DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CurrentLine.Font.Color = clWindowText
    DefaultStyles.CurrentLine.Font.Height = -13
    DefaultStyles.CurrentLine.Font.Name = 'Consolas'
    DefaultStyles.CurrentLine.Font.Style = []
    DefaultStyles.CurrentLine.FormatType = ftBackGround
    DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CollapseMark.Font.Color = clSilver
    DefaultStyles.CollapseMark.Font.Height = -13
    DefaultStyles.CollapseMark.Font.Name = 'Consolas'
    DefaultStyles.CollapseMark.Font.Style = []
    DefaultStyles.CollapseMark.FormatType = ftColor
    DefaultStyles.CollapseMark.BorderTypeLeft = blSolid
    DefaultStyles.CollapseMark.BorderColorLeft = clSilver
    DefaultStyles.CollapseMark.BorderTypeTop = blSolid
    DefaultStyles.CollapseMark.BorderColorTop = clSilver
    DefaultStyles.CollapseMark.BorderTypeRight = blSolid
    DefaultStyles.CollapseMark.BorderColorRight = clSilver
    DefaultStyles.CollapseMark.BorderTypeBottom = blSolid
    DefaultStyles.CollapseMark.BorderColorBottom = clSilver
    SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.SyncRangeStyle.Font.Color = clWindowText
    SyncEditing.SyncRangeStyle.Font.Height = -13
    SyncEditing.SyncRangeStyle.Font.Name = 'Consolas'
    SyncEditing.SyncRangeStyle.Font.Style = []
    SyncEditing.SyncRangeStyle.BgColor = 14745568
    SyncEditing.SyncRangeStyle.FormatType = ftBackGround
    SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
    SyncEditing.ActiveWordsStyle.Font.Height = -13
    SyncEditing.ActiveWordsStyle.Font.Name = 'Consolas'
    SyncEditing.ActiveWordsStyle.Font.Style = []
    SyncEditing.ActiveWordsStyle.FormatType = ftBackGround
    SyncEditing.ActiveWordsStyle.BorderTypeLeft = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorLeft = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeTop = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorTop = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeRight = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorRight = clBlue
    SyncEditing.ActiveWordsStyle.BorderTypeBottom = blSolid
    SyncEditing.ActiveWordsStyle.BorderColorBottom = clBlue
    SyncEditing.InactiveWordsStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.InactiveWordsStyle.Font.Color = clWindowText
    SyncEditing.InactiveWordsStyle.Font.Height = -13
    SyncEditing.InactiveWordsStyle.Font.Name = 'Consolas'
    SyncEditing.InactiveWordsStyle.Font.Style = []
    SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
    SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
    SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
    Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText]
    ReadOnly = True
    HorzRuler.Font.Charset = DEFAULT_CHARSET
    HorzRuler.Font.Color = clWindowText
    HorzRuler.Font.Height = -11
    HorzRuler.Font.Name = 'Consolas'
    HorzRuler.Font.Style = []
    TextMargins = <
      item
        Pen.Color = clSilver
        RulerMark = False
      end>
    Caret.Insert.Width = -2
    Caret.Overwrite.Width = 100
    Caret.ReadOnly.Width = -1
    Caret.Custom.Width = -2
    Transparent = False
    Alignment = taLeftJustify
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Consolas'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    TabStop = True
    OnMouseDown = SyntaxMemo1MouseDown
  end
  inline SyntStyleFrame1: TSyntStyleFrame
    Left = 168
    Top = 0
    Width = 289
    Height = 333
    AutoScroll = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    TabStop = True
    inherited Button3: TTntButton
      Width = 132
      Caption = 'Se&t custom font...'
    end
    inherited GroupBox2: TTntGroupBox
      Caption = 'Borders'
    end
    inherited CheckBox7: TTntCheckBox
      Caption = '&Read-only'
    end
    inherited ComboBox7: TTntComboBox
      Width = 132
    end
    inherited FontDialog1: TFontDialog
      Left = 244
      Top = 168
    end
  end
  object FSynt: TSyntAnalyzer
    Formats = <
      item
        DisplayName = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        FormatType = ftCustomFont
      end>
    TokenRules = <>
    BlockRules = <>
    CodeTemplates = <>
    SubAnalyzers = <>
    TokenTypeNames.Strings = (
      'Unknown'
      'Preprocessor')
    DefaultStyleName = 'Default'
    Charset = DEFAULT_CHARSET
    Left = 340
    Top = 404
  end
  object DKLanguageController1: TDKLanguageController
    SectionName = 'CustomSyntDlg'
    Left = 376
    Top = 400
    LangData = {
      0D00666D4C657865725374796C6573010100000001000000070043617074696F
      6E010700000006004C6162656C31010100000002000000070043617074696F6E
      0002004C4200000700427574746F6E3201010000000300000007004361707469
      6F6E000700427574746F6E33010100000004000000070043617074696F6E000B
      0053796E7461784D656D6F3100000F0053796E745374796C654672616D653100
      012100000006004C6162656C32010100000005000000070043617074696F6E00
      06004C6162656C33010100000006000000070043617074696F6E0006004C6162
      656C31010100000007000000070043617074696F6E0006004C6162656C340101
      00000008000000070043617074696F6E0006004C6162656C3901010000000900
      0000070043617074696F6E000900436F6C6F72426F783101010000000A000000
      040048696E74000700427574746F6E3301010000000B00000007004361707469
      6F6E000900436F6C6F72426F783201010000000C000000040048696E74000900
      47726F7570426F783101020000000E000000070043617074696F6E0D00000004
      0048696E74000900436865636B426F7832010200000010000000070043617074
      696F6E0F000000040048696E74000900436865636B426F783301020000001200
      0000070043617074696F6E11000000040048696E74000900436865636B426F78
      34010200000014000000070043617074696F6E13000000040048696E74000900
      436865636B426F7835010200000016000000070043617074696F6E1500000004
      0048696E74000900436F6D626F426F7831010200000017000000040048696E74
      1800000005004974656D73000900436F6D626F426F7832010200000019000000
      040048696E741A00000005004974656D73000900436865636B426F7831010200
      00001C000000070043617074696F6E1B000000040048696E7400090047726F75
      70426F783201010000001D000000070043617074696F6E0006004C6162656C35
      01010000001E000000070043617074696F6E0006004C6162656C360101000000
      1F000000070043617074696F6E0006004C6162656C3701010000002000000007
      0043617074696F6E0006004C6162656C38010100000021000000070043617074
      696F6E000900436F6C6F72426F7833010100000022000000040048696E740009
      00436F6D626F426F7833010200000023000000040048696E7424000000050049
      74656D73000900436F6C6F72426F7834010100000025000000040048696E7400
      0900436F6D626F426F7834010200000026000000040048696E74270000000500
      4974656D73000900436F6C6F72426F7835010100000028000000040048696E74
      000900436F6D626F426F7835010200000029000000040048696E742A00000005
      004974656D73000900436F6C6F72426F783601010000002B000000040048696E
      74000900436F6D626F426F783601020000002C000000040048696E742D000000
      05004974656D73000900436865636B426F783601020000002F00000007004361
      7074696F6E2E000000040048696E74000900436865636B426F78370102000000
      31000000070043617074696F6E30000000040048696E74000900436F6D626F42
      6F7837010200000032000000040048696E743300000005004974656D73000B00
      466F6E744469616C6F6731000005004653796E74010300000038000000100044
      656661756C745374796C654E616D65340000001600466F726D6174735B305D2E
      446973706C61794E616D65360000000E00546F6B656E547970654E616D657300}
  end
end
