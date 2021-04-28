unit Naryd_Cex_Proekt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TFNaryd_Cex_Proekt = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1dtnnomer: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1typnomer: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1ducnomer: TStringField;
    OraQuery1tnnomer: TStringField;
    OraQuery1date_dok: TStringField;
    OraQuery1date_ins: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    OraQuery1trudoem: TFloatField;
    OraQuery1ts_number: TStringField;
    OraQuery1naname: TStringField;
    OraQuery1pname: TStringField;
    OraQuery1god_dok: TStringField;
    OraQuery1god_ins: TStringField;
    OraQuery1tunomer: TStringField;
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    RadioGroup3: TRadioGroup;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNaryd_Cex_Proekt: TFNaryd_Cex_Proekt;
  dt: string;
implementation

uses Unit9;

{$R *.dfm}

procedure TFNaryd_Cex_Proekt.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='458';
RadioGroup1.ItemIndex:=0;
RadioGroup2.ItemIndex:=1;
RadioGroup3.ItemIndex:=0;
DateTimePicker1.DateTime:=date();
dt:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TFNaryd_Cex_Proekt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFNaryd_Cex_Proekt.Button1Click(Sender: TObject);
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

procedure TFNaryd_Cex_Proekt.Button2Click(Sender: TObject);
var tx:string;
begin
tx:=' ';
tx:='select tt.dtnnomer dtnnomer,tt.zak zak,tt.typnomer typnomer,tt.txnomer txnomer,decode(tt.ducnomer,'''',tt.dtxnomer,tt.ducnomer) ducnomer,';
tx:=tx+'tt.tnnomer tnnomer,tt.date_dok date_dok,tt.date_ins date_ins,tt.trudoem trudoem,tt.ts_number ts_number,tt.naname naname,tt.pname pname,';
tx:=tx+'substr(tt.date_dok,7,4) god_dok,substr(tt.date_ins,7,4) god_ins,tt.tunomer tunomer from (';

if RadioGroup1.ItemIndex<2 then
begin
//ShowMessage ('1');
tx:=tx+' select zk.zak zak,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,tx.nomer txnomer,dtn.nomer dtnnomer,';
tx:=tx+' decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.user_date1,''DD.MM.YYYY'') user_date1,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,';

tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,substr(kv.kod_prof,1,5) kod_prof,duc.nomer ducnomer,kv.name kvname,';
tx:=tx+' pi.ts_number ts_number,na.fullname naname,'''' pname,tn.user_name1 avtor,';
tx:=tx+' decode(instr(nordsy.tx_name_all(tk.texkompl_id),''(–“Œ)'',1),0,nordsy.tx_nomer(tk.texkompl_texkompl_id),''–“Œ'') tunomer';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,kadry_dep dtx,kadry_dep dtn,kadry_dep duc,kadry_prikaz pi,kadry_type_prikaz tp,';
tx:=tx+'nordsy.texkompl tx,nordsy.texkompl tk ,feb_zakaz z,nordsy.kvalif kv,kadry_name na';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';
if Edit2.Text<>'All' then
tx:=tx+' and dtn.dep_id='+Edit2.Text;

tx:=tx+' and tx.uch_uch_id=duc.dep_id(+) and tm.KVALIF_KVALIF_ID=kv.kvalif_id(+) and tn.post_post_id_nar is null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and tn.CADRY_CADRY_ID_NAR=pi.CADRY_CADRY_ID(+) and pi.type_prikaz_type_prikaz_id=tp.type_prikaz_id and tp.kod=1';
tx:=tx+' and pi.CADRY_CADRY_ID=na.CADRY_CADRY_ID(+) and tm.trudoem is not null and tn.date_anul_nar is null';

tx:=tx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''œ”≈'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';
tx:=tx+' and nordsy.uzak_tx(tx.TEXkompl_TEXKOMPL_ID)=z.nn(+)';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';

if Edit1.Text<>'All' then
tx:=tx+' and zk.id_project='+Edit1.Text;

if RadioGroup3.ItemIndex=1 then
tx:=tx+' and tn.date_ins is not null';

if RadioGroup3.ItemIndex=2 then
tx:=tx+' and tn.date_ins is null';

if RadioGroup2.ItemIndex=1 then
tx:=tx+' and TO_CHAR(tn.date_dok,''YYYYMMDD'') >='+DT;

if RadioGroup1.ItemIndex=0 then
tx:=tx+' union';
end;

if RadioGroup1.ItemIndex <>1 then
begin
//ShowMessage('2');
tx:=tx+' select zk.zak zak,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,tx.nomer txnomer,dtn.nomer dtnnomer,';
tx:=tx+'decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.user_date1,''DD.MM.YYYY'') user_date1,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,';

tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,substr(kv.kod_prof,1,5) kod_prof,duc.nomer ducnomer,kv.name kvname,'''' ts_number,';
tx:=tx+'fi.ident naname,fi.name pname,tn.user_name1 avtor,';
tx:=tx+' decode(instr(nordsy.tx_name_all(tk.texkompl_id),''(–“Œ)'',1),0,nordsy.tx_nomer(tk.texkompl_texkompl_id),''–“Œ'') tunomer';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,kadry_dep dtx,kadry_dep dtn,kadry_dep duc,nordsy.texkompl tx,nordsy.texkompl tk,';
tx:=tx+'feb_zakaz z,nordsy.kvalif kv,tronix.firm fi';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';

if Edit2.Text<>'All' then
tx:=tx+' and dtn.dep_id='+Edit2.Text;

tx:=tx+' and tx.uch_uch_id=duc.dep_id(+) and tm.KVALIF_KVALIF_ID=kv.kvalif_id(+) and tn.post_post_id_nar=fi.firm_id(+) and tn.post_post_id_nar is not null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+)';
tx:=tx+' and tm.trudoem is not null and tn.date_anul_nar is null';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''œ”≈'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';
 tx:=tx+'  and nordsy.uzak_tx(tx.TEXkompl_TEXKOMPL_ID)=z.nn(+)';

if Edit1.Text<>'All' then
tx:=tx+' and zk.id_project='+Edit1.Text;

if RadioGroup3.ItemIndex=1 then
tx:=tx+' and tn.date_ins is not null';

if RadioGroup3.ItemIndex=2 then
tx:=tx+' and tn.date_ins is null';

if RadioGroup2.ItemIndex=1 then
tx:=tx+' and TO_CHAR(tn.date_dok,''YYYYMMDD'') >='+DT;

end;
tx:=tx+' ) tt';
tx:=tx+' order by tt.zak,tt.dtnnomer,tt.typnomer,tt.txnomer,tt.tnnomer';


//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('dtnnomer').DisplayLAbel:='÷≈’ ';
        FieldByName('zak').DisplayLAbel:='«¿¬.π ';
        FieldByName('typnomer').DisplayLAbel:='“ /“Õ ';
        FieldByName('txnomer').DisplayLAbel:='œ“  ';
        FieldByName('ducnomer').DisplayLAbel:='”◊¿—“Œ  ';
        FieldByName('tnnomer').DisplayLAbel:='π Õ¿–ﬂƒ¿ ';
        FieldByName('date_dok').DisplayLAbel:='ƒ¿“¿ —Œ«ƒ. ';
        FieldByName('date_ins').DisplayLAbel:='ƒ¿“¿ «¿ –. ';
        FieldByName('trudoem').DisplayLAbel:='“–-“‹ ';
        FieldByName('ts_number').DisplayLAbel:='“¿¡.ÕŒÃ≈– ';
        FieldByName('naname').DisplayLAbel:='‘»Œ/œŒƒ–ﬂƒ◊»  ';
        FieldByName('pname').DisplayLAbel:='œŒƒ–ﬂƒ◊»  ';
        FieldByName('god_dok').DisplayLAbel:='√Œƒ —Œ«ƒ. ';
        FieldByName('god_ins').DisplayLAbel:='√Œƒ «¿ –. ';
        FieldByName('tunomer').DisplayLAbel:='” –.œ”≈ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TFNaryd_Cex_Proekt.DateTimePicker1Change(Sender: TObject);
begin
dt:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

end.
