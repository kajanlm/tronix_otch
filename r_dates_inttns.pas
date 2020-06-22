unit r_dates_inttns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh, StdCtrls, ComCtrls,
  jpeg, ExtCtrls, IdHTTP;

type
  Tinput_ttns = class(TForm)
    ttn_rows: TDBGridEh;
    DataSource: TOraDataSource;
    Query: TOraQuery;
    OraInsert: TOraQuery;
    FloatField1: TFloatField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    doQuery: TImage;
    dateto: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    datefrom: TDateTimePicker;
    datefilter: TCheckBox;
    fnomer: TEdit;
    Label1: TLabel;
    setcrack: TButton;
    palette: TImage;
    isColor: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure doQueryClick(Sender: TObject);
    procedure fnomerKeyPress(Sender: TObject; var Key: Char);
    procedure ttn_rowsDblClick(Sender: TObject);
    procedure setcrackClick(Sender: TObject);
    procedure ttn_rowsDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure isColorClick(Sender: TObject);
  private
    { Private declarations }
    procedure Select;
    procedure updateDocument(isCrack : boolean);
  public
    { Public declarations }
  end;

var
  input_ttns: Tinput_ttns;
  USER_STATUS : integer;
const
  sendmail_url = 'http://192.168.10.15:7777/server/sendmail/orders.php?';

implementation

{$R *.dfm}

uses Unit1;

procedure Tinput_ttns.FormShow(Sender: TObject);
var
SQL : string;
DEP_ID : integer;
begin

  USER_STATUS := 0;
  (* load permissions *)

  //USER_STATUS := 0;
  //USER_STATUS := 1;
  
  (* ................ *)

  datefrom.Date := now;
  dateto.Date := now;

  SQL := 'select dp.type_dep_type_dep_id as type_dep, dp.dep_id, dp.nomer as ceh, o.prikaz_id from (select pii.prikaz_id, pii.dep_dep_id as dep_id '
  + 'from kadry_prikaz pii, kadry_type_prikaz tpp where pii.ts_number=USER and pii.escape_date is null and '
  + 'pii.type_prikaz_type_prikaz_id = tpp.type_prikaz_id and tpp.kod = 1) o, kadry_dep dp where o.dep_id = dp.dep_id';
  form1.execQuery(Query, SQL, false);

  if (Query.RecordCount < 1) or (Query.RecordCount > 1) then
  begin
    if not form1.showError('Ошибка запроса получения подразделения', 'Приложение будет закрыто! Если присутствуют не сохраненные данные '
    + ' - обратитесь в АСУ и не закрывайте ошибку.') then
      Application.Terminate;
  end;

  DEP_ID := strtoint(Query.FieldByName('DEP_ID').asString);

  (*
  if DEP_ID = 4041 then //sklad
  begin
    USER_STATUS := 0;
    showMessage('Склад');
  end
  else
  *)
  setcrack.Visible := false;
  if (*DEP_ID = 4239*) true then //OTK
  begin
    USER_STATUS := 1;
    setcrack.Visible := true;
    showMessage('ОТК');
  end
  else
  begin
    USER_STATUS := -1;
    showMessage('Только чтение!');
  end;


  Select;

end;

procedure Tinput_ttns.Select;

var
SQL,
DATE_FILTER,
NOMER_FILTER
: string;

const DATE_MASK = 'DD.MM.YYYY';

begin
  if datefilter.Checked then
    DATE_FILTER := '(tn.DATE_DOK between to_date(' + char(39) + datetostr(datefrom.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + ') AND to_date(' + char(39) + datetostr(dateto.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + '))'
  else
    DATE_FILTER := '(1 = 1)';

  if fnomer.Text <> '' then
    NOMER_FILTER := '(tn.NOMER like ' + char(39) + '%' + fnomer.Text + '%' + char(39) + ')'
  else
    NOMER_FILTER := '(1 = 1)';

  //some nomers not exists
  //dep_dep_id_to: every time is null
  //dep_dep_id_from: may is null
  //what is:
  //  - user_date1
  //  - user_date2
  //  ?


  //user_date/name3 - is null
  //user_date/name4 - is null

  //if user_date2 are defined - date_ins (closed) - defined too


  SQL := 'SELECT tn.ttn_id as id, tn.nomer, dpf.nomer as c_to, tn.date_dok as cdate, tn.user_date3 as sdate, tn.user_date4 as bdate, '
  + 'tn.NOMER_AKT_NAR as VED_NOM, tn.user_date5 as edate FROM TRONIX.TTN tn, KADRY_DEP dpf WHERE tn.TYPE_TTN_TYPE_TTN_ID = 1 and tn.user_date1 is null '
  + 'and tn.user_date2 is null and tn.date_ins is null and tn.dep_dep_id_to is not null and ' + DATE_FILTER + ' and ' + NOMER_FILTER + ' and '
  + 'tn.dep_dep_id_to = dpf.dep_id(+) order by tn.DATE_DOK desc';

  //showmessage(SQL);
  form1.execQuery(Query, SQL, false);

  //inserting:
  //  - using check on previous dates
  //  - like a "r_dates": access.file on server
  //

  //filters:
  //  - date between
  //  - closed[on/off]
  //  - define DEP
  //  - ...

  //  -grid: hierarchy of dates 1-> 2-> 3->
  //

  //create, set status "ready" to "YES": -  ALL SKLADY (kladovshiki)
  //checkers, check[start/end]: - OTK

end;

procedure Tinput_ttns.doQueryClick(Sender: TObject);
begin
  Select;
end;

procedure Tinput_ttns.fnomerKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #13 then
    if (length(fnomer.Text) > 3) then
      Select;
end;

procedure Tinput_ttns.ttn_rowsDblClick(Sender: TObject);
begin
  updateDocument(false);
end;

procedure Tinput_ttns.setcrackClick(Sender: TObject);
begin
  updateDocument(true);
end;

procedure Tinput_ttns.updateDocument(isCrack : boolean);

var
start, ended, crack, ved_nom,
INSERT_FIELD_INDEX,
INSERT_MESSAGE_TXT,
doc,
INJECT_VED_NOM,
SQL
: string;

toMail : boolean;

smtp_server : tIDHttp;

begin
  start := ttn_rows.DataSource.DataSet.FieldByName('SDATE').asString;
  ended := ttn_rows.DataSource.DataSet.FieldByName('EDATE').asString;

  INSERT_FIELD_INDEX := '';

  (*
  if USER_STATUS = 0 then
  begin //#SKLAD#

    if (ready <> '') or (start <> '') or (ended <> '') then
    begin
      showmessage('Данный документ уже обработан вашим подразделением!');
      exit;
    end;

    INSERT_FIELD_INDEX := '3';
    INSERT_MESSAGE_TXT := 'ГОТОВ К ПРОВЕРКЕ';

  end
  else
  *)

  if USER_STATUS = 1 then
  begin //#CHECKERS#

    INJECT_VED_NOM := '';
    toMail := false;
    
    if ended <> '' then
    begin
      showmessage('Данный документ уже проверен и допущен к проведению!');
      exit;
    end;

    if isCrack then
    begin
      if start = '' then
      begin
        showMessage('Контрольная процедура по данному документ еще не началась!');
        exit;
      end;

      crack := ttn_rows.DataSource.DataSet.FieldByName('BDATE').asString;
      ved_nom := ttn_rows.DataSource.DataSet.FieldByName('VED_NOM').asString;
      if (crack <> '') or (ved_nom <> '') then
      begin
        showmessage('Данная ведомость уже забракована (' + crack + ') и имеет номер контрольной ведомости: ' + ved_nom);
        exit;
      end;

      doc := InputBox('БРАК', 'Введите номер контрольной ведомости:', '');
      if (doc = '') or (doc = ' ') or (length(doc) < 2) then
      begin
        showMessage('Ошибка ввода. Введите корректный номер контрольной ведомости!');
        exit;
      end;

      INJECT_VED_NOM := ', NOMER_AKT_NAR = ' + doc;

      INSERT_FIELD_INDEX := '4';
      INSERT_MESSAGE_TXT := 'БРАК';
    end
    else
    begin

      if start = '' then
      begin
        INSERT_FIELD_INDEX := '3';
        INSERT_MESSAGE_TXT := 'НАЧАЛО КОНТРОЛЬНОЙ ПРОЦЕДУРЫ';
      end
      else
      begin
        INSERT_FIELD_INDEX := '5';
        INSERT_MESSAGE_TXT := 'ГОТОВ К ПРОВЕДЕНИЮ';
        toMail := true;
      end;

    end

  end
  else              
    exit; //read only

  if MessageDlg('Проставить дату "' + INSERT_MESSAGE_TXT + '" для документа (ордера): ' + ttn_rows.DataSource.DataSet.FieldByName('NOMER').asString + ' ?',
  mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  SQL := 'UPDATE TRONIX.TTN SET user_date' + INSERT_FIELD_INDEX + ' = TO_DATE(sysdate), user_name' + INSERT_FIELD_INDEX
  + ' = USER' + INJECT_VED_NOM + ' WHERE ttn_id = ' + ttn_rows.DataSource.DataSet.FieldByName('id').asString;
  showmessage(SQL);

  form1.execQuery(OraInsert, SQL, true);

  if toMail then
  begin
    smtp_server := TIdHTTP.Create(nil);
    try
      smtp_server.Get(sendmail_url + 'num=' + ttn_rows.DataSource.DataSet.FieldByName('NOMER').asString + '&date=' + DateToStr(Date));
    except
      showmessage('sendmail(): error');
    end;
      smtp_server.Free;
  end;

  Select;

end;

procedure Tinput_ttns.ttn_rowsDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
var
start, crack, ended : string;
rColor : TColor;
begin
  if isColor.Checked then
  begin
    start := Column.Field.DataSet.FieldByName('SDATE').asString;
    crack := Column.Field.DataSet.FieldByName('BDATE').asString;
    ended := Column.Field.DataSet.FieldByName('EDATE').asString;

    if (ended <> '') then
      rColor := TColor(rgb(127, 230, 37))
    else
    if (crack <> '') then
      rColor := TColor(rgb(217, 37, 37))
    else
    if (start <> '') then
       rColor := TColor(rgb(219, 213, 86))
    else
      rColor :=  TColor(rgb(153, 153, 153));

    ttn_rows.Canvas.Brush.Color := rColor;
  end;

   ttn_rows.DefaultDrawColumnCell(rect, DataCol, Column, State);
end;

procedure Tinput_ttns.isColorClick(Sender: TObject);
begin
  ttn_rows.Refresh;
end;

end.
