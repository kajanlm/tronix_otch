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

uses Unit9, Unit38,Unit58,Unit52,Unit62,Unit73;

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
  form9.Caption:='Наряды по цеху,проекту';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

   if form32.Caption='Удалённые наряды. Выберите цех' then
     begin
  Application.CreateForm(TForm73, Form73);
  form73.Caption:='Удалённые наряды';
  form73.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form73.Caption:='Удалённые наряды:'+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  form73.ShowModal();
  Form73.Free;
     end;

  if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
     begin
  form9.Caption:='Остатки трудоёмкости по МСЧ';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

   if form32.Caption='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков за период. Выберите цех' then
     begin
  Application.CreateForm(TForm62, Form62);
  form62.Caption:='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков по цеху '+oraQuery1.FieldByName('nomer').asString;
  form62.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form62.ShowModal();
  Form62.Free;
      end;

   if form32.Caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите цех' then
     begin
  form9.Caption:='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите цех' then
     begin
  form9.Caption:='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите цех' then
     begin
  form9.Caption:='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='Наряды,закрытые за период по цеху (ПДО). Выберите цех' then
     begin
  Application.CreateForm(TForm58, Form58);
  form58.Caption:='Наряды,закрытые за период по цеху '+oraQuery1.FieldByName('nomer').asString;
 form58.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form58.ShowModal();
  Form58.Free;
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
//howMessage('all');
   if form32.Caption='Наряды по цеху,проекту. Выберите цех' then
    form9.Caption:='Наряды по цеху,проекту';

 if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
    form9.Caption:='Остатки трудоёмкости по МСЧ';

 if form32.Caption='Потребность по материалам в разрезе чертежа. Выберите цех' then
    form9.Caption:='Потребность по материалам в разрезе чертежа';

  form9.Edit1.text:='All';
  form9.ShowModal();
  end;

 if form32.Caption='Наряды,закрытые за период по цеху (ПДО). Выберите цех' then
 begin
  Application.CreateForm(TForm58, Form58);
  form58.Caption:='Наряды,закрытые за период по всем цехам';
  form58.Edit1.text:='All';
  form58.ShowModal();
  Form58.Free;
 end;

 if form32.Caption='Удалённые наряды. Выберите цех' then
 begin
  Application.CreateForm(TForm73, Form73);
  form73.Caption:='Удалённые наряды по всем цехам';
  form73.Edit1.text:='All';
  form73.ShowModal();
  Form73.Free;
  end;

end;

end.
