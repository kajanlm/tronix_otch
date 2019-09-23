object Form76: TForm76
  Left = 610
  Top = 128
  Width = 361
  Height = 167
  Anchors = []
  AutoSize = True
  Caption = 'Form76'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 17
    Top = 0
    Width = 247
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 0
    Top = 112
    Width = 249
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 3
    Top = 40
    Width = 350
    Height = 25
    Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1055#1059#1045' '#1089' '#1090#1088#1091#1076#1086#1105#1084#1082#1086#1089#1090#1100#1102' 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 104
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1trnorm: TFloatField
      FieldName = 'trnorm'
    end
    object OraQuery1trzakr: TFloatField
      FieldName = 'trzakr'
    end
    object OraQuery1trost: TFloatField
      FieldName = 'trost'
    end
    object OraQuery1procent: TFloatField
      FieldName = 'procent'
    end
    object OraQuery1udpdat: TStringField
      FieldName = 'udpdat'
    end
    object OraQuery1prizn: TStringField
      FieldName = 'prizn'
    end
    object OraQuery1zak: TStringField
      FieldName = 'zak'
    end
    object OraQuery1abrudp: TStringField
      FieldName = 'abrudp'
    end
    object OraQuery1idudp: TFloatField
      FieldName = 'idudp'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1008
    Top = 104
  end
  object SaveDialog1: TSaveDialog
    Left = 680
    Top = 360
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 624
    Top = 248
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 568
    Top = 304
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 336
    Top = 120
  end
end
