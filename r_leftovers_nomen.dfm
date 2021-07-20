object leftovers: Tleftovers
  Left = 426
  Top = 422
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1054#1089#1090#1072#1090#1082#1080' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099' '#1087#1086' '#1089#1082#1083#1072#1076#1072#1084
  ClientHeight = 91
  ClientWidth = 547
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
    Left = 0
    Top = 0
    Width = 72
    Height = 24
    Caption = #1055#1088#1086#1077#1082#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 0
    Top = 32
    Width = 58
    Height = 24
    Caption = #1047#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 0
    Top = 64
    Width = 60
    Height = 24
    Caption = #1057#1082#1083#1072#1076
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object projects: TComboBox
    Left = 72
    Top = 0
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 0
    OnChange = projectsChange
  end
  object invi_projects: TComboBox
    Left = 216
    Top = 0
    Width = 17
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object zakaz: TComboBox
    Left = 72
    Top = 32
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    Enabled = False
    ItemHeight = 16
    TabOrder = 2
  end
  object invi_zakaz: TComboBox
    Left = 216
    Top = 32
    Width = 17
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Visible = False
  end
  object dep: TComboBox
    Left = 72
    Top = 64
    Width = 145
    Height = 22
    Style = csOwnerDrawFixed
    ItemHeight = 16
    TabOrder = 4
  end
  object invi_dep: TComboBox
    Left = 216
    Top = 64
    Width = 17
    Height = 21
    ItemHeight = 13
    TabOrder = 5
    Text = 'invi_dep'
    Visible = False
  end
  object filter_type: TCheckListBox
    Left = 231
    Top = 0
    Width = 169
    Height = 89
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 20
    Items.Strings = (
      #1052#1072#1090#1077#1088#1080#1072#1083#1099
      #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      #1052#1057#1063
      #1042#1057#1045)
    ParentFont = False
    TabOrder = 6
    OnClick = filter_typeClick
  end
  object Button1: TButton
    Left = 408
    Top = 16
    Width = 129
    Height = 57
    Caption = #1057#1060#1054#1056#1052#1048#1056#1054#1042#1040#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = Button1Click
  end
  object OraQueryS: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 352
    Top = 88
  end
end
