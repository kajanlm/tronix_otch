object Form47: TForm47
  Left = 525
  Top = 172
  Width = 575
  Height = 495
  Caption = 'Form47'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 40
    Width = 529
    Height = 401
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1054#1052#1045#1056
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'UROVEN'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1042#1042#1045#1056#1061
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'FIO'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1040#1074#1090#1086#1088
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'DAT'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1040#1058#1040' '#1089#1086#1074#1077#1088#1097#1077#1085#1080#1103
        Width = 120
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 8
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 56
    Top = 8
  end
end
