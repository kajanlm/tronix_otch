object FKol_Pokup_Izd_TN_SP: TFKol_Pokup_Izd_TN_SP
  Left = 361
  Top = 218
  Width = 958
  Height = 624
  Anchors = []
  AutoSize = True
  Caption = 'FKol_Pokup_Izd_TN_SP'
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
    590)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 950
    Height = 555
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
        FieldName = 'kod'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044' '#1055#1054#1050#1059#1055'.'#1048#1047#1044'-'#1048#1071
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'sname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1055#1054#1050#1059#1055'.'#1048#1047#1044'-'#1048#1071
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'nomertx'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
      end
      item
        EditButtons = <>
        FieldName = 'kodm'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044' '#1052#1057#1063
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 90
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
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1063#1045#1056#1058#1025#1046
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 246
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1051'-'#1042#1054' '#1042' '#1058#1053
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
        FieldName = 'namek'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1045#1044'.'#1048#1047#1052'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'ssname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        HighlightRequired = True
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1052#1057#1063
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
      end
      item
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
        Title.Caption = #1053#1040#1048#1057#1045#1053#1054#1042#1040#1053#1048#1045' '#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 66
      end
      item
        EditButtons = <>
        FieldName = 'spkol'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1054#1047#1048#1062#1048#1048' '#1048' '#1050#1054#1051#1048#1063#1045#1057#1058#1042#1054' '#1042' '#1057#1055#1045#1062#1048#1060#1048#1050#1040#1062#1048#1048
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 1000
      end>
  end
  object Edit1: TEdit
    Left = 513
    Top = 85
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 472
    Top = 229
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 40
    Top = 565
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
    Left = 368
    Top = 157
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
    object OraQuery1sname: TStringField
      FieldName = 'sname'
    end
    object OraQuery1nomertx: TStringField
      FieldName = 'nomertx'
    end
    object OraQuery1kodm: TStringField
      FieldName = 'kodm'
    end
    object OraQuery1ch: TStringField
      FieldName = 'ch'
    end
    object OraQuery1kol: TFloatField
      FieldName = 'kol'
    end
    object OraQuery1namek: TStringField
      FieldName = 'namek'
    end
    object OraQuery1ssname: TStringField
      FieldName = 'ssname'
    end
    object OraQuery1txname: TStringField
      FieldName = 'txname'
    end
    object OraQuery1spkol: TStringField
      FieldName = 'spkol'
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
