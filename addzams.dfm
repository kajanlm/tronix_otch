object zams: Tzams
  Left = 472
  Top = 11
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1047#1072#1084#1077#1085#1099
  ClientHeight = 882
  ClientWidth = 721
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  DesignSize = (
    721
    882)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 400
    Width = 705
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1040#1052#1045#1053#1067
    Font.Charset = MAC_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 648
    Width = 705
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1040#1052#1045#1053#1048#1051#1048
    Font.Charset = MAC_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 14
    Top = 8
    Width = 705
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1090#1077#1093'. '#1082#1086#1084#1087#1083#1077#1082#1090#1091
    Font.Charset = MAC_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 6
    Top = 264
    Width = 705
    Height = 29
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1080#1074#1103#1079#1082#1072' '#1082' '#1087#1086#1079#1080#1094#1080#1080
    Font.Charset = MAC_CHARSET
    Font.Color = clGreen
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 432
    Width = 705
    Height = 209
    DataSource = OraDataSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 35
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    VTitleMargin = 5
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOD_ZAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -17
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'MTR_NAME_ZAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taLeftJustify
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -17
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 225
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1053#1040' '#1047#1040#1052#1045#1053#1059'|'#1047#1072#1082#1091#1087#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAM_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1053#1040' '#1047#1040#1052#1045#1053#1059'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 79
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1047#1040#1052#1045#1053#1071#1045#1052#1054#1045'|'#1047#1072#1082#1091#1087#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 73
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1047#1040#1052#1045#1053#1071#1045#1052#1054#1045'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 86
      end>
  end
  object LOCK_BOX_ZAM: TPanel
    Left = 8
    Top = 432
    Width = 705
    Height = 209
    BorderWidth = 5
    BorderStyle = bsSingle
    Caption = #1047#1072#1084#1077#1085' '#1085#1077#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 680
    Width = 705
    Height = 209
    DataSource = OraDataSourceZams
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 35
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    VTitleMargin = 5
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -17
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 117
      end
      item
        EditButtons = <>
        FieldName = 'MTR_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taLeftJustify
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -17
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 225
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAM'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1053#1040' '#1047#1040#1052#1045#1053#1059'|'#1047#1072#1082#1091#1087#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAM_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1053#1040' '#1047#1040#1052#1045#1053#1059'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 79
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1047#1040#1052#1045#1053#1071#1045#1052#1054#1045'|'#1047#1072#1082#1091#1087#1086#1095#1085#1099#1077' '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 73
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1047#1040#1052#1045#1053#1071#1045#1052#1054#1045'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 86
      end>
  end
  object Panel1: TPanel
    Left = -482
    Top = 394
    Width = 1227
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Color = clActiveCaption
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = -466
    Top = 642
    Width = 1227
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Color = clActiveCaption
    TabOrder = 4
  end
  object LOCK_BOX_ZAMS: TPanel
    Left = 8
    Top = 680
    Width = 705
    Height = 209
    BorderWidth = 5
    BorderStyle = bsSingle
    Caption = #1053#1077' '#1079#1072#1084#1077#1085#1103#1083#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Panel3: TPanel
    Left = -506
    Top = 2
    Width = 1227
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Color = clActiveCaption
    TabOrder = 6
  end
  object Panel4: TPanel
    Left = -474
    Top = 258
    Width = 1227
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Color = clActiveCaption
    TabOrder = 7
  end
  object DBGridEh3: TDBGridEh
    Left = 8
    Top = 40
    Width = 703
    Height = 209
    DataSource = OraDataSourceTX
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 32
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'TX_NOMER'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1054#1052#1045#1056
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 154
      end
      item
        EditButtons = <>
        FieldName = 'TX_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 398
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1058#1056#1045#1041#1053#1054#1057#1058#1068
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 113
      end>
  end
  object LOCK_BOX_TX: TPanel
    Left = 6
    Top = 40
    Width = 707
    Height = 217
    BorderWidth = 5
    BorderStyle = bsSingle
    Caption = #1053#1077#1090' '#1087#1088#1080#1074#1103#1079#1086#1082' '#1082' '#1090#1077#1093'. '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object Panel5: TPanel
    Left = 8
    Top = 296
    Width = 705
    Height = 97
    BorderWidth = 5
    BorderStyle = bsSingle
    Color = clHighlightText
    TabOrder = 10
    object Label11: TLabel
      Left = 16
      Top = 19
      Width = 38
      Height = 26
      Caption = #1048#1079':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 16
      Top = 51
      Width = 53
      Height = 26
      Caption = #1044#1083#1103':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 72
      Top = 19
      Width = 441
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1055#1045#1062#1048#1060#1048#1050#1040#1062#1048#1071': N/A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 72
      Top = 51
      Width = 441
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = #1057#1055#1045#1062#1048#1060#1048#1050#1040#1062#1048#1071': N/A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 512
      Top = 19
      Width = 169
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1079#1080#1094#1080#1103': N/A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label16: TLabel
      Left = 512
      Top = 51
      Width = 169
      Height = 26
      Alignment = taCenter
      AutoSize = False
      Caption = #1055#1086#1079#1080#1094#1080#1103': N/A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -23
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
  end
  object OraDataSource: TOraDataSource
    DataSet = OraQuery
    Left = 128
    Top = 912
  end
  object OraQuery: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 168
    Top = 912
    object OraQueryKOD_ZAM: TStringField
      FieldName = 'KOD_ZAM'
      Size = 255
    end
    object OraQueryMTR_NAME_ZAM: TStringField
      FieldName = 'MTR_NAME_ZAM'
      Size = 255
    end
    object OraQueryZAM: TFloatField
      FieldName = 'ZAM'
    end
    object OraQueryZAM_UCHET: TFloatField
      FieldName = 'ZAM_UCHET'
    end
    object OraQueryPOTR: TFloatField
      FieldName = 'POTR'
    end
    object OraQueryPOTR_UCHET: TFloatField
      FieldName = 'POTR_UCHET'
    end
  end
  object OraDataSourceZams: TOraDataSource
    DataSet = OraQueryZams
    Left = 232
    Top = 912
  end
  object OraQueryZams: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 272
    Top = 912
    object StringField1: TStringField
      FieldName = 'KOD'
      Size = 255
    end
    object StringField2: TStringField
      FieldName = 'MTR_NAME'
      Size = 255
    end
    object FloatField1: TFloatField
      FieldName = 'ZAM'
    end
    object FloatField2: TFloatField
      FieldName = 'ZAM_UCHET'
    end
    object FloatField3: TFloatField
      FieldName = 'POTR'
    end
    object FloatField4: TFloatField
      FieldName = 'POTR_UCHET'
    end
  end
  object OraDataSourceTX: TOraDataSource
    DataSet = OraQueryTX
    Left = 16
    Top = 912
  end
  object OraQueryTX: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    AfterScroll = OraQueryTXAfterScroll
    Left = 56
    Top = 912
    object OraQueryTXTX_NOMER: TStringField
      FieldName = 'TX_NOMER'
      Size = 255
    end
    object OraQueryTXTX_NAME: TStringField
      FieldName = 'TX_NAME'
      Size = 255
    end
    object OraQueryTXPOTR: TFloatField
      FieldName = 'POTR'
    end
    object OraQueryTXFPOZ: TStringField
      FieldName = 'FPOZ'
      Size = 255
    end
    object OraQueryTXRPOZ: TStringField
      FieldName = 'RPOZ'
      Size = 255
    end
    object OraQueryTXfIDENT: TStringField
      FieldName = 'fIDENT'
      Size = 255
    end
    object OraQueryTXrIDENT: TStringField
      FieldName = 'rIDENT'
      Size = 255
    end
  end
end
