object docSpCnt: TdocSpCnt
  Left = 491
  Top = 256
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1056#1072#1089#1082#1088#1099#1090#1080#1077' '#1087#1086#1079#1080#1094#1080#1081' '#1087#1086' '#1057#1055#1045#1062#1048#1060#1048#1050#1040#1062#1048#1048' / '#1055#1059#1045
  ClientHeight = 558
  ClientWidth = 510
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
    Left = 8
    Top = 224
    Width = 68
    Height = 20
    Caption = #1055#1086#1080#1089#1082' '#1087#1086
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 8
    Width = 112
    Height = 20
    Caption = #1055#1086#1080#1089#1082' '#1087#1088#1086#1077#1082#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object project: TLabel
    Left = 0
    Top = 200
    Width = 505
    Height = 20
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1077#1082#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grid: TDBGridEh
    Left = 16
    Top = 40
    Width = 473
    Height = 153
    DataSource = dataSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 31
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = gridDblClick
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'PROJECT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1088#1086#1077#1082#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 85
        WordWrap = True
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 346
        WordWrap = True
      end>
  end
  object projectSearch: TEdit
    Left = 176
    Top = 8
    Width = 137
    Height = 21
    TabOrder = 1
  end
  object projectFind: TButton
    Left = 320
    Top = 5
    Width = 113
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1087#1088#1086#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = projectFindClick
  end
  object treeSearch: TEdit
    Left = 232
    Top = 224
    Width = 137
    Height = 21
    TabOrder = 3
    OnChange = treeSearchChange
  end
  object treeFind: TButton
    Left = 376
    Top = 220
    Width = 129
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    WordWrap = True
    OnClick = treeFindClick
  end
  object treeType: TComboBox
    Left = 80
    Top = 224
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ItemIndex = 0
    ParentFont = False
    TabOrder = 5
    Text = #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103#1084
    OnChange = treeTypeChange
    Items.Strings = (
      #1057#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103#1084
      #1055#1059#1045)
  end
  object gridTree: TDBGridEh
    Left = -8
    Top = 256
    Width = 521
    Height = 265
    DataSource = dataSourceTree
    Enabled = False
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    RowHeight = 31
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1086#1084#1077#1088
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 159
        WordWrap = True
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'SRC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1054#1087#1080#1089#1072#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 322
        WordWrap = True
      end>
  end
  object create: TButton
    Left = 181
    Top = 524
    Width = 129
    Height = 29
    Caption = #1057#1086#1079#1076#1072#1090#1100' '#1086#1090#1095#1077#1090
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    WordWrap = True
    OnClick = createClick
  end
  object blockMask: TPanel
    Left = -8
    Top = 256
    Width = 521
    Height = 297
    Caption = #1042#1067#1041#1045#1056#1048#1058#1045' '#1054#1041#1066#1045#1050#1058' '#1054#1058#1063#1045#1058#1040
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = treeFindClick
  end
  object Query: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 16
    Top = 528
  end
  object dataSource: TOraDataSource
    DataSet = Query
    Left = 56
    Top = 528
  end
  object dataSourceTree: TOraDataSource
    DataSet = QueryTree
    Left = 136
    Top = 528
  end
  object QueryTree: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 96
    Top = 528
  end
end
