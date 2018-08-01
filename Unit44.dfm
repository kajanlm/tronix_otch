object Form44: TForm44
  Left = 309
  Top = 212
  Width = 1080
  Height = 600
  Caption = 'Form44'
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
    Left = 1016
    Top = 0
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 64
    Width = 1033
    Height = 481
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    STFilter.Local = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    OnKeyPress = DBGridEh1KeyPress
  end
  object DBLookupComboboxEh1: TDBLookupComboboxEh
    Left = 24
    Top = 8
    Width = 345
    Height = 21
    EditButtons = <>
    KeyField = 'ident'
    ListField = 'ident'
    ListSource = OraDataSource2
    TabOrder = 1
    Visible = True
    OnChange = DBLookupComboboxEh1Change
  end
  object DBLookupComboboxEh2: TDBLookupComboboxEh
    Left = 384
    Top = 8
    Width = 305
    Height = 21
    EditButtons = <>
    KeyField = 'poz1'
    ListField = 'poz1'
    ListSource = OraDataSource3
    TabOrder = 2
    Visible = True
    OnChange = DBLookupComboboxEh2Change
  end
  object CheckBox1: TCheckBox
    Left = 704
    Top = 8
    Width = 209
    Height = 17
    Caption = #1057#1088#1091#1073#1080#1090#1100' '#1076#1077#1088#1077#1074#1086' -- '#1087#1086#1075#1091#1073#1080#1090#1100' '#1073#1086#1073#1088#1072
    TabOrder = 3
    OnClick = CheckBox1Click
  end
  object Button1: TButton
    Left = 24
    Top = 32
    Width = 161
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1089#1087#1080#1089#1086#1082' '#1082#1072#1088#1090
    TabOrder = 4
    Visible = False
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 200
    Top = 32
    Width = 169
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1057#1093#1077#1084#1091' '#1050#1072#1088#1090
    TabOrder = 5
    Visible = False
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 384
    Top = 32
    Width = 217
    Height = 25
    Caption = #1047#1072#1075#1088#1091#1079#1080#1090#1100' '#1057#1093#1077#1084#1091' '#1050#1072#1088#1090
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 616
    Top = 32
    Width = 169
    Height = 25
    Caption = #1057#1076#1077#1083#1072#1090#1100' '#1082#1072#1088#1090#1091
    TabOrder = 7
    OnClick = Button4Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    AfterPost = OraQuery1AfterPost
    Left = 1024
    Top = 16
  end
  object OraDataSource1: TOraDataSource
    DataSet = MemTableEh1
    Left = 1024
    Top = 144
  end
  object DataSetDriverEh1: TDataSetDriverEh
    ProviderDataSet = OraQuery1
    Left = 1024
    Top = 48
  end
  object MemTableEh1: TMemTableEh
    FetchAllOnOpen = True
    Params = <>
    DataDriver = DataSetDriverEh1
    ReadOnly = True
    TreeList.KeyFieldName = 'nn'
    TreeList.RefParentFieldName = 'up_nn'
    Left = 1016
    Top = 88
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 992
    Top = 8
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    Left = 960
    Top = 16
  end
  object OraQuery4: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 920
    Top = 8
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery4
    Left = 896
    Top = 16
  end
  object OraQuery5: TOraQuery
    Session = Form1.OraSession1
    FetchAll = True
    ReadOnly = True
    Left = 824
    Top = 16
  end
  object OraDataSource3: TOraDataSource
    DataSet = OraQuery5
    Left = 856
    Top = 16
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = 'c_lst'
    Filter = #1060#1072#1081#1083' '#1050#1072#1088#1090'|*.c_lst|'#1058#1077#1082#1089#1090#1086#1074#1099#1081'|*.txt'
    FilterIndex = 2
    Left = 992
    Top = 40
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = #1060#1072#1081#1083' '#1050#1072#1088#1090'|*.c_lst'
    Filter = #1060#1072#1081#1083' '#1050#1072#1088#1090'|*.c_lst'
    Left = 936
    Top = 32
  end
end
