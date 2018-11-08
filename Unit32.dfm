object Form32: TForm32
  Left = 526
  Top = 143
  Width = 354
  Height = 255
  Caption = 'Form32'
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
    Left = 80
    Top = 8
    Width = 182
    Height = 29
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1094#1077#1093':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 40
    Width = 329
    Height = 145
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
        FieldName = 'NOMER'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 40
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 270
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 184
    Width = 329
    Height = 25
    Caption = #1055#1054' '#1042#1057#1045#1052
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 272
    Top = 8
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      
        'Select nomer,name, dep_id from nordsy.dep where type_dep_type_de' +
        'p_id=2 and dep_dep_id=4003 order by nomer')
    ReadOnly = True
    Left = 304
    Top = 8
  end
end
