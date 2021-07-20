object FSum_Norm_Trud_Razr_Setka_Prof_Ukr: TFSum_Norm_Trud_Razr_Setka_Prof_Ukr
  Left = 199
  Top = 310
  Width = 1300
  Height = 700
  Anchors = []
  Caption = 'FSum_Norm_Trud_Razr_Setka_Prof_Ukr'
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
    1292
    666)
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridEh1: TDBGridEh
    Left = 5
    Top = 0
    Width = 1280
    Height = 640
    Anchors = []
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    ReadOnly = True
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDrawColumnCell = DBGridEh1DrawColumnCell
    Columns = <
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'zak'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1047#1040#1042'.'#8470
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 58
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'cex'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1062#1045#1061
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 60
      end
      item
        EditButtons = <>
        FieldName = 'ukr'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1059#1050#1056
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 84
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'razrjd'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1056#1040#1047#1056#1071#1044
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 120
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'tars'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1058#1040#1056'.'#1057#1045#1058#1050#1040
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 102
      end
      item
        EditButtons = <>
        FieldName = 'trudoem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1058#1056#1059#1044#1054#1025#1052#1050#1054#1057#1058#1068
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 124
      end
      item
        Alignment = taCenter
        EditButtons = <>
        FieldName = 'kodprof'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Title.Alignment = taCenter
        Title.Caption = #1050#1054#1044' '#1055#1056#1054#1060#1045#1057#1057#1048#1048
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 136
      end
      item
        EditButtons = <>
        FieldName = 'prof'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Footers = <>
        Layout = tlCenter
        Title.Alignment = taCenter
        Title.Caption = #1055#1056#1054#1060#1045#1057#1057#1048#1071
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 573
      end>
  end
  object Edit1: TEdit
    Left = 529
    Top = 317
    Width = 247
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
    Visible = False
  end
  object Edit2: TEdit
    Left = 520
    Top = 237
    Width = 249
    Height = 21
    TabOrder = 1
    Text = 'Edit2'
    Visible = False
  end
  object Button1: TButton
    Left = 16
    Top = 640
    Width = 75
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
  object Edit3: TEdit
    Left = 760
    Top = 361
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 1032
    Top = 144
    object OraQuery1zak: TStringField
      FieldName = 'zak'
    end
    object OraQuery1cex: TStringField
      FieldName = 'cex'
    end
    object OraQuery1ukr: TStringField
      FieldName = 'ukr'
    end
    object OraQuery1razrjd: TStringField
      FieldName = 'razrjd'
    end
    object OraQuery1tars: TStringField
      FieldName = 'tars'
    end
    object OraQuery1trudoem: TFloatField
      FieldName = 'trudoem'
    end
    object OraQuery1kodprof: TStringField
      FieldName = 'kodprof'
    end
    object OraQuery1prof: TStringField
      FieldName = 'prof'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 984
    Top = 136
  end
  object SaveDialog1: TSaveDialog
    Left = 552
    Top = 680
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
    Left = 808
    Top = 240
  end
end
