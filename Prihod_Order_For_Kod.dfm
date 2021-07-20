object FPrihod_Order_For_Kod: TFPrihod_Order_For_Kod
  Left = 236
  Top = 138
  Width = 651
  Height = 213
  Anchors = []
  Caption = 'FPrihod_Order_For_Kod'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object EditKod: TEdit
    Left = 177
    Top = 21
    Width = 247
    Height = 28
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = EditKodChange
  end
  object Edit2: TEdit
    Left = 120
    Top = 141
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 440
    Top = 153
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 248
    Top = 92
    Width = 129
    Height = 28
    Caption = #1042#1067#1041#1056#1040#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button2Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 552
    Top = 112
    object OraQuery1kodm: TStringField
      FieldName = 'kodm'
    end
    object OraQuery1npo: TFloatField
      FieldName = 'npo'
    end
    object OraQuery1nomp: TStringField
      FieldName = 'nomp'
    end
    object OraQuery1dvi: TStringField
      FieldName = 'dvi'
    end
    object OraQuery1edi: TStringField
      FieldName = 'edi'
    end
    object OraQuery1kol: TFloatField
      FieldName = 'kol'
    end
    object OraQuery1cena: TFloatField
      FieldName = 'cena'
    end
    object OraQuery1sup: TFloatField
      FieldName = 'sup'
    end
    object OraQuery1sumnds: TFloatField
      FieldName = 'sumnds'
    end
    object OraQuery1zakaz: TStringField
      FieldName = 'zakaz'
    end
    object OraQuery1dnakl: TStringField
      FieldName = 'dnakl'
    end
    object OraQuery1nomnakl: TStringField
      FieldName = 'nomnakl'
    end
    object OraQuery1dschf: TStringField
      FieldName = 'dschf'
    end
    object OraQuery1nomschf: TStringField
      FieldName = 'nomschf'
    end
    object OraQuery1kodpr: TStringField
      FieldName = 'kodpr'
    end
    object OraQuery1inn: TStringField
      FieldName = 'inn'
    end
    object OraQuery1kpp: TStringField
      FieldName = 'kpp'
    end
    object OraQuery1naimpost: TStringField
      FieldName = 'naimpost'
    end
    object OraQuery1naim: TStringField
      FieldName = 'naim'
    end
    object OraQuery1dok: TStringField
      FieldName = 'dok'
    end
    object OraQuery1dvii: TStringField
      FieldName = 'dvii'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 560
    Top = 72
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 512
    Top = 64
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 512
    Top = 112
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 448
    Top = 96
  end
end
