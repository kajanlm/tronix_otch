unit Prihod_Order_Cfek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFPrihod_Order_Cfek = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kodm: TStringField;
    OraQuery1npo: TFloatField;
    OraQuery1nomp: TStringField;
    OraQuery1dvi: TStringField;
    OraQuery1edi: TStringField;
    OraQuery1kol: TStringField;
    OraQuery1cena: TStringField;
    OraQuery1sup: TStringField;
    OraQuery1sumnds: TStringField;
    OraQuery1zakaz: TStringField;
    OraQuery1dnakl: TStringField;
    OraQuery1nomnakl: TStringField;
    OraQuery1dschf: TStringField;
    OraQuery1nomschf: TStringField;
    OraQuery1kodpr: TStringField;
    OraQuery1inn: TStringField;
    OraQuery1kpp: TStringField;
    OraQuery1naimpost: TStringField;
    OraQuery1naim: TStringField;
    OraQuery1npoo: TFloatField;
    OraQuery1dok: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button2: TButton;
    Label2: TLabel;
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
  FPrihod_Order_Cfek: TFPrihod_Order_Cfek;
  dn: string;
  dk: string;
implementation


{$R *.dfm}

procedure TFPrihod_Order_Cfek.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
 
DateTimePicker1.DateTime:=date();
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFPrihod_Order_Cfek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFPrihod_Order_Cfek.Button2Click(Sender: TObject);
var
FExcel,Sheet: OleVariant;
//,Range: OleVariant;
tx:string;
nk: integer;
begin
 
tx:=' ';
tx:='select ll.kodm as kodm,ll.npo as npo,ll.nomp as nomp,ll.dvi as dvi,ll.edi as edi,';
tx:=tx+'to_char(ll.kolp,''99999999.9999'') as kol,';
tx:=tx+' to_char(ll.cena,''99999999.99'') as cena,';
tx:=tx+' to_char(ll.sup,''99999999999.99'') as sup,';
tx:=tx+' decode(nvl(ll.sunds,0),0,''0.0'',to_char(ll.sunds,''9999999999.99'')) as sumnds,';
tx:=tx+' ll.zakaz as zakaz,ll.dnakl as dnakl,ll.nomnakl as nomnakl,ll.dschf as dschf,ll.nomschf as nomschf,';
//  kodpr
tx:=tx+' substr(ll.kodpr,instr(ll.kodpr,''$'',1,1)+1,(instr(ll.kodpr,''$'',1,2)-instr(ll.kodpr,''$'',1,1))-1) as kodpr,';
//  inn
tx:=tx+' substr(ll.kodpr,instr(ll.kodpr,''$'',1,4)+1,(instr(ll.kodpr,''$'',1,5)-instr(ll.kodpr,''$'',1,4))-1) as inn,';
//  kpp
tx:=tx+' decode(substr(ll.kodpr,1,1),''$'','' '',substr(ll.kodpr,1,instr(ll.kodpr,''$'',1,1)-1)) as kpp,';
//  naimpost
tx:=tx+' substr(ll.kodpr,instr(ll.kodpr,''$'',1,3)+1,(instr(ll.kodpr,''$'',1,4)-instr(ll.kodpr,''$'',1,3))-1) as naimpost,';

tx:=tx+' ll.naim as naim,ll.npoo as npoo,';
tx:=tx+' ''Ï/Î ¹ ''||ll.nomp||'' îò ''||ll.dvi||decode(ll.nomnakl,'' '','' '','';ÒÍ ¹ ''||ll.nomnakl||decode(ll.dnakl,'' '','' '','' îò ''||ll.dnakl))||decode(ll.nomschf,'' '','' '','';Ñ×/Ô ¹ ''||ll.nomschf||decode(ll.dschf,'' '','' '','' îò ''||ll.dschf)) as dok,';
tx:=tx+' ll.dai as dai, ll.edo as edo';

tx:=tx+' from ';
tx:=tx+' (select tn.ttn_id npo,tn.ttn_id npoo,tn.nomer nomp,tn.nomer nomttn,ty.kod kodttn,ty.name ttn,tn.user_name1 tna,';
tx:=tx+' decode(substr(dt.nomer,1,3),''ÖÊÑ'',''25'',decode(substr(dt.nomer,3,1),''-'',substr(dt.nomer,4,2),substr(dt.nomer,1,2))) skl,';
tx:=tx+' decode(nvl(tn.uzak_uzak_id,0),0,'' '',(select zak from feb_zakaz where nn=tn.uzak_uzak_id)) zakaz,';

tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,''0$$$$$'',(select fi.kpp||''$''||fi.firm_id||''$''||fi.ident||''$''||fi.name||''$''||fi.kod_ni||''$'' from tronix_firm fi where firm_id=tn.post_post_id_from)) kodpr,'; 

tx:=tx+' s.kod kodm,ed.namek edi,tm.cena_uchet cena,tm.nds sunds,';
tx:=tx+' to_number(to_char(decode(ed.namek,ed1.namek,round(tm.kol_uchet,6),';
tx:=tx+' round(tronix_kof_koded(s.sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id)*tm.kol_uchet,6)),''9999999.9999''),''9999999.9999'') kolp,';
tx:=tx+' nvl(tm.stoimost,nvl(tm.cena*tm.kol,tm.cena_uchet*tm.kol_uchet+nvl(tm.nds,0))) sup,';
tx:=tx+' nvl(tm.stoimost,nvl(tm.cena*tm.kol,tm.cena_uchet*tm.kol_uchet+nvl(tm.nds,0))) sud,';
tx:=tx+' to_char(tn.date_ins,''DD.MM.YYYY'') dvi,to_char(tn.date_dok,''DD.MM.YYYY'') dai,';

tx:=tx+' decode(nvl(tm.nacl_nacl_id,0),''0'','''',(select to_char( na.dat_nacl, ''DD.MM.YYYY'' ) from tronix.nacl na where na.nacl_id=tm.nacl_nacl_id)) dnakl,';

tx:=tx+' decode(nvl(tm.nacl_nacl_id,0),''0'','' '',(select decode(na.nomer,''á/í'','' '',decode(na.nomer,''<á/í>'','' '',na.nomer)) from tronix.nacl na where na.nacl_id=tm.nacl_nacl_id)) nomnakl,';

tx:=tx+' decode(nvl(tm.calc_fact_calc_fact_id,0),0,'' '',(select to_char(f.date_cre,''DD.MM.YYYY'') from tronix.calc_fact f where f.calc_fact_id=tm.calc_fact_calc_fact_id)) dschf,';

tx:=tx+' decode(nvl(tm.calc_fact_calc_fact_id,0),0,'' '',(select decode(f.num_calc,''á/í'','' '',decode(f.num_calc,''<á/í>'','' '',f.num_calc)) from tronix_calc_fact f where f.calc_fact_id=tm.calc_fact_calc_fact_id)) nomschf,';

tx:=tx+' replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') naim,ed1.namek edo';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.type_ttn ty,tronix.sprav s,tronix.koded ed,kadry_dep dt,tronix.koded ed1';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (1)';
//      and tn.nomer in ('6177')
tx:=tx+' and ty.type_ttn_id=tn.type_ttn_type_ttn_id and tm.sprav_sprav_id=s.sprav_id(+)';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and s.koded_koded_id=ed1.koded_id(+)';
tx:=tx+' and tn.dep_dep_id_to=dt.dep_id(+)';

//tx:=tx+' and substr(to_char( tn.date_ins, 'YYYYMMDD'),1,4 )=''2021'' and SUBSTR(to_char( tn.date_ins, 'DD.MM.YYYY' ),4,2)=''04''and SUBSTR(to_char( tn.date_ins, ''DD.MM.YYYY'' ),1,2)>(''14'')';

tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN;
tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;

tx:=tx+' ) ll';
tx:=tx+' order by ll.dvi,ll.nomp';


//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('kodm').DisplayLAbel:='ÊÎÄ ';
        FieldByName('npo').DisplayLAbel:='ÂÍ.ÈÄÅÍÒ.Ï/Î ';
        FieldByName('nomp').DisplayLAbel:='ÒÊ/ÒÍ ';
        FieldByName('dvi').DisplayLAbel:='ÄÀÒÀ ÇÀÊÐ. ';
        FieldByName('edi').DisplayLAbel:='ÅÄ.ÈÇÌ.ÎÑÍ. ';
        FieldByName('kol').DisplayLAbel:='ÊÎË-ÂÎ ';
        FieldByName('cena').DisplayLAbel:='ÖÅÍÀ ';
        FieldByName('sup').DisplayLAbel:='ÑÓÌÌÀ ';
        FieldByName('sumnds').DisplayLAbel:='ÑÓÌÌÀ ÍÄÑ ';
        FieldByName('zakaz').DisplayLAbel:='ÇÀÊÀÇ ';
        FieldByName('dnakl').DisplayLAbel:='ÄÀÒÀ ÍÀÊË. ';
        FieldByName('nomnakl').DisplayLAbel:='ÍÎÌÅÐ ÍÀÊË. ';
        FieldByName('dschf').DisplayLAbel:='ÄÀÒÀ Ñ×/Ô ';
        FieldByName('nomschf').DisplayLAbel:='ÍÎÌÅÐ Ñ×/Ô ';
        FieldByName('kodpr').DisplayLAbel:='ÊÎÄ ÏÐÅÄÏÐ. ';
        FieldByName('inn').DisplayLAbel:='ÈÍÍ ';
        FieldByName('kpp').DisplayLAbel:='ÊÏÏ ';
        FieldByName('naimpost').DisplayLAbel:='ÏÎÑÒÀÂÙÈÊ ';
        FieldByName('naim').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ';
        FieldByName('npoo').DisplayLAbel:='ÂÍ.ÈÄÅÍÒ.Ï/Î ÍÎÂÛÉ ';
        FieldByName('dok').DisplayLAbel:='ÎÁÎÑÍÎÂÀÍÈÅ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_PRIHOD_ORDER_CFEK.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_PRIHOD_ORDER_CFEK.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'Ëèñò1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.Open;
OraQuery1.First;

nk:=1;

While not OraQuery1.eof do
Begin

Inc(nk);

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('kodm').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('npo').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('nomp').asString;
Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('dvi').asString;
Sheet.Cells[nk,5].Value:=OraQuery1.FieldByName('edi').asString;
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('kol').asString;
Sheet.Cells[nk,7].Value:=OraQuery1.FieldByName('cena').asString;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('sup').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('sumnds').asString;
Sheet.Cells[nk,10].Value:=OraQuery1.FieldByName('zakaz').asString;
Sheet.Cells[nk,11].Value:=OraQuery1.FieldByName('dnakl').asString;
Sheet.Cells[nk,12].Value:=OraQuery1.FieldByName('nomnakl').asString;
Sheet.Cells[nk,13].Value:=OraQuery1.FieldByName('dschf').asString;
Sheet.Cells[nk,14].Value:=OraQuery1.FieldByName('nomschf').asString;
Sheet.Cells[nk,15].Value:=OraQuery1.FieldByName('kodpr').asString;
Sheet.Cells[nk,16].Value:=OraQuery1.FieldByName('inn').asString;
Sheet.Cells[nk,17].Value:=OraQuery1.FieldByName('kpp').asString;
Sheet.Cells[nk,18].Value:=OraQuery1.FieldByName('naimpost').asString;
Sheet.Cells[nk,19].Value:=OraQuery1.FieldByName('naim').asString;
Sheet.Cells[nk,20].Value:=OraQuery1.FieldByName('npoo').asString;
Sheet.Cells[nk,21].Value:=OraQuery1.FieldByName('dok').asString;

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,21]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;

end;

procedure TFPrihod_Order_Cfek.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFPrihod_Order_Cfek.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

end.
