unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, OdacVcl, DB, Ora, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, clipbrd, StdCtrls;

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
    N53: TMenuItem;
    N54: TMenuItem;
    N55: TMenuItem;
    N56: TMenuItem;
    N57: TMenuItem;
    N59: TMenuItem;
    N68: TMenuItem;
    N71: TMenuItem;
    N52: TMenuItem;
    N72: TMenuItem;
    N74: TMenuItem;
    N75: TMenuItem;
    N76: TMenuItem;
    N77: TMenuItem;
    N78: TMenuItem;
    N79: TMenuItem;
    N80: TMenuItem;
    N81: TMenuItem;
    N82: TMenuItem;
    N83: TMenuItem;
    N84: TMenuItem;
    N85: TMenuItem;
    N86: TMenuItem;
    N87: TMenuItem;
    N88: TMenuItem;
    N89: TMenuItem;
    N90: TMenuItem;
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
    procedure N53Click(Sender: TObject);
    procedure N54Click(Sender: TObject);
    procedure N55Click(Sender: TObject);
    procedure N56Click(Sender: TObject);
    procedure N57Click(Sender: TObject);
    procedure N68Click(Sender: TObject);
    procedure N71Click(Sender: TObject);
    procedure N72Click(Sender: TObject);
    procedure N74Click(Sender: TObject);
    procedure N75Click(Sender: TObject);
    procedure N58Click(Sender: TObject);
    procedure N76Click(Sender: TObject);
    procedure N78Click(Sender: TObject);
    procedure N79Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure N80Click(Sender: TObject);
    procedure N81Click(Sender: TObject);
    procedure N82Click(Sender: TObject);
    procedure N83Click(Sender: TObject);
    procedure N84Click(Sender: TObject);
    procedure N85Click(Sender: TObject);
    procedure N86Click(Sender: TObject);
    procedure N87Click(Sender: TObject);
    procedure N88Click(Sender: TObject);
    procedure N89Click(Sender: TObject);
    procedure N90Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    errorStatusReturn : boolean;
    function SCAlive : boolean;
    function ServerRequest(s : string) : string;
    function execQuery(Q : TOraQuery; S : string; T : boolean) : boolean;
    function showError(H : string; B : string) : boolean;

    function strtok(Str: WideString; Delimiter: string): TStringList;
    function inUserList(s, d, e : string) : boolean;
  end;

var
  Form1: TForm1;
  z:integer;

const

SERVER_ADDR = 'http://192.168.10.15:7777/server/tronix_otch/';
SERVER_FILE_PART = '.sql';

implementation

uses Unit2, Unit7, Unit8, Unit9, Unit12, Unit17, Unit23, Unit32, Unit34, cpct, r_dates, r_ttns, t_error,
  r_leftovers_nomen,Reestr_doc_sklad, r_calendar,Nomenklator,Sum_trud_vidnorm,
  r_dates_inttns, t_utils, r_dcspcn, t_equipment_dtls, r_potreb, r_createdTxList;

{$R *.dfm}

function TForm1.strtok(Str: WideString; Delimiter: string): TStringList;
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
  self.Caption := 'TRONIX ������';
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
  Form9.Caption:='����� �� �������';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N4Click(Sender: TObject);
begin
//   form12.Caption:='����� �� ��������';
 //  form12.ShowModal();
end;       

procedure TForm1.N8Click(Sender: TObject);
begin
//   Form17.ShowModal();
end;

procedure TForm1.N9Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� ������������ (�����)';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� �������';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N11Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� ����������� ������������';
  form9.ShowModal();   
  Form9.Free;
end;

procedure TForm1.N12Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� ���������� ���������� (��� ������ ���)';
  form9.ShowModal();    
  Form9.Free;
end;

procedure TForm1.N13Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form23.Caption:='����� �� ��������� ��� � �������� (��������)';
  form23.ShowModal();     
  Form9.Free;
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� ����� �� �� (�������� �������)';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N15Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��������� ����������';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N16Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='����������� �� ���������� � ������� �������. �������� ���';
  form32.ShowModal();
  Form32.Free;
  Form9.Free;
end;

procedure TForm1.N67Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���������� �������� ������� � ��������� � ��,������� �� �� �������. �������� ������';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N69Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='��� �� �������� ��� � ��� �� �������. �������� ������';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N70Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='��� �� �������: ��-�� �����,����,�������,������� ���������. �������� ������';
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
  form9.Caption:='����� �� ������ ������� � ����������� 0 �� �������';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����������� ������';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N21Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��������� ������������ �� ����������.';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N22Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='�������� ���������� �� ������������ � �����������.';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N23Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='����������� �� ���������� � ������������ ����� �� �������';
  form32.ShowModal();
  Form32.Free;
  Form9.Free;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������������ ��������� ������������ �������.';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N25Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� � ������������ ������������� ���';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N26Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� ������������ ���������';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N27Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='�������� ������ �� � ��� � �������';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N28Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='�������� ���� (������������ � ����������)';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N29Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����� �� ��������� ����������� � ����������� ������';
  form9.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N30Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form2.Caption:='����� �� �������� ���';
  Form2.ShowModal();    
  Form2.Free;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form2.Caption:='��� (�������) � �������� �� �������';
  Form2.ShowModal();
  Form2.Free;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������������ � ����������� ����������� � ��������� �����������';
  Form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N33Click(Sender: TObject);
var value:string;
begin
  repeat
    value:=InputBox('!!!', '����������, ������', '******');
  until value <> '';
  if value='zopa' then
  begin
    Application.CreateForm(TForm9, Form9);
    form9.Caption:='����������� ������. ����������';
    form9.ShowModal(); 
    Form9.Free;
  end;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��������� ������������ ����.';
  form9.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N35Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='������ �� ����,�������. �������� ���';
  form32.ShowModal();  
  Form32.Free;               
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� ����������� �� ���. �������� ������';
  form9.ShowModal();
  Form9.Free;
end;

 procedure TForm1.N73Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='�������� ������. �������� ���';
  form32.ShowModal(); 
  Form32.Free;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='���������� ������� ��� �� �������. �������� ������';
  form9.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N38Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������������ �� ����������� �������� ��� ������ ��� �� �������. �������� ������';
  form9.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N39Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='������,�������� �� ������ �� ���� (���). �������� ���';
  form32.ShowModal();  
  Form32.Free;
end;

 procedure TForm1.N60Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��������� ���������,�������� �� �������. �������� ������';
  form9.ShowModal();   
  Form9.Free;
end;

 procedure TForm1.N61Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='�������� �������� �������� �� �������. �������� ������';
  form9.ShowModal(); 
  Form9.Free;
end;

 procedure TForm1.N62Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ������. �������� ���';
  form32.ShowModal();
  Form32.Free;
end;

 procedure TForm1.N63Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������ � ��������� � ��� � ������ ��������� �� �������. �������� ������';
  form9.ShowModal();    
  Form9.Free;
end;

 procedure TForm1.N64Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ���';
  form32.ShowModal();
  Form32.Free;
end;

 procedure TForm1.N65Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ���';
  form32.ShowModal();
  Form32.Free;
end;

 procedure TForm1.N66Click(Sender: TObject);
begin
  Application.CreateForm(TForm32, Form32);
  form32.Caption:='���������� ���(��� ���) �� ���� �� �������. �������� ���';
  form32.ShowModal();
  Form32.Free;
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

  takepw := InputBox('������', '������� ������ ��� ������ ��������', '');
  if takepw = '' then
  begin
    showmessage('���� �� ���������. ������� ������!');
    exit;
  end;

  if takepw = password then
  begin
    Application.CreateForm(Tcopycnct, copycnct);
    copycnct.ShowModal();
    copycnct.Free;
  end
  else
    showmessage('�������� ������! ���������� � ���');
end;

function TForm1.SCAlive : boolean;
begin
  try 
    idhttp1.Get(SERVER_ADDR + 'dummy');
  except
    showError('������ ����', '�� ������� ������������ � �������!');
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
  if not showError('������ �������', '���������� ����� �������! ���� ������������ �� ����������� ������ '
    + ' - ���������� � ��� � �� ���������� ������.') then
    Application.Terminate;
end;

end;

function TForm1.execQuery(Q : TOraQuery; S : string; T : boolean) : boolean;
begin 

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
      if not showError('������ �������', E.Message + #10#13 + '���������� ����� �������! ���� ������������ �� ����������� ������ '
      + ' - ���������� � ��� � �� ���������� ������.') then
        Application.Terminate;

      Clipboard.asText := S;

      execQuery := false;
    end;
  end;

end;

procedure TForm1.N43Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption := '������� �� ������������ (�����)';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption := '������� �� ������������ (������)';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N46Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption := '���������� �� ��������';
  
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N47Click(Sender: TObject);
begin
  exit;
  
  Application.CreateForm(Tleftovers, leftovers);
  leftovers.selectType := true;
  leftovers.Showmodal();
  leftovers.Free;
end;

procedure TForm1.N44Click(Sender: TObject);
begin
  //osnovnaya nomenclature po deficity
  exit;
  
  Application.CreateForm(TForm9, Form9);
  form9.Caption := '�������� ������������ �� ��������';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N45Click(Sender: TObject);
begin
  Application.CreateForm(Trequest_date, request_date);
  request_date.ShowModal();
  request_date.Free;
end;

procedure TForm1.N48Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���: ��� �� �������. �������� ������';
  Form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N49Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='���: ���������� ��-��� � �������� ��� �� �������. �������� ������';
  form9.ShowModal();
  Form9.Free;
end;


procedure TForm1.N50Click(Sender: TObject);
begin
  Application.CreateForm(TFReestr_doc_sklad, FReestr_doc_sklad);
  FReestr_doc_sklad.Caption:='������ ���������� �������� �� ������ �� ������';
  FReestr_doc_sklad.ShowModal();
  FReestr_doc_sklad.Free;
end;


procedure TForm1.N51Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='���: ����� �� ��� �� �������. �������� ������';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N02Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='��� � ������������ 0 � ��������� � ��� �� �������. �������� ������';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N52Click(Sender: TObject);
begin
  Application.CreateForm(Tf_calendar, f_calendar);
  f_calendar.Showmodal();
  Show_TTRTN_Details(f_calendar.result_month, f_calendar.result_year, true);
  f_calendar.Free;
end;

procedure TForm1.N53Click(Sender: TObject);
begin
  Application.CreateForm(Tleftovers, leftovers);
  leftovers.selectType := false;
  leftovers.Showmodal();
  leftovers.Free;
end;

procedure TForm1.N54Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������������ �� �������. �������� ������';
  form9.ShowModal();
  form9.Free;
end;

procedure TForm1.N55Click(Sender: TObject);
begin
  Application.CreateForm(Tf_calendar, f_calendar);
  f_calendar.Showmodal();
  Show_TTRTN_Details(f_calendar.result_month, f_calendar.result_year, false);
  f_calendar.Free;
end;

procedure TForm1.N56Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���: ��������. �������� ������';
  Form9.ShowModal();
  Form9.Free;

end;

procedure TForm1.N57Click(Sender: TObject);
begin
  Application.CreateForm(TFNomenklator, FNomenklator);
  FNomenklator.Caption:='�����������';
  FNomenklator.ShowModal();
  FNomenklator.Free;
 end;

procedure TForm1.N68Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������������ �������� ������������';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.N71Click(Sender: TObject);
begin
  Application.CreateForm(Tf_calendar, f_calendar);
  f_calendar.Showmodal();
  main_nomenclature_list(f_calendar.result_month, f_calendar.result_year, ''(*unassigned*));
  f_calendar.Free;                                
end;

procedure TForm1.N72Click(Sender: TObject);
begin
  //���������� ��������� �� �������: ��,���,���
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���������� ��������� �� �������: ��,���,���';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.N74Click(Sender: TObject);
begin
  //���������� ���������  �� ��� �� ���������� �� �������
   Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���������� ��������� �� ��� �� ���������� �� �������';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.N75Click(Sender: TObject);
begin
//������� ����������� �� ���(��� ���)
 Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� ����������� �� ���(��� ���). �������� ������';
  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N58Click(Sender: TObject);
begin
  Application.CreateForm(TFSum_trud_vidnorm, FSum_trud_vidnorm);
  FSum_trud_vidnorm.Caption:='��������� ��-�� �� ����� ���� �� ��������';
  FSum_trud_vidnorm.ShowModal();
  FSum_trud_vidnorm.Free;
end;

procedure TForm1.N76Click(Sender: TObject);
begin
 //����� ��� �� ��� �� �������
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='����� ��� �� ��� �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
 end;

procedure TForm1.N78Click(Sender: TObject);
begin
 //������ �� ����� � ������� ������������� � ����������� ���������� �� �������

  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������ �� ����� � ������� ������������� � ����������� ���������� �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.N79Click(Sender: TObject);
begin
 //������ �� �����  �������������  ������������ �� �������
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������ �� ����� � ������� ������������� ������������ �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //test;
end;

procedure TForm1.N80Click(Sender: TObject);
begin
  Application.CreateForm(TDocSpCnt, DocSpCnt);
  DocSpCnt.ShowModal();
  DocSpCnt.Free();
end;

procedure TForm1.N81Click(Sender: TObject);
begin
 //��������� ������ �� ������������ ������������ �� �������
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='��������� ������ �� ������������ ������������ �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;

end;

procedure TForm1.N82Click(Sender: TObject);
begin
 //��������� ���������,�������� � ��������� � ������ �� �������

  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='��������� ���������,�������� � ��������� � ������ �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;

end;

procedure TForm1.N83Click(Sender: TObject);
begin
//������ �� ����� � ������� �������������� � ������������ ������������ �� �������

 Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������ �� ����� � ������� �������������� � ������������ ������������ �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
                      
end;

procedure TForm1.N84Click(Sender: TObject);
begin
//������������� ���: ��������� ��������,������ �� �������

 Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������������� ���: ��������� ��������,������ �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
  
end;        

procedure TForm1.N85Click(Sender: TObject);
begin
  Application.CreateForm(Tequipment_details, equipment_details);
  equipment_details.ShowModal();
  equipment_details.Free;
end;

procedure TForm1.N86Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='����� ������� ��������� ��� ������� ���� �� ������� (����)';
  Form9.showmodal();
  Form9.Free;
end;

procedure TForm1.N87Click(Sender: TObject);
begin
  Application.CreateForm(Tpotreb, potreb);
  potreb.showmodal();
  potreb.Free;
end;

procedure TForm1.N88Click(Sender: TObject);
begin
  //��������� ������ �� ����������� ���������� �� �������

  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='��������� ������ �� ����������� ���������� �� �������. �������� ������';
  Form9.showmodal();
  Form9.Free;
 
end;

procedure TForm1.N89Click(Sender: TObject);
begin
  Application.CreateForm(Ttx_createdList, tx_createdList);
  tx_createdList.ShowModal();
  tx_createdList.Free;
end;

procedure TForm1.N90Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='������������� ������� �� �������-���������';
  Form9.showmodal();
  Form9.Free;
end;

end.
