object FRasxod_obor_otgr_prixod_order_for_bux: TFRasxod_obor_otgr_prixod_order_for_bux
  Left = 141
  Top = 144
  Width = 713
  Height = 257
  Anchors = []
  Caption = 'FRasxod_obor_otgr_prixod_order_for_bux'
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
    Left = 202
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
    Left = 350
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
    Left = 521
    Top = 109
    Width = 144
    Height = 21
    TabOrder = 3
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 512
    Top = 29
    Width = 161
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 464
    Top = 73
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
    Visible = False
  end
  object DateTimePicker1: TDateTimePicker
    Left = 221
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
    Left = 381
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
    Left = 280
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
    Left = 1032
    Top = 144
    object OraQuery1god: TStringField
      FieldName = 'god'
    end
    object OraQuery1nompr: TStringField
      FieldName = 'nompr'
    end
    object OraQuery1datpr: TStringField
      FieldName = 'datpr'
    end
    object OraQuery1nomtn: TStringField
      FieldName = 'nomtn'
    end
    object OraQuery1dattn: TStringField
      FieldName = 'dattn'
    end
    object OraQuery1nomschf: TStringField
      FieldName = 'nomschf'
    end
    object OraQuery1datschf: TStringField
      FieldName = 'datschf'
    end
    object OraQuery1post: TStringField
      FieldName = 'post'
    end
    object OraQuery1inn: TStringField
      FieldName = 'inn'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 984
    Top = 136
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 1224
    Top = 192
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1232
    Top = 128
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1192
    Top = 168
  end
end
