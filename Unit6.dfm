object Form6: TForm6
  Left = 490
  Top = 261
  Width = 1155
  Height = 676
  Caption = 'Form6'
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
  object StringGrid1: TStringGrid
    Left = 8
    Top = 8
    Width = 1129
    Height = 601
    ColCount = 11
    RowCount = 2
    FixedRows = 0
    TabOrder = 0
  end
  object Button1: TButton
    Left = 8
    Top = 608
    Width = 89
    Height = 25
    Caption = #1042' exel'
    TabOrder = 1
    OnClick = Button1Click
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 1185
    Height = 17
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1053
  end
  object OraDataSource1: TOraDataSource
    Left = 1029
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1085
    Top = 32
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1085
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 816
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 848
    Top = 8
  end
  object OraQuery4: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1077
    Top = 64
  end
  object OraQuery5: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1045
    Top = 32
  end
  object OraQuery6: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1040
    Top = 64
  end
  object OraQuery7: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1085
    Top = 96
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 784
    Top = 8
  end
  object ExcelOLEObject1: TExcelOLEObject
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 912
  end
  object OraQuery8: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 1045
    Top = 96
  end
  object OraQuery9: TOraQuery
    Session = Form1.OraSession1
    Left = 1088
    Top = 136
  end
  object OraQuery10: TOraQuery
    Session = Form1.OraSession1
    Left = 992
    Top = 40
  end
end
