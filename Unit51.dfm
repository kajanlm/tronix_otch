object Form51: TForm51
  Left = 285
  Top = 210
  Width = 1072
  Height = 644
  Caption = 'Form51'
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
    Left = 896
    Top = 16
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 24
    Top = 16
    Width = 985
    Height = 553
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
  end
  object Button1: TButton
    Left = 32
    Top = 576
    Width = 161
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' 1'
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1008
    Top = 16
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 1016
    Top = 128
  end
  object MemTableEh1: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataSetDriverEh1
    SortOrder = 'poz DESC'
    TreeList.Active = True
    TreeList.KeyFieldName = 'nn'
    TreeList.RefParentFieldName = 'up_nn'
    Left = 1016
    Top = 88
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    Left = 1016
    Top = 48
  end
  object SaveDialog1: TSaveDialog
    Left = 1024
    Top = 184
  end
end
