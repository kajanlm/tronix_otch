object over_tmc: Tover_tmc
  Left = 301
  Top = 292
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1048#1079#1083#1080#1096#1082#1080' '#1058#1052#1062' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
  ClientHeight = 56
  ClientWidth = 345
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
  object cb_cehs: TComboBox
    Left = 8
    Top = 16
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object invi_cb_cehs: TComboBox
    Left = 56
    Top = -8
    Width = 33
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    Visible = False
  end
  object Button1: TButton
    Left = 184
    Top = -3
    Width = 129
    Height = 57
    Caption = #1057#1060#1054#1056#1052#1048#1056#1054#1042#1040#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object OraQueryS: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 8
    Top = 40
  end
end
