object Form22: TForm22
  Left = 265
  Top = 252
  Width = 1005
  Height = 636
  Caption = 'Form22'
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
  object Edit1: TEdit
    Left = 760
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 0
    Width = 977
    Height = 561
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'zavn'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1057#1058#1056' '#8470
        Width = 25
      end
      item
        EditButtons = <>
        FieldName = 'ident'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1057#1055
      end
      item
        EditButtons = <>
        FieldName = 'poz'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1086#1079#1080#1094#1080#1103
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'podpoz'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1086#1076#1087#1086#1079#1080#1094#1080#1103
      end
      item
        EditButtons = <>
        FieldName = 'rp'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end
      item
        EditButtons = <>
        FieldName = 'kod'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1086#1076
        Width = 75
      end
      item
        EditButtons = <>
        FieldName = 'namek'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1087#1086' '#1057#1055
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1054#1051'-'#1042#1054' '#1087#1086' '#1057#1055
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'tnnomer'
        Footers = <>
        ReadOnly = True
        Title.Caption = #8470#1058#1056#1045#1041
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'tndatedok'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1040#1058#1040' '#1057#1054#1047#1044#1040#1053#1048#1071
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'tndatedok2'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1054#1052#1058#1054
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'tndatedok4'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1072#1090#1072' '#1059#1057#1061
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'tndateins'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1044#1040#1058#1040' '#1047#1040#1050#1056#1067#1058#1048#1071
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ednamek'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1087#1086' '#1058#1056#1045#1041'.'
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'koluchet'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1054#1051'-'#1042#1054' '#1087#1086' '#1058#1056#1045#1041
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'ednamek1'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1057#1055
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'koluchet1'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1050#1054#1051'-'#1042#1054' '#1042' '#1058#1056#1045#1041#1054#1042#1040#1053#1048#1048' '#1087#1086' '#1045#1044'.'#1048#1047#1052'.'#1057#1055
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'tnn'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1058#1053
      end
      item
        EditButtons = <>
        FieldName = 'Doc_prih'
        Footers = <>
        Title.Caption = #1055#1088#1080#1093#1086#1076#1085#1099#1077' '#1086#1088#1076#1077#1088#1099
        Width = 500
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 568
    Width = 75
    Height = 25
    Caption = 'EXCEL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 936
    Top = 128
    object OraQuery1Field: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1ident: TStringField
      FieldName = 'ident'
    end
    object OraQuery1poz: TStringField
      FieldName = 'poz'
    end
    object OraQuery1podpoz: TStringField
      FieldName = 'podpoz'
    end
    object OraQuery1rp: TStringField
      FieldName = 'rp'
    end
    object OraQuery1kod: TStringField
      FieldName = 'kod'
    end
    object OraQuery1namek: TStringField
      FieldName = 'namek'
    end
    object OraQuery1kol: TFloatField
      FieldName = 'kol'
    end
    object OraQuery1tnnomer: TStringField
      FieldName = 'tnnomer'
    end
    object OraQuery1tndatedok: TStringField
      FieldName = 'tndatedok'
    end
    object OraQuery1tndateins: TStringField
      FieldName = 'tndateins'
    end
    object OraQuery1ednamek: TStringField
      FieldName = 'ednamek'
    end
    object OraQuery1koluchet: TFloatField
      FieldName = 'koluchet'
    end
    object OraQuery1ednamek1: TStringField
      FieldName = 'ednamek1'
    end
    object OraQuery1koluchet1: TFloatField
      FieldName = 'koluchet1'
    end
    object OraQuery1tnn: TStringField
      FieldName = 'tnn'
    end
    object OraQuery1Doc_prih: TStringField
      DisplayWidth = 128
      FieldKind = fkCalculated
      FieldName = 'Doc_prih'
      Size = 300
      Calculated = True
    end
    object OraQuery1tndatedok2: TStringField
      FieldName = 'tndatedok2'
    end
    object OraQuery1tndatedok4: TStringField
      FieldName = 'tndatedok4'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 760
    Top = 88
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 832
    Top = 56
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 936
    Top = 88
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 880
    Top = 96
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 896
    Top = 184
  end
  object SaveDialog1: TSaveDialog
    Left = 904
    Top = 56
  end
end
