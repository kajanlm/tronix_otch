object Form49: TForm49
  Left = 668
  Top = 304
  Width = 604
  Height = 81
  Caption = 'Form49'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 101
    Height = 13
    Caption = #1042#1099#1075#1088#1091#1078#1072#1102' '#1074' '#1077#1082#1089#1077#1083#1100
  end
  object ProgressBar1: TProgressBar
    Left = 120
    Top = 8
    Width = 457
    Height = 17
    TabOrder = 0
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 464
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 496
  end
end
