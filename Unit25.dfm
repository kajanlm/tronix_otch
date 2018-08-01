object Form25: TForm25
  Left = 213
  Top = 258
  Width = 871
  Height = 474
  Caption = 'Form25'
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
    Left = 728
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 8
    Width = 833
    Height = 385
    DataSource = OraDataSource1
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
  end
  object Button1: TButton
    Left = 24
    Top = 408
    Width = 75
    Height = 25
    Caption = #1042' '#1077#1082#1089#1077#1083#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery1CalcFields
    Left = 824
    Top = 48
    object OraQuery1texkompl: TFloatField
      FieldName = 'texkompl'
    end
    object OraQuery1nomer: TStringField
      FieldName = 'nomer'
    end
    object OraQuery1name1: TStringField
      FieldName = 'name1'
    end
    object OraQuery1razlov1: TStringField
      FieldName = 'razlov1'
    end
    object OraQuery1kod1: TStringField
      FieldName = 'kod1'
    end
    object OraQuery1kol1: TFloatField
      FieldName = 'kol1'
    end
    object OraQuery1vid1: TStringField
      FieldName = 'vid1'
    end
    object OraQuery1name2: TStringField
      FieldName = 'name2'
    end
    object OraQuery1razlov2: TStringField
      FieldName = 'razlov2'
    end
    object OraQuery1kod2: TStringField
      FieldName = 'kod2'
    end
    object OraQuery1kol2: TFloatField
      FieldName = 'kol2'
    end
    object OraQuery1vid2: TStringField
      FieldName = 'vid2'
    end
    object OraQuery1certezh2: TStringField
      FieldName = 'certezh2'
    end
    object OraQuery1TH: TStringField
      FieldKind = fkCalculated
      FieldName = 'TH'
      Size = 50
      Calculated = True
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 792
    Top = 56
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 776
    Top = 104
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 800
    Top = 200
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 792
    Top = 248
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 752
    Top = 208
  end
  object SaveDialog1: TSaveDialog
    Left = 672
    Top = 24
  end
end
