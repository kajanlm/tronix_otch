unit Udp_Zakazchik;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj, Buttons;

type
  TFUdp_Zakazchik = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1name: TStringField;
    OraQuery1datend: TStringField;
    OraQuery1idudp: TFloatField;
    OraQuery1idudpudp: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    OraQuery2udp: TStringField;
    OraQuery2name: TStringField;
    OraQuery2datend: TStringField;
    OraQuery2idudp: TFloatField;
    OraQuery1CHK_FLD: TStringField;
    OraQuery3: TOraQuery;
    OraQuery4: TOraQuery;
    OraQuery5: TOraQuery;
    RadioGroup1: TRadioGroup;
    BitBtnInsert: TBitBtn;
    BitBtnUpdate: TBitBtn;
    BitBtnDelete: TBitBtn;
    BitBtnSostav: TBitBtn;
    Shape1: TShape;
    BitBtnClose: TBitBtn;
    BitBtnCopy: TBitBtn;
    BitBtnInto: TBitBtn;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtnInsertClick(Sender: TObject);
    procedure BitBtnUpdateClick(Sender: TObject);
    procedure BitBtnCloseClick(Sender: TObject);
    procedure BitBtnDeleteClick(Sender: TObject);
    procedure BitBtnCopyClick(Sender: TObject);
    procedure BitBtnSostavClick(Sender: TObject);
    procedure BitBtnIntoClick(Sender: TObject);
 private
    { Private declarations }
    procedure SelectData;
    procedure CopyUdpZakazchik;
    procedure CopyUdpZakazchikUdpSostav;
    procedure CopyUdpZakOtk;
    procedure CopyUdpZakazchikSostav;
    procedure CopyForProject;
    procedure CopyForProjectSostav;
    procedure DeleteAll;
    procedure DeleteNoAll;
    procedure DeleteNoAllAll;
    procedure DeleteUdp;
  public
    { Public declarations }
  end;

var
  FUdp_Zakazchik: TFUdp_Zakazchik;
  MyBookmark: TBookMark;
  idudpzak,udpnamezak,udpudpzak,udpdel,idudpdel,udpinto,nameinto,rejim,idudpos,proektcopy,priznew,tidtrz,tidudptrz,cidudp,cname,cudp,zavnn,proekt: string;
  priznsostav,koldele,icopy,recn: integer;
copyin:array[1..20] of integer;
copyotkzak,copyidzak,copyudp:array[1..20] of string;
implementation

uses Unit9,Udp_Zakazchik_InsUdp,Udp_Project_For_Copy;


{$R *.dfm}

procedure TFUdp_Zakazchik.SelectData;
var tx: string;
begin
tx:=' ';
tx:=tx+'select ''0'' as CHK_FLD, udz.udp as udp, udz.name as name, decode(udz.date_end ,null,'''',to_char(udz.date_end ,''DD.MM.YYYY'')) as datend,';
tx:=tx+' udz.udp_zakazchik_id as idudp, udz.udp_zakazchik_udp_zakazchik_id as idudpudp,udz.project_project_id as idpr';
tx:=tx+' from tronix.udp_zakazchik udz where udz.project_project_id='+edit1.Text;
if rejim='' then
tx:=tx+' and udz.udp_zakazchik_udp_zakazchik_id is null'
else
tx:=tx+' and udz.udp_zakazchik_udp_zakazchik_id='+idudpzak;

tx:=tx+' order by nordsy.sort_char_number(udz.udp)';
//ShowMEssage(tx);

  OraQuery1.Close;
  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='УДП';
        FieldByName('name').DisplayLAbel:='НАИМЕНОВАНИЕ';
        FieldByName('datend').DisplayLAbel:='ДАТА ЗАКРЫТИЯ';
        FieldByName('idudp').DisplayLAbel:='ID УДП';
        FieldByName('idudpudp').DisplayLAbel:='ID УДПУДП';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
end; //procedure TFUdp_Zakazchik.SelectData

procedure TFUdp_Zakazchik.DeleteUdp;
var txx: string;
koldel,kol: integer;
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
//ShowMessage('deleteUdp rejim='+rejim+' idudpdel='+idudpdel+' udpdel='+udpdel);

OraQuery4.Close;
txx:='Delete tronix.udp_zakotk where udp_zakazchik_udp_zakazchik_id='+idudpdel;
OraQuery4.SQL.Text:=txx;
OraQuery4.ExecSQL;

txx:='';
txx:='select t.nn from(select count(*) nn from tronix.udp_zakotk udz';
txx:=txx+' where udz.udp_zakazchik_udp_zakazchik_id='+idudpdel+')t';
OraQuery4.Close;
OraQuery4.SQL.Text:=txx;
OraQuery4.ExecSQL;
OraQuery4.Open;
kol:=0;
if StrToInt(OraQuery4.FieldByName('nn').asString)<>0 then
begin
ShowMessage('Не все привязки к УДП '+OraQuery1.FieldByName('udp').asString+' удалились');
kol:=1;
koldele:=1;
end;

if kol=0 then
begin
OraQuery4.Close;
txx:='Delete tronix.udp_zakazchik where udp_zakazchik_id='+idudpdel;
OraQuery4.SQL.Text:=txx;
OraQuery4.ExecSQL;
inc(koldel);
end;
//ShowMessage('deleteUdp koldele='+IntToStr(koldele));

end; //procedure TFUdp_Zakazchik.DeleteUdp

procedure TFUdp_Zakazchik.DeleteNoAll;
var txx: string;
kolin,koldel,kol: integer;
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
RadioGroup1.Caption:='Удалить';
 if MessageDlg( ' Вы действительно хотите удалить все отмеченные УДП заказчика?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
DBGridEh1.DataSource.DataSet.DisableControls;
OraQuery1.First;
kolin:=0;
koldel:=0;
koldele:=0;
while not OraQuery1.eof do
Begin
if (RadioGroup1.ItemIndex=1) and (OraQuery1.FieldByName('CHK_FLD').asString='1') then
begin
idudpdel:=DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
udpdel:=DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
inc(kolin);
//ShowMessage('deleteNoAll rejim='+rejim+' idudpdel='+idudpdel+' udpdel='+udpdel);
DeleteUdp;
//ShowMessage('deleteNoAll koldele='+IntToStr(koldele));
if koldele=0 then
begin
inc(koldel);
end;
end;
oraQuery1.Next;
end;
ShowMessage('Отмечено на удаление='+IntToStr(kolin)+' УДП Удалено='+IntToStr(koldel));
end;
end; //procedure TFUdp_Zakazchik.DeleteNoAll

procedure TFUdp_Zakazchik.DeleteNoAllAll;
var txx: string;
kolin,koldel,kol: integer;
begin
//ShowMessage('deleteNoAllAll rejim='+rejim+' idudpdel='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString+' udpdel='+DbGridEh1.DataSource.DataSet.FieldByName('udp').asString);
recn:=DBGrideh1.DataSource.DataSet.recno;
RadioGroup1.Caption:='Удалить';
 if MessageDlg( ' Вы действительно хотите удалить все отмеченные УДП заказчика?',
  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
DBGridEh1.DataSource.DataSet.DisableControls;
OraQuery1.First;
kolin:=0;
koldel:=0;
while not OraQuery1.eof do
Begin

if (RadioGroup1.ItemIndex=1) and (OraQuery1.FieldByName('CHK_FLD').asString='1') then
begin
koldele:=0;
inc(kolin);
txx:='';
txx:='select t.nn from(select count(*) nn from tronix.udp_zakazchik udz';
txx:=txx+' where udz.udp_zakazchik_udp_zakazchik_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString+')t';
OraQuery3.SQL.Text:=txx;
OraQuery3.ExecSQL;
OraQuery3.Open;
//ShowMessage('deleteNoAllAll rejim='+rejim+' nn='+OraQuery3.FieldByName('nn').asString);

kol:=0;
if StrToInt(OraQuery3.FieldByName('nn').asString)=0 then
begin
OraQuery4.Close;
txx:='Delete tronix.udp_zakotk where udp_zakazchik_udp_zakazchik_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
OraQuery4.SQL.Text:=txx;
OraQuery4.ExecSQL;
end
else
begin
//ShowMessage('deleteNoAllAll rejim='+rejim+' nn>0');
OraQuery3.Close;
txx:='select udp_zakazchik_id idudp,udp udp from tronix.udp_zakazchik where udp_zakazchik_udp_zakazchik_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
OraQuery3.SQL.Text:=txx;
OraQuery3.ExecSQL;
OraQuery3.Open;
OraQuery3.First;
while not OraQuery3.eof do
Begin
idudpdel:=OraQuery3.FieldByName('idudp').asString;
udpdel:=OraQuery3.FieldByName('udp').asString;

//ShowMessage('deleteNoAllAll rejim='+rejim+' idudpdel='+idudpdel+' udpdel='+udpdel);
DeleteUdp;
//ShowMessage('deleteNoAllAll koldele='+IntToStr(koldele));
oraQuery3.Next;
end;
end;
if koldele=0 then
begin
OraQuery2.Close;
txx:='Delete tronix.udp_zakazchik where udp_zakazchik_id='+DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
OraQuery2.SQL.Text:=txx;
OraQuery2.ExecSQL;
inc(koldel);
end;
end;
oraQuery1.Next;
end;
ShowMessage('Отмечено на удаление='+IntToStr(kolin)+' УДП Удалено='+IntToStr(koldel));
end;
end; //procedure TFUdp_Zakazchik.DeleteNoAllAll

procedure TFUdp_Zakazchik.DeleteAll;
var soobdel,txx: string;
begin
//ShowMessage(' DeleteAll rejim='+rejim+' udp='+udpinto);
 soobdel:=' Вы действительно хотите удалить все УДП заказчика проекта '+edit3.text+' зав.№ '+edit2.text+' (при этом будут удалены все основные УДП,их подчинённые и их привязки к УДП ОТК)?';
 if rejim='InsInto' then
 soobdel:=' Вы действительно хотите для '+udpinto+' удалить все подчинённые и их првязки к УДП ОТК?';

 if MessageDlg( soobdel,  mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin

 DBGridEh1.DataSource.DataSet.DisableControls;

OraQuery2.Close;
txx:='Delete tronix.udp_zakotk where project_project_id='+edit1.text;

 if rejim='InsInto' then
txx:=txx+' and udp_zakazchik_udp_zakazchik_id in (select udp_zakazchik_id from tronix.udp_zakazchik where udp_zakazchik_udp_zakazchik_id='+idudpzak+')';
//ShowMessage(txx);
OraQuery2.SQL.Text:=txx;
OraQuery2.ExecSQL;

OraQuery2.Close;
txx:='Delete tronix.udp_zakazchik where project_project_id='+edit1.text;

if rejim='InsInto' then
txx:=txx+' and udp_zakazchik_udp_zakazchik_id='+idudpzak;

OraQuery2.SQL.Text:=txx;
OraQuery2.ExecSQL;

soobdel:= ' Удаление всех УДП заказчика проекта '+proekt+' зав.№ '+edit2.text+' закончено';
if rejim='InsInto' then
soobdel:= ' Удаление всех подчинённых и их привязки к УДП ОТК для УДП заказчика '+udpinto+' проекта '+proekt+' зав.№ '+edit2.text+' закончено';
ShowMessage(soobdel);
end;
end; //procedure TFUdp_Zakazchik.DeleteAll

procedure TFUdp_Zakazchik.BitBtnDeleteClick(Sender: TObject);
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
if recn<>0 then
begin
if RadioGroup1.ItemIndex=-1 then
begin
ShowMessage('Выберите режим удаления: ВСЕ или ОТМЕЧЕННЫЕ');
end
else
begin
//ShowMessage(' не -1');
if RadioGroup1.ItemIndex=0 then
begin
//ShowMessage(' удаление всех УДП заказчика,включая подчинённые и привязки к УДП ОТК, или (rejim=nsInto) весь состав конкретного УДП заказчика с их привязками к УДП ОТК');
DeleteAll;
end
else
begin
//ShowMessage(' =1');
if RadioGroup1.ItemIndex=1 then
begin
if rejim='InsInto' then
begin
//ShowMessage('отмеченные подчинённые и привязки к ним УДП ОТК ');
DeleteNoAll;
end
else
begin
//ShowMessage(' отмеченные УДП,подчинённые и привязки к ним УДП ОТК ');
DeleteNoAllAll;
end;
end;
end;

SelectData;
RadioGroup1.Caption:='Копировать \ Удалить';
RadioGroup1.ItemIndex:=-1;
DBGridEh1.DataSource.DataSet.EnableControls;
DBGrideh1.DataSource.DataSet.Refresh;
DBGrideh1.DataSource.DataSet.Recno:=recn;
end;
end; //if recn<>0 then

end; //procedure TFUdp_Zakazchik.BitBtnDeleteClick

procedure TFUdp_Zakazchik.CopyUdpZakOtk;
var udpconc,concid,tx,txc: string;
begin
//ShowMessage('CopyUdpZakOtk zavnn='+zavnn+' priznew='+priznew+' cidudp='+cidudp);

OraQuery4.Close;
txc:='';
txc:='select trz.udp_zakotk_id as idudp,trz.udp_zakazchik_udp_zakazchik_id as idzak,';
txc:=txc+' trz.concept_concept_id as idconc,co.concept_id as concid,co.shortname as consh';
txc:=txc+' from tronix.udp_zakotk trz,dic_concept co where trz.udp_zakazchik_udp_zakazchik_id='+cidudp;
txc:=txc+' and trz.concept_concept_id=co.concept_id';
txc:=txc+' and trz.project_project_id='+edit1.Text;
//ShowMessage(txc);
OraQuery4.SQL.Text:=txc;
OraQuery4.ExecSQL;
OraQuery4.Open;
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
//ShowMessage( 'concid='+OraQuery3.FieldByName('concid').asString)+' cosh='+OraQuery3.FieldByName('cosh').asString)+' udp='+OraQuery3.FieldByName('udp').asString);
if concid='' then
begin
ShowMessage(udpconc+' нет в словаре проекта '+proektcopy);
end
else
begin
 if priznew='1' then
begin
// ShowMessage('all copy otk');
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
end; //procedure TFUdp_Zakazchik.CopyUdpZakOtk;

procedure TFUdp_Zakazchik.CopyForProjectSostav;
var txc: string;
begin
//ShowMessage('CopyForProjectSostav');
FUdp_Project_For_Copy.oraQuery1.First;
 while not FUdp_Project_For_Copy.OraQuery1.eof do
Begin
tidtrz:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('idpr').asString;
zavnn:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('zavn').asString;
proektcopy:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('proekt').asString;
//ShowMessage('CopyForProjectSostav tidtrz='+tidtrz+' zavnn='+zavnn);

if  FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
begin
inc(icopy);
// проверяем создан ли в проекте в который копируем УДП заказчика родителя
if copyidzak[icopy]='' then
begin
//ShowMessage('CopyForProjectSostav udpudpzak='+udpudpzak+' tidtrz='+tidtrz);
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name,tronix.udp_sele_zakotk(trz.udp_zakazchik_id) udpkol';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp_zakazchik_udp_zakazchik_id is null and trz.udp='''+udpudpzak+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
copyotkzak[icopy]:=OraQuery3.FieldByName('udpkol').asString;
copyidzak[icopy]:=OraQuery3.FieldByName('idudp').asString;
copyudp[icopy]:=zavnn;
if OraQuery3.FieldByName('idudp').asString='' then
begin
//ShowMessage('CopyForProjectSostav вставляем УДП заказчика родителя='+udpudpzak);
OraQuery3.Close;
txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
txc:=txc+''''+udpudpzak+''',' ;
txc:=txc+''''+udpnamezak+''',null,null,';
txc:=txc+tidtrz+')';
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

//ShowMessage('CopyForProjectSostav вставили УДП заказчика родителя='+udpudpzak+' в проект '+zavnn+' '+proektcopy);

txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp_zakazchik_udp_zakazchik_id is null and trz.udp='''+udpudpzak+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
copyidzak[icopy]:=OraQuery3.FieldByName('idudp').asString;
//ShowMessage('CopyForProjectSostav запомнили id УДП заказчика родителя в copyidzak[icopy]='+copyidzak[icopy]+' icopy='+IntToStr(icopy));

end; // if OraQuery3.FieldByName('idudp').asString='' then
end; //if copyidzak[icopy]=' ' then

//ShowMessage('CopyForProjectSostav id УДП заказчика родителя '+udpudpzak+'  copyidzak[icopy]='+copyidzak[icopy]+' icopy='+IntToStr(icopy)+' для '+copyudp[icopy]);

if copyotkzak[icopy]<>'0' then
ShowMessage('CopyForProjectSostav  УДП  заказчика есть привязки к УДП ОТК в проекте '+copyudp[icopy]+' '+proektcopy+'.  Состав копировать нельзя!')
else
begin

//ShowMessage('CopyForProjectSostav проверяем есть ли такой УДП  для заказчика родителя в проекте='+copyidzak[icopy]+' icopy='+IntToStr(icopy)+' УДП='+cudp);

OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp;
txc:=txc+''' and trz.udp_zakazchik_udp_zakazchik_id='+copyidzak[icopy]+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;

//ShowMessage('CopyForProjectSostav udptrz='+FUdp_Zakazchik.OraQuery3.FieldByName('udp').asString);

tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;

if tudptrz='' then
begin
//ShowMessage('CopyForProjectSostav Состава нет. Вставляем в instrz tidtrz='+tidtrz+' icopy='+IntToStr(icopy)+'copyidzak[icopy]='+copyidzak[icopy]+' УДП='+cudp);
priznew:='1';
OraQuery3.Close;
txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
txc:=txc+''''+cudp+''',' ;
txc:=txc+''''+cname+''',null,'+copyidzak[icopy]+',';
txc:=txc+tidtrz+')';
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

//ShowMessage('CopyForProjectSostav icopy='+IntToStr(icopy)+' copyudp='+ copyudp[icopy]);

txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp+'''';
txc:=txc+' and trz.udp_zakazchik_udp_zakazchik_id='+copyidzak[icopy]+'and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
inc(copyin[icopy]);
//ShowMessage('CopyForProjectSostav вставили idtrz='+tidudptrz+' УДП='+tudptrz+' copyidzak[icopy]='+copyidzak[icopy]+' УДП='+cudp);
CopyUdpZakOtk;
end; if tudptrz='' then
end; //if copyotkzak[icopy]='0' then
end; // if  FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1'
priznew:='0';
FUdp_Project_For_Copy.oraQuery1.Next;
end; // while not FUdp_Project_For_Copy.OraQuery1.eof do
end; //procedure TFUdp_Zakazchik.CopyForProjectSostav;

procedure TFUdp_Zakazchik.CopyUdpZakazchikSostav;
begin
//ShowMessage('CopyUdpZakazchikSostav');
OraQuery1.Open;
DBGridEh1.DataSource.DataSet.DisableControls;
//ShowMessage('udpudpzak='+udpudpzak+' udpnamezak='+udpnamezak);
priznew:='0';
for icopy:=1 to 20 do
begin
copyin[icopy]:=0;
copyudp[icopy]:='';
copyidzak[icopy]:='';
copyotkzak[icopy]:='0';
end;

OraQuery1.First;
while not OraQuery1.eof do
Begin
if (RadioGroup1.ItemIndex=0) or ((RadioGroup1.ItemIndex=1) and (OraQuery1.FieldByName('CHK_FLD').asString='1')) then
begin
cudp:=OraQuery1.FieldByName('udp').asString;
cname:=OraQuery1.FieldByName('name').asString;
cidudp:=OraQuery1.FieldByName('idudp').asString;
//ShowMessage('cudp='+cudp+' cname='+cname+' cidudp='+cidudp);
icopy:=0;

CopyForProjectSostav;

end;
oraQuery1.Next;
icopy:=0;
end;
icopy:=1;
while copyudp[icopy]<>'' do
begin
if copyin[icopy]<>0 then
begin
ShowMessage('На зав.№ '+copyudp[icopy]+' Скопировано='+IntToStr(copyin[icopy]));
end;

inc(icopy);
end;
DBGridEh1.DataSource.DataSet.EnableControls;
DBGridEh1.DataSource.DataSet.Refresh;
RadioGroup1.ItemIndex:=-1;
DBGrideh1.DataSource.DataSet.recno:=recn;
end; // procedure TFUdp_Zakazchik.CopyUdpZakazchikSostav

procedure TFUdp_Zakazchik.CopyForProject;
var txc: string;
begin
FUdp_Project_For_Copy.oraQuery1.First;
 while not FUdp_Project_For_Copy.OraQuery1.eof do
Begin
tidtrz:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('idpr').asString;
zavnn:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('zavn').asString;
proektcopy:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('proekt').asString;
//ShowMessage('tidtrz='+tidtrz+' zavnn='+zavnn);

if  FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
begin
inc(icopy);
// проверяем есть ли привязка основного удп к УДП ОТК в проекте в который копируем УДП заказчика родителя
if copyotkzak[icopy]='0' then
begin
// проверяем создан ли в проекте в который копируем УДП заказчика родителя
if copyidzak[icopy]='' then
begin
//ShowMessage('CopyForProject udpudpzak='+udpudpzak+' tidtrz='+tidtrz);
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name,tronix.udp_sele_zakotk(trz.udp_zakazchik_id) udpkol';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp_zakazchik_udp_zakazchik_id is null and trz.udp='''+udpudpzak+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
copyotkzak[icopy]:=OraQuery3.FieldByName('udpkol').asString;
copyudp[icopy]:=zavnn;
if OraQuery3.FieldByName('udpkol').asString='0' then
begin
if OraQuery3.FieldByName('idudp').asString='' then
begin
//ShowMessage('CopyForProject вставляем УДП заказчика родителя='+udpudpzak);
OraQuery3.Close;
txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
txc:=txc+''''+udpudpzak+''',' ;
txc:=txc+''''+udpnamezak+''',null,null,';
txc:=txc+tidtrz+')';
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

//ShowMessage('CopyForProject вставили УДП заказчика родителя='+udpudpzak+' в проект '+zavnn+' '+proektcopy);
end;

txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp_zakazchik_udp_zakazchik_id is null and trz.udp='''+udpudpzak+'''';
txc:=txc+' and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
end;
//ShowMessage('CopyForProject id УДП заказчика родителя OraQuery3.FieldByName(idudp).asString='+OraQuery3.FieldByName('idudp').asString);
copyidzak[icopy]:=OraQuery3.FieldByName('idudp').asString;

//ShowMessage('CopyForProject запомнили id УДП заказчика родителя в copyidzak[icopy]='+copyidzak[icopy]+' icopy='+IntToStr(icopy));

inc(copyin[icopy]);

//ShowMessage('CopyForProject проверяем есть ли состав для заказчика родителя в проекте='+copyidzak[icopy]+' icopy='+IntToStr(icopy)+' УДП='+cudp);

OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp;
txc:=txc+''' and trz.udp_zakazchik_udp_zakazchik_id='+copyidzak[icopy]+' and trz.project_project_id='+tidtrz;
//ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;

//ShowMessage('CopyForProject udptrz='+FUdp_Zakazchik.OraQuery3.FieldByName('udp').asString);

tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;

if tudptrz='' then
begin
// ShowMessage('CopyForProject Состава нет. Вставляем в instrz tidtrz='+tidtrz+' icopy='+IntToStr(icopy)+'copyidzak[icopy]='+copyidzak[icopy]+' УДП='+cudp);
priznew:='1';
OraQuery3.Close;
 txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
 txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
 txc:=txc+''''+cudp+''',' ;
 txc:=txc+''''+cname+''',null,'+copyidzak[icopy]+',';
 txc:=txc+tidtrz+')';
// ShowMessage(txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

//ShowMessage('CopyForProject icopy='+IntToStr(icopy)+' copyudp='+ copyudp[icopy]);

txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp+'''';
txc:=txc+' and trz.udp_zakazchik_udp_zakazchik_id='+copyidzak[icopy]+'and trz.project_project_id='+tidtrz;
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
//ShowMessage('CopyForProject вставили idtrz='+tidudptrz+' УДП='+tudptrz+' copyidzak[icopy]='+copyidzak[icopy]+' УДП='+cudp);
end;
CopyUdpZakOtk;
end;
end; //OraQuery3.FieldByName('udpkol').asString='0' then
end; //if copyotkzak[icopy]='0' then
priznew:='0';
FUdp_Project_For_Copy.oraQuery1.Next;
end;
end; //procedure TFUdp_Zakazchik.CopyForProject;

procedure TFUdp_Zakazchik.CopyUdpZakazchikUdpSostav;
var tnametrz,tudptrz,tx,txc: string;
begin
//ShowMessage('CopyUdpZakazchikUdpSostav udpudpzak='+udpudpzak+' udpnamezak='+udpnamezak);
priznew:='0';
for icopy:=1 to 20 do
begin
copyin[icopy]:=0;
copyudp[icopy]:='';
copyidzak[icopy]:='';
copyotkzak[icopy]:='0';
end;

//  состава этого УДП заказчика
OraQuery5.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp_zakazchik_udp_zakazchik_id='+cidudp;
//ShowMessage(' CopyUdpZakazchikUdpSostav '+txc);
OraQuery5.SQL.Text:=txc;
OraQuery5.ExecSQL;
OraQuery5.Open;
OraQuery5.First;
while not OraQuery5.eof do
Begin
cudp:=OraQuery5.FieldByName('udp').asString;
cname:=OraQuery5.FieldByName('name').asString;
cidudp:=OraQuery5.FieldByName('idudp').asString;
//ShowMessage('CopyUdpZakazchikUdpSostav cudp='+cudp+' cname='+cname+' cidudp='+cidudp);
icopy:=0;

CopyForProjectSostav;

oraQuery5.Next;
icopy:=0;
end;
icopy:=1;
end; // procedure TFUdp_Zakazchik.CopyUdpZakazchikUdpSostav

procedure TFUdp_Zakazchik.CopyUdpZakazchik;
var koliudpzak,tnametrz,tudptrz,tx,txc: string;
begin
//ShowMessage('CopyUdpZakazchik');
OraQuery1.Open;
DBGridEh1.DataSource.DataSet.DisableControls;
priznew:='0';
koliudpzak:='0';
for icopy:=1 to 20 do
begin
copyin[icopy]:=0;
copyudp[icopy]:='';
end;
OraQuery1.First;
while not OraQuery1.eof do
Begin
//ShowMessage('CopyUdpZakazchik_000 прочитали udp='+OraQuery1.FieldByName('udp').asString);
if (RadioGroup1.ItemIndex=0) or ((RadioGroup1.ItemIndex=1) and (OraQuery1.FieldByName('CHK_FLD').asString='1')) then
begin
cudp:=OraQuery1.FieldByName('udp').asString;
cname:=OraQuery1.FieldByName('name').asString;
cidudp:=OraQuery1.FieldByName('idudp').asString;

//ShowMessage('CopyUdpZakazchik cudp='+cudp+' cname='+cname+' cidudp='+cidudp);
icopy:=0;
// проверяем наличие состава у этого УДП
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id idudp,trz.udp udp,trz.name name';
txc:=txc+' from tronix.udp_zakazchik trz where rownum=1 and trz.udp_zakazchik_udp_zakazchik_id='+cidudp;
//ShowMessage('CopyUdpZakazchik '+txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
//ShowMessage('CopyUdpZakazchik для udp='+cudp+' найден подчинённый='+OraQuery3.FieldByName('udp').asString);
if OraQuery3.FieldByName('idudp').asString<>'' then
begin
idudpzak:=cidudp;
udpudpzak:=cudp;
udpnamezak:=cname;
CopyUdpZakazchikUdpSostav;
//ShowMessage('CopyUdpZakazchik после CopyUdpZakazchikUdpSostav udp='+OraQuery1.FieldByName('udp').asString+' копия выполнена');
end
else
begin
FUdp_Project_For_Copy.oraQuery1.First;
  while not FUdp_Project_For_Copy.OraQuery1.eof do
Begin
tidtrz:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('idpr').asString;
zavnn:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('zavn').asString;
proektcopy:=FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('proekt').asString;
//ShowMessage('CopyUdpZakazchik tidtrz='+ tidtrz+' zavnn='+ zavnn);

if  FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
begin
inc(icopy);
OraQuery3.Close;
txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name,tronix.udp_sele_zakazchik(trz.udp_zakazchik_id) udpkol';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp+'''';
txc:=txc+' and trz.udp_zakazchik_udp_zakazchik_id is null and trz.project_project_id='+tidtrz;
//ShowMessage('CopyUdpZakazchik '+txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
//ShowMessage('CopyUdpZakazchik udptrz='+FUdp_Zakazchik.OraQuery3.FieldByName('udp').asString);
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
koliudpzak:=OraQuery3.FieldByName('udpkol').asString;

if tudptrz='' then
begin
//ShowMessage('CopyUdpZakazchik instrz='+tidtrz);
priznew:='1';
OraQuery3.Close;
txc:='insert into tronix.udp_zakazchik (udp_zakazchik_id,udp,name,date_end,udp_zakazchik_udp_zakazchik_id,project_project_id)';
txc:=txc+' values ((select decode(t.nn,0,1,t.nn+1) from( select nvl(max(udp_zakazchik_id),0) nn from tronix.udp_zakazchik) t),';
txc:=txc+''''+cudp+''',' ;
txc:=txc+''''+cname+''',null,null,';
txc:=txc+tidtrz+')';
//ShowMessage('CopyUdpZakazchik '+txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Close;

inc(copyin[icopy]);
copyudp[icopy]:=zavnn;
//ShowMessage('CopyUdpZakazchik icopy='+IntToStr(icopy)+' copyudp='+ copyudp[icopy]);

txc:='';
txc:=txc+' select trz.udp_zakazchik_id as idudp,trz.udp as udp,trz.name as name';
txc:=txc+' from tronix.udp_zakazchik trz where trz.udp='''+cudp+'''';
txc:=txc+' and trz.udp_zakazchik_udp_zakazchik_id is null and trz.project_project_id='+tidtrz;
//ShowMessage('CopyUdpZakazchik '+txc);
OraQuery3.SQL.Text:=txc;
OraQuery3.ExecSQL;
OraQuery3.Open;
tudptrz:=OraQuery3.FieldByName('udp').asString;
tidudptrz:=OraQuery3.FieldByName('idudp').asString;
//ShowMessage('CopyUdpZakazchik tidudptrz='+tidudptrz+' tudptrz='+tudptrz);
end;

if koliudpzak='0' then
CopyUdpZakOtk
else
ShowMessage('Для УДП '+tudptrz+' проекта '+zavnn+' '+proektcopy+' привязка УДП ОТК не выполнена,т.к. у данного УДП есть подчинённые');

end; //if  FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
priznew:='0';
FUdp_Project_For_Copy.oraQuery1.Next;
end; //  while not FUdp_Project_For_Copy.OraQuery1.eof do
end; //if OraQuery3.FieldByName('idudp').asString<>'' then
end; //if (RadioGroup1.ItemIndex=0) or ((RadioGroup1.ItemIndex=1) and (OraQuery1.FieldByName('CHK_FLD').asString='1')) then
oraQuery1.Next;
//ShowMessage('CopyUdpZakazchik прочитали следующее udp='+OraQuery1.FieldByName('udp').asString);
icopy:=0;
end; //while not OraQuery1.eof do
icopy:=1;

while copyudp[icopy]<>'' do
begin
ShowMessage('На зав.№='+copyudp[icopy]+' Копирование выполнено');
inc(icopy);
end;

DBGridEh1.DataSource.DataSet.EnableControls;
DBGridEh1.DataSource.DataSet.Refresh;
RadioGroup1.ItemIndex:=-1;
DBGrideh1.DataSource.DataSet.recno:=recn;
end; //procedure TFUdp_Zakazchik.CopyUdpZakazchik

procedure TFUdp_Zakazchik.FormShow(Sender: TObject);
var dd,txx,cexuser: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);
//ShowMessage(Edit3.Text);

for icopy:=1 to 20 do
begin
copyin[icopy]:=0;
copyudp[icopy]:='';
end;
idudpzak:='';
rejim:='';

txx:='';
txx:=txx+'select proekt from tronix.project_list where project_id='+edit1.text;
  OraQuery3.Close;
  OraQuery3.SQL.Text:=txx;
  OraQuery3.Open;
proekt:=OraQuery3.FieldByName('proekt').asString;

txx:='';
txx:=txx+'select de.nomer from kadry_dep de,kadry_prikaz pii,kadry_type_prikaz tpp where pii.ts_number=USER and pii.escape_date is null';
txx:=txx+' and pii.type_prikaz_type_prikaz_id=tpp.type_prikaz_id and tpp.kod=1 and pii.dep_dep_id=de.dep_id';

  OraQuery3.Close;

  OraQuery3.SQL.Text:=txx;

  OraQuery3.Open;

 cexuser:=OraQuery3.FieldByName('nomer').asString;
//ShowMessage(cexuser);

  if (cexuser<>'37') and (cexuser<>'38') and (cexuser<>'43') then
  begin
   FUdp_Zakazchik.BitBtnCopy.Enabled:=false;
   FUdp_Zakazchik.BitBtnDelete.Enabled:=false;
   FUdp_Zakazchik.BitBtnInsert.Enabled:=false;
   FUdp_Zakazchik.BitBtnUpdate.Enabled:=false;
   FUdp_Zakazchik.RadioGroup1.Enabled:=false;
   end;

OraQuery3.Close;

SelectData;

end; //procedure TFUdp_Zakazchik.FormShow

procedure TFUdp_Zakazchik.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;

end;

procedure TFUdp_Zakazchik.DBGridEh1DblClick(Sender: TObject);
var tx1,zakr: string;
begin
MyBookMark:= DBGrideh1.DataSource.DataSet.GetBookmark;
end; //procedure TFUdp_Zakazchik.DBGridEh1DblClick

procedure TFUdp_Zakazchik.BitBtnInsertClick(Sender: TObject);
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
Application.CreateForm(TFUdp_Zakazchik_InsUdp, FUdp_Zakazchik_InsUdp);
FUdp_Zakazchik_InsUdp.Edit1.Text:=Edit1.Text;
FUdp_Zakazchik_InsUdp.Edit2.Text:=Edit2.Text;

FUdp_Zakazchik_InsUdp.Edit3.Text:='Insert';

if rejim<>'' then
FUdp_Zakazchik_InsUdp.Edit3.Text:='InsInto'
else
begin
idudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
udpnamezak:=DbGridEh1.DataSource.DataSet.FieldByName('name').asString;
udpudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
end;

//ShowMessage('Zakazchik.InsertClick1 Edit3='+FUdp_Zakazchik_InsUdp.Edit3.Text+' idudpzak='+idudpzak+' udpnamezak='+udpnamezak+' rejim='+rejim);
//ShowMessage('Zakazchik InsertClick2 Edit3='+FUdp_Zakazchik_InsUdp.Edit3.Text+' idudpzak='+idudpzak+' FUdp_Zakazchik.Edit5='+Edit5.Text);

FUdp_Zakazchik_InsUdp.Edit4.Text:=proekt;
FUdp_Zakazchik_InsUdp.Caption:='Ввод УДП Заказчика : ';
FUdp_Zakazchik_InsUdp.ShowModal();
FUdp_Zakazchik_InsUdp.Free;

SelectData;
end; //procedure TFUdp_Zakazchik.BitBtnInsertClick

procedure TFUdp_Zakazchik.BitBtnUpdateClick(Sender: TObject);
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
if recn<>0 then
begin
//  ShowMessage('Zakazchik.BitBtnUpdateClick recn='+IntToStr(recn));
  Application.CreateForm(TFUdp_Zakazchik_InsUdp, FUdp_Zakazchik_InsUdp);
  FUdp_Zakazchik_InsUdp.Edit1.Text:=Edit1.Text;
  FUdp_Zakazchik_InsUdp.Edit2.Text:=Edit2.Text;
  FUdp_Zakazchik_InsUdp.Edit3.Text:='Update';
  FUdp_Zakazchik_InsUdp.Edit4.Text:=proekt;
  FUdp_Zakazchik_InsUdp.Caption:='Редактирование УДП Заказчика : ';
  FUdp_Zakazchik_InsUdp.ShowModal();
  FUdp_Zakazchik_InsUdp.Free;
 SelectData;
DBGrideh1.DataSource.DataSet.recno:=recn;
end;
end; //procedure TFUdp_Zakazchik.BitBtnUpdateClick

procedure TFUdp_Zakazchik.BitBtnCloseClick(Sender: TObject);
begin
Close;
end;

procedure TFUdp_Zakazchik.BitBtnCopyClick(Sender: TObject);
begin
RadioGroup1.Caption:='Копировать';
recn:=DBGrideh1.DataSource.DataSet.Recno;
if recn<>0 then
begin
//ShowMessage('Zakazchik.BitBtnCopyClick recn='+IntToStr(recn));

Application.CreateForm(TFUdp_Project_For_Copy, FUdp_Project_For_Copy);
FUdp_Project_For_Copy.Edit1.Text:=Edit1.Text;
FUdp_Project_For_Copy.Edit2.Text:=Edit2.Text;
FUdp_Project_For_Copy.Edit3.Text:=proekt;
FUdp_Project_For_Copy.ShowModal();
FUdp_Project_For_Copy.oraQuery1.First;
while (not FUdp_Project_For_Copy.OraQuery1.eof) and (FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='0') do
Begin
FUdp_Project_For_Copy.oraQuery1.Next;
end;
if FUdp_Project_For_Copy.DbGridEh1.DataSource.DataSet.FieldByName('chk_fld').asString='1' then
begin
if rejim='InsInto' then
begin
CopyUdpZakazchikSostav;
end
else
begin
idudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
udpnamezak:=DbGridEh1.DataSource.DataSet.FieldByName('name').asString;
udpudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
CopyUdpZakazchik;
end
end;
end;
end; //procedure TFUdp_Zakazchik.BitBtnCopyClick

procedure TFUdp_Zakazchik.BitBtnSostavClick(Sender: TObject);
begin
recn:=DBGrideh1.DataSource.DataSet.recno;
if recn<>0 then
begin
//ShowMessage('Zakazchik.BitBtnUpdateClick recn='+IntToStr(recn));
  Application.CreateForm(TFUdp_Zakazchik_InsUdp, FUdp_Zakazchik_InsUdp);
  FUdp_Zakazchik_InsUdp.Edit1.Text:=Edit1.Text;
  FUdp_Zakazchik_InsUdp.Edit2.Text:=Edit2.Text;
  FUdp_Zakazchik_InsUdp.Edit3.Text:='Sostav';
  FUdp_Zakazchik_InsUdp.Edit4.Text:=proekt;
  FUdp_Zakazchik_InsUdp.Caption:='Состав УДП Заказчика : ';
  FUdp_Zakazchik_InsUdp.ShowModal();
  FUdp_Zakazchik_InsUdp.Free;
end;
end; //procedure TFUdp_Zakazchik.BitBtnSostavClick

procedure TFUdp_Zakazchik.BitBtnIntoClick(Sender: TObject);
begin
  if rejim='' then
 begin
  rejim:='InsInto';
idudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('idudp').asString;
udpnamezak:=DbGridEh1.DataSource.DataSet.FieldByName('name').asString;
udpudpzak:=DbGridEh1.DataSource.DataSet.FieldByName('udp').asString;
  Edit5.Text:=idudpzak;
  Edit6.Text:=udpudpzak;
  Edit7.Text:=udpnamezak;
  recn:=DBGrideh1.DataSource.DataSet.recno;
  BitBtnInto.Hint:='Вернуться к основному УДП';
  SelectData;
  end
  else
  begin
rejim:='';
idudpzak:='';
udpudpzak:='';
udpnamezak:='';
BitBtnInto.Hint:='Открыть подчинённые УДП';
 SelectData;
DBGrideh1.DataSource.DataSet.recno:=recn;
end;
end; //procedure TFUdp_Zakazchik.BitBtnIntoClick

end.

