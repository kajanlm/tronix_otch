unit Primen_PUE_in_dok_dvig_naryd_open;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFPrimen_PUE_in_dok_dvig_naryd_open = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1tyname: TStringField;
    OraQuery1nomerdok: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1datdok: TStringField;
    OraQuery1datins: TStringField;
    OraQuery1cex: TStringField;
    OraQuery1tknomer: TStringField;
    OraQuery1cexsklad: TStringField;
    OraQuery1proekt: TStringField;
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
  FPrimen_PUE_in_dok_dvig_naryd_open: TFPrimen_PUE_in_dok_dvig_naryd_open;
implementation

uses Unit9,Primen_PUE_in_dok_dvig_naryd;

{$R *.dfm}

procedure TFPrimen_PUE_in_dok_dvig_naryd_open.FormShow(Sender: TObject);
var tx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//ShowMessage(Edit2.Text);
//ShowMessage(Edit3.Text);

tx:='';
tx:='select t.tyname as tyname,t.nomerdok as nomerdok,t.txnomer as txnomer,t.datdok as datdok,t.datins as datins,';
tx:=tx+' decode(t.tytype,56,t.denomer,decode(t.tytype,45,t.denomer,t.dfnomer)) as cex,';
tx:=tx+' decode(t.tytype,56,t.dfnomer,decode(t.tytype,45,t.dfnomer,t.denomer)) as cexsklad,t.tknomer as tknomer,t.proe as proekt';
//''+edit3.Text+''' as tknomer,'''+edit2.Text+''' as proekt';
tx:=tx+' from (';

tx:=tx+' select distinct (decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer)||ty.name||to_char(tn.date_dok, ''DD.MM.YYYY'' )||tn.nomer) tn,';
tx:=tx+' ty.name tyname,to_char(tn.date_dok, ''DD.MM.YYYY'' ) datdok,tn.nomer nomerdok,tx.nomer txnomer,to_char(tn.date_ins, ''DD.MM.YYYY'' ) datins,';
tx:=tx+' ty.type_ttn_id tytype,decode(substr(dd.nomer,1,3),''23-'',df.nomer,fd.nomer) dfnomer,de.nomer denomer,';
tx:=tx+' decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) tknomer,pr.name proe';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.type_ttn ty,tronix.project_list pr,';
tx:=tx+' kadry_dep de,kadry_dep dd,kadry_dep df,kadry_dep fd,nordsy.texkompl tx,nordsy.texkompl tk';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and tm.texkompl_texkompl_id=tx.texkompl_id(+)';
tx:=tx+' and (tx.nomer='''+edit3.text+''' or tk.nomer='''+edit3.text;
tx:=tx+''') and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and tn.type_ttn_type_ttn_id=ty.type_ttn_id(+) and ty.type_ttn_id in (44,45)';
tx:=tx+' and tn.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and tn.dep_dep_id_to=df.dep_id(+) and df.dep_dep_id=fd.dep_id(+)';
tx:=tx+' and tn.dep_dep_id_from=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';

tx:=tx+' union all';

tx:=tx+' select distinct (decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer)||ty.name||to_char(tn.date_dok, ''DD.MM.YYYY'' )||tn.nomer) tn,';
tx:=tx+' ty.name tyname,to_char(tn.date_dok, ''DD.MM.YYYY'' ) datdok,tn.nomer nomerdok,tx.nomer txnomer, to_char(tn.date_ins, ''DD.MM.YYYY'' ) datins,';
tx:=tx+' ty.type_ttn_id tytype,de.nomer dfnomer,'''' denomer,';
tx:=tx+' decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) tknomer,pr.name proe';

tx:=tx+' from tronix.ttn tn,tronix.type_ttn ty,tronix.project_list pr,feb_zakaz z,tronix.zakaz zk,nordsy.texkompl tx,nordsy.texkompl tk,kadry_dep de';

tx:=tx+' where tn.type_ttn_type_ttn_id=ty.type_ttn_id(+) and ty.type_ttn_id=60';
tx:=tx+' and (tx.nomer='''+edit3.text+''' or tk.nomer='''+edit3.text;
tx:=tx+''') and tn.texkompl_texkompl_id_nar=tx.texkompl_id and tn.dep_dep_id_to=de.dep_id(+)';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and tn.date_anul_nar is null';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and nordsy.uzak_tx(tn.texkompl_texkompl_id_nar)=z.nn(+) and z.id_project=pr.project_id(+) and pr.project_id='+edit1.text;

tx:=tx+' union all';

tx:=tx+' select distinct (decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer)||ty.name||to_char(tn.date_dok, ''DD.MM.YYYY'' )||tn.nomer) tn,';
tx:=tx+' ty.name tyname,to_char(tn.date_dok, ''DD.MM.YYYY'' ) datdok,tn.nomer nomerdok,tx.nomer txnomer,to_char(tn.date_ins, ''DD.MM.YYYY'' ) datins,';
tx:=tx+' ty.type_ttn_id tytype,decode(substr(dd.nomer,1,3),''23-'',de.nomer,dd.nomer) dfnomer,decode(substr(fd.nomer,1,3),''23-'',df.nomer,fd.nomer) denomer,';
tx:=tx+' decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) tknomer,pr.name proe';

tx:=tx+' from tronix.ttn tn,tronix.type_ttn ty,tronix.project_list pr,';
tx:=tx+' kadry_dep de,kadry_dep dd,kadry_dep df,kadry_dep fd,';
tx:=tx+' nordsy.texkompl tx,nordsy.texkompl tk';

tx:=tx+' where tn.texkompl_texkompl_id=tx.texkompl_id(+)';
tx:=tx+' and (tx.nomer='''+edit3.text+''' or tk.nomer='''+edit3.text;
tx:=tx+''') and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and tn.type_ttn_type_ttn_id=ty.type_ttn_id(+) and ty.type_ttn_id=20';
tx:=tx+' and tn.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and tn.dep_dep_id_from=df.dep_id(+) and df.dep_dep_id=fd.dep_id(+) and tn.dep_dep_id_to=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';

tx:=tx+' union all';

tx:=tx+' select distinct (decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer)||ty.name||to_char( tn.date_dok, ''DD.MM.YYYY'' )||tn.nomer) tn,';
tx:=tx+' ty.name tyname,to_char( tn.date_dok, ''DD.MM.YYYY'' ) datdok,tn.nomer nomerdok,tx.nomer txnomer,to_char( tn.date_ins, ''DD.MM.YYYY'' ) datins,';
tx:=tx+' ty.type_ttn_id tytype, decode(substr(fd.nomer,1,3),''23-'',df.nomer,fd.nomer) dfnomer,decode(substr(dd.nomer,1,3),''23-'',de.nomer,dd.nomer) denomer,';
tx:=tx+' decode(tk.type_tex_type_tex_id,11,tx.nomer,tk.nomer) tknomer,pr.name proe';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.type_ttn ty,tronix.project_list pr,nordsy.texkompl tx,nordsy.texkompl tk,';
tx:=tx+' kadry_dep de,kadry_dep dd,kadry_dep df,kadry_dep fd';

tx:=tx+' where tm.ttn_ttn_id=tn.ttn_id and (decode(tm.texkompl_texkompl_id_from,null,';
tx:=tx+'(select ttm.texkompl_texkompl_id from tronix.ttn_mat ttm where ttm.ttn_mat_id=tm.ttn_mat_ttn_mat_id),tm.texkompl_texkompl_id_from))=tx.texkompl_id';
tx:=tx+' and (tx.nomer='''+edit3.text+''' or tk.nomer='''+edit3.text;
tx:=tx+''') and nvl(nordsy.go_in_tk(tm.texkompl_texkompl_id_from,''œ”≈'',''TYPE''),tm.texkompl_texkompl_id_from)=tk.texkompl_id';
tx:=tx+' and tn.type_ttn_type_ttn_id=ty.type_ttn_id(+) and ty.type_ttn_id in (30,34,49,51,56)';
tx:=tx+' and tn.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and tn.dep_dep_id_from=df.dep_id(+) and df.dep_dep_id=fd.dep_id(+) and tn.dep_dep_id_to=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';
tx:=tx+') t';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('tyname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ƒŒ ”Ã≈Õ“¿ ';
        FieldByName('nomerdok').DisplayLAbel:='ÕŒÃ≈– ƒŒ ”Ã≈Õ“¿ ';
        FieldByName('txnomer').DisplayLAbel:='œ”≈ ¬ ƒŒ ”Ã≈Õ“≈';
        FieldByName('datdok').DisplayLAbel:='ƒ¿“¿ —Œ«ƒ¿Õ»ﬂ ';
        FieldByName('datins').DisplayLAbel:='ƒ¿“¿ «¿ –€“»ﬂ ';
        FieldByName('cex').DisplayLAbel:='÷≈’ ';
        FieldByName('cexsklad').DisplayLAbel:='÷≈’/— À¿ƒ ';
        FieldByName('tknomer').DisplayLAbel:='“ /“Õ ';
        FieldByName('proekt').DisplayLAbel:='œ–Œ≈ “ ';
      end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
  end;



procedure TFPrimen_PUE_in_dok_dvig_naryd_open.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;


procedure TFPrimen_PUE_in_dok_dvig_naryd_open.Button1Click(Sender: TObject);
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