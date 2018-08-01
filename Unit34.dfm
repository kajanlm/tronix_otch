object Form34: TForm34
  Left = 386
  Top = 206
  Width = 428
  Height = 168
  Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1076#1072#1085#1085#1099#1093' '#1074' project'
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
    Left = 8
    Top = 114
    Width = 3
    Height = 13
  end
  object Label2: TLabel
    Left = 6
    Top = 18
    Width = 62
    Height = 13
    Caption = #1060#1072#1081#1083' '#1087#1083#1072#1085#1072
  end
  object Label3: TLabel
    Left = 21
    Top = 56
    Width = 37
    Height = 13
    Caption = #1055#1088#1086#1077#1082#1090
  end
  object Label4: TLabel
    Left = 352
    Top = 80
    Width = 3
    Height = 13
    Visible = False
  end
  object Button1: TButton
    Left = 496
    Top = 48
    Width = 249
    Height = 25
    Caption = #1042#1099#1075#1088#1091#1079#1080#1090#1100' '#1076#1072#1085#1085#1099#1077' '#1074' '#1085#1086#1074#1099#1081' '#1087#1088#1086#1077#1082#1090
    TabOrder = 0
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 504
    Top = 72
    Width = 249
    Height = 25
    Caption = #1053#1086#1074#1099#1081
    TabOrder = 1
    Visible = False
    OnClick = Button2Click
  end
  object DBGridEh1: TDBGridEh
    Left = 552
    Top = 96
    Width = 249
    Height = 145
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
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 680
    Top = 248
    Width = 169
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1086' '#1089#1074#1103#1079#1080' '#1091#1088#1086#1074#1077#1085#1100' 2'
    Checked = True
    State = cbChecked
    TabOrder = 4
    Visible = False
  end
  object StringGrid1: TStringGrid
    Left = 416
    Top = 96
    Width = 137
    Height = 201
    ColCount = 2
    RowCount = 6
    FixedRows = 0
    TabOrder = 2
    Visible = False
    RowHeights = (
      24
      24
      24
      24
      24
      24)
  end
  object Button3: TButton
    Left = 560
    Top = 248
    Width = 113
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1056#1067#1041#1059
    TabOrder = 5
    Visible = False
    OnClick = Button3Click
  end
  object CheckBox2: TCheckBox
    Left = 680
    Top = 264
    Width = 169
    Height = 17
    Caption = #1055#1088#1086#1089#1090#1072#1074#1080#1090#1100' '#1087#1086#1076#1101#1090#1072#1087#1099' '#1085#1072' '#1058#1050
    Checked = True
    State = cbChecked
    TabOrder = 6
    Visible = False
  end
  object Edit1: TEdit
    Left = 77
    Top = 16
    Width = 273
    Height = 21
    TabOrder = 7
  end
  object Button4: TButton
    Left = 357
    Top = 14
    Width = 41
    Height = 21
    Caption = '...'
    TabOrder = 8
    OnClick = Button4Click
  end
  object Edit2: TEdit
    Left = 75
    Top = 52
    Width = 271
    Height = 21
    TabOrder = 9
  end
  object Button5: TButton
    Left = 356
    Top = 49
    Width = 42
    Height = 22
    Caption = '....'
    TabOrder = 10
    OnClick = Button5Click
  end
  object Button6: TButton
    Left = 8
    Top = 80
    Width = 105
    Height = 25
    Caption = #1042#1087#1077#1088#1077#1076'!'
    TabOrder = 11
    OnClick = Button6Click
  end
  object CheckBox3: TCheckBox
    Left = 126
    Top = 84
    Width = 145
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1087#1086' '#1093#1086#1076#1091
    TabOrder = 12
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      'Select * from tx_texkompl')
    FetchAll = True
    ReadOnly = True
    Left = 568
    Top = 280
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    AutoCommit = False
    Left = 1328
    Top = 216
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 608
    Top = 280
  end
  object OpenDialog1: TOpenDialog
    Left = 416
    Top = 8
  end
end
