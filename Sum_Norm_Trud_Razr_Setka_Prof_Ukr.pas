unit Sum_Norm_Trud_Razr_Setka_Prof_Ukr;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ComCtrls, ExtCtrls;

type
  TFSum_Norm_Trud_Razr_Setka_Prof_Ukr = class(TForm)
    DBGridEh1: TDBGridEh;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    Edit1: TEdit;
    Edit2: TEdit;
    OraQuery1zak: TStringField;
    OraQuery1cex: TStringField;
    OraQuery1ukr: TStringField;
    OraQuery1razrjd: TStringField;
    OraQuery1tars: TStringField;
    OraQuery1trudoem: TFloatField;
    OraQuery1kodprof: TStringField;
    OraQuery1prof: TStringField;
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
  FSum_Norm_Trud_Razr_Setka_Prof_Ukr: TFSum_Norm_Trud_Razr_Setka_Prof_Ukr;
implementation

uses Unit9;

{$R *.dfm}

procedure TFSum_Norm_Trud_Razr_Setka_Prof_Ukr.FormShow(Sender: TObject);
var tx:string;
begin
//Edit1.Text:='458';
//ShowMessage(Edit1.Text);
//Edit2.Text:='4011';
//ShowMessage(Edit2.Text);

tx:=' ';
tx:='select tt.zak zak,tt.cex cex,tt.ukr ukr, tt.razrjd razrjd,tt.tars tars,tt.trudoem trudoem,tt.kodprof kodprof,tt.prof prof';
tx:=tx+' from (';
tx:=tx+' select l.projectid projectid,l.zak zak,decode(substr(l.ukr,1,2),''œ–'',''œ–'',l.ukr) ukr,l.cex cex,';
tx:=tx+' l.kodprof kodprof,l.razrjd razrjd,l.tars tars,sum(l.kol) kol,sum(l.norm) trudoem,l.nprof prof';
tx:=tx+' from (';
tx:=tx+' select tx.project_project_id projectid, z.zak zak, tx.nomer nomer,tv.kol kol, tv.time norm, to_char(tv.razpjd,''9'') razrjd,';
tx:=tx+' (vr.kod||yr.kod) tars, kv.kod_prof kodprof,kv.name nprof, substr(dd.nomer,1,2) cex,';
tx:=tx+' (select nomer from nordsy.texkompl';
tx:=tx+' where type_tex_type_tex_id in (select type_tex_id from nordsy.type_tex where kod = ''” –'')';
tx:=tx+' and rownum <= 1';
tx:=tx+' connect by texkompl_id = prior texkompl_texkompl_id';
tx:=tx+' start with texkompl_id = tx.texkompl_id) ukr';

tx:=tx+' from nordsy.tex_kvalif tv,nordsy.kvalif kv,nordsy.texkompl tx,nordsy.texkompl tk,feb_zakaz z,tronix_project_list pr,';
tx:=tx+' nordsy.vid_rabot vr,nordsy.ysl_rabot yr,kadry_dep de,kadry_dep dd';

tx:=tx+' where tx.project_project_id=pr.project_id(+) and tv.texkompl_texkompl_id= tx.texkompl_id(+)';
tx:=tx+' and tv.kvalif_kvalif_id=kv.kvalif_id and vid_rabot_vid_rabot_id=vr.vid_rabot_id(+)';
tx:=tx+' and ysl_rabot_ysl_rabot_id=yr.ysl_rabot_id(+) and tv.time is not null';
tx:=tx+' and tx.dep_dep_id=de.dep_id(+) and dd.dep_id='+edit2.text+' and (de.dep_dep_id=dd.dep_id or de.nomer=dd.nomer)';
tx:=tx+' and pr.project_id=z.id_project and z.id_project='+edit1.text;
tx:=tx+' and nordsy.uzak_tx(tx.texkompl_id)=z.nn';
tx:=tx+' and nvl(nordsy.go_in_tk(tx.texkompl_texkompl_id,''œ”≈'',''TYPE''),tx.texkompl_texkompl_id)=tk.texkompl_id';
tx:=tx+' ) l';
tx:=tx+' group by l.projectid,l.zak,decode(substr(l.ukr,1,2),''œ–'',''œ–'',l.ukr),l.cex,l.kodprof,l.razrjd,l.tars,l.nprof';
tx:=tx+' ) tt';
tx:=tx+' order by tt.projectid,tt.zak,tt.cex,tt.ukr,tt.prof,tt.razrjd,tt.tars';


//ShowMEssage(tx);
  With OraQuery1 Do
     begin
        FieldByName('zak').DisplayLAbel:='«¿¬.π ';
        FieldByName('cex').DisplayLAbel:='÷≈’ ';
        FieldByName('ukr').DisplayLAbel:='” – ';
        FieldByName('razrjd').DisplayLAbel:='–¿«–ﬂƒ ';
        FieldByName('tars').DisplayLAbel:='“¿–.—≈“ ¿ ';
        FieldByName('trudoem').DisplayLAbel:='“–-“‹ ';
        FieldByName('kodprof').DisplayLAbel:=' Œƒ œ–Œ‘≈——»» ';
        FieldByName('prof').DisplayLAbel:='œ–Œ‘≈——»ﬂ ';
     end;

   OraQuery1.SQL.Text:=tx;

  OraQuery1.ExecSQL;

 end;

procedure TFSum_Norm_Trud_Razr_Setka_Prof_Ukr.FormClose(Sender: TObject; var Action: TCloseAction);
begin
     OraQuery1.Close;
end;

procedure TFSum_Norm_Trud_Razr_Setka_Prof_Ukr.Button1Click(Sender: TObject);
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

procedure TFSum_Norm_Trud_Razr_Setka_Prof_Ukr.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
    if (Column.FieldName='trudoem') and (Column.Field.Dataset.FieldByName('trudoem').AsFloat > 0) then
    TDBGridEh(Sender).Canvas.Font.Style:=[fsbold];

 TDBGridEh(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

end.
