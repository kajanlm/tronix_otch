object Form18: TForm18
  Left = 229
  Top = 239
  Width = 1007
  Height = 675
  Caption = 'Form18'
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
  object Edit1: TEdit
    Left = 840
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 969
    Height = 601
    DataSource = OraDataSource1
    Flat = False
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
    OnDblClick = DBGridEh1DblClick
  end
  object OraSession1: TOraSession
    Username = 'nordsy'
    Password = 'ncd'
    LoginPrompt = False
    Left = 960
    Top = 32
  end
  object OraQuery1: TOraQuery
    Session = OraSession1
    ReadOnly = True
    Left = 960
    Top = 56
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 960
    Top = 8
  end
end
