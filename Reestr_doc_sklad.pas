unit Reestr_doc_sklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFReestr_doc_sklad = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1dep: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    OraQuery2: TOraQuery;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FReestr_doc_sklad: TFReestr_doc_sklad;
  MyBookmark: TBookMark;
  userfio,peri,dn,dk: string;
implementation

uses Unit9;


{$R *.dfm}

procedure TFReestr_doc_sklad.FormShow(Sender: TObject);
var dd,txx,tx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

RadioGroup1.ItemIndex:=1;
DateTimePicker1.DateTime:=date();
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);

peri:='c '+FormatDateTime('dd.mm.yyyy',DateTimePicker1.DateTime)+'  по '+FormatDateTime('dd.mm.yyyy',DateTimePicker2.DateTime);
if dn=dk then
peri:='за '+FormatDateTime('dd.mm.yyyy',DateTimePicker1.DateTime);

txx:='';
txx:=txx+'select substr(na.surname,1,1)||lower(substr(na.surname,2,length(na.surname)-1))||'' ''||substr(na.name,1,1)||''. ''||substr(na.patronymic,1,1)||''. '' fio';
txx:=txx+' from kadry_dep de,kadry_prikaz pii,kadry_type_prikaz tpp,kadry_name na where pii.ts_number=USER and pii.escape_date is null';
txx:=txx+' and pii.type_prikaz_type_prikaz_id=tpp.type_prikaz_id and tpp.kod=1 and pii.cadry_cadry_id=na.cadry_cadry_id';

  OraQuery2.Close;

  OraQuery2.SQL.Text:=txx;

  OraQuery2.Open;

userfio:=OraQuery2.FieldByName('fio').asString;

//ShowMessage(userfio);

 OraQuery2.Close;

tx:=' ';
tx:=tx+'select ''0'' as CHK_FLD, de.nomer as dep from kadry_dep  de where de.type_dep_type_dep_id=5';
tx:=tx+' and de.nomer<> ''02-26''and de.nomer<> ''07-99''';
tx:=tx+' order by nordsy.sort_char_number(de.nomer)';
//and de.nomer <> ''20 скл''
   OraQuery1.Close;
  With OraQuery1 Do
     begin
        FieldByName('chk_fld').DisplayLAbel:='ОТМЕТКА';
        FieldByName('dep').DisplayLAbel:='СКЛАД';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
 
end;


procedure TFReestr_doc_sklad.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

procedure TFReestr_doc_sklad.Button2Click(Sender: TObject);
var
FExcel,Sheet,Range: OleVariant;
tx: string;
stn,stk,cx,op,ran,ree,perio,stipt,tipt,skl: string;
nkoli,koli,nst,nst0,kst,nn,nk: integer;
begin
peri:='c '+FormatDateTime('dd.mm.yyyy',DateTimePicker1.DateTime)+'  по '+FormatDateTime('dd.mm.yyyy',DateTimePicker2.DateTime);
if dn=dk then
peri:='за '+FormatDateTime('dd.mm.yyyy',DateTimePicker1.DateTime);

skl:='';
koli:=0;
tx:='';
nst0:=3;
kst:=9;
stn:='C';
stk:='I';

OraQuery1.Open;
oraQuery1.First;
while not OraQuery1.eof do
Begin
if OraQuery1.FieldByName('CHK_FLD').asString='1' then
begin
if skl='' then
skl:=''''+OraQuery1.FieldByName('dep').asString+''''
else
skl:=skl+','''+OraQuery1.FieldByName('dep').asString+'''';
end;
oraQuery1.Next;
end;

if RadioGroup1.ItemIndex=0 then
begin
tipt:='1';
stipt:='приходу';

tx:=tx+'select l.oper as oper,l.nomer as nomer,l.depfrom as depfrom,l.depto as depto';
tx:=tx+' from(';
tx:=tx+' select ''75'' oper,tn.nomer nomer,df.nomer depto,dt.nomer depfrom from tronix.ttn tn,kadry_dep df,kadry_dep dt';
tx:=tx+' where tn.dep_dep_id_from=df.dep_id(+) and tn.dep_dep_id_to=dt.dep_id(+)';
tx:=tx+' and dt.nomer in ('+skl;
tx:=tx+') and tn.date_ins is not null and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;
tx:=tx+' and tn.type_ttn_type_ttn_id=1';
tx:=tx+' )l';
tx:=tx+' order by l.depfrom,l.oper,nordsy.sort_char_number(l.nomer)';
end;

if RadioGroup1.ItemIndex=1 then
begin
tipt:='(5,10,23,44,45,56,59)';
stipt:='расходу';
tx:='';
tx:=tx+'select l.oper as oper,l.nomer as nomer,l.depfrom as depfrom,l.depto as depto';
tx:=tx+' from(';

tx:=tx+' select ''73'' oper,tn.nomer nomer,df.nomer depfrom,substr(dt.nomer,1,2) depto from tronix.ttn tn,kadry_dep df,kadry_dep dt';
tx:=tx+' where tn.dep_dep_id_from=df.dep_id(+) and tn.dep_dep_id_to=dt.dep_id(+)';
tx:=tx+' and df.nomer in ('+skl;
tx:=tx+') and tn.date_ins is not null and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;
tx:=tx+' and tn.type_ttn_type_ttn_id in (5,23,44,59)';

tx:=tx+' union all';

tx:=tx+' select ''75'' oper,tn.nomer nomer,dt.nomer depfrom,substr(df.nomer,1,2) depto from tronix.ttn tn,kadry_dep df,kadry_dep dt';
tx:=tx+' where tn.dep_dep_id_from=df.dep_id(+) and tn.dep_dep_id_to=dt.dep_id(+)';
tx:=tx+' and dt.nomer in ('+skl;
tx:=tx+') and tn.date_ins is not null and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;
tx:=tx+' and tn.type_ttn_type_ttn_id in (10,45,56)';
tx:=tx+' )l';
if CheckBox1.Checked=true then
begin
nst0:=4;
kst:=10;
stn:='D';
stk:='J';
tx:=tx+' order by l.depfrom,l.oper,nordsy.sort_char_number(l.depto),nordsy.sort_char_number(l.nomer)'
end
else
tx:=tx+' order by l.depfrom,l.oper,nordsy.sort_char_number(l.nomer)';
end;

//ShowMessage(tx);

  OraQuery2.Close;

  OraQuery2.SQL.Text:=tx;

nn:=0;
nk := 1;
skl:='';
op:='';
cx:='';
FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

if CheckBox1.Checked=false then
//FExcel.Workbooks.Add('c:\SHABLON_REESTR_DOC_SKLAD.xls')
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_REESTR_DOC_SKLAD.xls')
else
//FExcel.Workbooks.Add('c:\SHABLON_REESTR_DOC_SKLAD_CEX.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_REESTR_DOC_SKLAD_CEX.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'reestr';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery2.Open;
OraQuery2.First;

While not OraQuery2.eof do
Begin
//ShowMessage(OraQuery2.FieldByName('depfrom').asString);

if skl<>OraQuery2.FieldByName('depfrom').asString  then
begin
op:='';
if nn<>0 then
begin
Sheet.Range[Sheet.Cells[nn,1], Sheet.Cells[nk,kst]].borders.linestyle:=xlContinuous;
ran:='A'+IntToStr(nkoli)+':B'+IntToStr(nkoli);

Sheet.Cells[nkoli,2].Value:=IntToStr(koli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;

if nst0=4 then
begin
Sheet.Cells[nkoli,3].Value:=cx;
ran:='C'+IntToStr(nkoli)+':C'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;
end;

Inc(nk);
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].value:=FormatDateTime('dd.mm.yyyy',date());
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,5],Sheet.Cells[nk,5]].value:='Сдал';
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].value:=userfio;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
Inc(nk);
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].value:= '"      "          20      г.';
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,5],Sheet.Cells[nk,5]].value:= 'Принял';
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].PageBreak:=xlPageBreakManual;
end;

ree:='';
ree:= InputBox(skl, 'Введите номер реестра ', '');

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Value:='Склад '+OraQuery2.FieldByName('depfrom').asString+':     Реестр   '+ree+'   сдачи документов по '+stipt;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].VerticalAlignment:=xlCenter;
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Value:=peri;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].VerticalAlignment:=xlCenter;
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].MergeCells:=true;
Inc(nk);
nn:=nk;
ran:=IntToStr(nk);
ran:='A'+IntToStr(nk)+':A'+IntToStr(nk+1);
Sheet.Range[ran].MergeCells:=true;
Sheet.Range[ran].value:='Опер.';

ran:='B'+IntToStr(nk)+':B'+IntToStr(nk+1);
Sheet.Range[ran].MergeCells:=true;
Sheet.Range[ran].value:='Кол-во док.';

if nst0=4 then
begin
ran:='C'+IntToStr(nk)+':C'+IntToStr(nk+1);
Sheet.Range[ran].MergeCells:=true;
Sheet.Range[ran].value:='Цех';
cx:='';
end;

ran:=stn+IntToStr(nk)+':'+stk+IntToStr(nk+1);
Sheet.Range[ran].MergeCells:=true;
Sheet.Range[ran].value:='Номера первичных документов';

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk+1,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk+1,kst]].WrapText:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk+1,kst]].HorizontalAlignment:=xlCenter;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk+1,kst]].VerticalAlignment:=xlCenter;

nst:=nst0;
koli:=0;
//skl:='';
skl:=OraQuery2.FieldByName('depfrom').asString;
op:=OraQuery2.FieldByName('oper').asString;
inc(nk);
inc(nk);
nkoli:=nk;

Sheet.Cells[nk,1].Value:=OraQuery2.FieldByName('oper').asString;
end;

if op<>OraQuery2.FieldByName('oper').asString then
begin
if op<>'' then
begin
if nkoli<>0 then
begin
Sheet.Cells[nkoli,2].Value:=IntToStr(koli);
ran:='A'+IntToStr(nkoli)+':B'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;

if nst0=4 then
begin
Sheet.Cells[nkoli,3].Value:=cx;
ran:='C'+IntToStr(nkoli)+':C'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;
cx:=OraQuery2.FieldByName('depto').asString;
end;
end;
end;
koli:=0;
nst:=nst0;
Inc(nk);
Inc(nk);
Sheet.Cells[nk,1].Value:=OraQuery2.FieldByName('oper').asString;
op:=OraQuery2.FieldByName('oper').asString;
nkoli:=nk;
end;

if (nst0=4) and (cx<>OraQuery2.FieldByName('depto').asString) then
begin
if cx<>'' then
begin
Sheet.Cells[nkoli,2].Value:=IntToStr(koli);
ran:='B'+IntToStr(nkoli)+':B'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;

Sheet.Cells[nkoli,3].Value:=cx;
ran:='C'+IntToStr(nkoli)+':C'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;

koli:=0;
nst:=nst0;
Inc(nk);
nkoli:=nk;
end;
cx:=OraQuery2.FieldByName('depto').asString;
end;

Inc(koli);

Sheet.Cells[nk,nst].Value:=OraQuery2.FieldByName('nomer').asString;
if nst=kst then
begin
nst:=nst0-1;
Inc(nk);
end;
Inc(nst);

oraQuery2.Next;

End;

//Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,4]].RowHeight :=18;
if koli<>0 then
begin
ran:='A'+IntToStr(nkoli)+':B'+IntToStr(nkoli);

Sheet.Cells[nkoli,2].Value:=IntToStr(koli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;
if nst0=4 then
begin
Sheet.Cells[nkoli,3].Value:=cx;
ran:='C'+IntToStr(nkoli)+':C'+IntToStr(nkoli);
Sheet.Range[ran].HorizontalAlignment:=xlCenter;
end;

Sheet.Range[Sheet.Cells[nn,1], Sheet.Cells[nk,kst]].borders.linestyle:=xlContinuous;

Inc(nk);
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].value:=FormatDateTime('dd.mm.yyyy',date());
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,5],Sheet.Cells[nk,5]].value:='Сдал';
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].value:=userfio;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
Inc(nk);
Inc(nk);
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,2]].value:= '"      "          20      г.';
Sheet.Range[Sheet.Cells[nk,7],Sheet.Cells[nk,kst]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,5],Sheet.Cells[nk,5]].value:= 'Принял';
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].Font.Bold:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,kst]].HorizontalAlignment:=xlCenter;
end;

FExcel.Visible:=True;
end;


procedure TFReestr_doc_sklad.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFReestr_doc_sklad.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

end.

