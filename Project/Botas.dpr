program Botas;

uses
  Forms,
  MainWnd in 'MainWnd.pas' {MainForm},
  UnitAddOrder in 'UnitAddOrder.pas' {FormAddOrder},
  UnitSpravochnik in 'UnitSpravochnik.pas' {FormSpravWokers},
  UnitDM in 'UnitDM.pas' {FormDM},
  UnitPrice in 'UnitPrice.pas' {FormPrice},
  UnitChipers in 'UnitChipers.pas' {FormChiper},
  UnitItemColor in 'UnitItemColor.pas' {frmItemColor},
  UnitItemType in 'UnitItemType.pas' {frmItemType},
  UnitLRItem in 'UnitLRItem.pas' {frmLR},
  UnitAddCustomer in 'UnitAddCustomer.pas' {frmAddCustomer},
  UnitInMoney in 'UnitInMoney.pas' {frmMoney};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMainForm, MainForm);
  Application.CreateForm(TFormDM, FormDM);
  Application.CreateForm(TFormAddOrder, FormAddOrder);
  Application.CreateForm(TFormSpravWokers, FormSpravWokers);
  Application.CreateForm(TFormPrice, FormPrice);
  Application.CreateForm(TFormChiper, FormChiper);
  Application.CreateForm(TfrmItemColor, frmItemColor);
  Application.CreateForm(TfrmItemType, frmItemType);
  Application.CreateForm(TfrmLR, frmLR);
  Application.CreateForm(TfrmAddCustomer, frmAddCustomer);
  Application.CreateForm(TfrmMoney, frmMoney);
  Application.Run;
end.
