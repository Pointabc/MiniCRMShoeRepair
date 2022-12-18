object FormChiper: TFormChiper
  Left = 1045
  Top = 259
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082' '#1096#1080#1092#1088#1086#1074
  ClientHeight = 388
  ClientWidth = 407
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object lbl1: TLabel
    Left = 140
    Top = 5
    Width = 109
    Height = 13
    Caption = #1054#1087#1080#1089#1072#1085#1080#1077' '#1096#1080#1092#1088#1086#1074
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dbgrdChipers: TDBGrid
    Left = 0
    Top = 24
    Width = 409
    Height = 313
    Align = alCustom
    DataSource = FormDM.dsCiphers
    PopupMenu = pmChipers
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdChipersKeyDown
  end
  object btnAdd: TButton
    Left = 46
    Top = 352
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnSave: TButton
    Left = 176
    Top = 352
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 296
    Top = 352
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = btnCloseClick
  end
  object pmChipers: TPopupMenu
    Left = 264
    Top = 160
    object mniAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      OnClick = mniAddClick
    end
    object mniEdit: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100
    end
    object mniDel: TMenuItem
      Caption = #1059#1076#1072#1083#1080#1090#1100
      OnClick = mniDelClick
    end
  end
end
