object FReestr_doc_sklad: TFReestr_doc_sklad
  Left = 412
  Top = 213
  Width = 534
  Height = 275
  Anchors = []
  AutoSize = True
  Caption = 'FReestr_doc_sklad'
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
    526
    241)
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 218
    Top = 25
    Width = 18
    Height = 20
    Alignment = taRightJustify
    Caption = #1057' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 369
    Top = 25
    Width = 27
    Height = 20
    Alignment = taRightJustify
    Caption = #1055#1054
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 200
    Height = 241
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
        Title.Caption = #1054#1058#1052#1045#1058#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'dep'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1057#1050#1051#1040#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 106
      end>
  end
  object Edit1: TEdit
    Left = 259
    Top = 120
    Width = 31
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 239
    Top = 216
    Width = 9
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 234
    Top = 168
    Width = 30
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object Button2: TButton
    Left = 312
    Top = 202
    Width = 97
    Height = 25
    Caption = #1042#1099#1087#1086#1083#1085#1080#1090#1100
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object DateTimePicker1: TDateTimePicker
    Left = 237
    Top = 20
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
    TabOrder = 5
    OnChange = DateTimePicker1Change
  end
  object DateTimePicker2: TDateTimePicker
    Left = 402
    Top = 20
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
    TabOrder = 6
    OnChange = DateTimePicker2Change
  end
  object RadioGroup1: TRadioGroup
    Left = 266
    Top = 64
    Width = 215
    Height = 65
    Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072'  . . . '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1055#1088#1080#1093#1086#1076
      #1056#1072#1089#1093#1086#1076
      #1047#1072#1087#1088#1072#1074#1082#1072'  '#1073#1072#1083#1083#1086#1085#1086#1074)
    ParentFont = False
    TabOrder = 7
  end
  object CheckBox1: TCheckBox
    Left = 272
    Top = 160
    Width = 193
    Height = 17
    Caption = #1089' '#1088#1072#1079#1073#1080#1074#1082#1086#1081'  '#1087#1086' '#1094#1077#1093#1072#1084
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
    end
    object OraQuery1dep: TStringField
      FieldName = 'dep'
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
    Left = 232
    Top = 288
  end
end
