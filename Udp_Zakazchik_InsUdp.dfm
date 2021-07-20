object FUdp_Zakazchik_InsUdp: TFUdp_Zakazchik_InsUdp
  Left = 288
  Top = 193
  Width = 866
  Height = 604
  Anchors = []
  AutoSize = True
  Caption = 'FUdp_Zakazchik_InsUdp'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  DesignSize = (
    858
    570)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 8
    Width = 65
    Height = 41
  end
  object Edit1: TEdit
    Left = 611
    Top = 286
    Width = 247
    Height = 21
    TabOrder = 4
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 586
    Top = 206
    Width = 249
    Height = 21
    TabOrder = 5
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 322
    Top = 158
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Edit3'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 88
    Width = 857
    Height = 482
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
    TabOrder = 7
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
        FieldName = 'udp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1059#1044#1055' '#1054#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 78
      end
      item
        EditButtons = <>
        FieldName = 'nameudp'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1059#1044#1055' '#1054#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 686
      end
      item
        Alignment = taCenter
        Checkboxes = True
        EditButtons = <>
        FieldName = 'CHK_FLD1'
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
        Visible = False
        Width = 0
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'coid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1059#1044#1055' '#1054#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = False
        Width = 0
      end>
  end
  object BitBtnSave: TBitBtn
    Left = 2
    Top = 11
    Width = 25
    Height = 35
    Hint = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
    OnClick = BitBtnSaveClick
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      0400000000007800000000000000000000001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FF0000000000
      000FF0EE000000880E0FF0EE000000880E0FF0EE000000880E0FF0EE00000000
      0E0FF0EEEEEEEEEEEE0FF0EE00000000EE0FF0E0888888880E0FF0E088888888
      0E0FF0E0888888880E0FF0E0888888880E0FF0E088888888000FF0E088888888
      0F0FF00000000000000FFFFFFFFFFFFFFFFF}
  end
  object BitBtnClose: TBitBtn
    Left = 35
    Top = 11
    Width = 29
    Height = 35
    Hint = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    OnClick = BitBtnCloseClick
    Glyph.Data = {
      F2060000424DF206000000000000360400002800000019000000190000000100
      080000000000BC02000000000000000000000001000000000000000000000000
      C00000C0000000C0C000C0000000C000C000C0C00000C0C0C000C0DCC000F0C8
      A400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFF07FFFFFF
      0707FFFFFF07FFFF070000000000FFFF0707FF0000000707FF0707FFFFFF0707
      FFFF07FFFF00FEFE060000FFFFFF07000000FFFF07FFFF0707FFFFFF07FFFF07
      0700FEFE0606000707FFFF00000007FFFF07FFFFFF0707FFFF07FFFFFF00FEFE
      06060000FF0707005000FFFFFFFFFFFFFFFFFFFF00FF07FFFF00FEFE06060600
      F807FF000000FFFFFFFFFFFFFFFFFFFF000000000000FEFE06060600F807FF00
      0000FFFFFFFFFFFFFFFFFFFF00F8F8F8F800FEFE06060600F807FF000000FFFF
      FFFFFFFFFFFFFFFF00F8F8F8F800FEFE06060600F807FF000000FFFFFFFFFFFF
      FFFFFFFF00F8F8F8F800FEFE06060600F807FF000000FFFFFFFFFFFFFFFFFFFF
      00F8F8F8F800FEFE06000600F807FF000000FFFFFFFFFFFFFFFF000000000000
      F800FEFE00F80600F807FF000000FFFFFFFFFFFFFF00000000000000F800FEFE
      00FF0600F807FF000000FFFFFFFFFFFF000000FF00F8F8F8F800FEFE06000600
      F807FF000000FFFFFFFFFF000000FFFF00F8F8F8F800FEFE06060600F807FF00
      0000FFFFFFFFFF0000FFFFFF00F8F8F8F800FEFE06060600F807FF000000FFFF
      FFFFFF0000FF00FF00F8F8F8F800FEFE06060600F807FF000000FFFFFFFFFF00
      00FF00FF00F8F8F8F800FEFE06060600F807FF000000FFFFFFFFFF00000000FF
      00F8F8F8F800FEFE06060600F807FF000000FFFFFFFFFFFF000000FF00F8F8F8
      F800FEFE06060600F807FF000000FFFFFFFF0000000000FF00F8F8F8F8F800FE
      FE060600F807FF000400FFFFFFFFFFFFFFFFFFFF00F8F8F8F8F8F800FEFE0600
      F807FF000000FFFFFFFFFFFFFFFFFFFF00F8F8F8F8F8F8F800FE0600F807FF00
      0000FFFFFFFFFFFFFFFFFFFF00F8F8F8F8F8F8F8F800FE00F807FF000000FFFF
      FFFFFFFFFFFFFFFF00F8F8F8F8F8F8F8F8F80000F8FFFF000000FFFFFFFFFFFF
      FFFFFFFF000000000000000000000000FFFFFF000000}
  end
  object TxtUdp: TEdit
    Left = 88
    Top = 16
    Width = 97
    Height = 32
    BiDiMode = bdRightToLeftNoAlign
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentBiDiMode = False
    ParentFont = False
    TabOrder = 0
  end
  object TxtUdpName: TEdit
    Left = 0
    Top = 64
    Width = 857
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object CheckBox1: TCheckBox
    Left = 568
    Top = 24
    Width = 265
    Height = 17
    Caption = #1089#1086#1093#1088#1072#1085#1080#1090#1100' '#1080' '#1085#1072' '#1076#1088#1091#1075#1080#1077' '#1087#1088#1086#1077#1082#1090#1099
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
    TabOrder = 8
    OnClick = CheckBox1Click
  end
  object Edit4: TEdit
    Left = 546
    Top = 166
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 9
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 424
    Top = 0
    Width = 97
    Height = 62
    Caption = #1042#1080#1076' '#1059#1044#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1059#1055
      #1059#1061
      #1059#1064)
    ParentFont = False
    TabOrder = 10
  end
  object RadioGroup2: TRadioGroup
    Left = 240
    Top = 0
    Width = 145
    Height = 62
    Caption = #1058#1080#1087' '#1059#1044#1055
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1086#1089#1085#1086#1074#1085#1086#1081
      #1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1081)
    ParentFont = False
    TabOrder = 11
  end
  object Edit5: TEdit
    Left = 586
    Top = 222
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 12
    Visible = False
  end
  object SaveDialog1: TSaveDialog
    Left = 664
    Top = 360
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 856
    Top = 208
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 856
    Top = 256
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 784
    Top = 168
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
    end
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1nameudp: TStringField
      FieldName = 'nameudp'
    end
    object OraQuery1CHK_FLD1: TStringField
      FieldName = 'CHK_FLD1'
      Size = 1
    end
    object OraQuery1coid: TFloatField
      FieldName = 'coid'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1008
    Top = 104
  end
  object OraQuery2: TOraQuery
    Left = 912
    Top = 608
    object OraQuery2udp_zakazchik_id: TFloatField
      FieldName = 'udp_zakazchik_id'
    end
    object OraQuery2udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery2name: TStringField
      FieldName = 'name'
      Size = 0
    end
    object OraQuery2date_end: TStringField
      FieldName = 'date_end'
      Size = 0
    end
    object OraQuery2project_project_id: TFloatField
      FieldName = 'project_project_id'
    end
  end
  object OraQuery3: TOraQuery
    Left = 224
    Top = 264
  end
  object OraQuery4: TOraQuery
    Left = 224
    Top = 264
  end
end
