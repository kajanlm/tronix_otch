object FUdp_Norma_Fakt_Ostatok: TFUdp_Norma_Fakt_Ostatok
  Left = 321
  Top = 218
  Width = 958
  Height = 643
  Anchors = []
  AutoSize = True
  Caption = 'FUdp_Norma_Fakt_Ostatok'
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
    950
    609)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 8
    Width = 436
    Height = 16
    Caption = #1050#1088#1072#1089#1085#1099#1081' '#1094#1074#1077#1090' '#1086#1079#1085#1072#1095#1072#1077#1090' '#1085#1072#1083#1080#1095#1080#1077'  '#1055#1059#1045' '#1089' '#1090#1088#1091#1076#1086#1105#1084#1082#1086#1089#1090#1100#1102' 0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 25
    Width = 950
    Height = 561
    Anchors = []
    DataSource = OraDataSource1
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'udp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1044#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 383
      end
      item
        EditButtons = <>
        FieldName = 'trnorm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -13
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068' '#1053#1054#1056#1052#1048#1056'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 116
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'trzakr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -13
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footer.ToolTips = True
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068' '#1047#1040#1050#1056'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 100
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'trost'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -13
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068' '#1054#1057#1058#1040#1058#1054#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 123
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'procent'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footer.Font.Charset = DEFAULT_CHARSET
        Footer.Font.Color = clWindowText
        Footer.Font.Height = -13
        Footer.Font.Name = 'MS Sans Serif'
        Footer.Font.Style = [fsBold]
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = '%'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 47
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'udpdat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        MaxWidth = 166
        Title.Alignment = taCenter
        Title.Caption = #1059#1044#1055' '#1047#1040#1050#1056#1067#1058#1054' '
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 111
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
        Title.Caption = #1055#1056#1054#1045#1050#1058
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'abrudp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1044#1055' '#1050#1054#1056#1054#1058#1050#1054#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'idudp'
        Footers = <>
        Visible = False
        Width = 0
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'prizn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1045#1057#1058#1068' '#1058#1056'-'#1058#1068'=0'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 0
      end>
  end
  object Edit1: TEdit
    Left = 474
    Top = 104
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 457
    Top = 216
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 1
    Top = 584
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
    Left = 193
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 780
    Top = 0
    Width = 169
    Height = 25
    Caption = #1056#1072#1089#1082#1088#1099#1090#1100' '#1074#1089#1077' '#1059#1044#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 450
    Top = 0
    Width = 151
    Height = 25
    Caption = #1054#1058#1063#1025#1058' '#1055#1054' '#1059#1044#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 630
    Top = 0
    Width = 127
    Height = 25
    Caption = #1055#1059#1045' : '#1058#1056'-'#1058#1068'=0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button4Click
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
    object OraQuery1udpdatz: TStringField
      FieldName = 'udpdatz'
    end
    object OraQuery1udpdatr: TStringField
      FieldName = 'udpdatr'
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
    Left = 800
    Top = 168
  end
  object OraInsert: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 776
    Top = 504
    object StringField1: TStringField
      FieldName = 'udp'
    end
    object FloatField2: TFloatField
      FieldName = 'trnorm'
    end
    object FloatField3: TFloatField
      FieldName = 'trzakr'
    end
    object FloatField4: TFloatField
      FieldName = 'trost'
    end
    object StringField5: TStringField
      FieldName = 'udpdat'
      Size = 255
    end
    object StringField6: TStringField
      FieldName = 'abrudp'
      Size = 500
    end
    object FloatField7: TFloatField
      FieldName = 'idudp'
    end
  end
end
