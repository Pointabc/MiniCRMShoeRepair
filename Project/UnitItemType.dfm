object frmItemType: TfrmItemType
  Left = 448
  Top = 225
  Width = 364
  Height = 655
  BorderIcons = [biSystemMenu]
  Caption = #1042#1080#1076' '#1080#1079#1076#1077#1083#1080#1103
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdItemType: TDBGrid
    Left = 0
    Top = 0
    Width = 348
    Height = 569
    Align = alTop
    DataSource = FormDM.dsItem
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
  end
  object btnAdd: TButton
    Left = 32
    Top = 584
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnSave: TButton
    Left = 136
    Top = 584
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnCancel: TButton
    Left = 240
    Top = 584
    Width = 75
    Height = 25
    Caption = #1054#1090#1084#1077#1085#1072
    TabOrder = 3
    OnClick = btnCancelClick
  end
end
