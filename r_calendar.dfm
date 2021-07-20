object f_calendar: Tf_calendar
  Left = 562
  Top = 414
  BorderStyle = bsNone
  Caption = 'r_calendar'
  ClientHeight = 25
  ClientWidth = 257
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object calendar: TMonthCalendar
    Left = -16
    Top = 0
    Width = 191
    Height = 153
    Date = 43741.421074120370000000
    TabOrder = 0
  end
  object ok: TButton
    Left = 160
    Top = 0
    Width = 97
    Height = 25
    Caption = 'Ok'
    TabOrder = 1
    OnClick = okClick
  end
end
