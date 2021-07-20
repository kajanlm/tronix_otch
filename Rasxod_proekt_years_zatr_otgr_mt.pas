unit Rasxod_proekt_years_zatr_otgr_mt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFRasxod_proekt_years_zatr_otgr_mt = class(TForm)
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
    OraQuery1proe: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FRasxod_proekt_years_zatr_otgr_mt: TFRasxod_proekt_years_zatr_otgr_mt;
 dn: string;
 dk: string;
implementation

uses Unit9;

{$R *.dfm}

procedure TFRasxod_proekt_years_zatr_otgr_mt.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
//ShowMessage(Edit3.Text);

DateTimePicker1.DateTime:=StrToDate(Edit3.Text);
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TFRasxod_proekt_years_zatr_otgr_mt.Button2Click(Sender: TObject);
var FExcel,Sheet: OleVariant;
tx:string;
nk: integer;
begin

tx:=tx+' select tl.prizn  as prizn, tl.godins  as godins,tl.kodotgr as kodotgr,';
tx:=tx+' decode(tl.edotgrosn,''ÿ“'',to_number(round(tl.kolotgr,0),''9999999''),decode(tl.edotgrosn,'' -“'',to_number(round(tl.kolotgr,0),''9999999''),to_number(round(tl.kolotgr,4),''9999999.9999''))) as kolotgr,';
tx:=tx+' tl.edotgrosn as edotgrosn,tl.kodzatr as kodzatr,';
tx:=tx+' decode(tl.edzatrosn,''ÿ“'',to_number(round(tl.kolzatr,0),''9999999''),decode(tl.edzatrosn,'' -“'',to_number(round(tl.kolzatr,0),''9999999''),to_number(round(tl.kolzatr,4),''9999999.9999''))) as kolzatr,';
tx:=tx+' tl.edzatrosn as edzatrosn,tl.nameotgr as nameotgr,tl.namezatr as namezatr,'''+edit2.text+''' as proe';

tx:=tx+' from(';

tx:=tx+' select tt.prizn prizn,tt.godins godins,tt.kodotgr kodotgr,';
tx:=tx+' sum(tt.kolotgr) kolotgr,tt.edotgrosn edotgrosn,tt.kodzatr kodzatr,sum(tt.kolzatr) kolzatr,tt.edzatrosn as edzatrosn,';
tx:=tx+' max(tt.nameotgr) nameotgr,max(tt.namezatr) namezatr';

tx:=tx+' from(';

tx:=tx+' select pr.zavn zavn, pr.project proe,''0'' prizn, tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok,';
tx:=tx+' substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins,s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' edo1.namek edotgrosn,s.kod kodzatr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolzatr,';
tx:=tx+' edo1.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.sprav s,tronix.koded ed,tronix.koded edo1,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id  and tn.type_ttn_type_ttn_id in(5,12,9,44,59,11)';
tx:=tx+' and tm.sprav_sprav_id=s.sprav_id(+) and nvl(s.can_do_self,0)=0 and tronix.select_mat(s.tree_tree_id,''01'')=1';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is null and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and s.koded_koded_id=edo1.koded_id(+)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )>='+dn;
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )<='+dk;

tx:=tx+' union all';

tx:=tx+' select pr.zavn zavn, pr.project proe,''1'' prizn,tn.nomer tnnomer,tn.type_ttn_type_ttn_id tntyp,to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok, ';
tx:=tx+' substr(to_char( tn.date_ins, ''DD.MM.YYYY'' ),7,4) godins, s.kod kodotgr,';
tx:=tx+' round(decode(tm.koded_koded_id_uchet,s.koded_koded_id,tm.kol_uchet,(tm.kol_uchet*tronix_kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,s.koded_koded_id))),6) kolotgr,';
tx:=tx+' edo1.namek edotgrosn,s1.kod kodzatr,';
tx:=tx+' round(nvl(tm.kol_uchet*(nvl(tronix.kof_koded(tm.sprav_sprav_id,tm.koded_koded_id_uchet,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet)),0)/nvl(tm.kof_zam_snab,1))*';
tx:=tx+' nvl(tronix.kof_koded(s1.sprav_id,nvl(tm.koded_koded_id_zam_snab,tm.koded_koded_id_uchet),s1.koded_koded_id),0),0),6) kolzatr,';
tx:=tx+' edo.namek edzatrosn,replace(replace(tronix.sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') nameotgr,';
tx:=tx+' replace(replace(tronix.sp_name(s1.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') namezatr';

tx:=tx+' from tronix.ttn_mat tm,tronix.ttn tn,tronix.sprav s,tronix.sprav s1,';
tx:=tx+' tronix.koded ed,tronix.koded edo,tronix.koded ed1,tronix.koded edo1,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tm.sprav_sprav_id=s.sprav_id(+) and nvl(s.can_do_self,0)=0 and tronix.select_mat(s1.tree_tree_id,''01'')=1';
tx:=tx+' and tm.sprav_sprav_id_zam_snab=s1.sprav_id(+) and nvl(s1.can_do_self,0)=0';
tx:=tx+' and tm.sprav_sprav_id_zam_snab is not null  and nvl(tm.kol_uchet,0)<>0';
tx:=tx+' and tm.ttn_ttn_id=tn.ttn_id and tn.type_ttn_type_ttn_id in (5,12,9,44,59,11)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn and zk.id_project='+edit1.text;
tx:=tx+' and pr.project_id=zk.id_project';
tx:=tx+' and tn.user_date1 is not null and tn.date_ins is not null';
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )>='+dn;
tx:=tx+' and to_char(tn.date_ins, ''YYYYMMDD'' )<='+dk;
tx:=tx+' and tm.koded_koded_id_uchet=ed.koded_id(+) and tm.koded_koded_id_zam_snab=ed1.koded_id(+)';
tx:=tx+' and s1.koded_koded_id=edo.koded_id(+) and edo1.koded_id(+)=s.koded_koded_id';

tx:=tx+' ) tt';

tx:=tx+' group by tt.godins,tt.kodzatr,tt.edzatrosn,tt.prizn,tt.kodotgr,tt.edotgrosn';

tx:=tx+' ) tl';

//ShowMEssage(tx);
 
{*
 With OraQuery1 Do
     begin
        FieldByName('prizn').DisplayLAbel:='œ–»«Õ¿  ';
        FieldByName('godins').DisplayLAbel:='√Œƒ ';
        FieldByName('kodotgr').DisplayLAbel:=' Œƒ Œ“√–. ';
        FieldByName('kolotgr').DisplayLAbel:=' ŒÀ-¬Œ Œ“√–.  ';
        FieldByName('edotgrosn').DisplayLAbel:='≈ƒ.»«Ã.Œ“√–.Œ—Õ. ';
        FieldByName('kodzatr').DisplayLAbel:=' Œƒ «¿“–. ';
        FieldByName('kolzatr').DisplayLAbel:=' ŒÀ-¬Œ «¿“–. ';
        FieldByName('edzatrosn').DisplayLAbel:='≈ƒ.»«Ã.«¿“–.Œ—Õ. ';
        FieldByName('nameotgr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ Œ“√–. ';
        FieldByName('namezatr').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ «¿“–. ';
        FieldByName('PROE').DisplayLAbel:='œ–Œ≈ “ ';
     end;
*}

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 nk:=1;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_RASXOD_MATER_CFEK.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_RASXOD_MATER_CFEK.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'ÀËÒÚ1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.First;

While not OraQuery1.eof do
Begin

Inc(nk);

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('prizn').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('godins').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('kodotgr').asString;
Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('kolotgr').asFloat;
Sheet.Cells[nk,5].Value:=OraQuery1.FieldByName('edotgrosn').asString;
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('kodzatr').asString;
Sheet.Cells[nk,7].Value:=OraQuery1.FieldByName('kolzatr').asFloat;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('edzatrosn').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('nameotgr').asString;
Sheet.Cells[nk,10].Value:=OraQuery1.FieldByName('namezatr').asString;
Sheet.Cells[nk,11].Value:=OraQuery1.FieldByName('proe').asString;


OraQuery1.Next;
end;    //While not OraQuery1.eof do

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,14]].RowHeight:=16;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[4,1], Sheet.Cells[nk,7]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].borders.linestyle:=xlContinuous;
FExcel.Visible:=True;
FRasxod_proekt_years_zatr_otgr_mt.Close;

end;    // procedure TFRasxod_proekt_years_zatr_otgr_mt.FormShow(Sender: TObject);

procedure TFRasxod_proekt_years_zatr_otgr_mt.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFRasxod_proekt_years_zatr_otgr_mt.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;


procedure TFRasxod_proekt_years_zatr_otgr_mt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.
