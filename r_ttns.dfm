object defttns: Tdefttns
  Left = 170
  Top = 291
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1076#1077#1092#1080#1094#1080#1090#1091
  ClientHeight = 473
  ClientWidth = 1356
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = -1
    Top = 56
    Width = 1354
    Height = 417
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    RowHeight = 33
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    UseMultiTitle = True
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1047#1040#1055#1056#1054#1064#1045#1053#1054
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 122
        WordWrap = True
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'VYD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1042#1067#1044#1040#1053#1054
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -12
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 87
        WordWrap = True
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'NOMER'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1044#1086#1082#1091#1084#1077#1085#1090
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 73
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'TYPE'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1058#1080#1087' '#1076#1086#1082#1091#1084#1077#1085#1090#1072
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 80
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'SKLAD'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1057#1050#1051#1040#1044
        Width = 46
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CEH'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1062#1045#1061
        Width = 47
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL_UCHET'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1047#1072#1082#1091#1087'. '#1077#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 65
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'KOL'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1058#1077#1093#1085#1086#1083#1086#1075'. '#1077#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 69
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATEC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1057#1086#1079#1076#1072#1085
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 68
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1042' '#1089#1085#1072#1073#1078#1077#1085#1080#1077
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 89
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1053#1072' '#1089#1082#1083#1072#1076
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 70
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'DATE4'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1074' '#1059#1057#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 65
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'PUE'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1055#1059#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 127
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'CHERT'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 150
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'UPE'
        Footers = <>
        Layout = tlCenter
        ReadOnly = True
        Title.Caption = #1059#1044#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 73
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CHK_FLD'
        Footers = <>
        KeyList.Strings = (
          '1'
          '0')
        Layout = tlCenter
        Title.Caption = #1054#1053
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = []
        Width = 66
      end>
  end
  object filters: TButton
    Left = 456
    Top = 16
    Width = 161
    Height = 33
    Caption = #1060#1048#1051#1068#1058#1056#1067
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = filtersClick
  end
  object fSwap: TButton
    Left = 72
    Top = 24
    Width = 169
    Height = 25
    Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = fSwapClick
  end
  object chkall: TCheckBox
    Left = 1192
    Top = 24
    Width = 121
    Height = 17
    Caption = '"'#1054#1053'" '#1055#1054' '#1042#1057#1045#1052
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = chkallClick
  end
  object eAbs: TButton
    Left = 632
    Top = 16
    Width = 161
    Height = 33
    Caption = #1054#1058#1063#1045#1058
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = eAbsClick
  end
  object clear: TBitBtn
    Left = 800
    Top = 16
    Width = 161
    Height = 33
    Caption = #1054#1063#1048#1057#1058#1048#1058#1068
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clGray
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = clearClick
  end
  object OraDataSource1: TOraDataSource
    DataSet = dataBuffer
    Left = 760
    Top = 480
  end
  object OraQueryS: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 800
    Top = 480
  end
  object dataBuffer: TClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'FNAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SNAME'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VYD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'NOMER'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TYPE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SKLAD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CEH'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOL'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOL_UCHET'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATEC'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATE1'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATE2'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATE4'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DATE3'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'PUE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CHERT'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UPE'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CHK_FLD'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'KOD_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'VYD_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TTN_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TYPE_TTN_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'CEH_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'SKLAD_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'TEXKOMPL_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'DOCUMENT_ID'
        DataType = ftString
        Size = 255
      end
      item
        Name = 'UZAK_ID'
        DataType = ftString
        Size = 255
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterEdit = dataBufferAfterEdit
    Left = 840
    Top = 480
  end
  object OraInsertQuery: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 880
    Top = 480
  end
end
