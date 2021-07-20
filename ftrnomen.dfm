object trnomen: Ttrnomen
  Left = 102
  Top = 328
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1077
  ClientHeight = 478
  ClientWidth = 1530
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 432
    Top = 8
    Width = 106
    Height = 13
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1089#1086#1079#1076#1072#1085
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label2: TLabel
    Left = 736
    Top = 8
    Width = 206
    Height = 13
    Alignment = taCenter
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1090#1087#1088#1072#1074#1083#1077#1085' '#1074' '#1089#1085#1072#1073#1078#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 432
    Top = 32
    Width = 183
    Height = 13
    Alignment = taCenter
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1086#1090#1087#1088#1072#1074#1083#1077#1085' '#1085#1072' '#1089#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label4: TLabel
    Left = 736
    Top = 32
    Width = 107
    Height = 13
    Alignment = taCenter
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1079#1072#1082#1088#1099#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label5: TLabel
    Left = 360
    Top = 8
    Width = 641
    Height = 33
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1057#1045' '#1053#1045' '#1047#1040#1050#1056#1067#1058#1067#1045' '#1044#1054#1050#1059#1052#1045#1053#1058#1067
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -27
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Layout = tlCenter
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 56
    Width = 1497
    Height = 417
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDrawColumnCell = DBGridEh1DrawColumnCell
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
        Title.Caption = #1047#1040#1055#1056#1054#1064#1045#1053#1054
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 122
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'VYD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1042#1067#1044#1040#1053#1054
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 136
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 73
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'TYPE'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 200
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'SKLAD'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 46
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CEH'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1062#1045#1061
        Width = 47
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL_UCHET'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1047#1072#1082#1091#1087'. '#1077#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 79
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 83
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATEC'
        Footers = <>
        Title.Caption = #1057#1086#1079#1076#1072#1085
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 68
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1042' '#1089#1085#1072#1073#1078#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 89
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090' '#1074' '#1059#1057#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 77
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE3'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1047#1072#1082#1088#1099#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'PUE'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1059#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 127
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CHERT'
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 158
      end>
  end
  object needColor: TCheckBox
    Left = 16
    Top = 19
    Width = 161
    Height = 17
    Caption = #1062#1042#1045#1058#1053#1067#1045' '#1044#1040#1058#1067
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = needColorClick
  end
  object Panel1: TPanel
    Left = 384
    Top = 11
    Width = 41
    Height = 9
    Color = 1480
    TabOrder = 2
    Visible = False
  end
  object Panel2: TPanel
    Left = 688
    Top = 11
    Width = 41
    Height = 9
    Color = 2214143
    TabOrder = 3
    Visible = False
  end
  object Panel3: TPanel
    Left = 384
    Top = 35
    Width = 41
    Height = 9
    Color = clOlive
    TabOrder = 4
    Visible = False
  end
  object Panel4: TPanel
    Left = 688
    Top = 35
    Width = 41
    Height = 9
    Color = 65313
    TabOrder = 5
    Visible = False
  end
  object Button1: TButton
    Left = 1176
    Top = 16
    Width = 113
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' .txt'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 1312
    Top = 16
    Width = 121
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1074' Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button2Click
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQueryS
    Left = 432
    Top = 488
  end
  object OraQueryS: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 472
    Top = 488
    object OraQuerySKOD: TStringField
      FieldName = 'KOD'
      Size = 255
    end
    object OraQuerySNOMER: TStringField
      FieldName = 'NOMER'
      Size = 255
    end
    object OraQuerySTYPE: TStringField
      FieldName = 'TYPE'
      Size = 255
    end
    object OraQuerySCEH: TStringField
      FieldName = 'CEH'
      Size = 255
    end
    object OraQuerySKOL_UCHET: TFloatField
      FieldName = 'KOL_UCHET'
    end
    object OraQuerySKOL: TFloatField
      FieldName = 'KOL'
    end
    object OraQuerySDATE1: TStringField
      FieldName = 'DATE1'
      Size = 255
    end
    object OraQuerySDATE2: TStringField
      FieldName = 'DATE2'
      Size = 255
    end
    object OraQuerySDATE3: TStringField
      FieldName = 'DATE3'
      Size = 255
    end
    object OraQuerySDATE4: TStringField
      FieldName = 'DATE4'
      Size = 255
    end
    object OraQuerySDATEC: TStringField
      FieldName = 'DATEC'
      Size = 255
    end
    object OraQuerySSKLAD: TStringField
      FieldName = 'SKLAD'
      Size = 255
    end
    object OraQuerySVYD: TStringField
      FieldName = 'VYD'
      Size = 255
    end
    object OraQuerySCHERT: TStringField
      FieldName = 'CHERT'
      Size = 255
    end
    object OraQuerySPUE: TStringField
      FieldName = 'PUE'
      Size = 255
    end
  end
  object SaveDialog1: TSaveDialog
    Left = 504
    Top = 488
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 544
    Top = 480
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 552
    Top = 488
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 560
    Top = 496
  end
end
