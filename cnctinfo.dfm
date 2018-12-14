object cntinfo: Tcntinfo
  Left = 569
  Top = 493
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1050#1086#1087#1080#1103' '#1082#1086#1085#1090#1088#1072#1082#1090#1072
  ClientHeight = 252
  ClientWidth = 446
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 133
    Height = 16
    Caption = #1053#1086#1084#1077#1088' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 64
    Width = 168
    Height = 16
    Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072' '#1076#1077#1081#1089#1090#1074#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 112
    Width = 196
    Height = 16
    Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 56
    Top = 160
    Width = 82
    Height = 16
    Caption = #1055#1086#1089#1090#1072#1074#1097#1080#1082
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object post: TEdit
    Left = 208
    Top = 160
    Width = 185
    Height = 21
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -8
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 5
    OnClick = postClick
  end
  object ndoc: TEdit
    Left = 208
    Top = 16
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object date: TDateTimePicker
    Left = 208
    Top = 64
    Width = 186
    Height = 21
    Date = 43446.480565844900000000
    Time = 43446.480565844900000000
    TabOrder = 1
  end
  object ename: TEdit
    Left = 208
    Top = 112
    Width = 185
    Height = 21
    TabOrder = 2
  end
  object Button1: TButton
    Left = 77
    Top = 205
    Width = 321
    Height = 41
    Caption = #1057#1050#1054#1055#1048#1056#1054#1042#1040#1058#1068' '#1050#1054#1053#1058#1056#1040#1050#1058'-'#1044#1054#1043#1054#1042#1054#1056
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object postavk: TDBGridEh
    Left = 0
    Top = 136
    Width = 449
    Height = 120
    DataSource = DataSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = postavkDblClick
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'INN'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1048#1053#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -7
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 135
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1057#1058#1040#1042#1065#1048#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -7
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 274
      end>
  end
  object Query: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 408
    Top = 8
    object QueryID: TFloatField
      FieldName = 'ID'
    end
    object QueryINN: TFloatField
      FieldName = 'INN'
    end
    object Queryname: TStringField
      FieldName = 'name'
      Size = 255
    end
    object Querysname: TStringField
      FieldName = 'sname'
      Size = 255
    end
  end
  object DataSource: TOraDataSource
    DataSet = Query
    Left = 408
    Top = 48
  end
end
