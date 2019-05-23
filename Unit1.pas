unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBAccess, OdacVcl, DB, Ora, Menus, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP;

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
    procedure N43Click(Sender: TObject);
    procedure N44Click(Sender: TObject);
    procedure N45Click(Sender: TObject);
  private
    { Private declarations }
  public
    function SCAlive : boolean;
    function ServerRequest(s : string) : string;
    { Public declarations }
  end;

var
  Form1: TForm1;
  z:integer;

const
SERVER_ADDR = 'http://192.168.10.15:7777/server/tronix_otch/';
SERVER_FILE_PART = '.sql';

implementation

uses Unit2, Unit7, Unit8, Unit9, Unit12, Unit17, Unit23, Unit32, Unit34, cpct, r_dates;

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
  form32.Caption:='����������� �� ���������� � ������� �������. �������� ���';
  form32.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N67Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form9.Caption:='���������� �������� ������� � ��������� � ��,������� �� �� �������. �������� ������';
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
  form32.Caption:='����������� �� ���������� � ������������ ����� �� �������';
  form32.ShowModal(); 
  Form9.Free;
end;

procedure TForm1.N24Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='����������� ��������� ������������ �������.';
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
  Form9.Free;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  Form2.Caption:='��� (�������) � �������� �� �������';
  Form2.ShowModal();
  Form9.Free;
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
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='������ �� ����,�������. �������� ���';
  form32.ShowModal();  
  Form9.Free;
end;

procedure TForm1.N36Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='������� ����������� �� ���. �������� ������';
  form9.ShowModal();   
  Form9.Free;
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
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='������,�������� �� ������ �� ���� (���). �������� ���';
  form32.ShowModal();  
  Form9.Free;
end;

 procedure TForm1.N60Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption:='�� ��������� ��������� ������ 237 �� �������. �������� ������';
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
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='������� ����������� - ����������� ��-�� �� ���� � ������� ���������,������� ���,����������� �� ������. �������� ���';
  form32.ShowModal(); 
  Form9.Free;
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
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='������������� ��-�� �� ���� � ������� ���������,��������,�������� ����� �� �������. �������� ���';
  form32.ShowModal();
  Form9.Free;
end;

 procedure TForm1.N65Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='��������� ������������� ��-�� �� ���� � ������� ��������,�������� �����,��������� c ��������� � ��� �� �������. �������� ���';
  form32.ShowModal();
  Form9.Free;
end;

 procedure TForm1.N66Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form32.Caption:='���������� ���(��� ���) �� ���� �� �������. �������� ���';
  form32.ShowModal();
  Form9.Free;
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
  showmessage('������ ���������� � ��������!');
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
  showmessage('ERROR');
  Application.Terminate;
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

procedure TForm1.N44Click(Sender: TObject);
begin
  Application.CreateForm(TForm9, Form9);
  form9.Caption := '���������� �� ��������';

  form9.ShowModal();
  Form9.Free;
end;

procedure TForm1.N45Click(Sender: TObject);
var password, takepw : string;
begin
  if not SCAlive then
    exit;

  password := ServerRequest('[PASS]REQ_DATES');

  takepw := InputBox('������', '������� ������ ��� ������ ��������', '');
  if takepw = '' then
  begin
    showmessage('���� �� ���������. ������� ������!');
    exit;
  end;

  if takepw = password then
  begin
    Application.CreateForm(Trequest_date, request_date);
    request_date.ShowModal();
    request_date.Free;
  end
  else
    showmessage('�������� ������! ���������� � ���');
end;

end.
