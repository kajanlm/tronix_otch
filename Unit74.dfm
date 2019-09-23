object Form74: TForm74
  Left = 400
  Top = 185
  Width = 958
  Height = 628
  Anchors = []
  AutoSize = True
  Caption = 'Form74'
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
    594)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 71
    Width = 950
    Height = 523
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
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
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
        Width = 91
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
        Width = 554
      end
      item
        EditButtons = <>
        FieldName = 'datotk'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        MaxWidth = 166
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 109
      end
      item
        EditButtons = <>
        FieldName = 'datz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        MaxWidth = 166
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1050#1040#1047#1063#1048#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 92
      end
      item
        EditButtons = <>
        FieldName = 'datr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        MaxWidth = 166
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1056#1045#1043#1048#1057#1058#1056
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'abrudp'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'idudp'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 30
      end>
  end
  object Edit1: TEdit
    Left = 475
    Top = 104
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 458
    Top = 216
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 866
    Top = 18
    Width = 75
    Height = 25
    Caption = #1054#1058#1063#1025#1058
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
    Left = 194
    Top = 168
    Width = 121
    Height = 21
    TabOrder = 4
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 624
    Top = 18
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
  object GroupBox1: TGroupBox
    Left = 1
    Top = 0
    Width = 184
    Height = 62
    Caption = #1044#1072#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 6
    object CheckBox1: TCheckBox
      Left = 62
      Top = 8
      Width = 97
      Height = 17
      Caption = #1054#1058#1050
      TabOrder = 0
    end
    object CheckBox2: TCheckBox
      Left = 62
      Top = 26
      Width = 97
      Height = 17
      Caption = #1047#1072#1082#1072#1079#1095#1080#1082
      TabOrder = 1
    end
    object CheckBox3: TCheckBox
      Left = 62
      Top = 44
      Width = 97
      Height = 17
      Caption = #1056#1077#1075#1080#1089#1090#1088
      TabOrder = 2
    end
  end
  object RadioGroup1: TRadioGroup
    Left = 208
    Top = 0
    Width = 137
    Height = 62
    Caption = #1047#1072#1082#1088#1099#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1054#1090#1084#1077#1095#1077#1085#1085#1099#1077
      #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077)
    ParentFont = False
    TabOrder = 7
  end
  object DateTimePicker1: TDateTimePicker
    Left = 458
    Top = 18
    Width = 124
    Height = 28
    Date = 43405.428657766210000000
    Time = 43405.428657766210000000
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1datotk: TStringField
      FieldName = 'datotk'
    end
    object OraQuery1datz: TStringField
      FieldName = 'datz'
    end
    object OraQuery1datr: TStringField
      FieldName = 'datr'
    end
    object OraQuery1abrudp: TStringField
      FieldName = 'abrudp'
    end
    object OraQuery1idudp: TFloatField
      FieldName = 'idudp'
    end
    object OraQuery1CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
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
  object OraQuery2: TOraQuery
    Left = 928
    Top = 608
    object OraQuery2udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery2datotk: TStringField
      FieldName = 'datotk'
      Size = 0
    end
    object OraQuery2datz: TStringField
      FieldName = 'datz'
      Size = 0
    end
    object OraQuery2datr: TStringField
      FieldName = 'datr'
      Size = 0
    end
    object OraQuery2abrudp: TStringField
      FieldName = 'abrudp'
    end
    object OraQuery2idudp: TFloatField
      FieldName = 'idudp'
    end
  end
  object OraQuery3: TOraQuery
    Left = 232
    Top = 288
  end
end
