object Form29: TForm29
  Left = 277
  Top = 130
  Width = 1215
  Height = 648
  Caption = 'Form29'
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
    Left = 1040
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 1040
    Top = 32
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
  end
  object BitBtn1: TBitBtn
    Left = 8
    Top = 576
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 2
    OnClick = BitBtn1Click
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 16
    Width = 1177
    Height = 545
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
  end
  object Edit3: TEdit
    Left = 896
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1152
    Top = 72
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1120
    Top = 80
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 1088
    Top = 64
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1088
    Top = 104
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1112
    Top = 144
  end
  object SaveDialog1: TSaveDialog
    Left = 968
    Top = 144
  end
end
