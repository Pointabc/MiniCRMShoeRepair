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

    // ��� ������
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

    // �������� ����� �������� ������
    bmTblOrder: TBookmark;
    bmTblCustomer: TBookmark;
    bmTblItemCurrent: TBookmark;
    bmTblPhones: TBookmark;
    bmqryAllOrdersDop: TBookmark;     // �������� ��� ������� ��� ������
    bmTblInMoney: TBookmark;          // �������� ��������� ������
  end;

var
  FormAddOrder: TFormAddOrder;

implementation

uses MainWnd, UnitLRItem, UnitItemColor, UnitItemType, UnitChipers,
  UnitPrice;

{$R *.dfm}

procedure TFormAddOrder.DeleteTmpOrder();
begin
  // ��������� �� ��������� ����� � ������� ���
  if FormDM.bInsOrder Or FormDM.bInsOrderByExistCustomer then
  begin
    // ��������������� ��������
    if (FormAddOrder.bmTblOrder <> nil) then // ����� ������ ���� ��������
    begin
      FormDM.tblOrder.GotoBookmark(FormAddOrder.bmTblOrder);
      FormDM.tblCustomer.GotoBookmark(FormAddOrder.bmTblCustomer);
      FormDM.tblItemCurrent.GotoBookmark(FormAddOrder.bmTblItemCurrent);
      //FormDM.tblPhones.GotoBookmark(FormAddOrder.bmTblPhones);
      //FormDM.tblMoney.GotoBookmark(FormAddOrder.bmTblInMoney);

      // ������� ��������� �����
      FormDM.tblOrder.Delete;
      if FormDM.bInsOrder then
        FormDM.tblCustomer.Delete;
      FormDM.tblItemCurrent.Delete;
      //FormDM.tblPhones.Delete;
      //FormDM.tblMoney.Delete;
      // ������� ��������� �����

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
  FormDM.bInsOrder := true;                 // ������� �������� ������ ������
  FormDM.bEditOrder := false;                // ������� �������������� ������
  FormDM.bInsOrderByExistCustomer := false;  // �������� ������ �� ������ ������������� �������
  FormDM.bAddOneMoreOrder := false;

  //bSave := false; // �� ���������

  dtpTimeFinish.Kind := dtkTime;

  FormAddOrder.bmTblOrder := nil;
  FormAddOrder.bmTblCustomer := nil;
  FormAddOrder.bmTblItemCurrent := nil;
  FormAddOrder.bmTblPhones := nil;
  FormAddOrder.bmTblInMoney := nil;

  // ��������� ���������� cbbGroupsWork - ������ �����
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    if Not(FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean) then
      cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;

  // ������� ������ - ������������ ���������� �����
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

  if FormDM.bInsOrder then    // �������� ������ ������
  begin
    OnShowAddOrder();
    // ��������� �������� ����� ������
    FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
    FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
    FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
    FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
    FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;
    //bmqryAllOrdersDop := FormDM.qryAllOrdersDop.GetBookmark;     // �������� ��� ������� ��� ������
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

  // �������� �� ����� ������ ������� (� ������� ��������� # )
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

  if not(bRes) then // �� �������
  begin
    // ���������������
    FormDM.tblCustomer.Edit;
    FormDM.tblCustomer.FieldByName('FirstName').AsString := f;
    FormDM.tblCustomer.Post;
    //Result := false;
  end
  else  // �������
  begin
    SavePlace1 := FormDM.tblCustomer.GetBookmark;
    // ��������� ID ���������� ���������
    tmpIDCustomer := FormDM.tblCustomer.fieldByName('ID').AsInteger;
    FormDM.tblCustomer.GotoBookmark(SavePlace);
    // ����� ��������� ������������ ����������� �������� � ���������� (����� ��������� ���� ���������)
    // 1. ��������� ������ � ������� ��������
    FormDM.tblPhones.Filtered := true;
    FormDM.tblPhones.Filter := 'ID_Customer='+IntToStr(FormDM.tblCustomer.fieldByName('ID').AsInteger);
    FormDM.tblPhones.First;
    for i:=0 to FormDM.tblPhones.RecordCount-1 do
    begin
      FormDM.tblPhones.Edit;
      FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := tmpIDCustomer;
      FormDM.tblPhones.Next;
    end;
    // T�� ����� ������� ����� ��������� ���������
    // T�� ����� ������� ����� ��������� ���������
    
    // ������� ����� ���������
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

  // ������� �������� ������ � ��������� ����� �������
  FormDM.qryTest.Active := False;
  FormDM.qryTest.SQL.Clear;

  FormDM.qryTest.SQL.Add('SELECT Customer.FirstName, Customer.Name1, Customer.Otchestvo, Customer.ID FROM Customer');
  FormDM.qryTest.SQL.Add('WHERE ((Customer.FirstName=:FirstName) AND (Customer.Name1=:Name1)');
  FormDM.qryTest.SQL.Add('AND (Customer.Otchestvo=:Otchestvo));');
  // ������������� �������� ����������
  FormDM.qryTest.Parameters[0].Value := dbedtFirstName.Text;  //'������������';
  FormDM.qryTest.Parameters[1].Value := dbedtName.Text;       //'����';
  FormDM.qryTest.Parameters[2].Value := dbedtOtchestvo.Text;  //'�����������';
  FormDM.qryTest.Active := true;
end;

procedure TFormAddOrder.FormShow(Sender: TObject);
var
  i:Integer;
begin
  (*// ��������� ������ ����� � ������
  // ��������� ���������� cbbGroupsWork - ������ �����
  cbbGroupsWork.Clear;
  FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;*)


  // ������������ � ��������� � ��������� ��������
  // 1. tblOrder    - �����
  // 2. tblCustomer - ��������
  // 3. tblItemCurrent - ������� �������
  // 4. tblPhones - ������� ���������
  // 5. tblManager
  // 6.
  // ...
  // ��������� �������
  // 1. qryCurWorks - ����������� ������
  // 2. qryInMoneyPrihod - ����������� ������ �� ������ ������
  // 3.

  //dtpTimeFinish.Kind := dtkTime;
  //btnPrintOrder.Enabled := false;

  // ������� ������ - ������������ ���������� �����
  //for i:=1 to 50 do
    //FormDM.arrChangeWorker[i] := False;

  // ��������� ���������� cbbGroupsWork - ������ �����
  (*FormDM.tblGroupWork.First;
  for i:=0 to formDm.tblGroupWork.RecordCount-1 do
  begin
    cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
    FormDM.tblGroupWork.Next;
  end;
  cbbGroupsWork.ItemIndex := 0;*)

  // �������� ����������
  //FormDM.conContn.BeginTrans;

  (*if FormDM.bEditOrder then   // ��������������
    OnShowEditOrder();
  if FormDM.bInsOrder then    // �������� ������ ������
    OnShowAddOrder();
  if FormDM.bInsOrderByExistCustomer then
    OnShowFromExistCustomer();*)
end;

// �������� ����� ������
procedure TFormAddOrder.btnAddNewOrderClick(Sender: TObject);
begin
  (*if bSave then
  begin
    ShowMessage('��������� �����!');
    //FormAddOrder.Show;
    Exit;
  end;*)

  if FormDM.bInsOrder OR FormDM.bInsOrderByExistCustomer then
  begin
    // ������� ��������� ����� � ������� �������������
    // (�������� �������� �������� � ������������, ������� ��� ���?)
    FormAddOrder.DeleteTmpOrder(); // ������� ��������� �����

    FormDM.bInsOrder := true;                 // ������� �������� ������ ������
    FormDM.bEditOrder := false;                // ������� �������������� ������
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    OnShowAddOrder();
  end
  else  // ��������� � ������ ��������������
  begin
    FormDM.bInsOrder := true;                 // ������� �������� ������ ������
    FormDM.bEditOrder := false;                // ������� �������������� ������
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := false;
    OnShowAddOrder();
  end;

  /// ��������� ��� ������
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
    // ��������� ���� �� ����� ������ � ������ ����������� �����

    // ��������� ������ ���������� ������
    FormDM.tblCrtOrders.Append;
    FormDM.tblCrtOrders.AppendRecord([nil,null,FormDM.tblOrder.FieldByName('ID').AsInteger]);

    // ��������� ������ � ������
    fld := 'NameWork';
    val := FormDM.qrySubWorks.FieldByName('NameWork').AsString;
    FormDM.tblWorks.Locate(fld,val,[]);

    FormDM.tblCrtOrders.Edit;
    FormDM.tblCrtOrders.FieldByName('ID_Work').AsInteger := FormDM.tblWorks.FieldByName('ID').AsInteger;
    FormDM.tblCrtOrders.FieldByName('ID_Woker').AsInteger := 4; // �� ��������� = ���
    FormDM.tblCrtOrders.Post;

    // ��������� ������ ��������� ������
    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;

    //FormDM.tblCrtOrders.Post;
    CoutSum();
    //bSave := true; // ���������

    // ��������� ������ � ���� ItemCurrent ��� �������� ������
    // �������� ���� = 3 = ���; 2 = �������; ���� = 6 = ���
(*    FormDM.tblItemCurrent.AppendRecord([nil, 1, 6, 2,
                                        FormDM.tblOrder.FieldByName('ID').AsInteger,
                                        FormDM.tblWorks.FieldByName('ID').AsInteger ]);

    // ������������� ����� �� ���� ���������� �������������� �������
    dblkcbbItems.SetFocus;

    // Co������� ������� ������
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;
*)

    // ��������� ��������� �� ������ ���� if ��� ������ �� �������, ����� ���������
    //if TestFillNeeded then
    //  btnPrintOrder.Enabled := True;

    // ��������� ������ � ������� Money
    //FormDM.tblMoney.Append;
    //FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    //FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    //FormDM.tblMoney.FieldByName('Sum').AsCurrency := FormDM.qryCurWorks.FieldByName('Price').AsCurrency;
    //FormDM.tblMoney.Post;

    // ��������� ��������� ����� ��� ������� ������
    //FormDM.qrySum.Active := False;
    //FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    //FormDM.qrySum.Active := True;

  end;

end;

procedure TFormAddOrder.btnPhoneClick(Sender: TObject);
begin
  // ��������� ������� ���������
  if dbedtPhone1.Text <> '' then
  begin
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // �� ��������� �������
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
  //ShowMessage('��������� ���� ������');
  // ��� �������� �������� ��������� ��������
  // 1. ����� ������� � ��� �� �������. (������� ��������� �������)
  // 2. � ����� ��������� ������ � ������.

  // �����������?
  (*if Application.MessageBox('����� ��������, ����� ����� ������!!!', '������� �����?', MB_YESNO) = IDYES	then
  begin
    // ������� ��������� ������
    // ������������ � ��������� � ��������� ��������
    // 1. tblOrder    - �����
    // 2. tblCustomer - ��������
    // 3. tblItemCurrent - ������� �������
    // 4. tblPhones - ������� ���������
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
    // � ������������ � ��������� � ��������(...)
    end;
  end;

  // ���������� �����
  FormDM.bInsOrder := false;                 // ������� �������� ������ ������
  FormDM.bEditOrder := false;                // ������� �������������� ������
  FormDM.bInsOrderByExistCustomer := false;
  FormDM.bAddOneMoreOrder := false;

  // ��������� ������ ��������� ������
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
begin  // � ��������������
  // ������� ����������� ������
  if FormDM.qryCurWorks.RecordCount <> 0 then
  begin
    // ���������� ID ������
    fld := 'NameWork';
    val := FormDM.qryCurWorks.FieldByName('NameWork').AsString;

    if FormDM.tblWorksDop.Locate(fld,val,[]) then
    begin
      b:=FormDM.tblCrtOrders.Locate('ID_Work;ID_Order',VarArrayOf([FormDM.tblWorksDop.FieldByName('ID').AsInteger, FormDM.tblOrder.FieldByName('ID').AsInteger]),[]);
      if b then
        FormDM.tblCrtOrders.Delete;
    end;
    // ��������� ������ ��������� ������
    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;
    // ����������� ����� �����
    CoutSum();
    //bSave := true; // ���������
  end;
end;

// ��������� ������ � ���������� ������
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
  // ������� ������� �������
  if FormDM.qryCustPhones.RecordCount <> 0 then
  begin
    b := FormDM.tblPhones.Locate('Phone;ID_Customer',VarArrayOf([FormDM.qryCustPhones.FieldByName('Phone').AsInteger, FormDM.tblOrder.FieldByName('ID_Customer').AsInteger]),[]);
    if b then
    begin
      FormDM.tblPhones.Delete;
    end;
    // ��������� ������ ��������� ������
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID_Customer').AsInteger;
    FormDM.qryCustPhones.Active := true;

    // ������������ �� ������ ��� ��������
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

// ��������� ��������� �� ������ ���� if ��� ������ �� �������, ����� ���������
function TFormAddOrder.TestFillNeeded(): Boolean;
var
  bRes: Boolean;
  //tmpstr: string;
begin
  if (dbedtFirstName.Text <> '') and (dbedtName.Text <> '') and (dbedtNKvit.Text <> '') and (dbedtNumCustomer.Text <> '') and (FormDM.qryCurWorks.RecordCount <> 0) then
    bRes := True
  else
  begin
    //ShowMessage('������� ��� ��������� ��� ������� ������ � ������!');
    ShowMessage('�� ��� ���� ���������!');
    bRes := False;
    dbedtFirstName.SetFocus;
    Exit;
  end;

  //  4. ���������� ���� ������
  //if dtpData.Date < StrToDateTime('30.12.1990') then
  //begin
    //ShowMessage('���������� ���� ������!');
    //FormAddOrder.dtpData.SetFocus;
    //bRes := False;
  //end;

  //  3. ���������� ��������
  if FormDM.tblOrder.FieldByName('ID_Manager').AsInteger = 6 then // ���
  begin
    //ShowMessage('�� ������ ��������!');
    ShowMessage('�� ��� ���� ���������!');
    dblkcbbInOrderCust.SetFocus;
    bRes := False;
    Exit;
  end;

  (*if FormDM.bInsOrder then
  begin
    if bRes then
    begin
      if Application.MessageBox('���� ������ ������ �����?', '��������� ���� ������', MB_YESNO) = IDNO	then
      begin
        FormAddOrder.dtpData.SetFocus;
        bRes := False;
      end;
      if bRes then // ������� �����������?
      begin
        if Application.MessageBox('������� ����������� �����?', '��������� �������', MB_YESNO) = IDNO	then
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
  // ��������� ��������� ������ ���������
  if (dbedtPayMoney.Text <> '') and (dbedtPayMoney.Text <> '0') then
  begin
    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // ��������� ������ � ������� Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    // ��������� �����
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := True;

    // � ������
    FormDM.qryInMoneyPrihod.Active := False;
    FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
    FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',Now());
    FormDM.qryInMoneyPrihod.Active := True;

    MainForm.StatusBar1.Panels[0].Text := '������ �� �������: ' + formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
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
  // �������� ������������ ����������� �����
  //if TestFillNeeded() then
  //begin
    // ������� ������ - ������������ ���������� �����
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    // ������������� ����� ������ 19:00
    //dtpTimeFinish.Time := SetTime('19:00:00');

    // ������� ������ � ������� Customer
    // 1. ��������� ���� �� ����� ������ (������ �������� ���)
    //    ���� ���� ������� ��������� ������ � ������ ������ �� ������� �������

    if TestExistCustomer() then
    begin
      FormDM.tblOrder.Edit;
      FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
      if FormDM.tblOrder.Modified then
        FormDM.tblOrder.Post;
    end
    else  // ������ ����� ������
    begin
      // ��������� config.ini ��������� ����
      Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
      numC := FormDM.tblCustomer.FieldByName('NumCustomer').AsInteger + 1;
      Ini.WriteInteger('NUMCUSTOMER','numC',numC);
      Ini.Free;
    end;

    // ���� ����� = 0 ��� ����� - �������
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;
    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // ���� ������� �� ����� ������� ������
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // � ���������
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // � ��������� (���� ��������� ������, ���� ���� = 0 ���.)

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // ��������� ����+����� ������ ������ ������
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // ��������� ������ � ������� WorkerInOrder (������� ����� ������� � �������)
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

    // ���������
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // ��������� ����� ��������� � config.ini
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numK := FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger + 1;
    Ini.WriteInteger('NUMKVIT','numK',numK);
    Ini.Free;

    // ��������� ����
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // ��������� ������� �� ������� �����
    UpdateSearchTab();

    // �����������?
    //if Application.MessageBox('����������� ���������?', '�����������?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bInsOrder := False;
    //FormDM.bAddOneMoreOrder := true;

    FormDM.tmpF := dbedtFirstName.text;
    FormDM.tmpN := dbedtName.Text;
    FormDM.tmpO := dbedtOtchestvo.Text;
  //end // ���� ��� ����������� ���� ��������� ����� �������
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
    // ������� ������ - ������������ ���������� �����
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

   Caption := '�������������� ������';
    //btnAddNewOrder.Caption := '��������� �����';
    dtpData.Date := FormDM.tblOrder.fieldByName('DataFinish').AsDateTime;
    dtpTimeFinish.ShowCheckbox := true;
    dtpTimeFinish.Time := FormDM.tblOrder.fieldByName('TimeFinish').AsDateTime;

    // ��������� � ������ ������ ��������� (������ ����)
    FormDM.tblCustomer.Locate('ID', FormDM.tblOrder.FieldByName('ID_Customer').AsInteger, []);

    // ������� ������ � ���� ��������
    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // �� ��������� �������
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;
    // ������� ����� c ���� Phone & Customer
    FormDM.tblPhones.Edit;
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // ��������� ��������
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := true;

    // ��������� ������ � ������� Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    // ��������� ������, ��������� ��������� �����
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := true;

    FormDM.qrySum.Active := False;
    FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qrySum.Active := True;

    FormDM.qryCurWorks.Active := False;
    FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryCurWorks.Active := true;

    // ��������� ������ ��������
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := True;

    CoutSum();
    UpdateSQLWork;

    // ��������� ��� ������
    FormDM.qryAllOrdersDop.Active := False;
    FormDM.qryAllOrdersDop.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersSrart.DateTime);
    FormDM.qryAllOrdersDop.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',MainForm.dtpAllOrdersEnd.DateTime);
    FormDM.qryAllOrdersDop.Parameters[2].Value := MainForm.cbStatusOrder.Text;
    FormDM.qryAllOrdersDop.Active := True;

    // ������������ �� ������ � ���� ItemCurrent (1 ������ ��� 1 ������!!!)
    FormDM.tblItemCurrent.Locate('ID_Order', FormDM.tblOrder.FieldByName('ID').AsInteger, []);

    // ��������� �������� ����� ������
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
  // ������� ��������� �����
  if FormDM.qryInsMoney.RecordCount <> 0 then
  begin
    b := FormDM.tblMoney.Locate('Sum;Data1;ID_Order',
                                VarArrayOf([FormDM.qryInsMoney.FieldByName('Sum').AsCurrency,
                                FormDM.qryInsMoney.FieldByName('Data1').AsDateTime,
                                FormDM.tblOrder.FieldByName('ID').AsInteger]), []);
    if b then
      FormDM.tblMoney.Delete;

    // ��������� ������, ��������� ��������� �����
    FormDM.qryInsMoney.Active := False;
    FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.qryInsMoney.Active := true;

    // ������������ �� ������ ��� �����
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
  sumSkidka := 0;     // ����� ������
  //sumOcenkaItem := 0; // ����� ������ �������

  FormDM.qryCurWorks.First;
  for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
  begin
    sum := sum + FormDM.qryCurWorks.FieldByName('Price').AsCurrency;
    FormDM.qryCurWorks.Next;
  end;
  // + ��������� ������
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
  // ������� �������� �����
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
  if MainForm.rbNumberCustomer.Checked then    // �� ������ �������
  begin
    FormDM.qryByNumCust.Active := False;
    FormDM.qryByNumCust.Parameters[0].Value := StrToInt(MainForm.edtSearch.Text);
    FormDM.qryByNumCust.Active := true;

    FormDM.qryByNumKvit.Active := False;
    FormDM.qryByFIO.Active := False;
  end;
  if MainForm.rbByDefault.Checked then   // �� �������
  begin
      FormDM.qryByFIO.Active := False;
      FormDM.qryByFIO.Parameters[0].Value := MainForm.edtSearch.Text;
      FormDM.qryByFIO.Active := true;

      FormDM.qryByNumKvit.Active := False;
      FormDM.qryByNumCust.Active := False;
    end;

    if MainForm.rbByNumKvitan.Checked then   // �� ������ ���������
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

  // �������� ����������� � ����� ������
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

  // ��������� ������ ����� � ������
  // ��������� ���������� cbbGroupsWork - ������ �����
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
  // ��������� ���� �����

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
  // ��������� ��������� �� ������ ���� if ��� ������ �� �������, ����� ���������
  if TestFillNeeded then
  begin
    // �������� ������ � ��������� � ��������� ����� xls
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

    // ��������� ��������
    numKvit := FormDM.tblOrder.fieldByName('NumberKvitancii').AsString;
    //Excel.Range['W1'] := '��������� � ' + numKvit;
    Excel.Range['AJ2'] := '� ' + numKvit;
    Excel.Range['BL20'] := '����. � ' + numKvit;
    //Excel.Range['CA19'] := numKvit;
    //Excel.Range['CA27'] := numKvit;
    Excel.Range['CD1'] := '�������� _____ ����. ����. � ' + numKvit; // � �����������

    // ���� ������
    data1 := FormDM.tblOrder.fieldByName('DateStart').AsString;
    Excel.Range['BP2'] := data1;
    Excel.Range['C19'] := '���� ������: ' + data1; // � ����������� �����
    //Excel.Range['CE1'] := '���� ������ __________';// � �����������

    // ���� + ����� ������
    data1 := DateToStr(dtpData.Date);
    Excel.Range['BP3'] := data1;
    Excel.Range['C20'] := '���� ������: ' + data1;

    // ��������
    f := FormDM.tblCustomer.fieldByName('FirstName').AsString;
    name1 := FormDM.tblCustomer.fieldByName('Name1').AsString;
    o := FormDM.tblCustomer.fieldByName('Otchestvo').AsString;
    fio := Trim(f + ' ' + name1 + ' ' + o);
    fio := TrimRight(fio);
    Excel.Range['A4'] := '��������: ' + fio + ' ����� ������� ' + FormDM.tblCustomer.FieldByName('NumCustomer').AsString;
    Excel.Range['CG19'] := '���.: ' + fio;

    // �������
    if FormDM.qryCustPhones.RecordCount <> 0 then
      tmpstr := FormDM.qryCustPhones.fieldByName('Phone').AsString // + ' ' +
    else
      tmpstr := '���';

    Excel.Range['W19'] := '��������: ' + fio + ' ' +
                          FormDM.tblCustomer.FieldByName('NumCustomer').AsString +
                          '; ���. ' + tmpstr; // � ����������� ����� ���+���
    Excel.Range['A5'] := '�������: ' + tmpstr;

    // �������
    Excel.Range['J8'] := dblkcbbItems.Text;
    // ����
    Excel.Range['J9'] := dblkcbbItemColor.Text;
    // �����/������
    Excel.Range['J10'] := dblkcbbLR.Text;
    // ���
    Excel.Range['J11'] := dblkcbbMZD.Text;
    // ������� � ����������� �����
    Excel.Range['W20'] := dblkcbbItems.Text + '; ' + dblkcbbItemColor.Text + '; ' +
                          dblkcbbMZD.Text + '; ' + dblkcbbLR.Text; // � ����������� �����

    // ������
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
      Excel.Range['C16'] := '������ %: ' + CurrToStr(skdka) + ' ����� ������ ���.: '+ CurrToStr(skidka);
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
      Excel.Range['C16'] := '������ %: ' + CurrToStr(skdka) + ' ����� ������ ���.: '+ CurrToStr(skidka);
    end;

    // ��������
    if dblkcbbInOrderCust.Text <> '' then
    begin
      Excel.Range['AJ5'] := '������: ' + dblkcbbInOrderCust.Text;
      Excel.Range['B30'] := '������: ' + dblkcbbInOrderCust.Text;
    end
    else
    begin
      Excel.Range['AJ4'] := '������: ���';
      Excel.Range['B30'] := '������: ���';
    end;

    // ������� �����
    cnt := 0;
    dgt := 8;   // ��� ���������
    dgt2 := 21; // ��� ������� �����
    codes := '';
    SetRoundMode(rmUp);
    dop1 := StrToInt(edtPriceWorks.text); // ����� ��������� �����
    FormDM.qryCurWorks.First;
    for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
    begin
      // ��������� ��������� ������ �� �������
      //cur := 100 - skdka; ����� �� ��������
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
      // ��������� ��������� ������ �� �������

      //codes := codes + FormDM.qryCurWorks.fieldByName('Ciphers.Name1').AsString + ' '; // �������� ��� �����
      tmpstr := FormDM.qryCurWorks.fieldByName('GroupeWork.Name1').AsString + ' ' +
                FormDM.qryCurWorks.fieldByName('NameWork').AsString;// + '; ' +
                //FormDM.qryCurWorks.fieldByName('Ciphers.Name1').AsString;// + '; ' +
                //FormDM.qryCurWorks.fieldByName('PerionGaranty').AsString;

      tmp := 'X'+IntToStr(dgt);   // ������������ ������
      Excel.Range[tmp] := tmpstr;
      tmp := 'BZ'+IntToStr(dgt);
      Excel.Range[tmp] := FormDM.qryCurWorks.fieldByName('Price').AsString + ',00';

      // ������� � ������� �����
      tmp := 'I'+IntToStr(dgt2);
      tmpstr := tmpstr + '; ' + CurrToStr(dop) + ' ���.'; // + ' - ' + FormDM.qryCurWorks.fieldByName('CurWoker').AsString;
      Excel.Range[tmp] := tmpstr;

      FormDM.qryCurWorks.Next;
      if cnt = 8 then // �������� 8 ����� � ���������
        Break;
      cnt := cnt + 1;
      dgt := dgt + 1;
      dgt2 := dgt2 + 1;  //��� ������� �����
    end;

    // ����� �����
    if Pos(',', edtPriceWorks.Text) = 0 then
    begin
      Excel.Range['BZ16'] := edtPriceWorks.Text + ',00';
      Excel.Range['Z29'] := '����� �����: ' + edtPriceWorks.Text + ',00 ���.';
    end
    else
    begin
      Excel.Range['BZ16'] := edtPriceWorks.Text;
      Excel.Range['Z29'] := '����� �����: ' + edtPriceWorks.Text + ' ���.';
    end;

    // �������� ������� �����
    Excel.Range['CA19'] := '��. � '+ numKvit + ', ��. ' + FormDM.tblCustomer.fieldByName('NumCustomer').AsString;
    //Excel.Range['CA26'] := '��. � '+ numKvit + ', ��. ' + FormDM.tblCustomer.fieldByName('NumCustomer').AsString;
    Excel.Range['CC19'] := '�� ' + codes; // �����
    //Excel.Range['CC26'] := '�� ' + codes; // �����
    // ��������� ������
    if Pos(',', edtPriceWorks.Text) = 0 then
    begin
      //Excel.Range['CD26'] := '����: ' + edtPriceWorks.Text + ',00';
      Excel.Range['CD19'] := '����: ' + edtPriceWorks.Text + ',00';
    end
    else
    begin
      //Excel.Range['CD26'] := '����: ' + edtPriceWorks.Text;
      Excel.Range['CD19'] := '����: ' + edtPriceWorks.Text;
    end;
    // ���� ������
    Excel.Range['CE19'] := '���� ���.: ' + DateToStr(dtpData.Date);
    //Excel.Range['CE26'] := '���� ���.: ' + DateToStr(dtpData.Date);
    // ����� ������
    //dtpTimeFinish.Format := 'HH:mm';
    data2 := TimeToStr(dtpTimeFinish.Time);
    if Length(data2)>5 then
      data2 := Copy(data2,0,5);
    Excel.Range['CF19'] := '���. ���.: ' + data2; 
    Excel.Range['CH1'] := '����� ������: ' + data2;
    //Excel.Range['CF26'] := '���. ���.: ' + data2; //TimeToStr(dtpTimeFinish.Time);

    // �������� ���� ���������
    cnt := 0;
    FormDM.qryInsMoney.First;
    for i:=0 to FormDM.qryInsMoney.RecordCount-1 do
    begin
      cnt := cnt + FormDM.qryInsMoney.FieldByName('Sum').AsInteger;
      FormDM.qryInsMoney.Next;
    end;
    
    Excel.Range['CH19'] := '��������: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + '���.';
    //Excel.Range['CG26'] := '��������: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + '���.';
    Excel.Range['BO17'] := '��������: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + '���.';
    Excel.Range['BP29'] := '��������: ' + IntToStr(StrToInt(edtPriceWorks.Text)-cnt) + '���.';

    // �����������
    Excel.Range['CE1'] := '���� ������ '+ DateToStr(FormDM.tblOrder.FieldByName('DateStart').AsDateTime) +
                          ' ���� ������ ' + DateToStr(FormDM.tblOrder.FieldByName('DataFinish').AsDateTime);
    Excel.Range['CF1'] := '����� �����:';// + dblkcbbManagerFinish.Text;
    Excel.Range['CG1'] := '����� ������� ' + dbedtNumCustomer.Text;


    //tmp := '�������� ___ ����. ��������� � ' + numKvit;
    //Excel.Range['CD1'] := tmp;

    // ������
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
  // ������� ��� �����?
  if Application.MessageBox('������� ����� �����, �� ������ ��������?', '������� ����� �����?', MB_YESNO) = IDYES	then
  begin
      if FormDM.qryAllOrdersDop.RecordCount <> 0 then
      begin
      // ������������ �� ������� (������ ���� �������)
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
  // �������� ������������ ����������� �����
  //if TestFillNeeded() then
  //begin
    // ������� ������ - ������������ ���������� �����
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    // ���� ����� = 0 ��� ����� - �������
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;
    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // ���� ������� �� ����� ������� ������
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // � ���������
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // ��������� ����+����� ������ ������ ������
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // ��� �������������� ��������� ������ ���������� ������
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

    // ���������
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // ��������� ����
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // ��������� ������� �� ������� �����
    UpdateSearchTab();

    // �����������?
    //if Application.MessageBox('����������� ���������?', '�����������?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bEditOrder := False;
    //FormDM.bAddOneMoreOrder := true;

    // ��������� ���, �� �������� ����� ����� ������� ����� �� ������, ����� �� �������.
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
  // ������� ������ - ������������ ���������� �����
  dtpData.Color := clMoneyGreen;
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

    Caption := '���������� ������';
    //btnAddNewOrder.Caption := '�������� �����';
    //dtpData.Date := StrToDateTime('30.12.1899');
    dtpData.Date := Now; // �� ��������� ������ ���� ������ �����������
    dtpTimeFinish.Time := StrToDateTime('19:00:00');

    // ������� ������ ��������� Orders, Customer, Phones
    // ������� ������ � ���� ��������
    FormDM.tblPhones.Append;
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // �� ��������� �������
    if FormDM.tblPhones.Modified then
        FormDM.tblPhones.Post;
    // ������� ������ � ������� ��������
    FormDM.tblCustomer.Append;
    FormDM.tblCustomer.FieldByName('FirstName').AsString := '';
    // ������� ����� ��������� �� config.ini
    // ������ config.ini ��������� ����
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numC := Ini.ReadInteger('NUMCUSTOMER','numC',0);
    Ini.Free;
    FormDM.tblCustomer.FieldByName('NumCustomer').AsInteger := numC; // ��������� ����� �������
    FormDM.tblCustomer.Post;

    // ������� ����� c ���� Phone & Customer
    FormDM.tblPhones.Edit;
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // ������� ������ � ������� �����
    FormDM.tblOrder.Append;
    FormDM.tblOrder.FieldByName('ID_Status').AsInteger := 5;  // �������
    FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0;     // ������ 0%

    // ��������� ����� �� ini �����
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    manag := Ini.ReadInteger('MANAGERID','manager',8);
    FormDM.tblOrder.FieldByName('ID_Manager').AsInteger := manag;
    Ini.Free;

    FormDM.tblOrder.FieldByName('DateStart').AsDateTime := Date();
    FormDM.tblOrder.FieldByName('TimeStart').AsDateTime := Time();
    FormDM.tblOrder.FieldByName('OcenkaItem').AsInteger := 0; // �� ���������
    FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0; // �� ��������� 0%
    FormDM.tblOrder.FieldByName('ID_ManagerFinish').AsInteger := 6; // ��������, �������� ����� = ���
    FormDM.tblOrder.FieldByName('Prim').AsString := ''; // ����������

    // ��������� ����� ��������� ��  config.ini
    // ������ config.ini ��������� ����
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    numK := Ini.ReadInteger('NUMKVIT','numK',0);
    FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger := numK; // ��������� ����� ���������
    Ini.Free;

    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // ��������� ������ � ���� ItemCurrent ��� �������� ������
    // �������� ���� = 3 = ���; 2 = �������; ���� = 6 = ���
    FormDM.tblItemCurrent.AppendRecord([nil, 35, 27, 4,
                                        FormDM.tblOrder.FieldByName('ID').AsInteger,
                                        null, 10 ]); 

    // Co������� ������� ������
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // ��������� ������ � ������� Money
    FormDM.tblMoney.Append;
    FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
    FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
    FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
    FormDM.tblMoney.Post;

    sum := 0;
    edtPriceWorks.Text := CurrToStr(sum);

    // ��������� ������ ��������
    FormDM.qryCustPhones.Active := False;
    FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryCustPhones.Active := True;

    // ��������� ������ ��������� �����
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

  // ��������� �������� ����� ������
  FormAddOrder.bmTblOrder := FormDM.tblOrder.GetBookmark;
  FormAddOrder.bmTblCustomer := FormDM.tblCustomer.GetBookmark;
  FormAddOrder.bmTblItemCurrent := FormDM.tblItemCurrent.GetBookmark;
  FormAddOrder.bmTblPhones := FormDM.tblPhones.GetBookmark;
  FormAddOrder.bmTblInMoney := FormDM.tblMoney.GetBookmark;
  
  //bSave := false; // �� ���������
  //ColoredForm();
end;

procedure TFormAddOrder.OnShowFromExistCustomer();
var
  numK, manag: Integer;
  sum: Currency;
  Ini: Tinifile;    // ini
  i:Integer;
begin
  // ������� ������ - ������������ ���������� �����
  dtpData.Color := clMoneyGreen;
  for i:=1 to 50 do
    FormDM.arrChangeWorker[i] := False;

  Caption := '���������� ������';
  //btnAddNewOrder.Caption := '�������� �����';
  // ������� ������ � �������� Orders Phones

  // ���� ��������� � ��������� � ����� �������
  // ������� ������ � ���� ��������
  FormDM.tblPhones.Append;
  FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // �� ��������� �������
  if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

  // ������� ����� c ���� Phone & Customer
  FormDM.tblPhones.Edit;
  FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  if FormDM.tblPhones.Modified then
    FormDM.tblPhones.Post;

  FormDM.tblOrder.Append;
  FormDM.tblOrder.FieldByName('ID_Status').AsInteger := 5;  // �������
  FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0;     // ������ 0%

  // ��������� ����� �� ini �����
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  manag := Ini.ReadInteger('MANAGERID','manager',6);
  FormDM.tblOrder.FieldByName('ID_Manager').AsInteger := manag;
  Ini.Free;

  FormDM.tblOrder.FieldByName('DateStart').AsDateTime := Date();
  FormDM.tblOrder.FieldByName('TimeStart').AsDateTime := Time();
  FormDM.tblOrder.FieldByName('OcenkaItem').AsInteger := 0; // �� ���������
  FormDM.tblOrder.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.tblOrder.FieldByName('Skidka').AsInteger := 0; // �� ��������� 0%
  FormDM.tblOrder.FieldByName('ID_ManagerFinish').AsInteger := 6; // ��������, �������� ����� = ���
  FormDM.tblOrder.FieldByName('Prim').AsString := ''; // ����������

  dtpData.Date := Now; //StrToDateTime('30.12.1899');
  dtpTimeFinish.Time := StrToDateTime('19:00:00');

  // ��������� ����� ��������� ��  config.ini
  // ������ config.ini ��������� ����
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  numK := Ini.ReadInteger('NUMKVIT','numK',0);
  FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger := numK; // ��������� ����� ���������
  Ini.Free;

  if FormDM.tblOrder.Modified then
    FormDM.tblOrder.Post;

  // ��������� ������ � ���� ItemCurrent ��� �������� ������
  // �������� ���� = 3 = ���; 2 = �������; ���� = 6 = ���
  FormDM.tblItemCurrent.AppendRecord([nil, 35, 27, 4,
                                      FormDM.tblOrder.FieldByName('ID').AsInteger,
                                      null, 10 ]);

  // Co������� ������� ������
  if FormDM.tblItemCurrent.Modified then
    FormDM.tblItemCurrent.Post;

  // ��������� ������ � ������� Money
  FormDM.tblMoney.Append;
  FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
  FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
  FormDM.tblMoney.Post;

  sum := 0;
  edtPriceWorks.Text := CurrToStr(sum);

  // ��������� ������, ��������� ��������� �����
  FormDM.qryInsMoney.Active := False;
  FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryInsMoney.Active := true;

  FormDM.qrySum.Active := False;
  FormDM.qrySum.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qrySum.Active := True;

  FormDM.qryCurWorks.Active := False;
  FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryCurWorks.Active := true;

  // ��������� ������ ��������
  FormDM.qryCustPhones.Active := False;
  FormDM.qryCustPhones.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.qryCustPhones.Active := True;

  UpdateSQLWork;

  // ��������� �������� ����� ������
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
  // �������� ������������ ����������� �����
  //if TestFillNeeded() then
  //begin
    // ������� ������ - ������������ ���������� �����
    for i:=1 to 50 do
      FormDM.arrChangeWorker[i] := False;

    if FormDM.tblCrtOrders.Modified then
      FormDM.tblCrtOrders.Post;
    if FormDM.tblCustomer.Modified then
      FormDM.tblCustomer.Post;

    // ���� ������� �� ����� ������� ������
    //if( FormDM.tblPhones.FieldByName('Phone').AsString = '') Or (FormDM.tblPhones.FieldByName('Phone') = nil) then
      //FormDM.tblPhones.Delete;
    // � ���������
    if FormDM.tblPhones.Modified then
      FormDM.tblPhones.Post;

    // ���� ����� = 0 ��� ����� - �������
    //if (FormDM.tblMoney.FieldByName('Sum').AsString = '0') Or
      // (FormDM.tblMoney.FieldByName('Sum').AsString = '') then
      //FormDM.tblMoney.Delete;

    if FormDM.tblMoney.Modified then
      FormDM.tblMoney.Post;

    // ��������� ����+����� ������ ������ ������
    FormDM.tblOrder.Edit;
    FormDM.tblOrder.FieldByName('DataFinish').AsDateTime := dtpData.Date;
    FormDM.tblOrder.FieldByName('TimeFinish').AsDateTime := dtpTimeFinish.Time;
    if FormDM.tblOrder.Modified then
      FormDM.tblOrder.Post;

    // ��������� ������ � ������� WorkerInOrder (������� ����� ������� � �������)
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

    // ���������
    if FormDM.tblWorksInOrder.Modified then
      FormDM.tblWorksInOrder.Post;

    // ��������� � config.ini
    Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
    Ini.WriteInteger('NUMKVIT','numK',FormDM.tblOrder.FieldByName('NumberKvitancii').AsInteger + 1);
    Ini.Free;

    // ��������� ����
    if FormDM.tblItemCurrent.Modified then
      FormDM.tblItemCurrent.Post;

    // ��������� ������� �� ������� �����
    UpdateSearchTab();

    // �����������?
    //if Application.MessageBox('����������� ���������?', '�����������?', MB_YESNO) = IDYES	then
      //PrintOrder();

    //FormDM.bInsOrderByExistCustomer := False;
    //FormDM.bAddOneMoreOrder := true;

    FormDM.tmpF := dbedtFirstName.text;
    FormDM.tmpN := dbedtName.Text;
    FormDM.tmpO := dbedtOtchestvo.Text;

    // ��������� �������� ����� ������
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
  // ��������� ������ � ���� � ������� ����� (������� ����� �����)
  //dblkcbbStatusOrder.ReadOnly := true;
  //dblkcbbManagerFinish.ReadOnly := true;

  if FormDM.bInsOrder then // ��������� ����� �����
  begin
    OnAddOrder();
    //bSave := false; // �� ���������
  end;

  if FormDM.bEditOrder then // ����������� ������������ �����
  begin
    OnSaveEditOrder();
    //bSave := false; // �� ���������
  end;

  if FormDM.bInsOrderByExistCustomer then
  begin
    OnAddOrderFromExist();
    //bSave := false; // �� ���������
  end;

  if FormDM.bAddOneMoreOrder then
  begin
    // �������� �������� �������� ���������?
    if Application.MessageBox('�������� ��������� ��� ���������� ������?', '�������� ��� ��?', MB_YESNO) = IDYES	then
    begin
      FormDM.bInsOrder := false;                 // ������� �������� ������ ������
      FormDM.bEditOrder := false;                // ������� �������������� ������
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;
      OnShowFromExistCustomer();
    end
    else
    begin
      FormDM.bInsOrder := true;                 // ������� �������� ������ ������
      FormDM.bEditOrder := false;                // ������� �������������� ������
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := false;
      OnShowAddOrder();
    end;
  end;

  // ��������� ��� ������
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

  // ��������� ������
  FormAddOrder.UpdateSQLWork;
  // ��������� � ����������� ������ �����
  if FormPrice.bm <> nil then
    FormDM.tblWorks.GotoBookmark(FormPrice.bm);
  FormPrice.bm := nil;

  (*if FormDM.bEditOrder then   // ��������������
  begin
    OnShowEditOrder();
    Exit;
  end;
  //if FormDM.bInsOrder then    // �������� ������ ������
    //OnShowAddOrder();
  if FormDM.bInsOrderByExistCustomer then
  begin
    OnShowFromExistCustomer();
    Exit;
  end;*)

  // ��������������� ��������
  if (FormAddOrder.bmTblOrder <> nil) then // ����� ������ ���� ��������
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
    
  // ��������� ��������
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
    // ��������� ��������� ������ ���������
    if (dbedtPayMoney.Text <> '') and (dbedtPayMoney.Text <> '0') then
    begin
      if FormDM.tblMoney.Modified then
        FormDM.tblMoney.Post;

      // ��������� ������ � ������� Money
      FormDM.tblMoney.Append;
      FormDM.tblMoney.FieldByName('ID_Order').AsInteger := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.tblMoney.FieldByName('Sum').AsCurrency := 0;
      FormDM.tblMoney.FieldByName('Data1').AsDateTime := SysUtils.Date;
      FormDM.tblMoney.Post;

      // ��������� �����
      FormDM.qryInsMoney.Active := False;
      FormDM.qryInsMoney.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
      FormDM.qryInsMoney.Active := True;

      // � ������
      FormDM.qryInMoneyPrihod.Active := False;
      FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
      FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',Now());
      FormDM.qryInMoneyPrihod.Active := True;

      MainForm.StatusBar1.Panels[0].Text := '������ �� �������: ' + formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
      //bSave := true; // ���������
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

        // ��������� ������� ���������
        if dbedtPhone1.Text <> '' then
        begin
          if FormDM.tblPhones.Modified then
            FormDM.tblPhones.Post;

          FormDM.tblPhones.Append;
          FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := 2; // �� ��������� �������
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
  //bSave := true; // ���������
end;

procedure TFormAddOrder.btnForExistCustomerClick(Sender: TObject);
begin
  if Not(FormDM.bInsOrder AND (dbedtFirstName.Text = '') ) then
  begin
    if dbedtFirstName.Text <> '' then // ���� ���� ������ ������� ���������
      SaveOrder();
    FormDM.bInsOrder := false;                 // ������� �������� ������ ������
    FormDM.bEditOrder := false;                // ������� �������������� ������
    FormDM.bAddOneMoreOrder := false;
    FormDM.bInsOrderByExistCustomer := true;
    OnShowFromExistCustomer();
  end;
end;

procedure TFormAddOrder.btnSaveOrdClick(Sender: TObject);
begin
  if dbedtFirstName.Text <> '' then // ���� ���� ������ ������� ���������
    SaveOrder();
end;

procedure TFormAddOrder.SaveOrder();
begin
  if FormDM.bInsOrder then // ��������� ����� �����
  begin
    OnAddOrder();
    FormDM.bInsOrder := false;
    FormDM.bEditOrder := true;
    //bSave := false; // �� ���������
  end;

  if FormDM.bEditOrder then // ����������� ������������ �����
  begin
    OnSaveEditOrder();
    //bSave := false; // �� ���������
  end;

  if FormDM.bInsOrderByExistCustomer then
  begin
    OnAddOrderFromExist();
    FormDM.bInsOrderByExistCustomer := false;
    FormDM.bEditOrder := true;
    //bSave := false; // �� ���������
  end;

  (*if FormDM.bAddOneMoreOrder then
  begin
    // �������� �������� �������� ���������?
    if Application.MessageBox('�������� ��������� ��� ���������� ������?', '�������� ��� ��?', MB_YESNO) = IDYES	then
    begin
      FormDM.bInsOrder := false;                 // ������� �������� ������ ������
      FormDM.bEditOrder := false;                // ������� �������������� ������
      FormDM.bAddOneMoreOrder := false;
      FormDM.bInsOrderByExistCustomer := true;
      OnShowFromExistCustomer();
    end
    else
    begin
      FormDM.bInsOrder := true;                 // ������� �������� ������ ������
      FormDM.bEditOrder := false;                // ������� �������������� ������
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
  // ��� �������� ��������� ����� � �������� ���� ������
  //if dbedtFirstName.Text <> '' then // ���� ���� ������ ������� ���������
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
    // �������
    if dbedtFirstName.Text <> '' then
      dbedtFirstName.Color := clWindow
    else
      dbedtFirstName.Color := clMoneyGreen;

    // ���
    if dbedtName.Text <> '' then
      dbedtName.Color := clWindow
    else
      dbedtName.Color := clMoneyGreen;

    // ��������� ��������
    if dblkcbbInOrderCust.Text <> '���' then
      dblkcbbInOrderCust.Color := clWindow
    else
      dblkcbbInOrderCust.Color := clMoneyGreen;

    // ������
    if FormDM.qryCurWorks.Active then
    begin
      if FormDM.qryCurWorks.RecordCount <> 0 then
        dbgrdAddedWorks.Color := clWindow
      else
        dbgrdAddedWorks.Color := clMoneyGreen;
    end;

    // �������
    if dblkcbbItems.Text <> '���' then
      dblkcbbItems.Color := clWindow
    else
      dblkcbbItems.Color := clMoneyGreen;

    // ����
    if dblkcbbItemColor.Text <> '���' then
      dblkcbbItemColor.Color := clWindow
    else
      dblkcbbItemColor.Color := clMoneyGreen;

    // ���
    if dblkcbbMZD.Text <> '���' then
      dblkcbbMZD.Color := clWindow
    else
      dblkcbbMZD.Color := clMoneyGreen;

    // ����/���
    if dblkcbbLR.Text <> '���' then
      dblkcbbLR.Color := clWindow
    else
      dblkcbbLR.Color := clMoneyGreen;


    // ��������� �����
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
  Ini: Tinifile; // ������� ���������� ���� Tinifile
begin
  // ��������� config.ini ��������� ����
  Ini := TiniFile.Create(extractfilepath(Application.ExeName)+'config.ini');
  manag := FormDM.tblOrder.FieldByName('ID_Manager').AsInteger;
  Ini.WriteInteger('MANAGERID','manager',manag);
  Ini.Free;
end;

end.
