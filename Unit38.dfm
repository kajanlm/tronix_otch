object Form38: TForm38
  Left = 354
  Top = 202
  Width = 948
  Height = 661
  Caption = 'Form38'
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
    Left = 208
    Top = 592
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 256
    Top = 592
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 929
    Height = 569
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
    Top = 584
    Width = 75
    Height = 25
    Caption = #1042' '#1101#1082#1089#1077#1083#1100
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 880
    Top = 24
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 880
    Top = 64
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 808
    Top = 48
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 880
    Top = 112
  end
end
