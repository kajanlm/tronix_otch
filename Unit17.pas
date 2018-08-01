unit Unit17;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls,
  ExtCtrls, OraTransaction, OraPackage,ShellApi, GridsEh;

type
  TForm17 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Bevel1: TBevel;
    OraQuery3: TOraQuery;
    OraDataSource3: TOraDataSource;
    DBGridEh3: TDBGridEh;
    Edit16: TEdit;
    Label1: TLabel;
    OraQuery3nomer: TStringField;
    OraQuery3name: TStringField;
    OraQuery3nomer_1: TStringField;
    OraQuery3trud: TFloatField;
    OraQuery3pdate_end: TStringField;
    OraQuery3nar: TFloatField;
    OraQuery4: TOraQuery;
    OraQuery3texkompl_id: TFloatField;
    OraQuery5: TOraQuery;
    OraDataSource4: TOraDataSource;
    DBGridEh4: TDBGridEh;
    OraQuery5nomer: TStringField;
    OraQuery5name: TStringField;
    OraQuery5pdate_beg: TStringField;
    OraQuery5nomer_1: TStringField;
    OraQuery5texkompl_id: TFloatField;
    OraQuery5trud: TFloatField;
    OraQuery6: TOraQuery;
    OraQuery5nar: TFloatField;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    OraQuery7: TOraQuery;
    OraDataSource5: TOraDataSource;
    DBGridEh5: TDBGridEh;
    OraQuery7nomer: TStringField;
    OraQuery7name: TStringField;
    OraQuery7Nomer1: TStringField;
    OraQuery7pdate_beg: TStringField;
    OraQuery7trudoem: TFloatField;
    OraQuery7nar: TFloatField;
    GroupBox3: TGroupBox;
    OraQuery8: TOraQuery;
    OraDataSource6: TOraDataSource;
    DBGridEh6: TDBGridEh;
    OraQuery8kvalif_kvalif_id: TFloatField;
    OraQuery8name: TStringField;
    OraQuery8razryd: TStringField;
    OraQuery8vid_norm_vid_norm_id: TFloatField;
    OraQuery8vid_rabot_vid_rabot_id: TFloatField;
    OraQuery8ysl_rabot_ysl_rabot_id: TFloatField;
    OraQuery8norm: TFloatField;
    OraQuery8nakl: TFloatField;
    OraQuery9: TOraQuery;
    OraDataSource7: TOraDataSource;
    DBGridEh7: TDBGridEh;
    OraQuery7texkompl_id: TFloatField;
    OraQuery9kvalif_kvalif_id: TFloatField;
    OraQuery9name: TStringField;
    OraQuery9vid_norm_vid_norm_id: TFloatField;
    OraQuery9razryd: TStringField;
    OraQuery9vid_rabot_vid_rabot_id: TFloatField;
    OraQuery9ysl_rabot_ysl_rabot_id: TFloatField;
    OraQuery9nakl: TFloatField;
    OraQuery9norm: TFloatField;
    DBGridEh8: TDBGridEh;
    OraQuery10: TOraQuery;
    OraDataSource8: TOraDataSource;
    OraQuery10kvaliv_kvalif_id: TFloatField;
    OraQuery10name: TStringField;
    OraQuery10razryd: TStringField;
    OraQuery10vid_norm_vid_norm_id: TFloatField;
    OraQuery10vid_rabot_vid_rabot_id: TFloatField;
    OraQuery10ysl_rabot_ysl_rabot_id: TFloatField;
    OraQuery10norm: TFloatField;
    OraQuery10nakl: TFloatField;
    Button1: TButton;
    OraQuery11: TOraQuery;
    OraQuery8vid_norm_name: TStringField;
    OraQuery8vid_rabot_name: TStringField;
    OraQuery8ysl_rabot_name: TStringField;
    OraQuery8Tarif_grid: TIntegerField;
    OraQuery9ysl_rabot_name: TStringField;
    OraQuery9tarif_grid: TIntegerField;
    OraQuery9vid_rabot_name: TStringField;
    OraQuery9vid_norm_name: TStringField;
    OraQuery10vid_norm_name: TStringField;
    OraQuery10vid_rabot_name: TStringField;
    OraQuery10ysl_rabot_name: TStringField;
    OraQuery10tarif_grid: TIntegerField;
    OraQuery12: TOraQuery;
    FUNCTION Checker(d: String):Integer ;
    FUNCTION Checke(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id,ysl_rabot,name: String; norm,nakl: Real ): Integer;
    FUNCTION Save_NAR(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id,ysl_rabot,name: String; norm,nakl: Real ): Integer;
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure Edit8Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure TabSheet3Show(Sender: TObject);
    procedure OraQuery3CalcFields(DataSet: TDataSet);
    procedure OraQuery3AfterScroll(DataSet: TDataSet);
    procedure OraQuery5CalcFields(DataSet: TDataSet);
    procedure OraQuery5AfterScroll(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure OraQuery7AfterScroll(DataSet: TDataSet);
    procedure Button1Click(Sender: TObject);
    procedure DBGridEh8Enter(Sender: TObject);
    procedure DBGridEh7Enter(Sender: TObject);
    procedure DBGridEh6Enter(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure OraQuery8CalcFields(DataSet: TDataSet);
    procedure OraQuery9CalcFields(DataSet: TDataSet);
    procedure OraQuery10CalcFields(DataSet: TDataSet);
    procedure DBGridEh3Enter(Sender: TObject);
    procedure DBGridEh4Enter(Sender: TObject);
    procedure DBGridEh5Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;
   ivent: integer;

implementation

uses Unit1;

{$R *.dfm}

procedure TForm17.Edit1Change(Sender: TObject);
begin
  Edit2.SetFocus;
end;
procedure TForm17.Edit2Change(Sender: TObject);
begin
  Edit3.SetFocus;
end;
procedure TForm17.Edit3Change(Sender: TObject);
begin
  Edit4.SetFocus;
end;
procedure TForm17.Edit4Change(Sender: TObject);
begin
  Edit5.SetFocus;
end;
procedure TForm17.Edit5Change(Sender: TObject);
begin
  Edit6.SetFocus;
end;
procedure TForm17.Edit6Change(Sender: TObject);
begin
  Edit7.SetFocus;
end;

procedure TForm17.Edit7Change(Sender: TObject);
begin
  Edit8.SetFocus;
end;
procedure TForm17.Edit8Change(Sender: TObject);
begin
  Edit9.SetFocus;
end;
procedure TForm17.Edit9Change(Sender: TObject);
begin
  Edit10.SetFocus;
end;
procedure TForm17.Edit10Change(Sender: TObject);
begin
  Edit11.SetFocus;
end;
procedure TForm17.Edit11Change(Sender: TObject);
begin
  Edit12.SetFocus;
end;
procedure TForm17.Edit12Change(Sender: TObject);
begin
  Edit13.SetFocus;
end;

procedure TForm17.Edit13Change(Sender: TObject);
begin
  Edit14.SetFocus;
end;

procedure TForm17.Edit14Change(Sender: TObject);
begin
  Edit15.SetFocus;
end;





procedure TForm17.TabSheet3Show(Sender: TObject);
var tx,tex_nomer:string;
i,e:integer;
begin
i:=15;
e:=1; ivent:=5;
 while i>0 do begin
       if (TEdit(FindComponent('Edit'+IntToStr(i))).Text<>'') and (e=0) then

   tex_nomer:=TEdit(FindComponent('Edit'+IntToStr(i))).Text+tex_nomer;


     if (TEdit(FindComponent('Edit'+IntToStr(i))).Text='') and (e=0) then

    tex_nomer:='_'+tex_nomer;


  if (TEdit(FindComponent('Edit'+IntToStr(i))).Text<>'') and (e=1) then
   begin
   e:=0;tex_nomer:=TEdit(FindComponent('Edit'+IntToStr(i))).Text+'%';
   end;


 i:=i-1;
end;


 tx:='      Select tx.nomer, tx.name, dep.nomer,DECODE(pdate_beg,null,NULL,TO_CHAR(pdate_beg,''DD-MM-YYYY''))  pdate_beg , ';
 tx:=tx+'  (Select sum(trudoem) from tx_texkompl              ';
 if Edit16.Text<>'' then begin
 tx:=tx+'  where dep_dep_id in                                ';
 tx:=tx+'  (Select dep.dep_id from nordsy.dep                 ';
 tx:=tx+'  where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id ';
 tx:=tx+'  or dep.nomer='''+Edit16.Text+''')                                  ';
 end;
 tx:=tx+'  connect by prior texkompl_id = texkompl_texkompl_ID ';
 tx:=tx+'  start	with  texkompl_ID =tx.texkompl_id) trud ,      ';
 tx:=tx+' tx.texkompl_id                                        ';
 tx:=tx+' from tx_texkompl tx, nordsy.dep dep                  ';
 tx:=tx+' where tx.type_tex_type_tex_id in (7,8)                      ';
 tx:=tx+' and tx.project_project_id='+oraQuery2.FieldByName('id_project').asString;
 if  tex_nomer<>'' then
  tx:=tx+' and tx.nomer LIKE ('''+tex_nomer+''')                         ';
 tx:=tx+' and tx.dep_dep_id=dep.dep_id                         ';
 tx:=tx+' and (Select count(*) from tx_texkompl t              ';
  if Edit16.Text<>'' then begin
 tx:=tx+' where t.dep_dep_id in                                ';
 tx:=tx+' (Select dep.dep_id from nordsy.dep                   ';
 tx:=tx+' where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id ';
 tx:=tx+' or dep.nomer='''+Edit16.Text+''')                                    ';
 end;
 tx:=tx+' connect by prior t.texkompl_id = t.texkompl_texkompl_ID ';
 tx:=tx+' start	with  t.texkompl_ID =tx.texkompl_id)>0          ';
 tx:=tx+'and tx_uzak_tx(tx.texkompl_id)='+oraQuery2.FieldByName('nn').asString;

 tx:=tx+' order by  tx.nomer                                    ';

 oraQuery3.SQL.text:=tx;
 oraQuery3.ExecSQL;

end;

procedure TForm17.OraQuery3CalcFields(DataSet: TDataSet);
var tx:String;
begin
tx:='    (Select Sum(trudoem) nakl  from tronix.ttn_mat tmat,tronix.ttn ttn ';
tx:=tx+'  where                                                        ';
tx:=tx+'  ttn.texkompl_texkompl_id_nar in                              ';
tx:=tx+' ( Select texkompl_id from tx_texkompl                         ';
 if Edit16.Text<>'' then begin
tx:=tx+' where dep_dep_id in                                           ';
tx:=tx+'  (Select dep.dep_id from nordsy.dep                           ';
tx:=tx+'    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id ';
tx:=tx+'     or dep.nomer='''+Edit16.Text+''')    ';
 end;
tx:=tx+'    connect by prior texkompl_id = texkompl_texkompl_ID        ';
tx:=tx+'    start	with  texkompl_ID ='+ oraQuery3.FieldByName('texkompl_id').asString+') ';
tx:=tx+'  and ttn.ttn_id=tmat.ttn_ttn_id(+))                           ';

 oraQuery4.SQL.text:=tx;
 oraQuery4.ExecSQL;
oraQuery3.FieldByName('nar').value:=oraQuery4.FieldByName('nakl').asfloat;

end;

procedure TForm17.OraQuery3AfterScroll(DataSet: TDataSet);

var tx:string;
begin
    oraQuery6.Close;
   oraQuery7.Close;
   oraQuery8.Close;
   oraQuery9.Close;
tx:='Select tx.nomer, tx.name, dep.nomer,DECODE(tx.pdate_beg,null,NULL,TO_CHAR(tx.pdate_beg,''DD-MM-YYYY''))  pdate_beg,  ';
tx:=tx+'(Select sum(trudoem) from tx_texkompl           ';
 if Edit16.Text<>'' then begin
tx:=tx+'   where dep_dep_id in                          ';
tx:=tx+'   (Select dep.dep_id from nordsy.dep           ';
tx:=tx+'    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id  ';
tx:=tx+'     or dep.nomer='''+Edit16.Text+''')                                                      ';
end;
tx:=tx+'    connect by prior texkompl_id = texkompl_texkompl_ID                      ';
tx:=tx+'    start	with  texkompl_ID =tx.texkompl_id) trud, tx.texkompl_id, tx.texkompl_texkompl_id ';
tx:=tx+' from tx_texkompl tx, nordsy.dep dep    ';
tx:=tx+' where tx.type_tex_type_tex_id in (12,14)        ';
tx:=tx+' and tx.project_project_id='+oraQuery2.FieldByName('id_project').asString           ;
tx:=tx+' and tx.dep_dep_id=dep.dep_id             ';
tx:=tx+' and tx.texkompl_texkompl_id='+ oraQuery3.FieldByName('texkompl_id').asString;
tx:=tx+' and (Select count(*) from tx_texkompl t  ';
if Edit16.Text<>'' then begin
tx:=tx+' where t.dep_dep_id in                    ';
tx:=tx+' (Select dep.dep_id from nordsy.dep       ';
tx:=tx+' where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id  ';
tx:=tx+' or dep.nomer='''+Edit16.Text+''')                                                       ';
end;
tx:=tx+' connect by prior t.texkompl_id = t.texkompl_texkompl_ID                  ';
tx:=tx+'  start	with  t.texkompl_ID =tx.texkompl_id)>0                            ';
tx:=tx+' order by  tx.nomer                                                       ';

 oraQuery5.SQL.text:=tx;
 oraQuery5.ExecSQL;


 tx:=' Select kvalif_kvalif_id, name, razryd, vid_norm_vid_norm_id,(Select kod from nordsy.vid_norm where vid_norm_id=vid_norm_vid_norm_id ) vid_norm_name,';
 tx:=tx+' vid_rabot_vid_rabot_id,(Select kod from nordsy.vid_rabot where vid_rabot_id=vid_rabot_vid_rabot_id ) vid_rabot_name,                            ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, (Select kod from nordsy.ysl_rabot where ysl_rabot_id=ysl_rabot_ysl_rabot_id ) ysl_rabot_name , ';
tx:=tx+ 'sum(norm) norm ,sum(nakl) nakl                                                                  ';
tx:=tx+ 'from                                                                                                          ';
tx:=tx+ '(                                                                                                             ';
tx:=tx+ 'Select kv.kvalif_kvalif_id,                                                                                   ';
tx:=tx+ '(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,                                       ';
tx:=tx+ 'to_char(razpjd) razryd,                                                                                       ';
tx:=tx+ 'vid_norm_vid_norm_id, ';//***Nen
tx:=tx+ 'vid_rabot_vid_rabot_id,                                                                 ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, sum(time) norm,null nakl                                                              ';
tx:=tx+ 'from tx_tex_kvalif kv                                                                                         ';
tx:=tx+ 'where texkompl_texkompl_id in                                                                                 ';
tx:=tx+ '(Select texkompl_id from tx_texkompl                                                                    ';
if Edit16.Text<>'' then begin
tx:=tx+ ' where dep_dep_id in                                                                                                 ';
tx:=tx+ '(Select dep.dep_id from nordsy.dep                                                                            ';
tx:=tx+ ' where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                       ';
tx:=tx+ ' or dep.nomer='''+Edit16.Text+''')';
end;
tx:=tx+ ' connect by prior texkompl_id = texkompl_texkompl_ID                                                          ';
tx:=tx+ '  start	with  texkompl_ID ='+oraQuery3.FieldByName('texkompl_id').asString+')';
tx:=tx+ 'group by  kvalif_kvalif_id,razpjd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ 'union all                                                                                                     ';
tx:=tx+ 'Select tmat.kvalif_kvalif_id,(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,          ';
tx:=tx+ 'tmat.razryd, tmat.vid_norm_vid_norm_id,  ';
tx:=tx+ 'tmat.vid_rabot_vid_rabot_id,                                           ';
tx:=tx+ 'tmat.ysl_rabot_ysl_rabot_id, null, sum(trudoem) nakl                                                           ';
tx:=tx+ 'from  tronix.ttn_mat tmat,tronix.ttn ttn                                                                      ';
tx:=tx+ '  where                                                                                                       ';
tx:=tx+ '  ttn.texkompl_texkompl_id_nar in                                                                             ';
tx:=tx+ ' ( Select texkompl_id from tx_texkompl                                                                       ';
 if Edit16.Text<>'' then begin
tx:=tx+ ' where dep_dep_id in                                                                                          ';
tx:=tx+ '  (Select dep.dep_id from nordsy.dep                                                                          ';
tx:=tx+ '    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                    ';
tx:=tx+ '     or dep.nomer='''+Edit16.Text+''')'    ;
end;
tx:=tx+ '    connect by prior texkompl_id = texkompl_texkompl_ID                                                       ';
tx:=tx+ '    start	with  texkompl_ID ='+oraQuery3.FieldByName('texkompl_id').asString+')';
tx:=tx+ '  and ttn.ttn_id=tmat.ttn_ttn_id(+)                                                                           ';
tx:=tx+ 'group by  kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ ')                                                                                                             ';
tx:=tx+ 'group by  name,kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id   ';
tx:=tx+ 'order by name                                                                                                 ';

 oraQuery8.SQL.text:=tx;
 oraQuery8.ExecSQL;


end;

procedure TForm17.OraQuery5CalcFields(DataSet: TDataSet);
var tx:string;
begin
   tx:='    (Select Sum(trudoem) nakl  from tronix.ttn_mat tmat,tronix.ttn ttn ';
tx:=tx+'  where                                                        ';
tx:=tx+'  ttn.texkompl_texkompl_id_nar in                              ';
tx:=tx+' ( Select texkompl_id from tx_texkompl                         ';
 if Edit16.Text<>'' then begin
tx:=tx+' where dep_dep_id in                                           ';
tx:=tx+'  (Select dep.dep_id from nordsy.dep                           ';
tx:=tx+'    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id ';
tx:=tx+'     or dep.nomer='''+Edit16.Text+''')    ';
 end;
tx:=tx+'    connect by prior texkompl_id = texkompl_texkompl_ID        ';
tx:=tx+'    start	with  texkompl_ID ='+ oraQuery5.FieldByName('texkompl_id').asString+') ';
tx:=tx+'  and ttn.ttn_id=tmat.ttn_ttn_id(+))                           ';

 oraQuery6.SQL.text:=tx;
 oraQuery6.ExecSQL;
oraQuery5.FieldByName('nar').value:=oraQuery6.FieldByName('nakl').asfloat;

end;

procedure TForm17.OraQuery5AfterScroll(DataSet: TDataSet);
var tx:String;
begin
tx:='      Select nomer,name, pdate_beg,nomer1,                                        ';
tx:=tx+'  trudoem, texkompl_id, nar,                                                         ';
tx:=tx+'  lev                                                                              ';
tx:=tx+'  from                                                                             ';
tx:=tx+'  (                                                                                ';
tx:=tx+'  Select tx.nomer, tx.name, DECODE(tx.pdate_beg,null,NULL,TO_CHAR(tx.pdate_beg,''DD-MM-YYYY'')) pdate_beg,';
tx:=tx+' (Select nomer from nordsy.dep where dep_id=tx.dep_dep_id) nomer1 ,';
tx:=tx+'  tx.trudoem, tx.texkompl_id, tx.texkompl_texkompl_id,                             ';
tx:=tx+' (Select sum(trudoem) from tronix.ttn_mat tmat,tronix.ttn ttn                      ';
tx:=tx+'   where                                                                           ';
tx:=tx+'   ttn.texkompl_texkompl_id_nar=tx.texkompl_id                                     ';
tx:=tx+'   and ttn.ttn_id=tmat.ttn_ttn_id(+)) nar,                                         ';
tx:=tx+'  DECODE(LEVEL + 1, LEAD(LEVEL)OVER (ORDER BY ROWNUM), 0, 1) lev                   ';
tx:=tx+'   from tx_texkompl tx                                                             ';
tx:=tx+'  where tx.type_tex_type_tex_id in (14,12)                                                 ';
tx:=tx+'  and tx.project_project_id='+oraQuery2.FieldByName('id_project').asString+'' ;
if Edit16.Text<>'' then begin
tx:=tx+'  and tx.dep_dep_id in                                                             ';
tx:=tx+'  (Select dep.dep_id from nordsy.dep                                               ';
tx:=tx+'   where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id          ';
tx:=tx+'   or dep.nomer='''+Edit16.Text+''')                                                              ';
end;
tx:=tx+'    connect by prior tx.texkompl_id = tx.texkompl_texkompl_ID                       ';
tx:=tx+'     start	with  tx.texkompl_ID ='+ oraQuery5.FieldByName('texkompl_id').asString;
tx:=tx+'  )                                                                                ';
tx:=tx+'  where lev>0                                                                      ';
tx:=tx+'  order by  nomer                                                                  ';

 oraQuery7.SQL.text:=tx;
 oraQuery7.ExecSQL;

 tx:=' Select kvalif_kvalif_id, name, razryd, vid_norm_vid_norm_id,(Select kod from nordsy.vid_norm where vid_norm_id=vid_norm_vid_norm_id ) vid_norm_name,';
 tx:=tx+' vid_rabot_vid_rabot_id,(Select kod from nordsy.vid_rabot where vid_rabot_id=vid_rabot_vid_rabot_id ) vid_rabot_name,                            ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, (Select kod from nordsy.ysl_rabot where ysl_rabot_id=ysl_rabot_ysl_rabot_id ) ysl_rabot_name ,                            ';
tx:=tx+ '  sum(norm) norm ,sum(nakl) nakl                                                                   ';
tx:=tx+ 'from                                                                                                          ';
tx:=tx+ '(                                                                                                             ';
tx:=tx+ 'Select kv.kvalif_kvalif_id,                                                                                   ';
tx:=tx+ '(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,                                       ';
tx:=tx+ 'to_char(razpjd) razryd,                                                                                       ';
tx:=tx+ 'vid_norm_vid_norm_id, vid_rabot_vid_rabot_id,                                                                 ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, sum(time) norm,null nakl                                                              ';
tx:=tx+ 'from tx_tex_kvalif kv                                                                                         ';
tx:=tx+ 'where texkompl_texkompl_id in                                                                                 ';
tx:=tx+ '(Select texkompl_id from tx_texkompl                                                                    ';
if Edit16.Text<>'' then begin
tx:=tx+ ' where  dep_dep_id in                                                                                                 ';
tx:=tx+ '(Select dep.dep_id from nordsy.dep                                                                            ';
tx:=tx+ ' where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                       ';
tx:=tx+ ' or dep.nomer='''+Edit16.Text+''')';// and';
end;
//tx:=tx+ ' type_tex_type_tex_id in (7,8) ';
tx:=tx+ ' connect by prior texkompl_id = texkompl_texkompl_ID                                                          ';
tx:=tx+ '  start	with  texkompl_ID ='+oraQuery5.FieldByName('texkompl_id').asString+')';
tx:=tx+ 'group by  kvalif_kvalif_id,razpjd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ 'union all                                                                                                     ';
tx:=tx+ 'Select tmat.kvalif_kvalif_id,(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,          ';
tx:=tx+ 'tmat.razryd, tmat.vid_norm_vid_norm_id,tmat.vid_rabot_vid_rabot_id,                                           ';
tx:=tx+ 'tmat.ysl_rabot_ysl_rabot_id, null, sum(trudoem) nakl                                                           ';
tx:=tx+ 'from  tronix.ttn_mat tmat,tronix.ttn ttn                                                                      ';
tx:=tx+ '  where                                                                                                       ';
tx:=tx+ '  ttn.texkompl_texkompl_id_nar in                                                                             ';
tx:=tx+ ' ( Select texkompl_id from tx_texkompl                                                                        ';
 if Edit16.Text<>'' then begin
tx:=tx+ '  where dep_dep_id in                                                                                          ';
tx:=tx+ '  (Select dep.dep_id from nordsy.dep                                                                          ';
tx:=tx+ '    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                    ';
tx:=tx+ '     or dep.nomer='''+Edit16.Text+''')';// and '    ;
end;
//tx:=tx+ ' type_tex_type_tex_id in (7,8) ';
tx:=tx+ '    connect by prior texkompl_id = texkompl_texkompl_ID                                                       ';
tx:=tx+ '    start	with  texkompl_ID ='+oraQuery5.FieldByName('texkompl_id').asString+')';
tx:=tx+ '  and ttn.ttn_id=tmat.ttn_ttn_id(+)                                                                           ';
tx:=tx+ 'group by  kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ ')                                                                                                             ';
tx:=tx+ 'group by  name,kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id   ';
tx:=tx+ 'order by name                                                                                                 ';

 oraQuery9.SQL.text:=tx;
 oraQuery9.ExecSQL;
 //Form17.OraQuery5AfterScroll(nil);
end;

procedure TForm17.FormClose(Sender: TObject; var Action: TCloseAction);

begin
   oraQuery3.Close;
   oraQuery4.Close;
   oraQuery5.Close;
   oraQuery6.Close;
   oraQuery7.Close;
   oraQuery8.Close;
   oraQuery9.Close;
  PageControl1.ActivePageIndex:= 1;
      edit1.Text:='';
   edit2.Text:='';
   edit3.Text:='';
   edit4.Text:='';
   edit5.Text:='';
   edit6.Text:='';
   edit7.Text:='';
   edit8.Text:='';
   edit9.Text:='';
   edit10.Text:='';
   edit11.Text:='';
   edit12.Text:='';
   edit13.Text:='';
   edit14.Text:='';
   edit15.Text:='';
   edit16.Text:='';
    ivent:=5;
     OraQuery12.Close;
end;

procedure TForm17.FormShow(Sender: TObject);
var tx:string;
begin
//ShowMessage(Form1.OraSession1.Username);

PageControl1.ActivePageIndex:= 0;
  tx:='	    select count(*) kol                                        ';
tx:=tx+'	    from tronix_role r2,                                   ';
tx:=tx+'	    tronix_user_gr g, tronix_type_gr t,tronix_user_l l     ';
tx:=tx+'	    where g.TYPE_GR_TYPE_GR_ID=t.TYPE_GR_ID                ';
tx:=tx+'            and  r2.ROLE_ID =13                       ';
tx:=tx+'	    and t.ROLE_ROLE_ID=r2.ROLE_ID                          ';
tx:=tx+'	    and l.USER_GR_USER_GR_ID=g.USER_GR_ID                  ';
tx:=tx+'            and l.name='+#39+Form1.OraSession1.Username+#39;
OraQuery12.SQL.Text:=tx;
OraQuery12.Execute;
if  OraQuery12.FieldByName('kol').AsInteger>0 then
 PageControl1.Visible:=true
 else
begin
  tx:='            	    select td.nomer                                                                  ';
tx:=tx+'	    from tronix_role r2,                                                                       ';
tx:=tx+'	    tronix_user_gr g, tronix_type_gr t,tronix_user_l l, tronix.dep_gr dg, nordsy.dep td          ';
tx:=tx+'	    where g.TYPE_GR_TYPE_GR_ID=t.TYPE_GR_ID                                                   ';
tx:=tx+'            and  r2.ROLE_ID =16                                                                    ';
tx:=tx+'            and g.user_gr_id not in 105                                                          ';
tx:=tx+'	    and t.ROLE_ROLE_ID=r2.ROLE_ID                                                                 ';
tx:=tx+'	    and l.USER_GR_USER_GR_ID=g.USER_GR_ID                                                       ';
tx:=tx+'            and dg.user_gr_user_gr_id=g.user_gr_id                                                 ';
tx:=tx+'            and dg.dep_dep_id=td.dep_id                                                              ';
tx:=tx+'            and l.name='+#39+Form1.OraSession1.Username+#39;
 OraQuery12.SQL.Text:=tx;
OraQuery12.Execute;
if    OraQuery12.Fields.Count>0 then
    begin
    Button1.Visible:=true;
    Edit16.Text:=OraQuery12.FieldByName('nomer').asString;
    Edit16.Enabled:=false;

 //
   PageControl1.Visible:=true;
 end;
  If   OraQuery12.Fields.Count=0 then
   ShowMessage('Не достаточно прав! Для работы в модуле!');

 OraQuery12.Close;
end;


end;

procedure TForm17.OraQuery7AfterScroll(DataSet: TDataSet);
 var tx: String;
begin

 tx:=' Select kvalif_kvalif_id, name, razryd, vid_norm_vid_norm_id, (Select kod from nordsy.vid_norm where vid_norm_id=vid_norm_vid_norm_id ) vid_norm_name,';
 tx:=tx+' vid_rabot_vid_rabot_id,(Select kod from nordsy.vid_rabot where vid_rabot_id=vid_rabot_vid_rabot_id ) vid_rabot_name,                            ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, (Select kod from nordsy.ysl_rabot where ysl_rabot_id=ysl_rabot_ysl_rabot_id ) ysl_rabot_name ,                            ';
tx:=tx+ ' sum(norm) norm ,sum(nakl) nakl                                                                   ';
tx:=tx+ 'from                                                                                                          ';
tx:=tx+ '(                                                                                                             ';
tx:=tx+ 'Select kv.kvalif_kvalif_id,                                                                                   ';
tx:=tx+ '(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,                                       ';
tx:=tx+ 'to_char(razpjd) razryd,                                                                                       ';
tx:=tx+ 'vid_norm_vid_norm_id, vid_rabot_vid_rabot_id,                                                                 ';
tx:=tx+ 'ysl_rabot_ysl_rabot_id, sum(time) norm,null nakl                                                              ';
tx:=tx+ 'from tx_tex_kvalif kv                                                                                         ';
tx:=tx+ 'where texkompl_texkompl_id in                                                                                 ';
tx:=tx+ '(Select texkompl_id from tx_texkompl                                                                    ';
if Edit16.Text<>'' then begin
tx:=tx+ ' where  dep_dep_id in                                                                                                 ';
tx:=tx+ '(Select dep.dep_id from nordsy.dep                                                                            ';
tx:=tx+ ' where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                       ';
tx:=tx+ ' or dep.nomer='''+Edit16.Text+''')';// and';
end;
//tx:=tx+ ' type_tex_type_tex_id in (7,8) ';
tx:=tx+ ' connect by prior texkompl_id = texkompl_texkompl_ID                                                          ';
tx:=tx+ '  start	with  texkompl_ID ='+oraQuery7.FieldByName('texkompl_id').asString+')';
tx:=tx+ 'group by  kvalif_kvalif_id,razpjd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ 'union all                                                                                                     ';
tx:=tx+ 'Select tmat.kvalif_kvalif_id,(Select name from nordsy.kvalif where kvalif_id=kvalif_kvalif_id) name,          ';
tx:=tx+ 'tmat.razryd, tmat.vid_norm_vid_norm_id,tmat.vid_rabot_vid_rabot_id,                                           ';
tx:=tx+ 'tmat.ysl_rabot_ysl_rabot_id, null, sum(trudoem) nakl                                                           ';
tx:=tx+ 'from  tronix.ttn_mat tmat,tronix.ttn ttn                                                                      ';
tx:=tx+ '  where                                                                                                       ';
tx:=tx+ '  ttn.texkompl_texkompl_id_nar in                                                                             ';
tx:=tx+ ' ( Select texkompl_id from tx_texkompl                                                                        ';
 if Edit16.Text<>'' then begin
tx:=tx+ '  where dep_dep_id in                                                                                          ';
tx:=tx+ '  (Select dep.dep_id from nordsy.dep                                                                          ';
tx:=tx+ '    where (Select dep_id from  nordsy.dep where nomer='''+Edit16.Text+''')=dep.dep_dep_id                                    ';
tx:=tx+ '     or dep.nomer='''+Edit16.Text+''')';// and '    ;
end;
//tx:=tx+ ' type_tex_type_tex_id in (7,8) ';
tx:=tx+ '    connect by prior texkompl_id = texkompl_texkompl_ID                                                       ';
tx:=tx+ '    start	with  texkompl_ID ='+oraQuery7.FieldByName('texkompl_id').asString+')';
tx:=tx+ '  and ttn.ttn_id=tmat.ttn_ttn_id(+)                                                                           ';
tx:=tx+ 'group by  kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id        ';
tx:=tx+ ')                                                                                                             ';
tx:=tx+ 'group by  name,kvalif_kvalif_id,razryd,vid_norm_vid_norm_id, vid_rabot_vid_rabot_id, ysl_rabot_ysl_rabot_id   ';
tx:=tx+ 'order by name                                                                                                 ';
 oraQuery10.SQL.text:=tx;
 oraQuery10.ExecSQL;
end;

procedure TForm17.Button1Click(Sender: TObject);
var  texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id, ysl_rabot, name: String;
      chek: integer;
      norm, nakl:real;
begin

    texkompl_id:='';
   kvalif_id:= '';
   razryd:= '';
   vid_norm_id:='';
   vid_rabot_id:= '';
   ysl_rabot:='';
   norm:=0;
   nakl:= 0;
   name:= '';
   chek:=0;

if ivent=0 then begin
  texkompl_id:= oraQuery7.FieldByName('texkompl_id').asString;
   kvalif_id:= oraQuery10.FieldByName('kvalif_kvalif_id').asString;
   razryd:= oraQuery10.FieldByName('razryd').asString;
   vid_norm_id:= oraQuery10.FieldByName('vid_norm_vid_norm_id').asString;
   vid_rabot_id:= oraQuery10.FieldByName('vid_rabot_vid_rabot_id').asString;
   ysl_rabot:=oraQuery10.FieldByName('ysl_rabot_ysl_rabot_id').asString;
   norm:= oraQuery10.FieldByName('norm').asFloat;
   nakl:= oraQuery10.FieldByName('nakl').asFloat;
   name:= oraQuery10.FieldByName('name').asString;
   chek:=1;
end;

if ivent=1 then begin
  texkompl_id:= oraQuery5.FieldByName('texkompl_id').asString;
  kvalif_id:= oraQuery9.FieldByName('kvalif_kvalif_id').asString;
   razryd:= oraQuery9.FieldByName('razryd').asString;
   vid_norm_id:= oraQuery9.FieldByName('vid_norm_vid_norm_id').asString;
   vid_rabot_id:= oraQuery9.FieldByName('vid_rabot_vid_rabot_id').asString;
   ysl_rabot:=oraQuery9.FieldByName('ysl_rabot_ysl_rabot_id').asString;
   norm:= oraQuery9.FieldByName('norm').asFloat;
   nakl:= oraQuery9.FieldByName('nakl').asFloat;
   name:= oraQuery9.FieldByName('name').asString;
   chek:=1;
end;

if ivent=2 then begin
  texkompl_id:= oraQuery3.FieldByName('texkompl_id').asString;
  kvalif_id:= oraQuery8.FieldByName('kvalif_kvalif_id').asString;
   razryd:= oraQuery8.FieldByName('razryd').asString;
   vid_norm_id:= oraQuery8.FieldByName('vid_norm_vid_norm_id').asString;
   vid_rabot_id:= oraQuery8.FieldByName('vid_rabot_vid_rabot_id').asString;
   ysl_rabot:=oraQuery8.FieldByName('ysl_rabot_ysl_rabot_id').asString;
   norm:= oraQuery8.FieldByName('norm').asFloat;
   nakl:= oraQuery8.FieldByName('nakl').asFloat;
   name:= oraQuery8.FieldByName('name').asString;
   chek:=1;
end;
  if chek=1 then
  if Checke(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id, ysl_rabot, name, norm, nakl  )=1 then
      Save_NAR(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id, ysl_rabot, name, norm, nakl)
   else
  else ShowMessage('Не выбрана профессия!!!');
end;

procedure TForm17.DBGridEh8Enter(Sender: TObject);
begin
  ivent:=0;
end;

procedure TForm17.DBGridEh7Enter(Sender: TObject);
begin
ivent:=1;
end;

procedure TForm17.DBGridEh6Enter(Sender: TObject);
begin
ivent:=2;
end;

function TForm17.Checker(d: String): Integer;
var tx:string;
begin

 tx:=' Select count(*)as kont from tx_texkompl';
 tx:=tx+' connect by prior texkompl_id = texkompl_texkompl_ID';
  tx:=tx+' start	with  texkompl_ID ='+d;
  oraQuery11.SQL.text:=tx;
 oraQuery11.ExecSQL;
result:=oraQuery11.FieldByName('kont').asInteger;
end;



procedure TForm17.TabSheet1Show(Sender: TObject);
begin
   oraQuery3.Close;
   oraQuery4.Close;
   oraQuery5.Close;
   oraQuery6.Close;
   oraQuery7.Close;
   oraQuery8.Close;
   oraQuery9.Close;
end;

function TForm17.Save_NAR(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id,ysl_rabot,name: String; norm,nakl: Real ): Integer;
var tx,tx_mat,id:string;
begin

tx:='Select tronix.ttn_seq.nextval  new_ttn_id from dual';
OraQuery11.SQL.Text:=tx;
OraQuery11.Execute;

id:=OraQuery11.FieldByName('new_ttn_id').AsString;
tx:='insert into tronix.ttn (ttn_id,type_ttn_type_ttn_id, user_gr_user_gr_id,   ';
tx:=tx+' nomer,                                                                 ';
tx:=tx+' dep_dep_id_to, date_dok,                                               ';
tx:=tx+' project_project_id,user_name1,                                         ';
tx:=tx+' uzak_uzak_id, txt,texkompl_texkompl_id_nar)                             ';
tx:=tx+' values('+id+',60, ';
tx:=tx+'	    (select  g.user_gr_id                                                                   ';
tx:=tx+'	    from tronix_role r2,                                                                   ';
tx:=tx+'	    tronix_user_gr g, tronix_type_gr t,tronix_user_l l, tronix.dep_gr dg, nordsy.dep td    ';
tx:=tx+'	    where g.TYPE_GR_TYPE_GR_ID=t.TYPE_GR_ID                                                ';
tx:=tx+'            and  r2.ROLE_ID =16                                                              ';
tx:=tx+'            and g.user_gr_id not in 105                                                      ';
tx:=tx+'	    and t.ROLE_ROLE_ID=r2.ROLE_ID                                                          ';
tx:=tx+'	    and l.USER_GR_USER_GR_ID=g.USER_GR_ID                                                  ';
tx:=tx+'            and dg.user_gr_user_gr_id=g.user_gr_id                                            ';
tx:=tx+'            and dg.dep_dep_id=td.dep_id                                                      ';
tx:=tx+'            and l.name='+#39+Form1.OraSession1.Username+#39+'),                                                    ';
tx:=tx+' (Select tronix.work_seq.GET_SEQ_VAL (tronix.work_seq.GET_SEQ_id (3,null,to_char(sysdate,''YYYY''),null,null,null,null,null)) from dual), ';
tx:=tx+'(select td.dep_id                                                                     ';
tx:=tx+' from tronix_role r2,                                                                 ';
tx:=tx+'   tronix_user_gr g, tronix_type_gr t,tronix_user_l l, tronix.dep_gr dg, nordsy.dep td  ';
tx:=tx+'   where g.TYPE_GR_TYPE_GR_ID=t.TYPE_GR_ID                                              ';
tx:=tx+'    and  r2.ROLE_ID =16                                                                 ';
tx:=tx+'   and g.user_gr_id not in 105                                                          ';
tx:=tx+'   and t.ROLE_ROLE_ID=r2.ROLE_ID                                                        ';
tx:=tx+'   and l.USER_GR_USER_GR_ID=g.USER_GR_ID                                                 ';
tx:=tx+'   and dg.user_gr_user_gr_id=g.user_gr_id                                                ';
tx:=tx+'   and dg.dep_dep_id=td.dep_id                                                           ';
tx:=tx+'          and l.name='+#39+Form1.OraSession1.Username+#39+'),sysdate, ';
tx:=tx+' (Select project_project_id from tx_texkompl where texkompl_id='+texkompl_id+' ),';
tx:=tx+Form1.OraSession1.Username+',  ';
tx:=tx+' (Select tx_uzak_tx('+texkompl_id+') from dual), ';
tx:=tx+''' Наряд на работу (ROBOT)'','+texkompl_id+')';
 // Showmessage(id);
///Пишем строчну часть
tx_mat:=' insert into tronix.ttn_mat    ';
tx_mat:=tx_mat+'(ttn_mat_id, ttn_ttn_id,trudoem,kvalif_kvalif_id,                                                    ';
tx_mat:=tx_mat+' vid_norm_vid_norm_id,vid_rabot_vid_rabot_id,ysl_rabot_ysl_rabot_id, vid_oplaty_vid_oplaty_id,        ';
tx_mat:=tx_mat+' RAZRYD,txt) ';
tx_mat:=tx_mat+' values          ';
tx_mat:=tx_mat+'(tronix.ttn_mat_seq.nextval,'+id+','+StringReplace(FloatToStr(norm-nakl),',','.',[rfReplaceAll])+','+kvalif_id+',    ';
tx_mat:=tx_mat+vid_norm_id+','+vid_rabot_id+','+ysl_rabot+',7,';
tx_mat:=tx_mat+razryd+',''GenRobot'')           ';

 Form1.OraSession1.StartTransaction ;
 try
   try
     OraQuery11.SQL.Text:=tx;
      OraQuery11.Execute;
        OraQuery11.SQL.Text:=tx_mat;
    OraQuery11.Execute;
     Form1.OraSession1.Commit ;
   finally
      OraQuery11.Close;

     end;
  except
   Form1.OraSession1.Rollback;
end;
  OraQuery3AfterScroll(nil);
end;

procedure TForm17.OraQuery8CalcFields(DataSet: TDataSet);
begin
if (OraQuery8.FieldByName('vid_rabot_name').AsString<>'') and (OraQuery8.FieldByName('ysl_rabot_name').AsString<>'') then
OraQuery8.FieldByName('tarif_grid').Value:= StrtoInt(OraQuery8.FieldByName('vid_rabot_name').AsString)*10+StrToInt(OraQuery8.FieldByName('ysl_rabot_name').AsString);
end;

procedure TForm17.OraQuery9CalcFields(DataSet: TDataSet);
begin
  if (OraQuery9.FieldByName('vid_rabot_name').AsString<>'') and (OraQuery9.FieldByName('ysl_rabot_name').AsString<>'') then
OraQuery9.FieldByName('tarif_grid').Value:= StrtoInt(OraQuery9.FieldByName('vid_rabot_name').AsString)*10+StrToInt(OraQuery9.FieldByName('ysl_rabot_name').AsString);
end;

procedure TForm17.OraQuery10CalcFields(DataSet: TDataSet);
begin
     if (OraQuery10.FieldByName('vid_rabot_name').AsString<>'') and (OraQuery10.FieldByName('ysl_rabot_name').AsString<>'') then
OraQuery10.FieldByName('tarif_grid').Value:= StrtoInt(OraQuery10.FieldByName('vid_rabot_name').AsString)*10+StrToInt(OraQuery10.FieldByName('ysl_rabot_name').AsString);
end;


function TForm17.Checke(texkompl_id,kvalif_id,razryd,vid_norm_id,vid_rabot_id,ysl_rabot,name: String; norm,nakl: Real ): Integer;
begin
  if Checker(texkompl_id)=1 then
     if (kvalif_id<>'') and (razryd<>'')
     and (vid_norm_id<>'') and (vid_rabot_id<>'')
     and (ysl_rabot<>'')
     then
        if  (norm-nakl)>0  then
          //ShowMessage('Я готов писат наряд, Хозяин на '+texkompl_id+' '+kvalif_id+' '+razryd+' '+vid_norm_id+' '+vid_rabot_id+' '+ysl_rabot+' '+name+' на '+FloatTostr((norm-nakl)))
          result:=1
        else ShowMessage('По '+name+' есть все наряды!!!!')
      else ShowMessage(name+' не отнормирован!!!!')
   else ShowMessage('У '+name+' есть под операции!!!! Выписывайте наряды на нижнем уровне!!!');
 
end;

procedure TForm17.DBGridEh3Enter(Sender: TObject);
begin
ivent:=10;
 
end;

procedure TForm17.DBGridEh4Enter(Sender: TObject);
begin
ivent:=10;
end;

procedure TForm17.DBGridEh5Enter(Sender: TObject);
begin
ivent:=10;
end;

end.
