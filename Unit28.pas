unit Unit28;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm28 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1name: TStringField;
    OraQuery1sprkod: TStringField;
    OraQuery1potr: TFloatField;
    OraQuery1zavod: TFloatField;
    OraQuery1cex: TFloatField;
    OraQuery1vidano: TFloatField;
    OraQuery1nomer_tk: TStringField;
    OraQuery1up_texkompl_id: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    OraQuery1potr_dop: TFloatField;
    OraQuery1potr_koded: TStringField;
    OraQuery1potr_koded_dop: TStringField;
    OraQuery1izmdatpoz: TStringField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

uses Unit27;

{$R *.dfm}

procedure TForm28.FormShow(Sender: TObject);
var tx:string;
begin
if (Form27.CheckBox6.Checked=true) then
 begin

tx:=' Select  name,sprkod, round(sum(potr),4) potr ,potr_koded,round(sum(potr_dop),4) potr_dop,potr_koded_dop, round(sum(zavod),4) zavod,round(sum(cex),4) cex,round(sum(vidano),4) vidano, izmdatpoz, '''' up_texkompl_id, sprav_name as nomer_tk from ( ';

tx:=tx+' Select DECODE(name,'''',(Select  ident from tronix.document where document_id =dop_chert),name) name,sprkod,sprav_name,  potr ,potr_koded,potr_dop,potr_koded_dop,  zavod,cex,vidano,izmdatpoz ';
tx:=tx+' from ( ';
tx:=tx+' Select name,sprkod,sprav_name , sum(potr) potr ,potr_koded,sum(potr_dop) potr_dop,potr_koded_dop, sum(zavod) zavod,sum(cex) cex, sum(vidano) vidano,dop_chert,max(substr(izmdatpoz,1,10)) izmdatpoz from ( ';

tx:=tx+' Select potr.sprav_sprav_id spr_id,(potr.kol*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) potr , ';
tx:=tx+'  (Select namek from tronix.koded where koded_id=spr.koded_koded_id) potr_koded, ';
tx:=tx+'  (potr.kol/tronix_kof_koded(spr.sprav_id,spr.koded_koded_id2, potr.koded_koded_id)) potr_dop , ';
tx:=tx+'  (Select namek from tronix.koded where koded_id=spr.koded_koded_id2) potr_koded_dop, ';
tx:=tx+'  (potr.zapas_post*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) zavod, ';
tx:=tx+'   (potr.zapas_post_tr*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) cex, ';
tx:=tx+' tronix.sp_name(spr.sprav_id) as sprav_name, ';
tx:=tx+'  (Select sum(zap.kol_uchet*tronix_kof_koded(potr.sprav_sprav_id,zap.koded_koded_id_uchet, potr.koded_koded_id)) from tronix.zapas zap ';
tx:=tx+'  where zap.sp_sp_id=potr.sp_id_from';
tx:=tx+'   and zap.sprav_sprav_id=potr.sprav_sprav_id) vidano, ';
tx:=tx+'  potr.texkompl_texkompl_id texkompl, ';

tx:=tx+' decode(substr(do.ident||'' ''||''Поз(''||sp.poz||'') ''||sp.podpoz,1,5),'' Поз('',tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,potr.sprav_sprav_id,''sprav''),';
tx:=tx+' decode(tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,sp.nn,''sp''),'' '',nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.up_nn),nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.nn))) izmdatpoz,';

tx:=tx+' (Select nnn from tronix.sp where  nn=(select min(sp_sp_id) from nordsy.tx_mat  where tex_texkompl_id=potr.texkompl_texkompl_id )) as dop_chert, ';
//tx:=tx+' (Select nnn from tronix.sp where  nn=(select min(sp_id_from) from tx_car_potr where texkompl_texkompl_id=  potr.texkompl_texkompl_id )) as dop_chert, ';
tx:=tx+'  do.ident as name, sp.nn spnn, sp.kod spkod, ';
tx:=tx+'  spr.name sprname, spr.kod sprkod, ';
tx:=tx+'  (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) sprav_vname ';
tx:=tx+'  from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
tx:=tx+'  where spr.sprav_id=potr.sprav_sprav_id ';
tx:=tx+'  and (spr.can_do_self is null or spr.can_do_self =0) ';
tx:=tx+'   and sp.nn(+)= potr.sp_id_from ';
tx:=tx+'   and sp.nnn=do.document_id(+) ';

if Form27.RadioGroup1.ItemIndex=0 then
tx:=tx+'  and  (INSTR(UPPER(spr.name),''ТРУБЫ'',1)!=0 or INSTR(UPPER(spr.name),''ТРУБА'',1)!=0) '
else if Form27.RadioGroup1.ItemIndex=1 then
tx:=tx+'  and  (INSTR(UPPER(spr.name),''ОТВОД'',1)!=0) '
else if Form27.RadioGroup1.ItemIndex=2 then
tx:=tx+'  and  (INSTR(UPPER(spr.name),''УГОЛОК'',1)!=0) '
else if Form27.RadioGroup1.ItemIndex=4 then
tx:=tx+'  and  (INSTR(UPPER(spr.name),''ИЗОЛЯЦ'',1)!=0) '
else if Form27.RadioGroup1.ItemIndex=3 then
tx:=tx+'  and  (INSTR(UPPER(spr.name),''ЗАХЛОПКА'',1)!=0 or INSTR(UPPER(spr.name),''КРАН'',1)!=0 or INSTR(UPPER(spr.name),''КЛАПАН'',1)!=0 or INSTR(UPPER(spr.name),''ЗАДВИЖКА'',1)!=0)';

//tx:=tx+'  and  (INSTR(UPPER(spr.name),''ТРУБЫ'',1)!=0 or INSTR(UPPER(spr.name),''ТРУБА'',1)!=0) ';

tx:=tx+'  and potr.texkompl_texkompl_id in ';
tx:=tx+'  (Select  tx.texkompl_id ';
tx:=tx+'  from tronix.sp sp, tronix.document do,nordsy.tx_mat tmat,tx_texkompl tx ';
tx:=tx+'  where ';
tx:=tx+' do.document_id in ('+Edit1.text+')';
tx:=tx+'  and  sp.nnn=do.document_id ';
tx:=tx+'  and  sp.nn=tmat.sp_sp_id ';
tx:=tx+'  and tx.texkompl_id=tmat.tex_texkompl_id ';
if Edit3.Text<>'All' then
tx:=tx+' and tx.dep_dep_id in  (Select dep_id from nordsy.dep where dep_dep_id='+Edit3.Text+' or dep_id='+Edit3.Text+') ';
tx:=tx+' )) ';

tx:=tx+' group by  name,sprkod,sprav_name,potr_koded,potr_koded_dop,dop_chert))';
tx:=tx+' group by  name,sprkod,potr_koded,potr_koded_dop,sprav_name,izmdatpoz';
tx:=tx+' order by name,sprkod';
//ShowMEssage(tx);
  With OraQuery1 Do 
     begin
        FieldByName('name').DisplayLAbel:='Чертеж ';
        FieldByName('sprkod').DisplayLAbel:='Код ';
        FieldByName('potr').DisplayLAbel:='Потребность ';
        FieldByName('potr_koded').DisplayLAbel:='Осн. Ед ';
        FieldByName('potr_dop').DisplayLAbel:='Потребность в доп ед ';
        FieldByName('potr_koded_dop').DisplayLAbel:='Доп ед ';
        FieldByName('zavod').DisplayLAbel:='Завод ';
        FieldByName('cex').DisplayLAbel:='В цехе ';
        FieldByName('vidano').DisplayLAbel:='Выдано ';
        FieldByName('nomer_tk').DisplayLAbel:='Полное наименование ';
        FieldByName('izmdatpoz').DisplayLAbel:=' ';
        FieldByName('up_texkompl_id').DisplayLAbel:='  ';
     end;

 end
else
  begin ///*****
//tx:='  Select name,sprname,sprkod, potr,potr_koded,potr_dop,potr_koded_dop, zavod, cex, vidano,nomer_tk,sprname1,up_texkompl_id, pr, spr_id,'''' nomer_tk,'''' up_texkompl_id ';

tx:='  Select DECODE(substr(name,2,5),''Поз()'',(Select ident||'' ''||name from tronix.document where document_id =dop_chert),name) name,sprkod, potr,potr_koded,potr_dop,potr_koded_dop, zavod, cex, vidano,nomer_tk,izmdatpoz,sprname1 as up_texkompl_id ';
tx:=tx+' from (';
tx:=tx+'  Select  name,max(dop_chert) dop_chert,sprname,sprkod,round(sum(suma_potr),4) potr,potr_koded ,round(sum(suma_potr_dop),4) potr_dop,potr_koded_dop, ';
tx:=tx+' round(sum(suma_zavod),4) zavod,round(sum(suma_vcexe),4) cex,nvl(round(summ_vidano,4),0) vidano,nomer_tk,tronix_sp_name(spr_id) sprname1,max(substr(izmdatpoz,1,10)) izmdatpoz,up_texkompl_id,''clear'' pr, spr_id ';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' Select potr.sprav_sprav_id spr_id,(potr.kol*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_potr , ';
tx:=tx+' (Select namek from tronix.koded where koded_id=spr.koded_koded_id) potr_koded, ';
tx:=tx+' (potr.kol/tronix_kof_koded(spr.sprav_id,spr.koded_koded_id2, potr.koded_koded_id)) suma_potr_dop , ';
tx:=tx+' (Select namek from tronix.koded where koded_id=spr.koded_koded_id2) potr_koded_dop, ';
tx:=tx+' (potr.zapas_post*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_zavod, ';
tx:=tx+'  (potr.zapas_post_tr*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_vcexe, ';
tx:=tx+' (Select sum(zap.kol_uchet*tronix_kof_koded(potr.sprav_sprav_id,zap.koded_koded_id_uchet, potr.koded_koded_id)) from tronix.zapas zap ';
tx:=tx+' where zap.sp_sp_id=potr.sp_id_from ';
tx:=tx+'  and zap.sprav_sprav_id=potr.sprav_sprav_id) summ_vidano, ';
tx:=tx+' potr.texkompl_texkompl_id texkompl, ';
tx:=tx+' (Select nnn from tronix.sp where  nn=(select min(sp_sp_id) from nordsy.tx_mat  where tex_texkompl_id=potr.texkompl_texkompl_id )) as dop_chert, ';

tx:=tx+' do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, sp.nn spnn, sp.kod spkod, ';

tx:=tx+' decode(substr(do.ident||'' ''||''Поз(''||sp.poz||'') ''||sp.podpoz,1,5),'' Поз('',tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,potr.sprav_sprav_id,''sprav''),';
tx:=tx+' decode(tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,sp.nn,''sp''),'' '',nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.up_nn),nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.nn))) izmdatpoz,';

//tx:=tx+' decode(substr(do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz,1,5),'' Поз('',tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,potr.sprav_sprav_id,''sprav''),nordsy.tk_izm(potr.texkompl_texkompl_id,potr.sp_id_from,potr.sp_id_from)) izmdatpoz, ';
//decode(tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,sp.nn,'sp'),' ',nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.up_nn),nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.nn)) izz,
//tx:=tx+' DECODE(tx_tk_sp_poz_izm(potr.texkompl_texkompl_id,sp.nn),'' '',nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.up_nn),nordsy.tk_izm(potr.texkompl_texkompl_id,sp.nn,sp.nn)) as izmdatpoz, ';

tx:=tx+' tronix_sp_name(potr.sprav_sprav_id) sprname,spr.kod sprkod, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=potr.texkompl_texkompl_id) nomer_tk, ';

//tx:=tx+' spr.name sprname, spr.kod sprkod, ';

tx:=tx+' (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) spavname, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=nordsy.GET_UP_TTN(potr.texkompl_texkompl_id,7)) up_texkompl_id ';
tx:=tx+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
tx:=tx+' where spr.sprav_id=potr.sprav_sprav_id ';
//tx:=tx+' and tronix_select_mat( spr.tree_tree_id, ''01'' ) = 1 ';
tx:=tx+' and (spr.can_do_self is null or spr.can_do_self =0) ';
tx:=tx+'  and sp.nn(+)= potr.sp_id_from ';
tx:=tx+'  and sp.nnn=do.document_id(+) ';
tx:=tx+' and potr.texkompl_texkompl_id in ';
tx:=tx+' (Select  tx.texkompl_id ';
tx:=tx+' from tronix.sp sp, tronix.document do,nordsy.tx_mat tmat,tx_texkompl tx ';
tx:=tx+' where ';
tx:=tx+' do.document_id in ('+Edit1.text+')';
tx:=tx+' and  sp.nnn=do.document_id ';
tx:=tx+' and  sp.nn=tmat.sp_sp_id ';
tx:=tx+' and tx.texkompl_id=tmat.tex_texkompl_id ';
if Edit3.Text<>'All' then
tx:=tx+' and tx.dep_dep_id in  (Select dep_id from nordsy.dep where dep_dep_id='+Edit3.Text+' or dep_id='+Edit3.Text+') ';
//tx:=tx+' and tx.dep_dep_id in  (Select dep_id from nordsy.dep where dep_dep_id=4017 or dep_id=4017) ';
tx:=tx+'  group by texkompl_id) ';
tx:=tx+' ) ';


tx:=tx+' group by nomer_tk,name, spkod,spr_id,sprname,sprkod,summ_vidano,up_texkompl_id, potr_koded,potr_koded_dop ';

tx:=tx+' order by name)';

if Form27.CheckBox2.Checked=true then
tx:=tx+' where  potr-cex>0';
////if    (Form27.CheckBox5.Checked=true) and (Form27.CheckBox2.Checked=true) then
////tx:=tx+' and  INSTR(UPPER(name),''ТРУБА'',1)!=0'
////else if (Form27.CheckBox5.Checked=true) and (Form27.CheckBox2.Checked=false) then
////tx:=tx+'where INSTR(UPPER(sprname1),''ТРУБА'',1)!=0';
if Form27.CheckBox2.Checked=true then
tx:=tx+' where  potr-cex>0';

if (Form27.RadioGroup1.ItemIndex=0) and (Form27.CheckBox2.Checked=true) then
tx:=tx+' and  INSTR(UPPER(sprname1),''ТРУБА'',1)!=0'
else if (Form27.RadioGroup1.ItemIndex=0) and (Form27.CheckBox2.Checked=false) then
tx:=tx+'where INSTR(UPPER(sprname1),''ТРУБА'',1)!=0';

if (Form27.RadioGroup1.ItemIndex=2) and (Form27.CheckBox2.Checked=true) then
tx:=tx+' and  INSTR(UPPER(sprname1),''УГОЛОК'',1)!=0'
else if (Form27.RadioGroup1.ItemIndex=2) and (Form27.CheckBox2.Checked=false) then
tx:=tx+'where INSTR(UPPER(sprname1),''УГОЛОК'',1)!=0';

if (Form27.RadioGroup1.ItemIndex=1) and (Form27.CheckBox2.Checked=true) then
tx:=tx+' and  INSTR(UPPER(sprname1),''ОТВОД'',1)!=0'
else if (Form27.RadioGroup1.ItemIndex=1) and (Form27.CheckBox2.Checked=false) then
tx:=tx+'where INSTR(UPPER(sprname1),''ОТВОД'',1)!=0';

if (Form27.RadioGroup1.ItemIndex=4) and (Form27.CheckBox2.Checked=true) then
tx:=tx+' and  INSTR(UPPER(sprname1),''ИЗОЛЯЦ'',1)!=0'
else if (Form27.RadioGroup1.ItemIndex=4) and (Form27.CheckBox2.Checked=false) then
tx:=tx+'where INSTR(UPPER(sprname1),''ИЗОЛЯЦ'',1)!=0';

if (Form27.RadioGroup1.ItemIndex=3) and (Form27.CheckBox2.Checked=true) then
tx:=tx+' and (INSTR(UPPER(sprname1),''ЗАХЛОПКА'',1)!=0 or INSTR(UPPER(sprname1),''КРАН'',1)!=0 or INSTR(UPPER(sprname1),''КЛАПАН'',1)!=0  or INSTR(UPPER(sprname1),''ЗАДВИЖКА'',1)!=0)'
else if (Form27.RadioGroup1.ItemIndex=3) and (Form27.CheckBox2.Checked=false) then
tx:=tx+'where INSTR(UPPER(sprname1),''ЗАХЛОПКА'',1)!=0 or INSTR(UPPER(sprname1),''КРАН'',1)!=0 or INSTR(UPPER(sprname1),''КЛАПАН'',1)!=0  or INSTR(UPPER(sprname1),''ЗАДВИЖКА'',1)!=0';
  With OraQuery1 Do
     begin
        FieldByName('name').DisplayLAbel:='Чертеж ';
        FieldByName('sprkod').DisplayLAbel:='Код ';
        FieldByName('potr').DisplayLAbel:='Потребность ';
        FieldByName('potr_koded').DisplayLAbel:='Осн. Ед ';
        FieldByName('potr_dop').DisplayLAbel:='Потребность в доп ед ';
        FieldByName('potr_koded_dop').DisplayLAbel:='Доп ед ';
        FieldByName('zavod').DisplayLAbel:='Завод ';
        FieldByName('cex').DisplayLAbel:='В цехе ';
        FieldByName('vidano').DisplayLAbel:='Выдано ';
        FieldByName('nomer_tk').DisplayLAbel:='Техкомплект ';
        FieldByName('izmdatpoz').DisplayLAbel:='Дата ';
        FieldByName('up_texkompl_id').DisplayLAbel:='Полное наименование ';
     end;


  end; //*******************
   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;

procedure TForm28.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm28.Button1Click(Sender: TObject);
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
