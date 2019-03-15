object s_contract: Ts_contract
  Left = 352
  Top = 298
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1085#1090#1088#1072#1082#1090
  ClientHeight = 533
  ClientWidth = 833
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 817
    Height = 473
    DataSource = DataSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 40
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleHeight = 40
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 113
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 176
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL'
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 93
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ED'
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1045#1076'. '#1080#1079#1084'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CENA'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 52
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL_UCHET'
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1059#1095#1077#1090#1085#1086#1077' '#1082#1086#1083'-'#1074#1086
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 97
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ED_UCHET'
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1059#1095#1077#1090#1085#1072#1103' '#1077#1076'. '#1080#1079#1084'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CENA_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1062#1077#1085#1072' '#1091#1095'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NDS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1044#1057
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 63
      end>
  end
  object Button1: TButton
    Left = 264
    Top = 488
    Width = 353
    Height = 41
    Caption = #1050#1054#1053#1058#1056#1040#1050#1058' '#1053#1040' '#1054#1057#1053#1054#1042#1045' '#1042#1067#1041#1056#1040#1053#1053#1054#1043#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object DataSource: TOraDataSource
    DataSet = Query
    Left = 32
    Top = 496
  end
  object Query: TOraQuery
    ReadOnly = True
    Left = 72
    Top = 496
    object QueryKOD: TStringField
      FieldName = 'KOD'
      Size = 255
    end
    object QueryNAME: TStringField
      FieldName = 'NAME'
      Size = 255
    end
    object QueryKOL: TFloatField
      FieldName = 'KOL'
    end
    object QueryED: TStringField
      FieldName = 'ED'
      Size = 255
    end
    object QueryCENA: TFloatField
      FieldName = 'CENA'
    end
    object QueryKOL_UCHET: TFloatField
      FieldName = 'KOL_UCHET'
    end
    object QueryED_UCHET: TStringField
      FieldName = 'ED_UCHET'
      Size = 255
    end
    object QueryCENA_UCHET: TFloatField
      FieldName = 'CENA_UCHET'
    end
    object QueryNDS: TFloatField
      FieldName = 'NDS'
    end
  end
end
