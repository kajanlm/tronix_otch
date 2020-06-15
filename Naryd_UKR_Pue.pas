unit Naryd_UKR_Pue;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFNaryd_UKR_Pue = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1podr: TStringField;
    OraQuery1zavn: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1tkunomer: TStringField;
    OraQuery1typnomer: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1txname: TStringField;
    OraQuery1tnnomer: TStringField;
    OraQuery1datedok: TStringField;
    OraQuery1dateins: TStringField;
    OraQuery1trudoem: TFloatField;
    OraQuery1razrjd: TStringField;
    OraQuery1tars: TStringField;
    OraQuery1rasc: TFloatField;
    OraQuery1ts_number: TStringField;
    OraQuery1naname: TStringField;
    OraQuery1pname: TStringField;
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
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FNaryd_UKR_Pue: TFNaryd_UKR_Pue;

implementation

uses Unit9;

{$R *.dfm}

procedure TFNaryd_UKR_Pue.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:=tx+'select tt.dtnnomer podr,tt.zavn zavn,tt.zak zak,tt.tkunomer tkunomer,tt.typnomer typnomer,';
tx:=tx+' tt.tkname tkname,tt.txnomer txnomer,tt.txname txname,tt.tnnomer tnnomer,';
tx:=tx+' date_dok datedok,tt.date_ins dateins,tt.trudoem trudoem,';
tx:=tx+' tt.kvname kvname,tt.razrjd razrjd,tt.tars tars,tt.rasc rasc,';
tx:=tx+' tt.ts_number ts_number,tt.naname naname,tt.pname pname ';
tx:=tx+' from ';
tx:=tx+' (';
tx:=tx+' select zk.zak zak,pr.zavn zavn,tku.nomer tkunomer,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,';
tx:=tx+' tx.nomer txnomer,tx.name txname,tk.name tkname,dtn.nomer dtnnomer,decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,';
tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,vo.kod vo,to_char(tm.razryd,''9'') razrjd,(vr.kod ||vu.kod) tars,';
tx:=tx+' round(nordsy.comp_tarif( tm.razryd, tm.vid_rabot_vid_rabot_id, tm.ysl_rabot_ysl_rabot_id)*tm.trudoem,3) rasc,';
tx:=tx+' kv.name kvname,pi.ts_number ts_number,na.fullname naname,'''' pname';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,tronix_project_list pr,feb_zakaz z,';
tx:=tx+' kadry_dep dtx,kadry_dep dtn,kadry_name na,kadry_prikaz pi,';
tx:=tx+' nordsy.texkompl tx,nordsy.texkompl tk,nordsy.texkompl tku,nordsy.kvalif kv,';
tx:=tx+' nordsy.vid_rabot vr,nordsy.ysl_rabot vu,nordsy.vid_oplaty vo';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';
tx:=tx+' and tm.vid_rabot_vid_rabot_id=vr.vid_rabot_id(+) and tm.kvalif_kvalif_id=kv.kvalif_id(+)';
tx:=tx+' and tm.ysl_rabot_ysl_rabot_id=vu.ysl_rabot_id(+) and tm.vid_oplaty_vid_oplaty_id=vo.vid_oplaty_id(+)';
tx:=tx+' and tn.post_post_id_nar is null and tn.uzak_uzak_id=zk.nn(+)';
tx:=tx+' and tn.cadry_cadry_id_nar=pi.cadry_cadry_id(+) and pi.cadry_cadry_id=na.cadry_cadry_id(+)';
tx:=tx+' and tn.date_anul_nar is null and tn.date_ins is not null';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''ÏÓÅ'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_texkompl_id)=z.nn(+)';
tx:=tx+' and tn.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id) and tk.texkompl_texkompl_id=tku.texkompl_id';

tx:=tx+' union';

tx:=tx+' select zk.zak zak,pr.zavn zavn,tku.nomer tkunomer,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) typnomer,';
tx:=tx+' tx.nomer txnomer,tx.name txname,tk.name tkname,dtn.nomer dtnnomer,decode(substr(dtx.nomer,3,1),''-'',dtx.nomer,'''') dtxnomer,';
tx:=tx+' TO_CHAR(tn.date_dok,''DD.MM.YYYY'') date_dok,TO_CHAR(tn.date_ins,''DD.MM.YYYY'') date_ins,';
tx:=tx+' tn.nomer tnnomer,tm.trudoem trudoem,vo.kod vo,to_char(tm.razryd,''9'') razrjd,(vr.kod ||vu.kod) tars,';
tx:=tx+' round(nordsy.comp_tarif( tm.razryd, tm.vid_rabot_vid_rabot_id, tm.ysl_rabot_ysl_rabot_id)*tm.trudoem,3) rasc,';
tx:=tx+' kv.name kvname,'''' ts_number,fi.ident naname,fi.name pname';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.zakaz zk,tronix_project_list pr,kadry_dep dtx,kadry_dep dtn,kadry_dep duc,';
tx:=tx+' nordsy.texkompl tx,nordsy.texkompl tk,nordsy.texkompl tku,feb_zakaz z,nordsy.kvalif kv,nordsy.vid_rabot vr,';
tx:=tx+' nordsy.ysl_rabot vu,nordsy.vid_oplaty vo,tronix.firm fi';

tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id';
tx:=tx+' and tx.dep_dep_id=dtx.dep_id(+) and tn.dep_dep_id_to=dtn.dep_id(+)';
tx:=tx+' and tm.vid_rabot_vid_rabot_id=vr.vid_rabot_id(+) and tm.ysl_rabot_ysl_rabot_id=vu.ysl_rabot_id(+)';
tx:=tx+' and tm.kvalif_kvalif_id=kv.kvalif_id(+) and tm.vid_oplaty_vid_oplaty_id=vo.vid_oplaty_id(+)';
tx:=tx+' and tn.post_post_id_nar=fi.firm_id(+) and tn.post_post_id_nar is not null';
tx:=tx+' and tn.uzak_uzak_id=zk.nn(+) and tn.project_project_id=pr.project_id(+)';
tx:=tx+' and pr.project_id='+edit1.text;

tx:=tx+' and tn.date_ins is not null and tn.date_anul_nar is null ';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''ÏÓÅ'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_texkompl_id)=z.nn(+)';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
tx:=tx+' and tk.texkompl_texkompl_id=tku.texkompl_id';
tx:=tx+' ) tt';
tx:=tx+' order by tt.dtnnomer,tt.zavn,tt.typnomer,txnomer,tnnomer';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('podr').DisplayLAbel:='ÖÅÕ ';
        FieldByName('zavn').DisplayLAbel:='ÇÀÂ.¹ ';
        FieldByName('zak').DisplayLAbel:='ÇÀÊÀÇ ';
        FieldByName('tkunomer').DisplayLAbel:='ÓÊÐ ';
        FieldByName('typnomer').DisplayLAbel:='ÒÊ/ÒÍ ';
        FieldByName('tkname').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÒÊ/ÒÍ ';
        FieldByName('txnomer').DisplayLAbel:='ÏÒÊ/ÖÅÕÎÊÎÎÏ. ';
        FieldByName('txname').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÏÒÊ/ÖÅÕÎÊÎÎÏ. ';
        FieldByName('tnnomer').DisplayLAbel:='¹ ÍÀÐßÄÀ ';
        FieldByName('datedok').DisplayLAbel:='ÄÀÒÀ ÑÎÇÄ. ';
        FieldByName('dateins').DisplayLAbel:='ÄÀÒÀ ÇÀÊÐ. ';
        FieldByName('trudoem').DisplayLAbel:='ÒÐÓÄÎ¨ÌÊÎÑÒÜ ';
        FieldByName('kvname').DisplayLAbel:='ÏÐÎÔÅÑÑÈß ';
        FieldByName('razrjd').DisplayLAbel:='ÐÀÇÐßÄ ';
        FieldByName('tars').DisplayLAbel:='ÒÀÐ.ÑÅÒÊÀ ';
        FieldByName('rasc').DisplayLAbel:='ÐÀÑÖÅÍÊÀ ';
        FieldByName('ts_number').DisplayLAbel:='ÒÀÁ.¹ ';
        FieldByName('naname').DisplayLAbel:='ÔÈÎ/ÏÎÄÐßÄ×ÈÊ ';
        FieldByName('pname').DisplayLAbel:='ÏÎËÍÎÅ ÍÀÈÌÅÍÎÂÀÍÈÅ ÏÎÄÐßÄ×ÈÊÀ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TFNaryd_UKR_Pue.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFNaryd_UKR_Pue.Button1Click(Sender: TObject);
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


procedure TFNaryd_UKR_Pue.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

    if (Column.FieldName='trudoem') and (Column.Field.Dataset.FieldByName('trudoem').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='rasc') and (Column.Field.Dataset.FieldByName('rasc').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;
end.
