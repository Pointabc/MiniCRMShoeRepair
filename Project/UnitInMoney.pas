unit UnitInMoney;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, UnitDM, DateUtils;

type
  TfrmMoney = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    dStart: TDateTimePicker;
    dEnd: TDateTimePicker;
    edtSum: TEdit;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dStartChange(Sender: TObject);
    procedure dEndChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMoney: TfrmMoney;

implementation

{$R *.dfm}

procedure TfrmMoney.FormShow(Sender: TObject);
begin
  // Форма Получить доход за период
  dStart.Date := Now(); //IncDay(Now,-1);
  dEnd.Date := Now();

  FormDM.qryInMoneyPrihod.Active := False;
  FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dStart.DateTime);
  FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dEnd.DateTime);
  FormDM.qryInMoneyPrihod.Active := True;

  edtSum.Text := FormDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
end;

procedure TfrmMoney.dStartChange(Sender: TObject);
begin
  FormDM.qryInMoneyPrihod.Active := False;
  FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dStart.DateTime);
  FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dEnd.DateTime);
  FormDM.qryInMoneyPrihod.Active := True;

  edtSum.Text := FormDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
end;

procedure TfrmMoney.dEndChange(Sender: TObject);
begin
  FormDM.qryInMoneyPrihod.Active := False;
  FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',dStart.DateTime);
  FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',dEnd.DateTime);
  FormDM.qryInMoneyPrihod.Active := True;

  edtSum.Text := FormDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString;
end;

end.
