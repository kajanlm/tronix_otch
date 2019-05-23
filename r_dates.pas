unit r_dates;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh, ComCtrls, StdCtrls,
  jpeg, ExtCtrls;

type
  Trequest_date = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource: TOraDataSource;
    Query: TOraQuery;
    datefilter: TCheckBox;
    Label3: TLabel;
    dateto: TDateTimePicker;
    Label2: TLabel;
    datefrom: TDateTimePicker;
    QueryTYPE: TStringField;
    QueryNOMER: TStringField;
    QueryDATEC: TStringField;
    QueryDATE1: TStringField;
    QueryDATE2: TStringField;
    QueryDATE3: TStringField;
    QueryID: TFloatField;
    QueryCEH: TStringField;
    QuerySKLAD: TStringField;
    OraInsert: TOraQuery;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    fnomer: TEdit;
    Label1: TLabel;
    Image2: TImage;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
    procedure SelectRequests;
  public
    { Public declarations }
  end;

var
  request_date: Trequest_date;

implementation

{$R *.dfm}

procedure Trequest_date.FormShow(Sender: TObject);
begin
  datefrom.Date := now;
  dateto.Date := now;

  SelectRequests;
end;

procedure Trequest_date.SelectRequests;
var SQL, DATE_FILTER, NOMER_FILTER : string;
const DATE_MASK = 'DD.MM.YYYY';
begin
  Query.Close;


  if datefilter.Checked then
    DATE_FILTER := '(tn.DATE_DOK between to_date(' + char(39) + datetostr(datefrom.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + ') AND to_date(' + char(39) + datetostr(dateto.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + '))'
  else
    DATE_FILTER := '(1 = 1)';

  if fnomer.Text <> '' then
    NOMER_FILTER := '(tn.NOMER like ' + char(39) + '%' + fnomer.Text + '%' + char(39) + ')'
  else
    NOMER_FILTER := '(1 = 1)';

  SQL := 'select tn.ttn_id as id, tn.NOMER, tpn.name as type, decode(DPM.TYPE_DEP_TYPE_DEP_ID, 2, DPM.NOMER, DPC.NOMER) as CEH, '
  + 'DPS.NOMER as SKLAD, TO_CHAR(tn.DATE_DOK, ' + char(39) + DATE_MASK + char(39) + ') as DATEC, '
  + 'TO_CHAR(tn.USER_DATE1, ' + char(39) + DATE_MASK + char(39) + ') as DATE1, TO_CHAR(tn.USER_DATE2, ' + char(39) + DATE_MASK + char(39) + ') as DATE2, '
  + 'TO_CHAR(tn.USER_DATE4, ' + char(39) + DATE_MASK + char(39) + ') as DATE3 FROM kadry_dep dpc, kadry_dep dpm, kadry_dep dps, '
  + 'tronix.ttn tn, tronix.type_ttn tpn WHERE tn.DEP_DEP_ID_FROM = DPS.DEP_ID(+) AND tn.DEP_DEP_ID_TO = DPC.DEP_ID(+) AND DPC.DEP_DEP_ID = DPM.DEP_ID(+) '
  + 'AND tn.TYPE_TTN_TYPE_TTN_ID = tpn.TYPE_TTN_ID(+) AND tn.DATE_INS is null AND tn.DATE_DOK is not null AND tn.TYPE_TTN_TYPE_TTN_ID in (43, 44) '
  + 'AND ' + DATE_FILTER + ' AND ' + NOMER_FILTER + ' ORDER BY tn.DATE_DOK DESC';

  //showmessage(SQL);
  Query.SQL.Text := SQL;
  Query.Open;
end;

procedure Trequest_date.DBGridEh1DblClick(Sender: TObject);
var
D1,
D2,
D3
: string;
begin

  D1 := Dbgrideh1.DataSource.DataSet.FieldByName('DATE1').AsString;
  D2 := Dbgrideh1.DataSource.DataSet.FieldByName('DATE2').AsString;
  D3 := Dbgrideh1.DataSource.DataSet.FieldByName('DATE3').AsString;

  if D3 <> '' then
  begin
    showmessage('Данный документ уже получен обеспечением!');
    exit;
  end;

  if (D1 = '') or (D2 = '') then
  begin
    showmessage('Данный документ еще не обработан снабжением или не передан на склад!');
    exit;
  end;

  if MessageDlg('Проставить дату "ПОЛУЧЕН ОБЕСПЕЧЕНИЕМ" для документа ' + dbgrideh1.DataSource.DataSet.FieldByName('NOMER').asString + '?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    OraInsert.Close;
    OraInsert.SQL.Text := 'UPDATE tronix.ttn SET USER_DATE4 = TO_DATE(sysdate), USER_NAME4 = USER WHERE TTN_ID = '
    + dbgrideh1.DataSource.DataSet.FieldByName('id').asString;
    OraInsert.ExecSQL;
  end
  else
    exit;

  SelectRequests;

end;

procedure Trequest_date.Image2Click(Sender: TObject);
begin
  SelectRequests;
end;

end.
