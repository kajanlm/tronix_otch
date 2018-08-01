object Form7: TForm7
  Left = 291
  Top = 259
  Width = 984
  Height = 599
  Caption = 'Tn_'#1047#1072#1103#1074#1082#1072
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
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 953
    Height = 505
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1062#1045#1061
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'tn_nomer'
        Footers = <>
        Title.Caption = #8470#1047#1072#1103#1074#1082#1080
        Width = 210
      end
      item
        EditButtons = <>
        FieldName = 'date_dok'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'tk_nomer'
        Footers = <>
        Title.Caption = #8470#1058#1050
        Width = 210
      end
      item
        EditButtons = <>
        FieldName = 'ident'
        Footers = <>
        Title.Caption = #1057#1055
      end
      item
        EditButtons = <>
        FieldName = 'poz'
        Footers = <>
        Title.Caption = #1055#1054#1047
      end
      item
        EditButtons = <>
        FieldName = 'kod'
        Footers = <>
        Title.Caption = #1050#1054#1044
      end
      item
        EditButtons = <>
        FieldName = 'spname'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Title.Caption = #1050#1086#1083
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 't_nomer'
        Footers = <>
        Title.Caption = #8470' '#1058#1088#1077#1073
      end
      item
        EditButtons = <>
        FieldName = 't_date_dok'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072
      end
      item
        EditButtons = <>
        FieldName = 'kol1'
        Footers = <>
        Title.Caption = #1050#1086#1083' '#1087#1086' '#1090#1088#1077#1073
      end
      item
        EditButtons = <>
        FieldName = 'ed'
        Footers = <>
        Title.Caption = #1077#1076' '#1080#1079#1084' '#1087#1086' '#1090#1088#1077#1073
      end
      item
        EditButtons = <>
        FieldName = 'tr'
        Footers = <>
        Title.Caption = 'N '#1058#1058#1053
      end
      item
        EditButtons = <>
        FieldName = 'idsp'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'ttnid'
        Footers = <>
        Visible = False
      end
      item
        EditButtons = <>
        FieldName = 'NAkl_nom'
        Footers = <>
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103' '#1085#1072' '#1075#1086#1090' '#1087#1088#1086#1076#1091#1082#1094#1080#1102
      end
      item
        EditButtons = <>
        FieldName = 'Nakl_date'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1082#1083
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 528
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 928
    Top = 8
    object OraQuery1NAME: TStringField
      FieldName = 'NAME'
      Size = 3
    end
    object OraQuery1tn_nomer: TStringField
      FieldName = 'tn_nomer'
      Size = 10
    end
    object OraQuery1date_dok: TStringField
      FieldName = 'date_dok'
    end
    object OraQuery1tk_nomer: TStringField
      FieldName = 'tk_nomer'
      Size = 6
    end
    object OraQuery1ident: TStringField
      FieldName = 'ident'
    end
    object OraQuery1poz: TStringField
      FieldName = 'poz'
    end
    object OraQuery1spname: TStringField
      FieldName = 'spname'
    end
    object OraQuery1edu: TStringField
      FieldName = 'edu'
    end
    object OraQuery1kod: TStringField
      FieldName = 'kod'
    end
    object OraQuery1ed: TStringField
      FieldName = 'ed'
    end
    object OraQuery1t_nomer: TStringField
      FieldName = 't_nomer'
    end
    object OraQuery1t_date_dok: TStringField
      FieldName = 't_date_dok'
    end
    object OraQuery1kol1: TStringField
      FieldName = 'kol1'
    end
    object OraQuery1tr: TStringField
      FieldName = 'tr'
    end
    object OraQuery1NAkl_nom: TStringField
      FieldKind = fkCalculated
      FieldName = 'NAkl_nom'
      Size = 600
      Calculated = True
    end
    object OraQuery1Nakl_date: TStringField
      FieldKind = fkCalculated
      FieldName = 'Nakl_date'
      Size = 120
      Calculated = True
    end
    object OraQuery1idsp: TFloatField
      FieldName = 'idsp'
    end
    object OraQuery1ttnid: TFloatField
      FieldName = 'ttnid'
    end
    object OraQuery1kol: TStringField
      FieldName = 'kol'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 888
    Top = 16
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 840
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    Left = 808
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 456
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 440
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 528
    Top = 65528
  end
  object SaveDialog1: TSaveDialog
    Left = 632
  end
end
