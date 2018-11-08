unit Unit54;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm54 = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zak: TStringField;
    OraQuery1tknomer: TStringField;
    OraQuery1tkname: TStringField;
    OraQuery1tkdatins: TStringField;
    OraQuery1txnomer: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1txdatins: TStringField;
    OraQuery1tktrud: TFloatField;
    OraQuery1txtrud: TFloatField;
    OraQuery1trudz: TFloatField;
    OraQuery1osttrud: TFloatField;
    OraQuery1trudnz: TFloatField;
    OraQuery1koop: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
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
  Form54: TForm54;

implementation

uses Unit53;

{$R *.dfm}

procedure TForm54.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' select lm.zak zak, lm.tknomer tknomer,lm.tkname tkname,lm.tkdatins tkdatins,lm.txnomer txnomer,lm.denomer denomer,lm.txdatins txdatins,';
tx:=tx+'lm.tktrud tktrud,lm.txtrud txtrud,lm.trudz trudz,lm.osttrud osttrud,lm.trudnz trudnz,lm.koop koop';
//lm
tx:=tx+' from (';
tx:=tx+'select distinct l.zak zak,l.tknomer tknomer,l.tkname tkname,l.tkdatins tkdatins,l.txnomer txnomer,l.denomer denomer,l.koop koop,l.txdatins txdatins,';
tx:=tx+' max(l.tktrud) tktrud,max(l.txtrud) txtrud,max(l.trudz) trudz,(max(l.txtrud)-max(l.trudz)) osttrud,max(l.trudnz) trudnz';
//l
tx:=tx+' from (';
tx:=tx+'select z.zak zak,tk.nomer tknomer,replace(tk.name, chr(10), '' '') tkname, TO_CHAR(tk.otk_end,''DD.MM.YYYY'') tkdatins,';
tx:=tx+' decode(de.type_dep_type_dep_id,2,de.nomer,dd.nomer) denomer,TO_CHAR(tx.texkompl_id) koop,';
tx:=tx+' tx.nomer txnomer,TO_CHAR(tx.otk_end,''DD.MM.YYYY'') txdatins,';
tx:=tx+' nordsy.trud_tx(tk.texkompl_id) tktrud, nordsy.trud_tx(tx.texkompl_id) txtrud,0 trudz,0 trudnz ';

tx:=tx+' from nordsy.texkompl tx,nordsy.texkompl tk,tronix.project_list pr,kadry_dep de,kadry_dep dd,feb_zakaz z';
tx:=tx+' where tk.type_tex_type_tex_id=8 and tx.texkompl_texkompl_id=tk.texkompl_id and nordsy.uzak_tx(tk.TEXKOMPL_ID)=z.nn(+)';

tx:=tx+' and tk.project_project_id=pr.project_id(+) and pr.project_id='+Edit1.Text;
tx:=tx+' and upper(z.zak) like (''%ÌÑ×%'') and substr(tk.nomer,3,1)=''-''';
tx:=tx+' and tx.dep_dep_id=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';
tx:=tx+' and '+Edit2.Text+' in (de.dep_id,dd.dep_id)';

tx:=tx+' union';

tx:=tx+' select ll.zak zak,ll.tknomer tknomer,ll.tkname tkname,max(ll.tkdatins) tkdatins,ll.denomer denomer,ll.koop koop,ll.txnomer txnomer,max(ll.txdatins) txdatins,';
tx:=tx+' max(ll.tktrud) tktrud,max(ll.txtrud) txtrud,sum(ll.trudz) trudz,sum(ll.trudnz) trudnz';
//ll
tx:=tx+' from (';
tx:=tx+' select lk.zak zak,lk.tknomer tknomer,lk.tkname tkname,lk.tkdatins tkdatins,';

tx:=tx+' (select decode(de.type_dep_type_dep_id,2,de.nomer,dd.nomer) from nordsy.texkompl tt,kadry_dep de,kadry_dep dd';
tx:=tx+' where tt.texkompl_id=lk.koop and tt.dep_dep_id=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';
tx:=tx+' and '+Edit2.Text+' in (de.dep_id,dd.dep_id)';
tx:=tx+' ) denomer,';

tx:=tx+'lk.koop koop,nordsy.tx_nomer(lk.koop) txnomer,';
tx:=tx+' (select TO_CHAR(tt.otk_end,''DD.MM.YYYY'') from nordsy.texkompl tt where tt.texkompl_id=lk.koop) txdatins,';
tx:=tx+' lk.tktrud tktrud,nordsy.trud_tx(lk.koop) txtrud, lk.trudz trudz,lk.trudnz trudnz';
//lk
tx:=tx+' from (';
tx:=tx+' select z.zak zak,decode(tk.type_tex_type_tex_id,7,tk.nomer,8,tk.nomer,tx.nomer) tknomer,';
tx:=tx+' replace(tk.name, chr(10), '' '') tkname,nordsy.trud_tx(tk.texkompl_id) tktrud,TO_CHAR(tk.otk_end,''DD.MM.YYYY'') tkdatins,';

tx:=tx+' substr(nordsy.tk_nomer_all(tx.texkompl_id),instr(nordsy.tk_nomer_all(tx.texkompl_id),''--'',-1,4)+3,';
tx:=tx+'instr(nordsy.tk_nomer_all(tx.texkompl_id),''--'',-1,3)-(instr(nordsy.tk_nomer_all(tx.texkompl_id),''--'',-1,4)+4)) koop,';

tx:=tx+' decode(tn.date_ins,null,0,tm.trudoem) trudz,decode(tn.date_ins,null,tm.trudoem,0) trudnz ';

tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,nordsy.texkompl tx,nordsy.texkompl tk,tronix.project_list pr,tronix.zakaz zk,feb_zakaz z';
tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.texkompl_texkompl_id_nar=tx.texkompl_id and tn.uzak_uzak_id=zk.nn(+)';
tx:=tx+' and tm.trudoem is not null and tn.date_anul_nar is null';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''ÏÓÅ'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id and nordsy.uzak_tx(tx.texkompl_texkompl_id)=z.nn(+)';
tx:=tx+' and tn.project_project_id=pr.project_id(+) and pr.project_id='+Edit1.Text+' and zk.zak like (''%ÌÑ×%'')';

tx:=tx+' and tn.dep_dep_id_to='+Edit2.Text;
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
 tx:=tx+' ) lk';
tx:=tx+' ) ll';
tx:=tx+' group by ll.zak,ll.tknomer,ll.tkname,ll.txnomer,ll.koop,ll.denomer';
tx:=tx+' ) l';
tx:=tx+' group by l.zak,l.tknomer,l.tkname,l.tkdatins,l.txnomer,l.denomer,l.koop,l.txdatins';
tx:=tx+') lm';
tx:=tx+' order by lm.zak,lm.tknomer,lm.tkname,lm.tkdatins,lm.txnomer,lm.denomer,lm.koop,lm.txdatins';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zak').DisplayLAbel:='Ó×.ÇÀÊÀÇ ';
        FieldByName('tknomer').DisplayLAbel:='ÒÍ ';
        FieldByName('tkname').DisplayLAbel:='ÍÀÈÌÅÍÎÂÀÍÈÅ ÒÍ ';
        FieldByName('tkdatins').DisplayLAbel:='ÄÀÒÀ ÇÀÊÐ.ÒÍ';
        FieldByName('txnomer').DisplayLAbel:='Ö/Ê ';
        FieldByName('denomer').DisplayLAbel:='ÖÅÕ ';
        FieldByName('txdatins').DisplayLAbel:='ÄÀÒÀ ÇÀÊÐ.Ö/Ê ';
        FieldByName('tktrud').DisplayLAbel:='ÒÐ-ÒÜ ÒÍ. ';
        FieldByName('txtrud').DisplayLAbel:='ÒÐ-ÒÜ Ö/Ê';
        FieldByName('trudz').DisplayLAbel:='ÒÐ-ÒÜ ÇÀÊÐÛÒÀß ';
        FieldByName('osttrud').DisplayLAbel:='ÎÑÒÀÒÊÈ ÒÐ-ÒÈ';
        FieldByName('trudnz').DisplayLAbel:='ÎÑÒÀÒÊÈ ÒÐ-ÒÈ';
        FieldByName('koop').DisplayLAbel:='ID ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm54.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm54.Button1Click(Sender: TObject);
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


procedure TForm54.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
      if (Column.FieldName='tktrud') and (Column.Field.Dataset.FieldByName('tktrud').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

      if (Column.FieldName='txtrud') and (Column.Field.Dataset.FieldByName('txtrud').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='trudnz') and (Column.Field.Dataset.FieldByName('trudnz').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='trudz') and (Column.Field.Dataset.FieldByName('trudz').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

    if (Column.FieldName='osttrud') and (Column.Field.Dataset.FieldByName('osttrud').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
