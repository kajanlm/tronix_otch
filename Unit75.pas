unit Unit75;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComObj;

type
  TForm75 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1udp: TStringField;
    OraQuery1udpdateotk: TStringField;
    OraQuery1tk: TStringField;
    OraQuery1tkdatotk: TStringField;
    OraQuery1tx: TStringField;
    OraQuery1txotk: TStringField;
    OraQuery1txdatotk: TStringField;
    OraQuery1trnorm: TFloatField;
    OraQuery1trzakr: TFloatField;
    OraQuery1trost: TFloatField;
    OraQuery1procent: TFloatField;
    OraQuery1zavn: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1proekt: TStringField;
    OraQuery1abrudp: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1txname: TStringField;
    Edit1: TEdit;
    Edit2: TEdit;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
 private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form75: TForm75;

implementation

 uses Unit9;

{$R *.dfm}

procedure TForm75.FormShow(Sender: TObject);
var tx:string;
FExcel,Sheet,Range: OleVariant;
Udpp:string;
Nn: integer;
Nk: integer;
//Nd: integer;
//Kd: integer;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='All';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+' select ll.udp as udp,ll.tk as tk,ll.tkdatotk as tkdatotk,ll.tx as tx,ll.txotk as txotk,ll.txdatotk as txdatotk,';
tx:=tx+' ll.trnorm as trnorm,ll.trzakr as trzakr,ll.trost as trost,(decode(ll.trzakr,0,0,round((ll.trzakr/ll.trnorm)*100,2))) as procent,';
tx:=tx+' ll.zavn as zavn,ll.zak as zak,ll.proekt as proekt,ll.abrudp as abrudp,ll.udpdateotk as udpdateotk,';
tx:=tx+' ll.tkname as tkname,ll.txname as txname';
tx:=tx+' from(';

tx:=tx+' select l.txdic udp,l.abrudp abrudp,nordsy.tx_nomer(l.tkid) tk,TO_CHAR(l.tkdatotk,''DD.MM.YYYY'') tkdatotk,l.tkname tkname,';
tx:=tx+' (select TO_CHAR(tx.otk_end,''DD.MM.YYYY'') from nordsy.texkompl tx where tx.texkompl_id=l.txid) txotk,';
tx:=tx+' (select tx.name from nordsy.texkompl tx where tx.texkompl_id=l.txid) txname,';
tx:=tx+' decode(instr(l.abrudp,'';'',1),0,(select to_char(co.date_otk,''DD.MM.YYYY'') from dic_concept co where co.concept_id=tronix_up_tk_dic_id(l.txid)),'''') udpdateotk,';
tx:=tx+' nordsy.tx_nomer(l.txid) tx,TO_CHAR(nordsy.get_date_tx_from_ptx(l.txid,''OTK_END''),''DD.MM.YYYY'') txdatotk,';
tx:=tx+' l.zavn zavn,l.zak zak,l.proekt proekt,';

tx:=tx+' nordsy.trud_tx_reg_dat.trud_tx(l.txid) trnorm,';
tx:=tx+' (nordsy.trud_tx_reg_dat.trud_tx(l.txid)-nordsy.trud_tx_reg_dat.trud_tx(l.txid,''Œ—“¿“Œ '')) trzakr,';
tx:=tx+' nordsy.trud_tx_reg_dat.trud_tx(l.txid,''Œ—“¿“Œ '') trost';
tx:=tx+' from(';

tx:=tx+' select distinct trim(tronix.up_tk_dic(tx.texkompl_id)) txdic,tronix.up_tk_dic_short(tx.texkompl_id) abrudp,';
tx:=tx+' tk.texkompl_id tkid,tk.name tkname,nordsy.get_date_tx_from_ptx(tk.texkompl_id,''OTK_END'') tkdatotk,pr.name proekt,pr.zavn zavn,zk.zak zak,';

tx:=tx+' decode(tx.type_tex_type_tex_id,7,tx.texkompl_id,8,tx.texkompl_id,';
tx:=tx+'(select tv.texkompl_id from nordsy.texkompl tv where tv.type_tex_type_tex_id not in (11,13) and tv.texkompl_texkompl_id=tk.texkompl_id';
tx:=tx+' start with tv.texkompl_id =tx.texkompl_id';
tx:=tx+' connect  by prior tv.texkompl_texkompl_id=tv.texkompl_id)) as txid';

tx:=tx+' from nordsy.tex_kvalif tv,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz zk,tronix.project_list pr';

tx:=tx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+) and tx.project_project_id='+edit1.text;
tx:=tx+' and pr.project_id=tx.project_project_id';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and upper(zk.zak) not like (''%%(Ã—◊)'')';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_id)=tk.texkompl_id(+)';

tx:=tx+' )l';
tx:=tx+' )ll';
tx:=tx+'  where ll.udpdateotk is not null and (ll.tkdatotk is null or ll.txotk is null)';
tx:=tx+' order by nordsy.sort_char_number(ll.abrudp), ll.tk,ll.tx';

//ShowMEssage(tx);

  With OraQuery1 Do
     begin
        FieldByName('udp').DisplayLAbel:='”ƒœ';
        FieldByName('udpdateotk').DisplayLAbel:='”ƒœ «¿ –€“Œ';
        FieldByName('tk').DisplayLAbel:=' “ ';
        FieldByName('tkdatotk').DisplayLAbel:='ƒ¿“¿ Œ“◊®“¿ “ ';
        FieldByName('tx').DisplayLAbel:=' œ“ ';
        FieldByName('txotk').DisplayLAbel:='œ“  «¿ –€“Œ';
        FieldByName('txdatotk').DisplayLAbel:='ƒ¿“¿ Œ“◊®“¿ œ“  ÔÓ Õ¿–ﬂƒ¿Ã';
        FieldByName('trnorm').DisplayLAbel:='“–-“‹ ÕŒ–Ã. œ“ ';
        FieldByName('trzakr').DisplayLAbel:='“–-“‹ ‘¿ “. œ“ ';
        FieldByName('trost').DisplayLAbel:='“–-“‹ Œ—“. œ“ ';
        FieldByName('procent').DisplayLAbel:='%  ';
        FieldByName('zavn').DisplayLAbel:='«¿¬.ÕŒÃ≈– ';
        FieldByName('zak').DisplayLAbel:='«¿ ¿« ';
        FieldByName('proekt').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('abrudp').DisplayLAbel:=' Œ–Œ“ Œ≈ ”ƒœ ';
        FieldByName('tkname').DisplayLAbel:='tkname ';
        FieldByName('txname').DisplayLAbel:='txname ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

Udpp:='';
nn := 0;
nk := 2;
//nd:=0;
//kd:=0;

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents:=False;
FExcel.Visible:=False;

//FExcel.Workbooks.Add('c:\SHABLON_NEZAKR_TK_PTK_UDP_ZAKR_75.xls');
FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_NEZAKR_TK_PTK_UDP_ZAKR_75.xls');

FExcel.Workbooks[1].WorkSheets[1].Name := '«‡Í˚Ú˚Â ”ƒœ Ò ÌÂÁ‡Í˚Ú. “ -œ“ ';
sheet:=FExcel.Workbooks[1].WorkSheets[1];
//Sheet.Cells[1,1 ].Value:='Õ≈«¿ –€“€≈ “ -œ“  ¬ «¿ –€“€’ ”ƒœ:      '+ Form9.oraQuery1.FieldByName('name').asString;
Sheet.Range[Sheet.Cells[1,1],Sheet.Cells[1,11]].Value:='Õ≈«¿ –€“€≈ “ -œ“  ¬ «¿ –€“€’ ”ƒœ:      '+ Form9.oraQuery1.FieldByName('name').asString;

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
//inc(nk);

//Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,12]].MergeCells:=true;
End;

inc(nk);

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('udp').asString+': «‡Í˚ÚÓ '+OraQuery1.FieldByName('udpdateotk').asString;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].MergeCells:=true;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].Font.Size:=12;
Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,11]].Font.Bold:=true;

Udpp:=OraQuery1.FieldByName('abrudp').asString;
inc(nk);
nn := nk;
//nd:=0;
//kd:=nk;
End;

Sheet.Cells[nk,1].Value:=OraQuery1.FieldByName('tk').asString;
Sheet.Cells[nk,2].Value:=OraQuery1.FieldByName('tkname').asString;
Sheet.Cells[nk,3].Value:=OraQuery1.FieldByName('tkdatotk').asString;

Sheet.Cells[nk,4].Value:=OraQuery1.FieldByName('tx').asString;
Sheet.Cells[nk,5].Value:=OraQuery1.FieldByName('txname').asString;
Sheet.Cells[nk,6].Value:=OraQuery1.FieldByName('txotk').asString;
Sheet.Cells[nk,7].Value:=OraQuery1.FieldByName('txdatotk').asString;

Sheet.Cells[nk,8].Value:=Form9.excelFloat(OraQuery1.FieldByName('trnorm').asString);
Sheet.Cells[nk,9].Value:=Form9.excelFloat(OraQuery1.FieldByName('trzakr').asString);
Sheet.Cells[nk,10].Value:=Form9.excelFloat(OraQuery1.FieldByName('trost').asString);
Sheet.Cells[nk,11].Value:=Form9.excelFloat(OraQuery1.FieldByName('procent').asString);

Inc(nk);

oraQuery1.Next;

End;

Sheet.Range[Sheet.Cells[nk,1],Sheet.Cells[nk,7]].MergeCells:=true;

Sheet.Cells[nk,8].Formula:='=SUM(h' + inttostr(nn) + ':j' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,9].Formula:='=SUM(i' + inttostr(nn) + ':i' + inttostr((nk - 1)) + ')';
Sheet.Cells[nk,10].Formula:='=SUM(j' + inttostr(nn) + ':j' + inttostr((nk - 1)) + ')';

Sheet.Cells[nk,11].Value(*Formula*):='=ROUND(((i' + inttostr(nk) + '/h' + inttostr(nk) + ') * 100), 2)';
//showmessage('=ROUND(((k' + inttostr(nk) + '/j' + inttostr(nk) + ') * 100); 2)');

Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Size:=12;
Sheet.Range[Sheet.Cells[nk,8],Sheet.Cells[nk+1,11]].Font.Bold:=true;

Sheet.Range[Sheet.Cells[2,1], Sheet.Cells[nk,11]].borders.linestyle:=xlContinuous;

OraQuery1.First;
FExcel.Visible:=True;
OraQuery1.Close;
Form75.Close;
end;

procedure TForm75.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

end.

