object Form28: TForm28
  Left = 374
  Top = 171
  Width = 1017
  Height = 751
  Anchors = []
  AutoSize = True
  Caption = 'Form28'
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
  DesignSize = (
    1001
    713)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 1001
    Height = 673
    Anchors = []
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
  end
  object Edit1: TEdit
    Left = 497
    Top = 0
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 496
    Top = 24
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 16
    Top = 688
    Width = 75
    Height = 25
    Caption = 'Excel'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 512
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 992
    Top = 8
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1sprkod: TStringField
      FieldName = 'sprkod'
    end
    object OraQuery1potr: TFloatField
      FieldName = 'potr'
    end
    object OraQuery1potr_koded: TStringField
      FieldName = 'potr_koded'
    end
    object OraQuery1potr_dop: TFloatField
      FieldName = 'potr_dop'
    end
    object OraQuery1potr_koded_dop: TStringField
      FieldName = 'potr_koded_dop'
    end
    object OraQuery1zavod: TFloatField
      FieldName = 'zavod'
    end
    object OraQuery1cex: TFloatField
      FieldName = 'cex'
    end
    object OraQuery1vidano: TFloatField
      FieldName = 'vidano'
    end
    object OraQuery1nomer_tk: TStringField
      FieldName = 'nomer_tk'
    end
    object OraQuery1izmdatpoz: TStringField
      FieldName = 'izmdatpoz'
    end
    object OraQuery1up_texkompl_id: TStringField
      FieldName = 'up_texkompl_id'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 952
    Top = 8
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
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
