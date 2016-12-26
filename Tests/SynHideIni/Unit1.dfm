object Form1: TForm1
  Left = 221
  Top = 415
  Width = 475
  Height = 464
  Caption = 'Form1'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TBXDock1: TTBXDock
    Left = 0
    Top = 0
    Width = 467
    Height = 46
    object tbEdit: TTBXToolbar
      Left = 94
      Top = 23
      DockPos = 84
      DockRow = 1
      TabOrder = 0
      Caption = 'tbEdit'
      object TBItem2: TTBItem
        Caption = 'edit1'
        Hint = ''
      end
      object TBItem1: TTBItem
        Caption = 'edit2'
        Hint = ''
      end
      object TBXItem1: TTBXItem
        Caption = 'edit3'
        Hint = ''
      end
    end
    object tbFile: TTBXToolbar
      Left = 8
      Top = 23
      DockPos = 8
      DockRow = 1
      TabOrder = 1
      Caption = 'tbFile'
      object TBItem3: TTBItem
        Caption = 'ff1'
        Hint = ''
      end
      object TBItem4: TTBItem
        Caption = 'ff2'
        Hint = ''
      end
      object TBXItem2: TTBXItem
        Caption = 'ff3'
        Hint = ''
      end
    end
    object tbMenu: TTBXToolbar
      Left = 0
      Top = 0
      TabOrder = 2
      Caption = 'tbMenu'
      object TbxItemFile: TTBXSubmenuItem
        Caption = 'file_s'
        Hint = ''
        object TBXItem4: TTBXItem
          Caption = 'f1'
          Hint = ''
        end
        object TBXItem3: TTBXItem
          Caption = 'f2'
          Hint = ''
        end
        object TBXItem8: TTBXItem
          Caption = 'f3'
          Hint = ''
        end
      end
      object TbxItemEdit: TTBXSubmenuItem
        Caption = 'edit_s'
        Hint = ''
        object TBXItem6: TTBXItem
          Caption = 'e1'
          Hint = ''
        end
        object TBXItem5: TTBXItem
          Caption = 'e2'
          Hint = ''
        end
      end
      object TbxItemHelp: TTBXSubmenuItem
        Caption = 'help_s'
        Hint = ''
        object TBXItem7: TTBXItem
          Caption = 'h1'
          Hint = ''
        end
      end
    end
  end
end
