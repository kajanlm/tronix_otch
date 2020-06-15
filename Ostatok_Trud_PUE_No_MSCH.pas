unit Ostatok_Trud_PUE_No_MSCH;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFOstatok_Trud_PUE_No_MSCH = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1txnomer: TStringField;
    OraQuery1txname: TStringField;
    OraQuery1ptxnomer: TStringField;
    OraQuery1ptxname: TStringField;
    OraQuery1txdate: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1txtrud: TFloatField;
    OraQuery1otrab: TFloatField;
    OraQuery1ostatok: TFloatField;
    OraQuery1udp: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FOstatok_Trud_PUE_No_MSCH: TFOstatok_Trud_PUE_No_MSCH;
//  MyBookmark: TBookMark;
implementation

uses Unit9;


{$R *.dfm}

procedure TFOstatok_Trud_PUE_No_MSCH.FormShow(Sender: TObject);
var txx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

txx:=' ';
txx:='select tt.txnomer as txnomer,tt.txname as txname,tt.ptxnomer as ptxnomer,tt.ptxname as ptxname,';
txx:=txx+'tt.dat as txdate, tt.dpnomer as denomer, nordsy.trud_tx(tt.tx_id) as txtrud,';
//txx:=txx+' nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id) as trpue,';
txx:=txx+' (nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id)-nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id,''Œ—“¿“Œ '')) as otrab,';
txx:=txx+' nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id,''Œ—“¿“Œ '') as ostatok,';
//txx:=txx+' nvl(nordsy.sum_trud_prof_texkompl(tt.tx_id,0),0) as trprof,';
txx:=txx+' tt.ptxup as udp';
txx:=txx+' from (';

txx:=txx+'select t.txnomer txnomer,max(t.txname) txname, t.ptxnomer ptxnomer,max(t.ptxname) ptxname,';
txx:=txx+' max(t.dat) dat,max(t.dpnomer) dpnomer,max(t.tx_id) tx_id,max(t.prj_id) prj_id,max(t.ptxup) ptxup';
txx:=txx+' from(';

txx:=txx+'select tx.nomer txnomer, replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') txname,';
txx:=txx+' ptx.nomer ptxnomer,replace(replace(ptx.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') ptxname,';
txx:=txx+' ptx.texkompl_id tx_id,tx.project_project_id prj_id,';
txx:=txx+' to_char(ptx.otk_end,''DD.MM.YYYY'') dat,dp.nomer dpnomer,tronix.up_tk_dic(ptx.texkompl_id) ptxup';

txx:=txx+' from nordsy.texkompl tx,nordsy.texkompl ptx,tronix.project_list pr,feb_zakaz zk,kadry_dep dp,kadry_dep dtn';

txx:=txx+' where tx.type_tex_type_tex_id in (7,8)';
txx:=txx+' and substr(trim(tx.nomer),1,2) not in (''“Õ'',''—Ã'')';
txx:=txx+' and ptx.texkompl_texkompl_id=tx.texkompl_id';
txx:=txx+' and ptx.type_tex_type_tex_id in (12,14)';
txx:=txx+' and zk.date_end is null and pr.project_id=tx.project_project_id and tx.project_project_id='+edit1.text;
txx:=txx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(Ã—◊)'')';
txx:=txx+' and ptx.dep_dep_id=dp.dep_id(+) and (dp.dep_dep_id=dtn.dep_id or dp.nomer=dtn.nomer)';

if Edit2.Text<>'All' then
txx:=txx+' and dtn.dep_id='+Edit2.Text;

txx:=txx+' union all';

txx:=txx+' select tx.nomer txnomer, replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') txname,';
txx:=txx+' '' '' ptxnomer,'' '' ptxname,tx.texkompl_id tx_id,tx.project_project_id prj_id,';
txx:=txx+' to_char(tx.otk_end,''DD.MM.YYYY'') dat,dp.nomer dpnomer,tronix.up_tk_dic(tx.texkompl_id) ptxup';

txx:=txx+' from nordsy.texkompl tx,tronix.project_list pr,feb_zakaz zk,kadry_dep dp,kadry_dep dtn';

txx:=txx+' where tx.type_tex_type_tex_id in(7,8) and substr(trim(tx.nomer),1,2) not in (''“Õ'',''—Ã'')';
txx:=txx+' and zk.date_end is null and pr.project_id=tx.project_project_id and tx.project_project_id='+edit1.text;
txx:=txx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(Ã—◊)'')';
txx:=txx+' and tx.dep_dep_id=dp.dep_id(+) and (dp.dep_dep_id=dtn.dep_id or dp.nomer=dtn.nomer)';

if Edit2.Text<>'All' then
txx:=txx+' and dtn.dep_id='+Edit2.Text;

txx:=txx+' ) t';

txx:=txx+' group by t.txnomer,t.ptxnomer';

//txx:=txx+' order by t.txnomer,t.txname,t.ptxnomer,t.ptxname';
txx:=txx+' ) tt';
txx:=txx+' where nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id)=0 or nordsy.trud_tx_reg_dat.trud_tx(tt.tx_id,''Œ—“¿“Œ '')>0';
txx:=txx+' order by tt.txnomer,tt.ptxnomer'
;

//ShowMEssage(txx);

  With OraQuery1 Do
     begin
        FieldByName('txnomer').DisplayLAbel:='“ ';
        FieldByName('txname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “ ';
        FieldByName('ptxnomer').DisplayLAbel:='œ“  ';
        FieldByName('ptxname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ œ“ ';
        FieldByName('txdate').DisplayLAbel:='ƒ¿“¿ «¿ –.“  ';
        FieldByName('denomer').DisplayLAbel:='÷≈’ “  ';
        FieldByName('txtrud').DisplayLAbel:='“ -“‹ “  ';
        FieldByName('otrab').DisplayLAbel:='“–-“‹ ¬€–¿¡. ';
        FieldByName('ostatok').DisplayLAbel:='“–-“‹ Œ—“¿“Œ  ';
        FieldByName('udp').DisplayLAbel:='”ƒœ ';
     end;

   OraQuery1.SQL.Text:=txx;

  OraQuery1.ExecSQL;
  end;

procedure TFOstatok_Trud_PUE_No_MSCH.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

procedure TFOstatok_Trud_PUE_No_MSCH.Button1Click(Sender: TObject);
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