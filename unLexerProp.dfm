object fmLexerProp: TfmLexerProp
  Left = 314
  Top = 75
  Width = 617
  Height = 632
  BorderIcons = [biSystemMenu, biMaximize]
  Caption = 'Lexer properties'
  Color = clBtnFace
  Constraints.MinHeight = 450
  Constraints.MinWidth = 500
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  ShowHint = True
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 365
    Width = 601
    Height = 3
    Cursor = crVSplit
    Align = alTop
  end
  object PageControl1: TTntPageControl
    Left = 0
    Top = 0
    Width = 601
    Height = 365
    ActivePage = TabSheet5
    Align = alTop
    TabOrder = 0
    object TabSheet5: TTntTabSheet
      Caption = 'Common'
      ImageIndex = 4
      DesignSize = (
        593
        337)
      object Label4: TTntLabel
        Left = 4
        Top = 64
        Width = 193
        Height = 15
        Alignment = taCenter
        AutoSize = False
        Caption = 'Token type names'
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clYellow
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object Label30: TTntLabel
        Left = 206
        Top = 88
        Width = 99
        Height = 13
        Caption = 'Selection mark style:'
        FocusControl = ComboBox22
      end
      object Label2: TTntLabel
        Left = 206
        Top = 268
        Width = 232
        Height = 13
        Caption = 'Disable full refresh if text length is greater than:'
        FocusControl = Edit7
      end
      object Label3: TTntLabel
        Left = 206
        Top = 112
        Width = 89
        Height = 13
        Caption = 'Search mark style:'
        FocusControl = ComboBox1
      end
      object Label5: TTntLabel
        Left = 206
        Top = 136
        Width = 86
        Height = 13
        Caption = 'Current line style:'
        FocusControl = ComboBox2
      end
      object Label6: TTntLabel
        Left = 206
        Top = 64
        Width = 65
        Height = 13
        Caption = 'Default style:'
        FocusControl = ComboBox7
      end
      object Label7: TTntLabel
        Left = 206
        Top = 292
        Width = 99
        Height = 13
        Caption = 'Line comment string:'
        FocusControl = Edit14
      end
      object Label31: TTntLabel
        Left = 206
        Top = 160
        Width = 96
        Height = 13
        Caption = 'Collapse mark style:'
        FocusControl = ComboBox8
      end
      object Label50: TTntLabel
        Left = 206
        Top = 316
        Width = 70
        Height = 13
        Caption = 'Character set:'
      end
      object Panel_Common: TTntPanel
        Left = 0
        Top = 0
        Width = 593
        Height = 61
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          593
          61)
        object Label33: TTntLabel
          Left = 4
          Top = 36
          Width = 75
          Height = 13
          Caption = 'File extensions:'
          FocusControl = Edit3
        end
        object Label34: TTntLabel
          Left = 4
          Top = 12
          Width = 60
          Height = 13
          Caption = 'Lexer name:'
          FocusControl = Edit4
        end
        object Edit3: TTntEdit
          Left = 152
          Top = 32
          Width = 432
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
        end
        object Edit4: TTntEdit
          Left = 152
          Top = 8
          Width = 432
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
        end
      end
      object ComboBox22: TComboBox
        Tag = 1
        Left = 360
        Top = 84
        Width = 226
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 2
        OnChange = ComboBox7Change
      end
      object CheckBox17: TTntCheckBox
        Left = 204
        Top = 182
        Width = 381
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Skip spaces while parsing'
        TabOrder = 6
        OnClick = CheckBox17Click
      end
      object SyntaxMemo7: TSyntaxMemo
        Left = 4
        Top = 80
        Width = 193
        Height = 253
        TabList.AsString = '4'
        NonPrinted.Font.Charset = DEFAULT_CHARSET
        NonPrinted.Font.Color = clSilver
        NonPrinted.Font.Height = -11
        NonPrinted.Font.Name = 'Consolas'
        NonPrinted.Font.Style = []
        LineNumbers.Alignment = taLeftJustify
        LineNumbers.Font.Charset = DEFAULT_CHARSET
        LineNumbers.Font.Color = clWindowText
        LineNumbers.Font.Height = -12
        LineNumbers.Font.Name = 'Consolas'
        LineNumbers.Font.Style = []
        LineNumbers.Band = -1
        Gutter.Visible = False
        Gutter.Width = 20
        Gutter.ExpandButtons.Data = {
          FA000000424DFA000000000000007600000028000000180000000B0000000100
          0400000000008400000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
          60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
          BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
          00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
          60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
        Options = [soOverwriteBlocks, soEnableBlockSel, soKeepCaretInText, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soVariableHorzScrollBar]
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
        Anchors = [akLeft, akTop, akBottom]
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        OnExit = SyntaxMemo7Exit
      end
      object Edit7: TTntEdit
        Left = 456
        Top = 264
        Width = 130
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 11
      end
      object ComboBox1: TComboBox
        Tag = 2
        Left = 360
        Top = 108
        Width = 226
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 3
        OnChange = ComboBox7Change
      end
      object ComboBox2: TComboBox
        Tag = 3
        Left = 360
        Top = 132
        Width = 226
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 4
        OnChange = ComboBox7Change
      end
      object CheckBox2: TTntCheckBox
        Left = 204
        Top = 222
        Width = 381
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Restart analysis from the line start'
        TabOrder = 7
        OnClick = CheckBox2Click
      end
      object CheckBox3: TTntCheckBox
        Left = 204
        Top = 202
        Width = 381
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Do not skip end of line'
        TabOrder = 8
        OnClick = CheckBox3Click
      end
      object ComboBox7: TComboBox
        Left = 360
        Top = 60
        Width = 226
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 9
        OnChange = ComboBox7Change
      end
      object Edit14: TTntEdit
        Left = 360
        Top = 288
        Width = 227
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 12
      end
      object CheckBox28: TTntCheckBox
        Left = 204
        Top = 242
        Width = 381
        Height = 17
        Alignment = taLeftJustify
        Anchors = [akLeft, akTop, akRight]
        Caption = 'Always synchronized block analysis'
        TabOrder = 10
        OnClick = CheckBox2Click
      end
      object ComboBox8: TComboBox
        Tag = 4
        Left = 360
        Top = 156
        Width = 226
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 5
        OnChange = ComboBox7Change
      end
      object CharSet_Combo: TComboBox
        Left = 360
        Top = 312
        Width = 228
        Height = 21
        Style = csDropDownList
        Anchors = [akLeft, akTop, akRight]
        ItemHeight = 13
        TabOrder = 13
        OnChange = CharSet_ComboChange
      end
    end
    object TabSheet1: TTntTabSheet
      Caption = 'Styles'
      inline SyntColFrame1: TSyntColFrame
        Left = 0
        Top = 0
        Width = 299
        Height = 337
        Align = alClient
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        inherited LB: TListBox
          Width = 299
          Height = 290
        end
        inherited Panel1: TPanel
          Width = 299
        end
        inherited Panel2: TPanel
          Top = 315
          Width = 299
          inherited Edit: TEdit
            Width = 306
          end
        end
      end
      inline SyntStyleFrame1: TSyntStyleFrame
        Left = 299
        Top = 0
        Width = 294
        Height = 337
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        TabStop = True
        inherited Label3: TLabel
          Anchors = [akTop]
        end
        inherited Label4: TLabel
          Anchors = [akTop]
        end
        inherited Button3: TButton
          Width = 134
          Anchors = [akTop]
        end
        inherited ColorBox2: TColorBox
          Left = 151
          Anchors = [akTop]
        end
        inherited ComboBox2: TComboBox
          Left = 151
          Anchors = [akTop]
        end
        inherited GroupBox2: TGroupBox
          Caption = 'Borders'
          inherited Label5: TLabel
            Left = 8
          end
          inherited Label6: TLabel
            Left = 8
          end
          inherited Label7: TLabel
            Left = 8
          end
          inherited Label8: TLabel
            Left = 8
          end
        end
        inherited CheckBox7: TCheckBox
          Width = 141
          Caption = '&Read only'
        end
      end
    end
    object TabSheet2: TTntTabSheet
      Caption = 'Parser'
      ImageIndex = 1
      object Splitter3: TSplitter
        Left = 189
        Top = 0
        Height = 337
      end
      inline SyntColFrame2: TSyntColFrame
        Left = 0
        Top = 0
        Width = 189
        Height = 337
        Align = alLeft
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        inherited LB: TListBox
          Width = 189
          Height = 290
        end
        inherited Panel1: TPanel
          Width = 189
        end
        inherited Panel2: TPanel
          Top = 315
          Width = 189
          inherited Edit: TEdit
            Width = 192
          end
        end
      end
      object Panel3: TTntPanel
        Left = 192
        Top = 0
        Width = 401
        Height = 337
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label22: TTntLabel
          Left = 0
          Top = 213
          Width = 401
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Regular expression'
          Color = clActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object SyntaxMemo3: TSyntaxMemo
          Left = 0
          Top = 230
          Width = 401
          Height = 107
          TabList.AsString = '4'
          NonPrinted.Font.Charset = DEFAULT_CHARSET
          NonPrinted.Font.Color = clSilver
          NonPrinted.Font.Height = -11
          NonPrinted.Font.Name = 'Consolas'
          NonPrinted.Font.Style = []
          LineNumbers.Alignment = taLeftJustify
          LineNumbers.Font.Charset = DEFAULT_CHARSET
          LineNumbers.Font.Color = clWindowText
          LineNumbers.Font.Height = -9
          LineNumbers.Font.Name = 'Consolas'
          LineNumbers.Font.Style = []
          LineNumbers.Band = -1
          Gutter.ExpandButtons.Data = {
            FA000000424DFA000000000000007600000028000000180000000B0000000100
            0400000000008400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
            60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
            BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
            00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
            60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
          ScrollBars = ssHorizontal
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
          Options = [soOverwriteBlocks, soEnableBlockSel, soCopyAsRTF, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soSmartCaret, soVariableHorzScrollBar]
          BorderStyle = bsNone
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
          Align = alClient
          BevelKind = bkTile
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnExit = Memo1Exit
        end
        object Panel4: TTntPanel
          Left = 0
          Top = 0
          Width = 401
          Height = 213
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            401
            213)
          object Label21: TTntLabel
            Left = 8
            Top = 8
            Width = 54
            Height = 13
            Caption = 'Token type'
          end
          object Label29: TTntLabel
            Left = 8
            Top = 32
            Width = 55
            Height = 13
            Caption = 'Token style'
          end
          object Label35: TTntLabel
            Left = 8
            Top = 56
            Width = 59
            Height = 13
            Caption = 'Parent block'
          end
          object Label11: TTntLabel
            Left = 8
            Top = 80
            Width = 71
            Height = 13
            Caption = 'Position in line:'
          end
          object Label12: TTntLabel
            Left = 138
            Top = 80
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'from'
          end
          object Label13: TTntLabel
            Left = 279
            Top = 80
            Width = 10
            Height = 13
            Alignment = taRightJustify
            Caption = 'to'
          end
          object ComboBox24: TComboBox
            Left = 112
            Top = 52
            Width = 286
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
            OnChange = ComboBox24Change
          end
          object ComboBox17: TComboBox
            Left = 112
            Top = 4
            Width = 286
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnChange = ComboBox17Change
            Items.Strings = (
              'Illegal char'
              'Comment'
              'Identifier'
              'Symbol'
              'String'
              'Integer const'
              'Float const'
              'Hex const'
              'Char const'
              'Preprocessor'
              'User defined 1'
              'User defined 2'
              'User defined 3'
              'User defined 4'
              'User defined 5'
              'User defined 6')
          end
          object ComboBox21: TComboBox
            Left = 112
            Top = 28
            Width = 286
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = ComboBox21Change
          end
          object CheckBox8: TTntCheckBox
            Left = 6
            Top = 100
            Width = 187
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Strict parent block'
            TabOrder = 3
            OnClick = CheckBox8Click
          end
          object CheckBox18: TTntCheckBox
            Left = 224
            Top = 100
            Width = 170
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Not a parent'
            TabOrder = 4
            OnClick = CheckBox18Click
          end
          object CheckBox27: TTntCheckBox
            Left = 6
            Top = 116
            Width = 187
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Always enabled'
            TabOrder = 5
            OnClick = CheckBox27Click
          end
          object Edit10: TTntEdit
            Left = 168
            Top = 76
            Width = 49
            Height = 21
            TabOrder = 6
            OnExit = Edit10Exit
          end
          object Edit11: TTntEdit
            Left = 296
            Top = 76
            Width = 53
            Height = 21
            TabOrder = 7
            OnExit = Edit11Exit
          end
          inline RuleStatesFrame2: TRuleStatesFrame
            Left = 0
            Top = 134
            Width = 401
            Height = 79
            Align = alBottom
            TabOrder = 8
            TabStop = True
            inherited GroupBox1: TGroupBox
              Width = 401
              inherited Label1: TLabel
                Width = 41
              end
              inherited Label2: TLabel
                Left = 222
                Width = 38
              end
              inherited Edit1: TEdit
                Left = 120
                Width = 49
              end
              inherited Edit2: TEdit
                Left = 326
                Width = 58
              end
            end
            inherited GroupBox2: TGroupBox
              Width = 401
              inherited Label3: TLabel
                Width = 20
              end
              inherited Label4: TLabel
                Left = 223
                Width = 32
              end
              inherited Edit3: TEdit
                Left = 120
                Width = 49
              end
              inherited Edit4: TEdit
                Left = 327
                Width = 58
              end
            end
          end
        end
      end
    end
    object TabSheet3: TTntTabSheet
      Caption = 'Rules'
      ImageIndex = 2
      object Splitter2: TSplitter
        Left = 174
        Top = 0
        Height = 337
      end
      inline SyntColFrame3: TSyntColFrame
        Left = 0
        Top = 0
        Width = 174
        Height = 337
        Align = alLeft
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        inherited LB: TListBox
          Width = 174
          Height = 290
        end
        inherited Panel1: TPanel
          Width = 174
        end
        inherited Panel2: TPanel
          Top = 315
          Width = 174
        end
      end
      object PageControl2: TTntPageControl
        Left = 177
        Top = 0
        Width = 416
        Height = 337
        ActivePage = TabSheet7
        Align = alClient
        TabOrder = 1
        object TabSheet7: TTntTabSheet
          Caption = 'Properties'
          DesignSize = (
            408
            309)
          object Label1: TTntLabel
            Left = 4
            Top = 56
            Width = 73
            Height = 13
            Caption = 'Identifier index'
            FocusControl = Edit1
          end
          object Label20: TTntLabel
            Left = 189
            Top = 56
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Block offset'
            FocusControl = Edit2
          end
          object Label28: TTntLabel
            Left = 4
            Top = 124
            Width = 98
            Height = 13
            Caption = 'Range end condition'
            FocusControl = ComboBox23
          end
          object Label36: TTntLabel
            Left = 4
            Top = 8
            Width = 49
            Height = 13
            Caption = 'Block type'
            FocusControl = ComboBox25
          end
          object Label37: TTntLabel
            Left = 4
            Top = 80
            Width = 59
            Height = 13
            Caption = 'Parent block'
            FocusControl = ComboBox26
          end
          object Label8: TTntLabel
            Left = 304
            Top = 56
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Anchors = [akTop, akRight]
            Caption = 'Group index'
          end
          object Label10: TTntLabel
            Left = 4
            Top = 124
            Width = 103
            Height = 13
            Caption = 'Range start condition'
            Visible = False
          end
          object Label14: TTntLabel
            Left = 4
            Top = 32
            Width = 64
            Height = 13
            Caption = 'Grammar rule'
          end
          object Label15: TTntLabel
            Left = 4
            Top = 124
            Width = 92
            Height = 13
            Caption = 'Change token type'
          end
          object Label23: TTntLabel
            Left = 4
            Top = 124
            Width = 89
            Height = 13
            Caption = 'Line break position'
            FocusControl = ComboBox18
          end
          object CheckBox13: TTntCheckBox
            Left = 216
            Top = 168
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Require same ident'
            TabOrder = 14
            OnClick = CheckBox13Click
          end
          object CheckBox9: TTntCheckBox
            Left = 216
            Top = 148
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Relative to end of condition'
            TabOrder = 13
            OnClick = CheckBox9Click
          end
          object Edit1: TTntEdit
            Left = 112
            Top = 52
            Width = 33
            Height = 21
            TabOrder = 2
            OnExit = Edit1Exit
          end
          object Edit2: TTntEdit
            Tag = 1
            Left = 249
            Top = 52
            Width = 33
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 3
            OnExit = Edit2Exit
          end
          object ComboBox23: TComboBox
            Left = 160
            Top = 120
            Width = 240
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 8
            OnChange = ComboBox23Change
          end
          object ComboBox25: TComboBox
            Left = 112
            Top = 4
            Width = 288
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnChange = ComboBox25Changed
            Items.Strings = (
              'Tag detector'
              'Line separator'
              'Range start'
              'Range end')
          end
          object ComboBox26: TComboBox
            Left = 112
            Top = 76
            Width = 288
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 5
            OnChange = ComboBox26Change
          end
          object CheckBox7: TTntCheckBox
            Left = 2
            Top = 100
            Width = 199
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Strict parent block'
            TabOrder = 6
            OnClick = CheckBox7Click
          end
          object CheckBox19: TTntCheckBox
            Left = 216
            Top = 100
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Not a parent'
            TabOrder = 7
            OnClick = CheckBox19Click
          end
          object CheckBox20: TTntCheckBox
            Left = 4
            Top = 168
            Width = 197
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Cancel next rules'
            TabOrder = 12
            OnClick = CheckBox20Click
          end
          object CheckBox26: TTntCheckBox
            Left = 4
            Top = 148
            Width = 197
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Always enabled'
            TabOrder = 11
            OnClick = CheckBox26Click
          end
          object Edit8: TTntEdit
            Tag = 1
            Left = 365
            Top = 52
            Width = 33
            Height = 21
            Anchors = [akTop, akRight]
            TabOrder = 4
            OnExit = Edit8Exit
          end
          object ComboBox3: TComboBox
            Left = 112
            Top = 28
            Width = 288
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = ComboBox3Change
          end
          object ComboBox4: TComboBox
            Left = 160
            Top = 120
            Width = 240
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 9
            OnChange = ComboBox4Change
          end
          object ComboBox18: TComboBox
            Left = 160
            Top = 120
            Width = 240
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 10
            OnChange = ComboBox18Change
            Items.Strings = (
              'Top'
              'Bottom')
          end
          inline RuleStatesFrame3: TRuleStatesFrame
            Left = 0
            Top = 192
            Width = 414
            Height = 85
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 15
            TabStop = True
            inherited GroupBox1: TGroupBox
              Width = 414
              inherited Label1: TLabel
                Width = 41
              end
              inherited Label2: TLabel
                Left = 229
                Width = 38
              end
              inherited Edit1: TEdit
                Left = 112
                Width = 57
              end
              inherited Edit2: TEdit
                Left = 335
                Width = 63
              end
            end
            inherited GroupBox2: TGroupBox
              Width = 414
              inherited Label3: TLabel
                Width = 20
              end
              inherited Label4: TLabel
                Left = 229
                Width = 32
              end
              inherited Edit3: TEdit
                Left = 112
                Width = 57
              end
              inherited Edit4: TEdit
                Left = 335
                Width = 63
              end
            end
          end
        end
        object TabSheet12: TTntTabSheet
          Caption = 'Text range'
          ImageIndex = 3
          DesignSize = (
            408
            309)
          object Label38: TTntLabel
            Left = 4
            Top = 12
            Width = 92
            Height = 13
            Caption = 'Name format string'
            FocusControl = Edit5
          end
          object Label39: TTntLabel
            Left = 4
            Top = 36
            Width = 94
            Height = 13
            Caption = 'Group format string'
            FocusControl = Edit6
          end
          object Label9: TTntLabel
            Left = 4
            Top = 60
            Width = 91
            Height = 13
            Caption = 'Collapsed text icon'
            FocusControl = Edit9
          end
          object Label42: TTntLabel
            Left = 4
            Top = 168
            Width = 85
            Height = 13
            Caption = 'Auto closing text:'
            FocusControl = ComboBox10
          end
          object Edit5: TTntEdit
            Left = 168
            Top = 8
            Width = 235
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnExit = Edit5Exit
          end
          object Edit6: TTntEdit
            Left = 168
            Top = 32
            Width = 235
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 1
            OnExit = Edit6Exit
          end
          object Edit9: TTntEdit
            Left = 168
            Top = 56
            Width = 235
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 2
            OnExit = Edit9Exit
          end
          object CheckBox11: TTntCheckBox
            Left = 4
            Top = 84
            Width = 197
            Height = 17
            Caption = 'Close block at end of text'
            TabOrder = 3
            OnClick = CheckBox11Click
          end
          object CheckBox4: TTntCheckBox
            Left = 4
            Top = 104
            Width = 197
            Height = 17
            Caption = 'Self closing range'
            TabOrder = 4
            OnClick = CheckBox4Click
          end
          object CheckBox5: TTntCheckBox
            Left = 4
            Top = 124
            Width = 197
            Height = 17
            Caption = 'Initially closed (no end rule)'
            TabOrder = 5
            OnClick = CheckBox5Click
          end
          object CheckBox6: TTntCheckBox
            Left = 208
            Top = 84
            Width = 198
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Display in syntax tree'
            TabOrder = 6
            OnClick = CheckBox6Click
          end
          object CheckBox12: TTntCheckBox
            Left = 208
            Top = 104
            Width = 198
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Can not be collapsed'
            TabOrder = 7
            OnClick = CheckBox12Click
          end
          object CheckBox1: TTntCheckBox
            Left = 208
            Top = 124
            Width = 198
            Height = 17
            Anchors = [akTop, akRight]
            Caption = 'Draw block staple'
            TabOrder = 8
            OnClick = CheckBox1Click
          end
          object CheckBox31: TTntCheckBox
            Left = 4
            Top = 144
            Width = 197
            Height = 17
            Caption = 'Ignore as parent'
            TabOrder = 9
            OnClick = CheckBox31Click
          end
          object SyntaxMemo10: TSyntaxMemo
            Left = 4
            Top = 188
            Width = 399
            Height = 117
            SyntaxAnalyzer = FSynt
            TabList.AsString = '4'
            NonPrinted.Font.Charset = DEFAULT_CHARSET
            NonPrinted.Font.Color = clSilver
            NonPrinted.Font.Height = -11
            NonPrinted.Font.Name = 'Consolas'
            NonPrinted.Font.Style = []
            LineNumbers.Font.Charset = DEFAULT_CHARSET
            LineNumbers.Font.Color = clWindowText
            LineNumbers.Font.Height = -9
            LineNumbers.Font.Name = 'Consolas'
            LineNumbers.Font.Style = []
            LineNumbers.Band = 0
            LineNumbers.AutoSize = True
            Gutter.Width = 7
            Gutter.ExpandButtons.Data = {
              FA000000424DFA000000000000007600000028000000120000000B0000000100
              0400000000008400000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00111111111111
              1111110000000000000000000000000000000FFFFFFF00FFFFFFF00000000FFF
              FFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000F00000F00F00000F000
              00000FFFFFFF00FFF0FFF00000000FFFFFFF00FFF0FFF00000000FFFFFFF00FF
              FFFFF0000000000000000000000000000000111111111111111111000000}
            Gutter.Bands = <
              item
                Width = 7
              end>
            Gutter.Objects = <>
            Gutter.ExpBtnBand = -1
            Gutter.CollapsePen.Color = clGray
            Gutter.AutoSize = True
            HintProps.Font.Charset = DEFAULT_CHARSET
            HintProps.Font.Color = clWindowText
            HintProps.Font.Height = -11
            HintProps.Font.Name = 'Consolas'
            HintProps.Font.Style = []
            HintProps.Color = 13041663
            HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
            UserRanges = <>
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
            Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soVariableHorzScrollBar]
            HorzRuler.Font.Charset = DEFAULT_CHARSET
            HorzRuler.Font.Color = clWindowText
            HorzRuler.Font.Height = -11
            HorzRuler.Font.Name = 'Consolas'
            HorzRuler.Font.Style = []
            HorzRuler.Color = clBtnFace
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
            Anchors = [akLeft, akTop, akRight, akBottom]
            Ctl3D = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Consolas'
            Font.Style = []
            ParentColor = False
            ParentCtl3D = False
            ParentFont = False
            TabOrder = 11
            OnTextChanged = SyntaxMemo10TextChanged
          end
          object ComboBox10: TComboBox
            Left = 168
            Top = 164
            Width = 235
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 10
            OnChange = ComboBox10Change
            Items.Strings = (
              'Disabled'
              'Close nearest range'
              'Close opened range')
          end
        end
        object TabSheet9: TTntTabSheet
          Caption = 'Highlight'
          ImageIndex = 2
          DesignSize = (
            408
            309)
          object Label27: TTntLabel
            Left = 2
            Top = 8
            Width = 24
            Height = 13
            Caption = 'Style'
            FocusControl = ComboBox20
          end
          object Label44: TTntLabel
            Left = 2
            Top = 32
            Width = 66
            Height = 13
            Caption = 'Highlight type'
          end
          object ComboBox20: TComboBox
            Left = 136
            Top = 4
            Width = 269
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnChange = ComboBox20Change
          end
          object CheckBox14: TTntCheckBox
            Left = 2
            Top = 52
            Width = 199
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Highlight lines of block'
            TabOrder = 2
            OnClick = CheckBox14Click
          end
          object CheckBox15: TTntCheckBox
            Left = 216
            Top = 52
            Width = 187
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Invert colors of selection'
            TabOrder = 3
            OnClick = CheckBox15Click
          end
          object GroupBox4: TTntGroupBox
            Left = 0
            Top = 72
            Width = 405
            Height = 61
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Active highlighting'
            TabOrder = 4
            DesignSize = (
              405
              61)
            object Label43: TTntLabel
              Left = 8
              Top = 20
              Width = 67
              Height = 13
              Caption = 'Caret position'
            end
            object ComboBox28: TComboBox
              Left = 136
              Top = 16
              Width = 265
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 0
              OnChange = ComboBox28Change
              Items.Strings = (
                'Any position (always)'
                'Bounds of the range'
                'Bounding tokens'
                'In the range'
                'Begin of bounding tokens'
                'Out of range')
            end
            object CheckBox16: TTntCheckBox
              Left = 8
              Top = 40
              Width = 249
              Height = 17
              Caption = 'Select minimal range'
              TabOrder = 1
              OnClick = CheckBox16Click
            end
          end
          object ComboBox29: TComboBox
            Left = 136
            Top = 28
            Width = 269
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = ComboBox29Change
            Items.Strings = (
              'Disabled'
              'Only bounding tokens'
              'All tokens without bound'
              'All range')
          end
          object GroupBox2: TTntGroupBox
            Left = 0
            Top = 140
            Width = 405
            Height = 85
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Syntax tree decoration'
            TabOrder = 5
            DesignSize = (
              405
              85)
            object Label16: TTntLabel
              Left = 8
              Top = 36
              Width = 26
              Height = 13
              Caption = 'Item:'
            end
            object Label17: TTntLabel
              Left = 8
              Top = 60
              Width = 33
              Height = 13
              Caption = 'Group:'
            end
            object Label18: TTntLabel
              Left = 303
              Top = 16
              Width = 59
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Image index'
            end
            object Label19: TTntLabel
              Left = 76
              Top = 16
              Width = 24
              Height = 13
              Caption = 'Style'
            end
            object ComboBox5: TComboBox
              Left = 72
              Top = 32
              Width = 224
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 0
              OnChange = ComboBox5Change
            end
            object ComboBox6: TComboBox
              Left = 72
              Top = 56
              Width = 224
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 1
              OnChange = ComboBox6Change
            end
            object Edit12: TTntEdit
              Left = 303
              Top = 32
              Width = 97
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 2
              OnExit = Edit12Exit
            end
            object Edit13: TTntEdit
              Left = 303
              Top = 56
              Width = 97
              Height = 21
              Anchors = [akTop, akRight]
              TabOrder = 3
              OnExit = Edit13Exit
            end
          end
          object GroupBox1: TTntGroupBox
            Left = 0
            Top = 228
            Width = 405
            Height = 65
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Pen'
            TabOrder = 6
            DesignSize = (
              405
              65)
            object Label32: TTntLabel
              Left = 8
              Top = 40
              Width = 28
              Height = 13
              Caption = 'Width'
              FocusControl = Edit15
            end
            object Label40: TTntLabel
              Left = 132
              Top = 16
              Width = 25
              Height = 13
              Caption = 'Color'
            end
            object Label41: TTntLabel
              Left = 132
              Top = 40
              Width = 24
              Height = 13
              Caption = 'Style'
            end
            object CheckBox30: TTntCheckBox
              Left = 8
              Top = 16
              Width = 117
              Height = 17
              Alignment = taLeftJustify
              Caption = 'Use custom pen'
              TabOrder = 0
              OnClick = CheckBox30Click
            end
            object Edit15: TTntEdit
              Left = 64
              Top = 36
              Width = 61
              Height = 21
              TabOrder = 1
              OnExit = Edit15Exit
            end
            object ColorBox1: TColorBox
              Left = 200
              Top = 12
              Width = 197
              Height = 22
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 16
              TabOrder = 2
              OnChange = ColorBox1Change
            end
            object ComboBox9: TComboBox
              Left = 200
              Top = 36
              Width = 197
              Height = 21
              Style = csDropDownList
              Anchors = [akLeft, akTop, akRight]
              ItemHeight = 13
              TabOrder = 3
              OnChange = ComboBox9Change
              Items.Strings = (
                'Solid'
                'Dash'
                'Dot'
                'DashDot'
                'DashDotDot'
                'Clear'
                'InsideFrame')
            end
          end
        end
        object TabSheet4: TTntTabSheet
          Caption = 'Conditions'
          ImageIndex = 2
          object GroupBox5: TTntGroupBox
            Left = 0
            Top = 0
            Width = 408
            Height = 309
            Align = alClient
            Caption = ' Conditions '
            TabOrder = 0
            object Panel5: TTntPanel
              Left = 2
              Top = 15
              Width = 185
              Height = 292
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Panel7: TTntPanel
                Left = 0
                Top = 0
                Width = 185
                Height = 153
                Align = alTop
                BevelOuter = bvLowered
                TabOrder = 0
                object Label24: TTntLabel
                  Left = 1
                  Top = 1
                  Width = 183
                  Height = 15
                  Align = alTop
                  Alignment = taCenter
                  AutoSize = False
                  Caption = 'Index'
                  Color = clActiveCaption
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clYellow
                  Font.Height = -12
                  Font.Name = 'Consolas'
                  Font.Style = [fsBold]
                  ParentColor = False
                  ParentFont = False
                end
                object SpeedButton1: TTntSpeedButton
                  Left = 159
                  Top = 16
                  Width = 23
                  Height = 22
                  Caption = '+'
                  Flat = True
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Consolas'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = SpeedButton1Click
                end
                object SpeedButton2: TTntSpeedButton
                  Left = 159
                  Top = 42
                  Width = 23
                  Height = 22
                  Caption = '-'
                  Flat = True
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -19
                  Font.Name = 'Consolas'
                  Font.Style = [fsBold]
                  ParentFont = False
                  OnClick = SpeedButton2Click
                end
                object Label25: TTntLabel
                  Left = 4
                  Top = 131
                  Width = 45
                  Height = 13
                  Caption = 'Condition'
                  FocusControl = ComboBox19
                end
                object ListBox1: TTntListBox
                  Left = 3
                  Top = 18
                  Width = 154
                  Height = 89
                  Color = 15132390
                  DragMode = dmAutomatic
                  Font.Charset = RUSSIAN_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -12
                  Font.Name = 'Consolas'
                  Font.Style = []
                  ItemHeight = 14
                  ParentFont = False
                  TabOrder = 0
                  OnClick = ListBox1Click
                  OnDragDrop = ListBox1DragDrop
                  OnDragOver = ListBox1DragOver
                end
                object CheckBox10: TTntCheckBox
                  Left = 5
                  Top = 109
                  Width = 175
                  Height = 17
                  Alignment = taLeftJustify
                  Caption = 'Ignore case'
                  TabOrder = 1
                  OnClick = CheckBox10Click
                end
                object ComboBox19: TComboBox
                  Left = 80
                  Top = 128
                  Width = 103
                  Height = 21
                  Style = csDropDownList
                  ItemHeight = 13
                  TabOrder = 2
                  OnChange = ComboBox19Change
                  Items.Strings = (
                    'Equal'
                    'Not equal'
                    'Mask'
                    'Skip tokens'
                    'Strict mask')
                end
              end
              object SyntaxMemo2: TSyntaxMemo
                Left = 0
                Top = 153
                Width = 185
                Height = 139
                Cursor = crArrow
                TabList.AsString = '4'
                NonPrinted.Font.Charset = DEFAULT_CHARSET
                NonPrinted.Font.Color = clSilver
                NonPrinted.Font.Height = -11
                NonPrinted.Font.Name = 'Consolas'
                NonPrinted.Font.Style = []
                LineNumbers.UnderColor = clBlack
                LineNumbers.Alignment = taLeftJustify
                LineNumbers.Font.Charset = DEFAULT_CHARSET
                LineNumbers.Font.Color = clWindowText
                LineNumbers.Font.Height = -9
                LineNumbers.Font.Name = 'Consolas'
                LineNumbers.Font.Style = []
                LineNumbers.Band = 1
                Gutter.Images = ImageList1
                Gutter.ExpandButtons.Data = {
                  FA000000424DFA000000000000007600000028000000180000000B0000000100
                  0400000000008400000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
                  60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
                  BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
                  00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
                  60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
                Gutter.Bands = <
                  item
                    Width = 15
                  end
                  item
                    Width = 15
                    Color = clInfoBk
                  end>
                Gutter.Objects = <
                  item
                    ImageIndex = 0
                    Margin = 0
                    Band = 0
                    Tag = 0
                    Line = 0
                    OnCheckLine = SyntaxMemo2TGutterObjects0CheckLine
                    OnClick = SyntaxMemo2TGutterObjects0Click
                  end>
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
                TabMode = tmDialog
                StaplePen.Color = clGray
                WordWrap = True
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
                DefaultStyles.CurrentLine.Font.Color = clHighlightText
                DefaultStyles.CurrentLine.Font.Height = -13
                DefaultStyles.CurrentLine.Font.Name = 'Consolas'
                DefaultStyles.CurrentLine.Font.Style = []
                DefaultStyles.CurrentLine.BgColor = clHighlight
                DefaultStyles.CurrentLine.FormatType = ftColor
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
                DefaultPopup = False
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
                Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soDisableSelection, soDrawCurLineFocus]
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
                Align = alClient
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Consolas'
                Font.Style = []
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 1
                TabStop = True
                OnKeyDown = SyntaxMemo2KeyDown
              end
            end
            object Panel6: TTntPanel
              Left = 187
              Top = 15
              Width = 219
              Height = 292
              Align = alClient
              BevelOuter = bvNone
              Caption = 'Panel6'
              TabOrder = 1
              object Label26: TTntLabel
                Left = 0
                Top = 0
                Width = 219
                Height = 15
                Align = alTop
                Alignment = taCenter
                AutoSize = False
                Caption = 'Keys list'
                Color = clActiveCaption
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clYellow
                Font.Height = -12
                Font.Name = 'Consolas'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object SyntaxMemo4: TSyntaxMemo
                Left = 0
                Top = 15
                Width = 219
                Height = 277
                TabList.AsString = '4'
                NonPrinted.Visible = True
                NonPrinted.Font.Charset = DEFAULT_CHARSET
                NonPrinted.Font.Color = clSilver
                NonPrinted.Font.Height = -11
                NonPrinted.Font.Name = 'Consolas'
                NonPrinted.Font.Style = []
                NonPrinted.LineBreakChar = ' '
                LineNumbers.Alignment = taLeftJustify
                LineNumbers.Font.Charset = DEFAULT_CHARSET
                LineNumbers.Font.Color = clWindowText
                LineNumbers.Font.Height = -9
                LineNumbers.Font.Name = 'Consolas'
                LineNumbers.Font.Style = []
                LineNumbers.Band = -1
                Gutter.Width = 20
                Gutter.ExpandButtons.Data = {
                  FA000000424DFA000000000000007600000028000000180000000B0000000100
                  0400000000008400000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
                  60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
                  BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
                  00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
                  60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
                TabMode = tmTabChar
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
                Options = [soOverwriteBlocks, soEnableBlockSel, soKeepCaretInText, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText]
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
                Align = alClient
                Ctl3D = True
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Consolas'
                Font.Style = []
                ParentColor = False
                ParentCtl3D = False
                ParentFont = False
                TabOrder = 0
                OnExit = Memo2Exit
              end
            end
          end
        end
      end
    end
    object TabSheet8: TTntTabSheet
      Caption = 'Sub lexers'
      ImageIndex = 5
      object Splitter4: TSplitter
        Left = 174
        Top = 0
        Height = 337
      end
      inline SyntColFrame4: TSyntColFrame
        Left = 0
        Top = 0
        Width = 174
        Height = 337
        Align = alLeft
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TabStop = True
        inherited LB: TListBox
          Width = 174
          Height = 290
        end
        inherited Panel1: TPanel
          Width = 174
        end
        inherited Panel2: TPanel
          Top = 315
          Width = 174
        end
      end
      object Panel8: TTntPanel
        Left = 177
        Top = 0
        Width = 416
        Height = 337
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object Label47: TTntLabel
          Left = 0
          Top = 205
          Width = 416
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Start condition'
          Color = clActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Splitter5: TSplitter
          Left = 0
          Top = 269
          Width = 416
          Height = 3
          Cursor = crVSplit
          Align = alTop
        end
        object Label49: TTntLabel
          Left = 0
          Top = 272
          Width = 416
          Height = 17
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'End condition'
          Color = clActiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clYellow
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object Panel9: TTntPanel
          Left = 0
          Top = 0
          Width = 416
          Height = 205
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            416
            205)
          object Label45: TTntLabel
            Left = 8
            Top = 32
            Width = 24
            Height = 13
            Caption = 'Style'
          end
          object Label46: TTntLabel
            Left = 8
            Top = 56
            Width = 59
            Height = 13
            Caption = 'Parent block'
          end
          object Label48: TTntLabel
            Left = 8
            Top = 8
            Width = 45
            Height = 13
            Caption = 'Sub lexer'
          end
          object ComboBox30: TComboBox
            Left = 120
            Top = 28
            Width = 280
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 1
            OnChange = ComboBox30Change
          end
          object ComboBox31: TComboBox
            Left = 120
            Top = 52
            Width = 280
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
            OnChange = ComboBox31Change
          end
          object CheckBox21: TTntCheckBox
            Left = 216
            Top = 92
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Strict parent block'
            TabOrder = 6
            OnClick = CheckBox21Click
          end
          object CheckBox22: TTntCheckBox
            Left = 216
            Top = 76
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Not a parent'
            TabOrder = 5
            OnClick = CheckBox22Click
          end
          object ComboBox32: TComboBox
            Left = 120
            Top = 4
            Width = 280
            Height = 21
            Style = csDropDownList
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 0
            OnChange = ComboBox32Change
          end
          object CheckBox23: TTntCheckBox
            Left = 8
            Top = 92
            Width = 193
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Start at the begin of text'
            TabOrder = 4
            OnClick = CheckBox23Click
          end
          object CheckBox24: TTntCheckBox
            Left = 8
            Top = 76
            Width = 193
            Height = 17
            Alignment = taLeftJustify
            Caption = 'End at the end of text'
            TabOrder = 3
            OnClick = CheckBox24Click
          end
          object CheckBox25: TTntCheckBox
            Left = 216
            Top = 108
            Width = 184
            Height = 17
            Alignment = taLeftJustify
            Anchors = [akTop, akRight]
            Caption = 'Always enabled'
            TabOrder = 7
            OnClick = CheckBox25Click
          end
          object CheckBox29: TTntCheckBox
            Left = 8
            Top = 108
            Width = 193
            Height = 17
            Alignment = taLeftJustify
            Caption = 'Include bound text'
            TabOrder = 8
            OnClick = CheckBox29Click
          end
          inline RuleStatesFrame1: TRuleStatesFrame
            Left = 0
            Top = 126
            Width = 416
            Height = 79
            Align = alBottom
            TabOrder = 9
            TabStop = True
            inherited GroupBox1: TGroupBox
              Width = 416
              inherited Label1: TLabel
                Width = 41
              end
              inherited Label2: TLabel
                Left = 239
                Width = 38
              end
              inherited Edit1: TEdit
                Left = 128
                Width = 57
              end
              inherited Edit2: TEdit
                Left = 351
                Width = 49
              end
            end
            inherited GroupBox2: TGroupBox
              Width = 416
              inherited Label3: TLabel
                Width = 20
              end
              inherited Label4: TLabel
                Left = 239
                Width = 32
              end
              inherited Edit3: TEdit
                Left = 128
                Width = 57
              end
              inherited Edit4: TEdit
                Left = 351
                Width = 49
              end
            end
          end
        end
        object SyntaxMemo6: TSyntaxMemo
          Left = 0
          Top = 289
          Width = 416
          Height = 48
          Lines.Strings = (
            'SyntaxMemo6')
          TabList.AsString = '4'
          NonPrinted.Font.Charset = DEFAULT_CHARSET
          NonPrinted.Font.Color = clSilver
          NonPrinted.Font.Height = -11
          NonPrinted.Font.Name = 'Consolas'
          NonPrinted.Font.Style = []
          LineNumbers.Alignment = taLeftJustify
          LineNumbers.Font.Charset = DEFAULT_CHARSET
          LineNumbers.Font.Color = clWindowText
          LineNumbers.Font.Height = -9
          LineNumbers.Font.Name = 'Consolas'
          LineNumbers.Font.Style = []
          LineNumbers.Band = -1
          Gutter.ExpandButtons.Data = {
            FA000000424DFA000000000000007600000028000000180000000B0000000100
            0400000000008400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
            60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
            BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
            00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
            60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
          Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soSmartCaret, soVariableHorzScrollBar]
          BorderStyle = bsNone
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
          Align = alClient
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 1
          OnExit = SyntaxMemo6Exit
        end
        object SyntaxMemo5: TSyntaxMemo
          Left = 0
          Top = 222
          Width = 416
          Height = 47
          Lines.Strings = (
            'SyntaxMemo5')
          TabList.AsString = '4'
          NonPrinted.Font.Charset = DEFAULT_CHARSET
          NonPrinted.Font.Color = clSilver
          NonPrinted.Font.Height = -11
          NonPrinted.Font.Name = 'Consolas'
          NonPrinted.Font.Style = []
          LineNumbers.Alignment = taLeftJustify
          LineNumbers.Font.Charset = DEFAULT_CHARSET
          LineNumbers.Font.Color = clWindowText
          LineNumbers.Font.Height = -9
          LineNumbers.Font.Name = 'Consolas'
          LineNumbers.Font.Style = []
          LineNumbers.Band = -1
          Gutter.ExpandButtons.Data = {
            FA000000424DFA000000000000007600000028000000180000000B0000000100
            0400000000008400000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
            60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
            BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
            00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
            60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
          Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soSmartCaret, soVariableHorzScrollBar]
          BorderStyle = bsNone
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
          Align = alTop
          Ctl3D = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Consolas'
          Font.Style = []
          ParentColor = False
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 2
          OnExit = SyntaxMemo5Exit
        end
      end
    end
    object TabSheet11: TTntTabSheet
      Caption = 'Grammar'
      ImageIndex = 7
      OnExit = TabSheet11Exit
      object Splitter6: TSplitter
        Left = 145
        Top = 0
        Width = 4
        Height = 337
      end
      object Panel1: TTntPanel
        Left = 0
        Top = 0
        Width = 145
        Height = 337
        Align = alLeft
        BevelOuter = bvNone
        Caption = 'Panel1'
        TabOrder = 0
        object TreeView1: TTreeView
          Left = 0
          Top = 25
          Width = 145
          Height = 312
          Align = alClient
          Indent = 19
          TabOrder = 0
          OnCustomDrawItem = TreeView1CustomDrawItem
        end
        object Panel10: TTntPanel
          Left = 0
          Top = 0
          Width = 145
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            145
            25)
          object SpeedButton3: TTntSpeedButton
            Left = 0
            Top = 0
            Width = 143
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            Caption = 'Compile gramma'
            Flat = True
            Glyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              04000000000080000000CE0E0000C40E00001000000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
              7777777777777777777777777744447777777777444444447777777444777744
              4777777447777774477777447777777744777744777777774477774477777777
              4477774477777777447777744777747447777774477774444777777777777444
              7777777777777444477777777777777777777777777777777777}
            ParentShowHint = False
            ShowHint = True
            OnClick = SpeedButton3Click
          end
        end
      end
      object SyntaxMemo9: TSyntaxMemo
        Left = 149
        Top = 0
        Width = 444
        Height = 337
        Lines.Strings = (
          'SyntaxMemo9')
        SyntaxAnalyzer = SyntAnalyzer2
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
        Gutter.Visible = False
        Gutter.Width = 20
        Gutter.ExpandButtons.Data = {
          FA000000424DFA000000000000007600000028000000180000000B0000000100
          0400000000008400000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
          60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
          BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
          00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
          60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
        Options = [soOverwriteBlocks, soEnableBlockSel, soHideSelection, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soVariableHorzScrollBar]
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
        Align = alClient
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Consolas'
        Font.Style = []
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
      end
    end
    object TabSheet10: TTntTabSheet
      Caption = 'Notes'
      ImageIndex = 6
      object SyntaxMemo8: TSyntaxMemo
        Left = 0
        Top = 0
        Width = 546
        Height = 337
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
        Gutter.Visible = False
        Gutter.ExpandButtons.Data = {
          FA000000424DFA000000000000007600000028000000180000000B0000000100
          0400000000008400000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00600000000000
          60000000000060BBBBBBBBB060EEEFFFEEE060BBBBBBBBB060EEEF0FEEE060BB
          BBBBBBB060EEEF0FEEE060FFFFFFFFF060FFFF0FFFF060F0000000F060F00000
          00F060FFFFFFFFF060FFFF0FFFF060BBBBBBBBB060EEEF0FEEE060BBBBBBBBB0
          60EEEF0FEEE060BBBBBBBBB060EEEFFFEEE0600000000000600000000000}
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
        Align = alClient
        Ctl3D = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        ParentColor = False
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  object Panel_Buttons: TTntPanel
    Left = 0
    Top = 563
    Width = 601
    Height = 31
    Align = alBottom
    BevelInner = bvLowered
    TabOrder = 1
    DesignSize = (
      601
      31)
    object Button9: TTntButton
      Left = 8
      Top = 4
      Width = 85
      Height = 23
      Caption = '&Export'
      TabOrder = 3
      OnClick = Button9Click
    end
    object Button8: TTntButton
      Left = 340
      Top = 4
      Width = 85
      Height = 23
      Anchors = [akTop, akRight]
      Caption = '&Apply'
      TabOrder = 0
      OnClick = Button8Click
    end
    object Button2: TTntButton
      Left = 516
      Top = 4
      Width = 85
      Height = 23
      Anchors = [akTop, akRight]
      Cancel = True
      Caption = '&Cancel'
      ModalResult = 2
      TabOrder = 2
    end
    object Button10: TTntButton
      Left = 96
      Top = 4
      Width = 85
      Height = 23
      Caption = '&Import'
      TabOrder = 4
      OnClick = Button10Click
    end
    object Button1: TTntButton
      Left = 428
      Top = 4
      Width = 85
      Height = 23
      Anchors = [akTop, akRight]
      Caption = '&OK'
      ModalResult = 1
      TabOrder = 1
    end
  end
  object Panel_Preview: TTntPanel
    Left = 0
    Top = 368
    Width = 601
    Height = 195
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object Splitter7: TSplitter
      Left = 121
      Top = 0
      Height = 195
    end
    object SyntaxMemo1: TSyntaxMemo
      Left = 124
      Top = 0
      Width = 477
      Height = 195
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
      LineNumbers.Band = 0
      LineNumbers.AutoSize = True
      Gutter.Width = 14
      Gutter.ExpandButtons.Data = {
        9E020000424D9E020000000000003600000028000000120000000B0000000100
        1800000000006802000000000000000000000000000000000000000080000080
        0000800000800000800000800000800000800000800000800000800000800000
        800000800000800000800000800000800000D3C2B0B59878B59878B59878B598
        78B59878B59878B59878D3C2B0D3C2B0B59878B59878B59878B59878B59878B5
        9878B59878D3C2B00000B59878BFCCD2AEBEC6A8B8C2A7B8C1A7B8C1A6B7C0AA
        BAC3B59878B59878BFCCD2AEBEC6A8B8C2A7B8C1A7B8C1A6B7C0AABAC3B59878
        0000B59878D9E1E4CFD8DCC9D3D8C7D2D7C6D1D6C0CCD2BBC8CFB59878B59878
        D9E1E4CFD8DCC9D3D8000000C6D1D6C0CCD2BBC8CFB598780000B59878EEF2F2
        ECF0F0E7EDEDE6EBECE3E9EAD9E0E3CCD6DBB59878B59878EEF2F2ECF0F0E7ED
        ED000000E3E9EAD9E0E3CCD6DBB598780000B59878F1F5F50000000000000000
        00000000000000D2DBDFB59878B59878F1F5F500000000000000000000000000
        0000D2DBDFB598780000B59878F5F7F7F5F7F7F4F7F7F4F7F7F4F6F6EBF0F1DA
        E1E5B59878B59878F5F7F7F5F7F7F4F7F7000000F4F6F6EBF0F1DAE1E5B59878
        0000B59878FBFCFCFBFDFDFBFDFDFBFDFDFBFCFCFAFCFCF3F6F7B59878B59878
        FBFCFCFBFDFDFBFDFD000000FBFCFCFAFCFCF3F6F7B598780000B59878FFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFB59878B59878FFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFB598780000D3C2B0B59878B59878B59878B598
        78B59878B59878B59878D3C2B0D3C2B0B59878B59878B59878B59878B59878B5
        9878B59878D3C2B0000000008000008000008000008000008000008000008000
        0080000080000080000080000080000080000080000080000080000080000080
        0000}
      Gutter.Bands = <
        item
          Width = 0
          Color = clBtnFace
          Gradient = True
        end
        item
          Width = 0
          Color = clWhite
        end
        item
          Width = 14
          Color = 16119285
          LeftBound = clBtnShadow
        end>
      Gutter.Objects = <>
      Gutter.ExpBtnBand = 2
      Gutter.CollapsePen.Color = clGray
      Gutter.AutoSize = True
      HintProps.Font.Charset = DEFAULT_CHARSET
      HintProps.Font.Color = clWindowText
      HintProps.Font.Height = -11
      HintProps.Font.Name = 'Consolas'
      HintProps.Font.Style = []
      HintProps.Color = 13041663
      HintProps.ShowHints = [shScroll, shCollapsed, shGutter, shTokens]
      UserRanges = <>
      TabMode = tmTabChar
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
      DefaultStyles.CurrentLine.FormatFlags = [ffBold, ffItalic, ffUnderline, ffStrikeOut]
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
      Options = [soOverwriteBlocks, soEnableBlockSel, soHideDynamic, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soScrollLastLine, soSmartCaret, soVariableHorzScrollBar]
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
      Align = alClient
      Ctl3D = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Consolas'
      Font.Style = []
      ParentColor = False
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
    end
    object SyntaxTreeView1: TSyntaxTreeView
      Left = 0
      Top = 0
      Width = 121
      Height = 195
      SyntaxMemo = SyntaxMemo1
      AutoSynchronize = False
      Align = alLeft
      Indent = 19
      TabOrder = 1
    end
  end
  object OD: TOpenDialog
    Left = 40
    Top = 152
  end
  object SD: TSaveDialog
    Left = 76
    Top = 152
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
      end
      item
        DisplayName = 'Marked block'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        BgColor = clHighlight
        FormatType = ftColor
      end>
    TokenRules = <>
    BlockRules = <>
    CodeTemplates = <>
    SubAnalyzers = <>
    TokenTypeNames.Strings = (
      'Unknown'
      'Comment'
      'Identifier'
      'Symbol'
      'String'
      'Integer const'
      'Float const'
      'Hex const'
      'Char const'
      'Preprocessor')
    MarkedBlockStyle = 'Marked block'
    DefaultStyleName = 'Default'
    Charset = DEFAULT_CHARSET
    Left = 144
    Top = 184
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    Left = 40
    Top = 184
  end
  object ImageList1: TImageList
    Height = 13
    Left = 76
    Top = 184
    Bitmap = {
      494C010106000900040010000D00FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001A0000000100200000000000001A
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C600000000000000000000000000000000000000000000000000000000000000
      0000FFFFFF00FFFFFF00FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      8400FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000848484000000
      0000C6C6C600FFFFFF00C6C6C6008484840084848400FFFFFF00C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000848484000000
      0000FFFFFF00C6C6C60084848400848484008484840084848400FFFFFF00C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF0000000000000000000000000000000000FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000848484000000
      0000C6C6C600FFFFFF0084848400848484008484840084848400C6C6C600FFFF
      FF00C6C6C600FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF000000000000000000FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C60000000000000000000000000000000000848484000000
      0000FFFFFF00C6C6C600FFFFFF008484840084848400C6C6C600FFFFFF00C6C6
      C600FFFFFF00FFFFFF0000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00C6C6C600FFFFFF00C6C6C600000000000000
      0000FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000084848400C6C6C600C6C6
      C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000000000
      00000000000000000000C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      000000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00C6C6C600C6C6
      C60000000000000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF0000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000C6C6
      C600FFFFFF00C6C6C60084848400C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00000000000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00C6C6C600848484008484840084848400C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      8400C6C6C600FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF000000000000000000000000000000000000000000FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000C6C6
      C6008484840084848400848484008484840084848400C6C6C600FFFFFF00C6C6
      C600C6C6C6000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF000000000000000000FFFFFF00000000000000000000000000FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF008484840084848400C6C6C600848484008484840084848400C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF0000000000FFFFFF00FFFFFF00FFFFFF00000000000000000000000000FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000C6C6
      C60084848400C6C6C600FFFFFF00C6C6C600848484008484840084848400C6C6
      C600C6C6C6000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF000000000000000000FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C6008484840084848400FFFF
      FF00C6C6C6000000000000000000000000000000000000000000848484000000
      0000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00C6C6C6000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0000000000FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000C6C6
      C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C60084848400C6C6
      C600C6C6C6000000000000000000000000000000000000000000000000008484
      840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00C6C6C600000000000000000000000000000000008484840000000000FFFF
      FF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFFFF00C6C6C600FFFF
      FF00C6C6C6000000000000000000000000000000000000000000000000008484
      84000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000
      0000C6C6C6000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000084848400000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000000000000000
      0000848484008484840000000000000000000000000000000000848484008484
      8400000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      28000000400000001A0000000100010000000000D00000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FC3FFC3F00000000
      F00FF00F00000000E007E00700000000E007E00700000000C003C00300000000
      C003C00300000000C003C00300000000C003C00300000000E007E00700000000
      E007E00700000000F00FF00F00000000FC3FFC3F00000000FFFFFFFFFFFFFFFF
      800780078007FC3F800780078007F00F800780078007E007800780078007E007
      800780078007C003800780078007C003800780078007C003800780078007C003
      800780078007E007800780078007E007800780078007F00F800780078007FC3F
      00000000000000000000000000000000000000000000}
  end
  object SyntAnalyzer2: TSyntAnalyzer
    Formats = <
      item
        DisplayName = 'Default'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        FormatType = ftCustomFont
      end
      item
        DisplayName = 'Marked block'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clHighlightText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        BgColor = clHighlight
        FormatType = ftColor
      end
      item
        DisplayName = 'Rule'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
      end
      item
        DisplayName = 'Term'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'TermNoCase'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Comment'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
      end
      item
        DisplayName = 'Symbol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clPurple
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Token type'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
      end
      item
        DisplayName = 'Rule def'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = [fsBold]
      end
      item
        DisplayName = 'Cur rule'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Consolas'
        Font.Style = []
        BgColor = 15794175
        FormatType = ftBackGround
      end>
    TokenRules = <
      item
        DisplayName = 'Comment 1'
        StyleName = 'Comment'
        Expression = '//.*'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Comment 2'
        StyleName = 'Comment'
        Expression = '(?s)/\*.*?(\*/|\Z)'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Term'
        StyleName = 'Term'
        TokenType = 1
        Expression = '".*?"'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'TermNoCase'
        StyleName = 'TermNoCase'
        TokenType = 2
        Expression = #39'.*?'#39#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Token rule'
        StyleName = 'Token type'
        TokenType = 7
        Expression = '<.*?(>|$)'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Rule'
        StyleName = 'Rule'
        TokenType = 3
        Expression = '\w+'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Equal'
        StyleName = 'Symbol'
        TokenType = 4
        Expression = '='#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Or'
        StyleName = 'Symbol'
        TokenType = 5
        Expression = '\|'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Rule stop'
        StyleName = 'Symbol'
        TokenType = 6
        Expression = ';'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'Repeater'
        StyleName = 'Symbol'
        Expression = '[\*\?\+]'#13#10
        ColumnFrom = 0
        ColumnTo = 0
      end
      item
        DisplayName = 'SubRule'
        StyleName = 'Symbol'
        TokenType = 8
        Expression = '[\(\)]'
        ColumnFrom = 0
        ColumnTo = 0
      end>
    BlockRules = <
      item
        DisplayName = 'Rule def'
        StyleName = 'Rule def'
        BlockType = btTagDetect
        ConditionList = <
          item
            TokenTypes = 16
          end
          item
            TokenTypes = 8
          end>
        IdentIndex = 1
        HighlightPos = cpAny
        IgnoreAsParent = False
      end
      item
        DisplayName = 'Rule start'
        StyleName = 'Cur rule'
        ConditionList = <
          item
            TokenTypes = 16
          end
          item
            TokenTypes = 8
          end>
        BlockOffset = 1
        BlockEnd = 'Rule end'
        EndOfTextClose = True
        Highlight = True
        InvertColors = True
        DisplayInTree = False
        DynHighlight = dhRange
        HighlightPos = cpRange
        CollapseFmt = '%s1 ...'
        SelfClose = True
        IgnoreAsParent = False
      end
      item
        DisplayName = 'Rule end'
        BlockType = btRangeEnd
        ConditionList = <
          item
            TokenTypes = 64
          end>
        HighlightPos = cpAny
        IgnoreAsParent = False
      end>
    CodeTemplates = <>
    SubAnalyzers = <>
    SampleText.Strings = (
      'skip = <Comment> | '
      '       <preprocessor>'
      ''
      'root = rule*;'
      ''
      'rule = <Rule> (<Equal> item+ branches*) <Stop>?;'
      ''
      'branches = <Or> item+;'
      ''
      'item =  <Rule> | '
      '        <Token rule ref.> | '
      '        <Term> | '
      '        <TermNoCase>;')
    TokenTypeNames.Strings = (
      'Comment'
      'Term'
      'TermNoCase'
      'Rule'
      'Equal'
      'Or'
      'Stop'
      'Token rule ref.'
      'SubRule')
    MarkedBlockStyle = 'Marked block'
    DefaultStyleName = 'Default'
    LexerName = 'Highlighter for gramma editor'
    Charset = DEFAULT_CHARSET
    Left = 144
    Top = 216
  end
  object AutoCompletePopup1: TAutoCompletePopup
    ShowWhenNone = False
    StartString = '<'
    OnCheckChar = AutoCompletePopup1CheckChar
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Consolas'
    Font.Style = []
    IntegralHeight = True
    ItemHeight = 16
    BgColor = clWindow
    SyntMemo = SyntaxMemo9
    Width = 200
    Height = 200
    ToolHint.Left = 0
    ToolHint.Top = 0
    ToolHint.Width = 0
    ToolHint.Height = 0
    Controls = <>
    Left = 144
    Top = 248
  end
  object DKLanguageController1: TDKLanguageController
    IgnoreList.Strings = (
      'SyntaxMemo*'
      'SyntaxTree*')
    SectionName = 'SyntLexerDlg'
    Left = 480
    Top = 392
    LangData = {
      0B00666D4C6578657250726F70010100000001000000070043617074696F6E01
      C4000000090053706C69747465723100000C0050616765436F6E74726F6C3100
      000900546162536865657435010100000002000000070043617074696F6E0006
      004C6162656C34010100000003000000070043617074696F6E0007004C616265
      6C3330010100000004000000070043617074696F6E0006004C6162656C320101
      00000005000000070043617074696F6E0006004C6162656C3301010000000600
      0000070043617074696F6E0006004C6162656C35010100000007000000070043
      617074696F6E0006004C6162656C36010100000008000000070043617074696F
      6E0006004C6162656C37010100000009000000070043617074696F6E0007004C
      6162656C333101010000000A000000070043617074696F6E0007004C6162656C
      353001010000000B000000070043617074696F6E000C0050616E656C5F436F6D
      6D6F6E000007004C6162656C333301010000000C000000070043617074696F6E
      0007004C6162656C333401010000000D000000070043617074696F6E00050045
      6469743300000500456469743400000A00436F6D626F426F78323200000A0043
      6865636B426F78313701010000000E000000070043617074696F6E000B005379
      6E7461784D656D6F3700000500456469743700000900436F6D626F426F783100
      000900436F6D626F426F783200000900436865636B426F783201010000000F00
      0000070043617074696F6E000900436865636B426F7833010100000010000000
      070043617074696F6E000900436F6D626F426F78370000060045646974313400
      000A00436865636B426F783238010100000011000000070043617074696F6E00
      0900436F6D626F426F783800000D00436861725365745F436F6D626F00000900
      546162536865657431010100000012000000070043617074696F6E000D005379
      6E74436F6C4672616D653100010B00000002004C420000060050616E656C3100
      000C005370656564427574746F6E31010100000013000000040048696E74000C
      005370656564427574746F6E36010100000014000000040048696E74000C0053
      70656564427574746F6E35010100000015000000040048696E74000C00537065
      6564427574746F6E34010100000016000000040048696E74000C005370656564
      427574746F6E33010100000017000000040048696E74000C0053706565644275
      74746F6E32010100000018000000040048696E74000C00537065656442757474
      6F6E37010100000019000000040048696E7400060050616E656C320000040045
      64697400000F0053796E745374796C654672616D653100012100000006004C61
      62656C3201010000001A000000070043617074696F6E0006004C6162656C3301
      010000001B000000070043617074696F6E0006004C6162656C3101010000001C
      000000070043617074696F6E0006004C6162656C3401010000001D0000000700
      43617074696F6E0006004C6162656C3901010000001E00000007004361707469
      6F6E000900436F6C6F72426F783101010000001F000000040048696E74000700
      427574746F6E33010100000020000000070043617074696F6E000900436F6C6F
      72426F7832010100000021000000040048696E7400090047726F7570426F7831
      010200000023000000070043617074696F6E22000000040048696E7400090043
      6865636B426F7832010200000025000000070043617074696F6E240000000400
      48696E74000900436865636B426F783301020000002700000007004361707469
      6F6E26000000040048696E74000900436865636B426F78340102000000290000
      00070043617074696F6E28000000040048696E74000900436865636B426F7835
      01020000002B000000070043617074696F6E2A000000040048696E7400090043
      6F6D626F426F783101020000002C000000040048696E742D0000000500497465
      6D73000900436F6D626F426F783201020000002E000000040048696E742F0000
      0005004974656D73000900436865636B426F7831010200000031000000070043
      617074696F6E30000000040048696E7400090047726F7570426F783201010000
      0032000000070043617074696F6E0006004C6162656C35010100000033000000
      070043617074696F6E0006004C6162656C360101000000340000000700436170
      74696F6E0006004C6162656C37010100000035000000070043617074696F6E00
      06004C6162656C38010100000036000000070043617074696F6E000900436F6C
      6F72426F7833010100000037000000040048696E74000900436F6D626F426F78
      33010200000038000000040048696E743900000005004974656D73000900436F
      6C6F72426F783401010000003A000000040048696E74000900436F6D626F426F
      783401020000003B000000040048696E743C00000005004974656D7300090043
      6F6C6F72426F783501010000003D000000040048696E74000900436F6D626F42
      6F783501020000003E000000040048696E743F00000005004974656D73000900
      436F6C6F72426F7836010100000040000000040048696E74000900436F6D626F
      426F7836010200000041000000040048696E744200000005004974656D730009
      00436865636B426F7836010200000044000000070043617074696F6E43000000
      040048696E74000900436865636B426F78370102000000460000000700436170
      74696F6E45000000040048696E74000900436F6D626F426F7837010200000047
      000000040048696E744800000005004974656D73000B00466F6E744469616C6F
      673100000900546162536865657432010100000049000000070043617074696F
      6E00090053706C69747465723300000D0053796E74436F6C4672616D65320001
      0B00000002004C420000060050616E656C3100000C005370656564427574746F
      6E3101010000004A000000040048696E74000C005370656564427574746F6E36
      01010000004B000000040048696E74000C005370656564427574746F6E350101
      0000004C000000040048696E74000C005370656564427574746F6E3401010000
      004D000000040048696E74000C005370656564427574746F6E3301010000004E
      000000040048696E74000C005370656564427574746F6E3201010000004F0000
      00040048696E74000C005370656564427574746F6E3701010000005000000004
      0048696E7400060050616E656C3200000400456469740000060050616E656C33
      000007004C6162656C3232010100000051000000070043617074696F6E000B00
      53796E7461784D656D6F330000060050616E656C34000007004C6162656C3231
      010100000052000000070043617074696F6E0007004C6162656C323901010000
      0053000000070043617074696F6E0007004C6162656C33350101000000540000
      00070043617074696F6E0007004C6162656C3131010100000055000000070043
      617074696F6E0007004C6162656C313201010000005600000007004361707469
      6F6E0007004C6162656C3133010100000057000000070043617074696F6E000A
      00436F6D626F426F78323400000A00436F6D626F426F78313701010000005800
      000005004974656D73000A00436F6D626F426F78323100000900436865636B42
      6F7838010100000059000000070043617074696F6E000A00436865636B426F78
      313801010000005A000000070043617074696F6E000A00436865636B426F7832
      3701010000005B000000070043617074696F6E00060045646974313000000600
      4564697431310000100052756C655374617465734672616D653200010A000000
      090047726F7570426F783101010000005E000000070043617074696F6E000600
      4C6162656C3101010000005F000000070043617074696F6E0006004C6162656C
      32010100000060000000070043617074696F6E00050045646974310000050045
      646974320000090047726F7570426F7832010100000061000000070043617074
      696F6E0006004C6162656C33010100000062000000070043617074696F6E0006
      004C6162656C34010100000063000000070043617074696F6E00050045646974
      3300000500456469743400000900546162536865657433010100000064000000
      070043617074696F6E00090053706C69747465723200000D0053796E74436F6C
      4672616D653300010B00000002004C420000060050616E656C3100000C005370
      656564427574746F6E31010100000065000000040048696E74000C0053706565
      64427574746F6E36010100000066000000040048696E74000C00537065656442
      7574746F6E35010100000067000000040048696E74000C005370656564427574
      746F6E34010100000068000000040048696E74000C005370656564427574746F
      6E33010100000069000000040048696E74000C005370656564427574746F6E32
      01010000006A000000040048696E74000C005370656564427574746F6E370101
      0000006B000000040048696E7400060050616E656C3200000400456469740000
      0C0050616765436F6E74726F6C32000009005461625368656574370101000000
      6C000000070043617074696F6E0006004C6162656C3101010000006D00000007
      0043617074696F6E0007004C6162656C323001010000006E0000000700436170
      74696F6E0007004C6162656C323801010000006F000000070043617074696F6E
      0007004C6162656C3336010100000070000000070043617074696F6E0007004C
      6162656C3337010100000071000000070043617074696F6E0006004C6162656C
      38010100000072000000070043617074696F6E0007004C6162656C3130010100
      000073000000070043617074696F6E0007004C6162656C313401010000007400
      0000070043617074696F6E0007004C6162656C31350101000000750000000700
      43617074696F6E0007004C6162656C3233010100000076000000070043617074
      696F6E000A00436865636B426F78313301010000007700000007004361707469
      6F6E000900436865636B426F7839010100000078000000070043617074696F6E
      000500456469743100000500456469743200000A00436F6D626F426F78323300
      000A00436F6D626F426F78323501010000007900000005004974656D73000A00
      436F6D626F426F78323600000900436865636B426F783701010000007A000000
      070043617074696F6E000A00436865636B426F78313901010000007B00000007
      0043617074696F6E000A00436865636B426F78323001010000007C0000000700
      43617074696F6E000A00436865636B426F78323601010000007D000000070043
      617074696F6E000500456469743800000900436F6D626F426F78330000090043
      6F6D626F426F783400000A00436F6D626F426F78313801010000007E00000005
      004974656D7300100052756C655374617465734672616D653300010A00000009
      0047726F7570426F783101010000007F000000070043617074696F6E0006004C
      6162656C31010100000080000000070043617074696F6E0006004C6162656C32
      010100000081000000070043617074696F6E0005004564697431000005004564
      6974320000090047726F7570426F783201010000008200000007004361707469
      6F6E0006004C6162656C33010100000083000000070043617074696F6E000600
      4C6162656C34010100000084000000070043617074696F6E0005004564697433
      00000500456469743400000A0054616253686565743132010100000085000000
      070043617074696F6E0007004C6162656C333801010000008600000007004361
      7074696F6E0007004C6162656C3339010100000087000000070043617074696F
      6E0006004C6162656C39010100000088000000070043617074696F6E0007004C
      6162656C3432010100000089000000070043617074696F6E0005004564697435
      00000500456469743600000500456469743900000A00436865636B426F783131
      01010000008A000000070043617074696F6E000900436865636B426F78340101
      0000008B000000070043617074696F6E000900436865636B426F783501010000
      008C000000070043617074696F6E000900436865636B426F783601010000008D
      000000070043617074696F6E000A00436865636B426F78313201010000008E00
      0000070043617074696F6E000900436865636B426F783101010000008F000000
      070043617074696F6E000A00436865636B426F78333101010000009000000007
      0043617074696F6E000C0053796E7461784D656D6F313000000A00436F6D626F
      426F78313001010000009100000005004974656D730009005461625368656574
      39010100000092000000070043617074696F6E0007004C6162656C3237010100
      000093000000070043617074696F6E0007004C6162656C343401010000009400
      0000070043617074696F6E000A00436F6D626F426F78323000000A0043686563
      6B426F783134010100000095000000070043617074696F6E000A00436865636B
      426F783135010100000096000000070043617074696F6E00090047726F757042
      6F7834010100000097000000070043617074696F6E0007004C6162656C343301
      0100000098000000070043617074696F6E000A00436F6D626F426F7832380101
      0000009900000005004974656D73000A00436865636B426F7831360101000000
      9A000000070043617074696F6E000A00436F6D626F426F78323901010000009B
      00000005004974656D7300090047726F7570426F783201010000009C00000007
      0043617074696F6E0007004C6162656C313601010000009D0000000700436170
      74696F6E0007004C6162656C313701010000009E000000070043617074696F6E
      0007004C6162656C313801010000009F000000070043617074696F6E0007004C
      6162656C31390101000000A0000000070043617074696F6E000900436F6D626F
      426F783500000900436F6D626F426F7836000006004564697431320000060045
      64697431330000090047726F7570426F78310101000000A10000000700436170
      74696F6E0007004C6162656C33320101000000A2000000070043617074696F6E
      0007004C6162656C34300101000000A3000000070043617074696F6E0007004C
      6162656C34310101000000A4000000070043617074696F6E000A00436865636B
      426F7833300101000000A5000000070043617074696F6E000600456469743135
      00000900436F6C6F72426F783100000900436F6D626F426F78390101000000A7
      00000005004974656D730009005461625368656574340101000000A800000007
      0043617074696F6E00090047726F7570426F78350101000000A9000000070043
      617074696F6E00060050616E656C350000060050616E656C37000007004C6162
      656C32340101000000AA000000070043617074696F6E000C0053706565644275
      74746F6E3100000C005370656564427574746F6E32000007004C6162656C3235
      0101000000AB000000070043617074696F6E0008004C697374426F783100000A
      00436865636B426F7831300101000000AC000000070043617074696F6E000A00
      436F6D626F426F7831390101000000AD00000005004974656D73000B0053796E
      7461784D656D6F320000060050616E656C360101000000AE0000000700436170
      74696F6E0007004C6162656C32360101000000AF000000070043617074696F6E
      000B0053796E7461784D656D6F34000009005461625368656574380101000000
      B0000000070043617074696F6E00090053706C69747465723400000D0053796E
      74436F6C4672616D653400010B00000002004C420000060050616E656C310000
      0C005370656564427574746F6E310101000000B1000000040048696E74000C00
      5370656564427574746F6E360101000000B2000000040048696E74000C005370
      656564427574746F6E350101000000B3000000040048696E74000C0053706565
      64427574746F6E340101000000B4000000040048696E74000C00537065656442
      7574746F6E330101000000B5000000040048696E74000C005370656564427574
      746F6E320101000000B6000000040048696E74000C005370656564427574746F
      6E370101000000B7000000040048696E7400060050616E656C32000004004564
      69740000060050616E656C38000007004C6162656C34370101000000B8000000
      070043617074696F6E00090053706C697474657235000007004C6162656C3439
      0101000000B9000000070043617074696F6E00060050616E656C39000007004C
      6162656C34350101000000BA000000070043617074696F6E0007004C6162656C
      34360101000000BB000000070043617074696F6E0007004C6162656C34380101
      000000BC000000070043617074696F6E000A00436F6D626F426F78333000000A
      00436F6D626F426F78333100000A00436865636B426F7832310101000000BD00
      0000070043617074696F6E000A00436865636B426F7832320101000000BE0000
      00070043617074696F6E000A00436F6D626F426F78333200000A00436865636B
      426F7832330101000000BF000000070043617074696F6E000A00436865636B42
      6F7832340101000000C0000000070043617074696F6E000A00436865636B426F
      7832350101000000C1000000070043617074696F6E000A00436865636B426F78
      32390101000000C2000000070043617074696F6E00100052756C655374617465
      734672616D653100010A000000090047726F7570426F78310101000000C30000
      00070043617074696F6E0006004C6162656C310101000000C400000007004361
      7074696F6E0006004C6162656C320101000000C5000000070043617074696F6E
      00050045646974310000050045646974320000090047726F7570426F78320101
      000000C6000000070043617074696F6E0006004C6162656C330101000000C700
      0000070043617074696F6E0006004C6162656C340101000000C8000000070043
      617074696F6E000500456469743300000500456469743400000B0053796E7461
      784D656D6F3600000B0053796E7461784D656D6F3500000A0054616253686565
      7431310101000000C9000000070043617074696F6E00090053706C6974746572
      360000060050616E656C310101000000CA000000070043617074696F6E000900
      5472656556696577310000070050616E656C313000000C005370656564427574
      746F6E330101000000CB000000070043617074696F6E000B0053796E7461784D
      656D6F3900000A00546162536865657431300101000000D40000000700436170
      74696F6E000B0053796E7461784D656D6F3800000D0050616E656C5F42757474
      6F6E7300000700427574746F6E390101000000D5000000070043617074696F6E
      000700427574746F6E380101000000D6000000070043617074696F6E00070042
      7574746F6E320101000000D7000000070043617074696F6E000800427574746F
      6E31300101000000D8000000070043617074696F6E000700427574746F6E3101
      01000000D9000000070043617074696F6E000D0050616E656C5F507265766965
      770000090053706C69747465723700000B0053796E7461784D656D6F3100000F
      0053796E746178547265655669657731000002004F4400000200534400000500
      4653796E740105000000E4000000100044656661756C745374796C654E616D65
      E00000001600466F726D6174735B305D2E446973706C61794E616D65E1000000
      1600466F726D6174735B315D2E446973706C61794E616D65E300000010004D61
      726B6564426C6F636B5374796C65E20000000E00546F6B656E547970654E616D
      6573000B00466F6E744469616C6F673100000A00496D6167654C697374310000
      0D0053796E74416E616C797A657232012E000000070100001900426C6F636B52
      756C65735B305D2E446973706C61794E616D65080100001700426C6F636B5275
      6C65735B305D2E5374796C654E616D650B0100001600426C6F636B52756C6573
      5B315D2E426C6F636B456E640C0100001900426C6F636B52756C65735B315D2E
      436F6C6C61707365466D74090100001900426C6F636B52756C65735B315D2E44
      6973706C61794E616D650A0100001700426C6F636B52756C65735B315D2E5374
      796C654E616D650D0100001900426C6F636B52756C65735B325D2E446973706C
      61794E616D6511010000100044656661756C745374796C654E616D65E5000000
      1600466F726D6174735B305D2E446973706C61794E616D65E60000001600466F
      726D6174735B315D2E446973706C61794E616D65E70000001600466F726D6174
      735B325D2E446973706C61794E616D65E80000001600466F726D6174735B335D
      2E446973706C61794E616D65E90000001600466F726D6174735B345D2E446973
      706C61794E616D65EA0000001600466F726D6174735B355D2E446973706C6179
      4E616D65EB0000001600466F726D6174735B365D2E446973706C61794E616D65
      EC0000001600466F726D6174735B375D2E446973706C61794E616D65ED000000
      1600466F726D6174735B385D2E446973706C61794E616D65EE0000001600466F
      726D6174735B395D2E446973706C61794E616D651201000009004C657865724E
      616D651001000010004D61726B6564426C6F636B5374796C650E0100000A0053
      616D706C6554657874EF0000001900546F6B656E52756C65735B305D2E446973
      706C61794E616D65F00000001700546F6B656E52756C65735B305D2E5374796C
      654E616D65050100001A00546F6B656E52756C65735B31305D2E446973706C61
      794E616D65060100001800546F6B656E52756C65735B31305D2E5374796C654E
      616D65F10000001900546F6B656E52756C65735B315D2E446973706C61794E61
      6D65F30000001800546F6B656E52756C65735B315D2E45787072657373696F6E
      F20000001700546F6B656E52756C65735B315D2E5374796C654E616D65F40000
      001900546F6B656E52756C65735B325D2E446973706C61794E616D65F5000000
      1700546F6B656E52756C65735B325D2E5374796C654E616D65F6000000190054
      6F6B656E52756C65735B335D2E446973706C61794E616D65F70000001700546F
      6B656E52756C65735B335D2E5374796C654E616D65F80000001900546F6B656E
      52756C65735B345D2E446973706C61794E616D65F90000001700546F6B656E52
      756C65735B345D2E5374796C654E616D65FA0000001900546F6B656E52756C65
      735B355D2E446973706C61794E616D65FC0000001800546F6B656E52756C6573
      5B355D2E45787072657373696F6EFB0000001700546F6B656E52756C65735B35
      5D2E5374796C654E616D65FD0000001900546F6B656E52756C65735B365D2E44
      6973706C61794E616D65FE0000001700546F6B656E52756C65735B365D2E5374
      796C654E616D65FF0000001900546F6B656E52756C65735B375D2E446973706C
      61794E616D65000100001700546F6B656E52756C65735B375D2E5374796C654E
      616D65010100001900546F6B656E52756C65735B385D2E446973706C61794E61
      6D65020100001700546F6B656E52756C65735B385D2E5374796C654E616D6503
      0100001900546F6B656E52756C65735B395D2E446973706C61794E616D650401
      00001700546F6B656E52756C65735B395D2E5374796C654E616D650F0100000E
      00546F6B656E547970654E616D65730012004175746F436F6D706C657465506F
      70757031000101000000040048696E740000140048797065726C696E6B486967
      686C696768746572010A00000013010000140052756C65735B305D2E44697370
      6C61794E616D6514010000130052756C65735B305D2E45787072657373696F6E
      15010000140052756C65735B315D2E446973706C61794E616D65160100001300
      52756C65735B315D2E45787072657373696F6E17010000150052756C65735B31
      5D2E5368656C6C436F6D6D616E6418010000140052756C65735B325D2E446973
      706C61794E616D6519010000130052756C65735B325D2E45787072657373696F
      6E1A010000140052756C65735B335D2E446973706C61794E616D651B01000013
      0052756C65735B335D2E45787072657373696F6E1C010000150052756C65735B
      335D2E5368656C6C436F6D6D616E6400}
  end
  object HyperlinkHighlighter: THyperlinkHighlighter
    Rules = <
      item
        DisplayName = 'http & ftp'
        Expression = 
          '(https?|ftp):// (\w+\:\w+@)? [\w\d\-]+(\.[\w\d\-]+)+(:\d\d?\d?\d' +
          '?\d?)?(((/~?[%+\w\d\-\\\.,=]*)+)*)(\?[^\s="'#39']+=[^\s=&"'#39']+(&[^\s=' +
          '&"'#39']+ =?([^\s=&"'#39']+)? )*)?((\#|=)[\w\d\-=,%+]+)?'
        ShellCommand = '\0'
      end
      item
        DisplayName = 'http (www)'
        Expression = 
          'www(\.[\w\d\-]+)+(:\d\d?\d?\d?\d?)?(((/[%+\w\d\-\\\.]*)+)*)(\?[^' +
          '\s=&"]+=?[^\s=&"]+(&[^\s=&"]+=[^\s=&"]+)*)?(\#[\w\d\-%+]+)?'
        ShellCommand = 'http://\0'
      end
      item
        DisplayName = 'e-mail (mailto)'
        Expression = 'mailto:\s*[_a-z\d\-\.]+@[_a-z\d\-]+(\.[_a-z\d\-]+)+'
        ShellCommand = '\0'
      end
      item
        DisplayName = 'e-mail'
        Expression = '\b[_a-z\d\-\.]+@[_a-z\d\-]+(\.[_a-z\d\-]+)+'
        ShellCommand = 'mailto:\0'
      end>
    Style.Font.Charset = DEFAULT_CHARSET
    Style.Font.Color = clBlue
    Style.Font.Height = -13
    Style.Font.Name = 'Consolas'
    Style.Font.Style = [fsUnderline]
    Editor = SyntaxMemo8
    Left = 44
    Top = 216
  end
end
