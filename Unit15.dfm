object Form15: TForm15
  Left = 435
  Top = 191
  Width = 457
  Height = 236
  Caption = 'Form15'
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
    Top = 16
    Width = 103
    Height = 20
    Caption = #1087#1083#1072#1085' '#1084#1077#1089#1103#1094':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 69
    Top = 45
    Width = 38
    Height = 20
    Caption = #1062#1045#1061
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 22
    Top = 80
    Width = 87
    Height = 20
    Caption = #1053#1086#1084#1077#1088' '#1058#1050':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 30
    Top = 112
    Width = 85
    Height = 20
    Caption = #1044#1077#1092#1080#1094#1080#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 248
    Top = 51
    Width = 96
    Height = 13
    Caption = '% '#1076#1083#1103' '#1074#1099#1073#1086#1088#1072' '#1074#1089#1077#1093
  end
  object Edit1: TEdit
    Left = 120
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    OnDblClick = Edit1DblClick
  end
  object Edit2: TEdit
    Left = 120
    Top = 80
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 1
    Text = #1042#1099#1073#1077#1088#1080' '#1058#1053' '#1080#1083#1080' '#1043#1056#1059#1055#1055#1059
    OnDblClick = Edit2DblClick
  end
  object Edit3: TEdit
    Left = 264
    Top = 24
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
    Visible = False
  end
  object MonthCalendar1: TMonthCalendar
    Left = 248
    Top = 8
    Width = 191
    Height = 154
    Date = 41393.455676076390000000
    TabOrder = 3
    Visible = False
    OnDblClick = MonthCalendar1DblClick
  end
  object Edit5: TEdit
    Left = 120
    Top = 48
    Width = 121
    Height = 21
    TabOrder = 4
    Text = '15'
  end
  object Button1: TButton
    Left = 8
    Top = 168
    Width = 121
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object ComboBox1: TComboBox
    Left = 120
    Top = 112
    Width = 145
    Height = 19
    Style = csOwnerDrawFixed
    ItemHeight = 13
    TabOrder = 6
  end
  object CheckBox1: TCheckBox
    Left = 152
    Top = 176
    Width = 217
    Height = 17
    Hint = #1044#1086#1073#1072#1074#1080#1090' '#1074' '#1086#1090#1095#1077#1090' '#1074#1089#1077' '#1087#1086' '#1079#1080#1094#1080#1080' '#1089' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100#1102
    Caption = #1057' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100#1102
    TabOrder = 7
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 376
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 352
  end
end
