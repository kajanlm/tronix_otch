object tx_createdList: Ttx_createdList
  Left = 308
  Top = 221
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1087#1080#1089#1086#1082' '#1089#1086#1079#1076#1072#1085#1085#1099#1093' '#1088#1072#1073#1086#1090
  ClientHeight = 312
  ClientWidth = 913
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
    Left = 16
    Top = 16
    Width = 89
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object zak: TLabel
    Left = 424
    Top = 16
    Width = 473
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = '<'#1047#1040#1050#1040#1047' '#1053#1045' '#1042#1067#1041#1056#1040#1053'>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 656
    Top = 44
    Width = 12
    Height = 37
    Alignment = taCenter
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 56
    Width = 281
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090' '#1076#1083#1103' '#1087#1086#1089#1090#1088#1086#1077#1085#1080#1103' '#1089#1087#1080#1089#1082#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object grid: TDBGridEh
    Left = 8
    Top = 112
    Width = 897
    Height = 193
    DataSource = DataSource
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = gridCellClick
    OnDblClick = gridDblClick
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'TREE_STATUS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = ' '
        Width = 24
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NOMER'
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
        Width = 240
        WordWrap = True
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'N'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 28
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
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'TYPE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1080#1087' '#1088#1072#1073#1086#1090#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 205
      end>
  end
  object up: TButton
    Left = 8
    Top = 80
    Width = 121
    Height = 25
    Caption = #1053#1040#1042#1045#1056#1061
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = upClick
  end
  object prs: TEdit
    Left = 112
    Top = 16
    Width = 137
    Height = 21
    TabOrder = 2
    OnKeyPress = prsKeyPress
  end
  object setpr: TButton
    Left = 256
    Top = 8
    Width = 137
    Height = 33
    Caption = #1053#1040#1049#1058#1048' '#1047#1040#1050#1040#1047
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = setprClick
  end
  object dateto: TDateTimePicker
    Left = 696
    Top = 52
    Width = 113
    Height = 28
    Date = 43444.472996365730000000
    Time = 43444.472996365730000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
  object datefrom: TDateTimePicker
    Left = 520
    Top = 52
    Width = 113
    Height = 28
    Date = 43444.472996365730000000
    Time = 43444.472996365730000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnChange = datefromChange
  end
  object tx_types: TComboBox
    Left = 328
    Top = 56
    Width = 145
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    TabOrder = 6
  end
  object invi_tx_types: TComboBox
    Left = 352
    Top = 72
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object dateFilter: TCheckBox
    Left = 496
    Top = 56
    Width = 17
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 8
  end
  object Query: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 16
    Top = 320
  end
  object DataSource: TOraDataSource
    DataSet = Query
    Left = 128
    Top = 320
  end
  object SQuery: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 48
    Top = 320
  end
end
