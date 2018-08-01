object Form39: TForm39
  Left = 215
  Top = 161
  Width = 1194
  Height = 273
  Caption = 'Form39'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1155
    Height = 201
    ActivePage = TabSheet5
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = #1057#1074#1103#1079#1085#1099#1077' '#1088#1072#1073#1086#1090#1099
      object DBGridEh1: TDBGridEh
        Left = -2
        Top = 0
        Width = 1155
        Height = 153
        DataSource = OraDataSource1
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        RowLines = 4
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnGetCellParams = DBGridEh1GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'nom1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1058#1050
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095'.'
            Width = 60
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1058#1050'2'
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095'.'
            Width = 60
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1058#1050'3'
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095'.'
            Width = 60
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1058#1050'4'
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1085#1072#1095'.'
            Width = 60
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1082#1086#1085
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end>
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1044#1074#1080#1078#1077#1085#1080#1077' '#1087#1086#1079#1080#1094#1080#1081
      ImageIndex = 1
      object DBGridEh2: TDBGridEh
        Left = 0
        Top = 0
        Width = 1155
        Height = 153
        DataSource = OraDataSource2
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGridEh2DblClick
        OnGetCellParams = DBGridEh2GetCellParams
        Columns = <
          item
            EditButtons = <>
            FieldName = 'nom1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1053#1072#1095
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end1'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1053#1072#1095
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end2'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1053#1072#1095
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end3'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'nom4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 100
            WordWrap = True
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1053#1072#1095
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'pdate_end4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1044#1072#1090#1072' '#1050#1086#1085'.'
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'otk_end4'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1054#1090#1095#1077#1090
            Width = 60
          end>
      end
      object Button2: TButton
        Left = 392
        Top = 152
        Width = 169
        Height = 25
        Caption = #1055#1086#1089#1084#1086#1090#1088#1077#1090#1100' '#1094#1077#1087#1086#1095#1082#1091
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1052#1072#1090#1077#1088#1080#1072#1083#1099
      ImageIndex = 2
      object DBGridEh3: TDBGridEh
        Left = 1
        Top = 0
        Width = 1155
        Height = 137
        DataSource = OraDataSource3
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 400
          end
          item
            EditButtons = <>
            FieldName = 'kod'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1086#1076
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'suma_potr'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_potr_tr'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072' '#1079#1072#1074#1086#1076#1077
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_potr_cex'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042' '#1094#1077#1093#1077
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_zap_kol'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1099#1076#1072#1085#1086
            Width = 120
          end>
      end
    end
    object TabSheet4: TTabSheet
      Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077
      ImageIndex = 3
      object DBGridEh4: TDBGridEh
        Left = 0
        Top = 0
        Width = 1155
        Height = 137
        DataSource = OraDataSource4
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 400
          end
          item
            EditButtons = <>
            FieldName = 'kod'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1086#1076
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'suma_potr'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_potr_tr'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072' '#1047#1072#1074#1086#1076#1077
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_potr_cex'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042' '#1094#1077#1093#1077
            Width = 120
          end
          item
            EditButtons = <>
            FieldName = 'sum_zap_kol'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1099#1076#1072#1085#1086
            Width = 120
          end>
      end
    end
    object TabSheet5: TTabSheet
      Caption = #1052#1057#1063
      ImageIndex = 4
      object DBGridEh5: TDBGridEh
        Left = 0
        Top = 8
        Width = 1145
        Height = 137
        DataSource = OraDataSource5
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGridEh5DblClick
        Columns = <
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077#1085' '#1080' '#1095#1077#1088#1090#1077#1078
            Width = 510
          end
          item
            EditButtons = <>
            FieldName = 'sprkod'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1050#1086#1076
            Width = 100
          end
          item
            EditButtons = <>
            FieldName = 'potr'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'zavod'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1053#1072' '#1079#1072#1074#1086#1076#1077
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'cex'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042' '#1094#1077#1093#1077
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'vidano'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1099#1076#1072#1085#1086
            Width = 65
          end
          item
            EditButtons = <>
            FieldName = 'TTN_NUM'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1057#1087#1080#1089#1086#1082' '#1052#1057#1063
            Width = 250
          end>
      end
    end
  end
  object CheckBox1: TCheckBox
    Left = 0
    Top = 200
    Width = 233
    Height = 17
    Caption = #1055#1086#1082#1072#1079#1099#1074#1072#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1076#1080#1092#1092#1080#1094#1080#1090
    Checked = True
    State = cbChecked
    TabOrder = 1
    OnClick = CheckBox1Click
  end
  object Button1: TButton
    Left = 232
    Top = 204
    Width = 89
    Height = 25
    Caption = #1042' '#1079#1072#1076'!!!!'
    TabOrder = 2
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 16
    Top = 160
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 272
    Top = 160
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 48
    Top = 164
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 240
    Top = 156
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 84
    Top = 160
  end
  object OraDataSource3: TOraDataSource
    DataSet = OraQuery3
    Left = 308
    Top = 160
  end
  object OraQuery4: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 116
    Top = 160
  end
  object OraDataSource4: TOraDataSource
    DataSet = OraQuery4
    Left = 340
    Top = 160
  end
  object OraQuery5: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 148
    Top = 160
  end
  object OraDataSource5: TOraDataSource
    DataSet = OraQuery5
    Left = 372
    Top = 160
  end
end
