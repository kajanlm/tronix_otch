object Form43: TForm43
  Left = 217
  Top = 229
  Width = 528
  Height = 325
  Caption = 'Form43'
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
    Left = 192
    Top = 8
    Width = 119
    Height = 24
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1058#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 32
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 32
    Width = 489
    Height = 241
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
        FieldName = 'Nomer'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 350
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 384
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 352
  end
end
