object Form35: TForm35
  Left = 352
  Top = 258
  Width = 808
  Height = 551
  Caption = 'Form35'
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
    Left = 664
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 16
    Width = 761
    Height = 457
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 350
      end
      item
        EditButtons = <>
        FieldName = 'sprkod'
        Footers = <>
        Title.Caption = #1050#1086#1076
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'sprname'
        Footers = <>
        Title.Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'nomer_tk'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088' '#1055#1058#1050
        Width = 60
      end>
  end
  object Button1: TButton
    Left = 32
    Top = 480
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 736
    Top = 80
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1sprname: TStringField
      FieldName = 'sprname'
    end
    object OraQuery1nomer_tk: TStringField
      FieldName = 'nomer_tk'
    end
    object OraQuery1sprkod: TStringField
      FieldName = 'sprkod'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 744
    Top = 136
  end
  object SaveDialog1: TSaveDialog
    Left = 544
    Top = 488
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 600
    Top = 480
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 648
    Top = 472
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 712
    Top = 480
  end
end
