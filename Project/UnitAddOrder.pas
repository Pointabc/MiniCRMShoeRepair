unit UnitAddOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, DBCtrls, UnitDataModule, ComCtrls, UnitDM,
  Grids, DBGrids, Menus, ComObj, OleServer, ExcelXP, DB, IniFiles, Math;

type
  TFormAddOrder = class(TForm)
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    lbl6: TLabel;
    lblTypeWorks: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedtPayMoney: TDBEdit;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    dtpData: TDateTimePicker;
    btnAddNewOrder: TButton;
    dblkcbbItems: TDBLookupComboBox;
    lbl7: TLabel;
    dblkcbbTypePhone: TDBLookupComboBox;
    dbgrdSubWorks: TDBGrid;
    dbedtFirstName: TDBEdit;
    dbedtName: TDBEdit;
    dbedtOtchestvo: TDBEdit;
    dbgrdAddedWorks: TDBGrid;
    lbl13: TLabel;
    grPhone: TGroupBox;
    btnPhone: TButton;
    dbedtPhone1: TDBEdit;
    pmAdd: TPopupMenu;
    mniAddWork: TMenuItem;
    dbgrdPhones: TDBGrid;
    lbl14: TLabel;
    dbedtNKvit: TDBEdit;
    pmDelWork: TPopupMenu;
    mniDelWorks: TMenuItem;
    cbbGroupsWork: TComboBox;
    lbl15: TLabel;
    dbedtNumCustomer: TDBEdit;
    btnPrintOrder: TButton;
    pmDelPhone: TPopupMenu;
    NDelPhone: TMenuItem;
    edtPriceWorks: TEdit;
    lb222: TLabel;
    dblkcbbInOrderCust: TDBLookupComboBox;
    lbl16: TLabel;
    dblkcbbItemColor: TDBLookupComboBox;
    lbl17: TLabel;
    dblkcbbMZD: TDBLookupComboBox;
    dblkcbbStatusOrder: TDBLookupComboBox;
    lbl18: TLabel;
    dbgrdInsMoney: TDBGrid;
    btnInsMoney: TButton;
    pmInMoney: TPopupMenu;
    mniDelMoney: TMenuItem;
    dblkcbbLR: TDBLookupComboBox;
    lbl19: TLabel;
    dbedtSkidka: TDBEdit;
    grpMoney: TGroupBox;
    dtpTimeFinish: TDateTimePicker;
    ppSpravochnik: TPopupMenu;
    NOpenSpravochnik: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    btnSaveOrder: TButton;
    gbPrice: TGroupBox;
    Label2: TLabel;
    dblkcbbManagerFinish: TDBLookupComboBox;
    dbedtOrderPrim: TDBEdit;
    Label3: TLabel;
    btnForExistCustomer: TButton;
    btnSaveOrd: TButton;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnAddNewOrderClick(Sender: TObject);
    procedure dblkcbbGWorkCloseUp(Sender: TObject);
    procedure DeleteTmpOrder();
    procedure SaveOrder();
    procedure ColoredForm();

    // Мои методы
    function TestExistCustomer(): Boolean;
    procedure UpdateSQLWork;
    function TestFillNeeded(): Boolean;
    procedure OnAddOrder();
    procedure OnAddOrderFromExist();
    procedure OnShowEditOrder();
    procedure OnShowAddOrder();
    procedure OnShowFromExistCustomer();
    procedure OnSaveEditOrder();
    procedure CoutSum();
    procedure UpdateSearchTab();
    procedure mniAddWorkClick(Sender: TObject);
    procedure btnPhoneClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniDelWorksClick(Sender: TObject);
    procedure cbbGroupsWorkCloseUp(Sender: TObject);
    procedure btnPrintOrderClick(Sender: TObject);
    procedure NDelPhoneClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dbedtNKvitExit(Sender: TObject);
    procedure btnInsMoneyClick(Sender: TObject);
    procedure mniDelMoneyClick(Sender: TObject);
    procedure dbedtSkidkaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure NOpenSpravochnikClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure PrintOrder();
    function CreateOneMore(): Boolean;
    procedure InitForm();
    procedure btnSaveOrderClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure dbedtPayMoneyKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtPhone1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpDataChange(Sender: TObject);
    procedure btnForExistCustomerClick(Sender: TObject);
    procedure btnSaveOrdClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure dbedtFirstNameChange(Sender: TObject);
    procedure dbedtNameChange(Sender: TObject);
    procedure cbbGroupsWorkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtPhone1KeyPress(Sender: TObject; var Key: Char);
    procedure cbbGroupsWorkKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dtpDataClick(Sender: TObject);
    procedure dblkcbbInOrderCustCloseUp(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    Excel : Variant;
    WorkSheet : Variant;
    bSave: Boolean;

    // закладки Формы Создания заказа
    bmTblOrder: TBookmark;
    bmTblCustomer: TBookmark;
    bmTblItemCurrent: TBookmark;
    bmTblPhones: TBookmark;
    bmqryAllOrdersDop: TBookmark;     // закладка для вкладки Все Заказы
    bmTblInMoney: TBookmark;          // закладка внесенные деньги
  end;

var
  FormAddOrder: TFormAddOrder;

implementation

uses MainWnd, UnitLRItem, UnitItemColor, UnitItemType, UnitChipers,
  UnitPrice;

{$R *.dfm}

procedure TFormAddOrder.DeleteTmpOrder();
begin
  // переходим на временный заказ и удаляем его
  if FormDM.bInsOrder Or FormDM.bInsOrderByExistCustomer then
  begin
    // Восстанавливаем закладки
    if (FormAddOrder.bmTblOrder <> nil) then // берем только одну закладку
    begin
      FormDM.tblOrder.GotoBookmark(FormAddOrder.bmTblOrder);
      FormDM.tblCustomer.GotoBookmark(FormAddOrder.bmTblCustomer);
      FormDM.tblItemCurrent.GotoBookmark(FormAddOrder.bmTblItemCurrent);
      //FormDM.tblPhones.GotoBookmark(FormAddOrder.bmTblPhones);
      //FormDM.tblMoney.GotoBookmark(FormAddOrder.bmTblInMoney);

      // Удаляем временный заказ
      FormDM.tblOrder.Delete;
      if FormDM.bInsOrder then
        FormDM.tblCustomer.Delete;
      FormDM.tblItemCurrent.Delete;
      //FormDM.tblPhones.Delete;
      //FormDM.tblMoney.Delete;
      // Удаляем временный заказ

      FormAddOrder.bmTblOrder := nil;
      FormAddOrder.bmTblCustomer := nil;
      FormAddOrder.bmTblItemCurrent := nil;
      FormAddOrder.bmTblPhones := nil;
      FormAddOrder.bmTblInMoney := nil;
    end;
  end;
end;

procedure TFormAddOrder.InitForm();
var
  i: Integer;
begin
  Excel := null;
  //btnPrintOrder.Enabled := false;
  FormDM.bInsOrder := true;                 // Процесс создания нового заказа
  FormDM.bEditOrder := false;                // Процесс редактирования заказа
  FormDM.bInsOrderByExistCustomer := false;  // Создание заказа на основе существующего клиента
  FormDM.bAddOneMoreOrder := false;

  //bSave := false; // не сохранять

  dtpTimeFinish.Kind := dtkTime;

  FormAddOrder.bmTblOrder := nil;
  FormAddOrder.bmTblCustomer := nil;
  FormAddOrder.bmTblItemCurrent := nil;
  FormAddOrder.bmTblPhones := nil;
  FormAddOrder.bmTblInMoney := nil;

  // Заполняем значениями cbbGroupsWork - группы работ
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    if Not(FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean) then
      cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;

  // Очищаем массив - отслеживание измененных работ
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

  if FormDM.bInsOrder then    // создание нового заказа
  begin
    OnShowAddOrder();
    // Сохраняем закладки формы заказа
    FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
    FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
    FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;
    //bmqryAllOrdersDop := FormDM.qryAllOrdersDop.GetBookmark;     // закладка для вкладки Все Заказы
  end;
end;

function TFormAddOrder.TestExistCustomer(): Boolean;
var
  i, tmpIDCustomer: Integer;
  f,n,o, test: string;
  bRes: Boolean;
  SavePlace, SavePlace1: TBookmark;
begin
  //Result := false;
  if formDM.bInsOrderByExistCustomer then // bFromSearch then
  begin
    Result := True;
    Exit;
  end;

  // Изменяем на время запись Клиента (к Фамилии добавляем # )
  f := dbedtFirstName.Text;
  n := dbedtName.Text;
  o := dbedtOtchestvo.Text;

  FormDM.tblCustomer.Edit;
  FormDM.tblCustomer.FieldByName('FirstName').AsString := f+'#';
  FormDM.tblCustomer.Post;
  test := FormDM.tblCustomer.FieldByName('FirstName').AsString;

  SavePlace := FormDM.tblCustomer.GetBookmark;
  if o <> '' then
    bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f, n, o]), [] )
  else
    bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f, n]), [] );

  if not(bRes) then // не найдено
  begin
    // Восстанавливаем
    FormDM.tblCustomer.Edit;
    FormDM.tblCustomer.FieldByName('FirstName').AsString := f;
    FormDM.tblCustomer.Post;
    //Result := false;
  end
  else  // найдено
  begin
    SavePlace1 := FormDM.tblCustomer.GetBookmark;
    // Сохраняем ID найденного заказчика
    tmpIDCustomer := FormDM.tblCustomer.fieldByName('ID').AsInteger;
    FormDM.tblCustomer.GotoBookmark(SavePlace);
    // Перед удалением присоединить добавленные телефоны к найденному (дубли телефонов пока оставляем)
    // 1. Применяем фильтр к таблице Телефоны
    FormDM.tblPhones.Filtered := true;
    FormDM.tblPhones.Filter := 'ID_Customer='+IntToStr(FormDM.tblCustomer.fieldByName('ID').AsInteger);
    FormDM.tblPhones.First;
    for i:=0 to FormDM.tblPhones.RecordCount-1 do
    begin
      FormDM.tblPhones.Edit;
      FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := tmpIDCustomer;
      FormDM.tblPhones.Next;
    end;
    // Tут будем удалять дубли телефонов заказчика
    // Tут будем удалять дубли телефонов заказчика
    
    // удаляем дубль заказчика
    FormDM.tblPhones.Filtered := false;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;
    FormDM.tblCustomer.Delete;
    //FormDM.tblCustomer.Edit;
    //FormDM.tblCustomer.FieldByName('FirstName').AsString := f;
    //FormDM.tblCustomer.Post;
    FormDM.tblCustomer.GotoBookmark(SavePlace1);
    //Result := true;
  end;

  FormDM.tblCustomer.FreeBookmark(SavePlace);
  FormDM.tblCustomer.FreeBookmark(SavePlace1);

  if bRes then
    Result := True
  else
    Result := False;

  // Создаем тестовый запрос и проверяем колво записей
  FormDM.qryTest.Active := False;
  FormDM.qryTest.SQL.Clear;

  FormDM.qryTest.SQL.Add('SELECT Customer.FirstName, Customer.Name1, Customer.Otchestvo, Customer.ID FROM Customer');
  FormDM.qryTest.SQL.Add('WHERE ((Customer.FirstName=:FirstName) AND (Customer.Name1=:Name1)');
  FormDM.qryTest.SQL.Add('AND (Customer.Otchestvo=:Otchestvo));');
  // Устанавливаем значения параметров
  FormDM.qryTest.Parameters[0].Value := dbedtFirstName.Text;  //'Скороговоров';
  FormDM.qryTest.Parameters[1].Value := dbedtName.Text;       //'Илья';
  FormDM.qryTest.Parameters[2].Value := dbedtOtchestvo.Text;  //'Прокофьевич';
  FormDM.qryTest.Active := true;
end;

procedure TFormAddOrder.FormShow(Sender: TObject);
var
  i:Integer;
begin
  (*// Обновляем группы работ и работы
  // Заполняем значениями cbbGroupsWork - группы работ
  cbbGroupsWork.Clear;
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;*)


  // Возвращаемся к закладкам в следующих таблицах
  // 1. tblOrder    - Заказ
  // 2. tblCustomer - Заказчик
  // 3. tblItemCurrent - текущее изделие
  // 4. tblPhones - телефон заказчика
  // 5. tblManager
  // 6.
  // ...
  // Обновляем запросы
  // 1. qryCurWorks - добавленные работы
  // 2. qryInMoneyPrihod - поступившие деньги по номеру заказа
  // 3.

  //dtpTimeFinish.Kind := dtkTime;
  //btnPrintOrder.Enabled := false;

  // Очищаем массив - отслеживание измененных работ
  //for i:=1 to 50 do
    //FormDM.arrChangeWorker[i] := False;

  // Заполняем значениями cbbGroupsWork - группы работ
  (*FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;*)

  // начинаем транзакцию
  //FormDM.conContn.BeginTrans;

  (*if FormDM.bEditOrder then   // редактирование
    OnShowEditOrder();
  if FormDM.bInsOrder then    // создание нового заказа
    OnShowAddOrder();
  if FormDM.bInsOrderByExistCustomer then
    OnShowFromExistCustomer();*)
end;

// Очистить бланк заказа
procedure TFormAddOrder.btnAddNewOrderClick(Sender: TObject);
begin
  (*if bSave then
  begin
    ShowMessage('Сохраните заказ!');
    //FormAddOrder.Show;
    Exit;
  end;*)

  if FormDM.bInsOrder OR FormDM.bInsOrderByExistCustomer then
  begin
    // Удалить временный заказ и открыть редактируемый
    // (возможно придется спросить у пользователя, удалять или нет?)
    FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

    FormDM.bInsOrder := true;                 // Процесс создания нового заказа
    FormDM.bEditOrder := false;                // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    OnShowAddOrder();
  end
  else  // находимся в режиме редактирования
  begin
    FormDM.bInsOrder := true;                 // Процесс создания нового заказа
    FormDM.bEditOrder := false;                // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    OnShowAddOrder();
  end;

  /// Обновляем все заказы
  FormDM.qryAllOrdersDop.Active := False;
  FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersSrart.DateTime);
  FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersEnd.DateTime);
  FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
  FormDM.qryAllOrdersDop.Active := True;
end;

procedure TFormAddOrder.dblkcbbGWorkCloseUp(Sender: TObject);
begin
  FormDM.qrySubWorks.Active := False;
  FormDM.qrySubWorks.SQL.Clear;
  FormDM.qrySubWorks.SQL.Add('SELECT Works.NameWork, Works.PerionGaranty, Works.Price ');
  FormDM.qrySubWorks.SQL.Add('FROM Works INNER JOIN GroupeWork ON Works.ID_GroupWork = GroupeWork.ID');
  FormDM.qrySubWorks.SQL.Add('WHERE (([GroupeWork]![ID]=:subworks));');
  FormDM.qrySubWorks.Parameters[0].Value := FormDM.tblGroupWork.FieldByName('ID').AsInteger;
  //FormDM.qrySubWorks.SQL.Add(FormDM.tblGroupWork.FieldByName('ID').AsString+'));');
  FormDM.qrySubWorks.Active := True;
end;

procedure TFormAddOrder.mniAddWorkClick(Sender: TObject);
var
  fld,val: string;
begin
  if FormDM.qrySubWorks.RecordCount <> 0 then
  begin
    // Проверяем есть ли такая работа в списке добавленных работ

    // Добавляем запись Конкретные заказы
    FormDM.tblCrtOrders.Append;
    FormDM.tblCrtOrders.AppendRecord([nil,null,FormDM.tblOrder.FieldByName('ID').AsInteger]);

    // Добавляем работу к Заказу
    fld := 'NameWork';
    val := FormDM.qrySubWorks.FieldByName('NameWork').AsString;
    FormDM.tblWorks.Locate(fld,val,[]);

    FormDM.tblCrtOrders.Edit;
    FormDM.tblCrtOrders.FieldByName('ID_Work').AsInteger := FormDM.tblWorks.FieldByName('ID').AsInteger;
    FormDM.tblCrtOrders.FieldByName('ID_Woker').AsInteger := 4; // по умолчанию = нет
    FormDM.tblCrtOrders.Post;

    // Обновляем запрос выводящий работы
    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;

    //FormDM.tblCrtOrders.Post;
    CoutSum();
    //bSave := true; // сохранять

    // Добавляем запись в табл ItemCurrent для текущего заказа
    // Название вещи = 3 = нет; 2 = Мужские; Цвет = 6 = нет
(*    FormDM.tblItemCurrent.AppendRecord([nil, 1, 6, 2,
                                        FormDM.tblOrder.FieldByName('ID').AsInteger,
                                        FormDM.tblWorks.FieldByName('ID').AsInteger ]);

    // Устанавливаем фокус на ввод параметров ремонтируемого изделия
    dblkcbbItems.SetFocus;

    // Coхраняем предмет заказа
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;
*)

    // Проверяем заполнены ли нужные поля if нет кнопка не активна, иначе актививна
    //if TestFillNeeded then
    //  btnPrintOrder.Enabled := True;

    // Добавляем запись в таблицу Money
    //FormDM.tblMoney.Append;
    //FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    //FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    //FormDM.tblMoney.FieldByName('Sum').AsCurrency := FormDM.qryCurWorks.FieldByName('Price').AsCurrency;
    //FormDM.tblMoney.Post;

    // Вычисляем стоимость работ для данного заказа
    //FormDM.qrySum.Active := False;
    //FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    //FormDM.qrySum.Active := True;

  end;

end;

procedure TFormAddOrder.btnPhoneClick(Sender: TObject);
begin
  // Добавляем телефон заказчику
  if dbedtPhone1.Text <> '' then
  begin
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // по умолчанию сотовый
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;
    FormDM.qryCustPhones.Active := False;
    FormDM.qryTest.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := true;
  end;

end;

procedure TFormAddOrder.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormAddOrder.Hide;
  //ShowMessage('Закрываем окно Заказа');
  // При закрытии возможны следующие варианты
  // 1. Форму открыли и тут же закрыли. (Удаляем созданные таблицы)
  // 2. В форму вносились данные о заказе.

  // Распечатать?
  (*if Application.MessageBox('После закрытия, Заказ будет удален!!!', 'Закрыть заказ?', MB_YESNO) = IDYES	then
  begin
    // Удаляем созданные записи
    // Возвращаемся к закладкам в следующих таблицах
    // 1. tblOrder    - Заказ
    // 2. tblCustomer - Заказчик
    // 3. tblItemCurrent - текущее изделие
    // 4. tblPhones - телефон заказчика
    // 5.
    // 6.
    // ...

    if Not(FormDM.bInsOrderByExistCustomer Or FormDM.bEditOrder Or FormDM.bAddOneMoreOrder) then
    begin
      FormDM.tblOrder.Delete;
      if FormDM.bInsOrder then
        FormDM.tblCustomer.Delete;
      FormDM.tblItemCurrent.Delete;
      FormDM.tblPhones.Delete;
    // и возвращаемся к закладкам в таблицах(...)
    end;
  end;

  // Сбрасываем флаги
  FormDM.bInsOrder := false;                 // Процесс создания нового заказа
  FormDM.bEditOrder := false;                // Процесс редактирования заказа
  FormDM.bInsOrderByExistCustomer := false;
  FormDM.bAddOneMoreOrder := false;

  // Обновляем запрос выводящий работы
  FormDM.qryCurWorks.Active := False;
  FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryCurWorks.Active := true;

  FormDM.qryAllOrdersDop.Active := false;
  FormDM.qryAllOrdersDop.Active := true;*)

  //FormAddOrder.Hide;
  //Exit;
  
end;

procedure TFormAddOrder.mniDelWorksClick(Sender: TObject);
var
  fld: string;
  val: string;
  b: Boolean;
begin  // в редактировании
  // Удалить добавленную работу
  if FormDM.qryCurWorks.RecordCount <> 0 then
  begin
    // Определяем ID работы
    fld := 'NameWork';
    val := FormDM.qryCurWorks.FieldByName('NameWork').AsString;

    if FormDM.tblWorksDop.Locate(fld,val,[]) then
    begin
      b:=FormDM.tblCrtOrders.Locate('ID_Work;ID_Order',VarArrayOf([FormDM.tblWorksDop.FieldByName('ID').AsInteger, FormDM.tblOrder.FieldByName('ID').AsInteger]),[]);
      if b then
        FormDM.tblCrtOrders.Delete;
    end;
    // Обновляем запрос выводящий работы
    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;
    // Пересчитаем общую сумму
    CoutSum();
    //bSave := true; // сохранять
  end;
end;

// Обновляем работы в конкретной группе
procedure TFormAddOrder.cbbGroupsWorkCloseUp(Sender: TObject);
begin
  UpdateSQLWork;
end;

procedure TFormAddOrder.UpdateSQLWork;
begin
  if FormDM.conContn.Connected then
  begin
    FormDM.qrySubWorks.Active := False;
    FormDM.tblGroupWork.Locate('Name1',cbbGroupsWork.Items[cbbGroupsWork.ItemIndex],[]);
    //FormDM.tblGroupWork.Locate('Name1',DBCBGroupeWork.Text,[]);
    FormDM.qrySubWorks.Parameters[0].Value := FormDM.tblGroupWork.FieldByName('ID').AsInteger;
    FormDM.qrySubWorks.Active := True;
  end;
end;

procedure TFormAddOrder.btnPrintOrderClick(Sender: TObject);
begin
  PrintOrder();
  SaveOrder();
end;

procedure TFormAddOrder.NDelPhoneClick(Sender: TObject);
var
  b: Boolean;
begin
  // Удаляем телефон клиента
  if FormDM.qryCustPhones.RecordCount <> 0 then
  begin
    b := FormDM.tblPhones.Locate('Phone;ID_Customer',VarArrayOf([FormDM.qryCustPhones.FieldByName('Phone').AsInteger, FormDM.tblOrder.FieldByName('ID_Customer').AsInteger]),[]);
    if b then
    begin
      FormDM.tblPhones.Delete;
    end;
    // Обновляем запрос выводящий работы
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID_Customer').AsInteger;
    FormDM.qryCustPhones.Active := true;

    // Перемещаемся на запись без телефона
    FormDM.tblPhones.Locate('Phone;ID_Customer',VarArrayOf([null, FormDM.tblOrder.FieldByName('ID_Customer').AsInteger]),[]);
  end;
end;

procedure TFormAddOrder.FormCreate(Sender: TObject);
begin
  InitForm();
end;

procedure TFormAddOrder.dbedtNKvitExit(Sender: TObject);
begin
  
end;

// Проверяем заполнены ли нужные поля if нет кнопка не активна, иначе актививна
function TFormAddOrder.TestFillNeeded(): Boolean;
var
  bRes: Boolean;
  //tmpstr: string;
begin
  if (dbedtFirstName.Text <> '') and (dbedtName.Text <> '') and (dbedtNKvit.Text <> '') and (dbedtNumCustomer.Text <> '') and (FormDM.qryCurWorks.RecordCount <> 0) then
    bRes := True
  else
  begin
    //ShowMessage('Внесите ФИО заказчика или добавье работы к заказу!');
    ShowMessage('Не все поля заполнены!');
    bRes := False;
    dbedtFirstName.SetFocus;
    Exit;
  end;

  //  4. Прставлена Дата выдачи
  //if dtpData.Date < StrToDateTime('30.12.1990') then
  //begin
    //ShowMessage('Проставьте дату выдачи!');
    //FormAddOrder.dtpData.SetFocus;
    //bRes := False;
  //end;

  //  3. Проставлен менеджер
  if FormDM.tblOrder.FieldByName('ID_Manager').AsInteger = 6 then // нет
  begin
    //ShowMessage('Не выбран менеджер!');
    ShowMessage('Не все поля заполнены!');
    dblkcbbInOrderCust.SetFocus;
    bRes := False;
    Exit;
  end;

  (*if FormDM.bInsOrder then
  begin
    if bRes then
    begin
      if Application.MessageBox('Дату выдачи заказа верна?', 'Уточнение даты выдачи', MB_YESNO) = IDNO	then
      begin
        FormAddOrder.dtpData.SetFocus;
        bRes := False;
      end;
      if bRes then // Изделие проставлено?
      begin
        if Application.MessageBox('Изделие установлено верно?', 'Уточнение изделия', MB_YESNO) = IDNO	then
        begin
          FormAddOrder.dblkcbbItems.SetFocus;
          bRes := False;
        end;
      end;
    end;
  end;*)

  Result := bRes;
end;

procedure TFormAddOrder.btnInsMoneyClick(Sender: TObject);
begin
  // Добавляем внесенные деньги заказчику
  if (dbedtPayMoney.Text <> '') and (dbedtPayMoney.Text <> '0') then
  begin
    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // Добавляем запись в таблицу Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    // Внесенные суммы
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := True;

    // в статус
    FormDM.qryInMoneyPrihod.Active := False;
    FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
    FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',Now());
    FormDM.qryInMoneyPrihod.Active := True;

    MainForm.StatusBar1.Panels[0].Text := 'Приход за сегодня: ' + formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
  end;
end;

procedure TFormAddOrder.OnAddOrder;
var
  i: Integer;
  numK, numC : Integer;
  Ini: Tinifile;
  //f,o,name: string;
  //bRes: Boolean;
begin
  // Проверки корректности заполненных полей
  //if TestFillNeeded() then
  //begin
    // Очищаем массив - отслеживание измененных работ
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    // Устанавливаем время выдачи 19:00
    //dtpTimeFinish.Time := SetTime('19:00:00');

    // Создаем запись в таблицу Customer
    // 1. Проверяем есть ли такой клиент (полная проверка ФИО)
    //    Если есть удаляем созданную запись и делаем ссылку на старого клиента

    if TestExistCustomer() then
    begin
      FormDM.tblOrder.Edit;
      FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
      if FormDM.tblOrder.Modified then
        FormDM.tblOrder.Post;
    end
    else  // значит новый клиент
    begin
      // Сохраняем config.ini открываем файл
      Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
      numC := FormDM.tblCustomer.FieldByName('NumCustomer').AsInteger + 1;
      Ini.WriteInteger('NUMCUSTOMER','numC',numC);
      Ini.Free;
    end;

    // Если сумма = 0 или пусто - удаляем
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;
    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // Если телефон не ввели удаляем запись
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // и сохраняем
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // и сохраняем (пока сохраняем всегда, даже если = 0 руб.)

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // сохраняем дату+время заказа выдачи заказа
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // Добавляем запись в таблицу WorkerInOrder (сколько работ столько и записей)
    FormDM.qryCurWorks.First;
    for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
    begin
      FormDM.tblWorksInOrder.Append;
      FormDM.tblWorksInOrder.FieldByName('ID_Worker').AsInteger := FormDM.qryCurWorks.FieldByName('ID_Woker').AsInteger;
      FormDM.tblWorksInOrder.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.tblWorksInOrder.FieldByName('ID_Works').AsInteger := FormDM.qryCurWorks.FieldByName('Works.ID').AsInteger;

      FormDM.tblWorksInOrder.FieldByName('Data1').AsDateTime := Date;
      FormDM.tblWorksInOrder.FieldByName('Time1').AsDateTime := Time;
      FormDM.qryCurWorks.Next;
    end;

    // сохраняем
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // сохраняем Номер Квитанции в config.ini
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numK := FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger + 1;
    Ini.WriteInteger('NUMKVIT','numK',numK);
    Ini.Free;

    // Сохраняем вещь
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // Обновляем запросы во вкладке поиск
    UpdateSearchTab();

    // Распечатать?
    //if Application.MessageBox('Распечатать квитанцию?', 'Распечатать?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bInsOrder := False;
    //FormDM.bAddOneMoreOrder := true;

    FormDM.tmpF := dbedtFirstName.text;
    FormDM.tmpN := dbedtName.Text;
    FormDM.tmpO := dbedtOtchestvo.Text;
  //end // Если все необходимые поля заполнены КОНЕЦ условия
  //else
    //Exit;

  //FormAddOrder.Close;
end;

procedure TFormAddOrder.OnShowEditOrder;
var
  i:Integer;
begin
  dblkcbbStatusOrder.ReadOnly := false;
  dblkcbbManagerFinish.ReadOnly := false;
  
  dtpData.Color := clWindow;
  if FormDM.conContn.Connected then
  begin
    // Очищаем массив - отслеживание измененных работ
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

   Caption := 'Редактирование заказа';
    //btnAddNewOrder.Caption := 'Сохранить заказ';
    dtpData.Date := FormDM.tblOrder.fieldByName('DataFinish').AsDateTime;
    dtpTimeFinish.ShowCheckbox := true;
    dtpTimeFinish.Time := FormDM.tblOrder.fieldByName('TimeFinish').AsDateTime;

    // Переходим к нужной записи заказчика (всегда есть)
    FormDM.tblCustomer.Locate('ID', FormDM.tblOrder.FieldByName('ID_Customer').AsInteger, []);

    // Создаем запись в табл Телефоны
    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // по умолчанию сотовый
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;
    // Создаем связь c табл Phone & Customer
    FormDM.tblPhones.Edit;
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // Заполняем телефоны
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := true;

    // Добавляем запись в таблицу Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    // Обновляем запрос, выводящий внесенные суммы
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := true;

    FormDM.qrySum.Active := False;
    FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qrySum.Active := True;

    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;

    // Обновляем запрос телефоны
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := True;

    CoutSum();
    UpdateSQLWork;

    // Обновляем все заказы
    FormDM.qryAllOrdersDop.Active := False;
    FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersSrart.DateTime);
    FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersEnd.DateTime);
    FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
    FormDM.qryAllOrdersDop.Active := True;

    // Перемещаемся на запись в табл ItemCurrent (1 запись для 1 заказа!!!)
    FormDM.tblItemCurrent.Locate('ID_Order', FormDM.tblOrder.FieldByName('ID').AsInteger, []);

    // Сохраняем закладки формы Заказа
    FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
    FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
    FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;

    //ColoredForm();
  end;
  //dblkcbbStatusOrder.ReadOnly := false;
end;

procedure TFormAddOrder.mniDelMoneyClick(Sender: TObject);
var
  b: Boolean;
begin
  // Удаляем внесенную сумму
  if FormDM.qryInsMoney.RecordCount <> 0 then
  begin
    b := FormDM.tblMoney.Locate('Sum;Data1;ID_Order',
                                VarArrayOf([FormDM.qryInsMoney.FieldByName('Sum').AsCurrency,
                                FormDM.qryInsMoney.FieldByName('Data1').AsDateTime,
                                FormDM.tblOrder.FieldByName('ID').AsInteger]), []);
    if b then
      FormDM.tblMoney.Delete;

    // Обновляем запрос, выводящий внесенные суммы
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := true;

    // Перемещаемся на запись без суммы
    FormDM.tblMoney.Locate('Sum;ID_Order',
                            VarArrayOf([null,
                            FormDM.tblOrder.FieldByName('ID').AsInteger]),[]);
  end;
end;

procedure TFormAddOrder.CoutSum();
var
  sum, sumSkidka, sumRes: Currency;
  i: Integer;
begin
  sum := 0;
  sumSkidka := 0;     // сумма скидки
  //sumOcenkaItem := 0; // сумма оценки изделия

  FormDM.qryCurWorks.First;
  for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
  begin
    sum := sum + FormDM.qryCurWorks.FieldByName('Price').AsCurrency;
    FormDM.qryCurWorks.Next;
  end;
  // + учитываем скидку
  if FormDM.tblOrder.Modified then
    FormDM.tblOrder.Post;

  SetRoundMode(rmDown);  
  if FormDM.tblOrder.FieldByName('Skidka').AsInteger <> 0 then
  begin
    i := Round(sum*FormDM.tblOrder.FieldByName('Skidka').AsInteger/100);
    i := Round(i/10)*10;
    sumSkidka := i; //SimpleRoundTo(sum*FormDM.tblOrder.FieldByName('Skidka').AsInteger/100, -1);
  end;

  sumRes := sum - sumSkidka;
  // выводим Итоговую сумму
  edtPriceWorks.Text := CurrToStr(sumRes);
end;

procedure TFormAddOrder.dbedtSkidkaKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.Post;
    CoutSum();
  end;
end;

procedure TFormAddOrder.UpdateSearchTab();
begin
  if MainForm.rbNumberCustomer.Checked then    // по номеру клиента
  begin
    FormDM.qryByNumCust.Active := False;
    FormDM.qryByNumCust.Parameters[0].Value := StrToInt(MainForm.edtSearch.Text);
    FormDM.qryByNumCust.Active := true;

    FormDM.qryByNumKvit.Active := False;
    FormDM.qryByFIO.Active := False;
  end;
  if MainForm.rbByDefault.Checked then   // по Фамилии
  begin
      FormDM.qryByFIO.Active := False;
      FormDM.qryByFIO.Parameters[0].Value := MainForm.edtSearch.Text;
      FormDM.qryByFIO.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumCust.Active := False;
    end;

    if MainForm.rbByNumKvitan.Checked then   // По номеру квитанции
    begin
      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumKvit.Parameters[0].Value := StrToInt(MainForm.edtSearch.Text);
      FormDM.qryByNumKvit.Active := true;

      FormDM.qryByNumCust.Active := False;
      FormDM.qryByFIO.Active := False;
    end;

end;

procedure TFormAddOrder.NOpenSpravochnikClick(Sender: TObject);
begin
  if dblkcbbLR.Focused then
    frmLR.ShowModal;
  if dblkcbbItemColor.Focused then
    frmItemColor.ShowModal;
  if dblkcbbItems.Focused then
    frmItemType.ShowModal;
  if cbbGroupsWork.Focused then
    FormPrice.ShowModal;
    
end;

procedure TFormAddOrder.N2Click(Sender: TObject);
begin
  FormChiper.ShowModal;

  // Обновить добавленные в заказ работы
  FormDM.qryCurWorks.Active := False;
  FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryCurWorks.Active := true;
end;

procedure TFormAddOrder.N4Click(Sender: TObject);
var
  i:Integer;
  s, s1: string;
begin
  FormPrice.ShowModal;

  // Обновляем группы работ и работы
  // Заполняем значениями cbbGroupsWork - группы работ
  cbbGroupsWork.Clear;
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    if Not(FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean) then
      cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  if FormPrice.bm <> nil then
    FormDM.tblGroupWork.GotoBookmark(FormPrice.bm);

  for i:=0 to cbbGroupsWork.Items.Count-1 do
  begin
    cbbGroupsWork.ItemIndex := i;
    s := cbbGroupsWork.Text;
    s1 := FormDM.tblGroupWork.FieldByName('Name1').AsString;
    if s = s1 then
    begin
      UpdateSQLWork;
      Break;
    end;
  end;
  // Обновляем виды работ

end;

procedure TFormAddOrder.PrintOrder();
var
  numKvit, path: string;
  f, name1, o, fio: string;
  data1, data2: string;
  tmpstr, tmp, codes: string;
  i,cnt, dgt, dgt2, dop, dop1, summ: Integer;
  cur, skdka: Currency;
  skidka: Currency;
  data: TDateTime;
begin
  // Проверяем заполнены ли нужные поля if нет кнопка не активна, иначе актививна
  if TestFillNeeded then
  begin
    // Копируем шаблон и открываем и заполняем копию xls
    Excel := CreateOleObject('Excel.Application');
    Excel.Visible := False;
    Excel.Workbooks.Open( ExtractFilePath(Application.ExeName)+'\blanks\template.xls' );

    f := FormDM.tblCustomer.fieldByName('FirstName').AsString;
    name1 := FormDM.tblCustomer.fieldByName('Name1').AsString;
    o := FormDM.tblCustomer.fieldByName('Otchestvo').AsString;
    fio := Trim(f + ' ' + name1 + ' ' + o);
    fio := TrimRight(fio);

    tmp := FormatDateTime('dd.mm.yyyy tt',Now());
    for dgt:= 1 to length(tmp) do if tmp[dgt] = ':' then tmp[dgt]:= '-';
    Excel.ActiveWorkBook.SaveAs( ExtractFilePath(Application.ExeName)+'crtblanks\'+ fio + ' ' + tmp +'.xls' );
    path := ExtractFilePath(Application.ExeName)+'crtblanks\'+ fio + ' ' + tmp +'.xls';

    // Заполняем значения
    numKvit := FormDM.tblOrder.fieldByName('NumberKvitancii').AsString;
    //Excel.Range['W1'] := 'КВИТАНЦИЯ № ' + numKvit;
    Excel.Range['AJ2'] := '№ ' + numKvit;
    Excel.Range['BL20'] := 'Квит. № ' + numKvit;
    //Excel.Range['CA19'] := numKvit;
    //Excel.Range['CA27'] := numKvit;
    Excel.Range['CD1'] := 'Гарантия _____ дней. Квит. № ' + numKvit; // в гарантийник

    // Дата приема
    data1 := FormDM.tblOrder.fieldByName('DateStart').AsString;
    Excel.Range['BP2'] := data1;
    Excel.Range['C19'] := 'Дата приема: ' + data1; // в центральную часть
    //Excel.Range['CE1'] := 'Дата выдачи __________';// в гарантийник

    // Дата + время выдачи
    data1 := DateToStr(dtpData.Date);
    Excel.Range['BP3'] := data1;
    Excel.Range['C20'] := 'Дата выдачи: ' + data1;

    // заказчик
    f := FormDM.tblCustomer.fieldByName('FirstName').AsString;
    name1 := FormDM.tblCustomer.fieldByName('Name1').AsString;
    o := FormDM.tblCustomer.fieldByName('Otchestvo').AsString;
    fio := Trim(f + ' ' + name1 + ' ' + o);
    fio := TrimRight(fio);
    Excel.Range['A4'] := 'Заказчик: ' + fio + ' Номер клиента ' + FormDM.tblCustomer.FieldByName('NumCustomer').AsString;
    Excel.Range['CG19'] := 'Зак.: ' + fio;

    // Телефон
    if FormDM.qryCustPhones.RecordCount <> 0 then
      tmpstr := FormDM.qryCustPhones.fieldByName('Phone').AsString // + ' ' +
    else
      tmpstr := 'нет';

    Excel.Range['W19'] := 'Заказчик: ' + fio + ' ' +
                          FormDM.tblCustomer.FieldByName('NumCustomer').AsString +
                          '; тел. ' + tmpstr; // в центральную часть ФИО+тел
    Excel.Range['A5'] := 'Телефон: ' + tmpstr;

    // Изделие
    Excel.Range['J8'] := dblkcbbItems.Text;
    // Цвет
    Excel.Range['J9'] := dblkcbbItemColor.Text;
    // Левый/правый
    Excel.Range['J10'] := dblkcbbLR.Text;
    // МЖД
    Excel.Range['J11'] := dblkcbbMZD.Text;
    // Изделие в центральную часть
    Excel.Range['W20'] := dblkcbbItems.Text + '; ' + dblkcbbItemColor.Text + '; ' +
                          dblkcbbMZD.Text + '; ' + dblkcbbLR.Text; // в центральную часть

    // Скидка
    SetRoundMode(rmDown);
    if dbedtSkidka.Text = '' then
      skdka := 0
    else
      skdka := StrToCurr(dbedtSkidka.Text);

    cur := 100 - skdka;
    if cur <> 0 then
    begin
      i:= Round(skdka * StrToCurr(edtPriceWorks.text) / cur);
      i:= Round(i/10)*10;
      skidka := i; //StrToCurr(dbedtSkidka.Text) * StrToCurr(edtPriceWorks.text) / cur;
      Excel.Range['C16'] := 'Скидка %: ' + CurrToStr(skdka) + ' Сумма скидки руб.: '+ CurrToStr(skidka);
    end
    else
    begin
      summ := 0;
      FormDM.qryCurWorks.First;
      for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
      begin
        summ := summ+FormDM.qryCurWorks.FieldByName('Price').AsInteger;
        FormDM.qryCurWorks.Next;
      end;
      skidka := summ;
      Excel.Range['C16'] := 'Скидка %: ' + CurrToStr(skdka) + ' Сумма скидки руб.: '+ CurrToStr(skidka);
    end;

    // Менеджер
    if dblkcbbInOrderCust.Text <> '' then
    begin
      Excel.Range['AJ5'] := 'Принял: ' + dblkcbbInOrderCust.Text;
      Excel.Range['B30'] := 'Принял: ' + dblkcbbInOrderCust.Text;
    end
    else
    begin
      Excel.Range['AJ4'] := 'Принял: нет';
      Excel.Range['B30'] := 'Принял: нет';
    end;

    // таблица работ
    cnt := 0;
    dgt := 8;   // для оригинала
    dgt2 := 21; // для средней части
    codes := '';
    SetRoundMode(rmUp);
    dop1 := StrToInt(edtPriceWorks.text); // Общая стоимость работ
    FormDM.qryCurWorks.First;
    for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
    begin
      // Вычисляем стоимость работы со скидкой
      //cur := 100 - skdka; вроде не меняется
      if (dbedtSkidka.Text = '0') Or (dbedtSkidka.Text = '') then
      begin
        //dop1 := FormDM.qryCurWorks.FieldByName('Price').AsInteger;
        dop:= FormDM.qryCurWorks.FieldByName('Price').AsInteger;
        //dop1 := dop1-dop;
      end
      else
      begin
        //dop1 := Round(FormDM.qryCurWorks.FieldByName('Price').AsCurrency * cur/100);
        dop:= Round(FormDM.qryCurWorks.FieldByName('Price').AsCurrency * cur/100);
        dop:= Round(dop/10)*10;
      end;
      if i = FormDM.qryCurWorks.RecordCount-1 then
        dop := dop1
      else
        dop1 := dop1-dop;
      // Вычисляем стоимость работы со скидкой

      //codes := codes + FormDM.qryCurWorks.fieldByName('Ciphers.Name1').AsString + ' '; // собираем все шифры
      tmpstr := FormDM.qryCurWorks.fieldByName('GroupeWork.Name1').AsString + ' ' +
                FormDM.qryCurWorks.fieldByName('NameWork').AsString;// + '; ' +
                //FormDM.qryCurWorks.fieldByName('Ciphers.Name1').AsString;// + '; ' +
                //FormDM.qryCurWorks.fieldByName('PerionGaranty').AsString;

      tmp := 'X'+IntToStr(dgt);   // наименование работы
      Excel.Range[tmp] := tmpstr;
      tmp := 'BZ'+IntToStr(dgt);
      Excel.Range[tmp] := FormDM.qryCurWorks.fieldByName('Price').AsString + ',00';

      // заносим в среднюю часть
      tmp := 'I'+IntToStr(dgt2);
      tmpstr := tmpstr + '; ' + CurrToStr(dop) + ' руб.'; // + ' - ' + FormDM.qryCurWorks.fieldByName('CurWoker').AsString;
      Excel.Range[tmp] := tmpstr;

      FormDM.qryCurWorks.Next;
      if cnt = 8 then // максимум 8 работ в квитанции
        Break;
      cnt := cnt + 1;
      dgt := dgt + 1;
      dgt2 := dgt2 + 1;  //для средней части
    end;

    // Сумма Итого
    if Pos(',', edtPriceWorks.Text) = 0 then
    begin
      Excel.Range['BZ16'] := edtPriceWorks.Text + ',00';
      Excel.Range['Z29'] := 'Общая сумма: ' + edtPriceWorks.Text + ',00 руб.';
    end
    else
    begin
      Excel.Range['BZ16'] := edtPriceWorks.Text;
      Excel.Range['Z29'] := 'Общая сумма: ' + edtPriceWorks.Text + ' руб.';
    end;

    // Отрывная средняя часть
    Excel.Range['CA19'] := 'Кв. № '+ numKvit + ', Кл. ' + FormDM.tblCustomer.fieldByName('NumCustomer').AsString;
    //Excel.Range['CA26'] := 'Кв. № '+ numKvit + ', Кл. ' + FormDM.tblCustomer.fieldByName('NumCustomer').AsString;
    Excel.Range['CC19'] := 'шф ' + codes; // шифры
    //Excel.Range['CC26'] := 'шф ' + codes; // шифры
    // Стоимость заказа
    if Pos(',', edtPriceWorks.Text) = 0 then
    begin
      //Excel.Range['CD26'] := 'Цена: ' + edtPriceWorks.Text + ',00';
      Excel.Range['CD19'] := 'Цена: ' + edtPriceWorks.Text + ',00';
    end
    else
    begin
      //Excel.Range['CD26'] := 'Цена: ' + edtPriceWorks.Text;
      Excel.Range['CD19'] := 'Цена: ' + edtPriceWorks.Text;
    end;
    // Дата выдачи
    Excel.Range['CE19'] := 'Дата выд.: ' + DateToStr(dtpData.Date);
    //Excel.Range['CE26'] := 'Дата выд.: ' + DateToStr(dtpData.Date);
    // Время выдачи
    //dtpTimeFinish.Format := 'HH:mm';
    data2 := TimeToStr(dtpTimeFinish.Time);
    if Length(data2)>5 then
      data2 := Copy(data2,0,5);
    Excel.Range['CF19'] := 'Врм. выд.: ' + data2; 
    Excel.Range['CH1'] := 'Время выдачи: ' + data2;
    //Excel.Range['CF26'] := 'Врм. выд.: ' + data2; //TimeToStr(dtpTimeFinish.Time);

    // Получаем долг заказчика
    cnt := 0;
    FormDM.qryInsMoney.First;
    for i:=0 to FormDM.qryInsMoney.RecordCount-1 do
    begin
      cnt := cnt + FormDM.qryInsMoney.FieldByName('Sum').AsInteger;
      FormDM.qryInsMoney.Next;
    end;
    
    Excel.Range['CH19'] := 'Оплатить: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + 'руб.';
    //Excel.Range['CG26'] := 'Оплатить: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + 'руб.';
    Excel.Range['BO17'] := 'Оплатить: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + 'руб.';
    Excel.Range['BP29'] := 'Оплатить: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + 'руб.';

    // Гарантийник
    Excel.Range['CE1'] := 'Дата приема '+ DateToStr(FormDM.tblOrder.FieldByName('DateStart').AsDateTime) +
                          ' Дата выдачи ' + DateToStr(FormDM.tblOrder.FieldByName('DataFinish').AsDateTime);
    Excel.Range['CF1'] := 'Выдал заказ:';// + dblkcbbManagerFinish.Text;
    Excel.Range['CG1'] := 'Номер клиента ' + dbedtNumCustomer.Text;


    //tmp := 'Гарантия ___ дней. Квитанция № ' + numKvit;
    //Excel.Range['CD1'] := tmp;

    // Печать
    Excel.ActiveSheet.PrintOut;

    if VarIsEmpty(Excel) = false then
    begin
      Excel.DisplayAlerts := False;
      Excel.Quit;
      Excel := 0;
    end;
  DeleteFile(path);
  end;
end;

function TFormAddOrder.CreateOneMore(): Boolean;
var
  f,name,o: string;
  bRes: Boolean;
begin
  Result := false;
  // Создать еще заказ?
  if Application.MessageBox('Создать новый заказ, на основе текущего?', 'Создать новый заказ?', MB_YESNO) = IDYES	then
  begin
      if FormDM.qryAllOrdersDop.RecordCount <> 0 then
      begin
      // перемещаемся на клиента (должен быть текущим)
      f := FormDM.tmpF;
      name := FormDM.tmpN;
      o := FormDM.tmpO;

      if o = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,name]), [] )
      else
        bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,name,o]), [] );

      if bRes then
      begin
        FormDM.bInsOrderByExistCustomer := true;
        //FormAddOrder.ShowModal;
        FormAddOrder.Show;
        Result := true;
      end;
    end;
  end
  else
  begin
    Result := false;
    FormDM.bAddOneMoreOrder := false;
    FormDM.tmpF := ''; FormDM.tmpN := ''; FormDM.tmpO := '';
  end;
end;

procedure TFormAddOrder.OnSaveEditOrder();
var
  i: Integer;
begin
  // Проверки корректности заполненных полей
  //if TestFillNeeded() then
  //begin
    // Очищаем массив - отслеживание измененных работ
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    // Если сумма = 0 или пусто - удаляем
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;
    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // Если телефон не ввели удаляем запись
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // и сохраняем
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // сохраняем дату+время заказа выдачи заказа
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // При редактировании добавляем только измененные записи
    FormDM.qryCurWorks.First;
    for i:=1 to FormDM.qryCurWorks.RecordCount do
    begin
      if FormDM.arrChangeWorker[i] then
      begin
        FormDM.tblWorksInOrder.Append;
        FormDM.tblWorksInOrder.FieldByName('ID_Worker').AsInteger := FormDM.qryCurWorks.FieldByName('ID_Woker').AsInteger;
        FormDM.tblWorksInOrder.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
        FormDM.tblWorksInOrder.FieldByName('ID_Works').AsInteger := FormDM.qryCurWorks.FieldByName('Works.ID').AsInteger;
        FormDM.tblWorksInOrder.FieldByName('Data1').AsDateTime := Date;
        FormDM.tblWorksInOrder.FieldByName('Time1').AsDateTime := Time;
      end;
      FormDM.qryCurWorks.Next;
    end;

    // сохраняем
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // Сохраняем вещь
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // Обновляем запросы во вкладке поиск
    UpdateSearchTab();

    // Распечатать?
    //if Application.MessageBox('Распечатать квитанцию?', 'Распечатать?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bEditOrder := False;
    //FormDM.bAddOneMoreOrder := true;

    // Сохраняем ФИО, тк возможно нужно будет создать заказ на основе, этого же клиента.
    FormDM.tmpF := dbedtFirstName.text;
    FormDM.tmpN := dbedtName.Text;
    FormDM.tmpO := dbedtOtchestvo.Text;
  //end
  //else
    //Exit;

  //FormAddOrder.Close;
end;

procedure TFormAddOrder.OnShowAddOrder();
var
  numK, numC, manag: Integer;
  sum: Currency;
  Ini: Tinifile;    // ini
  i:Integer;
begin
  // Очищаем массив - отслеживание измененных работ
  dtpData.Color := clMoneyGreen;
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

    Caption := 'Добавление заказа';
    //btnAddNewOrder.Caption := 'Добавить заказ';
    //dtpData.Date := StrToDateTime('30.12.1899');
    dtpData.Date := Now; // По умолчанию ставим дату выдачи сегодняшнюю
    dtpTimeFinish.Time := StrToDateTime('19:00:00');

    // Создаем запись втаблицах Orders, Customer, Phones
    // Создаем запись в табл Телефоны
    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // по умолчанию сотовый
    if FormDM.tblPhones.Modified then
        FormDM.tblPhones.Post;
    // Создаем запись в таблице Заказчик
    FormDM.tblCustomer.Append;
    FormDM.tblCustomer.FieldByName('FirstName').AsString := '';
    // Получам номер заказчика из config.ini
    // Читаем config.ini открываем файл
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numC := Ini.ReadInteger('NUMCUSTOMER','numC',0);
    Ini.Free;
    FormDM.tblCustomer.FieldByName('NumCustomer').AsInteger := numC; // считанный номер клиента
    FormDM.tblCustomer.Post;

    // Создаем связь c табл Phone & Customer
    FormDM.tblPhones.Edit;
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // Создаем запись в таблице Заказ
    FormDM.tblOrder.Append;
    FormDM.tblOrder.FieldByName('ID_Status').AsInteger := 5;  // Принято
    FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0;     // скидка 0%

    // Менеджера берем из ini файла
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    manag := Ini.ReadInteger('MANAGERID','manager',8);
    FormDM.tblOrder.FieldByName('ID_Manager').AsInteger := manag;
    Ini.Free;

    FormDM.tblOrder.FieldByName('DateStart').AsDateTime := Date();
    FormDM.tblOrder.FieldByName('TimeStart').AsDateTime := Time();
    FormDM.tblOrder.FieldByName('OcenkaItem').AsInteger := 0; // по умолчанию
    FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0; // по умолчанию 0%
    FormDM.tblOrder.FieldByName('ID_ManagerFinish').AsInteger := 6; // менеджер, выдавший заказ = нет
    FormDM.tblOrder.FieldByName('Prim').AsString := ''; // примечание

    // добавляем номер квитанции из  config.ini
    // Читаем config.ini открываем файл
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numK := Ini.ReadInteger('NUMKVIT','numK',0);
    FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger := numK; // считанный номер квитанции
    Ini.Free;

    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // Добавляем запись в табл ItemCurrent для текущего заказа
    // Название вещи = 3 = нет; 2 = Мужские; Цвет = 6 = нет
    FormDM.tblItemCurrent.AppendRecord([nil, 35, 27, 4,
                                        FormDM.tblOrder.FieldByName('ID').AsInteger,
                                        null, 10 ]); 

    // Coхраняем предмет заказа
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // Добавляем запись в таблицу Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    sum := 0;
    edtPriceWorks.Text := CurrToStr(sum);

    // Обновляем запрос телефоны
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := True;

    // Обновляем запрос Внесенные суммы
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := True;

    FormDM.qrySum.Active := False;
    FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qrySum.Active := True;

    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;

    UpdateSQLWork;

  // Сохраняем закладки формы Заказа
  FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
  FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
  FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
  FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
  FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;
  
  //bSave := false; // не сохранять
  //ColoredForm();
end;

procedure TFormAddOrder.OnShowFromExistCustomer();
var
  numK, manag: Integer;
  sum: Currency;
  Ini: Tinifile;    // ini
  i:Integer;
begin
  // Очищаем массив - отслеживание измененных работ
  dtpData.Color := clMoneyGreen;
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

  Caption := 'Добавление заказа';
  //btnAddNewOrder.Caption := 'Добавить заказ';
  // Создаем запись в таблицах Orders Phones

  // Ищем Заказчика и соединяем с новым заказом
  // Создаем запись в табл Телефоны
  FormDM.tblPhones.Append;
  FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // по умолчанию сотовый
  if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

  // Создаем связь c табл Phone & Customer
  FormDM.tblPhones.Edit;
  FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  if FormDM.tblPhones.Modified then
    FormDM.tblPhones.Post;

  FormDM.tblOrder.Append;
  FormDM.tblOrder.FieldByName('ID_Status').AsInteger := 5;  // Принято
  FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0;     // скидка 0%

  // Менеджера берем из ini файла
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  manag := Ini.ReadInteger('MANAGERID','manager',6);
  FormDM.tblOrder.FieldByName('ID_Manager').AsInteger := manag;
  Ini.Free;

  FormDM.tblOrder.FieldByName('DateStart').AsDateTime := Date();
  FormDM.tblOrder.FieldByName('TimeStart').AsDateTime := Time();
  FormDM.tblOrder.FieldByName('OcenkaItem').AsInteger := 0; // по умолчанию
  FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0; // по умолчанию 0%
  FormDM.tblOrder.FieldByName('ID_ManagerFinish').AsInteger := 6; // менеджер, выдавший заказ = нет
  FormDM.tblOrder.FieldByName('Prim').AsString := ''; // примечание

  dtpData.Date := Now; //StrToDateTime('30.12.1899');
  dtpTimeFinish.Time := StrToDateTime('19:00:00');

  // добавляем номер квитанции из  config.ini
  // Читаем config.ini открываем файл
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  numK := Ini.ReadInteger('NUMKVIT','numK',0);
  FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger := numK; // считанный номер квитанции
  Ini.Free;

  if FormDM.tblOrder.Modified then
    FormDM.tblOrder.Post;

  // Добавляем запись в табл ItemCurrent для текущего заказа
  // Название вещи = 3 = нет; 2 = Мужские; Цвет = 6 = нет
  FormDM.tblItemCurrent.AppendRecord([nil, 35, 27, 4,
                                      FormDM.tblOrder.FieldByName('ID').AsInteger,
                                      null, 10 ]);

  // Coхраняем предмет заказа
  if FormDM.tblItemCurrent.Modified then
    FormDM.tblItemCurrent.Post;

  // Добавляем запись в таблицу Money
  FormDM.tblMoney.Append;
  FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
  FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
  FormDM.tblMoney.Post;

  sum := 0;
  edtPriceWorks.Text := CurrToStr(sum);

  // Обновляем запрос, выводящий внесенные суммы
  FormDM.qryInsMoney.Active := False;
  FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryInsMoney.Active := true;

  FormDM.qrySum.Active := False;
  FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qrySum.Active := True;

  FormDM.qryCurWorks.Active := False;
  FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryCurWorks.Active := true;

  // Обновляем запрос телефоны
  FormDM.qryCustPhones.Active := False;
  FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.qryCustPhones.Active := True;

  UpdateSQLWork;

  // Сохраняем закладки формы Заказа
  FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
  FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
  FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
  FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
  FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;

  ColoredForm();
end;

procedure TFormAddOrder.OnAddOrderFromExist();
var
  Ini: Tinifile;    // ini
  i: Integer;
begin
  // Проверки корректности заполненных полей
  //if TestFillNeeded() then
  //begin
    // Очищаем массив - отслеживание измененных работ
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // Если телефон не ввели удаляем запись
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // и сохраняем
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // Если сумма = 0 или пусто - удаляем
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // сохраняем дату+время заказа выдачи заказа
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // Добавляем запись в таблицу WorkerInOrder (сколько работ столько и записей)
    FormDM.qryCurWorks.First;
    for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
    begin
      FormDM.tblWorksInOrder.Append;
      FormDM.tblWorksInOrder.FieldByName('ID_Worker').AsInteger := FormDM.qryCurWorks.FieldByName('ID_Woker').AsInteger;
      FormDM.tblWorksInOrder.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.tblWorksInOrder.FieldByName('ID_Works').AsInteger := FormDM.qryCurWorks.FieldByName('Works.ID').AsInteger;

      FormDM.tblWorksInOrder.FieldByName('Data1').AsDateTime := Date; // StrToDate(today);
      FormDM.tblWorksInOrder.FieldByName('Time1').AsDateTime := Time;  // StrToTime(today);
      FormDM.qryCurWorks.Next;
    end;

    // сохраняем
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // сохраняем в config.ini
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    Ini.WriteInteger('NUMKVIT','numK',FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger + 1);
    Ini.Free;

    // Сохраняем вещь
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // Обновляем запросы во вкладке поиск
    UpdateSearchTab();

    // Распечатать?
    //if Application.MessageBox('Распечатать квитанцию?', 'Распечатать?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bInsOrderByExistCustomer := False;
    //FormDM.bAddOneMoreOrder := true;

    FormDM.tmpF := dbedtFirstName.text;
    FormDM.tmpN := dbedtName.Text;
    FormDM.tmpO := dbedtOtchestvo.Text;

    // Сохраняем закладки формы Заказа
    FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
    FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
  //end
  //else
    //Exit;

  //FormAddOrder.Close;
end;

procedure TFormAddOrder.btnSaveOrderClick(Sender: TObject);
begin
  // Добавляем записи в базу и очищаем форму (создаем новый заказ)
  //dblkcbbStatusOrder.ReadOnly := true;
  //dblkcbbManagerFinish.ReadOnly := true;

  if FormDM.bInsOrder then // добавляем новый заказ
  begin
    OnAddOrder();
    //bSave := false; // не сохранять
  end;

  if FormDM.bEditOrder then // редактируем существующий заказ
  begin
    OnSaveEditOrder();
    //bSave := false; // не сохранять
  end;

  if FormDM.bInsOrderByExistCustomer then
  begin
    OnAddOrderFromExist();
    //bSave := false; // не сохранять
  end;

  if FormDM.bAddOneMoreOrder then
  begin
    // Спросить оставить текущего заказчика?
    if Application.MessageBox('Оставить заказчика для следующего заказа?', 'Заказчик тот же?', MB_YESNO) = IDYES	then
    begin
      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;
      OnShowFromExistCustomer();
    end
    else
    begin
      FormDM.bInsOrder := true;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;
      OnShowAddOrder();
    end;
  end;

  // Обновляем все заказы
  FormDM.qryAllOrdersDop.Active := False;
  FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersSrart.DateTime);
  FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersEnd.DateTime);
  FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
  FormDM.qryAllOrdersDop.Active := True;

  //FormAddOrder.Hide;
end;

procedure TFormAddOrder.FormActivate(Sender: TObject);
var
  i: Integer;
begin

  // Обновляем работы
  FormAddOrder.UpdateSQLWork;
  // переходим к сохраненной группе работ
  if FormPrice.bm <> nil then
    FormDM.tblWorks.GotoBookmark(FormPrice.bm);
  FormPrice.bm := nil;

  (*if FormDM.bEditOrder then   // редактирование
  begin
    OnShowEditOrder();
    Exit;
  end;
  //if FormDM.bInsOrder then    // создание нового заказа
    //OnShowAddOrder();
  if FormDM.bInsOrderByExistCustomer then
  begin
    OnShowFromExistCustomer();
    Exit;
  end;*)

  // Восстанавливаем закладки
  if (FormAddOrder.bmTblOrder <> nil) then // берем только одну закладку
  begin
    FormDM.tblOrder.GotoBookmark(FormAddOrder.bmTblOrder);
    FormDM.tblCustomer.GotoBookmark(FormAddOrder.bmTblCustomer);
    FormDM.tblItemCurrent.GotoBookmark(FormAddOrder.bmTblItemCurrent);
    FormDM.tblPhones.GotoBookmark(FormAddOrder.bmTblPhones);
    FormDM.tblMoney.GotoBookmark(FormAddOrder.bmTblInMoney);
  end;
  
  ColoredForm();
end;

procedure TFormAddOrder.FormDeactivate(Sender: TObject);
begin
  if (FormDM.bEditOrder Or FormDM.bInsOrderByExistCustomer) then
    Exit;
    
  // Сохраняем закладки
  if (FormAddOrder.bmTblOrder <> nil) then
  begin
    FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
    FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
    FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;
  end;
end;

procedure TFormAddOrder.dbedtPayMoneyKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    // Добавляем внесенные деньги заказчику
    if (dbedtPayMoney.Text <> '') and (dbedtPayMoney.Text <> '0') then
    begin
      if FormDM.tblMoney.Modified then
        FormDM.tblMoney.Post;

      // Добавляем запись в таблицу Money
      FormDM.tblMoney.Append;
      FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
      FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
      FormDM.tblMoney.Post;

      // Внесенные суммы
      FormDM.qryInsMoney.Active := False;
      FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.qryInsMoney.Active := True;

      // в статус
      FormDM.qryInMoneyPrihod.Active := False;
      FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
      FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',Now());
      FormDM.qryInMoneyPrihod.Active := True;

      MainForm.StatusBar1.Panels[0].Text := 'Приход за сегодня: ' + formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
      //bSave := true; // сохранять
      ColoredForm();
    end;
  end;
end;

procedure TFormAddOrder.dbedtPhone1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    if dbedtPhone1.Text <> '' then
    begin

        // Добавляем телефон заказчику
        if dbedtPhone1.Text <> '' then
        begin
          if FormDM.tblPhones.Modified then
            FormDM.tblPhones.Post;

          FormDM.tblPhones.Append;
          FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // по умолчанию сотовый
          FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
          if FormDM.tblPhones.Modified then
            FormDM.tblPhones.Post;
          FormDM.qryCustPhones.Active := False;
          FormDM.qryTest.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
          FormDM.qryCustPhones.Active := true;
        
      end;
    end;
  end;
end;

procedure TFormAddOrder.dtpDataChange(Sender: TObject);
begin
  //bSave := true; // сохранять
end;

procedure TFormAddOrder.btnForExistCustomerClick(Sender: TObject);
begin
  if Not(FormDM.bInsOrder AND (dbedtFirstName.Text = '') ) then
  begin
    if dbedtFirstName.Text <> '' then // Если есть хотябы фамилия сохраняем
      SaveOrder();
    FormDM.bInsOrder := false;                 // Процесс создания нового заказа
    FormDM.bEditOrder := false;                // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := true;
    OnShowFromExistCustomer();
  end;
end;

procedure TFormAddOrder.btnSaveOrdClick(Sender: TObject);
begin
  if dbedtFirstName.Text <> '' then // Если есть хотябы фамилия сохраняем
    SaveOrder();
end;

procedure TFormAddOrder.SaveOrder();
begin
  if FormDM.bInsOrder then // добавляем новый заказ
  begin
    OnAddOrder();
    FormDM.bInsOrder := false;
    FormDM.bEditOrder := true;
    //bSave := false; // не сохранять
  end;

  if FormDM.bEditOrder then // редактируем существующий заказ
  begin
    OnSaveEditOrder();
    //bSave := false; // не сохранять
  end;

  if FormDM.bInsOrderByExistCustomer then
  begin
    OnAddOrderFromExist();
    FormDM.bInsOrderByExistCustomer := false;
    FormDM.bEditOrder := true;
    //bSave := false; // не сохранять
  end;

  (*if FormDM.bAddOneMoreOrder then
  begin
    // Спросить оставить текущего заказчика?
    if Application.MessageBox('Оставить заказчика для следующего заказа?', 'Заказчик тот же?', MB_YESNO) = IDYES	then
    begin
      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;
      OnShowFromExistCustomer();
    end
    else
    begin
      FormDM.bInsOrder := true;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;
      OnShowAddOrder();
    end;
  end;*)

  MainForm.UpdateTabOrders();

  //FormAddOrder.ColoredForm();
end;

procedure TFormAddOrder.Button1Click(Sender: TObject);
begin
  // При закрытии сохраняем заказ и скрываем окно заказа
  //if dbedtFirstName.Text <> '' then // Если есть хотябы фамилия сохраняем
    //SaveOrder();
  FormAddOrder.Hide;
end;

procedure TFormAddOrder.ColoredForm();
var
  i, sum: Integer;
begin
  //if dbedtFirstName <> nil then
  if (FormDM.conContn.Connected) AND (FormAddOrder <> nil) then
  begin
    // фвмилия
    if dbedtFirstName.Text <> '' then
      dbedtFirstName.Color := clWindow
    else
      dbedtFirstName.Color := clMoneyGreen;

    // имя
    if dbedtName.Text <> '' then
      dbedtName.Color := clWindow
    else
      dbedtName.Color := clMoneyGreen;

    // принявший менеджер
    if dblkcbbInOrderCust.Text <> 'нет' then
      dblkcbbInOrderCust.Color := clWindow
    else
      dblkcbbInOrderCust.Color := clMoneyGreen;

    // работы
    if FormDM.qryCurWorks.Active then
    begin
      if FormDM.qryCurWorks.RecordCount <> 0 then
        dbgrdAddedWorks.Color := clWindow
      else
        dbgrdAddedWorks.Color := clMoneyGreen;
    end;

    // изделие
    if dblkcbbItems.Text <> 'нет' then
      dblkcbbItems.Color := clWindow
    else
      dblkcbbItems.Color := clMoneyGreen;

    // цвет
    if dblkcbbItemColor.Text <> 'нет' then
      dblkcbbItemColor.Color := clWindow
    else
      dblkcbbItemColor.Color := clMoneyGreen;

    // мжд
    if dblkcbbMZD.Text <> 'нет' then
      dblkcbbMZD.Color := clWindow
    else
      dblkcbbMZD.Color := clMoneyGreen;

    // прав/лев
    if dblkcbbLR.Text <> 'нет' then
      dblkcbbLR.Color := clWindow
    else
      dblkcbbLR.Color := clMoneyGreen;


    // Внесенные суммы
    //if (FormDM.qryInsMoney.Active) AND (FormDM.qryInsMoney.RecordCount <> 0) then
    if (FormDM.qryInsMoney.RecordCount = 0) AND (FormDM.qryInsMoney.Active) then
      grpMoney.Color := clMoneyGreen
    else
    begin
      if (FormDM.qryInsMoney.Active) AND (FormDM.qryInsMoney.RecordCount <> 0) then
      begin
        sum := 0;
        FormDM.qryInsMoney.First;
        for i:=0 to FormDM.qryInsMoney.RecordCount-1 do
        begin
          sum := sum + FormDM.qryInsMoney.fieldByName('Sum').AsInteger;
          FormDM.qryInsMoney.Next;
        end;
        if sum < StrToInt(edtPriceWorks.Text) then
          grpMoney.Color := clMoneyGreen
        else
          grpMoney.Color := clWindow;
        end;
      end;
    end;
end;

procedure TFormAddOrder.dbedtFirstNameChange(Sender: TObject);
begin
  if FormDM.qryInsMoney.Active then
    ColoredForm();
end;

procedure TFormAddOrder.dbedtNameChange(Sender: TObject);
begin
  if (FormDM.conContn.Connected) AND (FormAddOrder <> nil) then
  begin
    if FormDM.qryInsMoney.Active then
      ColoredForm();
  end;
end;

procedure TFormAddOrder.cbbGroupsWorkKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  UpdateSQLWork;
end;

procedure TFormAddOrder.dbedtPhone1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Not(key in['0'..'9']) then
    Key:=#0;
end;

procedure TFormAddOrder.cbbGroupsWorkKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  UpdateSQLWork;
end;

procedure TFormAddOrder.dtpDataClick(Sender: TObject);
begin
  if dtpData.Color = clMoneyGreen then
    dtpData.Color := clWindow;
end;

procedure TFormAddOrder.dblkcbbInOrderCustCloseUp(Sender: TObject);
var
  manag: Integer;
  Ini: Tinifile; // создаем переменную типа Tinifile
begin
  // Сохраняем config.ini открываем файл
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  manag := FormDM.tblOrder.FieldByName('ID_Manager').AsInteger;
  Ini.WriteInteger('MANAGERID','manager',manag);
  Ini.Free;
end;

end.
