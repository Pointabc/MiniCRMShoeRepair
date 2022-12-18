unit UnitAddCustomer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDM, StdCtrls, Mask, DBCtrls, Grids, DBGrids;

type
  TfrmAddCustomer = class(TForm)
    dbgrdCustomer: TDBGrid;
    DBGrid2: TDBGrid;
    cbbTypePhone: TComboBox;
    edtPhone: TEdit;
    btnAddCustomer: TButton;
    Button1: TButton;
    btnClose: TButton;
    Button2: TButton;
    edtFIO: TEdit;
    Button3: TButton;
    Button4: TButton;
    btnAddOrder: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure btnAddCustomerClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgrdCustomerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure btnAddOrderClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmAddCustomer: TfrmAddCustomer;

implementation

uses UnitAddOrder;

{$R *.dfm}

procedure TfrmAddCustomer.FormCreate(Sender: TObject);
var
  i:Integer;
begin
  // Инициализация формы
  // Заполняем значениями cbbTypePhone - типы телефонов
  FormDM.tblPhoneType.First;
  for i:=0 to formDm.tblPhoneType.RecordCount-1 do
  begin
    cbbTypePhone.Items.Add(FormDM.tblPhoneType.FieldByName('TypePhone').AsString);
    FormDM.tblPhoneType.Next;
  end;
  cbbTypePhone.ItemIndex := 0;

  FormDM.qryPhoneCustomer.Active := False;
  FormDM.qryPhoneCustomer.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
  FormDM.qryPhoneCustomer.Active := True;
end;

procedure TfrmAddCustomer.Button2Click(Sender: TObject);
begin
  // Добавляем телефон
  if edtPhone.Text <> '' then
  begin
    FormDM.tblPhones.Append;
    // Номер телефона
    FormDM.tblPhones.FieldByName('Phone').AsInteger := StrToInt64(edtPhone.Text);
    // Тип телефона
    FormDM.tblPhoneType.Locate('TypePhone',cbbTypePhone.Text,[]);
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := FormDM.tblPhoneType.FieldByName('ID').AsInteger;
    FormDM.tblPhones.FieldByName('ID_Customer').AsInteger := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.tblPhones.Post;

    FormDM.qryPhoneCustomer.Active := False;
    FormDM.qryPhoneCustomer.Parameters[0].Value := FormDM.tblCustomer.FieldByName('ID').AsInteger;
    FormDM.qryPhoneCustomer.Active := True;

    cbbTypePhone.ItemIndex := 0;
    edtPhone.Text := '';
  end;
end;

procedure TfrmAddCustomer.btnAddCustomerClick(Sender: TObject);
begin
  FormDM.tblCustomer.Insert;

  dbgrdCustomer.SetFocus;
  dbgrdCustomer.EditorMode := True;
end;

procedure TfrmAddCustomer.Button1Click(Sender: TObject);
begin
  if FormDM.tblCustomer.Modified then
    formDM.tblCustomer.Post;
end;

procedure TfrmAddCustomer.btnCloseClick(Sender: TObject);
begin
  if FormDM.tblCustomer.Modified then
    formDM.tblCustomer.Post;

  frmAddCustomer.Close;
end;

procedure TfrmAddCustomer.dbgrdCustomerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    FormDM.tblCustomer.Cancel;

  if (Key = VK_RETURN) then
  begin
    FormDM.tblCustomer.Edit;
    if FormDM.tblCustomer.FieldByName('FirstName').AsString <> '' then
      FormDM.tblCustomer.Post;
  end;
end;

procedure TfrmAddCustomer.Button3Click(Sender: TObject);
begin
  FormDM.tblCustomer.Filtered := True;
  FormDM.tblCustomer.Filter := 'FirstName = ' + QuotedStr(edtFIO.Text);
end;

procedure TfrmAddCustomer.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FormDM.tblCustomer.Filtered := False;
end;

procedure TfrmAddCustomer.Button4Click(Sender: TObject);
begin
  FormDM.tblCustomer.Filtered := False;
end;

procedure TfrmAddCustomer.btnAddOrderClick(Sender: TObject);
begin
  (*if FormDM.tblCustomer.RecordCount <> 0 then
  begin
    // перемещаемся на клиента
    f := FormDM.qryAllOrdersDop.FieldByName('FirstName').AsString;
    i := FormDM.qryAllOrdersDop.FieldByName('Customer.Name1').AsString;
    o := FormDM.qryAllOrdersDop.FieldByName('Otchestvo').AsString;

    if o = '' then
      bRes := FormDM.tblCustomer.Locate('FirstName;Name1', VarArrayOf([f,i]), [] )
    else
      bRes := FormDM.tblCustomer.Locate('FirstName;Name1;Otchestvo', VarArrayOf([f,i,o]), [] );

    //formDM.tblOrder.Locate('ID', FormDM.qryAllOrdersDop.FieldByName('ID').AsInteger, []);
    if bRes then
    begin
      FormDM.bInsOrderByExistCustomer := true;
      FormAddOrder.ShowModal;
    end;

    if Not(FormAddOrder.CreateOneMore()) then
      FormDM.bAddOneMoreOrder := false;
  end; *)
  
  FormDM.bInsOrder := false;                 // Процесс создания нового заказа
  FormDM.bEditOrder := false;                // Процесс редактирования заказа
  FormDM.bAddOneMoreOrder := false;
  FormDM.bInsOrderByExistCustomer := true;

  FormAddOrder.OnShowFromExistCustomer();
  FormAddOrder.Show;
end;

end.
