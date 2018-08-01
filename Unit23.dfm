object Form23: TForm23
  Left = 508
  Top = 293
  Width = 390
  Height = 195
  Caption = 'Form23'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 256
    Top = 24
    Width = 3
    Height = 13
    Visible = False
  end
  object Label2: TLabel
    Left = 256
    Top = 56
    Width = 3
    Height = 13
    Visible = False
  end
  object Label3: TLabel
    Left = 16
    Top = 128
    Width = 3
    Height = 13
    Visible = False
  end
  object Label4: TLabel
    Left = 0
    Top = 44
    Width = 138
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1087#1088#1086#1077#1082#1090' '#1096#1072#1073#1083#1086#1085#1072' '
  end
  object Label5: TLabel
    Left = 82
    Top = 78
    Width = 46
    Height = 13
    Caption = #1055#1088#1086#1077#1082#1090' 2'
  end
  object Label6: TLabel
    Left = 61
    Top = 110
    Width = 75
    Height = 13
    Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1059#1050#1056
  end
  object Label7: TLabel
    Left = 40
    Top = 8
    Width = 320
    Height = 16
    Caption = #1057#1088#1072#1074#1085#1080#1074#1072#1077#1084' '#1076#1083#1103' '#1087#1088#1086#1077#1082#1090#1072' '#1085#1072' '#1086#1090#1083#1080#1095#1080#1103' '#1087#1086' '#1058#1050
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 144
    Top = 42
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 0
    OnDblClick = Edit1DblClick
  end
  object Edit2: TEdit
    Left = 144
    Top = 74
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 1
    OnDblClick = Edit2DblClick
  end
  object Edit3: TEdit
    Left = 144
    Top = 103
    Width = 217
    Height = 21
    ReadOnly = True
    TabOrder = 2
    OnDblClick = Edit3DblClick
  end
  object Button1: TButton
    Left = 240
    Top = 128
    Width = 121
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 16
    Top = 16
  end
end
