unit Vedom_snab_vetka_cfek;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFVedom_snab_vetka_cfek = class(TForm)
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    OraQuery2CHK_FLD: TStringField;
    OraQuery2ident: TStringField;
    OraQuery2name: TStringField;
    OraQuery2iddoc: TFloatField;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1zavn: TStringField;
    OraQuery1proe: TStringField;
    OraQuery1sp: TStringField;
    OraQuery1pozic: TStringField;
    OraQuery1podpoz: TStringField;
    OraQuery1namesp: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1namekod: TStringField;
    OraQuery1kol: TFloatField;
    OraQuery1kodedi: TStringField;
    OraQuery1edi: TStringField;
    OraQuery1vetka1: TStringField;
    OraQuery1vetka2: TStringField;
    OraQuery1vetka3: TStringField;
    OraQuery1vetka4: TStringField;
    OraQuery1vetka5: TStringField;
    OraQuery1vetka6: TStringField;
    OraQuery1vetka7: TStringField;
    OraQuery1spsort: TStringField;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Button2: TButton;
    Edit3: TEdit;
    DBGridEh2: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FVedom_snab_vetka_cfek: TFVedom_snab_vetka_cfek;
  MyBookmark: TBookMark;
implementation

uses Unit9;

{$R *.dfm}


procedure TFVedom_snab_vetka_cfek.FormShow(Sender: TObject);
var
txx:string;
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);

txx:=' ';
txx:=txx+'select ''0'' as CHK_FLD, d.ident as ident,replace(replace(replace(d.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') ,'' ; '','';'') as name,d.document_id as iddoc';
txx:=txx+' from tronix.document d,tronix.project_list pr';
txx:=txx+' where d.id_project=pr.project_id and pr.project_id='+edit1.text;
//txx:=txx+' and d.ident like (''%%360%%'')';
//ShowMessage(txx);

   OraQuery2.Close;
  With OraQuery2 Do
     begin
        FieldByName('chk_fld').DisplayLAbel:='Œ“Ã≈“ ¿';
        FieldByName('ident').DisplayLAbel:='—œ';
        FieldByName('name').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ —œ';
        FieldByName('iddoc').DisplayLAbel:='»ƒ≈Õ“»‘';
    end;

   OraQuery2.SQL.Text:=txx;

  OraQuery2.ExecSQL;
 
end;


procedure TFVedom_snab_vetka_cfek.Button2Click(Sender: TObject);
var
FExcel,Sheet: OleVariant;
//,Range: OleVariant;
idd,tx:string;
nk: integer;
begin

idd:='';
DBGrideh2.DataSource.DataSet.DisableControls;
OraQuery2.Open;
oraQuery2.First;
while not OraQuery2.eof do
Begin
if OraQuery2.FieldByName('CHK_FLD').asString='1' then
begin
if idd='' then
idd:=OraQuery2.FieldByName('iddoc').asString
else
idd:=idd+','+OraQuery2.FieldByName('iddoc').asString;
end;
oraQuery2.Next;
end;
//ShowMessage(idd);
oraQuery2.First;
DBGridEh2.DataSource.DataSet.EnableControls;

if idd='' then
ShowMessage('ŒÚÏÂÚ¸ÚÂ ‚Â‰ÓÏÓÒÚË,ÍÓÚÓ˚Â ÌÂÓ·ıÓ‰ËÏÓ ‚˚„ÛÁËÚ¸')
else
begin
tx:=' ';
tx:='select tt.zavn as zavn, tt.proe as proe, tt.sp as sp,tt.pozic as pozic,tt.podpoz as podpoz,tt.namesp as namesp,';
tx:=tx+' tt.kod as kod,tt.namekod as namekod,tt.kol as kol,tt.kodedi as kodedi,tt.edi as edi,';
tx:=tx+' tt.vetka1 as vetka1,tt.vetka2 as vetka2,vetka3 as vetka3,vetka4 as vetka4,vetka5 as vetka5,vetka6 as vetka6,tt.vetka7 as vetka7,';
tx:=tx+' tt.spsort as spsort';
tx:=tx+' from (';

tx:=tx+' select t.zavn zavn, t.proe proe, t.sp sp,t.pozic pozic,t.podpoz podpoz,t.namesp namesp,';
tx:=tx+' t.namekod namekod,t.kol kol,t.kodedi kodedi,';
//t.kod kod,t.edi edi,
tx:=tx+' decode(t.kodedi,null,'' '',(select namek from tronix.koded where koded=t.kodedi)) edi,';
tx:=tx+' decode(t.idsprav,null,'' '',(select kod from tronix.sprav where t.idsprav=sprav_id)) kod,';
tx:=tx+' t.vetka vetka7,';
tx:=tx+' decode(instr(t.vetka,'';'',1,1),0,t.vetka,substr(t.vetka,1,instr(t.vetka,'';'',1,1)-1)) vetka1,';
tx:=tx+' decode(instr(t.vetka,'';'',1,2),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,1)+1,instr(t.vetka,'';'',1,2)-instr(t.vetka,'';'',1,1)-1)) vetka2,';
tx:=tx+' decode(instr(t.vetka,'';'',1,3),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,2)+1,instr(t.vetka,'';'',1,3)-instr(t.vetka,'';'',1,2)-1)) vetka3,';
tx:=tx+' decode(instr(t.vetka,'';'',1,4),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,3)+1,instr(t.vetka,'';'',1,4)-instr(t.vetka,'';'',1,3)-1)) vetka4,';
tx:=tx+' decode(instr(t.vetka,'';'',1,5),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,4)+1,instr(t.vetka,'';'',1,5)-instr(t.vetka,'';'',1,4)-1)) vetka5,';
tx:=tx+' decode(instr(t.vetka,'';'',1,6),0,'''',substr(t.vetka,instr(t.vetka,'';'',1,5)+1,instr(t.vetka,'';'',1,6)-instr(t.vetka,'';'',1,5)-1)) vetka6,';
tx:=tx+'t.spsort spsort';
tx:=tx+' from (';

tx:=tx+' select pr.zavn zavn, pr.project proe, d.ident sp,spi.poz pozic,spi.podpoz podpoz,';
tx:=tx+' replace(replace(spi.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';

tx:=tx+' spi.kol kol,spi.kode kodedi,spi.id_sprav idsprav,';

tx:=tx+' decode(spi.id_sprav,null,'' '',replace(replace(tronix.sp_name(spi.id_sprav),CHR(13)||CHR(10),'' ''),chr(39), '' '')) namekod,';

tx:=tx+' decode(spi.up_nn,null,d.ident||'' ''||replace(replace(replace(d.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') ,'' ; '','';''),';
tx:=tx+'replace(replace(replace(tronix.sp_zag_all(spi.nn,0),CHR(13)||CHR(10),'' ''),chr(39), '' '') ,'' ; '','';'')) vetka,';
tx:=tx+'tronix.sort_sp_poz_podpoz(spi.nn) spsort';

tx:=tx+' from tronix.sp spi,tronix.document d,tronix.project_list pr';
//tronix.koded ed,
tx:=tx+' where spi.nnn=d.document_id(+) and d.id_project=pr.project_id and pr.project_id='+edit1.text;
//tx:=tx+' and (spi.id_sprav=null or spi.id_sprav=s.sprav_id)';
tx:=tx+' and ( spi.id_sp_work is null or spi.id_sp_work>1)';
//tx:=tx+' and spi.id_sp_work is null';
tx:=tx+' and d.document_id in ('+idd+')';
tx:=tx+' ) t';
tx:=tx+' ) tt';
//tx:=tx+' order by tt.sp,tt.vetka7,nordsy.sort_char_number(tt.pozic),tt.podpoz';
tx:=tx+' order by tt.sp,tt.spsort';

//ShowMessage(tx);
  With OraQuery1 Do
     begin
        FieldByName('sp').DisplayLAbel:='—œ ';
        FieldByName('pozic').DisplayLAbel:='œŒ«»÷»ﬂ —œ ';
        FieldByName('podpoz').DisplayLAbel:='œŒƒœŒ«»÷.—œ ';
        FieldByName('namesp').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ —œ ';
        FieldByName('kod').DisplayLAbel:=' Œƒ ';
        FieldByName('namekod').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ';
        FieldByName('kol').DisplayLAbel:=' ŒÀ»◊≈—“¬Œ ';
        FieldByName('kodedi').DisplayLAbel:=' Œƒ ≈ƒ.»«Ã. ';
        FieldByName('edi').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ≈ƒ.»«Ã. ';
        FieldByName('vetka1').DisplayLAbel:='¬≈“ ¿ 1 ';
        FieldByName('vetka2').DisplayLAbel:='¬≈“ ¿ 2 ';
        FieldByName('vetka3').DisplayLAbel:='¬≈“ ¿ 3 ';
        FieldByName('vetka4').DisplayLAbel:='¬≈“ ¿ 4 ';
        FieldByName('vetka5').DisplayLAbel:='¬≈“ ¿ 5 ';
        FieldByName('vetka6').DisplayLAbel:='¬≈“ ¿ 6 ';
        FieldByName('vetka7').DisplayLAbel:='¬≈“ ¿ 7 ';
        FieldByName('zavn').DisplayLAbel:='«¿¬.π ';
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('spsort').DisplayLAbel:='SPSORT ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_VEDOMOSTI_OBORUD_SNAB_VETKA.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_VEDOMOSTI_OBORUD_SNAB_VETKA.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := 'ÀËÒÚ1';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

OraQuery1.Open;
OraQuery1.First;

nk:=1;

While not OraQuery1.eof do
Begin
Inc(nk);
Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('sp').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('pozic').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('podpoz').asString;
Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('namesp').asString;
Sheet.Cells[nk,5].Value:=OraQuery1.FieldByName('kod').asString;
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('namekod').asString;
Sheet.Cells[nk,7].Value:=OraQuery1.FieldByName('kol').asString;
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('edi').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('vetka1').asString;
Sheet.Cells[nk,10].Value:=OraQuery1.FieldByName('vetka2').asString;
Sheet.Cells[nk,11].Value:=OraQuery1.FieldByName('vetka3').asString;
Sheet.Cells[nk,12].Value:=OraQuery1.FieldByName('vetka4').asString;
Sheet.Cells[nk,13].Value:=OraQuery1.FieldByName('vetka5').asString;
Sheet.Cells[nk,14].Value:=OraQuery1.FieldByName('vetka6').asString;
Sheet.Cells[nk,15].Value:=OraQuery1.FieldByName('spsort').asString;
Sheet.Cells[nk,16].Value:='¬Â‰ÓÏÓÒÚË '+OraQuery1.FieldByName('proe').asString+' «‡‚.π '+OraQuery1.FieldByName('zavn').asString;

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,16]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,16]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,16]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,14]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,16]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,16]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;
end; //  if idd='' then
end;


procedure TFVedom_snab_vetka_cfek.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.

