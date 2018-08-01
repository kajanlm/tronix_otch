unit Unit25;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS,DBGridEhImpExp,
  ExcelXP, OleServer;

type
  TForm25 = class(TForm)
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery2: TOraQuery;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    OraQuery1texkompl: TFloatField;
    OraQuery1nomer: TStringField;
    OraQuery1name1: TStringField;
    OraQuery1razlov1: TStringField;
    OraQuery1kod1: TStringField;
    OraQuery1kol1: TFloatField;
    OraQuery1vid1: TStringField;
    OraQuery1name2: TStringField;
    OraQuery1razlov2: TStringField;
    OraQuery1kod2: TStringField;
    OraQuery1kol2: TFloatField;
    OraQuery1vid2: TStringField;
    OraQuery1certezh2: TStringField;
    OraQuery1TH: TStringField;
    procedure FormShow(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

procedure TForm25.FormShow(Sender: TObject);
var tx:String;
begin

tx:=' Select a1.texkompl texkompl, a1.nomer nomer, a1.name name1,a1.razlov razlov1,a1.kod kod1,a1.kol kol1, a1.vid vid1, ';
tx:=tx+'  a2.name name2,a2.razlov razlov2,a2.kod kod2, a2.kol kol2, a2.vid vid2, a2.certezh certezh2 ';
tx:=tx+' from ';
tx:=tx+' (Select texkompl,nomer,name,razlov,kod,kol,decode(pr,1,''Материал'',''Изделиё'') vid, certezh ';
tx:=tx+'  from ';
tx:=tx+' (Select tx.texkompl_id texkompl,tx.nomer, ';
tx:=tx+'  sprav.Name name, (Select name from  tronix.raz_lov where raz_lov_id=raz_lov_raz_lov_id ) razlov, ';
tx:=tx+' sprav.kod kod, ';
tx:=tx+' tmat.kol kol,tronix_select_mat(sprav.tree_tree_id, ''01'' ) pr, ';
tx:=tx+' (Select name from tronix.typ_lov where typ_lov_id=sprav.typ_lov_typ_lov_id) certezh ';
tx:=tx+' from tx_texkompl  tx, nordsy.tx_mat tmat, tronix.sprav sprav ';
tx:=tx+' where  tx.project_project_id='+Edit1.Text;
tx:=tx+' and tx.type_tex_type_tex_id=14   ';
tx:=tx+' and tx.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id=4009 or dep_id=4009) ';
tx:=tx+' and tmat.tex_texkompl_id=tx.texkompl_id ';
tx:=tx+' and sprav.sprav_id=tmat.sprav_sprav_id) ';
tx:=tx+' where pr=1) a1, ';
tx:=tx+' (Select texkompl,nomer,name,razlov,kod,kol,decode(pr,1,''Материал'',''Изделиё'') vid, certezh ';
tx:=tx+'  from ';
tx:=tx+' (Select tx.texkompl_id texkompl,tx.nomer, ';
tx:=tx+'  sprav.Name name, (Select name from  tronix.raz_lov where raz_lov_id=raz_lov_raz_lov_id ) razlov, ';
tx:=tx+' sprav.kod kod, ';
tx:=tx+' tmat.kol kol,tronix_select_mat(sprav.tree_tree_id, ''01'' ) pr, ';
tx:=tx+' (Select name from tronix.typ_lov where typ_lov_id=sprav.typ_lov_typ_lov_id) certezh ';
tx:=tx+' from tx_texkompl  tx, nordsy.tx_mat tmat, tronix.sprav sprav ';
tx:=tx+' where  tx.project_project_id='+Edit1.Text;
tx:=tx+' and tx.type_tex_type_tex_id=14 ';
tx:=tx+' and tx.dep_dep_id in (Select dep_id from nordsy.dep where dep_dep_id=4009 or dep_id=4009) ';
tx:=tx+' and tmat.tex_texkompl_id=tx.texkompl_id ';
tx:=tx+' and sprav.sprav_id=tmat.sprav_sprav_id) ';
tx:=tx+' where pr<>1) a2 ';
tx:=tx+' where a1.texkompl=a2.texkompl ';

  OraQuery1.SQL.Text:=tx;
  OraQuery1.ExecSQL;
end;

procedure TForm25.OraQuery1CalcFields(DataSet: TDataSet);
var tx: string;
begin

tx:=' (Select PATH||''''||decode(otk_end,null,'''','' закрыта ''||otk_end) path  from ( ';
tx:=tx+' SELECT nomer AS PATH ,texkompl_id , texkompl_texkompl_id,type_tex_type_tex_id, otk_end ';
tx:=tx+' FROM tx_texkompl                                                                       ';
tx:=tx+' START WITH texkompl_id='+OraQuery1.FieldByName('texkompl').AsString;
tx:=tx+' CONNECT BY prior texkompl_texkompl_id = texkompl_id )                                  ';
tx:=tx+' where type_tex_type_tex_id = 8)                                                        ';
   OraQuery2.SQL.Text:=tx;
  OraQuery2.ExecSQL;
  OraQuery1.FieldByName('TH').Value:=  OraQuery2.FieldByName('path').AsString;
end;

procedure TForm25.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OraQuery2.Close;
  OraQuery1.Close;
end;

procedure TForm25.Button1Click(Sender: TObject);
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
