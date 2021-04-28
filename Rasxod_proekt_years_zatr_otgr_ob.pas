unit Rasxod_proekt_years_zatr_otgr_ob;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

 type
  TFRasxod_proekt_years_zatr_otgr_ob = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1prizn: TStringField;
    OraQuery1godins: TStringField;
    OraQuery1kodotgr: TStringField;
    OraQuery1kolotgr: TFloatField;
    OraQuery1edotgrosn: TStringField;
    OraQuery1kodzatr: TStringField;
    OraQuery1kolzatr: TFloatField;
    OraQuery1edzatrosn: TStringField;
    OraQuery1nameotgr: TStringField;
    OraQuery1namezatr: TStringField;
    OraQuery1prix: TStringField;
    OraQuery1prixo: TStringField;
    OraQuery1ttyp: TFloatField;
    OraQuery1proe: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_proekt_years_zatr_otgr_ob: TFRasxod_proekt_years_zatr_otgr_ob;
implementation

uses Unit9;

{$R *.dfm}

procedure TFRasxod_proekt_years_zatr_otgr_ob.FormShow(Sender: TObject);
var FExcel,Sheet: OleVariant;
tx:string;
nk: integer;
iii: integer;

kolotgrz,kolzatrz: single;
priznz,godinsz,kodotgrz,edotgroz,kodzatrz,edzatroz,nameoz,namezz,ttypz,prixz,prixoz,proez,na: string;

begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Edit2.Text);
//ShowMessage(Edit3.Text);

tx:=' ';

tx:=tx+' select tl.prizn  as prizn, tl.godins  as godins,tl.kodotgr as kodotgr,';
tx:=tx+' decode(tl.edotgrosn,''ÿ“'',to_number(round(tl.kolotgr,0),''9999999''),decode(tl.edotgrosn,'' -“'',to_number(round(tl.kolotgr,0),''9999999''),to_number(round(tl.kolotgr,4),''9999999.9999''))) as kolotgr,';
tx:=tx+' tl.edotgrosn as edotgrosn,tl.kodzatr as kodzatr,';
tx:=tx+' decode(tl.edzatrosn,''ÿ“'',to_number(round(tl.kolzatr,0),''9999999''),decode(tl.edzatrosn,'' -“'',to_number(round(tl.kolzatr,0),''9999999''),to_number(round(tl.kolzatr,4),''9999999.9999''))) as kolzatr,';
tx:=tx+' tl.edzatrosn as edzatrosn,tl.nameotgr as nameotgr,tl.namezatr as namezatr,';
tx:=tx+' decode(tl.ttyp,1,trim(to_char(tl.prix,''9999999999'')),'' '') as prix,';
tx:=tx+' decode(tl.ttyp,1,'' '',(select ttn.nomer||'' ÓÚ ''||to_char( ttn.date_ins, ''DD.MM.YYYY'' )|| '' ''||ttp.name';
tx:=tx+' from tronix.ttn ttn, tronix.type_ttn ttp where ttn.ttn_id=tl.prix and ttn.type_ttn_type_ttn_id=ttp.type_ttn_id and ttp.type_ttn_id=tl.ttyp)) as prixo,';
tx:=tx+' tl.ttyp as ttyp,'''+edit2.text+''' as proe';

tx:=tx+' from(';

tx:=tx+' select tt.prizn prizn,tt.godins godins,tt.kodotgr kodotgr,';
tx:=tx+' sum(tt.kolotgr) kolotgr,tt.edotgrosn edotgrosn,tt.kodzatr kodzatr,sum(tt.kolzatr) kolzatr,tt.edzatrosn as edzatrosn,';
tx:=tx+' max(tt.nameotgr) nameotgr,max(tt.namezatr) namezatr,tt.prix prix,tt.ttyp ttyp';

tx:=tx+' from(';

tx:=tx+' select ''0'' prizn, tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,';
tx:=tx+' to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok, substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,';
tx:=tx+' s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' ed.namek edotgr,edo1.namek edotgrosn,s.kod kodzatr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolzatr,';
tx:=tx+' edo1.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr,';
tx:=tx+' decode(tronix.select_mat(s.tree_tree_id,''01''),1,1,2) tipn,';
tx:=tx+' tp.ttn_id prix,tp.type_ttn_type_ttn_id ttyp';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.ttn tp,tronix.ttn_mat t,';
tx:=tx+' tronix.sprav s,tronix.koded ed,tronix.koded edo1,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+) and tm.koded_koded_id_uchet=ed.koded_id(+)';
tx:=tx+' and tronix.select_mat(s.tree_tree_id,''02'')=1 and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and s.koded_koded_id=edo1.koded_id(+) and nvl(s.can_do_self,0)=0 and tm.sprav_sprav_id_zam_snab is null';

tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and t.ttn_mat_id=tm.ttn_mat_ttn_mat_id and t.ttn_ttn_id=tp.ttn_id';
 
tx:=tx+' union all';

tx:=tx+' select ''1'' prizn,tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,';
tx:=tx+' to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok, substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' ed.namek edotgr,edo1.namek edotgrosn,s1.kod kodzatr,';
 
tx:=tx+' round(nvl(tm.kol_uchet*(nvl(tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet)),0)/nvl(tm.KOF_ZAM_SNAB,1))*';
tx:=tx+'nvl(tronix_kof_koded(s1.sprav_id,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet),s1.koded_koded_id),0),0),6) kolzatr,';

tx:=tx+' edo.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s1.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr,';
tx:=tx+' decode(tronix.select_mat(s1.tree_tree_id,''01''),1,1,2) tipn,';
tx:=tx+' tp.ttn_id prix,tp.type_ttn_type_ttn_id ttyp';

tx:=tx+' from  tronix.ttn_mat tm,tronix.ttn tn,tronix.ttn tp,tronix.ttn_mat t,';
tx:=tx+' tronix.sprav s,tronix.sprav s1,tronix.koded ed,tronix.koded edo,';
tx:=tx+' tronix.koded ed1,tronix.koded edo1,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.SPRAV_SPRAV_ID=s.sprav_id(+) and nvl(s.can_do_self,0)=0 and tm.SPRAV_SPRAV_ID_ZAM_SNAB=s1.sprav_id(+)';
tx:=tx+' and nvl(s1.can_do_self,0)=0 and tm.sprav_sprav_id_zam_snab is not null and tronix.select_mat(s1.tree_tree_id,''02'')=1';
tx:=tx+' and nvl(tm.kol_uchet,0)<>0 and tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';

tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and tm.koded_koded_id_zam_snab=ed1.koded_id(+)';
tx:=tx+' and s1.koded_koded_id=edo.koded_id(+) and edo1.koded_id=s.koded_koded_id';
tx:=tx+' and t.ttn_mat_id=tm.ttn_mat_ttn_mat_id and t.ttn_ttn_id=tp.ttn_id';
 
tx:=tx+' ) tt';

tx:=tx+' group by tt.godins,tt.kodzatr,tt.edzatrosn,tt.prizn,tt.kodotgr,tt.edotgr,tt.edotgrosn,tt.ttyp,tt.prix';

tx:=tx+' ) tl';
// ShowMessage(tx);

 {*
  With OraQuery1 Do
     begin
        FieldByName('prizn').DisplayLAbel:='œ–»«Õ¿ ';
        FieldByName('godins').DisplayLAbel:='√Œƒ';
        FieldByName('kodotgr').DisplayLAbel:=' Œƒ Œ“√–”∆.';
        FieldByName('kolotgr').DisplayLAbel:=' ŒÀ-¬Œ Œ“√–”∆.';
        FieldByName('edotgrosn').DisplayLAbel:='≈ƒ.»«Ã.Œ“√–.Œ—Õ.';
        FieldByName('kodzatr').DisplayLAbel:=' Œƒ «¿“–.';
        FieldByName('kolzatr').DisplayLAbel:=' ŒÀ-¬Œ «¿“–.';
        FieldByName('edzatrosn').DisplayLAbel:='≈ƒ.»«Ã.«¿“–.Œ—Õ.';
        FieldByName('nameotgr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ Œ“√–”∆.';
        FieldByName('namezatr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ «¿“–.';
        FieldByName('prix').DisplayLAbel:='Œ¡Œ—ÕŒ¬¿Õ»≈ œ–»’ŒƒÕ» »';
        FieldByName('prixo').DisplayLAbel:='Œ¡Œ—ÕŒ¬¿Õ»≈ ƒ–”√»≈ ƒŒ ”Ã≈Õ“€';
        FieldByName('ttyp').DisplayLAbel:='“»œ ƒŒ ”Ã≈Õ“Œ¬ Œ¡Œ—ÕŒ¬¿Õ»ﬂ';
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “';
     end;
*}
   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

nk:=1;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_RASXOD_OBORUD_CFEK.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_RASXOD_OBORUD_CFEK.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'ÀËÒÚ1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

priznz:='';
godinsz:='';
kodotgrz:='';
edotgroz:='';
kodzatrz:='';
edzatroz:='';
nameoz:='';
namezz:='';
ttypz:='';
prixz:='';
prixoz:='';
proez:='';
kolotgrz:=0.0;
kolzatrz:= 0.0;
na:='';
iii:=0;
OraQuery1.First;

priznz:=OraQuery1.FieldByName('prizn').asString;
godinsz:=OraQuery1.FieldByName('godins').asString;
kodotgrz:=OraQuery1.FieldByName('kodotgr').asString;
kolotgrz:= OraQuery1.FieldByName('kolotgr').asFloat;
edotgroz:=OraQuery1.FieldByName('edotgrosn').asString;
kodzatrz:=OraQuery1.FieldByName('kodzatr').asString;
kolzatrz:= OraQuery1.FieldByName('kolzatr').asFloat;
edzatroz:=OraQuery1.FieldByName('edzatrosn').asString;
nameoz:=OraQuery1.FieldByName('nameotgr').asString;
namezz:=OraQuery1.FieldByName('namezatr').asString;
prixz:=trim(OraQuery1.FieldByName('prix').asString);
prixoz:=trim(OraQuery1.FieldByName('prixo').asString);
ttypz:=OraQuery1.FieldByName('ttyp').asString;
proez:=OraQuery1.FieldByName('proe').asString;

na:=godinsz+'$'+trim(kodzatrz)+'$'+trim(edzatroz)+'$'+priznz+'$'+trim(kodotgrz)+'$'+trim(edotgroz)+'$'+ttypz;
iii:=iii+1;
OraQuery1.Next;

While not OraQuery1.eof do
Begin
iii:=iii+1;
if trim(na)=OraQuery1.FieldByName('godins').asString+'$'+trim(OraQuery1.FieldByName('kodzatr').asString)+'$'+trim(OraQuery1.FieldByName('edzatrosn').asString)+'$'+OraQuery1.FieldByName('prizn').asString+'$'+trim(OraQuery1.FieldByName('kodotgr').asString)+'$'+trim(OraQuery1.FieldByName('edotgrosn').asString)+'$'+OraQuery1.FieldByName('ttyp').asString then
begin

if OraQuery1.FieldByName('ttyp').asString='1' then
prixz:=trim(prixz)+';'+trim(OraQuery1.FieldByName('prix').asString)
else
prixoz:=trim(prixoz)+';'+trim(OraQuery1.FieldByName('prixo').asString);


kolotgrz:=kolotgrz+OraQuery1.FieldByName('kolotgr').asFloat;
kolzatrz:=kolzatrz+OraQuery1.FieldByName('kolzatr').asFloat;

end;   //if trim(na)=OraQuery1.FieldByName('godins').asString+'$'+.....

if trim(na)<>OraQuery1.FieldByName('godins').asString+'$'+trim(OraQuery1.FieldByName('kodzatr').asString)+'$'+trim(OraQuery1.FieldByName('edzatrosn').asString)+'$'+OraQuery1.FieldByName('prizn').asString+'$'+trim(OraQuery1.FieldByName('kodotgr').asString)+'$'+trim(OraQuery1.FieldByName('edotgrosn').asString)+'$'+OraQuery1.FieldByName('ttyp').asString then
begin

Inc(nk);

Sheet.Cells[nk,1].Value:=priznz;
Sheet.Cells[nk,2].Value:=godinsz;
Sheet.Cells[nk,3].Value:=kodotgrz;
Sheet.Cells[nk,4].Value:=kolotgrz;
Sheet.Cells[nk,5].Value:=edotgroz;
Sheet.Cells[nk,6].Value:=kodzatrz;
Sheet.Cells[nk,7].Value:=kolzatrz;
Sheet.Cells[nk,8].Value:=edzatroz;
Sheet.Cells[nk,9].Value:=nameoz;
Sheet.Cells[nk,10].Value:=namezz;
Sheet.Cells[nk,11].Value:=prixz;
Sheet.Cells[nk,12].Value:=prixoz;
Sheet.Cells[nk,13].Value:=ttypz;
Sheet.Cells[nk,14].Value:=proez;

priznz:=OraQuery1.FieldByName('prizn').asString;
godinsz:=OraQuery1.FieldByName('godins').asString;
kodotgrz:=OraQuery1.FieldByName('kodotgr').asString;
kolotgrz:= OraQuery1.FieldByName('kolotgr').asFloat;
edotgroz:=OraQuery1.FieldByName('edotgrosn').asString;
kodzatrz:=OraQuery1.FieldByName('kodzatr').asString;
kolzatrz:= OraQuery1.FieldByName('kolzatr').asFloat;
edzatroz:=OraQuery1.FieldByName('edzatrosn').asString;
nameoz:=OraQuery1.FieldByName('nameotgr').asString;
namezz:=OraQuery1.FieldByName('namezatr').asString;
ttypz:=OraQuery1.FieldByName('ttyp').asString;
proez:=OraQuery1.FieldByName('proe').asString;

prixz:='';
prixoz:='';

if ttypz='1' then
prixz:=trim(OraQuery1.FieldByName('prix').asString)
else
prixoz:=trim(OraQuery1.FieldByName('prixo').asString);

na:=godinsz+'$'+trim(kodzatrz)+'$'+trim(edzatroz)+'$'+priznz+'$'+trim(kodotgrz)+'$'+trim(edotgroz)+'$'+ttypz;

end;   // if trim(na)<>OraQuery1.FieldByName('godins').asString+'$'+...

//if iii=2000 then
//begin
//ShowMessage('iii exit');
//FExcel.Visible:=True;
//exit;
//end;
OraQuery1.Next;
end;    //While not OraQuery1.eof do
//ShowMessage('nk exit');

Inc(nk);

Sheet.Cells[nk,1].Value:=priznz;
Sheet.Cells[nk,2].Value:=godinsz;
Sheet.Cells[nk,3].Value:=kodotgrz;
Sheet.Cells[nk,4].Value:=kolotgrz;
Sheet.Cells[nk,5].Value:=edotgroz;
Sheet.Cells[nk,6].Value:=kodzatrz;
Sheet.Cells[nk,7].Value:=kolzatrz;
Sheet.Cells[nk,8].Value:=edzatroz;
Sheet.Cells[nk,9].Value:=nameoz;
Sheet.Cells[nk,10].Value:=namezz;
Sheet.Cells[nk,11].Value:=prixz;
Sheet.Cells[nk,12].Value:=prixoz;
Sheet.Cells[nk,13].Value:=ttypz;
Sheet.Cells[nk,14].Value:=proez;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,14]].RowHeight:=16;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].borders.linestyle:=xlContinuous;
FExcel.Visible:=True;
FRasxod_proekt_years_zatr_otgr_ob.Close;
end;    // procedure TFRasxod_proekt_years_zatr_otgr_ob.FormShow(Sender: TObject);

procedure TFRasxod_proekt_years_zatr_otgr_ob.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.
