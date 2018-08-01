object Form5: TForm5
  Left = 233
  Top = 272
  Width = 1305
  Height = 675
  Caption = 'Form5'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Scaled = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 1273
    Height = 241
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
  end
  object StringGrid1: TStringGrid
    Left = 64
    Top = 288
    Width = 1193
    Height = 313
    RowCount = 2
    TabOrder = 1
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1256
    Top = 8
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1224
    Top = 16
  end
end
