object Form3: TForm3
  Left = 496
  Top = 289
  Width = 658
  Height = 545
  Caption = #1042#1099#1073#1086#1088' '#1089#1090#1088#1086#1080#1090#1077#1083#1100#1085#1086#1075#1086' '#1079#1072#1082#1072#1079#1072
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 625
    Height = 233
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
    OnCellClick = DBGridEh1CellClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ZAVN'
        Footers = <>
        Title.Caption = #1047#1040#1050#1040#1047
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 544
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 264
    Width = 625
    Height = 233
    DataSource = OraDataSource3
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
    OnDblClick = DBGridEh2DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NN'
        Footers = <>
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Width = 544
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      
        'Select project_id, Name, Proekt, zavn from Tronix.Project_list o' +
        'rder by zavn')
    ReadOnly = True
    Left = 608
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 584
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 552
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 520
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    MasterFields = 'NAME'
    FetchAll = True
    ReadOnly = True
    Left = 480
    object OraQuery3NN: TIntegerField
      FieldName = 'NN'
      Required = True
    end
    object OraQuery3TEXT: TStringField
      FieldName = 'ZAK'
      Size = 4000
    end
    object OraQuery3ID_RABOT: TIntegerField
      FieldName = 'ID_RABOT'
    end
  end
  object OraDataSource3: TOraDataSource
    DataSet = OraQuery3
    Left = 440
  end
end
