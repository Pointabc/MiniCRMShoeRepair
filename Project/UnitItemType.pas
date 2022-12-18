unit UnitItemType;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDM, StdCtrls, Grids, DBGrids;

type
  TfrmItemType = class(TForm)
    dbgrdItemType: TDBGrid;
    btnAdd: TButton;
    btnSave: TButton;
    btnCancel: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemType: TfrmItemType;

implementation

{$R *.dfm}

procedure TfrmItemType.btnAddClick(Sender: TObject);
begin
  FormDM.tblItem.Insert;
  FormDM.tblItem.FieldByName('DelOrNot').AsBoolean := False;
  dbgrdItemType.SetFocus;
  dbgrdItemType.EditorMode := True;
end;

procedure TfrmItemType.btnSaveClick(Sender: TObject);
begin
  if FormDM.tblItem.Modified then
    FormDM.tblItem.Post;
end;

procedure TfrmItemType.btnCancelClick(Sender: TObject);
begin
  if FormDM.tblItem.Modified then
    FormDM.tblItem.Post;

  frmItemType.Close;
end;

procedure TfrmItemType.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
begin
  // Удаляем записи с пустыми значениями
  FormDM.tblItem.First;
  for i:=0 to FormDM.tblItem.RecordCount-1 do
  begin
    if FormDM.tblItem.FieldByName('NameItem').AsString = '' then
      FormDM.tblItem.Delete;
    FormDM.tblItem.Next;
  end;
end;

end.
