object FormSpravWokers: TFormSpravWokers
  Left = 633
  Top = 266
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1086#1074
  ClientHeight = 575
  ClientWidth = 549
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 7
    Top = 439
    Width = 45
    Height = 13
    Caption = #1058#1077#1083#1077#1092#1086#1085
  end
  object dbgrdSpravochnik: TDBGrid
    Left = 0
    Top = 40
    Width = 549
    Height = 385
    Align = alCustom
    DataSource = FormDM.dsWokers
    PopupMenu = pmWokerManager
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdSpravochnikKeyDown
  end
  object btnCancel: TButton
    Left = 425
    Top = 545
    Width = 121
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 2
    OnClick = btnCancelClick
  end
  object dbgrdPhones: TDBGrid
    Left = 1
    Top = 466
    Width = 417
    Height = 105
    Align = alCustom
    DataSource = FormDM.dsPhoneWokers
    PopupMenu = pmDelPhone
    ReadOnly = True
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnSaveSprav: TButton
    Left = 425
    Top = 513
    Width = 121
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 1
    OnClick = btnSaveSpravClick
  end
  object cbbTypePhone: TComboBox
    Left = 180
    Top = 437
    Width = 115
    Height = 21
    ItemHeight = 13
    TabOrder = 4
  end
  object btnAddPhone: TButton
    Left = 303
    Top = 435
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 5
    OnClick = btnAddPhoneClick
  end
  object btnAddWokers: TButton
    Left = 425
    Top = 481
    Width = 121
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1089#1086#1090#1088#1091#1076#1085#1080#1082#1072
    TabOrder = 6
    OnClick = btnAddWokersClick
  end
  object edtPhone: TEdit
    Left = 57
    Top = 437
    Width = 113
    Height = 21
    MaxLength = 11
    TabOrder = 7
    OnKeyDown = edtPhoneKeyDown
    OnKeyPress = edtPhoneKeyPress
  end
  object cbbProf: TComboBox
    Left = 10
    Top = 8
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 8
    OnCloseUp = cbbProfCloseUp
    OnKeyPress = cbbProfKeyPress
  end
  object pmDelPhone: TPopupMenu
    Left = 345
    Top = 522
    object N1: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
      OnClick = N1Click
    end
  end
  object pmWokerManager: TPopupMenu
    Left = 440
    Top = 352
  end
end
