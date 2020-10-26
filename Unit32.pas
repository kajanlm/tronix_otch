unit Unit32;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls;

type
  TForm32 = class(TForm)
    Label1: TLabel;
    OraDataSource1: TOraDataSource;
    OraQuery1: TOraQuery;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;

implementation

uses Unit9, Unit38,Naryd_Close_PDO,Pasport_Plant,Naryd_Delete;

{$R *.dfm}



procedure TForm32.FormShow(Sender: TObject);
begin
  OraQuery1.Active:=true;
  if (form32.Caption='Потребность по материалам и оборудованию общая по проекту')
  or (form32.Caption='Наряды. Выберите цех')
  or (form32.Caption='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков за период. Выберите цех')
  or (form32.Caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите цех')
  or (form32.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите цех')
  then  Button1.Visible:=false
  else Button1.Visible:=true;
  // form9.Caption:='Потребность по материалам в разрезе чертежа';
  //form9.ShowModal();

end;

procedure TForm32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Active:=false;
end;

procedure TForm32.DBGridEh1DblClick(Sender: TObject);
begin

   form32.Close();

   if form32.Caption='Потребность по материалам в разрезе чертежа. Выберите цех' then
     begin
  form9.Caption:='Потребность по материалам в разрезе чертежа';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='Потребность по материалам и оборудованию общая по проекту' then
  begin
    form9.Caption:='Потребность по материалам и оборудованию общая по проекту';
    form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
     form9.ShowModal();
  end;

   if form32.Caption='Наряды по цеху,проекту. Выберите цех' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Наряды по цеху,проекту';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  Form9.Free;
     end;

   if form32.Caption='Удалённые наряды. Выберите цех' then
     begin
  Application.CreateForm(TFNaryd_Delete, FNaryd_Delete);
  fNaryd_Delete.Caption:='Удалённые наряды';
  fNaryd_Delete.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  fNaryd_Delete.Caption:='Удалённые наряды:'+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  fNaryd_Delete.ShowModal();
  FNaryd_Delete.Free;
     end;

  if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Остатки трудоёмкости по МСЧ';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.Free;
     end;

   if form32.Caption='Остатки трудоёмкости по ПУЕ(без МСЧ). Выберите цех' then
     begin

  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Остатки трудоёмкости по ПУЕ(без МСЧ). Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  Form9.free;
     end;

   if form32.Caption='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков за период. Выберите цех' then
     begin
  Application.CreateForm(TFPasport_Plant, FPasport_Plant);
  FPasport_Plant.Caption:='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков по цеху '+oraQuery1.FieldByName('nomer').asString;
  FPasport_Plant.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  FPasport_Plant.ShowModal();
  FPasport_Plant.Free;
      end;

   if form32.Caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите цех' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите цех' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите цех' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='Наряды,закрытые за период по цеху (ПДО). Выберите цех' then
     begin
  Application.CreateForm(TFNaryd_Close_Pdo, FNaryd_Close_Pdo);
  FNaryd_Close_Pdo.Caption:='Наряды,закрытые за период по цеху '+oraQuery1.FieldByName('nomer').asString;
  FNaryd_Close_Pdo.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  FNaryd_Close_Pdo.ShowModal();
  FNaryd_Close_Pdo.Free;
     end;

end;

procedure TForm32.Button1Click(Sender: TObject);
begin
    form32.Close();

if (form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех')
or (form32.Caption='Потребность по материалам в разрезе чертежа. Выберите цех')
or (form32.Caption='Наряды по цеху,проекту. Выберите цех')
then
begin
//ShowMessage('all');
  Application.CreateForm(TForm9, Form9);
   if form32.Caption='Наряды по цеху,проекту. Выберите цех' then
    form9.Caption:='Наряды по цеху,проекту';

 if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
    form9.Caption:='Остатки трудоёмкости по МСЧ';

 if form32.Caption='Потребность по материалам в разрезе чертежа. Выберите цех' then
    form9.Caption:='Потребность по материалам в разрезе чертежа';

  form9.Edit1.text:='All';
  form9.ShowModal();
  form9.free;
  end;

 if form32.Caption='Наряды,закрытые за период по цеху (ПДО). Выберите цех' then
 begin
  Application.CreateForm(TFNaryd_Close_PDO, FNaryd_Close_PDO);
  fNaryd_Close_PDO.Caption:='Наряды,закрытые за период по всем цехам';
  fNaryd_Close_PDO.Edit1.text:='All';
  fNaryd_Close_PDO.ShowModal();
  FNaryd_Close_PDO.Free;
 end;

 if form32.Caption='Удалённые наряды. Выберите цех' then
 begin
  Application.CreateForm(TFNaryd_Delete, FNaryd_Delete);
  fNaryd_Delete.Caption:='Удалённые наряды по всем цехам';
  fNaryd_Delete.Edit1.text:='All';
  fNaryd_Delete.ShowModal();
  FNaryd_Delete.Free;
  end;

end;

end.
