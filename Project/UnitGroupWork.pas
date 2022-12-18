unit UnitGroupWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, UnitDM, StdCtrls, Menus;

type
  TFormTypeItems = class(TForm)
    DBGrid1: TDBGrid;
    btnSave: TButton;
    btnCancel: TButton;
    btnAdd: TButton;
    pm1: TPopupMenu;
    N1Add: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure btnSaveClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure N1AddClick(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormTypeItems: TFormTypeItems;

implementation

{$R *.dfm}

procedure TFormTypeItems.btnSaveClick(Sender: TObject);
begin
  // Сохранить Вид изделия
  if FormDM.tblItem.Modified then
    FormDM.tblItem.Post;
end;

procedure TFormTypeItems.btnCancelClick(Sender: TObject);
begin
  //FormDM.tblItem.Cancel;
  if FormDM.tblItem.Modified then
    FormDM.tblItem.Post;
    
  FormTypeItems.Close;
end;

procedure TFormTypeItems.btnAddClick(Sender: TObject);
begin
  FormDM.tblItem.Last;
  FormDM.tblItem.Insert;
  DBGrid1.SetFocus;
  DBGrid1.EditorMode := True;
end;

procedure TFormTypeItems.N1AddClick(Sender: TObject);
begin
  FormDM.tblItem.Insert;
  DBGrid1.SetFocus;
  DBGrid1.EditorMode := True;
end;

procedure TFormTypeItems.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //DBGrid1.EditorMode := True;

  if FormDM.tblItem.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblItem.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblItem.Edit;
    //if FormDM.tblItem.Modified then
    if FormDM.tblItem.FieldByName('NameItem').AsString <> '' then
      FormDM.tblItem.Post;
  end;
end;

procedure TFormTypeItems.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Сохранить Вид изделия при закрытии
  if FormDM.tblItem.Modified then
    FormDM.tblItem.Post;
end;

end.
