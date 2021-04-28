unit SP_Snab_Zakazn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls, ComObj;

type
  TFSP_Snab_Zakazn = class(TForm)
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
  FSP_Snab_Zakazn: TFSP_Snab_Zakazn;
  MyBookmark: TBookMark;
implementation

uses Unit9;

{$R *.dfm}


procedure TFSP_Snab_Zakazn.FormShow(Sender: TObject);
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


procedure TFSP_Snab_Zakazn.Button2Click(Sender: TObject);
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
tx:='Select d.ident sp,sp.poz pozic, sp.podpoz podpoz,replace(replace(sp.name, CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' decode(sp.id_sprav,null,'' '',(select kod from tronix.sprav s where sp.id_sprav=s.sprav_id)) kod,';
tx:=tx+' decode(sp.id_sprav,null,'' '',(select replace(replace(tronix_sp_name(s.sprav_id),CHR(13)||CHR(10),'' ''),chr(39), '' '') from tronix.sprav s where sp.id_sprav=s.sprav_id)) namekod,';
tx:=tx+' sp.kol kol,kd.namek edi,kd.koded kodedi,pr.name proe,tronix.sort_sp_poz_podpoz(sp.nn) spnn';

tx:=tx+' from  tronix.sp sp, tronix.project_list pr, tronix.document d, tronix.koded kd';

tx:=tx+' where sp.nnn=d.document_id(+) and d.id_project=pr.project_id and pr.project_id='+edit1.text;
//tx:=tx+' and (sp.id_sp_work is null or sp.id_sp_work>1)';
tx:=tx+' and kd.koded=sp.kode';
tx:=tx+' and d.document_id in ('+idd+')';
tx:=tx+' order by sp,spnn';
//tx:=tx+' order by sp,spupnn,spnn,nordsy.sort_char_number(pozic),podpoz';

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
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_VEDOMOSTI_OBORUD_SNAB.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_VEDOMOSTI_OBORUD_SNAB.xls');

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
Sheet.Cells[nk,8].Value:=OraQuery1.FieldByName('kodedi').asString;
Sheet.Cells[nk,9].Value:=OraQuery1.FieldByName('edi').asString;
Sheet.Cells[nk,10].Value:=OraQuery1.FieldByName('proe').asString;

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[nk+1,10]].RowHeight :=13;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,10]].HorizontalAlignment:=xlGeneral;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,10]].VerticalAlignment:=xlTop;
//Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,8]].WrapText:=True;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,10]].Rows.AutoFit;
Sheet.Range[Sheet.Cells[1,1], Sheet.Cells[nk,10]].borders.linestyle:=xlContinuous;

FExcel.Visible:=True;
end; //  if idd='' then
end;


procedure TFSP_Snab_Zakazn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.

