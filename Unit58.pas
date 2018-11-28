unit Unit58;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TForm58 = class(TForm)
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
    DateTimePicker1: TDateTimePicker;
    Label1: TLabel;
    Button2: TButton;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    DateTimePicker2: TDateTimePicker;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure DateTimePicker2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form58: TForm58;
  dn: string;
  dk: string;
implementation

uses Unit32;

{$R *.dfm}

procedure TForm58.FormShow(Sender: TObject);
begin
//ShowMessage(Edit1.Text);
//Edit1.Text:='4011';
//ShowMessage(Form58.Caption);
RadioGroup1.ItemIndex:=0;
DateTimePicker1.DateTime:=date();
DateTimePicker2.DateTime:=date();
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

procedure TForm58.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm58.Button1Click(Sender: TObject);
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

procedure TForm58.Button2Click(Sender: TObject);
var tx:string;
begin
//ShowMessage(Edit2.Text);
tx:=' ';
tx:='select tt.dtnnomer dtnnomer,tt.zak zak,tt.typnomer typnomer,tt.txnomer txnomer,decode(tt.ducnomer,'''',tt.dtxnomer,tt.ducnomer) ducnomer,';
tx:=tx+'tt.tnnomer tnnomer,tt.date_dok date_dok,tt.date_ins date_ins,tt.trudoem trudoem,tt.ts_number ts_number,tt.naname naname,tt.pname pname from (';

if RadioGroup1.ItemIndex<2 then
begin
//ShowMessage ('1');
tx:=tx+' select zk.zak zak,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,tx.nomer txnomer,dtn.nomer dtnnomer,';
tx:=tx+' decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.user_date1,''DD.MM.YYYY'') user_date1,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,tn.user_name1 user_name1,';

tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,substr(kv.kod_prof,1,5) kod_prof,duc.nomer ducnomer,kv.name kvname,';
tx:=tx+' pi.ts_number ts_number,na.fullname naname,'''' pname,tn.user_name1 avtor';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,kadry_dep dtx,kadry_dep dtn,kadry_dep duc,kadry_prikaz pi,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz z,nordsy.kvalif kv,kadry_name na';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';
if Edit1.Text<>'All' then
tx:=tx+' and dtn.dep_id='+Edit1.Text;

tx:=tx+' and tx.uch_uch_id=duc.dep_id(+) and tm.KVALIF_KVALIF_ID=kv.kvalif_id(+) and tn.post_post_id_nar is null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and tn.CADRY_CADRY_ID_NAR=pi.CADRY_CADRY_ID(+)';
tx:=tx+' and pi.CADRY_CADRY_ID=na.CADRY_CADRY_ID(+) and tm.trudoem is not null and tn.date_anul_nar is null';

tx:=tx+' and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''ÏÓÅ'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id and nordsy.uzak_tx(tx.TEXkompl_TEXKOMPL_ID)=z.nn(+)';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';

tx:=tx+' and tn.date_ins is not null';

tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN;
tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;

if RadioGroup1.ItemIndex=0 then
tx:=tx+' union';
end;

if RadioGroup1.ItemIndex <>1 then
begin
//ShowMessage('2');
tx:=tx+' select zk.zak zak,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,tx.nomer txnomer,dtn.nomer dtnnomer,';
tx:=tx+'decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.user_date1,''DD.MM.YYYY'') user_date1,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,tn.user_name1 user_name1,';

tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,substr(kv.kod_prof,1,5) kod_prof,duc.nomer ducnomer,kv.name kvname,'''' ts_number,';
tx:=tx+'fi.ident naname,fi.name pname,tn.user_name1 avtor';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,kadry_dep dtx,kadry_dep dtn,kadry_dep duc,nordsy.texkompl tx,nordsy.texkompl tk,';
tx:=tx+'feb_zakaz z,nordsy.kvalif kv,tronix.firm fi';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';

if Edit1.Text<>'All' then
tx:=tx+' and dtn.dep_id='+Edit1.Text;

tx:=tx+' and tx.uch_uch_id=duc.dep_id(+) and tm.KVALIF_KVALIF_ID=kv.kvalif_id(+) and tn.post_post_id_nar=fi.firm_id(+) and tn.post_post_id_nar is not null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+)';
tx:=tx+' and tm.trudoem is not null and tn.date_anul_nar is null and nvl(nordsy.go_in_tk(tx.TEXkompl_TEXKOMPL_ID,''ÏÓÅ'',''TYPE''),tx.TEXkompl_TEXKOMPL_ID)=tk.texkompl_id';

tx:=tx+' and nordsy.uzak_tx(tx.TEXkompl_TEXKOMPL_ID)=z.nn(+)';

tx:=tx+' and tn.date_ins is not null';

tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') >='+DN;
tx:=tx+' and TO_CHAR(tn.date_ins,''YYYYMMDD'') <='+DK;

end;
tx:=tx+' ) tt';
tx:=tx+' order by tt.zak,tt.dtnnomer,tt.typnomer,tt.txnomer,tt.tnnomer';


//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('dtnnomer').DisplayLAbel:='ÖÅÕ ';
        FieldByName('zak').DisplayLAbel:='ÇÀÂ.¹ ';
        FieldByName('typnomer').DisplayLAbel:='ÒÊ/ÒÍ ';
        FieldByName('txnomer').DisplayLAbel:='ÏÒÊ ';
        FieldByName('ducnomer').DisplayLAbel:='Ó×ÀÑÒÎÊ ';
        FieldByName('tnnomer').DisplayLAbel:='¹ ÍÀÐßÄÀ ';
        FieldByName('date_dok').DisplayLAbel:='ÄÀÒÀ ÑÎÇÄ. ';
        FieldByName('date_ins').DisplayLAbel:='ÄÀÒÀ ÇÀÊÐ. ';
        FieldByName('trudoem').DisplayLAbel:='ÒÐ-ÒÜ ';
        FieldByName('ts_number').DisplayLAbel:='ÒÀÁ.ÍÎÌÅÐ ';
        FieldByName('naname').DisplayLAbel:='ÔÈÎ/ÏÎÄÐßÄ×ÈÊ ';
        FieldByName('pname').DisplayLAbel:='ÏÎÄÐßÄ×ÈÊ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TForm58.DateTimePicker1Change(Sender: TObject);
begin
dn:=FormatDateTime('yyyymmdd',DateTimePicker1.DateTime);
end;

procedure TForm58.DateTimePicker2Change(Sender: TObject);
begin
dk:=FormatDateTime('yyyymmdd',DateTimePicker2.DateTime);
end;

end.
