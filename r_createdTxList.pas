unit r_createdTxList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, DBAccess, Ora, GridsEh, DBGridEh, MemDS, StdCtrls,(* clipbrd,*)
  ComCtrls, ComObj, DateUtils, ExcelXP;

type
  Ttx_createdList = class(TForm)
    Query: TOraQuery;
    grid: TDBGridEh;
    DataSource: TOraDataSource;
    up: TButton;
    Label1: TLabel;
    prs: TEdit;
    setpr: TButton;
    zak: TLabel;
    SQuery: TOraQuery;
    dateto: TDateTimePicker;
    Label3: TLabel;
    datefrom: TDateTimePicker;
    tx_types: TComboBox;
    invi_tx_types: TComboBox;
    Label2: TLabel;
    dateFilter: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure upClick(Sender: TObject);
    procedure gridCellClick(Column: TColumnEh);
    procedure gridDblClick(Sender: TObject);
    procedure setprClick(Sender: TObject);
    procedure datefromChange(Sender: TObject);
    procedure prsKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure Start;
    procedure Select(FILTER : string);
  public
    { Public declarations }
  end;

var
  tx_createdList: Ttx_createdList;
  project_id : integer;

implementation

{$R *.dfm}

uses Unit1, Unit9;

procedure Ttx_createdList.Start;
begin
  if (project_id = -1) then
    exit;

  up.enabled := true;
  grid.enabled := true;
  Select('tx.TEXKOMPL_TEXKOMPL_ID IS NULL AND tx.PROJECT_PROJECT_ID = ' + inttostr(project_id));
end;

procedure Ttx_createdList.Select(FILTER : string);
var
SQL : string;
begin
  SQL := 'SELECT (select (CASE WHEN count(*) > 0 THEN ' + char(39) + '+' + char(39) + ' ELSE ' + char(39) + '-' + char(39) + ' END) '
  + 'from tx_texkompl where texkompl_texkompl_id = tx.texkompl_id) as TREE_STATUS, tx.nomer, tx.nsort as n, tx.name, t.name as type, '
  + 'tx.texkompl_id AS ID, tx.TEXKOMPL_TEXKOMPL_ID as UP_ID  FROM '
  + 'TX_TEXKOMPL TX, TX_TYPE_TEX T WHERE tx.type_tex_type_tex_id = t.type_tex_id(+) and ' + FILTER + ' order by tx.nsort ASC, tx.nomer ASC';
  form1.execQuery(Query, SQL, false);
end;

procedure Ttx_createdList.FormShow(Sender: TObject);
var
  SQL : string;
begin
  project_id := -1;
  datefrom.Date := now;
  dateto.Date := now;

  up.enabled := false;
  grid.enabled := false;

  SQL := 'select * from tx_type_Tex order by name desc';
  form1.execQuery(SQuery, SQL, false);

  tx_types.Items.add('');
  invi_tx_types.Items.add('');

  while not SQuery.Eof do
  begin
    tx_types.Items.add(SQuery.FieldByName('NAME').asString);
    invi_tx_types.Items.add(SQuery.FieldByName('TYPE_TEX_ID').asString);

    SQuery.Next;
  end;
end;

procedure Ttx_createdList.upClick(Sender: TObject);
begin
  if (project_id = -1) then
    exit;
    
  if Query.FieldBYName('UP_ID').asString <> '' then
    Select('tx.TEXKOMPL_TEXKOMPL_ID = (SELECT TEXKOMPL_TEXKOMPL_ID FROM TX_TEXKOMPL WHERE TEXKOMPL_ID = ' + Query.FieldBYName('UP_ID').asString + ')');

  if Query.RecordCount = 0 then
    Start;
end;

procedure Ttx_createdList.gridCellClick(Column: TColumnEh);
begin
  if (Column.FieldName = 'TREE_STATUS') then
    if (Query.FieldByName(Column.FieldName).asString = '+') then
      Select('tx.TEXKOMPL_TEXKOMPL_ID = ' + Query.FieldByName('ID').asString);
end;

procedure Ttx_createdList.gridDblClick(Sender: TObject);
var
  SQL, TYPE_FILTER : string;
  FExcel : OleVariant;
  insertIndex, x : integer;
const
  DATE_MASK = char(39) + 'DD.MM.YYYY' + char(39);
  DATE_HHMMSS_MASK = char(39) + 'DD.MM.YYYY HH24:MI:SS' + char(39);
begin
  if (grid.SelectedField.FieldName = 'TREE_STATUS') then
    exit;

  if MessageDlg('Построить список?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  TYPE_FILTER := '(1 = 1)';
  if (tx_types.ItemIndex > 0) then
    TYPE_FILTER := 'tx.TYPE_TEX_TYPE_TEX_ID = ' + invi_tx_types.Items[tx_types.ItemIndex];

  SQL := 'select tx.NOMER as "Номер ПУЕ", tx.NAME as "Наименование", d.NOMER as "Исполнитель", tx.TRUDOEM as "Трудоемкость", t.NAME as "Тип работы", '
  + 'TO_CHAR(i.DAT, ' + DATE_HHMMSS_MASK + ') as "Дата создания", i.FIO as "Автор" from '
  + '(select * from tx_texkompl tx start with tx.texkompl_id = ' + Query.FieldByName('ID').asString + ' '
  + 'connect by prior tx.texkompl_id = tx.texkompl_texkompl_id) tx, tronix.IZM i, tx_type_tex t, kadry_dep d  WHERE ' + TYPE_FILTER + ' AND ';

  if dateFilter.checked then
    SQL := SQL + 'tx.FL_END_BEG between TO_DATE(' + char(39) + datetostr(datefrom.date) + char(39) + ', ' + DATE_MASK + ') AND '
    + 'TO_DATE(' + char(39) + datetostr(incDay(dateto.date, 1)) + char(39) + ', ' + DATE_MASK + ') AND ';

  SQL := SQL + inttostr(PROJECT_ID) + ' = i.ID_PROJECT(+) AND ' + char(39) + 'TEXKOMPL' + char(39) + ' = i.TNAME(+) AND '
  + char(39) + 'I' + char(39) + ' = i.IZM(+) AND tx.texkompl_id = i.ID(+) AND tx.TYPE_TEX_TYPE_TEX_ID = t.TYPE_TEX_ID(+) AND '
  + 'tx.dep_dep_id = d.dep_id(+) order by tx.nomer';

  form1.execQuery(SQuery, SQL, false);

  FExcel := CreateOleObject('Excel.Application');
  FExcel.Workbooks.Add;
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.WorkSheets[1].Select;
  FExcel.WorkSheets[2].Delete;
  FExcel.WorkSheets[2].Delete;

  insertIndex := 1;
  for x := 0 to (SQuery.Fields.Count - 1) do
    FExcel.Cells[insertIndex, (x + 1)].Value := SQuery.Fields[x].FieldName;
  inc(insertIndex);

  SQuery.First;
  while not SQuery.Eof do
  begin
    for x := 1 to SQuery.Fields.Count do
    begin

      if (SQuery.Fields[(x - 1)].FieldName = 'Трудоемкость') then
      begin
        FExcel.Cells[insertIndex, x].Value := form9.excelFloat(SQuery.FieldByName(SQuery.Fields[(x - 1)].FieldName).asString);
        continue;
      end;

      FExcel.Cells[insertIndex, x].NumberFormat := '@';
      FExcel.Cells[insertIndex, x].Value := SQuery.FieldByName(SQuery.Fields[(x - 1)].FieldName).asString;

    end;

    SQuery.Next;
    inc(insertIndex);
  end;

  FExcel.Range[FExcel.Cells[1, 1], FExcel.Cells[1, SQuery.Fields.Count]].Font.Size := 15;
  FExcel.Range[FExcel.Cells[1, 1], FExcel.Cells[1, SQuery.Fields.Count]].Font.Bold := true;
  FExcel.Range[FExcel.Cells[1, 1], FExcel.Cells[(insertIndex - 1), SQuery.Fields.Count]].borders.linestyle := xlContinuous;
  FExcel.Range[FExcel.Cells[1, 1], FExcel.Cells[(insertIndex - 1), SQuery.Fields.Count]].Columns.AutoFit;

  FExcel.Visible := true;
  FExcel := Unassigned;

end;

procedure Ttx_createdList.setprClick(Sender: TObject);
var
SQL : string;
begin
  if (length(prs.Text) < 2) then
    exit;

  SQL := 'SELECT PROJECT_ID, NAME FROM TRONIX.PROJECT_LIST WHERE NAME LIKE ' + char(39) + '%' + prs.Text + '%' + char(39) +  ' AND ROWNUM = 1';
  form1.execQuery(SQuery, SQL, false);

  if (SQuery.RecordCount = 0) then
  begin
    showMessage('Заказ не найден!');
    exit;
  end;

  PROJECT_ID := SQuery.FieldByName('PROJECT_ID').asInteger;
  zak.Caption := SQuery.FieldByName('NAME').asString;

  Start;
end;                     

procedure Ttx_createdList.datefromChange(Sender: TObject);
begin
  dateto.Date := Datefrom.Date;
end;

procedure Ttx_createdList.prsKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
    setPr.Click;
end;

end.
