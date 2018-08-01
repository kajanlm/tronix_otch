object Form48: TForm48
  Left = 256
  Top = 210
  Width = 776
  Height = 338
  Caption = 'Form48'
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
  object TabControl1: TTabControl
    Left = 0
    Top = 0
    Width = 753
    Height = 289
    TabOrder = 0
    Tabs.Strings = (
      #1042#1089#1077
      #1047#1072#1082#1088#1099#1090#1099#1077
      #1042' '#1088#1072#1073#1086#1090#1077
      #1063#1077#1088#1085#1086#1074#1080#1082#1080)
    TabIndex = 0
    OnChange = TabControl1Change
    object DBGridEh1: TDBGridEh
      Left = 8
      Top = 32
      Width = 729
      Height = 241
      DataSource = OraDataSource1
      Flat = False
      FooterColor = clWindow
      FooterFont.Charset = DEFAULT_CHARSET
      FooterFont.Color = clWindowText
      FooterFont.Height = -11
      FooterFont.Name = 'MS Sans Serif'
      FooterFont.Style = []
      FooterRowCount = 1
      SumList.Active = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          EditButtons = <>
          FieldName = 'nomer'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1053#1086#1084#1077#1088
        end
        item
          EditButtons = <>
          FieldName = 'dep'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1062#1077#1093
          Width = 40
        end
        item
          EditButtons = <>
          FieldName = 'date_dok'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'data_vvoda'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1047#1072#1087#1091#1089#1082#1072
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'data_otchet'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1044#1072#1090#1072' '#1054#1090#1095#1077#1090#1072
          Width = 90
        end
        item
          EditButtons = <>
          FieldName = 'isp'
          Footers = <>
          ReadOnly = True
          Title.Caption = #1048#1089#1087#1086#1083#1085#1080#1090#1077#1083#1100
          Width = 200
        end
        item
          EditButtons = <>
          FieldName = 'trudoem'
          Footer.FieldName = 'trudoem'
          Footers = <
            item
              FieldName = 'trudoem'
              ValueType = fvtSum
            end>
          ReadOnly = True
          Title.Caption = #1058#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1100
          Width = 80
        end>
    end
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 616
    Top = 16
    object OraQuery1nomer: TStringField
      DisplayWidth = 16
      FieldName = 'nomer'
      Size = 0
    end
    object OraQuery1dep: TStringField
      FieldName = 'dep'
    end
    object OraQuery1date_dok: TStringField
      FieldName = 'date_dok'
    end
    object OraQuery1data_vvoda: TStringField
      FieldName = 'data_vvoda'
    end
    object OraQuery1data_otchet: TStringField
      FieldName = 'data_otchet'
    end
    object OraQuery1anul: TStringField
      FieldName = 'anul'
    end
    object OraQuery1isp: TStringField
      FieldName = 'isp'
    end
    object OraQuery1trudoem: TFloatField
      FieldName = 'trudoem'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 656
    Top = 56
  end
end
