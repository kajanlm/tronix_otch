unit Ostatok_Trud_Pue_No_Msch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh;

type
  TFOstatok_Trud_Pue_No_Msch = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zavn: TStringField;
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
  FOstatok_Trud_Pue_No_Msch: TFOstatok_Trud_Pue_No_Msch;

implementation

uses Unit9,Ostatok_Trud_Pue_No_Msch_Cex;

{$R *.dfm}

procedure TFOstatok_Trud_Pue_No_Msch.FormShow(Sender: TObject);
var txx: string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

txx:=' ';
txx:='select l.zavn as zavn, l.denomer as denomer,l.tktrud as tktrud,(l.tktrud-l.trudz) as osttrud,';
txx:=txx+' l.trudz as trudz,l.trudnz as trudnz,(select dep_id from kadry_dep where nomer=l.denomer) as iddenomer';
txx:=txx+' from( ';

txx:=txx+' select tt.zavn zavn, tt.denomer denomer,sum(tt.tktrud) tktrud,sum(tt.trudnarz) trudz,';
txx:=txx+' sum(tt.trudnarnz) trudnz';
//,max(tt.iddenomer) iddenomer';
txx:=txx+' from(';

txx:=txx+' select pr.zavn zavn,substr(de.nomer,1,2) denomer,sum(tv.time) tktrud,0 trudnarz,0 trudnarnz';
//txx:=txx+' ,decode(de.type_dep_type_dep_id,2,de.dep_id,de.dep_dep_id) iddenomer';
txx:=txx+' from  nordsy.texkompl tx,nordsy.tex_kvalif tv,feb_zakaz zk,tronix_project_list pr,kadry_dep de';
txx:=txx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+)';
txx:=txx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn and zk.zak not like (''%%(ÌÑ×)'')';
txx:=txx+' and zk.date_end is null and zk.id_project=pr.project_id(+) and pr.project_id='+edit1.text;
txx:=txx+' and tx.dep_dep_id=de.dep_id(+)';
txx:=txx+' group by pr.zavn,substr(de.nomer,1,2)';

txx:=txx+' union all';

txx:=txx+' select t.zavn zavn,t.denomer denomer,sum(t.tktrud) tktrud,sum(t.trudz) trudz,sum(t.trudnz) trudnz';
//,t.iddenomer iddenomer';
txx:=txx+' from( ';

txx:=txx+' select pr.zavn zavn,substr(de.nomer,1,2) denomer,0 tktrud,';
txx:=txx+' decode(tn.date_ins,null,0,tm.trudoem) trudz,decode(tn.date_ins,null,tm.trudoem,0) trudnz';
//txx:=txx+' ,decode(de.type_dep_type_dep_id,2,de.dep_id,de.dep_dep_id) iddenomer';

txx:=txx+' from tronix.ttn tn,tronix.ttn_mat tm,kadry_dep de,tronix.project_list pr,feb_zakaz z';

txx:=txx+' where tn.type_ttn_type_ttn_id=60 and tm.ttn_ttn_id=tn.ttn_id and tn.dep_dep_id_to=de.dep_id(+)';
txx:=txx+' and tn.uzak_uzak_id=z.nn(+) and z.zak not like (''%%(ÌÑ×)'')';
txx:=txx+' and z.id_project=pr.project_id and pr.project_id='+edit1.text;
txx:=txx+' and not exists ( select * from tronix_ttn tz where tz.zamen_nar = tn.ttn_id)';
txx:=txx+' ) t';
txx:=txx+' group by t.zavn,t.denomer';

txx:=txx+' ) tt';
txx:=txx+' group by tt.zavn,tt.denomer';

txx:=txx+' )l'
;
//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zavn').DisplayLAbel:='ÇÀÂ.ÍÎÌÅÐ ';
        FieldByName('denomer').DisplayLAbel:='ÖÅÕ ';
        FieldByName('tktrud').DisplayLAbel:='ÒÐ-ÒÜ ÍÎÐÌ. ';
        FieldByName('trudz').DisplayLAbel:='ÒÐ-ÒÜ ÇÀÊÐÛÒÛÕ ÍÀÐßÄÎÂ ';
        FieldByName('osttrud').DisplayLAbel:='ÎÑÒÀÒÊÈ ÒÐ-ÒÈ';
        FieldByName('trudnz').DisplayLAbel:='ÒÐ-ÒÜ ÍÅÇÀÊÐÛÒÛÕ ÍÀÐßÄÎÂ';
        FieldByName('iddenomer').DisplayLAbel:='iddenomer';
     end;

   OraQuery1.SQL.Text:=txx;

  OraQuery1.ExecSQL;

end;


procedure TFOstatok_Trud_Pue_No_Msch.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFOstatok_Trud_Pue_No_Msch.Button1Click(Sender: TObject);
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

procedure TFOstatok_Trud_Pue_No_Msch.DBGridEh1DblClick(Sender: TObject);
begin
  FOstatok_Trud_Pue_No_Msch.edit2.Text:=oraQuery1.FieldByName('iddenomer').asString;
  Application.CreateForm(TFOstatok_Trud_Pue_No_Msch_Cex, FOstatok_Trud_Pue_No_Msch_Cex);
  FOstatok_Trud_Pue_No_Msch_Cex.Edit1.Text:=FOstatok_Trud_Pue_No_Msch.Edit1.Text;
  FOstatok_Trud_Pue_No_Msch_Cex.Edit2.Text:=FOstatok_Trud_Pue_No_Msch.Edit2.Text;
  FOstatok_Trud_Pue_No_Msch_Cex.Edit3.Text:=FOstatok_Trud_Pue_No_Msch.Edit3.Text;
  FOstatok_Trud_Pue_No_Msch_Cex.Caption:='Îñòàòêè òðóäî¸ìêîñòè ïî ÌÑ×: '+Form9.oraQuery1.FieldByName('name').asString;
  FOstatok_Trud_Pue_No_Msch_Cex.Caption:=FOstatok_Trud_Pue_No_Msch_Cex.Caption+'  ÖÅÕ='+oraQuery1.FieldByName('denomer').asString;
  FOstatok_Trud_Pue_No_Msch_Cex.Caption:=FOstatok_Trud_Pue_No_Msch_Cex.Caption+'  ÒÐ-ÒÜ ÂÑÅÃÎ='+oraQuery1.FieldByName('tktrud').asString;
  FOstatok_Trud_Pue_No_Msch_Cex.Caption:=FOstatok_Trud_Pue_No_Msch_Cex.Caption+'  ÇÀÊÐÛÒÎ='+oraQuery1.FieldByName('trudz').asString;
  FOstatok_Trud_Pue_No_Msch_Cex.Caption:=FOstatok_Trud_Pue_No_Msch_Cex.Caption+'  ÎÑÒÀÒÎÊ='+oraQuery1.FieldByName('osttrud').asString;
  FOstatok_Trud_Pue_No_Msch_Cex.ShowModal();
  FOstatok_Trud_Pue_No_Msch_Cex.Free;
end;

procedure TFOstatok_Trud_Pue_No_Msch.DBGridEh1DrawColumnCell(Sender: TObject;
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
