unit UnitSpravochnik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGrids, UnitDataModule, UnitDM, Mask, Menus;

type
  TFormSpravWokers = class(TForm)
    dbgrdSpravochnik: TDBGrid;
    btnSaveSprav: TButton;
    btnCancel: TButton;
    dbgrdPhones: TDBGrid;
    lbl1: TLabel;
    cbbTypePhone: TComboBox;
    btnAddPhone: TButton;
    btnAddWokers: TButton;
    edtPhone: TEdit;
    pmDelPhone: TPopupMenu;
    N1: TMenuItem;
    cbbProf: TComboBox;
    pmWokerManager: TPopupMenu;
    procedure FormCreate(Sender: TObject);
    procedure btnAddPhoneClick(Sender: TObject);
    procedure edtPhoneKeyPress(Sender: TObject; var Key: Char);
    procedure N1Click(Sender: TObject);
    procedure btnAddWokersClick(Sender: TObject);
    procedure btnSaveSpravClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure cbbProfCloseUp(Sender: TObject);
    procedure cbbProfKeyPress(Sender: TObject; var Key: Char);
    procedure dbgrdSpravochnikKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtPhoneKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormSpravWokers: TFormSpravWokers;

implementation

{$R *.dfm}

procedure TFormSpravWokers.FormCreate(Sender: TObject);
var
  i: Integer;
begin
  if FormDM.conContn.Connected then
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

  cbbProf.Items.Add('Специалист');
  cbbProf.Items.Add('Менеджер');
  cbbProf.ItemIndex := 0;

  FormDM.qryPhoneManager.Active := False;
  FormDM.qryPhoneManager.Parameters[0].Value := FormDM.tblManager.FieldByName('ID').AsInteger;
  FormDM.qryPhoneManager.Active := True;
  end;
end;

procedure TFormSpravWokers.btnAddPhoneClick(Sender: TObject);
begin
  // Добавляем телефон
  if edtPhone.Text <> '' then
  begin
    FormDM.tblPhones.Append;
    // Номер телефона
    FormDM.tblPhones.FieldByName('Phone').AsString := edtPhone.Text;
    // Тип телефона
    FormDM.tblPhoneType.Locate('TypePhone',cbbTypePhone.Text,[]);
    FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := FormDM.tblPhoneType.FieldByName('ID').AsInteger;

    if cbbProf.ItemIndex = 0 then // ID специалиста
      FormDM.tblPhones.FieldByName('ID_Woker').AsInteger := FormDM.tblWokers.FieldByName('ID').AsInteger
    else  // ID менеджера
      FormDM.tblPhones.FieldByName('ID_Manager').AsInteger := FormDM.tblManager.FieldByName('ID').AsInteger;

    FormDM.tblPhones.Post;

    if cbbProf.ItemIndex = 0 then // ID специалиста
    begin
      FormDM.qryPhoneWokers.Active := False;
      FormDM.qryPhoneWokers.Parameters[0].Value := FormDM.tblWokers.FieldByName('ID').AsInteger;
      FormDM.qryPhoneWokers.Active := True;
    end
    else  // ID менеджера
    begin
      FormDM.qryPhoneManager.Active := False;
      FormDM.qryPhoneManager.Parameters[0].Value := FormDM.tblManager.FieldByName('ID').AsInteger;
      FormDM.qryPhoneManager.Active := True;
    end;

    cbbTypePhone.ItemIndex := 0;
    edtPhone.Text := '';
  end;
end;

procedure TFormSpravWokers.edtPhoneKeyPress(Sender: TObject;
  var Key: Char);
begin
  if not (key in['0'..'9', #8]) then
  begin
    key:=#0;
  end;
end;

procedure TFormSpravWokers.N1Click(Sender: TObject);
begin
  if (FormDM.qryPhoneWokers.RecordCount <> 0) and (cbbProf.ItemIndex = 0) then
  begin
    // Удаляем телефон сотрудника
    if FormDM.tblPhones.Locate('Phone', FormDM.qryPhoneWokers.FieldByName('Phone').AsInteger, []) then
    begin
      FormDM.tblPhones.Delete;
      // Обновляем таблицу
      FormDM.qryPhoneWokers.Active := False;
      FormDM.qryPhoneWokers.Parameters[0].Value := FormDM.tblWokers.FieldByName('ID').AsInteger;
      FormDM.qryPhoneWokers.Active := True;
    end;
  end
  else
  begin
    if FormDM.qryPhoneManager.RecordCount <> 0 then
    begin
      // Удаляем телефон менеджера
      if FormDM.tblPhones.Locate('Phone', FormDM.qryPhoneManager.FieldByName('Phone').AsInteger, []) then
      begin
        FormDM.tblPhones.Delete;
        // Обновляем таблицу
        FormDM.qryPhoneManager.Active := False;
        FormDM.qryPhoneManager.Parameters[0].Value := FormDM.tblManager.FieldByName('ID').AsInteger;
        FormDM.qryPhoneManager.Active := True;
      end;
    end;
  end;
end;

procedure TFormSpravWokers.btnAddWokersClick(Sender: TObject);
begin
  if cbbProf.ItemIndex = 0 then  // Специалист
    FormDM.tblWokers.Insert
  else                           // Менеджер
    FormDM.tblManager.Insert;

  dbgrdSpravochnik.SetFocus;
  dbgrdSpravochnik.EditorMode := True;
end;

procedure TFormSpravWokers.btnSaveSpravClick(Sender: TObject);
var
  strShortName: string;
  strName, strOtch: string;
begin
  (*if FormDM.tblWokers.Modified then
  begin
    strShortName := FormDM.tblWokers.FieldByName('FirstName').AsString + ' ';
    strName := FormDM.tblWokers.FieldByName('Name1').AsString;
    // Предпологаем, что имя есть всегда
    if strName <> '' then
      strShortName := strShortName + strName[1] + '.';

    strOtch := FormDM.tblWokers.FieldByName('Otchestvo').AsString;
    if strOtch <> '' then
      strShortName := strShortName + strOtch[1] + '.';

    //strShortName := FormDM.tblManager.FieldByName('FirstName').AsString + ' ' + strName[0]+'.'+strOtch[0]+'.'
    FormDM.tblWokers.FieldByName('ShortName').AsString := strShortName;
    FormDM.tblWokers.Post;
  end;
  if FormDM.tblManager.Modified then
  begin
    strShortName := FormDM.tblManager.FieldByName('FirstName').AsString + ' ';
    strName := FormDM.tblManager.FieldByName('Names').AsString;
    // Предпологаем, что имя есть всегда
    if strName <> '' then
      strShortName := strShortName + strName[1] + '.';

    strOtch := FormDM.tblManager.FieldByName('Otchestvo').AsString;
    if strOtch <> '' then
      strShortName := strShortName + strOtch[1] + '.';

    //strShortName := FormDM.tblManager.FieldByName('FirstName').AsString + ' ' + strName[0]+'.'+strOtch[0]+'.'
    FormDM.tblManager.FieldByName('ShortName').AsString := strShortName;
    FormDM.tblManager.Post;
  end;*)
end;

procedure TFormSpravWokers.btnCancelClick(Sender: TObject);
begin
  //FormDM.tblWokers.Cancel;
  //FormDM.tblManager.Cancel;
  if FormDM.tblWokers.Modified then
    FormDM.tblWokers.Post;
  if FormDM.tblManager.Modified then
    FormDM.tblManager.Post;
    
  FormSpravWokers.Close;
end;

procedure TFormSpravWokers.cbbProfCloseUp(Sender: TObject);
begin
  //
  if cbbProf.ItemIndex = 0 then // Специалист
  begin
    dbgrdSpravochnik.DataSource := FormDM.dsWokers;
    dbgrdPhones.DataSource := FormDM.dsPhoneWokers;
  end
  else  // Менеджер
  begin
    dbgrdSpravochnik.DataSource := FormDM.dsManager;
    dbgrdPhones.DataSource := FormDM.dsPhoneManager;
  end;
  
  dbgrdSpravochnik.SetFocus;
end;

procedure TFormSpravWokers.cbbProfKeyPress(Sender: TObject; var Key: Char);
begin
  key:=#0;
end;

procedure TFormSpravWokers.dbgrdSpravochnikKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    if cbbProf.ItemIndex = 0 then
      FormDM.tblWokers.Cancel
    else
      FormDM.tblManager.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    if cbbProf.ItemIndex = 0 then
    begin
      FormDM.tblWokers.Edit;
      //if FormDM.tblWokers.Modified then
      if FormDM.tblWokers.FieldByName('FirstName').AsString <> '' then
        FormDM.tblWokers.Post;
    end
    else
    begin
      FormDM.tblManager.Edit;
      //if FormDM.tblManager.Modified then
      if FormDM.tblManager.FieldByName('FirstName').AsString <> '' then
        FormDM.tblManager.Post;
    end;
  end;
end;

procedure TFormSpravWokers.edtPhoneKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
    // Добавляем телефон
    if edtPhone.Text <> '' then
    begin
      FormDM.tblPhones.Append;
      // Номер телефона
      FormDM.tblPhones.FieldByName('Phone').AsString := edtPhone.Text;
      // Тип телефона
      FormDM.tblPhoneType.Locate('TypePhone',cbbTypePhone.Text,[]);
      FormDM.tblPhones.FieldByName('ID_TypePhone').AsInteger := FormDM.tblPhoneType.FieldByName('ID').AsInteger;

      if cbbProf.ItemIndex = 0 then // ID специалиста
        FormDM.tblPhones.FieldByName('ID_Woker').AsInteger := FormDM.tblWokers.FieldByName('ID').AsInteger
      else  // ID менеджера
        FormDM.tblPhones.FieldByName('ID_Manager').AsInteger := FormDM.tblManager.FieldByName('ID').AsInteger;

      FormDM.tblPhones.Post;

      if cbbProf.ItemIndex = 0 then // ID специалиста
      begin
        FormDM.qryPhoneWokers.Active := False;
        FormDM.qryPhoneWokers.Parameters[0].Value := FormDM.tblWokers.FieldByName('ID').AsInteger;
        FormDM.qryPhoneWokers.Active := True;
      end
      else  // ID менеджера
      begin
        FormDM.qryPhoneManager.Active := False;
        FormDM.qryPhoneManager.Parameters[0].Value := FormDM.tblManager.FieldByName('ID').AsInteger;
        FormDM.qryPhoneManager.Active := True;
      end;

      cbbTypePhone.ItemIndex := 0;
      edtPhone.Text := '';
    end;
  end;
end;

end.
