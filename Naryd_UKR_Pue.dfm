object FNaryd_UKR_Pue: TFNaryd_UKR_Pue
  Left = 247
  Top = 199
  Width = 958
  Height = 713
  Anchors = []
  AutoSize = True
  Caption = 'FNaryd_UKR_Pue'
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
    950
    679)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 950
    Height = 649
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
    ReadOnly = True
    SumList.Active = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        EditButtons = <>
        FieldName = 'podr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
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
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1042'.'#8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'zak'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1050#1040#1047
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'tkunomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1059#1050#1056
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'typnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1050'/'#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'tkname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1058#1050'/'#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 121
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'txnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1058#1050'/'#1062#1045#1061#1054#1050#1054#1054#1055'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'txname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1055#1058#1050'/'#1062#1045#1061#1054#1050#1054#1054#1055'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'tnnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #8470' '#1053#1040#1056#1071#1044#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'datedok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1057#1054#1047#1044'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'dateins'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1044#1040#1058#1040' '#1047#1040#1050#1056'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'trudoem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kvname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1054#1060#1045#1057#1057#1048#1071
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 71
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'razrjd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1056#1040#1047#1056#1071#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'tars'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1040#1056'.'#1057#1045#1058#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'rasc'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1056#1040#1057#1062#1045#1053#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ts_number'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1040#1041'.'#8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'naname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1060#1048#1054'/'#1055#1054#1044#1056#1071#1044#1063#1048#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 130
      end
      item
        EditButtons = <>
        FieldName = 'pname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Caption = #1055#1054#1051#1053#1054#1045' '#1053#1040#1048#1052'.'#1055#1054#1044#1056#1071#1044#1063#1048#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 300
      end>
  end
  object Edit1: TEdit
    Left = 513
    Top = 174
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 496
    Top = 46
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 40
    Top = 654
    Width = 75
    Height = 25
    Caption = 'Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 512
    Top = 78
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 104
    object OraQuery1podr: TStringField
      FieldName = 'podr'
    end
    object OraQuery1zavn: TStringField
      FieldName = 'zavn'
    end
    object OraQuery1zak: TStringField
      FieldName = 'zak'
    end
    object OraQuery1tkunomer: TStringField
      FieldName = 'tkunomer'
    end
    object OraQuery1typnomer: TStringField
      FieldName = 'typnomer'
    end
    object OraQuery1tkname: TStringField
      FieldName = 'tkname'
    end
    object OraQuery1txnomer: TStringField
      FieldName = 'txnomer'
    end
    object OraQuery1txname: TStringField
      FieldName = 'txname'
    end
    object OraQuery1tnnomer: TStringField
      FieldName = 'tnnomer'
    end
    object OraQuery1datedok: TStringField
      FieldName = 'datedok'
    end
    object OraQuery1dateins: TStringField
      FieldName = 'dateins'
    end
    object OraQuery1trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object OraQuery1kvname: TStringField
      FieldName = 'kvname'
    end
    object OraQuery1razrjd: TStringField
      FieldName = 'razrjd'
    end
    object OraQuery1tars: TStringField
      FieldName = 'tars'
    end
    object OraQuery1rasc: TFloatField
      FieldName = 'rasc'
    end
    object OraQuery1ts_number: TStringField
      FieldName = 'ts_number'
    end
    object OraQuery1naname: TStringField
      FieldName = 'naname'
    end
    object OraQuery1pname: TStringField
      FieldName = 'pname'
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
