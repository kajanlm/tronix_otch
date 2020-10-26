unit Sum_trud_vidnorm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, MemDS, Grids, DBGridEh, StdCtrls, ExcelXP,DBGridEhImpExp,
  OleServer, GridsEh, ExtCtrls, ComCtrls,ComObj;

type
  TFSum_trud_vidnorm = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    OraQuery1zavn: TStringField;
    OraQuery1zak: TStringField;
    OraQuery1proekt: TStringField;
    OraQuery1vidnorm: TFloatField;
    OraQuery1trud: TFloatField;
    OraQuery2: TOraQuery;
    OraDataSource2: TOraDataSource;
    OraQuery2zavn: TStringField;
    OraQuery2proekt: TStringField;
    OraQuery2idpr: TIntegerField;
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    Edit3: TEdit;
    DBGridEh1: TDBGridEh;
    DBGridEh2: TDBGridEh;
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
  FSum_trud_vidnorm: TFSum_trud_vidnorm;
  MyBookmark: TBookMark;
implementation

uses Unit9;


{$R *.dfm}

procedure TFSum_trud_vidnorm.FormShow(Sender: TObject);
var tx: string;
begin

tx:=' ';
tx:=tx+'select ''0'' as CHK_FLD, pr.zavn as zavn,pr.name as proekt,pr.project_id as idpr';
tx:=tx+' from tronix.project_list pr';
// where pr.date_end is null';
tx:=tx+' order by pr.zavn';
//ShowMEssage(tx);
   OraQuery2.Close;
  With OraQuery2 Do
     begin
        FieldByName('chk_fld').DisplayLAbel:='Œ“Ã≈“ ¿';
        FieldByName('zavn').DisplayLAbel:='«‡‚.π';
        FieldByName('proekt').DisplayLAbel:='œÓÂÍÚ';
        FieldByName('idpr').DisplayLAbel:='idpr';
    end;

   OraQuery2.SQL.Text:=tx;

  OraQuery2.ExecSQL;

end;

procedure TFSum_trud_vidnorm.Button2Click(Sender: TObject);
var idpro,txx: string;
begin
idpro:='';

OraQuery2.Open;
DBGrideh2.DataSource.DataSet.DisableControls;
oraQuery2.First;
while not OraQuery2.eof do
Begin
if OraQuery2.FieldByName('CHK_FLD').asString='1' then
begin
MyBookMark:= DBGrideh2.DataSource.DataSet.GetBookmark;
if idpro='' then
idpro:=''''+OraQuery2.FieldByName('idpr').asString+''''
else
idpro:=idpro+','''+OraQuery2.FieldByName('idpr').asString+'''';
end;
oraQuery2.Next;
end;
//idpro:='346,494';
//ShowMEssage(idpro);
if idpro='' then
ShowMessage('¬ÌËÏ‡ÌËÂ! ÕÂÓ·ıÓ‰ËÏÓ ‚˚·‡Ú¸ ÔÓÂÍÚ˚')
else
begin
OraQuery1.Close;

txx:=' ';
txx:='select t.zavn as zavn, t.zak as zak,t.proekt as proekt, t.vdd  as vidnorm,sum(t.vd) as trud';
txx:=txx+' from(';
txx:=txx+' select zk.zak zak,pr.zavn zavn, pr.name proekt, decode(vid_norm_vid_norm_id,2,2,5) vdd,tv.time vd';
txx:=txx+' from tronix.project_list pr,nordsy.tex_kvalif tv,nordsy.texkompl tx,feb_zakaz zk';
txx:=txx+' where tv.texkompl_texkompl_id=tx.texkompl_id(+)';
txx:=txx+' and tx.project_project_id=pr.project_id(+)';
txx:=txx+' and pr.project_id in ('+idpro;
txx:=txx+' ) and zk.id_project=tx.project_project_id';
txx:=txx+' and nordsy.uzak_tx(tx.texkompl_id)=zk.nn';
// and upper(zk.zak) not like (''%%(Ã—◊)'')';
txx:=txx+' and tx.TYPE_TEX_TYPE_TEX_ID in (7,8,12,14)';
txx:=txx+' and vid_norm_vid_norm_id is not null';
//txx:=txx+' and pr.date_end is null';
txx:=txx+') t';
txx:=txx+' group by t.zavn,t.zak,t.proekt,t.vdd';
//ShowMEssage(txx);
  With OraQuery1 Do
     begin
        FieldByName('zavn').DisplayLAbel:='«¿¬.π ';
        FieldByName('zak').DisplayLAbel:='«¿ ¿«';
        FieldByName('proekt').DisplayLAbel:='œ–Œ≈ “ ';
        FieldByName('vidnorm').DisplayLAbel:='¬»ƒ ÕŒ–Ã ';
        FieldByName('trud').DisplayLAbel:='“–-“‹ ';
     end;

   OraQuery1.SQL.Text:=txx;

  OraQuery1.ExecSQL;
  end;
DBGridEh2.DataSource.DataSet.EnableControls;
if idpro='' then
DBGrideh2.DataSource.DataSet.First
else
DBGrideh2.DataSource.DataSet.GotoBookmark(MyBookMark)
end;

procedure TFSum_trud_vidnorm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
end;

procedure TFSum_trud_vidnorm.Button1Click(Sender: TObject);
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