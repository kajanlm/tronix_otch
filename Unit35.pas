unit Unit35;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS,DBGridEhImpExp,
  ExcelXP, OleServer;

type
  TForm35 = class(TForm)
    Edit1: TEdit;
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    OraQuery1name: TStringField;
    OraQuery1sprname: TStringField;
    OraQuery1nomer_tk: TStringField;
    OraQuery1sprkod: TStringField;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    ExcelWorkbook1: TExcelWorkbook;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication1: TExcelApplication;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form35: TForm35;

implementation

{$R *.dfm}

procedure TForm35.FormShow(Sender: TObject);
var tx: string;
begin

tx:=' Select name,sprkod,sprname,nomer_tk';
tx:=tx+' from ';
tx:=tx+' ( ';
tx:=tx+' Select ';
tx:=tx+' potr.texkompl_texkompl_id texkompl,do.ident||'' ''||''поз (''||sp.poz||'')  ''||sp.podpoz||'' ''||sp.name as name, sp.nn spnn, sp.kod spkod, ';
tx:=tx+' (Select nomer from tx_texkompl where texkompl_id=potr.texkompl_texkompl_id) nomer_tk, ';
tx:=tx+' spr.name sprname, spr.kod sprkod, ';
tx:=tx+' (Select name from tronix.sprav where sprav_id=potr.sprav_sprav_id) spavname ';
tx:=tx+' from tx_car_potr potr, tronix.sprav spr , tronix.sp sp, tronix.document do ';
tx:=tx+' where spr.sprav_id=potr.sprav_sprav_id ';
tx:=tx+'  and  spr.home =0 ';
tx:=tx+'  and sp.nn(+)= potr.sp_id_for ';
tx:=tx+'  and sp.nnn=do.document_id(+) ';
tx:=tx+' and do.document_id in ';
tx:=tx+' (Select document_id from tronix.document where id_project='+Edit1.Text+' )) ';
tx:=tx+' group by name,sprname,sprkod,nomer_tk,spavname ';
tx:=tx+' order by name ';

 OraQuery1.SQL.Text:=tx;
 OraQuery1.ExecSQL;
end;

procedure TForm35.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.Close;
  Edit1.Text:='';
end;

procedure TForm35.Button1Click(Sender: TObject);
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
