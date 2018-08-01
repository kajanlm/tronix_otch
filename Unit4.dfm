object Form4: TForm4
  Left = 422
  Top = 342
  Width = 909
  Height = 675
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1089#1074#1086#1076#1085#1072#1103' '#1087#1086' '
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 704
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 24
    Top = 8
    Width = 665
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object StringGrid1: TStringGrid
    Left = 16
    Top = 56
    Width = 849
    Height = 553
    ColCount = 1
    FixedCols = 0
    RowCount = 1
    FixedRows = 0
    TabOrder = 2
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 856
    Top = 8
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 824
    Top = 8
  end
  object OraQuery2: TOraQuery
    ReadOnly = True
    Left = 792
    Top = 8
  end
end
