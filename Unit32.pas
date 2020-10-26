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
  if (form32.Caption='����������� �� ���������� � ������������ ����� �� �������')
  or (form32.Caption='������. �������� ���')
  or (form32.Caption='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ������. �������� ���')
  or (form32.Caption='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ���')
  or (form32.Caption='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ���')
  then  Button1.Visible:=false
  else Button1.Visible:=true;
  // form9.Caption:='����������� �� ���������� � ������� �������';
  //form9.ShowModal();

end;

procedure TForm32.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Active:=false;
end;

procedure TForm32.DBGridEh1DblClick(Sender: TObject);
begin

   form32.Close();

   if form32.Caption='����������� �� ���������� � ������� �������. �������� ���' then
     begin
  form9.Caption:='����������� �� ���������� � ������� �������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='����������� �� ���������� � ������������ ����� �� �������' then
  begin
    form9.Caption:='����������� �� ���������� � ������������ ����� �� �������';
    form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
     form9.ShowModal();
  end;

   if form32.Caption='������ �� ����,�������. �������� ���' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������ �� ����,�������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  Form9.Free;
     end;

   if form32.Caption='�������� ������. �������� ���' then
     begin
  Application.CreateForm(TFNaryd_Delete, FNaryd_Delete);
  fNaryd_Delete.Caption:='�������� ������';
  fNaryd_Delete.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  fNaryd_Delete.Caption:='�������� ������:'+'  ���='+Form32.oraQuery1.FieldByName('nomer').asString;
  fNaryd_Delete.ShowModal();
  FNaryd_Delete.Free;
     end;

  if form32.Caption='������� ����������� �� ���. �������� ���' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� ����������� �� ���';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.Free;
     end;

   if form32.Caption='������� ����������� �� ���(��� ���). �������� ���' then
     begin

  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� ����������� �� ���(��� ���). �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  Form9.free;
     end;

   if form32.Caption='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ������. �������� ���' then
     begin
  Application.CreateForm(TFPasport_Plant, FPasport_Plant);
  FPasport_Plant.Caption:='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ���� '+oraQuery1.FieldByName('nomer').asString;
  FPasport_Plant.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  FPasport_Plant.ShowModal();
  FPasport_Plant.Free;
      end;

   if form32.Caption='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ���' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ���' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='���������� ���(��� ���) �� ���� �� �������. �������� ���' then
     begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='���������� ���(��� ���) �� ���� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
  form9.free;
     end;

  if form32.Caption='������,�������� �� ������ �� ���� (���). �������� ���' then
     begin
  Application.CreateForm(TFNaryd_Close_Pdo, FNaryd_Close_Pdo);
  FNaryd_Close_Pdo.Caption:='������,�������� �� ������ �� ���� '+oraQuery1.FieldByName('nomer').asString;
  FNaryd_Close_Pdo.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  FNaryd_Close_Pdo.ShowModal();
  FNaryd_Close_Pdo.Free;
     end;

end;

procedure TForm32.Button1Click(Sender: TObject);
begin
    form32.Close();

if (form32.Caption='������� ����������� �� ���. �������� ���')
or (form32.Caption='����������� �� ���������� � ������� �������. �������� ���')
or (form32.Caption='������ �� ����,�������. �������� ���')
then
begin
//ShowMessage('all');
  Application.CreateForm(TForm9, Form9);
   if form32.Caption='������ �� ����,�������. �������� ���' then
    form9.Caption:='������ �� ����,�������';

 if form32.Caption='������� ����������� �� ���. �������� ���' then
    form9.Caption:='������� ����������� �� ���';

 if form32.Caption='����������� �� ���������� � ������� �������. �������� ���' then
    form9.Caption:='����������� �� ���������� � ������� �������';

  form9.Edit1.text:='All';
  form9.ShowModal();
  form9.free;
  end;

 if form32.Caption='������,�������� �� ������ �� ���� (���). �������� ���' then
 begin
  Application.CreateForm(TFNaryd_Close_PDO, FNaryd_Close_PDO);
  fNaryd_Close_PDO.Caption:='������,�������� �� ������ �� ���� �����';
  fNaryd_Close_PDO.Edit1.text:='All';
  fNaryd_Close_PDO.ShowModal();
  FNaryd_Close_PDO.Free;
 end;

 if form32.Caption='�������� ������. �������� ���' then
 begin
  Application.CreateForm(TFNaryd_Delete, FNaryd_Delete);
  fNaryd_Delete.Caption:='�������� ������ �� ���� �����';
  fNaryd_Delete.Edit1.text:='All';
  fNaryd_Delete.ShowModal();
  FNaryd_Delete.Free;
  end;

end;

end.
