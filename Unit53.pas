unit Unit53;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TForm53 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zak: TStringField;
    OraQuery1denomer: TStringField;
    OraQuery1tktrud: TFloatField;
    OraQuery1trudz: TFloatField;
    OraQuery1osttrud: TFloatField;
    OraQuery1trudnz: TFloatField;
    OraQuery1iddenomer: TFloatField;
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
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form53: TForm53;

implementation

uses Unit9,Unit54;

{$R *.dfm}

procedure TForm53.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);
tx:='select lm.zak zak,lm.denomer denomer,lm.tktrud tktrud,lm.trudz trudz,lm.osttrud osttrud,lm.trudnz trudnz,lm.iddenomer iddenomer';
tx:=tx+' from (';
tx:=tx+' select distinct l.zak,l.denomer,max(l.tktrud) tktrud,max(l.trudz ) trudz,max(trudnz) trudnz,(max(l.tktrud)-max(l.trudz)) osttrud,l.iddenomer iddenomer';
tx:=tx+' from  (';
tx:=tx+' select lk.zak zak,lk.denomer denomer,sum(lk.tktrud) tktrud,max(0) trudz,max(0) trudnz,lk.iddenomer iddenomer';
tx:=tx+' from (';
tx:=tx+' select z.zak zak,decode(de.type_dep_type_dep_id,2,de.nomer,dd.nomer) denomer,nordsy.trud_tx(tx.texkompl_id) tktrud,0 trudz,0 trudnz,';
tx:=tx+'decode(de.type_dep_type_dep_id,2,de.dep_id,dd.dep_id) iddenomer';
tx:=tx+' from nordsy.texkompl tx, nordsy.texkompl tk, tronix.project_list pr,kadry_dep de,kadry_dep dd,feb_zakaz z';
tx:=tx+' where tk.type_tex_type_tex_id=8 and tx.texkompl_texkompl_id=tk.texkompl_id and nordsy.uzak_tx(tx.TEXKOMPL_ID)=z.nn(+)';
tx:=tx+' and tk.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and substr(tk.nomer,3,1)=''-'' and upper(z.zak) like (''%Ã—◊%'') and tx.dep_dep_id=de.dep_id(+) and de.dep_dep_id=dd.dep_id(+)';
tx:=tx+' ) lk ';
tx:=tx+' group by lk.zak,lk.denomer,lk.iddenomer';
tx:=tx+' union';
tx:=tx+' select ll.zak zak,ll.denomer denomer,max(ll.tktrud) tktrud,sum(ll.trudz) trudz,sum(ll.trudnz) trudnz,ll.iddenomer iddenomer';
tx:=tx+' from (';
tx:=tx+' select zk.zak zak,de.nomer denomer,0 tktrud,decode(tn.date_ins,null,0,tm.trudoem) trudz,decode(tn.date_ins,null,tm.trudoem,0) trudnz,de.dep_id iddenomer';
tx:=tx+' from tronix.ttn tn,tronix.ttn_mat tm,tronix.project_list pr,tronix.zakaz zk,kadry_dep de';
tx:=tx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.uzak_uzak_id=zk.nn(+) and tm.trudoem is not null';
tx:=tx+' and tn.date_anul_nar is null and tn.dep_dep_id_to=de.dep_id(+) and tn.project_project_id=pr.project_id(+) and pr.project_id='+edit1.text;
tx:=tx+' and zk.zak like (''%Ã—◊%'')';
tx:=tx+' and not exists ( select * from tronix.ttn tz where tz.zamen_nar = tn.ttn_id)';
tx:=tx+' ) ll';
tx:=tx+' group by ll.zak,ll.denomer,ll.iddenomer';
tx:=tx+' ) l';
tx:=tx+' group by l.zak,l.denomer,l.iddenomer';
tx:=tx+' ) lm';

//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zak').DisplayLAbel:='”◊.«¿ ¿« ';
        FieldByName('denomer').DisplayLAbel:='÷≈’ ';
        FieldByName('tktrud').DisplayLAbel:='“–-“‹ “Õ. ';
        FieldByName('trudz').DisplayLAbel:='“–-“‹ «¿ –€“€’ Õ¿–ﬂƒŒ¬ ';
        FieldByName('osttrud').DisplayLAbel:='Œ—“¿“ » “–-“»';
        FieldByName('trudnz').DisplayLAbel:='“–-“‹ Õ≈«¿ –€“€’ Õ¿–ﬂƒŒ¬';
        FieldByName('iddenomer').DisplayLAbel:='iddenomer';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

end;


procedure TForm53.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TForm53.Button1Click(Sender: TObject);
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

procedure TForm53.DBGridEh1DblClick(Sender: TObject);
begin
  Form53.edit2.Text:=oraQuery1.FieldByName('iddenomer').asString;
//  ShowMessage(Form53.edit2.Text);
//  ShowMessage(Form53.edit1.Text);
  Application.CreateForm(TForm54, Form54);
  Form54.Edit1.Text:=Form53.Edit1.Text;
//  ShowMessage(Form54.Edit1.Text);
  Form54.Edit2.Text:=Form53.Edit2.Text;
  Form54.Caption:='ŒÒÚ‡ÚÍË ÚÛ‰Ó∏ÏÍÓÒÚË ÔÓ Ã—◊: '+Form9.oraQuery1.FieldByName('name').asString;
//  if  Form53.EDIT2.TEXT<>'All' then
 Form54.Caption:=Form54.Caption+'  ÷≈’='+oraQuery1.FieldByName('denomer').asString;
  Form54.ShowModal();
  Form54.Free;
end;

procedure TForm53.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
      if (Column.FieldName='tktrud') and (Column.Field.Dataset.FieldByName('tktrud').AsFloat > 0) then
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
