unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, Grids, DBGridEh, StdCtrls, GridsEh,
  ExcelXP, OleServer,ComObj, CheckLst;

type
  TForm9 = class(TForm)
    OraQuery1: TOraQuery;
    Label1: TLabel;
    DBGridEh1: TDBGridEh;
    OraDataSource1: TOraDataSource;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    DBGridEh2: TDBGridEh;
    Label2: TLabel;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    OraQuery3: TOraQuery;
    Button1: TButton;
    Edit2: TEdit;
    uzaks_memory: TComboBox;
    uzaks: TCheckListBox;
    Button2: TButton;
    allprs: TCheckBox;
    Deps: TComboBox;
    deps_label: TLabel;
    procedure DBGridEh2DblClick(Sender: TObject);
  	procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
  private
    { Private declarations }
    temp_priz:integer;
  public
    { Public declarations }
  procedure Show_Deficit_MainNomen;
  procedure Show_TTRTN_Details(date_filter_month : string; date_filter_year : string; main_nomen : boolean);
  procedure main_nomenclature_list(t : string; s : string);
  //procedure Show_MainNomenDetails;
	function excelFloat(s : string) : real;
  end;

var
  Form9: TForm9;

implementation

uses Unit10, Unit15, Unit16, Unit20, Unit21, Unit22, Unit23, Unit25, Unit26, clipbrd,
  Unit27, Unit35, Unit36, Unit37, Unit38, Unit43, Unit45, Unit46, Unit34, ftrnomen, r_ttns,
  Unit47, Unit49, Unit50, Unit53, Unit55, Unit57, Unit60, Unit61, Unit63, Unit64, Unit65, Unit66,  Unit67, 
  PUE_Udp_Report, Udp_Norma_Fakt_Ostatok, UDP_OTK, NEZAKR_TK_PTK_UDP_ZAKR, Udp_PDO_Report, Udp_Pue_Norma_Zero, Udp_Zakazchik,Naryd_Cex_Proekt,
  Unit32, Unit1, r_over_tmc,Equipment, r_set_mnomen,
  r_calendar;

{$R *.dfm}

procedure TForm9.main_nomenclature_list(t : string; s : string);
var
  SQL : string;
  FExcel, Sheet : OleVariant;
  startNum, strNum : integer;
const
  MMYYYY_MASK = 'mm.YYYY';
begin

  SQL :=
  'select zk.zak, dp.nomer, B.* from (select round((a.main_kol - (a.zapas - a.main_zapas)), 5) as left, round((a.main_kol_uchet - (a.zapas_uchet - a.main_zapas_uchet)), 5) '
  + 'as left_uchet, A.* from (select decode(main.need_kol, null, 0, 1) as flag, round(decode(main.need_kol, null, 0, (main.need_kol * '
  + 'tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr))), 5) as main_kol, round(decode(main.need_kol, null, 0, (main.need_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet))), 5) as '
  + 'main_kol_uchet, round(decode(main.need_kol, null, 0, (main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_potr))), 5) as main_zapas, '
  + 'round(decode(main.need_kol, null, 0, (main.zapas_kol * tronix_kof_koded(sp.sprav_id, main.koded_id, defa.koded_uchet))), 5) as main_zapas_uchet, '
  + 'defa.s_i as sprav_id, sp.kod, substr(upper(ltrim(tronix_sp_sp_name(defa.s_i, null, 3))), 1, 200) as MTR_NAME, round(defa.potr, 5) as potr, '
  + 'fkd.namek as ed_izm, defa.koded_potr as koded, round(defa.potr_uchet, 5) as potr_uchet, skd.namek as uch_ed_izm, defa.koded_uchet as koded_uchet, '
  + 'round(defa.zapas, 5) as zapas, round(defa.zapas_uchet, 5) as zapas_uchet, defa.d as deficit, defa.d_u as deficit_uchet, defa.uzak_id, defa.dep_id from '
  + '(select A.*, round((A.potr - A.zapas), 5) as d, round((A.potr_uchet - A.zapas_uchet), 5) as d_u from (select src.dep_id, src.uzak_id, src.POTR, '
  + '(src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) as potr_uchet, src.ZAPAS, (src.ZAPAS * tronix_kof_koded(src.sprav_id, '
  + 'src.koded_potr, src.koded_uchet)) as zapas_uchet, src.SPRAV_ID as s_i, src.koded_potr, src.koded_uchet from (select tt.dep_id, tt.uzak_id, '
  + 'tt.sprav_id as sprav_id, sum(tt.POTR) as potr, sum(tt.ZAPAS_TR) as zapas, tt.koded_potr as koded_potr, tt.koded_uchet as koded_uchet from '
  + '(select tx.sprav_sprav_id as sprav_id, nvl(tx.KOL, 0) as POTR, nvl(tx.ZAPAS_POST_TR, 0) as ZAPAS_TR, tx.KODED_KODED_ID as koded_potr, '
  + 'nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet, tx.dep_dep_id as dep_id, tx.uzak_uzak_id as uzak_id from tx_car_potr tx, tronix_sprav sp, '
  + '(select m.sprav_id, m.uzak_id, m.dep_id from tronix.main_nomenclature m where TO_CHAR(m.date_ins, ' + char(39) + MMYYYY_MASK + char(39) + ') = '
  + char(39) + t + '.' + s + char(39) + ') main where '
  + 'tx.sprav_sprav_id = sp.sprav_id(+) and main.sprav_id = tx.sprav_sprav_id(+) and main.uzak_id = tx.uzak_uzak_id(+) and main.dep_id = tx.dep_dep_id(+)) '
  + 'tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet, tt.dep_id, '
  + 'tt.uzak_id) src ) A ) defa, tronix_sprav sp, tronix.koded fkd, tronix.koded skd, (select TO_CHAR(m.date_ins, ' + char(39) + MMYYYY_MASK
  + char(39) + ') as date_i, m.* from tronix.main_nomenclature m) main where '
  + '(defa.d > 0 or defa.d_u > 0) and defa.koded_potr = fkd.koded_id(+) and defa.koded_uchet = skd.koded_id(+) and defa.s_i = sp.sprav_id(+) and '
  + 'defa.s_i = main.sprav_id(+) and defa.dep_id = main.dep_id(+) and defa.uzak_id = main.uzak_id(+) and ' + char(39) + t + '.' + s + char(39) + ' '
  + '= main.date_i(+) order by TO_NUMBER(sp.kod) desc) A where A.flag = 1) B, tronix.zakaz zk, kadry_dep dp '
  + 'where (B.left > 0 or B.left_uchet > 0) and B.uzak_id = zk.nn(+) and B.dep_id = dp.dep_id(+)';

  //Clipboard.asText := SQL;
  //exit;
  //showmessage(SQL);
  form1.execQuery(OraQuery3, SQL, false);
  if OraQuery3.RecordCount < 1 then
    exit
  else
    OraQuery3.First;
    
  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MAIN_NOMENCLATURE.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Список основной номенклатуры';
  Sheet := FExcel.Workbooks[1].WorkSheets['Список основной номенклатуры'];

  Sheet.Cells[1, 1].Value := 'Основная номенклатура на ' + t + '.' + s + #10#13 + 'Составлено: ' + DateToStr(now);

  startNum := 3;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 16]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 16]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 16]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 16]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 16]].WrapText := true;

  while not OraQuery3.Eof do
  begin
    Sheet.Cells[strNum, 1].NumberFormat := '@';
    Sheet.Cells[strNum, 1].Value := OraQuery3.FieldByName('ZAK').asString;

    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OraQuery3.FieldByName('NOMER').asString;

    Sheet.Cells[strNum, 3].NumberFormat := '@';
    Sheet.Cells[strNum, 3].Value := OraQuery3.FieldByName('KOD').asString;

    Sheet.Cells[strNum, 4].NumberFormat := '@';
    Sheet.Cells[strNum, 4].Value := OraQuery3.FieldByName('MTR_NAME').asString;

    Sheet.Cells[strNum, 5].Value := excelFloat(OraQuery3.FieldByName('POTR').asString);
    Sheet.Cells[strNum, 6].Value := OraQuery3.FieldByName('ed_izm').asString;
    Sheet.Cells[strNum, 7].Value := excelFloat(OraQuery3.FieldByName('POTR_UCHET').asString);
    Sheet.Cells[strNum, 8].Value := OraQuery3.FieldByName('uch_ed_izm').asString;

    Sheet.Cells[strNum, 9].Value := excelFloat(OraQuery3.FieldByName('ZAPAS').asString);
    Sheet.Cells[strNum, 10].Value := excelFloat(OraQuery3.FieldByName('ZAPAS_UCHET').asString);

    Sheet.Cells[strNum, 11].Value := excelFloat(OraQuery3.FieldByName('DEFICIT').asString);
    Sheet.Cells[strNum, 12].Value := excelFloat(OraQuery3.FieldByName('DEFICIT_UCHET').asString);

    Sheet.Cells[strNum, 13].Value := excelFloat(OraQuery3.FieldByName('MAIN_KOL').asString);
    Sheet.Cells[strNum, 14].Value := excelFloat(OraQuery3.FieldByName('MAIN_KOL_UCHET').asString);

    Sheet.Cells[strNum, 15].Value := excelFloat(OraQuery3.FieldByName('LEFT').asString);
    Sheet.Cells[strNum, 16].Value := excelFloat(OraQuery3.FieldByName('LEFT_UCHET').asString);
    
    inc(strNum);
    OraQuery3.Next;
  end;

  //mtr_name
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 4]].HorizontalAlignment := xlLeft;
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 4]].VerticalAlignment := xlTop;
  Sheet.Range[Sheet.Cells[startNum, 4], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 4]].Font.Size := 11;

  OraQuery3.Close;
  FExcel.Visible := true;

  FExcel := Unassigned;

end;

procedure TForm9.Show_Deficit_MainNomen;
var
SQL : string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  SQL := 'select s.kod, substr( upper(ltrim(tronix_sp_sp_name(m.sprav_id, null, 3))), 1, 200 ) as mtr_name, t.nomer, tm.kol, tm.kol_uchet, d.nomer as ceh, '
  + 'z.zak from (select def.sprav_id, main.ttn_id, main.ceh_id, main.uzak_id from (select defa.s_i as sprav_id from (select src.SPRAV_ID as s_i, '
  + '(src.POTR - src.ZAPAS) as d, ((src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) - '
  + '(src.ZAPAS * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet))) as d_u from (select tt.sprav_id as sprav_id, sum(tt.POTR) as potr, '
  + 'sum(tt.ZAPAS_TR) as zapas, tt.koded_potr as koded_potr, tt.koded_uchet as koded_uchet from (select (CASE WHEN (nvl(tx.ZAPAS_POST_TR, 0) = 0) THEN '
  + 'tx.sprav_sprav_id ELSE decode(tx.sprav_sprav_id_zam_snab, null, tx.sprav_sprav_id, tx.sprav_sprav_id_zam_snab) END) as sprav_id, nvl(tx.KOL, 0) as POTR, '
  + 'nvl(tx.ZAPAS_POST_TR, 0) as ZAPAS_TR, tx.KODED_KODED_ID as koded_potr, nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet from tx_car_potr tx, '
  + 'tronix_sprav sp where tx.sprav_sprav_id = sp.sprav_id(+)) tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet) src ) defa where '
  + '(defa.d > 0 or defa.d_u > 0)) def, (select kod_id, vyd_id, ttn_id, ceh_id, uzak_id from tronix.deficit_main_nomen group by kod_id, vyd_id, ttn_id, '
  + 'ceh_id, uzak_id) main where main.vyd_id = def.sprav_id) m, tronix.zakaz z, kadry_dep d, tronix_sprav s, tronix.ttn t, '
  + '(select decode(sprav_sprav_id_zam_snab, null, sprav_sprav_id, sprav_sprav_id_zam_snab) as sprav_id, ttn_ttn_id as ttn_id, kol, kol_uchet from '
  + 'tronix.ttn_mat) tm where t.date_ins is null and m.sprav_id = s.sprav_id(+) and m.ttn_id = t.ttn_id(+) and m.ceh_id = d.dep_id(+) and m.uzak_id = z.nn(+) and '
  + 'm.sprav_id = tm.sprav_id(+) and t.ttn_id = tm.ttn_id order by s.kod, z.zak, t.nomer';

  form1.execQuery(OraQuery3, SQL, false);
  if OraQuery3.RecordCount < 1 then
    exit
  else
    OraQuery3.First;
    
  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_DEFICIT_ON.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Дефицит основной номенклатуры';
  Sheet := FExcel.Workbooks[1].WorkSheets['Дефицит основной номенклатуры'];

  startNum := 2;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 7]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 7]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 7]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 7]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 7]].WrapText := true;

  while not OraQuery3.Eof do
  begin
    Sheet.Cells[strNum, 1].NumberFormat := '@';
    Sheet.Cells[strNum, 1].Value := OraQuery3.FieldByName('KOD').asString;

    Sheet.Cells[strNum, 2].Value := OraQuery3.FieldByName('MTR_NAME').asString;

    Sheet.Cells[strNum, 3].NumberFormat := '@';
    Sheet.Cells[strNum, 3].Value := OraQuery3.FieldByName('NOMER').asString;

    Sheet.Cells[strNum, 4].Value := excelFloat(OraQuery3.FieldByName('KOL').asString);

    Sheet.Cells[strNum, 5].Value := excelFloat(OraQuery3.FieldByName('KOL_UCHET').asString);

    Sheet.Cells[strNum, 6].NumberFormat := '@';
    Sheet.Cells[strNum, 6].Value := OraQuery3.FieldByName('CEH').asString;

    Sheet.Cells[strNum, 7].NumberFormat := '@';
    Sheet.Cells[strNum, 7].Value := OraQuery3.FieldByName('ZAK').asString;

    inc(strNum);
    OraQuery3.Next;
  end;

  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 2]].HorizontalAlignment := xlLeft;
  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 2]].VerticalAlignment := xlTop;
  Sheet.Range[Sheet.Cells[startNum, 2], Sheet.Cells[startNum + (OraQuery3.RecordCount - 1), 2]].Font.Size := 11;

  OraQuery3.Close;
  FExcel.Visible := true;

  FExcel := Unassigned;

end;

procedure TForm9.Show_TTRTN_Details(date_filter_month : string; date_filter_year : string; main_nomen : boolean);
const
DD_MASK = char(39) + 'DD' + char(39);
MM_MASK = char(39) +  'MM' + char(39);
DM_MASK = char(39) + 'mm.YYYY' + char(39);
TYPE_TTN_ARRAY = '5, 44';
var
SQL: string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  (*
  D_YEAR := '';
  D_YEAR := InputBox('ОТЧЕТ', 'Введите год; формат: 1999, 2005, 2015, 2020...', '');
  if ((D_YEAR = '') or (length(D_YEAR) > 4)) then
  begin
    showmessage('Неверный формат года!');
    exit;
  end;

  D_MONTH := '';
  D_MONTH := InputBox('ОТЧЕТ', 'Введите месяц; формат: 01, 3, 12, 08...', '');
  if ((D_MONTH = '') or (strtoint(D_MONTH) > 12) or (length(D_MONTH) > 2)) then
  begin
    showmessage('Неверный формат месяца!');
    exit;
  end;

  if length(D_MONTH) = 1 then
    D_MONTH := '0' + D_MONTH;
  *)

  // 'SELECT DECODE(a.COMPLETE, 0, 0, 
  SQL := 'SELECT DECODE(a.COMPLETE, 0, 100, (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END)) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, (afull.IN_USH - afull.in_month) as complete, afull.IN_MONTH, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / (afull.in_ush - afull.in_month)) * 100)), 0)) as USH_percent, afull.USH_BAD, afull.USH_GOOD from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(ttn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH, '
  + 'sum(decode(ttn.GOOD_DATE, null, 0, (CASE WHEN ttn.date_ins > ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_BAD, '
  + 'sum(decode(ttn.GOOD_DATE, null, decode(ttn.date_ins, null, 0, 1), (CASE WHEN ttn.date_ins <= ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_GOOD, '
  + 'sum (  CASE WHEN (ttn.date_ins is null) THEN CASE WHEN (ttn.user_date4 is null) THEN 0 ELSE (CASE WHEN (TO_NUMBER(TO_CHAR(ttn.user_date4, ' + DD_MASK + ')) > '
  + '(TO_NUMBER(to_char(last_day(ttn.user_date2),' + DD_MASK + ')) - 3)) THEN 1 ELSE 0 END) END ELSE 0 END) as IN_MONTH from '
  + '(SELECT (CASE WHEN (mod(to_char(ttn.user_date4, ' + char(39) + 'J' + char(39) + '), 7) + 1) in (3, 4, 5) THEN ttn.user_date4 + interval ' + char(39) + '5'
  + char(39) + ' day ELSE ttn.user_date4 + interval ' + char(39) + '3' + char(39) + ' day END ) as GOOD_DATE, ttn.* FROM TRONIX.TTN ttn) ttn WHERE '
  + '<MAIN_NOMEN> and ttn.type_ttn_type_ttn_id in (' + TYPE_TTN_ARRAY + ') and <DATE_INDEX> '
  + '(TO_CHAR(ttn.user_date4, ' + MM_MASK + ') = TO_CHAR((to_date(<MONTH_YEAR>, ' + DM_MASK + ') - interval ' + char(39) + '1' + char(39) + ' month), ' + MM_MASK + ') AND '
  + '(ttn.user_date4 > (last_day(to_date(<MONTH_YEAR>, ' + DM_MASK + ') - interval ' + char(39) + '1' + char(39) + ' month) - interval ' + char(39) + '3' + char(39) + ' day) ) AND '
  + '(ttn.date_ins is null or TO_CHAR(ttn.date_ins, ' + MM_MASK + ') = <MONTH_NUM>))) group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, '
  + 'tronix.zakaz z where afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';

  // 'SELECT DECODE(a.COMPLETE, 0, 100,
  if main_nomen then
  SQL := 'SELECT DECODE(a.COMPLETE, 0, 0, (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END)) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, (afull.IN_USH - afull.in_month) as complete, afull.IN_MONTH, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / (afull.in_ush - afull.in_month)) * 100)), 0)) as USH_percent, afull.USH_BAD, afull.USH_GOOD from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(ttn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH, '
  + 'sum(decode(ttn.GOOD_DATE, null, 0, (CASE WHEN ttn.date_ins > ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_BAD, '
  + 'sum(decode(ttn.GOOD_DATE, null, decode(ttn.date_ins, null, 0, 1), (CASE WHEN ttn.date_ins <= ttn.GOOD_DATE THEN 1 ELSE 0 END))) as USH_GOOD, '
  + 'sum (  CASE WHEN (ttn.date_ins is null) THEN CASE WHEN (ttn.user_date4 is null) THEN 0 ELSE (CASE WHEN (TO_NUMBER(TO_CHAR(ttn.user_date4, ' + DD_MASK + ')) > '
  + '(TO_NUMBER(to_char(last_day(ttn.user_date2),' + DD_MASK + ')) - 3)) THEN 1 ELSE 0 END) END ELSE 0 END) as IN_MONTH from '
  + '(SELECT (CASE WHEN (mod(to_char(ttn.user_date4, ' + char(39) + 'J' + char(39) + '), 7) + 1) in (3, 4, 5) THEN ttn.user_date4 + interval ' + char(39) + '5'
  + char(39) + ' day ELSE ttn.user_date4 + interval ' + char(39) + '3' + char(39) + ' day END ) as GOOD_DATE, ttn.* FROM TRONIX.TTN ttn) ttn WHERE '
  + '<MAIN_NOMEN> and ttn.type_ttn_type_ttn_id in (' + TYPE_TTN_ARRAY + ') '
  + 'group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, '
  + 'tronix.zakaz z where afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';

  //нужна дополнительная группировка в коде (есть дубликаты) ???? (ВОЗМОЖНО ИЗ-ЗА ПРИВЯЗОК К НЕ ЦЕХОВЫМ ПОДРАЗДЕЛЕНИЯМИ ОДНОГО РОДИТЕЛЯ)
  //прогнать user_date4 = null для user_date2 is null, для 5 и 44 типов где user_date4 is not null
  //просуммировать все значения с группировкой по ЦЕХ и ЗАКАЗ
  //в обычном отчете по user_date2 появляются не 100% скорее всего из-за user_date2 is null and user_date4 is not null)
  //переписать запрос!!!

  SQL := StringReplace(SQL, '<MONTH_NUM>', char(39) + date_filter_month + char(39), [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<MONTH_YEAR>', char(39) + date_filter_month + '.' + date_filter_year + char(39), [rfReplaceAll, rfIgnoreCase]);

  if main_nomen then
  begin
    (*
    SQL := StringReplace(SQL, '<MAIN_NOMEN>', 'ttn.ttn_id in (select src.TTN_ID from TRONIX.DEFICIT_MAIN_NOMEN src WHERE src.CHK_FLD = '
    + char(39) + '1' + char(39) + ' GROUP BY src.TTN_ID)', [rfReplaceAll, rfIgnoreCase]);
    *)

     SQL := StringReplace(SQL, '<MAIN_NOMEN>', 'ttn.ttn_id in (select tn.ttn_id from tronix.ttn tn, tronix.ttn_mat tnmat, tronix.main_nomenclature main '
     + 'where TO_CHAR(main.date_ins, ' + char(39) + 'MM.YYYY' + char(39) + ') = ' + char(39) +  date_filter_month + '.' + date_filter_year + char(39) + ' '
     + 'and tn.type_ttn_type_ttn_id in (5, 44) and tn.ttn_id = tnmat.ttn_ttn_id and tnmat.sprav_sprav_id = main.sprav_id and tn.uzak_uzak_id = main.uzak_id '
     + 'and tn.dep_dep_id_to = main.dep_id group by tn.ttn_id)',
      [rfReplaceAll, rfIgnoreCase]);

    //SQL := StringReplace(SQL, '<DATE_INDEX>', '1', [rfReplaceAll, rfIgnoreCase]);
    //SQL := StringReplace(SQL, '<DATE_INDEX>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
  end
  else
  begin
    SQL := StringReplace(SQL, '<MAIN_NOMEN>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
    //SQL := StringReplace(SQL, '<DATE_INDEX>', '2', [rfReplaceAll, rfIgnoreCase]);
    SQL := StringReplace(SQL, '<DATE_INDEX>', '(to_char(ttn.user_date2, ' + DM_MASK + ') = ' + char(39) + date_filter_month + '.' + date_filter_year
    + char(39) + ' or', [rfReplaceAll, rfIgnoreCase]);   //07.02.2020: "01 changed  to 01.2020"
  end;

  //showmessage(SQL);
  //exit;
  //clipboard.AsText := SQL;
  form1.execQuery(OraQuery3, SQL, false);
  if OraQuery3.RecordCount < 1 then
    exit
  else
    OraQuery3.First;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_TTRTTNS.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Отчет по требованиям';
  Sheet:=FExcel.Workbooks[1].WorkSheets['Отчет по требованиям'];

  Sheet.Cells[1, 1].Value := 'Отчет за ' + date_filter_month + '.' + date_filter_year;
  if main_nomen then
    Sheet.Cells[1, 1].Value := Sheet.Cells[1, 1].Text + ' (Основная номенклатура)';

  startNum := 3;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 13]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 13]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 13]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 13]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 13]].WrapText := true;

  while not OraQuery3.Eof do
  begin
    //CEH
    Sheet.Cells[strNum, 1].Value := OraQuery3.FieldByName('NOMER').asString;
    //Zakaz
    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OraQuery3.FieldByName('ZAK').asString;
    //Vsego documentov
    Sheet.Cells[strNum, 3].Value := OraQuery3.FieldByName('FULL').asString;
    //Otpravleno v snabjenie
    Sheet.Cells[strNum, 4].Value := OraQuery3.FieldByName('TO_OMTO').asString;
    //Vypolneno snabjeniem
    Sheet.Cells[strNum, 5].Value := OraQuery3.FieldByName('OMTO').asString;
    //v procentah  /\
    Sheet.Cells[strNum, 6].Value := OraQuery3.FieldByName('OMTO_PERCENT').asString;
    //Trebovaniya bez bumagi
    Sheet.Cells[strNum, 7].Value := OraQuery3.FieldByName('UNCOMPLETE').asString;
    //Trebovaniya s bumajnim variantom
    Sheet.Cells[strNum, 8].Value := OraQuery3.FieldByName('COMPLETE').asString;
    //za 3 dnya do konca mesyaca
    Sheet.Cells[strNum, 9].Value := OraQuery3.FieldByName('IN_MONTH').asString;
    //v strok
    Sheet.Cells[strNum, 10].Value := OraQuery3.FieldByName('USH_GOOD').asString;
    //ne v srok
    Sheet.Cells[strNum, 11].Value := OraQuery3.FieldByName('USH_BAD').asString;
    //Vypolneno USH (zakryto)
    Sheet.Cells[strNum, 12].Value := OraQuery3.FieldByName('USH').asString;
    //v procentah /\
    Sheet.Cells[strNum, 13].Value := OraQuery3.FieldByName('USH_PERCENT').asString;

    inc(strNum);
    OraQuery3.Next;
  end;

  inc(strNum);

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum, 13]].Font.Size := 16;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 13]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 2]].MergeCells := true;
  
  Sheet.Cells[strNum, 1].Font.Bold := True;
  Sheet.Cells[strNum, 1].Font.Size := 16;
  Sheet.Cells[strNum, 1].NumberFormat := '@';
  Sheet.Cells[strNum, 1].Value := 'ИТОГО: ';
  Sheet.Cells[strNum, 1].HorizontalAlignment := xlRight;
  Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 3].NumberFormat := '';

  Sheet.Cells[strNum, 4].NumberFormat := '';
  Sheet.Cells[strNum, 4].Formula := '=SUM(D' + inttostr(startNum) + ':D' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 5].NumberFormat := '';
  Sheet.Cells[strNum, 5].Formula := '=SUM(E' + inttostr(startNum) + ':E' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 6].Formula := '=((E' + inttostr(strNum) + '/D' + inttostr((strNum)) + ') * 100)';

  Sheet.Cells[strNum, 7].NumberFormat := '';
  Sheet.Cells[strNum, 7].Formula := '=SUM(G' + inttostr(startNum) + ':G' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 8].NumberFormat := '';
  Sheet.Cells[strNum, 8].Formula := '=SUM(H' + inttostr(startNum) + ':H' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 9].NumberFormat := '';
  Sheet.Cells[strNum, 9].Formula := '=SUM(I' + inttostr(startNum) + ':I' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 10].NumberFormat := '';
  Sheet.Cells[strNum, 10].Formula := '=SUM(J' + inttostr(startNum) + ':J' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 11].NumberFormat := '';
  Sheet.Cells[strNum, 11].Formula := '=SUM(K' + inttostr(startNum) + ':K' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 12].NumberFormat := '';
  Sheet.Cells[strNum, 12].Formula := '=SUM(L' + inttostr(startNum) + ':L' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 13].NumberFormat := '';
  //Sheet.Cells[strNum, 11].Formula := '=IF(((J' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100) > 100, 100, K' + inttostr(strNum) + ')';
  Sheet.Cells[strNum, 13].Formula := '=IF(((L' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100) > 100, 100, ((L' + inttostr(strNum) + '/H' + inttostr((strNum)) + ') * 100))';

  OraQuery3.Close;
  FExcel.Visible := true;

  FExcel := Unassigned;
end;

(*
procedure TForm9.Show_MainNomenDetails;
var
SQL : string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  SQL := 'SELECT (CASE WHEN a.USH_PERCENT > 100 THEN 100 ELSE a.USH_PERCENT END) as USH_PERCENT, a.* FROM (SELECT z.zak, '
  + 'decode(c.type_dep_type_dep_id, 2, c.nomer, decode(ct.type_dep_type_dep_id, 2, ct.nomer, c.nomer)) as nomer, afull.full, afull.to_omto, afull.omto, '
  + 'decode(afull.to_omto, 0, 0, round(decode(afull.omto, 0, 0, ((afull.omto / afull.to_omto) * 100)), 0)) as OMTO_percent, '
  + '(afull.OMTO - afull.IN_USH) as uncomplete, afull.IN_USH as complete, afull.USH, '
  + 'decode(afull.in_ush, 0, 0, round(decode(afull.ush, 0, 0, ((afull.ush / afull.in_ush) * 100)), 0)) as USH_percent from '
  + '(SELECT ttn.DEP_DEP_ID_TO as CEH, ttn.UZAK_UZAK_ID as UZAK_ID, count(mn.TTN_ID) as full, sum(decode(ttn.user_date1, null, 0, 1)) as TO_OMTO, '
  + 'sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.user_date4, null, 0, 1)) as IN_USH, sum(decode(ttn.date_ins, null, 0, 1)) as USH '
  + 'from (select src.TTN_ID from TRONIX.DEFICIT_MAIN_NOMEN src WHERE src.CHK_FLD = ' + char(39) + '1' + char(39) + ' GROUP BY src.TTN_ID) mn, TRONIX.TTN ttn WHERE '
  + 'mn.TTN_ID = ttn.TTN_ID(+) and ttn.TTN_ID is not null and to_char(ttn.user_date2, ' + char(39) + 'mm' + char(39) + ') = ' + char(39) + '09' + char(39) + ' '
  + 'group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, kadry_dep ct, tronix.zakaz z where '
  + 'afull.ceh = c.dep_id(+) and c.dep_dep_id = ct.dep_id(+) and afull.uzak_id = z.nn(+)) a order by A.nomer, A.zak, A.full';

  //showmessage(SQL);
  form1.execQuery(OraQuery3, SQL, false);
  if OraQuery3.RecordCount < 1 then
    exit
  else
    OraQuery3.First;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MAINTTNS.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Основная номенклатура';
  Sheet:=FExcel.Workbooks[1].WorkSheets['Основная номенклатура'];

  startNum := 2;
  strNum := startNum;

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].Font.Size := 14;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].borders.linestyle := xlContinuous;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].HorizontalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].VerticalAlignment := xlCenter;
  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum + (OraQuery3.RecordCount - 1), 10]].WrapText := true;
  while not OraQuery3.Eof do
  begin
    //CEH
    Sheet.Cells[strNum, 1].Value := OraQuery3.FieldByName('NOMER').asString;
    //Zakaz
    Sheet.Cells[strNum, 2].NumberFormat := '@';
    Sheet.Cells[strNum, 2].Value := OraQuery3.FieldByName('ZAK').asString;
    //Vsego documentov
    Sheet.Cells[strNum, 3].Value := OraQuery3.FieldByName('FULL').asString;
    //Otpravleno v snabjenie
    Sheet.Cells[strNum, 4].Value := OraQuery3.FieldByName('TO_OMTO').asString;
    //Vypolneno snabjeniem
    Sheet.Cells[strNum, 5].Value := OraQuery3.FieldByName('OMTO').asString;
    //v procentah  /\
    Sheet.Cells[strNum, 6].Value := OraQuery3.FieldByName('OMTO_PERCENT').asString;
    //Trebovaniya bez bumagi
    Sheet.Cells[strNum, 7].Value := OraQuery3.FieldByName('UNCOMPLETE').asString;
    //Trebovaniya s bumajnim variantom
    Sheet.Cells[strNum, 8].Value := OraQuery3.FieldByName('COMPLETE').asString;
    //Vypolneno USH (zakryto)
    Sheet.Cells[strNum, 9].Value := OraQuery3.FieldByName('USH').asString;
    //v procentah /\
    Sheet.Cells[strNum, 10].Value := OraQuery3.FieldByName('USH_PERCENT').asString;

    inc(strNum);
    OraQuery3.Next;
  end;

  inc(strNum);

  Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum, 10]].Font.Size := 16;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 10]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 2]].MergeCells := true;
  
  Sheet.Cells[strNum, 1].Font.Bold := True;
  Sheet.Cells[strNum, 1].Font.Size := 16;
  Sheet.Cells[strNum, 1].NumberFormat := '@';
  Sheet.Cells[strNum, 1].Value := 'ИТОГО: ';
  Sheet.Cells[strNum, 1].HorizontalAlignment := xlRight;
  Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 3].NumberFormat := '';
  Sheet.Cells[strNum, 3].Formula := '=SUM(C' + inttostr(startNum) + ':C' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 4].NumberFormat := '';
  Sheet.Cells[strNum, 4].Formula := '=SUM(D' + inttostr(startNum) + ':D' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 5].NumberFormat := '';
  Sheet.Cells[strNum, 5].Formula := '=SUM(E' + inttostr(startNum) + ':E' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 6].NumberFormat := '';
  Sheet.Cells[strNum, 6].Formula := '=((E' + inttostr(strNum) + '/D' + inttostr((strNum)) + ') * 100)';

  Sheet.Cells[strNum, 7].NumberFormat := '';
  Sheet.Cells[strNum, 7].Formula := '=SUM(G' + inttostr(startNum) + ':G' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 8].NumberFormat := '';
  Sheet.Cells[strNum, 8].Formula := '=SUM(H' + inttostr(startNum) + ':H' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 9].NumberFormat := '';
  Sheet.Cells[strNum, 9].Formula := '=SUM(I' + inttostr(startNum) + ':I' + inttostr((strNum - 2)) + ')';

  Sheet.Cells[strNum, 10].NumberFormat := '';
  Sheet.Cells[strNum, 10].Formula := '=((I' + inttostr(strNum) + '/(G' + inttostr(strNum) + '+H' + inttostr((strNum)) + ')) * 100)';

  OraQuery3.Close;
  FExcel.Visible := true;
  
  FExcel := Unassigned;
end;
*)

procedure TForm9.DBGridEh2DblClick(Sender: TObject);

const
TTN_TYPE_ARRAY = '5, 43, 44';

var
SQL,
DEP_ID,
CEH,
tSheetName : string;

FExcel,
Sheet,
Range : OleVariant;

x : integer;

begin
label2.Caption := OraQuery2.FieldByName('nn').AsString;
if form9.caption = 'Отчет по нарядам' then
begin
Form10.Caption := 'Отчет по нарядам';
Form10.ShowModal();
end;

if (self.Caption = 'Установка основной номенклатуры') then
begin
  Application.CreateForm(Tf_calendar, f_calendar);
  Application.CreateForm(Tset_mnomen, set_mnomen);

  f_calendar.Showmodal();

  set_mnomen.Caption := set_mnomen.Caption + ' по проекту / заказу: ' + dbgrideh1.DataSource.DataSet.FieldByName('ZAVN').asString + ' / '
  + dbgrideh2.DataSource.DataSet.FieldByName('zak').asString;
  set_mnomen.date_f := f_calendar.result_month;
  set_mnomen.date_s := f_calendar.result_year;
  set_mnomen.Showmodal();

  set_mnomen.Free;
  f_calendar.Free;

  exit;
end;

if (self.Caption = 'Основная номенклатура по дефициту') then
begin
  (*
  if MessageDlg('Перейти к составлению основной номенклатуры или показать отчет?' + #10#13
  + 'ДА - основная номенклатура' + #10#13
  + 'НЕТ - отчет по основной номенклатуре',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    Application.CreateForm(Tdefttns, defttns);
    defttns.Showmodal();
    defttns.Free;
  end
  else
    Show_MainNomenDetails;
  *)
  Application.CreateForm(Tdefttns, defttns);
  defttns.Showmodal();
  defttns.Free;
end;

if (self.Caption = 'Излишки ТМЦ') then
begin
  Application.CreateForm(Tover_tmc, over_tmc);
  over_tmc.ShowModal();
  over_tmc.free;
end;

if (self.caption = 'Дефицит по номенклатуре (старый)') then
begin
  Form15.Showmodal();
end;

if form9.caption = 'Отчет по трудоемкости (Новый)' then
begin
Form10.Caption:='Отчет по трудоемкости (Новый)';
Form10.ShowModal();
end;

 if (form9.caption = 'Выберите что сравниваем') then
begin
Form23.EDIT1.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label1.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

 if (form9.caption = 'Выберите с чем сравниваем') then
begin
Form23.EDIT2.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label2.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

if form9.caption = 'Отчет по материальной ведомости' then
begin
  exit;
end;

if (self.caption = 'Требования по дефициту') then
begin
  //may need multi dep

  CEH := '';
  CEH := InputBox('ПОДРАЗДЕЛЕНИЕ', 'Введите номер цеха', '');
  if CEH = '' then
  begin
    showmessage('Введите номер цеха!');
    exit;
  end;

  SQL := 'SELECT DEP_ID FROM KADRY_DEP where ROWNUM = 1 AND type_dep_type_dep_id = 2 AND nomer = '
  + char(39) + CEH + char(39);
  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  if OraQuery3.RecordCount <> 1 then
  begin
    showmessage('Цех с номером ' + char(39) + CEH + char(39) + ' не найден!');
    exit;
  end;
  DEP_ID := OraQuery3.FieldByName('DEP_ID').asString;

  SQL := 'SELECT ZAK FROM TRONIX.ZAKAZ WHERE NN = ' + form9.Label2.Caption;
  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  if OraQuery3.RecordCount <> 1 then
  begin
    showmessage('Ошибка проекта!');
    exit;
  end;

  if MessageDlg('Сформировать отчет по требованиями дефицита для ЗАКАЗА = ' + OraQuery3.FieldByName('ZAK').asString
  + '; ЦЕХА = ' + CEH + '???', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  tSheetName := 'deficit_' + OraQuery3.FieldByName('ZAK').asString + '_' + CEH + '_' + FormatDateTime('dd.mm.yyyy', Date);

  CEH := '(1 = 1)';
  if MessageDlg('Включить требования, которые не отправлены в снабжение (находятся в цеху)?', mtConfirmation,
  [mbYes, mbNo], 0) = mrNo then
    CEH := 'tn.USER_DATE1 is not null';

  SQL := '';
  if form1.SCAlive then
    SQL := form1.ServerRequest('TR_TTNS_FROM_DEFICIT')
  else
    exit;

  SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<DEP_ID>', DEP_ID, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<TTN_TYPE>', TTN_TYPE_ARRAY, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<INIT_STATE>', CEH, [rfReplaceAll, rfIgnoreCase]);

  if not form1.execQuery(OraQuery3, SQL, false) then
    exit;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_TRTTNS_DEFICIT.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := tSheetName;

  Sheet := FExcel.Workbooks[1].WorkSheets[tSheetName];
  Range := Sheet.Columns;
  Range.NumberFormat := '@';

  x := 3; //start string-index
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].borders.linestyle := xlContinuous;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].WrapText := true;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].HorizontalAlignment := xlCenter;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].VerticalAlignment := xlCenter;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 20]].Font.Size := 12;
  Sheet.range[Sheet.cells[x, 1], Sheet.cells[(OraQuery3.RecordCount + (x - 1)), 1]].Font.Bold := true;
  // + 2 font-size for COLUMN: KOD
  // HorizontalAlignment = xlLeft  for MTR_NAME
  //take from ttn_mat ONE "KOL" with KODED -> convert in result "KOL" to 2 koded's like a POTR

  while not OraQuery3.Eof do
  begin

    Sheet.Cells[x, 1].Value := OraQuery3.FieldByName('KOD').asString;
    Sheet.Cells[x, 2].Value := OraQuery3.FieldByName('MTR_NAME').asString;
    Sheet.Cells[x, 3].Value := OraQuery3.FieldByName('P').asString;
    Sheet.Cells[x, 4].Value := OraQuery3.FieldByName('NAMEK').asString;
    Sheet.Cells[x, 5].Value := OraQuery3.FieldByName('P_UCHET').asString;
    Sheet.Cells[x, 6].Value := OraQuery3.FieldByName('NAMEK_UCHET').asString;
    Sheet.Cells[x, 7].Value := OraQuery3.FieldByName('ZS').asString;
    Sheet.Cells[x, 8].Value := OraQuery3.FieldByName('ZS_UCHET').asString;
    Sheet.Cells[x, 9].Value := OraQuery3.FieldByName('ZC').asString;
    Sheet.Cells[x, 10].Value := OraQuery3.FieldByName('ZC_UCHET').asString;
    Sheet.Cells[x, 11].Value := OraQuery3.FieldByName('DEF').asString;
    Sheet.Cells[x, 12].Value := OraQuery3.FieldByName('DEF_UCHET').asString;
    Sheet.Cells[x, 13].Value := OraQuery3.FieldByName('NOMER').asString;
    Sheet.Cells[x, 14].Value := OraQuery3.FieldByName('KOL_UCHET').asString;   // ->swap
    Sheet.Cells[x, 15].Value := OraQuery3.FieldByName('KOL').asString;         // swap<-
    Sheet.Cells[x, 16].Value := OraQuery3.FieldByName('DATE_DOK').asString;
    Sheet.Cells[x, 17].Value := OraQuery3.FieldByName('USER_DATE1').asString;
    Sheet.Cells[x, 18].Value := OraQuery3.FieldByName('USER_DATE2').asString;
    Sheet.Cells[x, 19].Value := OraQuery3.FieldByName('USER_DATE4').asString;
    Sheet.Cells[x, 20].Value := OraQuery3.FieldByName('DATE_INS').asString;

    inc(x);
    OraQuery3.Next;
  end;

  FExcel.Visible := true;

end;

end;


procedure TForm9.FormShow(Sender: TObject);
begin
 OraQuery2.Open;
  OraQuery1.Open;
  Form9.DBgridEH2.Visible:=true;
  Label3.Visible:=false;
   ComboBox1.Visible:=false;
if (form9.caption='Отчет по материальной ведомости') then  Form9.Button1.Visible:=false;

if (form9.caption='Отчет по заявкам') or (form9.caption='Отчет планируемой трудоемкости') or
(form9.caption='Отчет по выполнению ведомостей (Для склада ЗИП)') or (form9.caption='Отчет по Отчет по ТН (материал изделие)')
or (form9.caption='Ведомость материалов')  or (form9.caption='Потребность по материалам в разрезе чертежа')
or  (form9.caption='Отчет по поиску позиций с приоритетом 0 по проекту')
or  (form9.caption='Построечный журнал') or (form9.caption='Ведомость комплектации по помещениям.')
or  (form9.caption='Проверка документов на согласовании к справочнику.')
or  (form9.caption='Потребность по материалам и оборудованию общая по проекту')
or  (form9.caption='Наряды по цеху,проекту')
or  (form9.caption='Наряды с привязкой к УКР с начала постройки по проекту. Выберите проект')
or  (form9.caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект')
or  (form9.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект')
or  (form9.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект')
or  (form9.Caption='Остатки трудоёмкости по МСЧ. Выберите проект')
or  (form9.Caption='Количество изделий МСЧ по проекту. Выберите проект')
or  (form9.Caption='Количество покупных изделий с привязкой к ТН,позиции СП по проекту. Выберите проект')
or  (form9.Caption='Отёт по привязке ПУЕ к УДП по проекту. Выберите проект')
or  (form9.Caption='УДП по проекту: тр-ть норма,факт,остаток,процент выработки. Выберите проект')
or  (form9.Caption='ОТК: УДП по проекту. Выберите проект')
or  (form9.Caption='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект')
or  (form9.Caption='УДП: Заказчик. Выберите проект')
or  (form9.Caption='ПДО: Отчёт по УДП по проекту. Выберите проект')
or  (form9.Caption='ПУЕ с трудоёмкостью 0 с привязкой к УДП по проекту. Выберите проект')
or  (form9.Caption='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект')
or  (form9.Caption='СП Ведомости снабжения группы 237 по проекту. Выберите проект')
or  (form9.Caption='Оборудование по проекту. Выберите проект')
or  (form9.Caption='Перечень закрытой оснастки по проекту. Выберите проект')
or  (form9.caption='Формрование ведомости комплектации запуска.')
or  (form9.Caption='Изделия с незаполненой трудоемкостью ТНа')
or  (form9.Caption='Выберите проект для анализа')
or  (form9.Caption='Проверка дублей ТК и ПТК в проекте')
or  (form9.Caption='Проверка масс (спецификация и справочник)')
or (form9.Caption='Отчёт по сравнению потребности с ведомостями заказа')
or (form9.Caption='Техкомплекты в обеспечении материалами с признаком поступления')
or (form9.Caption='Выгружаем транспортный файл.')
then
begin
  Form9.DBgridEH2.Visible:=false;
  Form9.Button1.Visible:=false;
  if (form9.caption='Наряды по цеху,проекту') or (form9.Caption='Перечень закрытой оснастки по проекту. Выберите проект') then
  Form9.Button1.Visible:=true;

  if self.caption = 'Построечный журнал' then
  begin
    form1.execQuery(OraQuery3, 'SELECT nomer FROM kadry_dep where type_dep_type_dep_id = 2 ORDER BY NOMER ASC', false);
    if OraQuery3.RecordCount < 1 then
      Deps.Visible := false
    else
    begin
      Deps_Label.Visible := true;
      Deps.Visible := true;
      Deps.Clear;

      OraQuery3.First;
      while not OraQuery3.Eof do
      begin
        Deps.Items.Add(OraQuery3.FieldByName('nomer').asString);
        OraQuery3.Next;
      end;
      Deps.ItemIndex := -1;
    end;
  end;
end;

if ((self.Caption = 'Основная номенклатура по дефициту') or (self.caption = 'Требования по дефициту')
or (self.Caption = 'Излишки ТМЦ') or (self.Caption = 'Установка основной номенклатуры')) then
  Button1.Visible := false;

if (self.caption = 'Отчет по материальной ведомости') then
begin
  allprs.Visible := true;
	Button1.Visible := false;
  Button2.Visible := true;
  uzaks.Visible := true;
end;

if (self.Caption = 'Дефицит по номенклатуре (новый)') then
begin
  allprs.Visible := true;
  button1.Visible := false;
  Button2.Visible := true;
  Button2.Caption := 'ОТЧЕТ ПО ДЕФИЦИТУ';
  uzaks.Visible := true;
end;

(*
if (self.Caption = 'Требования по дефициту') then
begin
  allprs.Visible := true;
  button1.Visible := false;
  Button2.Visible := true;
  Button2.Caption := 'ЗАГРУЗИТЬ ТРЕБОВАНИЯ';
  uzaks.Visible := true;
end;
*)

 if (form9.caption='Построечный журнал') then
  begin
    Label3.Visible:=true;
       ComboBox1.Items.Clear;
    ComboBox1.Items.Add('Списком');
    ComboBox1.Items.Add('Деревом');
    ComboBox1.Items.Add('Списком с планируемым исполнителем');
    ComboBox1.Visible:=true;
  end;
end;

procedure TForm9.DBGridEh1DblClick(Sender: TObject);
var
tx,zak, uzak,part1,part2, SQL: string;
e, INC_POS: integer;
FExcel, Sheet, Colum : OleVariant;
begin

if form9.caption='Выгружаем транспортный файл.' then
begin

  Form27.Caption:='Выгружаем транспортный файл. По проекту '+OraQuery1.FieldByName('name').AsString;
  Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
 // Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();


end;


if form9.caption='Построечный журнал. Подрядчики' then
begin
    Application.CreateForm(TForm50, Form50);

  Form50.Caption:='Построечный журнал. Подрядчики по '+OraQuery1.FieldByName('name').AsString;
  Form50.Project_name:=OraQuery1.FieldByName('name').AsString;
  Form50.Project_zavn:=OraQuery1.FieldByName('zavn').AsString;
  Form50.Project_zak:=OraQuery2.FieldByName('zak').AsString;
  Form50.Project_id:=OraQuery1.FieldByName('project_id').AsString;
   Form50.ShowModal();

end;


if form9.caption='Отчёт по сравнению потребности с ведомостями заказа'
then
 begin
 Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form27.Caption:='Отчёт по сравнению потребности с ведомостями заказа';
  Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();
end;

if form9.caption='Проверка дублей ТК и ПТК в проекте' then
begin
// Form47.Label2.Caption:=oraQuery1.FieldByName('project_id').asString;
  with  Form47 DO
    begin
      Caption:='Проверка дублей ТК и ПТК в проекте';
tx:=' Select NOMER, ';
tx:=tx+' (Select NOMER from tx_texkompl  where texkompl_id=tx.texkompl_texkompl_id)  as UROVEN,';
tx:=tx+' (Select FIO from tronix.izm where  ID=texkompl_id and IZM=''I'' and key= NOMER)  FIO,';
tx:=tx+' (Select DAT from tronix.izm where  ID=texkompl_id and IZM=''I'' and key= NOMER) DAT';
//tx:=tx+'  tx.texkompl_id ';
tx:=tx+' from tx_texkompl tx ';
tx:=tx+' where tx.texkompl_id in ';
tx:=tx+' ( ';
tx:=tx+' Select texkompl_id from tx_texkompl ';
tx:=tx+' where nomer in ';
tx:=tx+' ( ';
tx:=tx+' Select nomer from ';
tx:=tx+' ( ';
tx:=tx+' Select nomer,count(*) k ';
tx:=tx+' from tx_texkompl ';
tx:=tx+' where ';
tx:=tx+' project_project_id='+Form9.oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and type_tex_type_tex_id in (7,12) ';
tx:=tx+' group by nomer ';
tx:=tx+' ) ';
tx:=tx+' where k>1 ';
tx:=tx+' ) ';
tx:=tx+' and project_project_id='+Form9.oraQuery1.FieldByName('project_id').asString;
tx:=tx+' ) ';
tx:=tx+' order by NOMER,DAT ';
      OraQuery1.SQL.Text:=tx;

      OraQuery1.ExecSQL;
 end;
  Close();
  Form47.ShowModal();

end;

if (form9.caption = 'Отчет по материальной ведомости') and (Sender <> nil) then
	exit;

if form9.caption='Отчет по материальной ведомости' then
begin

	uzak := '-1';
	for e := 0 to uzaks.Items.Count - 1 do
		if uzaks.Checked[e] then
			uzak := uzak + ', ' + uzaks_memory.Items[e];

	if uzak = '-1' then
	begin
		showmessage('Выберите минимум 1 заказ!');
		exit;
	end;

	tx:=' SELECT I.CED, I.CED_UCHET, I.PART,I.PART2,SUBSTR(I.KOD,1,4) GRP_KOD,I.SUBGRP,I.GOST_CHART_POST GOST,I.KOD,I.MARKA,I.TYPE_RAZM,I.DOP_NAME,I.GOST_TY,I.GOST_MAT, ';
	tx:=tx+' RTRIM(I.MARKA || DECODE(I.TYPE_RAZM, NULL ,'''','' '')  || I.TYPE_RAZM  || DECODE(I.GOST_TY, NULL ,'''','' '')  || I.GOST_TY  || DECODE(I.GOST_MAT, NULL ,'''','' '')  || I.GOST_MAT ) MAT, ';
	tx:=tx+' UPPER(I.ED) ED,REPLACE(TO_CHAR(I.POTR),''.'','','') POTR,UPPER(I.ED_UCHET) ED_UCHET,REPLACE(TO_CHAR(I.POTR_UCHET),''.'','','') POTR_UCHET,';
	//tx:=tx+' REPLACE(TO_CHAR(I.MASS),''.'','','') MASS ';
	//tx:=tx+' REPLACE(TO_CHAR(DECODE(I.MASS,0,I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,I.KODED_KODED_ID,10)),''.'','','')) MASS ';
	//tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS ,round(POTR*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)),I.MASS) MASS , ';
	//13.02.2019 tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS , ';
	//tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	//13.02.2019tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*';
	//tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)) * I.defkof, 9) as kof_isp, ';
	//tx:=tx+'I.defkof as defkof ';
	tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where koded_id=I.koded_id),10)) * ';
	tx:=tx+'nvl((Select max(k.ki) ';
	tx:=tx+' FROM ';
	tx:=tx+'TRONIX.SPRAV S, ';
	tx:=tx+'TRONIX.T24P2 K, ';
	tx:=tx+'TRONIX.T24P1 ZK ';
	tx:=tx+' WHERE ';
	tx:=tx+' ZK.NPP=1 ';
	tx:=tx+' AND  ZK.NPP=K.NPP ';
	tx:=tx+' AND S.SPRAV_ID=I.SPRAV_ID ';
	tx:=tx+' AND I.KOD>=K.KOD1 ';
	tx:=tx+' AND I.KOD<=K.KOD2 ';
	tx:=tx+' AND K.KI>0),0),9) as kof_isp, nvl((Select max(k.ki) FROM TRONIX.SPRAV S, TRONIX.T24P2 K, '
	+ 'TRONIX.T24P1 ZK WHERE ZK.NPP=1 AND  ZK.NPP=K.NPP AND S.SPRAV_ID=I.SPRAV_ID AND I.KOD>=K.KOD1 AND '
	+ 'I.KOD<=K.KOD2 AND K.KI>0),0) as defkof ';

	//nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
	tx:=tx+'   FROM (SELECT DISTINCT REPLACE(UPPER(L1.NAME),CHR(9),'' '') PART, ';
	tx:=tx+' REPLACE(UPPER(L2.name),CHR(9),'' '') PART2, ';
	tx:=tx+' REPLACE(UPPER(SPR.NAME),CHR(9),'' '') SUBGRP, ';
	tx:=tx+' A.SPRAV_ID, ';
	tx:=tx+' SPR.KOD,REPLACE(UPPER(LTRIM(SPR.DOP_NAME)),CHR(9),'' '') DOP_NAME,A.KODED_ID_UCHET,A.KODED_ID, ';
	tx:=tx+' TRONIX_KODED.NAMEK ED, ';
	tx:=tx+' TRONIX_KODED.KODED CED, '; //15.02.2019
	tx:=tx+' KODED_UCHET.NAMEK ED_UCHET, ';
	tx:=tx+' KODED_UCHET.KODED CED_UCHET, '; //15.02.2019
	tx:=tx+' ROUND(A.POTR,4) POTR, ';
	tx:=tx+' ROUND(A.POTR_UCHET,4) POTR_UCHET, ';
	tx:=tx+' ROUND(A.MASS,4) MASS, ';
	tx:=tx+' REPLACE(UPPER(LTRIM(TTR.NAME)),CHR(9),'' '') TYPE_RAZM, ';
	tx:=tx+' REPLACE(UPPER(LTRIM(TTI.NAME)),CHR(9),'' '') MARKA,REPLACE(UPPER(TTL.NAME),CHR(9),'' '') GOST_CHART_POST, ';
	tx:=tx+' REPLACE(UPPER(TTY.NAME),CHR(9),'' '') GOST_TY,REPLACE(UPPER(TTM.NAME),CHR(9),'' '') GOST_MAT ';
	tx:=tx+' FROM TRONIX_KODED,TRONIX_KODED KODED_UCHET,TRONIX_SPRAV SPR,TRONIX_TREE L0, ';
	tx:=tx+' TRONIX_TREE L1,TRONIX_TREE L2,TRONIX_TREE L3,TRONIX_TREE L4,TRONIX_TYP_LOV TTL,TRONIX_TYM_LOV TTM,TRONIX_TIP_LOV TTI, ';
	tx:=tx+' TRONIX_RAZ_LOV TTR,TRONIX_TY_LOV TTY, ';
	tx:=tx+' (SELECT ALL AA.SPRAV_ID,AA.KODED_ID,AA.KODED_ID_UCHET,SUM(AA.POTR) POTR, ';
	tx:=tx+' SUM(AA.POTR_UCHET) POTR_UCHET,SUM(AA.MASS) MASS ';
	tx:=tx+'  FROM (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	tx:=tx+' SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET,SUM(B.MASS) MASS ';
	tx:=tx+'   FROM (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,C.MASS, ';
	tx:=tx+' TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	tx:=tx+' TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	tx:=tx+'    FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID, ';
	tx:=tx+' TX_CAR_POTR.DEP_DEP_ID DEP_ID, ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	tx:=tx+' NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+' TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR, ';
	/// ??? ??? ??????? ??????????? ????
	//tx:=tx+' SUM(KART_SP.MASS) MASS   FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	///??????
	///tx:=tx+' SUM(DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,KART_SP.MASS,TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	tx:=tx+'DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,SUM(KART_SP.MASS)/count(KART_SP.NN),SUM(TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS, ';
	tx:=tx+'  KART_SP.id_sprav ';
	////
	tx:=tx+' FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
	tx:=tx+'   WHERE TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID ';
	tx:=tx+'  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'  AND TX_CAR_POTR.SP_ID_FROM = KART_SP.NN  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'  AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	tx:=tx+' GROUP BY TX_CAR_POTR.SPRAV_SPRAV_ID,NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID), ';
	tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID, ';
	/// ????? ???? ???????? ???????????
	tx:=tx+' TX_CAR_POTR.KODED_KODED_ID,TX_CAR_POTR.DEP_DEP_ID , KART_SP.NN, KART_SP.id_sprav) C ) B ';
	tx:=tx+'  GROUP BY B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET ';
	tx:=tx+'   UNION ALL ';

	///tx:=tx+' SELECT BB.SPRAV_ID,BB.DEP_ID,BB.KODED_ID,BB.KODED_ID_UCHET, ';
	///tx:=tx+' BB.POTR,BB.POTR_UCHET, ';
	///tx:=tx+' SP.MASS ';
	///tx:=tx+' FROM ';
	///tx:=tx+' (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	///tx:=tx+' SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET ';
	///tx:=tx+'  FROM ';
	///tx:=tx+' (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	///tx:=tx+'  TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	///tx:=tx+'  FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,TX_CAR_POTR.DEP_DEP_ID DEP_ID,TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	///tx:=tx+' NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	///tx:=tx+' TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR ';
	///tx:=tx+'  FROM TX_CAR_POTR,TRONIX_SPRAV ';
	///tx:=tx+'     WHERE ';
	///tx:=tx+' TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	///tx:=tx+'  AND TX_CAR_POTR.SP_ID_FROM IS NULL  AND (TX_CAR_POTR.UZAK_UZAK_ID = '+ uzak +' OR '+uzak +' IS NULL ) ';
	///tx:=tx+' AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	///tx:=tx+'         GROUP BY ';
	///tx:=tx+'     TX_CAR_POTR.SPRAV_SPRAV_ID, ';
	///tx:=tx+'     NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	///tx:=tx+'     TRONIX_SPRAV.KODED_KODED_ID), ';
	///tx:=tx+'     TRONIX_SPRAV.KODED_KODED_ID, ';
	///tx:=tx+'       TX_CAR_POTR.KODED_KODED_ID, ';
	///tx:=tx+'          TX_CAR_POTR.DEP_DEP_ID ) C ) B ';
	///tx:=tx+'      GROUP BY ';
	///tx:=tx+'    B.SPRAV_ID, ';
	///tx:=tx+'      B.DEP_ID, ';
	///tx:=tx+'        B.KODED_ID, ';
	///tx:=tx+'          B.KODED_ID_UCHET ) BB, ';
	///tx:=tx+'         (SELECT SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID,SUM(SP1.MASS) MASS ';
	///tx:=tx+'          FROM (SELECT SP0.SPRAV_SPRAV_ID,SP0.DEP_DEP_ID,SP0.MASS ';
	///tx:=tx+'          FROM (SELECT TX_ZAMEN_MAT_SP(SP.ID_SPRAV,D.ID_PROJECT, NULL , NULL , NULL ,SP.NN) SPRAV_SPRAV_ID, ';
	///tx:=tx+'         TX_SKLAD_FOR(TK.DEP_DEP_ID) DEP_DEP_ID,SP.MASS ';
	///tx:=tx+'         FROM TX_CAR_POTR P,KART_SP SP,TX_TEXKOMPL TK,TRONIX_DOCUMENT D, ';
	///tx:=tx+'         (SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''??''  AND TYPE != ''??'' ) TD  WHERE SP.NN = P.SP_ID_FROM (+) ';
	///tx:=tx+'         AND P.SP_ID_FROM IS NULL  AND TX_GET_TX_MARSH(''FIRST'',TX_LOAD_MARSH(SP.NN)) = TK.TEXKOMPL_ID ';
	///tx:=tx+'        AND (D.ID_PROJECT =' +oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	///tx:=tx+'      AND D.DOCUMENT_ID = SP.NNN  AND D.ID_DOCUMENT_TYPE = TD.DOCUMENT_TYPE_ID ) SP0, ';
	///tx:=tx+'     TRONIX_SPRAV S  WHERE SP0.SPRAV_SPRAV_ID = S.SPRAV_ID  AND NVL(S.CAN_DO_SELF,0) != 1 ) SP1 ';
	///tx:=tx+'       GROUP BY SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID ) SP ';
	///tx:=tx+'    WHERE BB.SPRAV_ID || ''|''  || BB.DEP_ID  = SP.SPRAV_SPRAV_ID (+)   || ''|''  || SP.DEP_DEP_ID (+) ';

	tx:=tx+' SELECT ';
	(*tx:=tx+'nvl((Select max(k.ki) FROM TRONIX.SPRAV S, TRONIX.T24P2 K, '
	+ 'TRONIX.T24P1 ZK WHERE ZK.NPP=1 AND  ZK.NPP=K.NPP AND S.SPRAV_ID=SPRAV_ID AND S.KOD>=K.KOD1 AND '
	+ 'S.KOD<=K.KOD2 AND K.KI>0),0) as defkof, ';*)
	tx:=tx+'  SPRAV_ID,DEP_ID,KODED_ID,KODED_ID_UCHET, ';
	tx:=tx+'   POTR,POTR_UCHET ,MASS    ';
	tx:=tx+'   FROM (                ';
	tx:=tx+'  Select SPRAV_ID,dep_id,KODED_ID,KODED_ID_UCHET, SUM( POTR) POTR,SUM( POTR_UCHET) POTR_UCHET, ';
	tx:=tx+'  SUM(decode(mass,null,(TRONIX_KOF_KODED(SPRAV_ID,KODED_ID,10)*POTR),MASS)) MASS ';
	tx:=tx+'  from( ';
	tx:=tx+'  Select SPRAV_ID,0 dep_id,KODED_ID,KODED_ID_UCHET, sum(POTR)  POTR, ';
	tx:=tx+'   sum(POTR_UCHET)  POTR_UCHET, ';
	tx:=tx+'  (Select  sum(TRONIX_KOF_KODED(sprav_sprav_id_sostav,koded_koded_id,10)*kol) ';
	tx:=tx+'  from  tronix.sostav ';
	tx:=tx+'  where sprav_sprav_id_sostav=SPRAV_ID ';
	tx:=tx+'  connect by prior sprav_sprav_id_sostav=sprav_sprav_id ';
	tx:=tx+'  start with sprav_sprav_id=spr_msc )*sum(POTR)*TRONIX_KOF_KODED( SPRAV_ID,KODED_ID,10)/ ';
	tx:=tx+'  (Select  sum(TRONIX_KOF_KODED(sprav_sprav_id_sostav,koded_koded_id,10)*ki)  MASS ';
	tx:=tx+'  from  tronix.sostav ';
	tx:=tx+'  where sprav_sprav_id_sostav=SPRAV_ID ';
	tx:=tx+'  connect by prior sprav_sprav_id_sostav=sprav_sprav_id ';
	tx:=tx+'  start with sprav_sprav_id=spr_msc )   MASS ';
	tx:=tx+'  from ';
	tx:=tx+'  (SELECT ALL B.SPRAV_ID,B.DEP_ID,B.KODED_ID,B.KODED_ID_UCHET,SUM(B.KOL_POTR * B.KOF ) POTR, ';
	tx:=tx+'   SUM(B.KOL_POTR * B.KOF_UCHET ) POTR_UCHET ';
	tx:=tx+'  ,b.nomer,SUBSTR(b.nomer, INSTR(b.nomer,''/'',1,1)+1, INSTR(b.nomer ,''/'',1,2)-INSTR(b.nomer,''/'',1,1)-1)  , ';
	tx:=tx+'  (Select sprav_id from tronix.sprav where kod=SUBSTR(b.nomer, INSTR(b.nomer,''/'',1,1)+1, INSTR(b.nomer ,''/'',1,2)-INSTR(b.nomer,''/'',1,1)-1)) spr_msc ';
	tx:=tx+'    FROM ';
	tx:=tx+'   (SELECT DISTINCT C.SPRAV_ID,C.DEP_ID,C.KODED_ID_UCHET,C.KODED_ID,C.KOL_POTR,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID_UCHET) KOF_UCHET, ';
	tx:=tx+'    TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,C.KODED_ID) KOF ';
	tx:=tx+'  , (Select nomer from tx_texkompl where texkompl_id=c.texkompl_texkompl_id) nomer ';
	tx:=tx+'   FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,TX_CAR_POTR.DEP_DEP_ID DEP_ID,TRONIX_SPRAV.KODED_KODED_ID KODED_ID, ';
	tx:=tx+'   NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'   TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR,SUM(TX_CAR_POTR.KOL) KOL_POTR ';
	tx:=tx+'  ,TX_CAR_POTR.texkompl_texkompl_id ';
	tx:=tx+'    FROM TX_CAR_POTR,TRONIX_SPRAV ';
	tx:=tx+'       WHERE ';
	tx:=tx+'   TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'    AND TX_CAR_POTR.SP_ID_FROM IS NULL  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'   AND (TX_CAR_POTR.PROJECT_PROJECT_ID =' +oraQuery1.FieldByName('project_id').asString+ ' OR ' +oraQuery1.FieldByName('project_id').asString+ ' IS NULL) ';
	tx:=tx+'           GROUP BY ';
	tx:=tx+'       TX_CAR_POTR.SPRAV_SPRAV_ID, ';
	tx:=tx+'       NVL(TRONIX_SPRAV.KODED_KODED_ID2, ';
	tx:=tx+'       TRONIX_SPRAV.KODED_KODED_ID), ';
	tx:=tx+'       TRONIX_SPRAV.KODED_KODED_ID, ';
	tx:=tx+'         TX_CAR_POTR.KODED_KODED_ID, ';
	tx:=tx+'            TX_CAR_POTR.DEP_DEP_ID ';
	tx:=tx+'  ,TX_CAR_POTR.texkompl_texkompl_id ';
	tx:=tx+'  ) C ) B ';
	tx:=tx+'        GROUP BY ';
	tx:=tx+'      B.SPRAV_ID, ';
	tx:=tx+'          B.KODED_ID, ';
	tx:=tx+'   B.dep_ID, ';
	tx:=tx+'   B.KODED_ID_UCHET ';
	tx:=tx+'  ,b.nomer) ';
	tx:=tx+'  group by SPRAV_ID, KODED_ID,KODED_ID_UCHET,spr_msc) ';
	tx:=tx+'  Group by SPRAV_ID, dep_id,KODED_ID,KODED_ID_UCHET) ';
	tx:=tx+'    UNION ALL SELECT S2.SPRAV_ID,TX_SKLAD_FOR(DS.DEP_DEP_ID) DEP_DEP_ID,S2.KODED_KODED_ID KODED_ID,NVL(S2.KODED_KODED_ID2,S2.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'    TO_NUMBER( NULL ) POTR,  TO_NUMBER( NULL ) POTR_UCHET, '; //30072015
	//30072015//tx:=tx+'  S1.KOL * l1.KI  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,S2.KODED_KODED_ID) POTR, ';
	//30072015//tx:=tx+'  S1.KOL * l1.KI  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,NVL(S2.KODED_KODED_ID2,S2.KODED_KODED_ID))  POTR_UCHET, ';

	tx:=tx+'  S1.KOL * L1.KOL  * TRONIX_KOF_KODED(S2.SPRAV_ID,L1.KODED_KODED_ID,10)  MASS  ';
	tx:=tx+'        FROM TRONIX_SOSTAV L1, ';
	tx:=tx+'        TRONIX_SOSTAV_1LEVEL_MSC L2, ';
	tx:=tx+'        TRONIX_SPRAV S2, ';
	tx:=tx+'    (SELECT U.SPRAV_SPRAV_ID,TO_NUMBER(SUBSTR(U.N_DEP,7)) DEP_DEP_ID   FROM (SELECT TX.SPRAV_SPRAV_ID,MIN(TO_CHAR(OP.NOMER,''99999'') || TO_CHAR(OP.DEP_DEP_ID) ) N_DEP ';
	tx:=tx+'    FROM TX_ZTEXNOLOGI TX,TX_OPERATION OP  WHERE TX.ZTEXNOLOGI_ID = OP.ZTEXNOLOGI_ZTEXNOLOGI_ID  GROUP BY TX.SPRAV_SPRAV_ID ) U ) DS, ';
	tx:=tx+'   (SELECT ALL B.SPRAV_ID,SUM(B.KOL) KOL   FROM (SELECT DISTINCT C.SPRAV_ID,C.KOL,TRONIX_KOF_KODED(C.SPRAV_ID,C.KODED_ID_POTR,10) KOF ';
	tx:=tx+'   FROM (SELECT ALL TX_CAR_POTR.SPRAV_SPRAV_ID SPRAV_ID,SUM(TX_CAR_POTR.KOL) KOL, ';
	tx:=tx+'   TX_CAR_POTR.KODED_KODED_ID KODED_ID_POTR ';
	tx:=tx+'   FROM TX_CAR_POTR, ';
	tx:=tx+'   TRONIX_SPRAV ';
	tx:=tx+'   WHERE TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID ';
	tx:=tx+'   AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) = 1 ';
	tx:=tx+'  AND (TX_CAR_POTR.UZAK_UZAK_ID in (' + uzak + ') ) ';
	tx:=tx+'    AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL  ) ';
	tx:=tx+' GROUP BY TX_CAR_POTR.SPRAV_SPRAV_ID,TX_CAR_POTR.KODED_KODED_ID ) C ) B ';
	tx:=tx+'    GROUP BY B.SPRAV_ID ) S1 ';
	tx:=tx+'   WHERE NVL(L2.CAN_DO_SELF,0) = 1 ';
	tx:=tx+'    AND NVL(S2.CAN_DO_SELF,0) != 1 ';
	tx:=tx+'   AND NVL(L2.ROSSIP,0) = 0 ';
	tx:=tx+'   AND L2.SPRAV_SPRAV_ID_SOSTAV = L1.SPRAV_SPRAV_ID ';
	tx:=tx+'   AND TRONIX_SELECT_MAT(S2.TREE_TREE_ID,''01'') = 1 ';
	tx:=tx+'  AND L1.SPRAV_SPRAV_ID_SOSTAV = S2.SPRAV_ID ';
	tx:=tx+'   AND L2.SPRAV_SPRAV_ID = S1.SPRAV_ID ';
	tx:=tx+'  AND DS.SPRAV_SPRAV_ID = L1.SPRAV_SPRAV_ID ';
	tx:=tx+'  UNION ALL ';
	tx:=tx+' SELECT SP.SPRAV_SPRAV_ID SPRAV_ID,SP.DEP_DEP_ID DEP_ID,SP.KODED_KODED_ID KODED_ID,NVL(SP.KODED_KODED_ID2,SP.KODED_KODED_ID) KODED_ID_UCHET, ';
	tx:=tx+'  TO_NUMBER( NULL ) POTR,TO_NUMBER( NULL ) POTR_UCHET,SP.MASS ';
	tx:=tx+'  FROM (SELECT SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID,SP1.KODED_KODED_ID, ';
	tx:=tx+'   SP1.KODED_KODED_ID2,SUM(SP1.MASS) MASS ';
	tx:=tx+'  FROM (SELECT SP0.SPRAV_SPRAV_ID,SP0.DEP_DEP_ID,SP0.MASS,S.KODED_KODED_ID,S.KODED_KODED_ID2 ';
	tx:=tx+'  FROM (SELECT TX_ZAMEN_MAT_SP(SP.ID_SPRAV,D.ID_PROJECT, NULL , NULL , NULL ,SP.NN) SPRAV_SPRAV_ID, ';
	tx:=tx+'  TX_SKLAD_FOR(TK.DEP_DEP_ID) DEP_DEP_ID,SP.MASS ';
	tx:=tx+'  FROM TX_CAR_POTR P,KART_SP SP,TX_TEXKOMPL TK, ';
	tx:=tx+' TRONIX_DOCUMENT D,(SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''??''  AND TYPE != ''??'' ) TD ';
	tx:=tx+'        WHERE SP.ID_SPRAV = P.SPRAV_SPRAV_ID (+) ';
	tx:=tx+'   AND P.SPRAV_SPRAV_ID IS NULL ';
	tx:=tx+' AND TX_GET_TX_MARSH(''FIRST'',TX_LOAD_MARSH(SP.NN)) = TK.TEXKOMPL_ID (+) ';
	tx:=tx+' AND (D.ID_PROJECT = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
	tx:=tx+' AND D.DOCUMENT_ID = SP.NNN ';
	tx:=tx+' AND D.ID_DOCUMENT_TYPE = TD.DOCUMENT_TYPE_ID ) SP0, ';
	tx:=tx+' TRONIX_SPRAV S  WHERE SP0.SPRAV_SPRAV_ID = S.SPRAV_ID  AND NVL(S.CAN_DO_SELF,0) != 1 ) SP1 ';
	tx:=tx+' GROUP BY SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID, ';
	tx:=tx+' SP1.KODED_KODED_ID,SP1.KODED_KODED_ID2 ) SP ';
	tx:=tx+' WHERE NVL(SP.MASS,0) != 0 ) AA ';
	tx:=tx+' GROUP BY AA.SPRAV_ID,AA.KODED_ID,AA.KODED_ID_UCHET ) A ';
	tx:=tx+' WHERE ';
	tx:=tx+' A.KODED_ID = TRONIX_KODED.KODED_ID (+) ';
	tx:=tx+' AND A.KODED_ID_UCHET = KODED_UCHET.KODED_ID (+) ';
	tx:=tx+' and A.SPRAV_ID = SPR.SPRAV_ID ';
	tx:=tx+' AND L0.KOD = ''01''';
	tx:=tx+'  AND L0.TREE_ID = L1.TREE_TREE_ID ';
	tx:=tx+'  AND L1.TREE_ID = L2.TREE_TREE_ID (+) ';
	tx:=tx+'  AND L2.TREE_ID = L3.TREE_TREE_ID (+) ';
	tx:=tx+'  AND L3.TREE_ID = L4.TREE_TREE_ID (+) ';
	tx:=tx+'  AND (SPR.TREE_TREE_ID = L1.TREE_ID  OR SPR.TREE_TREE_ID = L2.TREE_ID  OR SPR.TREE_TREE_ID = L3.TREE_ID  OR SPR.TREE_TREE_ID = L4.TREE_ID ) ';
	tx:=tx+'  AND SPR.TYP_LOV_TYP_LOV_ID = TTL.TYP_LOV_ID (+) ';
	tx:=tx+'  AND SPR.TYM_LOV_TYM_LOV_ID = TTM.TYM_LOV_ID (+) ';
	tx:=tx+' AND SPR.TIP_LOV_TIP_LOV_ID = TTI.TIP_LOV_ID (+) ';
	tx:=tx+'  AND SPR.RAZ_LOV_RAZ_LOV_ID = TTR.RAZ_LOV_ID (+) ';
	tx:=tx+' AND SPR.TY_LOV_TY_LOV_ID = TTY.TY_LOV_ID (+)) I  ';
	tx:=tx+' ORDER BY I.PART,I.part2, GRP_KOD, TO_NUMBER(I.KOD) ASC ';
	//tx:=tx+' ORDER BY I.KOD, I.SPRAV_ID';
	//       ShowMEssage(tx);

	if MessageDlg('Создать отчет в новом варианте? Да - новый вариант. Нет - старый вариант.', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
	begin

		SQL := tx;

		FExcel := CreateOleObject('Excel.Application');
		FExcel.EnableEvents := False;
		FExcel.Visible := false;

		//FExcel.Workbooks.Open('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_F58.xlsx');
		FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_F58.xlsx');
		FExcel.Workbooks[1].WorkSheets[1].Name := 'Ведомость';
		Colum := FExcel.Workbooks[1].WorkSheets['Ведомость'].Columns;

		Sheet:=FExcel.Workbooks[1].WorkSheets['Ведомость'];
		//Sheet.PageSetup.PrintTitleRows := '$1:$7'; 

		oraquery3.Close;
		oraquery3.SQL.text := SQL;
		oraquery3.Open;

		e := 8;
		INC_POS := 1;

		part1 := '';
		part2 := '';
		
		while not OraQuery3.EoF Do
		begin
			if ((part1 <> '') and (part2 <> '') and ((copy(part1, 1, 2) = '01') or (copy(part1, 1, 2) = '02') or
			(copy(part1, 1, 2) = '04')) and ((part1 <> OraQuery3.FieldByName('PART').AsString)
			or (part2 <> OraQuery3.FieldByName('PART2').AsString))) then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 9]].MergeCells := true;

				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat := '@';
				Sheet.Cells[e, 2].Value := 'ИТОГО: ';
				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 10].NumberFormat := '';
				Sheet.Cells[e, 10].Formula := '=SUM(J' + inttostr(temp_priz) + ':J' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 11].NumberFormat := '';
				Sheet.Cells[e, 11].Formula := '=SUM(K' + inttostr(temp_priz) + ':K' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 12].NumberFormat := '';
				Sheet.Cells[e, 12].Formula := '=SUM(L' + inttostr(temp_priz) + ':L' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 13].NumberFormat := '';
				Sheet.Cells[e, 13].Formula := '=AVERAGE(M' + inttostr(temp_priz) + ':M' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

				Sheet.Cells[e, 15].NumberFormat := '';
				Sheet.Cells[e, 15].Formula := '=SUM(O' + inttostr(temp_priz) + ':O' + inttostr((e - 1)) + ')';
				Sheet.Cells[e, 15].HorizontalAlignment := xlCenter;
				Sheet.Cells[e, 15].VerticalAlignment := xlCenter;

				inc(e);
			end;

			if part1 <> OraQuery3.FieldByName('PART').AsString then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 14]].MergeCells := true;

				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;
				Sheet.Cells[e, 2].WrapText := false;
				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat:= '@';
				Sheet.Cells[e, 2].Value:=OraQuery3.FieldByName('PART').AsString;

				part1 := OraQuery3.FieldByName('PART').AsString;

				inc(e);
			end;

			if part2 <> OraQuery3.FieldByName('PART2').AsString then
			begin
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
				Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 14]].MergeCells := true;

				Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
				Sheet.Cells[e, 2].VerticalAlignment := xlCenter;
				Sheet.Cells[e, 2].WrapText := false;
				Sheet.Cells[e, 2].Font.Bold := True;
				Sheet.Cells[e, 2].NumberFormat:= '@';
				Sheet.Cells[e, 2].Value:=OraQuery3.FieldByName('PART2').AsString;

				part2 := OraQuery3.FieldByName('PART2').AsString;

				inc(e);
				TEMP_PRIZ := e;
			end;
			
			Sheet.range[Sheet.cells[e, 1], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;

			//pos
			Sheet.Cells[e, 1].Value := intToStr(INC_POS);
			Sheet.Cells[e, 1].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 1].VerticalAlignment := xlCenter;

			//name
			Sheet.Cells[e, 2].Value := OraQuery3.FieldByName('SUBGRP').AsString + ' ' + OraQuery3.FieldByName('GOST').AsString + ' ' + OraQuery3.FieldByName('GOST_TY').AsString + ' ' + OraQuery3.FieldByName('TYPE_RAZM').AsString;
			Sheet.Cells[e, 2].Font.Bold := false;
			Sheet.Cells[e, 2].WrapText := true;
			Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
			Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

			//marka
			Sheet.Cells[e, 3].Value := OraQuery3.FieldByName('MARKA').AsString;
			Sheet.Cells[e, 3].WrapText := true;
			Sheet.Cells[e, 3].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 3].VerticalAlignment := xlCenter;

			//gost
			Sheet.Cells[e, 4].Value := OraQuery3.FieldByName('GOST_MAT').AsString;
			Sheet.Cells[e, 4].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 4].VerticalAlignment := xlCenter;

			//kod
			Sheet.Cells[e, 5].NumberFormat := '@';
			Sheet.Cells[e, 5] := OraQuery3.FieldByName('KOD').AsString;
			Sheet.Cells[e, 5].WrapText := true;
			Sheet.Cells[e, 5].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 5].VerticalAlignment := xlCenter;

			//ed izm osn
			Sheet.Cells[e, 6].Value := OraQuery3.FieldByName('ED').AsString;
			Sheet.Cells[e, 6].WrapText := true;
			Sheet.Cells[e, 6].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 6].VerticalAlignment := xlCenter;

			//kod ed izm osn
			Sheet.Cells[e, 7].NumberFormat:= '@';
			Sheet.Cells[e, 7].Value := OraQuery3.FieldByName('CED').AsString;
			Sheet.Cells[e, 7].WrapText := true;
			Sheet.Cells[e, 7].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 7].VerticalAlignment := xlCenter;

			//ed izm uchet
			Sheet.Cells[e, 8].Value := OraQuery3.FieldByName('ED_UCHET').AsString;
			Sheet.Cells[e, 8].WrapText := true;
			Sheet.Cells[e, 8].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 8].VerticalAlignment := xlCenter;

			//kod ed izm uchet
			Sheet.Cells[e, 9].NumberFormat:= '@';
			Sheet.Cells[e, 9].Value := OraQuery3.FieldByName('CED_UCHET').AsString;
			Sheet.Cells[e, 9].WrapText := true;
			Sheet.Cells[e, 9].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 9].VerticalAlignment := xlCenter;

			//norma v osn
			Sheet.Cells[e, 10].Value := excelFloat(OraQuery3.FieldbyName('POTR').asString);
			Sheet.Cells[e, 10].WrapText := true;
			Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

			//norma v uchet
			Sheet.Cells[e, 11].Value := excelFloat(OraQuery3.FieldByName('POTR_UCHET').asString);
			Sheet.Cells[e, 11].WrapText := true;
			Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

			//massa
			Sheet.Cells[e, 12].Value := excelFloat(OraQuery3.FieldByName('kof_isp').asString);
			Sheet.Cells[e, 12].WrapText := true;
			Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

			//koeficient
			Sheet.Cells[e, 13].Value := excelFloat(OraQuery3.FieldByName('defkof').asString);
			Sheet.Cells[e, 13].WrapText := true;
			Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

			//massa specificaciya
			Sheet.Cells[e, 15].Value := excelFloat(OraQuery3.FieldByName('MASS').asString);
			Sheet.Cells[e, 15].WrapText := true;
			Sheet.Cells[e, 15].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 15].VerticalAlignment := xlCenter;

			inc(e);
			inc(INC_POS);

			OraQuery3.Next;
		end;

		if ((copy(part1, 1, 2) = '01') or (copy(part1, 1, 2) = '02') or (copy(part1, 1, 2) = '04')) then
		begin
			Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 15]].borders.linestyle := xlContinuous;
			Sheet.range[Sheet.cells[e, 2], Sheet.cells[e, 9]].MergeCells := true;

			Sheet.Cells[e, 2].Font.Bold := True;
			Sheet.Cells[e, 2].NumberFormat := '@';
			Sheet.Cells[e, 2].Value := 'ИТОГО: ';
			Sheet.Cells[e, 2].HorizontalAlignment := xlLeft;
			Sheet.Cells[e, 2].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 10].NumberFormat := '';
			Sheet.Cells[e, 10].Formula := '=SUM(J' + inttostr(temp_priz) + ':J' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 10].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 10].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 11].NumberFormat := '';
			Sheet.Cells[e, 11].Formula := '=SUM(K' + inttostr(temp_priz) + ':K' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 11].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 11].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 12].NumberFormat := '';
			Sheet.Cells[e, 12].Formula := '=SUM(L' + inttostr(temp_priz) + ':L' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 12].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 12].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 13].NumberFormat := '';
			Sheet.Cells[e, 13].Formula := '=SUM(M' + inttostr(temp_priz) + ':M' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 13].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 13].VerticalAlignment := xlCenter;

			Sheet.Cells[e, 14].NumberFormat := '';
			Sheet.Cells[e, 14].Formula := '=AVERAGE(N' + inttostr(temp_priz) + ':N' + inttostr((e - 1)) + ')';
			Sheet.Cells[e, 14].HorizontalAlignment := xlCenter;
			Sheet.Cells[e, 14].VerticalAlignment := xlCenter;

			inc(e);
		end;

		FExcel.Visible := true;
	end
	else
	begin

		FExcel:=CreateOleObject('Excel.Application');
		FExcel.EnableEvents := False;
		FExcel.Visible:=false;
		FExcel.Workbooks.Add(-4167);
		FExcel.Workbooks[1].WorkSheets[1].Name:='Ведомость';
		Colum:=FExcel.Workbooks[1].WorkSheets['Ведомость'].Columns;

		Colum.Columns[1].ColumnWidth:=1;
		Colum.Columns[2].ColumnWidth:=6;
		Colum.Columns[3].ColumnWidth:=60;
		Colum.Columns[4].ColumnWidth:=15;
		Colum.Columns[5].ColumnWidth:=15;
		Colum.Columns[6].ColumnWidth:=10;
		Colum.Columns[7].ColumnWidth:=10;
		Colum.Columns[8].ColumnWidth:=30;
		Colum.Columns[9].ColumnWidth:=20;
		Colum.Columns[10].ColumnWidth:=20;
		Colum.Columns[11].ColumnWidth:=10;
		Colum.Columns[12].ColumnWidth:=10;
		Colum.Columns[13].ColumnWidth:=10;
		Colum.Columns[14].ColumnWidth:=10;
		Colum.Columns[15].ColumnWidth:=10;
		Colum.Columns[16].ColumnWidth:=10;

		Sheet:=FExcel.Workbooks[1].WorkSheets['Ведомость'];
		Sheet.Cells[1,1]:='                             Отчет  норма материалов по '+oraQuery1.FieldByName('name').asString+' '+zak+' на '+DateToStr(now);
		Sheet.Cells[1,1].Font.Bold := True;
		Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
		//Sheet.Cells[2,1]:='Раздел';
		Sheet.Cells[2,1].Font.Bold := True;
		Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,2]:='Код группы';
		Sheet.Cells[2,2].Font.Bold := True;
		Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,3]:='Подгруппа';
		Sheet.Cells[2,3].Font.Bold := True;
		Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,4]:='Код материала ';
		Sheet.Cells[2,4].Font.Bold := True;
		Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,5]:='ГОСТ на тех.требования';
		Sheet.Cells[2,5].Font.Bold := True;
		Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,6]:='Марка';
		Sheet.Cells[2,6].Font.Bold := True;
		Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,7]:='Типоразмер';
		Sheet.Cells[2,7].Font.Bold := True;
		Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,8]:='Наименование дополнительное';
		Sheet.Cells[2,8].Font.Bold := True;
		Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,9]:='ГОСТ на марку ';
		Sheet.Cells[2,9].Font.Bold := True;
		Sheet.Cells[2,9].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,10]:='ГОСТ на сортамент ';
		Sheet.Cells[2,10].Font.Bold := True;
		Sheet.Cells[2,10].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,11]:='Основная единица ';
		Sheet.Cells[2,11].Font.Bold := True;
		Sheet.Cells[2,11].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,12]:='Норма в основной единице ';
		Sheet.Cells[2,12].Font.Bold := True;
		Sheet.Cells[2,12].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,13]:='Неосновная единица ';
		Sheet.Cells[2,13].Font.Bold := True;
		Sheet.Cells[2,13].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,14]:='Норма в неосновной единице ';
		Sheet.Cells[2,14].Font.Bold := True;
		Sheet.Cells[2,14].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,15]:='Масса по спецификации ';
		Sheet.Cells[2,15].Font.Bold := True;
		Sheet.Cells[2,15].Font.Size := Sheet.Cells[1,1].Font.Size-3;
		Sheet.Cells[2,16]:='Масса';
		Sheet.Cells[2,16].Font.Bold := True;
		Sheet.Cells[2,16].Font.Size := Sheet.Cells[1,1].Font.Size-3;

		Sheet.range[Sheet.cells[2,2],Sheet.cells[2,16]].borders.weight:=3;

		OraQuery3.SQL.Text:=tx;
		OraQuery3.ExecSQL; OraQuery3.First;

		e:=1;
		part1:='';
		part2:='';

		While NOT OraQuery3.EOF Do
		Begin

			if part1<>OraQuery3.FieldByName('PART').AsString then
			begin
				Sheet.Cells[e+2,3].Font.Bold := True;
				Sheet.Cells[e+2,3].Font.Size := Sheet.Cells[1,1].Font.Size-2;
				Sheet.Cells[e+2,3].NumberFormat:= '@';
				Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('PART').AsString;
				part1:=OraQuery3.FieldByName('PART').AsString;
				e:=e+1;
			end;

			if part2<>OraQuery3.FieldByName('PART2').AsString then
			begin
				Sheet.Cells[e+2,3].Font.Bold := True;
				Sheet.Cells[e+2,3].Font.Size := Sheet.Cells[1,1].Font.Size-4;
				Sheet.Cells[e+2,3].NumberFormat:= '@';
				Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('PART2').AsString;
				part2:=OraQuery3.FieldByName('PART2').AsString;
				e:=e+1;
			end;

			//  Sheet.range[Sheet.cells[e+2,1],Sheet.cells[e+2,15]].NumberFormat:= '@';
			//  Sheet.Cells[e+2,1]:=OraQuery3.FieldByName('PART').AsString;

			Sheet.Cells[e+2,2].NumberFormat:= '@';
			Sheet.Cells[e+2,2]:=OraQuery3.FieldByName('GRP_KOD').AsString;

			Sheet.Cells[e+2,3].NumberFormat:= '@';
			Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('SUBGRP').AsString;
			Sheet.Cells[e+2,4].NumberFormat:= '@';
			Sheet.Cells[e+2,4]:=OraQuery3.FieldByName('KOD').AsString;

			Sheet.Cells[e+2,5].NumberFormat:= '@';
			Sheet.Cells[e+2,5]:=OraQuery3.FieldByName('GOST').AsString;

			Sheet.Cells[e+2,6].NumberFormat:= '@';
			Sheet.Cells[e+2,6]:=OraQuery3.FieldByName('MARKA').AsString;

			Sheet.Cells[e+2,7].NumberFormat:= '@';
			Sheet.Cells[e+2,7]:=OraQuery3.FieldByName('TYPE_RAZM').AsString;

			Sheet.Cells[e+2,8].NumberFormat:= '@';
			Sheet.Cells[e+2,8]:=OraQuery3.FieldByName('DOP_NAME').AsString;

			Sheet.Cells[e+2,9].NumberFormat:= '@';
			Sheet.Cells[e+2,9]:=OraQuery3.FieldByName('GOST_TY').AsString;

			Sheet.Cells[e+2,10].NumberFormat:= '@';
			Sheet.Cells[e+2,10]:=OraQuery3.FieldByName('GOST_MAT').AsString;

			Sheet.Cells[e+2,11].NumberFormat:= '@';
			Sheet.Cells[e+2,11]:=OraQuery3.FieldByName('ED').AsString;

			//    Sheet.Cells[e+2,11].NumberFormat:= '@';;

			Sheet.Cells[e+2,12].NumberFormat:=AnsiChar('@');
			Sheet.Cells[e+2,12]:=StringReplace(OraQuery3.FieldByName('POTR').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);
			//    ShowMEssage(OraQuery3.FieldByName('POTR').AsString);

			Sheet.Cells[e+2,13].NumberFormat:= '@';
			Sheet.Cells[e+2,13]:=OraQuery3.FieldByName('ED_UCHET').AsString;
			//    Sheet.Cells[e+2,12].NumberFormat:=AnsiChar('@');
			// Sheet.Cells[e+2,13].NumberFormat:= '@';

			Sheet.Cells[e+2,14].NumberFormat:=AnsiChar('@');
			Sheet.Cells[e+2,14]:=StringReplace(OraQuery3.FieldByName('POTR_UCHET').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);


			Sheet.Cells[e+2,15].NumberFormat:='@';
			Sheet.Cells[e+2,15]:=StringReplace(OraQuery3.FieldByName('MASS').AsString,'.',',', [rfReplaceAll, rfIgnoreCase]);
			Sheet.Cells[e+2,16].NumberFormat:= '@';
			Sheet.Cells[e+2,16]:=OraQuery3.FieldByName('kof_isp').AsString;

			OraQuery3.Next;
			e:=e+1;
		end;

		FExcel.Visible:=true;
	end;

end;

     if form9.caption='Наряды по цеху,проекту' then
begin
  Application.CreateForm(TFNaryd_Cex_Proekt, FNaryd_Cex_Proekt);
  FNaryd_Cex_Proekt.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNaryd_Cex_Proekt.EDIT2.TEXT:=EDIT1.Text;
  FNaryd_Cex_Proekt.Caption:='Наряды: '+oraQuery1.FieldByName('name').asString;
  if EDIT1.Text <> 'All' then
  FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString
  else
  FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+'  по всем цехам';
  FNaryd_Cex_Proekt.ShowModal();
  FNaryd_Cex_Proekt.Free;
end;

     if form9.caption='Остатки трудоёмкости по МСЧ. Выберите проект' then
begin
  Application.CreateForm(TForm53, Form53);
  Form53.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form53.Caption:='Остатки трудоёмкости по МСЧ: '+oraQuery1.FieldByName('name').asString;
  Form53.ShowModal();
  Form53.Free;
end;

     if form9.caption='Наряды с привязкой к УКР с начала постройки по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm63, Form63);
  Form63.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form63.Caption:='Наряды с привязкой к УКР с начала постройки по проекту: '+oraQuery1.FieldByName('name').asString;
  Form63.ShowModal();
  Form63.Free;
end;

     if form9.caption='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm64, Form64);
  Form64.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form64.EDIT2.TEXT:=EDIT1.Text;
  Form64.Caption:='Нормированная тр-ть по цеху в разрезе профессий,разрядов,тарифных сеток: '+oraQuery1.FieldByName('name').asString;
  Form64.Caption:=Form64.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  Form64.ShowModal();
  Form64.Free;
end;

     if  form9.Caption='Суммарная нормированная тр-ть по цеху в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm65, Form65);
  Form65.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form65.EDIT2.TEXT:=EDIT1.Text;
  Form65.Caption:='Суммарная нормированная тр-ть в разрезе разрядов,тарифных сеток,профессий c привязкой к УКР: '+oraQuery1.FieldByName('name').asString;
  Form65.Caption:=Form65.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  Form65.ShowModal();
  Form65.Free;
end;

     if  form9.Caption='Незакрытые ПУЕ(без МСЧ) по цеху по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm66, Form66);
  Form66.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form66.EDIT2.TEXT:=EDIT1.Text;
  Form66.Caption:='Незакрытые ПУЕ(без МСЧ) по цеху по проекту: '+oraQuery1.FieldByName('name').asString;
  Form66.Caption:=Form66.Caption+'  ЦЕХ='+Form32.oraQuery1.FieldByName('nomer').asString;
  Form66.ShowModal();
  Form66.Free;
end;


     if form9.caption='Количество покупных изделий с привязкой к ТН,позиции СП по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm67, Form67);
  Form67.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form67.Caption:='Количество покупных изделий с привязкой к ТН,позиции СП по проекту: '+oraQuery1.FieldByName('name').asString;
  Form67.ShowModal();
  Form67.Free;
end;

     if form9.caption='Отёт по привязке ПУЕ к УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFPue_Udp_Report, FPue_Udp_Report);
  FPue_Udp_Report.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FPue_Udp_Report.Caption:='Отёт по привязке ПУЕ к УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FPue_Udp_Report.ShowModal();
  FPue_Udp_Report.Free;
end;
      if form9.caption='УДП по проекту: тр-ть норма,факт,остаток,процент выработки. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Norma_Fakt_Ostatok, FUdp_Norma_Fakt_Ostatok);
  FUdp_Norma_Fakt_Ostatok.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Norma_Fakt_Ostatok.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_Norma_Fakt_Ostatok.Caption:='УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_Norma_Fakt_Ostatok.ShowModal();
  FUdp_Norma_Fakt_Ostatok.Free;
end;

      if form9.caption='ОТК: УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUDP_OTK, FUDP_OTK);
  FUDP_OTK.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUDP_OTK.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUDP_OTK.Caption:='УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUDP_OTK.ShowModal();
  FUDP_OTK.Free;
end;

       if form9.caption='УДП: Незакрытые ТК-ПТК в закрытых УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFNEZAKR_TK_PTK_UDP_ZAKR, FNEZAKR_TK_PTK_UDP_ZAKR);
  FNEZAKR_TK_PTK_UDP_ZAKR.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.Caption:='Незакрытые ТК-ПТК в закрытых УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FNEZAKR_TK_PTK_UDP_ZAKR.ShowModal();
  FNEZAKR_TK_PTK_UDP_ZAKR.Free;
end;

       if form9.caption='УДП: Заказчик. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Zakazchik, FUdp_Zakazchik);
  FUdp_Zakazchik.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Zakazchik.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_Zakazchik.Edit3.Text:=oraQuery1.FieldByName('proekt').asString;
  FUdp_Zakazchik.Caption:='УДП Заказчика по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_Zakazchik.ShowModal();
  FUdp_Zakazchik.Free;
end;

       if form9.caption='ПДО: Отчёт по УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUdp_PDO_Report, FUdp_PDO_Report);
  FUdp_PDO_Report.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_PDO_Report.Edit2.Text:=oraQuery1.FieldByName('zavn').asString;
  FUdp_PDO_Report.Caption:='Отчёт по УДП по проекту: '+oraQuery1.FieldByName('name').asString;
  FUdp_PDO_Report.ShowModal();
  FUdp_PDO_Report.Free;
end;

      if form9.caption='ПУЕ с трудоёмкостью 0 с привязкой к УДП по проекту. Выберите проект' then
begin
  Application.CreateForm(TFUdp_Pue_Norma_Zero, FUdp_Pue_Norma_Zero);
  FUdp_Pue_Norma_Zero.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FUdp_Pue_Norma_Zero.Caption:='Проект: '+Form9.oraQuery1.FieldByName('name').asString;
  FUdp_Pue_Norma_Zero.Caption:=FUdp_Pue_Norma_Zero.Caption+'  ПУЕ с трудоёмкостью 0';
  FUdp_Pue_Norma_Zero.ShowModal();
  FUdp_Pue_Norma_Zero.Free;
end;


    if form9.caption='Количество изделий МСЧ по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm55, Form55);
  Form55.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form55.Caption:='Количество изделий МСЧ по проекту: '+oraQuery1.FieldByName('name').asString;
  Form55.ShowModal();
  Form55.Free;
end;

    if form9.caption='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm57, Form57);
  Form57.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form57.Caption:='Оборудование из комплектной поставки для склада ЗИП по проекту. Выберите проект: '+oraQuery1.FieldByName('name').asString;
  Form57.ShowModal();
  Form57.Free;
end;

    if form9.caption='СП Ведомости снабжения группы 237 по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm60, Form60);
  Form60.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form60.Caption:='СП Ведомости снабжения группы 237 по проекту: '+oraQuery1.FieldByName('name').asString;
  Form60.ShowModal();
  Form60.Free;
end;

    if form9.caption='Оборудование по проекту. Выберите проект' then
begin
  Application.CreateForm(TFEquipment, FEquipment);
  FEquipment.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  FEquipment.Caption:='Оборудование по проекту: '+oraQuery1.FieldByName('name').asString;
  FEquipment.ShowModal();
  FEquipment.Free;
end;

    if form9.caption='Перечень закрытой оснастки по проекту. Выберите проект' then
begin
  Application.CreateForm(TForm61, Form61);
  Form61.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form61.Caption:='Перечень закрытой оснастки по проекту: '+oraQuery1.FieldByName('name').asString;
  Form61.ShowModal();
  Form61.Free;
end;

if form9.caption='Формрование ведомости комплектации запуска.' then
begin
 Form43.Label2.Caption:=oraQuery1.FieldByName('project_id').asString;
  Form43.Caption:='Формрование ведомости комплектации запуска.';
  Close();
  Form43.ShowModal();

end;

if form9.caption='Выберите проект для анализа' then
begin
 Form34.Label4.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form34.Edit2.Text:=oraQuery1.FieldByName('name').asString;
  Close();

end;


if form9.caption='Отчет по заявкам' then
begin
  Form20.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form20.Caption:='Отчет по заявкам';
  Form20.ShowModal();

end;

if form9.caption='Отчет планируемой трудоемкости' then
begin
  Form21.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form21.Caption:='Отчет планируемой трудоемкости';
  Form21.ShowModal();

end;

if form9.caption='Отчет по выполнению ведомостей (Для склада ЗИП)' then
begin
  Application.CreateForm(TForm22, Form22);
  Form22.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form22.Caption:='Отчет по выполнению ведомостей (Для склада) c Приходами!   '+oraQuery1.FieldByName('name').asString;
  Form22.ShowModal();
  Form22.Free;
end;

  if form9.caption='Отчет по Отчет по ТН (материал изделие)' then
begin
  Form25.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form25.Caption:='Отчет по Отчет по ТН (материал изделие)';
  Form25.ShowModal();

end;


  if form9.caption='Ведомость материалов' then
begin
  Form26.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form26.Caption:='Ведомость материалов(без крепежа)';
  Form26.ShowModal();

end;

    if form9.caption='Потребность по материалам в разрезе чертежа' then
begin
  Form27.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form27.Caption:='Потребность в разрезе чертежа';
  Form27.EDIT2.TEXT:=EDIT1.Text;
  Form27.ShowModal();

end;

    if form9.caption='Отчет по поиску позиций с приоритетом 0 по проекту' then
begin
  Form35.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form35.Caption:='Отчет по поиску позиций с приоритетом 0 по проекту';
  Form35.ShowModal();

end;

    if form9.caption='Построечный журнал' then
begin
  Form36.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form36.Caption:='Построечный журнал по '+oraQuery1.FieldByName('zavn').asString;
  Form36.ShowModal();
end;

    if form9.caption='Ведомость комплектации по помещениям.' then
begin
Form10.Caption:='Ведомость комплектации по помещениям '+OraQuery1.FieldByName('name').AsString;;
 //ShowMessage(oraQuery1.FieldByName('project_id').asString);
 Form10.Label3.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form10.ShowModal();

end;

    if form9.caption='Изделия с незаполненой трудоемкостью ТНа' then
begin
Form46.Caption:='Изделия с незаполненой трудоемкостью ТНа. По '+OraQuery1.FieldByName('name').AsString;;
Form46.Label1.Caption:=oraQuery1.FieldByName('project_id').asString;
Form46.Label2.Caption:='По '+oraQuery1.FieldByName('zavn').asString;
 Form46.ShowModal();

end;

if (form9.caption='Проверка документов на согласовании к справочнику.')   then
begin
 Form9.Close();
 Form38.Caption:='Проверка документов на согласовании к справочнику по '+OraQuery1.FieldByName('name').AsString;

 // Старая версия отчета по документам согласования ///
tx:=' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' МСЧ не проставлен в справочнике '' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+'  and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec  ';
tx:=tx+' and SUBSTR(kod_vedomstva, 1, 1)=''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= id_sprav)<>1 ';
tx:=tx+' union all ';
tx:=tx+' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' МСЧ  в справочнике код не 3'' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+'  and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec ';
tx:=tx+' and SUBSTR(kod_vedomstva, 1, 1)<>''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= id_sprav)=1 ';
tx:=tx+' union all ';
tx:=tx+' Select doc.NUM_SPEC doc, posiz poz,obozn,name,kol_vo,kod_ed,kod_vedomstva , id_sprav, id_l, '' Нет позиции в справочнике'' pr from tronix.vimpel_, ';
tx:=tx+' (Select ID_SPEC, NUM_SPEC, name_spec from  tronix.spec where id_project='+oraQuery1.FieldByName('project_id').asString+' and soglasovano is null) doc ';
tx:=tx+' where id_doc= doc.id_spec ';
tx:=tx+' and id_sprav is null ';

/// Новая версия отчета по SP
tx:=' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav, '' МСЧ не проставлен в справочнике '' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and SUBSTR(sp.vz, 1, 1)=''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= sp.id_sprav)<>1 ';
tx:=tx+' union all ';
tx:=tx+' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav,'' МСЧ  в справочнике код не 3'' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and SUBSTR(sp.vz, 1, 1)<>''3'' ';
tx:=tx+' and (Select can_do_self from tronix.sprav where sprav_id= sp.id_sprav)=1 ';
tx:=tx+' union all ';
///*/*** для Аксаны
tx:=tx+'Select  do.ident,sp.poz||'' ''||sp.podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav, '' НеТъ Код Ведомости '' pr ';
tx:=tx+' from  tronix.sp sp, tronix.document do ';
tx:=tx+' where ';
tx:=tx+' do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and sp.nnn=do.document_id ';
tx:=tx+' and type_str<>1 ';
tx:=tx+' and  VZ is null ';
tx:=tx+' union all ';
///******************
tx:=tx+' Select do.ident doc,poz||'' ''||podpoz poz, sp.obozn, sp.name, sp.kol kol_vo, sp.kode kod_ed, sp.vz kod_vedomstva, id_sprav,'' Нет позиции в справочнике'' pr ';
tx:=tx+' from tronix.sp sp, tronix.document do ';
tx:=tx+' where sp.nnn=do.document_id ';
tx:=tx+' and do.id_project='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and sp.vz is not null ';
tx:=tx+' and sp.id_sprav is null ';

Form38.OraQuery1.SQL.Text:=tx;

// Form38.Label3.Caption:=+oraQuery1.FieldByName('project_id').asString;
 Form38.ShowModal();
end;
 if (form9.caption='Потребность по материалам и оборудованию общая по проекту')   then
begin
 Form9.Close();
 Form38.Caption:='Потребность по материалам и оборудованию общая по проекту '+OraQuery1.FieldByName('name').AsString;
tx:='  Select psprav,(Select kod from tronix.sprav where sprav_id=psprav) kod,';
//tx:=tx+' (Select name from tronix.sprav where sprav_id= psprav) name,';
tx:=tx+' (Select name from tronix.sprav where sprav_id= psprav)||'' ''||(Select name from tronix.tip_lov where tip_lov_id=(Select tip_lov_tip_lov_id from tronix.sprav where sprav_id= psprav))';
tx:=tx+'||'' ''||(Select name from tronix.raz_lov where raz_lov_id=(Select raz_lov_raz_lov_id from tronix.sprav where sprav_id= psprav))';
tx:=tx+'||'' ''||(Select name from tronix.ty_lov where ty_lov_id=(Select ty_lov_ty_lov_id from tronix.sprav where sprav_id= psprav)) ';
tx:=tx+'||'' ''||(Select name from tronix.tym_lov where tym_lov_id=(Select tym_lov_tym_lov_id from tronix.sprav where sprav_id= psprav)) as name, ';
tx:=tx+' ROUND(sum(sum_potr),6) suma_potr,(Select namek from tronix.koded where koded_id=(Select koded_koded_id from tronix.sprav where sprav_id=psprav)) ed1,';
tx:=tx+' nvl(sum_zap_kol,0) vidano,ROUND((sum(sum_potr)-nvl(sum_zap_kol,0)),4) def from (';
tx:=tx+' Select  potr.sprav_sprav_id psprav, potr.kol*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr,';
tx:=tx+' z.sum_zap_kol ';
tx:=tx+' from tx_car_potr potr,';
tx:=tx+' (Select z_sprav_id,sum(zap_kol) sum_zap_kol from (';
tx:=tx+' Select zap.sprav_sprav_id z_sprav_id,(zap.kol_uchet*tronix_kof_koded(zap.sprav_sprav_id,zap.koded_koded_id_uchet, (Select koded_koded_id from tronix.sprav where sprav_id=zap.sprav_sprav_id))) zap_kol';
tx:=tx+'  from tronix.zapas zap';
tx:=tx+' where  zap.project_project_id='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and nvl((Select can_do_self from tronix.sprav where sprav_id=zap.sprav_sprav_id),0) =0';
tx:=tx+' and zap.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id='+EDIT1.Text+' or dep_id='+EDIT1.Text+'))';
tx:=tx+' group by z_sprav_id) z';
tx:=tx+' where';
tx:=tx+'  potr.project_project_id='+oraQuery1.FieldByName('project_id').asString;
tx:=tx+' and nvl((Select can_do_self from tronix.sprav where sprav_id=potr.sprav_sprav_id),0) =0';
tx:=tx+' and potr.sprav_sprav_id=z.z_sprav_id(+)';
tx:=tx+' and potr.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id='+EDIT1.Text+' or dep_id='+EDIT1.Text+' ))';
tx:=tx+' group by psprav,sum_zap_kol';
tx:=tx+' order by kod';
 Form38.OraQuery1.SQL.Text:=tx;
 Form38.Label1.Caption:=oraQuery1.FieldByName('project_id').asString;
 Form38.Label2.Caption:=EDIT1.Text;
 Form38.ShowModal();
end;

  if (form9.caption='Проверка масс (спецификация и справочник)')   then
begin
  Form9.Close();
  Form27.Caption:='Проверка масс (спецификация и справочник). По '+OraQuery1.FieldByName('name').AsString;;
  Form27.Edit1.text:=oraQuery1.FieldByName('project_id').asString;
  Form27.ShowModal();
end;


if form9.caption='Техкомплекты в обеспечении материалами с признаком поступления'
then
 begin

tx:='Select (Select nomer from tx_texkompl where texkompl_id=tex_texkompl_id) nomer, ';
tx:=tx+' (Select kod from tronix.sprav where sprav_id=sprav_sprav_id) kod, ';
tx:=tx+'  tronix_sp_name(sprav_sprav_id) name, ';
tx:=tx+' (Select namek from tronix.koded where koded_id=tmat.koded_koded_id) ed, ';
tx:=tx+' decode(kol,null,''  '',kol) kol, ';
tx:=tx+' (Select name from nordsy.type_relation_poz where type_relation_poz_id=(Select type_relation_type_relation_id from tx_texkompl where texkompl_id= tmat.tex_texkompl_id))tn ';
tx:=tx+' from nordsy.tx_mat tmat ';
tx:=tx+' where type_relation_type_relation_id is not null ';
tx:=tx+' and sprav_sprav_id is not null ';
tx:=tx+' and  tex_texkompl_id in (Select texkompl_id from tx_texkompl where project_project_id='+ oraQuery1.FieldByName('project_id').asString+')';
tx:=tx+' and (Select type_tex_type_tex_id from tx_texkompl where texkompl_id= tmat.tex_texkompl_id) in (7,12) ';
  OraQuery3.SQL.Text:=tx;
 OraQuery3.ExecSQL;
 if OraQuery3.RecordCount>0 then
 begin
  OraQuery3.First;
  Application.CreateForm(TForm49, Form49);

  Form49.Caption:='Материалы с признаком поступления по '+OraQuery1.FieldByName('name').AsString;
       Form49.Show();
  With Form49 Do
    begin
       len_DATA:=OraQuery3.RecordCount;
       HEAD_TEXT:='A1;20;true;A1;F2;Материалы с признаком поступления по '+OraQuery1.FieldByName('name').AsString;
       COLUM_PARAM:='30;15;112,86;8,29;9;20;END;';
       COLUM_NAME:='4;Номер ТК;1;12;Код;1;12;Наименование;1;12;Ед.Изм.;1;12;Количество;1;12;Признак;1;12;END;';
       TAB_COLUM_PARAM:='@;@;@;@;@;@;@';
       TAB_COLUM_PARAM_ADD:='centre;xlLeft;true;no;centre;xlCenter;true;no;centre;xlLeft;true;no;down;xlRight;true;no;up;xlCenter;true;no;centre;xlRight;true;true;centre;xlCenter;true;true;';

       SetLength(DATA,len_DATA);
       e:=0;
       While NOT OraQuery3.EOF DO
          begin
       DATA[e]:= oraQuery3.FieldByName('nomer').asString+'|'+
       oraQuery3.FieldByName('kod').asString+'|'+
       oraQuery3.FieldByName('name').asString+'|'+
       oraQuery3.FieldByName('ed').asString+'|'+
       oraQuery3.FieldByName('kol').asString+'|'+
       oraQuery3.FieldByName('tn').asString;
        e:=e+1;
       OraQuery3.Next;
       end;
  //     ShowMEssage(IntTostr(e)+' '+IntTostr(len_DATA)+' '+IntTostr(OraQuery3.RecordCount));
      Otchet(Nil);
    end;
    end
    Else ShowMessage('Нет позиций по проекту '+OraQuery1.FieldByName('name').AsString);

end;

end;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery2.Close;
    OraQuery1.Close;
    OraQuery3.Close;
end;

procedure TForm9.Button1Click(Sender: TObject);
begin
 Edit2.Text:='All';
 if form9.caption='Наряды по цеху,проекту' then
begin
 Application.CreateForm(TFNaryd_Cex_Proekt, FNaryd_Cex_Proekt);
 FNaryd_Cex_Proekt.Edit1.Text:='All';
 FNaryd_Cex_Proekt.EDIT2.TEXT:=EDIT1.Text;
 FNaryd_Cex_Proekt.Caption:='Наряды';
 if EDIT1.Text <> 'All' then
 FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+' по всем проектам ЦЕХА='+Form32.oraQuery1.FieldByName('nomer').asString
 else
 FNaryd_Cex_Proekt.Caption:=FNaryd_Cex_Proekt.Caption+' по всем цехам и проектам';
 FNaryd_Cex_Proekt.ShowModal();
 FNaryd_Cex_Proekt.Free;
 end;

  if form9.caption='Перечень закрытой оснастки по проекту. Выберите проект' then
begin
 Application.CreateForm(TForm61, Form61);
 Form61.Edit1.Text:='All';
 Form61.Caption:='Оснастка закрытая по всем проектам';
 Form61.ShowModal();
 Form61.Free;
 end;

 end;

procedure TForm9.Button2Click(Sender: TObject);
var uzak, uzaki : string;
e : integer;

const
DATEMASK = 'DD.MM.YYYY';

begin
if (self.caption = 'Дефицит по номенклатуре (новый)') then
begin
  uzak := '-1';
	for e := 0 to uzaks.Items.Count - 1 do
		if uzaks.Checked[e] then
    begin
			uzak := uzak + ', ' + uzaks_memory.Items[e];
      uzaki := uzaki + ' ' + uzaks.Items[e];
    end;

	if uzak = '-1' then
	begin
		showmessage('Выберите минимум 1 заказ!');
		exit;
	end;

  Application.CreateForm(TDIF_OTCH_FORM, DIF_OTCH_FORM);
  if Form1.SCAlive then
  begin
    Label2.Caption := '(' + uzak + ')';
    DIF_OTCH_FORM.Caption := form9.Caption + ' ' + uzaki;
    DIF_OTCH_FORM.ShowModal();
  end;
  DIF_OTCH_FORM.Free;

  exit;
end;

if (self.caption = 'Требования по дефициту') then
begin
  uzak := '-1';
	for e := 0 to uzaks.Items.Count - 1 do
		if uzaks.Checked[e] then
    begin
			uzak := uzak + ', ' + uzaks_memory.Items[e];
      uzaki := uzaki + ' ' + uzaks.Items[e];
    end;

	if uzak = '-1' then
	begin
		showmessage('Выберите минимум 1 заказ!');
		exit;
	end;

  Application.CreateForm(Ttrnomen, trnomen);

  trnomen.Caption := form9.Caption + ': ' + uzaki;
  trnomen.OraQueryS.SQL.Text := 'SELECT TXK.NOMER as PUE, SPRAVA.KOD as KOD, SPRAVO.KOD as VYD, TN.NOMER as NOMER, TP.NAME as TYPE, '
  + 'decode(DPO.TYPE_DEP_TYPE_DEP_ID, 2, DPO.NOMER, DPT.NOMER) as CEH, DPP.NOMER as SKLAD, DCG.IDENT as CHERT, ROUND(TNMAT.KOL_UCHET, 5) as KOL_UCHET, '
  + 'ROUND(TNMAT.KOL, 5) as KOL, TO_CHAR(TN.DATE_DOK, ' + char(39) + DATEMASK + char(39) + ') as DATEC, '
  + 'TO_CHAR(TN.USER_DATE1, ' + char(39) + DATEMASK + char(39) + ') as DATE1, TO_CHAR(TN.USER_DATE2, ' + char(39) + DATEMASK + char(39) + ') as DATE2, '
  + 'TO_CHAR(TN.DATE_INS, ' + char(39) + DATEMASK + char(39) + ') as DATE3, TO_CHAR(TN.USER_DATE4, ' + char(39) + DATEMASK + char(39) + ') as DATE4 '
  + 'FROM (select defa.s_i as sprav_id from (select src.SPRAV_ID as s_i, (src.POTR - src.ZAPAS) as d, '
  + '((src.POTR * tronix_kof_koded(src.sprav_id, src.koded_potr, src.koded_uchet)) - (src.ZAPAS * tronix_kof_koded(src.sprav_id, src.koded_potr, '
  + 'src.koded_uchet))) as d_u from (select tt.sprav_id as sprav_id, sum(tt.POTR) as potr, sum(tt.ZAPAS) as zapas, tt.koded_potr as koded_potr, '
  + 'tt.koded_uchet as koded_uchet from (select tx.sprav_sprav_id as sprav_id, nvl(tx.KOL, 0) as POTR, nvl(tx.ZAPAS_POST, 0) AS ZAPAS, '
  + 'tx.KODED_KODED_ID as koded_potr, nvl(sp.koded_koded_id2, sp.koded_koded_id) as koded_uchet from tx_car_potr tx, tronix_sprav sp '
  + 'where tx.sprav_sprav_id = sp.sprav_id(+) and tx.uzak_uzak_id in (' + uzak + ')) tt group by tt.sprav_id, tt.koded_potr, tt.koded_uchet) src ) defa '
  + 'where (defa.d > 0 or defa.d_u > 0)) deficit, TRONIX_SPRAV SPRAVA, TRONIX_SPRAV SPRAVO, TRONIX.TYPE_TTN TP, TRONIX.TTN TN, TRONIX.TTN_MAT TNMAT, '
  + 'KADRY_DEP DPO, KADRY_DEP DPT, KADRY_DEP DPP, TRONIX.SP SPG, TRONIX.DOCUMENT DCG, TX_TEXKOMPL TXK WHERE TN.UZAK_UZAK_ID in (' + uzak + ') AND TN.TYPE_TTN_TYPE_TTN_ID in '
  + '(5, 43, 44, 26, 59, 11) '
  + 'AND TNMAT.TTN_TTN_ID = TN.TTN_ID AND ((TNMAT.SPRAV_SPRAV_ID = deficit.sprav_id AND TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB is null) OR '
  + 'TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB = deficit.sprav_id) AND DECODE(TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB, null, TNMAT.SPRAV_SPRAV_ID, TNMAT.SPRAV_SPRAV_ID_ZAM_SNAB) '
  + '= SPRAVA.SPRAV_ID(+) AND TNMAT.TEXKOMPL_TEXKOMPL_ID = TXK.TEXKOMPL_ID(+) AND TNMAT.SPRAV_SPRAV_ID = SPRAVO.SPRAV_ID(+) AND TN.DEP_DEP_ID_TO = DPO.DEP_ID(+) AND DPO.DEP_DEP_ID = DPT.DEP_ID(+) AND '
  + 'TN.TYPE_TTN_TYPE_TTN_ID = TP.TYPE_TTN_ID(+) AND (TN.DATE_INS is null or TN.USER_DATE3 is null) AND TN.DEP_DEP_ID_FROM = DPP.DEP_ID(+) AND '
  + 'TNMAT.SP_SP_ID = SPG.NN(+) AND SPG.NNN = DCG.DOCUMENT_ID(+)';
  //Clipboard.AsText := trnomen.OraQueryS.SQL.Text;
  //showmessage(trnomen.OraQueryS.SQL.Text);

  trnomen.ShowModal();
  trnomen.Free;

  exit;
end;

DBGridEh1DblClick(nil); //отчет по материальной ведомости!!!

end;

procedure TForm9.DBGridEh1CellClick(Column: TColumnEh);
var FILTER_S : string;
begin
if ((self.Caption = 'Отчет по материальной ведомости') or (self.caption = 'Дефицит по номенклатуре (новый)')(* or (self.caption = 'Требования по дефициту')*)) then
begin

  uzaks_memory.Clear;
  uzaks.Clear;

  if not allprs.Checked then
    FILTER_S := '(zak.DATE_END is null or TO_CHAR(zak.DATE_END) = ' + char(39) + ' ' + char(39) + ')'
  else
    FILTER_S := '(1 = 1)';

  OraQuery2.Close;
  OraQuery2.SQL.Text := 'Select zak.zak, feb.text, zak.id_project, zak.nn from tronix.feb_name feb, tronix.zakaz zak '
  + 'where zak.name = feb.nn and ' + FILTER_S + ' order by zak.zak desc';
  OraQuery2.Open;

  OraQuery2.First;
  while not OraQuery2.Eof do
  begin
    uzaks.Items.Add(OraQuery2.FieldByName('zak').AsString + ' ' + OraQuery2.FieldByName('text').asString);
    uzaks_memory.Items.Add(OraQuery2.FieldByName('nn').asString);

    OraQuery2.Next;
  end;
  OraQuery2.First;

  exit;
end;
end;

function TForm9.excelFloat(s : string) : real;
begin
  excelFloat := strtofloat('0' + DecimalSeparator + '0');
  if s <> '' then
  begin
    if DecimalSeparator = '.' then
      excelFloat := strtofloat(StringReplace(s, ',', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]))
    else if DecimalSeparator = ',' then
      excelFloat := strtofloat(StringReplace(s, '.', DecimalSeparator, [rfReplaceAll, rfIgnoreCase]))
  end;
end;

end.
