unit r_ttns;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, GridsEh, DBGridEh, DB, MemDS, DBAccess, Ora, StdCtrls, DBClient, midaslib,
  Buttons;

type
  Tdefttns = class(TForm)

  OraDataSource1: TOraDataSource;
  DBGridEh1: TDBGridEh;
  filters: TButton;
  dataBuffer: TClientDataSet;
  fSwap: TButton;
  OraQueryS: TOraQuery;
  OraInsertQuery: TOraQuery;
  chkall: TCheckBox;
  eAbs: TButton;
  clear: TBitBtn;
  
  procedure FormShow(Sender: TObject);
  procedure DBGridEh1DblClick(Sender: TObject);
  procedure filtersClick(Sender: TObject);
  procedure fSwapClick(Sender: TObject);
  procedure FormCreate(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  procedure dataBufferAfterEdit(DataSet: TDataSet);
  procedure chkallClick(Sender: TObject);
  procedure eAbsClick(Sender: TObject);
  procedure clearClick(Sender: TObject);

private
  { Private declarations }
  procedure SelectTTNs;

public
  { Public declarations }
  fBuffer_KOD, fBuffer_VYD, fBuffer_DOC, fBuffer_SKLAD, fBuffer_CEH, fBuffer_PUE, fBuffer_CHERT, fBuffer_UPE : string;
  NEED_UPDATE : boolean;

end;

var
  defttns: Tdefttns;

implementation

{$R *.dfm}

uses Unit1, Unit9, r_ttns_filters, ComObj, ExcelXP;

procedure Tdefttns.FormShow(Sender: TObject);
begin
  SelectTTNs;
end;

procedure Tdefttns.SelectTTNs;

const
  FIELDS_SIZE = 28;
  TTN_TYPE_ARRAY = '43, 44, 26, 59, 11';

var
  fields : array [1..FIELDS_SIZE] of string;
  SQL : string;
  x : integer;

begin
  (* FIELDS *)

  fields[1] := 'FNAME';
  fields[2] := 'SNAME';
  fields[3] := 'KOD';
  fields[4] := 'VYD';
  fields[5] := 'NOMER';
  fields[6] := 'TYPE';
  fields[7] := 'SKLAD';
  fields[8] := 'CEH';
  fields[9] := 'KOL';
  fields[10] := 'KOL_UCHET';
  fields[11] := 'DATEC';
  fields[12] := 'DATE1';
  fields[13] := 'DATE2';
  fields[14] := 'DATE4';
  fields[15] := 'DATE3';
  fields[16] := 'PUE';
  fields[17] := 'CHERT';
  fields[18] := 'UPE';
  fields[19] := 'CHK_FLD';

  fields[20] := 'KOD_ID';
  fields[21] := 'VYD_ID';
  fields[22] := 'TTN_ID';
  fields[23] := 'TYPE_TTN_ID';
  fields[24] := 'CEH_ID';
  fields[25] := 'SKLAD_ID';
  fields[26] := 'TEXKOMPL_ID';
  fields[27] := 'DOCUMENT_ID';
  fields[28] := 'UZAK_ID';

  (* FIELDS *)

  if not form1.SCAlive then
    exit;
  SQL := form1.ServerRequest('DEFICIT_TTNS');

  SQL := StringReplace(SQL, '<UZAK_ID>', form9.Label2.Caption, [rfReplaceAll, rfIgnoreCase]);
  //SQL := StringReplace(SQL, '<UZAK_ID>', '9628, 9630, 9632', [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<TTN_TYPE_ARRAY>', TTN_TYPE_ARRAY, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_KOD>', fBuffer_KOD, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_VYD>', fBuffer_VYD, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_DOC>', fBuffer_DOC, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_SKLAD>', fBuffer_SKLAD, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_CEH>', fBuffer_CEH, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_PUE>', fBuffer_PUE, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_CHERT>', fBuffer_CHERT, [rfReplaceAll, rfIgnoreCase]);
  SQL := StringReplace(SQL, '<FILTER_UPE>', fBuffer_UPE, [rfReplaceAll, rfIgnoreCase]);
  //showmessage(SQL);

  if not form1.execQuery(OraQueryS, SQL, false) then
    exit;

  if not dataBuffer.Active then
    dataBuffer.CreateDataSet
  else
    while not dataBuffer.isEmpty do
      dataBuffer.Delete;

  DbGridEh1.DataSource.DataSet.First;
  DbGridEh1.DataSource.DataSet.DisableControls;
  //dataset.loadfrom query...

  while not OraQueryS.Eof do
  begin

    DBGridEh1.DataSource.DataSet.Append;
    for x := 1 to FIELDS_SIZE do
      DBGridEh1.DataSource.DataSet.FieldByName(fields[x]).Value := OraQueryS.FieldByName(fields[x]).asString;

    DBGridEh1.DataSource.DataSet.Next;
    OraQueryS.Next;

  end;

  DbGridEh1.DataSource.DataSet.EnableControls;
  DBGridEh1.DataSource.DataSet.First;

  //TXK.TEXKOMPL_ID as TEXKOMPL_ID, SPRAVA.SPRAV_ID as KOD_ID, SPRAVO.SPRAV_ID as VYD_ID,
  //TN.TTN_ID, TN.TYPE_TTN_ID, DPO.DEP_ID as CEH_ID, DPP.DEP_ID as SKLAD_ID, DCG.DOCUMENT_ID

  //save only after changing; loop: (delete where params -> insert new)

end;

procedure Tdefttns.DBGridEh1DblClick(Sender: TObject);
begin
  exit;
  //showmessage(DBGrideh1.DataSource.DataSet.FieldByName('CHK_FLD').asString);
  //showmessage(DBGrideh1.DataSource.DataSet.FieldByName('FNAME').asString);
  //showmessage(DBGrideh1.DataSource.DataSet.FieldByName('SNAME').asString);
  with DBGridEh1.DataSource.DataSet do
  begin
    showmessage(FieldByName('UZAK_ID').asString);

    showmessage(FieldByName('KOD_ID').asString);
    showmessage(FieldByName('VYD_ID').asString);
    showmessage(FieldByName('TTN_ID').asString);
    showmessage(FieldByName('TYPE_TTN_ID').asString);
    showmessage(FieldByName('CEH_ID').asString);
    showmessage(FieldByName('SKLAD_ID').asString);
    showmessage(FieldByName('TEXKOMPL_ID').asString);
    showmessage(FieldByName('DOCUMENT_ID').asString);
  end;
end;

procedure Tdefttns.filtersClick(Sender: TObject);
begin
  NEED_UPDATE := false;

  defttns_fltrs.Showmodal();

  if NEED_UPDATE then
    SelectTTNs;
    
end;

procedure Tdefttns.fSwapClick(Sender: TObject);
begin

  if DBGridEh1.Columns[0].FieldName = 'KOD' then
  begin
    with DBGridEh1.Columns[0] do
    begin
      FieldName := 'FNAME';
      Font.Style := Font.Style - [fsBold];
      Alignment := taLeftJustify;
      LayOut := tlTop;
    end;

    with DBGridEh1.Columns[1] do
    begin
      FieldName := 'FNAME';
      Font.Style := Font.Style - [fsBold];
      Alignment := taLeftJustify;
      LayOut := tlTop;
    end;

    fSwap.Caption := 'КОДЫ';

    exit;
  end;

  with DBGridEh1.Columns[0] do
  begin
    FieldName := 'KOD';
    Font.Style := Font.Style + [fsBold];
    Alignment := taCenter;
    LayOut := tlCenter;
  end;

  with DBGridEh1.Columns[1] do
  begin
    FieldName := 'VYD';
    Font.Style := Font.Style + [fsBold];
    Alignment := taCenter;
    LayOut := tlCenter;
  end;

  fSwap.Caption := 'НАИМЕНОВАНИЕ';

end;

procedure Tdefttns.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdefttns_fltrs, defttns_fltrs);
   
  fBuffer_KOD := '(1 = 1)';
  fBuffer_VYD := '(1 = 1)';
  fBuffer_DOC := '(1 = 1)';
  fBuffer_CEH := '(1 = 1)';
  fBuffer_SKLAD := '(1 = 1)';
  fBuffer_PUE := '(1 = 1)';
  fBuffer_CHERT := '(1 = 1)';
  fBuffer_UPE := '(1 = 1)';
end;

procedure Tdefttns.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  defttns_fltrs.Free;
end;

procedure Tdefttns.dataBufferAfterEdit(DataSet: TDataSet);
var OLD_CHK_FLD, NEW_CHK_FLD, SQL : string;
begin
  //DELETE CHK_FLD FROM STORE_TABLE

  OLD_CHK_FLD := DBGridEh1.DataSource.DataSet.fieldByName('CHK_FLD').asString;

  if OLD_CHK_FLD = '1' then
    NEW_CHK_FLD := '0'
  else
    NEW_CHK_FLD := '1';

  with DBGridEh1.DataSource.DataSet do
  begin
    SQL := 'DELETE FROM TRONIX.DEFICIT_MAIN_NOMEN WHERE'
    + ' KOD_ID = ' + char(39) + fieldByName('KOD_ID').asString + char(39) + ' AND VYD_ID = ' + char(39) + fieldByName('VYD_ID').asString + char(39)
    + ' AND TTN_ID = ' + char(39) + fieldByName('TTN_ID').asString + char(39) + ' AND TYPE_TTN_ID = ' + char(39) + fieldByName('TYPE_TTN_ID').asString + char(39)
    + ' AND TEXKOMPL_ID = ' + char(39) + fieldByName('TEXKOMPL_ID').asString + char(39) + ' AND DOCUMENT_ID = ' + char(39) + fieldByName('DOCUMENT_ID').asString + char(39)
    + ' AND CEH_ID = ' + char(39) + fieldByName('CEH_ID').asString + char(39) + ' AND UZAK_ID = ' + char(39) + fieldByName('UZAK_ID').asString + char(39);
  end;

  //showmessage(SQL);
  form1.execQuery(OraInsertQuery, SQL, true);

  if NEW_CHK_FLD = '1' then
  begin
    with DBGridEh1.DataSource.DataSet do
    begin
      SQL := 'INSERT INTO TRONIX.DEFICIT_MAIN_NOMEN (KOD_ID, VYD_ID, TTN_ID, TYPE_TTN_ID, TEXKOMPL_ID, DOCUMENT_ID, CHK_FLD, UZAK_ID, CEH_ID) '
      + 'VALUES (' + char(39) + fieldByName('KOD_ID').asString + char(39) + ', ' + char(39) + fieldByName('VYD_ID').asString + char(39) + ', '
      + char(39) + fieldByName('TTN_ID').asString + char(39) + ', ' + char(39) + fieldByName('TYPE_TTN_ID').asString + char(39) + ', '
      + char(39) + fieldByName('TEXKOMPL_ID').asString + char(39) + ', ' + char(39) + fieldByName('DOCUMENT_ID').asString + char(39) + ', '
      + char(39) + '1'(*NEW_CHK_FLD*) + char(39) + ', ' + char(39) + fieldByName('UZAK_ID').asString + char(39) + ', '
      + char(39) + fieldByName('CEH_ID').asString + char(39) + ')';
    end;

    //showmessage(SQL);
    form1.execQuery(OraInsertQuery, SQL, true);

  end;

  (*
  DBGridEh1.DataSource.DataSet.Next;
  if DBGridEh1.DataSource.DataSet.Eof then
  begin;
    DBGridEh1.DataSource.DataSet.Prev;
    DBGridEh1.DataSource.DataSet.Prev;
  end;
  *)

  //DBGridEh1.Refresh;
  //dataBuffer.ApplyUpdates(-1);
  //DBGridEh1.DataSource.DataSet.FieldByName('UPE').FocusControl;

end;


procedure Tdefttns.chkallClick(Sender: TObject);
var
newCheck, newCheckStr : string;
changedCount : integer;
begin

  changedCount := 0;

  if not chkall.Checked then
  begin
    newCheck := '0';
    newCheckStr := 'СНЯТЬ';
  end
  else
  begin
    newCheck := '1';
    newCheckStr := 'ПОСТАВИТЬ';
  end;

  if MessageDlg('Вы действительно хотите ' + newCheckStr + ' отметку "ОН" для всей выбранной номенклатуры?', mtConfirmation, [mbYes, mbNo], 0) = mrNo then
    exit;

  DbGridEh1.DataSource.DataSet.First;
  DbGridEh1.DataSource.DataSet.DisableControls;

  while true do
  begin
    if DBGridEh1.DataSource.DataSet.Eof then
      break;

    if DBGridEh1.DataSource.DataSet.FieldByName('CHK_FLD').asString <> newCheck then
    begin
      DBGridEh1.DataSource.DataSet.Edit;
      DBGridEh1.DataSource.DataSet.FieldByName('CHK_FLD').Value := newCheck;

      inc(changedCount);
    end;

    DBGridEh1.DataSource.DataSet.Next;
  end;

  DbGridEh1.DataSource.DataSet.EnableControls;
  DBGridEh1.DataSource.DataSet.First;

  showmessage('Статус "ОСНОВНАЯ НОМЕНКЛАТУРА" изменен у ' + inttostr(changedCount) + ' позиций!');

  SelectTTNs;
end;

procedure Tdefttns.eAbsClick(Sender: TObject);
var
SQL : string;
FExcel, Sheet : OleVariant;
startNum, strNum : integer;
begin

  SQL := 'SELECT z.zak, c.nomer, afull.full, afull.omto, round(decode(afull.omto, 0, 0, ((afull.omto / afull.full) * 100)), 0) as OMTO_percent, '
  + 'afull.USH, round(decode(afull.ush, 0, 0, ((afull.ush / afull.full) * 100)), 0) as USH_percent from (SELECT ttn.DEP_DEP_ID_TO as CEH, '
  + 'ttn.UZAK_UZAK_ID as UZAK_ID, count(mn.TTN_ID) as full, sum(decode(ttn.user_date2, null, 0, 1)) as OMTO, sum(decode(ttn.date_ins, null, 0, 1)) as USH '
  + 'from (select src.TTN_ID from TRONIX.DEFICIT_MAIN_NOMEN src WHERE src.CHK_FLD = ' + char(39) + '1' + char(39) + ' GROUP BY src.TTN_ID) mn, '
  + 'TRONIX.TTN ttn WHERE mn.TTN_ID = ttn.TTN_ID(+) group by ttn.DEP_DEP_ID_TO, ttn.UZAK_UZAK_ID) afull, kadry_dep c, tronix.zakaz z '
  + 'where afull.ceh = c.dep_id(+) and afull.uzak_id = z.nn(+)';

  form1.execQuery(OraInsertQuery, SQL, false);
  if OraInsertQuery.RecordCount < 1 then
    exit
  else
    OraInsertQuery.First;

  FExcel := CreateOleObject('Excel.Application');
  FExcel.EnableEvents := False;
  FExcel.Visible := false;

  FExcel.Workbooks.Add('\\Ser1\s1sys2\PROG\FOX_WIN\SHABLON_MAINTTNS.xlsx');
  FExcel.Workbooks[1].WorkSheets[1].Name := 'Основная номенклатура';
  Sheet:=FExcel.Workbooks[1].WorkSheets['Основная номенклатура'];

  startNum := 4;
  strNum := startNum;
  
  while not OraInsertQuery.Eof do
  begin
    Sheet.Range[Sheet.Cells[strNum, 1], Sheet.Cells[strNum, 18]].Font.Size := 14;
    Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 18]].borders.linestyle := xlContinuous;

    Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 2]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 3], Sheet.cells[strNum, 4]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 5], Sheet.cells[strNum, 6]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 7], Sheet.cells[strNum, 9]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 10], Sheet.cells[strNum, 12]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 13], Sheet.cells[strNum, 15]].MergeCells := true;
    Sheet.range[Sheet.cells[strNum, 16], Sheet.cells[strNum, 18]].MergeCells := true;

    //CEH
    Sheet.Cells[strNum, 1].Value := OraInsertQuery.FieldByName('NOMER').asString;
    Sheet.Cells[strNum, 1].WrapText := true;
    Sheet.Cells[strNum, 1].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;

    //Zakaz
    Sheet.Cells[strNum, 3].Value := OraInsertQuery.FieldByName('ZAK').asString;
    Sheet.Cells[strNum, 3].WrapText := true;
    Sheet.Cells[strNum, 3].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 3].VerticalAlignment := xlCenter;

    //Vsego documentov
    Sheet.Cells[strNum, 5].Value := OraInsertQuery.FieldByName('FULL').asString;
    Sheet.Cells[strNum, 5].WrapText := true;
    Sheet.Cells[strNum, 5].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 5].VerticalAlignment := xlCenter;

    //Vypolneno snabjeniem
    Sheet.Cells[strNum, 7].Value := OraInsertQuery.FieldByName('OMTO').asString;
    Sheet.Cells[strNum, 7].WrapText := true;
    Sheet.Cells[strNum, 7].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 7].VerticalAlignment := xlCenter;

    //v procentah  /\
    Sheet.Cells[strNum, 10].Value := OraInsertQuery.FieldByName('OMTO_PERCENT').asString;
    Sheet.Cells[strNum, 10].WrapText := true;
    Sheet.Cells[strNum, 10].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 10].VerticalAlignment := xlCenter;

    //Vypolneno USH (zakryto)
    Sheet.Cells[strNum, 13].Value := OraInsertQuery.FieldByName('USH').asString;
    Sheet.Cells[strNum, 13].WrapText := true;
    Sheet.Cells[strNum, 13].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 13].VerticalAlignment := xlCenter;

    //v procentah /\
    Sheet.Cells[strNum, 16].Value := OraInsertQuery.FieldByName('USH_PERCENT').asString;
    Sheet.Cells[strNum, 16].WrapText := true;
    Sheet.Cells[strNum, 16].HorizontalAlignment := xlCenter;
    Sheet.Cells[strNum, 16].VerticalAlignment := xlCenter;

    inc(strNum);
    OraInsertQuery.Next;
  end;

  inc(strNum);

  Sheet.Range[Sheet.Cells[strNum, 5], Sheet.Cells[strNum, 18]].Font.Size := 16;
  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 18]].borders.linestyle := xlContinuous;

  Sheet.range[Sheet.cells[strNum, 1], Sheet.cells[strNum, 4]].MergeCells := true;
  Sheet.range[Sheet.cells[strNum, 5], Sheet.cells[strNum, 6]].MergeCells := true;
  Sheet.range[Sheet.cells[strNum, 7], Sheet.cells[strNum, 9]].MergeCells := true;
  Sheet.range[Sheet.cells[strNum, 10], Sheet.cells[strNum, 12]].MergeCells := true;
  Sheet.range[Sheet.cells[strNum, 13], Sheet.cells[strNum, 15]].MergeCells := true;
  Sheet.range[Sheet.cells[strNum, 16], Sheet.cells[strNum, 18]].MergeCells := true;

  Sheet.Cells[strNum, 1].Font.Bold := True;
  Sheet.Cells[strNum, 1].Font.Size := 16;
  Sheet.Cells[strNum, 1].NumberFormat := '@';
  Sheet.Cells[strNum, 1].Value := 'ИТОГО: ';
  Sheet.Cells[strNum, 1].HorizontalAlignment := xlRight;
  Sheet.Cells[strNum, 1].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 5].NumberFormat := '';
  Sheet.Cells[strNum, 5].Formula := '=SUM(E' + inttostr(startNum) + ':E' + inttostr((strNum - 2)) + ')';
  Sheet.Cells[strNum, 5].HorizontalAlignment := xlCenter;
  Sheet.Cells[strNum, 5].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 7].NumberFormat := '';
  Sheet.Cells[strNum, 7].Formula := '=SUM(G' + inttostr(startNum) + ':G' + inttostr((strNum - 2)) + ')';
  Sheet.Cells[strNum, 7].HorizontalAlignment := xlCenter;
  Sheet.Cells[strNum, 7].VerticalAlignment := xlCenter;

  Sheet.Cells[strNum, 13].NumberFormat := '';
  Sheet.Cells[strNum, 13].Formula := '=SUM(M' + inttostr(startNum) + ':M' + inttostr((strNum - 2)) + ')';
  Sheet.Cells[strNum, 13].HorizontalAlignment := xlCenter;
  Sheet.Cells[strNum, 13].VerticalAlignment := xlCenter;

  OraInsertQuery.Close;
  FExcel.Visible := true;
end;

procedure Tdefttns.clearClick(Sender: TObject);
var password, takepw, SQL : string;
begin
  if not form1.SCAlive then
    exit;

  password := form1.ServerRequest('[PASS]MAIN_NOMEN_CLEAR');

  takepw := InputBox('ДОСТУП', 'Введите пароль для данной операции', '');
  if takepw = '' then
  begin
    showmessage('ПОЛЕ НЕ ЗАПОЛНЕНО. Введите пароль!');
    exit;
  end;

  if takepw = password then
  begin
    SQL := 'DELETE FROM TRONIX.DEFICIT_MAIN_NOMEN';
    form1.execQuery(OraInsertQuery, SQL, true);

    showmessage('Основная номенклатура очищена!');
    SelectTTNs;

  end
  else
    showmessage('Неверный пароль! Обратитесь в АСУ');
end;

end.
