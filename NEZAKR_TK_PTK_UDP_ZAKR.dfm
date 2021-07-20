object FNEZAKR_TK_PTK_UDP_ZAKR: TFNEZAKR_TK_PTK_UDP_ZAKR
  Left = 390
  Top = 177
  Width = 473
  Height = 223
  Anchors = []
  AutoSize = True
  Caption = 'FNEZAKR_TK_PTK_UDP_ZAKR'
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
    Left = 177
    Top = 168
    Width = 247
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 216
    Top = 56
    Width = 249
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 0
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 104
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1udpdateotk: TStringField
      FieldName = 'udpdateotk'
    end
    object OraQuery1tk: TStringField
      FieldName = 'tk'
    end
    object OraQuery1cextk: TStringField
      FieldName = 'cextk'
    end
    object OraQuery1tkflbeg: TStringField
      FieldName = 'tkflbeg'
    end
    object OraQuery1tkdatotk: TStringField
      FieldName = 'tkdatotk'
    end
    object OraQuery1tx: TStringField
      FieldName = 'tx'
    end
    object OraQuery1cextx: TStringField
      FieldName = 'cextx'
    end
    object OraQuery1txflbeg: TStringField
      FieldName = 'txflbeg'
    end
    object OraQuery1txotk: TStringField
      FieldName = 'txotk'
    end
    object OraQuery1txdatotk: TStringField
      FieldName = 'txdatotk'
    end
    object OraQuery1trnorm: TFloatField
      FieldName = 'trnorm'
    end
    object OraQuery1trzakr: TFloatField
      FieldName = 'trzakr'
    end
    object OraQuery1trost: TFloatField
      FieldName = 'trost'
    end
    object OraQuery1procent: TFloatField
      FieldName = 'procent'
    end
    object OraQuery1zavn: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1zak: TStringField
      FieldName = 'zak'
    end
    object OraQuery1proekt: TStringField
      FieldName = 'proekt'
    end
    object OraQuery1abrudp: TStringField
      FieldName = 'abrudp'
    end
    object OraQuery1tkname: TStringField
      FieldName = 'tkname'
    end
    object OraQuery1txname: TStringField
      FieldName = 'txname'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1008
    Top = 104
  end
  object SaveDialog1: TSaveDialog
    Left = 680
    Top = 360
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 872
    Top = 208
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 872
    Top = 256
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 800
    Top = 168
  end
end
