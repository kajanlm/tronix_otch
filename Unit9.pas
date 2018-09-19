unit Unit9;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, Ora, Grids, DBGridEh, StdCtrls, GridsEh,
  ExcelXP, OleServer,ComObj;

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
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    temp_priz:integer;
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

uses Unit10, Unit15, Unit16, Unit20, Unit21, Unit22, Unit23, Unit25, Unit26,
  Unit27, Unit35, Unit36, Unit37, Unit38, Unit43, Unit45, Unit46, Unit34,
  Unit47, Unit49, Unit50;

{$R *.dfm}

procedure TForm9.DBGridEh2DblClick(Sender: TObject);
begin
label2.Caption:=OraQuery2.FieldByName('nn').AsString;
if form9.caption='Отчет по нарядам' then
begin
Form10.Caption:='Отчет по нарядам';
Form10.ShowModal();
end;
if form9.caption='Дефицит по номенклатуре' then
begin

if MessageDlg('Запуститить модуль дефицита в новом варианте? Да - запустить. Нет - запустить старую версию модуля', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
  Application.CreateForm(TDIF_OTCH_FORM, DIF_OTCH_FORM);

  if DIF_OTCH_FORM.SCAlive then
  begin
    DIF_OTCH_FORM.Caption := form9.Caption + ' ' + dbgrideh2.DataSource.DataSet.FieldByName('ZAK').asString;
    DIF_OTCH_FORM.ShowModal();
  end;
  DIF_OTCH_FORM.Free;

  end
  else
    Form15.ShowModal();

  exit;
end;

if form9.caption='Отчет по трудоемкости (Новый)' then
begin
Form10.Caption:='Отчет по трудоемкости (Новый)';
Form10.ShowModal();
end;

 if (form9.caption='Выберите что сравниваем') then
begin
Form23.EDIT1.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label1.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

 if (form9.caption='Выберите с чем сравниваем') then
begin
Form23.EDIT2.Text:= OraQuery1.FieldByName('name').AsString;
Form23.Label2.Caption:= OraQuery2.FieldByName('nn').AsString;
Form9.Close();
end;

if form9.caption='Отчет по материальной ведомости' then
begin
 temp_priz:=1;
 DBGridEh1DblClick(nil);
end;

end;
procedure TForm9.FormShow(Sender: TObject);
var tx: string;
begin
 OraQuery2.Open;
  OraQuery1.Open;
  Form9.DBgridEH2.Visible:=true;
  Label3.Visible:=false;
   ComboBox1.Visible:=false;

if (form9.caption='Отчет по заявкам') or (form9.caption='Отчет планируемой трудоемкости') or
(form9.caption='Отчет по выполнению ведомостей (Для склада)') or (form9.caption='Отчет по Отчет по ТН (материал изделие)')
or (form9.caption='Ведомость материалов')  or (form9.caption='Потребность по материалам в разрезе чертежа')
or  (form9.caption='Отчет по поиску позиций с приоритетом 0 по проекту')
or  (form9.caption='Построечный журнал') or (form9.caption='Ведомость комплектации по помещениям.')
or  (form9.caption='Проверка документов на согласовании к справочнику.')
or  (form9.caption='Потребность по материалам и оборудованию общая по проекту')
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
end;

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
tx,zak, uzak,part1,part2: string;
e: integer;
FExcel, WorkBook, SheetActive, Sheet, Colum : OleVariant;
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


if form9.caption='Отчет по материальной ведомости' then
begin
  if temp_priz=1 then zak:= DBGridEh2.DataSource.DataSet.FieldByName('zak').AsString
    else zak:='';
    temp_priz:=0;

 if zak<>'' then
 uzak:=DBGridEh2.DataSource.DataSet.FieldByName('nn').AsString
 else
 uzak:='null';





tx:=' SELECT I.PART,I.PART2,SUBSTR(I.KOD,1,4) GRP_KOD,I.SUBGRP,I.GOST_CHART_POST GOST,I.KOD,I.MARKA,I.TYPE_RAZM,I.DOP_NAME,I.GOST_TY,I.GOST_MAT, ';
tx:=tx+' RTRIM(I.MARKA || DECODE(I.TYPE_RAZM, NULL ,'''','' '')  || I.TYPE_RAZM  || DECODE(I.GOST_TY, NULL ,'''','' '')  || I.GOST_TY  || DECODE(I.GOST_MAT, NULL ,'''','' '')  || I.GOST_MAT ) MAT, ';
tx:=tx+' UPPER(I.ED) ED,REPLACE(TO_CHAR(I.POTR),''.'','','') POTR,UPPER(I.ED_UCHET) ED_UCHET,REPLACE(TO_CHAR(I.POTR_UCHET),''.'','','') POTR_UCHET,';
//tx:=tx+' REPLACE(TO_CHAR(I.MASS),''.'','','') MASS ';
//tx:=tx+' REPLACE(TO_CHAR(DECODE(I.MASS,0,I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,I.KODED_KODED_ID,10)),''.'','','')) MASS ';
//tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS ,round(POTR*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
tx:=tx+' DECODE(NVL(I.MASS,0),0,(I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10)),I.MASS) MASS , ';
//tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
tx:=tx+' round((I.POTR*TRONIX_KOF_KODED(I.SPRAV_ID,(Select koded_id from TRONIX_KODED where NAMEK=I.ED),10))*';
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
tx:=tx+' AND K.KI>0),0),9) as kof_isp';

//nvl(1/tronix.kof_ispolz_mat(sprav_id),0),9) kof_isp';
tx:=tx+'   FROM (SELECT DISTINCT REPLACE(UPPER(L1.NAME),CHR(9),'' '') PART, ';
tx:=tx+' REPLACE(UPPER(L2.name),CHR(9),'' '') PART2, ';
tx:=tx+' REPLACE(UPPER(SPR.NAME),CHR(9),'' '') SUBGRP, ';
tx:=tx+' A.SPRAV_ID, ';
tx:=tx+' SPR.KOD,REPLACE(UPPER(LTRIM(SPR.DOP_NAME)),CHR(9),'' '') DOP_NAME,A.KODED_ID_UCHET,A.KODED_ID, ';
tx:=tx+' TRONIX_KODED.NAMEK ED, ';
tx:=tx+' KODED_UCHET.NAMEK ED_UCHET, ';
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
/// вот тут поменял неправильно было
//tx:=tx+' SUM(KART_SP.MASS) MASS   FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
///Замена
///tx:=tx+' SUM(DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,KART_SP.MASS,TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
tx:=tx+'DECODE((Select count(*) from tronix.sostav where sprav_sprav_id=KART_SP.ID_SPRAV),0,SUM(KART_SP.MASS)/count(KART_SP.NN),SUM(TX_CAR_POTR.KOL* TRONIX_KOF_KODED(TX_CAR_POTR.SPRAV_SPRAV_ID ,TX_CAR_POTR.KODED_KODED_ID,10))) MASS, ';
tx:=tx+'  KART_SP.id_sprav ';
////
tx:=tx+' FROM TX_CAR_POTR,KART_SP,TRONIX_SPRAV ';
tx:=tx+'   WHERE TX_CAR_POTR.SPRAV_SPRAV_ID = TRONIX_SPRAV.SPRAV_ID ';
tx:=tx+'  AND NVL(TRONIX_SPRAV.CAN_DO_SELF,0) != 1 ';
tx:=tx+'  AND TX_CAR_POTR.SP_ID_FROM = KART_SP.NN  AND (TX_CAR_POTR.UZAK_UZAK_ID = '+ uzak +' OR '+uzak +' IS NULL ) ';
tx:=tx+'  AND (TX_CAR_POTR.PROJECT_PROJECT_ID = '+oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
tx:=tx+' GROUP BY TX_CAR_POTR.SPRAV_SPRAV_ID,NVL(TRONIX_SPRAV.KODED_KODED_ID2,TRONIX_SPRAV.KODED_KODED_ID), ';
tx:=tx+' TRONIX_SPRAV.KODED_KODED_ID, ';
/// меняю ниже добавляю группировку
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
///tx:=tx+'         (SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''ТХ''  AND TYPE != ''ВЗ'' ) TD  WHERE SP.NN = P.SP_ID_FROM (+) ';
///tx:=tx+'         AND P.SP_ID_FROM IS NULL  AND TX_GET_TX_MARSH(''FIRST'',TX_LOAD_MARSH(SP.NN)) = TK.TEXKOMPL_ID ';
///tx:=tx+'        AND (D.ID_PROJECT =' +oraQuery1.FieldByName('project_id').asString+'  OR '+oraQuery1.FieldByName('project_id').asString+' IS NULL ) ';
///tx:=tx+'      AND D.DOCUMENT_ID = SP.NNN  AND D.ID_DOCUMENT_TYPE = TD.DOCUMENT_TYPE_ID ) SP0, ';
///tx:=tx+'     TRONIX_SPRAV S  WHERE SP0.SPRAV_SPRAV_ID = S.SPRAV_ID  AND NVL(S.CAN_DO_SELF,0) != 1 ) SP1 ';
///tx:=tx+'       GROUP BY SP1.SPRAV_SPRAV_ID,SP1.DEP_DEP_ID ) SP ';
///tx:=tx+'    WHERE BB.SPRAV_ID || ''|''  || BB.DEP_ID  = SP.SPRAV_SPRAV_ID (+)   || ''|''  || SP.DEP_DEP_ID (+) ';

tx:=tx+' SELECT SPRAV_ID,DEP_ID,KODED_ID,KODED_ID_UCHET, ';
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
tx:=tx+'    AND TX_CAR_POTR.SP_ID_FROM IS NULL  AND (TX_CAR_POTR.UZAK_UZAK_ID ='+ uzak + ' OR '+ uzak + ' IS NULL ) ';
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
tx:=tx+'  AND (TX_CAR_POTR.UZAK_UZAK_ID ='+ uzak +' OR '+uzak +' IS NULL ) ';
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
tx:=tx+' TRONIX_DOCUMENT D,(SELECT DOCUMENT_TYPE_ID DOCUMENT_TYPE_ID   FROM TRONIX_DOCUMENT_TYPE  WHERE TYPE != ''ТХ''  AND TYPE != ''ВЗ'' ) TD ';
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
tx:=tx+' ORDER BY I.PART,I.part2,GRP_KOD ';
//tx:=tx+' ORDER BY I.KOD, I.SPRAV_ID';
       //       ShowMEssage(tx);
//////////////////********************************************
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
 e:=1;part1:='';part2:='';
While NOT OraQuery3.EOF Do
 Begin
     if part1<>OraQuery3.FieldByName('PART').AsString
       then
         begin
          Sheet.Cells[e+2,3].Font.Bold := True;
          Sheet.Cells[e+2,3].Font.Size := Sheet.Cells[1,1].Font.Size-2;
          Sheet.Cells[e+2,3].NumberFormat:= '@';
          Sheet.Cells[e+2,3]:=OraQuery3.FieldByName('PART').AsString;
         part1:=OraQuery3.FieldByName('PART').AsString;
         e:=e+1;
         end;

           if part2<>OraQuery3.FieldByName('PART2').AsString
       then
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
  //    Sheet.cells[e+2,2].VerticalAlignment := xlCenter;
     //     Sheet.cells[e+2,2].HorizontalAlignment := xlCenter;
       OraQuery3.Next;
   e:=e+1;

   end;
    FExcel.Visible:=true;

//////////////////****************************************


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

if form9.caption='Отчет по выполнению ведомостей (Для склада)' then
begin
  Form22.Edit1.Text:=oraQuery1.FieldByName('project_id').asString;
  Form22.Caption:='Отчет по выполнению ведомостей (Для склада) c Приходмами!';
  Form22.ShowModal();

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

end.
