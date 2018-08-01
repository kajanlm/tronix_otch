object Form24: TForm24
  Left = 308
  Top = 318
  Width = 741
  Height = 429
  Caption = 'Form24'
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
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 16
    Width = 697
    Height = 337
    DataSource = OraDataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nomer'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1054#1052#1045#1056
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'kod'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1054#1044
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'project'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1088#1086#1077#1082#1090
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'PUT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1059#1058#1068
      end
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        ReadOnly = True
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1040#1058#1040' '#1089#1086#1079#1076#1072#1085#1080#1103
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 360
    Width = 75
    Height = 25
    Caption = #1042' '#1101#1082#1089#1077#1083#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 696
    Top = 24
    object OraQuery1nomer: TStringField
      FieldName = 'nomer'
    end
    object OraQuery1kod: TStringField
      FieldName = 'kod'
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1project: TStringField
      FieldName = 'project'
    end
    object OraQuery1tk: TFloatField
      FieldName = 'tk'
    end
    object OraQuery1PUT: TStringField
      FieldKind = fkCalculated
      FieldName = 'PUT'
      Size = 60
      Calculated = True
    end
    object OraQuery1FIO: TStringField
      FieldName = 'FIO'
    end
    object OraQuery1DAT: TDateTimeField
      FieldName = 'DAT'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 664
    Top = 32
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 552
    Top = 24
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 504
    Top = 24
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 600
    Top = 80
  end
  object SaveDialog1: TSaveDialog
    Left = 416
    Top = 48
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 608
    Top = 24
  end
end
