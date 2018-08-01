object Form30: TForm30
  Left = 381
  Top = 256
  Width = 553
  Height = 243
  Caption = 'Form30'
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
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 521
    Height = 185
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
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
        FieldName = 'nomer'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'nakl'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1082#1083#1072#1076#1085#1072#1103
        Width = 200
      end>
  end
  object Edit1: TEdit
    Left = 208
    Top = 0
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 88
    Top = 0
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    ObjectView = True
    OnCalcFields = OraQuery1CalcFields
    Left = 400
    object OraQuery1texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
    object OraQuery1nomer: TStringField
      DisplayWidth = 13
      FieldName = 'nomer'
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1nakl: TStringField
      FieldKind = fkCalculated
      FieldName = 'nakl'
      Size = 200
      Calculated = True
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 272
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 496
    Top = 32
  end
end
