unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, OdacVcl, DB, Ora, Menus;

type
  TForm1 = class(TForm)
    OraSession1: TOraSession;
    ConnectDialog1: TConnectDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    HELP1: TMenuItem;
    N3: TMenuItem;
    tn1: TMenuItem;
    N5: TMenuItem;
    N4: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    N15: TMenuItem;
    N151: TMenuItem;
    N16: TMenuItem;
    N17: TMenuItem;
    N18: TMenuItem;
    N01: TMenuItem;
    N19: TMenuItem;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    N25: TMenuItem;
    N26: TMenuItem;
    N27: TMenuItem;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure tn1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N8Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N16Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N01Click(Sender: TObject);
    procedure N19Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure N22Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure N25Click(Sender: TObject);
    procedure N26Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N29Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  z:integer;
implementation

uses Unit2, Unit7, Unit8, Unit9, Unit12, Unit17, Unit23, Unit32, Unit34;

{$R *.dfm}

procedure TForm1.N3Click(Sender: TObject);
begin

   Form2.ShowModal();

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 OraSession1.Connect;
end;

procedure TForm1.tn1Click(Sender: TObject);
begin
   Form8.ShowModal();
end;

procedure TForm1.N5Click(Sender: TObject);
begin
 Form9.Caption:='Отчет по нарядам';
 form9.ShowModal();
end;

procedure TForm1.N4Click(Sender: TObject);
begin
//   form12.Caption:='Отчет по проектам';
 //  form12.ShowModal();
end;

procedure TForm1.N6Click(Sender: TObject);
begin
   form9.Caption:='Дефицит по номенклатуре';
  form9.ShowModal();
end;

procedure TForm1.N8Click(Sender: TObject);
begin
//   Form17.ShowModal();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
      form9.Caption:='Отчет по трудоемкости (Новый)';
  form9.ShowModal();
end;

procedure TForm1.N10Click(Sender: TObject);
begin
   Form9.Caption:='Отчет по заявкам';
 form9.ShowModal();
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  form9.Caption:='Отчет планируемой трудоемкости';
  form9.ShowModal();
end;

procedure TForm1.N12Click(Sender: TObject);
begin
    form9.Caption:='Отчет по выполнению ведомостей (Для склада)';
  form9.ShowModal();
end;

procedure TForm1.N13Click(Sender: TObject);
begin
        form23.Caption:='Отчет по сравниваю ПУЭ в проектах (ТехОтдел)';
  form23.ShowModal();
end;

procedure TForm1.N14Click(Sender: TObject);
begin
       form9.Caption:='Отчет по Отчет по ТН (материал изделие)';
  form9.ShowModal();
end;

procedure TForm1.N15Click(Sender: TObject);
begin
form9.Caption:='Ведомость материалов';
  form9.ShowModal();
end;

procedure TForm1.N16Click(Sender: TObject);
begin
   form32.Caption:='Потребность по материалам в разрезе чертежа. Выберите цех';
  form32.ShowModal();
end;

procedure TForm1.N18Click(Sender: TObject);
begin
 if  (OraSession1.Username='84013') or (OraSession1.Username='23015')   then

     form34.ShowModal();
end;

procedure TForm1.N01Click(Sender: TObject);
begin
   form9.Caption:='Отчет по поиску позиций с приоритетом 0 по проекту';
  form9.ShowModal();
end;

procedure TForm1.N19Click(Sender: TObject);
begin
    form9.Caption:='Построечный журнал';
  form9.ShowModal();
end;

procedure TForm1.N21Click(Sender: TObject);
begin
       form9.Caption:='Ведомость комплектации по помещениям.';
  form9.ShowModal();
end;

procedure TForm1.N22Click(Sender: TObject);
begin
    form9.Caption:='Проверка документов на согласовании к справочнику.';
  form9.ShowModal();
end;

procedure TForm1.N23Click(Sender: TObject);
begin

 form32.Caption:='Потребность по материалам и оборудованию общая по проекту';
  form32.ShowModal();
end;

procedure TForm1.N24Click(Sender: TObject);
begin
    form9.Caption:='Формрование ведомости комплектации запуска.';
  form9.ShowModal();
end;

procedure TForm1.N25Click(Sender: TObject);
begin
       form9.Caption:='Изделия с незаполненой трудоемкостью ТНа';
  form9.ShowModal();
end;

procedure TForm1.N26Click(Sender: TObject);
begin
       form9.Caption:='Отчет по материальной ведомости';
  form9.ShowModal();
end;

procedure TForm1.N27Click(Sender: TObject);
begin
 form9.Caption:='Проверка дублей ТК и ПТК в проекте';
  form9.ShowModal();
end;

procedure TForm1.N28Click(Sender: TObject);
begin
 form9.Caption:='Проверка масс (спецификация и справочник)';
  form9.ShowModal();
end;

procedure TForm1.N29Click(Sender: TObject);
begin
   form9.Caption:='Отчёт по сравнению потребности с ведомостями заказа';
  form9.ShowModal();
end;

procedure TForm1.N30Click(Sender: TObject);
begin
 Form2.Caption:='Отчёт по изделиям МСЧ';
 Form2.ShowModal();
end;

procedure TForm1.N31Click(Sender: TObject);
begin
 Form2.Caption:='МСЧ (Россыпь) с составом по проекту';
 Form2.ShowModal();
end;

procedure TForm1.N32Click(Sender: TObject);
begin
Form9.Caption:='Техкомплекты в обеспечении материалами с признаком поступления';
 Form9.ShowModal();
end;

procedure TForm1.N33Click(Sender: TObject);
var value:string;
begin
 repeat
value:=InputBox('!!!', 'Пожалуйста, пароль', '******');
  until value <> '';
   if value='zopa' then    begin
     form9.Caption:='Построечный журнал. Подрядчики';
   form9.ShowModal();
   end;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
     form9.Caption:='Выгружаем транспортный файл.';
  form9.ShowModal();
end;

end.
