object Form1: TForm1
  Left = 192
  Top = 122
  ActiveControl = s
  AutoScroll = False
  Caption = 'Form1'
  ClientHeight = 446
  ClientWidth = 937
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 723
    Top = 0
    Width = 12
    Height = 388
    Align = alRight
  end
  object s: TSyntaxMemo
    Left = 0
    Top = 0
    Width = 723
    Height = 388
    TextSource = SyntTextSource1
    TabList.AsString = '4'
    NonPrinted.Font.Charset = DEFAULT_CHARSET
    NonPrinted.Font.Color = clSilver
    NonPrinted.Font.Height = -11
    NonPrinted.Font.Name = 'MS Sans Serif'
    NonPrinted.Font.Style = []
    LineNumbers.Font.Charset = DEFAULT_CHARSET
    LineNumbers.Font.Color = clWindowText
    LineNumbers.Font.Height = -9
    LineNumbers.Font.Name = 'Courier New'
    LineNumbers.Font.Style = []
    LineNumbers.Band = -1
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
        Width = 5
      end>
    Gutter.Objects = <>
    Gutter.ExpBtnBand = -1
    Gutter.CollapsePen.Color = clGray
    Gutter.AutoSize = False
    HintProps.Font.Charset = DEFAULT_CHARSET
    HintProps.Font.Color = clWindowText
    HintProps.Font.Height = -11
    HintProps.Font.Name = 'MS Sans Serif'
    HintProps.Font.Style = []
    HintProps.Color = 13041663
    HintProps.ShowHints = [shCollapsed, shGutter, shTokens]
    UserRanges = <>
    TabMode = tmTabChar
    StaplePen.Color = clGray
    DefaultStyles.SelectioMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SelectioMark.Font.Color = clHighlightText
    DefaultStyles.SelectioMark.Font.Height = -13
    DefaultStyles.SelectioMark.Font.Name = 'Courier New'
    DefaultStyles.SelectioMark.Font.Style = []
    DefaultStyles.SelectioMark.BgColor = clHighlight
    DefaultStyles.SelectioMark.FormatType = ftColor
    DefaultStyles.SearchMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.SearchMark.Font.Color = clWhite
    DefaultStyles.SearchMark.Font.Height = -13
    DefaultStyles.SearchMark.Font.Name = 'Courier New'
    DefaultStyles.SearchMark.Font.Style = []
    DefaultStyles.SearchMark.BgColor = clBlack
    DefaultStyles.SearchMark.FormatType = ftColor
    DefaultStyles.CurrentLine.Enabled = False
    DefaultStyles.CurrentLine.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CurrentLine.Font.Color = clWindowText
    DefaultStyles.CurrentLine.Font.Height = -13
    DefaultStyles.CurrentLine.Font.Name = 'Courier New'
    DefaultStyles.CurrentLine.Font.Style = []
    DefaultStyles.CurrentLine.FormatType = ftBackGround
    DefaultStyles.CollapseMark.Font.Charset = DEFAULT_CHARSET
    DefaultStyles.CollapseMark.Font.Color = clSilver
    DefaultStyles.CollapseMark.Font.Height = -13
    DefaultStyles.CollapseMark.Font.Name = 'Courier New'
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
    LineStateDisplay.Band = 0
    SyncEditing.SyncRangeStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.SyncRangeStyle.Font.Color = clWindowText
    SyncEditing.SyncRangeStyle.Font.Height = -13
    SyncEditing.SyncRangeStyle.Font.Name = 'Courier New'
    SyncEditing.SyncRangeStyle.Font.Style = []
    SyncEditing.SyncRangeStyle.BgColor = 14745568
    SyncEditing.SyncRangeStyle.FormatType = ftBackGround
    SyncEditing.ActiveWordsStyle.Font.Charset = DEFAULT_CHARSET
    SyncEditing.ActiveWordsStyle.Font.Color = clWindowText
    SyncEditing.ActiveWordsStyle.Font.Height = -13
    SyncEditing.ActiveWordsStyle.Font.Name = 'Courier New'
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
    SyncEditing.InactiveWordsStyle.Font.Name = 'Courier New'
    SyncEditing.InactiveWordsStyle.Font.Style = []
    SyncEditing.InactiveWordsStyle.FormatType = ftBackGround
    SyncEditing.InactiveWordsStyle.BorderTypeBottom = blSolid
    SyncEditing.InactiveWordsStyle.BorderColorBottom = clBtnFace
    Options = [soOverwriteBlocks, soEnableBlockSel, soAutoIndentMode, soBackUnindent, soGroupUndo, soDragText, soFloatMarkers, soAlwaysShowCaret, soScrollLastLine]
    HorzRuler.Font.Charset = DEFAULT_CHARSET
    HorzRuler.Font.Color = clWindowText
    HorzRuler.Font.Height = -11
    HorzRuler.Font.Name = 'MS Sans Serif'
    HorzRuler.Font.Style = []
    TextMargins = <
      item
        Pen.Color = clSilver
        RulerMark = False
      end>
    Caret.Insert.Width = -2
    Caret.Overwrite.Width = 100
    Caret.ReadOnly.Width = -1
    Caret.Custom.Width = 2
    Caret.Custom.Color = clGradientActiveCaption
    Caret.Custom.BlinkTime = 1000
    Caret.UseCustom = True
    Transparent = False
    Alignment = taLeftJustify
    Align = alClient
    Ctl3D = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Courier New'
    Font.Style = []
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnChange = sChange
    OnAfterLineDraw = sAfterLineDraw
    OnScroll = sScroll
    OnExit = sExit
    OnResize = sResize
  end
  object Panel1: TPanel
    Left = 735
    Top = 0
    Width = 192
    Height = 388
    Align = alRight
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 388
    Width = 937
    Height = 58
    Align = alBottom
    Caption = 'Panel2'
    TabOrder = 2
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 16
      Height = 13
      Caption = 'file:'
    end
    object Label2: TLabel
      Left = 16
      Top = 32
      Width = 26
      Height = 13
      Caption = 'lexlib:'
    end
    object Label3: TLabel
      Left = 512
      Top = 8
      Width = 32
      Height = 13
      Caption = 'Label3'
    end
    object Label4: TLabel
      Left = 504
      Top = 36
      Width = 8
      Height = 13
      Caption = '%'
    end
    object Edit1: TEdit
      Left = 80
      Top = 4
      Width = 193
      Height = 21
      TabOrder = 0
      Text = 'D:\T\Txt\main.css'
    end
    object Edit2: TEdit
      Left = 80
      Top = 28
      Width = 193
      Height = 21
      TabOrder = 1
      Text = 'd:\s\hl\LexLib.lxl'
    end
    object Button1: TButton
      Left = 280
      Top = 4
      Width = 75
      Height = 25
      Caption = 'Open'
      TabOrder = 2
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 360
      Top = 4
      Width = 75
      Height = 25
      Caption = 'unsync'
      TabOrder = 3
      OnClick = Button2Click
    end
    object ColorBox1: TColorBox
      Left = 440
      Top = 8
      Width = 121
      Height = 22
      ItemHeight = 16
      TabOrder = 4
      OnChange = ColorBox1Change
    end
    object SpinEdit1: TSpinEdit
      Left = 440
      Top = 32
      Width = 57
      Height = 22
      Increment = 5
      MaxValue = 60
      MinValue = 10
      TabOrder = 5
      Value = 30
      OnChange = SpinEdit1Change
    end
    object CheckBox1: TCheckBox
      Left = 592
      Top = 8
      Width = 97
      Height = 17
      Caption = 'Vert'
      TabOrder = 6
      OnClick = CheckBox1Click
    end
    object CheckBox2: TCheckBox
      Left = 592
      Top = 24
      Width = 97
      Height = 17
      Caption = 'Horz'
      TabOrder = 7
      OnClick = CheckBox1Click
    end
    object Button3: TButton
      Left = 280
      Top = 33
      Width = 75
      Height = 25
      Caption = 'BeginUpd'
      TabOrder = 8
      OnClick = Button3Click
    end
  end
  object PanelTest: TPanel
    Left = 927
    Top = 0
    Width = 10
    Height = 388
    Align = alRight
    TabOrder = 3
    object Box1: TPaintBox
      Left = 1
      Top = 1
      Width = 8
      Height = 386
      Align = alClient
      ParentShowHint = False
      ShowHint = True
      OnClick = Box1Click
      OnMouseMove = Box1MouseMove
    end
  end
  object sm: TSyntaxManager
    MenuPlainText = 'Plain Text'
    Left = 328
    Top = 188
  end
  object SyntTextSource1: TSyntTextSource
    Left = 360
    Top = 188
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 392
    Top = 188
  end
end
