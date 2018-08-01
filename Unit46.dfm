object Form46: TForm46
  Left = 198
  Top = 200
  Width = 504
  Height = 423
  Caption = 'Form46'
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
    Left = 320
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 312
    Top = 32
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 473
    Height = 321
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
        Title.Caption = #1053#1086#1084#1077#1088' '#1058#1053
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'Name'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 320
      end>
  end
  object CheckBox1: TCheckBox
    Left = 16
    Top = 352
    Width = 121
    Height = 17
    Caption = #1055#1086' '#1074#1089#1077#1084
    TabOrder = 1
  end
  object Button1: TButton
    Left = 160
    Top = 352
    Width = 137
    Height = 25
    Caption = #1042#1087#1077#1088#1077#1076'!!!!'
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 424
    Top = 24
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 432
    Top = 72
  end
end
