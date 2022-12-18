unit UnitItemColor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, UnitDM;

type
  TfrmItemColor = class(TForm)
    dbgrdItemColor: TDBGrid;
    btnAdd: TButton;
    btnSave: TButton;
    btnClose: TButton;
    procedure btnAddClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure dbgrdItemColorKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmItemColor: TfrmItemColor;

implementation

{$R *.dfm}

procedure TfrmItemColor.btnAddClick(Sender: TObject);
begin
  FormDM.tblItemColor.Insert;
  FormDM.tblItemColor.FieldByName('DelOrNot').AsBoolean := False;
  dbgrdItemColor.SetFocus;
  dbgrdItemColor.EditorMode := True;
end;

procedure TfrmItemColor.btnSaveClick(Sender: TObject);
begin
    if FormDM.tblItemColor.Modified then
    FormDM.tblItemColor.Post;
end;

procedure TfrmItemColor.btnCloseClick(Sender: TObject);
begin
  if FormDM.tblItemColor.Modified then
    FormDM.tblItemColor.Post;
  
  frmItemColor.Close;
end;

procedure TfrmItemColor.dbgrdItemColorKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if FormDM.tblItemColor.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblItemColor.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblItemColor.Edit;
    if FormDM.tblItemColor.FieldByName('Name1').AsString <> '' then
      FormDM.tblItemColor.Post;
  end;
end;

procedure TfrmItemColor.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  i: Integer;
begin
  // Удаляем записи с пустыми значениями
  FormDM.tblItemColor.First;
  for i:=0 to FormDM.tblItemColor.RecordCount-1 do
  begin
    if FormDM.tblItemColor.FieldByName('Name1').AsString = '' then
      FormDM.tblItemColor.Delete;
    FormDM.tblItemColor.Next;
  end;
end;

end.
