object DIF_OTCH_FORM: TDIF_OTCH_FORM
  Left = 688
  Top = 299
  Width = 991
  Height = 678
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1076#1080#1092#1092#1080#1094#1080#1090#1091
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
    Top = 6
    Width = 953
    Height = 609
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
        FieldName = 'tnomer'
        Footers = <>
        Title.Caption = #1058#1050
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'tname'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1058#1050
        Width = 380
      end
      item
        EditButtons = <>
        FieldName = 'skod'
        Footers = <>
        Title.Caption = #1050#1054#1044
      end
      item
        EditButtons = <>
        FieldName = 'spname'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 380
      end
      item
        EditButtons = <>
        FieldName = 'psname'
        Footers = <>
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 380
      end
      item
        EditButtons = <>
        FieldName = 'summ_nado'
        Footers = <>
        Title.Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
      end
      item
        EditButtons = <>
        FieldName = 'koded_e'
        Footers = <>
        Title.Caption = #1045#1076#1077#1085#1080#1094#1072' '#1080#1079' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1080
        Width = 32
      end
      item
        EditButtons = <>
        FieldName = 'summ_zavod'
        Footers = <>
        Title.Caption = #1053#1072' '#1079#1072#1074#1086#1076#1077
      end
      item
        EditButtons = <>
        FieldName = 'summ_vcexe'
        Footers = <>
        Title.Caption = #1042' '#1062#1077#1093#1077
      end
      item
        EditButtons = <>
        FieldName = 'summ_vidano'
        Footers = <>
        Title.Caption = #1042#1099#1076#1072#1085#1086' '#1094#1077#1093#1091
      end
      item
        EditButtons = <>
        FieldName = 'date_start'
        Footers = <>
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      end
      item
        EditButtons = <>
        FieldName = 'TNA'
        Footers = <>
        Title.Caption = #1058#1077#1093#1085#1072#1088#1103#1076
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'dep_nomer'
        Footers = <>
        Title.Caption = #1062#1045#1061
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 616
    Width = 75
    Height = 17
    Caption = 'Exel'
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 936
    Top = 8
    object OraQuery1tnomer: TStringField
      FieldName = 'tnomer'
    end
    object OraQuery1tname: TStringField
      FieldName = 'tname'
    end
    object OraQuery1skod: TStringField
      FieldName = 'skod'
    end
    object OraQuery1spname: TStringField
      FieldName = 'spname'
    end
    object OraQuery1psname: TStringField
      FieldName = 'psname'
    end
    object OraQuery1summ_nado: TFloatField
      FieldName = 'summ_nado'
    end
    object OraQuery1summ_zavod: TFloatField
      FieldName = 'summ_zavod'
    end
    object OraQuery1summ_vcexe: TFloatField
      FieldName = 'summ_vcexe'
    end
    object OraQuery1summ_vidano: TFloatField
      FieldName = 'summ_vidano'
    end
    object OraQuery1date_start: TStringField
      FieldName = 'date_start'
    end
    object OraQuery1TNA: TStringField
      FieldName = 'TNA'
    end
    object OraQuery1dep_nomer: TStringField
      FieldName = 'dep_nomer'
    end
    object OraQuery1koded_e: TStringField
      FieldName = 'koded_e'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 904
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 896
    Top = 72
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 816
    Top = 16
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 848
    Top = 24
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 888
    Top = 24
  end
end
