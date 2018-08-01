unit Unit24;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, DB, DBAccess, Ora, MemDS, ExcelXP,
  OleServer,DBGridEhImpExp;

type
  TForm24 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelWorkbook1: TExcelWorkbook;
    SaveDialog1: TSaveDialog;
    OraQuery1nomer: TStringField;
    OraQuery1kod: TStringField;
    OraQuery1name: TStringField;
    OraQuery1project: TStringField;
    OraQuery1tk: TFloatField;
    OraQuery1PUT: TStringField;
    OraQuery2: TOraQuery;
    OraQuery1FIO: TStringField;
    OraQuery1DAT: TDateTimeField;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

procedure TForm24.FormShow(Sender: TObject);
begin
//ShowMessage(OraQuery1.SQL.Text);
OraQuery1.ExecSQL;
end;

procedure TForm24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 OraQuery1.Close;
  OraQuery2.Close;
end;

procedure TForm24.Button1Click(Sender: TObject);
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

procedure TForm24.OraQuery1CalcFields(DataSet: TDataSet);
var tx:String;
begin
tx:=' Select PATH from ( ';
tx:=tx+' SELECT SYS_CONNECT_BY_PATH(nomer, ''|'') AS PATH, texkompl_texkompl_id ';
tx:=tx+' FROM tx_texkompl ';
tx:=tx+' START WITH texkompl_id= '+OraQuery1.FieldByName('tk').AsString;
tx:=tx+' CONNECT BY prior texkompl_texkompl_id = texkompl_ID ) ';
tx:=tx+' where texkompl_texkompl_id is null   ';
 OraQuery2.SQL.Text:=tx;
 OraQuery2.ExecSQL;
 OraQuery1.FieldByName('PUT').Value:=  OraQuery2.FieldByName('path').AsString;
end;

end.
