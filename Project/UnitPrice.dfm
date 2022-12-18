object FormPrice: TFormPrice
  Left = 797
  Top = 228
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = #1055#1088#1072#1081#1089' '#1083#1080#1089#1090
  ClientHeight = 616
  ClientWidth = 723
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 314
    Top = 4
    Width = 82
    Height = 13
    Caption = #1043#1088#1091#1087#1087#1099' '#1088#1072#1073#1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl2: TLabel
    Left = 304
    Top = 294
    Width = 102
    Height = 13
    Caption = #1055#1086#1076#1075#1088#1091#1087#1087#1072' '#1088#1072#1073#1086#1090
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgrdGWork: TDBGrid
    Left = 0
    Top = 23
    Width = 721
    Height = 234
    DataSource = FormDM.dsGroupWork
    PopupMenu = pmGW
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdGWorkKeyDown
  end
  object dbgrdWorks: TDBGrid
    Left = 0
    Top = 311
    Width = 721
    Height = 267
    DataSource = FormDM.dsWorks
    PopupMenu = pmWorks
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdWorksKeyDown
  end
  object btnSavePrice: TButton
    Left = 324
    Top = 584
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSavePriceClick
  end
  object btnCancel: TButton
    Left = 481
    Top = 582
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = btnCancelClick
  end
  object btnAddWorks: TButton
    Left = 119
    Top = 584
    Width = 113
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1091#1089#1083#1091#1075#1091
    TabOrder = 4
    OnClick = btnAddWorksClick
  end
  object btnAddGroupWork: TButton
    Left = 132
    Top = 265
    Width = 185
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1085#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090
    TabOrder = 5
    OnClick = btnAddGroupWorkClick
  end
  object btnSaveGWorks: TButton
    Left = 458
    Top = 265
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 6
    OnClick = btnSaveGWorksClick
  end
  object pmGW: TPopupMenu
    Left = 448
    Top = 104
    object mniAddGroupWork: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mniAddGroupWorkClick
    end
    object mniEditGroupWork: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mniEditGroupWorkClick
    end
    object mniDelGroupWork: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mniDelGroupWorkClick
    end
    object N2: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1075#1088#1091#1087#1087#1091' '#1088#1072#1073#1086#1090
      OnClick = N2Click
    end
  end
  object pmWorks: TPopupMenu
    Left = 600
    Top = 489
    object mniAddWorks: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mniAddWorksClick
    end
    object mniDelWork: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mniDelWorkClick
    end
    object mniEditWork: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
      OnClick = mniEditWorkClick
    end
    object N1: TMenuItem
      Caption = #1042#1086#1089#1089#1090#1072#1085#1086#1074#1080#1090#1100' '#1088#1072#1073#1086#1090#1091
      OnClick = N1Click
    end
  end
end
