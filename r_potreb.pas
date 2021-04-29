unit r_potreb;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, DBAccess, Ora, MemDS, GridsEh, DBGridEh, clipbrd, OleServer, ComObj, ExcelXP;

type
  Tpotreb = class(TForm)
    clear: TButton;
    needZak: TListBox;
    grid: TDBGridEh;
    Query: TOraQuery;
    DataSource: TOraDataSource;
    report: TButton;
    invi_needZak: TComboBox;
    header: TLabel;
    invi_zakList: TComboBox;
    zakList: TListBox;
    procedure FormShow(Sender: TObject);
    procedure gridDblClick(Sender: TObject);
    procedure clearClick(Sender: TObject);
    procedure reportClick(Sender: TObject);
    procedure zakListClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  potreb: Tpotreb;

implementation

{$R *.dfm}

uses Unit1, Unit9;

procedure Tpotreb.FormShow(Sender: TObject);
var
SQL : string;
begin
  SQL := 'select zavn as project, name, project_id from tronix.project_list where date_end is null order by zavn asc';
  form1.execQuery(Query, SQL, false);


end;

procedure Tpotreb.gridDblClick(Sender: TObject);
var
OQ : TOraQuery;
SQL : string;
begin
  if Query.FieldByName('PROJECT').asString = '' then
    exit;

  OQ := TOraQuery.Create(nil);
  OQ.ReadOnly := true;
  OQ.FetchAll := true;
  OQ.Session := Form1.OraSession1;

  SQL := 'Select zak.zak, feb.text as name, zak.nn as id from tronix.feb_name feb, tronix.zakaz zak '
  + 'where zak.id_project = ' + Query.FieldByName('PROJECT_ID').asString + ' and zak.name = feb.nn order by zak.zak desc';
  //showMessage(SQL);
  //exit;
  form1.execQuery(OQ, SQL, false);

  zakList.Clear;
  invi_zakList.Clear;
  while not OQ.Eof do
  begin
    zakList.Items.Add(OQ.FieldByName('zak').asString + ' ' + OQ.FieldByName('name').asString);
    invi_zakList.Items.Add(OQ.FieldByName('ID').asString);
    OQ.Next;
  end;

  OQ.Close;
  OQ.Free;
end;

procedure Tpotreb.clearClick(Sender: TObject);
begin
  zakList.Clear;
  invi_zakList.Clear;

  needZak.Clear;
  invi_needZak.Clear;

  Query.RecNo := 1;
end;

procedure Tpotreb.reportClick(Sender: TObject);
var
OQ : TOraQuery;
SQL, uzaks : string;
e, startIndex, insIndex : integer;
FExcel : oleVariant;
begin
  if (needZak.Items.Count = 0) or (invi_needZak.Items.Count = 0) then
  begin
    showMessage('Выберите как минимум 1 заказ!');
    exit;
  end;

  uzaks := '-1';
  for e := 0 to invi_needZak.Items.Count - 1 do
    uzaks := uzaks + ', ' + invi_needZak.Items[e];

  if form1.SCAlive then
    SQL := form1.ServerRequest('DEFICIT_ZAVOD')
  else
    exit;

  SQL := StringReplace(SQL, '<UZAK_ID>', '(' + uzaks + ')', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<TYPE_ELEMS>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<ORDER_FIELD>', 'KOD', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<ORDER_TYPE>', 'ASC', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_MASK>', '(1 = 1)', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<DEFICIT_MASK>', '1 = 1', [rfReplaceAll, rfIgnoreCase]);

  SQL := 'select tronix.full_tree_name(' + char(39) + char(39) + ', src.sprav_id) as ntp, nvl(sp.can_do_self, 0) as MSCH, src.* from ('
  + SQL + ') src, tronix.sprav sp where src.sprav_id = sp.sprav_id(+)';

  //ClipBoard.AsText := SQL;
  //showMessage(SQL);

  OQ := TOraQuery.Create(nil);
  OQ.ReadOnly := true;
  OQ.FetchAll := true;
  OQ.Session := Form1.OraSession1;

  form1.execQuery(OQ, SQL, false);

  FExcel := CreateOleObject('Excel.Application');
  FExcel.Visible := false;
  FExcel.EnableEvents := False;
  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_POTREBNOST.xlsx');

  startIndex := 4;
  insIndex := startIndex;
  while not OQ.Eof do
  begin
    FExcel.Cells[insIndex, 1].NumberFormat := '@';
    FExcel.Cells[insIndex, 1].Value := OQ.FieldByName('KOD').asString;

    FExcel.Cells[insIndex, 2].NumberFormat := '@';
    FExcel.Cells[insIndex, 2].Value := OQ.FieldByName('MTR_NAME').asString;

    FExcel.Cells[insIndex, 3].Value := form9.excelFloat(OQ.FieldByName('POTR').asString);

    FExcel.Cells[insIndex, 4].NumberFormat := '@';
    FExcel.Cells[insIndex, 4].Value := OQ.FieldByName('ED').asString;

    FExcel.Cells[insIndex, 5].Value := form9.excelFloat(OQ.FieldByName('POTR_UCHET').asString);

    FExcel.Cells[insIndex, 6].NumberFormat := '@';
    FExcel.Cells[insIndex, 6].Value := OQ.FieldByName('ED_UCHET').asString;

    FExcel.Cells[insIndex, 7].Value := form9.excelFloat(OQ.FieldByName('ZAPAS_POST').asString);

    FExcel.Cells[insIndex, 8].Value := form9.excelFloat(OQ.FieldByName('ZAPAS_POST_UCHET').asString);

    FExcel.Cells[insIndex, 9].Value := form9.excelFloat(OQ.FieldByName('ZAPAS_POST_SUB').asString);

    FExcel.Cells[insIndex, 10].Value := form9.excelFloat(OQ.FieldByName('ZAPAS_POST_SUB_UCHET').asString);

    FExcel.Cells[insIndex, 11].Value := form9.excelFloat(OQ.FieldByName('DEFICIT').asString);

    FExcel.Cells[insIndex, 12].Value := form9.excelFloat(OQ.FieldByName('DEFICIT_UCHET').asString);

    FExcel.Cells[insIndex, 13].Value := copy(OQ.FieldByName('NTP').asString, 1, (pos('-', OQ.FieldByName('NTP').asString) - 1));
    FExcel.Cells[insIndex, 14].Value := StringReplace(StringReplace(OQ.FieldByName('MSCH').asString, '1', 'Да', [rfReplaceAll, rfIgnoreCase]), '0', 'Нет', [rfReplaceAll, rfIgnoreCase]);

    inc(insIndex);
    OQ.Next;
  end;

  OQ.Close;
  OQ.Free;

  dec(insIndex);
  FExcel.range[FExcel.cells[startIndex, 1], FExcel.cells[insIndex, 14]].borders.linestyle := xlContinuous;
  FExcel.range[FExcel.cells[startIndex, 1], FExcel.cells[insIndex, 14]].HorizontalAlignment := xlCenter;
  FExcel.range[FExcel.cells[startIndex, 1], FExcel.cells[insIndex, 14]].VerticalAlignment := xlCenter;
  FExcel.range[FExcel.cells[startIndex, 1], FExcel.cells[insIndex, 14]].WrapText := true;

  FExcel.Visible := true;
  FExcel := Unassigned;

  //close potreb-form
end;

procedure Tpotreb.zakListClick(Sender: TObject);
begin
  if (zakList.Items.Count = 0) or (invi_zakList.Items.Count = 0) then
    exit;
  
  needZak.Items.Add(zakList.Items[zakList.ItemIndex]);
  invi_needZak.Items.Add(invi_zakList.Items[zakList.ItemIndex]);
end;

end.




