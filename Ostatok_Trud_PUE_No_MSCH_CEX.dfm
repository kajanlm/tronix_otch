object FOstatok_Trud_PUE_No_MSCH_CEX: TFOstatok_Trud_PUE_No_MSCH_CEX
  Left = 314
  Top = 374
  Width = 1008
  Height = 610
  Anchors = []
  AutoSize = True
  Caption = ' FOstatok_Trud_PUE_No_MSCH_CEX'
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
    1000
    576)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 0
    Top = 23
    Width = 1000
    Height = 553
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
        EditButtons = <>
        FieldName = 'ukrpom'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1059#1055
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 43
      end
      item
        EditButtons = <>
        FieldName = 'txnomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 158
      end
      item
        EditButtons = <>
        FieldName = 'txname'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1053#1040#1048#1052#1045#1053#1054#1042#1040#1053#1048#1045' '#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 310
      end
      item
        EditButtons = <>
        FieldName = 'denomer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 50
      end
      item
        EditButtons = <>
        FieldName = 'txtrud'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068' '#1058#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 77
      end
      item
        EditButtons = <>
        FieldName = 'otrab'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1058#1056'-'#1058#1068' '#1042#1067#1056#1040#1041'.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 97
      end
      item
        EditButtons = <>
        FieldName = 'ostatok'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Footers = <>
        ReadOnly = True
        Title.Alignment = taCenter
        Title.Caption = #1054#1057#1058#1040#1058#1054#1050
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 67
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'proe'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1054#1045#1050#1058
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 206
      end>
  end
  object Edit1: TEdit
    Left = 128
    Top = 94
    Width = 31
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 60
    Top = 102
    Width = 37
    Height = 21
    TabOrder = 2
    Text = 'Edit2'
    Visible = False
  end
  object Edit3: TEdit
    Left = 55
    Top = 54
    Width = 30
    Height = 21
    TabOrder = 5
    Text = 'Edit3'
    Visible = False
  end
  object Edit4: TEdit
    Left = 215
    Top = 110
    Width = 30
    Height = 21
    TabOrder = 3
    Text = 'Edit4'
    Visible = False
  end
  object Button1: TButton
    Left = 704
    Top = 0
    Width = 57
    Height = 25
    Caption = 'Excel'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    Left = 1032
    Top = 104
    object OraQuery1ukrpom: TStringField
      FieldName = 'ukrpom'
    end
    object OraQuery1txnomer: TStringField
      FieldName = 'txnomer'
    end
    object OraQuery1txname: TStringField
      FieldName = 'txname'
    end
    object OraQuery1denomer: TStringField
      FieldName = 'denomer'
    end
    object OraQuery1txtrud: TFloatField
      FieldName = 'txtrud'
    end
    object OraQuery1otrab: TFloatField
      FieldName = 'otrab'
    end
    object OraQuery1ostatok: TFloatField
      FieldName = 'ostatok'
    end
    object OraQuery1proe: TStringField
      FieldName = 'proe'
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
end
