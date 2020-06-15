unit Ukr_Pom_TNV_IZV;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFUkr_Pom_TNV_IZV = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1tkup: TStringField;
    OraQuery1ident: TStringField;
    OraQuery1namesp: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1txdate: TStringField;
    OraQuery1dxnomer: TStringField;
    OraQuery1tknomer: TStringField;
    OraQuery1tkdate: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1udp: TStringField;
    OraQuery1tunomer: TStringField;
    OraQuery1tuname: TStringField;
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
  FUkr_Pom_TNV_IZV: TFUkr_Pom_TNV_IZV;
implementation

uses Unit9;

{$R *.dfm}

procedure TFUkr_Pom_TNV_IZV.FormShow(Sender: TObject);
var tx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);

//OraQuery1.Close;

tx:='';
tx:='select t.tkup as tkup,t.ident as ident,max(t.namesp) as namesp,t.txnomer as txnomer,max(t.txdate) as txdate,max(t.dxnomer) as dxnomer,';
tx:=tx+' t.tknomer as tknomer,max(t.tkdate) as tkdate,max(t.denomer) as denomer,max(t.tkname) as tkname,';
tx:=tx+' max(t.udp) as udp,max(t.tunomer) as tunomer,max(t.tuname) as tuname';
tx:=tx+' from (';

tx:=tx+' select substr(tk.nomer,10,3) tkup,do.ident ident,replace(replace(do.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' tx.nomer txnomer,decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) txdate, dx.nomer dxnomer,';
tx:=tx+' tk.nomer tknomer,decode(tk.otk_end,null,'' '',to_char(tk.otk_end,''DD.MM.YYYY'')) tkdate,de.nomer denomer,';
tx:=tx+' replace(replace(tk.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tkname,tronix.up_tk_dic_short(tx.texkompl_id) udp,';
tx:=tx+' tu.nomer tunomer,replace(replace(tu.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tuname';

tx:=tx+' from nordsy.texkompl tx,nordsy.tx_mat tm,nordsy.texkompl tk,nordsy.texkompl tu,';
tx:=tx+' kart_sp ss,tronix.document do,kadry_dep de,kadry_dep dx';

tx:=tx+' where tm.tex_texkompl_id=tx.texkompl_id and tx.TYPE_TEX_TYPE_TEX_ID in (14)';
tx:=tx+' and tx.project_project_id='+edit1.text;
tx:=tx+' and substr(tx.nomer,1,3)=''»«¬''';
tx:=tx+' and tm.sp_sp_id=ss.nn(+) and ss.nnn=do.document_id';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';
tx:=tx+' and tk.texkompl_texkompl_id=tu.texkompl_id(+) and substr(tu.nomer,1,2)=''»«''';
tx:=tx+' and tk.dep_dep_id=de.dep_id(+) and tx.dep_dep_id=dx.dep_id(+)';
 
tx:=tx+' union all';

tx:=tx+' select substr(tk.nomer,10,3) tkup,do.ident ident,replace(replace(do.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' tx.nomer txnomer, decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) txdate,dx.nomer dxnomer,';
tx:=tx+' tk.nomer tknomer, decode(tk.otk_end,null,'' '',to_char(tk.otk_end,''DD.MM.YYYY'')) tkdate,de.nomer denomer,';
tx:=tx+' replace(replace(tk.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tkname,tronix.up_tk_dic_short(tx.texkompl_id) udp,';
tx:=tx+' tu.nomer tunomer,replace(replace(tu.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tuname';

tx:=tx+' from nordsy.texkompl tx,nordsy.tx_mat tm,nordsy.texkompl tk,nordsy.texkompl tu,';
tx:=tx+' tronix.document do,kadry_dep de,kadry_dep dx';

tx:=tx+' where tm.tex_texkompl_id=tx.texkompl_id and tx.TYPE_TEX_TYPE_TEX_ID in (14)';
tx:=tx+' and tx.project_project_id='+edit1.text;
tx:=tx+' and substr(tx.nomer,1,3)=''»«¬'' and tm.document_document_id=do.document_id';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';
tx:=tx+' and tk.texkompl_texkompl_id=tu.texkompl_id(+) and substr(tu.nomer,1,2)=''»«''';
tx:=tx+' and tk.dep_dep_id=de.dep_id(+) and tx.dep_dep_id=dx.dep_id(+)';
 
tx:=tx+' union all';

tx:=tx+' select substr(tx.nomer,10,3) tkup,do.ident ident,replace(replace(do.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' tx.nomer txnomer,decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) txdate,de.nomer dxnomer,';
tx:=tx+' tx.nomer tknomer,decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) tkdate, de.nomer denomer,';
tx:=tx+' replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tkname,tronix.up_tk_dic_short(tx.texkompl_id) udp,';
tx:=tx+' tu.nomer tunomer,replace(replace(tu.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tuname';

tx:=tx+' from nordsy.texkompl tx,nordsy.tx_mat tm,nordsy.texkompl tu,';
tx:=tx+' kart_sp ss,tronix.document do,kadry_dep de';

tx:=tx+' where tm.tex_texkompl_id=tx.texkompl_id and tx.TYPE_TEX_TYPE_TEX_ID in (8) and substr(tx.nomer,1,3)=''»«¬''';
tx:=tx+' and tx.project_project_id='+edit1.text;
tx:=tx+' and tm.sp_sp_id=ss.nn(+) and ss.nnn=do.document_id';
tx:=tx+' and tx.texkompl_texkompl_id=tu.texkompl_id(+) and substr(tu.nomer,1,2)=''»«'' and tx.dep_dep_id=de.dep_id(+)';

tx:=tx+' union all';

tx:=tx+' select substr(tx.nomer,10,3) tkup,do.ident ident,replace(replace(do.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') namesp,';
tx:=tx+' tx.nomer txnomer, decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) txdate,de.nomer dxnomer,';
tx:=tx+' tx.nomer tknomer, decode(tx.otk_end,null,'' '',to_char(tx.otk_end,''DD.MM.YYYY'')) tkdate,de.nomer denomer,';
tx:=tx+' replace(replace(tx.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tkname,tronix.up_tk_dic_short(tx.texkompl_id) udp,';
tx:=tx+' tu.nomer tunomer,replace(replace(tu.name,CHR(13)||CHR(10),'' ''),chr(39), '' '') tuname';

tx:=tx+' from nordsy.texkompl tx,nordsy.tx_mat tm,nordsy.texkompl tu,';
tx:=tx+' tronix.document do,kadry_dep de';

tx:=tx+' where tm.tex_texkompl_id=tx.texkompl_id and tx.TYPE_TEX_TYPE_TEX_ID in (8) and substr(tx.nomer,1,3)=''»«¬''';
tx:=tx+' and tx.project_project_id='+edit1.text;
tx:=tx+' and tm.document_document_id=do.document_id';
tx:=tx+' and tx.texkompl_texkompl_id=tu.texkompl_id(+) and substr(tu.nomer,1,2)=''»«'' and tx.dep_dep_id=de.dep_id(+)';
tx:=tx+' )t';
tx:=tx+' group by t.tkup,t.tknomer,t.txnomer,t.ident'; 
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('tkup').DisplayLAbel:='” –.œŒÃ. ';
        FieldByName('ident').DisplayLAbel:='—œ';
        FieldByName('namesp').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ —œ ';
        FieldByName('txnomer').DisplayLAbel:='“ /œ“  ';
        FieldByName('txdate').DisplayLAbel:='ƒ¿“¿ «¿ –.“ /œ“  ';
        FieldByName('dxnomer').DisplayLAbel:='÷≈’ “ /œ“  ';
        FieldByName('tknomer').DisplayLAbel:='“  ';
        FieldByName('tkdate').DisplayLAbel:='ƒ¿“¿ «¿ –.“  ';
        FieldByName('denomer').DisplayLAbel:='÷≈’ “  ';
        FieldByName('tkname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ “  ';
        FieldByName('udp').DisplayLAbel:='”ƒœ ';
        FieldByName('tunomer').DisplayLAbel:='” –. œ”≈ ';
        FieldByName('tuname').DisplayLAbel:='Õ¿»Ã≈ÕŒ¬¿Õ»≈ ” –.œ”≈ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;
  end;



procedure TFUkr_Pom_TNV_IZV.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;


procedure TFUkr_Pom_TNV_IZV.Button1Click(Sender: TObject);
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