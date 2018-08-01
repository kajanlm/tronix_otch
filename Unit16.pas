unit Unit16;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExcelXP, OleServer,
  StdCtrls,DBGridEhImpExp, GridsEh;

type
  TDIF_OTCH_FORM = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1tnomer: TStringField;
    OraQuery1tname: TStringField;
    OraQuery1skod: TStringField;
    OraQuery1spname: TStringField;
    OraQuery1psname: TStringField;
    OraQuery1summ_nado: TFloatField;
    OraQuery1summ_zavod: TFloatField;
    OraQuery1summ_vcexe: TFloatField;
    OraQuery1summ_vidano: TFloatField;
    OraQuery1date_start: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    OraQuery1TNA: TStringField;
    OraQuery1dep_nomer: TStringField;
    OraQuery1koded_e: TStringField;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DIF_OTCH_FORM: TDIF_OTCH_FORM;

implementation

uses Unit15, Unit5;

{$R *.dfm}

procedure TDIF_OTCH_FORM.FormShow(Sender: TObject);
var tx:string;
begin
tx := '';

tx := tx + 'Select  tnomer,tname,dep_nomer,skod,spName, psname,summ_nado,summ_zavod, summ_vcexe, summ_vidano, DECODE(date_start,null,NULL,date_start) as date_start, ';
tx := tx + 'nordsy.Get_TTN(sprav_id,project_id) TNA, (Select namek from  tronix.koded where koded_ed=koded_id) koded_e ';
tx := tx + 'from ';
tx := tx + '( ';
tx := tx + 'Select tx_id.texkompl_ID , tx_id.nomer tnomer,tx_id.name tname, tx_id.dep_dep_id ,dep.nomer dep_nomer, tx_id.project_project_id project_id, ';
tx := tx + 'TRONIX_SP_NAME(sprav.sprav_id) spname, sprav.kod skod, sprav.sprav_id sprav_id, sum(tx_car.kol) summ_nado, sum(tx_car.zapas_post) summ_zavod, sum(tx_car.zapas_post_tr) summ_vcexe, ';
tx := tx + 'tx_car.sp_id_from, ';
tx := tx + 'nvl( ( Select Sum(zap.kol_uchet*tronix_kof_koded(sprav.sprav_id,zap.koded_koded_id_uchet, tx_car.koded_koded_id)) from tronix.zapas zap ';
tx := tx + 'where zap.sp_sp_id = tx_car.sp_id_from ';
tx := tx + 'and zap.sprav_sprav_id = sprav.sprav_id), 0) summ_vidano, ';
tx := tx + 'do.ident||'' ''||''Poz(''||sp.poz||'') ''||sp.name  psname, ';
tx := tx + 'tx_id.pdate_beg date_start, tx_car.koded_koded_id koded_ed ';
tx := tx + 'from tronix.sprav sprav, tx_car_potr tx_car, kadry_dep dep, tronix.sp sp, tronix.document do, ';
tx := tx + '(Select dwn.texkompl_ID, dwn.dep_dep_id, dwn.nomer, dwn.pdate_beg, dwn.name, dwn.project_project_id, dwn.otk_end ';
tx := tx + 'from tx_texkompl	dwn ';
tx := tx + 'connect by prior dwn.texkompl_id = dwn.texkompl_texkompl_ID ';
tx := tx + 'start	with dwn.texkompl_ID = ' + #39 + Form15.Edit3.text + #39 + ' ) tx_id ';
tx := tx + 'where tx_id.texkompl_ID = tx_car.texkompl_texkompl_id(+) ';
tx := tx + 'and sprav.sprav_id = tx_car.SPRAV_SPRAV_ID ';

if Form15.ComboBox1.ItemIndex = 2 then
begin
  tx := tx + 'and sprav.can_do_self is not null ';
  tx := tx + 'and sprav.can_do_self <> 0 ';
end;

if Form15.ComboBox1.ItemIndex = 1 then
begin
  tx := tx + 'and tronix_select_mat( sprav.tree_tree_id, ''01'' ) = 0 ';
  tx := tx + 'and (sprav.can_do_self is null or sprav.can_do_self = 0) ';
  //tx := tx + '        and (Select count(*) from  tronix.sostav where sprav_sprav_id_sostav=sprav.sprav_id) =0 ';
end;

if Form15.ComboBox1.ItemIndex = 0 then
begin
  tx := tx + 'and tronix_select_mat( sprav.tree_tree_id, ''01'' ) = 1 ';
  tx := tx + 'and (sprav.can_do_self is null or sprav.can_do_self = 0) ';
  //tx := tx + '        and (Select count(*) from  tronix.sostav where sprav_sprav_id_sostav=sprav.sprav_id) >0  ';
end;

tx := tx + 'and dep.dep_id = tx_id.dep_dep_id ';
tx := tx + 'and sp.nn(+) = tx_car.sp_id_from ';
tx := tx + 'and sp.nnn = do.document_id(+) ';

if Form15.Edit5.text = '%' then
  tx := tx + 'and dep.nomer like ''%'' '
else
  //tx := tx + '        and dep.nomer like '+#39+Form15.Edit5.text+'-%'' ';
  tx := tx + 'and dep.dep_id in (Select dep_id from nordsy.dep connect by prior dep_id = dep_dep_id start with dep_id = (Select dep_id from nordsy.dep where nomer = ' + #39 + Form15.Edit5.text + #39 + ')) ';

//tx := tx + '        and tx_id.otk_end is not null '; видимо ошибка
tx := tx + 'group by sprav.sprav_id, tx_id.texkompl_ID, tx_id.project_project_id, tx_car.koded_koded_id, tx_id.nomer, tx_id.name, tx_id.dep_dep_id, sprav.Name, sprav.kod, sprav.kod, dep.nomer, do.ident||'' ''||''Poz(''||sp.poz||'') ''||sp.name, ';
tx := tx + 'tx_id.pdate_beg, tx_car.sp_id_from ';
tx := tx + 'order by tx_id.nomer ';
tx := tx + ') ttt ';

if Form15.CheckBox1.Checked = false then
begin
  tx := tx + 'where date_start <= TO_DATE(''' + Form15.Edit1.Text + ''', ''DD.MM.YYYY'') ';
  tx := tx + 'and date_start is not NULL ';
  tx := tx + 'and Round(summ_vidano-summ_nado,4) < 0';
end;

ShowMessage(tx);
oraQuery1.SQL.Text:=tx;
oraQuery1.ExecSQL;

end;

procedure TDIF_OTCH_FORM.Button1Click(Sender: TObject);
var
ExcelApplication:TExcelApplication;
Range, Sheet: VAriant;




begin
ExcelApplication := TExcelApplication.Create(Self);
ExcelApplication.ConnectKind := ckNewInstance;
ExcelApplication.Connect;
ExcelApplication.AutoQuit := true;
ExcelWorkbook1.ConnectTo(ExcelApplication.Workbooks.Add(EmptyParam,LOCALE_USER_DEFAULT));
ExcelWorkBook1.Activate(LOCALE_USER_DEFAULT);
ExcelWorksheet1.ConnectTo(ExcelApplication.ActiveWorkbook.ActiveSheet as ExcelWorkSheet);


  Sheet := ExcelWorkbook1.Sheets[1];
  Range := Sheet.Columns;


 with SaveDialog1 do
  begin
  InitialDir :=ExtractFilePath(Application.ExeName);
  Filter :='Exell files (*.xls)|*.xls|All files (*.*)|*.*';
   if SaveDialog1.Execute then begin
  SaveDBGridEhToExportFile(TDBGridEhExportAsXLS,DBGridEh1,SaveDialog1.FileName+ '.xls' ,true);
  end;
end;
end;
end.
