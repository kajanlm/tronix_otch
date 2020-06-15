unit Udp_Zakazchik_InsUdp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj, Buttons;

type
  TFUdp_Zakazchik_InsUdp = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1nameudp: TStringField;
    OraQuery1coid: TFloatField;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Edit2: TEdit;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    OraQuery2: TOraQuery;
    OraQuery2udp_zakazchik_id: TFloatField;
    OraQuery2udp: TStringField;
    OraQuery2name: TStringField;
    OraQuery2date_end: TStringField;
    OraQuery2project_project_id: TFloatField;
    OraQuery3: TOraQuery;
    OraQuery4: TOraQuery;
    BitBtnSave: TBitBtn;
    Shape1: TShape;
    BitBtnClose: TBitBtn;
    TxtUdp: TEdit;
    TxtUdpName: TEdit;
    CheckBox1: TCheckBox;
    Edit4: TEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Edit5: TEdit;
    procedure FormShow(Sender: TObject);
    procedure BitBtnSaveClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
 private
    { Private declarations }
    procedure ConnectUdpOTK;
    procedure SaveToOtherProject;
    procedure InsertUdpOTK;
    procedure CopyUdpZakOtk;
  public
    { Public declarations }
  end;

var
  FUdp_Zakazchik_InsUdp: TFUdp_Zakazchik_InsUdp;
  MyBookmark: TBookMark;
idudpzak,udpudpzak,udpnamezak,tipudp,proektcopy,prizn,zavnn,idudp,idco,udpp,udppn,udpt,udptn,priznew,tudptrz,tidudptrz: string;
vidudp:array[1..3] of string[3];
implementation

uses Udp_Zakazchik,Udp_Project_For_Copy;


{$R *.dfm}
procedure TFUdp_Zakazchik_InsUdp.FormShow(Sender: TObject);
var udposn,ttx,tx: string;
vidup: integer;
begin
idudpzak:='';
udpudpzak:='';
udpnamezak:='';
//ShowMessage('Zakazchik_InsUdp.FormShow idudpzak='+idudpzak+' udpudpzak='+udpudpzak+' FUdp_Zakazchik.idudpzak='+FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString);

tx:=copy(FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('udp').asString,1,2);
if edit3.text='InsInto' then
tx:=copy(FUdp_Zakazchik.Edit6.Text,1,2);

If tx='УП' then vidup:=0 else
If tx='УХ' then vidup:=1 else
If tx='УШ' then vidup:=2 else vidup:=-1;

//ShowMessage('Zakazchik_InsUdp.FormShow tx='+tx+' vidup='+IntToStr(vidup));

tidtrz:=Edit1.Text;

vidudp[1]:='УП-';
vidudp[2]:='УХ-';
vidudp[3]:='УШ-';

FUdp_Zakazchik_InsUdp.RadioGroup1.ItemIndex:=vidup;

if edit3.text='Insert' then
begin
FUdp_Zakazchik_InsUdp.RadioGroup1.Enabled:=true;
FUdp_Zakazchik_InsUdp.RadioGroup2.Enabled:=true;
idudpzak:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
udpnamezak:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('name').asString;
udpudpzak:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
tipudp:='';
end;

if edit3.text='InsInto' then
begin
FUdp_Zakazchik_InsUdp.RadioGroup2.ItemIndex:=1;
FUdp_Zakazchik_InsUdp.RadioGroup2.Enabled:=false;
FUdp_Zakazchik_InsUdp.RadioGroup1.Enabled:=false;
idudpzak:=FUdp_Zakazchik.edit5.text;
udpudpzak:=FUdp_Zakazchik.edit6.text;
udpnamezak:=FUdp_Zakazchik.edit7.text;
end;

//ShowMessage('Zakazchik_InsUdp.FormShow edit3='+edit3.Text+' idudpzak='+idudpzak);

if edit3.text='Sostav' then
begin
FUdp_Zakazchik_InsUdp.BitBtnSave.Enabled:=false;
FUdp_Zakazchik_InsUdp.CheckBox1.Enabled:=false;
FUdp_Zakazchik_InsUdp.TxtUdp.Enabled:=false;
FUdp_Zakazchik_InsUdp.TxtUdpName.Enabled:=false;
end;

idudp:='';
udposn:='';
if (edit3.text='Update') or (edit3.text='Sostav') then
begin
idudp:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
TxtUdp.Text:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
tipudp:=copy(TxtUdp.Text,1,3);
TxtUdp.Text:=copy(TxtUdp.Text,4,length(TxtUdp.Text)-3);
TxtUdp.Enabled:=False;
TxtUdp.TabStop:=False;
TxtUdpName.Text:=FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('name').asString;
FUdp_Zakazchik_InsUdp.RadioGroup1.Enabled:=false;
FUdp_Zakazchik_InsUdp.RadioGroup2.Enabled:=false;
FUdp_Zakazchik_InsUdp.RadioGroup2.ItemIndex:=0;

//ShowMessage('Zakazchik_InsUdp.FormShow sostav idudpudp='+FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudpudp').asString);

// если это подчинёный УДП,то тип УДП может быть только подчинённым
if FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudpudp').asString<>'' then
FUdp_Zakazchik_InsUdp.RadioGroup2.ItemIndex:=1;

//ShowMessage('Zakazchik_InsUdp.FormShow проверяем наличие подчинённых для idudpzak='+idudpzak+' udpudpzak='+udpudpzak);

(* если есть подчинённые,то к основному УДП нельзя привязывать УДП ОТК *)
tx:=' ';
tx:=tx+'select udp.udp udp from tronix.udp_zakazchik udp';
tx:=tx+' where udp.udp_zakazchik_udp_zakazchik_id='+FUdp_Zakazchik.DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
tx:=tx+' and rownum=1';
OraQuery3.Close;
OraQuery3.SQL.Text:=tx;
OraQuery3.ExecSQL;
OraQuery3.Open;
udposn:=OraQuery3.FieldByName('udp').asString;
OraQuery3.Close;
//ShowMessage('Zakazchik_InsUdp.FormShow есть подчинённые для idudpzak='+idudpzak+' udpudpzak='+udpudpzak+' блокируем привязку УДП ОТК' );
(* если есть подчинённые,то к основному УДП нельзя привязывать УДП ОТК *)
end;

tx:=' ';
tx:=tx+'select tt.chk_fld as CHK_FLD, tt.udp as udp,tt.nameudp as nameudp,tt.chk_fld as CHK_FLD1,tt.coid as coid from(';

if idudp='' then
ttx:='select ''0'' chk_fld,';

if idudp<>'' then
ttx:='select decode(tronix.udp_concept_zakotk('+edit1.Text+',co.concept_id,'+idudp+'),0,''0'',''1'') chk_fld,';

tx:=tx+ttx+'co.concept_id coid,co.shortname cosh, co.abbreviation udp, co.name nameudp';
tx:=tx+' from dic_concept co where substr(co.shortname,1,5) like ('''+edit2.text+'УП%%'')) tt';
if edit3.text='Sostav' then
tx:=tx+' where tt.chk_fld=1';

tx:=tx+' order by nordsy.sort_char_number(tt.udp)';
//ShowMessage(tx);
   OraQuery1.Close;
  With OraQuery1 Do
     begin
        FieldByName('chk_fld').DisplayLAbel:='ОТМЕТКА';
        FieldByName('udp').DisplayLAbel:='УДП ОТК';
        FieldByName('nameudp').DisplayLAbel:='НАИМЕНОВАНИЕ УДП ОТК';
        FieldByName('coid').DisplayLAbel:='coid';
        FieldByName('chk_fld1').DisplayLAbel:='ОТМЕТКА1';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

if (edit3.text='Sostav') or ((udposn<>'') and (edit3.text='Update')) then
DbGridEh1.Enabled:=false;
end; //procedure TFUdp_Zakazchik_InsUdp.FormShow

procedure TFUdp_Zakazchik_InsUdp.CopyUdpZakOtk;
var udpconc,concid,tx,txc: string;
begin
//ShowMessage('CopyUdpZakOtk zavnn='+zavnn+' priznew='+priznew+' idudp='+idudp);
OraQuery4.Close;
txc:='';
txc:='select trz.udp_zakotk_id as idudp,trz.udp_zakazchik_udp_zakazchik_id as idzak,';
txc:=txc+' trz.concept_concept_id as idconc,co.concept_id as concid,co.shortname as consh';
txc:=txc+' from tronix.udp_zakotk trz,dic_concept co where trz.udp_zakazchik_udp_zakazchik_id='+idudp;
txc:=txc+' and trz.concept_concept_id=co.concept_id';
txc:=txc+' and trz.project_project_id='+edit1.Text;
//ShowMessage(txc);
OraQuery4.SQL.Text:=txc;
OraQuery4.ExecSQL;
OraQuery4.Open;
(*
ShowMessage(OraQuery4.FieldByName('idconc').asString);
ShowMessage(OraQuery4.FieldByName('concid').asString);
ShowMessage(OraQuery4.FieldByName('consh').asString);
ShowMessage(FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('zavn').asString);
 *)
oraQuery4.First;
  while not OraQuery4.eof do
Begin
udpconc:=zavnn+copy(OraQuery4.FieldByName('consh').asString,4,length(OraQuery4.FieldByName('consh').asString)-3);
//ShowMessage(udpconc);

OraQuery3.Close;
tx:='';
tx:='select co.concept_id as concid,co.shortname as cosh, co.abbreviation as udp, co.name as nameudp';
tx:=tx+' from dic_concept co where co.shortname='''+udpconc+'''';
OraQuery3.SQL.Text:=tx;
OraQuery3.ExecSQL;
OraQuery3.Close;
OraQuery3.Open;
concid:=OraQuery3.FieldByName('concid').asString;
(*
 ShowMessage( OraQuery3.FieldByName('concid').asString);
 ShowMessage( OraQuery3.FieldByName('cosh').asString);
 ShowMessage( OraQuery3.FieldByName('udp').asString);
*)
 if concid='' then
 begin
ShowMessage(udpconc+' нет в словаре проекта '+proektcopy);
end
else
begin
 if priznew='1' then
begin
//ShowMessage('all copy otk');
OraQuery3.Close;
 txc:='insert into tronix.udp_zakotk (udp_zakotk_id,udp_zakazchik_udp_zakazchik_id,concept_concept_id ,date_end,project_project_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakotk_id),0) nn from tronix.udp_zakotk) t),';
 txc:=txc+tidudptrz+',' ;
 txc:=txc+concid+',null,';
 txc:=txc+tidtrz+')';
// ShowMessage(txc);

OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

end
else
begin
//ShowMessage('not all copy otk');
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakotk_id as idudp,trz.udp_zakazchik_udp_zakazchik_id as idzak,trz.concept_concept_id as idconс';
txc:=txc+' from tronix.udp_zakotk trz where trz.udp_zakazchik_udp_zakazchik_id='+tidudptrz;
txc:=txc+' and trz.concept_concept_id='+concid;
txc:=txc+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);

OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
(*
ShowMessage('trz.udp_zakotk_id');
ShowMessage(OraQuery3.FieldByName('idudp').asString);
*)
if OraQuery3.FieldByName('idudp').asString='' then
begin
//ShowMessage('no udp='+udpconc);
OraQuery3.Close;
 txc:='insert into tronix.udp_zakotk (udp_zakotk_id,udp_zakazchik_udp_zakazchik_id,concept_concept_id ,date_end,project_project_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakotk_id),0) nn from tronix.udp_zakotk) t),';
 txc:=txc+tidudptrz+',' ;
 txc:=txc+concid+',null,';
 txc:=txc+tidtrz+')';
// ShowMessage(txc);

OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;
end;
end;
end;
oraQuery4.Next;
end;
end; //procedure TFUdp_Zakazchik_InsUdp.CopyUdpZakOtk

procedure TFUdp_Zakazchik_InsUdp.SaveToOtherProject;
var udpzakkol,udpotkkol,txx,txc: string;
begin
udpotkkol:='0';
udpzakkol:='0';
udpp:=tipudp+TxtUdp.Text;
udppn:=TxtUdpName.Text;

//ShowMessage('Вход в SaveToOtherProject udpp='+udpp+' udpudpzak='+udpudpzak);

if (CheckBox1.Checked=true) and (prizn='1') then
begin

//ShowMessage('SaveToOtherProject есть другие проекты для сохранения осн УДП='+udpudpzak);

FUdp_Project_For_Copy.oraQuery1.First;

while not FUdp_Project_For_Copy.OraQuery1.eof do
Begin
if FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
begin
udpotkkol:='0';
udpzakkol:='0';
tidtrz:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('idpr').asString;
zavnn:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('zavn').asString;
proektcopy:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('proekt').asString;

//ShowMessage('SaveToOtherProject tidtrz='+tidtrz+' zavnn='+zavnn);

OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name,tronix.udp_sele_zakazchik(trz.udp_zakazchik_id) as udpkol';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+udpp+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;

udpzakkol:=OraQuery3.FieldByName('udpkol').asString; // количество подчинённых
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;

// ShowMessage('SaveToOtherProject tudptrz='+tudptrz+' tidudptrz='+tidudptrz+' udp='+tudptrz);

if tudptrz='' then
begin
//ShowMessage('SaveToOtherProject нет '+udpp+' в '+proektcopy+' tidtrz='+tidtrz+' udpudpzak='+udpudpzak);
if RadioGroup2.ItemIndex=1 then
begin
if udpudpzak='' then
begin
idudpzak:=FUdp_Zakazchik.edit5.text;
udpudpzak:=FUdp_Zakazchik.edit6.text;
udpnamezak:=FUdp_Zakazchik.edit7.text;
end;
//ShowMessage('SaveToOtherProject для подчинённого '+udpp+' в '+proektcopy+' tidtrz='+tidtrz+' проверяем есть ли осн. УДП udpudpzak='+udpudpzak);
txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name,tronix.udp_sele_zakotk(trz.udp_zakazchik_id) as udpkol';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+udpudpzak+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;

udpotkkol:=OraQuery3.FieldByName('udpkol').asString;  // количество УДП ОТК

//ShowMessage('SaveToOtherProject OraQuery3.idudp='+OraQuery3.FieldByName('idudp').asString+' udpotkkol='+OraQuery3.FieldByName('udpkol').asString);
if OraQuery3.FieldByName('idudp').asString='' then
begin
//ShowMessage('SaveToOtherProject вставляем осн УДП='+udpudpzak+' в проект='+tidtrz);
OraQuery3.Close;
 txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
 txc:=txc+''''+udpudpzak+''',' ;
 txc:=txc+''''+udpnamezak+''',null,null,';
 txc:=txc+tidtrz+')';
// ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+udpudpzak;
txc:=txc+''' and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
end; //if OraQuery3.FieldByName('idudp').asString='' then
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
end; //if RadioGroup2.ItemIndex=1 then
//ShowMessage('SaveToOtherProject для нового подч есть осн УДП='+udpudpzak+' в проект='+tidtrz+' проверяем есть ли у осн.УДП ОТК в проекте='+zavnn+' udpotkkol='+udpotkkol);
if udpotkkol<>'0' then
ShowMessage('В проекте='+zavnn+' '+proektcopy+' для основного УДП заказчика='+udpudpzak+' есть привязка к УДП ОТК в количестве '+udpotkkol+'! Вставлять подчинённый нельзя. Сначала необходимо удалить привязки к УДП ОТК у основного УДП заказчика.')
else
begin
//ShowMessage('SaveToOtherProject вставляем '+udpp+' для tidudptrz='+tidudptrz+' zavnn='+zavnn);
 priznew:='1';
OraQuery3.Close;
 txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,project_project_id,udp_zakazchik_udp_zakazchik_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
 txc:=txc+''''+udpp+''',' ;
 txc:=txc+''''+udppn+''',null,';
 txc:=txc+tidtrz;
 if RadioGroup2.ItemIndex=1 then
txc:=txc+','+tidudptrz+')'
else
txc:=txc+',null)';

//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+udpp+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
//ShowMessage('SaveToOtherProject вставили '+udpp+' tidudptrz='+tidudptrz+' в '+zavnn);
end;
end //if udpotkkol<>'0' then
else //if tudptrz='' then
begin
//ShowMessage('SaveToOtherProject udpp='+udpp+' есть в '+proektcopy );
if udpotkkol='0' then
begin
if udppn<>OraQuery3.FieldByName('name').asString then
begin
//ShowMessage('Update udpp замена наим в='+tudptrz+' проекта '+proektcopy );
OraQuery2.Close;
txx:='Update tronix.udp_zakazchik set name='''+udppn+'''';
txx:=txx+' where udp_zakazchik_id='+tidudptrz;
txx:=txx+' and project_project_id='+tidtrz;
//ShowMessage(txx);
OraQuery2.SQL.Text:=txx;
OraQuery2.ExecSQL;
end; //if udppn<>OraQuery3.FieldByName('name').asString then
end;//if udpotkkol='0' then
end; //if tudptrz='' then
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;

//ShowMessage('SaveToOtherProject 1111 idtrz tidudptrz='+tidudptrz);
if udpotkkol='0' then // кол-во УДП ОТК у основного УДП
begin
if udpzakkol='0' then // кол-во подчинённых УДП у основного УДП
CopyUdpZakOtk()
else
ShowMessage('В проекте='+zavnn+' '+proektcopy+' для основного УДП заказчика='+udpudpzak+' есть подчинённые УДП в количестве '+udpzakkol+'! Привязку к УДП ОТК делать нельзя.')
end
end; //if FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then

priznew:='0';
FUdp_Project_For_Copy.oraQuery1.Next;
end; //while not FUdp_Project_For_Copy.OraQuery1.eof do
end; //if (CheckBox1.Checked=true) and (prizn='1') then

//ShowMessage('Выход из SaveToOtherProject ');
end; //procedure TFUdp_Zakazchik_InsUdp.SaveToOtherProject

procedure TFUdp_Zakazchik_InsUdp.InsertUdpOTK;
var txs,txx: string;
begin
//ShowMessage('Insert udpp нет');
 OraQuery2.Close;
 txx:='';
 txx:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,project_project_id,udp_zakazchik_udp_zakazchik_id)';
 txx:=txx+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),''';
 txx:=txx+tipudp+TxtUdp.Text;
 txx:=txx+''','''+TxtUdpName.Text;
 txx:=txx+''',null,';
 txx:=txx+edit1.text;

 if RadioGroup2.ItemIndex=1 then
txx:=txx+','+idudpzak+')'
else
txx:=txx+',null)';

//ShowMessage('1.1 '+txx);

 OraQuery2.SQL.Text:=txx;
 OraQuery2.ExecSQL;
 OraQuery2.Close;

txs:='';
txs:='select udz.udp,udz.name,udz.udp_zakazchik_id from tronix.udp_zakazchik udz';
txs:=txs+' where udz.udp='''+tipudp+TxtUdp.Text+'''';
txs:=txs+' and udz.project_project_id='+edit1.text;

 if RadioGroup2.ItemIndex=1 then
txs:=txs+' and udp_zakazchik_udp_zakazchik_id='+idudpzak
else
txs:=txs+' and udp_zakazchik_udp_zakazchik_id is null';

//ShowMessage('2.1 '+txs);

 OraQuery3.SQL.Text:=txs;
 OraQuery3.ExecSQL;
 OraQuery3.Open;
idudp:=OraQuery3.FieldByName('udp_zakazchik_id').asString;

if RadioGroup2.ItemIndex=0 then
 begin
 idudpzak:=OraQuery3.FieldByName('udp_zakazchik_id').asString;
 udpnamezak:=OraQuery3.FieldByName('name').asString;
 udpudpzak:=OraQuery3.FieldByName('udp').asString;
end;

OraQuery3.Close;
//ShowMessage('3.1 idudp='+idudp+' idudpzak='+idudpzak);
end; //procedure TFUdp_Zakazchik_InsUdp.InsertUdpOTK

procedure TFUdp_Zakazchik_InsUdp.ConnectUdpOTK;
var txc: string;
begin

//ShowMessage('connectUdpOTK idudp='+idudp+' tipudp='+tipudp+' TxtUdp.Text='+TxtUdp.Text);

OraQuery1.Open;
DBGridEh1.DataSource.DataSet.DisableControls;
oraQuery1.First;
while not OraQuery1.eof do
Begin
 idco:=OraQuery1.FieldByName('coid').asString;

if ((OraQuery1.FieldByName('CHK_FLD').asString='1') and (OraQuery1.FieldByName('CHK_FLD1').asString='0')) then
begin

//ShowMessage('con 1 idudp='+idudp+' idco='+idco);

OraQuery2.Close;

//ShowMessage('edit3.text='+edit3.text);

 txc:='insert into tronix.udp_zakotk (udp_zakotk_id,udp_zakazchik_udp_zakazchik_id,concept_concept_id,date_end,project_project_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakotk_id),0) nn from tronix.udp_zakotk) t),';
 txc:=txc+idudp+',' ;
 txc:=txc+idco+',null,';
 txc:=txc+edit1.text+')';
// ShowMessage(txc);
 OraQuery2.SQL.Text:=txc;
OraQuery2.ExecSQL;
end;

if ((OraQuery1.FieldByName('CHK_FLD').asString='0') and (OraQuery1.FieldByName('CHK_FLD1').asString='1')) then
begin
//ShowMessage('con 2');
OraQuery2.Close;
 txc:='delete tronix.udp_zakotk where udp_zakazchik_udp_zakazchik_id='+idudp+' and concept_concept_id='+idco;
//ShowMessage(txc);
OraQuery2.SQL.Text:=txc;
OraQuery2.ExecSQL;

end;
oraQuery1.Next;
end;
DBGridEh1.DataSource.DataSet.EnableControls;
DBGridEh1.DataSource.DataSet.Refresh;
//ShowMessage('Выход из ConnectUDPOTK');
end; //procedure TFUdp_Zakazchik_InsUdp.ConnectUdpOTK


procedure TFUdp_Zakazchik_InsUdp.BitBtnSaveClick(Sender: TObject);
var soob,datudp,txx,tx1: string;
begin
//ShowMessage('FUdp_Zakazchik_InsUdp_Save_Edit3.Text='+edit3.Text+' idudpzak='+idudpzak);

soob:='';
if TxtUdp.Text='' then
begin
soob:='Введите номер УДП';
end
else
if (copy(edit3.text,1,3)='Ins') and (RadioGroup1.ItemIndex=-1) then
begin
soob:='Определитесь с видом УДП';
end
else
if (copy(edit3.text,1,3)='Ins') and (RadioGroup2.ItemIndex=-1) then
begin
soob:='Определитесь с типом УДП';
end
else
if (copy(edit3.text,1,3)='Ins') and (RadioGroup2.ItemIndex=1) and (idudpzak='')  then
begin
soob:='Вы хотите создать подчинённый УДП,но для него ещё не введён основной УДП';
end
else
if (copy(edit3.text,1,3)='Ins') and (RadioGroup2.ItemIndex=1) and (idudpzak<>'') then
begin
OraQuery4.Close;
txx:='select udp_zakotk_id idudp from tronix.udp_zakotk where udp_zakazchik_udp_zakazchik_id='+idudpzak+' and rownum=1';
ShowMessage(' iii='+txx);
OraQuery4.SQL.Text:=txx;
OraQuery4.ExecSQL;
OraQuery4.Open;
//ShowMessage('fff='+OraQuery4.fieldByName('idudp').asString);
if OraQuery4.fieldByName('idudp').asString>'' then
soob:='Нельзя создавать подчинённый УДП,если у основного УДП есть привязки к УДП ОТК';
OraQuery4.Close;
end;

if soob<>'' then
ShowMessage(soob)
else
begin
if tipudp='' then
tipudp:=vidudp[RadioGroup1.ItemIndex+1];

//ShowMessage('FUdp_Zakazchik_InsUdp_tipudp='+tipudp);

tx1:='';
tx1:='select udz.udp,udz.date_end,udz.name,udz.udp_zakazchik_id from tronix.udp_zakazchik udz';
tx1:=tx1+' where udz.udp='''+tipudp+TxtUdp.Text+'''';
tx1:=tx1+' and udz.project_project_id='+edit1.text;

//ShowMessage('tx1='+tx1);

OraQuery3.SQL.Text:=tx1;
OraQuery3.ExecSQL;
OraQuery3.Open;
datudp:=OraQuery3.FieldByName('date_end').asString;
if datudp<>'' then
begin
//ShowMessage('Date=');
ShowMessage('УДП ЗАКРЫТО');
OraQuery3.Close;
end
else
begin
//ShowMessage('Save');
udpp:=OraQuery3.FieldByName('udp').asString;
udppn:=OraQuery3.FieldByName('name').asString;
idudp:=OraQuery3.FieldByName('udp_zakazchik_id').asString;
OraQuery3.Close;

if idudp<>'' then
begin
//ShowMessage(udpp+' есть!!!');
OraQuery3.Close;
txx:='Update tronix.udp_zakazchik set name='''+TxtUdpName.Text+'''';
txx:=txx+' where udp='''+udpp+'''';
txx:=txx+' and project_project_id='+edit1.text;
//ShowMessage('txx='+txx);
OraQuery3.SQL.Text:=txx;
OraQuery3.ExecSQL;
OraQuery3.Close;
end
else
begin
//ShowMessage('Insert');
InsertUdpOTK;
end
end;
ConnectUdpOTK;

SaveToOtherProject;

if copy(edit3.text,1,3)='Ins' then
begin
TxtUdp.Text:='';
TxtUdpName.Text:='';
idudp:='';
tipudp:='';
end;
end;
end;  //procedure TFUdp_Zakazchik_InsUdp.BitBtnSaveClick

procedure TFUdp_Zakazchik_InsUdp.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TFUdp_Zakazchik_InsUdp.CheckBox1Click(Sender: TObject);
begin
prizn:='0';
 if CheckBox1.Checked=true then
begin
  Application.CreateForm(TFUdp_Project_For_Copy, FUdp_Project_For_Copy);
  FUdp_Project_For_Copy.Edit1.Text:=Edit1.Text;
  FUdp_Project_For_Copy.Edit2.Text:=Edit2.Text;
  FUdp_Project_For_Copy.Edit3.Text:=Edit4.Text;
//ShowMessage('zakazchik_insudp to copy');
//ShowMessage(FUdp_Project_For_Copy.Edit3.Text);
  FUdp_Project_For_Copy.ShowModal();
  FUdp_Project_For_Copy.oraQuery1.First;
  while (not FUdp_Project_For_Copy.OraQuery1.eof) and (FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='0') do
Begin
FUdp_Project_For_Copy.oraQuery1.Next;
end;
if FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
prizn:='1';
end;
end; //procedure TFUdp_Zakazchik_InsUdp.CheckBox1Click

end.

