unit UnitEditOrder;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, DBCtrls, Grids, DBGrids, Mask, UnitDM;

type
  TFormEditOrder = class(TForm)
    lbl14: TLabel;
    dbedtNKvit: TDBEdit;
    lbl1: TLabel;
    dbedtFirstName: TDBEdit;
    lbl2: TLabel;
    dbedtName: TDBEdit;
    lbl3: TLabel;
    dbedtOtchestvo: TDBEdit;
    grpPhoneEditOrder: TGroupBox;
    dbgrdPhones: TDBGrid;
    lbl11: TLabel;
    dbchkSpeed: TDBCheckBox;
    lbl12: TLabel;
    dtpData: TDateTimePicker;
    lbl6: TLabel;
    dblkcbbItems: TDBLookupComboBox;
    lbl5: TLabel;
    dblkcbbWoker: TDBLookupComboBox;
    lbllb222: TLabel;
    dblkcbbInOrderCust: TDBLookupComboBox;
    lbl10: TLabel;
    dbedtPayMoney: TDBEdit;
    lbl9: TLabel;
    edtPriceWorks: TEdit;
    dbgrdAddedWorks: TDBGrid;
    lbl13: TLabel;
    pmDelWork: TPopupMenu;
    mniDelWorks: TMenuItem;
    lbl15: TLabel;
    dbedtNumCustomer: TDBEdit;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormEditOrder: TFormEditOrder;

implementation

{$R *.dfm}

procedure TFormEditOrder.FormShow(Sender: TObject);
var
  sum: Currency;
  i: Integer;
begin

  FormDM.tblCustomer.Locate('ID',FormDM.tblOrder.FieldByName('ID_Customer').AsInteger,[]);


  // Обновляем запрос выводящий работы
  FormDM.qryCurWorks.Active := False;
  FormDM.qryCurWorks.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID').AsInteger;
  FormDM.qryCurWorks.Active := true;

  sum := 0;
  FormDM.qryCurWorks.First;
  for i:=0 to FormDM.qryCurWorks.RecordCount-1 do
  begin
    sum := sum + FormDM.qryCurWorks.FieldByName('Price').AsCurrency;
    FormDM.qryCurWorks.Next;
  end;
  edtPriceWorks.Text := CurrToStr(sum);


  FormDM.qryCustPhones.Active := False;
  FormDM.qryTest.Parameters[0].Value := FormDM.tblOrder.FieldByName('ID_Customer').AsInteger;
  FormDM.qryCustPhones.Active := true;

  ShowMessage( IntToStr(FormDM.qryCustPhones.RecordCount));
end;

end.
