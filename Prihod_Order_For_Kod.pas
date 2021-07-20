unit Prihod_Order_For_Kod;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFPrihod_Order_For_Kod = class(TForm)
    EditKod: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1kodm: TStringField;
    OraQuery1npo: TFloatField;
    OraQuery1nomp: TStringField;
    OraQuery1dvi: TStringField;
    OraQuery1edi: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1cena: TFloatField;
    OraQuery1sup: TFloatField;
    OraQuery1sumnds: TFloatField;
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
    OraQuery1dok: TStringField;
    OraQuery1dvii: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure EditKodChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FPrihod_Order_For_Kod: TFPrihod_Order_For_Kod;
 implementation


{$R *.dfm}

procedure TFPrihod_Order_For_Kod.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
 
end;

procedure TFPrihod_Order_For_Kod.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFPrihod_Order_For_Kod.Button2Click(Sender: TObject);
var
FExcel,Sheet: OleVariant;
//,Range: OleVariant;
tx:string;
nk: integer;
begin
// ShowMessage(EditKod.Text);
tx:=' ';
tx:='select ll.kodm as kodm,ll.nomp as nomp,ll.dvi as dvi,ll.edi as edi,';
//      decode(ll.edi,ll.edo,ll.edi,ll.edo) || '$'||
tx:=tx+' decode(ll.edi,''ÿ“'',round(ll.kolp,0),decode(ll.edi,'' -“'',round(ll.kolp,0),round(ll.kolp,6))) as kol,';
tx:=tx+' ll.cena as cena, ll.sup as sup, decode(nvl(ll.sumnds,0),0,0.0,ll.sumnds) as sumnds,';

tx:=tx+' ll.zakaz as zakaz,nvl(ll.dnakl,'''') as dnakl,decode(ll.nomnakl,null,'''',ll.nomnakl) as nomnakl,';

tx:=tx+' ll.kodpr as kodpr, ll.inn as inn,ll.kpp as kpp,ll.post as naimpost,';

tx:=tx+' nvl(ll.dschf,'''') as dschf, decode(ll.nomschf,null,'''',ll.nomschf) as nomschf,';

tx:=tx+' replace(ll.xar1,chr(13), '' '') as naim,ll.edo as edo,ll.dvii as dvii,ll.npo as npo,';
tx:=tx+' ''œ/Œ π ''||ll.nomp||'' ÓÚ ''||ll.dvi||decode(ll.nomnakl,'''','' '','';“Õ π ''||ll.nomnakl||decode(ll.dnakl,'''','' '','' ÓÚ ''||ll.dnakl))||decode(ll.nomschf,'''','' '','';—◊/‘ π ''||ll.nomschf||decode(ll.dschf,'''','' '','' ÓÚ ''||ll.dschf)) as dok';
tx:=tx+' from(';

tx:=tx+' select tn.ttn_id npo,tn.nomer nomp, decode(nvl(tn.uzak_uzak_id,0),0,'' '',(select zak from feb_zakaz where nn=tn.uzak_uzak_id)) zakaz,';

tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,'' '',(select fi.kpp from tronix_firm fi where firm_id=tn.post_post_id_from)) kpp,';
tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,'' '',(select fi.firm_id from tronix_firm fi where firm_id=tn.post_post_id_from)) kodpr,';
tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,'' '',(select fi.ident from tronix_firm fi where firm_id=tn.post_post_id_from)) ident,';
tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,'' '',(select fi.name from tronix_firm fi where firm_id=tn.post_post_id_from)) post,';
tx:=tx+' decode(nvl(tn.post_post_id_from,0),0,'' '',(select fi.kod_ni from tronix_firm fi where firm_id=tn.post_post_id_from)) inn,';

tx:=tx+' s.kod kodm,ed.namek edi,tm.cena_uchet cena,tm.nds sumnds,';
tx:=tx+' to_number(to_char(decode(ed.namek,ed1.namek,round(tm.kol_uchet,6),';
tx:=tx+' round(tronix.kof_koded(s.sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id)*tm.kol_uchet,6)),''9999999.9999''),''9999999.9999'') kolp,';
tx:=tx+' nvl(tm.stoimost,nvl(tm.cena*tm.kol,tm.cena_uchet*tm.kol_uchet+nvl(tm.nds,0))) sup,';
tx:=tx+' nvl(tm.stoimost,nvl(tm.cena*tm.kol,tm.cena_uchet*tm.kol_uchet+nvl(tm.nds,0))) sud,';
tx:=tx+' to_char(tn.date_ins,''dd.mm.yyyy'') dvi,to_char(tn.date_ins,''yyyymmdd'') dvii, to_char(tn.date_dok,''dd.mm.yyyy'') dai,';

tx:=tx+' decode(nvl(tm.nacl_nacl_id,0),0,'''',(select to_char( na.dat_nacl, ''DD.MM.YYYY'' ) from tronix.nacl na where na.nacl_id=tm.nacl_nacl_id)) dnakl,';
tx:=tx+' decode(nvl(tm.nacl_nacl_id,0),0,'''',(select na.nomer from tronix.nacl na where na.nacl_id=tm.nacl_nacl_id)) nomnakl,';

tx:=tx+' decode(nvl(tm.calc_fact_calc_fact_id,0),0,'''',(select to_char(f.date_cre,''DD.MM.YYYY'') from tronix.calc_fact f where f.calc_fact_id=tm.calc_fact_calc_fact_id)) dschf,';
tx:=tx+' decode(nvl(tm.calc_fact_calc_fact_id,0),0,'''',(select f.num_calc from tronix.calc_fact f where f.calc_fact_id=tm.calc_fact_calc_fact_id)) nomschf,';
tx:=tx+' tronix.sp_name(s.sprav_id) xar1,ed1.namek edo';

tx:=tx+' from tronix.ttn_mat tm,tronix.ttn tn,tronix.sprav s,tronix.koded ed,tronix.koded ed1';
//00001110408,00010702003,00291658276
tx:=tx+' where tm.sprav_sprav_id=s.sprav_id(+) and s.kod='''+editKod.text+'''';
tx:=tx+' and tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (1)';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and s.koded_koded_id=ed1.koded_id(+)';
tx:=tx+' ) ll';

tx:=tx+' order by ll.kodm,ll.dvii desc,ll.nomp desc'
;

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('kodm').DisplayLAbel:=' Œƒ ';
        FieldByName('nomp').DisplayLAbel:='“ /“Õ ';
        FieldByName('dvi').DisplayLAbel:='ƒ¿“¿ «¿ –. ';
        FieldByName('edi').DisplayLAbel:='≈ƒ.»«Ã.Œ—Õ. ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ-¬Œ ';
        FieldByName('cena').DisplayLAbel:='÷≈Õ¿ ';
        FieldByName('sup').DisplayLAbel:='—”ÃÃ¿ ';
        FieldByName('sumnds').DisplayLAbel:='—”ÃÃ¿ Õƒ— ';
        FieldByName('zakaz').DisplayLAbel:='«¿ ¿« ';
        FieldByName('dnakl').DisplayLAbel:='ƒ¿“¿ Õ¿ À. ';
        FieldByName('nomnakl').DisplayLAbel:='ÕŒÃ≈– Õ¿ À. ';
        FieldByName('dschf').DisplayLAbel:='ƒ¿“¿ —◊/‘ ';
        FieldByName('nomschf').DisplayLAbel:='ÕŒÃ≈– —◊/‘ ';
        FieldByName('kodpr').DisplayLAbel:=' Œƒ œ–≈ƒœ–. ';
        FieldByName('inn').DisplayLAbel:='»ÕÕ ';
        FieldByName('kpp').DisplayLAbel:=' œœ ';
        FieldByName('naimpost').DisplayLAbel:='œŒ—“¿¬Ÿ»  ';
        FieldByName('naim').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ';
        FieldByName('npo').DisplayLAbel:='¬Õ.»ƒ≈Õ“.œ/Œ';
        FieldByName('dok').DisplayLAbel:='Œ¡Œ—ÕŒ¬¿Õ»≈ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_PRIHOD_ORDER_KOD.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_PRIHOD_ORDER_KOD.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'ÀËÒÚ1';
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
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('kol').asFloat;
Sheet.Cells[nk,7].Value:=OraQuery1.FieldByName('cena').asFloat;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('sup').asFloat;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('sumnds').asFloat;
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
Sheet.Cells[nk,20].Value:=OraQuery1.FieldByName('npo').asString;
Sheet.Cells[nk,21].Value:=OraQuery1.FieldByName('dok').asString;

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,21]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,21]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;

end;

procedure TFPrihod_Order_For_Kod.EditKodChange(Sender: TObject);
begin
//ShowMessage(EditKod.Text);

end;

end.
