object set_mnomen_details: Tset_mnomen_details
  Left = 229
  Top = 397
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  ClientHeight = 85
  ClientWidth = 1005
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 177
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1045#1076#1080#1085#1080#1094#1072' '#1080#1079#1084#1077#1088#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 344
    Top = 16
    Width = 81
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1077#1092#1080#1094#1080#1090':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object def: TLabel
    Left = 424
    Top = 16
    Width = 89
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = '46,265'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 512
    Top = 16
    Width = 193
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1053#1077#1086#1073#1093#1086#1076#1080#1084#1072#1103' '#1087#1086#1089#1090#1072#1074#1082#1072':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object left_label: TLabel
    Left = 832
    Top = 24
    Width = 169
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1054#1089#1090#1072#1083#1086#1089#1100' '#1087#1086#1089#1090#1072#1074#1080#1090#1100':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object Label3: TLabel
    Left = 8
    Top = 56
    Width = 121
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1058#1077#1093#1082#1086#1084#1087#1083#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 472
    Top = 56
    Width = 97
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edizm: TComboBox
    Left = 192
    Top = 16
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 0
    OnChange = edizmChange
  end
  object need: TEdit
    Left = 704
    Top = 13
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object invi_edizm: TComboBox
    Left = 168
    Top = 128
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object invi_need: TComboBox
    Left = 704
    Top = 117
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 4
    Visible = False
  end
  object invi_deficit: TComboBox
    Left = 344
    Top = 125
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Visible = False
  end
  object invi_zapas: TComboBox
    Left = 536
    Top = 117
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object invi_main_zapas: TComboBox
    Left = 536
    Top = 141
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 7
    Visible = False
  end
  object left: TEdit
    Left = 856
    Top = 45
    Width = 121
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    ReadOnly = True
    TabOrder = 8
    Visible = False
  end
  object Button1: TButton
    Left = 848
    Top = 27
    Width = 129
    Height = 41
    Caption = #1042#1053#1045#1057#1058#1048' '#1054#1053
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object texkompls: TComboBox
    Left = 160
    Top = 56
    Width = 265
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ParentFont = False
    TabOrder = 9
  end
  object ttns: TComboBox
    Left = 608
    Top = 56
    Width = 217
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 10
  end
  object invi_ttns: TComboBox
    Left = 456
    Top = 93
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 11
    Visible = False
  end
  object invi_texkompls: TComboBox
    Left = 184
    Top = 93
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    Visible = False
  end
end
