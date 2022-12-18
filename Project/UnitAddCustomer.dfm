object frmAddCustomer: TfrmAddCustomer
  Left = 607
  Top = 293
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
  ClientHeight = 454
  ClientWidth = 625
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdCustomer: TDBGrid
    Left = 8
    Top = 37
    Width = 609
    Height = 249
    DataSource = FormDM.dsCustomer
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdCustomerKeyDown
  end
  object DBGrid2: TDBGrid
    Left = 8
    Top = 328
    Width = 481
    Height = 120
    DataSource = FormDM.dsPhoneCustomer
    ReadOnly = True
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object cbbTypePhone: TComboBox
    Left = 184
    Top = 296
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 2
  end
  object edtPhone: TEdit
    Left = 8
    Top = 297
    Width = 145
    Height = 21
    MaxLength = 11
    TabOrder = 3
  end
  object btnAddCustomer: TButton
    Left = 496
    Top = 339
    Width = 123
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    TabOrder = 4
    OnClick = btnAddCustomerClick
  end
  object Button1: TButton
    Left = 496
    Top = 371
    Width = 123
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 5
    OnClick = Button1Click
  end
  object btnClose: TButton
    Left = 496
    Top = 403
    Width = 123
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 6
    OnClick = btnCloseClick
  end
  object Button2: TButton
    Left = 368
    Top = 294
    Width = 121
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1090#1077#1083#1077#1092#1086#1085
    TabOrder = 7
    OnClick = Button2Click
  end
  object edtFIO: TEdit
    Left = 11
    Top = 9
    Width = 121
    Height = 21
    TabOrder = 8
  end
  object Button3: TButton
    Left = 150
    Top = 5
    Width = 123
    Height = 25
    Caption = #1053#1072#1081#1090#1080' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
    TabOrder = 9
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 288
    Top = 5
    Width = 105
    Height = 25
    Caption = #1055#1086#1082#1072#1079#1072#1090#1100' '#1074#1089#1077#1093
    TabOrder = 10
    OnClick = Button4Click
  end
  object btnAddOrder: TButton
    Left = 456
    Top = 5
    Width = 115
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = btnAddOrderClick
  end
end
