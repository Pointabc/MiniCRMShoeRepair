unit UnitLRItem;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UnitDM, StdCtrls;

type
  TfrmLR = class(TForm)
    dbgridLR: TDBGrid;
    btnAdd: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure dbgridLRKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmLR: TfrmLR;

implementation

{$R *.dfm}

procedure TfrmLR.btnAddClick(Sender: TObject);
begin
  FormDM.tblLR.Insert;
  FormDM.tblLR.FieldByName('DelOrNot').AsBoolean := False;
  dbgridLR.SetFocus;
  dbgridLR.EditorMode := True;
end;

procedure TfrmLR.btnSaveClick(Sender: TObject);
begin
  if FormDM.tblLR.Modified then
    FormDM.tblLR.Post;
end;

procedure TfrmLR.btnCancelClick(Sender: TObject);
begin
  if FormDM.tblLR.Modified then
    FormDM.tblLR.Post;

  frmLR.Close;
end;

procedure TfrmLR.dbgridLRKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FormDM.tblLR.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblLR.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblLR.Edit;
    if FormDM.tblLR.FieldByName('Name1').AsString <> '' then
      FormDM.tblLR.Post;
  end;
end;

procedure TfrmLR.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  // Удаляем записи с пустыми значениями
  FormDM.tblLR.First;
  for i:=0 to FormDM.tblLR.RecordCount-1 do
  begin
    if FormDM.tblLR.FieldByName('Name1').AsString = '' then
      FormDM.tblLR.Delete;
    FormDM.tblLR.Next;
  end;
end;

end.
