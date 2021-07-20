object potreb: Tpotreb
  Left = 502
  Top = 316
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
  ClientHeight = 447
  ClientWidth = 473
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
  object header: TLabel
    Left = -8
    Top = 256
    Width = 481
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1087#1086' '#1079#1072#1082#1072#1079#1072#1084':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object clear: TButton
    Left = 120
    Top = 392
    Width = 75
    Height = 25
    Caption = #1054#1063#1048#1057#1058#1048#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = clearClick
  end
  object needZak: TListBox
    Left = 0
    Top = 280
    Width = 473
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 1
  end
  object grid: TDBGridEh
    Left = 0
    Top = 0
    Width = 473
    Height = 153
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
    RowHeight = 31
    TabOrder = 2
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
  object report: TButton
    Left = 256
    Top = 392
    Width = 121
    Height = 25
    Caption = #1057#1060#1054#1056#1052#1048#1056#1054#1042#1040#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = reportClick
  end
  object invi_needZak: TComboBox
    Left = 240
    Top = 416
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object invi_zakList: TComboBox
    Left = 80
    Top = 419
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object zakList: TListBox
    Left = 0
    Top = 152
    Width = 473
    Height = 105
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 6
    OnDblClick = zakListClick
  end
  object Query: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Top = 432
  end
  object DataSource: TOraDataSource
    DataSet = Query
    Left = 32
    Top = 432
  end
end
