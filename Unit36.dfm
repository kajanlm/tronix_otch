object Form36: TForm36
  Left = 159
  Top = 232
  Width = 1341
  Height = 681
  Caption = 'Form36'
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
  object Edit1: TEdit
    Left = 1168
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 1281
    Height = 601
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    OptionsEh = [dghFixed3D, dghHighlightFocus, dghClearSelection, dghRowHighlight, dghDialogFind]
    ReadOnly = True
    RowSizingAllowed = True
    STFilter.Local = True
    STFilter.Visible = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnApplyFilter = DBGridEh1ApplyFilter
    OnCellClick = DBGridEh1CellClick
    OnColExit = DBGridEh1ColExit
    OnDblClick = DBGridEh1DblClick
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnGetCellParams = DBGridEh1GetCellParams
    Columns = <
      item
        EditButtons = <>
        FieldName = 'nomer'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 140
      end
      item
        EditButtons = <>
        FieldName = 'name'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 364
      end
      item
        EditButtons = <>
        FieldName = 'doc'
        Footers = <>
        MRUList.Active = True
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1063#1077#1088#1090#1077#1078
        Width = 387
      end
      item
        EditButtons = <>
        FieldName = 'dep'
        Footers = <>
        STFilter.DataField = 'dep'
        STFilter.KeyField = 'dep'
        STFilter.ListField = 'dep'
        STFilter.ListSource = OraDataSource1
        Title.Caption = #1062#1077#1093
        Width = 30
      end
      item
        EditButtons = <>
        FieldName = 'trudoem'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1058#1088#1091#1076
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'nar'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1047#1072#1082#1088#1099#1090#1086' '#1087#1086' '#1085#1072#1088#1103#1076#1072#1084
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'pdate_beg'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'pdate_end'
        Footers = <>
        STFilter.ListSource = OraDataSource1
        STFilter.Visible = False
        Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085#1094#1072
        Width = 80
      end
      item
        EditButtons = <>
        FieldName = 'otk_end'
        Footers = <>
        STFilter.Visible = False
        Title.Caption = #1044#1072#1090#1072' '#1047#1072#1082#1088#1099#1090#1080#1103
        Width = 80
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 616
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = Button1Click
  end
  object MonthCalendar1: TMonthCalendar
    Left = 1200
    Top = 24
    Width = 191
    Height = 154
    Date = 41590.381483842590000000
    TabOrder = 3
    Visible = False
    OnDblClick = MonthCalendar1DblClick
  end
  object Button2: TButton
    Left = 88
    Top = 616
    Width = 161
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1089#1086' '#1089#1090#1088#1091#1082#1090#1091#1088#1086#1081
    TabOrder = 4
    OnClick = Button2Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    MasterSource = OraDataSource1
    FetchAll = True
    ReadOnly = True
    AfterPost = OraQuery1AfterPost
    AfterScroll = OraQuery1AfterScroll
    Left = 1208
    Top = 64
    object OraQuery1nomer: TStringField
      FieldName = 'nomer'
      Size = 45
    end
    object OraQuery1name: TStringField
      FieldName = 'name'
      Size = 100
    end
    object OraQuery1trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object OraQuery1dep: TStringField
      FieldName = 'dep'
    end
    object OraQuery1texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
    object OraQuery1texkompl_texkompl_id: TFloatField
      FieldName = 'texkompl_texkompl_id'
    end
    object OraQuery1pdate_beg: TStringField
      FieldName = 'pdate_beg'
    end
    object OraQuery1pdate_end: TStringField
      FieldName = 'pdate_end'
    end
    object OraQuery1doc: TStringField
      FieldName = 'doc'
      Size = 1000
    end
    object OraQuery1otk_end: TStringField
      FieldName = 'otk_end'
    end
    object OraQuery1type_tex: TFloatField
      FieldName = 'type_tex'
    end
    object OraQuery1nar: TFloatField
      FieldName = 'nar'
    end
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    Left = 1208
    Top = 120
  end
  object MemTableEh1: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataSetDriverEh1
    ReadOnly = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'texkompl_id'
    TreeList.RefParentFieldName = 'texkompl_texkompl_id'
    Left = 1232
    Top = 176
    object MemTableEh1nomer: TStringField
      FieldName = 'nomer'
      Size = 50
    end
    object MemTableEh1doc: TStringField
      FieldName = 'doc'
      Size = 100000
    end
    object MemTableEh1trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object MemTableEh1name: TStringField
      FieldName = 'name'
      Size = 100
    end
    object MemTableEh1texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
    object MemTableEh1texkompl_texkompl_id: TFloatField
      FieldName = 'texkompl_texkompl_id'
    end
    object MemTableEh1dep: TStringField
      FieldName = 'dep'
    end
    object MemTableEh1pdate_beg: TStringField
      FieldName = 'pdate_beg'
    end
    object MemTableEh1pdate_end: TStringField
      FieldName = 'pdate_end'
    end
    object MemTableEh1otk_end: TStringField
      FieldName = 'otk_end'
    end
    object MemTableEh1type_tex: TFloatField
      FieldName = 'type_tex'
    end
    object MemTableEh1nar: TFloatField
      FieldName = 'nar'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 1240
    Top = 240
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1232
    Top = 312
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 1240
    Top = 600
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1208
    Top = 600
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 1168
    Top = 608
  end
  object SaveDialog1: TSaveDialog
    Left = 1120
    Top = 608
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    Left = 1288
    Top = 224
  end
  object OraQuery4: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 1280
    Top = 288
  end
end
