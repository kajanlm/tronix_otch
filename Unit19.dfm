object Form19: TForm19
  Left = 337
  Top = 261
  Width = 799
  Height = 533
  Caption = 'Form19'
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
    Left = 616
    Top = 8
    Width = 32
    Height = 13
    Caption = 'Label1'
    Visible = False
  end
  object DBGridEh1: TDBGridEh
    Left = 16
    Top = 24
    Width = 753
    Height = 441
    DataSource = OraDataSource1
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
    OnDblClick = DBGridEh1DblClick
  end
  object OraQuery1: TOraQuery
    Session = Form18.OraSession1
    SQL.Strings = (
      'Select tx.texkompl_id,   '
      'nvl(nordsy.summ_nar_tx(tx.texkompl_id),0) sum_nar,  '
      'nvl( nordsy.trud_tx( tx.texkompl_id),0) sum_tex,       '
      
        '(Select sum(decode(otk_end,null,0,DECODE(user_prb,null,0,trudoem' +
        ')))       '
      
        'from tx_texkompl                                                ' +
        '             '
      
        'connect by prior texkompl_id = texkompl_texkompl_ID             ' +
        '              '
      'start'#9'with  texkompl_texkompl_ID=tx.texkompl_id) prb  ,         '
      
        '(Select nomer from tx_texkompl where texkompl_id=tx.texkompl_id)' +
        ' nomer,       '
      
        '(Select name from tx_texkompl where texkompl_id=tx.texkompl_id) ' +
        'name,       '
      
        '(Select DECODE(otk_end,null,NULL,otk_end) from tx_texkompl where' +
        ' texkompl_id=tx.texkompl_id) otk_end '
      
        'from                                                            ' +
        '                                      '
      
        '(Select texkompl_id,type_tex_type_tex_id from tx_texkompl       ' +
        '                                       '
      'where texkompl_texkompl_ID=Label1.Caption)tx')
    ReadOnly = True
    Left = 728
    Top = 8
  end
  object OraDataSource1: TOraDataSource
    DataSet = OraQuery1
    Left = 696
    Top = 16
  end
end
