object equipment_details: Tequipment_details
  Left = 611
  Top = 346
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1086#1089#1085#1072#1089#1090#1082#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
  ClientHeight = 149
  ClientWidth = 329
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 56
    Top = 8
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1055#1088#1086#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object zak: TLabel
    Left = 0
    Top = 80
    Width = 329
    Height = 41
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    WordWrap = True
  end
  object Label2: TLabel
    Left = 56
    Top = 40
    Width = 65
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object prs: TComboBox
    Left = 128
    Top = 8
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnClick = prsClick
  end
  object invi_prs: TComboBox
    Left = 128
    Top = -8
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 1
    Visible = False
  end
  object create: TButton
    Left = 104
    Top = 120
    Width = 121
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = equipmentToExcel
  end
  object zakaz: TComboBox
    Left = 128
    Top = 40
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    OnClick = zakazClick
  end
  object invi_zakaz: TComboBox
    Left = 128
    Top = 32
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
    Visible = False
  end
  object OraQuery: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Top = 120
  end
end
