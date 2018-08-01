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

if  Combobox1.text='В разрезе ПРОФЕССИЙ' then
Form36.parametr:='В разрезе ПРОФЕССИЙ';
if  Combobox1.text='Просто журнал со структурой!' then
Form36.parametr:='Просто журнал со структурой!';
if  Combobox1.text='Ведомость комплектации' then
Form36.parametr:='Ведомость комплектации';
if  Combobox1.text='Форма  удостоверения на приёмку ОТК' then
Form36.parametr:='Форма  удостоверения на приёмку ОТК';
if  Combobox1.text='Ведомость комплектации 10 цех' then
 begin
 Form42.ShowModal;
 Form37.Close;
 end;

 r:=1 ;
Form37.Close;
end;

procedure TForm37.FormShow(Sender: TObject);
begin
   if Form9.Combobox1.text='Списком' then
  begin
   ComboBox1.Items.Clear;
   ComboBox1.Text:='В разрезе ТН и заготовительных ТК';
    ComboBox1.Items.Add('В разрезе ТН и заготовительных ТК');
    ComboBox1.Items.Add('В разрезе ПРОФЕССИЙ');
    ComboBox1.Items.Add('Просто журнал со структурой!');
    ComboBox1.Items.Add('Ведомость комплектации');
    ComboBox1.Items.Add('Ведомость комплектации 10 цех');
      r:=0;
  end;
   if Form9.Combobox1.text='Деревом' then
  begin
   ComboBox1.Items.Clear;
      ComboBox1.Text:='Форма  удостоверения на приёмку ОТК';
    ComboBox1.Items.Add('Форма  удостоверения на приёмку ОТК');
      r:=0;
  end;



end;

procedure TForm37.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 if r<>1 then Form36.parametr:='';
end;

end.
