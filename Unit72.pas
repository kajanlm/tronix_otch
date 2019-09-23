unit Unit72;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComObj;

type
  TForm72 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1abrudp: TStringField;
    OraQuery1tknomer: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1cextk: TStringField;
    OraQuery1ptknomer: TStringField;
    OraQuery1cexptk: TStringField;
    OraQuery1tknorm: TFloatField;
    OraQuery1ptknorm: TFloatField;
    OraQuery1trudzakr: TFloatField;
    OraQuery1trost: TFloatField;
    OraQuery1procent: TFloatField;
    OraQuery1zavn: TStringField;
    OraQuery1zakaz: TStringField;
    OraQuery1proekt: TStringField;
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
    Button2: TButton;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form72: TForm72;

implementation

uses Unit9, Unit70,Unit71;

{$R *.dfm}

procedure TForm72.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+' select ll.abrudp as abrudp,ll.tknomer as tknomer,max(ll.tkname) as tkname,max(ll.cextk) as cextk, ll.ptknomer as ptknomer, ll.cexptk as cexptk,';

tx:=tx+' max(ll.tknorm) as tknorm, max(ll.ptknorm) as ptknorm, max(ll.trudzakr) as trudzakr ,';

tx:=tx+' (max(ll.ptknorm)-max(ll.trudzakr)) as trost,';
//tx:=tx+' decode(max(ll.trudzakr),0,0,round((max(ll.trudzakr)/max(ll.ptknorm))*100,2)) as procent,';
tx:=tx+' decode(ll.ptknomer,'''',decode(max(ll.trudzakr),0,0,round((max(ll.trudzakr)/max(ll.tknorm))*100,2)),';
tx:=tx+'decode(max(ll.trudzakr),0,0,round((max(ll.trudzakr)/max(ll.ptknorm))*100,2))) as procent,';

tx:=tx+' max(ll.zavn) as zavn,max(ll.zakaz) as zakaz,max(ll.proekt) as proekt,max(ll.udp) as udp';
tx:=tx+' from( ';
//ll
tx:=tx+' select bb.abrudp abrudp,bb.tknomer tknomer,bb.tkname tkname,bb.cextk cextk,bb.ptknomer ptknomer,bb.cexptk cexptk,bb.tknorm tknorm,bb.ptknorm ptknorm,';

tx:=tx+' bb.trudzakr trudzakr,bb.zavn zavn,bb.zakaz zakaz,bb.proekt proekt,bb.udp udp';
tx:=tx+' from(';
//bb
tx:=tx+' select t.abrudp abrudp,t.tknomer tknomer,t.tkname tkname,';

tx:=tx+' decode(t.cextk,''ﬂ—«'',(select dd.nomer from nordsy.texkompl tx,kadry_dep dd where tx.texkompl_id=t.idptk and tx.dep_dep_id=dd.dep_id(+)),t.cextk) cextk,';

tx:=tx+' nordsy.tx_nomer(t.idptk) ptknomer,';

tx:=tx+' (select dd.nomer from nordsy.texkompl tx,kadry_dep dd where tx.texkompl_id=t.idptk and tx.dep_dep_id=dd.dep_id(+)) cexptk,';

tx:=tx+' nordsy.sum_trud(t.idtk) tknorm,nordsy.sum_trud(t.idptk) ptknorm,0 trudzakr,';

tx:=tx+' t.zavn zavn,t.zakaz zakaz,t.proekt proekt,t.udp udp';
tx:=tx+' from(';
//t
tx:=tx+' select distinct tronix.up_tk_dic_short(tx.texkompl_id) abrudp,tk.nomer tknomer,tk.texkompl_id idtk,tk.name tkname,';

tx:=tx+' dtk.nomer cextk,tronix.up_tk_dic(tx.texkompl_id) udp,pr.zavn zavn,zk.zak zakaz,pr.name proekt,';

tx:=tx+' (select tv.texkompl_id ';
tx:=tx+' from nordsy.texkompl tv where tv.type_tex_type_tex_id not in (11,13) and tv.texkompl_texkompl_id=tk.texkompl_id';
tx:=tx+' start with tv.texkompl_id =tx.texkompl_id';
tx:=tx+' connect  by prior tv.texkompl_texkompl_id=tv.texkompl_id) idptk';

tx:=tx+' from nordsy.tex_kvalif tv,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz zk,tronix.project_list pr,kadry_dep dtk';

tx:=tx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+) and pr.project_id=tx.project_project_id and tx.project_project_id='+edit1.text;

tx:=tx+' and tk.dep_dep_id=dtk.dep_id(+)';

tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(Ã—◊)'')';

tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';
tx:=tx+' )t';

tx:=tx+' )bb';

tx:=tx+' union all';

tx:=tx+' select tt.abrudp abrudp,tt.tknomer tknomer,tt.tkname tkname, decode(tt.tkcex,''ﬂ—«'',tt.cexptk,tt.tkcex) cextk,tt.ptknomer ptknomer,';

tx:=tx+' tt.cexptk cexptk,tt.tktrud tknorm,tt.ptktrud ptknorm,tt.trudzakr trudzakr,tt.zavn zavn,tt.zakaz zakaz,tt.proekt proekt,tt.udp udp';
tx:=tx+' from(';
//tt
tx:=tx+' select t.abrudp abrudp,t.tknomer tknomer,t.tkname tkname,t.tkcex tkcex, nordsy.tx_nomer(t.idptk) ptknomer,';

tx:=tx+' (select dd.nomer from nordsy.texkompl tr,kadry_dep dd where tr.texkompl_id=t.idptk and tr.dep_dep_id=dd.dep_id) cexptk,';

tx:=tx+' t.trudzakr trudzakr, nordsy.sum_trud(t.idtk) tktrud,nordsy.sum_trud(t.idptk) ptktrud,t.txdic udp,t.zavn zavn,t.zakaz zakaz,t.proekt proekt';
tx:=tx+' from(';
//t
tx:=tx+' select tronix.up_tk_dic(tx.texkompl_id) txdic, tronix.up_tk_dic_short(tx.texkompl_id) abrudp,tk.nomer tknomer,tk.name tkname,';

tx:=tx+' dtk.nomer tkcex,tk.texkompl_id idtk,tm.trudoem trudzakr,pr.zavn zavn,zk.zak zakaz,pr.name proekt,';

tx:=tx+' (select tv.texkompl_id';
tx:=tx+' from nordsy.texkompl tv where tv.type_tex_type_tex_id not in (11,13) and tv.texkompl_texkompl_id=tk.texkompl_id';
tx:=tx+' start with tv.texkompl_id =tx.texkompl_id';
tx:=tx+' connect  by prior tv.texkompl_texkompl_id=tv.texkompl_id) idptk';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz zk,tronix.project_list pr, kadry_dep dtk';

tx:=tx+' where tx.project_project_id='+edit1.text;

tx:=tx+' and pr.project_id=tx.project_project_id and zk.zak not like (''%%(Ã—◊)'') and tn.uzak_uzak_id=zk.nn';

tx:=tx+' and tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id';

tx:=tx+' and tn.texkompl_texkompl_id_NAR=tx.texkompl_id(+)';

tx:=tx+' and tn.date_ins is not null and tn.date_anul_nar is null';

tx:=tx+' and tk.dep_dep_id=dtk.dep_id(+)';

tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';

tx:=tx+' )t';
tx:=tx+' )tt';
tx:=tx+' )ll';
tx:=tx+' group by ll.abrudp,ll.tknomer,ll.ptknomer,ll.cexptk';
tx:=tx+' order by nordsy.sort_char_number(ll.abrudp),ll.tknomer,ll.ptknomer';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('abrudp').DisplayLAbel:=' Œ–Œ“ Œ≈ ”ƒœ';
        FieldByName('tknomer').DisplayLAbel:=' “ ';
        FieldByName('tkname').DisplayLAbel:='Õ¿»Ã.“ ';
        FieldByName('cextk').DisplayLAbel:=' ÷≈’ “ ';
        FieldByName('ptknomer').DisplayLAbel:='œ“ ';
        FieldByName('cexptk').DisplayLAbel:=' ÷≈’ œ“ ';
        FieldByName('tknorm').DisplayLAbel:='“–-“‹ ÕŒ–Ã.“ ';
        FieldByName('ptknorm').DisplayLAbel:='“–-“‹ ÕŒ–Ã.œ“ ';
        FieldByName('trudzakr').DisplayLAbel:='“–-“‹ ‘¿ “.œ“ ';
        FieldByName('trost').DisplayLAbel:='“–-“‹ Œ—“.œ“ ';
        FieldByName('procent').DisplayLAbel:='%  ';
        FieldByName('zavn').DisplayLAbel:='«¿¬.π ';
        FieldByName('zakaz').DisplayLAbel:='«¿ ¿« ';
        FieldByName('proekt').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('udp').DisplayLAbel:='”ƒœ ';
    end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm72.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm72.Button1Click(Sender: TObject);
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

procedure TForm72.Button2Click(Sender: TObject);
var
FExcel,Sheet,Range: OleVariant;
Udpp:string;
Nn: integer;
Nk: integer;
Nd: string;
Kd: string;

begin

Udpp:='';
nn := 0;
nk := 2;
nd:='';
kd:='';

FExcel:= CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_TK_PTK_CEX_UDP_72.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_TK_PTK_CEX_UDP_72.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := '”ƒœ';
sheet:=FExcel.Workbooks[1].WorkSheets[1];

Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[1,11]].Value:='”ƒŒ—“Œ¬≈–≈Õ»ﬂ œŒ—“–Œ≈◊Õ€≈:      '+ Form9.oraQuery1.FieldByName('name').asString;

DBGridEh1.DataSource.DataSet.DisableControls;
OraQuery1.First;

While not OraQuery1.eof do
//(nk < 250)(*not OraQuery1.eof*) do
Begin

If udpp <> OraQuery1.FieldByName('abrudp').asString then
Begin

If udpp <> '' then
Begin

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,7]].MergeCells:=true;

Sheet.Cells[nk,8].Formula:='=SUM(h' + inttostr(nn) + ':h' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,9].Formula:='=SUM(i' + inttostr(nn) + ':i' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,10].Formula:='=SUM(j' + inttostr(nn) + ':j' + inttostr((nk - 1)) + ')';

Sheet.Cells[nk,11].Formula:='=ROUND(((i' + inttostr(nk) + '/h' + inttostr(nk) + ') * 100), 2)';

Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Size:=12;
Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Bold:=true;

inc(nk);

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].MergeCells:=true;
End;

inc(nk);

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('udp').asString;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].Font.Size:=12;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].Font.Bold:=true;

Udpp:=OraQuery1.FieldByName('abrudp').asString;
inc(nk);
nn := nk;

End;

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('abrudp').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('tknomer').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('tkname').asString;

Sheet.Cells[nk,4].NumberFormat := '@';
Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('cextk').asString;
Sheet.Cells[nk,4].HorizontalAlignment:=xlCenter;

Sheet.Cells[nk,5].Value:=Form9.excelFloat(OraQuery1.FieldByName('tknorm').asString);
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('ptknomer').asString;

Sheet.Cells[nk, 7].NumberFormat := '@';
Sheet.Cells[nk, 7].Value:=OraQuery1.FieldByName('cexptk').asString;
Sheet.Cells[nk, 7].HorizontalAlignment:=xlCenter;

Sheet.Cells[nk,8].Value:=Form9.excelFloat(OraQuery1.FieldByName('ptknorm').asString);
Sheet.Cells[nk,9].Value:=Form9.excelFloat(OraQuery1.FieldByName('trudzakr').asString);
Sheet.Cells[nk,10].Value:=Form9.excelFloat(OraQuery1.FieldByName('trost').asString);
Sheet.Cells[nk,11].Value:=Form9.excelFloat(OraQuery1.FieldByName('procent').asString);

Inc(nk);

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,7]].MergeCells:=true;

Sheet.Cells[nk,8].Formula:='=SUM(h' + inttostr(nn) + ':h' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,9].Formula:='=SUM(i' + inttostr(nn) + ':i' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,10].Formula:='=SUM(j' + inttostr(nn) + ':j' + inttostr((nk - 1)) + ')';

Sheet.Cells[nk,11].Value(*Formula*):='=ROUND(((i' + inttostr(nk) + '/h' + inttostr(nk) + ') * 100), 2)';
//showmessage('=ROUND(((J' + inttostr(nk) + '/I' + inttostr(nk) + ') * 100); 2)');

Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Size:=12;
Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Bold:=true;

Sheet.Range[Sheet.Cells[2,1], Sheet.Cells[nk,11]].borders.linestyle:=xlContinuous;

OraQuery1.First;
DBGridEh1.DataSource.DataSet.EnableControls;

FExcel.Visible:=True;
end;


end.


