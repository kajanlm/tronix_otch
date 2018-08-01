object Form27: TForm27
  Left = 508
  Top = 290
  Width = 689
  Height = 457
  AutoSize = True
  Caption = 'Form27'
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
    673
    419)
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 536
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 0
    Width = 673
    Height = 329
    Anchors = []
    AutoFitColWidths = True
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'IDENT'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1080
        Width = 300
      end
      item
        EditButtons = <>
        FieldName = 'type'
        Footers = <>
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
      end>
  end
  object CheckBox1: TCheckBox
    Left = 280
    Top = 360
    Width = 49
    Height = 17
    Caption = #1052#1057#1063
    TabOrder = 2
  end
  object Edit2: TEdit
    Left = 352
    Top = 8
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit2'
    Visible = False
  end
  object CheckBox2: TCheckBox
    Left = 344
    Top = 360
    Width = 113
    Height = 17
    Caption = #1058#1086#1083#1100#1082#1072' '#1076#1080#1092#1080#1094#1080#1090'!'
    TabOrder = 4
  end
  object Button1: TButton
    Left = 456
    Top = 360
    Width = 105
    Height = 25
    Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1087#1080#1089#1082#1091
    TabOrder = 5
    OnClick = Button1Click
  end
  object Edit3: TEdit
    Left = 240
    Top = 8
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 6
    Visible = False
  end
  object CheckBox3: TCheckBox
    Left = 568
    Top = 360
    Width = 81
    Height = 17
    Caption = #1055#1086' '#1074#1089#1077#1084'!'
    TabOrder = 7
  end
  object CheckBox4: TCheckBox
    Left = 520
    Top = 400
    Width = 153
    Height = 17
    Caption = #1044#1088#1091#1075#1086#1081' '#1074#1072#1088#1080#1072#1085#1090' '#1088#1072#1089#1095#1105#1090#1072
    TabOrder = 8
  end
  object CheckBox6: TCheckBox
    Left = 280
    Top = 392
    Width = 113
    Height = 17
    Caption = #1055#1088#1086#1089#1091#1084#1084#1080#1088#1086#1074#1072#1090#1100' '
    TabOrder = 9
  end
  object RadioGroup1: TRadioGroup
    Left = 0
    Top = 352
    Width = 257
    Height = 67
    Caption = #1042#1072#1088#1080#1072#1085#1090' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1099
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Items.Strings = (
      #1058#1088#1091#1073#1099
      #1054#1090#1074#1086#1076#1099
      #1059#1075#1086#1083#1086#1082
      #1047#1072#1087#1086#1088#1085#1072#1103' '#1072#1088#1084#1072#1090#1091#1088#1072
      #1048#1079#1086#1083#1103#1094#1080#1103
      #1042#1089#1103' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072)
    ParentFont = False
    TabOrder = 10
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 512
    Top = 8
    object OraQuery1IDENT: TStringField
      FieldName = 'IDENT'
    end
    object OraQuery1type: TStringField
      FieldName = 'type'
    end
    object OraQuery1NAME: TStringField
      FieldName = 'NAME'
    end
    object OraQuery1document_id: TFloatField
      FieldName = 'document_id'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 576
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery3CalcFields
    Left = 608
    Top = 8
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 560
    Top = 104
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 560
    Top = 144
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 464
    Top = 8
  end
end
