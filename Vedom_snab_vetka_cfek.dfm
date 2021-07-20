object FVedom_snab_vetka_cfek: TFVedom_snab_vetka_cfek
  Left = 189
  Top = 136
  Width = 1300
  Height = 700
  Anchors = []
  Caption = 'FVedom_snab_vetka_cfek'
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
    1292
    666)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 529
    Top = 317
    Width = 247
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 520
    Top = 237
    Width = 249
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 760
    Top = 361
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
    Visible = False
  end
  object DBGridEh2: TDBGridEh
    Left = -8
    Top = 32
    Width = 1289
    Height = 633
    Anchors = []
    DataSource = OraDataSource2
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
    TabOrder = 4
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
        Title.Caption = #1054#1058#1052#1045#1058#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'ident'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1054#1050#1059#1052#1045#1053#1058
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 221
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
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1044#1054#1050#1059#1052#1045#1053#1058#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 868
      end
      item
        EditButtons = <>
        FieldName = 'iddoc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = ' '#1048#1044#1045#1053#1058#1048#1060
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 106
      end>
  end
  object Button2: TButton
    Left = 835
    Top = -1
    Width = 97
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 144
    object OraQuery2CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
    end
    object OraQuery2ident: TStringField
      FieldName = 'ident'
    end
    object OraQuery2name: TStringField
      FieldName = 'name'
    end
    object OraQuery2iddoc: TFloatField
      FieldName = 'iddoc'
    end
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 1008
    Top = 104
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 144
    object OraQuery1zavn: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1proe: TStringField
      FieldName = 'proe'
    end
    object OraQuery1sp: TStringField
      FieldName = 'sp'
    end
    object OraQuery1pozic: TStringField
      FieldName = 'pozic'
    end
    object OraQuery1podpoz: TStringField
      FieldName = 'podpoz'
    end
    object OraQuery1namesp: TStringField
      FieldName = 'namesp'
    end
    object OraQuery1vz: TStringField
      FieldName = 'vz'
    end
    object OraQuery1kod: TStringField
      FieldName = 'kod'
    end
    object OraQuery1namekod: TStringField
      FieldName = 'namekod'
    end
    object OraQuery1kol: TFloatField
      FieldName = 'kol'
    end
    object OraQuery1kodedi: TStringField
      FieldName = 'kodedi'
    end
    object OraQuery1edi: TStringField
      FieldName = 'edi'
    end
    object OraQuery1vetka1: TStringField
      FieldName = 'vetka1'
    end
    object OraQuery1vetka2: TStringField
      FieldName = 'vetka2'
    end
    object OraQuery1vetka3: TStringField
      FieldName = 'vetka3'
    end
    object OraQuery1vetka4: TStringField
      FieldName = 'vetka4'
    end
    object OraQuery1vetka5: TStringField
      FieldName = 'vetka5'
    end
    object OraQuery1vetka6: TStringField
      FieldName = 'vetka6'
    end
    object OraQuery1vetka7: TStringField
      FieldName = 'vetka7'
    end
    object OraQuery1spsort: TStringField
      FieldName = 'spsort'
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
