object Form17: TForm17
  Left = 214
  Top = 198
  Width = 1203
  Height = 791
  Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1072#1088#1103#1076#1086#1074
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
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 1185
    Height = 745
    ActivePage = TabSheet3
    TabOrder = 0
    Visible = False
    object TabSheet1: TTabSheet
      Caption = #1047#1040#1050#1040#1047#1067
      OnShow = TabSheet1Show
      object DBGridEh1: TDBGridEh
        Left = 14
        Top = 16
        Width = 505
        Height = 329
        DataSource = OraDataSource1
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
      end
      object DBGridEh2: TDBGridEh
        Left = 16
        Top = 368
        Width = 505
        Height = 329
        DataSource = OraDataSource2
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object TabSheet2: TTabSheet
      Caption = #1055#1040#1056#1040#1052#1045#1058#1056#1067
      ImageIndex = 1
      object Bevel1: TBevel
        Left = 32
        Top = 50
        Width = 425
        Height = 50
      end
      object Label1: TLabel
        Left = 203
        Top = 12
        Width = 19
        Height = 13
        Caption = #1062#1077#1093
      end
      object Edit1: TEdit
        Left = 40
        Top = 64
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 0
        OnChange = Edit1Change
      end
      object Edit2: TEdit
        Left = 66
        Top = 64
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 1
        OnChange = Edit2Change
      end
      object Edit9: TEdit
        Left = 256
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 2
        OnChange = Edit9Change
      end
      object Edit5: TEdit
        Left = 150
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 3
        OnChange = Edit5Change
      end
      object Edit10: TEdit
        Left = 283
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 4
        OnChange = Edit10Change
      end
      object Edit11: TEdit
        Left = 309
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 5
        OnChange = Edit11Change
      end
      object Edit12: TEdit
        Left = 336
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 6
        OnChange = Edit12Change
      end
      object Edit13: TEdit
        Left = 363
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 7
        OnChange = Edit13Change
      end
      object Edit14: TEdit
        Left = 389
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 8
        OnChange = Edit14Change
      end
      object Edit15: TEdit
        Left = 415
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 9
      end
      object Edit3: TEdit
        Left = 96
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 10
        OnChange = Edit3Change
      end
      object Edit4: TEdit
        Left = 124
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 11
        OnChange = Edit4Change
      end
      object Edit6: TEdit
        Left = 176
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 12
        OnChange = Edit6Change
      end
      object Edit7: TEdit
        Left = 203
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 13
        OnChange = Edit7Change
      end
      object Edit8: TEdit
        Left = 229
        Top = 65
        Width = 25
        Height = 21
        AutoSize = False
        MaxLength = 1
        TabOrder = 14
        OnChange = Edit8Change
      end
      object Edit16: TEdit
        Left = 232
        Top = 8
        Width = 73
        Height = 21
        TabOrder = 15
      end
    end
    object TabSheet3: TTabSheet
      Caption = #1053#1040#1056#1071#1044#1067
      ImageIndex = 2
      OnShow = TabSheet3Show
      object GroupBox3: TGroupBox
        Left = 0
        Top = 472
        Width = 601
        Height = 241
        Caption = #1054#1087#1077#1088#1072#1094#1080#1080
        TabOrder = 5
      end
      object GroupBox2: TGroupBox
        Left = 0
        Top = 229
        Width = 601
        Height = 241
        Caption = #1056#1072#1073#1086#1090#1099' '#1059#1095#1072#1089#1090#1082#1072
        TabOrder = 3
      end
      object GroupBox1: TGroupBox
        Left = 0
        Top = -2
        Width = 601
        Height = 233
        Caption = #1056#1072#1073#1086#1090#1099' '#1062#1077#1093#1072
        TabOrder = 2
        object DBGridEh6: TDBGridEh
          Left = 8
          Top = 123
          Width = 577
          Height = 104
          DataSource = OraDataSource6
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
          OnEnter = DBGridEh6Enter
          Columns = <
            item
              EditButtons = <>
              FieldName = 'razryd'
              Footers = <>
              Title.Caption = #1056#1072#1079#1088#1103#1076
              Width = 30
            end
            item
              EditButtons = <>
              FieldName = 'name'
              Footers = <>
              Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
              Width = 150
            end
            item
              Alignment = taLeftJustify
              EditButtons = <>
              FieldName = 'norm'
              Footers = <>
              Title.Caption = #1058#1088#1091#1076
              Width = 50
            end
            item
              Alignment = taLeftJustify
              EditButtons = <>
              FieldName = 'nakl'
              Footers = <>
              Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
            end
            item
              EditButtons = <>
              FieldName = 'Tarif_grid'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1058#1072#1088#1080#1092#1085#1072#1103' '#1057#1077#1090#1082#1072
            end
            item
              EditButtons = <>
              FieldName = 'vid_rabot_name'
              Footers = <>
              ReadOnly = True
              Title.Caption = #1042#1080#1076' '#1088#1072#1073#1086#1090
              Width = 60
            end
            item
              EditButtons = <>
              FieldName = 'vid_norm_name'
              Footers = <>
              Title.Caption = #1053#1086#1088#1084#1072
              Width = 62
            end
            item
              EditButtons = <>
              FieldName = 'ysl_rabot_name'
              Footers = <>
              Title.Caption = #1059#1089#1083#1086#1074#1080#1103' '#1088#1072#1073#1086#1090
            end
            item
              EditButtons = <>
              Footers = <>
            end>
        end
      end
      object DBGridEh3: TDBGridEh
        Left = 8
        Top = 13
        Width = 577
        Height = 105
        DataSource = OraDataSource3
        Flat = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -5
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridEh3Enter
        Columns = <
          item
            EditButtons = <>
            FieldName = 'nomer'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 235
          end
          item
            EditButtons = <>
            FieldName = 'nomer_1'
            Footers = <>
            Title.Caption = #1062#1077#1093
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 65
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'trud'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = #1058#1088#1091#1076
            Width = 60
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'nar'
            Footers = <>
            Title.Alignment = taRightJustify
            Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
            Width = 70
          end>
      end
      object DBGridEh4: TDBGridEh
        Left = 8
        Top = 245
        Width = 577
        Height = 120
        DataSource = OraDataSource4
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridEh4Enter
        Columns = <
          item
            EditButtons = <>
            FieldName = 'nomer'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 235
          end
          item
            EditButtons = <>
            FieldName = 'nomer_1'
            Footers = <>
            Title.Caption = #1062#1077#1093
            Width = 35
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 65
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'trud'
            Footers = <>
            Title.Caption = #1058#1088#1091#1076
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'nar'
            Footers = <>
            Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
            Width = 70
          end>
      end
      object DBGridEh5: TDBGridEh
        Left = 8
        Top = 484
        Width = 577
        Height = 122
        DataSource = OraDataSource5
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridEh5Enter
        Columns = <
          item
            EditButtons = <>
            FieldName = 'nomer'
            Footers = <>
            Title.Caption = #1053#1086#1084#1077#1088
            Width = 85
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
            Width = 230
          end
          item
            EditButtons = <>
            FieldName = 'Nomer1'
            Footers = <>
            Title.Caption = #1062#1077#1093
            Width = 40
          end
          item
            EditButtons = <>
            FieldName = 'pdate_beg'
            Footers = <>
            Title.Caption = #1044#1072#1090#1072
            Width = 65
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'trudoem'
            Footers = <>
            Title.Caption = #1058#1088#1091#1076
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'nar'
            Footers = <>
            Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
            Width = 70
          end>
      end
      object DBGridEh7: TDBGridEh
        Left = 8
        Top = 365
        Width = 576
        Height = 100
        DataSource = OraDataSource7
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        ReadOnly = True
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridEh7Enter
        Columns = <
          item
            EditButtons = <>
            FieldName = 'razryd'
            Footers = <>
            Title.Caption = #1056#1072#1079#1088#1103#1076
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
            Width = 150
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'norm'
            Footers = <>
            Title.Caption = #1058#1088#1091#1076
            Width = 50
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'nakl'
            Footers = <>
            Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
          end
          item
            EditButtons = <>
            FieldName = 'tarif_grid'
            Footers = <>
            Title.Caption = #1058#1072#1088#1080#1092#1085#1072#1103' '#1057#1077#1090#1082#1072
          end
          item
            EditButtons = <>
            FieldName = 'vid_rabot_name'
            Footers = <>
            Title.Caption = #1042#1080#1076' '#1056#1072#1073#1086#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'vid_norm_name'
            Footers = <>
            Title.Caption = #1053#1086#1088#1084#1072
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'ysl_rabot_name'
            Footers = <>
            Title.Caption = #1059#1089#1083#1086#1074#1080#1103' '#1088#1072#1073#1086#1090
          end>
      end
      object DBGridEh8: TDBGridEh
        Left = 8
        Top = 608
        Width = 579
        Height = 100
        DataSource = OraDataSource8
        Flat = False
        FooterColor = clWindow
        FooterFont.Charset = DEFAULT_CHARSET
        FooterFont.Color = clWindowText
        FooterFont.Height = -11
        FooterFont.Name = 'MS Sans Serif'
        FooterFont.Style = []
        TabOrder = 7
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnEnter = DBGridEh8Enter
        Columns = <
          item
            EditButtons = <>
            FieldName = 'razryd'
            Footers = <>
            Title.Caption = #1056#1072#1079#1088#1103#1076
            Width = 30
          end
          item
            EditButtons = <>
            FieldName = 'name'
            Footers = <>
            Title.Caption = #1055#1088#1086#1092#1077#1089#1089#1080#1103
            Width = 150
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'norm'
            Footers = <>
            Title.Caption = #1058#1088#1091#1076
            Width = 50
          end
          item
            Alignment = taLeftJustify
            EditButtons = <>
            FieldName = 'nakl'
            Footers = <>
            Title.Caption = #1055#1086' '#1085#1072#1088#1103#1076#1072#1084
          end
          item
            EditButtons = <>
            FieldName = 'tarif_grid'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1058#1072#1088#1080#1092#1085#1072#1103' '#1057#1077#1090#1082#1072
          end
          item
            EditButtons = <>
            FieldName = 'vid_rabot_name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1042#1080#1076' '#1056#1072#1073#1086#1090
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'vid_norm_name'
            Footers = <>
            Title.Caption = #1053#1086#1088#1084#1072
            Width = 60
          end
          item
            EditButtons = <>
            FieldName = 'ysl_rabot_name'
            Footers = <>
            ReadOnly = True
            Title.Caption = #1059#1089#1083#1086#1074#1080#1103' '#1088#1072#1073#1086#1090
            Width = 60
          end>
      end
      object Button1: TButton
        Left = 614
        Top = 681
        Width = 153
        Height = 25
        Caption = #1057#1086#1079#1076#1072#1090#1100' '#1085#1072#1088#1103#1076' '#1087#1086' '#1086#1087#1077#1088#1072#1094#1080#1080
        TabOrder = 8
        Visible = False
        OnClick = Button1Click
      end
    end
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      'Select Zavn, name, project_id from Tronix.Project_list '
      'where date_end is null'
      'order by zavn')
    ReadOnly = True
    Active = True
    Left = 1128
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 1096
  end
  object OraQuery2: TOraQuery
    Session = Form1.OraSession1
    SQL.Strings = (
      
        'Select zak.zak, feb.text,zak.id_project,zak.nn from tronix.feb_n' +
        'ame feb,'
      'tronix.zakaz zak where zak.name=feb.nn')
    MasterSource = OraDataSource1
    MasterFields = 'PROJECT_ID'
    DetailFields = 'ID_PROJECT'
    ReadOnly = True
    Active = True
    Left = 1132
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROJECT_ID'
        ParamType = ptInput
        Value = 181
      end>
  end
  object OraDataSource2: TOraDataSource
    DataSet = OraQuery2
    Left = 1100
    Top = 24
  end
  object OraQuery3: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    AfterScroll = OraQuery3AfterScroll
    OnCalcFields = OraQuery3CalcFields
    Left = 1132
    Top = 56
    object OraQuery3nomer: TStringField
      FieldName = 'nomer'
    end
    object OraQuery3name: TStringField
      FieldName = 'name'
    end
    object OraQuery3nomer_1: TStringField
      FieldName = 'nomer_1'
    end
    object OraQuery3pdate_end: TStringField
      FieldName = 'pdate_beg'
    end
    object OraQuery3trud: TFloatField
      FieldName = 'trud'
    end
    object OraQuery3nar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'nar'
      Calculated = True
    end
    object OraQuery3texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
  end
  object OraDataSource3: TOraDataSource
    DataSet = OraQuery3
    Left = 1100
    Top = 56
  end
  object OraQuery4: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1132
    Top = 88
  end
  object OraQuery5: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    AfterScroll = OraQuery5AfterScroll
    OnCalcFields = OraQuery5CalcFields
    Left = 1132
    Top = 120
    object OraQuery5nomer: TStringField
      FieldName = 'nomer'
    end
    object OraQuery5name: TStringField
      FieldName = 'name'
    end
    object OraQuery5nomer_1: TStringField
      FieldName = 'nomer_1'
    end
    object OraQuery5pdate_beg: TStringField
      FieldName = 'pdate_beg'
    end
    object OraQuery5trud: TFloatField
      FieldName = 'trud'
    end
    object OraQuery5texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
    object OraQuery5nar: TFloatField
      FieldKind = fkCalculated
      FieldName = 'nar'
      Calculated = True
    end
  end
  object OraDataSource4: TOraDataSource
    DataSet = OraQuery5
    Left = 1100
    Top = 120
  end
  object OraQuery6: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1132
    Top = 152
  end
  object OraQuery7: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    AfterScroll = OraQuery7AfterScroll
    Left = 1132
    Top = 184
    object OraQuery7nomer: TStringField
      FieldName = 'nomer'
    end
    object OraQuery7name: TStringField
      FieldName = 'name'
    end
    object OraQuery7Nomer1: TStringField
      FieldName = 'Nomer1'
    end
    object OraQuery7pdate_beg: TStringField
      FieldName = 'pdate_beg'
    end
    object OraQuery7trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object OraQuery7nar: TFloatField
      FieldName = 'nar'
    end
    object OraQuery7texkompl_id: TFloatField
      FieldName = 'texkompl_id'
    end
  end
  object OraDataSource5: TOraDataSource
    DataSet = OraQuery7
    Left = 1100
    Top = 184
  end
  object OraQuery8: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery8CalcFields
    Left = 1132
    Top = 216
    object OraQuery8kvalif_kvalif_id: TFloatField
      FieldName = 'kvalif_kvalif_id'
      ReadOnly = True
    end
    object OraQuery8name: TStringField
      FieldName = 'name'
      ReadOnly = True
    end
    object OraQuery8razryd: TStringField
      FieldName = 'razryd'
      ReadOnly = True
    end
    object OraQuery8vid_norm_vid_norm_id: TFloatField
      FieldName = 'vid_norm_vid_norm_id'
      ReadOnly = True
    end
    object OraQuery8vid_rabot_vid_rabot_id: TFloatField
      FieldName = 'vid_rabot_vid_rabot_id'
      ReadOnly = True
    end
    object OraQuery8ysl_rabot_ysl_rabot_id: TFloatField
      FieldName = 'ysl_rabot_ysl_rabot_id'
      ReadOnly = True
    end
    object OraQuery8norm: TFloatField
      FieldName = 'norm'
      ReadOnly = True
    end
    object OraQuery8nakl: TFloatField
      FieldName = 'nakl'
      ReadOnly = True
    end
    object OraQuery8vid_norm_name: TStringField
      FieldName = 'vid_norm_name'
    end
    object OraQuery8vid_rabot_name: TStringField
      FieldName = 'vid_rabot_name'
    end
    object OraQuery8ysl_rabot_name: TStringField
      FieldName = 'ysl_rabot_name'
    end
    object OraQuery8Tarif_grid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'Tarif_grid'
      Calculated = True
    end
  end
  object OraDataSource6: TOraDataSource
    DataSet = OraQuery8
    Left = 1100
    Top = 216
  end
  object OraQuery9: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery9CalcFields
    Left = 1132
    Top = 248
    object OraQuery9kvalif_kvalif_id: TFloatField
      FieldName = 'kvalif_kvalif_id'
      ReadOnly = True
    end
    object OraQuery9name: TStringField
      FieldName = 'name'
      ReadOnly = True
    end
    object OraQuery9vid_norm_vid_norm_id: TFloatField
      FieldName = 'vid_norm_vid_norm_id'
      ReadOnly = True
    end
    object OraQuery9razryd: TStringField
      FieldName = 'razryd'
      ReadOnly = True
      Size = 0
    end
    object OraQuery9vid_rabot_vid_rabot_id: TFloatField
      FieldName = 'vid_rabot_vid_rabot_id'
      ReadOnly = True
    end
    object OraQuery9ysl_rabot_ysl_rabot_id: TFloatField
      FieldName = 'ysl_rabot_ysl_rabot_id'
      ReadOnly = True
    end
    object OraQuery9nakl: TFloatField
      FieldName = 'nakl'
      ReadOnly = True
    end
    object OraQuery9norm: TFloatField
      FieldName = 'norm'
      ReadOnly = True
    end
    object OraQuery9ysl_rabot_name: TStringField
      FieldName = 'ysl_rabot_name'
    end
    object OraQuery9tarif_grid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tarif_grid'
      Calculated = True
    end
    object OraQuery9vid_rabot_name: TStringField
      FieldName = 'vid_rabot_name'
    end
    object OraQuery9vid_norm_name: TStringField
      FieldName = 'vid_norm_name'
    end
  end
  object OraDataSource7: TOraDataSource
    DataSet = OraQuery9
    Left = 1100
    Top = 248
  end
  object OraQuery10: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    OnCalcFields = OraQuery10CalcFields
    Left = 1132
    Top = 280
    object OraQuery10kvaliv_kvalif_id: TFloatField
      FieldName = 'kvalif_kvalif_id'
      ReadOnly = True
    end
    object OraQuery10name: TStringField
      FieldName = 'name'
      ReadOnly = True
      Size = 0
    end
    object OraQuery10razryd: TStringField
      FieldName = 'razryd'
      ReadOnly = True
    end
    object OraQuery10vid_norm_vid_norm_id: TFloatField
      FieldName = 'vid_norm_vid_norm_id'
      ReadOnly = True
    end
    object OraQuery10vid_rabot_vid_rabot_id: TFloatField
      FieldName = 'vid_rabot_vid_rabot_id'
      ReadOnly = True
    end
    object OraQuery10ysl_rabot_ysl_rabot_id: TFloatField
      FieldName = 'ysl_rabot_ysl_rabot_id'
      ReadOnly = True
    end
    object OraQuery10norm: TFloatField
      FieldName = 'norm'
      ReadOnly = True
    end
    object OraQuery10nakl: TFloatField
      FieldName = 'nakl'
      ReadOnly = True
    end
    object OraQuery10vid_norm_name: TStringField
      FieldName = 'vid_norm_name'
    end
    object OraQuery10vid_rabot_name: TStringField
      FieldName = 'vid_rabot_name'
    end
    object OraQuery10ysl_rabot_name: TStringField
      FieldName = 'ysl_rabot_name'
    end
    object OraQuery10tarif_grid: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'tarif_grid'
      Calculated = True
    end
  end
  object OraDataSource8: TOraDataSource
    DataSet = OraQuery10
    Left = 1100
    Top = 280
  end
  object OraQuery11: TOraQuery
    ReadOnly = True
    Left = 1132
    Top = 312
  end
  object OraQuery12: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1132
    Top = 344
  end
end
