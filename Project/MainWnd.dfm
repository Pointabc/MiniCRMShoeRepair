object MainForm: TMainForm
  Left = 396
  Top = 295
  Width = 1191
  Height = 590
  Caption = #1041#1086#1090#1072#1089
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = mmMainMenu
  OldCreateOrder = False
  Position = poDesktopCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  OnDeactivate = FormDeactivate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlPaneSearch: TPanel
    Left = 0
    Top = 0
    Width = 1175
    Height = 41
    Align = alTop
    TabOrder = 0
    object lblLabelToolTip: TLabel
      Left = 8
      Top = 14
      Width = 130
      Height = 13
      Caption = #1042#1099#1073#1077#1088#1080#1090#1077' '#1074#1080#1076' '#1087#1086#1080#1089#1082#1072
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtSearch: TEdit
      Left = 143
      Top = 10
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyDown = edtSearchKeyDown
    end
    object btnAddOrder: TButton
      Left = 944
      Top = 7
      Width = 105
      Height = 25
      Caption = #1047#1072#1082#1072#1079' '#1087#1086#1082#1072#1079#1072#1090#1100'...'
      TabOrder = 1
      OnClick = btnAddOrderClick
    end
    object grpTypeSearch: TGroupBox
      Left = 272
      Top = 2
      Width = 483
      Height = 35
      Caption = #1042#1080#1076' '#1087#1086#1080#1089#1082#1072
      TabOrder = 2
      object rbNoByPhone: TRadioButton
        Left = 7
        Top = 14
        Width = 92
        Height = 17
        Caption = #1087#1086' '#1090#1077#1083#1077#1092#1086#1085#1091
        Enabled = False
        TabOrder = 0
      end
      object rbNumberCustomer: TRadioButton
        Left = 104
        Top = 14
        Width = 123
        Height = 17
        Caption = #1087#1086' '#1085#1086#1084#1077#1088#1091' '#1082#1083#1080#1077#1085#1090#1072
        TabOrder = 1
      end
      object rbByDefault: TRadioButton
        Left = 380
        Top = 14
        Width = 95
        Height = 17
        Caption = #1087#1086' '#1092#1072#1084#1080#1083#1080#1080
        TabOrder = 2
      end
      object rbByNumKvitan: TRadioButton
        Left = 237
        Top = 14
        Width = 129
        Height = 17
        Caption = #1087#1086' '#1085#1086#1084#1077#1088#1091' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
        TabOrder = 3
      end
    end
    object btnSearch: TButton
      Left = 770
      Top = 8
      Width = 75
      Height = 25
      Caption = #1053#1072#1081#1090#1080
      TabOrder = 3
      OnClick = btnSearchClick
    end
    object Button1: TButton
      Left = 858
      Top = 8
      Width = 75
      Height = 25
      Caption = #1055#1088#1072#1081#1089
      TabOrder = 4
      OnClick = Button1Click
    end
    object btnAddOr: TButton
      Left = 1057
      Top = 7
      Width = 113
      Height = 25
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079'...'
      TabOrder = 5
      OnClick = btnAddOrClick
    end
  end
  object pgcPages: TPageControl
    Left = 0
    Top = 41
    Width = 1175
    Height = 472
    ActivePage = tsDolg
    Align = alClient
    HotTrack = True
    MultiLine = True
    ParentShowHint = False
    ShowHint = False
    TabOrder = 1
    object tsPage1: TTabSheet
      Caption = #1047#1072#1082#1072#1079#1099
      PopupMenu = pmAllOrders
      OnHide = tsPage1Hide
      OnShow = tsPage1Show
      object dbgrdOrders: TDBGrid
        Left = 0
        Top = 41
        Width = 1167
        Height = 403
        TabStop = False
        Align = alClient
        DataSource = FormDM.dsAllOrdersDop
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnTitleClick = dbgrdOrdersTitleClick
      end
      object Panel5: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 41
        Align = alTop
        TabOrder = 1
        object Label5: TLabel
          Left = 313
          Top = 13
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label4: TLabel
          Left = 534
          Top = 13
          Width = 15
          Height = 13
          Caption = #1044#1086
        end
        object Label10: TLabel
          Left = 16
          Top = 13
          Width = 73
          Height = 13
          Caption = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
        end
        object dtpAllOrdersSrart: TDateTimePicker
          Left = 332
          Top = 9
          Width = 186
          Height = 21
          Date = 0.481352395829162600
          Time = 0.481352395829162600
          TabOrder = 0
          OnChange = dtpAllOrdersSrartChange
        end
        object dtpAllOrdersEnd: TDateTimePicker
          Left = 566
          Top = 9
          Width = 186
          Height = 21
          Date = 0.483496215281775200
          Time = 0.483496215281775200
          TabOrder = 1
          OnChange = dtpAllOrdersEndChange
        end
        object cbOnlyTodayOrders: TCheckBox
          Left = 778
          Top = 10
          Width = 241
          Height = 17
          Caption = #1054#1090#1086#1073#1088#1072#1079#1080#1090#1100' '#1090#1086#1083#1100#1082#1086' '#1089#1077#1075#1086#1076#1085#1103#1096#1085#1080#1077' '#1079#1072#1082#1072#1079#1099
          TabOrder = 2
          OnMouseUp = cbOnlyTodayOrdersMouseUp
        end
        object cbStatusOrder: TComboBox
          Left = 104
          Top = 9
          Width = 195
          Height = 21
          ItemHeight = 13
          TabOrder = 3
          OnChange = cbStatusOrderChange
        end
      end
    end
    object tsInWork: TTabSheet
      Caption = #1042' '#1088#1072#1073#1086#1090#1077
      ImageIndex = 6
      TabVisible = False
      OnHide = tsInWorkHide
      OnShow = tsInWorkShow
      object dbgridInWork: TDBGrid
        Left = 0
        Top = 0
        Width = 1167
        Height = 444
        Align = alClient
        DataSource = FormDM.dsInWork
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tsPage2: TTabSheet
      Caption = #1042#1099#1076#1072#1085#1085#1099#1077' '#1079#1072#1082#1072#1079#1099
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      TabVisible = False
      OnHide = tsPage2Hide
      OnShow = tsPage2Show
      object dbgrdIssued: TDBGrid
        Left = 0
        Top = 41
        Width = 1167
        Height = 403
        Align = alClient
        DataSource = FormDM.dsVidannieOrders
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 41
        Align = alTop
        TabOrder = 1
        object lbl1: TLabel
          Left = 16
          Top = 13
          Width = 7
          Height = 13
          Caption = #1057
        end
        object lbl2: TLabel
          Left = 236
          Top = 13
          Width = 15
          Height = 13
          Caption = #1044#1086
        end
        object dtpStart: TDateTimePicker
          Left = 34
          Top = 9
          Width = 186
          Height = 21
          Date = 41467.540471157410000000
          Time = 41467.540471157410000000
          TabOrder = 0
          OnChange = dtpStartChange
        end
        object dtpFinish: TDateTimePicker
          Left = 268
          Top = 9
          Width = 186
          Height = 21
          Date = 41467.540888333340000000
          Time = 41467.540888333340000000
          TabOrder = 1
          OnChange = dtpFinishChange
        end
      end
    end
    object tsDolg: TTabSheet
      Caption = #1044#1086#1083#1078#1085#1080#1082#1080
      ImageIndex = 5
      OnHide = tsDolgHide
      OnShow = tsDolgShow
      object DBGridDolzhniki: TDBGrid
        Left = 0
        Top = 41
        Width = 1167
        Height = 403
        Align = alClient
        DataSource = FormDM.dsDolzhniki
        PopupMenu = pmFromDolzhniki
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 41
        Align = alTop
        TabOrder = 1
        object Label9: TLabel
          Left = 14
          Top = 12
          Width = 40
          Height = 13
          Caption = #1048#1090#1086#1075#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDolg: TEdit
          Left = 61
          Top = 10
          Width = 121
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
    end
    object tsPage3: TTabSheet
      Caption = #1043#1086#1090#1086#1074#1099#1077' '#1079#1072#1082#1072#1079#1099
      ImageIndex = 2
      TabVisible = False
      OnHide = tsPage3Hide
      OnShow = tsPage3Show
      object dbgrdReadyOrders: TDBGrid
        Left = 0
        Top = 40
        Width = 1167
        Height = 404
        Align = alClient
        DataSource = FormDM.dsReadyOrder
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 40
        Align = alTop
        TabOrder = 1
        object Label1: TLabel
          Left = 16
          Top = 11
          Width = 7
          Height = 13
          Caption = 'C'
        end
        object Label2: TLabel
          Left = 237
          Top = 11
          Width = 15
          Height = 13
          Caption = #1044#1086
        end
        object DateTimePickerStart: TDateTimePicker
          Left = 35
          Top = 8
          Width = 186
          Height = 21
          Date = 41469.524375844910000000
          Time = 41469.524375844910000000
          TabOrder = 0
          OnChange = DateTimePickerStartChange
        end
        object DateTimePickerEnd: TDateTimePicker
          Left = 268
          Top = 8
          Width = 186
          Height = 21
          Date = 41469.524606631940000000
          Time = 41469.524606631940000000
          TabOrder = 1
          OnChange = DateTimePickerEndChange
        end
      end
    end
    object tsRashod: TTabSheet
      Caption = #1042#1099#1088#1072#1073#1086#1090#1082#1072
      ImageIndex = 3
      OnHide = tsRashodHide
      OnShow = tsRashodShow
      object dbgrdVirabotka: TDBGrid
        Left = 0
        Top = 40
        Width = 1167
        Height = 404
        Align = alClient
        DataSource = FormDM.dsVirabotka
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 40
        Align = alTop
        TabOrder = 1
        object Label8: TLabel
          Left = 896
          Top = 11
          Width = 40
          Height = 13
          Caption = #1048#1090#1086#1075#1086':'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label3: TLabel
          Left = 11
          Top = 11
          Width = 53
          Height = 13
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        end
        object Label6: TLabel
          Left = 240
          Top = 11
          Width = 7
          Height = 13
          Caption = #1057
        end
        object Label7: TLabel
          Left = 395
          Top = 11
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object edtSum: TEdit
          Left = 940
          Top = 8
          Width = 121
          Height = 21
          ReadOnly = True
          TabOrder = 0
        end
        object cbWoker: TComboBox
          Left = 70
          Top = 8
          Width = 145
          Height = 21
          ItemHeight = 13
          Sorted = True
          TabOrder = 1
          OnChange = cbWokerChange
        end
        object datePickStart1: TDateTimePicker
          Left = 258
          Top = 8
          Width = 122
          Height = 21
          Date = 41511.690043587970000000
          Time = 41511.690043587970000000
          TabOrder = 2
          OnChange = datePickStart1Change
        end
        object datePickFinish1: TDateTimePicker
          Left = 418
          Top = 8
          Width = 122
          Height = 21
          Date = 41511.690260011570000000
          Time = 41511.690260011570000000
          TabOrder = 3
          OnChange = datePickFinish1Change
        end
      end
    end
    object tsPageSearch: TTabSheet
      Caption = #1055#1086#1080#1089#1082' '#1079#1072#1082#1072#1079#1072' '#1080#1083#1080' '#1082#1083#1080#1077#1085#1090#1072
      ImageIndex = 4
      OnHide = tsPageSearchHide
      OnShow = tsPageSearchShow
      object dbgrdSearch: TDBGrid
        Left = 0
        Top = 0
        Width = 1167
        Height = 444
        Align = alClient
        DataSource = FormDM.dsByNumKvit
        PopupMenu = pmInSearch
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
    end
    object tsStat: TTabSheet
      Caption = #1057#1090#1072#1090#1080#1089#1090#1080#1082#1072
      ImageIndex = 7
      OnHide = tsStatHide
      OnShow = tsStatShow
      object dbgrStat: TDBGrid
        Left = 0
        Top = 41
        Width = 1167
        Height = 403
        Align = alClient
        DataSource = FormDM.dsStatWoker
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
      end
      object PanelStat: TPanel
        Left = 0
        Top = 0
        Width = 1167
        Height = 41
        Align = alTop
        TabOrder = 1
        object Label11: TLabel
          Left = 11
          Top = 11
          Width = 53
          Height = 13
          Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082
        end
        object Label12: TLabel
          Left = 240
          Top = 11
          Width = 7
          Height = 13
          Caption = #1057
        end
        object Label13: TLabel
          Left = 395
          Top = 11
          Width = 12
          Height = 13
          Caption = #1087#1086
        end
        object cbStatWokers: TComboBox
          Left = 70
          Top = 8
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = cbStatWokersChange
        end
        object dtpStartStat: TDateTimePicker
          Left = 258
          Top = 8
          Width = 122
          Height = 21
          Date = 41740.671918344910000000
          Time = 41740.671918344910000000
          TabOrder = 1
          OnChange = dtpStartStatChange
        end
        object dtpEndStat: TDateTimePicker
          Left = 418
          Top = 8
          Width = 122
          Height = 21
          Date = 41740.672077893520000000
          Time = 41740.672077893520000000
          TabOrder = 2
          OnChange = dtpEndStatChange
        end
      end
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 513
    Width = 1175
    Height = 19
    Panels = <
      item
        Text = #1055#1088#1080#1093#1086#1076' '#1079#1072' '#1089#1077#1075#1086#1076#1085#1103
        Width = 220
      end
      item
        Text = #1042#1089#1077#1075#1086' '#1079#1072#1082#1072#1079#1086#1074': 0'
        Width = 220
      end
      item
        Text = #1047#1072#1082#1072#1079#1099
        Width = 50
      end>
  end
  object mmMainMenu: TMainMenu
    Left = 1080
    Top = 48
    object N1: TMenuItem
      Caption = #1060#1072#1081#1083
      object mConectToBD: TMenuItem
        Caption = #1055#1086#1076#1082#1083#1102#1095#1080#1090#1100#1089#1103' '#1082' '#1041#1044' ...'
        OnClick = mConectToBDClick
      end
      object N11: TMenuItem
        Caption = #1054#1073#1085#1086#1074#1080#1090#1100' '#1087#1088#1086#1075#1088#1072#1084#1084#1091'...'
        Visible = False
      end
      object N10: TMenuItem
        Caption = #1057#1076#1077#1083#1072#1090#1100' '#1088#1077#1079#1077#1088#1074#1085#1091#1102' '#1082#1086#1087#1080#1102' ...'
        Visible = False
      end
      object N6: TMenuItem
        Caption = '-'
      end
      object mClose: TMenuItem
        Caption = #1042#1099#1093#1086#1076
        OnClick = mCloseClick
      end
    end
    object N3: TMenuItem
      Caption = #1042#1080#1076
      Visible = False
      object mniCurentWork: TMenuItem
        Caption = #1058#1077#1082#1091#1097#1080#1077' '#1088#1072#1073#1086#1090#1099
      end
      object mniInWork: TMenuItem
        Caption = #1042' '#1088#1072#1073#1086#1090#1077
      end
      object mniFinishWork: TMenuItem
        Caption = #1043#1086#1090#1086#1074#1099#1077' '#1079#1072#1082#1072#1079#1099
      end
      object mniN6: TMenuItem
        Caption = #1042#1085#1091#1090#1088#1077#1085#1085#1080#1077' '#1088#1072#1089#1093#1086#1076#1099
      end
    end
    object mniAdd: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100
      object mniAddWoker: TMenuItem
        Caption = #1057#1086#1090#1088#1091#1076#1085#1080#1082#1072' ...'
        OnClick = mniAddWokerClick
      end
      object mniAddOrder: TMenuItem
        Caption = #1047#1072#1082#1072#1079' '#1087#1086#1082#1072#1079#1072#1090#1100'...'
        OnClick = mniAddOrderClick
      end
      object mniAddCustomer: TMenuItem
        Caption = #1047#1072#1082#1072#1079#1095#1080#1082#1072'...'
        OnClick = mniAddCustomerClick
      end
    end
    object N5: TMenuItem
      Caption = #1057#1087#1088#1072#1074#1086#1095#1085#1080#1082#1080
      object N7: TMenuItem
        Caption = #1064#1080#1092#1088#1099' '#1088#1072#1073#1086#1090' ...'
        OnClick = N7Click
      end
      object mniN8: TMenuItem
        Caption = '-'
      end
      object NSprItems: TMenuItem
        Caption = #1042#1080#1076#1099' '#1080#1079#1076#1077#1083#1080#1081' ...'
        OnClick = NSprItemsClick
      end
      object mniItemsColor: TMenuItem
        Caption = #1062#1074#1077#1090' '#1080#1079#1076#1077#1083#1080#1103' ...'
        OnClick = mniItemsColorClick
      end
      object mniItemsType: TMenuItem
        Caption = #1051#1077#1074#1099#1081' '#1055#1088#1072#1074#1099#1081' ...'
        OnClick = mniItemsTypeClick
      end
      object mniN9: TMenuItem
        Caption = '-'
      end
      object N2: TMenuItem
        Caption = #1055#1088#1072#1081#1089' '#1083#1080#1089#1090' ...'
        OnClick = N2Click
      end
    end
    object N8: TMenuItem
      Caption = #1055#1086#1083#1091#1095#1080#1090#1100' '#1087#1088#1080#1093#1086#1076'...'
      OnClick = N8Click
    end
    object N4: TMenuItem
      Caption = '?'
      Visible = False
    end
  end
  object dlgOpen: TOpenDialog
    Left = 696
    Top = 216
  end
  object pmInSearch: TPopupMenu
    Left = 692
    Top = 297
    object mniAddOrderSearch: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' ...'
      OnClick = mniAddOrderSearchClick
    end
    object mniEditOrderFromSearch: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079'...'
      OnClick = mniEditOrderFromSearchClick
    end
  end
  object pmAllOrders: TPopupMenu
    Left = 232
    Top = 153
    object mniEditOrder: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079'...'
      OnClick = mniEditOrderClick
    end
    object N9: TMenuItem
      Caption = #1044#1086#1073#1072#1074#1080#1090#1100' '#1079#1072#1082#1072#1079' '#1085#1072' '#1086#1089#1085#1086#1074#1077' '#1090#1077#1082#1091#1097#1077#1075#1086'...'
      OnClick = N9Click
    end
  end
  object pmFromDolzhniki: TPopupMenu
    Left = 364
    Top = 169
    object N12: TMenuItem
      Caption = #1056#1077#1076#1072#1082#1090#1080#1088#1086#1074#1072#1090#1100' '#1079#1072#1082#1072#1079'...'
      OnClick = N12Click
    end
  end
end
