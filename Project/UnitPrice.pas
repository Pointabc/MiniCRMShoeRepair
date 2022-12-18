unit UnitPrice;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UnitDM, Grids, DBGrids, StdCtrls, Menus, DB, UnitAddOrder;

type
  TFormPrice = class(TForm)
    dbgrdGWork: TDBGrid;
    dbgrdWorks: TDBGrid;
    btnSavePrice: TButton;
    btnCancel: TButton;
    btnAddWorks: TButton;
    btnAddGroupWork: TButton;
    lbl1: TLabel;
    lbl2: TLabel;
    pmGW: TPopupMenu;
    mniDelGroupWork: TMenuItem;
    mniAddGroupWork: TMenuItem;
    mniEditGroupWork: TMenuItem;
    pmWorks: TPopupMenu;
    mniAddWorks: TMenuItem;
    mniDelWork: TMenuItem;
    mniEditWork: TMenuItem;
    btnSaveGWorks: TButton;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure btnSavePriceClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure btnAddGroupWorkClick(Sender: TObject);
    procedure btnAddWorksClick(Sender: TObject);
    procedure mniDelGroupWorkClick(Sender: TObject);
    procedure mniAddGroupWorkClick(Sender: TObject);
    procedure mniEditGroupWorkClick(Sender: TObject);
    procedure mniAddWorksClick(Sender: TObject);
    procedure mniEditWorkClick(Sender: TObject);
    procedure mniDelWorkClick(Sender: TObject);
    procedure dbgrdGWorkKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrdWorksKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnSaveGWorksClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    bm: TBookmark;
  end;

var
  FormPrice: TFormPrice;

implementation

uses MainWnd;

{$R *.dfm}

procedure TFormPrice.btnSavePriceClick(Sender: TObject);
begin
  if FormDM.tblWorks.Modified then
    FormDM.tblWorks.Post;
  FormDM.tblWorksDop.Active := false;
  FormDM.tblWorksDop.Active := true;;

  bm := FormDM.tblGroupWork.GetBookmark; // сохраняем позицию в табл группы Работы
  FormDM.qrySubWorks.Active := false;
  FormDM.qrySubWorks.Active := true;
end;

procedure TFormPrice.btnCancelClick(Sender: TObject);
begin
  FormPrice.Close;
end;

procedure TFormPrice.btnAddGroupWorkClick(Sender: TObject);
begin
  if (FormDM.tblGroupWork.FieldByName('Name1').AsString <> '') AND (FormDM.tblGroupWork.FieldByName('Name1') <> nil) then
  begin
    FormDM.tblGroupWork.Insert;
    FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean := False;
    dbgrdGWork.SetFocus;
    dbgrdGWork.EditorMode := True;
    // Сохраняем закладку группв работ
    bm := FormDM.tblWorks.GetBookmark;
  end;
end;

procedure TFormPrice.btnAddWorksClick(Sender: TObject);
begin
  if (FormDM.tblWorks.FieldByName('NameWork').AsString <> '') AND (FormDM.tblWorks.FieldByName('NameWork') <> nil) then
  begin
    FormDM.tblWorks.Insert;
    FormDM.tblWorks.FieldByName('DelOrNot').AsBoolean := False;
    FormDM.tblWorks.FieldByName('ID_GroupWork').AsInteger := FormDM.tblGroupWork.FieldByName('ID').AsInteger;
    dbgrdWorks.SetFocus;
    dbgrdWorks.EditorMode := True;
  end;
end;

procedure TFormPrice.mniDelGroupWorkClick(Sender: TObject);
var
  i,i1: Integer;
  ex: Boolean;
  s: string;
  //bm: TBookmark;
begin
  if FormDM.tblGroupWork.RecordCount <> 0 then
  begin
    // Если нет ни одной работы в группе работ, то удаляем
    // Проверяем на наличие записей в группе
    ex := True;

    // пробегаемся по всей таблице
    FormDM.tblWorks.First;
    for i:=0 to FormDM.tblWorks.RecordCount-1 do
    begin
      if FormDM.tblWorks.FieldByName('ID_GroupWork').AsInteger = FormDM.tblGroupWork.FieldByName('ID').AsInteger then
      begin
        ex := false;
        Break;
      end;
      FormDM.tblWorks.Next;
    end;
    // Если группа работ пустая, то удаляем
    ex := True; // всегда удаляем группу
    if ex then
    begin
      if Not(FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean) then
      begin
        if Application.MessageBox(PChar('Вы действительно хотите удалить запись?'), 'Внимание!!!', MB_OKCANCEL) = ID_OK then
        begin
          //FormDM.tblGroupWork.Delete;
              FormDM.tblGroupWork.Edit;
              FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean := True;
              FormDM.tblGroupWork.Post;

              FormDM.tblGroupWork.First;
              FormAddOrder.cbbGroupsWork.Clear;
              for i1:=0 to FormDM.tblGroupWork.RecordCount-1 do
              begin
                if Not(FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean) then
                  FormAddOrder.cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
                FormDM.tblGroupWork.Next;
              end;
              FormAddOrder.cbbGroupsWork.ItemIndex := 0;
          // Удаляем из combobox
//          for i:=0 to FormAddOrder.cbbGroupsWork.Items.Count-1 do
  //        begin
    //        if FormAddOrder.cbbGroupsWork.Items[i] = FormDM.tblGroupWork.FieldByName('Name1').AsString then
      //      begin
              //FormAddOrder.cbbGroupsWork.Items.Delete(i);
              // Обновляем список групп работ в форме заказа
              // Заполняем значениями cbbGroupsWork - группы работ


        //      Break;
          //  end;
          end;

        //end;
      end;
    end
    else
      ShowMessage('В группе работ есть записи.');
  end;
end;

procedure TFormPrice.mniAddGroupWorkClick(Sender: TObject);
begin
  FormDM.tblGroupWork.Insert;
  FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean := False;
  dbgrdGWork.SetFocus;
  dbgrdGWork.EditorMode := True;
end;

procedure TFormPrice.mniEditGroupWorkClick(Sender: TObject);
begin
  dbgrdGWork.EditorMode := True;
end;

procedure TFormPrice.mniAddWorksClick(Sender: TObject);
begin
  FormDM.tblWorks.Insert;
  FormDM.tblWorks.FieldByName('DelOrNot').AsBoolean := False;
  dbgrdWorks.SetFocus;
  dbgrdWorks.EditorMode := True;
end;

procedure TFormPrice.mniEditWorkClick(Sender: TObject);
begin
  dbgrdWorks.EditorMode := True;
end;

procedure TFormPrice.mniDelWorkClick(Sender: TObject);
var
  bmWorks: TBookmark;
begin
  if FormDM.tblWorks.RecordCount <> 0 then
  begin
    if Application.MessageBox(PChar('Вы действительно хотите удалить запись?'), 'Внимание!!!', MB_OKCANCEL) = ID_OK then
    begin
      FormDM.tblWorksDop.Locate('NameWork;ID_GroupWork', VarArrayOf([FormDM.tblWorks.FieldByName('NameWork').AsString,
                                                                     FormDM.tblGroupWork.FieldByName('ID').AsInteger]),[]);
      FormDM.tblWorksDop.Edit;
      FormDM.tblWorksDop.FieldByName('DelOrNot').AsBoolean := True;
      FormDM.tblWorksDop.Post;

      bmWorks := FormDM.tblWorks.GetBookmark;
      FormDM.tblWorks.Active := false;
      FormDM.tblWorks.Active := true;
      FormDM.tblWorks.GotoBookmark(bmWorks);
    end;
  end;
end;

procedure TFormPrice.dbgrdGWorkKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FormDM.tblGroupWork.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblGroupWork.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblGroupWork.Edit;
    if FormDM.tblGroupWork.FieldByName('Name1').AsString <> '' then
      FormDM.tblGroupWork.Post;
  end;
end;

procedure TFormPrice.dbgrdWorksKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if FormDM.tblWorks.RecordCount = 0 then
    Exit;

  if Key = VK_ESCAPE then
  begin
    FormDM.tblWorks.Cancel;
  end;
  if (Key = VK_RETURN) then
  begin
    FormDM.tblWorks.Edit;
    if FormDM.tblWorks.FieldByName('NameWork').AsString <> '' then
      FormDM.tblWorks.Post;
  end;
end;

procedure TFormPrice.btnSaveGWorksClick(Sender: TObject);
begin
  if FormDM.tblGroupWork.Modified then
    FormDM.tblGroupWork.Post;
end;

procedure TFormPrice.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i: integer;
  b: Boolean;
  s,s1: string;
begin
  if FormDM.tblWorks.Modified then
    FormDM.tblWorks.Post;
  if FormDM.tblGroupWork.Modified then
    FormDM.tblGroupWork.Post;

  while FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean do
  begin
    FormDM.tblGroupWork.Next;
        if FormDM.tblGroupWork.Eof then
      FormDM.tblGroupWork.First;
  end;
  bm := FormDM.tblGroupWork.GetBookmark; // сохраняем позицию в табл группа работ
end;

procedure TFormPrice.FormCreate(Sender: TObject);
begin
  // в статус
  FormDM.qryInMoneyPrihod.Active := False;
  FormDM.qryInMoneyPrihod.Parameters[0].Value := FormatDateTime('dd.mm.yyyy',Now());
  FormDM.qryInMoneyPrihod.Parameters[1].Value := FormatDateTime('dd.mm.yyyy',Now());
  FormDM.qryInMoneyPrihod.Active := True;

  if formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString <> '' then
    MainForm.StatusBar1.Panels[0].Text := 'Приход за сегодня: ' + formDM.qryInMoneyPrihod.fieldByName('SumOfSum').AsString + ' рублей'
  else
    MainForm.StatusBar1.Panels[0].Text := 'Приход за сегодня: 0 рублей';

  MainForm.StatusBar1.Panels[1].Text := 'Количество заказов '+ IntToStr(formDM.qryAllOrdersDop.RecordCount);
  bm := nil;
end;

procedure TFormPrice.FormShow(Sender: TObject);
begin
  bm := nil;
end;

procedure TFormPrice.N1Click(Sender: TObject);
var
  bmWorks: TBookmark;
begin
  if FormDM.tblWorks.RecordCount <> 0 then
  begin
    FormDM.tblWorksDop.Locate('NameWork;ID_GroupWork', VarArrayOf([FormDM.tblWorks.FieldByName('NameWork').AsString,
                                                                   FormDM.tblGroupWork.FieldByName('ID').AsInteger]),[]);
    if FormDM.tblWorksDop.FieldByName('DelOrNot').AsBoolean then
    begin
      FormDM.tblWorksDop.Edit;
      FormDM.tblWorksDop.FieldByName('DelOrNot').AsBoolean := false;
      FormDM.tblWorksDop.Post;

      bmWorks := FormDM.tblWorks.GetBookmark;
      FormDM.tblWorks.Active := false;
      FormDM.tblWorks.Active := true;
      FormDM.tblWorks.GotoBookmark(bmWorks);
    end;
  end;
end;

procedure TFormPrice.N2Click(Sender: TObject);
begin
  if FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean then
  begin
    FormDM.tblGroupWork.Edit;
    FormDM.tblGroupWork.FieldByName('DelOrNot').AsBoolean := false;
    FormDM.tblGroupWork.Post;
    FormAddOrder.cbbGroupsWork.Items.Add(FormDM.tblGroupWork.FieldByName('Name1').AsString);
  end;
end;

end.
