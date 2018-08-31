object DIF_OTCH_FORM: TDIF_OTCH_FORM
  Left = 224
  Top = 22
  Width = 1350
  Height = 879
  Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1076#1080#1092#1092#1080#1094#1080#1090#1091
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  DesignSize = (
    1334
    841)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 46
    Top = 18
    Width = 170
    Height = 20
    Caption = #1058#1080#1087' '#1087#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 454
    Top = 18
    Width = 138
    Height = 20
    Anchors = [akTop]
    Caption = #1055#1086#1076#1088#1072#1079#1076#1077#1083#1077#1085#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Button1: TButton
    Left = 1149
    Top = 4
    Width = 171
    Height = 37
    Anchors = [akTop, akRight]
    Caption = #1042#1099#1074#1077#1089#1090#1080' '#1074' EXCEL'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnClick = Button1Click
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 48
    Width = 1318
    Height = 781
    Anchors = [akLeft, akTop, akRight, akBottom]
    DataSource = DataSource
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    RowHeight = 35
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'KOD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1050#1054#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 119
      end
      item
        EditButtons = <>
        FieldName = 'MTR_NAME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 355
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1054#1058#1056#1045#1041#1053#1054#1057#1058#1068'|'#1047#1072#1082#1091#1087#1086#1095#1085'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 84
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1054#1058#1056#1045#1041#1053#1054#1057#1058#1068'|#1'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 21
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'POTR_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1054#1058#1056#1045#1041#1053#1054#1057#1058#1068'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ED_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1054#1058#1056#1045#1041#1053#1054#1057#1058#1068'|#2'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 22
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAPAS_POST'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1054#1041#1045#1057#1055#1045#1063#1045#1053#1048#1045'|'#1047#1072#1082#1091#1087#1086#1095#1085'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAPAS_POST_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1054#1041#1045#1057#1055#1045#1063#1045#1053#1048#1045'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 79
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAPAS_POST_SUB'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1045#1056#1045#1044#1040#1058#1068'|'#1047#1072#1082#1091#1087#1086#1095#1085'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 82
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'ZAPAS_POST_SUB_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1055#1045#1056#1045#1044#1040#1058#1068'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 79
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DEFICIT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1044#1045#1060#1048#1062#1048#1058'|'#1047#1072#1082#1091#1087#1086#1095#1085'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DEFICIT_UCHET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1044#1045#1060#1048#1062#1048#1058'|'#1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076#1080#1085#1080#1094#1099
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 81
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE_DEFICIT0'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        Title.Caption = #1053#1040#1063#1040#1051#1054' '#1044#1045#1060#1048#1062#1048#1058#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 101
      end>
  end
  object LOCK_BOX: TPanel
    Left = 8
    Top = 48
    Width = 1321
    Height = 784
    Anchors = [akLeft, akTop, akRight, akBottom]
    Caption = #1047#1072#1076#1072#1081#1090#1077' '#1087#1072#1088#1072#1084#1077#1090#1088#1099' '#1086#1090#1073#1086#1088#1072' '#1080' '#1085#1072#1078#1084#1080#1090#1077' '#1079#1076#1077#1089#1100
    Color = cl3DLight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -33
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = CalcDeficit
  end
  object cb_typepodr: TComboBox
    Left = 234
    Top = 16
    Width = 167
    Height = 22
    Style = csOwnerDrawFixed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 3
    OnChange = cb_typepodrChange
  end
  object cb_podr: TComboBox
    Left = 610
    Top = 16
    Width = 69
    Height = 22
    Style = csOwnerDrawFixed
    Anchors = [akTop]
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
    OnChange = cb_podrChange
  end
  object Edit1: TEdit
    Left = 695
    Top = 16
    Width = 245
    Height = 21
    Anchors = [akTop]
    ReadOnly = True
    TabOrder = 5
  end
  object cb_typeelms: TComboBox
    Left = 983
    Top = 16
    Width = 138
    Height = 22
    Style = csOwnerDrawFixed
    Anchors = [akTop, akRight]
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ItemHeight = 16
    ItemIndex = 3
    ParentFont = False
    TabOrder = 6
    Text = #1042#1089#1077
    OnChange = cb_typeelmsChange
    Items.Strings = (
      #1052#1072#1090#1077#1088#1080#1072#1083#1099
      #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      #1052#1057#1063
      #1042#1089#1077)
  end
  object Panel1: TPanel
    Left = -32
    Top = 42
    Width = 1600
    Height = 4
    Anchors = [akLeft, akTop, akRight]
    Color = clActiveCaption
    TabOrder = 7
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 120
    Width = 809
    Height = 313
    DataSource = OraDataSource1
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
  end
  object Edit2: TEdit
    Left = 176
    Top = 480
    Width = 633
    Height = 21
    TabOrder = 9
    Visible = False
  end
  object Button2: TButton
    Left = 136
    Top = 480
    Width = 33
    Height = 25
    Caption = 'X'
    TabOrder = 10
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 824
    Top = 480
    Width = 75
    Height = 25
    Caption = 'SQL'
    TabOrder = 11
    Visible = False
    OnClick = Button3Click
  end
  object cb_invi_typepodr: TComboBox
    Left = 48
    Top = 0
    Width = 25
    Height = 21
    ItemHeight = 13
    TabOrder = 12
    Text = 'cb_invi_typepodr'
    Visible = False
  end
  object cb_invi_podr: TComboBox
    Left = 88
    Top = 0
    Width = 25
    Height = 21
    ItemHeight = 13
    TabOrder = 13
    Text = 'cb_invi_typepodr'
    Visible = False
  end
  object cb_invi_podr_name: TComboBox
    Left = 128
    Top = 0
    Width = 25
    Height = 21
    ItemHeight = 13
    TabOrder = 14
    Text = 'cb_invi_typepodr'
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Left = 568
    Top = 936
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 600
    Top = 936
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 632
    Top = 936
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 664
    Top = 936
  end
  object DataSource: TOraDataSource
    DataSet = OraQuery
    Left = 864
    Top = 936
  end
  object OraQuery: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 896
    Top = 936
    object OraQueryKOD: TStringField
      FieldName = 'KOD'
      ReadOnly = True
      Size = 255
    end
    object OraQueryMTR_NAME: TStringField
      FieldName = 'MTR_NAME'
      ReadOnly = True
      Size = 255
    end
    object OraQueryPOTR: TFloatField
      FieldName = 'POTR'
      ReadOnly = True
    end
    object OraQueryED: TStringField
      FieldName = 'ED'
      ReadOnly = True
    end
    object OraQueryPOTR_UCHET: TFloatField
      FieldName = 'POTR_UCHET'
      ReadOnly = True
    end
    object OraQueryED_UCHET: TStringField
      FieldName = 'ED_UCHET'
      ReadOnly = True
    end
    object OraQueryZAPAS_POST: TFloatField
      FieldName = 'ZAPAS_POST'
      ReadOnly = True
    end
    object OraQueryZAPAS_POST_UCHET: TFloatField
      FieldName = 'ZAPAS_POST_UCHET'
      ReadOnly = True
    end
    object OraQueryZAPAS_POST_SUB: TFloatField
      FieldName = 'ZAPAS_POST_SUB'
      ReadOnly = True
    end
    object OraQueryZAPAS_POST_SUB_UCHET: TFloatField
      FieldName = 'ZAPAS_POST_SUB_UCHET'
      ReadOnly = True
    end
    object OraQueryDEFICIT: TFloatField
      FieldName = 'DEFICIT'
      ReadOnly = True
    end
    object OraQueryDEFICIT_UCHET: TFloatField
      FieldName = 'DEFICIT_UCHET'
      ReadOnly = True
    end
    object OraQueryDATE_DEFICIT0: TStringField
      FieldName = 'DATE_DEFICIT0'
      ReadOnly = True
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQueryS
    Left = 864
    Top = 200
  end
  object OraQueryS: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 904
    Top = 200
  end
end
