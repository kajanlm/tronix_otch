object Form26: TForm26
  Left = 202
  Top = 237
  Width = 954
  Height = 645
  Caption = 'Form26'
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
  object Edit1: TEdit
    Left = 800
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 8
    Width = 913
    Height = 569
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'KOD'
        Footers = <>
        Title.Caption = #1050#1086#1076
      end
      item
        EditButtons = <>
        FieldName = 'sprkod'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'spname'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'spr_koded'
        Footers = <>
        Title.Caption = #1045#1076'. '#1080#1079#1084'. '#1086#1089#1085'.'
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'sm'
        Footers = <>
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'spr_koded2'
        Footers = <>
        Title.Caption = #1045#1076'. '#1080#1079#1084'. '#1076#1086#1087
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'sm2'
        Footers = <>
        Title.Caption = #1050#1086#1083
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'Texkompl_name'
        Footers = <>
        Title.Caption = #1055#1059#1045
        Width = 100
      end
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #1055#1086#1076#1087#1080#1089#1100' '#1088#1072#1073#1086#1090#1085#1080#1082#1072
      end
      item
        EditButtons = <>
        Footers = <>
        Title.Caption = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
        Width = 230
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 576
    Width = 145
    Height = 25
    Caption = #1042' '#1077#1082#1089#1077#1083#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 896
    Top = 72
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 848
    Top = 80
    object OraQuery1sprkod: TStringField
      FieldName = 'sprkod'
      ReadOnly = True
    end
    object OraQuery1spname: TStringField
      FieldName = 'spname'
      ReadOnly = True
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
      ReadOnly = True
    end
    object OraQuery1spr_koded: TStringField
      FieldName = 'spr_koded'
      ReadOnly = True
    end
    object OraQuery1sm: TFloatField
      FieldName = 'sm'
      ReadOnly = True
    end
    object OraQuery1spr_koded2: TStringField
      FieldName = 'spr_koded2'
      ReadOnly = True
    end
    object OraQuery1sm2: TFloatField
      FieldName = 'sm2'
      ReadOnly = True
    end
    object OraQuery1Texkompl_name: TStringField
      FieldName = 'Texkompl_name'
      ReadOnly = True
    end
    object OraQuery1KOD: TStringField
      FieldKind = fkCalculated
      FieldName = 'KOD'
      Calculated = True
    end
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 792
    Top = 80
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 752
    Top = 88
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 704
    Top = 64
  end
  object SaveDialog1: TSaveDialog
    Left = 680
    Top = 112
  end
end
