unit Unit37;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm37 = class(TForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    r: integer;
  public
    { Public declarations }
  end;

var
  Form37: TForm37;

implementation

uses Unit36, Unit42, Unit9;

{$R *.dfm}

procedure TForm37.Button1Click(Sender: TObject);
begin

if  Combobox1.text='� ������� ���������' then
Form36.parametr:='� ������� ���������';
if  Combobox1.text='������ ������ �� ����������!' then
Form36.parametr:='������ ������ �� ����������!';
if  Combobox1.text='��������� ������������' then
Form36.parametr:='��������� ������������';
if  Combobox1.text='�����  ������������� �� ������ ���' then
Form36.parametr:='�����  ������������� �� ������ ���';
if  Combobox1.text='��������� ������������ 10 ���' then
 begin
 Form42.ShowModal;
 Form37.Close;
 end;

 r:=1 ;
Form37.Close;
end;

procedure TForm37.FormShow(Sender: TObject);
begin
   if Form9.Combobox1.text='�������' then
  begin
   ComboBox1.Items.Clear;
   ComboBox1.Text:='� ������� �� � ��������������� ��';
    ComboBox1.Items.Add('� ������� �� � ��������������� ��');
    ComboBox1.Items.Add('� ������� ���������');
    ComboBox1.Items.Add('������ ������ �� ����������!');
    ComboBox1.Items.Add('��������� ������������');
    ComboBox1.Items.Add('��������� ������������ 10 ���');
      r:=0;
  end;
   if Form9.Combobox1.text='�������' then
  begin
   ComboBox1.Items.Clear;
      ComboBox1.Text:='�����  ������������� �� ������ ���';
    ComboBox1.Items.Add('�����  ������������� �� ������ ���');
      r:=0;
  end;



end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 if r<>1 then Form36.parametr:='';
end;

end.
