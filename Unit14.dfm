object Form14: TForm14
  Left = 276
  Top = 247
  Width = 957
  Height = 584
  Caption = 'Form14'
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
    Left = 848
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 929
    Height = 481
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
  object Button1: TButton
    Left = 8
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Up'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 512
    Width = 75
    Height = 25
    Caption = 'Down'
    TabOrder = 2
    OnClick = Button2Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 912
    Top = 40
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 880
    Top = 48
  end
end
