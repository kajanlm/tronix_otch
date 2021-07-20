object FRasxod_proekt_years_zatr_otgr_mt: TFRasxod_proekt_years_zatr_otgr_mt
  Left = 224
  Top = 268
  Width = 679
  Height = 198
  Anchors = []
  Caption = 'FRasxod_proekt_years_zatr_otgr_mt'
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
  object Edit1: TEdit
    Left = 489
    Top = 5
    Width = 184
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 72
    Top = 13
    Width = 249
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 344
    Top = 9
    Width = 121
    Height = 21
    TabOrder = 5
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
    Left = 592
    Top = 144
    object OraQuery1prizn: TStringField
      FieldName = 'prizn'
    end
    object OraQuery1godins: TStringField
      FieldName = 'godins'
    end
    object OraQuery1kodotgr: TStringField
      FieldName = 'kodotgr'
    end
    object OraQuery1kolotgr: TFloatField
      FieldName = 'kolotgr'
    end
    object OraQuery1edotgrosn: TStringField
      FieldName = 'edotgrosn'
    end
    object OraQuery1kodzatr: TStringField
      FieldName = 'kodzatr'
    end
    object OraQuery1kolzatr: TFloatField
      FieldName = 'kolzatr'
    end
    object OraQuery1edzatrosn: TStringField
      FieldName = 'edzatrosn'
    end
    object OraQuery1nameotgr: TStringField
      FieldName = 'nameotgr'
    end
    object OraQuery1namezatr: TStringField
      FieldName = 'namezatr'
    end
    object OraQuery1proe: TStringField
      FieldName = 'proe'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 544
    Top = 65464
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 568
    Top = 64
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 664
    Top = 96
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 480
    Top = 112
  end
end
