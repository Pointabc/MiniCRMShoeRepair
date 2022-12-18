unit UnitChipers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDM, StdCtrls, Grids, DBGrids, Menus;

type
  TFormChiper = class(TForm)
    dbgrdChipers: TDBGrid;
    lbl1: TLabel;
    btnAdd: TButton;
    btnSave: TButton;
    btnClose: TButton;
    pmChipers: TPopupMenu;
    mniAdd: TMenuItem;
    mniEdit: TMenuItem;
    mniDel: TMenuItem;
    procedure btnAddClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mniAddClick(Sender: TObject);
    procedure mniDelClick(Sender: TObject);
    procedure dbgrdChipersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormChiper: TFormChiper;

implementation

{$R *.dfm}

procedure TFormChiper.btnAddClick(Sender: TObject);
begin
  FormDM.tblCiphers.Insert;
  FormDM.tblCiphers.FieldByName('DelOrNot').AsBoolean := False;
  dbgrdChipers.SetFocus;
  dbgrdChipers.EditorMode := True;
end;

procedure TFormChiper.btnCloseClick(Sender: TObject);
begin
  if FormDM.tblCiphers.Modified then
    FormDM.tblCiphers.Post;
  
  FormChiper.Close;
end;

procedure TFormChiper.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: Integer;
begin
  if FormDM.tblCiphers.Modified then
    FormDM.tblCiphers.Post;

  // Удаляем записи с пустыми значениями
  FormDM.tblCiphers.First;
  for i:=0 to FormDM.tblCiphers.RecordCount-1 do
  begin
    if FormDM.tblCiphers.FieldByName('Name1').AsString = '' then
      FormDM.tblCiphers.Delete;
    FormDM.tblCiphers.Next;
  end;

end;

procedure TFormChiper.mniAddClick(Sender: TObject);
begin
  FormDM.tblCiphers.Insert;
  dbgrdChipers.SetFocus;
  dbgrdChipers.EditorMode := True;
end;

procedure TFormChiper.mniDelClick(Sender: TObject);
begin
  if Application.MessageBox(PChar('Вы действительно хотите удалить запись?'), 'Внимание!!!', MB_OKCANCEL) = ID_OK then
    FormDM.tblCiphers.Delete;
end;

procedure TFormChiper.dbgrdChipersKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FormDM.tblCiphers.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblCiphers.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblCiphers.Edit;
    //if FormDM.tblCiphers.Modified then
    if FormDM.tblCiphers.FieldByName('Name1').AsString <> '' then
      FormDM.tblCiphers.Post;
  end;
end;

procedure TFormChiper.btnSaveClick(Sender: TObject);
begin
  if FormDM.tblCiphers.Modified then
    FormDM.tblCiphers.Post;
end;

end.
