object FNomenklator: TFNomenklator
  Left = 264
  Top = 236
  Width = 958
  Height = 748
  Anchors = []
  AutoSize = True
  Caption = 'FNomenklator'
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
    714)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 65
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        EditButtons = <>
        FieldName = 'kod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044
        Width = 50
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ogran'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1054#1043#1056#1040#1053'.'
        Width = 50
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'shome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1048#1054#1056#1048#1058#1045#1058
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'msch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1052#1057#1063
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'rossip'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1056#1054#1057#1057#1067#1055#1068
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'edo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1054#1057#1053'.'
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'edn'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'#1053#1045#1054#1057#1053'.'
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'massaed'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1052#1040#1057#1057#1040' '#1045#1044'.('#1050#1043')'
        Width = 70
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
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Width = 126
      end
      item
        EditButtons = <>
        FieldName = 'ch'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1063#1045#1056#1058#1025#1046
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'chold'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1063#1045#1056#1058#1025#1046' '#1057#1058#1040#1056#1067#1049
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'chdop'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1063#1045#1056#1058#1025#1046' '#1044#1054#1055'.'
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'nttp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1058#1058#1055
        Width = 70
      end
      item
        EditButtons = <>
        FieldName = 'tree'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1042#1045#1058#1050#1040
        Width = 82
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
    Left = 456
    Top = 310
    Width = 249
    Height = 21
    TabOrder = 6
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 720
    Top = 14
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
  object Button2: TButton
    Left = 587
    Top = 16
    Width = 97
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button2Click
  end
  object RadioGroup1: TRadioGroup
    Left = 350
    Top = 0
    Width = 173
    Height = 62
    Caption = #1059#1087#1086#1088#1103#1076#1086#1095#1080#1090#1100' '#1087#1086' . . . '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1042#1077#1090#1082#1072','#1050#1086#1076
      #1050#1086#1076)
    ParentFont = False
    TabOrder = 2
  end
  object RadioGroup2: TRadioGroup
    Left = 0
    Top = 0
    Width = 297
    Height = 62
    Caption = #1042#1099#1073#1088#1072#1090#1100
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1052#1072#1090#1077#1088#1080#1072#1083#1099
      #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      #1052#1057#1063
      #1054#1089#1085#1072#1089#1090#1082#1072)
    ParentFont = False
    TabOrder = 7
    OnClick = RadioGroup2Click
  end
  object Edit3: TEdit
    Left = 304
    Top = 182
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
    object OraQuery1kod: TStringField
      FieldName = 'kod'
    end
    object OraQuery1ogran: TStringField
      FieldName = 'ogran'
    end
    object OraQuery1shome: TStringField
      FieldName = 'shome'
    end
    object OraQuery1msch: TStringField
      FieldName = 'msch'
    end
    object OraQuery1rossip: TStringField
      FieldName = 'rossip'
    end
    object OraQuery1edo: TStringField
      FieldName = 'edo'
    end
    object OraQuery1edn: TStringField
      FieldName = 'edn'
    end
    object OraQuery1massaed: TFloatField
      FieldName = 'massaed'
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1ch: TStringField
      FieldName = 'ch'
    end
    object OraQuery1chold: TStringField
      FieldName = 'chold'
    end
    object OraQuery1chdop: TStringField
      FieldName = 'chdop'
    end
    object OraQuery1nttp: TStringField
      FieldName = 'nttp'
    end
    object OraQuery1tree: TStringField
      FieldName = 'tree'
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
