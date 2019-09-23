unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, OdacVcl, DB, Ora, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, clipbrd;

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
    N40: TMenuItem;
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
    N35: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N41: TMenuItem;
    N60: TMenuItem;
    N61: TMenuItem;
    N62: TMenuItem;
    N63: TMenuItem;
    N64: TMenuItem;
    N65: TMenuItem;
    N66: TMenuItem;
    N67: TMenuItem;
    IdHTTP1: TIdHTTP;
    N42: TMenuItem;
    N43: TMenuItem;
    N6: TMenuItem;
    N44: TMenuItem;
    N45: TMenuItem;
    N46: TMenuItem;
    N47: TMenuItem;
    N70: TMenuItem;
    N73: TMenuItem;
    N48: TMenuItem;
    N49: TMenuItem;
    N50: TMenuItem;
    N51: TMenuItem;
    N02: TMenuItem;
    N52: TMenuItem;
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
    procedure N35Click(Sender: TObject);
    procedure N36Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure N41Click(Sender: TObject);
    procedure N60Click(Sender: TObject);
    procedure N61Click(Sender: TObject);
    procedure N62Click(Sender: TObject);
    procedure N63Click(Sender: TObject);
    procedure N64Click(Sender: TObject);
    procedure N65Click(Sender: TObject);
    procedure N66Click(Sender: TObject);
    procedure N67Click(Sender: TObject);
    procedure N69Click(Sender: TObject);
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
    procedure N46Click(Sender: TObject);
    procedure N47Click(Sender: TObject);
    procedure N70Click(Sender: TObject);
    procedure N73Click(Sender: TObject);
    procedure N48Click(Sender: TObject);
    procedure N49Click(Sender: TObject);
    procedure N50Click(Sender: TObject);
    procedure N51Click(Sender: TObject);
    procedure N02Click(Sender: TObject);
    procedure N52Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    errorStatusReturn : boolean;
    function SCAlive : boolean;
    function ServerRequest(s : string) : string;
    function execQuery(Q : TOraQuery; S : string; T : boolean) : boolean;
    function showError(H : string; B : string) : boolean;

    function inUserList(s, d, e : string) : boolean;
  end;

var
  Form1: TForm1;
  z:integer;

const

VERSION = '2.0.1';

SERVER_ADDR = 'http://192.168.10.15:7777/server/tronix_otch/';
SERVER_FILE_PART = '.sql';

implementation

uses Unit2, Unit7, Unit8, Unit9, Unit12, Unit17, Unit23, Unit32, Unit34, cpct, r_dates, r_ttns, t_error,
  r_leftovers_nomen,Reestr_doc_sklad;

{$R *.dfm}

function strtok(Str: WideString; Delimiter: string): TStringList;
var
  tmpStrList: TStringList;
  tmpString, tmpVal: WideString;
  DelimPos: LongInt;
begin
  tmpStrList := TStringList.Create;
  TmpString := Str;
  DelimPos := 1;
  while DelimPos > 0 do
  begin
    DelimPos := LastDelimiter(Delimiter, TmpString);
    tmpVal := Copy(TmpString, DelimPos + 1, Length(TmpString));
    if tmpVal <> '' then
      tmpStrList.Add(tmpVal);
    Delete(TmpString, DelimPos, Length(TmpString));
  end;
  strtok := tmpStrList;
end;

procedure TForm1.N3Click(Sender: TObject);
begin

   Form2.ShowModal();

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
 OraSession1.Connect;
 self.Caption := 'Отчеты к Tronix v' + VERSION;
end;

function TForm1.showError(H : string; B : string): boolean;
begin
  errorStatusReturn := false;
  Application.CreateForm(TerrorForm, errorForm);

  errorForm.Caption := H;
  errorForm.body.Caption := B;

  errorForm.Showmodal();
  errorForm.Free;

  showError := errorStatusReturn;
end;

procedure TForm1.tn1Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form8.ShowModal();
  Form9.Free;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='Отчет по нарядам';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
//   form12.Caption:='Отчет по проектам';
 //  form12.ShowModal();
end;

procedure TForm1.N8Click(Sender: TObject);
begin
//   Form17.ShowModal();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по трудоемкости (Новый)';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по заявкам';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет планируемой трудоемкости';
  form9.ShowModal();   
  Form9.Free;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по выполнению ведомостей (Для склада ЗИП)';
  form9.ShowModal();    
  Form9.Free;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form23.Caption:='Отчет по сравниваю ПУЭ в проектах (ТехОтдел)';
  form23.ShowModal();     
  Form9.Free;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по Отчет по ТН (материал изделие)';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Ведомость материалов';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Потребность по материалам в разрезе чертежа. Выберите цех';
  form32.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N67Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='Количество покупных изделий с привязкой к ТН,позиции СП по проекту. Выберите проект';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N69Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='Отёт по привязке ПУЕ к УДП по проекту. Выберите проект';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N70Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='УДП по проекту: тр-ть норма,факт,остаток,процент выработки. Выберите проект';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N18Click(Sender: TObject);
begin
 if  (OraSession1.Username='84013') or (OraSession1.Username='23015')   then

     form34.ShowModal();
end;

procedure TForm1.N01Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по поиску позиций с приоритетом 0 по проекту';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Построечный журнал';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Ведомость комплектации по помещениям.';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Проверка документов на согласовании к справочнику.';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Потребность по материалам и оборудованию общая по проекту';
  form32.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Формрование ведомости комплектации запуска.';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Изделия с незаполненой трудоемкостью ТНа';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчет по материальной ведомости';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Проверка дублей ТК и ПТК в проекте';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Проверка масс (спецификация и справочник)';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Отчёт по сравнению потребности с ведомостями заказа';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N30Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form2.Caption:='Отчёт по изделиям МСЧ';
  Form2.ShowModal();    
  Form9.Free;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form2.Caption:='МСЧ (Россыпь) с составом по проекту';
  Form2.ShowModal();
  Form9.Free;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='Техкомплекты в обеспечении материалами с признаком поступления';
  Form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N33Click(Sender: TObject);
var value:string;
begin
  repeat
    value:=InputBox('!!!', 'Пожалуйста, пароль', '******');
  until value <> '';
  if value='zopa' then
  begin
    Application.CreateForm(TForm9, Form9);
    form9.Caption:='Построечный журнал. Подрядчики';
    form9.ShowModal(); 
    Form9.Free;
  end;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Выгружаем транспортный файл.';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N35Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Наряды по цеху,проекту. Выберите цех';
  form32.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Остатки трудоёмкости по МСЧ. Выберите проект';
  form9.ShowModal();   
  Form9.Free;
end;

 procedure TForm1.N73Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Удалённые наряды. Выберите цех';
  form32.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Количество изделий МСЧ по проекту. Выберите проект';
  form9.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N38Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект';
  form9.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N39Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Наряды,закрытые за период по цеху (ПДО). Выберите цех';
  form32.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N60Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='СП Ведомости снабжения группы 237 по проекту. Выберите проект';
  form9.ShowModal();   
  Form9.Free;
end;

 procedure TForm1.N61Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Перечень закрытой оснастки по проекту. Выберите проект';
  form9.ShowModal(); 
  Form9.Free;
end;

 procedure TForm1.N62Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Паспорт предприятия - Фактическая тр-ть по цеху в разрезе профессий,рабочих ЯСЗ,подрядчиков за период. Выберите цех';
  form32.ShowModal(); 
  Form9.Free;
end;

 procedure TForm1.N63Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='Наряды с привязкой к УКР с начала постройки по проекту. Выберите проект';
  form9.ShowModal();    
  Form9.Free;
end;

 procedure TForm1.N64Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите цех';
  form32.ShowModal();
  Form9.Free;
end;

 procedure TForm1.N65Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите цех';
  form32.ShowModal();
  Form9.Free;
end;

 procedure TForm1.N66Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите цех';
  form32.ShowModal();
  Form9.Free;
end;

function TForm1.inUserList(s, d, e : string) : boolean;
var
userList : string;
parseUserList : TStringList;
x : integer;
begin
  userList := ServerRequest(s);
  parseUserList := strtok(userList, d);

  inUserList := false;
  for x := 0 to (parseUserList.Count - 1) do
    if parseUserList[x] = e then
    begin
      inUserList := true;
      exit;
    end;

end;

procedure TForm1.N41Click(Sender: TObject);
var takepw, password : string;
begin
  if not SCAlive then
    exit;

  password := ServerRequest('[PASS]CONTRACT_COPY');

  takepw := InputBox('ДОСТУП', 'Введите пароль для данной операции', '');
  if takepw = '' then
  begin
    showmessage('ПОЛЕ НЕ ЗАПОЛНЕНО. Введите пароль!');
    exit;
  end;

  if takepw = password then
  begin
    Application.CreateForm(Tcopycnct, copycnct);
    copycnct.ShowModal();
    copycnct.Free;
  end
  else
    showmessage('Неверный пароль! Обратитесь в АСУ');
end;

function TForm1.SCAlive : boolean;
begin
try 
  idhttp1.Get(SERVER_ADDR + 'dummy');
except
  showError('Ошибка сети', 'Не удалось подключиться к серверу!');
  SCAlive := false;
  exit;
end;

SCAlive := true;
end;

function TForm1.ServerRequest(s : string) : string;
begin
try
  ServerRequest := idhttp1.Get(SERVER_ADDR + s + SERVER_FILE_PART);
except
  if not showError('Ошибка сервера', 'Приложение будет закрыто! Если присутствуют не сохраненные данные '
    + ' - обратитесь в АСУ и не закрывайте ошибку.') then
    Application.Terminate;
end;

end;

function TForm1.execQuery(Q : TOraQuery; S : string; T : boolean) : boolean;
begin   //remake to custom form with backup input data and SQL print.

  execQuery := true;
  Q.Close;
  Q.SQL.Text := S;

  try
    if T then
      Q.ExecSQL
    else
      Q.Open;
  except
    On E : Exception do
    begin
      if not showError('Ошибка запроса', E.Message + #10#13 + 'Приложение будет закрыто! Если присутствуют не сохраненные данные '
      + ' - обратитесь в АСУ и не закрывайте ошибку.') then
        Application.Terminate;

      Clipboard.asText := S;

      execQuery := false;
    end;
  end;

end;

procedure TForm1.N43Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption := 'Дефицит по номенклатуре (новый)';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption := 'Дефицит по номенклатуре (старый)';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N46Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption := 'Требования по дефициту';
  
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N47Click(Sender: TObject);
begin
  Application.CreateForm(Tleftovers, leftovers);
  leftovers.Showmodal();
  leftovers.Free;
end;

procedure TForm1.N44Click(Sender: TObject);
var name : string;
begin
  (*
  name := OraSession1.Username;
  if (name <> '20043') and (name <> '84007') and (name <> '15008') and (name <> '20078') and (name <> '10156') and (name <> '02019') then
  begin
    showmessage('У вас нет прав для работы с данным модулем!');
    exit;
  end;
  *)

  Application.CreateForm(TForm9, Form9);
  form9.Caption := 'Основная номенклатура по дефициту';

  form9.ShowModal();
  Form9.Free;

  (*
  Application.CreateForm(TForm9, Form9);
  form9.Caption := 'Требования по дефициту';

  form9.ShowModal();
  Form9.Free;
  *)
end;

procedure TForm1.N45Click(Sender: TObject);
var password, takepw : string;
begin
  if not SCAlive then
    exit;

  password := ServerRequest('[PASS]REQ_DATES');

  takepw := InputBox('ДОСТУП', 'Введите пароль для данной операции', '');
  if takepw = '' then
  begin
    showmessage('ПОЛЕ НЕ ЗАПОЛНЕНО. Введите пароль!');
    exit;
  end;

  if takepw = password then
  begin
    Application.CreateForm(Trequest_date, request_date);
    request_date.ShowModal();
    request_date.Free;
  end
  else
    showmessage('Неверный пароль! Обратитесь в АСУ');
end;

procedure TForm1.N48Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='ОТК: УДП по проекту. Выберите проект';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N49Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N50Click(Sender: TObject);
begin
  Application.CreateForm(TFReestr_doc_sklad, FReestr_doc_sklad);
  FReestr_doc_sklad.Caption:='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект';
  FReestr_doc_sklad.ShowModal();
  FReestr_doc_sklad.Free;
end;

procedure TForm1.N51Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='ПДО: Отчёт по УДП по проекту. Выберите проект';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N02Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='ПУЕ с трудоёмкостью 0 с привязкой к УДП по проекту. Выберите проект';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N52Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Show_MainNomenDetails;
  Form9.Free;
end;

end.
