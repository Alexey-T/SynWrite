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
    Height = 414
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
    Top = 414
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
      object mnuMode1: TMenuItem
        Caption = 'single'
        OnClick = mnuMode1Click
      end
      object mnuMode2H: TMenuItem
        Caption = '2 horz'
        OnClick = mnuMode2HClick
      end
      object mnuMode2V: TMenuItem
        Caption = '2 vert'
        OnClick = mnuMode2VClick
      end
      object mnuMode3H: TMenuItem
        Caption = '3 horz'
        OnClick = mnuMode3HClick
      end
      object mnuMode3V: TMenuItem
        Caption = '3 vert'
        OnClick = mnuMode3VClick
      end
      object mnuMode12H: TMenuItem
        Caption = '3 as 1+2 horz'
        OnClick = mnuMode12HClick
      end
      object mnuMode12V: TMenuItem
        Caption = '3 as 1+2 vert'
        OnClick = mnuMode12VClick
      end
      object mnuMode4H: TMenuItem
        Caption = '4 horz'
        OnClick = mnuMode4HClick
      end
      object mnuMode4V: TMenuItem
        Caption = '4 vert'
        OnClick = mnuMode4VClick
      end
      object mnuMode4G: TMenuItem
        Caption = '4 grid'
        OnClick = mnuMode4GClick
      end
      object mnuMode6: TMenuItem
        Caption = '6 grid'
        OnClick = mnuMode6Click
      end
    end
    object Focus1: TMenuItem
      Caption = 'Focus'
      object mnuG1: TMenuItem
        Caption = 'group 1'
        ShortCut = 112
        OnClick = mnuG1Click
      end
      object mnuG2: TMenuItem
        Caption = 'group 2'
        ShortCut = 113
        OnClick = mnuG2Click
      end
      object mnuG3: TMenuItem
        Caption = 'group 3'
        ShortCut = 114
        OnClick = mnuG3Click
      end
      object mnuG4: TMenuItem
        Caption = 'group 4'
        ShortCut = 115
        OnClick = mnuG4Click
      end
      object mnuG5: TMenuItem
        Caption = 'group 5'
        ShortCut = 116
        OnClick = mnuG5Click
      end
      object mnuG6: TMenuItem
        Caption = 'group 6'
        ShortCut = 117
        OnClick = mnuG6Click
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mnuGNext: TMenuItem
        Caption = 'group next'
        ShortCut = 120
        OnClick = mnuGNextClick
      end
      object mnuGPrev: TMenuItem
        Caption = 'group prev'
        ShortCut = 121
        OnClick = mnuGPrevClick
      end
    end
    object Movetab1: TMenuItem
      Caption = 'Move current tab'
      object mnuMoveNext: TMenuItem
        Caption = 'to next group'
        OnClick = mnuMoveNextClick
      end
      object mnuMovePrev: TMenuItem
        Caption = 'to prev group'
        OnClick = mnuMovePrevClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mnuMoveOpp: TMenuItem
        Caption = 'to opposite group (1->2, 2..6->1)'
        OnClick = mnuMoveOppClick
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
