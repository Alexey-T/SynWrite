object fmSynEx: TfmSynEx
  Left = 268
  Top = 114
  AutoScroll = False
  ClientHeight = 342
  ClientWidth = 680
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object XPManifest1: TXPManifest
    Left = 208
    Top = 60
  end
  object ApplicationEvents1: TApplicationEvents
    OnDeactivate = ApplicationEvents1Deactivate
    OnMessage = ApplicationEvents1Message
    Left = 240
    Top = 60
  end
end
