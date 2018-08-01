unit Unit33;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora,
   MemDS, StdCtrls,ExcelXP, OleServer,ComObj,ComCtrls;

type
  TForm33 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    ExcelWorksheet1: TExcelWorksheet;
    ExcelApplication1: TExcelApplication;
    ExcelWorkbook1: TExcelWorkbook;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

uses Unit30, Unit36;

{$R *.dfm}

procedure TForm33.FormShow(Sender: TObject);
begin
OraQuery1.ExecSQL;
end;

procedure TForm33.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  OraQuery1.SQL.Clear;
  OraQuery1.Close;
end;

procedure TForm33.DBGridEh1DblClick(Sender: TObject);
begin

 form30.Caption:='Выберите ТН';
  Form30.Edit1.Text:=oraQuery1.FieldByName('sprav_id').asString;
  Form30.Edit2.Text:=Form36.Edit1.text;
  form30.ShowModal();
end;

procedure TForm33.Button1Click(Sender: TObject);
var Excel, WorkBook, SheetActive, Sheet : OleVariant;
index:integer;
begin
index:=3;
try
  FExcel := CreateOleObject ('Excel.Application');
except
  MessageDlg('Не могу загрузить Microsoft Excel', mtError, [mbOK], 0);
  Exit;
end;
FExcel.EnableEvents := False;
DBGrideh1.DataSource.DataSet.DisableControls;
FExcel.Visible:=false;
OraQuery1.First;DBGrideh1.DataSource.DataSet.First;
FExcel.Workbooks.Add(-4167);

FExcel.Workbooks[1].WorkSheets[1].Name:='МСЧ';
index:=3;
Colum:=FExcel.Workbooks[1].WorkSheets['МСЧ'].Columns;
Colum.Columns[1].ColumnWidth:=120;
Colum.Columns[2].ColumnWidth:=50;
Colum.Columns[3].ColumnWidth:=50;
Colum.Columns[4].ColumnWidth:=10;
Colum.Columns[5].ColumnWidth:=5;
Colum.Columns[6].ColumnWidth:=5;
Colum.Columns[7].ColumnWidth:=5;
Colum.Columns[8].ColumnWidth:=10;


Sheet:=FExcel.Workbooks[1].WorkSheets['МСЧ'];

Sheet.Cells[1,1]:='                '+Caption+' на '+datetoStr(now());
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='Четреж позиция';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='Наименование';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Код';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='Потребность';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='Завод';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,6]:='Цех';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,7]:='Выдано';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,8]:='ТН';
Sheet.Cells[2,8].Font.Bold := True;
Sheet.Cells[2,8].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.range[Sheet.cells[2,1],Sheet.cells[2,8]].borders.weight:=3;
DBGrideh1.DataSource.DataSet.DisableControls;
DBGrideh1.DataSource.DataSet.First;

While  DBGrideh1.DataSource.DataSet.EOF=false do
  begin
 Sheet.Cells[index,1]:=DBGrideh1.DataSource.DataSet.Fields[0].AsString;
 Sheet.Cells[index,2]:=DBGrideh1.DataSource.DataSet.Fields[1].AsString;
 Sheet.Cells[index,3]:=DBGrideh1.DataSource.DataSet.Fields[2].AsString;
 Sheet.Cells[index,4]:=DBGrideh1.DataSource.DataSet.Fields[3].AsString;
 Sheet.Cells[index,5]:=DBGrideh1.DataSource.DataSet.Fields[4].AsString;
 Sheet.Cells[index,6]:=DBGrideh1.DataSource.DataSet.Fields[5].AsString;
 Sheet.Cells[index,7]:=DBGrideh1.DataSource.DataSet.Fields[6].AsString;
 Sheet.Cells[index,8]:=DBGrideh1.DataSource.DataSet.Fields[10].AsString;
 inc(index);  DBGrideh1.DataSource.DataSet.Next;
 end;

 DBGrideh1.DataSource.DataSet.EnableControls;
 FExcel.Visible:=true;
FExcel := UnAssigned;

end;

end.
 