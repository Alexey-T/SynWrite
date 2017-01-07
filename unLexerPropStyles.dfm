object SyntStyleFrame: TfmLexerPropStyles
  Left = 0
  Top = 0
  Width = 289
  Height = 334
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  ParentFont = False
  TabOrder = 0
  TabStop = True
  object Label2: TTntLabel
    Left = 8
    Top = 45
    Width = 56
    Height = 13
    Caption = '&Background'
    FocusControl = ColorBox1
  end
  object Label3: TTntLabel
    Left = 150
    Top = 45
    Width = 48
    Height = 13
    Caption = '&Font color'
    FocusControl = ColorBox2
  end
  object Label1: TTntLabel
    Left = 8
    Top = 4
    Width = 49
    Height = 13
    Caption = '&Style type'
    FocusControl = ComboBox1
  end
  object Label4: TTntLabel
    Left = 150
    Top = 4
    Width = 84
    Height = 13
    Caption = '&Vertical alignment'
    FocusControl = ComboBox2
  end
  object Label9: TTntLabel
    Left = 152
    Top = 120
    Width = 96
    Height = 13
    Caption = 'Ca&pitalization effect'
    FocusControl = CheckBox7
    Visible = False
  end
  object ColorBox1: TColorBox
    Left = 8
    Top = 60
    Width = 134
    Height = 22
    Hint = 'Specifies background color.'
    DefaultColorColor = clWhite
    NoneColorColor = clWhite
    Style = [cbStandardColors, cbExtendedColors, cbIncludeNone, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 2
    OnChange = ColorBox1Change
  end
  object Button3: TTntButton
    Left = 152
    Top = 92
    Width = 125
    Height = 25
    Caption = 'Se&t custom font ...'
    TabOrder = 5
    OnClick = Button3Click
  end
  object ColorBox2: TColorBox
    Left = 150
    Top = 60
    Width = 134
    Height = 22
    Hint = 'Specifies font color.'
    DefaultColorColor = clWhite
    NoneColorColor = clWhite
    Style = [cbStandardColors, cbExtendedColors, cbIncludeNone, cbCustomColor, cbPrettyNames]
    ItemHeight = 16
    TabOrder = 3
    OnChange = ColorBox2Change
  end
  object GroupBox1: TTntGroupBox
    Left = 8
    Top = 88
    Width = 137
    Height = 85
    Hint = 'Specifies which properties of the style should be used.'
    Caption = 'Font style'
    TabOrder = 4
    object CheckBox2: TTntCheckBox
      Left = 8
      Top = 16
      Width = 121
      Height = 17
      Hint = 'Specifies whether Bold font style is used. '
      AllowGrayed = True
      Caption = 'Bo&ld'
      TabOrder = 0
      OnClick = CheckBox2Click
    end
    object CheckBox3: TTntCheckBox
      Left = 8
      Top = 32
      Width = 121
      Height = 17
      Hint = 'Specifies whether Italic font style is used. '
      AllowGrayed = True
      Caption = '&Italic'
      TabOrder = 1
      OnClick = CheckBox2Click
    end
    object CheckBox4: TTntCheckBox
      Left = 8
      Top = 48
      Width = 121
      Height = 17
      Hint = 'Specifies whether Underline font style is used. '
      AllowGrayed = True
      Caption = '&Underline'
      TabOrder = 2
      OnClick = CheckBox2Click
    end
    object CheckBox5: TTntCheckBox
      Left = 8
      Top = 64
      Width = 121
      Height = 17
      Hint = 'Specifies whether StrikeOut font style is used. '
      AllowGrayed = True
      Caption = 'S&trike out'
      TabOrder = 3
      OnClick = CheckBox2Click
    end
  end
  object ComboBox1: TTntComboBox
    Left = 8
    Top = 20
    Width = 134
    Height = 21
    Hint = 'Specifies style properties that can be applied to the Canvas.'
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 0
    OnChange = ComboBox1Change
    Items.Strings = (
      'Custom font'
      'Font style & colors'
      'Back- and Fore-ground'
      'Only Background')
  end
  object ComboBox2: TTntComboBox
    Left = 150
    Top = 20
    Width = 134
    Height = 21
    Hint = 'Specifies vertical alignment of the text.'
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 1
    OnChange = ComboBox2Change
    Items.Strings = (
      'Top'
      'Center'
      'Bottom')
  end
  object CheckBox1: TTntCheckBox
    Left = 16
    Top = 176
    Width = 129
    Height = 17
    Hint = 'Specifies whether hidden attribute is used. '
    AllowGrayed = True
    Caption = '&Hidden'
    TabOrder = 6
    Visible = False
    OnClick = CheckBox1Click
  end
  object GroupBox2: TTntGroupBox
    Left = 8
    Top = 216
    Width = 274
    Height = 113
    Caption = 'Borders'
    TabOrder = 8
    DesignSize = (
      274
      113)
    object Label5: TTntLabel
      Left = 16
      Top = 16
      Width = 19
      Height = 13
      Caption = 'Left'
      FocusControl = CheckBox3
    end
    object Label6: TTntLabel
      Left = 16
      Top = 40
      Width = 18
      Height = 13
      Caption = 'Top'
      FocusControl = CheckBox4
    end
    object Label7: TTntLabel
      Left = 16
      Top = 64
      Width = 25
      Height = 13
      Caption = 'Right'
      FocusControl = CheckBox5
    end
    object Label8: TTntLabel
      Left = 16
      Top = 88
      Width = 34
      Height = 13
      Caption = 'Bottom'
      FocusControl = CheckBox6
    end
    object ColorBox3: TColorBox
      Left = 169
      Top = 11
      Width = 97
      Height = 22
      Hint = 'Specifies border line color of the left border.'
      DefaultColorColor = clWhite
      NoneColorColor = clNavy
      Selected = clGreen
      Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 0
      OnChange = ColorBox3Change
    end
    object ComboBox3: TTntComboBox
      Left = 65
      Top = 12
      Width = 97
      Height = 21
      Hint = 'Specifies border line style of the left border.'
      Style = csOwnerDrawFixed
      Anchors = [akTop, akRight]
      ItemHeight = 15
      TabOrder = 1
      OnChange = ComboBox3Change
      OnDrawItem = ComboBox3DrawItem
      Items.Strings = (
        'blNone'
        'blSolid '
        'blDash'
        'blDot'
        'blDashDot'
        'blDashDotDot'
        'blSolid2'
        'blSolid3'
        'blWavyLine'
        'blDouble')
    end
    object ColorBox4: TColorBox
      Tag = 1
      Left = 169
      Top = 35
      Width = 97
      Height = 22
      Hint = 'Specifies border line color of the top border.'
      DefaultColorColor = clWhite
      NoneColorColor = clNavy
      Selected = clGreen
      Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 2
      OnChange = ColorBox3Change
    end
    object ComboBox4: TTntComboBox
      Tag = 1
      Left = 65
      Top = 36
      Width = 97
      Height = 21
      Hint = 'Specifies border line style of the top border.'
      Style = csOwnerDrawFixed
      Anchors = [akTop, akRight]
      ItemHeight = 15
      TabOrder = 3
      OnChange = ComboBox3Change
      OnDrawItem = ComboBox3DrawItem
      Items.Strings = (
        'blNone'
        'blSolid '
        'blDash'
        'blDot'
        'blDashDot'
        'blDashDotDot'
        'blSolid2'
        'blSolid3'
        'blWavyLine'
        'blDouble')
    end
    object ColorBox5: TColorBox
      Tag = 2
      Left = 169
      Top = 59
      Width = 97
      Height = 22
      Hint = 'Specifies border line color of the right border.'
      DefaultColorColor = clWhite
      NoneColorColor = clNavy
      Selected = clGreen
      Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 4
      OnChange = ColorBox3Change
    end
    object ComboBox5: TTntComboBox
      Tag = 2
      Left = 65
      Top = 60
      Width = 97
      Height = 21
      Hint = 'Specifies border line style of the right border.'
      Style = csOwnerDrawFixed
      Anchors = [akTop, akRight]
      ItemHeight = 15
      TabOrder = 5
      OnChange = ComboBox3Change
      OnDrawItem = ComboBox3DrawItem
      Items.Strings = (
        'blNone'
        'blSolid '
        'blDash'
        'blDot'
        'blDashDot'
        'blDashDotDot'
        'blSolid2'
        'blSolid3'
        'blWavyLine'
        'blDouble')
    end
    object ColorBox6: TColorBox
      Tag = 3
      Left = 169
      Top = 83
      Width = 97
      Height = 22
      Hint = 'Specifies border line color of the bottom border.'
      DefaultColorColor = clWhite
      NoneColorColor = clNavy
      Selected = clGreen
      Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
      Anchors = [akTop, akRight]
      ItemHeight = 16
      TabOrder = 6
      OnChange = ColorBox3Change
    end
    object ComboBox6: TTntComboBox
      Tag = 3
      Left = 65
      Top = 85
      Width = 97
      Height = 21
      Hint = 'Specifies border line style of the bottom border.'
      Style = csOwnerDrawFixed
      Anchors = [akTop, akRight]
      ItemHeight = 15
      TabOrder = 7
      OnChange = ComboBox3Change
      OnDrawItem = ComboBox3DrawItem
      Items.Strings = (
        'blNone'
        'blSolid '
        'blDash'
        'blDot'
        'blDashDot'
        'blDashDotDot'
        'blSolid2'
        'blSolid3'
        'blWavyLine'
        'blDouble')
    end
  end
  object CheckBox6: TTntCheckBox
    Left = 16
    Top = 196
    Width = 129
    Height = 17
    Hint = 
      'Specifies whether solid border must be drawn around multiline te' +
      'xt region.'
    Caption = '&Multiline border'
    TabOrder = 7
    OnClick = CheckBox6Click
  end
  object CheckBox7: TTntCheckBox
    Left = 148
    Top = 176
    Width = 129
    Height = 17
    Hint = 'Specifies whether read-only attribute is used. '
    AllowGrayed = True
    Caption = '&Read-only'
    TabOrder = 9
    Visible = False
    OnClick = CheckBox7Click
  end
  object ComboBox7: TTntComboBox
    Left = 152
    Top = 136
    Width = 129
    Height = 21
    Hint = 
      'Specifies how register of text should be changed before renderin' +
      'g.'
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 10
    Visible = False
    OnChange = ComboBox7Change
    Items.Strings = (
      'Unchanged'
      'Upper case'
      'Lower case'
      'Toggle case'
      'Initial caps')
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    Left = 81
    Top = 17
  end
end
