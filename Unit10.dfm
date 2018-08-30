object Form10: TForm10
  Left = 461
  Top = 413
  Width = 471
  Height = 333
  Caption = 'Form10'
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
    Left = 336
    Top = 224
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object Label2: TLabel
    Left = 184
    Top = 264
    Width = 42
    Height = 13
    Caption = #1055#1086' '#1094#1077#1093#1091':'
    Visible = False
  end
  object Label3: TLabel
    Left = 336
    Top = 248
    Width = 3
    Height = 13
    Visible = False
  end
  object Label4: TLabel
    Left = 368
    Top = 264
    Width = 3
    Height = 13
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 8
    Top = 17
    Width = 441
    Height = 212
    DataSource = OraDataSource1
    Flat = False
    FooterColor = clWindow
    FooterFont.Charset = DEFAULT_CHARSET
    FooterFont.Color = clWindowText
    FooterFont.Height = -11
    FooterFont.Name = 'MS Sans Serif'
    FooterFont.Style = []
    ReadOnly = True
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnDblClick = DBGridEh1DblClick
    Columns = <
      item
        EditButtons = <>
        FieldName = 'Nomer'
        Footers = <>
        Title.Caption = #1053#1086#1084#1077#1088
        Width = 150
      end
      item
        EditButtons = <>
        FieldName = 'NAME'
        Footers = <>
        Title.Caption = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
        Width = 270
      end>
  end
  object Button1: TButton
    Left = 8
    Top = 232
    Width = 75
    Height = 25
    Caption = #1053#1080#1078#1077
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 88
    Top = 232
    Width = 75
    Height = 25
    Caption = #1042#1042#1077#1088#1093
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 264
    Width = 155
    Height = 25
    Caption = #1057#1092#1086#1088#1084#1080#1088#1086#1074#1072#1090#1100
    TabOrder = 3
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 230
    Top = 261
    Width = 65
    Height = 21
    TabOrder = 4
    Visible = False
  end
  object OraQuery1: TOraQuery
    Session = Form1.OraSession1
    ReadOnly = True
    Left = 384
    object OraQuery1Texkompl_id: TFloatField
      FieldName = 'Texkompl_id'
    end
    object OraQuery1Nomer: TStringField
      FieldName = 'Nomer'
    end
    object OraQuery1NAME: TStringField
      FieldName = 'NAME'
    end
    object OraQuery1texkompl_texkompl_id: TFloatField
      FieldName = 'texkompl_texkompl_id'
    end
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 424
    Top = 8
  end
end
