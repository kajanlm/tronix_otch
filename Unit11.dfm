object Form11: TForm11
  Left = 567
  Top = 203
  Width = 946
  Height = 638
  Caption = 'Form11'
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
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 9
    Width = 907
    Height = 545
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 240
      end
      item
        EditButtons = <>
        FieldName = 'SUMA'
        Footers = <>
        Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'SUMM1'
        Footers = <>
        Title.Caption = #1058#1088#1091#1076
        Width = 120
      end
      item
        EditButtons = <>
        FieldName = 'DEP'
        Footers = <>
        Title.Caption = #1062#1045#1061
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'Delta'
        Footers = <>
        Title.Caption = #1054#1089#1090#1072#1090#1086#1082
      end
      item
        EditButtons = <>
        FieldName = 'texkompl_comment'
        Footers = <>
        Title.Caption = #1050#1086#1084#1084#1077#1085#1090#1072#1088#1080#1081
      end
      item
        EditButtons = <>
        FieldName = 'Pdate_end'
        Footers = <>
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 568
    Width = 97
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1074' Exel'
    TabOrder = 1
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 896
    Top = 16
    object OraQuery1NOMER: TStringField
      FieldName = 'NOMER'
    end
    object OraQuery1SUMA: TFloatField
      FieldName = 'SUMA'
    end
    object OraQuery1SUMM1: TFloatField
      FieldName = 'SUMM1'
    end
    object OraQuery1DEP: TStringField
      FieldName = 'DEP'
    end
    object OraQuery1LEVEL: TFloatField
      FieldName = 'LEVEL'
    end
    object OraQuery1Delta: TFloatField
      FieldKind = fkCalculated
      FieldName = 'Delta'
      Calculated = True
    end
    object OraQuery1texkompl_comment: TStringField
      FieldName = 'texkompl_comment'
    end
    object OraQuery1Pdate_end: TStringField
      FieldName = 'Pdate_end'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 872
    Top = 24
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 840
    Top = 16
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 816
    Top = 16
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 792
    Top = 16
  end
  object SaveDialog1: TSaveDialog
    Left = 752
    Top = 24
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 848
    Top = 64
  end
end
