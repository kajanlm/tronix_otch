object FUkr_Pom_TNV_IZV: TFUkr_Pom_TNV_IZV
  Left = 41
  Top = 252
  Width = 1612
  Height = 691
  Anchors = []
  AutoSize = True
  Caption = 'Ukr_Pom_TNV_IZV'
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
    1604
    657)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 2000
    Height = 633
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
        EditButtons = <>
        FieldName = 'tkup'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1059#1050#1056'.'#1055#1054#1052'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 62
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
        Title.Caption = #1057#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 138
      end
      item
        EditButtons = <>
        FieldName = 'namesp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1057#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 250
      end
      item
        EditButtons = <>
        FieldName = 'txnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1053'/'#1062'.'#1050#1054#1054#1055'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 182
      end
      item
        EditButtons = <>
        FieldName = 'txdate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1047#1040#1050#1056'.'#1058#1053'/'#1062'.'#1050#1054#1054#1055'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 106
      end
      item
        EditButtons = <>
        FieldName = 'dxnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061' '#1058#1050'/'#1055#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 86
      end
      item
        EditButtons = <>
        FieldName = 'tknomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 177
      end
      item
        EditButtons = <>
        FieldName = 'tkdate'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1047#1040#1050#1056'.'#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 127
      end
      item
        EditButtons = <>
        FieldName = 'denomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061' '#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 76
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
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1058#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 146
      end
      item
        EditButtons = <>
        FieldName = 'udp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1059#1044#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 35
      end
      item
        EditButtons = <>
        FieldName = 'tunomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1059#1050#1056'.'#1055#1059#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 55
      end
      item
        EditButtons = <>
        FieldName = 'tuname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1059#1050#1056'.'#1055#1059#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 136
      end>
  end
  object Edit1: TEdit
    Left = 208
    Top = 166
    Width = 31
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 484
    Top = 238
    Width = 9
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 415
    Top = 142
    Width = 30
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object Button1: TButton
    Left = 74
    Top = 632
    Width = 97
    Height = 25
    Caption = 'Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1tkup: TStringField
      FieldName = 'tkup'
    end
    object OraQuery1ident: TStringField
      FieldName = 'ident'
    end
    object OraQuery1namesp: TStringField
      FieldName = 'namesp'
    end
    object OraQuery1txnomer: TStringField
      FieldName = 'txnomer'
    end
    object OraQuery1txdate: TStringField
      FieldName = 'txdate'
    end
    object OraQuery1dxnomer: TStringField
      FieldName = 'dxnomer'
    end
    object OraQuery1tknomer: TStringField
      FieldName = 'tknomer'
    end
    object OraQuery1tkdate: TStringField
      FieldName = 'tkdate'
    end
    object OraQuery1denomer: TStringField
      FieldName = 'denomer'
    end
    object OraQuery1tkname: TStringField
      FieldName = 'tkname'
    end
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1tunomer: TStringField
      FieldName = 'tunomer'
    end
    object OraQuery1tuname: TStringField
      FieldName = 'tuname'
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
