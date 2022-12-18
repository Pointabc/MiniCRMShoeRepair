object frmItemColor: TfrmItemColor
  Left = 406
  Top = 207
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1062#1074#1077#1090#1072' '#1080#1079#1076#1077#1083#1080#1081
  ClientHeight = 583
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object dbgrdItemColor: TDBGrid
    Left = 0
    Top = 0
    Width = 362
    Height = 537
    Align = alTop
    DataSource = FormDM.dsItemColor
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    OnKeyDown = dbgrdItemColorKeyDown
  end
  object btnAdd: TButton
    Left = 35
    Top = 548
    Width = 75
    Height = 25
    Caption = #1044#1086#1073#1072#1074#1080#1090#1100
    TabOrder = 1
    OnClick = btnAddClick
  end
  object btnSave: TButton
    Left = 140
    Top = 548
    Width = 75
    Height = 25
    Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100
    TabOrder = 2
    OnClick = btnSaveClick
  end
  object btnClose: TButton
    Left = 251
    Top = 548
    Width = 75
    Height = 25
    Caption = #1047#1072#1082#1088#1099#1090#1100
    TabOrder = 3
    OnClick = btnCloseClick
  end
end
