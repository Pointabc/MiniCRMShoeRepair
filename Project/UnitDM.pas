unit UnitDM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, IniFiles;

type
  TFormDM = class(TForm)
    conContn: TADOConnection;
    dsOrder: TDataSource;
    tblOrder: TADOTable;
    tblCustomer: TADOTable;
    dsCustomer: TDataSource;
    dsManager: TDataSource;
    tblManager: TADOTable;
    dsPhones: TDataSource;
    tblPhones: TADOTable;
    atncfldPhonesID: TAutoIncField;
    intgrfldPhonesID_TypePhone: TIntegerField;
    tblWokers: TADOTable;
    dsWokers: TDataSource;
    tblPhoneType: TADOTable;
    dsPhoneType: TDataSource;
    strngfldPhonesPhoneType: TStringField;
    tblGroupWork: TADOTable;
    dsGroupWork: TDataSource;
    atncfldGroupWorkID: TAutoIncField;
    wdstrngfldGroupWorkName1: TWideStringField;
    tblItem: TADOTable;
    dsItem: TDataSource;
    intgrfldPhonesID_Woker: TIntegerField;
    intgrfldPhonesID_Customer: TIntegerField;
    intgrfldPhonesID_Manager: TIntegerField;
    atncfldWokersID: TAutoIncField;
    wdstrngfldWokersFirstName: TWideStringField;
    wdstrngfldWokersName1: TWideStringField;
    wdstrngfldWokersOtchestvo: TWideStringField;
    dsWorks: TDataSource;
    tblWorks: TADOTable;
    atncfldWorksID: TAutoIncField;
    wdstrngfldWorksNameWork: TWideStringField;
    intgrfldWorksPerionGaranty: TIntegerField;
    intgrfldWorksID_Quantity: TIntegerField;
    intgrfldWorksID_Chiper: TIntegerField;
    intgrfldWorksID_GroupWork: TIntegerField;
    qrySubWorks: TADOQuery;
    dsSubWorks: TDataSource;
    wdstrngfldSubWorksNameWork: TWideStringField;
    intgrfldSubWorksPerionGaranty: TIntegerField;
    bcdfldSubWorksPrice: TBCDField;
    qryTest: TADOQuery;
    dsTest: TDataSource;
    tblCrtOrders: TADOTable;
    dsCrtOrders: TDataSource;
    atncfldCrtOrdersID: TAutoIncField;
    intgrfldCrtOrdersID_Work: TIntegerField;
    intgrfldCrtOrdersID_Order: TIntegerField;
    strngfldCrtOrdersWork: TStringField;
    intgrfldCrtOrdersGaranty: TIntegerField;
    qryCustPhones: TADOQuery;
    dsCustPhones: TDataSource;
    wdstrngfldCustPhonesTypePhone: TWideStringField;
    qryCurWorks: TADOQuery;
    dsCurWork: TDataSource;
    wdstrngfldCurWorksNameWork: TWideStringField;
    bcdfldCurWorksPrice: TBCDField;
    bcdfldWorksPrice: TBCDField;
    tblTypeQuantity: TADOTable;
    dsTypeQuantity: TDataSource;
    tblCiphers: TADOTable;
    dsCiphers: TDataSource;
    strngfldWorksKolvo: TStringField;
    strngfldWorksChip: TStringField;
    qryByNumKvit: TADOQuery;
    dsByNumKvit: TDataSource;
    intgrfldByNumKvitNumberKvitancii: TIntegerField;
    wdstrngfldByNumKvitFirstName: TWideStringField;
    wdstrngfldByNumKvitName1: TWideStringField;
    wdstrngfldByNumKvitOtchestvo: TWideStringField;
    dtmfldByNumKvitDateStart: TDateTimeField;
    dsByFIO: TDataSource;
    qryByFIO: TADOQuery;
    intgrfldByFIONumberKvitancii: TIntegerField;
    wdstrngfldByFIOFirstName: TWideStringField;
    wdstrngfldByFIOName1: TWideStringField;
    wdstrngfldByFIOOtchestvo: TWideStringField;
    dtmfldByFIODateStart: TDateTimeField;
    atncfldCiphersID: TAutoIncField;
    wdstrngfldCiphersName1: TWideStringField;
    wdstrngfldCiphersPrim: TWideStringField;
    tblWorksDop: TADOTable;
    dsWorksDop: TDataSource;
    atncfldCustomerID: TAutoIncField;
    wdstrngfldCustomerFirstName: TWideStringField;
    wdstrngfldCustomerName1: TWideStringField;
    wdstrngfldCustomerOtchestvo: TWideStringField;
    intgrfldCustomerID_Status: TIntegerField;
    intgrfldCustomerNumCustomer: TIntegerField;
    wdstrngfldWokersProf: TWideStringField;
    qryPhoneWokers: TADOQuery;
    dsPhoneWokers: TDataSource;
    wdstrngfldPhoneWokersTypePhone: TWideStringField;
    atncfldItemID: TAutoIncField;
    wdstrngfldItemNameItem: TWideStringField;
    tblMoney: TADOTable;
    dsMoney: TDataSource;
    qrySum: TADOQuery;
    dsSum: TDataSource;
    atncfldManagerID: TAutoIncField;
    wdstrngfldManagerFirstName: TWideStringField;
    wdstrngfldManagerNames: TWideStringField;
    wdstrngfldManagerOtchestvo: TWideStringField;
    wdstrngfldManagerProf: TWideStringField;
    qryPhoneManager: TADOQuery;
    dsPhoneManager: TDataSource;
    wdstrngfldPhoneManagerTypePhone: TWideStringField;
    intgrfldByFIONumCustomer: TIntegerField;
    qryByNumCust: TADOQuery;
    dsByNumCust: TDataSource;
    intgrfldByNumCustNumberKvitancii: TIntegerField;
    intgrfldByNumCustNumCustomer: TIntegerField;
    wdstrngfldByNumCustFirstName: TWideStringField;
    wdstrngfldByNumCustName1: TWideStringField;
    wdstrngfldByNumCustOtchestvo: TWideStringField;
    dtmfldByNumCustDateStart: TDateTimeField;
    intgrfldByNumCustID_Customer: TIntegerField;
    intgrfldByNumKvitNumCustomer: TIntegerField;
    wdstrngfldCurWorksGroupeWorkName1: TWideStringField;
    wdstrngfldCurWorksCiphersName1: TWideStringField;
    tblItemColor: TADOTable;
    dsItemColor: TDataSource;
    dsItemCurrent: TDataSource;
    tblItemCurrent: TADOTable;
    tblMZD: TADOTable;
    dsMZD: TDataSource;
    tblStatusOrder: TADOTable;
    dsStutusOrder: TDataSource;
    atncfldMoneyID: TAutoIncField;
    bcdfldMoneySum: TBCDField;
    dtmfldMoneyData1: TDateTimeField;
    intgrfldMoneyID_Order: TIntegerField;
    qryInsMoney: TADOQuery;
    dsInsMoney: TDataSource;
    dtmfldInsMoneyData1: TDateTimeField;
    bcdfldInsMoneySum: TBCDField;
    dsLR: TDataSource;
    tblLR: TADOTable;
    atncfldByNumCustID: TAutoIncField;
    wdstrngfldManagerShortName: TWideStringField;
    wdstrngfldWokersShortName: TWideStringField;
    wdstrngfldCurWorksShortName: TWideStringField;
    intgrfldCurWorksID_Woker: TIntegerField;
    strngfldCurWorksCurWoker: TStringField;
    intgrfldCrtOrdersID_Woker: TIntegerField;
    tblDopWokers: TADOTable;
    dsDopWokers: TDataSource;
    intgrfldCurWorksPerionGaranty: TIntegerField;
    tblWorksInOrder: TADOTable;
    dsWorksInOrder: TDataSource;
    atncfldCurWorksCrtOrdersID: TAutoIncField;
    atncfldCurWorksWorksID: TAutoIncField;
    qryReadyOrder: TADOQuery;
    dsReadyOrder: TDataSource;
    intgrfldReadyOrderNumberKvitancii: TIntegerField;
    intgrfldReadyOrderNumCustomer: TIntegerField;
    wdstrngfldReadyOrderFirstName: TWideStringField;
    wdstrngfldReadyOrderName1: TWideStringField;
    wdstrngfldReadyOrderOtchestvo: TWideStringField;
    dtmfldReadyOrderDateStart: TDateTimeField;
    intgrfldReadyOrderID_Customer: TIntegerField;
    wdstrngfldReadyOrderNameStatus: TWideStringField;
    qryVidannieOrders: TADOQuery;
    dsVidannieOrders: TDataSource;
    intgrfldVidannieOrdersNumberKvitancii: TIntegerField;
    intgrfldVidannieOrdersNumCustomer: TIntegerField;
    wdstrngfldVidannieOrdersFirstName: TWideStringField;
    wdstrngfldVidannieOrdersName1: TWideStringField;
    wdstrngfldVidannieOrdersOtchestvo: TWideStringField;
    dtmfldVidannieOrdersDateStart: TDateTimeField;
    intgrfldVidannieOrdersID_Customer: TIntegerField;
    wdstrngfldVidannieOrdersNameStatus: TWideStringField;
    qryDolzhniki: TADOQuery;
    dsDolzhniki: TDataSource;
    qryDolzhnikiNumberKvitancii: TIntegerField;
    qryDolzhnikiNumCustomer: TIntegerField;
    qryDolzhnikiFirstName: TWideStringField;
    qryDolzhnikiName1: TWideStringField;
    qryDolzhnikiOtchestvo: TWideStringField;
    qryDolzhnikiDateStart: TDateTimeField;
    qryDolzhnikiNameStatus: TWideStringField;
    qryDolzhnikiID: TAutoIncField;
    qryDolzhnikiCost: TBCDField;
    qryDolzhnikiInserted: TBCDField;
    qryDolzhnikiSkidka: TIntegerField;
    qryDolzhnikiValue: TBCDField;
    qryByFIOID_Customer: TIntegerField;
    qryByFIONameStatus: TWideStringField;
    qryByNumKvitID: TAutoIncField;
    qryByNumKvitNameStatus: TWideStringField;
    qryByNumCustNameStatus: TWideStringField;
    atncfldItemColorID: TAutoIncField;
    wdstrngfldItemColorName1: TWideStringField;
    dtmfldByFIODataFinish: TDateTimeField;
    dtmfldByNumKvitDataFinish: TDateTimeField;
    dtmfldByNumCustDataFinish: TDateTimeField;
    qryVidannieOrdersDataFinish: TDateTimeField;
    qryReadyOrderDataFinish: TDateTimeField;
    tblLRID: TAutoIncField;
    tblLRName1: TWideStringField;
    tblLRDelOrNot: TBooleanField;
    tblItemDelOrNot: TBooleanField;
    tblItemColorDelOrNot: TBooleanField;
    tblCiphersDelOrNot: TBooleanField;
    qryInWork: TADOQuery;
    dsInWork: TDataSource;
    qryInWorkNumberKvitancii: TIntegerField;
    qryInWorkNumCustomer: TIntegerField;
    qryInWorkFirstName: TWideStringField;
    qryInWorkName1: TWideStringField;
    qryInWorkOtchestvo: TWideStringField;
    qryInWorkDateStart: TDateTimeField;
    qryInWorkDataFinish: TDateTimeField;
    qryInWorkID_Customer: TIntegerField;
    qryInWorkNameStatus: TWideStringField;
    qryVirabotka: TADOQuery;
    dsVirabotka: TDataSource;
    qryVirabotkaFirstName: TWideStringField;
    qryVirabotkaName1: TWideStringField;
    qryVirabotkaOtchestvo: TWideStringField;
    qryVirabotkaNameWork: TWideStringField;
    qryVirabotkaPrice: TBCDField;
    qryVirabotkaDataFinish: TDateTimeField;
    qryVirabotkaNameStatus: TWideStringField;
    wdstrngfldPhonesPrim: TWideStringField;
    atncfldByFIOID: TAutoIncField;
    dsPhoneCustomer: TDataSource;
    qryPhoneCustomer: TADOQuery;
    qryPhoneCustomerTypePhone: TWideStringField;
    qryInMoneyPrihod: TADOQuery;
    dsInMoneyPrihod: TDataSource;
    qryInMoneyPrihodSumOfSum: TBCDField;
    qryVirabotkaSkidka: TIntegerField;
    qryVirabotkaVirabotka: TBCDField;
    tblWorksDelOrNot: TBooleanField;
    tblGroupWorkDelOrNot: TBooleanField;
    dsAllOrdersDop: TDataSource;
    qryAllOrdersDop: TADOQuery;
    qryAllOrdersDopNumberKvitancii: TIntegerField;
    qryAllOrdersDopNumCustomer: TIntegerField;
    qryAllOrdersDopFirstName: TWideStringField;
    qryAllOrdersDopCustomerName1: TWideStringField;
    qryAllOrdersDopOtchestvo: TWideStringField;
    qryAllOrdersDopShortName: TWideStringField;
    qryAllOrdersDopDateStart: TDateTimeField;
    qryAllOrdersDopTimeStart: TDateTimeField;
    qryAllOrdersDopDataFinish: TDateTimeField;
    qryAllOrdersDopTimeFinish: TDateTimeField;
    qryAllOrdersDopSkidka: TIntegerField;
    qryAllOrdersDopNameStatus: TWideStringField;
    qryAllOrdersDopNameItem: TWideStringField;
    qryAllOrdersDopColorItemName1: TWideStringField;
    qryAllOrdersDopCustomerStatusName1: TWideStringField;
    tblOrderID: TAutoIncField;
    tblOrderID_Customer: TIntegerField;
    tblOrderDateStart: TDateTimeField;
    tblOrderTimeStart: TDateTimeField;
    tblOrderID_Manager: TIntegerField;
    tblOrderID_Status: TIntegerField;
    tblOrderDataFinish: TDateTimeField;
    tblOrderTimeFinish: TDateTimeField;
    tblOrderNumberKvitancii: TIntegerField;
    tblOrderSkidka: TIntegerField;
    tblOrderOcenkaItem: TIntegerField;
    tblOrderDelOrNot: TBooleanField;
    qryAllOrdersDopID: TAutoIncField;
    dsCustStatus: TDataSource;
    tblCustStatus: TADOTable;
    tblCustomercustStatus: TStringField;
    tblPhonesPhone: TWideStringField;
    qryCustPhonesPhone: TWideStringField;
    qryPhoneWokersPhone: TWideStringField;
    qryPhoneManagerPhone: TWideStringField;
    qryPhoneCustomerPhone: TWideStringField;
    tblOrderID_ManagerFinish: TIntegerField;
    tblOrderID_ManagerGet: TIntegerField;
    tblOrderPrim: TWideStringField;
    qryOrderNeVidano: TADOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    DateTimeField1: TDateTimeField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    DateTimeField4: TDateTimeField;
    IntegerField3: TIntegerField;
    WideStringField5: TWideStringField;
    WideStringField6: TWideStringField;
    WideStringField7: TWideStringField;
    WideStringField8: TWideStringField;
    AutoIncField1: TAutoIncField;
    dsOrderNeVidano: TDataSource;
    qryAllOrders: TADOQuery;
    IntegerField4: TIntegerField;
    IntegerField5: TIntegerField;
    WideStringField9: TWideStringField;
    WideStringField10: TWideStringField;
    WideStringField11: TWideStringField;
    WideStringField12: TWideStringField;
    DateTimeField5: TDateTimeField;
    DateTimeField6: TDateTimeField;
    DateTimeField7: TDateTimeField;
    DateTimeField8: TDateTimeField;
    IntegerField6: TIntegerField;
    WideStringField13: TWideStringField;
    WideStringField14: TWideStringField;
    WideStringField15: TWideStringField;
    WideStringField16: TWideStringField;
    AutoIncField2: TAutoIncField;
    dsAllOrders: TDataSource;
    tblWorksDopID: TAutoIncField;
    tblWorksDopNameWork: TWideStringField;
    tblWorksDopPerionGaranty: TIntegerField;
    tblWorksDopID_Quantity: TIntegerField;
    tblWorksDopID_Chiper: TIntegerField;
    tblWorksDopID_GroupWork: TIntegerField;
    tblWorksDopPrice: TBCDField;
    tblWorksDopDelOrNot: TBooleanField;
    dsQryWorks: TDataSource;
    qryWorks: TADOQuery;
    qryStatWoker: TADOQuery;
    dsStatWoker: TDataSource;
    qryStatWokerShortName: TWideStringField;
    qryStatWokerNameStatus: TWideStringField;
    qryStatWokerName1: TWideStringField;
    qryStatWokerNameWork: TWideStringField;
    qryStatWokerCountOfNameWork: TIntegerField;
    qryStatWokerDateStart: TDateTimeField;
    qryStatWokerDataFinish: TDateTimeField;
    qryStatWokerNumberKvitancii: TIntegerField;
    qryProsroch: TADOQuery;
    dsProsroch: TDataSource;
    qryProsrochNumberKvitancii: TIntegerField;
    qryProsrochID: TAutoIncField;
    qryProsrochNumCustomer: TIntegerField;
    qryProsrochFirstName: TWideStringField;
    qryProsrochCustomerName1: TWideStringField;
    qryProsrochOtchestvo: TWideStringField;
    qryProsrochShortName: TWideStringField;
    qryProsrochDateStart: TDateTimeField;
    qryProsrochTimeStart: TDateTimeField;
    qryProsrochDataFinish: TDateTimeField;
    qryProsrochTimeFinish: TDateTimeField;
    qryProsrochSkidka: TIntegerField;
    qryProsrochNameStatus: TWideStringField;
    qryProsrochNameItem: TWideStringField;
    qryProsrochColorItemName1: TWideStringField;
    qryProsrochCustomerStatusName1: TWideStringField;
    qryCurWorksNameQ: TWideStringField;
    procedure FormCreate(Sender: TObject);
    function BDConnect(filename: string): boolean;
    function BDDisconnect(): boolean;
    procedure tblWokersAfterScroll(DataSet: TDataSet);
    procedure tblManagerAfterScroll(DataSet: TDataSet);
    procedure strngfldCurWorksCurWokerChange(Sender: TField);
    procedure dsOrderDataChange(Sender: TObject; Field: TField);
    procedure tblCustomerAfterScroll(DataSet: TDataSet);
    procedure tblManagerBeforePost(DataSet: TDataSet);
    procedure tblWokersBeforePost(DataSet: TDataSet);
    procedure dsItemCurrentDataChange(Sender: TObject; Field: TField);
    procedure dsCurWorkDataChange(Sender: TObject; Field: TField);
    procedure dsItemCurrentUpdateData(Sender: TObject);
    procedure tblGroupWorkAfterPost(DataSet: TDataSet);
    procedure tblWorksAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    bInsOrder: Boolean;                 // Процесс создания нового заказа
    bEditOrder: Boolean;                // Процесс редактирования заказа
    bInsOrderByExistCustomer: Boolean;
    //bFromSearch: Boolean;
    //bExistCustomer: Boolean;
    tmpF, tmpN, tmpO: string;
    arrChangeWorker: array[1..50] of Boolean;
    bAddOneMoreOrder: Boolean;          // Создать еще заказ для того же клиента?
  end;

var
  FormDM: TFormDM;

implementation

uses
  MainWnd, UnitAddOrder;

{$R *.dfm}

procedure TFormDM.FormCreate(Sender: TObject);
var
  filename: string;
  Ini: Tinifile;
  i: Integer;
begin
  bInsOrder := False;
  bEditOrder := false;
  bInsOrderByExistCustomer := False;
  bAddOneMoreOrder := false;

  tmpF := ''; tmpN := ''; tmpO := '';

  // Читаем config.ini
  //открываем файл 
  Ini:=TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  filename:=Ini.ReadString('PathToBD','path','');

  // Пытаемся подключиться к БД
  //if not(BDConnect(SysUtils.GetCurrentDir+'\'+'db.mdb')) then
  if not(BDConnect(filename)) then
  begin
    // База может располагаться в любом месте
    MainForm.dlgOpen.Filter := 'База данных (*.mdb)|*.MDB';
    MainForm.dlgOpen.InitialDir := SysUtils.GetCurrentDir;
    if MainForm.dlgOpen.Execute then
    begin
      filename := MainForm.dlgOpen.Filename;
      FormDM.BDDisconnect;
      FormDM.BDConnect(filename);
    end
    else
      Application.Terminate;
  end;

  // Сортировка вкладки все заказы
  qryAllOrdersDop.Sort := 'NumberKvitancii';

  // Заполняем статусами заказов
  FormDM.tblStatusOrder.First;
  for i:=0 to FormDM.tblStatusOrder.RecordCount-1 do
  begin
    MainForm.cbStatusOrder.Items.Add(FormDM.tblStatusOrder.FieldByName('NameStatus').AsString);
    FormDM.tblStatusOrder.Next;
  end;
  MainForm.cbStatusOrder.Items.Add('Все заказы');
  MainForm.cbStatusOrder.Items.Add('Просрочено');

  MainForm.cbStatusOrder.ItemIndex := 7;


end;

function TFormDM.BDDisconnect(): boolean;
begin
  if FormDM.conContn.Connected then
  begin
    if (FormDM.bInsOrder or FormDM.bInsOrderByExistCustomer) then // Если в режиме вставки или вставке на основе существующего
    begin
      FormAddOrder.Hide;
      // Восстанавливаем закладки в форме Заказа
      if (FormAddOrder.bmTblOrder <> nil) then // берем только одну закладку
      begin
        FormDM.tblOrder.GotoBookmark(FormAddOrder.bmTblOrder);
        FormDM.tblCustomer.GotoBookmark(FormAddOrder.bmTblCustomer);
        FormDM.tblItemCurrent.GotoBookmark(FormAddOrder.bmTblItemCurrent);
        //FormDM.tblPhones.GotoBookmark(FormAddOrder.bmTblPhones);
        //FormDM.tblMoney.GotoBookmark(FormAddOrder.bmTblInMoney);
      end;

      // Удаляем временный заказ
      FormDM.tblOrder.Delete;
      if FormDM.bInsOrder then
        FormDM.tblCustomer.Delete;
      FormDM.tblItemCurrent.Delete;
      //FormDM.tblPhones.Delete;
      //FormDM.tblMoney.Delete;
      // Удаляем временный заказ
    end;

      qryWorks.Active := false;
      tblItemCurrent.Active := False;
      tblItemColor.Active := False;
      tblMZD.Active := False;
      tblStatusOrder.Active := False;
      qryInWork.Active := False;
      qryInsMoney.Active := False;
      tblLR.Active := False;
      tblWorksInOrder.Active := False;
      tblWorksDop.Active := False;
      qryVirabotka.Active := False;
      qryPhoneCustomer.Active := False;
      qryAllOrdersDop.Active := false;
      tblCustStatus.Active := false;
      qryDolzhniki.Active := false;


      qryCurWorks.Active := false;
      qryByFIO.Active := False;
      qryByNumKvit.Active := False;
      qryPhoneWokers.Active := False;
      qrySum.Active := False;
      tblMoney.Active := False;
      FormDM.tblCiphers.Active := False;
      FormDM.tblTypeQuantity.Active := False;
      FormDM.tblOrder.Active := False;
      FormDM.tblCustomer.Active := False;
      FormDM.tblManager.Active := False;
      FormDM.tblPhones.Active := False;
      FormDM.tblWokers.Active := False;
      FormDM.tblPhoneType.Active := False;
      FormDM.tblGroupWork.Active := False;
      FormDM.tblItem.Active := False;
      FormDM.tblWorks.Active := False;
      FormDM.tblCrtOrders.Active := False;
      tblWorksDop.Active := False;

      FormDM.conContn.Connected:= False;
      Result := True;
    end
    else
      Result := False;
end;

function TFormDM.BDConnect(filename: string): boolean;
var
  Ini: Tinifile; // создаем переменную типа Tinifile
begin
  FormDM.conContn.Close;
  FormDM.conContn.ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+
  filename+string(';Mode=ReadWrite;Persist ') + 'Security Info=False';
  try
    FormDM.conContn.Connected:=True;

    qryWorks.Active := true;
    tblItemCurrent.Active := True;
    tblItemColor.Active := True;
    tblMZD.Active := True;
    tblStatusOrder.Active := True;
    qryInWork.Active := True;
    qryInsMoney.Active := True;
    tblLR.Active := True;
    tblWorksInOrder.Active := True;
    tblWorksDop.Active := True;
    qryVirabotka.Active := True;
    qryPhoneCustomer.Active := True;
    qryAllOrdersDop.Active := True;
    tblCustStatus.Active := true;
    qryDolzhniki.Active := true;

    qryCurWorks.Active := True;
    qryByFIO.Active := True;
    qryByNumKvit.Active := True;
    qryPhoneWokers.Active := True;
    qrySum.Active := True;
    tblMoney.Active := True;
    FormDM.tblCiphers.Active := True;
    FormDM.tblTypeQuantity.Active := True;
    FormDM.tblOrder.Active := True;
    FormDM.tblCustomer.Active := True;
    FormDM.tblManager.Active := True;
    FormDM.tblPhones.Active := True;
    FormDM.tblWokers.Active := True;
    FormDM.tblPhoneType.Active := True;
    FormDM.tblGroupWork.Active := True;
    FormDM.tblItem.Active := True;
    FormDM.tblWorks.Active := True;
    FormDM.tblCrtOrders.Active := True;
    tblWorksDop.Active := True;

    // Сохраняем путь к БД в config.ini
    //открываем файл
    Ini:=TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    Ini.WriteString('PathToBD', 'path', filename);
    Ini.Free;

    Result := True;
  except
    showmessage('Проверьте путь к БД');
    Result := False;
  end;
end;

procedure TFormDM.tblWokersAfterScroll(DataSet: TDataSet);
begin
  if tblWokers.Modified then
    tblWokers.Post;
  FormDM.qryPhoneWokers.Active := False;
  FormDM.qryPhoneWokers.Parameters[0].Value := FormDM.tblWokers.FieldByName('ID').AsInteger;
  FormDM.qryPhoneWokers.Active := True;
end;

procedure TFormDM.tblManagerAfterScroll(DataSet: TDataSet);
begin
  if tblManager.Modified then
    tblManager.Post;
  FormDM.qryPhoneManager.Active := False;
  FormDM.qryPhoneManager.Parameters[0].Value := FormDM.tblManager.FieldByName('ID').AsInteger;
  FormDM.qryPhoneManager.Active := True;
end;

procedure TFormDM.strngfldCurWorksCurWokerChange(Sender: TField);
begin
  FormDM.qryCurWorks.Post;
  // Определяем номер измененной записи
  arrChangeWorker[qryCurWorks.RecNo] := True;
end;

procedure TFormDM.dsOrderDataChange(Sender: TObject; Field: TField);
var
  i, manag: Integer;
  sum: Integer;
  Ini: Tinifile; // создаем переменную типа Tinifile
begin
  (*if Field = tblOrder.FieldByName('ID_Manager') then // если меняется статус заказа
  begin
    // Сохраняем config.ini открываем файл
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    manag := FormDM.tblOrder.FieldByName('ID_Manager').AsInteger;
    Ini.WriteInteger('MANAGERID','manager',manag);
    Ini.Free;
  end;*)

  // Проверяем правильность заполненных полей
  FormAddOrder.ColoredForm();
  if FormAddOrder.Caption = 'Редактирование заказа' then
  begin
    if Field = tblOrder.FieldByName('ID_Status') then // если меняется статус заказа
    begin
      if tblOrder.FieldByName('ID_Status').AsInteger = 3 then // Статус заказа - Выдано
      begin
        //  Нужно проверить:
        //  1. Отсутствие долга
        //  2. Проставлены специалисты
        //  3. Проставлен менеджер
        //  4. Прставлена Дата выдачи

        //  1. Отсутствие долга
        // Считаем внесенные деньги по данному заказу
        sum:=0;
        qryInsMoney.First;
        for i:=0 to qryInsMoney.RecordCount-1 do
        begin
          sum := sum + qryInsMoney.fieldByName('Sum').AsInteger;
          qryInsMoney.Next;
        end;
        if StrToInt(FormAddOrder.edtPriceWorks.text) > sum then
        begin
          tblOrder.Cancel;
          ShowMessage('Заказчик не оплатил полностью заказ!');
          FormAddOrder.dbedtPayMoney.SetFocus;
          Exit;
        end;

        //  2. Проставлены специалисты
        qryCurWorks.First;
        for i:=0 to qryCurWorks.RecordCount-1 do
        begin
          if qryCurWorks.FieldByName('ID_Woker').AsInteger = 4 then // нет специалиста
          begin
            tblOrder.Cancel;
            ShowMessage('Не проставлены специалисты!');
            FormAddOrder.dbgrdAddedWorks.SetFocus;
            Exit;
          end;
          qryCurWorks.Next;
        end;

        //  3. Проставлен менеджер
        if tblOrder.FieldByName('ID_Manager').AsInteger = 6 then // нет
        begin
          tblOrder.Cancel;
          ShowMessage('Не выбран менеджер!');
          FormAddOrder.dblkcbbInOrderCust.SetFocus;
          Exit;
        end;
        
        // 4. Простаслен менеджер выдавший
        if tblOrder.FieldByName('ID_ManagerFinish').AsInteger = 6 then // нет
        begin
          tblOrder.Cancel;
          ShowMessage('Не выбран менеджер, выдавший заказ!');
          FormAddOrder.dblkcbbManagerFinish.SetFocus;
          Exit;
        end;
      end;

      if tblOrder.FieldByName('ID_Status').AsInteger = 4 then // Статус заказа - Готово
      begin
      //  2. Проставлены специалисты
      qryCurWorks.First;
      for i:=0 to qryCurWorks.RecordCount-1 do
      begin
        if qryCurWorks.FieldByName('ID_Woker').AsInteger = 4 then // нет специалиста
          begin
            tblOrder.Cancel;
            ShowMessage('Не проставлены специалисты!');
            FormAddOrder.dbgrdAddedWorks.SetFocus;
            Exit;
          end;
          qryCurWorks.Next;
        end;

        //  3. Проставлен менеджер
        if tblOrder.FieldByName('ID_Manager').AsInteger = 6 then // нет
        begin
          tblOrder.Cancel;
          ShowMessage('Не выбран менеджер!');
          FormAddOrder.dblkcbbInOrderCust.SetFocus;
          Exit;
        end;
      end;
    end;
  end;

  //if FormAddOrder <> nil then
    //FormAddOrder.bSave := true; // сохранять
end;

procedure TFormDM.tblCustomerAfterScroll(DataSet: TDataSet);
begin
  if tblCustomer.Modified then
    tblCustomer.Post;

  FormDM.qryPhoneCustomer.Active := False;
  FormDM.qryPhoneCustomer.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.qryPhoneCustomer.Active := True;

end;

procedure TFormDM.tblManagerBeforePost(DataSet: TDataSet);
var
  strShortName: string;
  strName, strOtch: string;
begin
  strShortName := FormDM.tblManager.FieldByName('FirstName').AsString + ' ';
  strName := FormDM.tblManager.FieldByName('Names').AsString;
  // Предпологаем, что имя есть всегда
  if strName <> '' then
    strShortName := strShortName + strName[1] + '.';

  strOtch := FormDM.tblManager.FieldByName('Otchestvo').AsString;
  if strOtch <> '' then
    strShortName := strShortName + strOtch[1] + '.';

  FormDM.tblManager.FieldByName('ShortName').AsString := strShortName;
end;

procedure TFormDM.tblWokersBeforePost(DataSet: TDataSet);
var
  strShortName: string;
  strName, strOtch: string;
begin
  strShortName := FormDM.tblWokers.FieldByName('FirstName').AsString + ' ';
  strName := FormDM.tblWokers.FieldByName('Name1').AsString;
  // Предпологаем, что имя есть всегда
  if strName <> '' then
    strShortName := strShortName + strName[1] + '.';

  strOtch := FormDM.tblWokers.FieldByName('Otchestvo').AsString;
  if strOtch <> '' then
    strShortName := strShortName + strOtch[1] + '.';

  FormDM.tblWokers.FieldByName('ShortName').AsString := strShortName;
end;

procedure TFormDM.dsItemCurrentDataChange(Sender: TObject; Field: TField);
begin
  FormAddOrder.ColoredForm();
end;

procedure TFormDM.dsCurWorkDataChange(Sender: TObject; Field: TField);
begin
  FormAddOrder.ColoredForm();
end;

procedure TFormDM.dsItemCurrentUpdateData(Sender: TObject);
begin
  FormAddOrder.ColoredForm();
end;

procedure TFormDM.tblGroupWorkAfterPost(DataSet: TDataSet);
begin
  if (FormDM.tblGroupWork.FieldByName('Name1').AsString = '') Or (FormDM.tblGroupWork.FieldByName('Name1') = nil) then
    FormDM.tblGroupWork.Delete;
end;

procedure TFormDM.tblWorksAfterPost(DataSet: TDataSet);
begin
  if (FormDM.tblWorks.FieldByName('NameWork').AsString = '') Or (FormDM.tblWorks.FieldByName('NameWork') = nil) then
    FormDM.tblWorks.Delete;
end;

end.
