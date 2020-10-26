unit Ostatok_Trud_PUE_No_MSCH_CEX;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFOstatok_Trud_PUE_No_MSCH_CEX = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1ukrpom: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1txname: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1txtrud: TFloatField;
    OraQuery1otrab: TFloatField;
    OraQuery1ostatok: TFloatField;
    OraQuery1proe: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    Edit4: TEdit;
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
  FOstatok_Trud_PUE_No_MSCH_CEX: TFOstatok_Trud_PUE_No_MSCH_CEX;
//  MyBookmark: TBookMark;
implementation

uses Unit9,Ostatok_Trud_PUE_No_MSCH;


{$R *.dfm}

procedure TFOstatok_Trud_PUE_No_MSCH_CEX.FormShow(Sender: TObject);
var txx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);
//ShowMessage(Edit3.Text);
 
txx:=' ';
txx:='select decode(instr(l.txnomer,''-'',-1),0,'' '',substr(l.txnomer,instr(l.txnomer,''-'',-1)+1,3)) as ukrpom,';
txx:=txx+' l.denomer as denomer,l.txnomer as txnomer,l.txname as txname,';
txx:=txx+' l.txtrud as txtrud,l.otrab as otrab,(l.txtrud-l.otrab) as ostatok,'''+edit3.text;
txx:=txx+''' as proe';
txx:=txx+' from(';

txx:=txx+' select tt.zavn zavn,tt.denomer denomer,tt.txnomer txnomer,tt.txname txname,sum(tt.trud) txtrud,sum(tt.trudnarz) otrab';
txx:=txx+' from(';

txx:=txx+' select pr.zavn zavn,substr(dtn.nomer,1,2) denomer,decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) txnomer,';
txx:=txx+' decode(tk.type_tex_type_tex_id,11,replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' ''),replace(replace(tk.name,CHR(13)||CHR(10),'' ''),chr(39), '' '')) txname,';
txx:=txx+'  tv.time trud,0 trudnarz';

txx:=txx+' from  nordsy.texkompl tx,nordsy.tex_kvalif tv,nordsy.texkompl tk,';
txx:=txx+' feb_zakaz zk,tronix.project_list pr,kadry_dep dp,kadry_dep dtn';

txx:=txx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+)';
txx:=txx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
txx:=txx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(Ã—◊)'')';
txx:=txx+' and zk.date_end is null and zk.id_project=pr.project_id(+) and pr.project_id='+edit1.text;
//546
txx:=txx+' and tx.dep_dep_id=dp.dep_id(+) and (dp.dep_dep_id=dtn.dep_id or dp.nomer=dtn.nomer)';
txx:=txx+' and dtn.dep_id='+edit2.text;

txx:=txx+' union all';

txx:=txx+' select t.zavn zavn,t.denomer denomer,t.txnomer txnomer,t.txname txname,t.trud trud,sum(t.trudnarz) otrab';
txx:=txx+' from(';

txx:=txx+' select pr.zavn zavn,substr(dtn.nomer,1,2) denomer,decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) txnomer,';
txx:=txx+' decode(tk.type_tex_type_tex_id,11,replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' ''),replace(replace(tk.name,CHR(13)||CHR(10),'' ''),chr(39), '' '')) txname,';
txx:=txx+' 0 trud,tm.trudoem trudnarz';

txx:=txx+' from tronix.ttn tn,tronix.ttn_mat tm,kadry_dep dp,kadry_dep dtn,nordsy.texkompl tx,nordsy.texkompl tk,';
txx:=txx+' tronix_project_list pr,feb_zakaz z';

txx:=txx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id(+)';
txx:=txx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''œ”≈'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';
txx:=txx+' and tx.dep_dep_id=dp.dep_id(+) and (dp.dep_dep_id=dtn.dep_id or dp.nomer=dtn.nomer)';
txx:=txx+' and dtn.dep_id='+edit2.text;
txx:=txx+' and tn.date_ins is not null and tn.uzak_uzak_id=z.nn(+) and z.zak not like (''%%(Ã—◊)'')';
txx:=txx+' and z.id_project=pr.project_id(+) and pr.project_id='+edit1.text;
txx:=txx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
txx:=txx+' ) t';
txx:=txx+' group by t.zavn,t.denomer,t.txnomer,t.txname';
txx:=txx+' ) tt';
txx:=txx+' group by tt.zavn,tt.denomer,tt.txnomer,tt.txname';
txx:=txx+' ) l';
txx:=txx+' where l.txtrud-l.otrab<>0';
txx:=txx+' order by l.txnomer'
;

//ShowMEssage(txx);

  With OraQuery1 Do
     begin
        FieldByName('ukrpom').DisplayLAbel:='” –.œŒÃ.';
        FieldByName('txnomer').DisplayLAbel:='“ ';
        FieldByName('txname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “ ';
        FieldByName('denomer').DisplayLAbel:='÷≈’ “  ';
        FieldByName('txtrud').DisplayLAbel:='“ -“‹ “  ';
        FieldByName('otrab').DisplayLAbel:='“–-“‹ ¬€–¿¡. ';
        FieldByName('ostatok').DisplayLAbel:='“–-“‹ Œ—“¿“Œ  ';
        FieldByName('proe').DisplayLAbel:='œ–Œ≈ “ ';
     end;

   OraQuery1.SQL.Text:=txx;

  OraQuery1.ExecSQL;
  end;

procedure TFOstatok_Trud_PUE_No_MSCH_CEX.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

procedure TFOstatok_Trud_PUE_No_MSCH_CEX.Button1Click(Sender: TObject);
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