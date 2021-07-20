object FNaryd_Close_PDO: TFNaryd_Close_PDO
  Left = 239
  Top = 291
  Width = 1300
  Height = 700
  Anchors = []
  Caption = 'FNaryd_Close_PDO'
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
  object Label1: TLabel
    Left = 602
    Top = 25
    Width = 18
    Height = 20
    Alignment = taRightJustify
    Caption = #1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 750
    Top = 25
    Width = 27
    Height = 20
    Alignment = taRightJustify
    Caption = #1055#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
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
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'dtnnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'zak'
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
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'typnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1050'/'#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'txnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 150
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ducnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1063#1040#1057#1058#1054#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'tnnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1053#1040#1056#1071#1044#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'date_dok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1044#1040#1058#1040' '#1057#1054#1047#1044'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'date_ins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1047#1040#1050#1056'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'trudoem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1056#1059#1044'-'#1058#1068
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ts_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1040#1041'.'#1053#1054#1052#1045#1056
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'naname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054'/'#1055#1054#1044#1056#1071#1044#1063#1048#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'pname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1044#1056#1071#1044#1063#1048#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'tunomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1050#1056'.'#1055#1059#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end>
  end
  object Edit1: TEdit
    Left = 529
    Top = 317
    Width = 247
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 520
    Top = 237
    Width = 249
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 920
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
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 760
    Top = 361
    Width = 121
    Height = 21
    TabOrder = 7
    Text = 'Edit3'
    Visible = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 621
    Top = 20
    Width = 124
    Height = 28
    Date = 43405.428657766210000000
    Time = 43405.428657766210000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnChange = DateTimePicker1Change
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
    TabOrder = 2
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 24
    Top = 8
    Width = 417
    Height = 41
    Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1080' . . . '
    Columns = 3
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1055#1086' '#1074#1089#1077#1084
      #1056#1072#1073#1086#1095#1080#1084' '#1071#1057#1047
      #1055#1086#1076#1088#1103#1076#1095#1080#1082#1072#1084)
    ParentFont = False
    TabOrder = 0
  end
  object DateTimePicker2: TDateTimePicker
    Left = 781
    Top = 20
    Width = 124
    Height = 28
    Date = 43405.428657766210000000
    Time = 43405.428657766210000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnChange = DateTimePicker2Change
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 144
    object OraQuery1dtnnomer: TStringField
      FieldName = 'dtnnomer'
    end
    object OraQuery1zak: TStringField
      FieldName = 'zak'
    end
    object OraQuery1typnomer: TStringField
      FieldName = 'typnomer'
    end
    object OraQuery1txnomer: TStringField
      FieldName = 'txnomer'
    end
    object OraQuery1ducnomer: TStringField
      FieldName = 'ducnomer'
    end
    object OraQuery1tnnomer: TStringField
      FieldName = 'tnnomer'
    end
    object OraQuery1date_dok: TStringField
      FieldName = 'date_dok'
    end
    object OraQuery1date_ins: TStringField
      FieldName = 'date_ins'
    end
    object OraQuery1trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object OraQuery1ts_number: TStringField
      FieldName = 'ts_number'
    end
    object OraQuery1naname: TStringField
      FieldName = 'naname'
    end
    object OraQuery1pname: TStringField
      FieldName = 'pname'
    end
    object OraQuery1tunomer: TStringField
      FieldName = 'tunomer'
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
