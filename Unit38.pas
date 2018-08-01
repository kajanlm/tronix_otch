unit Unit38;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, DBAccess, Ora, MemDS, ActiveX,ComObj,
  StdCtrls, OleServer, ExcelXP;

type
  TForm38 = class(TForm)
    OraQuery1: TOraQuery;
    OraDataSource1: TOraDataSource;
    DBGridEh1: TDBGridEh;
    Button1: TButton;
    ExcelApplication1: TExcelApplication;
    OraQuery2: TOraQuery;
    Label1: TLabel;
    Label2: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure OraQuery1CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    function Install (AValue:String): boolean;
    function Run(AValue:String; var ADest:Variant):boolean;
  public
    { Public declarations }
  end;

var
  Form38: TForm38;
  a, index:Integer;
  FExcel,Sheet,Colum:Variant;

implementation

uses Unit10, Unit9;

{$R *.dfm}

procedure TForm38.FormShow(Sender: TObject);
begin
if not Install('Excel.Application') then
Application.MessageBox(PChar('Для корректной работы программы необходимо'+ 'иметь установленное приложение Microsoft Excel'#13#10), 'Ошибка', MB_ICONERROR);
Button1.Visible:=false;
if  cOPy(Caption,1,37)='Ведомость комплектации по помещениям '  then
   begin
Button1.Visible:=true;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[0].FieldName:='NAME';
DBGridEh1.Columns[0].ButtonStyle:=cbsNone;
DBGridEh1.Columns[0].Title.Caption:='Чертеж';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[1].FieldName:='SPKOD';
DBGridEh1.Columns[1].ButtonStyle:=cbsNone;
DBGridEh1.Columns[1].Title.Caption:='Код';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[2].FieldName:='spname';
DBGridEh1.Columns[2].ButtonStyle:=cbsNone;
DBGridEh1.Columns[2].Title.Caption:='Наименование';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[3].FieldName:='Kol';
DBGridEh1.Columns[3].ButtonStyle:=cbsNone;
DBGridEh1.Columns[3].Title.Caption:='Кол';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[4].FieldName:='TK';
DBGridEh1.Columns[4].ButtonStyle:=cbsNone;
DBGridEh1.Columns[4].Title.Caption:='ПУЕ';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[5].FieldName:='text';
DBGridEh1.Columns[5].ButtonStyle:=cbsNone;
DBGridEh1.Columns[5].Title.Caption:='Место';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[6].FieldName:='ROOM';
DBGridEh1.Columns[6].ButtonStyle:=cbsNone;
DBGridEh1.Columns[6].Title.Caption:='ПОМЕЩЕНИЕ';
//ShowMessage(OraQuery1.SQL.Text);
 end;
if  cOPy(Caption,1,37)='Проверка документов на согласовании к'  then
begin
  DBGridEh1.Columns.Add;
DBGridEh1.Columns[0].FieldName:='doc';
DBGridEh1.Columns[0].ButtonStyle:=cbsNone;
DBGridEh1.Columns[0].Title.Caption:='Документ';
DBGridEh1.Columns[0].Width:=130;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[1].FieldName:='poz';
DBGridEh1.Columns[1].ButtonStyle:=cbsNone;
DBGridEh1.Columns[1].Title.Caption:='Позиция';
DBGridEh1.Columns[1].Width:=25;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[2].FieldName:='obozn';
DBGridEh1.Columns[2].ButtonStyle:=cbsNone;
DBGridEh1.Columns[2].Width:=130;
DBGridEh1.Columns[2].Title.Caption:='Обозначение';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[3].FieldName:='name';
DBGridEh1.Columns[3].ButtonStyle:=cbsNone;
DBGridEh1.Columns[3].Title.Caption:='Наименование';
DBGridEh1.Columns[3].Width:=300;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[4].FieldName:='kol_vo';
DBGridEh1.Columns[4].ButtonStyle:=cbsNone;
DBGridEh1.Columns[4].Title.Caption:='Кол.';
DBGridEh1.Columns[4].Width:=25;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[5].FieldName:='kod_ed';
DBGridEh1.Columns[5].ButtonStyle:=cbsNone;
DBGridEh1.Columns[5].Title.Caption:='Ед.Изм.';
DBGridEh1.Columns[5].Width:=70;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[6].FieldName:='kod_vedomstva';
DBGridEh1.Columns[6].ButtonStyle:=cbsNone;
DBGridEh1.Columns[6].Title.Caption:='Код Ведомости';
DBGridEh1.Columns[6].Width:=50;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[7].FieldName:='pr';
DBGridEh1.Columns[7].ButtonStyle:=cbsNone;
DBGridEh1.Columns[7].Title.Caption:='Примечание';
DBGridEh1.Columns[7].Width:=150;
Button1.Visible:=false;
end;


 if  cOPy(Caption,1,57)='Потребность по материалам и оборудованию общая по проекту'  then
begin
Button1.Visible:=true;
With TStringField.Create(OraQuery1) do
  begin
     FieldName:='DOKI';
    DataSet:=OraQuery1;
     FieldKind:=fkCalculated;
     Size:=5600;
     Alignment:=taLeftJustify;
     Visible:=True;
    end;
OraQuery1.OnCalcFields:= OraQuery1CalcFields;
     With TFloatField.Create(OraQuery1) do
     begin
    FieldName:='psprav';
    DataSet:=OraQuery1;
    FieldKind:=fkDAta;
   Alignment:=taLeftJustify;
    Visible:=false;
   end;

 With TStringField.Create(OraQuery1) do
   begin
     FieldName:='kod';
     DataSet:=OraQuery1;
     FieldKind:=fkDAta;
     Size:=800;
     Alignment:=taLeftJustify;
     Visible:=True;
end;
 With TStringField.Create(OraQuery1) do
   begin
     FieldName:='name';
     DataSet:=OraQuery1;
     FieldKind:=fkDAta;
     Size:=800;
     Alignment:=taLeftJustify;
     Visible:=True;
 end;
 With TFloatField.Create(OraQuery1) do
  begin
   FieldName:='suma_potr';
   DataSet:=OraQuery1;
    FieldKind:=fkDAta;
   //  DataType := ftFloat;
//  OraQuery1.FieldDefs.Add('ftfloat',0);
//   OraQuery1.FieldDefs.Add('suma_potr', ftfloat);
 //   Size:=50;
    Alignment:=taLeftJustify;
    Visible:=True;
  end;
  With TStringField.Create(OraQuery1) do
 begin
    FieldName:='ed1';
    DataSet:=OraQuery1;
    FieldKind:=fkDAta;
     Size:=25;
     Alignment:=taCenter;
     Visible:=True;
end;
     With TFloatField.Create(OraQuery1) do
     begin
    FieldName:='vidano';
    DataSet:=OraQuery1;
    FieldKind:=fkDAta;
   Alignment:=taLeftJustify;
    Visible:=True;
   end;

    With TFloatField.Create(OraQuery1) do
     begin
     FieldName:='def';
     DataSet:=OraQuery1;
     FieldKind:=fkDAta;
     Alignment:=taLeftJustify;
    Visible:=True;
  end;


DBGridEh1.Columns.Add;
DBGridEh1.Columns[0].FieldName:='kod';
DBGridEh1.Columns[0].ButtonStyle:=cbsNone;
DBGridEh1.Columns[0].Title.Caption:='Код';
DBGridEh1.Columns[0].Width:=100;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[1].FieldName:='name';
DBGridEh1.Columns[1].ButtonStyle:=cbsNone;
DBGridEh1.Columns[1].Title.Caption:='Наименование';
DBGridEh1.Columns[1].Width:=300;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[2].FieldName:='suma_potr';
DBGridEh1.Columns[2].ButtonStyle:=cbsNone;
DBGridEh1.Columns[2].Width:=50;
DBGridEh1.Columns[2].Title.Caption:='Потребность';
DBGridEh1.Columns.Add;
DBGridEh1.Columns[3].FieldName:='ed1';
DBGridEh1.Columns[3].ButtonStyle:=cbsNone;
DBGridEh1.Columns[3].Title.Caption:='ед.';
DBGridEh1.Columns[3].Width:=25;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[4].FieldName:='vidano';
DBGridEh1.Columns[4].ButtonStyle:=cbsNone;
DBGridEh1.Columns[4].Title.Caption:='Выдано';
DBGridEh1.Columns[4].Width:=50;
DBGridEh1.Columns.Add;
DBGridEh1.Columns[5].FieldName:='def';
DBGridEh1.Columns[5].ButtonStyle:=cbsNone;
DBGridEh1.Columns[5].Title.Caption:='Остаток';
DBGridEh1.Columns[5].Width:=70;

DBGridEh1.Columns.Add;
DBGridEh1.Columns[6].FieldName:='DOKI';
DBGridEh1.Columns[6].ButtonStyle:=cbsNone;
DBGridEh1.Columns[6].Title.Caption:='Требования';
DBGridEh1.Columns[6].Width:=1600;
end;



OraQuery1.ExecSQL;
end;

procedure TForm38.FormClose(Sender: TObject; var Action: TCloseAction);
begin

 OraQuery1.Close;
   OraQuery1.FieldDefs.Clear;
  OraQuery1.Fields.Clear;

// OraQuery1.ClearFields;
// OraQuery1.DataSetField.Clear;
 Label1.Caption:='';
  Label2.Caption:='';
 DBGRIDEH1.Columns.Clear;
end;

function TForm38.Install(AValue: String): boolean;
var Z:TCLSID;
begin
Result:=(CLSIDFromProgID(PWChar(AValue),Z)=S_OK);
end;


function TForm38.Run(AValue: String; var ADest: Variant): boolean;
begin
try
ADest:=GetActiveOleObject(AValue);
Result:=true;
except
Result:=false;
end;

end;

procedure TForm38.Button1Click(Sender: TObject);
var tex,sh :integer;
UP:string;
Excel, WorkBook, SheetActive, Sheet : OleVariant;
begin
try

FExcel:=CreateOleObject('Excel.Application');
FExcel.EnableEvents := False;
OraQuery1.DisableControls;
FExcel.Visible:=false;
if  cOPy(Caption,1,37)='Ведомость комплектации по помещениям '  then
   begin
OraQuery1.First;sh:=0;DBGrideh1.DataSource.DataSet.First;
FExcel.Workbooks.Add(-4167);
While  DBGrideh1.DataSource.DataSet.EOF=false do
  begin
sh:=sh+1;
FExcel.Workbooks[1].WorkSheets.Add;

UP:=DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString;
 FExcel.DisplayAlerts := False;


FExcel.Workbooks[1].WorkSheets[1].Name:=DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString;;

Colum:=FExcel.Workbooks[1].WorkSheets[DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString].Columns;
Colum.Columns[1].ColumnWidth:=35;
Colum.Columns[2].ColumnWidth:=15;
Colum.Columns[3].ColumnWidth:=30;
Colum.Columns[4].ColumnWidth:=20;
Colum.Columns[7].ColumnWidth:=18;

Sheet:=FExcel.Workbooks[1].WorkSheets[DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString];

Sheet.Cells[1,1]:='                '+Caption+' по '+DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString;
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='Чертеж';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='Код';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Наименование';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='ПУЕ';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='Кол';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,6]:='Ед.Изм.';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;

Sheet.Cells[2,7]:='Место';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.range[Sheet.cells[2,1],Sheet.cells[2,7]].borders.weight:=3;

index:=3;



//for a := 0 to DBGrideh1.DataSource.Dataset.RecordCount -1 do
while (UP=DBGrideh1.DataSource.DataSet.FieldByName('ROOM').AsString) and (DBGrideh1.DataSource.DataSet.EOF=false) do

begin

Sheet.Cells[index,1]:=DBGrideh1.DataSource.DataSet.Fields[1].AsString;
Sheet.Cells[index,1].WrapText := true;
Sheet.Cells[index,2].NumberFormat:= '@';
Sheet.Cells[index,2]:=DBGrideh1.DataSource.DataSet.Fields[2].AsString;
Sheet.Cells[index,3]:=DBGrideh1.DataSource.DataSet.FieldByName('spname').AsString;
Sheet.Cells[index,3].WrapText := true;
Sheet.Cells[index,4]:=DBGrideh1.DataSource.DataSet.Fields[4].AsString;
Sheet.Cells[index,5]:=DBGrideh1.DataSource.DataSet.Fields[5].AsFloat;
Sheet.Cells[index,6]:=DBGrideh1.DataSource.DataSet.FieldByName('koded').AsString;
Sheet.Cells[index,7]:=DBGrideh1.DataSource.DataSet.FieldByName('text').AsString;
Sheet.Cells[index,7].WrapText := true;
inc(index);
DBGrideh1.DataSource.DataSet.Next;
end;
Sheet.range[Sheet.cells[3,1],Sheet.cells[index-1,7]].borders.weight:=2;


end; //end of 1
end; // end of Ведомость комплектации по помещениям

 if  cOPy(Caption,1,57)='Потребность по материалам и оборудованию общая по проекту'  then
begin
   OraQuery1.First;DBGrideh1.DataSource.DataSet.First;
FExcel.Workbooks.Add(-4167);
While  DBGrideh1.DataSource.DataSet.EOF=false do
  begin
FExcel.Workbooks[1].WorkSheets.Add;
FExcel.DisplayAlerts := False;
FExcel.Workbooks[1].WorkSheets[1].Name:='Отчет';
Colum:=FExcel.Workbooks[1].WorkSheets['Отчет'].Columns;
Colum.Columns[1].ColumnWidth:=10;
Colum.Columns[2].ColumnWidth:=75;
Colum.Columns[3].ColumnWidth:=15;
Colum.Columns[4].ColumnWidth:=5;
Colum.Columns[7].ColumnWidth:=30;

Sheet:=FExcel.Workbooks[1].WorkSheets[FExcel.Workbooks[1].WorkSheets[1].Name];

Sheet.Cells[1,1]:='                '+Caption;
Sheet.Cells[1,1].Font.Bold := True;
Sheet.Cells[1,1].Font.Size := Sheet.Cells[1,2].Font.Size+5;
Sheet.Cells[2,1]:='Код';
Sheet.Cells[2,1].Font.Bold := True;
Sheet.Cells[2,1].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,2]:='Наименование';
Sheet.Cells[2,2].Font.Bold := True;
Sheet.Cells[2,2].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,3]:='Потребность';
Sheet.Cells[2,3].Font.Bold := True;
Sheet.Cells[2,3].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,4]:='Ед.';
Sheet.Cells[2,4].Font.Bold := True;
Sheet.Cells[2,4].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,5]:='Выдано';
Sheet.Cells[2,5].Font.Bold := True;
Sheet.Cells[2,5].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,6]:='Остаток';
Sheet.Cells[2,6].Font.Bold := True;
Sheet.Cells[2,6].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.Cells[2,7]:='Требования';
Sheet.Cells[2,7].Font.Bold := True;
Sheet.Cells[2,7].Font.Size := Sheet.Cells[1,1].Font.Size-3;
Sheet.range[Sheet.cells[2,1],Sheet.cells[2,7]].borders.weight:=3;

index:=3;

while DBGrideh1.DataSource.DataSet.EOF=false do
  begin

Sheet.Cells[index,1]:=DBGrideh1.DataSource.DataSet.Fields[2].AsString;
Sheet.Cells[index,1].WrapText := true;
//Sheet.Cells[index,2].NumberFormat:= '@';
Sheet.Cells[index,2]:=DBGrideh1.DataSource.DataSet.Fields[3].AsString;
Sheet.Cells[index,3]:=DBGrideh1.DataSource.DataSet.Fields[4].AsFloat;
Sheet.Cells[index,3].WrapText := true;
Sheet.Cells[index,4]:=DBGrideh1.DataSource.DataSet.Fields[5].AsString;
Sheet.Cells[index,5]:=DBGrideh1.DataSource.DataSet.Fields[6].AsFloat;
Sheet.Cells[index,6]:=DBGrideh1.DataSource.DataSet.Fields[7].AsFloat;
Sheet.Cells[index,7]:=DBGrideh1.DataSource.DataSet.FieldByName('DOKI').AsString;
Sheet.Cells[index,7].WrapText := true;
inc(index);
DBGrideh1.DataSource.DataSet.Next;
end;
Sheet.range[Sheet.cells[3,1],Sheet.cells[index-1,7]].borders.weight:=2;
end;
end;


finally

if not VarIsEmpty(FExcel) then

begin

FExcel.DisplayAlerts:=false;
 FExcel.Visible:=true;
 OraQuery1.EnableControls;
//FExcel.Quit;
 Form38.Close;
 Form10.Close;
  Form9.Close;
FExcel:=Unassigned;
 OraQuery1.DisableControls;
end;

end;
end;

procedure TForm38.OraQuery1CalcFields(DataSet: TDataSet);
var tx,res:string;
begin
res:='';
tx:=' Select  ''Тр № ''||ttn.nomer||'' от ''|| ttn.date_dok||'' проведен ''||ttn.date_ins||'' кол- ''||tmat.kol_uchet||'' ''||';
tx:=tx+' (Select namek from tronix.koded where koded_id=tmat.koded_koded_id)  nomer';
tx:=tx+' from tronix.ttn ttn, tronix.ttn_mat tmat';
tx:=tx+' where ttn.ttn_id=tmat.ttn_ttn_id';
tx:=tx+' and tmat.sprav_sprav_id='+oraQuery1.FieldByName('psprav').asString;
tx:=tx+' and ttn.project_project_id='+Label1.Caption;
tx:=tx+' and ttn.dep_dep_id_to in  (Select dep_id from nordsy.dep where dep_dep_id='+Label2.Caption+' or dep_id='+Label2.Caption+' )';

//ShowMessage(tx);
 OraQuery2.SQL.Text:=tx;
 OraQuery2.ExecSQL;
 OraQuery2.First;
 While OraQuery2.Eof<>true DO
   begin
    res:=res+';'+oraQuery2.FieldByName('nomer').asString;
    OraQuery2.Next;
  end;
oraQuery1.FieldByName('DOKI').Value:=res;

OraQuery2.Close;
end;

end.
