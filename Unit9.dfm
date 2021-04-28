object Form9: TForm9
  Left = 414
  Top = 183
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'KOD'
  ClientHeight = 360
  ClientWidth = 491
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
    Left = 152
    Top = 0
    Width = 178
    Height = 20
    Caption = #1057#1090#1088#1086#1080#1090#1077#1083#1100#1085#1099#1081' '#1079#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Label2'
    Visible = False
  end
  object Label3: TLabel
    Left = 192
    Top = 227
    Width = 52
    Height = 13
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100':'
    Visible = False
  end
  object deps_label: TLabel
    Left = 192
    Top = 256
    Width = 25
    Height = 13
    Caption = #1062#1045#1061':'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 41
    Width = 473
    Height = 184
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnCellClick = DBGridEh1CellClick
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ZAVN'
        Footers = <>
        Title.Caption = 'N'
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1079#1074#1072#1085#1080#1077
      end>
  end
  object DBGridEh2: TDBGridEh
    Left = 8
    Top = 231
    Width = 473
    Height = 97
    DataSource = OraDataSource2
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGridEh2DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'ZAK'
        Footers = <>
        Title.Caption = #1047#1072#1082#1072#1079
      end
      item
        EditButtons = <>
        FieldName = 'TEXT'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      end>
  end
  object Edit1: TEdit
    Left = 448
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Edit1'
    Visible = False
  end
  object ComboBox1: TComboBox
    Left = 248
    Top = 224
    Width = 193
    Height = 21
    ItemHeight = 13
    TabOrder = 3
    Text = #1057#1087#1080#1089#1082#1086#1084
    Visible = False
  end
  object Button1: TButton
    Left = 8
    Top = 328
    Width = 473
    Height = 25
    Caption = #1055#1054' '#1042#1057#1045#1052
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 436
    Top = 64
    Width = 121
    Height = 21
    TabOrder = 5
    Text = 'Edit1'
    Visible = False
  end
  object uzaks_memory: TComboBox
    Left = 184
    Top = 192
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 6
    Visible = False
  end
  object uzaks: TCheckListBox
    Left = 8
    Top = 232
    Width = 473
    Height = 97
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 20
    ParentFont = False
    TabOrder = 7
    Visible = False
  end
  object Button2: TButton
    Left = 8
    Top = 328
    Width = 473
    Height = 25
    Caption = #1054#1058#1063#1045#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -17
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    Visible = False
    OnClick = Button2Click
  end
  object allzakz: TCheckBox
    Left = 250
    Top = 21
    Width = 119
    Height = 17
    Caption = #1042#1057#1045' '#1047#1040#1050#1040#1047#1067
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object Deps: TComboBox
    Left = 248
    Top = 256
    Width = 145
    Height = 22
    Style = csOwnerDrawVariable
    ItemHeight = 16
    TabOrder = 10
    Visible = False
  end
  object allprs: TCheckBox
    Left = 130
    Top = 21
    Width = 119
    Height = 17
    Caption = #1042#1057#1045' '#1055#1056#1054#1045#1050#1058#1067
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = allprsClick
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      'Select Zavn, name, project_id,proekt from Tronix.Project_list '
      'where date_end is null'
      'order by zavn')
    ReadOnly = True
    Left = 352
    Top = 360
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 328
    Top = 360
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      
        'Select zak.zak, feb.text,zak.id_project,zak.nn from tronix.feb_n' +
        'ame feb,'
      'tronix.zakaz zak where zak.name=feb.nn')
    MasterSource = OraDataSource1
    MasterFields = 'PROJECT_ID'
    DetailFields = 'ID_PROJECT'
    ReadOnly = True
    Left = 288
    Top = 360
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROJECT_ID'
        ParamType = ptInput
        Value = 181
      end>
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 256
    Top = 360
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 216
    Top = 288
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 288
    Top = 296
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 208
    Top = 32
  end
end
