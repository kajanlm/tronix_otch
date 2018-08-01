object Form21: TForm21
  Left = 396
  Top = 225
  Width = 844
  Height = 590
  Caption = 'Form21'
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
  object Edit1: TEdit
    Left = 624
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 40
    Width = 785
    Height = 473
    DataSource = OraDataSource1
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 752
    Top = 8
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 784
    Top = 8
  end
end
