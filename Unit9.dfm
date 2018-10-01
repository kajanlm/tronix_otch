object Form9: TForm9
  Left = 414
  Top = 191
  BorderStyle = bsSingle
  Caption = 'KOD'
  ClientHeight = 324
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 0
    Width = 178
    Height = 20
    Caption = #1057#1090#1088#1086#1080#1090#1077#1083#1100#1085#1099#1081' '#1079#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Label3: TLabel
    Left = 192
    Top = 211
    Width = 52
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100':'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 25
    Width = 473
    Height = 184
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ZAVN'
        Footers = <>
        Title.Caption = 'N'
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 215
    Width = 473
    Height = 97
    DataSource = OraDataSource2
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGridEh2DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Title.Caption = #1047#1072#1082#1072#1079
      end
      item
        EditButtons = <>
        FieldName = 'TEXT'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end>
  end
  object Edit1: TEdit
    Left = 448
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 248
    Top = 208
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = #1057#1087#1080#1089#1082#1086#1084
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      'Select Zavn, name, project_id from Tronix.Project_list '
      'where date_end is null'
      'order by zavn')
    ReadOnly = True
    Left = 384
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 360
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      
        'Select zak.zak, feb.text,zak.id_project,zak.nn from tronix.feb_n' +
        'ame feb,'
      'tronix.zakaz zak where zak.name=feb.nn')
    MasterSource = OraDataSource1
    MasterFields = 'PROJECT_ID'
    DetailFields = 'ID_PROJECT'
    ReadOnly = True
    Left = 320
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROJECT_ID'
        ParamType = ptInput
        Value = 181
      end>
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 288
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 216
    Top = 272
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 288
    Top = 280
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 208
    Top = 16
  end
end
