object Form31: TForm31
  Left = 223
  Top = 223
  Width = 873
  Height = 589
  Caption = 'Form31'
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
    Left = 24
    Top = 24
    Width = 825
    Height = 513
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
    Columns = <
      item
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Width = 400
      end
      item
        EditButtons = <>
        FieldName = 'DEP'
        Footers = <>
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'TRUDOEM'
        Footers = <>
      end>
  end
  object Edit1: TEdit
    Left = 536
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 360
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 216
    Top = 0
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 744
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NAME'
        DataType = ftString
        Size = 1000
      end
      item
        Name = 'DEP'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'TRUDOEM'
        DataType = ftFloat
      end
      item
        Name = 'TEXCOMPL_BEFO'
        DataType = ftFloat
      end
      item
        Name = 'TEXCOMPL_AFTO'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <
      item
        DataType = ftUnknown
        ParamType = ptUnknown
      end>
    DataDriver = DataSetDriverEh1
    ReadOnly = True
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'texcompl_befo'
    TreeList.RefParentFieldName = 'texcompl_afto'
    TreeList.DefaultNodeExpanded = True
    TreeList.DefaultNodeHasChildren = True
    Left = 648
    Top = 48
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    Left = 648
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 752
    Top = 72
  end
end
