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
  form9.Caption:='������ �� ����,�������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

   if form32.Caption='�������� ������. �������� ���' then
     begin
  Application.CreateForm(TForm73, Form73);
  form73.Caption:='�������� ������';
  form73.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form73.Caption:='�������� ������:'+'  ���='+Form32.oraQuery1.FieldByName('nomer').asString;
  form73.ShowModal();
  Form73.Free;
     end;

  if form32.Caption='������� ����������� �� ���. �������� ���' then
     begin
  form9.Caption:='������� ����������� �� ���';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

   if form32.Caption='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ������. �������� ���' then
     begin
  Application.CreateForm(TForm62, Form62);
  form62.Caption:='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ���� '+oraQuery1.FieldByName('nomer').asString;
  form62.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form62.ShowModal();
  Form62.Free;
      end;

   if form32.Caption='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ���' then
     begin
  form9.Caption:='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ���' then
     begin
  form9.Caption:='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='���������� ���(��� ���) �� ���� �� �������. �������� ���' then
     begin
  form9.Caption:='���������� ���(��� ���) �� ���� �� �������. �������� ������';
  form9.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form9.ShowModal();
     end;

  if form32.Caption='������,�������� �� ������ �� ���� (���). �������� ���' then
     begin
  Application.CreateForm(TForm58, Form58);
  form58.Caption:='������,�������� �� ������ �� ���� '+oraQuery1.FieldByName('nomer').asString;
 form58.Edit1.text:=oraQuery1.FieldByName('dep_id').asString;
  form58.ShowModal();
  Form58.Free;
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
//howMessage('all');
   if form32.Caption='������ �� ����,�������. �������� ���' then
    form9.Caption:='������ �� ����,�������';

 if form32.Caption='������� ����������� �� ���. �������� ���' then
    form9.Caption:='������� ����������� �� ���';

 if form32.Caption='����������� �� ���������� � ������� �������. �������� ���' then
    form9.Caption:='����������� �� ���������� � ������� �������';

  form9.Edit1.text:='All';
  form9.ShowModal();
  end;

 if form32.Caption='������,�������� �� ������ �� ���� (���). �������� ���' then
 begin
  Application.CreateForm(TForm58, Form58);
  form58.Caption:='������,�������� �� ������ �� ���� �����';
  form58.Edit1.text:='All';
  form58.ShowModal();
  Form58.Free;
 end;

 if form32.Caption='�������� ������. �������� ���' then
 begin
  Application.CreateForm(TForm73, Form73);
  form73.Caption:='�������� ������ �� ���� �����';
  form73.Edit1.text:='All';
  form73.ShowModal();
  Form73.Free;
  end;

end;

end.
