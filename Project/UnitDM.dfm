object FormDM: TFormDM
  Left = 731
  Top = 156
  Width = 803
  Height = 811
  Caption = 'FormDM'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object conContn: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=db.md' +
      'b;Mode=Share Deny None;Jet OLEDB:System database="";Jet OLEDB:Re' +
      'gistry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engine T' +
      'ype=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Partial' +
      ' Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:New D' +
      'atabase Password="";Jet OLEDB:Create System Database=False;Jet O' +
      'LEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Compa' +
      'ct=False;Jet OLEDB:Compact Without Replica Repair=False;Jet OLED' +
      'B:SFP=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 16
    Top = 16
  end
  object dsOrder: TDataSource
    DataSet = tblOrder
    OnDataChange = dsOrderDataChange
    Left = 112
    Top = 16
  end
  object tblOrder: TADOTable
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Orders'
    Left = 176
    Top = 16
    object tblOrderID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblOrderID_Customer: TIntegerField
      FieldName = 'ID_Customer'
    end
    object tblOrderDateStart: TDateTimeField
      FieldName = 'DateStart'
    end
    object tblOrderTimeStart: TDateTimeField
      FieldName = 'TimeStart'
    end
    object tblOrderID_Manager: TIntegerField
      FieldName = 'ID_Manager'
    end
    object tblOrderID_Status: TIntegerField
      FieldName = 'ID_Status'
    end
    object tblOrderDataFinish: TDateTimeField
      FieldName = 'DataFinish'
    end
    object tblOrderTimeFinish: TDateTimeField
      FieldName = 'TimeFinish'
    end
    object tblOrderNumberKvitancii: TIntegerField
      FieldName = 'NumberKvitancii'
    end
    object tblOrderSkidka: TIntegerField
      FieldName = 'Skidka'
    end
    object tblOrderOcenkaItem: TIntegerField
      FieldName = 'OcenkaItem'
    end
    object tblOrderDelOrNot: TBooleanField
      FieldName = 'DelOrNot'
    end
    object tblOrderID_ManagerFinish: TIntegerField
      FieldName = 'ID_ManagerFinish'
    end
    object tblOrderID_ManagerGet: TIntegerField
      FieldName = 'ID_ManagerGet'
    end
    object tblOrderPrim: TWideStringField
      FieldName = 'Prim'
      Size = 255
    end
  end
  object tblCustomer: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    AfterScroll = tblCustomerAfterScroll
    TableName = 'Customer'
    Left = 184
    Top = 72
    object atncfldCustomerID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object intgrfldCustomerNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldCustomerFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldCustomerName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 20
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldCustomerOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object intgrfldCustomerID_Status: TIntegerField
      FieldName = 'ID_Status'
      Visible = False
    end
    object tblCustomercustStatus: TStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'custStatus'
      LookupDataSet = tblCustStatus
      LookupKeyFields = 'ID'
      LookupResultField = 'Name1'
      KeyFields = 'ID_Status'
      Lookup = True
    end
  end
  object dsCustomer: TDataSource
    DataSet = tblCustomer
    Left = 120
    Top = 64
  end
  object dsManager: TDataSource
    DataSet = tblManager
    Left = 120
    Top = 160
  end
  object tblManager: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    BeforePost = tblManagerBeforePost
    AfterScroll = tblManagerAfterScroll
    TableName = 'Manager'
    Left = 184
    Top = 168
    object atncfldManagerID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldManagerFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 30
    end
    object wdstrngfldManagerNames: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Names'
      Size = 30
    end
    object wdstrngfldManagerOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 30
    end
    object wdstrngfldManagerProf: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'Prof'
      Size = 255
    end
    object wdstrngfldManagerShortName: TWideStringField
      FieldName = 'ShortName'
      Visible = False
      Size = 255
    end
  end
  object dsPhones: TDataSource
    DataSet = tblPhones
    Left = 120
    Top = 216
  end
  object tblPhones: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    IndexFieldNames = 'ID_Woker'
    TableName = 'Phones'
    Left = 192
    Top = 216
    object strngfldPhonesPhoneType: TStringField
      DisplayLabel = #1089#1086#1090'/'#1086#1073#1099#1095#1085#1099#1081
      FieldKind = fkLookup
      FieldName = 'PhoneType'
      LookupDataSet = tblPhoneType
      LookupKeyFields = 'ID'
      LookupResultField = 'TypePhone'
      KeyFields = 'ID_TypePhone'
      Lookup = True
    end
    object atncfldPhonesID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object intgrfldPhonesID_TypePhone: TIntegerField
      DisplayLabel = #1089#1086#1090'/'#1086#1073#1099#1095#1085#1099#1081
      DisplayWidth = 19
      FieldName = 'ID_TypePhone'
      Visible = False
    end
    object intgrfldPhonesID_Woker: TIntegerField
      FieldName = 'ID_Woker'
      Visible = False
    end
    object intgrfldPhonesID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object intgrfldPhonesID_Manager: TIntegerField
      FieldName = 'ID_Manager'
      Visible = False
    end
    object wdstrngfldPhonesPrim: TWideStringField
      FieldName = 'Prim'
      Visible = False
      Size = 255
    end
    object tblPhonesPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 11
      FieldName = 'Phone'
      Size = 255
    end
  end
  object tblWokers: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    BeforePost = tblWokersBeforePost
    AfterScroll = tblWokersAfterScroll
    TableName = 'Woker'
    Left = 200
    Top = 320
    object atncfldWokersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldWokersFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      FieldName = 'FirstName'
    end
    object wdstrngfldWokersName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Name1'
    end
    object wdstrngfldWokersOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      FieldName = 'Otchestvo'
    end
    object wdstrngfldWokersProf: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1077#1085#1080#1077
      DisplayWidth = 25
      FieldName = 'Prof'
      Size = 255
    end
    object wdstrngfldWokersShortName: TWideStringField
      FieldName = 'ShortName'
      Visible = False
      Size = 255
    end
  end
  object dsWokers: TDataSource
    DataSet = tblWokers
    Left = 120
    Top = 320
  end
  object tblPhoneType: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'TypePhone'
    Left = 360
    Top = 16
  end
  object dsPhoneType: TDataSource
    DataSet = tblPhoneType
    Left = 272
    Top = 16
  end
  object tblGroupWork: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    AfterPost = tblGroupWorkAfterPost
    IndexFieldNames = 'Name1'
    TableName = 'GroupeWork'
    Left = 360
    Top = 80
    object atncfldGroupWorkID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldGroupWorkName1: TWideStringField
      DisplayLabel = #1042#1080#1076' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 97
      FieldName = 'Name1'
      Size = 50
    end
    object tblGroupWorkDelOrNot: TBooleanField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'DelOrNot'
      DisplayValues = #1059#1076#1072#1083#1077#1085#1072';'#1040#1082#1090#1080#1074#1085#1072
    end
  end
  object dsGroupWork: TDataSource
    DataSet = tblGroupWork
    Left = 296
    Top = 96
  end
  object tblItem: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Items'
    Left = 664
    Top = 32
    object atncfldItemID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldItemNameItem: TWideStringField
      DisplayLabel = #1048#1079#1076#1077#1083#1080#1077
      DisplayWidth = 40
      FieldName = 'NameItem'
      Size = 255
    end
    object tblItemDelOrNot: TBooleanField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1086
      FieldName = 'DelOrNot'
      DisplayValues = #1076#1072';'#1085#1077#1090
    end
  end
  object dsItem: TDataSource
    DataSet = tblItem
    Left = 608
    Top = 32
  end
  object dsWorks: TDataSource
    DataSet = tblWorks
    Left = 304
    Top = 160
  end
  object tblWorks: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    AfterPost = tblWorksAfterPost
    IndexFieldNames = 'ID_GroupWork'
    MasterFields = 'ID'
    MasterSource = dsGroupWork
    TableName = 'Works'
    Left = 368
    Top = 160
    object atncfldWorksID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldWorksNameWork: TWideStringField
      DisplayLabel = #1056#1072#1073#1086#1090#1072
      DisplayWidth = 50
      FieldName = 'NameWork'
      Size = 50
    end
    object intgrfldWorksPerionGaranty: TIntegerField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103'/'#1076#1085
      DisplayWidth = 10
      FieldName = 'PerionGaranty'
    end
    object bcdfldWorksPrice: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 12
      FieldName = 'Price'
      Precision = 19
    end
    object intgrfldWorksID_Quantity: TIntegerField
      FieldName = 'ID_Quantity'
      Visible = False
    end
    object intgrfldWorksID_Chiper: TIntegerField
      FieldName = 'ID_Chiper'
      Visible = False
    end
    object intgrfldWorksID_GroupWork: TIntegerField
      FieldName = 'ID_GroupWork'
      Visible = False
    end
    object strngfldWorksKolvo: TStringField
      DisplayLabel = #1050#1086#1083#1080#1095#1077#1089#1090#1074#1086
      DisplayWidth = 10
      FieldKind = fkLookup
      FieldName = 'Kolvo'
      LookupDataSet = tblTypeQuantity
      LookupKeyFields = 'ID'
      LookupResultField = 'NameQ'
      KeyFields = 'ID_Quantity'
      Lookup = True
    end
    object strngfldWorksChip: TStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 13
      FieldKind = fkLookup
      FieldName = 'Chip'
      LookupDataSet = tblCiphers
      LookupKeyFields = 'ID'
      LookupResultField = 'Name1'
      KeyFields = 'ID_Chiper'
      Lookup = True
    end
    object tblWorksDelOrNot: TBooleanField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      FieldName = 'DelOrNot'
      ReadOnly = True
      DisplayValues = #1059#1076#1072#1083#1077#1085#1072';'#1040#1082#1090#1080#1074#1085#1072
    end
  end
  object qrySubWorks: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'subworks'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Works.NameWork, Works.PerionGaranty, Works.Price '
      
        'FROM Works INNER JOIN GroupeWork ON Works.ID_GroupWork = GroupeW' +
        'ork.ID '
      
        'WHERE (([GroupeWork]![ID]=:subworks)AND([Works]![DelOrNot]<>True' +
        '));')
    Left = 360
    Top = 344
    object wdstrngfldSubWorksNameWork: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 60
      FieldName = 'NameWork'
      Size = 25
    end
    object intgrfldSubWorksPerionGaranty: TIntegerField
      DisplayLabel = #1043#1072#1088#1072#1085'./'#1076#1085
      DisplayWidth = 7
      FieldName = 'PerionGaranty'
    end
    object bcdfldSubWorksPrice: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 8
      FieldName = 'Price'
      Precision = 15
    end
  end
  object dsSubWorks: TDataSource
    DataSet = qrySubWorks
    Left = 288
    Top = 344
  end
  object qryTest: TADOQuery
    Connection = conContn
    Parameters = <
      item
        Name = 'FirstName'
        DataType = ftString
        Size = 12
        Value = #1057#1082#1086#1088#1086#1075#1086#1074#1086#1088#1086#1074
      end
      item
        Name = 'Name1'
        DataType = ftString
        Size = 4
        Value = #1048#1083#1100#1103
      end
      item
        Name = 'Otchestvo'
        DataType = ftString
        Size = 11
        Value = #1055#1088#1086#1082#1086#1092#1100#1077#1074#1080#1095
      end>
    Left = 360
    Top = 400
  end
  object dsTest: TDataSource
    DataSet = qryTest
    Left = 296
    Top = 408
  end
  object tblCrtOrders: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'CrtOrders'
    Left = 216
    Top = 576
    object atncfldCrtOrdersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object intgrfldCrtOrdersID_Work: TIntegerField
      FieldName = 'ID_Work'
      Visible = False
    end
    object intgrfldCrtOrdersID_Order: TIntegerField
      FieldName = 'ID_Order'
      Visible = False
    end
    object strngfldCrtOrdersWork: TStringField
      FieldKind = fkLookup
      FieldName = 'Work'
      LookupDataSet = tblWorks
      LookupKeyFields = 'ID'
      LookupResultField = 'NameWork'
      KeyFields = 'ID_Work'
      Lookup = True
    end
    object intgrfldCrtOrdersGaranty: TIntegerField
      FieldKind = fkLookup
      FieldName = 'Garanty'
      LookupDataSet = tblWorks
      LookupKeyFields = 'ID'
      LookupResultField = 'PerionGaranty'
      KeyFields = 'ID_Work'
      Lookup = True
    end
    object intgrfldCrtOrdersID_Woker: TIntegerField
      FieldName = 'ID_Woker'
    end
  end
  object dsCrtOrders: TDataSource
    DataSet = tblCrtOrders
    Left = 120
    Top = 568
  end
  object qryCustPhones: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = '80'
      end>
    SQL.Strings = (
      'SELECT Phones.Phone, TypePhone.TypePhone'
      
        'FROM (Phones INNER JOIN Customer ON Phones.ID_Customer = Custome' +
        'r.ID) INNER JOIN TypePhone ON Phones.ID_TypePhone = TypePhone.ID'
      'WHERE (((Customer.ID)=:ID)AND( Phones.Phone <> NULL));')
    Left = 200
    Top = 272
    object wdstrngfldCustPhonesTypePhone: TWideStringField
      DisplayLabel = #1057#1086#1090'/'#1044#1086#1084'/'#1056#1072#1073#1086#1095#1080#1081
      DisplayWidth = 15
      FieldName = 'TypePhone'
      Size = 255
    end
    object qryCustPhonesPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 11
      FieldName = 'Phone'
      Size = 255
    end
  end
  object dsCustPhones: TDataSource
    DataSet = qryCustPhones
    Left = 120
    Top = 272
  end
  object qryCurWorks: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDOrder'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT GroupeWork.Name1, Works.NameWork, Works.PerionGaranty, Wo' +
        'rks.Price, Ciphers.Name1, Woker.ShortName, CrtOrders.ID_Woker, C' +
        'rtOrders.ID, Works.ID, TypeQuantity.NameQ'
      
        'FROM TypeQuantity RIGHT JOIN ((((Works INNER JOIN GroupeWork ON ' +
        'Works.ID_GroupWork = GroupeWork.ID) INNER JOIN CrtOrders ON Work' +
        's.ID = CrtOrders.ID_Work) LEFT JOIN Ciphers ON Works.ID_Chiper =' +
        ' Ciphers.ID) INNER JOIN Woker ON CrtOrders.ID_Woker = Woker.ID) ' +
        'ON TypeQuantity.ID = Works.ID_Quantity'
      'WHERE (((CrtOrders.ID_Order)=:IDOrder));')
    Left = 680
    Top = 280
    object wdstrngfldCurWorksGroupeWorkName1: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072
      DisplayWidth = 18
      FieldName = 'GroupeWork.Name1'
      Size = 50
    end
    object wdstrngfldCurWorksNameWork: TWideStringField
      DisplayLabel = #1056#1072#1073#1086#1090#1072
      DisplayWidth = 30
      FieldName = 'NameWork'
      Size = 255
    end
    object intgrfldCurWorksPerionGaranty: TIntegerField
      DisplayLabel = #1043#1072#1088#1072#1085#1090#1080#1103
      FieldName = 'PerionGaranty'
    end
    object bcdfldCurWorksPrice: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'Price'
      Precision = 19
    end
    object wdstrngfldCurWorksCiphersName1: TWideStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 10
      FieldName = 'Ciphers.Name1'
      Size = 255
    end
    object wdstrngfldCurWorksShortName: TWideStringField
      DisplayWidth = 15
      FieldName = 'ShortName'
      Visible = False
      Size = 255
    end
    object intgrfldCurWorksID_Woker: TIntegerField
      FieldName = 'ID_Woker'
      Visible = False
    end
    object strngfldCurWorksCurWoker: TStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
      FieldKind = fkLookup
      FieldName = 'CurWoker'
      LookupDataSet = tblDopWokers
      LookupKeyFields = 'ID'
      LookupResultField = 'ShortName'
      KeyFields = 'ID_Woker'
      OnChange = strngfldCurWorksCurWokerChange
      Lookup = True
    end
    object atncfldCurWorksCrtOrdersID: TAutoIncField
      FieldName = 'CrtOrders.ID'
      ReadOnly = True
      Visible = False
    end
    object atncfldCurWorksWorksID: TAutoIncField
      FieldName = 'Works.ID'
      ReadOnly = True
      Visible = False
    end
    object qryCurWorksNameQ: TWideStringField
      DisplayLabel = #1087#1072#1088#1072'/'#1096#1090
      DisplayWidth = 7
      FieldName = 'NameQ'
      Size = 255
    end
  end
  object dsCurWork: TDataSource
    DataSet = qryCurWorks
    OnDataChange = dsCurWorkDataChange
    Left = 616
    Top = 288
  end
  object tblTypeQuantity: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'TypeQuantity'
    Left = 216
    Top = 680
  end
  object dsTypeQuantity: TDataSource
    DataSet = tblTypeQuantity
    Left = 120
    Top = 680
  end
  object tblCiphers: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Ciphers'
    Left = 216
    Top = 624
    object atncfldCiphersID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldCiphersName1: TWideStringField
      DisplayLabel = #1064#1080#1092#1088
      DisplayWidth = 12
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldCiphersPrim: TWideStringField
      DisplayLabel = #1055#1088#1080#1084#1077#1095#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'Prim'
      Size = 255
    end
    object tblCiphersDelOrNot: TBooleanField
      FieldName = 'DelOrNot'
      Visible = False
    end
  end
  object dsCiphers: TDataSource
    DataSet = tblCiphers
    Left = 120
    Top = 624
  end
  object qryByNumKvit: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NumKvit'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.ID, Orders.NumberKvitancii, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Orders.D' +
        'ateStart, Orders.ID, Orders.DataFinish, Status.NameStatus'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      'WHERE (((Orders.NumberKvitancii)=:NumKvit));')
    Left = 672
    Top = 440
    object intgrfldByNumKvitNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object intgrfldByNumKvitNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldByNumKvitFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 30
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldByNumKvitName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldByNumKvitOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object dtmfldByNumKvitDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object dtmfldByNumKvitDataFinish: TDateTimeField
      FieldName = 'DataFinish'
    end
    object qryByNumKvitID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qryByNumKvitNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 15
      FieldName = 'NameStatus'
      Size = 255
    end
  end
  object dsByNumKvit: TDataSource
    DataSet = qryByNumKvit
    Left = 600
    Top = 440
  end
  object dsByFIO: TDataSource
    DataSet = qryByFIO
    Left = 608
    Top = 384
  end
  object qryByFIO: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'FirstName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.ID, Orders.NumberKvitancii, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Orders.D' +
        'ateStart, Orders.DataFinish, Orders.ID_Customer, Status.NameStat' +
        'us'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      'WHERE (((Customer.FirstName)=:FirstName));')
    Left = 664
    Top = 384
    object intgrfldByFIONumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object intgrfldByFIONumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldByFIOFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 30
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldByFIOName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldByFIOOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object dtmfldByFIODateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object dtmfldByFIODataFinish: TDateTimeField
      FieldName = 'DataFinish'
    end
    object qryByFIOID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object qryByFIONameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 15
      FieldName = 'NameStatus'
      Size = 255
    end
    object atncfldByFIOID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
  end
  object tblWorksDop: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Works'
    Left = 376
    Top = 224
    object tblWorksDopID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object tblWorksDopNameWork: TWideStringField
      FieldName = 'NameWork'
      Size = 255
    end
    object tblWorksDopPerionGaranty: TIntegerField
      FieldName = 'PerionGaranty'
    end
    object tblWorksDopID_Quantity: TIntegerField
      FieldName = 'ID_Quantity'
    end
    object tblWorksDopID_Chiper: TIntegerField
      FieldName = 'ID_Chiper'
    end
    object tblWorksDopID_GroupWork: TIntegerField
      FieldName = 'ID_GroupWork'
    end
    object tblWorksDopPrice: TBCDField
      FieldName = 'Price'
      Precision = 19
    end
    object tblWorksDopDelOrNot: TBooleanField
      FieldName = 'DelOrNot'
    end
  end
  object dsWorksDop: TDataSource
    DataSet = tblWorksDop
    Left = 304
    Top = 224
  end
  object qryPhoneWokers: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_Woker'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Phones.Phone, TypePhone.TypePhone'
      
        'FROM TypePhone INNER JOIN (Woker INNER JOIN Phones ON Woker.ID =' +
        ' Phones.ID_Woker) ON TypePhone.ID = Phones.ID_TypePhone'
      'WHERE (((Phones.ID_Woker)=:ID_Woker));')
    Left = 208
    Top = 384
    object wdstrngfldPhoneWokersTypePhone: TWideStringField
      DisplayLabel = #1044#1086#1084'/'#1089#1086#1090'/'#1088
      DisplayWidth = 20
      FieldName = 'TypePhone'
      Size = 255
    end
    object qryPhoneWokersPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 11
      FieldName = 'Phone'
      Size = 255
    end
  end
  object dsPhoneWokers: TDataSource
    DataSet = qryPhoneWokers
    Left = 120
    Top = 384
  end
  object tblMoney: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'InMoney'
    Left = 512
    Top = 704
    object atncfldMoneyID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object dtmfldMoneyData1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 12
      FieldName = 'Data1'
    end
    object bcdfldMoneySum: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      FieldName = 'Sum'
      Precision = 19
    end
    object intgrfldMoneyID_Order: TIntegerField
      FieldName = 'ID_Order'
      Visible = False
    end
  end
  object dsMoney: TDataSource
    DataSet = tblMoney
    Left = 456
    Top = 704
  end
  object qrySum: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDOrder'
        DataType = ftFloat
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Sum(InMoney.Sum) AS [Sum-Sum]'
      'FROM InMoney'
      'GROUP BY InMoney.ID_Order'
      'HAVING (((InMoney.ID_Order)=:IDOrder));')
    Left = 672
    Top = 704
  end
  object dsSum: TDataSource
    DataSet = qrySum
    Left = 632
    Top = 704
  end
  object qryPhoneManager: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDManager'
        Attributes = [paNullable]
        DataType = ftLargeint
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Phones.Phone, TypePhone.TypePhone'
      
        'FROM Manager INNER JOIN (Phones INNER JOIN TypePhone ON Phones.I' +
        'D_TypePhone = TypePhone.ID) ON Manager.ID = Phones.ID_Manager'
      'WHERE (((Manager.ID)=:IDManager));')
    Left = 216
    Top = 432
    object wdstrngfldPhoneManagerTypePhone: TWideStringField
      DisplayLabel = #1044#1086#1084'/'#1089#1086#1090'/'#1088
      DisplayWidth = 20
      FieldName = 'TypePhone'
      Size = 255
    end
    object qryPhoneManagerPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 11
      FieldName = 'Phone'
      Size = 255
    end
  end
  object dsPhoneManager: TDataSource
    DataSet = qryPhoneManager
    Left = 120
    Top = 440
  end
  object qryByNumCust: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'NumCust'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Orders.ID, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Orders.D' +
        'ateStart, Orders.DataFinish, Orders.ID_Customer, Status.NameStat' +
        'us'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      'WHERE (((Customer.NumCustomer)=:NumCust));')
    Left = 672
    Top = 504
    object intgrfldByNumCustNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object intgrfldByNumCustNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1083#1080#1077#1085#1090#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldByNumCustFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 30
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldByNumCustName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldByNumCustOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object dtmfldByNumCustDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object dtmfldByNumCustDataFinish: TDateTimeField
      FieldName = 'DataFinish'
    end
    object intgrfldByNumCustID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object atncfldByNumCustID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
    end
    object qryByNumCustNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 15
      FieldName = 'NameStatus'
      Size = 255
    end
  end
  object dsByNumCust: TDataSource
    DataSet = qryByNumCust
    Left = 600
    Top = 504
  end
  object tblItemColor: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'ColorItem'
    Left = 672
    Top = 144
    object atncfldItemColorID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object wdstrngfldItemColorName1: TWideStringField
      DisplayLabel = #1062#1074#1077#1090
      DisplayWidth = 50
      FieldName = 'Name1'
      Size = 255
    end
    object tblItemColorDelOrNot: TBooleanField
      FieldName = 'DelOrNot'
      Visible = False
    end
  end
  object dsItemColor: TDataSource
    DataSet = tblItemColor
    Left = 608
    Top = 144
  end
  object dsItemCurrent: TDataSource
    DataSet = tblItemCurrent
    OnDataChange = dsItemCurrentDataChange
    OnUpdateData = dsItemCurrentUpdateData
    Left = 608
    Top = 88
  end
  object tblItemCurrent: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'ItemCurrent'
    Left = 680
    Top = 88
  end
  object tblMZD: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'ItemType'
    Left = 672
    Top = 208
  end
  object dsMZD: TDataSource
    DataSet = tblMZD
    Left = 616
    Top = 208
  end
  object tblStatusOrder: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Status'
    Left = 520
    Top = 536
  end
  object dsStutusOrder: TDataSource
    DataSet = tblStatusOrder
    Left = 440
    Top = 536
  end
  object qryInsMoney: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'IDOrder'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT InMoney.Data1, InMoney.Sum'
      'FROM InMoney'
      
        'WHERE (((InMoney.Sum) Is Not Null) AND ((InMoney.ID_Order)=:IDOr' +
        'der) AND (InMoney.Sum) <> 0);')
    Left = 512
    Top = 648
    object dtmfldInsMoneyData1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072
      DisplayWidth = 15
      FieldName = 'Data1'
    end
    object bcdfldInsMoneySum: TBCDField
      DisplayLabel = #1057#1091#1084#1084#1072
      DisplayWidth = 15
      FieldName = 'Sum'
      Precision = 19
    end
  end
  object dsInsMoney: TDataSource
    DataSet = qryInsMoney
    Left = 448
    Top = 648
  end
  object dsLR: TDataSource
    DataSet = tblLR
    Left = 480
    Top = 320
  end
  object tblLR: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'ItemLeftRight'
    Left = 536
    Top = 320
    object tblLRID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object tblLRName1: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077
      DisplayWidth = 45
      FieldName = 'Name1'
      Size = 255
    end
    object tblLRDelOrNot: TBooleanField
      DisplayLabel = #1059#1076#1072#1083#1077#1085#1086
      FieldName = 'DelOrNot'
      Visible = False
      DisplayValues = #1076#1072';'#1085#1077#1090
    end
  end
  object tblDopWokers: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'Woker'
    Left = 544
    Top = 240
  end
  object dsDopWokers: TDataSource
    DataSet = tblDopWokers
    Left = 456
    Top = 248
  end
  object tblWorksInOrder: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'WorkerInOrder'
    Left = 528
    Top = 400
  end
  object dsWorksInOrder: TDataSource
    DataSet = tblWorksInOrder
    Left = 464
    Top = 416
  end
  object qryReadyOrder: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StartData'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'EndData'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Customer.NumCustomer, Customer.Fi' +
        'rstName, Customer.Name1, Customer.Otchestvo, Orders.DateStart, O' +
        'rders.DataFinish, Orders.ID_Customer, Status.NameStatus'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      
        'WHERE ((((Orders.DateStart)>=:StartData) And ((Orders.DateStart)' +
        '<=:EndData)) AND ((Status.NameStatus)='#39#1043#1086#1090#1086#1074#39'));')
    Left = 528
    Top = 8
    object intgrfldReadyOrderNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1095#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object intgrfldReadyOrderNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldReadyOrderFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 25
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldReadyOrderName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldReadyOrderOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 10
      FieldName = 'Otchestvo'
      Size = 255
    end
    object dtmfldReadyOrderDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object qryReadyOrderDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'DataFinish'
    end
    object intgrfldReadyOrderID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object wdstrngfldReadyOrderNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
  end
  object dsReadyOrder: TDataSource
    DataSet = qryReadyOrder
    Left = 456
    Top = 8
  end
  object qryVidannieOrders: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'StartData'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'EndData'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Customer.NumCustomer, Customer.Fi' +
        'rstName, Customer.Name1, Customer.Otchestvo, Orders.DateStart, O' +
        'rders.DataFinish, Orders.ID_Customer, Status.NameStatus'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      
        'WHERE ((((Orders.DateStart)>=:StartData) AND ((Orders.DateStart)' +
        '<=:EndData)) AND ((Status.NameStatus)='#39#1042#1099#1076#1072#1085#1086#39'));')
    Left = 536
    Top = 64
    object intgrfldVidannieOrdersNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object intgrfldVidannieOrdersNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      FieldName = 'NumCustomer'
    end
    object wdstrngfldVidannieOrdersFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object wdstrngfldVidannieOrdersName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'Name1'
      Size = 255
    end
    object wdstrngfldVidannieOrdersOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 10
      FieldName = 'Otchestvo'
      Size = 255
    end
    object dtmfldVidannieOrdersDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object qryVidannieOrdersDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
      FieldName = 'DataFinish'
    end
    object intgrfldVidannieOrdersID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object wdstrngfldVidannieOrdersNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
  end
  object dsVidannieOrders: TDataSource
    DataSet = qryVidannieOrders
    Left = 456
    Top = 56
  end
  object qryDolzhniki: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Filter = 'Value < 0'
    Filtered = True
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Customer.NumCustomer, Customer.Fi' +
        'rstName, Customer.Name1, Customer.Otchestvo, Orders.DateStart, S' +
        'tatus.NameStatus, Orders.ID, Sum(Switch([Skidka]<>0,[Price]-[Ski' +
        'dka]*[Price]/100,[Skidka]=0,[Price])) AS Cost, qrySumOrder.[Sum-' +
        'Sum] AS Inserted, Orders.Skidka, ([Inserted]-[Cost]) AS [Value]'
      
        'FROM qrySumOrder INNER JOIN (Works INNER JOIN (CrtOrders INNER J' +
        'OIN (Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status) ON CrtO' +
        'rders.ID_Order = Orders.ID) ON Works.ID = CrtOrders.ID_Work) ON ' +
        'qrySumOrder.ID_Order = Orders.ID'
      
        'GROUP BY Orders.NumberKvitancii, Customer.NumCustomer, Customer.' +
        'FirstName, Customer.Name1, Customer.Otchestvo, Orders.DateStart,' +
        ' Status.NameStatus, Orders.ID, qrySumOrder.[Sum-Sum], Orders.Ski' +
        'dka'
      'HAVING (((Status.NameStatus)<>'#39#1042#1099#1076#1072#1085#1086#39'));')
    Left = 536
    Top = 112
    object qryDolzhnikiNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      FieldName = 'NumberKvitancii'
    end
    object qryDolzhnikiNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      FieldName = 'NumCustomer'
    end
    object qryDolzhnikiFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object qryDolzhnikiName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'Name1'
      Size = 255
    end
    object qryDolzhnikiOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 15
      FieldName = 'Otchestvo'
      Size = 255
    end
    object qryDolzhnikiDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object qryDolzhnikiNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object qryDolzhnikiID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qryDolzhnikiCost: TBCDField
      DisplayLabel = #1057#1090#1086#1080#1084#1086#1089#1090#1100' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'Cost'
      Precision = 19
    end
    object qryDolzhnikiInserted: TBCDField
      DisplayLabel = #1042#1085#1077#1089#1077#1085#1085#1072#1103' '#1089#1091#1084#1084#1072
      DisplayWidth = 10
      FieldName = 'Inserted'
      Precision = 19
    end
    object qryDolzhnikiSkidka: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 5
      FieldName = 'Skidka'
    end
    object qryDolzhnikiValue: TBCDField
      DisplayLabel = #1053#1091#1078#1085#1086' '#1076#1086#1087#1083#1072#1090#1080#1090#1100
      DisplayWidth = 10
      FieldName = 'Value'
      ReadOnly = True
      Precision = 19
    end
  end
  object dsDolzhniki: TDataSource
    DataSet = qryDolzhniki
    Left = 456
    Top = 120
  end
  object qryInWork: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Customer.NumCustomer, Customer.Fi' +
        'rstName, Customer.Name1, Customer.Otchestvo, Orders.DateStart, O' +
        'rders.DataFinish, Orders.ID_Customer, Status.NameStatus'
      
        'FROM Status INNER JOIN (Orders INNER JOIN Customer ON Orders.ID_' +
        'Customer = Customer.ID) ON Status.ID = Orders.ID_Status'
      'WHERE ( (Status.NameStatus='#39#1042' '#1088#1072#1073#1086#1090#1077#39') );')
    Left = 536
    Top = 184
    object qryInWorkNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090#1072#1085#1094#1080#1080
      DisplayWidth = 10
      FieldName = 'NumberKvitancii'
    end
    object qryInWorkNumCustomer: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1079#1072#1082#1072#1079#1095#1080#1082#1072
      DisplayWidth = 10
      FieldName = 'NumCustomer'
    end
    object qryInWorkFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object qryInWorkName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 10
      FieldName = 'Name1'
      Size = 255
    end
    object qryInWorkOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 10
      FieldName = 'Otchestvo'
      Size = 255
    end
    object qryInWorkDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
    end
    object qryInWorkDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074#1077#1088#1096#1077#1085#1080#1103
      FieldName = 'DataFinish'
    end
    object qryInWorkID_Customer: TIntegerField
      FieldName = 'ID_Customer'
      Visible = False
    end
    object qryInWorkNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
  end
  object dsInWork: TDataSource
    DataSet = qryInWork
    Left = 472
    Top = 184
  end
  object qryVirabotka: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'DataStart1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'DataFinish1'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'ShortName'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Woker.FirstName, Woker.Name1, Woker.Otchestvo, Works.Name' +
        'Work, Works.Price, Orders.DataFinish, Status.NameStatus, Orders.' +
        'Skidka, [Works]![Price]-([Orders]![Skidka]*[Works]![Price]/100) ' +
        'AS Virabotka'
      
        'FROM Status INNER JOIN (((Woker INNER JOIN CrtOrders ON Woker.ID' +
        ' = CrtOrders.ID_Woker) INNER JOIN Orders ON CrtOrders.ID_Order =' +
        ' Orders.ID) INNER JOIN Works ON CrtOrders.ID_Work = Works.ID) ON' +
        ' Status.ID = Orders.ID_Status'
      
        'WHERE (((Orders.DataFinish)>=:DataStart1 And (Orders.DataFinish)' +
        '<=:DataFinish1) AND ((Orders.ID_Status)=3 Or (Orders.ID_Status)=' +
        '4) AND ((Woker.ShortName)=:ShortName));')
    Left = 368
    Top = 520
    object qryVirabotkaFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object qryVirabotkaName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Name1'
      Size = 255
    end
    object qryVirabotkaOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object qryVirabotkaNameWork: TWideStringField
      DisplayLabel = #1056#1072#1073#1086#1090#1072
      DisplayWidth = 50
      FieldName = 'NameWork'
      Size = 255
    end
    object qryVirabotkaPrice: TBCDField
      DisplayLabel = #1062#1077#1085#1072
      DisplayWidth = 10
      FieldName = 'Price'
      Precision = 19
    end
    object qryVirabotkaDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      FieldName = 'DataFinish'
    end
    object qryVirabotkaNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object qryVirabotkaSkidka: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 5
      FieldName = 'Skidka'
    end
    object qryVirabotkaVirabotka: TBCDField
      DisplayLabel = #1042#1099#1088#1072#1073#1086#1090#1082#1072
      DisplayWidth = 10
      FieldName = 'Virabotka'
      ReadOnly = True
      Precision = 19
    end
  end
  object dsVirabotka: TDataSource
    DataSet = qryVirabotka
    Left = 304
    Top = 528
  end
  object dsPhoneCustomer: TDataSource
    DataSet = qryPhoneCustomer
    Left = 128
    Top = 504
  end
  object qryPhoneCustomer: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'ID_Customer'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Phones.Phone, TypePhone.TypePhone'
      
        'FROM (Phones INNER JOIN Customer ON Phones.ID_Customer = Custome' +
        'r.ID) INNER JOIN TypePhone ON Phones.ID_TypePhone = TypePhone.ID'
      'WHERE (((Customer.ID)=:ID_Customer));')
    Left = 232
    Top = 496
    object qryPhoneCustomerTypePhone: TWideStringField
      DisplayLabel = #1044#1086#1084'/'#1089#1086#1090'/'#1088
      DisplayWidth = 20
      FieldName = 'TypePhone'
      Size = 255
    end
    object qryPhoneCustomerPhone: TWideStringField
      DisplayLabel = #1058#1077#1083#1077#1092#1086#1085
      DisplayWidth = 11
      FieldName = 'Phone'
      Size = 255
    end
  end
  object qryInMoneyPrihod: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dStrt'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dEnd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      'SELECT Sum(InMoney.Sum) AS SumOfSum'
      'FROM InMoney'
      'WHERE InMoney.Data1 Between :dStrt And :dEnd;')
    Left = 656
    Top = 584
    object qryInMoneyPrihodSumOfSum: TBCDField
      FieldName = 'SumOfSum'
      Precision = 19
    end
  end
  object dsInMoneyPrihod: TDataSource
    DataSet = qryInMoneyPrihod
    Left = 576
    Top = 616
  end
  object dsAllOrdersDop: TDataSource
    DataSet = qryAllOrdersDop
    Left = 296
    Top = 584
  end
  object qryAllOrdersDop: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dStart'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dEnd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'OrdStatus'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Orders.ID, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Manager.' +
        'ShortName, Orders.DateStart, Orders.TimeStart, Orders.DataFinish' +
        ', Orders.TimeFinish, Orders.Skidka, Status.NameStatus, Items.Nam' +
        'eItem, ColorItem.Name1, CustomerStatus.Name1'
      
        'FROM CustomerStatus RIGHT JOIN (Status INNER JOIN (Manager INNER' +
        ' JOIN (ColorItem INNER JOIN (Items INNER JOIN (ItemCurrent INNER' +
        ' JOIN (Orders INNER JOIN Customer ON Orders.ID_Customer = Custom' +
        'er.ID) ON ItemCurrent.ID_Order = Orders.ID) ON Items.ID = ItemCu' +
        'rrent.ID_Item) ON ColorItem.ID = ItemCurrent.ID_Color) ON Manage' +
        'r.ID = Orders.ID_Manager) ON Status.ID = Orders.ID_Status) ON Cu' +
        'stomerStatus.ID = Customer.ID_Status'
      
        'WHERE (((Orders.DateStart)>=:dStart And (Orders.DateStart)<=:dEn' +
        'd) AND ((Status.NameStatus)=:OrdStatus));')
    Left = 376
    Top = 584
    object qryAllOrdersDopNumberKvitancii: TIntegerField
      DisplayLabel = #8470' '#1082#1074#1080#1090'.'
      DisplayWidth = 6
      FieldName = 'NumberKvitancii'
    end
    object qryAllOrdersDopNumCustomer: TIntegerField
      DisplayLabel = #8470' '#1079#1072#1082'-'#1082#1072
      DisplayWidth = 6
      FieldName = 'NumCustomer'
    end
    object qryAllOrdersDopFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object qryAllOrdersDopCustomerName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Customer.Name1'
      Size = 255
    end
    object qryAllOrdersDopOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object qryAllOrdersDopShortName: TWideStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldName = 'ShortName'
      Size = 255
    end
    object qryAllOrdersDopDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
      DisplayFormat = 'ddddd'
    end
    object qryAllOrdersDopTimeStart: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'TimeStart'
      DisplayFormat = 't'
    end
    object qryAllOrdersDopDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'DataFinish'
      DisplayFormat = 'ddddd'
    end
    object qryAllOrdersDopTimeFinish: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'TimeFinish'
      DisplayFormat = 't'
    end
    object qryAllOrdersDopSkidka: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 6
      FieldName = 'Skidka'
    end
    object qryAllOrdersDopNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object qryAllOrdersDopNameItem: TWideStringField
      DisplayLabel = #1048#1079#1076#1077#1083#1080#1077
      DisplayWidth = 10
      FieldName = 'NameItem'
      Size = 255
    end
    object qryAllOrdersDopColorItemName1: TWideStringField
      DisplayLabel = #1062#1074#1077#1090
      DisplayWidth = 10
      FieldName = 'ColorItem.Name1'
      Size = 255
    end
    object qryAllOrdersDopCustomerStatusName1: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'CustomerStatus.Name1'
      Size = 255
    end
    object qryAllOrdersDopID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
  end
  object dsCustStatus: TDataSource
    DataSet = tblCustStatus
    Left = 128
    Top = 128
  end
  object tblCustStatus: TADOTable
    Active = True
    Connection = conContn
    CursorType = ctStatic
    TableName = 'CustomerStatus'
    Left = 192
    Top = 120
  end
  object qryOrderNeVidano: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dStart'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dEnd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Orders.ID, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Manager.' +
        'ShortName, Orders.DateStart, Orders.TimeStart, Orders.DataFinish' +
        ', Orders.TimeFinish, Orders.Skidka, Status.NameStatus, Items.Nam' +
        'eItem, ColorItem.Name1, CustomerStatus.Name1'
      
        'FROM CustomerStatus RIGHT JOIN (Status INNER JOIN (Manager INNER' +
        ' JOIN (ColorItem INNER JOIN (Items INNER JOIN (ItemCurrent INNER' +
        ' JOIN (Orders INNER JOIN Customer ON Orders.ID_Customer = Custom' +
        'er.ID) ON ItemCurrent.ID_Order = Orders.ID) ON Items.ID = ItemCu' +
        'rrent.ID_Item) ON ColorItem.ID = ItemCurrent.ID_Color) ON Manage' +
        'r.ID = Orders.ID_Manager) ON Status.ID = Orders.ID_Status) ON Cu' +
        'stomerStatus.ID = Customer.ID_Status'
      
        'WHERE (((Orders.DateStart)>=:dStart And (Orders.DateStart)<=:dEn' +
        'd) AND ((Status.NameStatus)<>"'#1042#1099#1076#1072#1085#1086'"));')
    Left = 384
    Top = 640
    object IntegerField1: TIntegerField
      DisplayLabel = #8470' '#1082#1074#1080#1090'.'
      DisplayWidth = 6
      FieldName = 'NumberKvitancii'
    end
    object IntegerField2: TIntegerField
      DisplayLabel = #8470' '#1079#1072#1082'-'#1082#1072
      DisplayWidth = 6
      FieldName = 'NumCustomer'
    end
    object WideStringField1: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object WideStringField2: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Customer.Name1'
      Size = 255
    end
    object WideStringField3: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object WideStringField4: TWideStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldName = 'ShortName'
      Size = 255
    end
    object DateTimeField1: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
      DisplayFormat = 'ddddd'
    end
    object DateTimeField2: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'TimeStart'
      DisplayFormat = 't'
    end
    object DateTimeField3: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'DataFinish'
      DisplayFormat = 'ddddd'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'TimeFinish'
      DisplayFormat = 't'
    end
    object IntegerField3: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 6
      FieldName = 'Skidka'
    end
    object WideStringField5: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object WideStringField6: TWideStringField
      DisplayLabel = #1048#1079#1076#1077#1083#1080#1077
      DisplayWidth = 10
      FieldName = 'NameItem'
      Size = 255
    end
    object WideStringField7: TWideStringField
      DisplayLabel = #1062#1074#1077#1090
      DisplayWidth = 10
      FieldName = 'ColorItem.Name1'
      Size = 255
    end
    object WideStringField8: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'CustomerStatus.Name1'
      Size = 255
    end
    object AutoIncField1: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
  end
  object dsOrderNeVidano: TDataSource
    DataSet = qryOrderNeVidano
    Left = 304
    Top = 632
  end
  object qryAllOrders: TADOQuery
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dStart'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dEnd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Orders.ID, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Manager.' +
        'ShortName, Orders.DateStart, Orders.TimeStart, Orders.DataFinish' +
        ', Orders.TimeFinish, Orders.Skidka, Status.NameStatus, Items.Nam' +
        'eItem, ColorItem.Name1, CustomerStatus.Name1'
      
        'FROM CustomerStatus RIGHT JOIN (Status INNER JOIN (Manager INNER' +
        ' JOIN (ColorItem INNER JOIN (Items INNER JOIN (ItemCurrent INNER' +
        ' JOIN (Orders INNER JOIN Customer ON Orders.ID_Customer = Custom' +
        'er.ID) ON ItemCurrent.ID_Order = Orders.ID) ON Items.ID = ItemCu' +
        'rrent.ID_Item) ON ColorItem.ID = ItemCurrent.ID_Color) ON Manage' +
        'r.ID = Orders.ID_Manager) ON Status.ID = Orders.ID_Status) ON Cu' +
        'stomerStatus.ID = Customer.ID_Status'
      
        'WHERE (((Orders.DateStart)>=:dStart And (Orders.DateStart)<=:dEn' +
        'd));')
    Left = 384
    Top = 720
    object IntegerField4: TIntegerField
      DisplayLabel = #8470' '#1082#1074#1080#1090'.'
      DisplayWidth = 6
      FieldName = 'NumberKvitancii'
    end
    object IntegerField5: TIntegerField
      DisplayLabel = #8470' '#1079#1072#1082'-'#1082#1072
      DisplayWidth = 6
      FieldName = 'NumCustomer'
    end
    object WideStringField9: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object WideStringField10: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Customer.Name1'
      Size = 255
    end
    object WideStringField11: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object WideStringField12: TWideStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldName = 'ShortName'
      Size = 255
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
      DisplayFormat = 'ddddd'
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'TimeStart'
      DisplayFormat = 't'
    end
    object DateTimeField7: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'DataFinish'
      DisplayFormat = 'ddddd'
    end
    object DateTimeField8: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'TimeFinish'
      DisplayFormat = 't'
    end
    object IntegerField6: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 6
      FieldName = 'Skidka'
    end
    object WideStringField13: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object WideStringField14: TWideStringField
      DisplayLabel = #1048#1079#1076#1077#1083#1080#1077
      DisplayWidth = 10
      FieldName = 'NameItem'
      Size = 255
    end
    object WideStringField15: TWideStringField
      DisplayLabel = #1062#1074#1077#1090
      DisplayWidth = 10
      FieldName = 'ColorItem.Name1'
      Size = 255
    end
    object WideStringField16: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'CustomerStatus.Name1'
      Size = 255
    end
    object AutoIncField2: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
  end
  object dsAllOrders: TDataSource
    DataSet = qryAllOrders
    Left = 304
    Top = 728
  end
  object dsQryWorks: TDataSource
    Left = 312
    Top = 288
  end
  object qryWorks: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    DataSource = dsQryWorks
    Parameters = <
      item
        Name = 'GroupWorks'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Works.NameWork, Works.PerionGaranty, Works.Price, TypeQua' +
        'ntity.NameQ, Ciphers.Name1'
      
        'FROM GroupeWork INNER JOIN (Ciphers RIGHT JOIN (TypeQuantity RIG' +
        'HT JOIN Works ON TypeQuantity.ID = Works.ID_Quantity) ON Ciphers' +
        '.ID = Works.ID_Chiper) ON GroupeWork.ID = Works.ID_GroupWork'
      
        'WHERE (((GroupeWork.ID)=:GroupWorks) AND ((Works.DelOrNot)<>True' +
        '));')
    Left = 384
    Top = 288
  end
  object qryStatWoker: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'fio'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dateStart'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end
      item
        Name = 'dateFinish'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 255
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Woker.ShortName, Status.NameStatus, GroupeWork.Name1, Wor' +
        'ks.NameWork, Count(Works.NameWork) AS CountOfNameWork, Orders.Da' +
        'teStart, Orders.DataFinish, Orders.NumberKvitancii'
      
        'FROM GroupeWork RIGHT JOIN (Status INNER JOIN (((WorkerInOrder L' +
        'EFT JOIN Woker ON WorkerInOrder.ID_Worker = Woker.ID) INNER JOIN' +
        ' Orders ON WorkerInOrder.ID_Order = Orders.ID) LEFT JOIN Works O' +
        'N WorkerInOrder.ID_Works = Works.ID) ON Status.ID = Orders.ID_St' +
        'atus) ON GroupeWork.ID = Works.ID_GroupWork'
      
        'GROUP BY Woker.ShortName, Status.NameStatus, GroupeWork.Name1, W' +
        'orks.NameWork, Orders.DateStart, Orders.DataFinish, Orders.Numbe' +
        'rKvitancii'
      
        'HAVING (((Woker.ShortName)=:fio) AND ((Status.NameStatus)='#39#1042#1099#1076#1072#1085 +
        #1086#39' Or (Status.NameStatus)='#39#1043#1086#1090#1086#1074#39') AND ((Orders.DateStart)>=:dat' +
        'eStart) AND ((Orders.DataFinish)<=:dateFinish));')
    Left = 480
    Top = 472
    object qryStatWokerShortName: TWideStringField
      DisplayLabel = #1057#1087#1077#1094#1080#1072#1083#1080#1089#1090
      DisplayWidth = 15
      FieldName = 'ShortName'
      Size = 255
    end
    object qryStatWokerNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object qryStatWokerName1: TWideStringField
      DisplayLabel = #1043#1088#1091#1087#1087#1072' '#1088#1072#1073#1086#1090
      FieldName = 'Name1'
      Size = 50
    end
    object qryStatWokerNameWork: TWideStringField
      DisplayLabel = #1053#1072#1080#1084#1077#1085#1086#1074#1072#1085#1080#1077' '#1088#1072#1073#1086#1090#1099
      DisplayWidth = 50
      FieldName = 'NameWork'
      Size = 255
    end
    object qryStatWokerCountOfNameWork: TIntegerField
      DisplayLabel = #1050#1086#1083'-'#1074#1086
      DisplayWidth = 5
      FieldName = 'CountOfNameWork'
    end
    object qryStatWokerDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095'.'
      FieldName = 'DateStart'
    end
    object qryStatWokerDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1079#1072#1074'.'
      FieldName = 'DataFinish'
    end
    object qryStatWokerNumberKvitancii: TIntegerField
      DisplayLabel = #1053#1086#1084#1077#1088' '#1082#1074#1080#1090'.'
      FieldName = 'NumberKvitancii'
    end
  end
  object dsStatWoker: TDataSource
    DataSet = qryStatWoker
    Left = 416
    Top = 480
  end
  object qryProsroch: TADOQuery
    Active = True
    Connection = conContn
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'dataEnd'
        Attributes = [paNullable]
        DataType = ftWideString
        NumericScale = 255
        Precision = 255
        Size = 510
        Value = Null
      end>
    SQL.Strings = (
      
        'SELECT Orders.NumberKvitancii, Orders.ID, Customer.NumCustomer, ' +
        'Customer.FirstName, Customer.Name1, Customer.Otchestvo, Manager.' +
        'ShortName, Orders.DateStart, Orders.TimeStart, Orders.DataFinish' +
        ', Orders.TimeFinish, Orders.Skidka, Status.NameStatus, Items.Nam' +
        'eItem, ColorItem.Name1, CustomerStatus.Name1'
      
        'FROM CustomerStatus RIGHT JOIN (Status INNER JOIN (Manager INNER' +
        ' JOIN (ColorItem INNER JOIN (Items INNER JOIN (ItemCurrent INNER' +
        ' JOIN (Orders INNER JOIN Customer ON Orders.ID_Customer = Custom' +
        'er.ID) ON ItemCurrent.ID_Order = Orders.ID) ON Items.ID = ItemCu' +
        'rrent.ID_Item) ON ColorItem.ID = ItemCurrent.ID_Color) ON Manage' +
        'r.ID = Orders.ID_Manager) ON Status.ID = Orders.ID_Status) ON Cu' +
        'stomerStatus.ID = Customer.ID_Status'
      
        'WHERE (((Orders.DataFinish)<=:dataEnd) AND (((Status.NameStatus)' +
        '<>'#39#1043#1086#1090#1086#1074#39') And ((Status.NameStatus)<>'#39#1042#1099#1076#1072#1085#1086#39') And ((Status.Name' +
        'Status)<>'#39#1054#1090#1082#1072#1079' '#1082#1083#1080#1077#1085#1090#39') And ((Status.NameStatus)<>'#39#1054#1090#1082#1072#1079' '#1041#1086#1090#1072#1089#39 +
        ')));')
    Left = 384
    Top = 688
    object qryProsrochNumberKvitancii: TIntegerField
      DisplayLabel = #8470' '#1082#1074#1080#1090'.'
      DisplayWidth = 6
      FieldName = 'NumberKvitancii'
    end
    object qryProsrochID: TAutoIncField
      FieldName = 'ID'
      ReadOnly = True
      Visible = False
    end
    object qryProsrochNumCustomer: TIntegerField
      DisplayLabel = #8470' '#1079#1072#1082'-'#1082#1072
      DisplayWidth = 6
      FieldName = 'NumCustomer'
    end
    object qryProsrochFirstName: TWideStringField
      DisplayLabel = #1060#1072#1084#1080#1083#1080#1103
      DisplayWidth = 20
      FieldName = 'FirstName'
      Size = 255
    end
    object qryProsrochCustomerName1: TWideStringField
      DisplayLabel = #1048#1084#1103
      DisplayWidth = 15
      FieldName = 'Customer.Name1'
      Size = 255
    end
    object qryProsrochOtchestvo: TWideStringField
      DisplayLabel = #1054#1090#1095#1077#1089#1090#1074#1086
      DisplayWidth = 20
      FieldName = 'Otchestvo'
      Size = 255
    end
    object qryProsrochShortName: TWideStringField
      DisplayLabel = #1052#1077#1085#1077#1076#1078#1077#1088
      DisplayWidth = 20
      FieldName = 'ShortName'
      Size = 255
    end
    object qryProsrochDateStart: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1085#1072#1095#1072#1083#1072
      DisplayWidth = 10
      FieldName = 'DateStart'
      DisplayFormat = 'ddddd'
    end
    object qryProsrochTimeStart: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1087#1086#1083#1091#1095#1077#1085#1080#1103
      DisplayWidth = 10
      FieldName = 'TimeStart'
      DisplayFormat = 't'
    end
    object qryProsrochDataFinish: TDateTimeField
      DisplayLabel = #1044#1072#1090#1072' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'DataFinish'
      DisplayFormat = 'ddddd'
    end
    object qryProsrochTimeFinish: TDateTimeField
      DisplayLabel = #1042#1088#1077#1084#1103' '#1074#1099#1076#1072#1095#1080
      DisplayWidth = 10
      FieldName = 'TimeFinish'
      DisplayFormat = 't'
    end
    object qryProsrochSkidka: TIntegerField
      DisplayLabel = #1057#1082#1080#1076#1082#1072
      DisplayWidth = 6
      FieldName = 'Skidka'
    end
    object qryProsrochNameStatus: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1079#1072#1082#1072#1079#1072
      DisplayWidth = 10
      FieldName = 'NameStatus'
      Size = 255
    end
    object qryProsrochNameItem: TWideStringField
      DisplayLabel = #1048#1079#1076#1077#1083#1080#1077
      DisplayWidth = 10
      FieldName = 'NameItem'
      Size = 255
    end
    object qryProsrochColorItemName1: TWideStringField
      DisplayLabel = #1062#1074#1077#1090
      DisplayWidth = 10
      FieldName = 'ColorItem.Name1'
      Size = 255
    end
    object qryProsrochCustomerStatusName1: TWideStringField
      DisplayLabel = #1057#1090#1072#1090#1091#1089' '#1082#1083#1080#1077#1085#1090#1072
      DisplayWidth = 10
      FieldName = 'CustomerStatus.Name1'
      Size = 255
    end
  end
  object dsProsroch: TDataSource
    DataSet = qryProsroch
    Left = 320
    Top = 688
  end
end
