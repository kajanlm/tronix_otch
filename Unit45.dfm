object Form45: TForm45
  Left = 501
  Top = 228
  Width = 564
  Height = 146
  Caption = 'Form45'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 320
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 264
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Label3: TLabel
    Left = 376
    Top = 64
    Width = 32
    Height = 13
    Caption = 'Label3'
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 32
    Top = 64
    Width = 185
    Height = 17
    Caption = #1055#1086#1082#1072#1078' '#1085#1077#1086#1090#1085#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1099#1077
    TabOrder = 0
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 504
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 456
    Top = 8
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 416
    Top = 8
  end
  object ExcelApplication2: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 392
    Top = 8
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 504
    Top = 56
  end
end
