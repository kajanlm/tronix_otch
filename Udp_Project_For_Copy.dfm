object FUdp_Project_For_Copy: TFUdp_Project_For_Copy
  Left = 790
  Top = 275
  Width = 437
  Height = 281
  Anchors = []
  AutoSize = True
  Caption = 'FUdp_Project_For_Copy'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    429
    247)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 24
    Width = 429
    Height = 223
    Anchors = []
    DataSource = OraDataSource1
    Flat = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentFont = False
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CHK_FLD'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 14
      end
      item
        EditButtons = <>
        FieldName = 'zavn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1042'.'#8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 49
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1055#1056#1054#1045#1050#1058#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 306
      end
      item
        EditButtons = <>
        FieldName = 'idpr'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'proekt'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Caption = #1055#1056#1054#1045#1050#1058
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end>
  end
  object Edit1: TEdit
    Left = 281
    Top = 126
    Width = 31
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 261
    Top = 222
    Width = 9
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 256
    Top = 174
    Width = 30
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object CheckBox1: TCheckBox
    Left = 158
    Top = 0
    Width = 195
    Height = 17
    Caption = #1087#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077' '#1087#1088#1086#1077#1082#1090#1099' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 4
    OnClick = CheckBox1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
    end
    object OraQuery1zavn: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1idpr: TIntegerField
      FieldName = 'idpr'
    end
    object OraQuery1proekt: TStringField
      FieldName = 'proekt'
    end
  end
  object OraQuery4: TOraQuery
    Left = 912
    Top = 608
    object OraQuery4udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery4name: TStringField
      FieldName = 'name'
      Size = 0
    end
    object OraQuery4datend: TStringField
      FieldName = 'datend'
      Size = 0
    end
    object OraQuery4idudp: TFloatField
      FieldName = 'idudp'
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
  object OraQuery2: TOraQuery
    Left = 232
    Top = 288
  end
end
