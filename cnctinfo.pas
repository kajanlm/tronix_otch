unit cnctinfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh;

type
  Tcntinfo = class(TForm)
    ndoc: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    date: TDateTimePicker;
    ename: TEdit;
    Label3: TLabel;
    Button1: TButton;
    Query: TOraQuery;
    QueryID: TFloatField;
    Queryname: TStringField;
    Querysname: TStringField;
    QueryINN: TFloatField;
    Label4: TLabel;
    postava: TEdit;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  cntinfo: Tcntinfo;

implementation

uses cnctbody, cpct;

{$R *.dfm}

procedure Tcntinfo.FormShow(Sender: TObject);
begin
  date.date := now;
  postava.Text := s_contract.FIRM_NAME;
end;

procedure Tcntinfo.Button1Click(Sender: TObject);
var SQL, firma, num_doc, name : string;
begin
  if MessageDlg('— Œœ»–Œ¬¿“‹ ¬€¡–¿ÕÕ€…  ŒÕ“–¿ “-ƒŒ√Œ¬Œ–?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    firma := s_contract.SELECTED_FIRM;
    num_doc := ndoc.text;
    name := ename.text;

    SQL := 'INSERT INTO TRONIX.CONTRACT (NN, NN_FIRM_CUST, NN_FIRM_EXEC, DATE_BEG, NUM_DOC, NAME, '
    + 'USER_GR_USER_GR_ID, USER_NAME1) VALUES (TRONIX.CONTRACT_SEQ.nextval, 40001, ' + firma + ', '
    + 'to_date(' + char(39) + datetostr(date.date) + char(39) + ', ' + char(39) + copycnct.DATE_MASK + char(39) + '), '
    + char(39) + num_doc + char(39) + ', ' + char(39) + name + char(39) + ', 8, USER)';

    Query.SQL.Text := SQl;
    Query.ExecSQL;

    SQL := 'INSERT INTO TRONIX.TTN_MAT (TTN_MAT_ID, CONTRACT_CONTRACT_ID, SPRAV_SPRAV_ID, KODED_KODED_ID, KOL, '
    + 'CENA, KOL_UCHET, CENA_UCHET, NDS, KODED_KODED_ID_UCHET) SELECT TRONIX.TTN_MAT_SEQ.nextval, '
    + 'TRONIX.CONTRACT_SEQ.currval, srk.SPRAV_SPRAV_ID, srk.KODED_KODED_ID, srk.KOL, srk.CENA, srk.KOL_UCHET, '
    + 'srk.CENA_UCHET, srk.NDS, srk.KODED_KODED_ID_UCHET FROM TRONIX.TTN_MAT srk WHERE srk.CONTRACT_CONTRACT_ID = '
    + s_contract.GLOBAL_ID;

    Query.SQL.Text := SQl;
    Query.ExecSQL;

    showmessage('—ÍÓÔËÓ‚‡ÌÓ!');

    ModalResult := mrOK;
    Self.Close;

  end
  else
    exit;
end;

end.
