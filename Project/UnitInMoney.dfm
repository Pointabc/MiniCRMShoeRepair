object frmMoney: TfrmMoney
  Left = 287
  Top = 297
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = #1055#1088#1080#1093#1086#1076
  ClientHeight = 101
  ClientWidth = 306
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
  object Label1: TLabel
    Left = 12
    Top = 22
    Width = 7
    Height = 13
    Caption = 'C'
  end
  object Label2: TLabel
    Left = 152
    Top = 22
    Width = 12
    Height = 13
    Caption = #1087#1086
  end
  object Label3: TLabel
    Left = 24
    Top = 56
    Width = 112
    Height = 13
    Caption = #1055#1088#1080#1093#1086#1076' '#1079#1072' '#1087#1077#1088#1080#1086#1076':'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object dStart: TDateTimePicker
    Left = 30
    Top = 19
    Width = 113
    Height = 21
    Date = 41521.800970682870000000
    Time = 41521.800970682870000000
    TabOrder = 0
    OnChange = dStartChange
  end
  object dEnd: TDateTimePicker
    Left = 174
    Top = 19
    Width = 105
    Height = 21
    Date = 41521.801166631940000000
    Time = 41521.801166631940000000
    TabOrder = 1
    OnChange = dEndChange
  end
  object edtSum: TEdit
    Left = 174
    Top = 54
    Width = 99
    Height = 21
    TabOrder = 2
    Text = '0'
  end
end
