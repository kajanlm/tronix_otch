object FUdp_Zakazchik: TFUdp_Zakazchik
  Left = 407
  Top = 306
  Width = 968
  Height = 477
  Anchors = []
  AutoSize = True
  Caption = 'FUdp_Zakazchik'
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
    960
    443)
  PixelsPerInch = 96
  TextHeight = 13
  object Shape1: TShape
    Left = 0
    Top = 0
    Width = 198
    Height = 41
  end
  object DBGridEh1: TDBGridEh
    Left = 10
    Top = 66
    Width = 950
    Height = 377
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
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
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
        Title.Caption = 'V'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 18
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
        Width = 97
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
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 677
      end
      item
        EditButtons = <>
        FieldName = 'datend'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        MaxWidth = 166
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1044#1040#1058#1040' '#1047#1040#1050#1056#1067#1058#1048#1071
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 137
      end
      item
        EditButtons = <>
        FieldName = 'idudp'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'idudpudp'
        Footers = <>
        ReadOnly = True
        Visible = False
        Width = 30
      end>
  end
  object Edit1: TEdit
    Left = 632
    Top = 286
    Width = 247
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 607
    Top = 206
    Width = 249
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 343
    Top = 158
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object RadioGroup1: TRadioGroup
    Left = 573
    Top = 0
    Width = 185
    Height = 62
    Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' \ '#1059#1076#1072#1083#1080#1090#1100' '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold, fsItalic]
    Items.Strings = (
      #1042#1089#1077
      #1054#1090#1084#1077#1095#1077#1085#1085#1099#1077)
    ParentFont = False
    TabOrder = 4
  end
  object BitBtnInsert: TBitBtn
    Left = 2
    Top = 3
    Width = 25
    Height = 35
    Hint = #1042#1074#1077#1089#1090#1080' '#1085#1086#1074#1099#1081' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = BitBtnInsertClick
    Glyph.Data = {
      DE000000424DDE0000000000000076000000280000000B0000000D0000000100
      04000000000068000000CE0E0000D80E00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
      00000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF00
      00000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF0000000FFFFFFFFF00
      00000FFFFFF0000000000FFFFFF0F08000000FFFFFF008800000000000008880
      0000}
  end
  object BitBtnUpdate: TBitBtn
    Left = 53
    Top = 3
    Width = 25
    Height = 35
    Hint = #1048#1079#1084#1077#1085#1080#1090#1100' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
    OnClick = BitBtnUpdateClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F0000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      F0F0F0F0FFFFFFFFC0C0FFFFFFFFFFF00FFFFFFFC0C0FFFFFFFFFFF000FFFFFF
      C0C0FFF000000000B70FFFFFC0C0FFF0FFFFFFF0B80FFFFFC0C0FFF0F00F00F0
      0B70FFFFC0C0FFF0FFFFFFFF0B80FFFFC0C0FFF0CCCCCCCCC0B70FFFC0C0FFFF
      CFFFFFFFF0B00FFFC0C0FFFFCF00F00F000110FFC0C0FFFFCFFFFFFFFF000FFF
      C0C0FFFFCCCCCCCCCCCCFFFFC0C0FFFFC8CC8CC8CC8CFFFFC0C0FFFFCCCCCCCC
      CCCCFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFFFFFFFFFC0C0}
  end
  object BitBtnDelete: TBitBtn
    Left = 79
    Top = 3
    Width = 25
    Height = 35
    Hint = #1059#1076#1072#1083#1080#1090#1100' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    OnClick = BitBtnDeleteClick
    Glyph.Data = {
      66010000424D6601000000000000760000002800000014000000140000000100
      040000000000F0000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFF99FFFFF9FFC0C0FFFFFFFFFF999FFF9FFFC0C0FFFFFFFFFFF99FF99FFF
      C0C0FF00000000000999FFFFC0C0FF0FFFFFFFFF999FFFFFC0C0FF0F00F00F08
      9999FFFFC0C0FF0FFFFFFFF998899FFFC0C0FF0CCCCCC79CCCCFF9FFC0C0FFFC
      FFFFF97FFFCFFFFFC0C0FFFCF00F00F00FCFFFFFC0C0FFFCFFFFFFFFFFCFFFFF
      C0C0FFFCCCCCCCCCCCCFFFFFC0C0FFFC8CC8CC8CC8CFFFFFC0C0FFFCCCCCCCCC
      CCCFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFFFFFFFFFFFFFFFFFFC0C0FFFF
      FFFFFFFFFFFFFFFFC0C0}
  end
  object BitBtnSostav: TBitBtn
    Left = 111
    Top = 3
    Width = 25
    Height = 35
    Hint = 'C'#1086#1089#1090#1072#1074' '#1059#1044#1055' '#1054#1058#1050' '#1076#1083#1103' '#1090#1077#1082#1091#1097#1077#1075#1086' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    OnClick = BitBtnSostavClick
    Glyph.Data = {
      2A010000424D2A010000000000007600000028000000110000000F0000000100
      040000000000B4000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
      FFFFF08E06EBFFFFFF0000088FFFF08E06EBFFFFFF0AAA0088FFF08E06EBFFFF
      FF0AAA000FFFF08E06EBFFFFFF0AAA000FFFF08E06EBFFF0000000000FFFF08E
      06EBFF0B0D088880D0FFF08E06EBF0BBB0D0000DDD0FF08E06EBFDBBBB0DE0DD
      DDD0F08E06EBF0BBB080F00DDD00F08E06EBFF0B080FF0F0D000F08E06EBFFF0
      00FFFF0F000FF08E06EBFFFFFFFFFFF000FFF08E06EBFFFFFFFFFFFF0FFFF08E
      06EBFFFFFFFFFFFFFFFFF08E06EB}
  end
  object BitBtnClose: TBitBtn
    Left = 168
    Top = 3
    Width = 29
    Height = 35
    Hint = #1047#1072#1082#1088#1099#1090#1100
    ModalResult = 2
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
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
  object BitBtnCopy: TBitBtn
    Left = 136
    Top = 3
    Width = 25
    Height = 35
    Hint = #1050#1086#1087#1080#1088#1086#1074#1072#1090#1100' '#1059#1044#1055' '#1074' '#1076#1088#1091#1075#1086#1081' '#1087#1088#1086#1077#1082#1090'('#1099')'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = BitBtnCopyClick
    Glyph.Data = {
      EE000000424DEE000000000000007600000028000000100000000F0000000100
      04000000000078000000130B0000130B00001000000000000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888800000
      088888888880FFFF088888888880F88F088888800000FFFF08888880FFF4C4C4
      C8888880F88C4C4C48888880FFFF088888888884C4C4C8888888888C4C4C4888
      8888888888888888888888877777777788888888000000088888888880000088
      888888888800088888888888888088888888}
  end
  object BitBtnInto: TBitBtn
    Left = 28
    Top = 3
    Width = 25
    Height = 35
    Hint = #1054#1090#1082#1088#1099#1090#1100' '#1087#1086#1076#1095#1080#1085#1105#1085#1085#1099#1077' '#1059#1044#1055
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = BitBtnIntoClick
    Glyph.Data = {
      E6040000424DE604000000000000360000002800000014000000140000000100
      180000000000B0040000C40E0000C40E00000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080000000
      0000008080800000000000008080808080808080800000008080800000008080
      80FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF80808000000080
      8080000000808080808080FFFFFFFFFFFF000000808080000000808080FFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080800000
      00808080FFFFFFFFFFFFFFFFFF000000000000000000808080808080FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000808080000000808080
      FFFFFFFFFFFFFFFFFF000000000000000000808080000000FFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080FFFFFFFF
      FFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080FFFFFFFFFFFF8080
      80000000000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFF000000000000000000808080FFFFFF808080000000FFFFFF
      000000000000808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFF000000000000000000808080808080000000FFFFFFFFFFFF00000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080808080
      000000000000000000808080000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
      0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000008080
      80808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000000000808080FFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFF808080000000000000FFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF}
  end
  object Edit4: TEdit
    Left = 351
    Top = 198
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'Edit4'
    Visible = False
  end
  object Edit5: TEdit
    Left = 359
    Top = 238
    Width = 121
    Height = 21
    TabOrder = 14
    Text = 'Edit5'
    Visible = False
  end
  object Edit6: TEdit
    Left = 359
    Top = 238
    Width = 121
    Height = 21
    TabOrder = 15
    Text = 'Edit5'
    Visible = False
  end
  object Edit7: TEdit
    Left = 359
    Top = 238
    Width = 121
    Height = 21
    TabOrder = 13
    Text = 'Edit5'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1016
    Top = 104
    object OraQuery1udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
    end
    object OraQuery1datend: TStringField
      FieldName = 'datend'
    end
    object OraQuery1idudp: TFloatField
      FieldName = 'idudp'
    end
    object OraQuery1idudpudp: TFloatField
      FieldName = 'idudpudp'
    end
    object OraQuery1CHK_FLD: TStringField
      FieldName = 'CHK_FLD'
      Size = 1
    end
  end
  object OraQuery3: TOraQuery
    Left = 232
    Top = 288
  end
  object OraQuery4: TOraQuery
    Left = 232
    Top = 288
  end
  object OraQuery5: TOraQuery
    Left = 232
    Top = 288
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 992
    Top = 104
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
  object OraQuery2: TOraQuery
    Left = 912
    Top = 608
    object OraQuery2udp: TStringField
      FieldName = 'udp'
    end
    object OraQuery2name: TStringField
      FieldName = 'name'
      Size = 0
    end
    object OraQuery2datend: TStringField
      FieldName = 'datend'
      Size = 0
    end
    object OraQuery2idudp: TFloatField
      FieldName = 'idudp'
    end
  end
end