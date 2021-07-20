object FPrihod_Order_Cfek: TFPrihod_Order_Cfek
  Left = 236
  Top = 138
  Width = 651
  Height = 213
  Anchors = []
  Caption = 'FPrihod_Order_Cfek'
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
  object Label1: TLabel
    Left = 170
    Top = 41
    Width = 18
    Height = 20
    Alignment = taRightJustify
    Caption = #1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 318
    Top = 41
    Width = 27
    Height = 20
    Alignment = taRightJustify
    Caption = #1055#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 169
    Top = 133
    Width = 247
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 160
    Top = 93
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
  object DateTimePicker1: TDateTimePicker
    Left = 189
    Top = 36
    Width = 124
    Height = 28
    Date = 43405.428657766210000000
    Time = 43405.428657766210000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnChange = DateTimePicker1Change
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
  object DateTimePicker2: TDateTimePicker
    Left = 349
    Top = 36
    Width = 124
    Height = 28
    Date = 43405.428657766210000000
    Time = 43405.428657766210000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnChange = DateTimePicker2Change
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
    object OraQuery1kol: TStringField
      FieldName = 'kol'
    end
    object OraQuery1cena: TStringField
      FieldName = 'cena'
    end
    object OraQuery1sup: TStringField
      FieldName = 'sup'
    end
    object OraQuery1sumnds: TStringField
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
    object OraQuery1npoo: TFloatField
      FieldName = 'npoo'
    end
    object OraQuery1dok: TStringField
      FieldName = 'dok'
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
