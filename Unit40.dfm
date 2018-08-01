object Form40: TForm40
  Left = 376
  Top = 142
  Width = 890
  Height = 430
  Caption = 'Form40'
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
  object Label1: TLabel
    Left = 48
    Top = 368
    Width = 303
    Height = 13
    Caption = #1042#1053#1048#1052#1040#1053#1048#1045'!!!! '#1058#1045#1057#1058#1054#1042#1040#1071' '#1069#1050#1057#1055#1051#1059#1040#1058#1040#1062#1048#1071'!!!!!!!!!!!!!!!!!!!!!!!!!'
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 16
    Width = 841
    Height = 345
    DataSource = OraDataSource2
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
        FieldName = 'nom1'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        ReadOnly = True
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 571
      end>
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 808
    Top = 24
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 808
    Top = 64
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 768
  end
  object OraDataSource2: TOraDataSource
    DataSet = MemTableEh1
    Left = 744
    Top = 112
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery2
    Left = 776
    Top = 32
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <
      item
        Name = 'TK2'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    DataDriver = DataSetDriverEh1
    ReadOnly = True
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'tk2'
    TreeList.RefParentFieldName = 'tk1'
    TreeList.DefaultNodeExpanded = True
    TreeList.DefaultNodeHasChildren = True
    Left = 760
    Top = 64
  end
end
