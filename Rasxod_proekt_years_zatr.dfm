object FRasxod_proekt_years_zatr: TFRasxod_proekt_years_zatr
  Left = 203
  Top = 367
  Width = 1300
  Height = 700
  Anchors = []
  Caption = 'FRasxod_proekt_years_zatr'
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
  DesignSize = (
    1292
    666)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 5
    Top = 56
    Width = 1280
    Height = 609
    Anchors = []
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
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'godins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1043#1054#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 67
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kodzatr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1044' '#1047#1040#1058#1056#1045#1041'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 107
      end
      item
        EditButtons = <>
        FieldName = 'kolzatr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054' '#1047#1040#1058#1056#1045#1041'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 126
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'edzatrosn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1047#1040#1058#1056#1045#1041'.'#1054#1057#1053'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 174
      end
      item
        EditButtons = <>
        FieldName = 'namezatr'
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
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 786
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'zavn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1042'.'#8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 43
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'proe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1054#1045#1050#1058
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 43
      end>
  end
  object Edit1: TEdit
    Left = 529
    Top = 317
    Width = 247
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 520
    Top = 237
    Width = 249
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 736
    Top = 20
    Width = 75
    Height = 25
    Caption = 'Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 760
    Top = 361
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 464
    Top = 20
    Width = 129
    Height = 28
    Caption = #1042#1067#1041#1056#1040#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 10
    Top = 8
    Width = 417
    Height = 41
    Caption = #1053#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' . . . '
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1052#1072#1090#1077#1088#1080#1072#1083#1099
      #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077)
    ParentFont = False
    TabOrder = 0
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 144
    object OraQuery1godins: TStringField
      FieldName = 'godins'
    end
    object OraQuery1kodzatr: TStringField
      FieldName = 'kodzatr'
    end
    object OraQuery1kolzatr: TFloatField
      FieldName = 'kolzatr'
    end
    object OraQuery1edzatrosn: TStringField
      FieldName = 'edzatrosn'
    end
    object OraQuery1namezatr: TStringField
      FieldName = 'namezatr'
    end
    object OraQuery1zavn: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1proe: TStringField
      FieldName = 'proe'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 984
    Top = 136
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 872
    Top = 208
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 872
    Top = 256
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 808
    Top = 240
  end
end
