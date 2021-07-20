unit Rasxod_obor_otgr_prixod_order_for_bux;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

 type
  TFRasxod_obor_otgr_prixod_order_for_bux = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1god: TStringField;
    OraQuery1nompr: TStringField;
    OraQuery1datpr: TStringField;
    OraQuery1nomtn: TStringField;
    OraQuery1dattn: TStringField;
    OraQuery1nomschf: TStringField;
    OraQuery1datschf: TStringField;
    OraQuery1post: TStringField;
    OraQuery1inn: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_obor_otgr_prixod_order_for_bux: TFRasxod_obor_otgr_prixod_order_for_bux;
  MyBookmark: TBookMark;
  dn: string;
  dk: string;
  implementation

uses Unit9;

{$R *.dfm}

procedure TFRasxod_obor_otgr_prixod_order_for_bux.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
 
DateTimePicker1.DateTime:=StrToDate(Edit3.Text);
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;


procedure TFRasxod_obor_otgr_prixod_order_for_bux.Button2Click(Sender: TObject);
var
FExcel,Sheet: OleVariant;
dna,nomna,dsch,nomsch,tx:string;
nk: integer;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:='select nn.godins as god,nn.nomer as nompr,nn.dattn datpr,nn.nanomer as nomtn,nn.datna as dattn,';
tx:=tx+' nn.cfnomer as nomschf,nn.datcf as datschf,nn.post as post,to_char(nn.inn,''999999999999'') as inn';
tx:=tx+' from(';

tx:=tx+' select distinct ll.obosn obosn,SUBSTR(to_char(tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,tn.nomer nomer,';
tx:=tx+' to_char(tn.date_ins, ''DD.MM.YYYY'') dattn,';
tx:=tx+' na.nomer nanomer,to_char( na.date_prih, ''DD.MM.YYYY'' ) datna,';
tx:=tx+'  cf.num_calc cfnomer, to_char( cf.user_date1, ''DD.MM.YYYY'' ) datcf,';
tx:=tx+' fi.name post, fi.kod_ni inn';
tx:=tx+' from(';

tx:=tx+' select distinct tp.ttn_id obosn';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.ttn tp,tronix.ttn_mat t,tronix.sprav s,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11) and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+)';
tx:=tx+' and tronix.select_mat(s.tree_tree_id,''02'')=1';
tx:=tx+' and nvl(s.can_do_self,0)=0';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and t.ttn_mat_id=tm.ttn_mat_ttn_mat_id and t.ttn_ttn_id=tp.ttn_id';

tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN;
tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;

tx:=tx+') ll,';

tx:=tx+' tronix.nacl na,tronix.ttn tn,tronix.ttn_mat tm,tronix.calc_fact cf,tronix.firm fi';
tx:=tx+' where tn.type_ttn_type_ttn_id=1 and tm.ttn_ttn_id=tn.ttn_id and tn.ttn_id=ll.obosn';
tx:=tx+' and tm.calc_fact_calc_fact_id=cf.calc_fact_id(+)'; 
tx:=tx+' and tm.nacl_nacl_id=na.nacl_id(+)';
tx:=tx+' and tn.post_post_id_from=fi.firm_id(+)';
tx:=tx+' ) nn';
tx:=tx+' order by nn.godins,nn.nomer';

//ShowMessage(tx);

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_OTGR_PRIXOD_ORDER_FOR_BUX.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_OTGR_PRIXOD_ORDER_FOR_BUX.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'ÀËÒÚ1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.Open;
OraQuery1.First;

nk:=1;

While not OraQuery1.eof do
Begin
Inc(nk);


dna:='';
nomna:='';
dsch:='';
nomsch:='';

dna:=OraQuery1.FieldByName('dattn').asString;
if	Copy(dna,7,4)='1900' then
dna:='';

nomna:=OraQuery1.FieldByName('nomtn').asString;
if Pos('·/Ì',nomna)<>0 then
nomna:='';

nomsch:=OraQuery1.FieldByName('nomschf').asString;
if  Pos('·/Ì',nomsch)<>0 then
nomsch:='';

dsch:=OraQuery1.FieldByName('datschf').asString;
if	Copy(dsch,7,4)='1900' then
dsch:='';


Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('god').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('nompr').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('datpr').asString;
Sheet.Cells[nk,4].Value:=nomna;
Sheet.Cells[nk,5].Value:=dna;
Sheet.Cells[nk,6].Value:=nomsch;
Sheet.Cells[nk,7].Value:=dsch;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('post').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('inn').asString;
Sheet.Cells[nk,10].Value:=edit2.text;
Sheet.Cells[nk,11].Value:='Œ¡Œ–”ƒŒ¬¿Õ»≈';

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,11]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,11]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,11]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,11]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,11]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,11]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;
end;

procedure TFRasxod_obor_otgr_prixod_order_for_bux.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFRasxod_obor_otgr_prixod_order_for_bux.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFRasxod_obor_otgr_prixod_order_for_bux.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;


end.

