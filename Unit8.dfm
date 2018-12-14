object Form8: TForm8
  Left = 425
  Top = 250
  Width = 501
  Height = 229
  Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1077#1082#1090
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
  object Label1: TLabel
    Left = 104
    Top = 168
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 473
    Height = 161
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
  end
  object CheckBox1: TCheckBox
    Left = 152
    Top = 168
    Width = 225
    Height = 17
    Caption = #1057#1075#1088#1091#1087#1087#1080#1088#1086#1074#1072#1090#1100' '#1087#1086' '#1082#1086#1076#1091' '#1074' '#1079#1072#1103#1074#1082#1077
    TabOrder = 1
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 336
    Top = 8
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 304
    Top = 16
  end
end
