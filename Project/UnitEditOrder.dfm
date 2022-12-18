object FormEditOrder: TFormEditOrder
  Left = 384
  Top = 128
  Width = 875
  Height = 598
  Caption = #1047#1072#1082#1072#1079
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl14: TLabel
    Left = 14
    Top = 16
    Width = 106
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 13
    Top = 46
    Width = 57
    Height = 13
    Caption = #1060#1072#1084#1080#1083#1080#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 13
    Top = 74
    Width = 26
    Height = 13
    Caption = #1048#1084#1103
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl3: TLabel
    Left = 13
    Top = 105
    Width = 47
    Height = 13
    Caption = #1054#1090#1095#1077#1089#1090#1074#1086
  end
  object lbl11: TLabel
    Left = 13
    Top = 330
    Width = 53
    Height = 13
    Caption = #1057#1088#1086#1095#1085#1086#1089#1090#1100
  end
  object lbl12: TLabel
    Left = 13
    Top = 359
    Width = 26
    Height = 13
    Caption = #1044#1072#1090#1072
  end
  object lbl6: TLabel
    Left = 13
    Top = 392
    Width = 52
    Height = 13
    Caption = #1048#1079#1076#1077#1083#1080#1077
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl5: TLabel
    Left = 13
    Top = 420
    Width = 77
    Height = 26
    Caption = #1042#1099#1087#1086#1083#1085#1103#1102#1097#1080#1081' '#1079#1072#1082#1072#1079
    WordWrap = True
  end
  object lbllb222: TLabel
    Left = 14
    Top = 464
    Width = 71
    Height = 13
    Caption = #1055#1088#1080#1085#1103#1083' '#1079#1072#1082#1072#1079
  end
  object lbl10: TLabel
    Left = 13
    Top = 496
    Width = 107
    Height = 13
    Caption = #1042#1085#1077#1089#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl9: TLabel
    Left = 13
    Top = 526
    Width = 97
    Height = 13
    Caption = #1057#1090#1086#1080#1084#1086#1084#1090#1100' '#1088#1072#1073#1086#1090#1099
  end
  object lbl13: TLabel
    Left = 268
    Top = 54
    Width = 211
    Height = 13
    Caption = #1044#1086#1073#1072#1074#1083#1077#1085#1085#1099#1077' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1103' '#1088#1072#1073#1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl15: TLabel
    Left = 267
    Top = 16
    Width = 92
    Height = 13
    Caption = #1053#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbedtNKvit: TDBEdit
    Left = 135
    Top = 13
    Width = 121
    Height = 21
    DataField = 'NumberKvitancii'
    DataSource = FormDM.dsOrder
    TabOrder = 0
  end
  object dbedtFirstName: TDBEdit
    Left = 134
    Top = 42
    Width = 122
    Height = 21
    DataField = 'FirstName'
    DataSource = FormDM.dsCustomer
    TabOrder = 1
  end
  object dbedtName: TDBEdit
    Left = 134
    Top = 72
    Width = 122
    Height = 21
    DataField = 'Name1'
    DataSource = FormDM.dsCustomer
    TabOrder = 2
  end
  object dbedtOtchestvo: TDBEdit
    Left = 134
    Top = 102
    Width = 122
    Height = 21
    DataField = 'Otchestvo'
    DataSource = FormDM.dsCustomer
    TabOrder = 3
  end
  object grpPhoneEditOrder: TGroupBox
    Left = 7
    Top = 133
    Width = 254
    Height = 108
    Caption = #1058#1077#1083#1077#1092#1086#1085' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    TabOrder = 4
    object dbgrdPhones: TDBGrid
      Left = 7
      Top = 20
      Width = 242
      Height = 80
      DataSource = FormDM.dsCustPhones
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
    end
  end
  object dbchkSpeed: TDBCheckBox
    Left = 135
    Top = 329
    Width = 34
    Height = 17
    DataField = 'Srochnost'
    DataSource = FormDM.dsOrder
    TabOrder = 5
    ValueChecked = 'True'
    ValueUnchecked = 'False'
  end
  object dtpData: TDateTimePicker
    Left = 134
    Top = 355
    Width = 122
    Height = 21
    Date = 41378.000000000000000000
    Time = 41378.000000000000000000
    Enabled = False
    TabOrder = 6
  end
  object dblkcbbItems: TDBLookupComboBox
    Left = 134
    Top = 391
    Width = 122
    Height = 21
    DataField = 'ID_Izdelia'
    DataSource = FormDM.dsOrder
    KeyField = 'ID'
    ListField = 'NameItem'
    ListSource = FormDM.dsItem
    TabOrder = 7
  end
  object dblkcbbWoker: TDBLookupComboBox
    Left = 134
    Top = 424
    Width = 122
    Height = 21
    DataField = 'ID_Woker'
    DataSource = FormDM.dsOrder
    KeyField = 'ID'
    ListField = 'FirstName'
    ListSource = FormDM.dsWokers
    TabOrder = 8
  end
  object dblkcbbInOrderCust: TDBLookupComboBox
    Left = 135
    Top = 460
    Width = 121
    Height = 21
    DataField = 'ID_Manager'
    DataSource = FormDM.dsOrder
    KeyField = 'ID'
    ListField = 'FirstName'
    ListSource = FormDM.dsManager
    TabOrder = 9
  end
  object dbedtPayMoney: TDBEdit
    Left = 134
    Top = 492
    Width = 122
    Height = 21
    DataField = 'Sum'
    DataSource = FormDM.dsMoney
    TabOrder = 10
  end
  object edtPriceWorks: TEdit
    Left = 135
    Top = 520
    Width = 121
    Height = 21
    ReadOnly = True
    TabOrder = 11
  end
  object dbgrdAddedWorks: TDBGrid
    Left = 266
    Top = 79
    Width = 583
    Height = 154
    DataSource = FormDM.dsCurWork
    PopupMenu = pmDelWork
    ReadOnly = True
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object dbedtNumCustomer: TDBEdit
    Left = 378
    Top = 14
    Width = 145
    Height = 21
    DataField = 'NumCustomer'
    DataSource = FormDM.dsCustomer
    TabOrder = 13
  end
  object pmDelWork: TPopupMenu
    Left = 680
    Top = 153
    object mniDelWorks: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
    end
  end
end
