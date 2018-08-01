object Form20: TForm20
  Left = 280
  Top = 255
  Width = 928
  Height = 565
  Caption = 'Form20'
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
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 8
    Width = 905
    Height = 473
    DataSource = OraDataSource1
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
  object Edit1: TEdit
    Left = 704
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Button1: TButton
    Left = 24
    Top = 496
    Width = 75
    Height = 25
    Caption = #1042' '#1045#1082#1089#1077#1083#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 856
    Top = 8
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 824
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 872
    Top = 64
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 880
    Top = 120
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 880
    Top = 224
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 864
    Top = 160
  end
end
