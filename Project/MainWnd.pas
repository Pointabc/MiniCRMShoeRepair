unit MainWnd;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ComCtrls, StdCtrls, ExtCtrls, Grids, DBGrids, UnitDM, UnitSpravochnik,
  UnitGroupWork, UnitAddOrder, UnitPrice, UnitChipers, UnitItemColor, UnitItemType,
  UnitInMoney, DB;

type
  TMainForm = class(TForm)
    mmMainMenu: TMainMenu;
    N1: TMenuItem;
    mClose: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    pgcPages: TPageControl;
    tsPage1: TTabSheet;
    tsPage2: TTabSheet;
    tsPage3: TTabSheet;
    btnAddOrder: TButton;
    tsRashod: TTabSheet;
    tsPageSearch: TTabSheet;
    pnlPaneSearch: TPanel;
    lblLabelToolTip: TLabel;
    edtSearch: TEdit;
    dbgrdSearch: TDBGrid;
    dbgrdOrders: TDBGrid;
    N5: TMenuItem;
    N7: TMenuItem;
    mniAdd: TMenuItem;
    mniCurentWork: TMenuItem;
    mniInWork: TMenuItem;
    mniFinishWork: TMenuItem;
    mniN6: TMenuItem;
    mniAddWoker: TMenuItem;
    mniAddOrder: TMenuItem;
    N6: TMenuItem;
    mConectToBD: TMenuItem;
    N10: TMenuItem;
    dlgOpen: TOpenDialog;
    N2: TMenuItem;
    NSprItems: TMenuItem;
    pmInSearch: TPopupMenu;
    mniAddOrderSearch: TMenuItem;
    grpTypeSearch: TGroupBox;
    rbNoByPhone: TRadioButton;
    rbNumberCustomer: TRadioButton;
    rbByDefault: TRadioButton;
    rbByNumKvitan: TRadioButton;
    mniItemsColor: TMenuItem;
    mniItemsType: TMenuItem;
    mniN8: TMenuItem;
    mniN9: TMenuItem;
    pmAllOrders: TPopupMenu;
    mniEditOrder: TMenuItem;
    mniEditOrderFromSearch: TMenuItem;
    dbgrdIssued: TDBGrid;
    tsDolg: TTabSheet;
    lbl1: TLabel;
    dtpStart: TDateTimePicker;
    dtpFinish: TDateTimePicker;
    lbl2: TLabel;
    dbgrdReadyOrders: TDBGrid;
    DateTimePickerStart: TDateTimePicker;
    DateTimePickerEnd: TDateTimePicker;
    Label1: TLabel;
    Label2: TLabel;
    DBGridDolzhniki: TDBGrid;
    tsInWork: TTabSheet;
    dbgridInWork: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    dbgrdVirabotka: TDBGrid;
    cbWoker: TComboBox;
    Label3: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    datePickStart1: TDateTimePicker;
    datePickFinish1: TDateTimePicker;
    btnSearch: TButton;
    mniAddCustomer: TMenuItem;
    Label8: TLabel;
    edtSum: TEdit;
    StatusBar1: TStatusBar;
    N8: TMenuItem;
    edtDolg: TEdit;
    Label9: TLabel;
    Button1: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    N9: TMenuItem;
    N11: TMenuItem;
    //WebUpdate1: TWebUpdate;
    dtpAllOrdersSrart: TDateTimePicker;
    Panel5: TPanel;
    dtpAllOrdersEnd: TDateTimePicker;
    cbOnlyTodayOrders: TCheckBox;
    pmFromDolzhniki: TPopupMenu;
    N12: TMenuItem;
    btnAddOr: TButton;
    cbStatusOrder: TComboBox;
    Label10: TLabel;
    tsStat: TTabSheet;
    dbgrStat: TDBGrid;
    cbStatWokers: TComboBox;
    Label11: TLabel;
    dtpStartStat: TDateTimePicker;
    dtpEndStat: TDateTimePicker;
    Label12: TLabel;
    Label13: TLabel;
    PanelStat: TPanel;
    procedure btnAddOrderClick(Sender: TObject);
    procedure mniAddOrderClick(Sender: TObject);
    procedure mCloseClick(Sender: TObject);
    procedure mConectToBDClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure edtSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure mniAddWokerClick(Sender: TObject);
    procedure NSprItemsClick(Sender: TObject);
    procedure mniAddOrderSearchClick(Sender: TObject);
    procedure mniEditOrderClick(Sender: TObject);
    procedure mniEditOrderFromSearchClick(Sender: TObject);
    procedure tsPage2Show(Sender: TObject);
    procedure tsPage3Show(Sender: TObject);
    procedure dtpStartChange(Sender: TObject);
    procedure dtpFinishChange(Sender: TObject);
    procedure DateTimePickerStartChange(Sender: TObject);
    procedure DateTimePickerEndChange(Sender: TObject);
    procedure tsDolgShow(Sender: TObject);
    procedure mniItemsColorClick(Sender: TObject);
    procedure mniItemsTypeClick(Sender: TObject);
    procedure tsInWorkShow(Sender: TObject);
    procedure tsRashodShow(Sender: TObject);
    procedure cbWokerChange(Sender: TObject);
    procedure datePickStart1Change(Sender: TObject);
    procedure datePickFinish1Change(Sender: TObject);
    procedure btnSearchClick(Sender: TObject);
    procedure mniAddCustomerClick(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure tsPage1Show(Sender: TObject);
    procedure tsPage1Hide(Sender: TObject);
    procedure tsInWorkHide(Sender: TObject);
    procedure tsPage2Hide(Sender: TObject);
    procedure tsDolgHide(Sender: TObject);
    procedure tsPage3Hide(Sender: TObject);
    procedure tsRashodHide(Sender: TObject);
    procedure tsPageSearchShow(Sender: TObject);
    procedure tsPageSearchHide(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure FormDeactivate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dtpAllOrdersSrartChange(Sender: TObject);
    procedure dtpAllOrdersEndChange(Sender: TObject);
    procedure dbgrdOrdersTitleClick(Column: TColumn);
    procedure N12Click(Sender: TObject);
    procedure btnAddOrClick(Sender: TObject);
    procedure cbStatusOrderChange(Sender: TObject);
    procedure cbOnlyTodayOrdersMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);

    procedure UpdateTabOrders();
    procedure tsStatHide(Sender: TObject);
    procedure tsStatShow(Sender: TObject);
    procedure cbStatWokersChange(Sender: TObject);
    procedure dtpStartStatChange(Sender: TObject);
    procedure dtpEndStatChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    // закладки Главного окна
    bmTblOrder: TBookmark;
    bmTblCustomer: TBookmark;
    bmTblItemCurrent: TBookmark;
    bmTblPhones: TBookmark;
    bmqryAllOrdersDop: TBookmark;     // закладка для вкладки Все Заказы
    bmTblInMoney: TBookmark;          // закладка внесенные деньги
  end;

var
  MainForm: TMainForm;

implementation

uses UnitEditOrder, UnitLRItem, UnitAddCustomer;

{$R *.dfm}

procedure TMainForm.btnAddOrderClick(Sender: TObject);
begin
  FormAddOrder.Show;
end;

procedure TMainForm.mniAddOrderClick(Sender: TObject);
begin
  FormAddOrder.Show;
end;

procedure TMainForm.mCloseClick(Sender: TObject);
begin
  MainForm.Close;
end;

procedure TMainForm.mConectToBDClick(Sender: TObject);
var 
  filename: string;
begin
  // База может располагаться в любом месте
  dlgOpen.Filter := 'База данных (*.mdb)|*.MDB';
  dlgOpen.InitialDir := SysUtils.GetCurrentDir;
  if dlgOpen.Execute then
  begin
    filename := dlgOpen.Filename;
    FormDM.BDDisconnect;
    FormDM.BDConnect(filename);
  end;
end;

procedure TMainForm.N2Click(Sender: TObject);
var
  i:Integer;
begin
  FormPrice.ShowModal;

  // Обновляем группы работ и работы
  // Заполняем значениями cbbGroupsWork - группы работ
  FormAddOrder.cbbGroupsWork.Clear;
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    FormAddOrder.cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  FormAddOrder.cbbGroupsWork.ItemIndex := 0;
  // Обновляем виды работ
end;

procedure TMainForm.edtSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  str: string;
  i: Integer;
begin
  if Key = VK_RETURN then
  begin
    str := edtSearch.Text;

    if rbNumberCustomer.Checked then    // по номеру клиента
    begin
      if not(TryStrToInt(edtSearch.Text, i)) then
      begin
        ShowMessage('Некорректный номер клиента');
        Exit;
      end;

      dbgrdSearch.DataSource := FormDM.dsByNumCust;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2; // последняя
      FormDM.qryByNumCust.Active := False;
      FormDM.qryByNumCust.Parameters[0].Value := StrToInt(edtSearch.Text);
      FormDM.qryByNumCust.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByFIO.Active := False;
    end;

    // пока не реализовано
    //if rbNoByPhone.Checked then // ищем по телефону
    //begin
    //  if not(TryStrToInt(edtSearch.Text, i)) and (Length(edtSearch.Text) > 10) then
    //  begin
    //    ShowMessage('Некорректный номер телефона');
    //    Exit;
    //  end;
    //end;

    if rbByDefault.Checked then   // по Фамилии
    begin
      dbgrdSearch.DataSource := FormDM.dsByFIO;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2;
      FormDM.qryByFIO.Active := False;
      FormDM.qryByFIO.Parameters[0].Value := edtSearch.Text;
      FormDM.qryByFIO.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumCust.Active := False;
    end;

    if rbByNumKvitan.Checked then   // По номеру квитанции
    begin
      if not(TryStrToInt(edtSearch.Text, i)) then
      begin
        ShowMessage('Некорректный номер квитанции');
        Exit;
      end;
      dbgrdSearch.DataSource := FormDM.dsByNumKvit;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2;
      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumKvit.Parameters[0].Value := StrToInt(edtSearch.Text);
      FormDM.qryByNumKvit.Active := true;

      FormDM.qryByNumCust.Active := False;
      FormDM.qryByFIO.Active := False;
    end;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  MainForm.bmTblOrder := nil;
  MainForm.bmTblCustomer := nil;
  MainForm.bmTblItemCurrent := nil;
  MainForm.bmTblPhones := nil;
  MainForm.bmqryAllOrdersDop := nil;     // закладка для вкладки Все Заказы
  MainForm.bmTblInMoney := nil;

  pgcPages.ActivePageIndex := 0;
  rbByDefault.Checked := True;
  // Устанавливаем даты для вкладок 'Выданные заказы'
  dtpStart.Date := IncMonth(Now,-1);
  dtpFinish.Date := Now;
  // Готовые заказы
  DateTimePickerStart.Date := IncMonth(Now,-1);
  DateTimePickerEnd.Date := Now;
  // Выработка
  datePickStart1.Date := IncMonth(Now,-1);
  datePickFinish1.Date := Now;
  // Все заказы
  dtpAllOrdersSrart.Date := IncMonth(Now,-1);
  dtpAllOrdersEnd.Date := Now;

  //Статистика по специалистам
  dtpStartStat.Date := IncMonth(Now,-1);
  dtpEndStat.Date := Now;

  tsInWork.Visible := false;
end;

procedure TMainForm.N7Click(Sender: TObject);
begin
  FormChiper.ShowModal;
end;

procedure TMainForm.mniAddWokerClick(Sender: TObject);
begin
  FormSpravWokers.ShowModal;
end;

procedure TMainForm.NSprItemsClick(Sender: TObject);
begin
  // Справочник изделий
  frmItemType.ShowModal;
end;

procedure TMainForm.mniAddOrderSearchClick(Sender: TObject);
var
  f,i,o: string;
  bRes: Boolean;
begin
  // по номеру квитанции
  if (FormDM.qryByNumKvit.Active) and (FormDM.qryByNumKvit.RecordCount <> 0) then
  begin
    // перемещаемся на клиента
    f := FormDM.qryByNumKvit.FieldByName('FirstName').AsString;
    i := FormDM.qryByNumKvit.FieldByName('Name1').AsString;
    o := FormDM.qryByNumKvit.FieldByName('Otchestvo').AsString;

    //if bRes then
    //begin
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ
      // перемещаемся на клиента

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryByNumKvit.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    //end;
  end;

  // по фамилии
  if (FormDM.qryByFIO.Active) and (FormDM.qryByFIO.RecordCount <> 0) then
  begin
    // перемещаемся на клиента
    f := FormDM.qryByFIO.FieldByName('FirstName').AsString;
    i := FormDM.qryByFIO.FieldByName('Name1').AsString;
    o := FormDM.qryByFIO.FieldByName('Otchestvo').AsString;


      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryByFIO.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    //end;
  end;

  // по номеру клиента
  if (FormDM.qryByNumCust.Active) and (FormDM.qryByNumCust.RecordCount <> 0) then
  begin
    // перемещаемся на клиента
    f := FormDM.qryByNumCust.FieldByName('FirstName').AsString;
    i := FormDM.qryByNumCust.FieldByName('Name1').AsString;
    o := FormDM.qryByNumCust.FieldByName('Otchestvo').AsString;


      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryByNumCust.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    //end;
  end;
end;

procedure TMainForm.mniEditOrderClick(Sender: TObject);
begin
  if MainForm.cbStatusOrder.Text = 'Просрочено' then
  begin
    if (FormDM.qryProsroch.RecordCount <> 0) AND (FormDM.qryProsroch.FieldByName('FirstName').AsString <> '') then
    begin
      //FormAddOrder.SaveOrder();
      // Удалить временный заказ и открыть редактируемый
      // (возможно придется спросить у пользователя, удалять или нет?)
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      // Перемещаемся на выбранный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryProsroch.FieldByName('ID').AsInteger,[]);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := true;                 // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;

      FormAddOrder.OnShowEditOrder();
      FormAddOrder.Show;
      Exit;
    end;
  end;

  if MainForm.cbStatusOrder.Text = 'Не выдано' then
  begin
    if (FormDM.qryOrderNeVidano.RecordCount <> 0) AND (FormDM.qryOrderNeVidano.FieldByName('FirstName').AsString <> '') then
    begin
      //FormAddOrder.SaveOrder();
      // Удалить временный заказ и открыть редактируемый
      // (возможно придется спросить у пользователя, удалять или нет?)
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      // Перемещаемся на выбранный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryOrderNeVidano.FieldByName('ID').AsInteger,[]);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := true;                 // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;

      FormAddOrder.OnShowEditOrder();
      FormAddOrder.Show;
    end;
  end;

  if (MainForm.cbStatusOrder.Text <> 'Не выдано') AND (MainForm.cbStatusOrder.Text <> 'Все заказы') then
  begin
    if (FormDM.qryAllOrdersDop.RecordCount <> 0) AND (FormDM.qryAllOrdersDop.FieldByName('FirstName').AsString <> '') then
    begin
      //FormAddOrder.SaveOrder();
      // Удалить временный заказ и открыть редактируемый
      // (возможно придется спросить у пользователя, удалять или нет?)
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      // Перемещаемся на выбранный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryAllOrdersDop.FieldByName('ID').AsInteger,[]);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := true;                 // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;

      FormAddOrder.OnShowEditOrder();
      FormAddOrder.Show;
    end;
  end;

  if MainForm.cbStatusOrder.Text = 'Все заказы' then
  begin
    if (FormDM.qryAllOrders.RecordCount <> 0) AND (FormDM.qryAllOrders.FieldByName('FirstName').AsString <> '') then
    begin
      //FormAddOrder.SaveOrder();
      // Удалить временный заказ и открыть редактируемый
      // (возможно придется спросить у пользователя, удалять или нет?)
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      // Перемещаемся на выбранный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryAllOrders.FieldByName('ID').AsInteger,[]);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := true;                 // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;

      FormAddOrder.OnShowEditOrder();
      FormAddOrder.Show;
    end;
  end;


end;

procedure TMainForm.mniEditOrderFromSearchClick(Sender: TObject);
begin
    // переходим к нужному Order
    if rbNumberCustomer.Checked then    // по номеру клиента
    begin
      if Not(formDM.qryByNumCust.RecordCount <> 0) then
        Exit;
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryByNumCust.FieldByName('ID').AsInteger,[]);
    end;

    if rbByDefault.Checked then   // по Фамилии
    begin
      if Not(formDM.qryByFIO.RecordCount <> 0) then
        Exit;
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryByFIO.FieldByName('ID').AsInteger,[]);
    end;

    if rbByNumKvitan.Checked then   // По номеру квитанции
    begin
      if Not(formDM.qryByNumKvit.RecordCount <> 0) then
        Exit;
      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ
      FormDM.tblOrder.Locate('ID', FormDM.qryByNumKvit.FieldByName('ID').AsInteger,[]);
    end;

    FormDM.bInsOrder := false;                 // Процесс создания нового заказа
    FormDM.bEditOrder := true;                // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    
    FormAddOrder.OnShowEditOrder();
    FormAddOrder.Show;
end;

procedure TMainForm.tsPage2Show(Sender: TObject);
begin
  tsPage2.Highlighted := true;
  // Выданные заказы
  FormDM.qryVidannieOrders.Active := False;
  FormDM.qryVidannieOrders.Parameters[0].Value := dtpStart.DateTime;
  FormDM.qryVidannieOrders.Parameters[1].Value := dtpFinish.DateTime;
  FormDM.qryVidannieOrders.Active := True;
end;

procedure TMainForm.tsPage3Show(Sender: TObject);
begin
  tsPage3.Highlighted := true;
  // Готовые заказы
  FormDM.qryReadyOrder.Active := False;
  FormDM.qryReadyOrder.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpStart.DateTime);
  FormDM.qryReadyOrder.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpFinish.DateTime);
  FormDM.qryReadyOrder.Active := True;
end;

procedure TMainForm.dtpStartChange(Sender: TObject);
begin
  // Выданные заказы
  FormDM.qryVidannieOrders.Active := False;
  FormDM.qryVidannieOrders.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpStart.DateTime);
  FormDM.qryVidannieOrders.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpFinish.DateTime);
  FormDM.qryVidannieOrders.Active := True;
end;

procedure TMainForm.dtpFinishChange(Sender: TObject);
begin
  // Выданные заказы
  FormDM.qryVidannieOrders.Active := False;
  FormDM.qryVidannieOrders.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpStart.DateTime);
  FormDM.qryVidannieOrders.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpFinish.DateTime);
  FormDM.qryVidannieOrders.Active := True;
end;

procedure TMainForm.DateTimePickerStartChange(Sender: TObject);
begin
  // Готовые заказы
  FormDM.qryReadyOrder.Active := False;
  FormDM.qryReadyOrder.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',DateTimePickerEnd.DateTime);
  FormDM.qryReadyOrder.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',DateTimePickerEnd.DateTime);
  FormDM.qryReadyOrder.Active := True;
end;

procedure TMainForm.DateTimePickerEndChange(Sender: TObject);
begin
  // Готовые заказы
  FormDM.qryReadyOrder.Active := False;
  FormDM.qryReadyOrder.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',DateTimePickerEnd.DateTime);
  FormDM.qryReadyOrder.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',DateTimePickerEnd.DateTime);
  FormDM.qryReadyOrder.Active := True;
end;

procedure TMainForm.tsDolgShow(Sender: TObject);
var
  i, sum: Integer;
begin
  tsDolg.Highlighted := true;
  // Должники
  FormDM.qryDolzhniki.Active := False;
  FormDM.qryDolzhniki.Active := True;

  // Считаем общий долг
  sum := 0;
  FormDM.qryDolzhniki.First;
  for i:=0 to FormDM.qryDolzhniki.RecordCount-1 do
  begin
    sum := sum + FormDM.qryDolzhniki.fieldByName('Value').AsInteger;
    FormDM.qryDolzhniki.Next;
  end;
  edtDolg.Text := IntToStr(sum);
end;

procedure TMainForm.mniItemsColorClick(Sender: TObject);
begin
  frmItemColor.ShowModal;
end;

procedure TMainForm.mniItemsTypeClick(Sender: TObject);
begin
  frmLR.ShowModal;
end;

procedure TMainForm.tsInWorkShow(Sender: TObject);
begin
  tsInWork.Highlighted := true;
  // Заказы в работе
  FormDM.qryInWork.Active := False;
  FormDM.qryInWork.Active := True;
end;

procedure TMainForm.tsRashodShow(Sender: TObject);
var
  i, sum: Integer;
begin
  tsRashod.Highlighted := true;

  cbWoker.Clear;
  // Заполняем значениями ФИО сотрудника
  FormDM.tblWokers.First;
  for i:=0 to FormDM.tblWokers.RecordCount-1 do
  begin
    cbWoker.Items.Add(FormDM.tblWokers.FieldByName('ShortName').AsString);
    FormDM.tblWokers.Next;
  end;
  cbWoker.ItemIndex := 0;

  FormDM.qryVirabotka.Active := False;
  FormDM.qryVirabotka.Parameters[0].Value := datePickStart1.DateTime;   // DataStart
  FormDM.qryVirabotka.Parameters[1].Value := datePickFinish1.DateTime;  // DataFinish
  FormDM.qryVirabotka.Parameters[2].Value := cbWoker.Text;
  FormDM.qryVirabotka.Active := True;

  sum := 0;
  FormDM.qryVirabotka.First;
  for i:=0 to FormDM.qryVirabotka.RecordCount-1 do
  begin
    sum := sum + FormDM.qryVirabotka.fieldByName('Virabotka').AsInteger;
    FormDM.qryVirabotka.Next;
  end;
  edtSum.Text := IntToStr(sum);

end;

procedure TMainForm.cbWokerChange(Sender: TObject);
var
  i, sum: Integer;
begin
  FormDM.qryVirabotka.Active := False;
  FormDM.qryVirabotka.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',datePickStart1.DateTime);   // DataStart
  FormDM.qryVirabotka.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',datePickFinish1.DateTime);  // DataFinish
  FormDM.qryVirabotka.Parameters[2].Value := cbWoker.Text;
  FormDM.qryVirabotka.Active := True;

  sum := 0;
  FormDM.qryVirabotka.First;
  for i:=0 to FormDM.qryVirabotka.RecordCount-1 do
  begin
    sum := sum + FormDM.qryVirabotka.fieldByName('Virabotka').AsInteger;
    FormDM.qryVirabotka.Next;
  end;
  edtSum.Text := IntToStr(sum);
end;

procedure TMainForm.datePickStart1Change(Sender: TObject);
var
  i, sum: Integer;
begin
  // Обновляем
  FormDM.qryVirabotka.Active := False;
  FormDM.qryVirabotka.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',datePickStart1.DateTime);   // DataStart
  FormDM.qryVirabotka.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',datePickFinish1.DateTime);  // DataFinish
  FormDM.qryVirabotka.Parameters[2].Value := cbWoker.Text;
  FormDM.qryVirabotka.Active := True;

  sum := 0;
  FormDM.qryVirabotka.First;
  for i:=0 to FormDM.qryVirabotka.RecordCount-1 do
  begin
    sum := sum + FormDM.qryVirabotka.fieldByName('Virabotka').AsInteger;
    FormDM.qryVirabotka.Next;
  end;
  edtSum.Text := IntToStr(sum);
end;

procedure TMainForm.datePickFinish1Change(Sender: TObject);
var
  i, sum: Integer;
begin
  // Обновляем
  FormDM.qryVirabotka.Active := False;
  FormDM.qryVirabotka.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',datePickStart1.DateTime);   // DataStart
  FormDM.qryVirabotka.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',datePickFinish1.DateTime);  // DataFinish
  FormDM.qryVirabotka.Parameters[2].Value := cbWoker.Text;
  FormDM.qryVirabotka.Active := True;

  sum := 0;
  FormDM.qryVirabotka.First;
  for i:=0 to FormDM.qryVirabotka.RecordCount-1 do
  begin
    sum := sum + FormDM.qryVirabotka.fieldByName('Virabotka').AsInteger;
    FormDM.qryVirabotka.Next;
  end;
  edtSum.Text := IntToStr(sum);
end;

procedure TMainForm.btnSearchClick(Sender: TObject);
var
  str: string;
  i: Integer;
begin
    str := edtSearch.Text;

    if rbNumberCustomer.Checked then    // по номеру клиента
    begin
      if not(TryStrToInt(edtSearch.Text, i)) then
      begin
        ShowMessage('Некорректный номер клиента');
        Exit;
      end;

      dbgrdSearch.DataSource := FormDM.dsByNumCust;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2; // последняя
      FormDM.qryByNumCust.Active := False;
      FormDM.qryByNumCust.Parameters[0].Value := StrToInt(edtSearch.Text);
      FormDM.qryByNumCust.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByFIO.Active := False;
    end;

    // пока не реализовано
    //if rbNoByPhone.Checked then // ищем по телефону
    //begin
    //  if not(TryStrToInt(edtSearch.Text, i)) and (Length(edtSearch.Text) > 10) then
    //  begin
    //    ShowMessage('Некорректный номер телефона');
    //    Exit;
    //  end;
    //end;

    if rbByDefault.Checked then   // по Фамилии
    begin
      dbgrdSearch.DataSource := FormDM.dsByFIO;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2;
      FormDM.qryByFIO.Active := False;
      FormDM.qryByFIO.Parameters[0].Value := edtSearch.Text;
      FormDM.qryByFIO.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumCust.Active := False;
    end;

    if rbByNumKvitan.Checked then   // По номеру квитанции
    begin
      if not(TryStrToInt(edtSearch.Text, i)) then
      begin
        ShowMessage('Некорректный номер квитанции');
        Exit;
      end;
      dbgrdSearch.DataSource := FormDM.dsByNumKvit;
      pgcPages.ActivePageIndex := pgcPages.PageCount-2;
      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumKvit.Parameters[0].Value := StrToInt(edtSearch.Text);
      FormDM.qryByNumKvit.Active := true;

      FormDM.qryByNumCust.Active := False;
      FormDM.qryByFIO.Active := False;
    end;
end;

procedure TMainForm.mniAddCustomerClick(Sender: TObject);
begin
  // Добавить клиента
  frmAddCustomer.ShowModal;
end;

procedure TMainForm.N8Click(Sender: TObject);
begin
  frmMoney.showModal;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  FormPrice.ShowModal;
end;

procedure TMainForm.tsPage1Show(Sender: TObject);
begin
  tsPage1.Highlighted := true;

  //dtpAllOrdersSrart.Date := IncMonth(Now,-1);
  //dtpAllOrdersEnd.Date := Now;
  // Обновляем все заказы
  FormDM.qryAllOrdersDop.Active := False;
  FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersSrart.DateTime);
  FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersEnd.DateTime);
  FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
  FormDM.qryAllOrdersDop.Active := True;
end;

procedure TMainForm.tsPage1Hide(Sender: TObject);
begin
  tsPage1.Highlighted := false;
end;

procedure TMainForm.tsInWorkHide(Sender: TObject);
begin
  tsInWork.Highlighted := false;
end;

procedure TMainForm.tsPage2Hide(Sender: TObject);
begin
  tsPage2.Highlighted := false;
end;

procedure TMainForm.tsDolgHide(Sender: TObject);
begin
  tsDolg.Highlighted := false;
end;

procedure TMainForm.tsPage3Hide(Sender: TObject);
begin
  tsPage3.Highlighted := false;
end;

procedure TMainForm.tsRashodHide(Sender: TObject);
begin
  tsRashod.Highlighted := false;
end;

procedure TMainForm.tsPageSearchShow(Sender: TObject);
begin
  tsPageSearch.Highlighted := true;
end;

procedure TMainForm.tsPageSearchHide(Sender: TObject);
begin
  tsPageSearch.Highlighted := false;
end;

procedure TMainForm.N9Click(Sender: TObject);
var
  f,i,o: string;
  bRes: Boolean;
begin
  if MainForm.cbStatusOrder.Text = 'Просрочено' then
  begin
    if (FormDM.qryProsroch.RecordCount <> 0) AND (FormDM.qryProsroch.FieldByName('FirstName').AsString <> '') then
    begin
      // перемещаемся на клиента
      f := FormDM.qryProsroch.FieldByName('FirstName').AsString;
      i := FormDM.qryProsroch.FieldByName('Customer.Name1').AsString;
      o := FormDM.qryProsroch.FieldByName('Otchestvo').AsString;

      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryProsroch.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
      Exit;
    end;
  end;

  if MainForm.cbStatusOrder.Text = 'Не выдано' then
  begin
    if (FormDM.qryOrderNeVidano.RecordCount <> 0) AND (FormDM.qryOrderNeVidano.FieldByName('FirstName').AsString <> '') then
    begin
      // перемещаемся на клиента
      f := FormDM.qryOrderNeVidano.FieldByName('FirstName').AsString;
      i := FormDM.qryOrderNeVidano.FieldByName('Customer.Name1').AsString;
      o := FormDM.qryOrderNeVidano.FieldByName('Otchestvo').AsString;

      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryOrderNeVidano.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    end;
  end;

  if (MainForm.cbStatusOrder.Text <> 'Не выдано') AND (MainForm.cbStatusOrder.Text <> 'Все заказы') then
  begin
    if (FormDM.qryAllOrdersDop.RecordCount <> 0) AND (FormDM.qryAllOrdersDop.FieldByName('FirstName').AsString <> '') then
    begin
      // перемещаемся на клиента
      f := FormDM.qryAllOrdersDop.FieldByName('FirstName').AsString;
      i := FormDM.qryAllOrdersDop.FieldByName('Customer.Name1').AsString;
      o := FormDM.qryAllOrdersDop.FieldByName('Otchestvo').AsString;

      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryAllOrdersDop.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    end;
  end;

  if MainForm.cbStatusOrder.Text = 'Все заказы' then
  begin
    if (FormDM.qryAllOrders.RecordCount <> 0) AND (FormDM.qryAllOrders.FieldByName('FirstName').AsString <> '') then
    begin
      // перемещаемся на клиента
      f := FormDM.qryAllOrders.FieldByName('FirstName').AsString;
      i := FormDM.qryAllOrders.FieldByName('Customer.Name1').AsString;
      o := FormDM.qryAllOrders.FieldByName('Otchestvo').AsString;

      FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

      if i = '' then
        bRes := FormDM.tblCustomer.Locate('FirstName', f, [] )
      else
      begin
        if o = '' then
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
        else
          bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );
      end;

      formDM.tblOrder.Locate('ID', FormDM.qryAllOrders.FieldByName('ID').AsInteger, []);

      FormDM.bInsOrder := false;                 // Процесс создания нового заказа
      FormDM.bEditOrder := false;                // Процесс редактирования заказа
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;

      FormAddOrder.OnShowFromExistCustomer();
      FormAddOrder.Show;
    end;
  end;

end;

procedure TMainForm.FormDeactivate(Sender: TObject);
begin
  if (MainForm.bmTblOrder <> nil) then // берем только одну закладку
  begin
    // Сохраняем закладки
    MainForm.bmTblOrder := FormDM.tblOrder.GetBookmark;
    MainForm.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    MainForm.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    MainForm.bmTblPhones := FormDM.tblPhones.GetBookmark;
    MainForm.bmqryAllOrdersDop := FormDM.qryAllOrdersDop.GetBookmark;     // закладка для вкладки Все Заказы
    MainForm.bmTblInMoney := FormDM.tblMoney.GetBookmark;
  end;
end;

procedure TMainForm.FormActivate(Sender: TObject);
begin
  UpdateTabOrders();

  MainForm.StatusBar1.Panels[1].Text := 'Количество заказов '+ IntToStr(formDM.tblOrder.RecordCount);

  if (MainForm.bmTblOrder <> nil) then // берем только одну закладку
  begin
    FormDM.tblOrder.GotoBookmark(MainForm.bmTblOrder);
    FormDM.tblCustomer.GotoBookmark(MainForm.bmTblCustomer);
    FormDM.tblItemCurrent.GotoBookmark(MainForm.bmTblItemCurrent);
    FormDM.tblPhones.GotoBookmark(MainForm.bmTblPhones);
    FormDM.qryAllOrdersDop.GotoBookmark(MainForm.bmqryAllOrdersDop);
    FormDM.tblMoney.GotoBookmark(MainForm.bmTblInMoney);
  end;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // Закрываем БД
  FormAddOrder.Hide;
  FormDM.BDDisconnect;

  // Обнуляем закладки главной формы и формы создания заказа
  (*bmTblOrder := nil;
  bmTblCustomer := nil;
  bmTblItemCurrent := nil;
  bmTblPhones := nil;
  bmqryAllOrdersDop := nil;     // закладка для вкладки Все Заказы

  FormAddOrder.bmTblOrder := nil;
  FormAddOrder.bmTblCustomer := nil;
  FormAddOrder.bmTblItemCurrent := nil;
  FormAddOrder.bmTblPhones := nil;
  FormAddOrder.bmqryAllOrdersDop := nil;     // закладка для вкладки Все Заказы
  *)
  //
end;

procedure TMainForm.dtpAllOrdersSrartChange(Sender: TObject);
begin
  if dtpAllOrdersSrart.Date <> dtpAllOrdersEnd.Date then
    cbOnlyTodayOrders.Checked := false
  else
    cbOnlyTodayOrders.Checked := true;

  UpdateTabOrders();
end;

procedure TMainForm.dtpAllOrdersEndChange(Sender: TObject);
begin
  if DateToStr(dtpAllOrdersSrart.DateTime) <> DateToStr(dtpAllOrdersEnd.DateTime) then
    cbOnlyTodayOrders.Checked := false
  else
    cbOnlyTodayOrders.Checked := true;

  UpdateTabOrders();
end;

procedure TMainForm.dbgrdOrdersTitleClick(Column: TColumn);
var
  ss : string;
begin
  if FormDM.qryAllOrdersDop.FieldByName(Column.FieldName).Tag=0 then
  begin
    ss := ' ASC';
    FormDM.qryAllOrdersDop.FieldByName(Column.FieldName).Tag := 1;
  end
  else
  begin
    ss := ' DESC';
    FormDM.qryAllOrdersDop.FieldByName(Column.FieldName).Tag := 0;
   end;
  FormDM.qryAllOrdersDop.Sort:=Column.FieldName + ss;
end;

procedure TMainForm.N12Click(Sender: TObject);
begin
  if (FormDM.qryDolzhniki.RecordCount <> 0) then
  begin
    // Удалить временный заказ и открыть редактируемый
    // (возможно придется спросить у пользователя, удалять или нет?)
    FormAddOrder.DeleteTmpOrder(); // удаляем временный заказ

    // Перемещаемся на выбранный заказ
    FormDM.tblOrder.Locate('ID', FormDM.qryDolzhniki.FieldByName('ID').AsInteger,[]);

    FormDM.bInsOrder := false;                 // Процесс создания нового заказа
    FormDM.bEditOrder := true;                 // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    
    FormAddOrder.OnShowEditOrder();
    FormAddOrder.Show;
  end;
end;

procedure TMainForm.btnAddOrClick(Sender: TObject);
begin
  (*if FormAddOrder.bSave then
  begin
    ShowMessage('Сохраните заказ!');
    FormAddOrder.Show;
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
    FormAddOrder.OnShowAddOrder();
  end
  else  // находимся в режиме редактирования
  begin
    FormAddOrder.SaveOrder();
    FormDM.bInsOrder := true;                 // Процесс создания нового заказа
    FormDM.bEditOrder := false;                // Процесс редактирования заказа
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    FormAddOrder.OnShowAddOrder();
  end;

  // Обновляем все заказы
  FormDM.qryAllOrdersDop.Active := False;
  FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersSrart.DateTime);
  FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersEnd.DateTime);
  FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
  FormDM.qryAllOrdersDop.Active := True;

  FormAddOrder.Show;
end;

procedure TMainForm.cbStatusOrderChange(Sender: TObject);
begin
  UpdateTabOrders();
end;

procedure TMainForm.cbOnlyTodayOrdersMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if cbOnlyTodayOrders.Checked then
  begin
    dtpAllOrdersSrart.Date := Now;
    dtpAllOrdersEnd.Date := Now;
  end;

  if Not(cbOnlyTodayOrders.Checked) then
  begin
    dtpAllOrdersSrart.Date := IncMonth(Now,-1);
    dtpAllOrdersEnd.Date := Now;
  end;

  UpdateTabOrders();
end;

procedure TMainForm.UpdateTabOrders();
begin
  // Просроченные заказы
  if MainForm.cbStatusOrder.Text = 'Просрочено' then
  begin
    dbgrdOrders.DataSource := FormDM.dsProsroch;
    // Обновляем все заказы
    FormDM.qryProsroch.Active := False;
    FormDM.qryProsroch.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
    FormDM.qryProsroch.Active := True;
    MainForm.StatusBar1.Panels[2].Text := 'Заказы: ' + IntToStr(FormDM.qryProsroch.RecordCount);
    Exit;
  end;

  if MainForm.cbStatusOrder.Text = 'Не выдано' then
  begin
    dbgrdOrders.DataSource := FormDM.dsOrderNeVidano;
    // Обновляем все заказы
    FormDM.qryOrderNeVidano.Active := False;
    FormDM.qryOrderNeVidano.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersSrart.DateTime);
    FormDM.qryOrderNeVidano.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersEnd.DateTime);
    FormDM.qryOrderNeVidano.Active := True;
    MainForm.StatusBar1.Panels[2].Text := 'Заказы: ' + IntToStr(FormDM.qryOrderNeVidano.RecordCount);
  end;

  if (MainForm.cbStatusOrder.Text <> 'Не выдано') AND (MainForm.cbStatusOrder.Text <> 'Все заказы') then
  begin
    dbgrdOrders.DataSource := FormDM.dsAllOrdersDop;
    // Обновляем все заказы
    FormDM.qryAllOrdersDop.Active := False;
    FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersSrart.DateTime);
    FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersEnd.DateTime);
    FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
    FormDM.qryAllOrdersDop.Active := True;
    MainForm.StatusBar1.Panels[2].Text := 'Заказы: ' + IntToStr(FormDM.qryAllOrdersDop.RecordCount);
  end;

  if MainForm.cbStatusOrder.Text = 'Все заказы' then
  begin
    dbgrdOrders.DataSource := FormDM.dsAllOrders;
    // Обновляем все заказы
    FormDM.qryAllOrders.Active := False;
    FormDM.qryAllOrders.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersSrart.DateTime);
    FormDM.qryAllOrders.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dtpAllOrdersEnd.DateTime);
    FormDM.qryAllOrders.Active := True;
    MainForm.StatusBar1.Panels[2].Text := 'Заказы: ' + IntToStr(FormDM.qryAllOrders.RecordCount);
  end;
end;

procedure TMainForm.tsStatHide(Sender: TObject);
begin
  tsStat.Highlighted := false;
end;

procedure TMainForm.tsStatShow(Sender: TObject);
var
  i: Integer;
begin
  tsStat.Highlighted := true;

  cbStatWokers.Clear;
  // Заполняем значениями ФИО сотрудника
  FormDM.tblWokers.First;
  for i:=0 to FormDM.tblWokers.RecordCount-1 do
  begin
    cbStatWokers.Items.Add(FormDM.tblWokers.FieldByName('ShortName').AsString);
    FormDM.tblWokers.Next;
  end;
  cbStatWokers.ItemIndex := 3;

  // Запрос обновляем
  FormDM.qryStatWoker.Active := False;
  FormDM.qryStatWoker.Parameters[0].Value := cbStatWokers.Text;
  FormDM.qryStatWoker.Parameters[1].Value := dtpStartStat.DateTime;   // DataStart
  FormDM.qryStatWoker.Parameters[2].Value := dtpEndStat.DateTime;     // DataFinish
  FormDM.qryStatWoker.Active := True;
end;

procedure TMainForm.cbStatWokersChange(Sender: TObject);
begin
  // Запрос обновляем
  FormDM.qryStatWoker.Active := False;
  FormDM.qryStatWoker.Parameters[0].Value := cbStatWokers.Text;
  FormDM.qryStatWoker.Parameters[1].Value := dtpStartStat.DateTime;   // DataStart
  FormDM.qryStatWoker.Parameters[2].Value := dtpEndStat.DateTime;     // DataFinish
  FormDM.qryStatWoker.Active := True;
end;

procedure TMainForm.dtpStartStatChange(Sender: TObject);
begin
  // Запрос обновляем
  FormDM.qryStatWoker.Active := False;
  FormDM.qryStatWoker.Parameters[0].Value := cbStatWokers.Text;
  FormDM.qryStatWoker.Parameters[1].Value := dtpStartStat.DateTime;   // DataStart
  FormDM.qryStatWoker.Parameters[2].Value := dtpEndStat.DateTime;     // DataFinish
  FormDM.qryStatWoker.Active := True;
end;

procedure TMainForm.dtpEndStatChange(Sender: TObject);
begin
  // Запрос обновляем
  FormDM.qryStatWoker.Active := False;
  FormDM.qryStatWoker.Parameters[0].Value := cbStatWokers.Text;
  FormDM.qryStatWoker.Parameters[1].Value := dtpStartStat.DateTime;   // DataStart
  FormDM.qryStatWoker.Parameters[2].Value := dtpEndStat.DateTime;     // DataFinish
  FormDM.qryStatWoker.Active := True;
end;

end.


