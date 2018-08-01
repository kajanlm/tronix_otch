unit Unit39;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS, StdCtrls, ComCtrls;

type
  TForm39 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    DBGridEh2: TDBGridEh;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    OraQuery3: TOraQuery;
    OraDataSource3: TOraDataSource;
    DBGridEh3: TDBGridEh;
    TabSheet4: TTabSheet;
    OraQuery4: TOraQuery;
    OraDataSource4: TOraDataSource;
    DBGridEh4: TDBGridEh;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    TabSheet5: TTabSheet;
    OraQuery5: TOraQuery;
    OraDataSource5: TOraDataSource;
    DBGridEh5: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure DBGridEh2GetCellParams(Sender: TObject; Column: TColumnEh;
      AFont: TFont; var Background: TColor; State: TGridDrawState);
    procedure CheckBox1Click(Sender: TObject);
    procedure DBGridEh2DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGridEh5DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
      tk_poz:integer;
  end;

var
  Form39: TForm39;

implementation

uses Unit36, Unit40, Unit30;

{$R *.dfm}

procedure TForm39.FormShow(Sender: TObject);
begin
 if tk_poz=1 then
  begin
  with OraQuery1   do
     begin
//        ShowMessage(Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString);
  SQL.Text:='Select tk1,tk2,tk3,tk4, ';
  SQL.Text:=SQL.Text+' (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tk1))||chr(13)||chr(10)||nom1 nom1, ';
  SQL.Text:=SQL.Text+' (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tk2))||chr(13)||chr(10)||nom2 nom2, ';
  SQL.Text:=SQL.Text+' (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tk3))||chr(13)||chr(10)||nom3 nom3, ';
  SQL.Text:=SQL.Text+' (Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_texkompl where texkompl_id=tk4))||chr(13)||chr(10)||nom4 nom4, ';
  SQL.Text:=SQL.Text+' pdate_beg1,pdate_beg2,pdate_beg3,pdate_beg4, ';
  SQL.Text:=SQL.Text+' pdate_end1,pdate_end2,pdate_end3,pdate_end4, ';
  SQL.Text:=SQL.Text+' otk_end1 otk_end1,otk_end2 otk_end2,otk_end3 otk_end3,otk_end4 otk_end4';
  SQL.Text:=SQL.Text+' from ( ';
  SQL.Text:=SQL.Text+'Select tk1,';
  SQL.Text:=SQL.Text+'(Select nomer||chr(13)||chr(10)||name from tx_texkompl where texkompl_id=tk1) nom1,';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk1) pdate_beg1, ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk1) pdate_end1,  ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk1) otk_end1,  ';
  SQL.Text:=SQL.Text+'tk2,  ';
  SQL.Text:=SQL.Text+'(Select nomer||chr(13)||chr(10)||name  from tx_texkompl where texkompl_id=tk2) nom2,  ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk2) pdate_beg2,  ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk2) pdate_end2,  ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk2) otk_end2,  ';
  SQL.Text:=SQL.Text+'tk3,  ';
  SQL.Text:=SQL.Text+'(Select nomer||chr(13)||chr(10)||name  from tx_texkompl where texkompl_id=tk3) nom3,  ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk3) pdate_beg3,  ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk3) pdate_end3,  ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk3) otk_end3,  ';
  SQL.Text:=SQL.Text+'tk4,  ';
  SQL.Text:=SQL.Text+'(Select nomer||chr(13)||chr(10)||name  from tx_texkompl where texkompl_id=tk4) nom4,  ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk4) pdate_beg4,  ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk4) pdate_end4,  ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk4) otk_end4  ';
  SQL.Text:=SQL.Text+'from (  ';
  SQL.Text:=SQL.Text+'SELECT TX_GRAFIC_TX.GET_TX('+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',R1.N,1) tk1,TX_GRAFIC_TX.GET_TX('+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',R1.N,2) tk2,TX_GRAFIC_TX.GET_TX('+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',R1.N,3) tk3,  ';
  SQL.Text:=SQL.Text+'TX_GRAFIC_TX.GET_TX('+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+',R1.N,4) tk4 FROM TX_ROW_NUM_I R1  ';
  SQL.Text:=SQL.Text+'where R1.N <=NORDSY.GRAFIC_TX.N_MARSH('+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+'))  ';
  SQL.Text:=SQL.Text+')';
 //ShowMessage(SQL.Text);
   ExecSQL;
  end;

 //end; // условие что это ТК

 with OraQuery2   do
     begin
  SQL.Text:=' Select (Select nomer from tx_texkompl where texkompl_id=tk1)  nom1, ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk1) pdate_beg1,';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk1) pdate_end1,';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk1) otk_end1, ';
  SQL.Text:=SQL.Text+'(Select nomer from tx_texkompl where texkompl_id=tk2)  nom2, ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk2) pdate_beg2, ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk2) pdate_end2, ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk2) otk_end2, ';
  SQL.Text:=SQL.Text+'(Select nomer from tx_texkompl where texkompl_id=tk3)  nom3, ';
  SQL.Text:=SQL.Text+'(Select pdate_beg from tx_texkompl where texkompl_id=tk3) pdate_beg3, ';
  SQL.Text:=SQL.Text+'(Select pdate_end from tx_texkompl where texkompl_id=tk3) pdate_end3, ';
  SQL.Text:=SQL.Text+'(Select otk_end from tx_texkompl where texkompl_id=tk3) otk_end3, ';
  SQL.Text:=SQL.Text+'(Select nomer from tx_texkompl where texkompl_id=tk4)  nom4, ';
  SQL.Text:=SQL.Text+' (Select pdate_beg from tx_texkompl where texkompl_id=tk4) pdate_beg4, ';
  SQL.Text:=SQL.Text+' (Select pdate_end from tx_texkompl where texkompl_id=tk4) pdate_end4, ';
  SQL.Text:=SQL.Text+' (Select otk_end from tx_texkompl where texkompl_id=tk4) otk_end4, ddd ,tk1,tk2,tk3,tk4';
  SQL.Text:=SQL.Text+' from( ';
  SQL.Text:=SQL.Text+' Select tk1,tk2,tk3,tk4,ddd from ( ';
  SQL.Text:=SQL.Text+' Select  Decode((SUBSTR(kaka,1,1)),''0'',SUBSTR(kaka,4,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+1,7))) tk1,';
  SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,12,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+9,7))) tk2, ';
  SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,20,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+17,7))) tk3, ';
  SQL.Text:=SQL.Text+' Decode(SUBSTR(kaka,1,1),0,SUBSTR(kaka,28,7),Decode((SUBSTR(kaka,1,1)),''3'',SUBSTR(kaka,INSTR(kaka,'','',3)+25,7))) tk4, ';
  SQL.Text:=SQL.Text+' SUBSTR(kaka,1,1) ddd  --kaka ';
  SQL.Text:=SQL.Text+' from    ';
  SQL.Text:=SQL.Text+'( ';
  SQL.Text:=SQL.Text+' Select  nordsy.load_marsh(nn) kaka from ';
  SQL.Text:=SQL.Text+'(Select nn from ';
  SQL.Text:=SQL.Text+'(Select nn,kol   from  tronix.sp ';
  SQL.Text:=SQL.Text+' connect by prior nn=up_nn ';
  SQL.Text:=SQL.Text+' start with nn in (Select  sp_sp_id from nordsy.tx_mat ';
  SQL.Text:=SQL.Text+' where tex_texkompl_id='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')) ';
 // SQL.Text:=SQL.Text+' where kol<>0 ';
  SQL.Text:=SQL.Text+' ) ';
  SQL.Text:=SQL.Text+' ) ';
  SQL.Text:=SQL.Text+' group by kaka ';
  SQL.Text:=SQL.Text+' ) ';
  SQL.Text:=SQL.Text+' ) ';
 // SQL.Text:=SQL.Text+' where ((ddd=3) or (ddd=0)) ';


SQL.Text:=SQL.Text+' where ((tk1 is not null) and (tk1='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')) or ((tk2 is not null) and ';
  SQL.Text:=SQL.Text+'(tk2='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')) or ((tk3 is not null) and (tk3='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')) ';
SQL.Text:=SQL.Text+'  or ((tk3 is not null) and (tk3='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')) and ((ddd=3) or (ddd=0))';
//showMessage(SQL.Text);
  ExecSQL;
     end;

with OraQuery3   do
     begin
SQL.Text:='Select * from ( ';
SQL.Text:=SQL.Text+'Select psprav,tronix.sp_name(psprav) name, ';
SQL.Text:=SQL.Text+'(Select kod from tronix.sprav where sprav_id=psprav) kod,sum(sum_potr) suma_potr, ';
SQL.Text:=SQL.Text+'sum(sum_potr_tr) sum_potr_tr,sum(sum_potr_cex) sum_potr_cex,';
SQL.Text:=SQL.Text+'  nvl(sum_zap_kol,0) sum_zap_kol from ( ';
SQL.Text:=SQL.Text+'Select  potr.sprav_sprav_id psprav, potr.kol*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr, ';
SQL.Text:=SQL.Text+'potr.zapas_post*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr_tr, ';
SQL.Text:=SQL.Text+'potr.zapas_post_tr*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr_cex, ';
SQL.Text:=SQL.Text+'z.sum_zap_kol ';
SQL.Text:=SQL.Text+'from tx_car_potr potr, ';
SQL.Text:=SQL.Text+'(Select  z_sprav_id,sum(zap_kol) sum_zap_kol from ';
SQL.Text:=SQL.Text+'(Select decode(sprav_sprav_id_zam_snab,null,z_sprav_id,sprav_sprav_id_zam_snab) z_sprav_id,zap_kol  from ( ';
SQL.Text:=SQL.Text+'Select  zap.sprav_sprav_id z_sprav_id, zap.sprav_sprav_id_zam_snab, (zap.kol_uchet*tronix_kof_koded(zap.sprav_sprav_id,zap.koded_koded_id_uchet, (Select koded_koded_id from tronix.sprav where sprav_id=zap.sprav_sprav_id))) zap_kol ';
SQL.Text:=SQL.Text+' from tronix.zapas zap ';
SQL.Text:=SQL.Text+'where  zap.texkompl_texkompl_id in (Select texkompl_id from tx_texkompl connect by prior texkompl_id=texkompl_texkompl_id start with texkompl_id='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')' ;
SQL.Text:=SQL.Text+'and tronix_select_mat((Select tree_tree_id from tronix.sprav where sprav_id=zap.sprav_sprav_id), ''01'') =1)) ';
SQL.Text:=SQL.Text+'group by z_sprav_id) z ';
SQL.Text:=SQL.Text+'where ';
SQL.Text:=SQL.Text+' potr.texkompl_texkompl_id in (Select texkompl_id from tx_texkompl connect by prior texkompl_id=texkompl_texkompl_id start with texkompl_id='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')' ;
SQL.Text:=SQL.Text+'and tronix_select_mat((Select tree_tree_id from tronix.sprav where sprav_id=potr.sprav_sprav_id), ''01'') =1 ';
SQL.Text:=SQL.Text+'and potr.sprav_sprav_id=z.z_sprav_id(+) ';
SQL.Text:=SQL.Text+') ';
SQL.Text:=SQL.Text+'group by psprav,sum_zap_kol ';
SQL.Text:=SQL.Text+'order by kod ';
SQL.Text:=SQL.Text+') ';
if  CheckBox1.Checked=true then
SQL.Text:=SQL.Text+'where ((round(suma_potr,3)<>round(sum_zap_kol,3)) and (round(suma_potr,3)<>round(sum_potr_cex,3))) ';
  ExecSQL;
  end;

  with OraQuery4   do
     begin
SQL.Text:='Select * from ( ';
SQL.Text:=SQL.Text+'Select psprav, Tronix.sp_name(psprav) name, ';
SQL.Text:=SQL.Text+'(Select kod from tronix.sprav where sprav_id=psprav) kod,sum(sum_potr) suma_potr, ';
SQL.Text:=SQL.Text+'sum(sum_potr_tr) sum_potr_tr,sum(sum_potr_cex) sum_potr_cex,';
SQL.Text:=SQL.Text+'  nvl(sum_zap_kol,0) sum_zap_kol from ( ';
SQL.Text:=SQL.Text+'Select  potr.sprav_sprav_id psprav, potr.kol*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr, ';
SQL.Text:=SQL.Text+'potr.zapas_post*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr_tr, ';
SQL.Text:=SQL.Text+'potr.zapas_post_tr*tronix_kof_koded(potr.sprav_sprav_id, potr.koded_koded_id,(Select koded_koded_id from tronix.sprav where sprav_id=potr.sprav_sprav_id)) sum_potr_cex, ';
SQL.Text:=SQL.Text+'z.sum_zap_kol ';
SQL.Text:=SQL.Text+'from tx_car_potr potr, ';
SQL.Text:=SQL.Text+'(Select  z_sprav_id,sum(zap_kol) sum_zap_kol from ';
SQL.Text:=SQL.Text+'(Select decode(sprav_sprav_id_zam_snab,null,z_sprav_id,sprav_sprav_id_zam_snab) z_sprav_id,zap_kol  from ( ';
SQL.Text:=SQL.Text+'Select  zap.sprav_sprav_id z_sprav_id, zap.sprav_sprav_id_zam_snab, (zap.kol_uchet*tronix_kof_koded(zap.sprav_sprav_id,zap.koded_koded_id_uchet, (Select koded_koded_id from tronix.sprav where sprav_id=zap.sprav_sprav_id))) zap_kol ';
SQL.Text:=SQL.Text+' from tronix.zapas zap ';
SQL.Text:=SQL.Text+'where  zap.texkompl_texkompl_id in (Select texkompl_id from tx_texkompl connect by prior texkompl_id=texkompl_texkompl_id start with texkompl_id='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')' ;
SQL.Text:=SQL.Text+'and tronix_select_mat((Select tree_tree_id from tronix.sprav where sprav_id=zap.sprav_sprav_id), ''02'') =1)) ';
SQL.Text:=SQL.Text+'group by z_sprav_id) z ';
SQL.Text:=SQL.Text+'where ';
SQL.Text:=SQL.Text+' potr.texkompl_texkompl_id in (Select texkompl_id from tx_texkompl connect by prior texkompl_id=texkompl_texkompl_id start with texkompl_id='+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString+')' ;
SQL.Text:=SQL.Text+'and tronix_select_mat((Select tree_tree_id from tronix.sprav where sprav_id=potr.sprav_sprav_id), ''02'') =1 ';
SQL.Text:=SQL.Text+'and potr.sprav_sprav_id=z.z_sprav_id(+) ';
SQL.Text:=SQL.Text+') ';
SQL.Text:=SQL.Text+'group by psprav,sum_zap_kol ';
SQL.Text:=SQL.Text+'order by kod ';
SQL.Text:=SQL.Text+') ';
if  CheckBox1.Checked=true then
SQL.Text:=SQL.Text+'where ((round(suma_potr,3)<>round(sum_zap_kol,3)) and (round(suma_potr,3)<>round(sum_potr_cex,3))) ';
  ExecSQL;
  end;

///****МСЧ
  with OraQuery5   do
     begin

SQL.Text:=' Select name,sprname,sprkod, potr,zavod,cex, vidano, TTN_NUM, sprav_id from';
SQL.Text:=SQL.Text+' (Select name,sprname,sprkod,nvl(round(sum(suma_potr),4),0) potr,round(sum(suma_zavod),4) zavod,round(sum(suma_vcexe),4) cex,nvl(round(summ_vidano,4),0) vidano, TTN_NUM,sprav_id ';
SQL.Text:=SQL.Text+'  from ';
SQL.Text:=SQL.Text+'  ( ';
SQL.Text:=SQL.Text+'  Select potr.sprav_sprav_id spr_id,(potr.kol*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_potr , ';
SQL.Text:=SQL.Text+'  (potr.zapas_post*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_zavod, ';
SQL.Text:=SQL.Text+'   (potr.zapas_post_tr*tronix_kof_koded(spr.sprav_id,spr.koded_koded_id, potr.koded_koded_id)) suma_vcexe, ';
SQL.Text:=SQL.Text+'  (Select sum(zap.kol_uchet*tronix_kof_koded(potr.sprav_sprav_id,zap.koded_koded_id_uchet, potr.koded_koded_id)) from tronix.zapas zap ';
SQL.Text:=SQL.Text+' where zap.sp_sp_id=potr.sp_id_from ';
SQL.Text:=SQL.Text+' and zap.sprav_sprav_id=potr.sprav_sprav_id) summ_vidano, ';
SQL.Text:=SQL.Text+' potr.texkompl_texkompl_id texkompl,do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, sp.nn spnn, sp.kod spkod, ';

SQL.Text:=SQL.Text+' spr.name sprname, spr.kod sprkod,spr.sprav_id sprav_id,';
SQL.Text:=SQL.Text+'  (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) spavname, ';
SQL.Text:=SQL.Text+' (Select nomer from tx_texkompl where texkompl_id=nordsy.GET_UP_TTN(potr.texkompl_texkompl_id,7)) up_texkompl_id, ';
SQL.Text:=SQL.Text+' nordsy.get_TTN(potr.sprav_sprav_id,'+form36.Edit1.text+',''ALL'') TTN_NUM ';
SQL.Text:=SQL.Text+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
SQL.Text:=SQL.Text+'  where spr.sprav_id=potr.sprav_sprav_id ';
SQL.Text:=SQL.Text+'  and  spr.can_do_self =1 ';
SQL.Text:=SQL.Text+'   and sp.nn(+)= potr.sp_id_from ';
SQL.Text:=SQL.Text+'   and sp.nnn=do.document_id(+) ';
SQL.Text:=SQL.Text+'  and potr.texkompl_texkompl_id = '+Form36.DBGrideh1.DataSource.DataSet.FieldByName('texkompl_id').AsString;
SQL.Text:=SQL.Text+'  ) ';
SQL.Text:=SQL.Text+'  group by name, spkod,sprname,sprkod,summ_vidano,TTN_NUM,sprav_id ';
SQL.Text:=SQL.Text+'  order by name )';
//ShowMessage(Sql.text);
    ExecSQL;
  end;
  tk_poz:=0;
   end;
   //   if tk_poz=0 then Button1.Visible:=true;

end;

procedure TForm39.FormActivate(Sender: TObject);
begin

if tk_poz=1 then
 begin
   OraQuery1.Close;
   OraQuery1.Open;
 Form39.FormShow(nil);
  end;


end;

procedure TForm39.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   OraQuery1.Close;OraQuery2.Close;
   OraQuery3.Close;OraQuery4.Close;OraQuery5.Close;
end;

procedure TForm39.DBGridEh1GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
  //    ShowMessage(Column.Field.DataSet.FieldByName('nom1').AsString);
  //    ShowMessage(Column.Field.DataSet.FieldByName('nom2').AsString);
  //    ShowMessage(Column.Field.DataSet.FieldByName('nom3').AsString);
   if (Column.Field.DataSet.FieldByName('otk_end1').AsFloat =0) and (Column.Field.DataSet.FieldByName('nom1').AsString<>#13+#10) and
  (Column.FieldName='OTK_END1')
     then      Background := clRed;


      if (Column.Field.DataSet.FieldByName('otk_end2').AsString ='') and (Column.Field.DataSet.FieldByName('nom2').AsString<>#13+#10) and
  (Column.FieldName='OTK_END2')
     then      Background := clRed;


        if (Column.Field.DataSet.FieldByName('otk_end3').AsFloat =0) and (Column.Field.DataSet.FieldByName('nom3').AsString<>#13+#10) and
  (Column.FieldName='OTK_END3')
     then      Background := clRed;

        if (Column.Field.DataSet.FieldByName('otk_end4').AsString ='') and (Column.Field.DataSet.FieldByName('nom4').AsString<>#13+#10) and
  (Column.FieldName='OTK_END4')
     then      Background := clRed;
   end;


procedure TForm39.DBGridEh2GetCellParams(Sender: TObject;
  Column: TColumnEh; AFont: TFont; var Background: TColor;
  State: TGridDrawState);
begin
    if (Column.Field.DataSet.FieldByName('otk_end1').AsFloat =0) and (Column.Field.DataSet.FieldByName('nom1').AsString<>'') and
  (Column.FieldName='OTK_END1')
     then      Background := clRed;


      if (Column.Field.DataSet.FieldByName('otk_end2').AsString ='') and (Column.Field.DataSet.FieldByName('nom2').AsString<>'') and
  (Column.FieldName='OTK_END2')
     then      Background := clRed;


        if (Column.Field.DataSet.FieldByName('otk_end3').AsFloat =0) and (Column.Field.DataSet.FieldByName('nom3').AsString<>'') and
  (Column.FieldName='OTK_END3')
     then      Background := clRed;

        if (Column.Field.DataSet.FieldByName('otk_end4').AsString ='') and (Column.Field.DataSet.FieldByName('nom4').AsString<>'') and
  (Column.FieldName='OTK_END4')
     then      Background := clRed;

     if (Column.Field.DataSet.FieldByName('ddd').AsString ='3') and (Column.Field.DataSet.FieldByName('nom1').AsString<>'')
        then  Background := clyellow;
end;

procedure TForm39.CheckBox1Click(Sender: TObject);
begin
tk_poz:=1;
 Form39.FormShow(nil);
end;

procedure TForm39.DBGridEh2DblClick(Sender: TObject);
var tk:string;
begin
tk:='';
if (DbgridEH2.SelectedField.FieldName  ='NOM1') then   tk:=DbgridEH2.DataSource.DataSet.FieldByName('tk1').AsString;
if (DbgridEH2.SelectedField.FieldName  ='NOM2') then   tk:=DbgridEH2.DataSource.DataSet.FieldByName('tk2').AsString;
if (DbgridEH2.SelectedField.FieldName  ='NOM3') then   tk:=DbgridEH2.DataSource.DataSet.FieldByName('tk3').AsString;
if (DbgridEH2.SelectedField.FieldName  ='NOM4') then   tk:=DbgridEH2.DataSource.DataSet.FieldByName('tk4').AsString;
if tk<>'' then
  begin
  Form36.MemTableEh1.TreeList.FullExpand();
  /// Появлялка кнопки
  with Form36.DBGridEh1 do
  begin
  DataSource.DataSet.DisableControls;
 try
 DataSource.DataSet.First;
  While (DataSource.DataSet.FieldByName('texkompl_id').AsString<>tk) and (DataSource.DataSet.Eof<>true)
 // and (DataSource.DataSet.FieldByName('texkompl_texkompl_id').AsString<>tk)
    do
   DataSource.DataSet.Next;
  finally
  DataSource.Dataset.EnableControls;
  DataSource.DataSet.Next;
  DataSource.DataSet.Prior;
end;
end;
end;
end;

procedure TForm39.Button1Click(Sender: TObject);
begin
  with Form36.DBGridEh1 do
  begin
  DataSource.DataSet.DisableControls;
 try
 DataSource.DataSet.First;
  While (DataSource.DataSet.FieldByName('nomer').AsString<>Form39.Caption) and (DataSource.DataSet.Eof<>true)
    do
   DataSource.DataSet.Next;
  finally
  DataSource.Dataset.EnableControls;
  DataSource.DataSet.Next;
  DataSource.DataSet.Prior;
end;
  end; end;
procedure TForm39.Button2Click(Sender: TObject);
begin
form40.Caption:=Form36.DBGridEh1.DataSource.DataSet.FieldByName('Nomer').AsString ;
form40.ShowModal();
end;

procedure TForm39.DBGridEh5DblClick(Sender: TObject);
begin
 form30.Caption:='Выберите ТН';
  Form30.Edit1.Text:=oraQuery5.FieldByName('sprav_id').asString;
  Form30.Edit2.Text:=Form36.Edit1.text;
  form30.ShowModal();
end;

end.
