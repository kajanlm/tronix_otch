unit Unit10;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, GridsEh;

type
  TForm10 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Label1: TLabel;
    OraQuery1Texkompl_id: TFloatField;
    OraQuery1Nomer: TStringField;
    OraQuery1NAME: TStringField;
    OraQuery1texkompl_texkompl_id: TFloatField;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

uses Unit9, Unit11, Unit15, Unit18, Unit23, Unit38;

{$R *.dfm}

procedure TForm10.FormShow(Sender: TObject);
var t:string;
begin

 t:='Select texkompl_id,Nomer, name,texkompl_texkompl_id from tx_texkompl ';
t:=t+'where texkompl_texkompl_id is Null ';
if  Form10.Caption='Выберите УКР' then
t:=t+'and uzak_uzak_id='+#39+Form23.Label1.caption+#39
else
t:=t+'and uzak_uzak_id='+#39+Form9.Label2.caption+#39;

 if cOPy(Caption,1,37)='Ведомость комплектации по помещениям ' then
    begin
     t:='';
     t:=' Select texkompl_id, nomer, name, texkompl_texkompl_id from tx_texkompl ';
     t:=t+' where project_project_id='+ Label3.caption;
     t:=t+' and texkompl_texkompl_id is null ';
     t:=t+' and nsort=1 ';
   end;
oraQuery1.SQL.Text:=t;
oraQuery1.ExecSQL;
if   Form10.Caption='Отчет по нарядам' then
 begin
  Edit1.Visible:=true;
  Label2.Visible:=true;
 end;
end;





procedure TForm10.DBGridEh1DblClick(Sender: TObject);
var t, ot:string;
begin
  ot:=oraQuery1.FieldByName('texkompl_id').asString;
   t:='Select texkompl_id,Nomer, name, texkompl_texkompl_id from tx_texkompl ';
t:=t+'where texkompl_texkompl_id ='+#39+ot+#39;
t:=t+'order by  Nomer';
oraQuery1.SQL.Text:=t;
oraQuery1.ExecSQL;
if oraQuery1.RecordCount=0 then
  begin
       t:='Select texkompl_id,Nomer, name, texkompl_texkompl_id from tx_texkompl ';
       t:=t+'where texkompl_id ='+#39+ot+#39;
       t:=t+'order by  Nomer';
       oraQuery1.SQL.Text:=t;
       oraQuery1.ExecSQL;
   end;
end;

procedure TForm10.Button1Click(Sender: TObject);
begin
  DBGridEh1DblClick(nil);
end;

procedure TForm10.Button2Click(Sender: TObject);
var t,ot:string;
begin
 ot:=oraQuery1.FieldByName('texkompl_texkompl_id').asString;

t:=' Select tx.texkompl_id,tx.Nomer, tx.name, tx.texkompl_texkompl_id ';
t:=t+'from tx_texkompl tx,(Select  texkompl_texkompl_id  from tx_texkompl ';
t:=t+'where texkompl_id ='+#39+ot+#39;
t:=t+') t ';
t:=t+'where tx.texkompl_texkompl_id=t.texkompl_texkompl_id ';
t:=t+'order by  Nomer ' ;
oraQuery1.SQL.Text:=t;
oraQuery1.ExecSQL;
 if oraQuery1.RecordCount=0 then
  begin
       t:='Select texkompl_id,Nomer, name, texkompl_texkompl_id from tx_texkompl ';
       t:=t+'where texkompl_texkompl_id ='+#39+ot+#39;
       t:=t+'order by  Nomer';
       oraQuery1.SQL.Text:=t;
       oraQuery1.ExecSQL;
   end;


end;

procedure TForm10.Button3Click(Sender: TObject);
 var tx: String;
begin
if Form10.Caption='Отчет по нарядам' then
 begin
Form11.Caption:='Отчет по нарядам';
Label1.Caption:=oraQuery1.FieldByName('texkompl_id').asString;
Form11.ShowModal();
 end;

if Form10.Caption='Дефицит по номенклатуре' then
 begin
   Form15.EDIT2.text:=oraQuery1.FieldByName('nomer').asString;
    Form15.EDIT3.text:=oraQuery1.FieldByName('texkompl_id').asString;
  Form10.Close();
 end;

if Form10.Caption='Отчет по трудоемкости (Новый)' then
 begin
    Form18.EDIT1.text:=oraQuery1.FieldByName('texkompl_id').asString;
  Form10.Close();
  Form18.ShowModal();
 end;

 if Form10.Caption='Выберите УКР' then
 begin
    Form23.Label3.Caption:=oraQuery1.FieldByName('texkompl_id').asString;
    Form23.EDit3.Text:= oraQuery1.FieldByName('Nomer').asString;
  Form10.Close();
 // Form23.ShowModal();  Nomer
 end;

  if cOPy(Caption,1,37)='Ведомость комплектации по помещениям '  then
 begin
  Form10.Close();
  Form38.Caption:='Ведомость комплектации по помещениям ';

{tx:='Select spr_id, name,spkod,ROOM, TK,  sum(kol) kol,spname, text, koded from (';
tx:=tx+'Select  potr.sprav_sprav_id spr_id, potr.texkompl_texkompl_id texkompl,do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name,';
tx:=tx+' spr.kod spkod, (Select POM from tronix.room  where room_id=sp.id_room) ROOM, (Select nomer from tx_texkompl where texkompl_id=potr.texkompl_texkompl_id) TK, ';
tx:=tx+'   potr.kol*tronix_kof_koded(spr.sprav_id,potr.koded_koded_id, spr.koded_koded_id) kol,';
tx:=tx+'  spr.name spname, ';
tx:=tx+' (Select namek from tronix.koded where koded_id=spr.koded_koded_id) koded,';
tx:=tx+' decode(spr.can_do_self,1,''ЦКС ''||nordsy.Get_TTN(spr.sprav_id,'+Label3.Caption+'), decode (tronix_select_mat(spr.tree_tree_id, ''02'' ),0,'' Склад '',';

tx:=tx+' NVL2(   ';
//tx:=tx+' (Select * from  ';
tx:=tx+' (Select  tx.nomer||'' ''||(Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) ';
tx:=tx+' from ';
tx:=tx+' tx_texkompl tx, nordsy.tx_mat tmat ';
tx:=tx+' where ';
tx:=tx+'tmat.sp_sp_id=potr.sp_id_for ';
tx:=tx+'and tx.texkompl_id=tex_texkompl_id ';
tx:=tx+'and tmat. type_relation_type_relation_id in (1) ';
tx:=tx+'and tx.texkompl_id<>potr.texkompl_texkompl_id) ';
//tx:=tx+',''!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!''||sp.nn||'' ''||potr.texkompl_texkompl_id';
tx:=tx+' ,(Select  tx.nomer||'' по ТК ''||(Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) ';
tx:=tx+' from ';
tx:=tx+' tx_texkompl tx, nordsy.tx_mat tmat ';
tx:=tx+' where ';
tx:=tx+'tmat.sp_sp_id=potr.sp_id_for ';
tx:=tx+'and tx.texkompl_id=tex_texkompl_id ';
tx:=tx+'and tmat. type_relation_type_relation_id in (1) ';
tx:=tx+'and tx.texkompl_id<>potr.texkompl_texkompl_id) ';

tx:=tx+',''СКЛАД'')';
tx:=tx+' )) text';



tx:=tx+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do';
tx:=tx+' where spr.sprav_id=potr.sprav_sprav_id';
tx:=tx+'  and sp.nn= potr.sp_id_for';
tx:=tx+'  and sp.nnn=do.document_id';
tx:=tx+' and  sp.id_room is not null';
tx:=tx+' and potr.texkompl_texkompl_id in';
tx:=tx+' (Select texkompl_id from tx_texkompl';
tx:=tx+' connect by prior texkompl_id=texkompl_texkompl_id';
tx:=tx+' start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+'))';
tx:=tx+' group by spr_id, name,spkod,ROOM, TK,spname, text, koded';
tx:=tx+' order by ROOM, name';
 //  ShowMessage(tx);}

 //was
//tx:=' Select spr_id, name,spkod,ROOM, TK,  kol,spname, text, koded from ( ';
//tx:=tx+' Select spr_id, name,spkod,ROOM, TK,  sum(kol) kol,spname, text, koded from (';
//tx:=tx+'  Select  potr.sprav_sprav_id spr_id, potr.texkompl_texkompl_id texkompl,do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name,';
//tx:=tx+'   spr.kod spkod, (Select POM from tronix.room  where room_id=sp.id_room) ROOM, (Select nomer from tx_texkompl where texkompl_id=potr.texkompl_texkompl_id) TK,';
//tx:=tx+'     potr.kol*tronix_kof_koded(spr.sprav_id,potr.koded_koded_id, spr.koded_koded_id) kol,';
//tx:=tx+'    spr.name spname,';
//tx:=tx+'   (Select namek from tronix.koded where koded_id=spr.koded_koded_id) koded,';
//tx:=tx+'   decode(spr.can_do_self,1,''ЦКС ''||nordsy.Get_TTN(spr.sprav_id,'+Label3.Caption+'), decode (tronix_select_mat(spr.tree_tree_id, ''02'' ),0,'' Склад '',';
//tx:=tx+'   NVL2(';
//tx:=tx+'   (Select  tx.nomer||'' ''||(Select nomer from nordsy.dep where dep_id=tx.dep_dep_id)';
//tx:=tx+'   from ';
//tx:=tx+'   tx_texkompl tx, nordsy.tx_mat tmat';
//tx:=tx+'   where';
//tx:=tx+'  tmat.sp_sp_id=potr.sp_id_for';
//tx:=tx+'  and tx.texkompl_id=tex_texkompl_id';
//tx:=tx+'  and tmat. type_relation_type_relation_id in (1)';
//tx:=tx+'  and tx.texkompl_id<>potr.texkompl_texkompl_id)';
//tx:=tx+'   ,(Select  tx.nomer||'' по ТК ''||(Select nomer from nordsy.dep where dep_id=tx.dep_dep_id)';
//tx:=tx+'   from';
//tx:=tx+'   tx_texkompl tx, nordsy.tx_mat tmat';
//tx:=tx+'   where';
//tx:=tx+'  tmat.sp_sp_id=potr.sp_id_for';
//tx:=tx+'  and tx.texkompl_id=tex_texkompl_id';
//tx:=tx+'  and tmat. type_relation_type_relation_id in (1)';
//tx:=tx+'  and tx.texkompl_id<>potr.texkompl_texkompl_id)';
//tx:=tx+'  ,''СКЛАД'')';
//tx:=tx+'   )) text';
//tx:=tx+'  from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do';
//tx:=tx+'  where spr.sprav_id=potr.sprav_sprav_id';
//tx:=tx+'   and sp.nn= potr.sp_id_for';
//tx:=tx+'   and sp.nnn=do.document_id';
//tx:=tx+'  and  sp.id_room is not null';
//tx:=tx+'  and potr.texkompl_texkompl_id in';
//tx:=tx+'  (Select texkompl_id from tx_texkompl';
//tx:=tx+'  connect by prior texkompl_id=texkompl_texkompl_id';
//tx:=tx+'  start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+'))';
//tx:=tx+'  group by  name,spr_id,spkod,ROOM, TK,spname, text, koded';
//was

//tx:=tx+' UNION ALL';
//tx:=tx+' Select sp_sp_id, do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, (Select KOD from tronix.sprav where sprav_id=sp.id_sprav)  spkod,';
//tx:=tx+'  (Select POM from tronix.room  where room_id=sp.id_room) ROOM,';
//tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=poz.texkompl_texkompl_id) TK, poz.kol,';
//tx:=tx+' (Select name from tronix.sprav where sprav_id=sp.id_sprav) spname, ';// ''Из др техкомплекта ''|| ';

//tx:=tx+'''Из др техкомплекта '' as text,';
//tx:=tx+' (Select namek from tronix.koded where koded_id=poz.koded_koded_id) koded';
//tx:=tx+'  from';
//tx:=tx+'  tx_car_poz poz, tronix.sp sp, tronix.document do';
//tx:=tx+' where';
//tx:=tx+' sp.nn= poz.sp_sp_id';
//tx:=tx+'  and sp.nnn=do.document_id';
//tx:=tx+'   and  sp.id_room is not null';
//tx:=tx+'  and in_poz=1';
//tx:=tx+'  and poz.texkompl_texkompl_id in';
//tx:=tx+'   (Select texkompl_id from tx_texkompl';
//tx:=tx+'   connect by prior texkompl_id=texkompl_texkompl_id';
//tx:=tx+'  start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+'))';
//tx:=tx+') order by ROOM, name';

tx:=' Select '''' spr_id, name,spkod,ROOM, TK, decode(koli,null, pozkol,koli) kol ,spname, text,ed_1 koded from ';  //decode(ed_1, null,koded,ed_1) koded from ';
tx:=tx+'  ( ';
tx:=tx+'  Select sp_sp_id, poz.kol,(Select KOD from tronix.sprav where sprav_id=sp.id_sprav)  spkod, ';
tx:=tx+'  do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, ';
tx:=tx+'   ''Из ПУЕ ''||(Select nomer from tx_texkompl where texkompl_id= ';
tx:=tx+'  (Select texkompl_texkompl_id from tx_car_poz where poz.sp_sp_id=sp_sp_id and in_poz=0 and  out_poz=1))||''  цех ''||';
tx:=tx+'(Select nomer from nordsy.dep where dep_id=(Select dep_dep_id from tx_car_poz where poz.sp_sp_id=sp_sp_id and in_poz=0 and  out_poz=1)) ';
tx:=tx+'   as text,  ';
//tx:=tx+'  (Select sum(kol) from  tx_car_potr where poz.sp_sp_id=sp_id_for ) as koli, ';
tx:=tx+' null as koli ,';
tx:=tx+' (Select namek from tronix.koded where koded=sp.kode) ed_1, ';  //(Select koded_koded_id from tronix.sprav where sprav_id=id_sprav)) ed_1, ';
tx:=tx+'  (Select POM from tronix.room  where room_id=sp.id_room) ROOM, ';
tx:=tx+'  (Select nomer from tx_texkompl where texkompl_id=poz.texkompl_texkompl_id) TK,decode(sp.kol_tx, null,sp.kol,sp.kol_tx) pozkol, ';
tx:=tx+'  (Select name from tronix.sprav where sprav_id=sp.id_sprav) spname, ';
tx:=tx+'  (Select namek from tronix.koded where koded_id=poz.koded_koded_id) koded ';
tx:=tx+'     from ';
tx:=tx+'   tx_car_poz poz, tronix.sp sp, tronix.document do ';
tx:=tx+'  where ';
tx:=tx+'  sp.nn= poz.sp_sp_id ';
tx:=tx+'   and sp.nnn=do.document_id ';
tx:=tx+'    and  sp.id_room is not null ';
tx:=tx+'   and in_poz=1 ';
tx:=tx+'    and out_poz=0 ';
//tx:=tx+'    and  (DECODE(sp.id_sprav,null,0,(Select rossip from tronix.sprav where sprav_id=sp.id_sprav))<>1) ';
tx:=tx+' and decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),0,0,decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),null,0,1))=0';
tx:=tx+'   and poz.texkompl_texkompl_id in ';
tx:=tx+'    (Select texkompl_id from tx_texkompl ';
tx:=tx+'    connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+'   start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+') ';

tx:=tx+'  union all ';
tx:=tx+'  Select sp_sp_id, poz.kol,(Select KOD from tronix.sprav where sprav_id=sp.id_sprav)  spkod, ';
tx:=tx+'  do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, ';
tx:=tx+'   decode((Select can_do_self from tronix.sprav where sprav_id=sp.id_sprav),1,''ЦКС ''||nordsy.Get_TTN(sp.id_sprav,'+Label3.Caption+'), '' Склад '') text, ';
tx:=tx+' null as koli ,';
tx:=tx+'  (Decode(sp.kode_tx,null,(Select namek from tronix.koded where koded=sp.kode),(Select namek from tronix.koded where koded=sp.kode_tx))) ed_1, ';
tx:=tx+'  (Select POM from tronix.room  where room_id=sp.id_room) ROOM, ';
tx:=tx+'  (Select nomer from tx_texkompl where texkompl_id=poz.texkompl_texkompl_id) TK, decode(sp.kol_tx, null,sp.kol,sp.kol_tx) pozkol, ';
tx:=tx+'  (Select name from tronix.sprav where sprav_id=sp.id_sprav) spname,';
tx:=tx+'  (Select namek from tronix.koded where koded_id=(Select koded_koded_id from tronix.sprav where sprav_id=sp.id_sprav)) koded ';
tx:=tx+'   from ';
tx:=tx+'   tx_car_poz poz, tronix.sp sp, tronix.document do ';
tx:=tx+'  where ';
tx:=tx+'  sp.nn= poz.sp_sp_id ';
tx:=tx+'   and sp.nnn=do.document_id ';
tx:=tx+'    and  sp.id_room is not null ';
tx:=tx+'   and befo_ship=1 ';
tx:=tx+'    and afto_ship=1   ';
//tx:=tx+'    and  (Select rossip from tronix.sprav where sprav_id=sp.id_sprav)<>1 ';
tx:=tx+' and decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),0,0,decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),null,0,1))=0';
tx:=tx+'   and poz.texkompl_texkompl_id in ';
tx:=tx+'    (Select texkompl_id from tx_texkompl ';
tx:=tx+'    connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+'   start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+') ';       //)

tx:=tx+' union all ';

tx:=tx+' Select null sp_sp_id,kol,(Select KOD from tronix.sprav where sprav_id=sprav_sprav_id)  spkod, ';
tx:=tx+' name, ';
tx:=tx+'  decode((Select can_do_self from tronix.sprav where sprav_id=sprav_sprav_id),1,''ЦКС ''||nordsy.Get_TTN(sprav_sprav_id,300), '' Склад '') text, ';
tx:=tx+' kol koli, ';
tx:=tx+' (Select namek from tronix.koded where koded_id=spnn) ed_1, ';
tx:=tx+' (Select POM from tronix.room  where room_id=id_r) ROOM, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=tex) TK, ';
tx:=tx+' 0 pozkol, ';
tx:=tx+' (Select name from tronix.sprav where sprav_id=sprav_sprav_id) spname,'''' koded ';

tx:=tx+' from ';
tx:=tx+' (Select sum(potr.kol) kol, ';
tx:=tx+'  do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name,potr.sprav_sprav_id, potr.texkompl_texkompl_id tex,  potr.koded_koded_id spnn, sp.id_room id_r ';
tx:=tx+' from  tx_car_potr potr,tronix.sp sp, tronix.document do ';
tx:=tx+' where potr.sp_id_for=sp.nn ';
tx:=tx+'  and sp.nnn=do.document_id ';
tx:=tx+'  and  sp.id_room is not null  ';
tx:=tx+' and   decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),0,0,decode((Select rossip from tronix.sprav where sprav_id=sp.id_sprav),null,0,1))=1 ';
tx:=tx+' and potr.texkompl_texkompl_id in ';
tx:=tx+'   (Select texkompl_id from tx_texkompl ';
tx:=tx+'   connect by prior texkompl_id=texkompl_texkompl_id ';
tx:=tx+'  start with texkompl_id='+oraQuery1.FieldByName('texkompl_id').asString+') ';
tx:=tx+' group by do.ident||'' ''||''Поз(''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name,potr.sprav_sprav_id, potr.texkompl_texkompl_id, potr.koded_koded_id, sp.id_room)) ';


tx:=tx+'  order by ROOM, name ';


 //ShowMessage(tx);








Form38.OraQuery1.SQL.Text:=tx;
 Form38.Caption:=Caption;
 Form38.ShowModal();
 end;

end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  oraQuery1.Close;
end;

end.
