object Form1: TForm1
  Left = 341
  Top = 231
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1054#1090#1095#1077#1090#1099' '#1082' Tronix v2.0.0'
  ClientHeight = 3
  ClientWidth = 984
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object OraSession1: TOraSession
    ConnectDialog = ConnectDialog1
    Left = 720
  end
  object ConnectDialog1: TConnectDialog
    Caption = 'Connect'
    UsernameLabel = 'User Name'
    PasswordLabel = 'Password'
    ServerLabel = 'Server'
    ConnectButton = 'Connect'
    CancelButton = 'Cancel'
    Left = 680
  end
  object MainMenu1: TMainMenu
    Left = 648
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
    end
    object N7: TMenuItem
      Caption = #1054#1087#1077#1088#1072#1094#1080#1080
      object N45: TMenuItem
        Caption = #1044#1072#1090#1099' '#1090#1088#1077#1073#1086#1074#1072#1085#1080#1081
        OnClick = N45Click
      end
      object N8: TMenuItem
        Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1053#1072#1088#1103#1076#1086#1074
        OnClick = N8Click
      end
      object N19: TMenuItem
        Caption = #1055#1086#1089#1090#1088#1086#1077#1095#1085#1099#1081' '#1078#1091#1088#1085#1072#1083
        OnClick = N19Click
      end
      object N41: TMenuItem
        Caption = #1050#1086#1087#1080#1088#1086#1074#1072#1085#1080#1077' '#1082#1086#1085#1090#1088#1072#1082#1090'-'#1076#1086#1075#1086#1074#1086#1088#1086#1074
        OnClick = N41Click
      end
    end
    object N40: TMenuItem
      Caption = #1053#1072#1088#1103#1076#1099
      RadioItem = True
      object N35: TMenuItem
        Caption = #1053#1072#1088#1103#1076#1099' '#1087#1086' '#1094#1077#1093#1091','#1087#1088#1086#1077#1082#1090#1091
        OnClick = N35Click
      end
      object N39: TMenuItem
        Caption = #1053#1072#1088#1103#1076#1099','#1079#1072#1082#1088#1099#1090#1099#1077' '#1079#1072' '#1087#1077#1088#1080#1086#1076' '#1087#1086' '#1094#1077#1093#1091' ('#1055#1044#1054')'
        OnClick = N39Click
      end
      object N62: TMenuItem
        Caption = 
          #1055#1072#1089#1087#1086#1088#1090' '#1087#1088#1077#1076#1087#1088#1080#1103#1090#1080#1103' - '#1060#1072#1082#1090#1080#1095#1077#1089#1082#1072#1103' '#1090#1088'-'#1090#1100' '#1087#1086' '#1094#1077#1093#1091' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1087#1088#1086#1092#1077#1089 +
          #1089#1080#1081','#1088#1072#1073#1086#1095#1080#1093' '#1071#1057#1047','#1087#1086#1076#1088#1103#1076#1095#1080#1082#1086#1074' '#1079#1072' '#1087#1077#1088#1080#1086#1076
        OnClick = N62Click
      end
      object N63: TMenuItem
        Caption = #1053#1072#1088#1103#1076#1099' '#1089' '#1087#1088#1080#1074#1103#1079#1082#1086#1081' '#1082' '#1059#1050#1056' '#1089' '#1085#1072#1095#1072#1083#1072' '#1087#1086#1089#1090#1088#1086#1081#1082#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N63Click
      end
    end
    object N2: TMenuItem
      Caption = #1054#1090#1095#1077#1090#1099
      object N3: TMenuItem
        Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080
        OnClick = N3Click
      end
      object tn1: TMenuItem
        Caption = 'tn_'#1047#1072#1103#1074#1082#1072
        OnClick = tn1Click
      end
      object N5: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1085#1072#1088#1103#1076#1072#1084
        OnClick = N5Click
      end
      object N4: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1090#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1080' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1095#1077#1088#1090#1077#1078#1077#1081
        OnClick = N4Click
      end
      object N9: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1090#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1080'  ('#1053#1086#1074#1099#1081')'
        OnClick = N9Click
      end
      object N10: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1079#1072#1103#1074#1082#1072#1084' ('#1043#1072#1085#1080#1075#1080#1085')'
        OnClick = N10Click
      end
      object N11: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1083#1072#1085#1080#1088#1091#1077#1084#1086#1081' '#1090#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1080
        OnClick = N11Click
      end
      object N12: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1102' '#1074#1077#1076#1086#1084#1086#1089#1090#1077#1081' ('#1044#1083#1103' '#1089#1082#1083#1072#1076#1072' '#1047#1048#1055')'
        OnClick = N12Click
      end
      object N14: TMenuItem
        Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1058#1053' ('#1084#1072#1090#1077#1088#1080#1072#1083' '#1080#1079#1076#1077#1083#1080#1077')'
        OnClick = N14Click
      end
      object N15: TMenuItem
        Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1084#1072#1090#1077#1088#1080#1072#1083#1086#1074' ('#1095#1077#1088#1090#1077#1078', '#1058#1050','#1082#1086#1083', '#1073#1077#1079' '#1082#1088#1077#1087#1077#1078#1072')'
        OnClick = N15Click
      end
      object N36: TMenuItem
        Caption = #1054#1089#1090#1072#1090#1082#1080' '#1090#1088#1091#1076#1086#1105#1084#1082#1086#1089#1090#1080' '#1087#1086' '#1052#1057#1063
        OnClick = N36Click
      end
      object N37: TMenuItem
        Caption = 
          #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1080#1079#1076#1077#1083#1080#1081' '#1052#1057#1063' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091' ('#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100','#1087#1086'  '#1058#1053','#1080#1079#1075#1086#1090#1086#1074#1083#1077#1085 +
          #1086')'
        OnClick = N37Click
      end
      object N38: TMenuItem
        Caption = #1054#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1077' '#1080#1079' '#1082#1086#1084#1087#1083#1077#1082#1090#1085#1086#1081' '#1087#1086#1089#1090#1072#1074#1082#1080' '#1076#1083#1103' '#1089#1082#1083#1072#1076#1072' '#1047#1048#1055' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N38Click
      end
      object N60: TMenuItem
        Caption = #1057#1055' '#1042#1077#1076#1086#1084#1086#1089#1090#1080' '#1089#1085#1072#1073#1078#1077#1085#1080#1103' '#1075#1088#1091#1087#1087#1099' 237 '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N60Click
      end
      object N61: TMenuItem
        Caption = #1055#1077#1088#1077#1095#1077#1085#1100' '#1079#1072#1082#1088#1099#1090#1086#1081' '#1086#1089#1085#1072#1089#1090#1082#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N61Click
      end
      object N64: TMenuItem
        Caption = 
          #1053#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1090#1088'-'#1090#1100' '#1087#1086' '#1094#1077#1093#1091' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1087#1088#1086#1092#1077#1089#1089#1080#1081','#1088#1072#1079#1088#1103#1076#1086#1074','#1090#1072#1088#1080#1092#1085#1099 +
          #1093' '#1089#1077#1090#1086#1082' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N64Click
      end
      object N65: TMenuItem
        Caption = 
          #1057#1091#1084#1084#1072#1088#1085#1072#1103' '#1085#1086#1088#1084#1080#1088#1086#1074#1072#1085#1085#1072#1103' '#1090#1088'-'#1090#1100' '#1087#1086' '#1094#1077#1093#1091' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1088#1072#1079#1088#1103#1076#1086#1074','#1090#1072#1088#1080#1092#1085#1099 +
          #1093' '#1089#1077#1090#1086#1082','#1087#1088#1086#1092#1077#1089#1089#1080#1081' c '#1087#1088#1080#1074#1103#1079#1082#1086#1081' '#1082' '#1059#1050#1056' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N65Click
      end
      object N66: TMenuItem
        Caption = #1053#1077#1079#1072#1082#1088#1099#1090#1099#1077' '#1055#1059#1045'('#1073#1077#1079' '#1052#1057#1063') '#1087#1086' '#1094#1077#1093#1091' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N66Click
      end
      object N20: TMenuItem
        Caption = #1058#1077#1093#1054#1090#1076#1077#1083
        RadioItem = True
        object N01: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1087#1086#1080#1089#1082#1091' '#1087#1086#1079#1080#1094#1080#1081' '#1089' '#1087#1088#1080#1086#1088#1080#1090#1077#1090#1086#1084' 0 '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
          OnClick = N01Click
        end
        object N13: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1089#1088#1072#1074#1085#1080#1074#1072#1102' '#1055#1059#1069' '#1074' '#1087#1088#1086#1077#1082#1090#1072#1093' ('#1058#1077#1093#1054#1090#1076#1077#1083')'
          OnClick = N13Click
        end
        object N34: TMenuItem
          Caption = #1042#1099#1075#1088#1091#1079#1082#1072' '#1090#1088#1072#1085#1089#1087#1086#1088#1090#1072
          OnClick = N34Click
        end
        object N21: TMenuItem
          Caption = #1042#1077#1076#1086#1084#1086#1089#1090#1100' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1087#1086' '#1087#1086#1084#1077#1097#1077#1085#1080#1103#1084
          OnClick = N21Click
        end
        object N22: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1095#1077#1088#1090#1077#1078#1077#1081' '#1085#1072' '#1089#1086#1075#1083#1072#1089#1086#1074#1072#1085#1080#1080' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
          OnClick = N22Click
        end
        object N24: TMenuItem
          Caption = #1060#1086#1088#1084#1080#1088#1086#1074#1072#1085#1080#1077' '#1074#1077#1076#1086#1084#1086#1089#1090#1080' '#1082#1086#1084#1087#1083#1077#1082#1090#1072#1094#1080#1080' '#1079#1072#1087#1091#1089#1082#1072
          OnClick = N24Click
        end
        object N25: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1085#1077#1079#1072#1087#1086#1083#1085#1077#1085#1086#1081' '#1090#1088#1091#1076#1086#1077#1084#1082#1086#1089#1090#1080' '#1074' '#1058#1053#1072
          OnClick = N25Click
        end
        object N26: TMenuItem
          Caption = #1054#1090#1095#1077#1090' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1100#1085#1086#1081' '#1074#1077#1076#1086#1084#1086#1089#1090#1080
          OnClick = N26Click
        end
        object N27: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1076#1091#1073#1083#1077#1081' '#1058#1050' '#1080' '#1055#1058#1050' '#1074' '#1087#1088#1086#1077#1082#1090#1077
          OnClick = N27Click
        end
        object N28: TMenuItem
          Caption = #1055#1088#1086#1074#1077#1088#1082#1072' '#1084#1072#1089#1089' ('#1089#1087#1077#1094#1080#1092#1080#1082#1072#1094#1080#1103' '#1080' '#1089#1087#1088#1072#1074#1086#1095#1085#1080#1082')'
          OnClick = N28Click
        end
        object N29: TMenuItem
          Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1089#1088#1072#1074#1085#1077#1085#1080#1102' '#1087#1086#1090#1088#1077#1073#1085#1086#1089#1090#1080' '#1089' '#1074#1077#1076#1086#1084#1086#1089#1090#1103#1084#1080' '#1079#1072#1082#1072#1079#1072
          OnClick = N29Click
        end
        object N30: TMenuItem
          Caption = #1054#1090#1095#1105#1090' '#1087#1086' '#1080#1079#1076#1077#1083#1080#1103#1084' '#1052#1057#1063
          OnClick = N30Click
        end
        object N31: TMenuItem
          Caption = #1052#1057#1063' ('#1056#1086#1089#1089#1099#1087#1100') '#1089' '#1089#1086#1089#1090#1072#1074#1086#1084' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
          OnClick = N31Click
        end
        object N32: TMenuItem
          Caption = #1058#1077#1093#1082#1086#1084#1087#1083#1077#1082#1090#1099' '#1074' '#1086#1073#1077#1089#1087#1077#1095#1077#1085#1080#1080' '#1084#1072#1090#1077#1088#1080#1072#1083#1072#1084#1080' '#1089' '#1087#1088#1080#1079#1085#1072#1082#1086#1084' '#1087#1086#1089#1090#1091#1087#1083#1077#1085#1080#1103
          OnClick = N32Click
        end
        object N67: TMenuItem
          Caption = 
            #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086' '#1087#1086#1082#1091#1087#1085#1099#1093' '#1080#1079#1076#1077#1083#1080#1081' '#1089' '#1087#1088#1080#1074#1103#1079#1082#1086#1081' '#1082' '#1058#1053','#1087#1086#1079#1080#1094#1080#1080' '#1057#1055' '#1087#1086' '#1087#1088#1086#1077#1082 +
            #1090#1091
          OnClick = N67Click
        end
        object N69: TMenuItem
          Caption = #1054#1090#1105#1090' '#1087#1086' '#1087#1088#1080#1074#1103#1079#1082#1077' '#1055#1059#1045' '#1082' '#1059#1044#1055' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
          OnClick = N69Click
        end
      end
    end
    object N42: TMenuItem
      Caption = #1044#1077#1092#1080#1094#1080#1090
      object N43: TMenuItem
        Caption = #1044#1077#1092#1080#1094#1080#1090' '#1087#1086' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1077' ('#1085#1086#1074#1099#1081')'
        OnClick = N43Click
      end
      object N6: TMenuItem
        Caption = #1044#1077#1092#1080#1094#1080#1090' '#1087#1086' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1077' ('#1089#1090#1072#1088#1099#1081')'
        OnClick = N6Click
      end
      object N44: TMenuItem
        Caption = #1054#1089#1085#1086#1074#1085#1072#1103' '#1085#1086#1084#1077#1085#1082#1083#1072#1090#1091#1088#1072' '#1087#1086' '#1076#1077#1092#1080#1094#1080#1090#1091
        OnClick = N44Click
      end
      object N46: TMenuItem
        Caption = #1058#1088#1077#1073#1086#1074#1072#1085#1080#1103' '#1087#1086' '#1076#1077#1092#1080#1094#1080#1090#1091
        OnClick = N46Click
      end
    end
    object N151: TMenuItem
      Caption = '15 '#1062#1045#1061
      object N16: TMenuItem
        Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072#1084' '#1074' '#1088#1072#1079#1088#1077#1079#1077' '#1095#1077#1088#1090#1077#1078#1072
        OnClick = N16Click
      end
      object N23: TMenuItem
        Caption = #1055#1086#1090#1088#1077#1073#1085#1086#1089#1090#1100' '#1087#1086' '#1084#1072#1090#1077#1088#1080#1072#1083#1072#1084' '#1080' '#1086#1073#1086#1088#1091#1076#1086#1074#1072#1085#1080#1102' '#1086#1073#1097#1072#1103' '#1087#1086' '#1087#1088#1086#1077#1082#1090#1091
        OnClick = N23Click
      end
    end
    object N17: TMenuItem
      Caption = #1052#1054#1045
      object N18: TMenuItem
        Caption = #1058#1059#1058'!!!!'
        OnClick = N18Click
      end
      object N33: TMenuItem
        Caption = #1042' '#1088#1072#1079#1088#1072#1073#1086#1090#1082#1077
        OnClick = N33Click
      end
    end
    object HELP1: TMenuItem
      Caption = 'HELP'
    end
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 488
    Top = 16
  end
end
