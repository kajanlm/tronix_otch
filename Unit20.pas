unit Unit20;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls ,ExcelXP,DBGridEhImpExp,OleServer;


type
  TForm20 = class(TForm)
    OraDataSource1: TOraDataSource;
    OraQuery1: TOraQuery;
    DBGridEh1: TDBGridEh;
    Edit1: TEdit;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

procedure TForm20.FormShow(Sender: TObject);
var tx:string;
begin
tx:='Select cex, nomer, data_dok,kod,name,kol,ed,omto,na_zak,na_zavod,usx_data ';
tx:=tx+'from (                                                                 ';
tx:=tx+'  Select (Select name from nordsy.dep where t.Dep_dep_id_to=dep_id) cex, ';
tx:=tx+'t.nomer nomer,                                                           ';
tx:=tx+'t.user_date1 data_dok,                                                     ';
tx:=tx+'(Select kod from tronix.sprav where sprav_id=tmat.sprav_sprav_id) kod,   ';
tx:=tx+'(Select name from tronix.sprav where sprav_id=tmat.sprav_sprav_id) name, ';
tx:=tx+'tmat.kol kol,                                                             ';
tx:=tx+'(Select namek from tronix.koded where koded_id=tmat.koded_koded_id) ed,   ';
tx:=tx+'t.user_date2 omto,                                                         ';
tx:=tx+'(Select    round(sum(nvl(kol_uchet,0)*nvl(tronix_kof_koded(sprav_sprav_ID,koded_koded_id_uchet,(Select koded_KODED_ID from tronix.sprav where sprav_id=sprav_sprav_ID)),0)),3)';
tx:=tx+' from tronix.zapas                                                                                                                                                            ';
tx:=tx+'where sprav_sprav_id=tmat.sprav_sprav_id                                                                                                                                      ';
tx:=tx+'and project_project_id=230                                                                                                                                                    ';
tx:=tx+'and dep_dep_id in (Select dep_id from nordsy.dep where type_dep_type_dep_id=5)) na_zak,                                                                                       ';
tx:=tx+'(Select round(sum(nvl(kol_uchet,0)*nvl(tronix_kof_koded(sprav_sprav_ID,koded_koded_id_uchet,(Select koded_KODED_ID from tronix.sprav where sprav_id=sprav_sprav_ID)),0)),3)   ';
tx:=tx+' from tronix.zapas where sprav_sprav_id=tmat.sprav_sprav_id ';
tx:=tx+'and project_project_id is null) na_zavod,                   ';
tx:=tx+'t.user_date3 usx_data                                       ';
tx:=tx+' from tronix.ttn_mat tmat,                                   ';
tx:=tx+'(Select nomer,Dep_dep_id_to,user_date1,user_date2,user_date3,ttn_id from tronix.ttn ';
tx:=tx+'where project_project_id='+EDIT1.text;
tx:=tx+'and type_ttn_type_ttn_id=44) t                                                    ';
tx:=tx+'where t.ttn_id=tmat.ttn_ttn_id                                                    ';
tx:=tx+')                                                                                   ';
  oraQuery1.SQL.Text:=tx;
 oraQuery1.ExecSQL;
end;




procedure TForm20.Button1Click(Sender: TObject);
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
