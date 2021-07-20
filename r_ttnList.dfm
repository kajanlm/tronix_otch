object ttn_list: Tttn_list
  Left = 407
  Top = 296
  BorderStyle = bsSingle
  Caption = #1057#1087#1080#1089#1086#1082' '#1076#1086#1082#1091#1084#1077#1085#1090#1086#1074
  ClientHeight = 102
  ClientWidth = 785
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
    Left = 16
    Top = 16
    Width = 89
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
    Left = 397
    Top = 14
    Width = 388
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = '<'#1055#1056#1054#1045#1050#1058' '#1053#1045' '#1042#1067#1041#1056#1040#1053'>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 56
    Top = 48
    Width = 89
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1044#1086#1082#1091#1084#1077#1085#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 208
    Top = 48
    Width = 113
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1072' '#1087#1077#1088#1080#1086#1076' '#1089
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 344
    Top = 72
    Width = 73
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1047#1072#1082#1088#1099#1090#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object label5: TLabel
    Left = 440
    Top = 72
    Width = 73
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1054#1090#1082#1088#1099#1090#1099#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 408
    Top = 56
    Width = 33
    Height = 17
    Alignment = taCenter
    AutoSize = False
    Caption = #1042#1089#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object prs: TEdit
    Left = 112
    Top = 16
    Width = 137
    Height = 21
    TabOrder = 0
  end
  object setpr: TButton
    Left = 256
    Top = 8
    Width = 137
    Height = 33
    Caption = #1053#1040#1049#1058#1048' '#1055#1056#1054#1045#1050#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = setprClick
  end
  object ttn_type: TComboBox
    Left = 32
    Top = 72
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 2
  end
  object invi_ttn_type: TComboBox
    Left = 24
    Top = 80
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 3
    Visible = False
  end
  object datefrom: TDateTimePicker
    Left = 208
    Top = 68
    Width = 113
    Height = 28
    Date = 43444.472996365730000000
    Time = 43444.472996365730000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = datefromChange
  end
  object chkbx_date: TCheckBox
    Left = 184
    Top = 72
    Width = 17
    Height = 17
    TabOrder = 5
  end
  object chkbx_closed: TCheckBox
    Left = 328
    Top = 72
    Width = 17
    Height = 17
    TabOrder = 6
    OnClick = chkbx_closedClick
  end
  object chkbx_opened: TCheckBox
    Left = 424
    Top = 72
    Width = 17
    Height = 17
    TabOrder = 7
    OnClick = chkbx_openedClick
  end
  object chkbx_all: TCheckBox
    Left = 392
    Top = 56
    Width = 17
    Height = 17
    Checked = True
    State = cbChecked
    TabOrder = 8
    OnClick = chkbx_allClick
  end
  object dep_type: TComboBox
    Left = 520
    Top = 40
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 9
    OnChange = dep_typeChange
  end
  object invi_dep_type: TComboBox
    Left = 512
    Top = 48
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 10
    Visible = False
  end
  object dep: TComboBox
    Left = 520
    Top = 72
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 11
  end
  object invi_dep: TComboBox
    Left = 512
    Top = 80
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 12
    Visible = False
  end
  object up: TButton
    Left = 672
    Top = 44
    Width = 105
    Height = 45
    Caption = #1054#1058#1063#1045#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = upClick
  end
  object Query: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 808
    Top = 65528
  end
end
