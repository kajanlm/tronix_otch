unit cpct;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, GridsEh, DBGridEh, jpeg, ExtCtrls,
  StdCtrls, ComCtrls;

type
  Tcopycnct = class(TForm)
    DBGridEh1: TDBGridEh;
    DataSource: TOraDataSource;
    Query: TOraQuery;
    cbt_filter: TComboBox;
    filter_query: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    datefrom: TDateTimePicker;
    dateto: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    datefilter: TCheckBox;
    QueryPOSTAVK: TStringField;
    QueryDOC: TStringField;
    QueryINN: TFloatField;
    QueryDB: TStringField;
    QueryDE: TStringField;
    Label4: TLabel;
    selffilter: TCheckBox;
    QueryID: TIntegerField;
    QueryPOST_ID: TFloatField;
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure filter_queryChange(Sender: TObject);
    procedure cbt_filterChange(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
  private
    FILTER_MASK : string;
    procedure parseFilter;
    procedure LOAD_CONTRACTS;
    { Private declarations }
  public
    { Public declarations }
    DATE_MASK : string;
  end;

var
  copycnct: Tcopycnct;

implementation

uses unit1, cnctbody;

{$R *.dfm}

procedure Tcopycnct.LOAD_CONTRACTS;
var SQL : string;
begin
  SQL := 'SELECT post.FIRM_ID as POST_ID, cnt.NN as ID, post.kod_ni as INN, post.NAME as POSTAVK, TO_CHAR(cnt.DATE_BEG, ' + char(39) + DATE_MASK + char(39) + ') as DB, '
  + 'TO_CHAR(cnt.DATE_END, ' + char(39) + DATE_MASK + char(39) + ') as DE, cnt.NUM_DOC as DOC FROM TRONIX.FIRM post, TRONIX.CONTRACT cnt WHERE '
  + 'cnt.NN_FIRM_EXEC = post.firm_id(+) AND ' + FILTER_MASK + ' AND ';

  if datefilter.Checked then
    SQL := SQL + '(cnt.DATE_BEG between to_date(' + char(39) + datetostr(datefrom.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + ') AND to_date(' + char(39) + datetostr(dateto.date) + char(39) + ', ' + char(39) + DATE_MASK + char(39) + '))'
  else
    SQL := SQL + '(1 = 1)';

  if selffilter.checked then
    SQL := SQL + ' AND (cnt.USER_NAME1 = USER)'
  else
    SQL := SQL + ' AND (1 = 1)';

  Query.Close;
  Query.SQL.Text := SQL;
  Query.Open;
end;

procedure Tcopycnct.parseFilter;
var pole : string;
begin

  if length(filter_query.Text) < 2 then
  begin
    FILTER_MASK := '(1 = 1)';
    exit;
  end;

  if cbt_filter.ItemIndex = 0 then
    pole := 'post.kod_ni'
  else
    pole := 'post.name';

  FILTER_MASK := pole + ' like ' + char(39) + filter_query.text + char(39);
end;

procedure Tcopycnct.Image1Click(Sender: TObject);
begin

  if filter_query.Enabled then
  begin
    FILTER_MASK := '(1 = 1)';
    cbt_filter.Enabled := false;
    filter_query.Enabled := false;
  end
  else
  begin
  
    parseFilter;
    
    cbt_filter.Enabled := true;
    filter_query.Enabled := true;
    filter_query.SetFocus;
  end;

end;

procedure Tcopycnct.FormShow(Sender: TObject);
begin
  DATE_MASK := 'DD.MM.YYYY';
  FILTER_MASK := '(1 = 1)';
  
  datefrom.Date := now;
  dateto.Date := now;

  LOAD_CONTRACTS;
end;

procedure Tcopycnct.filter_queryChange(Sender: TObject);
begin
  parseFilter;
end;

procedure Tcopycnct.cbt_filterChange(Sender: TObject);
begin
  parseFilter;
end;

procedure Tcopycnct.Image2Click(Sender: TObject);
begin
  LOAD_CONTRACTS;
end;

procedure Tcopycnct.DBGridEh1DblClick(Sender: TObject);
var SQL : string;
begin
  Application.CreateForm(Ts_contract, s_contract);

  SQL :=
  'SELECT sp.KOD as KOD, substr(upper(ltrim(tronix_sp_sp_name(ttn.sprav_sprav_id, null, 3))), 1, 50) '
  + 'as NAME, ttn.KOL as KOL, kdd.NAMEK as ED, ttn.CENA, ttn.KOL_UCHET, kdc.NAMEK as ED_UCHET, ttn.CENA_UCHET, '
  + 'ttn.NDS FROM TRONIX.TTN_MAT ttn, TRONIX_SPRAV sp, TRONIX_KODED kdd, TRONIX_KODED kdc '
  + 'WHERE sp.SPRAV_ID = ttn.SPRAV_SPRAV_ID AND kdd.KODED_ID = ttn.KODED_KODED_ID AND kdc.KODED_ID = '
  + 'decode(ttn.KODED_KODED_ID_UCHET, null, ttn.KODED_KODED_ID, ttn.KODED_KODED_ID_UCHET) AND '
  + 'ttn.CONTRACT_CONTRACT_ID = ' + Query.FieldByName('ID').asString;

  s_contract.Caption := s_contract.Caption + ' ' + Query.FieldByName('POSTAVK').asString;
  s_contract.GLOBAL_ID := Query.FieldByName('ID').asString;
  s_contract.SELECTED_FIRM := Query.FieldByName('POST_ID').asString;
  s_contract.FIRM_NAME := Query.FieldByName('POSTAVK').asString;

  s_contract.Query.Close;
  s_contract.Query.SQL.Text := SQL;
  s_contract.Query.Open;

  s_contract.Showmodal();
  s_contract.Free;

  LOAD_CONTRACTS;
end;

end.
