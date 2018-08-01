object Form12: TForm12
  Left = 330
  Top = 401
  Width = 441
  Height = 330
  Caption = 'Form12'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = -2
    Width = 174
    Height = 24
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 27
    Width = 409
    Height = 236
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
        FieldName = 'PROJECT'
        Footers = <>
        Title.Caption = #1055#1088#1086#1077#1082#1090
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      'Select project_id,project, name from tronix.project_list'
      'order by name')
    ReadOnly = True
    Active = True
    Left = 400
    Top = 16
    object OraQuery1PROJECT_ID: TIntegerField
      FieldName = 'PROJECT_ID'
      Required = True
    end
    object OraQuery1PROJECT: TStringField
      FieldName = 'PROJECT'
      Required = True
      Size = 32
    end
    object OraQuery1NAME: TStringField
      FieldName = 'NAME'
      Size = 200
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 376
    Top = 24
  end
end
