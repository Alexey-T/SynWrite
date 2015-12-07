object fmTest: TfmTest
  Left = 306
  Top = 338
  Width = 791
  Height = 492
  Caption = 'Groups'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Tree: TTreeView
    Left = 0
    Top = 0
    Width = 121
    Height = 415
    Align = alLeft
    DragMode = dmAutomatic
    HideSelection = False
    Indent = 19
    TabOrder = 0
    Visible = False
    OnDragDrop = TreeDragDrop
    OnDragOver = TreeDragOver
    Items.Data = {
      030000001D0000000000000000000000FFFFFFFFFFFFFFFF0000000000000000
      04546573741E0000000000000000000000FFFFFFFFFFFFFFFF00000000020000
      000554657374321C0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      000000035454321C0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      000000035454311B0000000000000000000000FFFFFFFFFFFFFFFF0000000000
      000000025454}
  end
  object Status: TStatusBar
    Left = 0
    Top = 415
    Width = 775
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object PopupMenu1: TPopupMenu
    Left = 400
    Top = 96
    object mnuClose: TMenuItem
      Caption = 'close'
      object mnuCloseThis: TMenuItem
        Caption = 'this'
        OnClick = mnuCloseThisClick
      end
      object mnuCloseOthSame: TMenuItem
        Caption = 'others (same group)'
        OnClick = mnuCloseOthSameClick
      end
      object mnuCloseOthAll: TMenuItem
        Caption = 'others (all groups)'
        OnClick = mnuCloseOthAllClick
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object mnuCloseLt: TMenuItem
        Caption = 'left tabs (same group)'
        OnClick = mnuCloseLtClick
      end
      object mnuCloseRt: TMenuItem
        Caption = 'right tabs (same group)'
        OnClick = mnuCloseRtClick
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mnuCloseAllThis: TMenuItem
        Caption = 'all (same group)'
        OnClick = mnuCloseAllThisClick
      end
      object mnuCloseAll: TMenuItem
        Caption = 'all'
        OnClick = mnuCloseAllClick
      end
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object m1: TMenuItem
      Caption = 'to group 1'
      OnClick = m1Click
    end
    object m2: TMenuItem
      Caption = 'to group 2'
      OnClick = m2Click
    end
    object m3: TMenuItem
      Caption = 'to group 3'
      OnClick = m3Click
    end
    object m4: TMenuItem
      Caption = 'to group 4'
      OnClick = m4Click
    end
    object togroup51: TMenuItem
      Caption = 'to group 5'
      OnClick = togroup51Click
    end
    object togroup61: TMenuItem
      Caption = 'to group 6'
      OnClick = togroup61Click
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object mNext: TMenuItem
      Caption = 'to group next'
      OnClick = mNextClick
    end
    object mPre: TMenuItem
      Caption = 'to group prev'
      OnClick = mPreClick
    end
  end
  object MainMenu1: TMainMenu
    Left = 368
    Top = 96
    object Mode1: TMenuItem
      Caption = 'Mode'
      object N11: TMenuItem
        Caption = 'single'
        OnClick = N11Click
      end
      object N2horz1: TMenuItem
        Caption = '2 horz'
        OnClick = N2horz1Click
      end
      object N2vert1: TMenuItem
        Caption = '2 vert'
        OnClick = N2vert1Click
      end
      object N3horz1: TMenuItem
        Caption = '3 horz'
        OnClick = N3horz1Click
      end
      object N3vert1: TMenuItem
        Caption = '3 vert'
        OnClick = N3vert1Click
      end
      object N121: TMenuItem
        Caption = '3 as 1+2'
        OnClick = N121Click
      end
      object N4horz1: TMenuItem
        Caption = '4 horz'
        OnClick = N4horz1Click
      end
      object N4vert1: TMenuItem
        Caption = '4 vert'
        OnClick = N4vert1Click
      end
      object N4grid1: TMenuItem
        Caption = '4 grid'
        OnClick = N4grid1Click
      end
      object N6grid1: TMenuItem
        Caption = '6 grid'
        OnClick = N6grid1Click
      end
    end
    object Focus1: TMenuItem
      Caption = 'Focus'
      object N12: TMenuItem
        Caption = 'group 1'
        ShortCut = 112
        OnClick = N12Click
      end
      object N21: TMenuItem
        Caption = 'group 2'
        ShortCut = 113
        OnClick = N21Click
      end
      object N31: TMenuItem
        Caption = 'group 3'
        ShortCut = 114
        OnClick = N31Click
      end
      object N41: TMenuItem
        Caption = 'group 4'
        ShortCut = 115
        OnClick = N41Click
      end
      object group51: TMenuItem
        Caption = 'group 5'
        ShortCut = 116
        OnClick = group51Click
      end
      object group61: TMenuItem
        Caption = 'group 6'
        ShortCut = 117
        OnClick = group61Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object Next1: TMenuItem
        Caption = 'group next'
        ShortCut = 120
        OnClick = Next1Click
      end
      object Pr1: TMenuItem
        Caption = 'group prev'
        ShortCut = 121
        OnClick = Pr1Click
      end
    end
    object Movetab1: TMenuItem
      Caption = 'Move current tab'
      object tonext1: TMenuItem
        Caption = 'to next group'
        OnClick = tonext1Click
      end
      object toprev1: TMenuItem
        Caption = 'to prev group'
        OnClick = toprev1Click
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object toothergroup1: TMenuItem
        Caption = 'to opposite group (1->2, 2..6->1)'
        OnClick = toothergroup1Click
      end
    end
    object mTree: TMenuItem
      Caption = 'Tree'
      object mnuTreeToggle: TMenuItem
        Caption = 'Toggle tree'
        OnClick = mnuTreeToggleClick
      end
    end
  end
end
