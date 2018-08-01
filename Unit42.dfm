object Form42: TForm42
  Left = 269
  Top = 245
  Width = 967
  Height = 479
  Caption = 'Form42'
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
    Top = 16
    Width = 889
    Height = 409
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        EditButtons = <>
        FieldName = 'doc'
        Footers = <>
        Width = 190
      end
      item
        EditButtons = <>
        FieldName = 'poz'
        Footers = <>
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        Width = 200
      end
      item
        EditButtons = <>
        FieldName = 'kol'
        Footers = <>
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'ntk1'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ntk2'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ntk3'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ntk4'
        Footers = <>
        Width = 100
      end
      item
        EditButtons = <>
        FieldName = 'ntk5'
        Footers = <>
        Width = 100
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    MasterSource = OraDataSource1
    FetchAll = True
    ReadOnly = True
    Left = 912
    Top = 16
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 912
    Top = 128
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <>
    Params = <>
    DataDriver = DataSetDriverEh1
    ReadOnly = True
    StoreDefs = True
    TreeList.KeyFieldName = 'nn'
    TreeList.RefParentFieldName = 'up_nn'
    Left = 904
    Top = 96
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    Left = 904
    Top = 56
  end
end
