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

uses Unit9, Unit38;

{$R *.dfm}



procedure TForm32.FormShow(Sender: TObject);
begin
  OraQuery1.Active:=true;
  if  (form32.Caption='Потребность по материалам и оборудованию общая по проекту')
  or (form32.Caption='Наряды. Выберите цех')
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

   if form32.Caption='Наряды. Выберите цех' then
     begin
  form9.Caption:='Наряды';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

   if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
     begin
  form9.Caption:='Остатки трудоёмкости по МСЧ';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

     end;

procedure TForm32.Button1Click(Sender: TObject);
begin
    form32.Close();
// if form32.Caption='Наряды. Выберите цех' then
//    form9.Caption:='Наряды';

 if form32.Caption='Остатки трудоёмкости по МСЧ. Выберите цех' then
    form9.Caption:='Остатки трудоёмкости по МСЧ';

 if form32.Caption='Потребность по материалам в разрезе чертежа. Выберите цех' then
    form9.Caption:='Потребность по материалам в разрезе чертежа';
 
  form9.Edit1.text:='All';
  form9.ShowModal();
end;

end.
