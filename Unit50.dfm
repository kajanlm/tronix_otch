object Form50: TForm50
  Left = 452
  Top = 137
  Width = 1167
  Height = 809
  Caption = 'Form50'
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
    Left = 872
    Top = 742
    Width = 19
    Height = 13
    Caption = #1062#1077#1093
  end
  object Image1: TImage
    Left = 968
    Top = 288
    Width = 137
    Height = 57
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 8
    Width = 1041
    Height = 721
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    PopupMenu = PopupMenu1
    SumList.Active = True
    SumList.VirtualRecords = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 2
    OnApplyFilter = DBGridEh1ApplyFilter
    OnGetCellParams = DBGridEh1GetCellParams
  end
  object Button1: TButton
    Left = 8
    Top = 736
    Width = 145
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100'_'#1064#1072#1073#1083#1086#1085
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 160
    Top = 736
    Width = 153
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100'_'#1064#1072#1073#1083#1086#1085
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 320
    Top = 736
    Width = 137
    Height = 25
    Caption = #1055#1077#1095#1072#1090#1100' '#1055#1046
    TabOrder = 3
    OnClick = Button3Click
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 896
    Top = 739
    Width = 161
    Height = 21
    EditButtons = <>
    KeyField = 'NOMER'
    ListField = 'NOMER'
    ListSource = OraDataSource2
    TabOrder = 4
    Visible = True
    OnKeyValueChanged = DBLookupComboboxEh1KeyValueChanged
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    MasterSource = OraDataSource1
    FetchAll = True
    Left = 952
    Top = 32
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 952
    Top = 72
  end
  object MemTableEh1: TMemTableEh
    FieldDefs = <>
    FetchAllOnOpen = True
    IndexDefs = <>
    Params = <>
    DataDriver = DataSetDriverEh1
    StoreDefs = True
    TreeList.Active = True
    TreeList.KeyFieldName = 'texkompl_id'
    TreeList.RefParentFieldName = 'texkompl_texkompl_id'
    BeforeEdit = MemTableEh1BeforeEdit
    AfterEdit = MemTableEh1AfterEdit
    BeforePost = MemTableEh1BeforePost
    AfterPost = MemTableEh1AfterPost
    OnCalcFields = MemTableEh1CalcFields
    Left = 952
    Top = 104
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    ResolveToDataSet = False
    Left = 952
    Top = 136
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 968
    Top = 240
  end
  object PopupMenu1: TPopupMenu
    Left = 968
    Top = 192
    object N1: TMenuItem
      Caption = #1055#1088#1080#1084#1077#1085#1080#1090#1100' '#1082#1086#1101#1092#1080#1094#1080#1077#1085#1090
      OnClick = N1Click
    end
    object N2: TMenuItem
      Caption = #1056#1072#1089#1087#1077#1095#1072#1090#1072#1090#1100' '#1085#1072#1088#1103#1076'('#1099')'
      OnClick = N2Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'par'
    Filter = 'par|*.par'
    Left = 1016
    Top = 32
  end
  object OpenDialog1: TOpenDialog
    Filter = 'par|*.par'
    Left = 1016
    Top = 72
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1000
    Top = 736
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery3
    Left = 1032
    Top = 736
  end
  object ExcelApplication1: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 840
    Top = 736
  end
  object ExcelWorksheet1: TExcelWorksheet
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 808
    Top = 736
  end
  object ExcelWorkbook1: TExcelWorkbook
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    Left = 776
    Top = 736
  end
end
