object Form2: TForm2
  Left = 606
  Top = 190
  Width = 341
  Height = 270
  Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1087#1086' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1089#1074#1086#1076#1085#1072#1103'!'
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
    Left = 59
    Top = 8
    Width = 107
    Height = 13
    Caption = #1057#1090#1088#1086#1080#1090#1077#1083#1100#1085#1099#1081' '#1047#1072#1082#1072#1079
  end
  object Label2: TLabel
    Left = 60
    Top = 45
    Width = 78
    Height = 13
    Caption = #1059#1095#1077#1090#1085#1099#1081' '#1047#1072#1082#1072#1079
  end
  object Label3: TLabel
    Left = 83
    Top = 160
    Width = 3
    Height = 13
  end
  object Edit1: TEdit
    Left = 0
    Top = 24
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnDblClick = Edit1DblClick
  end
  object Edit2: TEdit
    Left = 1
    Top = 61
    Width = 305
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 8
    Top = 200
    Width = 113
    Height = 27
    Caption = #1047#1072#1087#1091#1089#1090#1080#1090#1100' '#1086#1090#1095#1077#1090
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 128
    Top = 200
    Width = 121
    Height = 26
    Caption = #1042#1099#1093#1086#1076
    TabOrder = 3
    OnClick = Button2Click
  end
  object ComboBox1: TComboBox
    Left = 0
    Top = 104
    Width = 305
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    OnSelect = ComboBox1Select
  end
  object Edit3: TEdit
    Left = 200
    Top = 128
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 5
    Text = 'Edit3'
    Visible = False
  end
  object Button3: TButton
    Left = 120
    Top = 128
    Width = 75
    Height = 25
    Caption = 'Button3'
    TabOrder = 6
    Visible = False
    OnClick = Button3Click
  end
  object ProgressBar1: TProgressBar
    Left = 0
    Top = 180
    Width = 321
    Height = 17
    TabOrder = 7
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 232
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 264
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 296
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 200
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 184
    Top = 8
  end
end
